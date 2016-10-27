//
//  main.m
//  RITLRuntimeIvalsOrPropertys
//
//  Created by YueWen on 2016/10/27.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RITLPeople.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //instance
        RITLPeople * people = [RITLPeople new];
        
        //set property
        people.name = @"Yue";
        people.age = 22;
        
        //set ivar
        [people setValue:@"Pragrammer" forKey:@"occupation"];
        
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
