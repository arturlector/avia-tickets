//
//  SecondViewController.m
//  avia-tickets
//
//  Created by Artur Igberdin on 08.03.2021.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) NSString *value;

@end

@implementation SecondViewController

//#1 Передача данных через конструктор
- (instancetype)initWithValue:(NSString *)value {
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Second Screen";
    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Pop to Root" style:UIBarButtonItemStylePlain target:self action:@selector(popToRoot)];
    
}

- (void)popToRoot {
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
