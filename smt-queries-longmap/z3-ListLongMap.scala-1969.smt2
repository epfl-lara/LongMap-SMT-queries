; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34658 () Bool)

(assert start!34658)

(declare-fun b_free!7485 () Bool)

(declare-fun b_next!7485 () Bool)

(assert (=> start!34658 (= b_free!7485 (not b_next!7485))))

(declare-fun tp!26016 () Bool)

(declare-fun b_and!14703 () Bool)

(assert (=> start!34658 (= tp!26016 b_and!14703)))

(declare-fun b!346303 () Bool)

(declare-fun res!191554 () Bool)

(declare-fun e!212249 () Bool)

(assert (=> b!346303 (=> (not res!191554) (not e!212249))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10893 0))(
  ( (V!10894 (val!3763 Int)) )
))
(declare-datatypes ((ValueCell!3375 0))(
  ( (ValueCellFull!3375 (v!5944 V!10893)) (EmptyCell!3375) )
))
(declare-datatypes ((array!18465 0))(
  ( (array!18466 (arr!8744 (Array (_ BitVec 32) ValueCell!3375)) (size!9096 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18465)

(declare-datatypes ((array!18467 0))(
  ( (array!18468 (arr!8745 (Array (_ BitVec 32) (_ BitVec 64))) (size!9097 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18467)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346303 (= res!191554 (and (= (size!9096 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9097 _keys!1895) (size!9096 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!191558 () Bool)

(assert (=> start!34658 (=> (not res!191558) (not e!212249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34658 (= res!191558 (validMask!0 mask!2385))))

(assert (=> start!34658 e!212249))

(assert (=> start!34658 true))

(declare-fun tp_is_empty!7437 () Bool)

(assert (=> start!34658 tp_is_empty!7437))

(assert (=> start!34658 tp!26016))

(declare-fun e!212248 () Bool)

(declare-fun array_inv!6472 (array!18465) Bool)

(assert (=> start!34658 (and (array_inv!6472 _values!1525) e!212248)))

(declare-fun array_inv!6473 (array!18467) Bool)

(assert (=> start!34658 (array_inv!6473 _keys!1895)))

(declare-fun b!346304 () Bool)

(declare-fun e!212246 () Bool)

(declare-datatypes ((SeekEntryResult!3371 0))(
  ( (MissingZero!3371 (index!15663 (_ BitVec 32))) (Found!3371 (index!15664 (_ BitVec 32))) (Intermediate!3371 (undefined!4183 Bool) (index!15665 (_ BitVec 32)) (x!34495 (_ BitVec 32))) (Undefined!3371) (MissingVacant!3371 (index!15666 (_ BitVec 32))) )
))
(declare-fun lt!163282 () SeekEntryResult!3371)

(assert (=> b!346304 (= e!212246 (and (bvsge (index!15664 lt!163282) #b00000000000000000000000000000000) (bvslt (index!15664 lt!163282) (size!9097 _keys!1895)) (bvsge (size!9097 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!346305 () Bool)

(declare-fun res!191561 () Bool)

(assert (=> b!346305 (=> (not res!191561) (not e!212249))))

(declare-datatypes ((List!5064 0))(
  ( (Nil!5061) (Cons!5060 (h!5916 (_ BitVec 64)) (t!10190 List!5064)) )
))
(declare-fun arrayNoDuplicates!0 (array!18467 (_ BitVec 32) List!5064) Bool)

(assert (=> b!346305 (= res!191561 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5061))))

(declare-fun b!346306 () Bool)

(declare-fun e!212245 () Bool)

(assert (=> b!346306 (= e!212245 tp_is_empty!7437)))

(declare-fun b!346307 () Bool)

(declare-fun res!191557 () Bool)

(assert (=> b!346307 (=> (not res!191557) (not e!212246))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346307 (= res!191557 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15664 lt!163282)))))

(declare-fun mapNonEmpty!12609 () Bool)

(declare-fun mapRes!12609 () Bool)

(declare-fun tp!26015 () Bool)

(declare-fun e!212250 () Bool)

(assert (=> mapNonEmpty!12609 (= mapRes!12609 (and tp!26015 e!212250))))

(declare-fun mapRest!12609 () (Array (_ BitVec 32) ValueCell!3375))

(declare-fun mapValue!12609 () ValueCell!3375)

(declare-fun mapKey!12609 () (_ BitVec 32))

(assert (=> mapNonEmpty!12609 (= (arr!8744 _values!1525) (store mapRest!12609 mapKey!12609 mapValue!12609))))

(declare-fun b!346308 () Bool)

(declare-fun res!191555 () Bool)

(assert (=> b!346308 (=> (not res!191555) (not e!212249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18467 (_ BitVec 32)) Bool)

(assert (=> b!346308 (= res!191555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!346309 () Bool)

(declare-fun res!191556 () Bool)

(assert (=> b!346309 (=> (not res!191556) (not e!212249))))

(declare-fun zeroValue!1467 () V!10893)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10893)

(declare-datatypes ((tuple2!5442 0))(
  ( (tuple2!5443 (_1!2732 (_ BitVec 64)) (_2!2732 V!10893)) )
))
(declare-datatypes ((List!5065 0))(
  ( (Nil!5062) (Cons!5061 (h!5917 tuple2!5442) (t!10191 List!5065)) )
))
(declare-datatypes ((ListLongMap!4355 0))(
  ( (ListLongMap!4356 (toList!2193 List!5065)) )
))
(declare-fun contains!2256 (ListLongMap!4355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1714 (array!18467 array!18465 (_ BitVec 32) (_ BitVec 32) V!10893 V!10893 (_ BitVec 32) Int) ListLongMap!4355)

(assert (=> b!346309 (= res!191556 (not (contains!2256 (getCurrentListMap!1714 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!346310 () Bool)

(assert (=> b!346310 (= e!212248 (and e!212245 mapRes!12609))))

(declare-fun condMapEmpty!12609 () Bool)

(declare-fun mapDefault!12609 () ValueCell!3375)

(assert (=> b!346310 (= condMapEmpty!12609 (= (arr!8744 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3375)) mapDefault!12609)))))

(declare-fun mapIsEmpty!12609 () Bool)

(assert (=> mapIsEmpty!12609 mapRes!12609))

(declare-fun b!346311 () Bool)

(assert (=> b!346311 (= e!212249 e!212246)))

(declare-fun res!191559 () Bool)

(assert (=> b!346311 (=> (not res!191559) (not e!212246))))

(get-info :version)

(assert (=> b!346311 (= res!191559 (and ((_ is Found!3371) lt!163282) (= (select (arr!8745 _keys!1895) (index!15664 lt!163282)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18467 (_ BitVec 32)) SeekEntryResult!3371)

(assert (=> b!346311 (= lt!163282 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346312 () Bool)

(declare-fun res!191560 () Bool)

(assert (=> b!346312 (=> (not res!191560) (not e!212249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346312 (= res!191560 (validKeyInArray!0 k0!1348))))

(declare-fun b!346313 () Bool)

(assert (=> b!346313 (= e!212250 tp_is_empty!7437)))

(assert (= (and start!34658 res!191558) b!346303))

(assert (= (and b!346303 res!191554) b!346308))

(assert (= (and b!346308 res!191555) b!346305))

(assert (= (and b!346305 res!191561) b!346312))

(assert (= (and b!346312 res!191560) b!346309))

(assert (= (and b!346309 res!191556) b!346311))

(assert (= (and b!346311 res!191559) b!346307))

(assert (= (and b!346307 res!191557) b!346304))

(assert (= (and b!346310 condMapEmpty!12609) mapIsEmpty!12609))

(assert (= (and b!346310 (not condMapEmpty!12609)) mapNonEmpty!12609))

(assert (= (and mapNonEmpty!12609 ((_ is ValueCellFull!3375) mapValue!12609)) b!346313))

(assert (= (and b!346310 ((_ is ValueCellFull!3375) mapDefault!12609)) b!346306))

(assert (= start!34658 b!346310))

(declare-fun m!347439 () Bool)

(assert (=> b!346305 m!347439))

(declare-fun m!347441 () Bool)

(assert (=> mapNonEmpty!12609 m!347441))

(declare-fun m!347443 () Bool)

(assert (=> b!346311 m!347443))

(declare-fun m!347445 () Bool)

(assert (=> b!346311 m!347445))

(declare-fun m!347447 () Bool)

(assert (=> start!34658 m!347447))

(declare-fun m!347449 () Bool)

(assert (=> start!34658 m!347449))

(declare-fun m!347451 () Bool)

(assert (=> start!34658 m!347451))

(declare-fun m!347453 () Bool)

(assert (=> b!346307 m!347453))

(declare-fun m!347455 () Bool)

(assert (=> b!346308 m!347455))

(declare-fun m!347457 () Bool)

(assert (=> b!346312 m!347457))

(declare-fun m!347459 () Bool)

(assert (=> b!346309 m!347459))

(assert (=> b!346309 m!347459))

(declare-fun m!347461 () Bool)

(assert (=> b!346309 m!347461))

(check-sat (not b!346312) (not b!346307) (not start!34658) b_and!14703 tp_is_empty!7437 (not b!346308) (not b!346309) (not b_next!7485) (not b!346311) (not mapNonEmpty!12609) (not b!346305))
(check-sat b_and!14703 (not b_next!7485))
(get-model)

(declare-fun d!71225 () Bool)

(assert (=> d!71225 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34658 d!71225))

(declare-fun d!71227 () Bool)

(assert (=> d!71227 (= (array_inv!6472 _values!1525) (bvsge (size!9096 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34658 d!71227))

(declare-fun d!71229 () Bool)

(assert (=> d!71229 (= (array_inv!6473 _keys!1895) (bvsge (size!9097 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34658 d!71229))

(declare-fun d!71231 () Bool)

(declare-fun e!212273 () Bool)

(assert (=> d!71231 e!212273))

(declare-fun res!191588 () Bool)

(assert (=> d!71231 (=> res!191588 e!212273)))

(declare-fun lt!163295 () Bool)

(assert (=> d!71231 (= res!191588 (not lt!163295))))

(declare-fun lt!163296 () Bool)

(assert (=> d!71231 (= lt!163295 lt!163296)))

(declare-datatypes ((Unit!10749 0))(
  ( (Unit!10750) )
))
(declare-fun lt!163297 () Unit!10749)

(declare-fun e!212274 () Unit!10749)

(assert (=> d!71231 (= lt!163297 e!212274)))

(declare-fun c!53139 () Bool)

(assert (=> d!71231 (= c!53139 lt!163296)))

(declare-fun containsKey!335 (List!5065 (_ BitVec 64)) Bool)

(assert (=> d!71231 (= lt!163296 (containsKey!335 (toList!2193 (getCurrentListMap!1714 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71231 (= (contains!2256 (getCurrentListMap!1714 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!163295)))

(declare-fun b!346353 () Bool)

(declare-fun lt!163294 () Unit!10749)

(assert (=> b!346353 (= e!212274 lt!163294)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!283 (List!5065 (_ BitVec 64)) Unit!10749)

(assert (=> b!346353 (= lt!163294 (lemmaContainsKeyImpliesGetValueByKeyDefined!283 (toList!2193 (getCurrentListMap!1714 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!349 0))(
  ( (Some!348 (v!5946 V!10893)) (None!347) )
))
(declare-fun isDefined!284 (Option!349) Bool)

(declare-fun getValueByKey!343 (List!5065 (_ BitVec 64)) Option!349)

(assert (=> b!346353 (isDefined!284 (getValueByKey!343 (toList!2193 (getCurrentListMap!1714 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!346354 () Bool)

(declare-fun Unit!10751 () Unit!10749)

(assert (=> b!346354 (= e!212274 Unit!10751)))

(declare-fun b!346355 () Bool)

(assert (=> b!346355 (= e!212273 (isDefined!284 (getValueByKey!343 (toList!2193 (getCurrentListMap!1714 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71231 c!53139) b!346353))

(assert (= (and d!71231 (not c!53139)) b!346354))

(assert (= (and d!71231 (not res!191588)) b!346355))

(declare-fun m!347487 () Bool)

(assert (=> d!71231 m!347487))

(declare-fun m!347489 () Bool)

(assert (=> b!346353 m!347489))

(declare-fun m!347491 () Bool)

(assert (=> b!346353 m!347491))

(assert (=> b!346353 m!347491))

(declare-fun m!347493 () Bool)

(assert (=> b!346353 m!347493))

(assert (=> b!346355 m!347491))

(assert (=> b!346355 m!347491))

(assert (=> b!346355 m!347493))

(assert (=> b!346309 d!71231))

(declare-fun b!346398 () Bool)

(declare-fun e!212303 () Bool)

(declare-fun e!212306 () Bool)

(assert (=> b!346398 (= e!212303 e!212306)))

(declare-fun res!191609 () Bool)

(assert (=> b!346398 (=> (not res!191609) (not e!212306))))

(declare-fun lt!163347 () ListLongMap!4355)

(assert (=> b!346398 (= res!191609 (contains!2256 lt!163347 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!346398 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9097 _keys!1895)))))

(declare-fun call!26824 () ListLongMap!4355)

(declare-fun call!26829 () ListLongMap!4355)

(declare-fun call!26830 () ListLongMap!4355)

(declare-fun c!53156 () Bool)

(declare-fun call!26825 () ListLongMap!4355)

(declare-fun bm!26821 () Bool)

(declare-fun c!53152 () Bool)

(declare-fun +!734 (ListLongMap!4355 tuple2!5442) ListLongMap!4355)

(assert (=> bm!26821 (= call!26824 (+!734 (ite c!53152 call!26829 (ite c!53156 call!26825 call!26830)) (ite (or c!53152 c!53156) (tuple2!5443 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!346399 () Bool)

(declare-fun e!212301 () ListLongMap!4355)

(declare-fun call!26828 () ListLongMap!4355)

(assert (=> b!346399 (= e!212301 call!26828)))

(declare-fun bm!26822 () Bool)

(assert (=> bm!26822 (= call!26828 call!26824)))

(declare-fun b!346400 () Bool)

(declare-fun e!212310 () ListLongMap!4355)

(assert (=> b!346400 (= e!212310 (+!734 call!26824 (tuple2!5443 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!346401 () Bool)

(declare-fun e!212307 () Unit!10749)

(declare-fun Unit!10752 () Unit!10749)

(assert (=> b!346401 (= e!212307 Unit!10752)))

(declare-fun b!346402 () Bool)

(declare-fun res!191612 () Bool)

(declare-fun e!212308 () Bool)

(assert (=> b!346402 (=> (not res!191612) (not e!212308))))

(assert (=> b!346402 (= res!191612 e!212303)))

(declare-fun res!191613 () Bool)

(assert (=> b!346402 (=> res!191613 e!212303)))

(declare-fun e!212311 () Bool)

(assert (=> b!346402 (= res!191613 (not e!212311))))

(declare-fun res!191615 () Bool)

(assert (=> b!346402 (=> (not res!191615) (not e!212311))))

(assert (=> b!346402 (= res!191615 (bvslt #b00000000000000000000000000000000 (size!9097 _keys!1895)))))

(declare-fun b!346403 () Bool)

(declare-fun lt!163343 () Unit!10749)

(assert (=> b!346403 (= e!212307 lt!163343)))

(declare-fun lt!163358 () ListLongMap!4355)

(declare-fun getCurrentListMapNoExtraKeys!607 (array!18467 array!18465 (_ BitVec 32) (_ BitVec 32) V!10893 V!10893 (_ BitVec 32) Int) ListLongMap!4355)

(assert (=> b!346403 (= lt!163358 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163346 () (_ BitVec 64))

(assert (=> b!346403 (= lt!163346 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163349 () (_ BitVec 64))

(assert (=> b!346403 (= lt!163349 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163348 () Unit!10749)

(declare-fun addStillContains!261 (ListLongMap!4355 (_ BitVec 64) V!10893 (_ BitVec 64)) Unit!10749)

(assert (=> b!346403 (= lt!163348 (addStillContains!261 lt!163358 lt!163346 zeroValue!1467 lt!163349))))

(assert (=> b!346403 (contains!2256 (+!734 lt!163358 (tuple2!5443 lt!163346 zeroValue!1467)) lt!163349)))

(declare-fun lt!163351 () Unit!10749)

(assert (=> b!346403 (= lt!163351 lt!163348)))

(declare-fun lt!163352 () ListLongMap!4355)

(assert (=> b!346403 (= lt!163352 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163355 () (_ BitVec 64))

(assert (=> b!346403 (= lt!163355 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163357 () (_ BitVec 64))

(assert (=> b!346403 (= lt!163357 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163354 () Unit!10749)

(declare-fun addApplyDifferent!261 (ListLongMap!4355 (_ BitVec 64) V!10893 (_ BitVec 64)) Unit!10749)

(assert (=> b!346403 (= lt!163354 (addApplyDifferent!261 lt!163352 lt!163355 minValue!1467 lt!163357))))

(declare-fun apply!285 (ListLongMap!4355 (_ BitVec 64)) V!10893)

(assert (=> b!346403 (= (apply!285 (+!734 lt!163352 (tuple2!5443 lt!163355 minValue!1467)) lt!163357) (apply!285 lt!163352 lt!163357))))

(declare-fun lt!163360 () Unit!10749)

(assert (=> b!346403 (= lt!163360 lt!163354)))

(declare-fun lt!163362 () ListLongMap!4355)

(assert (=> b!346403 (= lt!163362 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163344 () (_ BitVec 64))

(assert (=> b!346403 (= lt!163344 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163342 () (_ BitVec 64))

(assert (=> b!346403 (= lt!163342 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163350 () Unit!10749)

(assert (=> b!346403 (= lt!163350 (addApplyDifferent!261 lt!163362 lt!163344 zeroValue!1467 lt!163342))))

(assert (=> b!346403 (= (apply!285 (+!734 lt!163362 (tuple2!5443 lt!163344 zeroValue!1467)) lt!163342) (apply!285 lt!163362 lt!163342))))

(declare-fun lt!163345 () Unit!10749)

(assert (=> b!346403 (= lt!163345 lt!163350)))

(declare-fun lt!163363 () ListLongMap!4355)

(assert (=> b!346403 (= lt!163363 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!163359 () (_ BitVec 64))

(assert (=> b!346403 (= lt!163359 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!163356 () (_ BitVec 64))

(assert (=> b!346403 (= lt!163356 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!346403 (= lt!163343 (addApplyDifferent!261 lt!163363 lt!163359 minValue!1467 lt!163356))))

(assert (=> b!346403 (= (apply!285 (+!734 lt!163363 (tuple2!5443 lt!163359 minValue!1467)) lt!163356) (apply!285 lt!163363 lt!163356))))

(declare-fun b!346404 () Bool)

(declare-fun c!53157 () Bool)

(assert (=> b!346404 (= c!53157 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!212302 () ListLongMap!4355)

(assert (=> b!346404 (= e!212301 e!212302)))

(declare-fun bm!26823 () Bool)

(assert (=> bm!26823 (= call!26825 call!26829)))

(declare-fun b!346405 () Bool)

(declare-fun e!212304 () Bool)

(assert (=> b!346405 (= e!212304 (= (apply!285 lt!163347 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!346406 () Bool)

(assert (=> b!346406 (= e!212302 call!26830)))

(declare-fun bm!26824 () Bool)

(assert (=> bm!26824 (= call!26829 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!346407 () Bool)

(assert (=> b!346407 (= e!212302 call!26828)))

(declare-fun b!346408 () Bool)

(declare-fun e!212312 () Bool)

(assert (=> b!346408 (= e!212312 (validKeyInArray!0 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26825 () Bool)

(declare-fun call!26826 () Bool)

(assert (=> bm!26825 (= call!26826 (contains!2256 lt!163347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!346409 () Bool)

(declare-fun e!212309 () Bool)

(assert (=> b!346409 (= e!212309 (not call!26826))))

(declare-fun bm!26826 () Bool)

(assert (=> bm!26826 (= call!26830 call!26825)))

(declare-fun b!346410 () Bool)

(assert (=> b!346410 (= e!212309 e!212304)))

(declare-fun res!191608 () Bool)

(assert (=> b!346410 (= res!191608 call!26826)))

(assert (=> b!346410 (=> (not res!191608) (not e!212304))))

(declare-fun b!346411 () Bool)

(declare-fun e!212305 () Bool)

(assert (=> b!346411 (= e!212308 e!212305)))

(declare-fun c!53153 () Bool)

(assert (=> b!346411 (= c!53153 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!346412 () Bool)

(declare-fun res!191611 () Bool)

(assert (=> b!346412 (=> (not res!191611) (not e!212308))))

(assert (=> b!346412 (= res!191611 e!212309)))

(declare-fun c!53155 () Bool)

(assert (=> b!346412 (= c!53155 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!346413 () Bool)

(declare-fun e!212313 () Bool)

(assert (=> b!346413 (= e!212313 (= (apply!285 lt!163347 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!346414 () Bool)

(assert (=> b!346414 (= e!212311 (validKeyInArray!0 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346415 () Bool)

(declare-fun get!4709 (ValueCell!3375 V!10893) V!10893)

(declare-fun dynLambda!628 (Int (_ BitVec 64)) V!10893)

(assert (=> b!346415 (= e!212306 (= (apply!285 lt!163347 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000)) (get!4709 (select (arr!8744 _values!1525) #b00000000000000000000000000000000) (dynLambda!628 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!346415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9096 _values!1525)))))

(assert (=> b!346415 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9097 _keys!1895)))))

(declare-fun d!71233 () Bool)

(assert (=> d!71233 e!212308))

(declare-fun res!191607 () Bool)

(assert (=> d!71233 (=> (not res!191607) (not e!212308))))

(assert (=> d!71233 (= res!191607 (or (bvsge #b00000000000000000000000000000000 (size!9097 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9097 _keys!1895)))))))

(declare-fun lt!163353 () ListLongMap!4355)

(assert (=> d!71233 (= lt!163347 lt!163353)))

(declare-fun lt!163361 () Unit!10749)

(assert (=> d!71233 (= lt!163361 e!212307)))

(declare-fun c!53154 () Bool)

(assert (=> d!71233 (= c!53154 e!212312)))

(declare-fun res!191614 () Bool)

(assert (=> d!71233 (=> (not res!191614) (not e!212312))))

(assert (=> d!71233 (= res!191614 (bvslt #b00000000000000000000000000000000 (size!9097 _keys!1895)))))

(assert (=> d!71233 (= lt!163353 e!212310)))

(assert (=> d!71233 (= c!53152 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71233 (validMask!0 mask!2385)))

(assert (=> d!71233 (= (getCurrentListMap!1714 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!163347)))

(declare-fun bm!26827 () Bool)

(declare-fun call!26827 () Bool)

(assert (=> bm!26827 (= call!26827 (contains!2256 lt!163347 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!346416 () Bool)

(assert (=> b!346416 (= e!212305 (not call!26827))))

(declare-fun b!346417 () Bool)

(assert (=> b!346417 (= e!212305 e!212313)))

(declare-fun res!191610 () Bool)

(assert (=> b!346417 (= res!191610 call!26827)))

(assert (=> b!346417 (=> (not res!191610) (not e!212313))))

(declare-fun b!346418 () Bool)

(assert (=> b!346418 (= e!212310 e!212301)))

(assert (=> b!346418 (= c!53156 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!71233 c!53152) b!346400))

(assert (= (and d!71233 (not c!53152)) b!346418))

(assert (= (and b!346418 c!53156) b!346399))

(assert (= (and b!346418 (not c!53156)) b!346404))

(assert (= (and b!346404 c!53157) b!346407))

(assert (= (and b!346404 (not c!53157)) b!346406))

(assert (= (or b!346407 b!346406) bm!26826))

(assert (= (or b!346399 bm!26826) bm!26823))

(assert (= (or b!346399 b!346407) bm!26822))

(assert (= (or b!346400 bm!26823) bm!26824))

(assert (= (or b!346400 bm!26822) bm!26821))

(assert (= (and d!71233 res!191614) b!346408))

(assert (= (and d!71233 c!53154) b!346403))

(assert (= (and d!71233 (not c!53154)) b!346401))

(assert (= (and d!71233 res!191607) b!346402))

(assert (= (and b!346402 res!191615) b!346414))

(assert (= (and b!346402 (not res!191613)) b!346398))

(assert (= (and b!346398 res!191609) b!346415))

(assert (= (and b!346402 res!191612) b!346412))

(assert (= (and b!346412 c!53155) b!346410))

(assert (= (and b!346412 (not c!53155)) b!346409))

(assert (= (and b!346410 res!191608) b!346405))

(assert (= (or b!346410 b!346409) bm!26825))

(assert (= (and b!346412 res!191611) b!346411))

(assert (= (and b!346411 c!53153) b!346417))

(assert (= (and b!346411 (not c!53153)) b!346416))

(assert (= (and b!346417 res!191610) b!346413))

(assert (= (or b!346417 b!346416) bm!26827))

(declare-fun b_lambda!8479 () Bool)

(assert (=> (not b_lambda!8479) (not b!346415)))

(declare-fun t!10194 () Bool)

(declare-fun tb!3085 () Bool)

(assert (=> (and start!34658 (= defaultEntry!1528 defaultEntry!1528) t!10194) tb!3085))

(declare-fun result!5585 () Bool)

(assert (=> tb!3085 (= result!5585 tp_is_empty!7437)))

(assert (=> b!346415 t!10194))

(declare-fun b_and!14707 () Bool)

(assert (= b_and!14703 (and (=> t!10194 result!5585) b_and!14707)))

(declare-fun m!347495 () Bool)

(assert (=> bm!26827 m!347495))

(declare-fun m!347497 () Bool)

(assert (=> b!346398 m!347497))

(assert (=> b!346398 m!347497))

(declare-fun m!347499 () Bool)

(assert (=> b!346398 m!347499))

(declare-fun m!347501 () Bool)

(assert (=> bm!26824 m!347501))

(declare-fun m!347503 () Bool)

(assert (=> bm!26821 m!347503))

(assert (=> b!346414 m!347497))

(assert (=> b!346414 m!347497))

(declare-fun m!347505 () Bool)

(assert (=> b!346414 m!347505))

(declare-fun m!347507 () Bool)

(assert (=> b!346400 m!347507))

(declare-fun m!347509 () Bool)

(assert (=> b!346405 m!347509))

(declare-fun m!347511 () Bool)

(assert (=> b!346413 m!347511))

(assert (=> d!71233 m!347447))

(assert (=> b!346415 m!347497))

(declare-fun m!347513 () Bool)

(assert (=> b!346415 m!347513))

(declare-fun m!347515 () Bool)

(assert (=> b!346415 m!347515))

(declare-fun m!347517 () Bool)

(assert (=> b!346415 m!347517))

(assert (=> b!346415 m!347515))

(declare-fun m!347519 () Bool)

(assert (=> b!346415 m!347519))

(assert (=> b!346415 m!347517))

(assert (=> b!346415 m!347497))

(declare-fun m!347521 () Bool)

(assert (=> b!346403 m!347521))

(declare-fun m!347523 () Bool)

(assert (=> b!346403 m!347523))

(declare-fun m!347525 () Bool)

(assert (=> b!346403 m!347525))

(declare-fun m!347527 () Bool)

(assert (=> b!346403 m!347527))

(declare-fun m!347529 () Bool)

(assert (=> b!346403 m!347529))

(assert (=> b!346403 m!347523))

(declare-fun m!347531 () Bool)

(assert (=> b!346403 m!347531))

(declare-fun m!347533 () Bool)

(assert (=> b!346403 m!347533))

(declare-fun m!347535 () Bool)

(assert (=> b!346403 m!347535))

(declare-fun m!347537 () Bool)

(assert (=> b!346403 m!347537))

(declare-fun m!347539 () Bool)

(assert (=> b!346403 m!347539))

(declare-fun m!347541 () Bool)

(assert (=> b!346403 m!347541))

(declare-fun m!347543 () Bool)

(assert (=> b!346403 m!347543))

(assert (=> b!346403 m!347541))

(assert (=> b!346403 m!347521))

(declare-fun m!347545 () Bool)

(assert (=> b!346403 m!347545))

(declare-fun m!347547 () Bool)

(assert (=> b!346403 m!347547))

(assert (=> b!346403 m!347497))

(declare-fun m!347549 () Bool)

(assert (=> b!346403 m!347549))

(assert (=> b!346403 m!347501))

(assert (=> b!346403 m!347535))

(declare-fun m!347551 () Bool)

(assert (=> bm!26825 m!347551))

(assert (=> b!346408 m!347497))

(assert (=> b!346408 m!347497))

(assert (=> b!346408 m!347505))

(assert (=> b!346309 d!71233))

(declare-fun b!346431 () Bool)

(declare-fun e!212325 () Bool)

(declare-fun e!212323 () Bool)

(assert (=> b!346431 (= e!212325 e!212323)))

(declare-fun c!53160 () Bool)

(assert (=> b!346431 (= c!53160 (validKeyInArray!0 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346432 () Bool)

(declare-fun e!212322 () Bool)

(declare-fun contains!2257 (List!5064 (_ BitVec 64)) Bool)

(assert (=> b!346432 (= e!212322 (contains!2257 Nil!5061 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26830 () Bool)

(declare-fun call!26833 () Bool)

(assert (=> bm!26830 (= call!26833 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53160 (Cons!5060 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000) Nil!5061) Nil!5061)))))

(declare-fun b!346433 () Bool)

(assert (=> b!346433 (= e!212323 call!26833)))

(declare-fun b!346434 () Bool)

(declare-fun e!212324 () Bool)

(assert (=> b!346434 (= e!212324 e!212325)))

(declare-fun res!191623 () Bool)

(assert (=> b!346434 (=> (not res!191623) (not e!212325))))

(assert (=> b!346434 (= res!191623 (not e!212322))))

(declare-fun res!191622 () Bool)

(assert (=> b!346434 (=> (not res!191622) (not e!212322))))

(assert (=> b!346434 (= res!191622 (validKeyInArray!0 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71235 () Bool)

(declare-fun res!191624 () Bool)

(assert (=> d!71235 (=> res!191624 e!212324)))

(assert (=> d!71235 (= res!191624 (bvsge #b00000000000000000000000000000000 (size!9097 _keys!1895)))))

(assert (=> d!71235 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5061) e!212324)))

(declare-fun b!346435 () Bool)

(assert (=> b!346435 (= e!212323 call!26833)))

(assert (= (and d!71235 (not res!191624)) b!346434))

(assert (= (and b!346434 res!191622) b!346432))

(assert (= (and b!346434 res!191623) b!346431))

(assert (= (and b!346431 c!53160) b!346433))

(assert (= (and b!346431 (not c!53160)) b!346435))

(assert (= (or b!346433 b!346435) bm!26830))

(assert (=> b!346431 m!347497))

(assert (=> b!346431 m!347497))

(assert (=> b!346431 m!347505))

(assert (=> b!346432 m!347497))

(assert (=> b!346432 m!347497))

(declare-fun m!347553 () Bool)

(assert (=> b!346432 m!347553))

(assert (=> bm!26830 m!347497))

(declare-fun m!347555 () Bool)

(assert (=> bm!26830 m!347555))

(assert (=> b!346434 m!347497))

(assert (=> b!346434 m!347497))

(assert (=> b!346434 m!347505))

(assert (=> b!346305 d!71235))

(declare-fun d!71237 () Bool)

(assert (=> d!71237 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!346312 d!71237))

(declare-fun bm!26833 () Bool)

(declare-fun call!26836 () Bool)

(assert (=> bm!26833 (= call!26836 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!346444 () Bool)

(declare-fun e!212332 () Bool)

(declare-fun e!212334 () Bool)

(assert (=> b!346444 (= e!212332 e!212334)))

(declare-fun lt!163372 () (_ BitVec 64))

(assert (=> b!346444 (= lt!163372 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!163370 () Unit!10749)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18467 (_ BitVec 64) (_ BitVec 32)) Unit!10749)

(assert (=> b!346444 (= lt!163370 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!163372 #b00000000000000000000000000000000))))

(assert (=> b!346444 (arrayContainsKey!0 _keys!1895 lt!163372 #b00000000000000000000000000000000)))

(declare-fun lt!163371 () Unit!10749)

(assert (=> b!346444 (= lt!163371 lt!163370)))

(declare-fun res!191629 () Bool)

(assert (=> b!346444 (= res!191629 (= (seekEntryOrOpen!0 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3371 #b00000000000000000000000000000000)))))

(assert (=> b!346444 (=> (not res!191629) (not e!212334))))

(declare-fun b!346445 () Bool)

(assert (=> b!346445 (= e!212332 call!26836)))

(declare-fun d!71239 () Bool)

(declare-fun res!191630 () Bool)

(declare-fun e!212333 () Bool)

(assert (=> d!71239 (=> res!191630 e!212333)))

(assert (=> d!71239 (= res!191630 (bvsge #b00000000000000000000000000000000 (size!9097 _keys!1895)))))

(assert (=> d!71239 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!212333)))

(declare-fun b!346446 () Bool)

(assert (=> b!346446 (= e!212333 e!212332)))

(declare-fun c!53163 () Bool)

(assert (=> b!346446 (= c!53163 (validKeyInArray!0 (select (arr!8745 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!346447 () Bool)

(assert (=> b!346447 (= e!212334 call!26836)))

(assert (= (and d!71239 (not res!191630)) b!346446))

(assert (= (and b!346446 c!53163) b!346444))

(assert (= (and b!346446 (not c!53163)) b!346445))

(assert (= (and b!346444 res!191629) b!346447))

(assert (= (or b!346447 b!346445) bm!26833))

(declare-fun m!347557 () Bool)

(assert (=> bm!26833 m!347557))

(assert (=> b!346444 m!347497))

(declare-fun m!347559 () Bool)

(assert (=> b!346444 m!347559))

(declare-fun m!347561 () Bool)

(assert (=> b!346444 m!347561))

(assert (=> b!346444 m!347497))

(declare-fun m!347563 () Bool)

(assert (=> b!346444 m!347563))

(assert (=> b!346446 m!347497))

(assert (=> b!346446 m!347497))

(assert (=> b!346446 m!347505))

(assert (=> b!346308 d!71239))

(declare-fun d!71241 () Bool)

(declare-fun res!191635 () Bool)

(declare-fun e!212339 () Bool)

(assert (=> d!71241 (=> res!191635 e!212339)))

(assert (=> d!71241 (= res!191635 (= (select (arr!8745 _keys!1895) (index!15664 lt!163282)) k0!1348))))

(assert (=> d!71241 (= (arrayContainsKey!0 _keys!1895 k0!1348 (index!15664 lt!163282)) e!212339)))

(declare-fun b!346452 () Bool)

(declare-fun e!212340 () Bool)

(assert (=> b!346452 (= e!212339 e!212340)))

(declare-fun res!191636 () Bool)

(assert (=> b!346452 (=> (not res!191636) (not e!212340))))

(assert (=> b!346452 (= res!191636 (bvslt (bvadd (index!15664 lt!163282) #b00000000000000000000000000000001) (size!9097 _keys!1895)))))

(declare-fun b!346453 () Bool)

(assert (=> b!346453 (= e!212340 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd (index!15664 lt!163282) #b00000000000000000000000000000001)))))

(assert (= (and d!71241 (not res!191635)) b!346452))

(assert (= (and b!346452 res!191636) b!346453))

(assert (=> d!71241 m!347443))

(declare-fun m!347565 () Bool)

(assert (=> b!346453 m!347565))

(assert (=> b!346307 d!71241))

(declare-fun b!346466 () Bool)

(declare-fun e!212348 () SeekEntryResult!3371)

(declare-fun e!212347 () SeekEntryResult!3371)

(assert (=> b!346466 (= e!212348 e!212347)))

(declare-fun lt!163381 () (_ BitVec 64))

(declare-fun lt!163379 () SeekEntryResult!3371)

(assert (=> b!346466 (= lt!163381 (select (arr!8745 _keys!1895) (index!15665 lt!163379)))))

(declare-fun c!53172 () Bool)

(assert (=> b!346466 (= c!53172 (= lt!163381 k0!1348))))

(declare-fun d!71243 () Bool)

(declare-fun lt!163380 () SeekEntryResult!3371)

(assert (=> d!71243 (and (or ((_ is Undefined!3371) lt!163380) (not ((_ is Found!3371) lt!163380)) (and (bvsge (index!15664 lt!163380) #b00000000000000000000000000000000) (bvslt (index!15664 lt!163380) (size!9097 _keys!1895)))) (or ((_ is Undefined!3371) lt!163380) ((_ is Found!3371) lt!163380) (not ((_ is MissingZero!3371) lt!163380)) (and (bvsge (index!15663 lt!163380) #b00000000000000000000000000000000) (bvslt (index!15663 lt!163380) (size!9097 _keys!1895)))) (or ((_ is Undefined!3371) lt!163380) ((_ is Found!3371) lt!163380) ((_ is MissingZero!3371) lt!163380) (not ((_ is MissingVacant!3371) lt!163380)) (and (bvsge (index!15666 lt!163380) #b00000000000000000000000000000000) (bvslt (index!15666 lt!163380) (size!9097 _keys!1895)))) (or ((_ is Undefined!3371) lt!163380) (ite ((_ is Found!3371) lt!163380) (= (select (arr!8745 _keys!1895) (index!15664 lt!163380)) k0!1348) (ite ((_ is MissingZero!3371) lt!163380) (= (select (arr!8745 _keys!1895) (index!15663 lt!163380)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3371) lt!163380) (= (select (arr!8745 _keys!1895) (index!15666 lt!163380)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71243 (= lt!163380 e!212348)))

(declare-fun c!53170 () Bool)

(assert (=> d!71243 (= c!53170 (and ((_ is Intermediate!3371) lt!163379) (undefined!4183 lt!163379)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18467 (_ BitVec 32)) SeekEntryResult!3371)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71243 (= lt!163379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71243 (validMask!0 mask!2385)))

(assert (=> d!71243 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!163380)))

(declare-fun e!212349 () SeekEntryResult!3371)

(declare-fun b!346467 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18467 (_ BitVec 32)) SeekEntryResult!3371)

(assert (=> b!346467 (= e!212349 (seekKeyOrZeroReturnVacant!0 (x!34495 lt!163379) (index!15665 lt!163379) (index!15665 lt!163379) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!346468 () Bool)

(assert (=> b!346468 (= e!212349 (MissingZero!3371 (index!15665 lt!163379)))))

(declare-fun b!346469 () Bool)

(assert (=> b!346469 (= e!212347 (Found!3371 (index!15665 lt!163379)))))

(declare-fun b!346470 () Bool)

(declare-fun c!53171 () Bool)

(assert (=> b!346470 (= c!53171 (= lt!163381 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!346470 (= e!212347 e!212349)))

(declare-fun b!346471 () Bool)

(assert (=> b!346471 (= e!212348 Undefined!3371)))

(assert (= (and d!71243 c!53170) b!346471))

(assert (= (and d!71243 (not c!53170)) b!346466))

(assert (= (and b!346466 c!53172) b!346469))

(assert (= (and b!346466 (not c!53172)) b!346470))

(assert (= (and b!346470 c!53171) b!346468))

(assert (= (and b!346470 (not c!53171)) b!346467))

(declare-fun m!347567 () Bool)

(assert (=> b!346466 m!347567))

(declare-fun m!347569 () Bool)

(assert (=> d!71243 m!347569))

(declare-fun m!347571 () Bool)

(assert (=> d!71243 m!347571))

(declare-fun m!347573 () Bool)

(assert (=> d!71243 m!347573))

(declare-fun m!347575 () Bool)

(assert (=> d!71243 m!347575))

(assert (=> d!71243 m!347447))

(assert (=> d!71243 m!347569))

(declare-fun m!347577 () Bool)

(assert (=> d!71243 m!347577))

(declare-fun m!347579 () Bool)

(assert (=> b!346467 m!347579))

(assert (=> b!346311 d!71243))

(declare-fun mapNonEmpty!12615 () Bool)

(declare-fun mapRes!12615 () Bool)

(declare-fun tp!26025 () Bool)

(declare-fun e!212354 () Bool)

(assert (=> mapNonEmpty!12615 (= mapRes!12615 (and tp!26025 e!212354))))

(declare-fun mapKey!12615 () (_ BitVec 32))

(declare-fun mapRest!12615 () (Array (_ BitVec 32) ValueCell!3375))

(declare-fun mapValue!12615 () ValueCell!3375)

(assert (=> mapNonEmpty!12615 (= mapRest!12609 (store mapRest!12615 mapKey!12615 mapValue!12615))))

(declare-fun b!346478 () Bool)

(assert (=> b!346478 (= e!212354 tp_is_empty!7437)))

(declare-fun mapIsEmpty!12615 () Bool)

(assert (=> mapIsEmpty!12615 mapRes!12615))

(declare-fun condMapEmpty!12615 () Bool)

(declare-fun mapDefault!12615 () ValueCell!3375)

(assert (=> mapNonEmpty!12609 (= condMapEmpty!12615 (= mapRest!12609 ((as const (Array (_ BitVec 32) ValueCell!3375)) mapDefault!12615)))))

(declare-fun e!212355 () Bool)

(assert (=> mapNonEmpty!12609 (= tp!26015 (and e!212355 mapRes!12615))))

(declare-fun b!346479 () Bool)

(assert (=> b!346479 (= e!212355 tp_is_empty!7437)))

(assert (= (and mapNonEmpty!12609 condMapEmpty!12615) mapIsEmpty!12615))

(assert (= (and mapNonEmpty!12609 (not condMapEmpty!12615)) mapNonEmpty!12615))

(assert (= (and mapNonEmpty!12615 ((_ is ValueCellFull!3375) mapValue!12615)) b!346478))

(assert (= (and mapNonEmpty!12609 ((_ is ValueCellFull!3375) mapDefault!12615)) b!346479))

(declare-fun m!347581 () Bool)

(assert (=> mapNonEmpty!12615 m!347581))

(declare-fun b_lambda!8481 () Bool)

(assert (= b_lambda!8479 (or (and start!34658 b_free!7485) b_lambda!8481)))

(check-sat (not b!346414) (not b!346467) (not b!346408) (not b!346453) tp_is_empty!7437 (not b!346355) (not b!346446) (not b!346353) (not bm!26827) (not bm!26833) (not b!346434) (not bm!26821) (not bm!26824) (not b!346444) (not b!346398) (not b!346405) (not d!71231) (not b!346432) (not bm!26830) (not bm!26825) (not b!346431) (not b_next!7485) (not d!71233) b_and!14707 (not b!346413) (not b!346400) (not b_lambda!8481) (not mapNonEmpty!12615) (not d!71243) (not b!346415) (not b!346403))
(check-sat b_and!14707 (not b_next!7485))
