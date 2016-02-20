//
//  NSObject+Contato.h
//  
//
//  Created by Anderson Uchôa on 20/02/16.
//
//

#import <Foundation/Foundation.h>

@interface  Contato : NSObject


-(id) initWithNome:(NSString *)nomeInicial andTelefone:(NSString *) telefoneInicial;

@property (nonatomic,retain) NSString *nome;
@property (nonatomic,retain) NSString *telefone;

@end
