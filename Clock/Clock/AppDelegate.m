//
//  AppDelegate.m
//  Clock
//
//  Created by YAN on 2017/9/11.
//  Copyright © 2017年 minstone. All rights reserved.
//

#import "AppDelegate.h"
#import "IndexController.h"
#import "SettingController.h"
#import "NotificationHandle.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max  // 防止低版本找不到本地通知而报错

#endif

#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)


@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    IndexController *index = [[IndexController alloc] init];
    UINavigationController *navIndex = [[UINavigationController alloc] initWithRootViewController:index];
    
    SettingController *setting = [[SettingController alloc] init];
//    设置页面不需要导航栏
//    UINavigationController *navSetting = [[UINavigationController alloc] initWithRootViewController:setting];
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:navIndex, setting, nil];

    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    [self.window setRootViewController:tabBarController];
    [self.window makeKeyAndVisible];
    
    
    // 使用 NotificationHandle 代理注册通知
    [UNUserNotificationCenter currentNotificationCenter].delegate = [NotificationHandle shareInstance];
    
    [[NotificationHandle shareInstance] authorizationPushNotificaton:application];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
