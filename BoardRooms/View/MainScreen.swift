//
//  MainScreen.swift
//  BoardRooms
//
//  Created by Raghad on 20/07/1446 AH.
//

//import SwiftUI
//
//
//struct MainScreen : View {
//    @State private var jobNumber: String = ""
//    @State var error: String? = nil
//    @State var boardrooms: [Boardrooms] = []
//    
//    var body: some View {
//        
//        VStack{
//            
//            
//            
//        }.background(Color("AccentColor")).ignoresSafeArea()
//    }
//   
//    
//   
//
//    
//}
//
//
//#Preview {
//    MainScreen()
//}

import SwiftUI

import SwiftUI

struct RoomListView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // عرض الخطأ إذا حدث
                if let error = viewModel.error {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
                
                // عرض قائمة الغرف
                List(viewModel.boardrooms) { room in
                    VStack(alignment: .leading) {
                        // عرض الصورة باستخدام AsyncImage
                        AsyncImage(url: URL(string: room.fields.image_url)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView() // تحميل الصورة
                            case .success(let image):
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(8)
                            case .failure:
                                Image(systemName: "photo") // صورة بديلة عند فشل التحميل
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(8)
                                    .foregroundColor(.gray)
                            @unknown default:
                                EmptyView()
                            }
                        }

                        // عرض الاسم
                        Text(room.fields.name)
                            .font(.headline)
                            .padding(.top, 5)

                        // عرض الشرح
                        Text(room.fields.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 3)

                        // عرض رقم الطابق
                        Text("Floor: \(room.fields.floor_no)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 3)

                        // عرض عدد المقاعد
                        Text("Seats: \(room.fields.seat_no)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 3)

                        // عرض المرافق
                        Text("Facilities: \(room.fields.facilities.joined(separator: ", "))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 3)
                    }
                    .padding()
                }
                .onAppear {
                    // استدعاء دالة fetchRooms عند تحميل الشاشة
                    viewModel.fetchRooms()
                }
            }
            .navigationTitle("Rooms")
        }
    }
}

#Preview {
    RoomListView()
}
