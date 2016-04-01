//
//  ViewController.m
//  Tan_SwipeCellBlock
//
//  Created by PX_Mac on 16/3/30.
//  Copyright © 2016年 PX_Mac. All rights reserved.

//  自定义UITableViewCell左滑多菜单功能，使用Block进行回调

#import "ViewController.h"
#import "MemberModel.h"
#import "TanTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tablView;
@property (nonatomic, strong) NSMutableArray *dataArr; //模型数据集

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //初始化数据
    self.dataArr = [NSMutableArray arrayWithArray:[self getMemberData]];
    
    //初始化tableView
    self.tablView.dataSource = self;
    self.tablView.rowHeight = 60.f;
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

#pragma mark - 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TanTableViewCell *cell = [TanTableViewCell cellWithTableView:tableView];
    
    MemberModel *model = [self.dataArr objectAtIndex:indexPath.row];
    [cell setData:model]; //设置数据
    
    __weak typeof(self) tempSelf = self;
    __weak typeof(cell) tempCell = cell;
    
    //设置删除cell回调block
    cell.deleteMember = ^{
        NSIndexPath *tempIndex = [tempSelf.tablView indexPathForCell:tempCell];
        [tempSelf.dataArr removeObject:tempCell.model];
        [tempSelf.tablView deleteRowsAtIndexPaths:@[tempIndex] withRowAnimation:UITableViewRowAnimationLeft];
    };
    
    //设置当cell左滑时，关闭其他cell的左滑
    cell.closeOtherCellSwipe = ^{
        for (TanTableViewCell *item in tempSelf.tablView.visibleCells) {
            if (item != tempCell) [item closeLeftSwipe];
        }
    };
    
    return cell;
}

//刷新数据
- (IBAction)refreshData:(UIButton *)sender{
    [self.dataArr removeAllObjects]; //先清空数据
    self.dataArr = [NSMutableArray arrayWithArray:[self getMemberData]];
    [self.tablView reloadData]; //重载数据
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
