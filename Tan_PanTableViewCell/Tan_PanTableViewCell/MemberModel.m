//
//  MemberModel.m
//  Tan_SwipeTableViewCell
//
//  Created by PX_Mac on 16/3/26.
//  Copyright © 2016年 PX_Mac. All rights reserved.
//

#import "MemberModel.h"

@implementation MemberModel

+ (instancetype)memberWithID: (int)ID displayname: (NSString *)name email: (NSString *)email phone: (NSString *)phone{
    MemberModel *model = [[MemberModel alloc] init];
    
    model.ID = ID;
    model.displayname = name;
    model.email = email;
    model.phone = phone;
    return model;
}

@end
