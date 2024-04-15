; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23054 () Bool)

(assert start!23054)

(declare-fun b!241323 () Bool)

(declare-fun b_free!6487 () Bool)

(declare-fun b_next!6487 () Bool)

(assert (=> b!241323 (= b_free!6487 (not b_next!6487))))

(declare-fun tp!22669 () Bool)

(declare-fun b_and!13433 () Bool)

(assert (=> b!241323 (= tp!22669 b_and!13433)))

(declare-fun b!241305 () Bool)

(declare-fun e!156594 () Bool)

(declare-datatypes ((SeekEntryResult!1055 0))(
  ( (MissingZero!1055 (index!6390 (_ BitVec 32))) (Found!1055 (index!6391 (_ BitVec 32))) (Intermediate!1055 (undefined!1867 Bool) (index!6392 (_ BitVec 32)) (x!24216 (_ BitVec 32))) (Undefined!1055) (MissingVacant!1055 (index!6393 (_ BitVec 32))) )
))
(declare-fun lt!121185 () SeekEntryResult!1055)

(get-info :version)

(assert (=> b!241305 (= e!156594 ((_ is Undefined!1055) lt!121185))))

(declare-fun b!241306 () Bool)

(declare-fun e!156589 () Bool)

(declare-fun call!22442 () Bool)

(assert (=> b!241306 (= e!156589 (not call!22442))))

(declare-fun b!241307 () Bool)

(declare-fun res!118269 () Bool)

(declare-fun e!156598 () Bool)

