//
//  SearchableDropdown.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import SwiftUI

struct SearchableDropdown: View {
    @State var isExpanded = false
    @State var selectedOption: String
    @State var searchText = ""
    @State var options: [String]

    var filteredOptions: [String] {
        if searchText.isEmpty {
            return options
        } else {
            return options.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        VStack {
            Button(action: { isExpanded.toggle() }) {
                HStack {
                    Text(selectedOption)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1)
                })
            }

            if isExpanded {
                VStack {
                    TextField("Search...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    ForEach(filteredOptions, id: \.self) { option in
                        Text(option)
                            .padding()
                            .onTapGesture {
                                selectedOption = option
                                isExpanded = false
                            }
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 5)
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    SearchableDropdown(selectedOption: "1", options: ["1", "2"])
}
