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

/// 姓名
@property (nonatomic, copy) NSString * name;

/// 年龄
@property (nonatomic, strong)NSNumber * age;

/// 职业
@property (nonatomic, copy) NSString * occupation;

/// 国籍
@property (nonatomic, copy) NSString * nationality;


/// 通过字典生成RITLPeople对象
- (instancetype)initWithDictionart:(NSDictionary *)dictionary;


/// 转换成字典
- (NSDictionary *)coverToDicationary;

@end

NS_ASSUME_NONNULL_END
