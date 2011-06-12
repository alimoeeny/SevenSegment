//
//  PlusButton.m
//  SevenSegmentDemo
//
//  Created by Ali Moeeny on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlusButton.h"

@implementation PlusButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGFloat w = CGRectGetWidth([self frame]);
    //NSLog(@"w : %f", w);
    CGFloat h = CGRectGetHeight([self frame]);
    //NSLog(@"h : %f", h);
    CGFloat padding = (h + w) * 0.5f * 0.1f;
    //NSLog(@"padding : %f", padding);
    CGFloat hx = (w / 2.0f) - (padding);
    //NSLog(@"hx : %f", hx);
    CGFloat hy = (h / 2.0f) - (padding);
    //NSLog(@"hy : %f", hy);
    CGFloat thickness = hy / 2.0;
    //NSLog(@"thickness : %f", thickness);

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextClearRect(context, [self frame]);
    
    CGContextSetStrokeColorWithColor(context, [[UIColor cyanColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    
    CGContextBeginPath(context);
    
    //+
    CGContextMoveToPoint   (context, padding + hx - thickness / 2.0f, padding);
    CGContextAddLineToPoint(context, padding + hx + thickness / 2.0f, padding);
    CGContextAddLineToPoint(context, padding + hx + thickness / 2.0f, padding + hy - thickness / 2.0f);
    CGContextAddLineToPoint(context, padding + hx * 2.0f            , padding + hy - thickness / 2.0f);
    CGContextAddLineToPoint(context, padding + hx * 2.0f            , padding + hy + thickness / 2.0f);    
    CGContextAddLineToPoint(context, padding + hx + thickness / 2.0f, padding + hy + thickness / 2.0f);    
    CGContextAddLineToPoint(context, padding + hx + thickness / 2.0f, padding + hy * 2.0f);        
    CGContextAddLineToPoint(context, padding + hx - thickness / 2.0f, padding + hy * 2.0f);        
    CGContextAddLineToPoint(context, padding + hx - thickness / 2.0f, padding + hy + thickness / 2.0f);        
    CGContextAddLineToPoint(context, padding                        , padding + hy + thickness / 2.0f);        
    CGContextAddLineToPoint(context, padding                        , padding + hy - thickness / 2.0f);        
    CGContextAddLineToPoint(context, padding + hx - thickness / 2.0f, padding + hy - thickness / 2.0f);            
    CGContextAddLineToPoint(context, padding + hx - thickness / 2.0f, padding);            
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);

    
//    CGContextMoveToPoint(context, hx * 2.5 + hOffSet + hy, hx * 1.5 + hy + hz + vOffSet);
//    CGContextAddArc(context, hx * 2.5 + hOffSet , hx * 1.5 + hy + hz + vOffSet, hy, 0, -6.28, 1);
//    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextFlush(context);
    
}

@end
