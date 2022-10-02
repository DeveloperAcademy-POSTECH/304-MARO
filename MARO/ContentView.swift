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
                NavigationLink(destination: PromiseCreation(promiseMemo: "", memo: "",  dropDownList: [""])) {
                    Text("Go1")
                }
            }
        } else {
            NavigationView {
                NavigationLink(destination: PromiseCreation(promiseMemo: "", memo: "")) {
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
