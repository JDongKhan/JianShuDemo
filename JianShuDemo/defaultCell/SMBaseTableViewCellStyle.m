//
//  SMBaseTableViewCellStyleValue1.m
//  hundsun_zjfae
//
//  Created by 王金东 on 14-7-31.
//  Copyright (c) 2014年 王金东. All rights reserved.
//

#import "SMBaseTableViewCellStyle.h"

@implementation SMBaseTableViewCellStyleValue1{
 
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
      
    }
    return self;
}

- (CGSize)sizeThatFits:(CGSize)rect {
    return CGSizeMake(self.contentView.frame.size.width, 44);
}
@end

@implementation SMBaseTableViewCellStyleValue1TextGray

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
    
    }
    return self;
}
- (void)setDataInfo:(id)dataInfo{
    self.textLabel.textColor = [UIColor grayColor];
    self.detailTextLabel.textColor = [UIColor blackColor];
    [super setDataInfo:dataInfo];
}


@end

@implementation SMBaseTableViewCellStyleValue2

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

@end


@implementation SMBaseTableViewCellStyleSubtitle{
    NSDictionary *info;
    UILabel *titleLabel;
    UILabel *detailLabel;
    UIImageView *imageView;
}

- (CGFloat)baseTableView:(UITableView *)tableView cellInfo:(id)dataInfo{
    [self setDataInfo:dataInfo];
    return titleLabel.frame.size.height;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.contentView addSubview:imageView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x + imageView.frame.size.width, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.font = [UIFont systemFontOfSize:SMCellDefaultFontForTitleView];
        titleLabel.numberOfLines = 2;
        titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:titleLabel];
        
        detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width, 0, 0, self.contentView.frame.size.height)];
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:SMCellDefaultFontForDetailView];
        detailLabel.backgroundColor = [UIColor clearColor];
        detailLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [self.contentView addSubview:detailLabel];
    }
    return self;
}


- (void)setDataInfo:(id)dataInfo{
    
    CGFloat accessoryTypeWidth = self.accessoryType == UITableViewCellAccessoryNone?0:20.0f;
    
    info = dataInfo;
    CGRect imageFrame = CGRectZero;
    NSString *imageName = dataInfo[self.keyForImageView];
    if( imageName != nil){
        imageFrame = CGRectMake(10, 5, 50, 50);
        imageView.image = [UIImage imageNamed:imageName];
    }
    imageView.frame = imageFrame;
    
    NSString *detail = dataInfo[self.keyForDetailView];
    CGRect detailFrame = detailLabel.frame;
    if(detail != nil){
        detailLabel.text = detail;
        detailFrame.origin.x = self.frame.size.width-80-accessoryTypeWidth;
        detailFrame.size.width = 80;
    }
    detailLabel.frame = detailFrame;
    
    CGRect titleFrame = titleLabel.frame;
    NSString *title = dataInfo[self.keyForTitleView];
    if(title != nil){
        titleLabel.text = title;
        titleFrame.origin.x = imageFrame.origin.x+imageFrame.size.width+10;
        titleFrame.size.width =  self.frame.size.width-(imageFrame.size.width+imageFrame.origin.x)-detailFrame.size.width-20-accessoryTypeWidth;
    }
    titleLabel.frame = titleFrame;
    
    //计算高度
    titleFrame.size.height = titleLabel.frame.size.height+20;
    titleLabel.frame = titleFrame;
}

@end

