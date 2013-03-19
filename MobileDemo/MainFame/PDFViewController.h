//
//  PDFViewController.h
//  MobileDemo
//
//  Created by bull on 3/15/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EBToDo.h"
#import "SAD.h"
#import "ASIFormDataRequest.h"
#import "EBToDoRequest.h"

@class  Context;
@class  ToDoRequest;

@interface PDFViewController : UIViewController

@property (strong, nonatomic) EBToDo *detailItem;

@property (strong, nonatomic) IBOutlet UIProgressView *progressview;

@property (strong, nonatomic) IBOutlet UIWebView *webview;

- (IBAction)carmeraCapture:(id)sender;

- (IBAction)pictureCapture:(id)sender;

- (IBAction)attachedDocument:(id)sender;

- (IBAction)submit:(id)sender;

@end
