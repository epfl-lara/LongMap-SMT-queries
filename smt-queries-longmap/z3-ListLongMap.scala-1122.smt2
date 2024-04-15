; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22982 () Bool)

(assert start!22982)

(declare-fun b!240769 () Bool)

(declare-fun b_free!6481 () Bool)

(declare-fun b_next!6481 () Bool)

(assert (=> b!240769 (= b_free!6481 (not b_next!6481))))

(declare-fun tp!22647 () Bool)

(declare-fun b_and!13421 () Bool)

(assert (=> b!240769 (= tp!22647 b_and!13421)))

(declare-fun b!240752 () Bool)

(declare-fun e!156254 () Bool)

(declare-fun call!22380 () Bool)

(assert (=> b!240752 (= e!156254 (not call!22380))))

(declare-fun b!240754 () Bool)

(declare-fun e!156248 () Bool)

(declare-fun tp_is_empty!6343 () Bool)

(assert (=> b!240754 (= e!156248 tp_is_empty!6343)))

(declare-fun b!240755 () Bool)

(declare-fun e!156252 () Bool)

(assert (=> b!240755 (= e!156252 tp_is_empty!6343)))

(declare-fun b!240756 () Bool)

(declare-fun e!156250 () Bool)

(declare-fun e!156249 () Bool)

(assert (=> b!240756 (= e!156250 e!156249)))

(declare-fun res!118028 () Bool)

(declare-fun call!22379 () Bool)

(assert (=> b!240756 (= res!118028 call!22379)))

(assert (=> b!240756 (=> (not res!118028) (not e!156249))))

(declare-fun b!240757 () Bool)

(declare-datatypes ((Unit!7401 0))(
  ( (Unit!7402) )
))
(declare-fun e!156259 () Unit!7401)

(declare-fun lt!120912 () Unit!7401)

(assert (=> b!240757 (= e!156259 lt!120912)))

(declare-datatypes ((V!8105 0))(
  ( (V!8106 (val!3216 Int)) )
))
(declare-datatypes ((ValueCell!2828 0))(
  ( (ValueCellFull!2828 (v!5248 V!8105)) (EmptyCell!2828) )
))
(declare-datatypes ((array!11957 0))(
  ( (array!11958 (arr!5679 (Array (_ BitVec 32) ValueCell!2828)) (size!6021 (_ BitVec 32))) )
))
(declare-datatypes ((array!11959 0))(
  ( (array!11960 (arr!5680 (Array (_ BitVec 32) (_ BitVec 64))) (size!6022 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3556 0))(
  ( (LongMapFixedSize!3557 (defaultEntry!4463 Int) (mask!10524 (_ BitVec 32)) (extraKeys!4200 (_ BitVec 32)) (zeroValue!4304 V!8105) (minValue!4304 V!8105) (_size!1827 (_ BitVec 32)) (_keys!6564 array!11959) (_values!4446 array!11957) (_vacant!1827 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3556)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!350 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) Int) Unit!7401)

(assert (=> b!240757 (= lt!120912 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!350 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)))))

(declare-fun c!40093 () Bool)

(declare-datatypes ((SeekEntryResult!1052 0))(
  ( (MissingZero!1052 (index!6378 (_ BitVec 32))) (Found!1052 (index!6379 (_ BitVec 32))) (Intermediate!1052 (undefined!1864 Bool) (index!6380 (_ BitVec 32)) (x!24187 (_ BitVec 32))) (Undefined!1052) (MissingVacant!1052 (index!6381 (_ BitVec 32))) )
))
(declare-fun lt!120913 () SeekEntryResult!1052)

(get-info :version)

(assert (=> b!240757 (= c!40093 ((_ is MissingZero!1052) lt!120913))))

(declare-fun e!156253 () Bool)

(assert (=> b!240757 e!156253))

(declare-fun b!240758 () Bool)

(assert (=> b!240758 (= e!156249 (not call!22380))))

(declare-fun b!240759 () Bool)

(declare-fun e!156246 () Bool)

(declare-fun e!156257 () Bool)

(assert (=> b!240759 (= e!156246 e!156257)))

(declare-fun res!118031 () Bool)

(assert (=> b!240759 (=> (not res!118031) (not e!156257))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!240759 (= res!118031 (inRange!0 index!297 (mask!10524 thiss!1504)))))

(declare-fun lt!120916 () Unit!7401)

(assert (=> b!240759 (= lt!120916 e!156259)))

(declare-fun c!40092 () Bool)

(declare-datatypes ((tuple2!4708 0))(
  ( (tuple2!4709 (_1!2365 (_ BitVec 64)) (_2!2365 V!8105)) )
))
(declare-datatypes ((List!3608 0))(
  ( (Nil!3605) (Cons!3604 (h!4260 tuple2!4708) (t!8594 List!3608)) )
))
(declare-datatypes ((ListLongMap!3611 0))(
  ( (ListLongMap!3612 (toList!1821 List!3608)) )
))
(declare-fun contains!1712 (ListLongMap!3611 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1330 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 32) Int) ListLongMap!3611)

(assert (=> b!240759 (= c!40092 (contains!1712 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) key!932))))

(declare-fun b!240760 () Bool)

(declare-fun Unit!7403 () Unit!7401)

(assert (=> b!240760 (= e!156259 Unit!7403)))

(declare-fun lt!120914 () Unit!7401)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!349 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) Int) Unit!7401)

(assert (=> b!240760 (= lt!120914 (lemmaInListMapThenSeekEntryOrOpenFindsIt!349 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)))))

(assert (=> b!240760 false))

(declare-fun b!240761 () Bool)

(declare-fun e!156256 () Bool)

(declare-fun mapRes!10746 () Bool)

(assert (=> b!240761 (= e!156256 (and e!156252 mapRes!10746))))

(declare-fun condMapEmpty!10746 () Bool)

(declare-fun mapDefault!10746 () ValueCell!2828)

(assert (=> b!240761 (= condMapEmpty!10746 (= (arr!5679 (_values!4446 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2828)) mapDefault!10746)))))

(declare-fun b!240762 () Bool)

(declare-fun res!118034 () Bool)

(assert (=> b!240762 (= res!118034 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6381 lt!120913)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240762 (=> (not res!118034) (not e!156249))))

(declare-fun b!240763 () Bool)

