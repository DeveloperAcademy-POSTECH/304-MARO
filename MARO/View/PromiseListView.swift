//
//  PromiseListView.swift
//  MARO
//
//  Created by Noah's Ark on 2022/09/19.
//

import SwiftUI

struct PromiseListView: View {
    let sampleArray: [PromiseModel]
    let bottomPartHeight: CGFloat = Constant.screenHeight * 0.7
    
    init(_ sampleArray: [PromiseModel]) {
        self.sampleArray = sampleArray
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                .ignoresSafeArea()
                .frame(height: Constant.screenHeight * 0.3)
                .foregroundColor(.gray)
                .overlay {
                    VStack {
                        Text("오늘은 1번 약속을 지켜볼까요?")
                        Text("오늘의 약속")
                        Button { } label: { Text("약속 추가하기") }
                    }
                }
            
            ScrollView (showsIndicators: false) {
                VStack {
                    ForEach(sampleArray, id: \.self) { data in
                        GeometryReader { geometry in
                            ListComponent(
                                number: data.number,
                                promise: data.promise,
                                position: geometry.frame(in: .global).midY
                            )
                        }
                        .frame(minHeight: bottomPartHeight * 0.1)
                        .padding(.bottom, bottomPartHeight * 0.1 * 0.5)
                    }
                    
                    Spacer()
                        .frame(height: bottomPartHeight * 0.85)
                }
            }
            .frame(height: bottomPartHeight)
            
            Spacer()
            
        }// VStack
    }// body
}// PromiseListView

struct PromiseListView_Previews: PreviewProvider {
    static let sampleArray: [PromiseModel] = [
        PromiseModel(number: 1, promise: "긍정적인 생각하기")
    ]
    
    static var previews: some View {
        PromiseListView(sampleArray)
    }
}
