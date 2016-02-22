//
//  ViewController.h
//  VisualizadorImagens
//
//  Created by Anderson Uchôa on 20/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property(retain, nonatomic) NSMutableArray *imagens;
@property(retain, nonatomic) NSArray *elementos;

@property (weak, nonatomic) IBOutlet UIScrollView *scroll;


@end

