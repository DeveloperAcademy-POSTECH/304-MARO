//
//  MainView.swift
//  MARO
//
//  Created by Noah's Ark on 2022/09/18.
//

import SwiftUI

struct MainView: View {
    let sampleBool: Bool = false
    
    var body: some View {
        if sampleBool {
            Text("True")
        } else {
            Text("False")
        }
        
    }// body
}// MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
