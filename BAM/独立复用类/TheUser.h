//
//  TheUser.h
//  QuanQiuBang
//
//  Created by 橙晓侯 on 16/1/6.
//  Copyright © 2016年 小马网络. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseObj.h"

@interface TheUser : BaseObj

/** 登录状态 */
@property (nonatomic, assign) BOOL isLogin;
/** ID (uid) */
@property (strong, nonatomic) NSString *ID;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *mobile;
@property (nonatomic, strong) NSString *headImg;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *userName;
@property (strong, nonatomic) NSString *schoolName;

//========================== 以下方法是给单例USER用的，其余用户不要调用这些方法 ==========================

+ (TheUser *)user;
/** 退出并清空账号缓存 */
- (void)cleanTheLoginDataAndLogout;
//- (void)cleanUserDataAndLogout __attribute__((deprecated("Use cleanTheLoginDataAndLogout instead.「方法名表述有歧义」")));
/** 退出登录 不清空账号密码 */
- (void)logout;
/** 清空全部属性 */
- (void)cleanUserData;
/** 从缓存加载用户数据 */
- (BOOL)loadUserDataFromCache;
/** 缓存用户属性 */
- (void)cacheUserData;
/** 获取缓存的用户对象 */
- (TheUser *)getCacheUser;
/** 清空缓存的用户数据 */
- (void)cleanUserCacheData;
/** 是否置顶 */
- (BOOL)isTop;
@end
