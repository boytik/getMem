//
//  SavedQuestion.swift
//  getMem
//
//  Created by Евгений on 20.02.2025.
//

import UIKit

class SavedQuestionView: UIView {
    lazy var historyTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray
        return tableView
    }()
    init() {
        super.init(frame: .zero)
        setView()
        setConstraint()
    }
    
    func setView(){
        addSubview(historyTableView)
        historyTableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    func setConstraint(){
        NSLayoutConstraint.activate([
        historyTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
        historyTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        historyTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        historyTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
#Preview {
    SavedQuestionVC()
}
