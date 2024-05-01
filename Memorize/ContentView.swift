//
//  ContentView.swift
//  Memorize
//
//  Created by Randy Zhu on 2024-05-01.
//

import SwiftUI

// ContentView: behaves like a View...
// fp: focused on behaviour - behaviour encapsulation
// View: draws something on the screen
struct ContentView: View { // struct, not a class
    // some View -> type of body can be ANYTHING but it has to be a view
    var body: some View { // computed property, not stored, but it's computed
        VStack {
            Card(displayStr: "🤔")
            Card(isFaceUp: false, displayStr: "😡")
        }
        
        /*
         Really the same as
         VStack(content: {
         Image(systemName: "globe") [...]
         Text(...) ...
         })
         */
        .padding()
    }
}

struct Card: View {
    var isFaceUp: Bool = true
    var displayStr: String
    var body : some View {
        ZStack() { // a function
            // weird function
            // creates a tuple view, returns it
            //            Image(systemName: "globe")
            //                .imageScale(.small) // fn calls, view modifier
            // changes structs
            //                .foregroundStyle(.tint)
            //            Text("Hello, CS193p!") // creates Text struct
            
            // <Struct Name>(<args...>) -> new struct
            // named parameter: a specified parameter
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
                Text(displayStr).font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.black)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
