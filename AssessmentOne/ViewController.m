//
//  ViewController.m
//  AssessmentOne
//
//  Created by Matt Larkin on 3/13/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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
    // Do any additional setup after loading the view, typically from a nib.
}


# pragma mark - calulations
- (IBAction)onCalculateButtonPressed:(UIButton *)sender {

    int ValueOne = [self.valueOneTextField.text intValue];
    int ValueTwo = [self.valueTwoTextField.text intValue];
    self.result = ValueOne * ValueTwo;


// Assign Value From Result Label

    self.navigationBarItem.title =[NSString stringWithFormat:@"%i", self.result];
    [self.valueOneTextField resignFirstResponder];



    if (self.result %5 == 0 ) {
        self.webViewButton.enabled = TRUE;


    } else {
        self.webViewButton.enabled = FALSE;
    }




}




@end
