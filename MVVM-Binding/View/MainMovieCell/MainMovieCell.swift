//
//  MainMovieCell.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 03/01/2024.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {

  public static var identifier: String {
    get {
      return "MainMovieCell"
    }
  }

  public static func register() -> UINib {
    UINib(nibName: "MainMovieCell", bundle: nil)
  }

  //MARK: - OBOutlet
  @IBOutlet weak var backView: UIView!
  @IBOutlet weak var movieImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var rateLabel: UILabel!


  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    backView.addBorder(color: .label, width: 1)
    backView.round()
    backView.backgroundColor = .lightGray
    movieImageView.round(5)
    }

  func setupCell(viewModel: MovieTableCellViewModel) {
    self.nameLabel.text = viewModel.title
    self.dateLabel.text = viewModel.date
    self.rateLabel.text = viewModel.rating
    self.imageView?.sd_setImage(with: viewModel.imageUrl)

  }

    
}
