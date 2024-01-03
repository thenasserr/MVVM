//
//  NetworkConstant.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 03/01/2024.
//

import Foundation

class NetworkConstant {
  public static var shared: NetworkConstant = NetworkConstant()

  private init() {

  }

  public var apiKey: String {
    get {
      return "ad34c2ce43a8071dfe7bb834f3b99937"
    }
  }

  public var serverAddress: String {
    get {
      return "https://api.themoviedb.org/3/"
    }
  }

  public var imgServerAddress: String {
    get {
      return "https://image.tmdb.org/t/p/w500/"
    }
  }
}
