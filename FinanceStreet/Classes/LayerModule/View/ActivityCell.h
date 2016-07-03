//
//  ActivityCell.h
//  FinanceStreet
//
//  Created by Yong on 16/6/21.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BHInfiniteScrollView.h"

@interface ActivityCell : UITableViewCell<BHInfiniteScrollViewDelegate>

@property (nonatomic, strong) BHInfiniteScrollView* infinitePageView;

@property (nonatomic, strong) UIView *activityView;
@property (nonatomic, strong) UIImageView *activityImageview;   /** 活动图片 */
@property (nonatomic, strong) UILabel *activityLabel;   /** 活动 */

@property (nonatomic, strong) UIImageView *moreImageview;   
@property (nonatomic, strong) UILabel *moreLabel;       /** 更多 */

@property (nonatomic, strong) UIImageView *contentImageview;    /** 内容图片 */

@end
