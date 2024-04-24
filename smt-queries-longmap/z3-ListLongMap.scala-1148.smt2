; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24012 () Bool)

(assert start!24012)

(declare-fun b!251397 () Bool)

(declare-fun b_free!6637 () Bool)

(declare-fun b_next!6637 () Bool)

(assert (=> b!251397 (= b_free!6637 (not b_next!6637))))

(declare-fun tp!23183 () Bool)

(declare-fun b_and!13679 () Bool)

(assert (=> b!251397 (= tp!23183 b_and!13679)))

(declare-fun b!251393 () Bool)

(declare-fun e!163032 () Bool)

(declare-fun e!163036 () Bool)

(assert (=> b!251393 (= e!163032 e!163036)))

(declare-fun res!123094 () Bool)

(declare-fun call!23634 () Bool)

(assert (=> b!251393 (= res!123094 call!23634)))

(assert (=> b!251393 (=> (not res!123094) (not e!163036))))

(declare-fun b!251394 () Bool)

(declare-fun res!123086 () Bool)

(declare-fun e!163033 () Bool)

(assert (=> b!251394 (=> (not res!123086) (not e!163033))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!251394 (= res!123086 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!251395 () Bool)

(declare-datatypes ((SeekEntryResult!1091 0))(
  ( (MissingZero!1091 (index!6534 (_ BitVec 32))) (Found!1091 (index!6535 (_ BitVec 32))) (Intermediate!1091 (undefined!1903 Bool) (index!6536 (_ BitVec 32)) (x!24685 (_ BitVec 32))) (Undefined!1091) (MissingVacant!1091 (index!6537 (_ BitVec 32))) )
))
(declare-fun lt!126024 () SeekEntryResult!1091)

(get-info :version)

(assert (=> b!251395 (= e!163032 ((_ is Undefined!1091) lt!126024))))

(declare-fun b!251396 () Bool)

(declare-datatypes ((Unit!7750 0))(
  ( (Unit!7751) )
))
(declare-fun e!163031 () Unit!7750)

(declare-fun Unit!7752 () Unit!7750)

(assert (=> b!251396 (= e!163031 Unit!7752)))

(declare-fun lt!126027 () Unit!7750)

(declare-datatypes ((V!8313 0))(
  ( (V!8314 (val!3294 Int)) )
))
(declare-datatypes ((ValueCell!2906 0))(
  ( (ValueCellFull!2906 (v!5363 V!8313)) (EmptyCell!2906) )
))
(declare-datatypes ((array!12317 0))(
  ( (array!12318 (arr!5839 (Array (_ BitVec 32) ValueCell!2906)) (size!6185 (_ BitVec 32))) )
))
(declare-datatypes ((array!12319 0))(
  ( (array!12320 (arr!5840 (Array (_ BitVec 32) (_ BitVec 64))) (size!6186 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3712 0))(
  ( (LongMapFixedSize!3713 (defaultEntry!4645 Int) (mask!10846 (_ BitVec 32)) (extraKeys!4382 (_ BitVec 32)) (zeroValue!4486 V!8313) (minValue!4486 V!8313) (_size!1905 (_ BitVec 32)) (_keys!6787 array!12319) (_values!4628 array!12317) (_vacant!1905 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3712)

(declare-fun lemmaArrayContainsKeyThenInListMap!215 (array!12319 array!12317 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) (_ BitVec 32) Int) Unit!7750)

(assert (=> b!251396 (= lt!126027 (lemmaArrayContainsKeyThenInListMap!215 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(assert (=> b!251396 false))

(declare-fun e!163037 () Bool)

(declare-fun e!163034 () Bool)

(declare-fun tp_is_empty!6499 () Bool)

(declare-fun array_inv!3839 (array!12319) Bool)

(declare-fun array_inv!3840 (array!12317) Bool)

(assert (=> b!251397 (= e!163034 (and tp!23183 tp_is_empty!6499 (array_inv!3839 (_keys!6787 thiss!1504)) (array_inv!3840 (_values!4628 thiss!1504)) e!163037))))

(declare-fun b!251398 () Bool)

(declare-fun e!163028 () Unit!7750)

(declare-fun lt!126021 () Unit!7750)

(assert (=> b!251398 (= e!163028 lt!126021)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!391 (array!12319 array!12317 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) Int) Unit!7750)

(assert (=> b!251398 (= lt!126021 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!391 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)))))

(declare-fun c!42306 () Bool)

(assert (=> b!251398 (= c!42306 ((_ is MissingZero!1091) lt!126024))))

(declare-fun e!163024 () Bool)

(assert (=> b!251398 e!163024))

(declare-fun b!251399 () Bool)

(declare-fun res!123093 () Bool)

(declare-fun e!163027 () Bool)

(assert (=> b!251399 (=> (not res!123093) (not e!163027))))

(assert (=> b!251399 (= res!123093 call!23634)))

(assert (=> b!251399 (= e!163024 e!163027)))

(declare-fun mapNonEmpty!11048 () Bool)

(declare-fun mapRes!11048 () Bool)

(declare-fun tp!23182 () Bool)

(declare-fun e!163038 () Bool)

(assert (=> mapNonEmpty!11048 (= mapRes!11048 (and tp!23182 e!163038))))

(declare-fun mapKey!11048 () (_ BitVec 32))

(declare-fun mapValue!11048 () ValueCell!2906)

(declare-fun mapRest!11048 () (Array (_ BitVec 32) ValueCell!2906))

(assert (=> mapNonEmpty!11048 (= (arr!5839 (_values!4628 thiss!1504)) (store mapRest!11048 mapKey!11048 mapValue!11048))))

(declare-fun b!251400 () Bool)

(declare-fun Unit!7753 () Unit!7750)

(assert (=> b!251400 (= e!163028 Unit!7753)))

(declare-fun lt!126019 () Unit!7750)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!395 (array!12319 array!12317 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) Int) Unit!7750)

(assert (=> b!251400 (= lt!126019 (lemmaInListMapThenSeekEntryOrOpenFindsIt!395 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)))))

(assert (=> b!251400 false))

(declare-fun b!251401 () Bool)

(assert (=> b!251401 (= e!163038 tp_is_empty!6499)))

(declare-fun b!251402 () Bool)

(declare-fun Unit!7754 () Unit!7750)

(assert (=> b!251402 (= e!163031 Unit!7754)))

(declare-fun b!251403 () Bool)

(declare-fun e!163025 () Bool)

(assert (=> b!251403 (= e!163025 (or (not (= (size!6185 (_values!4628 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10846 thiss!1504)))) (not (= (size!6186 (_keys!6787 thiss!1504)) (size!6185 (_values!4628 thiss!1504)))) (bvslt (mask!10846 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4382 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4382 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11048 () Bool)

(assert (=> mapIsEmpty!11048 mapRes!11048))

(declare-fun bm!23631 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23631 (= call!23634 (inRange!0 (ite c!42306 (index!6534 lt!126024) (index!6537 lt!126024)) (mask!10846 thiss!1504)))))

(declare-fun b!251404 () Bool)

(declare-fun e!163026 () Bool)

(declare-fun e!163030 () Bool)

(assert (=> b!251404 (= e!163026 e!163030)))

(declare-fun res!123090 () Bool)

(assert (=> b!251404 (=> (not res!123090) (not e!163030))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!251404 (= res!123090 (inRange!0 index!297 (mask!10846 thiss!1504)))))

(declare-fun lt!126018 () Unit!7750)

(assert (=> b!251404 (= lt!126018 e!163028)))

(declare-fun c!42304 () Bool)

(declare-datatypes ((tuple2!4770 0))(
  ( (tuple2!4771 (_1!2396 (_ BitVec 64)) (_2!2396 V!8313)) )
))
(declare-datatypes ((List!3647 0))(
  ( (Nil!3644) (Cons!3643 (h!4304 tuple2!4770) (t!8676 List!3647)) )
))
(declare-datatypes ((ListLongMap!3685 0))(
  ( (ListLongMap!3686 (toList!1858 List!3647)) )
))
(declare-fun contains!1798 (ListLongMap!3685 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1390 (array!12319 array!12317 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 32) Int) ListLongMap!3685)

(assert (=> b!251404 (= c!42304 (contains!1798 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) key!932))))

(declare-fun res!123091 () Bool)

(assert (=> start!24012 (=> (not res!123091) (not e!163033))))

(declare-fun valid!1459 (LongMapFixedSize!3712) Bool)

(assert (=> start!24012 (= res!123091 (valid!1459 thiss!1504))))

(assert (=> start!24012 e!163033))

(assert (=> start!24012 e!163034))

(assert (=> start!24012 true))

(declare-fun b!251405 () Bool)

(assert (=> b!251405 (= e!163030 (not e!163025))))

(declare-fun res!123087 () Bool)

(assert (=> b!251405 (=> res!123087 e!163025)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!251405 (= res!123087 (not (validMask!0 (mask!10846 thiss!1504))))))

(declare-fun lt!126026 () array!12319)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12319 (_ BitVec 32)) Bool)

(assert (=> b!251405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126026 (mask!10846 thiss!1504))))

(declare-fun lt!126022 () Unit!7750)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12319 (_ BitVec 32) (_ BitVec 32)) Unit!7750)

(assert (=> b!251405 (= lt!126022 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6787 thiss!1504) index!297 (mask!10846 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12319 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251405 (= (arrayCountValidKeys!0 lt!126026 #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6787 thiss!1504) #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504)))))))

(declare-fun lt!126020 () Unit!7750)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12319 (_ BitVec 32) (_ BitVec 64)) Unit!7750)

(assert (=> b!251405 (= lt!126020 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6787 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3648 0))(
  ( (Nil!3645) (Cons!3644 (h!4305 (_ BitVec 64)) (t!8677 List!3648)) )
))
(declare-fun arrayNoDuplicates!0 (array!12319 (_ BitVec 32) List!3648) Bool)

(assert (=> b!251405 (arrayNoDuplicates!0 lt!126026 #b00000000000000000000000000000000 Nil!3645)))

(assert (=> b!251405 (= lt!126026 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun lt!126025 () Unit!7750)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12319 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3648) Unit!7750)

(assert (=> b!251405 (= lt!126025 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6787 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3645))))

(declare-fun lt!126023 () Unit!7750)

(assert (=> b!251405 (= lt!126023 e!163031)))

(declare-fun c!42305 () Bool)

(declare-fun arrayContainsKey!0 (array!12319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!251405 (= c!42305 (arrayContainsKey!0 (_keys!6787 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251406 () Bool)

(assert (=> b!251406 (= e!163033 e!163026)))

(declare-fun res!123089 () Bool)

(assert (=> b!251406 (=> (not res!123089) (not e!163026))))

(assert (=> b!251406 (= res!123089 (or (= lt!126024 (MissingZero!1091 index!297)) (= lt!126024 (MissingVacant!1091 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12319 (_ BitVec 32)) SeekEntryResult!1091)

(assert (=> b!251406 (= lt!126024 (seekEntryOrOpen!0 key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(declare-fun b!251407 () Bool)

(declare-fun call!23635 () Bool)

(assert (=> b!251407 (= e!163027 (not call!23635))))

(declare-fun b!251408 () Bool)

(declare-fun e!163029 () Bool)

(assert (=> b!251408 (= e!163029 tp_is_empty!6499)))

(declare-fun b!251409 () Bool)

(declare-fun res!123088 () Bool)

(assert (=> b!251409 (= res!123088 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6537 lt!126024)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251409 (=> (not res!123088) (not e!163036))))

(declare-fun b!251410 () Bool)

(assert (=> b!251410 (= e!163037 (and e!163029 mapRes!11048))))

(declare-fun condMapEmpty!11048 () Bool)

(declare-fun mapDefault!11048 () ValueCell!2906)

(assert (=> b!251410 (= condMapEmpty!11048 (= (arr!5839 (_values!4628 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2906)) mapDefault!11048)))))

(declare-fun b!251411 () Bool)

(declare-fun c!42303 () Bool)

(assert (=> b!251411 (= c!42303 ((_ is MissingVacant!1091) lt!126024))))

(assert (=> b!251411 (= e!163024 e!163032)))

(declare-fun b!251412 () Bool)

(assert (=> b!251412 (= e!163036 (not call!23635))))

(declare-fun b!251413 () Bool)

(declare-fun res!123092 () Bool)

(assert (=> b!251413 (=> (not res!123092) (not e!163027))))

(assert (=> b!251413 (= res!123092 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6534 lt!126024)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23632 () Bool)

(assert (=> bm!23632 (= call!23635 (arrayContainsKey!0 (_keys!6787 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!24012 res!123091) b!251394))

(assert (= (and b!251394 res!123086) b!251406))

(assert (= (and b!251406 res!123089) b!251404))

(assert (= (and b!251404 c!42304) b!251400))

(assert (= (and b!251404 (not c!42304)) b!251398))

(assert (= (and b!251398 c!42306) b!251399))

(assert (= (and b!251398 (not c!42306)) b!251411))

(assert (= (and b!251399 res!123093) b!251413))

(assert (= (and b!251413 res!123092) b!251407))

(assert (= (and b!251411 c!42303) b!251393))

(assert (= (and b!251411 (not c!42303)) b!251395))

(assert (= (and b!251393 res!123094) b!251409))

(assert (= (and b!251409 res!123088) b!251412))

(assert (= (or b!251399 b!251393) bm!23631))

(assert (= (or b!251407 b!251412) bm!23632))

(assert (= (and b!251404 res!123090) b!251405))

(assert (= (and b!251405 c!42305) b!251396))

(assert (= (and b!251405 (not c!42305)) b!251402))

(assert (= (and b!251405 (not res!123087)) b!251403))

(assert (= (and b!251410 condMapEmpty!11048) mapIsEmpty!11048))

(assert (= (and b!251410 (not condMapEmpty!11048)) mapNonEmpty!11048))

(assert (= (and mapNonEmpty!11048 ((_ is ValueCellFull!2906) mapValue!11048)) b!251401))

(assert (= (and b!251410 ((_ is ValueCellFull!2906) mapDefault!11048)) b!251408))

(assert (= b!251397 b!251410))

(assert (= start!24012 b!251397))

(declare-fun m!267829 () Bool)

(assert (=> mapNonEmpty!11048 m!267829))

(declare-fun m!267831 () Bool)

(assert (=> b!251413 m!267831))

(declare-fun m!267833 () Bool)

(assert (=> b!251406 m!267833))

(declare-fun m!267835 () Bool)

(assert (=> bm!23631 m!267835))

(declare-fun m!267837 () Bool)

(assert (=> b!251405 m!267837))

(declare-fun m!267839 () Bool)

(assert (=> b!251405 m!267839))

(declare-fun m!267841 () Bool)

(assert (=> b!251405 m!267841))

(declare-fun m!267843 () Bool)

(assert (=> b!251405 m!267843))

(declare-fun m!267845 () Bool)

(assert (=> b!251405 m!267845))

(declare-fun m!267847 () Bool)

(assert (=> b!251405 m!267847))

(declare-fun m!267849 () Bool)

(assert (=> b!251405 m!267849))

(declare-fun m!267851 () Bool)

(assert (=> b!251405 m!267851))

(declare-fun m!267853 () Bool)

(assert (=> b!251405 m!267853))

(declare-fun m!267855 () Bool)

(assert (=> b!251405 m!267855))

(declare-fun m!267857 () Bool)

(assert (=> start!24012 m!267857))

(declare-fun m!267859 () Bool)

(assert (=> b!251396 m!267859))

(declare-fun m!267861 () Bool)

(assert (=> b!251409 m!267861))

(declare-fun m!267863 () Bool)

(assert (=> b!251404 m!267863))

(declare-fun m!267865 () Bool)

(assert (=> b!251404 m!267865))

(assert (=> b!251404 m!267865))

(declare-fun m!267867 () Bool)

(assert (=> b!251404 m!267867))

(assert (=> bm!23632 m!267839))

(declare-fun m!267869 () Bool)

(assert (=> b!251398 m!267869))

(declare-fun m!267871 () Bool)

(assert (=> b!251397 m!267871))

(declare-fun m!267873 () Bool)

(assert (=> b!251397 m!267873))

(declare-fun m!267875 () Bool)

(assert (=> b!251400 m!267875))

(check-sat (not bm!23632) (not mapNonEmpty!11048) (not b_next!6637) (not b!251396) (not b!251397) (not b!251404) b_and!13679 (not b!251400) (not start!24012) tp_is_empty!6499 (not bm!23631) (not b!251398) (not b!251405) (not b!251406))
(check-sat b_and!13679 (not b_next!6637))
(get-model)

(declare-fun b!251556 () Bool)

(declare-fun e!163138 () Bool)

(declare-fun call!23653 () Bool)

(assert (=> b!251556 (= e!163138 (not call!23653))))

(declare-fun lt!126092 () SeekEntryResult!1091)

(declare-fun c!42336 () Bool)

(declare-fun call!23652 () Bool)

(declare-fun bm!23649 () Bool)

(assert (=> bm!23649 (= call!23652 (inRange!0 (ite c!42336 (index!6534 lt!126092) (index!6537 lt!126092)) (mask!10846 thiss!1504)))))

(declare-fun b!251557 () Bool)

(assert (=> b!251557 (and (bvsge (index!6534 lt!126092) #b00000000000000000000000000000000) (bvslt (index!6534 lt!126092) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun res!123158 () Bool)

(assert (=> b!251557 (= res!123158 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6534 lt!126092)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163139 () Bool)

(assert (=> b!251557 (=> (not res!123158) (not e!163139))))

(declare-fun b!251558 () Bool)

(declare-fun e!163140 () Bool)

(declare-fun e!163137 () Bool)

(assert (=> b!251558 (= e!163140 e!163137)))

(declare-fun c!42335 () Bool)

(assert (=> b!251558 (= c!42335 ((_ is MissingVacant!1091) lt!126092))))

(declare-fun b!251559 () Bool)

(assert (=> b!251559 (= e!163137 ((_ is Undefined!1091) lt!126092))))

(declare-fun bm!23650 () Bool)

(assert (=> bm!23650 (= call!23653 (arrayContainsKey!0 (_keys!6787 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251560 () Bool)

(assert (=> b!251560 (= e!163139 (not call!23653))))

(declare-fun d!61207 () Bool)

(assert (=> d!61207 e!163140))

(assert (=> d!61207 (= c!42336 ((_ is MissingZero!1091) lt!126092))))

(assert (=> d!61207 (= lt!126092 (seekEntryOrOpen!0 key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(declare-fun lt!126093 () Unit!7750)

(declare-fun choose!1201 (array!12319 array!12317 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) Int) Unit!7750)

(assert (=> d!61207 (= lt!126093 (choose!1201 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)))))

(assert (=> d!61207 (validMask!0 (mask!10846 thiss!1504))))

(assert (=> d!61207 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!391 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)) lt!126093)))

(declare-fun b!251561 () Bool)

(declare-fun res!123157 () Bool)

(assert (=> b!251561 (=> (not res!123157) (not e!163138))))

(assert (=> b!251561 (= res!123157 call!23652)))

(assert (=> b!251561 (= e!163137 e!163138)))

(declare-fun b!251562 () Bool)

(declare-fun res!123160 () Bool)

(assert (=> b!251562 (=> (not res!123160) (not e!163138))))

(assert (=> b!251562 (= res!123160 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6537 lt!126092)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251562 (and (bvsge (index!6537 lt!126092) #b00000000000000000000000000000000) (bvslt (index!6537 lt!126092) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251563 () Bool)

(assert (=> b!251563 (= e!163140 e!163139)))

(declare-fun res!123159 () Bool)

(assert (=> b!251563 (= res!123159 call!23652)))

(assert (=> b!251563 (=> (not res!123159) (not e!163139))))

(assert (= (and d!61207 c!42336) b!251563))

(assert (= (and d!61207 (not c!42336)) b!251558))

(assert (= (and b!251563 res!123159) b!251557))

(assert (= (and b!251557 res!123158) b!251560))

(assert (= (and b!251558 c!42335) b!251561))

(assert (= (and b!251558 (not c!42335)) b!251559))

(assert (= (and b!251561 res!123157) b!251562))

(assert (= (and b!251562 res!123160) b!251556))

(assert (= (or b!251563 b!251561) bm!23649))

(assert (= (or b!251560 b!251556) bm!23650))

(assert (=> bm!23650 m!267839))

(assert (=> d!61207 m!267833))

(declare-fun m!267973 () Bool)

(assert (=> d!61207 m!267973))

(assert (=> d!61207 m!267837))

(declare-fun m!267975 () Bool)

(assert (=> b!251557 m!267975))

(declare-fun m!267977 () Bool)

(assert (=> b!251562 m!267977))

(declare-fun m!267979 () Bool)

(assert (=> bm!23649 m!267979))

(assert (=> b!251398 d!61207))

(declare-fun b!251576 () Bool)

(declare-fun e!163149 () SeekEntryResult!1091)

(assert (=> b!251576 (= e!163149 Undefined!1091)))

(declare-fun b!251577 () Bool)

(declare-fun c!42345 () Bool)

(declare-fun lt!126101 () (_ BitVec 64))

(assert (=> b!251577 (= c!42345 (= lt!126101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163148 () SeekEntryResult!1091)

(declare-fun e!163147 () SeekEntryResult!1091)

(assert (=> b!251577 (= e!163148 e!163147)))

(declare-fun d!61209 () Bool)

(declare-fun lt!126100 () SeekEntryResult!1091)

(assert (=> d!61209 (and (or ((_ is Undefined!1091) lt!126100) (not ((_ is Found!1091) lt!126100)) (and (bvsge (index!6535 lt!126100) #b00000000000000000000000000000000) (bvslt (index!6535 lt!126100) (size!6186 (_keys!6787 thiss!1504))))) (or ((_ is Undefined!1091) lt!126100) ((_ is Found!1091) lt!126100) (not ((_ is MissingZero!1091) lt!126100)) (and (bvsge (index!6534 lt!126100) #b00000000000000000000000000000000) (bvslt (index!6534 lt!126100) (size!6186 (_keys!6787 thiss!1504))))) (or ((_ is Undefined!1091) lt!126100) ((_ is Found!1091) lt!126100) ((_ is MissingZero!1091) lt!126100) (not ((_ is MissingVacant!1091) lt!126100)) (and (bvsge (index!6537 lt!126100) #b00000000000000000000000000000000) (bvslt (index!6537 lt!126100) (size!6186 (_keys!6787 thiss!1504))))) (or ((_ is Undefined!1091) lt!126100) (ite ((_ is Found!1091) lt!126100) (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6535 lt!126100)) key!932) (ite ((_ is MissingZero!1091) lt!126100) (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6534 lt!126100)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1091) lt!126100) (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6537 lt!126100)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61209 (= lt!126100 e!163149)))

(declare-fun c!42343 () Bool)

(declare-fun lt!126102 () SeekEntryResult!1091)

(assert (=> d!61209 (= c!42343 (and ((_ is Intermediate!1091) lt!126102) (undefined!1903 lt!126102)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12319 (_ BitVec 32)) SeekEntryResult!1091)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61209 (= lt!126102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10846 thiss!1504)) key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(assert (=> d!61209 (validMask!0 (mask!10846 thiss!1504))))

(assert (=> d!61209 (= (seekEntryOrOpen!0 key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)) lt!126100)))

(declare-fun b!251578 () Bool)

(assert (=> b!251578 (= e!163148 (Found!1091 (index!6536 lt!126102)))))

(declare-fun b!251579 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12319 (_ BitVec 32)) SeekEntryResult!1091)

(assert (=> b!251579 (= e!163147 (seekKeyOrZeroReturnVacant!0 (x!24685 lt!126102) (index!6536 lt!126102) (index!6536 lt!126102) key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(declare-fun b!251580 () Bool)

(assert (=> b!251580 (= e!163149 e!163148)))

(assert (=> b!251580 (= lt!126101 (select (arr!5840 (_keys!6787 thiss!1504)) (index!6536 lt!126102)))))

(declare-fun c!42344 () Bool)

(assert (=> b!251580 (= c!42344 (= lt!126101 key!932))))

(declare-fun b!251581 () Bool)

(assert (=> b!251581 (= e!163147 (MissingZero!1091 (index!6536 lt!126102)))))

(assert (= (and d!61209 c!42343) b!251576))

(assert (= (and d!61209 (not c!42343)) b!251580))

(assert (= (and b!251580 c!42344) b!251578))

(assert (= (and b!251580 (not c!42344)) b!251577))

(assert (= (and b!251577 c!42345) b!251581))

(assert (= (and b!251577 (not c!42345)) b!251579))

(declare-fun m!267981 () Bool)

(assert (=> d!61209 m!267981))

(assert (=> d!61209 m!267837))

(declare-fun m!267983 () Bool)

(assert (=> d!61209 m!267983))

(declare-fun m!267985 () Bool)

(assert (=> d!61209 m!267985))

(assert (=> d!61209 m!267983))

(declare-fun m!267987 () Bool)

(assert (=> d!61209 m!267987))

(declare-fun m!267989 () Bool)

(assert (=> d!61209 m!267989))

(declare-fun m!267991 () Bool)

(assert (=> b!251579 m!267991))

(declare-fun m!267993 () Bool)

(assert (=> b!251580 m!267993))

(assert (=> b!251406 d!61209))

(declare-fun b!251591 () Bool)

(declare-fun res!123170 () Bool)

(declare-fun e!163154 () Bool)

(assert (=> b!251591 (=> (not res!123170) (not e!163154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!251591 (= res!123170 (validKeyInArray!0 key!932))))

(declare-fun d!61211 () Bool)

(declare-fun e!163155 () Bool)

(assert (=> d!61211 e!163155))

(declare-fun res!123171 () Bool)

(assert (=> d!61211 (=> (not res!123171) (not e!163155))))

(assert (=> d!61211 (= res!123171 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6186 (_keys!6787 thiss!1504)))))))

(declare-fun lt!126105 () Unit!7750)

(declare-fun choose!1 (array!12319 (_ BitVec 32) (_ BitVec 64)) Unit!7750)

(assert (=> d!61211 (= lt!126105 (choose!1 (_keys!6787 thiss!1504) index!297 key!932))))

(assert (=> d!61211 e!163154))

(declare-fun res!123172 () Bool)

(assert (=> d!61211 (=> (not res!123172) (not e!163154))))

(assert (=> d!61211 (= res!123172 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6186 (_keys!6787 thiss!1504)))))))

(assert (=> d!61211 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6787 thiss!1504) index!297 key!932) lt!126105)))

(declare-fun b!251593 () Bool)

(assert (=> b!251593 (= e!163155 (= (arrayCountValidKeys!0 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6787 thiss!1504) #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!251590 () Bool)

(declare-fun res!123169 () Bool)

(assert (=> b!251590 (=> (not res!123169) (not e!163154))))

(assert (=> b!251590 (= res!123169 (not (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) index!297))))))

(declare-fun b!251592 () Bool)

(assert (=> b!251592 (= e!163154 (bvslt (size!6186 (_keys!6787 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!61211 res!123172) b!251590))

(assert (= (and b!251590 res!123169) b!251591))

(assert (= (and b!251591 res!123170) b!251592))

(assert (= (and d!61211 res!123171) b!251593))

(declare-fun m!267995 () Bool)

(assert (=> b!251591 m!267995))

(declare-fun m!267997 () Bool)

(assert (=> d!61211 m!267997))

(assert (=> b!251593 m!267847))

(declare-fun m!267999 () Bool)

(assert (=> b!251593 m!267999))

(assert (=> b!251593 m!267849))

(declare-fun m!268001 () Bool)

(assert (=> b!251590 m!268001))

(assert (=> b!251590 m!268001))

(declare-fun m!268003 () Bool)

(assert (=> b!251590 m!268003))

(assert (=> b!251405 d!61211))

(declare-fun b!251603 () Bool)

(declare-fun e!163160 () (_ BitVec 32))

(assert (=> b!251603 (= e!163160 #b00000000000000000000000000000000)))

(declare-fun b!251604 () Bool)

(declare-fun e!163161 () (_ BitVec 32))

(declare-fun call!23656 () (_ BitVec 32))

(assert (=> b!251604 (= e!163161 call!23656)))

(declare-fun b!251605 () Bool)

(assert (=> b!251605 (= e!163160 e!163161)))

(declare-fun c!42350 () Bool)

(assert (=> b!251605 (= c!42350 (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23653 () Bool)

(assert (=> bm!23653 (= call!23656 (arrayCountValidKeys!0 (_keys!6787 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251602 () Bool)

(assert (=> b!251602 (= e!163161 (bvadd #b00000000000000000000000000000001 call!23656))))

(declare-fun d!61213 () Bool)

(declare-fun lt!126108 () (_ BitVec 32))

(assert (=> d!61213 (and (bvsge lt!126108 #b00000000000000000000000000000000) (bvsle lt!126108 (bvsub (size!6186 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61213 (= lt!126108 e!163160)))

(declare-fun c!42351 () Bool)

(assert (=> d!61213 (= c!42351 (bvsge #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> d!61213 (and (bvsle #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6186 (_keys!6787 thiss!1504)) (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> d!61213 (= (arrayCountValidKeys!0 (_keys!6787 thiss!1504) #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) lt!126108)))

(assert (= (and d!61213 c!42351) b!251603))

(assert (= (and d!61213 (not c!42351)) b!251605))

(assert (= (and b!251605 c!42350) b!251602))

(assert (= (and b!251605 (not c!42350)) b!251604))

(assert (= (or b!251602 b!251604) bm!23653))

(declare-fun m!268005 () Bool)

(assert (=> b!251605 m!268005))

(assert (=> b!251605 m!268005))

(declare-fun m!268007 () Bool)

(assert (=> b!251605 m!268007))

(declare-fun m!268009 () Bool)

(assert (=> bm!23653 m!268009))

(assert (=> b!251405 d!61213))

(declare-fun d!61215 () Bool)

(assert (=> d!61215 (= (validMask!0 (mask!10846 thiss!1504)) (and (or (= (mask!10846 thiss!1504) #b00000000000000000000000000000111) (= (mask!10846 thiss!1504) #b00000000000000000000000000001111) (= (mask!10846 thiss!1504) #b00000000000000000000000000011111) (= (mask!10846 thiss!1504) #b00000000000000000000000000111111) (= (mask!10846 thiss!1504) #b00000000000000000000000001111111) (= (mask!10846 thiss!1504) #b00000000000000000000000011111111) (= (mask!10846 thiss!1504) #b00000000000000000000000111111111) (= (mask!10846 thiss!1504) #b00000000000000000000001111111111) (= (mask!10846 thiss!1504) #b00000000000000000000011111111111) (= (mask!10846 thiss!1504) #b00000000000000000000111111111111) (= (mask!10846 thiss!1504) #b00000000000000000001111111111111) (= (mask!10846 thiss!1504) #b00000000000000000011111111111111) (= (mask!10846 thiss!1504) #b00000000000000000111111111111111) (= (mask!10846 thiss!1504) #b00000000000000001111111111111111) (= (mask!10846 thiss!1504) #b00000000000000011111111111111111) (= (mask!10846 thiss!1504) #b00000000000000111111111111111111) (= (mask!10846 thiss!1504) #b00000000000001111111111111111111) (= (mask!10846 thiss!1504) #b00000000000011111111111111111111) (= (mask!10846 thiss!1504) #b00000000000111111111111111111111) (= (mask!10846 thiss!1504) #b00000000001111111111111111111111) (= (mask!10846 thiss!1504) #b00000000011111111111111111111111) (= (mask!10846 thiss!1504) #b00000000111111111111111111111111) (= (mask!10846 thiss!1504) #b00000001111111111111111111111111) (= (mask!10846 thiss!1504) #b00000011111111111111111111111111) (= (mask!10846 thiss!1504) #b00000111111111111111111111111111) (= (mask!10846 thiss!1504) #b00001111111111111111111111111111) (= (mask!10846 thiss!1504) #b00011111111111111111111111111111) (= (mask!10846 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10846 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!251405 d!61215))

(declare-fun b!251614 () Bool)

(declare-fun e!163169 () Bool)

(declare-fun call!23659 () Bool)

(assert (=> b!251614 (= e!163169 call!23659)))

(declare-fun bm!23656 () Bool)

(assert (=> bm!23656 (= call!23659 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126026 (mask!10846 thiss!1504)))))

(declare-fun d!61217 () Bool)

(declare-fun res!123178 () Bool)

(declare-fun e!163170 () Bool)

(assert (=> d!61217 (=> res!123178 e!163170)))

(assert (=> d!61217 (= res!123178 (bvsge #b00000000000000000000000000000000 (size!6186 lt!126026)))))

(assert (=> d!61217 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126026 (mask!10846 thiss!1504)) e!163170)))

(declare-fun b!251615 () Bool)

(assert (=> b!251615 (= e!163170 e!163169)))

(declare-fun c!42354 () Bool)

(assert (=> b!251615 (= c!42354 (validKeyInArray!0 (select (arr!5840 lt!126026) #b00000000000000000000000000000000)))))

(declare-fun b!251616 () Bool)

(declare-fun e!163168 () Bool)

(assert (=> b!251616 (= e!163168 call!23659)))

(declare-fun b!251617 () Bool)

(assert (=> b!251617 (= e!163169 e!163168)))

(declare-fun lt!126115 () (_ BitVec 64))

(assert (=> b!251617 (= lt!126115 (select (arr!5840 lt!126026) #b00000000000000000000000000000000))))

(declare-fun lt!126116 () Unit!7750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12319 (_ BitVec 64) (_ BitVec 32)) Unit!7750)

(assert (=> b!251617 (= lt!126116 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126026 lt!126115 #b00000000000000000000000000000000))))

(assert (=> b!251617 (arrayContainsKey!0 lt!126026 lt!126115 #b00000000000000000000000000000000)))

(declare-fun lt!126117 () Unit!7750)

(assert (=> b!251617 (= lt!126117 lt!126116)))

(declare-fun res!123177 () Bool)

(assert (=> b!251617 (= res!123177 (= (seekEntryOrOpen!0 (select (arr!5840 lt!126026) #b00000000000000000000000000000000) lt!126026 (mask!10846 thiss!1504)) (Found!1091 #b00000000000000000000000000000000)))))

(assert (=> b!251617 (=> (not res!123177) (not e!163168))))

(assert (= (and d!61217 (not res!123178)) b!251615))

(assert (= (and b!251615 c!42354) b!251617))

(assert (= (and b!251615 (not c!42354)) b!251614))

(assert (= (and b!251617 res!123177) b!251616))

(assert (= (or b!251616 b!251614) bm!23656))

(declare-fun m!268011 () Bool)

(assert (=> bm!23656 m!268011))

(declare-fun m!268013 () Bool)

(assert (=> b!251615 m!268013))

(assert (=> b!251615 m!268013))

(declare-fun m!268015 () Bool)

(assert (=> b!251615 m!268015))

(assert (=> b!251617 m!268013))

(declare-fun m!268017 () Bool)

(assert (=> b!251617 m!268017))

(declare-fun m!268019 () Bool)

(assert (=> b!251617 m!268019))

(assert (=> b!251617 m!268013))

(declare-fun m!268021 () Bool)

(assert (=> b!251617 m!268021))

(assert (=> b!251405 d!61217))

(declare-fun b!251619 () Bool)

(declare-fun e!163171 () (_ BitVec 32))

(assert (=> b!251619 (= e!163171 #b00000000000000000000000000000000)))

(declare-fun b!251620 () Bool)

(declare-fun e!163172 () (_ BitVec 32))

(declare-fun call!23660 () (_ BitVec 32))

(assert (=> b!251620 (= e!163172 call!23660)))

(declare-fun b!251621 () Bool)

(assert (=> b!251621 (= e!163171 e!163172)))

(declare-fun c!42355 () Bool)

(assert (=> b!251621 (= c!42355 (validKeyInArray!0 (select (arr!5840 lt!126026) #b00000000000000000000000000000000)))))

(declare-fun bm!23657 () Bool)

(assert (=> bm!23657 (= call!23660 (arrayCountValidKeys!0 lt!126026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251618 () Bool)

(assert (=> b!251618 (= e!163172 (bvadd #b00000000000000000000000000000001 call!23660))))

(declare-fun d!61219 () Bool)

(declare-fun lt!126118 () (_ BitVec 32))

(assert (=> d!61219 (and (bvsge lt!126118 #b00000000000000000000000000000000) (bvsle lt!126118 (bvsub (size!6186 lt!126026) #b00000000000000000000000000000000)))))

(assert (=> d!61219 (= lt!126118 e!163171)))

(declare-fun c!42356 () Bool)

(assert (=> d!61219 (= c!42356 (bvsge #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> d!61219 (and (bvsle #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6186 (_keys!6787 thiss!1504)) (size!6186 lt!126026)))))

(assert (=> d!61219 (= (arrayCountValidKeys!0 lt!126026 #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) lt!126118)))

(assert (= (and d!61219 c!42356) b!251619))

(assert (= (and d!61219 (not c!42356)) b!251621))

(assert (= (and b!251621 c!42355) b!251618))

(assert (= (and b!251621 (not c!42355)) b!251620))

(assert (= (or b!251618 b!251620) bm!23657))

(assert (=> b!251621 m!268013))

(assert (=> b!251621 m!268013))

(assert (=> b!251621 m!268015))

(declare-fun m!268023 () Bool)

(assert (=> bm!23657 m!268023))

(assert (=> b!251405 d!61219))

(declare-fun d!61221 () Bool)

(declare-fun e!163175 () Bool)

(assert (=> d!61221 e!163175))

(declare-fun res!123181 () Bool)

(assert (=> d!61221 (=> (not res!123181) (not e!163175))))

(assert (=> d!61221 (= res!123181 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6186 (_keys!6787 thiss!1504)))))))

(declare-fun lt!126121 () Unit!7750)

(declare-fun choose!41 (array!12319 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3648) Unit!7750)

(assert (=> d!61221 (= lt!126121 (choose!41 (_keys!6787 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3645))))

(assert (=> d!61221 (bvslt (size!6186 (_keys!6787 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61221 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6787 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3645) lt!126121)))

(declare-fun b!251624 () Bool)

(assert (=> b!251624 (= e!163175 (arrayNoDuplicates!0 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) #b00000000000000000000000000000000 Nil!3645))))

(assert (= (and d!61221 res!123181) b!251624))

(declare-fun m!268025 () Bool)

(assert (=> d!61221 m!268025))

(assert (=> b!251624 m!267847))

(declare-fun m!268027 () Bool)

(assert (=> b!251624 m!268027))

(assert (=> b!251405 d!61221))

(declare-fun d!61223 () Bool)

(declare-fun res!123190 () Bool)

(declare-fun e!163186 () Bool)

(assert (=> d!61223 (=> res!123190 e!163186)))

(assert (=> d!61223 (= res!123190 (bvsge #b00000000000000000000000000000000 (size!6186 lt!126026)))))

(assert (=> d!61223 (= (arrayNoDuplicates!0 lt!126026 #b00000000000000000000000000000000 Nil!3645) e!163186)))

(declare-fun b!251635 () Bool)

(declare-fun e!163187 () Bool)

(declare-fun call!23663 () Bool)

(assert (=> b!251635 (= e!163187 call!23663)))

(declare-fun bm!23660 () Bool)

(declare-fun c!42359 () Bool)

(assert (=> bm!23660 (= call!23663 (arrayNoDuplicates!0 lt!126026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42359 (Cons!3644 (select (arr!5840 lt!126026) #b00000000000000000000000000000000) Nil!3645) Nil!3645)))))

(declare-fun b!251636 () Bool)

(declare-fun e!163185 () Bool)

(assert (=> b!251636 (= e!163185 e!163187)))

(assert (=> b!251636 (= c!42359 (validKeyInArray!0 (select (arr!5840 lt!126026) #b00000000000000000000000000000000)))))

(declare-fun b!251637 () Bool)

(assert (=> b!251637 (= e!163186 e!163185)))

(declare-fun res!123189 () Bool)

(assert (=> b!251637 (=> (not res!123189) (not e!163185))))

(declare-fun e!163184 () Bool)

(assert (=> b!251637 (= res!123189 (not e!163184))))

(declare-fun res!123188 () Bool)

(assert (=> b!251637 (=> (not res!123188) (not e!163184))))

(assert (=> b!251637 (= res!123188 (validKeyInArray!0 (select (arr!5840 lt!126026) #b00000000000000000000000000000000)))))

(declare-fun b!251638 () Bool)

(declare-fun contains!1799 (List!3648 (_ BitVec 64)) Bool)

(assert (=> b!251638 (= e!163184 (contains!1799 Nil!3645 (select (arr!5840 lt!126026) #b00000000000000000000000000000000)))))

(declare-fun b!251639 () Bool)

(assert (=> b!251639 (= e!163187 call!23663)))

(assert (= (and d!61223 (not res!123190)) b!251637))

(assert (= (and b!251637 res!123188) b!251638))

(assert (= (and b!251637 res!123189) b!251636))

(assert (= (and b!251636 c!42359) b!251635))

(assert (= (and b!251636 (not c!42359)) b!251639))

(assert (= (or b!251635 b!251639) bm!23660))

(assert (=> bm!23660 m!268013))

(declare-fun m!268029 () Bool)

(assert (=> bm!23660 m!268029))

(assert (=> b!251636 m!268013))

(assert (=> b!251636 m!268013))

(assert (=> b!251636 m!268015))

(assert (=> b!251637 m!268013))

(assert (=> b!251637 m!268013))

(assert (=> b!251637 m!268015))

(assert (=> b!251638 m!268013))

(assert (=> b!251638 m!268013))

(declare-fun m!268031 () Bool)

(assert (=> b!251638 m!268031))

(assert (=> b!251405 d!61223))

(declare-fun d!61225 () Bool)

(declare-fun res!123195 () Bool)

(declare-fun e!163192 () Bool)

(assert (=> d!61225 (=> res!123195 e!163192)))

(assert (=> d!61225 (= res!123195 (= (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61225 (= (arrayContainsKey!0 (_keys!6787 thiss!1504) key!932 #b00000000000000000000000000000000) e!163192)))

(declare-fun b!251644 () Bool)

(declare-fun e!163193 () Bool)

(assert (=> b!251644 (= e!163192 e!163193)))

(declare-fun res!123196 () Bool)

(assert (=> b!251644 (=> (not res!123196) (not e!163193))))

(assert (=> b!251644 (= res!123196 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251645 () Bool)

(assert (=> b!251645 (= e!163193 (arrayContainsKey!0 (_keys!6787 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61225 (not res!123195)) b!251644))

(assert (= (and b!251644 res!123196) b!251645))

(assert (=> d!61225 m!268005))

(declare-fun m!268033 () Bool)

(assert (=> b!251645 m!268033))

(assert (=> b!251405 d!61225))

(declare-fun d!61227 () Bool)

(declare-fun e!163196 () Bool)

(assert (=> d!61227 e!163196))

(declare-fun res!123199 () Bool)

(assert (=> d!61227 (=> (not res!123199) (not e!163196))))

(assert (=> d!61227 (= res!123199 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6186 (_keys!6787 thiss!1504)))))))

(declare-fun lt!126124 () Unit!7750)

(declare-fun choose!102 ((_ BitVec 64) array!12319 (_ BitVec 32) (_ BitVec 32)) Unit!7750)

(assert (=> d!61227 (= lt!126124 (choose!102 key!932 (_keys!6787 thiss!1504) index!297 (mask!10846 thiss!1504)))))

(assert (=> d!61227 (validMask!0 (mask!10846 thiss!1504))))

(assert (=> d!61227 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6787 thiss!1504) index!297 (mask!10846 thiss!1504)) lt!126124)))

(declare-fun b!251648 () Bool)

(assert (=> b!251648 (= e!163196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) (mask!10846 thiss!1504)))))

(assert (= (and d!61227 res!123199) b!251648))

(declare-fun m!268035 () Bool)

(assert (=> d!61227 m!268035))

(assert (=> d!61227 m!267837))

(assert (=> b!251648 m!267847))

(declare-fun m!268037 () Bool)

(assert (=> b!251648 m!268037))

(assert (=> b!251405 d!61227))

(declare-fun d!61229 () Bool)

(declare-fun res!123206 () Bool)

(declare-fun e!163199 () Bool)

(assert (=> d!61229 (=> (not res!123206) (not e!163199))))

(declare-fun simpleValid!265 (LongMapFixedSize!3712) Bool)

(assert (=> d!61229 (= res!123206 (simpleValid!265 thiss!1504))))

(assert (=> d!61229 (= (valid!1459 thiss!1504) e!163199)))

(declare-fun b!251655 () Bool)

(declare-fun res!123207 () Bool)

(assert (=> b!251655 (=> (not res!123207) (not e!163199))))

(assert (=> b!251655 (= res!123207 (= (arrayCountValidKeys!0 (_keys!6787 thiss!1504) #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) (_size!1905 thiss!1504)))))

(declare-fun b!251656 () Bool)

(declare-fun res!123208 () Bool)

(assert (=> b!251656 (=> (not res!123208) (not e!163199))))

(assert (=> b!251656 (= res!123208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(declare-fun b!251657 () Bool)

(assert (=> b!251657 (= e!163199 (arrayNoDuplicates!0 (_keys!6787 thiss!1504) #b00000000000000000000000000000000 Nil!3645))))

(assert (= (and d!61229 res!123206) b!251655))

(assert (= (and b!251655 res!123207) b!251656))

(assert (= (and b!251656 res!123208) b!251657))

(declare-fun m!268039 () Bool)

(assert (=> d!61229 m!268039))

(assert (=> b!251655 m!267849))

(declare-fun m!268041 () Bool)

(assert (=> b!251656 m!268041))

(declare-fun m!268043 () Bool)

(assert (=> b!251657 m!268043))

(assert (=> start!24012 d!61229))

(declare-fun d!61231 () Bool)

(assert (=> d!61231 (= (inRange!0 (ite c!42306 (index!6534 lt!126024) (index!6537 lt!126024)) (mask!10846 thiss!1504)) (and (bvsge (ite c!42306 (index!6534 lt!126024) (index!6537 lt!126024)) #b00000000000000000000000000000000) (bvslt (ite c!42306 (index!6534 lt!126024) (index!6537 lt!126024)) (bvadd (mask!10846 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23631 d!61231))

(assert (=> bm!23632 d!61225))

(declare-fun d!61233 () Bool)

(declare-fun e!163202 () Bool)

(assert (=> d!61233 e!163202))

(declare-fun res!123214 () Bool)

(assert (=> d!61233 (=> (not res!123214) (not e!163202))))

(declare-fun lt!126130 () SeekEntryResult!1091)

(assert (=> d!61233 (= res!123214 ((_ is Found!1091) lt!126130))))

(assert (=> d!61233 (= lt!126130 (seekEntryOrOpen!0 key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(declare-fun lt!126129 () Unit!7750)

(declare-fun choose!1202 (array!12319 array!12317 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) Int) Unit!7750)

(assert (=> d!61233 (= lt!126129 (choose!1202 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)))))

(assert (=> d!61233 (validMask!0 (mask!10846 thiss!1504))))

(assert (=> d!61233 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!395 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)) lt!126129)))

(declare-fun b!251662 () Bool)

(declare-fun res!123213 () Bool)

(assert (=> b!251662 (=> (not res!123213) (not e!163202))))

(assert (=> b!251662 (= res!123213 (inRange!0 (index!6535 lt!126130) (mask!10846 thiss!1504)))))

(declare-fun b!251663 () Bool)

(assert (=> b!251663 (= e!163202 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6535 lt!126130)) key!932))))

(assert (=> b!251663 (and (bvsge (index!6535 lt!126130) #b00000000000000000000000000000000) (bvslt (index!6535 lt!126130) (size!6186 (_keys!6787 thiss!1504))))))

(assert (= (and d!61233 res!123214) b!251662))

(assert (= (and b!251662 res!123213) b!251663))

(assert (=> d!61233 m!267833))

(declare-fun m!268045 () Bool)

(assert (=> d!61233 m!268045))

(assert (=> d!61233 m!267837))

(declare-fun m!268047 () Bool)

(assert (=> b!251662 m!268047))

(declare-fun m!268049 () Bool)

(assert (=> b!251663 m!268049))

(assert (=> b!251400 d!61233))

(declare-fun d!61235 () Bool)

(assert (=> d!61235 (= (array_inv!3839 (_keys!6787 thiss!1504)) (bvsge (size!6186 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251397 d!61235))

(declare-fun d!61237 () Bool)

(assert (=> d!61237 (= (array_inv!3840 (_values!4628 thiss!1504)) (bvsge (size!6185 (_values!4628 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251397 d!61237))

(declare-fun d!61239 () Bool)

(assert (=> d!61239 (contains!1798 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) key!932)))

(declare-fun lt!126133 () Unit!7750)

(declare-fun choose!1203 (array!12319 array!12317 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 64) (_ BitVec 32) Int) Unit!7750)

(assert (=> d!61239 (= lt!126133 (choose!1203 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(assert (=> d!61239 (validMask!0 (mask!10846 thiss!1504))))

(assert (=> d!61239 (= (lemmaArrayContainsKeyThenInListMap!215 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) lt!126133)))

(declare-fun bs!9026 () Bool)

(assert (= bs!9026 d!61239))

(assert (=> bs!9026 m!267865))

(assert (=> bs!9026 m!267865))

(assert (=> bs!9026 m!267867))

(declare-fun m!268051 () Bool)

(assert (=> bs!9026 m!268051))

(assert (=> bs!9026 m!267837))

(assert (=> b!251396 d!61239))

(declare-fun d!61241 () Bool)

(assert (=> d!61241 (= (inRange!0 index!297 (mask!10846 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10846 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!251404 d!61241))

(declare-fun d!61243 () Bool)

(declare-fun e!163207 () Bool)

(assert (=> d!61243 e!163207))

(declare-fun res!123217 () Bool)

(assert (=> d!61243 (=> res!123217 e!163207)))

(declare-fun lt!126144 () Bool)

(assert (=> d!61243 (= res!123217 (not lt!126144))))

(declare-fun lt!126145 () Bool)

(assert (=> d!61243 (= lt!126144 lt!126145)))

(declare-fun lt!126142 () Unit!7750)

(declare-fun e!163208 () Unit!7750)

(assert (=> d!61243 (= lt!126142 e!163208)))

(declare-fun c!42362 () Bool)

(assert (=> d!61243 (= c!42362 lt!126145)))

(declare-fun containsKey!292 (List!3647 (_ BitVec 64)) Bool)

(assert (=> d!61243 (= lt!126145 (containsKey!292 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(assert (=> d!61243 (= (contains!1798 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) key!932) lt!126144)))

(declare-fun b!251670 () Bool)

(declare-fun lt!126143 () Unit!7750)

(assert (=> b!251670 (= e!163208 lt!126143)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!240 (List!3647 (_ BitVec 64)) Unit!7750)

(assert (=> b!251670 (= lt!126143 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(declare-datatypes ((Option!307 0))(
  ( (Some!306 (v!5366 V!8313)) (None!305) )
))
(declare-fun isDefined!241 (Option!307) Bool)

(declare-fun getValueByKey!301 (List!3647 (_ BitVec 64)) Option!307)

(assert (=> b!251670 (isDefined!241 (getValueByKey!301 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(declare-fun b!251671 () Bool)

(declare-fun Unit!7763 () Unit!7750)

(assert (=> b!251671 (= e!163208 Unit!7763)))

(declare-fun b!251672 () Bool)

(assert (=> b!251672 (= e!163207 (isDefined!241 (getValueByKey!301 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932)))))

(assert (= (and d!61243 c!42362) b!251670))

(assert (= (and d!61243 (not c!42362)) b!251671))

(assert (= (and d!61243 (not res!123217)) b!251672))

(declare-fun m!268053 () Bool)

(assert (=> d!61243 m!268053))

(declare-fun m!268055 () Bool)

(assert (=> b!251670 m!268055))

(declare-fun m!268057 () Bool)

(assert (=> b!251670 m!268057))

(assert (=> b!251670 m!268057))

(declare-fun m!268059 () Bool)

(assert (=> b!251670 m!268059))

(assert (=> b!251672 m!268057))

(assert (=> b!251672 m!268057))

(assert (=> b!251672 m!268059))

(assert (=> b!251404 d!61243))

(declare-fun b!251715 () Bool)

(declare-fun res!123236 () Bool)

(declare-fun e!163238 () Bool)

(assert (=> b!251715 (=> (not res!123236) (not e!163238))))

(declare-fun e!163241 () Bool)

(assert (=> b!251715 (= res!123236 e!163241)))

(declare-fun c!42380 () Bool)

(assert (=> b!251715 (= c!42380 (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!251716 () Bool)

(declare-fun e!163246 () Unit!7750)

(declare-fun lt!126192 () Unit!7750)

(assert (=> b!251716 (= e!163246 lt!126192)))

(declare-fun lt!126209 () ListLongMap!3685)

(declare-fun getCurrentListMapNoExtraKeys!558 (array!12319 array!12317 (_ BitVec 32) (_ BitVec 32) V!8313 V!8313 (_ BitVec 32) Int) ListLongMap!3685)

(assert (=> b!251716 (= lt!126209 (getCurrentListMapNoExtraKeys!558 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(declare-fun lt!126211 () (_ BitVec 64))

(assert (=> b!251716 (= lt!126211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126202 () (_ BitVec 64))

(assert (=> b!251716 (= lt!126202 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126210 () Unit!7750)

(declare-fun addStillContains!218 (ListLongMap!3685 (_ BitVec 64) V!8313 (_ BitVec 64)) Unit!7750)

(assert (=> b!251716 (= lt!126210 (addStillContains!218 lt!126209 lt!126211 (zeroValue!4486 thiss!1504) lt!126202))))

(declare-fun +!669 (ListLongMap!3685 tuple2!4770) ListLongMap!3685)

(assert (=> b!251716 (contains!1798 (+!669 lt!126209 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504))) lt!126202)))

(declare-fun lt!126200 () Unit!7750)

(assert (=> b!251716 (= lt!126200 lt!126210)))

(declare-fun lt!126201 () ListLongMap!3685)

(assert (=> b!251716 (= lt!126201 (getCurrentListMapNoExtraKeys!558 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(declare-fun lt!126199 () (_ BitVec 64))

(assert (=> b!251716 (= lt!126199 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126191 () (_ BitVec 64))

(assert (=> b!251716 (= lt!126191 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126197 () Unit!7750)

(declare-fun addApplyDifferent!218 (ListLongMap!3685 (_ BitVec 64) V!8313 (_ BitVec 64)) Unit!7750)

(assert (=> b!251716 (= lt!126197 (addApplyDifferent!218 lt!126201 lt!126199 (minValue!4486 thiss!1504) lt!126191))))

(declare-fun apply!242 (ListLongMap!3685 (_ BitVec 64)) V!8313)

(assert (=> b!251716 (= (apply!242 (+!669 lt!126201 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504))) lt!126191) (apply!242 lt!126201 lt!126191))))

(declare-fun lt!126198 () Unit!7750)

(assert (=> b!251716 (= lt!126198 lt!126197)))

(declare-fun lt!126196 () ListLongMap!3685)

(assert (=> b!251716 (= lt!126196 (getCurrentListMapNoExtraKeys!558 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(declare-fun lt!126190 () (_ BitVec 64))

(assert (=> b!251716 (= lt!126190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126205 () (_ BitVec 64))

(assert (=> b!251716 (= lt!126205 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126207 () Unit!7750)

(assert (=> b!251716 (= lt!126207 (addApplyDifferent!218 lt!126196 lt!126190 (zeroValue!4486 thiss!1504) lt!126205))))

(assert (=> b!251716 (= (apply!242 (+!669 lt!126196 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504))) lt!126205) (apply!242 lt!126196 lt!126205))))

(declare-fun lt!126195 () Unit!7750)

(assert (=> b!251716 (= lt!126195 lt!126207)))

(declare-fun lt!126204 () ListLongMap!3685)

(assert (=> b!251716 (= lt!126204 (getCurrentListMapNoExtraKeys!558 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(declare-fun lt!126206 () (_ BitVec 64))

(assert (=> b!251716 (= lt!126206 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126203 () (_ BitVec 64))

(assert (=> b!251716 (= lt!126203 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251716 (= lt!126192 (addApplyDifferent!218 lt!126204 lt!126206 (minValue!4486 thiss!1504) lt!126203))))

(assert (=> b!251716 (= (apply!242 (+!669 lt!126204 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504))) lt!126203) (apply!242 lt!126204 lt!126203))))

(declare-fun b!251717 () Bool)

(declare-fun e!163245 () ListLongMap!3685)

(declare-fun call!23684 () ListLongMap!3685)

(assert (=> b!251717 (= e!163245 call!23684)))

(declare-fun b!251718 () Bool)

(declare-fun c!42379 () Bool)

(assert (=> b!251718 (= c!42379 (and (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!163240 () ListLongMap!3685)

(assert (=> b!251718 (= e!163240 e!163245)))

(declare-fun b!251719 () Bool)

(declare-fun e!163239 () Bool)

(assert (=> b!251719 (= e!163239 (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251720 () Bool)

(declare-fun e!163242 () Bool)

(declare-fun e!163235 () Bool)

(assert (=> b!251720 (= e!163242 e!163235)))

(declare-fun res!123244 () Bool)

(assert (=> b!251720 (=> (not res!123244) (not e!163235))))

(declare-fun lt!126208 () ListLongMap!3685)

(assert (=> b!251720 (= res!123244 (contains!1798 lt!126208 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251721 () Bool)

(declare-fun call!23682 () ListLongMap!3685)

(assert (=> b!251721 (= e!163245 call!23682)))

(declare-fun bm!23675 () Bool)

(declare-fun call!23683 () Bool)

(assert (=> bm!23675 (= call!23683 (contains!1798 lt!126208 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23676 () Bool)

(declare-fun call!23680 () ListLongMap!3685)

(assert (=> bm!23676 (= call!23682 call!23680)))

(declare-fun bm!23677 () Bool)

(declare-fun call!23679 () ListLongMap!3685)

(assert (=> bm!23677 (= call!23679 (getCurrentListMapNoExtraKeys!558 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))

(declare-fun bm!23678 () Bool)

(declare-fun call!23681 () ListLongMap!3685)

(assert (=> bm!23678 (= call!23684 call!23681)))

(declare-fun b!251722 () Bool)

(declare-fun e!163237 () Bool)

(assert (=> b!251722 (= e!163241 e!163237)))

(declare-fun res!123241 () Bool)

(declare-fun call!23678 () Bool)

(assert (=> b!251722 (= res!123241 call!23678)))

(assert (=> b!251722 (=> (not res!123241) (not e!163237))))

(declare-fun b!251723 () Bool)

(declare-fun e!163243 () Bool)

(assert (=> b!251723 (= e!163243 (not call!23683))))

(declare-fun c!42377 () Bool)

(declare-fun c!42378 () Bool)

(declare-fun bm!23679 () Bool)

(assert (=> bm!23679 (= call!23681 (+!669 (ite c!42377 call!23679 (ite c!42378 call!23680 call!23682)) (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(declare-fun b!251724 () Bool)

(assert (=> b!251724 (= e!163237 (= (apply!242 lt!126208 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4486 thiss!1504)))))

(declare-fun b!251725 () Bool)

(declare-fun e!163244 () Bool)

(assert (=> b!251725 (= e!163244 (= (apply!242 lt!126208 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4486 thiss!1504)))))

(declare-fun b!251726 () Bool)

(assert (=> b!251726 (= e!163241 (not call!23678))))

(declare-fun b!251727 () Bool)

(declare-fun e!163236 () Bool)

(assert (=> b!251727 (= e!163236 (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251728 () Bool)

(assert (=> b!251728 (= e!163243 e!163244)))

(declare-fun res!123243 () Bool)

(assert (=> b!251728 (= res!123243 call!23683)))

(assert (=> b!251728 (=> (not res!123243) (not e!163244))))

(declare-fun d!61245 () Bool)

(assert (=> d!61245 e!163238))

(declare-fun res!123238 () Bool)

(assert (=> d!61245 (=> (not res!123238) (not e!163238))))

(assert (=> d!61245 (= res!123238 (or (bvsge #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))))

(declare-fun lt!126194 () ListLongMap!3685)

(assert (=> d!61245 (= lt!126208 lt!126194)))

(declare-fun lt!126193 () Unit!7750)

(assert (=> d!61245 (= lt!126193 e!163246)))

(declare-fun c!42375 () Bool)

(assert (=> d!61245 (= c!42375 e!163239)))

(declare-fun res!123242 () Bool)

(assert (=> d!61245 (=> (not res!123242) (not e!163239))))

(assert (=> d!61245 (= res!123242 (bvslt #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun e!163247 () ListLongMap!3685)

(assert (=> d!61245 (= lt!126194 e!163247)))

(assert (=> d!61245 (= c!42377 (and (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61245 (validMask!0 (mask!10846 thiss!1504))))

(assert (=> d!61245 (= (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) lt!126208)))

(declare-fun b!251729 () Bool)

(declare-fun res!123237 () Bool)

(assert (=> b!251729 (=> (not res!123237) (not e!163238))))

(assert (=> b!251729 (= res!123237 e!163242)))

(declare-fun res!123239 () Bool)

(assert (=> b!251729 (=> res!123239 e!163242)))

(assert (=> b!251729 (= res!123239 (not e!163236))))

(declare-fun res!123240 () Bool)

(assert (=> b!251729 (=> (not res!123240) (not e!163236))))

(assert (=> b!251729 (= res!123240 (bvslt #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251730 () Bool)

(assert (=> b!251730 (= e!163240 call!23684)))

(declare-fun bm!23680 () Bool)

(assert (=> bm!23680 (= call!23680 call!23679)))

(declare-fun b!251731 () Bool)

(assert (=> b!251731 (= e!163247 (+!669 call!23681 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))

(declare-fun b!251732 () Bool)

(declare-fun get!3012 (ValueCell!2906 V!8313) V!8313)

(declare-fun dynLambda!585 (Int (_ BitVec 64)) V!8313)

(assert (=> b!251732 (= e!163235 (= (apply!242 lt!126208 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)) (get!3012 (select (arr!5839 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6185 (_values!4628 thiss!1504))))))

(assert (=> b!251732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251733 () Bool)

(declare-fun Unit!7764 () Unit!7750)

(assert (=> b!251733 (= e!163246 Unit!7764)))

(declare-fun b!251734 () Bool)

(assert (=> b!251734 (= e!163238 e!163243)))

(declare-fun c!42376 () Bool)

(assert (=> b!251734 (= c!42376 (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23681 () Bool)

(assert (=> bm!23681 (= call!23678 (contains!1798 lt!126208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251735 () Bool)

(assert (=> b!251735 (= e!163247 e!163240)))

(assert (=> b!251735 (= c!42378 (and (not (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4382 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!61245 c!42377) b!251731))

(assert (= (and d!61245 (not c!42377)) b!251735))

(assert (= (and b!251735 c!42378) b!251730))

(assert (= (and b!251735 (not c!42378)) b!251718))

(assert (= (and b!251718 c!42379) b!251717))

(assert (= (and b!251718 (not c!42379)) b!251721))

(assert (= (or b!251717 b!251721) bm!23676))

(assert (= (or b!251730 bm!23676) bm!23680))

(assert (= (or b!251730 b!251717) bm!23678))

(assert (= (or b!251731 bm!23680) bm!23677))

(assert (= (or b!251731 bm!23678) bm!23679))

(assert (= (and d!61245 res!123242) b!251719))

(assert (= (and d!61245 c!42375) b!251716))

(assert (= (and d!61245 (not c!42375)) b!251733))

(assert (= (and d!61245 res!123238) b!251729))

(assert (= (and b!251729 res!123240) b!251727))

(assert (= (and b!251729 (not res!123239)) b!251720))

(assert (= (and b!251720 res!123244) b!251732))

(assert (= (and b!251729 res!123237) b!251715))

(assert (= (and b!251715 c!42380) b!251722))

(assert (= (and b!251715 (not c!42380)) b!251726))

(assert (= (and b!251722 res!123241) b!251724))

(assert (= (or b!251722 b!251726) bm!23681))

(assert (= (and b!251715 res!123236) b!251734))

(assert (= (and b!251734 c!42376) b!251728))

(assert (= (and b!251734 (not c!42376)) b!251723))

(assert (= (and b!251728 res!123243) b!251725))

(assert (= (or b!251728 b!251723) bm!23675))

(declare-fun b_lambda!8125 () Bool)

(assert (=> (not b_lambda!8125) (not b!251732)))

(declare-fun t!8680 () Bool)

(declare-fun tb!2989 () Bool)

(assert (=> (and b!251397 (= (defaultEntry!4645 thiss!1504) (defaultEntry!4645 thiss!1504)) t!8680) tb!2989))

(declare-fun result!5305 () Bool)

(assert (=> tb!2989 (= result!5305 tp_is_empty!6499)))

(assert (=> b!251732 t!8680))

(declare-fun b_and!13685 () Bool)

(assert (= b_and!13679 (and (=> t!8680 result!5305) b_and!13685)))

(declare-fun m!268061 () Bool)

(assert (=> b!251725 m!268061))

(assert (=> d!61245 m!267837))

(assert (=> b!251727 m!268005))

(assert (=> b!251727 m!268005))

(assert (=> b!251727 m!268007))

(declare-fun m!268063 () Bool)

(assert (=> b!251731 m!268063))

(assert (=> b!251719 m!268005))

(assert (=> b!251719 m!268005))

(assert (=> b!251719 m!268007))

(declare-fun m!268065 () Bool)

(assert (=> bm!23681 m!268065))

(declare-fun m!268067 () Bool)

(assert (=> bm!23679 m!268067))

(declare-fun m!268069 () Bool)

(assert (=> bm!23677 m!268069))

(declare-fun m!268071 () Bool)

(assert (=> b!251724 m!268071))

(declare-fun m!268073 () Bool)

(assert (=> b!251732 m!268073))

(declare-fun m!268075 () Bool)

(assert (=> b!251732 m!268075))

(declare-fun m!268077 () Bool)

(assert (=> b!251732 m!268077))

(assert (=> b!251732 m!268005))

(assert (=> b!251732 m!268005))

(declare-fun m!268079 () Bool)

(assert (=> b!251732 m!268079))

(assert (=> b!251732 m!268073))

(assert (=> b!251732 m!268075))

(declare-fun m!268081 () Bool)

(assert (=> b!251716 m!268081))

(declare-fun m!268083 () Bool)

(assert (=> b!251716 m!268083))

(declare-fun m!268085 () Bool)

(assert (=> b!251716 m!268085))

(declare-fun m!268087 () Bool)

(assert (=> b!251716 m!268087))

(declare-fun m!268089 () Bool)

(assert (=> b!251716 m!268089))

(declare-fun m!268091 () Bool)

(assert (=> b!251716 m!268091))

(declare-fun m!268093 () Bool)

(assert (=> b!251716 m!268093))

(declare-fun m!268095 () Bool)

(assert (=> b!251716 m!268095))

(assert (=> b!251716 m!268085))

(assert (=> b!251716 m!268091))

(declare-fun m!268097 () Bool)

(assert (=> b!251716 m!268097))

(assert (=> b!251716 m!268081))

(declare-fun m!268099 () Bool)

(assert (=> b!251716 m!268099))

(declare-fun m!268101 () Bool)

(assert (=> b!251716 m!268101))

(declare-fun m!268103 () Bool)

(assert (=> b!251716 m!268103))

(declare-fun m!268105 () Bool)

(assert (=> b!251716 m!268105))

(declare-fun m!268107 () Bool)

(assert (=> b!251716 m!268107))

(assert (=> b!251716 m!268005))

(assert (=> b!251716 m!268103))

(assert (=> b!251716 m!268069))

(declare-fun m!268109 () Bool)

(assert (=> b!251716 m!268109))

(assert (=> b!251720 m!268005))

(assert (=> b!251720 m!268005))

(declare-fun m!268111 () Bool)

(assert (=> b!251720 m!268111))

(declare-fun m!268113 () Bool)

(assert (=> bm!23675 m!268113))

(assert (=> b!251404 d!61245))

(declare-fun b!251745 () Bool)

(declare-fun e!163252 () Bool)

(assert (=> b!251745 (= e!163252 tp_is_empty!6499)))

(declare-fun mapIsEmpty!11057 () Bool)

(declare-fun mapRes!11057 () Bool)

(assert (=> mapIsEmpty!11057 mapRes!11057))

(declare-fun mapNonEmpty!11057 () Bool)

(declare-fun tp!23198 () Bool)

(declare-fun e!163253 () Bool)

(assert (=> mapNonEmpty!11057 (= mapRes!11057 (and tp!23198 e!163253))))

(declare-fun mapKey!11057 () (_ BitVec 32))

(declare-fun mapRest!11057 () (Array (_ BitVec 32) ValueCell!2906))

(declare-fun mapValue!11057 () ValueCell!2906)

(assert (=> mapNonEmpty!11057 (= mapRest!11048 (store mapRest!11057 mapKey!11057 mapValue!11057))))

(declare-fun b!251744 () Bool)

(assert (=> b!251744 (= e!163253 tp_is_empty!6499)))

(declare-fun condMapEmpty!11057 () Bool)

(declare-fun mapDefault!11057 () ValueCell!2906)

(assert (=> mapNonEmpty!11048 (= condMapEmpty!11057 (= mapRest!11048 ((as const (Array (_ BitVec 32) ValueCell!2906)) mapDefault!11057)))))

(assert (=> mapNonEmpty!11048 (= tp!23182 (and e!163252 mapRes!11057))))

(assert (= (and mapNonEmpty!11048 condMapEmpty!11057) mapIsEmpty!11057))

(assert (= (and mapNonEmpty!11048 (not condMapEmpty!11057)) mapNonEmpty!11057))

(assert (= (and mapNonEmpty!11057 ((_ is ValueCellFull!2906) mapValue!11057)) b!251744))

(assert (= (and mapNonEmpty!11048 ((_ is ValueCellFull!2906) mapDefault!11057)) b!251745))

(declare-fun m!268115 () Bool)

(assert (=> mapNonEmpty!11057 m!268115))

(declare-fun b_lambda!8127 () Bool)

(assert (= b_lambda!8125 (or (and b!251397 b_free!6637) b_lambda!8127)))

(check-sat (not mapNonEmpty!11057) (not b!251672) (not bm!23656) (not b!251719) (not bm!23660) (not d!61227) (not b!251621) (not b!251670) (not b!251656) (not d!61209) (not b!251655) (not b!251732) (not d!61243) (not bm!23677) (not d!61207) (not b!251591) (not b!251637) (not b!251725) b_and!13685 (not d!61221) (not b_lambda!8127) (not b_next!6637) (not b!251579) (not b!251590) (not b!251720) (not d!61245) (not b!251716) (not b!251605) (not bm!23653) (not b!251731) (not b!251648) (not bm!23657) (not bm!23679) (not b!251638) (not b!251662) (not bm!23681) (not b!251724) (not b!251657) (not b!251593) (not d!61229) (not d!61239) (not bm!23675) (not b!251617) (not b!251727) (not bm!23650) (not b!251636) (not d!61233) tp_is_empty!6499 (not b!251624) (not b!251645) (not bm!23649) (not d!61211) (not b!251615))
(check-sat b_and!13685 (not b_next!6637))
(get-model)

(declare-fun d!61247 () Bool)

(assert (=> d!61247 (= (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) index!297)) (and (not (= (select (arr!5840 (_keys!6787 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5840 (_keys!6787 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251590 d!61247))

(declare-fun b!251757 () Bool)

(declare-fun e!163256 () Bool)

(assert (=> b!251757 (= e!163256 (and (bvsge (extraKeys!4382 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4382 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1905 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!251754 () Bool)

(declare-fun res!123255 () Bool)

(assert (=> b!251754 (=> (not res!123255) (not e!163256))))

(assert (=> b!251754 (= res!123255 (and (= (size!6185 (_values!4628 thiss!1504)) (bvadd (mask!10846 thiss!1504) #b00000000000000000000000000000001)) (= (size!6186 (_keys!6787 thiss!1504)) (size!6185 (_values!4628 thiss!1504))) (bvsge (_size!1905 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1905 thiss!1504) (bvadd (mask!10846 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!251756 () Bool)

(declare-fun res!123253 () Bool)

(assert (=> b!251756 (=> (not res!123253) (not e!163256))))

(declare-fun size!6191 (LongMapFixedSize!3712) (_ BitVec 32))

(assert (=> b!251756 (= res!123253 (= (size!6191 thiss!1504) (bvadd (_size!1905 thiss!1504) (bvsdiv (bvadd (extraKeys!4382 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!251755 () Bool)

(declare-fun res!123254 () Bool)

(assert (=> b!251755 (=> (not res!123254) (not e!163256))))

(assert (=> b!251755 (= res!123254 (bvsge (size!6191 thiss!1504) (_size!1905 thiss!1504)))))

(declare-fun d!61249 () Bool)

(declare-fun res!123256 () Bool)

(assert (=> d!61249 (=> (not res!123256) (not e!163256))))

(assert (=> d!61249 (= res!123256 (validMask!0 (mask!10846 thiss!1504)))))

(assert (=> d!61249 (= (simpleValid!265 thiss!1504) e!163256)))

(assert (= (and d!61249 res!123256) b!251754))

(assert (= (and b!251754 res!123255) b!251755))

(assert (= (and b!251755 res!123254) b!251756))

(assert (= (and b!251756 res!123253) b!251757))

(declare-fun m!268117 () Bool)

(assert (=> b!251756 m!268117))

(assert (=> b!251755 m!268117))

(assert (=> d!61249 m!267837))

(assert (=> d!61229 d!61249))

(declare-fun d!61251 () Bool)

(declare-fun get!3013 (Option!307) V!8313)

(assert (=> d!61251 (= (apply!242 lt!126208 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3013 (getValueByKey!301 (toList!1858 lt!126208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9027 () Bool)

(assert (= bs!9027 d!61251))

(declare-fun m!268119 () Bool)

(assert (=> bs!9027 m!268119))

(assert (=> bs!9027 m!268119))

(declare-fun m!268121 () Bool)

(assert (=> bs!9027 m!268121))

(assert (=> b!251724 d!61251))

(declare-fun b!251758 () Bool)

(declare-fun e!163258 () Bool)

(declare-fun call!23685 () Bool)

(assert (=> b!251758 (= e!163258 call!23685)))

(declare-fun bm!23682 () Bool)

(assert (=> bm!23682 (= call!23685 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(declare-fun d!61253 () Bool)

(declare-fun res!123258 () Bool)

(declare-fun e!163259 () Bool)

(assert (=> d!61253 (=> res!123258 e!163259)))

(assert (=> d!61253 (= res!123258 (bvsge #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> d!61253 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)) e!163259)))

(declare-fun b!251759 () Bool)

(assert (=> b!251759 (= e!163259 e!163258)))

(declare-fun c!42381 () Bool)

(assert (=> b!251759 (= c!42381 (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251760 () Bool)

(declare-fun e!163257 () Bool)

(assert (=> b!251760 (= e!163257 call!23685)))

(declare-fun b!251761 () Bool)

(assert (=> b!251761 (= e!163258 e!163257)))

(declare-fun lt!126212 () (_ BitVec 64))

(assert (=> b!251761 (= lt!126212 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126213 () Unit!7750)

(assert (=> b!251761 (= lt!126213 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6787 thiss!1504) lt!126212 #b00000000000000000000000000000000))))

(assert (=> b!251761 (arrayContainsKey!0 (_keys!6787 thiss!1504) lt!126212 #b00000000000000000000000000000000)))

(declare-fun lt!126214 () Unit!7750)

(assert (=> b!251761 (= lt!126214 lt!126213)))

(declare-fun res!123257 () Bool)

(assert (=> b!251761 (= res!123257 (= (seekEntryOrOpen!0 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000) (_keys!6787 thiss!1504) (mask!10846 thiss!1504)) (Found!1091 #b00000000000000000000000000000000)))))

(assert (=> b!251761 (=> (not res!123257) (not e!163257))))

(assert (= (and d!61253 (not res!123258)) b!251759))

(assert (= (and b!251759 c!42381) b!251761))

(assert (= (and b!251759 (not c!42381)) b!251758))

(assert (= (and b!251761 res!123257) b!251760))

(assert (= (or b!251760 b!251758) bm!23682))

(declare-fun m!268123 () Bool)

(assert (=> bm!23682 m!268123))

(assert (=> b!251759 m!268005))

(assert (=> b!251759 m!268005))

(assert (=> b!251759 m!268007))

(assert (=> b!251761 m!268005))

(declare-fun m!268125 () Bool)

(assert (=> b!251761 m!268125))

(declare-fun m!268127 () Bool)

(assert (=> b!251761 m!268127))

(assert (=> b!251761 m!268005))

(declare-fun m!268129 () Bool)

(assert (=> b!251761 m!268129))

(assert (=> b!251656 d!61253))

(declare-fun d!61255 () Bool)

(declare-fun res!123261 () Bool)

(declare-fun e!163262 () Bool)

(assert (=> d!61255 (=> res!123261 e!163262)))

(assert (=> d!61255 (= res!123261 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 lt!126026)))))

(assert (=> d!61255 (= (arrayNoDuplicates!0 lt!126026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42359 (Cons!3644 (select (arr!5840 lt!126026) #b00000000000000000000000000000000) Nil!3645) Nil!3645)) e!163262)))

(declare-fun b!251762 () Bool)

(declare-fun e!163263 () Bool)

(declare-fun call!23686 () Bool)

(assert (=> b!251762 (= e!163263 call!23686)))

(declare-fun c!42382 () Bool)

(declare-fun bm!23683 () Bool)

(assert (=> bm!23683 (= call!23686 (arrayNoDuplicates!0 lt!126026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!42382 (Cons!3644 (select (arr!5840 lt!126026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!42359 (Cons!3644 (select (arr!5840 lt!126026) #b00000000000000000000000000000000) Nil!3645) Nil!3645)) (ite c!42359 (Cons!3644 (select (arr!5840 lt!126026) #b00000000000000000000000000000000) Nil!3645) Nil!3645))))))

(declare-fun b!251763 () Bool)

(declare-fun e!163261 () Bool)

(assert (=> b!251763 (= e!163261 e!163263)))

(assert (=> b!251763 (= c!42382 (validKeyInArray!0 (select (arr!5840 lt!126026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251764 () Bool)

(assert (=> b!251764 (= e!163262 e!163261)))

(declare-fun res!123260 () Bool)

(assert (=> b!251764 (=> (not res!123260) (not e!163261))))

(declare-fun e!163260 () Bool)

(assert (=> b!251764 (= res!123260 (not e!163260))))

(declare-fun res!123259 () Bool)

(assert (=> b!251764 (=> (not res!123259) (not e!163260))))

(assert (=> b!251764 (= res!123259 (validKeyInArray!0 (select (arr!5840 lt!126026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251765 () Bool)

(assert (=> b!251765 (= e!163260 (contains!1799 (ite c!42359 (Cons!3644 (select (arr!5840 lt!126026) #b00000000000000000000000000000000) Nil!3645) Nil!3645) (select (arr!5840 lt!126026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251766 () Bool)

(assert (=> b!251766 (= e!163263 call!23686)))

(assert (= (and d!61255 (not res!123261)) b!251764))

(assert (= (and b!251764 res!123259) b!251765))

(assert (= (and b!251764 res!123260) b!251763))

(assert (= (and b!251763 c!42382) b!251762))

(assert (= (and b!251763 (not c!42382)) b!251766))

(assert (= (or b!251762 b!251766) bm!23683))

(declare-fun m!268131 () Bool)

(assert (=> bm!23683 m!268131))

(declare-fun m!268133 () Bool)

(assert (=> bm!23683 m!268133))

(assert (=> b!251763 m!268131))

(assert (=> b!251763 m!268131))

(declare-fun m!268135 () Bool)

(assert (=> b!251763 m!268135))

(assert (=> b!251764 m!268131))

(assert (=> b!251764 m!268131))

(assert (=> b!251764 m!268135))

(assert (=> b!251765 m!268131))

(assert (=> b!251765 m!268131))

(declare-fun m!268137 () Bool)

(assert (=> b!251765 m!268137))

(assert (=> bm!23660 d!61255))

(declare-fun d!61257 () Bool)

(assert (=> d!61257 (= (validKeyInArray!0 (select (arr!5840 lt!126026) #b00000000000000000000000000000000)) (and (not (= (select (arr!5840 lt!126026) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5840 lt!126026) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251637 d!61257))

(assert (=> d!61233 d!61209))

(declare-fun d!61259 () Bool)

(declare-fun e!163266 () Bool)

(assert (=> d!61259 e!163266))

(declare-fun res!123266 () Bool)

(assert (=> d!61259 (=> (not res!123266) (not e!163266))))

(declare-fun lt!126217 () SeekEntryResult!1091)

(assert (=> d!61259 (= res!123266 ((_ is Found!1091) lt!126217))))

(assert (=> d!61259 (= lt!126217 (seekEntryOrOpen!0 key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(assert (=> d!61259 true))

(declare-fun _$33!171 () Unit!7750)

(assert (=> d!61259 (= (choose!1202 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)) _$33!171)))

(declare-fun b!251771 () Bool)

(declare-fun res!123267 () Bool)

(assert (=> b!251771 (=> (not res!123267) (not e!163266))))

(assert (=> b!251771 (= res!123267 (inRange!0 (index!6535 lt!126217) (mask!10846 thiss!1504)))))

(declare-fun b!251772 () Bool)

(assert (=> b!251772 (= e!163266 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6535 lt!126217)) key!932))))

(assert (= (and d!61259 res!123266) b!251771))

(assert (= (and b!251771 res!123267) b!251772))

(assert (=> d!61259 m!267833))

(declare-fun m!268139 () Bool)

(assert (=> b!251771 m!268139))

(declare-fun m!268141 () Bool)

(assert (=> b!251772 m!268141))

(assert (=> d!61233 d!61259))

(assert (=> d!61233 d!61215))

(declare-fun d!61261 () Bool)

(declare-fun isEmpty!536 (Option!307) Bool)

(assert (=> d!61261 (= (isDefined!241 (getValueByKey!301 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932)) (not (isEmpty!536 (getValueByKey!301 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))))

(declare-fun bs!9028 () Bool)

(assert (= bs!9028 d!61261))

(assert (=> bs!9028 m!268057))

(declare-fun m!268143 () Bool)

(assert (=> bs!9028 m!268143))

(assert (=> b!251672 d!61261))

(declare-fun b!251784 () Bool)

(declare-fun e!163272 () Option!307)

(assert (=> b!251784 (= e!163272 None!305)))

(declare-fun d!61263 () Bool)

(declare-fun c!42387 () Bool)

(assert (=> d!61263 (= c!42387 (and ((_ is Cons!3643) (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) (= (_1!2396 (h!4304 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) key!932)))))

(declare-fun e!163271 () Option!307)

(assert (=> d!61263 (= (getValueByKey!301 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932) e!163271)))

(declare-fun b!251783 () Bool)

(assert (=> b!251783 (= e!163272 (getValueByKey!301 (t!8676 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) key!932))))

(declare-fun b!251782 () Bool)

(assert (=> b!251782 (= e!163271 e!163272)))

(declare-fun c!42388 () Bool)

(assert (=> b!251782 (= c!42388 (and ((_ is Cons!3643) (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) (not (= (_1!2396 (h!4304 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) key!932))))))

(declare-fun b!251781 () Bool)

(assert (=> b!251781 (= e!163271 (Some!306 (_2!2396 (h!4304 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))))))

(assert (= (and d!61263 c!42387) b!251781))

(assert (= (and d!61263 (not c!42387)) b!251782))

(assert (= (and b!251782 c!42388) b!251783))

(assert (= (and b!251782 (not c!42388)) b!251784))

(declare-fun m!268145 () Bool)

(assert (=> b!251783 m!268145))

(assert (=> b!251672 d!61263))

(declare-fun d!61265 () Bool)

(assert (=> d!61265 (arrayNoDuplicates!0 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) #b00000000000000000000000000000000 Nil!3645)))

(assert (=> d!61265 true))

(declare-fun _$65!83 () Unit!7750)

(assert (=> d!61265 (= (choose!41 (_keys!6787 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3645) _$65!83)))

(declare-fun bs!9029 () Bool)

(assert (= bs!9029 d!61265))

(assert (=> bs!9029 m!267847))

(assert (=> bs!9029 m!268027))

(assert (=> d!61221 d!61265))

(declare-fun d!61267 () Bool)

(declare-fun lt!126222 () SeekEntryResult!1091)

(assert (=> d!61267 (and (or ((_ is Undefined!1091) lt!126222) (not ((_ is Found!1091) lt!126222)) (and (bvsge (index!6535 lt!126222) #b00000000000000000000000000000000) (bvslt (index!6535 lt!126222) (size!6186 (_keys!6787 thiss!1504))))) (or ((_ is Undefined!1091) lt!126222) ((_ is Found!1091) lt!126222) (not ((_ is MissingVacant!1091) lt!126222)) (not (= (index!6537 lt!126222) (index!6536 lt!126102))) (and (bvsge (index!6537 lt!126222) #b00000000000000000000000000000000) (bvslt (index!6537 lt!126222) (size!6186 (_keys!6787 thiss!1504))))) (or ((_ is Undefined!1091) lt!126222) (ite ((_ is Found!1091) lt!126222) (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6535 lt!126222)) key!932) (and ((_ is MissingVacant!1091) lt!126222) (= (index!6537 lt!126222) (index!6536 lt!126102)) (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6537 lt!126222)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!163279 () SeekEntryResult!1091)

(assert (=> d!61267 (= lt!126222 e!163279)))

(declare-fun c!42396 () Bool)

(assert (=> d!61267 (= c!42396 (bvsge (x!24685 lt!126102) #b01111111111111111111111111111110))))

(declare-fun lt!126223 () (_ BitVec 64))

(assert (=> d!61267 (= lt!126223 (select (arr!5840 (_keys!6787 thiss!1504)) (index!6536 lt!126102)))))

(assert (=> d!61267 (validMask!0 (mask!10846 thiss!1504))))

(assert (=> d!61267 (= (seekKeyOrZeroReturnVacant!0 (x!24685 lt!126102) (index!6536 lt!126102) (index!6536 lt!126102) key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)) lt!126222)))

(declare-fun b!251797 () Bool)

(declare-fun e!163281 () SeekEntryResult!1091)

(assert (=> b!251797 (= e!163281 (MissingVacant!1091 (index!6536 lt!126102)))))

(declare-fun b!251798 () Bool)

(declare-fun e!163280 () SeekEntryResult!1091)

(assert (=> b!251798 (= e!163279 e!163280)))

(declare-fun c!42397 () Bool)

(assert (=> b!251798 (= c!42397 (= lt!126223 key!932))))

(declare-fun b!251799 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!251799 (= e!163281 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24685 lt!126102) #b00000000000000000000000000000001) (nextIndex!0 (index!6536 lt!126102) (bvadd (x!24685 lt!126102) #b00000000000000000000000000000001) (mask!10846 thiss!1504)) (index!6536 lt!126102) key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(declare-fun b!251800 () Bool)

(declare-fun c!42395 () Bool)

(assert (=> b!251800 (= c!42395 (= lt!126223 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251800 (= e!163280 e!163281)))

(declare-fun b!251801 () Bool)

(assert (=> b!251801 (= e!163279 Undefined!1091)))

(declare-fun b!251802 () Bool)

(assert (=> b!251802 (= e!163280 (Found!1091 (index!6536 lt!126102)))))

(assert (= (and d!61267 c!42396) b!251801))

(assert (= (and d!61267 (not c!42396)) b!251798))

(assert (= (and b!251798 c!42397) b!251802))

(assert (= (and b!251798 (not c!42397)) b!251800))

(assert (= (and b!251800 c!42395) b!251797))

(assert (= (and b!251800 (not c!42395)) b!251799))

(declare-fun m!268147 () Bool)

(assert (=> d!61267 m!268147))

(declare-fun m!268149 () Bool)

(assert (=> d!61267 m!268149))

(assert (=> d!61267 m!267993))

(assert (=> d!61267 m!267837))

(declare-fun m!268151 () Bool)

(assert (=> b!251799 m!268151))

(assert (=> b!251799 m!268151))

(declare-fun m!268153 () Bool)

(assert (=> b!251799 m!268153))

(assert (=> b!251579 d!61267))

(assert (=> b!251621 d!61257))

(declare-fun d!61269 () Bool)

(declare-fun e!163282 () Bool)

(assert (=> d!61269 e!163282))

(declare-fun res!123268 () Bool)

(assert (=> d!61269 (=> res!123268 e!163282)))

(declare-fun lt!126226 () Bool)

(assert (=> d!61269 (= res!123268 (not lt!126226))))

(declare-fun lt!126227 () Bool)

(assert (=> d!61269 (= lt!126226 lt!126227)))

(declare-fun lt!126224 () Unit!7750)

(declare-fun e!163283 () Unit!7750)

(assert (=> d!61269 (= lt!126224 e!163283)))

(declare-fun c!42398 () Bool)

(assert (=> d!61269 (= c!42398 lt!126227)))

(assert (=> d!61269 (= lt!126227 (containsKey!292 (toList!1858 lt!126208) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61269 (= (contains!1798 lt!126208 #b0000000000000000000000000000000000000000000000000000000000000000) lt!126226)))

(declare-fun b!251803 () Bool)

(declare-fun lt!126225 () Unit!7750)

(assert (=> b!251803 (= e!163283 lt!126225)))

(assert (=> b!251803 (= lt!126225 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1858 lt!126208) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251803 (isDefined!241 (getValueByKey!301 (toList!1858 lt!126208) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251804 () Bool)

(declare-fun Unit!7765 () Unit!7750)

(assert (=> b!251804 (= e!163283 Unit!7765)))

(declare-fun b!251805 () Bool)

(assert (=> b!251805 (= e!163282 (isDefined!241 (getValueByKey!301 (toList!1858 lt!126208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61269 c!42398) b!251803))

(assert (= (and d!61269 (not c!42398)) b!251804))

(assert (= (and d!61269 (not res!123268)) b!251805))

(declare-fun m!268155 () Bool)

(assert (=> d!61269 m!268155))

(declare-fun m!268157 () Bool)

(assert (=> b!251803 m!268157))

(assert (=> b!251803 m!268119))

(assert (=> b!251803 m!268119))

(declare-fun m!268159 () Bool)

(assert (=> b!251803 m!268159))

(assert (=> b!251805 m!268119))

(assert (=> b!251805 m!268119))

(assert (=> b!251805 m!268159))

(assert (=> bm!23681 d!61269))

(declare-fun d!61271 () Bool)

(declare-fun e!163284 () Bool)

(assert (=> d!61271 e!163284))

(declare-fun res!123269 () Bool)

(assert (=> d!61271 (=> res!123269 e!163284)))

(declare-fun lt!126230 () Bool)

(assert (=> d!61271 (= res!123269 (not lt!126230))))

(declare-fun lt!126231 () Bool)

(assert (=> d!61271 (= lt!126230 lt!126231)))

(declare-fun lt!126228 () Unit!7750)

(declare-fun e!163285 () Unit!7750)

(assert (=> d!61271 (= lt!126228 e!163285)))

(declare-fun c!42399 () Bool)

(assert (=> d!61271 (= c!42399 lt!126231)))

(assert (=> d!61271 (= lt!126231 (containsKey!292 (toList!1858 lt!126208) (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61271 (= (contains!1798 lt!126208 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)) lt!126230)))

(declare-fun b!251806 () Bool)

(declare-fun lt!126229 () Unit!7750)

(assert (=> b!251806 (= e!163285 lt!126229)))

(assert (=> b!251806 (= lt!126229 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1858 lt!126208) (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251806 (isDefined!241 (getValueByKey!301 (toList!1858 lt!126208) (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251807 () Bool)

(declare-fun Unit!7766 () Unit!7750)

(assert (=> b!251807 (= e!163285 Unit!7766)))

(declare-fun b!251808 () Bool)

(assert (=> b!251808 (= e!163284 (isDefined!241 (getValueByKey!301 (toList!1858 lt!126208) (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!61271 c!42399) b!251806))

(assert (= (and d!61271 (not c!42399)) b!251807))

(assert (= (and d!61271 (not res!123269)) b!251808))

(assert (=> d!61271 m!268005))

(declare-fun m!268161 () Bool)

(assert (=> d!61271 m!268161))

(assert (=> b!251806 m!268005))

(declare-fun m!268163 () Bool)

(assert (=> b!251806 m!268163))

(assert (=> b!251806 m!268005))

(declare-fun m!268165 () Bool)

(assert (=> b!251806 m!268165))

(assert (=> b!251806 m!268165))

(declare-fun m!268167 () Bool)

(assert (=> b!251806 m!268167))

(assert (=> b!251808 m!268005))

(assert (=> b!251808 m!268165))

(assert (=> b!251808 m!268165))

(assert (=> b!251808 m!268167))

(assert (=> b!251720 d!61271))

(declare-fun d!61273 () Bool)

(declare-fun res!123270 () Bool)

(declare-fun e!163286 () Bool)

(assert (=> d!61273 (=> res!123270 e!163286)))

(assert (=> d!61273 (= res!123270 (= (select (arr!5840 (_keys!6787 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!61273 (= (arrayContainsKey!0 (_keys!6787 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!163286)))

(declare-fun b!251809 () Bool)

(declare-fun e!163287 () Bool)

(assert (=> b!251809 (= e!163286 e!163287)))

(declare-fun res!123271 () Bool)

(assert (=> b!251809 (=> (not res!123271) (not e!163287))))

(assert (=> b!251809 (= res!123271 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251810 () Bool)

(assert (=> b!251810 (= e!163287 (arrayContainsKey!0 (_keys!6787 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!61273 (not res!123270)) b!251809))

(assert (= (and b!251809 res!123271) b!251810))

(declare-fun m!268169 () Bool)

(assert (=> d!61273 m!268169))

(declare-fun m!268171 () Bool)

(assert (=> b!251810 m!268171))

(assert (=> b!251645 d!61273))

(assert (=> d!61245 d!61215))

(declare-fun d!61275 () Bool)

(assert (=> d!61275 (= (inRange!0 (ite c!42336 (index!6534 lt!126092) (index!6537 lt!126092)) (mask!10846 thiss!1504)) (and (bvsge (ite c!42336 (index!6534 lt!126092) (index!6537 lt!126092)) #b00000000000000000000000000000000) (bvslt (ite c!42336 (index!6534 lt!126092) (index!6537 lt!126092)) (bvadd (mask!10846 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23649 d!61275))

(declare-fun b!251811 () Bool)

(declare-fun e!163289 () Bool)

(declare-fun call!23687 () Bool)

(assert (=> b!251811 (= e!163289 call!23687)))

(declare-fun bm!23684 () Bool)

(assert (=> bm!23684 (= call!23687 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!126026 (mask!10846 thiss!1504)))))

(declare-fun d!61277 () Bool)

(declare-fun res!123273 () Bool)

(declare-fun e!163290 () Bool)

(assert (=> d!61277 (=> res!123273 e!163290)))

(assert (=> d!61277 (= res!123273 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 lt!126026)))))

(assert (=> d!61277 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126026 (mask!10846 thiss!1504)) e!163290)))

(declare-fun b!251812 () Bool)

(assert (=> b!251812 (= e!163290 e!163289)))

(declare-fun c!42400 () Bool)

(assert (=> b!251812 (= c!42400 (validKeyInArray!0 (select (arr!5840 lt!126026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!251813 () Bool)

(declare-fun e!163288 () Bool)

(assert (=> b!251813 (= e!163288 call!23687)))

(declare-fun b!251814 () Bool)

(assert (=> b!251814 (= e!163289 e!163288)))

(declare-fun lt!126232 () (_ BitVec 64))

(assert (=> b!251814 (= lt!126232 (select (arr!5840 lt!126026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!126233 () Unit!7750)

(assert (=> b!251814 (= lt!126233 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126026 lt!126232 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!251814 (arrayContainsKey!0 lt!126026 lt!126232 #b00000000000000000000000000000000)))

(declare-fun lt!126234 () Unit!7750)

(assert (=> b!251814 (= lt!126234 lt!126233)))

(declare-fun res!123272 () Bool)

(assert (=> b!251814 (= res!123272 (= (seekEntryOrOpen!0 (select (arr!5840 lt!126026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!126026 (mask!10846 thiss!1504)) (Found!1091 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!251814 (=> (not res!123272) (not e!163288))))

(assert (= (and d!61277 (not res!123273)) b!251812))

(assert (= (and b!251812 c!42400) b!251814))

(assert (= (and b!251812 (not c!42400)) b!251811))

(assert (= (and b!251814 res!123272) b!251813))

(assert (= (or b!251813 b!251811) bm!23684))

(declare-fun m!268173 () Bool)

(assert (=> bm!23684 m!268173))

(assert (=> b!251812 m!268131))

(assert (=> b!251812 m!268131))

(assert (=> b!251812 m!268135))

(assert (=> b!251814 m!268131))

(declare-fun m!268175 () Bool)

(assert (=> b!251814 m!268175))

(declare-fun m!268177 () Bool)

(assert (=> b!251814 m!268177))

(assert (=> b!251814 m!268131))

(declare-fun m!268179 () Bool)

(assert (=> b!251814 m!268179))

(assert (=> bm!23656 d!61277))

(declare-fun d!61279 () Bool)

(assert (=> d!61279 (= (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251605 d!61279))

(declare-fun d!61281 () Bool)

(declare-fun e!163293 () Bool)

(assert (=> d!61281 e!163293))

(declare-fun res!123278 () Bool)

(assert (=> d!61281 (=> (not res!123278) (not e!163293))))

(declare-fun lt!126243 () ListLongMap!3685)

(assert (=> d!61281 (= res!123278 (contains!1798 lt!126243 (_1!2396 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(declare-fun lt!126245 () List!3647)

(assert (=> d!61281 (= lt!126243 (ListLongMap!3686 lt!126245))))

(declare-fun lt!126244 () Unit!7750)

(declare-fun lt!126246 () Unit!7750)

(assert (=> d!61281 (= lt!126244 lt!126246)))

(assert (=> d!61281 (= (getValueByKey!301 lt!126245 (_1!2396 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))) (Some!306 (_2!2396 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!161 (List!3647 (_ BitVec 64) V!8313) Unit!7750)

(assert (=> d!61281 (= lt!126246 (lemmaContainsTupThenGetReturnValue!161 lt!126245 (_1!2396 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))) (_2!2396 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(declare-fun insertStrictlySorted!164 (List!3647 (_ BitVec 64) V!8313) List!3647)

(assert (=> d!61281 (= lt!126245 (insertStrictlySorted!164 (toList!1858 call!23681) (_1!2396 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))) (_2!2396 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(assert (=> d!61281 (= (+!669 call!23681 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))) lt!126243)))

(declare-fun b!251819 () Bool)

(declare-fun res!123279 () Bool)

(assert (=> b!251819 (=> (not res!123279) (not e!163293))))

(assert (=> b!251819 (= res!123279 (= (getValueByKey!301 (toList!1858 lt!126243) (_1!2396 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))) (Some!306 (_2!2396 (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))))

(declare-fun b!251820 () Bool)

(declare-fun contains!1800 (List!3647 tuple2!4770) Bool)

(assert (=> b!251820 (= e!163293 (contains!1800 (toList!1858 lt!126243) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))

(assert (= (and d!61281 res!123278) b!251819))

(assert (= (and b!251819 res!123279) b!251820))

(declare-fun m!268181 () Bool)

(assert (=> d!61281 m!268181))

(declare-fun m!268183 () Bool)

(assert (=> d!61281 m!268183))

(declare-fun m!268185 () Bool)

(assert (=> d!61281 m!268185))

(declare-fun m!268187 () Bool)

(assert (=> d!61281 m!268187))

(declare-fun m!268189 () Bool)

(assert (=> b!251819 m!268189))

(declare-fun m!268191 () Bool)

(assert (=> b!251820 m!268191))

(assert (=> b!251731 d!61281))

(assert (=> bm!23650 d!61225))

(declare-fun d!61283 () Bool)

(assert (=> d!61283 (= (apply!242 (+!669 lt!126204 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504))) lt!126203) (get!3013 (getValueByKey!301 (toList!1858 (+!669 lt!126204 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504)))) lt!126203)))))

(declare-fun bs!9030 () Bool)

(assert (= bs!9030 d!61283))

(declare-fun m!268193 () Bool)

(assert (=> bs!9030 m!268193))

(assert (=> bs!9030 m!268193))

(declare-fun m!268195 () Bool)

(assert (=> bs!9030 m!268195))

(assert (=> b!251716 d!61283))

(declare-fun d!61285 () Bool)

(declare-fun e!163294 () Bool)

(assert (=> d!61285 e!163294))

(declare-fun res!123280 () Bool)

(assert (=> d!61285 (=> (not res!123280) (not e!163294))))

(declare-fun lt!126247 () ListLongMap!3685)

(assert (=> d!61285 (= res!123280 (contains!1798 lt!126247 (_1!2396 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504)))))))

(declare-fun lt!126249 () List!3647)

(assert (=> d!61285 (= lt!126247 (ListLongMap!3686 lt!126249))))

(declare-fun lt!126248 () Unit!7750)

(declare-fun lt!126250 () Unit!7750)

(assert (=> d!61285 (= lt!126248 lt!126250)))

(assert (=> d!61285 (= (getValueByKey!301 lt!126249 (_1!2396 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504)))) (Some!306 (_2!2396 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504)))))))

(assert (=> d!61285 (= lt!126250 (lemmaContainsTupThenGetReturnValue!161 lt!126249 (_1!2396 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504))) (_2!2396 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504)))))))

(assert (=> d!61285 (= lt!126249 (insertStrictlySorted!164 (toList!1858 lt!126204) (_1!2396 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504))) (_2!2396 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504)))))))

(assert (=> d!61285 (= (+!669 lt!126204 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504))) lt!126247)))

(declare-fun b!251821 () Bool)

(declare-fun res!123281 () Bool)

(assert (=> b!251821 (=> (not res!123281) (not e!163294))))

(assert (=> b!251821 (= res!123281 (= (getValueByKey!301 (toList!1858 lt!126247) (_1!2396 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504)))) (Some!306 (_2!2396 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504))))))))

(declare-fun b!251822 () Bool)

(assert (=> b!251822 (= e!163294 (contains!1800 (toList!1858 lt!126247) (tuple2!4771 lt!126206 (minValue!4486 thiss!1504))))))

(assert (= (and d!61285 res!123280) b!251821))

(assert (= (and b!251821 res!123281) b!251822))

(declare-fun m!268197 () Bool)

(assert (=> d!61285 m!268197))

(declare-fun m!268199 () Bool)

(assert (=> d!61285 m!268199))

(declare-fun m!268201 () Bool)

(assert (=> d!61285 m!268201))

(declare-fun m!268203 () Bool)

(assert (=> d!61285 m!268203))

(declare-fun m!268205 () Bool)

(assert (=> b!251821 m!268205))

(declare-fun m!268207 () Bool)

(assert (=> b!251822 m!268207))

(assert (=> b!251716 d!61285))

(declare-fun d!61287 () Bool)

(assert (=> d!61287 (contains!1798 (+!669 lt!126209 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504))) lt!126202)))

(declare-fun lt!126253 () Unit!7750)

(declare-fun choose!1204 (ListLongMap!3685 (_ BitVec 64) V!8313 (_ BitVec 64)) Unit!7750)

(assert (=> d!61287 (= lt!126253 (choose!1204 lt!126209 lt!126211 (zeroValue!4486 thiss!1504) lt!126202))))

(assert (=> d!61287 (contains!1798 lt!126209 lt!126202)))

(assert (=> d!61287 (= (addStillContains!218 lt!126209 lt!126211 (zeroValue!4486 thiss!1504) lt!126202) lt!126253)))

(declare-fun bs!9031 () Bool)

(assert (= bs!9031 d!61287))

(assert (=> bs!9031 m!268103))

(assert (=> bs!9031 m!268103))

(assert (=> bs!9031 m!268105))

(declare-fun m!268209 () Bool)

(assert (=> bs!9031 m!268209))

(declare-fun m!268211 () Bool)

(assert (=> bs!9031 m!268211))

(assert (=> b!251716 d!61287))

(declare-fun d!61289 () Bool)

(declare-fun e!163295 () Bool)

(assert (=> d!61289 e!163295))

(declare-fun res!123282 () Bool)

(assert (=> d!61289 (=> (not res!123282) (not e!163295))))

(declare-fun lt!126254 () ListLongMap!3685)

(assert (=> d!61289 (= res!123282 (contains!1798 lt!126254 (_1!2396 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504)))))))

(declare-fun lt!126256 () List!3647)

(assert (=> d!61289 (= lt!126254 (ListLongMap!3686 lt!126256))))

(declare-fun lt!126255 () Unit!7750)

(declare-fun lt!126257 () Unit!7750)

(assert (=> d!61289 (= lt!126255 lt!126257)))

(assert (=> d!61289 (= (getValueByKey!301 lt!126256 (_1!2396 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504)))) (Some!306 (_2!2396 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61289 (= lt!126257 (lemmaContainsTupThenGetReturnValue!161 lt!126256 (_1!2396 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504))) (_2!2396 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61289 (= lt!126256 (insertStrictlySorted!164 (toList!1858 lt!126209) (_1!2396 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504))) (_2!2396 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61289 (= (+!669 lt!126209 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504))) lt!126254)))

(declare-fun b!251824 () Bool)

(declare-fun res!123283 () Bool)

(assert (=> b!251824 (=> (not res!123283) (not e!163295))))

(assert (=> b!251824 (= res!123283 (= (getValueByKey!301 (toList!1858 lt!126254) (_1!2396 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504)))) (Some!306 (_2!2396 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504))))))))

(declare-fun b!251825 () Bool)

(assert (=> b!251825 (= e!163295 (contains!1800 (toList!1858 lt!126254) (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504))))))

(assert (= (and d!61289 res!123282) b!251824))

(assert (= (and b!251824 res!123283) b!251825))

(declare-fun m!268213 () Bool)

(assert (=> d!61289 m!268213))

(declare-fun m!268215 () Bool)

(assert (=> d!61289 m!268215))

(declare-fun m!268217 () Bool)

(assert (=> d!61289 m!268217))

(declare-fun m!268219 () Bool)

(assert (=> d!61289 m!268219))

(declare-fun m!268221 () Bool)

(assert (=> b!251824 m!268221))

(declare-fun m!268223 () Bool)

(assert (=> b!251825 m!268223))

(assert (=> b!251716 d!61289))

(declare-fun d!61291 () Bool)

(assert (=> d!61291 (= (apply!242 lt!126196 lt!126205) (get!3013 (getValueByKey!301 (toList!1858 lt!126196) lt!126205)))))

(declare-fun bs!9032 () Bool)

(assert (= bs!9032 d!61291))

(declare-fun m!268225 () Bool)

(assert (=> bs!9032 m!268225))

(assert (=> bs!9032 m!268225))

(declare-fun m!268227 () Bool)

(assert (=> bs!9032 m!268227))

(assert (=> b!251716 d!61291))

(declare-fun d!61293 () Bool)

(assert (=> d!61293 (= (apply!242 (+!669 lt!126201 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504))) lt!126191) (apply!242 lt!126201 lt!126191))))

(declare-fun lt!126260 () Unit!7750)

(declare-fun choose!1205 (ListLongMap!3685 (_ BitVec 64) V!8313 (_ BitVec 64)) Unit!7750)

(assert (=> d!61293 (= lt!126260 (choose!1205 lt!126201 lt!126199 (minValue!4486 thiss!1504) lt!126191))))

(declare-fun e!163298 () Bool)

(assert (=> d!61293 e!163298))

(declare-fun res!123286 () Bool)

(assert (=> d!61293 (=> (not res!123286) (not e!163298))))

(assert (=> d!61293 (= res!123286 (contains!1798 lt!126201 lt!126191))))

(assert (=> d!61293 (= (addApplyDifferent!218 lt!126201 lt!126199 (minValue!4486 thiss!1504) lt!126191) lt!126260)))

(declare-fun b!251829 () Bool)

(assert (=> b!251829 (= e!163298 (not (= lt!126191 lt!126199)))))

(assert (= (and d!61293 res!123286) b!251829))

(assert (=> d!61293 m!268085))

(assert (=> d!61293 m!268085))

(assert (=> d!61293 m!268087))

(declare-fun m!268229 () Bool)

(assert (=> d!61293 m!268229))

(declare-fun m!268231 () Bool)

(assert (=> d!61293 m!268231))

(assert (=> d!61293 m!268095))

(assert (=> b!251716 d!61293))

(declare-fun d!61295 () Bool)

(declare-fun e!163299 () Bool)

(assert (=> d!61295 e!163299))

(declare-fun res!123287 () Bool)

(assert (=> d!61295 (=> res!123287 e!163299)))

(declare-fun lt!126263 () Bool)

(assert (=> d!61295 (= res!123287 (not lt!126263))))

(declare-fun lt!126264 () Bool)

(assert (=> d!61295 (= lt!126263 lt!126264)))

(declare-fun lt!126261 () Unit!7750)

(declare-fun e!163300 () Unit!7750)

(assert (=> d!61295 (= lt!126261 e!163300)))

(declare-fun c!42401 () Bool)

(assert (=> d!61295 (= c!42401 lt!126264)))

(assert (=> d!61295 (= lt!126264 (containsKey!292 (toList!1858 (+!669 lt!126209 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504)))) lt!126202))))

(assert (=> d!61295 (= (contains!1798 (+!669 lt!126209 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504))) lt!126202) lt!126263)))

(declare-fun b!251830 () Bool)

(declare-fun lt!126262 () Unit!7750)

(assert (=> b!251830 (= e!163300 lt!126262)))

(assert (=> b!251830 (= lt!126262 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1858 (+!669 lt!126209 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504)))) lt!126202))))

(assert (=> b!251830 (isDefined!241 (getValueByKey!301 (toList!1858 (+!669 lt!126209 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504)))) lt!126202))))

(declare-fun b!251831 () Bool)

(declare-fun Unit!7767 () Unit!7750)

(assert (=> b!251831 (= e!163300 Unit!7767)))

(declare-fun b!251832 () Bool)

(assert (=> b!251832 (= e!163299 (isDefined!241 (getValueByKey!301 (toList!1858 (+!669 lt!126209 (tuple2!4771 lt!126211 (zeroValue!4486 thiss!1504)))) lt!126202)))))

(assert (= (and d!61295 c!42401) b!251830))

(assert (= (and d!61295 (not c!42401)) b!251831))

(assert (= (and d!61295 (not res!123287)) b!251832))

(declare-fun m!268233 () Bool)

(assert (=> d!61295 m!268233))

(declare-fun m!268235 () Bool)

(assert (=> b!251830 m!268235))

(declare-fun m!268237 () Bool)

(assert (=> b!251830 m!268237))

(assert (=> b!251830 m!268237))

(declare-fun m!268239 () Bool)

(assert (=> b!251830 m!268239))

(assert (=> b!251832 m!268237))

(assert (=> b!251832 m!268237))

(assert (=> b!251832 m!268239))

(assert (=> b!251716 d!61295))

(declare-fun d!61297 () Bool)

(declare-fun e!163301 () Bool)

(assert (=> d!61297 e!163301))

(declare-fun res!123288 () Bool)

(assert (=> d!61297 (=> (not res!123288) (not e!163301))))

(declare-fun lt!126265 () ListLongMap!3685)

(assert (=> d!61297 (= res!123288 (contains!1798 lt!126265 (_1!2396 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504)))))))

(declare-fun lt!126267 () List!3647)

(assert (=> d!61297 (= lt!126265 (ListLongMap!3686 lt!126267))))

(declare-fun lt!126266 () Unit!7750)

(declare-fun lt!126268 () Unit!7750)

(assert (=> d!61297 (= lt!126266 lt!126268)))

(assert (=> d!61297 (= (getValueByKey!301 lt!126267 (_1!2396 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504)))) (Some!306 (_2!2396 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504)))))))

(assert (=> d!61297 (= lt!126268 (lemmaContainsTupThenGetReturnValue!161 lt!126267 (_1!2396 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504))) (_2!2396 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504)))))))

(assert (=> d!61297 (= lt!126267 (insertStrictlySorted!164 (toList!1858 lt!126201) (_1!2396 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504))) (_2!2396 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504)))))))

(assert (=> d!61297 (= (+!669 lt!126201 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504))) lt!126265)))

(declare-fun b!251833 () Bool)

(declare-fun res!123289 () Bool)

(assert (=> b!251833 (=> (not res!123289) (not e!163301))))

(assert (=> b!251833 (= res!123289 (= (getValueByKey!301 (toList!1858 lt!126265) (_1!2396 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504)))) (Some!306 (_2!2396 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504))))))))

(declare-fun b!251834 () Bool)

(assert (=> b!251834 (= e!163301 (contains!1800 (toList!1858 lt!126265) (tuple2!4771 lt!126199 (minValue!4486 thiss!1504))))))

(assert (= (and d!61297 res!123288) b!251833))

(assert (= (and b!251833 res!123289) b!251834))

(declare-fun m!268241 () Bool)

(assert (=> d!61297 m!268241))

(declare-fun m!268243 () Bool)

(assert (=> d!61297 m!268243))

(declare-fun m!268245 () Bool)

(assert (=> d!61297 m!268245))

(declare-fun m!268247 () Bool)

(assert (=> d!61297 m!268247))

(declare-fun m!268249 () Bool)

(assert (=> b!251833 m!268249))

(declare-fun m!268251 () Bool)

(assert (=> b!251834 m!268251))

(assert (=> b!251716 d!61297))

(declare-fun d!61299 () Bool)

(assert (=> d!61299 (= (apply!242 lt!126201 lt!126191) (get!3013 (getValueByKey!301 (toList!1858 lt!126201) lt!126191)))))

(declare-fun bs!9033 () Bool)

(assert (= bs!9033 d!61299))

(declare-fun m!268253 () Bool)

(assert (=> bs!9033 m!268253))

(assert (=> bs!9033 m!268253))

(declare-fun m!268255 () Bool)

(assert (=> bs!9033 m!268255))

(assert (=> b!251716 d!61299))

(declare-fun d!61301 () Bool)

(assert (=> d!61301 (= (apply!242 (+!669 lt!126196 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504))) lt!126205) (apply!242 lt!126196 lt!126205))))

(declare-fun lt!126269 () Unit!7750)

(assert (=> d!61301 (= lt!126269 (choose!1205 lt!126196 lt!126190 (zeroValue!4486 thiss!1504) lt!126205))))

(declare-fun e!163302 () Bool)

(assert (=> d!61301 e!163302))

(declare-fun res!123290 () Bool)

(assert (=> d!61301 (=> (not res!123290) (not e!163302))))

(assert (=> d!61301 (= res!123290 (contains!1798 lt!126196 lt!126205))))

(assert (=> d!61301 (= (addApplyDifferent!218 lt!126196 lt!126190 (zeroValue!4486 thiss!1504) lt!126205) lt!126269)))

(declare-fun b!251835 () Bool)

(assert (=> b!251835 (= e!163302 (not (= lt!126205 lt!126190)))))

(assert (= (and d!61301 res!123290) b!251835))

(assert (=> d!61301 m!268081))

(assert (=> d!61301 m!268081))

(assert (=> d!61301 m!268099))

(declare-fun m!268257 () Bool)

(assert (=> d!61301 m!268257))

(declare-fun m!268259 () Bool)

(assert (=> d!61301 m!268259))

(assert (=> d!61301 m!268109))

(assert (=> b!251716 d!61301))

(declare-fun d!61303 () Bool)

(assert (=> d!61303 (= (apply!242 (+!669 lt!126196 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504))) lt!126205) (get!3013 (getValueByKey!301 (toList!1858 (+!669 lt!126196 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504)))) lt!126205)))))

(declare-fun bs!9034 () Bool)

(assert (= bs!9034 d!61303))

(declare-fun m!268261 () Bool)

(assert (=> bs!9034 m!268261))

(assert (=> bs!9034 m!268261))

(declare-fun m!268263 () Bool)

(assert (=> bs!9034 m!268263))

(assert (=> b!251716 d!61303))

(declare-fun d!61305 () Bool)

(assert (=> d!61305 (= (apply!242 (+!669 lt!126201 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504))) lt!126191) (get!3013 (getValueByKey!301 (toList!1858 (+!669 lt!126201 (tuple2!4771 lt!126199 (minValue!4486 thiss!1504)))) lt!126191)))))

(declare-fun bs!9035 () Bool)

(assert (= bs!9035 d!61305))

(declare-fun m!268265 () Bool)

(assert (=> bs!9035 m!268265))

(assert (=> bs!9035 m!268265))

(declare-fun m!268267 () Bool)

(assert (=> bs!9035 m!268267))

(assert (=> b!251716 d!61305))

(declare-fun d!61307 () Bool)

(declare-fun e!163303 () Bool)

(assert (=> d!61307 e!163303))

(declare-fun res!123291 () Bool)

(assert (=> d!61307 (=> (not res!123291) (not e!163303))))

(declare-fun lt!126270 () ListLongMap!3685)

(assert (=> d!61307 (= res!123291 (contains!1798 lt!126270 (_1!2396 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504)))))))

(declare-fun lt!126272 () List!3647)

(assert (=> d!61307 (= lt!126270 (ListLongMap!3686 lt!126272))))

(declare-fun lt!126271 () Unit!7750)

(declare-fun lt!126273 () Unit!7750)

(assert (=> d!61307 (= lt!126271 lt!126273)))

(assert (=> d!61307 (= (getValueByKey!301 lt!126272 (_1!2396 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504)))) (Some!306 (_2!2396 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61307 (= lt!126273 (lemmaContainsTupThenGetReturnValue!161 lt!126272 (_1!2396 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504))) (_2!2396 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61307 (= lt!126272 (insertStrictlySorted!164 (toList!1858 lt!126196) (_1!2396 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504))) (_2!2396 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504)))))))

(assert (=> d!61307 (= (+!669 lt!126196 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504))) lt!126270)))

(declare-fun b!251836 () Bool)

(declare-fun res!123292 () Bool)

(assert (=> b!251836 (=> (not res!123292) (not e!163303))))

(assert (=> b!251836 (= res!123292 (= (getValueByKey!301 (toList!1858 lt!126270) (_1!2396 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504)))) (Some!306 (_2!2396 (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504))))))))

(declare-fun b!251837 () Bool)

(assert (=> b!251837 (= e!163303 (contains!1800 (toList!1858 lt!126270) (tuple2!4771 lt!126190 (zeroValue!4486 thiss!1504))))))

(assert (= (and d!61307 res!123291) b!251836))

(assert (= (and b!251836 res!123292) b!251837))

(declare-fun m!268269 () Bool)

(assert (=> d!61307 m!268269))

(declare-fun m!268271 () Bool)

(assert (=> d!61307 m!268271))

(declare-fun m!268273 () Bool)

(assert (=> d!61307 m!268273))

(declare-fun m!268275 () Bool)

(assert (=> d!61307 m!268275))

(declare-fun m!268277 () Bool)

(assert (=> b!251836 m!268277))

(declare-fun m!268279 () Bool)

(assert (=> b!251837 m!268279))

(assert (=> b!251716 d!61307))

(declare-fun d!61309 () Bool)

(assert (=> d!61309 (= (apply!242 (+!669 lt!126204 (tuple2!4771 lt!126206 (minValue!4486 thiss!1504))) lt!126203) (apply!242 lt!126204 lt!126203))))

(declare-fun lt!126274 () Unit!7750)

(assert (=> d!61309 (= lt!126274 (choose!1205 lt!126204 lt!126206 (minValue!4486 thiss!1504) lt!126203))))

(declare-fun e!163304 () Bool)

(assert (=> d!61309 e!163304))

(declare-fun res!123293 () Bool)

(assert (=> d!61309 (=> (not res!123293) (not e!163304))))

(assert (=> d!61309 (= res!123293 (contains!1798 lt!126204 lt!126203))))

(assert (=> d!61309 (= (addApplyDifferent!218 lt!126204 lt!126206 (minValue!4486 thiss!1504) lt!126203) lt!126274)))

(declare-fun b!251838 () Bool)

(assert (=> b!251838 (= e!163304 (not (= lt!126203 lt!126206)))))

(assert (= (and d!61309 res!123293) b!251838))

(assert (=> d!61309 m!268091))

(assert (=> d!61309 m!268091))

(assert (=> d!61309 m!268093))

(declare-fun m!268281 () Bool)

(assert (=> d!61309 m!268281))

(declare-fun m!268283 () Bool)

(assert (=> d!61309 m!268283))

(assert (=> d!61309 m!268089))

(assert (=> b!251716 d!61309))

(declare-fun d!61311 () Bool)

(assert (=> d!61311 (= (apply!242 lt!126204 lt!126203) (get!3013 (getValueByKey!301 (toList!1858 lt!126204) lt!126203)))))

(declare-fun bs!9036 () Bool)

(assert (= bs!9036 d!61311))

(declare-fun m!268285 () Bool)

(assert (=> bs!9036 m!268285))

(assert (=> bs!9036 m!268285))

(declare-fun m!268287 () Bool)

(assert (=> bs!9036 m!268287))

(assert (=> b!251716 d!61311))

(declare-fun b!251863 () Bool)

(declare-fun res!123304 () Bool)

(declare-fun e!163321 () Bool)

(assert (=> b!251863 (=> (not res!123304) (not e!163321))))

(declare-fun lt!126292 () ListLongMap!3685)

(assert (=> b!251863 (= res!123304 (not (contains!1798 lt!126292 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!23687 () Bool)

(declare-fun call!23690 () ListLongMap!3685)

(assert (=> bm!23687 (= call!23690 (getCurrentListMapNoExtraKeys!558 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4645 thiss!1504)))))

(declare-fun b!251864 () Bool)

(declare-fun lt!126295 () Unit!7750)

(declare-fun lt!126293 () Unit!7750)

(assert (=> b!251864 (= lt!126295 lt!126293)))

(declare-fun lt!126290 () (_ BitVec 64))

(declare-fun lt!126294 () (_ BitVec 64))

(declare-fun lt!126291 () V!8313)

(declare-fun lt!126289 () ListLongMap!3685)

(assert (=> b!251864 (not (contains!1798 (+!669 lt!126289 (tuple2!4771 lt!126290 lt!126291)) lt!126294))))

(declare-fun addStillNotContains!126 (ListLongMap!3685 (_ BitVec 64) V!8313 (_ BitVec 64)) Unit!7750)

(assert (=> b!251864 (= lt!126293 (addStillNotContains!126 lt!126289 lt!126290 lt!126291 lt!126294))))

(assert (=> b!251864 (= lt!126294 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!251864 (= lt!126291 (get!3012 (select (arr!5839 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!251864 (= lt!126290 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!251864 (= lt!126289 call!23690)))

(declare-fun e!163320 () ListLongMap!3685)

(assert (=> b!251864 (= e!163320 (+!669 call!23690 (tuple2!4771 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000) (get!3012 (select (arr!5839 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!61313 () Bool)

(assert (=> d!61313 e!163321))

(declare-fun res!123302 () Bool)

(assert (=> d!61313 (=> (not res!123302) (not e!163321))))

(assert (=> d!61313 (= res!123302 (not (contains!1798 lt!126292 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!163319 () ListLongMap!3685)

(assert (=> d!61313 (= lt!126292 e!163319)))

(declare-fun c!42412 () Bool)

(assert (=> d!61313 (= c!42412 (bvsge #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> d!61313 (validMask!0 (mask!10846 thiss!1504))))

(assert (=> d!61313 (= (getCurrentListMapNoExtraKeys!558 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) lt!126292)))

(declare-fun b!251865 () Bool)

(assert (=> b!251865 (= e!163319 (ListLongMap!3686 Nil!3644))))

(declare-fun b!251866 () Bool)

(declare-fun e!163322 () Bool)

(declare-fun isEmpty!537 (ListLongMap!3685) Bool)

(assert (=> b!251866 (= e!163322 (isEmpty!537 lt!126292))))

(declare-fun b!251867 () Bool)

(declare-fun e!163323 () Bool)

(assert (=> b!251867 (= e!163323 e!163322)))

(declare-fun c!42411 () Bool)

(assert (=> b!251867 (= c!42411 (bvslt #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251868 () Bool)

(assert (=> b!251868 (= e!163320 call!23690)))

(declare-fun b!251869 () Bool)

(declare-fun e!163325 () Bool)

(assert (=> b!251869 (= e!163325 (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251869 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!251870 () Bool)

(assert (=> b!251870 (= e!163319 e!163320)))

(declare-fun c!42410 () Bool)

(assert (=> b!251870 (= c!42410 (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251871 () Bool)

(assert (=> b!251871 (= e!163322 (= lt!126292 (getCurrentListMapNoExtraKeys!558 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4645 thiss!1504))))))

(declare-fun b!251872 () Bool)

(assert (=> b!251872 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> b!251872 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6185 (_values!4628 thiss!1504))))))

(declare-fun e!163324 () Bool)

(assert (=> b!251872 (= e!163324 (= (apply!242 lt!126292 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)) (get!3012 (select (arr!5839 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!251873 () Bool)

(assert (=> b!251873 (= e!163323 e!163324)))

(assert (=> b!251873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun res!123303 () Bool)

(assert (=> b!251873 (= res!123303 (contains!1798 lt!126292 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!251873 (=> (not res!123303) (not e!163324))))

(declare-fun b!251874 () Bool)

(assert (=> b!251874 (= e!163321 e!163323)))

(declare-fun c!42413 () Bool)

(assert (=> b!251874 (= c!42413 e!163325)))

(declare-fun res!123305 () Bool)

(assert (=> b!251874 (=> (not res!123305) (not e!163325))))

(assert (=> b!251874 (= res!123305 (bvslt #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(assert (= (and d!61313 c!42412) b!251865))

(assert (= (and d!61313 (not c!42412)) b!251870))

(assert (= (and b!251870 c!42410) b!251864))

(assert (= (and b!251870 (not c!42410)) b!251868))

(assert (= (or b!251864 b!251868) bm!23687))

(assert (= (and d!61313 res!123302) b!251863))

(assert (= (and b!251863 res!123304) b!251874))

(assert (= (and b!251874 res!123305) b!251869))

(assert (= (and b!251874 c!42413) b!251873))

(assert (= (and b!251874 (not c!42413)) b!251867))

(assert (= (and b!251873 res!123303) b!251872))

(assert (= (and b!251867 c!42411) b!251871))

(assert (= (and b!251867 (not c!42411)) b!251866))

(declare-fun b_lambda!8129 () Bool)

(assert (=> (not b_lambda!8129) (not b!251864)))

(assert (=> b!251864 t!8680))

(declare-fun b_and!13687 () Bool)

(assert (= b_and!13685 (and (=> t!8680 result!5305) b_and!13687)))

(declare-fun b_lambda!8131 () Bool)

(assert (=> (not b_lambda!8131) (not b!251872)))

(assert (=> b!251872 t!8680))

(declare-fun b_and!13689 () Bool)

(assert (= b_and!13687 (and (=> t!8680 result!5305) b_and!13689)))

(declare-fun m!268289 () Bool)

(assert (=> b!251871 m!268289))

(assert (=> b!251870 m!268005))

(assert (=> b!251870 m!268005))

(assert (=> b!251870 m!268007))

(assert (=> b!251869 m!268005))

(assert (=> b!251869 m!268005))

(assert (=> b!251869 m!268007))

(declare-fun m!268291 () Bool)

(assert (=> b!251863 m!268291))

(assert (=> bm!23687 m!268289))

(declare-fun m!268293 () Bool)

(assert (=> b!251866 m!268293))

(assert (=> b!251864 m!268073))

(assert (=> b!251864 m!268075))

(assert (=> b!251864 m!268077))

(assert (=> b!251864 m!268075))

(declare-fun m!268295 () Bool)

(assert (=> b!251864 m!268295))

(declare-fun m!268297 () Bool)

(assert (=> b!251864 m!268297))

(declare-fun m!268299 () Bool)

(assert (=> b!251864 m!268299))

(assert (=> b!251864 m!268073))

(assert (=> b!251864 m!268295))

(declare-fun m!268301 () Bool)

(assert (=> b!251864 m!268301))

(assert (=> b!251864 m!268005))

(assert (=> b!251872 m!268073))

(assert (=> b!251872 m!268075))

(assert (=> b!251872 m!268077))

(assert (=> b!251872 m!268075))

(assert (=> b!251872 m!268073))

(assert (=> b!251872 m!268005))

(declare-fun m!268303 () Bool)

(assert (=> b!251872 m!268303))

(assert (=> b!251872 m!268005))

(assert (=> b!251873 m!268005))

(assert (=> b!251873 m!268005))

(declare-fun m!268305 () Bool)

(assert (=> b!251873 m!268305))

(declare-fun m!268307 () Bool)

(assert (=> d!61313 m!268307))

(assert (=> d!61313 m!267837))

(assert (=> b!251716 d!61313))

(declare-fun d!61315 () Bool)

(declare-fun e!163326 () Bool)

(assert (=> d!61315 e!163326))

(declare-fun res!123306 () Bool)

(assert (=> d!61315 (=> (not res!123306) (not e!163326))))

(declare-fun lt!126296 () ListLongMap!3685)

(assert (=> d!61315 (= res!123306 (contains!1798 lt!126296 (_1!2396 (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))))

(declare-fun lt!126298 () List!3647)

(assert (=> d!61315 (= lt!126296 (ListLongMap!3686 lt!126298))))

(declare-fun lt!126297 () Unit!7750)

(declare-fun lt!126299 () Unit!7750)

(assert (=> d!61315 (= lt!126297 lt!126299)))

(assert (=> d!61315 (= (getValueByKey!301 lt!126298 (_1!2396 (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))) (Some!306 (_2!2396 (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))))

(assert (=> d!61315 (= lt!126299 (lemmaContainsTupThenGetReturnValue!161 lt!126298 (_1!2396 (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))) (_2!2396 (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))))

(assert (=> d!61315 (= lt!126298 (insertStrictlySorted!164 (toList!1858 (ite c!42377 call!23679 (ite c!42378 call!23680 call!23682))) (_1!2396 (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))) (_2!2396 (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))))))

(assert (=> d!61315 (= (+!669 (ite c!42377 call!23679 (ite c!42378 call!23680 call!23682)) (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))) lt!126296)))

(declare-fun b!251875 () Bool)

(declare-fun res!123307 () Bool)

(assert (=> b!251875 (=> (not res!123307) (not e!163326))))

(assert (=> b!251875 (= res!123307 (= (getValueByKey!301 (toList!1858 lt!126296) (_1!2396 (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504))))) (Some!306 (_2!2396 (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))))

(declare-fun b!251876 () Bool)

(assert (=> b!251876 (= e!163326 (contains!1800 (toList!1858 lt!126296) (ite (or c!42377 c!42378) (tuple2!4771 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4486 thiss!1504)) (tuple2!4771 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4486 thiss!1504)))))))

(assert (= (and d!61315 res!123306) b!251875))

(assert (= (and b!251875 res!123307) b!251876))

(declare-fun m!268309 () Bool)

(assert (=> d!61315 m!268309))

(declare-fun m!268311 () Bool)

(assert (=> d!61315 m!268311))

(declare-fun m!268313 () Bool)

(assert (=> d!61315 m!268313))

(declare-fun m!268315 () Bool)

(assert (=> d!61315 m!268315))

(declare-fun m!268317 () Bool)

(assert (=> b!251875 m!268317))

(declare-fun m!268319 () Bool)

(assert (=> b!251876 m!268319))

(assert (=> bm!23679 d!61315))

(assert (=> b!251655 d!61213))

(declare-fun d!61317 () Bool)

(declare-fun res!123312 () Bool)

(declare-fun e!163331 () Bool)

(assert (=> d!61317 (=> res!123312 e!163331)))

(assert (=> d!61317 (= res!123312 (and ((_ is Cons!3643) (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) (= (_1!2396 (h!4304 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) key!932)))))

(assert (=> d!61317 (= (containsKey!292 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932) e!163331)))

(declare-fun b!251881 () Bool)

(declare-fun e!163332 () Bool)

(assert (=> b!251881 (= e!163331 e!163332)))

(declare-fun res!123313 () Bool)

(assert (=> b!251881 (=> (not res!123313) (not e!163332))))

(assert (=> b!251881 (= res!123313 (and (or (not ((_ is Cons!3643) (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) (bvsle (_1!2396 (h!4304 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) key!932)) ((_ is Cons!3643) (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) (bvslt (_1!2396 (h!4304 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))))) key!932)))))

(declare-fun b!251882 () Bool)

(assert (=> b!251882 (= e!163332 (containsKey!292 (t!8676 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))) key!932))))

(assert (= (and d!61317 (not res!123312)) b!251881))

(assert (= (and b!251881 res!123313) b!251882))

(declare-fun m!268321 () Bool)

(assert (=> b!251882 m!268321))

(assert (=> d!61243 d!61317))

(declare-fun d!61319 () Bool)

(assert (=> d!61319 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!251591 d!61319))

(assert (=> d!61239 d!61243))

(assert (=> d!61239 d!61245))

(declare-fun d!61321 () Bool)

(assert (=> d!61321 (contains!1798 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) key!932)))

(assert (=> d!61321 true))

(declare-fun _$17!80 () Unit!7750)

(assert (=> d!61321 (= (choose!1203 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)) _$17!80)))

(declare-fun bs!9037 () Bool)

(assert (= bs!9037 d!61321))

(assert (=> bs!9037 m!267865))

(assert (=> bs!9037 m!267865))

(assert (=> bs!9037 m!267867))

(assert (=> d!61239 d!61321))

(assert (=> d!61239 d!61215))

(declare-fun b!251901 () Bool)

(declare-fun lt!126305 () SeekEntryResult!1091)

(assert (=> b!251901 (and (bvsge (index!6536 lt!126305) #b00000000000000000000000000000000) (bvslt (index!6536 lt!126305) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun e!163343 () Bool)

(assert (=> b!251901 (= e!163343 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6536 lt!126305)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251902 () Bool)

(declare-fun e!163346 () Bool)

(declare-fun e!163345 () Bool)

(assert (=> b!251902 (= e!163346 e!163345)))

(declare-fun res!123321 () Bool)

(assert (=> b!251902 (= res!123321 (and ((_ is Intermediate!1091) lt!126305) (not (undefined!1903 lt!126305)) (bvslt (x!24685 lt!126305) #b01111111111111111111111111111110) (bvsge (x!24685 lt!126305) #b00000000000000000000000000000000) (bvsge (x!24685 lt!126305) #b00000000000000000000000000000000)))))

(assert (=> b!251902 (=> (not res!123321) (not e!163345))))

(declare-fun b!251903 () Bool)

(declare-fun e!163344 () SeekEntryResult!1091)

(declare-fun e!163347 () SeekEntryResult!1091)

(assert (=> b!251903 (= e!163344 e!163347)))

(declare-fun c!42422 () Bool)

(declare-fun lt!126304 () (_ BitVec 64))

(assert (=> b!251903 (= c!42422 (or (= lt!126304 key!932) (= (bvadd lt!126304 lt!126304) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251904 () Bool)

(assert (=> b!251904 (= e!163347 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10846 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10846 thiss!1504)) key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(declare-fun b!251905 () Bool)

(assert (=> b!251905 (and (bvsge (index!6536 lt!126305) #b00000000000000000000000000000000) (bvslt (index!6536 lt!126305) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun res!123322 () Bool)

(assert (=> b!251905 (= res!123322 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6536 lt!126305)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251905 (=> res!123322 e!163343)))

(declare-fun b!251906 () Bool)

(assert (=> b!251906 (and (bvsge (index!6536 lt!126305) #b00000000000000000000000000000000) (bvslt (index!6536 lt!126305) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun res!123320 () Bool)

(assert (=> b!251906 (= res!123320 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6536 lt!126305)) key!932))))

(assert (=> b!251906 (=> res!123320 e!163343)))

(assert (=> b!251906 (= e!163345 e!163343)))

(declare-fun b!251907 () Bool)

(assert (=> b!251907 (= e!163344 (Intermediate!1091 true (toIndex!0 key!932 (mask!10846 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!251908 () Bool)

(assert (=> b!251908 (= e!163347 (Intermediate!1091 false (toIndex!0 key!932 (mask!10846 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!251909 () Bool)

(assert (=> b!251909 (= e!163346 (bvsge (x!24685 lt!126305) #b01111111111111111111111111111110))))

(declare-fun d!61323 () Bool)

(assert (=> d!61323 e!163346))

(declare-fun c!42420 () Bool)

(assert (=> d!61323 (= c!42420 (and ((_ is Intermediate!1091) lt!126305) (undefined!1903 lt!126305)))))

(assert (=> d!61323 (= lt!126305 e!163344)))

(declare-fun c!42421 () Bool)

(assert (=> d!61323 (= c!42421 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!61323 (= lt!126304 (select (arr!5840 (_keys!6787 thiss!1504)) (toIndex!0 key!932 (mask!10846 thiss!1504))))))

(assert (=> d!61323 (validMask!0 (mask!10846 thiss!1504))))

(assert (=> d!61323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10846 thiss!1504)) key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)) lt!126305)))

(assert (= (and d!61323 c!42421) b!251907))

(assert (= (and d!61323 (not c!42421)) b!251903))

(assert (= (and b!251903 c!42422) b!251908))

(assert (= (and b!251903 (not c!42422)) b!251904))

(assert (= (and d!61323 c!42420) b!251909))

(assert (= (and d!61323 (not c!42420)) b!251902))

(assert (= (and b!251902 res!123321) b!251906))

(assert (= (and b!251906 (not res!123320)) b!251905))

(assert (= (and b!251905 (not res!123322)) b!251901))

(declare-fun m!268323 () Bool)

(assert (=> b!251906 m!268323))

(assert (=> b!251905 m!268323))

(assert (=> d!61323 m!267983))

(declare-fun m!268325 () Bool)

(assert (=> d!61323 m!268325))

(assert (=> d!61323 m!267837))

(assert (=> b!251901 m!268323))

(assert (=> b!251904 m!267983))

(declare-fun m!268327 () Bool)

(assert (=> b!251904 m!268327))

(assert (=> b!251904 m!268327))

(declare-fun m!268329 () Bool)

(assert (=> b!251904 m!268329))

(assert (=> d!61209 d!61323))

(declare-fun d!61325 () Bool)

(declare-fun lt!126311 () (_ BitVec 32))

(declare-fun lt!126310 () (_ BitVec 32))

(assert (=> d!61325 (= lt!126311 (bvmul (bvxor lt!126310 (bvlshr lt!126310 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!61325 (= lt!126310 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!61325 (and (bvsge (mask!10846 thiss!1504) #b00000000000000000000000000000000) (let ((res!123323 (let ((h!4307 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24705 (bvmul (bvxor h!4307 (bvlshr h!4307 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24705 (bvlshr x!24705 #b00000000000000000000000000001101)) (mask!10846 thiss!1504)))))) (and (bvslt res!123323 (bvadd (mask!10846 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!123323 #b00000000000000000000000000000000))))))

(assert (=> d!61325 (= (toIndex!0 key!932 (mask!10846 thiss!1504)) (bvand (bvxor lt!126311 (bvlshr lt!126311 #b00000000000000000000000000001101)) (mask!10846 thiss!1504)))))

(assert (=> d!61209 d!61325))

(assert (=> d!61209 d!61215))

(declare-fun d!61327 () Bool)

(assert (=> d!61327 (= (apply!242 lt!126208 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3013 (getValueByKey!301 (toList!1858 lt!126208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9038 () Bool)

(assert (= bs!9038 d!61327))

(declare-fun m!268331 () Bool)

(assert (=> bs!9038 m!268331))

(assert (=> bs!9038 m!268331))

(declare-fun m!268333 () Bool)

(assert (=> bs!9038 m!268333))

(assert (=> b!251725 d!61327))

(declare-fun d!61329 () Bool)

(declare-fun res!123326 () Bool)

(declare-fun e!163350 () Bool)

(assert (=> d!61329 (=> res!123326 e!163350)))

(assert (=> d!61329 (= res!123326 (bvsge #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> d!61329 (= (arrayNoDuplicates!0 (_keys!6787 thiss!1504) #b00000000000000000000000000000000 Nil!3645) e!163350)))

(declare-fun b!251910 () Bool)

(declare-fun e!163351 () Bool)

(declare-fun call!23691 () Bool)

(assert (=> b!251910 (= e!163351 call!23691)))

(declare-fun bm!23688 () Bool)

(declare-fun c!42423 () Bool)

(assert (=> bm!23688 (= call!23691 (arrayNoDuplicates!0 (_keys!6787 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42423 (Cons!3644 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000) Nil!3645) Nil!3645)))))

(declare-fun b!251911 () Bool)

(declare-fun e!163349 () Bool)

(assert (=> b!251911 (= e!163349 e!163351)))

(assert (=> b!251911 (= c!42423 (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251912 () Bool)

(assert (=> b!251912 (= e!163350 e!163349)))

(declare-fun res!123325 () Bool)

(assert (=> b!251912 (=> (not res!123325) (not e!163349))))

(declare-fun e!163348 () Bool)

(assert (=> b!251912 (= res!123325 (not e!163348))))

(declare-fun res!123324 () Bool)

(assert (=> b!251912 (=> (not res!123324) (not e!163348))))

(assert (=> b!251912 (= res!123324 (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251913 () Bool)

(assert (=> b!251913 (= e!163348 (contains!1799 Nil!3645 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!251914 () Bool)

(assert (=> b!251914 (= e!163351 call!23691)))

(assert (= (and d!61329 (not res!123326)) b!251912))

(assert (= (and b!251912 res!123324) b!251913))

(assert (= (and b!251912 res!123325) b!251911))

(assert (= (and b!251911 c!42423) b!251910))

(assert (= (and b!251911 (not c!42423)) b!251914))

(assert (= (or b!251910 b!251914) bm!23688))

(assert (=> bm!23688 m!268005))

(declare-fun m!268335 () Bool)

(assert (=> bm!23688 m!268335))

(assert (=> b!251911 m!268005))

(assert (=> b!251911 m!268005))

(assert (=> b!251911 m!268007))

(assert (=> b!251912 m!268005))

(assert (=> b!251912 m!268005))

(assert (=> b!251912 m!268007))

(assert (=> b!251913 m!268005))

(assert (=> b!251913 m!268005))

(declare-fun m!268337 () Bool)

(assert (=> b!251913 m!268337))

(assert (=> b!251657 d!61329))

(declare-fun b!251916 () Bool)

(declare-fun e!163352 () (_ BitVec 32))

(assert (=> b!251916 (= e!163352 #b00000000000000000000000000000000)))

(declare-fun b!251917 () Bool)

(declare-fun e!163353 () (_ BitVec 32))

(declare-fun call!23692 () (_ BitVec 32))

(assert (=> b!251917 (= e!163353 call!23692)))

(declare-fun b!251918 () Bool)

(assert (=> b!251918 (= e!163352 e!163353)))

(declare-fun c!42424 () Bool)

(assert (=> b!251918 (= c!42424 (validKeyInArray!0 (select (arr!5840 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!23689 () Bool)

(assert (=> bm!23689 (= call!23692 (arrayCountValidKeys!0 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251915 () Bool)

(assert (=> b!251915 (= e!163353 (bvadd #b00000000000000000000000000000001 call!23692))))

(declare-fun lt!126312 () (_ BitVec 32))

(declare-fun d!61331 () Bool)

(assert (=> d!61331 (and (bvsge lt!126312 #b00000000000000000000000000000000) (bvsle lt!126312 (bvsub (size!6186 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!61331 (= lt!126312 e!163352)))

(declare-fun c!42425 () Bool)

(assert (=> d!61331 (= c!42425 (bvsge #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> d!61331 (and (bvsle #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6186 (_keys!6787 thiss!1504)) (size!6186 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))))))))

(assert (=> d!61331 (= (arrayCountValidKeys!0 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) lt!126312)))

(assert (= (and d!61331 c!42425) b!251916))

(assert (= (and d!61331 (not c!42425)) b!251918))

(assert (= (and b!251918 c!42424) b!251915))

(assert (= (and b!251918 (not c!42424)) b!251917))

(assert (= (or b!251915 b!251917) bm!23689))

(declare-fun m!268339 () Bool)

(assert (=> b!251918 m!268339))

(assert (=> b!251918 m!268339))

(declare-fun m!268341 () Bool)

(assert (=> b!251918 m!268341))

(declare-fun m!268343 () Bool)

(assert (=> bm!23689 m!268343))

(assert (=> b!251593 d!61331))

(assert (=> b!251593 d!61213))

(declare-fun d!61333 () Bool)

(assert (=> d!61333 (= (inRange!0 (index!6535 lt!126130) (mask!10846 thiss!1504)) (and (bvsge (index!6535 lt!126130) #b00000000000000000000000000000000) (bvslt (index!6535 lt!126130) (bvadd (mask!10846 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!251662 d!61333))

(assert (=> b!251636 d!61257))

(assert (=> b!251727 d!61279))

(declare-fun d!61335 () Bool)

(declare-fun e!163354 () Bool)

(assert (=> d!61335 e!163354))

(declare-fun res!123327 () Bool)

(assert (=> d!61335 (=> res!123327 e!163354)))

(declare-fun lt!126315 () Bool)

(assert (=> d!61335 (= res!123327 (not lt!126315))))

(declare-fun lt!126316 () Bool)

(assert (=> d!61335 (= lt!126315 lt!126316)))

(declare-fun lt!126313 () Unit!7750)

(declare-fun e!163355 () Unit!7750)

(assert (=> d!61335 (= lt!126313 e!163355)))

(declare-fun c!42426 () Bool)

(assert (=> d!61335 (= c!42426 lt!126316)))

(assert (=> d!61335 (= lt!126316 (containsKey!292 (toList!1858 lt!126208) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!61335 (= (contains!1798 lt!126208 #b1000000000000000000000000000000000000000000000000000000000000000) lt!126315)))

(declare-fun b!251919 () Bool)

(declare-fun lt!126314 () Unit!7750)

(assert (=> b!251919 (= e!163355 lt!126314)))

(assert (=> b!251919 (= lt!126314 (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1858 lt!126208) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251919 (isDefined!241 (getValueByKey!301 (toList!1858 lt!126208) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251920 () Bool)

(declare-fun Unit!7768 () Unit!7750)

(assert (=> b!251920 (= e!163355 Unit!7768)))

(declare-fun b!251921 () Bool)

(assert (=> b!251921 (= e!163354 (isDefined!241 (getValueByKey!301 (toList!1858 lt!126208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61335 c!42426) b!251919))

(assert (= (and d!61335 (not c!42426)) b!251920))

(assert (= (and d!61335 (not res!123327)) b!251921))

(declare-fun m!268345 () Bool)

(assert (=> d!61335 m!268345))

(declare-fun m!268347 () Bool)

(assert (=> b!251919 m!268347))

(assert (=> b!251919 m!268331))

(assert (=> b!251919 m!268331))

(declare-fun m!268349 () Bool)

(assert (=> b!251919 m!268349))

(assert (=> b!251921 m!268331))

(assert (=> b!251921 m!268331))

(assert (=> b!251921 m!268349))

(assert (=> bm!23675 d!61335))

(assert (=> d!61207 d!61209))

(declare-fun d!61337 () Bool)

(declare-fun e!163365 () Bool)

(assert (=> d!61337 e!163365))

(declare-fun c!42432 () Bool)

(declare-fun lt!126319 () SeekEntryResult!1091)

(assert (=> d!61337 (= c!42432 ((_ is MissingZero!1091) lt!126319))))

(assert (=> d!61337 (= lt!126319 (seekEntryOrOpen!0 key!932 (_keys!6787 thiss!1504) (mask!10846 thiss!1504)))))

(assert (=> d!61337 true))

(declare-fun _$34!1116 () Unit!7750)

(assert (=> d!61337 (= (choose!1201 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) key!932 (defaultEntry!4645 thiss!1504)) _$34!1116)))

(declare-fun b!251938 () Bool)

(declare-fun res!123337 () Bool)

(declare-fun e!163366 () Bool)

(assert (=> b!251938 (=> (not res!123337) (not e!163366))))

(declare-fun call!23698 () Bool)

(assert (=> b!251938 (= res!123337 call!23698)))

(declare-fun e!163367 () Bool)

(assert (=> b!251938 (= e!163367 e!163366)))

(declare-fun b!251939 () Bool)

(declare-fun res!123336 () Bool)

(assert (=> b!251939 (= res!123336 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6534 lt!126319)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163364 () Bool)

(assert (=> b!251939 (=> (not res!123336) (not e!163364))))

(declare-fun b!251940 () Bool)

(declare-fun call!23697 () Bool)

(assert (=> b!251940 (= e!163366 (not call!23697))))

(declare-fun bm!23694 () Bool)

(assert (=> bm!23694 (= call!23697 (arrayContainsKey!0 (_keys!6787 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!251941 () Bool)

(assert (=> b!251941 (= e!163365 e!163367)))

(declare-fun c!42431 () Bool)

(assert (=> b!251941 (= c!42431 ((_ is MissingVacant!1091) lt!126319))))

(declare-fun b!251942 () Bool)

(assert (=> b!251942 (= e!163367 ((_ is Undefined!1091) lt!126319))))

(declare-fun b!251943 () Bool)

(declare-fun res!123338 () Bool)

(assert (=> b!251943 (=> (not res!123338) (not e!163366))))

(assert (=> b!251943 (= res!123338 (= (select (arr!5840 (_keys!6787 thiss!1504)) (index!6537 lt!126319)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!251944 () Bool)

(assert (=> b!251944 (= e!163365 e!163364)))

(declare-fun res!123339 () Bool)

(assert (=> b!251944 (= res!123339 call!23698)))

(assert (=> b!251944 (=> (not res!123339) (not e!163364))))

(declare-fun b!251945 () Bool)

(assert (=> b!251945 (= e!163364 (not call!23697))))

(declare-fun bm!23695 () Bool)

(assert (=> bm!23695 (= call!23698 (inRange!0 (ite c!42432 (index!6534 lt!126319) (index!6537 lt!126319)) (mask!10846 thiss!1504)))))

(assert (= (and d!61337 c!42432) b!251944))

(assert (= (and d!61337 (not c!42432)) b!251941))

(assert (= (and b!251944 res!123339) b!251939))

(assert (= (and b!251939 res!123336) b!251945))

(assert (= (and b!251941 c!42431) b!251938))

(assert (= (and b!251941 (not c!42431)) b!251942))

(assert (= (and b!251938 res!123337) b!251943))

(assert (= (and b!251943 res!123338) b!251940))

(assert (= (or b!251944 b!251938) bm!23695))

(assert (= (or b!251945 b!251940) bm!23694))

(declare-fun m!268351 () Bool)

(assert (=> b!251939 m!268351))

(declare-fun m!268353 () Bool)

(assert (=> b!251943 m!268353))

(assert (=> d!61337 m!267833))

(assert (=> bm!23694 m!267839))

(declare-fun m!268355 () Bool)

(assert (=> bm!23695 m!268355))

(assert (=> d!61207 d!61337))

(assert (=> d!61207 d!61215))

(assert (=> bm!23677 d!61313))

(declare-fun d!61339 () Bool)

(assert (=> d!61339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) (mask!10846 thiss!1504))))

(assert (=> d!61339 true))

(declare-fun _$56!30 () Unit!7750)

(assert (=> d!61339 (= (choose!102 key!932 (_keys!6787 thiss!1504) index!297 (mask!10846 thiss!1504)) _$56!30)))

(declare-fun bs!9039 () Bool)

(assert (= bs!9039 d!61339))

(assert (=> bs!9039 m!267847))

(assert (=> bs!9039 m!268037))

(assert (=> d!61227 d!61339))

(assert (=> d!61227 d!61215))

(declare-fun d!61341 () Bool)

(assert (=> d!61341 (= (apply!242 lt!126208 (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000)) (get!3013 (getValueByKey!301 (toList!1858 lt!126208) (select (arr!5840 (_keys!6787 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9040 () Bool)

(assert (= bs!9040 d!61341))

(assert (=> bs!9040 m!268005))

(assert (=> bs!9040 m!268165))

(assert (=> bs!9040 m!268165))

(declare-fun m!268357 () Bool)

(assert (=> bs!9040 m!268357))

(assert (=> b!251732 d!61341))

(declare-fun d!61343 () Bool)

(declare-fun c!42435 () Bool)

(assert (=> d!61343 (= c!42435 ((_ is ValueCellFull!2906) (select (arr!5839 (_values!4628 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!163370 () V!8313)

(assert (=> d!61343 (= (get!3012 (select (arr!5839 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!163370)))

(declare-fun b!251950 () Bool)

(declare-fun get!3014 (ValueCell!2906 V!8313) V!8313)

(assert (=> b!251950 (= e!163370 (get!3014 (select (arr!5839 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!251951 () Bool)

(declare-fun get!3015 (ValueCell!2906 V!8313) V!8313)

(assert (=> b!251951 (= e!163370 (get!3015 (select (arr!5839 (_values!4628 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!585 (defaultEntry!4645 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!61343 c!42435) b!251950))

(assert (= (and d!61343 (not c!42435)) b!251951))

(assert (=> b!251950 m!268073))

(assert (=> b!251950 m!268075))

(declare-fun m!268359 () Bool)

(assert (=> b!251950 m!268359))

(assert (=> b!251951 m!268073))

(assert (=> b!251951 m!268075))

(declare-fun m!268361 () Bool)

(assert (=> b!251951 m!268361))

(assert (=> b!251732 d!61343))

(declare-fun b!251953 () Bool)

(declare-fun e!163371 () (_ BitVec 32))

(assert (=> b!251953 (= e!163371 #b00000000000000000000000000000000)))

(declare-fun b!251954 () Bool)

(declare-fun e!163372 () (_ BitVec 32))

(declare-fun call!23699 () (_ BitVec 32))

(assert (=> b!251954 (= e!163372 call!23699)))

(declare-fun b!251955 () Bool)

(assert (=> b!251955 (= e!163371 e!163372)))

(declare-fun c!42436 () Bool)

(assert (=> b!251955 (= c!42436 (validKeyInArray!0 (select (arr!5840 (_keys!6787 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!23696 () Bool)

(assert (=> bm!23696 (= call!23699 (arrayCountValidKeys!0 (_keys!6787 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251952 () Bool)

(assert (=> b!251952 (= e!163372 (bvadd #b00000000000000000000000000000001 call!23699))))

(declare-fun d!61345 () Bool)

(declare-fun lt!126320 () (_ BitVec 32))

(assert (=> d!61345 (and (bvsge lt!126320 #b00000000000000000000000000000000) (bvsle lt!126320 (bvsub (size!6186 (_keys!6787 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!61345 (= lt!126320 e!163371)))

(declare-fun c!42437 () Bool)

(assert (=> d!61345 (= c!42437 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> d!61345 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6186 (_keys!6787 thiss!1504)) (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> d!61345 (= (arrayCountValidKeys!0 (_keys!6787 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))) lt!126320)))

(assert (= (and d!61345 c!42437) b!251953))

(assert (= (and d!61345 (not c!42437)) b!251955))

(assert (= (and b!251955 c!42436) b!251952))

(assert (= (and b!251955 (not c!42436)) b!251954))

(assert (= (or b!251952 b!251954) bm!23696))

(assert (=> b!251955 m!268169))

(assert (=> b!251955 m!268169))

(declare-fun m!268363 () Bool)

(assert (=> b!251955 m!268363))

(declare-fun m!268365 () Bool)

(assert (=> bm!23696 m!268365))

(assert (=> bm!23653 d!61345))

(assert (=> b!251719 d!61279))

(declare-fun b!251957 () Bool)

(declare-fun e!163373 () (_ BitVec 32))

(assert (=> b!251957 (= e!163373 #b00000000000000000000000000000000)))

(declare-fun b!251958 () Bool)

(declare-fun e!163374 () (_ BitVec 32))

(declare-fun call!23700 () (_ BitVec 32))

(assert (=> b!251958 (= e!163374 call!23700)))

(declare-fun b!251959 () Bool)

(assert (=> b!251959 (= e!163373 e!163374)))

(declare-fun c!42438 () Bool)

(assert (=> b!251959 (= c!42438 (validKeyInArray!0 (select (arr!5840 lt!126026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!23697 () Bool)

(assert (=> bm!23697 (= call!23700 (arrayCountValidKeys!0 lt!126026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))))))

(declare-fun b!251956 () Bool)

(assert (=> b!251956 (= e!163374 (bvadd #b00000000000000000000000000000001 call!23700))))

(declare-fun d!61347 () Bool)

(declare-fun lt!126321 () (_ BitVec 32))

(assert (=> d!61347 (and (bvsge lt!126321 #b00000000000000000000000000000000) (bvsle lt!126321 (bvsub (size!6186 lt!126026) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!61347 (= lt!126321 e!163373)))

(declare-fun c!42439 () Bool)

(assert (=> d!61347 (= c!42439 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))))))

(assert (=> d!61347 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6186 (_keys!6787 thiss!1504)) (size!6186 lt!126026)))))

(assert (=> d!61347 (= (arrayCountValidKeys!0 lt!126026 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 (_keys!6787 thiss!1504))) lt!126321)))

(assert (= (and d!61347 c!42439) b!251957))

(assert (= (and d!61347 (not c!42439)) b!251959))

(assert (= (and b!251959 c!42438) b!251956))

(assert (= (and b!251959 (not c!42438)) b!251958))

(assert (= (or b!251956 b!251958) bm!23697))

(assert (=> b!251959 m!268131))

(assert (=> b!251959 m!268131))

(assert (=> b!251959 m!268135))

(declare-fun m!268367 () Bool)

(assert (=> bm!23697 m!268367))

(assert (=> bm!23657 d!61347))

(declare-fun d!61349 () Bool)

(declare-fun res!123342 () Bool)

(declare-fun e!163377 () Bool)

(assert (=> d!61349 (=> res!123342 e!163377)))

(assert (=> d!61349 (= res!123342 (bvsge #b00000000000000000000000000000000 (size!6186 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))))))))

(assert (=> d!61349 (= (arrayNoDuplicates!0 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) #b00000000000000000000000000000000 Nil!3645) e!163377)))

(declare-fun b!251960 () Bool)

(declare-fun e!163378 () Bool)

(declare-fun call!23701 () Bool)

(assert (=> b!251960 (= e!163378 call!23701)))

(declare-fun bm!23698 () Bool)

(declare-fun c!42440 () Bool)

(assert (=> bm!23698 (= call!23701 (arrayNoDuplicates!0 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42440 (Cons!3644 (select (arr!5840 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504)))) #b00000000000000000000000000000000) Nil!3645) Nil!3645)))))

(declare-fun b!251961 () Bool)

(declare-fun e!163376 () Bool)

(assert (=> b!251961 (= e!163376 e!163378)))

(assert (=> b!251961 (= c!42440 (validKeyInArray!0 (select (arr!5840 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251962 () Bool)

(assert (=> b!251962 (= e!163377 e!163376)))

(declare-fun res!123341 () Bool)

(assert (=> b!251962 (=> (not res!123341) (not e!163376))))

(declare-fun e!163375 () Bool)

(assert (=> b!251962 (= res!123341 (not e!163375))))

(declare-fun res!123340 () Bool)

(assert (=> b!251962 (=> (not res!123340) (not e!163375))))

(assert (=> b!251962 (= res!123340 (validKeyInArray!0 (select (arr!5840 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251963 () Bool)

(assert (=> b!251963 (= e!163375 (contains!1799 Nil!3645 (select (arr!5840 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251964 () Bool)

(assert (=> b!251964 (= e!163378 call!23701)))

(assert (= (and d!61349 (not res!123342)) b!251962))

(assert (= (and b!251962 res!123340) b!251963))

(assert (= (and b!251962 res!123341) b!251961))

(assert (= (and b!251961 c!42440) b!251960))

(assert (= (and b!251961 (not c!42440)) b!251964))

(assert (= (or b!251960 b!251964) bm!23698))

(assert (=> bm!23698 m!268339))

(declare-fun m!268369 () Bool)

(assert (=> bm!23698 m!268369))

(assert (=> b!251961 m!268339))

(assert (=> b!251961 m!268339))

(assert (=> b!251961 m!268341))

(assert (=> b!251962 m!268339))

(assert (=> b!251962 m!268339))

(assert (=> b!251962 m!268341))

(assert (=> b!251963 m!268339))

(assert (=> b!251963 m!268339))

(declare-fun m!268371 () Bool)

(assert (=> b!251963 m!268371))

(assert (=> b!251624 d!61349))

(declare-fun d!61351 () Bool)

(assert (=> d!61351 (isDefined!241 (getValueByKey!301 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(declare-fun lt!126324 () Unit!7750)

(declare-fun choose!1206 (List!3647 (_ BitVec 64)) Unit!7750)

(assert (=> d!61351 (= lt!126324 (choose!1206 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(declare-fun e!163381 () Bool)

(assert (=> d!61351 e!163381))

(declare-fun res!123345 () Bool)

(assert (=> d!61351 (=> (not res!123345) (not e!163381))))

(declare-fun isStrictlySorted!359 (List!3647) Bool)

(assert (=> d!61351 (= res!123345 (isStrictlySorted!359 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504)))))))

(assert (=> d!61351 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!240 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932) lt!126324)))

(declare-fun b!251967 () Bool)

(assert (=> b!251967 (= e!163381 (containsKey!292 (toList!1858 (getCurrentListMap!1390 (_keys!6787 thiss!1504) (_values!4628 thiss!1504) (mask!10846 thiss!1504) (extraKeys!4382 thiss!1504) (zeroValue!4486 thiss!1504) (minValue!4486 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4645 thiss!1504))) key!932))))

(assert (= (and d!61351 res!123345) b!251967))

(assert (=> d!61351 m!268057))

(assert (=> d!61351 m!268057))

(assert (=> d!61351 m!268059))

(declare-fun m!268373 () Bool)

(assert (=> d!61351 m!268373))

(declare-fun m!268375 () Bool)

(assert (=> d!61351 m!268375))

(assert (=> b!251967 m!268053))

(assert (=> b!251670 d!61351))

(assert (=> b!251670 d!61261))

(assert (=> b!251670 d!61263))

(declare-fun b!251968 () Bool)

(declare-fun e!163383 () Bool)

(declare-fun call!23702 () Bool)

(assert (=> b!251968 (= e!163383 call!23702)))

(declare-fun bm!23699 () Bool)

(assert (=> bm!23699 (= call!23702 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) (mask!10846 thiss!1504)))))

(declare-fun d!61353 () Bool)

(declare-fun res!123347 () Bool)

(declare-fun e!163384 () Bool)

(assert (=> d!61353 (=> res!123347 e!163384)))

(assert (=> d!61353 (= res!123347 (bvsge #b00000000000000000000000000000000 (size!6186 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))))))))

(assert (=> d!61353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) (mask!10846 thiss!1504)) e!163384)))

(declare-fun b!251969 () Bool)

(assert (=> b!251969 (= e!163384 e!163383)))

(declare-fun c!42441 () Bool)

(assert (=> b!251969 (= c!42441 (validKeyInArray!0 (select (arr!5840 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!251970 () Bool)

(declare-fun e!163382 () Bool)

(assert (=> b!251970 (= e!163382 call!23702)))

(declare-fun b!251971 () Bool)

(assert (=> b!251971 (= e!163383 e!163382)))

(declare-fun lt!126325 () (_ BitVec 64))

(assert (=> b!251971 (= lt!126325 (select (arr!5840 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!126326 () Unit!7750)

(assert (=> b!251971 (= lt!126326 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) lt!126325 #b00000000000000000000000000000000))))

(assert (=> b!251971 (arrayContainsKey!0 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) lt!126325 #b00000000000000000000000000000000)))

(declare-fun lt!126327 () Unit!7750)

(assert (=> b!251971 (= lt!126327 lt!126326)))

(declare-fun res!123346 () Bool)

(assert (=> b!251971 (= res!123346 (= (seekEntryOrOpen!0 (select (arr!5840 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504)))) #b00000000000000000000000000000000) (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) (mask!10846 thiss!1504)) (Found!1091 #b00000000000000000000000000000000)))))

(assert (=> b!251971 (=> (not res!123346) (not e!163382))))

(assert (= (and d!61353 (not res!123347)) b!251969))

(assert (= (and b!251969 c!42441) b!251971))

(assert (= (and b!251969 (not c!42441)) b!251968))

(assert (= (and b!251971 res!123346) b!251970))

(assert (= (or b!251970 b!251968) bm!23699))

(declare-fun m!268377 () Bool)

(assert (=> bm!23699 m!268377))

(assert (=> b!251969 m!268339))

(assert (=> b!251969 m!268339))

(assert (=> b!251969 m!268341))

(assert (=> b!251971 m!268339))

(declare-fun m!268379 () Bool)

(assert (=> b!251971 m!268379))

(declare-fun m!268381 () Bool)

(assert (=> b!251971 m!268381))

(assert (=> b!251971 m!268339))

(declare-fun m!268383 () Bool)

(assert (=> b!251971 m!268383))

(assert (=> b!251648 d!61353))

(declare-fun d!61355 () Bool)

(declare-fun lt!126330 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!168 (List!3648) (InoxSet (_ BitVec 64)))

(assert (=> d!61355 (= lt!126330 (select (content!168 Nil!3645) (select (arr!5840 lt!126026) #b00000000000000000000000000000000)))))

(declare-fun e!163390 () Bool)

(assert (=> d!61355 (= lt!126330 e!163390)))

(declare-fun res!123352 () Bool)

(assert (=> d!61355 (=> (not res!123352) (not e!163390))))

(assert (=> d!61355 (= res!123352 ((_ is Cons!3644) Nil!3645))))

(assert (=> d!61355 (= (contains!1799 Nil!3645 (select (arr!5840 lt!126026) #b00000000000000000000000000000000)) lt!126330)))

(declare-fun b!251976 () Bool)

(declare-fun e!163389 () Bool)

(assert (=> b!251976 (= e!163390 e!163389)))

(declare-fun res!123353 () Bool)

(assert (=> b!251976 (=> res!123353 e!163389)))

(assert (=> b!251976 (= res!123353 (= (h!4305 Nil!3645) (select (arr!5840 lt!126026) #b00000000000000000000000000000000)))))

(declare-fun b!251977 () Bool)

(assert (=> b!251977 (= e!163389 (contains!1799 (t!8677 Nil!3645) (select (arr!5840 lt!126026) #b00000000000000000000000000000000)))))

(assert (= (and d!61355 res!123352) b!251976))

(assert (= (and b!251976 (not res!123353)) b!251977))

(declare-fun m!268385 () Bool)

(assert (=> d!61355 m!268385))

(assert (=> d!61355 m!268013))

(declare-fun m!268387 () Bool)

(assert (=> d!61355 m!268387))

(assert (=> b!251977 m!268013))

(declare-fun m!268389 () Bool)

(assert (=> b!251977 m!268389))

(assert (=> b!251638 d!61355))

(assert (=> b!251615 d!61257))

(declare-fun d!61357 () Bool)

(assert (=> d!61357 (= (arrayCountValidKeys!0 (array!12320 (store (arr!5840 (_keys!6787 thiss!1504)) index!297 key!932) (size!6186 (_keys!6787 thiss!1504))) #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6787 thiss!1504) #b00000000000000000000000000000000 (size!6186 (_keys!6787 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!61357 true))

(declare-fun _$84!33 () Unit!7750)

(assert (=> d!61357 (= (choose!1 (_keys!6787 thiss!1504) index!297 key!932) _$84!33)))

(declare-fun bs!9041 () Bool)

(assert (= bs!9041 d!61357))

(assert (=> bs!9041 m!267847))

(assert (=> bs!9041 m!267999))

(assert (=> bs!9041 m!267849))

(assert (=> d!61211 d!61357))

(declare-fun d!61359 () Bool)

(assert (=> d!61359 (arrayContainsKey!0 lt!126026 lt!126115 #b00000000000000000000000000000000)))

(declare-fun lt!126333 () Unit!7750)

(declare-fun choose!13 (array!12319 (_ BitVec 64) (_ BitVec 32)) Unit!7750)

(assert (=> d!61359 (= lt!126333 (choose!13 lt!126026 lt!126115 #b00000000000000000000000000000000))))

(assert (=> d!61359 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!61359 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126026 lt!126115 #b00000000000000000000000000000000) lt!126333)))

(declare-fun bs!9042 () Bool)

(assert (= bs!9042 d!61359))

(assert (=> bs!9042 m!268019))

(declare-fun m!268391 () Bool)

(assert (=> bs!9042 m!268391))

(assert (=> b!251617 d!61359))

(declare-fun d!61361 () Bool)

(declare-fun res!123354 () Bool)

(declare-fun e!163391 () Bool)

(assert (=> d!61361 (=> res!123354 e!163391)))

(assert (=> d!61361 (= res!123354 (= (select (arr!5840 lt!126026) #b00000000000000000000000000000000) lt!126115))))

(assert (=> d!61361 (= (arrayContainsKey!0 lt!126026 lt!126115 #b00000000000000000000000000000000) e!163391)))

(declare-fun b!251978 () Bool)

(declare-fun e!163392 () Bool)

(assert (=> b!251978 (= e!163391 e!163392)))

(declare-fun res!123355 () Bool)

(assert (=> b!251978 (=> (not res!123355) (not e!163392))))

(assert (=> b!251978 (= res!123355 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6186 lt!126026)))))

(declare-fun b!251979 () Bool)

(assert (=> b!251979 (= e!163392 (arrayContainsKey!0 lt!126026 lt!126115 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61361 (not res!123354)) b!251978))

(assert (= (and b!251978 res!123355) b!251979))

(assert (=> d!61361 m!268013))

(declare-fun m!268393 () Bool)

(assert (=> b!251979 m!268393))

(assert (=> b!251617 d!61361))

(declare-fun b!251980 () Bool)

(declare-fun e!163395 () SeekEntryResult!1091)

(assert (=> b!251980 (= e!163395 Undefined!1091)))

(declare-fun b!251981 () Bool)

(declare-fun c!42444 () Bool)

(declare-fun lt!126335 () (_ BitVec 64))

(assert (=> b!251981 (= c!42444 (= lt!126335 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!163394 () SeekEntryResult!1091)

(declare-fun e!163393 () SeekEntryResult!1091)

(assert (=> b!251981 (= e!163394 e!163393)))

(declare-fun d!61363 () Bool)

(declare-fun lt!126334 () SeekEntryResult!1091)

(assert (=> d!61363 (and (or ((_ is Undefined!1091) lt!126334) (not ((_ is Found!1091) lt!126334)) (and (bvsge (index!6535 lt!126334) #b00000000000000000000000000000000) (bvslt (index!6535 lt!126334) (size!6186 lt!126026)))) (or ((_ is Undefined!1091) lt!126334) ((_ is Found!1091) lt!126334) (not ((_ is MissingZero!1091) lt!126334)) (and (bvsge (index!6534 lt!126334) #b00000000000000000000000000000000) (bvslt (index!6534 lt!126334) (size!6186 lt!126026)))) (or ((_ is Undefined!1091) lt!126334) ((_ is Found!1091) lt!126334) ((_ is MissingZero!1091) lt!126334) (not ((_ is MissingVacant!1091) lt!126334)) (and (bvsge (index!6537 lt!126334) #b00000000000000000000000000000000) (bvslt (index!6537 lt!126334) (size!6186 lt!126026)))) (or ((_ is Undefined!1091) lt!126334) (ite ((_ is Found!1091) lt!126334) (= (select (arr!5840 lt!126026) (index!6535 lt!126334)) (select (arr!5840 lt!126026) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1091) lt!126334) (= (select (arr!5840 lt!126026) (index!6534 lt!126334)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1091) lt!126334) (= (select (arr!5840 lt!126026) (index!6537 lt!126334)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61363 (= lt!126334 e!163395)))

(declare-fun c!42442 () Bool)

(declare-fun lt!126336 () SeekEntryResult!1091)

(assert (=> d!61363 (= c!42442 (and ((_ is Intermediate!1091) lt!126336) (undefined!1903 lt!126336)))))

(assert (=> d!61363 (= lt!126336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5840 lt!126026) #b00000000000000000000000000000000) (mask!10846 thiss!1504)) (select (arr!5840 lt!126026) #b00000000000000000000000000000000) lt!126026 (mask!10846 thiss!1504)))))

(assert (=> d!61363 (validMask!0 (mask!10846 thiss!1504))))

(assert (=> d!61363 (= (seekEntryOrOpen!0 (select (arr!5840 lt!126026) #b00000000000000000000000000000000) lt!126026 (mask!10846 thiss!1504)) lt!126334)))

(declare-fun b!251982 () Bool)

(assert (=> b!251982 (= e!163394 (Found!1091 (index!6536 lt!126336)))))

(declare-fun b!251983 () Bool)

(assert (=> b!251983 (= e!163393 (seekKeyOrZeroReturnVacant!0 (x!24685 lt!126336) (index!6536 lt!126336) (index!6536 lt!126336) (select (arr!5840 lt!126026) #b00000000000000000000000000000000) lt!126026 (mask!10846 thiss!1504)))))

(declare-fun b!251984 () Bool)

(assert (=> b!251984 (= e!163395 e!163394)))

(assert (=> b!251984 (= lt!126335 (select (arr!5840 lt!126026) (index!6536 lt!126336)))))

(declare-fun c!42443 () Bool)

(assert (=> b!251984 (= c!42443 (= lt!126335 (select (arr!5840 lt!126026) #b00000000000000000000000000000000)))))

(declare-fun b!251985 () Bool)

(assert (=> b!251985 (= e!163393 (MissingZero!1091 (index!6536 lt!126336)))))

(assert (= (and d!61363 c!42442) b!251980))

(assert (= (and d!61363 (not c!42442)) b!251984))

(assert (= (and b!251984 c!42443) b!251982))

(assert (= (and b!251984 (not c!42443)) b!251981))

(assert (= (and b!251981 c!42444) b!251985))

(assert (= (and b!251981 (not c!42444)) b!251983))

(declare-fun m!268395 () Bool)

(assert (=> d!61363 m!268395))

(assert (=> d!61363 m!267837))

(declare-fun m!268397 () Bool)

(assert (=> d!61363 m!268397))

(assert (=> d!61363 m!268013))

(declare-fun m!268399 () Bool)

(assert (=> d!61363 m!268399))

(assert (=> d!61363 m!268013))

(assert (=> d!61363 m!268397))

(declare-fun m!268401 () Bool)

(assert (=> d!61363 m!268401))

(declare-fun m!268403 () Bool)

(assert (=> d!61363 m!268403))

(assert (=> b!251983 m!268013))

(declare-fun m!268405 () Bool)

(assert (=> b!251983 m!268405))

(declare-fun m!268407 () Bool)

(assert (=> b!251984 m!268407))

(assert (=> b!251617 d!61363))

(declare-fun b!251987 () Bool)

(declare-fun e!163396 () Bool)

(assert (=> b!251987 (= e!163396 tp_is_empty!6499)))

(declare-fun mapIsEmpty!11058 () Bool)

(declare-fun mapRes!11058 () Bool)

(assert (=> mapIsEmpty!11058 mapRes!11058))

(declare-fun mapNonEmpty!11058 () Bool)

(declare-fun tp!23199 () Bool)

(declare-fun e!163397 () Bool)

(assert (=> mapNonEmpty!11058 (= mapRes!11058 (and tp!23199 e!163397))))

(declare-fun mapValue!11058 () ValueCell!2906)

(declare-fun mapRest!11058 () (Array (_ BitVec 32) ValueCell!2906))

(declare-fun mapKey!11058 () (_ BitVec 32))

(assert (=> mapNonEmpty!11058 (= mapRest!11057 (store mapRest!11058 mapKey!11058 mapValue!11058))))

(declare-fun b!251986 () Bool)

(assert (=> b!251986 (= e!163397 tp_is_empty!6499)))

(declare-fun condMapEmpty!11058 () Bool)

(declare-fun mapDefault!11058 () ValueCell!2906)

(assert (=> mapNonEmpty!11057 (= condMapEmpty!11058 (= mapRest!11057 ((as const (Array (_ BitVec 32) ValueCell!2906)) mapDefault!11058)))))

(assert (=> mapNonEmpty!11057 (= tp!23198 (and e!163396 mapRes!11058))))

(assert (= (and mapNonEmpty!11057 condMapEmpty!11058) mapIsEmpty!11058))

(assert (= (and mapNonEmpty!11057 (not condMapEmpty!11058)) mapNonEmpty!11058))

(assert (= (and mapNonEmpty!11058 ((_ is ValueCellFull!2906) mapValue!11058)) b!251986))

(assert (= (and mapNonEmpty!11057 ((_ is ValueCellFull!2906) mapDefault!11058)) b!251987))

(declare-fun m!268409 () Bool)

(assert (=> mapNonEmpty!11058 m!268409))

(declare-fun b_lambda!8133 () Bool)

(assert (= b_lambda!8131 (or (and b!251397 b_free!6637) b_lambda!8133)))

(declare-fun b_lambda!8135 () Bool)

(assert (= b_lambda!8129 (or (and b!251397 b_free!6637) b_lambda!8135)))

(check-sat (not d!61341) (not b!251969) (not b!251834) (not d!61283) (not d!61337) (not b!251761) b_and!13689 (not b!251971) (not b!251764) (not d!61293) (not b!251921) (not d!61311) (not d!61307) (not b!251756) (not b!251803) (not d!61313) (not d!61301) (not b!251913) (not d!61299) (not d!61295) (not b!251870) (not d!61265) (not d!61281) (not mapNonEmpty!11058) (not b!251833) (not bm!23682) (not b_lambda!8127) (not b_next!6637) (not d!61297) (not bm!23697) (not b!251864) (not b!251882) (not d!61321) (not b!251961) (not b!251863) (not d!61271) (not b!251959) (not d!61359) (not bm!23696) (not b!251875) (not bm!23687) (not b!251962) (not b!251824) (not b!251822) (not b!251830) (not bm!23698) (not b!251771) (not bm!23684) (not d!61287) (not b!251806) (not b!251812) (not b!251805) (not b!251799) (not d!61305) (not b!251783) (not b!251918) (not b!251873) (not d!61315) (not d!61285) (not b!251983) (not b!251765) (not b!251950) (not bm!23694) (not b!251872) (not d!61351) (not d!61303) (not b!251912) (not bm!23699) (not b_lambda!8133) (not b!251832) (not b!251837) (not d!61339) (not b!251810) (not b!251876) (not b!251755) (not d!61249) (not d!61261) (not b!251911) (not b!251825) (not b!251821) (not d!61363) (not b!251967) (not d!61267) (not d!61291) (not b!251977) (not b!251759) (not bm!23688) (not b!251814) (not b!251963) tp_is_empty!6499 (not b!251836) (not d!61323) (not d!61251) (not d!61327) (not b!251871) (not b!251808) (not b!251951) (not d!61355) (not bm!23695) (not d!61357) (not b_lambda!8135) (not d!61309) (not bm!23689) (not d!61259) (not b!251955) (not d!61269) (not b!251919) (not d!61289) (not b!251819) (not d!61335) (not b!251904) (not b!251866) (not b!251820) (not bm!23683) (not b!251979) (not b!251869) (not b!251763))
(check-sat b_and!13689 (not b_next!6637))
