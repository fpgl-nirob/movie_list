//
//  AppConstants.swift
//  MovieList
//
//  Created by mac 2019 on 10/7/22.
//

import Foundation

//https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=marvel
struct APIConstants {
    static let apiKey = "38e61227f85671163c275f9bd95a8803"
    
    static let imageBaseUrl = "https://image.tmdb.org/t/p"
    
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let movieList = "search/movie"
}

enum AppTexts: String {
    case translate_id_0001
}
