//
//  NSString+Extension.h
//  FinanceStreet
//
//  Created by Yong on 16/6/25.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)



/** 
    获取文字宽高范围
    maxSize 限制尺寸，用于计算文本绘制时占据的矩形块 MAXFLOAT无限大 显示所有内容
 */
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;


@end
