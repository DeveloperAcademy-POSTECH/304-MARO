//
//  PromiseListView.swift
//  MARO
//
//  Created by Noah's Ark on 2022/09/19.
//

import SwiftUI

struct PromiseListView: View {
    let sampleArray: [PromiseModel]
    
    init(_ sampleArray: [PromiseModel]) {
        self.sampleArray = sampleArray
    }
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 30)
                .ignoresSafeArea()
                .frame(maxHeight: 300)
                .foregroundColor(.gray)
                .overlay {
                    VStack {
                        Text("오늘은 1번 약속을 지켜볼까요?")
                        Text("오늘의 약속")
                        Button { } label: { Text("약속 추가하기") }
                    }
                }
                .padding(.bottom, 30)
            
            ScrollView (showsIndicators: false) {
                ZStack {
                    VStack {
                        ForEach(sampleArray, id: \.self) { data in
                            GeometryReader { geometry in
                                ListComponent(
                                    number: data.number,
                                    promise: data.promise,
                                    position: geometry.frame(in: .global).midY
                                )
                            }
                            .frame(height: UIScreen.main.bounds.height / 11)
                        }
                        
                        Spacer()
                            .frame(height: UIScreen.main.bounds.height / 2 - 80)
                    }
                }
            }

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
