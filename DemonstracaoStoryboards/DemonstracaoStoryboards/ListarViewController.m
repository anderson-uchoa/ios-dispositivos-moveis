//
//  ListarViewController.m
//  
//
//  Created by Anderson Uchôa on 19/02/16.
//
//

#import "ListarViewController.h"
#import "DetalhesViewController.h"

@interface ListarViewController ()

@end

@implementation ListarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)abrirEditarScene:(id)sender {
    
    //direciona para a segue listar
[self performSegueWithIdentifier:@"listarParaEditarSegue"
                              sender:sender];
    
}

- (IBAction)abrirDetalhesScene:(id)sender {
    
[self performSegueWithIdentifier:@"listarParaDetalhesSegue"
                              sender:sender];
    
}


// Obs: não esqueça de importar o arquivo "%%DetalhesViewController.h%%"
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"listarParaDetalhesSegue"]) {
        DetalhesViewController *dc = segue.destinationViewController;
        dc.descricaoDetalhes = @"Conteúdo vindo da tela de listagem";
    }
}

@end
