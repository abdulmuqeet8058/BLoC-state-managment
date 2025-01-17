import 'package:bloc_stmgt/bloc/posts/post_bloc.dart';
import 'package:bloc_stmgt/bloc/posts/posts_events.dart';
import 'package:bloc_stmgt/bloc/posts/posts_state.dart';
import 'package:bloc_stmgt/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostsFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts "),
      ),
      body: BlocBuilder<PostBloc, PostsStates>(
        builder: (context, state) {
          switch (state.poststatus) {
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.failure:
              return Center(child: Text(state.message.toString()));
            case PostStatus.success:
              return Column(
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Search with email',
                          border: OutlineInputBorder()),
                      onChanged: (filterkey) {
                        context.read<PostBloc>().add(SearchItem(filterkey));
                      }),
                  Expanded(
                    child: state.searchMessage.isNotEmpty
                        ? Center(
                            child: Text(state.searchMessage.toString()),
                          )
                        : ListView.builder(
                            itemCount: state.tempList.isEmpty
                                ? state.postList.length
                                : state.tempList.length,
                            itemBuilder: (context, index) {
                              if (state.tempList.isNotEmpty) {
                                final item = state.tempList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item.email.toString()),
                                    subtitle: Text(item.body.toString()),
                                  ),
                                );
                              } else {
                                final item = state.postList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item.email.toString()),
                                    subtitle: Text(item.body.toString()),
                                  ),
                                );
                              }
                            },
                          ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
