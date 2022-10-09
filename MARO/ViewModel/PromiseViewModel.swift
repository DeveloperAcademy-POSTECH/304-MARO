//
//  PromiseViewModel.swift
//  MARO
//
//  Created by 김연호 on 2022/09/24.
//

import Foundation
import CoreData

class PromiseViewModel: ObservableObject {
    static var shared = PromiseViewModel()

    let container: NSPersistentContainer
    @Published var saveEntities: [PromiseEntity] = []

    init() {
        container = NSPersistentContainer(name: "PromiseContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("Success loaded coreData")
            }
        }

        fetchPromise()
    }

    func fetchPromise() {
        let request = NSFetchRequest<PromiseEntity>(entityName: "PromiseEntity")
        do {
           saveEntities =  try container.viewContext.fetch(request)
            print("fetch!")
        } catch let error {
            print("Error fetching. \(error)")
        }
    }

    func addPromise(promise: String, category: String, description: String) {
        let newPromise = PromiseEntity(context: container.viewContext)
        newPromise.promise = promise
        newPromise.category = category
        newPromise.memoDescription = description
        newPromise.dateCreated = Date()

        savePromise()
        print("add!")
    }

    func deletePromise(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = saveEntities[index]
        container.viewContext.delete(entity)
        savePromise()
        print("delete!")
    }
    
    func savePromise() {
        do {
            try container.viewContext.save()
            fetchPromise()
            print("save!")
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}
