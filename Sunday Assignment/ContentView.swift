//
//  ContentView.swift
//  Sunday Assignment
//
//  Created by administrator on 26/08/2021.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var controller = APIController()
	var body: some View {
		NavigationView{
			List{
				ForEach(controller.playerList.keys.sorted(by: <), id: \.self){ country in
					HStack{
						Text("\(country)")
							.padding(.horizontal)
						NavigationLink("", destination: TeamView(playerList: (controller.playerList[country] ?? controller.playerList["India"]!)
						)
						)
					}
					
				}
			}
			.navigationBarTitle("Countries")
		}
		
		.onAppear(perform: {self.controller.fetchData()
		})
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
