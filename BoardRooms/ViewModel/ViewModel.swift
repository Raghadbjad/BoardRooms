//
//  ViewModel.swift
//  BoardRooms
//
//  Created by Raghad on 30/07/1446 AH.
//

import SwiftUI
import Foundation

import SwiftUI

// تأكد من أن ViewModel يتوافق مع البروتوكول ObservableObject
import SwiftUI

class ViewModel: ObservableObject {
    @Published var boardrooms: [Room] = []
    @Published var error: String?

    // استدعاء البيانات من API
    func fetchRooms() {
        guard let url = URL(string: "https://api.airtable.com/v0/appElKqRPusTLsnNe/boardrooms") else {
            self.error = "Invalid URL"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.error = "Error fetching rooms: \(error.localizedDescription)"
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    self.error = "No data received"
                }
                return
            }

            // طباعة JSON الخام للتأكد من التنسيق الصحيح
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON Response: \(jsonString)")
            }

            do {
                // فك تشفير البيانات
                let response = try JSONDecoder().decode(AirtableResponse.self, from: data)
                DispatchQueue.main.async {
                    self.boardrooms = response.records
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = "Error decoding data: \(error.localizedDescription)"
                    print("Decoding Error: \(error)")
                }
            }
        }.resume()
    }
}


class ReservationViewModel: ObservableObject {
    @Published var reservations: [Reservation] = []
    
    func fetchReservations(for employeeID: String) {
        guard let url = URL(string: "https://api.airtable.com/v0/appElKqRPusTLsnNe/reservations") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching reservations: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let response = try JSONDecoder().decode([String: [Reservation]].self, from: data)
                DispatchQueue.main.async {
                    // Filter reservations for the specific employee
                    self.reservations = response["records"]?.filter { $0.fields.employee_id == employeeID } ?? []
                }
            } catch {
                print("Error decoding reservations: \(error)")
            }
        }.resume()
    }
}

