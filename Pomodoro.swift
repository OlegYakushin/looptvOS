//
//  Pomodoro.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/10/23.
//

import SwiftUI
import AVFoundation


struct Pomodoro: View {
    @AppStorage("focusDuration") var focusDuration: Int = 25
    @AppStorage("breakDuration") var breakDuration: Int = 5
    @AppStorage("sessions") var sessions: Int = 3
    @AppStorage("timeRemaining") var timeRemaining: Int = 1500
    @AppStorage("position") var position: Int = 1
    @State private var currentSession = 1
    @State private var isFocusTime = true
    @State private var isSheetPresented = false
    @State private var isActive = false
    @State private var isPaused = false

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let player = AVPlayer(url: Bundle.main.url(forResource: "Waterfront_Market", withExtension: "mp4")!)
    
    var body: some View {
        ZStack{
            VStack(spacing: 20) {
                
                
               
                Text("Rest")
                    .opacity(isFocusTime ? 0:1)
                Text(String(format: "%02d:%02d", timeRemaining / 60, timeRemaining % 60))
                
                    .kerning(0.25)
                    .font(.system(size: 128, weight: .heavy))
                    .onReceive(timer) { _ in
                                           guard timeRemaining > 0 && isActive && !isPaused else { return }
                                           timeRemaining -= 1
                                           if timeRemaining == 0 {
                                               if isFocusTime && currentSession < sessions {
                                                   timeRemaining = breakDuration * 60
                                                   isFocusTime.toggle()
                                               } else if !isFocusTime && currentSession < sessions {
                                                   currentSession += 1
                                                   timeRemaining = focusDuration * 60
                                                   isFocusTime.toggle()
                                               } else {
                                                   isActive = false
                                                   currentSession = 1
                                                   timeRemaining = focusDuration * 60
                                               }
                                           }
                                       }
                   
                HStack(spacing:0){
                    if isActive == false {
                        Button(
                            action: {
                                isActive.toggle()
                            },
                            label: {
                                VStack{
                                    Text("Start")
                                        .font(
                                            Font.custom("SF Pro", size: 26)
                                                .weight(.bold)
                                        )
                                    
                                    
                                    
                                }
                                .frame(width: 100,height: 60)
                              
                            }
                               
                        )
                     
                        .background(Color("BlackButton").cornerRadius(50))
                        .cornerRadius(50)
                    
                        
                        Button(
                            action: {
                                withAnimation(.easeOut) {
                                    isSheetPresented.toggle()
                                }
                            },
                            label: {
                                
                                Image(systemName: "gearshape.fill")
                                
                                    .font(.headline)
                                    .padding(10)
                                
                                    .clipShape(Circle())
                                
                                
                                
                                
                                
                                
                            }
                            
                        )
                        .background(Color("BlackButton"))
                        .clipShape(Circle())
                        
                    }else{
                       
                        Button(
                            action: {
                                isPaused.toggle()
                            },
                            label: {
                               
                                Image(systemName: isPaused ? "play.fill" : "pause.fill")
                                
                                    .font(.headline)
                                    .padding(10)
                                
                                    .clipShape(Circle())
                                
                                
                                
                                
                                
                                
                            }
                            
                        )
                        .background(Color("BlackButton"))
                        .clipShape(Circle())
                        Button(
                            action: {
                                isActive.toggle()
                                timeRemaining = focusDuration * 60
                                currentSession = 1
                                isFocusTime = true
                            },
                            label: {
                                
                                Image(systemName: "stop.fill")
                                
                                    .font(.headline)
                                    .padding(10)
                                
                                    .clipShape(Circle())
                                
                                
                                
                                
                                
                                
                            }
                            
                        )
                        .background(Color("BlackButton"))
                        .clipShape(Circle())
                        
                        
                    }
                    
                }
            }
            .offset(x: 0,y: CGFloat(300 * position))
            
            VStack{
                Spacer()
                if isSheetPresented {
                    withAnimation{
                        RectangleSettingsView(focusDuration: $focusDuration, breakDuration: $breakDuration, sessions: $sessions, isSheetPresented: $isSheetPresented)
                            .background(BlurView(style:.regular))
                            .onChange(of: focusDuration) { newValue in
                                timeRemaining = focusDuration * 60
                            }
                            .onExitCommand(perform: {
                                isSheetPresented = false
                            })
                        
                        
                        
                        
                    }
                    }
                
            }
            .ignoresSafeArea()
         
           
        }
    }

    
}
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    Pomodoro()
}
