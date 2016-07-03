//
//  UIImageView+Circle.m
//  图片处理
//
//  Created by Yong on 16/5/24.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "UIImageView+Circle.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Circle.h"

@implementation UIImageView (Circle)

- (void)setHeader:(NSString *)url
{
    [self setCircleHeader:url];
}

- (void)setRectHeader:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

- (void)setCircleHeader:(NSString *)url
{
    __weak typeof (self) weakSelf = self;
    //  裁剪圆角图片
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            //如果图片下载失败，不做任何处理，默认显示占位图片
        if (image == nil) return;
        weakSelf.image = [image circleImage];

    }];

}




@end
