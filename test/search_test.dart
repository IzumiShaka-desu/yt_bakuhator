import 'package:test/test.dart';
import 'package:yt_bakuhator/yt_bakuhator.dart';

void main() {
  group('Search', () {
    YoutubeExplode yt;
    setUp(() {
      yt = YoutubeExplode();
    });

    tearDown(() {
      yt.close();
    });

    test('SearchYouTubeVideosFromApi', () async {
      var videos = await yt.search
          .getVideosAsync('undead corporation megalomania')
          .toList();
      expect(videos, isNotEmpty);
    });

    
    test('SearchYouTubeVideosFromPage', () async {
      var searchQuery = await yt.search.queryFromPage('hello');
      expect(searchQuery.content, isNotEmpty);
      expect(searchQuery.relatedVideos, isNotEmpty);
      expect(searchQuery.relatedQueries, isNotEmpty);
    }, skip: 'This may fail on some environments');

    test('SearchNoResults', () async {
      var query =
          await yt.search.queryFromPage('g;jghEOGHJeguEPOUIhjegoUEHGOGHPSASG');
      expect(query.content, isEmpty);
      expect(query.relatedQueries, isEmpty);
      expect(query.relatedVideos, isEmpty);
      var nextPage = await query.nextPage();
      expect(nextPage, isNull);
    });
  });
}
