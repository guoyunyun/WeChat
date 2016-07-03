//
//  LifeViewController.m
//  FinanceStreet
//
//  Created by Yong on 16/6/20.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "LifeViewController.h"
#import "ScrollviewCell.h"

@interface LifeViewController ()<BHInfiniteScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableview;

@property (nonatomic,strong) NSMutableArray *dataList;   //  加载数据

@end

@implementation LifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableview = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
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

#pragma mark 页面布局
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    //self.tableview.frame = CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height + 20);
    
}

#pragma mark 视图将要加载
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //self.navigationController.navigationBarHidden = YES;
    // 设置状态栏为白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}
#pragma mark  tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {

        return self.view.frame.size.width * ScrollView_Scale;
        //return 200;
    }
    return 320;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {

        ScrollviewCell *cell = [ScrollviewCell cellWithTableView:tableView];
        cell.infinitePageView.delegate = self;
        return cell;
    }

    return [UITableViewCell new];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
