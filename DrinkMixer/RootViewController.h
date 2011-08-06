//
//  RootViewController.h
//  DrinkMixer
//
//  Created by Maetee Lorprajuksiri on 8/4/11.
//  Copyright 2011 Foster Wheeler International Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
    
    NSMutableArray* drinks;
    IBOutlet UIBarButtonItem *addButtonItem;
}

@property (nonatomic, retain) NSMutableArray* drinks;
@property (nonatomic, retain) UIBarButtonItem *addButtonItem;

-(IBAction) addButtonPress: (id) sender;

@end
