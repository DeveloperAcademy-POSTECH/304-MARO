//
//  SampleExtension.swift
//  MARO
//
//  Created by Hyeon-sang Lee on 2022/09/18.
//

import Foundation

extension Date {
    static var currentLocalizedDateTime: String {
        let now = Date()
        let dateText = now.formatted(.dateTime.year().month(.abbreviated).day())
        let timeText = now.formatted(date: .omitted, time: .shortened)
        let dateAndTimeFormat = NSLocalizedString("%@, %@", comment: "Date and time format string") // 2022년 7월. 29일, 오전 12:47
        return String(format: dateAndTimeFormat, dateText, timeText)
    }

    func toString() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yy년MM월dd일HH:mm" // 2022-07-03 23:14
            return dateFormatter.string(from: self)
        }
}
