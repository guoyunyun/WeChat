//
//  ActivityCell.m
//  FinanceStreet
//
//  Created by Yong on 16/6/21.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self ContentView];

    }
    return self;
}

- (void)ContentView
{
    [self.activityView addSubview:self.activityImageview];
    [self.activityView addSubview:self.activityLabel];
    [self.activityView addSubview:self.moreLabel];
    [self addSubview:self.activityView];
    [self addSubview:self.contentImageview];
    [self viewFrame];
}
- (UIImageView *)activityImageview
{
    if (_activityImageview == nil) {

        _activityImageview = [[UIImageView alloc]init];
        _activityImageview.image = [UIImage imageNamed:@"Layer_Activity_image"];
    }
    return _activityImageview;
}
- (UILabel *)activityLabel
{
    if (_activityLabel == nil) {
        _activityLabel = [[UILabel alloc]init];
        _activityLabel.text = @"活动";
        _activityLabel.font = [UIFont systemFontOfSize:16];
    }
    return _activityLabel;
}
- (UILabel *)moreLabel
{
    if (_moreLabel == nil) {
        _moreLabel = [[UILabel alloc]init];
        _moreLabel.text = @"更多";
        _moreLabel.font = [UIFont systemFontOfSize:13];
        _moreLabel.textColor = Font_GrayColor;
    }
    return _moreLabel;
}
- (UIView *)activityView
{
    if (_activityView == nil) {
        _activityView = [[UIView alloc]init];
    }
    return _activityView;
}

- (UIImageView *)contentImageview
{
    if (_contentImageview == nil) {
        _contentImageview = [[UIImageView alloc]init];
        _contentImageview.image = [UIImage imageNamed:@"Layer_Activity_Content.JPG"];
        _contentImageview.frame = CGRectMake(0, 40, vFrame, Layer_ScrollView_Height - 40);
    }
    return _contentImageview;
}

- (void)viewFrame{

    //int padding = 10;

    self.activityView.frame = CGRectMake(0, 0, vFrame, 40);

    [self.activityImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.activityView.mas_left).with.offset(padding);
        make.centerY.mas_equalTo(self.activityView.centerY);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.activityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.activityImageview.mas_right).with.offset(@10);
        make.centerY.mas_equalTo(self.activityView.centerY);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];

    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.activityView.mas_right).with.offset(padding);
        make.centerY.mas_equalTo(self.activityView.centerY);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];


}


@end
