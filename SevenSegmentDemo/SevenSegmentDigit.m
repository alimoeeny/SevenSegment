//
//  SevenSegmentDigit.m
//  SevenSegmentDemo
//
//  Created by Ali Moeeny on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SevenSegmentDigit.h"

@implementation SevenSegmentDigit

@synthesize character;
//@synthesize digit;
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

//- (void) SSSetContextColorsFor:(NSNumber *) dig with:(NSArray *) onDigits inContext:(CGContextRef) context
- (void) SSSetContextColorsFor:(NSString *) chr with:(NSArray *) onDigits inContext:(CGContextRef) context
{
//    if ([onDigits indexOfObject:dig]==NSNotFound)
    if ([onDigits indexOfObject:chr]==NSNotFound)
    {
        CGContextSetStrokeColorWithColor(context, [[UIColor colorWithWhite:0.4f alpha:0.4] CGColor]);
        CGContextSetFillColorWithColor(context, [[UIColor colorWithWhite:0.15f alpha:0.5f] CGColor]);
        CGContextSetShadowWithColor(context, CGSizeMake(1.5f, 1.5f), 10.0, [[UIColor colorWithWhite:1.0f alpha:0.3f] CGColor]);
    }
    else
    {
        CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
        CGContextSetFillColorWithColor(context, [[UIColor colorWithRed:0.8f green:0.0f blue:0.0f alpha:0.5] CGColor]);
        CGContextSetShadowWithColor(context, CGSizeMake(1.5f, 1.5f), 10.0, [[UIColor colorWithRed:0.6f green:0.0f blue:0.1f alpha:1.0f] CGColor]);
    }      

}

//- (void) setDigit:(NSNumber *)newDigit
//{
//    digit = newDigit;
//    [self setNeedsDisplay];
//}

