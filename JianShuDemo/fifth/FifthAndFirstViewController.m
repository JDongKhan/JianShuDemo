//
//  FifthAndFirstViewController.m
//  JianShuDemo
//
//  Created by 王金东 on 2017/7/18.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import "FifthAndFirstViewController.h"
#import "UINavigationController+alpha.h"

@interface FifthAndFirstViewController ()

@end

@implementation FifthAndFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationBarAlpha = 1;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
