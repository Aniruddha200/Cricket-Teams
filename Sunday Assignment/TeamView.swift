//
//  TeamView.swift
//  Sunday Assignment
//
//  Created by administrator on 27/08/2021.
//

import SwiftUI

struct TeamView: View {
	@State var playerList: [CountryModel]
	@State private var isActionBarShowing = false
	var body: some View {
		List{
			ForEach(playerList){player in
				
				HStack{
					Image(systemName: "person.circle")
						.resizable()
						.scaledToFit()
						.frame(width: 25, height: 25, alignment: .center)
					Text("\(player.name)")
						.font(.title2)
					
					
					if let captainStatus = player.captain{
						if captainStatus{
							Text("(c)")
								.font(.title2)
								.fontWeight(.bold)
						}
					}
				}
				
			}
			
		}
		.padding(.vertical)
		.actionSheet(isPresented: $isActionBarShowing){
			ActionSheet(title: Text("Sorting options"), message: Text("Select  anyone from the below options"), buttons: [.default(Text("Firstname"), action: {
				self.playerList.sort(by: {$0.firstName < $1.firstName})
			}),.default(Text("Surname"), action: {
				self.playerList.sort(by: {$0.lastName < $1.lastName})
			}),.cancel()])
		}
		
		.navigationBarTitle("Team View", displayMode: .inline)
		.navigationBarItems(trailing: Button(action: {
			isActionBarShowing.toggle()
		}){
			
			
			Image(systemName: "line.horizontal.3.decrease.circle")
				.resizable()
				.scaledToFit()
				.frame(width: 30, height: 30, alignment: .center)
				.foregroundColor(.blue)
				.padding(.horizontal)
			
		})
	}
}
