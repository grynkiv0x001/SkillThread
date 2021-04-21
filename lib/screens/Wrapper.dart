import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skill_thread/models/User.dart';
import 'package:skill_thread/screens/home/Home.dart';
import 'package:skill_thread/screens/auth/Authenticate.dart';

// The ScreenSwitcher was used for bottom navigation (triple-screen model). Right now - no longer useful
// import 'package:skill_thread/screens/ScreenSwitcher.dart';


class Wrapper extends StatelessWidget {

	@override
	Widget build(BuildContext context) {

		final user = Provider.of<User>(context);

		// return Home or Auth widget depend on is user logged or not
		if (user == null)
			return Authenticate();
		else
			return Home();
	}
}