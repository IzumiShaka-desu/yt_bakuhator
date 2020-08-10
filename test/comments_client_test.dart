import 'package:test/test.dart';
import 'package:yt_bakuhator/yt_bakuhator.dart';

void main() {
  group('Comments', () {
    YoutubeExplode yt;
    setUp(() {
      yt = YoutubeExplode();
    });

    tearDown(() {
      yt.close();
    });

    test('GetCommentOfVideo', () async {
      var videoUrl = 'https://www.youtube.com/watch?v=AI7ULzgf8RU';
      var video = await yt.videos.get(VideoId(videoUrl));
      var comments = await yt.videos.commentsClient.getComments(video).toList();
      expect(comments.length, greaterThanOrEqualTo(1));
    }, skip: 'This may fail on some environments');
  });
}
