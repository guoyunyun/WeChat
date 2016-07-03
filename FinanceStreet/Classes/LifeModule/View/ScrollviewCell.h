//
//  ScrollviewCell.h
//  FinanceStreet
//
//  Created by Yong on 16/6/20.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHInfiniteScrollView.h"

@interface ScrollviewCell : UITableViewCell<BHInfiniteScrollViewDelegate>

@property (nonatomic, strong) BHInfiniteScrollView* infinitePageView;

+ (instancetype)cellWithTableView:(UITableView *)tableview;

@end
