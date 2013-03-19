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


@implementation LoginUIViewController{
    IOSLoginResponse *loginResponse;
}

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
    // connect server to autorise
    /*
    NSURL *loginUrl=[NSURL URLWithString:@"http://129.184.13.94:14000/e-biscus/iosLoginAction.action"];
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
     NSString *message =[NSString stringWithFormat:@"%@ is not valid",userName.text];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Login failed" message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    NSLog(@"alert message=%@",message);
    NSLog(@"loginResponse is %@", loginResponse.isValid);
    if (loginResponse.isValid && [loginResponse.isValid isEqualToString:@"TRUE"]) {
        NSLog(@"login");
//        [self performSegueWithIdentifier:@"login" sender:self];
    }else{
        // jump to mainViewController
        [alert show];
    }
     */
    [self performSegueWithIdentifier:@"login" sender:self];

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


@end
