//
//  MediaMetaData.swift
//  NYIOSCore
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import Foundation

public struct MediaMetadata: Codable {
    public let url: String
    public let format: Format
    public let height, width: Int
}
