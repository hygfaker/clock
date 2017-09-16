//
//  ClockInfoController.m
//  Clock
//
//  Created by YAN on 2017/9/13.
//  Copyright © 2017年 minstone. All rights reserved.
//
//  添加闹钟页面
#import "WallpaperController.h"

@interface WallpaperController ()

@end

@implementation WallpaperController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"添加";
        [self addNavItem];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 添加导航栏两边按钮
- (void)addNavItem {
    UIBarButtonItem* leftButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(clickCancle)];
    UIBarButtonItem* rightButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(clickSave)];
    
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

- (void)clickCancle {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)clickSave {
    
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
