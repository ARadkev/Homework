//
//  ContentView.swift
//  Layout.homework
//
//  Created by AR on 11.12.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var enteredText: String = ""
    
    var body: some View {
        VStack (spacing: 1) {
            HStack(spacing: 10) {
                Image("flowers")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
                VStack(alignment: .leading, spacing: 20) {
                    Text("First")
                        .font(.system(size: 20))
                    Text("Middle")
                        .font(.system(size: 20))
                    Text("Last")
                        .font(.system(size: 20))
                }
                VStack {
                    TextField("Enter First Name", text: $enteredText)
                        .textFieldStyle(.roundedBorder)
//                        .background(Color.gray.opacity(0.2), in: RoundedRectangle(cornerRadius: 3))
                    TextField("Enter Second Name", text: $enteredText)
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter Last Name", text: $enteredText)
                        .textFieldStyle(.roundedBorder)
                }
                
            }
            .padding([.leading, .trailing, .bottom], 15.0)
            TextEditor(text: .constant("Notes:"))
                .font(.system(size: 20))
                .scrollContentBackground(.hidden)
                .background(.gray)
                .opacity(0.7)
                .padding([.leading, .trailing], 15.0)
            HStack(spacing: 70) {
                Button("Save") {
                    print("Information is saved")
                }
                Button("Cancel") {
                    print("Action is canceled")
                }
                Button("Clear") {
                    print("Information is cleared")
                }
            }
            .padding([.top, .bottom, .leading, .trailing], 15.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
