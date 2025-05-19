//
//  ExercisecA.swift
//  RelaxApp
//
//  Created by ITIT on 19/05/25.
//

import SwiftUI

struct ExerciseCard: View {
    let title: String
    let imageUrl: String
    let shortDescription: String
    
    var body: some View {
        VStack(alignment: .center){
            AsyncImage(url: URL(string: imageUrl)) {image in
                image
                    .resizable()
                    .scaledToFill()
            }
            placeholder:{
                Color.gray.opacity(0.3)
            }
            .frame(height:100)
            .frame(maxWidth: .infinity)
            .clipped()
            
            Spacer().frame(height:8)
            
            Text(title)
                .lineLimit(1)
                .truncationMode(.tail)
            
            Spacer().frame(height:8)
            
            Text(shortDescription)
                .lineLimit(2)
                .truncationMode(.tail)
        }
        .padding(8)
        .frame(width:200)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius:4)
        .padding(8)
    }
}
