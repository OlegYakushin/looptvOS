//
//  NowPlaying.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/10/23.
//

import SwiftUI
import AVKit

struct NowPlaying: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var soundtrack = "Lofi"
    
    @AppStorage("musicVolume") var musicVolume: Int = 50

    @FocusState private var isLeftButtonFocused: Bool
       @FocusState private var isRightButtonFocused: Bool
    var nextAction: () -> Void
        var prevAction: () -> Void

    enum SwipeDirection {
        case left
        case right
        case none
    }
   
    var body: some View {
 
        ZStack {
           
           
            VStack {
              
              
                Spacer()
                HStack {
                    Spacer()
                    TimeView()
                }
                
            }
          
            
            HStack {
                           Button(action: prevAction) {
                               Image(systemName: "arrow.left")
                                   .padding(.all)
                                   .foregroundColor(.white)
                                   .opacity(isLeftButtonFocused ? 1.0 : 0.0)
                           }
                           .buttonStyle(PlainButtonStyle())
                           .focused($isLeftButtonFocused)
                           Spacer()
                           Button(action: nextAction) {
                               Image(systemName: "arrow.right")
                                   .padding(.all)
                                   .foregroundColor(.white)
                                   .opacity(isRightButtonFocused ? 1.0 : 0.0)
                           }
                           .buttonStyle(PlainButtonStyle())
                           .focused($isRightButtonFocused)
                       }
            
            
        }
        .onAppear {
            playAudio()
        }
        .onDisappear {
            audioPlayer?.stop()
        }

    }
    func playAudio() {
        if let url = Bundle.main.url(forResource: soundtrack, withExtension: "mp3") { //
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.volume =  Float(musicVolume) / 100.0
                audioPlayer?.play()
            } catch {
                print("Error: \(error)")
            }
        }
    }

}

struct TimeView: View {
    @AppStorage("clockFormat") var clockFormat: String = "AM/PM"
    @State private var currentTime: Date = Date()
    @State private var isColonVisible: Bool = true
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        HStack(spacing: 0) {
            Text(Formatter.hourString(from: currentTime, format: clockFormat))
                .kerning(0.25)
                .font(.system(size: 64, weight: .heavy))
            
            Text(":")
                .kerning(0.25)
                .font(.system(size: 64, weight: .heavy))
                .opacity(isColonVisible ? 1 : 0)
            
            Text(Formatter.minuteString(from: currentTime, format: clockFormat))
                .kerning(0.25)
                .font(.system(size: 64, weight: .heavy))
            if clockFormat == "AM/PM" {
                       Text(" \(Formatter.amPmString(from: currentTime))")
                           .kerning(0.25)
                           .font(.system(size: 64, weight: .heavy))
                          
                   }
            
        }
        .onReceive(timer) { _ in
            self.isColonVisible.toggle()
            self.currentTime = Date()
        }
    }
}

struct Formatter {
    static func hourString(from date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        if format == "AM/PM" {
            formatter.dateFormat = "h"
        } else {
            formatter.dateFormat = "HH"
        }
        return formatter.string(from: date)
    }
    
    static func minuteString(from date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "mm"
        return formatter.string(from: date)
    }
    static func amPmString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "a"
        return formatter.string(from: date)
    }
}



struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}

struct AVPlayerViewControllerRepresentable: UIViewControllerRepresentable {
    var player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

