//
//  ViewController.m
//  Catalogo Empresa
//
//  Created by Anderson Uchôa on 18/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import "ViewController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.avisoSucessoLabel.hidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementadorAlterado:(id)sender {
    // sender é quem enviou
    // id pode ser lido como qualquer coisa
    //converte o sender para o tipo UIStepper
      //converte para string o valor numero da propriedade value e insere no texfield
    UIStepper *incrementador = (UIStepper *)sender;
  
    self.quantidadeField.text = [NSString stringWithFormat:@"%d",
                                 (int)incrementador.value];
}

- (IBAction)salvar:(id)sender {
    
    Empresa *e = [[Empresa alloc] init];
    e.nome = self.nomeField.text;
  
    //liberar teclado
    [self.nomeField resignFirstResponder];
    
    e.quantidadeFuncionarios = [self.quantidadeField.text intValue];
    NSLog(@"Empresa criada. Nome=%@, funcionários=%d",
          e.nome, e.quantidadeFuncionarios);
   
    //inserindo animacao do label avisosSucesso
    self.avisoSucessoLabel.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
        self.avisoSucessoLabel.hidden = NO;
        self.avisoSucessoLabel.alpha = 1;
    }completion:^(BOOL finalizado) {
        [UIView animateWithDuration:1 delay:1 options:0 animations:^{
            self.avisoSucessoLabel.alpha=0;
        } completion:^(BOOL finalizado) {
            self.avisoSucessoLabel.hidden = YES;
        }];
    }];
    
}
@end
