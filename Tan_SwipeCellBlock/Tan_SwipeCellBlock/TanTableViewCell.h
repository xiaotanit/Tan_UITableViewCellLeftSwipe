//
//  TanTableViewCell.h
//  Tan_SwipeTableViewCell
//
//  Created by PX_Mac on 16/3/25.
//  Copyright © 2016年 PX_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MemberModel;

@interface TanTableViewCell : UITableViewCell

//静态构造方法
+ (instancetype)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong) MemberModel *model; //模型属性
- (void)setData: (MemberModel *)model; //设置要显示的数据

@property (nonatomic, copy) void (^deleteMember)(); //删除会员block回调方法
@property (nonatomic, copy) void (^closeOtherCellSwipe)(); //关闭其他cell的左滑

- (void)closeLeftSwipe; //关闭左滑

@end
