; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22980 () Bool)

(assert start!22980)

(declare-fun b!240968 () Bool)

(declare-fun b_free!6483 () Bool)

(declare-fun b_next!6483 () Bool)

(assert (=> b!240968 (= b_free!6483 (not b_next!6483))))

(declare-fun tp!22652 () Bool)

(declare-fun b_and!13449 () Bool)

(assert (=> b!240968 (= tp!22652 b_and!13449)))

(declare-fun res!118153 () Bool)

(declare-fun e!156390 () Bool)

(assert (=> start!22980 (=> (not res!118153) (not e!156390))))

(declare-datatypes ((V!8107 0))(
  ( (V!8108 (val!3217 Int)) )
))
(declare-datatypes ((ValueCell!2829 0))(
  ( (ValueCellFull!2829 (v!5255 V!8107)) (EmptyCell!2829) )
))
(declare-datatypes ((array!11969 0))(
  ( (array!11970 (arr!5686 (Array (_ BitVec 32) ValueCell!2829)) (size!6027 (_ BitVec 32))) )
))
(declare-datatypes ((array!11971 0))(
  ( (array!11972 (arr!5687 (Array (_ BitVec 32) (_ BitVec 64))) (size!6028 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3558 0))(
  ( (LongMapFixedSize!3559 (defaultEntry!4464 Int) (mask!10526 (_ BitVec 32)) (extraKeys!4201 (_ BitVec 32)) (zeroValue!4305 V!8107) (minValue!4305 V!8107) (_size!1828 (_ BitVec 32)) (_keys!6566 array!11971) (_values!4447 array!11969) (_vacant!1828 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3558)

(declare-fun valid!1398 (LongMapFixedSize!3558) Bool)

(assert (=> start!22980 (= res!118153 (valid!1398 thiss!1504))))

(assert (=> start!22980 e!156390))

(declare-fun e!156389 () Bool)

(assert (=> start!22980 e!156389))

(assert (=> start!22980 true))

(declare-fun b!240959 () Bool)

(declare-datatypes ((Unit!7417 0))(
  ( (Unit!7418) )
))
(declare-fun e!156393 () Unit!7417)

(declare-fun Unit!7419 () Unit!7417)

(assert (=> b!240959 (= e!156393 Unit!7419)))

(declare-fun lt!121114 () Unit!7417)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!151 (array!11971 array!11969 (_ BitVec 32) (_ BitVec 32) V!8107 V!8107 (_ BitVec 64) (_ BitVec 32) Int) Unit!7417)

(assert (=> b!240959 (= lt!121114 (lemmaArrayContainsKeyThenInListMap!151 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))))

(assert (=> b!240959 false))

(declare-fun b!240960 () Bool)

(declare-fun e!156394 () Bool)

(declare-fun tp_is_empty!6345 () Bool)

(assert (=> b!240960 (= e!156394 tp_is_empty!6345)))

(declare-fun call!22409 () Bool)

(declare-datatypes ((SeekEntryResult!1053 0))(
  ( (MissingZero!1053 (index!6382 (_ BitVec 32))) (Found!1053 (index!6383 (_ BitVec 32))) (Intermediate!1053 (undefined!1865 Bool) (index!6384 (_ BitVec 32)) (x!24189 (_ BitVec 32))) (Undefined!1053) (MissingVacant!1053 (index!6385 (_ BitVec 32))) )
))
(declare-fun lt!121116 () SeekEntryResult!1053)

(declare-fun bm!22406 () Bool)

(declare-fun c!40130 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22406 (= call!22409 (inRange!0 (ite c!40130 (index!6382 lt!121116) (index!6385 lt!121116)) (mask!10526 thiss!1504)))))

(declare-fun b!240961 () Bool)

(declare-fun res!118150 () Bool)

(declare-fun e!156398 () Bool)

(assert (=> b!240961 (=> (not res!118150) (not e!156398))))

(assert (=> b!240961 (= res!118150 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6382 lt!121116)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240962 () Bool)

(declare-fun e!156399 () Bool)

(assert (=> b!240962 (= e!156390 e!156399)))

(declare-fun res!118152 () Bool)

(assert (=> b!240962 (=> (not res!118152) (not e!156399))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240962 (= res!118152 (or (= lt!121116 (MissingZero!1053 index!297)) (= lt!121116 (MissingVacant!1053 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11971 (_ BitVec 32)) SeekEntryResult!1053)

(assert (=> b!240962 (= lt!121116 (seekEntryOrOpen!0 key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(declare-fun b!240963 () Bool)

(declare-fun res!118154 () Bool)

(assert (=> b!240963 (=> (not res!118154) (not e!156390))))

(assert (=> b!240963 (= res!118154 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!240964 () Bool)

(declare-fun e!156396 () Bool)

(declare-fun e!156395 () Bool)

(assert (=> b!240964 (= e!156396 e!156395)))

(declare-fun res!118148 () Bool)

(assert (=> b!240964 (= res!118148 call!22409)))

(assert (=> b!240964 (=> (not res!118148) (not e!156395))))

(declare-fun b!240965 () Bool)

(declare-fun res!118149 () Bool)

(assert (=> b!240965 (= res!118149 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6385 lt!121116)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240965 (=> (not res!118149) (not e!156395))))

(declare-fun b!240966 () Bool)

(declare-fun res!118147 () Bool)

(assert (=> b!240966 (=> (not res!118147) (not e!156398))))

(assert (=> b!240966 (= res!118147 call!22409)))

(declare-fun e!156401 () Bool)

(assert (=> b!240966 (= e!156401 e!156398)))

(declare-fun b!240967 () Bool)

(declare-fun Unit!7420 () Unit!7417)

(assert (=> b!240967 (= e!156393 Unit!7420)))

(declare-fun e!156397 () Bool)

(declare-fun array_inv!3763 (array!11971) Bool)

(declare-fun array_inv!3764 (array!11969) Bool)

(assert (=> b!240968 (= e!156389 (and tp!22652 tp_is_empty!6345 (array_inv!3763 (_keys!6566 thiss!1504)) (array_inv!3764 (_values!4447 thiss!1504)) e!156397))))

(declare-fun b!240969 () Bool)

(declare-fun e!156392 () Unit!7417)

(declare-fun Unit!7421 () Unit!7417)

(assert (=> b!240969 (= e!156392 Unit!7421)))

(declare-fun lt!121112 () Unit!7417)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!345 (array!11971 array!11969 (_ BitVec 32) (_ BitVec 32) V!8107 V!8107 (_ BitVec 64) Int) Unit!7417)

(assert (=> b!240969 (= lt!121112 (lemmaInListMapThenSeekEntryOrOpenFindsIt!345 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 (defaultEntry!4464 thiss!1504)))))

(assert (=> b!240969 false))

(declare-fun b!240970 () Bool)

(declare-fun call!22410 () Bool)

(assert (=> b!240970 (= e!156395 (not call!22410))))

(declare-fun b!240971 () Bool)

(get-info :version)

(assert (=> b!240971 (= e!156396 ((_ is Undefined!1053) lt!121116))))

(declare-fun b!240972 () Bool)

(declare-fun e!156391 () Bool)

(assert (=> b!240972 (= e!156391 tp_is_empty!6345)))

(declare-fun b!240973 () Bool)

(declare-fun lt!121111 () Unit!7417)

(assert (=> b!240973 (= e!156392 lt!121111)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!356 (array!11971 array!11969 (_ BitVec 32) (_ BitVec 32) V!8107 V!8107 (_ BitVec 64) Int) Unit!7417)

(assert (=> b!240973 (= lt!121111 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!356 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 (defaultEntry!4464 thiss!1504)))))

(assert (=> b!240973 (= c!40130 ((_ is MissingZero!1053) lt!121116))))

(assert (=> b!240973 e!156401))

(declare-fun b!240974 () Bool)

(declare-fun mapRes!10749 () Bool)

(assert (=> b!240974 (= e!156397 (and e!156394 mapRes!10749))))

(declare-fun condMapEmpty!10749 () Bool)

(declare-fun mapDefault!10749 () ValueCell!2829)

(assert (=> b!240974 (= condMapEmpty!10749 (= (arr!5686 (_values!4447 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2829)) mapDefault!10749)))))

(declare-fun mapNonEmpty!10749 () Bool)

(declare-fun tp!22653 () Bool)

(assert (=> mapNonEmpty!10749 (= mapRes!10749 (and tp!22653 e!156391))))

(declare-fun mapRest!10749 () (Array (_ BitVec 32) ValueCell!2829))

(declare-fun mapValue!10749 () ValueCell!2829)

(declare-fun mapKey!10749 () (_ BitVec 32))

(assert (=> mapNonEmpty!10749 (= (arr!5686 (_values!4447 thiss!1504)) (store mapRest!10749 mapKey!10749 mapValue!10749))))

(declare-fun b!240975 () Bool)

(declare-fun c!40132 () Bool)

(assert (=> b!240975 (= c!40132 ((_ is MissingVacant!1053) lt!121116))))

(assert (=> b!240975 (= e!156401 e!156396)))

(declare-fun b!240976 () Bool)

(declare-fun e!156400 () Bool)

(assert (=> b!240976 (= e!156400 (bvsge (size!6028 (_keys!6566 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun lt!121115 () Unit!7417)

(assert (=> b!240976 (= lt!121115 e!156393)))

(declare-fun c!40133 () Bool)

(declare-fun arrayContainsKey!0 (array!11971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240976 (= c!40133 (arrayContainsKey!0 (_keys!6566 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240977 () Bool)

(assert (=> b!240977 (= e!156399 e!156400)))

(declare-fun res!118151 () Bool)

(assert (=> b!240977 (=> (not res!118151) (not e!156400))))

(assert (=> b!240977 (= res!118151 (inRange!0 index!297 (mask!10526 thiss!1504)))))

(declare-fun lt!121113 () Unit!7417)

(assert (=> b!240977 (= lt!121113 e!156392)))

(declare-fun c!40131 () Bool)

(declare-datatypes ((tuple2!4738 0))(
  ( (tuple2!4739 (_1!2380 (_ BitVec 64)) (_2!2380 V!8107)) )
))
(declare-datatypes ((List!3620 0))(
  ( (Nil!3617) (Cons!3616 (h!4272 tuple2!4738) (t!8615 List!3620)) )
))
(declare-datatypes ((ListLongMap!3651 0))(
  ( (ListLongMap!3652 (toList!1841 List!3620)) )
))
(declare-fun contains!1729 (ListLongMap!3651 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1369 (array!11971 array!11969 (_ BitVec 32) (_ BitVec 32) V!8107 V!8107 (_ BitVec 32) Int) ListLongMap!3651)

(assert (=> b!240977 (= c!40131 (contains!1729 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)) key!932))))

(declare-fun bm!22407 () Bool)

(assert (=> bm!22407 (= call!22410 (arrayContainsKey!0 (_keys!6566 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10749 () Bool)

(assert (=> mapIsEmpty!10749 mapRes!10749))

(declare-fun b!240978 () Bool)

(assert (=> b!240978 (= e!156398 (not call!22410))))

(assert (= (and start!22980 res!118153) b!240963))

(assert (= (and b!240963 res!118154) b!240962))

(assert (= (and b!240962 res!118152) b!240977))

(assert (= (and b!240977 c!40131) b!240969))

(assert (= (and b!240977 (not c!40131)) b!240973))

(assert (= (and b!240973 c!40130) b!240966))

(assert (= (and b!240973 (not c!40130)) b!240975))

(assert (= (and b!240966 res!118147) b!240961))

(assert (= (and b!240961 res!118150) b!240978))

(assert (= (and b!240975 c!40132) b!240964))

(assert (= (and b!240975 (not c!40132)) b!240971))

(assert (= (and b!240964 res!118148) b!240965))

(assert (= (and b!240965 res!118149) b!240970))

(assert (= (or b!240966 b!240964) bm!22406))

(assert (= (or b!240978 b!240970) bm!22407))

(assert (= (and b!240977 res!118151) b!240976))

(assert (= (and b!240976 c!40133) b!240959))

(assert (= (and b!240976 (not c!40133)) b!240967))

(assert (= (and b!240974 condMapEmpty!10749) mapIsEmpty!10749))

(assert (= (and b!240974 (not condMapEmpty!10749)) mapNonEmpty!10749))

(assert (= (and mapNonEmpty!10749 ((_ is ValueCellFull!2829) mapValue!10749)) b!240972))

(assert (= (and b!240974 ((_ is ValueCellFull!2829) mapDefault!10749)) b!240960))

(assert (= b!240968 b!240974))

(assert (= start!22980 b!240968))

(declare-fun m!260285 () Bool)

(assert (=> b!240965 m!260285))

(declare-fun m!260287 () Bool)

(assert (=> mapNonEmpty!10749 m!260287))

(declare-fun m!260289 () Bool)

(assert (=> start!22980 m!260289))

(declare-fun m!260291 () Bool)

(assert (=> bm!22406 m!260291))

(declare-fun m!260293 () Bool)

(assert (=> b!240977 m!260293))

(declare-fun m!260295 () Bool)

(assert (=> b!240977 m!260295))

(assert (=> b!240977 m!260295))

(declare-fun m!260297 () Bool)

(assert (=> b!240977 m!260297))

(declare-fun m!260299 () Bool)

(assert (=> b!240969 m!260299))

(declare-fun m!260301 () Bool)

(assert (=> b!240959 m!260301))

(declare-fun m!260303 () Bool)

(assert (=> b!240968 m!260303))

(declare-fun m!260305 () Bool)

(assert (=> b!240968 m!260305))

(declare-fun m!260307 () Bool)

(assert (=> bm!22407 m!260307))

(declare-fun m!260309 () Bool)

(assert (=> b!240961 m!260309))

(declare-fun m!260311 () Bool)

(assert (=> b!240973 m!260311))

(assert (=> b!240976 m!260307))

(declare-fun m!260313 () Bool)

(assert (=> b!240962 m!260313))

(check-sat (not b!240969) (not bm!22407) (not b!240976) (not b!240973) tp_is_empty!6345 (not b!240968) (not bm!22406) (not b!240977) (not b_next!6483) (not mapNonEmpty!10749) (not b!240962) b_and!13449 (not b!240959) (not start!22980))
(check-sat b_and!13449 (not b_next!6483))
(get-model)

(declare-fun d!59797 () Bool)

(declare-fun res!118183 () Bool)

(declare-fun e!156449 () Bool)

(assert (=> d!59797 (=> res!118183 e!156449)))

(assert (=> d!59797 (= res!118183 (= (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59797 (= (arrayContainsKey!0 (_keys!6566 thiss!1504) key!932 #b00000000000000000000000000000000) e!156449)))

(declare-fun b!241043 () Bool)

(declare-fun e!156450 () Bool)

(assert (=> b!241043 (= e!156449 e!156450)))

(declare-fun res!118184 () Bool)

(assert (=> b!241043 (=> (not res!118184) (not e!156450))))

(assert (=> b!241043 (= res!118184 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun b!241044 () Bool)

(assert (=> b!241044 (= e!156450 (arrayContainsKey!0 (_keys!6566 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59797 (not res!118183)) b!241043))

(assert (= (and b!241043 res!118184) b!241044))

(declare-fun m!260345 () Bool)

(assert (=> d!59797 m!260345))

(declare-fun m!260347 () Bool)

(assert (=> b!241044 m!260347))

(assert (=> bm!22407 d!59797))

(declare-fun d!59799 () Bool)

(assert (=> d!59799 (= (array_inv!3763 (_keys!6566 thiss!1504)) (bvsge (size!6028 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!240968 d!59799))

(declare-fun d!59801 () Bool)

(assert (=> d!59801 (= (array_inv!3764 (_values!4447 thiss!1504)) (bvsge (size!6027 (_values!4447 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!240968 d!59801))

(declare-fun d!59803 () Bool)

(declare-fun e!156453 () Bool)

(assert (=> d!59803 e!156453))

(declare-fun res!118189 () Bool)

(assert (=> d!59803 (=> (not res!118189) (not e!156453))))

(declare-fun lt!121139 () SeekEntryResult!1053)

(assert (=> d!59803 (= res!118189 ((_ is Found!1053) lt!121139))))

(assert (=> d!59803 (= lt!121139 (seekEntryOrOpen!0 key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(declare-fun lt!121140 () Unit!7417)

(declare-fun choose!1116 (array!11971 array!11969 (_ BitVec 32) (_ BitVec 32) V!8107 V!8107 (_ BitVec 64) Int) Unit!7417)

(assert (=> d!59803 (= lt!121140 (choose!1116 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 (defaultEntry!4464 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59803 (validMask!0 (mask!10526 thiss!1504))))

(assert (=> d!59803 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!345 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 (defaultEntry!4464 thiss!1504)) lt!121140)))

(declare-fun b!241049 () Bool)

(declare-fun res!118190 () Bool)

(assert (=> b!241049 (=> (not res!118190) (not e!156453))))

(assert (=> b!241049 (= res!118190 (inRange!0 (index!6383 lt!121139) (mask!10526 thiss!1504)))))

(declare-fun b!241050 () Bool)

(assert (=> b!241050 (= e!156453 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6383 lt!121139)) key!932))))

(assert (=> b!241050 (and (bvsge (index!6383 lt!121139) #b00000000000000000000000000000000) (bvslt (index!6383 lt!121139) (size!6028 (_keys!6566 thiss!1504))))))

(assert (= (and d!59803 res!118189) b!241049))

(assert (= (and b!241049 res!118190) b!241050))

(assert (=> d!59803 m!260313))

(declare-fun m!260349 () Bool)

(assert (=> d!59803 m!260349))

(declare-fun m!260351 () Bool)

(assert (=> d!59803 m!260351))

(declare-fun m!260353 () Bool)

(assert (=> b!241049 m!260353))

(declare-fun m!260355 () Bool)

(assert (=> b!241050 m!260355))

(assert (=> b!240969 d!59803))

(declare-fun d!59805 () Bool)

(assert (=> d!59805 (contains!1729 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)) key!932)))

(declare-fun lt!121143 () Unit!7417)

(declare-fun choose!1117 (array!11971 array!11969 (_ BitVec 32) (_ BitVec 32) V!8107 V!8107 (_ BitVec 64) (_ BitVec 32) Int) Unit!7417)

(assert (=> d!59805 (= lt!121143 (choose!1117 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))))

(assert (=> d!59805 (validMask!0 (mask!10526 thiss!1504))))

(assert (=> d!59805 (= (lemmaArrayContainsKeyThenInListMap!151 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)) lt!121143)))

(declare-fun bs!8834 () Bool)

(assert (= bs!8834 d!59805))

(assert (=> bs!8834 m!260295))

(assert (=> bs!8834 m!260295))

(assert (=> bs!8834 m!260297))

(declare-fun m!260357 () Bool)

(assert (=> bs!8834 m!260357))

(assert (=> bs!8834 m!260351))

(assert (=> b!240959 d!59805))

(declare-fun b!241067 () Bool)

(declare-fun res!118200 () Bool)

(declare-fun e!156465 () Bool)

(assert (=> b!241067 (=> (not res!118200) (not e!156465))))

(declare-fun call!22422 () Bool)

(assert (=> b!241067 (= res!118200 call!22422)))

(declare-fun e!156464 () Bool)

(assert (=> b!241067 (= e!156464 e!156465)))

(declare-fun b!241068 () Bool)

(declare-fun lt!121149 () SeekEntryResult!1053)

(assert (=> b!241068 (= e!156464 ((_ is Undefined!1053) lt!121149))))

(declare-fun c!40150 () Bool)

(declare-fun bm!22418 () Bool)

(assert (=> bm!22418 (= call!22422 (inRange!0 (ite c!40150 (index!6382 lt!121149) (index!6385 lt!121149)) (mask!10526 thiss!1504)))))

(declare-fun bm!22419 () Bool)

(declare-fun call!22421 () Bool)

(assert (=> bm!22419 (= call!22421 (arrayContainsKey!0 (_keys!6566 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241069 () Bool)

(declare-fun e!156462 () Bool)

(assert (=> b!241069 (= e!156462 e!156464)))

(declare-fun c!40151 () Bool)

(assert (=> b!241069 (= c!40151 ((_ is MissingVacant!1053) lt!121149))))

(declare-fun d!59807 () Bool)

(assert (=> d!59807 e!156462))

(assert (=> d!59807 (= c!40150 ((_ is MissingZero!1053) lt!121149))))

(assert (=> d!59807 (= lt!121149 (seekEntryOrOpen!0 key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(declare-fun lt!121148 () Unit!7417)

(declare-fun choose!1118 (array!11971 array!11969 (_ BitVec 32) (_ BitVec 32) V!8107 V!8107 (_ BitVec 64) Int) Unit!7417)

(assert (=> d!59807 (= lt!121148 (choose!1118 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 (defaultEntry!4464 thiss!1504)))))

(assert (=> d!59807 (validMask!0 (mask!10526 thiss!1504))))

(assert (=> d!59807 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!356 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 (defaultEntry!4464 thiss!1504)) lt!121148)))

(declare-fun b!241070 () Bool)

(assert (=> b!241070 (and (bvsge (index!6382 lt!121149) #b00000000000000000000000000000000) (bvslt (index!6382 lt!121149) (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun res!118199 () Bool)

(assert (=> b!241070 (= res!118199 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6382 lt!121149)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156463 () Bool)

(assert (=> b!241070 (=> (not res!118199) (not e!156463))))

(declare-fun b!241071 () Bool)

(assert (=> b!241071 (= e!156465 (not call!22421))))

(declare-fun b!241072 () Bool)

(declare-fun res!118201 () Bool)

(assert (=> b!241072 (=> (not res!118201) (not e!156465))))

(assert (=> b!241072 (= res!118201 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6385 lt!121149)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241072 (and (bvsge (index!6385 lt!121149) #b00000000000000000000000000000000) (bvslt (index!6385 lt!121149) (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun b!241073 () Bool)

(assert (=> b!241073 (= e!156463 (not call!22421))))

(declare-fun b!241074 () Bool)

(assert (=> b!241074 (= e!156462 e!156463)))

(declare-fun res!118202 () Bool)

(assert (=> b!241074 (= res!118202 call!22422)))

(assert (=> b!241074 (=> (not res!118202) (not e!156463))))

(assert (= (and d!59807 c!40150) b!241074))

(assert (= (and d!59807 (not c!40150)) b!241069))

(assert (= (and b!241074 res!118202) b!241070))

(assert (= (and b!241070 res!118199) b!241073))

(assert (= (and b!241069 c!40151) b!241067))

(assert (= (and b!241069 (not c!40151)) b!241068))

(assert (= (and b!241067 res!118200) b!241072))

(assert (= (and b!241072 res!118201) b!241071))

(assert (= (or b!241074 b!241067) bm!22418))

(assert (= (or b!241073 b!241071) bm!22419))

(declare-fun m!260359 () Bool)

(assert (=> b!241072 m!260359))

(declare-fun m!260361 () Bool)

(assert (=> bm!22418 m!260361))

(assert (=> bm!22419 m!260307))

(assert (=> d!59807 m!260313))

(declare-fun m!260363 () Bool)

(assert (=> d!59807 m!260363))

(assert (=> d!59807 m!260351))

(declare-fun m!260365 () Bool)

(assert (=> b!241070 m!260365))

(assert (=> b!240973 d!59807))

(declare-fun d!59809 () Bool)

(declare-fun res!118209 () Bool)

(declare-fun e!156468 () Bool)

(assert (=> d!59809 (=> (not res!118209) (not e!156468))))

(declare-fun simpleValid!244 (LongMapFixedSize!3558) Bool)

(assert (=> d!59809 (= res!118209 (simpleValid!244 thiss!1504))))

(assert (=> d!59809 (= (valid!1398 thiss!1504) e!156468)))

(declare-fun b!241081 () Bool)

(declare-fun res!118210 () Bool)

(assert (=> b!241081 (=> (not res!118210) (not e!156468))))

(declare-fun arrayCountValidKeys!0 (array!11971 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!241081 (= res!118210 (= (arrayCountValidKeys!0 (_keys!6566 thiss!1504) #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))) (_size!1828 thiss!1504)))))

(declare-fun b!241082 () Bool)

(declare-fun res!118211 () Bool)

(assert (=> b!241082 (=> (not res!118211) (not e!156468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11971 (_ BitVec 32)) Bool)

(assert (=> b!241082 (= res!118211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(declare-fun b!241083 () Bool)

(declare-datatypes ((List!3622 0))(
  ( (Nil!3619) (Cons!3618 (h!4274 (_ BitVec 64)) (t!8619 List!3622)) )
))
(declare-fun arrayNoDuplicates!0 (array!11971 (_ BitVec 32) List!3622) Bool)

(assert (=> b!241083 (= e!156468 (arrayNoDuplicates!0 (_keys!6566 thiss!1504) #b00000000000000000000000000000000 Nil!3619))))

(assert (= (and d!59809 res!118209) b!241081))

(assert (= (and b!241081 res!118210) b!241082))

(assert (= (and b!241082 res!118211) b!241083))

(declare-fun m!260367 () Bool)

(assert (=> d!59809 m!260367))

(declare-fun m!260369 () Bool)

(assert (=> b!241081 m!260369))

(declare-fun m!260371 () Bool)

(assert (=> b!241082 m!260371))

(declare-fun m!260373 () Bool)

(assert (=> b!241083 m!260373))

(assert (=> start!22980 d!59809))

(declare-fun b!241096 () Bool)

(declare-fun c!40160 () Bool)

(declare-fun lt!121158 () (_ BitVec 64))

(assert (=> b!241096 (= c!40160 (= lt!121158 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156477 () SeekEntryResult!1053)

(declare-fun e!156476 () SeekEntryResult!1053)

(assert (=> b!241096 (= e!156477 e!156476)))

(declare-fun d!59811 () Bool)

(declare-fun lt!121156 () SeekEntryResult!1053)

(assert (=> d!59811 (and (or ((_ is Undefined!1053) lt!121156) (not ((_ is Found!1053) lt!121156)) (and (bvsge (index!6383 lt!121156) #b00000000000000000000000000000000) (bvslt (index!6383 lt!121156) (size!6028 (_keys!6566 thiss!1504))))) (or ((_ is Undefined!1053) lt!121156) ((_ is Found!1053) lt!121156) (not ((_ is MissingZero!1053) lt!121156)) (and (bvsge (index!6382 lt!121156) #b00000000000000000000000000000000) (bvslt (index!6382 lt!121156) (size!6028 (_keys!6566 thiss!1504))))) (or ((_ is Undefined!1053) lt!121156) ((_ is Found!1053) lt!121156) ((_ is MissingZero!1053) lt!121156) (not ((_ is MissingVacant!1053) lt!121156)) (and (bvsge (index!6385 lt!121156) #b00000000000000000000000000000000) (bvslt (index!6385 lt!121156) (size!6028 (_keys!6566 thiss!1504))))) (or ((_ is Undefined!1053) lt!121156) (ite ((_ is Found!1053) lt!121156) (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6383 lt!121156)) key!932) (ite ((_ is MissingZero!1053) lt!121156) (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6382 lt!121156)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1053) lt!121156) (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6385 lt!121156)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!156475 () SeekEntryResult!1053)

(assert (=> d!59811 (= lt!121156 e!156475)))

(declare-fun c!40158 () Bool)

(declare-fun lt!121157 () SeekEntryResult!1053)

(assert (=> d!59811 (= c!40158 (and ((_ is Intermediate!1053) lt!121157) (undefined!1865 lt!121157)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11971 (_ BitVec 32)) SeekEntryResult!1053)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59811 (= lt!121157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10526 thiss!1504)) key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(assert (=> d!59811 (validMask!0 (mask!10526 thiss!1504))))

(assert (=> d!59811 (= (seekEntryOrOpen!0 key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)) lt!121156)))

(declare-fun b!241097 () Bool)

(assert (=> b!241097 (= e!156476 (MissingZero!1053 (index!6384 lt!121157)))))

(declare-fun b!241098 () Bool)

(assert (=> b!241098 (= e!156475 Undefined!1053)))

(declare-fun b!241099 () Bool)

(assert (=> b!241099 (= e!156475 e!156477)))

(assert (=> b!241099 (= lt!121158 (select (arr!5687 (_keys!6566 thiss!1504)) (index!6384 lt!121157)))))

(declare-fun c!40159 () Bool)

(assert (=> b!241099 (= c!40159 (= lt!121158 key!932))))

(declare-fun b!241100 () Bool)

(assert (=> b!241100 (= e!156477 (Found!1053 (index!6384 lt!121157)))))

(declare-fun b!241101 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11971 (_ BitVec 32)) SeekEntryResult!1053)

(assert (=> b!241101 (= e!156476 (seekKeyOrZeroReturnVacant!0 (x!24189 lt!121157) (index!6384 lt!121157) (index!6384 lt!121157) key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(assert (= (and d!59811 c!40158) b!241098))

(assert (= (and d!59811 (not c!40158)) b!241099))

(assert (= (and b!241099 c!40159) b!241100))

(assert (= (and b!241099 (not c!40159)) b!241096))

(assert (= (and b!241096 c!40160) b!241097))

(assert (= (and b!241096 (not c!40160)) b!241101))

(declare-fun m!260375 () Bool)

(assert (=> d!59811 m!260375))

(assert (=> d!59811 m!260351))

(declare-fun m!260377 () Bool)

(assert (=> d!59811 m!260377))

(declare-fun m!260379 () Bool)

(assert (=> d!59811 m!260379))

(declare-fun m!260381 () Bool)

(assert (=> d!59811 m!260381))

(assert (=> d!59811 m!260375))

(declare-fun m!260383 () Bool)

(assert (=> d!59811 m!260383))

(declare-fun m!260385 () Bool)

(assert (=> b!241099 m!260385))

(declare-fun m!260387 () Bool)

(assert (=> b!241101 m!260387))

(assert (=> b!240962 d!59811))

(declare-fun d!59813 () Bool)

(assert (=> d!59813 (= (inRange!0 index!297 (mask!10526 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10526 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!240977 d!59813))

(declare-fun d!59815 () Bool)

(declare-fun e!156483 () Bool)

(assert (=> d!59815 e!156483))

(declare-fun res!118214 () Bool)

(assert (=> d!59815 (=> res!118214 e!156483)))

(declare-fun lt!121170 () Bool)

(assert (=> d!59815 (= res!118214 (not lt!121170))))

(declare-fun lt!121168 () Bool)

(assert (=> d!59815 (= lt!121170 lt!121168)))

(declare-fun lt!121169 () Unit!7417)

(declare-fun e!156482 () Unit!7417)

(assert (=> d!59815 (= lt!121169 e!156482)))

(declare-fun c!40163 () Bool)

(assert (=> d!59815 (= c!40163 lt!121168)))

(declare-fun containsKey!271 (List!3620 (_ BitVec 64)) Bool)

(assert (=> d!59815 (= lt!121168 (containsKey!271 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932))))

(assert (=> d!59815 (= (contains!1729 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)) key!932) lt!121170)))

(declare-fun b!241108 () Bool)

(declare-fun lt!121167 () Unit!7417)

(assert (=> b!241108 (= e!156482 lt!121167)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!219 (List!3620 (_ BitVec 64)) Unit!7417)

(assert (=> b!241108 (= lt!121167 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932))))

(declare-datatypes ((Option!285 0))(
  ( (Some!284 (v!5257 V!8107)) (None!283) )
))
(declare-fun isDefined!220 (Option!285) Bool)

(declare-fun getValueByKey!279 (List!3620 (_ BitVec 64)) Option!285)

(assert (=> b!241108 (isDefined!220 (getValueByKey!279 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932))))

(declare-fun b!241109 () Bool)

(declare-fun Unit!7427 () Unit!7417)

(assert (=> b!241109 (= e!156482 Unit!7427)))

(declare-fun b!241110 () Bool)

(assert (=> b!241110 (= e!156483 (isDefined!220 (getValueByKey!279 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932)))))

(assert (= (and d!59815 c!40163) b!241108))

(assert (= (and d!59815 (not c!40163)) b!241109))

(assert (= (and d!59815 (not res!118214)) b!241110))

(declare-fun m!260389 () Bool)

(assert (=> d!59815 m!260389))

(declare-fun m!260391 () Bool)

(assert (=> b!241108 m!260391))

(declare-fun m!260393 () Bool)

(assert (=> b!241108 m!260393))

(assert (=> b!241108 m!260393))

(declare-fun m!260395 () Bool)

(assert (=> b!241108 m!260395))

(assert (=> b!241110 m!260393))

(assert (=> b!241110 m!260393))

(assert (=> b!241110 m!260395))

(assert (=> b!240977 d!59815))

(declare-fun b!241153 () Bool)

(declare-fun e!156516 () Bool)

(declare-fun call!22437 () Bool)

(assert (=> b!241153 (= e!156516 (not call!22437))))

(declare-fun b!241154 () Bool)

(declare-fun e!156513 () Bool)

(declare-fun lt!121230 () ListLongMap!3651)

(declare-fun apply!221 (ListLongMap!3651 (_ BitVec 64)) V!8107)

(declare-fun get!2918 (ValueCell!2829 V!8107) V!8107)

(declare-fun dynLambda!564 (Int (_ BitVec 64)) V!8107)

(assert (=> b!241154 (= e!156513 (= (apply!221 lt!121230 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)) (get!2918 (select (arr!5686 (_values!4447 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4464 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!241154 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6027 (_values!4447 thiss!1504))))))

(assert (=> b!241154 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun bm!22434 () Bool)

(assert (=> bm!22434 (= call!22437 (contains!1729 lt!121230 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22435 () Bool)

(declare-fun call!22443 () ListLongMap!3651)

(declare-fun call!22440 () ListLongMap!3651)

(assert (=> bm!22435 (= call!22443 call!22440)))

(declare-fun b!241155 () Bool)

(declare-fun e!156512 () Bool)

(assert (=> b!241155 (= e!156512 (= (apply!221 lt!121230 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4305 thiss!1504)))))

(declare-fun d!59817 () Bool)

(declare-fun e!156520 () Bool)

(assert (=> d!59817 e!156520))

(declare-fun res!118238 () Bool)

(assert (=> d!59817 (=> (not res!118238) (not e!156520))))

(assert (=> d!59817 (= res!118238 (or (bvsge #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))))

(declare-fun lt!121215 () ListLongMap!3651)

(assert (=> d!59817 (= lt!121230 lt!121215)))

(declare-fun lt!121235 () Unit!7417)

(declare-fun e!156518 () Unit!7417)

(assert (=> d!59817 (= lt!121235 e!156518)))

(declare-fun c!40177 () Bool)

(declare-fun e!156510 () Bool)

(assert (=> d!59817 (= c!40177 e!156510)))

(declare-fun res!118240 () Bool)

(assert (=> d!59817 (=> (not res!118240) (not e!156510))))

(assert (=> d!59817 (= res!118240 (bvslt #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun e!156515 () ListLongMap!3651)

(assert (=> d!59817 (= lt!121215 e!156515)))

(declare-fun c!40181 () Bool)

(assert (=> d!59817 (= c!40181 (and (not (= (bvand (extraKeys!4201 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4201 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59817 (validMask!0 (mask!10526 thiss!1504))))

(assert (=> d!59817 (= (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)) lt!121230)))

(declare-fun b!241156 () Bool)

(declare-fun +!648 (ListLongMap!3651 tuple2!4738) ListLongMap!3651)

(assert (=> b!241156 (= e!156515 (+!648 call!22440 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))))))

(declare-fun b!241157 () Bool)

(declare-fun e!156514 () Bool)

(assert (=> b!241157 (= e!156514 (= (apply!221 lt!121230 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4305 thiss!1504)))))

(declare-fun b!241158 () Bool)

(declare-fun e!156511 () Bool)

(declare-fun call!22441 () Bool)

(assert (=> b!241158 (= e!156511 (not call!22441))))

(declare-fun b!241159 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!241159 (= e!156510 (validKeyInArray!0 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241160 () Bool)

(declare-fun lt!121220 () Unit!7417)

(assert (=> b!241160 (= e!156518 lt!121220)))

(declare-fun lt!121216 () ListLongMap!3651)

(declare-fun getCurrentListMapNoExtraKeys!543 (array!11971 array!11969 (_ BitVec 32) (_ BitVec 32) V!8107 V!8107 (_ BitVec 32) Int) ListLongMap!3651)

(assert (=> b!241160 (= lt!121216 (getCurrentListMapNoExtraKeys!543 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))))

(declare-fun lt!121224 () (_ BitVec 64))

(assert (=> b!241160 (= lt!121224 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121223 () (_ BitVec 64))

(assert (=> b!241160 (= lt!121223 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121229 () Unit!7417)

(declare-fun addStillContains!197 (ListLongMap!3651 (_ BitVec 64) V!8107 (_ BitVec 64)) Unit!7417)

(assert (=> b!241160 (= lt!121229 (addStillContains!197 lt!121216 lt!121224 (zeroValue!4305 thiss!1504) lt!121223))))

(assert (=> b!241160 (contains!1729 (+!648 lt!121216 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504))) lt!121223)))

(declare-fun lt!121231 () Unit!7417)

(assert (=> b!241160 (= lt!121231 lt!121229)))

(declare-fun lt!121222 () ListLongMap!3651)

(assert (=> b!241160 (= lt!121222 (getCurrentListMapNoExtraKeys!543 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))))

(declare-fun lt!121232 () (_ BitVec 64))

(assert (=> b!241160 (= lt!121232 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121234 () (_ BitVec 64))

(assert (=> b!241160 (= lt!121234 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121227 () Unit!7417)

(declare-fun addApplyDifferent!197 (ListLongMap!3651 (_ BitVec 64) V!8107 (_ BitVec 64)) Unit!7417)

(assert (=> b!241160 (= lt!121227 (addApplyDifferent!197 lt!121222 lt!121232 (minValue!4305 thiss!1504) lt!121234))))

(assert (=> b!241160 (= (apply!221 (+!648 lt!121222 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504))) lt!121234) (apply!221 lt!121222 lt!121234))))

(declare-fun lt!121217 () Unit!7417)

(assert (=> b!241160 (= lt!121217 lt!121227)))

(declare-fun lt!121219 () ListLongMap!3651)

(assert (=> b!241160 (= lt!121219 (getCurrentListMapNoExtraKeys!543 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))))

(declare-fun lt!121225 () (_ BitVec 64))

(assert (=> b!241160 (= lt!121225 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121221 () (_ BitVec 64))

(assert (=> b!241160 (= lt!121221 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121218 () Unit!7417)

(assert (=> b!241160 (= lt!121218 (addApplyDifferent!197 lt!121219 lt!121225 (zeroValue!4305 thiss!1504) lt!121221))))

(assert (=> b!241160 (= (apply!221 (+!648 lt!121219 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504))) lt!121221) (apply!221 lt!121219 lt!121221))))

(declare-fun lt!121226 () Unit!7417)

(assert (=> b!241160 (= lt!121226 lt!121218)))

(declare-fun lt!121233 () ListLongMap!3651)

(assert (=> b!241160 (= lt!121233 (getCurrentListMapNoExtraKeys!543 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))))

(declare-fun lt!121236 () (_ BitVec 64))

(assert (=> b!241160 (= lt!121236 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121228 () (_ BitVec 64))

(assert (=> b!241160 (= lt!121228 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241160 (= lt!121220 (addApplyDifferent!197 lt!121233 lt!121236 (minValue!4305 thiss!1504) lt!121228))))

(assert (=> b!241160 (= (apply!221 (+!648 lt!121233 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504))) lt!121228) (apply!221 lt!121233 lt!121228))))

(declare-fun b!241161 () Bool)

(assert (=> b!241161 (= e!156520 e!156511)))

(declare-fun c!40180 () Bool)

(assert (=> b!241161 (= c!40180 (not (= (bvand (extraKeys!4201 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!241162 () Bool)

(declare-fun res!118237 () Bool)

(assert (=> b!241162 (=> (not res!118237) (not e!156520))))

(declare-fun e!156517 () Bool)

(assert (=> b!241162 (= res!118237 e!156517)))

(declare-fun res!118236 () Bool)

(assert (=> b!241162 (=> res!118236 e!156517)))

(declare-fun e!156522 () Bool)

(assert (=> b!241162 (= res!118236 (not e!156522))))

(declare-fun res!118234 () Bool)

(assert (=> b!241162 (=> (not res!118234) (not e!156522))))

(assert (=> b!241162 (= res!118234 (bvslt #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun b!241163 () Bool)

(assert (=> b!241163 (= e!156517 e!156513)))

(declare-fun res!118235 () Bool)

(assert (=> b!241163 (=> (not res!118235) (not e!156513))))

(assert (=> b!241163 (= res!118235 (contains!1729 lt!121230 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun bm!22436 () Bool)

(assert (=> bm!22436 (= call!22441 (contains!1729 lt!121230 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241164 () Bool)

(declare-fun e!156519 () ListLongMap!3651)

(assert (=> b!241164 (= e!156519 call!22443)))

(declare-fun b!241165 () Bool)

(declare-fun Unit!7428 () Unit!7417)

(assert (=> b!241165 (= e!156518 Unit!7428)))

(declare-fun b!241166 () Bool)

(declare-fun e!156521 () ListLongMap!3651)

(declare-fun call!22438 () ListLongMap!3651)

(assert (=> b!241166 (= e!156521 call!22438)))

(declare-fun b!241167 () Bool)

(declare-fun c!40176 () Bool)

(assert (=> b!241167 (= c!40176 (and (not (= (bvand (extraKeys!4201 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4201 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!241167 (= e!156519 e!156521)))

(declare-fun bm!22437 () Bool)

(declare-fun call!22442 () ListLongMap!3651)

(assert (=> bm!22437 (= call!22438 call!22442)))

(declare-fun c!40178 () Bool)

(declare-fun bm!22438 () Bool)

(declare-fun call!22439 () ListLongMap!3651)

(assert (=> bm!22438 (= call!22440 (+!648 (ite c!40181 call!22439 (ite c!40178 call!22442 call!22438)) (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))))))

(declare-fun b!241168 () Bool)

(assert (=> b!241168 (= e!156511 e!156512)))

(declare-fun res!118239 () Bool)

(assert (=> b!241168 (= res!118239 call!22441)))

(assert (=> b!241168 (=> (not res!118239) (not e!156512))))

(declare-fun bm!22439 () Bool)

(assert (=> bm!22439 (= call!22439 (getCurrentListMapNoExtraKeys!543 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))))

(declare-fun b!241169 () Bool)

(declare-fun res!118241 () Bool)

(assert (=> b!241169 (=> (not res!118241) (not e!156520))))

(assert (=> b!241169 (= res!118241 e!156516)))

(declare-fun c!40179 () Bool)

(assert (=> b!241169 (= c!40179 (not (= (bvand (extraKeys!4201 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22440 () Bool)

(assert (=> bm!22440 (= call!22442 call!22439)))

(declare-fun b!241170 () Bool)

(assert (=> b!241170 (= e!156516 e!156514)))

(declare-fun res!118233 () Bool)

(assert (=> b!241170 (= res!118233 call!22437)))

(assert (=> b!241170 (=> (not res!118233) (not e!156514))))

(declare-fun b!241171 () Bool)

(assert (=> b!241171 (= e!156522 (validKeyInArray!0 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241172 () Bool)

(assert (=> b!241172 (= e!156521 call!22443)))

(declare-fun b!241173 () Bool)

(assert (=> b!241173 (= e!156515 e!156519)))

(assert (=> b!241173 (= c!40178 (and (not (= (bvand (extraKeys!4201 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4201 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!59817 c!40181) b!241156))

(assert (= (and d!59817 (not c!40181)) b!241173))

(assert (= (and b!241173 c!40178) b!241164))

(assert (= (and b!241173 (not c!40178)) b!241167))

(assert (= (and b!241167 c!40176) b!241172))

(assert (= (and b!241167 (not c!40176)) b!241166))

(assert (= (or b!241172 b!241166) bm!22437))

(assert (= (or b!241164 bm!22437) bm!22440))

(assert (= (or b!241164 b!241172) bm!22435))

(assert (= (or b!241156 bm!22440) bm!22439))

(assert (= (or b!241156 bm!22435) bm!22438))

(assert (= (and d!59817 res!118240) b!241159))

(assert (= (and d!59817 c!40177) b!241160))

(assert (= (and d!59817 (not c!40177)) b!241165))

(assert (= (and d!59817 res!118238) b!241162))

(assert (= (and b!241162 res!118234) b!241171))

(assert (= (and b!241162 (not res!118236)) b!241163))

(assert (= (and b!241163 res!118235) b!241154))

(assert (= (and b!241162 res!118237) b!241169))

(assert (= (and b!241169 c!40179) b!241170))

(assert (= (and b!241169 (not c!40179)) b!241153))

(assert (= (and b!241170 res!118233) b!241157))

(assert (= (or b!241170 b!241153) bm!22434))

(assert (= (and b!241169 res!118241) b!241161))

(assert (= (and b!241161 c!40180) b!241168))

(assert (= (and b!241161 (not c!40180)) b!241158))

(assert (= (and b!241168 res!118239) b!241155))

(assert (= (or b!241168 b!241158) bm!22436))

(declare-fun b_lambda!7979 () Bool)

(assert (=> (not b_lambda!7979) (not b!241154)))

(declare-fun t!8618 () Bool)

(declare-fun tb!2955 () Bool)

(assert (=> (and b!240968 (= (defaultEntry!4464 thiss!1504) (defaultEntry!4464 thiss!1504)) t!8618) tb!2955))

(declare-fun result!5187 () Bool)

(assert (=> tb!2955 (= result!5187 tp_is_empty!6345)))

(assert (=> b!241154 t!8618))

(declare-fun b_and!13453 () Bool)

(assert (= b_and!13449 (and (=> t!8618 result!5187) b_and!13453)))

(declare-fun m!260397 () Bool)

(assert (=> b!241160 m!260397))

(declare-fun m!260399 () Bool)

(assert (=> b!241160 m!260399))

(declare-fun m!260401 () Bool)

(assert (=> b!241160 m!260401))

(declare-fun m!260403 () Bool)

(assert (=> b!241160 m!260403))

(declare-fun m!260405 () Bool)

(assert (=> b!241160 m!260405))

(declare-fun m!260407 () Bool)

(assert (=> b!241160 m!260407))

(declare-fun m!260409 () Bool)

(assert (=> b!241160 m!260409))

(declare-fun m!260411 () Bool)

(assert (=> b!241160 m!260411))

(declare-fun m!260413 () Bool)

(assert (=> b!241160 m!260413))

(declare-fun m!260415 () Bool)

(assert (=> b!241160 m!260415))

(assert (=> b!241160 m!260405))

(declare-fun m!260417 () Bool)

(assert (=> b!241160 m!260417))

(declare-fun m!260419 () Bool)

(assert (=> b!241160 m!260419))

(assert (=> b!241160 m!260403))

(declare-fun m!260421 () Bool)

(assert (=> b!241160 m!260421))

(declare-fun m!260423 () Bool)

(assert (=> b!241160 m!260423))

(assert (=> b!241160 m!260411))

(declare-fun m!260425 () Bool)

(assert (=> b!241160 m!260425))

(assert (=> b!241160 m!260413))

(declare-fun m!260427 () Bool)

(assert (=> b!241160 m!260427))

(assert (=> b!241160 m!260345))

(assert (=> b!241171 m!260345))

(assert (=> b!241171 m!260345))

(declare-fun m!260429 () Bool)

(assert (=> b!241171 m!260429))

(declare-fun m!260431 () Bool)

(assert (=> b!241156 m!260431))

(assert (=> b!241159 m!260345))

(assert (=> b!241159 m!260345))

(assert (=> b!241159 m!260429))

(declare-fun m!260433 () Bool)

(assert (=> b!241155 m!260433))

(declare-fun m!260435 () Bool)

(assert (=> b!241157 m!260435))

(assert (=> b!241163 m!260345))

(assert (=> b!241163 m!260345))

(declare-fun m!260437 () Bool)

(assert (=> b!241163 m!260437))

(declare-fun m!260439 () Bool)

(assert (=> bm!22436 m!260439))

(declare-fun m!260441 () Bool)

(assert (=> bm!22434 m!260441))

(assert (=> d!59817 m!260351))

(declare-fun m!260443 () Bool)

(assert (=> b!241154 m!260443))

(assert (=> b!241154 m!260345))

(assert (=> b!241154 m!260443))

(declare-fun m!260445 () Bool)

(assert (=> b!241154 m!260445))

(declare-fun m!260447 () Bool)

(assert (=> b!241154 m!260447))

(assert (=> b!241154 m!260345))

(declare-fun m!260449 () Bool)

(assert (=> b!241154 m!260449))

(assert (=> b!241154 m!260445))

(assert (=> bm!22439 m!260423))

(declare-fun m!260451 () Bool)

(assert (=> bm!22438 m!260451))

(assert (=> b!240977 d!59817))

(declare-fun d!59819 () Bool)

(assert (=> d!59819 (= (inRange!0 (ite c!40130 (index!6382 lt!121116) (index!6385 lt!121116)) (mask!10526 thiss!1504)) (and (bvsge (ite c!40130 (index!6382 lt!121116) (index!6385 lt!121116)) #b00000000000000000000000000000000) (bvslt (ite c!40130 (index!6382 lt!121116) (index!6385 lt!121116)) (bvadd (mask!10526 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22406 d!59819))

(assert (=> b!240976 d!59797))

(declare-fun mapNonEmpty!10755 () Bool)

(declare-fun mapRes!10755 () Bool)

(declare-fun tp!22662 () Bool)

(declare-fun e!156528 () Bool)

(assert (=> mapNonEmpty!10755 (= mapRes!10755 (and tp!22662 e!156528))))

(declare-fun mapRest!10755 () (Array (_ BitVec 32) ValueCell!2829))

(declare-fun mapKey!10755 () (_ BitVec 32))

(declare-fun mapValue!10755 () ValueCell!2829)

(assert (=> mapNonEmpty!10755 (= mapRest!10749 (store mapRest!10755 mapKey!10755 mapValue!10755))))

(declare-fun mapIsEmpty!10755 () Bool)

(assert (=> mapIsEmpty!10755 mapRes!10755))

(declare-fun b!241182 () Bool)

(assert (=> b!241182 (= e!156528 tp_is_empty!6345)))

(declare-fun condMapEmpty!10755 () Bool)

(declare-fun mapDefault!10755 () ValueCell!2829)

(assert (=> mapNonEmpty!10749 (= condMapEmpty!10755 (= mapRest!10749 ((as const (Array (_ BitVec 32) ValueCell!2829)) mapDefault!10755)))))

(declare-fun e!156527 () Bool)

(assert (=> mapNonEmpty!10749 (= tp!22653 (and e!156527 mapRes!10755))))

(declare-fun b!241183 () Bool)

(assert (=> b!241183 (= e!156527 tp_is_empty!6345)))

(assert (= (and mapNonEmpty!10749 condMapEmpty!10755) mapIsEmpty!10755))

(assert (= (and mapNonEmpty!10749 (not condMapEmpty!10755)) mapNonEmpty!10755))

(assert (= (and mapNonEmpty!10755 ((_ is ValueCellFull!2829) mapValue!10755)) b!241182))

(assert (= (and mapNonEmpty!10749 ((_ is ValueCellFull!2829) mapDefault!10755)) b!241183))

(declare-fun m!260453 () Bool)

(assert (=> mapNonEmpty!10755 m!260453))

(declare-fun b_lambda!7981 () Bool)

(assert (= b_lambda!7979 (or (and b!240968 b_free!6483) b_lambda!7981)))

(check-sat (not b_next!6483) (not bm!22436) (not b!241108) (not b!241159) (not d!59815) (not d!59807) (not bm!22439) (not b!241082) (not b_lambda!7981) (not b!241083) (not b!241081) (not d!59817) (not bm!22438) (not bm!22418) (not b!241163) (not b!241156) b_and!13453 (not b!241171) (not d!59811) (not bm!22419) (not b!241049) (not mapNonEmpty!10755) (not b!241101) (not d!59803) (not b!241157) (not b!241154) (not b!241044) tp_is_empty!6345 (not bm!22434) (not d!59805) (not b!241110) (not d!59809) (not b!241160) (not b!241155))
(check-sat b_and!13453 (not b_next!6483))
(get-model)

(assert (=> d!59803 d!59811))

(declare-fun d!59821 () Bool)

(declare-fun e!156531 () Bool)

(assert (=> d!59821 e!156531))

(declare-fun res!118246 () Bool)

(assert (=> d!59821 (=> (not res!118246) (not e!156531))))

(declare-fun lt!121239 () SeekEntryResult!1053)

(assert (=> d!59821 (= res!118246 ((_ is Found!1053) lt!121239))))

(assert (=> d!59821 (= lt!121239 (seekEntryOrOpen!0 key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(assert (=> d!59821 true))

(declare-fun _$33!156 () Unit!7417)

(assert (=> d!59821 (= (choose!1116 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 (defaultEntry!4464 thiss!1504)) _$33!156)))

(declare-fun b!241188 () Bool)

(declare-fun res!118247 () Bool)

(assert (=> b!241188 (=> (not res!118247) (not e!156531))))

(assert (=> b!241188 (= res!118247 (inRange!0 (index!6383 lt!121239) (mask!10526 thiss!1504)))))

(declare-fun b!241189 () Bool)

(assert (=> b!241189 (= e!156531 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6383 lt!121239)) key!932))))

(assert (= (and d!59821 res!118246) b!241188))

(assert (= (and b!241188 res!118247) b!241189))

(assert (=> d!59821 m!260313))

(declare-fun m!260455 () Bool)

(assert (=> b!241188 m!260455))

(declare-fun m!260457 () Bool)

(assert (=> b!241189 m!260457))

(assert (=> d!59803 d!59821))

(declare-fun d!59823 () Bool)

(assert (=> d!59823 (= (validMask!0 (mask!10526 thiss!1504)) (and (or (= (mask!10526 thiss!1504) #b00000000000000000000000000000111) (= (mask!10526 thiss!1504) #b00000000000000000000000000001111) (= (mask!10526 thiss!1504) #b00000000000000000000000000011111) (= (mask!10526 thiss!1504) #b00000000000000000000000000111111) (= (mask!10526 thiss!1504) #b00000000000000000000000001111111) (= (mask!10526 thiss!1504) #b00000000000000000000000011111111) (= (mask!10526 thiss!1504) #b00000000000000000000000111111111) (= (mask!10526 thiss!1504) #b00000000000000000000001111111111) (= (mask!10526 thiss!1504) #b00000000000000000000011111111111) (= (mask!10526 thiss!1504) #b00000000000000000000111111111111) (= (mask!10526 thiss!1504) #b00000000000000000001111111111111) (= (mask!10526 thiss!1504) #b00000000000000000011111111111111) (= (mask!10526 thiss!1504) #b00000000000000000111111111111111) (= (mask!10526 thiss!1504) #b00000000000000001111111111111111) (= (mask!10526 thiss!1504) #b00000000000000011111111111111111) (= (mask!10526 thiss!1504) #b00000000000000111111111111111111) (= (mask!10526 thiss!1504) #b00000000000001111111111111111111) (= (mask!10526 thiss!1504) #b00000000000011111111111111111111) (= (mask!10526 thiss!1504) #b00000000000111111111111111111111) (= (mask!10526 thiss!1504) #b00000000001111111111111111111111) (= (mask!10526 thiss!1504) #b00000000011111111111111111111111) (= (mask!10526 thiss!1504) #b00000000111111111111111111111111) (= (mask!10526 thiss!1504) #b00000001111111111111111111111111) (= (mask!10526 thiss!1504) #b00000011111111111111111111111111) (= (mask!10526 thiss!1504) #b00000111111111111111111111111111) (= (mask!10526 thiss!1504) #b00001111111111111111111111111111) (= (mask!10526 thiss!1504) #b00011111111111111111111111111111) (= (mask!10526 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10526 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> d!59803 d!59823))

(declare-fun d!59825 () Bool)

(declare-fun get!2919 (Option!285) V!8107)

(assert (=> d!59825 (= (apply!221 lt!121222 lt!121234) (get!2919 (getValueByKey!279 (toList!1841 lt!121222) lt!121234)))))

(declare-fun bs!8835 () Bool)

(assert (= bs!8835 d!59825))

(declare-fun m!260459 () Bool)

(assert (=> bs!8835 m!260459))

(assert (=> bs!8835 m!260459))

(declare-fun m!260461 () Bool)

(assert (=> bs!8835 m!260461))

(assert (=> b!241160 d!59825))

(declare-fun d!59827 () Bool)

(declare-fun e!156534 () Bool)

(assert (=> d!59827 e!156534))

(declare-fun res!118252 () Bool)

(assert (=> d!59827 (=> (not res!118252) (not e!156534))))

(declare-fun lt!121248 () ListLongMap!3651)

(assert (=> d!59827 (= res!118252 (contains!1729 lt!121248 (_1!2380 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504)))))))

(declare-fun lt!121249 () List!3620)

(assert (=> d!59827 (= lt!121248 (ListLongMap!3652 lt!121249))))

(declare-fun lt!121250 () Unit!7417)

(declare-fun lt!121251 () Unit!7417)

(assert (=> d!59827 (= lt!121250 lt!121251)))

(assert (=> d!59827 (= (getValueByKey!279 lt!121249 (_1!2380 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504)))) (Some!284 (_2!2380 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!155 (List!3620 (_ BitVec 64) V!8107) Unit!7417)

(assert (=> d!59827 (= lt!121251 (lemmaContainsTupThenGetReturnValue!155 lt!121249 (_1!2380 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504))) (_2!2380 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504)))))))

(declare-fun insertStrictlySorted!158 (List!3620 (_ BitVec 64) V!8107) List!3620)

(assert (=> d!59827 (= lt!121249 (insertStrictlySorted!158 (toList!1841 lt!121219) (_1!2380 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504))) (_2!2380 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504)))))))

(assert (=> d!59827 (= (+!648 lt!121219 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504))) lt!121248)))

(declare-fun b!241194 () Bool)

(declare-fun res!118253 () Bool)

(assert (=> b!241194 (=> (not res!118253) (not e!156534))))

(assert (=> b!241194 (= res!118253 (= (getValueByKey!279 (toList!1841 lt!121248) (_1!2380 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504)))) (Some!284 (_2!2380 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504))))))))

(declare-fun b!241195 () Bool)

(declare-fun contains!1731 (List!3620 tuple2!4738) Bool)

(assert (=> b!241195 (= e!156534 (contains!1731 (toList!1841 lt!121248) (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504))))))

(assert (= (and d!59827 res!118252) b!241194))

(assert (= (and b!241194 res!118253) b!241195))

(declare-fun m!260463 () Bool)

(assert (=> d!59827 m!260463))

(declare-fun m!260465 () Bool)

(assert (=> d!59827 m!260465))

(declare-fun m!260467 () Bool)

(assert (=> d!59827 m!260467))

(declare-fun m!260469 () Bool)

(assert (=> d!59827 m!260469))

(declare-fun m!260471 () Bool)

(assert (=> b!241194 m!260471))

(declare-fun m!260473 () Bool)

(assert (=> b!241195 m!260473))

(assert (=> b!241160 d!59827))

(declare-fun d!59829 () Bool)

(assert (=> d!59829 (contains!1729 (+!648 lt!121216 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504))) lt!121223)))

(declare-fun lt!121254 () Unit!7417)

(declare-fun choose!1119 (ListLongMap!3651 (_ BitVec 64) V!8107 (_ BitVec 64)) Unit!7417)

(assert (=> d!59829 (= lt!121254 (choose!1119 lt!121216 lt!121224 (zeroValue!4305 thiss!1504) lt!121223))))

(assert (=> d!59829 (contains!1729 lt!121216 lt!121223)))

(assert (=> d!59829 (= (addStillContains!197 lt!121216 lt!121224 (zeroValue!4305 thiss!1504) lt!121223) lt!121254)))

(declare-fun bs!8836 () Bool)

(assert (= bs!8836 d!59829))

(assert (=> bs!8836 m!260413))

(assert (=> bs!8836 m!260413))

(assert (=> bs!8836 m!260427))

(declare-fun m!260475 () Bool)

(assert (=> bs!8836 m!260475))

(declare-fun m!260477 () Bool)

(assert (=> bs!8836 m!260477))

(assert (=> b!241160 d!59829))

(declare-fun d!59831 () Bool)

(declare-fun e!156535 () Bool)

(assert (=> d!59831 e!156535))

(declare-fun res!118254 () Bool)

(assert (=> d!59831 (=> (not res!118254) (not e!156535))))

(declare-fun lt!121255 () ListLongMap!3651)

(assert (=> d!59831 (= res!118254 (contains!1729 lt!121255 (_1!2380 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504)))))))

(declare-fun lt!121256 () List!3620)

(assert (=> d!59831 (= lt!121255 (ListLongMap!3652 lt!121256))))

(declare-fun lt!121257 () Unit!7417)

(declare-fun lt!121258 () Unit!7417)

(assert (=> d!59831 (= lt!121257 lt!121258)))

(assert (=> d!59831 (= (getValueByKey!279 lt!121256 (_1!2380 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504)))) (Some!284 (_2!2380 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504)))))))

(assert (=> d!59831 (= lt!121258 (lemmaContainsTupThenGetReturnValue!155 lt!121256 (_1!2380 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504))) (_2!2380 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504)))))))

(assert (=> d!59831 (= lt!121256 (insertStrictlySorted!158 (toList!1841 lt!121233) (_1!2380 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504))) (_2!2380 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504)))))))

(assert (=> d!59831 (= (+!648 lt!121233 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504))) lt!121255)))

(declare-fun b!241197 () Bool)

(declare-fun res!118255 () Bool)

(assert (=> b!241197 (=> (not res!118255) (not e!156535))))

(assert (=> b!241197 (= res!118255 (= (getValueByKey!279 (toList!1841 lt!121255) (_1!2380 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504)))) (Some!284 (_2!2380 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504))))))))

(declare-fun b!241198 () Bool)

(assert (=> b!241198 (= e!156535 (contains!1731 (toList!1841 lt!121255) (tuple2!4739 lt!121236 (minValue!4305 thiss!1504))))))

(assert (= (and d!59831 res!118254) b!241197))

(assert (= (and b!241197 res!118255) b!241198))

(declare-fun m!260479 () Bool)

(assert (=> d!59831 m!260479))

(declare-fun m!260481 () Bool)

(assert (=> d!59831 m!260481))

(declare-fun m!260483 () Bool)

(assert (=> d!59831 m!260483))

(declare-fun m!260485 () Bool)

(assert (=> d!59831 m!260485))

(declare-fun m!260487 () Bool)

(assert (=> b!241197 m!260487))

(declare-fun m!260489 () Bool)

(assert (=> b!241198 m!260489))

(assert (=> b!241160 d!59831))

(declare-fun d!59833 () Bool)

(declare-fun e!156536 () Bool)

(assert (=> d!59833 e!156536))

(declare-fun res!118256 () Bool)

(assert (=> d!59833 (=> (not res!118256) (not e!156536))))

(declare-fun lt!121259 () ListLongMap!3651)

(assert (=> d!59833 (= res!118256 (contains!1729 lt!121259 (_1!2380 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504)))))))

(declare-fun lt!121260 () List!3620)

(assert (=> d!59833 (= lt!121259 (ListLongMap!3652 lt!121260))))

(declare-fun lt!121261 () Unit!7417)

(declare-fun lt!121262 () Unit!7417)

(assert (=> d!59833 (= lt!121261 lt!121262)))

(assert (=> d!59833 (= (getValueByKey!279 lt!121260 (_1!2380 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504)))) (Some!284 (_2!2380 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504)))))))

(assert (=> d!59833 (= lt!121262 (lemmaContainsTupThenGetReturnValue!155 lt!121260 (_1!2380 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504))) (_2!2380 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504)))))))

(assert (=> d!59833 (= lt!121260 (insertStrictlySorted!158 (toList!1841 lt!121216) (_1!2380 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504))) (_2!2380 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504)))))))

(assert (=> d!59833 (= (+!648 lt!121216 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504))) lt!121259)))

(declare-fun b!241199 () Bool)

(declare-fun res!118257 () Bool)

(assert (=> b!241199 (=> (not res!118257) (not e!156536))))

(assert (=> b!241199 (= res!118257 (= (getValueByKey!279 (toList!1841 lt!121259) (_1!2380 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504)))) (Some!284 (_2!2380 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504))))))))

(declare-fun b!241200 () Bool)

(assert (=> b!241200 (= e!156536 (contains!1731 (toList!1841 lt!121259) (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504))))))

(assert (= (and d!59833 res!118256) b!241199))

(assert (= (and b!241199 res!118257) b!241200))

(declare-fun m!260491 () Bool)

(assert (=> d!59833 m!260491))

(declare-fun m!260493 () Bool)

(assert (=> d!59833 m!260493))

(declare-fun m!260495 () Bool)

(assert (=> d!59833 m!260495))

(declare-fun m!260497 () Bool)

(assert (=> d!59833 m!260497))

(declare-fun m!260499 () Bool)

(assert (=> b!241199 m!260499))

(declare-fun m!260501 () Bool)

(assert (=> b!241200 m!260501))

(assert (=> b!241160 d!59833))

(declare-fun d!59835 () Bool)

(assert (=> d!59835 (= (apply!221 lt!121233 lt!121228) (get!2919 (getValueByKey!279 (toList!1841 lt!121233) lt!121228)))))

(declare-fun bs!8837 () Bool)

(assert (= bs!8837 d!59835))

(declare-fun m!260503 () Bool)

(assert (=> bs!8837 m!260503))

(assert (=> bs!8837 m!260503))

(declare-fun m!260505 () Bool)

(assert (=> bs!8837 m!260505))

(assert (=> b!241160 d!59835))

(declare-fun d!59837 () Bool)

(assert (=> d!59837 (= (apply!221 (+!648 lt!121219 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504))) lt!121221) (get!2919 (getValueByKey!279 (toList!1841 (+!648 lt!121219 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504)))) lt!121221)))))

(declare-fun bs!8838 () Bool)

(assert (= bs!8838 d!59837))

(declare-fun m!260507 () Bool)

(assert (=> bs!8838 m!260507))

(assert (=> bs!8838 m!260507))

(declare-fun m!260509 () Bool)

(assert (=> bs!8838 m!260509))

(assert (=> b!241160 d!59837))

(declare-fun d!59839 () Bool)

(assert (=> d!59839 (= (apply!221 (+!648 lt!121233 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504))) lt!121228) (apply!221 lt!121233 lt!121228))))

(declare-fun lt!121265 () Unit!7417)

(declare-fun choose!1120 (ListLongMap!3651 (_ BitVec 64) V!8107 (_ BitVec 64)) Unit!7417)

(assert (=> d!59839 (= lt!121265 (choose!1120 lt!121233 lt!121236 (minValue!4305 thiss!1504) lt!121228))))

(declare-fun e!156539 () Bool)

(assert (=> d!59839 e!156539))

(declare-fun res!118260 () Bool)

(assert (=> d!59839 (=> (not res!118260) (not e!156539))))

(assert (=> d!59839 (= res!118260 (contains!1729 lt!121233 lt!121228))))

(assert (=> d!59839 (= (addApplyDifferent!197 lt!121233 lt!121236 (minValue!4305 thiss!1504) lt!121228) lt!121265)))

(declare-fun b!241204 () Bool)

(assert (=> b!241204 (= e!156539 (not (= lt!121228 lt!121236)))))

(assert (= (and d!59839 res!118260) b!241204))

(declare-fun m!260511 () Bool)

(assert (=> d!59839 m!260511))

(assert (=> d!59839 m!260411))

(assert (=> d!59839 m!260425))

(assert (=> d!59839 m!260409))

(assert (=> d!59839 m!260411))

(declare-fun m!260513 () Bool)

(assert (=> d!59839 m!260513))

(assert (=> b!241160 d!59839))

(declare-fun d!59841 () Bool)

(assert (=> d!59841 (= (apply!221 (+!648 lt!121233 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504))) lt!121228) (get!2919 (getValueByKey!279 (toList!1841 (+!648 lt!121233 (tuple2!4739 lt!121236 (minValue!4305 thiss!1504)))) lt!121228)))))

(declare-fun bs!8839 () Bool)

(assert (= bs!8839 d!59841))

(declare-fun m!260515 () Bool)

(assert (=> bs!8839 m!260515))

(assert (=> bs!8839 m!260515))

(declare-fun m!260517 () Bool)

(assert (=> bs!8839 m!260517))

(assert (=> b!241160 d!59841))

(declare-fun d!59843 () Bool)

(declare-fun e!156541 () Bool)

(assert (=> d!59843 e!156541))

(declare-fun res!118261 () Bool)

(assert (=> d!59843 (=> res!118261 e!156541)))

(declare-fun lt!121269 () Bool)

(assert (=> d!59843 (= res!118261 (not lt!121269))))

(declare-fun lt!121267 () Bool)

(assert (=> d!59843 (= lt!121269 lt!121267)))

(declare-fun lt!121268 () Unit!7417)

(declare-fun e!156540 () Unit!7417)

(assert (=> d!59843 (= lt!121268 e!156540)))

(declare-fun c!40182 () Bool)

(assert (=> d!59843 (= c!40182 lt!121267)))

(assert (=> d!59843 (= lt!121267 (containsKey!271 (toList!1841 (+!648 lt!121216 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504)))) lt!121223))))

(assert (=> d!59843 (= (contains!1729 (+!648 lt!121216 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504))) lt!121223) lt!121269)))

(declare-fun b!241205 () Bool)

(declare-fun lt!121266 () Unit!7417)

(assert (=> b!241205 (= e!156540 lt!121266)))

(assert (=> b!241205 (= lt!121266 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1841 (+!648 lt!121216 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504)))) lt!121223))))

(assert (=> b!241205 (isDefined!220 (getValueByKey!279 (toList!1841 (+!648 lt!121216 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504)))) lt!121223))))

(declare-fun b!241206 () Bool)

(declare-fun Unit!7429 () Unit!7417)

(assert (=> b!241206 (= e!156540 Unit!7429)))

(declare-fun b!241207 () Bool)

(assert (=> b!241207 (= e!156541 (isDefined!220 (getValueByKey!279 (toList!1841 (+!648 lt!121216 (tuple2!4739 lt!121224 (zeroValue!4305 thiss!1504)))) lt!121223)))))

(assert (= (and d!59843 c!40182) b!241205))

(assert (= (and d!59843 (not c!40182)) b!241206))

(assert (= (and d!59843 (not res!118261)) b!241207))

(declare-fun m!260519 () Bool)

(assert (=> d!59843 m!260519))

(declare-fun m!260521 () Bool)

(assert (=> b!241205 m!260521))

(declare-fun m!260523 () Bool)

(assert (=> b!241205 m!260523))

(assert (=> b!241205 m!260523))

(declare-fun m!260525 () Bool)

(assert (=> b!241205 m!260525))

(assert (=> b!241207 m!260523))

(assert (=> b!241207 m!260523))

(assert (=> b!241207 m!260525))

(assert (=> b!241160 d!59843))

(declare-fun bm!22443 () Bool)

(declare-fun call!22446 () ListLongMap!3651)

(assert (=> bm!22443 (= call!22446 (getCurrentListMapNoExtraKeys!543 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4464 thiss!1504)))))

(declare-fun b!241233 () Bool)

(declare-fun e!156557 () Bool)

(declare-fun e!156559 () Bool)

(assert (=> b!241233 (= e!156557 e!156559)))

(declare-fun c!40191 () Bool)

(declare-fun e!156560 () Bool)

(assert (=> b!241233 (= c!40191 e!156560)))

(declare-fun res!118273 () Bool)

(assert (=> b!241233 (=> (not res!118273) (not e!156560))))

(assert (=> b!241233 (= res!118273 (bvslt #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun b!241234 () Bool)

(declare-fun lt!121290 () Unit!7417)

(declare-fun lt!121288 () Unit!7417)

(assert (=> b!241234 (= lt!121290 lt!121288)))

(declare-fun lt!121285 () (_ BitVec 64))

(declare-fun lt!121284 () (_ BitVec 64))

(declare-fun lt!121287 () V!8107)

(declare-fun lt!121286 () ListLongMap!3651)

(assert (=> b!241234 (not (contains!1729 (+!648 lt!121286 (tuple2!4739 lt!121284 lt!121287)) lt!121285))))

(declare-fun addStillNotContains!119 (ListLongMap!3651 (_ BitVec 64) V!8107 (_ BitVec 64)) Unit!7417)

(assert (=> b!241234 (= lt!121288 (addStillNotContains!119 lt!121286 lt!121284 lt!121287 lt!121285))))

(assert (=> b!241234 (= lt!121285 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!241234 (= lt!121287 (get!2918 (select (arr!5686 (_values!4447 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4464 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!241234 (= lt!121284 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!241234 (= lt!121286 call!22446)))

(declare-fun e!156558 () ListLongMap!3651)

(assert (=> b!241234 (= e!156558 (+!648 call!22446 (tuple2!4739 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000) (get!2918 (select (arr!5686 (_values!4447 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4464 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!241235 () Bool)

(declare-fun res!118271 () Bool)

(assert (=> b!241235 (=> (not res!118271) (not e!156557))))

(declare-fun lt!121289 () ListLongMap!3651)

(assert (=> b!241235 (= res!118271 (not (contains!1729 lt!121289 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!59845 () Bool)

(assert (=> d!59845 e!156557))

(declare-fun res!118272 () Bool)

(assert (=> d!59845 (=> (not res!118272) (not e!156557))))

(assert (=> d!59845 (= res!118272 (not (contains!1729 lt!121289 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!156562 () ListLongMap!3651)

(assert (=> d!59845 (= lt!121289 e!156562)))

(declare-fun c!40194 () Bool)

(assert (=> d!59845 (= c!40194 (bvsge #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(assert (=> d!59845 (validMask!0 (mask!10526 thiss!1504))))

(assert (=> d!59845 (= (getCurrentListMapNoExtraKeys!543 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)) lt!121289)))

(declare-fun b!241232 () Bool)

(assert (=> b!241232 (= e!156558 call!22446)))

(declare-fun b!241236 () Bool)

(declare-fun e!156556 () Bool)

(assert (=> b!241236 (= e!156559 e!156556)))

(assert (=> b!241236 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun res!118270 () Bool)

(assert (=> b!241236 (= res!118270 (contains!1729 lt!121289 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241236 (=> (not res!118270) (not e!156556))))

(declare-fun b!241237 () Bool)

(declare-fun e!156561 () Bool)

(assert (=> b!241237 (= e!156561 (= lt!121289 (getCurrentListMapNoExtraKeys!543 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4464 thiss!1504))))))

(declare-fun b!241238 () Bool)

(assert (=> b!241238 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(assert (=> b!241238 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6027 (_values!4447 thiss!1504))))))

(assert (=> b!241238 (= e!156556 (= (apply!221 lt!121289 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)) (get!2918 (select (arr!5686 (_values!4447 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4464 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!241239 () Bool)

(assert (=> b!241239 (= e!156562 (ListLongMap!3652 Nil!3617))))

(declare-fun b!241240 () Bool)

(assert (=> b!241240 (= e!156559 e!156561)))

(declare-fun c!40193 () Bool)

(assert (=> b!241240 (= c!40193 (bvslt #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun b!241241 () Bool)

(assert (=> b!241241 (= e!156560 (validKeyInArray!0 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241241 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!241242 () Bool)

(assert (=> b!241242 (= e!156562 e!156558)))

(declare-fun c!40192 () Bool)

(assert (=> b!241242 (= c!40192 (validKeyInArray!0 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241243 () Bool)

(declare-fun isEmpty!520 (ListLongMap!3651) Bool)

(assert (=> b!241243 (= e!156561 (isEmpty!520 lt!121289))))

(assert (= (and d!59845 c!40194) b!241239))

(assert (= (and d!59845 (not c!40194)) b!241242))

(assert (= (and b!241242 c!40192) b!241234))

(assert (= (and b!241242 (not c!40192)) b!241232))

(assert (= (or b!241234 b!241232) bm!22443))

(assert (= (and d!59845 res!118272) b!241235))

(assert (= (and b!241235 res!118271) b!241233))

(assert (= (and b!241233 res!118273) b!241241))

(assert (= (and b!241233 c!40191) b!241236))

(assert (= (and b!241233 (not c!40191)) b!241240))

(assert (= (and b!241236 res!118270) b!241238))

(assert (= (and b!241240 c!40193) b!241237))

(assert (= (and b!241240 (not c!40193)) b!241243))

(declare-fun b_lambda!7983 () Bool)

(assert (=> (not b_lambda!7983) (not b!241234)))

(assert (=> b!241234 t!8618))

(declare-fun b_and!13455 () Bool)

(assert (= b_and!13453 (and (=> t!8618 result!5187) b_and!13455)))

(declare-fun b_lambda!7985 () Bool)

(assert (=> (not b_lambda!7985) (not b!241238)))

(assert (=> b!241238 t!8618))

(declare-fun b_and!13457 () Bool)

(assert (= b_and!13455 (and (=> t!8618 result!5187) b_and!13457)))

(declare-fun m!260527 () Bool)

(assert (=> b!241243 m!260527))

(declare-fun m!260529 () Bool)

(assert (=> b!241234 m!260529))

(declare-fun m!260531 () Bool)

(assert (=> b!241234 m!260531))

(assert (=> b!241234 m!260443))

(assert (=> b!241234 m!260445))

(assert (=> b!241234 m!260447))

(assert (=> b!241234 m!260529))

(declare-fun m!260533 () Bool)

(assert (=> b!241234 m!260533))

(assert (=> b!241234 m!260443))

(assert (=> b!241234 m!260345))

(assert (=> b!241234 m!260445))

(declare-fun m!260535 () Bool)

(assert (=> b!241234 m!260535))

(declare-fun m!260537 () Bool)

(assert (=> b!241235 m!260537))

(declare-fun m!260539 () Bool)

(assert (=> bm!22443 m!260539))

(assert (=> b!241236 m!260345))

(assert (=> b!241236 m!260345))

(declare-fun m!260541 () Bool)

(assert (=> b!241236 m!260541))

(declare-fun m!260543 () Bool)

(assert (=> d!59845 m!260543))

(assert (=> d!59845 m!260351))

(assert (=> b!241237 m!260539))

(assert (=> b!241242 m!260345))

(assert (=> b!241242 m!260345))

(assert (=> b!241242 m!260429))

(assert (=> b!241241 m!260345))

(assert (=> b!241241 m!260345))

(assert (=> b!241241 m!260429))

(assert (=> b!241238 m!260445))

(assert (=> b!241238 m!260443))

(assert (=> b!241238 m!260445))

(assert (=> b!241238 m!260447))

(assert (=> b!241238 m!260345))

(declare-fun m!260545 () Bool)

(assert (=> b!241238 m!260545))

(assert (=> b!241238 m!260443))

(assert (=> b!241238 m!260345))

(assert (=> b!241160 d!59845))

(declare-fun d!59847 () Bool)

(declare-fun e!156563 () Bool)

(assert (=> d!59847 e!156563))

(declare-fun res!118274 () Bool)

(assert (=> d!59847 (=> (not res!118274) (not e!156563))))

(declare-fun lt!121291 () ListLongMap!3651)

(assert (=> d!59847 (= res!118274 (contains!1729 lt!121291 (_1!2380 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504)))))))

(declare-fun lt!121292 () List!3620)

(assert (=> d!59847 (= lt!121291 (ListLongMap!3652 lt!121292))))

(declare-fun lt!121293 () Unit!7417)

(declare-fun lt!121294 () Unit!7417)

(assert (=> d!59847 (= lt!121293 lt!121294)))

(assert (=> d!59847 (= (getValueByKey!279 lt!121292 (_1!2380 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504)))) (Some!284 (_2!2380 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504)))))))

(assert (=> d!59847 (= lt!121294 (lemmaContainsTupThenGetReturnValue!155 lt!121292 (_1!2380 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504))) (_2!2380 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504)))))))

(assert (=> d!59847 (= lt!121292 (insertStrictlySorted!158 (toList!1841 lt!121222) (_1!2380 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504))) (_2!2380 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504)))))))

(assert (=> d!59847 (= (+!648 lt!121222 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504))) lt!121291)))

(declare-fun b!241244 () Bool)

(declare-fun res!118275 () Bool)

(assert (=> b!241244 (=> (not res!118275) (not e!156563))))

(assert (=> b!241244 (= res!118275 (= (getValueByKey!279 (toList!1841 lt!121291) (_1!2380 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504)))) (Some!284 (_2!2380 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504))))))))

(declare-fun b!241245 () Bool)

(assert (=> b!241245 (= e!156563 (contains!1731 (toList!1841 lt!121291) (tuple2!4739 lt!121232 (minValue!4305 thiss!1504))))))

(assert (= (and d!59847 res!118274) b!241244))

(assert (= (and b!241244 res!118275) b!241245))

(declare-fun m!260547 () Bool)

(assert (=> d!59847 m!260547))

(declare-fun m!260549 () Bool)

(assert (=> d!59847 m!260549))

(declare-fun m!260551 () Bool)

(assert (=> d!59847 m!260551))

(declare-fun m!260553 () Bool)

(assert (=> d!59847 m!260553))

(declare-fun m!260555 () Bool)

(assert (=> b!241244 m!260555))

(declare-fun m!260557 () Bool)

(assert (=> b!241245 m!260557))

(assert (=> b!241160 d!59847))

(declare-fun d!59849 () Bool)

(assert (=> d!59849 (= (apply!221 lt!121219 lt!121221) (get!2919 (getValueByKey!279 (toList!1841 lt!121219) lt!121221)))))

(declare-fun bs!8840 () Bool)

(assert (= bs!8840 d!59849))

(declare-fun m!260559 () Bool)

(assert (=> bs!8840 m!260559))

(assert (=> bs!8840 m!260559))

(declare-fun m!260561 () Bool)

(assert (=> bs!8840 m!260561))

(assert (=> b!241160 d!59849))

(declare-fun d!59851 () Bool)

(assert (=> d!59851 (= (apply!221 (+!648 lt!121222 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504))) lt!121234) (get!2919 (getValueByKey!279 (toList!1841 (+!648 lt!121222 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504)))) lt!121234)))))

(declare-fun bs!8841 () Bool)

(assert (= bs!8841 d!59851))

(declare-fun m!260563 () Bool)

(assert (=> bs!8841 m!260563))

(assert (=> bs!8841 m!260563))

(declare-fun m!260565 () Bool)

(assert (=> bs!8841 m!260565))

(assert (=> b!241160 d!59851))

(declare-fun d!59853 () Bool)

(assert (=> d!59853 (= (apply!221 (+!648 lt!121222 (tuple2!4739 lt!121232 (minValue!4305 thiss!1504))) lt!121234) (apply!221 lt!121222 lt!121234))))

(declare-fun lt!121295 () Unit!7417)

(assert (=> d!59853 (= lt!121295 (choose!1120 lt!121222 lt!121232 (minValue!4305 thiss!1504) lt!121234))))

(declare-fun e!156564 () Bool)

(assert (=> d!59853 e!156564))

(declare-fun res!118276 () Bool)

(assert (=> d!59853 (=> (not res!118276) (not e!156564))))

(assert (=> d!59853 (= res!118276 (contains!1729 lt!121222 lt!121234))))

(assert (=> d!59853 (= (addApplyDifferent!197 lt!121222 lt!121232 (minValue!4305 thiss!1504) lt!121234) lt!121295)))

(declare-fun b!241246 () Bool)

(assert (=> b!241246 (= e!156564 (not (= lt!121234 lt!121232)))))

(assert (= (and d!59853 res!118276) b!241246))

(declare-fun m!260567 () Bool)

(assert (=> d!59853 m!260567))

(assert (=> d!59853 m!260405))

(assert (=> d!59853 m!260417))

(assert (=> d!59853 m!260415))

(assert (=> d!59853 m!260405))

(declare-fun m!260569 () Bool)

(assert (=> d!59853 m!260569))

(assert (=> b!241160 d!59853))

(declare-fun d!59855 () Bool)

(assert (=> d!59855 (= (apply!221 (+!648 lt!121219 (tuple2!4739 lt!121225 (zeroValue!4305 thiss!1504))) lt!121221) (apply!221 lt!121219 lt!121221))))

(declare-fun lt!121296 () Unit!7417)

(assert (=> d!59855 (= lt!121296 (choose!1120 lt!121219 lt!121225 (zeroValue!4305 thiss!1504) lt!121221))))

(declare-fun e!156565 () Bool)

(assert (=> d!59855 e!156565))

(declare-fun res!118277 () Bool)

(assert (=> d!59855 (=> (not res!118277) (not e!156565))))

(assert (=> d!59855 (= res!118277 (contains!1729 lt!121219 lt!121221))))

(assert (=> d!59855 (= (addApplyDifferent!197 lt!121219 lt!121225 (zeroValue!4305 thiss!1504) lt!121221) lt!121296)))

(declare-fun b!241247 () Bool)

(assert (=> b!241247 (= e!156565 (not (= lt!121221 lt!121225)))))

(assert (= (and d!59855 res!118277) b!241247))

(declare-fun m!260571 () Bool)

(assert (=> d!59855 m!260571))

(assert (=> d!59855 m!260403))

(assert (=> d!59855 m!260421))

(assert (=> d!59855 m!260397))

(assert (=> d!59855 m!260403))

(declare-fun m!260573 () Bool)

(assert (=> d!59855 m!260573))

(assert (=> b!241160 d!59855))

(declare-fun d!59857 () Bool)

(assert (=> d!59857 (= (validKeyInArray!0 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!241159 d!59857))

(declare-fun d!59859 () Bool)

(declare-fun isEmpty!521 (Option!285) Bool)

(assert (=> d!59859 (= (isDefined!220 (getValueByKey!279 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932)) (not (isEmpty!521 (getValueByKey!279 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932))))))

(declare-fun bs!8842 () Bool)

(assert (= bs!8842 d!59859))

(assert (=> bs!8842 m!260393))

(declare-fun m!260575 () Bool)

(assert (=> bs!8842 m!260575))

(assert (=> b!241110 d!59859))

(declare-fun b!241258 () Bool)

(declare-fun e!156571 () Option!285)

(assert (=> b!241258 (= e!156571 (getValueByKey!279 (t!8615 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))) key!932))))

(declare-fun b!241257 () Bool)

(declare-fun e!156570 () Option!285)

(assert (=> b!241257 (= e!156570 e!156571)))

(declare-fun c!40200 () Bool)

(assert (=> b!241257 (= c!40200 (and ((_ is Cons!3616) (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))) (not (= (_1!2380 (h!4272 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))))) key!932))))))

(declare-fun d!59861 () Bool)

(declare-fun c!40199 () Bool)

(assert (=> d!59861 (= c!40199 (and ((_ is Cons!3616) (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))) (= (_1!2380 (h!4272 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))))) key!932)))))

(assert (=> d!59861 (= (getValueByKey!279 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932) e!156570)))

(declare-fun b!241256 () Bool)

(assert (=> b!241256 (= e!156570 (Some!284 (_2!2380 (h!4272 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))))))))

(declare-fun b!241259 () Bool)

(assert (=> b!241259 (= e!156571 None!283)))

(assert (= (and d!59861 c!40199) b!241256))

(assert (= (and d!59861 (not c!40199)) b!241257))

(assert (= (and b!241257 c!40200) b!241258))

(assert (= (and b!241257 (not c!40200)) b!241259))

(declare-fun m!260577 () Bool)

(assert (=> b!241258 m!260577))

(assert (=> b!241110 d!59861))

(declare-fun b!241268 () Bool)

(declare-fun res!118288 () Bool)

(declare-fun e!156574 () Bool)

(assert (=> b!241268 (=> (not res!118288) (not e!156574))))

(assert (=> b!241268 (= res!118288 (and (= (size!6027 (_values!4447 thiss!1504)) (bvadd (mask!10526 thiss!1504) #b00000000000000000000000000000001)) (= (size!6028 (_keys!6566 thiss!1504)) (size!6027 (_values!4447 thiss!1504))) (bvsge (_size!1828 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1828 thiss!1504) (bvadd (mask!10526 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!241271 () Bool)

(assert (=> b!241271 (= e!156574 (and (bvsge (extraKeys!4201 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4201 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1828 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!59863 () Bool)

(declare-fun res!118289 () Bool)

(assert (=> d!59863 (=> (not res!118289) (not e!156574))))

(assert (=> d!59863 (= res!118289 (validMask!0 (mask!10526 thiss!1504)))))

(assert (=> d!59863 (= (simpleValid!244 thiss!1504) e!156574)))

(declare-fun b!241270 () Bool)

(declare-fun res!118286 () Bool)

(assert (=> b!241270 (=> (not res!118286) (not e!156574))))

(declare-fun size!6031 (LongMapFixedSize!3558) (_ BitVec 32))

(assert (=> b!241270 (= res!118286 (= (size!6031 thiss!1504) (bvadd (_size!1828 thiss!1504) (bvsdiv (bvadd (extraKeys!4201 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!241269 () Bool)

(declare-fun res!118287 () Bool)

(assert (=> b!241269 (=> (not res!118287) (not e!156574))))

(assert (=> b!241269 (= res!118287 (bvsge (size!6031 thiss!1504) (_size!1828 thiss!1504)))))

(assert (= (and d!59863 res!118289) b!241268))

(assert (= (and b!241268 res!118288) b!241269))

(assert (= (and b!241269 res!118287) b!241270))

(assert (= (and b!241270 res!118286) b!241271))

(assert (=> d!59863 m!260351))

(declare-fun m!260579 () Bool)

(assert (=> b!241270 m!260579))

(assert (=> b!241269 m!260579))

(assert (=> d!59809 d!59863))

(declare-fun d!59865 () Bool)

(declare-fun e!156576 () Bool)

(assert (=> d!59865 e!156576))

(declare-fun res!118290 () Bool)

(assert (=> d!59865 (=> res!118290 e!156576)))

(declare-fun lt!121300 () Bool)

(assert (=> d!59865 (= res!118290 (not lt!121300))))

(declare-fun lt!121298 () Bool)

(assert (=> d!59865 (= lt!121300 lt!121298)))

(declare-fun lt!121299 () Unit!7417)

(declare-fun e!156575 () Unit!7417)

(assert (=> d!59865 (= lt!121299 e!156575)))

(declare-fun c!40201 () Bool)

(assert (=> d!59865 (= c!40201 lt!121298)))

(assert (=> d!59865 (= lt!121298 (containsKey!271 (toList!1841 lt!121230) (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59865 (= (contains!1729 lt!121230 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)) lt!121300)))

(declare-fun b!241272 () Bool)

(declare-fun lt!121297 () Unit!7417)

(assert (=> b!241272 (= e!156575 lt!121297)))

(assert (=> b!241272 (= lt!121297 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1841 lt!121230) (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241272 (isDefined!220 (getValueByKey!279 (toList!1841 lt!121230) (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241273 () Bool)

(declare-fun Unit!7430 () Unit!7417)

(assert (=> b!241273 (= e!156575 Unit!7430)))

(declare-fun b!241274 () Bool)

(assert (=> b!241274 (= e!156576 (isDefined!220 (getValueByKey!279 (toList!1841 lt!121230) (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59865 c!40201) b!241272))

(assert (= (and d!59865 (not c!40201)) b!241273))

(assert (= (and d!59865 (not res!118290)) b!241274))

(assert (=> d!59865 m!260345))

(declare-fun m!260581 () Bool)

(assert (=> d!59865 m!260581))

(assert (=> b!241272 m!260345))

(declare-fun m!260583 () Bool)

(assert (=> b!241272 m!260583))

(assert (=> b!241272 m!260345))

(declare-fun m!260585 () Bool)

(assert (=> b!241272 m!260585))

(assert (=> b!241272 m!260585))

(declare-fun m!260587 () Bool)

(assert (=> b!241272 m!260587))

(assert (=> b!241274 m!260345))

(assert (=> b!241274 m!260585))

(assert (=> b!241274 m!260585))

(assert (=> b!241274 m!260587))

(assert (=> b!241163 d!59865))

(declare-fun b!241283 () Bool)

(declare-fun e!156582 () (_ BitVec 32))

(assert (=> b!241283 (= e!156582 #b00000000000000000000000000000000)))

(declare-fun d!59867 () Bool)

(declare-fun lt!121303 () (_ BitVec 32))

(assert (=> d!59867 (and (bvsge lt!121303 #b00000000000000000000000000000000) (bvsle lt!121303 (bvsub (size!6028 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59867 (= lt!121303 e!156582)))

(declare-fun c!40207 () Bool)

(assert (=> d!59867 (= c!40207 (bvsge #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(assert (=> d!59867 (and (bvsle #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6028 (_keys!6566 thiss!1504)) (size!6028 (_keys!6566 thiss!1504))))))

(assert (=> d!59867 (= (arrayCountValidKeys!0 (_keys!6566 thiss!1504) #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))) lt!121303)))

(declare-fun bm!22446 () Bool)

(declare-fun call!22449 () (_ BitVec 32))

(assert (=> bm!22446 (= call!22449 (arrayCountValidKeys!0 (_keys!6566 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun b!241284 () Bool)

(declare-fun e!156581 () (_ BitVec 32))

(assert (=> b!241284 (= e!156582 e!156581)))

(declare-fun c!40206 () Bool)

(assert (=> b!241284 (= c!40206 (validKeyInArray!0 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241285 () Bool)

(assert (=> b!241285 (= e!156581 (bvadd #b00000000000000000000000000000001 call!22449))))

(declare-fun b!241286 () Bool)

(assert (=> b!241286 (= e!156581 call!22449)))

(assert (= (and d!59867 c!40207) b!241283))

(assert (= (and d!59867 (not c!40207)) b!241284))

(assert (= (and b!241284 c!40206) b!241285))

(assert (= (and b!241284 (not c!40206)) b!241286))

(assert (= (or b!241285 b!241286) bm!22446))

(declare-fun m!260589 () Bool)

(assert (=> bm!22446 m!260589))

(assert (=> b!241284 m!260345))

(assert (=> b!241284 m!260345))

(assert (=> b!241284 m!260429))

(assert (=> b!241081 d!59867))

(declare-fun b!241297 () Bool)

(declare-fun e!156591 () Bool)

(declare-fun e!156594 () Bool)

(assert (=> b!241297 (= e!156591 e!156594)))

(declare-fun c!40210 () Bool)

(assert (=> b!241297 (= c!40210 (validKeyInArray!0 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241298 () Bool)

(declare-fun call!22452 () Bool)

(assert (=> b!241298 (= e!156594 call!22452)))

(declare-fun d!59869 () Bool)

(declare-fun res!118297 () Bool)

(declare-fun e!156592 () Bool)

(assert (=> d!59869 (=> res!118297 e!156592)))

(assert (=> d!59869 (= res!118297 (bvsge #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(assert (=> d!59869 (= (arrayNoDuplicates!0 (_keys!6566 thiss!1504) #b00000000000000000000000000000000 Nil!3619) e!156592)))

(declare-fun b!241299 () Bool)

(assert (=> b!241299 (= e!156594 call!22452)))

(declare-fun b!241300 () Bool)

(assert (=> b!241300 (= e!156592 e!156591)))

(declare-fun res!118298 () Bool)

(assert (=> b!241300 (=> (not res!118298) (not e!156591))))

(declare-fun e!156593 () Bool)

(assert (=> b!241300 (= res!118298 (not e!156593))))

(declare-fun res!118299 () Bool)

(assert (=> b!241300 (=> (not res!118299) (not e!156593))))

(assert (=> b!241300 (= res!118299 (validKeyInArray!0 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241301 () Bool)

(declare-fun contains!1732 (List!3622 (_ BitVec 64)) Bool)

(assert (=> b!241301 (= e!156593 (contains!1732 Nil!3619 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22449 () Bool)

(assert (=> bm!22449 (= call!22452 (arrayNoDuplicates!0 (_keys!6566 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40210 (Cons!3618 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000) Nil!3619) Nil!3619)))))

(assert (= (and d!59869 (not res!118297)) b!241300))

(assert (= (and b!241300 res!118299) b!241301))

(assert (= (and b!241300 res!118298) b!241297))

(assert (= (and b!241297 c!40210) b!241299))

(assert (= (and b!241297 (not c!40210)) b!241298))

(assert (= (or b!241299 b!241298) bm!22449))

(assert (=> b!241297 m!260345))

(assert (=> b!241297 m!260345))

(assert (=> b!241297 m!260429))

(assert (=> b!241300 m!260345))

(assert (=> b!241300 m!260345))

(assert (=> b!241300 m!260429))

(assert (=> b!241301 m!260345))

(assert (=> b!241301 m!260345))

(declare-fun m!260591 () Bool)

(assert (=> b!241301 m!260591))

(assert (=> bm!22449 m!260345))

(declare-fun m!260593 () Bool)

(assert (=> bm!22449 m!260593))

(assert (=> b!241083 d!59869))

(declare-fun d!59871 () Bool)

(declare-fun res!118300 () Bool)

(declare-fun e!156595 () Bool)

(assert (=> d!59871 (=> res!118300 e!156595)))

(assert (=> d!59871 (= res!118300 (= (select (arr!5687 (_keys!6566 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!59871 (= (arrayContainsKey!0 (_keys!6566 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!156595)))

(declare-fun b!241302 () Bool)

(declare-fun e!156596 () Bool)

(assert (=> b!241302 (= e!156595 e!156596)))

(declare-fun res!118301 () Bool)

(assert (=> b!241302 (=> (not res!118301) (not e!156596))))

(assert (=> b!241302 (= res!118301 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun b!241303 () Bool)

(assert (=> b!241303 (= e!156596 (arrayContainsKey!0 (_keys!6566 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!59871 (not res!118300)) b!241302))

(assert (= (and b!241302 res!118301) b!241303))

(declare-fun m!260595 () Bool)

(assert (=> d!59871 m!260595))

(declare-fun m!260597 () Bool)

(assert (=> b!241303 m!260597))

(assert (=> b!241044 d!59871))

(declare-fun d!59873 () Bool)

(declare-fun res!118307 () Bool)

(declare-fun e!156604 () Bool)

(assert (=> d!59873 (=> res!118307 e!156604)))

(assert (=> d!59873 (= res!118307 (bvsge #b00000000000000000000000000000000 (size!6028 (_keys!6566 thiss!1504))))))

(assert (=> d!59873 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)) e!156604)))

(declare-fun b!241312 () Bool)

(declare-fun e!156605 () Bool)

(assert (=> b!241312 (= e!156604 e!156605)))

(declare-fun c!40213 () Bool)

(assert (=> b!241312 (= c!40213 (validKeyInArray!0 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241313 () Bool)

(declare-fun e!156603 () Bool)

(declare-fun call!22455 () Bool)

(assert (=> b!241313 (= e!156603 call!22455)))

(declare-fun b!241314 () Bool)

(assert (=> b!241314 (= e!156605 e!156603)))

(declare-fun lt!121311 () (_ BitVec 64))

(assert (=> b!241314 (= lt!121311 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121312 () Unit!7417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11971 (_ BitVec 64) (_ BitVec 32)) Unit!7417)

(assert (=> b!241314 (= lt!121312 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6566 thiss!1504) lt!121311 #b00000000000000000000000000000000))))

(assert (=> b!241314 (arrayContainsKey!0 (_keys!6566 thiss!1504) lt!121311 #b00000000000000000000000000000000)))

(declare-fun lt!121310 () Unit!7417)

(assert (=> b!241314 (= lt!121310 lt!121312)))

(declare-fun res!118306 () Bool)

(assert (=> b!241314 (= res!118306 (= (seekEntryOrOpen!0 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000) (_keys!6566 thiss!1504) (mask!10526 thiss!1504)) (Found!1053 #b00000000000000000000000000000000)))))

(assert (=> b!241314 (=> (not res!118306) (not e!156603))))

(declare-fun bm!22452 () Bool)

(assert (=> bm!22452 (= call!22455 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(declare-fun b!241315 () Bool)

(assert (=> b!241315 (= e!156605 call!22455)))

(assert (= (and d!59873 (not res!118307)) b!241312))

(assert (= (and b!241312 c!40213) b!241314))

(assert (= (and b!241312 (not c!40213)) b!241315))

(assert (= (and b!241314 res!118306) b!241313))

(assert (= (or b!241313 b!241315) bm!22452))

(assert (=> b!241312 m!260345))

(assert (=> b!241312 m!260345))

(assert (=> b!241312 m!260429))

(assert (=> b!241314 m!260345))

(declare-fun m!260599 () Bool)

(assert (=> b!241314 m!260599))

(declare-fun m!260601 () Bool)

(assert (=> b!241314 m!260601))

(assert (=> b!241314 m!260345))

(declare-fun m!260603 () Bool)

(assert (=> b!241314 m!260603))

(declare-fun m!260605 () Bool)

(assert (=> bm!22452 m!260605))

(assert (=> b!241082 d!59873))

(declare-fun b!241328 () Bool)

(declare-fun e!156612 () SeekEntryResult!1053)

(assert (=> b!241328 (= e!156612 Undefined!1053)))

(declare-fun d!59875 () Bool)

(declare-fun lt!121318 () SeekEntryResult!1053)

(assert (=> d!59875 (and (or ((_ is Undefined!1053) lt!121318) (not ((_ is Found!1053) lt!121318)) (and (bvsge (index!6383 lt!121318) #b00000000000000000000000000000000) (bvslt (index!6383 lt!121318) (size!6028 (_keys!6566 thiss!1504))))) (or ((_ is Undefined!1053) lt!121318) ((_ is Found!1053) lt!121318) (not ((_ is MissingVacant!1053) lt!121318)) (not (= (index!6385 lt!121318) (index!6384 lt!121157))) (and (bvsge (index!6385 lt!121318) #b00000000000000000000000000000000) (bvslt (index!6385 lt!121318) (size!6028 (_keys!6566 thiss!1504))))) (or ((_ is Undefined!1053) lt!121318) (ite ((_ is Found!1053) lt!121318) (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6383 lt!121318)) key!932) (and ((_ is MissingVacant!1053) lt!121318) (= (index!6385 lt!121318) (index!6384 lt!121157)) (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6385 lt!121318)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59875 (= lt!121318 e!156612)))

(declare-fun c!40221 () Bool)

(assert (=> d!59875 (= c!40221 (bvsge (x!24189 lt!121157) #b01111111111111111111111111111110))))

(declare-fun lt!121317 () (_ BitVec 64))

(assert (=> d!59875 (= lt!121317 (select (arr!5687 (_keys!6566 thiss!1504)) (index!6384 lt!121157)))))

(assert (=> d!59875 (validMask!0 (mask!10526 thiss!1504))))

(assert (=> d!59875 (= (seekKeyOrZeroReturnVacant!0 (x!24189 lt!121157) (index!6384 lt!121157) (index!6384 lt!121157) key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)) lt!121318)))

(declare-fun e!156614 () SeekEntryResult!1053)

(declare-fun b!241329 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!241329 (= e!156614 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24189 lt!121157) #b00000000000000000000000000000001) (nextIndex!0 (index!6384 lt!121157) (x!24189 lt!121157) (mask!10526 thiss!1504)) (index!6384 lt!121157) key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(declare-fun b!241330 () Bool)

(declare-fun c!40222 () Bool)

(assert (=> b!241330 (= c!40222 (= lt!121317 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156613 () SeekEntryResult!1053)

(assert (=> b!241330 (= e!156613 e!156614)))

(declare-fun b!241331 () Bool)

(assert (=> b!241331 (= e!156612 e!156613)))

(declare-fun c!40220 () Bool)

(assert (=> b!241331 (= c!40220 (= lt!121317 key!932))))

(declare-fun b!241332 () Bool)

(assert (=> b!241332 (= e!156613 (Found!1053 (index!6384 lt!121157)))))

(declare-fun b!241333 () Bool)

(assert (=> b!241333 (= e!156614 (MissingVacant!1053 (index!6384 lt!121157)))))

(assert (= (and d!59875 c!40221) b!241328))

(assert (= (and d!59875 (not c!40221)) b!241331))

(assert (= (and b!241331 c!40220) b!241332))

(assert (= (and b!241331 (not c!40220)) b!241330))

(assert (= (and b!241330 c!40222) b!241333))

(assert (= (and b!241330 (not c!40222)) b!241329))

(declare-fun m!260607 () Bool)

(assert (=> d!59875 m!260607))

(declare-fun m!260609 () Bool)

(assert (=> d!59875 m!260609))

(assert (=> d!59875 m!260385))

(assert (=> d!59875 m!260351))

(declare-fun m!260611 () Bool)

(assert (=> b!241329 m!260611))

(assert (=> b!241329 m!260611))

(declare-fun m!260613 () Bool)

(assert (=> b!241329 m!260613))

(assert (=> b!241101 d!59875))

(declare-fun d!59877 () Bool)

(declare-fun e!156616 () Bool)

(assert (=> d!59877 e!156616))

(declare-fun res!118308 () Bool)

(assert (=> d!59877 (=> res!118308 e!156616)))

(declare-fun lt!121322 () Bool)

(assert (=> d!59877 (= res!118308 (not lt!121322))))

(declare-fun lt!121320 () Bool)

(assert (=> d!59877 (= lt!121322 lt!121320)))

(declare-fun lt!121321 () Unit!7417)

(declare-fun e!156615 () Unit!7417)

(assert (=> d!59877 (= lt!121321 e!156615)))

(declare-fun c!40223 () Bool)

(assert (=> d!59877 (= c!40223 lt!121320)))

(assert (=> d!59877 (= lt!121320 (containsKey!271 (toList!1841 lt!121230) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59877 (= (contains!1729 lt!121230 #b1000000000000000000000000000000000000000000000000000000000000000) lt!121322)))

(declare-fun b!241334 () Bool)

(declare-fun lt!121319 () Unit!7417)

(assert (=> b!241334 (= e!156615 lt!121319)))

(assert (=> b!241334 (= lt!121319 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1841 lt!121230) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241334 (isDefined!220 (getValueByKey!279 (toList!1841 lt!121230) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241335 () Bool)

(declare-fun Unit!7431 () Unit!7417)

(assert (=> b!241335 (= e!156615 Unit!7431)))

(declare-fun b!241336 () Bool)

(assert (=> b!241336 (= e!156616 (isDefined!220 (getValueByKey!279 (toList!1841 lt!121230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59877 c!40223) b!241334))

(assert (= (and d!59877 (not c!40223)) b!241335))

(assert (= (and d!59877 (not res!118308)) b!241336))

(declare-fun m!260615 () Bool)

(assert (=> d!59877 m!260615))

(declare-fun m!260617 () Bool)

(assert (=> b!241334 m!260617))

(declare-fun m!260619 () Bool)

(assert (=> b!241334 m!260619))

(assert (=> b!241334 m!260619))

(declare-fun m!260621 () Bool)

(assert (=> b!241334 m!260621))

(assert (=> b!241336 m!260619))

(assert (=> b!241336 m!260619))

(assert (=> b!241336 m!260621))

(assert (=> bm!22436 d!59877))

(declare-fun d!59879 () Bool)

(declare-fun res!118313 () Bool)

(declare-fun e!156621 () Bool)

(assert (=> d!59879 (=> res!118313 e!156621)))

(assert (=> d!59879 (= res!118313 (and ((_ is Cons!3616) (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))) (= (_1!2380 (h!4272 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))))) key!932)))))

(assert (=> d!59879 (= (containsKey!271 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932) e!156621)))

(declare-fun b!241341 () Bool)

(declare-fun e!156622 () Bool)

(assert (=> b!241341 (= e!156621 e!156622)))

(declare-fun res!118314 () Bool)

(assert (=> b!241341 (=> (not res!118314) (not e!156622))))

(assert (=> b!241341 (= res!118314 (and (or (not ((_ is Cons!3616) (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))))) (bvsle (_1!2380 (h!4272 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))))) key!932)) ((_ is Cons!3616) (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))) (bvslt (_1!2380 (h!4272 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))))) key!932)))))

(declare-fun b!241342 () Bool)

(assert (=> b!241342 (= e!156622 (containsKey!271 (t!8615 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))) key!932))))

(assert (= (and d!59879 (not res!118313)) b!241341))

(assert (= (and b!241341 res!118314) b!241342))

(declare-fun m!260623 () Bool)

(assert (=> b!241342 m!260623))

(assert (=> d!59815 d!59879))

(assert (=> bm!22419 d!59797))

(declare-fun d!59881 () Bool)

(assert (=> d!59881 (= (inRange!0 (index!6383 lt!121139) (mask!10526 thiss!1504)) (and (bvsge (index!6383 lt!121139) #b00000000000000000000000000000000) (bvslt (index!6383 lt!121139) (bvadd (mask!10526 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!241049 d!59881))

(declare-fun d!59883 () Bool)

(assert (=> d!59883 (= (inRange!0 (ite c!40150 (index!6382 lt!121149) (index!6385 lt!121149)) (mask!10526 thiss!1504)) (and (bvsge (ite c!40150 (index!6382 lt!121149) (index!6385 lt!121149)) #b00000000000000000000000000000000) (bvslt (ite c!40150 (index!6382 lt!121149) (index!6385 lt!121149)) (bvadd (mask!10526 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22418 d!59883))

(assert (=> d!59817 d!59823))

(declare-fun d!59885 () Bool)

(declare-fun e!156623 () Bool)

(assert (=> d!59885 e!156623))

(declare-fun res!118315 () Bool)

(assert (=> d!59885 (=> (not res!118315) (not e!156623))))

(declare-fun lt!121323 () ListLongMap!3651)

(assert (=> d!59885 (= res!118315 (contains!1729 lt!121323 (_1!2380 (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))))))))

(declare-fun lt!121324 () List!3620)

(assert (=> d!59885 (= lt!121323 (ListLongMap!3652 lt!121324))))

(declare-fun lt!121325 () Unit!7417)

(declare-fun lt!121326 () Unit!7417)

(assert (=> d!59885 (= lt!121325 lt!121326)))

(assert (=> d!59885 (= (getValueByKey!279 lt!121324 (_1!2380 (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))))) (Some!284 (_2!2380 (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))))))))

(assert (=> d!59885 (= lt!121326 (lemmaContainsTupThenGetReturnValue!155 lt!121324 (_1!2380 (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))) (_2!2380 (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))))))))

(assert (=> d!59885 (= lt!121324 (insertStrictlySorted!158 (toList!1841 (ite c!40181 call!22439 (ite c!40178 call!22442 call!22438))) (_1!2380 (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))) (_2!2380 (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))))))))

(assert (=> d!59885 (= (+!648 (ite c!40181 call!22439 (ite c!40178 call!22442 call!22438)) (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))) lt!121323)))

(declare-fun b!241343 () Bool)

(declare-fun res!118316 () Bool)

(assert (=> b!241343 (=> (not res!118316) (not e!156623))))

(assert (=> b!241343 (= res!118316 (= (getValueByKey!279 (toList!1841 lt!121323) (_1!2380 (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))))) (Some!284 (_2!2380 (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))))))))

(declare-fun b!241344 () Bool)

(assert (=> b!241344 (= e!156623 (contains!1731 (toList!1841 lt!121323) (ite (or c!40181 c!40178) (tuple2!4739 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4305 thiss!1504)) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))))))

(assert (= (and d!59885 res!118315) b!241343))

(assert (= (and b!241343 res!118316) b!241344))

(declare-fun m!260625 () Bool)

(assert (=> d!59885 m!260625))

(declare-fun m!260627 () Bool)

(assert (=> d!59885 m!260627))

(declare-fun m!260629 () Bool)

(assert (=> d!59885 m!260629))

(declare-fun m!260631 () Bool)

(assert (=> d!59885 m!260631))

(declare-fun m!260633 () Bool)

(assert (=> b!241343 m!260633))

(declare-fun m!260635 () Bool)

(assert (=> b!241344 m!260635))

(assert (=> bm!22438 d!59885))

(declare-fun d!59887 () Bool)

(assert (=> d!59887 (= (apply!221 lt!121230 (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000)) (get!2919 (getValueByKey!279 (toList!1841 lt!121230) (select (arr!5687 (_keys!6566 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8843 () Bool)

(assert (= bs!8843 d!59887))

(assert (=> bs!8843 m!260345))

(assert (=> bs!8843 m!260585))

(assert (=> bs!8843 m!260585))

(declare-fun m!260637 () Bool)

(assert (=> bs!8843 m!260637))

(assert (=> b!241154 d!59887))

(declare-fun d!59889 () Bool)

(declare-fun c!40226 () Bool)

(assert (=> d!59889 (= c!40226 ((_ is ValueCellFull!2829) (select (arr!5686 (_values!4447 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!156626 () V!8107)

(assert (=> d!59889 (= (get!2918 (select (arr!5686 (_values!4447 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4464 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!156626)))

(declare-fun b!241349 () Bool)

(declare-fun get!2920 (ValueCell!2829 V!8107) V!8107)

(assert (=> b!241349 (= e!156626 (get!2920 (select (arr!5686 (_values!4447 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4464 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!241350 () Bool)

(declare-fun get!2921 (ValueCell!2829 V!8107) V!8107)

(assert (=> b!241350 (= e!156626 (get!2921 (select (arr!5686 (_values!4447 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!564 (defaultEntry!4464 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59889 c!40226) b!241349))

(assert (= (and d!59889 (not c!40226)) b!241350))

(assert (=> b!241349 m!260443))

(assert (=> b!241349 m!260445))

(declare-fun m!260639 () Bool)

(assert (=> b!241349 m!260639))

(assert (=> b!241350 m!260443))

(assert (=> b!241350 m!260445))

(declare-fun m!260641 () Bool)

(assert (=> b!241350 m!260641))

(assert (=> b!241154 d!59889))

(assert (=> bm!22439 d!59845))

(assert (=> b!241171 d!59857))

(declare-fun d!59891 () Bool)

(assert (=> d!59891 (= (apply!221 lt!121230 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2919 (getValueByKey!279 (toList!1841 lt!121230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8844 () Bool)

(assert (= bs!8844 d!59891))

(assert (=> bs!8844 m!260619))

(assert (=> bs!8844 m!260619))

(declare-fun m!260643 () Bool)

(assert (=> bs!8844 m!260643))

(assert (=> b!241155 d!59891))

(declare-fun d!59893 () Bool)

(declare-fun e!156628 () Bool)

(assert (=> d!59893 e!156628))

(declare-fun res!118317 () Bool)

(assert (=> d!59893 (=> res!118317 e!156628)))

(declare-fun lt!121330 () Bool)

(assert (=> d!59893 (= res!118317 (not lt!121330))))

(declare-fun lt!121328 () Bool)

(assert (=> d!59893 (= lt!121330 lt!121328)))

(declare-fun lt!121329 () Unit!7417)

(declare-fun e!156627 () Unit!7417)

(assert (=> d!59893 (= lt!121329 e!156627)))

(declare-fun c!40227 () Bool)

(assert (=> d!59893 (= c!40227 lt!121328)))

(assert (=> d!59893 (= lt!121328 (containsKey!271 (toList!1841 lt!121230) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59893 (= (contains!1729 lt!121230 #b0000000000000000000000000000000000000000000000000000000000000000) lt!121330)))

(declare-fun b!241351 () Bool)

(declare-fun lt!121327 () Unit!7417)

(assert (=> b!241351 (= e!156627 lt!121327)))

(assert (=> b!241351 (= lt!121327 (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1841 lt!121230) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241351 (isDefined!220 (getValueByKey!279 (toList!1841 lt!121230) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241352 () Bool)

(declare-fun Unit!7432 () Unit!7417)

(assert (=> b!241352 (= e!156627 Unit!7432)))

(declare-fun b!241353 () Bool)

(assert (=> b!241353 (= e!156628 (isDefined!220 (getValueByKey!279 (toList!1841 lt!121230) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59893 c!40227) b!241351))

(assert (= (and d!59893 (not c!40227)) b!241352))

(assert (= (and d!59893 (not res!118317)) b!241353))

(declare-fun m!260645 () Bool)

(assert (=> d!59893 m!260645))

(declare-fun m!260647 () Bool)

(assert (=> b!241351 m!260647))

(declare-fun m!260649 () Bool)

(assert (=> b!241351 m!260649))

(assert (=> b!241351 m!260649))

(declare-fun m!260651 () Bool)

(assert (=> b!241351 m!260651))

(assert (=> b!241353 m!260649))

(assert (=> b!241353 m!260649))

(assert (=> b!241353 m!260651))

(assert (=> bm!22434 d!59893))

(declare-fun b!241372 () Bool)

(declare-fun e!156642 () SeekEntryResult!1053)

(declare-fun e!156640 () SeekEntryResult!1053)

(assert (=> b!241372 (= e!156642 e!156640)))

(declare-fun c!40234 () Bool)

(declare-fun lt!121336 () (_ BitVec 64))

(assert (=> b!241372 (= c!40234 (or (= lt!121336 key!932) (= (bvadd lt!121336 lt!121336) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!241373 () Bool)

(assert (=> b!241373 (= e!156640 (Intermediate!1053 false (toIndex!0 key!932 (mask!10526 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!241374 () Bool)

(declare-fun lt!121335 () SeekEntryResult!1053)

(assert (=> b!241374 (and (bvsge (index!6384 lt!121335) #b00000000000000000000000000000000) (bvslt (index!6384 lt!121335) (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun res!118324 () Bool)

(assert (=> b!241374 (= res!118324 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6384 lt!121335)) key!932))))

(declare-fun e!156641 () Bool)

(assert (=> b!241374 (=> res!118324 e!156641)))

(declare-fun e!156643 () Bool)

(assert (=> b!241374 (= e!156643 e!156641)))

(declare-fun b!241375 () Bool)

(declare-fun e!156639 () Bool)

(assert (=> b!241375 (= e!156639 (bvsge (x!24189 lt!121335) #b01111111111111111111111111111110))))

(declare-fun b!241376 () Bool)

(assert (=> b!241376 (= e!156639 e!156643)))

(declare-fun res!118326 () Bool)

(assert (=> b!241376 (= res!118326 (and ((_ is Intermediate!1053) lt!121335) (not (undefined!1865 lt!121335)) (bvslt (x!24189 lt!121335) #b01111111111111111111111111111110) (bvsge (x!24189 lt!121335) #b00000000000000000000000000000000) (bvsge (x!24189 lt!121335) #b00000000000000000000000000000000)))))

(assert (=> b!241376 (=> (not res!118326) (not e!156643))))

(declare-fun d!59895 () Bool)

(assert (=> d!59895 e!156639))

(declare-fun c!40235 () Bool)

(assert (=> d!59895 (= c!40235 (and ((_ is Intermediate!1053) lt!121335) (undefined!1865 lt!121335)))))

(assert (=> d!59895 (= lt!121335 e!156642)))

(declare-fun c!40236 () Bool)

(assert (=> d!59895 (= c!40236 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!59895 (= lt!121336 (select (arr!5687 (_keys!6566 thiss!1504)) (toIndex!0 key!932 (mask!10526 thiss!1504))))))

(assert (=> d!59895 (validMask!0 (mask!10526 thiss!1504))))

(assert (=> d!59895 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10526 thiss!1504)) key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)) lt!121335)))

(declare-fun b!241377 () Bool)

(assert (=> b!241377 (= e!156642 (Intermediate!1053 true (toIndex!0 key!932 (mask!10526 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!241378 () Bool)

(assert (=> b!241378 (and (bvsge (index!6384 lt!121335) #b00000000000000000000000000000000) (bvslt (index!6384 lt!121335) (size!6028 (_keys!6566 thiss!1504))))))

(assert (=> b!241378 (= e!156641 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6384 lt!121335)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241379 () Bool)

(assert (=> b!241379 (and (bvsge (index!6384 lt!121335) #b00000000000000000000000000000000) (bvslt (index!6384 lt!121335) (size!6028 (_keys!6566 thiss!1504))))))

(declare-fun res!118325 () Bool)

(assert (=> b!241379 (= res!118325 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6384 lt!121335)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241379 (=> res!118325 e!156641)))

(declare-fun b!241380 () Bool)

(assert (=> b!241380 (= e!156640 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10526 thiss!1504)) #b00000000000000000000000000000000 (mask!10526 thiss!1504)) key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(assert (= (and d!59895 c!40236) b!241377))

(assert (= (and d!59895 (not c!40236)) b!241372))

(assert (= (and b!241372 c!40234) b!241373))

(assert (= (and b!241372 (not c!40234)) b!241380))

(assert (= (and d!59895 c!40235) b!241375))

(assert (= (and d!59895 (not c!40235)) b!241376))

(assert (= (and b!241376 res!118326) b!241374))

(assert (= (and b!241374 (not res!118324)) b!241379))

(assert (= (and b!241379 (not res!118325)) b!241378))

(declare-fun m!260653 () Bool)

(assert (=> b!241374 m!260653))

(assert (=> b!241380 m!260375))

(declare-fun m!260655 () Bool)

(assert (=> b!241380 m!260655))

(assert (=> b!241380 m!260655))

(declare-fun m!260657 () Bool)

(assert (=> b!241380 m!260657))

(assert (=> d!59895 m!260375))

(declare-fun m!260659 () Bool)

(assert (=> d!59895 m!260659))

(assert (=> d!59895 m!260351))

(assert (=> b!241379 m!260653))

(assert (=> b!241378 m!260653))

(assert (=> d!59811 d!59895))

(declare-fun d!59897 () Bool)

(declare-fun lt!121342 () (_ BitVec 32))

(declare-fun lt!121341 () (_ BitVec 32))

(assert (=> d!59897 (= lt!121342 (bvmul (bvxor lt!121341 (bvlshr lt!121341 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59897 (= lt!121341 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59897 (and (bvsge (mask!10526 thiss!1504) #b00000000000000000000000000000000) (let ((res!118327 (let ((h!4275 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24208 (bvmul (bvxor h!4275 (bvlshr h!4275 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24208 (bvlshr x!24208 #b00000000000000000000000000001101)) (mask!10526 thiss!1504)))))) (and (bvslt res!118327 (bvadd (mask!10526 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!118327 #b00000000000000000000000000000000))))))

(assert (=> d!59897 (= (toIndex!0 key!932 (mask!10526 thiss!1504)) (bvand (bvxor lt!121342 (bvlshr lt!121342 #b00000000000000000000000000001101)) (mask!10526 thiss!1504)))))

(assert (=> d!59811 d!59897))

(assert (=> d!59811 d!59823))

(declare-fun d!59899 () Bool)

(assert (=> d!59899 (= (apply!221 lt!121230 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2919 (getValueByKey!279 (toList!1841 lt!121230) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8845 () Bool)

(assert (= bs!8845 d!59899))

(assert (=> bs!8845 m!260649))

(assert (=> bs!8845 m!260649))

(declare-fun m!260661 () Bool)

(assert (=> bs!8845 m!260661))

(assert (=> b!241157 d!59899))

(declare-fun d!59901 () Bool)

(assert (=> d!59901 (isDefined!220 (getValueByKey!279 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932))))

(declare-fun lt!121345 () Unit!7417)

(declare-fun choose!1121 (List!3620 (_ BitVec 64)) Unit!7417)

(assert (=> d!59901 (= lt!121345 (choose!1121 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932))))

(declare-fun e!156646 () Bool)

(assert (=> d!59901 e!156646))

(declare-fun res!118330 () Bool)

(assert (=> d!59901 (=> (not res!118330) (not e!156646))))

(declare-fun isStrictlySorted!367 (List!3620) Bool)

(assert (=> d!59901 (= res!118330 (isStrictlySorted!367 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)))))))

(assert (=> d!59901 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!219 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932) lt!121345)))

(declare-fun b!241383 () Bool)

(assert (=> b!241383 (= e!156646 (containsKey!271 (toList!1841 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504))) key!932))))

(assert (= (and d!59901 res!118330) b!241383))

(assert (=> d!59901 m!260393))

(assert (=> d!59901 m!260393))

(assert (=> d!59901 m!260395))

(declare-fun m!260663 () Bool)

(assert (=> d!59901 m!260663))

(declare-fun m!260665 () Bool)

(assert (=> d!59901 m!260665))

(assert (=> b!241383 m!260389))

(assert (=> b!241108 d!59901))

(assert (=> b!241108 d!59859))

(assert (=> b!241108 d!59861))

(assert (=> d!59805 d!59815))

(assert (=> d!59805 d!59817))

(declare-fun d!59903 () Bool)

(assert (=> d!59903 (contains!1729 (getCurrentListMap!1369 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)) key!932)))

(assert (=> d!59903 true))

(declare-fun _$17!65 () Unit!7417)

(assert (=> d!59903 (= (choose!1117 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4464 thiss!1504)) _$17!65)))

(declare-fun bs!8846 () Bool)

(assert (= bs!8846 d!59903))

(assert (=> bs!8846 m!260295))

(assert (=> bs!8846 m!260295))

(assert (=> bs!8846 m!260297))

(assert (=> d!59805 d!59903))

(assert (=> d!59805 d!59823))

(assert (=> d!59807 d!59811))

(declare-fun b!241400 () Bool)

(declare-fun e!156657 () Bool)

(declare-fun lt!121348 () SeekEntryResult!1053)

(assert (=> b!241400 (= e!156657 ((_ is Undefined!1053) lt!121348))))

(declare-fun b!241401 () Bool)

(declare-fun res!118342 () Bool)

(declare-fun e!156655 () Bool)

(assert (=> b!241401 (=> (not res!118342) (not e!156655))))

(declare-fun call!22460 () Bool)

(assert (=> b!241401 (= res!118342 call!22460)))

(assert (=> b!241401 (= e!156657 e!156655)))

(declare-fun b!241402 () Bool)

(declare-fun call!22461 () Bool)

(assert (=> b!241402 (= e!156655 (not call!22461))))

(declare-fun b!241403 () Bool)

(declare-fun res!118339 () Bool)

(assert (=> b!241403 (= res!118339 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6382 lt!121348)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156658 () Bool)

(assert (=> b!241403 (=> (not res!118339) (not e!156658))))

(declare-fun bm!22457 () Bool)

(assert (=> bm!22457 (= call!22461 (arrayContainsKey!0 (_keys!6566 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22458 () Bool)

(declare-fun c!40241 () Bool)

(assert (=> bm!22458 (= call!22460 (inRange!0 (ite c!40241 (index!6382 lt!121348) (index!6385 lt!121348)) (mask!10526 thiss!1504)))))

(declare-fun b!241405 () Bool)

(declare-fun e!156656 () Bool)

(assert (=> b!241405 (= e!156656 e!156658)))

(declare-fun res!118341 () Bool)

(assert (=> b!241405 (= res!118341 call!22460)))

(assert (=> b!241405 (=> (not res!118341) (not e!156658))))

(declare-fun d!59905 () Bool)

(assert (=> d!59905 e!156656))

(assert (=> d!59905 (= c!40241 ((_ is MissingZero!1053) lt!121348))))

(assert (=> d!59905 (= lt!121348 (seekEntryOrOpen!0 key!932 (_keys!6566 thiss!1504) (mask!10526 thiss!1504)))))

(assert (=> d!59905 true))

(declare-fun _$34!1101 () Unit!7417)

(assert (=> d!59905 (= (choose!1118 (_keys!6566 thiss!1504) (_values!4447 thiss!1504) (mask!10526 thiss!1504) (extraKeys!4201 thiss!1504) (zeroValue!4305 thiss!1504) (minValue!4305 thiss!1504) key!932 (defaultEntry!4464 thiss!1504)) _$34!1101)))

(declare-fun b!241404 () Bool)

(assert (=> b!241404 (= e!156656 e!156657)))

(declare-fun c!40242 () Bool)

(assert (=> b!241404 (= c!40242 ((_ is MissingVacant!1053) lt!121348))))

(declare-fun b!241406 () Bool)

(declare-fun res!118340 () Bool)

(assert (=> b!241406 (=> (not res!118340) (not e!156655))))

(assert (=> b!241406 (= res!118340 (= (select (arr!5687 (_keys!6566 thiss!1504)) (index!6385 lt!121348)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241407 () Bool)

(assert (=> b!241407 (= e!156658 (not call!22461))))

(assert (= (and d!59905 c!40241) b!241405))

(assert (= (and d!59905 (not c!40241)) b!241404))

(assert (= (and b!241405 res!118341) b!241403))

(assert (= (and b!241403 res!118339) b!241407))

(assert (= (and b!241404 c!40242) b!241401))

(assert (= (and b!241404 (not c!40242)) b!241400))

(assert (= (and b!241401 res!118342) b!241406))

(assert (= (and b!241406 res!118340) b!241402))

(assert (= (or b!241405 b!241401) bm!22458))

(assert (= (or b!241407 b!241402) bm!22457))

(declare-fun m!260667 () Bool)

(assert (=> b!241403 m!260667))

(declare-fun m!260669 () Bool)

(assert (=> b!241406 m!260669))

(assert (=> d!59905 m!260313))

(assert (=> bm!22457 m!260307))

(declare-fun m!260671 () Bool)

(assert (=> bm!22458 m!260671))

(assert (=> d!59807 d!59905))

(assert (=> d!59807 d!59823))

(declare-fun d!59907 () Bool)

(declare-fun e!156659 () Bool)

(assert (=> d!59907 e!156659))

(declare-fun res!118343 () Bool)

(assert (=> d!59907 (=> (not res!118343) (not e!156659))))

(declare-fun lt!121349 () ListLongMap!3651)

(assert (=> d!59907 (= res!118343 (contains!1729 lt!121349 (_1!2380 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))))))

(declare-fun lt!121350 () List!3620)

(assert (=> d!59907 (= lt!121349 (ListLongMap!3652 lt!121350))))

(declare-fun lt!121351 () Unit!7417)

(declare-fun lt!121352 () Unit!7417)

(assert (=> d!59907 (= lt!121351 lt!121352)))

(assert (=> d!59907 (= (getValueByKey!279 lt!121350 (_1!2380 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))) (Some!284 (_2!2380 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))))))

(assert (=> d!59907 (= lt!121352 (lemmaContainsTupThenGetReturnValue!155 lt!121350 (_1!2380 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))) (_2!2380 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))))))

(assert (=> d!59907 (= lt!121350 (insertStrictlySorted!158 (toList!1841 call!22440) (_1!2380 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))) (_2!2380 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))))))

(assert (=> d!59907 (= (+!648 call!22440 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))) lt!121349)))

(declare-fun b!241408 () Bool)

(declare-fun res!118344 () Bool)

(assert (=> b!241408 (=> (not res!118344) (not e!156659))))

(assert (=> b!241408 (= res!118344 (= (getValueByKey!279 (toList!1841 lt!121349) (_1!2380 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504)))) (Some!284 (_2!2380 (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))))))))

(declare-fun b!241409 () Bool)

(assert (=> b!241409 (= e!156659 (contains!1731 (toList!1841 lt!121349) (tuple2!4739 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4305 thiss!1504))))))

(assert (= (and d!59907 res!118343) b!241408))

(assert (= (and b!241408 res!118344) b!241409))

(declare-fun m!260673 () Bool)

(assert (=> d!59907 m!260673))

(declare-fun m!260675 () Bool)

(assert (=> d!59907 m!260675))

(declare-fun m!260677 () Bool)

(assert (=> d!59907 m!260677))

(declare-fun m!260679 () Bool)

(assert (=> d!59907 m!260679))

(declare-fun m!260681 () Bool)

(assert (=> b!241408 m!260681))

(declare-fun m!260683 () Bool)

(assert (=> b!241409 m!260683))

(assert (=> b!241156 d!59907))

(declare-fun mapNonEmpty!10756 () Bool)

(declare-fun mapRes!10756 () Bool)

(declare-fun tp!22663 () Bool)

(declare-fun e!156661 () Bool)

(assert (=> mapNonEmpty!10756 (= mapRes!10756 (and tp!22663 e!156661))))

(declare-fun mapValue!10756 () ValueCell!2829)

(declare-fun mapRest!10756 () (Array (_ BitVec 32) ValueCell!2829))

(declare-fun mapKey!10756 () (_ BitVec 32))

(assert (=> mapNonEmpty!10756 (= mapRest!10755 (store mapRest!10756 mapKey!10756 mapValue!10756))))

(declare-fun mapIsEmpty!10756 () Bool)

(assert (=> mapIsEmpty!10756 mapRes!10756))

(declare-fun b!241410 () Bool)

(assert (=> b!241410 (= e!156661 tp_is_empty!6345)))

(declare-fun condMapEmpty!10756 () Bool)

(declare-fun mapDefault!10756 () ValueCell!2829)

(assert (=> mapNonEmpty!10755 (= condMapEmpty!10756 (= mapRest!10755 ((as const (Array (_ BitVec 32) ValueCell!2829)) mapDefault!10756)))))

(declare-fun e!156660 () Bool)

(assert (=> mapNonEmpty!10755 (= tp!22662 (and e!156660 mapRes!10756))))

(declare-fun b!241411 () Bool)

(assert (=> b!241411 (= e!156660 tp_is_empty!6345)))

(assert (= (and mapNonEmpty!10755 condMapEmpty!10756) mapIsEmpty!10756))

(assert (= (and mapNonEmpty!10755 (not condMapEmpty!10756)) mapNonEmpty!10756))

(assert (= (and mapNonEmpty!10756 ((_ is ValueCellFull!2829) mapValue!10756)) b!241410))

(assert (= (and mapNonEmpty!10755 ((_ is ValueCellFull!2829) mapDefault!10756)) b!241411))

(declare-fun m!260685 () Bool)

(assert (=> mapNonEmpty!10756 m!260685))

(declare-fun b_lambda!7987 () Bool)

(assert (= b_lambda!7985 (or (and b!240968 b_free!6483) b_lambda!7987)))

(declare-fun b_lambda!7989 () Bool)

(assert (= b_lambda!7983 (or (and b!240968 b_free!6483) b_lambda!7989)))

(check-sat (not b_next!6483) (not b!241243) (not b!241349) (not d!59827) (not b!241237) (not b!241270) (not b_lambda!7981) (not b!241194) (not b!241350) (not b!241314) (not d!59899) (not d!59893) (not b!241195) (not b!241284) (not d!59835) (not bm!22457) (not bm!22443) (not b!241242) (not b!241409) (not d!59885) (not b!241297) (not b!241234) (not b!241274) (not d!59859) (not d!59831) (not d!59887) (not b!241236) (not b!241245) (not b_lambda!7987) (not b!241269) (not b!241334) (not d!59843) (not b!241188) (not bm!22449) (not d!59841) (not b!241258) (not b!241241) (not b!241383) (not b!241343) (not d!59853) (not d!59845) (not b!241207) b_and!13457 (not d!59895) (not b!241312) (not d!59825) (not b!241329) (not bm!22458) (not d!59865) (not b_lambda!7989) (not d!59863) (not d!59855) (not b!241351) (not b!241235) (not b!241272) (not bm!22446) (not d!59875) (not b!241205) tp_is_empty!6345 (not d!59829) (not b!241200) (not b!241344) (not bm!22452) (not d!59839) (not b!241303) (not b!241300) (not d!59901) (not b!241353) (not d!59837) (not mapNonEmpty!10756) (not d!59847) (not b!241301) (not b!241197) (not b!241244) (not b!241408) (not d!59907) (not b!241336) (not d!59891) (not d!59877) (not d!59851) (not d!59903) (not d!59905) (not b!241198) (not b!241199) (not d!59821) (not d!59833) (not b!241380) (not b!241342) (not d!59849) (not b!241238))
(check-sat b_and!13457 (not b_next!6483))
