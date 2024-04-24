; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24226 () Bool)

(assert start!24226)

(declare-fun b!253318 () Bool)

(declare-fun b_free!6661 () Bool)

(declare-fun b_next!6661 () Bool)

(assert (=> b!253318 (= b_free!6661 (not b_next!6661))))

(declare-fun tp!23268 () Bool)

(declare-fun b_and!13715 () Bool)

(assert (=> b!253318 (= tp!23268 b_and!13715)))

(declare-fun b!253299 () Bool)

(declare-datatypes ((Unit!7805 0))(
  ( (Unit!7806) )
))
(declare-fun e!164238 () Unit!7805)

(declare-fun Unit!7807 () Unit!7805)

(assert (=> b!253299 (= e!164238 Unit!7807)))

(declare-fun lt!127009 () Unit!7805)

(declare-datatypes ((V!8345 0))(
  ( (V!8346 (val!3306 Int)) )
))
(declare-datatypes ((ValueCell!2918 0))(
  ( (ValueCellFull!2918 (v!5380 V!8345)) (EmptyCell!2918) )
))
(declare-datatypes ((array!12373 0))(
  ( (array!12374 (arr!5863 (Array (_ BitVec 32) ValueCell!2918)) (size!6210 (_ BitVec 32))) )
))
(declare-datatypes ((array!12375 0))(
  ( (array!12376 (arr!5864 (Array (_ BitVec 32) (_ BitVec 64))) (size!6211 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3736 0))(
  ( (LongMapFixedSize!3737 (defaultEntry!4677 Int) (mask!10910 (_ BitVec 32)) (extraKeys!4414 (_ BitVec 32)) (zeroValue!4518 V!8345) (minValue!4518 V!8345) (_size!1917 (_ BitVec 32)) (_keys!6829 array!12375) (_values!4660 array!12373) (_vacant!1917 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3736)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!403 (array!12375 array!12373 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) Int) Unit!7805)

(assert (=> b!253299 (= lt!127009 (lemmaInListMapThenSeekEntryOrOpenFindsIt!403 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)))))

(assert (=> b!253299 false))

(declare-fun b!253300 () Bool)

(declare-fun res!123991 () Bool)

(declare-fun e!164239 () Bool)

(assert (=> b!253300 (=> (not res!123991) (not e!164239))))

(declare-fun call!23877 () Bool)

(assert (=> b!253300 (= res!123991 call!23877)))

(declare-fun e!164233 () Bool)

(assert (=> b!253300 (= e!164233 e!164239)))

(declare-fun b!253301 () Bool)

(declare-fun lt!127010 () Unit!7805)

(assert (=> b!253301 (= e!164238 lt!127010)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!398 (array!12375 array!12373 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) Int) Unit!7805)

(assert (=> b!253301 (= lt!127010 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!398 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)))))

(declare-fun c!42717 () Bool)

(declare-datatypes ((SeekEntryResult!1102 0))(
  ( (MissingZero!1102 (index!6578 (_ BitVec 32))) (Found!1102 (index!6579 (_ BitVec 32))) (Intermediate!1102 (undefined!1914 Bool) (index!6580 (_ BitVec 32)) (x!24776 (_ BitVec 32))) (Undefined!1102) (MissingVacant!1102 (index!6581 (_ BitVec 32))) )
))
(declare-fun lt!127017 () SeekEntryResult!1102)

(get-info :version)

(assert (=> b!253301 (= c!42717 ((_ is MissingZero!1102) lt!127017))))

(assert (=> b!253301 e!164233))

(declare-fun b!253302 () Bool)

(declare-fun res!123980 () Bool)

(assert (=> b!253302 (= res!123980 (= (select (arr!5864 (_keys!6829 thiss!1504)) (index!6581 lt!127017)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164225 () Bool)

(assert (=> b!253302 (=> (not res!123980) (not e!164225))))

(declare-fun b!253303 () Bool)

(declare-fun e!164227 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253303 (= e!164227 (validKeyInArray!0 key!932))))

(declare-fun b!253304 () Bool)

(declare-fun call!23878 () Bool)

(assert (=> b!253304 (= e!164239 (not call!23878))))

(declare-fun b!253305 () Bool)

(declare-fun e!164234 () Bool)

(declare-fun e!164229 () Bool)

(declare-fun mapRes!11097 () Bool)

(assert (=> b!253305 (= e!164234 (and e!164229 mapRes!11097))))

(declare-fun condMapEmpty!11097 () Bool)

(declare-fun mapDefault!11097 () ValueCell!2918)

(assert (=> b!253305 (= condMapEmpty!11097 (= (arr!5863 (_values!4660 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2918)) mapDefault!11097)))))

(declare-fun b!253306 () Bool)

(declare-fun e!164237 () Unit!7805)

(declare-fun Unit!7808 () Unit!7805)

(assert (=> b!253306 (= e!164237 Unit!7808)))

(declare-fun lt!127012 () Unit!7805)

(declare-fun lemmaArrayContainsKeyThenInListMap!223 (array!12375 array!12373 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) (_ BitVec 32) Int) Unit!7805)

(assert (=> b!253306 (= lt!127012 (lemmaArrayContainsKeyThenInListMap!223 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(assert (=> b!253306 false))

(declare-fun res!123983 () Bool)

(declare-fun e!164235 () Bool)

(assert (=> start!24226 (=> (not res!123983) (not e!164235))))

(declare-fun valid!1467 (LongMapFixedSize!3736) Bool)

(assert (=> start!24226 (= res!123983 (valid!1467 thiss!1504))))

(assert (=> start!24226 e!164235))

(declare-fun e!164232 () Bool)

(assert (=> start!24226 e!164232))

(assert (=> start!24226 true))

(declare-fun b!253307 () Bool)

(declare-fun res!123987 () Bool)

(assert (=> b!253307 (=> res!123987 e!164227)))

(declare-datatypes ((List!3662 0))(
  ( (Nil!3659) (Cons!3658 (h!4320 (_ BitVec 64)) (t!8699 List!3662)) )
))
(declare-fun arrayNoDuplicates!0 (array!12375 (_ BitVec 32) List!3662) Bool)

(assert (=> b!253307 (= res!123987 (not (arrayNoDuplicates!0 (_keys!6829 thiss!1504) #b00000000000000000000000000000000 Nil!3659)))))

(declare-fun b!253308 () Bool)

(declare-fun e!164231 () Bool)

(declare-fun tp_is_empty!6523 () Bool)

(assert (=> b!253308 (= e!164231 tp_is_empty!6523)))

(declare-fun b!253309 () Bool)

(declare-fun e!164228 () Bool)

(assert (=> b!253309 (= e!164235 e!164228)))

(declare-fun res!123984 () Bool)

(assert (=> b!253309 (=> (not res!123984) (not e!164228))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!253309 (= res!123984 (or (= lt!127017 (MissingZero!1102 index!297)) (= lt!127017 (MissingVacant!1102 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12375 (_ BitVec 32)) SeekEntryResult!1102)

(assert (=> b!253309 (= lt!127017 (seekEntryOrOpen!0 key!932 (_keys!6829 thiss!1504) (mask!10910 thiss!1504)))))

(declare-fun b!253310 () Bool)

(declare-fun e!164230 () Bool)

(assert (=> b!253310 (= e!164230 (not e!164227))))

(declare-fun res!123982 () Bool)

(assert (=> b!253310 (=> res!123982 e!164227)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!253310 (= res!123982 (not (validMask!0 (mask!10910 thiss!1504))))))

(declare-fun lt!127014 () array!12375)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12375 (_ BitVec 32)) Bool)

(assert (=> b!253310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127014 (mask!10910 thiss!1504))))

(declare-fun lt!127011 () Unit!7805)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12375 (_ BitVec 32) (_ BitVec 32)) Unit!7805)

(assert (=> b!253310 (= lt!127011 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6829 thiss!1504) index!297 (mask!10910 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12375 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!253310 (= (arrayCountValidKeys!0 lt!127014 #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6829 thiss!1504) #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504)))))))

(declare-fun lt!127015 () Unit!7805)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12375 (_ BitVec 32) (_ BitVec 64)) Unit!7805)

(assert (=> b!253310 (= lt!127015 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6829 thiss!1504) index!297 key!932))))

(assert (=> b!253310 (arrayNoDuplicates!0 lt!127014 #b00000000000000000000000000000000 Nil!3659)))

(assert (=> b!253310 (= lt!127014 (array!12376 (store (arr!5864 (_keys!6829 thiss!1504)) index!297 key!932) (size!6211 (_keys!6829 thiss!1504))))))

(declare-fun lt!127008 () Unit!7805)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12375 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3662) Unit!7805)

(assert (=> b!253310 (= lt!127008 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6829 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3659))))

(declare-fun lt!127016 () Unit!7805)

(assert (=> b!253310 (= lt!127016 e!164237)))

(declare-fun c!42718 () Bool)

(declare-fun arrayContainsKey!0 (array!12375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!253310 (= c!42718 (arrayContainsKey!0 (_keys!6829 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253311 () Bool)

(declare-fun res!123988 () Bool)

(assert (=> b!253311 (=> res!123988 e!164227)))

(assert (=> b!253311 (= res!123988 (or (not (= (size!6210 (_values!4660 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10910 thiss!1504)))) (not (= (size!6211 (_keys!6829 thiss!1504)) (size!6210 (_values!4660 thiss!1504)))) (bvslt (mask!10910 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4414 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4414 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!253312 () Bool)

(assert (=> b!253312 (= e!164229 tp_is_empty!6523)))

(declare-fun b!253313 () Bool)

(assert (=> b!253313 (= e!164225 (not call!23878))))

(declare-fun b!253314 () Bool)

(declare-fun res!123985 () Bool)

(assert (=> b!253314 (=> res!123985 e!164227)))

(assert (=> b!253314 (= res!123985 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6211 (_keys!6829 thiss!1504)))))))

(declare-fun b!253315 () Bool)

(declare-fun e!164236 () Bool)

(assert (=> b!253315 (= e!164236 ((_ is Undefined!1102) lt!127017))))

(declare-fun b!253316 () Bool)

(assert (=> b!253316 (= e!164228 e!164230)))

(declare-fun res!123990 () Bool)

(assert (=> b!253316 (=> (not res!123990) (not e!164230))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!253316 (= res!123990 (inRange!0 index!297 (mask!10910 thiss!1504)))))

(declare-fun lt!127013 () Unit!7805)

(assert (=> b!253316 (= lt!127013 e!164238)))

(declare-fun c!42719 () Bool)

(declare-datatypes ((tuple2!4784 0))(
  ( (tuple2!4785 (_1!2403 (_ BitVec 64)) (_2!2403 V!8345)) )
))
(declare-datatypes ((List!3663 0))(
  ( (Nil!3660) (Cons!3659 (h!4321 tuple2!4784) (t!8700 List!3663)) )
))
(declare-datatypes ((ListLongMap!3699 0))(
  ( (ListLongMap!3700 (toList!1865 List!3663)) )
))
(declare-fun contains!1810 (ListLongMap!3699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1397 (array!12375 array!12373 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 32) Int) ListLongMap!3699)

(assert (=> b!253316 (= c!42719 (contains!1810 (getCurrentListMap!1397 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)) key!932))))

(declare-fun b!253317 () Bool)

(assert (=> b!253317 (= e!164236 e!164225)))

(declare-fun res!123981 () Bool)

(assert (=> b!253317 (= res!123981 call!23877)))

(assert (=> b!253317 (=> (not res!123981) (not e!164225))))

(declare-fun array_inv!3855 (array!12375) Bool)

(declare-fun array_inv!3856 (array!12373) Bool)

(assert (=> b!253318 (= e!164232 (and tp!23268 tp_is_empty!6523 (array_inv!3855 (_keys!6829 thiss!1504)) (array_inv!3856 (_values!4660 thiss!1504)) e!164234))))

(declare-fun mapNonEmpty!11097 () Bool)

(declare-fun tp!23267 () Bool)

(assert (=> mapNonEmpty!11097 (= mapRes!11097 (and tp!23267 e!164231))))

(declare-fun mapKey!11097 () (_ BitVec 32))

(declare-fun mapValue!11097 () ValueCell!2918)

(declare-fun mapRest!11097 () (Array (_ BitVec 32) ValueCell!2918))

(assert (=> mapNonEmpty!11097 (= (arr!5863 (_values!4660 thiss!1504)) (store mapRest!11097 mapKey!11097 mapValue!11097))))

(declare-fun b!253319 () Bool)

(declare-fun res!123979 () Bool)

(assert (=> b!253319 (=> res!123979 e!164227)))

(assert (=> b!253319 (= res!123979 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6829 thiss!1504) (mask!10910 thiss!1504))))))

(declare-fun b!253320 () Bool)

(declare-fun Unit!7809 () Unit!7805)

(assert (=> b!253320 (= e!164237 Unit!7809)))

(declare-fun b!253321 () Bool)

(declare-fun res!123986 () Bool)

(assert (=> b!253321 (=> (not res!123986) (not e!164239))))

(assert (=> b!253321 (= res!123986 (= (select (arr!5864 (_keys!6829 thiss!1504)) (index!6578 lt!127017)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23874 () Bool)

(assert (=> bm!23874 (= call!23878 (arrayContainsKey!0 (_keys!6829 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253322 () Bool)

(declare-fun c!42716 () Bool)

(assert (=> b!253322 (= c!42716 ((_ is MissingVacant!1102) lt!127017))))

(assert (=> b!253322 (= e!164233 e!164236)))

(declare-fun b!253323 () Bool)

(declare-fun res!123989 () Bool)

(assert (=> b!253323 (=> (not res!123989) (not e!164235))))

(assert (=> b!253323 (= res!123989 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!11097 () Bool)

(assert (=> mapIsEmpty!11097 mapRes!11097))

(declare-fun bm!23875 () Bool)

(assert (=> bm!23875 (= call!23877 (inRange!0 (ite c!42717 (index!6578 lt!127017) (index!6581 lt!127017)) (mask!10910 thiss!1504)))))

(assert (= (and start!24226 res!123983) b!253323))

(assert (= (and b!253323 res!123989) b!253309))

(assert (= (and b!253309 res!123984) b!253316))

(assert (= (and b!253316 c!42719) b!253299))

(assert (= (and b!253316 (not c!42719)) b!253301))

(assert (= (and b!253301 c!42717) b!253300))

(assert (= (and b!253301 (not c!42717)) b!253322))

(assert (= (and b!253300 res!123991) b!253321))

(assert (= (and b!253321 res!123986) b!253304))

(assert (= (and b!253322 c!42716) b!253317))

(assert (= (and b!253322 (not c!42716)) b!253315))

(assert (= (and b!253317 res!123981) b!253302))

(assert (= (and b!253302 res!123980) b!253313))

(assert (= (or b!253300 b!253317) bm!23875))

(assert (= (or b!253304 b!253313) bm!23874))

(assert (= (and b!253316 res!123990) b!253310))

(assert (= (and b!253310 c!42718) b!253306))

(assert (= (and b!253310 (not c!42718)) b!253320))

(assert (= (and b!253310 (not res!123982)) b!253311))

(assert (= (and b!253311 (not res!123988)) b!253319))

(assert (= (and b!253319 (not res!123979)) b!253307))

(assert (= (and b!253307 (not res!123987)) b!253314))

(assert (= (and b!253314 (not res!123985)) b!253303))

(assert (= (and b!253305 condMapEmpty!11097) mapIsEmpty!11097))

(assert (= (and b!253305 (not condMapEmpty!11097)) mapNonEmpty!11097))

(assert (= (and mapNonEmpty!11097 ((_ is ValueCellFull!2918) mapValue!11097)) b!253308))

(assert (= (and b!253305 ((_ is ValueCellFull!2918) mapDefault!11097)) b!253312))

(assert (= b!253318 b!253305))

(assert (= start!24226 b!253318))

(declare-fun m!269327 () Bool)

(assert (=> b!253301 m!269327))

(declare-fun m!269329 () Bool)

(assert (=> b!253321 m!269329))

(declare-fun m!269331 () Bool)

(assert (=> b!253319 m!269331))

(declare-fun m!269333 () Bool)

(assert (=> bm!23875 m!269333))

(declare-fun m!269335 () Bool)

(assert (=> b!253303 m!269335))

(declare-fun m!269337 () Bool)

(assert (=> start!24226 m!269337))

(declare-fun m!269339 () Bool)

(assert (=> b!253318 m!269339))

(declare-fun m!269341 () Bool)

(assert (=> b!253318 m!269341))

(declare-fun m!269343 () Bool)

(assert (=> b!253316 m!269343))

(declare-fun m!269345 () Bool)

(assert (=> b!253316 m!269345))

(assert (=> b!253316 m!269345))

(declare-fun m!269347 () Bool)

(assert (=> b!253316 m!269347))

(declare-fun m!269349 () Bool)

(assert (=> b!253310 m!269349))

(declare-fun m!269351 () Bool)

(assert (=> b!253310 m!269351))

(declare-fun m!269353 () Bool)

(assert (=> b!253310 m!269353))

(declare-fun m!269355 () Bool)

(assert (=> b!253310 m!269355))

(declare-fun m!269357 () Bool)

(assert (=> b!253310 m!269357))

(declare-fun m!269359 () Bool)

(assert (=> b!253310 m!269359))

(declare-fun m!269361 () Bool)

(assert (=> b!253310 m!269361))

(declare-fun m!269363 () Bool)

(assert (=> b!253310 m!269363))

(declare-fun m!269365 () Bool)

(assert (=> b!253310 m!269365))

(declare-fun m!269367 () Bool)

(assert (=> b!253310 m!269367))

(declare-fun m!269369 () Bool)

(assert (=> b!253299 m!269369))

(declare-fun m!269371 () Bool)

(assert (=> mapNonEmpty!11097 m!269371))

(declare-fun m!269373 () Bool)

(assert (=> b!253302 m!269373))

(declare-fun m!269375 () Bool)

(assert (=> b!253306 m!269375))

(declare-fun m!269377 () Bool)

(assert (=> b!253309 m!269377))

(declare-fun m!269379 () Bool)

(assert (=> b!253307 m!269379))

(assert (=> bm!23874 m!269351))

(check-sat (not b!253307) (not b!253301) (not b!253318) (not b!253316) (not b!253319) (not b!253303) (not start!24226) tp_is_empty!6523 (not bm!23874) (not b!253306) (not b!253309) b_and!13715 (not b_next!6661) (not bm!23875) (not b!253310) (not b!253299) (not mapNonEmpty!11097))
(check-sat b_and!13715 (not b_next!6661))
(get-model)

(declare-fun bm!23890 () Bool)

(declare-fun call!23893 () Bool)

(declare-fun c!42746 () Bool)

(assert (=> bm!23890 (= call!23893 (arrayNoDuplicates!0 (_keys!6829 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42746 (Cons!3658 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000) Nil!3659) Nil!3659)))))

(declare-fun b!253484 () Bool)

(declare-fun e!164339 () Bool)

(declare-fun e!164341 () Bool)

(assert (=> b!253484 (= e!164339 e!164341)))

(declare-fun res!124077 () Bool)

(assert (=> b!253484 (=> (not res!124077) (not e!164341))))

(declare-fun e!164338 () Bool)

(assert (=> b!253484 (= res!124077 (not e!164338))))

(declare-fun res!124078 () Bool)

(assert (=> b!253484 (=> (not res!124078) (not e!164338))))

(assert (=> b!253484 (= res!124078 (validKeyInArray!0 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253485 () Bool)

(declare-fun contains!1812 (List!3662 (_ BitVec 64)) Bool)

(assert (=> b!253485 (= e!164338 (contains!1812 Nil!3659 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253486 () Bool)

(declare-fun e!164340 () Bool)

(assert (=> b!253486 (= e!164340 call!23893)))

(declare-fun b!253487 () Bool)

(assert (=> b!253487 (= e!164340 call!23893)))

(declare-fun d!61503 () Bool)

(declare-fun res!124076 () Bool)

(assert (=> d!61503 (=> res!124076 e!164339)))

(assert (=> d!61503 (= res!124076 (bvsge #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))))))

(assert (=> d!61503 (= (arrayNoDuplicates!0 (_keys!6829 thiss!1504) #b00000000000000000000000000000000 Nil!3659) e!164339)))

(declare-fun b!253488 () Bool)

(assert (=> b!253488 (= e!164341 e!164340)))

(assert (=> b!253488 (= c!42746 (validKeyInArray!0 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61503 (not res!124076)) b!253484))

(assert (= (and b!253484 res!124078) b!253485))

(assert (= (and b!253484 res!124077) b!253488))

(assert (= (and b!253488 c!42746) b!253486))

(assert (= (and b!253488 (not c!42746)) b!253487))

(assert (= (or b!253486 b!253487) bm!23890))

(declare-fun m!269489 () Bool)

(assert (=> bm!23890 m!269489))

(declare-fun m!269491 () Bool)

(assert (=> bm!23890 m!269491))

(assert (=> b!253484 m!269489))

(assert (=> b!253484 m!269489))

(declare-fun m!269493 () Bool)

(assert (=> b!253484 m!269493))

(assert (=> b!253485 m!269489))

(assert (=> b!253485 m!269489))

(declare-fun m!269495 () Bool)

(assert (=> b!253485 m!269495))

(assert (=> b!253488 m!269489))

(assert (=> b!253488 m!269489))

(assert (=> b!253488 m!269493))

(assert (=> b!253307 d!61503))

(declare-fun d!61505 () Bool)

(assert (=> d!61505 (= (array_inv!3855 (_keys!6829 thiss!1504)) (bvsge (size!6211 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253318 d!61505))

(declare-fun d!61507 () Bool)

(assert (=> d!61507 (= (array_inv!3856 (_values!4660 thiss!1504)) (bvsge (size!6210 (_values!4660 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253318 d!61507))

(declare-fun d!61509 () Bool)

(assert (=> d!61509 (= (inRange!0 index!297 (mask!10910 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10910 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!253316 d!61509))

(declare-fun d!61511 () Bool)

(declare-fun e!164346 () Bool)

(assert (=> d!61511 e!164346))

(declare-fun res!124081 () Bool)

(assert (=> d!61511 (=> res!124081 e!164346)))

(declare-fun lt!127089 () Bool)

(assert (=> d!61511 (= res!124081 (not lt!127089))))

(declare-fun lt!127086 () Bool)

(assert (=> d!61511 (= lt!127089 lt!127086)))

(declare-fun lt!127088 () Unit!7805)

(declare-fun e!164347 () Unit!7805)

(assert (=> d!61511 (= lt!127088 e!164347)))

(declare-fun c!42749 () Bool)

(assert (=> d!61511 (= c!42749 lt!127086)))

(declare-fun containsKey!296 (List!3663 (_ BitVec 64)) Bool)

(assert (=> d!61511 (= lt!127086 (containsKey!296 (toList!1865 (getCurrentListMap!1397 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504))) key!932))))

(assert (=> d!61511 (= (contains!1810 (getCurrentListMap!1397 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)) key!932) lt!127089)))

(declare-fun b!253495 () Bool)

(declare-fun lt!127087 () Unit!7805)

(assert (=> b!253495 (= e!164347 lt!127087)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!244 (List!3663 (_ BitVec 64)) Unit!7805)

(assert (=> b!253495 (= lt!127087 (lemmaContainsKeyImpliesGetValueByKeyDefined!244 (toList!1865 (getCurrentListMap!1397 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504))) key!932))))

(declare-datatypes ((Option!311 0))(
  ( (Some!310 (v!5383 V!8345)) (None!309) )
))
(declare-fun isDefined!245 (Option!311) Bool)

(declare-fun getValueByKey!305 (List!3663 (_ BitVec 64)) Option!311)

(assert (=> b!253495 (isDefined!245 (getValueByKey!305 (toList!1865 (getCurrentListMap!1397 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504))) key!932))))

(declare-fun b!253496 () Bool)

(declare-fun Unit!7819 () Unit!7805)

(assert (=> b!253496 (= e!164347 Unit!7819)))

(declare-fun b!253497 () Bool)

(assert (=> b!253497 (= e!164346 (isDefined!245 (getValueByKey!305 (toList!1865 (getCurrentListMap!1397 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504))) key!932)))))

(assert (= (and d!61511 c!42749) b!253495))

(assert (= (and d!61511 (not c!42749)) b!253496))

(assert (= (and d!61511 (not res!124081)) b!253497))

(declare-fun m!269497 () Bool)

(assert (=> d!61511 m!269497))

(declare-fun m!269499 () Bool)

(assert (=> b!253495 m!269499))

(declare-fun m!269501 () Bool)

(assert (=> b!253495 m!269501))

(assert (=> b!253495 m!269501))

(declare-fun m!269503 () Bool)

(assert (=> b!253495 m!269503))

(assert (=> b!253497 m!269501))

(assert (=> b!253497 m!269501))

(assert (=> b!253497 m!269503))

(assert (=> b!253316 d!61511))

(declare-fun b!253540 () Bool)

(declare-fun c!42762 () Bool)

(assert (=> b!253540 (= c!42762 (and (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!164380 () ListLongMap!3699)

(declare-fun e!164385 () ListLongMap!3699)

(assert (=> b!253540 (= e!164380 e!164385)))

(declare-fun b!253541 () Bool)

(declare-fun call!23911 () ListLongMap!3699)

(assert (=> b!253541 (= e!164385 call!23911)))

(declare-fun b!253542 () Bool)

(declare-fun e!164377 () Bool)

(declare-fun lt!127135 () ListLongMap!3699)

(declare-fun apply!246 (ListLongMap!3699 (_ BitVec 64)) V!8345)

(assert (=> b!253542 (= e!164377 (= (apply!246 lt!127135 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4518 thiss!1504)))))

(declare-fun bm!23905 () Bool)

(declare-fun call!23912 () ListLongMap!3699)

(assert (=> bm!23905 (= call!23911 call!23912)))

(declare-fun b!253543 () Bool)

(declare-fun e!164378 () Bool)

(declare-fun e!164376 () Bool)

(assert (=> b!253543 (= e!164378 e!164376)))

(declare-fun c!42764 () Bool)

(assert (=> b!253543 (= c!42764 (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!253544 () Bool)

(declare-fun e!164383 () Bool)

(declare-fun e!164375 () Bool)

(assert (=> b!253544 (= e!164383 e!164375)))

(declare-fun res!124100 () Bool)

(assert (=> b!253544 (=> (not res!124100) (not e!164375))))

(assert (=> b!253544 (= res!124100 (contains!1810 lt!127135 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!253544 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))))))

(declare-fun b!253545 () Bool)

(declare-fun call!23908 () Bool)

(assert (=> b!253545 (= e!164376 (not call!23908))))

(declare-fun b!253546 () Bool)

(declare-fun get!3027 (ValueCell!2918 V!8345) V!8345)

(declare-fun dynLambda!589 (Int (_ BitVec 64)) V!8345)

(assert (=> b!253546 (= e!164375 (= (apply!246 lt!127135 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000)) (get!3027 (select (arr!5863 (_values!4660 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4677 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!253546 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6210 (_values!4660 thiss!1504))))))

(assert (=> b!253546 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))))))

(declare-fun b!253547 () Bool)

(declare-fun e!164382 () Bool)

(declare-fun call!23914 () Bool)

(assert (=> b!253547 (= e!164382 (not call!23914))))

(declare-fun b!253548 () Bool)

(declare-fun e!164379 () Bool)

(assert (=> b!253548 (= e!164382 e!164379)))

(declare-fun res!124101 () Bool)

(assert (=> b!253548 (= res!124101 call!23914)))

(assert (=> b!253548 (=> (not res!124101) (not e!164379))))

(declare-fun b!253549 () Bool)

(declare-fun e!164381 () ListLongMap!3699)

(declare-fun +!673 (ListLongMap!3699 tuple2!4784) ListLongMap!3699)

(assert (=> b!253549 (= e!164381 (+!673 call!23912 (tuple2!4785 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4518 thiss!1504))))))

(declare-fun bm!23906 () Bool)

(assert (=> bm!23906 (= call!23914 (contains!1810 lt!127135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253550 () Bool)

(declare-fun e!164374 () Bool)

(assert (=> b!253550 (= e!164374 (validKeyInArray!0 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253551 () Bool)

(declare-fun res!124105 () Bool)

(assert (=> b!253551 (=> (not res!124105) (not e!164378))))

(assert (=> b!253551 (= res!124105 e!164383)))

(declare-fun res!124107 () Bool)

(assert (=> b!253551 (=> res!124107 e!164383)))

(declare-fun e!164384 () Bool)

(assert (=> b!253551 (= res!124107 (not e!164384))))

(declare-fun res!124106 () Bool)

(assert (=> b!253551 (=> (not res!124106) (not e!164384))))

(assert (=> b!253551 (= res!124106 (bvslt #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))))))

(declare-fun b!253552 () Bool)

(declare-fun e!164386 () Unit!7805)

(declare-fun lt!127143 () Unit!7805)

(assert (=> b!253552 (= e!164386 lt!127143)))

(declare-fun lt!127148 () ListLongMap!3699)

(declare-fun getCurrentListMapNoExtraKeys!562 (array!12375 array!12373 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 32) Int) ListLongMap!3699)

(assert (=> b!253552 (= lt!127148 (getCurrentListMapNoExtraKeys!562 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(declare-fun lt!127139 () (_ BitVec 64))

(assert (=> b!253552 (= lt!127139 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127141 () (_ BitVec 64))

(assert (=> b!253552 (= lt!127141 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127145 () Unit!7805)

(declare-fun addStillContains!222 (ListLongMap!3699 (_ BitVec 64) V!8345 (_ BitVec 64)) Unit!7805)

(assert (=> b!253552 (= lt!127145 (addStillContains!222 lt!127148 lt!127139 (zeroValue!4518 thiss!1504) lt!127141))))

(assert (=> b!253552 (contains!1810 (+!673 lt!127148 (tuple2!4785 lt!127139 (zeroValue!4518 thiss!1504))) lt!127141)))

(declare-fun lt!127149 () Unit!7805)

(assert (=> b!253552 (= lt!127149 lt!127145)))

(declare-fun lt!127134 () ListLongMap!3699)

(assert (=> b!253552 (= lt!127134 (getCurrentListMapNoExtraKeys!562 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(declare-fun lt!127144 () (_ BitVec 64))

(assert (=> b!253552 (= lt!127144 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127155 () (_ BitVec 64))

(assert (=> b!253552 (= lt!127155 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127137 () Unit!7805)

(declare-fun addApplyDifferent!222 (ListLongMap!3699 (_ BitVec 64) V!8345 (_ BitVec 64)) Unit!7805)

(assert (=> b!253552 (= lt!127137 (addApplyDifferent!222 lt!127134 lt!127144 (minValue!4518 thiss!1504) lt!127155))))

(assert (=> b!253552 (= (apply!246 (+!673 lt!127134 (tuple2!4785 lt!127144 (minValue!4518 thiss!1504))) lt!127155) (apply!246 lt!127134 lt!127155))))

(declare-fun lt!127150 () Unit!7805)

(assert (=> b!253552 (= lt!127150 lt!127137)))

(declare-fun lt!127154 () ListLongMap!3699)

(assert (=> b!253552 (= lt!127154 (getCurrentListMapNoExtraKeys!562 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(declare-fun lt!127146 () (_ BitVec 64))

(assert (=> b!253552 (= lt!127146 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127142 () (_ BitVec 64))

(assert (=> b!253552 (= lt!127142 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127153 () Unit!7805)

(assert (=> b!253552 (= lt!127153 (addApplyDifferent!222 lt!127154 lt!127146 (zeroValue!4518 thiss!1504) lt!127142))))

(assert (=> b!253552 (= (apply!246 (+!673 lt!127154 (tuple2!4785 lt!127146 (zeroValue!4518 thiss!1504))) lt!127142) (apply!246 lt!127154 lt!127142))))

(declare-fun lt!127136 () Unit!7805)

(assert (=> b!253552 (= lt!127136 lt!127153)))

(declare-fun lt!127140 () ListLongMap!3699)

(assert (=> b!253552 (= lt!127140 (getCurrentListMapNoExtraKeys!562 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(declare-fun lt!127152 () (_ BitVec 64))

(assert (=> b!253552 (= lt!127152 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127138 () (_ BitVec 64))

(assert (=> b!253552 (= lt!127138 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253552 (= lt!127143 (addApplyDifferent!222 lt!127140 lt!127152 (minValue!4518 thiss!1504) lt!127138))))

(assert (=> b!253552 (= (apply!246 (+!673 lt!127140 (tuple2!4785 lt!127152 (minValue!4518 thiss!1504))) lt!127138) (apply!246 lt!127140 lt!127138))))

(declare-fun b!253553 () Bool)

(declare-fun call!23913 () ListLongMap!3699)

(assert (=> b!253553 (= e!164385 call!23913)))

(declare-fun b!253554 () Bool)

(assert (=> b!253554 (= e!164380 call!23911)))

(declare-fun b!253555 () Bool)

(declare-fun res!124103 () Bool)

(assert (=> b!253555 (=> (not res!124103) (not e!164378))))

(assert (=> b!253555 (= res!124103 e!164382)))

(declare-fun c!42767 () Bool)

(assert (=> b!253555 (= c!42767 (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!253556 () Bool)

(assert (=> b!253556 (= e!164379 (= (apply!246 lt!127135 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4518 thiss!1504)))))

(declare-fun bm!23907 () Bool)

(declare-fun call!23910 () ListLongMap!3699)

(assert (=> bm!23907 (= call!23910 (getCurrentListMapNoExtraKeys!562 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(declare-fun c!42763 () Bool)

(declare-fun bm!23908 () Bool)

(declare-fun call!23909 () ListLongMap!3699)

(declare-fun c!42766 () Bool)

(assert (=> bm!23908 (= call!23912 (+!673 (ite c!42766 call!23910 (ite c!42763 call!23909 call!23913)) (ite (or c!42766 c!42763) (tuple2!4785 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4518 thiss!1504)) (tuple2!4785 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4518 thiss!1504)))))))

(declare-fun b!253557 () Bool)

(assert (=> b!253557 (= e!164381 e!164380)))

(assert (=> b!253557 (= c!42763 (and (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23909 () Bool)

(assert (=> bm!23909 (= call!23913 call!23909)))

(declare-fun b!253558 () Bool)

(declare-fun Unit!7820 () Unit!7805)

(assert (=> b!253558 (= e!164386 Unit!7820)))

(declare-fun b!253559 () Bool)

(assert (=> b!253559 (= e!164384 (validKeyInArray!0 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253560 () Bool)

(assert (=> b!253560 (= e!164376 e!164377)))

(declare-fun res!124102 () Bool)

(assert (=> b!253560 (= res!124102 call!23908)))

(assert (=> b!253560 (=> (not res!124102) (not e!164377))))

(declare-fun d!61513 () Bool)

(assert (=> d!61513 e!164378))

(declare-fun res!124104 () Bool)

(assert (=> d!61513 (=> (not res!124104) (not e!164378))))

(assert (=> d!61513 (= res!124104 (or (bvsge #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))))))))

(declare-fun lt!127147 () ListLongMap!3699)

(assert (=> d!61513 (= lt!127135 lt!127147)))

(declare-fun lt!127151 () Unit!7805)

(assert (=> d!61513 (= lt!127151 e!164386)))

(declare-fun c!42765 () Bool)

(assert (=> d!61513 (= c!42765 e!164374)))

(declare-fun res!124108 () Bool)

(assert (=> d!61513 (=> (not res!124108) (not e!164374))))

(assert (=> d!61513 (= res!124108 (bvslt #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))))))

(assert (=> d!61513 (= lt!127147 e!164381)))

(assert (=> d!61513 (= c!42766 (and (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61513 (validMask!0 (mask!10910 thiss!1504))))

(assert (=> d!61513 (= (getCurrentListMap!1397 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)) lt!127135)))

(declare-fun bm!23910 () Bool)

(assert (=> bm!23910 (= call!23908 (contains!1810 lt!127135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23911 () Bool)

(assert (=> bm!23911 (= call!23909 call!23910)))

(assert (= (and d!61513 c!42766) b!253549))

(assert (= (and d!61513 (not c!42766)) b!253557))

(assert (= (and b!253557 c!42763) b!253554))

(assert (= (and b!253557 (not c!42763)) b!253540))

(assert (= (and b!253540 c!42762) b!253541))

(assert (= (and b!253540 (not c!42762)) b!253553))

(assert (= (or b!253541 b!253553) bm!23909))

(assert (= (or b!253554 bm!23909) bm!23911))

(assert (= (or b!253554 b!253541) bm!23905))

(assert (= (or b!253549 bm!23911) bm!23907))

(assert (= (or b!253549 bm!23905) bm!23908))

(assert (= (and d!61513 res!124108) b!253550))

(assert (= (and d!61513 c!42765) b!253552))

(assert (= (and d!61513 (not c!42765)) b!253558))

(assert (= (and d!61513 res!124104) b!253551))

(assert (= (and b!253551 res!124106) b!253559))

(assert (= (and b!253551 (not res!124107)) b!253544))

(assert (= (and b!253544 res!124100) b!253546))

(assert (= (and b!253551 res!124105) b!253555))

(assert (= (and b!253555 c!42767) b!253548))

(assert (= (and b!253555 (not c!42767)) b!253547))

(assert (= (and b!253548 res!124101) b!253556))

(assert (= (or b!253548 b!253547) bm!23906))

(assert (= (and b!253555 res!124103) b!253543))

(assert (= (and b!253543 c!42764) b!253560))

(assert (= (and b!253543 (not c!42764)) b!253545))

(assert (= (and b!253560 res!124102) b!253542))

(assert (= (or b!253560 b!253545) bm!23910))

(declare-fun b_lambda!8149 () Bool)

(assert (=> (not b_lambda!8149) (not b!253546)))

(declare-fun t!8705 () Bool)

(declare-fun tb!2997 () Bool)

(assert (=> (and b!253318 (= (defaultEntry!4677 thiss!1504) (defaultEntry!4677 thiss!1504)) t!8705) tb!2997))

(declare-fun result!5329 () Bool)

(assert (=> tb!2997 (= result!5329 tp_is_empty!6523)))

(assert (=> b!253546 t!8705))

(declare-fun b_and!13721 () Bool)

(assert (= b_and!13715 (and (=> t!8705 result!5329) b_and!13721)))

(declare-fun m!269505 () Bool)

(assert (=> bm!23908 m!269505))

(assert (=> b!253552 m!269489))

(declare-fun m!269507 () Bool)

(assert (=> b!253552 m!269507))

(declare-fun m!269509 () Bool)

(assert (=> b!253552 m!269509))

(declare-fun m!269511 () Bool)

(assert (=> b!253552 m!269511))

(declare-fun m!269513 () Bool)

(assert (=> b!253552 m!269513))

(declare-fun m!269515 () Bool)

(assert (=> b!253552 m!269515))

(declare-fun m!269517 () Bool)

(assert (=> b!253552 m!269517))

(declare-fun m!269519 () Bool)

(assert (=> b!253552 m!269519))

(assert (=> b!253552 m!269513))

(declare-fun m!269521 () Bool)

(assert (=> b!253552 m!269521))

(declare-fun m!269523 () Bool)

(assert (=> b!253552 m!269523))

(declare-fun m!269525 () Bool)

(assert (=> b!253552 m!269525))

(declare-fun m!269527 () Bool)

(assert (=> b!253552 m!269527))

(declare-fun m!269529 () Bool)

(assert (=> b!253552 m!269529))

(assert (=> b!253552 m!269521))

(declare-fun m!269531 () Bool)

(assert (=> b!253552 m!269531))

(assert (=> b!253552 m!269509))

(declare-fun m!269533 () Bool)

(assert (=> b!253552 m!269533))

(assert (=> b!253552 m!269517))

(declare-fun m!269535 () Bool)

(assert (=> b!253552 m!269535))

(declare-fun m!269537 () Bool)

(assert (=> b!253552 m!269537))

(assert (=> b!253546 m!269489))

(declare-fun m!269539 () Bool)

(assert (=> b!253546 m!269539))

(declare-fun m!269541 () Bool)

(assert (=> b!253546 m!269541))

(declare-fun m!269543 () Bool)

(assert (=> b!253546 m!269543))

(assert (=> b!253546 m!269539))

(assert (=> b!253546 m!269489))

(declare-fun m!269545 () Bool)

(assert (=> b!253546 m!269545))

(assert (=> b!253546 m!269541))

(declare-fun m!269547 () Bool)

(assert (=> b!253549 m!269547))

(declare-fun m!269549 () Bool)

(assert (=> bm!23910 m!269549))

(assert (=> b!253544 m!269489))

(assert (=> b!253544 m!269489))

(declare-fun m!269551 () Bool)

(assert (=> b!253544 m!269551))

(declare-fun m!269553 () Bool)

(assert (=> b!253556 m!269553))

(assert (=> b!253559 m!269489))

(assert (=> b!253559 m!269489))

(assert (=> b!253559 m!269493))

(assert (=> b!253550 m!269489))

(assert (=> b!253550 m!269489))

(assert (=> b!253550 m!269493))

(assert (=> bm!23907 m!269525))

(declare-fun m!269555 () Bool)

(assert (=> bm!23906 m!269555))

(assert (=> d!61513 m!269349))

(declare-fun m!269557 () Bool)

(assert (=> b!253542 m!269557))

(assert (=> b!253316 d!61513))

(declare-fun d!61515 () Bool)

(assert (=> d!61515 (= (inRange!0 (ite c!42717 (index!6578 lt!127017) (index!6581 lt!127017)) (mask!10910 thiss!1504)) (and (bvsge (ite c!42717 (index!6578 lt!127017) (index!6581 lt!127017)) #b00000000000000000000000000000000) (bvslt (ite c!42717 (index!6578 lt!127017) (index!6581 lt!127017)) (bvadd (mask!10910 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23875 d!61515))

(declare-fun d!61517 () Bool)

(assert (=> d!61517 (contains!1810 (getCurrentListMap!1397 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)) key!932)))

(declare-fun lt!127158 () Unit!7805)

(declare-fun choose!1216 (array!12375 array!12373 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) (_ BitVec 32) Int) Unit!7805)

(assert (=> d!61517 (= lt!127158 (choose!1216 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(assert (=> d!61517 (validMask!0 (mask!10910 thiss!1504))))

(assert (=> d!61517 (= (lemmaArrayContainsKeyThenInListMap!223 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)) lt!127158)))

(declare-fun bs!9058 () Bool)

(assert (= bs!9058 d!61517))

(assert (=> bs!9058 m!269345))

(assert (=> bs!9058 m!269345))

(assert (=> bs!9058 m!269347))

(declare-fun m!269559 () Bool)

(assert (=> bs!9058 m!269559))

(assert (=> bs!9058 m!269349))

(assert (=> b!253306 d!61517))

(declare-fun d!61519 () Bool)

(declare-fun res!124115 () Bool)

(declare-fun e!164389 () Bool)

(assert (=> d!61519 (=> (not res!124115) (not e!164389))))

(declare-fun simpleValid!269 (LongMapFixedSize!3736) Bool)

(assert (=> d!61519 (= res!124115 (simpleValid!269 thiss!1504))))

(assert (=> d!61519 (= (valid!1467 thiss!1504) e!164389)))

(declare-fun b!253569 () Bool)

(declare-fun res!124116 () Bool)

(assert (=> b!253569 (=> (not res!124116) (not e!164389))))

(assert (=> b!253569 (= res!124116 (= (arrayCountValidKeys!0 (_keys!6829 thiss!1504) #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))) (_size!1917 thiss!1504)))))

(declare-fun b!253570 () Bool)

(declare-fun res!124117 () Bool)

(assert (=> b!253570 (=> (not res!124117) (not e!164389))))

(assert (=> b!253570 (= res!124117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6829 thiss!1504) (mask!10910 thiss!1504)))))

(declare-fun b!253571 () Bool)

(assert (=> b!253571 (= e!164389 (arrayNoDuplicates!0 (_keys!6829 thiss!1504) #b00000000000000000000000000000000 Nil!3659))))

(assert (= (and d!61519 res!124115) b!253569))

(assert (= (and b!253569 res!124116) b!253570))

(assert (= (and b!253570 res!124117) b!253571))

(declare-fun m!269561 () Bool)

(assert (=> d!61519 m!269561))

(assert (=> b!253569 m!269365))

(assert (=> b!253570 m!269331))

(assert (=> b!253571 m!269379))

(assert (=> start!24226 d!61519))

(declare-fun b!253588 () Bool)

(declare-fun e!164401 () Bool)

(declare-fun e!164399 () Bool)

(assert (=> b!253588 (= e!164401 e!164399)))

(declare-fun res!124128 () Bool)

(declare-fun call!23920 () Bool)

(assert (=> b!253588 (= res!124128 call!23920)))

(assert (=> b!253588 (=> (not res!124128) (not e!164399))))

(declare-fun c!42772 () Bool)

(declare-fun lt!127163 () SeekEntryResult!1102)

(declare-fun bm!23916 () Bool)

(assert (=> bm!23916 (= call!23920 (inRange!0 (ite c!42772 (index!6578 lt!127163) (index!6581 lt!127163)) (mask!10910 thiss!1504)))))

(declare-fun b!253590 () Bool)

(declare-fun e!164398 () Bool)

(declare-fun call!23919 () Bool)

(assert (=> b!253590 (= e!164398 (not call!23919))))

(declare-fun b!253591 () Bool)

(assert (=> b!253591 (and (bvsge (index!6578 lt!127163) #b00000000000000000000000000000000) (bvslt (index!6578 lt!127163) (size!6211 (_keys!6829 thiss!1504))))))

(declare-fun res!124126 () Bool)

(assert (=> b!253591 (= res!124126 (= (select (arr!5864 (_keys!6829 thiss!1504)) (index!6578 lt!127163)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253591 (=> (not res!124126) (not e!164399))))

(declare-fun b!253592 () Bool)

(declare-fun res!124129 () Bool)

(assert (=> b!253592 (=> (not res!124129) (not e!164398))))

(assert (=> b!253592 (= res!124129 call!23920)))

(declare-fun e!164400 () Bool)

(assert (=> b!253592 (= e!164400 e!164398)))

(declare-fun d!61521 () Bool)

(assert (=> d!61521 e!164401))

(assert (=> d!61521 (= c!42772 ((_ is MissingZero!1102) lt!127163))))

(assert (=> d!61521 (= lt!127163 (seekEntryOrOpen!0 key!932 (_keys!6829 thiss!1504) (mask!10910 thiss!1504)))))

(declare-fun lt!127164 () Unit!7805)

(declare-fun choose!1217 (array!12375 array!12373 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) Int) Unit!7805)

(assert (=> d!61521 (= lt!127164 (choose!1217 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)))))

(assert (=> d!61521 (validMask!0 (mask!10910 thiss!1504))))

(assert (=> d!61521 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!398 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)) lt!127164)))

(declare-fun b!253589 () Bool)

(declare-fun res!124127 () Bool)

(assert (=> b!253589 (=> (not res!124127) (not e!164398))))

(assert (=> b!253589 (= res!124127 (= (select (arr!5864 (_keys!6829 thiss!1504)) (index!6581 lt!127163)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253589 (and (bvsge (index!6581 lt!127163) #b00000000000000000000000000000000) (bvslt (index!6581 lt!127163) (size!6211 (_keys!6829 thiss!1504))))))

(declare-fun bm!23917 () Bool)

(assert (=> bm!23917 (= call!23919 (arrayContainsKey!0 (_keys!6829 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253593 () Bool)

(assert (=> b!253593 (= e!164401 e!164400)))

(declare-fun c!42773 () Bool)

(assert (=> b!253593 (= c!42773 ((_ is MissingVacant!1102) lt!127163))))

(declare-fun b!253594 () Bool)

(assert (=> b!253594 (= e!164400 ((_ is Undefined!1102) lt!127163))))

(declare-fun b!253595 () Bool)

(assert (=> b!253595 (= e!164399 (not call!23919))))

(assert (= (and d!61521 c!42772) b!253588))

(assert (= (and d!61521 (not c!42772)) b!253593))

(assert (= (and b!253588 res!124128) b!253591))

(assert (= (and b!253591 res!124126) b!253595))

(assert (= (and b!253593 c!42773) b!253592))

(assert (= (and b!253593 (not c!42773)) b!253594))

(assert (= (and b!253592 res!124129) b!253589))

(assert (= (and b!253589 res!124127) b!253590))

(assert (= (or b!253588 b!253592) bm!23916))

(assert (= (or b!253595 b!253590) bm!23917))

(assert (=> bm!23917 m!269351))

(assert (=> d!61521 m!269377))

(declare-fun m!269563 () Bool)

(assert (=> d!61521 m!269563))

(assert (=> d!61521 m!269349))

(declare-fun m!269565 () Bool)

(assert (=> b!253591 m!269565))

(declare-fun m!269567 () Bool)

(assert (=> bm!23916 m!269567))

(declare-fun m!269569 () Bool)

(assert (=> b!253589 m!269569))

(assert (=> b!253301 d!61521))

(declare-fun d!61523 () Bool)

(declare-fun res!124134 () Bool)

(declare-fun e!164406 () Bool)

(assert (=> d!61523 (=> res!124134 e!164406)))

(assert (=> d!61523 (= res!124134 (= (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61523 (= (arrayContainsKey!0 (_keys!6829 thiss!1504) key!932 #b00000000000000000000000000000000) e!164406)))

(declare-fun b!253600 () Bool)

(declare-fun e!164407 () Bool)

(assert (=> b!253600 (= e!164406 e!164407)))

(declare-fun res!124135 () Bool)

(assert (=> b!253600 (=> (not res!124135) (not e!164407))))

(assert (=> b!253600 (= res!124135 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6211 (_keys!6829 thiss!1504))))))

(declare-fun b!253601 () Bool)

(assert (=> b!253601 (= e!164407 (arrayContainsKey!0 (_keys!6829 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61523 (not res!124134)) b!253600))

(assert (= (and b!253600 res!124135) b!253601))

(assert (=> d!61523 m!269489))

(declare-fun m!269571 () Bool)

(assert (=> b!253601 m!269571))

(assert (=> bm!23874 d!61523))

(declare-fun d!61525 () Bool)

(assert (=> d!61525 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!253303 d!61525))

(declare-fun b!253614 () Bool)

(declare-fun e!164415 () SeekEntryResult!1102)

(declare-fun e!164416 () SeekEntryResult!1102)

(assert (=> b!253614 (= e!164415 e!164416)))

(declare-fun lt!127171 () (_ BitVec 64))

(declare-fun lt!127172 () SeekEntryResult!1102)

(assert (=> b!253614 (= lt!127171 (select (arr!5864 (_keys!6829 thiss!1504)) (index!6580 lt!127172)))))

(declare-fun c!42782 () Bool)

(assert (=> b!253614 (= c!42782 (= lt!127171 key!932))))

(declare-fun b!253615 () Bool)

(assert (=> b!253615 (= e!164416 (Found!1102 (index!6580 lt!127172)))))

(declare-fun d!61527 () Bool)

(declare-fun lt!127173 () SeekEntryResult!1102)

(assert (=> d!61527 (and (or ((_ is Undefined!1102) lt!127173) (not ((_ is Found!1102) lt!127173)) (and (bvsge (index!6579 lt!127173) #b00000000000000000000000000000000) (bvslt (index!6579 lt!127173) (size!6211 (_keys!6829 thiss!1504))))) (or ((_ is Undefined!1102) lt!127173) ((_ is Found!1102) lt!127173) (not ((_ is MissingZero!1102) lt!127173)) (and (bvsge (index!6578 lt!127173) #b00000000000000000000000000000000) (bvslt (index!6578 lt!127173) (size!6211 (_keys!6829 thiss!1504))))) (or ((_ is Undefined!1102) lt!127173) ((_ is Found!1102) lt!127173) ((_ is MissingZero!1102) lt!127173) (not ((_ is MissingVacant!1102) lt!127173)) (and (bvsge (index!6581 lt!127173) #b00000000000000000000000000000000) (bvslt (index!6581 lt!127173) (size!6211 (_keys!6829 thiss!1504))))) (or ((_ is Undefined!1102) lt!127173) (ite ((_ is Found!1102) lt!127173) (= (select (arr!5864 (_keys!6829 thiss!1504)) (index!6579 lt!127173)) key!932) (ite ((_ is MissingZero!1102) lt!127173) (= (select (arr!5864 (_keys!6829 thiss!1504)) (index!6578 lt!127173)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1102) lt!127173) (= (select (arr!5864 (_keys!6829 thiss!1504)) (index!6581 lt!127173)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61527 (= lt!127173 e!164415)))

(declare-fun c!42780 () Bool)

(assert (=> d!61527 (= c!42780 (and ((_ is Intermediate!1102) lt!127172) (undefined!1914 lt!127172)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12375 (_ BitVec 32)) SeekEntryResult!1102)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61527 (= lt!127172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10910 thiss!1504)) key!932 (_keys!6829 thiss!1504) (mask!10910 thiss!1504)))))

(assert (=> d!61527 (validMask!0 (mask!10910 thiss!1504))))

(assert (=> d!61527 (= (seekEntryOrOpen!0 key!932 (_keys!6829 thiss!1504) (mask!10910 thiss!1504)) lt!127173)))

(declare-fun e!164414 () SeekEntryResult!1102)

(declare-fun b!253616 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12375 (_ BitVec 32)) SeekEntryResult!1102)

(assert (=> b!253616 (= e!164414 (seekKeyOrZeroReturnVacant!0 (x!24776 lt!127172) (index!6580 lt!127172) (index!6580 lt!127172) key!932 (_keys!6829 thiss!1504) (mask!10910 thiss!1504)))))

(declare-fun b!253617 () Bool)

(assert (=> b!253617 (= e!164415 Undefined!1102)))

(declare-fun b!253618 () Bool)

(declare-fun c!42781 () Bool)

(assert (=> b!253618 (= c!42781 (= lt!127171 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253618 (= e!164416 e!164414)))

(declare-fun b!253619 () Bool)

(assert (=> b!253619 (= e!164414 (MissingZero!1102 (index!6580 lt!127172)))))

(assert (= (and d!61527 c!42780) b!253617))

(assert (= (and d!61527 (not c!42780)) b!253614))

(assert (= (and b!253614 c!42782) b!253615))

(assert (= (and b!253614 (not c!42782)) b!253618))

(assert (= (and b!253618 c!42781) b!253619))

(assert (= (and b!253618 (not c!42781)) b!253616))

(declare-fun m!269573 () Bool)

(assert (=> b!253614 m!269573))

(declare-fun m!269575 () Bool)

(assert (=> d!61527 m!269575))

(declare-fun m!269577 () Bool)

(assert (=> d!61527 m!269577))

(declare-fun m!269579 () Bool)

(assert (=> d!61527 m!269579))

(assert (=> d!61527 m!269349))

(declare-fun m!269581 () Bool)

(assert (=> d!61527 m!269581))

(declare-fun m!269583 () Bool)

(assert (=> d!61527 m!269583))

(assert (=> d!61527 m!269575))

(declare-fun m!269585 () Bool)

(assert (=> b!253616 m!269585))

(assert (=> b!253309 d!61527))

(declare-fun bm!23920 () Bool)

(declare-fun call!23923 () Bool)

(assert (=> bm!23920 (= call!23923 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6829 thiss!1504) (mask!10910 thiss!1504)))))

(declare-fun b!253628 () Bool)

(declare-fun e!164423 () Bool)

(assert (=> b!253628 (= e!164423 call!23923)))

(declare-fun b!253630 () Bool)

(declare-fun e!164424 () Bool)

(assert (=> b!253630 (= e!164424 e!164423)))

(declare-fun c!42785 () Bool)

(assert (=> b!253630 (= c!42785 (validKeyInArray!0 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253631 () Bool)

(declare-fun e!164425 () Bool)

(assert (=> b!253631 (= e!164423 e!164425)))

(declare-fun lt!127180 () (_ BitVec 64))

(assert (=> b!253631 (= lt!127180 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127181 () Unit!7805)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12375 (_ BitVec 64) (_ BitVec 32)) Unit!7805)

(assert (=> b!253631 (= lt!127181 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6829 thiss!1504) lt!127180 #b00000000000000000000000000000000))))

(assert (=> b!253631 (arrayContainsKey!0 (_keys!6829 thiss!1504) lt!127180 #b00000000000000000000000000000000)))

(declare-fun lt!127182 () Unit!7805)

(assert (=> b!253631 (= lt!127182 lt!127181)))

(declare-fun res!124140 () Bool)

(assert (=> b!253631 (= res!124140 (= (seekEntryOrOpen!0 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000) (_keys!6829 thiss!1504) (mask!10910 thiss!1504)) (Found!1102 #b00000000000000000000000000000000)))))

(assert (=> b!253631 (=> (not res!124140) (not e!164425))))

(declare-fun b!253629 () Bool)

(assert (=> b!253629 (= e!164425 call!23923)))

(declare-fun d!61529 () Bool)

(declare-fun res!124141 () Bool)

(assert (=> d!61529 (=> res!124141 e!164424)))

(assert (=> d!61529 (= res!124141 (bvsge #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))))))

(assert (=> d!61529 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6829 thiss!1504) (mask!10910 thiss!1504)) e!164424)))

(assert (= (and d!61529 (not res!124141)) b!253630))

(assert (= (and b!253630 c!42785) b!253631))

(assert (= (and b!253630 (not c!42785)) b!253628))

(assert (= (and b!253631 res!124140) b!253629))

(assert (= (or b!253629 b!253628) bm!23920))

(declare-fun m!269587 () Bool)

(assert (=> bm!23920 m!269587))

(assert (=> b!253630 m!269489))

(assert (=> b!253630 m!269489))

(assert (=> b!253630 m!269493))

(assert (=> b!253631 m!269489))

(declare-fun m!269589 () Bool)

(assert (=> b!253631 m!269589))

(declare-fun m!269591 () Bool)

(assert (=> b!253631 m!269591))

(assert (=> b!253631 m!269489))

(declare-fun m!269593 () Bool)

(assert (=> b!253631 m!269593))

(assert (=> b!253319 d!61529))

(declare-fun d!61531 () Bool)

(declare-fun e!164428 () Bool)

(assert (=> d!61531 e!164428))

(declare-fun res!124146 () Bool)

(assert (=> d!61531 (=> (not res!124146) (not e!164428))))

(declare-fun lt!127188 () SeekEntryResult!1102)

(assert (=> d!61531 (= res!124146 ((_ is Found!1102) lt!127188))))

(assert (=> d!61531 (= lt!127188 (seekEntryOrOpen!0 key!932 (_keys!6829 thiss!1504) (mask!10910 thiss!1504)))))

(declare-fun lt!127187 () Unit!7805)

(declare-fun choose!1218 (array!12375 array!12373 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) Int) Unit!7805)

(assert (=> d!61531 (= lt!127187 (choose!1218 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)))))

(assert (=> d!61531 (validMask!0 (mask!10910 thiss!1504))))

(assert (=> d!61531 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!403 (_keys!6829 thiss!1504) (_values!4660 thiss!1504) (mask!10910 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)) lt!127187)))

(declare-fun b!253636 () Bool)

(declare-fun res!124147 () Bool)

(assert (=> b!253636 (=> (not res!124147) (not e!164428))))

(assert (=> b!253636 (= res!124147 (inRange!0 (index!6579 lt!127188) (mask!10910 thiss!1504)))))

(declare-fun b!253637 () Bool)

(assert (=> b!253637 (= e!164428 (= (select (arr!5864 (_keys!6829 thiss!1504)) (index!6579 lt!127188)) key!932))))

(assert (=> b!253637 (and (bvsge (index!6579 lt!127188) #b00000000000000000000000000000000) (bvslt (index!6579 lt!127188) (size!6211 (_keys!6829 thiss!1504))))))

(assert (= (and d!61531 res!124146) b!253636))

(assert (= (and b!253636 res!124147) b!253637))

(assert (=> d!61531 m!269377))

(declare-fun m!269595 () Bool)

(assert (=> d!61531 m!269595))

(assert (=> d!61531 m!269349))

(declare-fun m!269597 () Bool)

(assert (=> b!253636 m!269597))

(declare-fun m!269599 () Bool)

(assert (=> b!253637 m!269599))

(assert (=> b!253299 d!61531))

(declare-fun e!164433 () Bool)

(declare-fun b!253649 () Bool)

(assert (=> b!253649 (= e!164433 (= (arrayCountValidKeys!0 (array!12376 (store (arr!5864 (_keys!6829 thiss!1504)) index!297 key!932) (size!6211 (_keys!6829 thiss!1504))) #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6829 thiss!1504) #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!253646 () Bool)

(declare-fun res!124159 () Bool)

(declare-fun e!164434 () Bool)

(assert (=> b!253646 (=> (not res!124159) (not e!164434))))

(assert (=> b!253646 (= res!124159 (not (validKeyInArray!0 (select (arr!5864 (_keys!6829 thiss!1504)) index!297))))))

(declare-fun b!253647 () Bool)

(declare-fun res!124158 () Bool)

(assert (=> b!253647 (=> (not res!124158) (not e!164434))))

(assert (=> b!253647 (= res!124158 (validKeyInArray!0 key!932))))

(declare-fun d!61533 () Bool)

(assert (=> d!61533 e!164433))

(declare-fun res!124156 () Bool)

(assert (=> d!61533 (=> (not res!124156) (not e!164433))))

(assert (=> d!61533 (= res!124156 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6211 (_keys!6829 thiss!1504)))))))

(declare-fun lt!127191 () Unit!7805)

(declare-fun choose!1 (array!12375 (_ BitVec 32) (_ BitVec 64)) Unit!7805)

(assert (=> d!61533 (= lt!127191 (choose!1 (_keys!6829 thiss!1504) index!297 key!932))))

(assert (=> d!61533 e!164434))

(declare-fun res!124157 () Bool)

(assert (=> d!61533 (=> (not res!124157) (not e!164434))))

(assert (=> d!61533 (= res!124157 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6211 (_keys!6829 thiss!1504)))))))

(assert (=> d!61533 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6829 thiss!1504) index!297 key!932) lt!127191)))

(declare-fun b!253648 () Bool)

(assert (=> b!253648 (= e!164434 (bvslt (size!6211 (_keys!6829 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!61533 res!124157) b!253646))

(assert (= (and b!253646 res!124159) b!253647))

(assert (= (and b!253647 res!124158) b!253648))

(assert (= (and d!61533 res!124156) b!253649))

(assert (=> b!253649 m!269363))

(declare-fun m!269601 () Bool)

(assert (=> b!253649 m!269601))

(assert (=> b!253649 m!269365))

(declare-fun m!269603 () Bool)

(assert (=> b!253646 m!269603))

(assert (=> b!253646 m!269603))

(declare-fun m!269605 () Bool)

(assert (=> b!253646 m!269605))

(assert (=> b!253647 m!269335))

(declare-fun m!269607 () Bool)

(assert (=> d!61533 m!269607))

(assert (=> b!253310 d!61533))

(declare-fun b!253658 () Bool)

(declare-fun e!164439 () (_ BitVec 32))

(assert (=> b!253658 (= e!164439 #b00000000000000000000000000000000)))

(declare-fun b!253659 () Bool)

(declare-fun e!164440 () (_ BitVec 32))

(declare-fun call!23926 () (_ BitVec 32))

(assert (=> b!253659 (= e!164440 (bvadd #b00000000000000000000000000000001 call!23926))))

(declare-fun b!253660 () Bool)

(assert (=> b!253660 (= e!164440 call!23926)))

(declare-fun d!61535 () Bool)

(declare-fun lt!127194 () (_ BitVec 32))

(assert (=> d!61535 (and (bvsge lt!127194 #b00000000000000000000000000000000) (bvsle lt!127194 (bvsub (size!6211 lt!127014) #b00000000000000000000000000000000)))))

(assert (=> d!61535 (= lt!127194 e!164439)))

(declare-fun c!42790 () Bool)

(assert (=> d!61535 (= c!42790 (bvsge #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))))))

(assert (=> d!61535 (and (bvsle #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6211 (_keys!6829 thiss!1504)) (size!6211 lt!127014)))))

(assert (=> d!61535 (= (arrayCountValidKeys!0 lt!127014 #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))) lt!127194)))

(declare-fun b!253661 () Bool)

(assert (=> b!253661 (= e!164439 e!164440)))

(declare-fun c!42791 () Bool)

(assert (=> b!253661 (= c!42791 (validKeyInArray!0 (select (arr!5864 lt!127014) #b00000000000000000000000000000000)))))

(declare-fun bm!23923 () Bool)

(assert (=> bm!23923 (= call!23926 (arrayCountValidKeys!0 lt!127014 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6211 (_keys!6829 thiss!1504))))))

(assert (= (and d!61535 c!42790) b!253658))

(assert (= (and d!61535 (not c!42790)) b!253661))

(assert (= (and b!253661 c!42791) b!253659))

(assert (= (and b!253661 (not c!42791)) b!253660))

(assert (= (or b!253659 b!253660) bm!23923))

(declare-fun m!269609 () Bool)

(assert (=> b!253661 m!269609))

(assert (=> b!253661 m!269609))

(declare-fun m!269611 () Bool)

(assert (=> b!253661 m!269611))

(declare-fun m!269613 () Bool)

(assert (=> bm!23923 m!269613))

(assert (=> b!253310 d!61535))

(declare-fun b!253662 () Bool)

(declare-fun e!164441 () (_ BitVec 32))

(assert (=> b!253662 (= e!164441 #b00000000000000000000000000000000)))

(declare-fun b!253663 () Bool)

(declare-fun e!164442 () (_ BitVec 32))

(declare-fun call!23927 () (_ BitVec 32))

(assert (=> b!253663 (= e!164442 (bvadd #b00000000000000000000000000000001 call!23927))))

(declare-fun b!253664 () Bool)

(assert (=> b!253664 (= e!164442 call!23927)))

(declare-fun d!61537 () Bool)

(declare-fun lt!127195 () (_ BitVec 32))

(assert (=> d!61537 (and (bvsge lt!127195 #b00000000000000000000000000000000) (bvsle lt!127195 (bvsub (size!6211 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61537 (= lt!127195 e!164441)))

(declare-fun c!42792 () Bool)

(assert (=> d!61537 (= c!42792 (bvsge #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))))))

(assert (=> d!61537 (and (bvsle #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6211 (_keys!6829 thiss!1504)) (size!6211 (_keys!6829 thiss!1504))))))

(assert (=> d!61537 (= (arrayCountValidKeys!0 (_keys!6829 thiss!1504) #b00000000000000000000000000000000 (size!6211 (_keys!6829 thiss!1504))) lt!127195)))

(declare-fun b!253665 () Bool)

(assert (=> b!253665 (= e!164441 e!164442)))

(declare-fun c!42793 () Bool)

(assert (=> b!253665 (= c!42793 (validKeyInArray!0 (select (arr!5864 (_keys!6829 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23924 () Bool)

(assert (=> bm!23924 (= call!23927 (arrayCountValidKeys!0 (_keys!6829 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6211 (_keys!6829 thiss!1504))))))

(assert (= (and d!61537 c!42792) b!253662))

(assert (= (and d!61537 (not c!42792)) b!253665))

(assert (= (and b!253665 c!42793) b!253663))

(assert (= (and b!253665 (not c!42793)) b!253664))

(assert (= (or b!253663 b!253664) bm!23924))

(assert (=> b!253665 m!269489))

(assert (=> b!253665 m!269489))

(assert (=> b!253665 m!269493))

(declare-fun m!269615 () Bool)

(assert (=> bm!23924 m!269615))

(assert (=> b!253310 d!61537))

(declare-fun d!61539 () Bool)

(assert (=> d!61539 (= (validMask!0 (mask!10910 thiss!1504)) (and (or (= (mask!10910 thiss!1504) #b00000000000000000000000000000111) (= (mask!10910 thiss!1504) #b00000000000000000000000000001111) (= (mask!10910 thiss!1504) #b00000000000000000000000000011111) (= (mask!10910 thiss!1504) #b00000000000000000000000000111111) (= (mask!10910 thiss!1504) #b00000000000000000000000001111111) (= (mask!10910 thiss!1504) #b00000000000000000000000011111111) (= (mask!10910 thiss!1504) #b00000000000000000000000111111111) (= (mask!10910 thiss!1504) #b00000000000000000000001111111111) (= (mask!10910 thiss!1504) #b00000000000000000000011111111111) (= (mask!10910 thiss!1504) #b00000000000000000000111111111111) (= (mask!10910 thiss!1504) #b00000000000000000001111111111111) (= (mask!10910 thiss!1504) #b00000000000000000011111111111111) (= (mask!10910 thiss!1504) #b00000000000000000111111111111111) (= (mask!10910 thiss!1504) #b00000000000000001111111111111111) (= (mask!10910 thiss!1504) #b00000000000000011111111111111111) (= (mask!10910 thiss!1504) #b00000000000000111111111111111111) (= (mask!10910 thiss!1504) #b00000000000001111111111111111111) (= (mask!10910 thiss!1504) #b00000000000011111111111111111111) (= (mask!10910 thiss!1504) #b00000000000111111111111111111111) (= (mask!10910 thiss!1504) #b00000000001111111111111111111111) (= (mask!10910 thiss!1504) #b00000000011111111111111111111111) (= (mask!10910 thiss!1504) #b00000000111111111111111111111111) (= (mask!10910 thiss!1504) #b00000001111111111111111111111111) (= (mask!10910 thiss!1504) #b00000011111111111111111111111111) (= (mask!10910 thiss!1504) #b00000111111111111111111111111111) (= (mask!10910 thiss!1504) #b00001111111111111111111111111111) (= (mask!10910 thiss!1504) #b00011111111111111111111111111111) (= (mask!10910 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10910 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!253310 d!61539))

(declare-fun bm!23925 () Bool)

(declare-fun call!23928 () Bool)

(assert (=> bm!23925 (= call!23928 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!127014 (mask!10910 thiss!1504)))))

(declare-fun b!253666 () Bool)

(declare-fun e!164443 () Bool)

(assert (=> b!253666 (= e!164443 call!23928)))

(declare-fun b!253668 () Bool)

(declare-fun e!164444 () Bool)

(assert (=> b!253668 (= e!164444 e!164443)))

(declare-fun c!42794 () Bool)

(assert (=> b!253668 (= c!42794 (validKeyInArray!0 (select (arr!5864 lt!127014) #b00000000000000000000000000000000)))))

(declare-fun b!253669 () Bool)

(declare-fun e!164445 () Bool)

(assert (=> b!253669 (= e!164443 e!164445)))

(declare-fun lt!127196 () (_ BitVec 64))

(assert (=> b!253669 (= lt!127196 (select (arr!5864 lt!127014) #b00000000000000000000000000000000))))

(declare-fun lt!127197 () Unit!7805)

(assert (=> b!253669 (= lt!127197 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!127014 lt!127196 #b00000000000000000000000000000000))))

(assert (=> b!253669 (arrayContainsKey!0 lt!127014 lt!127196 #b00000000000000000000000000000000)))

(declare-fun lt!127198 () Unit!7805)

(assert (=> b!253669 (= lt!127198 lt!127197)))

(declare-fun res!124160 () Bool)

(assert (=> b!253669 (= res!124160 (= (seekEntryOrOpen!0 (select (arr!5864 lt!127014) #b00000000000000000000000000000000) lt!127014 (mask!10910 thiss!1504)) (Found!1102 #b00000000000000000000000000000000)))))

(assert (=> b!253669 (=> (not res!124160) (not e!164445))))

(declare-fun b!253667 () Bool)

(assert (=> b!253667 (= e!164445 call!23928)))

(declare-fun d!61541 () Bool)

(declare-fun res!124161 () Bool)

(assert (=> d!61541 (=> res!124161 e!164444)))

(assert (=> d!61541 (= res!124161 (bvsge #b00000000000000000000000000000000 (size!6211 lt!127014)))))

(assert (=> d!61541 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127014 (mask!10910 thiss!1504)) e!164444)))

(assert (= (and d!61541 (not res!124161)) b!253668))

(assert (= (and b!253668 c!42794) b!253669))

(assert (= (and b!253668 (not c!42794)) b!253666))

(assert (= (and b!253669 res!124160) b!253667))

(assert (= (or b!253667 b!253666) bm!23925))

(declare-fun m!269617 () Bool)

(assert (=> bm!23925 m!269617))

(assert (=> b!253668 m!269609))

(assert (=> b!253668 m!269609))

(assert (=> b!253668 m!269611))

(assert (=> b!253669 m!269609))

(declare-fun m!269619 () Bool)

(assert (=> b!253669 m!269619))

(declare-fun m!269621 () Bool)

(assert (=> b!253669 m!269621))

(assert (=> b!253669 m!269609))

(declare-fun m!269623 () Bool)

(assert (=> b!253669 m!269623))

(assert (=> b!253310 d!61541))

(declare-fun bm!23926 () Bool)

(declare-fun call!23929 () Bool)

(declare-fun c!42795 () Bool)

(assert (=> bm!23926 (= call!23929 (arrayNoDuplicates!0 lt!127014 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42795 (Cons!3658 (select (arr!5864 lt!127014) #b00000000000000000000000000000000) Nil!3659) Nil!3659)))))

(declare-fun b!253670 () Bool)

(declare-fun e!164447 () Bool)

(declare-fun e!164449 () Bool)

(assert (=> b!253670 (= e!164447 e!164449)))

(declare-fun res!124163 () Bool)

(assert (=> b!253670 (=> (not res!124163) (not e!164449))))

(declare-fun e!164446 () Bool)

(assert (=> b!253670 (= res!124163 (not e!164446))))

(declare-fun res!124164 () Bool)

(assert (=> b!253670 (=> (not res!124164) (not e!164446))))

(assert (=> b!253670 (= res!124164 (validKeyInArray!0 (select (arr!5864 lt!127014) #b00000000000000000000000000000000)))))

(declare-fun b!253671 () Bool)

(assert (=> b!253671 (= e!164446 (contains!1812 Nil!3659 (select (arr!5864 lt!127014) #b00000000000000000000000000000000)))))

(declare-fun b!253672 () Bool)

(declare-fun e!164448 () Bool)

(assert (=> b!253672 (= e!164448 call!23929)))

(declare-fun b!253673 () Bool)

(assert (=> b!253673 (= e!164448 call!23929)))

(declare-fun d!61543 () Bool)

(declare-fun res!124162 () Bool)

(assert (=> d!61543 (=> res!124162 e!164447)))

(assert (=> d!61543 (= res!124162 (bvsge #b00000000000000000000000000000000 (size!6211 lt!127014)))))

(assert (=> d!61543 (= (arrayNoDuplicates!0 lt!127014 #b00000000000000000000000000000000 Nil!3659) e!164447)))

(declare-fun b!253674 () Bool)

(assert (=> b!253674 (= e!164449 e!164448)))

(assert (=> b!253674 (= c!42795 (validKeyInArray!0 (select (arr!5864 lt!127014) #b00000000000000000000000000000000)))))

(assert (= (and d!61543 (not res!124162)) b!253670))

(assert (= (and b!253670 res!124164) b!253671))

(assert (= (and b!253670 res!124163) b!253674))

(assert (= (and b!253674 c!42795) b!253672))

(assert (= (and b!253674 (not c!42795)) b!253673))

(assert (= (or b!253672 b!253673) bm!23926))

(assert (=> bm!23926 m!269609))

(declare-fun m!269625 () Bool)

(assert (=> bm!23926 m!269625))

(assert (=> b!253670 m!269609))

(assert (=> b!253670 m!269609))

(assert (=> b!253670 m!269611))

(assert (=> b!253671 m!269609))

(assert (=> b!253671 m!269609))

(declare-fun m!269627 () Bool)

(assert (=> b!253671 m!269627))

(assert (=> b!253674 m!269609))

(assert (=> b!253674 m!269609))

(assert (=> b!253674 m!269611))

(assert (=> b!253310 d!61543))

(declare-fun d!61545 () Bool)

(declare-fun e!164452 () Bool)

(assert (=> d!61545 e!164452))

(declare-fun res!124167 () Bool)

(assert (=> d!61545 (=> (not res!124167) (not e!164452))))

(assert (=> d!61545 (= res!124167 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6211 (_keys!6829 thiss!1504)))))))

(declare-fun lt!127201 () Unit!7805)

(declare-fun choose!41 (array!12375 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3662) Unit!7805)

(assert (=> d!61545 (= lt!127201 (choose!41 (_keys!6829 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3659))))

(assert (=> d!61545 (bvslt (size!6211 (_keys!6829 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61545 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6829 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3659) lt!127201)))

(declare-fun b!253677 () Bool)

(assert (=> b!253677 (= e!164452 (arrayNoDuplicates!0 (array!12376 (store (arr!5864 (_keys!6829 thiss!1504)) index!297 key!932) (size!6211 (_keys!6829 thiss!1504))) #b00000000000000000000000000000000 Nil!3659))))

(assert (= (and d!61545 res!124167) b!253677))

(declare-fun m!269629 () Bool)

(assert (=> d!61545 m!269629))

(assert (=> b!253677 m!269363))

(declare-fun m!269631 () Bool)

(assert (=> b!253677 m!269631))

(assert (=> b!253310 d!61545))

(assert (=> b!253310 d!61523))

(declare-fun d!61547 () Bool)

(declare-fun e!164455 () Bool)

(assert (=> d!61547 e!164455))

(declare-fun res!124170 () Bool)

(assert (=> d!61547 (=> (not res!124170) (not e!164455))))

(assert (=> d!61547 (= res!124170 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6211 (_keys!6829 thiss!1504)))))))

(declare-fun lt!127204 () Unit!7805)

(declare-fun choose!102 ((_ BitVec 64) array!12375 (_ BitVec 32) (_ BitVec 32)) Unit!7805)

(assert (=> d!61547 (= lt!127204 (choose!102 key!932 (_keys!6829 thiss!1504) index!297 (mask!10910 thiss!1504)))))

(assert (=> d!61547 (validMask!0 (mask!10910 thiss!1504))))

(assert (=> d!61547 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6829 thiss!1504) index!297 (mask!10910 thiss!1504)) lt!127204)))

(declare-fun b!253680 () Bool)

(assert (=> b!253680 (= e!164455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12376 (store (arr!5864 (_keys!6829 thiss!1504)) index!297 key!932) (size!6211 (_keys!6829 thiss!1504))) (mask!10910 thiss!1504)))))

(assert (= (and d!61547 res!124170) b!253680))

(declare-fun m!269633 () Bool)

(assert (=> d!61547 m!269633))

(assert (=> d!61547 m!269349))

(assert (=> b!253680 m!269363))

(declare-fun m!269635 () Bool)

(assert (=> b!253680 m!269635))

(assert (=> b!253310 d!61547))

(declare-fun b!253688 () Bool)

(declare-fun e!164460 () Bool)

(assert (=> b!253688 (= e!164460 tp_is_empty!6523)))

(declare-fun b!253687 () Bool)

(declare-fun e!164461 () Bool)

(assert (=> b!253687 (= e!164461 tp_is_empty!6523)))

(declare-fun mapIsEmpty!11106 () Bool)

(declare-fun mapRes!11106 () Bool)

(assert (=> mapIsEmpty!11106 mapRes!11106))

(declare-fun condMapEmpty!11106 () Bool)

(declare-fun mapDefault!11106 () ValueCell!2918)

(assert (=> mapNonEmpty!11097 (= condMapEmpty!11106 (= mapRest!11097 ((as const (Array (_ BitVec 32) ValueCell!2918)) mapDefault!11106)))))

(assert (=> mapNonEmpty!11097 (= tp!23267 (and e!164460 mapRes!11106))))

(declare-fun mapNonEmpty!11106 () Bool)

(declare-fun tp!23283 () Bool)

(assert (=> mapNonEmpty!11106 (= mapRes!11106 (and tp!23283 e!164461))))

(declare-fun mapRest!11106 () (Array (_ BitVec 32) ValueCell!2918))

(declare-fun mapValue!11106 () ValueCell!2918)

(declare-fun mapKey!11106 () (_ BitVec 32))

(assert (=> mapNonEmpty!11106 (= mapRest!11097 (store mapRest!11106 mapKey!11106 mapValue!11106))))

(assert (= (and mapNonEmpty!11097 condMapEmpty!11106) mapIsEmpty!11106))

(assert (= (and mapNonEmpty!11097 (not condMapEmpty!11106)) mapNonEmpty!11106))

(assert (= (and mapNonEmpty!11106 ((_ is ValueCellFull!2918) mapValue!11106)) b!253687))

(assert (= (and mapNonEmpty!11097 ((_ is ValueCellFull!2918) mapDefault!11106)) b!253688))

(declare-fun m!269637 () Bool)

(assert (=> mapNonEmpty!11106 m!269637))

(declare-fun b_lambda!8151 () Bool)

(assert (= b_lambda!8149 (or (and b!253318 b_free!6661) b_lambda!8151)))

(check-sat (not b!253674) (not bm!23908) (not bm!23926) (not b!253631) (not b!253556) (not b!253677) (not b!253680) (not b!253570) (not b!253616) (not b!253647) (not d!61527) (not bm!23920) (not b!253630) (not b!253544) (not b!253542) (not b!253571) (not bm!23923) (not b!253670) (not b!253488) (not b!253636) tp_is_empty!6523 (not b!253550) (not b!253665) (not b!253601) (not b_next!6661) (not b!253495) (not bm!23924) (not b!253649) (not d!61545) (not d!61511) (not bm!23907) (not b!253497) (not bm!23906) (not d!61513) (not b!253671) (not b!253559) (not b!253661) (not b!253484) (not d!61531) (not d!61533) (not b!253646) b_and!13721 (not mapNonEmpty!11106) (not b!253546) (not bm!23890) (not b!253569) (not b!253549) (not b_lambda!8151) (not d!61547) (not b!253485) (not b!253668) (not d!61519) (not b!253552) (not bm!23917) (not b!253669) (not bm!23910) (not d!61517) (not bm!23916) (not bm!23925) (not d!61521))
(check-sat b_and!13721 (not b_next!6661))
