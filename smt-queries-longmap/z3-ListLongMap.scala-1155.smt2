; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24282 () Bool)

(assert start!24282)

(declare-fun b!254219 () Bool)

(declare-fun b_free!6679 () Bool)

(declare-fun b_next!6679 () Bool)

(assert (=> b!254219 (= b_free!6679 (not b_next!6679))))

(declare-fun tp!23324 () Bool)

(declare-fun b_and!13735 () Bool)

(assert (=> b!254219 (= tp!23324 b_and!13735)))

(declare-fun b!254203 () Bool)

(declare-fun res!124450 () Bool)

(declare-datatypes ((V!8369 0))(
  ( (V!8370 (val!3315 Int)) )
))
(declare-datatypes ((ValueCell!2927 0))(
  ( (ValueCellFull!2927 (v!5390 V!8369)) (EmptyCell!2927) )
))
(declare-datatypes ((array!12411 0))(
  ( (array!12412 (arr!5881 (Array (_ BitVec 32) ValueCell!2927)) (size!6228 (_ BitVec 32))) )
))
(declare-datatypes ((array!12413 0))(
  ( (array!12414 (arr!5882 (Array (_ BitVec 32) (_ BitVec 64))) (size!6229 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3754 0))(
  ( (LongMapFixedSize!3755 (defaultEntry!4690 Int) (mask!10934 (_ BitVec 32)) (extraKeys!4427 (_ BitVec 32)) (zeroValue!4531 V!8369) (minValue!4531 V!8369) (_size!1926 (_ BitVec 32)) (_keys!6844 array!12413) (_values!4673 array!12411) (_vacant!1926 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3754)

(declare-datatypes ((SeekEntryResult!1111 0))(
  ( (MissingZero!1111 (index!6614 (_ BitVec 32))) (Found!1111 (index!6615 (_ BitVec 32))) (Intermediate!1111 (undefined!1923 Bool) (index!6616 (_ BitVec 32)) (x!24819 (_ BitVec 32))) (Undefined!1111) (MissingVacant!1111 (index!6617 (_ BitVec 32))) )
))
(declare-fun lt!127417 () SeekEntryResult!1111)

(assert (=> b!254203 (= res!124450 (= (select (arr!5882 (_keys!6844 thiss!1504)) (index!6617 lt!127417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164766 () Bool)

(assert (=> b!254203 (=> (not res!124450) (not e!164766))))

(declare-fun b!254204 () Bool)

(declare-fun res!124445 () Bool)

(declare-fun e!164775 () Bool)

(assert (=> b!254204 (=> (not res!124445) (not e!164775))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!254204 (= res!124445 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!11127 () Bool)

(declare-fun mapRes!11127 () Bool)

(assert (=> mapIsEmpty!11127 mapRes!11127))

(declare-fun b!254205 () Bool)

(declare-fun res!124451 () Bool)

(declare-fun e!164768 () Bool)

(assert (=> b!254205 (=> (not res!124451) (not e!164768))))

(declare-fun call!23970 () Bool)

(assert (=> b!254205 (= res!124451 call!23970)))

(declare-fun e!164762 () Bool)

(assert (=> b!254205 (= e!164762 e!164768)))

(declare-fun b!254206 () Bool)

(declare-fun e!164771 () Bool)

(declare-fun e!164773 () Bool)

(assert (=> b!254206 (= e!164771 e!164773)))

(declare-fun res!124448 () Bool)

(assert (=> b!254206 (=> (not res!124448) (not e!164773))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254206 (= res!124448 (inRange!0 index!297 (mask!10934 thiss!1504)))))

(declare-datatypes ((Unit!7845 0))(
  ( (Unit!7846) )
))
(declare-fun lt!127418 () Unit!7845)

(declare-fun e!164776 () Unit!7845)

(assert (=> b!254206 (= lt!127418 e!164776)))

(declare-fun c!42877 () Bool)

(declare-datatypes ((tuple2!4798 0))(
  ( (tuple2!4799 (_1!2410 (_ BitVec 64)) (_2!2410 V!8369)) )
))
(declare-datatypes ((List!3677 0))(
  ( (Nil!3674) (Cons!3673 (h!4335 tuple2!4798) (t!8716 List!3677)) )
))
(declare-datatypes ((ListLongMap!3713 0))(
  ( (ListLongMap!3714 (toList!1872 List!3677)) )
))
(declare-fun contains!1818 (ListLongMap!3713 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1404 (array!12413 array!12411 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 32) Int) ListLongMap!3713)

(assert (=> b!254206 (= c!42877 (contains!1818 (getCurrentListMap!1404 (_keys!6844 thiss!1504) (_values!4673 thiss!1504) (mask!10934 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4690 thiss!1504)) key!932))))

(declare-fun b!254207 () Bool)

(declare-fun call!23971 () Bool)

(assert (=> b!254207 (= e!164768 (not call!23971))))

(declare-fun b!254208 () Bool)

(declare-fun e!164774 () Bool)

(assert (=> b!254208 (= e!164773 (not e!164774))))

(declare-fun res!124455 () Bool)

(assert (=> b!254208 (=> res!124455 e!164774)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!254208 (= res!124455 (not (validMask!0 (mask!10934 thiss!1504))))))

(declare-fun lt!127420 () array!12413)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12413 (_ BitVec 32)) Bool)

(assert (=> b!254208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127420 (mask!10934 thiss!1504))))

(declare-fun lt!127422 () Unit!7845)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12413 (_ BitVec 32) (_ BitVec 32)) Unit!7845)

(assert (=> b!254208 (= lt!127422 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6844 thiss!1504) index!297 (mask!10934 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12413 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254208 (= (arrayCountValidKeys!0 lt!127420 #b00000000000000000000000000000000 (size!6229 (_keys!6844 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6844 thiss!1504) #b00000000000000000000000000000000 (size!6229 (_keys!6844 thiss!1504)))))))

(declare-fun lt!127426 () Unit!7845)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12413 (_ BitVec 32) (_ BitVec 64)) Unit!7845)

(assert (=> b!254208 (= lt!127426 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6844 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3678 0))(
  ( (Nil!3675) (Cons!3674 (h!4336 (_ BitVec 64)) (t!8717 List!3678)) )
))
(declare-fun arrayNoDuplicates!0 (array!12413 (_ BitVec 32) List!3678) Bool)

(assert (=> b!254208 (arrayNoDuplicates!0 lt!127420 #b00000000000000000000000000000000 Nil!3675)))

(assert (=> b!254208 (= lt!127420 (array!12414 (store (arr!5882 (_keys!6844 thiss!1504)) index!297 key!932) (size!6229 (_keys!6844 thiss!1504))))))

(declare-fun lt!127425 () Unit!7845)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12413 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3678) Unit!7845)

(assert (=> b!254208 (= lt!127425 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6844 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3675))))

(declare-fun lt!127424 () Unit!7845)

(declare-fun e!164770 () Unit!7845)

(assert (=> b!254208 (= lt!127424 e!164770)))

(declare-fun c!42879 () Bool)

(declare-fun arrayContainsKey!0 (array!12413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!254208 (= c!42879 (arrayContainsKey!0 (_keys!6844 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!124447 () Bool)

(assert (=> start!24282 (=> (not res!124447) (not e!164775))))

(declare-fun valid!1475 (LongMapFixedSize!3754) Bool)

(assert (=> start!24282 (= res!124447 (valid!1475 thiss!1504))))

(assert (=> start!24282 e!164775))

(declare-fun e!164767 () Bool)

(assert (=> start!24282 e!164767))

(assert (=> start!24282 true))

(declare-fun b!254209 () Bool)

(declare-fun res!124453 () Bool)

(assert (=> b!254209 (=> res!124453 e!164774)))

(assert (=> b!254209 (= res!124453 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6844 thiss!1504) (mask!10934 thiss!1504))))))

(declare-fun c!42878 () Bool)

(declare-fun bm!23967 () Bool)

(assert (=> bm!23967 (= call!23970 (inRange!0 (ite c!42878 (index!6614 lt!127417) (index!6617 lt!127417)) (mask!10934 thiss!1504)))))

(declare-fun b!254210 () Bool)

(declare-fun res!124446 () Bool)

(assert (=> b!254210 (=> (not res!124446) (not e!164768))))

(assert (=> b!254210 (= res!124446 (= (select (arr!5882 (_keys!6844 thiss!1504)) (index!6614 lt!127417)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254211 () Bool)

(declare-fun e!164763 () Bool)

(assert (=> b!254211 (= e!164763 e!164766)))

(declare-fun res!124449 () Bool)

(assert (=> b!254211 (= res!124449 call!23970)))

(assert (=> b!254211 (=> (not res!124449) (not e!164766))))

(declare-fun b!254212 () Bool)

(declare-fun lt!127423 () Unit!7845)

(assert (=> b!254212 (= e!164776 lt!127423)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!404 (array!12413 array!12411 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 64) Int) Unit!7845)

(assert (=> b!254212 (= lt!127423 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!404 (_keys!6844 thiss!1504) (_values!4673 thiss!1504) (mask!10934 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) key!932 (defaultEntry!4690 thiss!1504)))))

(get-info :version)

(assert (=> b!254212 (= c!42878 ((_ is MissingZero!1111) lt!127417))))

(assert (=> b!254212 e!164762))

(declare-fun b!254213 () Bool)

(declare-fun res!124452 () Bool)

(assert (=> b!254213 (=> res!124452 e!164774)))

(assert (=> b!254213 (= res!124452 (or (not (= (size!6228 (_values!4673 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10934 thiss!1504)))) (not (= (size!6229 (_keys!6844 thiss!1504)) (size!6228 (_values!4673 thiss!1504)))) (bvslt (mask!10934 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4427 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4427 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!254214 () Bool)

(declare-fun e!164769 () Bool)

(declare-fun e!164764 () Bool)

(assert (=> b!254214 (= e!164769 (and e!164764 mapRes!11127))))

(declare-fun condMapEmpty!11127 () Bool)

(declare-fun mapDefault!11127 () ValueCell!2927)

(assert (=> b!254214 (= condMapEmpty!11127 (= (arr!5881 (_values!4673 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2927)) mapDefault!11127)))))

(declare-fun mapNonEmpty!11127 () Bool)

(declare-fun tp!23325 () Bool)

(declare-fun e!164772 () Bool)

(assert (=> mapNonEmpty!11127 (= mapRes!11127 (and tp!23325 e!164772))))

(declare-fun mapKey!11127 () (_ BitVec 32))

(declare-fun mapRest!11127 () (Array (_ BitVec 32) ValueCell!2927))

(declare-fun mapValue!11127 () ValueCell!2927)

(assert (=> mapNonEmpty!11127 (= (arr!5881 (_values!4673 thiss!1504)) (store mapRest!11127 mapKey!11127 mapValue!11127))))

(declare-fun b!254215 () Bool)

(declare-fun Unit!7847 () Unit!7845)

(assert (=> b!254215 (= e!164770 Unit!7847)))

(declare-fun b!254216 () Bool)

(declare-fun tp_is_empty!6541 () Bool)

(assert (=> b!254216 (= e!164772 tp_is_empty!6541)))

(declare-fun b!254217 () Bool)

(assert (=> b!254217 (= e!164763 ((_ is Undefined!1111) lt!127417))))

(declare-fun b!254218 () Bool)

(assert (=> b!254218 (= e!164764 tp_is_empty!6541)))

(declare-fun array_inv!3873 (array!12413) Bool)

(declare-fun array_inv!3874 (array!12411) Bool)

(assert (=> b!254219 (= e!164767 (and tp!23324 tp_is_empty!6541 (array_inv!3873 (_keys!6844 thiss!1504)) (array_inv!3874 (_values!4673 thiss!1504)) e!164769))))

(declare-fun b!254220 () Bool)

(declare-fun Unit!7848 () Unit!7845)

(assert (=> b!254220 (= e!164770 Unit!7848)))

(declare-fun lt!127419 () Unit!7845)

(declare-fun lemmaArrayContainsKeyThenInListMap!228 (array!12413 array!12411 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 64) (_ BitVec 32) Int) Unit!7845)

(assert (=> b!254220 (= lt!127419 (lemmaArrayContainsKeyThenInListMap!228 (_keys!6844 thiss!1504) (_values!4673 thiss!1504) (mask!10934 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4690 thiss!1504)))))

(assert (=> b!254220 false))

(declare-fun b!254221 () Bool)

(assert (=> b!254221 (= e!164766 (not call!23971))))

(declare-fun b!254222 () Bool)

(assert (=> b!254222 (= e!164774 true)))

(declare-fun lt!127416 () Bool)

(assert (=> b!254222 (= lt!127416 (arrayNoDuplicates!0 (_keys!6844 thiss!1504) #b00000000000000000000000000000000 Nil!3675))))

(declare-fun b!254223 () Bool)

(declare-fun Unit!7849 () Unit!7845)

(assert (=> b!254223 (= e!164776 Unit!7849)))

(declare-fun lt!127421 () Unit!7845)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!410 (array!12413 array!12411 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 64) Int) Unit!7845)

(assert (=> b!254223 (= lt!127421 (lemmaInListMapThenSeekEntryOrOpenFindsIt!410 (_keys!6844 thiss!1504) (_values!4673 thiss!1504) (mask!10934 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) key!932 (defaultEntry!4690 thiss!1504)))))

(assert (=> b!254223 false))

(declare-fun bm!23968 () Bool)

(assert (=> bm!23968 (= call!23971 (arrayContainsKey!0 (_keys!6844 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254224 () Bool)

(declare-fun c!42876 () Bool)

(assert (=> b!254224 (= c!42876 ((_ is MissingVacant!1111) lt!127417))))

(assert (=> b!254224 (= e!164762 e!164763)))

(declare-fun b!254225 () Bool)

(assert (=> b!254225 (= e!164775 e!164771)))

(declare-fun res!124454 () Bool)

(assert (=> b!254225 (=> (not res!124454) (not e!164771))))

(assert (=> b!254225 (= res!124454 (or (= lt!127417 (MissingZero!1111 index!297)) (= lt!127417 (MissingVacant!1111 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12413 (_ BitVec 32)) SeekEntryResult!1111)

(assert (=> b!254225 (= lt!127417 (seekEntryOrOpen!0 key!932 (_keys!6844 thiss!1504) (mask!10934 thiss!1504)))))

(assert (= (and start!24282 res!124447) b!254204))

(assert (= (and b!254204 res!124445) b!254225))

(assert (= (and b!254225 res!124454) b!254206))

(assert (= (and b!254206 c!42877) b!254223))

(assert (= (and b!254206 (not c!42877)) b!254212))

(assert (= (and b!254212 c!42878) b!254205))

(assert (= (and b!254212 (not c!42878)) b!254224))

(assert (= (and b!254205 res!124451) b!254210))

(assert (= (and b!254210 res!124446) b!254207))

(assert (= (and b!254224 c!42876) b!254211))

(assert (= (and b!254224 (not c!42876)) b!254217))

(assert (= (and b!254211 res!124449) b!254203))

(assert (= (and b!254203 res!124450) b!254221))

(assert (= (or b!254205 b!254211) bm!23967))

(assert (= (or b!254207 b!254221) bm!23968))

(assert (= (and b!254206 res!124448) b!254208))

(assert (= (and b!254208 c!42879) b!254220))

(assert (= (and b!254208 (not c!42879)) b!254215))

(assert (= (and b!254208 (not res!124455)) b!254213))

(assert (= (and b!254213 (not res!124452)) b!254209))

(assert (= (and b!254209 (not res!124453)) b!254222))

(assert (= (and b!254214 condMapEmpty!11127) mapIsEmpty!11127))

(assert (= (and b!254214 (not condMapEmpty!11127)) mapNonEmpty!11127))

(assert (= (and mapNonEmpty!11127 ((_ is ValueCellFull!2927) mapValue!11127)) b!254216))

(assert (= (and b!254214 ((_ is ValueCellFull!2927) mapDefault!11127)) b!254218))

(assert (= b!254219 b!254214))

(assert (= start!24282 b!254219))

(declare-fun m!269975 () Bool)

(assert (=> b!254210 m!269975))

(declare-fun m!269977 () Bool)

(assert (=> bm!23968 m!269977))

(declare-fun m!269979 () Bool)

(assert (=> b!254206 m!269979))

(declare-fun m!269981 () Bool)

(assert (=> b!254206 m!269981))

(assert (=> b!254206 m!269981))

(declare-fun m!269983 () Bool)

(assert (=> b!254206 m!269983))

(declare-fun m!269985 () Bool)

(assert (=> b!254223 m!269985))

(declare-fun m!269987 () Bool)

(assert (=> b!254209 m!269987))

(declare-fun m!269989 () Bool)

(assert (=> b!254219 m!269989))

(declare-fun m!269991 () Bool)

(assert (=> b!254219 m!269991))

(declare-fun m!269993 () Bool)

(assert (=> bm!23967 m!269993))

(declare-fun m!269995 () Bool)

(assert (=> mapNonEmpty!11127 m!269995))

(declare-fun m!269997 () Bool)

(assert (=> start!24282 m!269997))

(declare-fun m!269999 () Bool)

(assert (=> b!254212 m!269999))

(declare-fun m!270001 () Bool)

(assert (=> b!254220 m!270001))

(declare-fun m!270003 () Bool)

(assert (=> b!254222 m!270003))

(declare-fun m!270005 () Bool)

(assert (=> b!254225 m!270005))

(declare-fun m!270007 () Bool)

(assert (=> b!254203 m!270007))

(declare-fun m!270009 () Bool)

(assert (=> b!254208 m!270009))

(assert (=> b!254208 m!269977))

(declare-fun m!270011 () Bool)

(assert (=> b!254208 m!270011))

(declare-fun m!270013 () Bool)

(assert (=> b!254208 m!270013))

(declare-fun m!270015 () Bool)

(assert (=> b!254208 m!270015))

(declare-fun m!270017 () Bool)

(assert (=> b!254208 m!270017))

(declare-fun m!270019 () Bool)

(assert (=> b!254208 m!270019))

(declare-fun m!270021 () Bool)

(assert (=> b!254208 m!270021))

(declare-fun m!270023 () Bool)

(assert (=> b!254208 m!270023))

(declare-fun m!270025 () Bool)

(assert (=> b!254208 m!270025))

(check-sat (not b!254223) (not mapNonEmpty!11127) (not b!254212) (not b!254219) (not b!254209) (not start!24282) (not b!254222) tp_is_empty!6541 (not bm!23967) b_and!13735 (not b!254206) (not b_next!6679) (not b!254208) (not b!254220) (not b!254225) (not bm!23968))
(check-sat b_and!13735 (not b_next!6679))
