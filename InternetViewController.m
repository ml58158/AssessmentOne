//
//  InternetViewController.m
//  AssessmentOne
//
//  Created by Matt Larkin on 3/13/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//

#import "InternetViewController.h"

@interface InternetViewController () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation InternetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://www.mobilemakers.co"];
    NSURLRequest *urlRequest = [NS]



}



@end
