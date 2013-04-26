//
//  RWAppDelegate.m
//  RWAddressBookWrapper
//  https://github.com/oliromole/RWAddressBookWrapper.git
//
//  Created by Roman Oliichuk on 2012.06.24.
//  Copyright (c) 2012 Roman Oliichuk. All rights reserved.
//

/*
 Copyright (C) 2012 Roman Oliichuk. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 * Neither the name of the author nor the names of its contributors
 may be used to endorse or promote products derived from this
 software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "RWAppDelegate.h"

#import "RWAddressBookWrapper.h"

@implementation RWAppDelegate

#pragma mark - Initializing a RWAppDelegate

- (id)init
{
    if ((self = [super init]))
    {
        mMainWindow = nil;
        mRootNavigationController = nil;
    }
    
    return self;
}

#pragma mark - Deallocating a RWAppDelegate

- (void)dealloc
{
    mMainWindow = nil;
    
    mRootNavigationController = nil;
}

#pragma mark - Accessing the graphical user interface

@synthesize mainWindow = mMainWindow;
@synthesize rootNavigationController = mRootNavigationController;

#pragma mark - Testing the RWAddressBookWrapper

- (void)testRWAddressBookWrapper
{
}

#pragma mark - Conforming the UIApplicationDelegate Protocol

#pragma mark Monitoring Application State Changes

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#pragma unused(application)
#pragma unused(launchOptions)
    
    CGRect windowFrame;
    windowFrame.origin = CGPointZero;
    windowFrame.size = [UIScreen mainScreen].bounds.size;
    
    mMainWindow = [[UIWindow alloc] initWithFrame:windowFrame];
    mMainWindow.backgroundColor = [UIColor blackColor];
    [mMainWindow makeKeyAndVisible];
    
    mRootNavigationController = [[UINavigationController alloc] init];
    mRootNavigationController.navigationBar.barStyle = UIBarStyleBlack;
    mRootNavigationController.navigationBar.hidden = NO;
    mRootNavigationController.toolbar.barStyle = UIBarStyleBlack;
    mRootNavigationController.toolbar.hidden = YES;
    
    [mMainWindow addSubview:mRootNavigationController.view];
    
    [self testRWAddressBookWrapper];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
#pragma unused(application)
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
#pragma unused(application)
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
#pragma unused(application)
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
#pragma unused(application)
}

- (void)applicationWillTerminate:(UIApplication *)application
{
#pragma unused(application)
}

#pragma mark Providing a Window for Storyboarding

- (UIWindow *)window
{
    return mMainWindow;
}

- (void)setWindow:(UIWindow *)window
{
    if (mMainWindow != window)
    {
        mMainWindow = window;
    }
}

@end

@implementation UIApplication (UIApplicationRWAppDelegate)

- (RWAppDelegate *)appDelegate
{
    RWAppDelegate *appDelegate = nil;
    
    id<UIApplicationDelegate> delegate = self.delegate;
    
    if (delegate && [delegate isKindOfClass:[RWAppDelegate class]])
    {
        appDelegate = (RWAppDelegate *)delegate;
    }
    
    return appDelegate;
}

@end
