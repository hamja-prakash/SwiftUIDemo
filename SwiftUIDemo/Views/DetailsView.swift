//
//  DetailsView.swift
//  SwiftUIDemo
//
//  Created by Admin on 29/08/23.
//

import SwiftUI

struct DetailsView: View {
    var video : VideoListViewModel.Video
    var body: some View {
        VStack{
            Spacer()
            
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(4)
                .padding(.vertical,5)
            
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack(spacing: 40){
                Label("\(video.viewCount)",systemImage: "eye")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Text(video.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Link(destination: video.url, label: {
                Text("Watch Now")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity,minHeight: 50)
                    .foregroundColor(.white)
                    .background(.red)
                    .cornerRadius(10)
                    .padding(.horizontal,10)
            })
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(video: VideoListViewModel.VideoList.topTen.first!)
    }
}
