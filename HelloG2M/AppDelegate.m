//
//  AppDelegate.m
//  HelloG2M
//
//  Created by hellboy on 14-4-24.
//  Copyright (c) 2014年 gaea. All rights reserved.
//

#import "AppDelegate.h"
#import "ASIHTTPRequest.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    NSURL *url = [NSURL URLWithString:@"https://api.citrixonline.com/oauth/access_token?grant_type=password&user_id=hellboy025@163.com&password=123456789"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest setHTTPMethod:@"GET"];
    [theRequest addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [theRequest addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:nil];
    NSString *returnString = [NSString stringWithCString:[returnData bytes] encoding:NSUTF8StringEncoding];
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//    [request setRequestHeaders:[NSMutableDictionary dictionaryWithDictionary:@{@"Accept":@"application/json",@"Content-Type":@"application/json"}]];
//    [request setRequestMethod:@"GET"];
//    [request setDelegate:self];
//    [request startAsynchronous];
    return YES;
}
- (void)requestFinished:(ASIHTTPRequest *)request{
    NSLog(@"finished");
    NSString *responseString = [request responseString];
    NSLog(@"response = %@",responseString);
}
- (void)requestFailed:(ASIHTTPRequest *)request{
    NSLog(@"failed");
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
