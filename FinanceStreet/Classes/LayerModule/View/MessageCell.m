//
//  MessageCell.m
//  FinanceStreet
//
//  Created by Yong on 16/6/23.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = View_Background_LightGrayColor;
        [self addSubview:self.MessageInfoView];
        [self addSubview:self.contentLabel];
        [self addSubview:self.moreButton];
        [self addSubview:self.moreButton];
        [self addSubview:self.imagesView];
        [self addSubview:self.separateLineView];

        [self addSubview:self.interactiveView];
    }
    return self;
}
#pragma mark 加载视图
- (UIView *)MessageInfoView
{
    if (_MessageInfoView == nil) {

        CGFloat hPadding = 10;
        CGFloat vPadding = 5;

        _MessageInfoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, vFrame, MessageCell_Info_View_Height)];
        _MessageInfoView.backgroundColor = [UIColor whiteColor];

        //  头像
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(hPadding, vPadding, 24, 24)];
        [_MessageInfoView addSubview:self.iconImageView];

        //  用户名
        self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.iconImageView.frame.origin.x + self.iconImageView.frame.size.width + vPadding, vPadding, 100, 15)];
        self.userNameLabel.font = [UIFont systemFontOfSize:14];
        [_MessageInfoView addSubview:self.userNameLabel];

        //  发送时间
        self.sendTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.userNameLabel.frame.origin.x, _MessageInfoView.frame.size.height - 10 - vPadding/2, 100, 10)];
        self.sendTimeLabel.font = [UIFont systemFontOfSize:10];
        self.sendTimeLabel.textColor = Font_GrayColor;
        [_MessageInfoView addSubview:self.sendTimeLabel];

        //  关注
        self.attentionButton = [[UIButton alloc]initWithFrame:CGRectMake(vFrame - hPadding *2 - 20, (MessageCell_Info_View_Height - 28)/2, 28, 28)];
        [_MessageInfoView addSubview:self.attentionButton];

        //  假数据
        UIImage *image = [[UIImage imageNamed:@"Message_header_image"] circleImage];
        self.iconImageView.image = image;
        self.userNameLabel.text = @"爱在金融街";
        self.sendTimeLabel.text = @"6天前";
        [self.attentionButton setImage:[UIImage imageNamed:@"Tabbar_Me_Normal"] forState:UIControlStateNormal];

    }
    return _MessageInfoView;
}
- (UILabel *)contentLabel
{
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.backgroundColor = [UIColor clearColor];
//        _contentLabel.frame = CGRectMake(padding, MessageCell_Info_View_Height + padding, vFrame - 20, MessageCell_ContentLabel_Height);
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _contentLabel.numberOfLines = 0;

    }
    return _contentLabel;
}

- (UIButton *)moreButton
{
    if (_moreButton == nil) {
        _moreButton = [[UIButton alloc]init];
        [_moreButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_moreButton setTitle:@"全文" forState:UIControlStateNormal];
//        _moreButton.frame = CGRectMake(5, self.contentLabel.frame.size.height + MessageCell_Info_View_Height + 20, 40, 20);
        _moreButton.hidden = YES;
        [_moreButton addTarget:self action:@selector(allControlEvents) forControlEvents:UIControlEventTouchUpInside];

    }
    return _moreButton;
}
#pragma mark 查看全文
-(void)allControlEvents
{
    self.dataModel.isShowMoreText = !self.dataModel.isShowMoreText;
    if (self.dataModel.isShowMoreText == YES) {
        [self.moreButton setTitle:@"收起" forState:UIControlStateNormal];
        self.moreButton.backgroundColor = [UIColor blueColor];
    }else{
        [self.moreButton setTitle:@"全文" forState:UIControlStateNormal];
    }

    [self.delegate allContentWithModel:self.dataModel andBtn:self.moreButton];
    [self frameWithModel:self.dataModel];

}

