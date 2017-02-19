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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LuaContext *context = get_luacontext();
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"lua"];
    [context evaluateScript:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil]];
    TestClass *test = [[TestClass alloc] init];
    NSString *x = [test echo:100];
    NSLog(@"%@", x);
    x = [test echo:200];
    NSLog(@"%@", x);
    dispatch_async(dispatch_get_global_queue(0, 0), ^() {
        NSString *x = [test echo:300];
        NSLog(@"%@", x);
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
