//
//  CustomeTabSwitcher.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 18.09.20.
//

import SwiftUI

struct CustomeTabSwitcher: View {
    
    var tabs: [CustomTab]
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        let string = tab.rawValue
        return string.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabs, id: \.self) {
                        tab in
                        
                        VStack {
                            // Red Bar
                            Rectangle()
                                .foregroundColor(.red)
                            
                            
                                .frame(width:widthForTab(tab), height: 6)
                            
                            // Button
                            Button(action: {
                                //
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                            })
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            
            Text("SELECTED VIEW")
        }
        .foregroundColor(.white)
    }
}

enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomeTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            
            CustomeTabSwitcher(tabs: [.episodes, .trailers, .more])
        }
    }
}
