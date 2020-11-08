//
//  PagerView.swift
//  NetflixClone
//
//  Created by Gianmarco Giretti on 08.11.20.
//

import SwiftUI

struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    let content: Content
    
    init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        translation: Binding<CGFloat>,
        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                self.content
                    .frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geo.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
            DragGesture()
                .onChanged({ value in
                    translation = value.translation.width
                })
                .onEnded({ value in
                    let offset = value.translation.width / geo.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                    currentIndex = Int(newIndex)
                    translation = 0
                })
            )
        }
    }
}

struct PagerView_Previews: PreviewProvider {
    static var previews: some View {
        PagerView(pageCount: 3, currentIndex: .constant(2 ), translation: .constant(.zero), content: {
            Color.red
            Color.blue
            Color.black
        })
    }
}
