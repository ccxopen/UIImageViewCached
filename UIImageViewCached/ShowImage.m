//
//  ShowImage.m
//  UIImageViewCached
//
//  Created by Jaanus Kase on 09.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ShowImage.h"
#import "UIImageView+Cached.h"

@implementation ShowImage

- (void)dealloc
{
    [imageView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Image";
    
    [imageView loadImageFromUrl:[NSURL URLWithString:@"http://www.jaanuskase.com/stuff/Lena-color.jpg"]];
}

- (void)viewDidUnload
{
    [imageView release];
    imageView = nil;
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
