//
//  LayerViewController.m
//  FinanceStreet
//
//  Created by Yong on 16/6/20.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "LayerViewController.h"
#import "ActivityCell.h"
#import "GroupCell.h"
#import "MessageCell.h"
#import "MessageModel.h"
#import "BHInfiniteScrollView.h"

@interface LayerViewController ()<BHInfiniteScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,AllContentDelegate>
{
    UIView *bigImageView;
}
@property (strong, nonatomic)UITableView *tableview;

@property (nonatomic,strong) NSMutableArray *dataList;   //  加载数据
@property (nonatomic,strong) NSMutableArray *cellHeight;
@property (nonatomic, strong) BHInfiniteScrollView* infinitePageView;
@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = self.view.frame;
    rect.size.height -= 55;
    self.tableview = [[UITableView alloc]initWithFrame:rect];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorColor = [UIColor clearColor];
    [self.view addSubview:self.tableview];

    __weak typeof (self) weakSelf = self;
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf readData];
    }];

    UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Life_navigation_title"]];
    self.navigationItem.titleView = imageview;

}

- (void)readData
{
    [self.tableview.mj_header endRefreshing];
}
//数据
- (NSMutableArray *)dataList
{
    if (_dataList == nil) {

        NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"plist"];
        NSMutableArray *arr = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
        _dataList = [MessageModel mj_objectArrayWithKeyValuesArray:arr];
    }
    return _dataList;
}
- (NSMutableArray *)cellHeight
{
    if (_cellHeight == nil) {
        _cellHeight = [[NSMutableArray alloc]init];
        for (MessageModel *model  in self.dataList) {
            CGFloat height = [model cellHeigthWithModel:model];
            NSNumber *num = [NSNumber numberWithFloat:height];
            [_cellHeight addObject:num];

        }
        NSLog(@"cell高度： %@",_cellHeight);
    }
    return _cellHeight;
}
#pragma mark 视图将要加载
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 设置状态栏为白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

#pragma mark  tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count + 2;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {

        return Layer_ScrollView_Height;
    }else if (indexPath.row == 1){
        return 110;
    }
    CGFloat height;
    if (self.cellHeight) {
        height = [self.cellHeight[indexPath.row-2] floatValue];

    }
    return height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    static NSString *groupIdentifier = @"groupCell";
    static NSString *messageIdentifier = @"messageCell";

    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    GroupCell *cell2 = [tableView dequeueReusableCellWithIdentifier:groupIdentifier];
    MessageCell *cell3 = [tableView dequeueReusableCellWithIdentifier:messageIdentifier];

    if (indexPath.row == 0) {

        cell = [[ActivityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.infinitePageView.delegate = self;

        return cell;
    }else if (indexPath.row == 1){
        cell2 = [[GroupCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:groupIdentifier];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell2;
    }else{
        cell3 = [[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:messageIdentifier];
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        cell3.delegate = self;
        MessageModel *model = self.dataList[indexPath.row-2];
        [cell3 setCellModel:model];

        return cell3;
    }
    
    return [UITableViewCell new];
    
}
- (void)allContentWithModel:(MessageModel *)model andBtn:(UIButton *)btn
{
    UITableViewCell *cell = (UITableViewCell *)[btn superview];
    NSIndexPath *indexPath = [self.tableview indexPathForCell:cell];
    
    CGSize size = [NSString sizeWithString:model.content font:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(vFrame - 20, MAXFLOAT)];
    CGFloat height = [model cellHeigthWithModel:model];
    height = height + (size.height - 60);
    NSNumber *num = [NSNumber numberWithFloat:height];
    NSInteger row = indexPath.row - 2;

    //改变cell行高
    if (model.isShowMoreText == YES) {

        [self.cellHeight replaceObjectAtIndex:row withObject:num];
    }else{
        [self.cellHeight replaceObjectAtIndex:row withObject:[NSNumber numberWithFloat:[model cellHeigthWithModel:model]]];
    }
    //替换数据源
    [self.dataList replaceObjectAtIndex:row withObject:model];

//    NSIndexPath *indexPath2=[NSIndexPath indexPathForRow:indexPath.row inSection:0];
//    [self.tableview reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath2,nil] withRowAnimation:UITableViewRowAnimationNone];
    
    [self.tableview reloadData];

}

- (void)bigImageWithModel:(MessageModel *)model
{
    bigImageView = [[UIView alloc]initWithFrame:self.view.bounds];
    bigImageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bigImageView];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeView)];
    bigImageView.userInteractionEnabled = YES;
    [bigImageView addGestureRecognizer:tap];

    self.infinitePageView = [BHInfiniteScrollView
                             infiniteScrollViewWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.frame), 200) Delegate:nil ImagesArray:model.imageArr PlageHolderImage:[UIImage imageNamed:@"Home_Content_placeholder"]];

    self.infinitePageView.dotSize = 0;
    //self.infinitePageView.pageControlAlignmentOffset = CGSizeMake(0, 10);
    self.infinitePageView.titleView.textColor = [UIColor whiteColor];
    self.infinitePageView.titleView.margin = 30;
    self.infinitePageView.titleView.hidden = YES;
    self.infinitePageView.scrollTimeInterval = 3;
    self.infinitePageView.autoScrollToNextPage = NO;
    [bigImageView addSubview:self.infinitePageView];

    //self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;

    
}
- (void)closeView
{
    self.tabBarController.tabBar.hidden = NO;
    [bigImageView removeFromSuperview];
}
@end
