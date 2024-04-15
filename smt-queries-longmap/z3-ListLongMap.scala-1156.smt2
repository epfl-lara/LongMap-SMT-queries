; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24288 () Bool)

(assert start!24288)

(declare-fun b!254224 () Bool)

(declare-fun b_free!6685 () Bool)

(declare-fun b_next!6685 () Bool)

(assert (=> b!254224 (= b_free!6685 (not b_next!6685))))

(declare-fun tp!23343 () Bool)

(declare-fun b_and!13701 () Bool)

(assert (=> b!254224 (= tp!23343 b_and!13701)))

(declare-fun b!254216 () Bool)

(declare-fun c!42874 () Bool)

(declare-datatypes ((SeekEntryResult!1145 0))(
  ( (MissingZero!1145 (index!6750 (_ BitVec 32))) (Found!1145 (index!6751 (_ BitVec 32))) (Intermediate!1145 (undefined!1957 Bool) (index!6752 (_ BitVec 32)) (x!24860 (_ BitVec 32))) (Undefined!1145) (MissingVacant!1145 (index!6753 (_ BitVec 32))) )
))
(declare-fun lt!127280 () SeekEntryResult!1145)

(get-info :version)

(assert (=> b!254216 (= c!42874 ((_ is MissingVacant!1145) lt!127280))))

(declare-fun e!164772 () Bool)

(declare-fun e!164785 () Bool)

(assert (=> b!254216 (= e!164772 e!164785)))

(declare-fun b!254217 () Bool)

(declare-fun e!164784 () Bool)

(declare-fun tp_is_empty!6547 () Bool)

(assert (=> b!254217 (= e!164784 tp_is_empty!6547)))

(declare-fun b!254218 () Bool)

(declare-fun e!164776 () Bool)

(declare-fun e!164777 () Bool)

(assert (=> b!254218 (= e!164776 e!164777)))

(declare-fun res!124431 () Bool)

