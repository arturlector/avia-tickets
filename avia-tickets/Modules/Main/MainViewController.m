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
    
    //#1 Подключаем карту и она сразу работает
    MKMapView *map = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView = map;
    [self.view addSubview:self.mapView];
    ////
    
    //#2 Добавим локацию и регион 1000км на 1000км
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(55.752200, 37.6155600);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000000, 1000000);
    [self.mapView setRegion:region animated:YES];
    // Alt + touch - Открыть подсказку метода (Method Summary)
    ////
    
    //#3 Добавляем метку на город
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    annotation.title = @"Title";
    annotation.subtitle = @"Subtitle";
    annotation.coordinate = coordinate;
    [self.mapView addAnnotation:annotation];
    ////
    
    //#4 Переопределить вьюху для аннотации - MarkerAnnotationView
    self.mapView.delegate = self;
    ////
    
    //#5
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [self addressFromLocation:location];
    ////
    
    //#6
    self.locationManager = [LocationManager new];
    [self.locationManager start];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //#5
    [self locationFromAddress:@"Moscow, Nikolskaya 23"];
    
    //#6
    [self.locationManager start];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //#6
    [self.locationManager stop];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    static NSString *identifier = @"AnnotationIdentifier";
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView) {
        annotationView.annotation = annotation;
    } else {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier: identifier];
        annotationView.canShowCallout = YES;
        annotationView.calloutOffset = CGPointMake(0.0, 5.0);
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    
    return annotationView;
}

#pragma mark - Private

//#5 Геокодинг (Адрес -> Координаы и обратно)

- (void)addressFromLocation:(CLLocation *)location {
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder reverseGeocodeLocation:location completionHandler:
     ^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"PLACEMARK ADDRESS \n\n - %@ \n", placemark.name);
            }
        }
    }];
}

- (void)locationFromAddress:(NSString *)address {
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString:address completionHandler:
     ^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (placemarks.count > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"PLACEMARK LOCATION \n\n - %@ \n", placemark.location);
            }
        }
    }];
}


@end
