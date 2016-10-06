#include <ReplayKit.h>
#import <UIKit/UIKit.h>
#import <ReplayKit/ReplayKit.h>

using namespace replaykit;

@interface ReplayKitController : UIViewController <RPPreviewViewControllerDelegate,RPScreenRecorderDelegate>
{

}

@end

//----------//----------//----------//----------//----------//----------//

@implementation ReplayKitController

- (void)StartRecording
{
    NSLog(@"startrecording");
    RPScreenRecorder* recorder =  RPScreenRecorder.sharedRecorder;
    recorder.delegate = self;
    [recorder startRecordingWithMicrophoneEnabled:YES handler:^(NSError *error) {
        
        if(error)
        {
            //[self ShowRecordAlert:error.localizedDescription];
            NSLog(@"error start recording");
        }
    }];
}

- (void)StopRecording
{
    NSLog(@"stoprecording");
    RPScreenRecorder* recorder = RPScreenRecorder.sharedRecorder;
    
    [recorder stopRecordingWithHandler:^(RPPreviewViewController * previewViewController,
                                         NSError * error) {
        
        if(error)
        {
            //[self ShowRecordAlert:error.localizedDescription];
             NSLog(@"error stop recording");
        }
        
        if(previewViewController)
        {
            previewViewController.previewControllerDelegate = self;
            
            //TiIOSDevice* device = (TiIOSDevice*)Game::Get()->GetDevice();
            UIViewController* con = [[[UIApplication sharedApplication] keyWindow] rootViewController];
            
            previewViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            
            [con presentViewController:previewViewController animated:YES completion:nil];
        }
        
    }];
}


//Implements two callbacks to capture the error:

- (void)screenRecorder:(RPScreenRecorder *)screenRecorder
didStopRecordingWithError:(NSError *)error
 previewViewController:(RPPreviewViewController *)previewViewController
{
    NSLog(@"screenRecorder");
    if(error)
    {
        //[self ShowRecordAlert:error.localizedDescription];
        NSLog(@"error screenRecorder");
    }
}

- (void)previewControllerDidFinish:(RPPreviewViewController *)previewController
{
    NSLog(@"previewcontrollerdidFinish");
    [previewController dismissViewControllerAnimated:YES completion:nil];
}

@end

//----------//----------//----------//----------//----------//----------//

namespace replaykit

{
    static ReplayKitController *rpController;
    
    
    void startRecording()
    {
        if (rpController == nil)
        {
            rpController = [[ReplayKitController alloc] init];
        }
        
        [rpController StartRecording];
    }
    
    void stopRecording()
    {
        if (rpController == nil)
        {
            rpController = [[ReplayKitController alloc] init];
        }
        
        [rpController StopRecording];
        
    }
    
}
