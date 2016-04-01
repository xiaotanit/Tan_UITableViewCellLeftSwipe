//
//  ViewController.m
//  Tan_SwipeTableViewCell
//
//  Created by PX_Mac on 16/3/25.
//  Copyright © 2016年 PX_Mac. All rights reserved.
//
//自定义UITableViewCell多菜单左滑，使用UIPanGestureRecognizer拖拽来实现cell左滑
// 使用UIPanGestureRecognizer和UISwipeGestureRecognizer实现左滑的区别：
// 拖拽手势可以是任意方向，而清扫手势是固定的上、下、左、右四个方向
// 当UITableViewController的下拉刷新控件启用后，在Swipe中没什么问题，在Pan中不能使用

#import "ViewController.h"
#import "MemberModel.h"
#import "TanTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, TanTableViewCellDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr; //模型数据集

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置UITableView信息
    self.tableView.rowHeight = 60.f; //设置行高
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone; //隐藏自带的分割线
    
    self.dataArr = [NSMutableArray arrayWithArray:[self getMemberData]];
    
    //启用下拉刷新控件
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新^_^"];
    [refresh addTarget:self action:@selector(refreshTableView:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
}

//模型数据
- (NSArray *)getMemberData{
    MemberModel *member1 = [MemberModel memberWithID:1 displayname:@"徐子陵😄😄" email:@"ziling@sina.com" phone:@"13751205120"];
    MemberModel *member2 = [MemberModel memberWithID:2 displayname:@"寇仲⭐️⭐️⭐️" email:@"kouzhong@qq.com" phone:@"18851205120"];
    MemberModel *member3 = [MemberModel memberWithID:3 displayname:@"跋锋寒😢😢" email:@"fenghan@163.com" phone:@"15851205120"];
    MemberModel *member4 = [MemberModel memberWithID:4 displayname:@"侯希白⌚️⌚️" email:@"xibai@sohu.com" phone:@"18651205120"];
    MemberModel *member5 = [MemberModel memberWithID:5 displayname:@"石之轩📱📱" email:@"zhixuan@yahoo.com" phone:@"18552405240"];
    MemberModel *member6 = [MemberModel memberWithID:6 displayname:@"杨虚彦💰💰" email:@"xuyan@hotmail.com" phone:@"13551885188"];
    MemberModel *member7 = [MemberModel memberWithID:7 displayname:@"宁道奇🏀🏀" email:@"daoqi@gmail.com" phone:@"18951885188"];
    MemberModel *member8 = [MemberModel memberWithID:8 displayname:@"雷九指🐂🐂" email:@"jiuzhi@126.com" phone:@"13288888888"];
    MemberModel *member9 = [MemberModel memberWithID:9 displayname:@"宋缺🔫🔫" email:@"songque@aliyun.com" phone:@"15251885188"];
    
    NSArray *arr = [NSArray arrayWithObjects:member1, member2, member3, member4, member5, member6, member7, member8, member9, nil];
    return arr;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TanTableViewCell *cell = [TanTableViewCell cellWithTableView:tableView];
    cell.delegate = self;
    
    MemberModel *model = [self.dataArr objectAtIndex:indexPath.row];
    [cell setData:model];
    
    return cell;
}

#pragma mark - cell代理方法
- (void)deleteMember:(TanTableViewCell *)cell{
    NSIndexPath *path = [self.tableView indexPathForCell:cell]; //获取cell所在位置
    //删除数组中数据
    [self.dataArr removeObjectAtIndex:path.row];
    //删除单元格
    [self.tableView deleteRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationLeft];
}

//关闭其他cell
- (void) closeOtherCellLeftPan:(TanTableViewCell *)cell{
    for (TanTableViewCell *item in self.tableView.visibleCells) {
        if (item != cell) [item closeLeftPan];
    }
}

#pragma mark - 自定义事件
- (void)refreshTableView: (UIRefreshControl *)sender{
    
    //模拟获取最新数据
    [self.dataArr removeAllObjects]; //清空数据
    [self.dataArr addObjectsFromArray:[self getMemberData]]; //从新加载数据
    
    [sender endRefreshing]; //停止刷新
    
    [self.tableView reloadData]; //加载
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
