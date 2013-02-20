// Copyright (C) 2011-2012 by Tapjoy Inc.
//
// This file is part of the Tapjoy SDK.
//
// By using the Tapjoy SDK in your software, you agree to the terms of the Tapjoy SDK License Agreement.
//
// The Tapjoy SDK is bound by the Tapjoy SDK License Agreement and can be found here: https://www.tapjoy.com/sdk/license


#import "TJ_ConnectAppDelegate.h"
#import "TapjoyConnect.h"

@implementation TJ_ConnectAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tjcConnectSuccess:) name:TJC_CONNECT_SUCCESS object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tjcConnectFail:) name:TJC_CONNECT_FAILED object:nil];
	
	// NOTE: This must be replaced by your App Id. It is Retrieved from the Tapjoy website, in your account.
	[TapjoyConnect requestTapjoyConnect:@"93e78102-cbd7-4ebf-85cc-315ba83ef2d5" secretKey:@"JWxgS26URM0XotaghqGn"];
	
	_msgLabel.text = @"Tapjoy Connect Test";
	_statusLabel.text = @"Waiting For Response From Server...";
	
	[_window makeKeyAndVisible];
	return YES;
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


#pragma mark TapjoyConnect Observer methods

-(void) tjcConnectSuccess:(NSNotification*)notifyObj
{
	NSLog(@"Tapjoy Connect Succeeded");
	
	_statusLabel.text = @"Tapjoy Connect Succeeded";
}

-(void) tjcConnectFail:(NSNotification*)notifyObj
{
	NSLog(@"Tapjoy Connect Failed");
	
	_statusLabel.text = @"Tapjoy Connect Failed";
}


- (void)dealloc
{
	[_window release];
	[super dealloc];
}

@end
