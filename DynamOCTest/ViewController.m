//
//  ViewController.m
//  DynamOCTest
//
//  Created by Xuhui on 12/02/2017.
//  Copyright © 2017 hui xu. All rights reserved.
//

#import "ViewController.h"
#import <LuaContext.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LuaContext *context = get_luacontext();
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
