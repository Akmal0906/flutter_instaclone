
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/post_model.dart';

part 'content_event.dart';

part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc()
      : super(const ContentState(posts: [], status: GetPostStatus.initial)) {
    on<GetPosts>((event, emit) {
      String post_im1 =
          'https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost.png?alt=media&token=f0b1ba56-4bf4-4df2-9f43-6b8665cdc964';
      String post_im2 =
          'https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost2.png?alt=media&token=ac0c131a-4e9e-40c0-a75a-88e586b28b72';

      emit(
        state.copyWith(
          posts: [
            Post(postImage: post_im1, postCaption: 'This is post caption'),
            Post(
              postImage: post_im2,
              postCaption: 'This is post caption',
            ),
          ],
        ),
      );
    });
    on<AddPostEvent>((event, emit) {
      emit(state.copyWith(posts: [event.post, ...state.posts]));
    });
  }
}