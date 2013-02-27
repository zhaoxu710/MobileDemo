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
//	switch (rating)
//	{
//		case 1: return [UIImage imageNamed:@"1StarSmall.png"];
//		case 2: return [UIImage imageNamed:@"2StarsSmall.png"];
//		case 3: return [UIImage imageNamed:@"3StarsSmall.png"];
//		case 4: return [UIImage imageNamed:@"4StarsSmall.png"];
//		case 5: return [UIImage imageNamed:@"5StarsSmall.png"];
//	}
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
    SAD *sad = [self.sads objectAtIndex:[indexPath row]];
    UIAlertView *alter =  [[UIAlertView alloc]initWithTitle:@"select declaration" message:sad.sadID delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alter show];
}

@end
