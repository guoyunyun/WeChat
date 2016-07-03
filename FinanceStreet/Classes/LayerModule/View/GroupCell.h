//
//  GroupCell.h
//  FinanceStreet
//
//  Created by Yong on 16/6/22.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupCell : UITableViewCell

@property (nonatomic, strong) UIView *groupView;
@property (nonatomic, strong) UIImageView *groupImageview;
@property (nonatomic, strong) UILabel *groupLabel;

@property (nonatomic, strong) UIImageView *moreImageview;
@property (nonatomic, strong) UILabel *moreLabel;

@property (nonatomic, strong) UIView *groupListView1;
@property (nonatomic, strong) UIView *groupListView2;
@property (nonatomic, strong) UIView *groupListView3;
@end