- (void) setCharacter:(NSString *)newCharacter
{
    character = newCharacter;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    //if (!digit) digit = [NSNumber numberWithInt:0];
    if (!character) character = [NSString stringWithString:@"0"];
    CGFloat w = CGRectGetWidth([self frame]);
//    CGFloat h = CGRectGetHeight([self frame]);
    CGFloat hx = w / 7.50f; // /10.0; //30.5f;
    CGFloat hy = hx / 2.0f; // / 3.0f; //10.0f;
    CGFloat hz = hx * 3; // * 2; //60.0f;
    CGFloat vOffSet = hz + 2 * hy; //80.0f;
    CGFloat hOffSet = hz + 2 * hy; //80.0f;
    CGFloat filler = hx * 0.05f; // 1.5f;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextClearRect(context, [self frame]);

    CGContextSetStrokeColorWithColor(context, [SevenSegmentDigit redColor]);
    CGContextSetFillColorWithColor(context, [[UIColor purpleColor] CGColor]);
    
    CGContextBeginPath(context);

//    NSArray * one = [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], [NSNumber numberWithInt:6], [NSNumber numberWithInt:8], [NSNumber numberWithInt:9], [NSNumber numberWithInt:0], nil]; 
//    [self SSSetContextColorsFor:digit  with:one inContext:context];
    NSArray * one = [NSArray arrayWithObjects:@"1", @"4", @"5", @"6", @"8", @"9", @"0", nil]; 
    [self SSSetContextColorsFor:character  with:one inContext:context];
    //1
    CGContextMoveToPoint   (context, hx - filler      , hx + filler);
    CGContextAddLineToPoint(context, hx + hy - filler , hx + hy + filler);
    CGContextAddLineToPoint(context, hx + hy - filler , hx + hy + hz + filler);
    CGContextAddLineToPoint(context, hx - filler      , hx + hy + hz + hy + filler);
    CGContextAddLineToPoint(context, hx - hy - filler , hx + hy + hz + filler);    
    CGContextAddLineToPoint(context, hx - hy - filler , hx + hy + filler);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);

    NSArray * two = [NSArray arrayWithObjects:@"2", @"3", @"5", @"6", @"7", @"8", @"9", @"0", nil]; 
    [self SSSetContextColorsFor:character  with:two inContext:context];
    //2
    CGContextMoveToPoint   (context, hx                , hx - filler);
    CGContextAddLineToPoint(context, hx + hy           , hx + hy - filler);
    CGContextAddLineToPoint(context, hx + hy + hz      , hx + hy - filler);
    CGContextAddLineToPoint(context, hx + hy + hz + hy , hx - filler);
    CGContextAddLineToPoint(context, hx + hy + hz      , hx - hy - filler);    
    CGContextAddLineToPoint(context, hx + hy           , hx - hy - filler);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * three = [NSArray arrayWithObjects:@"2", @"3", @"4", @"7", @"8", @"9", @"0", nil]; 
    [self SSSetContextColorsFor:character  with:three inContext:context];
    //3
    CGContextMoveToPoint   (context, hx + hOffSet  + filler * 1    , hx + filler);
    CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 1, hx + hy + filler);
    CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 1, hx + hy + hz + filler);
    CGContextAddLineToPoint(context, hx + hOffSet + filler * 1     , hx + hy + hz + hy + filler);
    CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 1, hx + hy + hz + filler);    
    CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 1, hx + hy + filler);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * four = [NSArray arrayWithObjects:@"2", @"3", @"4", @"5", @"6", @"8", @"9", @"-", nil]; 
    [self SSSetContextColorsFor:character  with:four inContext:context];
    //4
    CGContextMoveToPoint   (context, hx                , hx + vOffSet + filler * 2);
    CGContextAddLineToPoint(context, hx + hy           , hx + hy + vOffSet + filler * 2);
    CGContextAddLineToPoint(context, hx + hy + hz      , hx + hy + vOffSet + filler * 2);
    CGContextAddLineToPoint(context, hx + hy + hz + hy , hx + vOffSet + filler * 2);
    CGContextAddLineToPoint(context, hx + hy + hz      , hx - hy + vOffSet + filler * 2);    
    CGContextAddLineToPoint(context, hx + hy           , hx - hy + vOffSet + filler * 2);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * five = [NSArray arrayWithObjects:@"1", @"2", @"6",  @"8", @"0", nil]; 
    [self SSSetContextColorsFor:character with:five inContext:context];
    //5
    CGContextMoveToPoint   (context, hx - filler, hx + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx + hy - filler, hx + hy + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx + hy - filler, hx + hy + hz + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx - filler, hx + hy + hz + hy + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx - hy - filler, hx + hy + hz + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx - hy - filler, hx + hy + vOffSet + filler * 3);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * six = [NSArray arrayWithObjects:@"2", @"3", @"5", @"6", @"8", @"9", @"0", nil]; 
    [self SSSetContextColorsFor:character with:six inContext:context];
    //6
    CGContextMoveToPoint   (context, hx, hx + vOffSet * 2 + filler * 4);
    CGContextAddLineToPoint(context, hx + hy, hx + hy + vOffSet * 2 + filler * 4);
    CGContextAddLineToPoint(context, hx + hy + hz, hx + hy + vOffSet * 2 + filler * 4);
    CGContextAddLineToPoint(context, hx + hy + hz + hy, hx + vOffSet * 2 + filler * 4);
    CGContextAddLineToPoint(context, hx + hy + hz, hx - hy + vOffSet * 2 + filler * 4);
    CGContextAddLineToPoint(context, hx + hy, hx - hy + vOffSet * 2 + filler * 4);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * seven = [NSArray arrayWithObjects:@"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0", nil]; 
    [self SSSetContextColorsFor:character with:seven inContext:context];
    //7
    CGContextMoveToPoint   (context, hx + hOffSet  + filler * 1    , hx + vOffSet  + filler * 3);
    CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 1, hx + hy + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx + hy + hOffSet + filler * 1, hx + hy + hz + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx + hOffSet + filler * 1     , hx + hy + hz + hy + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 1, hx + hy + hz + vOffSet + filler * 3);
    CGContextAddLineToPoint(context, hx - hy + hOffSet + filler * 1, hx + hy + vOffSet + filler * 3);
    CGContextClosePath(context);    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray * doted = [NSArray arrayWithObjects:@"1", nil]; 
    [self SSSetContextColorsFor:[[NSNumber numberWithBool:[self dotIsOn]] stringValue]  with:doted inContext:context];
    //dot
    CGContextMoveToPoint(context, hx * 2.5 + hOffSet + hy, hx * 1.5 + hy + hz + vOffSet);
    CGContextAddArc(context, hx * 2.5 + hOffSet , hx * 1.5 + hy + hz + vOffSet, hy, 0, -6.28, 1);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextFlush(context);
    
}


@end
