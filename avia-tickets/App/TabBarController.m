//
//  TabBarController.m
//  avia-tickets
//
//  Created by Artur Igberdin on 15.03.2021.
//

#import "TabBarController.h"
#import "MainViewController.h"
#import "MapViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.viewControllers = [self createViewControllers];
        self.tabBar.tintColor = [UIColor blackColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Private

- (NSArray<UIViewController *> *)createViewControllers {
    
    NSMutableArray<UIViewController *> *controllers = [NSMutableArray new];
    
    MainViewController *mainViewController = [MainViewController new];
    mainViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Поиск" image:[UIImage imageNamed:@"search"] selectedImage:[UIImage imageNamed:@"search_selected"]];
    UINavigationController *mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
   
    [controllers addObject:mainNavigationController];
    
    MapViewController *mapViewController = [MapViewController new];
    mapViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Карта" image:[UIImage imageNamed:@"map"] selectedImage:[UIImage imageNamed:@"map_selected"]];
    UINavigationController *mapNavigationViewController = [[UINavigationController alloc] initWithRootViewController:mapViewController];
   
    [controllers addObject:mapNavigationViewController];
    
    
    return controllers;
}



@end
