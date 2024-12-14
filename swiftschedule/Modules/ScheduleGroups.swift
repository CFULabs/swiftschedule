//
//  ScheduleGroups.swift
//  swiftschedule
//
//  Created by artem alanov on 16.11.2024.
//

import Foundation

struct ScheduleWeek : Identifiable {
    let id = UUID()
    let groupId: String
    let weekType: String
    var daySlots: [ScheduleGroup]
    
    init(groupId: String, weekType: String, daySlots: [ScheduleGroup] = []) {
        self.groupId = groupId
        self.weekType = weekType
        self.daySlots = daySlots
    }
    
    static func example() -> ScheduleWeek {
        var week = ScheduleWeek(groupId: "ПИ-231(2)", weekType: "odd")
        week.daySlots = ScheduleGroup.examples()
        return week
    }
}

struct ScheduleGroup: Identifiable {
    let id = UUID()
    var dayName : String
    var lessonsTable : [ScheduleItem]
    
    init(dayName: String, lessonsTable: [ScheduleItem] = []) {
        self.dayName = dayName
        self.lessonsTable = lessonsTable
    }
    
    static func example() -> ScheduleGroup {
        let lessons = ScheduleItem.example()
        var day = ScheduleGroup(dayName: "Понедельник")
        day.lessonsTable = [lessons]
        return day
    }
    
    static func examples() -> [ScheduleGroup] {
        let lessons1 = ScheduleItem.example()
        let lessons2 = ScheduleItem.examples()
        
        var day1 = ScheduleGroup(dayName: "Вторник")
        var day2 = ScheduleGroup(dayName: "Среда")
        
        day1.lessonsTable = [lessons1]
        day2.lessonsTable = lessons2
        
        return [day1, day2]
    }
}
