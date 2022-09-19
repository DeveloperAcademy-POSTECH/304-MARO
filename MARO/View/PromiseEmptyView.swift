//
//  PromiseEmptyView.swift
//  MARO
//
//  Created by Noah's Ark on 2022/09/19.
//

import SwiftUI

struct PromiseEmptyView: View {
    var body: some View {
        VStack {
            Circle()
                .frame(maxWidth: 150, maxHeight: 150)
                .padding(.bottom, 30)
            
            Text("처음이신가요?")
            
            Button {
                print("Button Pressed")
            } label: {
                Text("약속하기")
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                    .background(.gray)
            }
            
        }// VStack
    }// body
}// PromiseEmptyView

struct PromiseEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        PromiseEmptyView()
    }
}
