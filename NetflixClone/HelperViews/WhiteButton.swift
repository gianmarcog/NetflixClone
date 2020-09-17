//
//  WhiteButton.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 14.09.20.
//

import SwiftUI

struct WhiteButton: View {
    
    var text: String
    var imageName: String
    
    
    var action: () -> Void
    
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                
                // systemName ermöglicht auf SF-Symbole zuzugreifen
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .bold()
                    .font(.system(size: 16))
                
                Spacer()
            }
            .padding(.vertical, 6)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(3.0)
            
        })
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
        WhiteButton(text: "Play", imageName: "play.fill") {
            //
        }
        }
    }
}
