//
//  CalculatorViewController.swift
//  Calculator
//

import UIKit

class CalculatorViewController: UIViewController {

    let logoImage = LogoImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(logoImage)
        logoImage.setupLogo()
    }

}