- (UIView *)interactiveView
{
    if (_interactiveView == nil) {

        _interactiveView = [[UIView alloc]init];
        _interactiveView.backgroundColor = [UIColor whiteColor];
        _interactiveView.frame = CGRectMake(0, 220, vFrame, MessageCell_interactiveView_height);

        self.shareImageView = [[UIImageView alloc]init];
        self.shareImageView.image = [UIImage imageNamed:@"Message_Share"];
        self.shareImageView.frame = CGRectMake(CGRectGetWidth(_interactiveView.frame)*0.05f, (CGRectGetHeight(_interactiveView.frame)-25)/2, 20, 25);
        [_interactiveView addSubview:self.shareImageView];

        self.shareNumLabel = [[UILabel alloc]init];
        self.shareNumLabel.frame = CGRectMake(CGRectGetMaxX(self.shareImageView.frame),(CGRectGetHeight(_interactiveView.frame)-14)/2 , 50, 14);
        self.shareNumLabel.font = [UIFont systemFontOfSize:14];
        self.shareNumLabel.textColor = Font_GrayColor;
        self.shareNumLabel.text = @"123";
        [_interactiveView addSubview:self.shareNumLabel];

        self.loveImageView = [[UIImageView alloc]init];
        self.loveImageView.image = [UIImage imageNamed:@"Message_love"];
        self.loveImageView.frame = CGRectMake(CGRectGetWidth(_interactiveView.frame)*0.25f, (CGRectGetHeight(_interactiveView.frame)-20)/2, 25, 20);
        [_interactiveView addSubview:self.loveImageView];

        self.loveNumLabel = [[UILabel alloc]init];
        self.loveNumLabel.frame = CGRectMake(CGRectGetMaxX(self.loveImageView.frame),(CGRectGetHeight(_interactiveView.frame)-14)/2 , 30, 14);
        self.loveNumLabel.font = [UIFont systemFontOfSize:14];
        self.loveNumLabel.textColor = Font_GrayColor;
        self.loveNumLabel.text = @"333";
        [_interactiveView addSubview:self.loveNumLabel];

        self.inputeTextField = [[UITextField alloc]init];
        self.inputeTextField.placeholder = @"  有什么感想快来说说吧...";
        self.inputeTextField.enabled = NO;
        self.inputeTextField.frame = CGRectMake(CGRectGetMaxX(self.loveNumLabel.frame) + 15, (CGRectGetHeight(_interactiveView.frame)-30)/2, vFrame - (CGRectGetMaxX(self.loveNumLabel.frame) + 15) - 20, 30);
        self.inputeTextField.backgroundColor = View_Background_LightGrayColor;
        self.inputeTextField.font = [UIFont systemFontOfSize:14];
        [_interactiveView addSubview:self.inputeTextField];

    }
    return _interactiveView;
}

- (UIView *)imagesView
{
    if (_imagesView == nil) {

        _imagesView = [[UIView alloc]init];
        _imagesView.hidden = YES;

        self.contentImageView1 = [[UIImageView alloc]init];
        self.contentImageView1.frame = CGRectMake(padding, 0, MessageCell_ImageView_Width, MessageCell_ImageView_Width);
        [_imagesView addSubview:self.contentImageView1];


        self.contentImageView2 = [[UIImageView alloc]init];
        self.contentImageView2.frame = CGRectMake(CGRectGetMaxX(self.contentImageView1.frame) + padding, 0, MessageCell_ImageView_Width, MessageCell_ImageView_Width);
        [_imagesView addSubview:self.contentImageView2];

        self.contentImageView3 = [[UIImageView alloc]init];
        self.contentImageView3.frame = CGRectMake(CGRectGetMaxX(self.contentImageView2.frame) + padding, 0, MessageCell_ImageView_Width, MessageCell_ImageView_Width);
        [_imagesView addSubview:self.contentImageView3];

        self.contentImageView4 = [[UIImageView alloc]init];
        self.contentImageView4.frame = CGRectMake(CGRectGetMaxX(self.contentImageView3.frame) + padding, 0, MessageCell_ImageView_Width, MessageCell_ImageView_Width);
        [_imagesView addSubview:self.contentImageView4];


    }
    return _imagesView;
}


-(UIView *)separateLineView
{
    if (_separateLineView == nil) {
        _separateLineView = [[UIView alloc]init];
        _separateLineView.backgroundColor = View_Background_GrayColor;

    }
    return _separateLineView;
}

