//
//  RootViewController.m
//  DrinkMixer
//
//  Created by Maetee Lorprajuksiri on 8/4/11.
//  Copyright 2011 Foster Wheeler International Corporation. All rights reserved.
//

#import "RootViewController.h"
#import "DrinkDetailViewController.h"
#import "addDrinkViewController.h"

@implementation RootViewController

@synthesize drinks, addButtonItem;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Ask the app bundle for a path to our DrinkDirections.plist
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DrinkDirections" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    // get the Root object
    NSMutableArray *tmpArray = [dict objectForKey:@"Root"];
    
    self.drinks = tmpArray;
    
    // add new Button item to rightBarButtonItem
    self.navigationItem.rightBarButtonItem = self.addButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.drinks count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    
    NSDictionary *tmpDict = [self.drinks objectAtIndex:indexPath.row];
    NSString *cellValue = [tmpDict objectForKey:@"name"];
    //NSLog(@"++%@",cellValue);
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = cellValue;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
    
    DrinkDetailViewController *drinkDetailViewController = [[DrinkDetailViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
    drinkDetailViewController.drink = [self.drinks objectAtIndex:indexPath.row];

    [self.navigationController pushViewController:drinkDetailViewController animated:YES];
    
    [drinkDetailViewController release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

-(IBAction) addButtonPress:(id)sender {
    //NSLog(@"Add button press");
    
    addDrinkViewController *addDrinkVC = [[addDrinkViewController alloc] initWithNibName:@"DrinkDetailViewController" bundle:nil];
    
    UINavigationController *addNavCon = [[UINavigationController alloc] initWithRootViewController:addDrinkVC];
    
    [self presentModalViewController:addNavCon animated:YES];
    
    [addNavCon release];
    [addDrinkVC release];
}

- (void)dealloc
{
    [drinks release];
    [addButtonItem release];
    [super dealloc];
}

@end
