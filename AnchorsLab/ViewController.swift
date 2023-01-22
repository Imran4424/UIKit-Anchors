//
//  ViewController.swift
//  AnchorsLab
//
//  Created by Shah Md Imran Hossain on 22/1/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }

    private func setupViews() {
        let upperLeftLabel = makeLabel(withText: "upperLeft")
        let upperRightLabel = makeLabel(withText: "upperRight")
        let bottomLeftLabel = makeSecondaryLabel(withText: "bottomLeft")
        let payBillButoon = makeButton(withText: "Pay Bill")
        let redView = makeView()
        
        view.addSubview(upperLeftLabel)
        view.addSubview(upperRightLabel)
        view.addSubview(bottomLeftLabel)
        view.addSubview(payBillButoon)
        view.addSubview(redView)
        
        // upper left label
        // for top anchor view will hide under status bar and navigation bar with below code
        //        upperLeftLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        // using the safeAreaLayoutGuide this issue will be fixed
        upperLeftLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        upperLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        // upper right label
        NSLayoutConstraint.activate([
            upperRightLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            // - 8 because upperRightLabel is the first operator
            // if view is the first operator, then constant will be 8
            // to understant this better think about axis space, for x axis
            // positive is left to right
            // negative is right to left
            // and first operator becomes the main center point
            upperRightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        // bottom left
        NSLayoutConstraint.activate([
            bottomLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            // - 8 because bottomLeftLabel is the first operator
            // if view is the first operator, then constant will be 8
            // to understant this better think about axis space, for y axis
            // positive is top to bottom
            // negative is bottom to top
            // and first operator becomes the main center point
            bottomLeftLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        // pay bill button
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalTo: payBillButoon.trailingAnchor, constant: 8),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: payBillButoon.bottomAnchor, constant: 8)
        ])
        
        // red view
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            // option 1: size explicitly
//            redView.heightAnchor.constraint(equalToConstant: 50),
//            redView.widthAnchor.constraint(equalToConstant: 100)
            // option 2: dynamic size(pinning)
            // width
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            // height
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70)
        ])
    }
}

// MARK: - Factory methods
extension ViewController {
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // important
        label.text = text
        label.backgroundColor = .yellow
        
        return label
    }
    
    func makeSecondaryLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellow
        label.text = text
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        
        return label
    }
    
    func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.backgroundColor = .green
        
        return button
    }
    
    func makeView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        return view
    }
}
