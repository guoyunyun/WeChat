//
//  GroupCell.m
//  FinanceStreet
//
//  Created by Yong on 16/6/22.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "GroupCell.h"

@implementation GroupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = View_Background_GrayColor;
        [self ContentView];
    }
    return self;
}
- (void)ContentView
{
    [self.groupView addSubview:self.groupImageview];
    [self.groupView addSubview:self.groupLabel];
    [self.groupView addSubview:self.moreLabel];
    [self addSubview:self.groupView];

    [self addSubview:self.groupListView1];
    [self addSubview:self.groupListView2];
    [self addSubview:self.groupListView3];

    [self viewFrame];
}

- (UIImageView *)groupImageview
{
    if (_groupImageview == nil) {

        _groupImageview = [[UIImageView alloc]init];
        _groupImageview.image = [UIImage imageNamed:@"Layer_Activity_image"];
    }
    return _groupImageview;
}
- (UILabel *)groupLabel
{
    if (_groupLabel == nil) {
        _groupLabel = [[UILabel alloc]init];
        _groupLabel.text = @"小组";
        _groupLabel.font = [UIFont systemFontOfSize:16];
    }
    return _groupLabel;
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
- (UIView *)groupView
{
    if (_groupView == nil) {
        _groupView = [[UIView alloc]init];
        _groupView.backgroundColor = [UIColor whiteColor];
    }
    return _groupView;
}
- (void)viewFrame{

//    CGFloat padding = 10;

    self.groupView.frame = CGRectMake(0, 10, vFrame, 40);

    [self.groupImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.groupView.mas_left).with.offset(padding);
        make.centerY.mas_equalTo(self.groupView.centerY);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.groupLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.groupImageview.mas_right).with.offset(@10);
        make.centerY.mas_equalTo(self.groupImageview.centerY);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];

    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.groupView.mas_right).with.offset(padding);
        make.centerY.mas_equalTo(self.groupView.centerY);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];

    self.groupListView1.frame = CGRectMake(0, 51, (vFrame-2)/3, 55);
    self.groupListView2.frame = CGRectMake(self.groupListView1.frame.origin.x + self.groupListView1.frame.size.width + 1, 51, (vFrame-2)/3, 55);
    self.groupListView3.frame = CGRectMake(self.groupListView2.frame.origin.x + self.groupListView2.frame.size.width + 1, 51, (vFrame-2)/3, 55);

}
- (UIView *)groupListView1{
    if (_groupListView1 == nil) {

        UIImage *image = [UIImage imageNamed:@"Message_header_image"];
        _groupListView1 = [self groupListViewWithImage:image andTitle:@"赛事精猜" andNum:@"923人"];

    }
    return _groupListView1;

}
- (UIView *)groupListView2{
    if (_groupListView2 == nil) {

        UIImage *image = [UIImage imageNamed:@"Message_header_image"];
        _groupListView2 = [self groupListViewWithImage:image andTitle:@"时尚购物" andNum:@"923人"];
    }
    return _groupListView2;
    
}
- (UIView *)groupListView3{
    if (_groupListView3 == nil) {

        UIImage *image = [UIImage imageNamed:@"Message_header_image"];
        _groupListView3 = [self groupListViewWithImage:image andTitle:@"二手闲置" andNum:@"923人"];
    }
    return _groupListView3;
    
}
- (UIView *)groupListViewWithImage:(UIImage *)image andTitle:(NSString *)title andNum:(NSString *)num
{
    //int padding = 10;

    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.frame = CGRectMake(padding, padding, 39, 39);
    imageview.image = [image circleImage];
    [view addSubview:imageview];

    UILabel *label = [[UILabel alloc]init];
    label.text = title;
    label.frame = CGRectMake(imageview.frame.origin.x + imageview.frame.size.width+ 5, padding, 80, 18);
    label.font = [UIFont systemFontOfSize:13];

    [view addSubview:label];

    UILabel *numLabel = [[UILabel alloc]init];
    numLabel.text = num;
    numLabel.frame = CGRectMake(label.frame.origin.x, 59 - padding - 15, 80, 15);
    numLabel.font = [UIFont systemFontOfSize:12];
    numLabel.textColor = Font_GrayColor;

    [view addSubview:numLabel];

    return view;
}

@end
