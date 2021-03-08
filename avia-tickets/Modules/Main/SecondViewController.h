//
//  SecondViewController.h
//  avia-tickets
//
//  Created by Artur Igberdin on 08.03.2021.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

//#2 Передача данных через свойство
@property (nonatomic, assign) NSInteger index;

- (instancetype)initWithValue:(NSString *)value;

@end
