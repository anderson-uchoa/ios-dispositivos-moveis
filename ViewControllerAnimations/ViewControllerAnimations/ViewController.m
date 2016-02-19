//
//  ViewController.m
//  ViewControllerAnimations
//
//  Created by Anderson Uchôa on 19/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import "ViewController.h"
#import "OpcoesControllerViewController.h"

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


- (void) mostrarControllerComAnimacao: (UIModalTransitionStyle) estilo {
    OpcoesControllerViewController *c = [[OpcoesControllerViewController alloc] init];
    c.modalTransitionStyle = estilo;
    
    [self presentViewController:c animated:YES completion:nil];
    
}


- (IBAction)showDissolver:(id)sender {
    [self mostrarControllerComAnimacao:UIModalTransitionStyleCrossDissolve];
}




- (IBAction)showVertical:(id)sender {
    [self mostrarControllerComAnimacao:UIModalTransitionStyleCoverVertical];
}


- (IBAction)showHorizontal:(id)sender {
    [self mostrarControllerComAnimacao:UIModalTransitionStyleFlipHorizontal];
}

- (IBAction)showPageCurl:(id)sender {
     [self mostrarControllerComAnimacao:UIModalTransitionStylePartialCurl];
}


@end
