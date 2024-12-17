//
//  DetailView.swift
//  TakeAir
//
//  Created by Hasan Saral on 17.12.2024.
//


import SwiftUI
import CommonModel

struct DetailView: View {
    let getDetail: (Weather)
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    AsyncImage(url: URL(string: "https:\(getDetail.current.condition.icon)")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 123, height: 123)
                            .cornerRadius(8)
                    } placeholder: {
                        Image(systemName: "photo.artframe.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 123, height: 123)
                            .cornerRadius(8)
                    }
                    
                    HStack {
                        Text("\(getDetail.location.name)")
                            .font(Font.custom("Poppins-SemiBold", size: 30))
                        
                        Image("VectorArrow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                    }
                    
                    let roundingString = String(format: "%.2f", getDetail.current.tempC)
                    Text("\(roundingString)°")
                        .font(Font.custom("Poppins-SemiBold", size: 70))
                        .foregroundColor(Color("infoTextBack"))
                }
                
                HStack {
                    VStack() {
                        Text("Humidity")
                            .font(Font.custom("Poppins-Medium", size: 12))
                            .foregroundColor(Color("DetailTextColor"))
                        
                        
                        Text("\(getDetail.current.humidity)%")
                            .font(Font.custom("Poppins-Medium", size: 15))
                            .foregroundColor(Color("DetailTextColor"))
                        
                    }
                    .padding(.leading, 35)

                    Spacer()
                    VStack() {
                        Text("UV")
                            .font(Font.custom("Poppins-Medium", size: 12))
                            .foregroundColor(Color("DetailTextColor"))
                        
                        
                        Text("\(String(describing: getDetail.current.uv ?? 0))")
                            .font(Font.custom("Poppins-Medium", size: 15))
                            .foregroundColor(Color("DetailTextColor"))
                        
                    }
                    Spacer()
                    VStack() {
                        Text("Feels Like")
                            .font(Font.custom("Poppins-Medium", size: 8))
                            .foregroundColor(Color("DetailTextColor"))
                        
                        let roundingFeel = String(format: "%.2f", getDetail.current.feelslikeC)
                        Text("\(roundingFeel)°")
                            .font(Font.custom("Poppins-Medium", size: 15))
                            .foregroundColor(Color("DetailTextColor"))
                        
                    }
                    .padding(.trailing, 35)
                   
                }
                .frame(width: 300, height: 75)
                .background(Color("CellBack"))
                .cornerRadius(16)
                 
            }
        }
    }
}

