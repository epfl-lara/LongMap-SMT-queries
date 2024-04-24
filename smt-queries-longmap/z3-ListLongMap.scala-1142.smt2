; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23622 () Bool)

(assert start!23622)

(declare-fun b!248294 () Bool)

(declare-fun b_free!6601 () Bool)

(declare-fun b_next!6601 () Bool)

(assert (=> b!248294 (= b_free!6601 (not b_next!6601))))

(declare-fun tp!23053 () Bool)

(declare-fun b_and!13619 () Bool)

(assert (=> b!248294 (= tp!23053 b_and!13619)))

(declare-fun b!248276 () Bool)

(declare-datatypes ((Unit!7660 0))(
  ( (Unit!7661) )
))
(declare-fun e!161050 () Unit!7660)

(declare-fun Unit!7662 () Unit!7660)

(assert (=> b!248276 (= e!161050 Unit!7662)))

(declare-fun lt!124369 () Unit!7660)

(declare-datatypes ((V!8265 0))(
  ( (V!8266 (val!3276 Int)) )
))
(declare-datatypes ((ValueCell!2888 0))(
  ( (ValueCellFull!2888 (v!5336 V!8265)) (EmptyCell!2888) )
))
(declare-datatypes ((array!12233 0))(
  ( (array!12234 (arr!5803 (Array (_ BitVec 32) ValueCell!2888)) (size!6146 (_ BitVec 32))) )
))
(declare-datatypes ((array!12235 0))(
  ( (array!12236 (arr!5804 (Array (_ BitVec 32) (_ BitVec 64))) (size!6147 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3676 0))(
  ( (LongMapFixedSize!3677 (defaultEntry!4591 Int) (mask!10739 (_ BitVec 32)) (extraKeys!4328 (_ BitVec 32)) (zeroValue!4432 V!8265) (minValue!4432 V!8265) (_size!1887 (_ BitVec 32)) (_keys!6715 array!12235) (_values!4574 array!12233) (_vacant!1887 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3676)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!204 (array!12235 array!12233 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) (_ BitVec 32) Int) Unit!7660)

(assert (=> b!248276 (= lt!124369 (lemmaArrayContainsKeyThenInListMap!204 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(assert (=> b!248276 false))

(declare-fun b!248277 () Bool)

(declare-fun res!121678 () Bool)

(declare-fun e!161042 () Bool)

(assert (=> b!248277 (=> res!121678 e!161042)))

(declare-fun lt!124371 () Bool)

(assert (=> b!248277 (= res!121678 lt!124371)))

(declare-fun mapNonEmpty!10973 () Bool)

(declare-fun mapRes!10973 () Bool)

(declare-fun tp!23054 () Bool)

(declare-fun e!161046 () Bool)

(assert (=> mapNonEmpty!10973 (= mapRes!10973 (and tp!23054 e!161046))))

(declare-fun mapKey!10973 () (_ BitVec 32))

(declare-fun mapValue!10973 () ValueCell!2888)

(declare-fun mapRest!10973 () (Array (_ BitVec 32) ValueCell!2888))

(assert (=> mapNonEmpty!10973 (= (arr!5803 (_values!4574 thiss!1504)) (store mapRest!10973 mapKey!10973 mapValue!10973))))

(declare-fun b!248278 () Bool)

(declare-fun e!161044 () Bool)

(declare-fun e!161051 () Bool)

(assert (=> b!248278 (= e!161044 e!161051)))

(declare-fun res!121672 () Bool)

(assert (=> b!248278 (=> (not res!121672) (not e!161051))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248278 (= res!121672 (inRange!0 index!297 (mask!10739 thiss!1504)))))

(declare-fun lt!124365 () Unit!7660)

(declare-fun e!161052 () Unit!7660)

(assert (=> b!248278 (= lt!124365 e!161052)))

(declare-fun c!41595 () Bool)

(declare-datatypes ((tuple2!4750 0))(
  ( (tuple2!4751 (_1!2386 (_ BitVec 64)) (_2!2386 V!8265)) )
))
(declare-datatypes ((List!3626 0))(
  ( (Nil!3623) (Cons!3622 (h!4280 tuple2!4750) (t!8643 List!3626)) )
))
(declare-datatypes ((ListLongMap!3665 0))(
  ( (ListLongMap!3666 (toList!1848 List!3626)) )
))
(declare-fun contains!1779 (ListLongMap!3665 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1380 (array!12235 array!12233 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 32) Int) ListLongMap!3665)

(assert (=> b!248278 (= c!41595 (contains!1779 (getCurrentListMap!1380 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)) key!932))))

(declare-fun b!248279 () Bool)

(declare-fun e!161041 () Bool)

(declare-fun e!161043 () Bool)

(assert (=> b!248279 (= e!161041 e!161043)))

(declare-fun res!121682 () Bool)

(declare-fun call!23249 () Bool)

(assert (=> b!248279 (= res!121682 call!23249)))

(assert (=> b!248279 (=> (not res!121682) (not e!161043))))

(declare-fun b!248280 () Bool)

(declare-fun e!161054 () Bool)

(assert (=> b!248280 (= e!161054 e!161044)))

(declare-fun res!121681 () Bool)

(assert (=> b!248280 (=> (not res!121681) (not e!161044))))

(declare-datatypes ((SeekEntryResult!1076 0))(
  ( (MissingZero!1076 (index!6474 (_ BitVec 32))) (Found!1076 (index!6475 (_ BitVec 32))) (Intermediate!1076 (undefined!1888 Bool) (index!6476 (_ BitVec 32)) (x!24538 (_ BitVec 32))) (Undefined!1076) (MissingVacant!1076 (index!6477 (_ BitVec 32))) )
))
(declare-fun lt!124368 () SeekEntryResult!1076)

(assert (=> b!248280 (= res!121681 (or (= lt!124368 (MissingZero!1076 index!297)) (= lt!124368 (MissingVacant!1076 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12235 (_ BitVec 32)) SeekEntryResult!1076)

(assert (=> b!248280 (= lt!124368 (seekEntryOrOpen!0 key!932 (_keys!6715 thiss!1504) (mask!10739 thiss!1504)))))

(declare-fun b!248281 () Bool)

(declare-fun e!161053 () Bool)

(declare-fun e!161045 () Bool)

(assert (=> b!248281 (= e!161053 (and e!161045 mapRes!10973))))

(declare-fun condMapEmpty!10973 () Bool)

(declare-fun mapDefault!10973 () ValueCell!2888)

(assert (=> b!248281 (= condMapEmpty!10973 (= (arr!5803 (_values!4574 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2888)) mapDefault!10973)))))

(declare-fun b!248282 () Bool)

(declare-fun res!121677 () Bool)

(assert (=> b!248282 (= res!121677 (= (select (arr!5804 (_keys!6715 thiss!1504)) (index!6477 lt!124368)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248282 (=> (not res!121677) (not e!161043))))

(declare-fun b!248283 () Bool)

(declare-fun Unit!7663 () Unit!7660)

(assert (=> b!248283 (= e!161050 Unit!7663)))

(declare-fun b!248284 () Bool)

(declare-fun res!121673 () Bool)

(declare-fun e!161049 () Bool)

(assert (=> b!248284 (=> (not res!121673) (not e!161049))))

(assert (=> b!248284 (= res!121673 call!23249)))

(declare-fun e!161047 () Bool)

(assert (=> b!248284 (= e!161047 e!161049)))

(declare-fun b!248285 () Bool)

(declare-fun res!121680 () Bool)

(assert (=> b!248285 (=> res!121680 e!161042)))

(assert (=> b!248285 (= res!121680 (or (not (= (size!6147 (_keys!6715 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10739 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6147 (_keys!6715 thiss!1504)))))))

(declare-fun b!248286 () Bool)

(declare-fun tp_is_empty!6463 () Bool)

(assert (=> b!248286 (= e!161046 tp_is_empty!6463)))

(declare-fun b!248287 () Bool)

(declare-fun c!41594 () Bool)

(get-info :version)

(assert (=> b!248287 (= c!41594 ((_ is MissingVacant!1076) lt!124368))))

(assert (=> b!248287 (= e!161047 e!161041)))

(declare-fun b!248289 () Bool)

(declare-fun call!23250 () Bool)

(assert (=> b!248289 (= e!161043 (not call!23250))))

(declare-fun b!248290 () Bool)

(declare-fun res!121679 () Bool)

(assert (=> b!248290 (=> res!121679 e!161042)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12235 (_ BitVec 32)) Bool)

(assert (=> b!248290 (= res!121679 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6715 thiss!1504) (mask!10739 thiss!1504))))))

(declare-fun b!248291 () Bool)

(declare-fun lt!124367 () Unit!7660)

(assert (=> b!248291 (= e!161052 lt!124367)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!379 (array!12235 array!12233 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) Int) Unit!7660)

(assert (=> b!248291 (= lt!124367 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!379 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)))))

(declare-fun c!41597 () Bool)

(assert (=> b!248291 (= c!41597 ((_ is MissingZero!1076) lt!124368))))

(assert (=> b!248291 e!161047))

(declare-fun b!248292 () Bool)

(declare-fun res!121675 () Bool)

(assert (=> b!248292 (=> (not res!121675) (not e!161049))))

(assert (=> b!248292 (= res!121675 (= (select (arr!5804 (_keys!6715 thiss!1504)) (index!6474 lt!124368)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248293 () Bool)

(declare-fun res!121683 () Bool)

(assert (=> b!248293 (=> res!121683 e!161042)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!248293 (= res!121683 (not (validKeyInArray!0 key!932)))))

(declare-fun e!161040 () Bool)

(declare-fun array_inv!3813 (array!12235) Bool)

(declare-fun array_inv!3814 (array!12233) Bool)

(assert (=> b!248294 (= e!161040 (and tp!23053 tp_is_empty!6463 (array_inv!3813 (_keys!6715 thiss!1504)) (array_inv!3814 (_values!4574 thiss!1504)) e!161053))))

(declare-fun b!248295 () Bool)

(declare-fun Unit!7664 () Unit!7660)

(assert (=> b!248295 (= e!161052 Unit!7664)))

(declare-fun lt!124363 () Unit!7660)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!383 (array!12235 array!12233 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) Int) Unit!7660)

(assert (=> b!248295 (= lt!124363 (lemmaInListMapThenSeekEntryOrOpenFindsIt!383 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)))))

(assert (=> b!248295 false))

(declare-fun b!248296 () Bool)

(declare-fun res!121684 () Bool)

(assert (=> b!248296 (=> (not res!121684) (not e!161054))))

(assert (=> b!248296 (= res!121684 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10973 () Bool)

(assert (=> mapIsEmpty!10973 mapRes!10973))

(declare-fun bm!23246 () Bool)

(declare-fun arrayContainsKey!0 (array!12235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23246 (= call!23250 (arrayContainsKey!0 (_keys!6715 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248297 () Bool)

(declare-datatypes ((List!3627 0))(
  ( (Nil!3624) (Cons!3623 (h!4281 (_ BitVec 64)) (t!8644 List!3627)) )
))
(declare-fun arrayNoDuplicates!0 (array!12235 (_ BitVec 32) List!3627) Bool)

(assert (=> b!248297 (= e!161042 (arrayNoDuplicates!0 (_keys!6715 thiss!1504) #b00000000000000000000000000000000 Nil!3624))))

(declare-fun bm!23247 () Bool)

(assert (=> bm!23247 (= call!23249 (inRange!0 (ite c!41597 (index!6474 lt!124368) (index!6477 lt!124368)) (mask!10739 thiss!1504)))))

(declare-fun b!248298 () Bool)

(assert (=> b!248298 (= e!161041 ((_ is Undefined!1076) lt!124368))))

(declare-fun res!121674 () Bool)

(assert (=> start!23622 (=> (not res!121674) (not e!161054))))

(declare-fun valid!1448 (LongMapFixedSize!3676) Bool)

(assert (=> start!23622 (= res!121674 (valid!1448 thiss!1504))))

(assert (=> start!23622 e!161054))

(assert (=> start!23622 e!161040))

(assert (=> start!23622 true))

(declare-fun b!248288 () Bool)

(assert (=> b!248288 (= e!161051 (not e!161042))))

(declare-fun res!121676 () Bool)

(assert (=> b!248288 (=> res!121676 e!161042)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!248288 (= res!121676 (not (validMask!0 (mask!10739 thiss!1504))))))

(declare-fun lt!124366 () array!12235)

(declare-fun arrayCountValidKeys!0 (array!12235 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!248288 (= (arrayCountValidKeys!0 lt!124366 #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6715 thiss!1504) #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504)))))))

(declare-fun lt!124362 () Unit!7660)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12235 (_ BitVec 32) (_ BitVec 64)) Unit!7660)

(assert (=> b!248288 (= lt!124362 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6715 thiss!1504) index!297 key!932))))

(assert (=> b!248288 (arrayNoDuplicates!0 lt!124366 #b00000000000000000000000000000000 Nil!3624)))

(assert (=> b!248288 (= lt!124366 (array!12236 (store (arr!5804 (_keys!6715 thiss!1504)) index!297 key!932) (size!6147 (_keys!6715 thiss!1504))))))

(declare-fun lt!124370 () Unit!7660)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12235 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3627) Unit!7660)

(assert (=> b!248288 (= lt!124370 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6715 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3624))))

(declare-fun lt!124364 () Unit!7660)

(assert (=> b!248288 (= lt!124364 e!161050)))

(declare-fun c!41596 () Bool)

(assert (=> b!248288 (= c!41596 lt!124371)))

(assert (=> b!248288 (= lt!124371 (arrayContainsKey!0 (_keys!6715 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248299 () Bool)

(assert (=> b!248299 (= e!161045 tp_is_empty!6463)))

(declare-fun b!248300 () Bool)

(assert (=> b!248300 (= e!161049 (not call!23250))))

(assert (= (and start!23622 res!121674) b!248296))

(assert (= (and b!248296 res!121684) b!248280))

(assert (= (and b!248280 res!121681) b!248278))

(assert (= (and b!248278 c!41595) b!248295))

(assert (= (and b!248278 (not c!41595)) b!248291))

(assert (= (and b!248291 c!41597) b!248284))

(assert (= (and b!248291 (not c!41597)) b!248287))

(assert (= (and b!248284 res!121673) b!248292))

(assert (= (and b!248292 res!121675) b!248300))

(assert (= (and b!248287 c!41594) b!248279))

(assert (= (and b!248287 (not c!41594)) b!248298))

(assert (= (and b!248279 res!121682) b!248282))

(assert (= (and b!248282 res!121677) b!248289))

(assert (= (or b!248284 b!248279) bm!23247))

(assert (= (or b!248300 b!248289) bm!23246))

(assert (= (and b!248278 res!121672) b!248288))

(assert (= (and b!248288 c!41596) b!248276))

(assert (= (and b!248288 (not c!41596)) b!248283))

(assert (= (and b!248288 (not res!121676)) b!248285))

(assert (= (and b!248285 (not res!121680)) b!248293))

(assert (= (and b!248293 (not res!121683)) b!248277))

(assert (= (and b!248277 (not res!121678)) b!248290))

(assert (= (and b!248290 (not res!121679)) b!248297))

(assert (= (and b!248281 condMapEmpty!10973) mapIsEmpty!10973))

(assert (= (and b!248281 (not condMapEmpty!10973)) mapNonEmpty!10973))

(assert (= (and mapNonEmpty!10973 ((_ is ValueCellFull!2888) mapValue!10973)) b!248286))

(assert (= (and b!248281 ((_ is ValueCellFull!2888) mapDefault!10973)) b!248299))

(assert (= b!248294 b!248281))

(assert (= start!23622 b!248294))

(declare-fun m!265219 () Bool)

(assert (=> b!248297 m!265219))

(declare-fun m!265221 () Bool)

(assert (=> b!248278 m!265221))

(declare-fun m!265223 () Bool)

(assert (=> b!248278 m!265223))

(assert (=> b!248278 m!265223))

(declare-fun m!265225 () Bool)

(assert (=> b!248278 m!265225))

(declare-fun m!265227 () Bool)

(assert (=> b!248280 m!265227))

(declare-fun m!265229 () Bool)

(assert (=> b!248293 m!265229))

(declare-fun m!265231 () Bool)

(assert (=> b!248290 m!265231))

(declare-fun m!265233 () Bool)

(assert (=> b!248295 m!265233))

(declare-fun m!265235 () Bool)

(assert (=> mapNonEmpty!10973 m!265235))

(declare-fun m!265237 () Bool)

(assert (=> b!248294 m!265237))

(declare-fun m!265239 () Bool)

(assert (=> b!248294 m!265239))

(declare-fun m!265241 () Bool)

(assert (=> bm!23246 m!265241))

(declare-fun m!265243 () Bool)

(assert (=> b!248291 m!265243))

(declare-fun m!265245 () Bool)

(assert (=> start!23622 m!265245))

(declare-fun m!265247 () Bool)

(assert (=> b!248288 m!265247))

(assert (=> b!248288 m!265241))

(declare-fun m!265249 () Bool)

(assert (=> b!248288 m!265249))

(declare-fun m!265251 () Bool)

(assert (=> b!248288 m!265251))

(declare-fun m!265253 () Bool)

(assert (=> b!248288 m!265253))

(declare-fun m!265255 () Bool)

(assert (=> b!248288 m!265255))

(declare-fun m!265257 () Bool)

(assert (=> b!248288 m!265257))

(declare-fun m!265259 () Bool)

(assert (=> b!248288 m!265259))

(declare-fun m!265261 () Bool)

(assert (=> b!248276 m!265261))

(declare-fun m!265263 () Bool)

(assert (=> bm!23247 m!265263))

(declare-fun m!265265 () Bool)

(assert (=> b!248292 m!265265))

(declare-fun m!265267 () Bool)

(assert (=> b!248282 m!265267))

(check-sat (not b!248278) (not bm!23247) (not b!248291) (not b!248276) (not b_next!6601) tp_is_empty!6463 (not start!23622) (not b!248280) (not b!248290) (not b!248293) (not mapNonEmpty!10973) (not b!248295) b_and!13619 (not b!248297) (not bm!23246) (not b!248288) (not b!248294))
(check-sat b_and!13619 (not b_next!6601))
(get-model)

(declare-fun d!60599 () Bool)

(assert (=> d!60599 (= (array_inv!3813 (_keys!6715 thiss!1504)) (bvsge (size!6147 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248294 d!60599))

(declare-fun d!60601 () Bool)

(assert (=> d!60601 (= (array_inv!3814 (_values!4574 thiss!1504)) (bvsge (size!6146 (_values!4574 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248294 d!60601))

(declare-fun d!60603 () Bool)

(declare-fun e!161147 () Bool)

(assert (=> d!60603 e!161147))

(declare-fun res!121767 () Bool)

(assert (=> d!60603 (=> (not res!121767) (not e!161147))))

(declare-fun lt!124436 () SeekEntryResult!1076)

(assert (=> d!60603 (= res!121767 ((_ is Found!1076) lt!124436))))

(assert (=> d!60603 (= lt!124436 (seekEntryOrOpen!0 key!932 (_keys!6715 thiss!1504) (mask!10739 thiss!1504)))))

(declare-fun lt!124437 () Unit!7660)

(declare-fun choose!1174 (array!12235 array!12233 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) Int) Unit!7660)

(assert (=> d!60603 (= lt!124437 (choose!1174 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)))))

(assert (=> d!60603 (validMask!0 (mask!10739 thiss!1504))))

(assert (=> d!60603 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!383 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)) lt!124437)))

(declare-fun b!248455 () Bool)

(declare-fun res!121768 () Bool)

(assert (=> b!248455 (=> (not res!121768) (not e!161147))))

(assert (=> b!248455 (= res!121768 (inRange!0 (index!6475 lt!124436) (mask!10739 thiss!1504)))))

(declare-fun b!248456 () Bool)

(assert (=> b!248456 (= e!161147 (= (select (arr!5804 (_keys!6715 thiss!1504)) (index!6475 lt!124436)) key!932))))

(assert (=> b!248456 (and (bvsge (index!6475 lt!124436) #b00000000000000000000000000000000) (bvslt (index!6475 lt!124436) (size!6147 (_keys!6715 thiss!1504))))))

(assert (= (and d!60603 res!121767) b!248455))

(assert (= (and b!248455 res!121768) b!248456))

(assert (=> d!60603 m!265227))

(declare-fun m!265369 () Bool)

(assert (=> d!60603 m!265369))

(assert (=> d!60603 m!265247))

(declare-fun m!265371 () Bool)

(assert (=> b!248455 m!265371))

(declare-fun m!265373 () Bool)

(assert (=> b!248456 m!265373))

(assert (=> b!248295 d!60603))

(declare-fun d!60605 () Bool)

(assert (=> d!60605 (contains!1779 (getCurrentListMap!1380 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)) key!932)))

(declare-fun lt!124440 () Unit!7660)

(declare-fun choose!1175 (array!12235 array!12233 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) (_ BitVec 32) Int) Unit!7660)

(assert (=> d!60605 (= lt!124440 (choose!1175 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(assert (=> d!60605 (validMask!0 (mask!10739 thiss!1504))))

(assert (=> d!60605 (= (lemmaArrayContainsKeyThenInListMap!204 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)) lt!124440)))

(declare-fun bs!8954 () Bool)

(assert (= bs!8954 d!60605))

(assert (=> bs!8954 m!265223))

(assert (=> bs!8954 m!265223))

(assert (=> bs!8954 m!265225))

(declare-fun m!265375 () Bool)

(assert (=> bs!8954 m!265375))

(assert (=> bs!8954 m!265247))

(assert (=> b!248276 d!60605))

(declare-fun d!60607 () Bool)

(declare-fun res!121773 () Bool)

(declare-fun e!161152 () Bool)

(assert (=> d!60607 (=> res!121773 e!161152)))

(assert (=> d!60607 (= res!121773 (= (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60607 (= (arrayContainsKey!0 (_keys!6715 thiss!1504) key!932 #b00000000000000000000000000000000) e!161152)))

(declare-fun b!248461 () Bool)

(declare-fun e!161153 () Bool)

(assert (=> b!248461 (= e!161152 e!161153)))

(declare-fun res!121774 () Bool)

(assert (=> b!248461 (=> (not res!121774) (not e!161153))))

(assert (=> b!248461 (= res!121774 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6147 (_keys!6715 thiss!1504))))))

(declare-fun b!248462 () Bool)

(assert (=> b!248462 (= e!161153 (arrayContainsKey!0 (_keys!6715 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60607 (not res!121773)) b!248461))

(assert (= (and b!248461 res!121774) b!248462))

(declare-fun m!265377 () Bool)

(assert (=> d!60607 m!265377))

(declare-fun m!265379 () Bool)

(assert (=> b!248462 m!265379))

(assert (=> bm!23246 d!60607))

(declare-fun d!60609 () Bool)

(assert (=> d!60609 (= (inRange!0 index!297 (mask!10739 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10739 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!248278 d!60609))

(declare-fun d!60611 () Bool)

(declare-fun e!161158 () Bool)

(assert (=> d!60611 e!161158))

(declare-fun res!121777 () Bool)

(assert (=> d!60611 (=> res!121777 e!161158)))

(declare-fun lt!124450 () Bool)

(assert (=> d!60611 (= res!121777 (not lt!124450))))

(declare-fun lt!124452 () Bool)

(assert (=> d!60611 (= lt!124450 lt!124452)))

(declare-fun lt!124451 () Unit!7660)

(declare-fun e!161159 () Unit!7660)

(assert (=> d!60611 (= lt!124451 e!161159)))

(declare-fun c!41624 () Bool)

(assert (=> d!60611 (= c!41624 lt!124452)))

(declare-fun containsKey!286 (List!3626 (_ BitVec 64)) Bool)

(assert (=> d!60611 (= lt!124452 (containsKey!286 (toList!1848 (getCurrentListMap!1380 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504))) key!932))))

(assert (=> d!60611 (= (contains!1779 (getCurrentListMap!1380 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)) key!932) lt!124450)))

(declare-fun b!248469 () Bool)

(declare-fun lt!124449 () Unit!7660)

(assert (=> b!248469 (= e!161159 lt!124449)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!234 (List!3626 (_ BitVec 64)) Unit!7660)

(assert (=> b!248469 (= lt!124449 (lemmaContainsKeyImpliesGetValueByKeyDefined!234 (toList!1848 (getCurrentListMap!1380 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504))) key!932))))

(declare-datatypes ((Option!301 0))(
  ( (Some!300 (v!5339 V!8265)) (None!299) )
))
(declare-fun isDefined!235 (Option!301) Bool)

(declare-fun getValueByKey!295 (List!3626 (_ BitVec 64)) Option!301)

(assert (=> b!248469 (isDefined!235 (getValueByKey!295 (toList!1848 (getCurrentListMap!1380 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504))) key!932))))

(declare-fun b!248470 () Bool)

(declare-fun Unit!7670 () Unit!7660)

(assert (=> b!248470 (= e!161159 Unit!7670)))

(declare-fun b!248471 () Bool)

(assert (=> b!248471 (= e!161158 (isDefined!235 (getValueByKey!295 (toList!1848 (getCurrentListMap!1380 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504))) key!932)))))

(assert (= (and d!60611 c!41624) b!248469))

(assert (= (and d!60611 (not c!41624)) b!248470))

(assert (= (and d!60611 (not res!121777)) b!248471))

(declare-fun m!265381 () Bool)

(assert (=> d!60611 m!265381))

(declare-fun m!265383 () Bool)

(assert (=> b!248469 m!265383))

(declare-fun m!265385 () Bool)

(assert (=> b!248469 m!265385))

(assert (=> b!248469 m!265385))

(declare-fun m!265387 () Bool)

(assert (=> b!248469 m!265387))

(assert (=> b!248471 m!265385))

(assert (=> b!248471 m!265385))

(assert (=> b!248471 m!265387))

(assert (=> b!248278 d!60611))

(declare-fun d!60613 () Bool)

(declare-fun e!161195 () Bool)

(assert (=> d!60613 e!161195))

(declare-fun res!121800 () Bool)

(assert (=> d!60613 (=> (not res!121800) (not e!161195))))

(assert (=> d!60613 (= res!121800 (or (bvsge #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))))))))

(declare-fun lt!124507 () ListLongMap!3665)

(declare-fun lt!124504 () ListLongMap!3665)

(assert (=> d!60613 (= lt!124507 lt!124504)))

(declare-fun lt!124516 () Unit!7660)

(declare-fun e!161194 () Unit!7660)

(assert (=> d!60613 (= lt!124516 e!161194)))

(declare-fun c!41637 () Bool)

(declare-fun e!161193 () Bool)

(assert (=> d!60613 (= c!41637 e!161193)))

(declare-fun res!121802 () Bool)

(assert (=> d!60613 (=> (not res!121802) (not e!161193))))

(assert (=> d!60613 (= res!121802 (bvslt #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))))))

(declare-fun e!161188 () ListLongMap!3665)

(assert (=> d!60613 (= lt!124504 e!161188)))

(declare-fun c!41642 () Bool)

(assert (=> d!60613 (= c!41642 (and (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60613 (validMask!0 (mask!10739 thiss!1504))))

(assert (=> d!60613 (= (getCurrentListMap!1380 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)) lt!124507)))

(declare-fun b!248514 () Bool)

(declare-fun Unit!7671 () Unit!7660)

(assert (=> b!248514 (= e!161194 Unit!7671)))

(declare-fun bm!23274 () Bool)

(declare-fun call!23282 () ListLongMap!3665)

(declare-fun getCurrentListMapNoExtraKeys!552 (array!12235 array!12233 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 32) Int) ListLongMap!3665)

(assert (=> bm!23274 (= call!23282 (getCurrentListMapNoExtraKeys!552 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(declare-fun b!248515 () Bool)

(declare-fun e!161191 () ListLongMap!3665)

(declare-fun call!23281 () ListLongMap!3665)

(assert (=> b!248515 (= e!161191 call!23281)))

(declare-fun b!248516 () Bool)

(declare-fun e!161197 () Bool)

(declare-fun apply!236 (ListLongMap!3665 (_ BitVec 64)) V!8265)

(assert (=> b!248516 (= e!161197 (= (apply!236 lt!124507 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4432 thiss!1504)))))

(declare-fun b!248517 () Bool)

(declare-fun call!23280 () ListLongMap!3665)

(declare-fun +!663 (ListLongMap!3665 tuple2!4750) ListLongMap!3665)

(assert (=> b!248517 (= e!161188 (+!663 call!23280 (tuple2!4751 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4432 thiss!1504))))))

(declare-fun b!248518 () Bool)

(declare-fun call!23277 () ListLongMap!3665)

(assert (=> b!248518 (= e!161191 call!23277)))

(declare-fun b!248519 () Bool)

(declare-fun e!161186 () Bool)

(declare-fun call!23279 () Bool)

(assert (=> b!248519 (= e!161186 (not call!23279))))

(declare-fun b!248520 () Bool)

(declare-fun e!161187 () ListLongMap!3665)

(assert (=> b!248520 (= e!161188 e!161187)))

(declare-fun c!41640 () Bool)

(assert (=> b!248520 (= c!41640 (and (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23275 () Bool)

(declare-fun call!23278 () Bool)

(assert (=> bm!23275 (= call!23278 (contains!1779 lt!124507 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248521 () Bool)

(assert (=> b!248521 (= e!161193 (validKeyInArray!0 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248522 () Bool)

(declare-fun res!121798 () Bool)

(assert (=> b!248522 (=> (not res!121798) (not e!161195))))

(assert (=> b!248522 (= res!121798 e!161186)))

(declare-fun c!41641 () Bool)

(assert (=> b!248522 (= c!41641 (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!248523 () Bool)

(declare-fun e!161196 () Bool)

(assert (=> b!248523 (= e!161196 (validKeyInArray!0 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248524 () Bool)

(declare-fun e!161198 () Bool)

(declare-fun e!161192 () Bool)

(assert (=> b!248524 (= e!161198 e!161192)))

(declare-fun res!121797 () Bool)

(assert (=> b!248524 (=> (not res!121797) (not e!161192))))

(assert (=> b!248524 (= res!121797 (contains!1779 lt!124507 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!248524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))))))

(declare-fun bm!23276 () Bool)

(declare-fun call!23283 () ListLongMap!3665)

(assert (=> bm!23276 (= call!23281 call!23283)))

(declare-fun b!248525 () Bool)

(assert (=> b!248525 (= e!161187 call!23277)))

(declare-fun b!248526 () Bool)

(declare-fun res!121796 () Bool)

(assert (=> b!248526 (=> (not res!121796) (not e!161195))))

(assert (=> b!248526 (= res!121796 e!161198)))

(declare-fun res!121804 () Bool)

(assert (=> b!248526 (=> res!121804 e!161198)))

(assert (=> b!248526 (= res!121804 (not e!161196))))

(declare-fun res!121803 () Bool)

(assert (=> b!248526 (=> (not res!121803) (not e!161196))))

(assert (=> b!248526 (= res!121803 (bvslt #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))))))

(declare-fun b!248527 () Bool)

(declare-fun e!161190 () Bool)

(assert (=> b!248527 (= e!161190 (= (apply!236 lt!124507 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4432 thiss!1504)))))

(declare-fun b!248528 () Bool)

(declare-fun get!2985 (ValueCell!2888 V!8265) V!8265)

(declare-fun dynLambda!579 (Int (_ BitVec 64)) V!8265)

(assert (=> b!248528 (= e!161192 (= (apply!236 lt!124507 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000)) (get!2985 (select (arr!5803 (_values!4574 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!579 (defaultEntry!4591 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!248528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6146 (_values!4574 thiss!1504))))))

(assert (=> b!248528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))))))

(declare-fun b!248529 () Bool)

(declare-fun c!41639 () Bool)

(assert (=> b!248529 (= c!41639 (and (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!248529 (= e!161187 e!161191)))

(declare-fun b!248530 () Bool)

(declare-fun e!161189 () Bool)

(assert (=> b!248530 (= e!161189 e!161190)))

(declare-fun res!121799 () Bool)

(assert (=> b!248530 (= res!121799 call!23278)))

(assert (=> b!248530 (=> (not res!121799) (not e!161190))))

(declare-fun b!248531 () Bool)

(assert (=> b!248531 (= e!161189 (not call!23278))))

(declare-fun b!248532 () Bool)

(declare-fun lt!124505 () Unit!7660)

(assert (=> b!248532 (= e!161194 lt!124505)))

(declare-fun lt!124500 () ListLongMap!3665)

(assert (=> b!248532 (= lt!124500 (getCurrentListMapNoExtraKeys!552 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(declare-fun lt!124518 () (_ BitVec 64))

(assert (=> b!248532 (= lt!124518 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124497 () (_ BitVec 64))

(assert (=> b!248532 (= lt!124497 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124501 () Unit!7660)

(declare-fun addStillContains!212 (ListLongMap!3665 (_ BitVec 64) V!8265 (_ BitVec 64)) Unit!7660)

(assert (=> b!248532 (= lt!124501 (addStillContains!212 lt!124500 lt!124518 (zeroValue!4432 thiss!1504) lt!124497))))

(assert (=> b!248532 (contains!1779 (+!663 lt!124500 (tuple2!4751 lt!124518 (zeroValue!4432 thiss!1504))) lt!124497)))

(declare-fun lt!124502 () Unit!7660)

(assert (=> b!248532 (= lt!124502 lt!124501)))

(declare-fun lt!124508 () ListLongMap!3665)

(assert (=> b!248532 (= lt!124508 (getCurrentListMapNoExtraKeys!552 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(declare-fun lt!124517 () (_ BitVec 64))

(assert (=> b!248532 (= lt!124517 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124515 () (_ BitVec 64))

(assert (=> b!248532 (= lt!124515 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124513 () Unit!7660)

(declare-fun addApplyDifferent!212 (ListLongMap!3665 (_ BitVec 64) V!8265 (_ BitVec 64)) Unit!7660)

(assert (=> b!248532 (= lt!124513 (addApplyDifferent!212 lt!124508 lt!124517 (minValue!4432 thiss!1504) lt!124515))))

(assert (=> b!248532 (= (apply!236 (+!663 lt!124508 (tuple2!4751 lt!124517 (minValue!4432 thiss!1504))) lt!124515) (apply!236 lt!124508 lt!124515))))

(declare-fun lt!124506 () Unit!7660)

(assert (=> b!248532 (= lt!124506 lt!124513)))

(declare-fun lt!124499 () ListLongMap!3665)

(assert (=> b!248532 (= lt!124499 (getCurrentListMapNoExtraKeys!552 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(declare-fun lt!124503 () (_ BitVec 64))

(assert (=> b!248532 (= lt!124503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124498 () (_ BitVec 64))

(assert (=> b!248532 (= lt!124498 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124509 () Unit!7660)

(assert (=> b!248532 (= lt!124509 (addApplyDifferent!212 lt!124499 lt!124503 (zeroValue!4432 thiss!1504) lt!124498))))

(assert (=> b!248532 (= (apply!236 (+!663 lt!124499 (tuple2!4751 lt!124503 (zeroValue!4432 thiss!1504))) lt!124498) (apply!236 lt!124499 lt!124498))))

(declare-fun lt!124514 () Unit!7660)

(assert (=> b!248532 (= lt!124514 lt!124509)))

(declare-fun lt!124512 () ListLongMap!3665)

(assert (=> b!248532 (= lt!124512 (getCurrentListMapNoExtraKeys!552 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4591 thiss!1504)))))

(declare-fun lt!124511 () (_ BitVec 64))

(assert (=> b!248532 (= lt!124511 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124510 () (_ BitVec 64))

(assert (=> b!248532 (= lt!124510 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248532 (= lt!124505 (addApplyDifferent!212 lt!124512 lt!124511 (minValue!4432 thiss!1504) lt!124510))))

(assert (=> b!248532 (= (apply!236 (+!663 lt!124512 (tuple2!4751 lt!124511 (minValue!4432 thiss!1504))) lt!124510) (apply!236 lt!124512 lt!124510))))

(declare-fun bm!23277 () Bool)

(assert (=> bm!23277 (= call!23283 call!23282)))

(declare-fun bm!23278 () Bool)

(assert (=> bm!23278 (= call!23277 call!23280)))

(declare-fun bm!23279 () Bool)

(assert (=> bm!23279 (= call!23280 (+!663 (ite c!41642 call!23282 (ite c!41640 call!23283 call!23281)) (ite (or c!41642 c!41640) (tuple2!4751 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4432 thiss!1504)) (tuple2!4751 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4432 thiss!1504)))))))

(declare-fun bm!23280 () Bool)

(assert (=> bm!23280 (= call!23279 (contains!1779 lt!124507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248533 () Bool)

(assert (=> b!248533 (= e!161195 e!161189)))

(declare-fun c!41638 () Bool)

(assert (=> b!248533 (= c!41638 (not (= (bvand (extraKeys!4328 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!248534 () Bool)

(assert (=> b!248534 (= e!161186 e!161197)))

(declare-fun res!121801 () Bool)

(assert (=> b!248534 (= res!121801 call!23279)))

(assert (=> b!248534 (=> (not res!121801) (not e!161197))))

(assert (= (and d!60613 c!41642) b!248517))

(assert (= (and d!60613 (not c!41642)) b!248520))

(assert (= (and b!248520 c!41640) b!248525))

(assert (= (and b!248520 (not c!41640)) b!248529))

(assert (= (and b!248529 c!41639) b!248518))

(assert (= (and b!248529 (not c!41639)) b!248515))

(assert (= (or b!248518 b!248515) bm!23276))

(assert (= (or b!248525 bm!23276) bm!23277))

(assert (= (or b!248525 b!248518) bm!23278))

(assert (= (or b!248517 bm!23277) bm!23274))

(assert (= (or b!248517 bm!23278) bm!23279))

(assert (= (and d!60613 res!121802) b!248521))

(assert (= (and d!60613 c!41637) b!248532))

(assert (= (and d!60613 (not c!41637)) b!248514))

(assert (= (and d!60613 res!121800) b!248526))

(assert (= (and b!248526 res!121803) b!248523))

(assert (= (and b!248526 (not res!121804)) b!248524))

(assert (= (and b!248524 res!121797) b!248528))

(assert (= (and b!248526 res!121796) b!248522))

(assert (= (and b!248522 c!41641) b!248534))

(assert (= (and b!248522 (not c!41641)) b!248519))

(assert (= (and b!248534 res!121801) b!248516))

(assert (= (or b!248534 b!248519) bm!23280))

(assert (= (and b!248522 res!121798) b!248533))

(assert (= (and b!248533 c!41638) b!248530))

(assert (= (and b!248533 (not c!41638)) b!248531))

(assert (= (and b!248530 res!121799) b!248527))

(assert (= (or b!248530 b!248531) bm!23275))

(declare-fun b_lambda!8077 () Bool)

(assert (=> (not b_lambda!8077) (not b!248528)))

(declare-fun t!8647 () Bool)

(declare-fun tb!2977 () Bool)

(assert (=> (and b!248294 (= (defaultEntry!4591 thiss!1504) (defaultEntry!4591 thiss!1504)) t!8647) tb!2977))

(declare-fun result!5269 () Bool)

(assert (=> tb!2977 (= result!5269 tp_is_empty!6463)))

(assert (=> b!248528 t!8647))

(declare-fun b_and!13625 () Bool)

(assert (= b_and!13619 (and (=> t!8647 result!5269) b_and!13625)))

(declare-fun m!265389 () Bool)

(assert (=> b!248516 m!265389))

(assert (=> b!248524 m!265377))

(assert (=> b!248524 m!265377))

(declare-fun m!265391 () Bool)

(assert (=> b!248524 m!265391))

(declare-fun m!265393 () Bool)

(assert (=> b!248532 m!265393))

(declare-fun m!265395 () Bool)

(assert (=> b!248532 m!265395))

(declare-fun m!265397 () Bool)

(assert (=> b!248532 m!265397))

(declare-fun m!265399 () Bool)

(assert (=> b!248532 m!265399))

(assert (=> b!248532 m!265395))

(declare-fun m!265401 () Bool)

(assert (=> b!248532 m!265401))

(declare-fun m!265403 () Bool)

(assert (=> b!248532 m!265403))

(declare-fun m!265405 () Bool)

(assert (=> b!248532 m!265405))

(assert (=> b!248532 m!265401))

(declare-fun m!265407 () Bool)

(assert (=> b!248532 m!265407))

(declare-fun m!265409 () Bool)

(assert (=> b!248532 m!265409))

(declare-fun m!265411 () Bool)

(assert (=> b!248532 m!265411))

(declare-fun m!265413 () Bool)

(assert (=> b!248532 m!265413))

(declare-fun m!265415 () Bool)

(assert (=> b!248532 m!265415))

(assert (=> b!248532 m!265413))

(declare-fun m!265417 () Bool)

(assert (=> b!248532 m!265417))

(declare-fun m!265419 () Bool)

(assert (=> b!248532 m!265419))

(assert (=> b!248532 m!265377))

(declare-fun m!265421 () Bool)

(assert (=> b!248532 m!265421))

(declare-fun m!265423 () Bool)

(assert (=> b!248532 m!265423))

(assert (=> b!248532 m!265421))

(declare-fun m!265425 () Bool)

(assert (=> b!248528 m!265425))

(declare-fun m!265427 () Bool)

(assert (=> b!248528 m!265427))

(assert (=> b!248528 m!265377))

(assert (=> b!248528 m!265377))

(declare-fun m!265429 () Bool)

(assert (=> b!248528 m!265429))

(assert (=> b!248528 m!265425))

(assert (=> b!248528 m!265427))

(declare-fun m!265431 () Bool)

(assert (=> b!248528 m!265431))

(assert (=> b!248523 m!265377))

(assert (=> b!248523 m!265377))

(declare-fun m!265433 () Bool)

(assert (=> b!248523 m!265433))

(assert (=> b!248521 m!265377))

(assert (=> b!248521 m!265377))

(assert (=> b!248521 m!265433))

(declare-fun m!265435 () Bool)

(assert (=> b!248527 m!265435))

(declare-fun m!265437 () Bool)

(assert (=> bm!23275 m!265437))

(assert (=> d!60613 m!265247))

(assert (=> bm!23274 m!265399))

(declare-fun m!265439 () Bool)

(assert (=> bm!23279 m!265439))

(declare-fun m!265441 () Bool)

(assert (=> b!248517 m!265441))

(declare-fun m!265443 () Bool)

(assert (=> bm!23280 m!265443))

(assert (=> b!248278 d!60613))

(declare-fun d!60615 () Bool)

(declare-fun e!161203 () Bool)

(assert (=> d!60615 e!161203))

(declare-fun res!121816 () Bool)

(assert (=> d!60615 (=> (not res!121816) (not e!161203))))

(assert (=> d!60615 (= res!121816 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6147 (_keys!6715 thiss!1504)))))))

(declare-fun lt!124521 () Unit!7660)

(declare-fun choose!1 (array!12235 (_ BitVec 32) (_ BitVec 64)) Unit!7660)

(assert (=> d!60615 (= lt!124521 (choose!1 (_keys!6715 thiss!1504) index!297 key!932))))

(declare-fun e!161204 () Bool)

(assert (=> d!60615 e!161204))

(declare-fun res!121815 () Bool)

(assert (=> d!60615 (=> (not res!121815) (not e!161204))))

(assert (=> d!60615 (= res!121815 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6147 (_keys!6715 thiss!1504)))))))

(assert (=> d!60615 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6715 thiss!1504) index!297 key!932) lt!124521)))

(declare-fun b!248545 () Bool)

(declare-fun res!121813 () Bool)

(assert (=> b!248545 (=> (not res!121813) (not e!161204))))

(assert (=> b!248545 (= res!121813 (not (validKeyInArray!0 (select (arr!5804 (_keys!6715 thiss!1504)) index!297))))))

(declare-fun b!248547 () Bool)

(assert (=> b!248547 (= e!161204 (bvslt (size!6147 (_keys!6715 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!248546 () Bool)

(declare-fun res!121814 () Bool)

(assert (=> b!248546 (=> (not res!121814) (not e!161204))))

(assert (=> b!248546 (= res!121814 (validKeyInArray!0 key!932))))

(declare-fun b!248548 () Bool)

(assert (=> b!248548 (= e!161203 (= (arrayCountValidKeys!0 (array!12236 (store (arr!5804 (_keys!6715 thiss!1504)) index!297 key!932) (size!6147 (_keys!6715 thiss!1504))) #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6715 thiss!1504) #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!60615 res!121815) b!248545))

(assert (= (and b!248545 res!121813) b!248546))

(assert (= (and b!248546 res!121814) b!248547))

(assert (= (and d!60615 res!121816) b!248548))

(declare-fun m!265445 () Bool)

(assert (=> d!60615 m!265445))

(declare-fun m!265447 () Bool)

(assert (=> b!248545 m!265447))

(assert (=> b!248545 m!265447))

(declare-fun m!265449 () Bool)

(assert (=> b!248545 m!265449))

(assert (=> b!248546 m!265229))

(assert (=> b!248548 m!265255))

(declare-fun m!265451 () Bool)

(assert (=> b!248548 m!265451))

(assert (=> b!248548 m!265257))

(assert (=> b!248288 d!60615))

(declare-fun b!248559 () Bool)

(declare-fun e!161215 () Bool)

(declare-fun call!23286 () Bool)

(assert (=> b!248559 (= e!161215 call!23286)))

(declare-fun b!248560 () Bool)

(assert (=> b!248560 (= e!161215 call!23286)))

(declare-fun b!248561 () Bool)

(declare-fun e!161216 () Bool)

(declare-fun e!161214 () Bool)

(assert (=> b!248561 (= e!161216 e!161214)))

(declare-fun res!121825 () Bool)

(assert (=> b!248561 (=> (not res!121825) (not e!161214))))

(declare-fun e!161213 () Bool)

(assert (=> b!248561 (= res!121825 (not e!161213))))

(declare-fun res!121824 () Bool)

(assert (=> b!248561 (=> (not res!121824) (not e!161213))))

(assert (=> b!248561 (= res!121824 (validKeyInArray!0 (select (arr!5804 lt!124366) #b00000000000000000000000000000000)))))

(declare-fun b!248562 () Bool)

(assert (=> b!248562 (= e!161214 e!161215)))

(declare-fun c!41645 () Bool)

(assert (=> b!248562 (= c!41645 (validKeyInArray!0 (select (arr!5804 lt!124366) #b00000000000000000000000000000000)))))

(declare-fun bm!23283 () Bool)

(assert (=> bm!23283 (= call!23286 (arrayNoDuplicates!0 lt!124366 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41645 (Cons!3623 (select (arr!5804 lt!124366) #b00000000000000000000000000000000) Nil!3624) Nil!3624)))))

(declare-fun b!248563 () Bool)

(declare-fun contains!1780 (List!3627 (_ BitVec 64)) Bool)

(assert (=> b!248563 (= e!161213 (contains!1780 Nil!3624 (select (arr!5804 lt!124366) #b00000000000000000000000000000000)))))

(declare-fun d!60617 () Bool)

(declare-fun res!121823 () Bool)

(assert (=> d!60617 (=> res!121823 e!161216)))

(assert (=> d!60617 (= res!121823 (bvsge #b00000000000000000000000000000000 (size!6147 lt!124366)))))

(assert (=> d!60617 (= (arrayNoDuplicates!0 lt!124366 #b00000000000000000000000000000000 Nil!3624) e!161216)))

(assert (= (and d!60617 (not res!121823)) b!248561))

(assert (= (and b!248561 res!121824) b!248563))

(assert (= (and b!248561 res!121825) b!248562))

(assert (= (and b!248562 c!41645) b!248559))

(assert (= (and b!248562 (not c!41645)) b!248560))

(assert (= (or b!248559 b!248560) bm!23283))

(declare-fun m!265453 () Bool)

(assert (=> b!248561 m!265453))

(assert (=> b!248561 m!265453))

(declare-fun m!265455 () Bool)

(assert (=> b!248561 m!265455))

(assert (=> b!248562 m!265453))

(assert (=> b!248562 m!265453))

(assert (=> b!248562 m!265455))

(assert (=> bm!23283 m!265453))

(declare-fun m!265457 () Bool)

(assert (=> bm!23283 m!265457))

(assert (=> b!248563 m!265453))

(assert (=> b!248563 m!265453))

(declare-fun m!265459 () Bool)

(assert (=> b!248563 m!265459))

(assert (=> b!248288 d!60617))

(declare-fun b!248572 () Bool)

(declare-fun e!161221 () (_ BitVec 32))

(assert (=> b!248572 (= e!161221 #b00000000000000000000000000000000)))

(declare-fun b!248573 () Bool)

(declare-fun e!161222 () (_ BitVec 32))

(declare-fun call!23289 () (_ BitVec 32))

(assert (=> b!248573 (= e!161222 (bvadd #b00000000000000000000000000000001 call!23289))))

(declare-fun b!248574 () Bool)

(assert (=> b!248574 (= e!161222 call!23289)))

(declare-fun d!60619 () Bool)

(declare-fun lt!124524 () (_ BitVec 32))

(assert (=> d!60619 (and (bvsge lt!124524 #b00000000000000000000000000000000) (bvsle lt!124524 (bvsub (size!6147 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60619 (= lt!124524 e!161221)))

(declare-fun c!41651 () Bool)

(assert (=> d!60619 (= c!41651 (bvsge #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))))))

(assert (=> d!60619 (and (bvsle #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6147 (_keys!6715 thiss!1504)) (size!6147 (_keys!6715 thiss!1504))))))

(assert (=> d!60619 (= (arrayCountValidKeys!0 (_keys!6715 thiss!1504) #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))) lt!124524)))

(declare-fun bm!23286 () Bool)

(assert (=> bm!23286 (= call!23289 (arrayCountValidKeys!0 (_keys!6715 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6147 (_keys!6715 thiss!1504))))))

(declare-fun b!248575 () Bool)

(assert (=> b!248575 (= e!161221 e!161222)))

(declare-fun c!41650 () Bool)

(assert (=> b!248575 (= c!41650 (validKeyInArray!0 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60619 c!41651) b!248572))

(assert (= (and d!60619 (not c!41651)) b!248575))

(assert (= (and b!248575 c!41650) b!248573))

(assert (= (and b!248575 (not c!41650)) b!248574))

(assert (= (or b!248573 b!248574) bm!23286))

(declare-fun m!265461 () Bool)

(assert (=> bm!23286 m!265461))

(assert (=> b!248575 m!265377))

(assert (=> b!248575 m!265377))

(assert (=> b!248575 m!265433))

(assert (=> b!248288 d!60619))

(declare-fun d!60621 () Bool)

(assert (=> d!60621 (= (validMask!0 (mask!10739 thiss!1504)) (and (or (= (mask!10739 thiss!1504) #b00000000000000000000000000000111) (= (mask!10739 thiss!1504) #b00000000000000000000000000001111) (= (mask!10739 thiss!1504) #b00000000000000000000000000011111) (= (mask!10739 thiss!1504) #b00000000000000000000000000111111) (= (mask!10739 thiss!1504) #b00000000000000000000000001111111) (= (mask!10739 thiss!1504) #b00000000000000000000000011111111) (= (mask!10739 thiss!1504) #b00000000000000000000000111111111) (= (mask!10739 thiss!1504) #b00000000000000000000001111111111) (= (mask!10739 thiss!1504) #b00000000000000000000011111111111) (= (mask!10739 thiss!1504) #b00000000000000000000111111111111) (= (mask!10739 thiss!1504) #b00000000000000000001111111111111) (= (mask!10739 thiss!1504) #b00000000000000000011111111111111) (= (mask!10739 thiss!1504) #b00000000000000000111111111111111) (= (mask!10739 thiss!1504) #b00000000000000001111111111111111) (= (mask!10739 thiss!1504) #b00000000000000011111111111111111) (= (mask!10739 thiss!1504) #b00000000000000111111111111111111) (= (mask!10739 thiss!1504) #b00000000000001111111111111111111) (= (mask!10739 thiss!1504) #b00000000000011111111111111111111) (= (mask!10739 thiss!1504) #b00000000000111111111111111111111) (= (mask!10739 thiss!1504) #b00000000001111111111111111111111) (= (mask!10739 thiss!1504) #b00000000011111111111111111111111) (= (mask!10739 thiss!1504) #b00000000111111111111111111111111) (= (mask!10739 thiss!1504) #b00000001111111111111111111111111) (= (mask!10739 thiss!1504) #b00000011111111111111111111111111) (= (mask!10739 thiss!1504) #b00000111111111111111111111111111) (= (mask!10739 thiss!1504) #b00001111111111111111111111111111) (= (mask!10739 thiss!1504) #b00011111111111111111111111111111) (= (mask!10739 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10739 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!248288 d!60621))

(declare-fun d!60623 () Bool)

(declare-fun e!161225 () Bool)

(assert (=> d!60623 e!161225))

(declare-fun res!121828 () Bool)

(assert (=> d!60623 (=> (not res!121828) (not e!161225))))

(assert (=> d!60623 (= res!121828 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6147 (_keys!6715 thiss!1504)))))))

(declare-fun lt!124527 () Unit!7660)

(declare-fun choose!41 (array!12235 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3627) Unit!7660)

(assert (=> d!60623 (= lt!124527 (choose!41 (_keys!6715 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3624))))

(assert (=> d!60623 (bvslt (size!6147 (_keys!6715 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60623 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6715 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3624) lt!124527)))

(declare-fun b!248578 () Bool)

(assert (=> b!248578 (= e!161225 (arrayNoDuplicates!0 (array!12236 (store (arr!5804 (_keys!6715 thiss!1504)) index!297 key!932) (size!6147 (_keys!6715 thiss!1504))) #b00000000000000000000000000000000 Nil!3624))))

(assert (= (and d!60623 res!121828) b!248578))

(declare-fun m!265463 () Bool)

(assert (=> d!60623 m!265463))

(assert (=> b!248578 m!265255))

(declare-fun m!265465 () Bool)

(assert (=> b!248578 m!265465))

(assert (=> b!248288 d!60623))

(declare-fun b!248579 () Bool)

(declare-fun e!161226 () (_ BitVec 32))

(assert (=> b!248579 (= e!161226 #b00000000000000000000000000000000)))

(declare-fun b!248580 () Bool)

(declare-fun e!161227 () (_ BitVec 32))

(declare-fun call!23290 () (_ BitVec 32))

(assert (=> b!248580 (= e!161227 (bvadd #b00000000000000000000000000000001 call!23290))))

(declare-fun b!248581 () Bool)

(assert (=> b!248581 (= e!161227 call!23290)))

(declare-fun d!60625 () Bool)

(declare-fun lt!124528 () (_ BitVec 32))

(assert (=> d!60625 (and (bvsge lt!124528 #b00000000000000000000000000000000) (bvsle lt!124528 (bvsub (size!6147 lt!124366) #b00000000000000000000000000000000)))))

(assert (=> d!60625 (= lt!124528 e!161226)))

(declare-fun c!41653 () Bool)

(assert (=> d!60625 (= c!41653 (bvsge #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))))))

(assert (=> d!60625 (and (bvsle #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6147 (_keys!6715 thiss!1504)) (size!6147 lt!124366)))))

(assert (=> d!60625 (= (arrayCountValidKeys!0 lt!124366 #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))) lt!124528)))

(declare-fun bm!23287 () Bool)

(assert (=> bm!23287 (= call!23290 (arrayCountValidKeys!0 lt!124366 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6147 (_keys!6715 thiss!1504))))))

(declare-fun b!248582 () Bool)

(assert (=> b!248582 (= e!161226 e!161227)))

(declare-fun c!41652 () Bool)

(assert (=> b!248582 (= c!41652 (validKeyInArray!0 (select (arr!5804 lt!124366) #b00000000000000000000000000000000)))))

(assert (= (and d!60625 c!41653) b!248579))

(assert (= (and d!60625 (not c!41653)) b!248582))

(assert (= (and b!248582 c!41652) b!248580))

(assert (= (and b!248582 (not c!41652)) b!248581))

(assert (= (or b!248580 b!248581) bm!23287))

(declare-fun m!265467 () Bool)

(assert (=> bm!23287 m!265467))

(assert (=> b!248582 m!265453))

(assert (=> b!248582 m!265453))

(assert (=> b!248582 m!265455))

(assert (=> b!248288 d!60625))

(assert (=> b!248288 d!60607))

(declare-fun b!248583 () Bool)

(declare-fun e!161230 () Bool)

(declare-fun call!23291 () Bool)

(assert (=> b!248583 (= e!161230 call!23291)))

(declare-fun b!248584 () Bool)

(assert (=> b!248584 (= e!161230 call!23291)))

(declare-fun b!248585 () Bool)

(declare-fun e!161231 () Bool)

(declare-fun e!161229 () Bool)

(assert (=> b!248585 (= e!161231 e!161229)))

(declare-fun res!121831 () Bool)

(assert (=> b!248585 (=> (not res!121831) (not e!161229))))

(declare-fun e!161228 () Bool)

(assert (=> b!248585 (= res!121831 (not e!161228))))

(declare-fun res!121830 () Bool)

(assert (=> b!248585 (=> (not res!121830) (not e!161228))))

(assert (=> b!248585 (= res!121830 (validKeyInArray!0 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!248586 () Bool)

(assert (=> b!248586 (= e!161229 e!161230)))

(declare-fun c!41654 () Bool)

(assert (=> b!248586 (= c!41654 (validKeyInArray!0 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23288 () Bool)

(assert (=> bm!23288 (= call!23291 (arrayNoDuplicates!0 (_keys!6715 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41654 (Cons!3623 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000) Nil!3624) Nil!3624)))))

(declare-fun b!248587 () Bool)

(assert (=> b!248587 (= e!161228 (contains!1780 Nil!3624 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60627 () Bool)

(declare-fun res!121829 () Bool)

(assert (=> d!60627 (=> res!121829 e!161231)))

(assert (=> d!60627 (= res!121829 (bvsge #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))))))

(assert (=> d!60627 (= (arrayNoDuplicates!0 (_keys!6715 thiss!1504) #b00000000000000000000000000000000 Nil!3624) e!161231)))

(assert (= (and d!60627 (not res!121829)) b!248585))

(assert (= (and b!248585 res!121830) b!248587))

(assert (= (and b!248585 res!121831) b!248586))

(assert (= (and b!248586 c!41654) b!248583))

(assert (= (and b!248586 (not c!41654)) b!248584))

(assert (= (or b!248583 b!248584) bm!23288))

(assert (=> b!248585 m!265377))

(assert (=> b!248585 m!265377))

(assert (=> b!248585 m!265433))

(assert (=> b!248586 m!265377))

(assert (=> b!248586 m!265377))

(assert (=> b!248586 m!265433))

(assert (=> bm!23288 m!265377))

(declare-fun m!265469 () Bool)

(assert (=> bm!23288 m!265469))

(assert (=> b!248587 m!265377))

(assert (=> b!248587 m!265377))

(declare-fun m!265471 () Bool)

(assert (=> b!248587 m!265471))

(assert (=> b!248297 d!60627))

(declare-fun b!248596 () Bool)

(declare-fun e!161240 () Bool)

(declare-fun call!23294 () Bool)

(assert (=> b!248596 (= e!161240 call!23294)))

(declare-fun b!248597 () Bool)

(declare-fun e!161239 () Bool)

(assert (=> b!248597 (= e!161239 call!23294)))

(declare-fun b!248598 () Bool)

(declare-fun e!161238 () Bool)

(assert (=> b!248598 (= e!161238 e!161239)))

(declare-fun c!41657 () Bool)

(assert (=> b!248598 (= c!41657 (validKeyInArray!0 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60629 () Bool)

(declare-fun res!121836 () Bool)

(assert (=> d!60629 (=> res!121836 e!161238)))

(assert (=> d!60629 (= res!121836 (bvsge #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))))))

(assert (=> d!60629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6715 thiss!1504) (mask!10739 thiss!1504)) e!161238)))

(declare-fun b!248599 () Bool)

(assert (=> b!248599 (= e!161239 e!161240)))

(declare-fun lt!124535 () (_ BitVec 64))

(assert (=> b!248599 (= lt!124535 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124537 () Unit!7660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12235 (_ BitVec 64) (_ BitVec 32)) Unit!7660)

(assert (=> b!248599 (= lt!124537 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6715 thiss!1504) lt!124535 #b00000000000000000000000000000000))))

(assert (=> b!248599 (arrayContainsKey!0 (_keys!6715 thiss!1504) lt!124535 #b00000000000000000000000000000000)))

(declare-fun lt!124536 () Unit!7660)

(assert (=> b!248599 (= lt!124536 lt!124537)))

(declare-fun res!121837 () Bool)

(assert (=> b!248599 (= res!121837 (= (seekEntryOrOpen!0 (select (arr!5804 (_keys!6715 thiss!1504)) #b00000000000000000000000000000000) (_keys!6715 thiss!1504) (mask!10739 thiss!1504)) (Found!1076 #b00000000000000000000000000000000)))))

(assert (=> b!248599 (=> (not res!121837) (not e!161240))))

(declare-fun bm!23291 () Bool)

(assert (=> bm!23291 (= call!23294 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6715 thiss!1504) (mask!10739 thiss!1504)))))

(assert (= (and d!60629 (not res!121836)) b!248598))

(assert (= (and b!248598 c!41657) b!248599))

(assert (= (and b!248598 (not c!41657)) b!248597))

(assert (= (and b!248599 res!121837) b!248596))

(assert (= (or b!248596 b!248597) bm!23291))

(assert (=> b!248598 m!265377))

(assert (=> b!248598 m!265377))

(assert (=> b!248598 m!265433))

(assert (=> b!248599 m!265377))

(declare-fun m!265473 () Bool)

(assert (=> b!248599 m!265473))

(declare-fun m!265475 () Bool)

(assert (=> b!248599 m!265475))

(assert (=> b!248599 m!265377))

(declare-fun m!265477 () Bool)

(assert (=> b!248599 m!265477))

(declare-fun m!265479 () Bool)

(assert (=> bm!23291 m!265479))

(assert (=> b!248290 d!60629))

(declare-fun d!60631 () Bool)

(assert (=> d!60631 (= (inRange!0 (ite c!41597 (index!6474 lt!124368) (index!6477 lt!124368)) (mask!10739 thiss!1504)) (and (bvsge (ite c!41597 (index!6474 lt!124368) (index!6477 lt!124368)) #b00000000000000000000000000000000) (bvslt (ite c!41597 (index!6474 lt!124368) (index!6477 lt!124368)) (bvadd (mask!10739 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23247 d!60631))

(declare-fun d!60633 () Bool)

(declare-fun lt!124546 () SeekEntryResult!1076)

(assert (=> d!60633 (and (or ((_ is Undefined!1076) lt!124546) (not ((_ is Found!1076) lt!124546)) (and (bvsge (index!6475 lt!124546) #b00000000000000000000000000000000) (bvslt (index!6475 lt!124546) (size!6147 (_keys!6715 thiss!1504))))) (or ((_ is Undefined!1076) lt!124546) ((_ is Found!1076) lt!124546) (not ((_ is MissingZero!1076) lt!124546)) (and (bvsge (index!6474 lt!124546) #b00000000000000000000000000000000) (bvslt (index!6474 lt!124546) (size!6147 (_keys!6715 thiss!1504))))) (or ((_ is Undefined!1076) lt!124546) ((_ is Found!1076) lt!124546) ((_ is MissingZero!1076) lt!124546) (not ((_ is MissingVacant!1076) lt!124546)) (and (bvsge (index!6477 lt!124546) #b00000000000000000000000000000000) (bvslt (index!6477 lt!124546) (size!6147 (_keys!6715 thiss!1504))))) (or ((_ is Undefined!1076) lt!124546) (ite ((_ is Found!1076) lt!124546) (= (select (arr!5804 (_keys!6715 thiss!1504)) (index!6475 lt!124546)) key!932) (ite ((_ is MissingZero!1076) lt!124546) (= (select (arr!5804 (_keys!6715 thiss!1504)) (index!6474 lt!124546)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1076) lt!124546) (= (select (arr!5804 (_keys!6715 thiss!1504)) (index!6477 lt!124546)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!161247 () SeekEntryResult!1076)

(assert (=> d!60633 (= lt!124546 e!161247)))

(declare-fun c!41665 () Bool)

(declare-fun lt!124544 () SeekEntryResult!1076)

(assert (=> d!60633 (= c!41665 (and ((_ is Intermediate!1076) lt!124544) (undefined!1888 lt!124544)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12235 (_ BitVec 32)) SeekEntryResult!1076)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60633 (= lt!124544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10739 thiss!1504)) key!932 (_keys!6715 thiss!1504) (mask!10739 thiss!1504)))))

(assert (=> d!60633 (validMask!0 (mask!10739 thiss!1504))))

(assert (=> d!60633 (= (seekEntryOrOpen!0 key!932 (_keys!6715 thiss!1504) (mask!10739 thiss!1504)) lt!124546)))

(declare-fun b!248612 () Bool)

(declare-fun e!161249 () SeekEntryResult!1076)

(assert (=> b!248612 (= e!161249 (MissingZero!1076 (index!6476 lt!124544)))))

(declare-fun b!248613 () Bool)

(assert (=> b!248613 (= e!161247 Undefined!1076)))

(declare-fun b!248614 () Bool)

(declare-fun e!161248 () SeekEntryResult!1076)

(assert (=> b!248614 (= e!161247 e!161248)))

(declare-fun lt!124545 () (_ BitVec 64))

(assert (=> b!248614 (= lt!124545 (select (arr!5804 (_keys!6715 thiss!1504)) (index!6476 lt!124544)))))

(declare-fun c!41664 () Bool)

(assert (=> b!248614 (= c!41664 (= lt!124545 key!932))))

(declare-fun b!248615 () Bool)

(assert (=> b!248615 (= e!161248 (Found!1076 (index!6476 lt!124544)))))

(declare-fun b!248616 () Bool)

(declare-fun c!41666 () Bool)

(assert (=> b!248616 (= c!41666 (= lt!124545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248616 (= e!161248 e!161249)))

(declare-fun b!248617 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12235 (_ BitVec 32)) SeekEntryResult!1076)

(assert (=> b!248617 (= e!161249 (seekKeyOrZeroReturnVacant!0 (x!24538 lt!124544) (index!6476 lt!124544) (index!6476 lt!124544) key!932 (_keys!6715 thiss!1504) (mask!10739 thiss!1504)))))

(assert (= (and d!60633 c!41665) b!248613))

(assert (= (and d!60633 (not c!41665)) b!248614))

(assert (= (and b!248614 c!41664) b!248615))

(assert (= (and b!248614 (not c!41664)) b!248616))

(assert (= (and b!248616 c!41666) b!248612))

(assert (= (and b!248616 (not c!41666)) b!248617))

(declare-fun m!265481 () Bool)

(assert (=> d!60633 m!265481))

(declare-fun m!265483 () Bool)

(assert (=> d!60633 m!265483))

(declare-fun m!265485 () Bool)

(assert (=> d!60633 m!265485))

(declare-fun m!265487 () Bool)

(assert (=> d!60633 m!265487))

(assert (=> d!60633 m!265247))

(assert (=> d!60633 m!265483))

(declare-fun m!265489 () Bool)

(assert (=> d!60633 m!265489))

(declare-fun m!265491 () Bool)

(assert (=> b!248614 m!265491))

(declare-fun m!265493 () Bool)

(assert (=> b!248617 m!265493))

(assert (=> b!248280 d!60633))

(declare-fun b!248634 () Bool)

(declare-fun res!121848 () Bool)

(declare-fun e!161261 () Bool)

(assert (=> b!248634 (=> (not res!121848) (not e!161261))))

(declare-fun call!23300 () Bool)

(assert (=> b!248634 (= res!121848 call!23300)))

(declare-fun e!161258 () Bool)

(assert (=> b!248634 (= e!161258 e!161261)))

(declare-fun b!248635 () Bool)

(declare-fun call!23299 () Bool)

(assert (=> b!248635 (= e!161261 (not call!23299))))

(declare-fun d!60635 () Bool)

(declare-fun e!161259 () Bool)

(assert (=> d!60635 e!161259))

(declare-fun c!41671 () Bool)

(declare-fun lt!124552 () SeekEntryResult!1076)

(assert (=> d!60635 (= c!41671 ((_ is MissingZero!1076) lt!124552))))

(assert (=> d!60635 (= lt!124552 (seekEntryOrOpen!0 key!932 (_keys!6715 thiss!1504) (mask!10739 thiss!1504)))))

(declare-fun lt!124551 () Unit!7660)

(declare-fun choose!1176 (array!12235 array!12233 (_ BitVec 32) (_ BitVec 32) V!8265 V!8265 (_ BitVec 64) Int) Unit!7660)

(assert (=> d!60635 (= lt!124551 (choose!1176 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)))))

(assert (=> d!60635 (validMask!0 (mask!10739 thiss!1504))))

(assert (=> d!60635 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!379 (_keys!6715 thiss!1504) (_values!4574 thiss!1504) (mask!10739 thiss!1504) (extraKeys!4328 thiss!1504) (zeroValue!4432 thiss!1504) (minValue!4432 thiss!1504) key!932 (defaultEntry!4591 thiss!1504)) lt!124551)))

(declare-fun b!248636 () Bool)

(assert (=> b!248636 (and (bvsge (index!6474 lt!124552) #b00000000000000000000000000000000) (bvslt (index!6474 lt!124552) (size!6147 (_keys!6715 thiss!1504))))))

(declare-fun res!121847 () Bool)

(assert (=> b!248636 (= res!121847 (= (select (arr!5804 (_keys!6715 thiss!1504)) (index!6474 lt!124552)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161260 () Bool)

(assert (=> b!248636 (=> (not res!121847) (not e!161260))))

(declare-fun b!248637 () Bool)

(assert (=> b!248637 (= e!161259 e!161258)))

(declare-fun c!41672 () Bool)

(assert (=> b!248637 (= c!41672 ((_ is MissingVacant!1076) lt!124552))))

(declare-fun b!248638 () Bool)

(assert (=> b!248638 (= e!161260 (not call!23299))))

(declare-fun b!248639 () Bool)

(assert (=> b!248639 (= e!161258 ((_ is Undefined!1076) lt!124552))))

(declare-fun bm!23296 () Bool)

(assert (=> bm!23296 (= call!23299 (arrayContainsKey!0 (_keys!6715 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!23297 () Bool)

(assert (=> bm!23297 (= call!23300 (inRange!0 (ite c!41671 (index!6474 lt!124552) (index!6477 lt!124552)) (mask!10739 thiss!1504)))))

(declare-fun b!248640 () Bool)

(declare-fun res!121849 () Bool)

(assert (=> b!248640 (=> (not res!121849) (not e!161261))))

(assert (=> b!248640 (= res!121849 (= (select (arr!5804 (_keys!6715 thiss!1504)) (index!6477 lt!124552)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248640 (and (bvsge (index!6477 lt!124552) #b00000000000000000000000000000000) (bvslt (index!6477 lt!124552) (size!6147 (_keys!6715 thiss!1504))))))

(declare-fun b!248641 () Bool)

(assert (=> b!248641 (= e!161259 e!161260)))

(declare-fun res!121846 () Bool)

(assert (=> b!248641 (= res!121846 call!23300)))

(assert (=> b!248641 (=> (not res!121846) (not e!161260))))

(assert (= (and d!60635 c!41671) b!248641))

(assert (= (and d!60635 (not c!41671)) b!248637))

(assert (= (and b!248641 res!121846) b!248636))

(assert (= (and b!248636 res!121847) b!248638))

(assert (= (and b!248637 c!41672) b!248634))

(assert (= (and b!248637 (not c!41672)) b!248639))

(assert (= (and b!248634 res!121848) b!248640))

(assert (= (and b!248640 res!121849) b!248635))

(assert (= (or b!248641 b!248634) bm!23297))

(assert (= (or b!248638 b!248635) bm!23296))

(assert (=> bm!23296 m!265241))

(assert (=> d!60635 m!265227))

(declare-fun m!265495 () Bool)

(assert (=> d!60635 m!265495))

(assert (=> d!60635 m!265247))

(declare-fun m!265497 () Bool)

(assert (=> bm!23297 m!265497))

(declare-fun m!265499 () Bool)

(assert (=> b!248640 m!265499))

(declare-fun m!265501 () Bool)

(assert (=> b!248636 m!265501))

(assert (=> b!248291 d!60635))

(declare-fun d!60637 () Bool)

(declare-fun res!121856 () Bool)

(declare-fun e!161264 () Bool)

(assert (=> d!60637 (=> (not res!121856) (not e!161264))))

(declare-fun simpleValid!259 (LongMapFixedSize!3676) Bool)

(assert (=> d!60637 (= res!121856 (simpleValid!259 thiss!1504))))

(assert (=> d!60637 (= (valid!1448 thiss!1504) e!161264)))

(declare-fun b!248648 () Bool)

(declare-fun res!121857 () Bool)

(assert (=> b!248648 (=> (not res!121857) (not e!161264))))

(assert (=> b!248648 (= res!121857 (= (arrayCountValidKeys!0 (_keys!6715 thiss!1504) #b00000000000000000000000000000000 (size!6147 (_keys!6715 thiss!1504))) (_size!1887 thiss!1504)))))

(declare-fun b!248649 () Bool)

(declare-fun res!121858 () Bool)

(assert (=> b!248649 (=> (not res!121858) (not e!161264))))

(assert (=> b!248649 (= res!121858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6715 thiss!1504) (mask!10739 thiss!1504)))))

(declare-fun b!248650 () Bool)

(assert (=> b!248650 (= e!161264 (arrayNoDuplicates!0 (_keys!6715 thiss!1504) #b00000000000000000000000000000000 Nil!3624))))

(assert (= (and d!60637 res!121856) b!248648))

(assert (= (and b!248648 res!121857) b!248649))

(assert (= (and b!248649 res!121858) b!248650))

(declare-fun m!265503 () Bool)

(assert (=> d!60637 m!265503))

(assert (=> b!248648 m!265257))

(assert (=> b!248649 m!265231))

(assert (=> b!248650 m!265219))

(assert (=> start!23622 d!60637))

(declare-fun d!60639 () Bool)

(assert (=> d!60639 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!248293 d!60639))

(declare-fun b!248657 () Bool)

(declare-fun e!161269 () Bool)

(assert (=> b!248657 (= e!161269 tp_is_empty!6463)))

(declare-fun b!248658 () Bool)

(declare-fun e!161270 () Bool)

(assert (=> b!248658 (= e!161270 tp_is_empty!6463)))

(declare-fun mapIsEmpty!10982 () Bool)

(declare-fun mapRes!10982 () Bool)

(assert (=> mapIsEmpty!10982 mapRes!10982))

(declare-fun condMapEmpty!10982 () Bool)

(declare-fun mapDefault!10982 () ValueCell!2888)

(assert (=> mapNonEmpty!10973 (= condMapEmpty!10982 (= mapRest!10973 ((as const (Array (_ BitVec 32) ValueCell!2888)) mapDefault!10982)))))

(assert (=> mapNonEmpty!10973 (= tp!23054 (and e!161270 mapRes!10982))))

(declare-fun mapNonEmpty!10982 () Bool)

(declare-fun tp!23069 () Bool)

(assert (=> mapNonEmpty!10982 (= mapRes!10982 (and tp!23069 e!161269))))

(declare-fun mapKey!10982 () (_ BitVec 32))

(declare-fun mapRest!10982 () (Array (_ BitVec 32) ValueCell!2888))

(declare-fun mapValue!10982 () ValueCell!2888)

(assert (=> mapNonEmpty!10982 (= mapRest!10973 (store mapRest!10982 mapKey!10982 mapValue!10982))))

(assert (= (and mapNonEmpty!10973 condMapEmpty!10982) mapIsEmpty!10982))

(assert (= (and mapNonEmpty!10973 (not condMapEmpty!10982)) mapNonEmpty!10982))

(assert (= (and mapNonEmpty!10982 ((_ is ValueCellFull!2888) mapValue!10982)) b!248657))

(assert (= (and mapNonEmpty!10973 ((_ is ValueCellFull!2888) mapDefault!10982)) b!248658))

(declare-fun m!265505 () Bool)

(assert (=> mapNonEmpty!10982 m!265505))

(declare-fun b_lambda!8079 () Bool)

(assert (= b_lambda!8077 (or (and b!248294 b_free!6601) b_lambda!8079)))

(check-sat (not b!248585) (not b!248455) (not d!60635) (not d!60633) (not bm!23274) (not bm!23296) (not bm!23280) (not b!248532) (not b!248582) (not d!60623) (not b!248563) (not bm!23286) (not b!248586) (not bm!23287) (not b!248561) (not bm!23288) (not bm!23291) (not b!248649) (not b!248524) (not b!248578) (not b!248523) (not b!248517) b_and!13625 (not d!60605) (not b!248516) (not b!248575) (not b!248617) (not d!60615) (not b!248587) (not b!248650) (not b!248598) (not b_lambda!8079) (not b!248469) (not b!248528) (not b!248545) (not bm!23279) (not d!60603) (not b!248599) (not b_next!6601) (not mapNonEmpty!10982) (not b!248527) (not bm!23275) tp_is_empty!6463 (not b!248648) (not d!60637) (not b!248521) (not d!60611) (not bm!23283) (not d!60613) (not b!248546) (not b!248548) (not b!248462) (not b!248562) (not bm!23297) (not b!248471))
(check-sat b_and!13625 (not b_next!6601))
