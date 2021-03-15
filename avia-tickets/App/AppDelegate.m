//
//  AppDelegate.m
//  avia-tickets
//
//  Created by Artur Igberdin on 05.03.2021.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "CollectionViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame: frame];
    
    //MainViewController *viewController = [MainViewController new];
    
    
    CollectionViewController *vc = [CollectionViewController new];
    
    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self.window setRootViewController:navigationViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
