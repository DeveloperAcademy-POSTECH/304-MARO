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
}

struct MainView: View {
    // CoreData Sample
    let sampleArray: [PromiseModel] = [
        PromiseModel(number: 1, promise: "긍정적인 생각하기"),
        PromiseModel(number: 2, promise: "긍정적인 생각하기"),
        PromiseModel(number: 3, promise: "긍정적인 생각하기"),
        PromiseModel(number: 4, promise: "긍정적인 생각하기"),
        PromiseModel(number: 5, promise: "긍정적인 생각하기"),
        PromiseModel(number: 6, promise: "긍정적인 생각하기"),
        PromiseModel(number: 7, promise: "긍정적인 생각하기"),
        PromiseModel(number: 8, promise: "긍정적인 생각하기"),
    ]
    
    var body: some View {
        if sampleArray.count == 0 {
            PromiseEmptyView()
        } else {
            PromiseListView(sampleArray)
        }
        
    }// body
}// MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


