import 'package:flutter/material.dart';

import 'package:skill_thread/screens/templates/SignInTemplate.dart';
import 'package:skill_thread/services/AuthService.dart';


class SignIn extends StatefulWidget {

	final Function toggleView;

	SignIn({this.toggleView});

	@override
	_SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

	final AuthService _authService = AuthService();

	final _formKey = GlobalKey<FormState>();

	// State of data in fields of form
	String email = '';
	String password = '';
	String error = '';

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			resizeToAvoidBottomInset: false,
			body: CustomPaint(
				painter: SignInTemplate(),
				child: Stack(
					children: <Widget>[
						Padding(
							padding: const EdgeInsets.symmetric(horizontal: 35),
							child: Column(
								children: <Widget>[
									Expanded(
										flex: 3,
										child: Container(
											alignment: Alignment.bottomLeft,
											child: Text(
												'Welcome\nBack',
												style: TextStyle(color: Colors.white, fontSize: 40)
											)
										)
									),
									Expanded(
										flex: 4,
										child: Form(
											key: _formKey,
											child: Column(
												mainAxisAlignment: MainAxisAlignment.end,
												children: <Widget>[
													SizedBox(
														height: 15
													),
													TextFormField(
														onChanged: (value) {
															setState(() => email = value);
														},
														validator: (value) => value.isEmpty ? 'Field must be not empty!' : null,
														decoration: InputDecoration(labelText: 'Email')
													),
													SizedBox(
														height: 15,
													),
													TextFormField(
														obscureText: true,
														onChanged: (value) {
															setState(() => password = value);
														},
														validator: (value) => value.isEmpty ? 'Field must be not empty!' : null,
														decoration: InputDecoration(labelText: 'Password'),
													),
													SizedBox(
														height: 25.0
													),
													Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: <Widget>[
															Text(
																'Enter SkillThread',
																style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)
															),
															ElevatedButton(
																onPressed: () async {
																	if (_formKey.currentState.validate()) {

																		dynamic result = await _authService.emailPasswordSignIn(email, password);

																		if (result == null)
																			setState(() => error = 'Wrong credentials were entered!');
																	}
																},
																child: CircleAvatar(
																	backgroundColor: Colors.orange.shade300,
																	radius: 40,
																	child: Icon(
																		Icons.arrow_forward,
																		color: Colors.white
																	)
																),
																style: ButtonStyle(
																	backgroundColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
																	shadowColor: MaterialStateColor.resolveWith((states) => Colors.transparent)
																),
															)
														]
													)
												]
											)
										)
									),
									Expanded(
										flex: 1,
										child: Row(
											mainAxisAlignment: MainAxisAlignment.spaceBetween,
											children: <Widget>[
												GestureDetector(
													onTap: () {
														widget.toggleView();
													},
													child: Text(
														'Sign up',
														style: TextStyle(
															fontSize: 15,
															fontWeight: FontWeight.w500,
															decoration: TextDecoration.underline
														)
													)
												),
												Text(
													'Forgot Password',
													style: TextStyle(
														fontSize: 15,
														fontWeight: FontWeight.w500,
														decoration: TextDecoration.underline
													)
												)
											]
										)
									)
								]
							)
						),
					],
				)
			)
		);
	}
}