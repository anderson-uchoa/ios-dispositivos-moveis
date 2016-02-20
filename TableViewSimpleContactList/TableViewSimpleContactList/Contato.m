//
//  NSObject+Contato.m
//  
//
//  Created by Anderson Uchôa on 20/02/16.
//
//

#import "Contato.h"

@implementation Contato

-(id) initWithNome:(NSString *) nomeInicial andTelefone:(NSString *)telefoneInicial {

    if ((self = [super init])) {
        self.nome = nomeInicial;
        self.telefone = telefoneInicial;
        
    }
    return self;
}

@end