#pragma mark 读取数据
- (void)setCellModel:(MessageModel *)models
{
    if (models) {

        self.dataModel = models;

        [self.iconImageView setHeader:models.icon];
        self.userNameLabel.text = models.name;
        self.sendTimeLabel.text = models.time;
        self.contentLabel.text = models.content;
    }

     [self frameWithModel:self.dataModel];
}
- (void)layoutSubviews
{
    [super layoutSubviews];

}
#pragma mark 根据Model布局
- (void)frameWithModel:(MessageModel *)model
{
    self.contentLabel.frame = CGRectMake(padding, MessageCell_Info_View_Height + padding, vFrame - 20, MessageCell_ContentLabel_Height);
    self.moreButton.frame = CGRectMake(5, self.contentLabel.frame.size.height + MessageCell_Info_View_Height + 20, 40, 20);

    //  文字不超过3行隐藏全文按钮
    CGSize size = [NSString sizeWithString:model.content font:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(vFrame - 20, MAXFLOAT)];
    if (size.height > MessageCell_ContentLabel_Height) {
        self.moreButton.hidden = NO;
    }

    //  显示全文布局
    if (model.isShowMoreText == YES) {
        self.contentLabel.frame = CGRectMake(padding, MessageCell_Info_View_Height + padding, vFrame - padding * 2, size.height);

    }else{
        self.contentLabel.frame = CGRectMake(padding, MessageCell_Info_View_Height + padding, vFrame - padding * 2, MessageCell_ContentLabel_Height);
    }
        self.moreButton.frame = CGRectMake(5, self.contentLabel.frame.size.height + MessageCell_Info_View_Height + 20, 40, 20);
    //  布局
    //  如果有图片
    if (model.imageArr.count != 0 ) {
        self.imagesView.hidden = NO;
        [self contentImageWithModel:model];

        //有显示更多按钮
        if (size.height > MessageCell_ContentLabel_Height) {
            self.imagesView.frame = CGRectMake(0, CGRectGetMaxY(self.moreButton.frame) + padding, vFrame, MessageCell_ImageView_Width);
            //没有
        }else{
            self.imagesView.frame = CGRectMake(0, CGRectGetMaxY(self.contentLabel.frame), vFrame, MessageCell_ImageView_Width);
        }
        self.interactiveView.frame = CGRectMake(0, CGRectGetMaxY(self.imagesView.frame) + padding, vFrame, 40);
        //没有图片
    }else{
        //有显示更多按钮
        if (size.height > MessageCell_ContentLabel_Height) {
            self.interactiveView.frame = CGRectMake(0, CGRectGetMaxY(self.moreButton.frame) + padding, vFrame, 40);

        }else{
            self.interactiveView.frame = CGRectMake(0, CGRectGetMaxY(self.contentLabel.frame) + padding, vFrame, 40);
        }
    }
    self.separateLineView.frame = CGRectMake(0, CGRectGetMaxY(self.interactiveView.frame), vFrame, 10);

}

#pragma mark 读取图片数据
- (void)contentImageWithModel:(MessageModel *)model{
    if (model.imageArr) {
        NSUInteger num = model.imageArr.count;
        for (int i = 0; i<num; i++) {

        switch (i) {
            case 0:{
                NSURL *url1 = [NSURL URLWithString:model.imageArr[0]];
                [self.contentImageView1 sd_setImageWithURL:url1 placeholderImage:[UIImage imageNamed:@"Image_placeholder"]];

                self.contentImageView1.userInteractionEnabled = YES;
                UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bigImage)];
                [self.contentImageView1 addGestureRecognizer:tap1];
                break;
            }
            case 1:{
                NSURL *url2 = [NSURL URLWithString:model.imageArr[1]];
                [self.contentImageView2 sd_setImageWithURL:url2 placeholderImage:[UIImage imageNamed:@"Image_placeholder"]];
                UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bigImage)];
                self.contentImageView2.userInteractionEnabled = YES;
                [self.contentImageView2 addGestureRecognizer:tap2];

                
                break;
            }
            case 2:{
                NSURL *url3 = [NSURL URLWithString:model.imageArr[2]];
                [self.contentImageView3 sd_setImageWithURL:url3 placeholderImage:[UIImage imageNamed:@"Image_placeholder"]];


                UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bigImage)];
                self.contentImageView3.userInteractionEnabled = YES;
                [self.contentImageView3 addGestureRecognizer:tap3];

                break;
            }
            case 3:{
                NSURL *url4 = [NSURL URLWithString:model.imageArr[3]];
                [self.contentImageView4 sd_setImageWithURL:url4 placeholderImage:[UIImage imageNamed:@"Image_placeholder"]];

                UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bigImage)];
                self.contentImageView4.userInteractionEnabled = YES;
                [self.contentImageView4 addGestureRecognizer:tap4];


                break;
            }
            default:
                break;
        }
        }

    }
}
- (void)bigImage
{
    [self.delegate bigImageWithModel:self.dataModel];
}
@end
