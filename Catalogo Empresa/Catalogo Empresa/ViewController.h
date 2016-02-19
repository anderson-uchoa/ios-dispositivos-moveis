//
//  ViewController.h
//  Catalogo Empresa
//
//  Created by Anderson Uchôa on 18/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nomeField;
@property (weak, nonatomic) IBOutlet UITextField *quantidadeField;
@property (weak, nonatomic) IBOutlet UILabel *avisoSucessoLabel;

- (IBAction)incrementadorAlterado:(id)sender;
- (IBAction)salvar:(id)sender;


@end

