import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class SignUpTemplate extends CustomPainter {

	@override
	void paint(Canvas canvas, Size size) {

		var width = size.width;
		var height = size.height;
		var paint = Paint();

		Path mainBackground = Path();
		mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
		paint.color = Colors.grey.shade100;
		canvas.drawPath(mainBackground, paint);

		Path blueWave = Path();
		blueWave.lineTo(width, 0);
		blueWave.lineTo(width, height * 0.65);
		blueWave.cubicTo(width * 0.8, height * 0.8, width * 0.55, height * 0.8, width * 0.45, height);
		blueWave.lineTo(0, height);
		blueWave.close();
		paint.color = Colors.lightBlue.shade300;
		canvas.drawPath(blueWave, paint);

		Path greyWave = Path();
		greyWave.lineTo(width, 0);
		greyWave.lineTo(width, height * 0.3);
		greyWave.cubicTo(width * 0.65, height * 0.45, width * 0.25, height * 0.35, 0, height * 0.5);
		greyWave.close();
		paint.color = Colors.grey.shade800;
		canvas.drawPath(greyWave, paint);
	}

	@override
	bool shouldRepaint(covariant CustomPainter oldDelegate) {
		
		return oldDelegate != this;
	}

}