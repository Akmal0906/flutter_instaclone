part of 'content_bloc.dart';

abstract class ContentEvent extends Equatable {
  const ContentEvent();
}
class AddPostEvent extends ContentEvent{
  final Post post;
  const AddPostEvent(this.post);

  @override
  List<Object?> get props =>[post];
}

class GetPosts extends ContentEvent{
  @override
  List<Object?> get props => [];
}
