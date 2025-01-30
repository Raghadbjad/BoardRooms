//
//  SuccessScreen.swift
//  BoardRooms
//
//  Created by Raghad on 20/07/1446 AH.
//

import SwiftUI
struct SuccessScreen: View {
    var body: some View {
        VStack {
            ZStack {
                Image("Background2")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                
                Image("Circle")
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            VStack {
                Text("Booking Success!")
                    .font(.title)
                    .padding()
                
                Text("Your Booking for Ideation Room on Sunday, March 19, 2023 is confirmed.")
                    .padding()
            }
            .padding()

            Spacer() // هذا يضيف مسافة بين محتوى الصور والزر
            
            // الزر في الأسفل
            Button("Button") {
                // هنا يمكن وضع الكود الخاص بالزر
            }
            .padding()  // يمكنك إضافة padding حسب الحاجة
            .frame(maxWidth: .infinity, alignment: .center)
            // لضمان محاذاة الزر بشكل صحيح

        }
        .background(Color("AccentColor").ignoresSafeArea()) // الخلفية الأساسية
    }
}

#Preview {
    SuccessScreen()
}
