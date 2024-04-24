; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37788 () Bool)

(assert start!37788)

(declare-fun b_free!8905 () Bool)

(declare-fun b_next!8905 () Bool)

(assert (=> start!37788 (= b_free!8905 (not b_next!8905))))

(declare-fun tp!31466 () Bool)

(declare-fun b_and!16161 () Bool)

(assert (=> start!37788 (= tp!31466 b_and!16161)))

(declare-fun b!388305 () Bool)

(declare-fun e!235282 () Bool)

(declare-fun e!235286 () Bool)

(assert (=> b!388305 (= e!235282 e!235286)))

(declare-fun res!222076 () Bool)

(assert (=> b!388305 (=> (not res!222076) (not e!235286))))

(declare-datatypes ((array!23030 0))(
  ( (array!23031 (arr!10983 (Array (_ BitVec 32) (_ BitVec 64))) (size!11335 (_ BitVec 32))) )
))
(declare-fun lt!182331 () array!23030)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23030 (_ BitVec 32)) Bool)

(assert (=> b!388305 (= res!222076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182331 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23030)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388305 (= lt!182331 (array!23031 (store (arr!10983 _keys!658) i!548 k0!778) (size!11335 _keys!658)))))

(declare-fun b!388306 () Bool)

(declare-fun e!235283 () Bool)

(declare-fun tp_is_empty!9577 () Bool)

(assert (=> b!388306 (= e!235283 tp_is_empty!9577)))

(declare-fun b!388307 () Bool)

(declare-fun res!222082 () Bool)

(assert (=> b!388307 (=> (not res!222082) (not e!235282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388307 (= res!222082 (validKeyInArray!0 k0!778))))

(declare-fun b!388308 () Bool)

(declare-fun res!222077 () Bool)

(assert (=> b!388308 (=> (not res!222077) (not e!235282))))

(declare-datatypes ((List!6210 0))(
  ( (Nil!6207) (Cons!6206 (h!7062 (_ BitVec 64)) (t!11352 List!6210)) )
))
(declare-fun arrayNoDuplicates!0 (array!23030 (_ BitVec 32) List!6210) Bool)

(assert (=> b!388308 (= res!222077 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6207))))

(declare-fun mapIsEmpty!15930 () Bool)

(declare-fun mapRes!15930 () Bool)

(assert (=> mapIsEmpty!15930 mapRes!15930))

(declare-fun b!388309 () Bool)

(declare-fun res!222079 () Bool)

(assert (=> b!388309 (=> (not res!222079) (not e!235282))))

(assert (=> b!388309 (= res!222079 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11335 _keys!658))))))

(declare-fun b!388310 () Bool)

(declare-fun res!222084 () Bool)

(assert (=> b!388310 (=> (not res!222084) (not e!235282))))

