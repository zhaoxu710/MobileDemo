//
//  LoginUIView.h
//  MobileDemo
//
//  Created by bull on 2/25/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class TPKeyboardAvoidingScrollView;

@interface LoginUIViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@property (nonatomic, retain) IBOutlet TPKeyboardAvoidingScrollView *scrollView;

@property (nonatomic, retain) IBOutlet UIImageView *backgroundView;

@property (nonatomic, retain) IBOutlet UITextField *userName;

@property (nonatomic, retain) IBOutlet UITextField *password;

@property (nonatomic, retain) IBOutlet UIButton *enter;

@property BOOL isValid;

- (IBAction)buttonPressed:(id)sender;

@end
