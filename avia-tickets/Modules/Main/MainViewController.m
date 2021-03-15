//
//  ViewController.m
//  avia-tickets
//
//  Created by Artur Igberdin on 05.03.2021.
//

#import "MainViewController.h"
#import "ResultsTableViewController.h"

@interface MainViewController () <UISearchResultsUpdating, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) ResultsTableViewController *resultsViewController;

@property (nonatomic, copy) NSArray *array;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Поиск";
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.array = @[@"White", @"Green", @"Red", @"Black", @"Blue", @"Yellow"];
    
    self.resultsViewController = [ResultsTableViewController new];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsViewController];
    self.searchController.searchResultsUpdater = self;
    
    self.navigationItem.searchController = self.searchController;
    
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"camera"] style:(UIBarButtonItemStylePlain) target:self action:@selector(openImagePicker)];
}

#pragma mark - Private

- (void)openImagePicker {
    UIImagePickerController *controller = [UIImagePickerController new];
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
   
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    if (image) {
        NSLog(@"Image exist");
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ReuseIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}


#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    
    if (searchController.searchBar.text.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", searchController.searchBar.text];
        self.resultsViewController.results = [self.array filteredArrayUsingPredicate:predicate];
        [self.resultsViewController update];
    }
}


@end
