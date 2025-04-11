import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/post.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.loading() = _Loading;
  const factory PostState.data(List<Post> posts) = _Data;
  const factory PostState.error(String message) = _Error;
}
