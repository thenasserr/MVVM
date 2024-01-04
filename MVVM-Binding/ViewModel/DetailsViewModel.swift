//
//  DetailsViewModel.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 04/01/2024.
//

import Foundation

class DetailsViewModel {
  
  var movie: Movie
  var movieImage: URL?
  var movietitle: String
  var movieDescription: String
  var movieID: Int

  init(movie: Movie) {
    self.movie = movie
    self.movietitle = movie.title ?? movie.name ?? ""
    self.movieDescription = movie.overview ?? ""
    self.movieID = movie.id
    self.movieImage = makeImageURL(movie.backdropPath ?? "")
  }

  private func makeImageURL( _ imageCode: String) -> URL? {
    URL(string: "\(NetworkConstant.shared.imgServerAddress)\(imageCode)")
  }
}
