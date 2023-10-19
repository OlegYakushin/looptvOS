//
//  CustomSlider.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/16/23.
//

import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
     var title: String
     var range: ClosedRange<Double>
    @State private var percentage: CGFloat = 0.5
    @State private var isFocused: Bool = false
    
    var body: some View {
        VStack {
                  Text(title)
                      .font(.headline)
                  
                  HStack {
                      ForEach(range.map { Double($0) }, id: \.self) { num in
                          Rectangle()
                              .frame(width: 10, height: num == value ? 30 : 20)
                              .foregroundColor(num == value ? .blue : .gray)
                              .focusable(true)
                              .onFocusChange { inFocus in
                                  if inFocus {
                                      value = num
                                  }
                              }
                      }
                  }
                  .padding(.horizontal)
                  
                  Text("\(Int(value))")
              }
          }
      }
#Preview {
    CustomSlider()
}
