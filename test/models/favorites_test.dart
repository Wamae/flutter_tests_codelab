import 'package:test/test.dart';
import 'package:testing_app/models/favorites.dart';

void main() {
  group('App Provider Tests', () {
    var favorites = Favorites();

    test('A new item should be added', () {
      var itemNum = 35;
      favorites.add(itemNum);
      expect(favorites.items.contains(itemNum), true);
    });

    test('An item should be removed', () {
      var itemNum = 45;
      favorites.add(itemNum);
      expect(favorites.items.contains(itemNum), true);
      favorites.remove(itemNum);
      expect(favorites.items.contains(itemNum), false);
    });
  });
}
