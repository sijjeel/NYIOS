//
//  Media.swift
//  NYIOSCore
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import Foundation

public struct Media: Codable {
    public let type: MediaType
    public let subtype: Subtype
    public let caption, copyright: String
    public let approvedForSyndication: Int
    public let mediaMetadata: [MediaMetadata]

    private enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}
