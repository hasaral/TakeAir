//
//  SearchView.swift
//  TakeAir
//
//  Created by Hasan Saral on 17.12.2024.
//


import SwiftUI
import CommonModel

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    @AppStorage("searchKey") var searchKey: String?

    @State private var searchText = ""
    var hasCancel: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(height: 40)
                        .cornerRadius(12)
                        .foregroundColor(.black)
                    HStack {
                        Spacer()
                        
                        TextField("Search location", text: $searchText)
                            .font(Font.custom("Poppins-Regular", size: 15))
                            .frame(height: 50)
                            .textFieldStyle(.plain)
                            .cornerRadius(12)
                            .onChange(of: searchText) { newValue in
                                    viewModel.fetchData(searchText: newValue)
                            }
                        
                        Image(systemName: "magnifyingglass")
                            .padding(.trailing, 10)
                    }
                    .background(Color("SearchBackground"))
                    .cornerRadius(16)
                }
            }
            Spacer()
            switch viewModel.setState {
            case .pending:
                VStack {
                    Text("No City Selected")
                        .foregroundColor(Color("TextBacground"))
                        .font(Font.custom("Poppins-SemiBold", size: 30))

                    Text("Please Search For A City")
                        .foregroundColor(Color("TextBacground"))
                        .font(Font.custom("Poppins-SemiBold", size: 15))

                }
            case .error:
                
                EmptyState()
                Spacer()
            case .searchResponse(_):
                ZStack {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 10) {
                            ForEach(viewModel.weatherElement) { response in
                                WeatherWidget(forecast: response)
                                    .onTapGesture {
                                        searchKey = response.name
                                        viewModel.fetchDetail()
                                }
                            }
                        }
                    }
                }.padding(.top,10)
                .navigationBarHidden(true)
            case .getDetail(let getDetail):
                DetailView(getDetail: getDetail)
            }
            Spacer()
        }
    }
}


