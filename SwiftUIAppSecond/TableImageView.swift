//
//  TableImageView.swift
//  SwiftUIAppSecond
//
//  Created by Mac on 03.06.2021.
//

import SwiftUI

struct TableImageView: View {
    let size = CGSize(width: 250, height: 250)
    var body: some View {
        Image(systemName: "table")
            .resizable()
//            .frame(width: 250, height: 250)
//            .cornerRadius(250/2)
//            .modifier(FrameFromSize(size: size))
            .frame(size)
            .background(Color(white: 0.9))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.red, lineWidth: 8))
            .foregroundColor(.red)
    }
}

struct FrameFromSize: ViewModifier {
    let size: CGSize
    func body(content: Content) -> some View {
        content
            .frame(width: size.width, height: size.height)
    }
}
extension View {
    func frame(_ size: CGSize) -> some View {
        modifier(FrameFromSize(size: size))
    }
}

struct TableImageView_Previews: PreviewProvider {
    static var previews: some View {
        TableImageView()
    }
}
