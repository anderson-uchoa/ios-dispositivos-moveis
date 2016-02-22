//
//  CirculoView.m
//  
//
//  Created by Anderson Uchôa on 21/02/16.
//
//

#import "CirculoView.h"

@interface CirculoView ()

@end

@implementation CirculoView


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"Recebido touchesBegan");
    
}


-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (!circulos) {
        circulos = [[NSMutableArray alloc]init];
    }
    NSLog(@"Recebido touchesEnded. Registrando o ponto de toque");
    UITouch *toque = [touches anyObject];
    CGPoint localizacaoToque = [toque locationInView:self];
    
    // Precisamos encapsular o CGPoint dentro dentro de um NSValue
    // o CGPoint não é um objeto propriamente dito
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
