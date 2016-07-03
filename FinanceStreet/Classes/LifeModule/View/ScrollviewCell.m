//
//  ScrollviewCell.m
//  FinanceStreet
//
//  Created by Yong on 16/6/20.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "ScrollviewCell.h"

@implementation ScrollviewCell

+ (instancetype)cellWithTableView:(UITableView *)tableview
{
    static NSString *ID = @"scrollviewCell";
    ScrollviewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];

    if (cell == nil) {

        cell = [[ScrollviewCell alloc]init];

    }
    
    return cell;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.infinitePageView.frame = self.bounds;
    [self setScrollview];
}
- (void)setScrollview{

    NSArray* urlsArray = @[
                           @"http://i1-jiajuol-com.b0.upaiyun.com/0/photo/201/035/000/768574401df458f2.jpg!800",
                           @"http://i1-jiajuol-com.b0.upaiyun.com/0/photo/190/035/000/3405743ef3cb2f73.jpg!800",
                           @"http://i1-jiajuol-com.b0.upaiyun.com/0/photo/139/035/000/238573eb4f3389a2.jpg!800",
                           @"http://i1-jiajuol-com.b0.upaiyun.com/0/photo/159/035/000/8135742a0732ae48.jpg!800"
                           ];
    CGFloat viewHeight = self.frame.size.height;
     
    self.infinitePageView = [BHInfiniteScrollView
                             infiniteScrollViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), viewHeight) Delegate:nil ImagesArray:urlsArray PlageHolderImage:[UIImage imageNamed:@"Home_Content_placeholder"]];

    self.infinitePageView.dotSize = 7;
    self.infinitePageView.pageControlAlignmentOffset = CGSizeMake(0, 10);
    self.infinitePageView.titleView.textColor = [UIColor whiteColor];
    self.infinitePageView.titleView.margin = 30;
    self.infinitePageView.titleView.hidden = YES;
    self.infinitePageView.scrollTimeInterval = 3;
    self.infinitePageView.autoScrollToNextPage = YES;
    [self addSubview:self.infinitePageView];

}

@end
