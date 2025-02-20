//
//  FirstView.swift
//  getMem
//
//  Created by Евгений on 18.02.2025.
//


import UIKit

class FirstView: UIView {
    
    lazy var historyButton: UIButton = {
        let button = UIButton()
        button.setTitle("🥸", for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return button
    }()
    
    lazy var questionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите ваш запрос"
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 10
        
        return textField
    }()
    lazy var imageForTextField: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        return imageView
    }()
    lazy var takeMemeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Получить предсказание", for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        return button
    }()
    lazy var memeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white // Для отладки
        return imageView
    }()
    lazy var niceButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("👍", for: .normal)
        btn.setTitleColor(.lightGray, for: .highlighted)
        btn.backgroundColor = .systemGreen
        btn.layer.cornerRadius = 10
        return btn
    }()
    lazy var badButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("👎", for: .normal)
        btn.setTitleColor(.lightGray, for: .highlighted)
        btn.backgroundColor = .systemRed
        btn.layer.cornerRadius = 10
        return btn
    }()
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setView()
        setConstraint()
    }
    
    func setView(){
        addSubview(historyButton)
        addSubview(questionTextField)
        addSubview(takeMemeButton)
        addSubview(memeImageView)
        addSubview(buttonStackView)
        
        questionTextField.translatesAutoresizingMaskIntoConstraints = false
        takeMemeButton.translatesAutoresizingMaskIntoConstraints = false
        memeImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        historyButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.addArrangedSubview(niceButton)
        buttonStackView.addArrangedSubview(badButton)
        
        questionTextField.leftView = imageForTextField
        questionTextField.leftViewMode = .always
        
        
    }
    func setConstraint(){
        NSLayoutConstraint.activate([
            questionTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            questionTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            questionTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            questionTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            questionTextField.heightAnchor.constraint(equalToConstant: 50),
            
            takeMemeButton.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 20),
            takeMemeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            takeMemeButton.heightAnchor.constraint(equalToConstant: 50),
            takeMemeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            takeMemeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            
            memeImageView.topAnchor.constraint(equalTo: takeMemeButton.bottomAnchor, constant: 20),
            memeImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 50),
            memeImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -50),
            memeImageView.heightAnchor.constraint(equalToConstant: 200),
            
            buttonStackView.topAnchor.constraint(equalTo: memeImageView.bottomAnchor, constant: 20),
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            
            badButton.widthAnchor.constraint(equalToConstant: 50),
            niceButton.widthAnchor.constraint(equalToConstant: 50),
            
            historyButton.heightAnchor.constraint(equalToConstant: 100),
            historyButton.widthAnchor.constraint(equalToConstant: 100),
            historyButton.topAnchor.constraint(equalTo: topAnchor),
            historyButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
#Preview {
    FirstVC()
}
