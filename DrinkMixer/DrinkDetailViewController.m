//
//  DrinkDetailViewController.m
//  DrinkMixer
//
//  Created by Maetee Lorprajuksiri on 8/4/11.
//  Copyright 2011 Foster Wheeler International Corporation. All rights reserved.
//

#import "DrinkDetailViewController.h"
#import "DrinkConstants.h"

@implementation DrinkDetailViewController
@synthesize drink, nameTextField, ingredientsTextView, directionsTextView;
@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    scrollView.contentSize = self.view.frame.size;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction) textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    activeField = textField;
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //NSLog(@"----%@",[drink objectForKey:@"name"]);
          
    nameTextField.text = [drink objectForKey:NAME_KEY];
    ingredientsTextView.text = [drink objectForKey:INGREDIENTS_KEY];
    directionsTextView.text = [drink objectForKey:DIRECTIONS_KEY];
}

-(void)dealloc {
    [scrollView release];
    [nameTextField release];
    [ingredientsTextView release];
    [directionsTextView release];
    [drink release];
    [super dealloc];
}

@end
