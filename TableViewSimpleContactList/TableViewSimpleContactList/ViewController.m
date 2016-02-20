//
//  ViewController.m
//  TableViewSimpleContactList
//
//  Created by Anderson Uchôa on 20/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import "ViewController.h"
#import "Contato.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // carregando a lista de contatos quando a tela for inicializada
    [self loadContatos];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



 // metodo obrigatorio  que diz quantas linhas devem ter a tableview
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return contatos.count;
}




// add modal quando a linha da tabela é selecionada
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    Contato * c= [contatos objectAtIndex:indexPath.row];
    NSString *msg = [NSString stringWithFormat:@"Nome: %@\nTelefone: %@", c.nome,c.telefone];
    
    UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:@"Contato" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
     [self.tabelaContatos deselectRowAtIndexPath:indexPath animated:YES];
    
}




//add botao de remover e atualizar a tabela
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [contatos removeObjectAtIndex:indexPath.row];
    [self.tabelaContatos reloadData];
}


// mudando o titulo de delete para remover
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{

    return @"Remover";
}

//implementamos o método do datasource, o qual nos passa o índice do elemento desejado, de tal forma que a célula da table view contenha como texto o nome do contato

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CelulaContatoCacheID = @"CelulaContatoCacheID";
    UITableViewCell *cell = [self.tabelaContatos
                             dequeueReusableCellWithIdentifier:CelulaContatoCacheID];
    if (!cell) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CelulaContatoCacheID];
    }
    Contato *contato = [contatos objectAtIndex:indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}



// Tipo de operação a ser feita. Neste caso em específico,
// queremos permitir apenas a remoção de elementos
// (é possível inserir novos também)

-( UITableViewCellEditingStyle) tableView:(UITableView *) tableView
            editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

//metodo para carregar lista de contatos vindo do dicionario

-(void) loadContatos{
    NSString *plistCaminho = [[NSBundle  mainBundle] pathForResource:@"contatos" ofType:@"plist"];
    NSDictionary *p1 =  [NSDictionary dictionaryWithContentsOfFile:plistCaminho];
 
    NSArray *dados = [p1 objectForKey:@"contatos"];
    contatos  = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in dados) {
        NSString *nome = [item objectForKey:@"nome"];
        NSString *telefone = [item objectForKey:@"telefone"];
        
        Contato * c = [[Contato alloc] initWithNome:nome andTelefone:telefone];
        [contatos addObject:c];
        
    }


}

//Executar quando o usuario tocar  no botao
- (IBAction)botaoEditarTap:(id)sender {

    if ([self.botaoEditar.titleLabel.text isEqualToString:@"Editar"]) {
        [self.tabelaContatos setEditing:YES animated:YES];
        [self.botaoEditar setTitle:@"Pronto" forState:UIControlStateNormal];
    }else{
        
        [self.tabelaContatos setEditing:NO animated:NO];
        [self.botaoEditar setTitle:@"Editar" forState:UIControlStateNormal];
    
        
}

    
}

@end
