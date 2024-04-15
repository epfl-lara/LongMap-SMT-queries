; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21730 () Bool)

(assert start!21730)

(declare-fun b!218315 () Bool)

(declare-fun b_free!5875 () Bool)

(declare-fun b_next!5875 () Bool)

(assert (=> b!218315 (= b_free!5875 (not b_next!5875))))

(declare-fun tp!20759 () Bool)

(declare-fun b_and!12739 () Bool)

(assert (=> b!218315 (= tp!20759 b_and!12739)))

(declare-fun b!218314 () Bool)

(declare-fun res!107017 () Bool)

(declare-fun e!142015 () Bool)

(assert (=> b!218314 (=> (not res!107017) (not e!142015))))

(declare-datatypes ((V!7297 0))(
  ( (V!7298 (val!2913 Int)) )
))
(declare-datatypes ((ValueCell!2525 0))(
  ( (ValueCellFull!2525 (v!4925 V!7297)) (EmptyCell!2525) )
))
(declare-datatypes ((array!10705 0))(
  ( (array!10706 (arr!5073 (Array (_ BitVec 32) ValueCell!2525)) (size!5406 (_ BitVec 32))) )
))
(declare-datatypes ((array!10707 0))(
  ( (array!10708 (arr!5074 (Array (_ BitVec 32) (_ BitVec 64))) (size!5407 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2950 0))(
  ( (LongMapFixedSize!2951 (defaultEntry!4125 Int) (mask!9901 (_ BitVec 32)) (extraKeys!3862 (_ BitVec 32)) (zeroValue!3966 V!7297) (minValue!3966 V!7297) (_size!1524 (_ BitVec 32)) (_keys!6173 array!10707) (_values!4108 array!10705) (_vacant!1524 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2950)

(declare-datatypes ((SeekEntryResult!784 0))(
  ( (MissingZero!784 (index!5306 (_ BitVec 32))) (Found!784 (index!5307 (_ BitVec 32))) (Intermediate!784 (undefined!1596 Bool) (index!5308 (_ BitVec 32)) (x!22839 (_ BitVec 32))) (Undefined!784) (MissingVacant!784 (index!5309 (_ BitVec 32))) )
))
(declare-fun lt!111353 () SeekEntryResult!784)

(assert (=> b!218314 (= res!107017 (= (select (arr!5074 (_keys!6173 thiss!1504)) (index!5306 lt!111353)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!9768 () Bool)

(declare-fun mapRes!9768 () Bool)

(assert (=> mapIsEmpty!9768 mapRes!9768))

(declare-fun tp_is_empty!5737 () Bool)

(declare-fun e!142006 () Bool)

(declare-fun e!142009 () Bool)

(declare-fun array_inv!3341 (array!10707) Bool)

(declare-fun array_inv!3342 (array!10705) Bool)

(assert (=> b!218315 (= e!142006 (and tp!20759 tp_is_empty!5737 (array_inv!3341 (_keys!6173 thiss!1504)) (array_inv!3342 (_values!4108 thiss!1504)) e!142009))))

(declare-fun b!218316 () Bool)

(declare-fun c!36310 () Bool)

(get-info :version)

(assert (=> b!218316 (= c!36310 ((_ is MissingVacant!784) lt!111353))))

(declare-fun e!142013 () Bool)

(declare-fun e!142010 () Bool)

(assert (=> b!218316 (= e!142013 e!142010)))

(declare-fun b!218317 () Bool)

(declare-fun e!142008 () Bool)

(assert (=> b!218317 (= e!142008 tp_is_empty!5737)))

(declare-fun bm!20360 () Bool)

(declare-fun call!20363 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20360 (= call!20363 (arrayContainsKey!0 (_keys!6173 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!218319 () Bool)

(declare-fun e!142016 () Bool)

(assert (=> b!218319 (= e!142016 false)))

(declare-datatypes ((Unit!6466 0))(
  ( (Unit!6467) )
))
(declare-fun lt!111356 () Unit!6466)

(declare-fun e!142011 () Unit!6466)

(assert (=> b!218319 (= lt!111356 e!142011)))

(declare-fun c!36311 () Bool)

(declare-datatypes ((tuple2!4290 0))(
  ( (tuple2!4291 (_1!2156 (_ BitVec 64)) (_2!2156 V!7297)) )
))
(declare-datatypes ((List!3213 0))(
  ( (Nil!3210) (Cons!3209 (h!3856 tuple2!4290) (t!8159 List!3213)) )
))
(declare-datatypes ((ListLongMap!3193 0))(
  ( (ListLongMap!3194 (toList!1612 List!3213)) )
))
(declare-fun contains!1453 (ListLongMap!3193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1121 (array!10707 array!10705 (_ BitVec 32) (_ BitVec 32) V!7297 V!7297 (_ BitVec 32) Int) ListLongMap!3193)

(assert (=> b!218319 (= c!36311 (contains!1453 (getCurrentListMap!1121 (_keys!6173 thiss!1504) (_values!4108 thiss!1504) (mask!9901 thiss!1504) (extraKeys!3862 thiss!1504) (zeroValue!3966 thiss!1504) (minValue!3966 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4125 thiss!1504)) key!932))))

(declare-fun b!218320 () Bool)

(declare-fun res!107022 () Bool)

(assert (=> b!218320 (=> (not res!107022) (not e!142015))))

(declare-fun call!20364 () Bool)

(assert (=> b!218320 (= res!107022 call!20364)))

(assert (=> b!218320 (= e!142013 e!142015)))

(declare-fun bm!20361 () Bool)

(declare-fun c!36312 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20361 (= call!20364 (inRange!0 (ite c!36312 (index!5306 lt!111353) (index!5309 lt!111353)) (mask!9901 thiss!1504)))))

(declare-fun mapNonEmpty!9768 () Bool)

(declare-fun tp!20760 () Bool)

(assert (=> mapNonEmpty!9768 (= mapRes!9768 (and tp!20760 e!142008))))

(declare-fun mapKey!9768 () (_ BitVec 32))

(declare-fun mapValue!9768 () ValueCell!2525)

(declare-fun mapRest!9768 () (Array (_ BitVec 32) ValueCell!2525))

(assert (=> mapNonEmpty!9768 (= (arr!5073 (_values!4108 thiss!1504)) (store mapRest!9768 mapKey!9768 mapValue!9768))))

(declare-fun b!218321 () Bool)

(declare-fun res!107023 () Bool)

(assert (=> b!218321 (= res!107023 (= (select (arr!5074 (_keys!6173 thiss!1504)) (index!5309 lt!111353)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!142012 () Bool)

(assert (=> b!218321 (=> (not res!107023) (not e!142012))))

(declare-fun b!218322 () Bool)

(assert (=> b!218322 (= e!142010 ((_ is Undefined!784) lt!111353))))

(declare-fun b!218323 () Bool)

(declare-fun Unit!6468 () Unit!6466)

(assert (=> b!218323 (= e!142011 Unit!6468)))

(declare-fun lt!111354 () Unit!6466)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!184 (array!10707 array!10705 (_ BitVec 32) (_ BitVec 32) V!7297 V!7297 (_ BitVec 64) Int) Unit!6466)

(assert (=> b!218323 (= lt!111354 (lemmaInListMapThenSeekEntryOrOpenFindsIt!184 (_keys!6173 thiss!1504) (_values!4108 thiss!1504) (mask!9901 thiss!1504) (extraKeys!3862 thiss!1504) (zeroValue!3966 thiss!1504) (minValue!3966 thiss!1504) key!932 (defaultEntry!4125 thiss!1504)))))

(assert (=> b!218323 false))

(declare-fun b!218324 () Bool)

(declare-fun res!107020 () Bool)

(declare-fun e!142007 () Bool)

(assert (=> b!218324 (=> (not res!107020) (not e!142007))))

(assert (=> b!218324 (= res!107020 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!218325 () Bool)

(declare-fun e!142005 () Bool)

(assert (=> b!218325 (= e!142005 tp_is_empty!5737)))

(declare-fun b!218326 () Bool)

(assert (=> b!218326 (= e!142015 (not call!20363))))

(declare-fun res!107021 () Bool)

(assert (=> start!21730 (=> (not res!107021) (not e!142007))))

(declare-fun valid!1211 (LongMapFixedSize!2950) Bool)

(assert (=> start!21730 (= res!107021 (valid!1211 thiss!1504))))

(assert (=> start!21730 e!142007))

(assert (=> start!21730 e!142006))

(assert (=> start!21730 true))

(declare-fun b!218318 () Bool)

(assert (=> b!218318 (= e!142010 e!142012)))

(declare-fun res!107019 () Bool)

(assert (=> b!218318 (= res!107019 call!20364)))

(assert (=> b!218318 (=> (not res!107019) (not e!142012))))

(declare-fun b!218327 () Bool)

(declare-fun lt!111355 () Unit!6466)

(assert (=> b!218327 (= e!142011 lt!111355)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!185 (array!10707 array!10705 (_ BitVec 32) (_ BitVec 32) V!7297 V!7297 (_ BitVec 64) Int) Unit!6466)

(assert (=> b!218327 (= lt!111355 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!185 (_keys!6173 thiss!1504) (_values!4108 thiss!1504) (mask!9901 thiss!1504) (extraKeys!3862 thiss!1504) (zeroValue!3966 thiss!1504) (minValue!3966 thiss!1504) key!932 (defaultEntry!4125 thiss!1504)))))

(assert (=> b!218327 (= c!36312 ((_ is MissingZero!784) lt!111353))))

(assert (=> b!218327 e!142013))

(declare-fun b!218328 () Bool)

(assert (=> b!218328 (= e!142012 (not call!20363))))

(declare-fun b!218329 () Bool)

(assert (=> b!218329 (= e!142007 e!142016)))

(declare-fun res!107018 () Bool)

(assert (=> b!218329 (=> (not res!107018) (not e!142016))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!218329 (= res!107018 (or (= lt!111353 (MissingZero!784 index!297)) (= lt!111353 (MissingVacant!784 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10707 (_ BitVec 32)) SeekEntryResult!784)

(assert (=> b!218329 (= lt!111353 (seekEntryOrOpen!0 key!932 (_keys!6173 thiss!1504) (mask!9901 thiss!1504)))))

(declare-fun b!218330 () Bool)

(assert (=> b!218330 (= e!142009 (and e!142005 mapRes!9768))))

(declare-fun condMapEmpty!9768 () Bool)

(declare-fun mapDefault!9768 () ValueCell!2525)

(assert (=> b!218330 (= condMapEmpty!9768 (= (arr!5073 (_values!4108 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2525)) mapDefault!9768)))))

(assert (= (and start!21730 res!107021) b!218324))

(assert (= (and b!218324 res!107020) b!218329))

(assert (= (and b!218329 res!107018) b!218319))

(assert (= (and b!218319 c!36311) b!218323))

(assert (= (and b!218319 (not c!36311)) b!218327))

(assert (= (and b!218327 c!36312) b!218320))

(assert (= (and b!218327 (not c!36312)) b!218316))

(assert (= (and b!218320 res!107022) b!218314))

(assert (= (and b!218314 res!107017) b!218326))

(assert (= (and b!218316 c!36310) b!218318))

(assert (= (and b!218316 (not c!36310)) b!218322))

(assert (= (and b!218318 res!107019) b!218321))

(assert (= (and b!218321 res!107023) b!218328))

(assert (= (or b!218320 b!218318) bm!20361))

(assert (= (or b!218326 b!218328) bm!20360))

(assert (= (and b!218330 condMapEmpty!9768) mapIsEmpty!9768))

(assert (= (and b!218330 (not condMapEmpty!9768)) mapNonEmpty!9768))

(assert (= (and mapNonEmpty!9768 ((_ is ValueCellFull!2525) mapValue!9768)) b!218317))

(assert (= (and b!218330 ((_ is ValueCellFull!2525) mapDefault!9768)) b!218325))

(assert (= b!218315 b!218330))

(assert (= start!21730 b!218315))

(declare-fun m!243753 () Bool)

(assert (=> mapNonEmpty!9768 m!243753))

(declare-fun m!243755 () Bool)

(assert (=> b!218319 m!243755))

(assert (=> b!218319 m!243755))

(declare-fun m!243757 () Bool)

(assert (=> b!218319 m!243757))

(declare-fun m!243759 () Bool)

(assert (=> start!21730 m!243759))

(declare-fun m!243761 () Bool)

(assert (=> bm!20360 m!243761))

(declare-fun m!243763 () Bool)

(assert (=> bm!20361 m!243763))

(declare-fun m!243765 () Bool)

(assert (=> b!218314 m!243765))

(declare-fun m!243767 () Bool)

(assert (=> b!218323 m!243767))

(declare-fun m!243769 () Bool)

(assert (=> b!218321 m!243769))

(declare-fun m!243771 () Bool)

(assert (=> b!218315 m!243771))

(declare-fun m!243773 () Bool)

(assert (=> b!218315 m!243773))

(declare-fun m!243775 () Bool)

(assert (=> b!218327 m!243775))

(declare-fun m!243777 () Bool)

(assert (=> b!218329 m!243777))

(check-sat (not b!218315) (not start!21730) b_and!12739 (not b!218327) (not b!218323) (not b!218329) (not b_next!5875) (not b!218319) (not mapNonEmpty!9768) (not bm!20360) (not bm!20361) tp_is_empty!5737)
(check-sat b_and!12739 (not b_next!5875))
