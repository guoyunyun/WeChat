//
//  AppDelegate.m
//  FinanceStreet
//
//  Created by Yong on 16/6/20.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "AppDelegate.h"
#import "LifeViewController.h"
#import "LayerViewController.h"
#import "MeViewController.h"
#import "FSNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    LifeViewController *lifeVc = [[LifeViewController alloc]init];
    FSNavigationController *lifeNav = [[FSNavigationController alloc]initWithRootViewController:lifeVc];
//    lifeNav.navigationBar.barTintColor = [UIColor colorWithRed:200/255.0 green:59/255.0 blue:43/255.0 alpha:1];

    LayerViewController *layerVc = [[LayerViewController alloc]init];
    FSNavigationController *layerNav = [[FSNavigationController alloc]initWithRootViewController:layerVc];

    MeViewController *meVc = [[MeViewController alloc]init];
    FSNavigationController *meNav = [[FSNavigationController alloc]initWithRootViewController:meVc];

    UITabBarController *tab = [[UITabBarController alloc]init];
    tab.viewControllers = @[lifeNav,layerNav,meNav];
    tab.tabBar.backgroundColor = [UIColor whiteColor];
    tab.tabBar.tintColor = [UIColor colorWithRed:200/255.0 green:59/255.0 blue:43/255.0 alpha:1];


    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica" size:12.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
    UITabBar *tabBar = tab.tabBar;

    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];

    tabBarItem1.title = @"生活";
    tabBarItem1.image = [UIImage imageNamed:@"tabbar_me_btn"];

    tabBarItem2.title = @"图层";
    tabBarItem2.image = [UIImage imageNamed:@"tabbar_me_btn"];

    tabBarItem3.title = @"我";
    tabBarItem3.image = [UIImage imageNamed:@"tabbar_me_btn"];

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = tab;

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
