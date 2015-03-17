//
//  InternetViewController.m
//  AssessmentOne
//
//  Created by Matt Larkin on 3/13/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//

#import "InternetViewController.h"

@interface InternetViewController () <UIWebViewDelegate,
    UITextFieldDelegate,
    UIScrollViewDelegate
    >
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UITextField *urlTextField;
@property (strong, nonatomic) IBOutlet UINavigationItem *urlNavTitle;

@end

@implementation InternetViewController

- (void)viewDidLoad
    {
    [super viewDidLoad];
    self.webView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://www.mobilemakers.co"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];

}

-(void)webViewDidStartLoad:(UIWebView *)webView
    {
    [self.spinner startAnimating];
     self.urlTextField.text = [[webView.request URL] absoluteString];
     self.spinner.hidden = false;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
    {

    NSString *title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.navigationItem.title = title;
    [self.spinner stopAnimating];
     self.spinner.hidden = true;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    if (![textField.text hasPrefix:@"http://"])
    {
        textField.text = [NSString stringWithFormat:@"http://%@", textField.text];
}

    [self loadUrlRequestFromString:textField.text];
    return true;

}
#pragma mark - helper methods

//Name: LoadUrlRequestFromString
//Function: Load url address from string and pass request to webview to load.
//Returns: url address

-(void)loadUrlRequestFromString:(NSString *)string
    {
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
