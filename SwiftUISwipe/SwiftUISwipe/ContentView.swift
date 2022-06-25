//
//  ContentView.swift
//  SwiftUISwipe
//
//  Created by Angelos Staboulis on 26/6/22.
//

import SwiftUI
struct NumbersStruct:Identifiable,Equatable{
    var id = UUID()
    var number:Int!
}
struct ContentView: View {
    @State var numbers:[NumbersStruct]=[]
    var body: some View {
        Text("Swipe Actions in SwiftUI")
        List(numbers,id:\.id){ item in
            Text(String(describing: item.number!)).swipeActions {
                Button {
                    let numbersMap = numbers.map{$0.number == item.number}
                    let index = numbersMap.firstIndex(of: true)
                    numbers.remove(at: index!)
                } label: {
                    Text("Delete").foregroundColor(.red)
                }
                
            }
        }.onAppear {
            for _ in 1..<50 {
                numbers.append(NumbersStruct(id: UUID(), number: Int.random(in: 1..<100) ))
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
