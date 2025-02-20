//
//  CoreDataManager.swift
//  getMem
//
//  Created by Евгений on 20.02.2025.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Memas")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Не удалось загрузить Core Data: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func fetchMemes() -> [Memas] {
        let fetchRequest: NSFetchRequest<Memas> = Memas.fetchRequest()
        
        do {
            let memes = try context.fetch(fetchRequest)
            return memes
        } catch {
            print("Ошибка при загрузке данных: \(error.localizedDescription)")
            return []
        }
    }
    func saveContext() {
            do {
                try context.save()
            } catch {
                print("Ошибка сохранения контекста: \(error.localizedDescription)")
            }
        }
}
