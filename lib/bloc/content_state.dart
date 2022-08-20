part of 'content_bloc.dart';

class ContentState extends Equatable {
  final List<Post> posts;
  final GetPostStatus status;

  const ContentState({required this.posts, required this.status});

  ContentState copyWith({List<Post>? posts, GetPostStatus? status}) =>
      ContentState(
        posts: posts ?? this.posts,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
    posts,
    status,
  ];
}

enum GetPostStatus {
  in_progress,
  success,
  failure,
  initial,
}
