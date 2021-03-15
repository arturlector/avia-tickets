//
//  ResultsTableViewController.h
//  avia-tickets
//
//  Created by Artur Igberdin on 15.03.2021.
//

#import <UIKit/UIKit.h>

@interface ResultsTableViewController : UITableViewController

@property (nonatomic, copy) NSArray *results;

- (void)update;

@end
