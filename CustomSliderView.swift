//
//  CustomSliderView.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/16/23.
//

import SwiftUI

struct CustomSliderView: View {
    var range: Int
    
    @Binding  var progress: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
                   RoundedRectangle(cornerRadius: 35)
                       .frame(width: 800, height: 19)
                       .foregroundColor(.gray)
                       .overlay(
                           HStack(spacing: 0) {
                               let numbers: [Int] = Array(0..<range)
                               ForEach(numbers, id: \.self) { index in
                                   Spacer()
                                   
                                   if index != range-1 {
                                       Circle()
                                           .frame(width: 9, height: 9)
                                           .foregroundColor(.white)
                                   }
                               }
                           }
                       )
                   
                   RoundedRectangle(cornerRadius: 35)
                       .frame(width: 800 * progress, height: 19)
                       .foregroundColor(.white)
                       .overlay(
                           Circle()
                               .frame(width: 38, height: 38)
                               .offset(x: 400 * progress)
                       )
               }
        
       

           
        
    }
}

#Preview {
    CustomSliderView(range: 10, progress: .constant(0.7))
}
