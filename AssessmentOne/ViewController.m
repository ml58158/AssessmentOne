//
//  ViewController.m
//  AssessmentOne
//
//  Created by Matt Larkin on 3/13/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//

#import "ViewController.h"
#import "InternetViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *valueOneTextField;
@property (strong, nonatomic) IBOutlet UITextField *valueTwoTextField;
@property (strong, nonatomic) IBOutlet UIButton *calculateButton;
@property (strong, nonatomic) IBOutlet UINavigationItem *navigationBarItem;
@property (strong, nonatomic) IBOutlet UIButton *webViewButton;
@property int result;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webViewButton.enabled = FALSE;
    self.valueOneTextField.delegate = self;
    self.valueTwoTextField.delegate = self;
    self.valueOneTextField.returnKeyType = UIReturnKeyDone;
    self.valueTwoTextField.returnKeyType = UIReturnKeyDone;
}


# pragma mark - calulations

- (IBAction)onCalculateButtonPressed:(UIButton *)sender {

//Dismmiss Keypad
    [self.valueOneTextField resignFirstResponder];
    [self.valueTwoTextField resignFirstResponder];

// Declare Variables
    int ValueOne = [self.valueOneTextField.text intValue];
    int ValueTwo = [self.valueTwoTextField.text intValue];
    self.result = ValueOne * ValueTwo;


// Assign Value From Result Label

    self.navigationBarItem.title =[NSString stringWithFormat:@"%i", self.result];


// If result is a multiple of 5, enable webview button
    if (self.result %5 == 0 ) {
        self.webViewButton.enabled = TRUE;


}
    // else, leave disabled
    else {
        self.webViewButton.enabled = FALSE;
}
}


//Prepare for segue to next view controller
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    InternetViewController *vc = segue.destinationViewController;
    vc.title = @"Internet Browser";

}



@end
