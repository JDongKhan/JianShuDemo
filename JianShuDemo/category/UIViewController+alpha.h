//
//  UIViewController+alpha.h
//  JianShuDemo
//
//  Created by 王金东 on 2016/7/18.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (alpha)
@property (nonatomic,assign) CGFloat navigationBarAlpha;
@end


@interface UINavigationController (alpha)<UINavigationBarDelegate, UINavigationControllerDelegate>
@end

