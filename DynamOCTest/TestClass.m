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

+ (void)blockTest:(NSString*(^)(NSString *))block
{
    [block copy];
    NSLog(@"%@", block(@"fuck"));
}

@end
