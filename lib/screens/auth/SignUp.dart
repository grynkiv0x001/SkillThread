import 'package:flutter/material.dart';

import 'package:skill_thread/screens/templates/SignUpTemplate.dart';
import 'package:skill_thread/services/AuthService.dart';


class SignUp extends StatefulWidget {

	final Function toggleView;

	SignUp({this.toggleView});

	@override
	_SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

	final AuthService _authService = AuthService();

	// Global key for registration form
	final _formKey = GlobalKey<FormState>();

	String email = '';
	String password = '';
	String username = '';
	String error = '';

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			resizeToAvoidBottomInset: false,
			body: CustomPaint(
				painter: SignUpTemplate(),
				child: Stack(
					children: <Widget>[
						Positioned(
							top: 35,
							child: TextButton.icon(
								icon: Icon(Icons.schedule),
								label: Text('Temp'),
								onPressed: () async {
									await _authService.signInAnon();
								},
								style: TextButton.styleFrom(
									primary: Colors.white
								)
							)
						),
						Padding(
							padding: const EdgeInsets.symmetric(horizontal: 35),
							child: Column(
								children: <Widget>[
									Expanded(
										flex: 3,
										child: Container(
											alignment: Alignment.bottomLeft,
											child: Text(
												'Create\nAccount',
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
															setState(() => username = value);
														},
														validator: (value) => value.isEmpty ? 'Enter username!' : null,
														decoration: InputDecoration(
															enabledBorder: UnderlineInputBorder(
																borderSide: BorderSide(
																	color: Colors.white
																)
															),
															labelText: 'Username',
															labelStyle: TextStyle(
																color: Colors.white
															),
															focusedBorder: UnderlineInputBorder(
																borderSide: BorderSide(
																	color: Colors.white
																)
															)
														),
														style: TextStyle(
															color: Colors.white
														),
														cursorColor: Colors.white
													),
													TextFormField(
														onChanged: (value) {
															setState(() => email = value);
														},
														validator: (value) => value.isEmpty ? 'Enter email!' : null,
														decoration: InputDecoration(
															enabledBorder: UnderlineInputBorder(
																borderSide: BorderSide(
																	color: Colors.white
																)
															),
															labelText: 'Email',
															labelStyle: TextStyle(
																color: Colors.white
															),
															focusedBorder: UnderlineInputBorder(
																borderSide: BorderSide(
																	color: Colors.white
																)
															)
														),
														style: TextStyle(
															color: Colors.white
														),
														cursorColor: Colors.white
													),
													SizedBox(
														height: 15,
													),
													TextFormField(
														obscureText: true,
														onChanged: (value) {
															setState(() => password = value);
														},
														validator: (value) => value.isEmpty ? 'Password must be at least 6 characters!' : null,
														decoration: InputDecoration(
															enabledBorder: UnderlineInputBorder(
																borderSide: BorderSide(
																	color: Colors.white
																)
															),
															labelText: 'Password',
															labelStyle: TextStyle(
																color: Colors.white
															),
															focusedBorder: UnderlineInputBorder(
																borderSide: BorderSide(
																	color: Colors.white
																)
															)
														),
														style: TextStyle(
															color: Colors.white
														)
													),
													SizedBox(
														height: 25.0
													),
													Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: <Widget>[
															Text(
																'Start SkillThread',
																style: TextStyle(
																	color: Colors.white,
																	fontSize: 25,
																	fontWeight: FontWeight.w500
																)
															),
															ElevatedButton(
																onPressed: () async {
																	if (_formKey.currentState.validate()) {

																		dynamic result = await _authService.emailPasswordSignUp(email, password, username);

																		if (result == null)
																			setState(() => error = 'Enter valid data');
																	}
																},
																child: CircleAvatar(
																	backgroundColor: Colors.grey.shade800,
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
														'Sign in',
														style: TextStyle(
															color: Colors.white,
															fontSize: 15,
															fontWeight: FontWeight.w500,
															decoration: TextDecoration.underline
														)
													)
												),
												Text(
													'What is SkillThread?',
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