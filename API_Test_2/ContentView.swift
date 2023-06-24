//
//  ContentView.swift
//  API_Test_2
//
//  Created by MAC on 25/6/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var coffee: [CoffeeModel] = []
    var body: some View {
        Text(coffee.first?.title ?? "")
        Button {
            Task {
                let (data, _) = try await URLSession.shared.data(from: URL(string:"https://devilarticle.com/api/Coffee")!)
                let decodedResponse = try? JSONDecoder().decode([CoffeeModel].self, from: data)
                coffee = decodedResponse ?? []
            }
        } label: {
            Text("Fetch Joke")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct CoffeeModel: Codable {
    var id: Int
    var title: String
}
