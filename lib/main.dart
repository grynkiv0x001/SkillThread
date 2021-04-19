import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skill_thread/models/User.dart';
import 'package:skill_thread/screens/Wrapper.dart';
import 'package:skill_thread/services/AuthService.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		
		return StreamProvider<User>.value(
			initialData: null,
			value: AuthService().user,
			child: MaterialApp(
				debugShowCheckedModeBanner: false,
				home: Wrapper()
			)
		);
	}
}