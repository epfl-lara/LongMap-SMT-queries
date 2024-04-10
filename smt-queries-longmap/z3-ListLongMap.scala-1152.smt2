; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24224 () Bool)

(assert start!24224)

(declare-fun b!253332 () Bool)

(declare-fun b_free!6663 () Bool)

(declare-fun b_next!6663 () Bool)

(assert (=> b!253332 (= b_free!6663 (not b_next!6663))))

(declare-fun tp!23273 () Bool)

(declare-fun b_and!13703 () Bool)

(assert (=> b!253332 (= tp!23273 b_and!13703)))

(declare-fun b!253327 () Bool)

(declare-fun res!124003 () Bool)

(declare-fun e!164248 () Bool)

(assert (=> b!253327 (=> res!124003 e!164248)))

(declare-datatypes ((V!8347 0))(
  ( (V!8348 (val!3307 Int)) )
))
(declare-datatypes ((ValueCell!2919 0))(
  ( (ValueCellFull!2919 (v!5380 V!8347)) (EmptyCell!2919) )
))
(declare-datatypes ((array!12379 0))(
  ( (array!12380 (arr!5866 (Array (_ BitVec 32) ValueCell!2919)) (size!6213 (_ BitVec 32))) )
))
(declare-datatypes ((array!12381 0))(
  ( (array!12382 (arr!5867 (Array (_ BitVec 32) (_ BitVec 64))) (size!6214 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3738 0))(
  ( (LongMapFixedSize!3739 (defaultEntry!4678 Int) (mask!10911 (_ BitVec 32)) (extraKeys!4415 (_ BitVec 32)) (zeroValue!4519 V!8347) (minValue!4519 V!8347) (_size!1918 (_ BitVec 32)) (_keys!6830 array!12381) (_values!4661 array!12379) (_vacant!1918 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3738)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12381 (_ BitVec 32)) Bool)

(assert (=> b!253327 (= res!124003 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6830 thiss!1504) (mask!10911 thiss!1504))))))

(declare-fun b!253328 () Bool)

(declare-datatypes ((Unit!7841 0))(
  ( (Unit!7842) )
))
(declare-fun e!164250 () Unit!7841)

(declare-fun lt!126982 () Unit!7841)

(assert (=> b!253328 (= e!164250 lt!126982)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!414 (array!12381 array!12379 (_ BitVec 32) (_ BitVec 32) V!8347 V!8347 (_ BitVec 64) Int) Unit!7841)

(assert (=> b!253328 (= lt!126982 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!414 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) key!932 (defaultEntry!4678 thiss!1504)))))

(declare-fun c!42716 () Bool)

(declare-datatypes ((SeekEntryResult!1139 0))(
  ( (MissingZero!1139 (index!6726 (_ BitVec 32))) (Found!1139 (index!6727 (_ BitVec 32))) (Intermediate!1139 (undefined!1951 Bool) (index!6728 (_ BitVec 32)) (x!24813 (_ BitVec 32))) (Undefined!1139) (MissingVacant!1139 (index!6729 (_ BitVec 32))) )
))
(declare-fun lt!126986 () SeekEntryResult!1139)

(get-info :version)

(assert (=> b!253328 (= c!42716 ((_ is MissingZero!1139) lt!126986))))

(declare-fun e!164258 () Bool)

(assert (=> b!253328 e!164258))

(declare-fun b!253329 () Bool)

(declare-fun e!164257 () Bool)

(declare-fun call!23895 () Bool)

(assert (=> b!253329 (= e!164257 (not call!23895))))

(declare-fun b!253330 () Bool)

(declare-fun res!123998 () Bool)

(assert (=> b!253330 (=> (not res!123998) (not e!164257))))

