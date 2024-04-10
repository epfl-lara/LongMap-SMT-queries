; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37804 () Bool)

(assert start!37804)

(declare-fun b_free!8907 () Bool)

(declare-fun b_next!8907 () Bool)

(assert (=> start!37804 (= b_free!8907 (not b_next!8907))))

(declare-fun tp!31472 () Bool)

(declare-fun b_and!16149 () Bool)

(assert (=> start!37804 (= tp!31472 b_and!16149)))

(declare-fun b!388396 () Bool)

(declare-fun e!235337 () Bool)

(declare-fun tp_is_empty!9579 () Bool)

(assert (=> b!388396 (= e!235337 tp_is_empty!9579)))

(declare-fun b!388397 () Bool)

(declare-fun res!222119 () Bool)

(declare-fun e!235335 () Bool)

(assert (=> b!388397 (=> (not res!222119) (not e!235335))))

(declare-datatypes ((array!23049 0))(
  ( (array!23050 (arr!10993 (Array (_ BitVec 32) (_ BitVec 64))) (size!11345 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23049)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388397 (= res!222119 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388398 () Bool)

(declare-fun e!235340 () Bool)

(assert (=> b!388398 (= e!235335 e!235340)))

(declare-fun res!222116 () Bool)

(assert (=> b!388398 (=> (not res!222116) (not e!235340))))

(declare-fun lt!182340 () array!23049)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23049 (_ BitVec 32)) Bool)

(assert (=> b!388398 (= res!222116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182340 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388398 (= lt!182340 (array!23050 (store (arr!10993 _keys!658) i!548 k0!778) (size!11345 _keys!658)))))

(declare-fun b!388399 () Bool)

(declare-fun res!222120 () Bool)

(assert (=> b!388399 (=> (not res!222120) (not e!235335))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13877 0))(
  ( (V!13878 (val!4834 Int)) )
))
(declare-datatypes ((ValueCell!4446 0))(
  ( (ValueCellFull!4446 (v!7031 V!13877)) (EmptyCell!4446) )
))
(declare-datatypes ((array!23051 0))(
  ( (array!23052 (arr!10994 (Array (_ BitVec 32) ValueCell!4446)) (size!11346 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23051)

(assert (=> b!388399 (= res!222120 (and (= (size!11346 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11345 _keys!658) (size!11346 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388400 () Bool)

(declare-fun res!222113 () Bool)

(assert (=> b!388400 (=> (not res!222113) (not e!235335))))

(declare-datatypes ((List!6352 0))(
  ( (Nil!6349) (Cons!6348 (h!7204 (_ BitVec 64)) (t!11502 List!6352)) )
))
(declare-fun arrayNoDuplicates!0 (array!23049 (_ BitVec 32) List!6352) Bool)

(assert (=> b!388400 (= res!222113 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6349))))

(declare-fun b!388401 () Bool)

(declare-fun res!222115 () Bool)

(assert (=> b!388401 (=> (not res!222115) (not e!235335))))

(assert (=> b!388401 (= res!222115 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11345 _keys!658))))))

(declare-fun res!222122 () Bool)

(assert (=> start!37804 (=> (not res!222122) (not e!235335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37804 (= res!222122 (validMask!0 mask!970))))

(assert (=> start!37804 e!235335))

(declare-fun e!235339 () Bool)

(declare-fun array_inv!8080 (array!23051) Bool)

(assert (=> start!37804 (and (array_inv!8080 _values!506) e!235339)))

(assert (=> start!37804 tp!31472))

(assert (=> start!37804 true))

(assert (=> start!37804 tp_is_empty!9579))

(declare-fun array_inv!8081 (array!23049) Bool)

(assert (=> start!37804 (array_inv!8081 _keys!658)))

(declare-fun b!388402 () Bool)

(declare-fun res!222114 () Bool)

(assert (=> b!388402 (=> (not res!222114) (not e!235340))))

(assert (=> b!388402 (= res!222114 (arrayNoDuplicates!0 lt!182340 #b00000000000000000000000000000000 Nil!6349))))

(declare-fun b!388403 () Bool)

(declare-fun e!235338 () Bool)

(assert (=> b!388403 (= e!235338 tp_is_empty!9579)))

(declare-fun b!388404 () Bool)

(declare-datatypes ((tuple2!6498 0))(
  ( (tuple2!6499 (_1!3260 (_ BitVec 64)) (_2!3260 V!13877)) )
))
(declare-datatypes ((List!6353 0))(
  ( (Nil!6350) (Cons!6349 (h!7205 tuple2!6498) (t!11503 List!6353)) )
))
(declare-datatypes ((ListLongMap!5411 0))(
  ( (ListLongMap!5412 (toList!2721 List!6353)) )
))
(declare-fun lt!182343 () ListLongMap!5411)

(declare-fun e!235334 () Bool)

(declare-fun lt!182337 () ListLongMap!5411)

(declare-fun zeroValue!472 () V!13877)

(declare-fun minValue!472 () V!13877)

(declare-fun +!1016 (ListLongMap!5411 tuple2!6498) ListLongMap!5411)

(assert (=> b!388404 (= e!235334 (= lt!182337 (+!1016 (+!1016 lt!182343 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!388405 () Bool)

(declare-fun res!222118 () Bool)

(assert (=> b!388405 (=> (not res!222118) (not e!235335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388405 (= res!222118 (validKeyInArray!0 k0!778))))

(declare-fun b!388406 () Bool)

(declare-fun res!222121 () Bool)

(assert (=> b!388406 (=> (not res!222121) (not e!235335))))

(assert (=> b!388406 (= res!222121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388407 () Bool)

(assert (=> b!388407 (= e!235340 (not e!235334))))

(declare-fun res!222112 () Bool)

(assert (=> b!388407 (=> res!222112 e!235334)))

(assert (=> b!388407 (= res!222112 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!182341 () ListLongMap!5411)

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2070 (array!23049 array!23051 (_ BitVec 32) (_ BitVec 32) V!13877 V!13877 (_ BitVec 32) Int) ListLongMap!5411)

(assert (=> b!388407 (= lt!182341 (getCurrentListMap!2070 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182342 () array!23051)

(assert (=> b!388407 (= lt!182337 (getCurrentListMap!2070 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182339 () ListLongMap!5411)

(assert (=> b!388407 (and (= lt!182343 lt!182339) (= lt!182339 lt!182343))))

(declare-fun v!373 () V!13877)

(declare-fun lt!182336 () ListLongMap!5411)

(assert (=> b!388407 (= lt!182339 (+!1016 lt!182336 (tuple2!6499 k0!778 v!373)))))

(declare-datatypes ((Unit!11906 0))(
  ( (Unit!11907) )
))
(declare-fun lt!182338 () Unit!11906)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!234 (array!23049 array!23051 (_ BitVec 32) (_ BitVec 32) V!13877 V!13877 (_ BitVec 32) (_ BitVec 64) V!13877 (_ BitVec 32) Int) Unit!11906)

(assert (=> b!388407 (= lt!182338 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!234 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!950 (array!23049 array!23051 (_ BitVec 32) (_ BitVec 32) V!13877 V!13877 (_ BitVec 32) Int) ListLongMap!5411)

(assert (=> b!388407 (= lt!182343 (getCurrentListMapNoExtraKeys!950 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388407 (= lt!182342 (array!23052 (store (arr!10994 _values!506) i!548 (ValueCellFull!4446 v!373)) (size!11346 _values!506)))))

(assert (=> b!388407 (= lt!182336 (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388408 () Bool)

(declare-fun mapRes!15933 () Bool)

(assert (=> b!388408 (= e!235339 (and e!235338 mapRes!15933))))

(declare-fun condMapEmpty!15933 () Bool)

(declare-fun mapDefault!15933 () ValueCell!4446)

(assert (=> b!388408 (= condMapEmpty!15933 (= (arr!10994 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4446)) mapDefault!15933)))))

(declare-fun mapIsEmpty!15933 () Bool)

(assert (=> mapIsEmpty!15933 mapRes!15933))

(declare-fun mapNonEmpty!15933 () Bool)

(declare-fun tp!31473 () Bool)

(assert (=> mapNonEmpty!15933 (= mapRes!15933 (and tp!31473 e!235337))))

(declare-fun mapValue!15933 () ValueCell!4446)

(declare-fun mapRest!15933 () (Array (_ BitVec 32) ValueCell!4446))

(declare-fun mapKey!15933 () (_ BitVec 32))

(assert (=> mapNonEmpty!15933 (= (arr!10994 _values!506) (store mapRest!15933 mapKey!15933 mapValue!15933))))

(declare-fun b!388409 () Bool)

(declare-fun res!222117 () Bool)

(assert (=> b!388409 (=> (not res!222117) (not e!235335))))

(assert (=> b!388409 (= res!222117 (or (= (select (arr!10993 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10993 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37804 res!222122) b!388399))

(assert (= (and b!388399 res!222120) b!388406))

(assert (= (and b!388406 res!222121) b!388400))

(assert (= (and b!388400 res!222113) b!388401))

(assert (= (and b!388401 res!222115) b!388405))

(assert (= (and b!388405 res!222118) b!388409))

(assert (= (and b!388409 res!222117) b!388397))

(assert (= (and b!388397 res!222119) b!388398))

(assert (= (and b!388398 res!222116) b!388402))

(assert (= (and b!388402 res!222114) b!388407))

(assert (= (and b!388407 (not res!222112)) b!388404))

(assert (= (and b!388408 condMapEmpty!15933) mapIsEmpty!15933))

(assert (= (and b!388408 (not condMapEmpty!15933)) mapNonEmpty!15933))

(get-info :version)

(assert (= (and mapNonEmpty!15933 ((_ is ValueCellFull!4446) mapValue!15933)) b!388396))

(assert (= (and b!388408 ((_ is ValueCellFull!4446) mapDefault!15933)) b!388403))

(assert (= start!37804 b!388408))

(declare-fun m!384333 () Bool)

(assert (=> mapNonEmpty!15933 m!384333))

(declare-fun m!384335 () Bool)

(assert (=> b!388398 m!384335))

(declare-fun m!384337 () Bool)

(assert (=> b!388398 m!384337))

(declare-fun m!384339 () Bool)

(assert (=> b!388405 m!384339))

(declare-fun m!384341 () Bool)

(assert (=> b!388400 m!384341))

(declare-fun m!384343 () Bool)

(assert (=> b!388404 m!384343))

(assert (=> b!388404 m!384343))

(declare-fun m!384345 () Bool)

(assert (=> b!388404 m!384345))

(declare-fun m!384347 () Bool)

(assert (=> b!388407 m!384347))

(declare-fun m!384349 () Bool)

(assert (=> b!388407 m!384349))

(declare-fun m!384351 () Bool)

(assert (=> b!388407 m!384351))

(declare-fun m!384353 () Bool)

(assert (=> b!388407 m!384353))

(declare-fun m!384355 () Bool)

(assert (=> b!388407 m!384355))

(declare-fun m!384357 () Bool)

(assert (=> b!388407 m!384357))

(declare-fun m!384359 () Bool)

(assert (=> b!388407 m!384359))

(declare-fun m!384361 () Bool)

(assert (=> b!388397 m!384361))

(declare-fun m!384363 () Bool)

(assert (=> b!388409 m!384363))

(declare-fun m!384365 () Bool)

(assert (=> start!37804 m!384365))

(declare-fun m!384367 () Bool)

(assert (=> start!37804 m!384367))

(declare-fun m!384369 () Bool)

(assert (=> start!37804 m!384369))

(declare-fun m!384371 () Bool)

(assert (=> b!388402 m!384371))

(declare-fun m!384373 () Bool)

(assert (=> b!388406 m!384373))

(check-sat (not b!388407) (not b!388400) b_and!16149 (not b!388406) (not b!388404) (not b!388397) (not mapNonEmpty!15933) (not b!388402) (not start!37804) (not b!388398) tp_is_empty!9579 (not b_next!8907) (not b!388405))
(check-sat b_and!16149 (not b_next!8907))
(get-model)

(declare-fun d!72799 () Bool)

(assert (=> d!72799 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37804 d!72799))

(declare-fun d!72801 () Bool)

(assert (=> d!72801 (= (array_inv!8080 _values!506) (bvsge (size!11346 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37804 d!72801))

(declare-fun d!72803 () Bool)

(assert (=> d!72803 (= (array_inv!8081 _keys!658) (bvsge (size!11345 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37804 d!72803))

(declare-fun d!72805 () Bool)

(declare-fun res!222160 () Bool)

(declare-fun e!235366 () Bool)

(assert (=> d!72805 (=> res!222160 e!235366)))

(assert (=> d!72805 (= res!222160 (= (select (arr!10993 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72805 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!235366)))

(declare-fun b!388456 () Bool)

(declare-fun e!235367 () Bool)

(assert (=> b!388456 (= e!235366 e!235367)))

(declare-fun res!222161 () Bool)

(assert (=> b!388456 (=> (not res!222161) (not e!235367))))

(assert (=> b!388456 (= res!222161 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11345 _keys!658)))))

(declare-fun b!388457 () Bool)

(assert (=> b!388457 (= e!235367 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72805 (not res!222160)) b!388456))

(assert (= (and b!388456 res!222161) b!388457))

(declare-fun m!384417 () Bool)

(assert (=> d!72805 m!384417))

(declare-fun m!384419 () Bool)

(assert (=> b!388457 m!384419))

(assert (=> b!388397 d!72805))

(declare-fun b!388468 () Bool)

(declare-fun e!235376 () Bool)

(declare-fun e!235377 () Bool)

(assert (=> b!388468 (= e!235376 e!235377)))

(declare-fun res!222170 () Bool)

(assert (=> b!388468 (=> (not res!222170) (not e!235377))))

(declare-fun e!235379 () Bool)

(assert (=> b!388468 (= res!222170 (not e!235379))))

(declare-fun res!222169 () Bool)

(assert (=> b!388468 (=> (not res!222169) (not e!235379))))

(assert (=> b!388468 (= res!222169 (validKeyInArray!0 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)))))

(declare-fun b!388469 () Bool)

(declare-fun e!235378 () Bool)

(assert (=> b!388469 (= e!235377 e!235378)))

(declare-fun c!53927 () Bool)

(assert (=> b!388469 (= c!53927 (validKeyInArray!0 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)))))

(declare-fun bm!27308 () Bool)

(declare-fun call!27311 () Bool)

(assert (=> bm!27308 (= call!27311 (arrayNoDuplicates!0 lt!182340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53927 (Cons!6348 (select (arr!10993 lt!182340) #b00000000000000000000000000000000) Nil!6349) Nil!6349)))))

(declare-fun d!72807 () Bool)

(declare-fun res!222168 () Bool)

(assert (=> d!72807 (=> res!222168 e!235376)))

(assert (=> d!72807 (= res!222168 (bvsge #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(assert (=> d!72807 (= (arrayNoDuplicates!0 lt!182340 #b00000000000000000000000000000000 Nil!6349) e!235376)))

(declare-fun b!388470 () Bool)

(assert (=> b!388470 (= e!235378 call!27311)))

(declare-fun b!388471 () Bool)

(assert (=> b!388471 (= e!235378 call!27311)))

(declare-fun b!388472 () Bool)

(declare-fun contains!2440 (List!6352 (_ BitVec 64)) Bool)

(assert (=> b!388472 (= e!235379 (contains!2440 Nil!6349 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)))))

(assert (= (and d!72807 (not res!222168)) b!388468))

(assert (= (and b!388468 res!222169) b!388472))

(assert (= (and b!388468 res!222170) b!388469))

(assert (= (and b!388469 c!53927) b!388471))

(assert (= (and b!388469 (not c!53927)) b!388470))

(assert (= (or b!388471 b!388470) bm!27308))

(declare-fun m!384421 () Bool)

(assert (=> b!388468 m!384421))

(assert (=> b!388468 m!384421))

(declare-fun m!384423 () Bool)

(assert (=> b!388468 m!384423))

(assert (=> b!388469 m!384421))

(assert (=> b!388469 m!384421))

(assert (=> b!388469 m!384423))

(assert (=> bm!27308 m!384421))

(declare-fun m!384425 () Bool)

(assert (=> bm!27308 m!384425))

(assert (=> b!388472 m!384421))

(assert (=> b!388472 m!384421))

(declare-fun m!384427 () Bool)

(assert (=> b!388472 m!384427))

(assert (=> b!388402 d!72807))

(declare-fun b!388497 () Bool)

(declare-fun e!235395 () ListLongMap!5411)

(declare-fun call!27314 () ListLongMap!5411)

(assert (=> b!388497 (= e!235395 call!27314)))

(declare-fun bm!27311 () Bool)

(assert (=> bm!27311 (= call!27314 (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!388498 () Bool)

(declare-fun e!235399 () ListLongMap!5411)

(assert (=> b!388498 (= e!235399 (ListLongMap!5412 Nil!6350))))

(declare-fun b!388499 () Bool)

(declare-fun e!235396 () Bool)

(declare-fun lt!182388 () ListLongMap!5411)

(declare-fun isEmpty!543 (ListLongMap!5411) Bool)

(assert (=> b!388499 (= e!235396 (isEmpty!543 lt!182388))))

(declare-fun b!388500 () Bool)

(declare-fun res!222180 () Bool)

(declare-fun e!235398 () Bool)

(assert (=> b!388500 (=> (not res!222180) (not e!235398))))

(declare-fun contains!2441 (ListLongMap!5411 (_ BitVec 64)) Bool)

(assert (=> b!388500 (= res!222180 (not (contains!2441 lt!182388 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388501 () Bool)

(declare-fun e!235394 () Bool)

(assert (=> b!388501 (= e!235394 (validKeyInArray!0 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388501 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!388502 () Bool)

(declare-fun e!235400 () Bool)

(assert (=> b!388502 (= e!235400 e!235396)))

(declare-fun c!53939 () Bool)

(assert (=> b!388502 (= c!53939 (bvslt #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(declare-fun b!388503 () Bool)

(assert (=> b!388503 (= e!235398 e!235400)))

(declare-fun c!53937 () Bool)

(assert (=> b!388503 (= c!53937 e!235394)))

(declare-fun res!222181 () Bool)

(assert (=> b!388503 (=> (not res!222181) (not e!235394))))

(assert (=> b!388503 (= res!222181 (bvslt #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(declare-fun b!388504 () Bool)

(assert (=> b!388504 (= e!235399 e!235395)))

(declare-fun c!53938 () Bool)

(assert (=> b!388504 (= c!53938 (validKeyInArray!0 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388505 () Bool)

(assert (=> b!388505 (= e!235396 (= lt!182388 (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun d!72809 () Bool)

(assert (=> d!72809 e!235398))

(declare-fun res!222179 () Bool)

(assert (=> d!72809 (=> (not res!222179) (not e!235398))))

(assert (=> d!72809 (= res!222179 (not (contains!2441 lt!182388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72809 (= lt!182388 e!235399)))

(declare-fun c!53936 () Bool)

(assert (=> d!72809 (= c!53936 (bvsge #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(assert (=> d!72809 (validMask!0 mask!970)))

(assert (=> d!72809 (= (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182388)))

(declare-fun b!388506 () Bool)

(declare-fun e!235397 () Bool)

(assert (=> b!388506 (= e!235400 e!235397)))

(assert (=> b!388506 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(declare-fun res!222182 () Bool)

(assert (=> b!388506 (= res!222182 (contains!2441 lt!182388 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388506 (=> (not res!222182) (not e!235397))))

(declare-fun b!388507 () Bool)

(assert (=> b!388507 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(assert (=> b!388507 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11346 _values!506)))))

(declare-fun apply!297 (ListLongMap!5411 (_ BitVec 64)) V!13877)

(declare-fun get!5563 (ValueCell!4446 V!13877) V!13877)

(declare-fun dynLambda!640 (Int (_ BitVec 64)) V!13877)

(assert (=> b!388507 (= e!235397 (= (apply!297 lt!182388 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)) (get!5563 (select (arr!10994 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!388508 () Bool)

(declare-fun lt!182385 () Unit!11906)

(declare-fun lt!182386 () Unit!11906)

(assert (=> b!388508 (= lt!182385 lt!182386)))

(declare-fun lt!182384 () V!13877)

(declare-fun lt!182387 () (_ BitVec 64))

(declare-fun lt!182383 () ListLongMap!5411)

(declare-fun lt!182382 () (_ BitVec 64))

(assert (=> b!388508 (not (contains!2441 (+!1016 lt!182383 (tuple2!6499 lt!182382 lt!182384)) lt!182387))))

(declare-fun addStillNotContains!130 (ListLongMap!5411 (_ BitVec 64) V!13877 (_ BitVec 64)) Unit!11906)

(assert (=> b!388508 (= lt!182386 (addStillNotContains!130 lt!182383 lt!182382 lt!182384 lt!182387))))

(assert (=> b!388508 (= lt!182387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388508 (= lt!182384 (get!5563 (select (arr!10994 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388508 (= lt!182382 (select (arr!10993 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!388508 (= lt!182383 call!27314)))

(assert (=> b!388508 (= e!235395 (+!1016 call!27314 (tuple2!6499 (select (arr!10993 _keys!658) #b00000000000000000000000000000000) (get!5563 (select (arr!10994 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!72809 c!53936) b!388498))

(assert (= (and d!72809 (not c!53936)) b!388504))

(assert (= (and b!388504 c!53938) b!388508))

(assert (= (and b!388504 (not c!53938)) b!388497))

(assert (= (or b!388508 b!388497) bm!27311))

(assert (= (and d!72809 res!222179) b!388500))

(assert (= (and b!388500 res!222180) b!388503))

(assert (= (and b!388503 res!222181) b!388501))

(assert (= (and b!388503 c!53937) b!388506))

(assert (= (and b!388503 (not c!53937)) b!388502))

(assert (= (and b!388506 res!222182) b!388507))

(assert (= (and b!388502 c!53939) b!388505))

(assert (= (and b!388502 (not c!53939)) b!388499))

(declare-fun b_lambda!8527 () Bool)

(assert (=> (not b_lambda!8527) (not b!388507)))

(declare-fun t!11506 () Bool)

(declare-fun tb!3109 () Bool)

(assert (=> (and start!37804 (= defaultEntry!514 defaultEntry!514) t!11506) tb!3109))

(declare-fun result!5707 () Bool)

(assert (=> tb!3109 (= result!5707 tp_is_empty!9579)))

(assert (=> b!388507 t!11506))

(declare-fun b_and!16153 () Bool)

(assert (= b_and!16149 (and (=> t!11506 result!5707) b_and!16153)))

(declare-fun b_lambda!8529 () Bool)

(assert (=> (not b_lambda!8529) (not b!388508)))

(assert (=> b!388508 t!11506))

(declare-fun b_and!16155 () Bool)

(assert (= b_and!16153 (and (=> t!11506 result!5707) b_and!16155)))

(assert (=> b!388504 m!384417))

(assert (=> b!388504 m!384417))

(declare-fun m!384429 () Bool)

(assert (=> b!388504 m!384429))

(declare-fun m!384431 () Bool)

(assert (=> bm!27311 m!384431))

(assert (=> b!388501 m!384417))

(assert (=> b!388501 m!384417))

(assert (=> b!388501 m!384429))

(declare-fun m!384433 () Bool)

(assert (=> b!388507 m!384433))

(declare-fun m!384435 () Bool)

(assert (=> b!388507 m!384435))

(declare-fun m!384437 () Bool)

(assert (=> b!388507 m!384437))

(assert (=> b!388507 m!384435))

(assert (=> b!388507 m!384433))

(assert (=> b!388507 m!384417))

(declare-fun m!384439 () Bool)

(assert (=> b!388507 m!384439))

(assert (=> b!388507 m!384417))

(assert (=> b!388505 m!384431))

(declare-fun m!384441 () Bool)

(assert (=> d!72809 m!384441))

(assert (=> d!72809 m!384365))

(declare-fun m!384443 () Bool)

(assert (=> b!388499 m!384443))

(declare-fun m!384445 () Bool)

(assert (=> b!388508 m!384445))

(declare-fun m!384447 () Bool)

(assert (=> b!388508 m!384447))

(assert (=> b!388508 m!384445))

(assert (=> b!388508 m!384435))

(assert (=> b!388508 m!384433))

(declare-fun m!384449 () Bool)

(assert (=> b!388508 m!384449))

(assert (=> b!388508 m!384417))

(declare-fun m!384451 () Bool)

(assert (=> b!388508 m!384451))

(assert (=> b!388508 m!384433))

(assert (=> b!388508 m!384435))

(assert (=> b!388508 m!384437))

(declare-fun m!384453 () Bool)

(assert (=> b!388500 m!384453))

(assert (=> b!388506 m!384417))

(assert (=> b!388506 m!384417))

(declare-fun m!384455 () Bool)

(assert (=> b!388506 m!384455))

(assert (=> b!388407 d!72809))

(declare-fun b!388553 () Bool)

(declare-fun e!235427 () Bool)

(declare-fun lt!182448 () ListLongMap!5411)

(assert (=> b!388553 (= e!235427 (= (apply!297 lt!182448 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27326 () Bool)

(declare-fun call!27333 () Bool)

(assert (=> bm!27326 (= call!27333 (contains!2441 lt!182448 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388554 () Bool)

(declare-fun e!235438 () ListLongMap!5411)

(declare-fun call!27329 () ListLongMap!5411)

(assert (=> b!388554 (= e!235438 call!27329)))

(declare-fun bm!27327 () Bool)

(declare-fun call!27332 () ListLongMap!5411)

(declare-fun call!27335 () ListLongMap!5411)

(assert (=> bm!27327 (= call!27332 call!27335)))

(declare-fun b!388555 () Bool)

(declare-fun e!235431 () Bool)

(declare-fun call!27331 () Bool)

(assert (=> b!388555 (= e!235431 (not call!27331))))

(declare-fun b!388556 () Bool)

(declare-fun res!222203 () Bool)

(declare-fun e!235430 () Bool)

(assert (=> b!388556 (=> (not res!222203) (not e!235430))))

(assert (=> b!388556 (= res!222203 e!235431)))

(declare-fun c!53952 () Bool)

(assert (=> b!388556 (= c!53952 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!53957 () Bool)

(declare-fun call!27334 () ListLongMap!5411)

(declare-fun call!27330 () ListLongMap!5411)

(declare-fun c!53956 () Bool)

(declare-fun bm!27328 () Bool)

(assert (=> bm!27328 (= call!27334 (+!1016 (ite c!53957 call!27330 (ite c!53956 call!27335 call!27332)) (ite (or c!53957 c!53956) (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!388557 () Bool)

(declare-fun e!235435 () ListLongMap!5411)

(assert (=> b!388557 (= e!235435 call!27329)))

(declare-fun b!388558 () Bool)

(declare-fun e!235433 () ListLongMap!5411)

(assert (=> b!388558 (= e!235433 (+!1016 call!27334 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!388559 () Bool)

(declare-fun c!53954 () Bool)

(assert (=> b!388559 (= c!53954 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!388559 (= e!235438 e!235435)))

(declare-fun b!388561 () Bool)

(declare-fun e!235432 () Unit!11906)

(declare-fun Unit!11910 () Unit!11906)

(assert (=> b!388561 (= e!235432 Unit!11910)))

(declare-fun b!388562 () Bool)

(declare-fun e!235437 () Bool)

(assert (=> b!388562 (= e!235430 e!235437)))

(declare-fun c!53953 () Bool)

(assert (=> b!388562 (= c!53953 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27329 () Bool)

(assert (=> bm!27329 (= call!27335 call!27330)))

(declare-fun e!235434 () Bool)

(declare-fun b!388563 () Bool)

(assert (=> b!388563 (= e!235434 (= (apply!297 lt!182448 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)) (get!5563 (select (arr!10994 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388563 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11346 _values!506)))))

(assert (=> b!388563 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(declare-fun b!388564 () Bool)

(declare-fun e!235439 () Bool)

(assert (=> b!388564 (= e!235439 (= (apply!297 lt!182448 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27330 () Bool)

(assert (=> bm!27330 (= call!27329 call!27334)))

(declare-fun b!388565 () Bool)

(assert (=> b!388565 (= e!235435 call!27332)))

(declare-fun b!388566 () Bool)

(assert (=> b!388566 (= e!235433 e!235438)))

(assert (=> b!388566 (= c!53956 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388567 () Bool)

(declare-fun e!235436 () Bool)

(assert (=> b!388567 (= e!235436 e!235434)))

(declare-fun res!222206 () Bool)

(assert (=> b!388567 (=> (not res!222206) (not e!235434))))

(assert (=> b!388567 (= res!222206 (contains!2441 lt!182448 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388567 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(declare-fun b!388568 () Bool)

(declare-fun e!235429 () Bool)

(assert (=> b!388568 (= e!235429 (validKeyInArray!0 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388569 () Bool)

(assert (=> b!388569 (= e!235437 e!235427)))

(declare-fun res!222205 () Bool)

(assert (=> b!388569 (= res!222205 call!27333)))

(assert (=> b!388569 (=> (not res!222205) (not e!235427))))

(declare-fun bm!27331 () Bool)

(assert (=> bm!27331 (= call!27331 (contains!2441 lt!182448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27332 () Bool)

(assert (=> bm!27332 (= call!27330 (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388570 () Bool)

(declare-fun e!235428 () Bool)

(assert (=> b!388570 (= e!235428 (validKeyInArray!0 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72811 () Bool)

(assert (=> d!72811 e!235430))

(declare-fun res!222204 () Bool)

(assert (=> d!72811 (=> (not res!222204) (not e!235430))))

(assert (=> d!72811 (= res!222204 (or (bvsge #b00000000000000000000000000000000 (size!11345 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 _keys!658)))))))

(declare-fun lt!182440 () ListLongMap!5411)

(assert (=> d!72811 (= lt!182448 lt!182440)))

(declare-fun lt!182443 () Unit!11906)

(assert (=> d!72811 (= lt!182443 e!235432)))

(declare-fun c!53955 () Bool)

(assert (=> d!72811 (= c!53955 e!235428)))

(declare-fun res!222202 () Bool)

(assert (=> d!72811 (=> (not res!222202) (not e!235428))))

(assert (=> d!72811 (= res!222202 (bvslt #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(assert (=> d!72811 (= lt!182440 e!235433)))

(assert (=> d!72811 (= c!53957 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72811 (validMask!0 mask!970)))

(assert (=> d!72811 (= (getCurrentListMap!2070 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182448)))

(declare-fun b!388560 () Bool)

(declare-fun lt!182453 () Unit!11906)

(assert (=> b!388560 (= e!235432 lt!182453)))

(declare-fun lt!182454 () ListLongMap!5411)

(assert (=> b!388560 (= lt!182454 (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182433 () (_ BitVec 64))

(assert (=> b!388560 (= lt!182433 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182449 () (_ BitVec 64))

(assert (=> b!388560 (= lt!182449 (select (arr!10993 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182439 () Unit!11906)

(declare-fun addStillContains!273 (ListLongMap!5411 (_ BitVec 64) V!13877 (_ BitVec 64)) Unit!11906)

(assert (=> b!388560 (= lt!182439 (addStillContains!273 lt!182454 lt!182433 zeroValue!472 lt!182449))))

(assert (=> b!388560 (contains!2441 (+!1016 lt!182454 (tuple2!6499 lt!182433 zeroValue!472)) lt!182449)))

(declare-fun lt!182437 () Unit!11906)

(assert (=> b!388560 (= lt!182437 lt!182439)))

(declare-fun lt!182446 () ListLongMap!5411)

(assert (=> b!388560 (= lt!182446 (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182436 () (_ BitVec 64))

(assert (=> b!388560 (= lt!182436 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182445 () (_ BitVec 64))

(assert (=> b!388560 (= lt!182445 (select (arr!10993 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182435 () Unit!11906)

(declare-fun addApplyDifferent!273 (ListLongMap!5411 (_ BitVec 64) V!13877 (_ BitVec 64)) Unit!11906)

(assert (=> b!388560 (= lt!182435 (addApplyDifferent!273 lt!182446 lt!182436 minValue!472 lt!182445))))

(assert (=> b!388560 (= (apply!297 (+!1016 lt!182446 (tuple2!6499 lt!182436 minValue!472)) lt!182445) (apply!297 lt!182446 lt!182445))))

(declare-fun lt!182442 () Unit!11906)

(assert (=> b!388560 (= lt!182442 lt!182435)))

(declare-fun lt!182441 () ListLongMap!5411)

(assert (=> b!388560 (= lt!182441 (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182444 () (_ BitVec 64))

(assert (=> b!388560 (= lt!182444 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182434 () (_ BitVec 64))

(assert (=> b!388560 (= lt!182434 (select (arr!10993 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182452 () Unit!11906)

(assert (=> b!388560 (= lt!182452 (addApplyDifferent!273 lt!182441 lt!182444 zeroValue!472 lt!182434))))

(assert (=> b!388560 (= (apply!297 (+!1016 lt!182441 (tuple2!6499 lt!182444 zeroValue!472)) lt!182434) (apply!297 lt!182441 lt!182434))))

(declare-fun lt!182451 () Unit!11906)

(assert (=> b!388560 (= lt!182451 lt!182452)))

(declare-fun lt!182447 () ListLongMap!5411)

(assert (=> b!388560 (= lt!182447 (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182438 () (_ BitVec 64))

(assert (=> b!388560 (= lt!182438 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182450 () (_ BitVec 64))

(assert (=> b!388560 (= lt!182450 (select (arr!10993 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!388560 (= lt!182453 (addApplyDifferent!273 lt!182447 lt!182438 minValue!472 lt!182450))))

(assert (=> b!388560 (= (apply!297 (+!1016 lt!182447 (tuple2!6499 lt!182438 minValue!472)) lt!182450) (apply!297 lt!182447 lt!182450))))

(declare-fun b!388571 () Bool)

(assert (=> b!388571 (= e!235437 (not call!27333))))

(declare-fun b!388572 () Bool)

(declare-fun res!222209 () Bool)

(assert (=> b!388572 (=> (not res!222209) (not e!235430))))

(assert (=> b!388572 (= res!222209 e!235436)))

(declare-fun res!222208 () Bool)

(assert (=> b!388572 (=> res!222208 e!235436)))

(assert (=> b!388572 (= res!222208 (not e!235429))))

(declare-fun res!222207 () Bool)

(assert (=> b!388572 (=> (not res!222207) (not e!235429))))

(assert (=> b!388572 (= res!222207 (bvslt #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(declare-fun b!388573 () Bool)

(assert (=> b!388573 (= e!235431 e!235439)))

(declare-fun res!222201 () Bool)

(assert (=> b!388573 (= res!222201 call!27331)))

(assert (=> b!388573 (=> (not res!222201) (not e!235439))))

(assert (= (and d!72811 c!53957) b!388558))

(assert (= (and d!72811 (not c!53957)) b!388566))

(assert (= (and b!388566 c!53956) b!388554))

(assert (= (and b!388566 (not c!53956)) b!388559))

(assert (= (and b!388559 c!53954) b!388557))

(assert (= (and b!388559 (not c!53954)) b!388565))

(assert (= (or b!388557 b!388565) bm!27327))

(assert (= (or b!388554 bm!27327) bm!27329))

(assert (= (or b!388554 b!388557) bm!27330))

(assert (= (or b!388558 bm!27329) bm!27332))

(assert (= (or b!388558 bm!27330) bm!27328))

(assert (= (and d!72811 res!222202) b!388570))

(assert (= (and d!72811 c!53955) b!388560))

(assert (= (and d!72811 (not c!53955)) b!388561))

(assert (= (and d!72811 res!222204) b!388572))

(assert (= (and b!388572 res!222207) b!388568))

(assert (= (and b!388572 (not res!222208)) b!388567))

(assert (= (and b!388567 res!222206) b!388563))

(assert (= (and b!388572 res!222209) b!388556))

(assert (= (and b!388556 c!53952) b!388573))

(assert (= (and b!388556 (not c!53952)) b!388555))

(assert (= (and b!388573 res!222201) b!388564))

(assert (= (or b!388573 b!388555) bm!27331))

(assert (= (and b!388556 res!222203) b!388562))

(assert (= (and b!388562 c!53953) b!388569))

(assert (= (and b!388562 (not c!53953)) b!388571))

(assert (= (and b!388569 res!222205) b!388553))

(assert (= (or b!388569 b!388571) bm!27326))

(declare-fun b_lambda!8531 () Bool)

(assert (=> (not b_lambda!8531) (not b!388563)))

(assert (=> b!388563 t!11506))

(declare-fun b_and!16157 () Bool)

(assert (= b_and!16155 (and (=> t!11506 result!5707) b_and!16157)))

(assert (=> b!388568 m!384417))

(assert (=> b!388568 m!384417))

(assert (=> b!388568 m!384429))

(assert (=> b!388570 m!384417))

(assert (=> b!388570 m!384417))

(assert (=> b!388570 m!384429))

(declare-fun m!384457 () Bool)

(assert (=> b!388553 m!384457))

(assert (=> bm!27332 m!384351))

(assert (=> b!388567 m!384417))

(assert (=> b!388567 m!384417))

(declare-fun m!384459 () Bool)

(assert (=> b!388567 m!384459))

(declare-fun m!384461 () Bool)

(assert (=> b!388558 m!384461))

(declare-fun m!384463 () Bool)

(assert (=> b!388560 m!384463))

(declare-fun m!384465 () Bool)

(assert (=> b!388560 m!384465))

(declare-fun m!384467 () Bool)

(assert (=> b!388560 m!384467))

(declare-fun m!384469 () Bool)

(assert (=> b!388560 m!384469))

(assert (=> b!388560 m!384465))

(declare-fun m!384471 () Bool)

(assert (=> b!388560 m!384471))

(assert (=> b!388560 m!384417))

(declare-fun m!384473 () Bool)

(assert (=> b!388560 m!384473))

(declare-fun m!384475 () Bool)

(assert (=> b!388560 m!384475))

(declare-fun m!384477 () Bool)

(assert (=> b!388560 m!384477))

(declare-fun m!384479 () Bool)

(assert (=> b!388560 m!384479))

(assert (=> b!388560 m!384473))

(declare-fun m!384481 () Bool)

(assert (=> b!388560 m!384481))

(assert (=> b!388560 m!384351))

(declare-fun m!384483 () Bool)

(assert (=> b!388560 m!384483))

(declare-fun m!384485 () Bool)

(assert (=> b!388560 m!384485))

(declare-fun m!384487 () Bool)

(assert (=> b!388560 m!384487))

(assert (=> b!388560 m!384485))

(assert (=> b!388560 m!384477))

(declare-fun m!384489 () Bool)

(assert (=> b!388560 m!384489))

(declare-fun m!384491 () Bool)

(assert (=> b!388560 m!384491))

(assert (=> d!72811 m!384365))

(declare-fun m!384493 () Bool)

(assert (=> b!388564 m!384493))

(declare-fun m!384495 () Bool)

(assert (=> bm!27328 m!384495))

(assert (=> b!388563 m!384433))

(assert (=> b!388563 m!384417))

(assert (=> b!388563 m!384433))

(assert (=> b!388563 m!384435))

(assert (=> b!388563 m!384437))

(assert (=> b!388563 m!384435))

(assert (=> b!388563 m!384417))

(declare-fun m!384497 () Bool)

(assert (=> b!388563 m!384497))

(declare-fun m!384499 () Bool)

(assert (=> bm!27331 m!384499))

(declare-fun m!384501 () Bool)

(assert (=> bm!27326 m!384501))

(assert (=> b!388407 d!72811))

(declare-fun d!72813 () Bool)

(declare-fun e!235442 () Bool)

(assert (=> d!72813 e!235442))

(declare-fun res!222215 () Bool)

(assert (=> d!72813 (=> (not res!222215) (not e!235442))))

(declare-fun lt!182465 () ListLongMap!5411)

(assert (=> d!72813 (= res!222215 (contains!2441 lt!182465 (_1!3260 (tuple2!6499 k0!778 v!373))))))

(declare-fun lt!182463 () List!6353)

(assert (=> d!72813 (= lt!182465 (ListLongMap!5412 lt!182463))))

(declare-fun lt!182464 () Unit!11906)

(declare-fun lt!182466 () Unit!11906)

(assert (=> d!72813 (= lt!182464 lt!182466)))

(declare-datatypes ((Option!361 0))(
  ( (Some!360 (v!7036 V!13877)) (None!359) )
))
(declare-fun getValueByKey!355 (List!6353 (_ BitVec 64)) Option!361)

(assert (=> d!72813 (= (getValueByKey!355 lt!182463 (_1!3260 (tuple2!6499 k0!778 v!373))) (Some!360 (_2!3260 (tuple2!6499 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!177 (List!6353 (_ BitVec 64) V!13877) Unit!11906)

(assert (=> d!72813 (= lt!182466 (lemmaContainsTupThenGetReturnValue!177 lt!182463 (_1!3260 (tuple2!6499 k0!778 v!373)) (_2!3260 (tuple2!6499 k0!778 v!373))))))

(declare-fun insertStrictlySorted!180 (List!6353 (_ BitVec 64) V!13877) List!6353)

(assert (=> d!72813 (= lt!182463 (insertStrictlySorted!180 (toList!2721 lt!182336) (_1!3260 (tuple2!6499 k0!778 v!373)) (_2!3260 (tuple2!6499 k0!778 v!373))))))

(assert (=> d!72813 (= (+!1016 lt!182336 (tuple2!6499 k0!778 v!373)) lt!182465)))

(declare-fun b!388578 () Bool)

(declare-fun res!222214 () Bool)

(assert (=> b!388578 (=> (not res!222214) (not e!235442))))

(assert (=> b!388578 (= res!222214 (= (getValueByKey!355 (toList!2721 lt!182465) (_1!3260 (tuple2!6499 k0!778 v!373))) (Some!360 (_2!3260 (tuple2!6499 k0!778 v!373)))))))

(declare-fun b!388579 () Bool)

(declare-fun contains!2442 (List!6353 tuple2!6498) Bool)

(assert (=> b!388579 (= e!235442 (contains!2442 (toList!2721 lt!182465) (tuple2!6499 k0!778 v!373)))))

(assert (= (and d!72813 res!222215) b!388578))

(assert (= (and b!388578 res!222214) b!388579))

(declare-fun m!384503 () Bool)

(assert (=> d!72813 m!384503))

(declare-fun m!384505 () Bool)

(assert (=> d!72813 m!384505))

(declare-fun m!384507 () Bool)

(assert (=> d!72813 m!384507))

(declare-fun m!384509 () Bool)

(assert (=> d!72813 m!384509))

(declare-fun m!384511 () Bool)

(assert (=> b!388578 m!384511))

(declare-fun m!384513 () Bool)

(assert (=> b!388579 m!384513))

(assert (=> b!388407 d!72813))

(declare-fun bm!27337 () Bool)

(declare-fun call!27340 () ListLongMap!5411)

(assert (=> bm!27337 (= call!27340 (getCurrentListMapNoExtraKeys!950 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388586 () Bool)

(declare-fun e!235447 () Bool)

(declare-fun call!27341 () ListLongMap!5411)

(assert (=> b!388586 (= e!235447 (= call!27341 (+!1016 call!27340 (tuple2!6499 k0!778 v!373))))))

(declare-fun d!72815 () Bool)

(declare-fun e!235448 () Bool)

(assert (=> d!72815 e!235448))

(declare-fun res!222218 () Bool)

(assert (=> d!72815 (=> (not res!222218) (not e!235448))))

(assert (=> d!72815 (= res!222218 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11345 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11346 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11345 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11346 _values!506))))))))

(declare-fun lt!182469 () Unit!11906)

(declare-fun choose!1311 (array!23049 array!23051 (_ BitVec 32) (_ BitVec 32) V!13877 V!13877 (_ BitVec 32) (_ BitVec 64) V!13877 (_ BitVec 32) Int) Unit!11906)

(assert (=> d!72815 (= lt!182469 (choose!1311 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(assert (=> d!72815 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!234 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!182469)))

(declare-fun bm!27338 () Bool)

(assert (=> bm!27338 (= call!27341 (getCurrentListMapNoExtraKeys!950 (array!23050 (store (arr!10993 _keys!658) i!548 k0!778) (size!11345 _keys!658)) (array!23052 (store (arr!10994 _values!506) i!548 (ValueCellFull!4446 v!373)) (size!11346 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388587 () Bool)

(assert (=> b!388587 (= e!235448 e!235447)))

(declare-fun c!53960 () Bool)

(assert (=> b!388587 (= c!53960 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!388588 () Bool)

(assert (=> b!388588 (= e!235447 (= call!27341 call!27340))))

(assert (= (and d!72815 res!222218) b!388587))

(assert (= (and b!388587 c!53960) b!388586))

(assert (= (and b!388587 (not c!53960)) b!388588))

(assert (= (or b!388586 b!388588) bm!27337))

(assert (= (or b!388586 b!388588) bm!27338))

(assert (=> bm!27337 m!384351))

(declare-fun m!384515 () Bool)

(assert (=> b!388586 m!384515))

(declare-fun m!384517 () Bool)

(assert (=> d!72815 m!384517))

(assert (=> bm!27338 m!384337))

(assert (=> bm!27338 m!384359))

(declare-fun m!384519 () Bool)

(assert (=> bm!27338 m!384519))

(assert (=> b!388407 d!72815))

(declare-fun b!388589 () Bool)

(declare-fun e!235450 () ListLongMap!5411)

(declare-fun call!27342 () ListLongMap!5411)

(assert (=> b!388589 (= e!235450 call!27342)))

(declare-fun bm!27339 () Bool)

(assert (=> bm!27339 (= call!27342 (getCurrentListMapNoExtraKeys!950 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!388590 () Bool)

(declare-fun e!235454 () ListLongMap!5411)

(assert (=> b!388590 (= e!235454 (ListLongMap!5412 Nil!6350))))

(declare-fun b!388591 () Bool)

(declare-fun e!235451 () Bool)

(declare-fun lt!182476 () ListLongMap!5411)

(assert (=> b!388591 (= e!235451 (isEmpty!543 lt!182476))))

(declare-fun b!388592 () Bool)

(declare-fun res!222220 () Bool)

(declare-fun e!235453 () Bool)

(assert (=> b!388592 (=> (not res!222220) (not e!235453))))

(assert (=> b!388592 (= res!222220 (not (contains!2441 lt!182476 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388593 () Bool)

(declare-fun e!235449 () Bool)

(assert (=> b!388593 (= e!235449 (validKeyInArray!0 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)))))

(assert (=> b!388593 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!388594 () Bool)

(declare-fun e!235455 () Bool)

(assert (=> b!388594 (= e!235455 e!235451)))

(declare-fun c!53964 () Bool)

(assert (=> b!388594 (= c!53964 (bvslt #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(declare-fun b!388595 () Bool)

(assert (=> b!388595 (= e!235453 e!235455)))

(declare-fun c!53962 () Bool)

(assert (=> b!388595 (= c!53962 e!235449)))

(declare-fun res!222221 () Bool)

(assert (=> b!388595 (=> (not res!222221) (not e!235449))))

(assert (=> b!388595 (= res!222221 (bvslt #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(declare-fun b!388596 () Bool)

(assert (=> b!388596 (= e!235454 e!235450)))

(declare-fun c!53963 () Bool)

(assert (=> b!388596 (= c!53963 (validKeyInArray!0 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)))))

(declare-fun b!388597 () Bool)

(assert (=> b!388597 (= e!235451 (= lt!182476 (getCurrentListMapNoExtraKeys!950 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun d!72817 () Bool)

(assert (=> d!72817 e!235453))

(declare-fun res!222219 () Bool)

(assert (=> d!72817 (=> (not res!222219) (not e!235453))))

(assert (=> d!72817 (= res!222219 (not (contains!2441 lt!182476 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72817 (= lt!182476 e!235454)))

(declare-fun c!53961 () Bool)

(assert (=> d!72817 (= c!53961 (bvsge #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(assert (=> d!72817 (validMask!0 mask!970)))

(assert (=> d!72817 (= (getCurrentListMapNoExtraKeys!950 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182476)))

(declare-fun b!388598 () Bool)

(declare-fun e!235452 () Bool)

(assert (=> b!388598 (= e!235455 e!235452)))

(assert (=> b!388598 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(declare-fun res!222222 () Bool)

(assert (=> b!388598 (= res!222222 (contains!2441 lt!182476 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)))))

(assert (=> b!388598 (=> (not res!222222) (not e!235452))))

(declare-fun b!388599 () Bool)

(assert (=> b!388599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(assert (=> b!388599 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11346 lt!182342)))))

(assert (=> b!388599 (= e!235452 (= (apply!297 lt!182476 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)) (get!5563 (select (arr!10994 lt!182342) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!388600 () Bool)

(declare-fun lt!182473 () Unit!11906)

(declare-fun lt!182474 () Unit!11906)

(assert (=> b!388600 (= lt!182473 lt!182474)))

(declare-fun lt!182475 () (_ BitVec 64))

(declare-fun lt!182471 () ListLongMap!5411)

(declare-fun lt!182470 () (_ BitVec 64))

(declare-fun lt!182472 () V!13877)

(assert (=> b!388600 (not (contains!2441 (+!1016 lt!182471 (tuple2!6499 lt!182470 lt!182472)) lt!182475))))

(assert (=> b!388600 (= lt!182474 (addStillNotContains!130 lt!182471 lt!182470 lt!182472 lt!182475))))

(assert (=> b!388600 (= lt!182475 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388600 (= lt!182472 (get!5563 (select (arr!10994 lt!182342) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388600 (= lt!182470 (select (arr!10993 lt!182340) #b00000000000000000000000000000000))))

(assert (=> b!388600 (= lt!182471 call!27342)))

(assert (=> b!388600 (= e!235450 (+!1016 call!27342 (tuple2!6499 (select (arr!10993 lt!182340) #b00000000000000000000000000000000) (get!5563 (select (arr!10994 lt!182342) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!72817 c!53961) b!388590))

(assert (= (and d!72817 (not c!53961)) b!388596))

(assert (= (and b!388596 c!53963) b!388600))

(assert (= (and b!388596 (not c!53963)) b!388589))

(assert (= (or b!388600 b!388589) bm!27339))

(assert (= (and d!72817 res!222219) b!388592))

(assert (= (and b!388592 res!222220) b!388595))

(assert (= (and b!388595 res!222221) b!388593))

(assert (= (and b!388595 c!53962) b!388598))

(assert (= (and b!388595 (not c!53962)) b!388594))

(assert (= (and b!388598 res!222222) b!388599))

(assert (= (and b!388594 c!53964) b!388597))

(assert (= (and b!388594 (not c!53964)) b!388591))

(declare-fun b_lambda!8533 () Bool)

(assert (=> (not b_lambda!8533) (not b!388599)))

(assert (=> b!388599 t!11506))

(declare-fun b_and!16159 () Bool)

(assert (= b_and!16157 (and (=> t!11506 result!5707) b_and!16159)))

(declare-fun b_lambda!8535 () Bool)

(assert (=> (not b_lambda!8535) (not b!388600)))

(assert (=> b!388600 t!11506))

(declare-fun b_and!16161 () Bool)

(assert (= b_and!16159 (and (=> t!11506 result!5707) b_and!16161)))

(assert (=> b!388596 m!384421))

(assert (=> b!388596 m!384421))

(assert (=> b!388596 m!384423))

(declare-fun m!384521 () Bool)

(assert (=> bm!27339 m!384521))

(assert (=> b!388593 m!384421))

(assert (=> b!388593 m!384421))

(assert (=> b!388593 m!384423))

(declare-fun m!384523 () Bool)

(assert (=> b!388599 m!384523))

(assert (=> b!388599 m!384435))

(declare-fun m!384525 () Bool)

(assert (=> b!388599 m!384525))

(assert (=> b!388599 m!384435))

(assert (=> b!388599 m!384523))

(assert (=> b!388599 m!384421))

(declare-fun m!384527 () Bool)

(assert (=> b!388599 m!384527))

(assert (=> b!388599 m!384421))

(assert (=> b!388597 m!384521))

(declare-fun m!384529 () Bool)

(assert (=> d!72817 m!384529))

(assert (=> d!72817 m!384365))

(declare-fun m!384531 () Bool)

(assert (=> b!388591 m!384531))

(declare-fun m!384533 () Bool)

(assert (=> b!388600 m!384533))

(declare-fun m!384535 () Bool)

(assert (=> b!388600 m!384535))

(assert (=> b!388600 m!384533))

(assert (=> b!388600 m!384435))

(assert (=> b!388600 m!384523))

(declare-fun m!384537 () Bool)

(assert (=> b!388600 m!384537))

(assert (=> b!388600 m!384421))

(declare-fun m!384539 () Bool)

(assert (=> b!388600 m!384539))

(assert (=> b!388600 m!384523))

(assert (=> b!388600 m!384435))

(assert (=> b!388600 m!384525))

(declare-fun m!384541 () Bool)

(assert (=> b!388592 m!384541))

(assert (=> b!388598 m!384421))

(assert (=> b!388598 m!384421))

(declare-fun m!384543 () Bool)

(assert (=> b!388598 m!384543))

(assert (=> b!388407 d!72817))

(declare-fun b!388601 () Bool)

(declare-fun e!235456 () Bool)

(declare-fun lt!182492 () ListLongMap!5411)

(assert (=> b!388601 (= e!235456 (= (apply!297 lt!182492 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27340 () Bool)

(declare-fun call!27347 () Bool)

(assert (=> bm!27340 (= call!27347 (contains!2441 lt!182492 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388602 () Bool)

(declare-fun e!235467 () ListLongMap!5411)

(declare-fun call!27343 () ListLongMap!5411)

(assert (=> b!388602 (= e!235467 call!27343)))

(declare-fun bm!27341 () Bool)

(declare-fun call!27346 () ListLongMap!5411)

(declare-fun call!27349 () ListLongMap!5411)

(assert (=> bm!27341 (= call!27346 call!27349)))

(declare-fun b!388603 () Bool)

(declare-fun e!235460 () Bool)

(declare-fun call!27345 () Bool)

(assert (=> b!388603 (= e!235460 (not call!27345))))

(declare-fun b!388604 () Bool)

(declare-fun res!222225 () Bool)

(declare-fun e!235459 () Bool)

(assert (=> b!388604 (=> (not res!222225) (not e!235459))))

(assert (=> b!388604 (= res!222225 e!235460)))

(declare-fun c!53965 () Bool)

(assert (=> b!388604 (= c!53965 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!53970 () Bool)

(declare-fun call!27348 () ListLongMap!5411)

(declare-fun c!53969 () Bool)

(declare-fun bm!27342 () Bool)

(declare-fun call!27344 () ListLongMap!5411)

(assert (=> bm!27342 (= call!27348 (+!1016 (ite c!53970 call!27344 (ite c!53969 call!27349 call!27346)) (ite (or c!53970 c!53969) (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!388605 () Bool)

(declare-fun e!235464 () ListLongMap!5411)

(assert (=> b!388605 (= e!235464 call!27343)))

(declare-fun b!388606 () Bool)

(declare-fun e!235462 () ListLongMap!5411)

(assert (=> b!388606 (= e!235462 (+!1016 call!27348 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!388607 () Bool)

(declare-fun c!53967 () Bool)

(assert (=> b!388607 (= c!53967 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!388607 (= e!235467 e!235464)))

(declare-fun b!388609 () Bool)

(declare-fun e!235461 () Unit!11906)

(declare-fun Unit!11911 () Unit!11906)

(assert (=> b!388609 (= e!235461 Unit!11911)))

(declare-fun b!388610 () Bool)

(declare-fun e!235466 () Bool)

(assert (=> b!388610 (= e!235459 e!235466)))

(declare-fun c!53966 () Bool)

(assert (=> b!388610 (= c!53966 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27343 () Bool)

(assert (=> bm!27343 (= call!27349 call!27344)))

(declare-fun e!235463 () Bool)

(declare-fun b!388611 () Bool)

(assert (=> b!388611 (= e!235463 (= (apply!297 lt!182492 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)) (get!5563 (select (arr!10994 lt!182342) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11346 lt!182342)))))

(assert (=> b!388611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(declare-fun b!388612 () Bool)

(declare-fun e!235468 () Bool)

(assert (=> b!388612 (= e!235468 (= (apply!297 lt!182492 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27344 () Bool)

(assert (=> bm!27344 (= call!27343 call!27348)))

(declare-fun b!388613 () Bool)

(assert (=> b!388613 (= e!235464 call!27346)))

(declare-fun b!388614 () Bool)

(assert (=> b!388614 (= e!235462 e!235467)))

(assert (=> b!388614 (= c!53969 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388615 () Bool)

(declare-fun e!235465 () Bool)

(assert (=> b!388615 (= e!235465 e!235463)))

(declare-fun res!222228 () Bool)

(assert (=> b!388615 (=> (not res!222228) (not e!235463))))

(assert (=> b!388615 (= res!222228 (contains!2441 lt!182492 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)))))

(assert (=> b!388615 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(declare-fun b!388616 () Bool)

(declare-fun e!235458 () Bool)

(assert (=> b!388616 (= e!235458 (validKeyInArray!0 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)))))

(declare-fun b!388617 () Bool)

(assert (=> b!388617 (= e!235466 e!235456)))

(declare-fun res!222227 () Bool)

(assert (=> b!388617 (= res!222227 call!27347)))

(assert (=> b!388617 (=> (not res!222227) (not e!235456))))

(declare-fun bm!27345 () Bool)

(assert (=> bm!27345 (= call!27345 (contains!2441 lt!182492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27346 () Bool)

(assert (=> bm!27346 (= call!27344 (getCurrentListMapNoExtraKeys!950 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388618 () Bool)

(declare-fun e!235457 () Bool)

(assert (=> b!388618 (= e!235457 (validKeyInArray!0 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)))))

(declare-fun d!72819 () Bool)

(assert (=> d!72819 e!235459))

(declare-fun res!222226 () Bool)

(assert (=> d!72819 (=> (not res!222226) (not e!235459))))

(assert (=> d!72819 (= res!222226 (or (bvsge #b00000000000000000000000000000000 (size!11345 lt!182340)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11345 lt!182340)))))))

(declare-fun lt!182484 () ListLongMap!5411)

(assert (=> d!72819 (= lt!182492 lt!182484)))

(declare-fun lt!182487 () Unit!11906)

(assert (=> d!72819 (= lt!182487 e!235461)))

(declare-fun c!53968 () Bool)

(assert (=> d!72819 (= c!53968 e!235457)))

(declare-fun res!222224 () Bool)

(assert (=> d!72819 (=> (not res!222224) (not e!235457))))

(assert (=> d!72819 (= res!222224 (bvslt #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(assert (=> d!72819 (= lt!182484 e!235462)))

(assert (=> d!72819 (= c!53970 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72819 (validMask!0 mask!970)))

(assert (=> d!72819 (= (getCurrentListMap!2070 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182492)))

(declare-fun b!388608 () Bool)

(declare-fun lt!182497 () Unit!11906)

(assert (=> b!388608 (= e!235461 lt!182497)))

(declare-fun lt!182498 () ListLongMap!5411)

(assert (=> b!388608 (= lt!182498 (getCurrentListMapNoExtraKeys!950 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182477 () (_ BitVec 64))

(assert (=> b!388608 (= lt!182477 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182493 () (_ BitVec 64))

(assert (=> b!388608 (= lt!182493 (select (arr!10993 lt!182340) #b00000000000000000000000000000000))))

(declare-fun lt!182483 () Unit!11906)

(assert (=> b!388608 (= lt!182483 (addStillContains!273 lt!182498 lt!182477 zeroValue!472 lt!182493))))

(assert (=> b!388608 (contains!2441 (+!1016 lt!182498 (tuple2!6499 lt!182477 zeroValue!472)) lt!182493)))

(declare-fun lt!182481 () Unit!11906)

(assert (=> b!388608 (= lt!182481 lt!182483)))

(declare-fun lt!182490 () ListLongMap!5411)

(assert (=> b!388608 (= lt!182490 (getCurrentListMapNoExtraKeys!950 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182480 () (_ BitVec 64))

(assert (=> b!388608 (= lt!182480 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182489 () (_ BitVec 64))

(assert (=> b!388608 (= lt!182489 (select (arr!10993 lt!182340) #b00000000000000000000000000000000))))

(declare-fun lt!182479 () Unit!11906)

(assert (=> b!388608 (= lt!182479 (addApplyDifferent!273 lt!182490 lt!182480 minValue!472 lt!182489))))

(assert (=> b!388608 (= (apply!297 (+!1016 lt!182490 (tuple2!6499 lt!182480 minValue!472)) lt!182489) (apply!297 lt!182490 lt!182489))))

(declare-fun lt!182486 () Unit!11906)

(assert (=> b!388608 (= lt!182486 lt!182479)))

(declare-fun lt!182485 () ListLongMap!5411)

(assert (=> b!388608 (= lt!182485 (getCurrentListMapNoExtraKeys!950 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182488 () (_ BitVec 64))

(assert (=> b!388608 (= lt!182488 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182478 () (_ BitVec 64))

(assert (=> b!388608 (= lt!182478 (select (arr!10993 lt!182340) #b00000000000000000000000000000000))))

(declare-fun lt!182496 () Unit!11906)

(assert (=> b!388608 (= lt!182496 (addApplyDifferent!273 lt!182485 lt!182488 zeroValue!472 lt!182478))))

(assert (=> b!388608 (= (apply!297 (+!1016 lt!182485 (tuple2!6499 lt!182488 zeroValue!472)) lt!182478) (apply!297 lt!182485 lt!182478))))

(declare-fun lt!182495 () Unit!11906)

(assert (=> b!388608 (= lt!182495 lt!182496)))

(declare-fun lt!182491 () ListLongMap!5411)

(assert (=> b!388608 (= lt!182491 (getCurrentListMapNoExtraKeys!950 lt!182340 lt!182342 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182482 () (_ BitVec 64))

(assert (=> b!388608 (= lt!182482 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182494 () (_ BitVec 64))

(assert (=> b!388608 (= lt!182494 (select (arr!10993 lt!182340) #b00000000000000000000000000000000))))

(assert (=> b!388608 (= lt!182497 (addApplyDifferent!273 lt!182491 lt!182482 minValue!472 lt!182494))))

(assert (=> b!388608 (= (apply!297 (+!1016 lt!182491 (tuple2!6499 lt!182482 minValue!472)) lt!182494) (apply!297 lt!182491 lt!182494))))

(declare-fun b!388619 () Bool)

(assert (=> b!388619 (= e!235466 (not call!27347))))

(declare-fun b!388620 () Bool)

(declare-fun res!222231 () Bool)

(assert (=> b!388620 (=> (not res!222231) (not e!235459))))

(assert (=> b!388620 (= res!222231 e!235465)))

(declare-fun res!222230 () Bool)

(assert (=> b!388620 (=> res!222230 e!235465)))

(assert (=> b!388620 (= res!222230 (not e!235458))))

(declare-fun res!222229 () Bool)

(assert (=> b!388620 (=> (not res!222229) (not e!235458))))

(assert (=> b!388620 (= res!222229 (bvslt #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(declare-fun b!388621 () Bool)

(assert (=> b!388621 (= e!235460 e!235468)))

(declare-fun res!222223 () Bool)

(assert (=> b!388621 (= res!222223 call!27345)))

(assert (=> b!388621 (=> (not res!222223) (not e!235468))))

(assert (= (and d!72819 c!53970) b!388606))

(assert (= (and d!72819 (not c!53970)) b!388614))

(assert (= (and b!388614 c!53969) b!388602))

(assert (= (and b!388614 (not c!53969)) b!388607))

(assert (= (and b!388607 c!53967) b!388605))

(assert (= (and b!388607 (not c!53967)) b!388613))

(assert (= (or b!388605 b!388613) bm!27341))

(assert (= (or b!388602 bm!27341) bm!27343))

(assert (= (or b!388602 b!388605) bm!27344))

(assert (= (or b!388606 bm!27343) bm!27346))

(assert (= (or b!388606 bm!27344) bm!27342))

(assert (= (and d!72819 res!222224) b!388618))

(assert (= (and d!72819 c!53968) b!388608))

(assert (= (and d!72819 (not c!53968)) b!388609))

(assert (= (and d!72819 res!222226) b!388620))

(assert (= (and b!388620 res!222229) b!388616))

(assert (= (and b!388620 (not res!222230)) b!388615))

(assert (= (and b!388615 res!222228) b!388611))

(assert (= (and b!388620 res!222231) b!388604))

(assert (= (and b!388604 c!53965) b!388621))

(assert (= (and b!388604 (not c!53965)) b!388603))

(assert (= (and b!388621 res!222223) b!388612))

(assert (= (or b!388621 b!388603) bm!27345))

(assert (= (and b!388604 res!222225) b!388610))

(assert (= (and b!388610 c!53966) b!388617))

(assert (= (and b!388610 (not c!53966)) b!388619))

(assert (= (and b!388617 res!222227) b!388601))

(assert (= (or b!388617 b!388619) bm!27340))

(declare-fun b_lambda!8537 () Bool)

(assert (=> (not b_lambda!8537) (not b!388611)))

(assert (=> b!388611 t!11506))

(declare-fun b_and!16163 () Bool)

(assert (= b_and!16161 (and (=> t!11506 result!5707) b_and!16163)))

(assert (=> b!388616 m!384421))

(assert (=> b!388616 m!384421))

(assert (=> b!388616 m!384423))

(assert (=> b!388618 m!384421))

(assert (=> b!388618 m!384421))

(assert (=> b!388618 m!384423))

(declare-fun m!384545 () Bool)

(assert (=> b!388601 m!384545))

(assert (=> bm!27346 m!384349))

(assert (=> b!388615 m!384421))

(assert (=> b!388615 m!384421))

(declare-fun m!384547 () Bool)

(assert (=> b!388615 m!384547))

(declare-fun m!384549 () Bool)

(assert (=> b!388606 m!384549))

(declare-fun m!384551 () Bool)

(assert (=> b!388608 m!384551))

(declare-fun m!384553 () Bool)

(assert (=> b!388608 m!384553))

(declare-fun m!384555 () Bool)

(assert (=> b!388608 m!384555))

(declare-fun m!384557 () Bool)

(assert (=> b!388608 m!384557))

(assert (=> b!388608 m!384553))

(declare-fun m!384559 () Bool)

(assert (=> b!388608 m!384559))

(assert (=> b!388608 m!384421))

(declare-fun m!384561 () Bool)

(assert (=> b!388608 m!384561))

(declare-fun m!384563 () Bool)

(assert (=> b!388608 m!384563))

(declare-fun m!384565 () Bool)

(assert (=> b!388608 m!384565))

(declare-fun m!384567 () Bool)

(assert (=> b!388608 m!384567))

(assert (=> b!388608 m!384561))

(declare-fun m!384569 () Bool)

(assert (=> b!388608 m!384569))

(assert (=> b!388608 m!384349))

(declare-fun m!384571 () Bool)

(assert (=> b!388608 m!384571))

(declare-fun m!384573 () Bool)

(assert (=> b!388608 m!384573))

(declare-fun m!384575 () Bool)

(assert (=> b!388608 m!384575))

(assert (=> b!388608 m!384573))

(assert (=> b!388608 m!384565))

(declare-fun m!384577 () Bool)

(assert (=> b!388608 m!384577))

(declare-fun m!384579 () Bool)

(assert (=> b!388608 m!384579))

(assert (=> d!72819 m!384365))

(declare-fun m!384581 () Bool)

(assert (=> b!388612 m!384581))

(declare-fun m!384583 () Bool)

(assert (=> bm!27342 m!384583))

(assert (=> b!388611 m!384523))

(assert (=> b!388611 m!384421))

(assert (=> b!388611 m!384523))

(assert (=> b!388611 m!384435))

(assert (=> b!388611 m!384525))

(assert (=> b!388611 m!384435))

(assert (=> b!388611 m!384421))

(declare-fun m!384585 () Bool)

(assert (=> b!388611 m!384585))

(declare-fun m!384587 () Bool)

(assert (=> bm!27345 m!384587))

(declare-fun m!384589 () Bool)

(assert (=> bm!27340 m!384589))

(assert (=> b!388407 d!72819))

(declare-fun b!388630 () Bool)

(declare-fun e!235477 () Bool)

(declare-fun call!27352 () Bool)

(assert (=> b!388630 (= e!235477 call!27352)))

(declare-fun b!388631 () Bool)

(declare-fun e!235476 () Bool)

(assert (=> b!388631 (= e!235476 call!27352)))

(declare-fun bm!27349 () Bool)

(assert (=> bm!27349 (= call!27352 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!388633 () Bool)

(declare-fun e!235475 () Bool)

(assert (=> b!388633 (= e!235475 e!235476)))

(declare-fun c!53973 () Bool)

(assert (=> b!388633 (= c!53973 (validKeyInArray!0 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388632 () Bool)

(assert (=> b!388632 (= e!235476 e!235477)))

(declare-fun lt!182505 () (_ BitVec 64))

(assert (=> b!388632 (= lt!182505 (select (arr!10993 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182506 () Unit!11906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23049 (_ BitVec 64) (_ BitVec 32)) Unit!11906)

(assert (=> b!388632 (= lt!182506 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!182505 #b00000000000000000000000000000000))))

(assert (=> b!388632 (arrayContainsKey!0 _keys!658 lt!182505 #b00000000000000000000000000000000)))

(declare-fun lt!182507 () Unit!11906)

(assert (=> b!388632 (= lt!182507 lt!182506)))

(declare-fun res!222236 () Bool)

(declare-datatypes ((SeekEntryResult!3508 0))(
  ( (MissingZero!3508 (index!16211 (_ BitVec 32))) (Found!3508 (index!16212 (_ BitVec 32))) (Intermediate!3508 (undefined!4320 Bool) (index!16213 (_ BitVec 32)) (x!38181 (_ BitVec 32))) (Undefined!3508) (MissingVacant!3508 (index!16214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23049 (_ BitVec 32)) SeekEntryResult!3508)

(assert (=> b!388632 (= res!222236 (= (seekEntryOrOpen!0 (select (arr!10993 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3508 #b00000000000000000000000000000000)))))

(assert (=> b!388632 (=> (not res!222236) (not e!235477))))

(declare-fun d!72821 () Bool)

(declare-fun res!222237 () Bool)

(assert (=> d!72821 (=> res!222237 e!235475)))

(assert (=> d!72821 (= res!222237 (bvsge #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(assert (=> d!72821 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!235475)))

(assert (= (and d!72821 (not res!222237)) b!388633))

(assert (= (and b!388633 c!53973) b!388632))

(assert (= (and b!388633 (not c!53973)) b!388631))

(assert (= (and b!388632 res!222236) b!388630))

(assert (= (or b!388630 b!388631) bm!27349))

(declare-fun m!384591 () Bool)

(assert (=> bm!27349 m!384591))

(assert (=> b!388633 m!384417))

(assert (=> b!388633 m!384417))

(assert (=> b!388633 m!384429))

(assert (=> b!388632 m!384417))

(declare-fun m!384593 () Bool)

(assert (=> b!388632 m!384593))

(declare-fun m!384595 () Bool)

(assert (=> b!388632 m!384595))

(assert (=> b!388632 m!384417))

(declare-fun m!384597 () Bool)

(assert (=> b!388632 m!384597))

(assert (=> b!388406 d!72821))

(declare-fun b!388634 () Bool)

(declare-fun e!235478 () Bool)

(declare-fun e!235479 () Bool)

(assert (=> b!388634 (= e!235478 e!235479)))

(declare-fun res!222240 () Bool)

(assert (=> b!388634 (=> (not res!222240) (not e!235479))))

(declare-fun e!235481 () Bool)

(assert (=> b!388634 (= res!222240 (not e!235481))))

(declare-fun res!222239 () Bool)

(assert (=> b!388634 (=> (not res!222239) (not e!235481))))

(assert (=> b!388634 (= res!222239 (validKeyInArray!0 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388635 () Bool)

(declare-fun e!235480 () Bool)

(assert (=> b!388635 (= e!235479 e!235480)))

(declare-fun c!53974 () Bool)

(assert (=> b!388635 (= c!53974 (validKeyInArray!0 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27350 () Bool)

(declare-fun call!27353 () Bool)

(assert (=> bm!27350 (= call!27353 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53974 (Cons!6348 (select (arr!10993 _keys!658) #b00000000000000000000000000000000) Nil!6349) Nil!6349)))))

(declare-fun d!72823 () Bool)

(declare-fun res!222238 () Bool)

(assert (=> d!72823 (=> res!222238 e!235478)))

(assert (=> d!72823 (= res!222238 (bvsge #b00000000000000000000000000000000 (size!11345 _keys!658)))))

(assert (=> d!72823 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6349) e!235478)))

(declare-fun b!388636 () Bool)

(assert (=> b!388636 (= e!235480 call!27353)))

(declare-fun b!388637 () Bool)

(assert (=> b!388637 (= e!235480 call!27353)))

(declare-fun b!388638 () Bool)

(assert (=> b!388638 (= e!235481 (contains!2440 Nil!6349 (select (arr!10993 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72823 (not res!222238)) b!388634))

(assert (= (and b!388634 res!222239) b!388638))

(assert (= (and b!388634 res!222240) b!388635))

(assert (= (and b!388635 c!53974) b!388637))

(assert (= (and b!388635 (not c!53974)) b!388636))

(assert (= (or b!388637 b!388636) bm!27350))

(assert (=> b!388634 m!384417))

(assert (=> b!388634 m!384417))

(assert (=> b!388634 m!384429))

(assert (=> b!388635 m!384417))

(assert (=> b!388635 m!384417))

(assert (=> b!388635 m!384429))

(assert (=> bm!27350 m!384417))

(declare-fun m!384599 () Bool)

(assert (=> bm!27350 m!384599))

(assert (=> b!388638 m!384417))

(assert (=> b!388638 m!384417))

(declare-fun m!384601 () Bool)

(assert (=> b!388638 m!384601))

(assert (=> b!388400 d!72823))

(declare-fun d!72825 () Bool)

(assert (=> d!72825 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388405 d!72825))

(declare-fun d!72827 () Bool)

(declare-fun e!235482 () Bool)

(assert (=> d!72827 e!235482))

(declare-fun res!222242 () Bool)

(assert (=> d!72827 (=> (not res!222242) (not e!235482))))

(declare-fun lt!182510 () ListLongMap!5411)

(assert (=> d!72827 (= res!222242 (contains!2441 lt!182510 (_1!3260 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun lt!182508 () List!6353)

(assert (=> d!72827 (= lt!182510 (ListLongMap!5412 lt!182508))))

(declare-fun lt!182509 () Unit!11906)

(declare-fun lt!182511 () Unit!11906)

(assert (=> d!72827 (= lt!182509 lt!182511)))

(assert (=> d!72827 (= (getValueByKey!355 lt!182508 (_1!3260 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!360 (_2!3260 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (=> d!72827 (= lt!182511 (lemmaContainsTupThenGetReturnValue!177 lt!182508 (_1!3260 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3260 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (=> d!72827 (= lt!182508 (insertStrictlySorted!180 (toList!2721 (+!1016 lt!182343 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (_1!3260 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3260 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (=> d!72827 (= (+!1016 (+!1016 lt!182343 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) lt!182510)))

(declare-fun b!388639 () Bool)

(declare-fun res!222241 () Bool)

(assert (=> b!388639 (=> (not res!222241) (not e!235482))))

(assert (=> b!388639 (= res!222241 (= (getValueByKey!355 (toList!2721 lt!182510) (_1!3260 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!360 (_2!3260 (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))))

(declare-fun b!388640 () Bool)

(assert (=> b!388640 (= e!235482 (contains!2442 (toList!2721 lt!182510) (tuple2!6499 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72827 res!222242) b!388639))

(assert (= (and b!388639 res!222241) b!388640))

(declare-fun m!384603 () Bool)

(assert (=> d!72827 m!384603))

(declare-fun m!384605 () Bool)

(assert (=> d!72827 m!384605))

(declare-fun m!384607 () Bool)

(assert (=> d!72827 m!384607))

(declare-fun m!384609 () Bool)

(assert (=> d!72827 m!384609))

(declare-fun m!384611 () Bool)

(assert (=> b!388639 m!384611))

(declare-fun m!384613 () Bool)

(assert (=> b!388640 m!384613))

(assert (=> b!388404 d!72827))

(declare-fun d!72829 () Bool)

(declare-fun e!235483 () Bool)

(assert (=> d!72829 e!235483))

(declare-fun res!222244 () Bool)

(assert (=> d!72829 (=> (not res!222244) (not e!235483))))

(declare-fun lt!182514 () ListLongMap!5411)

(assert (=> d!72829 (= res!222244 (contains!2441 lt!182514 (_1!3260 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun lt!182512 () List!6353)

(assert (=> d!72829 (= lt!182514 (ListLongMap!5412 lt!182512))))

(declare-fun lt!182513 () Unit!11906)

(declare-fun lt!182515 () Unit!11906)

(assert (=> d!72829 (= lt!182513 lt!182515)))

(assert (=> d!72829 (= (getValueByKey!355 lt!182512 (_1!3260 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!360 (_2!3260 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72829 (= lt!182515 (lemmaContainsTupThenGetReturnValue!177 lt!182512 (_1!3260 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3260 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72829 (= lt!182512 (insertStrictlySorted!180 (toList!2721 lt!182343) (_1!3260 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3260 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72829 (= (+!1016 lt!182343 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) lt!182514)))

(declare-fun b!388641 () Bool)

(declare-fun res!222243 () Bool)

(assert (=> b!388641 (=> (not res!222243) (not e!235483))))

(assert (=> b!388641 (= res!222243 (= (getValueByKey!355 (toList!2721 lt!182514) (_1!3260 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!360 (_2!3260 (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))))

(declare-fun b!388642 () Bool)

(assert (=> b!388642 (= e!235483 (contains!2442 (toList!2721 lt!182514) (tuple2!6499 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))

(assert (= (and d!72829 res!222244) b!388641))

(assert (= (and b!388641 res!222243) b!388642))

(declare-fun m!384615 () Bool)

(assert (=> d!72829 m!384615))

(declare-fun m!384617 () Bool)

(assert (=> d!72829 m!384617))

(declare-fun m!384619 () Bool)

(assert (=> d!72829 m!384619))

(declare-fun m!384621 () Bool)

(assert (=> d!72829 m!384621))

(declare-fun m!384623 () Bool)

(assert (=> b!388641 m!384623))

(declare-fun m!384625 () Bool)

(assert (=> b!388642 m!384625))

(assert (=> b!388404 d!72829))

(declare-fun b!388643 () Bool)

(declare-fun e!235486 () Bool)

(declare-fun call!27354 () Bool)

(assert (=> b!388643 (= e!235486 call!27354)))

(declare-fun b!388644 () Bool)

(declare-fun e!235485 () Bool)

(assert (=> b!388644 (= e!235485 call!27354)))

(declare-fun bm!27351 () Bool)

(assert (=> bm!27351 (= call!27354 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!182340 mask!970))))

(declare-fun b!388646 () Bool)

(declare-fun e!235484 () Bool)

(assert (=> b!388646 (= e!235484 e!235485)))

(declare-fun c!53975 () Bool)

(assert (=> b!388646 (= c!53975 (validKeyInArray!0 (select (arr!10993 lt!182340) #b00000000000000000000000000000000)))))

(declare-fun b!388645 () Bool)

(assert (=> b!388645 (= e!235485 e!235486)))

(declare-fun lt!182516 () (_ BitVec 64))

(assert (=> b!388645 (= lt!182516 (select (arr!10993 lt!182340) #b00000000000000000000000000000000))))

(declare-fun lt!182517 () Unit!11906)

(assert (=> b!388645 (= lt!182517 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!182340 lt!182516 #b00000000000000000000000000000000))))

(assert (=> b!388645 (arrayContainsKey!0 lt!182340 lt!182516 #b00000000000000000000000000000000)))

(declare-fun lt!182518 () Unit!11906)

(assert (=> b!388645 (= lt!182518 lt!182517)))

(declare-fun res!222245 () Bool)

(assert (=> b!388645 (= res!222245 (= (seekEntryOrOpen!0 (select (arr!10993 lt!182340) #b00000000000000000000000000000000) lt!182340 mask!970) (Found!3508 #b00000000000000000000000000000000)))))

(assert (=> b!388645 (=> (not res!222245) (not e!235486))))

(declare-fun d!72831 () Bool)

(declare-fun res!222246 () Bool)

(assert (=> d!72831 (=> res!222246 e!235484)))

(assert (=> d!72831 (= res!222246 (bvsge #b00000000000000000000000000000000 (size!11345 lt!182340)))))

(assert (=> d!72831 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182340 mask!970) e!235484)))

(assert (= (and d!72831 (not res!222246)) b!388646))

(assert (= (and b!388646 c!53975) b!388645))

(assert (= (and b!388646 (not c!53975)) b!388644))

(assert (= (and b!388645 res!222245) b!388643))

(assert (= (or b!388643 b!388644) bm!27351))

(declare-fun m!384627 () Bool)

(assert (=> bm!27351 m!384627))

(assert (=> b!388646 m!384421))

(assert (=> b!388646 m!384421))

(assert (=> b!388646 m!384423))

(assert (=> b!388645 m!384421))

(declare-fun m!384629 () Bool)

(assert (=> b!388645 m!384629))

(declare-fun m!384631 () Bool)

(assert (=> b!388645 m!384631))

(assert (=> b!388645 m!384421))

(declare-fun m!384633 () Bool)

(assert (=> b!388645 m!384633))

(assert (=> b!388398 d!72831))

(declare-fun condMapEmpty!15939 () Bool)

(declare-fun mapDefault!15939 () ValueCell!4446)

(assert (=> mapNonEmpty!15933 (= condMapEmpty!15939 (= mapRest!15933 ((as const (Array (_ BitVec 32) ValueCell!4446)) mapDefault!15939)))))

(declare-fun e!235492 () Bool)

(declare-fun mapRes!15939 () Bool)

(assert (=> mapNonEmpty!15933 (= tp!31473 (and e!235492 mapRes!15939))))

(declare-fun b!388654 () Bool)

(assert (=> b!388654 (= e!235492 tp_is_empty!9579)))

(declare-fun b!388653 () Bool)

(declare-fun e!235491 () Bool)

(assert (=> b!388653 (= e!235491 tp_is_empty!9579)))

(declare-fun mapNonEmpty!15939 () Bool)

(declare-fun tp!31482 () Bool)

(assert (=> mapNonEmpty!15939 (= mapRes!15939 (and tp!31482 e!235491))))

(declare-fun mapRest!15939 () (Array (_ BitVec 32) ValueCell!4446))

(declare-fun mapValue!15939 () ValueCell!4446)

(declare-fun mapKey!15939 () (_ BitVec 32))

(assert (=> mapNonEmpty!15939 (= mapRest!15933 (store mapRest!15939 mapKey!15939 mapValue!15939))))

(declare-fun mapIsEmpty!15939 () Bool)

(assert (=> mapIsEmpty!15939 mapRes!15939))

(assert (= (and mapNonEmpty!15933 condMapEmpty!15939) mapIsEmpty!15939))

(assert (= (and mapNonEmpty!15933 (not condMapEmpty!15939)) mapNonEmpty!15939))

(assert (= (and mapNonEmpty!15939 ((_ is ValueCellFull!4446) mapValue!15939)) b!388653))

(assert (= (and mapNonEmpty!15933 ((_ is ValueCellFull!4446) mapDefault!15939)) b!388654))

(declare-fun m!384635 () Bool)

(assert (=> mapNonEmpty!15939 m!384635))

(declare-fun b_lambda!8539 () Bool)

(assert (= b_lambda!8537 (or (and start!37804 b_free!8907) b_lambda!8539)))

(declare-fun b_lambda!8541 () Bool)

(assert (= b_lambda!8527 (or (and start!37804 b_free!8907) b_lambda!8541)))

(declare-fun b_lambda!8543 () Bool)

(assert (= b_lambda!8535 (or (and start!37804 b_free!8907) b_lambda!8543)))

(declare-fun b_lambda!8545 () Bool)

(assert (= b_lambda!8529 (or (and start!37804 b_free!8907) b_lambda!8545)))

(declare-fun b_lambda!8547 () Bool)

(assert (= b_lambda!8533 (or (and start!37804 b_free!8907) b_lambda!8547)))

(declare-fun b_lambda!8549 () Bool)

(assert (= b_lambda!8531 (or (and start!37804 b_free!8907) b_lambda!8549)))

(check-sat (not d!72819) (not d!72811) (not b!388564) (not b!388618) (not b_lambda!8549) (not bm!27331) (not b!388505) (not b!388600) (not bm!27326) (not b!388601) (not bm!27349) (not b!388615) (not b!388642) (not d!72809) (not b!388469) (not b!388608) (not bm!27351) (not b!388597) (not b!388599) (not bm!27328) (not bm!27337) (not b!388560) (not d!72829) (not bm!27308) (not b!388611) (not b!388568) (not d!72813) (not bm!27311) (not b!388504) (not b!388570) (not b!388596) (not d!72815) (not b!388508) (not b!388592) (not bm!27340) (not b!388501) (not b!388468) (not b!388598) (not b_lambda!8541) (not b!388506) (not b!388507) (not b_lambda!8547) (not bm!27350) (not bm!27342) (not b!388638) (not b!388612) (not b!388640) (not b!388553) (not bm!27339) (not b!388586) (not b_lambda!8545) (not b!388616) (not b!388593) (not b!388641) (not b!388563) (not b!388646) (not b!388472) (not b!388578) (not bm!27332) (not mapNonEmpty!15939) (not b!388457) (not b!388500) (not b!388633) (not d!72827) (not d!72817) (not b!388499) (not b!388645) tp_is_empty!9579 (not b!388635) (not b!388639) (not b!388579) (not b!388567) b_and!16163 (not bm!27345) (not bm!27338) (not b_next!8907) (not b!388558) (not b!388634) (not bm!27346) (not b!388632) (not b_lambda!8539) (not b!388606) (not b_lambda!8543) (not b!388591))
(check-sat b_and!16163 (not b_next!8907))
