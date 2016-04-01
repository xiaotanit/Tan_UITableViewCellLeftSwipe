//
//  MemberModel.h
//  Tan_SwipeTableViewCell
//
//  Created by PX_Mac on 16/3/26.
//  Copyright © 2016年 PX_Mac. All rights reserved.
//  会员信息

#import <Foundation/Foundation.h>

//屏幕宽度
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface MemberModel : NSObject

@property (nonatomic, assign) int ID; //会员ID
@property (nonatomic, copy) NSString *displayname; //会员显示的名字
@property (nonatomic, copy) NSString *email; //会员邮箱
@property (nonatomic, copy) NSString *phone; //会员手机号码

+ (instancetype)memberWithID: (int)ID displayname: (NSString *)name email: (NSString *)email phone: (NSString *)phone;

@end
