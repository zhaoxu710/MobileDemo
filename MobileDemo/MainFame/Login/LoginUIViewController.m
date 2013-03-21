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
#import "User.h"
#import "EBToDo.h"
#import "EBRetriveToDoList.h"


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
    // connect server to autorise
    
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
        [self pouplateToDB];
        [self performSegueWithIdentifier:@"login" sender:self];
    }else{
        // jump to mainViewController
        [alert show];
    }
    
    
   
//    [self performSegueWithIdentifier:@"login" sender:self];
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

-(void)pouplateToDB{
    // Get a reference to the managed object context *through* the accessor
    NSManagedObjectContext* context = [self managedObjectContext];
    if (!context) {
        NSLog(@"context is nil");
    }else{
         NSLog(@"context is not nil");
    }
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User"
                                       inManagedObjectContext:context];
    user.userName = self.userName.text;
    user.password = self.password.text;
    
    NSLog(@"get todo list by username");
    EBRetriveToDoList *toDoRetriever=[EBRetriveToDoList alloc];
    NSString *strToDoList =[toDoRetriever getToDoString:self.userName.text];
    NSMutableArray *todoList =[toDoRetriever getToDoList:strToDoList];
    for(EBToDo *item in todoList){
        EBToDo *todo = [NSEntityDescription insertNewObjectForEntityForName:@"EBToDo"
                                                     inManagedObjectContext:context];
        todo = item;
        [todo setValue:user forKey:@"user"];
    }
    [user setValue:todoList forKey:@"todolist"];
 
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    // Test listing all FailedBankInfos from the store
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    for (User *u in fetchedObjects) {
        NSLog(@"user Name: %@", u.userName);
        
        NSMutableArray *details = user.todolist;
        for(EBToDo *todo in details){
            NSLog(@"todo wfInstance: %@", todo.wfInstance);
        }
        
    }

}


@end
