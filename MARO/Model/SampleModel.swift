//
//  SampleModel.swift
//  MARO
//
//  Created by Hyeon-sang Lee on 2022/09/18.
//

import Foundation
import CoreData

enum category: String,CaseIterable {
    case study
    case job
    case life
    case selfImprovement
    case relationship

    var categoryName: String {
        switch self {
        case .study:
            return "학업"
        case .job:
            return "취업"
        case .life:
            return "인생"
        case .selfImprovement:
            return "자기계발"
        case .relationship:
            return "인간관계"
        }
    }
}
