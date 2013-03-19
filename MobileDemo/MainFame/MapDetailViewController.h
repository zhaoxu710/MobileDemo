//
//  MapDetailViewController.h
//  MobileDemo
//
//  Created by bull on 3/8/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SAD.h"
#import "SADAnnotation.h"
#import "EBToDo.h"


@interface MapDetailViewController : UIViewController <UISplitViewControllerDelegate, MKMapViewDelegate>{
    MKMapView *mapView;
}

@property (strong, nonatomic) EBToDo *detailItem;
@property (strong, nonatomic) NSMutableArray *todoList;
@property (retain, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)changeMapType:(id)sender;

@end
