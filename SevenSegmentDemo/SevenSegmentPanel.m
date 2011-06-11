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
        NSLog(@"%@",obj);
        [((UIView *)obj) removeFromSuperview];
    } ];
    
    //Add new subview digits
    CGFloat w = CGRectGetWidth([self frame]);
        NSLog(@"%f",w);
    CGFloat h = CGRectGetHeight([self frame]);
        NSLog(@"%f",h);
    if (w>h) {
        h = CGRectGetHeight([self frame]);
        NSLog(@"%f",h);
        h = h - h * 0.2f;
                NSLog(@"%f",h);
        w = CGRectGetWidth([self frame]);
                NSLog(@"%f",w);
        w = w - w * 0.2f;
        NSLog(@"%f",w);
        w = w / [[self digitCount] floatValue];
        NSLog(@"%f",w);
    }
    else
    {
        h = CGRectGetHeight([self frame]);
        NSLog(@"%f",h);
        h = h - h * 0.2f;
        NSLog(@"%f",h);
        w = CGRectGetWidth([self frame]);
        NSLog(@"%f",w);
        w = w - w * 0.2f;
        NSLog(@"%f",w);
        w = w / [[self digitCount] floatValue];
        NSLog(@"%f",w);
    }
    CGFloat a = 20;
    NSLog(@"%f",a);
    CGFloat b = 20;
    NSLog(@"%f",b);
    for (int i = 0; i < [[self digitCount] intValue]; i++) {
        SevenSegmentDigit * ssd = [[SevenSegmentDigit alloc] initWithFrame:CGRectMake(a + w * i, b, w, h)];
        NSLog(@"%@",ssd);
        [ssd setDigit:[NSNumber numberWithInteger:[[NSString stringWithFormat:@"%c", [[[self number] stringValue] characterAtIndex:i] ] integerValue]] ];
        NSLog(@"%@",ssd);
        [ssd setAutoresizingMask: UIViewAutoresizingFlexibleWidth|
                                  UIViewAutoresizingFlexibleLeftMargin|
                                  UIViewAutoresizingFlexibleHeight|
                                  UIViewAutoresizingFlexibleBottomMargin];
        NSLog(@"%@",ssd);
        [ssd setContentMode:UIViewContentModeRedraw];
        NSLog(@"%@",ssd);
        [self addSubview:ssd];
    }
}

- (void) setNumber:(NSNumber *)newNumber
{
    number = newNumber;
    digitCount = [NSNumber numberWithInt:[[number stringValue] length]];
    NSLog(@"%@ - %@", number, digitCount);
    [self setUp];
}

- (NSNumber *) number
{
    NSLog(@"getNumber:%@", number);
    return number;
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
