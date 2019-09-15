#import "FlutterNavigoPlugin.h"
#import <flutter_navigo/flutter_navigo-Swift.h>

@implementation FlutterNavigoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterNavigoPlugin registerWithRegistrar:registrar];
}
@end
