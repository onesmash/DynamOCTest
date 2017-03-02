//
//  TestClass.m
//  DynamOCTest
//
//  Created by Xuhui on 13/02/2017.
//  Copyright © 2017 hui xu. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

//- (NSString *)echo:(NSInteger)x
//{
//    return @"hello";
//}

- (void)dealloc
{
    
}

+ (void)blockTest:(NSString*(^)(NSString *))block
{
    //NSLog(@"%@", block(@"fuck"));
    dispatch_async(dispatch_get_global_queue(0, 0), ^() {
        NSLog(@"%@", block(@"fuck"));
    });
}

@end
