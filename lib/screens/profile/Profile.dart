import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skill_thread/models/User.dart';
import 'package:skill_thread/screens/Wrapper.dart';
import 'package:skill_thread/services/AuthService.dart';
import 'package:skill_thread/screens/profile/Notifications.dart';


class Profile extends StatefulWidget {

	@override
	_ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

	final AuthService _authService = AuthService();

	@override
	Widget build(BuildContext context) {

		// User variable
		var user = Provider.of<User>(context);
		// 	
		
		return Scaffold(
			
			appBar: AppBar(
				backgroundColor: Colors.white,
				elevation: 0.0,
				leading: IconButton(
					icon: Icon(Icons.arrow_back_ios_rounded),
					padding: EdgeInsets.only(left: 10.0),
					color: Colors.grey[800],
					onPressed: () {
						Navigator.pop(context);
					},
				),
				actions: [
					IconButton(
						color: Colors.grey[800],
						icon: Icon(Icons.notifications_rounded),
						iconSize: 30.0,
						padding: EdgeInsets.only(right: 10.0),
						onPressed: () {
							Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
						}
					)
				],
			),
			body: Container(
				color: Colors.white,
				child: Column(
					children: [
						Row(
							children: [
								Container(
									child: Text(
										'Bohdan',
										style: TextStyle(
											color: Colors.grey[800],
											fontWeight: FontWeight.bold,
											fontSize: 36.0
										),
									),
									padding: EdgeInsets.only(left: 25.0),
								),
								TextButton(
									child: Text(
										'Edit',
										style: TextStyle(
											fontSize: 20.0
										)
									),
									style: ButtonStyle(
										tapTargetSize: MaterialTapTargetSize.shrinkWrap,
										padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
									),
									onPressed: () {

									}
								)
							],
							mainAxisAlignment: MainAxisAlignment.spaceBetween
						), 
						Row(
							children: [
								Container(
									child: Text(
										'grynkiv0x001@gmail.com',
										style: TextStyle(
											color: Colors.grey[500],
											fontWeight: FontWeight.w300,
											fontSize: 14.0
										),
									),
									padding: EdgeInsets.only(left: 25.0),
								)
							],
							mainAxisAlignment: MainAxisAlignment.spaceBetween
						),
						SizedBox(
							height: 20.0
						),
						Row(
							children: [
								Container(
									decoration: BoxDecoration(
										borderRadius: BorderRadius.circular(50.0),
										color: Colors.brown[50]
									),
									padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
									child: Column(
										children: [
											Text(
												'4',
												style: TextStyle(
													color: Colors.grey[800],
													fontWeight: FontWeight.bold,
													fontSize: 36.0
												),
											),
											Text(
												'liked',
												style: TextStyle(
													color: Colors.grey[500],
													fontWeight: FontWeight.w300,
													fontSize: 14.0
												)
											)
										],
									),
								),
								Container(
									decoration: BoxDecoration(
										borderRadius: BorderRadius.circular(50.0),
										color: Colors.brown[50]
									),
									padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
									child: Column(
										children: [
											Text(
												'1',
												style: TextStyle(
													color: Colors.grey[800],
													fontWeight: FontWeight.bold,
													fontSize: 36.0
												),
											),
											Text(
												'aquired',
												style: TextStyle(
													color: Colors.grey[500],
													fontWeight: FontWeight.w300,
													fontSize: 14.0
												)
											)
										],
									),
								),
								Container(
									decoration: BoxDecoration(
										borderRadius: BorderRadius.circular(50.0),
										color: Colors.brown[50]
									),
									padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
									child: Column(
										children: [
											Text(
												'18',
												style: TextStyle(
													color: Colors.grey[800],
													fontWeight: FontWeight.bold,
													fontSize: 36.0
												),
											),
											Text(
												'read',
												style: TextStyle(
													color: Colors.grey[500],
													fontWeight: FontWeight.w300,
													fontSize: 14.0
												)
											)
										],
									),
								)
							],
							mainAxisAlignment: MainAxisAlignment.spaceAround,
						)
					],
				)
			),
			bottomSheet: BottomAppBar(
				child: Container(
					alignment: Alignment.bottomCenter,
					child: TextButton(
						child: Text(
							'Log out'
						),
						onPressed: () async {
							await _authService.signOut();
							Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper()));
						},
					),
					height: 50.0,
				)
			),
		);
	}
}
