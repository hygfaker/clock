//
//  IndexController.m
//  Clock
//
//  Created by yans67 on 2017/9/12.
//  Copyright © 2017年 minstone. All rights reserved.
//

#import "IndexController.h"
#import "ClockInfoController.h"
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
    UIBarButtonItem* leftButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(clickEdit)];
    UIBarButtonItem* rightButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAdd)];
    
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}


- (void)clickEdit{
    
}

- (void)clickAdd{
    // 模态视图是独立视图，需要重新设置 nav
    ClockInfoController *clockInfo = [[ClockInfoController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:clockInfo];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
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
