# MTValidation


##Validating strings  

###Purpose :
We all have experienced it’s very time taking task to handle all validations for a single text field like empty validation,  characters limit etc and to manage them in a efficient way. It is very annoying to show validation alerts for each text field, so if you have so many text-fields in a form and each text field have average of 2 validations then user may get frustrated to get so much alert during filling the form.

To overcome this problem I have created an inherited class of “UITextField” called “MTValidation” in which you just need to import the class and call the method in which you want to validate in a particular textfield, no matter how many types of validation you want to perform you just need to give them in sequence. I’m sure this will save your lot of time in development and good news is that you can easily integrate “TextFieldValidator” into your previous application without putting much effort.

###Steps to use MTValidation Classes. 

1.Import the class named "MtValidations.h" into the respective class.

2.Select a method which you need to be call.

3.The calling of method  sample code demonstrated below

         //  [MtValidation stringwithAlphaNumerical:self.firstNameTextField.text];

### Requirements

- will support iOS 6.0 or higher
- Automatic Reference Counting (ARC)

### Author

- [Vamsi Krishna](https://github.com/vamsikrishna24))