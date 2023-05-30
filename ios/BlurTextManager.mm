#import <React/RCTLog.h>
#import <React/RCTUIManager.h>
#import <React/RCTViewManager.h>

@interface BlurTextManager : RCTViewManager
@end

@implementation BlurTextManager

RCT_EXPORT_MODULE(BlurTextManager)

RCT_EXPORT_VIEW_PROPERTY(text, NSString)

@end
