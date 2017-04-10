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

extern NSString *selectorStringFromMethodNameWithUnderscores(const char *name);

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", selectorStringFromMethodNameWithUnderscores("x_xt_x"));
    
    LuaContext *context = get_current_luacontext();
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"lua"];
    [context evaluateScript:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil]];
   
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
    TestClass *test = [[TestClass alloc] init];
    NSDate *start = [NSDate date];
    for (NSInteger i = 0; i < 10000; i++) {
        [test performSelector:@selector(echo) withObject:nil];
    }
    NSDate *end = [NSDate date];
    NSLog(@"time: %f", [end timeIntervalSinceDate:start]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

@end
