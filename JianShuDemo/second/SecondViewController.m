//
//  SecondViewController.m
//  JianShuDemo
//
//  Created by 王金东 on 2016/7/18.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import "SecondViewController.h"
#import <SMTableView/UITableView+simplify.h>
#import "DataUtils.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.enableSimplify = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableViewCellClass = [UINib nibWithNibName:@"SecondTableViewCell" bundle:nil];
    self.tableView.autoLayout = YES;
    [self loadData];
    // Do any additional setup after loading the view.
}


- (void)loadData {
    NSDictionary *dic = [DataUtils dataFromJsonFile:@"second.json"];
    NSArray *items = dic[@"items"];
    self.tableView.itemsArray = items.mutableCopy;
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
