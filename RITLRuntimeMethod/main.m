//
//  main.m
//  RITLRuntimeMethod
//
//  Created by YueWen on 2016/10/28.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RITLPeople.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        RITLPeople * people = [RITLPeople new];
        
        people.name = @"Yue";
        [people speakEnglish];
    }
    return 0;
}