(assert (=> b!240763 (= e!156257 (bvsge (size!6022 (_keys!6564 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun lt!120915 () Unit!7401)

(declare-fun e!156255 () Unit!7401)

(assert (=> b!240763 (= lt!120915 e!156255)))

(declare-fun c!40094 () Bool)

(declare-fun arrayContainsKey!0 (array!11959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240763 (= c!40094 (arrayContainsKey!0 (_keys!6564 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22376 () Bool)

(assert (=> bm!22376 (= call!22380 (arrayContainsKey!0 (_keys!6564 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240764 () Bool)

(declare-fun res!118029 () Bool)

(assert (=> b!240764 (=> (not res!118029) (not e!156254))))

(assert (=> b!240764 (= res!118029 call!22379)))

(assert (=> b!240764 (= e!156253 e!156254)))

(declare-fun b!240765 () Bool)

(declare-fun Unit!7404 () Unit!7401)

(assert (=> b!240765 (= e!156255 Unit!7404)))

(declare-fun mapNonEmpty!10746 () Bool)

(declare-fun tp!22646 () Bool)

(assert (=> mapNonEmpty!10746 (= mapRes!10746 (and tp!22646 e!156248))))

(declare-fun mapValue!10746 () ValueCell!2828)

(declare-fun mapKey!10746 () (_ BitVec 32))

(declare-fun mapRest!10746 () (Array (_ BitVec 32) ValueCell!2828))

(assert (=> mapNonEmpty!10746 (= (arr!5679 (_values!4446 thiss!1504)) (store mapRest!10746 mapKey!10746 mapValue!10746))))

(declare-fun b!240766 () Bool)

(declare-fun res!118033 () Bool)

(declare-fun e!156251 () Bool)

(assert (=> b!240766 (=> (not res!118033) (not e!156251))))

(assert (=> b!240766 (= res!118033 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!118035 () Bool)

(assert (=> start!22982 (=> (not res!118035) (not e!156251))))

(declare-fun valid!1402 (LongMapFixedSize!3556) Bool)

(assert (=> start!22982 (= res!118035 (valid!1402 thiss!1504))))

(assert (=> start!22982 e!156251))

(declare-fun e!156258 () Bool)

(assert (=> start!22982 e!156258))

(assert (=> start!22982 true))

(declare-fun b!240753 () Bool)

(declare-fun Unit!7405 () Unit!7401)

(assert (=> b!240753 (= e!156255 Unit!7405)))

(declare-fun lt!120917 () Unit!7401)

(declare-fun lemmaArrayContainsKeyThenInListMap!163 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) (_ BitVec 32) Int) Unit!7401)

(assert (=> b!240753 (= lt!120917 (lemmaArrayContainsKeyThenInListMap!163 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(assert (=> b!240753 false))

(declare-fun b!240767 () Bool)

(assert (=> b!240767 (= e!156250 ((_ is Undefined!1052) lt!120913))))

(declare-fun mapIsEmpty!10746 () Bool)

(assert (=> mapIsEmpty!10746 mapRes!10746))

(declare-fun bm!22377 () Bool)

(assert (=> bm!22377 (= call!22379 (inRange!0 (ite c!40093 (index!6378 lt!120913) (index!6381 lt!120913)) (mask!10524 thiss!1504)))))

(declare-fun b!240768 () Bool)

(assert (=> b!240768 (= e!156251 e!156246)))

(declare-fun res!118032 () Bool)

(assert (=> b!240768 (=> (not res!118032) (not e!156246))))

(assert (=> b!240768 (= res!118032 (or (= lt!120913 (MissingZero!1052 index!297)) (= lt!120913 (MissingVacant!1052 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11959 (_ BitVec 32)) SeekEntryResult!1052)

(assert (=> b!240768 (= lt!120913 (seekEntryOrOpen!0 key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(declare-fun array_inv!3745 (array!11959) Bool)

(declare-fun array_inv!3746 (array!11957) Bool)

(assert (=> b!240769 (= e!156258 (and tp!22647 tp_is_empty!6343 (array_inv!3745 (_keys!6564 thiss!1504)) (array_inv!3746 (_values!4446 thiss!1504)) e!156256))))

(declare-fun b!240770 () Bool)

(declare-fun c!40095 () Bool)

(assert (=> b!240770 (= c!40095 ((_ is MissingVacant!1052) lt!120913))))

(assert (=> b!240770 (= e!156253 e!156250)))

(declare-fun b!240771 () Bool)

(declare-fun res!118030 () Bool)

(assert (=> b!240771 (=> (not res!118030) (not e!156254))))

(assert (=> b!240771 (= res!118030 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6378 lt!120913)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!22982 res!118035) b!240766))

(assert (= (and b!240766 res!118033) b!240768))

(assert (= (and b!240768 res!118032) b!240759))

(assert (= (and b!240759 c!40092) b!240760))

(assert (= (and b!240759 (not c!40092)) b!240757))

(assert (= (and b!240757 c!40093) b!240764))

(assert (= (and b!240757 (not c!40093)) b!240770))

(assert (= (and b!240764 res!118029) b!240771))

(assert (= (and b!240771 res!118030) b!240752))

(assert (= (and b!240770 c!40095) b!240756))

(assert (= (and b!240770 (not c!40095)) b!240767))

(assert (= (and b!240756 res!118028) b!240762))

(assert (= (and b!240762 res!118034) b!240758))

(assert (= (or b!240764 b!240756) bm!22377))

(assert (= (or b!240752 b!240758) bm!22376))

(assert (= (and b!240759 res!118031) b!240763))

(assert (= (and b!240763 c!40094) b!240753))

(assert (= (and b!240763 (not c!40094)) b!240765))

(assert (= (and b!240761 condMapEmpty!10746) mapIsEmpty!10746))

(assert (= (and b!240761 (not condMapEmpty!10746)) mapNonEmpty!10746))

(assert (= (and mapNonEmpty!10746 ((_ is ValueCellFull!2828) mapValue!10746)) b!240754))

(assert (= (and b!240761 ((_ is ValueCellFull!2828) mapDefault!10746)) b!240755))

(assert (= b!240769 b!240761))

(assert (= start!22982 b!240769))

(declare-fun m!259639 () Bool)

(assert (=> bm!22377 m!259639))

(declare-fun m!259641 () Bool)

(assert (=> b!240759 m!259641))

(declare-fun m!259643 () Bool)

(assert (=> b!240759 m!259643))

(assert (=> b!240759 m!259643))

(declare-fun m!259645 () Bool)

(assert (=> b!240759 m!259645))

(declare-fun m!259647 () Bool)

(assert (=> b!240763 m!259647))

(assert (=> bm!22376 m!259647))

(declare-fun m!259649 () Bool)

(assert (=> start!22982 m!259649))

(declare-fun m!259651 () Bool)

(assert (=> b!240769 m!259651))

(declare-fun m!259653 () Bool)

(assert (=> b!240769 m!259653))

(declare-fun m!259655 () Bool)

(assert (=> b!240760 m!259655))

(declare-fun m!259657 () Bool)

(assert (=> b!240753 m!259657))

(declare-fun m!259659 () Bool)

(assert (=> b!240768 m!259659))

(declare-fun m!259661 () Bool)

(assert (=> mapNonEmpty!10746 m!259661))

(declare-fun m!259663 () Bool)

(assert (=> b!240762 m!259663))

(declare-fun m!259665 () Bool)

(assert (=> b!240771 m!259665))

(declare-fun m!259667 () Bool)

(assert (=> b!240757 m!259667))

(check-sat (not b!240753) (not start!22982) (not b!240769) (not bm!22376) (not b!240760) (not b!240757) (not b_next!6481) (not b!240759) (not b!240768) (not mapNonEmpty!10746) (not b!240763) b_and!13421 (not bm!22377) tp_is_empty!6343)
(check-sat b_and!13421 (not b_next!6481))
(get-model)

(declare-fun d!59649 () Bool)

(assert (=> d!59649 (= (inRange!0 (ite c!40093 (index!6378 lt!120913) (index!6381 lt!120913)) (mask!10524 thiss!1504)) (and (bvsge (ite c!40093 (index!6378 lt!120913) (index!6381 lt!120913)) #b00000000000000000000000000000000) (bvslt (ite c!40093 (index!6378 lt!120913) (index!6381 lt!120913)) (bvadd (mask!10524 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22377 d!59649))

(declare-fun d!59651 () Bool)

(declare-fun e!156346 () Bool)

(assert (=> d!59651 e!156346))

(declare-fun res!118088 () Bool)

(assert (=> d!59651 (=> (not res!118088) (not e!156346))))

(declare-fun lt!120959 () SeekEntryResult!1052)

(assert (=> d!59651 (= res!118088 ((_ is Found!1052) lt!120959))))

(assert (=> d!59651 (= lt!120959 (seekEntryOrOpen!0 key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(declare-fun lt!120958 () Unit!7401)

(declare-fun choose!1123 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) Int) Unit!7401)

(assert (=> d!59651 (= lt!120958 (choose!1123 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!59651 (validMask!0 (mask!10524 thiss!1504))))

(assert (=> d!59651 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!349 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)) lt!120958)))

(declare-fun b!240896 () Bool)

(declare-fun res!118089 () Bool)

(assert (=> b!240896 (=> (not res!118089) (not e!156346))))

(assert (=> b!240896 (= res!118089 (inRange!0 (index!6379 lt!120959) (mask!10524 thiss!1504)))))

(declare-fun b!240897 () Bool)

(assert (=> b!240897 (= e!156346 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6379 lt!120959)) key!932))))

(assert (=> b!240897 (and (bvsge (index!6379 lt!120959) #b00000000000000000000000000000000) (bvslt (index!6379 lt!120959) (size!6022 (_keys!6564 thiss!1504))))))

(assert (= (and d!59651 res!118088) b!240896))

(assert (= (and b!240896 res!118089) b!240897))

(assert (=> d!59651 m!259659))

(declare-fun m!259729 () Bool)

(assert (=> d!59651 m!259729))

(declare-fun m!259731 () Bool)

(assert (=> d!59651 m!259731))

(declare-fun m!259733 () Bool)

(assert (=> b!240896 m!259733))

(declare-fun m!259735 () Bool)

(assert (=> b!240897 m!259735))

(assert (=> b!240760 d!59651))

(declare-fun d!59653 () Bool)

(assert (=> d!59653 (= (inRange!0 index!297 (mask!10524 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10524 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!240759 d!59653))

(declare-fun d!59655 () Bool)

(declare-fun e!156351 () Bool)

(assert (=> d!59655 e!156351))

(declare-fun res!118092 () Bool)

(assert (=> d!59655 (=> res!118092 e!156351)))

(declare-fun lt!120968 () Bool)

(assert (=> d!59655 (= res!118092 (not lt!120968))))

(declare-fun lt!120971 () Bool)

(assert (=> d!59655 (= lt!120968 lt!120971)))

(declare-fun lt!120970 () Unit!7401)

(declare-fun e!156352 () Unit!7401)

(assert (=> d!59655 (= lt!120970 e!156352)))

(declare-fun c!40122 () Bool)

(assert (=> d!59655 (= c!40122 lt!120971)))

(declare-fun containsKey!269 (List!3608 (_ BitVec 64)) Bool)

(assert (=> d!59655 (= lt!120971 (containsKey!269 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(assert (=> d!59655 (= (contains!1712 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) key!932) lt!120968)))

(declare-fun b!240904 () Bool)

(declare-fun lt!120969 () Unit!7401)

(assert (=> b!240904 (= e!156352 lt!120969)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!218 (List!3608 (_ BitVec 64)) Unit!7401)

(assert (=> b!240904 (= lt!120969 (lemmaContainsKeyImpliesGetValueByKeyDefined!218 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(declare-datatypes ((Option!283 0))(
  ( (Some!282 (v!5251 V!8105)) (None!281) )
))
(declare-fun isDefined!219 (Option!283) Bool)

(declare-fun getValueByKey!277 (List!3608 (_ BitVec 64)) Option!283)

(assert (=> b!240904 (isDefined!219 (getValueByKey!277 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(declare-fun b!240905 () Bool)

(declare-fun Unit!7416 () Unit!7401)

(assert (=> b!240905 (= e!156352 Unit!7416)))

(declare-fun b!240906 () Bool)

(assert (=> b!240906 (= e!156351 (isDefined!219 (getValueByKey!277 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932)))))

(assert (= (and d!59655 c!40122) b!240904))

(assert (= (and d!59655 (not c!40122)) b!240905))

(assert (= (and d!59655 (not res!118092)) b!240906))

(declare-fun m!259737 () Bool)

(assert (=> d!59655 m!259737))

(declare-fun m!259739 () Bool)

(assert (=> b!240904 m!259739))

(declare-fun m!259741 () Bool)

(assert (=> b!240904 m!259741))

(assert (=> b!240904 m!259741))

(declare-fun m!259743 () Bool)

(assert (=> b!240904 m!259743))

(assert (=> b!240906 m!259741))

(assert (=> b!240906 m!259741))

(assert (=> b!240906 m!259743))

(assert (=> b!240759 d!59655))

(declare-fun b!240949 () Bool)

(declare-fun e!156380 () Bool)

(declare-fun e!156388 () Bool)

(assert (=> b!240949 (= e!156380 e!156388)))

(declare-fun res!118112 () Bool)

(assert (=> b!240949 (=> (not res!118112) (not e!156388))))

(declare-fun lt!121017 () ListLongMap!3611)

(assert (=> b!240949 (= res!118112 (contains!1712 lt!121017 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!240949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun b!240950 () Bool)

(declare-fun e!156387 () Bool)

(declare-fun call!22413 () Bool)

(assert (=> b!240950 (= e!156387 (not call!22413))))

(declare-fun call!22411 () ListLongMap!3611)

(declare-fun call!22412 () ListLongMap!3611)

(declare-fun c!40135 () Bool)

(declare-fun call!22410 () ListLongMap!3611)

(declare-fun call!22407 () ListLongMap!3611)

(declare-fun bm!22404 () Bool)

(declare-fun c!40139 () Bool)

(declare-fun +!654 (ListLongMap!3611 tuple2!4708) ListLongMap!3611)

(assert (=> bm!22404 (= call!22411 (+!654 (ite c!40139 call!22407 (ite c!40135 call!22412 call!22410)) (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(declare-fun b!240951 () Bool)

(declare-fun e!156386 () ListLongMap!3611)

(declare-fun e!156383 () ListLongMap!3611)

(assert (=> b!240951 (= e!156386 e!156383)))

(assert (=> b!240951 (= c!40135 (and (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!240952 () Bool)

(declare-fun e!156389 () Bool)

(declare-fun apply!221 (ListLongMap!3611 (_ BitVec 64)) V!8105)

(assert (=> b!240952 (= e!156389 (= (apply!221 lt!121017 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4304 thiss!1504)))))

(declare-fun b!240953 () Bool)

(declare-fun res!118116 () Bool)

(declare-fun e!156390 () Bool)

(assert (=> b!240953 (=> (not res!118116) (not e!156390))))

(assert (=> b!240953 (= res!118116 e!156380)))

(declare-fun res!118118 () Bool)

(assert (=> b!240953 (=> res!118118 e!156380)))

(declare-fun e!156382 () Bool)

(assert (=> b!240953 (= res!118118 (not e!156382))))

(declare-fun res!118117 () Bool)

(assert (=> b!240953 (=> (not res!118117) (not e!156382))))

(assert (=> b!240953 (= res!118117 (bvslt #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun d!59657 () Bool)

(assert (=> d!59657 e!156390))

(declare-fun res!118119 () Bool)

(assert (=> d!59657 (=> (not res!118119) (not e!156390))))

(assert (=> d!59657 (= res!118119 (or (bvsge #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))))

(declare-fun lt!121016 () ListLongMap!3611)

(assert (=> d!59657 (= lt!121017 lt!121016)))

(declare-fun lt!121034 () Unit!7401)

(declare-fun e!156381 () Unit!7401)

(assert (=> d!59657 (= lt!121034 e!156381)))

(declare-fun c!40136 () Bool)

(declare-fun e!156385 () Bool)

(assert (=> d!59657 (= c!40136 e!156385)))

(declare-fun res!118114 () Bool)

(assert (=> d!59657 (=> (not res!118114) (not e!156385))))

(assert (=> d!59657 (= res!118114 (bvslt #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(assert (=> d!59657 (= lt!121016 e!156386)))

(assert (=> d!59657 (= c!40139 (and (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59657 (validMask!0 (mask!10524 thiss!1504))))

(assert (=> d!59657 (= (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) lt!121017)))

(declare-fun b!240954 () Bool)

(declare-fun e!156384 () Bool)

(declare-fun e!156391 () Bool)

(assert (=> b!240954 (= e!156384 e!156391)))

(declare-fun res!118113 () Bool)

(declare-fun call!22409 () Bool)

(assert (=> b!240954 (= res!118113 call!22409)))

(assert (=> b!240954 (=> (not res!118113) (not e!156391))))

(declare-fun b!240955 () Bool)

(declare-fun e!156379 () ListLongMap!3611)

(declare-fun call!22408 () ListLongMap!3611)

(assert (=> b!240955 (= e!156379 call!22408)))

(declare-fun b!240956 () Bool)

(declare-fun lt!121030 () Unit!7401)

(assert (=> b!240956 (= e!156381 lt!121030)))

(declare-fun lt!121023 () ListLongMap!3611)

(declare-fun getCurrentListMapNoExtraKeys!537 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 32) Int) ListLongMap!3611)

(assert (=> b!240956 (= lt!121023 (getCurrentListMapNoExtraKeys!537 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun lt!121018 () (_ BitVec 64))

(assert (=> b!240956 (= lt!121018 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121032 () (_ BitVec 64))

(assert (=> b!240956 (= lt!121032 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121029 () Unit!7401)

(declare-fun addStillContains!197 (ListLongMap!3611 (_ BitVec 64) V!8105 (_ BitVec 64)) Unit!7401)

(assert (=> b!240956 (= lt!121029 (addStillContains!197 lt!121023 lt!121018 (zeroValue!4304 thiss!1504) lt!121032))))

(assert (=> b!240956 (contains!1712 (+!654 lt!121023 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504))) lt!121032)))

(declare-fun lt!121036 () Unit!7401)

(assert (=> b!240956 (= lt!121036 lt!121029)))

(declare-fun lt!121033 () ListLongMap!3611)

(assert (=> b!240956 (= lt!121033 (getCurrentListMapNoExtraKeys!537 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun lt!121019 () (_ BitVec 64))

(assert (=> b!240956 (= lt!121019 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121022 () (_ BitVec 64))

(assert (=> b!240956 (= lt!121022 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121024 () Unit!7401)

(declare-fun addApplyDifferent!197 (ListLongMap!3611 (_ BitVec 64) V!8105 (_ BitVec 64)) Unit!7401)

(assert (=> b!240956 (= lt!121024 (addApplyDifferent!197 lt!121033 lt!121019 (minValue!4304 thiss!1504) lt!121022))))

(assert (=> b!240956 (= (apply!221 (+!654 lt!121033 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504))) lt!121022) (apply!221 lt!121033 lt!121022))))

(declare-fun lt!121035 () Unit!7401)

(assert (=> b!240956 (= lt!121035 lt!121024)))

(declare-fun lt!121020 () ListLongMap!3611)

(assert (=> b!240956 (= lt!121020 (getCurrentListMapNoExtraKeys!537 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun lt!121026 () (_ BitVec 64))

(assert (=> b!240956 (= lt!121026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121031 () (_ BitVec 64))

(assert (=> b!240956 (= lt!121031 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121021 () Unit!7401)

(assert (=> b!240956 (= lt!121021 (addApplyDifferent!197 lt!121020 lt!121026 (zeroValue!4304 thiss!1504) lt!121031))))

(assert (=> b!240956 (= (apply!221 (+!654 lt!121020 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504))) lt!121031) (apply!221 lt!121020 lt!121031))))

(declare-fun lt!121025 () Unit!7401)

(assert (=> b!240956 (= lt!121025 lt!121021)))

(declare-fun lt!121037 () ListLongMap!3611)

(assert (=> b!240956 (= lt!121037 (getCurrentListMapNoExtraKeys!537 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun lt!121028 () (_ BitVec 64))

(assert (=> b!240956 (= lt!121028 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121027 () (_ BitVec 64))

(assert (=> b!240956 (= lt!121027 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!240956 (= lt!121030 (addApplyDifferent!197 lt!121037 lt!121028 (minValue!4304 thiss!1504) lt!121027))))

(assert (=> b!240956 (= (apply!221 (+!654 lt!121037 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504))) lt!121027) (apply!221 lt!121037 lt!121027))))

(declare-fun bm!22405 () Bool)

(assert (=> bm!22405 (= call!22408 call!22411)))

(declare-fun b!240957 () Bool)

(declare-fun c!40138 () Bool)

(assert (=> b!240957 (= c!40138 (and (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!240957 (= e!156383 e!156379)))

(declare-fun b!240958 () Bool)

(assert (=> b!240958 (= e!156379 call!22410)))

(declare-fun b!240959 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!240959 (= e!156382 (validKeyInArray!0 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22406 () Bool)

(assert (=> bm!22406 (= call!22407 (getCurrentListMapNoExtraKeys!537 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(declare-fun b!240960 () Bool)

(assert (=> b!240960 (= e!156386 (+!654 call!22411 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))

(declare-fun bm!22407 () Bool)

(assert (=> bm!22407 (= call!22409 (contains!1712 lt!121017 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240961 () Bool)

(assert (=> b!240961 (= e!156390 e!156387)))

(declare-fun c!40137 () Bool)

(assert (=> b!240961 (= c!40137 (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!240962 () Bool)

(assert (=> b!240962 (= e!156384 (not call!22409))))

(declare-fun b!240963 () Bool)

(assert (=> b!240963 (= e!156383 call!22408)))

(declare-fun bm!22408 () Bool)

(assert (=> bm!22408 (= call!22413 (contains!1712 lt!121017 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22409 () Bool)

(assert (=> bm!22409 (= call!22410 call!22412)))

(declare-fun bm!22410 () Bool)

(assert (=> bm!22410 (= call!22412 call!22407)))

(declare-fun b!240964 () Bool)

(declare-fun res!118111 () Bool)

(assert (=> b!240964 (=> (not res!118111) (not e!156390))))

(assert (=> b!240964 (= res!118111 e!156384)))

(declare-fun c!40140 () Bool)

(assert (=> b!240964 (= c!40140 (not (= (bvand (extraKeys!4200 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!240965 () Bool)

(assert (=> b!240965 (= e!156385 (validKeyInArray!0 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!240966 () Bool)

(declare-fun get!2912 (ValueCell!2828 V!8105) V!8105)

(declare-fun dynLambda!555 (Int (_ BitVec 64)) V!8105)

(assert (=> b!240966 (= e!156388 (= (apply!221 lt!121017 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)) (get!2912 (select (arr!5679 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!555 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!240966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6021 (_values!4446 thiss!1504))))))

(assert (=> b!240966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun b!240967 () Bool)

(assert (=> b!240967 (= e!156391 (= (apply!221 lt!121017 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4304 thiss!1504)))))

(declare-fun b!240968 () Bool)

(declare-fun Unit!7417 () Unit!7401)

(assert (=> b!240968 (= e!156381 Unit!7417)))

(declare-fun b!240969 () Bool)

(assert (=> b!240969 (= e!156387 e!156389)))

(declare-fun res!118115 () Bool)

(assert (=> b!240969 (= res!118115 call!22413)))

(assert (=> b!240969 (=> (not res!118115) (not e!156389))))

(assert (= (and d!59657 c!40139) b!240960))

(assert (= (and d!59657 (not c!40139)) b!240951))

(assert (= (and b!240951 c!40135) b!240963))

(assert (= (and b!240951 (not c!40135)) b!240957))

(assert (= (and b!240957 c!40138) b!240955))

(assert (= (and b!240957 (not c!40138)) b!240958))

(assert (= (or b!240955 b!240958) bm!22409))

(assert (= (or b!240963 bm!22409) bm!22410))

(assert (= (or b!240963 b!240955) bm!22405))

(assert (= (or b!240960 bm!22410) bm!22406))

(assert (= (or b!240960 bm!22405) bm!22404))

(assert (= (and d!59657 res!118114) b!240965))

(assert (= (and d!59657 c!40136) b!240956))

(assert (= (and d!59657 (not c!40136)) b!240968))

(assert (= (and d!59657 res!118119) b!240953))

(assert (= (and b!240953 res!118117) b!240959))

(assert (= (and b!240953 (not res!118118)) b!240949))

(assert (= (and b!240949 res!118112) b!240966))

(assert (= (and b!240953 res!118116) b!240964))

(assert (= (and b!240964 c!40140) b!240954))

(assert (= (and b!240964 (not c!40140)) b!240962))

(assert (= (and b!240954 res!118113) b!240967))

(assert (= (or b!240954 b!240962) bm!22407))

(assert (= (and b!240964 res!118111) b!240961))

(assert (= (and b!240961 c!40137) b!240969))

(assert (= (and b!240961 (not c!40137)) b!240950))

(assert (= (and b!240969 res!118115) b!240952))

(assert (= (or b!240969 b!240950) bm!22408))

(declare-fun b_lambda!7961 () Bool)

(assert (=> (not b_lambda!7961) (not b!240966)))

(declare-fun t!8598 () Bool)

(declare-fun tb!2947 () Bool)

(assert (=> (and b!240769 (= (defaultEntry!4463 thiss!1504) (defaultEntry!4463 thiss!1504)) t!8598) tb!2947))

(declare-fun result!5179 () Bool)

(assert (=> tb!2947 (= result!5179 tp_is_empty!6343)))

(assert (=> b!240966 t!8598))

(declare-fun b_and!13427 () Bool)

(assert (= b_and!13421 (and (=> t!8598 result!5179) b_and!13427)))

(declare-fun m!259745 () Bool)

(assert (=> b!240960 m!259745))

(declare-fun m!259747 () Bool)

(assert (=> b!240965 m!259747))

(assert (=> b!240965 m!259747))

(declare-fun m!259749 () Bool)

(assert (=> b!240965 m!259749))

(declare-fun m!259751 () Bool)

(assert (=> bm!22407 m!259751))

(assert (=> b!240959 m!259747))

(assert (=> b!240959 m!259747))

(assert (=> b!240959 m!259749))

(declare-fun m!259753 () Bool)

(assert (=> b!240956 m!259753))

(declare-fun m!259755 () Bool)

(assert (=> b!240956 m!259755))

(declare-fun m!259757 () Bool)

(assert (=> b!240956 m!259757))

(assert (=> b!240956 m!259747))

(declare-fun m!259759 () Bool)

(assert (=> b!240956 m!259759))

(assert (=> b!240956 m!259759))

(declare-fun m!259761 () Bool)

(assert (=> b!240956 m!259761))

(declare-fun m!259763 () Bool)

(assert (=> b!240956 m!259763))

(declare-fun m!259765 () Bool)

(assert (=> b!240956 m!259765))

(declare-fun m!259767 () Bool)

(assert (=> b!240956 m!259767))

(declare-fun m!259769 () Bool)

(assert (=> b!240956 m!259769))

(declare-fun m!259771 () Bool)

(assert (=> b!240956 m!259771))

(declare-fun m!259773 () Bool)

(assert (=> b!240956 m!259773))

(declare-fun m!259775 () Bool)

(assert (=> b!240956 m!259775))

(declare-fun m!259777 () Bool)

(assert (=> b!240956 m!259777))

(assert (=> b!240956 m!259773))

(declare-fun m!259779 () Bool)

(assert (=> b!240956 m!259779))

(assert (=> b!240956 m!259769))

(declare-fun m!259781 () Bool)

(assert (=> b!240956 m!259781))

(declare-fun m!259783 () Bool)

(assert (=> b!240956 m!259783))

(assert (=> b!240956 m!259763))

(declare-fun m!259785 () Bool)

(assert (=> bm!22408 m!259785))

(assert (=> d!59657 m!259731))

(declare-fun m!259787 () Bool)

(assert (=> b!240967 m!259787))

(assert (=> b!240949 m!259747))

(assert (=> b!240949 m!259747))

(declare-fun m!259789 () Bool)

(assert (=> b!240949 m!259789))

(assert (=> bm!22406 m!259757))

(declare-fun m!259791 () Bool)

(assert (=> b!240966 m!259791))

(assert (=> b!240966 m!259747))

(assert (=> b!240966 m!259747))

(declare-fun m!259793 () Bool)

(assert (=> b!240966 m!259793))

(declare-fun m!259795 () Bool)

(assert (=> b!240966 m!259795))

(assert (=> b!240966 m!259791))

(assert (=> b!240966 m!259795))

(declare-fun m!259797 () Bool)

(assert (=> b!240966 m!259797))

(declare-fun m!259799 () Bool)

(assert (=> b!240952 m!259799))

(declare-fun m!259801 () Bool)

(assert (=> bm!22404 m!259801))

(assert (=> b!240759 d!59657))

(declare-fun d!59659 () Bool)

(declare-fun res!118124 () Bool)

(declare-fun e!156396 () Bool)

(assert (=> d!59659 (=> res!118124 e!156396)))

(assert (=> d!59659 (= res!118124 (= (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!59659 (= (arrayContainsKey!0 (_keys!6564 thiss!1504) key!932 #b00000000000000000000000000000000) e!156396)))

(declare-fun b!240976 () Bool)

(declare-fun e!156397 () Bool)

(assert (=> b!240976 (= e!156396 e!156397)))

(declare-fun res!118125 () Bool)

(assert (=> b!240976 (=> (not res!118125) (not e!156397))))

(assert (=> b!240976 (= res!118125 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun b!240977 () Bool)

(assert (=> b!240977 (= e!156397 (arrayContainsKey!0 (_keys!6564 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!59659 (not res!118124)) b!240976))

(assert (= (and b!240976 res!118125) b!240977))

(assert (=> d!59659 m!259747))

(declare-fun m!259803 () Bool)

(assert (=> b!240977 m!259803))

(assert (=> bm!22376 d!59659))

(declare-fun d!59661 () Bool)

(assert (=> d!59661 (contains!1712 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) key!932)))

(declare-fun lt!121040 () Unit!7401)

(declare-fun choose!1124 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) (_ BitVec 32) Int) Unit!7401)

(assert (=> d!59661 (= lt!121040 (choose!1124 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))

(assert (=> d!59661 (validMask!0 (mask!10524 thiss!1504))))

(assert (=> d!59661 (= (lemmaArrayContainsKeyThenInListMap!163 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) lt!121040)))

(declare-fun bs!8809 () Bool)

(assert (= bs!8809 d!59661))

(assert (=> bs!8809 m!259643))

(assert (=> bs!8809 m!259643))

(assert (=> bs!8809 m!259645))

(declare-fun m!259805 () Bool)

(assert (=> bs!8809 m!259805))

(assert (=> bs!8809 m!259731))

(assert (=> b!240753 d!59661))

(assert (=> b!240763 d!59659))

(declare-fun d!59663 () Bool)

(assert (=> d!59663 (= (array_inv!3745 (_keys!6564 thiss!1504)) (bvsge (size!6022 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!240769 d!59663))

(declare-fun d!59665 () Bool)

(assert (=> d!59665 (= (array_inv!3746 (_values!4446 thiss!1504)) (bvsge (size!6021 (_values!4446 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!240769 d!59665))

(declare-fun b!240994 () Bool)

(declare-fun e!156408 () Bool)

(declare-fun e!156406 () Bool)

(assert (=> b!240994 (= e!156408 e!156406)))

(declare-fun res!118134 () Bool)

(declare-fun call!22418 () Bool)

(assert (=> b!240994 (= res!118134 call!22418)))

(assert (=> b!240994 (=> (not res!118134) (not e!156406))))

(declare-fun b!240995 () Bool)

(declare-fun call!22419 () Bool)

(assert (=> b!240995 (= e!156406 (not call!22419))))

(declare-fun b!240996 () Bool)

(declare-fun e!156407 () Bool)

(assert (=> b!240996 (= e!156408 e!156407)))

(declare-fun c!40146 () Bool)

(declare-fun lt!121045 () SeekEntryResult!1052)

(assert (=> b!240996 (= c!40146 ((_ is MissingVacant!1052) lt!121045))))

(declare-fun b!240997 () Bool)

(declare-fun e!156409 () Bool)

(assert (=> b!240997 (= e!156409 (not call!22419))))

(declare-fun bm!22415 () Bool)

(declare-fun c!40145 () Bool)

(assert (=> bm!22415 (= call!22418 (inRange!0 (ite c!40145 (index!6378 lt!121045) (index!6381 lt!121045)) (mask!10524 thiss!1504)))))

(declare-fun b!240998 () Bool)

(assert (=> b!240998 (= e!156407 ((_ is Undefined!1052) lt!121045))))

(declare-fun b!240999 () Bool)

(declare-fun res!118136 () Bool)

(assert (=> b!240999 (=> (not res!118136) (not e!156409))))

(assert (=> b!240999 (= res!118136 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6381 lt!121045)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240999 (and (bvsge (index!6381 lt!121045) #b00000000000000000000000000000000) (bvslt (index!6381 lt!121045) (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun d!59667 () Bool)

(assert (=> d!59667 e!156408))

(assert (=> d!59667 (= c!40145 ((_ is MissingZero!1052) lt!121045))))

(assert (=> d!59667 (= lt!121045 (seekEntryOrOpen!0 key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(declare-fun lt!121046 () Unit!7401)

(declare-fun choose!1125 (array!11959 array!11957 (_ BitVec 32) (_ BitVec 32) V!8105 V!8105 (_ BitVec 64) Int) Unit!7401)

(assert (=> d!59667 (= lt!121046 (choose!1125 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)))))

(assert (=> d!59667 (validMask!0 (mask!10524 thiss!1504))))

(assert (=> d!59667 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!350 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)) lt!121046)))

(declare-fun b!241000 () Bool)

(declare-fun res!118135 () Bool)

(assert (=> b!241000 (=> (not res!118135) (not e!156409))))

(assert (=> b!241000 (= res!118135 call!22418)))

(assert (=> b!241000 (= e!156407 e!156409)))

(declare-fun bm!22416 () Bool)

(assert (=> bm!22416 (= call!22419 (arrayContainsKey!0 (_keys!6564 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241001 () Bool)

(assert (=> b!241001 (and (bvsge (index!6378 lt!121045) #b00000000000000000000000000000000) (bvslt (index!6378 lt!121045) (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun res!118137 () Bool)

(assert (=> b!241001 (= res!118137 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6378 lt!121045)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241001 (=> (not res!118137) (not e!156406))))

(assert (= (and d!59667 c!40145) b!240994))

(assert (= (and d!59667 (not c!40145)) b!240996))

(assert (= (and b!240994 res!118134) b!241001))

(assert (= (and b!241001 res!118137) b!240995))

(assert (= (and b!240996 c!40146) b!241000))

(assert (= (and b!240996 (not c!40146)) b!240998))

(assert (= (and b!241000 res!118135) b!240999))

(assert (= (and b!240999 res!118136) b!240997))

(assert (= (or b!240994 b!241000) bm!22415))

(assert (= (or b!240995 b!240997) bm!22416))

(declare-fun m!259807 () Bool)

(assert (=> bm!22415 m!259807))

(declare-fun m!259809 () Bool)

(assert (=> b!241001 m!259809))

(assert (=> bm!22416 m!259647))

(declare-fun m!259811 () Bool)

(assert (=> b!240999 m!259811))

(assert (=> d!59667 m!259659))

(declare-fun m!259813 () Bool)

(assert (=> d!59667 m!259813))

(assert (=> d!59667 m!259731))

(assert (=> b!240757 d!59667))

(declare-fun d!59669 () Bool)

(declare-fun res!118144 () Bool)

(declare-fun e!156412 () Bool)

(assert (=> d!59669 (=> (not res!118144) (not e!156412))))

(declare-fun simpleValid!244 (LongMapFixedSize!3556) Bool)

(assert (=> d!59669 (= res!118144 (simpleValid!244 thiss!1504))))

(assert (=> d!59669 (= (valid!1402 thiss!1504) e!156412)))

(declare-fun b!241008 () Bool)

(declare-fun res!118145 () Bool)

(assert (=> b!241008 (=> (not res!118145) (not e!156412))))

(declare-fun arrayCountValidKeys!0 (array!11959 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!241008 (= res!118145 (= (arrayCountValidKeys!0 (_keys!6564 thiss!1504) #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))) (_size!1827 thiss!1504)))))

(declare-fun b!241009 () Bool)

(declare-fun res!118146 () Bool)

(assert (=> b!241009 (=> (not res!118146) (not e!156412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11959 (_ BitVec 32)) Bool)

(assert (=> b!241009 (= res!118146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(declare-fun b!241010 () Bool)

(declare-datatypes ((List!3611 0))(
  ( (Nil!3608) (Cons!3607 (h!4263 (_ BitVec 64)) (t!8599 List!3611)) )
))
(declare-fun arrayNoDuplicates!0 (array!11959 (_ BitVec 32) List!3611) Bool)

(assert (=> b!241010 (= e!156412 (arrayNoDuplicates!0 (_keys!6564 thiss!1504) #b00000000000000000000000000000000 Nil!3608))))

(assert (= (and d!59669 res!118144) b!241008))

(assert (= (and b!241008 res!118145) b!241009))

(assert (= (and b!241009 res!118146) b!241010))

(declare-fun m!259815 () Bool)

(assert (=> d!59669 m!259815))

(declare-fun m!259817 () Bool)

(assert (=> b!241008 m!259817))

(declare-fun m!259819 () Bool)

(assert (=> b!241009 m!259819))

(declare-fun m!259821 () Bool)

(assert (=> b!241010 m!259821))

(assert (=> start!22982 d!59669))

(declare-fun b!241023 () Bool)

(declare-fun e!156421 () SeekEntryResult!1052)

(assert (=> b!241023 (= e!156421 Undefined!1052)))

(declare-fun b!241024 () Bool)

(declare-fun e!156420 () SeekEntryResult!1052)

(assert (=> b!241024 (= e!156421 e!156420)))

(declare-fun lt!121054 () (_ BitVec 64))

(declare-fun lt!121055 () SeekEntryResult!1052)

(assert (=> b!241024 (= lt!121054 (select (arr!5680 (_keys!6564 thiss!1504)) (index!6380 lt!121055)))))

(declare-fun c!40154 () Bool)

(assert (=> b!241024 (= c!40154 (= lt!121054 key!932))))

(declare-fun b!241025 () Bool)

(assert (=> b!241025 (= e!156420 (Found!1052 (index!6380 lt!121055)))))

(declare-fun d!59671 () Bool)

(declare-fun lt!121053 () SeekEntryResult!1052)

(assert (=> d!59671 (and (or ((_ is Undefined!1052) lt!121053) (not ((_ is Found!1052) lt!121053)) (and (bvsge (index!6379 lt!121053) #b00000000000000000000000000000000) (bvslt (index!6379 lt!121053) (size!6022 (_keys!6564 thiss!1504))))) (or ((_ is Undefined!1052) lt!121053) ((_ is Found!1052) lt!121053) (not ((_ is MissingZero!1052) lt!121053)) (and (bvsge (index!6378 lt!121053) #b00000000000000000000000000000000) (bvslt (index!6378 lt!121053) (size!6022 (_keys!6564 thiss!1504))))) (or ((_ is Undefined!1052) lt!121053) ((_ is Found!1052) lt!121053) ((_ is MissingZero!1052) lt!121053) (not ((_ is MissingVacant!1052) lt!121053)) (and (bvsge (index!6381 lt!121053) #b00000000000000000000000000000000) (bvslt (index!6381 lt!121053) (size!6022 (_keys!6564 thiss!1504))))) (or ((_ is Undefined!1052) lt!121053) (ite ((_ is Found!1052) lt!121053) (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6379 lt!121053)) key!932) (ite ((_ is MissingZero!1052) lt!121053) (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6378 lt!121053)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1052) lt!121053) (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6381 lt!121053)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59671 (= lt!121053 e!156421)))

(declare-fun c!40153 () Bool)

(assert (=> d!59671 (= c!40153 (and ((_ is Intermediate!1052) lt!121055) (undefined!1864 lt!121055)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11959 (_ BitVec 32)) SeekEntryResult!1052)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59671 (= lt!121055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10524 thiss!1504)) key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(assert (=> d!59671 (validMask!0 (mask!10524 thiss!1504))))

(assert (=> d!59671 (= (seekEntryOrOpen!0 key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)) lt!121053)))

(declare-fun b!241026 () Bool)

(declare-fun c!40155 () Bool)

(assert (=> b!241026 (= c!40155 (= lt!121054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156419 () SeekEntryResult!1052)

(assert (=> b!241026 (= e!156420 e!156419)))

(declare-fun b!241027 () Bool)

(assert (=> b!241027 (= e!156419 (MissingZero!1052 (index!6380 lt!121055)))))

(declare-fun b!241028 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11959 (_ BitVec 32)) SeekEntryResult!1052)

(assert (=> b!241028 (= e!156419 (seekKeyOrZeroReturnVacant!0 (x!24187 lt!121055) (index!6380 lt!121055) (index!6380 lt!121055) key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(assert (= (and d!59671 c!40153) b!241023))

(assert (= (and d!59671 (not c!40153)) b!241024))

(assert (= (and b!241024 c!40154) b!241025))

(assert (= (and b!241024 (not c!40154)) b!241026))

(assert (= (and b!241026 c!40155) b!241027))

(assert (= (and b!241026 (not c!40155)) b!241028))

(declare-fun m!259823 () Bool)

(assert (=> b!241024 m!259823))

(assert (=> d!59671 m!259731))

(declare-fun m!259825 () Bool)

(assert (=> d!59671 m!259825))

(declare-fun m!259827 () Bool)

(assert (=> d!59671 m!259827))

(declare-fun m!259829 () Bool)

(assert (=> d!59671 m!259829))

(declare-fun m!259831 () Bool)

(assert (=> d!59671 m!259831))

(declare-fun m!259833 () Bool)

(assert (=> d!59671 m!259833))

(assert (=> d!59671 m!259827))

(declare-fun m!259835 () Bool)

(assert (=> b!241028 m!259835))

(assert (=> b!240768 d!59671))

(declare-fun mapIsEmpty!10755 () Bool)

(declare-fun mapRes!10755 () Bool)

(assert (=> mapIsEmpty!10755 mapRes!10755))

(declare-fun b!241036 () Bool)

(declare-fun e!156427 () Bool)

(assert (=> b!241036 (= e!156427 tp_is_empty!6343)))

(declare-fun b!241035 () Bool)

(declare-fun e!156426 () Bool)

(assert (=> b!241035 (= e!156426 tp_is_empty!6343)))

(declare-fun mapNonEmpty!10755 () Bool)

(declare-fun tp!22662 () Bool)

(assert (=> mapNonEmpty!10755 (= mapRes!10755 (and tp!22662 e!156426))))

(declare-fun mapKey!10755 () (_ BitVec 32))

(declare-fun mapValue!10755 () ValueCell!2828)

(declare-fun mapRest!10755 () (Array (_ BitVec 32) ValueCell!2828))

(assert (=> mapNonEmpty!10755 (= mapRest!10746 (store mapRest!10755 mapKey!10755 mapValue!10755))))

(declare-fun condMapEmpty!10755 () Bool)

(declare-fun mapDefault!10755 () ValueCell!2828)

(assert (=> mapNonEmpty!10746 (= condMapEmpty!10755 (= mapRest!10746 ((as const (Array (_ BitVec 32) ValueCell!2828)) mapDefault!10755)))))

(assert (=> mapNonEmpty!10746 (= tp!22646 (and e!156427 mapRes!10755))))

(assert (= (and mapNonEmpty!10746 condMapEmpty!10755) mapIsEmpty!10755))

(assert (= (and mapNonEmpty!10746 (not condMapEmpty!10755)) mapNonEmpty!10755))

(assert (= (and mapNonEmpty!10755 ((_ is ValueCellFull!2828) mapValue!10755)) b!241035))

(assert (= (and mapNonEmpty!10746 ((_ is ValueCellFull!2828) mapDefault!10755)) b!241036))

(declare-fun m!259837 () Bool)

(assert (=> mapNonEmpty!10755 m!259837))

(declare-fun b_lambda!7963 () Bool)

(assert (= b_lambda!7961 (or (and b!240769 b_free!6481) b_lambda!7963)))

(check-sat (not b!241010) (not b!240966) (not b!241009) (not b!240960) (not bm!22406) (not b!240965) (not d!59667) (not bm!22407) (not b_lambda!7963) tp_is_empty!6343 (not d!59657) (not b!240904) (not b!240896) (not bm!22416) (not b!241008) (not b!241028) (not b!240956) (not b!240967) (not d!59669) (not b!240906) (not bm!22415) (not b!240959) (not b!240977) (not d!59655) (not d!59671) (not d!59661) (not bm!22408) (not b!240949) (not b_next!6481) (not mapNonEmpty!10755) (not d!59651) (not bm!22404) (not b!240952) b_and!13427)
(check-sat b_and!13427 (not b_next!6481))
(get-model)

(declare-fun d!59673 () Bool)

(declare-fun res!118147 () Bool)

(declare-fun e!156428 () Bool)

(assert (=> d!59673 (=> res!118147 e!156428)))

(assert (=> d!59673 (= res!118147 (= (select (arr!5680 (_keys!6564 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!59673 (= (arrayContainsKey!0 (_keys!6564 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!156428)))

(declare-fun b!241037 () Bool)

(declare-fun e!156429 () Bool)

(assert (=> b!241037 (= e!156428 e!156429)))

(declare-fun res!118148 () Bool)

(assert (=> b!241037 (=> (not res!118148) (not e!156429))))

(assert (=> b!241037 (= res!118148 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun b!241038 () Bool)

(assert (=> b!241038 (= e!156429 (arrayContainsKey!0 (_keys!6564 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!59673 (not res!118147)) b!241037))

(assert (= (and b!241037 res!118148) b!241038))

(declare-fun m!259839 () Bool)

(assert (=> d!59673 m!259839))

(declare-fun m!259841 () Bool)

(assert (=> b!241038 m!259841))

(assert (=> b!240977 d!59673))

(declare-fun b!241049 () Bool)

(declare-fun e!156441 () Bool)

(declare-fun e!156438 () Bool)

(assert (=> b!241049 (= e!156441 e!156438)))

(declare-fun res!118155 () Bool)

(assert (=> b!241049 (=> (not res!118155) (not e!156438))))

(declare-fun e!156440 () Bool)

(assert (=> b!241049 (= res!118155 (not e!156440))))

(declare-fun res!118156 () Bool)

(assert (=> b!241049 (=> (not res!118156) (not e!156440))))

(assert (=> b!241049 (= res!118156 (validKeyInArray!0 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241050 () Bool)

(declare-fun e!156439 () Bool)

(assert (=> b!241050 (= e!156438 e!156439)))

(declare-fun c!40158 () Bool)

(assert (=> b!241050 (= c!40158 (validKeyInArray!0 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241051 () Bool)

(declare-fun call!22422 () Bool)

(assert (=> b!241051 (= e!156439 call!22422)))

(declare-fun bm!22419 () Bool)

(assert (=> bm!22419 (= call!22422 (arrayNoDuplicates!0 (_keys!6564 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40158 (Cons!3607 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000) Nil!3608) Nil!3608)))))

(declare-fun d!59675 () Bool)

(declare-fun res!118157 () Bool)

(assert (=> d!59675 (=> res!118157 e!156441)))

(assert (=> d!59675 (= res!118157 (bvsge #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(assert (=> d!59675 (= (arrayNoDuplicates!0 (_keys!6564 thiss!1504) #b00000000000000000000000000000000 Nil!3608) e!156441)))

(declare-fun b!241052 () Bool)

(assert (=> b!241052 (= e!156439 call!22422)))

(declare-fun b!241053 () Bool)

(declare-fun contains!1715 (List!3611 (_ BitVec 64)) Bool)

(assert (=> b!241053 (= e!156440 (contains!1715 Nil!3608 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59675 (not res!118157)) b!241049))

(assert (= (and b!241049 res!118156) b!241053))

(assert (= (and b!241049 res!118155) b!241050))

(assert (= (and b!241050 c!40158) b!241051))

(assert (= (and b!241050 (not c!40158)) b!241052))

(assert (= (or b!241051 b!241052) bm!22419))

(assert (=> b!241049 m!259747))

(assert (=> b!241049 m!259747))

(assert (=> b!241049 m!259749))

(assert (=> b!241050 m!259747))

(assert (=> b!241050 m!259747))

(assert (=> b!241050 m!259749))

(assert (=> bm!22419 m!259747))

(declare-fun m!259843 () Bool)

(assert (=> bm!22419 m!259843))

(assert (=> b!241053 m!259747))

(assert (=> b!241053 m!259747))

(declare-fun m!259845 () Bool)

(assert (=> b!241053 m!259845))

(assert (=> b!241010 d!59675))

(declare-fun d!59677 () Bool)

(declare-fun e!156442 () Bool)

(assert (=> d!59677 e!156442))

(declare-fun res!118158 () Bool)

(assert (=> d!59677 (=> res!118158 e!156442)))

(declare-fun lt!121056 () Bool)

(assert (=> d!59677 (= res!118158 (not lt!121056))))

(declare-fun lt!121059 () Bool)

(assert (=> d!59677 (= lt!121056 lt!121059)))

(declare-fun lt!121058 () Unit!7401)

(declare-fun e!156443 () Unit!7401)

(assert (=> d!59677 (= lt!121058 e!156443)))

(declare-fun c!40159 () Bool)

(assert (=> d!59677 (= c!40159 lt!121059)))

(assert (=> d!59677 (= lt!121059 (containsKey!269 (toList!1821 lt!121017) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59677 (= (contains!1712 lt!121017 #b1000000000000000000000000000000000000000000000000000000000000000) lt!121056)))

(declare-fun b!241054 () Bool)

(declare-fun lt!121057 () Unit!7401)

(assert (=> b!241054 (= e!156443 lt!121057)))

(assert (=> b!241054 (= lt!121057 (lemmaContainsKeyImpliesGetValueByKeyDefined!218 (toList!1821 lt!121017) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241054 (isDefined!219 (getValueByKey!277 (toList!1821 lt!121017) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241055 () Bool)

(declare-fun Unit!7418 () Unit!7401)

(assert (=> b!241055 (= e!156443 Unit!7418)))

(declare-fun b!241056 () Bool)

(assert (=> b!241056 (= e!156442 (isDefined!219 (getValueByKey!277 (toList!1821 lt!121017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59677 c!40159) b!241054))

(assert (= (and d!59677 (not c!40159)) b!241055))

(assert (= (and d!59677 (not res!118158)) b!241056))

(declare-fun m!259847 () Bool)

(assert (=> d!59677 m!259847))

(declare-fun m!259849 () Bool)

(assert (=> b!241054 m!259849))

(declare-fun m!259851 () Bool)

(assert (=> b!241054 m!259851))

(assert (=> b!241054 m!259851))

(declare-fun m!259853 () Bool)

(assert (=> b!241054 m!259853))

(assert (=> b!241056 m!259851))

(assert (=> b!241056 m!259851))

(assert (=> b!241056 m!259853))

(assert (=> bm!22408 d!59677))

(declare-fun b!241065 () Bool)

(declare-fun e!156452 () Bool)

(declare-fun e!156450 () Bool)

(assert (=> b!241065 (= e!156452 e!156450)))

(declare-fun lt!121066 () (_ BitVec 64))

(assert (=> b!241065 (= lt!121066 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!121068 () Unit!7401)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11959 (_ BitVec 64) (_ BitVec 32)) Unit!7401)

(assert (=> b!241065 (= lt!121068 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6564 thiss!1504) lt!121066 #b00000000000000000000000000000000))))

(assert (=> b!241065 (arrayContainsKey!0 (_keys!6564 thiss!1504) lt!121066 #b00000000000000000000000000000000)))

(declare-fun lt!121067 () Unit!7401)

(assert (=> b!241065 (= lt!121067 lt!121068)))

(declare-fun res!118163 () Bool)

(assert (=> b!241065 (= res!118163 (= (seekEntryOrOpen!0 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000) (_keys!6564 thiss!1504) (mask!10524 thiss!1504)) (Found!1052 #b00000000000000000000000000000000)))))

(assert (=> b!241065 (=> (not res!118163) (not e!156450))))

(declare-fun b!241066 () Bool)

(declare-fun call!22425 () Bool)

(assert (=> b!241066 (= e!156452 call!22425)))

(declare-fun b!241067 () Bool)

(declare-fun e!156451 () Bool)

(assert (=> b!241067 (= e!156451 e!156452)))

(declare-fun c!40162 () Bool)

(assert (=> b!241067 (= c!40162 (validKeyInArray!0 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59679 () Bool)

(declare-fun res!118164 () Bool)

(assert (=> d!59679 (=> res!118164 e!156451)))

(assert (=> d!59679 (= res!118164 (bvsge #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(assert (=> d!59679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)) e!156451)))

(declare-fun bm!22422 () Bool)

(assert (=> bm!22422 (= call!22425 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(declare-fun b!241068 () Bool)

(assert (=> b!241068 (= e!156450 call!22425)))

(assert (= (and d!59679 (not res!118164)) b!241067))

(assert (= (and b!241067 c!40162) b!241065))

(assert (= (and b!241067 (not c!40162)) b!241066))

(assert (= (and b!241065 res!118163) b!241068))

(assert (= (or b!241068 b!241066) bm!22422))

(assert (=> b!241065 m!259747))

(declare-fun m!259855 () Bool)

(assert (=> b!241065 m!259855))

(declare-fun m!259857 () Bool)

(assert (=> b!241065 m!259857))

(assert (=> b!241065 m!259747))

(declare-fun m!259859 () Bool)

(assert (=> b!241065 m!259859))

(assert (=> b!241067 m!259747))

(assert (=> b!241067 m!259747))

(assert (=> b!241067 m!259749))

(declare-fun m!259861 () Bool)

(assert (=> bm!22422 m!259861))

(assert (=> b!241009 d!59679))

(declare-fun b!241081 () Bool)

(declare-fun e!156460 () SeekEntryResult!1052)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!241081 (= e!156460 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24187 lt!121055) #b00000000000000000000000000000001) (nextIndex!0 (index!6380 lt!121055) (x!24187 lt!121055) (mask!10524 thiss!1504)) (index!6380 lt!121055) key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(declare-fun b!241082 () Bool)

(declare-fun c!40169 () Bool)

(declare-fun lt!121073 () (_ BitVec 64))

(assert (=> b!241082 (= c!40169 (= lt!121073 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156459 () SeekEntryResult!1052)

(assert (=> b!241082 (= e!156459 e!156460)))

(declare-fun b!241083 () Bool)

(declare-fun e!156461 () SeekEntryResult!1052)

(assert (=> b!241083 (= e!156461 Undefined!1052)))

(declare-fun d!59681 () Bool)

(declare-fun lt!121074 () SeekEntryResult!1052)

(assert (=> d!59681 (and (or ((_ is Undefined!1052) lt!121074) (not ((_ is Found!1052) lt!121074)) (and (bvsge (index!6379 lt!121074) #b00000000000000000000000000000000) (bvslt (index!6379 lt!121074) (size!6022 (_keys!6564 thiss!1504))))) (or ((_ is Undefined!1052) lt!121074) ((_ is Found!1052) lt!121074) (not ((_ is MissingVacant!1052) lt!121074)) (not (= (index!6381 lt!121074) (index!6380 lt!121055))) (and (bvsge (index!6381 lt!121074) #b00000000000000000000000000000000) (bvslt (index!6381 lt!121074) (size!6022 (_keys!6564 thiss!1504))))) (or ((_ is Undefined!1052) lt!121074) (ite ((_ is Found!1052) lt!121074) (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6379 lt!121074)) key!932) (and ((_ is MissingVacant!1052) lt!121074) (= (index!6381 lt!121074) (index!6380 lt!121055)) (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6381 lt!121074)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59681 (= lt!121074 e!156461)))

(declare-fun c!40171 () Bool)

(assert (=> d!59681 (= c!40171 (bvsge (x!24187 lt!121055) #b01111111111111111111111111111110))))

(assert (=> d!59681 (= lt!121073 (select (arr!5680 (_keys!6564 thiss!1504)) (index!6380 lt!121055)))))

(assert (=> d!59681 (validMask!0 (mask!10524 thiss!1504))))

(assert (=> d!59681 (= (seekKeyOrZeroReturnVacant!0 (x!24187 lt!121055) (index!6380 lt!121055) (index!6380 lt!121055) key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)) lt!121074)))

(declare-fun b!241084 () Bool)

(assert (=> b!241084 (= e!156460 (MissingVacant!1052 (index!6380 lt!121055)))))

(declare-fun b!241085 () Bool)

(assert (=> b!241085 (= e!156459 (Found!1052 (index!6380 lt!121055)))))

(declare-fun b!241086 () Bool)

(assert (=> b!241086 (= e!156461 e!156459)))

(declare-fun c!40170 () Bool)

(assert (=> b!241086 (= c!40170 (= lt!121073 key!932))))

(assert (= (and d!59681 c!40171) b!241083))

(assert (= (and d!59681 (not c!40171)) b!241086))

(assert (= (and b!241086 c!40170) b!241085))

(assert (= (and b!241086 (not c!40170)) b!241082))

(assert (= (and b!241082 c!40169) b!241084))

(assert (= (and b!241082 (not c!40169)) b!241081))

(declare-fun m!259863 () Bool)

(assert (=> b!241081 m!259863))

(assert (=> b!241081 m!259863))

(declare-fun m!259865 () Bool)

(assert (=> b!241081 m!259865))

(declare-fun m!259867 () Bool)

(assert (=> d!59681 m!259867))

(declare-fun m!259869 () Bool)

(assert (=> d!59681 m!259869))

(assert (=> d!59681 m!259823))

(assert (=> d!59681 m!259731))

(assert (=> b!241028 d!59681))

(declare-fun d!59683 () Bool)

(assert (=> d!59683 (= (validMask!0 (mask!10524 thiss!1504)) (and (or (= (mask!10524 thiss!1504) #b00000000000000000000000000000111) (= (mask!10524 thiss!1504) #b00000000000000000000000000001111) (= (mask!10524 thiss!1504) #b00000000000000000000000000011111) (= (mask!10524 thiss!1504) #b00000000000000000000000000111111) (= (mask!10524 thiss!1504) #b00000000000000000000000001111111) (= (mask!10524 thiss!1504) #b00000000000000000000000011111111) (= (mask!10524 thiss!1504) #b00000000000000000000000111111111) (= (mask!10524 thiss!1504) #b00000000000000000000001111111111) (= (mask!10524 thiss!1504) #b00000000000000000000011111111111) (= (mask!10524 thiss!1504) #b00000000000000000000111111111111) (= (mask!10524 thiss!1504) #b00000000000000000001111111111111) (= (mask!10524 thiss!1504) #b00000000000000000011111111111111) (= (mask!10524 thiss!1504) #b00000000000000000111111111111111) (= (mask!10524 thiss!1504) #b00000000000000001111111111111111) (= (mask!10524 thiss!1504) #b00000000000000011111111111111111) (= (mask!10524 thiss!1504) #b00000000000000111111111111111111) (= (mask!10524 thiss!1504) #b00000000000001111111111111111111) (= (mask!10524 thiss!1504) #b00000000000011111111111111111111) (= (mask!10524 thiss!1504) #b00000000000111111111111111111111) (= (mask!10524 thiss!1504) #b00000000001111111111111111111111) (= (mask!10524 thiss!1504) #b00000000011111111111111111111111) (= (mask!10524 thiss!1504) #b00000000111111111111111111111111) (= (mask!10524 thiss!1504) #b00000001111111111111111111111111) (= (mask!10524 thiss!1504) #b00000011111111111111111111111111) (= (mask!10524 thiss!1504) #b00000111111111111111111111111111) (= (mask!10524 thiss!1504) #b00001111111111111111111111111111) (= (mask!10524 thiss!1504) #b00011111111111111111111111111111) (= (mask!10524 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10524 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> d!59657 d!59683))

(declare-fun d!59685 () Bool)

(assert (=> d!59685 (= (inRange!0 (index!6379 lt!120959) (mask!10524 thiss!1504)) (and (bvsge (index!6379 lt!120959) #b00000000000000000000000000000000) (bvslt (index!6379 lt!120959) (bvadd (mask!10524 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!240896 d!59685))

(declare-fun d!59687 () Bool)

(declare-fun e!156462 () Bool)

(assert (=> d!59687 e!156462))

(declare-fun res!118165 () Bool)

(assert (=> d!59687 (=> res!118165 e!156462)))

(declare-fun lt!121075 () Bool)

(assert (=> d!59687 (= res!118165 (not lt!121075))))

(declare-fun lt!121078 () Bool)

(assert (=> d!59687 (= lt!121075 lt!121078)))

(declare-fun lt!121077 () Unit!7401)

(declare-fun e!156463 () Unit!7401)

(assert (=> d!59687 (= lt!121077 e!156463)))

(declare-fun c!40172 () Bool)

(assert (=> d!59687 (= c!40172 lt!121078)))

(assert (=> d!59687 (= lt!121078 (containsKey!269 (toList!1821 lt!121017) (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59687 (= (contains!1712 lt!121017 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)) lt!121075)))

(declare-fun b!241087 () Bool)

(declare-fun lt!121076 () Unit!7401)

(assert (=> b!241087 (= e!156463 lt!121076)))

(assert (=> b!241087 (= lt!121076 (lemmaContainsKeyImpliesGetValueByKeyDefined!218 (toList!1821 lt!121017) (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241087 (isDefined!219 (getValueByKey!277 (toList!1821 lt!121017) (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241088 () Bool)

(declare-fun Unit!7419 () Unit!7401)

(assert (=> b!241088 (= e!156463 Unit!7419)))

(declare-fun b!241089 () Bool)

(assert (=> b!241089 (= e!156462 (isDefined!219 (getValueByKey!277 (toList!1821 lt!121017) (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59687 c!40172) b!241087))

(assert (= (and d!59687 (not c!40172)) b!241088))

(assert (= (and d!59687 (not res!118165)) b!241089))

(assert (=> d!59687 m!259747))

(declare-fun m!259871 () Bool)

(assert (=> d!59687 m!259871))

(assert (=> b!241087 m!259747))

(declare-fun m!259873 () Bool)

(assert (=> b!241087 m!259873))

(assert (=> b!241087 m!259747))

(declare-fun m!259875 () Bool)

(assert (=> b!241087 m!259875))

(assert (=> b!241087 m!259875))

(declare-fun m!259877 () Bool)

(assert (=> b!241087 m!259877))

(assert (=> b!241089 m!259747))

(assert (=> b!241089 m!259875))

(assert (=> b!241089 m!259875))

(assert (=> b!241089 m!259877))

(assert (=> b!240949 d!59687))

(declare-fun d!59689 () Bool)

(declare-fun get!2913 (Option!283) V!8105)

(assert (=> d!59689 (= (apply!221 lt!121017 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2913 (getValueByKey!277 (toList!1821 lt!121017) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8810 () Bool)

(assert (= bs!8810 d!59689))

(declare-fun m!259879 () Bool)

(assert (=> bs!8810 m!259879))

(assert (=> bs!8810 m!259879))

(declare-fun m!259881 () Bool)

(assert (=> bs!8810 m!259881))

(assert (=> b!240967 d!59689))

(declare-fun d!59691 () Bool)

(assert (=> d!59691 (= (apply!221 lt!121017 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)) (get!2913 (getValueByKey!277 (toList!1821 lt!121017) (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8811 () Bool)

(assert (= bs!8811 d!59691))

(assert (=> bs!8811 m!259747))

(assert (=> bs!8811 m!259875))

(assert (=> bs!8811 m!259875))

(declare-fun m!259883 () Bool)

(assert (=> bs!8811 m!259883))

(assert (=> b!240966 d!59691))

(declare-fun d!59693 () Bool)

(declare-fun c!40175 () Bool)

(assert (=> d!59693 (= c!40175 ((_ is ValueCellFull!2828) (select (arr!5679 (_values!4446 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!156466 () V!8105)

(assert (=> d!59693 (= (get!2912 (select (arr!5679 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!555 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!156466)))

(declare-fun b!241094 () Bool)

(declare-fun get!2914 (ValueCell!2828 V!8105) V!8105)

(assert (=> b!241094 (= e!156466 (get!2914 (select (arr!5679 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!555 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!241095 () Bool)

(declare-fun get!2915 (ValueCell!2828 V!8105) V!8105)

(assert (=> b!241095 (= e!156466 (get!2915 (select (arr!5679 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!555 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59693 c!40175) b!241094))

(assert (= (and d!59693 (not c!40175)) b!241095))

(assert (=> b!241094 m!259791))

(assert (=> b!241094 m!259795))

(declare-fun m!259885 () Bool)

(assert (=> b!241094 m!259885))

(assert (=> b!241095 m!259791))

(assert (=> b!241095 m!259795))

(declare-fun m!259887 () Bool)

(assert (=> b!241095 m!259887))

(assert (=> b!240966 d!59693))

(assert (=> d!59661 d!59655))

(assert (=> d!59661 d!59657))

(declare-fun d!59695 () Bool)

(assert (=> d!59695 (contains!1712 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) key!932)))

(assert (=> d!59695 true))

(declare-fun _$17!65 () Unit!7401)

(assert (=> d!59695 (= (choose!1124 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) _$17!65)))

(declare-fun bs!8812 () Bool)

(assert (= bs!8812 d!59695))

(assert (=> bs!8812 m!259643))

(assert (=> bs!8812 m!259643))

(assert (=> bs!8812 m!259645))

(assert (=> d!59661 d!59695))

(assert (=> d!59661 d!59683))

(declare-fun d!59697 () Bool)

(declare-fun e!156469 () Bool)

(assert (=> d!59697 e!156469))

(declare-fun res!118171 () Bool)

(assert (=> d!59697 (=> (not res!118171) (not e!156469))))

(declare-fun lt!121088 () ListLongMap!3611)

(assert (=> d!59697 (= res!118171 (contains!1712 lt!121088 (_1!2365 (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))))

(declare-fun lt!121089 () List!3608)

(assert (=> d!59697 (= lt!121088 (ListLongMap!3612 lt!121089))))

(declare-fun lt!121090 () Unit!7401)

(declare-fun lt!121087 () Unit!7401)

(assert (=> d!59697 (= lt!121090 lt!121087)))

(assert (=> d!59697 (= (getValueByKey!277 lt!121089 (_1!2365 (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))) (Some!282 (_2!2365 (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!156 (List!3608 (_ BitVec 64) V!8105) Unit!7401)

(assert (=> d!59697 (= lt!121087 (lemmaContainsTupThenGetReturnValue!156 lt!121089 (_1!2365 (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))) (_2!2365 (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))))

(declare-fun insertStrictlySorted!159 (List!3608 (_ BitVec 64) V!8105) List!3608)

(assert (=> d!59697 (= lt!121089 (insertStrictlySorted!159 (toList!1821 (ite c!40139 call!22407 (ite c!40135 call!22412 call!22410))) (_1!2365 (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))) (_2!2365 (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))))

(assert (=> d!59697 (= (+!654 (ite c!40139 call!22407 (ite c!40135 call!22412 call!22410)) (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))) lt!121088)))

(declare-fun b!241100 () Bool)

(declare-fun res!118170 () Bool)

(assert (=> b!241100 (=> (not res!118170) (not e!156469))))

(assert (=> b!241100 (= res!118170 (= (getValueByKey!277 (toList!1821 lt!121088) (_1!2365 (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))) (Some!282 (_2!2365 (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))))

(declare-fun b!241101 () Bool)

(declare-fun contains!1716 (List!3608 tuple2!4708) Bool)

(assert (=> b!241101 (= e!156469 (contains!1716 (toList!1821 lt!121088) (ite (or c!40139 c!40135) (tuple2!4709 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4304 thiss!1504)) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(assert (= (and d!59697 res!118171) b!241100))

(assert (= (and b!241100 res!118170) b!241101))

(declare-fun m!259889 () Bool)

(assert (=> d!59697 m!259889))

(declare-fun m!259891 () Bool)

(assert (=> d!59697 m!259891))

(declare-fun m!259893 () Bool)

(assert (=> d!59697 m!259893))

(declare-fun m!259895 () Bool)

(assert (=> d!59697 m!259895))

(declare-fun m!259897 () Bool)

(assert (=> b!241100 m!259897))

(declare-fun m!259899 () Bool)

(assert (=> b!241101 m!259899))

(assert (=> bm!22404 d!59697))

(declare-fun d!59699 () Bool)

(assert (=> d!59699 (= (inRange!0 (ite c!40145 (index!6378 lt!121045) (index!6381 lt!121045)) (mask!10524 thiss!1504)) (and (bvsge (ite c!40145 (index!6378 lt!121045) (index!6381 lt!121045)) #b00000000000000000000000000000000) (bvslt (ite c!40145 (index!6378 lt!121045) (index!6381 lt!121045)) (bvadd (mask!10524 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22415 d!59699))

(declare-fun d!59701 () Bool)

(assert (=> d!59701 (= (validKeyInArray!0 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!240965 d!59701))

(declare-fun d!59703 () Bool)

(assert (=> d!59703 (isDefined!219 (getValueByKey!277 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(declare-fun lt!121093 () Unit!7401)

(declare-fun choose!1126 (List!3608 (_ BitVec 64)) Unit!7401)

(assert (=> d!59703 (= lt!121093 (choose!1126 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(declare-fun e!156472 () Bool)

(assert (=> d!59703 e!156472))

(declare-fun res!118174 () Bool)

(assert (=> d!59703 (=> (not res!118174) (not e!156472))))

(declare-fun isStrictlySorted!362 (List!3608) Bool)

(assert (=> d!59703 (= res!118174 (isStrictlySorted!362 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))))

(assert (=> d!59703 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!218 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932) lt!121093)))

(declare-fun b!241104 () Bool)

(assert (=> b!241104 (= e!156472 (containsKey!269 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))

(assert (= (and d!59703 res!118174) b!241104))

(assert (=> d!59703 m!259741))

(assert (=> d!59703 m!259741))

(assert (=> d!59703 m!259743))

(declare-fun m!259901 () Bool)

(assert (=> d!59703 m!259901))

(declare-fun m!259903 () Bool)

(assert (=> d!59703 m!259903))

(assert (=> b!241104 m!259737))

(assert (=> b!240904 d!59703))

(declare-fun d!59705 () Bool)

(declare-fun isEmpty!524 (Option!283) Bool)

(assert (=> d!59705 (= (isDefined!219 (getValueByKey!277 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932)) (not (isEmpty!524 (getValueByKey!277 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932))))))

(declare-fun bs!8813 () Bool)

(assert (= bs!8813 d!59705))

(assert (=> bs!8813 m!259741))

(declare-fun m!259905 () Bool)

(assert (=> bs!8813 m!259905))

(assert (=> b!240904 d!59705))

(declare-fun b!241114 () Bool)

(declare-fun e!156477 () Option!283)

(declare-fun e!156478 () Option!283)

(assert (=> b!241114 (= e!156477 e!156478)))

(declare-fun c!40181 () Bool)

(assert (=> b!241114 (= c!40181 (and ((_ is Cons!3604) (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) (not (= (_1!2365 (h!4260 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) key!932))))))

(declare-fun d!59707 () Bool)

(declare-fun c!40180 () Bool)

(assert (=> d!59707 (= c!40180 (and ((_ is Cons!3604) (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) (= (_1!2365 (h!4260 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) key!932)))))

(assert (=> d!59707 (= (getValueByKey!277 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932) e!156477)))

(declare-fun b!241115 () Bool)

(assert (=> b!241115 (= e!156478 (getValueByKey!277 (t!8594 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) key!932))))

(declare-fun b!241113 () Bool)

(assert (=> b!241113 (= e!156477 (Some!282 (_2!2365 (h!4260 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))))))))

(declare-fun b!241116 () Bool)

(assert (=> b!241116 (= e!156478 None!281)))

(assert (= (and d!59707 c!40180) b!241113))

(assert (= (and d!59707 (not c!40180)) b!241114))

(assert (= (and b!241114 c!40181) b!241115))

(assert (= (and b!241114 (not c!40181)) b!241116))

(declare-fun m!259907 () Bool)

(assert (=> b!241115 m!259907))

(assert (=> b!240904 d!59707))

(assert (=> bm!22416 d!59659))

(declare-fun d!59709 () Bool)

(assert (=> d!59709 (= (apply!221 lt!121017 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2913 (getValueByKey!277 (toList!1821 lt!121017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8814 () Bool)

(assert (= bs!8814 d!59709))

(assert (=> bs!8814 m!259851))

(assert (=> bs!8814 m!259851))

(declare-fun m!259909 () Bool)

(assert (=> bs!8814 m!259909))

(assert (=> b!240952 d!59709))

(declare-fun d!59711 () Bool)

(assert (=> d!59711 (= (apply!221 (+!654 lt!121020 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504))) lt!121031) (apply!221 lt!121020 lt!121031))))

(declare-fun lt!121096 () Unit!7401)

(declare-fun choose!1127 (ListLongMap!3611 (_ BitVec 64) V!8105 (_ BitVec 64)) Unit!7401)

(assert (=> d!59711 (= lt!121096 (choose!1127 lt!121020 lt!121026 (zeroValue!4304 thiss!1504) lt!121031))))

(declare-fun e!156481 () Bool)

(assert (=> d!59711 e!156481))

(declare-fun res!118177 () Bool)

(assert (=> d!59711 (=> (not res!118177) (not e!156481))))

(assert (=> d!59711 (= res!118177 (contains!1712 lt!121020 lt!121031))))

(assert (=> d!59711 (= (addApplyDifferent!197 lt!121020 lt!121026 (zeroValue!4304 thiss!1504) lt!121031) lt!121096)))

(declare-fun b!241120 () Bool)

(assert (=> b!241120 (= e!156481 (not (= lt!121031 lt!121026)))))

(assert (= (and d!59711 res!118177) b!241120))

(assert (=> d!59711 m!259755))

(declare-fun m!259911 () Bool)

(assert (=> d!59711 m!259911))

(assert (=> d!59711 m!259763))

(assert (=> d!59711 m!259765))

(assert (=> d!59711 m!259763))

(declare-fun m!259913 () Bool)

(assert (=> d!59711 m!259913))

(assert (=> b!240956 d!59711))

(declare-fun d!59713 () Bool)

(declare-fun e!156482 () Bool)

(assert (=> d!59713 e!156482))

(declare-fun res!118179 () Bool)

(assert (=> d!59713 (=> (not res!118179) (not e!156482))))

(declare-fun lt!121098 () ListLongMap!3611)

(assert (=> d!59713 (= res!118179 (contains!1712 lt!121098 (_1!2365 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504)))))))

(declare-fun lt!121099 () List!3608)

(assert (=> d!59713 (= lt!121098 (ListLongMap!3612 lt!121099))))

(declare-fun lt!121100 () Unit!7401)

(declare-fun lt!121097 () Unit!7401)

(assert (=> d!59713 (= lt!121100 lt!121097)))

(assert (=> d!59713 (= (getValueByKey!277 lt!121099 (_1!2365 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504)))) (Some!282 (_2!2365 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504)))))))

(assert (=> d!59713 (= lt!121097 (lemmaContainsTupThenGetReturnValue!156 lt!121099 (_1!2365 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504))) (_2!2365 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504)))))))

(assert (=> d!59713 (= lt!121099 (insertStrictlySorted!159 (toList!1821 lt!121033) (_1!2365 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504))) (_2!2365 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504)))))))

(assert (=> d!59713 (= (+!654 lt!121033 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504))) lt!121098)))

(declare-fun b!241121 () Bool)

(declare-fun res!118178 () Bool)

(assert (=> b!241121 (=> (not res!118178) (not e!156482))))

(assert (=> b!241121 (= res!118178 (= (getValueByKey!277 (toList!1821 lt!121098) (_1!2365 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504)))) (Some!282 (_2!2365 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504))))))))

(declare-fun b!241122 () Bool)

(assert (=> b!241122 (= e!156482 (contains!1716 (toList!1821 lt!121098) (tuple2!4709 lt!121019 (minValue!4304 thiss!1504))))))

(assert (= (and d!59713 res!118179) b!241121))

(assert (= (and b!241121 res!118178) b!241122))

(declare-fun m!259915 () Bool)

(assert (=> d!59713 m!259915))

(declare-fun m!259917 () Bool)

(assert (=> d!59713 m!259917))

(declare-fun m!259919 () Bool)

(assert (=> d!59713 m!259919))

(declare-fun m!259921 () Bool)

(assert (=> d!59713 m!259921))

(declare-fun m!259923 () Bool)

(assert (=> b!241121 m!259923))

(declare-fun m!259925 () Bool)

(assert (=> b!241122 m!259925))

(assert (=> b!240956 d!59713))

(declare-fun d!59715 () Bool)

(assert (=> d!59715 (= (apply!221 lt!121020 lt!121031) (get!2913 (getValueByKey!277 (toList!1821 lt!121020) lt!121031)))))

(declare-fun bs!8815 () Bool)

(assert (= bs!8815 d!59715))

(declare-fun m!259927 () Bool)

(assert (=> bs!8815 m!259927))

(assert (=> bs!8815 m!259927))

(declare-fun m!259929 () Bool)

(assert (=> bs!8815 m!259929))

(assert (=> b!240956 d!59715))

(declare-fun d!59717 () Bool)

(assert (=> d!59717 (= (apply!221 (+!654 lt!121033 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504))) lt!121022) (apply!221 lt!121033 lt!121022))))

(declare-fun lt!121101 () Unit!7401)

(assert (=> d!59717 (= lt!121101 (choose!1127 lt!121033 lt!121019 (minValue!4304 thiss!1504) lt!121022))))

(declare-fun e!156483 () Bool)

(assert (=> d!59717 e!156483))

(declare-fun res!118180 () Bool)

(assert (=> d!59717 (=> (not res!118180) (not e!156483))))

(assert (=> d!59717 (= res!118180 (contains!1712 lt!121033 lt!121022))))

(assert (=> d!59717 (= (addApplyDifferent!197 lt!121033 lt!121019 (minValue!4304 thiss!1504) lt!121022) lt!121101)))

(declare-fun b!241123 () Bool)

(assert (=> b!241123 (= e!156483 (not (= lt!121022 lt!121019)))))

(assert (= (and d!59717 res!118180) b!241123))

(assert (=> d!59717 m!259777))

(declare-fun m!259931 () Bool)

(assert (=> d!59717 m!259931))

(assert (=> d!59717 m!259769))

(assert (=> d!59717 m!259781))

(assert (=> d!59717 m!259769))

(declare-fun m!259933 () Bool)

(assert (=> d!59717 m!259933))

(assert (=> b!240956 d!59717))

(declare-fun d!59719 () Bool)

(assert (=> d!59719 (= (apply!221 (+!654 lt!121037 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504))) lt!121027) (get!2913 (getValueByKey!277 (toList!1821 (+!654 lt!121037 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504)))) lt!121027)))))

(declare-fun bs!8816 () Bool)

(assert (= bs!8816 d!59719))

(declare-fun m!259935 () Bool)

(assert (=> bs!8816 m!259935))

(assert (=> bs!8816 m!259935))

(declare-fun m!259937 () Bool)

(assert (=> bs!8816 m!259937))

(assert (=> b!240956 d!59719))

(declare-fun d!59721 () Bool)

(assert (=> d!59721 (= (apply!221 (+!654 lt!121037 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504))) lt!121027) (apply!221 lt!121037 lt!121027))))

(declare-fun lt!121102 () Unit!7401)

(assert (=> d!59721 (= lt!121102 (choose!1127 lt!121037 lt!121028 (minValue!4304 thiss!1504) lt!121027))))

(declare-fun e!156484 () Bool)

(assert (=> d!59721 e!156484))

(declare-fun res!118181 () Bool)

(assert (=> d!59721 (=> (not res!118181) (not e!156484))))

(assert (=> d!59721 (= res!118181 (contains!1712 lt!121037 lt!121027))))

(assert (=> d!59721 (= (addApplyDifferent!197 lt!121037 lt!121028 (minValue!4304 thiss!1504) lt!121027) lt!121102)))

(declare-fun b!241124 () Bool)

(assert (=> b!241124 (= e!156484 (not (= lt!121027 lt!121028)))))

(assert (= (and d!59721 res!118181) b!241124))

(assert (=> d!59721 m!259779))

(declare-fun m!259939 () Bool)

(assert (=> d!59721 m!259939))

(assert (=> d!59721 m!259773))

(assert (=> d!59721 m!259775))

(assert (=> d!59721 m!259773))

(declare-fun m!259941 () Bool)

(assert (=> d!59721 m!259941))

(assert (=> b!240956 d!59721))

(declare-fun d!59723 () Bool)

(declare-fun e!156485 () Bool)

(assert (=> d!59723 e!156485))

(declare-fun res!118183 () Bool)

(assert (=> d!59723 (=> (not res!118183) (not e!156485))))

(declare-fun lt!121104 () ListLongMap!3611)

(assert (=> d!59723 (= res!118183 (contains!1712 lt!121104 (_1!2365 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504)))))))

(declare-fun lt!121105 () List!3608)

(assert (=> d!59723 (= lt!121104 (ListLongMap!3612 lt!121105))))

(declare-fun lt!121106 () Unit!7401)

(declare-fun lt!121103 () Unit!7401)

(assert (=> d!59723 (= lt!121106 lt!121103)))

(assert (=> d!59723 (= (getValueByKey!277 lt!121105 (_1!2365 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504)))) (Some!282 (_2!2365 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504)))))))

(assert (=> d!59723 (= lt!121103 (lemmaContainsTupThenGetReturnValue!156 lt!121105 (_1!2365 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504))) (_2!2365 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504)))))))

(assert (=> d!59723 (= lt!121105 (insertStrictlySorted!159 (toList!1821 lt!121023) (_1!2365 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504))) (_2!2365 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504)))))))

(assert (=> d!59723 (= (+!654 lt!121023 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504))) lt!121104)))

(declare-fun b!241125 () Bool)

(declare-fun res!118182 () Bool)

(assert (=> b!241125 (=> (not res!118182) (not e!156485))))

(assert (=> b!241125 (= res!118182 (= (getValueByKey!277 (toList!1821 lt!121104) (_1!2365 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504)))) (Some!282 (_2!2365 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504))))))))

(declare-fun b!241126 () Bool)

(assert (=> b!241126 (= e!156485 (contains!1716 (toList!1821 lt!121104) (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504))))))

(assert (= (and d!59723 res!118183) b!241125))

(assert (= (and b!241125 res!118182) b!241126))

(declare-fun m!259943 () Bool)

(assert (=> d!59723 m!259943))

(declare-fun m!259945 () Bool)

(assert (=> d!59723 m!259945))

(declare-fun m!259947 () Bool)

(assert (=> d!59723 m!259947))

(declare-fun m!259949 () Bool)

(assert (=> d!59723 m!259949))

(declare-fun m!259951 () Bool)

(assert (=> b!241125 m!259951))

(declare-fun m!259953 () Bool)

(assert (=> b!241126 m!259953))

(assert (=> b!240956 d!59723))

(declare-fun d!59725 () Bool)

(assert (=> d!59725 (= (apply!221 (+!654 lt!121033 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504))) lt!121022) (get!2913 (getValueByKey!277 (toList!1821 (+!654 lt!121033 (tuple2!4709 lt!121019 (minValue!4304 thiss!1504)))) lt!121022)))))

(declare-fun bs!8817 () Bool)

(assert (= bs!8817 d!59725))

(declare-fun m!259955 () Bool)

(assert (=> bs!8817 m!259955))

(assert (=> bs!8817 m!259955))

(declare-fun m!259957 () Bool)

(assert (=> bs!8817 m!259957))

(assert (=> b!240956 d!59725))

(declare-fun b!241151 () Bool)

(declare-fun lt!121126 () Unit!7401)

(declare-fun lt!121122 () Unit!7401)

(assert (=> b!241151 (= lt!121126 lt!121122)))

(declare-fun lt!121124 () (_ BitVec 64))

(declare-fun lt!121121 () ListLongMap!3611)

(declare-fun lt!121125 () (_ BitVec 64))

(declare-fun lt!121127 () V!8105)

(assert (=> b!241151 (not (contains!1712 (+!654 lt!121121 (tuple2!4709 lt!121125 lt!121127)) lt!121124))))

(declare-fun addStillNotContains!120 (ListLongMap!3611 (_ BitVec 64) V!8105 (_ BitVec 64)) Unit!7401)

(assert (=> b!241151 (= lt!121122 (addStillNotContains!120 lt!121121 lt!121125 lt!121127 lt!121124))))

(assert (=> b!241151 (= lt!121124 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!241151 (= lt!121127 (get!2912 (select (arr!5679 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!555 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!241151 (= lt!121125 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!22428 () ListLongMap!3611)

(assert (=> b!241151 (= lt!121121 call!22428)))

(declare-fun e!156506 () ListLongMap!3611)

(assert (=> b!241151 (= e!156506 (+!654 call!22428 (tuple2!4709 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000) (get!2912 (select (arr!5679 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!555 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!241152 () Bool)

(declare-fun e!156504 () Bool)

(assert (=> b!241152 (= e!156504 (validKeyInArray!0 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241152 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!22425 () Bool)

(assert (=> bm!22425 (= call!22428 (getCurrentListMapNoExtraKeys!537 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4463 thiss!1504)))))

(declare-fun b!241153 () Bool)

(declare-fun e!156503 () ListLongMap!3611)

(assert (=> b!241153 (= e!156503 e!156506)))

(declare-fun c!40192 () Bool)

(assert (=> b!241153 (= c!40192 (validKeyInArray!0 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241154 () Bool)

(declare-fun e!156502 () Bool)

(declare-fun e!156500 () Bool)

(assert (=> b!241154 (= e!156502 e!156500)))

(declare-fun c!40193 () Bool)

(assert (=> b!241154 (= c!40193 e!156504)))

(declare-fun res!118195 () Bool)

(assert (=> b!241154 (=> (not res!118195) (not e!156504))))

(assert (=> b!241154 (= res!118195 (bvslt #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun b!241155 () Bool)

(declare-fun res!118194 () Bool)

(assert (=> b!241155 (=> (not res!118194) (not e!156502))))

(declare-fun lt!121123 () ListLongMap!3611)

(assert (=> b!241155 (= res!118194 (not (contains!1712 lt!121123 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!59727 () Bool)

(assert (=> d!59727 e!156502))

(declare-fun res!118192 () Bool)

(assert (=> d!59727 (=> (not res!118192) (not e!156502))))

(assert (=> d!59727 (= res!118192 (not (contains!1712 lt!121123 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59727 (= lt!121123 e!156503)))

(declare-fun c!40190 () Bool)

(assert (=> d!59727 (= c!40190 (bvsge #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(assert (=> d!59727 (validMask!0 (mask!10524 thiss!1504))))

(assert (=> d!59727 (= (getCurrentListMapNoExtraKeys!537 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)) lt!121123)))

(declare-fun b!241156 () Bool)

(assert (=> b!241156 (= e!156506 call!22428)))

(declare-fun b!241157 () Bool)

(assert (=> b!241157 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(assert (=> b!241157 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6021 (_values!4446 thiss!1504))))))

(declare-fun e!156505 () Bool)

(assert (=> b!241157 (= e!156505 (= (apply!221 lt!121123 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)) (get!2912 (select (arr!5679 (_values!4446 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!555 (defaultEntry!4463 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!241158 () Bool)

(assert (=> b!241158 (= e!156500 e!156505)))

(assert (=> b!241158 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun res!118193 () Bool)

(assert (=> b!241158 (= res!118193 (contains!1712 lt!121123 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!241158 (=> (not res!118193) (not e!156505))))

(declare-fun b!241159 () Bool)

(declare-fun e!156501 () Bool)

(declare-fun isEmpty!525 (ListLongMap!3611) Bool)

(assert (=> b!241159 (= e!156501 (isEmpty!525 lt!121123))))

(declare-fun b!241160 () Bool)

(assert (=> b!241160 (= e!156501 (= lt!121123 (getCurrentListMapNoExtraKeys!537 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4463 thiss!1504))))))

(declare-fun b!241161 () Bool)

(assert (=> b!241161 (= e!156503 (ListLongMap!3612 Nil!3605))))

(declare-fun b!241162 () Bool)

(assert (=> b!241162 (= e!156500 e!156501)))

(declare-fun c!40191 () Bool)

(assert (=> b!241162 (= c!40191 (bvslt #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(assert (= (and d!59727 c!40190) b!241161))

(assert (= (and d!59727 (not c!40190)) b!241153))

(assert (= (and b!241153 c!40192) b!241151))

(assert (= (and b!241153 (not c!40192)) b!241156))

(assert (= (or b!241151 b!241156) bm!22425))

(assert (= (and d!59727 res!118192) b!241155))

(assert (= (and b!241155 res!118194) b!241154))

(assert (= (and b!241154 res!118195) b!241152))

(assert (= (and b!241154 c!40193) b!241158))

(assert (= (and b!241154 (not c!40193)) b!241162))

(assert (= (and b!241158 res!118193) b!241157))

(assert (= (and b!241162 c!40191) b!241160))

(assert (= (and b!241162 (not c!40191)) b!241159))

(declare-fun b_lambda!7965 () Bool)

(assert (=> (not b_lambda!7965) (not b!241151)))

(assert (=> b!241151 t!8598))

(declare-fun b_and!13429 () Bool)

(assert (= b_and!13427 (and (=> t!8598 result!5179) b_and!13429)))

(declare-fun b_lambda!7967 () Bool)

(assert (=> (not b_lambda!7967) (not b!241157)))

(assert (=> b!241157 t!8598))

(declare-fun b_and!13431 () Bool)

(assert (= b_and!13429 (and (=> t!8598 result!5179) b_and!13431)))

(declare-fun m!259959 () Bool)

(assert (=> b!241160 m!259959))

(assert (=> b!241151 m!259791))

(declare-fun m!259961 () Bool)

(assert (=> b!241151 m!259961))

(assert (=> b!241151 m!259961))

(declare-fun m!259963 () Bool)

(assert (=> b!241151 m!259963))

(assert (=> b!241151 m!259747))

(declare-fun m!259965 () Bool)

(assert (=> b!241151 m!259965))

(assert (=> b!241151 m!259795))

(declare-fun m!259967 () Bool)

(assert (=> b!241151 m!259967))

(assert (=> b!241151 m!259791))

(assert (=> b!241151 m!259795))

(assert (=> b!241151 m!259797))

(assert (=> b!241158 m!259747))

(assert (=> b!241158 m!259747))

(declare-fun m!259969 () Bool)

(assert (=> b!241158 m!259969))

(declare-fun m!259971 () Bool)

(assert (=> d!59727 m!259971))

(assert (=> d!59727 m!259731))

(assert (=> b!241153 m!259747))

(assert (=> b!241153 m!259747))

(assert (=> b!241153 m!259749))

(declare-fun m!259973 () Bool)

(assert (=> b!241159 m!259973))

(assert (=> bm!22425 m!259959))

(declare-fun m!259975 () Bool)

(assert (=> b!241155 m!259975))

(assert (=> b!241157 m!259791))

(assert (=> b!241157 m!259747))

(assert (=> b!241157 m!259747))

(declare-fun m!259977 () Bool)

(assert (=> b!241157 m!259977))

(assert (=> b!241157 m!259795))

(assert (=> b!241157 m!259791))

(assert (=> b!241157 m!259795))

(assert (=> b!241157 m!259797))

(assert (=> b!241152 m!259747))

(assert (=> b!241152 m!259747))

(assert (=> b!241152 m!259749))

(assert (=> b!240956 d!59727))

(declare-fun d!59729 () Bool)

(assert (=> d!59729 (= (apply!221 lt!121037 lt!121027) (get!2913 (getValueByKey!277 (toList!1821 lt!121037) lt!121027)))))

(declare-fun bs!8818 () Bool)

(assert (= bs!8818 d!59729))

(declare-fun m!259979 () Bool)

(assert (=> bs!8818 m!259979))

(assert (=> bs!8818 m!259979))

(declare-fun m!259981 () Bool)

(assert (=> bs!8818 m!259981))

(assert (=> b!240956 d!59729))

(declare-fun d!59731 () Bool)

(assert (=> d!59731 (= (apply!221 lt!121033 lt!121022) (get!2913 (getValueByKey!277 (toList!1821 lt!121033) lt!121022)))))

(declare-fun bs!8819 () Bool)

(assert (= bs!8819 d!59731))

(declare-fun m!259983 () Bool)

(assert (=> bs!8819 m!259983))

(assert (=> bs!8819 m!259983))

(declare-fun m!259985 () Bool)

(assert (=> bs!8819 m!259985))

(assert (=> b!240956 d!59731))

(declare-fun d!59733 () Bool)

(declare-fun e!156507 () Bool)

(assert (=> d!59733 e!156507))

(declare-fun res!118197 () Bool)

(assert (=> d!59733 (=> (not res!118197) (not e!156507))))

(declare-fun lt!121129 () ListLongMap!3611)

(assert (=> d!59733 (= res!118197 (contains!1712 lt!121129 (_1!2365 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504)))))))

(declare-fun lt!121130 () List!3608)

(assert (=> d!59733 (= lt!121129 (ListLongMap!3612 lt!121130))))

(declare-fun lt!121131 () Unit!7401)

(declare-fun lt!121128 () Unit!7401)

(assert (=> d!59733 (= lt!121131 lt!121128)))

(assert (=> d!59733 (= (getValueByKey!277 lt!121130 (_1!2365 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504)))) (Some!282 (_2!2365 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504)))))))

(assert (=> d!59733 (= lt!121128 (lemmaContainsTupThenGetReturnValue!156 lt!121130 (_1!2365 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504))) (_2!2365 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504)))))))

(assert (=> d!59733 (= lt!121130 (insertStrictlySorted!159 (toList!1821 lt!121020) (_1!2365 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504))) (_2!2365 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504)))))))

(assert (=> d!59733 (= (+!654 lt!121020 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504))) lt!121129)))

(declare-fun b!241163 () Bool)

(declare-fun res!118196 () Bool)

(assert (=> b!241163 (=> (not res!118196) (not e!156507))))

(assert (=> b!241163 (= res!118196 (= (getValueByKey!277 (toList!1821 lt!121129) (_1!2365 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504)))) (Some!282 (_2!2365 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504))))))))

(declare-fun b!241164 () Bool)

(assert (=> b!241164 (= e!156507 (contains!1716 (toList!1821 lt!121129) (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504))))))

(assert (= (and d!59733 res!118197) b!241163))

(assert (= (and b!241163 res!118196) b!241164))

(declare-fun m!259987 () Bool)

(assert (=> d!59733 m!259987))

(declare-fun m!259989 () Bool)

(assert (=> d!59733 m!259989))

(declare-fun m!259991 () Bool)

(assert (=> d!59733 m!259991))

(declare-fun m!259993 () Bool)

(assert (=> d!59733 m!259993))

(declare-fun m!259995 () Bool)

(assert (=> b!241163 m!259995))

(declare-fun m!259997 () Bool)

(assert (=> b!241164 m!259997))

(assert (=> b!240956 d!59733))

(declare-fun d!59735 () Bool)

(declare-fun e!156508 () Bool)

(assert (=> d!59735 e!156508))

(declare-fun res!118198 () Bool)

(assert (=> d!59735 (=> res!118198 e!156508)))

(declare-fun lt!121132 () Bool)

(assert (=> d!59735 (= res!118198 (not lt!121132))))

(declare-fun lt!121135 () Bool)

(assert (=> d!59735 (= lt!121132 lt!121135)))

(declare-fun lt!121134 () Unit!7401)

(declare-fun e!156509 () Unit!7401)

(assert (=> d!59735 (= lt!121134 e!156509)))

(declare-fun c!40194 () Bool)

(assert (=> d!59735 (= c!40194 lt!121135)))

(assert (=> d!59735 (= lt!121135 (containsKey!269 (toList!1821 (+!654 lt!121023 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504)))) lt!121032))))

(assert (=> d!59735 (= (contains!1712 (+!654 lt!121023 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504))) lt!121032) lt!121132)))

(declare-fun b!241165 () Bool)

(declare-fun lt!121133 () Unit!7401)

(assert (=> b!241165 (= e!156509 lt!121133)))

(assert (=> b!241165 (= lt!121133 (lemmaContainsKeyImpliesGetValueByKeyDefined!218 (toList!1821 (+!654 lt!121023 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504)))) lt!121032))))

(assert (=> b!241165 (isDefined!219 (getValueByKey!277 (toList!1821 (+!654 lt!121023 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504)))) lt!121032))))

(declare-fun b!241166 () Bool)

(declare-fun Unit!7420 () Unit!7401)

(assert (=> b!241166 (= e!156509 Unit!7420)))

(declare-fun b!241167 () Bool)

(assert (=> b!241167 (= e!156508 (isDefined!219 (getValueByKey!277 (toList!1821 (+!654 lt!121023 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504)))) lt!121032)))))

(assert (= (and d!59735 c!40194) b!241165))

(assert (= (and d!59735 (not c!40194)) b!241166))

(assert (= (and d!59735 (not res!118198)) b!241167))

(declare-fun m!259999 () Bool)

(assert (=> d!59735 m!259999))

(declare-fun m!260001 () Bool)

(assert (=> b!241165 m!260001))

(declare-fun m!260003 () Bool)

(assert (=> b!241165 m!260003))

(assert (=> b!241165 m!260003))

(declare-fun m!260005 () Bool)

(assert (=> b!241165 m!260005))

(assert (=> b!241167 m!260003))

(assert (=> b!241167 m!260003))

(assert (=> b!241167 m!260005))

(assert (=> b!240956 d!59735))

(declare-fun d!59737 () Bool)

(assert (=> d!59737 (= (apply!221 (+!654 lt!121020 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504))) lt!121031) (get!2913 (getValueByKey!277 (toList!1821 (+!654 lt!121020 (tuple2!4709 lt!121026 (zeroValue!4304 thiss!1504)))) lt!121031)))))

(declare-fun bs!8820 () Bool)

(assert (= bs!8820 d!59737))

(declare-fun m!260007 () Bool)

(assert (=> bs!8820 m!260007))

(assert (=> bs!8820 m!260007))

(declare-fun m!260009 () Bool)

(assert (=> bs!8820 m!260009))

(assert (=> b!240956 d!59737))

(declare-fun d!59739 () Bool)

(declare-fun e!156510 () Bool)

(assert (=> d!59739 e!156510))

(declare-fun res!118200 () Bool)

(assert (=> d!59739 (=> (not res!118200) (not e!156510))))

(declare-fun lt!121137 () ListLongMap!3611)

(assert (=> d!59739 (= res!118200 (contains!1712 lt!121137 (_1!2365 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504)))))))

(declare-fun lt!121138 () List!3608)

(assert (=> d!59739 (= lt!121137 (ListLongMap!3612 lt!121138))))

(declare-fun lt!121139 () Unit!7401)

(declare-fun lt!121136 () Unit!7401)

(assert (=> d!59739 (= lt!121139 lt!121136)))

(assert (=> d!59739 (= (getValueByKey!277 lt!121138 (_1!2365 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504)))) (Some!282 (_2!2365 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504)))))))

(assert (=> d!59739 (= lt!121136 (lemmaContainsTupThenGetReturnValue!156 lt!121138 (_1!2365 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504))) (_2!2365 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504)))))))

(assert (=> d!59739 (= lt!121138 (insertStrictlySorted!159 (toList!1821 lt!121037) (_1!2365 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504))) (_2!2365 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504)))))))

(assert (=> d!59739 (= (+!654 lt!121037 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504))) lt!121137)))

(declare-fun b!241168 () Bool)

(declare-fun res!118199 () Bool)

(assert (=> b!241168 (=> (not res!118199) (not e!156510))))

(assert (=> b!241168 (= res!118199 (= (getValueByKey!277 (toList!1821 lt!121137) (_1!2365 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504)))) (Some!282 (_2!2365 (tuple2!4709 lt!121028 (minValue!4304 thiss!1504))))))))

(declare-fun b!241169 () Bool)

(assert (=> b!241169 (= e!156510 (contains!1716 (toList!1821 lt!121137) (tuple2!4709 lt!121028 (minValue!4304 thiss!1504))))))

(assert (= (and d!59739 res!118200) b!241168))

(assert (= (and b!241168 res!118199) b!241169))

(declare-fun m!260011 () Bool)

(assert (=> d!59739 m!260011))

(declare-fun m!260013 () Bool)

(assert (=> d!59739 m!260013))

(declare-fun m!260015 () Bool)

(assert (=> d!59739 m!260015))

(declare-fun m!260017 () Bool)

(assert (=> d!59739 m!260017))

(declare-fun m!260019 () Bool)

(assert (=> b!241168 m!260019))

(declare-fun m!260021 () Bool)

(assert (=> b!241169 m!260021))

(assert (=> b!240956 d!59739))

(declare-fun d!59741 () Bool)

(assert (=> d!59741 (contains!1712 (+!654 lt!121023 (tuple2!4709 lt!121018 (zeroValue!4304 thiss!1504))) lt!121032)))

(declare-fun lt!121142 () Unit!7401)

(declare-fun choose!1128 (ListLongMap!3611 (_ BitVec 64) V!8105 (_ BitVec 64)) Unit!7401)

(assert (=> d!59741 (= lt!121142 (choose!1128 lt!121023 lt!121018 (zeroValue!4304 thiss!1504) lt!121032))))

(assert (=> d!59741 (contains!1712 lt!121023 lt!121032)))

(assert (=> d!59741 (= (addStillContains!197 lt!121023 lt!121018 (zeroValue!4304 thiss!1504) lt!121032) lt!121142)))

(declare-fun bs!8821 () Bool)

(assert (= bs!8821 d!59741))

(assert (=> bs!8821 m!259759))

(assert (=> bs!8821 m!259759))

(assert (=> bs!8821 m!259761))

(declare-fun m!260023 () Bool)

(assert (=> bs!8821 m!260023))

(declare-fun m!260025 () Bool)

(assert (=> bs!8821 m!260025))

(assert (=> b!240956 d!59741))

(assert (=> b!240906 d!59705))

(assert (=> b!240906 d!59707))

(declare-fun b!241189 () Bool)

(declare-fun e!156523 () Bool)

(declare-fun e!156525 () Bool)

(assert (=> b!241189 (= e!156523 e!156525)))

(declare-fun res!118209 () Bool)

(declare-fun lt!121148 () SeekEntryResult!1052)

(assert (=> b!241189 (= res!118209 (and ((_ is Intermediate!1052) lt!121148) (not (undefined!1864 lt!121148)) (bvslt (x!24187 lt!121148) #b01111111111111111111111111111110) (bvsge (x!24187 lt!121148) #b00000000000000000000000000000000) (bvsge (x!24187 lt!121148) #b00000000000000000000000000000000)))))

(assert (=> b!241189 (=> (not res!118209) (not e!156525))))

(declare-fun d!59743 () Bool)

(assert (=> d!59743 e!156523))

(declare-fun c!40202 () Bool)

(assert (=> d!59743 (= c!40202 (and ((_ is Intermediate!1052) lt!121148) (undefined!1864 lt!121148)))))

(declare-fun e!156521 () SeekEntryResult!1052)

(assert (=> d!59743 (= lt!121148 e!156521)))

(declare-fun c!40203 () Bool)

(assert (=> d!59743 (= c!40203 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!121147 () (_ BitVec 64))

(assert (=> d!59743 (= lt!121147 (select (arr!5680 (_keys!6564 thiss!1504)) (toIndex!0 key!932 (mask!10524 thiss!1504))))))

(assert (=> d!59743 (validMask!0 (mask!10524 thiss!1504))))

(assert (=> d!59743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10524 thiss!1504)) key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)) lt!121148)))

(declare-fun b!241190 () Bool)

(declare-fun e!156524 () SeekEntryResult!1052)

(assert (=> b!241190 (= e!156524 (Intermediate!1052 false (toIndex!0 key!932 (mask!10524 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!241191 () Bool)

(assert (=> b!241191 (and (bvsge (index!6380 lt!121148) #b00000000000000000000000000000000) (bvslt (index!6380 lt!121148) (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun res!118208 () Bool)

(assert (=> b!241191 (= res!118208 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6380 lt!121148)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156522 () Bool)

(assert (=> b!241191 (=> res!118208 e!156522)))

(declare-fun b!241192 () Bool)

(assert (=> b!241192 (= e!156524 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10524 thiss!1504)) #b00000000000000000000000000000000 (mask!10524 thiss!1504)) key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(declare-fun b!241193 () Bool)

(assert (=> b!241193 (and (bvsge (index!6380 lt!121148) #b00000000000000000000000000000000) (bvslt (index!6380 lt!121148) (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun res!118207 () Bool)

(assert (=> b!241193 (= res!118207 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6380 lt!121148)) key!932))))

(assert (=> b!241193 (=> res!118207 e!156522)))

(assert (=> b!241193 (= e!156525 e!156522)))

(declare-fun b!241194 () Bool)

(assert (=> b!241194 (= e!156521 e!156524)))

(declare-fun c!40201 () Bool)

(assert (=> b!241194 (= c!40201 (or (= lt!121147 key!932) (= (bvadd lt!121147 lt!121147) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!241195 () Bool)

(assert (=> b!241195 (= e!156523 (bvsge (x!24187 lt!121148) #b01111111111111111111111111111110))))

(declare-fun b!241196 () Bool)

(assert (=> b!241196 (= e!156521 (Intermediate!1052 true (toIndex!0 key!932 (mask!10524 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!241197 () Bool)

(assert (=> b!241197 (and (bvsge (index!6380 lt!121148) #b00000000000000000000000000000000) (bvslt (index!6380 lt!121148) (size!6022 (_keys!6564 thiss!1504))))))

(assert (=> b!241197 (= e!156522 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6380 lt!121148)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!59743 c!40203) b!241196))

(assert (= (and d!59743 (not c!40203)) b!241194))

(assert (= (and b!241194 c!40201) b!241190))

(assert (= (and b!241194 (not c!40201)) b!241192))

(assert (= (and d!59743 c!40202) b!241195))

(assert (= (and d!59743 (not c!40202)) b!241189))

(assert (= (and b!241189 res!118209) b!241193))

(assert (= (and b!241193 (not res!118207)) b!241191))

(assert (= (and b!241191 (not res!118208)) b!241197))

(declare-fun m!260027 () Bool)

(assert (=> b!241193 m!260027))

(assert (=> d!59743 m!259827))

(declare-fun m!260029 () Bool)

(assert (=> d!59743 m!260029))

(assert (=> d!59743 m!259731))

(assert (=> b!241197 m!260027))

(assert (=> b!241192 m!259827))

(declare-fun m!260031 () Bool)

(assert (=> b!241192 m!260031))

(assert (=> b!241192 m!260031))

(declare-fun m!260033 () Bool)

(assert (=> b!241192 m!260033))

(assert (=> b!241191 m!260027))

(assert (=> d!59671 d!59743))

(declare-fun d!59745 () Bool)

(declare-fun lt!121154 () (_ BitVec 32))

(declare-fun lt!121153 () (_ BitVec 32))

(assert (=> d!59745 (= lt!121154 (bvmul (bvxor lt!121153 (bvlshr lt!121153 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59745 (= lt!121153 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59745 (and (bvsge (mask!10524 thiss!1504) #b00000000000000000000000000000000) (let ((res!118210 (let ((h!4264 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24207 (bvmul (bvxor h!4264 (bvlshr h!4264 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24207 (bvlshr x!24207 #b00000000000000000000000000001101)) (mask!10524 thiss!1504)))))) (and (bvslt res!118210 (bvadd (mask!10524 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!118210 #b00000000000000000000000000000000))))))

(assert (=> d!59745 (= (toIndex!0 key!932 (mask!10524 thiss!1504)) (bvand (bvxor lt!121154 (bvlshr lt!121154 #b00000000000000000000000000001101)) (mask!10524 thiss!1504)))))

(assert (=> d!59671 d!59745))

(assert (=> d!59671 d!59683))

(assert (=> d!59667 d!59671))

(declare-fun d!59747 () Bool)

(declare-fun e!156534 () Bool)

(assert (=> d!59747 e!156534))

(declare-fun c!40208 () Bool)

(declare-fun lt!121157 () SeekEntryResult!1052)

(assert (=> d!59747 (= c!40208 ((_ is MissingZero!1052) lt!121157))))

(assert (=> d!59747 (= lt!121157 (seekEntryOrOpen!0 key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(assert (=> d!59747 true))

(declare-fun _$34!1101 () Unit!7401)

(assert (=> d!59747 (= (choose!1125 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)) _$34!1101)))

(declare-fun b!241214 () Bool)

(declare-fun res!118220 () Bool)

(assert (=> b!241214 (= res!118220 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6378 lt!121157)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156535 () Bool)

(assert (=> b!241214 (=> (not res!118220) (not e!156535))))

(declare-fun b!241215 () Bool)

(declare-fun call!22434 () Bool)

(assert (=> b!241215 (= e!156535 (not call!22434))))

(declare-fun b!241216 () Bool)

(declare-fun e!156537 () Bool)

(assert (=> b!241216 (= e!156537 ((_ is Undefined!1052) lt!121157))))

(declare-fun bm!22430 () Bool)

(declare-fun call!22433 () Bool)

(assert (=> bm!22430 (= call!22433 (inRange!0 (ite c!40208 (index!6378 lt!121157) (index!6381 lt!121157)) (mask!10524 thiss!1504)))))

(declare-fun b!241217 () Bool)

(declare-fun e!156536 () Bool)

(assert (=> b!241217 (= e!156536 (not call!22434))))

(declare-fun bm!22431 () Bool)

(assert (=> bm!22431 (= call!22434 (arrayContainsKey!0 (_keys!6564 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241218 () Bool)

(declare-fun res!118221 () Bool)

(assert (=> b!241218 (=> (not res!118221) (not e!156536))))

(assert (=> b!241218 (= res!118221 call!22433)))

(assert (=> b!241218 (= e!156537 e!156536)))

(declare-fun b!241219 () Bool)

(assert (=> b!241219 (= e!156534 e!156535)))

(declare-fun res!118219 () Bool)

(assert (=> b!241219 (= res!118219 call!22433)))

(assert (=> b!241219 (=> (not res!118219) (not e!156535))))

(declare-fun b!241220 () Bool)

(declare-fun res!118222 () Bool)

(assert (=> b!241220 (=> (not res!118222) (not e!156536))))

(assert (=> b!241220 (= res!118222 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6381 lt!121157)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241221 () Bool)

(assert (=> b!241221 (= e!156534 e!156537)))

(declare-fun c!40209 () Bool)

(assert (=> b!241221 (= c!40209 ((_ is MissingVacant!1052) lt!121157))))

(assert (= (and d!59747 c!40208) b!241219))

(assert (= (and d!59747 (not c!40208)) b!241221))

(assert (= (and b!241219 res!118219) b!241214))

(assert (= (and b!241214 res!118220) b!241215))

(assert (= (and b!241221 c!40209) b!241218))

(assert (= (and b!241221 (not c!40209)) b!241216))

(assert (= (and b!241218 res!118221) b!241220))

(assert (= (and b!241220 res!118222) b!241217))

(assert (= (or b!241219 b!241218) bm!22430))

(assert (= (or b!241215 b!241217) bm!22431))

(assert (=> bm!22431 m!259647))

(declare-fun m!260035 () Bool)

(assert (=> b!241214 m!260035))

(declare-fun m!260037 () Bool)

(assert (=> b!241220 m!260037))

(declare-fun m!260039 () Bool)

(assert (=> bm!22430 m!260039))

(assert (=> d!59747 m!259659))

(assert (=> d!59667 d!59747))

(assert (=> d!59667 d!59683))

(declare-fun d!59749 () Bool)

(declare-fun e!156538 () Bool)

(assert (=> d!59749 e!156538))

(declare-fun res!118224 () Bool)

(assert (=> d!59749 (=> (not res!118224) (not e!156538))))

(declare-fun lt!121159 () ListLongMap!3611)

(assert (=> d!59749 (= res!118224 (contains!1712 lt!121159 (_1!2365 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(declare-fun lt!121160 () List!3608)

(assert (=> d!59749 (= lt!121159 (ListLongMap!3612 lt!121160))))

(declare-fun lt!121161 () Unit!7401)

(declare-fun lt!121158 () Unit!7401)

(assert (=> d!59749 (= lt!121161 lt!121158)))

(assert (=> d!59749 (= (getValueByKey!277 lt!121160 (_1!2365 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))) (Some!282 (_2!2365 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(assert (=> d!59749 (= lt!121158 (lemmaContainsTupThenGetReturnValue!156 lt!121160 (_1!2365 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))) (_2!2365 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(assert (=> d!59749 (= lt!121160 (insertStrictlySorted!159 (toList!1821 call!22411) (_1!2365 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))) (_2!2365 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))))))

(assert (=> d!59749 (= (+!654 call!22411 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))) lt!121159)))

(declare-fun b!241222 () Bool)

(declare-fun res!118223 () Bool)

(assert (=> b!241222 (=> (not res!118223) (not e!156538))))

(assert (=> b!241222 (= res!118223 (= (getValueByKey!277 (toList!1821 lt!121159) (_1!2365 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504)))) (Some!282 (_2!2365 (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))))

(declare-fun b!241223 () Bool)

(assert (=> b!241223 (= e!156538 (contains!1716 (toList!1821 lt!121159) (tuple2!4709 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4304 thiss!1504))))))

(assert (= (and d!59749 res!118224) b!241222))

(assert (= (and b!241222 res!118223) b!241223))

(declare-fun m!260041 () Bool)

(assert (=> d!59749 m!260041))

(declare-fun m!260043 () Bool)

(assert (=> d!59749 m!260043))

(declare-fun m!260045 () Bool)

(assert (=> d!59749 m!260045))

(declare-fun m!260047 () Bool)

(assert (=> d!59749 m!260047))

(declare-fun m!260049 () Bool)

(assert (=> b!241222 m!260049))

(declare-fun m!260051 () Bool)

(assert (=> b!241223 m!260051))

(assert (=> b!240960 d!59749))

(assert (=> d!59651 d!59671))

(declare-fun d!59751 () Bool)

(declare-fun e!156541 () Bool)

(assert (=> d!59751 e!156541))

(declare-fun res!118230 () Bool)

(assert (=> d!59751 (=> (not res!118230) (not e!156541))))

(declare-fun lt!121164 () SeekEntryResult!1052)

(assert (=> d!59751 (= res!118230 ((_ is Found!1052) lt!121164))))

(assert (=> d!59751 (= lt!121164 (seekEntryOrOpen!0 key!932 (_keys!6564 thiss!1504) (mask!10524 thiss!1504)))))

(assert (=> d!59751 true))

(declare-fun _$33!156 () Unit!7401)

(assert (=> d!59751 (= (choose!1123 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) key!932 (defaultEntry!4463 thiss!1504)) _$33!156)))

(declare-fun b!241228 () Bool)

(declare-fun res!118229 () Bool)

(assert (=> b!241228 (=> (not res!118229) (not e!156541))))

(assert (=> b!241228 (= res!118229 (inRange!0 (index!6379 lt!121164) (mask!10524 thiss!1504)))))

(declare-fun b!241229 () Bool)

(assert (=> b!241229 (= e!156541 (= (select (arr!5680 (_keys!6564 thiss!1504)) (index!6379 lt!121164)) key!932))))

(assert (= (and d!59751 res!118230) b!241228))

(assert (= (and b!241228 res!118229) b!241229))

(assert (=> d!59751 m!259659))

(declare-fun m!260053 () Bool)

(assert (=> b!241228 m!260053))

(declare-fun m!260055 () Bool)

(assert (=> b!241229 m!260055))

(assert (=> d!59651 d!59751))

(assert (=> d!59651 d!59683))

(declare-fun d!59753 () Bool)

(declare-fun res!118235 () Bool)

(declare-fun e!156546 () Bool)

(assert (=> d!59753 (=> res!118235 e!156546)))

(assert (=> d!59753 (= res!118235 (and ((_ is Cons!3604) (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) (= (_1!2365 (h!4260 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) key!932)))))

(assert (=> d!59753 (= (containsKey!269 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))) key!932) e!156546)))

(declare-fun b!241234 () Bool)

(declare-fun e!156547 () Bool)

(assert (=> b!241234 (= e!156546 e!156547)))

(declare-fun res!118236 () Bool)

(assert (=> b!241234 (=> (not res!118236) (not e!156547))))

(assert (=> b!241234 (= res!118236 (and (or (not ((_ is Cons!3604) (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) (bvsle (_1!2365 (h!4260 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) key!932)) ((_ is Cons!3604) (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) (bvslt (_1!2365 (h!4260 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504))))) key!932)))))

(declare-fun b!241235 () Bool)

(assert (=> b!241235 (= e!156547 (containsKey!269 (t!8594 (toList!1821 (getCurrentListMap!1330 (_keys!6564 thiss!1504) (_values!4446 thiss!1504) (mask!10524 thiss!1504) (extraKeys!4200 thiss!1504) (zeroValue!4304 thiss!1504) (minValue!4304 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4463 thiss!1504)))) key!932))))

(assert (= (and d!59753 (not res!118235)) b!241234))

(assert (= (and b!241234 res!118236) b!241235))

(declare-fun m!260057 () Bool)

(assert (=> b!241235 m!260057))

(assert (=> d!59655 d!59753))

(assert (=> bm!22406 d!59727))

(assert (=> b!240959 d!59701))

(declare-fun d!59755 () Bool)

(declare-fun lt!121167 () (_ BitVec 32))

(assert (=> d!59755 (and (bvsge lt!121167 #b00000000000000000000000000000000) (bvsle lt!121167 (bvsub (size!6022 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!156553 () (_ BitVec 32))

(assert (=> d!59755 (= lt!121167 e!156553)))

(declare-fun c!40214 () Bool)

(assert (=> d!59755 (= c!40214 (bvsge #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))))))

(assert (=> d!59755 (and (bvsle #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6022 (_keys!6564 thiss!1504)) (size!6022 (_keys!6564 thiss!1504))))))

(assert (=> d!59755 (= (arrayCountValidKeys!0 (_keys!6564 thiss!1504) #b00000000000000000000000000000000 (size!6022 (_keys!6564 thiss!1504))) lt!121167)))

(declare-fun b!241244 () Bool)

(declare-fun e!156552 () (_ BitVec 32))

(assert (=> b!241244 (= e!156553 e!156552)))

(declare-fun c!40215 () Bool)

(assert (=> b!241244 (= c!40215 (validKeyInArray!0 (select (arr!5680 (_keys!6564 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!241245 () Bool)

(declare-fun call!22437 () (_ BitVec 32))

(assert (=> b!241245 (= e!156552 (bvadd #b00000000000000000000000000000001 call!22437))))

(declare-fun b!241246 () Bool)

(assert (=> b!241246 (= e!156552 call!22437)))

(declare-fun bm!22434 () Bool)

(assert (=> bm!22434 (= call!22437 (arrayCountValidKeys!0 (_keys!6564 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6022 (_keys!6564 thiss!1504))))))

(declare-fun b!241247 () Bool)

(assert (=> b!241247 (= e!156553 #b00000000000000000000000000000000)))

(assert (= (and d!59755 c!40214) b!241247))

(assert (= (and d!59755 (not c!40214)) b!241244))

(assert (= (and b!241244 c!40215) b!241245))

(assert (= (and b!241244 (not c!40215)) b!241246))

(assert (= (or b!241245 b!241246) bm!22434))

(assert (=> b!241244 m!259747))

(assert (=> b!241244 m!259747))

(assert (=> b!241244 m!259749))

(declare-fun m!260059 () Bool)

(assert (=> bm!22434 m!260059))

(assert (=> b!241008 d!59755))

(declare-fun b!241258 () Bool)

(declare-fun res!118248 () Bool)

(declare-fun e!156556 () Bool)

(assert (=> b!241258 (=> (not res!118248) (not e!156556))))

(declare-fun size!6027 (LongMapFixedSize!3556) (_ BitVec 32))

(assert (=> b!241258 (= res!118248 (= (size!6027 thiss!1504) (bvadd (_size!1827 thiss!1504) (bvsdiv (bvadd (extraKeys!4200 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!59757 () Bool)

(declare-fun res!118246 () Bool)

(assert (=> d!59757 (=> (not res!118246) (not e!156556))))

(assert (=> d!59757 (= res!118246 (validMask!0 (mask!10524 thiss!1504)))))

(assert (=> d!59757 (= (simpleValid!244 thiss!1504) e!156556)))

(declare-fun b!241257 () Bool)

(declare-fun res!118247 () Bool)

(assert (=> b!241257 (=> (not res!118247) (not e!156556))))

(assert (=> b!241257 (= res!118247 (bvsge (size!6027 thiss!1504) (_size!1827 thiss!1504)))))

(declare-fun b!241259 () Bool)

(assert (=> b!241259 (= e!156556 (and (bvsge (extraKeys!4200 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4200 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1827 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!241256 () Bool)

(declare-fun res!118245 () Bool)

(assert (=> b!241256 (=> (not res!118245) (not e!156556))))

(assert (=> b!241256 (= res!118245 (and (= (size!6021 (_values!4446 thiss!1504)) (bvadd (mask!10524 thiss!1504) #b00000000000000000000000000000001)) (= (size!6022 (_keys!6564 thiss!1504)) (size!6021 (_values!4446 thiss!1504))) (bvsge (_size!1827 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1827 thiss!1504) (bvadd (mask!10524 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!59757 res!118246) b!241256))

(assert (= (and b!241256 res!118245) b!241257))

(assert (= (and b!241257 res!118247) b!241258))

(assert (= (and b!241258 res!118248) b!241259))

(declare-fun m!260061 () Bool)

(assert (=> b!241258 m!260061))

(assert (=> d!59757 m!259731))

(assert (=> b!241257 m!260061))

(assert (=> d!59669 d!59757))

(declare-fun d!59759 () Bool)

(declare-fun e!156557 () Bool)

(assert (=> d!59759 e!156557))

(declare-fun res!118249 () Bool)

(assert (=> d!59759 (=> res!118249 e!156557)))

(declare-fun lt!121168 () Bool)

(assert (=> d!59759 (= res!118249 (not lt!121168))))

(declare-fun lt!121171 () Bool)

(assert (=> d!59759 (= lt!121168 lt!121171)))

(declare-fun lt!121170 () Unit!7401)

(declare-fun e!156558 () Unit!7401)

(assert (=> d!59759 (= lt!121170 e!156558)))

(declare-fun c!40216 () Bool)

(assert (=> d!59759 (= c!40216 lt!121171)))

(assert (=> d!59759 (= lt!121171 (containsKey!269 (toList!1821 lt!121017) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59759 (= (contains!1712 lt!121017 #b0000000000000000000000000000000000000000000000000000000000000000) lt!121168)))

(declare-fun b!241260 () Bool)

(declare-fun lt!121169 () Unit!7401)

(assert (=> b!241260 (= e!156558 lt!121169)))

(assert (=> b!241260 (= lt!121169 (lemmaContainsKeyImpliesGetValueByKeyDefined!218 (toList!1821 lt!121017) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241260 (isDefined!219 (getValueByKey!277 (toList!1821 lt!121017) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241261 () Bool)

(declare-fun Unit!7421 () Unit!7401)

(assert (=> b!241261 (= e!156558 Unit!7421)))

(declare-fun b!241262 () Bool)

(assert (=> b!241262 (= e!156557 (isDefined!219 (getValueByKey!277 (toList!1821 lt!121017) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59759 c!40216) b!241260))

(assert (= (and d!59759 (not c!40216)) b!241261))

(assert (= (and d!59759 (not res!118249)) b!241262))

(declare-fun m!260063 () Bool)

(assert (=> d!59759 m!260063))

(declare-fun m!260065 () Bool)

(assert (=> b!241260 m!260065))

(assert (=> b!241260 m!259879))

(assert (=> b!241260 m!259879))

(declare-fun m!260067 () Bool)

(assert (=> b!241260 m!260067))

(assert (=> b!241262 m!259879))

(assert (=> b!241262 m!259879))

(assert (=> b!241262 m!260067))

(assert (=> bm!22407 d!59759))

(declare-fun mapIsEmpty!10756 () Bool)

(declare-fun mapRes!10756 () Bool)

(assert (=> mapIsEmpty!10756 mapRes!10756))

(declare-fun b!241264 () Bool)

(declare-fun e!156560 () Bool)

(assert (=> b!241264 (= e!156560 tp_is_empty!6343)))

(declare-fun b!241263 () Bool)

(declare-fun e!156559 () Bool)

(assert (=> b!241263 (= e!156559 tp_is_empty!6343)))

(declare-fun mapNonEmpty!10756 () Bool)

(declare-fun tp!22663 () Bool)

(assert (=> mapNonEmpty!10756 (= mapRes!10756 (and tp!22663 e!156559))))

(declare-fun mapRest!10756 () (Array (_ BitVec 32) ValueCell!2828))

(declare-fun mapValue!10756 () ValueCell!2828)

(declare-fun mapKey!10756 () (_ BitVec 32))

(assert (=> mapNonEmpty!10756 (= mapRest!10755 (store mapRest!10756 mapKey!10756 mapValue!10756))))

(declare-fun condMapEmpty!10756 () Bool)

(declare-fun mapDefault!10756 () ValueCell!2828)

(assert (=> mapNonEmpty!10755 (= condMapEmpty!10756 (= mapRest!10755 ((as const (Array (_ BitVec 32) ValueCell!2828)) mapDefault!10756)))))

(assert (=> mapNonEmpty!10755 (= tp!22662 (and e!156560 mapRes!10756))))

(assert (= (and mapNonEmpty!10755 condMapEmpty!10756) mapIsEmpty!10756))

(assert (= (and mapNonEmpty!10755 (not condMapEmpty!10756)) mapNonEmpty!10756))

(assert (= (and mapNonEmpty!10756 ((_ is ValueCellFull!2828) mapValue!10756)) b!241263))

(assert (= (and mapNonEmpty!10755 ((_ is ValueCellFull!2828) mapDefault!10756)) b!241264))

(declare-fun m!260069 () Bool)

(assert (=> mapNonEmpty!10756 m!260069))

(declare-fun b_lambda!7969 () Bool)

(assert (= b_lambda!7965 (or (and b!240769 b_free!6481) b_lambda!7969)))

(declare-fun b_lambda!7971 () Bool)

(assert (= b_lambda!7967 (or (and b!240769 b_free!6481) b_lambda!7971)))

(check-sat (not d!59689) (not b!241168) (not d!59747) (not b!241067) (not bm!22434) (not b!241094) (not b!241087) (not b!241049) (not b!241054) (not b!241081) (not d!59743) (not b!241126) (not b!241165) (not d!59681) (not b!241223) (not b!241159) (not d!59741) (not b!241160) (not b!241125) (not b!241089) (not b!241056) (not b!241228) (not b!241050) (not bm!22425) (not b!241122) (not b!241260) (not d!59709) (not mapNonEmpty!10756) (not b!241115) (not b!241158) (not d!59715) (not b!241235) (not d!59721) (not b!241164) (not b!241053) b_and!13431 (not d!59711) (not b!241167) (not b!241244) (not b!241157) (not d!59677) (not b_lambda!7971) (not d!59749) (not d!59723) (not d!59727) (not d!59687) (not d!59725) (not d!59697) (not b!241152) (not b!241163) (not d!59757) (not b!241095) (not b!241121) (not bm!22430) (not b!241222) (not b!241104) (not d!59733) (not d!59735) (not b!241155) (not d!59717) (not d!59695) (not d!59705) (not d!59759) (not b!241153) (not b_lambda!7963) (not d!59703) (not d!59719) (not bm!22419) (not b!241262) (not b_lambda!7969) tp_is_empty!6343 (not b!241258) (not d!59731) (not b!241100) (not b_next!6481) (not b!241257) (not b!241038) (not d!59691) (not bm!22422) (not b!241192) (not bm!22431) (not b!241101) (not d!59737) (not d!59729) (not b!241169) (not d!59713) (not b!241151) (not d!59739) (not d!59751) (not b!241065))
(check-sat b_and!13431 (not b_next!6481))
