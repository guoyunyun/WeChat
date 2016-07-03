//
//  Header.h
//  FinanceStreet
//
//  Created by Yong on 16/6/20.
//  Copyright © 2016年 Yong. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define hFrame [[UIScreen mainScreen] bounds].size.height
#define vFrame [[UIScreen mainScreen] bounds].size.width

#define ScrollView_Scale 0.5
#define Layer_ScrollView_Scale 0.6
#define Layer_ScrollView_Height vFrame * 0.6

#define padding 10
#define MessageCell_Info_View_Height 35
#define MessageCell_ContentLabel_Height 60
#define MessageCell_ImageView_Width (vFrame - padding * 5)/4
#define MessageCell_interactiveView_height 40

#define Font_GrayColor [UIColor colorWithRed:166/255.0 green:166/255.0 blue:166/255.0 alpha:1];

#define View_Background_GrayColor [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
#define View_Background_LightGrayColor [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];

#endif /* Header_h */
