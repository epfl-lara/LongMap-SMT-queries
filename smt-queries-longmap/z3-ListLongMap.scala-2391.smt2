; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37816 () Bool)

(assert start!37816)

(declare-fun b_free!8911 () Bool)

(declare-fun b_next!8911 () Bool)

(assert (=> start!37816 (= b_free!8911 (not b_next!8911))))

(declare-fun tp!31487 () Bool)

(declare-fun b_and!16139 () Bool)

(assert (=> start!37816 (= tp!31487 b_and!16139)))

(declare-fun b!388412 () Bool)

(declare-fun e!235334 () Bool)

(declare-fun e!235339 () Bool)

(assert (=> b!388412 (= e!235334 e!235339)))

(declare-fun res!222145 () Bool)

(assert (=> b!388412 (=> (not res!222145) (not e!235339))))

(declare-datatypes ((array!23047 0))(
  ( (array!23048 (arr!10991 (Array (_ BitVec 32) (_ BitVec 64))) (size!11344 (_ BitVec 32))) )
))
(declare-fun lt!182310 () array!23047)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23047 (_ BitVec 32)) Bool)

(assert (=> b!388412 (= res!222145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182310 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23047)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388412 (= lt!182310 (array!23048 (store (arr!10991 _keys!658) i!548 k0!778) (size!11344 _keys!658)))))

(declare-fun b!388413 () Bool)

(declare-fun res!222142 () Bool)

