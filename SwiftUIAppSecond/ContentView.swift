//
//  ContentView.swift
//  SwiftUIAppSecond
//
//  Created by Mac on 03.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...1)
    @State private var userName = ""
    @State private var dispayedName = ""
    @State private var alertPresented = false
    var body: some View {
        VStack(spacing: 40) {
            Text("\(lround(sliderValue))")
                .font(.largeTitle)
            UserNameView(userName: dispayedName)
            ColorSlider(value: $sliderValue, color: .red)
            
            TextField("Enter your name", text: $userName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
                .bordered()
            Button("Done", action: checkUserName)
                .alert(isPresented: $alertPresented) {
                    Alert(title: Text("Wrong format"), message: Text("Enter your name"))
                }
            VStack {
                Text("Welcome")
                    .bold()
    //                .lineLimit(2)
    //                .multilineTextAlignment(.trailing)
                    .background(Color.orange)
    //            Здесь мы уже работаем с вью колор^^
                    .padding()
    //                .bold()
                    .background(Color.yellow)
                Text("to SwiftUI")
            }
            .font(.system(size: 40))
            .foregroundColor(.red)
            Spacer()
            
        }
        .padding()
    }
    
    private func checkUserName() {
        if let _ = Double(userName) {
            userName = ""
            alertPresented.toggle()
            return
        }
        dispayedName = userName
        userName = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    let color: Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(color)
            Slider(value: $value, in: 0...255, step: 1)
                .background(Color.gray)
                .cornerRadius(40)
            Text("255").foregroundColor(color)
        }
    }
}

struct UserNameView: View {
    let userName: String
    var body: some View {
        HStack {
            Text("User name: \(userName)")
                .font(.largeTitle)
            Spacer()
        }
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 2))
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
    }
}
extension TextField {
    func bordered() -> some View {
        ModifiedContent(content: self, modifier: BorderedViewModifier())
    }
}
