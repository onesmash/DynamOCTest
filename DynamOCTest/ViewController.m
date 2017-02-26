//
//  ViewController.m
//  DynamOCTest
//
//  Created by Xuhui on 12/02/2017.
//  Copyright © 2017 hui xu. All rights reserved.
//

#import "ViewController.h"
#import "TestClass.h"
#import <LuaContext.h>
#import <DynamBlock.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    DynamBlock *block = [[DynamBlock alloc] initWithBlock:^(id obj, NSUInteger index, BOOL *stop){
//        NSLog(@"%@ %zd", obj, index);
//    }];
//    NSArray *array = [NSArray arrayWithObject:@"test"];
//    [array enumerateObjectsUsingBlock:(id)block];
    
//    NSLog([block signature]);
    LuaContext *context = get_luacontext();
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"lua"];
    [context evaluateScript:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil]];
//    TestClass *test = [[TestClass alloc] init];
//    NSLog([test performSelector:@selector(echo:) withObject:@(100)]);
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
