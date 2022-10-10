//
//  MainViewController.swift
//  Calc
//
//  Created by Vadim on 09.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainStackView = MainStackView()
    
    private let calculationModel = CalculationModel()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 60)
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.toAutoLayout()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(mainStackView)
        view.addSubview(resultLabel)
        
        mainStackView.delegate = self
    }
}

extension MainViewController: MainStackViewProtocol {
    func tapNumberButton(tag: Int) {
        
        calculationModel.setNumber(number: tag)
        resultLabel.text = calculationModel.getCurrentNumber()
    }
    
    func tapActionButton(tag: Int) {
        
        switch tag {
            
        case 10:
            calculationModel.addPointValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 11:
            resultLabel.text = calculationModel.getResult()
        case 12:
            resultLabel.text = calculationModel.setOperation(opearation: .addition)
        case 13:
            resultLabel.text = calculationModel.setOperation(opearation: .substraction)
        case 14:
            resultLabel.text = calculationModel.setOperation(opearation: .multiplication)
        case 15:
            resultLabel.text = calculationModel.setOperation(opearation: .division)
        case 16:
            calculationModel.setPercentNumber()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 17:
            calculationModel.invertValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 18:
            calculationModel.resetValues()
            resultLabel.text = "0"
        default:
            print("error tag")
        }
    }
    
    
}

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            resultLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -10),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}

