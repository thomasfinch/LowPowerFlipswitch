#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface _CDBatterySaver : NSObject
+ (id)batterySaver;
- (int)getPowerMode;
- (int)setMode:(int)arg1;
- (BOOL)setPowerMode:(int)arg1 error:(id*)arg2;
@end

@interface LowPowerFlipswitchSwitch : NSObject <FSSwitchDataSource>
@end

@implementation LowPowerFlipswitchSwitch

- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
	return @"Low Power Mode";
}

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	return ([[_CDBatterySaver batterySaver] getPowerMode] == 1) ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
	switch (newState) {
	case FSSwitchStateIndeterminate:
		break;
	case FSSwitchStateOn:
		[[_CDBatterySaver batterySaver] setMode:1];
		break;
	case FSSwitchStateOff:
		[[_CDBatterySaver batterySaver] setMode:0];
		break;
	}
	return;
}

@end
