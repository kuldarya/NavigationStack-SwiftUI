//
//  ContentView.swift
//  NavigationStack
//

import SwiftUI

struct ContentView: View {
    
    var fruits = ["Apple", "Orange", "Banana"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    
                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                    }
                    
                    ForEach(0..<10) { x in
                        NavigationLink(value: x) {
                            Text("Click me: \(x)")
                        }
                    }
                }
            }
            .navigationTitle("Navigation Stack")
            .navigationDestination(for: Int.self) { value in
                MySecondView(value: value)
            }
            .navigationDestination(for: String.self) { value in
                Text("This is \(value)")
            }
        }
    }
}

struct MySecondView: View {
    
    let value: Int
    
    init(value: Int) {
        self.value = value
        print("INIT SCREEN: \(value)")
    }
    
    var body: some View {
        Text("Screen: \(value)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
