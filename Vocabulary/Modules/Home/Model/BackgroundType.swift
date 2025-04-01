//
//  BackgroundType.swift
//  Vocabulary
//
//  Created by Mena Gamal on 01/04/2025.
//

import UIKit

enum BackgroundType: Codable {
    case color(hex: String)
    case image(name: String)
    case video(name: String)

    var identifier: String {
        switch self {
        case .color(let hex): return "color:\(hex)"
        case .image(let name): return "image:\(name)"
        case .video(let name): return "video:\(name)"
        }
    }

    static func from(identifier: String) -> BackgroundType? {
        if identifier.hasPrefix("color:") {
            let hex = String(identifier.dropFirst(6))
            return .color(hex: hex)
        } else if identifier.hasPrefix("image:") {
            let name = String(identifier.dropFirst(6))
            return .image(name: name)
        } else if identifier.hasPrefix("video:") {
            let name = String(identifier.dropFirst(6))
            return .video(name: name)
        }
        return nil
    }
}
