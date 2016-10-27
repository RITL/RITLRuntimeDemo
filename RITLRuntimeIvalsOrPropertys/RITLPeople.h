//
//  RITLPeople.h
//  RITLRuntime
//
//  Created by YueWen on 2016/10/27.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RITLPeople : NSObject
{
    NSString * _occupation;//职业
    NSString * _nationality;//国家
}

/// 姓名
@property (nonatomic, copy) NSString * name;

/// 年龄
@property (nonatomic, assign)NSUInteger age;

/// 所有的属性
- (NSDictionary *)allPropertys;

/// 所有的成员变量
- (NSDictionary *)allIvars;

/// 所有的方法
- (NSDictionary *)allMethods;

@end

NS_ASSUME_NONNULL_END
