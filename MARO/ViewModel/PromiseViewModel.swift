//
//  PromiseViewModel.swift
//  MARO
//
//  Created by 김연호 on 2022/09/24.
//

import Foundation
import CoreData

class PromiseViewModel: ObservableObject {
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
        } catch let error {
            print("Error fetching. \(error)")
        }
    }

    func addPromise(text: String) {
        let newPromise = PromiseEntity(context: container.viewContext)
        savePromise()
    }

    func deletePromise(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = saveEntities[index]
        container.viewContext.delete(entity)
        savePromise()
    }
    func savePromise() {
        do {
            try container.viewContext.save()
            fetchPromise()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}