(assert (=> b!388310 (= res!222084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!222078 () Bool)

(assert (=> start!37788 (=> (not res!222078) (not e!235282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37788 (= res!222078 (validMask!0 mask!970))))

(assert (=> start!37788 e!235282))

(declare-datatypes ((V!13875 0))(
  ( (V!13876 (val!4833 Int)) )
))
(declare-datatypes ((ValueCell!4445 0))(
  ( (ValueCellFull!4445 (v!7031 V!13875)) (EmptyCell!4445) )
))
(declare-datatypes ((array!23032 0))(
  ( (array!23033 (arr!10984 (Array (_ BitVec 32) ValueCell!4445)) (size!11336 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23032)

(declare-fun e!235287 () Bool)

(declare-fun array_inv!8116 (array!23032) Bool)

(assert (=> start!37788 (and (array_inv!8116 _values!506) e!235287)))

(assert (=> start!37788 tp!31466))

(assert (=> start!37788 true))

(assert (=> start!37788 tp_is_empty!9577))

(declare-fun array_inv!8117 (array!23030) Bool)

(assert (=> start!37788 (array_inv!8117 _keys!658)))

(declare-fun mapNonEmpty!15930 () Bool)

(declare-fun tp!31467 () Bool)

(assert (=> mapNonEmpty!15930 (= mapRes!15930 (and tp!31467 e!235283))))

(declare-fun mapValue!15930 () ValueCell!4445)

(declare-fun mapKey!15930 () (_ BitVec 32))

(declare-fun mapRest!15930 () (Array (_ BitVec 32) ValueCell!4445))

(assert (=> mapNonEmpty!15930 (= (arr!10984 _values!506) (store mapRest!15930 mapKey!15930 mapValue!15930))))

(declare-fun b!388311 () Bool)

(declare-fun res!222081 () Bool)

(assert (=> b!388311 (=> (not res!222081) (not e!235286))))

(assert (=> b!388311 (= res!222081 (arrayNoDuplicates!0 lt!182331 #b00000000000000000000000000000000 Nil!6207))))

(declare-fun b!388312 () Bool)

(declare-fun res!222085 () Bool)

(assert (=> b!388312 (=> (not res!222085) (not e!235282))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!388312 (= res!222085 (and (= (size!11336 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11335 _keys!658) (size!11336 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388313 () Bool)

(declare-fun e!235285 () Bool)

(assert (=> b!388313 (= e!235285 tp_is_empty!9577)))

(declare-fun b!388314 () Bool)

(declare-datatypes ((tuple2!6358 0))(
  ( (tuple2!6359 (_1!3190 (_ BitVec 64)) (_2!3190 V!13875)) )
))
(declare-datatypes ((List!6211 0))(
  ( (Nil!6208) (Cons!6207 (h!7063 tuple2!6358) (t!11353 List!6211)) )
))
(declare-datatypes ((ListLongMap!5273 0))(
  ( (ListLongMap!5274 (toList!2652 List!6211)) )
))
(declare-fun lt!182333 () ListLongMap!5273)

(declare-fun lt!182335 () ListLongMap!5273)

(declare-fun e!235284 () Bool)

(declare-fun zeroValue!472 () V!13875)

(declare-fun minValue!472 () V!13875)

(declare-fun +!1006 (ListLongMap!5273 tuple2!6358) ListLongMap!5273)

(assert (=> b!388314 (= e!235284 (= lt!182335 (+!1006 (+!1006 lt!182333 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!388315 () Bool)

(declare-fun res!222083 () Bool)

(assert (=> b!388315 (=> (not res!222083) (not e!235282))))

(declare-fun arrayContainsKey!0 (array!23030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388315 (= res!222083 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388316 () Bool)

(assert (=> b!388316 (= e!235286 (not e!235284))))

(declare-fun res!222086 () Bool)

(assert (=> b!388316 (=> res!222086 e!235284)))

(assert (=> b!388316 (= res!222086 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!182338 () ListLongMap!5273)

(declare-fun getCurrentListMap!2038 (array!23030 array!23032 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) Int) ListLongMap!5273)

(assert (=> b!388316 (= lt!182338 (getCurrentListMap!2038 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182337 () array!23032)

(assert (=> b!388316 (= lt!182335 (getCurrentListMap!2038 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182334 () ListLongMap!5273)

(assert (=> b!388316 (and (= lt!182333 lt!182334) (= lt!182334 lt!182333))))

(declare-fun v!373 () V!13875)

(declare-fun lt!182332 () ListLongMap!5273)

(assert (=> b!388316 (= lt!182334 (+!1006 lt!182332 (tuple2!6359 k0!778 v!373)))))

(declare-datatypes ((Unit!11879 0))(
  ( (Unit!11880) )
))
(declare-fun lt!182336 () Unit!11879)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!229 (array!23030 array!23032 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) (_ BitVec 64) V!13875 (_ BitVec 32) Int) Unit!11879)

(assert (=> b!388316 (= lt!182336 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!229 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!927 (array!23030 array!23032 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) Int) ListLongMap!5273)

(assert (=> b!388316 (= lt!182333 (getCurrentListMapNoExtraKeys!927 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388316 (= lt!182337 (array!23033 (store (arr!10984 _values!506) i!548 (ValueCellFull!4445 v!373)) (size!11336 _values!506)))))

(assert (=> b!388316 (= lt!182332 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388317 () Bool)

(declare-fun res!222080 () Bool)

(assert (=> b!388317 (=> (not res!222080) (not e!235282))))

(assert (=> b!388317 (= res!222080 (or (= (select (arr!10983 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10983 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388318 () Bool)

(assert (=> b!388318 (= e!235287 (and e!235285 mapRes!15930))))

(declare-fun condMapEmpty!15930 () Bool)

(declare-fun mapDefault!15930 () ValueCell!4445)

(assert (=> b!388318 (= condMapEmpty!15930 (= (arr!10984 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4445)) mapDefault!15930)))))

(assert (= (and start!37788 res!222078) b!388312))

(assert (= (and b!388312 res!222085) b!388310))

(assert (= (and b!388310 res!222084) b!388308))

(assert (= (and b!388308 res!222077) b!388309))

(assert (= (and b!388309 res!222079) b!388307))

(assert (= (and b!388307 res!222082) b!388317))

(assert (= (and b!388317 res!222080) b!388315))

(assert (= (and b!388315 res!222083) b!388305))

(assert (= (and b!388305 res!222076) b!388311))

(assert (= (and b!388311 res!222081) b!388316))

(assert (= (and b!388316 (not res!222086)) b!388314))

(assert (= (and b!388318 condMapEmpty!15930) mapIsEmpty!15930))

(assert (= (and b!388318 (not condMapEmpty!15930)) mapNonEmpty!15930))

(get-info :version)

(assert (= (and mapNonEmpty!15930 ((_ is ValueCellFull!4445) mapValue!15930)) b!388306))

(assert (= (and b!388318 ((_ is ValueCellFull!4445) mapDefault!15930)) b!388313))

(assert (= start!37788 b!388318))

(declare-fun m!384521 () Bool)

(assert (=> b!388316 m!384521))

(declare-fun m!384523 () Bool)

(assert (=> b!388316 m!384523))

(declare-fun m!384525 () Bool)

(assert (=> b!388316 m!384525))

(declare-fun m!384527 () Bool)

(assert (=> b!388316 m!384527))

(declare-fun m!384529 () Bool)

(assert (=> b!388316 m!384529))

(declare-fun m!384531 () Bool)

(assert (=> b!388316 m!384531))

(declare-fun m!384533 () Bool)

(assert (=> b!388316 m!384533))

(declare-fun m!384535 () Bool)

(assert (=> b!388305 m!384535))

(declare-fun m!384537 () Bool)

(assert (=> b!388305 m!384537))

(declare-fun m!384539 () Bool)

(assert (=> mapNonEmpty!15930 m!384539))

(declare-fun m!384541 () Bool)

(assert (=> b!388308 m!384541))

(declare-fun m!384543 () Bool)

(assert (=> b!388317 m!384543))

(declare-fun m!384545 () Bool)

(assert (=> b!388315 m!384545))

(declare-fun m!384547 () Bool)

(assert (=> b!388314 m!384547))

(assert (=> b!388314 m!384547))

(declare-fun m!384549 () Bool)

(assert (=> b!388314 m!384549))

(declare-fun m!384551 () Bool)

(assert (=> b!388310 m!384551))

(declare-fun m!384553 () Bool)

(assert (=> b!388311 m!384553))

(declare-fun m!384555 () Bool)

(assert (=> start!37788 m!384555))

(declare-fun m!384557 () Bool)

(assert (=> start!37788 m!384557))

(declare-fun m!384559 () Bool)

(assert (=> start!37788 m!384559))

(declare-fun m!384561 () Bool)

(assert (=> b!388307 m!384561))

(check-sat b_and!16161 (not b!388308) (not mapNonEmpty!15930) (not b!388307) (not b!388315) tp_is_empty!9577 (not b!388305) (not b!388311) (not b!388310) (not b!388314) (not start!37788) (not b!388316) (not b_next!8905))
(check-sat b_and!16161 (not b_next!8905))
(get-model)

(declare-fun b!388413 () Bool)

(declare-fun e!235338 () Bool)

(declare-fun contains!2419 (List!6210 (_ BitVec 64)) Bool)

(assert (=> b!388413 (= e!235338 (contains!2419 Nil!6207 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388414 () Bool)

(declare-fun e!235341 () Bool)

(declare-fun call!27298 () Bool)

(assert (=> b!388414 (= e!235341 call!27298)))

(declare-fun b!388415 () Bool)

(assert (=> b!388415 (= e!235341 call!27298)))

(declare-fun d!72829 () Bool)

(declare-fun res!222159 () Bool)

(declare-fun e!235339 () Bool)

(assert (=> d!72829 (=> res!222159 e!235339)))

(assert (=> d!72829 (= res!222159 (bvsge #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(assert (=> d!72829 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6207) e!235339)))

(declare-fun b!388416 () Bool)

(declare-fun e!235340 () Bool)

(assert (=> b!388416 (= e!235339 e!235340)))

(declare-fun res!222161 () Bool)

(assert (=> b!388416 (=> (not res!222161) (not e!235340))))

(assert (=> b!388416 (= res!222161 (not e!235338))))

(declare-fun res!222160 () Bool)

(assert (=> b!388416 (=> (not res!222160) (not e!235338))))

(assert (=> b!388416 (= res!222160 (validKeyInArray!0 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27295 () Bool)

(declare-fun c!53904 () Bool)

(assert (=> bm!27295 (= call!27298 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53904 (Cons!6206 (select (arr!10983 _keys!658) #b00000000000000000000000000000000) Nil!6207) Nil!6207)))))

(declare-fun b!388417 () Bool)

(assert (=> b!388417 (= e!235340 e!235341)))

(assert (=> b!388417 (= c!53904 (validKeyInArray!0 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72829 (not res!222159)) b!388416))

(assert (= (and b!388416 res!222160) b!388413))

(assert (= (and b!388416 res!222161) b!388417))

(assert (= (and b!388417 c!53904) b!388415))

(assert (= (and b!388417 (not c!53904)) b!388414))

(assert (= (or b!388415 b!388414) bm!27295))

(declare-fun m!384647 () Bool)

(assert (=> b!388413 m!384647))

(assert (=> b!388413 m!384647))

(declare-fun m!384649 () Bool)

(assert (=> b!388413 m!384649))

(assert (=> b!388416 m!384647))

(assert (=> b!388416 m!384647))

(declare-fun m!384651 () Bool)

(assert (=> b!388416 m!384651))

(assert (=> bm!27295 m!384647))

(declare-fun m!384653 () Bool)

(assert (=> bm!27295 m!384653))

(assert (=> b!388417 m!384647))

(assert (=> b!388417 m!384647))

(assert (=> b!388417 m!384651))

(assert (=> b!388308 d!72829))

(declare-fun d!72831 () Bool)

(declare-fun res!222167 () Bool)

(declare-fun e!235350 () Bool)

(assert (=> d!72831 (=> res!222167 e!235350)))

(assert (=> d!72831 (= res!222167 (bvsge #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(assert (=> d!72831 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182331 mask!970) e!235350)))

(declare-fun b!388426 () Bool)

(declare-fun e!235349 () Bool)

(declare-fun call!27301 () Bool)

(assert (=> b!388426 (= e!235349 call!27301)))

(declare-fun b!388427 () Bool)

(declare-fun e!235348 () Bool)

(assert (=> b!388427 (= e!235350 e!235348)))

(declare-fun c!53907 () Bool)

(assert (=> b!388427 (= c!53907 (validKeyInArray!0 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)))))

(declare-fun bm!27298 () Bool)

(assert (=> bm!27298 (= call!27301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!182331 mask!970))))

(declare-fun b!388428 () Bool)

(assert (=> b!388428 (= e!235348 call!27301)))

(declare-fun b!388429 () Bool)

(assert (=> b!388429 (= e!235348 e!235349)))

(declare-fun lt!182393 () (_ BitVec 64))

(assert (=> b!388429 (= lt!182393 (select (arr!10983 lt!182331) #b00000000000000000000000000000000))))

(declare-fun lt!182394 () Unit!11879)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23030 (_ BitVec 64) (_ BitVec 32)) Unit!11879)

(assert (=> b!388429 (= lt!182394 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!182331 lt!182393 #b00000000000000000000000000000000))))

(assert (=> b!388429 (arrayContainsKey!0 lt!182331 lt!182393 #b00000000000000000000000000000000)))

(declare-fun lt!182395 () Unit!11879)

(assert (=> b!388429 (= lt!182395 lt!182394)))

(declare-fun res!222166 () Bool)

(declare-datatypes ((SeekEntryResult!3457 0))(
  ( (MissingZero!3457 (index!16007 (_ BitVec 32))) (Found!3457 (index!16008 (_ BitVec 32))) (Intermediate!3457 (undefined!4269 Bool) (index!16009 (_ BitVec 32)) (x!38127 (_ BitVec 32))) (Undefined!3457) (MissingVacant!3457 (index!16010 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23030 (_ BitVec 32)) SeekEntryResult!3457)

(assert (=> b!388429 (= res!222166 (= (seekEntryOrOpen!0 (select (arr!10983 lt!182331) #b00000000000000000000000000000000) lt!182331 mask!970) (Found!3457 #b00000000000000000000000000000000)))))

(assert (=> b!388429 (=> (not res!222166) (not e!235349))))

(assert (= (and d!72831 (not res!222167)) b!388427))

(assert (= (and b!388427 c!53907) b!388429))

(assert (= (and b!388427 (not c!53907)) b!388428))

(assert (= (and b!388429 res!222166) b!388426))

(assert (= (or b!388426 b!388428) bm!27298))

(declare-fun m!384655 () Bool)

(assert (=> b!388427 m!384655))

(assert (=> b!388427 m!384655))

(declare-fun m!384657 () Bool)

(assert (=> b!388427 m!384657))

(declare-fun m!384659 () Bool)

(assert (=> bm!27298 m!384659))

(assert (=> b!388429 m!384655))

(declare-fun m!384661 () Bool)

(assert (=> b!388429 m!384661))

(declare-fun m!384663 () Bool)

(assert (=> b!388429 m!384663))

(assert (=> b!388429 m!384655))

(declare-fun m!384665 () Bool)

(assert (=> b!388429 m!384665))

(assert (=> b!388305 d!72831))

(declare-fun d!72833 () Bool)

(declare-fun e!235353 () Bool)

(assert (=> d!72833 e!235353))

(declare-fun res!222173 () Bool)

(assert (=> d!72833 (=> (not res!222173) (not e!235353))))

(declare-fun lt!182406 () ListLongMap!5273)

(declare-fun contains!2420 (ListLongMap!5273 (_ BitVec 64)) Bool)

(assert (=> d!72833 (= res!222173 (contains!2420 lt!182406 (_1!3190 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun lt!182405 () List!6211)

(assert (=> d!72833 (= lt!182406 (ListLongMap!5274 lt!182405))))

(declare-fun lt!182407 () Unit!11879)

(declare-fun lt!182404 () Unit!11879)

(assert (=> d!72833 (= lt!182407 lt!182404)))

(declare-datatypes ((Option!362 0))(
  ( (Some!361 (v!7037 V!13875)) (None!360) )
))
(declare-fun getValueByKey!356 (List!6211 (_ BitVec 64)) Option!362)

(assert (=> d!72833 (= (getValueByKey!356 lt!182405 (_1!3190 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!361 (_2!3190 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun lemmaContainsTupThenGetReturnValue!178 (List!6211 (_ BitVec 64) V!13875) Unit!11879)

(assert (=> d!72833 (= lt!182404 (lemmaContainsTupThenGetReturnValue!178 lt!182405 (_1!3190 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3190 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun insertStrictlySorted!181 (List!6211 (_ BitVec 64) V!13875) List!6211)

(assert (=> d!72833 (= lt!182405 (insertStrictlySorted!181 (toList!2652 (+!1006 lt!182333 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (_1!3190 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) (_2!3190 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(assert (=> d!72833 (= (+!1006 (+!1006 lt!182333 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)) lt!182406)))

(declare-fun b!388434 () Bool)

(declare-fun res!222172 () Bool)

(assert (=> b!388434 (=> (not res!222172) (not e!235353))))

(assert (=> b!388434 (= res!222172 (= (getValueByKey!356 (toList!2652 lt!182406) (_1!3190 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))) (Some!361 (_2!3190 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))))

(declare-fun b!388435 () Bool)

(declare-fun contains!2421 (List!6211 tuple2!6358) Bool)

(assert (=> b!388435 (= e!235353 (contains!2421 (toList!2652 lt!182406) (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72833 res!222173) b!388434))

(assert (= (and b!388434 res!222172) b!388435))

(declare-fun m!384667 () Bool)

(assert (=> d!72833 m!384667))

(declare-fun m!384669 () Bool)

(assert (=> d!72833 m!384669))

(declare-fun m!384671 () Bool)

(assert (=> d!72833 m!384671))

(declare-fun m!384673 () Bool)

(assert (=> d!72833 m!384673))

(declare-fun m!384675 () Bool)

(assert (=> b!388434 m!384675))

(declare-fun m!384677 () Bool)

(assert (=> b!388435 m!384677))

(assert (=> b!388314 d!72833))

(declare-fun d!72835 () Bool)

(declare-fun e!235354 () Bool)

(assert (=> d!72835 e!235354))

(declare-fun res!222175 () Bool)

(assert (=> d!72835 (=> (not res!222175) (not e!235354))))

(declare-fun lt!182410 () ListLongMap!5273)

(assert (=> d!72835 (= res!222175 (contains!2420 lt!182410 (_1!3190 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(declare-fun lt!182409 () List!6211)

(assert (=> d!72835 (= lt!182410 (ListLongMap!5274 lt!182409))))

(declare-fun lt!182411 () Unit!11879)

(declare-fun lt!182408 () Unit!11879)

(assert (=> d!72835 (= lt!182411 lt!182408)))

(assert (=> d!72835 (= (getValueByKey!356 lt!182409 (_1!3190 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!361 (_2!3190 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72835 (= lt!182408 (lemmaContainsTupThenGetReturnValue!178 lt!182409 (_1!3190 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3190 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72835 (= lt!182409 (insertStrictlySorted!181 (toList!2652 lt!182333) (_1!3190 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (_2!3190 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))))

(assert (=> d!72835 (= (+!1006 lt!182333 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) lt!182410)))

(declare-fun b!388436 () Bool)

(declare-fun res!222174 () Bool)

(assert (=> b!388436 (=> (not res!222174) (not e!235354))))

(assert (=> b!388436 (= res!222174 (= (getValueByKey!356 (toList!2652 lt!182410) (_1!3190 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))) (Some!361 (_2!3190 (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))))

(declare-fun b!388437 () Bool)

(assert (=> b!388437 (= e!235354 (contains!2421 (toList!2652 lt!182410) (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)))))

(assert (= (and d!72835 res!222175) b!388436))

(assert (= (and b!388436 res!222174) b!388437))

(declare-fun m!384679 () Bool)

(assert (=> d!72835 m!384679))

(declare-fun m!384681 () Bool)

(assert (=> d!72835 m!384681))

(declare-fun m!384683 () Bool)

(assert (=> d!72835 m!384683))

(declare-fun m!384685 () Bool)

(assert (=> d!72835 m!384685))

(declare-fun m!384687 () Bool)

(assert (=> b!388436 m!384687))

(declare-fun m!384689 () Bool)

(assert (=> b!388437 m!384689))

(assert (=> b!388314 d!72835))

(declare-fun d!72837 () Bool)

(declare-fun res!222177 () Bool)

(declare-fun e!235357 () Bool)

(assert (=> d!72837 (=> res!222177 e!235357)))

(assert (=> d!72837 (= res!222177 (bvsge #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(assert (=> d!72837 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!235357)))

(declare-fun b!388438 () Bool)

(declare-fun e!235356 () Bool)

(declare-fun call!27302 () Bool)

(assert (=> b!388438 (= e!235356 call!27302)))

(declare-fun b!388439 () Bool)

(declare-fun e!235355 () Bool)

(assert (=> b!388439 (= e!235357 e!235355)))

(declare-fun c!53908 () Bool)

(assert (=> b!388439 (= c!53908 (validKeyInArray!0 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27299 () Bool)

(assert (=> bm!27299 (= call!27302 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!388440 () Bool)

(assert (=> b!388440 (= e!235355 call!27302)))

(declare-fun b!388441 () Bool)

(assert (=> b!388441 (= e!235355 e!235356)))

(declare-fun lt!182412 () (_ BitVec 64))

(assert (=> b!388441 (= lt!182412 (select (arr!10983 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182413 () Unit!11879)

(assert (=> b!388441 (= lt!182413 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!182412 #b00000000000000000000000000000000))))

(assert (=> b!388441 (arrayContainsKey!0 _keys!658 lt!182412 #b00000000000000000000000000000000)))

(declare-fun lt!182414 () Unit!11879)

(assert (=> b!388441 (= lt!182414 lt!182413)))

(declare-fun res!222176 () Bool)

(assert (=> b!388441 (= res!222176 (= (seekEntryOrOpen!0 (select (arr!10983 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3457 #b00000000000000000000000000000000)))))

(assert (=> b!388441 (=> (not res!222176) (not e!235356))))

(assert (= (and d!72837 (not res!222177)) b!388439))

(assert (= (and b!388439 c!53908) b!388441))

(assert (= (and b!388439 (not c!53908)) b!388440))

(assert (= (and b!388441 res!222176) b!388438))

(assert (= (or b!388438 b!388440) bm!27299))

(assert (=> b!388439 m!384647))

(assert (=> b!388439 m!384647))

(assert (=> b!388439 m!384651))

(declare-fun m!384691 () Bool)

(assert (=> bm!27299 m!384691))

(assert (=> b!388441 m!384647))

(declare-fun m!384693 () Bool)

(assert (=> b!388441 m!384693))

(declare-fun m!384695 () Bool)

(assert (=> b!388441 m!384695))

(assert (=> b!388441 m!384647))

(declare-fun m!384697 () Bool)

(assert (=> b!388441 m!384697))

(assert (=> b!388310 d!72837))

(declare-fun d!72839 () Bool)

(declare-fun res!222182 () Bool)

(declare-fun e!235362 () Bool)

(assert (=> d!72839 (=> res!222182 e!235362)))

(assert (=> d!72839 (= res!222182 (= (select (arr!10983 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72839 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!235362)))

(declare-fun b!388446 () Bool)

(declare-fun e!235363 () Bool)

(assert (=> b!388446 (= e!235362 e!235363)))

(declare-fun res!222183 () Bool)

(assert (=> b!388446 (=> (not res!222183) (not e!235363))))

(assert (=> b!388446 (= res!222183 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11335 _keys!658)))))

(declare-fun b!388447 () Bool)

(assert (=> b!388447 (= e!235363 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72839 (not res!222182)) b!388446))

(assert (= (and b!388446 res!222183) b!388447))

(assert (=> d!72839 m!384647))

(declare-fun m!384699 () Bool)

(assert (=> b!388447 m!384699))

(assert (=> b!388315 d!72839))

(declare-fun d!72841 () Bool)

(assert (=> d!72841 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37788 d!72841))

(declare-fun d!72843 () Bool)

(assert (=> d!72843 (= (array_inv!8116 _values!506) (bvsge (size!11336 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37788 d!72843))

(declare-fun d!72845 () Bool)

(assert (=> d!72845 (= (array_inv!8117 _keys!658) (bvsge (size!11335 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37788 d!72845))

(declare-fun d!72847 () Bool)

(assert (=> d!72847 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388307 d!72847))

(declare-fun call!27305 () ListLongMap!5273)

(declare-fun bm!27302 () Bool)

(assert (=> bm!27302 (= call!27305 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!388472 () Bool)

(declare-fun e!235381 () Bool)

(assert (=> b!388472 (= e!235381 (validKeyInArray!0 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388472 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!388473 () Bool)

(assert (=> b!388473 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(assert (=> b!388473 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11336 _values!506)))))

(declare-fun e!235384 () Bool)

(declare-fun lt!182429 () ListLongMap!5273)

(declare-fun apply!297 (ListLongMap!5273 (_ BitVec 64)) V!13875)

(declare-fun get!5569 (ValueCell!4445 V!13875) V!13875)

(declare-fun dynLambda!640 (Int (_ BitVec 64)) V!13875)

(assert (=> b!388473 (= e!235384 (= (apply!297 lt!182429 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)) (get!5569 (select (arr!10984 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!72849 () Bool)

(declare-fun e!235380 () Bool)

(assert (=> d!72849 e!235380))

(declare-fun res!222193 () Bool)

(assert (=> d!72849 (=> (not res!222193) (not e!235380))))

(assert (=> d!72849 (= res!222193 (not (contains!2420 lt!182429 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235378 () ListLongMap!5273)

(assert (=> d!72849 (= lt!182429 e!235378)))

(declare-fun c!53920 () Bool)

(assert (=> d!72849 (= c!53920 (bvsge #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(assert (=> d!72849 (validMask!0 mask!970)))

(assert (=> d!72849 (= (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182429)))

(declare-fun b!388474 () Bool)

(declare-fun res!222195 () Bool)

(assert (=> b!388474 (=> (not res!222195) (not e!235380))))

(assert (=> b!388474 (= res!222195 (not (contains!2420 lt!182429 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388475 () Bool)

(assert (=> b!388475 (= e!235378 (ListLongMap!5274 Nil!6208))))

(declare-fun b!388476 () Bool)

(declare-fun lt!182431 () Unit!11879)

(declare-fun lt!182435 () Unit!11879)

(assert (=> b!388476 (= lt!182431 lt!182435)))

(declare-fun lt!182432 () V!13875)

(declare-fun lt!182433 () ListLongMap!5273)

(declare-fun lt!182434 () (_ BitVec 64))

(declare-fun lt!182430 () (_ BitVec 64))

(assert (=> b!388476 (not (contains!2420 (+!1006 lt!182433 (tuple2!6359 lt!182434 lt!182432)) lt!182430))))

(declare-fun addStillNotContains!132 (ListLongMap!5273 (_ BitVec 64) V!13875 (_ BitVec 64)) Unit!11879)

(assert (=> b!388476 (= lt!182435 (addStillNotContains!132 lt!182433 lt!182434 lt!182432 lt!182430))))

(assert (=> b!388476 (= lt!182430 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388476 (= lt!182432 (get!5569 (select (arr!10984 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388476 (= lt!182434 (select (arr!10983 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!388476 (= lt!182433 call!27305)))

(declare-fun e!235379 () ListLongMap!5273)

(assert (=> b!388476 (= e!235379 (+!1006 call!27305 (tuple2!6359 (select (arr!10983 _keys!658) #b00000000000000000000000000000000) (get!5569 (select (arr!10984 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!388477 () Bool)

(declare-fun e!235382 () Bool)

(assert (=> b!388477 (= e!235382 e!235384)))

(assert (=> b!388477 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(declare-fun res!222192 () Bool)

(assert (=> b!388477 (= res!222192 (contains!2420 lt!182429 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388477 (=> (not res!222192) (not e!235384))))

(declare-fun b!388478 () Bool)

(declare-fun e!235383 () Bool)

(assert (=> b!388478 (= e!235382 e!235383)))

(declare-fun c!53919 () Bool)

(assert (=> b!388478 (= c!53919 (bvslt #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(declare-fun b!388479 () Bool)

(assert (=> b!388479 (= e!235378 e!235379)))

(declare-fun c!53917 () Bool)

(assert (=> b!388479 (= c!53917 (validKeyInArray!0 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388480 () Bool)

(assert (=> b!388480 (= e!235379 call!27305)))

(declare-fun b!388481 () Bool)

(declare-fun isEmpty!549 (ListLongMap!5273) Bool)

(assert (=> b!388481 (= e!235383 (isEmpty!549 lt!182429))))

(declare-fun b!388482 () Bool)

(assert (=> b!388482 (= e!235383 (= lt!182429 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!388483 () Bool)

(assert (=> b!388483 (= e!235380 e!235382)))

(declare-fun c!53918 () Bool)

(assert (=> b!388483 (= c!53918 e!235381)))

(declare-fun res!222194 () Bool)

(assert (=> b!388483 (=> (not res!222194) (not e!235381))))

(assert (=> b!388483 (= res!222194 (bvslt #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(assert (= (and d!72849 c!53920) b!388475))

(assert (= (and d!72849 (not c!53920)) b!388479))

(assert (= (and b!388479 c!53917) b!388476))

(assert (= (and b!388479 (not c!53917)) b!388480))

(assert (= (or b!388476 b!388480) bm!27302))

(assert (= (and d!72849 res!222193) b!388474))

(assert (= (and b!388474 res!222195) b!388483))

(assert (= (and b!388483 res!222194) b!388472))

(assert (= (and b!388483 c!53918) b!388477))

(assert (= (and b!388483 (not c!53918)) b!388478))

(assert (= (and b!388477 res!222192) b!388473))

(assert (= (and b!388478 c!53919) b!388482))

(assert (= (and b!388478 (not c!53919)) b!388481))

(declare-fun b_lambda!8549 () Bool)

(assert (=> (not b_lambda!8549) (not b!388473)))

(declare-fun t!11357 () Bool)

(declare-fun tb!3101 () Bool)

(assert (=> (and start!37788 (= defaultEntry!514 defaultEntry!514) t!11357) tb!3101))

(declare-fun result!5699 () Bool)

(assert (=> tb!3101 (= result!5699 tp_is_empty!9577)))

(assert (=> b!388473 t!11357))

(declare-fun b_and!16167 () Bool)

(assert (= b_and!16161 (and (=> t!11357 result!5699) b_and!16167)))

(declare-fun b_lambda!8551 () Bool)

(assert (=> (not b_lambda!8551) (not b!388476)))

(assert (=> b!388476 t!11357))

(declare-fun b_and!16169 () Bool)

(assert (= b_and!16167 (and (=> t!11357 result!5699) b_and!16169)))

(declare-fun m!384701 () Bool)

(assert (=> b!388474 m!384701))

(declare-fun m!384703 () Bool)

(assert (=> b!388481 m!384703))

(declare-fun m!384705 () Bool)

(assert (=> b!388473 m!384705))

(declare-fun m!384707 () Bool)

(assert (=> b!388473 m!384707))

(declare-fun m!384709 () Bool)

(assert (=> b!388473 m!384709))

(assert (=> b!388473 m!384647))

(declare-fun m!384711 () Bool)

(assert (=> b!388473 m!384711))

(assert (=> b!388473 m!384647))

(assert (=> b!388473 m!384705))

(assert (=> b!388473 m!384707))

(declare-fun m!384713 () Bool)

(assert (=> b!388482 m!384713))

(assert (=> bm!27302 m!384713))

(assert (=> b!388472 m!384647))

(assert (=> b!388472 m!384647))

(assert (=> b!388472 m!384651))

(assert (=> b!388479 m!384647))

(assert (=> b!388479 m!384647))

(assert (=> b!388479 m!384651))

(assert (=> b!388476 m!384647))

(assert (=> b!388476 m!384705))

(declare-fun m!384715 () Bool)

(assert (=> b!388476 m!384715))

(declare-fun m!384717 () Bool)

(assert (=> b!388476 m!384717))

(assert (=> b!388476 m!384715))

(declare-fun m!384719 () Bool)

(assert (=> b!388476 m!384719))

(assert (=> b!388476 m!384705))

(assert (=> b!388476 m!384707))

(assert (=> b!388476 m!384709))

(declare-fun m!384721 () Bool)

(assert (=> b!388476 m!384721))

(assert (=> b!388476 m!384707))

(declare-fun m!384723 () Bool)

(assert (=> d!72849 m!384723))

(assert (=> d!72849 m!384555))

(assert (=> b!388477 m!384647))

(assert (=> b!388477 m!384647))

(declare-fun m!384725 () Bool)

(assert (=> b!388477 m!384725))

(assert (=> b!388316 d!72849))

(declare-fun b!388528 () Bool)

(declare-fun e!235414 () Unit!11879)

(declare-fun Unit!11883 () Unit!11879)

(assert (=> b!388528 (= e!235414 Unit!11883)))

(declare-fun b!388529 () Bool)

(declare-fun e!235417 () Bool)

(declare-fun call!27323 () Bool)

(assert (=> b!388529 (= e!235417 (not call!27323))))

(declare-fun b!388530 () Bool)

(declare-fun e!235418 () Bool)

(assert (=> b!388530 (= e!235418 e!235417)))

(declare-fun c!53938 () Bool)

(assert (=> b!388530 (= c!53938 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388531 () Bool)

(declare-fun e!235416 () Bool)

(assert (=> b!388531 (= e!235416 (validKeyInArray!0 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388532 () Bool)

(declare-fun e!235413 () Bool)

(assert (=> b!388532 (= e!235417 e!235413)))

(declare-fun res!222214 () Bool)

(assert (=> b!388532 (= res!222214 call!27323)))

(assert (=> b!388532 (=> (not res!222214) (not e!235413))))

(declare-fun bm!27317 () Bool)

(declare-fun call!27320 () ListLongMap!5273)

(declare-fun call!27326 () ListLongMap!5273)

(assert (=> bm!27317 (= call!27320 call!27326)))

(declare-fun b!388533 () Bool)

(declare-fun e!235422 () Bool)

(declare-fun e!235415 () Bool)

(assert (=> b!388533 (= e!235422 e!235415)))

(declare-fun res!222218 () Bool)

(assert (=> b!388533 (=> (not res!222218) (not e!235415))))

(declare-fun lt!182499 () ListLongMap!5273)

(assert (=> b!388533 (= res!222218 (contains!2420 lt!182499 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388533 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(declare-fun b!388534 () Bool)

(assert (=> b!388534 (= e!235413 (= (apply!297 lt!182499 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27318 () Bool)

(declare-fun call!27324 () ListLongMap!5273)

(declare-fun call!27325 () ListLongMap!5273)

(assert (=> bm!27318 (= call!27324 call!27325)))

(declare-fun b!388535 () Bool)

(declare-fun e!235411 () ListLongMap!5273)

(assert (=> b!388535 (= e!235411 call!27324)))

(declare-fun d!72851 () Bool)

(assert (=> d!72851 e!235418))

(declare-fun res!222220 () Bool)

(assert (=> d!72851 (=> (not res!222220) (not e!235418))))

(assert (=> d!72851 (= res!222220 (or (bvsge #b00000000000000000000000000000000 (size!11335 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11335 _keys!658)))))))

(declare-fun lt!182489 () ListLongMap!5273)

(assert (=> d!72851 (= lt!182499 lt!182489)))

(declare-fun lt!182491 () Unit!11879)

(assert (=> d!72851 (= lt!182491 e!235414)))

(declare-fun c!53934 () Bool)

(declare-fun e!235412 () Bool)

(assert (=> d!72851 (= c!53934 e!235412)))

(declare-fun res!222219 () Bool)

(assert (=> d!72851 (=> (not res!222219) (not e!235412))))

(assert (=> d!72851 (= res!222219 (bvslt #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(declare-fun e!235420 () ListLongMap!5273)

(assert (=> d!72851 (= lt!182489 e!235420)))

(declare-fun c!53936 () Bool)

(assert (=> d!72851 (= c!53936 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72851 (validMask!0 mask!970)))

(assert (=> d!72851 (= (getCurrentListMap!2038 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182499)))

(declare-fun b!388536 () Bool)

(declare-fun e!235419 () ListLongMap!5273)

(declare-fun call!27321 () ListLongMap!5273)

(assert (=> b!388536 (= e!235419 call!27321)))

(declare-fun b!388537 () Bool)

(assert (=> b!388537 (= e!235420 e!235411)))

(declare-fun c!53937 () Bool)

(assert (=> b!388537 (= c!53937 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388538 () Bool)

(declare-fun e!235421 () Bool)

(declare-fun call!27322 () Bool)

(assert (=> b!388538 (= e!235421 (not call!27322))))

(declare-fun b!388539 () Bool)

(assert (=> b!388539 (= e!235420 (+!1006 call!27325 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27319 () Bool)

(assert (=> bm!27319 (= call!27322 (contains!2420 lt!182499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388540 () Bool)

(assert (=> b!388540 (= e!235415 (= (apply!297 lt!182499 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)) (get!5569 (select (arr!10984 _values!506) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11336 _values!506)))))

(assert (=> b!388540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(declare-fun b!388541 () Bool)

(declare-fun lt!182483 () Unit!11879)

(assert (=> b!388541 (= e!235414 lt!182483)))

(declare-fun lt!182486 () ListLongMap!5273)

(assert (=> b!388541 (= lt!182486 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182482 () (_ BitVec 64))

(assert (=> b!388541 (= lt!182482 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182493 () (_ BitVec 64))

(assert (=> b!388541 (= lt!182493 (select (arr!10983 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182494 () Unit!11879)

(declare-fun addStillContains!273 (ListLongMap!5273 (_ BitVec 64) V!13875 (_ BitVec 64)) Unit!11879)

(assert (=> b!388541 (= lt!182494 (addStillContains!273 lt!182486 lt!182482 zeroValue!472 lt!182493))))

(assert (=> b!388541 (contains!2420 (+!1006 lt!182486 (tuple2!6359 lt!182482 zeroValue!472)) lt!182493)))

(declare-fun lt!182490 () Unit!11879)

(assert (=> b!388541 (= lt!182490 lt!182494)))

(declare-fun lt!182496 () ListLongMap!5273)

(assert (=> b!388541 (= lt!182496 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182498 () (_ BitVec 64))

(assert (=> b!388541 (= lt!182498 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182497 () (_ BitVec 64))

(assert (=> b!388541 (= lt!182497 (select (arr!10983 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182488 () Unit!11879)

(declare-fun addApplyDifferent!273 (ListLongMap!5273 (_ BitVec 64) V!13875 (_ BitVec 64)) Unit!11879)

(assert (=> b!388541 (= lt!182488 (addApplyDifferent!273 lt!182496 lt!182498 minValue!472 lt!182497))))

(assert (=> b!388541 (= (apply!297 (+!1006 lt!182496 (tuple2!6359 lt!182498 minValue!472)) lt!182497) (apply!297 lt!182496 lt!182497))))

(declare-fun lt!182480 () Unit!11879)

(assert (=> b!388541 (= lt!182480 lt!182488)))

(declare-fun lt!182481 () ListLongMap!5273)

(assert (=> b!388541 (= lt!182481 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182495 () (_ BitVec 64))

(assert (=> b!388541 (= lt!182495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182485 () (_ BitVec 64))

(assert (=> b!388541 (= lt!182485 (select (arr!10983 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182492 () Unit!11879)

(assert (=> b!388541 (= lt!182492 (addApplyDifferent!273 lt!182481 lt!182495 zeroValue!472 lt!182485))))

(assert (=> b!388541 (= (apply!297 (+!1006 lt!182481 (tuple2!6359 lt!182495 zeroValue!472)) lt!182485) (apply!297 lt!182481 lt!182485))))

(declare-fun lt!182501 () Unit!11879)

(assert (=> b!388541 (= lt!182501 lt!182492)))

(declare-fun lt!182487 () ListLongMap!5273)

(assert (=> b!388541 (= lt!182487 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182500 () (_ BitVec 64))

(assert (=> b!388541 (= lt!182500 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182484 () (_ BitVec 64))

(assert (=> b!388541 (= lt!182484 (select (arr!10983 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!388541 (= lt!182483 (addApplyDifferent!273 lt!182487 lt!182500 minValue!472 lt!182484))))

(assert (=> b!388541 (= (apply!297 (+!1006 lt!182487 (tuple2!6359 lt!182500 minValue!472)) lt!182484) (apply!297 lt!182487 lt!182484))))

(declare-fun b!388542 () Bool)

(declare-fun res!222222 () Bool)

(assert (=> b!388542 (=> (not res!222222) (not e!235418))))

(assert (=> b!388542 (= res!222222 e!235422)))

(declare-fun res!222215 () Bool)

(assert (=> b!388542 (=> res!222215 e!235422)))

(assert (=> b!388542 (= res!222215 (not e!235416))))

(declare-fun res!222217 () Bool)

(assert (=> b!388542 (=> (not res!222217) (not e!235416))))

(assert (=> b!388542 (= res!222217 (bvslt #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(declare-fun bm!27320 () Bool)

(assert (=> bm!27320 (= call!27326 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388543 () Bool)

(declare-fun res!222221 () Bool)

(assert (=> b!388543 (=> (not res!222221) (not e!235418))))

(assert (=> b!388543 (= res!222221 e!235421)))

(declare-fun c!53935 () Bool)

(assert (=> b!388543 (= c!53935 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!388544 () Bool)

(assert (=> b!388544 (= e!235412 (validKeyInArray!0 (select (arr!10983 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388545 () Bool)

(declare-fun e!235423 () Bool)

(assert (=> b!388545 (= e!235421 e!235423)))

(declare-fun res!222216 () Bool)

(assert (=> b!388545 (= res!222216 call!27322)))

(assert (=> b!388545 (=> (not res!222216) (not e!235423))))

(declare-fun b!388546 () Bool)

(assert (=> b!388546 (= e!235423 (= (apply!297 lt!182499 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!388547 () Bool)

(assert (=> b!388547 (= e!235419 call!27324)))

(declare-fun bm!27321 () Bool)

(assert (=> bm!27321 (= call!27323 (contains!2420 lt!182499 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27322 () Bool)

(assert (=> bm!27322 (= call!27325 (+!1006 (ite c!53936 call!27326 (ite c!53937 call!27320 call!27321)) (ite (or c!53936 c!53937) (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27323 () Bool)

(assert (=> bm!27323 (= call!27321 call!27320)))

(declare-fun b!388548 () Bool)

(declare-fun c!53933 () Bool)

(assert (=> b!388548 (= c!53933 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!388548 (= e!235411 e!235419)))

(assert (= (and d!72851 c!53936) b!388539))

(assert (= (and d!72851 (not c!53936)) b!388537))

(assert (= (and b!388537 c!53937) b!388535))

(assert (= (and b!388537 (not c!53937)) b!388548))

(assert (= (and b!388548 c!53933) b!388547))

(assert (= (and b!388548 (not c!53933)) b!388536))

(assert (= (or b!388547 b!388536) bm!27323))

(assert (= (or b!388535 bm!27323) bm!27317))

(assert (= (or b!388535 b!388547) bm!27318))

(assert (= (or b!388539 bm!27317) bm!27320))

(assert (= (or b!388539 bm!27318) bm!27322))

(assert (= (and d!72851 res!222219) b!388544))

(assert (= (and d!72851 c!53934) b!388541))

(assert (= (and d!72851 (not c!53934)) b!388528))

(assert (= (and d!72851 res!222220) b!388542))

(assert (= (and b!388542 res!222217) b!388531))

(assert (= (and b!388542 (not res!222215)) b!388533))

(assert (= (and b!388533 res!222218) b!388540))

(assert (= (and b!388542 res!222222) b!388543))

(assert (= (and b!388543 c!53935) b!388545))

(assert (= (and b!388543 (not c!53935)) b!388538))

(assert (= (and b!388545 res!222216) b!388546))

(assert (= (or b!388545 b!388538) bm!27319))

(assert (= (and b!388543 res!222221) b!388530))

(assert (= (and b!388530 c!53938) b!388532))

(assert (= (and b!388530 (not c!53938)) b!388529))

(assert (= (and b!388532 res!222214) b!388534))

(assert (= (or b!388532 b!388529) bm!27321))

(declare-fun b_lambda!8553 () Bool)

(assert (=> (not b_lambda!8553) (not b!388540)))

(assert (=> b!388540 t!11357))

(declare-fun b_and!16171 () Bool)

(assert (= b_and!16169 (and (=> t!11357 result!5699) b_and!16171)))

(assert (=> b!388533 m!384647))

(assert (=> b!388533 m!384647))

(declare-fun m!384727 () Bool)

(assert (=> b!388533 m!384727))

(assert (=> d!72851 m!384555))

(assert (=> b!388531 m!384647))

(assert (=> b!388531 m!384647))

(assert (=> b!388531 m!384651))

(declare-fun m!384729 () Bool)

(assert (=> bm!27319 m!384729))

(assert (=> b!388540 m!384705))

(assert (=> b!388540 m!384707))

(assert (=> b!388540 m!384709))

(assert (=> b!388540 m!384647))

(assert (=> b!388540 m!384707))

(assert (=> b!388540 m!384705))

(assert (=> b!388540 m!384647))

(declare-fun m!384731 () Bool)

(assert (=> b!388540 m!384731))

(declare-fun m!384733 () Bool)

(assert (=> b!388546 m!384733))

(declare-fun m!384735 () Bool)

(assert (=> bm!27322 m!384735))

(assert (=> bm!27320 m!384521))

(declare-fun m!384737 () Bool)

(assert (=> bm!27321 m!384737))

(declare-fun m!384739 () Bool)

(assert (=> b!388539 m!384739))

(declare-fun m!384741 () Bool)

(assert (=> b!388541 m!384741))

(declare-fun m!384743 () Bool)

(assert (=> b!388541 m!384743))

(assert (=> b!388541 m!384647))

(declare-fun m!384745 () Bool)

(assert (=> b!388541 m!384745))

(assert (=> b!388541 m!384741))

(declare-fun m!384747 () Bool)

(assert (=> b!388541 m!384747))

(declare-fun m!384749 () Bool)

(assert (=> b!388541 m!384749))

(declare-fun m!384751 () Bool)

(assert (=> b!388541 m!384751))

(declare-fun m!384753 () Bool)

(assert (=> b!388541 m!384753))

(declare-fun m!384755 () Bool)

(assert (=> b!388541 m!384755))

(declare-fun m!384757 () Bool)

(assert (=> b!388541 m!384757))

(declare-fun m!384759 () Bool)

(assert (=> b!388541 m!384759))

(assert (=> b!388541 m!384521))

(declare-fun m!384761 () Bool)

(assert (=> b!388541 m!384761))

(declare-fun m!384763 () Bool)

(assert (=> b!388541 m!384763))

(assert (=> b!388541 m!384761))

(declare-fun m!384765 () Bool)

(assert (=> b!388541 m!384765))

(assert (=> b!388541 m!384757))

(declare-fun m!384767 () Bool)

(assert (=> b!388541 m!384767))

(assert (=> b!388541 m!384743))

(declare-fun m!384769 () Bool)

(assert (=> b!388541 m!384769))

(assert (=> b!388544 m!384647))

(assert (=> b!388544 m!384647))

(assert (=> b!388544 m!384651))

(declare-fun m!384771 () Bool)

(assert (=> b!388534 m!384771))

(assert (=> b!388316 d!72851))

(declare-fun call!27327 () ListLongMap!5273)

(declare-fun bm!27324 () Bool)

(assert (=> bm!27324 (= call!27327 (getCurrentListMapNoExtraKeys!927 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!388549 () Bool)

(declare-fun e!235427 () Bool)

(assert (=> b!388549 (= e!235427 (validKeyInArray!0 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)))))

(assert (=> b!388549 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!388550 () Bool)

(assert (=> b!388550 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(assert (=> b!388550 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11336 lt!182337)))))

(declare-fun lt!182502 () ListLongMap!5273)

(declare-fun e!235430 () Bool)

(assert (=> b!388550 (= e!235430 (= (apply!297 lt!182502 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)) (get!5569 (select (arr!10984 lt!182337) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!72853 () Bool)

(declare-fun e!235426 () Bool)

(assert (=> d!72853 e!235426))

(declare-fun res!222224 () Bool)

(assert (=> d!72853 (=> (not res!222224) (not e!235426))))

(assert (=> d!72853 (= res!222224 (not (contains!2420 lt!182502 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235424 () ListLongMap!5273)

(assert (=> d!72853 (= lt!182502 e!235424)))

(declare-fun c!53942 () Bool)

(assert (=> d!72853 (= c!53942 (bvsge #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(assert (=> d!72853 (validMask!0 mask!970)))

(assert (=> d!72853 (= (getCurrentListMapNoExtraKeys!927 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182502)))

(declare-fun b!388551 () Bool)

(declare-fun res!222226 () Bool)

(assert (=> b!388551 (=> (not res!222226) (not e!235426))))

(assert (=> b!388551 (= res!222226 (not (contains!2420 lt!182502 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388552 () Bool)

(assert (=> b!388552 (= e!235424 (ListLongMap!5274 Nil!6208))))

(declare-fun b!388553 () Bool)

(declare-fun lt!182504 () Unit!11879)

(declare-fun lt!182508 () Unit!11879)

(assert (=> b!388553 (= lt!182504 lt!182508)))

(declare-fun lt!182503 () (_ BitVec 64))

(declare-fun lt!182505 () V!13875)

(declare-fun lt!182506 () ListLongMap!5273)

(declare-fun lt!182507 () (_ BitVec 64))

(assert (=> b!388553 (not (contains!2420 (+!1006 lt!182506 (tuple2!6359 lt!182507 lt!182505)) lt!182503))))

(assert (=> b!388553 (= lt!182508 (addStillNotContains!132 lt!182506 lt!182507 lt!182505 lt!182503))))

(assert (=> b!388553 (= lt!182503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388553 (= lt!182505 (get!5569 (select (arr!10984 lt!182337) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388553 (= lt!182507 (select (arr!10983 lt!182331) #b00000000000000000000000000000000))))

(assert (=> b!388553 (= lt!182506 call!27327)))

(declare-fun e!235425 () ListLongMap!5273)

(assert (=> b!388553 (= e!235425 (+!1006 call!27327 (tuple2!6359 (select (arr!10983 lt!182331) #b00000000000000000000000000000000) (get!5569 (select (arr!10984 lt!182337) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!388554 () Bool)

(declare-fun e!235428 () Bool)

(assert (=> b!388554 (= e!235428 e!235430)))

(assert (=> b!388554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(declare-fun res!222223 () Bool)

(assert (=> b!388554 (= res!222223 (contains!2420 lt!182502 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)))))

(assert (=> b!388554 (=> (not res!222223) (not e!235430))))

(declare-fun b!388555 () Bool)

(declare-fun e!235429 () Bool)

(assert (=> b!388555 (= e!235428 e!235429)))

(declare-fun c!53941 () Bool)

(assert (=> b!388555 (= c!53941 (bvslt #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(declare-fun b!388556 () Bool)

(assert (=> b!388556 (= e!235424 e!235425)))

(declare-fun c!53939 () Bool)

(assert (=> b!388556 (= c!53939 (validKeyInArray!0 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)))))

(declare-fun b!388557 () Bool)

(assert (=> b!388557 (= e!235425 call!27327)))

(declare-fun b!388558 () Bool)

(assert (=> b!388558 (= e!235429 (isEmpty!549 lt!182502))))

(declare-fun b!388559 () Bool)

(assert (=> b!388559 (= e!235429 (= lt!182502 (getCurrentListMapNoExtraKeys!927 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!388560 () Bool)

(assert (=> b!388560 (= e!235426 e!235428)))

(declare-fun c!53940 () Bool)

(assert (=> b!388560 (= c!53940 e!235427)))

(declare-fun res!222225 () Bool)

(assert (=> b!388560 (=> (not res!222225) (not e!235427))))

(assert (=> b!388560 (= res!222225 (bvslt #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(assert (= (and d!72853 c!53942) b!388552))

(assert (= (and d!72853 (not c!53942)) b!388556))

(assert (= (and b!388556 c!53939) b!388553))

(assert (= (and b!388556 (not c!53939)) b!388557))

(assert (= (or b!388553 b!388557) bm!27324))

(assert (= (and d!72853 res!222224) b!388551))

(assert (= (and b!388551 res!222226) b!388560))

(assert (= (and b!388560 res!222225) b!388549))

(assert (= (and b!388560 c!53940) b!388554))

(assert (= (and b!388560 (not c!53940)) b!388555))

(assert (= (and b!388554 res!222223) b!388550))

(assert (= (and b!388555 c!53941) b!388559))

(assert (= (and b!388555 (not c!53941)) b!388558))

(declare-fun b_lambda!8555 () Bool)

(assert (=> (not b_lambda!8555) (not b!388550)))

(assert (=> b!388550 t!11357))

(declare-fun b_and!16173 () Bool)

(assert (= b_and!16171 (and (=> t!11357 result!5699) b_and!16173)))

(declare-fun b_lambda!8557 () Bool)

(assert (=> (not b_lambda!8557) (not b!388553)))

(assert (=> b!388553 t!11357))

(declare-fun b_and!16175 () Bool)

(assert (= b_and!16173 (and (=> t!11357 result!5699) b_and!16175)))

(declare-fun m!384773 () Bool)

(assert (=> b!388551 m!384773))

(declare-fun m!384775 () Bool)

(assert (=> b!388558 m!384775))

(declare-fun m!384777 () Bool)

(assert (=> b!388550 m!384777))

(assert (=> b!388550 m!384707))

(declare-fun m!384779 () Bool)

(assert (=> b!388550 m!384779))

(assert (=> b!388550 m!384655))

(declare-fun m!384781 () Bool)

(assert (=> b!388550 m!384781))

(assert (=> b!388550 m!384655))

(assert (=> b!388550 m!384777))

(assert (=> b!388550 m!384707))

(declare-fun m!384783 () Bool)

(assert (=> b!388559 m!384783))

(assert (=> bm!27324 m!384783))

(assert (=> b!388549 m!384655))

(assert (=> b!388549 m!384655))

(assert (=> b!388549 m!384657))

(assert (=> b!388556 m!384655))

(assert (=> b!388556 m!384655))

(assert (=> b!388556 m!384657))

(assert (=> b!388553 m!384655))

(assert (=> b!388553 m!384777))

(declare-fun m!384785 () Bool)

(assert (=> b!388553 m!384785))

(declare-fun m!384787 () Bool)

(assert (=> b!388553 m!384787))

(assert (=> b!388553 m!384785))

(declare-fun m!384789 () Bool)

(assert (=> b!388553 m!384789))

(assert (=> b!388553 m!384777))

(assert (=> b!388553 m!384707))

(assert (=> b!388553 m!384779))

(declare-fun m!384791 () Bool)

(assert (=> b!388553 m!384791))

(assert (=> b!388553 m!384707))

(declare-fun m!384793 () Bool)

(assert (=> d!72853 m!384793))

(assert (=> d!72853 m!384555))

(assert (=> b!388554 m!384655))

(assert (=> b!388554 m!384655))

(declare-fun m!384795 () Bool)

(assert (=> b!388554 m!384795))

(assert (=> b!388316 d!72853))

(declare-fun d!72855 () Bool)

(declare-fun e!235431 () Bool)

(assert (=> d!72855 e!235431))

(declare-fun res!222228 () Bool)

(assert (=> d!72855 (=> (not res!222228) (not e!235431))))

(declare-fun lt!182511 () ListLongMap!5273)

(assert (=> d!72855 (= res!222228 (contains!2420 lt!182511 (_1!3190 (tuple2!6359 k0!778 v!373))))))

(declare-fun lt!182510 () List!6211)

(assert (=> d!72855 (= lt!182511 (ListLongMap!5274 lt!182510))))

(declare-fun lt!182512 () Unit!11879)

(declare-fun lt!182509 () Unit!11879)

(assert (=> d!72855 (= lt!182512 lt!182509)))

(assert (=> d!72855 (= (getValueByKey!356 lt!182510 (_1!3190 (tuple2!6359 k0!778 v!373))) (Some!361 (_2!3190 (tuple2!6359 k0!778 v!373))))))

(assert (=> d!72855 (= lt!182509 (lemmaContainsTupThenGetReturnValue!178 lt!182510 (_1!3190 (tuple2!6359 k0!778 v!373)) (_2!3190 (tuple2!6359 k0!778 v!373))))))

(assert (=> d!72855 (= lt!182510 (insertStrictlySorted!181 (toList!2652 lt!182332) (_1!3190 (tuple2!6359 k0!778 v!373)) (_2!3190 (tuple2!6359 k0!778 v!373))))))

(assert (=> d!72855 (= (+!1006 lt!182332 (tuple2!6359 k0!778 v!373)) lt!182511)))

(declare-fun b!388561 () Bool)

(declare-fun res!222227 () Bool)

(assert (=> b!388561 (=> (not res!222227) (not e!235431))))

(assert (=> b!388561 (= res!222227 (= (getValueByKey!356 (toList!2652 lt!182511) (_1!3190 (tuple2!6359 k0!778 v!373))) (Some!361 (_2!3190 (tuple2!6359 k0!778 v!373)))))))

(declare-fun b!388562 () Bool)

(assert (=> b!388562 (= e!235431 (contains!2421 (toList!2652 lt!182511) (tuple2!6359 k0!778 v!373)))))

(assert (= (and d!72855 res!222228) b!388561))

(assert (= (and b!388561 res!222227) b!388562))

(declare-fun m!384797 () Bool)

(assert (=> d!72855 m!384797))

(declare-fun m!384799 () Bool)

(assert (=> d!72855 m!384799))

(declare-fun m!384801 () Bool)

(assert (=> d!72855 m!384801))

(declare-fun m!384803 () Bool)

(assert (=> d!72855 m!384803))

(declare-fun m!384805 () Bool)

(assert (=> b!388561 m!384805))

(declare-fun m!384807 () Bool)

(assert (=> b!388562 m!384807))

(assert (=> b!388316 d!72855))

(declare-fun b!388563 () Bool)

(declare-fun e!235435 () Unit!11879)

(declare-fun Unit!11884 () Unit!11879)

(assert (=> b!388563 (= e!235435 Unit!11884)))

(declare-fun b!388564 () Bool)

(declare-fun e!235438 () Bool)

(declare-fun call!27331 () Bool)

(assert (=> b!388564 (= e!235438 (not call!27331))))

(declare-fun b!388565 () Bool)

(declare-fun e!235439 () Bool)

(assert (=> b!388565 (= e!235439 e!235438)))

(declare-fun c!53948 () Bool)

(assert (=> b!388565 (= c!53948 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388566 () Bool)

(declare-fun e!235437 () Bool)

(assert (=> b!388566 (= e!235437 (validKeyInArray!0 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)))))

(declare-fun b!388567 () Bool)

(declare-fun e!235434 () Bool)

(assert (=> b!388567 (= e!235438 e!235434)))

(declare-fun res!222229 () Bool)

(assert (=> b!388567 (= res!222229 call!27331)))

(assert (=> b!388567 (=> (not res!222229) (not e!235434))))

(declare-fun bm!27325 () Bool)

(declare-fun call!27328 () ListLongMap!5273)

(declare-fun call!27334 () ListLongMap!5273)

(assert (=> bm!27325 (= call!27328 call!27334)))

(declare-fun b!388568 () Bool)

(declare-fun e!235443 () Bool)

(declare-fun e!235436 () Bool)

(assert (=> b!388568 (= e!235443 e!235436)))

(declare-fun res!222233 () Bool)

(assert (=> b!388568 (=> (not res!222233) (not e!235436))))

(declare-fun lt!182532 () ListLongMap!5273)

(assert (=> b!388568 (= res!222233 (contains!2420 lt!182532 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)))))

(assert (=> b!388568 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(declare-fun b!388569 () Bool)

(assert (=> b!388569 (= e!235434 (= (apply!297 lt!182532 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27326 () Bool)

(declare-fun call!27332 () ListLongMap!5273)

(declare-fun call!27333 () ListLongMap!5273)

(assert (=> bm!27326 (= call!27332 call!27333)))

(declare-fun b!388570 () Bool)

(declare-fun e!235432 () ListLongMap!5273)

(assert (=> b!388570 (= e!235432 call!27332)))

(declare-fun d!72857 () Bool)

(assert (=> d!72857 e!235439))

(declare-fun res!222235 () Bool)

(assert (=> d!72857 (=> (not res!222235) (not e!235439))))

(assert (=> d!72857 (= res!222235 (or (bvsge #b00000000000000000000000000000000 (size!11335 lt!182331)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11335 lt!182331)))))))

(declare-fun lt!182522 () ListLongMap!5273)

(assert (=> d!72857 (= lt!182532 lt!182522)))

(declare-fun lt!182524 () Unit!11879)

(assert (=> d!72857 (= lt!182524 e!235435)))

(declare-fun c!53944 () Bool)

(declare-fun e!235433 () Bool)

(assert (=> d!72857 (= c!53944 e!235433)))

(declare-fun res!222234 () Bool)

(assert (=> d!72857 (=> (not res!222234) (not e!235433))))

(assert (=> d!72857 (= res!222234 (bvslt #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(declare-fun e!235441 () ListLongMap!5273)

(assert (=> d!72857 (= lt!182522 e!235441)))

(declare-fun c!53946 () Bool)

(assert (=> d!72857 (= c!53946 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72857 (validMask!0 mask!970)))

(assert (=> d!72857 (= (getCurrentListMap!2038 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182532)))

(declare-fun b!388571 () Bool)

(declare-fun e!235440 () ListLongMap!5273)

(declare-fun call!27329 () ListLongMap!5273)

(assert (=> b!388571 (= e!235440 call!27329)))

(declare-fun b!388572 () Bool)

(assert (=> b!388572 (= e!235441 e!235432)))

(declare-fun c!53947 () Bool)

(assert (=> b!388572 (= c!53947 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388573 () Bool)

(declare-fun e!235442 () Bool)

(declare-fun call!27330 () Bool)

(assert (=> b!388573 (= e!235442 (not call!27330))))

(declare-fun b!388574 () Bool)

(assert (=> b!388574 (= e!235441 (+!1006 call!27333 (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27327 () Bool)

(assert (=> bm!27327 (= call!27330 (contains!2420 lt!182532 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388575 () Bool)

(assert (=> b!388575 (= e!235436 (= (apply!297 lt!182532 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)) (get!5569 (select (arr!10984 lt!182337) #b00000000000000000000000000000000) (dynLambda!640 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388575 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11336 lt!182337)))))

(assert (=> b!388575 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(declare-fun b!388576 () Bool)

(declare-fun lt!182516 () Unit!11879)

(assert (=> b!388576 (= e!235435 lt!182516)))

(declare-fun lt!182519 () ListLongMap!5273)

(assert (=> b!388576 (= lt!182519 (getCurrentListMapNoExtraKeys!927 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182515 () (_ BitVec 64))

(assert (=> b!388576 (= lt!182515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182526 () (_ BitVec 64))

(assert (=> b!388576 (= lt!182526 (select (arr!10983 lt!182331) #b00000000000000000000000000000000))))

(declare-fun lt!182527 () Unit!11879)

(assert (=> b!388576 (= lt!182527 (addStillContains!273 lt!182519 lt!182515 zeroValue!472 lt!182526))))

(assert (=> b!388576 (contains!2420 (+!1006 lt!182519 (tuple2!6359 lt!182515 zeroValue!472)) lt!182526)))

(declare-fun lt!182523 () Unit!11879)

(assert (=> b!388576 (= lt!182523 lt!182527)))

(declare-fun lt!182529 () ListLongMap!5273)

(assert (=> b!388576 (= lt!182529 (getCurrentListMapNoExtraKeys!927 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182531 () (_ BitVec 64))

(assert (=> b!388576 (= lt!182531 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182530 () (_ BitVec 64))

(assert (=> b!388576 (= lt!182530 (select (arr!10983 lt!182331) #b00000000000000000000000000000000))))

(declare-fun lt!182521 () Unit!11879)

(assert (=> b!388576 (= lt!182521 (addApplyDifferent!273 lt!182529 lt!182531 minValue!472 lt!182530))))

(assert (=> b!388576 (= (apply!297 (+!1006 lt!182529 (tuple2!6359 lt!182531 minValue!472)) lt!182530) (apply!297 lt!182529 lt!182530))))

(declare-fun lt!182513 () Unit!11879)

(assert (=> b!388576 (= lt!182513 lt!182521)))

(declare-fun lt!182514 () ListLongMap!5273)

(assert (=> b!388576 (= lt!182514 (getCurrentListMapNoExtraKeys!927 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182528 () (_ BitVec 64))

(assert (=> b!388576 (= lt!182528 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182518 () (_ BitVec 64))

(assert (=> b!388576 (= lt!182518 (select (arr!10983 lt!182331) #b00000000000000000000000000000000))))

(declare-fun lt!182525 () Unit!11879)

(assert (=> b!388576 (= lt!182525 (addApplyDifferent!273 lt!182514 lt!182528 zeroValue!472 lt!182518))))

(assert (=> b!388576 (= (apply!297 (+!1006 lt!182514 (tuple2!6359 lt!182528 zeroValue!472)) lt!182518) (apply!297 lt!182514 lt!182518))))

(declare-fun lt!182534 () Unit!11879)

(assert (=> b!388576 (= lt!182534 lt!182525)))

(declare-fun lt!182520 () ListLongMap!5273)

(assert (=> b!388576 (= lt!182520 (getCurrentListMapNoExtraKeys!927 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182533 () (_ BitVec 64))

(assert (=> b!388576 (= lt!182533 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182517 () (_ BitVec 64))

(assert (=> b!388576 (= lt!182517 (select (arr!10983 lt!182331) #b00000000000000000000000000000000))))

(assert (=> b!388576 (= lt!182516 (addApplyDifferent!273 lt!182520 lt!182533 minValue!472 lt!182517))))

(assert (=> b!388576 (= (apply!297 (+!1006 lt!182520 (tuple2!6359 lt!182533 minValue!472)) lt!182517) (apply!297 lt!182520 lt!182517))))

(declare-fun b!388577 () Bool)

(declare-fun res!222237 () Bool)

(assert (=> b!388577 (=> (not res!222237) (not e!235439))))

(assert (=> b!388577 (= res!222237 e!235443)))

(declare-fun res!222230 () Bool)

(assert (=> b!388577 (=> res!222230 e!235443)))

(assert (=> b!388577 (= res!222230 (not e!235437))))

(declare-fun res!222232 () Bool)

(assert (=> b!388577 (=> (not res!222232) (not e!235437))))

(assert (=> b!388577 (= res!222232 (bvslt #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(declare-fun bm!27328 () Bool)

(assert (=> bm!27328 (= call!27334 (getCurrentListMapNoExtraKeys!927 lt!182331 lt!182337 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388578 () Bool)

(declare-fun res!222236 () Bool)

(assert (=> b!388578 (=> (not res!222236) (not e!235439))))

(assert (=> b!388578 (= res!222236 e!235442)))

(declare-fun c!53945 () Bool)

(assert (=> b!388578 (= c!53945 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!388579 () Bool)

(assert (=> b!388579 (= e!235433 (validKeyInArray!0 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)))))

(declare-fun b!388580 () Bool)

(declare-fun e!235444 () Bool)

(assert (=> b!388580 (= e!235442 e!235444)))

(declare-fun res!222231 () Bool)

(assert (=> b!388580 (= res!222231 call!27330)))

(assert (=> b!388580 (=> (not res!222231) (not e!235444))))

(declare-fun b!388581 () Bool)

(assert (=> b!388581 (= e!235444 (= (apply!297 lt!182532 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!388582 () Bool)

(assert (=> b!388582 (= e!235440 call!27332)))

(declare-fun bm!27329 () Bool)

(assert (=> bm!27329 (= call!27331 (contains!2420 lt!182532 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27330 () Bool)

(assert (=> bm!27330 (= call!27333 (+!1006 (ite c!53946 call!27334 (ite c!53947 call!27328 call!27329)) (ite (or c!53946 c!53947) (tuple2!6359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6359 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27331 () Bool)

(assert (=> bm!27331 (= call!27329 call!27328)))

(declare-fun b!388583 () Bool)

(declare-fun c!53943 () Bool)

(assert (=> b!388583 (= c!53943 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!388583 (= e!235432 e!235440)))

(assert (= (and d!72857 c!53946) b!388574))

(assert (= (and d!72857 (not c!53946)) b!388572))

(assert (= (and b!388572 c!53947) b!388570))

(assert (= (and b!388572 (not c!53947)) b!388583))

(assert (= (and b!388583 c!53943) b!388582))

(assert (= (and b!388583 (not c!53943)) b!388571))

(assert (= (or b!388582 b!388571) bm!27331))

(assert (= (or b!388570 bm!27331) bm!27325))

(assert (= (or b!388570 b!388582) bm!27326))

(assert (= (or b!388574 bm!27325) bm!27328))

(assert (= (or b!388574 bm!27326) bm!27330))

(assert (= (and d!72857 res!222234) b!388579))

(assert (= (and d!72857 c!53944) b!388576))

(assert (= (and d!72857 (not c!53944)) b!388563))

(assert (= (and d!72857 res!222235) b!388577))

(assert (= (and b!388577 res!222232) b!388566))

(assert (= (and b!388577 (not res!222230)) b!388568))

(assert (= (and b!388568 res!222233) b!388575))

(assert (= (and b!388577 res!222237) b!388578))

(assert (= (and b!388578 c!53945) b!388580))

(assert (= (and b!388578 (not c!53945)) b!388573))

(assert (= (and b!388580 res!222231) b!388581))

(assert (= (or b!388580 b!388573) bm!27327))

(assert (= (and b!388578 res!222236) b!388565))

(assert (= (and b!388565 c!53948) b!388567))

(assert (= (and b!388565 (not c!53948)) b!388564))

(assert (= (and b!388567 res!222229) b!388569))

(assert (= (or b!388567 b!388564) bm!27329))

(declare-fun b_lambda!8559 () Bool)

(assert (=> (not b_lambda!8559) (not b!388575)))

(assert (=> b!388575 t!11357))

(declare-fun b_and!16177 () Bool)

(assert (= b_and!16175 (and (=> t!11357 result!5699) b_and!16177)))

(assert (=> b!388568 m!384655))

(assert (=> b!388568 m!384655))

(declare-fun m!384809 () Bool)

(assert (=> b!388568 m!384809))

(assert (=> d!72857 m!384555))

(assert (=> b!388566 m!384655))

(assert (=> b!388566 m!384655))

(assert (=> b!388566 m!384657))

(declare-fun m!384811 () Bool)

(assert (=> bm!27327 m!384811))

(assert (=> b!388575 m!384777))

(assert (=> b!388575 m!384707))

(assert (=> b!388575 m!384779))

(assert (=> b!388575 m!384655))

(assert (=> b!388575 m!384707))

(assert (=> b!388575 m!384777))

(assert (=> b!388575 m!384655))

(declare-fun m!384813 () Bool)

(assert (=> b!388575 m!384813))

(declare-fun m!384815 () Bool)

(assert (=> b!388581 m!384815))

(declare-fun m!384817 () Bool)

(assert (=> bm!27330 m!384817))

(assert (=> bm!27328 m!384531))

(declare-fun m!384819 () Bool)

(assert (=> bm!27329 m!384819))

(declare-fun m!384821 () Bool)

(assert (=> b!388574 m!384821))

(declare-fun m!384823 () Bool)

(assert (=> b!388576 m!384823))

(declare-fun m!384825 () Bool)

(assert (=> b!388576 m!384825))

(assert (=> b!388576 m!384655))

(declare-fun m!384827 () Bool)

(assert (=> b!388576 m!384827))

(assert (=> b!388576 m!384823))

(declare-fun m!384829 () Bool)

(assert (=> b!388576 m!384829))

(declare-fun m!384831 () Bool)

(assert (=> b!388576 m!384831))

(declare-fun m!384833 () Bool)

(assert (=> b!388576 m!384833))

(declare-fun m!384835 () Bool)

(assert (=> b!388576 m!384835))

(declare-fun m!384837 () Bool)

(assert (=> b!388576 m!384837))

(declare-fun m!384839 () Bool)

(assert (=> b!388576 m!384839))

(declare-fun m!384841 () Bool)

(assert (=> b!388576 m!384841))

(assert (=> b!388576 m!384531))

(declare-fun m!384843 () Bool)

(assert (=> b!388576 m!384843))

(declare-fun m!384845 () Bool)

(assert (=> b!388576 m!384845))

(assert (=> b!388576 m!384843))

(declare-fun m!384847 () Bool)

(assert (=> b!388576 m!384847))

(assert (=> b!388576 m!384839))

(declare-fun m!384849 () Bool)

(assert (=> b!388576 m!384849))

(assert (=> b!388576 m!384825))

(declare-fun m!384851 () Bool)

(assert (=> b!388576 m!384851))

(assert (=> b!388579 m!384655))

(assert (=> b!388579 m!384655))

(assert (=> b!388579 m!384657))

(declare-fun m!384853 () Bool)

(assert (=> b!388569 m!384853))

(assert (=> b!388316 d!72857))

(declare-fun call!27340 () ListLongMap!5273)

(declare-fun bm!27336 () Bool)

(assert (=> bm!27336 (= call!27340 (getCurrentListMapNoExtraKeys!927 (array!23031 (store (arr!10983 _keys!658) i!548 k0!778) (size!11335 _keys!658)) (array!23033 (store (arr!10984 _values!506) i!548 (ValueCellFull!4445 v!373)) (size!11336 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!72859 () Bool)

(declare-fun e!235450 () Bool)

(assert (=> d!72859 e!235450))

(declare-fun res!222240 () Bool)

(assert (=> d!72859 (=> (not res!222240) (not e!235450))))

(assert (=> d!72859 (= res!222240 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11335 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11336 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11335 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11336 _values!506))))))))

(declare-fun lt!182537 () Unit!11879)

(declare-fun choose!1318 (array!23030 array!23032 (_ BitVec 32) (_ BitVec 32) V!13875 V!13875 (_ BitVec 32) (_ BitVec 64) V!13875 (_ BitVec 32) Int) Unit!11879)

(assert (=> d!72859 (= lt!182537 (choose!1318 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11335 _keys!658)))))

(assert (=> d!72859 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!229 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!182537)))

(declare-fun b!388590 () Bool)

(declare-fun e!235449 () Bool)

(assert (=> b!388590 (= e!235450 e!235449)))

(declare-fun c!53951 () Bool)

(assert (=> b!388590 (= c!53951 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun call!27339 () ListLongMap!5273)

(declare-fun bm!27337 () Bool)

(assert (=> bm!27337 (= call!27339 (getCurrentListMapNoExtraKeys!927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388591 () Bool)

(assert (=> b!388591 (= e!235449 (= call!27340 call!27339))))

(declare-fun b!388592 () Bool)

(assert (=> b!388592 (= e!235449 (= call!27340 (+!1006 call!27339 (tuple2!6359 k0!778 v!373))))))

(assert (= (and d!72859 res!222240) b!388590))

(assert (= (and b!388590 c!53951) b!388592))

(assert (= (and b!388590 (not c!53951)) b!388591))

(assert (= (or b!388592 b!388591) bm!27337))

(assert (= (or b!388592 b!388591) bm!27336))

(assert (=> bm!27336 m!384537))

(assert (=> bm!27336 m!384527))

(declare-fun m!384855 () Bool)

(assert (=> bm!27336 m!384855))

(declare-fun m!384857 () Bool)

(assert (=> d!72859 m!384857))

(assert (=> bm!27337 m!384521))

(declare-fun m!384859 () Bool)

(assert (=> b!388592 m!384859))

(assert (=> b!388316 d!72859))

(declare-fun b!388593 () Bool)

(declare-fun e!235451 () Bool)

(assert (=> b!388593 (= e!235451 (contains!2419 Nil!6207 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)))))

(declare-fun b!388594 () Bool)

(declare-fun e!235454 () Bool)

(declare-fun call!27341 () Bool)

(assert (=> b!388594 (= e!235454 call!27341)))

(declare-fun b!388595 () Bool)

(assert (=> b!388595 (= e!235454 call!27341)))

(declare-fun d!72861 () Bool)

(declare-fun res!222241 () Bool)

(declare-fun e!235452 () Bool)

(assert (=> d!72861 (=> res!222241 e!235452)))

(assert (=> d!72861 (= res!222241 (bvsge #b00000000000000000000000000000000 (size!11335 lt!182331)))))

(assert (=> d!72861 (= (arrayNoDuplicates!0 lt!182331 #b00000000000000000000000000000000 Nil!6207) e!235452)))

(declare-fun b!388596 () Bool)

(declare-fun e!235453 () Bool)

(assert (=> b!388596 (= e!235452 e!235453)))

(declare-fun res!222243 () Bool)

(assert (=> b!388596 (=> (not res!222243) (not e!235453))))

(assert (=> b!388596 (= res!222243 (not e!235451))))

(declare-fun res!222242 () Bool)

(assert (=> b!388596 (=> (not res!222242) (not e!235451))))

(assert (=> b!388596 (= res!222242 (validKeyInArray!0 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)))))

(declare-fun bm!27338 () Bool)

(declare-fun c!53952 () Bool)

(assert (=> bm!27338 (= call!27341 (arrayNoDuplicates!0 lt!182331 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53952 (Cons!6206 (select (arr!10983 lt!182331) #b00000000000000000000000000000000) Nil!6207) Nil!6207)))))

(declare-fun b!388597 () Bool)

(assert (=> b!388597 (= e!235453 e!235454)))

(assert (=> b!388597 (= c!53952 (validKeyInArray!0 (select (arr!10983 lt!182331) #b00000000000000000000000000000000)))))

(assert (= (and d!72861 (not res!222241)) b!388596))

(assert (= (and b!388596 res!222242) b!388593))

(assert (= (and b!388596 res!222243) b!388597))

(assert (= (and b!388597 c!53952) b!388595))

(assert (= (and b!388597 (not c!53952)) b!388594))

(assert (= (or b!388595 b!388594) bm!27338))

(assert (=> b!388593 m!384655))

(assert (=> b!388593 m!384655))

(declare-fun m!384861 () Bool)

(assert (=> b!388593 m!384861))

(assert (=> b!388596 m!384655))

(assert (=> b!388596 m!384655))

(assert (=> b!388596 m!384657))

(assert (=> bm!27338 m!384655))

(declare-fun m!384863 () Bool)

(assert (=> bm!27338 m!384863))

(assert (=> b!388597 m!384655))

(assert (=> b!388597 m!384655))

(assert (=> b!388597 m!384657))

(assert (=> b!388311 d!72861))

(declare-fun b!388604 () Bool)

(declare-fun e!235459 () Bool)

(assert (=> b!388604 (= e!235459 tp_is_empty!9577)))

(declare-fun mapNonEmpty!15939 () Bool)

(declare-fun mapRes!15939 () Bool)

(declare-fun tp!31482 () Bool)

(assert (=> mapNonEmpty!15939 (= mapRes!15939 (and tp!31482 e!235459))))

(declare-fun mapKey!15939 () (_ BitVec 32))

(declare-fun mapRest!15939 () (Array (_ BitVec 32) ValueCell!4445))

(declare-fun mapValue!15939 () ValueCell!4445)

(assert (=> mapNonEmpty!15939 (= mapRest!15930 (store mapRest!15939 mapKey!15939 mapValue!15939))))

(declare-fun mapIsEmpty!15939 () Bool)

(assert (=> mapIsEmpty!15939 mapRes!15939))

(declare-fun b!388605 () Bool)

(declare-fun e!235460 () Bool)

(assert (=> b!388605 (= e!235460 tp_is_empty!9577)))

(declare-fun condMapEmpty!15939 () Bool)

(declare-fun mapDefault!15939 () ValueCell!4445)

(assert (=> mapNonEmpty!15930 (= condMapEmpty!15939 (= mapRest!15930 ((as const (Array (_ BitVec 32) ValueCell!4445)) mapDefault!15939)))))

(assert (=> mapNonEmpty!15930 (= tp!31467 (and e!235460 mapRes!15939))))

(assert (= (and mapNonEmpty!15930 condMapEmpty!15939) mapIsEmpty!15939))

(assert (= (and mapNonEmpty!15930 (not condMapEmpty!15939)) mapNonEmpty!15939))

(assert (= (and mapNonEmpty!15939 ((_ is ValueCellFull!4445) mapValue!15939)) b!388604))

(assert (= (and mapNonEmpty!15930 ((_ is ValueCellFull!4445) mapDefault!15939)) b!388605))

(declare-fun m!384865 () Bool)

(assert (=> mapNonEmpty!15939 m!384865))

(declare-fun b_lambda!8561 () Bool)

(assert (= b_lambda!8551 (or (and start!37788 b_free!8905) b_lambda!8561)))

(declare-fun b_lambda!8563 () Bool)

(assert (= b_lambda!8555 (or (and start!37788 b_free!8905) b_lambda!8563)))

(declare-fun b_lambda!8565 () Bool)

(assert (= b_lambda!8559 (or (and start!37788 b_free!8905) b_lambda!8565)))

(declare-fun b_lambda!8567 () Bool)

(assert (= b_lambda!8557 (or (and start!37788 b_free!8905) b_lambda!8567)))

(declare-fun b_lambda!8569 () Bool)

(assert (= b_lambda!8549 (or (and start!37788 b_free!8905) b_lambda!8569)))

(declare-fun b_lambda!8571 () Bool)

(assert (= b_lambda!8553 (or (and start!37788 b_free!8905) b_lambda!8571)))

(check-sat (not b!388435) (not b!388531) (not b!388597) (not b!388550) (not b!388482) (not bm!27299) (not b!388476) (not b!388551) (not bm!27338) (not b!388533) (not b!388434) (not bm!27330) (not b!388561) (not b!388568) (not b_lambda!8567) (not bm!27324) (not b!388541) (not b!388579) (not b!388436) (not b!388549) (not b!388417) (not bm!27319) (not b!388596) (not b!388576) (not b!388546) (not b!388534) (not b!388416) (not b!388429) (not d!72857) (not d!72859) (not b_lambda!8563) (not b!388566) (not bm!27336) (not b_lambda!8561) (not bm!27327) (not b!388562) (not b!388559) (not d!72835) (not d!72851) (not b!388447) (not b!388439) (not bm!27329) (not b_next!8905) (not d!72853) (not d!72849) (not b!388593) (not b!388574) (not d!72855) (not bm!27328) (not b!388472) (not b!388556) (not b!388558) (not bm!27298) (not b!388481) (not b!388477) (not b!388427) (not b!388592) b_and!16177 (not b!388569) (not b!388441) (not bm!27320) (not b!388544) (not b!388474) (not b_lambda!8565) (not b!388581) (not b_lambda!8569) (not b!388540) (not bm!27302) (not b!388413) (not b!388473) (not bm!27322) (not bm!27295) tp_is_empty!9577 (not b!388479) (not b!388553) (not bm!27337) (not b!388539) (not bm!27321) (not b!388437) (not d!72833) (not b_lambda!8571) (not b!388575) (not mapNonEmpty!15939) (not b!388554))
(check-sat b_and!16177 (not b_next!8905))
