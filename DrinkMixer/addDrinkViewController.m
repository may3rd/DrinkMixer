//
//  addDrinkViewController.m
//  DrinkMixer
//
//  Created by Maetee Lorprajuksiri on 8/6/11.
//  Copyright 2011 Foster Wheeler International Corporation. All rights reserved.
//

#import "DrinkConstants.h"
#import "addDrinkViewController.h"

@implementation addDrinkViewController

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)] autorelease];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)] autorelease];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //NSLog(@"Registering for keyboard events");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    // Initially the keyboard is hidden, so reset our variable
    keyboardVisible = NO;
}

-(void)viewWillDisappear:(BOOL)animated {
    //NSLog(@"Unregistering for keyboard events");
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

-(void)keyboardDidShow:(NSNotification *) notif {
    NSLog(@"Received UIKeyboardDidShowNotification.");
    
    if (keyboardVisible) {
        NSLog(@"Keyboard is already visible. Ignoring Notification.");
    }
    
    // The keyboard wasn't visible before
    
    NSLog(@"Resizing smaller for keyboard");
    
    // Get the size of the keyboard
    
    NSDictionary* info = [notif userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    // Resize the scroll view to make room for the keyboard
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0,0.0, keyboardSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    /*
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, activeField.frame.original)) {
        CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y-keyboardSize.height);
        [scrollView setContentOffset:scrollPoint animated:YES];
    }
    */
    keyboardVisible = YES;
}

-(void)keyboardDidHide:(NSNotification *) notif {
    NSLog(@"Received UIKeyboardDidHideNotification.");
    
    if (!keyboardVisible) {
        NSLog(@"Keyboard already hidden. Ignoring Notification.");
    }
    
    // The keyboard was visible
    NSLog(@"Resizing bigger with no keyboard");
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    keyboardVisible = NO;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"---TextField Should Bengin Editing.");
    activeField = textField;
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction) save:(id)sender {
    NSLog(@"Save pressed");
    
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction) cancel:(id)sender {
    NSLog(@"Cancel pressed");
    
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [activeField release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
