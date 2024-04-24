; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19508 () Bool)

(assert start!19508)

(declare-fun b!191562 () Bool)

(declare-fun b_free!4681 () Bool)

(declare-fun b_next!4681 () Bool)

(assert (=> b!191562 (= b_free!4681 (not b_next!4681))))

(declare-fun tp!16893 () Bool)

(declare-fun b_and!11369 () Bool)

(assert (=> b!191562 (= tp!16893 b_and!11369)))

(declare-fun b!191552 () Bool)

(declare-fun e!126047 () Bool)

(declare-fun e!126046 () Bool)

(declare-fun mapRes!7692 () Bool)

(assert (=> b!191552 (= e!126047 (and e!126046 mapRes!7692))))

(declare-fun condMapEmpty!7692 () Bool)

(declare-datatypes ((V!5585 0))(
  ( (V!5586 (val!2271 Int)) )
))
(declare-datatypes ((ValueCell!1883 0))(
  ( (ValueCellFull!1883 (v!4212 V!5585)) (EmptyCell!1883) )
))
(declare-datatypes ((array!8131 0))(
  ( (array!8132 (arr!3830 (Array (_ BitVec 32) (_ BitVec 64))) (size!4152 (_ BitVec 32))) )
))
(declare-datatypes ((array!8133 0))(
  ( (array!8134 (arr!3831 (Array (_ BitVec 32) ValueCell!1883)) (size!4153 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2674 0))(
  ( (LongMapFixedSize!2675 (defaultEntry!3909 Int) (mask!9130 (_ BitVec 32)) (extraKeys!3646 (_ BitVec 32)) (zeroValue!3750 V!5585) (minValue!3750 V!5585) (_size!1386 (_ BitVec 32)) (_keys!5887 array!8131) (_values!3892 array!8133) (_vacant!1386 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2674)

(declare-fun mapDefault!7692 () ValueCell!1883)

(assert (=> b!191552 (= condMapEmpty!7692 (= (arr!3831 (_values!3892 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1883)) mapDefault!7692)))))

(declare-fun b!191553 () Bool)

(declare-fun tp_is_empty!4453 () Bool)

(assert (=> b!191553 (= e!126046 tp_is_empty!4453)))

(declare-fun b!191554 () Bool)

(declare-datatypes ((Unit!5782 0))(
  ( (Unit!5783) )
))
(declare-fun e!126049 () Unit!5782)

(declare-fun lt!95152 () Unit!5782)

(assert (=> b!191554 (= e!126049 lt!95152)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!173 (array!8131 array!8133 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 64) Int) Unit!5782)

(assert (=> b!191554 (= lt!95152 (lemmaInListMapThenSeekEntryOrOpenFindsIt!173 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)))))

(declare-fun res!90528 () Bool)

(declare-datatypes ((SeekEntryResult!667 0))(
  ( (MissingZero!667 (index!4838 (_ BitVec 32))) (Found!667 (index!4839 (_ BitVec 32))) (Intermediate!667 (undefined!1479 Bool) (index!4840 (_ BitVec 32)) (x!20539 (_ BitVec 32))) (Undefined!667) (MissingVacant!667 (index!4841 (_ BitVec 32))) )
))
(declare-fun lt!95147 () SeekEntryResult!667)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191554 (= res!90528 (inRange!0 (index!4839 lt!95147) (mask!9130 thiss!1248)))))

(declare-fun e!126052 () Bool)

(assert (=> b!191554 (=> (not res!90528) (not e!126052))))

(assert (=> b!191554 e!126052))

(declare-fun mapNonEmpty!7692 () Bool)

(declare-fun tp!16892 () Bool)

(declare-fun e!126048 () Bool)

(assert (=> mapNonEmpty!7692 (= mapRes!7692 (and tp!16892 e!126048))))

(declare-fun mapRest!7692 () (Array (_ BitVec 32) ValueCell!1883))

(declare-fun mapValue!7692 () ValueCell!1883)

(declare-fun mapKey!7692 () (_ BitVec 32))

(assert (=> mapNonEmpty!7692 (= (arr!3831 (_values!3892 thiss!1248)) (store mapRest!7692 mapKey!7692 mapValue!7692))))

(declare-fun b!191555 () Bool)

(declare-fun e!126051 () Bool)

(assert (=> b!191555 (= e!126051 (or (not (= (size!4153 (_values!3892 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9130 thiss!1248)))) (not (= (size!4152 (_keys!5887 thiss!1248)) (size!4153 (_values!3892 thiss!1248)))) (bvslt (mask!9130 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3646 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun res!90532 () Bool)

(declare-fun e!126050 () Bool)

(assert (=> start!19508 (=> (not res!90532) (not e!126050))))

(declare-fun valid!1121 (LongMapFixedSize!2674) Bool)

(assert (=> start!19508 (= res!90532 (valid!1121 thiss!1248))))

(assert (=> start!19508 e!126050))

(declare-fun e!126045 () Bool)

(assert (=> start!19508 e!126045))

(assert (=> start!19508 true))

(assert (=> start!19508 tp_is_empty!4453))

(declare-fun b!191556 () Bool)

(declare-fun Unit!5784 () Unit!5782)

(assert (=> b!191556 (= e!126049 Unit!5784)))

(declare-fun lt!95149 () Unit!5782)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!170 (array!8131 array!8133 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 64) Int) Unit!5782)

(assert (=> b!191556 (= lt!95149 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!170 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)))))

(assert (=> b!191556 false))

(declare-fun b!191557 () Bool)

(declare-fun e!126054 () Bool)

(assert (=> b!191557 (= e!126050 e!126054)))

(declare-fun res!90529 () Bool)

(assert (=> b!191557 (=> (not res!90529) (not e!126054))))

(get-info :version)

(assert (=> b!191557 (= res!90529 (and (not ((_ is Undefined!667) lt!95147)) (not ((_ is MissingVacant!667) lt!95147)) (not ((_ is MissingZero!667) lt!95147)) ((_ is Found!667) lt!95147)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8131 (_ BitVec 32)) SeekEntryResult!667)

(assert (=> b!191557 (= lt!95147 (seekEntryOrOpen!0 key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(declare-fun b!191558 () Bool)

(assert (=> b!191558 (= e!126048 tp_is_empty!4453)))

(declare-fun b!191559 () Bool)

(assert (=> b!191559 (= e!126052 (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4839 lt!95147)) key!828))))

(declare-fun b!191560 () Bool)

(assert (=> b!191560 (= e!126054 (not e!126051))))

(declare-fun res!90530 () Bool)

(assert (=> b!191560 (=> res!90530 e!126051)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!191560 (= res!90530 (not (validMask!0 (mask!9130 thiss!1248))))))

(declare-datatypes ((tuple2!3476 0))(
  ( (tuple2!3477 (_1!1749 (_ BitVec 64)) (_2!1749 V!5585)) )
))
(declare-datatypes ((List!2387 0))(
  ( (Nil!2384) (Cons!2383 (h!3022 tuple2!3476) (t!7293 List!2387)) )
))
(declare-datatypes ((ListLongMap!2397 0))(
  ( (ListLongMap!2398 (toList!1214 List!2387)) )
))
(declare-fun lt!95148 () ListLongMap!2397)

(declare-fun v!309 () V!5585)

(declare-fun +!307 (ListLongMap!2397 tuple2!3476) ListLongMap!2397)

(declare-fun getCurrentListMap!866 (array!8131 array!8133 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 32) Int) ListLongMap!2397)

(assert (=> b!191560 (= (+!307 lt!95148 (tuple2!3477 key!828 v!309)) (getCurrentListMap!866 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95150 () Unit!5782)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!111 (array!8131 array!8133 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 32) (_ BitVec 64) V!5585 Int) Unit!5782)

(assert (=> b!191560 (= lt!95150 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!111 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (index!4839 lt!95147) key!828 v!309 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95151 () Unit!5782)

(assert (=> b!191560 (= lt!95151 e!126049)))

(declare-fun c!34491 () Bool)

(declare-fun contains!1340 (ListLongMap!2397 (_ BitVec 64)) Bool)

(assert (=> b!191560 (= c!34491 (contains!1340 lt!95148 key!828))))

(assert (=> b!191560 (= lt!95148 (getCurrentListMap!866 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun mapIsEmpty!7692 () Bool)

(assert (=> mapIsEmpty!7692 mapRes!7692))

(declare-fun b!191561 () Bool)

(declare-fun res!90531 () Bool)

(assert (=> b!191561 (=> (not res!90531) (not e!126050))))

(assert (=> b!191561 (= res!90531 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2467 (array!8131) Bool)

(declare-fun array_inv!2468 (array!8133) Bool)

(assert (=> b!191562 (= e!126045 (and tp!16893 tp_is_empty!4453 (array_inv!2467 (_keys!5887 thiss!1248)) (array_inv!2468 (_values!3892 thiss!1248)) e!126047))))

(assert (= (and start!19508 res!90532) b!191561))

(assert (= (and b!191561 res!90531) b!191557))

(assert (= (and b!191557 res!90529) b!191560))

(assert (= (and b!191560 c!34491) b!191554))

(assert (= (and b!191560 (not c!34491)) b!191556))

(assert (= (and b!191554 res!90528) b!191559))

(assert (= (and b!191560 (not res!90530)) b!191555))

(assert (= (and b!191552 condMapEmpty!7692) mapIsEmpty!7692))

(assert (= (and b!191552 (not condMapEmpty!7692)) mapNonEmpty!7692))

(assert (= (and mapNonEmpty!7692 ((_ is ValueCellFull!1883) mapValue!7692)) b!191558))

(assert (= (and b!191552 ((_ is ValueCellFull!1883) mapDefault!7692)) b!191553))

(assert (= b!191562 b!191552))

(assert (= start!19508 b!191562))

(declare-fun m!218269 () Bool)

(assert (=> b!191560 m!218269))

(declare-fun m!218271 () Bool)

(assert (=> b!191560 m!218271))

(declare-fun m!218273 () Bool)

(assert (=> b!191560 m!218273))

(declare-fun m!218275 () Bool)

(assert (=> b!191560 m!218275))

(declare-fun m!218277 () Bool)

(assert (=> b!191560 m!218277))

(declare-fun m!218279 () Bool)

(assert (=> b!191560 m!218279))

(declare-fun m!218281 () Bool)

(assert (=> b!191560 m!218281))

(declare-fun m!218283 () Bool)

(assert (=> b!191556 m!218283))

(declare-fun m!218285 () Bool)

(assert (=> b!191562 m!218285))

(declare-fun m!218287 () Bool)

(assert (=> b!191562 m!218287))

(declare-fun m!218289 () Bool)

(assert (=> b!191557 m!218289))

(declare-fun m!218291 () Bool)

(assert (=> start!19508 m!218291))

(declare-fun m!218293 () Bool)

(assert (=> b!191554 m!218293))

(declare-fun m!218295 () Bool)

(assert (=> b!191554 m!218295))

(declare-fun m!218297 () Bool)

(assert (=> b!191559 m!218297))

(declare-fun m!218299 () Bool)

(assert (=> mapNonEmpty!7692 m!218299))

(check-sat (not b!191554) (not b!191556) (not b!191560) b_and!11369 (not b!191557) tp_is_empty!4453 (not start!19508) (not b!191562) (not mapNonEmpty!7692) (not b_next!4681))
(check-sat b_and!11369 (not b_next!4681))
(get-model)

(declare-fun d!56229 () Bool)

(declare-fun e!126117 () Bool)

(assert (=> d!56229 e!126117))

(declare-fun res!90568 () Bool)

(assert (=> d!56229 (=> (not res!90568) (not e!126117))))

(declare-fun lt!95199 () ListLongMap!2397)

(assert (=> d!56229 (= res!90568 (contains!1340 lt!95199 (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun lt!95200 () List!2387)

(assert (=> d!56229 (= lt!95199 (ListLongMap!2398 lt!95200))))

(declare-fun lt!95197 () Unit!5782)

(declare-fun lt!95198 () Unit!5782)

(assert (=> d!56229 (= lt!95197 lt!95198)))

(declare-datatypes ((Option!246 0))(
  ( (Some!245 (v!4217 V!5585)) (None!244) )
))
(declare-fun getValueByKey!240 (List!2387 (_ BitVec 64)) Option!246)

(assert (=> d!56229 (= (getValueByKey!240 lt!95200 (_1!1749 (tuple2!3477 key!828 v!309))) (Some!245 (_2!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!127 (List!2387 (_ BitVec 64) V!5585) Unit!5782)

(assert (=> d!56229 (= lt!95198 (lemmaContainsTupThenGetReturnValue!127 lt!95200 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun insertStrictlySorted!130 (List!2387 (_ BitVec 64) V!5585) List!2387)

(assert (=> d!56229 (= lt!95200 (insertStrictlySorted!130 (toList!1214 lt!95148) (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> d!56229 (= (+!307 lt!95148 (tuple2!3477 key!828 v!309)) lt!95199)))

(declare-fun b!191633 () Bool)

(declare-fun res!90567 () Bool)

(assert (=> b!191633 (=> (not res!90567) (not e!126117))))

(assert (=> b!191633 (= res!90567 (= (getValueByKey!240 (toList!1214 lt!95199) (_1!1749 (tuple2!3477 key!828 v!309))) (Some!245 (_2!1749 (tuple2!3477 key!828 v!309)))))))

(declare-fun b!191634 () Bool)

(declare-fun contains!1341 (List!2387 tuple2!3476) Bool)

(assert (=> b!191634 (= e!126117 (contains!1341 (toList!1214 lt!95199) (tuple2!3477 key!828 v!309)))))

(assert (= (and d!56229 res!90568) b!191633))

(assert (= (and b!191633 res!90567) b!191634))

(declare-fun m!218365 () Bool)

(assert (=> d!56229 m!218365))

(declare-fun m!218367 () Bool)

(assert (=> d!56229 m!218367))

(declare-fun m!218369 () Bool)

(assert (=> d!56229 m!218369))

(declare-fun m!218371 () Bool)

(assert (=> d!56229 m!218371))

(declare-fun m!218373 () Bool)

(assert (=> b!191633 m!218373))

(declare-fun m!218375 () Bool)

(assert (=> b!191634 m!218375))

(assert (=> b!191560 d!56229))

(declare-fun bm!19328 () Bool)

(declare-fun call!19335 () ListLongMap!2397)

(declare-fun call!19336 () ListLongMap!2397)

(assert (=> bm!19328 (= call!19335 call!19336)))

(declare-fun b!191677 () Bool)

(declare-fun e!126155 () Bool)

(declare-fun call!19337 () Bool)

(assert (=> b!191677 (= e!126155 (not call!19337))))

(declare-fun b!191678 () Bool)

(declare-fun e!126146 () Unit!5782)

(declare-fun lt!95264 () Unit!5782)

(assert (=> b!191678 (= e!126146 lt!95264)))

(declare-fun lt!95252 () ListLongMap!2397)

(declare-fun getCurrentListMapNoExtraKeys!213 (array!8131 array!8133 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 32) Int) ListLongMap!2397)

(assert (=> b!191678 (= lt!95252 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95262 () (_ BitVec 64))

(assert (=> b!191678 (= lt!95262 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95249 () (_ BitVec 64))

(assert (=> b!191678 (= lt!95249 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95260 () Unit!5782)

(declare-fun addStillContains!158 (ListLongMap!2397 (_ BitVec 64) V!5585 (_ BitVec 64)) Unit!5782)

(assert (=> b!191678 (= lt!95260 (addStillContains!158 lt!95252 lt!95262 (zeroValue!3750 thiss!1248) lt!95249))))

(assert (=> b!191678 (contains!1340 (+!307 lt!95252 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248))) lt!95249)))

(declare-fun lt!95251 () Unit!5782)

(assert (=> b!191678 (= lt!95251 lt!95260)))

(declare-fun lt!95245 () ListLongMap!2397)

(assert (=> b!191678 (= lt!95245 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95247 () (_ BitVec 64))

(assert (=> b!191678 (= lt!95247 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95248 () (_ BitVec 64))

(assert (=> b!191678 (= lt!95248 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95259 () Unit!5782)

(declare-fun addApplyDifferent!158 (ListLongMap!2397 (_ BitVec 64) V!5585 (_ BitVec 64)) Unit!5782)

(assert (=> b!191678 (= lt!95259 (addApplyDifferent!158 lt!95245 lt!95247 (minValue!3750 thiss!1248) lt!95248))))

(declare-fun apply!182 (ListLongMap!2397 (_ BitVec 64)) V!5585)

(assert (=> b!191678 (= (apply!182 (+!307 lt!95245 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248))) lt!95248) (apply!182 lt!95245 lt!95248))))

(declare-fun lt!95263 () Unit!5782)

(assert (=> b!191678 (= lt!95263 lt!95259)))

(declare-fun lt!95256 () ListLongMap!2397)

(assert (=> b!191678 (= lt!95256 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95258 () (_ BitVec 64))

(assert (=> b!191678 (= lt!95258 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95265 () (_ BitVec 64))

(assert (=> b!191678 (= lt!95265 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95261 () Unit!5782)

(assert (=> b!191678 (= lt!95261 (addApplyDifferent!158 lt!95256 lt!95258 (zeroValue!3750 thiss!1248) lt!95265))))

(assert (=> b!191678 (= (apply!182 (+!307 lt!95256 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248))) lt!95265) (apply!182 lt!95256 lt!95265))))

(declare-fun lt!95253 () Unit!5782)

(assert (=> b!191678 (= lt!95253 lt!95261)))

(declare-fun lt!95246 () ListLongMap!2397)

(assert (=> b!191678 (= lt!95246 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95250 () (_ BitVec 64))

(assert (=> b!191678 (= lt!95250 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95257 () (_ BitVec 64))

(assert (=> b!191678 (= lt!95257 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191678 (= lt!95264 (addApplyDifferent!158 lt!95246 lt!95250 (minValue!3750 thiss!1248) lt!95257))))

(assert (=> b!191678 (= (apply!182 (+!307 lt!95246 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248))) lt!95257) (apply!182 lt!95246 lt!95257))))

(declare-fun b!191679 () Bool)

(declare-fun e!126149 () Bool)

(declare-fun lt!95254 () ListLongMap!2397)

(assert (=> b!191679 (= e!126149 (= (apply!182 lt!95254 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3750 thiss!1248)))))

(declare-fun b!191680 () Bool)

(declare-fun e!126152 () ListLongMap!2397)

(declare-fun call!19334 () ListLongMap!2397)

(assert (=> b!191680 (= e!126152 call!19334)))

(declare-fun bm!19329 () Bool)

(declare-fun call!19332 () ListLongMap!2397)

(assert (=> bm!19329 (= call!19336 call!19332)))

(declare-fun b!191681 () Bool)

(assert (=> b!191681 (= e!126152 call!19335)))

(declare-fun b!191682 () Bool)

(declare-fun e!126147 () ListLongMap!2397)

(declare-fun e!126154 () ListLongMap!2397)

(assert (=> b!191682 (= e!126147 e!126154)))

(declare-fun c!34515 () Bool)

(assert (=> b!191682 (= c!34515 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19330 () Bool)

(declare-fun call!19333 () ListLongMap!2397)

(assert (=> bm!19330 (= call!19334 call!19333)))

(declare-fun b!191683 () Bool)

(declare-fun e!126153 () Bool)

(declare-fun call!19331 () Bool)

(assert (=> b!191683 (= e!126153 (not call!19331))))

(declare-fun b!191684 () Bool)

(assert (=> b!191684 (= e!126154 call!19334)))

(declare-fun c!34511 () Bool)

(declare-fun bm!19331 () Bool)

(assert (=> bm!19331 (= call!19333 (+!307 (ite c!34511 call!19332 (ite c!34515 call!19336 call!19335)) (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(declare-fun b!191685 () Bool)

(declare-fun e!126150 () Bool)

(declare-fun get!2219 (ValueCell!1883 V!5585) V!5585)

(declare-fun dynLambda!525 (Int (_ BitVec 64)) V!5585)

(assert (=> b!191685 (= e!126150 (= (apply!182 lt!95254 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)) (get!2219 (select (arr!3831 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191685 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4153 (_values!3892 thiss!1248))))))

(assert (=> b!191685 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!191686 () Bool)

(assert (=> b!191686 (= e!126153 e!126149)))

(declare-fun res!90587 () Bool)

(assert (=> b!191686 (= res!90587 call!19331)))

(assert (=> b!191686 (=> (not res!90587) (not e!126149))))

(declare-fun b!191688 () Bool)

(declare-fun c!34514 () Bool)

(assert (=> b!191688 (= c!34514 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!191688 (= e!126154 e!126152)))

(declare-fun b!191689 () Bool)

(declare-fun e!126145 () Bool)

(assert (=> b!191689 (= e!126145 e!126150)))

(declare-fun res!90589 () Bool)

(assert (=> b!191689 (=> (not res!90589) (not e!126150))))

(assert (=> b!191689 (= res!90589 (contains!1340 lt!95254 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!191690 () Bool)

(declare-fun res!90590 () Bool)

(declare-fun e!126144 () Bool)

(assert (=> b!191690 (=> (not res!90590) (not e!126144))))

(assert (=> b!191690 (= res!90590 e!126145)))

(declare-fun res!90592 () Bool)

(assert (=> b!191690 (=> res!90592 e!126145)))

(declare-fun e!126156 () Bool)

(assert (=> b!191690 (= res!90592 (not e!126156))))

(declare-fun res!90594 () Bool)

(assert (=> b!191690 (=> (not res!90594) (not e!126156))))

(assert (=> b!191690 (= res!90594 (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!191691 () Bool)

(assert (=> b!191691 (= e!126144 e!126153)))

(declare-fun c!34510 () Bool)

(assert (=> b!191691 (= c!34510 (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!191692 () Bool)

(declare-fun e!126148 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!191692 (= e!126148 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19332 () Bool)

(assert (=> bm!19332 (= call!19331 (contains!1340 lt!95254 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191693 () Bool)

(declare-fun e!126151 () Bool)

(assert (=> b!191693 (= e!126151 (= (apply!182 lt!95254 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3750 thiss!1248)))))

(declare-fun b!191694 () Bool)

(assert (=> b!191694 (= e!126147 (+!307 call!19333 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))

(declare-fun b!191695 () Bool)

(assert (=> b!191695 (= e!126155 e!126151)))

(declare-fun res!90588 () Bool)

(assert (=> b!191695 (= res!90588 call!19337)))

(assert (=> b!191695 (=> (not res!90588) (not e!126151))))

(declare-fun bm!19333 () Bool)

(assert (=> bm!19333 (= call!19332 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun bm!19334 () Bool)

(assert (=> bm!19334 (= call!19337 (contains!1340 lt!95254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191696 () Bool)

(declare-fun res!90593 () Bool)

(assert (=> b!191696 (=> (not res!90593) (not e!126144))))

(assert (=> b!191696 (= res!90593 e!126155)))

(declare-fun c!34513 () Bool)

(assert (=> b!191696 (= c!34513 (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!191697 () Bool)

(assert (=> b!191697 (= e!126156 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56231 () Bool)

(assert (=> d!56231 e!126144))

(declare-fun res!90591 () Bool)

(assert (=> d!56231 (=> (not res!90591) (not e!126144))))

(assert (=> d!56231 (= res!90591 (or (bvsge #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))))

(declare-fun lt!95255 () ListLongMap!2397)

(assert (=> d!56231 (= lt!95254 lt!95255)))

(declare-fun lt!95266 () Unit!5782)

(assert (=> d!56231 (= lt!95266 e!126146)))

(declare-fun c!34512 () Bool)

(assert (=> d!56231 (= c!34512 e!126148)))

(declare-fun res!90595 () Bool)

(assert (=> d!56231 (=> (not res!90595) (not e!126148))))

(assert (=> d!56231 (= res!90595 (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> d!56231 (= lt!95255 e!126147)))

(assert (=> d!56231 (= c!34511 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56231 (validMask!0 (mask!9130 thiss!1248))))

(assert (=> d!56231 (= (getCurrentListMap!866 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) lt!95254)))

(declare-fun b!191687 () Bool)

(declare-fun Unit!5785 () Unit!5782)

(assert (=> b!191687 (= e!126146 Unit!5785)))

(assert (= (and d!56231 c!34511) b!191694))

(assert (= (and d!56231 (not c!34511)) b!191682))

(assert (= (and b!191682 c!34515) b!191684))

(assert (= (and b!191682 (not c!34515)) b!191688))

(assert (= (and b!191688 c!34514) b!191680))

(assert (= (and b!191688 (not c!34514)) b!191681))

(assert (= (or b!191680 b!191681) bm!19328))

(assert (= (or b!191684 bm!19328) bm!19329))

(assert (= (or b!191684 b!191680) bm!19330))

(assert (= (or b!191694 bm!19329) bm!19333))

(assert (= (or b!191694 bm!19330) bm!19331))

(assert (= (and d!56231 res!90595) b!191692))

(assert (= (and d!56231 c!34512) b!191678))

(assert (= (and d!56231 (not c!34512)) b!191687))

(assert (= (and d!56231 res!90591) b!191690))

(assert (= (and b!191690 res!90594) b!191697))

(assert (= (and b!191690 (not res!90592)) b!191689))

(assert (= (and b!191689 res!90589) b!191685))

(assert (= (and b!191690 res!90590) b!191696))

(assert (= (and b!191696 c!34513) b!191695))

(assert (= (and b!191696 (not c!34513)) b!191677))

(assert (= (and b!191695 res!90588) b!191693))

(assert (= (or b!191695 b!191677) bm!19334))

(assert (= (and b!191696 res!90593) b!191691))

(assert (= (and b!191691 c!34510) b!191686))

(assert (= (and b!191691 (not c!34510)) b!191683))

(assert (= (and b!191686 res!90587) b!191679))

(assert (= (or b!191686 b!191683) bm!19332))

(declare-fun b_lambda!7421 () Bool)

(assert (=> (not b_lambda!7421) (not b!191685)))

(declare-fun t!7295 () Bool)

(declare-fun tb!2867 () Bool)

(assert (=> (and b!191562 (= (defaultEntry!3909 thiss!1248) (defaultEntry!3909 thiss!1248)) t!7295) tb!2867))

(declare-fun result!4895 () Bool)

(assert (=> tb!2867 (= result!4895 tp_is_empty!4453)))

(assert (=> b!191685 t!7295))

(declare-fun b_and!11375 () Bool)

(assert (= b_and!11369 (and (=> t!7295 result!4895) b_and!11375)))

(declare-fun m!218377 () Bool)

(assert (=> bm!19332 m!218377))

(declare-fun m!218379 () Bool)

(assert (=> b!191694 m!218379))

(declare-fun m!218381 () Bool)

(assert (=> b!191678 m!218381))

(declare-fun m!218383 () Bool)

(assert (=> b!191678 m!218383))

(declare-fun m!218385 () Bool)

(assert (=> b!191678 m!218385))

(assert (=> b!191678 m!218385))

(declare-fun m!218387 () Bool)

(assert (=> b!191678 m!218387))

(declare-fun m!218389 () Bool)

(assert (=> b!191678 m!218389))

(declare-fun m!218391 () Bool)

(assert (=> b!191678 m!218391))

(declare-fun m!218393 () Bool)

(assert (=> b!191678 m!218393))

(declare-fun m!218395 () Bool)

(assert (=> b!191678 m!218395))

(declare-fun m!218397 () Bool)

(assert (=> b!191678 m!218397))

(declare-fun m!218399 () Bool)

(assert (=> b!191678 m!218399))

(declare-fun m!218401 () Bool)

(assert (=> b!191678 m!218401))

(assert (=> b!191678 m!218381))

(declare-fun m!218403 () Bool)

(assert (=> b!191678 m!218403))

(assert (=> b!191678 m!218393))

(declare-fun m!218405 () Bool)

(assert (=> b!191678 m!218405))

(declare-fun m!218407 () Bool)

(assert (=> b!191678 m!218407))

(declare-fun m!218409 () Bool)

(assert (=> b!191678 m!218409))

(assert (=> b!191678 m!218407))

(declare-fun m!218411 () Bool)

(assert (=> b!191678 m!218411))

(declare-fun m!218413 () Bool)

(assert (=> b!191678 m!218413))

(declare-fun m!218415 () Bool)

(assert (=> bm!19331 m!218415))

(assert (=> d!56231 m!218281))

(assert (=> b!191697 m!218399))

(assert (=> b!191697 m!218399))

(declare-fun m!218417 () Bool)

(assert (=> b!191697 m!218417))

(declare-fun m!218419 () Bool)

(assert (=> bm!19334 m!218419))

(assert (=> b!191689 m!218399))

(assert (=> b!191689 m!218399))

(declare-fun m!218421 () Bool)

(assert (=> b!191689 m!218421))

(assert (=> b!191692 m!218399))

(assert (=> b!191692 m!218399))

(assert (=> b!191692 m!218417))

(assert (=> bm!19333 m!218411))

(declare-fun m!218423 () Bool)

(assert (=> b!191679 m!218423))

(declare-fun m!218425 () Bool)

(assert (=> b!191685 m!218425))

(declare-fun m!218427 () Bool)

(assert (=> b!191685 m!218427))

(declare-fun m!218429 () Bool)

(assert (=> b!191685 m!218429))

(assert (=> b!191685 m!218399))

(declare-fun m!218431 () Bool)

(assert (=> b!191685 m!218431))

(assert (=> b!191685 m!218425))

(assert (=> b!191685 m!218427))

(assert (=> b!191685 m!218399))

(declare-fun m!218433 () Bool)

(assert (=> b!191693 m!218433))

(assert (=> b!191560 d!56231))

(declare-fun d!56233 () Bool)

(declare-fun e!126162 () Bool)

(assert (=> d!56233 e!126162))

(declare-fun res!90598 () Bool)

(assert (=> d!56233 (=> res!90598 e!126162)))

(declare-fun lt!95276 () Bool)

(assert (=> d!56233 (= res!90598 (not lt!95276))))

(declare-fun lt!95278 () Bool)

(assert (=> d!56233 (= lt!95276 lt!95278)))

(declare-fun lt!95275 () Unit!5782)

(declare-fun e!126161 () Unit!5782)

(assert (=> d!56233 (= lt!95275 e!126161)))

(declare-fun c!34518 () Bool)

(assert (=> d!56233 (= c!34518 lt!95278)))

(declare-fun containsKey!243 (List!2387 (_ BitVec 64)) Bool)

(assert (=> d!56233 (= lt!95278 (containsKey!243 (toList!1214 lt!95148) key!828))))

(assert (=> d!56233 (= (contains!1340 lt!95148 key!828) lt!95276)))

(declare-fun b!191706 () Bool)

(declare-fun lt!95277 () Unit!5782)

(assert (=> b!191706 (= e!126161 lt!95277)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!191 (List!2387 (_ BitVec 64)) Unit!5782)

(assert (=> b!191706 (= lt!95277 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 lt!95148) key!828))))

(declare-fun isDefined!192 (Option!246) Bool)

(assert (=> b!191706 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95148) key!828))))

(declare-fun b!191707 () Bool)

(declare-fun Unit!5786 () Unit!5782)

(assert (=> b!191707 (= e!126161 Unit!5786)))

(declare-fun b!191708 () Bool)

(assert (=> b!191708 (= e!126162 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95148) key!828)))))

(assert (= (and d!56233 c!34518) b!191706))

(assert (= (and d!56233 (not c!34518)) b!191707))

(assert (= (and d!56233 (not res!90598)) b!191708))

(declare-fun m!218435 () Bool)

(assert (=> d!56233 m!218435))

(declare-fun m!218437 () Bool)

(assert (=> b!191706 m!218437))

(declare-fun m!218439 () Bool)

(assert (=> b!191706 m!218439))

(assert (=> b!191706 m!218439))

(declare-fun m!218441 () Bool)

(assert (=> b!191706 m!218441))

(assert (=> b!191708 m!218439))

(assert (=> b!191708 m!218439))

(assert (=> b!191708 m!218441))

(assert (=> b!191560 d!56233))

(declare-fun bm!19335 () Bool)

(declare-fun call!19342 () ListLongMap!2397)

(declare-fun call!19343 () ListLongMap!2397)

(assert (=> bm!19335 (= call!19342 call!19343)))

(declare-fun b!191709 () Bool)

(declare-fun e!126174 () Bool)

(declare-fun call!19344 () Bool)

(assert (=> b!191709 (= e!126174 (not call!19344))))

(declare-fun b!191710 () Bool)

(declare-fun e!126165 () Unit!5782)

(declare-fun lt!95298 () Unit!5782)

(assert (=> b!191710 (= e!126165 lt!95298)))

(declare-fun lt!95286 () ListLongMap!2397)

(assert (=> b!191710 (= lt!95286 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95296 () (_ BitVec 64))

(assert (=> b!191710 (= lt!95296 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95283 () (_ BitVec 64))

(assert (=> b!191710 (= lt!95283 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95294 () Unit!5782)

(assert (=> b!191710 (= lt!95294 (addStillContains!158 lt!95286 lt!95296 (zeroValue!3750 thiss!1248) lt!95283))))

(assert (=> b!191710 (contains!1340 (+!307 lt!95286 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248))) lt!95283)))

(declare-fun lt!95285 () Unit!5782)

(assert (=> b!191710 (= lt!95285 lt!95294)))

(declare-fun lt!95279 () ListLongMap!2397)

(assert (=> b!191710 (= lt!95279 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95281 () (_ BitVec 64))

(assert (=> b!191710 (= lt!95281 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95282 () (_ BitVec 64))

(assert (=> b!191710 (= lt!95282 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95293 () Unit!5782)

(assert (=> b!191710 (= lt!95293 (addApplyDifferent!158 lt!95279 lt!95281 (minValue!3750 thiss!1248) lt!95282))))

(assert (=> b!191710 (= (apply!182 (+!307 lt!95279 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248))) lt!95282) (apply!182 lt!95279 lt!95282))))

(declare-fun lt!95297 () Unit!5782)

(assert (=> b!191710 (= lt!95297 lt!95293)))

(declare-fun lt!95290 () ListLongMap!2397)

(assert (=> b!191710 (= lt!95290 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95292 () (_ BitVec 64))

(assert (=> b!191710 (= lt!95292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95299 () (_ BitVec 64))

(assert (=> b!191710 (= lt!95299 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95295 () Unit!5782)

(assert (=> b!191710 (= lt!95295 (addApplyDifferent!158 lt!95290 lt!95292 (zeroValue!3750 thiss!1248) lt!95299))))

(assert (=> b!191710 (= (apply!182 (+!307 lt!95290 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248))) lt!95299) (apply!182 lt!95290 lt!95299))))

(declare-fun lt!95287 () Unit!5782)

(assert (=> b!191710 (= lt!95287 lt!95295)))

(declare-fun lt!95280 () ListLongMap!2397)

(assert (=> b!191710 (= lt!95280 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun lt!95284 () (_ BitVec 64))

(assert (=> b!191710 (= lt!95284 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!95291 () (_ BitVec 64))

(assert (=> b!191710 (= lt!95291 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191710 (= lt!95298 (addApplyDifferent!158 lt!95280 lt!95284 (minValue!3750 thiss!1248) lt!95291))))

(assert (=> b!191710 (= (apply!182 (+!307 lt!95280 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248))) lt!95291) (apply!182 lt!95280 lt!95291))))

(declare-fun b!191711 () Bool)

(declare-fun e!126168 () Bool)

(declare-fun lt!95288 () ListLongMap!2397)

(assert (=> b!191711 (= e!126168 (= (apply!182 lt!95288 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3750 thiss!1248)))))

(declare-fun b!191712 () Bool)

(declare-fun e!126171 () ListLongMap!2397)

(declare-fun call!19341 () ListLongMap!2397)

(assert (=> b!191712 (= e!126171 call!19341)))

(declare-fun bm!19336 () Bool)

(declare-fun call!19339 () ListLongMap!2397)

(assert (=> bm!19336 (= call!19343 call!19339)))

(declare-fun b!191713 () Bool)

(assert (=> b!191713 (= e!126171 call!19342)))

(declare-fun b!191714 () Bool)

(declare-fun e!126166 () ListLongMap!2397)

(declare-fun e!126173 () ListLongMap!2397)

(assert (=> b!191714 (= e!126166 e!126173)))

(declare-fun c!34524 () Bool)

(assert (=> b!191714 (= c!34524 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!19337 () Bool)

(declare-fun call!19340 () ListLongMap!2397)

(assert (=> bm!19337 (= call!19341 call!19340)))

(declare-fun b!191715 () Bool)

(declare-fun e!126172 () Bool)

(declare-fun call!19338 () Bool)

(assert (=> b!191715 (= e!126172 (not call!19338))))

(declare-fun b!191716 () Bool)

(assert (=> b!191716 (= e!126173 call!19341)))

(declare-fun bm!19338 () Bool)

(declare-fun c!34520 () Bool)

(assert (=> bm!19338 (= call!19340 (+!307 (ite c!34520 call!19339 (ite c!34524 call!19343 call!19342)) (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(declare-fun b!191717 () Bool)

(declare-fun e!126169 () Bool)

(assert (=> b!191717 (= e!126169 (= (apply!182 lt!95288 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)) (get!2219 (select (arr!3831 (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4153 (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))))))))

(assert (=> b!191717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!191718 () Bool)

(assert (=> b!191718 (= e!126172 e!126168)))

(declare-fun res!90599 () Bool)

(assert (=> b!191718 (= res!90599 call!19338)))

(assert (=> b!191718 (=> (not res!90599) (not e!126168))))

(declare-fun b!191720 () Bool)

(declare-fun c!34523 () Bool)

(assert (=> b!191720 (= c!34523 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!191720 (= e!126173 e!126171)))

(declare-fun b!191721 () Bool)

(declare-fun e!126164 () Bool)

(assert (=> b!191721 (= e!126164 e!126169)))

(declare-fun res!90601 () Bool)

(assert (=> b!191721 (=> (not res!90601) (not e!126169))))

(assert (=> b!191721 (= res!90601 (contains!1340 lt!95288 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!191722 () Bool)

(declare-fun res!90602 () Bool)

(declare-fun e!126163 () Bool)

(assert (=> b!191722 (=> (not res!90602) (not e!126163))))

(assert (=> b!191722 (= res!90602 e!126164)))

(declare-fun res!90604 () Bool)

(assert (=> b!191722 (=> res!90604 e!126164)))

(declare-fun e!126175 () Bool)

(assert (=> b!191722 (= res!90604 (not e!126175))))

(declare-fun res!90606 () Bool)

(assert (=> b!191722 (=> (not res!90606) (not e!126175))))

(assert (=> b!191722 (= res!90606 (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!191723 () Bool)

(assert (=> b!191723 (= e!126163 e!126172)))

(declare-fun c!34519 () Bool)

(assert (=> b!191723 (= c!34519 (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!191724 () Bool)

(declare-fun e!126167 () Bool)

(assert (=> b!191724 (= e!126167 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19339 () Bool)

(assert (=> bm!19339 (= call!19338 (contains!1340 lt!95288 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191725 () Bool)

(declare-fun e!126170 () Bool)

(assert (=> b!191725 (= e!126170 (= (apply!182 lt!95288 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3750 thiss!1248)))))

(declare-fun b!191726 () Bool)

(assert (=> b!191726 (= e!126166 (+!307 call!19340 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))

(declare-fun b!191727 () Bool)

(assert (=> b!191727 (= e!126174 e!126170)))

(declare-fun res!90600 () Bool)

(assert (=> b!191727 (= res!90600 call!19344)))

(assert (=> b!191727 (=> (not res!90600) (not e!126170))))

(declare-fun bm!19340 () Bool)

(assert (=> bm!19340 (= call!19339 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(declare-fun bm!19341 () Bool)

(assert (=> bm!19341 (= call!19344 (contains!1340 lt!95288 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191728 () Bool)

(declare-fun res!90605 () Bool)

(assert (=> b!191728 (=> (not res!90605) (not e!126163))))

(assert (=> b!191728 (= res!90605 e!126174)))

(declare-fun c!34522 () Bool)

(assert (=> b!191728 (= c!34522 (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!191729 () Bool)

(assert (=> b!191729 (= e!126175 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56235 () Bool)

(assert (=> d!56235 e!126163))

(declare-fun res!90603 () Bool)

(assert (=> d!56235 (=> (not res!90603) (not e!126163))))

(assert (=> d!56235 (= res!90603 (or (bvsge #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))))

(declare-fun lt!95289 () ListLongMap!2397)

(assert (=> d!56235 (= lt!95288 lt!95289)))

(declare-fun lt!95300 () Unit!5782)

(assert (=> d!56235 (= lt!95300 e!126165)))

(declare-fun c!34521 () Bool)

(assert (=> d!56235 (= c!34521 e!126167)))

(declare-fun res!90607 () Bool)

(assert (=> d!56235 (=> (not res!90607) (not e!126167))))

(assert (=> d!56235 (= res!90607 (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> d!56235 (= lt!95289 e!126166)))

(assert (=> d!56235 (= c!34520 (and (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3646 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56235 (validMask!0 (mask!9130 thiss!1248))))

(assert (=> d!56235 (= (getCurrentListMap!866 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) lt!95288)))

(declare-fun b!191719 () Bool)

(declare-fun Unit!5787 () Unit!5782)

(assert (=> b!191719 (= e!126165 Unit!5787)))

(assert (= (and d!56235 c!34520) b!191726))

(assert (= (and d!56235 (not c!34520)) b!191714))

(assert (= (and b!191714 c!34524) b!191716))

(assert (= (and b!191714 (not c!34524)) b!191720))

(assert (= (and b!191720 c!34523) b!191712))

(assert (= (and b!191720 (not c!34523)) b!191713))

(assert (= (or b!191712 b!191713) bm!19335))

(assert (= (or b!191716 bm!19335) bm!19336))

(assert (= (or b!191716 b!191712) bm!19337))

(assert (= (or b!191726 bm!19336) bm!19340))

(assert (= (or b!191726 bm!19337) bm!19338))

(assert (= (and d!56235 res!90607) b!191724))

(assert (= (and d!56235 c!34521) b!191710))

(assert (= (and d!56235 (not c!34521)) b!191719))

(assert (= (and d!56235 res!90603) b!191722))

(assert (= (and b!191722 res!90606) b!191729))

(assert (= (and b!191722 (not res!90604)) b!191721))

(assert (= (and b!191721 res!90601) b!191717))

(assert (= (and b!191722 res!90602) b!191728))

(assert (= (and b!191728 c!34522) b!191727))

(assert (= (and b!191728 (not c!34522)) b!191709))

(assert (= (and b!191727 res!90600) b!191725))

(assert (= (or b!191727 b!191709) bm!19341))

(assert (= (and b!191728 res!90605) b!191723))

(assert (= (and b!191723 c!34519) b!191718))

(assert (= (and b!191723 (not c!34519)) b!191715))

(assert (= (and b!191718 res!90599) b!191711))

(assert (= (or b!191718 b!191715) bm!19339))

(declare-fun b_lambda!7423 () Bool)

(assert (=> (not b_lambda!7423) (not b!191717)))

(assert (=> b!191717 t!7295))

(declare-fun b_and!11377 () Bool)

(assert (= b_and!11375 (and (=> t!7295 result!4895) b_and!11377)))

(declare-fun m!218443 () Bool)

(assert (=> bm!19339 m!218443))

(declare-fun m!218445 () Bool)

(assert (=> b!191726 m!218445))

(declare-fun m!218447 () Bool)

(assert (=> b!191710 m!218447))

(declare-fun m!218449 () Bool)

(assert (=> b!191710 m!218449))

(declare-fun m!218451 () Bool)

(assert (=> b!191710 m!218451))

(assert (=> b!191710 m!218451))

(declare-fun m!218453 () Bool)

(assert (=> b!191710 m!218453))

(declare-fun m!218455 () Bool)

(assert (=> b!191710 m!218455))

(declare-fun m!218457 () Bool)

(assert (=> b!191710 m!218457))

(declare-fun m!218459 () Bool)

(assert (=> b!191710 m!218459))

(declare-fun m!218461 () Bool)

(assert (=> b!191710 m!218461))

(declare-fun m!218463 () Bool)

(assert (=> b!191710 m!218463))

(assert (=> b!191710 m!218399))

(declare-fun m!218465 () Bool)

(assert (=> b!191710 m!218465))

(assert (=> b!191710 m!218447))

(declare-fun m!218467 () Bool)

(assert (=> b!191710 m!218467))

(assert (=> b!191710 m!218459))

(declare-fun m!218469 () Bool)

(assert (=> b!191710 m!218469))

(declare-fun m!218471 () Bool)

(assert (=> b!191710 m!218471))

(declare-fun m!218473 () Bool)

(assert (=> b!191710 m!218473))

(assert (=> b!191710 m!218471))

(declare-fun m!218475 () Bool)

(assert (=> b!191710 m!218475))

(declare-fun m!218477 () Bool)

(assert (=> b!191710 m!218477))

(declare-fun m!218479 () Bool)

(assert (=> bm!19338 m!218479))

(assert (=> d!56235 m!218281))

(assert (=> b!191729 m!218399))

(assert (=> b!191729 m!218399))

(assert (=> b!191729 m!218417))

(declare-fun m!218481 () Bool)

(assert (=> bm!19341 m!218481))

(assert (=> b!191721 m!218399))

(assert (=> b!191721 m!218399))

(declare-fun m!218483 () Bool)

(assert (=> b!191721 m!218483))

(assert (=> b!191724 m!218399))

(assert (=> b!191724 m!218399))

(assert (=> b!191724 m!218417))

(assert (=> bm!19340 m!218475))

(declare-fun m!218485 () Bool)

(assert (=> b!191711 m!218485))

(declare-fun m!218487 () Bool)

(assert (=> b!191717 m!218487))

(assert (=> b!191717 m!218427))

(declare-fun m!218489 () Bool)

(assert (=> b!191717 m!218489))

(assert (=> b!191717 m!218399))

(declare-fun m!218491 () Bool)

(assert (=> b!191717 m!218491))

(assert (=> b!191717 m!218487))

(assert (=> b!191717 m!218427))

(assert (=> b!191717 m!218399))

(declare-fun m!218493 () Bool)

(assert (=> b!191725 m!218493))

(assert (=> b!191560 d!56235))

(declare-fun d!56237 () Bool)

(assert (=> d!56237 (= (validMask!0 (mask!9130 thiss!1248)) (and (or (= (mask!9130 thiss!1248) #b00000000000000000000000000000111) (= (mask!9130 thiss!1248) #b00000000000000000000000000001111) (= (mask!9130 thiss!1248) #b00000000000000000000000000011111) (= (mask!9130 thiss!1248) #b00000000000000000000000000111111) (= (mask!9130 thiss!1248) #b00000000000000000000000001111111) (= (mask!9130 thiss!1248) #b00000000000000000000000011111111) (= (mask!9130 thiss!1248) #b00000000000000000000000111111111) (= (mask!9130 thiss!1248) #b00000000000000000000001111111111) (= (mask!9130 thiss!1248) #b00000000000000000000011111111111) (= (mask!9130 thiss!1248) #b00000000000000000000111111111111) (= (mask!9130 thiss!1248) #b00000000000000000001111111111111) (= (mask!9130 thiss!1248) #b00000000000000000011111111111111) (= (mask!9130 thiss!1248) #b00000000000000000111111111111111) (= (mask!9130 thiss!1248) #b00000000000000001111111111111111) (= (mask!9130 thiss!1248) #b00000000000000011111111111111111) (= (mask!9130 thiss!1248) #b00000000000000111111111111111111) (= (mask!9130 thiss!1248) #b00000000000001111111111111111111) (= (mask!9130 thiss!1248) #b00000000000011111111111111111111) (= (mask!9130 thiss!1248) #b00000000000111111111111111111111) (= (mask!9130 thiss!1248) #b00000000001111111111111111111111) (= (mask!9130 thiss!1248) #b00000000011111111111111111111111) (= (mask!9130 thiss!1248) #b00000000111111111111111111111111) (= (mask!9130 thiss!1248) #b00000001111111111111111111111111) (= (mask!9130 thiss!1248) #b00000011111111111111111111111111) (= (mask!9130 thiss!1248) #b00000111111111111111111111111111) (= (mask!9130 thiss!1248) #b00001111111111111111111111111111) (= (mask!9130 thiss!1248) #b00011111111111111111111111111111) (= (mask!9130 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9130 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!191560 d!56237))

(declare-fun d!56239 () Bool)

(declare-fun e!126178 () Bool)

(assert (=> d!56239 e!126178))

(declare-fun res!90610 () Bool)

(assert (=> d!56239 (=> (not res!90610) (not e!126178))))

(assert (=> d!56239 (= res!90610 (and (bvsge (index!4839 lt!95147) #b00000000000000000000000000000000) (bvslt (index!4839 lt!95147) (size!4153 (_values!3892 thiss!1248)))))))

(declare-fun lt!95303 () Unit!5782)

(declare-fun choose!1044 (array!8131 array!8133 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 32) (_ BitVec 64) V!5585 Int) Unit!5782)

(assert (=> d!56239 (= lt!95303 (choose!1044 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (index!4839 lt!95147) key!828 v!309 (defaultEntry!3909 thiss!1248)))))

(assert (=> d!56239 (validMask!0 (mask!9130 thiss!1248))))

(assert (=> d!56239 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!111 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (index!4839 lt!95147) key!828 v!309 (defaultEntry!3909 thiss!1248)) lt!95303)))

(declare-fun b!191732 () Bool)

(assert (=> b!191732 (= e!126178 (= (+!307 (getCurrentListMap!866 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) (tuple2!3477 key!828 v!309)) (getCurrentListMap!866 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248))))))

(assert (= (and d!56239 res!90610) b!191732))

(declare-fun m!218495 () Bool)

(assert (=> d!56239 m!218495))

(assert (=> d!56239 m!218281))

(assert (=> b!191732 m!218275))

(assert (=> b!191732 m!218275))

(declare-fun m!218497 () Bool)

(assert (=> b!191732 m!218497))

(assert (=> b!191732 m!218277))

(assert (=> b!191732 m!218269))

(assert (=> b!191560 d!56239))

(declare-fun d!56241 () Bool)

(declare-fun res!90617 () Bool)

(declare-fun e!126181 () Bool)

(assert (=> d!56241 (=> (not res!90617) (not e!126181))))

(declare-fun simpleValid!198 (LongMapFixedSize!2674) Bool)

(assert (=> d!56241 (= res!90617 (simpleValid!198 thiss!1248))))

(assert (=> d!56241 (= (valid!1121 thiss!1248) e!126181)))

(declare-fun b!191739 () Bool)

(declare-fun res!90618 () Bool)

(assert (=> b!191739 (=> (not res!90618) (not e!126181))))

(declare-fun arrayCountValidKeys!0 (array!8131 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!191739 (= res!90618 (= (arrayCountValidKeys!0 (_keys!5887 thiss!1248) #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))) (_size!1386 thiss!1248)))))

(declare-fun b!191740 () Bool)

(declare-fun res!90619 () Bool)

(assert (=> b!191740 (=> (not res!90619) (not e!126181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8131 (_ BitVec 32)) Bool)

(assert (=> b!191740 (= res!90619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(declare-fun b!191741 () Bool)

(declare-datatypes ((List!2388 0))(
  ( (Nil!2385) (Cons!2384 (h!3023 (_ BitVec 64)) (t!7296 List!2388)) )
))
(declare-fun arrayNoDuplicates!0 (array!8131 (_ BitVec 32) List!2388) Bool)

(assert (=> b!191741 (= e!126181 (arrayNoDuplicates!0 (_keys!5887 thiss!1248) #b00000000000000000000000000000000 Nil!2385))))

(assert (= (and d!56241 res!90617) b!191739))

(assert (= (and b!191739 res!90618) b!191740))

(assert (= (and b!191740 res!90619) b!191741))

(declare-fun m!218499 () Bool)

(assert (=> d!56241 m!218499))

(declare-fun m!218501 () Bool)

(assert (=> b!191739 m!218501))

(declare-fun m!218503 () Bool)

(assert (=> b!191740 m!218503))

(declare-fun m!218505 () Bool)

(assert (=> b!191741 m!218505))

(assert (=> start!19508 d!56241))

(declare-fun e!126190 () SeekEntryResult!667)

(declare-fun lt!95311 () SeekEntryResult!667)

(declare-fun b!191754 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8131 (_ BitVec 32)) SeekEntryResult!667)

(assert (=> b!191754 (= e!126190 (seekKeyOrZeroReturnVacant!0 (x!20539 lt!95311) (index!4840 lt!95311) (index!4840 lt!95311) key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(declare-fun b!191755 () Bool)

(declare-fun c!34531 () Bool)

(declare-fun lt!95310 () (_ BitVec 64))

(assert (=> b!191755 (= c!34531 (= lt!95310 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126189 () SeekEntryResult!667)

(assert (=> b!191755 (= e!126189 e!126190)))

(declare-fun b!191756 () Bool)

(declare-fun e!126188 () SeekEntryResult!667)

(assert (=> b!191756 (= e!126188 e!126189)))

(assert (=> b!191756 (= lt!95310 (select (arr!3830 (_keys!5887 thiss!1248)) (index!4840 lt!95311)))))

(declare-fun c!34533 () Bool)

(assert (=> b!191756 (= c!34533 (= lt!95310 key!828))))

(declare-fun d!56243 () Bool)

(declare-fun lt!95312 () SeekEntryResult!667)

(assert (=> d!56243 (and (or ((_ is Undefined!667) lt!95312) (not ((_ is Found!667) lt!95312)) (and (bvsge (index!4839 lt!95312) #b00000000000000000000000000000000) (bvslt (index!4839 lt!95312) (size!4152 (_keys!5887 thiss!1248))))) (or ((_ is Undefined!667) lt!95312) ((_ is Found!667) lt!95312) (not ((_ is MissingZero!667) lt!95312)) (and (bvsge (index!4838 lt!95312) #b00000000000000000000000000000000) (bvslt (index!4838 lt!95312) (size!4152 (_keys!5887 thiss!1248))))) (or ((_ is Undefined!667) lt!95312) ((_ is Found!667) lt!95312) ((_ is MissingZero!667) lt!95312) (not ((_ is MissingVacant!667) lt!95312)) (and (bvsge (index!4841 lt!95312) #b00000000000000000000000000000000) (bvslt (index!4841 lt!95312) (size!4152 (_keys!5887 thiss!1248))))) (or ((_ is Undefined!667) lt!95312) (ite ((_ is Found!667) lt!95312) (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4839 lt!95312)) key!828) (ite ((_ is MissingZero!667) lt!95312) (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4838 lt!95312)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!667) lt!95312) (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4841 lt!95312)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!56243 (= lt!95312 e!126188)))

(declare-fun c!34532 () Bool)

(assert (=> d!56243 (= c!34532 (and ((_ is Intermediate!667) lt!95311) (undefined!1479 lt!95311)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8131 (_ BitVec 32)) SeekEntryResult!667)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56243 (= lt!95311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9130 thiss!1248)) key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(assert (=> d!56243 (validMask!0 (mask!9130 thiss!1248))))

(assert (=> d!56243 (= (seekEntryOrOpen!0 key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)) lt!95312)))

(declare-fun b!191757 () Bool)

(assert (=> b!191757 (= e!126188 Undefined!667)))

(declare-fun b!191758 () Bool)

(assert (=> b!191758 (= e!126189 (Found!667 (index!4840 lt!95311)))))

(declare-fun b!191759 () Bool)

(assert (=> b!191759 (= e!126190 (MissingZero!667 (index!4840 lt!95311)))))

(assert (= (and d!56243 c!34532) b!191757))

(assert (= (and d!56243 (not c!34532)) b!191756))

(assert (= (and b!191756 c!34533) b!191758))

(assert (= (and b!191756 (not c!34533)) b!191755))

(assert (= (and b!191755 c!34531) b!191759))

(assert (= (and b!191755 (not c!34531)) b!191754))

(declare-fun m!218507 () Bool)

(assert (=> b!191754 m!218507))

(declare-fun m!218509 () Bool)

(assert (=> b!191756 m!218509))

(declare-fun m!218511 () Bool)

(assert (=> d!56243 m!218511))

(declare-fun m!218513 () Bool)

(assert (=> d!56243 m!218513))

(assert (=> d!56243 m!218281))

(declare-fun m!218515 () Bool)

(assert (=> d!56243 m!218515))

(declare-fun m!218517 () Bool)

(assert (=> d!56243 m!218517))

(declare-fun m!218519 () Bool)

(assert (=> d!56243 m!218519))

(assert (=> d!56243 m!218511))

(assert (=> b!191557 d!56243))

(declare-fun b!191776 () Bool)

(declare-fun e!126201 () Bool)

(declare-fun call!19349 () Bool)

(assert (=> b!191776 (= e!126201 (not call!19349))))

(declare-fun b!191777 () Bool)

(declare-fun e!126202 () Bool)

(declare-fun lt!95318 () SeekEntryResult!667)

(assert (=> b!191777 (= e!126202 ((_ is Undefined!667) lt!95318))))

(declare-fun b!191778 () Bool)

(declare-fun res!90628 () Bool)

(declare-fun e!126199 () Bool)

(assert (=> b!191778 (=> (not res!90628) (not e!126199))))

(assert (=> b!191778 (= res!90628 (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4841 lt!95318)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191778 (and (bvsge (index!4841 lt!95318) #b00000000000000000000000000000000) (bvslt (index!4841 lt!95318) (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!191779 () Bool)

(declare-fun res!90629 () Bool)

(assert (=> b!191779 (=> (not res!90629) (not e!126199))))

(declare-fun call!19350 () Bool)

(assert (=> b!191779 (= res!90629 call!19350)))

(assert (=> b!191779 (= e!126202 e!126199)))

(declare-fun d!56245 () Bool)

(declare-fun e!126200 () Bool)

(assert (=> d!56245 e!126200))

(declare-fun c!34538 () Bool)

(assert (=> d!56245 (= c!34538 ((_ is MissingZero!667) lt!95318))))

(assert (=> d!56245 (= lt!95318 (seekEntryOrOpen!0 key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(declare-fun lt!95317 () Unit!5782)

(declare-fun choose!1045 (array!8131 array!8133 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 64) Int) Unit!5782)

(assert (=> d!56245 (= lt!95317 (choose!1045 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)))))

(assert (=> d!56245 (validMask!0 (mask!9130 thiss!1248))))

(assert (=> d!56245 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!170 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)) lt!95317)))

(declare-fun bm!19346 () Bool)

(assert (=> bm!19346 (= call!19350 (inRange!0 (ite c!34538 (index!4838 lt!95318) (index!4841 lt!95318)) (mask!9130 thiss!1248)))))

(declare-fun b!191780 () Bool)

(assert (=> b!191780 (= e!126200 e!126202)))

(declare-fun c!34539 () Bool)

(assert (=> b!191780 (= c!34539 ((_ is MissingVacant!667) lt!95318))))

(declare-fun b!191781 () Bool)

(assert (=> b!191781 (= e!126200 e!126201)))

(declare-fun res!90631 () Bool)

(assert (=> b!191781 (= res!90631 call!19350)))

(assert (=> b!191781 (=> (not res!90631) (not e!126201))))

(declare-fun b!191782 () Bool)

(assert (=> b!191782 (and (bvsge (index!4838 lt!95318) #b00000000000000000000000000000000) (bvslt (index!4838 lt!95318) (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun res!90630 () Bool)

(assert (=> b!191782 (= res!90630 (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4838 lt!95318)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191782 (=> (not res!90630) (not e!126201))))

(declare-fun bm!19347 () Bool)

(declare-fun arrayContainsKey!0 (array!8131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19347 (= call!19349 (arrayContainsKey!0 (_keys!5887 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!191783 () Bool)

(assert (=> b!191783 (= e!126199 (not call!19349))))

(assert (= (and d!56245 c!34538) b!191781))

(assert (= (and d!56245 (not c!34538)) b!191780))

(assert (= (and b!191781 res!90631) b!191782))

(assert (= (and b!191782 res!90630) b!191776))

(assert (= (and b!191780 c!34539) b!191779))

(assert (= (and b!191780 (not c!34539)) b!191777))

(assert (= (and b!191779 res!90629) b!191778))

(assert (= (and b!191778 res!90628) b!191783))

(assert (= (or b!191781 b!191779) bm!19346))

(assert (= (or b!191776 b!191783) bm!19347))

(assert (=> d!56245 m!218289))

(declare-fun m!218521 () Bool)

(assert (=> d!56245 m!218521))

(assert (=> d!56245 m!218281))

(declare-fun m!218523 () Bool)

(assert (=> b!191782 m!218523))

(declare-fun m!218525 () Bool)

(assert (=> bm!19347 m!218525))

(declare-fun m!218527 () Bool)

(assert (=> b!191778 m!218527))

(declare-fun m!218529 () Bool)

(assert (=> bm!19346 m!218529))

(assert (=> b!191556 d!56245))

(declare-fun d!56247 () Bool)

(declare-fun e!126205 () Bool)

(assert (=> d!56247 e!126205))

(declare-fun res!90636 () Bool)

(assert (=> d!56247 (=> (not res!90636) (not e!126205))))

(declare-fun lt!95324 () SeekEntryResult!667)

(assert (=> d!56247 (= res!90636 ((_ is Found!667) lt!95324))))

(assert (=> d!56247 (= lt!95324 (seekEntryOrOpen!0 key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(declare-fun lt!95323 () Unit!5782)

(declare-fun choose!1046 (array!8131 array!8133 (_ BitVec 32) (_ BitVec 32) V!5585 V!5585 (_ BitVec 64) Int) Unit!5782)

(assert (=> d!56247 (= lt!95323 (choose!1046 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)))))

(assert (=> d!56247 (validMask!0 (mask!9130 thiss!1248))))

(assert (=> d!56247 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!173 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)) lt!95323)))

(declare-fun b!191788 () Bool)

(declare-fun res!90637 () Bool)

(assert (=> b!191788 (=> (not res!90637) (not e!126205))))

(assert (=> b!191788 (= res!90637 (inRange!0 (index!4839 lt!95324) (mask!9130 thiss!1248)))))

(declare-fun b!191789 () Bool)

(assert (=> b!191789 (= e!126205 (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4839 lt!95324)) key!828))))

(assert (=> b!191789 (and (bvsge (index!4839 lt!95324) #b00000000000000000000000000000000) (bvslt (index!4839 lt!95324) (size!4152 (_keys!5887 thiss!1248))))))

(assert (= (and d!56247 res!90636) b!191788))

(assert (= (and b!191788 res!90637) b!191789))

(assert (=> d!56247 m!218289))

(declare-fun m!218531 () Bool)

(assert (=> d!56247 m!218531))

(assert (=> d!56247 m!218281))

(declare-fun m!218533 () Bool)

(assert (=> b!191788 m!218533))

(declare-fun m!218535 () Bool)

(assert (=> b!191789 m!218535))

(assert (=> b!191554 d!56247))

(declare-fun d!56249 () Bool)

(assert (=> d!56249 (= (inRange!0 (index!4839 lt!95147) (mask!9130 thiss!1248)) (and (bvsge (index!4839 lt!95147) #b00000000000000000000000000000000) (bvslt (index!4839 lt!95147) (bvadd (mask!9130 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!191554 d!56249))

(declare-fun d!56251 () Bool)

(assert (=> d!56251 (= (array_inv!2467 (_keys!5887 thiss!1248)) (bvsge (size!4152 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191562 d!56251))

(declare-fun d!56253 () Bool)

(assert (=> d!56253 (= (array_inv!2468 (_values!3892 thiss!1248)) (bvsge (size!4153 (_values!3892 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!191562 d!56253))

(declare-fun mapNonEmpty!7701 () Bool)

(declare-fun mapRes!7701 () Bool)

(declare-fun tp!16908 () Bool)

(declare-fun e!126211 () Bool)

(assert (=> mapNonEmpty!7701 (= mapRes!7701 (and tp!16908 e!126211))))

(declare-fun mapRest!7701 () (Array (_ BitVec 32) ValueCell!1883))

(declare-fun mapKey!7701 () (_ BitVec 32))

(declare-fun mapValue!7701 () ValueCell!1883)

(assert (=> mapNonEmpty!7701 (= mapRest!7692 (store mapRest!7701 mapKey!7701 mapValue!7701))))

(declare-fun b!191797 () Bool)

(declare-fun e!126210 () Bool)

(assert (=> b!191797 (= e!126210 tp_is_empty!4453)))

(declare-fun condMapEmpty!7701 () Bool)

(declare-fun mapDefault!7701 () ValueCell!1883)

(assert (=> mapNonEmpty!7692 (= condMapEmpty!7701 (= mapRest!7692 ((as const (Array (_ BitVec 32) ValueCell!1883)) mapDefault!7701)))))

(assert (=> mapNonEmpty!7692 (= tp!16892 (and e!126210 mapRes!7701))))

(declare-fun mapIsEmpty!7701 () Bool)

(assert (=> mapIsEmpty!7701 mapRes!7701))

(declare-fun b!191796 () Bool)

(assert (=> b!191796 (= e!126211 tp_is_empty!4453)))

(assert (= (and mapNonEmpty!7692 condMapEmpty!7701) mapIsEmpty!7701))

(assert (= (and mapNonEmpty!7692 (not condMapEmpty!7701)) mapNonEmpty!7701))

(assert (= (and mapNonEmpty!7701 ((_ is ValueCellFull!1883) mapValue!7701)) b!191796))

(assert (= (and mapNonEmpty!7692 ((_ is ValueCellFull!1883) mapDefault!7701)) b!191797))

(declare-fun m!218537 () Bool)

(assert (=> mapNonEmpty!7701 m!218537))

(declare-fun b_lambda!7425 () Bool)

(assert (= b_lambda!7423 (or (and b!191562 b_free!4681) b_lambda!7425)))

(declare-fun b_lambda!7427 () Bool)

(assert (= b_lambda!7421 (or (and b!191562 b_free!4681) b_lambda!7427)))

(check-sat (not b!191732) (not b!191706) (not b!191726) (not bm!19347) (not d!56247) (not b!191708) (not b!191693) (not bm!19339) (not bm!19338) (not b_next!4681) (not b!191711) (not d!56245) b_and!11377 (not b!191741) (not b!191710) (not d!56233) (not b!191740) (not d!56239) (not b!191717) (not d!56231) (not b!191689) (not b_lambda!7427) (not b!191694) (not bm!19333) (not b_lambda!7425) (not d!56229) (not b!191633) (not bm!19334) (not b!191725) (not b!191685) (not bm!19331) (not b!191678) (not b!191724) (not b!191739) (not bm!19340) (not b!191679) (not b!191729) tp_is_empty!4453 (not bm!19332) (not b!191697) (not mapNonEmpty!7701) (not b!191754) (not d!56241) (not d!56243) (not bm!19346) (not b!191692) (not d!56235) (not b!191788) (not b!191634) (not bm!19341) (not b!191721))
(check-sat b_and!11377 (not b_next!4681))
(get-model)

(declare-fun b!191808 () Bool)

(declare-fun res!90647 () Bool)

(declare-fun e!126214 () Bool)

(assert (=> b!191808 (=> (not res!90647) (not e!126214))))

(declare-fun size!4158 (LongMapFixedSize!2674) (_ BitVec 32))

(assert (=> b!191808 (= res!90647 (= (size!4158 thiss!1248) (bvadd (_size!1386 thiss!1248) (bvsdiv (bvadd (extraKeys!3646 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!191807 () Bool)

(declare-fun res!90649 () Bool)

(assert (=> b!191807 (=> (not res!90649) (not e!126214))))

(assert (=> b!191807 (= res!90649 (bvsge (size!4158 thiss!1248) (_size!1386 thiss!1248)))))

(declare-fun d!56255 () Bool)

(declare-fun res!90648 () Bool)

(assert (=> d!56255 (=> (not res!90648) (not e!126214))))

(assert (=> d!56255 (= res!90648 (validMask!0 (mask!9130 thiss!1248)))))

(assert (=> d!56255 (= (simpleValid!198 thiss!1248) e!126214)))

(declare-fun b!191809 () Bool)

(assert (=> b!191809 (= e!126214 (and (bvsge (extraKeys!3646 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3646 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1386 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!191806 () Bool)

(declare-fun res!90646 () Bool)

(assert (=> b!191806 (=> (not res!90646) (not e!126214))))

(assert (=> b!191806 (= res!90646 (and (= (size!4153 (_values!3892 thiss!1248)) (bvadd (mask!9130 thiss!1248) #b00000000000000000000000000000001)) (= (size!4152 (_keys!5887 thiss!1248)) (size!4153 (_values!3892 thiss!1248))) (bvsge (_size!1386 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1386 thiss!1248) (bvadd (mask!9130 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!56255 res!90648) b!191806))

(assert (= (and b!191806 res!90646) b!191807))

(assert (= (and b!191807 res!90649) b!191808))

(assert (= (and b!191808 res!90647) b!191809))

(declare-fun m!218539 () Bool)

(assert (=> b!191808 m!218539))

(assert (=> b!191807 m!218539))

(assert (=> d!56255 m!218281))

(assert (=> d!56241 d!56255))

(declare-fun b!191818 () Bool)

(declare-fun e!126220 () (_ BitVec 32))

(declare-fun e!126219 () (_ BitVec 32))

(assert (=> b!191818 (= e!126220 e!126219)))

(declare-fun c!34544 () Bool)

(assert (=> b!191818 (= c!34544 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191819 () Bool)

(declare-fun call!19353 () (_ BitVec 32))

(assert (=> b!191819 (= e!126219 call!19353)))

(declare-fun b!191820 () Bool)

(assert (=> b!191820 (= e!126220 #b00000000000000000000000000000000)))

(declare-fun bm!19350 () Bool)

(assert (=> bm!19350 (= call!19353 (arrayCountValidKeys!0 (_keys!5887 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!191821 () Bool)

(assert (=> b!191821 (= e!126219 (bvadd #b00000000000000000000000000000001 call!19353))))

(declare-fun d!56257 () Bool)

(declare-fun lt!95327 () (_ BitVec 32))

(assert (=> d!56257 (and (bvsge lt!95327 #b00000000000000000000000000000000) (bvsle lt!95327 (bvsub (size!4152 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56257 (= lt!95327 e!126220)))

(declare-fun c!34545 () Bool)

(assert (=> d!56257 (= c!34545 (bvsge #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> d!56257 (and (bvsle #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4152 (_keys!5887 thiss!1248)) (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> d!56257 (= (arrayCountValidKeys!0 (_keys!5887 thiss!1248) #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))) lt!95327)))

(assert (= (and d!56257 c!34545) b!191820))

(assert (= (and d!56257 (not c!34545)) b!191818))

(assert (= (and b!191818 c!34544) b!191821))

(assert (= (and b!191818 (not c!34544)) b!191819))

(assert (= (or b!191821 b!191819) bm!19350))

(assert (=> b!191818 m!218399))

(assert (=> b!191818 m!218399))

(assert (=> b!191818 m!218417))

(declare-fun m!218541 () Bool)

(assert (=> bm!19350 m!218541))

(assert (=> b!191739 d!56257))

(declare-fun d!56259 () Bool)

(assert (=> d!56259 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95148) key!828))))

(declare-fun lt!95330 () Unit!5782)

(declare-fun choose!1047 (List!2387 (_ BitVec 64)) Unit!5782)

(assert (=> d!56259 (= lt!95330 (choose!1047 (toList!1214 lt!95148) key!828))))

(declare-fun e!126223 () Bool)

(assert (=> d!56259 e!126223))

(declare-fun res!90652 () Bool)

(assert (=> d!56259 (=> (not res!90652) (not e!126223))))

(declare-fun isStrictlySorted!342 (List!2387) Bool)

(assert (=> d!56259 (= res!90652 (isStrictlySorted!342 (toList!1214 lt!95148)))))

(assert (=> d!56259 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 lt!95148) key!828) lt!95330)))

(declare-fun b!191824 () Bool)

(assert (=> b!191824 (= e!126223 (containsKey!243 (toList!1214 lt!95148) key!828))))

(assert (= (and d!56259 res!90652) b!191824))

(assert (=> d!56259 m!218439))

(assert (=> d!56259 m!218439))

(assert (=> d!56259 m!218441))

(declare-fun m!218543 () Bool)

(assert (=> d!56259 m!218543))

(declare-fun m!218545 () Bool)

(assert (=> d!56259 m!218545))

(assert (=> b!191824 m!218435))

(assert (=> b!191706 d!56259))

(declare-fun d!56261 () Bool)

(declare-fun isEmpty!489 (Option!246) Bool)

(assert (=> d!56261 (= (isDefined!192 (getValueByKey!240 (toList!1214 lt!95148) key!828)) (not (isEmpty!489 (getValueByKey!240 (toList!1214 lt!95148) key!828))))))

(declare-fun bs!7683 () Bool)

(assert (= bs!7683 d!56261))

(assert (=> bs!7683 m!218439))

(declare-fun m!218547 () Bool)

(assert (=> bs!7683 m!218547))

(assert (=> b!191706 d!56261))

(declare-fun b!191833 () Bool)

(declare-fun e!126228 () Option!246)

(assert (=> b!191833 (= e!126228 (Some!245 (_2!1749 (h!3022 (toList!1214 lt!95148)))))))

(declare-fun d!56263 () Bool)

(declare-fun c!34550 () Bool)

(assert (=> d!56263 (= c!34550 (and ((_ is Cons!2383) (toList!1214 lt!95148)) (= (_1!1749 (h!3022 (toList!1214 lt!95148))) key!828)))))

(assert (=> d!56263 (= (getValueByKey!240 (toList!1214 lt!95148) key!828) e!126228)))

(declare-fun b!191834 () Bool)

(declare-fun e!126229 () Option!246)

(assert (=> b!191834 (= e!126228 e!126229)))

(declare-fun c!34551 () Bool)

(assert (=> b!191834 (= c!34551 (and ((_ is Cons!2383) (toList!1214 lt!95148)) (not (= (_1!1749 (h!3022 (toList!1214 lt!95148))) key!828))))))

(declare-fun b!191835 () Bool)

(assert (=> b!191835 (= e!126229 (getValueByKey!240 (t!7293 (toList!1214 lt!95148)) key!828))))

(declare-fun b!191836 () Bool)

(assert (=> b!191836 (= e!126229 None!244)))

(assert (= (and d!56263 c!34550) b!191833))

(assert (= (and d!56263 (not c!34550)) b!191834))

(assert (= (and b!191834 c!34551) b!191835))

(assert (= (and b!191834 (not c!34551)) b!191836))

(declare-fun m!218549 () Bool)

(assert (=> b!191835 m!218549))

(assert (=> b!191706 d!56263))

(declare-fun d!56265 () Bool)

(declare-fun e!126230 () Bool)

(assert (=> d!56265 e!126230))

(declare-fun res!90654 () Bool)

(assert (=> d!56265 (=> (not res!90654) (not e!126230))))

(declare-fun lt!95333 () ListLongMap!2397)

(assert (=> d!56265 (= res!90654 (contains!1340 lt!95333 (_1!1749 (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(declare-fun lt!95334 () List!2387)

(assert (=> d!56265 (= lt!95333 (ListLongMap!2398 lt!95334))))

(declare-fun lt!95331 () Unit!5782)

(declare-fun lt!95332 () Unit!5782)

(assert (=> d!56265 (= lt!95331 lt!95332)))

(assert (=> d!56265 (= (getValueByKey!240 lt!95334 (_1!1749 (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))) (Some!245 (_2!1749 (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56265 (= lt!95332 (lemmaContainsTupThenGetReturnValue!127 lt!95334 (_1!1749 (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (_2!1749 (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56265 (= lt!95334 (insertStrictlySorted!130 (toList!1214 (ite c!34511 call!19332 (ite c!34515 call!19336 call!19335))) (_1!1749 (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (_2!1749 (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56265 (= (+!307 (ite c!34511 call!19332 (ite c!34515 call!19336 call!19335)) (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) lt!95333)))

(declare-fun b!191837 () Bool)

(declare-fun res!90653 () Bool)

(assert (=> b!191837 (=> (not res!90653) (not e!126230))))

(assert (=> b!191837 (= res!90653 (= (getValueByKey!240 (toList!1214 lt!95333) (_1!1749 (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))) (Some!245 (_2!1749 (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))))

(declare-fun b!191838 () Bool)

(assert (=> b!191838 (= e!126230 (contains!1341 (toList!1214 lt!95333) (ite (or c!34511 c!34515) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (= (and d!56265 res!90654) b!191837))

(assert (= (and b!191837 res!90653) b!191838))

(declare-fun m!218551 () Bool)

(assert (=> d!56265 m!218551))

(declare-fun m!218553 () Bool)

(assert (=> d!56265 m!218553))

(declare-fun m!218555 () Bool)

(assert (=> d!56265 m!218555))

(declare-fun m!218557 () Bool)

(assert (=> d!56265 m!218557))

(declare-fun m!218559 () Bool)

(assert (=> b!191837 m!218559))

(declare-fun m!218561 () Bool)

(assert (=> b!191838 m!218561))

(assert (=> bm!19331 d!56265))

(declare-fun d!56267 () Bool)

(declare-fun res!90659 () Bool)

(declare-fun e!126239 () Bool)

(assert (=> d!56267 (=> res!90659 e!126239)))

(assert (=> d!56267 (= res!90659 (bvsge #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> d!56267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)) e!126239)))

(declare-fun b!191847 () Bool)

(declare-fun e!126237 () Bool)

(assert (=> b!191847 (= e!126239 e!126237)))

(declare-fun c!34554 () Bool)

(assert (=> b!191847 (= c!34554 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191848 () Bool)

(declare-fun call!19356 () Bool)

(assert (=> b!191848 (= e!126237 call!19356)))

(declare-fun b!191849 () Bool)

(declare-fun e!126238 () Bool)

(assert (=> b!191849 (= e!126237 e!126238)))

(declare-fun lt!95341 () (_ BitVec 64))

(assert (=> b!191849 (= lt!95341 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!95342 () Unit!5782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8131 (_ BitVec 64) (_ BitVec 32)) Unit!5782)

(assert (=> b!191849 (= lt!95342 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5887 thiss!1248) lt!95341 #b00000000000000000000000000000000))))

(assert (=> b!191849 (arrayContainsKey!0 (_keys!5887 thiss!1248) lt!95341 #b00000000000000000000000000000000)))

(declare-fun lt!95343 () Unit!5782)

(assert (=> b!191849 (= lt!95343 lt!95342)))

(declare-fun res!90660 () Bool)

(assert (=> b!191849 (= res!90660 (= (seekEntryOrOpen!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000) (_keys!5887 thiss!1248) (mask!9130 thiss!1248)) (Found!667 #b00000000000000000000000000000000)))))

(assert (=> b!191849 (=> (not res!90660) (not e!126238))))

(declare-fun bm!19353 () Bool)

(assert (=> bm!19353 (= call!19356 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(declare-fun b!191850 () Bool)

(assert (=> b!191850 (= e!126238 call!19356)))

(assert (= (and d!56267 (not res!90659)) b!191847))

(assert (= (and b!191847 c!34554) b!191849))

(assert (= (and b!191847 (not c!34554)) b!191848))

(assert (= (and b!191849 res!90660) b!191850))

(assert (= (or b!191850 b!191848) bm!19353))

(assert (=> b!191847 m!218399))

(assert (=> b!191847 m!218399))

(assert (=> b!191847 m!218417))

(assert (=> b!191849 m!218399))

(declare-fun m!218563 () Bool)

(assert (=> b!191849 m!218563))

(declare-fun m!218565 () Bool)

(assert (=> b!191849 m!218565))

(assert (=> b!191849 m!218399))

(declare-fun m!218567 () Bool)

(assert (=> b!191849 m!218567))

(declare-fun m!218569 () Bool)

(assert (=> bm!19353 m!218569))

(assert (=> b!191740 d!56267))

(declare-fun d!56269 () Bool)

(declare-fun e!126241 () Bool)

(assert (=> d!56269 e!126241))

(declare-fun res!90661 () Bool)

(assert (=> d!56269 (=> res!90661 e!126241)))

(declare-fun lt!95345 () Bool)

(assert (=> d!56269 (= res!90661 (not lt!95345))))

(declare-fun lt!95347 () Bool)

(assert (=> d!56269 (= lt!95345 lt!95347)))

(declare-fun lt!95344 () Unit!5782)

(declare-fun e!126240 () Unit!5782)

(assert (=> d!56269 (= lt!95344 e!126240)))

(declare-fun c!34555 () Bool)

(assert (=> d!56269 (= c!34555 lt!95347)))

(assert (=> d!56269 (= lt!95347 (containsKey!243 (toList!1214 lt!95288) (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56269 (= (contains!1340 lt!95288 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)) lt!95345)))

(declare-fun b!191851 () Bool)

(declare-fun lt!95346 () Unit!5782)

(assert (=> b!191851 (= e!126240 lt!95346)))

(assert (=> b!191851 (= lt!95346 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 lt!95288) (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!191851 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95288) (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191852 () Bool)

(declare-fun Unit!5788 () Unit!5782)

(assert (=> b!191852 (= e!126240 Unit!5788)))

(declare-fun b!191853 () Bool)

(assert (=> b!191853 (= e!126241 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95288) (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56269 c!34555) b!191851))

(assert (= (and d!56269 (not c!34555)) b!191852))

(assert (= (and d!56269 (not res!90661)) b!191853))

(assert (=> d!56269 m!218399))

(declare-fun m!218571 () Bool)

(assert (=> d!56269 m!218571))

(assert (=> b!191851 m!218399))

(declare-fun m!218573 () Bool)

(assert (=> b!191851 m!218573))

(assert (=> b!191851 m!218399))

(declare-fun m!218575 () Bool)

(assert (=> b!191851 m!218575))

(assert (=> b!191851 m!218575))

(declare-fun m!218577 () Bool)

(assert (=> b!191851 m!218577))

(assert (=> b!191853 m!218399))

(assert (=> b!191853 m!218575))

(assert (=> b!191853 m!218575))

(assert (=> b!191853 m!218577))

(assert (=> b!191721 d!56269))

(declare-fun b!191864 () Bool)

(declare-fun e!126252 () Bool)

(declare-fun call!19359 () Bool)

(assert (=> b!191864 (= e!126252 call!19359)))

(declare-fun b!191865 () Bool)

(assert (=> b!191865 (= e!126252 call!19359)))

(declare-fun b!191867 () Bool)

(declare-fun e!126250 () Bool)

(declare-fun contains!1342 (List!2388 (_ BitVec 64)) Bool)

(assert (=> b!191867 (= e!126250 (contains!1342 Nil!2385 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!191868 () Bool)

(declare-fun e!126253 () Bool)

(declare-fun e!126251 () Bool)

(assert (=> b!191868 (= e!126253 e!126251)))

(declare-fun res!90670 () Bool)

(assert (=> b!191868 (=> (not res!90670) (not e!126251))))

(assert (=> b!191868 (= res!90670 (not e!126250))))

(declare-fun res!90668 () Bool)

(assert (=> b!191868 (=> (not res!90668) (not e!126250))))

(assert (=> b!191868 (= res!90668 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19356 () Bool)

(declare-fun c!34558 () Bool)

(assert (=> bm!19356 (= call!19359 (arrayNoDuplicates!0 (_keys!5887 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34558 (Cons!2384 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000) Nil!2385) Nil!2385)))))

(declare-fun b!191866 () Bool)

(assert (=> b!191866 (= e!126251 e!126252)))

(assert (=> b!191866 (= c!34558 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!56271 () Bool)

(declare-fun res!90669 () Bool)

(assert (=> d!56271 (=> res!90669 e!126253)))

(assert (=> d!56271 (= res!90669 (bvsge #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> d!56271 (= (arrayNoDuplicates!0 (_keys!5887 thiss!1248) #b00000000000000000000000000000000 Nil!2385) e!126253)))

(assert (= (and d!56271 (not res!90669)) b!191868))

(assert (= (and b!191868 res!90668) b!191867))

(assert (= (and b!191868 res!90670) b!191866))

(assert (= (and b!191866 c!34558) b!191865))

(assert (= (and b!191866 (not c!34558)) b!191864))

(assert (= (or b!191865 b!191864) bm!19356))

(assert (=> b!191867 m!218399))

(assert (=> b!191867 m!218399))

(declare-fun m!218579 () Bool)

(assert (=> b!191867 m!218579))

(assert (=> b!191868 m!218399))

(assert (=> b!191868 m!218399))

(assert (=> b!191868 m!218417))

(assert (=> bm!19356 m!218399))

(declare-fun m!218581 () Bool)

(assert (=> bm!19356 m!218581))

(assert (=> b!191866 m!218399))

(assert (=> b!191866 m!218399))

(assert (=> b!191866 m!218417))

(assert (=> b!191741 d!56271))

(assert (=> b!191708 d!56261))

(assert (=> b!191708 d!56263))

(declare-fun d!56273 () Bool)

(declare-fun get!2220 (Option!246) V!5585)

(assert (=> d!56273 (= (apply!182 lt!95254 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)) (get!2220 (getValueByKey!240 (toList!1214 lt!95254) (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7684 () Bool)

(assert (= bs!7684 d!56273))

(assert (=> bs!7684 m!218399))

(declare-fun m!218583 () Bool)

(assert (=> bs!7684 m!218583))

(assert (=> bs!7684 m!218583))

(declare-fun m!218585 () Bool)

(assert (=> bs!7684 m!218585))

(assert (=> b!191685 d!56273))

(declare-fun d!56275 () Bool)

(declare-fun c!34561 () Bool)

(assert (=> d!56275 (= c!34561 ((_ is ValueCellFull!1883) (select (arr!3831 (_values!3892 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!126256 () V!5585)

(assert (=> d!56275 (= (get!2219 (select (arr!3831 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126256)))

(declare-fun b!191873 () Bool)

(declare-fun get!2221 (ValueCell!1883 V!5585) V!5585)

(assert (=> b!191873 (= e!126256 (get!2221 (select (arr!3831 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191874 () Bool)

(declare-fun get!2222 (ValueCell!1883 V!5585) V!5585)

(assert (=> b!191874 (= e!126256 (get!2222 (select (arr!3831 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56275 c!34561) b!191873))

(assert (= (and d!56275 (not c!34561)) b!191874))

(assert (=> b!191873 m!218425))

(assert (=> b!191873 m!218427))

(declare-fun m!218587 () Bool)

(assert (=> b!191873 m!218587))

(assert (=> b!191874 m!218425))

(assert (=> b!191874 m!218427))

(declare-fun m!218589 () Bool)

(assert (=> b!191874 m!218589))

(assert (=> b!191685 d!56275))

(declare-fun d!56277 () Bool)

(assert (=> d!56277 (= (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!191724 d!56277))

(declare-fun d!56279 () Bool)

(declare-fun lt!95350 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!154 (List!2387) (InoxSet tuple2!3476))

(assert (=> d!56279 (= lt!95350 (select (content!154 (toList!1214 lt!95199)) (tuple2!3477 key!828 v!309)))))

(declare-fun e!126262 () Bool)

(assert (=> d!56279 (= lt!95350 e!126262)))

(declare-fun res!90675 () Bool)

(assert (=> d!56279 (=> (not res!90675) (not e!126262))))

(assert (=> d!56279 (= res!90675 ((_ is Cons!2383) (toList!1214 lt!95199)))))

(assert (=> d!56279 (= (contains!1341 (toList!1214 lt!95199) (tuple2!3477 key!828 v!309)) lt!95350)))

(declare-fun b!191879 () Bool)

(declare-fun e!126261 () Bool)

(assert (=> b!191879 (= e!126262 e!126261)))

(declare-fun res!90676 () Bool)

(assert (=> b!191879 (=> res!90676 e!126261)))

(assert (=> b!191879 (= res!90676 (= (h!3022 (toList!1214 lt!95199)) (tuple2!3477 key!828 v!309)))))

(declare-fun b!191880 () Bool)

(assert (=> b!191880 (= e!126261 (contains!1341 (t!7293 (toList!1214 lt!95199)) (tuple2!3477 key!828 v!309)))))

(assert (= (and d!56279 res!90675) b!191879))

(assert (= (and b!191879 (not res!90676)) b!191880))

(declare-fun m!218591 () Bool)

(assert (=> d!56279 m!218591))

(declare-fun m!218593 () Bool)

(assert (=> d!56279 m!218593))

(declare-fun m!218595 () Bool)

(assert (=> b!191880 m!218595))

(assert (=> b!191634 d!56279))

(declare-fun d!56281 () Bool)

(declare-fun e!126264 () Bool)

(assert (=> d!56281 e!126264))

(declare-fun res!90677 () Bool)

(assert (=> d!56281 (=> res!90677 e!126264)))

(declare-fun lt!95352 () Bool)

(assert (=> d!56281 (= res!90677 (not lt!95352))))

(declare-fun lt!95354 () Bool)

(assert (=> d!56281 (= lt!95352 lt!95354)))

(declare-fun lt!95351 () Unit!5782)

(declare-fun e!126263 () Unit!5782)

(assert (=> d!56281 (= lt!95351 e!126263)))

(declare-fun c!34562 () Bool)

(assert (=> d!56281 (= c!34562 lt!95354)))

(assert (=> d!56281 (= lt!95354 (containsKey!243 (toList!1214 lt!95254) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56281 (= (contains!1340 lt!95254 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95352)))

(declare-fun b!191881 () Bool)

(declare-fun lt!95353 () Unit!5782)

(assert (=> b!191881 (= e!126263 lt!95353)))

(assert (=> b!191881 (= lt!95353 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 lt!95254) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191881 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95254) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191882 () Bool)

(declare-fun Unit!5789 () Unit!5782)

(assert (=> b!191882 (= e!126263 Unit!5789)))

(declare-fun b!191883 () Bool)

(assert (=> b!191883 (= e!126264 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95254) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56281 c!34562) b!191881))

(assert (= (and d!56281 (not c!34562)) b!191882))

(assert (= (and d!56281 (not res!90677)) b!191883))

(declare-fun m!218597 () Bool)

(assert (=> d!56281 m!218597))

(declare-fun m!218599 () Bool)

(assert (=> b!191881 m!218599))

(declare-fun m!218601 () Bool)

(assert (=> b!191881 m!218601))

(assert (=> b!191881 m!218601))

(declare-fun m!218603 () Bool)

(assert (=> b!191881 m!218603))

(assert (=> b!191883 m!218601))

(assert (=> b!191883 m!218601))

(assert (=> b!191883 m!218603))

(assert (=> bm!19334 d!56281))

(declare-fun lt!95359 () SeekEntryResult!667)

(declare-fun d!56283 () Bool)

(assert (=> d!56283 (and (or ((_ is Undefined!667) lt!95359) (not ((_ is Found!667) lt!95359)) (and (bvsge (index!4839 lt!95359) #b00000000000000000000000000000000) (bvslt (index!4839 lt!95359) (size!4152 (_keys!5887 thiss!1248))))) (or ((_ is Undefined!667) lt!95359) ((_ is Found!667) lt!95359) (not ((_ is MissingVacant!667) lt!95359)) (not (= (index!4841 lt!95359) (index!4840 lt!95311))) (and (bvsge (index!4841 lt!95359) #b00000000000000000000000000000000) (bvslt (index!4841 lt!95359) (size!4152 (_keys!5887 thiss!1248))))) (or ((_ is Undefined!667) lt!95359) (ite ((_ is Found!667) lt!95359) (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4839 lt!95359)) key!828) (and ((_ is MissingVacant!667) lt!95359) (= (index!4841 lt!95359) (index!4840 lt!95311)) (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4841 lt!95359)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!126272 () SeekEntryResult!667)

(assert (=> d!56283 (= lt!95359 e!126272)))

(declare-fun c!34571 () Bool)

(assert (=> d!56283 (= c!34571 (bvsge (x!20539 lt!95311) #b01111111111111111111111111111110))))

(declare-fun lt!95360 () (_ BitVec 64))

(assert (=> d!56283 (= lt!95360 (select (arr!3830 (_keys!5887 thiss!1248)) (index!4840 lt!95311)))))

(assert (=> d!56283 (validMask!0 (mask!9130 thiss!1248))))

(assert (=> d!56283 (= (seekKeyOrZeroReturnVacant!0 (x!20539 lt!95311) (index!4840 lt!95311) (index!4840 lt!95311) key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)) lt!95359)))

(declare-fun b!191896 () Bool)

(declare-fun e!126273 () SeekEntryResult!667)

(assert (=> b!191896 (= e!126273 (MissingVacant!667 (index!4840 lt!95311)))))

(declare-fun b!191897 () Bool)

(assert (=> b!191897 (= e!126272 Undefined!667)))

(declare-fun b!191898 () Bool)

(declare-fun c!34570 () Bool)

(assert (=> b!191898 (= c!34570 (= lt!95360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126271 () SeekEntryResult!667)

(assert (=> b!191898 (= e!126271 e!126273)))

(declare-fun b!191899 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!191899 (= e!126273 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20539 lt!95311) #b00000000000000000000000000000001) (nextIndex!0 (index!4840 lt!95311) (bvadd (x!20539 lt!95311) #b00000000000000000000000000000001) (mask!9130 thiss!1248)) (index!4840 lt!95311) key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(declare-fun b!191900 () Bool)

(assert (=> b!191900 (= e!126271 (Found!667 (index!4840 lt!95311)))))

(declare-fun b!191901 () Bool)

(assert (=> b!191901 (= e!126272 e!126271)))

(declare-fun c!34569 () Bool)

(assert (=> b!191901 (= c!34569 (= lt!95360 key!828))))

(assert (= (and d!56283 c!34571) b!191897))

(assert (= (and d!56283 (not c!34571)) b!191901))

(assert (= (and b!191901 c!34569) b!191900))

(assert (= (and b!191901 (not c!34569)) b!191898))

(assert (= (and b!191898 c!34570) b!191896))

(assert (= (and b!191898 (not c!34570)) b!191899))

(declare-fun m!218605 () Bool)

(assert (=> d!56283 m!218605))

(declare-fun m!218607 () Bool)

(assert (=> d!56283 m!218607))

(assert (=> d!56283 m!218509))

(assert (=> d!56283 m!218281))

(declare-fun m!218609 () Bool)

(assert (=> b!191899 m!218609))

(assert (=> b!191899 m!218609))

(declare-fun m!218611 () Bool)

(assert (=> b!191899 m!218611))

(assert (=> b!191754 d!56283))

(declare-fun d!56285 () Bool)

(declare-fun e!126274 () Bool)

(assert (=> d!56285 e!126274))

(declare-fun res!90679 () Bool)

(assert (=> d!56285 (=> (not res!90679) (not e!126274))))

(declare-fun lt!95363 () ListLongMap!2397)

(assert (=> d!56285 (= res!90679 (contains!1340 lt!95363 (_1!1749 (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(declare-fun lt!95364 () List!2387)

(assert (=> d!56285 (= lt!95363 (ListLongMap!2398 lt!95364))))

(declare-fun lt!95361 () Unit!5782)

(declare-fun lt!95362 () Unit!5782)

(assert (=> d!56285 (= lt!95361 lt!95362)))

(assert (=> d!56285 (= (getValueByKey!240 lt!95364 (_1!1749 (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))) (Some!245 (_2!1749 (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56285 (= lt!95362 (lemmaContainsTupThenGetReturnValue!127 lt!95364 (_1!1749 (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (_2!1749 (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56285 (= lt!95364 (insertStrictlySorted!130 (toList!1214 (ite c!34520 call!19339 (ite c!34524 call!19343 call!19342))) (_1!1749 (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (_2!1749 (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(assert (=> d!56285 (= (+!307 (ite c!34520 call!19339 (ite c!34524 call!19343 call!19342)) (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) lt!95363)))

(declare-fun b!191902 () Bool)

(declare-fun res!90678 () Bool)

(assert (=> b!191902 (=> (not res!90678) (not e!126274))))

(assert (=> b!191902 (= res!90678 (= (getValueByKey!240 (toList!1214 lt!95363) (_1!1749 (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))) (Some!245 (_2!1749 (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))))

(declare-fun b!191903 () Bool)

(assert (=> b!191903 (= e!126274 (contains!1341 (toList!1214 lt!95363) (ite (or c!34520 c!34524) (tuple2!3477 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3750 thiss!1248)) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (= (and d!56285 res!90679) b!191902))

(assert (= (and b!191902 res!90678) b!191903))

(declare-fun m!218613 () Bool)

(assert (=> d!56285 m!218613))

(declare-fun m!218615 () Bool)

(assert (=> d!56285 m!218615))

(declare-fun m!218617 () Bool)

(assert (=> d!56285 m!218617))

(declare-fun m!218619 () Bool)

(assert (=> d!56285 m!218619))

(declare-fun m!218621 () Bool)

(assert (=> b!191902 m!218621))

(declare-fun m!218623 () Bool)

(assert (=> b!191903 m!218623))

(assert (=> bm!19338 d!56285))

(assert (=> b!191697 d!56277))

(assert (=> d!56245 d!56243))

(declare-fun b!191920 () Bool)

(declare-fun res!90691 () Bool)

(declare-fun e!126285 () Bool)

(assert (=> b!191920 (=> (not res!90691) (not e!126285))))

(declare-fun call!19365 () Bool)

(assert (=> b!191920 (= res!90691 call!19365)))

(declare-fun e!126283 () Bool)

(assert (=> b!191920 (= e!126283 e!126285)))

(declare-fun d!56287 () Bool)

(declare-fun e!126284 () Bool)

(assert (=> d!56287 e!126284))

(declare-fun c!34577 () Bool)

(declare-fun lt!95367 () SeekEntryResult!667)

(assert (=> d!56287 (= c!34577 ((_ is MissingZero!667) lt!95367))))

(assert (=> d!56287 (= lt!95367 (seekEntryOrOpen!0 key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(assert (=> d!56287 true))

(declare-fun _$34!1081 () Unit!5782)

(assert (=> d!56287 (= (choose!1045 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)) _$34!1081)))

(declare-fun b!191921 () Bool)

(assert (=> b!191921 (= e!126283 ((_ is Undefined!667) lt!95367))))

(declare-fun bm!19361 () Bool)

(declare-fun call!19364 () Bool)

(assert (=> bm!19361 (= call!19364 (arrayContainsKey!0 (_keys!5887 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!191922 () Bool)

(declare-fun res!90688 () Bool)

(assert (=> b!191922 (= res!90688 (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4838 lt!95367)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126286 () Bool)

(assert (=> b!191922 (=> (not res!90688) (not e!126286))))

(declare-fun b!191923 () Bool)

(declare-fun res!90690 () Bool)

(assert (=> b!191923 (=> (not res!90690) (not e!126285))))

(assert (=> b!191923 (= res!90690 (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4841 lt!95367)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191924 () Bool)

(assert (=> b!191924 (= e!126284 e!126286)))

(declare-fun res!90689 () Bool)

(assert (=> b!191924 (= res!90689 call!19365)))

(assert (=> b!191924 (=> (not res!90689) (not e!126286))))

(declare-fun b!191925 () Bool)

(assert (=> b!191925 (= e!126285 (not call!19364))))

(declare-fun bm!19362 () Bool)

(assert (=> bm!19362 (= call!19365 (inRange!0 (ite c!34577 (index!4838 lt!95367) (index!4841 lt!95367)) (mask!9130 thiss!1248)))))

(declare-fun b!191926 () Bool)

(assert (=> b!191926 (= e!126286 (not call!19364))))

(declare-fun b!191927 () Bool)

(assert (=> b!191927 (= e!126284 e!126283)))

(declare-fun c!34576 () Bool)

(assert (=> b!191927 (= c!34576 ((_ is MissingVacant!667) lt!95367))))

(assert (= (and d!56287 c!34577) b!191924))

(assert (= (and d!56287 (not c!34577)) b!191927))

(assert (= (and b!191924 res!90689) b!191922))

(assert (= (and b!191922 res!90688) b!191926))

(assert (= (and b!191927 c!34576) b!191920))

(assert (= (and b!191927 (not c!34576)) b!191921))

(assert (= (and b!191920 res!90691) b!191923))

(assert (= (and b!191923 res!90690) b!191925))

(assert (= (or b!191924 b!191920) bm!19362))

(assert (= (or b!191926 b!191925) bm!19361))

(declare-fun m!218625 () Bool)

(assert (=> bm!19362 m!218625))

(declare-fun m!218627 () Bool)

(assert (=> b!191922 m!218627))

(declare-fun m!218629 () Bool)

(assert (=> b!191923 m!218629))

(assert (=> d!56287 m!218289))

(assert (=> bm!19361 m!218525))

(assert (=> d!56245 d!56287))

(assert (=> d!56245 d!56237))

(declare-fun d!56289 () Bool)

(assert (=> d!56289 (= (apply!182 lt!95288 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)) (get!2220 (getValueByKey!240 (toList!1214 lt!95288) (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7685 () Bool)

(assert (= bs!7685 d!56289))

(assert (=> bs!7685 m!218399))

(assert (=> bs!7685 m!218575))

(assert (=> bs!7685 m!218575))

(declare-fun m!218631 () Bool)

(assert (=> bs!7685 m!218631))

(assert (=> b!191717 d!56289))

(declare-fun d!56291 () Bool)

(declare-fun c!34578 () Bool)

(assert (=> d!56291 (= c!34578 ((_ is ValueCellFull!1883) (select (arr!3831 (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000)))))

(declare-fun e!126287 () V!5585)

(assert (=> d!56291 (= (get!2219 (select (arr!3831 (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!126287)))

(declare-fun b!191928 () Bool)

(assert (=> b!191928 (= e!126287 (get!2221 (select (arr!3831 (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191929 () Bool)

(assert (=> b!191929 (= e!126287 (get!2222 (select (arr!3831 (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56291 c!34578) b!191928))

(assert (= (and d!56291 (not c!34578)) b!191929))

(assert (=> b!191928 m!218487))

(assert (=> b!191928 m!218427))

(declare-fun m!218633 () Bool)

(assert (=> b!191928 m!218633))

(assert (=> b!191929 m!218487))

(assert (=> b!191929 m!218427))

(declare-fun m!218635 () Bool)

(assert (=> b!191929 m!218635))

(assert (=> b!191717 d!56291))

(declare-fun d!56293 () Bool)

(declare-fun e!126289 () Bool)

(assert (=> d!56293 e!126289))

(declare-fun res!90692 () Bool)

(assert (=> d!56293 (=> res!90692 e!126289)))

(declare-fun lt!95369 () Bool)

(assert (=> d!56293 (= res!90692 (not lt!95369))))

(declare-fun lt!95371 () Bool)

(assert (=> d!56293 (= lt!95369 lt!95371)))

(declare-fun lt!95368 () Unit!5782)

(declare-fun e!126288 () Unit!5782)

(assert (=> d!56293 (= lt!95368 e!126288)))

(declare-fun c!34579 () Bool)

(assert (=> d!56293 (= c!34579 lt!95371)))

(assert (=> d!56293 (= lt!95371 (containsKey!243 (toList!1214 lt!95288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56293 (= (contains!1340 lt!95288 #b0000000000000000000000000000000000000000000000000000000000000000) lt!95369)))

(declare-fun b!191930 () Bool)

(declare-fun lt!95370 () Unit!5782)

(assert (=> b!191930 (= e!126288 lt!95370)))

(assert (=> b!191930 (= lt!95370 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 lt!95288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191930 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95288) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191931 () Bool)

(declare-fun Unit!5790 () Unit!5782)

(assert (=> b!191931 (= e!126288 Unit!5790)))

(declare-fun b!191932 () Bool)

(assert (=> b!191932 (= e!126289 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95288) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56293 c!34579) b!191930))

(assert (= (and d!56293 (not c!34579)) b!191931))

(assert (= (and d!56293 (not res!90692)) b!191932))

(declare-fun m!218637 () Bool)

(assert (=> d!56293 m!218637))

(declare-fun m!218639 () Bool)

(assert (=> b!191930 m!218639))

(declare-fun m!218641 () Bool)

(assert (=> b!191930 m!218641))

(assert (=> b!191930 m!218641))

(declare-fun m!218643 () Bool)

(assert (=> b!191930 m!218643))

(assert (=> b!191932 m!218641))

(assert (=> b!191932 m!218641))

(assert (=> b!191932 m!218643))

(assert (=> bm!19341 d!56293))

(declare-fun d!56295 () Bool)

(declare-fun e!126291 () Bool)

(assert (=> d!56295 e!126291))

(declare-fun res!90693 () Bool)

(assert (=> d!56295 (=> res!90693 e!126291)))

(declare-fun lt!95373 () Bool)

(assert (=> d!56295 (= res!90693 (not lt!95373))))

(declare-fun lt!95375 () Bool)

(assert (=> d!56295 (= lt!95373 lt!95375)))

(declare-fun lt!95372 () Unit!5782)

(declare-fun e!126290 () Unit!5782)

(assert (=> d!56295 (= lt!95372 e!126290)))

(declare-fun c!34580 () Bool)

(assert (=> d!56295 (= c!34580 lt!95375)))

(assert (=> d!56295 (= lt!95375 (containsKey!243 (toList!1214 lt!95254) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56295 (= (contains!1340 lt!95254 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95373)))

(declare-fun b!191933 () Bool)

(declare-fun lt!95374 () Unit!5782)

(assert (=> b!191933 (= e!126290 lt!95374)))

(assert (=> b!191933 (= lt!95374 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 lt!95254) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!191933 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95254) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191934 () Bool)

(declare-fun Unit!5791 () Unit!5782)

(assert (=> b!191934 (= e!126290 Unit!5791)))

(declare-fun b!191935 () Bool)

(assert (=> b!191935 (= e!126291 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56295 c!34580) b!191933))

(assert (= (and d!56295 (not c!34580)) b!191934))

(assert (= (and d!56295 (not res!90693)) b!191935))

(declare-fun m!218645 () Bool)

(assert (=> d!56295 m!218645))

(declare-fun m!218647 () Bool)

(assert (=> b!191933 m!218647))

(declare-fun m!218649 () Bool)

(assert (=> b!191933 m!218649))

(assert (=> b!191933 m!218649))

(declare-fun m!218651 () Bool)

(assert (=> b!191933 m!218651))

(assert (=> b!191935 m!218649))

(assert (=> b!191935 m!218649))

(assert (=> b!191935 m!218651))

(assert (=> bm!19332 d!56295))

(declare-fun d!56297 () Bool)

(assert (=> d!56297 (= (apply!182 lt!95254 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2220 (getValueByKey!240 (toList!1214 lt!95254) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7686 () Bool)

(assert (= bs!7686 d!56297))

(assert (=> bs!7686 m!218601))

(assert (=> bs!7686 m!218601))

(declare-fun m!218653 () Bool)

(assert (=> bs!7686 m!218653))

(assert (=> b!191693 d!56297))

(declare-fun d!56299 () Bool)

(assert (=> d!56299 (= (+!307 (getCurrentListMap!866 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) (tuple2!3477 key!828 v!309)) (getCurrentListMap!866 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)))))

(assert (=> d!56299 true))

(declare-fun _$5!152 () Unit!5782)

(assert (=> d!56299 (= (choose!1044 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (index!4839 lt!95147) key!828 v!309 (defaultEntry!3909 thiss!1248)) _$5!152)))

(declare-fun bs!7687 () Bool)

(assert (= bs!7687 d!56299))

(assert (=> bs!7687 m!218275))

(assert (=> bs!7687 m!218275))

(assert (=> bs!7687 m!218497))

(assert (=> bs!7687 m!218277))

(assert (=> bs!7687 m!218269))

(assert (=> d!56239 d!56299))

(assert (=> d!56239 d!56237))

(declare-fun d!56301 () Bool)

(declare-fun e!126305 () Bool)

(assert (=> d!56301 e!126305))

(declare-fun c!34588 () Bool)

(declare-fun lt!95380 () SeekEntryResult!667)

(assert (=> d!56301 (= c!34588 (and ((_ is Intermediate!667) lt!95380) (undefined!1479 lt!95380)))))

(declare-fun e!126302 () SeekEntryResult!667)

(assert (=> d!56301 (= lt!95380 e!126302)))

(declare-fun c!34587 () Bool)

(assert (=> d!56301 (= c!34587 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!95381 () (_ BitVec 64))

(assert (=> d!56301 (= lt!95381 (select (arr!3830 (_keys!5887 thiss!1248)) (toIndex!0 key!828 (mask!9130 thiss!1248))))))

(assert (=> d!56301 (validMask!0 (mask!9130 thiss!1248))))

(assert (=> d!56301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9130 thiss!1248)) key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)) lt!95380)))

(declare-fun b!191954 () Bool)

(assert (=> b!191954 (and (bvsge (index!4840 lt!95380) #b00000000000000000000000000000000) (bvslt (index!4840 lt!95380) (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun res!90700 () Bool)

(assert (=> b!191954 (= res!90700 (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4840 lt!95380)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!126306 () Bool)

(assert (=> b!191954 (=> res!90700 e!126306)))

(declare-fun b!191955 () Bool)

(assert (=> b!191955 (and (bvsge (index!4840 lt!95380) #b00000000000000000000000000000000) (bvslt (index!4840 lt!95380) (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun res!90702 () Bool)

(assert (=> b!191955 (= res!90702 (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4840 lt!95380)) key!828))))

(assert (=> b!191955 (=> res!90702 e!126306)))

(declare-fun e!126303 () Bool)

(assert (=> b!191955 (= e!126303 e!126306)))

(declare-fun b!191956 () Bool)

(assert (=> b!191956 (= e!126302 (Intermediate!667 true (toIndex!0 key!828 (mask!9130 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!191957 () Bool)

(declare-fun e!126304 () SeekEntryResult!667)

(assert (=> b!191957 (= e!126304 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!9130 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9130 thiss!1248)) key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(declare-fun b!191958 () Bool)

(assert (=> b!191958 (= e!126305 (bvsge (x!20539 lt!95380) #b01111111111111111111111111111110))))

(declare-fun b!191959 () Bool)

(assert (=> b!191959 (= e!126302 e!126304)))

(declare-fun c!34589 () Bool)

(assert (=> b!191959 (= c!34589 (or (= lt!95381 key!828) (= (bvadd lt!95381 lt!95381) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!191960 () Bool)

(assert (=> b!191960 (and (bvsge (index!4840 lt!95380) #b00000000000000000000000000000000) (bvslt (index!4840 lt!95380) (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> b!191960 (= e!126306 (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4840 lt!95380)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!191961 () Bool)

(assert (=> b!191961 (= e!126304 (Intermediate!667 false (toIndex!0 key!828 (mask!9130 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!191962 () Bool)

(assert (=> b!191962 (= e!126305 e!126303)))

(declare-fun res!90701 () Bool)

(assert (=> b!191962 (= res!90701 (and ((_ is Intermediate!667) lt!95380) (not (undefined!1479 lt!95380)) (bvslt (x!20539 lt!95380) #b01111111111111111111111111111110) (bvsge (x!20539 lt!95380) #b00000000000000000000000000000000) (bvsge (x!20539 lt!95380) #b00000000000000000000000000000000)))))

(assert (=> b!191962 (=> (not res!90701) (not e!126303))))

(assert (= (and d!56301 c!34587) b!191956))

(assert (= (and d!56301 (not c!34587)) b!191959))

(assert (= (and b!191959 c!34589) b!191961))

(assert (= (and b!191959 (not c!34589)) b!191957))

(assert (= (and d!56301 c!34588) b!191958))

(assert (= (and d!56301 (not c!34588)) b!191962))

(assert (= (and b!191962 res!90701) b!191955))

(assert (= (and b!191955 (not res!90702)) b!191954))

(assert (= (and b!191954 (not res!90700)) b!191960))

(declare-fun m!218655 () Bool)

(assert (=> b!191954 m!218655))

(assert (=> b!191955 m!218655))

(assert (=> b!191957 m!218511))

(declare-fun m!218657 () Bool)

(assert (=> b!191957 m!218657))

(assert (=> b!191957 m!218657))

(declare-fun m!218659 () Bool)

(assert (=> b!191957 m!218659))

(assert (=> d!56301 m!218511))

(declare-fun m!218661 () Bool)

(assert (=> d!56301 m!218661))

(assert (=> d!56301 m!218281))

(assert (=> b!191960 m!218655))

(assert (=> d!56243 d!56301))

(declare-fun d!56303 () Bool)

(declare-fun lt!95387 () (_ BitVec 32))

(declare-fun lt!95386 () (_ BitVec 32))

(assert (=> d!56303 (= lt!95387 (bvmul (bvxor lt!95386 (bvlshr lt!95386 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!56303 (= lt!95386 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!56303 (and (bvsge (mask!9130 thiss!1248) #b00000000000000000000000000000000) (let ((res!90703 (let ((h!3024 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20556 (bvmul (bvxor h!3024 (bvlshr h!3024 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20556 (bvlshr x!20556 #b00000000000000000000000000001101)) (mask!9130 thiss!1248)))))) (and (bvslt res!90703 (bvadd (mask!9130 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!90703 #b00000000000000000000000000000000))))))

(assert (=> d!56303 (= (toIndex!0 key!828 (mask!9130 thiss!1248)) (bvand (bvxor lt!95387 (bvlshr lt!95387 #b00000000000000000000000000001101)) (mask!9130 thiss!1248)))))

(assert (=> d!56243 d!56303))

(assert (=> d!56243 d!56237))

(assert (=> b!191729 d!56277))

(declare-fun d!56305 () Bool)

(declare-fun res!90708 () Bool)

(declare-fun e!126311 () Bool)

(assert (=> d!56305 (=> res!90708 e!126311)))

(assert (=> d!56305 (= res!90708 (= (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!56305 (= (arrayContainsKey!0 (_keys!5887 thiss!1248) key!828 #b00000000000000000000000000000000) e!126311)))

(declare-fun b!191967 () Bool)

(declare-fun e!126312 () Bool)

(assert (=> b!191967 (= e!126311 e!126312)))

(declare-fun res!90709 () Bool)

(assert (=> b!191967 (=> (not res!90709) (not e!126312))))

(assert (=> b!191967 (= res!90709 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!191968 () Bool)

(assert (=> b!191968 (= e!126312 (arrayContainsKey!0 (_keys!5887 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!56305 (not res!90708)) b!191967))

(assert (= (and b!191967 res!90709) b!191968))

(assert (=> d!56305 m!218399))

(declare-fun m!218663 () Bool)

(assert (=> b!191968 m!218663))

(assert (=> bm!19347 d!56305))

(assert (=> d!56235 d!56237))

(declare-fun d!56307 () Bool)

(declare-fun e!126313 () Bool)

(assert (=> d!56307 e!126313))

(declare-fun res!90711 () Bool)

(assert (=> d!56307 (=> (not res!90711) (not e!126313))))

(declare-fun lt!95390 () ListLongMap!2397)

(assert (=> d!56307 (= res!90711 (contains!1340 lt!95390 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95391 () List!2387)

(assert (=> d!56307 (= lt!95390 (ListLongMap!2398 lt!95391))))

(declare-fun lt!95388 () Unit!5782)

(declare-fun lt!95389 () Unit!5782)

(assert (=> d!56307 (= lt!95388 lt!95389)))

(assert (=> d!56307 (= (getValueByKey!240 lt!95391 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56307 (= lt!95389 (lemmaContainsTupThenGetReturnValue!127 lt!95391 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56307 (= lt!95391 (insertStrictlySorted!130 (toList!1214 call!19333) (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56307 (= (+!307 call!19333 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) lt!95390)))

(declare-fun b!191969 () Bool)

(declare-fun res!90710 () Bool)

(assert (=> b!191969 (=> (not res!90710) (not e!126313))))

(assert (=> b!191969 (= res!90710 (= (getValueByKey!240 (toList!1214 lt!95390) (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(declare-fun b!191970 () Bool)

(assert (=> b!191970 (= e!126313 (contains!1341 (toList!1214 lt!95390) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))

(assert (= (and d!56307 res!90711) b!191969))

(assert (= (and b!191969 res!90710) b!191970))

(declare-fun m!218665 () Bool)

(assert (=> d!56307 m!218665))

(declare-fun m!218667 () Bool)

(assert (=> d!56307 m!218667))

(declare-fun m!218669 () Bool)

(assert (=> d!56307 m!218669))

(declare-fun m!218671 () Bool)

(assert (=> d!56307 m!218671))

(declare-fun m!218673 () Bool)

(assert (=> b!191969 m!218673))

(declare-fun m!218675 () Bool)

(assert (=> b!191970 m!218675))

(assert (=> b!191694 d!56307))

(declare-fun d!56309 () Bool)

(assert (=> d!56309 (= (inRange!0 (index!4839 lt!95324) (mask!9130 thiss!1248)) (and (bvsge (index!4839 lt!95324) #b00000000000000000000000000000000) (bvslt (index!4839 lt!95324) (bvadd (mask!9130 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!191788 d!56309))

(declare-fun b!191971 () Bool)

(declare-fun e!126314 () Option!246)

(assert (=> b!191971 (= e!126314 (Some!245 (_2!1749 (h!3022 (toList!1214 lt!95199)))))))

(declare-fun d!56311 () Bool)

(declare-fun c!34590 () Bool)

(assert (=> d!56311 (= c!34590 (and ((_ is Cons!2383) (toList!1214 lt!95199)) (= (_1!1749 (h!3022 (toList!1214 lt!95199))) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(assert (=> d!56311 (= (getValueByKey!240 (toList!1214 lt!95199) (_1!1749 (tuple2!3477 key!828 v!309))) e!126314)))

(declare-fun b!191972 () Bool)

(declare-fun e!126315 () Option!246)

(assert (=> b!191972 (= e!126314 e!126315)))

(declare-fun c!34591 () Bool)

(assert (=> b!191972 (= c!34591 (and ((_ is Cons!2383) (toList!1214 lt!95199)) (not (= (_1!1749 (h!3022 (toList!1214 lt!95199))) (_1!1749 (tuple2!3477 key!828 v!309))))))))

(declare-fun b!191973 () Bool)

(assert (=> b!191973 (= e!126315 (getValueByKey!240 (t!7293 (toList!1214 lt!95199)) (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!191974 () Bool)

(assert (=> b!191974 (= e!126315 None!244)))

(assert (= (and d!56311 c!34590) b!191971))

(assert (= (and d!56311 (not c!34590)) b!191972))

(assert (= (and b!191972 c!34591) b!191973))

(assert (= (and b!191972 (not c!34591)) b!191974))

(declare-fun m!218677 () Bool)

(assert (=> b!191973 m!218677))

(assert (=> b!191633 d!56311))

(declare-fun b!191999 () Bool)

(declare-fun lt!95407 () Unit!5782)

(declare-fun lt!95411 () Unit!5782)

(assert (=> b!191999 (= lt!95407 lt!95411)))

(declare-fun lt!95412 () ListLongMap!2397)

(declare-fun lt!95406 () (_ BitVec 64))

(declare-fun lt!95408 () (_ BitVec 64))

(declare-fun lt!95409 () V!5585)

(assert (=> b!191999 (not (contains!1340 (+!307 lt!95412 (tuple2!3477 lt!95406 lt!95409)) lt!95408))))

(declare-fun addStillNotContains!97 (ListLongMap!2397 (_ BitVec 64) V!5585 (_ BitVec 64)) Unit!5782)

(assert (=> b!191999 (= lt!95411 (addStillNotContains!97 lt!95412 lt!95406 lt!95409 lt!95408))))

(assert (=> b!191999 (= lt!95408 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!191999 (= lt!95409 (get!2219 (select (arr!3831 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191999 (= lt!95406 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!19368 () ListLongMap!2397)

(assert (=> b!191999 (= lt!95412 call!19368)))

(declare-fun e!126330 () ListLongMap!2397)

(assert (=> b!191999 (= e!126330 (+!307 call!19368 (tuple2!3477 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000) (get!2219 (select (arr!3831 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!192000 () Bool)

(declare-fun e!126336 () Bool)

(assert (=> b!192000 (= e!126336 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192000 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!192001 () Bool)

(declare-fun e!126332 () Bool)

(declare-fun lt!95410 () ListLongMap!2397)

(assert (=> b!192001 (= e!126332 (= lt!95410 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3909 thiss!1248))))))

(declare-fun d!56313 () Bool)

(declare-fun e!126335 () Bool)

(assert (=> d!56313 e!126335))

(declare-fun res!90723 () Bool)

(assert (=> d!56313 (=> (not res!90723) (not e!126335))))

(assert (=> d!56313 (= res!90723 (not (contains!1340 lt!95410 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!126331 () ListLongMap!2397)

(assert (=> d!56313 (= lt!95410 e!126331)))

(declare-fun c!34601 () Bool)

(assert (=> d!56313 (= c!34601 (bvsge #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> d!56313 (validMask!0 (mask!9130 thiss!1248))))

(assert (=> d!56313 (= (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) lt!95410)))

(declare-fun b!192002 () Bool)

(declare-fun e!126333 () Bool)

(declare-fun e!126334 () Bool)

(assert (=> b!192002 (= e!126333 e!126334)))

(assert (=> b!192002 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun res!90720 () Bool)

(assert (=> b!192002 (= res!90720 (contains!1340 lt!95410 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192002 (=> (not res!90720) (not e!126334))))

(declare-fun b!192003 () Bool)

(assert (=> b!192003 (= e!126331 (ListLongMap!2398 Nil!2384))))

(declare-fun b!192004 () Bool)

(assert (=> b!192004 (= e!126331 e!126330)))

(declare-fun c!34602 () Bool)

(assert (=> b!192004 (= c!34602 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192005 () Bool)

(assert (=> b!192005 (= e!126330 call!19368)))

(declare-fun b!192006 () Bool)

(assert (=> b!192006 (= e!126335 e!126333)))

(declare-fun c!34600 () Bool)

(assert (=> b!192006 (= c!34600 e!126336)))

(declare-fun res!90721 () Bool)

(assert (=> b!192006 (=> (not res!90721) (not e!126336))))

(assert (=> b!192006 (= res!90721 (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!192007 () Bool)

(assert (=> b!192007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> b!192007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4153 (_values!3892 thiss!1248))))))

(assert (=> b!192007 (= e!126334 (= (apply!182 lt!95410 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)) (get!2219 (select (arr!3831 (_values!3892 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!19365 () Bool)

(assert (=> bm!19365 (= call!19368 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3909 thiss!1248)))))

(declare-fun b!192008 () Bool)

(declare-fun res!90722 () Bool)

(assert (=> b!192008 (=> (not res!90722) (not e!126335))))

(assert (=> b!192008 (= res!90722 (not (contains!1340 lt!95410 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192009 () Bool)

(assert (=> b!192009 (= e!126333 e!126332)))

(declare-fun c!34603 () Bool)

(assert (=> b!192009 (= c!34603 (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!192010 () Bool)

(declare-fun isEmpty!490 (ListLongMap!2397) Bool)

(assert (=> b!192010 (= e!126332 (isEmpty!490 lt!95410))))

(assert (= (and d!56313 c!34601) b!192003))

(assert (= (and d!56313 (not c!34601)) b!192004))

(assert (= (and b!192004 c!34602) b!191999))

(assert (= (and b!192004 (not c!34602)) b!192005))

(assert (= (or b!191999 b!192005) bm!19365))

(assert (= (and d!56313 res!90723) b!192008))

(assert (= (and b!192008 res!90722) b!192006))

(assert (= (and b!192006 res!90721) b!192000))

(assert (= (and b!192006 c!34600) b!192002))

(assert (= (and b!192006 (not c!34600)) b!192009))

(assert (= (and b!192002 res!90720) b!192007))

(assert (= (and b!192009 c!34603) b!192001))

(assert (= (and b!192009 (not c!34603)) b!192010))

(declare-fun b_lambda!7429 () Bool)

(assert (=> (not b_lambda!7429) (not b!191999)))

(assert (=> b!191999 t!7295))

(declare-fun b_and!11379 () Bool)

(assert (= b_and!11377 (and (=> t!7295 result!4895) b_and!11379)))

(declare-fun b_lambda!7431 () Bool)

(assert (=> (not b_lambda!7431) (not b!192007)))

(assert (=> b!192007 t!7295))

(declare-fun b_and!11381 () Bool)

(assert (= b_and!11379 (and (=> t!7295 result!4895) b_and!11381)))

(assert (=> b!192004 m!218399))

(assert (=> b!192004 m!218399))

(assert (=> b!192004 m!218417))

(declare-fun m!218679 () Bool)

(assert (=> b!192001 m!218679))

(assert (=> b!192007 m!218399))

(assert (=> b!192007 m!218425))

(assert (=> b!192007 m!218427))

(assert (=> b!192007 m!218429))

(assert (=> b!192007 m!218427))

(assert (=> b!192007 m!218399))

(declare-fun m!218681 () Bool)

(assert (=> b!192007 m!218681))

(assert (=> b!192007 m!218425))

(assert (=> b!192002 m!218399))

(assert (=> b!192002 m!218399))

(declare-fun m!218683 () Bool)

(assert (=> b!192002 m!218683))

(declare-fun m!218685 () Bool)

(assert (=> b!192008 m!218685))

(declare-fun m!218687 () Bool)

(assert (=> b!192010 m!218687))

(declare-fun m!218689 () Bool)

(assert (=> d!56313 m!218689))

(assert (=> d!56313 m!218281))

(assert (=> bm!19365 m!218679))

(assert (=> b!192000 m!218399))

(assert (=> b!192000 m!218399))

(assert (=> b!192000 m!218417))

(declare-fun m!218691 () Bool)

(assert (=> b!191999 m!218691))

(assert (=> b!191999 m!218399))

(assert (=> b!191999 m!218425))

(assert (=> b!191999 m!218427))

(assert (=> b!191999 m!218429))

(assert (=> b!191999 m!218427))

(declare-fun m!218693 () Bool)

(assert (=> b!191999 m!218693))

(declare-fun m!218695 () Bool)

(assert (=> b!191999 m!218695))

(declare-fun m!218697 () Bool)

(assert (=> b!191999 m!218697))

(assert (=> b!191999 m!218425))

(assert (=> b!191999 m!218693))

(assert (=> b!191678 d!56313))

(declare-fun d!56315 () Bool)

(declare-fun e!126337 () Bool)

(assert (=> d!56315 e!126337))

(declare-fun res!90725 () Bool)

(assert (=> d!56315 (=> (not res!90725) (not e!126337))))

(declare-fun lt!95415 () ListLongMap!2397)

(assert (=> d!56315 (= res!90725 (contains!1340 lt!95415 (_1!1749 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95416 () List!2387)

(assert (=> d!56315 (= lt!95415 (ListLongMap!2398 lt!95416))))

(declare-fun lt!95413 () Unit!5782)

(declare-fun lt!95414 () Unit!5782)

(assert (=> d!56315 (= lt!95413 lt!95414)))

(assert (=> d!56315 (= (getValueByKey!240 lt!95416 (_1!1749 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248)))))))

(assert (=> d!56315 (= lt!95414 (lemmaContainsTupThenGetReturnValue!127 lt!95416 (_1!1749 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248)))))))

(assert (=> d!56315 (= lt!95416 (insertStrictlySorted!130 (toList!1214 lt!95245) (_1!1749 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248)))))))

(assert (=> d!56315 (= (+!307 lt!95245 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248))) lt!95415)))

(declare-fun b!192011 () Bool)

(declare-fun res!90724 () Bool)

(assert (=> b!192011 (=> (not res!90724) (not e!126337))))

(assert (=> b!192011 (= res!90724 (= (getValueByKey!240 (toList!1214 lt!95415) (_1!1749 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248))))))))

(declare-fun b!192012 () Bool)

(assert (=> b!192012 (= e!126337 (contains!1341 (toList!1214 lt!95415) (tuple2!3477 lt!95247 (minValue!3750 thiss!1248))))))

(assert (= (and d!56315 res!90725) b!192011))

(assert (= (and b!192011 res!90724) b!192012))

(declare-fun m!218699 () Bool)

(assert (=> d!56315 m!218699))

(declare-fun m!218701 () Bool)

(assert (=> d!56315 m!218701))

(declare-fun m!218703 () Bool)

(assert (=> d!56315 m!218703))

(declare-fun m!218705 () Bool)

(assert (=> d!56315 m!218705))

(declare-fun m!218707 () Bool)

(assert (=> b!192011 m!218707))

(declare-fun m!218709 () Bool)

(assert (=> b!192012 m!218709))

(assert (=> b!191678 d!56315))

(declare-fun d!56317 () Bool)

(assert (=> d!56317 (= (apply!182 lt!95256 lt!95265) (get!2220 (getValueByKey!240 (toList!1214 lt!95256) lt!95265)))))

(declare-fun bs!7688 () Bool)

(assert (= bs!7688 d!56317))

(declare-fun m!218711 () Bool)

(assert (=> bs!7688 m!218711))

(assert (=> bs!7688 m!218711))

(declare-fun m!218713 () Bool)

(assert (=> bs!7688 m!218713))

(assert (=> b!191678 d!56317))

(declare-fun d!56319 () Bool)

(assert (=> d!56319 (= (apply!182 (+!307 lt!95245 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248))) lt!95248) (get!2220 (getValueByKey!240 (toList!1214 (+!307 lt!95245 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248)))) lt!95248)))))

(declare-fun bs!7689 () Bool)

(assert (= bs!7689 d!56319))

(declare-fun m!218715 () Bool)

(assert (=> bs!7689 m!218715))

(assert (=> bs!7689 m!218715))

(declare-fun m!218717 () Bool)

(assert (=> bs!7689 m!218717))

(assert (=> b!191678 d!56319))

(declare-fun d!56321 () Bool)

(assert (=> d!56321 (= (apply!182 lt!95245 lt!95248) (get!2220 (getValueByKey!240 (toList!1214 lt!95245) lt!95248)))))

(declare-fun bs!7690 () Bool)

(assert (= bs!7690 d!56321))

(declare-fun m!218719 () Bool)

(assert (=> bs!7690 m!218719))

(assert (=> bs!7690 m!218719))

(declare-fun m!218721 () Bool)

(assert (=> bs!7690 m!218721))

(assert (=> b!191678 d!56321))

(declare-fun d!56323 () Bool)

(declare-fun e!126338 () Bool)

(assert (=> d!56323 e!126338))

(declare-fun res!90727 () Bool)

(assert (=> d!56323 (=> (not res!90727) (not e!126338))))

(declare-fun lt!95419 () ListLongMap!2397)

(assert (=> d!56323 (= res!90727 (contains!1340 lt!95419 (_1!1749 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248)))))))

(declare-fun lt!95420 () List!2387)

(assert (=> d!56323 (= lt!95419 (ListLongMap!2398 lt!95420))))

(declare-fun lt!95417 () Unit!5782)

(declare-fun lt!95418 () Unit!5782)

(assert (=> d!56323 (= lt!95417 lt!95418)))

(assert (=> d!56323 (= (getValueByKey!240 lt!95420 (_1!1749 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56323 (= lt!95418 (lemmaContainsTupThenGetReturnValue!127 lt!95420 (_1!1749 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56323 (= lt!95420 (insertStrictlySorted!130 (toList!1214 lt!95256) (_1!1749 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56323 (= (+!307 lt!95256 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248))) lt!95419)))

(declare-fun b!192013 () Bool)

(declare-fun res!90726 () Bool)

(assert (=> b!192013 (=> (not res!90726) (not e!126338))))

(assert (=> b!192013 (= res!90726 (= (getValueByKey!240 (toList!1214 lt!95419) (_1!1749 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248))))))))

(declare-fun b!192014 () Bool)

(assert (=> b!192014 (= e!126338 (contains!1341 (toList!1214 lt!95419) (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248))))))

(assert (= (and d!56323 res!90727) b!192013))

(assert (= (and b!192013 res!90726) b!192014))

(declare-fun m!218723 () Bool)

(assert (=> d!56323 m!218723))

(declare-fun m!218725 () Bool)

(assert (=> d!56323 m!218725))

(declare-fun m!218727 () Bool)

(assert (=> d!56323 m!218727))

(declare-fun m!218729 () Bool)

(assert (=> d!56323 m!218729))

(declare-fun m!218731 () Bool)

(assert (=> b!192013 m!218731))

(declare-fun m!218733 () Bool)

(assert (=> b!192014 m!218733))

(assert (=> b!191678 d!56323))

(declare-fun d!56325 () Bool)

(declare-fun e!126340 () Bool)

(assert (=> d!56325 e!126340))

(declare-fun res!90728 () Bool)

(assert (=> d!56325 (=> res!90728 e!126340)))

(declare-fun lt!95422 () Bool)

(assert (=> d!56325 (= res!90728 (not lt!95422))))

(declare-fun lt!95424 () Bool)

(assert (=> d!56325 (= lt!95422 lt!95424)))

(declare-fun lt!95421 () Unit!5782)

(declare-fun e!126339 () Unit!5782)

(assert (=> d!56325 (= lt!95421 e!126339)))

(declare-fun c!34604 () Bool)

(assert (=> d!56325 (= c!34604 lt!95424)))

(assert (=> d!56325 (= lt!95424 (containsKey!243 (toList!1214 (+!307 lt!95252 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248)))) lt!95249))))

(assert (=> d!56325 (= (contains!1340 (+!307 lt!95252 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248))) lt!95249) lt!95422)))

(declare-fun b!192015 () Bool)

(declare-fun lt!95423 () Unit!5782)

(assert (=> b!192015 (= e!126339 lt!95423)))

(assert (=> b!192015 (= lt!95423 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 (+!307 lt!95252 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248)))) lt!95249))))

(assert (=> b!192015 (isDefined!192 (getValueByKey!240 (toList!1214 (+!307 lt!95252 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248)))) lt!95249))))

(declare-fun b!192016 () Bool)

(declare-fun Unit!5792 () Unit!5782)

(assert (=> b!192016 (= e!126339 Unit!5792)))

(declare-fun b!192017 () Bool)

(assert (=> b!192017 (= e!126340 (isDefined!192 (getValueByKey!240 (toList!1214 (+!307 lt!95252 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248)))) lt!95249)))))

(assert (= (and d!56325 c!34604) b!192015))

(assert (= (and d!56325 (not c!34604)) b!192016))

(assert (= (and d!56325 (not res!90728)) b!192017))

(declare-fun m!218735 () Bool)

(assert (=> d!56325 m!218735))

(declare-fun m!218737 () Bool)

(assert (=> b!192015 m!218737))

(declare-fun m!218739 () Bool)

(assert (=> b!192015 m!218739))

(assert (=> b!192015 m!218739))

(declare-fun m!218741 () Bool)

(assert (=> b!192015 m!218741))

(assert (=> b!192017 m!218739))

(assert (=> b!192017 m!218739))

(assert (=> b!192017 m!218741))

(assert (=> b!191678 d!56325))

(declare-fun d!56327 () Bool)

(assert (=> d!56327 (= (apply!182 (+!307 lt!95256 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248))) lt!95265) (apply!182 lt!95256 lt!95265))))

(declare-fun lt!95427 () Unit!5782)

(declare-fun choose!1048 (ListLongMap!2397 (_ BitVec 64) V!5585 (_ BitVec 64)) Unit!5782)

(assert (=> d!56327 (= lt!95427 (choose!1048 lt!95256 lt!95258 (zeroValue!3750 thiss!1248) lt!95265))))

(declare-fun e!126343 () Bool)

(assert (=> d!56327 e!126343))

(declare-fun res!90731 () Bool)

(assert (=> d!56327 (=> (not res!90731) (not e!126343))))

(assert (=> d!56327 (= res!90731 (contains!1340 lt!95256 lt!95265))))

(assert (=> d!56327 (= (addApplyDifferent!158 lt!95256 lt!95258 (zeroValue!3750 thiss!1248) lt!95265) lt!95427)))

(declare-fun b!192021 () Bool)

(assert (=> b!192021 (= e!126343 (not (= lt!95265 lt!95258)))))

(assert (= (and d!56327 res!90731) b!192021))

(declare-fun m!218743 () Bool)

(assert (=> d!56327 m!218743))

(assert (=> d!56327 m!218407))

(assert (=> d!56327 m!218407))

(assert (=> d!56327 m!218409))

(declare-fun m!218745 () Bool)

(assert (=> d!56327 m!218745))

(assert (=> d!56327 m!218391))

(assert (=> b!191678 d!56327))

(declare-fun d!56329 () Bool)

(declare-fun e!126344 () Bool)

(assert (=> d!56329 e!126344))

(declare-fun res!90733 () Bool)

(assert (=> d!56329 (=> (not res!90733) (not e!126344))))

(declare-fun lt!95430 () ListLongMap!2397)

(assert (=> d!56329 (= res!90733 (contains!1340 lt!95430 (_1!1749 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95431 () List!2387)

(assert (=> d!56329 (= lt!95430 (ListLongMap!2398 lt!95431))))

(declare-fun lt!95428 () Unit!5782)

(declare-fun lt!95429 () Unit!5782)

(assert (=> d!56329 (= lt!95428 lt!95429)))

(assert (=> d!56329 (= (getValueByKey!240 lt!95431 (_1!1749 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248)))))))

(assert (=> d!56329 (= lt!95429 (lemmaContainsTupThenGetReturnValue!127 lt!95431 (_1!1749 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248)))))))

(assert (=> d!56329 (= lt!95431 (insertStrictlySorted!130 (toList!1214 lt!95246) (_1!1749 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248)))))))

(assert (=> d!56329 (= (+!307 lt!95246 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248))) lt!95430)))

(declare-fun b!192022 () Bool)

(declare-fun res!90732 () Bool)

(assert (=> b!192022 (=> (not res!90732) (not e!126344))))

(assert (=> b!192022 (= res!90732 (= (getValueByKey!240 (toList!1214 lt!95430) (_1!1749 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248))))))))

(declare-fun b!192023 () Bool)

(assert (=> b!192023 (= e!126344 (contains!1341 (toList!1214 lt!95430) (tuple2!3477 lt!95250 (minValue!3750 thiss!1248))))))

(assert (= (and d!56329 res!90733) b!192022))

(assert (= (and b!192022 res!90732) b!192023))

(declare-fun m!218747 () Bool)

(assert (=> d!56329 m!218747))

(declare-fun m!218749 () Bool)

(assert (=> d!56329 m!218749))

(declare-fun m!218751 () Bool)

(assert (=> d!56329 m!218751))

(declare-fun m!218753 () Bool)

(assert (=> d!56329 m!218753))

(declare-fun m!218755 () Bool)

(assert (=> b!192022 m!218755))

(declare-fun m!218757 () Bool)

(assert (=> b!192023 m!218757))

(assert (=> b!191678 d!56329))

(declare-fun d!56331 () Bool)

(declare-fun e!126345 () Bool)

(assert (=> d!56331 e!126345))

(declare-fun res!90735 () Bool)

(assert (=> d!56331 (=> (not res!90735) (not e!126345))))

(declare-fun lt!95434 () ListLongMap!2397)

(assert (=> d!56331 (= res!90735 (contains!1340 lt!95434 (_1!1749 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248)))))))

(declare-fun lt!95435 () List!2387)

(assert (=> d!56331 (= lt!95434 (ListLongMap!2398 lt!95435))))

(declare-fun lt!95432 () Unit!5782)

(declare-fun lt!95433 () Unit!5782)

(assert (=> d!56331 (= lt!95432 lt!95433)))

(assert (=> d!56331 (= (getValueByKey!240 lt!95435 (_1!1749 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56331 (= lt!95433 (lemmaContainsTupThenGetReturnValue!127 lt!95435 (_1!1749 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56331 (= lt!95435 (insertStrictlySorted!130 (toList!1214 lt!95252) (_1!1749 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56331 (= (+!307 lt!95252 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248))) lt!95434)))

(declare-fun b!192024 () Bool)

(declare-fun res!90734 () Bool)

(assert (=> b!192024 (=> (not res!90734) (not e!126345))))

(assert (=> b!192024 (= res!90734 (= (getValueByKey!240 (toList!1214 lt!95434) (_1!1749 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248))))))))

(declare-fun b!192025 () Bool)

(assert (=> b!192025 (= e!126345 (contains!1341 (toList!1214 lt!95434) (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248))))))

(assert (= (and d!56331 res!90735) b!192024))

(assert (= (and b!192024 res!90734) b!192025))

(declare-fun m!218759 () Bool)

(assert (=> d!56331 m!218759))

(declare-fun m!218761 () Bool)

(assert (=> d!56331 m!218761))

(declare-fun m!218763 () Bool)

(assert (=> d!56331 m!218763))

(declare-fun m!218765 () Bool)

(assert (=> d!56331 m!218765))

(declare-fun m!218767 () Bool)

(assert (=> b!192024 m!218767))

(declare-fun m!218769 () Bool)

(assert (=> b!192025 m!218769))

(assert (=> b!191678 d!56331))

(declare-fun d!56333 () Bool)

(assert (=> d!56333 (= (apply!182 (+!307 lt!95246 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248))) lt!95257) (apply!182 lt!95246 lt!95257))))

(declare-fun lt!95436 () Unit!5782)

(assert (=> d!56333 (= lt!95436 (choose!1048 lt!95246 lt!95250 (minValue!3750 thiss!1248) lt!95257))))

(declare-fun e!126346 () Bool)

(assert (=> d!56333 e!126346))

(declare-fun res!90736 () Bool)

(assert (=> d!56333 (=> (not res!90736) (not e!126346))))

(assert (=> d!56333 (= res!90736 (contains!1340 lt!95246 lt!95257))))

(assert (=> d!56333 (= (addApplyDifferent!158 lt!95246 lt!95250 (minValue!3750 thiss!1248) lt!95257) lt!95436)))

(declare-fun b!192026 () Bool)

(assert (=> b!192026 (= e!126346 (not (= lt!95257 lt!95250)))))

(assert (= (and d!56333 res!90736) b!192026))

(declare-fun m!218771 () Bool)

(assert (=> d!56333 m!218771))

(assert (=> d!56333 m!218393))

(assert (=> d!56333 m!218393))

(assert (=> d!56333 m!218395))

(declare-fun m!218773 () Bool)

(assert (=> d!56333 m!218773))

(assert (=> d!56333 m!218401))

(assert (=> b!191678 d!56333))

(declare-fun d!56335 () Bool)

(assert (=> d!56335 (contains!1340 (+!307 lt!95252 (tuple2!3477 lt!95262 (zeroValue!3750 thiss!1248))) lt!95249)))

(declare-fun lt!95439 () Unit!5782)

(declare-fun choose!1049 (ListLongMap!2397 (_ BitVec 64) V!5585 (_ BitVec 64)) Unit!5782)

(assert (=> d!56335 (= lt!95439 (choose!1049 lt!95252 lt!95262 (zeroValue!3750 thiss!1248) lt!95249))))

(assert (=> d!56335 (contains!1340 lt!95252 lt!95249)))

(assert (=> d!56335 (= (addStillContains!158 lt!95252 lt!95262 (zeroValue!3750 thiss!1248) lt!95249) lt!95439)))

(declare-fun bs!7691 () Bool)

(assert (= bs!7691 d!56335))

(assert (=> bs!7691 m!218385))

(assert (=> bs!7691 m!218385))

(assert (=> bs!7691 m!218387))

(declare-fun m!218775 () Bool)

(assert (=> bs!7691 m!218775))

(declare-fun m!218777 () Bool)

(assert (=> bs!7691 m!218777))

(assert (=> b!191678 d!56335))

(declare-fun d!56337 () Bool)

(assert (=> d!56337 (= (apply!182 (+!307 lt!95246 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248))) lt!95257) (get!2220 (getValueByKey!240 (toList!1214 (+!307 lt!95246 (tuple2!3477 lt!95250 (minValue!3750 thiss!1248)))) lt!95257)))))

(declare-fun bs!7692 () Bool)

(assert (= bs!7692 d!56337))

(declare-fun m!218779 () Bool)

(assert (=> bs!7692 m!218779))

(assert (=> bs!7692 m!218779))

(declare-fun m!218781 () Bool)

(assert (=> bs!7692 m!218781))

(assert (=> b!191678 d!56337))

(declare-fun d!56339 () Bool)

(assert (=> d!56339 (= (apply!182 (+!307 lt!95245 (tuple2!3477 lt!95247 (minValue!3750 thiss!1248))) lt!95248) (apply!182 lt!95245 lt!95248))))

(declare-fun lt!95440 () Unit!5782)

(assert (=> d!56339 (= lt!95440 (choose!1048 lt!95245 lt!95247 (minValue!3750 thiss!1248) lt!95248))))

(declare-fun e!126347 () Bool)

(assert (=> d!56339 e!126347))

(declare-fun res!90737 () Bool)

(assert (=> d!56339 (=> (not res!90737) (not e!126347))))

(assert (=> d!56339 (= res!90737 (contains!1340 lt!95245 lt!95248))))

(assert (=> d!56339 (= (addApplyDifferent!158 lt!95245 lt!95247 (minValue!3750 thiss!1248) lt!95248) lt!95440)))

(declare-fun b!192028 () Bool)

(assert (=> b!192028 (= e!126347 (not (= lt!95248 lt!95247)))))

(assert (= (and d!56339 res!90737) b!192028))

(declare-fun m!218783 () Bool)

(assert (=> d!56339 m!218783))

(assert (=> d!56339 m!218381))

(assert (=> d!56339 m!218381))

(assert (=> d!56339 m!218383))

(declare-fun m!218785 () Bool)

(assert (=> d!56339 m!218785))

(assert (=> d!56339 m!218405))

(assert (=> b!191678 d!56339))

(declare-fun d!56341 () Bool)

(assert (=> d!56341 (= (apply!182 lt!95246 lt!95257) (get!2220 (getValueByKey!240 (toList!1214 lt!95246) lt!95257)))))

(declare-fun bs!7693 () Bool)

(assert (= bs!7693 d!56341))

(declare-fun m!218787 () Bool)

(assert (=> bs!7693 m!218787))

(assert (=> bs!7693 m!218787))

(declare-fun m!218789 () Bool)

(assert (=> bs!7693 m!218789))

(assert (=> b!191678 d!56341))

(declare-fun d!56343 () Bool)

(assert (=> d!56343 (= (apply!182 (+!307 lt!95256 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248))) lt!95265) (get!2220 (getValueByKey!240 (toList!1214 (+!307 lt!95256 (tuple2!3477 lt!95258 (zeroValue!3750 thiss!1248)))) lt!95265)))))

(declare-fun bs!7694 () Bool)

(assert (= bs!7694 d!56343))

(declare-fun m!218791 () Bool)

(assert (=> bs!7694 m!218791))

(assert (=> bs!7694 m!218791))

(declare-fun m!218793 () Bool)

(assert (=> bs!7694 m!218793))

(assert (=> b!191678 d!56343))

(declare-fun d!56345 () Bool)

(declare-fun e!126348 () Bool)

(assert (=> d!56345 e!126348))

(declare-fun res!90739 () Bool)

(assert (=> d!56345 (=> (not res!90739) (not e!126348))))

(declare-fun lt!95443 () ListLongMap!2397)

(assert (=> d!56345 (= res!90739 (contains!1340 lt!95443 (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun lt!95444 () List!2387)

(assert (=> d!56345 (= lt!95443 (ListLongMap!2398 lt!95444))))

(declare-fun lt!95441 () Unit!5782)

(declare-fun lt!95442 () Unit!5782)

(assert (=> d!56345 (= lt!95441 lt!95442)))

(assert (=> d!56345 (= (getValueByKey!240 lt!95444 (_1!1749 (tuple2!3477 key!828 v!309))) (Some!245 (_2!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> d!56345 (= lt!95442 (lemmaContainsTupThenGetReturnValue!127 lt!95444 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> d!56345 (= lt!95444 (insertStrictlySorted!130 (toList!1214 (getCurrentListMap!866 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248))) (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> d!56345 (= (+!307 (getCurrentListMap!866 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) (tuple2!3477 key!828 v!309)) lt!95443)))

(declare-fun b!192029 () Bool)

(declare-fun res!90738 () Bool)

(assert (=> b!192029 (=> (not res!90738) (not e!126348))))

(assert (=> b!192029 (= res!90738 (= (getValueByKey!240 (toList!1214 lt!95443) (_1!1749 (tuple2!3477 key!828 v!309))) (Some!245 (_2!1749 (tuple2!3477 key!828 v!309)))))))

(declare-fun b!192030 () Bool)

(assert (=> b!192030 (= e!126348 (contains!1341 (toList!1214 lt!95443) (tuple2!3477 key!828 v!309)))))

(assert (= (and d!56345 res!90739) b!192029))

(assert (= (and b!192029 res!90738) b!192030))

(declare-fun m!218795 () Bool)

(assert (=> d!56345 m!218795))

(declare-fun m!218797 () Bool)

(assert (=> d!56345 m!218797))

(declare-fun m!218799 () Bool)

(assert (=> d!56345 m!218799))

(declare-fun m!218801 () Bool)

(assert (=> d!56345 m!218801))

(declare-fun m!218803 () Bool)

(assert (=> b!192029 m!218803))

(declare-fun m!218805 () Bool)

(assert (=> b!192030 m!218805))

(assert (=> b!191732 d!56345))

(assert (=> b!191732 d!56231))

(assert (=> b!191732 d!56235))

(declare-fun d!56347 () Bool)

(assert (=> d!56347 (= (apply!182 lt!95254 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2220 (getValueByKey!240 (toList!1214 lt!95254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7695 () Bool)

(assert (= bs!7695 d!56347))

(assert (=> bs!7695 m!218649))

(assert (=> bs!7695 m!218649))

(declare-fun m!218807 () Bool)

(assert (=> bs!7695 m!218807))

(assert (=> b!191679 d!56347))

(assert (=> bm!19333 d!56313))

(assert (=> d!56247 d!56243))

(declare-fun d!56349 () Bool)

(declare-fun e!126351 () Bool)

(assert (=> d!56349 e!126351))

(declare-fun res!90744 () Bool)

(assert (=> d!56349 (=> (not res!90744) (not e!126351))))

(declare-fun lt!95447 () SeekEntryResult!667)

(assert (=> d!56349 (= res!90744 ((_ is Found!667) lt!95447))))

(assert (=> d!56349 (= lt!95447 (seekEntryOrOpen!0 key!828 (_keys!5887 thiss!1248) (mask!9130 thiss!1248)))))

(assert (=> d!56349 true))

(declare-fun _$33!144 () Unit!5782)

(assert (=> d!56349 (= (choose!1046 (_keys!5887 thiss!1248) (_values!3892 thiss!1248) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) key!828 (defaultEntry!3909 thiss!1248)) _$33!144)))

(declare-fun b!192035 () Bool)

(declare-fun res!90745 () Bool)

(assert (=> b!192035 (=> (not res!90745) (not e!126351))))

(assert (=> b!192035 (= res!90745 (inRange!0 (index!4839 lt!95447) (mask!9130 thiss!1248)))))

(declare-fun b!192036 () Bool)

(assert (=> b!192036 (= e!126351 (= (select (arr!3830 (_keys!5887 thiss!1248)) (index!4839 lt!95447)) key!828))))

(assert (= (and d!56349 res!90744) b!192035))

(assert (= (and b!192035 res!90745) b!192036))

(assert (=> d!56349 m!218289))

(declare-fun m!218809 () Bool)

(assert (=> b!192035 m!218809))

(declare-fun m!218811 () Bool)

(assert (=> b!192036 m!218811))

(assert (=> d!56247 d!56349))

(assert (=> d!56247 d!56237))

(declare-fun d!56351 () Bool)

(declare-fun e!126353 () Bool)

(assert (=> d!56351 e!126353))

(declare-fun res!90746 () Bool)

(assert (=> d!56351 (=> res!90746 e!126353)))

(declare-fun lt!95449 () Bool)

(assert (=> d!56351 (= res!90746 (not lt!95449))))

(declare-fun lt!95451 () Bool)

(assert (=> d!56351 (= lt!95449 lt!95451)))

(declare-fun lt!95448 () Unit!5782)

(declare-fun e!126352 () Unit!5782)

(assert (=> d!56351 (= lt!95448 e!126352)))

(declare-fun c!34605 () Bool)

(assert (=> d!56351 (= c!34605 lt!95451)))

(assert (=> d!56351 (= lt!95451 (containsKey!243 (toList!1214 lt!95288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!56351 (= (contains!1340 lt!95288 #b1000000000000000000000000000000000000000000000000000000000000000) lt!95449)))

(declare-fun b!192037 () Bool)

(declare-fun lt!95450 () Unit!5782)

(assert (=> b!192037 (= e!126352 lt!95450)))

(assert (=> b!192037 (= lt!95450 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 lt!95288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!192037 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95288) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!192038 () Bool)

(declare-fun Unit!5793 () Unit!5782)

(assert (=> b!192038 (= e!126352 Unit!5793)))

(declare-fun b!192039 () Bool)

(assert (=> b!192039 (= e!126353 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!56351 c!34605) b!192037))

(assert (= (and d!56351 (not c!34605)) b!192038))

(assert (= (and d!56351 (not res!90746)) b!192039))

(declare-fun m!218813 () Bool)

(assert (=> d!56351 m!218813))

(declare-fun m!218815 () Bool)

(assert (=> b!192037 m!218815))

(declare-fun m!218817 () Bool)

(assert (=> b!192037 m!218817))

(assert (=> b!192037 m!218817))

(declare-fun m!218819 () Bool)

(assert (=> b!192037 m!218819))

(assert (=> b!192039 m!218817))

(assert (=> b!192039 m!218817))

(assert (=> b!192039 m!218819))

(assert (=> bm!19339 d!56351))

(declare-fun d!56353 () Bool)

(assert (=> d!56353 (= (apply!182 lt!95288 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2220 (getValueByKey!240 (toList!1214 lt!95288) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7696 () Bool)

(assert (= bs!7696 d!56353))

(assert (=> bs!7696 m!218641))

(assert (=> bs!7696 m!218641))

(declare-fun m!218821 () Bool)

(assert (=> bs!7696 m!218821))

(assert (=> b!191725 d!56353))

(declare-fun d!56355 () Bool)

(declare-fun e!126355 () Bool)

(assert (=> d!56355 e!126355))

(declare-fun res!90747 () Bool)

(assert (=> d!56355 (=> res!90747 e!126355)))

(declare-fun lt!95453 () Bool)

(assert (=> d!56355 (= res!90747 (not lt!95453))))

(declare-fun lt!95455 () Bool)

(assert (=> d!56355 (= lt!95453 lt!95455)))

(declare-fun lt!95452 () Unit!5782)

(declare-fun e!126354 () Unit!5782)

(assert (=> d!56355 (= lt!95452 e!126354)))

(declare-fun c!34606 () Bool)

(assert (=> d!56355 (= c!34606 lt!95455)))

(assert (=> d!56355 (= lt!95455 (containsKey!243 (toList!1214 lt!95199) (_1!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> d!56355 (= (contains!1340 lt!95199 (_1!1749 (tuple2!3477 key!828 v!309))) lt!95453)))

(declare-fun b!192040 () Bool)

(declare-fun lt!95454 () Unit!5782)

(assert (=> b!192040 (= e!126354 lt!95454)))

(assert (=> b!192040 (= lt!95454 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 lt!95199) (_1!1749 (tuple2!3477 key!828 v!309))))))

(assert (=> b!192040 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95199) (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!192041 () Bool)

(declare-fun Unit!5794 () Unit!5782)

(assert (=> b!192041 (= e!126354 Unit!5794)))

(declare-fun b!192042 () Bool)

(assert (=> b!192042 (= e!126355 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95199) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(assert (= (and d!56355 c!34606) b!192040))

(assert (= (and d!56355 (not c!34606)) b!192041))

(assert (= (and d!56355 (not res!90747)) b!192042))

(declare-fun m!218823 () Bool)

(assert (=> d!56355 m!218823))

(declare-fun m!218825 () Bool)

(assert (=> b!192040 m!218825))

(assert (=> b!192040 m!218373))

(assert (=> b!192040 m!218373))

(declare-fun m!218827 () Bool)

(assert (=> b!192040 m!218827))

(assert (=> b!192042 m!218373))

(assert (=> b!192042 m!218373))

(assert (=> b!192042 m!218827))

(assert (=> d!56229 d!56355))

(declare-fun b!192043 () Bool)

(declare-fun e!126356 () Option!246)

(assert (=> b!192043 (= e!126356 (Some!245 (_2!1749 (h!3022 lt!95200))))))

(declare-fun c!34607 () Bool)

(declare-fun d!56357 () Bool)

(assert (=> d!56357 (= c!34607 (and ((_ is Cons!2383) lt!95200) (= (_1!1749 (h!3022 lt!95200)) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(assert (=> d!56357 (= (getValueByKey!240 lt!95200 (_1!1749 (tuple2!3477 key!828 v!309))) e!126356)))

(declare-fun b!192044 () Bool)

(declare-fun e!126357 () Option!246)

(assert (=> b!192044 (= e!126356 e!126357)))

(declare-fun c!34608 () Bool)

(assert (=> b!192044 (= c!34608 (and ((_ is Cons!2383) lt!95200) (not (= (_1!1749 (h!3022 lt!95200)) (_1!1749 (tuple2!3477 key!828 v!309))))))))

(declare-fun b!192045 () Bool)

(assert (=> b!192045 (= e!126357 (getValueByKey!240 (t!7293 lt!95200) (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!192046 () Bool)

(assert (=> b!192046 (= e!126357 None!244)))

(assert (= (and d!56357 c!34607) b!192043))

(assert (= (and d!56357 (not c!34607)) b!192044))

(assert (= (and b!192044 c!34608) b!192045))

(assert (= (and b!192044 (not c!34608)) b!192046))

(declare-fun m!218829 () Bool)

(assert (=> b!192045 m!218829))

(assert (=> d!56229 d!56357))

(declare-fun d!56359 () Bool)

(assert (=> d!56359 (= (getValueByKey!240 lt!95200 (_1!1749 (tuple2!3477 key!828 v!309))) (Some!245 (_2!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun lt!95458 () Unit!5782)

(declare-fun choose!1050 (List!2387 (_ BitVec 64) V!5585) Unit!5782)

(assert (=> d!56359 (= lt!95458 (choose!1050 lt!95200 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun e!126360 () Bool)

(assert (=> d!56359 e!126360))

(declare-fun res!90752 () Bool)

(assert (=> d!56359 (=> (not res!90752) (not e!126360))))

(assert (=> d!56359 (= res!90752 (isStrictlySorted!342 lt!95200))))

(assert (=> d!56359 (= (lemmaContainsTupThenGetReturnValue!127 lt!95200 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))) lt!95458)))

(declare-fun b!192051 () Bool)

(declare-fun res!90753 () Bool)

(assert (=> b!192051 (=> (not res!90753) (not e!126360))))

(assert (=> b!192051 (= res!90753 (containsKey!243 lt!95200 (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!192052 () Bool)

(assert (=> b!192052 (= e!126360 (contains!1341 lt!95200 (tuple2!3477 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309)))))))

(assert (= (and d!56359 res!90752) b!192051))

(assert (= (and b!192051 res!90753) b!192052))

(assert (=> d!56359 m!218367))

(declare-fun m!218831 () Bool)

(assert (=> d!56359 m!218831))

(declare-fun m!218833 () Bool)

(assert (=> d!56359 m!218833))

(declare-fun m!218835 () Bool)

(assert (=> b!192051 m!218835))

(declare-fun m!218837 () Bool)

(assert (=> b!192052 m!218837))

(assert (=> d!56229 d!56359))

(declare-fun b!192073 () Bool)

(declare-fun e!126372 () List!2387)

(declare-fun e!126371 () List!2387)

(assert (=> b!192073 (= e!126372 e!126371)))

(declare-fun c!34617 () Bool)

(assert (=> b!192073 (= c!34617 (and ((_ is Cons!2383) (toList!1214 lt!95148)) (= (_1!1749 (h!3022 (toList!1214 lt!95148))) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(declare-fun c!34618 () Bool)

(declare-fun call!19377 () List!2387)

(declare-fun bm!19372 () Bool)

(declare-fun e!126375 () List!2387)

(declare-fun $colon$colon!100 (List!2387 tuple2!3476) List!2387)

(assert (=> bm!19372 (= call!19377 ($colon$colon!100 e!126375 (ite c!34618 (h!3022 (toList!1214 lt!95148)) (tuple2!3477 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))))

(declare-fun c!34619 () Bool)

(assert (=> bm!19372 (= c!34619 c!34618)))

(declare-fun bm!19373 () Bool)

(declare-fun call!19375 () List!2387)

(assert (=> bm!19373 (= call!19375 call!19377)))

(declare-fun b!192074 () Bool)

(assert (=> b!192074 (= e!126371 call!19375)))

(declare-fun b!192075 () Bool)

(assert (=> b!192075 (= e!126375 (insertStrictlySorted!130 (t!7293 (toList!1214 lt!95148)) (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!192076 () Bool)

(declare-fun e!126374 () List!2387)

(declare-fun call!19376 () List!2387)

(assert (=> b!192076 (= e!126374 call!19376)))

(declare-fun b!192077 () Bool)

(declare-fun res!90758 () Bool)

(declare-fun e!126373 () Bool)

(assert (=> b!192077 (=> (not res!90758) (not e!126373))))

(declare-fun lt!95461 () List!2387)

(assert (=> b!192077 (= res!90758 (containsKey!243 lt!95461 (_1!1749 (tuple2!3477 key!828 v!309))))))

(declare-fun b!192078 () Bool)

(assert (=> b!192078 (= e!126373 (contains!1341 lt!95461 (tuple2!3477 (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309)))))))

(declare-fun bm!19374 () Bool)

(assert (=> bm!19374 (= call!19376 call!19375)))

(declare-fun b!192079 () Bool)

(declare-fun c!34620 () Bool)

(assert (=> b!192079 (= c!34620 (and ((_ is Cons!2383) (toList!1214 lt!95148)) (bvsgt (_1!1749 (h!3022 (toList!1214 lt!95148))) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(assert (=> b!192079 (= e!126371 e!126374)))

(declare-fun d!56361 () Bool)

(assert (=> d!56361 e!126373))

(declare-fun res!90759 () Bool)

(assert (=> d!56361 (=> (not res!90759) (not e!126373))))

(assert (=> d!56361 (= res!90759 (isStrictlySorted!342 lt!95461))))

(assert (=> d!56361 (= lt!95461 e!126372)))

(assert (=> d!56361 (= c!34618 (and ((_ is Cons!2383) (toList!1214 lt!95148)) (bvslt (_1!1749 (h!3022 (toList!1214 lt!95148))) (_1!1749 (tuple2!3477 key!828 v!309)))))))

(assert (=> d!56361 (isStrictlySorted!342 (toList!1214 lt!95148))))

(assert (=> d!56361 (= (insertStrictlySorted!130 (toList!1214 lt!95148) (_1!1749 (tuple2!3477 key!828 v!309)) (_2!1749 (tuple2!3477 key!828 v!309))) lt!95461)))

(declare-fun b!192080 () Bool)

(assert (=> b!192080 (= e!126372 call!19377)))

(declare-fun b!192081 () Bool)

(assert (=> b!192081 (= e!126374 call!19376)))

(declare-fun b!192082 () Bool)

(assert (=> b!192082 (= e!126375 (ite c!34617 (t!7293 (toList!1214 lt!95148)) (ite c!34620 (Cons!2383 (h!3022 (toList!1214 lt!95148)) (t!7293 (toList!1214 lt!95148))) Nil!2384)))))

(assert (= (and d!56361 c!34618) b!192080))

(assert (= (and d!56361 (not c!34618)) b!192073))

(assert (= (and b!192073 c!34617) b!192074))

(assert (= (and b!192073 (not c!34617)) b!192079))

(assert (= (and b!192079 c!34620) b!192076))

(assert (= (and b!192079 (not c!34620)) b!192081))

(assert (= (or b!192076 b!192081) bm!19374))

(assert (= (or b!192074 bm!19374) bm!19373))

(assert (= (or b!192080 bm!19373) bm!19372))

(assert (= (and bm!19372 c!34619) b!192075))

(assert (= (and bm!19372 (not c!34619)) b!192082))

(assert (= (and d!56361 res!90759) b!192077))

(assert (= (and b!192077 res!90758) b!192078))

(declare-fun m!218839 () Bool)

(assert (=> bm!19372 m!218839))

(declare-fun m!218841 () Bool)

(assert (=> b!192075 m!218841))

(declare-fun m!218843 () Bool)

(assert (=> d!56361 m!218843))

(assert (=> d!56361 m!218545))

(declare-fun m!218845 () Bool)

(assert (=> b!192078 m!218845))

(declare-fun m!218847 () Bool)

(assert (=> b!192077 m!218847))

(assert (=> d!56229 d!56361))

(declare-fun d!56363 () Bool)

(declare-fun e!126377 () Bool)

(assert (=> d!56363 e!126377))

(declare-fun res!90760 () Bool)

(assert (=> d!56363 (=> res!90760 e!126377)))

(declare-fun lt!95463 () Bool)

(assert (=> d!56363 (= res!90760 (not lt!95463))))

(declare-fun lt!95465 () Bool)

(assert (=> d!56363 (= lt!95463 lt!95465)))

(declare-fun lt!95462 () Unit!5782)

(declare-fun e!126376 () Unit!5782)

(assert (=> d!56363 (= lt!95462 e!126376)))

(declare-fun c!34621 () Bool)

(assert (=> d!56363 (= c!34621 lt!95465)))

(assert (=> d!56363 (= lt!95465 (containsKey!243 (toList!1214 lt!95254) (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!56363 (= (contains!1340 lt!95254 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)) lt!95463)))

(declare-fun b!192083 () Bool)

(declare-fun lt!95464 () Unit!5782)

(assert (=> b!192083 (= e!126376 lt!95464)))

(assert (=> b!192083 (= lt!95464 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 lt!95254) (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192083 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95254) (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192084 () Bool)

(declare-fun Unit!5795 () Unit!5782)

(assert (=> b!192084 (= e!126376 Unit!5795)))

(declare-fun b!192085 () Bool)

(assert (=> b!192085 (= e!126377 (isDefined!192 (getValueByKey!240 (toList!1214 lt!95254) (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!56363 c!34621) b!192083))

(assert (= (and d!56363 (not c!34621)) b!192084))

(assert (= (and d!56363 (not res!90760)) b!192085))

(assert (=> d!56363 m!218399))

(declare-fun m!218849 () Bool)

(assert (=> d!56363 m!218849))

(assert (=> b!192083 m!218399))

(declare-fun m!218851 () Bool)

(assert (=> b!192083 m!218851))

(assert (=> b!192083 m!218399))

(assert (=> b!192083 m!218583))

(assert (=> b!192083 m!218583))

(declare-fun m!218853 () Bool)

(assert (=> b!192083 m!218853))

(assert (=> b!192085 m!218399))

(assert (=> b!192085 m!218583))

(assert (=> b!192085 m!218583))

(assert (=> b!192085 m!218853))

(assert (=> b!191689 d!56363))

(declare-fun d!56365 () Bool)

(declare-fun e!126378 () Bool)

(assert (=> d!56365 e!126378))

(declare-fun res!90762 () Bool)

(assert (=> d!56365 (=> (not res!90762) (not e!126378))))

(declare-fun lt!95468 () ListLongMap!2397)

(assert (=> d!56365 (= res!90762 (contains!1340 lt!95468 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95469 () List!2387)

(assert (=> d!56365 (= lt!95468 (ListLongMap!2398 lt!95469))))

(declare-fun lt!95466 () Unit!5782)

(declare-fun lt!95467 () Unit!5782)

(assert (=> d!56365 (= lt!95466 lt!95467)))

(assert (=> d!56365 (= (getValueByKey!240 lt!95469 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56365 (= lt!95467 (lemmaContainsTupThenGetReturnValue!127 lt!95469 (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56365 (= lt!95469 (insertStrictlySorted!130 (toList!1214 call!19340) (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))))))

(assert (=> d!56365 (= (+!307 call!19340 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))) lt!95468)))

(declare-fun b!192086 () Bool)

(declare-fun res!90761 () Bool)

(assert (=> b!192086 (=> (not res!90761) (not e!126378))))

(assert (=> b!192086 (= res!90761 (= (getValueByKey!240 (toList!1214 lt!95468) (_1!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))))

(declare-fun b!192087 () Bool)

(assert (=> b!192087 (= e!126378 (contains!1341 (toList!1214 lt!95468) (tuple2!3477 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3750 thiss!1248))))))

(assert (= (and d!56365 res!90762) b!192086))

(assert (= (and b!192086 res!90761) b!192087))

(declare-fun m!218855 () Bool)

(assert (=> d!56365 m!218855))

(declare-fun m!218857 () Bool)

(assert (=> d!56365 m!218857))

(declare-fun m!218859 () Bool)

(assert (=> d!56365 m!218859))

(declare-fun m!218861 () Bool)

(assert (=> d!56365 m!218861))

(declare-fun m!218863 () Bool)

(assert (=> b!192086 m!218863))

(declare-fun m!218865 () Bool)

(assert (=> b!192087 m!218865))

(assert (=> b!191726 d!56365))

(declare-fun d!56367 () Bool)

(declare-fun res!90767 () Bool)

(declare-fun e!126383 () Bool)

(assert (=> d!56367 (=> res!90767 e!126383)))

(assert (=> d!56367 (= res!90767 (and ((_ is Cons!2383) (toList!1214 lt!95148)) (= (_1!1749 (h!3022 (toList!1214 lt!95148))) key!828)))))

(assert (=> d!56367 (= (containsKey!243 (toList!1214 lt!95148) key!828) e!126383)))

(declare-fun b!192092 () Bool)

(declare-fun e!126384 () Bool)

(assert (=> b!192092 (= e!126383 e!126384)))

(declare-fun res!90768 () Bool)

(assert (=> b!192092 (=> (not res!90768) (not e!126384))))

(assert (=> b!192092 (= res!90768 (and (or (not ((_ is Cons!2383) (toList!1214 lt!95148))) (bvsle (_1!1749 (h!3022 (toList!1214 lt!95148))) key!828)) ((_ is Cons!2383) (toList!1214 lt!95148)) (bvslt (_1!1749 (h!3022 (toList!1214 lt!95148))) key!828)))))

(declare-fun b!192093 () Bool)

(assert (=> b!192093 (= e!126384 (containsKey!243 (t!7293 (toList!1214 lt!95148)) key!828))))

(assert (= (and d!56367 (not res!90767)) b!192092))

(assert (= (and b!192092 res!90768) b!192093))

(declare-fun m!218867 () Bool)

(assert (=> b!192093 m!218867))

(assert (=> d!56233 d!56367))

(declare-fun d!56369 () Bool)

(assert (=> d!56369 (= (inRange!0 (ite c!34538 (index!4838 lt!95318) (index!4841 lt!95318)) (mask!9130 thiss!1248)) (and (bvsge (ite c!34538 (index!4838 lt!95318) (index!4841 lt!95318)) #b00000000000000000000000000000000) (bvslt (ite c!34538 (index!4838 lt!95318) (index!4841 lt!95318)) (bvadd (mask!9130 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!19346 d!56369))

(declare-fun d!56371 () Bool)

(assert (=> d!56371 (= (apply!182 (+!307 lt!95290 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248))) lt!95299) (apply!182 lt!95290 lt!95299))))

(declare-fun lt!95470 () Unit!5782)

(assert (=> d!56371 (= lt!95470 (choose!1048 lt!95290 lt!95292 (zeroValue!3750 thiss!1248) lt!95299))))

(declare-fun e!126385 () Bool)

(assert (=> d!56371 e!126385))

(declare-fun res!90769 () Bool)

(assert (=> d!56371 (=> (not res!90769) (not e!126385))))

(assert (=> d!56371 (= res!90769 (contains!1340 lt!95290 lt!95299))))

(assert (=> d!56371 (= (addApplyDifferent!158 lt!95290 lt!95292 (zeroValue!3750 thiss!1248) lt!95299) lt!95470)))

(declare-fun b!192094 () Bool)

(assert (=> b!192094 (= e!126385 (not (= lt!95299 lt!95292)))))

(assert (= (and d!56371 res!90769) b!192094))

(declare-fun m!218869 () Bool)

(assert (=> d!56371 m!218869))

(assert (=> d!56371 m!218471))

(assert (=> d!56371 m!218471))

(assert (=> d!56371 m!218473))

(declare-fun m!218871 () Bool)

(assert (=> d!56371 m!218871))

(assert (=> d!56371 m!218457))

(assert (=> b!191710 d!56371))

(declare-fun d!56373 () Bool)

(declare-fun e!126386 () Bool)

(assert (=> d!56373 e!126386))

(declare-fun res!90771 () Bool)

(assert (=> d!56373 (=> (not res!90771) (not e!126386))))

(declare-fun lt!95473 () ListLongMap!2397)

(assert (=> d!56373 (= res!90771 (contains!1340 lt!95473 (_1!1749 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95474 () List!2387)

(assert (=> d!56373 (= lt!95473 (ListLongMap!2398 lt!95474))))

(declare-fun lt!95471 () Unit!5782)

(declare-fun lt!95472 () Unit!5782)

(assert (=> d!56373 (= lt!95471 lt!95472)))

(assert (=> d!56373 (= (getValueByKey!240 lt!95474 (_1!1749 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248)))))))

(assert (=> d!56373 (= lt!95472 (lemmaContainsTupThenGetReturnValue!127 lt!95474 (_1!1749 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248)))))))

(assert (=> d!56373 (= lt!95474 (insertStrictlySorted!130 (toList!1214 lt!95279) (_1!1749 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248)))))))

(assert (=> d!56373 (= (+!307 lt!95279 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248))) lt!95473)))

(declare-fun b!192095 () Bool)

(declare-fun res!90770 () Bool)

(assert (=> b!192095 (=> (not res!90770) (not e!126386))))

(assert (=> b!192095 (= res!90770 (= (getValueByKey!240 (toList!1214 lt!95473) (_1!1749 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248))))))))

(declare-fun b!192096 () Bool)

(assert (=> b!192096 (= e!126386 (contains!1341 (toList!1214 lt!95473) (tuple2!3477 lt!95281 (minValue!3750 thiss!1248))))))

(assert (= (and d!56373 res!90771) b!192095))

(assert (= (and b!192095 res!90770) b!192096))

(declare-fun m!218873 () Bool)

(assert (=> d!56373 m!218873))

(declare-fun m!218875 () Bool)

(assert (=> d!56373 m!218875))

(declare-fun m!218877 () Bool)

(assert (=> d!56373 m!218877))

(declare-fun m!218879 () Bool)

(assert (=> d!56373 m!218879))

(declare-fun m!218881 () Bool)

(assert (=> b!192095 m!218881))

(declare-fun m!218883 () Bool)

(assert (=> b!192096 m!218883))

(assert (=> b!191710 d!56373))

(declare-fun d!56375 () Bool)

(assert (=> d!56375 (= (apply!182 (+!307 lt!95279 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248))) lt!95282) (apply!182 lt!95279 lt!95282))))

(declare-fun lt!95475 () Unit!5782)

(assert (=> d!56375 (= lt!95475 (choose!1048 lt!95279 lt!95281 (minValue!3750 thiss!1248) lt!95282))))

(declare-fun e!126387 () Bool)

(assert (=> d!56375 e!126387))

(declare-fun res!90772 () Bool)

(assert (=> d!56375 (=> (not res!90772) (not e!126387))))

(assert (=> d!56375 (= res!90772 (contains!1340 lt!95279 lt!95282))))

(assert (=> d!56375 (= (addApplyDifferent!158 lt!95279 lt!95281 (minValue!3750 thiss!1248) lt!95282) lt!95475)))

(declare-fun b!192097 () Bool)

(assert (=> b!192097 (= e!126387 (not (= lt!95282 lt!95281)))))

(assert (= (and d!56375 res!90772) b!192097))

(declare-fun m!218885 () Bool)

(assert (=> d!56375 m!218885))

(assert (=> d!56375 m!218447))

(assert (=> d!56375 m!218447))

(assert (=> d!56375 m!218449))

(declare-fun m!218887 () Bool)

(assert (=> d!56375 m!218887))

(assert (=> d!56375 m!218469))

(assert (=> b!191710 d!56375))

(declare-fun d!56377 () Bool)

(assert (=> d!56377 (= (apply!182 (+!307 lt!95290 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248))) lt!95299) (get!2220 (getValueByKey!240 (toList!1214 (+!307 lt!95290 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248)))) lt!95299)))))

(declare-fun bs!7697 () Bool)

(assert (= bs!7697 d!56377))

(declare-fun m!218889 () Bool)

(assert (=> bs!7697 m!218889))

(assert (=> bs!7697 m!218889))

(declare-fun m!218891 () Bool)

(assert (=> bs!7697 m!218891))

(assert (=> b!191710 d!56377))

(declare-fun d!56379 () Bool)

(assert (=> d!56379 (= (apply!182 lt!95280 lt!95291) (get!2220 (getValueByKey!240 (toList!1214 lt!95280) lt!95291)))))

(declare-fun bs!7698 () Bool)

(assert (= bs!7698 d!56379))

(declare-fun m!218893 () Bool)

(assert (=> bs!7698 m!218893))

(assert (=> bs!7698 m!218893))

(declare-fun m!218895 () Bool)

(assert (=> bs!7698 m!218895))

(assert (=> b!191710 d!56379))

(declare-fun d!56381 () Bool)

(assert (=> d!56381 (contains!1340 (+!307 lt!95286 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248))) lt!95283)))

(declare-fun lt!95476 () Unit!5782)

(assert (=> d!56381 (= lt!95476 (choose!1049 lt!95286 lt!95296 (zeroValue!3750 thiss!1248) lt!95283))))

(assert (=> d!56381 (contains!1340 lt!95286 lt!95283)))

(assert (=> d!56381 (= (addStillContains!158 lt!95286 lt!95296 (zeroValue!3750 thiss!1248) lt!95283) lt!95476)))

(declare-fun bs!7699 () Bool)

(assert (= bs!7699 d!56381))

(assert (=> bs!7699 m!218451))

(assert (=> bs!7699 m!218451))

(assert (=> bs!7699 m!218453))

(declare-fun m!218897 () Bool)

(assert (=> bs!7699 m!218897))

(declare-fun m!218899 () Bool)

(assert (=> bs!7699 m!218899))

(assert (=> b!191710 d!56381))

(declare-fun d!56383 () Bool)

(assert (=> d!56383 (= (apply!182 (+!307 lt!95280 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248))) lt!95291) (apply!182 lt!95280 lt!95291))))

(declare-fun lt!95477 () Unit!5782)

(assert (=> d!56383 (= lt!95477 (choose!1048 lt!95280 lt!95284 (minValue!3750 thiss!1248) lt!95291))))

(declare-fun e!126388 () Bool)

(assert (=> d!56383 e!126388))

(declare-fun res!90773 () Bool)

(assert (=> d!56383 (=> (not res!90773) (not e!126388))))

(assert (=> d!56383 (= res!90773 (contains!1340 lt!95280 lt!95291))))

(assert (=> d!56383 (= (addApplyDifferent!158 lt!95280 lt!95284 (minValue!3750 thiss!1248) lt!95291) lt!95477)))

(declare-fun b!192098 () Bool)

(assert (=> b!192098 (= e!126388 (not (= lt!95291 lt!95284)))))

(assert (= (and d!56383 res!90773) b!192098))

(declare-fun m!218901 () Bool)

(assert (=> d!56383 m!218901))

(assert (=> d!56383 m!218459))

(assert (=> d!56383 m!218459))

(assert (=> d!56383 m!218461))

(declare-fun m!218903 () Bool)

(assert (=> d!56383 m!218903))

(assert (=> d!56383 m!218465))

(assert (=> b!191710 d!56383))

(declare-fun b!192099 () Bool)

(declare-fun lt!95479 () Unit!5782)

(declare-fun lt!95483 () Unit!5782)

(assert (=> b!192099 (= lt!95479 lt!95483)))

(declare-fun lt!95481 () V!5585)

(declare-fun lt!95478 () (_ BitVec 64))

(declare-fun lt!95484 () ListLongMap!2397)

(declare-fun lt!95480 () (_ BitVec 64))

(assert (=> b!192099 (not (contains!1340 (+!307 lt!95484 (tuple2!3477 lt!95478 lt!95481)) lt!95480))))

(assert (=> b!192099 (= lt!95483 (addStillNotContains!97 lt!95484 lt!95478 lt!95481 lt!95480))))

(assert (=> b!192099 (= lt!95480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!192099 (= lt!95481 (get!2219 (select (arr!3831 (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192099 (= lt!95478 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun call!19378 () ListLongMap!2397)

(assert (=> b!192099 (= lt!95484 call!19378)))

(declare-fun e!126389 () ListLongMap!2397)

(assert (=> b!192099 (= e!126389 (+!307 call!19378 (tuple2!3477 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000) (get!2219 (select (arr!3831 (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!192100 () Bool)

(declare-fun e!126395 () Bool)

(assert (=> b!192100 (= e!126395 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192100 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun lt!95482 () ListLongMap!2397)

(declare-fun e!126391 () Bool)

(declare-fun b!192101 () Bool)

(assert (=> b!192101 (= e!126391 (= lt!95482 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3909 thiss!1248))))))

(declare-fun d!56385 () Bool)

(declare-fun e!126394 () Bool)

(assert (=> d!56385 e!126394))

(declare-fun res!90777 () Bool)

(assert (=> d!56385 (=> (not res!90777) (not e!126394))))

(assert (=> d!56385 (= res!90777 (not (contains!1340 lt!95482 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!126390 () ListLongMap!2397)

(assert (=> d!56385 (= lt!95482 e!126390)))

(declare-fun c!34623 () Bool)

(assert (=> d!56385 (= c!34623 (bvsge #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> d!56385 (validMask!0 (mask!9130 thiss!1248))))

(assert (=> d!56385 (= (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3909 thiss!1248)) lt!95482)))

(declare-fun b!192102 () Bool)

(declare-fun e!126392 () Bool)

(declare-fun e!126393 () Bool)

(assert (=> b!192102 (= e!126392 e!126393)))

(assert (=> b!192102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun res!90774 () Bool)

(assert (=> b!192102 (= res!90774 (contains!1340 lt!95482 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!192102 (=> (not res!90774) (not e!126393))))

(declare-fun b!192103 () Bool)

(assert (=> b!192103 (= e!126390 (ListLongMap!2398 Nil!2384))))

(declare-fun b!192104 () Bool)

(assert (=> b!192104 (= e!126390 e!126389)))

(declare-fun c!34624 () Bool)

(assert (=> b!192104 (= c!34624 (validKeyInArray!0 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!192105 () Bool)

(assert (=> b!192105 (= e!126389 call!19378)))

(declare-fun b!192106 () Bool)

(assert (=> b!192106 (= e!126394 e!126392)))

(declare-fun c!34622 () Bool)

(assert (=> b!192106 (= c!34622 e!126395)))

(declare-fun res!90775 () Bool)

(assert (=> b!192106 (=> (not res!90775) (not e!126395))))

(assert (=> b!192106 (= res!90775 (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!192107 () Bool)

(assert (=> b!192107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(assert (=> b!192107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4153 (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))))))))

(assert (=> b!192107 (= e!126393 (= (apply!182 lt!95482 (select (arr!3830 (_keys!5887 thiss!1248)) #b00000000000000000000000000000000)) (get!2219 (select (arr!3831 (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!525 (defaultEntry!3909 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!19375 () Bool)

(assert (=> bm!19375 (= call!19378 (getCurrentListMapNoExtraKeys!213 (_keys!5887 thiss!1248) (array!8134 (store (arr!3831 (_values!3892 thiss!1248)) (index!4839 lt!95147) (ValueCellFull!1883 v!309)) (size!4153 (_values!3892 thiss!1248))) (mask!9130 thiss!1248) (extraKeys!3646 thiss!1248) (zeroValue!3750 thiss!1248) (minValue!3750 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3909 thiss!1248)))))

(declare-fun b!192108 () Bool)

(declare-fun res!90776 () Bool)

(assert (=> b!192108 (=> (not res!90776) (not e!126394))))

(assert (=> b!192108 (= res!90776 (not (contains!1340 lt!95482 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!192109 () Bool)

(assert (=> b!192109 (= e!126392 e!126391)))

(declare-fun c!34625 () Bool)

(assert (=> b!192109 (= c!34625 (bvslt #b00000000000000000000000000000000 (size!4152 (_keys!5887 thiss!1248))))))

(declare-fun b!192110 () Bool)

(assert (=> b!192110 (= e!126391 (isEmpty!490 lt!95482))))

(assert (= (and d!56385 c!34623) b!192103))

(assert (= (and d!56385 (not c!34623)) b!192104))

(assert (= (and b!192104 c!34624) b!192099))

(assert (= (and b!192104 (not c!34624)) b!192105))

(assert (= (or b!192099 b!192105) bm!19375))

(assert (= (and d!56385 res!90777) b!192108))

(assert (= (and b!192108 res!90776) b!192106))

(assert (= (and b!192106 res!90775) b!192100))

(assert (= (and b!192106 c!34622) b!192102))

(assert (= (and b!192106 (not c!34622)) b!192109))

(assert (= (and b!192102 res!90774) b!192107))

(assert (= (and b!192109 c!34625) b!192101))

(assert (= (and b!192109 (not c!34625)) b!192110))

(declare-fun b_lambda!7433 () Bool)

(assert (=> (not b_lambda!7433) (not b!192099)))

(assert (=> b!192099 t!7295))

(declare-fun b_and!11383 () Bool)

(assert (= b_and!11381 (and (=> t!7295 result!4895) b_and!11383)))

(declare-fun b_lambda!7435 () Bool)

(assert (=> (not b_lambda!7435) (not b!192107)))

(assert (=> b!192107 t!7295))

(declare-fun b_and!11385 () Bool)

(assert (= b_and!11383 (and (=> t!7295 result!4895) b_and!11385)))

(assert (=> b!192104 m!218399))

(assert (=> b!192104 m!218399))

(assert (=> b!192104 m!218417))

(declare-fun m!218905 () Bool)

(assert (=> b!192101 m!218905))

(assert (=> b!192107 m!218399))

(assert (=> b!192107 m!218487))

(assert (=> b!192107 m!218427))

(assert (=> b!192107 m!218489))

(assert (=> b!192107 m!218427))

(assert (=> b!192107 m!218399))

(declare-fun m!218907 () Bool)

(assert (=> b!192107 m!218907))

(assert (=> b!192107 m!218487))

(assert (=> b!192102 m!218399))

(assert (=> b!192102 m!218399))

(declare-fun m!218909 () Bool)

(assert (=> b!192102 m!218909))

(declare-fun m!218911 () Bool)

(assert (=> b!192108 m!218911))

(declare-fun m!218913 () Bool)

(assert (=> b!192110 m!218913))

(declare-fun m!218915 () Bool)

(assert (=> d!56385 m!218915))

(assert (=> d!56385 m!218281))

(assert (=> bm!19375 m!218905))

(assert (=> b!192100 m!218399))

(assert (=> b!192100 m!218399))

(assert (=> b!192100 m!218417))

(declare-fun m!218917 () Bool)

(assert (=> b!192099 m!218917))

(assert (=> b!192099 m!218399))

(assert (=> b!192099 m!218487))

(assert (=> b!192099 m!218427))

(assert (=> b!192099 m!218489))

(assert (=> b!192099 m!218427))

(declare-fun m!218919 () Bool)

(assert (=> b!192099 m!218919))

(declare-fun m!218921 () Bool)

(assert (=> b!192099 m!218921))

(declare-fun m!218923 () Bool)

(assert (=> b!192099 m!218923))

(assert (=> b!192099 m!218487))

(assert (=> b!192099 m!218919))

(assert (=> b!191710 d!56385))

(declare-fun d!56387 () Bool)

(assert (=> d!56387 (= (apply!182 (+!307 lt!95279 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248))) lt!95282) (get!2220 (getValueByKey!240 (toList!1214 (+!307 lt!95279 (tuple2!3477 lt!95281 (minValue!3750 thiss!1248)))) lt!95282)))))

(declare-fun bs!7700 () Bool)

(assert (= bs!7700 d!56387))

(declare-fun m!218925 () Bool)

(assert (=> bs!7700 m!218925))

(assert (=> bs!7700 m!218925))

(declare-fun m!218927 () Bool)

(assert (=> bs!7700 m!218927))

(assert (=> b!191710 d!56387))

(declare-fun d!56389 () Bool)

(declare-fun e!126396 () Bool)

(assert (=> d!56389 e!126396))

(declare-fun res!90779 () Bool)

(assert (=> d!56389 (=> (not res!90779) (not e!126396))))

(declare-fun lt!95487 () ListLongMap!2397)

(assert (=> d!56389 (= res!90779 (contains!1340 lt!95487 (_1!1749 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248)))))))

(declare-fun lt!95488 () List!2387)

(assert (=> d!56389 (= lt!95487 (ListLongMap!2398 lt!95488))))

(declare-fun lt!95485 () Unit!5782)

(declare-fun lt!95486 () Unit!5782)

(assert (=> d!56389 (= lt!95485 lt!95486)))

(assert (=> d!56389 (= (getValueByKey!240 lt!95488 (_1!1749 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56389 (= lt!95486 (lemmaContainsTupThenGetReturnValue!127 lt!95488 (_1!1749 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56389 (= lt!95488 (insertStrictlySorted!130 (toList!1214 lt!95290) (_1!1749 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56389 (= (+!307 lt!95290 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248))) lt!95487)))

(declare-fun b!192111 () Bool)

(declare-fun res!90778 () Bool)

(assert (=> b!192111 (=> (not res!90778) (not e!126396))))

(assert (=> b!192111 (= res!90778 (= (getValueByKey!240 (toList!1214 lt!95487) (_1!1749 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248))))))))

(declare-fun b!192112 () Bool)

(assert (=> b!192112 (= e!126396 (contains!1341 (toList!1214 lt!95487) (tuple2!3477 lt!95292 (zeroValue!3750 thiss!1248))))))

(assert (= (and d!56389 res!90779) b!192111))

(assert (= (and b!192111 res!90778) b!192112))

(declare-fun m!218929 () Bool)

(assert (=> d!56389 m!218929))

(declare-fun m!218931 () Bool)

(assert (=> d!56389 m!218931))

(declare-fun m!218933 () Bool)

(assert (=> d!56389 m!218933))

(declare-fun m!218935 () Bool)

(assert (=> d!56389 m!218935))

(declare-fun m!218937 () Bool)

(assert (=> b!192111 m!218937))

(declare-fun m!218939 () Bool)

(assert (=> b!192112 m!218939))

(assert (=> b!191710 d!56389))

(declare-fun d!56391 () Bool)

(assert (=> d!56391 (= (apply!182 lt!95290 lt!95299) (get!2220 (getValueByKey!240 (toList!1214 lt!95290) lt!95299)))))

(declare-fun bs!7701 () Bool)

(assert (= bs!7701 d!56391))

(declare-fun m!218941 () Bool)

(assert (=> bs!7701 m!218941))

(assert (=> bs!7701 m!218941))

(declare-fun m!218943 () Bool)

(assert (=> bs!7701 m!218943))

(assert (=> b!191710 d!56391))

(declare-fun d!56393 () Bool)

(declare-fun e!126397 () Bool)

(assert (=> d!56393 e!126397))

(declare-fun res!90781 () Bool)

(assert (=> d!56393 (=> (not res!90781) (not e!126397))))

(declare-fun lt!95491 () ListLongMap!2397)

(assert (=> d!56393 (= res!90781 (contains!1340 lt!95491 (_1!1749 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248)))))))

(declare-fun lt!95492 () List!2387)

(assert (=> d!56393 (= lt!95491 (ListLongMap!2398 lt!95492))))

(declare-fun lt!95489 () Unit!5782)

(declare-fun lt!95490 () Unit!5782)

(assert (=> d!56393 (= lt!95489 lt!95490)))

(assert (=> d!56393 (= (getValueByKey!240 lt!95492 (_1!1749 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248)))))))

(assert (=> d!56393 (= lt!95490 (lemmaContainsTupThenGetReturnValue!127 lt!95492 (_1!1749 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248)))))))

(assert (=> d!56393 (= lt!95492 (insertStrictlySorted!130 (toList!1214 lt!95280) (_1!1749 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248)))))))

(assert (=> d!56393 (= (+!307 lt!95280 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248))) lt!95491)))

(declare-fun b!192113 () Bool)

(declare-fun res!90780 () Bool)

(assert (=> b!192113 (=> (not res!90780) (not e!126397))))

(assert (=> b!192113 (= res!90780 (= (getValueByKey!240 (toList!1214 lt!95491) (_1!1749 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248))))))))

(declare-fun b!192114 () Bool)

(assert (=> b!192114 (= e!126397 (contains!1341 (toList!1214 lt!95491) (tuple2!3477 lt!95284 (minValue!3750 thiss!1248))))))

(assert (= (and d!56393 res!90781) b!192113))

(assert (= (and b!192113 res!90780) b!192114))

(declare-fun m!218945 () Bool)

(assert (=> d!56393 m!218945))

(declare-fun m!218947 () Bool)

(assert (=> d!56393 m!218947))

(declare-fun m!218949 () Bool)

(assert (=> d!56393 m!218949))

(declare-fun m!218951 () Bool)

(assert (=> d!56393 m!218951))

(declare-fun m!218953 () Bool)

(assert (=> b!192113 m!218953))

(declare-fun m!218955 () Bool)

(assert (=> b!192114 m!218955))

(assert (=> b!191710 d!56393))

(declare-fun d!56395 () Bool)

(assert (=> d!56395 (= (apply!182 lt!95279 lt!95282) (get!2220 (getValueByKey!240 (toList!1214 lt!95279) lt!95282)))))

(declare-fun bs!7702 () Bool)

(assert (= bs!7702 d!56395))

(declare-fun m!218957 () Bool)

(assert (=> bs!7702 m!218957))

(assert (=> bs!7702 m!218957))

(declare-fun m!218959 () Bool)

(assert (=> bs!7702 m!218959))

(assert (=> b!191710 d!56395))

(declare-fun d!56397 () Bool)

(assert (=> d!56397 (= (apply!182 (+!307 lt!95280 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248))) lt!95291) (get!2220 (getValueByKey!240 (toList!1214 (+!307 lt!95280 (tuple2!3477 lt!95284 (minValue!3750 thiss!1248)))) lt!95291)))))

(declare-fun bs!7703 () Bool)

(assert (= bs!7703 d!56397))

(declare-fun m!218961 () Bool)

(assert (=> bs!7703 m!218961))

(assert (=> bs!7703 m!218961))

(declare-fun m!218963 () Bool)

(assert (=> bs!7703 m!218963))

(assert (=> b!191710 d!56397))

(declare-fun d!56399 () Bool)

(declare-fun e!126398 () Bool)

(assert (=> d!56399 e!126398))

(declare-fun res!90783 () Bool)

(assert (=> d!56399 (=> (not res!90783) (not e!126398))))

(declare-fun lt!95495 () ListLongMap!2397)

(assert (=> d!56399 (= res!90783 (contains!1340 lt!95495 (_1!1749 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248)))))))

(declare-fun lt!95496 () List!2387)

(assert (=> d!56399 (= lt!95495 (ListLongMap!2398 lt!95496))))

(declare-fun lt!95493 () Unit!5782)

(declare-fun lt!95494 () Unit!5782)

(assert (=> d!56399 (= lt!95493 lt!95494)))

(assert (=> d!56399 (= (getValueByKey!240 lt!95496 (_1!1749 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56399 (= lt!95494 (lemmaContainsTupThenGetReturnValue!127 lt!95496 (_1!1749 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56399 (= lt!95496 (insertStrictlySorted!130 (toList!1214 lt!95286) (_1!1749 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248))) (_2!1749 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248)))))))

(assert (=> d!56399 (= (+!307 lt!95286 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248))) lt!95495)))

(declare-fun b!192115 () Bool)

(declare-fun res!90782 () Bool)

(assert (=> b!192115 (=> (not res!90782) (not e!126398))))

(assert (=> b!192115 (= res!90782 (= (getValueByKey!240 (toList!1214 lt!95495) (_1!1749 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248)))) (Some!245 (_2!1749 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248))))))))

(declare-fun b!192116 () Bool)

(assert (=> b!192116 (= e!126398 (contains!1341 (toList!1214 lt!95495) (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248))))))

(assert (= (and d!56399 res!90783) b!192115))

(assert (= (and b!192115 res!90782) b!192116))

(declare-fun m!218965 () Bool)

(assert (=> d!56399 m!218965))

(declare-fun m!218967 () Bool)

(assert (=> d!56399 m!218967))

(declare-fun m!218969 () Bool)

(assert (=> d!56399 m!218969))

(declare-fun m!218971 () Bool)

(assert (=> d!56399 m!218971))

(declare-fun m!218973 () Bool)

(assert (=> b!192115 m!218973))

(declare-fun m!218975 () Bool)

(assert (=> b!192116 m!218975))

(assert (=> b!191710 d!56399))

(declare-fun d!56401 () Bool)

(declare-fun e!126400 () Bool)

(assert (=> d!56401 e!126400))

(declare-fun res!90784 () Bool)

(assert (=> d!56401 (=> res!90784 e!126400)))

(declare-fun lt!95498 () Bool)

(assert (=> d!56401 (= res!90784 (not lt!95498))))

(declare-fun lt!95500 () Bool)

(assert (=> d!56401 (= lt!95498 lt!95500)))

(declare-fun lt!95497 () Unit!5782)

(declare-fun e!126399 () Unit!5782)

(assert (=> d!56401 (= lt!95497 e!126399)))

(declare-fun c!34626 () Bool)

(assert (=> d!56401 (= c!34626 lt!95500)))

(assert (=> d!56401 (= lt!95500 (containsKey!243 (toList!1214 (+!307 lt!95286 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248)))) lt!95283))))

(assert (=> d!56401 (= (contains!1340 (+!307 lt!95286 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248))) lt!95283) lt!95498)))

(declare-fun b!192117 () Bool)

(declare-fun lt!95499 () Unit!5782)

(assert (=> b!192117 (= e!126399 lt!95499)))

(assert (=> b!192117 (= lt!95499 (lemmaContainsKeyImpliesGetValueByKeyDefined!191 (toList!1214 (+!307 lt!95286 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248)))) lt!95283))))

(assert (=> b!192117 (isDefined!192 (getValueByKey!240 (toList!1214 (+!307 lt!95286 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248)))) lt!95283))))

(declare-fun b!192118 () Bool)

(declare-fun Unit!5796 () Unit!5782)

(assert (=> b!192118 (= e!126399 Unit!5796)))

(declare-fun b!192119 () Bool)

(assert (=> b!192119 (= e!126400 (isDefined!192 (getValueByKey!240 (toList!1214 (+!307 lt!95286 (tuple2!3477 lt!95296 (zeroValue!3750 thiss!1248)))) lt!95283)))))

(assert (= (and d!56401 c!34626) b!192117))

(assert (= (and d!56401 (not c!34626)) b!192118))

(assert (= (and d!56401 (not res!90784)) b!192119))

(declare-fun m!218977 () Bool)

(assert (=> d!56401 m!218977))

(declare-fun m!218979 () Bool)

(assert (=> b!192117 m!218979))

(declare-fun m!218981 () Bool)

(assert (=> b!192117 m!218981))

(assert (=> b!192117 m!218981))

(declare-fun m!218983 () Bool)

(assert (=> b!192117 m!218983))

(assert (=> b!192119 m!218981))

(assert (=> b!192119 m!218981))

(assert (=> b!192119 m!218983))

(assert (=> b!191710 d!56401))

(assert (=> d!56231 d!56237))

(declare-fun d!56403 () Bool)

(assert (=> d!56403 (= (apply!182 lt!95288 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2220 (getValueByKey!240 (toList!1214 lt!95288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7704 () Bool)

(assert (= bs!7704 d!56403))

(assert (=> bs!7704 m!218817))

(assert (=> bs!7704 m!218817))

(declare-fun m!218985 () Bool)

(assert (=> bs!7704 m!218985))

(assert (=> b!191711 d!56403))

(assert (=> b!191692 d!56277))

(assert (=> bm!19340 d!56385))

(declare-fun mapNonEmpty!7702 () Bool)

(declare-fun mapRes!7702 () Bool)

(declare-fun tp!16909 () Bool)

(declare-fun e!126402 () Bool)

(assert (=> mapNonEmpty!7702 (= mapRes!7702 (and tp!16909 e!126402))))

(declare-fun mapRest!7702 () (Array (_ BitVec 32) ValueCell!1883))

(declare-fun mapKey!7702 () (_ BitVec 32))

(declare-fun mapValue!7702 () ValueCell!1883)

(assert (=> mapNonEmpty!7702 (= mapRest!7701 (store mapRest!7702 mapKey!7702 mapValue!7702))))

(declare-fun b!192121 () Bool)

(declare-fun e!126401 () Bool)

(assert (=> b!192121 (= e!126401 tp_is_empty!4453)))

(declare-fun condMapEmpty!7702 () Bool)

(declare-fun mapDefault!7702 () ValueCell!1883)

(assert (=> mapNonEmpty!7701 (= condMapEmpty!7702 (= mapRest!7701 ((as const (Array (_ BitVec 32) ValueCell!1883)) mapDefault!7702)))))

(assert (=> mapNonEmpty!7701 (= tp!16908 (and e!126401 mapRes!7702))))

(declare-fun mapIsEmpty!7702 () Bool)

(assert (=> mapIsEmpty!7702 mapRes!7702))

(declare-fun b!192120 () Bool)

(assert (=> b!192120 (= e!126402 tp_is_empty!4453)))

(assert (= (and mapNonEmpty!7701 condMapEmpty!7702) mapIsEmpty!7702))

(assert (= (and mapNonEmpty!7701 (not condMapEmpty!7702)) mapNonEmpty!7702))

(assert (= (and mapNonEmpty!7702 ((_ is ValueCellFull!1883) mapValue!7702)) b!192120))

(assert (= (and mapNonEmpty!7701 ((_ is ValueCellFull!1883) mapDefault!7702)) b!192121))

(declare-fun m!218987 () Bool)

(assert (=> mapNonEmpty!7702 m!218987))

(declare-fun b_lambda!7437 () Bool)

(assert (= b_lambda!7433 (or (and b!191562 b_free!4681) b_lambda!7437)))

(declare-fun b_lambda!7439 () Bool)

(assert (= b_lambda!7431 (or (and b!191562 b_free!4681) b_lambda!7439)))

(declare-fun b_lambda!7441 () Bool)

(assert (= b_lambda!7435 (or (and b!191562 b_free!4681) b_lambda!7441)))

(declare-fun b_lambda!7443 () Bool)

(assert (= b_lambda!7429 (or (and b!191562 b_free!4681) b_lambda!7443)))

(check-sat (not b!192101) (not mapNonEmpty!7702) (not d!56289) (not b_lambda!7437) (not b!192045) (not b!191808) (not b!191932) (not b!192035) (not b!191807) (not bm!19350) (not b!191899) (not d!56343) (not d!56283) (not b!192087) (not b!191973) (not b!192040) (not b!192113) (not d!56323) (not d!56399) (not b!192086) (not d!56349) (not b!192112) (not b!191880) (not d!56381) (not bm!19372) (not b!192052) (not d!56385) (not b!192083) (not d!56355) (not b!192017) (not d!56389) (not d!56265) (not d!56393) (not d!56279) (not d!56339) (not b!191866) (not d!56383) (not b!192075) (not b!192014) (not bm!19375) (not d!56297) (not d!56325) b_and!11385 (not d!56281) (not d!56321) (not b!191957) (not b_lambda!7443) (not b!192110) (not bm!19362) (not b!191849) (not b!192100) (not d!56371) (not b!191935) (not b_lambda!7427) (not b!191867) (not b!191930) (not b_lambda!7441) (not d!56401) (not b!191999) (not d!56363) (not b_lambda!7439) (not b!192010) (not d!56317) (not d!56287) (not d!56361) (not b!192093) (not d!56387) (not b_lambda!7425) (not b!191969) (not d!56307) (not b!192099) (not d!56351) (not b!192111) (not d!56313) (not b!192030) (not d!56379) (not b!191881) (not b!191970) (not b!192107) (not b!191873) (not b!192013) (not d!56293) (not d!56335) (not bm!19365) (not b!192051) (not b!192011) (not b!192095) (not d!56341) (not b!191933) (not b!192102) (not b!192119) (not b!192000) (not d!56295) (not d!56331) (not b!192023) tp_is_empty!4453 (not d!56273) (not d!56269) (not b!192001) (not d!56391) (not d!56347) (not b!192115) (not b!192039) (not d!56329) (not b!192108) (not b!192078) (not b!191928) (not b!192042) (not b!191968) (not d!56377) (not d!56315) (not b!191824) (not d!56261) (not b!192029) (not b!191818) (not d!56255) (not bm!19356) (not d!56259) (not b!192114) (not b!191929) (not b!191835) (not b!191847) (not b!192117) (not d!56359) (not b!192025) (not b!192096) (not b!192012) (not b!191874) (not d!56403) (not bm!19361) (not b!191903) (not d!56285) (not b_next!4681) (not b!192007) (not b!191883) (not d!56373) (not b!192104) (not b!191853) (not d!56319) (not b!192116) (not d!56333) (not d!56353) (not b!191902) (not b!192085) (not b!192024) (not d!56299) (not d!56375) (not b!191837) (not b!191838) (not b!192002) (not d!56337) (not b!192015) (not b!191868) (not bm!19353) (not b!192022) (not b!191851) (not b!192037) (not b!192004) (not d!56301) (not d!56365) (not b!192008) (not d!56345) (not d!56395) (not d!56327) (not d!56397) (not b!192077))
(check-sat b_and!11385 (not b_next!4681))
