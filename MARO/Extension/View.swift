//
//  View.swift
//  MARO
//
//  Created by Noah's Ark on 2022/09/19.
//

import SwiftUI

// https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
// 아래와 같이 사용하세요
// .cornerRadius(20, corners: [.topLeft, .bottomRight])
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        return Path(path.cgPath)
    }
}
