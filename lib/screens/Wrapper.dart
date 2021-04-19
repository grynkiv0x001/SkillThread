import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:skill_thread/models/User.dart';
import 'package:skill_thread/screens/ScreenSwitcher.dart';
import 'package:skill_thread/screens/auth/Authenticate.dart';


class Wrapper extends StatelessWidget {

	@override
	Widget build(BuildContext context) {

		final user = Provider.of<User>(context);

		// return Home or Auth widget depend on is user logged or not
		if (user == null)
			return Authenticate();
		else
			return ScreenSwitcher();
	}
}