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

+ (void)blockTest:(CGSize(^)(NSString *))block
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^() {
        CGSize size = block(@"fuck");
        NSLog(@"%f, %f", size.width, size.height);
    });
}

- (BOOL)boolTest
{
    return [(NSString *)nil isEqualToString:@"action"];
}

- (NSString *)stringTest
{
    return nil;
}
@end
