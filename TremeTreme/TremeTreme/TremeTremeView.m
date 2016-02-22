//
//  TremeTremeView.m
//  
//
//  Created by Anderson Uchôa on 22/02/16.
//
//

#import "TremeTremeView.h"

@implementation TremeTremeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(id)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])) {
        [self enfeitaView];
        [self registraGestos];
    }
    return self;
}

@end
