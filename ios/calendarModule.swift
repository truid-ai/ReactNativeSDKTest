//
//  truidContent.swift
//  AskariBankApp
//
//  Created by truID on 16/01/2024.
//

import React

// import SDKWrapper
import SwiftUI

import TensorFlowLite
import TruID

@objc(calendarModule)
class calendarModule: NSObject, RCTBridgeModule {
  static func moduleName() -> String! {
    "calendarModule"
  }

  struct GenerateTokenRequest: Codable {
    let token: String
    let platform: String
  }

  struct GenerateTokenResponse: Codable {
    let token: String
  }

  @objc static func requiresMainQueueSetup() -> Bool {
    return true
  }

  @objc(createCalendarEvent: testName: callback:)
  func createCalendarEvent(_ applicationToken: String, testName: String, callback: @escaping RCTResponseSenderBlock) {
    print("native module called with : ", testName)

    func dismiss() {
      if let reactNativeVC = RCTPresentedViewController() {
        reactNativeVC.dismiss(animated: false)
      }
    }

    DispatchQueue.main.async {
      let truidView = TruidMain(
        fingerprint_capture: true,
        fingerprint_selection: false,
        fingerprint_to_scan: .LEFT_4_RIGHT_4,
        enableHelpScreens: true,

        themeColor: Color(UIColor(red: 2/255, green: 131/255, blue: 203/255, alpha: 1.0)),

        success: { sessionResult in
          print("Session result:", sessionResult.id, sessionResult.status, sessionResult.livenessData)

          var fingerprintData: String
          var livenessData: String

          let encoder = JSONEncoder()
          if let data = try? encoder.encode(sessionResult.fingerprintsData), let str = String(data: data, encoding: String.Encoding.utf8) {
            fingerprintData = str
          } else {
            callback([nil, nil, "Unable to convert fingerdata to JSON"])
            return dismiss()
          }
          if let data = try? encoder.encode(sessionResult.livenessData), let str = String(data: data, encoding: String.Encoding.utf8) {
            livenessData = str
          } else {
            callback([nil, nil, "Unable to convert livenessData to JSON"])
            return dismiss()
          }

          callback([fingerprintData, livenessData, nil])
          return dismiss()
        },
        failure: { error in
          print("Error:", error)
          callback([nil, nil, error])
        }
      )
      let rootView = UIHostingController(rootView: truidView)
      rootView.modalPresentationStyle = .fullScreen

      if let reactNativeVC = RCTPresentedViewController() {
        reactNativeVC.present(rootView, animated: false)
      }
    }
  }
}
