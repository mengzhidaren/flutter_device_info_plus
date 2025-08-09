import Cocoa
import FlutterMacOS

public class FlutterDeviceInfoPlusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_device_info_plus", binaryMessenger: registrar.messenger)
    let instance = FlutterDeviceInfoPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "getDeviceInfo":
      result(getDeviceInfo())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
  
  private func getDeviceInfo() -> [String: Any] {
    let processInfo = ProcessInfo.processInfo
    return [
      "computerName": Host.current().localizedName ?? "Unknown",
      "hostName": Host.current().name ?? "Unknown",
      "arch": processInfo.processorCount,
      "kernelVersion": processInfo.operatingSystemVersionString,
      "osRelease": processInfo.operatingSystemVersionString,
      "model": getModelIdentifier(),
      "memorySize": processInfo.physicalMemory
    ]
  }
  
  private func getModelIdentifier() -> String {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
      guard let value = element.value as? Int8, value != 0 else { return identifier }
      return identifier + String(UnicodeScalar(UInt8(value))!)
    }
    return identifier
  }
}
