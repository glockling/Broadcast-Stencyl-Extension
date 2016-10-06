#include <NativeTest.h>
#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>

@interface nativetest
@end

@implementation nativetest

@end

using namespace nativetest;

namespace nativetest
{
    
    static nativetest *Native;
    
    void showSystemAlert(const char *title, const char *message)
    {
        if(Native == NULL)
        {
            Native = [nativetest alloc];
        }
        
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"No Network!" message:@"Please connect to the internet and restart the game." delegate:Native cancelButtonTitle: @"OK" otherButtonTitles:nil];
    
        [alert show];

    }
}

