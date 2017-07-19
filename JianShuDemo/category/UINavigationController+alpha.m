//
//  UINavigationController+alpha.m
//  JianShuDemo
//
//  Created by 王金东 on 2016/7/18.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import "UINavigationController+alpha.h"
#import <objc/runtime.h>

@implementation UINavigationController (alpha)

+ (void)load {
    if (self == [UINavigationController class]) {
        SEL originalSelector = NSSelectorFromString(@"_updateInteractiveTransition:");
        SEL swizzledSelector = NSSelectorFromString(@"jd_updateInteractiveTransition:");
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
// 交换的方法，监控滑动手势
- (void)jd_updateInteractiveTransition:(CGFloat)percentComplete {
    [self jd_updateInteractiveTransition:(percentComplete)];
    UIViewController *topVC = self.topViewController;
    if (topVC != nil) {
        id<UIViewControllerTransitionCoordinator> coor = topVC.transitionCoordinator;
        if (coor != nil) {
            // 随着滑动的过程设置导航栏透明度渐变
            UIViewController *fromVC = [coor viewControllerForKey:UITransitionContextFromViewControllerKey];
            UIViewController *toVC =  [coor viewControllerForKey:UITransitionContextToViewControllerKey];
            CGFloat fromAlpha = fromVC.navigationBarAlpha;
            CGFloat toAlpha = toVC.navigationBarAlpha;
            CGFloat nowAlpha = fromAlpha + (toAlpha - fromAlpha) * percentComplete;
            [self setNavigationViewBackground:nowAlpha];
        }
    }
}


// 设置导航栏背景透明度
- (void)setNavigationViewBackground:(CGFloat)alpha {
    //_UIBarBackground
    UIView *_barBackgroundView = [[self.navigationBar subviews] objectAtIndex:0];
    //UIImageView
    UIImageView *_backgroundImageView = [[_barBackgroundView subviews] objectAtIndex:0];
    if (self.navigationBar.isTranslucent) {
        if (_backgroundImageView != nil && _backgroundImageView.image != nil) {
            _barBackgroundView.alpha = alpha;
        } else {
            UIView *backgroundEffectView = [[_barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
            if (backgroundEffectView != nil) {
                backgroundEffectView.alpha = alpha;
            }
        }
    } else {
        _barBackgroundView.alpha = alpha;
    }
    
    // 对导航栏下面那条线做处理
    self.navigationBar.clipsToBounds = alpha == 0.0;
}



#pragma mark --------------------- UINavigationController Delegate---------------------
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController *topVC = self.topViewController;
    if (topVC != nil) {
        id<UIViewControllerTransitionCoordinator> coor = topVC.transitionCoordinator;
        if (coor != nil) {
            [coor notifyWhenInteractionChangesUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext> context){
                [self dealInteractionChanges:context];
            }];
        }
    }
}

- (void)dealInteractionChanges:(id<UIViewControllerTransitionCoordinatorContext>)context {
    if ([context isCancelled]) {// 自动取消了返回手势
        NSTimeInterval cancelDuration = [context transitionDuration] * (double)[context percentComplete];
        [UIView animateWithDuration:cancelDuration animations:^{
            CGFloat nowAlpha = [context viewControllerForKey:UITransitionContextFromViewControllerKey].navigationBarAlpha;
            NSLog(@"自动取消返回到alpha：%f", nowAlpha);
            [self setNavigationViewBackground:nowAlpha];
        }];
    } else {// 自动完成了返回手势
        NSTimeInterval finishDuration = [context transitionDuration] * (double)(1 - [context percentComplete]);
        [UIView animateWithDuration:finishDuration animations:^{
            CGFloat nowAlpha = [context viewControllerForKey:
                                 UITransitionContextToViewControllerKey].navigationBarAlpha;
            NSLog(@"自动完成返回到alpha：%f", nowAlpha);
            [self setNavigationViewBackground:nowAlpha];
        }];
    }
}


#pragma mark - UINavigationBar Delegate
- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item {
    if (self.viewControllers.count >= navigationBar.items.count) {// 点击返回按钮
        UIViewController *popToVC = self.viewControllers[self.viewControllers.count - 1];
        [self setNavigationViewBackground:popToVC.navigationBarAlpha];
        //[self popViewControllerAnimated:YES];
    }
}

- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item {
    // push到一个新界面
    [self setNavigationViewBackground:self.topViewController.navigationBarAlpha];
}



@end



@implementation UIViewController (alpha)

- (void)setNavigationBarAlpha:(CGFloat )navigationBarAlpha {
    objc_setAssociatedObject(self, @selector(navigationBarAlpha), @(navigationBarAlpha), OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self.navigationController setNavigationViewBackground:navigationBarAlpha];
}
- (CGFloat)navigationBarAlpha {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
@end
