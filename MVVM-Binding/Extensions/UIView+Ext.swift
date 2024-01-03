//
//  UIView+Ext.swift
//  MVVM-Binding
//
//  Created by Ibrahim Nasser Ibrahim on 03/01/2024.
//

import UIKit


extension UIView {
  func round( _ radiuis: CGFloat = 10) {
    self.layer.cornerRadius = radiuis
    self.clipsToBounds = true
  }
  func addBorder(color: UIColor, width: CGFloat) {
    self.layer.borderWidth = width
    self.layer.borderColor = color.cgColor
  }
}
