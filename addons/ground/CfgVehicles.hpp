class CfgVehicles {
	class Car_F;

	class Offroad_01_base_F: Car_F {
		orbis_towBarAngle = -1;
		orbis_towBarPosRel[] = {-0.042, 4.98, -0.88};
		orbis_towBarCheckStart[] = {-0.3, 7.46, -0.87};
		orbis_towBarCheckEnd[] = {0.22, 7.46, -0.87};
		class UserActions {
			class attachTowBar {
				displayName = "Connect Plane to Towbar";
				priority = 1.5;
				radius = 2;
				position = "temp";
				showWindow = 1;
				hideOnUse = 1;
				onlyForplayer = 0;
				condition = QUOTE([this] call FUNC(canAttachTowingVehicle));
				statement = QUOTE([this] call FUNC(attachTowingVehicle));
			};
			class detachTowBar: attachTowBar {
				displayName = "Disconnect Plane from Towbar";
				condition = QUOTE([this] call FUNC(canDetachTowingVehicle));
				statement = QUOTE([this] call FUNC(detachTowingVehicle));
			};
			/* class beacons_start {
				condition = "driver this isEqualTo player AND {this animationPhase 'hidePolice' < 0.5 OR this animationPhase 'hideServices' < 0.5} AND {this animationSourcePhase 'Beacons' < 0.5}";
				statement = "this animateSource ['Beacons',1];";
			};
			class beacons_stop: beacons_start {
				condition = "driver this isEqualTo player AND {this animationPhase 'hidePolice' < 0.5 OR this animationPhase 'hideServices' < 0.5} AND {this animationSourcePhase 'Beacons' > 0.5}";
				statement = "this animateSource ['Beacons',0];";
			}; */
		};
	};
	class Offroad_01_repair_base_F: Offroad_01_base_F {
		orbis_towBarAngle = -1;
		orbis_towBarPosRel[] = {-0.042, 5.10, -0.95};
		orbis_towBarCheckStart[] = {-0.3, 7.58, -0.94};
		orbis_towBarCheckEnd[] = {0.22, 7.58, -0.94};
	};
};
