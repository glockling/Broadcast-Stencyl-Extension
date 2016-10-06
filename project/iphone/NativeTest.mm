#include <Broadcast.h>
#import <Replaykit/Replaykit.h>

@interface Broadcast
@end

@implementation Broadcast

@end

using namespace Broadcast;

namespace Broadcast
{
    
    static Broadcast *ReplaykitBroadcast;
    
    void showSystemAlert(const char *title, const char *message)
    {
        if(ReplaykitBroadcast == NULL)
        {
            ReplaykitBroadcast = [ReplaykitBroadcast alloc];
        }
        
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"No Network!" message:@"Please connect to the internet and restart the game." delegate:ReplaykitBroadcast cancelButtonTitle: @"OK" otherButtonTitles:nil];
    
        [alert show];

    }
}

