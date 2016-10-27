//
//  RITLPeople.h
//  RITLRuntime
//
//  Created by YueWen on 2016/10/27.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface RITLPeople : NSObject <NSCoding>

/// 姓名
@property (nonatomic, copy) NSString * name;

/// 年龄
@property (nonatomic, assign)NSUInteger age;

/// 职业
@property (nonatomic, copy) NSString * occupation;

/// 国籍
@property (nonatomic, copy) NSString * nationality;

@end

NS_ASSUME_NONNULL_END
