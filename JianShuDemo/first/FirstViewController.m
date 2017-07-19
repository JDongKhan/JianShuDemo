//
//  FirstViewController.m
//  JianShuDemo
//
//  Created by 王金东 on 2017/7/18.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import "FirstViewController.h"
#import <SMTableView/UITableView+simplify.h>
#import "DataUtils.h"

@interface FirstViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.extendedLayoutIncludesOpaqueBars = NO;
//    self.automaticallyAdjustsScrollViewInsets = YES;
//    self.modalPresentationCapturesStatusBarAppearance = NO;
//    
    self.navigationItem.title = @"推荐关注";
    
    self.tableView.enableSimplify = YES;
    self.tableView.dataSource  = WeakenType(self);
    self.tableView.delegate = WeakenType(self);
    
    self.tableView.tableViewCellClass = [UINib nibWithNibName:@"FirstTableViewCell" bundle:nil];
    self.tableView.autoLayout = YES;
    
    
    
    [self loadData];
    
    
    UIView *headView = [[NSBundle mainBundle] loadNibNamed:@"FirstHeadTableView" owner:nil options:nil].firstObject;
    //[[UINib nibWithNibName:@"FirstHeadTableView" bundle:nil] instantiateWithOwner:nil options:nil].firstObject;
    headView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 100);
    self.tableView.tableHeaderView = headView;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loadData {
    NSDictionary *dic = [DataUtils dataFromJsonFile:@"first.json"];
    NSArray *items = dic[@"items"];
    self.tableView.itemsArray = items.mutableCopy;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
