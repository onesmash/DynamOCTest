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
    NSLog(@"%@", selectorStringFromMethodNameWithUnderscores("x____xt_x"));
    printf("%s", @encode(CGRect));
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    LuaContext *context = [LuaContext currentContext];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"lua"];
    NSError *error;
    [context evaluateScript:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil] error:&error];

    [self.tableView registerClass:NSClassFromString(@"ImageCell") forCellReuseIdentifier:@"ImageCell"];
//    TestClass *test = [[TestClass alloc] init];
//    NSDate *start = [NSDate date];
//    for (NSInteger i = 0; i < 10000; i++) {
//        [test performSelector:@selector(echo) withObject:nil];
//    }
//    NSDate *end = [NSDate date];
//    NSLog(@"time: %f", [end timeIntervalSinceDate:start]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"native call numberOfRowsInSection");
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"native call cellForRowAtIndexPath");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
    [cell performSelector:@selector(refreshImage)];
    return cell;
}

@end
