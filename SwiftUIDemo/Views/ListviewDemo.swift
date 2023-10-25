//
//  ListviewDemo.swift
//  SwiftUIDemo
//
//  Created by Admin on 29/08/23.
//

import SwiftUI

struct ListviewDemo: View {
    
    @ObservedObject var viewModel = VideoListViewModel()
    
    var body: some View {
        VStack {
            
            SearchBar(searchText: $viewModel.searchText,searchType: "Videos")

            List(viewModel.filteredVideos,id: \.id) { viewModelVideo in
            NavigationLink(destination: DetailsView(video: viewModelVideo), label:{
                HStack { // Wrap each item in an HStack
                    Image(viewModelVideo.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .cornerRadius(4)
                        .padding(.vertical,4)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(viewModelVideo.title)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                        
                        Text(viewModelVideo.uploadDate)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            })
        }
        .listRowSeparator(.hidden)
        .listStyle(.plain)
        .background(Color.white)
        .overlay(
            viewModel.filteredVideos.isEmpty ?
            Text("No record found")
                .bold()
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
            : nil
        )
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white)
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

}

struct ListviewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ListviewDemo()
    }
}
