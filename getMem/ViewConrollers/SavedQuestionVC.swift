//
//  SavedQuestionVC.swift
//  getMem
//
//  Created by Евгений on 20.02.2025.
//


import UIKit
import CoreData

class SavedQuestionVC: UIViewController {
    let mainView: SavedQuestionView = .init()
    var historyMemas: [Memas] = []
    
    override func loadView() {
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeHistory()
        mainView.historyTableView.delegate = self
        mainView.historyTableView.dataSource = self
        mainView.historyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    func makeHistory() {
        historyMemas = CoreDataManager.shared.fetchMemes()
        print("Загружено \(historyMemas.count) записей")
        DispatchQueue.main.async {
                self.mainView.historyTableView.reloadData()
            }
    }
    
    
    
}
extension SavedQuestionVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, completionHandler in
            self.deleteItem(at: indexPath)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
extension SavedQuestionVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return historyMemas.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainView.historyTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = historyMemas[indexPath.row].question
        return cell
    }
    
    
}
extension SavedQuestionVC {
    func deleteItem(at indexPath: IndexPath) {
        historyMemas.remove(at: indexPath.row)
        
        let itemToDelete = historyMemas[indexPath.row]
        CoreDataManager.shared.context.delete(itemToDelete)
        
        CoreDataManager.shared.saveContext()
        
        mainView.historyTableView.deleteRows(at: [indexPath], with: .fade)
    }
}
