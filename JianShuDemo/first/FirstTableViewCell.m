//
//  FirstTableViewCell.m
//  JianShuDemo
//
//  Created by 王金东 on 2016/7/18.
//  Copyright © 2016年 王金东. All rights reserved.
//

#import "FirstTableViewCell.h"
#import <SMTableView/UITableViewCell+simplify.h>

@implementation FirstTableViewCell{
    
    __weak IBOutlet UILabel *_authorLabel;
    
    __weak IBOutlet UILabel *_titleLabel;
    
    __weak IBOutlet UILabel *_detailLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)render:(id)dataInfo {
    _authorLabel.text = dataInfo[@"author"];
    _titleLabel.text = dataInfo[@"title"];
    _detailLabel.text = dataInfo[@"detail"];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
