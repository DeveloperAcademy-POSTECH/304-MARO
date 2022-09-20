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
    let category: PromiseCategory
    @State private var opacity: CGFloat = 0.3
    @State private var scale: CGFloat = 0.95
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(maxWidth: .infinity)
                .foregroundColor(.backgroundGray)
            
            HStack {
                VStack (alignment: .leading) {
                    HStack {
                        Text("\(number)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.mainPurple)
                        CategoryComponent(category: category.rawValue)
                    }
                    .padding(.bottom, 1)
                    
                    Text("\(promise)")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.mainText)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: Category Component
struct CategoryComponent: View {
    let category: String
    
    var body: some View {
        Text(category)
            .font(.footnote)
            .foregroundColor(.white)
            .padding(.vertical, 3)
            .padding(.horizontal, 8)
            .background(setCategoryBackgroundColor())
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }// body
    
    func setCategoryBackgroundColor() -> Color {
        switch category {
        case "학업":
            return .studyBlue
        case "취업":
            return .occupationBlue
        case "인생":
            return .lifeBlue
        case "자기계발":
            return .selfImprovementBlue
        case "인간관계":
            return .relationshipBlue
        default:
            return .studyBlue
        }
    }
    
}// CategoryComponent

/*
struct ListComponent_Previews: PreviewProvider {
    static var previews: some View {
        ListComponent(
            number: 1,
            promise: "긍정적인 생각하기",
            category: .study
        )
    }
}
*/
