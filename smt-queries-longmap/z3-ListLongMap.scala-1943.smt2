; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34380 () Bool)

(assert start!34380)

(declare-fun b_free!7329 () Bool)

(declare-fun b_next!7329 () Bool)

(assert (=> start!34380 (= b_free!7329 (not b_next!7329))))

(declare-fun tp!25530 () Bool)

(declare-fun b_and!14535 () Bool)

(assert (=> start!34380 (= tp!25530 b_and!14535)))

(declare-fun res!189790 () Bool)

(declare-fun e!210525 () Bool)

(assert (=> start!34380 (=> (not res!189790) (not e!210525))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34380 (= res!189790 (validMask!0 mask!2385))))

(assert (=> start!34380 e!210525))

(assert (=> start!34380 true))

(declare-fun tp_is_empty!7281 () Bool)

(assert (=> start!34380 tp_is_empty!7281))

(assert (=> start!34380 tp!25530))

(declare-datatypes ((V!10685 0))(
  ( (V!10686 (val!3685 Int)) )
))
(declare-datatypes ((ValueCell!3297 0))(
  ( (ValueCellFull!3297 (v!5860 V!10685)) (EmptyCell!3297) )
))
(declare-datatypes ((array!18153 0))(
  ( (array!18154 (arr!8594 (Array (_ BitVec 32) ValueCell!3297)) (size!8946 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18153)

(declare-fun e!210522 () Bool)

(declare-fun array_inv!6364 (array!18153) Bool)

(assert (=> start!34380 (and (array_inv!6364 _values!1525) e!210522)))

(declare-datatypes ((array!18155 0))(
  ( (array!18156 (arr!8595 (Array (_ BitVec 32) (_ BitVec 64))) (size!8947 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18155)

(declare-fun array_inv!6365 (array!18155) Bool)

(assert (=> start!34380 (array_inv!6365 _keys!1895)))

(declare-fun b!343330 () Bool)

(declare-fun e!210519 () Bool)

(assert (=> b!343330 (= e!210525 e!210519)))

(declare-fun res!189791 () Bool)

(assert (=> b!343330 (=> (not res!189791) (not e!210519))))

(declare-datatypes ((SeekEntryResult!3316 0))(
  ( (MissingZero!3316 (index!15443 (_ BitVec 32))) (Found!3316 (index!15444 (_ BitVec 32))) (Intermediate!3316 (undefined!4128 Bool) (index!15445 (_ BitVec 32)) (x!34172 (_ BitVec 32))) (Undefined!3316) (MissingVacant!3316 (index!15446 (_ BitVec 32))) )
))
(declare-fun lt!162456 () SeekEntryResult!3316)

(get-info :version)

(assert (=> b!343330 (= res!189791 (and (not ((_ is Found!3316) lt!162456)) (not ((_ is MissingZero!3316) lt!162456)) ((_ is MissingVacant!3316) lt!162456)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18155 (_ BitVec 32)) SeekEntryResult!3316)

(assert (=> b!343330 (= lt!162456 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343331 () Bool)

(declare-fun e!210521 () Bool)

(assert (=> b!343331 (= e!210521 tp_is_empty!7281)))

(declare-fun b!343332 () Bool)

(declare-fun res!189795 () Bool)

(assert (=> b!343332 (=> (not res!189795) (not e!210525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18155 (_ BitVec 32)) Bool)

(assert (=> b!343332 (= res!189795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343333 () Bool)

(declare-fun res!189789 () Bool)

(assert (=> b!343333 (=> (not res!189789) (not e!210525))))

(declare-fun zeroValue!1467 () V!10685)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10685)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5338 0))(
  ( (tuple2!5339 (_1!2680 (_ BitVec 64)) (_2!2680 V!10685)) )
))
(declare-datatypes ((List!4958 0))(
  ( (Nil!4955) (Cons!4954 (h!5810 tuple2!5338) (t!10072 List!4958)) )
))
(declare-datatypes ((ListLongMap!4251 0))(
  ( (ListLongMap!4252 (toList!2141 List!4958)) )
))
(declare-fun contains!2198 (ListLongMap!4251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1662 (array!18155 array!18153 (_ BitVec 32) (_ BitVec 32) V!10685 V!10685 (_ BitVec 32) Int) ListLongMap!4251)

(assert (=> b!343333 (= res!189789 (not (contains!2198 (getCurrentListMap!1662 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapIsEmpty!12357 () Bool)

(declare-fun mapRes!12357 () Bool)

(assert (=> mapIsEmpty!12357 mapRes!12357))

(declare-fun mapNonEmpty!12357 () Bool)

(declare-fun tp!25529 () Bool)

(assert (=> mapNonEmpty!12357 (= mapRes!12357 (and tp!25529 e!210521))))

(declare-fun mapKey!12357 () (_ BitVec 32))

(declare-fun mapValue!12357 () ValueCell!3297)

(declare-fun mapRest!12357 () (Array (_ BitVec 32) ValueCell!3297))

(assert (=> mapNonEmpty!12357 (= (arr!8594 _values!1525) (store mapRest!12357 mapKey!12357 mapValue!12357))))

(declare-fun b!343334 () Bool)

(declare-datatypes ((Unit!10720 0))(
  ( (Unit!10721) )
))
(declare-fun e!210518 () Unit!10720)

(declare-fun Unit!10722 () Unit!10720)

(assert (=> b!343334 (= e!210518 Unit!10722)))

(declare-fun lt!162455 () Unit!10720)

(declare-fun lemmaArrayContainsKeyThenInListMap!313 (array!18155 array!18153 (_ BitVec 32) (_ BitVec 32) V!10685 V!10685 (_ BitVec 64) (_ BitVec 32) Int) Unit!10720)

(declare-fun arrayScanForKey!0 (array!18155 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!343334 (= lt!162455 (lemmaArrayContainsKeyThenInListMap!313 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!343334 false))

(declare-fun b!343335 () Bool)

(declare-fun res!189792 () Bool)

(declare-fun e!210524 () Bool)

(assert (=> b!343335 (=> (not res!189792) (not e!210524))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!343335 (= res!189792 (inRange!0 (index!15446 lt!162456) mask!2385))))

(declare-fun b!343336 () Bool)

(declare-fun res!189793 () Bool)

(assert (=> b!343336 (=> (not res!189793) (not e!210525))))

(assert (=> b!343336 (= res!189793 (and (= (size!8946 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8947 _keys!1895) (size!8946 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343337 () Bool)

(declare-fun e!210523 () Bool)

(assert (=> b!343337 (= e!210522 (and e!210523 mapRes!12357))))

(declare-fun condMapEmpty!12357 () Bool)

(declare-fun mapDefault!12357 () ValueCell!3297)

(assert (=> b!343337 (= condMapEmpty!12357 (= (arr!8594 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3297)) mapDefault!12357)))))

(declare-fun b!343338 () Bool)

(assert (=> b!343338 (= e!210519 e!210524)))

(declare-fun res!189796 () Bool)

(assert (=> b!343338 (=> (not res!189796) (not e!210524))))

(declare-fun lt!162454 () Bool)

(assert (=> b!343338 (= res!189796 (not lt!162454))))

(declare-fun lt!162457 () Unit!10720)

(assert (=> b!343338 (= lt!162457 e!210518)))

(declare-fun c!52914 () Bool)

(assert (=> b!343338 (= c!52914 lt!162454)))

(declare-fun arrayContainsKey!0 (array!18155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!343338 (= lt!162454 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!343339 () Bool)

(declare-fun Unit!10723 () Unit!10720)

(assert (=> b!343339 (= e!210518 Unit!10723)))

(declare-fun b!343340 () Bool)

(assert (=> b!343340 (= e!210524 (and (= (select (arr!8595 _keys!1895) (index!15446 lt!162456)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8947 _keys!1895)) (bvsge (size!8947 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!343341 () Bool)

(declare-fun res!189794 () Bool)

(assert (=> b!343341 (=> (not res!189794) (not e!210525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343341 (= res!189794 (validKeyInArray!0 k0!1348))))

(declare-fun b!343342 () Bool)

(assert (=> b!343342 (= e!210523 tp_is_empty!7281)))

(declare-fun b!343343 () Bool)

(declare-fun res!189797 () Bool)

(assert (=> b!343343 (=> (not res!189797) (not e!210525))))

(declare-datatypes ((List!4959 0))(
  ( (Nil!4956) (Cons!4955 (h!5811 (_ BitVec 64)) (t!10073 List!4959)) )
))
(declare-fun arrayNoDuplicates!0 (array!18155 (_ BitVec 32) List!4959) Bool)

(assert (=> b!343343 (= res!189797 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4956))))

(assert (= (and start!34380 res!189790) b!343336))

(assert (= (and b!343336 res!189793) b!343332))

(assert (= (and b!343332 res!189795) b!343343))

(assert (= (and b!343343 res!189797) b!343341))

(assert (= (and b!343341 res!189794) b!343333))

(assert (= (and b!343333 res!189789) b!343330))

(assert (= (and b!343330 res!189791) b!343338))

(assert (= (and b!343338 c!52914) b!343334))

(assert (= (and b!343338 (not c!52914)) b!343339))

(assert (= (and b!343338 res!189796) b!343335))

(assert (= (and b!343335 res!189792) b!343340))

(assert (= (and b!343337 condMapEmpty!12357) mapIsEmpty!12357))

(assert (= (and b!343337 (not condMapEmpty!12357)) mapNonEmpty!12357))

(assert (= (and mapNonEmpty!12357 ((_ is ValueCellFull!3297) mapValue!12357)) b!343331))

(assert (= (and b!343337 ((_ is ValueCellFull!3297) mapDefault!12357)) b!343342))

(assert (= start!34380 b!343337))

(declare-fun m!345235 () Bool)

(assert (=> b!343343 m!345235))

(declare-fun m!345237 () Bool)

(assert (=> b!343340 m!345237))

(declare-fun m!345239 () Bool)

(assert (=> start!34380 m!345239))

(declare-fun m!345241 () Bool)

(assert (=> start!34380 m!345241))

(declare-fun m!345243 () Bool)

(assert (=> start!34380 m!345243))

(declare-fun m!345245 () Bool)

(assert (=> b!343333 m!345245))

(assert (=> b!343333 m!345245))

(declare-fun m!345247 () Bool)

(assert (=> b!343333 m!345247))

(declare-fun m!345249 () Bool)

(assert (=> b!343330 m!345249))

(declare-fun m!345251 () Bool)

(assert (=> b!343334 m!345251))

(assert (=> b!343334 m!345251))

(declare-fun m!345253 () Bool)

(assert (=> b!343334 m!345253))

(declare-fun m!345255 () Bool)

(assert (=> mapNonEmpty!12357 m!345255))

(declare-fun m!345257 () Bool)

(assert (=> b!343335 m!345257))

(declare-fun m!345259 () Bool)

(assert (=> b!343338 m!345259))

(declare-fun m!345261 () Bool)

(assert (=> b!343341 m!345261))

(declare-fun m!345263 () Bool)

(assert (=> b!343332 m!345263))

(check-sat b_and!14535 (not b_next!7329) (not b!343333) tp_is_empty!7281 (not b!343338) (not b!343330) (not b!343334) (not start!34380) (not b!343343) (not b!343341) (not b!343335) (not b!343332) (not mapNonEmpty!12357))
(check-sat b_and!14535 (not b_next!7329))
(get-model)

(declare-fun d!71051 () Bool)

(assert (=> d!71051 (= (inRange!0 (index!15446 lt!162456) mask!2385) (and (bvsge (index!15446 lt!162456) #b00000000000000000000000000000000) (bvslt (index!15446 lt!162456) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!343335 d!71051))

(declare-fun d!71053 () Bool)

(declare-fun res!189829 () Bool)

(declare-fun e!210556 () Bool)

(assert (=> d!71053 (=> res!189829 e!210556)))

(assert (=> d!71053 (= res!189829 (bvsge #b00000000000000000000000000000000 (size!8947 _keys!1895)))))

(assert (=> d!71053 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!210556)))

(declare-fun b!343394 () Bool)

(declare-fun e!210557 () Bool)

(declare-fun call!26650 () Bool)

(assert (=> b!343394 (= e!210557 call!26650)))

(declare-fun b!343395 () Bool)

(declare-fun e!210558 () Bool)

(assert (=> b!343395 (= e!210556 e!210558)))

(declare-fun c!52920 () Bool)

(assert (=> b!343395 (= c!52920 (validKeyInArray!0 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26647 () Bool)

(assert (=> bm!26647 (= call!26650 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!343396 () Bool)

(assert (=> b!343396 (= e!210558 e!210557)))

(declare-fun lt!162477 () (_ BitVec 64))

(assert (=> b!343396 (= lt!162477 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162478 () Unit!10720)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18155 (_ BitVec 64) (_ BitVec 32)) Unit!10720)

(assert (=> b!343396 (= lt!162478 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162477 #b00000000000000000000000000000000))))

(assert (=> b!343396 (arrayContainsKey!0 _keys!1895 lt!162477 #b00000000000000000000000000000000)))

(declare-fun lt!162476 () Unit!10720)

(assert (=> b!343396 (= lt!162476 lt!162478)))

(declare-fun res!189830 () Bool)

(assert (=> b!343396 (= res!189830 (= (seekEntryOrOpen!0 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3316 #b00000000000000000000000000000000)))))

(assert (=> b!343396 (=> (not res!189830) (not e!210557))))

(declare-fun b!343397 () Bool)

(assert (=> b!343397 (= e!210558 call!26650)))

(assert (= (and d!71053 (not res!189829)) b!343395))

(assert (= (and b!343395 c!52920) b!343396))

(assert (= (and b!343395 (not c!52920)) b!343397))

(assert (= (and b!343396 res!189830) b!343394))

(assert (= (or b!343394 b!343397) bm!26647))

(declare-fun m!345295 () Bool)

(assert (=> b!343395 m!345295))

(assert (=> b!343395 m!345295))

(declare-fun m!345297 () Bool)

(assert (=> b!343395 m!345297))

(declare-fun m!345299 () Bool)

(assert (=> bm!26647 m!345299))

(assert (=> b!343396 m!345295))

(declare-fun m!345301 () Bool)

(assert (=> b!343396 m!345301))

(declare-fun m!345303 () Bool)

(assert (=> b!343396 m!345303))

(assert (=> b!343396 m!345295))

(declare-fun m!345305 () Bool)

(assert (=> b!343396 m!345305))

(assert (=> b!343332 d!71053))

(declare-fun d!71055 () Bool)

(assert (=> d!71055 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!343341 d!71055))

(declare-fun d!71057 () Bool)

(declare-fun e!210563 () Bool)

(assert (=> d!71057 e!210563))

(declare-fun res!189833 () Bool)

(assert (=> d!71057 (=> res!189833 e!210563)))

(declare-fun lt!162490 () Bool)

(assert (=> d!71057 (= res!189833 (not lt!162490))))

(declare-fun lt!162487 () Bool)

(assert (=> d!71057 (= lt!162490 lt!162487)))

(declare-fun lt!162489 () Unit!10720)

(declare-fun e!210564 () Unit!10720)

(assert (=> d!71057 (= lt!162489 e!210564)))

(declare-fun c!52923 () Bool)

(assert (=> d!71057 (= c!52923 lt!162487)))

(declare-fun containsKey!329 (List!4958 (_ BitVec 64)) Bool)

(assert (=> d!71057 (= lt!162487 (containsKey!329 (toList!2141 (getCurrentListMap!1662 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71057 (= (contains!2198 (getCurrentListMap!1662 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162490)))

(declare-fun b!343404 () Bool)

(declare-fun lt!162488 () Unit!10720)

(assert (=> b!343404 (= e!210564 lt!162488)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!277 (List!4958 (_ BitVec 64)) Unit!10720)

(assert (=> b!343404 (= lt!162488 (lemmaContainsKeyImpliesGetValueByKeyDefined!277 (toList!2141 (getCurrentListMap!1662 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!343 0))(
  ( (Some!342 (v!5862 V!10685)) (None!341) )
))
(declare-fun isDefined!278 (Option!343) Bool)

(declare-fun getValueByKey!337 (List!4958 (_ BitVec 64)) Option!343)

(assert (=> b!343404 (isDefined!278 (getValueByKey!337 (toList!2141 (getCurrentListMap!1662 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!343405 () Bool)

(declare-fun Unit!10727 () Unit!10720)

(assert (=> b!343405 (= e!210564 Unit!10727)))

(declare-fun b!343406 () Bool)

(assert (=> b!343406 (= e!210563 (isDefined!278 (getValueByKey!337 (toList!2141 (getCurrentListMap!1662 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71057 c!52923) b!343404))

(assert (= (and d!71057 (not c!52923)) b!343405))

(assert (= (and d!71057 (not res!189833)) b!343406))

(declare-fun m!345307 () Bool)

(assert (=> d!71057 m!345307))

(declare-fun m!345309 () Bool)

(assert (=> b!343404 m!345309))

(declare-fun m!345311 () Bool)

(assert (=> b!343404 m!345311))

(assert (=> b!343404 m!345311))

(declare-fun m!345313 () Bool)

(assert (=> b!343404 m!345313))

(assert (=> b!343406 m!345311))

(assert (=> b!343406 m!345311))

(assert (=> b!343406 m!345313))

(assert (=> b!343333 d!71057))

(declare-fun b!343449 () Bool)

(declare-fun e!210601 () Bool)

(declare-fun call!26667 () Bool)

(assert (=> b!343449 (= e!210601 (not call!26667))))

(declare-fun b!343450 () Bool)

(declare-fun lt!162539 () ListLongMap!4251)

(declare-fun e!210592 () Bool)

(declare-fun apply!279 (ListLongMap!4251 (_ BitVec 64)) V!10685)

(declare-fun get!4651 (ValueCell!3297 V!10685) V!10685)

(declare-fun dynLambda!622 (Int (_ BitVec 64)) V!10685)

(assert (=> b!343450 (= e!210592 (= (apply!279 lt!162539 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000)) (get!4651 (select (arr!8594 _values!1525) #b00000000000000000000000000000000) (dynLambda!622 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!343450 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8946 _values!1525)))))

(assert (=> b!343450 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8947 _keys!1895)))))

(declare-fun bm!26662 () Bool)

(declare-fun call!26671 () Bool)

(assert (=> bm!26662 (= call!26671 (contains!2198 lt!162539 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!343451 () Bool)

(declare-fun e!210591 () Bool)

(assert (=> b!343451 (= e!210591 (validKeyInArray!0 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343452 () Bool)

(declare-fun e!210593 () Bool)

(assert (=> b!343452 (= e!210601 e!210593)))

(declare-fun res!189855 () Bool)

(assert (=> b!343452 (= res!189855 call!26667)))

(assert (=> b!343452 (=> (not res!189855) (not e!210593))))

(declare-fun b!343453 () Bool)

(assert (=> b!343453 (= e!210593 (= (apply!279 lt!162539 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!343454 () Bool)

(declare-fun e!210595 () Bool)

(assert (=> b!343454 (= e!210595 (= (apply!279 lt!162539 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!343455 () Bool)

(declare-fun e!210599 () ListLongMap!4251)

(declare-fun e!210594 () ListLongMap!4251)

(assert (=> b!343455 (= e!210599 e!210594)))

(declare-fun c!52938 () Bool)

(assert (=> b!343455 (= c!52938 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!343456 () Bool)

(declare-fun c!52941 () Bool)

(assert (=> b!343456 (= c!52941 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!210598 () ListLongMap!4251)

(assert (=> b!343456 (= e!210594 e!210598)))

(declare-fun call!26669 () ListLongMap!4251)

(declare-fun bm!26663 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!601 (array!18155 array!18153 (_ BitVec 32) (_ BitVec 32) V!10685 V!10685 (_ BitVec 32) Int) ListLongMap!4251)

(assert (=> bm!26663 (= call!26669 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!343457 () Bool)

(declare-fun e!210596 () Bool)

(assert (=> b!343457 (= e!210596 (validKeyInArray!0 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26664 () Bool)

(assert (=> bm!26664 (= call!26667 (contains!2198 lt!162539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26665 () Bool)

(declare-fun call!26666 () ListLongMap!4251)

(declare-fun call!26665 () ListLongMap!4251)

(assert (=> bm!26665 (= call!26666 call!26665)))

(declare-fun b!343458 () Bool)

(declare-fun +!728 (ListLongMap!4251 tuple2!5338) ListLongMap!4251)

(assert (=> b!343458 (= e!210599 (+!728 call!26665 (tuple2!5339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26666 () Bool)

(declare-fun call!26668 () ListLongMap!4251)

(assert (=> bm!26666 (= call!26668 call!26669)))

(declare-fun d!71059 () Bool)

(declare-fun e!210600 () Bool)

(assert (=> d!71059 e!210600))

(declare-fun res!189852 () Bool)

(assert (=> d!71059 (=> (not res!189852) (not e!210600))))

(assert (=> d!71059 (= res!189852 (or (bvsge #b00000000000000000000000000000000 (size!8947 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8947 _keys!1895)))))))

(declare-fun lt!162556 () ListLongMap!4251)

(assert (=> d!71059 (= lt!162539 lt!162556)))

(declare-fun lt!162536 () Unit!10720)

(declare-fun e!210603 () Unit!10720)

(assert (=> d!71059 (= lt!162536 e!210603)))

(declare-fun c!52936 () Bool)

(assert (=> d!71059 (= c!52936 e!210591)))

(declare-fun res!189860 () Bool)

(assert (=> d!71059 (=> (not res!189860) (not e!210591))))

(assert (=> d!71059 (= res!189860 (bvslt #b00000000000000000000000000000000 (size!8947 _keys!1895)))))

(assert (=> d!71059 (= lt!162556 e!210599)))

(declare-fun c!52939 () Bool)

(assert (=> d!71059 (= c!52939 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71059 (validMask!0 mask!2385)))

(assert (=> d!71059 (= (getCurrentListMap!1662 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162539)))

(declare-fun bm!26667 () Bool)

(declare-fun call!26670 () ListLongMap!4251)

(assert (=> bm!26667 (= call!26670 call!26668)))

(declare-fun b!343459 () Bool)

(assert (=> b!343459 (= e!210598 call!26666)))

(declare-fun b!343460 () Bool)

(declare-fun lt!162545 () Unit!10720)

(assert (=> b!343460 (= e!210603 lt!162545)))

(declare-fun lt!162552 () ListLongMap!4251)

(assert (=> b!343460 (= lt!162552 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162546 () (_ BitVec 64))

(assert (=> b!343460 (= lt!162546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162538 () (_ BitVec 64))

(assert (=> b!343460 (= lt!162538 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162543 () Unit!10720)

(declare-fun addStillContains!255 (ListLongMap!4251 (_ BitVec 64) V!10685 (_ BitVec 64)) Unit!10720)

(assert (=> b!343460 (= lt!162543 (addStillContains!255 lt!162552 lt!162546 zeroValue!1467 lt!162538))))

(assert (=> b!343460 (contains!2198 (+!728 lt!162552 (tuple2!5339 lt!162546 zeroValue!1467)) lt!162538)))

(declare-fun lt!162542 () Unit!10720)

(assert (=> b!343460 (= lt!162542 lt!162543)))

(declare-fun lt!162547 () ListLongMap!4251)

(assert (=> b!343460 (= lt!162547 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162549 () (_ BitVec 64))

(assert (=> b!343460 (= lt!162549 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162554 () (_ BitVec 64))

(assert (=> b!343460 (= lt!162554 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162553 () Unit!10720)

(declare-fun addApplyDifferent!255 (ListLongMap!4251 (_ BitVec 64) V!10685 (_ BitVec 64)) Unit!10720)

(assert (=> b!343460 (= lt!162553 (addApplyDifferent!255 lt!162547 lt!162549 minValue!1467 lt!162554))))

(assert (=> b!343460 (= (apply!279 (+!728 lt!162547 (tuple2!5339 lt!162549 minValue!1467)) lt!162554) (apply!279 lt!162547 lt!162554))))

(declare-fun lt!162548 () Unit!10720)

(assert (=> b!343460 (= lt!162548 lt!162553)))

(declare-fun lt!162535 () ListLongMap!4251)

(assert (=> b!343460 (= lt!162535 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162544 () (_ BitVec 64))

(assert (=> b!343460 (= lt!162544 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162551 () (_ BitVec 64))

(assert (=> b!343460 (= lt!162551 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162541 () Unit!10720)

(assert (=> b!343460 (= lt!162541 (addApplyDifferent!255 lt!162535 lt!162544 zeroValue!1467 lt!162551))))

(assert (=> b!343460 (= (apply!279 (+!728 lt!162535 (tuple2!5339 lt!162544 zeroValue!1467)) lt!162551) (apply!279 lt!162535 lt!162551))))

(declare-fun lt!162537 () Unit!10720)

(assert (=> b!343460 (= lt!162537 lt!162541)))

(declare-fun lt!162540 () ListLongMap!4251)

(assert (=> b!343460 (= lt!162540 (getCurrentListMapNoExtraKeys!601 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162550 () (_ BitVec 64))

(assert (=> b!343460 (= lt!162550 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162555 () (_ BitVec 64))

(assert (=> b!343460 (= lt!162555 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!343460 (= lt!162545 (addApplyDifferent!255 lt!162540 lt!162550 minValue!1467 lt!162555))))

(assert (=> b!343460 (= (apply!279 (+!728 lt!162540 (tuple2!5339 lt!162550 minValue!1467)) lt!162555) (apply!279 lt!162540 lt!162555))))

(declare-fun b!343461 () Bool)

(assert (=> b!343461 (= e!210598 call!26670)))

(declare-fun bm!26668 () Bool)

(assert (=> bm!26668 (= call!26665 (+!728 (ite c!52939 call!26669 (ite c!52938 call!26668 call!26670)) (ite (or c!52939 c!52938) (tuple2!5339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!343462 () Bool)

(declare-fun res!189856 () Bool)

(assert (=> b!343462 (=> (not res!189856) (not e!210600))))

(assert (=> b!343462 (= res!189856 e!210601)))

(declare-fun c!52937 () Bool)

(assert (=> b!343462 (= c!52937 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!343463 () Bool)

(declare-fun e!210602 () Bool)

(assert (=> b!343463 (= e!210602 e!210595)))

(declare-fun res!189858 () Bool)

(assert (=> b!343463 (= res!189858 call!26671)))

(assert (=> b!343463 (=> (not res!189858) (not e!210595))))

(declare-fun b!343464 () Bool)

(assert (=> b!343464 (= e!210600 e!210602)))

(declare-fun c!52940 () Bool)

(assert (=> b!343464 (= c!52940 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!343465 () Bool)

(assert (=> b!343465 (= e!210594 call!26666)))

(declare-fun b!343466 () Bool)

(declare-fun e!210597 () Bool)

(assert (=> b!343466 (= e!210597 e!210592)))

(declare-fun res!189854 () Bool)

(assert (=> b!343466 (=> (not res!189854) (not e!210592))))

(assert (=> b!343466 (= res!189854 (contains!2198 lt!162539 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!343466 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8947 _keys!1895)))))

(declare-fun b!343467 () Bool)

(declare-fun Unit!10728 () Unit!10720)

(assert (=> b!343467 (= e!210603 Unit!10728)))

(declare-fun b!343468 () Bool)

(declare-fun res!189853 () Bool)

(assert (=> b!343468 (=> (not res!189853) (not e!210600))))

(assert (=> b!343468 (= res!189853 e!210597)))

(declare-fun res!189857 () Bool)

(assert (=> b!343468 (=> res!189857 e!210597)))

(assert (=> b!343468 (= res!189857 (not e!210596))))

(declare-fun res!189859 () Bool)

(assert (=> b!343468 (=> (not res!189859) (not e!210596))))

(assert (=> b!343468 (= res!189859 (bvslt #b00000000000000000000000000000000 (size!8947 _keys!1895)))))

(declare-fun b!343469 () Bool)

(assert (=> b!343469 (= e!210602 (not call!26671))))

(assert (= (and d!71059 c!52939) b!343458))

(assert (= (and d!71059 (not c!52939)) b!343455))

(assert (= (and b!343455 c!52938) b!343465))

(assert (= (and b!343455 (not c!52938)) b!343456))

(assert (= (and b!343456 c!52941) b!343459))

(assert (= (and b!343456 (not c!52941)) b!343461))

(assert (= (or b!343459 b!343461) bm!26667))

(assert (= (or b!343465 bm!26667) bm!26666))

(assert (= (or b!343465 b!343459) bm!26665))

(assert (= (or b!343458 bm!26666) bm!26663))

(assert (= (or b!343458 bm!26665) bm!26668))

(assert (= (and d!71059 res!189860) b!343451))

(assert (= (and d!71059 c!52936) b!343460))

(assert (= (and d!71059 (not c!52936)) b!343467))

(assert (= (and d!71059 res!189852) b!343468))

(assert (= (and b!343468 res!189859) b!343457))

(assert (= (and b!343468 (not res!189857)) b!343466))

(assert (= (and b!343466 res!189854) b!343450))

(assert (= (and b!343468 res!189853) b!343462))

(assert (= (and b!343462 c!52937) b!343452))

(assert (= (and b!343462 (not c!52937)) b!343449))

(assert (= (and b!343452 res!189855) b!343453))

(assert (= (or b!343452 b!343449) bm!26664))

(assert (= (and b!343462 res!189856) b!343464))

(assert (= (and b!343464 c!52940) b!343463))

(assert (= (and b!343464 (not c!52940)) b!343469))

(assert (= (and b!343463 res!189858) b!343454))

(assert (= (or b!343463 b!343469) bm!26662))

(declare-fun b_lambda!8455 () Bool)

(assert (=> (not b_lambda!8455) (not b!343450)))

(declare-fun t!10076 () Bool)

(declare-fun tb!3073 () Bool)

(assert (=> (and start!34380 (= defaultEntry!1528 defaultEntry!1528) t!10076) tb!3073))

(declare-fun result!5549 () Bool)

(assert (=> tb!3073 (= result!5549 tp_is_empty!7281)))

(assert (=> b!343450 t!10076))

(declare-fun b_and!14539 () Bool)

(assert (= b_and!14535 (and (=> t!10076 result!5549) b_and!14539)))

(declare-fun m!345315 () Bool)

(assert (=> b!343454 m!345315))

(declare-fun m!345317 () Bool)

(assert (=> b!343460 m!345317))

(declare-fun m!345319 () Bool)

(assert (=> b!343460 m!345319))

(declare-fun m!345321 () Bool)

(assert (=> b!343460 m!345321))

(declare-fun m!345323 () Bool)

(assert (=> b!343460 m!345323))

(declare-fun m!345325 () Bool)

(assert (=> b!343460 m!345325))

(declare-fun m!345327 () Bool)

(assert (=> b!343460 m!345327))

(declare-fun m!345329 () Bool)

(assert (=> b!343460 m!345329))

(declare-fun m!345331 () Bool)

(assert (=> b!343460 m!345331))

(assert (=> b!343460 m!345327))

(declare-fun m!345333 () Bool)

(assert (=> b!343460 m!345333))

(assert (=> b!343460 m!345295))

(declare-fun m!345335 () Bool)

(assert (=> b!343460 m!345335))

(declare-fun m!345337 () Bool)

(assert (=> b!343460 m!345337))

(assert (=> b!343460 m!345331))

(declare-fun m!345339 () Bool)

(assert (=> b!343460 m!345339))

(declare-fun m!345341 () Bool)

(assert (=> b!343460 m!345341))

(assert (=> b!343460 m!345319))

(declare-fun m!345343 () Bool)

(assert (=> b!343460 m!345343))

(declare-fun m!345345 () Bool)

(assert (=> b!343460 m!345345))

(assert (=> b!343460 m!345335))

(declare-fun m!345347 () Bool)

(assert (=> b!343460 m!345347))

(assert (=> b!343457 m!345295))

(assert (=> b!343457 m!345295))

(assert (=> b!343457 m!345297))

(assert (=> b!343466 m!345295))

(assert (=> b!343466 m!345295))

(declare-fun m!345349 () Bool)

(assert (=> b!343466 m!345349))

(declare-fun m!345351 () Bool)

(assert (=> bm!26662 m!345351))

(declare-fun m!345353 () Bool)

(assert (=> b!343458 m!345353))

(assert (=> d!71059 m!345239))

(declare-fun m!345355 () Bool)

(assert (=> b!343450 m!345355))

(assert (=> b!343450 m!345295))

(declare-fun m!345357 () Bool)

(assert (=> b!343450 m!345357))

(assert (=> b!343450 m!345295))

(declare-fun m!345359 () Bool)

(assert (=> b!343450 m!345359))

(assert (=> b!343450 m!345355))

(assert (=> b!343450 m!345357))

(declare-fun m!345361 () Bool)

(assert (=> b!343450 m!345361))

(declare-fun m!345363 () Bool)

(assert (=> bm!26668 m!345363))

(assert (=> b!343451 m!345295))

(assert (=> b!343451 m!345295))

(assert (=> b!343451 m!345297))

(assert (=> bm!26663 m!345317))

(declare-fun m!345365 () Bool)

(assert (=> bm!26664 m!345365))

(declare-fun m!345367 () Bool)

(assert (=> b!343453 m!345367))

(assert (=> b!343333 d!71059))

(declare-fun d!71061 () Bool)

(assert (=> d!71061 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34380 d!71061))

(declare-fun d!71063 () Bool)

(assert (=> d!71063 (= (array_inv!6364 _values!1525) (bvsge (size!8946 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34380 d!71063))

(declare-fun d!71065 () Bool)

(assert (=> d!71065 (= (array_inv!6365 _keys!1895) (bvsge (size!8947 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34380 d!71065))

(declare-fun b!343482 () Bool)

(declare-fun e!210615 () Bool)

(declare-fun call!26674 () Bool)

(assert (=> b!343482 (= e!210615 call!26674)))

(declare-fun b!343483 () Bool)

(declare-fun e!210612 () Bool)

(declare-fun contains!2200 (List!4959 (_ BitVec 64)) Bool)

(assert (=> b!343483 (= e!210612 (contains!2200 Nil!4956 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26671 () Bool)

(declare-fun c!52944 () Bool)

(assert (=> bm!26671 (= call!26674 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52944 (Cons!4955 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000) Nil!4956) Nil!4956)))))

(declare-fun d!71067 () Bool)

(declare-fun res!189869 () Bool)

(declare-fun e!210613 () Bool)

(assert (=> d!71067 (=> res!189869 e!210613)))

(assert (=> d!71067 (= res!189869 (bvsge #b00000000000000000000000000000000 (size!8947 _keys!1895)))))

(assert (=> d!71067 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4956) e!210613)))

(declare-fun b!343484 () Bool)

(declare-fun e!210614 () Bool)

(assert (=> b!343484 (= e!210613 e!210614)))

(declare-fun res!189867 () Bool)

(assert (=> b!343484 (=> (not res!189867) (not e!210614))))

(assert (=> b!343484 (= res!189867 (not e!210612))))

(declare-fun res!189868 () Bool)

(assert (=> b!343484 (=> (not res!189868) (not e!210612))))

(assert (=> b!343484 (= res!189868 (validKeyInArray!0 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343485 () Bool)

(assert (=> b!343485 (= e!210614 e!210615)))

(assert (=> b!343485 (= c!52944 (validKeyInArray!0 (select (arr!8595 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343486 () Bool)

(assert (=> b!343486 (= e!210615 call!26674)))

(assert (= (and d!71067 (not res!189869)) b!343484))

(assert (= (and b!343484 res!189868) b!343483))

(assert (= (and b!343484 res!189867) b!343485))

(assert (= (and b!343485 c!52944) b!343486))

(assert (= (and b!343485 (not c!52944)) b!343482))

(assert (= (or b!343486 b!343482) bm!26671))

(assert (=> b!343483 m!345295))

(assert (=> b!343483 m!345295))

(declare-fun m!345369 () Bool)

(assert (=> b!343483 m!345369))

(assert (=> bm!26671 m!345295))

(declare-fun m!345371 () Bool)

(assert (=> bm!26671 m!345371))

(assert (=> b!343484 m!345295))

(assert (=> b!343484 m!345295))

(assert (=> b!343484 m!345297))

(assert (=> b!343485 m!345295))

(assert (=> b!343485 m!345295))

(assert (=> b!343485 m!345297))

(assert (=> b!343343 d!71067))

(declare-fun d!71069 () Bool)

(declare-fun res!189874 () Bool)

(declare-fun e!210620 () Bool)

(assert (=> d!71069 (=> res!189874 e!210620)))

(assert (=> d!71069 (= res!189874 (= (select (arr!8595 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71069 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!210620)))

(declare-fun b!343491 () Bool)

(declare-fun e!210621 () Bool)

(assert (=> b!343491 (= e!210620 e!210621)))

(declare-fun res!189875 () Bool)

(assert (=> b!343491 (=> (not res!189875) (not e!210621))))

(assert (=> b!343491 (= res!189875 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8947 _keys!1895)))))

(declare-fun b!343492 () Bool)

(assert (=> b!343492 (= e!210621 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71069 (not res!189874)) b!343491))

(assert (= (and b!343491 res!189875) b!343492))

(assert (=> d!71069 m!345295))

(declare-fun m!345373 () Bool)

(assert (=> b!343492 m!345373))

(assert (=> b!343338 d!71069))

(declare-fun b!343505 () Bool)

(declare-fun e!210628 () SeekEntryResult!3316)

(declare-fun e!210629 () SeekEntryResult!3316)

(assert (=> b!343505 (= e!210628 e!210629)))

(declare-fun lt!162563 () (_ BitVec 64))

(declare-fun lt!162564 () SeekEntryResult!3316)

(assert (=> b!343505 (= lt!162563 (select (arr!8595 _keys!1895) (index!15445 lt!162564)))))

(declare-fun c!52951 () Bool)

(assert (=> b!343505 (= c!52951 (= lt!162563 k0!1348))))

(declare-fun b!343506 () Bool)

(assert (=> b!343506 (= e!210629 (Found!3316 (index!15445 lt!162564)))))

(declare-fun b!343507 () Bool)

(assert (=> b!343507 (= e!210628 Undefined!3316)))

(declare-fun e!210630 () SeekEntryResult!3316)

(declare-fun b!343508 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18155 (_ BitVec 32)) SeekEntryResult!3316)

(assert (=> b!343508 (= e!210630 (seekKeyOrZeroReturnVacant!0 (x!34172 lt!162564) (index!15445 lt!162564) (index!15445 lt!162564) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343510 () Bool)

(declare-fun c!52952 () Bool)

(assert (=> b!343510 (= c!52952 (= lt!162563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!343510 (= e!210629 e!210630)))

(declare-fun b!343509 () Bool)

(assert (=> b!343509 (= e!210630 (MissingZero!3316 (index!15445 lt!162564)))))

(declare-fun d!71071 () Bool)

(declare-fun lt!162565 () SeekEntryResult!3316)

(assert (=> d!71071 (and (or ((_ is Undefined!3316) lt!162565) (not ((_ is Found!3316) lt!162565)) (and (bvsge (index!15444 lt!162565) #b00000000000000000000000000000000) (bvslt (index!15444 lt!162565) (size!8947 _keys!1895)))) (or ((_ is Undefined!3316) lt!162565) ((_ is Found!3316) lt!162565) (not ((_ is MissingZero!3316) lt!162565)) (and (bvsge (index!15443 lt!162565) #b00000000000000000000000000000000) (bvslt (index!15443 lt!162565) (size!8947 _keys!1895)))) (or ((_ is Undefined!3316) lt!162565) ((_ is Found!3316) lt!162565) ((_ is MissingZero!3316) lt!162565) (not ((_ is MissingVacant!3316) lt!162565)) (and (bvsge (index!15446 lt!162565) #b00000000000000000000000000000000) (bvslt (index!15446 lt!162565) (size!8947 _keys!1895)))) (or ((_ is Undefined!3316) lt!162565) (ite ((_ is Found!3316) lt!162565) (= (select (arr!8595 _keys!1895) (index!15444 lt!162565)) k0!1348) (ite ((_ is MissingZero!3316) lt!162565) (= (select (arr!8595 _keys!1895) (index!15443 lt!162565)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3316) lt!162565) (= (select (arr!8595 _keys!1895) (index!15446 lt!162565)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71071 (= lt!162565 e!210628)))

(declare-fun c!52953 () Bool)

(assert (=> d!71071 (= c!52953 (and ((_ is Intermediate!3316) lt!162564) (undefined!4128 lt!162564)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18155 (_ BitVec 32)) SeekEntryResult!3316)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71071 (= lt!162564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71071 (validMask!0 mask!2385)))

(assert (=> d!71071 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162565)))

(assert (= (and d!71071 c!52953) b!343507))

(assert (= (and d!71071 (not c!52953)) b!343505))

(assert (= (and b!343505 c!52951) b!343506))

(assert (= (and b!343505 (not c!52951)) b!343510))

(assert (= (and b!343510 c!52952) b!343509))

(assert (= (and b!343510 (not c!52952)) b!343508))

(declare-fun m!345375 () Bool)

(assert (=> b!343505 m!345375))

(declare-fun m!345377 () Bool)

(assert (=> b!343508 m!345377))

(declare-fun m!345379 () Bool)

(assert (=> d!71071 m!345379))

(declare-fun m!345381 () Bool)

(assert (=> d!71071 m!345381))

(declare-fun m!345383 () Bool)

(assert (=> d!71071 m!345383))

(declare-fun m!345385 () Bool)

(assert (=> d!71071 m!345385))

(declare-fun m!345387 () Bool)

(assert (=> d!71071 m!345387))

(assert (=> d!71071 m!345239))

(assert (=> d!71071 m!345385))

(assert (=> b!343330 d!71071))

(declare-fun d!71073 () Bool)

(assert (=> d!71073 (contains!2198 (getCurrentListMap!1662 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!162568 () Unit!10720)

(declare-fun choose!1305 (array!18155 array!18153 (_ BitVec 32) (_ BitVec 32) V!10685 V!10685 (_ BitVec 64) (_ BitVec 32) Int) Unit!10720)

(assert (=> d!71073 (= lt!162568 (choose!1305 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71073 (validMask!0 mask!2385)))

(assert (=> d!71073 (= (lemmaArrayContainsKeyThenInListMap!313 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!162568)))

(declare-fun bs!11766 () Bool)

(assert (= bs!11766 d!71073))

(assert (=> bs!11766 m!345245))

(assert (=> bs!11766 m!345245))

(assert (=> bs!11766 m!345247))

(assert (=> bs!11766 m!345251))

(declare-fun m!345389 () Bool)

(assert (=> bs!11766 m!345389))

(assert (=> bs!11766 m!345239))

(assert (=> b!343334 d!71073))

(declare-fun d!71075 () Bool)

(declare-fun lt!162571 () (_ BitVec 32))

(assert (=> d!71075 (and (or (bvslt lt!162571 #b00000000000000000000000000000000) (bvsge lt!162571 (size!8947 _keys!1895)) (and (bvsge lt!162571 #b00000000000000000000000000000000) (bvslt lt!162571 (size!8947 _keys!1895)))) (bvsge lt!162571 #b00000000000000000000000000000000) (bvslt lt!162571 (size!8947 _keys!1895)) (= (select (arr!8595 _keys!1895) lt!162571) k0!1348))))

(declare-fun e!210633 () (_ BitVec 32))

(assert (=> d!71075 (= lt!162571 e!210633)))

(declare-fun c!52956 () Bool)

(assert (=> d!71075 (= c!52956 (= (select (arr!8595 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8947 _keys!1895)) (bvslt (size!8947 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71075 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!162571)))

(declare-fun b!343515 () Bool)

(assert (=> b!343515 (= e!210633 #b00000000000000000000000000000000)))

(declare-fun b!343516 () Bool)

(assert (=> b!343516 (= e!210633 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71075 c!52956) b!343515))

(assert (= (and d!71075 (not c!52956)) b!343516))

(declare-fun m!345391 () Bool)

(assert (=> d!71075 m!345391))

(assert (=> d!71075 m!345295))

(declare-fun m!345393 () Bool)

(assert (=> b!343516 m!345393))

(assert (=> b!343334 d!71075))

(declare-fun condMapEmpty!12363 () Bool)

(declare-fun mapDefault!12363 () ValueCell!3297)

(assert (=> mapNonEmpty!12357 (= condMapEmpty!12363 (= mapRest!12357 ((as const (Array (_ BitVec 32) ValueCell!3297)) mapDefault!12363)))))

(declare-fun e!210639 () Bool)

(declare-fun mapRes!12363 () Bool)

(assert (=> mapNonEmpty!12357 (= tp!25529 (and e!210639 mapRes!12363))))

(declare-fun b!343523 () Bool)

(declare-fun e!210638 () Bool)

(assert (=> b!343523 (= e!210638 tp_is_empty!7281)))

(declare-fun mapIsEmpty!12363 () Bool)

(assert (=> mapIsEmpty!12363 mapRes!12363))

(declare-fun b!343524 () Bool)

(assert (=> b!343524 (= e!210639 tp_is_empty!7281)))

(declare-fun mapNonEmpty!12363 () Bool)

(declare-fun tp!25539 () Bool)

(assert (=> mapNonEmpty!12363 (= mapRes!12363 (and tp!25539 e!210638))))

(declare-fun mapValue!12363 () ValueCell!3297)

(declare-fun mapRest!12363 () (Array (_ BitVec 32) ValueCell!3297))

(declare-fun mapKey!12363 () (_ BitVec 32))

(assert (=> mapNonEmpty!12363 (= mapRest!12357 (store mapRest!12363 mapKey!12363 mapValue!12363))))

(assert (= (and mapNonEmpty!12357 condMapEmpty!12363) mapIsEmpty!12363))

(assert (= (and mapNonEmpty!12357 (not condMapEmpty!12363)) mapNonEmpty!12363))

(assert (= (and mapNonEmpty!12363 ((_ is ValueCellFull!3297) mapValue!12363)) b!343523))

(assert (= (and mapNonEmpty!12357 ((_ is ValueCellFull!3297) mapDefault!12363)) b!343524))

(declare-fun m!345395 () Bool)

(assert (=> mapNonEmpty!12363 m!345395))

(declare-fun b_lambda!8457 () Bool)

(assert (= b_lambda!8455 (or (and start!34380 b_free!7329) b_lambda!8457)))

(check-sat (not bm!26647) (not b_next!7329) (not b!343485) b_and!14539 (not bm!26668) (not b!343406) (not b!343453) (not b!343458) (not mapNonEmpty!12363) (not b!343457) (not bm!26671) (not b!343460) (not b!343454) (not d!71059) (not b!343483) (not b!343508) (not d!71071) tp_is_empty!7281 (not bm!26663) (not b!343396) (not d!71057) (not b!343492) (not d!71073) (not b!343451) (not bm!26664) (not b_lambda!8457) (not b!343404) (not b!343516) (not b!343395) (not b!343484) (not b!343466) (not bm!26662) (not b!343450))
(check-sat b_and!14539 (not b_next!7329))
