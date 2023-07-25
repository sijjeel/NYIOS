//
//  MediaMetaData.swift
//  NYIOSCore
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import Foundation

struct MediaMetadata: Codable {
    let url: String
    let format: Format
    let height, width: Int
}
