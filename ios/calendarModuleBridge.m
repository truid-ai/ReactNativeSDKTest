//
//  calendarModuleBridge.m
//  AwesomeProject
//
//  Created by truID on 08/07/2024.
//

//
//  CalendarModuleBridge.m
//  AskariBankApp
//
//  Created by truID on 17/01/2024.
//


#import <React/RCTBridge.h>

@interface RCT_EXTERN_MODULE(calendarModule, NSObject)


RCT_EXTERN_METHOD(createCalendarEvent:(NSString *)name testName:(NSString *)testName callback:(RCTResponseSenderBlock)callback)

@end
