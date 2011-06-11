//
//  SevenSegmentDemoAppDelegate.m
//  SevenSegmentDemo
//
//  Created by Ali Moeeny on 6/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SevenSegmentDemoAppDelegate.h"

@implementation SevenSegmentDemoAppDelegate

@synthesize window = _window;
@synthesize timer;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    [self setTimer:[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerWentOff:) userInfo:[NSNumber numberWithInt:0] repeats:NO]];

    return YES;
}

- (void) timerWentOff:(NSTimer *) theTimer
{
    //[((SevenSegmentDigit *)[[[[[self window] subviews] objectAtIndex:0] subviews] objectAtIndex:0] ) setDigit:(NSNumber *)[theTimer userInfo]];
    [((SevenSegmentPanel *)[[[[[self window] subviews] objectAtIndex:0] subviews] objectAtIndex:0] ) setNumber:(NSNumber *)[theTimer userInfo]];
    [self setTimer:[NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(timerWentOff:) userInfo:[NSNumber numberWithInt: 10 + 10 * [((NSNumber *)[theTimer userInfo]) intValue]] repeats:NO]];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
