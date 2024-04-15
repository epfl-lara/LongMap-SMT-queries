; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22428 () Bool)

(assert start!22428)

(declare-fun b!234517 () Bool)

(declare-fun b_free!6313 () Bool)

(declare-fun b_next!6313 () Bool)

(assert (=> b!234517 (= b_free!6313 (not b_next!6313))))

(declare-fun tp!22098 () Bool)

(declare-fun b_and!13207 () Bool)

(assert (=> b!234517 (= tp!22098 b_and!13207)))

(declare-fun mapIsEmpty!10450 () Bool)

(declare-fun mapRes!10450 () Bool)

(assert (=> mapIsEmpty!10450 mapRes!10450))

(declare-fun b!234511 () Bool)

(declare-fun e!152316 () Bool)

(declare-fun tp_is_empty!6175 () Bool)

(assert (=> b!234511 (= e!152316 tp_is_empty!6175)))

(declare-fun res!114994 () Bool)

(declare-fun e!152312 () Bool)

(assert (=> start!22428 (=> (not res!114994) (not e!152312))))

(declare-datatypes ((V!7881 0))(
  ( (V!7882 (val!3132 Int)) )
))
(declare-datatypes ((ValueCell!2744 0))(
  ( (ValueCellFull!2744 (v!5151 V!7881)) (EmptyCell!2744) )
))
(declare-datatypes ((array!11595 0))(
  ( (array!11596 (arr!5511 (Array (_ BitVec 32) ValueCell!2744)) (size!5848 (_ BitVec 32))) )
))
(declare-datatypes ((array!11597 0))(
  ( (array!11598 (arr!5512 (Array (_ BitVec 32) (_ BitVec 64))) (size!5849 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3388 0))(
  ( (LongMapFixedSize!3389 (defaultEntry!4361 Int) (mask!10314 (_ BitVec 32)) (extraKeys!4098 (_ BitVec 32)) (zeroValue!4202 V!7881) (minValue!4202 V!7881) (_size!1743 (_ BitVec 32)) (_keys!6428 array!11597) (_values!4344 array!11595) (_vacant!1743 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3388)

(declare-fun valid!1352 (LongMapFixedSize!3388) Bool)

(assert (=> start!22428 (= res!114994 (valid!1352 thiss!1504))))

(assert (=> start!22428 e!152312))

(declare-fun e!152315 () Bool)

(assert (=> start!22428 e!152315))

(assert (=> start!22428 true))

(declare-fun b!234512 () Bool)

(declare-fun res!114998 () Bool)

(declare-fun e!152313 () Bool)

(assert (=> b!234512 (=> (not res!114998) (not e!152313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234512 (= res!114998 (validMask!0 (mask!10314 thiss!1504)))))

(declare-fun b!234513 () Bool)

(assert (=> b!234513 (= e!152313 (and (= (size!5848 (_values!4344 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10314 thiss!1504))) (= (size!5849 (_keys!6428 thiss!1504)) (size!5848 (_values!4344 thiss!1504))) (bvsge (mask!10314 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4098 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4098 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!234514 () Bool)

(declare-fun res!114996 () Bool)

(assert (=> b!234514 (=> (not res!114996) (not e!152313))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4596 0))(
  ( (tuple2!4597 (_1!2309 (_ BitVec 64)) (_2!2309 V!7881)) )
))
(declare-datatypes ((List!3524 0))(
  ( (Nil!3521) (Cons!3520 (h!4171 tuple2!4596) (t!8484 List!3524)) )
))
(declare-datatypes ((ListLongMap!3499 0))(
  ( (ListLongMap!3500 (toList!1765 List!3524)) )
))
(declare-fun contains!1642 (ListLongMap!3499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1274 (array!11597 array!11595 (_ BitVec 32) (_ BitVec 32) V!7881 V!7881 (_ BitVec 32) Int) ListLongMap!3499)

(assert (=> b!234514 (= res!114996 (contains!1642 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)) key!932))))

(declare-fun b!234515 () Bool)

(assert (=> b!234515 (= e!152312 e!152313)))

(declare-fun res!114995 () Bool)

(assert (=> b!234515 (=> (not res!114995) (not e!152313))))

(declare-datatypes ((SeekEntryResult!986 0))(
  ( (MissingZero!986 (index!6114 (_ BitVec 32))) (Found!986 (index!6115 (_ BitVec 32))) (Intermediate!986 (undefined!1798 Bool) (index!6116 (_ BitVec 32)) (x!23727 (_ BitVec 32))) (Undefined!986) (MissingVacant!986 (index!6117 (_ BitVec 32))) )
))
(declare-fun lt!118537 () SeekEntryResult!986)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234515 (= res!114995 (or (= lt!118537 (MissingZero!986 index!297)) (= lt!118537 (MissingVacant!986 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11597 (_ BitVec 32)) SeekEntryResult!986)

(assert (=> b!234515 (= lt!118537 (seekEntryOrOpen!0 key!932 (_keys!6428 thiss!1504) (mask!10314 thiss!1504)))))

(declare-fun b!234516 () Bool)

(declare-fun e!152310 () Bool)

(declare-fun e!152311 () Bool)

(assert (=> b!234516 (= e!152310 (and e!152311 mapRes!10450))))

(declare-fun condMapEmpty!10450 () Bool)

(declare-fun mapDefault!10450 () ValueCell!2744)

(assert (=> b!234516 (= condMapEmpty!10450 (= (arr!5511 (_values!4344 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2744)) mapDefault!10450)))))

(declare-fun array_inv!3637 (array!11597) Bool)

(declare-fun array_inv!3638 (array!11595) Bool)

(assert (=> b!234517 (= e!152315 (and tp!22098 tp_is_empty!6175 (array_inv!3637 (_keys!6428 thiss!1504)) (array_inv!3638 (_values!4344 thiss!1504)) e!152310))))

(declare-fun mapNonEmpty!10450 () Bool)

(declare-fun tp!22099 () Bool)

(assert (=> mapNonEmpty!10450 (= mapRes!10450 (and tp!22099 e!152316))))

(declare-fun mapValue!10450 () ValueCell!2744)

(declare-fun mapRest!10450 () (Array (_ BitVec 32) ValueCell!2744))

(declare-fun mapKey!10450 () (_ BitVec 32))

(assert (=> mapNonEmpty!10450 (= (arr!5511 (_values!4344 thiss!1504)) (store mapRest!10450 mapKey!10450 mapValue!10450))))

(declare-fun b!234518 () Bool)

(declare-fun res!114997 () Bool)

(assert (=> b!234518 (=> (not res!114997) (not e!152312))))

(assert (=> b!234518 (= res!114997 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234519 () Bool)

(assert (=> b!234519 (= e!152311 tp_is_empty!6175)))

(assert (= (and start!22428 res!114994) b!234518))

(assert (= (and b!234518 res!114997) b!234515))

(assert (= (and b!234515 res!114995) b!234514))

(assert (= (and b!234514 res!114996) b!234512))

(assert (= (and b!234512 res!114998) b!234513))

(assert (= (and b!234516 condMapEmpty!10450) mapIsEmpty!10450))

(assert (= (and b!234516 (not condMapEmpty!10450)) mapNonEmpty!10450))

(get-info :version)

(assert (= (and mapNonEmpty!10450 ((_ is ValueCellFull!2744) mapValue!10450)) b!234511))

(assert (= (and b!234516 ((_ is ValueCellFull!2744) mapDefault!10450)) b!234519))

(assert (= b!234517 b!234516))

(assert (= start!22428 b!234517))

(declare-fun m!255313 () Bool)

(assert (=> b!234512 m!255313))

(declare-fun m!255315 () Bool)

(assert (=> b!234515 m!255315))

(declare-fun m!255317 () Bool)

(assert (=> b!234517 m!255317))

(declare-fun m!255319 () Bool)

(assert (=> b!234517 m!255319))

(declare-fun m!255321 () Bool)

(assert (=> mapNonEmpty!10450 m!255321))

(declare-fun m!255323 () Bool)

(assert (=> start!22428 m!255323))

(declare-fun m!255325 () Bool)

(assert (=> b!234514 m!255325))

(assert (=> b!234514 m!255325))

(declare-fun m!255327 () Bool)

(assert (=> b!234514 m!255327))

(check-sat (not start!22428) b_and!13207 tp_is_empty!6175 (not mapNonEmpty!10450) (not b!234512) (not b!234515) (not b!234514) (not b_next!6313) (not b!234517))
(check-sat b_and!13207 (not b_next!6313))
(get-model)

(declare-fun d!59017 () Bool)

(declare-fun e!152363 () Bool)

(assert (=> d!59017 e!152363))

(declare-fun res!115031 () Bool)

(assert (=> d!59017 (=> res!115031 e!152363)))

(declare-fun lt!118554 () Bool)

(assert (=> d!59017 (= res!115031 (not lt!118554))))

(declare-fun lt!118552 () Bool)

(assert (=> d!59017 (= lt!118554 lt!118552)))

(declare-datatypes ((Unit!7238 0))(
  ( (Unit!7239) )
))
(declare-fun lt!118555 () Unit!7238)

(declare-fun e!152364 () Unit!7238)

(assert (=> d!59017 (= lt!118555 e!152364)))

(declare-fun c!39067 () Bool)

(assert (=> d!59017 (= c!39067 lt!118552)))

(declare-fun containsKey!256 (List!3524 (_ BitVec 64)) Bool)

(assert (=> d!59017 (= lt!118552 (containsKey!256 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(assert (=> d!59017 (= (contains!1642 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)) key!932) lt!118554)))

(declare-fun b!234580 () Bool)

(declare-fun lt!118553 () Unit!7238)

(assert (=> b!234580 (= e!152364 lt!118553)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!205 (List!3524 (_ BitVec 64)) Unit!7238)

(assert (=> b!234580 (= lt!118553 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(declare-datatypes ((Option!270 0))(
  ( (Some!269 (v!5154 V!7881)) (None!268) )
))
(declare-fun isDefined!206 (Option!270) Bool)

(declare-fun getValueByKey!264 (List!3524 (_ BitVec 64)) Option!270)

(assert (=> b!234580 (isDefined!206 (getValueByKey!264 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(declare-fun b!234581 () Bool)

(declare-fun Unit!7240 () Unit!7238)

(assert (=> b!234581 (= e!152364 Unit!7240)))

(declare-fun b!234582 () Bool)

(assert (=> b!234582 (= e!152363 (isDefined!206 (getValueByKey!264 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932)))))

(assert (= (and d!59017 c!39067) b!234580))

(assert (= (and d!59017 (not c!39067)) b!234581))

(assert (= (and d!59017 (not res!115031)) b!234582))

(declare-fun m!255361 () Bool)

(assert (=> d!59017 m!255361))

(declare-fun m!255363 () Bool)

(assert (=> b!234580 m!255363))

(declare-fun m!255365 () Bool)

(assert (=> b!234580 m!255365))

(assert (=> b!234580 m!255365))

(declare-fun m!255367 () Bool)

(assert (=> b!234580 m!255367))

(assert (=> b!234582 m!255365))

(assert (=> b!234582 m!255365))

(assert (=> b!234582 m!255367))

(assert (=> b!234514 d!59017))

(declare-fun b!234625 () Bool)

(declare-fun e!152398 () Bool)

(declare-fun e!152391 () Bool)

(assert (=> b!234625 (= e!152398 e!152391)))

(declare-fun res!115057 () Bool)

(declare-fun call!21815 () Bool)

(assert (=> b!234625 (= res!115057 call!21815)))

(assert (=> b!234625 (=> (not res!115057) (not e!152391))))

(declare-fun b!234626 () Bool)

(declare-fun res!115056 () Bool)

(declare-fun e!152400 () Bool)

(assert (=> b!234626 (=> (not res!115056) (not e!152400))))

(declare-fun e!152392 () Bool)

(assert (=> b!234626 (= res!115056 e!152392)))

(declare-fun res!115054 () Bool)

(assert (=> b!234626 (=> res!115054 e!152392)))

(declare-fun e!152395 () Bool)

(assert (=> b!234626 (= res!115054 (not e!152395))))

(declare-fun res!115058 () Bool)

(assert (=> b!234626 (=> (not res!115058) (not e!152395))))

(assert (=> b!234626 (= res!115058 (bvslt #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(declare-fun call!21810 () ListLongMap!3499)

(declare-fun call!21816 () ListLongMap!3499)

(declare-fun bm!21807 () Bool)

(declare-fun call!21812 () ListLongMap!3499)

(declare-fun call!21811 () ListLongMap!3499)

(declare-fun c!39085 () Bool)

(declare-fun c!39080 () Bool)

(declare-fun +!641 (ListLongMap!3499 tuple2!4596) ListLongMap!3499)

(assert (=> bm!21807 (= call!21810 (+!641 (ite c!39080 call!21811 (ite c!39085 call!21816 call!21812)) (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(declare-fun bm!21808 () Bool)

(declare-fun call!21813 () Bool)

(declare-fun lt!118601 () ListLongMap!3499)

(assert (=> bm!21808 (= call!21813 (contains!1642 lt!118601 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234627 () Bool)

(declare-fun e!152403 () Bool)

(declare-fun e!152393 () Bool)

(assert (=> b!234627 (= e!152403 e!152393)))

(declare-fun res!115055 () Bool)

(assert (=> b!234627 (= res!115055 call!21813)))

(assert (=> b!234627 (=> (not res!115055) (not e!152393))))

(declare-fun b!234628 () Bool)

(declare-fun apply!208 (ListLongMap!3499 (_ BitVec 64)) V!7881)

(assert (=> b!234628 (= e!152391 (= (apply!208 lt!118601 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4202 thiss!1504)))))

(declare-fun b!234629 () Bool)

(declare-fun e!152401 () ListLongMap!3499)

(assert (=> b!234629 (= e!152401 (+!641 call!21810 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))

(declare-fun b!234630 () Bool)

(declare-fun e!152397 () Unit!7238)

(declare-fun Unit!7241 () Unit!7238)

(assert (=> b!234630 (= e!152397 Unit!7241)))

(declare-fun b!234631 () Bool)

(assert (=> b!234631 (= e!152393 (= (apply!208 lt!118601 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4202 thiss!1504)))))

(declare-fun b!234632 () Bool)

(assert (=> b!234632 (= e!152398 (not call!21815))))

(declare-fun b!234633 () Bool)

(declare-fun e!152394 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!234633 (= e!152394 (validKeyInArray!0 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234634 () Bool)

(assert (=> b!234634 (= e!152403 (not call!21813))))

(declare-fun b!234635 () Bool)

(assert (=> b!234635 (= e!152400 e!152398)))

(declare-fun c!39084 () Bool)

(assert (=> b!234635 (= c!39084 (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234636 () Bool)

(declare-fun e!152399 () ListLongMap!3499)

(assert (=> b!234636 (= e!152399 call!21812)))

(declare-fun bm!21809 () Bool)

(declare-fun call!21814 () ListLongMap!3499)

(assert (=> bm!21809 (= call!21814 call!21810)))

(declare-fun b!234637 () Bool)

(declare-fun e!152396 () ListLongMap!3499)

(assert (=> b!234637 (= e!152396 call!21814)))

(declare-fun bm!21810 () Bool)

(assert (=> bm!21810 (= call!21816 call!21811)))

(declare-fun bm!21811 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!524 (array!11597 array!11595 (_ BitVec 32) (_ BitVec 32) V!7881 V!7881 (_ BitVec 32) Int) ListLongMap!3499)

(assert (=> bm!21811 (= call!21811 (getCurrentListMapNoExtraKeys!524 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))

(declare-fun b!234638 () Bool)

(assert (=> b!234638 (= e!152399 call!21814)))

(declare-fun b!234639 () Bool)

(declare-fun c!39081 () Bool)

(assert (=> b!234639 (= c!39081 (and (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!234639 (= e!152396 e!152399)))

(declare-fun bm!21812 () Bool)

(assert (=> bm!21812 (= call!21815 (contains!1642 lt!118601 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234640 () Bool)

(declare-fun e!152402 () Bool)

(declare-fun get!2828 (ValueCell!2744 V!7881) V!7881)

(declare-fun dynLambda!542 (Int (_ BitVec 64)) V!7881)

(assert (=> b!234640 (= e!152402 (= (apply!208 lt!118601 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)) (get!2828 (select (arr!5511 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!542 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234640 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5848 (_values!4344 thiss!1504))))))

(assert (=> b!234640 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(declare-fun b!234641 () Bool)

(declare-fun res!115052 () Bool)

(assert (=> b!234641 (=> (not res!115052) (not e!152400))))

(assert (=> b!234641 (= res!115052 e!152403)))

(declare-fun c!39082 () Bool)

(assert (=> b!234641 (= c!39082 (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!234642 () Bool)

(assert (=> b!234642 (= e!152392 e!152402)))

(declare-fun res!115051 () Bool)

(assert (=> b!234642 (=> (not res!115051) (not e!152402))))

(assert (=> b!234642 (= res!115051 (contains!1642 lt!118601 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(declare-fun bm!21813 () Bool)

(assert (=> bm!21813 (= call!21812 call!21816)))

(declare-fun d!59019 () Bool)

(assert (=> d!59019 e!152400))

(declare-fun res!115053 () Bool)

(assert (=> d!59019 (=> (not res!115053) (not e!152400))))

(assert (=> d!59019 (= res!115053 (or (bvsge #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))))

(declare-fun lt!118608 () ListLongMap!3499)

(assert (=> d!59019 (= lt!118601 lt!118608)))

(declare-fun lt!118603 () Unit!7238)

(assert (=> d!59019 (= lt!118603 e!152397)))

(declare-fun c!39083 () Bool)

(assert (=> d!59019 (= c!39083 e!152394)))

(declare-fun res!115050 () Bool)

(assert (=> d!59019 (=> (not res!115050) (not e!152394))))

(assert (=> d!59019 (= res!115050 (bvslt #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(assert (=> d!59019 (= lt!118608 e!152401)))

(assert (=> d!59019 (= c!39080 (and (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59019 (validMask!0 (mask!10314 thiss!1504))))

(assert (=> d!59019 (= (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)) lt!118601)))

(declare-fun b!234643 () Bool)

(declare-fun lt!118616 () Unit!7238)

(assert (=> b!234643 (= e!152397 lt!118616)))

(declare-fun lt!118600 () ListLongMap!3499)

(assert (=> b!234643 (= lt!118600 (getCurrentListMapNoExtraKeys!524 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))

(declare-fun lt!118615 () (_ BitVec 64))

(assert (=> b!234643 (= lt!118615 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118614 () (_ BitVec 64))

(assert (=> b!234643 (= lt!118614 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118613 () Unit!7238)

(declare-fun addStillContains!184 (ListLongMap!3499 (_ BitVec 64) V!7881 (_ BitVec 64)) Unit!7238)

(assert (=> b!234643 (= lt!118613 (addStillContains!184 lt!118600 lt!118615 (zeroValue!4202 thiss!1504) lt!118614))))

(assert (=> b!234643 (contains!1642 (+!641 lt!118600 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504))) lt!118614)))

(declare-fun lt!118602 () Unit!7238)

(assert (=> b!234643 (= lt!118602 lt!118613)))

(declare-fun lt!118611 () ListLongMap!3499)

(assert (=> b!234643 (= lt!118611 (getCurrentListMapNoExtraKeys!524 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))

(declare-fun lt!118606 () (_ BitVec 64))

(assert (=> b!234643 (= lt!118606 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118617 () (_ BitVec 64))

(assert (=> b!234643 (= lt!118617 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118607 () Unit!7238)

(declare-fun addApplyDifferent!184 (ListLongMap!3499 (_ BitVec 64) V!7881 (_ BitVec 64)) Unit!7238)

(assert (=> b!234643 (= lt!118607 (addApplyDifferent!184 lt!118611 lt!118606 (minValue!4202 thiss!1504) lt!118617))))

(assert (=> b!234643 (= (apply!208 (+!641 lt!118611 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504))) lt!118617) (apply!208 lt!118611 lt!118617))))

(declare-fun lt!118604 () Unit!7238)

(assert (=> b!234643 (= lt!118604 lt!118607)))

(declare-fun lt!118610 () ListLongMap!3499)

(assert (=> b!234643 (= lt!118610 (getCurrentListMapNoExtraKeys!524 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))

(declare-fun lt!118612 () (_ BitVec 64))

(assert (=> b!234643 (= lt!118612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118619 () (_ BitVec 64))

(assert (=> b!234643 (= lt!118619 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118618 () Unit!7238)

(assert (=> b!234643 (= lt!118618 (addApplyDifferent!184 lt!118610 lt!118612 (zeroValue!4202 thiss!1504) lt!118619))))

(assert (=> b!234643 (= (apply!208 (+!641 lt!118610 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504))) lt!118619) (apply!208 lt!118610 lt!118619))))

(declare-fun lt!118609 () Unit!7238)

(assert (=> b!234643 (= lt!118609 lt!118618)))

(declare-fun lt!118620 () ListLongMap!3499)

(assert (=> b!234643 (= lt!118620 (getCurrentListMapNoExtraKeys!524 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))

(declare-fun lt!118621 () (_ BitVec 64))

(assert (=> b!234643 (= lt!118621 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118605 () (_ BitVec 64))

(assert (=> b!234643 (= lt!118605 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234643 (= lt!118616 (addApplyDifferent!184 lt!118620 lt!118621 (minValue!4202 thiss!1504) lt!118605))))

(assert (=> b!234643 (= (apply!208 (+!641 lt!118620 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504))) lt!118605) (apply!208 lt!118620 lt!118605))))

(declare-fun b!234644 () Bool)

(assert (=> b!234644 (= e!152401 e!152396)))

(assert (=> b!234644 (= c!39085 (and (not (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4098 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234645 () Bool)

(assert (=> b!234645 (= e!152395 (validKeyInArray!0 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59019 c!39080) b!234629))

(assert (= (and d!59019 (not c!39080)) b!234644))

(assert (= (and b!234644 c!39085) b!234637))

(assert (= (and b!234644 (not c!39085)) b!234639))

(assert (= (and b!234639 c!39081) b!234638))

(assert (= (and b!234639 (not c!39081)) b!234636))

(assert (= (or b!234638 b!234636) bm!21813))

(assert (= (or b!234637 bm!21813) bm!21810))

(assert (= (or b!234637 b!234638) bm!21809))

(assert (= (or b!234629 bm!21810) bm!21811))

(assert (= (or b!234629 bm!21809) bm!21807))

(assert (= (and d!59019 res!115050) b!234633))

(assert (= (and d!59019 c!39083) b!234643))

(assert (= (and d!59019 (not c!39083)) b!234630))

(assert (= (and d!59019 res!115053) b!234626))

(assert (= (and b!234626 res!115058) b!234645))

(assert (= (and b!234626 (not res!115054)) b!234642))

(assert (= (and b!234642 res!115051) b!234640))

(assert (= (and b!234626 res!115056) b!234641))

(assert (= (and b!234641 c!39082) b!234627))

(assert (= (and b!234641 (not c!39082)) b!234634))

(assert (= (and b!234627 res!115055) b!234631))

(assert (= (or b!234627 b!234634) bm!21808))

(assert (= (and b!234641 res!115052) b!234635))

(assert (= (and b!234635 c!39084) b!234625))

(assert (= (and b!234635 (not c!39084)) b!234632))

(assert (= (and b!234625 res!115057) b!234628))

(assert (= (or b!234625 b!234632) bm!21812))

(declare-fun b_lambda!7869 () Bool)

(assert (=> (not b_lambda!7869) (not b!234640)))

(declare-fun t!8486 () Bool)

(declare-fun tb!2921 () Bool)

(assert (=> (and b!234517 (= (defaultEntry!4361 thiss!1504) (defaultEntry!4361 thiss!1504)) t!8486) tb!2921))

(declare-fun result!5101 () Bool)

(assert (=> tb!2921 (= result!5101 tp_is_empty!6175)))

(assert (=> b!234640 t!8486))

(declare-fun b_and!13213 () Bool)

(assert (= b_and!13207 (and (=> t!8486 result!5101) b_and!13213)))

(declare-fun m!255369 () Bool)

(assert (=> b!234628 m!255369))

(declare-fun m!255371 () Bool)

(assert (=> b!234640 m!255371))

(declare-fun m!255373 () Bool)

(assert (=> b!234640 m!255373))

(declare-fun m!255375 () Bool)

(assert (=> b!234640 m!255375))

(declare-fun m!255377 () Bool)

(assert (=> b!234640 m!255377))

(assert (=> b!234640 m!255371))

(declare-fun m!255379 () Bool)

(assert (=> b!234640 m!255379))

(assert (=> b!234640 m!255373))

(assert (=> b!234640 m!255377))

(assert (=> b!234642 m!255373))

(assert (=> b!234642 m!255373))

(declare-fun m!255381 () Bool)

(assert (=> b!234642 m!255381))

(declare-fun m!255383 () Bool)

(assert (=> bm!21807 m!255383))

(declare-fun m!255385 () Bool)

(assert (=> b!234631 m!255385))

(declare-fun m!255387 () Bool)

(assert (=> bm!21808 m!255387))

(assert (=> d!59019 m!255313))

(declare-fun m!255389 () Bool)

(assert (=> bm!21811 m!255389))

(declare-fun m!255391 () Bool)

(assert (=> b!234643 m!255391))

(declare-fun m!255393 () Bool)

(assert (=> b!234643 m!255393))

(declare-fun m!255395 () Bool)

(assert (=> b!234643 m!255395))

(declare-fun m!255397 () Bool)

(assert (=> b!234643 m!255397))

(declare-fun m!255399 () Bool)

(assert (=> b!234643 m!255399))

(declare-fun m!255401 () Bool)

(assert (=> b!234643 m!255401))

(assert (=> b!234643 m!255389))

(assert (=> b!234643 m!255373))

(declare-fun m!255403 () Bool)

(assert (=> b!234643 m!255403))

(declare-fun m!255405 () Bool)

(assert (=> b!234643 m!255405))

(assert (=> b!234643 m!255401))

(declare-fun m!255407 () Bool)

(assert (=> b!234643 m!255407))

(declare-fun m!255409 () Bool)

(assert (=> b!234643 m!255409))

(assert (=> b!234643 m!255403))

(assert (=> b!234643 m!255399))

(declare-fun m!255411 () Bool)

(assert (=> b!234643 m!255411))

(declare-fun m!255413 () Bool)

(assert (=> b!234643 m!255413))

(declare-fun m!255415 () Bool)

(assert (=> b!234643 m!255415))

(assert (=> b!234643 m!255393))

(declare-fun m!255417 () Bool)

(assert (=> b!234643 m!255417))

(declare-fun m!255419 () Bool)

(assert (=> b!234643 m!255419))

(declare-fun m!255421 () Bool)

(assert (=> b!234629 m!255421))

(declare-fun m!255423 () Bool)

(assert (=> bm!21812 m!255423))

(assert (=> b!234645 m!255373))

(assert (=> b!234645 m!255373))

(declare-fun m!255425 () Bool)

(assert (=> b!234645 m!255425))

(assert (=> b!234633 m!255373))

(assert (=> b!234633 m!255373))

(assert (=> b!234633 m!255425))

(assert (=> b!234514 d!59019))

(declare-fun b!234660 () Bool)

(declare-fun e!152412 () SeekEntryResult!986)

(declare-fun lt!118629 () SeekEntryResult!986)

(assert (=> b!234660 (= e!152412 (Found!986 (index!6116 lt!118629)))))

(declare-fun e!152411 () SeekEntryResult!986)

(declare-fun b!234661 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11597 (_ BitVec 32)) SeekEntryResult!986)

(assert (=> b!234661 (= e!152411 (seekKeyOrZeroReturnVacant!0 (x!23727 lt!118629) (index!6116 lt!118629) (index!6116 lt!118629) key!932 (_keys!6428 thiss!1504) (mask!10314 thiss!1504)))))

(declare-fun d!59021 () Bool)

(declare-fun lt!118630 () SeekEntryResult!986)

(assert (=> d!59021 (and (or ((_ is Undefined!986) lt!118630) (not ((_ is Found!986) lt!118630)) (and (bvsge (index!6115 lt!118630) #b00000000000000000000000000000000) (bvslt (index!6115 lt!118630) (size!5849 (_keys!6428 thiss!1504))))) (or ((_ is Undefined!986) lt!118630) ((_ is Found!986) lt!118630) (not ((_ is MissingZero!986) lt!118630)) (and (bvsge (index!6114 lt!118630) #b00000000000000000000000000000000) (bvslt (index!6114 lt!118630) (size!5849 (_keys!6428 thiss!1504))))) (or ((_ is Undefined!986) lt!118630) ((_ is Found!986) lt!118630) ((_ is MissingZero!986) lt!118630) (not ((_ is MissingVacant!986) lt!118630)) (and (bvsge (index!6117 lt!118630) #b00000000000000000000000000000000) (bvslt (index!6117 lt!118630) (size!5849 (_keys!6428 thiss!1504))))) (or ((_ is Undefined!986) lt!118630) (ite ((_ is Found!986) lt!118630) (= (select (arr!5512 (_keys!6428 thiss!1504)) (index!6115 lt!118630)) key!932) (ite ((_ is MissingZero!986) lt!118630) (= (select (arr!5512 (_keys!6428 thiss!1504)) (index!6114 lt!118630)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!986) lt!118630) (= (select (arr!5512 (_keys!6428 thiss!1504)) (index!6117 lt!118630)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!152410 () SeekEntryResult!986)

(assert (=> d!59021 (= lt!118630 e!152410)))

(declare-fun c!39094 () Bool)

(assert (=> d!59021 (= c!39094 (and ((_ is Intermediate!986) lt!118629) (undefined!1798 lt!118629)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11597 (_ BitVec 32)) SeekEntryResult!986)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59021 (= lt!118629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10314 thiss!1504)) key!932 (_keys!6428 thiss!1504) (mask!10314 thiss!1504)))))

(assert (=> d!59021 (validMask!0 (mask!10314 thiss!1504))))

(assert (=> d!59021 (= (seekEntryOrOpen!0 key!932 (_keys!6428 thiss!1504) (mask!10314 thiss!1504)) lt!118630)))

(declare-fun b!234662 () Bool)

(assert (=> b!234662 (= e!152410 Undefined!986)))

(declare-fun b!234663 () Bool)

(declare-fun c!39093 () Bool)

(declare-fun lt!118628 () (_ BitVec 64))

(assert (=> b!234663 (= c!39093 (= lt!118628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234663 (= e!152412 e!152411)))

(declare-fun b!234664 () Bool)

(assert (=> b!234664 (= e!152411 (MissingZero!986 (index!6116 lt!118629)))))

(declare-fun b!234665 () Bool)

(assert (=> b!234665 (= e!152410 e!152412)))

(assert (=> b!234665 (= lt!118628 (select (arr!5512 (_keys!6428 thiss!1504)) (index!6116 lt!118629)))))

(declare-fun c!39092 () Bool)

(assert (=> b!234665 (= c!39092 (= lt!118628 key!932))))

(assert (= (and d!59021 c!39094) b!234662))

(assert (= (and d!59021 (not c!39094)) b!234665))

(assert (= (and b!234665 c!39092) b!234660))

(assert (= (and b!234665 (not c!39092)) b!234663))

(assert (= (and b!234663 c!39093) b!234664))

(assert (= (and b!234663 (not c!39093)) b!234661))

(declare-fun m!255427 () Bool)

(assert (=> b!234661 m!255427))

(assert (=> d!59021 m!255313))

(declare-fun m!255429 () Bool)

(assert (=> d!59021 m!255429))

(declare-fun m!255431 () Bool)

(assert (=> d!59021 m!255431))

(declare-fun m!255433 () Bool)

(assert (=> d!59021 m!255433))

(declare-fun m!255435 () Bool)

(assert (=> d!59021 m!255435))

(assert (=> d!59021 m!255433))

(declare-fun m!255437 () Bool)

(assert (=> d!59021 m!255437))

(declare-fun m!255439 () Bool)

(assert (=> b!234665 m!255439))

(assert (=> b!234515 d!59021))

(declare-fun d!59023 () Bool)

(assert (=> d!59023 (= (array_inv!3637 (_keys!6428 thiss!1504)) (bvsge (size!5849 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234517 d!59023))

(declare-fun d!59025 () Bool)

(assert (=> d!59025 (= (array_inv!3638 (_values!4344 thiss!1504)) (bvsge (size!5848 (_values!4344 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234517 d!59025))

(declare-fun d!59027 () Bool)

(assert (=> d!59027 (= (validMask!0 (mask!10314 thiss!1504)) (and (or (= (mask!10314 thiss!1504) #b00000000000000000000000000000111) (= (mask!10314 thiss!1504) #b00000000000000000000000000001111) (= (mask!10314 thiss!1504) #b00000000000000000000000000011111) (= (mask!10314 thiss!1504) #b00000000000000000000000000111111) (= (mask!10314 thiss!1504) #b00000000000000000000000001111111) (= (mask!10314 thiss!1504) #b00000000000000000000000011111111) (= (mask!10314 thiss!1504) #b00000000000000000000000111111111) (= (mask!10314 thiss!1504) #b00000000000000000000001111111111) (= (mask!10314 thiss!1504) #b00000000000000000000011111111111) (= (mask!10314 thiss!1504) #b00000000000000000000111111111111) (= (mask!10314 thiss!1504) #b00000000000000000001111111111111) (= (mask!10314 thiss!1504) #b00000000000000000011111111111111) (= (mask!10314 thiss!1504) #b00000000000000000111111111111111) (= (mask!10314 thiss!1504) #b00000000000000001111111111111111) (= (mask!10314 thiss!1504) #b00000000000000011111111111111111) (= (mask!10314 thiss!1504) #b00000000000000111111111111111111) (= (mask!10314 thiss!1504) #b00000000000001111111111111111111) (= (mask!10314 thiss!1504) #b00000000000011111111111111111111) (= (mask!10314 thiss!1504) #b00000000000111111111111111111111) (= (mask!10314 thiss!1504) #b00000000001111111111111111111111) (= (mask!10314 thiss!1504) #b00000000011111111111111111111111) (= (mask!10314 thiss!1504) #b00000000111111111111111111111111) (= (mask!10314 thiss!1504) #b00000001111111111111111111111111) (= (mask!10314 thiss!1504) #b00000011111111111111111111111111) (= (mask!10314 thiss!1504) #b00000111111111111111111111111111) (= (mask!10314 thiss!1504) #b00001111111111111111111111111111) (= (mask!10314 thiss!1504) #b00011111111111111111111111111111) (= (mask!10314 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10314 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!234512 d!59027))

(declare-fun d!59029 () Bool)

(declare-fun res!115065 () Bool)

(declare-fun e!152415 () Bool)

(assert (=> d!59029 (=> (not res!115065) (not e!152415))))

(declare-fun simpleValid!231 (LongMapFixedSize!3388) Bool)

(assert (=> d!59029 (= res!115065 (simpleValid!231 thiss!1504))))

(assert (=> d!59029 (= (valid!1352 thiss!1504) e!152415)))

(declare-fun b!234672 () Bool)

(declare-fun res!115066 () Bool)

(assert (=> b!234672 (=> (not res!115066) (not e!152415))))

(declare-fun arrayCountValidKeys!0 (array!11597 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234672 (= res!115066 (= (arrayCountValidKeys!0 (_keys!6428 thiss!1504) #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))) (_size!1743 thiss!1504)))))

(declare-fun b!234673 () Bool)

(declare-fun res!115067 () Bool)

(assert (=> b!234673 (=> (not res!115067) (not e!152415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11597 (_ BitVec 32)) Bool)

(assert (=> b!234673 (= res!115067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6428 thiss!1504) (mask!10314 thiss!1504)))))

(declare-fun b!234674 () Bool)

(declare-datatypes ((List!3525 0))(
  ( (Nil!3522) (Cons!3521 (h!4172 (_ BitVec 64)) (t!8487 List!3525)) )
))
(declare-fun arrayNoDuplicates!0 (array!11597 (_ BitVec 32) List!3525) Bool)

(assert (=> b!234674 (= e!152415 (arrayNoDuplicates!0 (_keys!6428 thiss!1504) #b00000000000000000000000000000000 Nil!3522))))

(assert (= (and d!59029 res!115065) b!234672))

(assert (= (and b!234672 res!115066) b!234673))

(assert (= (and b!234673 res!115067) b!234674))

(declare-fun m!255441 () Bool)

(assert (=> d!59029 m!255441))

(declare-fun m!255443 () Bool)

(assert (=> b!234672 m!255443))

(declare-fun m!255445 () Bool)

(assert (=> b!234673 m!255445))

(declare-fun m!255447 () Bool)

(assert (=> b!234674 m!255447))

(assert (=> start!22428 d!59029))

(declare-fun mapIsEmpty!10459 () Bool)

(declare-fun mapRes!10459 () Bool)

(assert (=> mapIsEmpty!10459 mapRes!10459))

(declare-fun mapNonEmpty!10459 () Bool)

(declare-fun tp!22114 () Bool)

(declare-fun e!152421 () Bool)

(assert (=> mapNonEmpty!10459 (= mapRes!10459 (and tp!22114 e!152421))))

(declare-fun mapValue!10459 () ValueCell!2744)

(declare-fun mapKey!10459 () (_ BitVec 32))

(declare-fun mapRest!10459 () (Array (_ BitVec 32) ValueCell!2744))

(assert (=> mapNonEmpty!10459 (= mapRest!10450 (store mapRest!10459 mapKey!10459 mapValue!10459))))

(declare-fun b!234682 () Bool)

(declare-fun e!152420 () Bool)

(assert (=> b!234682 (= e!152420 tp_is_empty!6175)))

(declare-fun condMapEmpty!10459 () Bool)

(declare-fun mapDefault!10459 () ValueCell!2744)

(assert (=> mapNonEmpty!10450 (= condMapEmpty!10459 (= mapRest!10450 ((as const (Array (_ BitVec 32) ValueCell!2744)) mapDefault!10459)))))

(assert (=> mapNonEmpty!10450 (= tp!22099 (and e!152420 mapRes!10459))))

(declare-fun b!234681 () Bool)

(assert (=> b!234681 (= e!152421 tp_is_empty!6175)))

(assert (= (and mapNonEmpty!10450 condMapEmpty!10459) mapIsEmpty!10459))

(assert (= (and mapNonEmpty!10450 (not condMapEmpty!10459)) mapNonEmpty!10459))

(assert (= (and mapNonEmpty!10459 ((_ is ValueCellFull!2744) mapValue!10459)) b!234681))

(assert (= (and mapNonEmpty!10450 ((_ is ValueCellFull!2744) mapDefault!10459)) b!234682))

(declare-fun m!255449 () Bool)

(assert (=> mapNonEmpty!10459 m!255449))

(declare-fun b_lambda!7871 () Bool)

(assert (= b_lambda!7869 (or (and b!234517 b_free!6313) b_lambda!7871)))

(check-sat (not b!234633) (not d!59017) (not b!234674) (not b!234643) (not b!234582) (not d!59021) (not b!234640) (not b!234631) (not mapNonEmpty!10459) (not b!234629) (not bm!21811) (not b!234642) (not bm!21812) tp_is_empty!6175 (not b!234672) (not b_next!6313) (not b!234661) (not b!234580) b_and!13213 (not b!234673) (not b!234628) (not b!234645) (not d!59029) (not bm!21807) (not d!59019) (not b_lambda!7871) (not bm!21808))
(check-sat b_and!13213 (not b_next!6313))
(get-model)

(declare-fun d!59031 () Bool)

(declare-fun get!2829 (Option!270) V!7881)

(assert (=> d!59031 (= (apply!208 lt!118601 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2829 (getValueByKey!264 (toList!1765 lt!118601) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8670 () Bool)

(assert (= bs!8670 d!59031))

(declare-fun m!255451 () Bool)

(assert (=> bs!8670 m!255451))

(assert (=> bs!8670 m!255451))

(declare-fun m!255453 () Bool)

(assert (=> bs!8670 m!255453))

(assert (=> b!234631 d!59031))

(declare-fun d!59033 () Bool)

(declare-fun isEmpty!514 (Option!270) Bool)

(assert (=> d!59033 (= (isDefined!206 (getValueByKey!264 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932)) (not (isEmpty!514 (getValueByKey!264 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))))

(declare-fun bs!8671 () Bool)

(assert (= bs!8671 d!59033))

(assert (=> bs!8671 m!255365))

(declare-fun m!255455 () Bool)

(assert (=> bs!8671 m!255455))

(assert (=> b!234582 d!59033))

(declare-fun b!234694 () Bool)

(declare-fun e!152427 () Option!270)

(assert (=> b!234694 (= e!152427 None!268)))

(declare-fun b!234693 () Bool)

(assert (=> b!234693 (= e!152427 (getValueByKey!264 (t!8484 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) key!932))))

(declare-fun d!59035 () Bool)

(declare-fun c!39099 () Bool)

(assert (=> d!59035 (= c!39099 (and ((_ is Cons!3520) (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) (= (_1!2309 (h!4171 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) key!932)))))

(declare-fun e!152426 () Option!270)

(assert (=> d!59035 (= (getValueByKey!264 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932) e!152426)))

(declare-fun b!234691 () Bool)

(assert (=> b!234691 (= e!152426 (Some!269 (_2!2309 (h!4171 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))))))

(declare-fun b!234692 () Bool)

(assert (=> b!234692 (= e!152426 e!152427)))

(declare-fun c!39100 () Bool)

(assert (=> b!234692 (= c!39100 (and ((_ is Cons!3520) (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) (not (= (_1!2309 (h!4171 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) key!932))))))

(assert (= (and d!59035 c!39099) b!234691))

(assert (= (and d!59035 (not c!39099)) b!234692))

(assert (= (and b!234692 c!39100) b!234693))

(assert (= (and b!234692 (not c!39100)) b!234694))

(declare-fun m!255457 () Bool)

(assert (=> b!234693 m!255457))

(assert (=> b!234582 d!59035))

(declare-fun d!59037 () Bool)

(declare-fun res!115076 () Bool)

(declare-fun e!152437 () Bool)

(assert (=> d!59037 (=> res!115076 e!152437)))

(assert (=> d!59037 (= res!115076 (bvsge #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(assert (=> d!59037 (= (arrayNoDuplicates!0 (_keys!6428 thiss!1504) #b00000000000000000000000000000000 Nil!3522) e!152437)))

(declare-fun b!234705 () Bool)

(declare-fun e!152438 () Bool)

(declare-fun contains!1643 (List!3525 (_ BitVec 64)) Bool)

(assert (=> b!234705 (= e!152438 (contains!1643 Nil!3522 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234706 () Bool)

(declare-fun e!152439 () Bool)

(declare-fun call!21819 () Bool)

(assert (=> b!234706 (= e!152439 call!21819)))

(declare-fun b!234707 () Bool)

(declare-fun e!152436 () Bool)

(assert (=> b!234707 (= e!152437 e!152436)))

(declare-fun res!115075 () Bool)

(assert (=> b!234707 (=> (not res!115075) (not e!152436))))

(assert (=> b!234707 (= res!115075 (not e!152438))))

(declare-fun res!115074 () Bool)

(assert (=> b!234707 (=> (not res!115074) (not e!152438))))

(assert (=> b!234707 (= res!115074 (validKeyInArray!0 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21816 () Bool)

(declare-fun c!39103 () Bool)

(assert (=> bm!21816 (= call!21819 (arrayNoDuplicates!0 (_keys!6428 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39103 (Cons!3521 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000) Nil!3522) Nil!3522)))))

(declare-fun b!234708 () Bool)

(assert (=> b!234708 (= e!152439 call!21819)))

(declare-fun b!234709 () Bool)

(assert (=> b!234709 (= e!152436 e!152439)))

(assert (=> b!234709 (= c!39103 (validKeyInArray!0 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59037 (not res!115076)) b!234707))

(assert (= (and b!234707 res!115074) b!234705))

(assert (= (and b!234707 res!115075) b!234709))

(assert (= (and b!234709 c!39103) b!234708))

(assert (= (and b!234709 (not c!39103)) b!234706))

(assert (= (or b!234708 b!234706) bm!21816))

(assert (=> b!234705 m!255373))

(assert (=> b!234705 m!255373))

(declare-fun m!255459 () Bool)

(assert (=> b!234705 m!255459))

(assert (=> b!234707 m!255373))

(assert (=> b!234707 m!255373))

(assert (=> b!234707 m!255425))

(assert (=> bm!21816 m!255373))

(declare-fun m!255461 () Bool)

(assert (=> bm!21816 m!255461))

(assert (=> b!234709 m!255373))

(assert (=> b!234709 m!255373))

(assert (=> b!234709 m!255425))

(assert (=> b!234674 d!59037))

(declare-fun d!59039 () Bool)

(declare-fun e!152440 () Bool)

(assert (=> d!59039 e!152440))

(declare-fun res!115077 () Bool)

(assert (=> d!59039 (=> res!115077 e!152440)))

(declare-fun lt!118633 () Bool)

(assert (=> d!59039 (= res!115077 (not lt!118633))))

(declare-fun lt!118631 () Bool)

(assert (=> d!59039 (= lt!118633 lt!118631)))

(declare-fun lt!118634 () Unit!7238)

(declare-fun e!152441 () Unit!7238)

(assert (=> d!59039 (= lt!118634 e!152441)))

(declare-fun c!39104 () Bool)

(assert (=> d!59039 (= c!39104 lt!118631)))

(assert (=> d!59039 (= lt!118631 (containsKey!256 (toList!1765 lt!118601) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59039 (= (contains!1642 lt!118601 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118633)))

(declare-fun b!234710 () Bool)

(declare-fun lt!118632 () Unit!7238)

(assert (=> b!234710 (= e!152441 lt!118632)))

(assert (=> b!234710 (= lt!118632 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1765 lt!118601) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234710 (isDefined!206 (getValueByKey!264 (toList!1765 lt!118601) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234711 () Bool)

(declare-fun Unit!7242 () Unit!7238)

(assert (=> b!234711 (= e!152441 Unit!7242)))

(declare-fun b!234712 () Bool)

(assert (=> b!234712 (= e!152440 (isDefined!206 (getValueByKey!264 (toList!1765 lt!118601) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59039 c!39104) b!234710))

(assert (= (and d!59039 (not c!39104)) b!234711))

(assert (= (and d!59039 (not res!115077)) b!234712))

(declare-fun m!255463 () Bool)

(assert (=> d!59039 m!255463))

(declare-fun m!255465 () Bool)

(assert (=> b!234710 m!255465))

(declare-fun m!255467 () Bool)

(assert (=> b!234710 m!255467))

(assert (=> b!234710 m!255467))

(declare-fun m!255469 () Bool)

(assert (=> b!234710 m!255469))

(assert (=> b!234712 m!255467))

(assert (=> b!234712 m!255467))

(assert (=> b!234712 m!255469))

(assert (=> bm!21812 d!59039))

(declare-fun d!59041 () Bool)

(assert (=> d!59041 (= (validKeyInArray!0 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234633 d!59041))

(declare-fun d!59043 () Bool)

(assert (=> d!59043 (= (apply!208 lt!118601 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2829 (getValueByKey!264 (toList!1765 lt!118601) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8672 () Bool)

(assert (= bs!8672 d!59043))

(assert (=> bs!8672 m!255467))

(assert (=> bs!8672 m!255467))

(declare-fun m!255471 () Bool)

(assert (=> bs!8672 m!255471))

(assert (=> b!234628 d!59043))

(declare-fun d!59045 () Bool)

(declare-fun e!152444 () Bool)

(assert (=> d!59045 e!152444))

(declare-fun res!115082 () Bool)

(assert (=> d!59045 (=> (not res!115082) (not e!152444))))

(declare-fun lt!118644 () ListLongMap!3499)

(assert (=> d!59045 (= res!115082 (contains!1642 lt!118644 (_1!2309 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(declare-fun lt!118646 () List!3524)

(assert (=> d!59045 (= lt!118644 (ListLongMap!3500 lt!118646))))

(declare-fun lt!118643 () Unit!7238)

(declare-fun lt!118645 () Unit!7238)

(assert (=> d!59045 (= lt!118643 lt!118645)))

(assert (=> d!59045 (= (getValueByKey!264 lt!118646 (_1!2309 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))) (Some!269 (_2!2309 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!151 (List!3524 (_ BitVec 64) V!7881) Unit!7238)

(assert (=> d!59045 (= lt!118645 (lemmaContainsTupThenGetReturnValue!151 lt!118646 (_1!2309 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))) (_2!2309 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(declare-fun insertStrictlySorted!154 (List!3524 (_ BitVec 64) V!7881) List!3524)

(assert (=> d!59045 (= lt!118646 (insertStrictlySorted!154 (toList!1765 call!21810) (_1!2309 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))) (_2!2309 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(assert (=> d!59045 (= (+!641 call!21810 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))) lt!118644)))

(declare-fun b!234717 () Bool)

(declare-fun res!115083 () Bool)

(assert (=> b!234717 (=> (not res!115083) (not e!152444))))

(assert (=> b!234717 (= res!115083 (= (getValueByKey!264 (toList!1765 lt!118644) (_1!2309 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))) (Some!269 (_2!2309 (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))))

(declare-fun b!234718 () Bool)

(declare-fun contains!1644 (List!3524 tuple2!4596) Bool)

(assert (=> b!234718 (= e!152444 (contains!1644 (toList!1765 lt!118644) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))

(assert (= (and d!59045 res!115082) b!234717))

(assert (= (and b!234717 res!115083) b!234718))

(declare-fun m!255473 () Bool)

(assert (=> d!59045 m!255473))

(declare-fun m!255475 () Bool)

(assert (=> d!59045 m!255475))

(declare-fun m!255477 () Bool)

(assert (=> d!59045 m!255477))

(declare-fun m!255479 () Bool)

(assert (=> d!59045 m!255479))

(declare-fun m!255481 () Bool)

(assert (=> b!234717 m!255481))

(declare-fun m!255483 () Bool)

(assert (=> b!234718 m!255483))

(assert (=> b!234629 d!59045))

(declare-fun d!59047 () Bool)

(assert (=> d!59047 (isDefined!206 (getValueByKey!264 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(declare-fun lt!118649 () Unit!7238)

(declare-fun choose!1108 (List!3524 (_ BitVec 64)) Unit!7238)

(assert (=> d!59047 (= lt!118649 (choose!1108 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(declare-fun e!152447 () Bool)

(assert (=> d!59047 e!152447))

(declare-fun res!115086 () Bool)

(assert (=> d!59047 (=> (not res!115086) (not e!152447))))

(declare-fun isStrictlySorted!357 (List!3524) Bool)

(assert (=> d!59047 (= res!115086 (isStrictlySorted!357 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))))))

(assert (=> d!59047 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932) lt!118649)))

(declare-fun b!234721 () Bool)

(assert (=> b!234721 (= e!152447 (containsKey!256 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932))))

(assert (= (and d!59047 res!115086) b!234721))

(assert (=> d!59047 m!255365))

(assert (=> d!59047 m!255365))

(assert (=> d!59047 m!255367))

(declare-fun m!255485 () Bool)

(assert (=> d!59047 m!255485))

(declare-fun m!255487 () Bool)

(assert (=> d!59047 m!255487))

(assert (=> b!234721 m!255361))

(assert (=> b!234580 d!59047))

(assert (=> b!234580 d!59033))

(assert (=> b!234580 d!59035))

(declare-fun d!59049 () Bool)

(declare-fun res!115097 () Bool)

(declare-fun e!152450 () Bool)

(assert (=> d!59049 (=> (not res!115097) (not e!152450))))

(assert (=> d!59049 (= res!115097 (validMask!0 (mask!10314 thiss!1504)))))

(assert (=> d!59049 (= (simpleValid!231 thiss!1504) e!152450)))

(declare-fun b!234732 () Bool)

(declare-fun res!115098 () Bool)

(assert (=> b!234732 (=> (not res!115098) (not e!152450))))

(declare-fun size!5854 (LongMapFixedSize!3388) (_ BitVec 32))

(assert (=> b!234732 (= res!115098 (= (size!5854 thiss!1504) (bvadd (_size!1743 thiss!1504) (bvsdiv (bvadd (extraKeys!4098 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!234731 () Bool)

(declare-fun res!115096 () Bool)

(assert (=> b!234731 (=> (not res!115096) (not e!152450))))

(assert (=> b!234731 (= res!115096 (bvsge (size!5854 thiss!1504) (_size!1743 thiss!1504)))))

(declare-fun b!234733 () Bool)

(assert (=> b!234733 (= e!152450 (and (bvsge (extraKeys!4098 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4098 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1743 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!234730 () Bool)

(declare-fun res!115095 () Bool)

(assert (=> b!234730 (=> (not res!115095) (not e!152450))))

(assert (=> b!234730 (= res!115095 (and (= (size!5848 (_values!4344 thiss!1504)) (bvadd (mask!10314 thiss!1504) #b00000000000000000000000000000001)) (= (size!5849 (_keys!6428 thiss!1504)) (size!5848 (_values!4344 thiss!1504))) (bvsge (_size!1743 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1743 thiss!1504) (bvadd (mask!10314 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!59049 res!115097) b!234730))

(assert (= (and b!234730 res!115095) b!234731))

(assert (= (and b!234731 res!115096) b!234732))

(assert (= (and b!234732 res!115098) b!234733))

(assert (=> d!59049 m!255313))

(declare-fun m!255489 () Bool)

(assert (=> b!234732 m!255489))

(assert (=> b!234731 m!255489))

(assert (=> d!59029 d!59049))

(assert (=> b!234645 d!59041))

(declare-fun d!59051 () Bool)

(declare-fun lt!118652 () (_ BitVec 32))

(assert (=> d!59051 (and (bvsge lt!118652 #b00000000000000000000000000000000) (bvsle lt!118652 (bvsub (size!5849 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!152456 () (_ BitVec 32))

(assert (=> d!59051 (= lt!118652 e!152456)))

(declare-fun c!39109 () Bool)

(assert (=> d!59051 (= c!39109 (bvsge #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(assert (=> d!59051 (and (bvsle #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5849 (_keys!6428 thiss!1504)) (size!5849 (_keys!6428 thiss!1504))))))

(assert (=> d!59051 (= (arrayCountValidKeys!0 (_keys!6428 thiss!1504) #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))) lt!118652)))

(declare-fun bm!21819 () Bool)

(declare-fun call!21822 () (_ BitVec 32))

(assert (=> bm!21819 (= call!21822 (arrayCountValidKeys!0 (_keys!6428 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5849 (_keys!6428 thiss!1504))))))

(declare-fun b!234742 () Bool)

(declare-fun e!152455 () (_ BitVec 32))

(assert (=> b!234742 (= e!152455 (bvadd #b00000000000000000000000000000001 call!21822))))

(declare-fun b!234743 () Bool)

(assert (=> b!234743 (= e!152456 #b00000000000000000000000000000000)))

(declare-fun b!234744 () Bool)

(assert (=> b!234744 (= e!152455 call!21822)))

(declare-fun b!234745 () Bool)

(assert (=> b!234745 (= e!152456 e!152455)))

(declare-fun c!39110 () Bool)

(assert (=> b!234745 (= c!39110 (validKeyInArray!0 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59051 c!39109) b!234743))

(assert (= (and d!59051 (not c!39109)) b!234745))

(assert (= (and b!234745 c!39110) b!234742))

(assert (= (and b!234745 (not c!39110)) b!234744))

(assert (= (or b!234742 b!234744) bm!21819))

(declare-fun m!255491 () Bool)

(assert (=> bm!21819 m!255491))

(assert (=> b!234745 m!255373))

(assert (=> b!234745 m!255373))

(assert (=> b!234745 m!255425))

(assert (=> b!234672 d!59051))

(declare-fun bm!21822 () Bool)

(declare-fun call!21825 () ListLongMap!3499)

(assert (=> bm!21822 (= call!21825 (getCurrentListMapNoExtraKeys!524 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4361 thiss!1504)))))

(declare-fun b!234770 () Bool)

(declare-fun e!152474 () Bool)

(declare-fun e!152471 () Bool)

(assert (=> b!234770 (= e!152474 e!152471)))

(assert (=> b!234770 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(declare-fun res!115108 () Bool)

(declare-fun lt!118670 () ListLongMap!3499)

(assert (=> b!234770 (= res!115108 (contains!1642 lt!118670 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234770 (=> (not res!115108) (not e!152471))))

(declare-fun b!234771 () Bool)

(declare-fun e!152473 () Bool)

(assert (=> b!234771 (= e!152473 (= lt!118670 (getCurrentListMapNoExtraKeys!524 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4361 thiss!1504))))))

(declare-fun b!234772 () Bool)

(declare-fun e!152475 () Bool)

(assert (=> b!234772 (= e!152475 (validKeyInArray!0 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234772 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!234773 () Bool)

(declare-fun e!152477 () ListLongMap!3499)

(assert (=> b!234773 (= e!152477 (ListLongMap!3500 Nil!3521))))

(declare-fun b!234774 () Bool)

(declare-fun lt!118667 () Unit!7238)

(declare-fun lt!118672 () Unit!7238)

(assert (=> b!234774 (= lt!118667 lt!118672)))

(declare-fun lt!118668 () ListLongMap!3499)

(declare-fun lt!118671 () (_ BitVec 64))

(declare-fun lt!118673 () (_ BitVec 64))

(declare-fun lt!118669 () V!7881)

(assert (=> b!234774 (not (contains!1642 (+!641 lt!118668 (tuple2!4597 lt!118671 lt!118669)) lt!118673))))

(declare-fun addStillNotContains!115 (ListLongMap!3499 (_ BitVec 64) V!7881 (_ BitVec 64)) Unit!7238)

(assert (=> b!234774 (= lt!118672 (addStillNotContains!115 lt!118668 lt!118671 lt!118669 lt!118673))))

(assert (=> b!234774 (= lt!118673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!234774 (= lt!118669 (get!2828 (select (arr!5511 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!542 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234774 (= lt!118671 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234774 (= lt!118668 call!21825)))

(declare-fun e!152476 () ListLongMap!3499)

(assert (=> b!234774 (= e!152476 (+!641 call!21825 (tuple2!4597 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000) (get!2828 (select (arr!5511 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!542 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!234775 () Bool)

(assert (=> b!234775 (= e!152477 e!152476)))

(declare-fun c!39119 () Bool)

(assert (=> b!234775 (= c!39119 (validKeyInArray!0 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234776 () Bool)

(declare-fun e!152472 () Bool)

(assert (=> b!234776 (= e!152472 e!152474)))

(declare-fun c!39120 () Bool)

(assert (=> b!234776 (= c!39120 e!152475)))

(declare-fun res!115109 () Bool)

(assert (=> b!234776 (=> (not res!115109) (not e!152475))))

(assert (=> b!234776 (= res!115109 (bvslt #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(declare-fun d!59053 () Bool)

(assert (=> d!59053 e!152472))

(declare-fun res!115110 () Bool)

(assert (=> d!59053 (=> (not res!115110) (not e!152472))))

(assert (=> d!59053 (= res!115110 (not (contains!1642 lt!118670 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59053 (= lt!118670 e!152477)))

(declare-fun c!39122 () Bool)

(assert (=> d!59053 (= c!39122 (bvsge #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(assert (=> d!59053 (validMask!0 (mask!10314 thiss!1504))))

(assert (=> d!59053 (= (getCurrentListMapNoExtraKeys!524 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)) lt!118670)))

(declare-fun b!234777 () Bool)

(assert (=> b!234777 (= e!152476 call!21825)))

(declare-fun b!234778 () Bool)

(declare-fun isEmpty!515 (ListLongMap!3499) Bool)

(assert (=> b!234778 (= e!152473 (isEmpty!515 lt!118670))))

(declare-fun b!234779 () Bool)

(declare-fun res!115107 () Bool)

(assert (=> b!234779 (=> (not res!115107) (not e!152472))))

(assert (=> b!234779 (= res!115107 (not (contains!1642 lt!118670 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234780 () Bool)

(assert (=> b!234780 (= e!152474 e!152473)))

(declare-fun c!39121 () Bool)

(assert (=> b!234780 (= c!39121 (bvslt #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(declare-fun b!234781 () Bool)

(assert (=> b!234781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(assert (=> b!234781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5848 (_values!4344 thiss!1504))))))

(assert (=> b!234781 (= e!152471 (= (apply!208 lt!118670 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)) (get!2828 (select (arr!5511 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!542 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!59053 c!39122) b!234773))

(assert (= (and d!59053 (not c!39122)) b!234775))

(assert (= (and b!234775 c!39119) b!234774))

(assert (= (and b!234775 (not c!39119)) b!234777))

(assert (= (or b!234774 b!234777) bm!21822))

(assert (= (and d!59053 res!115110) b!234779))

(assert (= (and b!234779 res!115107) b!234776))

(assert (= (and b!234776 res!115109) b!234772))

(assert (= (and b!234776 c!39120) b!234770))

(assert (= (and b!234776 (not c!39120)) b!234780))

(assert (= (and b!234770 res!115108) b!234781))

(assert (= (and b!234780 c!39121) b!234771))

(assert (= (and b!234780 (not c!39121)) b!234778))

(declare-fun b_lambda!7873 () Bool)

(assert (=> (not b_lambda!7873) (not b!234774)))

(assert (=> b!234774 t!8486))

(declare-fun b_and!13215 () Bool)

(assert (= b_and!13213 (and (=> t!8486 result!5101) b_and!13215)))

(declare-fun b_lambda!7875 () Bool)

(assert (=> (not b_lambda!7875) (not b!234781)))

(assert (=> b!234781 t!8486))

(declare-fun b_and!13217 () Bool)

(assert (= b_and!13215 (and (=> t!8486 result!5101) b_and!13217)))

(assert (=> b!234775 m!255373))

(assert (=> b!234775 m!255373))

(assert (=> b!234775 m!255425))

(declare-fun m!255493 () Bool)

(assert (=> b!234779 m!255493))

(assert (=> b!234781 m!255377))

(assert (=> b!234781 m!255371))

(assert (=> b!234781 m!255377))

(assert (=> b!234781 m!255371))

(assert (=> b!234781 m!255379))

(assert (=> b!234781 m!255373))

(assert (=> b!234781 m!255373))

(declare-fun m!255495 () Bool)

(assert (=> b!234781 m!255495))

(declare-fun m!255497 () Bool)

(assert (=> b!234778 m!255497))

(declare-fun m!255499 () Bool)

(assert (=> b!234771 m!255499))

(declare-fun m!255501 () Bool)

(assert (=> b!234774 m!255501))

(assert (=> b!234774 m!255377))

(declare-fun m!255503 () Bool)

(assert (=> b!234774 m!255503))

(assert (=> b!234774 m!255373))

(assert (=> b!234774 m!255371))

(assert (=> b!234774 m!255377))

(assert (=> b!234774 m!255371))

(assert (=> b!234774 m!255379))

(declare-fun m!255505 () Bool)

(assert (=> b!234774 m!255505))

(assert (=> b!234774 m!255503))

(declare-fun m!255507 () Bool)

(assert (=> b!234774 m!255507))

(assert (=> bm!21822 m!255499))

(assert (=> b!234772 m!255373))

(assert (=> b!234772 m!255373))

(assert (=> b!234772 m!255425))

(assert (=> b!234770 m!255373))

(assert (=> b!234770 m!255373))

(declare-fun m!255509 () Bool)

(assert (=> b!234770 m!255509))

(declare-fun m!255511 () Bool)

(assert (=> d!59053 m!255511))

(assert (=> d!59053 m!255313))

(assert (=> bm!21811 d!59053))

(assert (=> d!59019 d!59027))

(declare-fun b!234800 () Bool)

(declare-fun e!152489 () Bool)

(declare-fun e!152491 () Bool)

(assert (=> b!234800 (= e!152489 e!152491)))

(declare-fun res!115117 () Bool)

(declare-fun lt!118679 () SeekEntryResult!986)

(assert (=> b!234800 (= res!115117 (and ((_ is Intermediate!986) lt!118679) (not (undefined!1798 lt!118679)) (bvslt (x!23727 lt!118679) #b01111111111111111111111111111110) (bvsge (x!23727 lt!118679) #b00000000000000000000000000000000) (bvsge (x!23727 lt!118679) #b00000000000000000000000000000000)))))

(assert (=> b!234800 (=> (not res!115117) (not e!152491))))

(declare-fun d!59055 () Bool)

(assert (=> d!59055 e!152489))

(declare-fun c!39131 () Bool)

(assert (=> d!59055 (= c!39131 (and ((_ is Intermediate!986) lt!118679) (undefined!1798 lt!118679)))))

(declare-fun e!152488 () SeekEntryResult!986)

(assert (=> d!59055 (= lt!118679 e!152488)))

(declare-fun c!39129 () Bool)

(assert (=> d!59055 (= c!39129 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!118678 () (_ BitVec 64))

(assert (=> d!59055 (= lt!118678 (select (arr!5512 (_keys!6428 thiss!1504)) (toIndex!0 key!932 (mask!10314 thiss!1504))))))

(assert (=> d!59055 (validMask!0 (mask!10314 thiss!1504))))

(assert (=> d!59055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10314 thiss!1504)) key!932 (_keys!6428 thiss!1504) (mask!10314 thiss!1504)) lt!118679)))

(declare-fun b!234801 () Bool)

(assert (=> b!234801 (= e!152488 (Intermediate!986 true (toIndex!0 key!932 (mask!10314 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!234802 () Bool)

(assert (=> b!234802 (and (bvsge (index!6116 lt!118679) #b00000000000000000000000000000000) (bvslt (index!6116 lt!118679) (size!5849 (_keys!6428 thiss!1504))))))

(declare-fun e!152490 () Bool)

(assert (=> b!234802 (= e!152490 (= (select (arr!5512 (_keys!6428 thiss!1504)) (index!6116 lt!118679)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234803 () Bool)

(declare-fun e!152492 () SeekEntryResult!986)

(assert (=> b!234803 (= e!152492 (Intermediate!986 false (toIndex!0 key!932 (mask!10314 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!234804 () Bool)

(assert (=> b!234804 (and (bvsge (index!6116 lt!118679) #b00000000000000000000000000000000) (bvslt (index!6116 lt!118679) (size!5849 (_keys!6428 thiss!1504))))))

(declare-fun res!115118 () Bool)

(assert (=> b!234804 (= res!115118 (= (select (arr!5512 (_keys!6428 thiss!1504)) (index!6116 lt!118679)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234804 (=> res!115118 e!152490)))

(declare-fun b!234805 () Bool)

(assert (=> b!234805 (= e!152488 e!152492)))

(declare-fun c!39130 () Bool)

(assert (=> b!234805 (= c!39130 (or (= lt!118678 key!932) (= (bvadd lt!118678 lt!118678) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234806 () Bool)

(assert (=> b!234806 (= e!152489 (bvsge (x!23727 lt!118679) #b01111111111111111111111111111110))))

(declare-fun b!234807 () Bool)

(assert (=> b!234807 (and (bvsge (index!6116 lt!118679) #b00000000000000000000000000000000) (bvslt (index!6116 lt!118679) (size!5849 (_keys!6428 thiss!1504))))))

(declare-fun res!115119 () Bool)

(assert (=> b!234807 (= res!115119 (= (select (arr!5512 (_keys!6428 thiss!1504)) (index!6116 lt!118679)) key!932))))

(assert (=> b!234807 (=> res!115119 e!152490)))

(assert (=> b!234807 (= e!152491 e!152490)))

(declare-fun b!234808 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234808 (= e!152492 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10314 thiss!1504)) #b00000000000000000000000000000000 (mask!10314 thiss!1504)) key!932 (_keys!6428 thiss!1504) (mask!10314 thiss!1504)))))

(assert (= (and d!59055 c!39129) b!234801))

(assert (= (and d!59055 (not c!39129)) b!234805))

(assert (= (and b!234805 c!39130) b!234803))

(assert (= (and b!234805 (not c!39130)) b!234808))

(assert (= (and d!59055 c!39131) b!234806))

(assert (= (and d!59055 (not c!39131)) b!234800))

(assert (= (and b!234800 res!115117) b!234807))

(assert (= (and b!234807 (not res!115119)) b!234804))

(assert (= (and b!234804 (not res!115118)) b!234802))

(assert (=> d!59055 m!255433))

(declare-fun m!255513 () Bool)

(assert (=> d!59055 m!255513))

(assert (=> d!59055 m!255313))

(declare-fun m!255515 () Bool)

(assert (=> b!234807 m!255515))

(assert (=> b!234804 m!255515))

(assert (=> b!234802 m!255515))

(assert (=> b!234808 m!255433))

(declare-fun m!255517 () Bool)

(assert (=> b!234808 m!255517))

(assert (=> b!234808 m!255517))

(declare-fun m!255519 () Bool)

(assert (=> b!234808 m!255519))

(assert (=> d!59021 d!59055))

(declare-fun d!59057 () Bool)

(declare-fun lt!118685 () (_ BitVec 32))

(declare-fun lt!118684 () (_ BitVec 32))

(assert (=> d!59057 (= lt!118685 (bvmul (bvxor lt!118684 (bvlshr lt!118684 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59057 (= lt!118684 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59057 (and (bvsge (mask!10314 thiss!1504) #b00000000000000000000000000000000) (let ((res!115120 (let ((h!4173 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23745 (bvmul (bvxor h!4173 (bvlshr h!4173 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23745 (bvlshr x!23745 #b00000000000000000000000000001101)) (mask!10314 thiss!1504)))))) (and (bvslt res!115120 (bvadd (mask!10314 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!115120 #b00000000000000000000000000000000))))))

(assert (=> d!59057 (= (toIndex!0 key!932 (mask!10314 thiss!1504)) (bvand (bvxor lt!118685 (bvlshr lt!118685 #b00000000000000000000000000001101)) (mask!10314 thiss!1504)))))

(assert (=> d!59021 d!59057))

(assert (=> d!59021 d!59027))

(declare-fun b!234817 () Bool)

(declare-fun e!152499 () Bool)

(declare-fun call!21828 () Bool)

(assert (=> b!234817 (= e!152499 call!21828)))

(declare-fun d!59059 () Bool)

(declare-fun res!115125 () Bool)

(declare-fun e!152500 () Bool)

(assert (=> d!59059 (=> res!115125 e!152500)))

(assert (=> d!59059 (= res!115125 (bvsge #b00000000000000000000000000000000 (size!5849 (_keys!6428 thiss!1504))))))

(assert (=> d!59059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6428 thiss!1504) (mask!10314 thiss!1504)) e!152500)))

(declare-fun bm!21825 () Bool)

(assert (=> bm!21825 (= call!21828 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6428 thiss!1504) (mask!10314 thiss!1504)))))

(declare-fun b!234818 () Bool)

(assert (=> b!234818 (= e!152500 e!152499)))

(declare-fun c!39134 () Bool)

(assert (=> b!234818 (= c!39134 (validKeyInArray!0 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234819 () Bool)

(declare-fun e!152501 () Bool)

(assert (=> b!234819 (= e!152499 e!152501)))

(declare-fun lt!118694 () (_ BitVec 64))

(assert (=> b!234819 (= lt!118694 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118692 () Unit!7238)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11597 (_ BitVec 64) (_ BitVec 32)) Unit!7238)

(assert (=> b!234819 (= lt!118692 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6428 thiss!1504) lt!118694 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!234819 (arrayContainsKey!0 (_keys!6428 thiss!1504) lt!118694 #b00000000000000000000000000000000)))

(declare-fun lt!118693 () Unit!7238)

(assert (=> b!234819 (= lt!118693 lt!118692)))

(declare-fun res!115126 () Bool)

(assert (=> b!234819 (= res!115126 (= (seekEntryOrOpen!0 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000) (_keys!6428 thiss!1504) (mask!10314 thiss!1504)) (Found!986 #b00000000000000000000000000000000)))))

(assert (=> b!234819 (=> (not res!115126) (not e!152501))))

(declare-fun b!234820 () Bool)

(assert (=> b!234820 (= e!152501 call!21828)))

(assert (= (and d!59059 (not res!115125)) b!234818))

(assert (= (and b!234818 c!39134) b!234819))

(assert (= (and b!234818 (not c!39134)) b!234817))

(assert (= (and b!234819 res!115126) b!234820))

(assert (= (or b!234820 b!234817) bm!21825))

(declare-fun m!255521 () Bool)

(assert (=> bm!21825 m!255521))

(assert (=> b!234818 m!255373))

(assert (=> b!234818 m!255373))

(assert (=> b!234818 m!255425))

(assert (=> b!234819 m!255373))

(declare-fun m!255523 () Bool)

(assert (=> b!234819 m!255523))

(declare-fun m!255525 () Bool)

(assert (=> b!234819 m!255525))

(assert (=> b!234819 m!255373))

(declare-fun m!255527 () Bool)

(assert (=> b!234819 m!255527))

(assert (=> b!234673 d!59059))

(declare-fun b!234833 () Bool)

(declare-fun e!152510 () SeekEntryResult!986)

(assert (=> b!234833 (= e!152510 (Found!986 (index!6116 lt!118629)))))

(declare-fun b!234834 () Bool)

(declare-fun e!152509 () SeekEntryResult!986)

(assert (=> b!234834 (= e!152509 e!152510)))

(declare-fun c!39141 () Bool)

(declare-fun lt!118699 () (_ BitVec 64))

(assert (=> b!234834 (= c!39141 (= lt!118699 key!932))))

(declare-fun b!234835 () Bool)

(declare-fun e!152508 () SeekEntryResult!986)

(assert (=> b!234835 (= e!152508 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23727 lt!118629) #b00000000000000000000000000000001) (nextIndex!0 (index!6116 lt!118629) (x!23727 lt!118629) (mask!10314 thiss!1504)) (index!6116 lt!118629) key!932 (_keys!6428 thiss!1504) (mask!10314 thiss!1504)))))

(declare-fun b!234836 () Bool)

(declare-fun c!39143 () Bool)

(assert (=> b!234836 (= c!39143 (= lt!118699 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234836 (= e!152510 e!152508)))

(declare-fun b!234837 () Bool)

(assert (=> b!234837 (= e!152508 (MissingVacant!986 (index!6116 lt!118629)))))

(declare-fun b!234838 () Bool)

(assert (=> b!234838 (= e!152509 Undefined!986)))

(declare-fun lt!118700 () SeekEntryResult!986)

(declare-fun d!59061 () Bool)

(assert (=> d!59061 (and (or ((_ is Undefined!986) lt!118700) (not ((_ is Found!986) lt!118700)) (and (bvsge (index!6115 lt!118700) #b00000000000000000000000000000000) (bvslt (index!6115 lt!118700) (size!5849 (_keys!6428 thiss!1504))))) (or ((_ is Undefined!986) lt!118700) ((_ is Found!986) lt!118700) (not ((_ is MissingVacant!986) lt!118700)) (not (= (index!6117 lt!118700) (index!6116 lt!118629))) (and (bvsge (index!6117 lt!118700) #b00000000000000000000000000000000) (bvslt (index!6117 lt!118700) (size!5849 (_keys!6428 thiss!1504))))) (or ((_ is Undefined!986) lt!118700) (ite ((_ is Found!986) lt!118700) (= (select (arr!5512 (_keys!6428 thiss!1504)) (index!6115 lt!118700)) key!932) (and ((_ is MissingVacant!986) lt!118700) (= (index!6117 lt!118700) (index!6116 lt!118629)) (= (select (arr!5512 (_keys!6428 thiss!1504)) (index!6117 lt!118700)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59061 (= lt!118700 e!152509)))

(declare-fun c!39142 () Bool)

(assert (=> d!59061 (= c!39142 (bvsge (x!23727 lt!118629) #b01111111111111111111111111111110))))

(assert (=> d!59061 (= lt!118699 (select (arr!5512 (_keys!6428 thiss!1504)) (index!6116 lt!118629)))))

(assert (=> d!59061 (validMask!0 (mask!10314 thiss!1504))))

(assert (=> d!59061 (= (seekKeyOrZeroReturnVacant!0 (x!23727 lt!118629) (index!6116 lt!118629) (index!6116 lt!118629) key!932 (_keys!6428 thiss!1504) (mask!10314 thiss!1504)) lt!118700)))

(assert (= (and d!59061 c!39142) b!234838))

(assert (= (and d!59061 (not c!39142)) b!234834))

(assert (= (and b!234834 c!39141) b!234833))

(assert (= (and b!234834 (not c!39141)) b!234836))

(assert (= (and b!234836 c!39143) b!234837))

(assert (= (and b!234836 (not c!39143)) b!234835))

(declare-fun m!255529 () Bool)

(assert (=> b!234835 m!255529))

(assert (=> b!234835 m!255529))

(declare-fun m!255531 () Bool)

(assert (=> b!234835 m!255531))

(declare-fun m!255533 () Bool)

(assert (=> d!59061 m!255533))

(declare-fun m!255535 () Bool)

(assert (=> d!59061 m!255535))

(assert (=> d!59061 m!255439))

(assert (=> d!59061 m!255313))

(assert (=> b!234661 d!59061))

(declare-fun d!59063 () Bool)

(declare-fun e!152511 () Bool)

(assert (=> d!59063 e!152511))

(declare-fun res!115127 () Bool)

(assert (=> d!59063 (=> res!115127 e!152511)))

(declare-fun lt!118703 () Bool)

(assert (=> d!59063 (= res!115127 (not lt!118703))))

(declare-fun lt!118701 () Bool)

(assert (=> d!59063 (= lt!118703 lt!118701)))

(declare-fun lt!118704 () Unit!7238)

(declare-fun e!152512 () Unit!7238)

(assert (=> d!59063 (= lt!118704 e!152512)))

(declare-fun c!39144 () Bool)

(assert (=> d!59063 (= c!39144 lt!118701)))

(assert (=> d!59063 (= lt!118701 (containsKey!256 (toList!1765 lt!118601) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59063 (= (contains!1642 lt!118601 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118703)))

(declare-fun b!234839 () Bool)

(declare-fun lt!118702 () Unit!7238)

(assert (=> b!234839 (= e!152512 lt!118702)))

(assert (=> b!234839 (= lt!118702 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1765 lt!118601) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234839 (isDefined!206 (getValueByKey!264 (toList!1765 lt!118601) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234840 () Bool)

(declare-fun Unit!7243 () Unit!7238)

(assert (=> b!234840 (= e!152512 Unit!7243)))

(declare-fun b!234841 () Bool)

(assert (=> b!234841 (= e!152511 (isDefined!206 (getValueByKey!264 (toList!1765 lt!118601) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59063 c!39144) b!234839))

(assert (= (and d!59063 (not c!39144)) b!234840))

(assert (= (and d!59063 (not res!115127)) b!234841))

(declare-fun m!255537 () Bool)

(assert (=> d!59063 m!255537))

(declare-fun m!255539 () Bool)

(assert (=> b!234839 m!255539))

(assert (=> b!234839 m!255451))

(assert (=> b!234839 m!255451))

(declare-fun m!255541 () Bool)

(assert (=> b!234839 m!255541))

(assert (=> b!234841 m!255451))

(assert (=> b!234841 m!255451))

(assert (=> b!234841 m!255541))

(assert (=> bm!21808 d!59063))

(declare-fun d!59065 () Bool)

(declare-fun res!115132 () Bool)

(declare-fun e!152517 () Bool)

(assert (=> d!59065 (=> res!115132 e!152517)))

(assert (=> d!59065 (= res!115132 (and ((_ is Cons!3520) (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) (= (_1!2309 (h!4171 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) key!932)))))

(assert (=> d!59065 (= (containsKey!256 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))) key!932) e!152517)))

(declare-fun b!234846 () Bool)

(declare-fun e!152518 () Bool)

(assert (=> b!234846 (= e!152517 e!152518)))

(declare-fun res!115133 () Bool)

(assert (=> b!234846 (=> (not res!115133) (not e!152518))))

(assert (=> b!234846 (= res!115133 (and (or (not ((_ is Cons!3520) (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) (bvsle (_1!2309 (h!4171 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) key!932)) ((_ is Cons!3520) (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) (bvslt (_1!2309 (h!4171 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504))))) key!932)))))

(declare-fun b!234847 () Bool)

(assert (=> b!234847 (= e!152518 (containsKey!256 (t!8484 (toList!1765 (getCurrentListMap!1274 (_keys!6428 thiss!1504) (_values!4344 thiss!1504) (mask!10314 thiss!1504) (extraKeys!4098 thiss!1504) (zeroValue!4202 thiss!1504) (minValue!4202 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4361 thiss!1504)))) key!932))))

(assert (= (and d!59065 (not res!115132)) b!234846))

(assert (= (and b!234846 res!115133) b!234847))

(declare-fun m!255543 () Bool)

(assert (=> b!234847 m!255543))

(assert (=> d!59017 d!59065))

(declare-fun d!59067 () Bool)

(assert (=> d!59067 (= (apply!208 (+!641 lt!118610 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504))) lt!118619) (apply!208 lt!118610 lt!118619))))

(declare-fun lt!118707 () Unit!7238)

(declare-fun choose!1109 (ListLongMap!3499 (_ BitVec 64) V!7881 (_ BitVec 64)) Unit!7238)

(assert (=> d!59067 (= lt!118707 (choose!1109 lt!118610 lt!118612 (zeroValue!4202 thiss!1504) lt!118619))))

(declare-fun e!152521 () Bool)

(assert (=> d!59067 e!152521))

(declare-fun res!115136 () Bool)

(assert (=> d!59067 (=> (not res!115136) (not e!152521))))

(assert (=> d!59067 (= res!115136 (contains!1642 lt!118610 lt!118619))))

(assert (=> d!59067 (= (addApplyDifferent!184 lt!118610 lt!118612 (zeroValue!4202 thiss!1504) lt!118619) lt!118707)))

(declare-fun b!234851 () Bool)

(assert (=> b!234851 (= e!152521 (not (= lt!118619 lt!118612)))))

(assert (= (and d!59067 res!115136) b!234851))

(assert (=> d!59067 m!255399))

(assert (=> d!59067 m!255397))

(declare-fun m!255545 () Bool)

(assert (=> d!59067 m!255545))

(assert (=> d!59067 m!255399))

(assert (=> d!59067 m!255411))

(declare-fun m!255547 () Bool)

(assert (=> d!59067 m!255547))

(assert (=> b!234643 d!59067))

(declare-fun d!59069 () Bool)

(assert (=> d!59069 (= (apply!208 (+!641 lt!118620 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504))) lt!118605) (apply!208 lt!118620 lt!118605))))

(declare-fun lt!118708 () Unit!7238)

(assert (=> d!59069 (= lt!118708 (choose!1109 lt!118620 lt!118621 (minValue!4202 thiss!1504) lt!118605))))

(declare-fun e!152522 () Bool)

(assert (=> d!59069 e!152522))

(declare-fun res!115137 () Bool)

(assert (=> d!59069 (=> (not res!115137) (not e!152522))))

(assert (=> d!59069 (= res!115137 (contains!1642 lt!118620 lt!118605))))

(assert (=> d!59069 (= (addApplyDifferent!184 lt!118620 lt!118621 (minValue!4202 thiss!1504) lt!118605) lt!118708)))

(declare-fun b!234852 () Bool)

(assert (=> b!234852 (= e!152522 (not (= lt!118605 lt!118621)))))

(assert (= (and d!59069 res!115137) b!234852))

(assert (=> d!59069 m!255403))

(assert (=> d!59069 m!255419))

(declare-fun m!255549 () Bool)

(assert (=> d!59069 m!255549))

(assert (=> d!59069 m!255403))

(assert (=> d!59069 m!255405))

(declare-fun m!255551 () Bool)

(assert (=> d!59069 m!255551))

(assert (=> b!234643 d!59069))

(declare-fun d!59071 () Bool)

(assert (=> d!59071 (= (apply!208 lt!118611 lt!118617) (get!2829 (getValueByKey!264 (toList!1765 lt!118611) lt!118617)))))

(declare-fun bs!8673 () Bool)

(assert (= bs!8673 d!59071))

(declare-fun m!255553 () Bool)

(assert (=> bs!8673 m!255553))

(assert (=> bs!8673 m!255553))

(declare-fun m!255555 () Bool)

(assert (=> bs!8673 m!255555))

(assert (=> b!234643 d!59071))

(declare-fun d!59073 () Bool)

(declare-fun e!152523 () Bool)

(assert (=> d!59073 e!152523))

(declare-fun res!115138 () Bool)

(assert (=> d!59073 (=> res!115138 e!152523)))

(declare-fun lt!118711 () Bool)

(assert (=> d!59073 (= res!115138 (not lt!118711))))

(declare-fun lt!118709 () Bool)

(assert (=> d!59073 (= lt!118711 lt!118709)))

(declare-fun lt!118712 () Unit!7238)

(declare-fun e!152524 () Unit!7238)

(assert (=> d!59073 (= lt!118712 e!152524)))

(declare-fun c!39145 () Bool)

(assert (=> d!59073 (= c!39145 lt!118709)))

(assert (=> d!59073 (= lt!118709 (containsKey!256 (toList!1765 (+!641 lt!118600 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504)))) lt!118614))))

(assert (=> d!59073 (= (contains!1642 (+!641 lt!118600 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504))) lt!118614) lt!118711)))

(declare-fun b!234853 () Bool)

(declare-fun lt!118710 () Unit!7238)

(assert (=> b!234853 (= e!152524 lt!118710)))

(assert (=> b!234853 (= lt!118710 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1765 (+!641 lt!118600 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504)))) lt!118614))))

(assert (=> b!234853 (isDefined!206 (getValueByKey!264 (toList!1765 (+!641 lt!118600 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504)))) lt!118614))))

(declare-fun b!234854 () Bool)

(declare-fun Unit!7244 () Unit!7238)

(assert (=> b!234854 (= e!152524 Unit!7244)))

(declare-fun b!234855 () Bool)

(assert (=> b!234855 (= e!152523 (isDefined!206 (getValueByKey!264 (toList!1765 (+!641 lt!118600 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504)))) lt!118614)))))

(assert (= (and d!59073 c!39145) b!234853))

(assert (= (and d!59073 (not c!39145)) b!234854))

(assert (= (and d!59073 (not res!115138)) b!234855))

(declare-fun m!255557 () Bool)

(assert (=> d!59073 m!255557))

(declare-fun m!255559 () Bool)

(assert (=> b!234853 m!255559))

(declare-fun m!255561 () Bool)

(assert (=> b!234853 m!255561))

(assert (=> b!234853 m!255561))

(declare-fun m!255563 () Bool)

(assert (=> b!234853 m!255563))

(assert (=> b!234855 m!255561))

(assert (=> b!234855 m!255561))

(assert (=> b!234855 m!255563))

(assert (=> b!234643 d!59073))

(declare-fun d!59075 () Bool)

(assert (=> d!59075 (= (apply!208 (+!641 lt!118611 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504))) lt!118617) (get!2829 (getValueByKey!264 (toList!1765 (+!641 lt!118611 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504)))) lt!118617)))))

(declare-fun bs!8674 () Bool)

(assert (= bs!8674 d!59075))

(declare-fun m!255565 () Bool)

(assert (=> bs!8674 m!255565))

(assert (=> bs!8674 m!255565))

(declare-fun m!255567 () Bool)

(assert (=> bs!8674 m!255567))

(assert (=> b!234643 d!59075))

(declare-fun d!59077 () Bool)

(assert (=> d!59077 (= (apply!208 (+!641 lt!118610 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504))) lt!118619) (get!2829 (getValueByKey!264 (toList!1765 (+!641 lt!118610 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504)))) lt!118619)))))

(declare-fun bs!8675 () Bool)

(assert (= bs!8675 d!59077))

(declare-fun m!255569 () Bool)

(assert (=> bs!8675 m!255569))

(assert (=> bs!8675 m!255569))

(declare-fun m!255571 () Bool)

(assert (=> bs!8675 m!255571))

(assert (=> b!234643 d!59077))

(declare-fun d!59079 () Bool)

(assert (=> d!59079 (= (apply!208 lt!118610 lt!118619) (get!2829 (getValueByKey!264 (toList!1765 lt!118610) lt!118619)))))

(declare-fun bs!8676 () Bool)

(assert (= bs!8676 d!59079))

(declare-fun m!255573 () Bool)

(assert (=> bs!8676 m!255573))

(assert (=> bs!8676 m!255573))

(declare-fun m!255575 () Bool)

(assert (=> bs!8676 m!255575))

(assert (=> b!234643 d!59079))

(declare-fun d!59081 () Bool)

(declare-fun e!152525 () Bool)

(assert (=> d!59081 e!152525))

(declare-fun res!115139 () Bool)

(assert (=> d!59081 (=> (not res!115139) (not e!152525))))

(declare-fun lt!118714 () ListLongMap!3499)

(assert (=> d!59081 (= res!115139 (contains!1642 lt!118714 (_1!2309 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504)))))))

(declare-fun lt!118716 () List!3524)

(assert (=> d!59081 (= lt!118714 (ListLongMap!3500 lt!118716))))

(declare-fun lt!118713 () Unit!7238)

(declare-fun lt!118715 () Unit!7238)

(assert (=> d!59081 (= lt!118713 lt!118715)))

(assert (=> d!59081 (= (getValueByKey!264 lt!118716 (_1!2309 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504)))) (Some!269 (_2!2309 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504)))))))

(assert (=> d!59081 (= lt!118715 (lemmaContainsTupThenGetReturnValue!151 lt!118716 (_1!2309 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504))) (_2!2309 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504)))))))

(assert (=> d!59081 (= lt!118716 (insertStrictlySorted!154 (toList!1765 lt!118611) (_1!2309 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504))) (_2!2309 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504)))))))

(assert (=> d!59081 (= (+!641 lt!118611 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504))) lt!118714)))

(declare-fun b!234856 () Bool)

(declare-fun res!115140 () Bool)

(assert (=> b!234856 (=> (not res!115140) (not e!152525))))

(assert (=> b!234856 (= res!115140 (= (getValueByKey!264 (toList!1765 lt!118714) (_1!2309 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504)))) (Some!269 (_2!2309 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504))))))))

(declare-fun b!234857 () Bool)

(assert (=> b!234857 (= e!152525 (contains!1644 (toList!1765 lt!118714) (tuple2!4597 lt!118606 (minValue!4202 thiss!1504))))))

(assert (= (and d!59081 res!115139) b!234856))

(assert (= (and b!234856 res!115140) b!234857))

(declare-fun m!255577 () Bool)

(assert (=> d!59081 m!255577))

(declare-fun m!255579 () Bool)

(assert (=> d!59081 m!255579))

(declare-fun m!255581 () Bool)

(assert (=> d!59081 m!255581))

(declare-fun m!255583 () Bool)

(assert (=> d!59081 m!255583))

(declare-fun m!255585 () Bool)

(assert (=> b!234856 m!255585))

(declare-fun m!255587 () Bool)

(assert (=> b!234857 m!255587))

(assert (=> b!234643 d!59081))

(assert (=> b!234643 d!59053))

(declare-fun d!59083 () Bool)

(assert (=> d!59083 (= (apply!208 lt!118620 lt!118605) (get!2829 (getValueByKey!264 (toList!1765 lt!118620) lt!118605)))))

(declare-fun bs!8677 () Bool)

(assert (= bs!8677 d!59083))

(declare-fun m!255589 () Bool)

(assert (=> bs!8677 m!255589))

(assert (=> bs!8677 m!255589))

(declare-fun m!255591 () Bool)

(assert (=> bs!8677 m!255591))

(assert (=> b!234643 d!59083))

(declare-fun d!59085 () Bool)

(assert (=> d!59085 (contains!1642 (+!641 lt!118600 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504))) lt!118614)))

(declare-fun lt!118719 () Unit!7238)

(declare-fun choose!1110 (ListLongMap!3499 (_ BitVec 64) V!7881 (_ BitVec 64)) Unit!7238)

(assert (=> d!59085 (= lt!118719 (choose!1110 lt!118600 lt!118615 (zeroValue!4202 thiss!1504) lt!118614))))

(assert (=> d!59085 (contains!1642 lt!118600 lt!118614)))

(assert (=> d!59085 (= (addStillContains!184 lt!118600 lt!118615 (zeroValue!4202 thiss!1504) lt!118614) lt!118719)))

(declare-fun bs!8678 () Bool)

(assert (= bs!8678 d!59085))

(assert (=> bs!8678 m!255393))

(assert (=> bs!8678 m!255393))

(assert (=> bs!8678 m!255417))

(declare-fun m!255593 () Bool)

(assert (=> bs!8678 m!255593))

(declare-fun m!255595 () Bool)

(assert (=> bs!8678 m!255595))

(assert (=> b!234643 d!59085))

(declare-fun d!59087 () Bool)

(declare-fun e!152526 () Bool)

(assert (=> d!59087 e!152526))

(declare-fun res!115141 () Bool)

(assert (=> d!59087 (=> (not res!115141) (not e!152526))))

(declare-fun lt!118721 () ListLongMap!3499)

(assert (=> d!59087 (= res!115141 (contains!1642 lt!118721 (_1!2309 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504)))))))

(declare-fun lt!118723 () List!3524)

(assert (=> d!59087 (= lt!118721 (ListLongMap!3500 lt!118723))))

(declare-fun lt!118720 () Unit!7238)

(declare-fun lt!118722 () Unit!7238)

(assert (=> d!59087 (= lt!118720 lt!118722)))

(assert (=> d!59087 (= (getValueByKey!264 lt!118723 (_1!2309 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504)))) (Some!269 (_2!2309 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504)))))))

(assert (=> d!59087 (= lt!118722 (lemmaContainsTupThenGetReturnValue!151 lt!118723 (_1!2309 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504))) (_2!2309 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504)))))))

(assert (=> d!59087 (= lt!118723 (insertStrictlySorted!154 (toList!1765 lt!118620) (_1!2309 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504))) (_2!2309 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504)))))))

(assert (=> d!59087 (= (+!641 lt!118620 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504))) lt!118721)))

(declare-fun b!234859 () Bool)

(declare-fun res!115142 () Bool)

(assert (=> b!234859 (=> (not res!115142) (not e!152526))))

(assert (=> b!234859 (= res!115142 (= (getValueByKey!264 (toList!1765 lt!118721) (_1!2309 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504)))) (Some!269 (_2!2309 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504))))))))

(declare-fun b!234860 () Bool)

(assert (=> b!234860 (= e!152526 (contains!1644 (toList!1765 lt!118721) (tuple2!4597 lt!118621 (minValue!4202 thiss!1504))))))

(assert (= (and d!59087 res!115141) b!234859))

(assert (= (and b!234859 res!115142) b!234860))

(declare-fun m!255597 () Bool)

(assert (=> d!59087 m!255597))

(declare-fun m!255599 () Bool)

(assert (=> d!59087 m!255599))

(declare-fun m!255601 () Bool)

(assert (=> d!59087 m!255601))

(declare-fun m!255603 () Bool)

(assert (=> d!59087 m!255603))

(declare-fun m!255605 () Bool)

(assert (=> b!234859 m!255605))

(declare-fun m!255607 () Bool)

(assert (=> b!234860 m!255607))

(assert (=> b!234643 d!59087))

(declare-fun d!59089 () Bool)

(declare-fun e!152527 () Bool)

(assert (=> d!59089 e!152527))

(declare-fun res!115143 () Bool)

(assert (=> d!59089 (=> (not res!115143) (not e!152527))))

(declare-fun lt!118725 () ListLongMap!3499)

(assert (=> d!59089 (= res!115143 (contains!1642 lt!118725 (_1!2309 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504)))))))

(declare-fun lt!118727 () List!3524)

(assert (=> d!59089 (= lt!118725 (ListLongMap!3500 lt!118727))))

(declare-fun lt!118724 () Unit!7238)

(declare-fun lt!118726 () Unit!7238)

(assert (=> d!59089 (= lt!118724 lt!118726)))

(assert (=> d!59089 (= (getValueByKey!264 lt!118727 (_1!2309 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504)))) (Some!269 (_2!2309 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59089 (= lt!118726 (lemmaContainsTupThenGetReturnValue!151 lt!118727 (_1!2309 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504))) (_2!2309 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59089 (= lt!118727 (insertStrictlySorted!154 (toList!1765 lt!118610) (_1!2309 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504))) (_2!2309 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59089 (= (+!641 lt!118610 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504))) lt!118725)))

(declare-fun b!234861 () Bool)

(declare-fun res!115144 () Bool)

(assert (=> b!234861 (=> (not res!115144) (not e!152527))))

(assert (=> b!234861 (= res!115144 (= (getValueByKey!264 (toList!1765 lt!118725) (_1!2309 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504)))) (Some!269 (_2!2309 (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504))))))))

(declare-fun b!234862 () Bool)

(assert (=> b!234862 (= e!152527 (contains!1644 (toList!1765 lt!118725) (tuple2!4597 lt!118612 (zeroValue!4202 thiss!1504))))))

(assert (= (and d!59089 res!115143) b!234861))

(assert (= (and b!234861 res!115144) b!234862))

(declare-fun m!255609 () Bool)

(assert (=> d!59089 m!255609))

(declare-fun m!255611 () Bool)

(assert (=> d!59089 m!255611))

(declare-fun m!255613 () Bool)

(assert (=> d!59089 m!255613))

(declare-fun m!255615 () Bool)

(assert (=> d!59089 m!255615))

(declare-fun m!255617 () Bool)

(assert (=> b!234861 m!255617))

(declare-fun m!255619 () Bool)

(assert (=> b!234862 m!255619))

(assert (=> b!234643 d!59089))

(declare-fun d!59091 () Bool)

(assert (=> d!59091 (= (apply!208 (+!641 lt!118620 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504))) lt!118605) (get!2829 (getValueByKey!264 (toList!1765 (+!641 lt!118620 (tuple2!4597 lt!118621 (minValue!4202 thiss!1504)))) lt!118605)))))

(declare-fun bs!8679 () Bool)

(assert (= bs!8679 d!59091))

(declare-fun m!255621 () Bool)

(assert (=> bs!8679 m!255621))

(assert (=> bs!8679 m!255621))

(declare-fun m!255623 () Bool)

(assert (=> bs!8679 m!255623))

(assert (=> b!234643 d!59091))

(declare-fun d!59093 () Bool)

(assert (=> d!59093 (= (apply!208 (+!641 lt!118611 (tuple2!4597 lt!118606 (minValue!4202 thiss!1504))) lt!118617) (apply!208 lt!118611 lt!118617))))

(declare-fun lt!118728 () Unit!7238)

(assert (=> d!59093 (= lt!118728 (choose!1109 lt!118611 lt!118606 (minValue!4202 thiss!1504) lt!118617))))

(declare-fun e!152528 () Bool)

(assert (=> d!59093 e!152528))

(declare-fun res!115145 () Bool)

(assert (=> d!59093 (=> (not res!115145) (not e!152528))))

(assert (=> d!59093 (= res!115145 (contains!1642 lt!118611 lt!118617))))

(assert (=> d!59093 (= (addApplyDifferent!184 lt!118611 lt!118606 (minValue!4202 thiss!1504) lt!118617) lt!118728)))

(declare-fun b!234863 () Bool)

(assert (=> b!234863 (= e!152528 (not (= lt!118617 lt!118606)))))

(assert (= (and d!59093 res!115145) b!234863))

(assert (=> d!59093 m!255401))

(assert (=> d!59093 m!255395))

(declare-fun m!255625 () Bool)

(assert (=> d!59093 m!255625))

(assert (=> d!59093 m!255401))

(assert (=> d!59093 m!255407))

(declare-fun m!255627 () Bool)

(assert (=> d!59093 m!255627))

(assert (=> b!234643 d!59093))

(declare-fun d!59095 () Bool)

(declare-fun e!152529 () Bool)

(assert (=> d!59095 e!152529))

(declare-fun res!115146 () Bool)

(assert (=> d!59095 (=> (not res!115146) (not e!152529))))

(declare-fun lt!118730 () ListLongMap!3499)

(assert (=> d!59095 (= res!115146 (contains!1642 lt!118730 (_1!2309 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504)))))))

(declare-fun lt!118732 () List!3524)

(assert (=> d!59095 (= lt!118730 (ListLongMap!3500 lt!118732))))

(declare-fun lt!118729 () Unit!7238)

(declare-fun lt!118731 () Unit!7238)

(assert (=> d!59095 (= lt!118729 lt!118731)))

(assert (=> d!59095 (= (getValueByKey!264 lt!118732 (_1!2309 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504)))) (Some!269 (_2!2309 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59095 (= lt!118731 (lemmaContainsTupThenGetReturnValue!151 lt!118732 (_1!2309 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504))) (_2!2309 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59095 (= lt!118732 (insertStrictlySorted!154 (toList!1765 lt!118600) (_1!2309 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504))) (_2!2309 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504)))))))

(assert (=> d!59095 (= (+!641 lt!118600 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504))) lt!118730)))

(declare-fun b!234864 () Bool)

(declare-fun res!115147 () Bool)

(assert (=> b!234864 (=> (not res!115147) (not e!152529))))

(assert (=> b!234864 (= res!115147 (= (getValueByKey!264 (toList!1765 lt!118730) (_1!2309 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504)))) (Some!269 (_2!2309 (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504))))))))

(declare-fun b!234865 () Bool)

(assert (=> b!234865 (= e!152529 (contains!1644 (toList!1765 lt!118730) (tuple2!4597 lt!118615 (zeroValue!4202 thiss!1504))))))

(assert (= (and d!59095 res!115146) b!234864))

(assert (= (and b!234864 res!115147) b!234865))

(declare-fun m!255629 () Bool)

(assert (=> d!59095 m!255629))

(declare-fun m!255631 () Bool)

(assert (=> d!59095 m!255631))

(declare-fun m!255633 () Bool)

(assert (=> d!59095 m!255633))

(declare-fun m!255635 () Bool)

(assert (=> d!59095 m!255635))

(declare-fun m!255637 () Bool)

(assert (=> b!234864 m!255637))

(declare-fun m!255639 () Bool)

(assert (=> b!234865 m!255639))

(assert (=> b!234643 d!59095))

(declare-fun d!59097 () Bool)

(assert (=> d!59097 (= (apply!208 lt!118601 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)) (get!2829 (getValueByKey!264 (toList!1765 lt!118601) (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8680 () Bool)

(assert (= bs!8680 d!59097))

(assert (=> bs!8680 m!255373))

(declare-fun m!255641 () Bool)

(assert (=> bs!8680 m!255641))

(assert (=> bs!8680 m!255641))

(declare-fun m!255643 () Bool)

(assert (=> bs!8680 m!255643))

(assert (=> b!234640 d!59097))

(declare-fun d!59099 () Bool)

(declare-fun c!39148 () Bool)

(assert (=> d!59099 (= c!39148 ((_ is ValueCellFull!2744) (select (arr!5511 (_values!4344 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!152532 () V!7881)

(assert (=> d!59099 (= (get!2828 (select (arr!5511 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!542 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!152532)))

(declare-fun b!234870 () Bool)

(declare-fun get!2830 (ValueCell!2744 V!7881) V!7881)

(assert (=> b!234870 (= e!152532 (get!2830 (select (arr!5511 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!542 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234871 () Bool)

(declare-fun get!2831 (ValueCell!2744 V!7881) V!7881)

(assert (=> b!234871 (= e!152532 (get!2831 (select (arr!5511 (_values!4344 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!542 (defaultEntry!4361 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59099 c!39148) b!234870))

(assert (= (and d!59099 (not c!39148)) b!234871))

(assert (=> b!234870 m!255377))

(assert (=> b!234870 m!255371))

(declare-fun m!255645 () Bool)

(assert (=> b!234870 m!255645))

(assert (=> b!234871 m!255377))

(assert (=> b!234871 m!255371))

(declare-fun m!255647 () Bool)

(assert (=> b!234871 m!255647))

(assert (=> b!234640 d!59099))

(declare-fun d!59101 () Bool)

(declare-fun e!152533 () Bool)

(assert (=> d!59101 e!152533))

(declare-fun res!115148 () Bool)

(assert (=> d!59101 (=> (not res!115148) (not e!152533))))

(declare-fun lt!118734 () ListLongMap!3499)

(assert (=> d!59101 (= res!115148 (contains!1642 lt!118734 (_1!2309 (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))))

(declare-fun lt!118736 () List!3524)

(assert (=> d!59101 (= lt!118734 (ListLongMap!3500 lt!118736))))

(declare-fun lt!118733 () Unit!7238)

(declare-fun lt!118735 () Unit!7238)

(assert (=> d!59101 (= lt!118733 lt!118735)))

(assert (=> d!59101 (= (getValueByKey!264 lt!118736 (_1!2309 (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))) (Some!269 (_2!2309 (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))))

(assert (=> d!59101 (= lt!118735 (lemmaContainsTupThenGetReturnValue!151 lt!118736 (_1!2309 (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))) (_2!2309 (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))))

(assert (=> d!59101 (= lt!118736 (insertStrictlySorted!154 (toList!1765 (ite c!39080 call!21811 (ite c!39085 call!21816 call!21812))) (_1!2309 (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))) (_2!2309 (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))))))

(assert (=> d!59101 (= (+!641 (ite c!39080 call!21811 (ite c!39085 call!21816 call!21812)) (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))) lt!118734)))

(declare-fun b!234872 () Bool)

(declare-fun res!115149 () Bool)

(assert (=> b!234872 (=> (not res!115149) (not e!152533))))

(assert (=> b!234872 (= res!115149 (= (getValueByKey!264 (toList!1765 lt!118734) (_1!2309 (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504))))) (Some!269 (_2!2309 (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))))

(declare-fun b!234873 () Bool)

(assert (=> b!234873 (= e!152533 (contains!1644 (toList!1765 lt!118734) (ite (or c!39080 c!39085) (tuple2!4597 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4202 thiss!1504)) (tuple2!4597 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4202 thiss!1504)))))))

(assert (= (and d!59101 res!115148) b!234872))

(assert (= (and b!234872 res!115149) b!234873))

(declare-fun m!255649 () Bool)

(assert (=> d!59101 m!255649))

(declare-fun m!255651 () Bool)

(assert (=> d!59101 m!255651))

(declare-fun m!255653 () Bool)

(assert (=> d!59101 m!255653))

(declare-fun m!255655 () Bool)

(assert (=> d!59101 m!255655))

(declare-fun m!255657 () Bool)

(assert (=> b!234872 m!255657))

(declare-fun m!255659 () Bool)

(assert (=> b!234873 m!255659))

(assert (=> bm!21807 d!59101))

(declare-fun d!59103 () Bool)

(declare-fun e!152534 () Bool)

(assert (=> d!59103 e!152534))

(declare-fun res!115150 () Bool)

(assert (=> d!59103 (=> res!115150 e!152534)))

(declare-fun lt!118739 () Bool)

(assert (=> d!59103 (= res!115150 (not lt!118739))))

(declare-fun lt!118737 () Bool)

(assert (=> d!59103 (= lt!118739 lt!118737)))

(declare-fun lt!118740 () Unit!7238)

(declare-fun e!152535 () Unit!7238)

(assert (=> d!59103 (= lt!118740 e!152535)))

(declare-fun c!39149 () Bool)

(assert (=> d!59103 (= c!39149 lt!118737)))

(assert (=> d!59103 (= lt!118737 (containsKey!256 (toList!1765 lt!118601) (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59103 (= (contains!1642 lt!118601 (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)) lt!118739)))

(declare-fun b!234874 () Bool)

(declare-fun lt!118738 () Unit!7238)

(assert (=> b!234874 (= e!152535 lt!118738)))

(assert (=> b!234874 (= lt!118738 (lemmaContainsKeyImpliesGetValueByKeyDefined!205 (toList!1765 lt!118601) (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234874 (isDefined!206 (getValueByKey!264 (toList!1765 lt!118601) (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234875 () Bool)

(declare-fun Unit!7245 () Unit!7238)

(assert (=> b!234875 (= e!152535 Unit!7245)))

(declare-fun b!234876 () Bool)

(assert (=> b!234876 (= e!152534 (isDefined!206 (getValueByKey!264 (toList!1765 lt!118601) (select (arr!5512 (_keys!6428 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59103 c!39149) b!234874))

(assert (= (and d!59103 (not c!39149)) b!234875))

(assert (= (and d!59103 (not res!115150)) b!234876))

(assert (=> d!59103 m!255373))

(declare-fun m!255661 () Bool)

(assert (=> d!59103 m!255661))

(assert (=> b!234874 m!255373))

(declare-fun m!255663 () Bool)

(assert (=> b!234874 m!255663))

(assert (=> b!234874 m!255373))

(assert (=> b!234874 m!255641))

(assert (=> b!234874 m!255641))

(declare-fun m!255665 () Bool)

(assert (=> b!234874 m!255665))

(assert (=> b!234876 m!255373))

(assert (=> b!234876 m!255641))

(assert (=> b!234876 m!255641))

(assert (=> b!234876 m!255665))

(assert (=> b!234642 d!59103))

(declare-fun mapIsEmpty!10460 () Bool)

(declare-fun mapRes!10460 () Bool)

(assert (=> mapIsEmpty!10460 mapRes!10460))

(declare-fun mapNonEmpty!10460 () Bool)

(declare-fun tp!22115 () Bool)

(declare-fun e!152537 () Bool)

(assert (=> mapNonEmpty!10460 (= mapRes!10460 (and tp!22115 e!152537))))

(declare-fun mapRest!10460 () (Array (_ BitVec 32) ValueCell!2744))

(declare-fun mapValue!10460 () ValueCell!2744)

(declare-fun mapKey!10460 () (_ BitVec 32))

(assert (=> mapNonEmpty!10460 (= mapRest!10459 (store mapRest!10460 mapKey!10460 mapValue!10460))))

(declare-fun b!234878 () Bool)

(declare-fun e!152536 () Bool)

(assert (=> b!234878 (= e!152536 tp_is_empty!6175)))

(declare-fun condMapEmpty!10460 () Bool)

(declare-fun mapDefault!10460 () ValueCell!2744)

(assert (=> mapNonEmpty!10459 (= condMapEmpty!10460 (= mapRest!10459 ((as const (Array (_ BitVec 32) ValueCell!2744)) mapDefault!10460)))))

(assert (=> mapNonEmpty!10459 (= tp!22114 (and e!152536 mapRes!10460))))

(declare-fun b!234877 () Bool)

(assert (=> b!234877 (= e!152537 tp_is_empty!6175)))

(assert (= (and mapNonEmpty!10459 condMapEmpty!10460) mapIsEmpty!10460))

(assert (= (and mapNonEmpty!10459 (not condMapEmpty!10460)) mapNonEmpty!10460))

(assert (= (and mapNonEmpty!10460 ((_ is ValueCellFull!2744) mapValue!10460)) b!234877))

(assert (= (and mapNonEmpty!10459 ((_ is ValueCellFull!2744) mapDefault!10460)) b!234878))

(declare-fun m!255667 () Bool)

(assert (=> mapNonEmpty!10460 m!255667))

(declare-fun b_lambda!7877 () Bool)

(assert (= b_lambda!7875 (or (and b!234517 b_free!6313) b_lambda!7877)))

(declare-fun b_lambda!7879 () Bool)

(assert (= b_lambda!7873 (or (and b!234517 b_free!6313) b_lambda!7879)))

(check-sat (not b!234707) tp_is_empty!6175 (not d!59061) (not b!234835) (not b!234705) (not b!234865) (not b!234808) (not d!59097) (not bm!21822) b_and!13217 (not b!234847) (not b!234775) (not d!59103) (not b_lambda!7879) (not b!234870) (not bm!21825) (not d!59045) (not b!234818) (not b!234693) (not b!234864) (not d!59047) (not b!234871) (not b!234860) (not d!59033) (not b!234718) (not b!234717) (not b!234772) (not b!234778) (not b!234872) (not d!59053) (not b!234712) (not d!59049) (not d!59089) (not mapNonEmpty!10460) (not b!234857) (not d!59031) (not b!234779) (not b!234855) (not b!234774) (not b_next!6313) (not b!234856) (not b!234861) (not b!234709) (not b!234853) (not d!59101) (not b!234819) (not d!59067) (not d!59091) (not b!234771) (not d!59069) (not d!59085) (not b!234770) (not d!59073) (not d!59093) (not b!234859) (not d!59087) (not d!59095) (not b!234874) (not bm!21819) (not d!59075) (not b_lambda!7877) (not b!234710) (not d!59043) (not b!234862) (not b!234731) (not d!59063) (not b!234732) (not bm!21816) (not b!234839) (not b!234873) (not d!59071) (not b!234781) (not d!59077) (not b!234876) (not b!234841) (not d!59055) (not d!59083) (not b_lambda!7871) (not d!59039) (not d!59081) (not b!234745) (not b!234721) (not d!59079))
(check-sat b_and!13217 (not b_next!6313))
