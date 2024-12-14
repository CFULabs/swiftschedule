//
//  ScheduleItems.swift
//  swiftschedule
//
//  Created by artem alanov on 06.11.2024.
//

import Foundation

enum ScheduleType: String {
    case lecture = "ЛК"
    case practice = "ПЗ"
    case digitalClass = "ЦК"
    case elective = "ФК"
}

struct TimeSlot {
    var startTime: Date
    var endTime: Date
}

struct ScheduleItem: Identifiable {
    let id = UUID()
    var itemid : Int
    var subjectName : String
    var classRoom : String
    var timeSlot: TimeSlot? { getTimeSlot(for: itemid) }
    var lessonType : ScheduleType
    var teacherName : String
    
    init(itemid: Int, subjectName: String, classRoom: String, lessonType: ScheduleType, teacherName: String) {
        self.itemid = itemid
        self.subjectName = subjectName
        self.classRoom = classRoom
        self.lessonType = lessonType
        self.teacherName = teacherName
    }
    
    static func example() -> ScheduleItem {
        ScheduleItem(itemid: 1, subjectName: "JENKINS", classRoom: "8A", lessonType: .lecture, teacherName: "CHABANOV")
    }
    
    static func examples() -> [ScheduleItem] {
        [
            ScheduleItem(itemid: 1, subjectName: "Gambling", classRoom: "9A", lessonType: .practice, teacherName: "KORNIENKO"),
            ScheduleItem(itemid: 2, subjectName: "ENVELOPE", classRoom: "8A", lessonType: .lecture, teacherName: "CHABANOV"),
            ScheduleItem(itemid: 4, subjectName: "Perdoling", classRoom: "302A", lessonType: .lecture, teacherName: "Аланов А."),
            ScheduleItem(itemid: 4, subjectName: "Архитектура", classRoom: "1488A", lessonType: .practice, teacherName: "Шикльгрубер А."),
            ScheduleItem(itemid: 5, subjectName: "G-Code", classRoom: "github.com/remr2005", lessonType: .lecture, teacherName: "Obedov K. L.")
        ]
    }
}
// TODO: get this array from sanyapilot
func getTimeSlot(for itemid: Int) -> TimeSlot? {
    let calendar = Calendar.current
    let timeSlots: [TimeSlot] = [
        TimeSlot(startTime: calendar.date(from: DateComponents(hour: 8, minute: 0))!, endTime: calendar.date(from: DateComponents(hour: 9, minute: 30))!),
        TimeSlot(startTime: calendar.date(from: DateComponents(hour: 9, minute: 50))!, endTime: calendar.date(from: DateComponents(hour: 11, minute: 20))!),
        TimeSlot(startTime: calendar.date(from: DateComponents(hour: 11, minute: 30))!, endTime: calendar.date(from: DateComponents(hour: 13, minute: 0))!),
        TimeSlot(startTime: calendar.date(from: DateComponents(hour: 13, minute: 20))!, endTime: calendar.date(from: DateComponents(hour: 14, minute: 50))!),
        TimeSlot(startTime: calendar.date(from: DateComponents(hour: 15, minute: 0))!, endTime: calendar.date(from: DateComponents(hour: 16, minute: 30))!),
        TimeSlot(startTime: calendar.date(from: DateComponents(hour: 16, minute: 40))!, endTime: calendar.date(from: DateComponents(hour: 18, minute: 10))!),
        TimeSlot(startTime: calendar.date(from: DateComponents(hour: 18, minute: 20))!, endTime: calendar.date(from: DateComponents(hour: 19, minute: 50))!),
        TimeSlot(startTime: calendar.date(from: DateComponents(hour: 20, minute: 0))!, endTime: calendar.date(from: DateComponents(hour: 21, minute: 30))!),
    ]
    return timeSlots[safe: itemid-1]
}

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0, index < count else { return nil }
        return self[index]
    }
}
