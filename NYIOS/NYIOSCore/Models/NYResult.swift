//
//  NYResult.swift
//  NYIOSCore
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import Foundation

public struct NYResult: Codable, Identifiable {
    public let uri: String
    public let url: String
    public let id, assetID: Int
    public let source: Source
    public let publishedDate, updated, section: String
    public let subsection: String
    public let nytdsection, adxKeywords: String
    public let column: String?
    public let byline: String
    public let type: ResultType
    public let title, abstract: String
    public let desFacet, orgFacet, perFacet, geoFacet: [String]
    public let media: [Media]
    public let etaID: Int

    private enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case column, byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}
