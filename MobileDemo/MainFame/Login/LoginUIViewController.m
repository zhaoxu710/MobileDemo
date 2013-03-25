//
//  LoginUIView.m
//  MobileDemo
//
//  Created by bull on 2/25/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import "LoginUIViewController.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "IOSLoginResponseParser.h"
#import "IOSLoginResponse.h"
#import "EBToDoListHelper.h"
#import "AppDelegate.h"

#define LOGIN_URL @"http://129.184.13.94:14000/e-biscus/iosLoginAction.action"

@implementation LoginUIViewController{
    IOSLoginResponse *loginResponse;
}

@synthesize managedObjectContext;
@synthesize userName;
@synthesize password;
@synthesize enter;
@synthesize scrollView;
@synthesize backgroundView;
@synthesize isValid;

- (void)viewDidLoad{
    userName.returnKeyType = UIReturnKeyNext;
    password.returnKeyType = UIReturnKeyDone;
    userName.delegate = self;
    password.delegate =self;
    //set background imag
    UIImage *bg = [UIImage imageNamed:@"Login-bg1.png"];
    backgroundView.image = bg;
}

- (void)viewDidUnLoad{

    loginResponse = nil;

}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (IBAction)buttonPressed:(id)sender{
    // error message
    NSString *message;
    if (userName.text) {
        message=[NSString stringWithFormat:@"%@ is not valid",userName.text];
        
    }else{
        message =[NSString stringWithFormat:@"please input valid user/password"];
        
    }
    NSLog(@"alert message=%@",message);
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Login failed" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    if ([self sendLoginRequest]) {
        NSLog(@"login");
        [self pouplateToDB];
        [self performSegueWithIdentifier:@"login" sender:self];
    }else{
        // jump to mainViewController
        [alert show];
    }
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setUserName:nil];
    [self setPassword:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([userName isFirstResponder]) {
        [password becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [scrollView adjustOffsetToIdealIfNeeded];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isEqual:password]) {
        [self buttonPressed:textField];
    }
}

// login request
- (BOOL)sendLoginRequest{
    
    NSURL *loginUrl=[NSURL URLWithString:LOGIN_URL];
    ASIFormDataRequest *myRequest=[ASIFormDataRequest requestWithURL:loginUrl];
    NSLog(@"user name = %@" , userName.text);
    NSLog(@"password = %@" , password.text);
    [myRequest setPostValue:userName.text forKey:@"userName"];
    [myRequest setPostValue:password.text forKey:@"password"];
    [myRequest setPostValue:@"CR" forKey:@"service"];
    [myRequest setPostValue:@"mac" forKey:@"mac"];
    [myRequest startSynchronous];
    NSData *responseData=[myRequest responseData];
    
    NSLog(@"response = %@",responseData);
    loginResponse=[IOSLoginResponseParser parse:responseData];
    
    if(loginResponse==nil){
        NSLog(@"loginResponse is nil");
    }
    
    NSLog(@"loginResponse is %@", loginResponse.isValid);
    
    return loginResponse.isValid && [loginResponse.isValid isEqualToString:@"TRUE"];
}

-(void)pouplateToDB{
    // Get a reference to the managed object context *through* the accessor
    
    if (!self.managedObjectContext) {
        NSLog(@"Login context is nil");
    }else{
         NSLog(@"Login context is not nil");
    }
    EBToDoListHelper *toDoRetriever=[[EBToDoListHelper alloc] initWtihContext:self.managedObjectContext];
    [toDoRetriever insertToDoToDB:self.userName.text andPassword:self.password.text];
        
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"login"]) {
        [[segue destinationViewController] setManagedObjectContext:self.managedObjectContext];
    }
}


@end
