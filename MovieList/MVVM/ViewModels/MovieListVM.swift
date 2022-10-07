//
//  MovieListVM.swift
//  MovieList
//
//  Created by mac 2019 on 10/7/22.
//

import Foundation

class MovieListVM {
    var movieList: [MovieModel]?
    
    func getMovieList(onResult: @escaping (_ message: String?, _ error: String?) -> Void) {
        let params: [String: String] = ["api_key": APIConstants.apiKey, "query": "marvel"]
        print("params: \(params)")
        UserServices.shared.getRequest(type: MovieListModel.self, endPoint: APIConstants.movieList, params: params) {[weak self] (value, error) in
            if value != nil { // success
                self?.movieList = value?.results
                onResult("success", nil)
            }
            else { // error
                onResult(nil, (error?.localizedDescription ?? "error"))
            }
        }
    }
}
