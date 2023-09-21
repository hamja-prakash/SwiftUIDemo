//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Admin on 24/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    @State private var isActive = false
    
    var body: some View {
        ZStack{
            BackgroundColorView(isNight: $isNight)
            //            .navigationBarBackButtonHidden(true)
            //            .navigationBarHidden(true)
            VStack{
                
                CityNameView(cityName: "Cuportino,CA")
                
                MainWheatherView(ImageName: "cloudy", Temp: 76)
                
                Spacer()
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloudy", temprature: 76)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "rainy-day", temprature: 89)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "clouds", temprature: 52)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "rainy-day", temprature: 91)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloudy", temprature: 72)
                }
                Spacer()
                
//                NavigationLink(destination: ListviewDemo(),isActive:                $isActive) {EmptyView()}
                Button{
                    print("Tapped")
                    isNight.toggle()
                    isActive = true
                }
            label:{
                wheatherButtonView(btntext: "Change Day Time", backgroundcolor: .white, textcolor: .blue)
            }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WeatherDayView: View {
    var dayOfWeek : String
    var imageName : String
    var temprature: Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
            
            Image(imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temprature)°")
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundColorView: View {
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? .gray : .white]), startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView:View{
    var cityName : String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWheatherView:View{
    var ImageName : String
    var Temp : Int
    var body: some View{
        VStack(spacing: 10){
            Image(ImageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
            Text("\(Temp)°")
                .font(.system(size: 58, weight: .medium))
                .foregroundColor(.white)
        }
    }
}


