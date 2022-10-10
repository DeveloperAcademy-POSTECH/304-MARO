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
    @State private var isActive: Bool = false
    
    init(_ sampleArray: [PromiseModel]) {
        self.sampleArray = sampleArray
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack { bodyView }
        } else {
            NavigationView { bodyView }
        }
        
    }// body
    
    private var bodyView: some View {
        VStack {
            Rectangle()
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                .ignoresSafeArea()
                .frame(height: Constant.screenHeight * 0.35)
                .foregroundColor(.mainPurple)
                .padding(.bottom)
                .overlay { overlayView }
            
            if sampleArray.count == 0 {
                emptyPromiseView
            } else {
                promiseListView
            }
            
        }// VStack
        .background(Color.backgroundWhite)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    private var overlayView: some View {
        ZStack {
            VStack {
                HStack {
                    Image("cloudTwo")
                        .padding(.trailing, 400)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Image("cloudOne")
                }
                .padding(.bottom, 40)
                
            }
            
            VStack (alignment: .center) {
                Spacer()
                
                if sampleArray.count == 0 {
                    Text("새로운 약속을 만들어볼까요?")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                } else {
                    Text("오늘은 1번 약속을 지켜볼까요?")
                        .font(.subheadline)
                        .padding(.bottom)
                    Text("동해물과 백두산이 마르고 닳도록 하느님이 보우하사")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                }
                
                PromiseCreationButton { isActive.toggle() }
                
                NavigationLink(destination: PromiseCreation(promise: "", memoDescription: ""), isActive: $isActive) { }
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.horizontal, 150)
        }
    }
    private var promiseListView: some View {
        ScrollView (showsIndicators: false) {
            VStack {
                ForEach(sampleArray, id: \.self) { data in
                    ListComponent(
                        number: data.number,
                        promise: data.promise,
                        category: data.category
                    )
                    .frame(minHeight: bottomPartHeight * 0.15)
                    .padding(.bottom, bottomPartHeight * 0.1 * 0.25)
                }
            }
            .padding(.horizontal)
        }
    }
    private var emptyPromiseView: some View {
        VStack {
            Spacer()
            Text("아직 약속이 없어요.")
                .font(.title2)
                .foregroundColor(.subGray)
                .padding(.bottom, 80)
            Spacer()
            
        }
    }
    
}// PromiseListView

struct PromiseListView_Previews: PreviewProvider {
    static let sampleArray: [PromiseModel] = [
        PromiseModel(number: 1, promise: "긍정적인 생각하기", category: .study)
    ]
    
    static var previews: some View {
        PromiseListView(sampleArray)
    }
}

// MARK: PromiseCreationButton
struct PromiseCreationButton: View {
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("+ 새 약속 만들기")
                .fontWeight(.semibold)
                .padding(.vertical, 10)
                .padding(.horizontal, 28)
                .overlay {
                    Capsule().stroke(.white, lineWidth: 1)
                }
        }// Button
        
    }// body
}// PromiseCreationButton



