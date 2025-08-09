import Flutter
import UIKit

public class FlutterDeviceInfoPlusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_device_info_plus", binaryMessenger: registrar.messenger())
    let instance = FlutterDeviceInfoPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getDeviceInfo":
      result(getDeviceInfo())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
  
  private func getDeviceInfo() -> [String: Any] {
    let device = UIDevice.current
    return [
      "name": device.name,
      "systemName": device.systemName,
      "systemVersion": device.systemVersion,
      "model": device.model,
      "localizedModel": device.localizedModel,
      "identifierForVendor": device.identifierForVendor?.uuidString ?? "unknown"
    ]
  }
}
