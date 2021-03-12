//
//  ViewController.m
//  avia-tickets
//
//  Created by Artur Igberdin on 05.03.2021.
//

#import "MainViewController.h"
#import <MapKit/MapKit.h>

#import "LocationManager.h"

@interface MainViewController () <MKMapViewDelegate>

@property (nonatomic, weak) MKMapView *mapView;
@property (nonatomic, strong) LocationManager *locationManager;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Map Example";
    self.view.backgroundColor = [UIColor yellowColor];
    
    //Карта
    MKMapView *map = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView = map;
    self.mapView.delegate = self;
    
    //Локация и регион
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(55.752200, 37.6155600);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000000, 1000000);
    [self.mapView setRegion:region animated:YES];
    
    //Метка
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    annotation.title = @"Title";
    annotation.subtitle = @"Subtitle";
    annotation.coordinate = coordinate;
    
    [self.mapView addAnnotation:annotation];
    
    [self.view addSubview:self.mapView];
    
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:55.752200 longitude:37.6155600];
    [self addressFromLocation:location];
    
    [self locationFromAddress:@"Moscow, Nikolskay 23"];
    
    self.locationManager = [LocationManager new];
    [self.locationManager start];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.locationManager start];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.locationManager stop];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    static NSString *identifier = @"AnnotationIdentifer";
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (annotationView) {
        annotationView.annotation = annotation;
    } else {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
        annotationView.calloutOffset = CGPointMake(0.0, 5.0);
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    
    return annotationView;
}

#pragma mark - Private

// Location -> Address
- (void)addressFromLocation:(CLLocation *)location {
    
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder reverseGeocodeLocation:location completionHandler:
     ^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"Placemark Address \n\n - %@", placemark.name);
            }
        }
    }];
}

// Address -> Location
- (void)locationFromAddress:(NSString *)address {
    CLGeocoder *geocoder = [CLGeocoder new];
    
    [geocoder geocodeAddressString:address completionHandler:
        ^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            
            if (placemarks.count > 0) {
                for (MKPlacemark *placemark in placemarks) {
                    NSLog(@"Placemark Location \n\n - %@", placemark.location);
                }
            }
    }];
}


@end
