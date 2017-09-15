#import <Preferences/Preferences.h>
#import "bluebear.h"
#import <UIKit/UIKit.h>

@implementation bluebearListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"bluebear" target:self] retain];
	}
	return _specifiers;
}

- (void)PayPal {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.paypal.me/KateUpton”]];
} 

- (void)Twitter {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.twitter.com/WhiteSauce"]];
}

- (void)GitHub {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.github.com/WhiteSauce"]];
}

- (void)Info {
	UIAlertView * alert =[[UIAlertView alloc] initWithTitle: @"Info" 
 message: @"Thanks for using BlueBear! \n \n Credits: \n WhiteSauce \n \n Version 2.2" delegate: nil cancelButtonTitle: @"Close!" 
 otherButtonTitles:nil];
	
[alert show];
	
[alert release];

}

- (void)double {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Disable Double Tap"
message:@"Disables YouTube's rewind/forward \n double tapping." delegate:nil cancelButtonTitle:@"Got it!"
otherButtonTitles:nil];
[alert show];
[alert release];
}
- (void)clean {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Clean Video UI"
message:@"Cleans up the video player by removing the \n Share, Add-to, and Cardboard buttons and video title." delegate:nil cancelButtonTitle:@"Got it!"
otherButtonTitles:nil];
[alert show];
[alert release];
}
- (void)mini {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mini UI"
message:@"Shrinks YouTube UI." delegate:nil cancelButtonTitle:@"Got it!"
otherButtonTitles:nil];
[alert show];
[alert release];
}
- (void)vertical {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Force Vertical Option"
message:@"Allows you to watch any video in vertical mode. \n (Black bars are added in non-vertical videos)." delegate:nil cancelButtonTitle:@"Got it!"
otherButtonTitles:nil];
[alert show];
[alert release];
}

@end

// vim:ft=objc
