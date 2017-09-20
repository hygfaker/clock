//
//  IndexController.m
//  Clock
//
//  Created by yans67 on 2017/9/12.
//  Copyright © 2017年 minstone. All rights reserved.
//
//  首页
#import "IndexController.h"
#import "ClockInfoController.h"
#import "WallpaperController.h"
#import <UserNotifications/UserNotifications.h>
@interface IndexController ()

@end

@implementation IndexController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"闹钟";
        [self addNavItem];
    }
    return self;
}

#pragma mark - 添加导航栏两边按钮
- (void)addNavItem {
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(clickEdit)];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAdd)];
    
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

#pragma mark - 导航栏左键，开启壁纸
- (void)clickEdit {
    WallpaperController *wallpaper = [WallpaperController new];
    wallpaper.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self.navigationController presentViewController:wallpaper animated:YES completion:nil];
}

#pragma mark - 导航栏右键，添加闹钟
- (void)clickAdd{
    // 模态视图是独立视图，需要重新设置 nav
    ClockInfoController *clockInfo = [[ClockInfoController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:clockInfo];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

#pragma mark - 开启本地推送
- (IBAction)clickLocalPush:(UIButton *)sender {
    [self createLocalizedUserNotification];
}

- (void)createLocalizedUserNotification {
    // 设置触发条件 UNNotificationTrigger
    UNTimeIntervalNotificationTrigger *timeTrigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5.0f repeats:NO];
    
    // 创建通知内容 UNMutableNotificationContent, 注意不是 UNNotificationContent ,此对象为不可变对象。
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"Dely 时间提醒 - title";
    content.subtitle = [NSString stringWithFormat:@"Dely 装逼大会竞选时间提醒 - subtitle"];
    content.body = @"Dely 装逼大会总决赛时间到，欢迎你参加总决赛！希望你一统X界 - body";
//    content.badge = @666; content
    content.sound = [UNNotificationSound defaultSound];
    content.userInfo = @{@"key1":@"value1",@"key2":@"value2"};
    
    // 创建通知标示
    NSString *requestIdentifier = @"Dely.X.time";
    
    // 创建通知请求 UNNotificationRequest 将触发条件和通知内容添加到请求中
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:timeTrigger];
    
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    // 将通知请求 add 到 UNUserNotificationCenter
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"推送已添加成功 %@", requestIdentifier);
            //你自己的需求例如下面：
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"本地通知" message:@"成功添加推送" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:cancelAction];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
            
        }
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
