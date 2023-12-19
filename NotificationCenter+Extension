//
//  NotificationCenter+Extension.swift
//  CodeVault
//
//  Created by Rattanakoudom Sambath on 12/9/23.
//

extension Foundation.Notification.Name {
    static let GetLoyaltyBadgeValueNotification: Self = Notification.Name.init(rawValue: "kGetLoyaltyBadgeValueNotification")
}

// MARK: - Usage

// Non-Paramter
// Sender
NotificationCenter.default.post(
    name: .GetLoyaltyBadgeValueNotification,
    object: nil,
    userInfo: nil
)

// Receiver
NotificationCenter.default.addObserver(self,
    selector: #selector(updateLoyaltyBadgeView(_:)),
    name: .GetLoyaltyBadgeValueNotification,
    object: nil
)

// NotificationCenter with Non-Parameter
@objc func updateLoyaltyBadgeView() {
    /// Definition
}

// Parameter
// Sender
NotificationCenter.default.post(
    name: .GetLoyaltyBadgeValueNotification,
    object: nil,
    userInfo: ["loyaltyBadgeValue": "\(loyaltyBadgeValue)"]
)

// Receiver
NotificationCenter.default.addObserver(self,
    selector: #selector(updateLoyaltyBadgeView(_:)),
    name: .GetLoyaltyBadgeValueNotification,
    object: nil
)

// NotificationCenter with Parameter
@objc func updateLoyaltyBadgeView(_ notification: NSNotification) {
    guard
        let loyaltyBadgeNumber = notification.userInfo?["loyaltyBadgeValue"] as? String
    else { return }
}
