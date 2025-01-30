//
//  LogInScreen.swift
//  BoardRooms
//
//  Created by Raghad on 20/07/1446 AH.
//

import SwiftUI

struct LogInScreen: View {
    @State private var jobNumber: String = ""
    @State private var password: String = ""
    @State private var loginError: String? = nil
    @State private var loggedInEmployee: Employee? = nil

    var body: some View {
        NavigationView {
            VStack {
                // الخلفية وغطاء كامل الشاشة
                
                
                ZStack {
                    // الصورة في الخلفية
                    Image("Background2") // قم بتغيير "Background2" باسم الصورة التي تريد استخدامها
//                        .resizable()
                        .scaledToFill()
                        .clipped()
                    
                    
                    
                    // النصوص والأزرار فوق الصورة
                    VStack {
                        
                        Text("Welcome back! Glad \n to see you, Again!")
                        .font(.system(size: 32, weight: .bold, design: .default))
                                    .foregroundColor(.myOrange)
                                    .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding()
                      
                        VStack (spacing: 10){
                            
                            
                            TextField("Enter your job number", text: $jobNumber)
                                .padding()
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.textField, lineWidth: 1)
                                )
                            
                            
                            SecureField("Enter your password", text: $password)
                                .padding()
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .background(Color.white)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.textField, lineWidth: 1)
                                )
                        }
                        .padding()
                        
                        if let error = loginError {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.caption)
                                .padding()
                        }
                        
                        Button(action: {
                            handleLogin()
                        }) {
                            Text("Log In")
                                .font(.system(size: 16, weight: .semibold, design: .default))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.darkBlue)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
//                    
//                        Spacer()
                            
                        
                    }
//
                    
                    
                }
                
                // رابط التنقل إذا تم تسجيل الدخول بنجاح
                if let employee = loggedInEmployee {
                    NavigationLink(
                        destination: RoomListView() /*BoardroomListScreen(employee: employee)*/,
                        isActive: .constant(true),
                        label: { EmptyView() }
                    )
                }
                    
                Spacer()
                
            }.background(Color("AccentColor").ignoresSafeArea())
            
        }
       
    }

    private func handleLogin() {
        // تحقق من البيانات
        guard let jobNumberInt = Int(jobNumber) else {
            loginError = "Invalid job number format"
            return
        }

        fetchEmployees { employees in
            if let employee = employees.first(where: { $0.fields.id == jobNumberInt && $0.fields.password == password }) {
                DispatchQueue.main.async {
                    self.loggedInEmployee = employee
                    self.loginError = nil
                }
            } else {
                DispatchQueue.main.async {
                    self.loginError = "Invalid job number or password"
                }
            }
        }
    }

    private func fetchEmployees(completion: @escaping ([Employee]) -> Void) {
        guard let url = URL(string: "https://api.airtable.com/v0/appElKqRPusTLsnNe/employees") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching employees: \(error)")
                completion([])
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let response = try JSONDecoder().decode([String: [Employee]].self, from: data)
                completion(response["records"] ?? [])
            } catch {
                print("Error decoding employees: \(error)")
                completion([])
            }
        }.resume()
    }
}


#Preview {
    LogInScreen()
}
