//
//  DetailsMoviewViewController.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 04/01/2024.
//

import UIKit

class DetailsMoviewViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!

  var viewModel: DetailsViewModel

  init(viewModel: DetailsViewModel) {
    self.viewModel = viewModel
    super.init(nibName: "DetailsMoviewViewController", bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()

    configView()

    }

  func configView() {
    self.title = "Movie Details"
    titleLabel.text = viewModel.movietitle
    descriptionLabel.text = viewModel.movieDescription
    imageView.sd_setImage(with: viewModel.movieImage)
  }


}
