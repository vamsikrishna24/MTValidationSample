//
//  MtValidation.h
//  SignUpValidations
//
//  Created by Vamsi T on 28/01/2016.
//  Copyright © 2016 paradigm-creatives. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MtValidation : NSObject

+ (NSString *)validateName:(NSString *)name;
+ (NSString *)validateEmail:(NSString *)email;
+ (NSString *)validatePassword:(NSString *)pwd
           withConfirmPassword:(NSString *)confirmPwd;
+ (NSString *)validatePhoneNumber:(NSString *)phoneNumber;
+(NSString *) stringwithOnlyNumbers:(NSString*)string;
+(NSString *) stringwithOnlyCharacters:(NSString*)string;
+(NSString *) stringwithAlphaNumerical:(NSString*)string;
+ (NSString *) stringwithMinChars:(NSString *)string minimumNumberofChars:(int)minValue;
+(NSString *) stringwithMaxChars:(NSString*)string maximumNumberofChars:(int)maxValue;
+(NSString *)getGenericEmail:(NSString *)emailText;

@end
