//
//  ContentView.swift
//  MARO
//
//  Created by Hyeon-sang Lee on 2022/09/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                NavigationLink(destination: PromiseCreation(promise: "", memoDescription: "")) {
                    Text("Go1")
                }
            }
        } else {
            NavigationView {
                NavigationLink(destination: PromiseCreation(promise: "", memoDescription: "")) {
                    Text("Go2")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
