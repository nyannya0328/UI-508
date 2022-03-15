//
//  Home.swift
//  UI-508
//
//  Created by nyannyan0328 on 2022/03/15.
//

import SwiftUI

struct Home: View {
    @State var currentWeek : [Date] = []
    @State var currentDay : Date = Date()
    
    @State var showViews : [Bool] = Array(repeating: false, count: 5)
    var body: some View {
        VStack{
            
            HStack{
                
                
                Text("Current Week")
                    .font(.title.weight(.bold))
                
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "ellipsis.circle")
                        .font(.title2)
                       
                }

            }
            .foregroundColor(.white)
            .opacity(showViews[0] ? 1 : 0)
            .offset(y: showViews[0] ? 0 : 250)
            
            
            HStack(spacing:10){
                
               
                
                
                ForEach(currentWeek,id:\.self){date in
                    
                    
                   
                    Text(ExTractDate(date:date))
                        .fontWeight(isSameToday(day1: currentDay, day2: date) ? .bold : .semibold)
                        .frame(maxWidth:.infinity)
                        .padding(.vertical,isSameToday(day1: currentDay, day2: date) ? 6 : 0)
                        .padding(.horizontal,isSameToday(day1: currentDay, day2: date) ? 12 : 0)
                        .frame(width: isSameToday(day1: currentDay, day2: date) ? 140 : nil)
                        .background{
                            
                            
                           Capsule()
                                .fill(.ultraThinMaterial)
                                .environment(\.colorScheme, .light)
                                .opacity(isSameToday(day1: currentDay, day2: date) ? 1 : 0)
                                
                        }
                        .onTapGesture {
                            
                            
                            withAnimation{
                                
                                currentDay = date
                            }
                        }
                     
                       
                
                    
                    
                }
            }
            .padding(.top,20)
            .opacity(showViews[1] ? 1 : 0)
            .offset(y: showViews[1] ? 0 : 250)
            
            
            VStack(alignment:.leading,spacing: 10){
                
                Text("Steps")
                    .font(.title3)
                
                Text("6500")
                    .font(.largeTitle.weight(.bold))
                    
            }
            .lLeading()
            .padding(.vertical,10)
            .opacity(showViews[2] ? 1 : 0)
            .offset(y: showViews[2] ? 0 : 250)
            
            
            FitnessRingView()
                .opacity(showViews[3] ? 1 : 0)
                .offset(y: showViews[3] ? 0 : 250)
            
            
            FittenessRingGraphView()
                .opacity(showViews[4] ? 1 : 0)
                .offset(y: showViews[4] ? 0 : 250)
            
            
        
            
            
            
            
            
        }
        .padding()
        .onAppear(perform: addAnimationView)
        .onAppear(perform: exTractCurrentWeek)
    }
    
    func addAnimationView(){
        
        
        withAnimation(.easeOut){
            
            showViews[0] = true
        }
        
        withAnimation(.easeOut.delay(0.1)){
            
            showViews[1] = true
        }
        
        
        withAnimation(.easeOut.delay(0.15)){
            
            showViews[2] = true
        }
        
        
        withAnimation(.easeOut.delay(0.23)){
            
            showViews[3] = true
        }
        
        
        withAnimation(.easeOut.delay(0.3)){
            
            showViews[4] = true
        }
        
        
        
        
    }
    
    func exTractCurrentWeek(){
        
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: Date())
        
        
        guard let firstDay = week?.start else{return}
        
        
        (0..<7).forEach { day in
            
            
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstDay){
                
                currentWeek.append(weekDay)
                
            }
            
        }
        
    }
    
    
    func ExTractDate(date : Date) -> String{

        let formatter = DateFormatter()

        formatter.dateFormat = (isSameToday(day1: currentDay, day2: date) ? "dd MMM" : "dd")
        
        return (isToday(date: date) && isSameToday(day1: currentDay, day2: date) ? "Today ," : "") + formatter.string(from: date)
        
        
        



    }

    
    
    func isToday(date : Date) -> Bool{
        let calendar = Calendar.current
        
        return calendar.isDateInToday(date)
        
    }
    
    func isSameToday(day1 : Date,day2 : Date) -> Bool{
        
        
        let calendar = Calendar.current
        
        return calendar.isDate(day1, inSameDayAs: day2)
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
