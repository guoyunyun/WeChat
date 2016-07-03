//
//  MessageCell.h
//  FinanceStreet
//
//  Created by Yong on 16/6/23.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@protocol AllContentDelegate <NSObject>

- (void)allContentWithModel:(MessageModel *)model andBtn:(UIButton *)btn;
- (void)bigImageWithModel:(MessageModel *)model;

@end

@interface MessageCell : UITableViewCell

@property (nonatomic, strong) UIView *MessageInfoView;   /** 顶部视图 */
@property (nonatomic, strong) UIImageView *iconImageView;   /** 头像 */
@property (nonatomic, strong) UILabel *userNameLabel;   /** 用户名 */
@property (nonatomic, strong) UILabel *sendTimeLabel;   /** 发布时间 */
@property (nonatomic, strong) UIButton *attentionButton;    /** 关注 */

@property (nonatomic, strong) UILabel *contentLabel;    /** 文字内容 */
@property (nonatomic, strong) UIButton *moreButton;     /** 显示更多 */

@property (nonatomic, strong) UIView *imagesView;      /** 放图片的视图 */
@property (nonatomic, strong) UIImageView *contentImageView1;    /** 图片内容 */
@property (nonatomic, strong) UIImageView *contentImageView2;
@property (nonatomic, strong) UIImageView *contentImageView3;
@property (nonatomic, strong) UIImageView *contentImageView4;

@property (nonatomic, strong) UIView *interactiveView;
@property (nonatomic, strong) UIImageView *shareImageView;  /** 分享图片 */
@property (nonatomic, strong) UILabel *shareNumLabel;       /** 分享的数量 */
@property (nonatomic, strong) UIView *dividingLineView;     /** 分割线 */
@property (nonatomic, strong) UIImageView *loveImageView;   /** 喜欢图片 */
@property (nonatomic, strong) UILabel *loveNumLabel;    /** 喜欢的数量   */
@property (nonatomic, strong) UITextField *inputeTextField;     /** 输入框 */

@property (nonatomic, strong) UIView *separateLineView;  /** 分割线 */

@property (nonatomic, assign) BOOL moreBool;

@property (nonatomic, strong) MessageModel *dataModel;

@property (nonatomic, weak) id<AllContentDelegate>delegate;

///展开多个活动信息
@property(nonatomic, copy) void (^showMoreTextBlock)(UITableViewCell  *currentCell);


- (void)setCellModel:(MessageModel *)model;

- (void)updataFrameWithModel:(MessageModel *)model;

@end
