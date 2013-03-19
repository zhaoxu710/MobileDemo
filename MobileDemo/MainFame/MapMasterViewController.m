//
//  ArrivalOfGoodsViewController.m
//  MobileDemo
//
//  Created by bull on 2/17/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import "MapMasterViewController.h"
#import "SAD.h"
#import "ArrivedDeclarationCell.h"
#import "EBRetriveToDoList.h"

@implementation MapMasterViewController

@synthesize sads;
@synthesize todoList;
@synthesize manageObjectContext;
@synthesize detailViewController;


@class EBToDo;


#pragma mark - View lifecycle
- (NSMutableArray *)dataLoading{
//    NSMutableArray *sadlist = [NSMutableArray arrayWithCapacity:20];
    EBRetriveToDoList *toDoRetriever=[EBRetriveToDoList alloc];
    NSString *filePath=[toDoRetriever getToDoString];
    todoList =[toDoRetriever getToDoList:filePath];

    return todoList;
}


- (void)viewDidLoad

{
    
    [super viewDidLoad];
    // load data
    self.todoList =[self dataLoading];
    
    UIImage *background = [UIImage imageNamed:@"left-background1.png"];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:background];
    // Uncomment the following line to preserve selection between presentations.
    
    // self.clearsSelectionOnViewWillAppear = NO;
    detailViewController = (MapDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    
}



- (void)viewDidUnload

{
    
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    self.sads = nil;
    self.todoList =nil;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return [self.todoList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"SADCell";
	ArrivedDeclarationCell *cell = (ArrivedDeclarationCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    EBToDo *todo = [self.todoList objectAtIndex:indexPath.row];
    SAD *sad= todo.sad;
    
    
    //sad id
    cell.sadIdLabel.adjustsFontSizeToFitWidth = YES;
    cell.sadIdLabel.backgroundColor = [UIColor clearColor];
    cell.sadIdLabel.text = sad.sad_id;
    cell.sadIdLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    
    //port name
    cell.portNameLabel.adjustsFontSizeToFitWidth = YES;
    cell.portNameLabel.backgroundColor = [UIColor clearColor];
    cell.portNameLabel.text =sad.boxa_office_sub_code;
    cell.portNameLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    
    // address
    cell.addressLabel.adjustsFontSizeToFitWidth = YES;
    cell.addressLabel.backgroundColor = [UIColor clearColor];
    cell.addressLabel.text = sad.b14_address;
    cell.addressLabel.font = [UIFont fontWithName:@"Helvetica" size:12];

    // arrived time
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"hh:mm a"];
    NSDate *arrivedate;
    if(sad.t2_accept){
        arrivedate = sad.t2_accept;
    }else {
        arrivedate= [[NSDate alloc] init];
    }
   
    NSString *timestamp = [formatter stringFromDate:arrivedate];
    cell.arrivalDateLabel.adjustsFontSizeToFitWidth = YES;
    cell.arrivalDateLabel.backgroundColor = [UIColor clearColor];
    cell.arrivalDateLabel.text = timestamp;

                                                                                                                                                                                                                                            
    // imag
    cell.orderImageView.image = [self imageForRating:sad.order];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
//    cell.accessoryView = [[UIImageView alloc]
//                          initWithImage:[UIImage imageNamed:@"right-arrow.png"]];
    
    return cell;
    
    
}

- (UIImage *)imageForRating:(int)rating
{
	switch (rating)
	{
		case 1: return [UIImage imageNamed:@"A.png"];
		case 2: return [UIImage imageNamed:@"B.png"];
		case 3: return [UIImage imageNamed:@"C.png"];
		case 4: return [UIImage imageNamed:@"D.png"];

	}
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        EBToDo *todo = todoList[indexPath.row];
        self.detailViewController.detailItem = todo;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EBToDo *object = todoList[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"pdf view start");
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    PDFViewController *pdfViewController = [storyBoard instantiateViewControllerWithIdentifier:@"pdfview"];
    pdfViewController.detailItem =  todoList[indexPath.row];
    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:pdfViewController];
}

@end
