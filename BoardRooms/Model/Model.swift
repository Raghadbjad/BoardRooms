//
//  Model.swift
//  BoardRooms
//
//  Created by Raghad on 22/07/1446 AH.
//

import Foundation

// MARK: - Employee
struct Employee: Codable {
    let id, createdTime: String
    let fields: EmployeeFields
}

// MARK: - Fields
struct EmployeeFields: Codable {
    let id: Int
    let jobTitle, name, email, password: String

    enum CodingKeys: String, CodingKey {
        case id
        case jobTitle = "job_title"
        case name, email, password
    }
}


// MARK: - Bookings
struct Bookings: Codable {
    let id, createdTime: String
    let fields: BookingsFields
}

// MARK: - Fields
struct BookingsFields: Codable {
    let boardroomID: String
    let date: Int
    let employeeID: String

    enum CodingKeys: String, CodingKey {
        case boardroomID = "boardroom_id"
        case date
        case employeeID = "employee_id"
    }
}

// MARK: - Boardrooms
//struct Boardrooms: Codable {
//    var id, createdTime: String
//    var fields: BoardroomsFields
//}
//
//// MARK: - Fields
//struct BoardroomsFields: Codable {
//    var description: String
//    var floorNo: Int
//    var imageURL: String
//    var name: String
//    var seatNo: Int
//    var facilities: [String]
//    var id: String
//
//    enum CodingKeys: String, CodingKey {
//        case description
//        case floorNo = "floor_no"
//        case imageURL = "image_url"
//        case name
//        case seatNo = "seat_no"
//        case facilities, id
//    }
//}

import SwiftUI

// موديل الغرفة
//struct Boardrooms: Identifiable, Codable {
//    var id, createdTime: String
//    var fields: BoardroomsFields
//}

// تفاصيل الغرفة
//struct BoardroomsFields: Codable {
//    var description: String
//    var floorNo: Int
//    var imageURL: String  // رابط الصورة
//    var name: String      // اسم الغرفة
//    var seatNo: Int       // عدد المقاعد
//    var facilities: [String] // التسهيلات المتاحة في الغرفة
//    var id: String
//    
//    // تعيين أسماء المفاتيح في JSON لتتناسب مع الأسماء في Swift
//    enum CodingKeys: String, CodingKey {
//        case description
//        case floorNo = "floor_no"
//        case imageURL = "image_url"
//        case name
//        case seatNo = "seat_no"
//        case facilities, id
//    }
//}

import Foundation

// نموذج الاستجابة الكاملة من Airtable
struct AirtableResponse: Decodable {
    let records: [Room]
}


import SwiftUI

// نموذج البيانات للغرف
struct Room: Identifiable, Decodable {
    var id: String
    var fields: RoomFields
}

// حقول بيانات الغرفة
struct RoomFields: Decodable {
    var name: String
    var description: String
    var image_url: String
    var floor_no: Int
    var seat_no: Int
    var facilities: [String]
}


struct Reservation: Identifiable, Codable {
    let id: String
    let fields: ReservationFields
}

struct ReservationFields: Codable {
    let boardroom_id: String
    let date:  Int
    let employee_id: String
}
