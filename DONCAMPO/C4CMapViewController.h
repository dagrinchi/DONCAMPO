//
//  C4CMapViewController.h
//  DONCAMPO
//
//  Created by David Almeciga on 5/31/14.
//  Copyright (c) 2014 David Almeciga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface C4CMapViewController : UIViewController {
    
    MKMapView *mapView;
    
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

-(IBAction)SetMap:(id)sender;

@end
