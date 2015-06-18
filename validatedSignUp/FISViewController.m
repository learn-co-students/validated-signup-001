//
//  FISViewController.m
//  validatedSignUp
//
//  Created by Joe Burgess on 7/2/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;


@property (strong, nonatomic) UITextField *selectedTextField;
@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.firstName.delegate = self;
    self.lastName.delegate = self;
    self.email.delegate = self;
    self.userName.delegate = self;
    self.password.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
        self.selectedTextField.text = @"";
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.firstName)
    {
        if ([textField.text length]>0 && ![self hasDigits:textField.text]) {
            self.lastName.enabled = YES;
            [self.lastName becomeFirstResponder];
        } else
        {
            self.selectedTextField=textField;
            UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"First Name must have more than 0 characters and no numbers" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
            [newAlert show];
        }
    }
    else if (textField == self.lastName)
    {
        if ([textField.text length]>0 && ![self hasDigits:textField.text]) {
            self.email.enabled = YES;
            [self.email becomeFirstResponder];
        } else
        {
            self.selectedTextField=textField;
            UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"Last Name must have more than 0 characters and no numbers" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
            [newAlert show];
        }
    }
    else if (textField == self.email)
    {
        if ([textField.text length]>0 && [self validateEmail:textField.text]) {
            self.userName.enabled = YES;
            [self.userName becomeFirstResponder];
        } else
        {
            self.selectedTextField=textField;
            UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"Email must have more than 0 characters and be a valid format" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
            [newAlert show];
        }
    }
    else if (textField == self.userName)
    {
        if ([textField.text length]>0 && ![self hasDigits:textField.text]) {
            self.password.enabled = YES;
            [self.password becomeFirstResponder];
        } else
        {
            self.selectedTextField=textField;
            UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"username must have more than 0 characters and no numbers" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
            [newAlert show];
        }
    }
    else if (textField == self.password)
    {
        if ([textField.text length]>6) {
            self.submitButton.enabled = YES;
        } else
        {
            self.selectedTextField=textField;
            UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Validation Error" message:@"password must have more than 6 characters" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Clear", nil];
            [newAlert show];
        }
    }
    return YES;
}

- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];

    return [emailTest evaluateWithObject:candidate];
}

- (BOOL) hasDigits:(NSString *)input
{
    return [input rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound;
}


@end
