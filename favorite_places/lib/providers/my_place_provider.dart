import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlacesNotifier extends StateNotifier<List<Place>> {
  FavoritePlacesNotifier() : super(const []);

  /// Return true if successfully added, else return false.
  bool addFavoritePlace(Place favoritePlace) {
    if (!state.contains(favoritePlace)) {
      state = [favoritePlace, ...state];
      // final stateCopy = state.toList();
      // stateCopy.add(favoritePlace);
      // state = stateCopy;
      return true;
    }
    return false;
  }

  /// Return true if something was removed, else return false.
  bool removeFavoritePlace(Place favoritePlace) {
    if (state.contains(favoritePlace)) {
      final stateCopy = state.toList();
      stateCopy.remove(favoritePlace);
      state = stateCopy;
      return true;
    }
    
    return false;
  }
}

final favoritePlacesProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<Place>>((ref) => FavoritePlacesNotifier());
