//
//  MainStackView.swift
//  Calc
//
//  Created by Vadim on 09.10.2022.
//

import UIKit

protocol MainStackViewProtocol: AnyObject {
    func tapNumberButton(tag: Int)
    func tapActionButton(tag: Int)
}

class MainStackView: UIStackView {
    
    private var stackViewsArray = [UIStackView]()
    
    weak var delegate: MainStackViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMainStackView()
        configure()
        
        stackViewsArray.forEach { addArrangedSubview($0) }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        axis = .vertical
        spacing = 1
        distribution = .fillEqually
        toAutoLayout()
    }
    
    private func createButton(title: String, tag: Int, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tag = tag
        button.backgroundColor = color
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(keyboardButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc private func keyboardButtonTapped(sender: UIButton) {
        sender.tag < 10 ? delegate?.tapNumberButton(tag: sender.tag) : delegate?.tapActionButton(tag: sender.tag)
    }
    
    private func setupMainStackView() {
        let button0 = createButton(title: "0", tag: 0, color: .systemCyan)
        let buttonPoint = createButton(title: ",", tag: 10, color: .systemCyan)
        let buttonEqual = createButton(title: "=", tag: 11, color: .lightText)
        let firstStackView = UIStackView(subviews: [button0, buttonPoint, buttonEqual])
        button0.widthAnchor.constraint(equalTo: firstStackView.widthAnchor, multiplier: 0.5).isActive = true
        buttonPoint.widthAnchor.constraint(equalTo: buttonEqual.widthAnchor, multiplier: 1).isActive = true
        firstStackView.distribution = .fill
        
        let button1 = createButton(title: "1", tag: 1, color: .systemCyan)
        let button2 = createButton(title: "2", tag: 2, color: .systemCyan)
        let button3 = createButton(title: "3", tag: 3, color: .systemCyan)
        let buttonPlus = createButton(title: "+", tag: 12, color: .lightText)
        let secondStackView = UIStackView(subviews: [button1, button2, button3, buttonPlus])
        
        let button4 = createButton(title: "4", tag: 4, color: .systemCyan)
        let button5 = createButton(title: "5", tag: 5, color: .systemCyan)
        let button6 = createButton(title: "6", tag: 6, color: .systemCyan)
        let buttonMinus = createButton(title: "-", tag: 13, color: .lightText)
        let thirdStackView = UIStackView(subviews: [button4, button5, button6, buttonMinus])
        
        let button7 = createButton(title: "7", tag: 7, color: .systemCyan)
        let button8 = createButton(title: "8", tag: 8, color: .systemCyan)
        let button9 = createButton(title: "9", tag: 9, color: .systemCyan)
        let buttonMulti = createButton(title: "x", tag: 14, color: .lightText)
        let fourthStackView = UIStackView(subviews: [button7, button8, button9, buttonMulti])
        
        let buttonAC = createButton(title: "AC", tag: 18, color: .systemBlue)
        let buttonPlusMinus = createButton(title: "+/-", tag: 17, color: .systemBlue)
        let buttonPercent = createButton(title: "%", tag: 16, color: .systemBlue)
        let buttonDivide = createButton(title: "/", tag: 15, color: .lightText)
        let fifthStackView = UIStackView(subviews: [buttonAC, buttonPlusMinus, buttonPercent, buttonDivide])
        
        stackViewsArray = [fifthStackView, fourthStackView, thirdStackView, secondStackView, firstStackView]
    }
}
