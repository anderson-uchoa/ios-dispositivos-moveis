//
//  ViewController.h
//  MinhaLocalizacao
//
//  Created by Anderson Uchôa on 22/02/16.
//  Copyright (c) 2016 Anderson Uchôa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapa;


@end

