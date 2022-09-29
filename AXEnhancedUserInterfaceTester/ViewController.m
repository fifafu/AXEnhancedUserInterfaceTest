//
//  ViewController.m
//  AXEnhancedUserInterfaceTester
//
//  Created by Andreas Hegenberg on 20.09.22.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
   
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)axEnhancedON:(id)sender {
    
    NSRunningApplication *running = [NSRunningApplication runningApplicationsWithBundleIdentifier:self.bundleIdentifierField.stringValue].firstObject;
    
    
    AXUIElementRef chromeApp = AXUIElementCreateApplication(running.processIdentifier);
    AXUIElementSetAttributeValue((AXUIElementRef) chromeApp, (CFStringRef)@"AXEnhancedUserInterface", kCFBooleanTrue);

}

- (IBAction)axEnhancedOFF:(id)sender {
    
    NSRunningApplication *running = [NSRunningApplication runningApplicationsWithBundleIdentifier:self.bundleIdentifierField.stringValue].firstObject;
    
    
    AXUIElementRef chromeApp = AXUIElementCreateApplication(running.processIdentifier);
    
      AXUIElementSetAttributeValue((AXUIElementRef) chromeApp, (CFStringRef)@"AXEnhancedUserInterface", kCFBooleanFalse);

}

- (IBAction)axEnhancedONOFF100:(id)sender {
    NSRunningApplication *running = [NSRunningApplication runningApplicationsWithBundleIdentifier:self.bundleIdentifierField.stringValue].firstObject;
    
    
    AXUIElementRef chromeApp = AXUIElementCreateApplication(running.processIdentifier);

    for(NSInteger i=0; i<= 100;i++) {
        AXUIElementSetAttributeValue((AXUIElementRef) chromeApp, (CFStringRef)@"AXEnhancedUserInterface", kCFBooleanTrue);

        AXUIElementSetAttributeValue((AXUIElementRef) chromeApp, (CFStringRef)@"AXEnhancedUserInterface", kCFBooleanFalse);
    }
}


- (IBAction)openLargeSites:(id)sender {
    NSString *openCommand = [NSString stringWithFormat:@"open -b %@ https://source.chromium.org/chromium/chromium/src/+/main:content/browser/renderer_host/render_frame_host_impl.cc", self.bundleIdentifierField.stringValue];
    for(NSInteger i=0; i<10;i++) {
        system(openCommand.UTF8String);
    }
}

- (IBAction)resizeChrome:(id)sender {
    [self axEnhancedOFF:nil];
    NSRunningApplication *running = [NSRunningApplication runningApplicationsWithBundleIdentifier:self.bundleIdentifierField.stringValue].firstObject;
    
    
    AXUIElementRef chromeApp = AXUIElementCreateApplication(running.processIdentifier);
    
    CFTypeRef sizeVal;
    CGSize newSize = CGSizeMake(500, 500);
    sizeVal = AXValueCreate(kAXValueCGSizeType, &newSize);

    
    CFTypeRef posVal;
    CGPoint newPosition = CGPointMake(0, 0);
    posVal = AXValueCreate(kAXValueCGPointType, &newPosition);

    
    AXUIElementRef focusedChromeWindow = nil;
    AXUIElementCopyAttributeValue(chromeApp, kAXFocusedWindowAttribute, (CFTypeRef *)(void *)&focusedChromeWindow);
    
    AXUIElementSetAttributeValue((AXUIElementRef)focusedChromeWindow,
                                    kAXSizeAttribute,
                                 sizeVal);
    AXUIElementSetAttributeValue((AXUIElementRef)focusedChromeWindow,
                                    kAXPositionAttribute,
                                 posVal);
    [self axEnhancedON:nil];

}



@end
