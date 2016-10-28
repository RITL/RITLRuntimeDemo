//
//  RITLPeople.h
//  RITLRuntime
//
//  Created by YueWen on 2016/10/28.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 动态决议的类
@interface RITLPeople : NSObject

/// 姓名
@property (nonatomic, copy) NSString * name;

//function 
- (void)speakEnglish;

@end

NS_ASSUME_NONNULL_END
