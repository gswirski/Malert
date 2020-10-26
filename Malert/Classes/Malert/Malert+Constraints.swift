//
//  Malert+Constraints.swift
//  Malert
//
//  Created by Vitor Mesquita on 16/07/2018.
//

import UIKit

extension Malert {
   
   func makeContraints() {
      NSLayoutConstraint.deactivate(visibleViewConstraints)
      
      visibleViewConstraints = [
         visibleView.topAnchor.constraint(equalTo: view.topAnchor),
         visibleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         visibleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         visibleView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -keyboardRect.size.height)
      ]
      
      NSLayoutConstraint.activate(visibleViewConstraints)
      visibleView.layoutIfNeeded()
      
      NSLayoutConstraint.deactivate(malertConstraints)
      
      let leadingConstraint = malertView.leadingAnchor.constraint(equalTo: visibleView.leadingAnchor, constant: 16)
      leadingConstraint.priority = .defaultHigh
      let trailingConstraint = malertView.trailingAnchor.constraint(equalTo: visibleView.trailingAnchor, constant: -16)
      trailingConstraint.priority = .defaultHigh
      let widthConstraint = malertView.widthAnchor.constraint(lessThanOrEqualToConstant: 350)
      widthConstraint.priority = .required
      
      malertConstraints = [
         malertView.centerXAnchor.constraint(equalTo: visibleView.centerXAnchor),
         malertView.centerYAnchor.constraint(equalTo: visibleView.centerYAnchor),
         trailingConstraint,
         leadingConstraint,
         widthConstraint
      ]
      
      NSLayoutConstraint.activate(malertConstraints)
      malertView.layoutIfNeeded()
   }
}
