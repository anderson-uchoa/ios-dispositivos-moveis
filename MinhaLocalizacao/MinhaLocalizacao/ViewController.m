//
//  ViewController.m
//  MinhaLocalizacao
//
//  Created by Anderson Uchôa on 22/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapa.showsUserLocation = YES;
    self.mapa.delegate = self;


    // Adiciona ao mapa o gesto de toque longo
    UILongPressGestureRecognizer *toqueLongoMapa =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(adicionaPino:)];
    toqueLongoMapa.minimumPressDuration = 0.5;
    [self.mapa addGestureRecognizer:toqueLongoMapa];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)pino{
        NSLog(@"Pino %@ selecionado", pino);

}


- (void) mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views{
 
    
    //distancia em metros
    MKAnnotationView *v = [views objectAtIndex:0];
    
    //definindo regiao do zoom
    CLLocationDistance distancia = 400;
    MKCoordinateRegion regiao = MKCoordinateRegionMakeWithDistance(
                                                                   [v.annotation coordinate], distancia, distancia);
    [self.mapa setRegion:regiao animated:YES];
    
    
}





-(void) adicionaPino:(UIGestureRecognizer*) gesto{
    
    if (gesto.state == UIGestureRecognizerStateBegan) {
       
        // pega o ponto no mapa pelo gesto
        CGPoint ponto = [gesto locationInView:self.view];
       
        //converta o ponto em coordenadas
        CLLocationCoordinate2D coordenadas =
        [self.mapa convertPoint:ponto toCoordinateFromView:self.mapa];
        //adciona o pino no mapa de acordo com as coordenadas
        MKPointAnnotation *pino = [[MKPointAnnotation alloc] init];
        pino.coordinate = coordenadas;
        [self.mapa addAnnotation:pino];
    }
    
}

@end
