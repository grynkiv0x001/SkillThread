import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:skill_thread/models/Article.dart';


class DatabaseService {

	final String uid;

	DatabaseService({this.uid});

	// Collections refence
	// final CollectionReference articleCollection = Firestore.instance.collection('articles');

	// User properties: name, tutorials finished, liked, read-history, favorite thread(-s)
	final CollectionReference userCollection = Firestore.instance.collection('users');

	Future updateUserData(String name, List<Article> likedArticles, List<Article> recentArticles, String favorite) async {

		return await userCollection.document(uid).setData({

			'name': name,
			'liked': likedArticles,
			'recent': recentArticles,
			'favoriteThread': favorite

		});
	}

	// Sample of getting telegraph page
	// https://api.telegra.ph/getPage/Test-article-04-08-3?return_content=true
}