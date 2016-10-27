//
//  main.m
//  RITLRuntimeIvalsOrPropertys
//
//  Created by YueWen on 2016/10/27.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#define define_Associated

#import <Foundation/Foundation.h>

#ifndef define_Associated
#import "RITLPeople.h"
#else
#import "RITLPeople+Associated.h"
#endif



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //instance
        RITLPeople * people = [RITLPeople new];
        
        //set property
        people.name = @"Yue";
        people.age = 22;
        
        //set ivar
        [people setValue:@"Pragrammer" forKey:@"occupation"];
        
        
#ifdef define_Associated
        
        //set property in the category
        people.associatedBust = @(80);
        
        people.associatedBlock = ^(){
            
            NSLog(@"People should associated");
            
        };
        
        //
        people.associatedBlock();
        
#endif
        
        
        
        //print properties
        NSDictionary * properties = [people allPropertys];
        
        for (NSString * key in [properties allKeys])
        {
            NSLog(@"PropertyName %@ = %@",key,[properties valueForKey:key]);
        }
        
        NSLog(@"\n");
        
        
        //print ivars
        NSDictionary * ivars = [people allIvars];
        
        for (NSString * key in ivars)
        {
            NSLog(@"ivarName %@ = %@",key,[ivars valueForKey:key]);
        }
        
        NSLog(@"\n");
        
        
        //print method
        NSDictionary * methods = [people allMethods];
        
        for (NSString * key in methods)
        {
            NSLog(@"methodName %@,argumentsCount = %@",key,[methods valueForKey:key]);
        }
        
    }
    return 0;
}
