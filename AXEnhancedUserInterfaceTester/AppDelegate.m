//
//  AppDelegate.m
//  AXEnhancedUserInterfaceTester
//
//  Created by Andreas Hegenberg on 20.09.22.
//

#import "AppDelegate.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:(id)kCFBooleanTrue, kAXTrustedCheckOptionPrompt, nil];
    
    if(AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef)options)) {
        NSLog(@"trusted");
    } else {
        NSLog(@"not trusted");
        NSURL *URL = [NSURL URLWithString:@"x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"];
        [[NSWorkspace sharedWorkspace] openURL:URL];
    }
    
  
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
