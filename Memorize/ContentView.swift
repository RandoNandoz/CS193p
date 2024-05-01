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
            let emojis: [String] = [
                "👻", "🫡", "😤"
            ]
            
            ForEach(emojis.indices, id: \.self) { index in
                Card(isFaceUp: false, displayStr: emojis[index])
            }
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
    @State var isFaceUp = true
    var displayStr: String
    
    // view modifier
    
    var body : some View {
        // trailing closure syntax: last param is closure (lambda) {}
        ZStack { // a function
            // weird function
            // creates a tuple view, returns it
            //            Image(systemName: "globe")
            //                .imageScale(.small) // fn calls, view modifier
            // changes structs
            //                .foregroundStyle(.tint)
            //            Text("Hello, CS193p!") // creates Text struct
            
            // <Struct Name>(<args...>) -> new struct
            // named parameter: a specified parameter
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(displayStr).font(.largeTitle)
            } else {
                base.foregroundColor(.gray)
            }
        }.onTapGesture { // count: number of counts
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
