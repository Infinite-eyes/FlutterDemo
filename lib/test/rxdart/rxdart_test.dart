import 'package:rxdart/rxdart.dart';

main() {
//  v1

//  Observable.just(1).listen(print);

//  v2

//  var observable = Observable.just(1);
//
//  var observa = (int num) {
//    print(num);
//  };
//
//  observable.listen(observa);

//   v3

//  Observable(Stream.fromIterable([1, 2, 3, 4, 5])).listen(print);

// v4

//  Observable.periodic(Duration(seconds:  1),(x)=> x.toString()).listen(print);

// v5

//  Observable.periodic(Duration(seconds: 1), (x) => x.toString())
//      .listen((print));
//
//  Future<String> asyncFunction() async {
//    return Future.delayed(const Duration(seconds: 10), () => "十秒后的数据");
//  }
//
//  Observable.fromFuture(asyncFunction()).listen(print);

// v6

//  Observable(Stream.fromIterable([1, 2, 3, 4, 5]))
//      .where((num) => num % 2 == 0)//过滤条件
//      .listen(print);

// v7

//Observable(Stream.fromIterable([1,2,3,4,5]))
//    .skip(3)// 跳过前三项
//    .listen(print);

// v8 take
//Observable(Stream.fromIterable([1, 2, 3, 4, 5]))
//    .take(2)  //拿前两项
//    .listen(print);

// v9 take
//Observable(Stream.fromIterable([1, 2, 2, 2, 3, 3, 4, 5]))
//    .distinctUnique()//过掉重复项
//    .listen(print);

//v10

//  Observable(Stream.fromIterable([1, 2, 2, 2, 3, 3, 4, 5]))
//      .map((num) => num * 2)//数据转换
//      .listen(print);

//v11
//  var list1 = [1, 2, 3];
//  var list2 = [4, 5, 6];
//  var list3 = [7, 8, 9];
//  var listAll = [list1, list2, list3];

//  Observable(Stream.fromIterable(listAll)).flatMap((listItem) {
//    return Observable(Stream.fromIterable(listItem));
//  }).listen(print);

//  Observable(Stream.fromIterable(listAll)).flatMap((listItem) {
//    return  Observable(Stream.fromIterable(listItem));
//  }).listen(print);

//  var observable = Observable(Stream.fromIterable(listAll)).flatMap((listItem) {
//    return Observable(Stream.fromIterable(listItem));
//  });
//
//  var observa = (int num) {
//    print(num);
//  };
//  observable.listen(observa);

//v12

//  var list1 = [1, 2, 3];
//  var list2 = [4, 5, 6];
//  var list3 = [7, 8, 9];
//  var listAll = [list1, list2, list3];
//  var changeConcatMap = (List<int> listItem) {
//    print("concatMap开始变换了");
//    return Observable(Stream.fromIterable(listItem));
//  };

//  var changeFlatMap = (List<int> listItem) {
//    print("FlatMap 开始变换了");
//    return Observable(Stream.fromIterable(listItem));
//  };

//  Observable(Stream.fromIterable(listAll))
//      .concatMap((listItem) => changeConcatMap(listItem))
//      .listen(print);

//  Observable(Stream.fromIterable(listAll))
//      .flatMap((listItem) => changeFlatMap(listItem))
//      .listen(print);

//v13

//var observable = Observable(Stream.fromIterable([1,2,3,4,5]));
//
//observable.startWith(9).listen(print);

//v14
//  Observable.merge([
////    Stream.fromIterable([1, 2]),
////    Stream.fromIterable([3, 4])
////  ]).listen(print);
////}

//v15

//  var observable1 = Observable.just(1);
//  var observable2 = Observable.just(2);
//
//  Observable.combineLatest2(observable1, observable2, (a, b) => a + b)
//      .listen(print);

//  Observable.combineLatest2(
//      new Observable.just(1),
//      new Observable.fromIterable([0, 1, 2]),
//      (a, b) => a + b).listen(print); //prints 1, 2, 3

//^
//  var observable1 = Observable.just(1);
//  var observable2 = Observable.just(2);
//  Observable.combineLatest([observable1, observable2], (num) => num)
//      .listen(print);

//v16

//var observable1 = Observable.just(1);
//var observable2 = Observable.just(5);
//
//var observable = Observable(Stream.fromIterable([1,2,3,4,5]));
//
//observable.mergeWith([observable2,observable1])
//.listen(print);

//v17

//  PublishSubject subject1 = new PublishSubject<int>();
////  subject1.add(2);
////  subject1.add(1);
//
//  subject1.stream.listen((data) {
//    print("listen1 " + data.toString());
//  });
////  subject1.add(5);
//  subject1.stream.listen((data) {
//    print("listen2 " + data.toString());
//  });
//
//  subject1.add(2);
//  subject1.add(1);

//v18  https://www.jianshu.com/p/0467213c2615
//  BehaviorSubject behaviorSubject = new BehaviorSubject();
//  behaviorSubject.add(1);
//
//  behaviorSubject.stream.listen((data) {
//    print("listen1 " + data.toString());
//  });
//
//  behaviorSubject.add(2);
//
//  behaviorSubject.stream.listen((data){
//    print('listen2 ' + data.toString());
//  });

//v19
  ReplaySubject replaySubject = new ReplaySubject<String>(maxSize: 1);
  replaySubject.add("1");
  replaySubject.stream.listen((data){
    print("listen1 " + data);
  });

  replaySubject.add("2");
  replaySubject.add("3");
  replaySubject.stream.listen((data){
    print("listen2 " + data);
  });


}
