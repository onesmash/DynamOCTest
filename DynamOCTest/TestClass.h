//
//  TestClass.h
//  DynamOCTest
//
//  Created by Xuhui on 13/02/2017.
//  Copyright © 2017 hui xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject

//- (NSString *)echo:(NSInteger)x;

+ (void)blockTest:(NSString*(^)(NSString *))block;

@end
