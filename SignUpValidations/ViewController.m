//
//  ViewController.m
//  SignUpValidations
//
//  Created by Vamsi T on 28/01/2016.
//  Copyright © 2016 paradigm-creatives. All rights reserved.
//

#import "ViewController.h"
#import "MtValidation.h"

@interface ViewController (){
    UIAlertController *alertController;
    UIAlertView *alert;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    self.navigationController.title = @"MTValidation";
    [super viewDidLoad];
    self.validateButton.layer.cornerRadius = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)validateAction:(id)sender {
    NSString *errorMsg;
    
    errorMsg = [MtValidation validateName:self.firstNameTextField.text];
    if (errorMsg) {
        [[[UIAlertView alloc] initWithTitle:@"First Name"
                                    message:errorMsg
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        return;
    }
        errorMsg = [MtValidation stringwithAlphaNumerical:self.firstNameTextField.text];
    if (errorMsg) {
        [[[UIAlertView alloc] initWithTitle:@"First Name"
                                    message:errorMsg
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        return;
    }
    errorMsg = [MtValidation stringwithMinChars:self.firstNameTextField.text minimumNumberofChars:5];
    if (errorMsg) {
        [[[UIAlertView alloc] initWithTitle:@"First Name"
                                    message:errorMsg
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        return;
    }
    errorMsg = [MtValidation stringwithOnlyNumbers:self.lastNameTextField.text];
    if (errorMsg) {
        [[[UIAlertView alloc] initWithTitle:@"Last Name"
                                    message:errorMsg
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        return;
    }

    errorMsg = [MtValidation validateName:self.lastNameTextField.text];
    if (errorMsg) {
        [[[UIAlertView alloc] initWithTitle:@"Last Name"
                                    message:errorMsg
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        return;
    }
    
    errorMsg = [MtValidation validateEmail:self.emailIdTextField.text];
    if (errorMsg) {
        [[[UIAlertView alloc] initWithTitle:@"EmailId"
                                    message:errorMsg
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        return;
    }
    errorMsg = [MtValidation validatePhoneNumber:self.phoneTextField.text];
    if (errorMsg) {
        [[[UIAlertView alloc] initWithTitle:@"Phone"
                                    message:errorMsg
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
        return;
    }

    
    if (self.passwordTextField.text && ![self.passwordTextField.text isEqual:@""])
    {
        NSString *errorMsg = [MtValidation validatePassword:self.passwordTextField.text
                                                    withConfirmPassword:self.confirmPasswordTextField.text];
        
        if (errorMsg) {
            [[[UIAlertView alloc] initWithTitle:@"Password"
                                        message:errorMsg
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
            return;
        }
    }
    

}

@end
