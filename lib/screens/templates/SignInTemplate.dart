import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class SignInTemplate extends CustomPainter {

	@override
	void paint(Canvas canvas, Size size) {

		var width = size.width;
		var height = size.height;

		var paint = Paint();

		// Main background color
		Path mainBackground = Path();

		mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));

		paint.color = Colors.grey.shade100;
		canvas.drawPath(mainBackground, paint);

		// Colors used: 
		Path blueWave = Path();

		blueWave.lineTo(width, 0);
		blueWave.lineTo(width, height * 0.5);
		blueWave.quadraticBezierTo(width * 0.5, height * 0.45, width * 0.2, 0);
		blueWave.close();

		paint.color = Colors.lightBlue.shade300;
		canvas.drawPath(blueWave, paint);

		Path greyWave = Path();

		greyWave.lineTo(width, 0);
		greyWave.lineTo(width, height * 0.1);
		greyWave.cubicTo(width * 0.95, height * 0.15, width * 0.65, height * 0.15, width * 0.6, height * 0.38);
		greyWave.cubicTo(width * 0.52, height * 0.52, width * 0.05, height * 0.45, 0, height * 0.4);
		greyWave.close();

		paint.color = Colors.grey.shade800;
		canvas.drawPath(greyWave, paint);

		Path yellowWave = Path();

		yellowWave.lineTo(width * 0.7, 0);
		yellowWave.cubicTo(width * 0.6, height * 0.05, width * 0.27, height * 0.01, width * 0.18, height * 0.12);
		yellowWave.quadraticBezierTo(width * 0.12, height * 0.2, 0, height * 0.2);
		yellowWave.close();

		paint.color = Colors.orange.shade300;
		canvas.drawPath(yellowWave, paint);
	}

	@override
	bool shouldRepaint(covariant CustomPainter oldDelegate) {
		
		return oldDelegate != this;
	}

}