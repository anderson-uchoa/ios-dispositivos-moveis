//
//  ViewController.h
//  ExemploDownload
//
//  Created by Anderson Uchôa on 19/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *downloadField;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
- (IBAction)startDownload:(id)sender;


@end

