//
//  MapDetailViewController.m
//  MobileDemo
//
//  Created by bull on 3/8/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import "MapDetailViewController.h"

@interface MapDetailViewController ()

- (void)configureView;

@end

@implementation MapDetailViewController


@synthesize mapView= _mapView;
@synthesize detailItem = _detailItem;
@synthesize todoList = _todoList;




#pragma mark -


- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        SAD  *sad = self.detailItem.sads;
        
        for (id<MKAnnotation> annotation in _mapView.annotations) {
            [_mapView removeAnnotation:annotation];
        }
        
        CLLocationCoordinate2D coordinate;
        coordinate = [self getLocation:sad.b30_point];
        
        SADAnnotation *annotation = [[SADAnnotation alloc] initWithName:sad.boxa_office_sub_code address:sad.b14_address coordinate:coordinate] ;
        [self gotoLocation:coordinate];
    
        [self.mapView addAnnotation:annotation];
        [self.mapView selectAnnotation:annotation animated:YES];
        

    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can    be recreated.
}

- (IBAction)changeMapType:(id)sender{
    if (sender && [sender respondsToSelector:@selector(selectedSegmentIndex)]) {
        NSInteger index = [sender selectedSegmentIndex];
        _mapView.mapType = index;
    }
}

- (void)gotoLocation:(CLLocationCoordinate2D )coordinate
{
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = coordinate.latitude;
    newRegion.center.longitude = coordinate.longitude;
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    [_mapView setRegion:newRegion animated:YES];
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *identifier = @"SADAnnotation";  
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // handle our two custom annotations
    //
    if ([annotation isKindOfClass:[SADAnnotation class]]) // for Golden Gate Bridge
    {
        // try to dequeue an existing pin view first
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
        [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (!pinView)
        {    
            // if an existing pin view was not available, create one
            MKPinAnnotationView* customPinView = [[MKPinAnnotationView alloc]
                                                   initWithAnnotation:annotation reuseIdentifier:identifier];
            customPinView.pinColor = MKPinAnnotationColorGreen;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
//            customPinView.
          
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
            
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    
    
    return nil;
}

- (CLLocationCoordinate2D)getLocation:(NSString *)point{
       CLLocationCoordinate2D location ;
      NSArray *str = [point componentsSeparatedByString:@","];
     if (str.count==2) {
      
              NSString *latText = str[0];
             NSString *lonText = str[1];
             if(latText!=nil &&lonText!=nil){
                      CLLocationDegrees latitude = [latText doubleValue];
                      CLLocationDegrees longitude = [lonText doubleValue];
                      location =CLLocationCoordinate2DMake( latitude, longitude);
                    
                  }
          }
       return location;
    
}

@end
