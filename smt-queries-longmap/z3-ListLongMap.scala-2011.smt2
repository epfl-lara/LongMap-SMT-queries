; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35054 () Bool)

(assert start!35054)

(declare-fun b_free!7735 () Bool)

(declare-fun b_next!7735 () Bool)

(assert (=> start!35054 (= b_free!7735 (not b_next!7735))))

(declare-fun tp!26786 () Bool)

(declare-fun b_and!14941 () Bool)

(assert (=> start!35054 (= tp!26786 b_and!14941)))

(declare-fun b!351237 () Bool)

(declare-fun res!194798 () Bool)

(declare-fun e!215088 () Bool)

(assert (=> b!351237 (=> (not res!194798) (not e!215088))))

(declare-datatypes ((array!18943 0))(
  ( (array!18944 (arr!8976 (Array (_ BitVec 32) (_ BitVec 64))) (size!9329 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18943)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18943 (_ BitVec 32)) Bool)

(assert (=> b!351237 (= res!194798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351239 () Bool)

(declare-fun lt!164616 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun e!215086 () Bool)

(declare-fun arrayContainsKey!0 (array!18943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351239 (= e!215086 (not (arrayContainsKey!0 _keys!1895 k0!1348 lt!164616)))))

(declare-fun b!351240 () Bool)

(declare-fun e!215089 () Bool)

(declare-fun tp_is_empty!7687 () Bool)

(assert (=> b!351240 (= e!215089 tp_is_empty!7687)))

(declare-fun b!351241 () Bool)

(declare-fun e!215085 () Bool)

(assert (=> b!351241 (= e!215085 tp_is_empty!7687)))

(declare-fun b!351242 () Bool)

(declare-fun e!215090 () Bool)

(assert (=> b!351242 (= e!215088 e!215090)))

(declare-fun res!194802 () Bool)

(assert (=> b!351242 (=> (not res!194802) (not e!215090))))

(declare-datatypes ((SeekEntryResult!3457 0))(
  ( (MissingZero!3457 (index!16007 (_ BitVec 32))) (Found!3457 (index!16008 (_ BitVec 32))) (Intermediate!3457 (undefined!4269 Bool) (index!16009 (_ BitVec 32)) (x!34982 (_ BitVec 32))) (Undefined!3457) (MissingVacant!3457 (index!16010 (_ BitVec 32))) )
))
(declare-fun lt!164615 () SeekEntryResult!3457)

(get-info :version)

(assert (=> b!351242 (= res!194802 (and (not ((_ is Found!3457) lt!164615)) (not ((_ is MissingZero!3457) lt!164615)) ((_ is MissingVacant!3457) lt!164615)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18943 (_ BitVec 32)) SeekEntryResult!3457)

(assert (=> b!351242 (= lt!164615 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351243 () Bool)

(declare-fun res!194804 () Bool)

(assert (=> b!351243 (=> (not res!194804) (not e!215088))))

(declare-datatypes ((V!11227 0))(
  ( (V!11228 (val!3888 Int)) )
))
(declare-fun zeroValue!1467 () V!11227)

(declare-datatypes ((ValueCell!3500 0))(
  ( (ValueCellFull!3500 (v!6070 V!11227)) (EmptyCell!3500) )
))
(declare-datatypes ((array!18945 0))(
  ( (array!18946 (arr!8977 (Array (_ BitVec 32) ValueCell!3500)) (size!9330 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18945)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11227)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5584 0))(
  ( (tuple2!5585 (_1!2803 (_ BitVec 64)) (_2!2803 V!11227)) )
))
(declare-datatypes ((List!5199 0))(
  ( (Nil!5196) (Cons!5195 (h!6051 tuple2!5584) (t!10330 List!5199)) )
))
(declare-datatypes ((ListLongMap!4487 0))(
  ( (ListLongMap!4488 (toList!2259 List!5199)) )
))
(declare-fun contains!2340 (ListLongMap!4487 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1764 (array!18943 array!18945 (_ BitVec 32) (_ BitVec 32) V!11227 V!11227 (_ BitVec 32) Int) ListLongMap!4487)

(assert (=> b!351243 (= res!194804 (not (contains!2340 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351244 () Bool)

(declare-fun res!194800 () Bool)

(assert (=> b!351244 (=> (not res!194800) (not e!215088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351244 (= res!194800 (validKeyInArray!0 k0!1348))))

(declare-fun b!351245 () Bool)

(declare-fun res!194805 () Bool)

(assert (=> b!351245 (=> (not res!194805) (not e!215088))))

(declare-datatypes ((List!5200 0))(
  ( (Nil!5197) (Cons!5196 (h!6052 (_ BitVec 64)) (t!10331 List!5200)) )
))
(declare-fun arrayNoDuplicates!0 (array!18943 (_ BitVec 32) List!5200) Bool)

(assert (=> b!351245 (= res!194805 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5197))))

(declare-fun b!351246 () Bool)

(declare-fun res!194797 () Bool)

(assert (=> b!351246 (=> (not res!194797) (not e!215088))))

(assert (=> b!351246 (= res!194797 (and (= (size!9330 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9329 _keys!1895) (size!9330 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13005 () Bool)

(declare-fun mapRes!13005 () Bool)

(assert (=> mapIsEmpty!13005 mapRes!13005))

(declare-fun b!351247 () Bool)

(declare-fun e!215084 () Bool)

(assert (=> b!351247 (= e!215084 (and e!215085 mapRes!13005))))

(declare-fun condMapEmpty!13005 () Bool)

(declare-fun mapDefault!13005 () ValueCell!3500)

(assert (=> b!351247 (= condMapEmpty!13005 (= (arr!8977 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3500)) mapDefault!13005)))))

(declare-fun mapNonEmpty!13005 () Bool)

(declare-fun tp!26787 () Bool)

(assert (=> mapNonEmpty!13005 (= mapRes!13005 (and tp!26787 e!215089))))

(declare-fun mapRest!13005 () (Array (_ BitVec 32) ValueCell!3500))

(declare-fun mapValue!13005 () ValueCell!3500)

(declare-fun mapKey!13005 () (_ BitVec 32))

(assert (=> mapNonEmpty!13005 (= (arr!8977 _values!1525) (store mapRest!13005 mapKey!13005 mapValue!13005))))

(declare-fun b!351248 () Bool)

(declare-fun res!194803 () Bool)

(assert (=> b!351248 (=> (not res!194803) (not e!215090))))

(assert (=> b!351248 (= res!194803 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun res!194799 () Bool)

(assert (=> start!35054 (=> (not res!194799) (not e!215088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35054 (= res!194799 (validMask!0 mask!2385))))

(assert (=> start!35054 e!215088))

(assert (=> start!35054 true))

(assert (=> start!35054 tp_is_empty!7687))

(assert (=> start!35054 tp!26786))

(declare-fun array_inv!6650 (array!18945) Bool)

(assert (=> start!35054 (and (array_inv!6650 _values!1525) e!215084)))

(declare-fun array_inv!6651 (array!18943) Bool)

(assert (=> start!35054 (array_inv!6651 _keys!1895)))

(declare-fun b!351238 () Bool)

(assert (=> b!351238 (= e!215090 e!215086)))

(declare-fun res!194801 () Bool)

(assert (=> b!351238 (=> (not res!194801) (not e!215086))))

(assert (=> b!351238 (= res!194801 (and (bvsge lt!164616 #b00000000000000000000000000000000) (bvslt lt!164616 (size!9329 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18943 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351238 (= lt!164616 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!35054 res!194799) b!351246))

(assert (= (and b!351246 res!194797) b!351237))

(assert (= (and b!351237 res!194798) b!351245))

(assert (= (and b!351245 res!194805) b!351244))

(assert (= (and b!351244 res!194800) b!351243))

(assert (= (and b!351243 res!194804) b!351242))

(assert (= (and b!351242 res!194802) b!351248))

(assert (= (and b!351248 res!194803) b!351238))

(assert (= (and b!351238 res!194801) b!351239))

(assert (= (and b!351247 condMapEmpty!13005) mapIsEmpty!13005))

(assert (= (and b!351247 (not condMapEmpty!13005)) mapNonEmpty!13005))

(assert (= (and mapNonEmpty!13005 ((_ is ValueCellFull!3500) mapValue!13005)) b!351240))

(assert (= (and b!351247 ((_ is ValueCellFull!3500) mapDefault!13005)) b!351241))

(assert (= start!35054 b!351247))

(declare-fun m!350683 () Bool)

(assert (=> mapNonEmpty!13005 m!350683))

(declare-fun m!350685 () Bool)

(assert (=> b!351242 m!350685))

(declare-fun m!350687 () Bool)

(assert (=> b!351248 m!350687))

(declare-fun m!350689 () Bool)

(assert (=> start!35054 m!350689))

(declare-fun m!350691 () Bool)

(assert (=> start!35054 m!350691))

(declare-fun m!350693 () Bool)

(assert (=> start!35054 m!350693))

(declare-fun m!350695 () Bool)

(assert (=> b!351238 m!350695))

(declare-fun m!350697 () Bool)

(assert (=> b!351239 m!350697))

(declare-fun m!350699 () Bool)

(assert (=> b!351237 m!350699))

(declare-fun m!350701 () Bool)

(assert (=> b!351243 m!350701))

(assert (=> b!351243 m!350701))

(declare-fun m!350703 () Bool)

(assert (=> b!351243 m!350703))

(declare-fun m!350705 () Bool)

(assert (=> b!351244 m!350705))

(declare-fun m!350707 () Bool)

(assert (=> b!351245 m!350707))

(check-sat (not b!351244) b_and!14941 (not mapNonEmpty!13005) (not b!351237) (not b!351239) (not b!351238) tp_is_empty!7687 (not b!351243) (not b!351245) (not b!351242) (not b_next!7735) (not b!351248) (not start!35054))
(check-sat b_and!14941 (not b_next!7735))
(get-model)

(declare-fun d!71267 () Bool)

(assert (=> d!71267 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35054 d!71267))

(declare-fun d!71269 () Bool)

(assert (=> d!71269 (= (array_inv!6650 _values!1525) (bvsge (size!9330 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35054 d!71269))

(declare-fun d!71271 () Bool)

(assert (=> d!71271 (= (array_inv!6651 _keys!1895) (bvsge (size!9329 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35054 d!71271))

(declare-fun d!71273 () Bool)

(declare-fun res!194864 () Bool)

(declare-fun e!215137 () Bool)

(assert (=> d!71273 (=> res!194864 e!215137)))

(assert (=> d!71273 (= res!194864 (= (select (arr!8976 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71273 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215137)))

(declare-fun b!351325 () Bool)

(declare-fun e!215138 () Bool)

(assert (=> b!351325 (= e!215137 e!215138)))

(declare-fun res!194865 () Bool)

(assert (=> b!351325 (=> (not res!194865) (not e!215138))))

(assert (=> b!351325 (= res!194865 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9329 _keys!1895)))))

(declare-fun b!351326 () Bool)

(assert (=> b!351326 (= e!215138 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71273 (not res!194864)) b!351325))

(assert (= (and b!351325 res!194865) b!351326))

(declare-fun m!350761 () Bool)

(assert (=> d!71273 m!350761))

(declare-fun m!350763 () Bool)

(assert (=> b!351326 m!350763))

(assert (=> b!351248 d!71273))

(declare-fun b!351337 () Bool)

(declare-fun e!215149 () Bool)

(declare-fun e!215148 () Bool)

(assert (=> b!351337 (= e!215149 e!215148)))

(declare-fun c!53387 () Bool)

(assert (=> b!351337 (= c!53387 (validKeyInArray!0 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351338 () Bool)

(declare-fun call!26984 () Bool)

(assert (=> b!351338 (= e!215148 call!26984)))

(declare-fun b!351339 () Bool)

(declare-fun e!215147 () Bool)

(declare-fun contains!2343 (List!5200 (_ BitVec 64)) Bool)

(assert (=> b!351339 (= e!215147 (contains!2343 Nil!5197 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351340 () Bool)

(declare-fun e!215150 () Bool)

(assert (=> b!351340 (= e!215150 e!215149)))

(declare-fun res!194874 () Bool)

(assert (=> b!351340 (=> (not res!194874) (not e!215149))))

(assert (=> b!351340 (= res!194874 (not e!215147))))

(declare-fun res!194872 () Bool)

(assert (=> b!351340 (=> (not res!194872) (not e!215147))))

(assert (=> b!351340 (= res!194872 (validKeyInArray!0 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351341 () Bool)

(assert (=> b!351341 (= e!215148 call!26984)))

(declare-fun d!71275 () Bool)

(declare-fun res!194873 () Bool)

(assert (=> d!71275 (=> res!194873 e!215150)))

(assert (=> d!71275 (= res!194873 (bvsge #b00000000000000000000000000000000 (size!9329 _keys!1895)))))

(assert (=> d!71275 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5197) e!215150)))

(declare-fun bm!26981 () Bool)

(assert (=> bm!26981 (= call!26984 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53387 (Cons!5196 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000) Nil!5197) Nil!5197)))))

(assert (= (and d!71275 (not res!194873)) b!351340))

(assert (= (and b!351340 res!194872) b!351339))

(assert (= (and b!351340 res!194874) b!351337))

(assert (= (and b!351337 c!53387) b!351341))

(assert (= (and b!351337 (not c!53387)) b!351338))

(assert (= (or b!351341 b!351338) bm!26981))

(assert (=> b!351337 m!350761))

(assert (=> b!351337 m!350761))

(declare-fun m!350765 () Bool)

(assert (=> b!351337 m!350765))

(assert (=> b!351339 m!350761))

(assert (=> b!351339 m!350761))

(declare-fun m!350767 () Bool)

(assert (=> b!351339 m!350767))

(assert (=> b!351340 m!350761))

(assert (=> b!351340 m!350761))

(assert (=> b!351340 m!350765))

(assert (=> bm!26981 m!350761))

(declare-fun m!350769 () Bool)

(assert (=> bm!26981 m!350769))

(assert (=> b!351245 d!71275))

(declare-fun d!71277 () Bool)

(declare-fun res!194875 () Bool)

(declare-fun e!215151 () Bool)

(assert (=> d!71277 (=> res!194875 e!215151)))

(assert (=> d!71277 (= res!194875 (= (select (arr!8976 _keys!1895) lt!164616) k0!1348))))

(assert (=> d!71277 (= (arrayContainsKey!0 _keys!1895 k0!1348 lt!164616) e!215151)))

(declare-fun b!351342 () Bool)

(declare-fun e!215152 () Bool)

(assert (=> b!351342 (= e!215151 e!215152)))

(declare-fun res!194876 () Bool)

(assert (=> b!351342 (=> (not res!194876) (not e!215152))))

(assert (=> b!351342 (= res!194876 (bvslt (bvadd lt!164616 #b00000000000000000000000000000001) (size!9329 _keys!1895)))))

(declare-fun b!351343 () Bool)

(assert (=> b!351343 (= e!215152 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd lt!164616 #b00000000000000000000000000000001)))))

(assert (= (and d!71277 (not res!194875)) b!351342))

(assert (= (and b!351342 res!194876) b!351343))

(declare-fun m!350771 () Bool)

(assert (=> d!71277 m!350771))

(declare-fun m!350773 () Bool)

(assert (=> b!351343 m!350773))

(assert (=> b!351239 d!71277))

(declare-fun d!71279 () Bool)

(assert (=> d!71279 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351244 d!71279))

(declare-fun d!71281 () Bool)

(declare-fun lt!164631 () (_ BitVec 32))

(assert (=> d!71281 (and (or (bvslt lt!164631 #b00000000000000000000000000000000) (bvsge lt!164631 (size!9329 _keys!1895)) (and (bvsge lt!164631 #b00000000000000000000000000000000) (bvslt lt!164631 (size!9329 _keys!1895)))) (bvsge lt!164631 #b00000000000000000000000000000000) (bvslt lt!164631 (size!9329 _keys!1895)) (= (select (arr!8976 _keys!1895) lt!164631) k0!1348))))

(declare-fun e!215155 () (_ BitVec 32))

(assert (=> d!71281 (= lt!164631 e!215155)))

(declare-fun c!53390 () Bool)

(assert (=> d!71281 (= c!53390 (= (select (arr!8976 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71281 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9329 _keys!1895)) (bvslt (size!9329 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71281 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164631)))

(declare-fun b!351348 () Bool)

(assert (=> b!351348 (= e!215155 #b00000000000000000000000000000000)))

(declare-fun b!351349 () Bool)

(assert (=> b!351349 (= e!215155 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71281 c!53390) b!351348))

(assert (= (and d!71281 (not c!53390)) b!351349))

(declare-fun m!350775 () Bool)

(assert (=> d!71281 m!350775))

(assert (=> d!71281 m!350761))

(declare-fun m!350777 () Bool)

(assert (=> b!351349 m!350777))

(assert (=> b!351238 d!71281))

(declare-fun d!71283 () Bool)

(declare-fun e!215160 () Bool)

(assert (=> d!71283 e!215160))

(declare-fun res!194879 () Bool)

(assert (=> d!71283 (=> res!194879 e!215160)))

(declare-fun lt!164642 () Bool)

(assert (=> d!71283 (= res!194879 (not lt!164642))))

(declare-fun lt!164643 () Bool)

(assert (=> d!71283 (= lt!164642 lt!164643)))

(declare-datatypes ((Unit!10851 0))(
  ( (Unit!10852) )
))
(declare-fun lt!164640 () Unit!10851)

(declare-fun e!215161 () Unit!10851)

(assert (=> d!71283 (= lt!164640 e!215161)))

(declare-fun c!53393 () Bool)

(assert (=> d!71283 (= c!53393 lt!164643)))

(declare-fun containsKey!340 (List!5199 (_ BitVec 64)) Bool)

(assert (=> d!71283 (= lt!164643 (containsKey!340 (toList!2259 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71283 (= (contains!2340 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164642)))

(declare-fun b!351356 () Bool)

(declare-fun lt!164641 () Unit!10851)

(assert (=> b!351356 (= e!215161 lt!164641)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!289 (List!5199 (_ BitVec 64)) Unit!10851)

(assert (=> b!351356 (= lt!164641 (lemmaContainsKeyImpliesGetValueByKeyDefined!289 (toList!2259 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!354 0))(
  ( (Some!353 (v!6073 V!11227)) (None!352) )
))
(declare-fun isDefined!290 (Option!354) Bool)

(declare-fun getValueByKey!348 (List!5199 (_ BitVec 64)) Option!354)

(assert (=> b!351356 (isDefined!290 (getValueByKey!348 (toList!2259 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!351357 () Bool)

(declare-fun Unit!10853 () Unit!10851)

(assert (=> b!351357 (= e!215161 Unit!10853)))

(declare-fun b!351358 () Bool)

(assert (=> b!351358 (= e!215160 (isDefined!290 (getValueByKey!348 (toList!2259 (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71283 c!53393) b!351356))

(assert (= (and d!71283 (not c!53393)) b!351357))

(assert (= (and d!71283 (not res!194879)) b!351358))

(declare-fun m!350779 () Bool)

(assert (=> d!71283 m!350779))

(declare-fun m!350781 () Bool)

(assert (=> b!351356 m!350781))

(declare-fun m!350783 () Bool)

(assert (=> b!351356 m!350783))

(assert (=> b!351356 m!350783))

(declare-fun m!350785 () Bool)

(assert (=> b!351356 m!350785))

(assert (=> b!351358 m!350783))

(assert (=> b!351358 m!350783))

(assert (=> b!351358 m!350785))

(assert (=> b!351243 d!71283))

(declare-fun b!351401 () Bool)

(declare-fun e!215188 () Bool)

(declare-fun e!215195 () Bool)

(assert (=> b!351401 (= e!215188 e!215195)))

(declare-fun res!194901 () Bool)

(assert (=> b!351401 (=> (not res!194901) (not e!215195))))

(declare-fun lt!164696 () ListLongMap!4487)

(assert (=> b!351401 (= res!194901 (contains!2340 lt!164696 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!351401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9329 _keys!1895)))))

(declare-fun bm!26996 () Bool)

(declare-fun call!27001 () Bool)

(assert (=> bm!26996 (= call!27001 (contains!2340 lt!164696 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351402 () Bool)

(declare-fun e!215194 () ListLongMap!4487)

(declare-fun e!215200 () ListLongMap!4487)

(assert (=> b!351402 (= e!215194 e!215200)))

(declare-fun c!53411 () Bool)

(assert (=> b!351402 (= c!53411 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26997 () Bool)

(declare-fun call!27003 () ListLongMap!4487)

(declare-fun call!26999 () ListLongMap!4487)

(assert (=> bm!26997 (= call!27003 call!26999)))

(declare-fun b!351403 () Bool)

(declare-fun e!215198 () Bool)

(declare-fun call!27005 () Bool)

(assert (=> b!351403 (= e!215198 (not call!27005))))

(declare-fun b!351404 () Bool)

(declare-fun e!215193 () Unit!10851)

(declare-fun lt!164692 () Unit!10851)

(assert (=> b!351404 (= e!215193 lt!164692)))

(declare-fun lt!164700 () ListLongMap!4487)

(declare-fun getCurrentListMapNoExtraKeys!608 (array!18943 array!18945 (_ BitVec 32) (_ BitVec 32) V!11227 V!11227 (_ BitVec 32) Int) ListLongMap!4487)

(assert (=> b!351404 (= lt!164700 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164702 () (_ BitVec 64))

(assert (=> b!351404 (= lt!164702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164708 () (_ BitVec 64))

(assert (=> b!351404 (= lt!164708 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164690 () Unit!10851)

(declare-fun addStillContains!268 (ListLongMap!4487 (_ BitVec 64) V!11227 (_ BitVec 64)) Unit!10851)

(assert (=> b!351404 (= lt!164690 (addStillContains!268 lt!164700 lt!164702 zeroValue!1467 lt!164708))))

(declare-fun +!745 (ListLongMap!4487 tuple2!5584) ListLongMap!4487)

(assert (=> b!351404 (contains!2340 (+!745 lt!164700 (tuple2!5585 lt!164702 zeroValue!1467)) lt!164708)))

(declare-fun lt!164704 () Unit!10851)

(assert (=> b!351404 (= lt!164704 lt!164690)))

(declare-fun lt!164707 () ListLongMap!4487)

(assert (=> b!351404 (= lt!164707 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164705 () (_ BitVec 64))

(assert (=> b!351404 (= lt!164705 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164701 () (_ BitVec 64))

(assert (=> b!351404 (= lt!164701 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164694 () Unit!10851)

(declare-fun addApplyDifferent!268 (ListLongMap!4487 (_ BitVec 64) V!11227 (_ BitVec 64)) Unit!10851)

(assert (=> b!351404 (= lt!164694 (addApplyDifferent!268 lt!164707 lt!164705 minValue!1467 lt!164701))))

(declare-fun apply!292 (ListLongMap!4487 (_ BitVec 64)) V!11227)

(assert (=> b!351404 (= (apply!292 (+!745 lt!164707 (tuple2!5585 lt!164705 minValue!1467)) lt!164701) (apply!292 lt!164707 lt!164701))))

(declare-fun lt!164709 () Unit!10851)

(assert (=> b!351404 (= lt!164709 lt!164694)))

(declare-fun lt!164693 () ListLongMap!4487)

(assert (=> b!351404 (= lt!164693 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164691 () (_ BitVec 64))

(assert (=> b!351404 (= lt!164691 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164697 () (_ BitVec 64))

(assert (=> b!351404 (= lt!164697 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164703 () Unit!10851)

(assert (=> b!351404 (= lt!164703 (addApplyDifferent!268 lt!164693 lt!164691 zeroValue!1467 lt!164697))))

(assert (=> b!351404 (= (apply!292 (+!745 lt!164693 (tuple2!5585 lt!164691 zeroValue!1467)) lt!164697) (apply!292 lt!164693 lt!164697))))

(declare-fun lt!164699 () Unit!10851)

(assert (=> b!351404 (= lt!164699 lt!164703)))

(declare-fun lt!164688 () ListLongMap!4487)

(assert (=> b!351404 (= lt!164688 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164689 () (_ BitVec 64))

(assert (=> b!351404 (= lt!164689 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164706 () (_ BitVec 64))

(assert (=> b!351404 (= lt!164706 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!351404 (= lt!164692 (addApplyDifferent!268 lt!164688 lt!164689 minValue!1467 lt!164706))))

(assert (=> b!351404 (= (apply!292 (+!745 lt!164688 (tuple2!5585 lt!164689 minValue!1467)) lt!164706) (apply!292 lt!164688 lt!164706))))

(declare-fun b!351405 () Bool)

(declare-fun e!215197 () Bool)

(assert (=> b!351405 (= e!215198 e!215197)))

(declare-fun res!194898 () Bool)

(assert (=> b!351405 (= res!194898 call!27005)))

(assert (=> b!351405 (=> (not res!194898) (not e!215197))))

(declare-fun bm!26998 () Bool)

(declare-fun call!27000 () ListLongMap!4487)

(declare-fun call!27002 () ListLongMap!4487)

(assert (=> bm!26998 (= call!27000 call!27002)))

(declare-fun b!351406 () Bool)

(declare-fun get!4794 (ValueCell!3500 V!11227) V!11227)

(declare-fun dynLambda!626 (Int (_ BitVec 64)) V!11227)

(assert (=> b!351406 (= e!215195 (= (apply!292 lt!164696 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000)) (get!4794 (select (arr!8977 _values!1525) #b00000000000000000000000000000000) (dynLambda!626 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9330 _values!1525)))))

(assert (=> b!351406 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9329 _keys!1895)))))

(declare-fun b!351407 () Bool)

(declare-fun e!215196 () ListLongMap!4487)

(assert (=> b!351407 (= e!215196 call!27003)))

(declare-fun b!351408 () Bool)

(assert (=> b!351408 (= e!215200 call!27000)))

(declare-fun b!351409 () Bool)

(declare-fun res!194899 () Bool)

(declare-fun e!215191 () Bool)

(assert (=> b!351409 (=> (not res!194899) (not e!215191))))

(assert (=> b!351409 (= res!194899 e!215188)))

(declare-fun res!194906 () Bool)

(assert (=> b!351409 (=> res!194906 e!215188)))

(declare-fun e!215199 () Bool)

(assert (=> b!351409 (= res!194906 (not e!215199))))

(declare-fun res!194903 () Bool)

(assert (=> b!351409 (=> (not res!194903) (not e!215199))))

(assert (=> b!351409 (= res!194903 (bvslt #b00000000000000000000000000000000 (size!9329 _keys!1895)))))

(declare-fun b!351410 () Bool)

(declare-fun e!215189 () Bool)

(assert (=> b!351410 (= e!215189 (not call!27001))))

(declare-fun b!351411 () Bool)

(declare-fun Unit!10854 () Unit!10851)

(assert (=> b!351411 (= e!215193 Unit!10854)))

(declare-fun b!351412 () Bool)

(declare-fun res!194905 () Bool)

(assert (=> b!351412 (=> (not res!194905) (not e!215191))))

(assert (=> b!351412 (= res!194905 e!215198)))

(declare-fun c!53410 () Bool)

(assert (=> b!351412 (= c!53410 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26999 () Bool)

(declare-fun call!27004 () ListLongMap!4487)

(assert (=> bm!26999 (= call!26999 call!27004)))

(declare-fun c!53408 () Bool)

(declare-fun bm!27000 () Bool)

(assert (=> bm!27000 (= call!27002 (+!745 (ite c!53408 call!27004 (ite c!53411 call!26999 call!27003)) (ite (or c!53408 c!53411) (tuple2!5585 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!351413 () Bool)

(declare-fun c!53406 () Bool)

(assert (=> b!351413 (= c!53406 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!351413 (= e!215200 e!215196)))

(declare-fun b!351414 () Bool)

(assert (=> b!351414 (= e!215197 (= (apply!292 lt!164696 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!27001 () Bool)

(assert (=> bm!27001 (= call!27004 (getCurrentListMapNoExtraKeys!608 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!351415 () Bool)

(declare-fun e!215192 () Bool)

(assert (=> b!351415 (= e!215189 e!215192)))

(declare-fun res!194902 () Bool)

(assert (=> b!351415 (= res!194902 call!27001)))

(assert (=> b!351415 (=> (not res!194902) (not e!215192))))

(declare-fun b!351416 () Bool)

(assert (=> b!351416 (= e!215194 (+!745 call!27002 (tuple2!5585 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!351417 () Bool)

(declare-fun e!215190 () Bool)

(assert (=> b!351417 (= e!215190 (validKeyInArray!0 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27002 () Bool)

(assert (=> bm!27002 (= call!27005 (contains!2340 lt!164696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351418 () Bool)

(assert (=> b!351418 (= e!215199 (validKeyInArray!0 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351419 () Bool)

(assert (=> b!351419 (= e!215196 call!27000)))

(declare-fun d!71285 () Bool)

(assert (=> d!71285 e!215191))

(declare-fun res!194900 () Bool)

(assert (=> d!71285 (=> (not res!194900) (not e!215191))))

(assert (=> d!71285 (= res!194900 (or (bvsge #b00000000000000000000000000000000 (size!9329 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9329 _keys!1895)))))))

(declare-fun lt!164698 () ListLongMap!4487)

(assert (=> d!71285 (= lt!164696 lt!164698)))

(declare-fun lt!164695 () Unit!10851)

(assert (=> d!71285 (= lt!164695 e!215193)))

(declare-fun c!53407 () Bool)

(assert (=> d!71285 (= c!53407 e!215190)))

(declare-fun res!194904 () Bool)

(assert (=> d!71285 (=> (not res!194904) (not e!215190))))

(assert (=> d!71285 (= res!194904 (bvslt #b00000000000000000000000000000000 (size!9329 _keys!1895)))))

(assert (=> d!71285 (= lt!164698 e!215194)))

(assert (=> d!71285 (= c!53408 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71285 (validMask!0 mask!2385)))

(assert (=> d!71285 (= (getCurrentListMap!1764 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164696)))

(declare-fun b!351420 () Bool)

(assert (=> b!351420 (= e!215192 (= (apply!292 lt!164696 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!351421 () Bool)

(assert (=> b!351421 (= e!215191 e!215189)))

(declare-fun c!53409 () Bool)

(assert (=> b!351421 (= c!53409 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!71285 c!53408) b!351416))

(assert (= (and d!71285 (not c!53408)) b!351402))

(assert (= (and b!351402 c!53411) b!351408))

(assert (= (and b!351402 (not c!53411)) b!351413))

(assert (= (and b!351413 c!53406) b!351419))

(assert (= (and b!351413 (not c!53406)) b!351407))

(assert (= (or b!351419 b!351407) bm!26997))

(assert (= (or b!351408 bm!26997) bm!26999))

(assert (= (or b!351408 b!351419) bm!26998))

(assert (= (or b!351416 bm!26999) bm!27001))

(assert (= (or b!351416 bm!26998) bm!27000))

(assert (= (and d!71285 res!194904) b!351417))

(assert (= (and d!71285 c!53407) b!351404))

(assert (= (and d!71285 (not c!53407)) b!351411))

(assert (= (and d!71285 res!194900) b!351409))

(assert (= (and b!351409 res!194903) b!351418))

(assert (= (and b!351409 (not res!194906)) b!351401))

(assert (= (and b!351401 res!194901) b!351406))

(assert (= (and b!351409 res!194899) b!351412))

(assert (= (and b!351412 c!53410) b!351405))

(assert (= (and b!351412 (not c!53410)) b!351403))

(assert (= (and b!351405 res!194898) b!351414))

(assert (= (or b!351405 b!351403) bm!27002))

(assert (= (and b!351412 res!194905) b!351421))

(assert (= (and b!351421 c!53409) b!351415))

(assert (= (and b!351421 (not c!53409)) b!351410))

(assert (= (and b!351415 res!194902) b!351420))

(assert (= (or b!351415 b!351410) bm!26996))

(declare-fun b_lambda!8489 () Bool)

(assert (=> (not b_lambda!8489) (not b!351406)))

(declare-fun t!10336 () Bool)

(declare-fun tb!3091 () Bool)

(assert (=> (and start!35054 (= defaultEntry!1528 defaultEntry!1528) t!10336) tb!3091))

(declare-fun result!5619 () Bool)

(assert (=> tb!3091 (= result!5619 tp_is_empty!7687)))

(assert (=> b!351406 t!10336))

(declare-fun b_and!14947 () Bool)

(assert (= b_and!14941 (and (=> t!10336 result!5619) b_and!14947)))

(assert (=> d!71285 m!350689))

(assert (=> b!351418 m!350761))

(assert (=> b!351418 m!350761))

(assert (=> b!351418 m!350765))

(declare-fun m!350787 () Bool)

(assert (=> b!351416 m!350787))

(assert (=> b!351406 m!350761))

(declare-fun m!350789 () Bool)

(assert (=> b!351406 m!350789))

(declare-fun m!350791 () Bool)

(assert (=> b!351406 m!350791))

(assert (=> b!351406 m!350791))

(assert (=> b!351406 m!350789))

(declare-fun m!350793 () Bool)

(assert (=> b!351406 m!350793))

(assert (=> b!351406 m!350761))

(declare-fun m!350795 () Bool)

(assert (=> b!351406 m!350795))

(declare-fun m!350797 () Bool)

(assert (=> b!351414 m!350797))

(declare-fun m!350799 () Bool)

(assert (=> bm!26996 m!350799))

(assert (=> b!351401 m!350761))

(assert (=> b!351401 m!350761))

(declare-fun m!350801 () Bool)

(assert (=> b!351401 m!350801))

(assert (=> b!351417 m!350761))

(assert (=> b!351417 m!350761))

(assert (=> b!351417 m!350765))

(declare-fun m!350803 () Bool)

(assert (=> bm!27001 m!350803))

(declare-fun m!350805 () Bool)

(assert (=> bm!27002 m!350805))

(declare-fun m!350807 () Bool)

(assert (=> bm!27000 m!350807))

(declare-fun m!350809 () Bool)

(assert (=> b!351420 m!350809))

(declare-fun m!350811 () Bool)

(assert (=> b!351404 m!350811))

(declare-fun m!350813 () Bool)

(assert (=> b!351404 m!350813))

(declare-fun m!350815 () Bool)

(assert (=> b!351404 m!350815))

(declare-fun m!350817 () Bool)

(assert (=> b!351404 m!350817))

(assert (=> b!351404 m!350811))

(declare-fun m!350819 () Bool)

(assert (=> b!351404 m!350819))

(declare-fun m!350821 () Bool)

(assert (=> b!351404 m!350821))

(declare-fun m!350823 () Bool)

(assert (=> b!351404 m!350823))

(declare-fun m!350825 () Bool)

(assert (=> b!351404 m!350825))

(assert (=> b!351404 m!350803))

(declare-fun m!350827 () Bool)

(assert (=> b!351404 m!350827))

(assert (=> b!351404 m!350761))

(declare-fun m!350829 () Bool)

(assert (=> b!351404 m!350829))

(assert (=> b!351404 m!350829))

(declare-fun m!350831 () Bool)

(assert (=> b!351404 m!350831))

(assert (=> b!351404 m!350815))

(declare-fun m!350833 () Bool)

(assert (=> b!351404 m!350833))

(declare-fun m!350835 () Bool)

(assert (=> b!351404 m!350835))

(assert (=> b!351404 m!350821))

(declare-fun m!350837 () Bool)

(assert (=> b!351404 m!350837))

(declare-fun m!350839 () Bool)

(assert (=> b!351404 m!350839))

(assert (=> b!351243 d!71285))

(declare-fun b!351432 () Bool)

(declare-fun e!215208 () Bool)

(declare-fun e!215209 () Bool)

(assert (=> b!351432 (= e!215208 e!215209)))

(declare-fun c!53414 () Bool)

(assert (=> b!351432 (= c!53414 (validKeyInArray!0 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351433 () Bool)

(declare-fun e!215207 () Bool)

(declare-fun call!27008 () Bool)

(assert (=> b!351433 (= e!215207 call!27008)))

(declare-fun b!351434 () Bool)

(assert (=> b!351434 (= e!215209 e!215207)))

(declare-fun lt!164716 () (_ BitVec 64))

(assert (=> b!351434 (= lt!164716 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164717 () Unit!10851)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18943 (_ BitVec 64) (_ BitVec 32)) Unit!10851)

(assert (=> b!351434 (= lt!164717 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164716 #b00000000000000000000000000000000))))

(assert (=> b!351434 (arrayContainsKey!0 _keys!1895 lt!164716 #b00000000000000000000000000000000)))

(declare-fun lt!164718 () Unit!10851)

(assert (=> b!351434 (= lt!164718 lt!164717)))

(declare-fun res!194912 () Bool)

(assert (=> b!351434 (= res!194912 (= (seekEntryOrOpen!0 (select (arr!8976 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3457 #b00000000000000000000000000000000)))))

(assert (=> b!351434 (=> (not res!194912) (not e!215207))))

(declare-fun bm!27005 () Bool)

(assert (=> bm!27005 (= call!27008 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!351435 () Bool)

(assert (=> b!351435 (= e!215209 call!27008)))

(declare-fun d!71287 () Bool)

(declare-fun res!194911 () Bool)

(assert (=> d!71287 (=> res!194911 e!215208)))

(assert (=> d!71287 (= res!194911 (bvsge #b00000000000000000000000000000000 (size!9329 _keys!1895)))))

(assert (=> d!71287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215208)))

(assert (= (and d!71287 (not res!194911)) b!351432))

(assert (= (and b!351432 c!53414) b!351434))

(assert (= (and b!351432 (not c!53414)) b!351435))

(assert (= (and b!351434 res!194912) b!351433))

(assert (= (or b!351433 b!351435) bm!27005))

(assert (=> b!351432 m!350761))

(assert (=> b!351432 m!350761))

(assert (=> b!351432 m!350765))

(assert (=> b!351434 m!350761))

(declare-fun m!350841 () Bool)

(assert (=> b!351434 m!350841))

(declare-fun m!350843 () Bool)

(assert (=> b!351434 m!350843))

(assert (=> b!351434 m!350761))

(declare-fun m!350845 () Bool)

(assert (=> b!351434 m!350845))

(declare-fun m!350847 () Bool)

(assert (=> bm!27005 m!350847))

(assert (=> b!351237 d!71287))

(declare-fun b!351448 () Bool)

(declare-fun e!215216 () SeekEntryResult!3457)

(assert (=> b!351448 (= e!215216 Undefined!3457)))

(declare-fun d!71289 () Bool)

(declare-fun lt!164727 () SeekEntryResult!3457)

(assert (=> d!71289 (and (or ((_ is Undefined!3457) lt!164727) (not ((_ is Found!3457) lt!164727)) (and (bvsge (index!16008 lt!164727) #b00000000000000000000000000000000) (bvslt (index!16008 lt!164727) (size!9329 _keys!1895)))) (or ((_ is Undefined!3457) lt!164727) ((_ is Found!3457) lt!164727) (not ((_ is MissingZero!3457) lt!164727)) (and (bvsge (index!16007 lt!164727) #b00000000000000000000000000000000) (bvslt (index!16007 lt!164727) (size!9329 _keys!1895)))) (or ((_ is Undefined!3457) lt!164727) ((_ is Found!3457) lt!164727) ((_ is MissingZero!3457) lt!164727) (not ((_ is MissingVacant!3457) lt!164727)) (and (bvsge (index!16010 lt!164727) #b00000000000000000000000000000000) (bvslt (index!16010 lt!164727) (size!9329 _keys!1895)))) (or ((_ is Undefined!3457) lt!164727) (ite ((_ is Found!3457) lt!164727) (= (select (arr!8976 _keys!1895) (index!16008 lt!164727)) k0!1348) (ite ((_ is MissingZero!3457) lt!164727) (= (select (arr!8976 _keys!1895) (index!16007 lt!164727)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3457) lt!164727) (= (select (arr!8976 _keys!1895) (index!16010 lt!164727)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71289 (= lt!164727 e!215216)))

(declare-fun c!53423 () Bool)

(declare-fun lt!164725 () SeekEntryResult!3457)

(assert (=> d!71289 (= c!53423 (and ((_ is Intermediate!3457) lt!164725) (undefined!4269 lt!164725)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18943 (_ BitVec 32)) SeekEntryResult!3457)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71289 (= lt!164725 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71289 (validMask!0 mask!2385)))

(assert (=> d!71289 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164727)))

(declare-fun b!351449 () Bool)

(declare-fun c!53421 () Bool)

(declare-fun lt!164726 () (_ BitVec 64))

(assert (=> b!351449 (= c!53421 (= lt!164726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!215218 () SeekEntryResult!3457)

(declare-fun e!215217 () SeekEntryResult!3457)

(assert (=> b!351449 (= e!215218 e!215217)))

(declare-fun b!351450 () Bool)

(assert (=> b!351450 (= e!215217 (MissingZero!3457 (index!16009 lt!164725)))))

(declare-fun b!351451 () Bool)

(assert (=> b!351451 (= e!215218 (Found!3457 (index!16009 lt!164725)))))

(declare-fun b!351452 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18943 (_ BitVec 32)) SeekEntryResult!3457)

(assert (=> b!351452 (= e!215217 (seekKeyOrZeroReturnVacant!0 (x!34982 lt!164725) (index!16009 lt!164725) (index!16009 lt!164725) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351453 () Bool)

(assert (=> b!351453 (= e!215216 e!215218)))

(assert (=> b!351453 (= lt!164726 (select (arr!8976 _keys!1895) (index!16009 lt!164725)))))

(declare-fun c!53422 () Bool)

(assert (=> b!351453 (= c!53422 (= lt!164726 k0!1348))))

(assert (= (and d!71289 c!53423) b!351448))

(assert (= (and d!71289 (not c!53423)) b!351453))

(assert (= (and b!351453 c!53422) b!351451))

(assert (= (and b!351453 (not c!53422)) b!351449))

(assert (= (and b!351449 c!53421) b!351450))

(assert (= (and b!351449 (not c!53421)) b!351452))

(assert (=> d!71289 m!350689))

(declare-fun m!350849 () Bool)

(assert (=> d!71289 m!350849))

(declare-fun m!350851 () Bool)

(assert (=> d!71289 m!350851))

(declare-fun m!350853 () Bool)

(assert (=> d!71289 m!350853))

(declare-fun m!350855 () Bool)

(assert (=> d!71289 m!350855))

(assert (=> d!71289 m!350851))

(declare-fun m!350857 () Bool)

(assert (=> d!71289 m!350857))

(declare-fun m!350859 () Bool)

(assert (=> b!351452 m!350859))

(declare-fun m!350861 () Bool)

(assert (=> b!351453 m!350861))

(assert (=> b!351242 d!71289))

(declare-fun b!351460 () Bool)

(declare-fun e!215223 () Bool)

(assert (=> b!351460 (= e!215223 tp_is_empty!7687)))

(declare-fun mapNonEmpty!13014 () Bool)

(declare-fun mapRes!13014 () Bool)

(declare-fun tp!26802 () Bool)

(assert (=> mapNonEmpty!13014 (= mapRes!13014 (and tp!26802 e!215223))))

(declare-fun mapValue!13014 () ValueCell!3500)

(declare-fun mapKey!13014 () (_ BitVec 32))

(declare-fun mapRest!13014 () (Array (_ BitVec 32) ValueCell!3500))

(assert (=> mapNonEmpty!13014 (= mapRest!13005 (store mapRest!13014 mapKey!13014 mapValue!13014))))

(declare-fun condMapEmpty!13014 () Bool)

(declare-fun mapDefault!13014 () ValueCell!3500)

(assert (=> mapNonEmpty!13005 (= condMapEmpty!13014 (= mapRest!13005 ((as const (Array (_ BitVec 32) ValueCell!3500)) mapDefault!13014)))))

(declare-fun e!215224 () Bool)

(assert (=> mapNonEmpty!13005 (= tp!26787 (and e!215224 mapRes!13014))))

(declare-fun b!351461 () Bool)

(assert (=> b!351461 (= e!215224 tp_is_empty!7687)))

(declare-fun mapIsEmpty!13014 () Bool)

(assert (=> mapIsEmpty!13014 mapRes!13014))

(assert (= (and mapNonEmpty!13005 condMapEmpty!13014) mapIsEmpty!13014))

(assert (= (and mapNonEmpty!13005 (not condMapEmpty!13014)) mapNonEmpty!13014))

(assert (= (and mapNonEmpty!13014 ((_ is ValueCellFull!3500) mapValue!13014)) b!351460))

(assert (= (and mapNonEmpty!13005 ((_ is ValueCellFull!3500) mapDefault!13014)) b!351461))

(declare-fun m!350863 () Bool)

(assert (=> mapNonEmpty!13014 m!350863))

(declare-fun b_lambda!8491 () Bool)

(assert (= b_lambda!8489 (or (and start!35054 b_free!7735) b_lambda!8491)))

(check-sat (not b!351414) (not mapNonEmpty!13014) (not bm!26996) (not d!71285) (not bm!27005) (not b!351418) (not b_lambda!8491) (not d!71283) (not b!351434) (not b!351404) (not b!351356) (not b!351326) (not b!351343) (not b!351401) (not b!351406) tp_is_empty!7687 (not bm!26981) b_and!14947 (not b_next!7735) (not bm!27000) (not b!351339) (not b!351452) (not bm!27002) (not b!351417) (not b!351416) (not b!351337) (not bm!27001) (not d!71289) (not b!351432) (not b!351349) (not b!351340) (not b!351420) (not b!351358))
(check-sat b_and!14947 (not b_next!7735))
