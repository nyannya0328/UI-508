//
//  FitnessRingView.swift
//  UI-508
//
//  Created by nyannyan0328 on 2022/03/15.
//

import SwiftUI

struct FitnessRingView: View {
    var body: some View {
        VStack(spacing:15){
            
            Text("Progress")
                .fontWeight(.light)
                .lLeading()
            
            
            HStack(spacing:25){
                
                
                
                ZStack{
                    
                    
                    ForEach(rings.indices,id:\.self){index in
                        
                        AnimatedRingView(ring: rings[index], index:index)
                        
                        
                    }
                    
                    
                }
                .frame(width: 150, height: 150)
                
                
                
                VStack(alignment: .leading, spacing: 13) {
                    
                    
                    
                    ForEach(rings){ring in
                        
                        Label {
                            
                            HStack(alignment:.bottom,spacing: 5){
                                
                                Text("\(Int(ring.progress))%")
                                    .font(.title3)
                                
                                Text(ring.value)
                                    .font(.caption)
                                
                            }
                            
                        } icon: {
                            
                            
                            if ring.isText{
                                
                                
                                Text(ring.keyIcon)
                                    .font(.title2)
                                
                            }
                            else{
                                
                                Image(systemName: ring.keyIcon)
                                    .font(.title2)
                                
                                
                                
                            }
                        }
                        .frame(height:30)

                        
                        
                    }
                    
                    
                }
                .padding(.leading,10)
                
                
            }
            .padding(.top,20)
            
          
            
            
                        
        }
        .padding(.vertical,20)
        .padding(.horizontal,20)
        .background{
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.ultraThinMaterial)
            
            
        }
    }
}

struct FitnessRingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimatedRingView : View{
    
    var ring : Ring
    var index : Int
    
    @State var showRing : Bool = false
    var body: some View{
        
        
        ZStack{
            
            
            Circle()
                .stroke(.gray,lineWidth: 10)
            
            
            Circle()
                .trim(from: 0, to: showRing ? rings[index].progress / 90 : 0)
                .stroke(rings[index].keyColor,style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .rotationEffect(.init(degrees: 180))
            
        }
        .padding(CGFloat(index * 16))
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                
                
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).delay(Double(index) * 0.1)){
                    
                    
                    showRing = true
                }
                
                
            }
        }
    
        
        
    }
}
