//
//  ListComponent.swift
//  MARO
//
//  Created by Noah's Ark on 2022/09/19.
//

import SwiftUI

struct ListComponent: View {
    let number: Int
    let promise: String
    let position: CGFloat
    @State private var opacity: CGFloat = 0.3
    @State private var scale: CGFloat = 0.95
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text("\(number)")
                Text("\(promise) \(position)")
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.2))
        .padding(.horizontal)
        .opacity(number == 1 ? 1 : opacity)
        .scaleEffect(number == 1 ? 1 : scale)
        .onChange(of: position) { newValue in
            if newValue <= (Constant.screenHeight * 0.4)  {
                withAnimation {
                    opacity = 1.0
                    scale = 1.0
                }
            } else {
                withAnimation {
                    opacity = 0.3
                    scale = 0.95
                }
            }
        }
    }
}

struct ListComponent_Previews: PreviewProvider {
    static var previews: some View {
        ListComponent(
            number: 1,
            promise: "긍정적인 생각하기",
            position: 0.0
        )
    }
}
