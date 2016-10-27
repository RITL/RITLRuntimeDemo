//
//  main.m
//  RITLRuntimeModel
//
//  Created by YueWen on 2016/10/27.
//  Copyright © 2016年 YueWen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RITLPeople.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary * paramDict = @{
                                     @"name":@"Yue",
                                     @"age":@22,
                                     @"occupation":@"Pragmmer",
                                     @"nationality":@"China"
                                     };
        
        RITLPeople * people = [[RITLPeople alloc]initWithDictionart:paramDict];
        
        NSLog(@"I am %@ , I am %@ years old, I am %@, Country:%@",people.name,people.age,people.occupation,people.nationality);
        
        
        NSDictionary * peopleDictioary = [people coverToDicationary];
        
        NSLog(@"peopleDictionary = %@",peopleDictioary);
        
    }
    return 0;
}
