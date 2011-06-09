//
//  SevenSegmentDigit.h
//  SevenSegmentDemo
//
//  Created by Ali Moeeny on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SevenSegmentDigit : UIView
    @property (nonatomic, retain) NSNumber * digit; 
    @property BOOL dotIsOn;
    @property (nonatomic, retain) UIColor * mainColor; 

- (void) SSSetContextColorsFor:(NSNumber *) dig with:(NSArray *) onDigits inContext:(CGContextRef) context;

@end
