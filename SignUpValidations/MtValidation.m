//
//  MtValidation.m
//  SignUpValidations
//
//  Created by Vamsi T on 28/01/2016.
//  Copyright © 2016 paradigm-creatives. All rights reserved.
//

#import "MtValidation.h"

@interface MtValidation ()

@end

@implementation MtValidation

#pragma mark Validations


//-------------------------------------------------------------------------------------
//Name Validation
+ (NSString *)validateName:(NSString *)name
{
    NSString *errorMsg = nil;
    
    if (!name ||
        ([name length] == 0) ||
        [[name stringByReplacingOccurrencesOfString:@" "
                                             withString:@""] isEqualToString:@""])
    {
        errorMsg = @"Please enter a valid name.";
    }
    
    return errorMsg;
}

#pragma validateEmail Validation


//-------------------------------------------------------------------------------------
//Email Validation
+ (NSString *)validateEmail:(NSString *)email
{
    NSString *errorMsg = nil;
    NSString *const EMAIL_VALIDATION_REGEX = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:EMAIL_VALIDATION_REGEX
                                                                         options:0
                                                                           error:nil];
    if (([exp numberOfMatchesInString:email options:0 range:NSMakeRange(0, email.length)] == 0) ||
        ([email rangeOfString:@".."].location != NSNotFound))
    {
        errorMsg = @"Please enter a valid email address.";
    }
    else if ([email rangeOfString:@" "].location != NSNotFound)
    {
        errorMsg = @"Emails cannot have a space.";
    }
    
    return errorMsg;
}

#pragma validatePassword Validation


//-------------------------------------------------------------------------------------
//Password Validation
+ (NSString *)validatePassword:(NSString *)pwd
           withConfirmPassword:(NSString *)confirmPwd
{
    NSString *errorMsg = nil;
    NSUInteger pwdLen = [pwd length];
    NSRegularExpression *exp;
    
    if (![pwd isEqual:confirmPwd]) {
        errorMsg = @"Password and Confirm password do not match.";
        return errorMsg;
    }
    
    exp = [NSRegularExpression regularExpressionWithPattern:@"[A-Z]" options:0 error:nil];
    if ([exp numberOfMatchesInString:pwd options:0 range:NSMakeRange(0, pwdLen)] == 0) {
        errorMsg = @"Password must have at least one capital letter.";
        return errorMsg;
    }
    
    exp = [NSRegularExpression regularExpressionWithPattern:@"[a-z]" options:0 error:nil];
    if ([exp numberOfMatchesInString:pwd options:0 range:NSMakeRange(0, pwdLen)] == 0) {
        errorMsg = @"Password must have at least one lowercase letter.";
        return errorMsg;
    }
    
    exp = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:0 error:nil];
    if ([exp numberOfMatchesInString:pwd options:0 range:NSMakeRange(0, pwdLen)] == 0) {
        errorMsg = @"Password must have at least one number.";
        return errorMsg;
    }
    
    // Prevent passwords from having special (non-alphanumeric) characters,
    exp = [NSRegularExpression regularExpressionWithPattern:@"^[0-9a-zA-Z]*$" options:0 error:nil];
    if ([exp numberOfMatchesInString:pwd options:0 range:NSMakeRange(0, pwdLen)] == 0) {
        errorMsg = @"Password must have only alphanumeric characters.";
        return errorMsg;
    }
    
    if (pwdLen < 8 || pwdLen > 15) {
        errorMsg = @"Password must be between 8-15 characters.";
        return errorMsg;
    }
    
    return errorMsg;
}

#pragma PhoneNumber Validation


//-------------------------------------------------------------------------------------
//Phone number Validation
+(NSString *)validatePhoneNumber:(NSString *)phoneNumber
{
    NSString *errorMsg = nil;
    
    if (phoneNumber.length != 10) {
        errorMsg = @"Phone number must be 10 numbers.";
    }
    return errorMsg;
}

#pragma stringwithOnlyNumbers Validation


//-------------------------------------------------------------------------------------
//Checks string with only numbers Validation
+(NSString *) stringwithOnlyNumbers:(NSString*)string{
    
    NSString *errorMsg = nil;
    NSString *regex = @"^[0-9]+$";
    NSPredicate *stringText = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([stringText evaluateWithObject:string])
    {
        NSLog(@"%@",stringText);
        errorMsg = @"Entered String Contains only numbers Please Enter alphaneumeric or Numbers characters.";
    }
        return errorMsg;
}

#pragma stringwithOnlyCharacters Validation


//-------------------------------------------------------------------------------------
//Validate string with only Characters
+(NSString *) stringwithOnlyCharacters:(NSString*)string{
    
    NSString *errorMsg = nil;
    NSString *regex =  @"[A-Za-z]+";
    NSPredicate *stringText = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([stringText evaluateWithObject:string])
    {
        NSLog(@"%@",stringText);
        errorMsg = @"Entered String Contains only characters Please Enter alphaneumeric  or Numbers.";
    }
    return errorMsg;
}

#pragma stringwithAlphaNumerical Validation


//-------------------------------------------------------------------------------------
//Validate string with both AlphaNumerical
+(NSString *) stringwithAlphaNumerical:(NSString*)string{
    
    NSString *errorMsg = nil;
    NSString *regex =  @"[A-Za-z]+";
    NSString *regex1 = @"^[0-9]+$";
    NSPredicate *stringText = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    NSPredicate *stringText1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex1];
    if ([stringText evaluateWithObject:string]||[stringText1 evaluateWithObject:string])
    {
        NSLog(@"%@",stringText);
        errorMsg = @"String should be alpha numerical.";
    }
    return errorMsg;
}

#pragma stringwithMinChars Validation


//-------------------------------------------------------------------------------------
//Validate string Min characters
+ (NSString *) stringwithMinChars:(NSString *)string minimumNumberofChars:(int)minValue{
    NSString *errorMsg = nil;

    if((int)[string length] < minValue){
      errorMsg = @"Minimum characters should enter";
    }
    return errorMsg;

}

#pragma stringwithMaxChars Validation


//-------------------------------------------------------------------------------------
//Validate string Maximum Characters
+ (NSString *) stringwithMaxChars:(NSString*)string maximumNumberofChars:(int)maxValue {
    NSString *errorMsg = nil;
    if((int)[string length] > maxValue){
        errorMsg = @"Maximum limit exceeded";
    }
    return errorMsg;
}

#pragma getGenericEmail Validation


//-------------------------------------------------------------------------------------
//Validate the entered email string to lowercase string
+(NSString *)getGenericEmail:(NSString *)emailText{
    emailText = [[emailText stringByReplacingOccurrencesOfString:@" " withString:@""] lowercaseString];
    return emailText;
}


@end
