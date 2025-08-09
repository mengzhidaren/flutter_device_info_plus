# Flutter Device Info Plus Example

This example demonstrates how to use the `flutter_device_info_plus` package to retrieve comprehensive device information including hardware specifications, system details, and capabilities.

## Features Demonstrated

- 📱 **Device Information**: Name, manufacturer, model, brand
- 🖥️ **System Information**: OS version, build number, kernel version
- ⚙️ **Hardware Specifications**: CPU details, memory, storage
- 📺 **Display Information**: Resolution, density, refresh rate
- 🔋 **Battery Information**: Level, health, charging status
- 🔍 **Sensor Information**: Available sensors and capabilities
- 🌐 **Network Information**: Connection type, speed, IP address
- 🔒 **Security Information**: Device security features and status

## Running the Example

1. Ensure you have Flutter installed and set up
2. Navigate to the example directory:
   ```bash
   cd example
   ```
3. Get dependencies:
   ```bash
   flutter pub get
   ```
4. Run the example:
   ```bash
   flutter run
   ```

## Code Structure

- **main.dart**: Main application entry point and device info screen
- **pubspec.yaml**: Dependencies and configuration

## Key Implementation Points

### Basic Usage

```dart
import 'package:flutter_device_info_plus/flutter_device_info_plus.dart';

final deviceInfo = FlutterDeviceInfoPlus();
final info = await deviceInfo.getDeviceInfo();

print('Device: ${info.deviceName}');
print('OS: ${info.operatingSystem} ${info.systemVersion}');
print('CPU: ${info.processorInfo.architecture}');
```

### Error Handling

```dart
try {
  final info = await deviceInfo.getDeviceInfo();
  // Use device information
} catch (e) {
  // Handle errors appropriately
  print('Error getting device info: $e');
}
```

### Accessing Specific Information

```dart
// Memory information
final totalRAM = info.memoryInfo.totalPhysicalMemoryMB;
final availableRAM = info.memoryInfo.availablePhysicalMemoryMB;

// Display information
final resolution = info.displayInfo.resolutionString;
final isHighDensity = info.displayInfo.isHighDensity;

// Battery information (if available)
if (info.batteryInfo != null) {
  final batteryLevel = info.batteryInfo!.batteryLevel;
  final isCharging = info.batteryInfo!.isCharging;
}

// Security information
final securityScore = info.securityInfo.securityScore;
final securityLevel = info.securityInfo.securityLevel;
```

## Platform Support

The example works on all supported platforms:

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## Screenshots

The example app displays device information in organized cards:

1. **Device Information Card**: Basic device details
2. **System Information Card**: OS and kernel information
3. **Hardware Specifications Card**: CPU and memory details
4. **Display Information Card**: Screen specifications
5. **Battery Information Card**: Battery status (mobile platforms)
6. **Sensor Information Card**: Available sensors
7. **Network Information Card**: Connection details
8. **Security Information Card**: Security features and status

## Customization

You can customize the example by:

- Adding more information fields
- Changing the UI layout and styling
- Implementing real-time updates for dynamic data
- Adding export functionality for device reports
- Creating platform-specific views

## Learn More

- [Package Documentation](../README.md)
- [API Reference](https://pub.dev/documentation/flutter_device_info_plus)
- [Flutter Documentation](https://docs.flutter.dev/)
