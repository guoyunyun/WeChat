//
//  FSNavigationController.m
//  FinanceStreet
//
//  Created by Yong on 16/6/20.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "FSNavigationController.h"

@interface FSNavigationController ()

@end

@implementation FSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navgation_bg"] forBarMetrics:UIBarMetricsDefault];

    self.navigationBar.barTintColor = [UIColor colorWithRed:200/255.0 green:59/255.0 blue:43/255.0 alpha:1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
