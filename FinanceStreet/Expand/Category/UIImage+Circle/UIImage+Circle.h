//
//  UIImage+Circle.h
//  图片处理
//
//  Created by Yong on 16/5/24.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Circle)

/**
 *  返回一张圆形图片
 */
- (instancetype)circleImage;

/**
 *  返回一张圆形图片
 */
+ (instancetype)circleImageName:(NSString *)name;



@end
