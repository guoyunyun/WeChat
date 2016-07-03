//
//  NSString+Extension.m
//  FinanceStreet
//
//  Created by Yong on 16/6/25.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}
@end
