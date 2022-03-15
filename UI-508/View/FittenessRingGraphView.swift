//
//  FittenessRingGraphView.swift
//  UI-508
//
//  Created by nyannyan0328 on 2022/03/15.
//

import SwiftUI

struct FittenessRingGraphView: View {
    var body: some View {
        VStack(spacing:15){
            
            
            Text("Steps Hours")
                .fontWeight(.semibold)
                .lLeading()
            
            GraphView(steps: steps)
        }
        
        .padding(.vertical,20)
        .padding(.horizontal,20)
        .background{
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.ultraThinMaterial)
            
            
        }
        
    }
}

struct FittenessRingGraphView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GraphView : View{
    
    var steps : [Step]
    
    var body: some View{
        
        Graph().padding(.top)
        
        
    }
    
    @ViewBuilder
    func Graph()->some View{
        
        
        GeometryReader{proxy in
            
            
            ZStack{
                
                VStack(spacing:0){
                    
                    
                    ForEach(getGraphLines(),id:\.self){line in
                        
                        
                        HStack(spacing:20){
                            
                            
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(height:20)
                            
                            
                            Rectangle()
                                .fill(.gray)
                                .frame(height: 1)
                                .offset(x: -15)
                            
                            
                            
                            
                        }
                        .frame(maxHeight:.infinity,alignment: .top)
                        .offset(x: -15)
                        
                    }
                    
                    
                    
                }
                
                HStack(spacing:15){
                    
                    
                    ForEach(steps.indices,id:\.self){index in
                        
                        
                        
                        
                        let step = steps[index]
                        
                        VStack(spacing:5){
                            
                            VStack{
                                
                          AnimatedBarGraphView(step: steps[index], index: index)
                            }
                            .padding(.horizontal,5)
                            .frame(height: getBarHight(point: step.value, size: proxy.size))
                            
                            
                            Text(step.key
                                .replacingOccurrences(of: "pm", with: "")
                                .replacingOccurrences(of: "Am", with: "")
                            )
                                .font(.caption)
                                .frame(height: 25, alignment: .bottom)
                                
                           
                            
                            
                        }
                        .font(.caption)
                        .frame(height: 25, alignment: .bottom)
                        
                        
                        
                    }
                    
                    
                }
                .frame(maxHeight:.infinity,alignment: .bottom)
                
                
                
                
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            
            
            
        }
        .frame(height:250)
        
        
    }
    func getBarHight(point : CGFloat,size : CGSize)->CGFloat{
        
        
        let max = getMax()
        
        let height = (point / max) * (size.height - 37)
        
        return height
        
        
    }
    
    func getGraphLines()->[CGFloat]{
        
        let max = getMax()
        
        var lines : [CGFloat] = []
        
        lines.append(max)
        
        
        for index in 1...6{
            
            
            let progress = max / 4
            
            lines.append(max - (progress * CGFloat(index)))
        }
        
        return lines
    }
    
    func getMax()->CGFloat{
        
        let max = steps.max { first, sec in
            
            return sec.value > first.value
        }?.value ?? 0
        
        return max
    }
}


struct AnimatedBarGraphView : View{
    
    
    var step : Step
    var index : Int
  
    @State var showBar : Bool = false
    
    var body: some View{
        
        VStack(spacing:0){
            
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .fill(step.color)
                .frame(height: showBar ? nil : 0, alignment: .bottom)
            
            
        }
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                
                
                
                withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8).delay(Double(index) * 0.1)){
                    
                    showBar = true
                }
                
                
            }
        }
        
        
    }
}
