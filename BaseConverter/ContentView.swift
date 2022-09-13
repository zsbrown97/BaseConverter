//
//  ContentView.swift
//  BaseConverter
//
//  Created by Zack Brown on 9/13/22.
//

import SwiftUI

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

func conversion(userNum: Int, conversionBase: Int) -> String {
    return "\(userNum + conversionBase)"
}

struct ContentView: View {
    @ObservedObject var input = NumbersOnly()
    @State private var base = 2
    @State private var userInt = 5
    
    private let bases: [Int] = Array(2...36)
    
    
    
    var body: some View {
        VStack{
            Text("Hello, world!")
                .padding()
           
            TextField("Base 10 Integer", text: $input.value).padding().keyboardType(.numberPad)
            
            Picker(selection: $base, label: Text("Picker")) {
                ForEach(bases, id:\.self){base in
                    Text("\(base)").tag(base)
                }
            }.pickerStyle(WheelPickerStyle())
            
            Text("Your base is \(conversion(userNum: userInt, conversionBase: base))")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
