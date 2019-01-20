//
//  CustomView.m
//  TabbedApp
//
//  Created by Jenny Chang on 20/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches moved");
    UITouch *touch = touches.anyObject;
    self.panPoint = [touch locationInView:self];
    NSLog(@"%.1f,%.1f",self.panPoint.x,self.panPoint.y);
    
}

@end
