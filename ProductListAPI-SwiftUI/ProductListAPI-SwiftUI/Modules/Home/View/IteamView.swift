//
//  IteamView.swift
//  ProductListAPI-SwiftUI
//
//  Created by niravkumar patel on 7/12/23.
//

import SwiftUI
import Kingfisher

struct IteamView: View {
    
    let image:KFImage
    let title:String
    let rating:String
    let price:String
    let size: CGFloat
    
    /// Popular and to pics Porduct design
    var body: some View {
        VStack(alignment: .leading) {
            
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .cornerRadius(20.0)
            
            Text(title)
                .fontWeight(.semibold)
                .font(.system(size: 16.0))
            
            HStack (spacing: 15) {
                
                Image(systemName: "star.fill")
                    .foregroundColor(Color(.systemYellow))
                    .frame(width: 1, height: 1)
                    .padding(.leading,10)
                
                Text(rating)
                    .font(.system(size: 15.0))
                    .fontWeight(.semibold)
                
                Spacer()
                Text("$"+price)
                    .font(.system(size: 13.0))
                    .fontWeight(.semibold)
            }
        }
        .foregroundColor(Color(.label))
        .frame(width: size)
        .frame(height: 230)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(20)
    }
}
