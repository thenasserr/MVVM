//
//  MainViewModel.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 03/01/2024.
//

import Foundation


class MainViewModel {
  
  func numberOfSections() -> Int {
    1
  }

  func numberOfRows(in section: Int) -> Int {
    10
  }

  func getData() {
    APICaller.getTrendingMovies { result in
      switch result {

      case .success(let data):
        print(data.results.count)
      case .failure(let error):
        print(error)
      }
    }
  }
}
