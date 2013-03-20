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
    NSURL *url=[NSURL URLWithString:@"http://129.184.13.94:14000//e-biscus/mobileFlowAction.action"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    NSLog(@"detailItem.wfNode = %@",self.detailItem.wfNode);
    NSLog(@"detailItem.wfInstance = %@",self.detailItem.wfInstance);
    NSLog(@"detailItem.wfAction = %@",self.detailItem.wfAction);
    
//    [request setPostValue:@"user_id" forKey:@"user3"];
//    [request addPostValue:@"form_id" forKey:@"mobile"];
//    [request addPostValue:@"act" forKey:@"submit"];
//    [request addPostValue:@"clicked-id" forKey:@"tbsumit"];
    NSString *requestStr = [NSString stringWithFormat:@"<message><resourceid>NORMAL</resourceid><form-id>Mobile</form-id><clicked-id>tbSubmit</clicked-id><action>submit</action><user-id>user3</user-id><language>EN</language><context><workflow-instance-id>%@</workflow-instance-id><workflow-action>%@</workflow-action><workflow-node-id>%@</workflow-node-id></context></message>",self.detailItem.wfInstance,self.detailItem.wfAction,self.detailItem.wfNode];
    NSData *myPostData = [requestStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableData *myMutablePostData = [NSMutableData dataWithData:myPostData];
    
    [request setPostBody:myMutablePostData];
    
    [request setRequestMethod:@"POST"];
    
    [request addRequestHeader:@"Content-Type" value:@"application/xml"];
    
    [request setDelegate:self];
    
    [request startSynchronous];
//    request addPostValue: forKey:(NSString *)
//    [request startSynchronous];
//
   NSData *responseData= [request responseData];
   NSLog(@"response = %@",responseData);

    
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
