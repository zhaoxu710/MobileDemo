//
//  ArrivalOfGoodsViewController.m
//  MobileDemo
//
//  Created by bull on 2/17/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import "ArrivedDelarationViewController.h"
#import "SAD.h"
#import "ArrivedDeclarationCell.h"

@implementation ArrivedDelarationViewController

@synthesize sads;
@synthesize manageObjectContext;


- (id)initWithStyle:(UITableViewStyle)style

{
    
    self = [super initWithStyle:style];
    
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

- (NSMutableArray *)dataLoading{
    NSMutableArray *sadlist = [NSMutableArray arrayWithCapacity:20];
    SAD *sad = [[SAD alloc] init];
    sad.sadID = @"12ARIM0021";
    sad.port =@"Dublin Port";
    sad.address =@"Nord road, East third Ring";
    sad.arrivalDate = [[NSDate alloc] init];
    sad.order = 1;
    [sadlist addObject:sad];
    sad = [[SAD alloc] init];
    sad.sadID = @"12CLIM3001";
    sad.port =@"Dublin Port";
    sad.address =@"Nord road, East third Ring";
    sad.arrivalDate = [[NSDate alloc] init];
    sad.order = 2;
    [sadlist addObject:sad];
    sad = [[SAD alloc] init];
    sad.sadID = @"12ARIM2830";
    sad.port =@"Dublin Port";
    sad.address =@"Nord road, East third Ring";
    sad.arrivalDate = [[NSDate alloc] init];
    sad.order = 3;
    [sadlist addObject:sad];
    sad = [[SAD alloc] init];
    sad.sadID = @"12ARIM2831";
    sad.port =@"Dublin Port";
    sad.address =@"Nord road, East third Ring";
    sad.arrivalDate = [[NSDate alloc] init];
    sad.order = 4;
    [sadlist addObject:sad];
    return sadlist;
}


- (void)viewDidLoad

{
    
    [super viewDidLoad];
    // load data
    self.sads =[self dataLoading];
    
    
    // Uncomment the following line to preserve selection between presentations.
    
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}



- (void)viewDidUnload

{
    
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    self.sads = nil;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return [self.sads count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	ArrivedDeclarationCell *cell = (ArrivedDeclarationCell *)[tableView dequeueReusableCellWithIdentifier:@"SADCell"];
    SAD *sad = [self.sads objectAtIndex:indexPath.row];
    
    //sad id
    cell.sadIdLabel.text = sad.sadID;
    
    //port name
    cell.portNameLabel.text =sad.port;
    
    // address
    cell.addressLabel.text = sad.address;

    // arrived time
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/YY"];
    NSString *timestamp = [formatter stringFromDate:sad.arrivalDate];
    cell.arrivalDateLabel.text = timestamp;
    
    // imag
    cell.orderImageView.image = [self imageForRating:sad.order];
    return cell;
}

- (UIImage *)imageForRating:(int)rating
{
	switch (rating)
	{
		case 1: return [UIImage imageNamed:@"1.png"];
		case 2: return [UIImage imageNamed:@"2.png"];
		case 3: return [UIImage imageNamed:@"3.png"];
		case 4: return [UIImage imageNamed:@"4.png"];

	}
//	return nil;
    return [UIImage imageNamed:@"LocationIcon2.png"];
}

// remove button
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	if (editingStyle == UITableViewCellEditingStyleDelete)
//	{
//		[self.sads removeObjectAtIndex:indexPath.row];
//		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//	}
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    SAD *sad = [self.sads objectAtIndex:[indexPath row]];
//    UIAlertView *alter =  [[UIAlertView alloc]initWithTitle:@"select declaration" message:sad.sadID delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//    [alter show];
}

@end
