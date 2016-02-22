//
//  ViewController.m
//  ViewTouchEventEx1
//
//  Created by Anderson Uchôa on 21/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import "ViewController.h"
#import "CirculoView.h"

@interface ViewController ()

@end

@implementation ViewController



-(void) loadView {
    CirculoView *c = [[CirculoView alloc] init];
    c.backgroundColor = [UIColor whiteColor];
    self.view = c;
}




@end