(assert (=> b!388413 (=> (not res!222142) (not e!235334))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13883 0))(
  ( (V!13884 (val!4836 Int)) )
))
(declare-datatypes ((ValueCell!4448 0))(
  ( (ValueCellFull!4448 (v!7031 V!13883)) (EmptyCell!4448) )
))
(declare-datatypes ((array!23049 0))(
  ( (array!23050 (arr!10992 (Array (_ BitVec 32) ValueCell!4448)) (size!11345 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23049)

(assert (=> b!388413 (= res!222142 (and (= (size!11345 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11344 _keys!658) (size!11345 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!6478 0))(
  ( (tuple2!6479 (_1!3250 (_ BitVec 64)) (_2!3250 V!13883)) )
))
(declare-datatypes ((List!6323 0))(
  ( (Nil!6320) (Cons!6319 (h!7175 tuple2!6478) (t!11466 List!6323)) )
))
(declare-datatypes ((ListLongMap!5381 0))(
  ( (ListLongMap!5382 (toList!2706 List!6323)) )
))
(declare-fun lt!182309 () ListLongMap!5381)

(declare-fun lt!182311 () ListLongMap!5381)

(declare-fun e!235333 () Bool)

(declare-fun lt!182307 () tuple2!6478)

(declare-fun b!388414 () Bool)

(declare-fun lt!182313 () tuple2!6478)

(declare-fun +!1026 (ListLongMap!5381 tuple2!6478) ListLongMap!5381)

(assert (=> b!388414 (= e!235333 (= lt!182309 (+!1026 (+!1026 lt!182311 lt!182307) lt!182313)))))

(declare-fun lt!182308 () ListLongMap!5381)

(declare-fun lt!182306 () ListLongMap!5381)

(assert (=> b!388414 (= lt!182308 (+!1026 (+!1026 lt!182306 lt!182307) lt!182313))))

(declare-fun minValue!472 () V!13883)

(assert (=> b!388414 (= lt!182313 (tuple2!6479 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun zeroValue!472 () V!13883)

(assert (=> b!388414 (= lt!182307 (tuple2!6479 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!388415 () Bool)

(declare-fun res!222140 () Bool)

(assert (=> b!388415 (=> (not res!222140) (not e!235334))))

(assert (=> b!388415 (= res!222140 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11344 _keys!658))))))

(declare-fun b!388416 () Bool)

(declare-fun res!222143 () Bool)

(assert (=> b!388416 (=> (not res!222143) (not e!235334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388416 (= res!222143 (validKeyInArray!0 k0!778))))

(declare-fun b!388418 () Bool)

(assert (=> b!388418 (= e!235339 (not e!235333))))

(declare-fun res!222146 () Bool)

(assert (=> b!388418 (=> res!222146 e!235333)))

(assert (=> b!388418 (= res!222146 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2036 (array!23047 array!23049 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) Int) ListLongMap!5381)

(assert (=> b!388418 (= lt!182309 (getCurrentListMap!2036 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182314 () array!23049)

(assert (=> b!388418 (= lt!182308 (getCurrentListMap!2036 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182312 () ListLongMap!5381)

(assert (=> b!388418 (and (= lt!182306 lt!182312) (= lt!182312 lt!182306))))

(declare-fun v!373 () V!13883)

(assert (=> b!388418 (= lt!182312 (+!1026 lt!182311 (tuple2!6479 k0!778 v!373)))))

(declare-datatypes ((Unit!11896 0))(
  ( (Unit!11897) )
))
(declare-fun lt!182305 () Unit!11896)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!237 (array!23047 array!23049 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) (_ BitVec 64) V!13883 (_ BitVec 32) Int) Unit!11896)

(assert (=> b!388418 (= lt!182305 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!237 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!946 (array!23047 array!23049 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) Int) ListLongMap!5381)

(assert (=> b!388418 (= lt!182306 (getCurrentListMapNoExtraKeys!946 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388418 (= lt!182314 (array!23050 (store (arr!10992 _values!506) i!548 (ValueCellFull!4448 v!373)) (size!11345 _values!506)))))

(assert (=> b!388418 (= lt!182311 (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388419 () Bool)

(declare-fun e!235337 () Bool)

(declare-fun tp_is_empty!9583 () Bool)

(assert (=> b!388419 (= e!235337 tp_is_empty!9583)))

(declare-fun b!388420 () Bool)

(declare-fun e!235338 () Bool)

(declare-fun mapRes!15942 () Bool)

(assert (=> b!388420 (= e!235338 (and e!235337 mapRes!15942))))

(declare-fun condMapEmpty!15942 () Bool)

(declare-fun mapDefault!15942 () ValueCell!4448)

(assert (=> b!388420 (= condMapEmpty!15942 (= (arr!10992 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4448)) mapDefault!15942)))))

(declare-fun mapIsEmpty!15942 () Bool)

(assert (=> mapIsEmpty!15942 mapRes!15942))

(declare-fun b!388421 () Bool)

(declare-fun e!235335 () Bool)

(assert (=> b!388421 (= e!235335 tp_is_empty!9583)))

(declare-fun mapNonEmpty!15942 () Bool)

(declare-fun tp!31488 () Bool)

(assert (=> mapNonEmpty!15942 (= mapRes!15942 (and tp!31488 e!235335))))

(declare-fun mapRest!15942 () (Array (_ BitVec 32) ValueCell!4448))

(declare-fun mapValue!15942 () ValueCell!4448)

(declare-fun mapKey!15942 () (_ BitVec 32))

(assert (=> mapNonEmpty!15942 (= (arr!10992 _values!506) (store mapRest!15942 mapKey!15942 mapValue!15942))))

(declare-fun b!388422 () Bool)

(declare-fun res!222141 () Bool)

(assert (=> b!388422 (=> (not res!222141) (not e!235334))))

(declare-datatypes ((List!6324 0))(
  ( (Nil!6321) (Cons!6320 (h!7176 (_ BitVec 64)) (t!11467 List!6324)) )
))
(declare-fun arrayNoDuplicates!0 (array!23047 (_ BitVec 32) List!6324) Bool)

(assert (=> b!388422 (= res!222141 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6321))))

(declare-fun b!388423 () Bool)

(declare-fun res!222147 () Bool)

(assert (=> b!388423 (=> (not res!222147) (not e!235339))))

(assert (=> b!388423 (= res!222147 (arrayNoDuplicates!0 lt!182310 #b00000000000000000000000000000000 Nil!6321))))

(declare-fun res!222149 () Bool)

(assert (=> start!37816 (=> (not res!222149) (not e!235334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37816 (= res!222149 (validMask!0 mask!970))))

(assert (=> start!37816 e!235334))

(declare-fun array_inv!8080 (array!23049) Bool)

(assert (=> start!37816 (and (array_inv!8080 _values!506) e!235338)))

(assert (=> start!37816 tp!31487))

(assert (=> start!37816 true))

(assert (=> start!37816 tp_is_empty!9583))

(declare-fun array_inv!8081 (array!23047) Bool)

(assert (=> start!37816 (array_inv!8081 _keys!658)))

(declare-fun b!388417 () Bool)

(declare-fun res!222144 () Bool)

(assert (=> b!388417 (=> (not res!222144) (not e!235334))))

(declare-fun arrayContainsKey!0 (array!23047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388417 (= res!222144 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388424 () Bool)

(declare-fun res!222150 () Bool)

(assert (=> b!388424 (=> (not res!222150) (not e!235334))))

(assert (=> b!388424 (= res!222150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388425 () Bool)

(declare-fun res!222148 () Bool)

(assert (=> b!388425 (=> (not res!222148) (not e!235334))))

(assert (=> b!388425 (= res!222148 (or (= (select (arr!10991 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10991 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37816 res!222149) b!388413))

(assert (= (and b!388413 res!222142) b!388424))

(assert (= (and b!388424 res!222150) b!388422))

(assert (= (and b!388422 res!222141) b!388415))

(assert (= (and b!388415 res!222140) b!388416))

(assert (= (and b!388416 res!222143) b!388425))

(assert (= (and b!388425 res!222148) b!388417))

(assert (= (and b!388417 res!222144) b!388412))

(assert (= (and b!388412 res!222145) b!388423))

(assert (= (and b!388423 res!222147) b!388418))

(assert (= (and b!388418 (not res!222146)) b!388414))

(assert (= (and b!388420 condMapEmpty!15942) mapIsEmpty!15942))

(assert (= (and b!388420 (not condMapEmpty!15942)) mapNonEmpty!15942))

(get-info :version)

(assert (= (and mapNonEmpty!15942 ((_ is ValueCellFull!4448) mapValue!15942)) b!388421))

(assert (= (and b!388420 ((_ is ValueCellFull!4448) mapDefault!15942)) b!388419))

(assert (= start!37816 b!388420))

(declare-fun m!383913 () Bool)

(assert (=> b!388414 m!383913))

(assert (=> b!388414 m!383913))

(declare-fun m!383915 () Bool)

(assert (=> b!388414 m!383915))

(declare-fun m!383917 () Bool)

(assert (=> b!388414 m!383917))

(assert (=> b!388414 m!383917))

(declare-fun m!383919 () Bool)

(assert (=> b!388414 m!383919))

(declare-fun m!383921 () Bool)

(assert (=> b!388416 m!383921))

(declare-fun m!383923 () Bool)

(assert (=> b!388417 m!383923))

(declare-fun m!383925 () Bool)

(assert (=> b!388424 m!383925))

(declare-fun m!383927 () Bool)

(assert (=> b!388412 m!383927))

(declare-fun m!383929 () Bool)

(assert (=> b!388412 m!383929))

(declare-fun m!383931 () Bool)

(assert (=> b!388425 m!383931))

(declare-fun m!383933 () Bool)

(assert (=> start!37816 m!383933))

(declare-fun m!383935 () Bool)

(assert (=> start!37816 m!383935))

(declare-fun m!383937 () Bool)

(assert (=> start!37816 m!383937))

(declare-fun m!383939 () Bool)

(assert (=> b!388423 m!383939))

(declare-fun m!383941 () Bool)

(assert (=> mapNonEmpty!15942 m!383941))

(declare-fun m!383943 () Bool)

(assert (=> b!388418 m!383943))

(declare-fun m!383945 () Bool)

(assert (=> b!388418 m!383945))

(declare-fun m!383947 () Bool)

(assert (=> b!388418 m!383947))

(declare-fun m!383949 () Bool)

(assert (=> b!388418 m!383949))

(declare-fun m!383951 () Bool)

(assert (=> b!388418 m!383951))

(declare-fun m!383953 () Bool)

(assert (=> b!388418 m!383953))

(declare-fun m!383955 () Bool)

(assert (=> b!388418 m!383955))

(declare-fun m!383957 () Bool)

(assert (=> b!388422 m!383957))

(check-sat (not b!388416) (not mapNonEmpty!15942) (not b!388414) (not b!388422) (not b!388417) (not b!388423) (not b!388424) tp_is_empty!9583 b_and!16139 (not b!388412) (not b!388418) (not b_next!8911) (not start!37816))
(check-sat b_and!16139 (not b_next!8911))
(get-model)

(declare-fun b!388518 () Bool)

(declare-fun e!235388 () Bool)

(declare-fun call!27332 () Bool)

(assert (=> b!388518 (= e!235388 call!27332)))

(declare-fun bm!27329 () Bool)

(assert (=> bm!27329 (= call!27332 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!182310 mask!970))))

(declare-fun d!72631 () Bool)

(declare-fun res!222221 () Bool)

(declare-fun e!235390 () Bool)

(assert (=> d!72631 (=> res!222221 e!235390)))

(assert (=> d!72631 (= res!222221 (bvsge #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(assert (=> d!72631 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182310 mask!970) e!235390)))

(declare-fun b!388519 () Bool)

(declare-fun e!235389 () Bool)

(assert (=> b!388519 (= e!235388 e!235389)))

(declare-fun lt!182383 () (_ BitVec 64))

(assert (=> b!388519 (= lt!182383 (select (arr!10991 lt!182310) #b00000000000000000000000000000000))))

(declare-fun lt!182382 () Unit!11896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23047 (_ BitVec 64) (_ BitVec 32)) Unit!11896)

(assert (=> b!388519 (= lt!182382 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!182310 lt!182383 #b00000000000000000000000000000000))))

(assert (=> b!388519 (arrayContainsKey!0 lt!182310 lt!182383 #b00000000000000000000000000000000)))

(declare-fun lt!182381 () Unit!11896)

(assert (=> b!388519 (= lt!182381 lt!182382)))

(declare-fun res!222222 () Bool)

(declare-datatypes ((SeekEntryResult!3504 0))(
  ( (MissingZero!3504 (index!16195 (_ BitVec 32))) (Found!3504 (index!16196 (_ BitVec 32))) (Intermediate!3504 (undefined!4316 Bool) (index!16197 (_ BitVec 32)) (x!38191 (_ BitVec 32))) (Undefined!3504) (MissingVacant!3504 (index!16198 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23047 (_ BitVec 32)) SeekEntryResult!3504)

(assert (=> b!388519 (= res!222222 (= (seekEntryOrOpen!0 (select (arr!10991 lt!182310) #b00000000000000000000000000000000) lt!182310 mask!970) (Found!3504 #b00000000000000000000000000000000)))))

(assert (=> b!388519 (=> (not res!222222) (not e!235389))))

(declare-fun b!388520 () Bool)

(assert (=> b!388520 (= e!235390 e!235388)))

(declare-fun c!53907 () Bool)

(assert (=> b!388520 (= c!53907 (validKeyInArray!0 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)))))

(declare-fun b!388521 () Bool)

(assert (=> b!388521 (= e!235389 call!27332)))

(assert (= (and d!72631 (not res!222221)) b!388520))

(assert (= (and b!388520 c!53907) b!388519))

(assert (= (and b!388520 (not c!53907)) b!388518))

(assert (= (and b!388519 res!222222) b!388521))

(assert (= (or b!388521 b!388518) bm!27329))

(declare-fun m!384051 () Bool)

(assert (=> bm!27329 m!384051))

(declare-fun m!384053 () Bool)

(assert (=> b!388519 m!384053))

(declare-fun m!384055 () Bool)

(assert (=> b!388519 m!384055))

(declare-fun m!384057 () Bool)

(assert (=> b!388519 m!384057))

(assert (=> b!388519 m!384053))

(declare-fun m!384059 () Bool)

(assert (=> b!388519 m!384059))

(assert (=> b!388520 m!384053))

(assert (=> b!388520 m!384053))

(declare-fun m!384061 () Bool)

(assert (=> b!388520 m!384061))

(assert (=> b!388412 d!72631))

(declare-fun d!72633 () Bool)

(declare-fun res!222227 () Bool)

(declare-fun e!235395 () Bool)

(assert (=> d!72633 (=> res!222227 e!235395)))

(assert (=> d!72633 (= res!222227 (= (select (arr!10991 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72633 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!235395)))

(declare-fun b!388526 () Bool)

(declare-fun e!235396 () Bool)

(assert (=> b!388526 (= e!235395 e!235396)))

(declare-fun res!222228 () Bool)

(assert (=> b!388526 (=> (not res!222228) (not e!235396))))

(assert (=> b!388526 (= res!222228 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11344 _keys!658)))))

(declare-fun b!388527 () Bool)

(assert (=> b!388527 (= e!235396 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72633 (not res!222227)) b!388526))

(assert (= (and b!388526 res!222228) b!388527))

(declare-fun m!384063 () Bool)

(assert (=> d!72633 m!384063))

(declare-fun m!384065 () Bool)

(assert (=> b!388527 m!384065))

(assert (=> b!388417 d!72633))

(declare-fun d!72635 () Bool)

(assert (=> d!72635 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388416 d!72635))

(declare-fun b!388528 () Bool)

(declare-fun e!235397 () Bool)

(declare-fun call!27333 () Bool)

(assert (=> b!388528 (= e!235397 call!27333)))

(declare-fun bm!27330 () Bool)

(assert (=> bm!27330 (= call!27333 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun d!72637 () Bool)

(declare-fun res!222229 () Bool)

(declare-fun e!235399 () Bool)

(assert (=> d!72637 (=> res!222229 e!235399)))

(assert (=> d!72637 (= res!222229 (bvsge #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(assert (=> d!72637 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!235399)))

(declare-fun b!388529 () Bool)

(declare-fun e!235398 () Bool)

(assert (=> b!388529 (= e!235397 e!235398)))

(declare-fun lt!182386 () (_ BitVec 64))

(assert (=> b!388529 (= lt!182386 (select (arr!10991 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182385 () Unit!11896)

(assert (=> b!388529 (= lt!182385 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!182386 #b00000000000000000000000000000000))))

(assert (=> b!388529 (arrayContainsKey!0 _keys!658 lt!182386 #b00000000000000000000000000000000)))

(declare-fun lt!182384 () Unit!11896)

(assert (=> b!388529 (= lt!182384 lt!182385)))

(declare-fun res!222230 () Bool)

(assert (=> b!388529 (= res!222230 (= (seekEntryOrOpen!0 (select (arr!10991 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3504 #b00000000000000000000000000000000)))))

(assert (=> b!388529 (=> (not res!222230) (not e!235398))))

(declare-fun b!388530 () Bool)

(assert (=> b!388530 (= e!235399 e!235397)))

(declare-fun c!53908 () Bool)

(assert (=> b!388530 (= c!53908 (validKeyInArray!0 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388531 () Bool)

(assert (=> b!388531 (= e!235398 call!27333)))

(assert (= (and d!72637 (not res!222229)) b!388530))

(assert (= (and b!388530 c!53908) b!388529))

(assert (= (and b!388530 (not c!53908)) b!388528))

(assert (= (and b!388529 res!222230) b!388531))

(assert (= (or b!388531 b!388528) bm!27330))

(declare-fun m!384067 () Bool)

(assert (=> bm!27330 m!384067))

(assert (=> b!388529 m!384063))

(declare-fun m!384069 () Bool)

(assert (=> b!388529 m!384069))

(declare-fun m!384071 () Bool)

(assert (=> b!388529 m!384071))

(assert (=> b!388529 m!384063))

(declare-fun m!384073 () Bool)

(assert (=> b!388529 m!384073))

(assert (=> b!388530 m!384063))

(assert (=> b!388530 m!384063))

(declare-fun m!384075 () Bool)

(assert (=> b!388530 m!384075))

(assert (=> b!388424 d!72637))

(declare-fun b!388542 () Bool)

(declare-fun e!235410 () Bool)

(declare-fun e!235409 () Bool)

(assert (=> b!388542 (= e!235410 e!235409)))

(declare-fun c!53911 () Bool)

(assert (=> b!388542 (= c!53911 (validKeyInArray!0 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)))))

(declare-fun b!388543 () Bool)

(declare-fun call!27336 () Bool)

(assert (=> b!388543 (= e!235409 call!27336)))

(declare-fun b!388544 () Bool)

(declare-fun e!235411 () Bool)

(assert (=> b!388544 (= e!235411 e!235410)))

(declare-fun res!222237 () Bool)

(assert (=> b!388544 (=> (not res!222237) (not e!235410))))

(declare-fun e!235408 () Bool)

(assert (=> b!388544 (= res!222237 (not e!235408))))

(declare-fun res!222238 () Bool)

(assert (=> b!388544 (=> (not res!222238) (not e!235408))))

(assert (=> b!388544 (= res!222238 (validKeyInArray!0 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)))))

(declare-fun b!388545 () Bool)

(assert (=> b!388545 (= e!235409 call!27336)))

(declare-fun bm!27333 () Bool)

(assert (=> bm!27333 (= call!27336 (arrayNoDuplicates!0 lt!182310 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53911 (Cons!6320 (select (arr!10991 lt!182310) #b00000000000000000000000000000000) Nil!6321) Nil!6321)))))

(declare-fun b!388546 () Bool)

(declare-fun contains!2433 (List!6324 (_ BitVec 64)) Bool)

(assert (=> b!388546 (= e!235408 (contains!2433 Nil!6321 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)))))

(declare-fun d!72639 () Bool)

(declare-fun res!222239 () Bool)

(assert (=> d!72639 (=> res!222239 e!235411)))

(assert (=> d!72639 (= res!222239 (bvsge #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(assert (=> d!72639 (= (arrayNoDuplicates!0 lt!182310 #b00000000000000000000000000000000 Nil!6321) e!235411)))

(assert (= (and d!72639 (not res!222239)) b!388544))

(assert (= (and b!388544 res!222238) b!388546))

(assert (= (and b!388544 res!222237) b!388542))

(assert (= (and b!388542 c!53911) b!388543))

(assert (= (and b!388542 (not c!53911)) b!388545))

(assert (= (or b!388543 b!388545) bm!27333))

(assert (=> b!388542 m!384053))

(assert (=> b!388542 m!384053))

(assert (=> b!388542 m!384061))

(assert (=> b!388544 m!384053))

(assert (=> b!388544 m!384053))

(assert (=> b!388544 m!384061))

(assert (=> bm!27333 m!384053))

(declare-fun m!384077 () Bool)

(assert (=> bm!27333 m!384077))

(assert (=> b!388546 m!384053))

(assert (=> b!388546 m!384053))

(declare-fun m!384079 () Bool)

(assert (=> b!388546 m!384079))

(assert (=> b!388423 d!72639))

(declare-fun d!72641 () Bool)

(declare-fun e!235414 () Bool)

(assert (=> d!72641 e!235414))

(declare-fun res!222245 () Bool)

(assert (=> d!72641 (=> (not res!222245) (not e!235414))))

(declare-fun lt!182395 () ListLongMap!5381)

(declare-fun contains!2434 (ListLongMap!5381 (_ BitVec 64)) Bool)

(assert (=> d!72641 (= res!222245 (contains!2434 lt!182395 (_1!3250 lt!182313)))))

(declare-fun lt!182396 () List!6323)

(assert (=> d!72641 (= lt!182395 (ListLongMap!5382 lt!182396))))

(declare-fun lt!182398 () Unit!11896)

(declare-fun lt!182397 () Unit!11896)

(assert (=> d!72641 (= lt!182398 lt!182397)))

(declare-datatypes ((Option!360 0))(
  ( (Some!359 (v!7037 V!13883)) (None!358) )
))
(declare-fun getValueByKey!354 (List!6323 (_ BitVec 64)) Option!360)

(assert (=> d!72641 (= (getValueByKey!354 lt!182396 (_1!3250 lt!182313)) (Some!359 (_2!3250 lt!182313)))))

(declare-fun lemmaContainsTupThenGetReturnValue!179 (List!6323 (_ BitVec 64) V!13883) Unit!11896)

(assert (=> d!72641 (= lt!182397 (lemmaContainsTupThenGetReturnValue!179 lt!182396 (_1!3250 lt!182313) (_2!3250 lt!182313)))))

(declare-fun insertStrictlySorted!182 (List!6323 (_ BitVec 64) V!13883) List!6323)

(assert (=> d!72641 (= lt!182396 (insertStrictlySorted!182 (toList!2706 (+!1026 lt!182311 lt!182307)) (_1!3250 lt!182313) (_2!3250 lt!182313)))))

(assert (=> d!72641 (= (+!1026 (+!1026 lt!182311 lt!182307) lt!182313) lt!182395)))

(declare-fun b!388551 () Bool)

(declare-fun res!222244 () Bool)

(assert (=> b!388551 (=> (not res!222244) (not e!235414))))

(assert (=> b!388551 (= res!222244 (= (getValueByKey!354 (toList!2706 lt!182395) (_1!3250 lt!182313)) (Some!359 (_2!3250 lt!182313))))))

(declare-fun b!388552 () Bool)

(declare-fun contains!2435 (List!6323 tuple2!6478) Bool)

(assert (=> b!388552 (= e!235414 (contains!2435 (toList!2706 lt!182395) lt!182313))))

(assert (= (and d!72641 res!222245) b!388551))

(assert (= (and b!388551 res!222244) b!388552))

(declare-fun m!384081 () Bool)

(assert (=> d!72641 m!384081))

(declare-fun m!384083 () Bool)

(assert (=> d!72641 m!384083))

(declare-fun m!384085 () Bool)

(assert (=> d!72641 m!384085))

(declare-fun m!384087 () Bool)

(assert (=> d!72641 m!384087))

(declare-fun m!384089 () Bool)

(assert (=> b!388551 m!384089))

(declare-fun m!384091 () Bool)

(assert (=> b!388552 m!384091))

(assert (=> b!388414 d!72641))

(declare-fun d!72643 () Bool)

(declare-fun e!235415 () Bool)

(assert (=> d!72643 e!235415))

(declare-fun res!222247 () Bool)

(assert (=> d!72643 (=> (not res!222247) (not e!235415))))

(declare-fun lt!182399 () ListLongMap!5381)

(assert (=> d!72643 (= res!222247 (contains!2434 lt!182399 (_1!3250 lt!182307)))))

(declare-fun lt!182400 () List!6323)

(assert (=> d!72643 (= lt!182399 (ListLongMap!5382 lt!182400))))

(declare-fun lt!182402 () Unit!11896)

(declare-fun lt!182401 () Unit!11896)

(assert (=> d!72643 (= lt!182402 lt!182401)))

(assert (=> d!72643 (= (getValueByKey!354 lt!182400 (_1!3250 lt!182307)) (Some!359 (_2!3250 lt!182307)))))

(assert (=> d!72643 (= lt!182401 (lemmaContainsTupThenGetReturnValue!179 lt!182400 (_1!3250 lt!182307) (_2!3250 lt!182307)))))

(assert (=> d!72643 (= lt!182400 (insertStrictlySorted!182 (toList!2706 lt!182311) (_1!3250 lt!182307) (_2!3250 lt!182307)))))

(assert (=> d!72643 (= (+!1026 lt!182311 lt!182307) lt!182399)))

(declare-fun b!388553 () Bool)

(declare-fun res!222246 () Bool)

(assert (=> b!388553 (=> (not res!222246) (not e!235415))))

(assert (=> b!388553 (= res!222246 (= (getValueByKey!354 (toList!2706 lt!182399) (_1!3250 lt!182307)) (Some!359 (_2!3250 lt!182307))))))

(declare-fun b!388554 () Bool)

(assert (=> b!388554 (= e!235415 (contains!2435 (toList!2706 lt!182399) lt!182307))))

(assert (= (and d!72643 res!222247) b!388553))

(assert (= (and b!388553 res!222246) b!388554))

(declare-fun m!384093 () Bool)

(assert (=> d!72643 m!384093))

(declare-fun m!384095 () Bool)

(assert (=> d!72643 m!384095))

(declare-fun m!384097 () Bool)

(assert (=> d!72643 m!384097))

(declare-fun m!384099 () Bool)

(assert (=> d!72643 m!384099))

(declare-fun m!384101 () Bool)

(assert (=> b!388553 m!384101))

(declare-fun m!384103 () Bool)

(assert (=> b!388554 m!384103))

(assert (=> b!388414 d!72643))

(declare-fun d!72645 () Bool)

(declare-fun e!235416 () Bool)

(assert (=> d!72645 e!235416))

(declare-fun res!222249 () Bool)

(assert (=> d!72645 (=> (not res!222249) (not e!235416))))

(declare-fun lt!182403 () ListLongMap!5381)

(assert (=> d!72645 (= res!222249 (contains!2434 lt!182403 (_1!3250 lt!182313)))))

(declare-fun lt!182404 () List!6323)

(assert (=> d!72645 (= lt!182403 (ListLongMap!5382 lt!182404))))

(declare-fun lt!182406 () Unit!11896)

(declare-fun lt!182405 () Unit!11896)

(assert (=> d!72645 (= lt!182406 lt!182405)))

(assert (=> d!72645 (= (getValueByKey!354 lt!182404 (_1!3250 lt!182313)) (Some!359 (_2!3250 lt!182313)))))

(assert (=> d!72645 (= lt!182405 (lemmaContainsTupThenGetReturnValue!179 lt!182404 (_1!3250 lt!182313) (_2!3250 lt!182313)))))

(assert (=> d!72645 (= lt!182404 (insertStrictlySorted!182 (toList!2706 (+!1026 lt!182306 lt!182307)) (_1!3250 lt!182313) (_2!3250 lt!182313)))))

(assert (=> d!72645 (= (+!1026 (+!1026 lt!182306 lt!182307) lt!182313) lt!182403)))

(declare-fun b!388555 () Bool)

(declare-fun res!222248 () Bool)

(assert (=> b!388555 (=> (not res!222248) (not e!235416))))

(assert (=> b!388555 (= res!222248 (= (getValueByKey!354 (toList!2706 lt!182403) (_1!3250 lt!182313)) (Some!359 (_2!3250 lt!182313))))))

(declare-fun b!388556 () Bool)

(assert (=> b!388556 (= e!235416 (contains!2435 (toList!2706 lt!182403) lt!182313))))

(assert (= (and d!72645 res!222249) b!388555))

(assert (= (and b!388555 res!222248) b!388556))

(declare-fun m!384105 () Bool)

(assert (=> d!72645 m!384105))

(declare-fun m!384107 () Bool)

(assert (=> d!72645 m!384107))

(declare-fun m!384109 () Bool)

(assert (=> d!72645 m!384109))

(declare-fun m!384111 () Bool)

(assert (=> d!72645 m!384111))

(declare-fun m!384113 () Bool)

(assert (=> b!388555 m!384113))

(declare-fun m!384115 () Bool)

(assert (=> b!388556 m!384115))

(assert (=> b!388414 d!72645))

(declare-fun d!72647 () Bool)

(declare-fun e!235417 () Bool)

(assert (=> d!72647 e!235417))

(declare-fun res!222251 () Bool)

(assert (=> d!72647 (=> (not res!222251) (not e!235417))))

(declare-fun lt!182407 () ListLongMap!5381)

(assert (=> d!72647 (= res!222251 (contains!2434 lt!182407 (_1!3250 lt!182307)))))

(declare-fun lt!182408 () List!6323)

(assert (=> d!72647 (= lt!182407 (ListLongMap!5382 lt!182408))))

(declare-fun lt!182410 () Unit!11896)

(declare-fun lt!182409 () Unit!11896)

(assert (=> d!72647 (= lt!182410 lt!182409)))

(assert (=> d!72647 (= (getValueByKey!354 lt!182408 (_1!3250 lt!182307)) (Some!359 (_2!3250 lt!182307)))))

(assert (=> d!72647 (= lt!182409 (lemmaContainsTupThenGetReturnValue!179 lt!182408 (_1!3250 lt!182307) (_2!3250 lt!182307)))))

(assert (=> d!72647 (= lt!182408 (insertStrictlySorted!182 (toList!2706 lt!182306) (_1!3250 lt!182307) (_2!3250 lt!182307)))))

(assert (=> d!72647 (= (+!1026 lt!182306 lt!182307) lt!182407)))

(declare-fun b!388557 () Bool)

(declare-fun res!222250 () Bool)

(assert (=> b!388557 (=> (not res!222250) (not e!235417))))

(assert (=> b!388557 (= res!222250 (= (getValueByKey!354 (toList!2706 lt!182407) (_1!3250 lt!182307)) (Some!359 (_2!3250 lt!182307))))))

(declare-fun b!388558 () Bool)

(assert (=> b!388558 (= e!235417 (contains!2435 (toList!2706 lt!182407) lt!182307))))

(assert (= (and d!72647 res!222251) b!388557))

(assert (= (and b!388557 res!222250) b!388558))

(declare-fun m!384117 () Bool)

(assert (=> d!72647 m!384117))

(declare-fun m!384119 () Bool)

(assert (=> d!72647 m!384119))

(declare-fun m!384121 () Bool)

(assert (=> d!72647 m!384121))

(declare-fun m!384123 () Bool)

(assert (=> d!72647 m!384123))

(declare-fun m!384125 () Bool)

(assert (=> b!388557 m!384125))

(declare-fun m!384127 () Bool)

(assert (=> b!388558 m!384127))

(assert (=> b!388414 d!72647))

(declare-fun b!388559 () Bool)

(declare-fun e!235420 () Bool)

(declare-fun e!235419 () Bool)

(assert (=> b!388559 (= e!235420 e!235419)))

(declare-fun c!53912 () Bool)

(assert (=> b!388559 (= c!53912 (validKeyInArray!0 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388560 () Bool)

(declare-fun call!27337 () Bool)

(assert (=> b!388560 (= e!235419 call!27337)))

(declare-fun b!388561 () Bool)

(declare-fun e!235421 () Bool)

(assert (=> b!388561 (= e!235421 e!235420)))

(declare-fun res!222252 () Bool)

(assert (=> b!388561 (=> (not res!222252) (not e!235420))))

(declare-fun e!235418 () Bool)

(assert (=> b!388561 (= res!222252 (not e!235418))))

(declare-fun res!222253 () Bool)

(assert (=> b!388561 (=> (not res!222253) (not e!235418))))

(assert (=> b!388561 (= res!222253 (validKeyInArray!0 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388562 () Bool)

(assert (=> b!388562 (= e!235419 call!27337)))

(declare-fun bm!27334 () Bool)

(assert (=> bm!27334 (= call!27337 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53912 (Cons!6320 (select (arr!10991 _keys!658) #b00000000000000000000000000000000) Nil!6321) Nil!6321)))))

(declare-fun b!388563 () Bool)

(assert (=> b!388563 (= e!235418 (contains!2433 Nil!6321 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72649 () Bool)

(declare-fun res!222254 () Bool)

(assert (=> d!72649 (=> res!222254 e!235421)))

(assert (=> d!72649 (= res!222254 (bvsge #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(assert (=> d!72649 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6321) e!235421)))

(assert (= (and d!72649 (not res!222254)) b!388561))

(assert (= (and b!388561 res!222253) b!388563))

(assert (= (and b!388561 res!222252) b!388559))

(assert (= (and b!388559 c!53912) b!388560))

(assert (= (and b!388559 (not c!53912)) b!388562))

(assert (= (or b!388560 b!388562) bm!27334))

(assert (=> b!388559 m!384063))

(assert (=> b!388559 m!384063))

(assert (=> b!388559 m!384075))

(assert (=> b!388561 m!384063))

(assert (=> b!388561 m!384063))

(assert (=> b!388561 m!384075))

(assert (=> bm!27334 m!384063))

(declare-fun m!384129 () Bool)

(assert (=> bm!27334 m!384129))

(assert (=> b!388563 m!384063))

(assert (=> b!388563 m!384063))

(declare-fun m!384131 () Bool)

(assert (=> b!388563 m!384131))

(assert (=> b!388422 d!72649))

(declare-fun d!72651 () Bool)

(assert (=> d!72651 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37816 d!72651))

(declare-fun d!72653 () Bool)

(assert (=> d!72653 (= (array_inv!8080 _values!506) (bvsge (size!11345 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37816 d!72653))

(declare-fun d!72655 () Bool)

(assert (=> d!72655 (= (array_inv!8081 _keys!658) (bvsge (size!11344 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37816 d!72655))

(declare-fun bm!27349 () Bool)

(declare-fun call!27357 () ListLongMap!5381)

(assert (=> bm!27349 (= call!27357 (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388606 () Bool)

(declare-fun e!235448 () Bool)

(declare-fun lt!182463 () ListLongMap!5381)

(declare-fun apply!298 (ListLongMap!5381 (_ BitVec 64)) V!13883)

(assert (=> b!388606 (= e!235448 (= (apply!298 lt!182463 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!388607 () Bool)

(declare-fun e!235449 () ListLongMap!5381)

(declare-fun call!27352 () ListLongMap!5381)

(assert (=> b!388607 (= e!235449 call!27352)))

(declare-fun bm!27350 () Bool)

(declare-fun call!27354 () Bool)

(assert (=> bm!27350 (= call!27354 (contains!2434 lt!182463 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388608 () Bool)

(declare-fun e!235450 () Bool)

(declare-fun call!27353 () Bool)

(assert (=> b!388608 (= e!235450 (not call!27353))))

(declare-fun b!388609 () Bool)

(declare-fun e!235455 () Bool)

(declare-fun e!235459 () Bool)

(assert (=> b!388609 (= e!235455 e!235459)))

(declare-fun res!222281 () Bool)

(assert (=> b!388609 (=> (not res!222281) (not e!235459))))

(assert (=> b!388609 (= res!222281 (contains!2434 lt!182463 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388609 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(declare-fun b!388610 () Bool)

(declare-fun e!235453 () Bool)

(declare-fun e!235460 () Bool)

(assert (=> b!388610 (= e!235453 e!235460)))

(declare-fun c!53930 () Bool)

(assert (=> b!388610 (= c!53930 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388611 () Bool)

(declare-fun e!235458 () Bool)

(assert (=> b!388611 (= e!235450 e!235458)))

(declare-fun res!222280 () Bool)

(assert (=> b!388611 (= res!222280 call!27353)))

(assert (=> b!388611 (=> (not res!222280) (not e!235458))))

(declare-fun bm!27352 () Bool)

(declare-fun call!27358 () ListLongMap!5381)

(declare-fun call!27355 () ListLongMap!5381)

(assert (=> bm!27352 (= call!27358 call!27355)))

(declare-fun b!388612 () Bool)

(declare-fun e!235457 () Unit!11896)

(declare-fun Unit!11900 () Unit!11896)

(assert (=> b!388612 (= e!235457 Unit!11900)))

(declare-fun b!388613 () Bool)

(declare-fun e!235456 () ListLongMap!5381)

(declare-fun call!27356 () ListLongMap!5381)

(assert (=> b!388613 (= e!235456 (+!1026 call!27356 (tuple2!6479 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!388614 () Bool)

(declare-fun e!235451 () Bool)

(assert (=> b!388614 (= e!235451 (validKeyInArray!0 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388615 () Bool)

(assert (=> b!388615 (= e!235458 (= (apply!298 lt!182463 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!388616 () Bool)

(declare-fun res!222278 () Bool)

(assert (=> b!388616 (=> (not res!222278) (not e!235453))))

(assert (=> b!388616 (= res!222278 e!235455)))

(declare-fun res!222273 () Bool)

(assert (=> b!388616 (=> res!222273 e!235455)))

(declare-fun e!235454 () Bool)

(assert (=> b!388616 (= res!222273 (not e!235454))))

(declare-fun res!222279 () Bool)

(assert (=> b!388616 (=> (not res!222279) (not e!235454))))

(assert (=> b!388616 (= res!222279 (bvslt #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(declare-fun c!53927 () Bool)

(declare-fun c!53926 () Bool)

(declare-fun bm!27353 () Bool)

(assert (=> bm!27353 (= call!27356 (+!1026 (ite c!53927 call!27357 (ite c!53926 call!27355 call!27358)) (ite (or c!53927 c!53926) (tuple2!6479 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6479 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27354 () Bool)

(assert (=> bm!27354 (= call!27352 call!27356)))

(declare-fun b!388617 () Bool)

(assert (=> b!388617 (= e!235460 e!235448)))

(declare-fun res!222274 () Bool)

(assert (=> b!388617 (= res!222274 call!27354)))

(assert (=> b!388617 (=> (not res!222274) (not e!235448))))

(declare-fun b!388618 () Bool)

(assert (=> b!388618 (= e!235454 (validKeyInArray!0 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388619 () Bool)

(assert (=> b!388619 (= e!235460 (not call!27354))))

(declare-fun b!388620 () Bool)

(declare-fun e!235452 () ListLongMap!5381)

(assert (=> b!388620 (= e!235452 call!27358)))

(declare-fun b!388621 () Bool)

(declare-fun lt!182457 () Unit!11896)

(assert (=> b!388621 (= e!235457 lt!182457)))

(declare-fun lt!182473 () ListLongMap!5381)

(assert (=> b!388621 (= lt!182473 (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182471 () (_ BitVec 64))

(assert (=> b!388621 (= lt!182471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182464 () (_ BitVec 64))

(assert (=> b!388621 (= lt!182464 (select (arr!10991 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182462 () Unit!11896)

(declare-fun addStillContains!274 (ListLongMap!5381 (_ BitVec 64) V!13883 (_ BitVec 64)) Unit!11896)

(assert (=> b!388621 (= lt!182462 (addStillContains!274 lt!182473 lt!182471 zeroValue!472 lt!182464))))

(assert (=> b!388621 (contains!2434 (+!1026 lt!182473 (tuple2!6479 lt!182471 zeroValue!472)) lt!182464)))

(declare-fun lt!182455 () Unit!11896)

(assert (=> b!388621 (= lt!182455 lt!182462)))

(declare-fun lt!182470 () ListLongMap!5381)

(assert (=> b!388621 (= lt!182470 (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182474 () (_ BitVec 64))

(assert (=> b!388621 (= lt!182474 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182459 () (_ BitVec 64))

(assert (=> b!388621 (= lt!182459 (select (arr!10991 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182475 () Unit!11896)

(declare-fun addApplyDifferent!274 (ListLongMap!5381 (_ BitVec 64) V!13883 (_ BitVec 64)) Unit!11896)

(assert (=> b!388621 (= lt!182475 (addApplyDifferent!274 lt!182470 lt!182474 minValue!472 lt!182459))))

(assert (=> b!388621 (= (apply!298 (+!1026 lt!182470 (tuple2!6479 lt!182474 minValue!472)) lt!182459) (apply!298 lt!182470 lt!182459))))

(declare-fun lt!182461 () Unit!11896)

(assert (=> b!388621 (= lt!182461 lt!182475)))

(declare-fun lt!182466 () ListLongMap!5381)

(assert (=> b!388621 (= lt!182466 (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182469 () (_ BitVec 64))

(assert (=> b!388621 (= lt!182469 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182456 () (_ BitVec 64))

(assert (=> b!388621 (= lt!182456 (select (arr!10991 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182468 () Unit!11896)

(assert (=> b!388621 (= lt!182468 (addApplyDifferent!274 lt!182466 lt!182469 zeroValue!472 lt!182456))))

(assert (=> b!388621 (= (apply!298 (+!1026 lt!182466 (tuple2!6479 lt!182469 zeroValue!472)) lt!182456) (apply!298 lt!182466 lt!182456))))

(declare-fun lt!182467 () Unit!11896)

(assert (=> b!388621 (= lt!182467 lt!182468)))

(declare-fun lt!182465 () ListLongMap!5381)

(assert (=> b!388621 (= lt!182465 (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182458 () (_ BitVec 64))

(assert (=> b!388621 (= lt!182458 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182476 () (_ BitVec 64))

(assert (=> b!388621 (= lt!182476 (select (arr!10991 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!388621 (= lt!182457 (addApplyDifferent!274 lt!182465 lt!182458 minValue!472 lt!182476))))

(assert (=> b!388621 (= (apply!298 (+!1026 lt!182465 (tuple2!6479 lt!182458 minValue!472)) lt!182476) (apply!298 lt!182465 lt!182476))))

(declare-fun b!388622 () Bool)

(assert (=> b!388622 (= e!235452 call!27352)))

(declare-fun b!388623 () Bool)

(declare-fun get!5560 (ValueCell!4448 V!13883) V!13883)

(declare-fun dynLambda!632 (Int (_ BitVec 64)) V!13883)

(assert (=> b!388623 (= e!235459 (= (apply!298 lt!182463 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)) (get!5560 (select (arr!10992 _values!506) #b00000000000000000000000000000000) (dynLambda!632 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388623 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 _values!506)))))

(assert (=> b!388623 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(declare-fun bm!27355 () Bool)

(assert (=> bm!27355 (= call!27353 (contains!2434 lt!182463 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27351 () Bool)

(assert (=> bm!27351 (= call!27355 call!27357)))

(declare-fun d!72657 () Bool)

(assert (=> d!72657 e!235453))

(declare-fun res!222276 () Bool)

(assert (=> d!72657 (=> (not res!222276) (not e!235453))))

(assert (=> d!72657 (= res!222276 (or (bvsge #b00000000000000000000000000000000 (size!11344 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11344 _keys!658)))))))

(declare-fun lt!182472 () ListLongMap!5381)

(assert (=> d!72657 (= lt!182463 lt!182472)))

(declare-fun lt!182460 () Unit!11896)

(assert (=> d!72657 (= lt!182460 e!235457)))

(declare-fun c!53929 () Bool)

(assert (=> d!72657 (= c!53929 e!235451)))

(declare-fun res!222277 () Bool)

(assert (=> d!72657 (=> (not res!222277) (not e!235451))))

(assert (=> d!72657 (= res!222277 (bvslt #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(assert (=> d!72657 (= lt!182472 e!235456)))

(assert (=> d!72657 (= c!53927 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72657 (validMask!0 mask!970)))

(assert (=> d!72657 (= (getCurrentListMap!2036 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182463)))

(declare-fun b!388624 () Bool)

(declare-fun res!222275 () Bool)

(assert (=> b!388624 (=> (not res!222275) (not e!235453))))

(assert (=> b!388624 (= res!222275 e!235450)))

(declare-fun c!53925 () Bool)

(assert (=> b!388624 (= c!53925 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!388625 () Bool)

(assert (=> b!388625 (= e!235456 e!235449)))

(assert (=> b!388625 (= c!53926 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388626 () Bool)

(declare-fun c!53928 () Bool)

(assert (=> b!388626 (= c!53928 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!388626 (= e!235449 e!235452)))

(assert (= (and d!72657 c!53927) b!388613))

(assert (= (and d!72657 (not c!53927)) b!388625))

(assert (= (and b!388625 c!53926) b!388607))

(assert (= (and b!388625 (not c!53926)) b!388626))

(assert (= (and b!388626 c!53928) b!388622))

(assert (= (and b!388626 (not c!53928)) b!388620))

(assert (= (or b!388622 b!388620) bm!27352))

(assert (= (or b!388607 bm!27352) bm!27351))

(assert (= (or b!388607 b!388622) bm!27354))

(assert (= (or b!388613 bm!27351) bm!27349))

(assert (= (or b!388613 bm!27354) bm!27353))

(assert (= (and d!72657 res!222277) b!388614))

(assert (= (and d!72657 c!53929) b!388621))

(assert (= (and d!72657 (not c!53929)) b!388612))

(assert (= (and d!72657 res!222276) b!388616))

(assert (= (and b!388616 res!222279) b!388618))

(assert (= (and b!388616 (not res!222273)) b!388609))

(assert (= (and b!388609 res!222281) b!388623))

(assert (= (and b!388616 res!222278) b!388624))

(assert (= (and b!388624 c!53925) b!388611))

(assert (= (and b!388624 (not c!53925)) b!388608))

(assert (= (and b!388611 res!222280) b!388615))

(assert (= (or b!388611 b!388608) bm!27355))

(assert (= (and b!388624 res!222275) b!388610))

(assert (= (and b!388610 c!53930) b!388617))

(assert (= (and b!388610 (not c!53930)) b!388619))

(assert (= (and b!388617 res!222274) b!388606))

(assert (= (or b!388617 b!388619) bm!27350))

(declare-fun b_lambda!8533 () Bool)

(assert (=> (not b_lambda!8533) (not b!388623)))

(declare-fun t!11473 () Bool)

(declare-fun tb!3103 () Bool)

(assert (=> (and start!37816 (= defaultEntry!514 defaultEntry!514) t!11473) tb!3103))

(declare-fun result!5705 () Bool)

(assert (=> tb!3103 (= result!5705 tp_is_empty!9583)))

(assert (=> b!388623 t!11473))

(declare-fun b_and!16145 () Bool)

(assert (= b_and!16139 (and (=> t!11473 result!5705) b_and!16145)))

(assert (=> b!388609 m!384063))

(assert (=> b!388609 m!384063))

(declare-fun m!384133 () Bool)

(assert (=> b!388609 m!384133))

(declare-fun m!384135 () Bool)

(assert (=> bm!27350 m!384135))

(assert (=> b!388614 m!384063))

(assert (=> b!388614 m!384063))

(assert (=> b!388614 m!384075))

(declare-fun m!384137 () Bool)

(assert (=> b!388606 m!384137))

(assert (=> bm!27349 m!383943))

(declare-fun m!384139 () Bool)

(assert (=> b!388613 m!384139))

(assert (=> b!388623 m!384063))

(declare-fun m!384141 () Bool)

(assert (=> b!388623 m!384141))

(declare-fun m!384143 () Bool)

(assert (=> b!388623 m!384143))

(declare-fun m!384145 () Bool)

(assert (=> b!388623 m!384145))

(declare-fun m!384147 () Bool)

(assert (=> b!388623 m!384147))

(assert (=> b!388623 m!384145))

(assert (=> b!388623 m!384143))

(assert (=> b!388623 m!384063))

(declare-fun m!384149 () Bool)

(assert (=> bm!27355 m!384149))

(declare-fun m!384151 () Bool)

(assert (=> bm!27353 m!384151))

(declare-fun m!384153 () Bool)

(assert (=> b!388615 m!384153))

(assert (=> d!72657 m!383933))

(assert (=> b!388618 m!384063))

(assert (=> b!388618 m!384063))

(assert (=> b!388618 m!384075))

(declare-fun m!384155 () Bool)

(assert (=> b!388621 m!384155))

(declare-fun m!384157 () Bool)

(assert (=> b!388621 m!384157))

(declare-fun m!384159 () Bool)

(assert (=> b!388621 m!384159))

(declare-fun m!384161 () Bool)

(assert (=> b!388621 m!384161))

(declare-fun m!384163 () Bool)

(assert (=> b!388621 m!384163))

(assert (=> b!388621 m!384157))

(declare-fun m!384165 () Bool)

(assert (=> b!388621 m!384165))

(assert (=> b!388621 m!383943))

(assert (=> b!388621 m!384063))

(declare-fun m!384167 () Bool)

(assert (=> b!388621 m!384167))

(declare-fun m!384169 () Bool)

(assert (=> b!388621 m!384169))

(declare-fun m!384171 () Bool)

(assert (=> b!388621 m!384171))

(declare-fun m!384173 () Bool)

(assert (=> b!388621 m!384173))

(assert (=> b!388621 m!384173))

(declare-fun m!384175 () Bool)

(assert (=> b!388621 m!384175))

(assert (=> b!388621 m!384163))

(declare-fun m!384177 () Bool)

(assert (=> b!388621 m!384177))

(declare-fun m!384179 () Bool)

(assert (=> b!388621 m!384179))

(assert (=> b!388621 m!384161))

(declare-fun m!384181 () Bool)

(assert (=> b!388621 m!384181))

(declare-fun m!384183 () Bool)

(assert (=> b!388621 m!384183))

(assert (=> b!388418 d!72657))

(declare-fun call!27363 () ListLongMap!5381)

(declare-fun bm!27360 () Bool)

(assert (=> bm!27360 (= call!27363 (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun call!27364 () ListLongMap!5381)

(declare-fun bm!27361 () Bool)

(assert (=> bm!27361 (= call!27364 (getCurrentListMapNoExtraKeys!946 (array!23048 (store (arr!10991 _keys!658) i!548 k0!778) (size!11344 _keys!658)) (array!23050 (store (arr!10992 _values!506) i!548 (ValueCellFull!4448 v!373)) (size!11345 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388635 () Bool)

(declare-fun e!235466 () Bool)

(assert (=> b!388635 (= e!235466 (= call!27364 call!27363))))

(declare-fun d!72659 () Bool)

(declare-fun e!235465 () Bool)

(assert (=> d!72659 e!235465))

(declare-fun res!222284 () Bool)

(assert (=> d!72659 (=> (not res!222284) (not e!235465))))

(assert (=> d!72659 (= res!222284 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11344 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11345 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11344 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11345 _values!506))))))))

(declare-fun lt!182479 () Unit!11896)

(declare-fun choose!1319 (array!23047 array!23049 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) (_ BitVec 64) V!13883 (_ BitVec 32) Int) Unit!11896)

(assert (=> d!72659 (= lt!182479 (choose!1319 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72659 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(assert (=> d!72659 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!237 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!182479)))

(declare-fun b!388636 () Bool)

(assert (=> b!388636 (= e!235466 (= call!27364 (+!1026 call!27363 (tuple2!6479 k0!778 v!373))))))

(declare-fun b!388637 () Bool)

(assert (=> b!388637 (= e!235465 e!235466)))

(declare-fun c!53933 () Bool)

(assert (=> b!388637 (= c!53933 (bvsle #b00000000000000000000000000000000 i!548))))

(assert (= (and d!72659 res!222284) b!388637))

(assert (= (and b!388637 c!53933) b!388636))

(assert (= (and b!388637 (not c!53933)) b!388635))

(assert (= (or b!388636 b!388635) bm!27360))

(assert (= (or b!388636 b!388635) bm!27361))

(assert (=> bm!27360 m!383943))

(assert (=> bm!27361 m!383929))

(assert (=> bm!27361 m!383955))

(declare-fun m!384185 () Bool)

(assert (=> bm!27361 m!384185))

(declare-fun m!384187 () Bool)

(assert (=> d!72659 m!384187))

(declare-fun m!384189 () Bool)

(assert (=> b!388636 m!384189))

(assert (=> b!388418 d!72659))

(declare-fun call!27370 () ListLongMap!5381)

(declare-fun bm!27362 () Bool)

(assert (=> bm!27362 (= call!27370 (getCurrentListMapNoExtraKeys!946 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388638 () Bool)

(declare-fun e!235467 () Bool)

(declare-fun lt!182488 () ListLongMap!5381)

(assert (=> b!388638 (= e!235467 (= (apply!298 lt!182488 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!388639 () Bool)

(declare-fun e!235468 () ListLongMap!5381)

(declare-fun call!27365 () ListLongMap!5381)

(assert (=> b!388639 (= e!235468 call!27365)))

(declare-fun bm!27363 () Bool)

(declare-fun call!27367 () Bool)

(assert (=> bm!27363 (= call!27367 (contains!2434 lt!182488 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388640 () Bool)

(declare-fun e!235469 () Bool)

(declare-fun call!27366 () Bool)

(assert (=> b!388640 (= e!235469 (not call!27366))))

(declare-fun b!388641 () Bool)

(declare-fun e!235474 () Bool)

(declare-fun e!235478 () Bool)

(assert (=> b!388641 (= e!235474 e!235478)))

(declare-fun res!222293 () Bool)

(assert (=> b!388641 (=> (not res!222293) (not e!235478))))

(assert (=> b!388641 (= res!222293 (contains!2434 lt!182488 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)))))

(assert (=> b!388641 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(declare-fun b!388642 () Bool)

(declare-fun e!235472 () Bool)

(declare-fun e!235479 () Bool)

(assert (=> b!388642 (= e!235472 e!235479)))

(declare-fun c!53939 () Bool)

(assert (=> b!388642 (= c!53939 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388643 () Bool)

(declare-fun e!235477 () Bool)

(assert (=> b!388643 (= e!235469 e!235477)))

(declare-fun res!222292 () Bool)

(assert (=> b!388643 (= res!222292 call!27366)))

(assert (=> b!388643 (=> (not res!222292) (not e!235477))))

(declare-fun bm!27365 () Bool)

(declare-fun call!27371 () ListLongMap!5381)

(declare-fun call!27368 () ListLongMap!5381)

(assert (=> bm!27365 (= call!27371 call!27368)))

(declare-fun b!388644 () Bool)

(declare-fun e!235476 () Unit!11896)

(declare-fun Unit!11901 () Unit!11896)

(assert (=> b!388644 (= e!235476 Unit!11901)))

(declare-fun b!388645 () Bool)

(declare-fun e!235475 () ListLongMap!5381)

(declare-fun call!27369 () ListLongMap!5381)

(assert (=> b!388645 (= e!235475 (+!1026 call!27369 (tuple2!6479 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!388646 () Bool)

(declare-fun e!235470 () Bool)

(assert (=> b!388646 (= e!235470 (validKeyInArray!0 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)))))

(declare-fun b!388647 () Bool)

(assert (=> b!388647 (= e!235477 (= (apply!298 lt!182488 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!388648 () Bool)

(declare-fun res!222290 () Bool)

(assert (=> b!388648 (=> (not res!222290) (not e!235472))))

(assert (=> b!388648 (= res!222290 e!235474)))

(declare-fun res!222285 () Bool)

(assert (=> b!388648 (=> res!222285 e!235474)))

(declare-fun e!235473 () Bool)

(assert (=> b!388648 (= res!222285 (not e!235473))))

(declare-fun res!222291 () Bool)

(assert (=> b!388648 (=> (not res!222291) (not e!235473))))

(assert (=> b!388648 (= res!222291 (bvslt #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(declare-fun c!53935 () Bool)

(declare-fun c!53936 () Bool)

(declare-fun bm!27366 () Bool)

(assert (=> bm!27366 (= call!27369 (+!1026 (ite c!53936 call!27370 (ite c!53935 call!27368 call!27371)) (ite (or c!53936 c!53935) (tuple2!6479 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6479 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27367 () Bool)

(assert (=> bm!27367 (= call!27365 call!27369)))

(declare-fun b!388649 () Bool)

(assert (=> b!388649 (= e!235479 e!235467)))

(declare-fun res!222286 () Bool)

(assert (=> b!388649 (= res!222286 call!27367)))

(assert (=> b!388649 (=> (not res!222286) (not e!235467))))

(declare-fun b!388650 () Bool)

(assert (=> b!388650 (= e!235473 (validKeyInArray!0 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)))))

(declare-fun b!388651 () Bool)

(assert (=> b!388651 (= e!235479 (not call!27367))))

(declare-fun b!388652 () Bool)

(declare-fun e!235471 () ListLongMap!5381)

(assert (=> b!388652 (= e!235471 call!27371)))

(declare-fun b!388653 () Bool)

(declare-fun lt!182482 () Unit!11896)

(assert (=> b!388653 (= e!235476 lt!182482)))

(declare-fun lt!182498 () ListLongMap!5381)

(assert (=> b!388653 (= lt!182498 (getCurrentListMapNoExtraKeys!946 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182496 () (_ BitVec 64))

(assert (=> b!388653 (= lt!182496 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182489 () (_ BitVec 64))

(assert (=> b!388653 (= lt!182489 (select (arr!10991 lt!182310) #b00000000000000000000000000000000))))

(declare-fun lt!182487 () Unit!11896)

(assert (=> b!388653 (= lt!182487 (addStillContains!274 lt!182498 lt!182496 zeroValue!472 lt!182489))))

(assert (=> b!388653 (contains!2434 (+!1026 lt!182498 (tuple2!6479 lt!182496 zeroValue!472)) lt!182489)))

(declare-fun lt!182480 () Unit!11896)

(assert (=> b!388653 (= lt!182480 lt!182487)))

(declare-fun lt!182495 () ListLongMap!5381)

(assert (=> b!388653 (= lt!182495 (getCurrentListMapNoExtraKeys!946 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182499 () (_ BitVec 64))

(assert (=> b!388653 (= lt!182499 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182484 () (_ BitVec 64))

(assert (=> b!388653 (= lt!182484 (select (arr!10991 lt!182310) #b00000000000000000000000000000000))))

(declare-fun lt!182500 () Unit!11896)

(assert (=> b!388653 (= lt!182500 (addApplyDifferent!274 lt!182495 lt!182499 minValue!472 lt!182484))))

(assert (=> b!388653 (= (apply!298 (+!1026 lt!182495 (tuple2!6479 lt!182499 minValue!472)) lt!182484) (apply!298 lt!182495 lt!182484))))

(declare-fun lt!182486 () Unit!11896)

(assert (=> b!388653 (= lt!182486 lt!182500)))

(declare-fun lt!182491 () ListLongMap!5381)

(assert (=> b!388653 (= lt!182491 (getCurrentListMapNoExtraKeys!946 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182494 () (_ BitVec 64))

(assert (=> b!388653 (= lt!182494 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182481 () (_ BitVec 64))

(assert (=> b!388653 (= lt!182481 (select (arr!10991 lt!182310) #b00000000000000000000000000000000))))

(declare-fun lt!182493 () Unit!11896)

(assert (=> b!388653 (= lt!182493 (addApplyDifferent!274 lt!182491 lt!182494 zeroValue!472 lt!182481))))

(assert (=> b!388653 (= (apply!298 (+!1026 lt!182491 (tuple2!6479 lt!182494 zeroValue!472)) lt!182481) (apply!298 lt!182491 lt!182481))))

(declare-fun lt!182492 () Unit!11896)

(assert (=> b!388653 (= lt!182492 lt!182493)))

(declare-fun lt!182490 () ListLongMap!5381)

(assert (=> b!388653 (= lt!182490 (getCurrentListMapNoExtraKeys!946 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182483 () (_ BitVec 64))

(assert (=> b!388653 (= lt!182483 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182501 () (_ BitVec 64))

(assert (=> b!388653 (= lt!182501 (select (arr!10991 lt!182310) #b00000000000000000000000000000000))))

(assert (=> b!388653 (= lt!182482 (addApplyDifferent!274 lt!182490 lt!182483 minValue!472 lt!182501))))

(assert (=> b!388653 (= (apply!298 (+!1026 lt!182490 (tuple2!6479 lt!182483 minValue!472)) lt!182501) (apply!298 lt!182490 lt!182501))))

(declare-fun b!388654 () Bool)

(assert (=> b!388654 (= e!235471 call!27365)))

(declare-fun b!388655 () Bool)

(assert (=> b!388655 (= e!235478 (= (apply!298 lt!182488 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)) (get!5560 (select (arr!10992 lt!182314) #b00000000000000000000000000000000) (dynLambda!632 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388655 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 lt!182314)))))

(assert (=> b!388655 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(declare-fun bm!27368 () Bool)

(assert (=> bm!27368 (= call!27366 (contains!2434 lt!182488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27364 () Bool)

(assert (=> bm!27364 (= call!27368 call!27370)))

(declare-fun d!72661 () Bool)

(assert (=> d!72661 e!235472))

(declare-fun res!222288 () Bool)

(assert (=> d!72661 (=> (not res!222288) (not e!235472))))

(assert (=> d!72661 (= res!222288 (or (bvsge #b00000000000000000000000000000000 (size!11344 lt!182310)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11344 lt!182310)))))))

(declare-fun lt!182497 () ListLongMap!5381)

(assert (=> d!72661 (= lt!182488 lt!182497)))

(declare-fun lt!182485 () Unit!11896)

(assert (=> d!72661 (= lt!182485 e!235476)))

(declare-fun c!53938 () Bool)

(assert (=> d!72661 (= c!53938 e!235470)))

(declare-fun res!222289 () Bool)

(assert (=> d!72661 (=> (not res!222289) (not e!235470))))

(assert (=> d!72661 (= res!222289 (bvslt #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(assert (=> d!72661 (= lt!182497 e!235475)))

(assert (=> d!72661 (= c!53936 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72661 (validMask!0 mask!970)))

(assert (=> d!72661 (= (getCurrentListMap!2036 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182488)))

(declare-fun b!388656 () Bool)

(declare-fun res!222287 () Bool)

(assert (=> b!388656 (=> (not res!222287) (not e!235472))))

(assert (=> b!388656 (= res!222287 e!235469)))

(declare-fun c!53934 () Bool)

(assert (=> b!388656 (= c!53934 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!388657 () Bool)

(assert (=> b!388657 (= e!235475 e!235468)))

(assert (=> b!388657 (= c!53935 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388658 () Bool)

(declare-fun c!53937 () Bool)

(assert (=> b!388658 (= c!53937 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!388658 (= e!235468 e!235471)))

(assert (= (and d!72661 c!53936) b!388645))

(assert (= (and d!72661 (not c!53936)) b!388657))

(assert (= (and b!388657 c!53935) b!388639))

(assert (= (and b!388657 (not c!53935)) b!388658))

(assert (= (and b!388658 c!53937) b!388654))

(assert (= (and b!388658 (not c!53937)) b!388652))

(assert (= (or b!388654 b!388652) bm!27365))

(assert (= (or b!388639 bm!27365) bm!27364))

(assert (= (or b!388639 b!388654) bm!27367))

(assert (= (or b!388645 bm!27364) bm!27362))

(assert (= (or b!388645 bm!27367) bm!27366))

(assert (= (and d!72661 res!222289) b!388646))

(assert (= (and d!72661 c!53938) b!388653))

(assert (= (and d!72661 (not c!53938)) b!388644))

(assert (= (and d!72661 res!222288) b!388648))

(assert (= (and b!388648 res!222291) b!388650))

(assert (= (and b!388648 (not res!222285)) b!388641))

(assert (= (and b!388641 res!222293) b!388655))

(assert (= (and b!388648 res!222290) b!388656))

(assert (= (and b!388656 c!53934) b!388643))

(assert (= (and b!388656 (not c!53934)) b!388640))

(assert (= (and b!388643 res!222292) b!388647))

(assert (= (or b!388643 b!388640) bm!27368))

(assert (= (and b!388656 res!222287) b!388642))

(assert (= (and b!388642 c!53939) b!388649))

(assert (= (and b!388642 (not c!53939)) b!388651))

(assert (= (and b!388649 res!222286) b!388638))

(assert (= (or b!388649 b!388651) bm!27363))

(declare-fun b_lambda!8535 () Bool)

(assert (=> (not b_lambda!8535) (not b!388655)))

(assert (=> b!388655 t!11473))

(declare-fun b_and!16147 () Bool)

(assert (= b_and!16145 (and (=> t!11473 result!5705) b_and!16147)))

(assert (=> b!388641 m!384053))

(assert (=> b!388641 m!384053))

(declare-fun m!384191 () Bool)

(assert (=> b!388641 m!384191))

(declare-fun m!384193 () Bool)

(assert (=> bm!27363 m!384193))

(assert (=> b!388646 m!384053))

(assert (=> b!388646 m!384053))

(assert (=> b!388646 m!384061))

(declare-fun m!384195 () Bool)

(assert (=> b!388638 m!384195))

(assert (=> bm!27362 m!383949))

(declare-fun m!384197 () Bool)

(assert (=> b!388645 m!384197))

(assert (=> b!388655 m!384053))

(declare-fun m!384199 () Bool)

(assert (=> b!388655 m!384199))

(declare-fun m!384201 () Bool)

(assert (=> b!388655 m!384201))

(assert (=> b!388655 m!384145))

(declare-fun m!384203 () Bool)

(assert (=> b!388655 m!384203))

(assert (=> b!388655 m!384145))

(assert (=> b!388655 m!384201))

(assert (=> b!388655 m!384053))

(declare-fun m!384205 () Bool)

(assert (=> bm!27368 m!384205))

(declare-fun m!384207 () Bool)

(assert (=> bm!27366 m!384207))

(declare-fun m!384209 () Bool)

(assert (=> b!388647 m!384209))

(assert (=> d!72661 m!383933))

(assert (=> b!388650 m!384053))

(assert (=> b!388650 m!384053))

(assert (=> b!388650 m!384061))

(declare-fun m!384211 () Bool)

(assert (=> b!388653 m!384211))

(declare-fun m!384213 () Bool)

(assert (=> b!388653 m!384213))

(declare-fun m!384215 () Bool)

(assert (=> b!388653 m!384215))

(declare-fun m!384217 () Bool)

(assert (=> b!388653 m!384217))

(declare-fun m!384219 () Bool)

(assert (=> b!388653 m!384219))

(assert (=> b!388653 m!384213))

(declare-fun m!384221 () Bool)

(assert (=> b!388653 m!384221))

(assert (=> b!388653 m!383949))

(assert (=> b!388653 m!384053))

(declare-fun m!384223 () Bool)

(assert (=> b!388653 m!384223))

(declare-fun m!384225 () Bool)

(assert (=> b!388653 m!384225))

(declare-fun m!384227 () Bool)

(assert (=> b!388653 m!384227))

(declare-fun m!384229 () Bool)

(assert (=> b!388653 m!384229))

(assert (=> b!388653 m!384229))

(declare-fun m!384231 () Bool)

(assert (=> b!388653 m!384231))

(assert (=> b!388653 m!384219))

(declare-fun m!384233 () Bool)

(assert (=> b!388653 m!384233))

(declare-fun m!384235 () Bool)

(assert (=> b!388653 m!384235))

(assert (=> b!388653 m!384217))

(declare-fun m!384237 () Bool)

(assert (=> b!388653 m!384237))

(declare-fun m!384239 () Bool)

(assert (=> b!388653 m!384239))

(assert (=> b!388418 d!72661))

(declare-fun b!388683 () Bool)

(declare-fun lt!182519 () Unit!11896)

(declare-fun lt!182520 () Unit!11896)

(assert (=> b!388683 (= lt!182519 lt!182520)))

(declare-fun lt!182522 () ListLongMap!5381)

(declare-fun lt!182518 () (_ BitVec 64))

(declare-fun lt!182521 () V!13883)

(declare-fun lt!182516 () (_ BitVec 64))

(assert (=> b!388683 (not (contains!2434 (+!1026 lt!182522 (tuple2!6479 lt!182516 lt!182521)) lt!182518))))

(declare-fun addStillNotContains!132 (ListLongMap!5381 (_ BitVec 64) V!13883 (_ BitVec 64)) Unit!11896)

(assert (=> b!388683 (= lt!182520 (addStillNotContains!132 lt!182522 lt!182516 lt!182521 lt!182518))))

(assert (=> b!388683 (= lt!182518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388683 (= lt!182521 (get!5560 (select (arr!10992 lt!182314) #b00000000000000000000000000000000) (dynLambda!632 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388683 (= lt!182516 (select (arr!10991 lt!182310) #b00000000000000000000000000000000))))

(declare-fun call!27374 () ListLongMap!5381)

(assert (=> b!388683 (= lt!182522 call!27374)))

(declare-fun e!235494 () ListLongMap!5381)

(assert (=> b!388683 (= e!235494 (+!1026 call!27374 (tuple2!6479 (select (arr!10991 lt!182310) #b00000000000000000000000000000000) (get!5560 (select (arr!10992 lt!182314) #b00000000000000000000000000000000) (dynLambda!632 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!27371 () Bool)

(assert (=> bm!27371 (= call!27374 (getCurrentListMapNoExtraKeys!946 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!388684 () Bool)

(declare-fun e!235498 () ListLongMap!5381)

(assert (=> b!388684 (= e!235498 (ListLongMap!5382 Nil!6320))))

(declare-fun b!388685 () Bool)

(declare-fun e!235496 () Bool)

(assert (=> b!388685 (= e!235496 (validKeyInArray!0 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)))))

(assert (=> b!388685 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!72663 () Bool)

(declare-fun e!235497 () Bool)

(assert (=> d!72663 e!235497))

(declare-fun res!222303 () Bool)

(assert (=> d!72663 (=> (not res!222303) (not e!235497))))

(declare-fun lt!182517 () ListLongMap!5381)

(assert (=> d!72663 (= res!222303 (not (contains!2434 lt!182517 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72663 (= lt!182517 e!235498)))

(declare-fun c!53949 () Bool)

(assert (=> d!72663 (= c!53949 (bvsge #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(assert (=> d!72663 (validMask!0 mask!970)))

(assert (=> d!72663 (= (getCurrentListMapNoExtraKeys!946 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182517)))

(declare-fun b!388686 () Bool)

(assert (=> b!388686 (= e!235498 e!235494)))

(declare-fun c!53950 () Bool)

(assert (=> b!388686 (= c!53950 (validKeyInArray!0 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)))))

(declare-fun b!388687 () Bool)

(declare-fun e!235500 () Bool)

(declare-fun e!235499 () Bool)

(assert (=> b!388687 (= e!235500 e!235499)))

(declare-fun c!53951 () Bool)

(assert (=> b!388687 (= c!53951 (bvslt #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(declare-fun b!388688 () Bool)

(assert (=> b!388688 (= e!235494 call!27374)))

(declare-fun b!388689 () Bool)

(assert (=> b!388689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(assert (=> b!388689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 lt!182314)))))

(declare-fun e!235495 () Bool)

(assert (=> b!388689 (= e!235495 (= (apply!298 lt!182517 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)) (get!5560 (select (arr!10992 lt!182314) #b00000000000000000000000000000000) (dynLambda!632 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!388690 () Bool)

(declare-fun res!222304 () Bool)

(assert (=> b!388690 (=> (not res!222304) (not e!235497))))

(assert (=> b!388690 (= res!222304 (not (contains!2434 lt!182517 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388691 () Bool)

(assert (=> b!388691 (= e!235497 e!235500)))

(declare-fun c!53948 () Bool)

(assert (=> b!388691 (= c!53948 e!235496)))

(declare-fun res!222305 () Bool)

(assert (=> b!388691 (=> (not res!222305) (not e!235496))))

(assert (=> b!388691 (= res!222305 (bvslt #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(declare-fun b!388692 () Bool)

(assert (=> b!388692 (= e!235499 (= lt!182517 (getCurrentListMapNoExtraKeys!946 lt!182310 lt!182314 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!388693 () Bool)

(declare-fun isEmpty!548 (ListLongMap!5381) Bool)

(assert (=> b!388693 (= e!235499 (isEmpty!548 lt!182517))))

(declare-fun b!388694 () Bool)

(assert (=> b!388694 (= e!235500 e!235495)))

(assert (=> b!388694 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11344 lt!182310)))))

(declare-fun res!222302 () Bool)

(assert (=> b!388694 (= res!222302 (contains!2434 lt!182517 (select (arr!10991 lt!182310) #b00000000000000000000000000000000)))))

(assert (=> b!388694 (=> (not res!222302) (not e!235495))))

(assert (= (and d!72663 c!53949) b!388684))

(assert (= (and d!72663 (not c!53949)) b!388686))

(assert (= (and b!388686 c!53950) b!388683))

(assert (= (and b!388686 (not c!53950)) b!388688))

(assert (= (or b!388683 b!388688) bm!27371))

(assert (= (and d!72663 res!222303) b!388690))

(assert (= (and b!388690 res!222304) b!388691))

(assert (= (and b!388691 res!222305) b!388685))

(assert (= (and b!388691 c!53948) b!388694))

(assert (= (and b!388691 (not c!53948)) b!388687))

(assert (= (and b!388694 res!222302) b!388689))

(assert (= (and b!388687 c!53951) b!388692))

(assert (= (and b!388687 (not c!53951)) b!388693))

(declare-fun b_lambda!8537 () Bool)

(assert (=> (not b_lambda!8537) (not b!388683)))

(assert (=> b!388683 t!11473))

(declare-fun b_and!16149 () Bool)

(assert (= b_and!16147 (and (=> t!11473 result!5705) b_and!16149)))

(declare-fun b_lambda!8539 () Bool)

(assert (=> (not b_lambda!8539) (not b!388689)))

(assert (=> b!388689 t!11473))

(declare-fun b_and!16151 () Bool)

(assert (= b_and!16149 (and (=> t!11473 result!5705) b_and!16151)))

(declare-fun m!384241 () Bool)

(assert (=> b!388693 m!384241))

(declare-fun m!384243 () Bool)

(assert (=> d!72663 m!384243))

(assert (=> d!72663 m!383933))

(assert (=> b!388685 m!384053))

(assert (=> b!388685 m!384053))

(assert (=> b!388685 m!384061))

(assert (=> b!388689 m!384145))

(assert (=> b!388689 m!384201))

(assert (=> b!388689 m!384053))

(declare-fun m!384245 () Bool)

(assert (=> b!388689 m!384245))

(assert (=> b!388689 m!384053))

(assert (=> b!388689 m!384201))

(assert (=> b!388689 m!384145))

(assert (=> b!388689 m!384203))

(declare-fun m!384247 () Bool)

(assert (=> b!388692 m!384247))

(assert (=> bm!27371 m!384247))

(assert (=> b!388686 m!384053))

(assert (=> b!388686 m!384053))

(assert (=> b!388686 m!384061))

(assert (=> b!388694 m!384053))

(assert (=> b!388694 m!384053))

(declare-fun m!384249 () Bool)

(assert (=> b!388694 m!384249))

(declare-fun m!384251 () Bool)

(assert (=> b!388690 m!384251))

(declare-fun m!384253 () Bool)

(assert (=> b!388683 m!384253))

(assert (=> b!388683 m!384145))

(declare-fun m!384255 () Bool)

(assert (=> b!388683 m!384255))

(declare-fun m!384257 () Bool)

(assert (=> b!388683 m!384257))

(declare-fun m!384259 () Bool)

(assert (=> b!388683 m!384259))

(assert (=> b!388683 m!384257))

(assert (=> b!388683 m!384201))

(assert (=> b!388683 m!384053))

(assert (=> b!388683 m!384201))

(assert (=> b!388683 m!384145))

(assert (=> b!388683 m!384203))

(assert (=> b!388418 d!72663))

(declare-fun b!388695 () Bool)

(declare-fun lt!182526 () Unit!11896)

(declare-fun lt!182527 () Unit!11896)

(assert (=> b!388695 (= lt!182526 lt!182527)))

(declare-fun lt!182528 () V!13883)

(declare-fun lt!182529 () ListLongMap!5381)

(declare-fun lt!182523 () (_ BitVec 64))

(declare-fun lt!182525 () (_ BitVec 64))

(assert (=> b!388695 (not (contains!2434 (+!1026 lt!182529 (tuple2!6479 lt!182523 lt!182528)) lt!182525))))

(assert (=> b!388695 (= lt!182527 (addStillNotContains!132 lt!182529 lt!182523 lt!182528 lt!182525))))

(assert (=> b!388695 (= lt!182525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388695 (= lt!182528 (get!5560 (select (arr!10992 _values!506) #b00000000000000000000000000000000) (dynLambda!632 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388695 (= lt!182523 (select (arr!10991 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27375 () ListLongMap!5381)

(assert (=> b!388695 (= lt!182529 call!27375)))

(declare-fun e!235501 () ListLongMap!5381)

(assert (=> b!388695 (= e!235501 (+!1026 call!27375 (tuple2!6479 (select (arr!10991 _keys!658) #b00000000000000000000000000000000) (get!5560 (select (arr!10992 _values!506) #b00000000000000000000000000000000) (dynLambda!632 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!27372 () Bool)

(assert (=> bm!27372 (= call!27375 (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!388696 () Bool)

(declare-fun e!235505 () ListLongMap!5381)

(assert (=> b!388696 (= e!235505 (ListLongMap!5382 Nil!6320))))

(declare-fun b!388697 () Bool)

(declare-fun e!235503 () Bool)

(assert (=> b!388697 (= e!235503 (validKeyInArray!0 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388697 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!72665 () Bool)

(declare-fun e!235504 () Bool)

(assert (=> d!72665 e!235504))

(declare-fun res!222307 () Bool)

(assert (=> d!72665 (=> (not res!222307) (not e!235504))))

(declare-fun lt!182524 () ListLongMap!5381)

(assert (=> d!72665 (= res!222307 (not (contains!2434 lt!182524 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72665 (= lt!182524 e!235505)))

(declare-fun c!53953 () Bool)

(assert (=> d!72665 (= c!53953 (bvsge #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(assert (=> d!72665 (validMask!0 mask!970)))

(assert (=> d!72665 (= (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182524)))

(declare-fun b!388698 () Bool)

(assert (=> b!388698 (= e!235505 e!235501)))

(declare-fun c!53954 () Bool)

(assert (=> b!388698 (= c!53954 (validKeyInArray!0 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388699 () Bool)

(declare-fun e!235507 () Bool)

(declare-fun e!235506 () Bool)

(assert (=> b!388699 (= e!235507 e!235506)))

(declare-fun c!53955 () Bool)

(assert (=> b!388699 (= c!53955 (bvslt #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(declare-fun b!388700 () Bool)

(assert (=> b!388700 (= e!235501 call!27375)))

(declare-fun b!388701 () Bool)

(assert (=> b!388701 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(assert (=> b!388701 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 _values!506)))))

(declare-fun e!235502 () Bool)

(assert (=> b!388701 (= e!235502 (= (apply!298 lt!182524 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)) (get!5560 (select (arr!10992 _values!506) #b00000000000000000000000000000000) (dynLambda!632 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!388702 () Bool)

(declare-fun res!222308 () Bool)

(assert (=> b!388702 (=> (not res!222308) (not e!235504))))

(assert (=> b!388702 (= res!222308 (not (contains!2434 lt!182524 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388703 () Bool)

(assert (=> b!388703 (= e!235504 e!235507)))

(declare-fun c!53952 () Bool)

(assert (=> b!388703 (= c!53952 e!235503)))

(declare-fun res!222309 () Bool)

(assert (=> b!388703 (=> (not res!222309) (not e!235503))))

(assert (=> b!388703 (= res!222309 (bvslt #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(declare-fun b!388704 () Bool)

(assert (=> b!388704 (= e!235506 (= lt!182524 (getCurrentListMapNoExtraKeys!946 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!388705 () Bool)

(assert (=> b!388705 (= e!235506 (isEmpty!548 lt!182524))))

(declare-fun b!388706 () Bool)

(assert (=> b!388706 (= e!235507 e!235502)))

(assert (=> b!388706 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11344 _keys!658)))))

(declare-fun res!222306 () Bool)

(assert (=> b!388706 (= res!222306 (contains!2434 lt!182524 (select (arr!10991 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388706 (=> (not res!222306) (not e!235502))))

(assert (= (and d!72665 c!53953) b!388696))

(assert (= (and d!72665 (not c!53953)) b!388698))

(assert (= (and b!388698 c!53954) b!388695))

(assert (= (and b!388698 (not c!53954)) b!388700))

(assert (= (or b!388695 b!388700) bm!27372))

(assert (= (and d!72665 res!222307) b!388702))

(assert (= (and b!388702 res!222308) b!388703))

(assert (= (and b!388703 res!222309) b!388697))

(assert (= (and b!388703 c!53952) b!388706))

(assert (= (and b!388703 (not c!53952)) b!388699))

(assert (= (and b!388706 res!222306) b!388701))

(assert (= (and b!388699 c!53955) b!388704))

(assert (= (and b!388699 (not c!53955)) b!388705))

(declare-fun b_lambda!8541 () Bool)

(assert (=> (not b_lambda!8541) (not b!388695)))

(assert (=> b!388695 t!11473))

(declare-fun b_and!16153 () Bool)

(assert (= b_and!16151 (and (=> t!11473 result!5705) b_and!16153)))

(declare-fun b_lambda!8543 () Bool)

(assert (=> (not b_lambda!8543) (not b!388701)))

(assert (=> b!388701 t!11473))

(declare-fun b_and!16155 () Bool)

(assert (= b_and!16153 (and (=> t!11473 result!5705) b_and!16155)))

(declare-fun m!384261 () Bool)

(assert (=> b!388705 m!384261))

(declare-fun m!384263 () Bool)

(assert (=> d!72665 m!384263))

(assert (=> d!72665 m!383933))

(assert (=> b!388697 m!384063))

(assert (=> b!388697 m!384063))

(assert (=> b!388697 m!384075))

(assert (=> b!388701 m!384145))

(assert (=> b!388701 m!384143))

(assert (=> b!388701 m!384063))

(declare-fun m!384265 () Bool)

(assert (=> b!388701 m!384265))

(assert (=> b!388701 m!384063))

(assert (=> b!388701 m!384143))

(assert (=> b!388701 m!384145))

(assert (=> b!388701 m!384147))

(declare-fun m!384267 () Bool)

(assert (=> b!388704 m!384267))

(assert (=> bm!27372 m!384267))

(assert (=> b!388698 m!384063))

(assert (=> b!388698 m!384063))

(assert (=> b!388698 m!384075))

(assert (=> b!388706 m!384063))

(assert (=> b!388706 m!384063))

(declare-fun m!384269 () Bool)

(assert (=> b!388706 m!384269))

(declare-fun m!384271 () Bool)

(assert (=> b!388702 m!384271))

(declare-fun m!384273 () Bool)

(assert (=> b!388695 m!384273))

(assert (=> b!388695 m!384145))

(declare-fun m!384275 () Bool)

(assert (=> b!388695 m!384275))

(declare-fun m!384277 () Bool)

(assert (=> b!388695 m!384277))

(declare-fun m!384279 () Bool)

(assert (=> b!388695 m!384279))

(assert (=> b!388695 m!384277))

(assert (=> b!388695 m!384143))

(assert (=> b!388695 m!384063))

(assert (=> b!388695 m!384143))

(assert (=> b!388695 m!384145))

(assert (=> b!388695 m!384147))

(assert (=> b!388418 d!72665))

(declare-fun d!72667 () Bool)

(declare-fun e!235508 () Bool)

(assert (=> d!72667 e!235508))

(declare-fun res!222311 () Bool)

(assert (=> d!72667 (=> (not res!222311) (not e!235508))))

(declare-fun lt!182530 () ListLongMap!5381)

(assert (=> d!72667 (= res!222311 (contains!2434 lt!182530 (_1!3250 (tuple2!6479 k0!778 v!373))))))

(declare-fun lt!182531 () List!6323)

(assert (=> d!72667 (= lt!182530 (ListLongMap!5382 lt!182531))))

(declare-fun lt!182533 () Unit!11896)

(declare-fun lt!182532 () Unit!11896)

(assert (=> d!72667 (= lt!182533 lt!182532)))

(assert (=> d!72667 (= (getValueByKey!354 lt!182531 (_1!3250 (tuple2!6479 k0!778 v!373))) (Some!359 (_2!3250 (tuple2!6479 k0!778 v!373))))))

(assert (=> d!72667 (= lt!182532 (lemmaContainsTupThenGetReturnValue!179 lt!182531 (_1!3250 (tuple2!6479 k0!778 v!373)) (_2!3250 (tuple2!6479 k0!778 v!373))))))

(assert (=> d!72667 (= lt!182531 (insertStrictlySorted!182 (toList!2706 lt!182311) (_1!3250 (tuple2!6479 k0!778 v!373)) (_2!3250 (tuple2!6479 k0!778 v!373))))))

(assert (=> d!72667 (= (+!1026 lt!182311 (tuple2!6479 k0!778 v!373)) lt!182530)))

(declare-fun b!388707 () Bool)

(declare-fun res!222310 () Bool)

(assert (=> b!388707 (=> (not res!222310) (not e!235508))))

(assert (=> b!388707 (= res!222310 (= (getValueByKey!354 (toList!2706 lt!182530) (_1!3250 (tuple2!6479 k0!778 v!373))) (Some!359 (_2!3250 (tuple2!6479 k0!778 v!373)))))))

(declare-fun b!388708 () Bool)

(assert (=> b!388708 (= e!235508 (contains!2435 (toList!2706 lt!182530) (tuple2!6479 k0!778 v!373)))))

(assert (= (and d!72667 res!222311) b!388707))

(assert (= (and b!388707 res!222310) b!388708))

(declare-fun m!384281 () Bool)

(assert (=> d!72667 m!384281))

(declare-fun m!384283 () Bool)

(assert (=> d!72667 m!384283))

(declare-fun m!384285 () Bool)

(assert (=> d!72667 m!384285))

(declare-fun m!384287 () Bool)

(assert (=> d!72667 m!384287))

(declare-fun m!384289 () Bool)

(assert (=> b!388707 m!384289))

(declare-fun m!384291 () Bool)

(assert (=> b!388708 m!384291))

(assert (=> b!388418 d!72667))

(declare-fun condMapEmpty!15951 () Bool)

(declare-fun mapDefault!15951 () ValueCell!4448)

(assert (=> mapNonEmpty!15942 (= condMapEmpty!15951 (= mapRest!15942 ((as const (Array (_ BitVec 32) ValueCell!4448)) mapDefault!15951)))))

(declare-fun e!235514 () Bool)

(declare-fun mapRes!15951 () Bool)

(assert (=> mapNonEmpty!15942 (= tp!31488 (and e!235514 mapRes!15951))))

(declare-fun mapIsEmpty!15951 () Bool)

(assert (=> mapIsEmpty!15951 mapRes!15951))

(declare-fun b!388716 () Bool)

(assert (=> b!388716 (= e!235514 tp_is_empty!9583)))

(declare-fun mapNonEmpty!15951 () Bool)

(declare-fun tp!31503 () Bool)

(declare-fun e!235513 () Bool)

(assert (=> mapNonEmpty!15951 (= mapRes!15951 (and tp!31503 e!235513))))

(declare-fun mapRest!15951 () (Array (_ BitVec 32) ValueCell!4448))

(declare-fun mapValue!15951 () ValueCell!4448)

(declare-fun mapKey!15951 () (_ BitVec 32))

(assert (=> mapNonEmpty!15951 (= mapRest!15942 (store mapRest!15951 mapKey!15951 mapValue!15951))))

(declare-fun b!388715 () Bool)

(assert (=> b!388715 (= e!235513 tp_is_empty!9583)))

(assert (= (and mapNonEmpty!15942 condMapEmpty!15951) mapIsEmpty!15951))

(assert (= (and mapNonEmpty!15942 (not condMapEmpty!15951)) mapNonEmpty!15951))

(assert (= (and mapNonEmpty!15951 ((_ is ValueCellFull!4448) mapValue!15951)) b!388715))

(assert (= (and mapNonEmpty!15942 ((_ is ValueCellFull!4448) mapDefault!15951)) b!388716))

(declare-fun m!384293 () Bool)

(assert (=> mapNonEmpty!15951 m!384293))

(declare-fun b_lambda!8545 () Bool)

(assert (= b_lambda!8539 (or (and start!37816 b_free!8911) b_lambda!8545)))

(declare-fun b_lambda!8547 () Bool)

(assert (= b_lambda!8537 (or (and start!37816 b_free!8911) b_lambda!8547)))

(declare-fun b_lambda!8549 () Bool)

(assert (= b_lambda!8541 (or (and start!37816 b_free!8911) b_lambda!8549)))

(declare-fun b_lambda!8551 () Bool)

(assert (= b_lambda!8533 (or (and start!37816 b_free!8911) b_lambda!8551)))

(declare-fun b_lambda!8553 () Bool)

(assert (= b_lambda!8543 (or (and start!37816 b_free!8911) b_lambda!8553)))

(declare-fun b_lambda!8555 () Bool)

(assert (= b_lambda!8535 (or (and start!37816 b_free!8911) b_lambda!8555)))

(check-sat b_and!16155 (not b!388704) (not b!388685) (not b!388694) (not b!388701) (not b!388650) (not b!388615) (not b!388646) (not b!388613) (not b!388683) (not b!388558) (not bm!27330) (not b!388689) (not b!388638) (not b_lambda!8553) (not b!388690) (not d!72659) (not d!72641) (not bm!27366) (not bm!27363) (not b_lambda!8555) (not b!388693) (not d!72665) (not bm!27349) (not b!388546) (not bm!27371) (not bm!27353) (not b!388557) (not b!388555) (not b!388686) (not b_lambda!8545) (not bm!27361) (not b!388553) (not bm!27372) (not b!388706) (not b!388647) (not bm!27368) (not b!388695) (not b!388519) (not bm!27360) (not bm!27334) (not b!388621) (not b!388655) (not b!388645) (not b!388614) (not bm!27355) (not b!388520) (not d!72663) (not b!388692) (not b!388552) (not b!388702) (not b!388554) (not b!388527) (not b!388551) (not bm!27362) (not b!388609) (not b_lambda!8549) (not b!388707) (not d!72667) (not d!72647) (not b!388641) (not b!388708) tp_is_empty!9583 (not b!388705) (not mapNonEmpty!15951) (not b!388542) (not b!388623) (not b!388636) (not b!388559) (not d!72645) (not b_lambda!8551) (not b_lambda!8547) (not b!388697) (not bm!27333) (not b!388606) (not d!72661) (not b!388561) (not b_next!8911) (not b!388698) (not b!388529) (not d!72643) (not b!388653) (not b!388556) (not b!388563) (not bm!27350) (not b!388618) (not b!388530) (not b!388544) (not d!72657) (not bm!27329))
(check-sat b_and!16155 (not b_next!8911))
