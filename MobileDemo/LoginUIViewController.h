//
//  LoginUIView.h
//  MobileDemo
//
//  Created by bull on 2/25/13.
//  Copyright (c) 2013 bull. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginUIViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *userName;
@property (nonatomic, strong) IBOutlet UITextField *Password;
@property (nonatomic, strong) IBOutlet UIButton *enter;

//- (IBAction)buttonPressed:(id)sender;

@end
