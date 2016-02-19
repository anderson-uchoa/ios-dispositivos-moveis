//
//  ViewController.m
//  NavigationControllerDemo
//
//  Created by Anderson Uchôa on 19/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import "RootController.h"
#import "AdicionarController.h"
#import "ConfiguracoesController.h"

@interface RootController ()

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (IBAction)abrirAdicionar:(id)sender {
    
    AdicionarController *c = [[AdicionarController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}

- (IBAction)abrirConfiguracoes:(id)sender {
    ConfiguracoesController *c = [[ConfiguracoesController alloc] init];
    [self.navigationController pushViewController:c animated:YES];
    
}
@end
