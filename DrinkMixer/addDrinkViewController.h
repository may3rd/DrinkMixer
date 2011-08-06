//
//  addDrinkViewController.h
//  DrinkMixer
//
//  Created by Maetee Lorprajuksiri on 8/6/11.
//  Copyright 2011 Foster Wheeler International Corporation. All rights reserved.
//

#import "DrinkDetailViewController.h"

@interface addDrinkViewController : DrinkDetailViewController {
    BOOL keyboardVisible;
    
}

-(void)keyboardDidShow: (NSNotification*) notif;
-(void)keyboardDidHide: (NSNotification*) notif;

-(IBAction) save:(id)sender;
-(IBAction) cancel:(id)sender;

@end
