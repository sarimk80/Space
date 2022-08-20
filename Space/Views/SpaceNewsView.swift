//
//  SpaceNewsView.swift
//  Space
//
//  Created by sarim khan on 17/08/2022.
//

import SwiftUI

struct SpaceNewsView: View {
    @StateObject private var spaceNewsViewModel:SpaceNewsViewModel=SpaceNewsViewModel()
    var body: some View {
        NavigationStack {
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack{
                    switch spaceNewsViewModel.spaceNewsState{
                    case .loading:
                        ProgressView()
                    case .initial:
                        ProgressView()
                    case .error(let error):
                        Text(error)
                    case .loaded(let news):
                        NewsList(spaceNewsList: news)
                        
                    }
                }
            }
            .navigationTitle("Space News")
            
            
        }
        
    }
}

struct SpaceNewsView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceNewsView()
    }
}

struct NewsList: View {
    var spaceNewsList:[SpaceNews]
    var body: some View {
        Group{
            ScrollView {
                ForEach(spaceNewsList) { news in
                    NewsCard(spaceNews: news)
                }
            }
        }
        
    }
}


struct NewsCard: View {
    
    
    var spaceNews:SpaceNews
    
    
    
    var body: some View {
        VStack(alignment: .leading,spacing:8) {
            AsyncImage(url: URL(string: spaceNews.imageUrl)) {image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(15)
            .frame(maxWidth: .infinity,maxHeight: 200)
            
            Link(destination: URL(string: spaceNews.url)!) {
                VStack(alignment: .leading) {
                    Text(spaceNews.title)
                        .font(.headline)
                    Text(spaceNews.summary)
                        .font(.subheadline)
                }
            }
            .buttonStyle(.plain)
            
            Text(convertStringToDate(_dateTime: spaceNews.publishedAt),format:.dateTime)
            
            Divider()
        }
        //.background(Color("CardColor"))
        .padding()
    }
}
