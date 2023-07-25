//
//  NYResult.swift
//  NYIOSCore
//
//  Created by muhammad sijjeel on 25/07/2023.
//

import Foundation

struct NYResult: Codable {
    let uri: String
    let url: String
    let id, assetID: Int
    let source: Source
    let publishedDate, updated, section: String
    let subsection: Subsection
    let nytdsection, adxKeywords: String
    let column: String?
    let byline: String
    let type: ResultType
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let media: [Media]
    let etaID: Int

    enum CodingKeys: String, CodingKey {
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
