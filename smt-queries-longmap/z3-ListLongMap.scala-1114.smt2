; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22934 () Bool)

(assert start!22934)

(declare-fun b!239218 () Bool)

(declare-fun b_free!6433 () Bool)

(declare-fun b_next!6433 () Bool)

(assert (=> b!239218 (= b_free!6433 (not b_next!6433))))

(declare-fun tp!22502 () Bool)

(declare-fun b_and!13373 () Bool)

(assert (=> b!239218 (= tp!22502 b_and!13373)))

(declare-fun b!239213 () Bool)

(declare-fun e!155314 () Bool)

(declare-fun call!22235 () Bool)

(assert (=> b!239213 (= e!155314 (not call!22235))))

(declare-fun b!239214 () Bool)

(declare-fun e!155311 () Bool)

(declare-fun tp_is_empty!6295 () Bool)

(assert (=> b!239214 (= e!155311 tp_is_empty!6295)))

(declare-fun b!239215 () Bool)

(declare-fun e!155309 () Bool)

(declare-fun mapRes!10674 () Bool)

(assert (=> b!239215 (= e!155309 (and e!155311 mapRes!10674))))

(declare-fun condMapEmpty!10674 () Bool)

(declare-datatypes ((V!8041 0))(
  ( (V!8042 (val!3192 Int)) )
))
(declare-datatypes ((ValueCell!2804 0))(
  ( (ValueCellFull!2804 (v!5224 V!8041)) (EmptyCell!2804) )
))
(declare-datatypes ((array!11861 0))(
  ( (array!11862 (arr!5631 (Array (_ BitVec 32) ValueCell!2804)) (size!5973 (_ BitVec 32))) )
))
(declare-datatypes ((array!11863 0))(
  ( (array!11864 (arr!5632 (Array (_ BitVec 32) (_ BitVec 64))) (size!5974 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3508 0))(
  ( (LongMapFixedSize!3509 (defaultEntry!4439 Int) (mask!10484 (_ BitVec 32)) (extraKeys!4176 (_ BitVec 32)) (zeroValue!4280 V!8041) (minValue!4280 V!8041) (_size!1803 (_ BitVec 32)) (_keys!6540 array!11863) (_values!4422 array!11861) (_vacant!1803 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3508)

(declare-fun mapDefault!10674 () ValueCell!2804)

(assert (=> b!239215 (= condMapEmpty!10674 (= (arr!5631 (_values!4422 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2804)) mapDefault!10674)))))

(declare-fun b!239216 () Bool)

(declare-fun e!155319 () Bool)

(assert (=> b!239216 (= e!155319 (not call!22235))))

(declare-fun b!239217 () Bool)

(declare-fun e!155318 () Bool)

(assert (=> b!239217 (= e!155318 (and (= (size!5973 (_values!4422 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10484 thiss!1504))) (= (size!5974 (_keys!6540 thiss!1504)) (size!5973 (_values!4422 thiss!1504))) (bvsge (mask!10484 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4176 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun res!117222 () Bool)

(declare-fun e!155308 () Bool)

(assert (=> start!22934 (=> (not res!117222) (not e!155308))))

(declare-fun valid!1389 (LongMapFixedSize!3508) Bool)

(assert (=> start!22934 (= res!117222 (valid!1389 thiss!1504))))

(assert (=> start!22934 e!155308))

(declare-fun e!155312 () Bool)

(assert (=> start!22934 e!155312))

(assert (=> start!22934 true))

(declare-fun array_inv!3713 (array!11863) Bool)

(declare-fun array_inv!3714 (array!11861) Bool)

(assert (=> b!239218 (= e!155312 (and tp!22502 tp_is_empty!6295 (array_inv!3713 (_keys!6540 thiss!1504)) (array_inv!3714 (_values!4422 thiss!1504)) e!155309))))

(declare-fun b!239219 () Bool)

(declare-fun res!117215 () Bool)

(assert (=> b!239219 (=> (not res!117215) (not e!155319))))

(declare-fun call!22236 () Bool)

(assert (=> b!239219 (= res!117215 call!22236)))

(declare-fun e!155317 () Bool)

(assert (=> b!239219 (= e!155317 e!155319)))

(declare-fun bm!22232 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22232 (= call!22235 (arrayContainsKey!0 (_keys!6540 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239220 () Bool)

(declare-fun e!155313 () Bool)

(assert (=> b!239220 (= e!155313 e!155314)))

(declare-fun res!117220 () Bool)

(assert (=> b!239220 (= res!117220 call!22236)))

(assert (=> b!239220 (=> (not res!117220) (not e!155314))))

(declare-fun b!239221 () Bool)

(declare-fun res!117218 () Bool)

(declare-datatypes ((SeekEntryResult!1028 0))(
  ( (MissingZero!1028 (index!6282 (_ BitVec 32))) (Found!1028 (index!6283 (_ BitVec 32))) (Intermediate!1028 (undefined!1840 Bool) (index!6284 (_ BitVec 32)) (x!24099 (_ BitVec 32))) (Undefined!1028) (MissingVacant!1028 (index!6285 (_ BitVec 32))) )
))
(declare-fun lt!120594 () SeekEntryResult!1028)

(assert (=> b!239221 (= res!117218 (= (select (arr!5632 (_keys!6540 thiss!1504)) (index!6285 lt!120594)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239221 (=> (not res!117218) (not e!155314))))

(declare-fun b!239222 () Bool)

(declare-fun e!155315 () Bool)

(assert (=> b!239222 (= e!155315 tp_is_empty!6295)))

(declare-fun b!239223 () Bool)

(declare-datatypes ((Unit!7339 0))(
  ( (Unit!7340) )
))
(declare-fun e!155316 () Unit!7339)

(declare-fun lt!120593 () Unit!7339)

(assert (=> b!239223 (= e!155316 lt!120593)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!330 (array!11863 array!11861 (_ BitVec 32) (_ BitVec 32) V!8041 V!8041 (_ BitVec 64) Int) Unit!7339)

(assert (=> b!239223 (= lt!120593 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!330 (_keys!6540 thiss!1504) (_values!4422 thiss!1504) (mask!10484 thiss!1504) (extraKeys!4176 thiss!1504) (zeroValue!4280 thiss!1504) (minValue!4280 thiss!1504) key!932 (defaultEntry!4439 thiss!1504)))))

(declare-fun c!39874 () Bool)

(get-info :version)

(assert (=> b!239223 (= c!39874 ((_ is MissingZero!1028) lt!120594))))

(assert (=> b!239223 e!155317))

(declare-fun b!239224 () Bool)

(declare-fun res!117214 () Bool)

(assert (=> b!239224 (=> (not res!117214) (not e!155318))))

(assert (=> b!239224 (= res!117214 (arrayContainsKey!0 (_keys!6540 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10674 () Bool)

(assert (=> mapIsEmpty!10674 mapRes!10674))

(declare-fun b!239225 () Bool)

(declare-fun c!39876 () Bool)

(assert (=> b!239225 (= c!39876 ((_ is MissingVacant!1028) lt!120594))))

(assert (=> b!239225 (= e!155317 e!155313)))

(declare-fun b!239226 () Bool)

(assert (=> b!239226 (= e!155313 ((_ is Undefined!1028) lt!120594))))

(declare-fun b!239227 () Bool)

(declare-fun e!155310 () Bool)

(assert (=> b!239227 (= e!155308 e!155310)))

(declare-fun res!117221 () Bool)

(assert (=> b!239227 (=> (not res!117221) (not e!155310))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239227 (= res!117221 (or (= lt!120594 (MissingZero!1028 index!297)) (= lt!120594 (MissingVacant!1028 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11863 (_ BitVec 32)) SeekEntryResult!1028)

(assert (=> b!239227 (= lt!120594 (seekEntryOrOpen!0 key!932 (_keys!6540 thiss!1504) (mask!10484 thiss!1504)))))

(declare-fun b!239228 () Bool)

(declare-fun res!117219 () Bool)

(assert (=> b!239228 (=> (not res!117219) (not e!155318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239228 (= res!117219 (validMask!0 (mask!10484 thiss!1504)))))

(declare-fun b!239229 () Bool)

(declare-fun Unit!7341 () Unit!7339)

(assert (=> b!239229 (= e!155316 Unit!7341)))

(declare-fun lt!120595 () Unit!7339)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!333 (array!11863 array!11861 (_ BitVec 32) (_ BitVec 32) V!8041 V!8041 (_ BitVec 64) Int) Unit!7339)

(assert (=> b!239229 (= lt!120595 (lemmaInListMapThenSeekEntryOrOpenFindsIt!333 (_keys!6540 thiss!1504) (_values!4422 thiss!1504) (mask!10484 thiss!1504) (extraKeys!4176 thiss!1504) (zeroValue!4280 thiss!1504) (minValue!4280 thiss!1504) key!932 (defaultEntry!4439 thiss!1504)))))

(assert (=> b!239229 false))

(declare-fun b!239230 () Bool)

(assert (=> b!239230 (= e!155310 e!155318)))

(declare-fun res!117216 () Bool)

(assert (=> b!239230 (=> (not res!117216) (not e!155318))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239230 (= res!117216 (inRange!0 index!297 (mask!10484 thiss!1504)))))

(declare-fun lt!120596 () Unit!7339)

(assert (=> b!239230 (= lt!120596 e!155316)))

(declare-fun c!39875 () Bool)

(declare-datatypes ((tuple2!4676 0))(
  ( (tuple2!4677 (_1!2349 (_ BitVec 64)) (_2!2349 V!8041)) )
))
(declare-datatypes ((List!3581 0))(
  ( (Nil!3578) (Cons!3577 (h!4233 tuple2!4676) (t!8567 List!3581)) )
))
(declare-datatypes ((ListLongMap!3579 0))(
  ( (ListLongMap!3580 (toList!1805 List!3581)) )
))
(declare-fun contains!1696 (ListLongMap!3579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1314 (array!11863 array!11861 (_ BitVec 32) (_ BitVec 32) V!8041 V!8041 (_ BitVec 32) Int) ListLongMap!3579)

(assert (=> b!239230 (= c!39875 (contains!1696 (getCurrentListMap!1314 (_keys!6540 thiss!1504) (_values!4422 thiss!1504) (mask!10484 thiss!1504) (extraKeys!4176 thiss!1504) (zeroValue!4280 thiss!1504) (minValue!4280 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4439 thiss!1504)) key!932))))

(declare-fun b!239231 () Bool)

(declare-fun res!117213 () Bool)

(assert (=> b!239231 (=> (not res!117213) (not e!155308))))

(assert (=> b!239231 (= res!117213 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239232 () Bool)

(declare-fun res!117217 () Bool)

(assert (=> b!239232 (=> (not res!117217) (not e!155319))))

(assert (=> b!239232 (= res!117217 (= (select (arr!5632 (_keys!6540 thiss!1504)) (index!6282 lt!120594)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22233 () Bool)

(assert (=> bm!22233 (= call!22236 (inRange!0 (ite c!39874 (index!6282 lt!120594) (index!6285 lt!120594)) (mask!10484 thiss!1504)))))

(declare-fun mapNonEmpty!10674 () Bool)

(declare-fun tp!22503 () Bool)

(assert (=> mapNonEmpty!10674 (= mapRes!10674 (and tp!22503 e!155315))))

(declare-fun mapKey!10674 () (_ BitVec 32))

(declare-fun mapValue!10674 () ValueCell!2804)

(declare-fun mapRest!10674 () (Array (_ BitVec 32) ValueCell!2804))

(assert (=> mapNonEmpty!10674 (= (arr!5631 (_values!4422 thiss!1504)) (store mapRest!10674 mapKey!10674 mapValue!10674))))

(assert (= (and start!22934 res!117222) b!239231))

(assert (= (and b!239231 res!117213) b!239227))

(assert (= (and b!239227 res!117221) b!239230))

(assert (= (and b!239230 c!39875) b!239229))

(assert (= (and b!239230 (not c!39875)) b!239223))

(assert (= (and b!239223 c!39874) b!239219))

(assert (= (and b!239223 (not c!39874)) b!239225))

(assert (= (and b!239219 res!117215) b!239232))

(assert (= (and b!239232 res!117217) b!239216))

(assert (= (and b!239225 c!39876) b!239220))

(assert (= (and b!239225 (not c!39876)) b!239226))

(assert (= (and b!239220 res!117220) b!239221))

(assert (= (and b!239221 res!117218) b!239213))

(assert (= (or b!239219 b!239220) bm!22233))

(assert (= (or b!239216 b!239213) bm!22232))

(assert (= (and b!239230 res!117216) b!239224))

(assert (= (and b!239224 res!117214) b!239228))

(assert (= (and b!239228 res!117219) b!239217))

(assert (= (and b!239215 condMapEmpty!10674) mapIsEmpty!10674))

(assert (= (and b!239215 (not condMapEmpty!10674)) mapNonEmpty!10674))

(assert (= (and mapNonEmpty!10674 ((_ is ValueCellFull!2804) mapValue!10674)) b!239222))

(assert (= (and b!239215 ((_ is ValueCellFull!2804) mapDefault!10674)) b!239214))

(assert (= b!239218 b!239215))

(assert (= start!22934 b!239218))

(declare-fun m!258853 () Bool)

(assert (=> bm!22233 m!258853))

(declare-fun m!258855 () Bool)

(assert (=> b!239223 m!258855))

(declare-fun m!258857 () Bool)

(assert (=> mapNonEmpty!10674 m!258857))

(declare-fun m!258859 () Bool)

(assert (=> b!239232 m!258859))

(declare-fun m!258861 () Bool)

(assert (=> b!239224 m!258861))

(declare-fun m!258863 () Bool)

(assert (=> b!239230 m!258863))

(declare-fun m!258865 () Bool)

(assert (=> b!239230 m!258865))

(assert (=> b!239230 m!258865))

(declare-fun m!258867 () Bool)

(assert (=> b!239230 m!258867))

(assert (=> bm!22232 m!258861))

(declare-fun m!258869 () Bool)

(assert (=> b!239228 m!258869))

(declare-fun m!258871 () Bool)

(assert (=> start!22934 m!258871))

(declare-fun m!258873 () Bool)

(assert (=> b!239221 m!258873))

(declare-fun m!258875 () Bool)

(assert (=> b!239227 m!258875))

(declare-fun m!258877 () Bool)

(assert (=> b!239218 m!258877))

(declare-fun m!258879 () Bool)

(assert (=> b!239218 m!258879))

(declare-fun m!258881 () Bool)

(assert (=> b!239229 m!258881))

(check-sat (not b!239227) (not start!22934) (not mapNonEmpty!10674) b_and!13373 (not b_next!6433) (not b!239218) (not b!239228) (not b!239230) (not bm!22233) (not bm!22232) (not b!239229) (not b!239223) (not b!239224) tp_is_empty!6295)
(check-sat b_and!13373 (not b_next!6433))
