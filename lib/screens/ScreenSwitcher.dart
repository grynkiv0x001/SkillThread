import 'package:flutter/material.dart';

import 'package:skill_thread/screens/browse/Browse.dart';
import 'package:skill_thread/screens/home/Home.dart';
import 'package:skill_thread/screens/profile/Profile.dart';


class ScreenSwitcher extends StatefulWidget {

	@override
	_ScreenSwitcherState createState() => _ScreenSwitcherState();
}

class _ScreenSwitcherState extends State<ScreenSwitcher> {

	// Current index - means which screen is currently active
	// (0. Home, 1. Browse, 2. Profile)
	int _selectedIndex = 0;

	// Custom widgets for every screen
	static List<Widget> _screens = <Widget>[

		Home(),
		Browse(),
		Profile()
		
	];

	// Custom titles for every screen
	static const List<String> _titles = <String>[
		
		'Home',
		'Browse',
		'Profile'

	];

	// Method which change value of index when corresponding button was tapped
	void _onItemTapped(int index) {

		// Change index value
		setState(() => _selectedIndex = index);
	}

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			backgroundColor: Colors.brown[50],
			appBar: AppBar(
				title: Text('SkillThread | ${_titles.elementAt(_selectedIndex)}'),
				backgroundColor: Colors.brown,
				elevation: 0.0
			),
			body: Container(
				child: _screens.elementAt(_selectedIndex)
			),
			bottomNavigationBar: BottomNavigationBar(
				// type: BottomNavigationBarType.shifting,
				items: <BottomNavigationBarItem>[
					BottomNavigationBarItem(
						// icon: Icon(Icons.home_rounded),
						icon: Container(
							padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
							child: ElevatedButton(
								child: Icon(Icons.home_rounded),
								onPressed: () {},
							)
						),
						label: 'Home'
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.grid_view),
						label: 'Browse'
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.import_contacts_rounded),
						label: 'My profile'
					)
				],
				currentIndex: _selectedIndex,
				onTap: _onItemTapped
			)
		);
	}
}