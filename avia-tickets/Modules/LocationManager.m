//
//  LocationManager.m
//  avia-tickets
//
//  Created by Artur Igberdin on 12.03.2021.
//

#import "LocationManager.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationManager () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;

@end

@implementation LocationManager

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.manager = [CLLocationManager new];
        self.manager.delegate = self;
        //Определение локации - энергозатратная операция
        self.manager.desiredAccuracy = kCLLocationAccuracyKilometer;
        //Ивент что произошло смещение координат
        self.manager.distanceFilter = 500;
        [self.manager requestWhenInUseAuthorization];
    }
    return self;
}

#pragma mark - Public

- (void)start {
    [self.manager startUpdatingLocation];
}

- (void)stop {
    [self.manager stopUpdatingLocation];
}
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    //Массив локаций
    
    CLLocation *location = [locations firstObject];
    
    if (location) {
        NSLog(@"ГЕОЛОКАЦИЯ ПОЛЬЗОВАТЕЛЯ \n\n %@\n", location);
    }
}

@end
