//
//  TabBarView.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/19/23.
//

import SwiftUI
struct TabBarView: View {
    @Binding var selectedTabIndex: Int
    let tabs = ["Loophop", "Pomodoro", "Scenes", "Settings"]

    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(.gray)
            .frame(width: 750, height: 65)
            .overlay(
                HStack(spacing: 20) {
                    ForEach(0..<tabs.count) { index in
                        Text(tabs[index])
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .frame(width: 170, height: 65)
                            .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.08))
                            .background(
                                RoundedRectangle(cornerRadius: 40)
                                   
                                    .fill(selectedTabIndex == index ? Color.white : Color.clear)
                            )
                            .onTapGesture {
                                selectedTabIndex = index
                            }
                    }
                }
                .padding(.horizontal, 20)
            )
        
    }
}


#Preview {
    TabBarView(selectedTabIndex: .constant(0))
}
