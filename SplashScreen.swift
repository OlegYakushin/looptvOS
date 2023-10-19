//
//  SplashScreen.swift
//  loophop
//
//  Created by Oleg Yakushin on 10/10/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        Group {
            
            if isActive {
                MyTabView()
            }else{
                ZStack{
                    Image("SplashBackground")
                        .resizable()
                        .frame(width: 1920,height: 1080)
                    Image("SplashLogo")
                        .resizable()
                        .frame(width: 870,height: 218)
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear{
                            withAnimation(.easeIn(duration: 1.2)){
                                self.size = 0.9
                                self.opacity = 1.0
                            }
                            
                        }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation{
                            self.isActive = true
                        }
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
