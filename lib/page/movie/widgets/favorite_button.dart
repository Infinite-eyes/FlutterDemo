import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/bloc/bloc_provider.dart';
import 'package:flutterapp/bloc/favorite_bloc.dart';

class FavoriteButton extends StatelessWidget {
  FavoriteButton({
    Key key,
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final FavoriteBloc bloc = BlocProvider.of<FavoriteBloc>(context);

    return RaisedButton(
      onPressed: () {},
      child: Stack(
        overflow: Overflow.visible,
        children: [
          child,
          Positioned(
            top: -12.0,
            right: -6.0,
            child: Material(
              type: MaterialType.circle,
              elevation: 5.0,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: StreamBuilder<int>(
                  stream: bloc.outTotalFavorites,
                  initialData: 0,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    return Text(
                      snapshot.data.toString(),
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
//    final FavoriteButton
    throw UnimplementedError();
  }
}
