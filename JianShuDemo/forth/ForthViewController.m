//
//  ForthViewController.m
//  JianShuDemo
//
//  Created by 王金东 on 2016/7/18.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import "ForthViewController.h"
#import <SMTableView/UITableView+simplify.h>

@interface ForthViewController ()<UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    [self.view addSubview:self.tableView];
    NSArray *constraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    
    [self.view addConstraints:constraints1];
    [self.view addConstraints:constraints2];
    
    
    UIView *headView = [[NSBundle mainBundle] loadNibNamed:@"MessageHeadView" owner:nil options:nil].firstObject;
    headView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 170);
    self.tableView.tableHeaderView = headView;
    
    
    self.tableView.enableSimplify = YES;
    self.tableView.tableViewCellStyle = UITableViewCellStyleSubtitle;
    self.tableView.dataSource = WeakenType(self);
    self.tableView.delegate = WeakenType(self);
    self.tableView.keyOfHeadTitle = @"title";
    self.tableView.itemsArray = @[
                                  @{
                                      @"title" : @"简信",
                                      @"items" : @[
                                              @{
                                                  @"image" : @"logo_notification",
                                                  @"title" : @"简宝玉",
                                                  @"detail" : @"欢迎加入丰富多彩的原创内容社区--简书。有任何问题不要联系我！"
                                                  
                                                  }
                                              ]
                                      }
                                  
                                  
                                  ].mutableCopy;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.sectionable = YES;
    }
    return _tableView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
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
