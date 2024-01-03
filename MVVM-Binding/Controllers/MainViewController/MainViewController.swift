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

  //MARK: - ViewModel
  var viewModel: MainViewModel = MainViewModel()
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      self.title = "Main View"
    configView()
    }

  override func viewDidAppear(_ animated: Bool) {
    viewModel.getData()
  }

  func configView() {
    self.title = "Main View"
    view.backgroundColor = .red
    setupTableView()
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

  func registerCell() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel.numberOfSections()
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows(in: section)
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "\(indexPath.row)"
    return cell
  }

}
