//
//  MessageModel.m
//  FinanceStreet
//
//  Created by Yong on 16/6/25.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

- (CGFloat)cellHeigthWithModel:(MessageModel *)model
{

    CGFloat cellHeight = 0.0;

    CGSize size = [NSString sizeWithString:model.content font:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(vFrame - 20, MAXFLOAT)];
    if (size.height > MessageCell_ContentLabel_Height && model.imageArr.count !=0) {
        cellHeight = 165 + 40 + MessageCell_ImageView_Width;
    }else if (size.height > MessageCell_ContentLabel_Height && model.imageArr.count == 0){
        cellHeight = 165 + 30;

    }else if (size.height < MessageCell_ContentLabel_Height && model.imageArr.count != 0)
    {
        cellHeight = 165 + MessageCell_ImageView_Width;
    }
    else if (size.height < MessageCell_ContentLabel_Height && model.imageArr.count == 0)
    {
        cellHeight = 165;
    }

//    if (model.isShowMoreText == YES) {
//        cellHeight += size.height -60;
//    }

    return cellHeight;
}
@end
