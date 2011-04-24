//
//  UIImageViewCached.m
//  UIImageViewCached
//
//  Created by Jaanus Kase on 09.04.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIImageView+Cached.h"
#import "ASIHTTPRequest.h"
#import "ASIDownloadCache.h"

@implementation UIImageView (Cached)

- (void) loadImageFromUrl:(NSURL *)url {
    
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:url];
    request.delegate = self;
    
    [request setDownloadCache:[ASIDownloadCache sharedCache]];
    [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    [request setCachePolicy:ASIAskServerIfModifiedWhenStaleCachePolicy|ASIFallbackToCacheIfLoadFailsCachePolicy];
    
    [request startAsynchronous];
    
}

#pragma mark -
#pragma mark ASIHTTPRequestDelegate

- (void)requestFinished:(ASIHTTPRequest *)request {
    
    self.image = [UIImage imageWithData:[request responseData]];

    [request setDelegate:nil];    
    [request cancel];
    [request release];
    request = nil;
}

- (void) requestFailed:(ASIHTTPRequest *)request {
    [request setDelegate:nil];    
    [request cancel];
    [request release];
    request = nil;
}

@end
