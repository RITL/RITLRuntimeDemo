//
//  main.m
//  RITLRuntimeForwardMethod
//
//  Created by YueWen on 2016/10/28.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RITLDog.h"
#import <objc/objc-runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        RITLDog * dog = [[RITLDog alloc]init];
        
        dog.name = @"道哥";
        
        //sendmsg
        ((void(*)(id,SEL))objc_msgSend)((id)dog,@selector(speakEnglish));
        
    }
    return 0;
}
