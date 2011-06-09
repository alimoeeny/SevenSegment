//
//  SevenSegmentDigit.m
//  SevenSegmentDemo
//
//  Created by Ali Moeeny on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SevenSegmentDigit.h"

@implementation SevenSegmentDigit

@synthesize digit;
@synthesize dotIsOn;
@synthesize mainColor;

+ (CGColorSpaceRef)genericRGBSpace
{ 
	static CGColorSpaceRef space = NULL; 
	if (space == NULL) 
	{ 
		space = CGColorSpaceCreateDeviceRGB();
	} 
	return space; 
} 

+ (CGColorRef)redColor
{ 
	static CGColorRef red = NULL; 
	if (red == NULL) 
	{ 
		CGFloat values[4] = {1.0, 0.0, 0.0, 1.0}; 
		red = CGColorCreate([self genericRGBSpace], values); 
	} 
	return red; 
} 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) SSSetContextColorsFor:(NSNumber *) dig with:(NSArray *) onDigits inContext:(CGContextRef) context
{
    if ([onDigits indexOfObject:dig]==NSNotFound)
    {
        CGContextSetStrokeColorWithColor(context, [[UIColor colorWithWhite:0.5f alpha:0.5] CGColor]);
        CGContextSetFillColorWithColor(context, [[UIColor colorWithWhite:0.2f alpha:1.0f] CGColor]);        
    }
    else
    {
        CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
        CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0.8f green:0.0f blue:0.0f alpha:0.5] CGColor]);
    }      

}

- (void) setDigit:(NSNumber *)newDigit
{
    digit = newDigit;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    if (!digit) digit = [NSNumber numberWithInt:0];
    CGFloat hx = 30.5f;
    CGFloat hy = 10.0f;
    CGFloat hz = 60.0f;
    CGFloat vOffSet = 80.0f;
    CGFloat hOffSet = 80.0f;
    CGFloat filler = 1.5f;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextClearRect(context, [self frame]);

    CGContextSetStrokeColorWithColor(context, [SevenSegmentDigit redColor]);
    CGContextSetFillColorWithColor(context, [[UIColor purpleColor] CGColor]);
    
    CGContextBeginPath(context);

    NSArray * one = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], [NSNumber numberWithInt:6], [NSNumber numberWithInt:8], [NSNumber numberWithInt:9], [NSNumber numberWithInt:0], nil]; 
    [self SSSetContextColorsFor:digit  with:one inContext:context];
    //1
    CGContextMoveToPoint   (context, hx - filler      , hx + filler);
    CGContextAddLineToPoint(context, hx + hy - filler , hx + hy + filler);
    CGContextAddLineToPoint(context, hx + hy - filler , hx + hy + hz + filler);
    CGContextAddLineToPoint(context, hx - filler      , hx + hy + hz + hy + filler);
    CGContextAddLineToPoint(context, hx - hy - filler , hx + hy + hz + filler);    
    CGContextAddLineToPoint(context, hx - hy - filler , hx + hy + filler);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);

    NSArray * two = [NSArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:5], [NSNumber numberWithInt:6], [NSNumber numberWithInt:7], [NSNumber numberWithInt:8], [NSNumber numberWithInt:9], [NSNumber numberWithInt:0], nil]; 
    [self SSSetContextColorsFor:digit  with:two inContext:context];
    //2
    CGContextMoveToPoint   (context, hx + filler               , hx - filler);
    CGContextAddLineToPoint(context, hx + hy + filler          , hx + hy - filler);
    CGContextAddLineToPoint(context, hx + hy + hz + filler     , hx + hy - filler);
    CGContextAddLineToPoint(context, hx + hy + hz + hy + filler, hx - filler);
    CGContextAddLineToPoint(context, hx + hy + hz + filler     , hx - hy - filler);    
    CGContextAddLineToPoint(context, hx + hy + filler          , hx - hy - filler);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * three = [NSArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:7], [NSNumber numberWithInt:8], [NSNumber numberWithInt:9], [NSNumber numberWithInt:0], nil]; 
    [self SSSetContextColorsFor:digit  with:three inContext:context];
    //3
    CGContextMoveToPoint   (context, hx + hOffSet  + filler * 2    , hx + filler);
    CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 2, hx + hy + filler);
    CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 2, hx + hy + hz + filler);
    CGContextAddLineToPoint(context, hx + hOffSet + filler * 2     , hx + hy + hz + hy + filler);
    CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 2, hx + hy + hz + filler);    
    CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 2, hx + hy + filler);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * four = [NSArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], [NSNumber numberWithInt:6], [NSNumber numberWithInt:8], [NSNumber numberWithInt:9], nil]; 
    [self SSSetContextColorsFor:digit  with:four inContext:context];
    //4
    CGContextMoveToPoint   (context, hx                , hx + vOffSet + filler * 2);
    CGContextAddLineToPoint(context, hx + hy           , hx + hy + vOffSet + filler * 2);
    CGContextAddLineToPoint(context, hx + hy + hz      , hx + hy + vOffSet + filler * 2);
    CGContextAddLineToPoint(context, hx + hy + hz + hy , hx + vOffSet + filler * 2);
    CGContextAddLineToPoint(context, hx + hy + hz      , hx - hy + vOffSet + filler * 2);    
    CGContextAddLineToPoint(context, hx + hy           , hx - hy + vOffSet + filler * 2);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * five = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:2], [NSNumber numberWithInt:6],  [NSNumber numberWithInt:8], [NSNumber numberWithInt:0], nil]; 
    [self SSSetContextColorsFor:digit  with:five inContext:context];
    //5
    CGContextMoveToPoint   (context, hx - filler, hx + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx + hy - filler, hx + hy + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx + hy - filler, hx + hy + hz + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx - filler, hx + hy + hz + hy + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx - hy - filler, hx + hy + hz + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx - hy - filler, hx + hy + vOffSet + filler * 3);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * six = [NSArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:3], [NSNumber numberWithInt:5], [NSNumber numberWithInt:6], [NSNumber numberWithInt:8], [NSNumber numberWithInt:9], [NSNumber numberWithInt:0], nil]; 
    [self SSSetContextColorsFor:digit  with:six inContext:context];
    //6
    CGContextMoveToPoint   (context, hx, hx + vOffSet * 2 + filler * 4);
    CGContextAddLineToPoint(context, hx + hy, hx + hy + vOffSet * 2 + filler * 4);
    CGContextAddLineToPoint(context, hx + hy + hz, hx + hy + vOffSet * 2 + filler * 4);
    CGContextAddLineToPoint(context, hx + hy + hz + hy, hx + vOffSet * 2 + filler * 4);
    CGContextAddLineToPoint(context, hx + hy + hz, hx - hy + vOffSet * 2 + filler * 4);
    CGContextAddLineToPoint(context, hx + hy, hx - hy + vOffSet * 2 + filler * 4);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * seven = [NSArray arrayWithObjects:[NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], [NSNumber numberWithInt:6], [NSNumber numberWithInt:7], [NSNumber numberWithInt:8], [NSNumber numberWithInt:9], [NSNumber numberWithInt:0], nil]; 
    [self SSSetContextColorsFor:digit  with:seven inContext:context];
    //7
    CGContextMoveToPoint   (context, hx + hOffSet  + filler * 2    , hx + vOffSet  + filler * 3);
    CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 2, hx + hy + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 2, hx + hy + hz + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx + hOffSet + filler * 2     , hx + hy + hz + hy + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 2, hx + hy + hz + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 2, hx + hy + vOffSet + filler * 3);
    CGContextClosePath(context);    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextFlush(context);
    
}


@end
