//
//  SmallVerticalButton.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 14.09.20.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text: String
    
    // Bedigungen welche der Button haben kann
    var isOnImage: String
    var isOffImage: String
    var color: Color = Color.white
    
    var isOn: Bool
    
    // Zustandsänderung des Buttons
    var imageName: String {
        if isOn {
            return isOnImage
        } else {
            return isOffImage
        }
    }
    
    var action: () -> Void
    
    var body: some View {
        
        //Button wird erstellt
        Button(action: {
            action()
        }
        // Etikett-Design wird erstellt
        , label: {
            VStack {
               Image(systemName: imageName)
                .foregroundColor(color)
                
                Text(text)
                    .foregroundColor(color)
                    .font(.system(size: 14))
                    .bold()
            }
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true, action: {
            print ("Tapped")
        }).background(Color.black)
    }
}
