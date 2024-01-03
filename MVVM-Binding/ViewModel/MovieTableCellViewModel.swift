//
//  MovieTableCellViewModel.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 03/01/2024.
//

import Foundation

class MovieTableCellViewModel {
  var id: Int
  var title: String
  var date: String
  var rating: String
  var imageUrl: URL?

  init(movie: Movie) {
    self.id = movie.id
    self.title = movie.title ?? movie.name ?? ""
    self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
    self.rating = "\(movie.voteCount)/10"
    self.imageUrl = makeImageURL(movie.posterPath ?? "")
  }

  private func makeImageURL( _ imageCode: String) -> URL? {
    URL(string: "\(NetworkConstant.shared.imgServerAddress)\(imageCode)")
  }
}
