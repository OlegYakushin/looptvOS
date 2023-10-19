//
//  Settings.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/10/23.
//

import SwiftUI

struct Settings: View {
    @AppStorage("sceneChange") var sceneChange: String = "Loop One"
    @AppStorage("clockFormat") var clockFormat: String = "AM/PM"
    @AppStorage("musicVolume") var musicVolume: Int = 50
    @AppStorage("soundtrack") var soundtrack: String = "Lofi"
      
       @State private var pomodoroPosition = "Bottom Center"
    @AppStorage("position") var position: Int = 1
    @State private var sceneChanges = ["Loop One","Shuffle All"]
    @State private var clockFormats = ["AM/PM","Military time"]
    @State private var musicVolumes = [0,25,50,75,100]
    @State private var soundtracks = ["Lofi","Forest","Countryside","Rain","Thunderstorm","Stream","Waves"]
    @State private var positions = [1,0,-1]
    @State private var showSceneChangePicker = false
    @State private var showPositionPicker = false
    @State private var showClockPicker = false
    @State private var showMusicVolumePicker = false
    @State private var showSoundtrackPicker = false
    @State private var currentPicker: PickerType?

    enum PickerType: Identifiable {
        case sceneChange
        case clock
        case musicVolume
        case soundtrack
        case position
        // добавьте другие типы при необходимости

        var id: Int {
            switch self {
            case .sceneChange:
                return 1
            case .clock:
                return 2
            case .musicVolume:
                return 3
            case .soundtrack:
                return 4
            case .position:
                return 5
            }
        }
    }
    var body: some View {
        ZStack{
            VStack {
                Button(action: {
                    currentPicker = .sceneChange
                }) {
                    
                    
                    HStack{
                        Text("Scene Change")
                            .font(
                                Font.custom("SF Pro", size: 36)
                                    .weight(.medium)
                            )
                        
                        Spacer()
                        Text(sceneChange)
                            .font(
                                Font.custom("SF Pro", size: 36)
                                    .weight(.medium)
                            )
                    }
                    
                    
                    
                    .frame(width: 655, height: 55.5)
                    
                    
                }
                
                .background(Color("GrayOne").cornerRadius(20))
                .actionSheet(isPresented: $showSceneChangePicker) {
                               ActionSheet(title: Text("Select Scene Change"), buttons: sceneChanges.map { sceneValue in
                                   .default(Text(sceneValue)) {
                                       sceneChange = sceneValue
                                   }
                               })
                           }
                
                
                Button(action: {
                    currentPicker = .clock
                }) {
                    
                    
                    HStack{
                        Text("Clock")
                            .font(
                                Font.custom("SF Pro", size: 36)
                                    .weight(.medium)
                            )
                        
                        Spacer()
                        Text(clockFormat)
                            .font(
                                Font.custom("SF Pro", size: 36)
                                    .weight(.medium)
                            )
                    }
                    
                    
                    
                    .frame(width: 655, height: 55.5)
                    
                    
                }
               
                
                .background(Color("GrayOne").cornerRadius(20))
                Button(action: {
                    currentPicker = .musicVolume
                }) {
                    
                    
                    HStack{
                        Text("Music Volume")
                            .font(
                                Font.custom("SF Pro", size: 36)
                                    .weight(.medium)
                            )
                        
                        Spacer()
                        Text("\(musicVolume)%")
                            .font(
                                Font.custom("SF Pro", size: 36)
                                    .weight(.medium)
                            )
                    }
                    
                    
                    
                    .frame(width: 655, height: 55.5)
                    
                    
                }
                
                .background(Color("GrayOne").cornerRadius(20))
                
                Button(action: {
                    currentPicker = .soundtrack
                }) {
                    
                    
                    HStack{
                        Text("Soundtrack")
                            .font(
                                Font.custom("SF Pro", size: 36)
                                    .weight(.medium)
                            )
                        
                        Spacer()
                        Text(soundtrack)
                            .font(
                                Font.custom("SF Pro", size: 36)
                                    .weight(.medium)
                            )
                    }
                    
                    
                    
                    .frame(width: 655, height: 55.5)
                    
                    
                }
                
                .background(Color("GrayOne").cornerRadius(20))
                Button(action: {
                    currentPicker = .position
                }) {
                    
                    
                    HStack{
                        Text("Pomodoro Position")
                            .font(
                                Font.custom("SF Pro", size: 36)
                                    .weight(.medium)
                            )
                        
                        Spacer()
                        Text(positionString(from: position))
                            .font(
                                Font.custom("SF Pro", size: 36)
                                    .weight(.medium)
                            )
                    }
                    
                    
                    
                    .frame(width: 655, height: 55.5)
                    
                    
                }
                
              
                
                .background(Color("GrayOne").cornerRadius(20))
                
            }
            .offset(y:-100)
        }
                .navigationTitle("Settings")
               
                
                .actionSheet(item: $currentPicker) { pickerType in
                            switch pickerType {
                            case .sceneChange:
                                return ActionSheet(title: Text("Select Scene Change"), buttons: sceneChanges.map { sceneValue in
                                    .default(Text(sceneValue)) {
                                        sceneChange = sceneValue
                                        currentPicker = nil
                                    }
                                })
                            case .clock:
                                return ActionSheet(title: Text("Select Clock Format"), buttons: clockFormats.map { clockValue in
                                    .default(Text(clockValue)) {
                                        clockFormat = clockValue
                                        currentPicker = nil
                                    }
                                })
                            case .musicVolume:
                                return ActionSheet(title: Text("Select Clock Format"), buttons: musicVolumes.map { volume in
                                    .default(Text("\(volume)%")) {
                                        musicVolume = volume
                                        currentPicker = nil
                                    }
                                })
                            case .soundtrack:
                                    return ActionSheet(title: Text("Select Clock Format"), buttons: soundtracks.map { Newsoundtrack in
                                        .default(Text(Newsoundtrack)) {
                                            soundtrack = Newsoundtrack
                                            currentPicker = nil
                                        }
                                    })
                            case .position:
                                return ActionSheet(title: Text("Select Pomodoro Position"), buttons: positions.map { positionValue in
                                    .default(Text(positionString(from: positionValue))) {
                                        position = positionValue
                                        currentPicker = nil
                                    }
                                })
                            }
                        }
               
                            
                
            }
    
}
func positionString(from value: Int) -> String {
    switch value {
    case 1:
        return "Bottom"
    case 0:
        return "Center"
    case -1:
        return "Top"
    default:
        return "Unknown"
    }
}

#Preview {
    Settings()
}
