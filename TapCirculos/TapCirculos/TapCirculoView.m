//
//  TapCirculoView.m
//  
//
//  Created by Anderson Uchôa on 22/02/16.
//
//

#import "TapCirculoView.h"

@implementation TapCirculoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(id)init{
   
    if ((self = [super init])) {
        [self registraEventos];
    }
    return self;
}


-(void)registraEventos{
    UITapGestureRecognizer *toque = [[UITapGestureRecognizer alloc]
                                     initWithTarget:self action:@selector(toqueRecebido:)];
    toque.numberOfTapsRequired = 1; // Valor padrão é 1
    [self addGestureRecognizer:toque];
    
    
}


-(void)toqueRecebido:(UIGestureRecognizer*)gesto{
    if (!circulos) {
    circulos = [[NSMutableArray alloc] init];
    }
    
    CGPoint localizacaoToque = [gesto locationInView:self];
    [circulos addObject:[NSValue valueWithCGPoint:localizacaoToque]];
    [self setNeedsDisplay];
    
    }

-(void)drawRect:(CGRect)rect{
    
    CGContextRef contexto = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contexto, 2.0);
    CGColorRef corFundo = [UIColor redColor].CGColor;
    CGContextSetFillColor(contexto, CGColorGetComponents(corFundo));
    int tamanho = 25;
    for (NSValue *item in circulos) {
        CGPoint ponto = [item CGPointValue];
        CGRect regiao = CGRectMake(ponto.x, ponto.y, tamanho, tamanho);
        CGContextAddEllipseInRect(contexto, regiao);
        CGContextFillEllipseInRect(contexto, regiao);
    }
    CGContextStrokePath(contexto);
}





@end
