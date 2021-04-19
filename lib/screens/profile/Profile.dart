import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skill_thread/models/User.dart';
import 'package:skill_thread/services/AuthService.dart';


class Profile extends StatefulWidget {

	@override
	_ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

	final AuthService _authService = AuthService();

	@override
	Widget build(BuildContext context) {

		// User variable
		final user = Provider.of<User>(context);

		return Center(
			child: Row(
				children: [
					ElevatedButton(
						child: Text('Log out'),
						onPressed: () async {
							await _authService.signOut();
						}
					),
					ElevatedButton(
						child: Text('Preferences'),
						onPressed: () {

						} 
					)
				],
			)
			
		);
	}
}
