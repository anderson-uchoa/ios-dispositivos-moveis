//
//  ViewController.m
//  TapCirculos
//
//  Created by Anderson Uchôa on 22/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import "ViewController.h"
#import "TapCirculoView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) loadView {
    TapCirculoView *c = [[TapCirculoView alloc] init];
    c.backgroundColor = [UIColor whiteColor];
    self.view = c;
}

@end
