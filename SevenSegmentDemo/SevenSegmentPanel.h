//
//  SevenSegmentPanel.h
//  SevenSegmentDemo
//
//  Created by Ali Moeeny on 6/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SevenSegmentDigit.h"

@interface SevenSegmentPanel : UIView

@property (retain) NSNumber * digitCount;
@property (retain) NSNumber * number;
@property (retain) NSTimer * timer;


- (void) setUp;
- (void) setNumber:(NSNumber *)newNumber;

@end
