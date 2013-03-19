//
//  PDFViewController.m
//  MobileDemo
//
//  Created by bull on 3/15/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import "PDFViewController.h"

@class  Context;
@class  ToDoRequest;

@interface PDFViewController ()

@end

@implementation PDFViewController
{
       NSMutableData *responseData;
       NSString *responsetext;
       long _totalFileSize;
       NSUInteger _receivedDataBytes;

    
}

@synthesize detailItem;
@synthesize webview;
@synthesize progressview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *barsBack = [UIImage imageNamed:@"Top-bar-top1.png"];
    [[UIToolbar appearance] setBackgroundImage:barsBack forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    
    
    // load pdf from server
    SAD *sad = self.detailItem.sad;
    if (sad) {
        NSString *url = [[NSString alloc] initWithFormat:@"http://ieintg:14000/e-biscus/Report/ReportServlet?sadid=%@&version=%@&lang=EN", sad.sad_id,sad.version];
        NSLog(@"url = %@",url);
        NSURL *myURL = [NSURL URLWithString:url];       
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:myURL
                                                               cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                           timeoutInterval:60];
         
        [NSURLConnection connectionWithRequest: request delegate:self];
        NSLog(@"sad wfInstance is %@",  self.detailItem.wfInstance);
        NSLog(@"sad id is %@",  sad.sad_id);
    }
    
    //

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)carmeraCapture:(id)sender {
}

- (IBAction)pictureCapture:(id)sender {
}

- (IBAction)attachedDocument:(id)sender {
}

// trriger to-do
- (IBAction)submit:(id)sender {
    /*
     &user_id=user3
     &form_id=REG002_TaxPayer
     &act=REG_APP_SUB
     &clicked-id=tbSubmit
     &context=
     <context>
        <workflow-instance-id>wi1358821889249</workflow-instance-id>
        <workflow-action>response</workflow-action>
        <workflow-node-id>1296537501089</workflow-node-id>
     </context>
     */
    NSURL *url=[NSURL URLWithString:@"http://129.184.13.94:14000//e-biscus/mobileFlowAction.action"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
//
//    Context *context;
//    [context setWorkflow_instance_id:self.detailItem.wfInstance];
//    [context setWorkflow_action:self.detailItem.wfAction];
//    [context setWorkflow_node_id:self.detailItem.wfNode];
//    ToDoRequest *toDoRequest;
//    [toDoRequest setUser_id:@"user3"];
//    [toDoRequest setForm_id:@"form_id"];
//    [toDoRequest setAct:@"act"];
//    [toDoRequest setClicked_id:@"tbSubmit"];
//    [toDoRequest setContext:context];
//    
    [request setPostValue:@"user_id" forKey:@"user3"];
    [request addPostValue:@"form_id" forKey:@"mobile"];
    [request addPostValue:@"act" forKey:@"submit"];
    [request addPostValue:@"clicked-id" forKey:@"tbsumit"];
//    request addPostValue: forKey:(NSString *)
//    [request startSynchronous];
//
//    NSData *responseData= [request responseData];
    
//    NSLog(@"response = %@",responseData);
    NSLog(@"detailItem.wfNode = %@",self.detailItem.wfNode);
    NSLog(@"detailItem.wfInstance = %@",self.detailItem.wfInstance);
    NSLog(@"detailItem.wfAction = %@",self.detailItem.wfAction);
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {

    _totalFileSize = response.expectedContentLength;
    responseData = [[NSMutableData alloc] init];
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {

    _receivedDataBytes += [data length];
    self.progressview.progress = _receivedDataBytes / (float)_totalFileSize;
    [responseData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    UIAlertView *alert = [[UIAlertView alloc] init];
    [alert setTitle:@"Warning"];
    [alert setMessage:@"Network Connection Failed?"];
    [alert setDelegate:self];
    [alert addButtonWithTitle:@"Yes"];
    [alert show];
    NSLog(@"Error");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.webview loadData:responseData MIMEType:@"application/pdf" textEncodingName: @"UTF-8" baseURL:nil];
}
@end
