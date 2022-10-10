//
//  OnboardingView.swift
//  MARO
//
//  Created by Noah's Ark on 2022/10/02.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var isFirstLaunching: Bool
    @State private var selection: Int = 1
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button { print("Hello I'm pressed!") }
                label: { Text("건너뛰기") }
                    .foregroundColor(.mainPurple)
                    .opacity(selection == 3 ? 0 : 1)
                
            }
            .padding(.bottom, 65)
            
            TabView(selection: $selection) {
                OnboardingFirstPage().tag(1)
                OnboardingSecondPage().tag(2)
                OnboardingThirdPage(isFirstLaunching: $isFirstLaunching).tag(3)
            }
            .tabViewStyle(PageTabViewStyle())
            
        }// VStack
        .padding(.horizontal, 20)
        .onAppear { setPageIndicatorColor() }
    }// body
    
    // https://stackoverflow.com/questions/62864221/change-tabview-indicator-swiftui
    func setPageIndicatorColor() {
      UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.mainPurple)
      UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
}// OnboardingView

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(isFirstLaunching: .constant(true))
    }
}

// MARK: Onboarding Page 1
struct OnboardingFirstPage: View {
    var body: some View {
        VStack {
            Text("나의 하루를 위한 하나의 약속을 확인해요")
            
            Spacer()
            
            Image("onboardingImage1")
            
        }// VStack
    }// body
}// OnboardingFirstPage

// MARK: Onboarding Page 2
struct OnboardingSecondPage: View {
    var body: some View {
        VStack {
            Text("꼭 지켜야할 나만의 약속들을\n간편하게 관리해요")
                .multilineTextAlignment(.center)
                .padding(.bottom, 62)
            
            Image("onboardingImage2")
                .padding(.horizontal, 15)
            
            Spacer()
            
        }// VStack
    }// body
}// OnboardingSecondPage

// MARK: Onboarding Page 3
struct OnboardingThirdPage: View {
    @Binding var isFirstLaunching: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("onboardingImage3")
            Text("나의 하루를 위한 하나의 약속\n마로와 함께해요")
                .multilineTextAlignment(.center)
                .padding(.top, 41)
            
            Spacer()
            
            CustomButton(text: "시작하기") { isFirstLaunching.toggle() }
                .padding(.bottom, 55)
            
        }// VStack
    }// body
}// OnboardingThirdPage

// MARK: Reusable CustomButton Sample
struct CustomButton: View {
    var text: String
    var action: () -> Void
    
    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(maxHeight: 56)
                .foregroundColor(.mainPurple)
                .overlay {
                    Text(text)
                        .font(.headline)
                        .foregroundColor(.white)
                }
        }
    }// body
}//CustomButton
