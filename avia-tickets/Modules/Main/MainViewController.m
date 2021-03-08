//
//  ViewController.m
//  avia-tickets
//
//  Created by Artur Igberdin on 05.03.2021.
//

#import "MainViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"First Screen";
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    
    self.navigationItem.backButtonTitle = @"";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"To Second" style:UIBarButtonItemStylePlain target:self action:@selector(showNext)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)showNext {
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithValue:@"13"];
    secondViewController.index = 125;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

//#3 Передача данных через Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.destinationViewController isKindOfClass:[SecondViewController class]]) {
        SecondViewController *secondViewController = (SecondViewController *)segue.destinationViewController;
        secondViewController.index = 13;
    }
}

@end
