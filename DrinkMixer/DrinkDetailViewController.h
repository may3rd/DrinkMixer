//
//  DrinkDetailViewController.h
//  DrinkMixer
//
//  Created by Maetee Lorprajuksiri on 8/4/11.
//  Copyright 2011 Foster Wheeler International Corporation. All rights reserved.
//



@interface DrinkDetailViewController : UIViewController {
    NSDictionary *drink;
    IBOutlet UITextField *nameTextField;
    IBOutlet UITextView *ingredientsTextView;
    IBOutlet UITextView *directionsTextView;
    IBOutlet UIScrollView* scrollView;
    
    UITextField *activeField;
}

@property (nonatomic, retain) NSDictionary *drink;
@property (nonatomic, retain) UITextField *nameTextField;
@property (nonatomic, retain) UITextView *ingredientsTextView;
@property (nonatomic, retain) UITextView *directionsTextView;
@property (nonatomic, retain) UIScrollView* scrollView;

-(IBAction) textFieldDoneEditing:(id)sender;


//-(void)textFieldDidBeginEditing:(UITextField *)textField;
//-(void)textFieldDidEndEditing:(UITextField *)textField;

@end
