//
//  TabView.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/10/23.
//

import SwiftUI
import AVFoundation

struct MyTabView: View {
    @AppStorage("sceneChange") var sceneChange: String = "Loop One"
    @AppStorage("sceneSelect") var sceneSelect: String = "Waterfront_Market"
    @State private var scenes = ["marsoutpost","ancient_library","Waterfront_Market","mushroom_forest"]
    @State private var player: AVPlayer = AVPlayer()
    @State private var selectedTabIndex: Int = 0
    @State private var isTabViewVisible: Bool = true
    @State private var showNavigationBar = true
     
    func play() {
          player.play()
      }
      
      func pause() {
          player.pause()
      }
      
      func setSource(forScene scene: String) {
          if let url = Bundle.main.url(forResource: scene, withExtension: "mp4") {
              let item = AVPlayerItem(url: url)
              player.replaceCurrentItem(with: item)
          }
      }
      
    var body: some View {
        

         
        ZStack{
            AVPlayerViewControllerRepresentable(player: player)
                .frame(width: 1918,height: 1080)
                .blur(radius: (selectedTabIndex == 2 || selectedTabIndex == 3) ? 20 : 0)
            
          
                TabView(selection: $selectedTabIndex){
                
                    NowPlaying(nextAction: nextVideo, prevAction: previousVideo)
                    
                    
                        .tabItem {
                            VStack {
                                
                                Text("Loophop")
                                
                            }
                            
                        }
                        .tag(0)
                    
                    
                    Pomodoro()
                    
                        .tabItem {
                            VStack {
                                
                                Text("Pomodoro")
                            }
                        }.tag(1)
                    Scenes(sceneSelect: $sceneSelect)
                    
                        .tabItem {
                            VStack {
                                
                                Text("Scenes")
                            }
                        }.tag(2)
                    Settings()
                    
                        .tabItem {
                            VStack {
                                
                                Text("Settings")
                            }
                        }.tag(3)
                }
                
               
          
            
        }
    
        .onChange(of: sceneSelect) { newValue in
                    pause()
                    setSource(forScene: newValue)
                    play()
                }
                .onAppear {
                    setSource(forScene: sceneSelect)
                    play()
                    NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
                            self.videoDidEnd()
                        }
                }
               
               
        
             
       
                
    }
        
    func nextVideo() {
        if let currentSceneIndex = scenes.firstIndex(of: sceneSelect) {
            let nextSceneIndex = (currentSceneIndex + 1) % scenes.count
            sceneSelect = scenes[nextSceneIndex]
        }
    }

    func previousVideo() {
        if let currentSceneIndex = scenes.firstIndex(of: sceneSelect), currentSceneIndex > 0 {
            let previousSceneIndex = currentSceneIndex - 1
            sceneSelect = scenes[previousSceneIndex]
        } else if sceneSelect == scenes.first {
            sceneSelect = scenes.last ?? ""
        }
    }


    func videoDidEnd() {
        if sceneChange == "Loop One" {
            player.seek(to: .zero)
            play()
        } else if sceneChange == "Shuffle All" {
            if let currentSceneIndex = scenes.firstIndex(of: sceneSelect) {
                let nextSceneIndex = (currentSceneIndex + 1) % scenes.count
                sceneSelect = scenes[nextSceneIndex]
            } else {
                sceneSelect = scenes[0]
            }
        }
    }
    
   
}


#Preview {
    MyTabView()
}
