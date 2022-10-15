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
    
    private let historyLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .gray
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
        view.addSubview(historyLabel)
        
        mainStackView.delegate = self
    }
}

extension MainViewController: MainStackViewProtocol {
    func tapNumberButton(tag: Int) {
        
        calculationModel.setNumber(number: tag)
        resultLabel.text = calculationModel.getCurrentNumber()
        historyLabel.text = calculationModel.getCalculaionHistory(tag: tag)
    }
    
    func tapActionButton(tag: Int) {
        
        switch tag {
            
        case 10:
            historyLabel.text = calculationModel.getCalculaionHistory(tag: tag)
            calculationModel.addPointValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 11:
            resultLabel.text = calculationModel.getResult()
        case 12:
            resultLabel.text = calculationModel.setOperation(opearation: .addition)
            historyLabel.text = calculationModel.getCalculaionHistory(tag: tag)
        case 13:
            resultLabel.text = calculationModel.setOperation(opearation: .substraction)
            historyLabel.text = calculationModel.getCalculaionHistory(tag: tag)
        case 14:
            resultLabel.text = calculationModel.setOperation(opearation: .multiplication)
            historyLabel.text = calculationModel.getCalculaionHistory(tag: tag)
        case 15:
            resultLabel.text = calculationModel.setOperation(opearation: .division)
            historyLabel.text = calculationModel.getCalculaionHistory(tag: tag)
        case 16:
            calculationModel.setPercentNumber()
            resultLabel.text = calculationModel.getCurrentNumber()
            historyLabel.text = calculationModel.getCalculaionHistory(tag: tag)
        case 17:
            historyLabel.text = calculationModel.getCalculaionHistory(tag: tag)
            calculationModel.invertValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 18:
            calculationModel.resetValues()
            resultLabel.text = "0"
            historyLabel.text = "0"
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
            
            historyLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -5),
            historyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            historyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            resultLabel.bottomAnchor.constraint(equalTo: historyLabel.topAnchor, constant: -10),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}

