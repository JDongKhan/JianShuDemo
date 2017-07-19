//
//  FifthViewController.m
//  JianShuDemo
//
//  Created by 王金东 on 2016/7/18.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import "FifthViewController.h"
#import <SMTableView/UITableView+simplify.h>
#import "SMBaseTableViewCellStyle.h"

#import <SMTableView/UITableViewCell+simplify.h>
#import "UIViewController+alpha.h"
#import "FifthAndFirstViewController.h"

@interface FifthViewController ()<UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    
    [self.view addSubview:self.tableView];
    NSArray *constraints1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_tableView)];
    
    [self.view addConstraints:constraints1];
    [self.view addConstraints:constraints2];
    
    self.navigationBarAlpha = 0;
    
    
    UIView *headView = [[NSBundle mainBundle] loadNibNamed:@"FifthHeadTableView" owner:nil options:nil].firstObject;
    headView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 140);
    self.tableView.tableHeaderView = headView;
    
    
    self.tableView.enableSimplify = YES;
    self.tableView.clearsSelectionDelay = YES;
    self.tableView.dataSource = WeakenType(self);
    self.tableView.delegate = WeakenType(self);
    self.tableView.tableViewCellClass  = [SMBaseTableViewCellStyleValue1TextGray class];
    
    __weak typeof(self) __weakSelf = self;
    self.tableView.itemsArray = @[
                                  @{
                                      @"section" : @"0",
                                      @"items" : @[
                                              @{
                                                  SMCellKeyForImageView : @"icon_password",
                                                  SMCellKeyForTitleView : @"私密文章",
                                                  SMCellKeyForDetailView : @"3",
                                                  SMCellKeySelectedBlock :^(){
                                                      [__weakSelf.navigationController pushViewController:[[FifthAndFirstViewController alloc] init] animated:YES];
                                                  }
                                                  },
                                              @{
                                                  SMCellKeyForImageView : @"grzy_icon_mark",
                                                  SMCellKeyForTitleView : @"收藏的文章",
                                                  SMCellKeyForDetailView : @"0"
                                                  },
                                              @{
                                                  SMCellKeyForImageView : @"grzy_icon_like_normal",
                                                  SMCellKeyForTitleView : @"喜欢的文章",
                                                  SMCellKeyForDetailView : @"3"
                                                  },
                                              @{
                                                  SMCellKeyForImageView : @"icon_mine_topic_gray",
                                                  SMCellKeyForTitleView : @"我的专题",
                                                  SMCellKeyForDetailView : @"3"
                                                  },
                                              @{
                                                  SMCellKeyForImageView : @"icon_mine_book_gray",
                                                  SMCellKeyForTitleView : @"我的文章",
                                                  SMCellKeyForDetailView : @"3"
                                                  },
                                              @{
                                                  SMCellKeyForImageView : @"icon_follow",
                                                  SMCellKeyForTitleView : @"关注的专题/文集",
                                                  SMCellKeyForDetailView : @"3"
                                                  }
                                              
                                              ]
                                      
                                      },
                                  @{
                                      @"section" : @"0",
                                      @"items" : @[
                                              @{
                                                  SMCellKeyForImageView : @"grzy_icon_night",
                                                  SMCellKeyForTitleView : @"夜间模式",
                                                  SMCellKeyForDetailView : @"",
                                                  SMCellKeyAccessoryView : [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 50)]
                                                  },
                                              @{
                                                  SMCellKeyForImageView : @"icon_history",
                                                  SMCellKeyForTitleView : @"浏览历史",
                                                  SMCellKeyForDetailView : @""
                                                  }
                                              ]
                                    },
                                  
                                  @{
                                      @"section" : @"0",
                                      @"items" : @[
                                              @{
                                                  SMCellKeyForImageView : @"",
                                                  SMCellKeyForTitleView : @"分享简书App",
                                                  SMCellKeyForDetailView : @""
                                                  },
                                              @{
                                                  SMCellKeyForImageView : @"",
                                                  SMCellKeyForTitleView : @"帮助与反馈",
                                                  SMCellKeyForDetailView : @""
                                                  },
                                              @{
                                                  SMCellKeyForImageView : @"",
                                                  SMCellKeyForTitleView : @"给简书评分",
                                                  SMCellKeyForDetailView : @""
                                                  }
                                              ]
                                      }
                                  
                                  ].mutableCopy;
    
    
    
    // Do any additional setup after loading the view.
}
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellAccessoryDisclosureIndicator;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 18;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(scrollView.contentOffset.y < -20){
        self.navigationBarAlpha = 0;
    }else{
        self.navigationBarAlpha = 1;
    }
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.translatesAutoresizingMaskIntoConstraints = NO;
        _tableView.sectionable = YES;
    }
    return _tableView;
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
