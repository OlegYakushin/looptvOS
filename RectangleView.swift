//
//  RectangleView.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/12/23.
//

import SwiftUI

struct RectangleView: View {
    @State  var title:String
    var body: some View {
        RoundedRectangle(cornerRadius: 14.5)
       
            .frame(width: 738, height: 76.5)
            .foregroundColor(Color("Gray"))
            .shadow(color: .black.opacity(0.25), radius: 11.5, x: 0, y: 4)
            .overlay(
                HStack{
                    Text(title)
                        .font(
                        Font.custom("SF Pro", size: 36)
                        .weight(.medium)
                        )
                    Spacer()
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .font(
                        Font.custom("SF Pro", size: 36)
                        .weight(.medium)
                        )
                }
                    .padding()
        )
    }
}

#Preview {
    RectangleView(title: "Scene Change")
}
