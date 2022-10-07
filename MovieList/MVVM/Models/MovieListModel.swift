//
//  MovieListModel.swift
//  MovieList
//
//  Created by mac 2019 on 10/7/22.
//

import Foundation

struct MovieListModel: Decodable {
    var page: Int?
    var results: [MovieModel]
    var totalPages: Int?
    var totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page  = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieModel: Decodable {
    var adult: Bool?
    var backdropPath: String?
    var genreIds: [Int]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Float?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Bool?
    var voteAverage: Float?
    var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult  = "adult"
        case backdropPath  = "backdrop_path"
        case genreIds  = "genre_ids"
        case id  = "id"
        case originalLanguage  = "original_language"
        case originalTitle  = "original_title"
        case overview  = "overview"
        case popularity  = "popularity"
        case posterPath  = "poster_path"
        case releaseDate  = "release_date"
        case title  = "title"
        case video  = "video"
        case voteAverage  = "vote_average"
        case voteCount  = "vote_count"
    }
}
