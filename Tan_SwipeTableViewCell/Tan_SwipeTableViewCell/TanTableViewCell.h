//
//  TanTableViewCell.h
//  Tan_SwipeTableViewCell
//
//  Created by PX_Mac on 16/3/25.
//  Copyright © 2016年 PX_Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MemberModel;
@class TanTableViewCell;

@protocol TanTableViewCellDelegate <NSObject>

@optional
- (void)deleteMember: (TanTableViewCell *)cell; //协议方法：删除会员
- (void)closeOtherCellLeftSwipe;  //关闭其他单元格的左滑

@end

@interface TanTableViewCell : UITableViewCell

//静态构造方法
+ (instancetype)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong) MemberModel *model; //模型属性
@property (nonatomic, weak) id<TanTableViewCellDelegate> delegate; //代理

- (void)setData: (MemberModel *)model; //设置要显示的数据
- (void)closeSwipe; //关闭滑动，恢复原样（用于在滑动当前单元格时，把其他已经左滑的单元格关闭）

@end