(assert (=> b!254218 (=> (not res!124431) (not e!164777))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!254218 (= res!124431 (or (= lt!127280 (MissingZero!1145 index!297)) (= lt!127280 (MissingVacant!1145 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!8377 0))(
  ( (V!8378 (val!3318 Int)) )
))
(declare-datatypes ((ValueCell!2930 0))(
  ( (ValueCellFull!2930 (v!5386 V!8377)) (EmptyCell!2930) )
))
(declare-datatypes ((array!12417 0))(
  ( (array!12418 (arr!5883 (Array (_ BitVec 32) ValueCell!2930)) (size!6231 (_ BitVec 32))) )
))
(declare-datatypes ((array!12419 0))(
  ( (array!12420 (arr!5884 (Array (_ BitVec 32) (_ BitVec 64))) (size!6232 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3760 0))(
  ( (LongMapFixedSize!3761 (defaultEntry!4693 Int) (mask!10938 (_ BitVec 32)) (extraKeys!4430 (_ BitVec 32)) (zeroValue!4534 V!8377) (minValue!4534 V!8377) (_size!1929 (_ BitVec 32)) (_keys!6846 array!12419) (_values!4676 array!12417) (_vacant!1929 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3760)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12419 (_ BitVec 32)) SeekEntryResult!1145)

(assert (=> b!254218 (= lt!127280 (seekEntryOrOpen!0 key!932 (_keys!6846 thiss!1504) (mask!10938 thiss!1504)))))

(declare-fun b!254219 () Bool)

(declare-datatypes ((Unit!7845 0))(
  ( (Unit!7846) )
))
(declare-fun e!164782 () Unit!7845)

(declare-fun Unit!7847 () Unit!7845)

(assert (=> b!254219 (= e!164782 Unit!7847)))

(declare-fun b!254220 () Bool)

(declare-fun e!164783 () Bool)

(assert (=> b!254220 (= e!164783 tp_is_empty!6547)))

(declare-fun b!254222 () Bool)

(declare-fun e!164781 () Unit!7845)

(declare-fun lt!127279 () Unit!7845)

(assert (=> b!254222 (= e!164781 lt!127279)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!413 (array!12419 array!12417 (_ BitVec 32) (_ BitVec 32) V!8377 V!8377 (_ BitVec 64) Int) Unit!7845)

(assert (=> b!254222 (= lt!127279 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!413 (_keys!6846 thiss!1504) (_values!4676 thiss!1504) (mask!10938 thiss!1504) (extraKeys!4430 thiss!1504) (zeroValue!4534 thiss!1504) (minValue!4534 thiss!1504) key!932 (defaultEntry!4693 thiss!1504)))))

(declare-fun c!42876 () Bool)

(assert (=> b!254222 (= c!42876 ((_ is MissingZero!1145) lt!127280))))

(assert (=> b!254222 e!164772))

(declare-fun mapIsEmpty!11136 () Bool)

(declare-fun mapRes!11136 () Bool)

(assert (=> mapIsEmpty!11136 mapRes!11136))

(declare-fun b!254223 () Bool)

(assert (=> b!254223 (= e!164785 ((_ is Undefined!1145) lt!127280))))

(declare-fun e!164774 () Bool)

(declare-fun e!164773 () Bool)

(declare-fun array_inv!3881 (array!12419) Bool)

(declare-fun array_inv!3882 (array!12417) Bool)

(assert (=> b!254224 (= e!164773 (and tp!23343 tp_is_empty!6547 (array_inv!3881 (_keys!6846 thiss!1504)) (array_inv!3882 (_values!4676 thiss!1504)) e!164774))))

(declare-fun b!254225 () Bool)

(declare-fun res!124438 () Bool)

(declare-fun e!164779 () Bool)

(assert (=> b!254225 (=> (not res!124438) (not e!164779))))

(declare-fun call!23976 () Bool)

(assert (=> b!254225 (= res!124438 call!23976)))

(assert (=> b!254225 (= e!164772 e!164779)))

(declare-fun b!254226 () Bool)

(declare-fun Unit!7848 () Unit!7845)

(assert (=> b!254226 (= e!164781 Unit!7848)))

(declare-fun lt!127283 () Unit!7845)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!415 (array!12419 array!12417 (_ BitVec 32) (_ BitVec 32) V!8377 V!8377 (_ BitVec 64) Int) Unit!7845)

(assert (=> b!254226 (= lt!127283 (lemmaInListMapThenSeekEntryOrOpenFindsIt!415 (_keys!6846 thiss!1504) (_values!4676 thiss!1504) (mask!10938 thiss!1504) (extraKeys!4430 thiss!1504) (zeroValue!4534 thiss!1504) (minValue!4534 thiss!1504) key!932 (defaultEntry!4693 thiss!1504)))))

(assert (=> b!254226 false))

(declare-fun mapNonEmpty!11136 () Bool)

(declare-fun tp!23342 () Bool)

(assert (=> mapNonEmpty!11136 (= mapRes!11136 (and tp!23342 e!164784))))

(declare-fun mapKey!11136 () (_ BitVec 32))

(declare-fun mapValue!11136 () ValueCell!2930)

(declare-fun mapRest!11136 () (Array (_ BitVec 32) ValueCell!2930))

(assert (=> mapNonEmpty!11136 (= (arr!5883 (_values!4676 thiss!1504)) (store mapRest!11136 mapKey!11136 mapValue!11136))))

(declare-fun bm!23973 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23973 (= call!23976 (inRange!0 (ite c!42876 (index!6750 lt!127280) (index!6753 lt!127280)) (mask!10938 thiss!1504)))))

(declare-fun b!254227 () Bool)

(declare-fun res!124436 () Bool)

(assert (=> b!254227 (= res!124436 (= (select (arr!5884 (_keys!6846 thiss!1504)) (index!6753 lt!127280)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164775 () Bool)

(assert (=> b!254227 (=> (not res!124436) (not e!164775))))

(declare-fun res!124433 () Bool)

(assert (=> start!24288 (=> (not res!124433) (not e!164776))))

(declare-fun valid!1471 (LongMapFixedSize!3760) Bool)

(assert (=> start!24288 (= res!124433 (valid!1471 thiss!1504))))

(assert (=> start!24288 e!164776))

(assert (=> start!24288 e!164773))

(assert (=> start!24288 true))

(declare-fun b!254221 () Bool)

(declare-fun e!164778 () Bool)

(assert (=> b!254221 (= e!164778 true)))

(declare-fun lt!127278 () Bool)

(declare-datatypes ((List!3740 0))(
  ( (Nil!3737) (Cons!3736 (h!4398 (_ BitVec 64)) (t!8778 List!3740)) )
))
(declare-fun arrayNoDuplicates!0 (array!12419 (_ BitVec 32) List!3740) Bool)

(assert (=> b!254221 (= lt!127278 (arrayNoDuplicates!0 (_keys!6846 thiss!1504) #b00000000000000000000000000000000 Nil!3737))))

(declare-fun b!254228 () Bool)

(declare-fun res!124430 () Bool)

(assert (=> b!254228 (=> (not res!124430) (not e!164779))))

(assert (=> b!254228 (= res!124430 (= (select (arr!5884 (_keys!6846 thiss!1504)) (index!6750 lt!127280)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254229 () Bool)

(declare-fun res!124429 () Bool)

(assert (=> b!254229 (=> res!124429 e!164778)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12419 (_ BitVec 32)) Bool)

(assert (=> b!254229 (= res!124429 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6846 thiss!1504) (mask!10938 thiss!1504))))))

(declare-fun b!254230 () Bool)

(declare-fun e!164786 () Bool)

(assert (=> b!254230 (= e!164777 e!164786)))

(declare-fun res!124434 () Bool)

(assert (=> b!254230 (=> (not res!124434) (not e!164786))))

(assert (=> b!254230 (= res!124434 (inRange!0 index!297 (mask!10938 thiss!1504)))))

(declare-fun lt!127275 () Unit!7845)

(assert (=> b!254230 (= lt!127275 e!164781)))

(declare-fun c!42873 () Bool)

(declare-datatypes ((tuple2!4836 0))(
  ( (tuple2!4837 (_1!2429 (_ BitVec 64)) (_2!2429 V!8377)) )
))
(declare-datatypes ((List!3741 0))(
  ( (Nil!3738) (Cons!3737 (h!4399 tuple2!4836) (t!8779 List!3741)) )
))
(declare-datatypes ((ListLongMap!3739 0))(
  ( (ListLongMap!3740 (toList!1885 List!3741)) )
))
(declare-fun contains!1820 (ListLongMap!3739 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1394 (array!12419 array!12417 (_ BitVec 32) (_ BitVec 32) V!8377 V!8377 (_ BitVec 32) Int) ListLongMap!3739)

(assert (=> b!254230 (= c!42873 (contains!1820 (getCurrentListMap!1394 (_keys!6846 thiss!1504) (_values!4676 thiss!1504) (mask!10938 thiss!1504) (extraKeys!4430 thiss!1504) (zeroValue!4534 thiss!1504) (minValue!4534 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4693 thiss!1504)) key!932))))

(declare-fun b!254231 () Bool)

(declare-fun res!124432 () Bool)

(assert (=> b!254231 (=> (not res!124432) (not e!164776))))

(assert (=> b!254231 (= res!124432 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!254232 () Bool)

(assert (=> b!254232 (= e!164786 (not e!164778))))

(declare-fun res!124428 () Bool)

(assert (=> b!254232 (=> res!124428 e!164778)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!254232 (= res!124428 (not (validMask!0 (mask!10938 thiss!1504))))))

(declare-fun lt!127284 () array!12419)

(assert (=> b!254232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127284 (mask!10938 thiss!1504))))

(declare-fun lt!127281 () Unit!7845)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12419 (_ BitVec 32) (_ BitVec 32)) Unit!7845)

(assert (=> b!254232 (= lt!127281 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6846 thiss!1504) index!297 (mask!10938 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12419 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254232 (= (arrayCountValidKeys!0 lt!127284 #b00000000000000000000000000000000 (size!6232 (_keys!6846 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6846 thiss!1504) #b00000000000000000000000000000000 (size!6232 (_keys!6846 thiss!1504)))))))

(declare-fun lt!127285 () Unit!7845)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12419 (_ BitVec 32) (_ BitVec 64)) Unit!7845)

(assert (=> b!254232 (= lt!127285 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6846 thiss!1504) index!297 key!932))))

(assert (=> b!254232 (arrayNoDuplicates!0 lt!127284 #b00000000000000000000000000000000 Nil!3737)))

(assert (=> b!254232 (= lt!127284 (array!12420 (store (arr!5884 (_keys!6846 thiss!1504)) index!297 key!932) (size!6232 (_keys!6846 thiss!1504))))))

(declare-fun lt!127282 () Unit!7845)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12419 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3740) Unit!7845)

(assert (=> b!254232 (= lt!127282 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6846 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3737))))

(declare-fun lt!127276 () Unit!7845)

(assert (=> b!254232 (= lt!127276 e!164782)))

(declare-fun c!42875 () Bool)

(declare-fun arrayContainsKey!0 (array!12419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!254232 (= c!42875 (arrayContainsKey!0 (_keys!6846 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254233 () Bool)

(declare-fun call!23977 () Bool)

(assert (=> b!254233 (= e!164779 (not call!23977))))

(declare-fun b!254234 () Bool)

(declare-fun res!124437 () Bool)

(assert (=> b!254234 (=> res!124437 e!164778)))

(assert (=> b!254234 (= res!124437 (or (not (= (size!6231 (_values!4676 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10938 thiss!1504)))) (not (= (size!6232 (_keys!6846 thiss!1504)) (size!6231 (_values!4676 thiss!1504)))) (bvslt (mask!10938 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4430 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4430 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun bm!23974 () Bool)

(assert (=> bm!23974 (= call!23977 (arrayContainsKey!0 (_keys!6846 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254235 () Bool)

(assert (=> b!254235 (= e!164775 (not call!23977))))

(declare-fun b!254236 () Bool)

(assert (=> b!254236 (= e!164785 e!164775)))

(declare-fun res!124435 () Bool)

(assert (=> b!254236 (= res!124435 call!23976)))

(assert (=> b!254236 (=> (not res!124435) (not e!164775))))

(declare-fun b!254237 () Bool)

(assert (=> b!254237 (= e!164774 (and e!164783 mapRes!11136))))

(declare-fun condMapEmpty!11136 () Bool)

(declare-fun mapDefault!11136 () ValueCell!2930)

(assert (=> b!254237 (= condMapEmpty!11136 (= (arr!5883 (_values!4676 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2930)) mapDefault!11136)))))

(declare-fun b!254238 () Bool)

(declare-fun Unit!7849 () Unit!7845)

(assert (=> b!254238 (= e!164782 Unit!7849)))

(declare-fun lt!127277 () Unit!7845)

(declare-fun lemmaArrayContainsKeyThenInListMap!224 (array!12419 array!12417 (_ BitVec 32) (_ BitVec 32) V!8377 V!8377 (_ BitVec 64) (_ BitVec 32) Int) Unit!7845)

(assert (=> b!254238 (= lt!127277 (lemmaArrayContainsKeyThenInListMap!224 (_keys!6846 thiss!1504) (_values!4676 thiss!1504) (mask!10938 thiss!1504) (extraKeys!4430 thiss!1504) (zeroValue!4534 thiss!1504) (minValue!4534 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4693 thiss!1504)))))

(assert (=> b!254238 false))

(assert (= (and start!24288 res!124433) b!254231))

(assert (= (and b!254231 res!124432) b!254218))

(assert (= (and b!254218 res!124431) b!254230))

(assert (= (and b!254230 c!42873) b!254226))

(assert (= (and b!254230 (not c!42873)) b!254222))

(assert (= (and b!254222 c!42876) b!254225))

(assert (= (and b!254222 (not c!42876)) b!254216))

(assert (= (and b!254225 res!124438) b!254228))

(assert (= (and b!254228 res!124430) b!254233))

(assert (= (and b!254216 c!42874) b!254236))

(assert (= (and b!254216 (not c!42874)) b!254223))

(assert (= (and b!254236 res!124435) b!254227))

(assert (= (and b!254227 res!124436) b!254235))

(assert (= (or b!254225 b!254236) bm!23973))

(assert (= (or b!254233 b!254235) bm!23974))

(assert (= (and b!254230 res!124434) b!254232))

(assert (= (and b!254232 c!42875) b!254238))

(assert (= (and b!254232 (not c!42875)) b!254219))

(assert (= (and b!254232 (not res!124428)) b!254234))

(assert (= (and b!254234 (not res!124437)) b!254229))

(assert (= (and b!254229 (not res!124429)) b!254221))

(assert (= (and b!254237 condMapEmpty!11136) mapIsEmpty!11136))

(assert (= (and b!254237 (not condMapEmpty!11136)) mapNonEmpty!11136))

(assert (= (and mapNonEmpty!11136 ((_ is ValueCellFull!2930) mapValue!11136)) b!254217))

(assert (= (and b!254237 ((_ is ValueCellFull!2930) mapDefault!11136)) b!254220))

(assert (= b!254224 b!254237))

(assert (= start!24288 b!254224))

(declare-fun m!269333 () Bool)

(assert (=> bm!23973 m!269333))

(declare-fun m!269335 () Bool)

(assert (=> b!254222 m!269335))

(declare-fun m!269337 () Bool)

(assert (=> bm!23974 m!269337))

(declare-fun m!269339 () Bool)

(assert (=> b!254238 m!269339))

(declare-fun m!269341 () Bool)

(assert (=> b!254226 m!269341))

(declare-fun m!269343 () Bool)

(assert (=> start!24288 m!269343))

(declare-fun m!269345 () Bool)

(assert (=> mapNonEmpty!11136 m!269345))

(declare-fun m!269347 () Bool)

(assert (=> b!254228 m!269347))

(declare-fun m!269349 () Bool)

(assert (=> b!254221 m!269349))

(declare-fun m!269351 () Bool)

(assert (=> b!254232 m!269351))

(assert (=> b!254232 m!269337))

(declare-fun m!269353 () Bool)

(assert (=> b!254232 m!269353))

(declare-fun m!269355 () Bool)

(assert (=> b!254232 m!269355))

(declare-fun m!269357 () Bool)

(assert (=> b!254232 m!269357))

(declare-fun m!269359 () Bool)

(assert (=> b!254232 m!269359))

(declare-fun m!269361 () Bool)

(assert (=> b!254232 m!269361))

(declare-fun m!269363 () Bool)

(assert (=> b!254232 m!269363))

(declare-fun m!269365 () Bool)

(assert (=> b!254232 m!269365))

(declare-fun m!269367 () Bool)

(assert (=> b!254232 m!269367))

(declare-fun m!269369 () Bool)

(assert (=> b!254230 m!269369))

(declare-fun m!269371 () Bool)

(assert (=> b!254230 m!269371))

(assert (=> b!254230 m!269371))

(declare-fun m!269373 () Bool)

(assert (=> b!254230 m!269373))

(declare-fun m!269375 () Bool)

(assert (=> b!254227 m!269375))

(declare-fun m!269377 () Bool)

(assert (=> b!254218 m!269377))

(declare-fun m!269379 () Bool)

(assert (=> b!254229 m!269379))

(declare-fun m!269381 () Bool)

(assert (=> b!254224 m!269381))

(declare-fun m!269383 () Bool)

(assert (=> b!254224 m!269383))

(check-sat (not b_next!6685) (not bm!23974) tp_is_empty!6547 (not b!254226) (not b!254230) b_and!13701 (not start!24288) (not b!254229) (not b!254221) (not b!254238) (not b!254218) (not bm!23973) (not mapNonEmpty!11136) (not b!254232) (not b!254222) (not b!254224))
(check-sat b_and!13701 (not b_next!6685))
