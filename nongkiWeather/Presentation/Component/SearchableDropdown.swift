//
//  SearchableDropdown.swift
//  nongkiWeather
//
//  Created by Dinda Ayu Syafitri on 03/12/24.
//

import SwiftUI

struct SearchableDropdown<T: Identifiable & Hashable>: View {
    @State var isExpanded = false
    @Binding var selectedOption: T?
    @State var searchText = ""

    var options: [T]
    var displayKey: KeyPath<T, String>

    var filteredOptions: [T] {
        if searchText.isEmpty {
            return options
        } else {
            return options.filter { $0[keyPath: displayKey].lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        VStack {
            Button(action: { isExpanded.toggle() }) {
                HStack {
                    Text(selectedOption?[keyPath: displayKey] ?? "Pilih")
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

                    ScrollView {
                        ForEach(filteredOptions, id: \.self) { option in
                            Text(option[keyPath: displayKey])
                                .padding()
                                .onTapGesture {
                                    selectedOption = option
                                    isExpanded = false
                                }
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 5)
                .frame(maxHeight: 500)
                .zIndex(10)
            }
        }
        .foregroundStyle(.black)
    }
}
