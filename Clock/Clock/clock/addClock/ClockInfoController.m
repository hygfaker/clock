//
//  ClockInfoController.m
//  Clock
//
//  Created by YAN on 2017/9/13.
//  Copyright © 2017年 minstone. All rights reserved.
//
//  添加闹钟页面
#import "ClockInfoController.h"
#import "RepeatController.h"
@interface ClockInfoController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIDatePicker *timeEdit;
@property (strong, nonatomic) IBOutlet UITableView *configTable;
/** configTable数据*/
@property(strong , nonatomic) NSMutableArray *configArr;
@end

@implementation ClockInfoController

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
    _configTable.dataSource = self;
    _configTable.delegate = self;
   
    self.configArr = [NSMutableArray arrayWithObjects:@"重复",@"名称",@"模式",@"响应", nil];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.configArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if (cell) {
        cell.textLabel.text = self.configArr[indexPath.row];
        cell.detailTextLabel.text = self.configArr[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
#pragma mark - 点击 cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            RepeatController *repeat = [RepeatController new];
            [self.navigationController pushViewController:repeat animated:YES];
            break;
        }
        case 1:{
            RepeatController *repeat = [RepeatController new];
            [self.navigationController pushViewController:repeat animated:YES];
            break;
        }
        case 2:{
            RepeatController *repeat = [RepeatController new];
            [self.navigationController pushViewController:repeat animated:YES];
            break;
        }
        case 3:{
            RepeatController *repeat = [RepeatController new];
            [self.navigationController pushViewController:repeat animated:YES];
            break;
        }
        default:
            break;
    }
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
    NSLog(@"%@",self.timeEdit.date);
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
