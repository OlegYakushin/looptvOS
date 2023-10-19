//
//  Scenes.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/10/23.
//

import SwiftUI

struct Scenes: View {
    @FocusState var isScene1
    @FocusState var isScene2
    @FocusState var isScene3
    @FocusState var isScene4
    @Binding var sceneSelect: String
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
                HStack{
                    VStack{
                        Button(
                                   action: { 
                                       sceneSelect = "marsoutpost"
                                   },
                                   label: {
                                       VStack{
                                           Image("scene1")
                                               .resizable()
                                               .scaledToFill()
                                               .frame(width: 438, height: 438)
                                           
                                           
                                       }
                                   }
                                )
                                
                                .focused($isScene1)
                            
                        
                        .buttonStyle(.card)
                        
                            Text("Marsoutpost")
                            .padding(10)
                                .opacity(isScene1 ? 1 : 0)
                                
                        
                       
                    }
                    VStack{
                        Button(
                                   action: {
                                       sceneSelect = "ancient_library"
                                   },
                                   label: {
                                       VStack{
                                           Image("scene2")
                                               .resizable()
                                               .scaledToFill()
                                               .frame(width: 438, height: 438)
                                           
                                           
                                       }
                                   }
                                )
                                
                                .focused($isScene2)
                            
                        
                        .buttonStyle(.card)
                        
                            Text("Ancient Library")
                            .padding(10)
                                .opacity(isScene2 ? 1 : 0)
                                
                        
                       
                    }
                    VStack{
                        Button(
                                   action: {
                                       sceneSelect = "Waterfront_Market"
                                   },
                                   label: {
                                       VStack{
                                           Image("scene3")
                                               .resizable()
                                               .scaledToFill()
                                               .frame(width: 438, height: 438)
                                           
                                           
                                       }
                                   }
                                )
                                
                                .focused($isScene3)
                            
                        
                        .buttonStyle(.card)
                        
                            Text("Waterfront Market")
                            .padding(10)
                                .opacity(isScene3 ? 1 : 0)
                                
                        
                       
                    }
              
                    
                    
                    
                    
                    
                    
                    
                    
                }
                .frame(width: 1920)
                HStack{
                    VStack{
                        Button(
                                   action: {
                                       sceneSelect = "mushroom_forest"
                                   },
                                   label: {
                                       VStack{
                                           Image("scene4")
                                               .resizable()
                                               .scaledToFill()
                                               .frame(width: 438, height: 438)
                                           
                                           
                                       }
                                   }
                                )
                                
                                .focused($isScene4)
                            
                        
                        .buttonStyle(.card)
                        
                            Text("Mushroom Forest")
                            .padding(10)
                                .opacity(isScene4 ? 1 : 0)
                                
                        
                       
                    }
                /* For future animation
                    VStack{
                        Button(
                                   action: { },
                                   label: {
                                       VStack{
                                           Image("scene2")
                                               .resizable()
                                               .scaledToFill()
                                               .frame(width: 438, height: 438)
                                           
                                           
                                       }
                                   }
                                )
                                
                                .focused($isScene2)
                            
                        
                        .buttonStyle(.card)
                        
                            Text("Ancient Library")
                            .padding(10)
                                .opacity(isScene2 ? 1 : 0)
                                
                        
                       
                    }
                    VStack{
                        Button(
                                   action: { },
                                   label: {
                                       VStack{
                                           Image("scene3")
                                               .resizable()
                                               .scaledToFill()
                                               .frame(width: 438, height: 438)
                                           
                                           
                                       }
                                   }
                                )
                                
                                .focused($isScene3)
                            
                        
                        .buttonStyle(.card)
                        
                            Text("Waterfront Market")
                            .padding(10)
                                .opacity(isScene3 ? 1 : 0)
                                
                        
                       
                    }
              */
                    
                    
                    
                    
                    
                    
                    
                    
                }
                .frame(width: 1920)
                
            }
            
        }
        .background(.black.opacity(0.6))
    }
}

#Preview {
    Scenes(sceneSelect: .constant(""))
}
