//
//  HKFirstViewController.m
//  WeChatFloat
//
//  Created by HeiKki on 2018/5/31.
//  Copyright © 2018年 HeiKki. All rights reserved.
//

#import "HKFirstViewController.h"
#import "HKSecondViewController.h"

@interface HKFirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation HKFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
     self.title = @"FIRST";
    [self.view addSubview:self.tableView];
}

#pragma <UITableViewDelegate,UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"FIRSTCELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellName];
    }
    cell.textLabel.text = cellName;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HKSecondViewController *vc = [[HKSecondViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - Lazy
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    };
    return _tableView;
}
@end
