//
//  MainView.swift
//  MARO
//
//  Created by Noah's Ark on 2022/09/18.
//

import SwiftUI

// Model Sample
struct PromiseModel: Hashable {
    let number: Int
    let promise: String
    let category: PromiseCategory
}

enum PromiseCategory: String {
    case occupation = "취업"
    case study = "학업"
    case life = "인생"
    case selfImprovement = "자기계발"
    case relationship = "인간관계"
}

struct MainView: View {
    // CoreData Sample
    let sampleArray: [PromiseModel] = [
        PromiseModel(number: 1, promise: "긍정적인 생각하기", category: .occupation),
        PromiseModel(number: 2, promise: "긍정적인 생각하기", category: .life),
        PromiseModel(number: 3, promise: "긍정적인 생각하기", category: .relationship),
        PromiseModel(number: 4, promise: "긍정적인 생각하기", category: .study),
        PromiseModel(number: 5, promise: "긍정적인 생각하기", category: .selfImprovement),
        PromiseModel(number: 6, promise: "긍정적인 생각하기", category: .occupation),
        PromiseModel(number: 7, promise: "긍정적인 생각하기", category: .relationship),
        PromiseModel(number: 8, promise: "긍정적인 생각하기", category: .study),
    ]
    
    var body: some View {
        PromiseListView(sampleArray)
        
    }// body
}// MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


