import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skill_thread/models/User.dart';
import 'package:skill_thread/screens/profile/Notifications.dart';
import 'package:skill_thread/screens/profile/Profile.dart';
import 'package:skill_thread/screens/settings/Settings.dart';


class Home extends StatefulWidget {

	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

	@override
	Widget build(BuildContext context) {

		final user = Provider.of<User>(context);

		return Scaffold(
			appBar: AppBar(
				actions: [
					IconButton(
						padding: EdgeInsets.only(right: 20.0),
						icon: Icon(Icons.settings_rounded),
						iconSize: 30.0,
						color: Colors.black,
						onPressed: () {
							Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
						}
					)
				],
				leading: IconButton(
					padding: EdgeInsets.only(left: 20.0),
					icon: Icon(Icons.account_box_rounded),
					iconSize: 30.0,
					color: Colors.black,
					onPressed: () {
						Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
					},
				),
				title: IconButton(
					icon: Icon(Icons.notifications_rounded),
					iconSize: 30.0,
					onPressed: () {
						Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
					},
					color: Colors.black,
				),
				centerTitle: true,
				backgroundColor: Colors.white,
				elevation: 0,
			),
			body: Container(
				color: Colors.white,
				padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
				child: ListView(
				children: [
					SizedBox(
						height: 30.0,
					),
					Row(
						children: [
							Text(
								'Hey, Bohdan',
								textAlign: TextAlign.center,
								style: TextStyle(
									color: Colors.black,
									fontSize: 24.0
								)
							),
						],
						mainAxisAlignment: MainAxisAlignment.center,
					),
					SizedBox(
						height: 20.0,
					),
					Row(
						children: [
							Text(
								'Which skill are you looking to\naquire today?',
								textAlign: TextAlign.center,
								style: TextStyle(
									color: Colors.grey[700],
									fontSize: 18.0,
								),
							)
						],
						mainAxisAlignment: MainAxisAlignment.center,
					),
					SizedBox(
						height: 30.0,
					),
					Container(
						child: Column(
							children: [
								Material(
									// elevation: 5.0, - shadow
									color: Colors.grey[200],
									borderRadius: BorderRadius.circular(15.0),
									child: TextFormField(
										onChanged: (value) {

										},
										enableSuggestions: true,
										decoration: InputDecoration(
											hintText: 'Try: Marketing, Time-management',
											prefixIcon: Icon(Icons.search_rounded, color: Colors.blue[400]),
											border: InputBorder.none
										),
										textAlignVertical: TextAlignVertical.center,
									)
								),
								SizedBox(
									height: 15.0,
								),
								Row(
									children: [
										Column(
											children: [
												Text(
													'Threads for you',
													style: TextStyle(
														fontWeight: FontWeight.bold,
														fontSize: 16.0
													)
												)
											],
										),
										Column(
											children: [
												TextButton(
													onPressed: () {

													},
													child: Text(
														'See all',
														style: TextStyle(
															fontWeight: FontWeight.bold,
															fontSize: 16.0
														)
													)
												)
											]
										)
									],
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
								),
								SizedBox(
									height: 15.0,
								),
								Material(
									child: InkWell(
										onTap: () {
											print('Programming skills');
										},
										child:Container(
											child: Row(
												children: [
													Container(
														padding: EdgeInsets.only(top: 30.0),
														child: Column(
															children: [
																Text(
																	'Programming\nskills',
																	style: TextStyle(
																		color: Colors.white,
																		fontWeight: FontWeight.bold,
																		fontSize: 22.0
																	)
																),
																SizedBox(
																	height: 10.0,
																),
																Text(
																	'18 articles, 80 readers',
																	style: TextStyle(
																		color: Colors.white,
																		fontWeight: FontWeight.w200,
																		fontSize: 14.0
																	),
																)
															],
														),
														width: 170.0,
													),
													Container(
														width: 170.0,
														child: Image.asset('images/programming.png'),
														height: 150.0,
													)
												],
											),
											width: 340.0,
											height: 140.0,
										)
									),
									borderRadius: BorderRadius.circular(15.0),
									color: Colors.blue[700]
								),
								SizedBox(
									height: 20.0,
								),
								Material(
									child: InkWell(
										onTap: () {
											print('Marketing & Growth');
										},
										child: Container(
											child: Row(
												children: [
													Container(
														padding: EdgeInsets.only(top: 30.0),
														child: Column(
															children: [
																Text(
																	'Marketing &\nGrowth',
																	style: TextStyle(
																		color: Colors.white,
																		fontWeight: FontWeight.bold,
																		fontSize: 22.0
																	)
																),
																SizedBox(
																	height: 10.0,
																),
																Text(
																	'6 articles, 29 readers',
																	style: TextStyle(
																		color: Colors.white,
																		fontWeight: FontWeight.w200,
																		fontSize: 14.0
																	),
																)
															],
														),
														width: 170.0,
													),
													Container(
														child: Image.asset('images/marketing.png'),
														height: 150.0,
														width: 170.0,
													)
												],
											),
											width: 340.0,
											height: 140.0,
										)
									),
									borderRadius: BorderRadius.circular(15.0),
									color: Colors.red[400]
								),
								SizedBox(
									height: 20.0,
								),
								Material(
									child: InkWell(
										onTap: () {
											print('Statistics & Data Analysis');
										},
										child: Container(
											child: Row(
												children: [
													Container(
														padding: EdgeInsets.only(top: 30.0, left: 25.0),
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															children: [
																Text(
																	'Statistics &\nData analysis',
																	style: TextStyle(
																		color: Colors.white,
																		fontWeight: FontWeight.bold,
																		fontSize: 22.0
																	)
																),
																SizedBox(
																	height: 10.0,
																),
																Text(
																	'22 articles, 57 readers',
																	style: TextStyle(
																		color: Colors.white,
																		fontWeight: FontWeight.w200,
																		fontSize: 14.0
																	),
																)
															],
														),
														width: 170.0,
													),
													Container(
														child: Image.asset('images/data.png'),
														height: 150.0,
														width: 170.0
													)
												],
											),
											width: 340.0,
											height: 140.0
										)
									),
									borderRadius: BorderRadius.circular(15.0),
									color: Colors.grey[800]
								),
								SizedBox(
									height: 20.0,
								),
								Material(
									child: InkWell(
										onTap: () {
											print('Health & Lifestyle');
										},
										child: Container(
											child: Row(
												children: [
													Container(
														padding: EdgeInsets.only(top: 30.0, left: 25.0),
														child: Column(
															crossAxisAlignment: CrossAxisAlignment.start,
															children: [
																Text(
																	'Health &\nLifestyle',
																	style: TextStyle(
																		color: Colors.white,
																		fontWeight: FontWeight.bold,
																		fontSize: 22.0
																	)
																),
																SizedBox(
																	height: 10.0,
																),
																Text(
																	'7 articles, 32 readers',
																	style: TextStyle(
																		color: Colors.white,
																		fontWeight: FontWeight.w200,
																		fontSize: 14.0
																	),
																)
															],
														),
														width: 170.0,
													),
													Container(
														child: Image.asset('images/sport.png'),
														height: 150.0,
														width: 170.0
													)
												],
											),
											width: 340.0,
											height: 140.0,
										),
									),
									color: Colors.teal[300],
									borderRadius: BorderRadius.circular(15.0),
								),
								SizedBox(
									height: 20.0,
								)
							]
						),
					)
				],
				),
			)
		);
	}
}