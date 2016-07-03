//
//  UIImage+Circle.m
//  图片处理
//
//  Created by Yong on 16/5/24.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "UIImage+Circle.h"

@implementation UIImage (Circle)

- (instancetype)circleImage
{
    //  开启图形上下文
    UIGraphicsBeginImageContext(self.size);

    //  获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    //  矩形框
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);

    //  添加一个圆
    CGContextAddEllipseInRect(ctx, rect);

    //  裁剪（裁剪成刚才添加的圆形形状）
    CGContextClip(ctx);

    //  往圆上面画一张图片
    [self drawInRect:rect];

    //  获取上下文中的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    //  关闭圆形上下文
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)circleImageName:(NSString *)name
{
    return [[self imageNamed:name] circleImage];
}



@end
