//
//  WeatherWidget.swift
//  TakeAir
//
//  Created by Hasan Saral on 17.12.2024.
//


import SwiftUI
import CommonModel
import ServiceManager

struct WeatherWidget: View {
    var forecast: WeatherElement
    
    var body: some View {
        ZStack() {
            HStack() {
                VStack() {
                    
                    Text("\(forecast.name)")
                        .font(Font.custom("Poppins-SemiBold", size: 20))
                        .foregroundColor(Color("infoTextBack"))
                        .frame(width: 200)
                        .lineLimit(1)
                        .padding(.trailing,-10)
                        .padding(.top, 10)
                    
                    // MARK: I left it fixed because there was no degree in the incoming data
                    Text("\(20)°")
                        .font(Font.custom("Poppins-SemiBold", size: 60))
                        .foregroundColor(Color("infoTextBack"))
                        .frame(width: 200)
            
                }
                
                Spacer()
                
                VStack() {
                    AsyncImage(url: URL(string: "https://cdn.weatherapi.com/weather/64x64/day/116.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 110, height: 80)
                            .cornerRadius(8)
                    } placeholder: {
                        Image(systemName: "photo.artframe.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 110, height: 80)
                            .cornerRadius(8)
                    }
                }
            }
            .background(Color("CellBack"))
            .cornerRadius(16)
        }
        .frame(height: 127, alignment: .bottom)
    }
}


