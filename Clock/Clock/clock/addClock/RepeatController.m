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
@property(strong , nonatomic) NSMutableArray<NSString *> *dateArr;
/** 选中日期*/
@property(strong , nonatomic) NSMutableArray<NSNumber *> *selectArr;
@property (strong, nonatomic) IBOutlet UITableView *dateTable;
@end

@implementation RepeatController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dateTable.dataSource = self;
    _dateTable.delegate = self;
    _dateArr = [NSMutableArray arrayWithObjects:@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日", nil];
}

-(NSMutableArray<NSNumber *> *)selectArr{
    if (_selectArr == nil) {
        _selectArr = [NSMutableArray new];
    }
    return _selectArr;
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if ([self.selectArr containsObject:@(indexPath.row)]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([self.selectArr containsObject:@(indexPath.row)]) {
        [self.selectArr removeObject:@(indexPath.row)];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        [self.selectArr addObject:@(indexPath.row)];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    [tableView reloadData];
}

@end
