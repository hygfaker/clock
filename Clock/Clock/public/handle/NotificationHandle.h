//
//  NotificationHandle.h
//  Clock
//
//  Created by YAN on 2017/9/14.
//  Copyright © 2017年 minstone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import <UIKit/UIKit.h>

@interface NotificationHandle : NSObject <UNUserNotificationCenterDelegate>

+(NotificationHandle *) shareInstance;

-(void)authorizationPushNotificaton:(UIApplication *)application;

@end
