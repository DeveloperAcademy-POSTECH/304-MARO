//
//  OnboardingView.swift
//  MARO
//
//  Created by Noah's Ark on 2022/10/02.
//

import SwiftUI

struct OnboardingView: View {
//    @Binding var isFirstLaunching: Bool
    @State private var selection: Int = 1
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button { print("Hello I'm pressed!") }
                label: { Text("건너뛰기") }
                .opacity(selection == 3 ? 0 : 1)

        }
        .padding(.bottom, 65)
        
        TabView(selection: $selection) {
            OnboardingFirstPage().tag(1)
            OnboardingSecondPage().tag(2)
            OnboardingThirdPage().tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
        
    }// VStack
        .padding(.horizontal, 20)
}// body
}// OnboardingView

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
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
    var body: some View {
        VStack {
            Spacer()
            
            Image("onboardingImage3")
            Text("나의 하루를 위한 하나의 약속\n마로와 함께해요")
                .multilineTextAlignment(.center)
                .padding(.top, 41)
                .padding(.bottom, 100)
            
            Spacer()
            
            Button { }
            label: { Text("시작하기") }
            
        }// VStack
    }// body
}// OnboardingThirdPage


