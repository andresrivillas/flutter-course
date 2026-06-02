import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repository/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource dataSource;

  LocalStorageRepositoryImpl({required this.dataSource});

  @override
  Future<bool> isFavoriteMovie(int movieId) {
    return dataSource.isFavoriteMovie(movieId);
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({int limit = 10, int offset = 0}) {
    return dataSource.loadFavoriteMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavoriteMovie(Movie movie) {
    return dataSource.toggleFavoriteMovie(movie);
  }
}