(assert (=> b!241307 (=> (not res!118269) (not e!156598))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!241307 (= res!118269 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!241308 () Bool)

(declare-fun res!118271 () Bool)

(assert (=> b!241308 (=> (not res!118271) (not e!156589))))

(declare-fun call!22443 () Bool)

(assert (=> b!241308 (= res!118271 call!22443)))

(declare-fun e!156596 () Bool)

(assert (=> b!241308 (= e!156596 e!156589)))

(declare-fun bm!22439 () Bool)

(declare-datatypes ((V!8113 0))(
  ( (V!8114 (val!3219 Int)) )
))
(declare-datatypes ((ValueCell!2831 0))(
  ( (ValueCellFull!2831 (v!5252 V!8113)) (EmptyCell!2831) )
))
(declare-datatypes ((array!11971 0))(
  ( (array!11972 (arr!5685 (Array (_ BitVec 32) ValueCell!2831)) (size!6028 (_ BitVec 32))) )
))
(declare-datatypes ((array!11973 0))(
  ( (array!11974 (arr!5686 (Array (_ BitVec 32) (_ BitVec 64))) (size!6029 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3562 0))(
  ( (LongMapFixedSize!3563 (defaultEntry!4474 Int) (mask!10544 (_ BitVec 32)) (extraKeys!4211 (_ BitVec 32)) (zeroValue!4315 V!8113) (minValue!4315 V!8113) (_size!1830 (_ BitVec 32)) (_keys!6579 array!11973) (_values!4457 array!11971) (_vacant!1830 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3562)

(declare-fun arrayContainsKey!0 (array!11973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22439 (= call!22442 (arrayContainsKey!0 (_keys!6579 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241309 () Bool)

(declare-fun e!156600 () Bool)

(assert (=> b!241309 (= e!156600 false)))

(declare-datatypes ((Unit!7422 0))(
  ( (Unit!7423) )
))
(declare-fun lt!121187 () Unit!7422)

(declare-fun e!156590 () Unit!7422)

(assert (=> b!241309 (= lt!121187 e!156590)))

(declare-fun c!40228 () Bool)

(assert (=> b!241309 (= c!40228 (arrayContainsKey!0 (_keys!6579 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241310 () Bool)

(declare-fun e!156593 () Bool)

(declare-fun e!156592 () Bool)

(declare-fun mapRes!10759 () Bool)

(assert (=> b!241310 (= e!156593 (and e!156592 mapRes!10759))))

(declare-fun condMapEmpty!10759 () Bool)

(declare-fun mapDefault!10759 () ValueCell!2831)

(assert (=> b!241310 (= condMapEmpty!10759 (= (arr!5685 (_values!4457 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2831)) mapDefault!10759)))))

(declare-fun b!241312 () Bool)

(declare-fun e!156602 () Bool)

(assert (=> b!241312 (= e!156602 e!156600)))

(declare-fun res!118266 () Bool)

(assert (=> b!241312 (=> (not res!118266) (not e!156600))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241312 (= res!118266 (inRange!0 index!297 (mask!10544 thiss!1504)))))

(declare-fun lt!121188 () Unit!7422)

(declare-fun e!156591 () Unit!7422)

(assert (=> b!241312 (= lt!121188 e!156591)))

(declare-fun c!40227 () Bool)

(declare-datatypes ((tuple2!4714 0))(
  ( (tuple2!4715 (_1!2368 (_ BitVec 64)) (_2!2368 V!8113)) )
))
(declare-datatypes ((List!3612 0))(
  ( (Nil!3609) (Cons!3608 (h!4265 tuple2!4714) (t!8600 List!3612)) )
))
(declare-datatypes ((ListLongMap!3617 0))(
  ( (ListLongMap!3618 (toList!1824 List!3612)) )
))
(declare-fun contains!1717 (ListLongMap!3617 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1333 (array!11973 array!11971 (_ BitVec 32) (_ BitVec 32) V!8113 V!8113 (_ BitVec 32) Int) ListLongMap!3617)

(assert (=> b!241312 (= c!40227 (contains!1717 (getCurrentListMap!1333 (_keys!6579 thiss!1504) (_values!4457 thiss!1504) (mask!10544 thiss!1504) (extraKeys!4211 thiss!1504) (zeroValue!4315 thiss!1504) (minValue!4315 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4474 thiss!1504)) key!932))))

(declare-fun b!241313 () Bool)

(declare-fun c!40226 () Bool)

(assert (=> b!241313 (= c!40226 ((_ is MissingVacant!1055) lt!121185))))

(assert (=> b!241313 (= e!156596 e!156594)))

(declare-fun b!241314 () Bool)

(declare-fun res!118268 () Bool)

(assert (=> b!241314 (=> (not res!118268) (not e!156589))))

(assert (=> b!241314 (= res!118268 (= (select (arr!5686 (_keys!6579 thiss!1504)) (index!6390 lt!121185)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241315 () Bool)

(declare-fun Unit!7424 () Unit!7422)

(assert (=> b!241315 (= e!156590 Unit!7424)))

(declare-fun b!241316 () Bool)

(declare-fun e!156595 () Bool)

(assert (=> b!241316 (= e!156594 e!156595)))

(declare-fun res!118273 () Bool)

(assert (=> b!241316 (= res!118273 call!22443)))

(assert (=> b!241316 (=> (not res!118273) (not e!156595))))

(declare-fun mapIsEmpty!10759 () Bool)

(assert (=> mapIsEmpty!10759 mapRes!10759))

(declare-fun b!241317 () Bool)

(declare-fun tp_is_empty!6349 () Bool)

(assert (=> b!241317 (= e!156592 tp_is_empty!6349)))

(declare-fun c!40225 () Bool)

(declare-fun bm!22440 () Bool)

(assert (=> bm!22440 (= call!22443 (inRange!0 (ite c!40225 (index!6390 lt!121185) (index!6393 lt!121185)) (mask!10544 thiss!1504)))))

(declare-fun b!241318 () Bool)

(declare-fun Unit!7425 () Unit!7422)

(assert (=> b!241318 (= e!156590 Unit!7425)))

(declare-fun lt!121186 () Unit!7422)

(declare-fun lemmaArrayContainsKeyThenInListMap!166 (array!11973 array!11971 (_ BitVec 32) (_ BitVec 32) V!8113 V!8113 (_ BitVec 64) (_ BitVec 32) Int) Unit!7422)

(assert (=> b!241318 (= lt!121186 (lemmaArrayContainsKeyThenInListMap!166 (_keys!6579 thiss!1504) (_values!4457 thiss!1504) (mask!10544 thiss!1504) (extraKeys!4211 thiss!1504) (zeroValue!4315 thiss!1504) (minValue!4315 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4474 thiss!1504)))))

(assert (=> b!241318 false))

(declare-fun b!241319 () Bool)

(declare-fun Unit!7426 () Unit!7422)

(assert (=> b!241319 (= e!156591 Unit!7426)))

(declare-fun lt!121189 () Unit!7422)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!352 (array!11973 array!11971 (_ BitVec 32) (_ BitVec 32) V!8113 V!8113 (_ BitVec 64) Int) Unit!7422)

(assert (=> b!241319 (= lt!121189 (lemmaInListMapThenSeekEntryOrOpenFindsIt!352 (_keys!6579 thiss!1504) (_values!4457 thiss!1504) (mask!10544 thiss!1504) (extraKeys!4211 thiss!1504) (zeroValue!4315 thiss!1504) (minValue!4315 thiss!1504) key!932 (defaultEntry!4474 thiss!1504)))))

(assert (=> b!241319 false))

(declare-fun b!241320 () Bool)

(declare-fun res!118270 () Bool)

(assert (=> b!241320 (= res!118270 (= (select (arr!5686 (_keys!6579 thiss!1504)) (index!6393 lt!121185)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241320 (=> (not res!118270) (not e!156595))))

(declare-fun res!118272 () Bool)

(assert (=> start!23054 (=> (not res!118272) (not e!156598))))

(declare-fun valid!1405 (LongMapFixedSize!3562) Bool)

(assert (=> start!23054 (= res!118272 (valid!1405 thiss!1504))))

(assert (=> start!23054 e!156598))

(declare-fun e!156601 () Bool)

(assert (=> start!23054 e!156601))

(assert (=> start!23054 true))

(declare-fun b!241311 () Bool)

(assert (=> b!241311 (= e!156598 e!156602)))

(declare-fun res!118267 () Bool)

(assert (=> b!241311 (=> (not res!118267) (not e!156602))))

(assert (=> b!241311 (= res!118267 (or (= lt!121185 (MissingZero!1055 index!297)) (= lt!121185 (MissingVacant!1055 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11973 (_ BitVec 32)) SeekEntryResult!1055)

(assert (=> b!241311 (= lt!121185 (seekEntryOrOpen!0 key!932 (_keys!6579 thiss!1504) (mask!10544 thiss!1504)))))

(declare-fun b!241321 () Bool)

(declare-fun e!156597 () Bool)

(assert (=> b!241321 (= e!156597 tp_is_empty!6349)))

(declare-fun b!241322 () Bool)

(assert (=> b!241322 (= e!156595 (not call!22442))))

(declare-fun mapNonEmpty!10759 () Bool)

(declare-fun tp!22668 () Bool)

(assert (=> mapNonEmpty!10759 (= mapRes!10759 (and tp!22668 e!156597))))

(declare-fun mapKey!10759 () (_ BitVec 32))

(declare-fun mapRest!10759 () (Array (_ BitVec 32) ValueCell!2831))

(declare-fun mapValue!10759 () ValueCell!2831)

(assert (=> mapNonEmpty!10759 (= (arr!5685 (_values!4457 thiss!1504)) (store mapRest!10759 mapKey!10759 mapValue!10759))))

(declare-fun array_inv!3751 (array!11973) Bool)

(declare-fun array_inv!3752 (array!11971) Bool)

(assert (=> b!241323 (= e!156601 (and tp!22669 tp_is_empty!6349 (array_inv!3751 (_keys!6579 thiss!1504)) (array_inv!3752 (_values!4457 thiss!1504)) e!156593))))

(declare-fun b!241324 () Bool)

(declare-fun lt!121184 () Unit!7422)

(assert (=> b!241324 (= e!156591 lt!121184)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!353 (array!11973 array!11971 (_ BitVec 32) (_ BitVec 32) V!8113 V!8113 (_ BitVec 64) Int) Unit!7422)

(assert (=> b!241324 (= lt!121184 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!353 (_keys!6579 thiss!1504) (_values!4457 thiss!1504) (mask!10544 thiss!1504) (extraKeys!4211 thiss!1504) (zeroValue!4315 thiss!1504) (minValue!4315 thiss!1504) key!932 (defaultEntry!4474 thiss!1504)))))

(assert (=> b!241324 (= c!40225 ((_ is MissingZero!1055) lt!121185))))

(assert (=> b!241324 e!156596))

(assert (= (and start!23054 res!118272) b!241307))

(assert (= (and b!241307 res!118269) b!241311))

(assert (= (and b!241311 res!118267) b!241312))

(assert (= (and b!241312 c!40227) b!241319))

(assert (= (and b!241312 (not c!40227)) b!241324))

(assert (= (and b!241324 c!40225) b!241308))

(assert (= (and b!241324 (not c!40225)) b!241313))

(assert (= (and b!241308 res!118271) b!241314))

(assert (= (and b!241314 res!118268) b!241306))

(assert (= (and b!241313 c!40226) b!241316))

(assert (= (and b!241313 (not c!40226)) b!241305))

(assert (= (and b!241316 res!118273) b!241320))

(assert (= (and b!241320 res!118270) b!241322))

(assert (= (or b!241308 b!241316) bm!22440))

(assert (= (or b!241306 b!241322) bm!22439))

(assert (= (and b!241312 res!118266) b!241309))

(assert (= (and b!241309 c!40228) b!241318))

(assert (= (and b!241309 (not c!40228)) b!241315))

(assert (= (and b!241310 condMapEmpty!10759) mapIsEmpty!10759))

(assert (= (and b!241310 (not condMapEmpty!10759)) mapNonEmpty!10759))

(assert (= (and mapNonEmpty!10759 ((_ is ValueCellFull!2831) mapValue!10759)) b!241321))

(assert (= (and b!241310 ((_ is ValueCellFull!2831) mapDefault!10759)) b!241317))

(assert (= b!241323 b!241310))

(assert (= start!23054 b!241323))

(declare-fun m!260071 () Bool)

(assert (=> b!241323 m!260071))

(declare-fun m!260073 () Bool)

(assert (=> b!241323 m!260073))

(declare-fun m!260075 () Bool)

(assert (=> b!241318 m!260075))

(declare-fun m!260077 () Bool)

(assert (=> b!241311 m!260077))

(declare-fun m!260079 () Bool)

(assert (=> bm!22440 m!260079))

(declare-fun m!260081 () Bool)

(assert (=> b!241309 m!260081))

(declare-fun m!260083 () Bool)

(assert (=> b!241319 m!260083))

(declare-fun m!260085 () Bool)

(assert (=> b!241312 m!260085))

(declare-fun m!260087 () Bool)

(assert (=> b!241312 m!260087))

(assert (=> b!241312 m!260087))

(declare-fun m!260089 () Bool)

(assert (=> b!241312 m!260089))

(assert (=> bm!22439 m!260081))

(declare-fun m!260091 () Bool)

(assert (=> b!241320 m!260091))

(declare-fun m!260093 () Bool)

(assert (=> start!23054 m!260093))

(declare-fun m!260095 () Bool)

(assert (=> mapNonEmpty!10759 m!260095))

(declare-fun m!260097 () Bool)

(assert (=> b!241324 m!260097))

(declare-fun m!260099 () Bool)

(assert (=> b!241314 m!260099))

(check-sat (not start!23054) b_and!13433 (not b!241324) (not b!241311) (not bm!22440) (not b!241309) (not b_next!6487) (not b!241319) tp_is_empty!6349 (not b!241312) (not mapNonEmpty!10759) (not bm!22439) (not b!241323) (not b!241318))
(check-sat b_and!13433 (not b_next!6487))
