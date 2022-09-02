import 'package:tmdb_api/tmdb_api.dart';

//
class ApiData {
  static List temp = [];
  static TMDB tmdbLogs = TMDB(
      ApiKeys('c9a9c78c3548e54aed57fe90fadf4312',
          'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjOWE5Yzc4YzM1NDhlNTRhZWQ1N2ZlOTBmYWRmNDMxMiIsInN1YiI6IjYzMTE3YmY1YTJlNjAyMDA5MThlNjUzNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.c7NfW31HrY6ZS6fKKmgm6RkozCV5ArEaGX0k8VZqHdQ'),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
}
