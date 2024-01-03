//
//  APICaller.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 03/01/2024.
//

import Foundation


enum NetworkError: Error {
  case urlError
  case canNotParseData
}


public class APICaller {

  static func getTrendingMovies(completion: @escaping (Result<TrendingMoviesModel, NetworkError>) -> Void) {
    let urlString = NetworkConstant.shared.serverAddress +
    "trending/all/day?api_key=" +
    NetworkConstant.shared.apiKey

    guard let url = URL(string: urlString) else {
      completion(.failure(NetworkError.urlError))
      return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
      if error == nil,
         let data = data,
         let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
        completion(.success(resultData))
      } else {
        completion(.failure(NetworkError.canNotParseData))
      }
    }
    .resume()
  }
}
