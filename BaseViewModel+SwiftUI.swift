//
//  BaseViewModel.swift
//  CodeVault
//
//  Created by Rattanakoudom Sambath on 27/12/23.
//

import SwiftUI

open class BaseViewModel<State: Equatable>: ObservableObject {

    @Published public var state: State

    init(initialState: State) {
        self.state = initialState
    }
    
    public func binding<Value>(
            _ keyPath: WritableKeyPath<State, Value>
        ) -> Binding<Value> where Value: Equatable {
            .init(
                get: { self.state[keyPath: keyPath] },
                set: { [weak self] newValue in
                    guard let self = self else { return }

                    guard
                        self.stateWillChangeValue(keyPath, newValue: newValue)
                    else { return }

                    let oldValue = self.state[keyPath: keyPath]
                    guard newValue != oldValue else { return }
                    self.state[keyPath: keyPath] = newValue
                    self.onStateChange(keyPath)
                }
            )
        }

        public func update<Value>(
             _ keyPath: WritableKeyPath<State, Value>,
             to newValue: Value
         ) where Value: Equatable {
             self.state[keyPath: keyPath] = newValue
         }

        open func stateWillChangeValue<Value>(
            _ keyPath: PartialKeyPath<State>,
            newValue: Value
        ) -> Bool where Value: Equatable {
            return true
        }

        open func onStateChange(_ keyPath: PartialKeyPath<State>) {}
}

// Usage
/// ViewModel
struct SampleState: Equatable {
    var someString: String
    var someBool: Bool = false
}

class SampleViewModel: BaseViewModel<SampleState> {}

///View
struct SampleView: View {
    
    @StateObject var viewModel: SampleViewModel
    
    var body: some View {
        VStack {
            // Binding
            TextField("PlaceHolder", text: viewModel.binding(\.someString))
            
            // State
            Text(viewModel.state.someString)
            
            // Change/Update Value
            Button(action: {
                viewModel.update(\.someBool, to: true)
            }, label: {
                Text("Button")
            })
        }
    }
}
