//
//  MainViewController.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 03/01/2024.
//

import UIKit

class MainViewController: UIViewController {

  //MARK: - IBOutlet
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  //MARK: - ViewModel
  var viewModel: MainViewModel = MainViewModel()
  var cellDataSource: [MovieTableCellViewModel] = []

  override func viewDidLoad() {
        super.viewDidLoad()

    configView()
    bindViewModel()
    }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewModel.getData()
  }

  //MARK: - Configure View
  func configView() {
    self.title = "Main View"
    setupTableView()
  }

  //MARK: - Binding ViewModel
  func bindViewModel() {
    viewModel.isLoading.bind { [weak self] isLoading in
      guard let self = self, let isLoading = isLoading else {
        return
      }
      DispatchQueue.main.async {
        if isLoading {
          self.activityIndicator.startAnimating()
        } else {
          self.activityIndicator.stopAnimating()
        }
      }
    }

    viewModel.cellDataSource.bind { [weak self] movies in
      guard let self = self, let movies = movies else {
        return
      }
      self.cellDataSource = movies
      self.reloadTableView()
    }
  }

  func openDetails(movieid: Int) {
    guard let movie = viewModel.retriveMovie(with: movieid) else {
      return
    }
    let detailsViewModel = DetailsViewModel(movie: movie)
    let detailsController = DetailsMoviewViewController(viewModel: detailsViewModel)
    DispatchQueue.main.async {
      self.navigationController?.pushViewController(detailsController, animated: true)
    }
  }
}




//MARK: - TableView Delegate and DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {


  func setupTableView() {
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.backgroundColor = .clear
    self.registerCell()
  }

  func reloadTableView() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }

  func registerCell() {
    tableView.register(MainMovieCell.register(), forCellReuseIdentifier: MainMovieCell.identifier)
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows(in: section)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath) as? MainMovieCell else {
      return UITableViewCell()
    }
    let cellViewModel = cellDataSource[indexPath.row]
    cell.setupCell(viewModel: cellViewModel)
    cell.selectionStyle = .none
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let movieID = cellDataSource[indexPath.row].id
    self.openDetails(movieid: movieID)
  }

}
