//
//  UserInfo.h
//  ZPFProject
//
//  Created by 周鹏飞 on 2019/1/31.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UserGender) {
    UserGenderIsUnKnow = 0,
    UserGenderIsMale,   //男
    UserGenderIsFemale  //女
};

@interface UserInfo : NSObject

/** 用户ID*/
@property (nonatomic, assign) long long userId;

/** 展示用的用户ID*/
@property (nonatomic, copy) NSString *idCard;

/** 头像*/
@property (nonatomic, copy) NSString *photo;

/** 昵称*/
@property (nonatomic, copy) NSString *nickName;

/** 性别*/
@property (nonatomic, assign) UserGender sex;

/** 用户等级*/
@property (nonatomic, assign) NSInteger degreeID;

/** 个性签名*/
@property (nonatomic, copy) NSString *signature;

/** 用户登录后分配的token*/
@property (nonatomic, copy) NSString *token;

@end

NS_ASSUME_NONNULL_END
