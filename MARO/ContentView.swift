//
//  ContentView.swift
//  MARO
//
//  Created by Hyeon-sang Lee on 2022/09/18.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some View {
        MainView()
            .fullScreenCover(isPresented: $isFirstLaunching) {
                OnboardingView(isFirstLaunching: $isFirstLaunching)
            }
    }// body
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
