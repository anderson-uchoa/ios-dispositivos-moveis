//
//  ViewController.m
//  HelloWorld
//
//  Created by Anderson Uchôa on 18/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import "ViewController.h"

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
- (IBAction)btnEnviar:(id)sender {
    _labelResultado.text=_txtFieldName.text;
}
@end