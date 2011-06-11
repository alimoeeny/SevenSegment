//
//  SevenSegmentPanel.m
//  SevenSegmentDemo
//
//  Created by Ali Moeeny on 6/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SevenSegmentPanel.h"

@implementation SevenSegmentPanel

@synthesize number;
@synthesize digitCount;
@synthesize timer;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setUp
{
    //remove all subwiews
    [[self subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //NSLog(@"%@",obj);
        [((UIView *)obj) removeFromSuperview];
    } ];
    
    //Add new subview digits
    CGFloat w = CGRectGetWidth([self frame]);
    CGFloat h = CGRectGetHeight([self frame]);
    if (w>h) {
        h = CGRectGetHeight([self frame]);
        h = h - h * 0.2f;
        w = CGRectGetWidth([self frame]);
        w = w - w * 0.2f;
        w = w / [[self digitCount] floatValue];
    }
    else
    {
        h = CGRectGetHeight([self frame]);
        h = h - h * 0.2f;
        w = CGRectGetWidth([self frame]);
        w = w - w * 0.2f;
        w = w / [[self digitCount] floatValue];
    }
    CGFloat a = 20;
    CGFloat b = 20;
    
    int offset = 0;
    
    if (0>[[self number] intValue]) {
        SevenSegmentDigit * ssd = [[SevenSegmentDigit alloc] initWithFrame:CGRectMake(a + w * offset, b, w, h)];
        offset ++;
        [ssd setCharacter:@"-"];
        [ssd setAutoresizingMask: UIViewAutoresizingFlexibleWidth|
         UIViewAutoresizingFlexibleLeftMargin|
         UIViewAutoresizingFlexibleHeight|
         UIViewAutoresizingFlexibleBottomMargin];
        [ssd setContentMode:UIViewContentModeRedraw];
        [self addSubview:ssd];
    }
    
    for (int i = offset; i < [[self digitCount] intValue]; i++) {
        SevenSegmentDigit * ssd = [[SevenSegmentDigit alloc] initWithFrame:CGRectMake(a + w * i, b, w, h)];
        NSString * ch = [[NSString stringWithFormat:@"%c", [[[NSNumber numberWithInt:abs([[self number] intValue])] stringValue] characterAtIndex:i-offset]] retain];
        [ssd setCharacter:ch];
        [ssd setAutoresizingMask: UIViewAutoresizingFlexibleWidth|
                                  UIViewAutoresizingFlexibleLeftMargin|
                                  UIViewAutoresizingFlexibleHeight|
                                  UIViewAutoresizingFlexibleBottomMargin];
        [ssd setContentMode:UIViewContentModeRedraw];
        [self addSubview:ssd];
    }
}

- (void) setNumber:(NSNumber *) newNumber
{
    number = newNumber;
    digitCount = [NSNumber numberWithInt:[[number stringValue] length]];
    NSLog(@"%@ - %@", number, digitCount);
    [self setUp];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
