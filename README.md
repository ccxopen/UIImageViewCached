# UIImageViewCached

A simple standalone Objective-C category extending the UIImageView class to add image loading and caching, and a simple example application showing its use.

Jaanus Kase, <http://www.jaanuskase.com>

## How to get started

Have a regular UIImageView anywhere in your app. Bundle the image that you consider to be the default with your app, and set the UIImageView’s image property to be that image. Then, in your implementation, whenever you need to replace the default image with one from network:

    #import "UIImageView+Cached.h"
    
    [myImageView loadImageFromUrl:[NSURL URLWithString:@"http://example.com/yourImage.png"]];

That’s it. Just one method.

I have tested the example app in Xcode 4 and iOS 4.3.1.

## Change log

### April 10, 2011

* Initial release.

## Motivation

Showing placeholder images and replacing them with ones from network is a common function in today’s iPhone apps. There are many libraries out there, such as three20’s TTImageView, which already provide this functionality. But you end up coupling yourself to big libraries, and I don’t like the constant compiler warnings I get with three20. So I figured I’ll have a barebones category that does the loading, and uses ASIHTTPRequest’s excellent caching facilities, so it transparently works even when offline.

If I subclassed UIImageView, I could add a delegate and provide extra feedback to the caller, such as when the load succeeds or fails. But, It wasn’t necessary for my own apps, so I went for the simpler barebones way for now.

## Required frameworks

Besides UIImageView+Cached category, you need to add the ASIHTTPRequest code to your app if it’s not part of your app already.

Make sure you have the following frameworks added to your project, as ASIHTTPRequest requires them.

* MobileCoreServices.framework
* Security.framework
* CFNetwork.framework
* libz.1.2.3.dylib
* SystemConfiguration.framework
* UIKit.framework
* Foundation.framework
* CoreGraphics.framework

## License (MIT)

Copyright (c) 2010 Jaanus Kase

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
