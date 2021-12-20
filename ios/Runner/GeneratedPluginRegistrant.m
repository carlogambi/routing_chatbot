//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<here_sdk/HereSdkPlugin.h>)
#import <here_sdk/HereSdkPlugin.h>
#else
@import here_sdk;
#endif

#if __has_include(<location/LocationPlugin.h>)
#import <location/LocationPlugin.h>
#else
@import location;
#endif

#if __has_include(<maps_launcher/MapsLauncherPlugin.h>)
#import <maps_launcher/MapsLauncherPlugin.h>
#else
@import maps_launcher;
#endif

#if __has_include(<url_launcher/FLTURLLauncherPlugin.h>)
#import <url_launcher/FLTURLLauncherPlugin.h>
#else
@import url_launcher;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [HereSdkPlugin registerWithRegistrar:[registry registrarForPlugin:@"HereSdkPlugin"]];
  [LocationPlugin registerWithRegistrar:[registry registrarForPlugin:@"LocationPlugin"]];
  [MapsLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"MapsLauncherPlugin"]];
  [FLTURLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTURLLauncherPlugin"]];
}

@end
