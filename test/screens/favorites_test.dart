import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites.dart';

Favorites favoritesList;

Widget createFavoritesScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) {
        favoritesList = Favorites();
        return favoritesList;
      },
      child: MaterialApp(home: FavoritesPage()),
    );

void addItems() {
  for (var i = 0; i < 10; i++) {
    favoritesList.add(i);
  }
}

void main() {
  group('Favorites Page Widget Tests', () {
    testWidgets('Test if listView shows up', (tester) async {
      // Pump the favorites screen
      await tester.pumpWidget(createFavoritesScreen());
      // add items
      addItems();
      // wait for pump and settle
      await tester.pumpAndSettle();
      // expect to find one list view
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Remove Button', (tester) async {
      // Pump the favorites screen
      await tester.pumpWidget(createFavoritesScreen());
      // Add items
      addItems();
      // wait for pump and settle
      await tester.pumpAndSettle();
      // Get count of close icons
      var totalItems = favoritesList.items.length;
      // tap close icon
      await tester.tap(find.byIcon(Icons.close).first);
      // wait pump and settle
      await tester.pumpAndSettle();
      // expect count to be less than initial length
      expect(favoritesList.items.length, lessThan(totalItems));
      // Expect snack bar message 'Removed from favorites.'
      expect(find.text('Removed from favorites.'), findsOneWidget);
    });
  });
}
