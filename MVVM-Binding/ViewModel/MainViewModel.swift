//
//  MainViewModel.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 03/01/2024.
//

import Foundation


class MainViewModel {

  var isLoading: Observable<Bool> = Observable(false)
  var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
  var dataSource: TrendingMoviesModel?

  func numberOfSections() -> Int {
    1
  }

  func numberOfRows(in section: Int) -> Int {
    self.dataSource?.results.count ?? 0
  }

  //MARK: - Getting The Data From API
  func getData() {
    if isLoading.value ?? true {
      return
    }
    isLoading.value = true

    APICaller.getTrendingMovies { [weak self] result in
      self?.isLoading.value = false
      switch result {
      case .success(let data):
        print(data.results.count)
        self?.dataSource = data
        self?.mapCellData()
      case .failure(let error):
        print(error)
      }
    }
  }

  func mapCellData() {
    self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
  }

  func getMovietitle(movie: Movie) -> String {
    return movie.title ?? movie.name ?? ""
  }
}
