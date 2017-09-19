//
//  RepeatController.m
//  Clock
//
//  Created by YAN on 2017/9/19.
//  Copyright © 2017年 minstone. All rights reserved.
//

#import "RepeatController.h"

@interface RepeatController ()<UITableViewDelegate,UITableViewDataSource>
/** 日期*/
@property(strong , nonatomic) NSMutableArray *dateArr;
@property (strong, nonatomic) IBOutlet UITableView *dateTable;
@end

@implementation RepeatController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dateTable.dataSource = self;
    _dateTable.delegate = self;
    _dateArr = [NSMutableArray arrayWithObjects:@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dateArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"datecell"];
    cell.textLabel.text = _dateArr[indexPath.row];
    
    
    return cell;
}

@end
