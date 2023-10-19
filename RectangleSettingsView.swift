//
//  RectangleSettingsView.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/15/23.
//

import SwiftUI

struct RectangleSettingsView: View {
    
    
    
    @Binding var focusDuration: Int
    @Binding var breakDuration: Int
    @Binding var sessions: Int
       private let focusIncrement = 5
       private let breakIncrement = 5
       private let sessionIncrement = 1
    @FocusState private var isFocused: Bool
    @FocusState private var isFocused2: Bool
    @FocusState private var isFocused3: Bool
    @AppStorage("progress") var progress: Double = 0.5
    @AppStorage("progress2") var progress2: Double = 0.1
    @AppStorage("progress3") var progress3: Double = 0.3
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        
                VStack {
                    HStack{
                        Text("Focus Duration (min)")
                        Spacer()
                        Text("\(Int((50 * progress).rounded()))")
                    }
                    .frame(width: 800)
                    CustomSliderView(range: 10, progress: Binding<CGFloat>(
                        get: { CGFloat(progress) },
                        set: { progress = Double($0) }
                    ))
                        .onChange(of: progress) { newValue in
                                        focusDuration = Int(50 * newValue)
                                    }
                        .focusable()
                        .focused($isFocused)
                        .scaleEffect(isFocused ? 1.1 : 1.0)
                        .onMoveCommand { (direction) in
                            switch direction {
                            case .right:
                                if isFocused {
                                    progress += 0.1
                                    if progress > 1.0 { progress = 1.0 }
                                }
                            case .left:
                                if isFocused {
                                    progress -= 0.1
                                    if progress < 0.0 { progress = 0.0 }
                                }
                            default:
                                break
                            }
                        }
                      
                    
                        
                    HStack{
                        Text("Break Duration (min)")
                        Spacer()
                        Text("\(Int((50 * progress2).rounded()))")
                    }
                    .frame(width: 800)
                    
                    CustomSliderView(range: 10, progress: Binding<CGFloat>(
                        get: { CGFloat(progress2) },
                        set: { progress2 = Double($0) }
                    ))
                        .onChange(of: progress2) { newValue in
                            breakDuration = Int(50 * newValue)
                                    }
                        .focusable()
                        .focused($isFocused2)
                        .scaleEffect(isFocused2 ? 1.1 : 1.0)
                    
                        .onMoveCommand { (direction) in
                            switch direction {
                            case .right:
                                if isFocused2 {
                                    progress2 += 0.1
                                    if progress2 > 1.0 { progress2 = 1.0 }
                                }
                            case .left:
                                if isFocused2 {
                                    progress2 -= 0.1
                                    if progress2 < 0.0 { progress2 = 0.0 }
                                }
                            default:
                                break
                            }
                        }
                      
                    HStack{
                        Text("Sessions")
                        Spacer()
                        Text("\(Int((10 * progress3).rounded()))")
                    }
                    .frame(width: 800)
                    CustomSliderView(range: 10, progress: Binding<CGFloat>(
                        get: { CGFloat(progress3) },
                        set: { progress3 = Double($0) }
                    ))
                        .onChange(of: progress3) { newValue in
                            sessions = Int(10 * newValue)
                                    }
                        .focusable()
                        .focused($isFocused3)
                        .scaleEffect(isFocused3 ? 1.1 : 1.0)
                        .onMoveCommand { (direction) in
                            switch direction {
                            case .right:
                                if isFocused3 {
                                    progress3 += 0.1
                                    if progress3 > 1.0 { progress3 = 1.0 }
                                }
                            case .left:
                                if isFocused3 {
                                    progress3 -= 0.1
                                    if progress3 < 0.0 { progress3 = 0.0 }
                                }
                            default:
                                break
                            }
                        }
                      
                      
                       }
                    .frame(width: 1920, height: 400)
                   
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.5) )
                    .onAppear {
                        isFocused = true
                    }
                    .onChange(of: isFocused) { newValue in
                                if !newValue && !isFocused2 {
                                    isSheetPresented = false
                                }
                            }
                    
        
    }
}
struct SettingSliderView: View {
    let title: String
    @Binding var value: Int
    let increment: Int
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text("\(value)")
                .padding()
                .background(Color.gray)
                .clipShape(Circle())
                
            
        }
       
        .focusable(true)
    }
}


#Preview {
    RectangleSettingsView(focusDuration: .constant(25), breakDuration: .constant(5), sessions: .constant(1), isSheetPresented: .constant(true))
}