(assert (=> b!253330 (= res!123998 (= (select (arr!5867 (_keys!6830 thiss!1504)) (index!6726 lt!126986)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23892 () Bool)

(declare-fun call!23896 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23892 (= call!23896 (inRange!0 (ite c!42716 (index!6726 lt!126986) (index!6729 lt!126986)) (mask!10911 thiss!1504)))))

(declare-fun b!253331 () Bool)

(declare-fun e!164253 () Bool)

(declare-fun e!164256 () Bool)

(assert (=> b!253331 (= e!164253 e!164256)))

(declare-fun res!123997 () Bool)

(assert (=> b!253331 (= res!123997 call!23896)))

(assert (=> b!253331 (=> (not res!123997) (not e!164256))))

(declare-fun bm!23893 () Bool)

(declare-fun arrayContainsKey!0 (array!12381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23893 (= call!23895 (arrayContainsKey!0 (_keys!6830 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253333 () Bool)

(declare-fun res!124000 () Bool)

(assert (=> b!253333 (=> res!124000 e!164248)))

(assert (=> b!253333 (= res!124000 (or (not (= (size!6213 (_values!4661 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10911 thiss!1504)))) (not (= (size!6214 (_keys!6830 thiss!1504)) (size!6213 (_values!4661 thiss!1504)))) (bvslt (mask!10911 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4415 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4415 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!253334 () Bool)

(declare-fun e!164260 () Unit!7841)

(declare-fun Unit!7843 () Unit!7841)

(assert (=> b!253334 (= e!164260 Unit!7843)))

(declare-fun b!253335 () Bool)

(assert (=> b!253335 (= e!164256 (not call!23895))))

(declare-fun b!253336 () Bool)

(declare-fun Unit!7844 () Unit!7841)

(assert (=> b!253336 (= e!164260 Unit!7844)))

(declare-fun lt!126980 () Unit!7841)

(declare-fun lemmaArrayContainsKeyThenInListMap!215 (array!12381 array!12379 (_ BitVec 32) (_ BitVec 32) V!8347 V!8347 (_ BitVec 64) (_ BitVec 32) Int) Unit!7841)

(assert (=> b!253336 (= lt!126980 (lemmaArrayContainsKeyThenInListMap!215 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)))))

(assert (=> b!253336 false))

(declare-fun b!253337 () Bool)

(assert (=> b!253337 (= e!164253 ((_ is Undefined!1139) lt!126986))))

(declare-fun mapIsEmpty!11100 () Bool)

(declare-fun mapRes!11100 () Bool)

(assert (=> mapIsEmpty!11100 mapRes!11100))

(declare-fun b!253338 () Bool)

(declare-fun res!123999 () Bool)

(assert (=> b!253338 (=> (not res!123999) (not e!164257))))

(assert (=> b!253338 (= res!123999 call!23896)))

(assert (=> b!253338 (= e!164258 e!164257)))

(declare-fun mapNonEmpty!11100 () Bool)

(declare-fun tp!23274 () Bool)

(declare-fun e!164255 () Bool)

(assert (=> mapNonEmpty!11100 (= mapRes!11100 (and tp!23274 e!164255))))

(declare-fun mapRest!11100 () (Array (_ BitVec 32) ValueCell!2919))

(declare-fun mapKey!11100 () (_ BitVec 32))

(declare-fun mapValue!11100 () ValueCell!2919)

(assert (=> mapNonEmpty!11100 (= (arr!5866 (_values!4661 thiss!1504)) (store mapRest!11100 mapKey!11100 mapValue!11100))))

(declare-fun b!253339 () Bool)

(declare-fun e!164254 () Bool)

(declare-fun e!164252 () Bool)

(assert (=> b!253339 (= e!164254 e!164252)))

(declare-fun res!124005 () Bool)

(assert (=> b!253339 (=> (not res!124005) (not e!164252))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!253339 (= res!124005 (inRange!0 index!297 (mask!10911 thiss!1504)))))

(declare-fun lt!126984 () Unit!7841)

(assert (=> b!253339 (= lt!126984 e!164250)))

(declare-fun c!42715 () Bool)

(declare-datatypes ((tuple2!4870 0))(
  ( (tuple2!4871 (_1!2446 (_ BitVec 64)) (_2!2446 V!8347)) )
))
(declare-datatypes ((List!3751 0))(
  ( (Nil!3748) (Cons!3747 (h!4409 tuple2!4870) (t!8796 List!3751)) )
))
(declare-datatypes ((ListLongMap!3783 0))(
  ( (ListLongMap!3784 (toList!1907 List!3751)) )
))
(declare-fun contains!1836 (ListLongMap!3783 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1435 (array!12381 array!12379 (_ BitVec 32) (_ BitVec 32) V!8347 V!8347 (_ BitVec 32) Int) ListLongMap!3783)

(assert (=> b!253339 (= c!42715 (contains!1836 (getCurrentListMap!1435 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)) key!932))))

(declare-fun b!253340 () Bool)

(assert (=> b!253340 (= e!164252 (not e!164248))))

(declare-fun res!124006 () Bool)

(assert (=> b!253340 (=> res!124006 e!164248)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!253340 (= res!124006 (not (validMask!0 (mask!10911 thiss!1504))))))

(declare-fun lt!126979 () array!12381)

(assert (=> b!253340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126979 (mask!10911 thiss!1504))))

(declare-fun lt!126985 () Unit!7841)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12381 (_ BitVec 32) (_ BitVec 32)) Unit!7841)

(assert (=> b!253340 (= lt!126985 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6830 thiss!1504) index!297 (mask!10911 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12381 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!253340 (= (arrayCountValidKeys!0 lt!126979 #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6830 thiss!1504) #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504)))))))

(declare-fun lt!126981 () Unit!7841)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12381 (_ BitVec 32) (_ BitVec 64)) Unit!7841)

(assert (=> b!253340 (= lt!126981 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6830 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3752 0))(
  ( (Nil!3749) (Cons!3748 (h!4410 (_ BitVec 64)) (t!8797 List!3752)) )
))
(declare-fun arrayNoDuplicates!0 (array!12381 (_ BitVec 32) List!3752) Bool)

(assert (=> b!253340 (arrayNoDuplicates!0 lt!126979 #b00000000000000000000000000000000 Nil!3749)))

(assert (=> b!253340 (= lt!126979 (array!12382 (store (arr!5867 (_keys!6830 thiss!1504)) index!297 key!932) (size!6214 (_keys!6830 thiss!1504))))))

(declare-fun lt!126988 () Unit!7841)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12381 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3752) Unit!7841)

(assert (=> b!253340 (= lt!126988 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6830 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3749))))

(declare-fun lt!126983 () Unit!7841)

(assert (=> b!253340 (= lt!126983 e!164260)))

(declare-fun c!42718 () Bool)

(assert (=> b!253340 (= c!42718 (arrayContainsKey!0 (_keys!6830 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253341 () Bool)

(declare-fun res!124004 () Bool)

(assert (=> b!253341 (=> res!124004 e!164248)))

(assert (=> b!253341 (= res!124004 (not (arrayNoDuplicates!0 (_keys!6830 thiss!1504) #b00000000000000000000000000000000 Nil!3749)))))

(declare-fun b!253342 () Bool)

(declare-fun res!124008 () Bool)

(declare-fun e!164247 () Bool)

(assert (=> b!253342 (=> (not res!124008) (not e!164247))))

(assert (=> b!253342 (= res!124008 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!253343 () Bool)

(declare-fun Unit!7845 () Unit!7841)

(assert (=> b!253343 (= e!164250 Unit!7845)))

(declare-fun lt!126987 () Unit!7841)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!409 (array!12381 array!12379 (_ BitVec 32) (_ BitVec 32) V!8347 V!8347 (_ BitVec 64) Int) Unit!7841)

(assert (=> b!253343 (= lt!126987 (lemmaInListMapThenSeekEntryOrOpenFindsIt!409 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) key!932 (defaultEntry!4678 thiss!1504)))))

(assert (=> b!253343 false))

(declare-fun b!253344 () Bool)

(declare-fun e!164251 () Bool)

(declare-fun e!164259 () Bool)

(assert (=> b!253344 (= e!164251 (and e!164259 mapRes!11100))))

(declare-fun condMapEmpty!11100 () Bool)

(declare-fun mapDefault!11100 () ValueCell!2919)

(assert (=> b!253344 (= condMapEmpty!11100 (= (arr!5866 (_values!4661 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2919)) mapDefault!11100)))))

(declare-fun b!253345 () Bool)

(declare-fun tp_is_empty!6525 () Bool)

(assert (=> b!253345 (= e!164259 tp_is_empty!6525)))

(declare-fun b!253346 () Bool)

(declare-fun c!42717 () Bool)

(assert (=> b!253346 (= c!42717 ((_ is MissingVacant!1139) lt!126986))))

(assert (=> b!253346 (= e!164258 e!164253)))

(declare-fun b!253347 () Bool)

(assert (=> b!253347 (= e!164255 tp_is_empty!6525)))

(declare-fun b!253348 () Bool)

(assert (=> b!253348 (= e!164247 e!164254)))

(declare-fun res!124001 () Bool)

(assert (=> b!253348 (=> (not res!124001) (not e!164254))))

(assert (=> b!253348 (= res!124001 (or (= lt!126986 (MissingZero!1139 index!297)) (= lt!126986 (MissingVacant!1139 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12381 (_ BitVec 32)) SeekEntryResult!1139)

(assert (=> b!253348 (= lt!126986 (seekEntryOrOpen!0 key!932 (_keys!6830 thiss!1504) (mask!10911 thiss!1504)))))

(declare-fun b!253349 () Bool)

(declare-fun res!124007 () Bool)

(assert (=> b!253349 (=> res!124007 e!164248)))

(assert (=> b!253349 (= res!124007 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6214 (_keys!6830 thiss!1504)))))))

(declare-fun b!253350 () Bool)

(declare-fun res!124002 () Bool)

(assert (=> b!253350 (= res!124002 (= (select (arr!5867 (_keys!6830 thiss!1504)) (index!6729 lt!126986)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253350 (=> (not res!124002) (not e!164256))))

(declare-fun b!253351 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253351 (= e!164248 (validKeyInArray!0 key!932))))

(declare-fun e!164249 () Bool)

(declare-fun array_inv!3881 (array!12381) Bool)

(declare-fun array_inv!3882 (array!12379) Bool)

(assert (=> b!253332 (= e!164249 (and tp!23273 tp_is_empty!6525 (array_inv!3881 (_keys!6830 thiss!1504)) (array_inv!3882 (_values!4661 thiss!1504)) e!164251))))

(declare-fun res!124009 () Bool)

(assert (=> start!24224 (=> (not res!124009) (not e!164247))))

(declare-fun valid!1463 (LongMapFixedSize!3738) Bool)

(assert (=> start!24224 (= res!124009 (valid!1463 thiss!1504))))

(assert (=> start!24224 e!164247))

(assert (=> start!24224 e!164249))

(assert (=> start!24224 true))

(assert (= (and start!24224 res!124009) b!253342))

(assert (= (and b!253342 res!124008) b!253348))

(assert (= (and b!253348 res!124001) b!253339))

(assert (= (and b!253339 c!42715) b!253343))

(assert (= (and b!253339 (not c!42715)) b!253328))

(assert (= (and b!253328 c!42716) b!253338))

(assert (= (and b!253328 (not c!42716)) b!253346))

(assert (= (and b!253338 res!123999) b!253330))

(assert (= (and b!253330 res!123998) b!253329))

(assert (= (and b!253346 c!42717) b!253331))

(assert (= (and b!253346 (not c!42717)) b!253337))

(assert (= (and b!253331 res!123997) b!253350))

(assert (= (and b!253350 res!124002) b!253335))

(assert (= (or b!253338 b!253331) bm!23892))

(assert (= (or b!253329 b!253335) bm!23893))

(assert (= (and b!253339 res!124005) b!253340))

(assert (= (and b!253340 c!42718) b!253336))

(assert (= (and b!253340 (not c!42718)) b!253334))

(assert (= (and b!253340 (not res!124006)) b!253333))

(assert (= (and b!253333 (not res!124000)) b!253327))

(assert (= (and b!253327 (not res!124003)) b!253341))

(assert (= (and b!253341 (not res!124004)) b!253349))

(assert (= (and b!253349 (not res!124007)) b!253351))

(assert (= (and b!253344 condMapEmpty!11100) mapIsEmpty!11100))

(assert (= (and b!253344 (not condMapEmpty!11100)) mapNonEmpty!11100))

(assert (= (and mapNonEmpty!11100 ((_ is ValueCellFull!2919) mapValue!11100)) b!253347))

(assert (= (and b!253344 ((_ is ValueCellFull!2919) mapDefault!11100)) b!253345))

(assert (= b!253332 b!253344))

(assert (= start!24224 b!253332))

(declare-fun m!269199 () Bool)

(assert (=> b!253350 m!269199))

(declare-fun m!269201 () Bool)

(assert (=> b!253328 m!269201))

(declare-fun m!269203 () Bool)

(assert (=> bm!23892 m!269203))

(declare-fun m!269205 () Bool)

(assert (=> b!253341 m!269205))

(declare-fun m!269207 () Bool)

(assert (=> b!253339 m!269207))

(declare-fun m!269209 () Bool)

(assert (=> b!253339 m!269209))

(assert (=> b!253339 m!269209))

(declare-fun m!269211 () Bool)

(assert (=> b!253339 m!269211))

(declare-fun m!269213 () Bool)

(assert (=> b!253327 m!269213))

(declare-fun m!269215 () Bool)

(assert (=> b!253330 m!269215))

(declare-fun m!269217 () Bool)

(assert (=> b!253343 m!269217))

(declare-fun m!269219 () Bool)

(assert (=> b!253332 m!269219))

(declare-fun m!269221 () Bool)

(assert (=> b!253332 m!269221))

(declare-fun m!269223 () Bool)

(assert (=> start!24224 m!269223))

(declare-fun m!269225 () Bool)

(assert (=> mapNonEmpty!11100 m!269225))

(declare-fun m!269227 () Bool)

(assert (=> b!253340 m!269227))

(declare-fun m!269229 () Bool)

(assert (=> b!253340 m!269229))

(declare-fun m!269231 () Bool)

(assert (=> b!253340 m!269231))

(declare-fun m!269233 () Bool)

(assert (=> b!253340 m!269233))

(declare-fun m!269235 () Bool)

(assert (=> b!253340 m!269235))

(declare-fun m!269237 () Bool)

(assert (=> b!253340 m!269237))

(declare-fun m!269239 () Bool)

(assert (=> b!253340 m!269239))

(declare-fun m!269241 () Bool)

(assert (=> b!253340 m!269241))

(declare-fun m!269243 () Bool)

(assert (=> b!253340 m!269243))

(declare-fun m!269245 () Bool)

(assert (=> b!253340 m!269245))

(declare-fun m!269247 () Bool)

(assert (=> b!253336 m!269247))

(declare-fun m!269249 () Bool)

(assert (=> b!253351 m!269249))

(declare-fun m!269251 () Bool)

(assert (=> b!253348 m!269251))

(assert (=> bm!23893 m!269229))

(check-sat (not b!253327) (not b!253336) (not b!253348) (not b!253328) (not b!253332) b_and!13703 (not bm!23893) (not bm!23892) (not mapNonEmpty!11100) (not b_next!6663) tp_is_empty!6525 (not b!253343) (not b!253339) (not start!24224) (not b!253341) (not b!253351) (not b!253340))
(check-sat b_and!13703 (not b_next!6663))
(get-model)

(declare-fun d!61429 () Bool)

(declare-fun e!164308 () Bool)

(assert (=> d!61429 e!164308))

(declare-fun res!124054 () Bool)

(assert (=> d!61429 (=> (not res!124054) (not e!164308))))

(declare-fun lt!127024 () SeekEntryResult!1139)

(assert (=> d!61429 (= res!124054 ((_ is Found!1139) lt!127024))))

(assert (=> d!61429 (= lt!127024 (seekEntryOrOpen!0 key!932 (_keys!6830 thiss!1504) (mask!10911 thiss!1504)))))

(declare-fun lt!127023 () Unit!7841)

(declare-fun choose!1209 (array!12381 array!12379 (_ BitVec 32) (_ BitVec 32) V!8347 V!8347 (_ BitVec 64) Int) Unit!7841)

(assert (=> d!61429 (= lt!127023 (choose!1209 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) key!932 (defaultEntry!4678 thiss!1504)))))

(assert (=> d!61429 (validMask!0 (mask!10911 thiss!1504))))

(assert (=> d!61429 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!409 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) key!932 (defaultEntry!4678 thiss!1504)) lt!127023)))

(declare-fun b!253431 () Bool)

(declare-fun res!124053 () Bool)

(assert (=> b!253431 (=> (not res!124053) (not e!164308))))

(assert (=> b!253431 (= res!124053 (inRange!0 (index!6727 lt!127024) (mask!10911 thiss!1504)))))

(declare-fun b!253432 () Bool)

(assert (=> b!253432 (= e!164308 (= (select (arr!5867 (_keys!6830 thiss!1504)) (index!6727 lt!127024)) key!932))))

(assert (=> b!253432 (and (bvsge (index!6727 lt!127024) #b00000000000000000000000000000000) (bvslt (index!6727 lt!127024) (size!6214 (_keys!6830 thiss!1504))))))

(assert (= (and d!61429 res!124054) b!253431))

(assert (= (and b!253431 res!124053) b!253432))

(assert (=> d!61429 m!269251))

(declare-fun m!269307 () Bool)

(assert (=> d!61429 m!269307))

(assert (=> d!61429 m!269227))

(declare-fun m!269309 () Bool)

(assert (=> b!253431 m!269309))

(declare-fun m!269311 () Bool)

(assert (=> b!253432 m!269311))

(assert (=> b!253343 d!61429))

(declare-fun b!253449 () Bool)

(declare-fun lt!127030 () SeekEntryResult!1139)

(assert (=> b!253449 (and (bvsge (index!6726 lt!127030) #b00000000000000000000000000000000) (bvslt (index!6726 lt!127030) (size!6214 (_keys!6830 thiss!1504))))))

(declare-fun res!124066 () Bool)

(assert (=> b!253449 (= res!124066 (= (select (arr!5867 (_keys!6830 thiss!1504)) (index!6726 lt!127030)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164319 () Bool)

(assert (=> b!253449 (=> (not res!124066) (not e!164319))))

(declare-fun b!253450 () Bool)

(declare-fun res!124063 () Bool)

(declare-fun e!164317 () Bool)

(assert (=> b!253450 (=> (not res!124063) (not e!164317))))

(assert (=> b!253450 (= res!124063 (= (select (arr!5867 (_keys!6830 thiss!1504)) (index!6729 lt!127030)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253450 (and (bvsge (index!6729 lt!127030) #b00000000000000000000000000000000) (bvslt (index!6729 lt!127030) (size!6214 (_keys!6830 thiss!1504))))))

(declare-fun bm!23904 () Bool)

(declare-fun c!42735 () Bool)

(declare-fun call!23908 () Bool)

(assert (=> bm!23904 (= call!23908 (inRange!0 (ite c!42735 (index!6726 lt!127030) (index!6729 lt!127030)) (mask!10911 thiss!1504)))))

(declare-fun bm!23905 () Bool)

(declare-fun call!23907 () Bool)

(assert (=> bm!23905 (= call!23907 (arrayContainsKey!0 (_keys!6830 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253451 () Bool)

(assert (=> b!253451 (= e!164317 (not call!23907))))

(declare-fun b!253452 () Bool)

(declare-fun res!124065 () Bool)

(assert (=> b!253452 (=> (not res!124065) (not e!164317))))

(assert (=> b!253452 (= res!124065 call!23908)))

(declare-fun e!164320 () Bool)

(assert (=> b!253452 (= e!164320 e!164317)))

(declare-fun b!253453 () Bool)

(declare-fun e!164318 () Bool)

(assert (=> b!253453 (= e!164318 e!164320)))

(declare-fun c!42736 () Bool)

(assert (=> b!253453 (= c!42736 ((_ is MissingVacant!1139) lt!127030))))

(declare-fun b!253454 () Bool)

(assert (=> b!253454 (= e!164320 ((_ is Undefined!1139) lt!127030))))

(declare-fun b!253455 () Bool)

(assert (=> b!253455 (= e!164319 (not call!23907))))

(declare-fun d!61431 () Bool)

(assert (=> d!61431 e!164318))

(assert (=> d!61431 (= c!42735 ((_ is MissingZero!1139) lt!127030))))

(assert (=> d!61431 (= lt!127030 (seekEntryOrOpen!0 key!932 (_keys!6830 thiss!1504) (mask!10911 thiss!1504)))))

(declare-fun lt!127029 () Unit!7841)

(declare-fun choose!1210 (array!12381 array!12379 (_ BitVec 32) (_ BitVec 32) V!8347 V!8347 (_ BitVec 64) Int) Unit!7841)

(assert (=> d!61431 (= lt!127029 (choose!1210 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) key!932 (defaultEntry!4678 thiss!1504)))))

(assert (=> d!61431 (validMask!0 (mask!10911 thiss!1504))))

(assert (=> d!61431 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!414 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) key!932 (defaultEntry!4678 thiss!1504)) lt!127029)))

(declare-fun b!253456 () Bool)

(assert (=> b!253456 (= e!164318 e!164319)))

(declare-fun res!124064 () Bool)

(assert (=> b!253456 (= res!124064 call!23908)))

(assert (=> b!253456 (=> (not res!124064) (not e!164319))))

(assert (= (and d!61431 c!42735) b!253456))

(assert (= (and d!61431 (not c!42735)) b!253453))

(assert (= (and b!253456 res!124064) b!253449))

(assert (= (and b!253449 res!124066) b!253455))

(assert (= (and b!253453 c!42736) b!253452))

(assert (= (and b!253453 (not c!42736)) b!253454))

(assert (= (and b!253452 res!124065) b!253450))

(assert (= (and b!253450 res!124063) b!253451))

(assert (= (or b!253456 b!253452) bm!23904))

(assert (= (or b!253455 b!253451) bm!23905))

(assert (=> d!61431 m!269251))

(declare-fun m!269313 () Bool)

(assert (=> d!61431 m!269313))

(assert (=> d!61431 m!269227))

(declare-fun m!269315 () Bool)

(assert (=> b!253450 m!269315))

(declare-fun m!269317 () Bool)

(assert (=> b!253449 m!269317))

(assert (=> bm!23905 m!269229))

(declare-fun m!269319 () Bool)

(assert (=> bm!23904 m!269319))

(assert (=> b!253328 d!61431))

(declare-fun d!61433 () Bool)

(assert (=> d!61433 (contains!1836 (getCurrentListMap!1435 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)) key!932)))

(declare-fun lt!127033 () Unit!7841)

(declare-fun choose!1211 (array!12381 array!12379 (_ BitVec 32) (_ BitVec 32) V!8347 V!8347 (_ BitVec 64) (_ BitVec 32) Int) Unit!7841)

(assert (=> d!61433 (= lt!127033 (choose!1211 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)))))

(assert (=> d!61433 (validMask!0 (mask!10911 thiss!1504))))

(assert (=> d!61433 (= (lemmaArrayContainsKeyThenInListMap!215 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)) lt!127033)))

(declare-fun bs!9039 () Bool)

(assert (= bs!9039 d!61433))

(assert (=> bs!9039 m!269209))

(assert (=> bs!9039 m!269209))

(assert (=> bs!9039 m!269211))

(declare-fun m!269321 () Bool)

(assert (=> bs!9039 m!269321))

(assert (=> bs!9039 m!269227))

(assert (=> b!253336 d!61433))

(declare-fun b!253465 () Bool)

(declare-fun e!164328 () Bool)

(declare-fun e!164327 () Bool)

(assert (=> b!253465 (= e!164328 e!164327)))

(declare-fun c!42739 () Bool)

(assert (=> b!253465 (= c!42739 (validKeyInArray!0 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23908 () Bool)

(declare-fun call!23911 () Bool)

(assert (=> bm!23908 (= call!23911 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6830 thiss!1504) (mask!10911 thiss!1504)))))

(declare-fun b!253466 () Bool)

(declare-fun e!164329 () Bool)

(assert (=> b!253466 (= e!164329 call!23911)))

(declare-fun b!253467 () Bool)

(assert (=> b!253467 (= e!164327 e!164329)))

(declare-fun lt!127040 () (_ BitVec 64))

(assert (=> b!253467 (= lt!127040 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127041 () Unit!7841)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12381 (_ BitVec 64) (_ BitVec 32)) Unit!7841)

(assert (=> b!253467 (= lt!127041 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6830 thiss!1504) lt!127040 #b00000000000000000000000000000000))))

(assert (=> b!253467 (arrayContainsKey!0 (_keys!6830 thiss!1504) lt!127040 #b00000000000000000000000000000000)))

(declare-fun lt!127042 () Unit!7841)

(assert (=> b!253467 (= lt!127042 lt!127041)))

(declare-fun res!124072 () Bool)

(assert (=> b!253467 (= res!124072 (= (seekEntryOrOpen!0 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000) (_keys!6830 thiss!1504) (mask!10911 thiss!1504)) (Found!1139 #b00000000000000000000000000000000)))))

(assert (=> b!253467 (=> (not res!124072) (not e!164329))))

(declare-fun d!61435 () Bool)

(declare-fun res!124071 () Bool)

(assert (=> d!61435 (=> res!124071 e!164328)))

(assert (=> d!61435 (= res!124071 (bvsge #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))))))

(assert (=> d!61435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6830 thiss!1504) (mask!10911 thiss!1504)) e!164328)))

(declare-fun b!253468 () Bool)

(assert (=> b!253468 (= e!164327 call!23911)))

(assert (= (and d!61435 (not res!124071)) b!253465))

(assert (= (and b!253465 c!42739) b!253467))

(assert (= (and b!253465 (not c!42739)) b!253468))

(assert (= (and b!253467 res!124072) b!253466))

(assert (= (or b!253466 b!253468) bm!23908))

(declare-fun m!269323 () Bool)

(assert (=> b!253465 m!269323))

(assert (=> b!253465 m!269323))

(declare-fun m!269325 () Bool)

(assert (=> b!253465 m!269325))

(declare-fun m!269327 () Bool)

(assert (=> bm!23908 m!269327))

(assert (=> b!253467 m!269323))

(declare-fun m!269329 () Bool)

(assert (=> b!253467 m!269329))

(declare-fun m!269331 () Bool)

(assert (=> b!253467 m!269331))

(assert (=> b!253467 m!269323))

(declare-fun m!269333 () Bool)

(assert (=> b!253467 m!269333))

(assert (=> b!253327 d!61435))

(declare-fun d!61437 () Bool)

(assert (=> d!61437 (= (inRange!0 (ite c!42716 (index!6726 lt!126986) (index!6729 lt!126986)) (mask!10911 thiss!1504)) (and (bvsge (ite c!42716 (index!6726 lt!126986) (index!6729 lt!126986)) #b00000000000000000000000000000000) (bvslt (ite c!42716 (index!6726 lt!126986) (index!6729 lt!126986)) (bvadd (mask!10911 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23892 d!61437))

(declare-fun b!253481 () Bool)

(declare-fun e!164338 () SeekEntryResult!1139)

(declare-fun lt!127050 () SeekEntryResult!1139)

(assert (=> b!253481 (= e!164338 (Found!1139 (index!6728 lt!127050)))))

(declare-fun e!164336 () SeekEntryResult!1139)

(declare-fun b!253482 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12381 (_ BitVec 32)) SeekEntryResult!1139)

(assert (=> b!253482 (= e!164336 (seekKeyOrZeroReturnVacant!0 (x!24813 lt!127050) (index!6728 lt!127050) (index!6728 lt!127050) key!932 (_keys!6830 thiss!1504) (mask!10911 thiss!1504)))))

(declare-fun b!253483 () Bool)

(declare-fun e!164337 () SeekEntryResult!1139)

(assert (=> b!253483 (= e!164337 e!164338)))

(declare-fun lt!127049 () (_ BitVec 64))

(assert (=> b!253483 (= lt!127049 (select (arr!5867 (_keys!6830 thiss!1504)) (index!6728 lt!127050)))))

(declare-fun c!42748 () Bool)

(assert (=> b!253483 (= c!42748 (= lt!127049 key!932))))

(declare-fun b!253484 () Bool)

(assert (=> b!253484 (= e!164336 (MissingZero!1139 (index!6728 lt!127050)))))

(declare-fun d!61439 () Bool)

(declare-fun lt!127051 () SeekEntryResult!1139)

(assert (=> d!61439 (and (or ((_ is Undefined!1139) lt!127051) (not ((_ is Found!1139) lt!127051)) (and (bvsge (index!6727 lt!127051) #b00000000000000000000000000000000) (bvslt (index!6727 lt!127051) (size!6214 (_keys!6830 thiss!1504))))) (or ((_ is Undefined!1139) lt!127051) ((_ is Found!1139) lt!127051) (not ((_ is MissingZero!1139) lt!127051)) (and (bvsge (index!6726 lt!127051) #b00000000000000000000000000000000) (bvslt (index!6726 lt!127051) (size!6214 (_keys!6830 thiss!1504))))) (or ((_ is Undefined!1139) lt!127051) ((_ is Found!1139) lt!127051) ((_ is MissingZero!1139) lt!127051) (not ((_ is MissingVacant!1139) lt!127051)) (and (bvsge (index!6729 lt!127051) #b00000000000000000000000000000000) (bvslt (index!6729 lt!127051) (size!6214 (_keys!6830 thiss!1504))))) (or ((_ is Undefined!1139) lt!127051) (ite ((_ is Found!1139) lt!127051) (= (select (arr!5867 (_keys!6830 thiss!1504)) (index!6727 lt!127051)) key!932) (ite ((_ is MissingZero!1139) lt!127051) (= (select (arr!5867 (_keys!6830 thiss!1504)) (index!6726 lt!127051)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1139) lt!127051) (= (select (arr!5867 (_keys!6830 thiss!1504)) (index!6729 lt!127051)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61439 (= lt!127051 e!164337)))

(declare-fun c!42747 () Bool)

(assert (=> d!61439 (= c!42747 (and ((_ is Intermediate!1139) lt!127050) (undefined!1951 lt!127050)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12381 (_ BitVec 32)) SeekEntryResult!1139)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61439 (= lt!127050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10911 thiss!1504)) key!932 (_keys!6830 thiss!1504) (mask!10911 thiss!1504)))))

(assert (=> d!61439 (validMask!0 (mask!10911 thiss!1504))))

(assert (=> d!61439 (= (seekEntryOrOpen!0 key!932 (_keys!6830 thiss!1504) (mask!10911 thiss!1504)) lt!127051)))

(declare-fun b!253485 () Bool)

(assert (=> b!253485 (= e!164337 Undefined!1139)))

(declare-fun b!253486 () Bool)

(declare-fun c!42746 () Bool)

(assert (=> b!253486 (= c!42746 (= lt!127049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253486 (= e!164338 e!164336)))

(assert (= (and d!61439 c!42747) b!253485))

(assert (= (and d!61439 (not c!42747)) b!253483))

(assert (= (and b!253483 c!42748) b!253481))

(assert (= (and b!253483 (not c!42748)) b!253486))

(assert (= (and b!253486 c!42746) b!253484))

(assert (= (and b!253486 (not c!42746)) b!253482))

(declare-fun m!269335 () Bool)

(assert (=> b!253482 m!269335))

(declare-fun m!269337 () Bool)

(assert (=> b!253483 m!269337))

(declare-fun m!269339 () Bool)

(assert (=> d!61439 m!269339))

(declare-fun m!269341 () Bool)

(assert (=> d!61439 m!269341))

(declare-fun m!269343 () Bool)

(assert (=> d!61439 m!269343))

(assert (=> d!61439 m!269227))

(assert (=> d!61439 m!269341))

(declare-fun m!269345 () Bool)

(assert (=> d!61439 m!269345))

(declare-fun m!269347 () Bool)

(assert (=> d!61439 m!269347))

(assert (=> b!253348 d!61439))

(declare-fun bm!23911 () Bool)

(declare-fun call!23914 () Bool)

(declare-fun c!42751 () Bool)

(assert (=> bm!23911 (= call!23914 (arrayNoDuplicates!0 (_keys!6830 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42751 (Cons!3748 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000) Nil!3749) Nil!3749)))))

(declare-fun b!253497 () Bool)

(declare-fun e!164349 () Bool)

(assert (=> b!253497 (= e!164349 call!23914)))

(declare-fun b!253498 () Bool)

(assert (=> b!253498 (= e!164349 call!23914)))

(declare-fun b!253499 () Bool)

(declare-fun e!164350 () Bool)

(declare-fun e!164348 () Bool)

(assert (=> b!253499 (= e!164350 e!164348)))

(declare-fun res!124081 () Bool)

(assert (=> b!253499 (=> (not res!124081) (not e!164348))))

(declare-fun e!164347 () Bool)

(assert (=> b!253499 (= res!124081 (not e!164347))))

(declare-fun res!124080 () Bool)

(assert (=> b!253499 (=> (not res!124080) (not e!164347))))

(assert (=> b!253499 (= res!124080 (validKeyInArray!0 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61441 () Bool)

(declare-fun res!124079 () Bool)

(assert (=> d!61441 (=> res!124079 e!164350)))

(assert (=> d!61441 (= res!124079 (bvsge #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))))))

(assert (=> d!61441 (= (arrayNoDuplicates!0 (_keys!6830 thiss!1504) #b00000000000000000000000000000000 Nil!3749) e!164350)))

(declare-fun b!253500 () Bool)

(assert (=> b!253500 (= e!164348 e!164349)))

(assert (=> b!253500 (= c!42751 (validKeyInArray!0 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253501 () Bool)

(declare-fun contains!1837 (List!3752 (_ BitVec 64)) Bool)

(assert (=> b!253501 (= e!164347 (contains!1837 Nil!3749 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61441 (not res!124079)) b!253499))

(assert (= (and b!253499 res!124080) b!253501))

(assert (= (and b!253499 res!124081) b!253500))

(assert (= (and b!253500 c!42751) b!253498))

(assert (= (and b!253500 (not c!42751)) b!253497))

(assert (= (or b!253498 b!253497) bm!23911))

(assert (=> bm!23911 m!269323))

(declare-fun m!269349 () Bool)

(assert (=> bm!23911 m!269349))

(assert (=> b!253499 m!269323))

(assert (=> b!253499 m!269323))

(assert (=> b!253499 m!269325))

(assert (=> b!253500 m!269323))

(assert (=> b!253500 m!269323))

(assert (=> b!253500 m!269325))

(assert (=> b!253501 m!269323))

(assert (=> b!253501 m!269323))

(declare-fun m!269351 () Bool)

(assert (=> b!253501 m!269351))

(assert (=> b!253341 d!61441))

(declare-fun d!61443 () Bool)

(assert (=> d!61443 (= (array_inv!3881 (_keys!6830 thiss!1504)) (bvsge (size!6214 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253332 d!61443))

(declare-fun d!61445 () Bool)

(assert (=> d!61445 (= (array_inv!3882 (_values!4661 thiss!1504)) (bvsge (size!6213 (_values!4661 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253332 d!61445))

(declare-fun d!61447 () Bool)

(declare-fun res!124088 () Bool)

(declare-fun e!164353 () Bool)

(assert (=> d!61447 (=> (not res!124088) (not e!164353))))

(declare-fun simpleValid!269 (LongMapFixedSize!3738) Bool)

(assert (=> d!61447 (= res!124088 (simpleValid!269 thiss!1504))))

(assert (=> d!61447 (= (valid!1463 thiss!1504) e!164353)))

(declare-fun b!253508 () Bool)

(declare-fun res!124089 () Bool)

(assert (=> b!253508 (=> (not res!124089) (not e!164353))))

(assert (=> b!253508 (= res!124089 (= (arrayCountValidKeys!0 (_keys!6830 thiss!1504) #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))) (_size!1918 thiss!1504)))))

(declare-fun b!253509 () Bool)

(declare-fun res!124090 () Bool)

(assert (=> b!253509 (=> (not res!124090) (not e!164353))))

(assert (=> b!253509 (= res!124090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6830 thiss!1504) (mask!10911 thiss!1504)))))

(declare-fun b!253510 () Bool)

(assert (=> b!253510 (= e!164353 (arrayNoDuplicates!0 (_keys!6830 thiss!1504) #b00000000000000000000000000000000 Nil!3749))))

(assert (= (and d!61447 res!124088) b!253508))

(assert (= (and b!253508 res!124089) b!253509))

(assert (= (and b!253509 res!124090) b!253510))

(declare-fun m!269353 () Bool)

(assert (=> d!61447 m!269353))

(assert (=> b!253508 m!269237))

(assert (=> b!253509 m!269213))

(assert (=> b!253510 m!269205))

(assert (=> start!24224 d!61447))

(declare-fun d!61449 () Bool)

(assert (=> d!61449 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!253351 d!61449))

(declare-fun b!253520 () Bool)

(declare-fun res!124101 () Bool)

(declare-fun e!164359 () Bool)

(assert (=> b!253520 (=> (not res!124101) (not e!164359))))

(assert (=> b!253520 (= res!124101 (validKeyInArray!0 key!932))))

(declare-fun b!253521 () Bool)

(assert (=> b!253521 (= e!164359 (bvslt (size!6214 (_keys!6830 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!61451 () Bool)

(declare-fun e!164358 () Bool)

(assert (=> d!61451 e!164358))

(declare-fun res!124100 () Bool)

(assert (=> d!61451 (=> (not res!124100) (not e!164358))))

(assert (=> d!61451 (= res!124100 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6214 (_keys!6830 thiss!1504)))))))

(declare-fun lt!127054 () Unit!7841)

(declare-fun choose!1 (array!12381 (_ BitVec 32) (_ BitVec 64)) Unit!7841)

(assert (=> d!61451 (= lt!127054 (choose!1 (_keys!6830 thiss!1504) index!297 key!932))))

(assert (=> d!61451 e!164359))

(declare-fun res!124102 () Bool)

(assert (=> d!61451 (=> (not res!124102) (not e!164359))))

(assert (=> d!61451 (= res!124102 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6214 (_keys!6830 thiss!1504)))))))

(assert (=> d!61451 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6830 thiss!1504) index!297 key!932) lt!127054)))

(declare-fun b!253522 () Bool)

(assert (=> b!253522 (= e!164358 (= (arrayCountValidKeys!0 (array!12382 (store (arr!5867 (_keys!6830 thiss!1504)) index!297 key!932) (size!6214 (_keys!6830 thiss!1504))) #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6830 thiss!1504) #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!253519 () Bool)

(declare-fun res!124099 () Bool)

(assert (=> b!253519 (=> (not res!124099) (not e!164359))))

(assert (=> b!253519 (= res!124099 (not (validKeyInArray!0 (select (arr!5867 (_keys!6830 thiss!1504)) index!297))))))

(assert (= (and d!61451 res!124102) b!253519))

(assert (= (and b!253519 res!124099) b!253520))

(assert (= (and b!253520 res!124101) b!253521))

(assert (= (and d!61451 res!124100) b!253522))

(assert (=> b!253520 m!269249))

(declare-fun m!269355 () Bool)

(assert (=> d!61451 m!269355))

(assert (=> b!253522 m!269235))

(declare-fun m!269357 () Bool)

(assert (=> b!253522 m!269357))

(assert (=> b!253522 m!269237))

(declare-fun m!269359 () Bool)

(assert (=> b!253519 m!269359))

(assert (=> b!253519 m!269359))

(declare-fun m!269361 () Bool)

(assert (=> b!253519 m!269361))

(assert (=> b!253340 d!61451))

(declare-fun d!61453 () Bool)

(declare-fun lt!127057 () (_ BitVec 32))

(assert (=> d!61453 (and (bvsge lt!127057 #b00000000000000000000000000000000) (bvsle lt!127057 (bvsub (size!6214 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!164365 () (_ BitVec 32))

(assert (=> d!61453 (= lt!127057 e!164365)))

(declare-fun c!42757 () Bool)

(assert (=> d!61453 (= c!42757 (bvsge #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))))))

(assert (=> d!61453 (and (bvsle #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6214 (_keys!6830 thiss!1504)) (size!6214 (_keys!6830 thiss!1504))))))

(assert (=> d!61453 (= (arrayCountValidKeys!0 (_keys!6830 thiss!1504) #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))) lt!127057)))

(declare-fun b!253531 () Bool)

(assert (=> b!253531 (= e!164365 #b00000000000000000000000000000000)))

(declare-fun b!253532 () Bool)

(declare-fun e!164364 () (_ BitVec 32))

(declare-fun call!23917 () (_ BitVec 32))

(assert (=> b!253532 (= e!164364 call!23917)))

(declare-fun b!253533 () Bool)

(assert (=> b!253533 (= e!164364 (bvadd #b00000000000000000000000000000001 call!23917))))

(declare-fun bm!23914 () Bool)

(assert (=> bm!23914 (= call!23917 (arrayCountValidKeys!0 (_keys!6830 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6214 (_keys!6830 thiss!1504))))))

(declare-fun b!253534 () Bool)

(assert (=> b!253534 (= e!164365 e!164364)))

(declare-fun c!42756 () Bool)

(assert (=> b!253534 (= c!42756 (validKeyInArray!0 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61453 c!42757) b!253531))

(assert (= (and d!61453 (not c!42757)) b!253534))

(assert (= (and b!253534 c!42756) b!253533))

(assert (= (and b!253534 (not c!42756)) b!253532))

(assert (= (or b!253533 b!253532) bm!23914))

(declare-fun m!269363 () Bool)

(assert (=> bm!23914 m!269363))

(assert (=> b!253534 m!269323))

(assert (=> b!253534 m!269323))

(assert (=> b!253534 m!269325))

(assert (=> b!253340 d!61453))

(declare-fun b!253535 () Bool)

(declare-fun e!164367 () Bool)

(declare-fun e!164366 () Bool)

(assert (=> b!253535 (= e!164367 e!164366)))

(declare-fun c!42758 () Bool)

(assert (=> b!253535 (= c!42758 (validKeyInArray!0 (select (arr!5867 lt!126979) #b00000000000000000000000000000000)))))

(declare-fun bm!23915 () Bool)

(declare-fun call!23918 () Bool)

(assert (=> bm!23915 (= call!23918 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126979 (mask!10911 thiss!1504)))))

(declare-fun b!253536 () Bool)

(declare-fun e!164368 () Bool)

(assert (=> b!253536 (= e!164368 call!23918)))

(declare-fun b!253537 () Bool)

(assert (=> b!253537 (= e!164366 e!164368)))

(declare-fun lt!127058 () (_ BitVec 64))

(assert (=> b!253537 (= lt!127058 (select (arr!5867 lt!126979) #b00000000000000000000000000000000))))

(declare-fun lt!127059 () Unit!7841)

(assert (=> b!253537 (= lt!127059 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126979 lt!127058 #b00000000000000000000000000000000))))

(assert (=> b!253537 (arrayContainsKey!0 lt!126979 lt!127058 #b00000000000000000000000000000000)))

(declare-fun lt!127060 () Unit!7841)

(assert (=> b!253537 (= lt!127060 lt!127059)))

(declare-fun res!124104 () Bool)

(assert (=> b!253537 (= res!124104 (= (seekEntryOrOpen!0 (select (arr!5867 lt!126979) #b00000000000000000000000000000000) lt!126979 (mask!10911 thiss!1504)) (Found!1139 #b00000000000000000000000000000000)))))

(assert (=> b!253537 (=> (not res!124104) (not e!164368))))

(declare-fun d!61455 () Bool)

(declare-fun res!124103 () Bool)

(assert (=> d!61455 (=> res!124103 e!164367)))

(assert (=> d!61455 (= res!124103 (bvsge #b00000000000000000000000000000000 (size!6214 lt!126979)))))

(assert (=> d!61455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126979 (mask!10911 thiss!1504)) e!164367)))

(declare-fun b!253538 () Bool)

(assert (=> b!253538 (= e!164366 call!23918)))

(assert (= (and d!61455 (not res!124103)) b!253535))

(assert (= (and b!253535 c!42758) b!253537))

(assert (= (and b!253535 (not c!42758)) b!253538))

(assert (= (and b!253537 res!124104) b!253536))

(assert (= (or b!253536 b!253538) bm!23915))

(declare-fun m!269365 () Bool)

(assert (=> b!253535 m!269365))

(assert (=> b!253535 m!269365))

(declare-fun m!269367 () Bool)

(assert (=> b!253535 m!269367))

(declare-fun m!269369 () Bool)

(assert (=> bm!23915 m!269369))

(assert (=> b!253537 m!269365))

(declare-fun m!269371 () Bool)

(assert (=> b!253537 m!269371))

(declare-fun m!269373 () Bool)

(assert (=> b!253537 m!269373))

(assert (=> b!253537 m!269365))

(declare-fun m!269375 () Bool)

(assert (=> b!253537 m!269375))

(assert (=> b!253340 d!61455))

(declare-fun d!61457 () Bool)

(assert (=> d!61457 (= (validMask!0 (mask!10911 thiss!1504)) (and (or (= (mask!10911 thiss!1504) #b00000000000000000000000000000111) (= (mask!10911 thiss!1504) #b00000000000000000000000000001111) (= (mask!10911 thiss!1504) #b00000000000000000000000000011111) (= (mask!10911 thiss!1504) #b00000000000000000000000000111111) (= (mask!10911 thiss!1504) #b00000000000000000000000001111111) (= (mask!10911 thiss!1504) #b00000000000000000000000011111111) (= (mask!10911 thiss!1504) #b00000000000000000000000111111111) (= (mask!10911 thiss!1504) #b00000000000000000000001111111111) (= (mask!10911 thiss!1504) #b00000000000000000000011111111111) (= (mask!10911 thiss!1504) #b00000000000000000000111111111111) (= (mask!10911 thiss!1504) #b00000000000000000001111111111111) (= (mask!10911 thiss!1504) #b00000000000000000011111111111111) (= (mask!10911 thiss!1504) #b00000000000000000111111111111111) (= (mask!10911 thiss!1504) #b00000000000000001111111111111111) (= (mask!10911 thiss!1504) #b00000000000000011111111111111111) (= (mask!10911 thiss!1504) #b00000000000000111111111111111111) (= (mask!10911 thiss!1504) #b00000000000001111111111111111111) (= (mask!10911 thiss!1504) #b00000000000011111111111111111111) (= (mask!10911 thiss!1504) #b00000000000111111111111111111111) (= (mask!10911 thiss!1504) #b00000000001111111111111111111111) (= (mask!10911 thiss!1504) #b00000000011111111111111111111111) (= (mask!10911 thiss!1504) #b00000000111111111111111111111111) (= (mask!10911 thiss!1504) #b00000001111111111111111111111111) (= (mask!10911 thiss!1504) #b00000011111111111111111111111111) (= (mask!10911 thiss!1504) #b00000111111111111111111111111111) (= (mask!10911 thiss!1504) #b00001111111111111111111111111111) (= (mask!10911 thiss!1504) #b00011111111111111111111111111111) (= (mask!10911 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10911 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!253340 d!61457))

(declare-fun bm!23916 () Bool)

(declare-fun call!23919 () Bool)

(declare-fun c!42759 () Bool)

(assert (=> bm!23916 (= call!23919 (arrayNoDuplicates!0 lt!126979 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42759 (Cons!3748 (select (arr!5867 lt!126979) #b00000000000000000000000000000000) Nil!3749) Nil!3749)))))

(declare-fun b!253539 () Bool)

(declare-fun e!164371 () Bool)

(assert (=> b!253539 (= e!164371 call!23919)))

(declare-fun b!253540 () Bool)

(assert (=> b!253540 (= e!164371 call!23919)))

(declare-fun b!253541 () Bool)

(declare-fun e!164372 () Bool)

(declare-fun e!164370 () Bool)

(assert (=> b!253541 (= e!164372 e!164370)))

(declare-fun res!124107 () Bool)

(assert (=> b!253541 (=> (not res!124107) (not e!164370))))

(declare-fun e!164369 () Bool)

(assert (=> b!253541 (= res!124107 (not e!164369))))

(declare-fun res!124106 () Bool)

(assert (=> b!253541 (=> (not res!124106) (not e!164369))))

(assert (=> b!253541 (= res!124106 (validKeyInArray!0 (select (arr!5867 lt!126979) #b00000000000000000000000000000000)))))

(declare-fun d!61459 () Bool)

(declare-fun res!124105 () Bool)

(assert (=> d!61459 (=> res!124105 e!164372)))

(assert (=> d!61459 (= res!124105 (bvsge #b00000000000000000000000000000000 (size!6214 lt!126979)))))

(assert (=> d!61459 (= (arrayNoDuplicates!0 lt!126979 #b00000000000000000000000000000000 Nil!3749) e!164372)))

(declare-fun b!253542 () Bool)

(assert (=> b!253542 (= e!164370 e!164371)))

(assert (=> b!253542 (= c!42759 (validKeyInArray!0 (select (arr!5867 lt!126979) #b00000000000000000000000000000000)))))

(declare-fun b!253543 () Bool)

(assert (=> b!253543 (= e!164369 (contains!1837 Nil!3749 (select (arr!5867 lt!126979) #b00000000000000000000000000000000)))))

(assert (= (and d!61459 (not res!124105)) b!253541))

(assert (= (and b!253541 res!124106) b!253543))

(assert (= (and b!253541 res!124107) b!253542))

(assert (= (and b!253542 c!42759) b!253540))

(assert (= (and b!253542 (not c!42759)) b!253539))

(assert (= (or b!253540 b!253539) bm!23916))

(assert (=> bm!23916 m!269365))

(declare-fun m!269377 () Bool)

(assert (=> bm!23916 m!269377))

(assert (=> b!253541 m!269365))

(assert (=> b!253541 m!269365))

(assert (=> b!253541 m!269367))

(assert (=> b!253542 m!269365))

(assert (=> b!253542 m!269365))

(assert (=> b!253542 m!269367))

(assert (=> b!253543 m!269365))

(assert (=> b!253543 m!269365))

(declare-fun m!269379 () Bool)

(assert (=> b!253543 m!269379))

(assert (=> b!253340 d!61459))

(declare-fun d!61461 () Bool)

(declare-fun lt!127061 () (_ BitVec 32))

(assert (=> d!61461 (and (bvsge lt!127061 #b00000000000000000000000000000000) (bvsle lt!127061 (bvsub (size!6214 lt!126979) #b00000000000000000000000000000000)))))

(declare-fun e!164374 () (_ BitVec 32))

(assert (=> d!61461 (= lt!127061 e!164374)))

(declare-fun c!42761 () Bool)

(assert (=> d!61461 (= c!42761 (bvsge #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))))))

(assert (=> d!61461 (and (bvsle #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6214 (_keys!6830 thiss!1504)) (size!6214 lt!126979)))))

(assert (=> d!61461 (= (arrayCountValidKeys!0 lt!126979 #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))) lt!127061)))

(declare-fun b!253544 () Bool)

(assert (=> b!253544 (= e!164374 #b00000000000000000000000000000000)))

(declare-fun b!253545 () Bool)

(declare-fun e!164373 () (_ BitVec 32))

(declare-fun call!23920 () (_ BitVec 32))

(assert (=> b!253545 (= e!164373 call!23920)))

(declare-fun b!253546 () Bool)

(assert (=> b!253546 (= e!164373 (bvadd #b00000000000000000000000000000001 call!23920))))

(declare-fun bm!23917 () Bool)

(assert (=> bm!23917 (= call!23920 (arrayCountValidKeys!0 lt!126979 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6214 (_keys!6830 thiss!1504))))))

(declare-fun b!253547 () Bool)

(assert (=> b!253547 (= e!164374 e!164373)))

(declare-fun c!42760 () Bool)

(assert (=> b!253547 (= c!42760 (validKeyInArray!0 (select (arr!5867 lt!126979) #b00000000000000000000000000000000)))))

(assert (= (and d!61461 c!42761) b!253544))

(assert (= (and d!61461 (not c!42761)) b!253547))

(assert (= (and b!253547 c!42760) b!253546))

(assert (= (and b!253547 (not c!42760)) b!253545))

(assert (= (or b!253546 b!253545) bm!23917))

(declare-fun m!269381 () Bool)

(assert (=> bm!23917 m!269381))

(assert (=> b!253547 m!269365))

(assert (=> b!253547 m!269365))

(assert (=> b!253547 m!269367))

(assert (=> b!253340 d!61461))

(declare-fun d!61463 () Bool)

(declare-fun e!164377 () Bool)

(assert (=> d!61463 e!164377))

(declare-fun res!124110 () Bool)

(assert (=> d!61463 (=> (not res!124110) (not e!164377))))

(assert (=> d!61463 (= res!124110 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6214 (_keys!6830 thiss!1504)))))))

(declare-fun lt!127064 () Unit!7841)

(declare-fun choose!41 (array!12381 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3752) Unit!7841)

(assert (=> d!61463 (= lt!127064 (choose!41 (_keys!6830 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3749))))

(assert (=> d!61463 (bvslt (size!6214 (_keys!6830 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61463 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6830 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3749) lt!127064)))

(declare-fun b!253550 () Bool)

(assert (=> b!253550 (= e!164377 (arrayNoDuplicates!0 (array!12382 (store (arr!5867 (_keys!6830 thiss!1504)) index!297 key!932) (size!6214 (_keys!6830 thiss!1504))) #b00000000000000000000000000000000 Nil!3749))))

(assert (= (and d!61463 res!124110) b!253550))

(declare-fun m!269383 () Bool)

(assert (=> d!61463 m!269383))

(assert (=> b!253550 m!269235))

(declare-fun m!269385 () Bool)

(assert (=> b!253550 m!269385))

(assert (=> b!253340 d!61463))

(declare-fun d!61465 () Bool)

(declare-fun res!124115 () Bool)

(declare-fun e!164382 () Bool)

(assert (=> d!61465 (=> res!124115 e!164382)))

(assert (=> d!61465 (= res!124115 (= (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61465 (= (arrayContainsKey!0 (_keys!6830 thiss!1504) key!932 #b00000000000000000000000000000000) e!164382)))

(declare-fun b!253555 () Bool)

(declare-fun e!164383 () Bool)

(assert (=> b!253555 (= e!164382 e!164383)))

(declare-fun res!124116 () Bool)

(assert (=> b!253555 (=> (not res!124116) (not e!164383))))

(assert (=> b!253555 (= res!124116 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6214 (_keys!6830 thiss!1504))))))

(declare-fun b!253556 () Bool)

(assert (=> b!253556 (= e!164383 (arrayContainsKey!0 (_keys!6830 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61465 (not res!124115)) b!253555))

(assert (= (and b!253555 res!124116) b!253556))

(assert (=> d!61465 m!269323))

(declare-fun m!269387 () Bool)

(assert (=> b!253556 m!269387))

(assert (=> b!253340 d!61465))

(declare-fun d!61467 () Bool)

(declare-fun e!164386 () Bool)

(assert (=> d!61467 e!164386))

(declare-fun res!124119 () Bool)

(assert (=> d!61467 (=> (not res!124119) (not e!164386))))

(assert (=> d!61467 (= res!124119 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6214 (_keys!6830 thiss!1504)))))))

(declare-fun lt!127067 () Unit!7841)

(declare-fun choose!102 ((_ BitVec 64) array!12381 (_ BitVec 32) (_ BitVec 32)) Unit!7841)

(assert (=> d!61467 (= lt!127067 (choose!102 key!932 (_keys!6830 thiss!1504) index!297 (mask!10911 thiss!1504)))))

(assert (=> d!61467 (validMask!0 (mask!10911 thiss!1504))))

(assert (=> d!61467 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6830 thiss!1504) index!297 (mask!10911 thiss!1504)) lt!127067)))

(declare-fun b!253559 () Bool)

(assert (=> b!253559 (= e!164386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12382 (store (arr!5867 (_keys!6830 thiss!1504)) index!297 key!932) (size!6214 (_keys!6830 thiss!1504))) (mask!10911 thiss!1504)))))

(assert (= (and d!61467 res!124119) b!253559))

(declare-fun m!269389 () Bool)

(assert (=> d!61467 m!269389))

(assert (=> d!61467 m!269227))

(assert (=> b!253559 m!269235))

(declare-fun m!269391 () Bool)

(assert (=> b!253559 m!269391))

(assert (=> b!253340 d!61467))

(assert (=> bm!23893 d!61465))

(declare-fun d!61469 () Bool)

(assert (=> d!61469 (= (inRange!0 index!297 (mask!10911 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10911 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!253339 d!61469))

(declare-fun d!61471 () Bool)

(declare-fun e!164392 () Bool)

(assert (=> d!61471 e!164392))

(declare-fun res!124122 () Bool)

(assert (=> d!61471 (=> res!124122 e!164392)))

(declare-fun lt!127076 () Bool)

(assert (=> d!61471 (= res!124122 (not lt!127076))))

(declare-fun lt!127077 () Bool)

(assert (=> d!61471 (= lt!127076 lt!127077)))

(declare-fun lt!127079 () Unit!7841)

(declare-fun e!164391 () Unit!7841)

(assert (=> d!61471 (= lt!127079 e!164391)))

(declare-fun c!42764 () Bool)

(assert (=> d!61471 (= c!42764 lt!127077)))

(declare-fun containsKey!296 (List!3751 (_ BitVec 64)) Bool)

(assert (=> d!61471 (= lt!127077 (containsKey!296 (toList!1907 (getCurrentListMap!1435 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504))) key!932))))

(assert (=> d!61471 (= (contains!1836 (getCurrentListMap!1435 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)) key!932) lt!127076)))

(declare-fun b!253566 () Bool)

(declare-fun lt!127078 () Unit!7841)

(assert (=> b!253566 (= e!164391 lt!127078)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!244 (List!3751 (_ BitVec 64)) Unit!7841)

(assert (=> b!253566 (= lt!127078 (lemmaContainsKeyImpliesGetValueByKeyDefined!244 (toList!1907 (getCurrentListMap!1435 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504))) key!932))))

(declare-datatypes ((Option!310 0))(
  ( (Some!309 (v!5382 V!8347)) (None!308) )
))
(declare-fun isDefined!245 (Option!310) Bool)

(declare-fun getValueByKey!304 (List!3751 (_ BitVec 64)) Option!310)

(assert (=> b!253566 (isDefined!245 (getValueByKey!304 (toList!1907 (getCurrentListMap!1435 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504))) key!932))))

(declare-fun b!253567 () Bool)

(declare-fun Unit!7846 () Unit!7841)

(assert (=> b!253567 (= e!164391 Unit!7846)))

(declare-fun b!253568 () Bool)

(assert (=> b!253568 (= e!164392 (isDefined!245 (getValueByKey!304 (toList!1907 (getCurrentListMap!1435 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504))) key!932)))))

(assert (= (and d!61471 c!42764) b!253566))

(assert (= (and d!61471 (not c!42764)) b!253567))

(assert (= (and d!61471 (not res!124122)) b!253568))

(declare-fun m!269393 () Bool)

(assert (=> d!61471 m!269393))

(declare-fun m!269395 () Bool)

(assert (=> b!253566 m!269395))

(declare-fun m!269397 () Bool)

(assert (=> b!253566 m!269397))

(assert (=> b!253566 m!269397))

(declare-fun m!269399 () Bool)

(assert (=> b!253566 m!269399))

(assert (=> b!253568 m!269397))

(assert (=> b!253568 m!269397))

(assert (=> b!253568 m!269399))

(assert (=> b!253339 d!61471))

(declare-fun b!253611 () Bool)

(declare-fun e!164424 () Bool)

(declare-fun call!23935 () Bool)

(assert (=> b!253611 (= e!164424 (not call!23935))))

(declare-fun b!253612 () Bool)

(declare-fun e!164426 () Bool)

(declare-fun e!164419 () Bool)

(assert (=> b!253612 (= e!164426 e!164419)))

(declare-fun res!124145 () Bool)

(assert (=> b!253612 (=> (not res!124145) (not e!164419))))

(declare-fun lt!127124 () ListLongMap!3783)

(assert (=> b!253612 (= res!124145 (contains!1836 lt!127124 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!253612 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))))))

(declare-fun b!253613 () Bool)

(declare-fun e!164430 () ListLongMap!3783)

(declare-fun call!23938 () ListLongMap!3783)

(assert (=> b!253613 (= e!164430 call!23938)))

(declare-fun b!253614 () Bool)

(declare-fun e!164422 () Bool)

(assert (=> b!253614 (= e!164422 (validKeyInArray!0 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253615 () Bool)

(declare-fun e!164428 () ListLongMap!3783)

(assert (=> b!253615 (= e!164428 call!23938)))

(declare-fun b!253616 () Bool)

(declare-fun e!164423 () Bool)

(declare-fun apply!246 (ListLongMap!3783 (_ BitVec 64)) V!8347)

(assert (=> b!253616 (= e!164423 (= (apply!246 lt!127124 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4519 thiss!1504)))))

(declare-fun b!253617 () Bool)

(declare-fun c!42782 () Bool)

(assert (=> b!253617 (= c!42782 (and (not (= (bvand (extraKeys!4415 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4415 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!253617 (= e!164430 e!164428)))

(declare-fun b!253618 () Bool)

(declare-fun e!164431 () Bool)

(assert (=> b!253618 (= e!164431 (validKeyInArray!0 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61473 () Bool)

(declare-fun e!164427 () Bool)

(assert (=> d!61473 e!164427))

(declare-fun res!124148 () Bool)

(assert (=> d!61473 (=> (not res!124148) (not e!164427))))

(assert (=> d!61473 (= res!124148 (or (bvsge #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))))))))

(declare-fun lt!127142 () ListLongMap!3783)

(assert (=> d!61473 (= lt!127124 lt!127142)))

(declare-fun lt!127138 () Unit!7841)

(declare-fun e!164429 () Unit!7841)

(assert (=> d!61473 (= lt!127138 e!164429)))

(declare-fun c!42778 () Bool)

(assert (=> d!61473 (= c!42778 e!164431)))

(declare-fun res!124147 () Bool)

(assert (=> d!61473 (=> (not res!124147) (not e!164431))))

(assert (=> d!61473 (= res!124147 (bvslt #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))))))

(declare-fun e!164420 () ListLongMap!3783)

(assert (=> d!61473 (= lt!127142 e!164420)))

(declare-fun c!42781 () Bool)

(assert (=> d!61473 (= c!42781 (and (not (= (bvand (extraKeys!4415 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4415 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61473 (validMask!0 (mask!10911 thiss!1504))))

(assert (=> d!61473 (= (getCurrentListMap!1435 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)) lt!127124)))

(declare-fun bm!23932 () Bool)

(declare-fun call!23939 () ListLongMap!3783)

(assert (=> bm!23932 (= call!23938 call!23939)))

(declare-fun b!253619 () Bool)

(declare-fun e!164421 () Bool)

(assert (=> b!253619 (= e!164427 e!164421)))

(declare-fun c!42780 () Bool)

(assert (=> b!253619 (= c!42780 (not (= (bvand (extraKeys!4415 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!253620 () Bool)

(assert (=> b!253620 (= e!164424 e!164423)))

(declare-fun res!124143 () Bool)

(assert (=> b!253620 (= res!124143 call!23935)))

(assert (=> b!253620 (=> (not res!124143) (not e!164423))))

(declare-fun bm!23933 () Bool)

(declare-fun call!23940 () ListLongMap!3783)

(declare-fun getCurrentListMapNoExtraKeys!568 (array!12381 array!12379 (_ BitVec 32) (_ BitVec 32) V!8347 V!8347 (_ BitVec 32) Int) ListLongMap!3783)

(assert (=> bm!23933 (= call!23940 (getCurrentListMapNoExtraKeys!568 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)))))

(declare-fun bm!23934 () Bool)

(declare-fun call!23937 () ListLongMap!3783)

(declare-fun call!23936 () ListLongMap!3783)

(assert (=> bm!23934 (= call!23937 call!23936)))

(declare-fun b!253621 () Bool)

(declare-fun Unit!7847 () Unit!7841)

(assert (=> b!253621 (= e!164429 Unit!7847)))

(declare-fun b!253622 () Bool)

(declare-fun res!124142 () Bool)

(assert (=> b!253622 (=> (not res!124142) (not e!164427))))

(assert (=> b!253622 (= res!124142 e!164424)))

(declare-fun c!42779 () Bool)

(assert (=> b!253622 (= c!42779 (not (= (bvand (extraKeys!4415 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!253623 () Bool)

(declare-fun res!124141 () Bool)

(assert (=> b!253623 (=> (not res!124141) (not e!164427))))

(assert (=> b!253623 (= res!124141 e!164426)))

(declare-fun res!124144 () Bool)

(assert (=> b!253623 (=> res!124144 e!164426)))

(assert (=> b!253623 (= res!124144 (not e!164422))))

(declare-fun res!124149 () Bool)

(assert (=> b!253623 (=> (not res!124149) (not e!164422))))

(assert (=> b!253623 (= res!124149 (bvslt #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))))))

(declare-fun bm!23935 () Bool)

(assert (=> bm!23935 (= call!23935 (contains!1836 lt!127124 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253624 () Bool)

(declare-fun +!673 (ListLongMap!3783 tuple2!4870) ListLongMap!3783)

(assert (=> b!253624 (= e!164420 (+!673 call!23939 (tuple2!4871 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4519 thiss!1504))))))

(declare-fun bm!23936 () Bool)

(declare-fun call!23941 () Bool)

(assert (=> bm!23936 (= call!23941 (contains!1836 lt!127124 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253625 () Bool)

(assert (=> b!253625 (= e!164421 (not call!23941))))

(declare-fun b!253626 () Bool)

(declare-fun lt!127135 () Unit!7841)

(assert (=> b!253626 (= e!164429 lt!127135)))

(declare-fun lt!127132 () ListLongMap!3783)

(assert (=> b!253626 (= lt!127132 (getCurrentListMapNoExtraKeys!568 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)))))

(declare-fun lt!127131 () (_ BitVec 64))

(assert (=> b!253626 (= lt!127131 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127129 () (_ BitVec 64))

(assert (=> b!253626 (= lt!127129 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127145 () Unit!7841)

(declare-fun addStillContains!222 (ListLongMap!3783 (_ BitVec 64) V!8347 (_ BitVec 64)) Unit!7841)

(assert (=> b!253626 (= lt!127145 (addStillContains!222 lt!127132 lt!127131 (zeroValue!4519 thiss!1504) lt!127129))))

(assert (=> b!253626 (contains!1836 (+!673 lt!127132 (tuple2!4871 lt!127131 (zeroValue!4519 thiss!1504))) lt!127129)))

(declare-fun lt!127127 () Unit!7841)

(assert (=> b!253626 (= lt!127127 lt!127145)))

(declare-fun lt!127143 () ListLongMap!3783)

(assert (=> b!253626 (= lt!127143 (getCurrentListMapNoExtraKeys!568 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)))))

(declare-fun lt!127144 () (_ BitVec 64))

(assert (=> b!253626 (= lt!127144 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127136 () (_ BitVec 64))

(assert (=> b!253626 (= lt!127136 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127134 () Unit!7841)

(declare-fun addApplyDifferent!222 (ListLongMap!3783 (_ BitVec 64) V!8347 (_ BitVec 64)) Unit!7841)

(assert (=> b!253626 (= lt!127134 (addApplyDifferent!222 lt!127143 lt!127144 (minValue!4519 thiss!1504) lt!127136))))

(assert (=> b!253626 (= (apply!246 (+!673 lt!127143 (tuple2!4871 lt!127144 (minValue!4519 thiss!1504))) lt!127136) (apply!246 lt!127143 lt!127136))))

(declare-fun lt!127133 () Unit!7841)

(assert (=> b!253626 (= lt!127133 lt!127134)))

(declare-fun lt!127141 () ListLongMap!3783)

(assert (=> b!253626 (= lt!127141 (getCurrentListMapNoExtraKeys!568 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)))))

(declare-fun lt!127130 () (_ BitVec 64))

(assert (=> b!253626 (= lt!127130 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127139 () (_ BitVec 64))

(assert (=> b!253626 (= lt!127139 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!127140 () Unit!7841)

(assert (=> b!253626 (= lt!127140 (addApplyDifferent!222 lt!127141 lt!127130 (zeroValue!4519 thiss!1504) lt!127139))))

(assert (=> b!253626 (= (apply!246 (+!673 lt!127141 (tuple2!4871 lt!127130 (zeroValue!4519 thiss!1504))) lt!127139) (apply!246 lt!127141 lt!127139))))

(declare-fun lt!127137 () Unit!7841)

(assert (=> b!253626 (= lt!127137 lt!127140)))

(declare-fun lt!127125 () ListLongMap!3783)

(assert (=> b!253626 (= lt!127125 (getCurrentListMapNoExtraKeys!568 (_keys!6830 thiss!1504) (_values!4661 thiss!1504) (mask!10911 thiss!1504) (extraKeys!4415 thiss!1504) (zeroValue!4519 thiss!1504) (minValue!4519 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4678 thiss!1504)))))

(declare-fun lt!127126 () (_ BitVec 64))

(assert (=> b!253626 (= lt!127126 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!127128 () (_ BitVec 64))

(assert (=> b!253626 (= lt!127128 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253626 (= lt!127135 (addApplyDifferent!222 lt!127125 lt!127126 (minValue!4519 thiss!1504) lt!127128))))

(assert (=> b!253626 (= (apply!246 (+!673 lt!127125 (tuple2!4871 lt!127126 (minValue!4519 thiss!1504))) lt!127128) (apply!246 lt!127125 lt!127128))))

(declare-fun b!253627 () Bool)

(declare-fun e!164425 () Bool)

(assert (=> b!253627 (= e!164425 (= (apply!246 lt!127124 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4519 thiss!1504)))))

(declare-fun b!253628 () Bool)

(assert (=> b!253628 (= e!164421 e!164425)))

(declare-fun res!124146 () Bool)

(assert (=> b!253628 (= res!124146 call!23941)))

(assert (=> b!253628 (=> (not res!124146) (not e!164425))))

(declare-fun b!253629 () Bool)

(assert (=> b!253629 (= e!164420 e!164430)))

(declare-fun c!42777 () Bool)

(assert (=> b!253629 (= c!42777 (and (not (= (bvand (extraKeys!4415 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4415 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23937 () Bool)

(assert (=> bm!23937 (= call!23936 call!23940)))

(declare-fun b!253630 () Bool)

(assert (=> b!253630 (= e!164428 call!23937)))

(declare-fun bm!23938 () Bool)

(assert (=> bm!23938 (= call!23939 (+!673 (ite c!42781 call!23940 (ite c!42777 call!23936 call!23937)) (ite (or c!42781 c!42777) (tuple2!4871 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4519 thiss!1504)) (tuple2!4871 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4519 thiss!1504)))))))

(declare-fun b!253631 () Bool)

(declare-fun get!3021 (ValueCell!2919 V!8347) V!8347)

(declare-fun dynLambda!589 (Int (_ BitVec 64)) V!8347)

(assert (=> b!253631 (= e!164419 (= (apply!246 lt!127124 (select (arr!5867 (_keys!6830 thiss!1504)) #b00000000000000000000000000000000)) (get!3021 (select (arr!5866 (_values!4661 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!589 (defaultEntry!4678 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!253631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6213 (_values!4661 thiss!1504))))))

(assert (=> b!253631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6214 (_keys!6830 thiss!1504))))))

(assert (= (and d!61473 c!42781) b!253624))

(assert (= (and d!61473 (not c!42781)) b!253629))

(assert (= (and b!253629 c!42777) b!253613))

(assert (= (and b!253629 (not c!42777)) b!253617))

(assert (= (and b!253617 c!42782) b!253615))

(assert (= (and b!253617 (not c!42782)) b!253630))

(assert (= (or b!253615 b!253630) bm!23934))

(assert (= (or b!253613 bm!23934) bm!23937))

(assert (= (or b!253613 b!253615) bm!23932))

(assert (= (or b!253624 bm!23937) bm!23933))

(assert (= (or b!253624 bm!23932) bm!23938))

(assert (= (and d!61473 res!124147) b!253618))

(assert (= (and d!61473 c!42778) b!253626))

(assert (= (and d!61473 (not c!42778)) b!253621))

(assert (= (and d!61473 res!124148) b!253623))

(assert (= (and b!253623 res!124149) b!253614))

(assert (= (and b!253623 (not res!124144)) b!253612))

(assert (= (and b!253612 res!124145) b!253631))

(assert (= (and b!253623 res!124141) b!253622))

(assert (= (and b!253622 c!42779) b!253620))

(assert (= (and b!253622 (not c!42779)) b!253611))

(assert (= (and b!253620 res!124143) b!253616))

(assert (= (or b!253620 b!253611) bm!23935))

(assert (= (and b!253622 res!124142) b!253619))

(assert (= (and b!253619 c!42780) b!253628))

(assert (= (and b!253619 (not c!42780)) b!253625))

(assert (= (and b!253628 res!124146) b!253627))

(assert (= (or b!253628 b!253625) bm!23936))

(declare-fun b_lambda!8127 () Bool)

(assert (=> (not b_lambda!8127) (not b!253631)))

(declare-fun t!8799 () Bool)

(declare-fun tb!3005 () Bool)

(assert (=> (and b!253332 (= (defaultEntry!4678 thiss!1504) (defaultEntry!4678 thiss!1504)) t!8799) tb!3005))

(declare-fun result!5337 () Bool)

(assert (=> tb!3005 (= result!5337 tp_is_empty!6525)))

(assert (=> b!253631 t!8799))

(declare-fun b_and!13707 () Bool)

(assert (= b_and!13703 (and (=> t!8799 result!5337) b_and!13707)))

(declare-fun m!269401 () Bool)

(assert (=> b!253624 m!269401))

(declare-fun m!269403 () Bool)

(assert (=> bm!23933 m!269403))

(declare-fun m!269405 () Bool)

(assert (=> b!253616 m!269405))

(declare-fun m!269407 () Bool)

(assert (=> b!253627 m!269407))

(assert (=> b!253631 m!269323))

(declare-fun m!269409 () Bool)

(assert (=> b!253631 m!269409))

(declare-fun m!269411 () Bool)

(assert (=> b!253631 m!269411))

(assert (=> b!253631 m!269411))

(declare-fun m!269413 () Bool)

(assert (=> b!253631 m!269413))

(declare-fun m!269415 () Bool)

(assert (=> b!253631 m!269415))

(assert (=> b!253631 m!269323))

(assert (=> b!253631 m!269413))

(declare-fun m!269417 () Bool)

(assert (=> b!253626 m!269417))

(declare-fun m!269419 () Bool)

(assert (=> b!253626 m!269419))

(declare-fun m!269421 () Bool)

(assert (=> b!253626 m!269421))

(declare-fun m!269423 () Bool)

(assert (=> b!253626 m!269423))

(declare-fun m!269425 () Bool)

(assert (=> b!253626 m!269425))

(declare-fun m!269427 () Bool)

(assert (=> b!253626 m!269427))

(declare-fun m!269429 () Bool)

(assert (=> b!253626 m!269429))

(declare-fun m!269431 () Bool)

(assert (=> b!253626 m!269431))

(declare-fun m!269433 () Bool)

(assert (=> b!253626 m!269433))

(declare-fun m!269435 () Bool)

(assert (=> b!253626 m!269435))

(assert (=> b!253626 m!269323))

(declare-fun m!269437 () Bool)

(assert (=> b!253626 m!269437))

(assert (=> b!253626 m!269417))

(declare-fun m!269439 () Bool)

(assert (=> b!253626 m!269439))

(assert (=> b!253626 m!269403))

(assert (=> b!253626 m!269427))

(declare-fun m!269441 () Bool)

(assert (=> b!253626 m!269441))

(assert (=> b!253626 m!269423))

(declare-fun m!269443 () Bool)

(assert (=> b!253626 m!269443))

(assert (=> b!253626 m!269429))

(declare-fun m!269445 () Bool)

(assert (=> b!253626 m!269445))

(assert (=> b!253612 m!269323))

(assert (=> b!253612 m!269323))

(declare-fun m!269447 () Bool)

(assert (=> b!253612 m!269447))

(declare-fun m!269449 () Bool)

(assert (=> bm!23935 m!269449))

(assert (=> d!61473 m!269227))

(assert (=> b!253618 m!269323))

(assert (=> b!253618 m!269323))

(assert (=> b!253618 m!269325))

(assert (=> b!253614 m!269323))

(assert (=> b!253614 m!269323))

(assert (=> b!253614 m!269325))

(declare-fun m!269451 () Bool)

(assert (=> bm!23938 m!269451))

(declare-fun m!269453 () Bool)

(assert (=> bm!23936 m!269453))

(assert (=> b!253339 d!61473))

(declare-fun mapIsEmpty!11106 () Bool)

(declare-fun mapRes!11106 () Bool)

(assert (=> mapIsEmpty!11106 mapRes!11106))

(declare-fun b!253640 () Bool)

(declare-fun e!164437 () Bool)

(assert (=> b!253640 (= e!164437 tp_is_empty!6525)))

(declare-fun mapNonEmpty!11106 () Bool)

(declare-fun tp!23283 () Bool)

(assert (=> mapNonEmpty!11106 (= mapRes!11106 (and tp!23283 e!164437))))

(declare-fun mapKey!11106 () (_ BitVec 32))

(declare-fun mapRest!11106 () (Array (_ BitVec 32) ValueCell!2919))

(declare-fun mapValue!11106 () ValueCell!2919)

(assert (=> mapNonEmpty!11106 (= mapRest!11100 (store mapRest!11106 mapKey!11106 mapValue!11106))))

(declare-fun b!253641 () Bool)

(declare-fun e!164436 () Bool)

(assert (=> b!253641 (= e!164436 tp_is_empty!6525)))

(declare-fun condMapEmpty!11106 () Bool)

(declare-fun mapDefault!11106 () ValueCell!2919)

(assert (=> mapNonEmpty!11100 (= condMapEmpty!11106 (= mapRest!11100 ((as const (Array (_ BitVec 32) ValueCell!2919)) mapDefault!11106)))))

(assert (=> mapNonEmpty!11100 (= tp!23274 (and e!164436 mapRes!11106))))

(assert (= (and mapNonEmpty!11100 condMapEmpty!11106) mapIsEmpty!11106))

(assert (= (and mapNonEmpty!11100 (not condMapEmpty!11106)) mapNonEmpty!11106))

(assert (= (and mapNonEmpty!11106 ((_ is ValueCellFull!2919) mapValue!11106)) b!253640))

(assert (= (and mapNonEmpty!11100 ((_ is ValueCellFull!2919) mapDefault!11106)) b!253641))

(declare-fun m!269455 () Bool)

(assert (=> mapNonEmpty!11106 m!269455))

(declare-fun b_lambda!8129 () Bool)

(assert (= b_lambda!8127 (or (and b!253332 b_free!6663) b_lambda!8129)))

(check-sat (not b!253566) (not b!253626) (not b!253520) b_and!13707 (not b!253614) (not bm!23936) (not b_next!6663) tp_is_empty!6525 (not b!253568) (not b!253541) (not b!253535) (not bm!23917) (not bm!23933) (not d!61447) (not b_lambda!8129) (not b!253618) (not b!253519) (not b!253537) (not mapNonEmpty!11106) (not b!253465) (not bm!23916) (not b!253431) (not b!253467) (not b!253482) (not b!253547) (not b!253550) (not b!253624) (not d!61439) (not b!253556) (not bm!23914) (not b!253500) (not b!253631) (not b!253559) (not d!61471) (not b!253543) (not d!61463) (not bm!23915) (not b!253534) (not b!253627) (not b!253612) (not d!61451) (not b!253508) (not b!253616) (not bm!23904) (not bm!23911) (not d!61473) (not b!253499) (not b!253509) (not d!61431) (not b!253510) (not d!61429) (not bm!23908) (not bm!23938) (not b!253501) (not b!253542) (not d!61467) (not b!253522) (not bm!23905) (not d!61433) (not bm!23935))
(check-sat b_and!13707 (not b_next!6663))
