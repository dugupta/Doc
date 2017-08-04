//
//  Music.swift
//  Weather
//
//  Created by Durgesh Lal Gupta on 2/28/17.
//  Copyright © 2017 Durgesh Lal Gupta. All rights reserved.
//

import Foundation


public struct Music {
    
    public var kind: String?
    public var discCount: Int?
    public var discNumber: Int?
    public var country: String?
    public var trackId: Double?
    public var trackCount: Int?
    public var trackNumber: Int?
    public var currency: String?
    public var trackName: String?
    public var collectionId: Int?
    public var trackPrice: Double?
    public var artistName: String?
    public var previewUrl: String?
    public var wrapperType: String?
    public var releaseDate: String?
    public var trackTimeMillis: Int?
    public var artworkUrl60: String?
    public var trackViewUrl: String?
    public var artworkUrl30: String?
    public var trackHdPrice: Double?
    public var artworkUrl100: String?
    public var collectionName: String?
    public var longDescription: String?
    public var collectionPrice: Double?
    public var hasITunesExtras: String?
    public var collectionArtistId: Int?
    public var primaryGenreName: String?
    public var trackRentalPrice: Double?
    public var shortDescription: String?
    public var collectionViewUrl: String?
    public var trackExplicitness: String?
    public var trackCensoredName: String?
    public var collectionHdPrice: Double?
    public var contentAdvisoryRating: String?
    public var collectionExplicitness: String?
    public var collectionArtistViewUrl: String?
    
    init(data: NSDictionary) {
        
        self.kind = data["kind"] as? String
        self.country = data["country"] as? String
        self.trackId = data["trackId"] as? Double
        self.discCount = data["discCount"] as? Int
        self.discNumber = data["discNumber"] as? Int
        self.trackCount = data["trackCount"] as? Int
        self.trackName = data["trackName"] as? String
        self.trackNumber = data["trackNumber"] as? Int
        self.trackPrice = data["trackPrice"] as? Double
        self.artistName = data["artistName"] as? String
        self.previewUrl = data["previewUrl"] as? String
        self.collectionId = data["collectionId"] as? Int
        self.wrapperType = data["wrapperType"] as? String
        self.releaseDate = data["releaseDate"] as? String
        self.artworkUrl60 = data["artworkUrl60"] as? String
        self.trackViewUrl = data["trackViewUrl"] as? String
        self.artworkUrl30 = data["artworkUrl30"] as? String
        self.trackHdPrice = data["trackHdPrice"] as? Double
        self.artworkUrl100 = data["artworkUrl100"] as? String
        self.trackTimeMillis = data["trackTimeMillis"] as? Int
        self.collectionName = data["collectionName"] as? String
        self.longDescription = data["longDescription"] as? String
        self.collectionPrice = data["collectionPrice"] as? Double
        self.hasITunesExtras = data["hasITunesExtras"] as? String
        self.collectionArtistId = data["collectionArtistId"] as? Int
        self.primaryGenreName = data["primaryGenreName"] as? String
        self.trackRentalPrice = data["trackRentalPrice"] as? Double
        self.shortDescription = data["shortDescription"] as? String
        self.collectionViewUrl = data["collectionViewUrl"] as? String
        self.trackExplicitness = data["trackExplicitness"] as? String
        self.trackCensoredName = data["trackCensoredName"] as? String
        self.collectionHdPrice = data["collectionHdPrice"] as? Double
        self.contentAdvisoryRating = data["contentAdvisoryRating"] as? String
        self.collectionExplicitness = data["collectionExplicitness"] as? String
        self.collectionArtistViewUrl = data["collectionArtistViewUrl"] as? String
        
    }
}

