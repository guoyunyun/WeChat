//
//  MessageModel.h
//  FinanceStreet
//
//  Created by Yong on 16/6/25.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MessageModel;

@interface MessageModel : NSObject

@property (nonatomic ,copy) NSString *icon;     /** 头像 */

@property (nonatomic ,copy) NSString *name;

@property (nonatomic ,copy) NSString *time;

@property (nonatomic ,assign) BOOL attention;   /** 是否关注 */

@property (nonatomic ,copy) NSString *content;      /** 内容文字 */

@property (nonatomic ,copy) NSArray *imageArr;      /** 图片 */

@property (nonatomic, assign) BOOL isShowMoreText;  /** 是否展开 */

- (CGFloat)cellHeigthWithModel:(MessageModel *)model;

@end
