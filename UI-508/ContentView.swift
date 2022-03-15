//
//  ContentView.swift
//  UI-508
//
//  Created by nyannyan0328 on 2022/03/15.
//

import SwiftUI

struct ContentView: View {
    @State var isShow : Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            if isShow{
                
                Home()
            }
        }
        .frame(maxWidth:.infinity)
        .background{
            
            ZStack{
                
                
                VStack{
                    
                    
                    Circle()
                        .fill(Color("Green"))
                        .scaleEffect(0.6)
                        .offset(x: 20)
                        .blur(radius: 20)
                    
                    Circle()
                        .fill(Color("Red"))
                        .scaleEffect(0.6)
                        .offset(x: -30)
                        .blur(radius: 20)
                }
                
                Rectangle()
                    .fill(.ultraThinMaterial)
            }
            .ignoresSafeArea()
            
            
            
        }
        
        .preferredColorScheme(.dark)
    
      
        
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                
                
                isShow = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension View{
    
    func lLeading()->some View{
        
        self
            .frame(maxWidth:.infinity,alignment: .leading)
    }
}
