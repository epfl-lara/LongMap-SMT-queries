; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23706 () Bool)

(assert start!23706)

(declare-fun b!249099 () Bool)

(declare-fun b_free!6613 () Bool)

(declare-fun b_next!6613 () Bool)

(assert (=> b!249099 (= b_free!6613 (not b_next!6613))))

(declare-fun tp!23095 () Bool)

(declare-fun b_and!13635 () Bool)

(assert (=> b!249099 (= tp!23095 b_and!13635)))

(declare-fun b!249087 () Bool)

(declare-fun e!161562 () Bool)

(declare-fun e!161555 () Bool)

(assert (=> b!249087 (= e!161562 e!161555)))

(declare-fun res!122046 () Bool)

(declare-fun call!23361 () Bool)

(assert (=> b!249087 (= res!122046 call!23361)))

(assert (=> b!249087 (=> (not res!122046) (not e!161555))))

(declare-fun bm!23357 () Bool)

(declare-fun call!23360 () Bool)

(declare-datatypes ((V!8281 0))(
  ( (V!8282 (val!3282 Int)) )
))
(declare-datatypes ((ValueCell!2894 0))(
  ( (ValueCellFull!2894 (v!5344 V!8281)) (EmptyCell!2894) )
))
(declare-datatypes ((array!12261 0))(
  ( (array!12262 (arr!5815 (Array (_ BitVec 32) ValueCell!2894)) (size!6158 (_ BitVec 32))) )
))
(declare-datatypes ((array!12263 0))(
  ( (array!12264 (arr!5816 (Array (_ BitVec 32) (_ BitVec 64))) (size!6159 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3688 0))(
  ( (LongMapFixedSize!3689 (defaultEntry!4605 Int) (mask!10766 (_ BitVec 32)) (extraKeys!4342 (_ BitVec 32)) (zeroValue!4446 V!8281) (minValue!4446 V!8281) (_size!1893 (_ BitVec 32)) (_keys!6733 array!12263) (_values!4588 array!12261) (_vacant!1893 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3688)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23357 (= call!23360 (arrayContainsKey!0 (_keys!6733 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10997 () Bool)

(declare-fun mapRes!10997 () Bool)

(assert (=> mapIsEmpty!10997 mapRes!10997))

(declare-fun b!249088 () Bool)

(declare-fun e!161558 () Bool)

(declare-fun tp_is_empty!6475 () Bool)

(assert (=> b!249088 (= e!161558 tp_is_empty!6475)))

(declare-fun b!249089 () Bool)

(declare-datatypes ((Unit!7683 0))(
  ( (Unit!7684) )
))
(declare-fun e!161552 () Unit!7683)

(declare-fun Unit!7685 () Unit!7683)

(assert (=> b!249089 (= e!161552 Unit!7685)))

(declare-fun b!249090 () Bool)

(declare-fun e!161565 () Bool)

(assert (=> b!249090 (= e!161565 tp_is_empty!6475)))

(declare-fun b!249091 () Bool)

(declare-fun e!161566 () Unit!7683)

(declare-fun Unit!7686 () Unit!7683)

(assert (=> b!249091 (= e!161566 Unit!7686)))

(declare-fun lt!124790 () Unit!7683)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!387 (array!12263 array!12261 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) Int) Unit!7683)

(assert (=> b!249091 (= lt!124790 (lemmaInListMapThenSeekEntryOrOpenFindsIt!387 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)))))

(assert (=> b!249091 false))

(declare-fun b!249092 () Bool)

(declare-fun e!161554 () Bool)

(declare-fun e!161559 () Bool)

(assert (=> b!249092 (= e!161554 (not e!161559))))

(declare-fun res!122050 () Bool)

(assert (=> b!249092 (=> res!122050 e!161559)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!249092 (= res!122050 (not (validMask!0 (mask!10766 thiss!1504))))))

(declare-fun lt!124787 () array!12263)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12263 (_ BitVec 32)) Bool)

(assert (=> b!249092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124787 (mask!10766 thiss!1504))))

(declare-fun lt!124794 () Unit!7683)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12263 (_ BitVec 32) (_ BitVec 32)) Unit!7683)

(assert (=> b!249092 (= lt!124794 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6733 thiss!1504) index!297 (mask!10766 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12263 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249092 (= (arrayCountValidKeys!0 lt!124787 #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6733 thiss!1504) #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504)))))))

(declare-fun lt!124793 () Unit!7683)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12263 (_ BitVec 32) (_ BitVec 64)) Unit!7683)

(assert (=> b!249092 (= lt!124793 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6733 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3633 0))(
  ( (Nil!3630) (Cons!3629 (h!4287 (_ BitVec 64)) (t!8654 List!3633)) )
))
(declare-fun arrayNoDuplicates!0 (array!12263 (_ BitVec 32) List!3633) Bool)

(assert (=> b!249092 (arrayNoDuplicates!0 lt!124787 #b00000000000000000000000000000000 Nil!3630)))

(assert (=> b!249092 (= lt!124787 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun lt!124795 () Unit!7683)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12263 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3633) Unit!7683)

(assert (=> b!249092 (= lt!124795 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6733 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3630))))

(declare-fun lt!124791 () Unit!7683)

(assert (=> b!249092 (= lt!124791 e!161552)))

(declare-fun c!41768 () Bool)

(assert (=> b!249092 (= c!41768 (arrayContainsKey!0 (_keys!6733 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249093 () Bool)

(declare-fun e!161557 () Bool)

(assert (=> b!249093 (= e!161557 (not call!23360))))

(declare-fun b!249094 () Bool)

(declare-fun e!161561 () Bool)

(assert (=> b!249094 (= e!161561 (and e!161565 mapRes!10997))))

(declare-fun condMapEmpty!10997 () Bool)

(declare-fun mapDefault!10997 () ValueCell!2894)

(assert (=> b!249094 (= condMapEmpty!10997 (= (arr!5815 (_values!4588 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2894)) mapDefault!10997)))))

(declare-fun b!249095 () Bool)

(declare-fun res!122053 () Bool)

(assert (=> b!249095 (=> (not res!122053) (not e!161557))))

(assert (=> b!249095 (= res!122053 call!23361)))

(declare-fun e!161564 () Bool)

(assert (=> b!249095 (= e!161564 e!161557)))

(declare-fun b!249096 () Bool)

(assert (=> b!249096 (= e!161559 (= (size!6158 (_values!4588 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10766 thiss!1504))))))

(declare-fun b!249097 () Bool)

(declare-datatypes ((SeekEntryResult!1081 0))(
  ( (MissingZero!1081 (index!6494 (_ BitVec 32))) (Found!1081 (index!6495 (_ BitVec 32))) (Intermediate!1081 (undefined!1893 Bool) (index!6496 (_ BitVec 32)) (x!24579 (_ BitVec 32))) (Undefined!1081) (MissingVacant!1081 (index!6497 (_ BitVec 32))) )
))
(declare-fun lt!124792 () SeekEntryResult!1081)

(get-info :version)

(assert (=> b!249097 (= e!161562 ((_ is Undefined!1081) lt!124792))))

(declare-fun b!249098 () Bool)

(declare-fun res!122045 () Bool)

(assert (=> b!249098 (=> (not res!122045) (not e!161557))))

(assert (=> b!249098 (= res!122045 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6494 lt!124792)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!10997 () Bool)

(declare-fun tp!23096 () Bool)

(assert (=> mapNonEmpty!10997 (= mapRes!10997 (and tp!23096 e!161558))))

(declare-fun mapValue!10997 () ValueCell!2894)

(declare-fun mapKey!10997 () (_ BitVec 32))

(declare-fun mapRest!10997 () (Array (_ BitVec 32) ValueCell!2894))

(assert (=> mapNonEmpty!10997 (= (arr!5815 (_values!4588 thiss!1504)) (store mapRest!10997 mapKey!10997 mapValue!10997))))

(declare-fun e!161553 () Bool)

(declare-fun array_inv!3823 (array!12263) Bool)

(declare-fun array_inv!3824 (array!12261) Bool)

(assert (=> b!249099 (= e!161553 (and tp!23095 tp_is_empty!6475 (array_inv!3823 (_keys!6733 thiss!1504)) (array_inv!3824 (_values!4588 thiss!1504)) e!161561))))

(declare-fun b!249100 () Bool)

(declare-fun lt!124788 () Unit!7683)

(assert (=> b!249100 (= e!161566 lt!124788)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!383 (array!12263 array!12261 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) Int) Unit!7683)

(assert (=> b!249100 (= lt!124788 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)))))

(declare-fun c!41769 () Bool)

(assert (=> b!249100 (= c!41769 ((_ is MissingZero!1081) lt!124792))))

(assert (=> b!249100 e!161564))

(declare-fun b!249101 () Bool)

(declare-fun res!122047 () Bool)

(assert (=> b!249101 (= res!122047 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6497 lt!124792)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249101 (=> (not res!122047) (not e!161555))))

(declare-fun res!122051 () Bool)

(declare-fun e!161563 () Bool)

(assert (=> start!23706 (=> (not res!122051) (not e!161563))))

(declare-fun valid!1452 (LongMapFixedSize!3688) Bool)

(assert (=> start!23706 (= res!122051 (valid!1452 thiss!1504))))

(assert (=> start!23706 e!161563))

(assert (=> start!23706 e!161553))

(assert (=> start!23706 true))

(declare-fun b!249102 () Bool)

(assert (=> b!249102 (= e!161555 (not call!23360))))

(declare-fun b!249103 () Bool)

(declare-fun Unit!7687 () Unit!7683)

(assert (=> b!249103 (= e!161552 Unit!7687)))

(declare-fun lt!124796 () Unit!7683)

(declare-fun lemmaArrayContainsKeyThenInListMap!208 (array!12263 array!12261 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) (_ BitVec 32) Int) Unit!7683)

(assert (=> b!249103 (= lt!124796 (lemmaArrayContainsKeyThenInListMap!208 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(assert (=> b!249103 false))

(declare-fun b!249104 () Bool)

(declare-fun c!41767 () Bool)

(assert (=> b!249104 (= c!41767 ((_ is MissingVacant!1081) lt!124792))))

(assert (=> b!249104 (= e!161564 e!161562)))

(declare-fun b!249105 () Bool)

(declare-fun res!122049 () Bool)

(assert (=> b!249105 (=> (not res!122049) (not e!161563))))

(assert (=> b!249105 (= res!122049 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!249106 () Bool)

(declare-fun e!161556 () Bool)

(assert (=> b!249106 (= e!161563 e!161556)))

(declare-fun res!122052 () Bool)

(assert (=> b!249106 (=> (not res!122052) (not e!161556))))

(assert (=> b!249106 (= res!122052 (or (= lt!124792 (MissingZero!1081 index!297)) (= lt!124792 (MissingVacant!1081 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12263 (_ BitVec 32)) SeekEntryResult!1081)

(assert (=> b!249106 (= lt!124792 (seekEntryOrOpen!0 key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(declare-fun bm!23358 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23358 (= call!23361 (inRange!0 (ite c!41769 (index!6494 lt!124792) (index!6497 lt!124792)) (mask!10766 thiss!1504)))))

(declare-fun b!249107 () Bool)

(assert (=> b!249107 (= e!161556 e!161554)))

(declare-fun res!122048 () Bool)

(assert (=> b!249107 (=> (not res!122048) (not e!161554))))

(assert (=> b!249107 (= res!122048 (inRange!0 index!297 (mask!10766 thiss!1504)))))

(declare-fun lt!124789 () Unit!7683)

(assert (=> b!249107 (= lt!124789 e!161566)))

(declare-fun c!41770 () Bool)

(declare-datatypes ((tuple2!4756 0))(
  ( (tuple2!4757 (_1!2389 (_ BitVec 64)) (_2!2389 V!8281)) )
))
(declare-datatypes ((List!3634 0))(
  ( (Nil!3631) (Cons!3630 (h!4288 tuple2!4756) (t!8655 List!3634)) )
))
(declare-datatypes ((ListLongMap!3671 0))(
  ( (ListLongMap!3672 (toList!1851 List!3634)) )
))
(declare-fun contains!1784 (ListLongMap!3671 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1383 (array!12263 array!12261 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 32) Int) ListLongMap!3671)

(assert (=> b!249107 (= c!41770 (contains!1784 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) key!932))))

(assert (= (and start!23706 res!122051) b!249105))

(assert (= (and b!249105 res!122049) b!249106))

(assert (= (and b!249106 res!122052) b!249107))

(assert (= (and b!249107 c!41770) b!249091))

(assert (= (and b!249107 (not c!41770)) b!249100))

(assert (= (and b!249100 c!41769) b!249095))

(assert (= (and b!249100 (not c!41769)) b!249104))

(assert (= (and b!249095 res!122053) b!249098))

(assert (= (and b!249098 res!122045) b!249093))

(assert (= (and b!249104 c!41767) b!249087))

(assert (= (and b!249104 (not c!41767)) b!249097))

(assert (= (and b!249087 res!122046) b!249101))

(assert (= (and b!249101 res!122047) b!249102))

(assert (= (or b!249095 b!249087) bm!23358))

(assert (= (or b!249093 b!249102) bm!23357))

(assert (= (and b!249107 res!122048) b!249092))

(assert (= (and b!249092 c!41768) b!249103))

(assert (= (and b!249092 (not c!41768)) b!249089))

(assert (= (and b!249092 (not res!122050)) b!249096))

(assert (= (and b!249094 condMapEmpty!10997) mapIsEmpty!10997))

(assert (= (and b!249094 (not condMapEmpty!10997)) mapNonEmpty!10997))

(assert (= (and mapNonEmpty!10997 ((_ is ValueCellFull!2894) mapValue!10997)) b!249088))

(assert (= (and b!249094 ((_ is ValueCellFull!2894) mapDefault!10997)) b!249090))

(assert (= b!249099 b!249094))

(assert (= start!23706 b!249099))

(declare-fun m!265795 () Bool)

(assert (=> b!249092 m!265795))

(declare-fun m!265797 () Bool)

(assert (=> b!249092 m!265797))

(declare-fun m!265799 () Bool)

(assert (=> b!249092 m!265799))

(declare-fun m!265801 () Bool)

(assert (=> b!249092 m!265801))

(declare-fun m!265803 () Bool)

(assert (=> b!249092 m!265803))

(declare-fun m!265805 () Bool)

(assert (=> b!249092 m!265805))

(declare-fun m!265807 () Bool)

(assert (=> b!249092 m!265807))

(declare-fun m!265809 () Bool)

(assert (=> b!249092 m!265809))

(declare-fun m!265811 () Bool)

(assert (=> b!249092 m!265811))

(declare-fun m!265813 () Bool)

(assert (=> b!249092 m!265813))

(declare-fun m!265815 () Bool)

(assert (=> bm!23358 m!265815))

(declare-fun m!265817 () Bool)

(assert (=> b!249101 m!265817))

(declare-fun m!265819 () Bool)

(assert (=> b!249106 m!265819))

(declare-fun m!265821 () Bool)

(assert (=> b!249098 m!265821))

(declare-fun m!265823 () Bool)

(assert (=> b!249099 m!265823))

(declare-fun m!265825 () Bool)

(assert (=> b!249099 m!265825))

(declare-fun m!265827 () Bool)

(assert (=> b!249103 m!265827))

(declare-fun m!265829 () Bool)

(assert (=> b!249107 m!265829))

(declare-fun m!265831 () Bool)

(assert (=> b!249107 m!265831))

(assert (=> b!249107 m!265831))

(declare-fun m!265833 () Bool)

(assert (=> b!249107 m!265833))

(declare-fun m!265835 () Bool)

(assert (=> mapNonEmpty!10997 m!265835))

(assert (=> bm!23357 m!265797))

(declare-fun m!265837 () Bool)

(assert (=> b!249091 m!265837))

(declare-fun m!265839 () Bool)

(assert (=> start!23706 m!265839))

(declare-fun m!265841 () Bool)

(assert (=> b!249100 m!265841))

(check-sat (not b!249092) (not b_next!6613) (not mapNonEmpty!10997) (not b!249107) (not start!23706) (not bm!23357) (not b!249100) b_and!13635 tp_is_empty!6475 (not b!249106) (not b!249091) (not bm!23358) (not b!249103) (not b!249099))
(check-sat b_and!13635 (not b_next!6613))
(get-model)

(declare-fun d!60685 () Bool)

(assert (=> d!60685 (= (inRange!0 (ite c!41769 (index!6494 lt!124792) (index!6497 lt!124792)) (mask!10766 thiss!1504)) (and (bvsge (ite c!41769 (index!6494 lt!124792) (index!6497 lt!124792)) #b00000000000000000000000000000000) (bvslt (ite c!41769 (index!6494 lt!124792) (index!6497 lt!124792)) (bvadd (mask!10766 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23358 d!60685))

(declare-fun d!60687 () Bool)

(declare-fun lt!124859 () (_ BitVec 32))

(assert (=> d!60687 (and (bvsge lt!124859 #b00000000000000000000000000000000) (bvsle lt!124859 (bvsub (size!6159 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!161661 () (_ BitVec 32))

(assert (=> d!60687 (= lt!124859 e!161661)))

(declare-fun c!41800 () Bool)

(assert (=> d!60687 (= c!41800 (bvsge #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> d!60687 (and (bvsle #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6159 (_keys!6733 thiss!1504)) (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> d!60687 (= (arrayCountValidKeys!0 (_keys!6733 thiss!1504) #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) lt!124859)))

(declare-fun bm!23373 () Bool)

(declare-fun call!23376 () (_ BitVec 32))

(assert (=> bm!23373 (= call!23376 (arrayCountValidKeys!0 (_keys!6733 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249242 () Bool)

(declare-fun e!161662 () (_ BitVec 32))

(assert (=> b!249242 (= e!161662 call!23376)))

(declare-fun b!249243 () Bool)

(assert (=> b!249243 (= e!161662 (bvadd #b00000000000000000000000000000001 call!23376))))

(declare-fun b!249244 () Bool)

(assert (=> b!249244 (= e!161661 e!161662)))

(declare-fun c!41799 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!249244 (= c!41799 (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249245 () Bool)

(assert (=> b!249245 (= e!161661 #b00000000000000000000000000000000)))

(assert (= (and d!60687 c!41800) b!249245))

(assert (= (and d!60687 (not c!41800)) b!249244))

(assert (= (and b!249244 c!41799) b!249243))

(assert (= (and b!249244 (not c!41799)) b!249242))

(assert (= (or b!249243 b!249242) bm!23373))

(declare-fun m!265939 () Bool)

(assert (=> bm!23373 m!265939))

(declare-fun m!265941 () Bool)

(assert (=> b!249244 m!265941))

(assert (=> b!249244 m!265941))

(declare-fun m!265943 () Bool)

(assert (=> b!249244 m!265943))

(assert (=> b!249092 d!60687))

(declare-fun d!60689 () Bool)

(assert (=> d!60689 (= (validMask!0 (mask!10766 thiss!1504)) (and (or (= (mask!10766 thiss!1504) #b00000000000000000000000000000111) (= (mask!10766 thiss!1504) #b00000000000000000000000000001111) (= (mask!10766 thiss!1504) #b00000000000000000000000000011111) (= (mask!10766 thiss!1504) #b00000000000000000000000000111111) (= (mask!10766 thiss!1504) #b00000000000000000000000001111111) (= (mask!10766 thiss!1504) #b00000000000000000000000011111111) (= (mask!10766 thiss!1504) #b00000000000000000000000111111111) (= (mask!10766 thiss!1504) #b00000000000000000000001111111111) (= (mask!10766 thiss!1504) #b00000000000000000000011111111111) (= (mask!10766 thiss!1504) #b00000000000000000000111111111111) (= (mask!10766 thiss!1504) #b00000000000000000001111111111111) (= (mask!10766 thiss!1504) #b00000000000000000011111111111111) (= (mask!10766 thiss!1504) #b00000000000000000111111111111111) (= (mask!10766 thiss!1504) #b00000000000000001111111111111111) (= (mask!10766 thiss!1504) #b00000000000000011111111111111111) (= (mask!10766 thiss!1504) #b00000000000000111111111111111111) (= (mask!10766 thiss!1504) #b00000000000001111111111111111111) (= (mask!10766 thiss!1504) #b00000000000011111111111111111111) (= (mask!10766 thiss!1504) #b00000000000111111111111111111111) (= (mask!10766 thiss!1504) #b00000000001111111111111111111111) (= (mask!10766 thiss!1504) #b00000000011111111111111111111111) (= (mask!10766 thiss!1504) #b00000000111111111111111111111111) (= (mask!10766 thiss!1504) #b00000001111111111111111111111111) (= (mask!10766 thiss!1504) #b00000011111111111111111111111111) (= (mask!10766 thiss!1504) #b00000111111111111111111111111111) (= (mask!10766 thiss!1504) #b00001111111111111111111111111111) (= (mask!10766 thiss!1504) #b00011111111111111111111111111111) (= (mask!10766 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10766 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!249092 d!60689))

(declare-fun d!60691 () Bool)

(declare-fun res!122114 () Bool)

(declare-fun e!161672 () Bool)

(assert (=> d!60691 (=> res!122114 e!161672)))

(assert (=> d!60691 (= res!122114 (bvsge #b00000000000000000000000000000000 (size!6159 lt!124787)))))

(assert (=> d!60691 (= (arrayNoDuplicates!0 lt!124787 #b00000000000000000000000000000000 Nil!3630) e!161672)))

(declare-fun b!249256 () Bool)

(declare-fun e!161674 () Bool)

(declare-fun contains!1786 (List!3633 (_ BitVec 64)) Bool)

(assert (=> b!249256 (= e!161674 (contains!1786 Nil!3630 (select (arr!5816 lt!124787) #b00000000000000000000000000000000)))))

(declare-fun b!249257 () Bool)

(declare-fun e!161673 () Bool)

(assert (=> b!249257 (= e!161672 e!161673)))

(declare-fun res!122115 () Bool)

(assert (=> b!249257 (=> (not res!122115) (not e!161673))))

(assert (=> b!249257 (= res!122115 (not e!161674))))

(declare-fun res!122116 () Bool)

(assert (=> b!249257 (=> (not res!122116) (not e!161674))))

(assert (=> b!249257 (= res!122116 (validKeyInArray!0 (select (arr!5816 lt!124787) #b00000000000000000000000000000000)))))

(declare-fun b!249258 () Bool)

(declare-fun e!161671 () Bool)

(assert (=> b!249258 (= e!161673 e!161671)))

(declare-fun c!41803 () Bool)

(assert (=> b!249258 (= c!41803 (validKeyInArray!0 (select (arr!5816 lt!124787) #b00000000000000000000000000000000)))))

(declare-fun b!249259 () Bool)

(declare-fun call!23379 () Bool)

(assert (=> b!249259 (= e!161671 call!23379)))

(declare-fun bm!23376 () Bool)

(assert (=> bm!23376 (= call!23379 (arrayNoDuplicates!0 lt!124787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41803 (Cons!3629 (select (arr!5816 lt!124787) #b00000000000000000000000000000000) Nil!3630) Nil!3630)))))

(declare-fun b!249260 () Bool)

(assert (=> b!249260 (= e!161671 call!23379)))

(assert (= (and d!60691 (not res!122114)) b!249257))

(assert (= (and b!249257 res!122116) b!249256))

(assert (= (and b!249257 res!122115) b!249258))

(assert (= (and b!249258 c!41803) b!249259))

(assert (= (and b!249258 (not c!41803)) b!249260))

(assert (= (or b!249259 b!249260) bm!23376))

(declare-fun m!265945 () Bool)

(assert (=> b!249256 m!265945))

(assert (=> b!249256 m!265945))

(declare-fun m!265947 () Bool)

(assert (=> b!249256 m!265947))

(assert (=> b!249257 m!265945))

(assert (=> b!249257 m!265945))

(declare-fun m!265949 () Bool)

(assert (=> b!249257 m!265949))

(assert (=> b!249258 m!265945))

(assert (=> b!249258 m!265945))

(assert (=> b!249258 m!265949))

(assert (=> bm!23376 m!265945))

(declare-fun m!265951 () Bool)

(assert (=> bm!23376 m!265951))

(assert (=> b!249092 d!60691))

(declare-fun d!60693 () Bool)

(declare-fun lt!124860 () (_ BitVec 32))

(assert (=> d!60693 (and (bvsge lt!124860 #b00000000000000000000000000000000) (bvsle lt!124860 (bvsub (size!6159 lt!124787) #b00000000000000000000000000000000)))))

(declare-fun e!161675 () (_ BitVec 32))

(assert (=> d!60693 (= lt!124860 e!161675)))

(declare-fun c!41805 () Bool)

(assert (=> d!60693 (= c!41805 (bvsge #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> d!60693 (and (bvsle #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6159 (_keys!6733 thiss!1504)) (size!6159 lt!124787)))))

(assert (=> d!60693 (= (arrayCountValidKeys!0 lt!124787 #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) lt!124860)))

(declare-fun bm!23377 () Bool)

(declare-fun call!23380 () (_ BitVec 32))

(assert (=> bm!23377 (= call!23380 (arrayCountValidKeys!0 lt!124787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249261 () Bool)

(declare-fun e!161676 () (_ BitVec 32))

(assert (=> b!249261 (= e!161676 call!23380)))

(declare-fun b!249262 () Bool)

(assert (=> b!249262 (= e!161676 (bvadd #b00000000000000000000000000000001 call!23380))))

(declare-fun b!249263 () Bool)

(assert (=> b!249263 (= e!161675 e!161676)))

(declare-fun c!41804 () Bool)

(assert (=> b!249263 (= c!41804 (validKeyInArray!0 (select (arr!5816 lt!124787) #b00000000000000000000000000000000)))))

(declare-fun b!249264 () Bool)

(assert (=> b!249264 (= e!161675 #b00000000000000000000000000000000)))

(assert (= (and d!60693 c!41805) b!249264))

(assert (= (and d!60693 (not c!41805)) b!249263))

(assert (= (and b!249263 c!41804) b!249262))

(assert (= (and b!249263 (not c!41804)) b!249261))

(assert (= (or b!249262 b!249261) bm!23377))

(declare-fun m!265953 () Bool)

(assert (=> bm!23377 m!265953))

(assert (=> b!249263 m!265945))

(assert (=> b!249263 m!265945))

(assert (=> b!249263 m!265949))

(assert (=> b!249092 d!60693))

(declare-fun d!60695 () Bool)

(declare-fun e!161679 () Bool)

(assert (=> d!60695 e!161679))

(declare-fun res!122119 () Bool)

(assert (=> d!60695 (=> (not res!122119) (not e!161679))))

(assert (=> d!60695 (= res!122119 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6159 (_keys!6733 thiss!1504)))))))

(declare-fun lt!124863 () Unit!7683)

(declare-fun choose!41 (array!12263 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3633) Unit!7683)

(assert (=> d!60695 (= lt!124863 (choose!41 (_keys!6733 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3630))))

(assert (=> d!60695 (bvslt (size!6159 (_keys!6733 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60695 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6733 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3630) lt!124863)))

(declare-fun b!249267 () Bool)

(assert (=> b!249267 (= e!161679 (arrayNoDuplicates!0 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) #b00000000000000000000000000000000 Nil!3630))))

(assert (= (and d!60695 res!122119) b!249267))

(declare-fun m!265955 () Bool)

(assert (=> d!60695 m!265955))

(assert (=> b!249267 m!265809))

(declare-fun m!265957 () Bool)

(assert (=> b!249267 m!265957))

(assert (=> b!249092 d!60695))

(declare-fun b!249277 () Bool)

(declare-fun res!122131 () Bool)

(declare-fun e!161685 () Bool)

(assert (=> b!249277 (=> (not res!122131) (not e!161685))))

(assert (=> b!249277 (= res!122131 (validKeyInArray!0 key!932))))

(declare-fun b!249278 () Bool)

(assert (=> b!249278 (= e!161685 (bvslt (size!6159 (_keys!6733 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!249279 () Bool)

(declare-fun e!161684 () Bool)

(assert (=> b!249279 (= e!161684 (= (arrayCountValidKeys!0 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6733 thiss!1504) #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!249276 () Bool)

(declare-fun res!122129 () Bool)

(assert (=> b!249276 (=> (not res!122129) (not e!161685))))

(assert (=> b!249276 (= res!122129 (not (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) index!297))))))

(declare-fun d!60697 () Bool)

(assert (=> d!60697 e!161684))

(declare-fun res!122128 () Bool)

(assert (=> d!60697 (=> (not res!122128) (not e!161684))))

(assert (=> d!60697 (= res!122128 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6159 (_keys!6733 thiss!1504)))))))

(declare-fun lt!124866 () Unit!7683)

(declare-fun choose!1 (array!12263 (_ BitVec 32) (_ BitVec 64)) Unit!7683)

(assert (=> d!60697 (= lt!124866 (choose!1 (_keys!6733 thiss!1504) index!297 key!932))))

(assert (=> d!60697 e!161685))

(declare-fun res!122130 () Bool)

(assert (=> d!60697 (=> (not res!122130) (not e!161685))))

(assert (=> d!60697 (= res!122130 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6159 (_keys!6733 thiss!1504)))))))

(assert (=> d!60697 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6733 thiss!1504) index!297 key!932) lt!124866)))

(assert (= (and d!60697 res!122130) b!249276))

(assert (= (and b!249276 res!122129) b!249277))

(assert (= (and b!249277 res!122131) b!249278))

(assert (= (and d!60697 res!122128) b!249279))

(declare-fun m!265959 () Bool)

(assert (=> b!249277 m!265959))

(assert (=> b!249279 m!265809))

(declare-fun m!265961 () Bool)

(assert (=> b!249279 m!265961))

(assert (=> b!249279 m!265811))

(declare-fun m!265963 () Bool)

(assert (=> b!249276 m!265963))

(assert (=> b!249276 m!265963))

(declare-fun m!265965 () Bool)

(assert (=> b!249276 m!265965))

(declare-fun m!265967 () Bool)

(assert (=> d!60697 m!265967))

(assert (=> b!249092 d!60697))

(declare-fun b!249288 () Bool)

(declare-fun e!161693 () Bool)

(declare-fun e!161692 () Bool)

(assert (=> b!249288 (= e!161693 e!161692)))

(declare-fun lt!124874 () (_ BitVec 64))

(assert (=> b!249288 (= lt!124874 (select (arr!5816 lt!124787) #b00000000000000000000000000000000))))

(declare-fun lt!124873 () Unit!7683)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12263 (_ BitVec 64) (_ BitVec 32)) Unit!7683)

(assert (=> b!249288 (= lt!124873 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124787 lt!124874 #b00000000000000000000000000000000))))

(assert (=> b!249288 (arrayContainsKey!0 lt!124787 lt!124874 #b00000000000000000000000000000000)))

(declare-fun lt!124875 () Unit!7683)

(assert (=> b!249288 (= lt!124875 lt!124873)))

(declare-fun res!122137 () Bool)

(assert (=> b!249288 (= res!122137 (= (seekEntryOrOpen!0 (select (arr!5816 lt!124787) #b00000000000000000000000000000000) lt!124787 (mask!10766 thiss!1504)) (Found!1081 #b00000000000000000000000000000000)))))

(assert (=> b!249288 (=> (not res!122137) (not e!161692))))

(declare-fun b!249289 () Bool)

(declare-fun e!161694 () Bool)

(assert (=> b!249289 (= e!161694 e!161693)))

(declare-fun c!41808 () Bool)

(assert (=> b!249289 (= c!41808 (validKeyInArray!0 (select (arr!5816 lt!124787) #b00000000000000000000000000000000)))))

(declare-fun bm!23380 () Bool)

(declare-fun call!23383 () Bool)

(assert (=> bm!23380 (= call!23383 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124787 (mask!10766 thiss!1504)))))

(declare-fun d!60699 () Bool)

(declare-fun res!122136 () Bool)

(assert (=> d!60699 (=> res!122136 e!161694)))

(assert (=> d!60699 (= res!122136 (bvsge #b00000000000000000000000000000000 (size!6159 lt!124787)))))

(assert (=> d!60699 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124787 (mask!10766 thiss!1504)) e!161694)))

(declare-fun b!249290 () Bool)

(assert (=> b!249290 (= e!161693 call!23383)))

(declare-fun b!249291 () Bool)

(assert (=> b!249291 (= e!161692 call!23383)))

(assert (= (and d!60699 (not res!122136)) b!249289))

(assert (= (and b!249289 c!41808) b!249288))

(assert (= (and b!249289 (not c!41808)) b!249290))

(assert (= (and b!249288 res!122137) b!249291))

(assert (= (or b!249291 b!249290) bm!23380))

(assert (=> b!249288 m!265945))

(declare-fun m!265969 () Bool)

(assert (=> b!249288 m!265969))

(declare-fun m!265971 () Bool)

(assert (=> b!249288 m!265971))

(assert (=> b!249288 m!265945))

(declare-fun m!265973 () Bool)

(assert (=> b!249288 m!265973))

(assert (=> b!249289 m!265945))

(assert (=> b!249289 m!265945))

(assert (=> b!249289 m!265949))

(declare-fun m!265975 () Bool)

(assert (=> bm!23380 m!265975))

(assert (=> b!249092 d!60699))

(declare-fun d!60701 () Bool)

(declare-fun res!122142 () Bool)

(declare-fun e!161699 () Bool)

(assert (=> d!60701 (=> res!122142 e!161699)))

(assert (=> d!60701 (= res!122142 (= (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60701 (= (arrayContainsKey!0 (_keys!6733 thiss!1504) key!932 #b00000000000000000000000000000000) e!161699)))

(declare-fun b!249296 () Bool)

(declare-fun e!161700 () Bool)

(assert (=> b!249296 (= e!161699 e!161700)))

(declare-fun res!122143 () Bool)

(assert (=> b!249296 (=> (not res!122143) (not e!161700))))

(assert (=> b!249296 (= res!122143 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249297 () Bool)

(assert (=> b!249297 (= e!161700 (arrayContainsKey!0 (_keys!6733 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60701 (not res!122142)) b!249296))

(assert (= (and b!249296 res!122143) b!249297))

(assert (=> d!60701 m!265941))

(declare-fun m!265977 () Bool)

(assert (=> b!249297 m!265977))

(assert (=> b!249092 d!60701))

(declare-fun d!60703 () Bool)

(declare-fun e!161703 () Bool)

(assert (=> d!60703 e!161703))

(declare-fun res!122146 () Bool)

(assert (=> d!60703 (=> (not res!122146) (not e!161703))))

(assert (=> d!60703 (= res!122146 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6159 (_keys!6733 thiss!1504)))))))

(declare-fun lt!124878 () Unit!7683)

(declare-fun choose!102 ((_ BitVec 64) array!12263 (_ BitVec 32) (_ BitVec 32)) Unit!7683)

(assert (=> d!60703 (= lt!124878 (choose!102 key!932 (_keys!6733 thiss!1504) index!297 (mask!10766 thiss!1504)))))

(assert (=> d!60703 (validMask!0 (mask!10766 thiss!1504))))

(assert (=> d!60703 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6733 thiss!1504) index!297 (mask!10766 thiss!1504)) lt!124878)))

(declare-fun b!249300 () Bool)

(assert (=> b!249300 (= e!161703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) (mask!10766 thiss!1504)))))

(assert (= (and d!60703 res!122146) b!249300))

(declare-fun m!265979 () Bool)

(assert (=> d!60703 m!265979))

(assert (=> d!60703 m!265795))

(assert (=> b!249300 m!265809))

(declare-fun m!265981 () Bool)

(assert (=> b!249300 m!265981))

(assert (=> b!249092 d!60703))

(assert (=> bm!23357 d!60701))

(declare-fun d!60705 () Bool)

(declare-fun res!122153 () Bool)

(declare-fun e!161706 () Bool)

(assert (=> d!60705 (=> (not res!122153) (not e!161706))))

(declare-fun simpleValid!261 (LongMapFixedSize!3688) Bool)

(assert (=> d!60705 (= res!122153 (simpleValid!261 thiss!1504))))

(assert (=> d!60705 (= (valid!1452 thiss!1504) e!161706)))

(declare-fun b!249307 () Bool)

(declare-fun res!122154 () Bool)

(assert (=> b!249307 (=> (not res!122154) (not e!161706))))

(assert (=> b!249307 (= res!122154 (= (arrayCountValidKeys!0 (_keys!6733 thiss!1504) #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) (_size!1893 thiss!1504)))))

(declare-fun b!249308 () Bool)

(declare-fun res!122155 () Bool)

(assert (=> b!249308 (=> (not res!122155) (not e!161706))))

(assert (=> b!249308 (= res!122155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(declare-fun b!249309 () Bool)

(assert (=> b!249309 (= e!161706 (arrayNoDuplicates!0 (_keys!6733 thiss!1504) #b00000000000000000000000000000000 Nil!3630))))

(assert (= (and d!60705 res!122153) b!249307))

(assert (= (and b!249307 res!122154) b!249308))

(assert (= (and b!249308 res!122155) b!249309))

(declare-fun m!265983 () Bool)

(assert (=> d!60705 m!265983))

(assert (=> b!249307 m!265811))

(declare-fun m!265985 () Bool)

(assert (=> b!249308 m!265985))

(declare-fun m!265987 () Bool)

(assert (=> b!249309 m!265987))

(assert (=> start!23706 d!60705))

(declare-fun b!249322 () Bool)

(declare-fun e!161713 () SeekEntryResult!1081)

(declare-fun lt!124887 () SeekEntryResult!1081)

(assert (=> b!249322 (= e!161713 (MissingZero!1081 (index!6496 lt!124887)))))

(declare-fun d!60707 () Bool)

(declare-fun lt!124886 () SeekEntryResult!1081)

(assert (=> d!60707 (and (or ((_ is Undefined!1081) lt!124886) (not ((_ is Found!1081) lt!124886)) (and (bvsge (index!6495 lt!124886) #b00000000000000000000000000000000) (bvslt (index!6495 lt!124886) (size!6159 (_keys!6733 thiss!1504))))) (or ((_ is Undefined!1081) lt!124886) ((_ is Found!1081) lt!124886) (not ((_ is MissingZero!1081) lt!124886)) (and (bvsge (index!6494 lt!124886) #b00000000000000000000000000000000) (bvslt (index!6494 lt!124886) (size!6159 (_keys!6733 thiss!1504))))) (or ((_ is Undefined!1081) lt!124886) ((_ is Found!1081) lt!124886) ((_ is MissingZero!1081) lt!124886) (not ((_ is MissingVacant!1081) lt!124886)) (and (bvsge (index!6497 lt!124886) #b00000000000000000000000000000000) (bvslt (index!6497 lt!124886) (size!6159 (_keys!6733 thiss!1504))))) (or ((_ is Undefined!1081) lt!124886) (ite ((_ is Found!1081) lt!124886) (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6495 lt!124886)) key!932) (ite ((_ is MissingZero!1081) lt!124886) (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6494 lt!124886)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1081) lt!124886) (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6497 lt!124886)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!161715 () SeekEntryResult!1081)

(assert (=> d!60707 (= lt!124886 e!161715)))

(declare-fun c!41815 () Bool)

(assert (=> d!60707 (= c!41815 (and ((_ is Intermediate!1081) lt!124887) (undefined!1893 lt!124887)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12263 (_ BitVec 32)) SeekEntryResult!1081)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60707 (= lt!124887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10766 thiss!1504)) key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(assert (=> d!60707 (validMask!0 (mask!10766 thiss!1504))))

(assert (=> d!60707 (= (seekEntryOrOpen!0 key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)) lt!124886)))

(declare-fun b!249323 () Bool)

(declare-fun e!161714 () SeekEntryResult!1081)

(assert (=> b!249323 (= e!161714 (Found!1081 (index!6496 lt!124887)))))

(declare-fun b!249324 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12263 (_ BitVec 32)) SeekEntryResult!1081)

(assert (=> b!249324 (= e!161713 (seekKeyOrZeroReturnVacant!0 (x!24579 lt!124887) (index!6496 lt!124887) (index!6496 lt!124887) key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(declare-fun b!249325 () Bool)

(declare-fun c!41817 () Bool)

(declare-fun lt!124885 () (_ BitVec 64))

(assert (=> b!249325 (= c!41817 (= lt!124885 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249325 (= e!161714 e!161713)))

(declare-fun b!249326 () Bool)

(assert (=> b!249326 (= e!161715 e!161714)))

(assert (=> b!249326 (= lt!124885 (select (arr!5816 (_keys!6733 thiss!1504)) (index!6496 lt!124887)))))

(declare-fun c!41816 () Bool)

(assert (=> b!249326 (= c!41816 (= lt!124885 key!932))))

(declare-fun b!249327 () Bool)

(assert (=> b!249327 (= e!161715 Undefined!1081)))

(assert (= (and d!60707 c!41815) b!249327))

(assert (= (and d!60707 (not c!41815)) b!249326))

(assert (= (and b!249326 c!41816) b!249323))

(assert (= (and b!249326 (not c!41816)) b!249325))

(assert (= (and b!249325 c!41817) b!249322))

(assert (= (and b!249325 (not c!41817)) b!249324))

(declare-fun m!265989 () Bool)

(assert (=> d!60707 m!265989))

(declare-fun m!265991 () Bool)

(assert (=> d!60707 m!265991))

(declare-fun m!265993 () Bool)

(assert (=> d!60707 m!265993))

(assert (=> d!60707 m!265795))

(assert (=> d!60707 m!265993))

(declare-fun m!265995 () Bool)

(assert (=> d!60707 m!265995))

(declare-fun m!265997 () Bool)

(assert (=> d!60707 m!265997))

(declare-fun m!265999 () Bool)

(assert (=> b!249324 m!265999))

(declare-fun m!266001 () Bool)

(assert (=> b!249326 m!266001))

(assert (=> b!249106 d!60707))

(declare-fun d!60709 () Bool)

(declare-fun e!161718 () Bool)

(assert (=> d!60709 e!161718))

(declare-fun res!122161 () Bool)

(assert (=> d!60709 (=> (not res!122161) (not e!161718))))

(declare-fun lt!124893 () SeekEntryResult!1081)

(assert (=> d!60709 (= res!122161 ((_ is Found!1081) lt!124893))))

(assert (=> d!60709 (= lt!124893 (seekEntryOrOpen!0 key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(declare-fun lt!124892 () Unit!7683)

(declare-fun choose!1180 (array!12263 array!12261 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) Int) Unit!7683)

(assert (=> d!60709 (= lt!124892 (choose!1180 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)))))

(assert (=> d!60709 (validMask!0 (mask!10766 thiss!1504))))

(assert (=> d!60709 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!387 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)) lt!124892)))

(declare-fun b!249332 () Bool)

(declare-fun res!122160 () Bool)

(assert (=> b!249332 (=> (not res!122160) (not e!161718))))

(assert (=> b!249332 (= res!122160 (inRange!0 (index!6495 lt!124893) (mask!10766 thiss!1504)))))

(declare-fun b!249333 () Bool)

(assert (=> b!249333 (= e!161718 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6495 lt!124893)) key!932))))

(assert (=> b!249333 (and (bvsge (index!6495 lt!124893) #b00000000000000000000000000000000) (bvslt (index!6495 lt!124893) (size!6159 (_keys!6733 thiss!1504))))))

(assert (= (and d!60709 res!122161) b!249332))

(assert (= (and b!249332 res!122160) b!249333))

(assert (=> d!60709 m!265819))

(declare-fun m!266003 () Bool)

(assert (=> d!60709 m!266003))

(assert (=> d!60709 m!265795))

(declare-fun m!266005 () Bool)

(assert (=> b!249332 m!266005))

(declare-fun m!266007 () Bool)

(assert (=> b!249333 m!266007))

(assert (=> b!249091 d!60709))

(declare-fun b!249350 () Bool)

(declare-fun res!122170 () Bool)

(declare-fun e!161728 () Bool)

(assert (=> b!249350 (=> (not res!122170) (not e!161728))))

(declare-fun lt!124898 () SeekEntryResult!1081)

(assert (=> b!249350 (= res!122170 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6497 lt!124898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249350 (and (bvsge (index!6497 lt!124898) #b00000000000000000000000000000000) (bvslt (index!6497 lt!124898) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun c!41822 () Bool)

(declare-fun bm!23385 () Bool)

(declare-fun call!23389 () Bool)

(assert (=> bm!23385 (= call!23389 (inRange!0 (ite c!41822 (index!6494 lt!124898) (index!6497 lt!124898)) (mask!10766 thiss!1504)))))

(declare-fun b!249351 () Bool)

(declare-fun res!122173 () Bool)

(assert (=> b!249351 (=> (not res!122173) (not e!161728))))

(assert (=> b!249351 (= res!122173 call!23389)))

(declare-fun e!161730 () Bool)

(assert (=> b!249351 (= e!161730 e!161728)))

(declare-fun b!249352 () Bool)

(declare-fun e!161727 () Bool)

(declare-fun e!161729 () Bool)

(assert (=> b!249352 (= e!161727 e!161729)))

(declare-fun res!122172 () Bool)

(assert (=> b!249352 (= res!122172 call!23389)))

(assert (=> b!249352 (=> (not res!122172) (not e!161729))))

(declare-fun b!249353 () Bool)

(declare-fun call!23388 () Bool)

(assert (=> b!249353 (= e!161729 (not call!23388))))

(declare-fun b!249354 () Bool)

(assert (=> b!249354 (and (bvsge (index!6494 lt!124898) #b00000000000000000000000000000000) (bvslt (index!6494 lt!124898) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun res!122171 () Bool)

(assert (=> b!249354 (= res!122171 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6494 lt!124898)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249354 (=> (not res!122171) (not e!161729))))

(declare-fun b!249355 () Bool)

(assert (=> b!249355 (= e!161728 (not call!23388))))

(declare-fun d!60711 () Bool)

(assert (=> d!60711 e!161727))

(assert (=> d!60711 (= c!41822 ((_ is MissingZero!1081) lt!124898))))

(assert (=> d!60711 (= lt!124898 (seekEntryOrOpen!0 key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(declare-fun lt!124899 () Unit!7683)

(declare-fun choose!1181 (array!12263 array!12261 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) Int) Unit!7683)

(assert (=> d!60711 (= lt!124899 (choose!1181 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)))))

(assert (=> d!60711 (validMask!0 (mask!10766 thiss!1504))))

(assert (=> d!60711 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)) lt!124899)))

(declare-fun b!249356 () Bool)

(assert (=> b!249356 (= e!161730 ((_ is Undefined!1081) lt!124898))))

(declare-fun b!249357 () Bool)

(assert (=> b!249357 (= e!161727 e!161730)))

(declare-fun c!41823 () Bool)

(assert (=> b!249357 (= c!41823 ((_ is MissingVacant!1081) lt!124898))))

(declare-fun bm!23386 () Bool)

(assert (=> bm!23386 (= call!23388 (arrayContainsKey!0 (_keys!6733 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and d!60711 c!41822) b!249352))

(assert (= (and d!60711 (not c!41822)) b!249357))

(assert (= (and b!249352 res!122172) b!249354))

(assert (= (and b!249354 res!122171) b!249353))

(assert (= (and b!249357 c!41823) b!249351))

(assert (= (and b!249357 (not c!41823)) b!249356))

(assert (= (and b!249351 res!122173) b!249350))

(assert (= (and b!249350 res!122170) b!249355))

(assert (= (or b!249352 b!249351) bm!23385))

(assert (= (or b!249353 b!249355) bm!23386))

(declare-fun m!266009 () Bool)

(assert (=> b!249350 m!266009))

(assert (=> bm!23386 m!265797))

(declare-fun m!266011 () Bool)

(assert (=> bm!23385 m!266011))

(declare-fun m!266013 () Bool)

(assert (=> b!249354 m!266013))

(assert (=> d!60711 m!265819))

(declare-fun m!266015 () Bool)

(assert (=> d!60711 m!266015))

(assert (=> d!60711 m!265795))

(assert (=> b!249100 d!60711))

(declare-fun d!60713 () Bool)

(assert (=> d!60713 (= (array_inv!3823 (_keys!6733 thiss!1504)) (bvsge (size!6159 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249099 d!60713))

(declare-fun d!60715 () Bool)

(assert (=> d!60715 (= (array_inv!3824 (_values!4588 thiss!1504)) (bvsge (size!6158 (_values!4588 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249099 d!60715))

(declare-fun d!60717 () Bool)

(assert (=> d!60717 (contains!1784 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) key!932)))

(declare-fun lt!124902 () Unit!7683)

(declare-fun choose!1182 (array!12263 array!12261 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) (_ BitVec 32) Int) Unit!7683)

(assert (=> d!60717 (= lt!124902 (choose!1182 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(assert (=> d!60717 (validMask!0 (mask!10766 thiss!1504))))

(assert (=> d!60717 (= (lemmaArrayContainsKeyThenInListMap!208 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) lt!124902)))

(declare-fun bs!8962 () Bool)

(assert (= bs!8962 d!60717))

(assert (=> bs!8962 m!265831))

(assert (=> bs!8962 m!265831))

(assert (=> bs!8962 m!265833))

(declare-fun m!266017 () Bool)

(assert (=> bs!8962 m!266017))

(assert (=> bs!8962 m!265795))

(assert (=> b!249103 d!60717))

(declare-fun d!60719 () Bool)

(assert (=> d!60719 (= (inRange!0 index!297 (mask!10766 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10766 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249107 d!60719))

(declare-fun d!60721 () Bool)

(declare-fun e!161735 () Bool)

(assert (=> d!60721 e!161735))

(declare-fun res!122176 () Bool)

(assert (=> d!60721 (=> res!122176 e!161735)))

(declare-fun lt!124914 () Bool)

(assert (=> d!60721 (= res!122176 (not lt!124914))))

(declare-fun lt!124912 () Bool)

(assert (=> d!60721 (= lt!124914 lt!124912)))

(declare-fun lt!124913 () Unit!7683)

(declare-fun e!161736 () Unit!7683)

(assert (=> d!60721 (= lt!124913 e!161736)))

(declare-fun c!41826 () Bool)

(assert (=> d!60721 (= c!41826 lt!124912)))

(declare-fun containsKey!288 (List!3634 (_ BitVec 64)) Bool)

(assert (=> d!60721 (= lt!124912 (containsKey!288 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(assert (=> d!60721 (= (contains!1784 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) key!932) lt!124914)))

(declare-fun b!249364 () Bool)

(declare-fun lt!124911 () Unit!7683)

(assert (=> b!249364 (= e!161736 lt!124911)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!236 (List!3634 (_ BitVec 64)) Unit!7683)

(assert (=> b!249364 (= lt!124911 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(declare-datatypes ((Option!303 0))(
  ( (Some!302 (v!5347 V!8281)) (None!301) )
))
(declare-fun isDefined!237 (Option!303) Bool)

(declare-fun getValueByKey!297 (List!3634 (_ BitVec 64)) Option!303)

(assert (=> b!249364 (isDefined!237 (getValueByKey!297 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(declare-fun b!249365 () Bool)

(declare-fun Unit!7695 () Unit!7683)

(assert (=> b!249365 (= e!161736 Unit!7695)))

(declare-fun b!249366 () Bool)

(assert (=> b!249366 (= e!161735 (isDefined!237 (getValueByKey!297 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932)))))

(assert (= (and d!60721 c!41826) b!249364))

(assert (= (and d!60721 (not c!41826)) b!249365))

(assert (= (and d!60721 (not res!122176)) b!249366))

(declare-fun m!266019 () Bool)

(assert (=> d!60721 m!266019))

(declare-fun m!266021 () Bool)

(assert (=> b!249364 m!266021))

(declare-fun m!266023 () Bool)

(assert (=> b!249364 m!266023))

(assert (=> b!249364 m!266023))

(declare-fun m!266025 () Bool)

(assert (=> b!249364 m!266025))

(assert (=> b!249366 m!266023))

(assert (=> b!249366 m!266023))

(assert (=> b!249366 m!266025))

(assert (=> b!249107 d!60721))

(declare-fun b!249409 () Bool)

(declare-fun res!122198 () Bool)

(declare-fun e!161772 () Bool)

(assert (=> b!249409 (=> (not res!122198) (not e!161772))))

(declare-fun e!161770 () Bool)

(assert (=> b!249409 (= res!122198 e!161770)))

(declare-fun res!122195 () Bool)

(assert (=> b!249409 (=> res!122195 e!161770)))

(declare-fun e!161765 () Bool)

(assert (=> b!249409 (= res!122195 (not e!161765))))

(declare-fun res!122199 () Bool)

(assert (=> b!249409 (=> (not res!122199) (not e!161765))))

(assert (=> b!249409 (= res!122199 (bvslt #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249410 () Bool)

(declare-fun e!161767 () Bool)

(declare-fun lt!124978 () ListLongMap!3671)

(declare-fun apply!238 (ListLongMap!3671 (_ BitVec 64)) V!8281)

(assert (=> b!249410 (= e!161767 (= (apply!238 lt!124978 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4446 thiss!1504)))))

(declare-fun bm!23401 () Bool)

(declare-fun call!23406 () Bool)

(assert (=> bm!23401 (= call!23406 (contains!1784 lt!124978 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249411 () Bool)

(declare-fun e!161766 () ListLongMap!3671)

(declare-fun call!23409 () ListLongMap!3671)

(assert (=> b!249411 (= e!161766 call!23409)))

(declare-fun bm!23402 () Bool)

(declare-fun call!23404 () ListLongMap!3671)

(declare-fun call!23408 () ListLongMap!3671)

(assert (=> bm!23402 (= call!23404 call!23408)))

(declare-fun d!60723 () Bool)

(assert (=> d!60723 e!161772))

(declare-fun res!122197 () Bool)

(assert (=> d!60723 (=> (not res!122197) (not e!161772))))

(assert (=> d!60723 (= res!122197 (or (bvsge #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))))

(declare-fun lt!124972 () ListLongMap!3671)

(assert (=> d!60723 (= lt!124978 lt!124972)))

(declare-fun lt!124966 () Unit!7683)

(declare-fun e!161764 () Unit!7683)

(assert (=> d!60723 (= lt!124966 e!161764)))

(declare-fun c!41843 () Bool)

(declare-fun e!161773 () Bool)

(assert (=> d!60723 (= c!41843 e!161773)))

(declare-fun res!122203 () Bool)

(assert (=> d!60723 (=> (not res!122203) (not e!161773))))

(assert (=> d!60723 (= res!122203 (bvslt #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun e!161763 () ListLongMap!3671)

(assert (=> d!60723 (= lt!124972 e!161763)))

(declare-fun c!41840 () Bool)

(assert (=> d!60723 (= c!41840 (and (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60723 (validMask!0 (mask!10766 thiss!1504))))

(assert (=> d!60723 (= (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) lt!124978)))

(declare-fun b!249412 () Bool)

(declare-fun lt!124974 () Unit!7683)

(assert (=> b!249412 (= e!161764 lt!124974)))

(declare-fun lt!124964 () ListLongMap!3671)

(declare-fun getCurrentListMapNoExtraKeys!554 (array!12263 array!12261 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 32) Int) ListLongMap!3671)

(assert (=> b!249412 (= lt!124964 (getCurrentListMapNoExtraKeys!554 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(declare-fun lt!124968 () (_ BitVec 64))

(assert (=> b!249412 (= lt!124968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124975 () (_ BitVec 64))

(assert (=> b!249412 (= lt!124975 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124979 () Unit!7683)

(declare-fun addStillContains!214 (ListLongMap!3671 (_ BitVec 64) V!8281 (_ BitVec 64)) Unit!7683)

(assert (=> b!249412 (= lt!124979 (addStillContains!214 lt!124964 lt!124968 (zeroValue!4446 thiss!1504) lt!124975))))

(declare-fun +!665 (ListLongMap!3671 tuple2!4756) ListLongMap!3671)

(assert (=> b!249412 (contains!1784 (+!665 lt!124964 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504))) lt!124975)))

(declare-fun lt!124973 () Unit!7683)

(assert (=> b!249412 (= lt!124973 lt!124979)))

(declare-fun lt!124962 () ListLongMap!3671)

(assert (=> b!249412 (= lt!124962 (getCurrentListMapNoExtraKeys!554 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(declare-fun lt!124963 () (_ BitVec 64))

(assert (=> b!249412 (= lt!124963 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124969 () (_ BitVec 64))

(assert (=> b!249412 (= lt!124969 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124971 () Unit!7683)

(declare-fun addApplyDifferent!214 (ListLongMap!3671 (_ BitVec 64) V!8281 (_ BitVec 64)) Unit!7683)

(assert (=> b!249412 (= lt!124971 (addApplyDifferent!214 lt!124962 lt!124963 (minValue!4446 thiss!1504) lt!124969))))

(assert (=> b!249412 (= (apply!238 (+!665 lt!124962 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504))) lt!124969) (apply!238 lt!124962 lt!124969))))

(declare-fun lt!124959 () Unit!7683)

(assert (=> b!249412 (= lt!124959 lt!124971)))

(declare-fun lt!124960 () ListLongMap!3671)

(assert (=> b!249412 (= lt!124960 (getCurrentListMapNoExtraKeys!554 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(declare-fun lt!124976 () (_ BitVec 64))

(assert (=> b!249412 (= lt!124976 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124961 () (_ BitVec 64))

(assert (=> b!249412 (= lt!124961 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124970 () Unit!7683)

(assert (=> b!249412 (= lt!124970 (addApplyDifferent!214 lt!124960 lt!124976 (zeroValue!4446 thiss!1504) lt!124961))))

(assert (=> b!249412 (= (apply!238 (+!665 lt!124960 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504))) lt!124961) (apply!238 lt!124960 lt!124961))))

(declare-fun lt!124967 () Unit!7683)

(assert (=> b!249412 (= lt!124967 lt!124970)))

(declare-fun lt!124980 () ListLongMap!3671)

(assert (=> b!249412 (= lt!124980 (getCurrentListMapNoExtraKeys!554 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(declare-fun lt!124965 () (_ BitVec 64))

(assert (=> b!249412 (= lt!124965 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124977 () (_ BitVec 64))

(assert (=> b!249412 (= lt!124977 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249412 (= lt!124974 (addApplyDifferent!214 lt!124980 lt!124965 (minValue!4446 thiss!1504) lt!124977))))

(assert (=> b!249412 (= (apply!238 (+!665 lt!124980 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504))) lt!124977) (apply!238 lt!124980 lt!124977))))

(declare-fun bm!23403 () Bool)

(declare-fun call!23405 () ListLongMap!3671)

(assert (=> bm!23403 (= call!23409 call!23405)))

(declare-fun b!249413 () Bool)

(declare-fun e!161774 () Bool)

(assert (=> b!249413 (= e!161774 (not call!23406))))

(declare-fun b!249414 () Bool)

(declare-fun e!161769 () ListLongMap!3671)

(assert (=> b!249414 (= e!161769 call!23409)))

(declare-fun b!249415 () Bool)

(declare-fun e!161768 () Bool)

(declare-fun call!23407 () Bool)

(assert (=> b!249415 (= e!161768 (not call!23407))))

(declare-fun b!249416 () Bool)

(assert (=> b!249416 (= e!161773 (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun call!23410 () ListLongMap!3671)

(declare-fun bm!23404 () Bool)

(declare-fun c!41842 () Bool)

(assert (=> bm!23404 (= call!23405 (+!665 (ite c!41840 call!23408 (ite c!41842 call!23404 call!23410)) (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(declare-fun b!249417 () Bool)

(assert (=> b!249417 (= e!161769 call!23410)))

(declare-fun b!249418 () Bool)

(declare-fun e!161775 () Bool)

(declare-fun get!2991 (ValueCell!2894 V!8281) V!8281)

(declare-fun dynLambda!581 (Int (_ BitVec 64)) V!8281)

(assert (=> b!249418 (= e!161775 (= (apply!238 lt!124978 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)) (get!2991 (select (arr!5815 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6158 (_values!4588 thiss!1504))))))

(assert (=> b!249418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249419 () Bool)

(assert (=> b!249419 (= e!161768 e!161767)))

(declare-fun res!122196 () Bool)

(assert (=> b!249419 (= res!122196 call!23407)))

(assert (=> b!249419 (=> (not res!122196) (not e!161767))))

(declare-fun b!249420 () Bool)

(assert (=> b!249420 (= e!161763 (+!665 call!23405 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))

(declare-fun b!249421 () Bool)

(declare-fun c!41844 () Bool)

(assert (=> b!249421 (= c!41844 (and (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!249421 (= e!161766 e!161769)))

(declare-fun bm!23405 () Bool)

(assert (=> bm!23405 (= call!23408 (getCurrentListMapNoExtraKeys!554 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(declare-fun b!249422 () Bool)

(declare-fun res!122200 () Bool)

(assert (=> b!249422 (=> (not res!122200) (not e!161772))))

(assert (=> b!249422 (= res!122200 e!161768)))

(declare-fun c!41839 () Bool)

(assert (=> b!249422 (= c!41839 (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!249423 () Bool)

(assert (=> b!249423 (= e!161772 e!161774)))

(declare-fun c!41841 () Bool)

(assert (=> b!249423 (= c!41841 (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!249424 () Bool)

(assert (=> b!249424 (= e!161765 (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249425 () Bool)

(declare-fun e!161771 () Bool)

(assert (=> b!249425 (= e!161774 e!161771)))

(declare-fun res!122202 () Bool)

(assert (=> b!249425 (= res!122202 call!23406)))

(assert (=> b!249425 (=> (not res!122202) (not e!161771))))

(declare-fun b!249426 () Bool)

(assert (=> b!249426 (= e!161771 (= (apply!238 lt!124978 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4446 thiss!1504)))))

(declare-fun b!249427 () Bool)

(assert (=> b!249427 (= e!161770 e!161775)))

(declare-fun res!122201 () Bool)

(assert (=> b!249427 (=> (not res!122201) (not e!161775))))

(assert (=> b!249427 (= res!122201 (contains!1784 lt!124978 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249428 () Bool)

(assert (=> b!249428 (= e!161763 e!161766)))

(assert (=> b!249428 (= c!41842 (and (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!249429 () Bool)

(declare-fun Unit!7696 () Unit!7683)

(assert (=> b!249429 (= e!161764 Unit!7696)))

(declare-fun bm!23406 () Bool)

(assert (=> bm!23406 (= call!23407 (contains!1784 lt!124978 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23407 () Bool)

(assert (=> bm!23407 (= call!23410 call!23404)))

(assert (= (and d!60723 c!41840) b!249420))

(assert (= (and d!60723 (not c!41840)) b!249428))

(assert (= (and b!249428 c!41842) b!249411))

(assert (= (and b!249428 (not c!41842)) b!249421))

(assert (= (and b!249421 c!41844) b!249414))

(assert (= (and b!249421 (not c!41844)) b!249417))

(assert (= (or b!249414 b!249417) bm!23407))

(assert (= (or b!249411 bm!23407) bm!23402))

(assert (= (or b!249411 b!249414) bm!23403))

(assert (= (or b!249420 bm!23402) bm!23405))

(assert (= (or b!249420 bm!23403) bm!23404))

(assert (= (and d!60723 res!122203) b!249416))

(assert (= (and d!60723 c!41843) b!249412))

(assert (= (and d!60723 (not c!41843)) b!249429))

(assert (= (and d!60723 res!122197) b!249409))

(assert (= (and b!249409 res!122199) b!249424))

(assert (= (and b!249409 (not res!122195)) b!249427))

(assert (= (and b!249427 res!122201) b!249418))

(assert (= (and b!249409 res!122198) b!249422))

(assert (= (and b!249422 c!41839) b!249419))

(assert (= (and b!249422 (not c!41839)) b!249415))

(assert (= (and b!249419 res!122196) b!249410))

(assert (= (or b!249419 b!249415) bm!23406))

(assert (= (and b!249422 res!122200) b!249423))

(assert (= (and b!249423 c!41841) b!249425))

(assert (= (and b!249423 (not c!41841)) b!249413))

(assert (= (and b!249425 res!122202) b!249426))

(assert (= (or b!249425 b!249413) bm!23401))

(declare-fun b_lambda!8085 () Bool)

(assert (=> (not b_lambda!8085) (not b!249418)))

(declare-fun t!8659 () Bool)

(declare-fun tb!2981 () Bool)

(assert (=> (and b!249099 (= (defaultEntry!4605 thiss!1504) (defaultEntry!4605 thiss!1504)) t!8659) tb!2981))

(declare-fun result!5281 () Bool)

(assert (=> tb!2981 (= result!5281 tp_is_empty!6475)))

(assert (=> b!249418 t!8659))

(declare-fun b_and!13641 () Bool)

(assert (= b_and!13635 (and (=> t!8659 result!5281) b_and!13641)))

(assert (=> b!249427 m!265941))

(assert (=> b!249427 m!265941))

(declare-fun m!266027 () Bool)

(assert (=> b!249427 m!266027))

(assert (=> b!249412 m!265941))

(declare-fun m!266029 () Bool)

(assert (=> b!249412 m!266029))

(declare-fun m!266031 () Bool)

(assert (=> b!249412 m!266031))

(declare-fun m!266033 () Bool)

(assert (=> b!249412 m!266033))

(declare-fun m!266035 () Bool)

(assert (=> b!249412 m!266035))

(declare-fun m!266037 () Bool)

(assert (=> b!249412 m!266037))

(declare-fun m!266039 () Bool)

(assert (=> b!249412 m!266039))

(declare-fun m!266041 () Bool)

(assert (=> b!249412 m!266041))

(declare-fun m!266043 () Bool)

(assert (=> b!249412 m!266043))

(declare-fun m!266045 () Bool)

(assert (=> b!249412 m!266045))

(declare-fun m!266047 () Bool)

(assert (=> b!249412 m!266047))

(assert (=> b!249412 m!266043))

(declare-fun m!266049 () Bool)

(assert (=> b!249412 m!266049))

(assert (=> b!249412 m!266041))

(declare-fun m!266051 () Bool)

(assert (=> b!249412 m!266051))

(declare-fun m!266053 () Bool)

(assert (=> b!249412 m!266053))

(declare-fun m!266055 () Bool)

(assert (=> b!249412 m!266055))

(declare-fun m!266057 () Bool)

(assert (=> b!249412 m!266057))

(assert (=> b!249412 m!266037))

(assert (=> b!249412 m!266031))

(declare-fun m!266059 () Bool)

(assert (=> b!249412 m!266059))

(declare-fun m!266061 () Bool)

(assert (=> bm!23404 m!266061))

(assert (=> bm!23405 m!266053))

(declare-fun m!266063 () Bool)

(assert (=> b!249418 m!266063))

(assert (=> b!249418 m!265941))

(assert (=> b!249418 m!266063))

(declare-fun m!266065 () Bool)

(assert (=> b!249418 m!266065))

(declare-fun m!266067 () Bool)

(assert (=> b!249418 m!266067))

(assert (=> b!249418 m!266065))

(assert (=> b!249418 m!265941))

(declare-fun m!266069 () Bool)

(assert (=> b!249418 m!266069))

(declare-fun m!266071 () Bool)

(assert (=> bm!23401 m!266071))

(assert (=> d!60723 m!265795))

(assert (=> b!249424 m!265941))

(assert (=> b!249424 m!265941))

(assert (=> b!249424 m!265943))

(declare-fun m!266073 () Bool)

(assert (=> b!249426 m!266073))

(declare-fun m!266075 () Bool)

(assert (=> b!249420 m!266075))

(declare-fun m!266077 () Bool)

(assert (=> bm!23406 m!266077))

(assert (=> b!249416 m!265941))

(assert (=> b!249416 m!265941))

(assert (=> b!249416 m!265943))

(declare-fun m!266079 () Bool)

(assert (=> b!249410 m!266079))

(assert (=> b!249107 d!60723))

(declare-fun b!249439 () Bool)

(declare-fun e!161780 () Bool)

(assert (=> b!249439 (= e!161780 tp_is_empty!6475)))

(declare-fun b!249438 () Bool)

(declare-fun e!161781 () Bool)

(assert (=> b!249438 (= e!161781 tp_is_empty!6475)))

(declare-fun mapNonEmpty!11006 () Bool)

(declare-fun mapRes!11006 () Bool)

(declare-fun tp!23111 () Bool)

(assert (=> mapNonEmpty!11006 (= mapRes!11006 (and tp!23111 e!161781))))

(declare-fun mapRest!11006 () (Array (_ BitVec 32) ValueCell!2894))

(declare-fun mapKey!11006 () (_ BitVec 32))

(declare-fun mapValue!11006 () ValueCell!2894)

(assert (=> mapNonEmpty!11006 (= mapRest!10997 (store mapRest!11006 mapKey!11006 mapValue!11006))))

(declare-fun condMapEmpty!11006 () Bool)

(declare-fun mapDefault!11006 () ValueCell!2894)

(assert (=> mapNonEmpty!10997 (= condMapEmpty!11006 (= mapRest!10997 ((as const (Array (_ BitVec 32) ValueCell!2894)) mapDefault!11006)))))

(assert (=> mapNonEmpty!10997 (= tp!23096 (and e!161780 mapRes!11006))))

(declare-fun mapIsEmpty!11006 () Bool)

(assert (=> mapIsEmpty!11006 mapRes!11006))

(assert (= (and mapNonEmpty!10997 condMapEmpty!11006) mapIsEmpty!11006))

(assert (= (and mapNonEmpty!10997 (not condMapEmpty!11006)) mapNonEmpty!11006))

(assert (= (and mapNonEmpty!11006 ((_ is ValueCellFull!2894) mapValue!11006)) b!249438))

(assert (= (and mapNonEmpty!10997 ((_ is ValueCellFull!2894) mapDefault!11006)) b!249439))

(declare-fun m!266081 () Bool)

(assert (=> mapNonEmpty!11006 m!266081))

(declare-fun b_lambda!8087 () Bool)

(assert (= b_lambda!8085 (or (and b!249099 b_free!6613) b_lambda!8087)))

(check-sat (not b_lambda!8087) (not b!249412) (not b!249288) (not b!249410) (not b!249309) (not b!249300) (not d!60711) (not bm!23406) (not bm!23380) (not b!249420) (not b!249267) (not b!249366) (not d!60723) (not bm!23376) (not b!249279) (not b!249307) (not b!249276) (not b_next!6613) (not bm!23405) (not b!249427) (not d!60717) (not d!60705) (not d!60697) (not d!60709) (not b!249263) tp_is_empty!6475 (not b!249324) (not bm!23377) (not b!249416) (not bm!23401) (not b!249277) b_and!13641 (not d!60703) (not d!60695) (not b!249418) (not b!249256) (not b!249364) (not mapNonEmpty!11006) (not d!60707) (not b!249297) (not b!249332) (not b!249289) (not b!249257) (not b!249258) (not bm!23373) (not bm!23386) (not b!249308) (not d!60721) (not bm!23385) (not b!249424) (not bm!23404) (not b!249426) (not b!249244))
(check-sat b_and!13641 (not b_next!6613))
(get-model)

(declare-fun d!60725 () Bool)

(declare-fun get!2992 (Option!303) V!8281)

(assert (=> d!60725 (= (apply!238 lt!124978 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2992 (getValueByKey!297 (toList!1851 lt!124978) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8963 () Bool)

(assert (= bs!8963 d!60725))

(declare-fun m!266083 () Bool)

(assert (=> bs!8963 m!266083))

(assert (=> bs!8963 m!266083))

(declare-fun m!266085 () Bool)

(assert (=> bs!8963 m!266085))

(assert (=> b!249426 d!60725))

(declare-fun d!60727 () Bool)

(assert (=> d!60727 (= (apply!238 lt!124978 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2992 (getValueByKey!297 (toList!1851 lt!124978) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8964 () Bool)

(assert (= bs!8964 d!60727))

(declare-fun m!266087 () Bool)

(assert (=> bs!8964 m!266087))

(assert (=> bs!8964 m!266087))

(declare-fun m!266089 () Bool)

(assert (=> bs!8964 m!266089))

(assert (=> b!249410 d!60727))

(declare-fun d!60729 () Bool)

(declare-fun res!122204 () Bool)

(declare-fun e!161782 () Bool)

(assert (=> d!60729 (=> res!122204 e!161782)))

(assert (=> d!60729 (= res!122204 (= (select (arr!5816 (_keys!6733 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!60729 (= (arrayContainsKey!0 (_keys!6733 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!161782)))

(declare-fun b!249440 () Bool)

(declare-fun e!161783 () Bool)

(assert (=> b!249440 (= e!161782 e!161783)))

(declare-fun res!122205 () Bool)

(assert (=> b!249440 (=> (not res!122205) (not e!161783))))

(assert (=> b!249440 (= res!122205 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249441 () Bool)

(assert (=> b!249441 (= e!161783 (arrayContainsKey!0 (_keys!6733 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!60729 (not res!122204)) b!249440))

(assert (= (and b!249440 res!122205) b!249441))

(declare-fun m!266091 () Bool)

(assert (=> d!60729 m!266091))

(declare-fun m!266093 () Bool)

(assert (=> b!249441 m!266093))

(assert (=> b!249297 d!60729))

(declare-fun d!60731 () Bool)

(assert (=> d!60731 (= (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249424 d!60731))

(assert (=> d!60723 d!60689))

(assert (=> d!60711 d!60707))

(declare-fun b!249458 () Bool)

(declare-fun res!122216 () Bool)

(declare-fun e!161794 () Bool)

(assert (=> b!249458 (=> (not res!122216) (not e!161794))))

(declare-fun lt!124983 () SeekEntryResult!1081)

(assert (=> b!249458 (= res!122216 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6497 lt!124983)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23412 () Bool)

(declare-fun call!23416 () Bool)

(assert (=> bm!23412 (= call!23416 (arrayContainsKey!0 (_keys!6733 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249459 () Bool)

(declare-fun e!161795 () Bool)

(declare-fun e!161792 () Bool)

(assert (=> b!249459 (= e!161795 e!161792)))

(declare-fun c!41849 () Bool)

(assert (=> b!249459 (= c!41849 ((_ is MissingVacant!1081) lt!124983))))

(declare-fun b!249460 () Bool)

(declare-fun res!122214 () Bool)

(assert (=> b!249460 (= res!122214 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6494 lt!124983)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161793 () Bool)

(assert (=> b!249460 (=> (not res!122214) (not e!161793))))

(declare-fun b!249461 () Bool)

(assert (=> b!249461 (= e!161794 (not call!23416))))

(declare-fun b!249462 () Bool)

(assert (=> b!249462 (= e!161795 e!161793)))

(declare-fun res!122217 () Bool)

(declare-fun call!23415 () Bool)

(assert (=> b!249462 (= res!122217 call!23415)))

(assert (=> b!249462 (=> (not res!122217) (not e!161793))))

(declare-fun c!41850 () Bool)

(declare-fun bm!23413 () Bool)

(assert (=> bm!23413 (= call!23415 (inRange!0 (ite c!41850 (index!6494 lt!124983) (index!6497 lt!124983)) (mask!10766 thiss!1504)))))

(declare-fun d!60733 () Bool)

(assert (=> d!60733 e!161795))

(assert (=> d!60733 (= c!41850 ((_ is MissingZero!1081) lt!124983))))

(assert (=> d!60733 (= lt!124983 (seekEntryOrOpen!0 key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(assert (=> d!60733 true))

(declare-fun _$34!1107 () Unit!7683)

(assert (=> d!60733 (= (choose!1181 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)) _$34!1107)))

(declare-fun b!249463 () Bool)

(assert (=> b!249463 (= e!161793 (not call!23416))))

(declare-fun b!249464 () Bool)

(declare-fun res!122215 () Bool)

(assert (=> b!249464 (=> (not res!122215) (not e!161794))))

(assert (=> b!249464 (= res!122215 call!23415)))

(assert (=> b!249464 (= e!161792 e!161794)))

(declare-fun b!249465 () Bool)

(assert (=> b!249465 (= e!161792 ((_ is Undefined!1081) lt!124983))))

(assert (= (and d!60733 c!41850) b!249462))

(assert (= (and d!60733 (not c!41850)) b!249459))

(assert (= (and b!249462 res!122217) b!249460))

(assert (= (and b!249460 res!122214) b!249463))

(assert (= (and b!249459 c!41849) b!249464))

(assert (= (and b!249459 (not c!41849)) b!249465))

(assert (= (and b!249464 res!122215) b!249458))

(assert (= (and b!249458 res!122216) b!249461))

(assert (= (or b!249462 b!249464) bm!23413))

(assert (= (or b!249463 b!249461) bm!23412))

(assert (=> bm!23412 m!265797))

(declare-fun m!266095 () Bool)

(assert (=> bm!23413 m!266095))

(declare-fun m!266097 () Bool)

(assert (=> b!249458 m!266097))

(declare-fun m!266099 () Bool)

(assert (=> b!249460 m!266099))

(assert (=> d!60733 m!265819))

(assert (=> d!60711 d!60733))

(assert (=> d!60711 d!60689))

(assert (=> bm!23386 d!60701))

(declare-fun d!60735 () Bool)

(declare-fun lt!124984 () (_ BitVec 32))

(assert (=> d!60735 (and (bvsge lt!124984 #b00000000000000000000000000000000) (bvsle lt!124984 (bvsub (size!6159 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!161796 () (_ BitVec 32))

(assert (=> d!60735 (= lt!124984 e!161796)))

(declare-fun c!41852 () Bool)

(assert (=> d!60735 (= c!41852 (bvsge #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> d!60735 (and (bvsle #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6159 (_keys!6733 thiss!1504)) (size!6159 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))))))))

(assert (=> d!60735 (= (arrayCountValidKeys!0 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) lt!124984)))

(declare-fun bm!23414 () Bool)

(declare-fun call!23417 () (_ BitVec 32))

(assert (=> bm!23414 (= call!23417 (arrayCountValidKeys!0 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249466 () Bool)

(declare-fun e!161797 () (_ BitVec 32))

(assert (=> b!249466 (= e!161797 call!23417)))

(declare-fun b!249467 () Bool)

(assert (=> b!249467 (= e!161797 (bvadd #b00000000000000000000000000000001 call!23417))))

(declare-fun b!249468 () Bool)

(assert (=> b!249468 (= e!161796 e!161797)))

(declare-fun c!41851 () Bool)

(assert (=> b!249468 (= c!41851 (validKeyInArray!0 (select (arr!5816 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249469 () Bool)

(assert (=> b!249469 (= e!161796 #b00000000000000000000000000000000)))

(assert (= (and d!60735 c!41852) b!249469))

(assert (= (and d!60735 (not c!41852)) b!249468))

(assert (= (and b!249468 c!41851) b!249467))

(assert (= (and b!249468 (not c!41851)) b!249466))

(assert (= (or b!249467 b!249466) bm!23414))

(declare-fun m!266101 () Bool)

(assert (=> bm!23414 m!266101))

(declare-fun m!266103 () Bool)

(assert (=> b!249468 m!266103))

(assert (=> b!249468 m!266103))

(declare-fun m!266105 () Bool)

(assert (=> b!249468 m!266105))

(assert (=> b!249279 d!60735))

(assert (=> b!249279 d!60687))

(declare-fun d!60737 () Bool)

(declare-fun res!122218 () Bool)

(declare-fun e!161799 () Bool)

(assert (=> d!60737 (=> res!122218 e!161799)))

(assert (=> d!60737 (= res!122218 (bvsge #b00000000000000000000000000000000 (size!6159 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))))))))

(assert (=> d!60737 (= (arrayNoDuplicates!0 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) #b00000000000000000000000000000000 Nil!3630) e!161799)))

(declare-fun b!249470 () Bool)

(declare-fun e!161801 () Bool)

(assert (=> b!249470 (= e!161801 (contains!1786 Nil!3630 (select (arr!5816 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249471 () Bool)

(declare-fun e!161800 () Bool)

(assert (=> b!249471 (= e!161799 e!161800)))

(declare-fun res!122219 () Bool)

(assert (=> b!249471 (=> (not res!122219) (not e!161800))))

(assert (=> b!249471 (= res!122219 (not e!161801))))

(declare-fun res!122220 () Bool)

(assert (=> b!249471 (=> (not res!122220) (not e!161801))))

(assert (=> b!249471 (= res!122220 (validKeyInArray!0 (select (arr!5816 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249472 () Bool)

(declare-fun e!161798 () Bool)

(assert (=> b!249472 (= e!161800 e!161798)))

(declare-fun c!41853 () Bool)

(assert (=> b!249472 (= c!41853 (validKeyInArray!0 (select (arr!5816 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249473 () Bool)

(declare-fun call!23418 () Bool)

(assert (=> b!249473 (= e!161798 call!23418)))

(declare-fun bm!23415 () Bool)

(assert (=> bm!23415 (= call!23418 (arrayNoDuplicates!0 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41853 (Cons!3629 (select (arr!5816 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504)))) #b00000000000000000000000000000000) Nil!3630) Nil!3630)))))

(declare-fun b!249474 () Bool)

(assert (=> b!249474 (= e!161798 call!23418)))

(assert (= (and d!60737 (not res!122218)) b!249471))

(assert (= (and b!249471 res!122220) b!249470))

(assert (= (and b!249471 res!122219) b!249472))

(assert (= (and b!249472 c!41853) b!249473))

(assert (= (and b!249472 (not c!41853)) b!249474))

(assert (= (or b!249473 b!249474) bm!23415))

(assert (=> b!249470 m!266103))

(assert (=> b!249470 m!266103))

(declare-fun m!266107 () Bool)

(assert (=> b!249470 m!266107))

(assert (=> b!249471 m!266103))

(assert (=> b!249471 m!266103))

(assert (=> b!249471 m!266105))

(assert (=> b!249472 m!266103))

(assert (=> b!249472 m!266103))

(assert (=> b!249472 m!266105))

(assert (=> bm!23415 m!266103))

(declare-fun m!266109 () Bool)

(assert (=> bm!23415 m!266109))

(assert (=> b!249267 d!60737))

(declare-fun d!60739 () Bool)

(declare-fun e!161804 () Bool)

(assert (=> d!60739 e!161804))

(declare-fun res!122226 () Bool)

(assert (=> d!60739 (=> (not res!122226) (not e!161804))))

(declare-fun lt!124994 () ListLongMap!3671)

(assert (=> d!60739 (= res!122226 (contains!1784 lt!124994 (_1!2389 (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))))

(declare-fun lt!124993 () List!3634)

(assert (=> d!60739 (= lt!124994 (ListLongMap!3672 lt!124993))))

(declare-fun lt!124996 () Unit!7683)

(declare-fun lt!124995 () Unit!7683)

(assert (=> d!60739 (= lt!124996 lt!124995)))

(assert (=> d!60739 (= (getValueByKey!297 lt!124993 (_1!2389 (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))) (Some!302 (_2!2389 (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!158 (List!3634 (_ BitVec 64) V!8281) Unit!7683)

(assert (=> d!60739 (= lt!124995 (lemmaContainsTupThenGetReturnValue!158 lt!124993 (_1!2389 (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))) (_2!2389 (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))))

(declare-fun insertStrictlySorted!161 (List!3634 (_ BitVec 64) V!8281) List!3634)

(assert (=> d!60739 (= lt!124993 (insertStrictlySorted!161 (toList!1851 (ite c!41840 call!23408 (ite c!41842 call!23404 call!23410))) (_1!2389 (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))) (_2!2389 (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))))

(assert (=> d!60739 (= (+!665 (ite c!41840 call!23408 (ite c!41842 call!23404 call!23410)) (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))) lt!124994)))

(declare-fun b!249479 () Bool)

(declare-fun res!122225 () Bool)

(assert (=> b!249479 (=> (not res!122225) (not e!161804))))

(assert (=> b!249479 (= res!122225 (= (getValueByKey!297 (toList!1851 lt!124994) (_1!2389 (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))) (Some!302 (_2!2389 (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))))

(declare-fun b!249480 () Bool)

(declare-fun contains!1787 (List!3634 tuple2!4756) Bool)

(assert (=> b!249480 (= e!161804 (contains!1787 (toList!1851 lt!124994) (ite (or c!41840 c!41842) (tuple2!4757 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(assert (= (and d!60739 res!122226) b!249479))

(assert (= (and b!249479 res!122225) b!249480))

(declare-fun m!266111 () Bool)

(assert (=> d!60739 m!266111))

(declare-fun m!266113 () Bool)

(assert (=> d!60739 m!266113))

(declare-fun m!266115 () Bool)

(assert (=> d!60739 m!266115))

(declare-fun m!266117 () Bool)

(assert (=> d!60739 m!266117))

(declare-fun m!266119 () Bool)

(assert (=> b!249479 m!266119))

(declare-fun m!266121 () Bool)

(assert (=> b!249480 m!266121))

(assert (=> bm!23404 d!60739))

(declare-fun d!60741 () Bool)

(assert (=> d!60741 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249277 d!60741))

(declare-fun d!60743 () Bool)

(declare-fun res!122227 () Bool)

(declare-fun e!161806 () Bool)

(assert (=> d!60743 (=> res!122227 e!161806)))

(assert (=> d!60743 (= res!122227 (bvsge #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> d!60743 (= (arrayNoDuplicates!0 (_keys!6733 thiss!1504) #b00000000000000000000000000000000 Nil!3630) e!161806)))

(declare-fun b!249481 () Bool)

(declare-fun e!161808 () Bool)

(assert (=> b!249481 (= e!161808 (contains!1786 Nil!3630 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249482 () Bool)

(declare-fun e!161807 () Bool)

(assert (=> b!249482 (= e!161806 e!161807)))

(declare-fun res!122228 () Bool)

(assert (=> b!249482 (=> (not res!122228) (not e!161807))))

(assert (=> b!249482 (= res!122228 (not e!161808))))

(declare-fun res!122229 () Bool)

(assert (=> b!249482 (=> (not res!122229) (not e!161808))))

(assert (=> b!249482 (= res!122229 (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249483 () Bool)

(declare-fun e!161805 () Bool)

(assert (=> b!249483 (= e!161807 e!161805)))

(declare-fun c!41854 () Bool)

(assert (=> b!249483 (= c!41854 (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249484 () Bool)

(declare-fun call!23419 () Bool)

(assert (=> b!249484 (= e!161805 call!23419)))

(declare-fun bm!23416 () Bool)

(assert (=> bm!23416 (= call!23419 (arrayNoDuplicates!0 (_keys!6733 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41854 (Cons!3629 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000) Nil!3630) Nil!3630)))))

(declare-fun b!249485 () Bool)

(assert (=> b!249485 (= e!161805 call!23419)))

(assert (= (and d!60743 (not res!122227)) b!249482))

(assert (= (and b!249482 res!122229) b!249481))

(assert (= (and b!249482 res!122228) b!249483))

(assert (= (and b!249483 c!41854) b!249484))

(assert (= (and b!249483 (not c!41854)) b!249485))

(assert (= (or b!249484 b!249485) bm!23416))

(assert (=> b!249481 m!265941))

(assert (=> b!249481 m!265941))

(declare-fun m!266123 () Bool)

(assert (=> b!249481 m!266123))

(assert (=> b!249482 m!265941))

(assert (=> b!249482 m!265941))

(assert (=> b!249482 m!265943))

(assert (=> b!249483 m!265941))

(assert (=> b!249483 m!265941))

(assert (=> b!249483 m!265943))

(assert (=> bm!23416 m!265941))

(declare-fun m!266125 () Bool)

(assert (=> bm!23416 m!266125))

(assert (=> b!249309 d!60743))

(declare-fun d!60745 () Bool)

(assert (=> d!60745 (= (inRange!0 (index!6495 lt!124893) (mask!10766 thiss!1504)) (and (bvsge (index!6495 lt!124893) #b00000000000000000000000000000000) (bvslt (index!6495 lt!124893) (bvadd (mask!10766 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249332 d!60745))

(assert (=> b!249307 d!60687))

(declare-fun d!60747 () Bool)

(declare-fun lt!124997 () (_ BitVec 32))

(assert (=> d!60747 (and (bvsge lt!124997 #b00000000000000000000000000000000) (bvsle lt!124997 (bvsub (size!6159 (_keys!6733 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!161809 () (_ BitVec 32))

(assert (=> d!60747 (= lt!124997 e!161809)))

(declare-fun c!41856 () Bool)

(assert (=> d!60747 (= c!41856 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> d!60747 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6159 (_keys!6733 thiss!1504)) (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> d!60747 (= (arrayCountValidKeys!0 (_keys!6733 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))) lt!124997)))

(declare-fun bm!23417 () Bool)

(declare-fun call!23420 () (_ BitVec 32))

(assert (=> bm!23417 (= call!23420 (arrayCountValidKeys!0 (_keys!6733 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249486 () Bool)

(declare-fun e!161810 () (_ BitVec 32))

(assert (=> b!249486 (= e!161810 call!23420)))

(declare-fun b!249487 () Bool)

(assert (=> b!249487 (= e!161810 (bvadd #b00000000000000000000000000000001 call!23420))))

(declare-fun b!249488 () Bool)

(assert (=> b!249488 (= e!161809 e!161810)))

(declare-fun c!41855 () Bool)

(assert (=> b!249488 (= c!41855 (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249489 () Bool)

(assert (=> b!249489 (= e!161809 #b00000000000000000000000000000000)))

(assert (= (and d!60747 c!41856) b!249489))

(assert (= (and d!60747 (not c!41856)) b!249488))

(assert (= (and b!249488 c!41855) b!249487))

(assert (= (and b!249488 (not c!41855)) b!249486))

(assert (= (or b!249487 b!249486) bm!23417))

(declare-fun m!266127 () Bool)

(assert (=> bm!23417 m!266127))

(assert (=> b!249488 m!266091))

(assert (=> b!249488 m!266091))

(declare-fun m!266129 () Bool)

(assert (=> b!249488 m!266129))

(assert (=> bm!23373 d!60747))

(declare-fun d!60749 () Bool)

(assert (=> d!60749 (= (validKeyInArray!0 (select (arr!5816 lt!124787) #b00000000000000000000000000000000)) (and (not (= (select (arr!5816 lt!124787) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5816 lt!124787) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249289 d!60749))

(assert (=> b!249257 d!60749))

(declare-fun d!60751 () Bool)

(declare-fun e!161811 () Bool)

(assert (=> d!60751 e!161811))

(declare-fun res!122230 () Bool)

(assert (=> d!60751 (=> res!122230 e!161811)))

(declare-fun lt!125001 () Bool)

(assert (=> d!60751 (= res!122230 (not lt!125001))))

(declare-fun lt!124999 () Bool)

(assert (=> d!60751 (= lt!125001 lt!124999)))

(declare-fun lt!125000 () Unit!7683)

(declare-fun e!161812 () Unit!7683)

(assert (=> d!60751 (= lt!125000 e!161812)))

(declare-fun c!41857 () Bool)

(assert (=> d!60751 (= c!41857 lt!124999)))

(assert (=> d!60751 (= lt!124999 (containsKey!288 (toList!1851 lt!124978) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60751 (= (contains!1784 lt!124978 #b0000000000000000000000000000000000000000000000000000000000000000) lt!125001)))

(declare-fun b!249490 () Bool)

(declare-fun lt!124998 () Unit!7683)

(assert (=> b!249490 (= e!161812 lt!124998)))

(assert (=> b!249490 (= lt!124998 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1851 lt!124978) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249490 (isDefined!237 (getValueByKey!297 (toList!1851 lt!124978) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249491 () Bool)

(declare-fun Unit!7697 () Unit!7683)

(assert (=> b!249491 (= e!161812 Unit!7697)))

(declare-fun b!249492 () Bool)

(assert (=> b!249492 (= e!161811 (isDefined!237 (getValueByKey!297 (toList!1851 lt!124978) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60751 c!41857) b!249490))

(assert (= (and d!60751 (not c!41857)) b!249491))

(assert (= (and d!60751 (not res!122230)) b!249492))

(declare-fun m!266131 () Bool)

(assert (=> d!60751 m!266131))

(declare-fun m!266133 () Bool)

(assert (=> b!249490 m!266133))

(assert (=> b!249490 m!266087))

(assert (=> b!249490 m!266087))

(declare-fun m!266135 () Bool)

(assert (=> b!249490 m!266135))

(assert (=> b!249492 m!266087))

(assert (=> b!249492 m!266087))

(assert (=> b!249492 m!266135))

(assert (=> bm!23406 d!60751))

(declare-fun d!60753 () Bool)

(declare-fun lt!125002 () (_ BitVec 32))

(assert (=> d!60753 (and (bvsge lt!125002 #b00000000000000000000000000000000) (bvsle lt!125002 (bvsub (size!6159 lt!124787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!161813 () (_ BitVec 32))

(assert (=> d!60753 (= lt!125002 e!161813)))

(declare-fun c!41859 () Bool)

(assert (=> d!60753 (= c!41859 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> d!60753 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6159 (_keys!6733 thiss!1504)) (size!6159 lt!124787)))))

(assert (=> d!60753 (= (arrayCountValidKeys!0 lt!124787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))) lt!125002)))

(declare-fun bm!23418 () Bool)

(declare-fun call!23421 () (_ BitVec 32))

(assert (=> bm!23418 (= call!23421 (arrayCountValidKeys!0 lt!124787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249493 () Bool)

(declare-fun e!161814 () (_ BitVec 32))

(assert (=> b!249493 (= e!161814 call!23421)))

(declare-fun b!249494 () Bool)

(assert (=> b!249494 (= e!161814 (bvadd #b00000000000000000000000000000001 call!23421))))

(declare-fun b!249495 () Bool)

(assert (=> b!249495 (= e!161813 e!161814)))

(declare-fun c!41858 () Bool)

(assert (=> b!249495 (= c!41858 (validKeyInArray!0 (select (arr!5816 lt!124787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249496 () Bool)

(assert (=> b!249496 (= e!161813 #b00000000000000000000000000000000)))

(assert (= (and d!60753 c!41859) b!249496))

(assert (= (and d!60753 (not c!41859)) b!249495))

(assert (= (and b!249495 c!41858) b!249494))

(assert (= (and b!249495 (not c!41858)) b!249493))

(assert (= (or b!249494 b!249493) bm!23418))

(declare-fun m!266137 () Bool)

(assert (=> bm!23418 m!266137))

(declare-fun m!266139 () Bool)

(assert (=> b!249495 m!266139))

(assert (=> b!249495 m!266139))

(declare-fun m!266141 () Bool)

(assert (=> b!249495 m!266141))

(assert (=> bm!23377 d!60753))

(declare-fun d!60755 () Bool)

(assert (=> d!60755 (= (apply!238 (+!665 lt!124960 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504))) lt!124961) (get!2992 (getValueByKey!297 (toList!1851 (+!665 lt!124960 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504)))) lt!124961)))))

(declare-fun bs!8965 () Bool)

(assert (= bs!8965 d!60755))

(declare-fun m!266143 () Bool)

(assert (=> bs!8965 m!266143))

(assert (=> bs!8965 m!266143))

(declare-fun m!266145 () Bool)

(assert (=> bs!8965 m!266145))

(assert (=> b!249412 d!60755))

(declare-fun d!60757 () Bool)

(declare-fun e!161815 () Bool)

(assert (=> d!60757 e!161815))

(declare-fun res!122232 () Bool)

(assert (=> d!60757 (=> (not res!122232) (not e!161815))))

(declare-fun lt!125004 () ListLongMap!3671)

(assert (=> d!60757 (= res!122232 (contains!1784 lt!125004 (_1!2389 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504)))))))

(declare-fun lt!125003 () List!3634)

(assert (=> d!60757 (= lt!125004 (ListLongMap!3672 lt!125003))))

(declare-fun lt!125006 () Unit!7683)

(declare-fun lt!125005 () Unit!7683)

(assert (=> d!60757 (= lt!125006 lt!125005)))

(assert (=> d!60757 (= (getValueByKey!297 lt!125003 (_1!2389 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504)))) (Some!302 (_2!2389 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504)))))))

(assert (=> d!60757 (= lt!125005 (lemmaContainsTupThenGetReturnValue!158 lt!125003 (_1!2389 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504))) (_2!2389 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504)))))))

(assert (=> d!60757 (= lt!125003 (insertStrictlySorted!161 (toList!1851 lt!124980) (_1!2389 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504))) (_2!2389 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504)))))))

(assert (=> d!60757 (= (+!665 lt!124980 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504))) lt!125004)))

(declare-fun b!249497 () Bool)

(declare-fun res!122231 () Bool)

(assert (=> b!249497 (=> (not res!122231) (not e!161815))))

(assert (=> b!249497 (= res!122231 (= (getValueByKey!297 (toList!1851 lt!125004) (_1!2389 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504)))) (Some!302 (_2!2389 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504))))))))

(declare-fun b!249498 () Bool)

(assert (=> b!249498 (= e!161815 (contains!1787 (toList!1851 lt!125004) (tuple2!4757 lt!124965 (minValue!4446 thiss!1504))))))

(assert (= (and d!60757 res!122232) b!249497))

(assert (= (and b!249497 res!122231) b!249498))

(declare-fun m!266147 () Bool)

(assert (=> d!60757 m!266147))

(declare-fun m!266149 () Bool)

(assert (=> d!60757 m!266149))

(declare-fun m!266151 () Bool)

(assert (=> d!60757 m!266151))

(declare-fun m!266153 () Bool)

(assert (=> d!60757 m!266153))

(declare-fun m!266155 () Bool)

(assert (=> b!249497 m!266155))

(declare-fun m!266157 () Bool)

(assert (=> b!249498 m!266157))

(assert (=> b!249412 d!60757))

(declare-fun d!60759 () Bool)

(declare-fun e!161816 () Bool)

(assert (=> d!60759 e!161816))

(declare-fun res!122234 () Bool)

(assert (=> d!60759 (=> (not res!122234) (not e!161816))))

(declare-fun lt!125008 () ListLongMap!3671)

(assert (=> d!60759 (= res!122234 (contains!1784 lt!125008 (_1!2389 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504)))))))

(declare-fun lt!125007 () List!3634)

(assert (=> d!60759 (= lt!125008 (ListLongMap!3672 lt!125007))))

(declare-fun lt!125010 () Unit!7683)

(declare-fun lt!125009 () Unit!7683)

(assert (=> d!60759 (= lt!125010 lt!125009)))

(assert (=> d!60759 (= (getValueByKey!297 lt!125007 (_1!2389 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504)))) (Some!302 (_2!2389 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504)))))))

(assert (=> d!60759 (= lt!125009 (lemmaContainsTupThenGetReturnValue!158 lt!125007 (_1!2389 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504))) (_2!2389 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504)))))))

(assert (=> d!60759 (= lt!125007 (insertStrictlySorted!161 (toList!1851 lt!124964) (_1!2389 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504))) (_2!2389 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504)))))))

(assert (=> d!60759 (= (+!665 lt!124964 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504))) lt!125008)))

(declare-fun b!249499 () Bool)

(declare-fun res!122233 () Bool)

(assert (=> b!249499 (=> (not res!122233) (not e!161816))))

(assert (=> b!249499 (= res!122233 (= (getValueByKey!297 (toList!1851 lt!125008) (_1!2389 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504)))) (Some!302 (_2!2389 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504))))))))

(declare-fun b!249500 () Bool)

(assert (=> b!249500 (= e!161816 (contains!1787 (toList!1851 lt!125008) (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504))))))

(assert (= (and d!60759 res!122234) b!249499))

(assert (= (and b!249499 res!122233) b!249500))

(declare-fun m!266159 () Bool)

(assert (=> d!60759 m!266159))

(declare-fun m!266161 () Bool)

(assert (=> d!60759 m!266161))

(declare-fun m!266163 () Bool)

(assert (=> d!60759 m!266163))

(declare-fun m!266165 () Bool)

(assert (=> d!60759 m!266165))

(declare-fun m!266167 () Bool)

(assert (=> b!249499 m!266167))

(declare-fun m!266169 () Bool)

(assert (=> b!249500 m!266169))

(assert (=> b!249412 d!60759))

(declare-fun d!60761 () Bool)

(assert (=> d!60761 (= (apply!238 lt!124962 lt!124969) (get!2992 (getValueByKey!297 (toList!1851 lt!124962) lt!124969)))))

(declare-fun bs!8966 () Bool)

(assert (= bs!8966 d!60761))

(declare-fun m!266171 () Bool)

(assert (=> bs!8966 m!266171))

(assert (=> bs!8966 m!266171))

(declare-fun m!266173 () Bool)

(assert (=> bs!8966 m!266173))

(assert (=> b!249412 d!60761))

(declare-fun d!60763 () Bool)

(declare-fun e!161817 () Bool)

(assert (=> d!60763 e!161817))

(declare-fun res!122235 () Bool)

(assert (=> d!60763 (=> res!122235 e!161817)))

(declare-fun lt!125014 () Bool)

(assert (=> d!60763 (= res!122235 (not lt!125014))))

(declare-fun lt!125012 () Bool)

(assert (=> d!60763 (= lt!125014 lt!125012)))

(declare-fun lt!125013 () Unit!7683)

(declare-fun e!161818 () Unit!7683)

(assert (=> d!60763 (= lt!125013 e!161818)))

(declare-fun c!41860 () Bool)

(assert (=> d!60763 (= c!41860 lt!125012)))

(assert (=> d!60763 (= lt!125012 (containsKey!288 (toList!1851 (+!665 lt!124964 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504)))) lt!124975))))

(assert (=> d!60763 (= (contains!1784 (+!665 lt!124964 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504))) lt!124975) lt!125014)))

(declare-fun b!249501 () Bool)

(declare-fun lt!125011 () Unit!7683)

(assert (=> b!249501 (= e!161818 lt!125011)))

(assert (=> b!249501 (= lt!125011 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1851 (+!665 lt!124964 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504)))) lt!124975))))

(assert (=> b!249501 (isDefined!237 (getValueByKey!297 (toList!1851 (+!665 lt!124964 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504)))) lt!124975))))

(declare-fun b!249502 () Bool)

(declare-fun Unit!7698 () Unit!7683)

(assert (=> b!249502 (= e!161818 Unit!7698)))

(declare-fun b!249503 () Bool)

(assert (=> b!249503 (= e!161817 (isDefined!237 (getValueByKey!297 (toList!1851 (+!665 lt!124964 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504)))) lt!124975)))))

(assert (= (and d!60763 c!41860) b!249501))

(assert (= (and d!60763 (not c!41860)) b!249502))

(assert (= (and d!60763 (not res!122235)) b!249503))

(declare-fun m!266175 () Bool)

(assert (=> d!60763 m!266175))

(declare-fun m!266177 () Bool)

(assert (=> b!249501 m!266177))

(declare-fun m!266179 () Bool)

(assert (=> b!249501 m!266179))

(assert (=> b!249501 m!266179))

(declare-fun m!266181 () Bool)

(assert (=> b!249501 m!266181))

(assert (=> b!249503 m!266179))

(assert (=> b!249503 m!266179))

(assert (=> b!249503 m!266181))

(assert (=> b!249412 d!60763))

(declare-fun d!60765 () Bool)

(assert (=> d!60765 (= (apply!238 lt!124960 lt!124961) (get!2992 (getValueByKey!297 (toList!1851 lt!124960) lt!124961)))))

(declare-fun bs!8967 () Bool)

(assert (= bs!8967 d!60765))

(declare-fun m!266183 () Bool)

(assert (=> bs!8967 m!266183))

(assert (=> bs!8967 m!266183))

(declare-fun m!266185 () Bool)

(assert (=> bs!8967 m!266185))

(assert (=> b!249412 d!60765))

(declare-fun b!249528 () Bool)

(declare-fun e!161836 () Bool)

(assert (=> b!249528 (= e!161836 (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249528 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!249529 () Bool)

(declare-fun lt!125032 () Unit!7683)

(declare-fun lt!125029 () Unit!7683)

(assert (=> b!249529 (= lt!125032 lt!125029)))

(declare-fun lt!125030 () ListLongMap!3671)

(declare-fun lt!125034 () (_ BitVec 64))

(declare-fun lt!125035 () V!8281)

(declare-fun lt!125033 () (_ BitVec 64))

(assert (=> b!249529 (not (contains!1784 (+!665 lt!125030 (tuple2!4757 lt!125034 lt!125035)) lt!125033))))

(declare-fun addStillNotContains!123 (ListLongMap!3671 (_ BitVec 64) V!8281 (_ BitVec 64)) Unit!7683)

(assert (=> b!249529 (= lt!125029 (addStillNotContains!123 lt!125030 lt!125034 lt!125035 lt!125033))))

(assert (=> b!249529 (= lt!125033 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!249529 (= lt!125035 (get!2991 (select (arr!5815 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!249529 (= lt!125034 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!23424 () ListLongMap!3671)

(assert (=> b!249529 (= lt!125030 call!23424)))

(declare-fun e!161834 () ListLongMap!3671)

(assert (=> b!249529 (= e!161834 (+!665 call!23424 (tuple2!4757 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000) (get!2991 (select (arr!5815 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!249531 () Bool)

(assert (=> b!249531 (= e!161834 call!23424)))

(declare-fun bm!23421 () Bool)

(assert (=> bm!23421 (= call!23424 (getCurrentListMapNoExtraKeys!554 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4605 thiss!1504)))))

(declare-fun b!249532 () Bool)

(assert (=> b!249532 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> b!249532 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6158 (_values!4588 thiss!1504))))))

(declare-fun e!161833 () Bool)

(declare-fun lt!125031 () ListLongMap!3671)

(assert (=> b!249532 (= e!161833 (= (apply!238 lt!125031 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)) (get!2991 (select (arr!5815 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!249533 () Bool)

(declare-fun e!161839 () Bool)

(assert (=> b!249533 (= e!161839 (= lt!125031 (getCurrentListMapNoExtraKeys!554 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4605 thiss!1504))))))

(declare-fun b!249534 () Bool)

(declare-fun e!161835 () ListLongMap!3671)

(assert (=> b!249534 (= e!161835 e!161834)))

(declare-fun c!41872 () Bool)

(assert (=> b!249534 (= c!41872 (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249535 () Bool)

(declare-fun e!161838 () Bool)

(assert (=> b!249535 (= e!161838 e!161833)))

(assert (=> b!249535 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun res!122244 () Bool)

(assert (=> b!249535 (= res!122244 (contains!1784 lt!125031 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249535 (=> (not res!122244) (not e!161833))))

(declare-fun b!249530 () Bool)

(assert (=> b!249530 (= e!161838 e!161839)))

(declare-fun c!41870 () Bool)

(assert (=> b!249530 (= c!41870 (bvslt #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun d!60767 () Bool)

(declare-fun e!161837 () Bool)

(assert (=> d!60767 e!161837))

(declare-fun res!122246 () Bool)

(assert (=> d!60767 (=> (not res!122246) (not e!161837))))

(assert (=> d!60767 (= res!122246 (not (contains!1784 lt!125031 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60767 (= lt!125031 e!161835)))

(declare-fun c!41871 () Bool)

(assert (=> d!60767 (= c!41871 (bvsge #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> d!60767 (validMask!0 (mask!10766 thiss!1504))))

(assert (=> d!60767 (= (getCurrentListMapNoExtraKeys!554 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) lt!125031)))

(declare-fun b!249536 () Bool)

(declare-fun res!122247 () Bool)

(assert (=> b!249536 (=> (not res!122247) (not e!161837))))

(assert (=> b!249536 (= res!122247 (not (contains!1784 lt!125031 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249537 () Bool)

(assert (=> b!249537 (= e!161835 (ListLongMap!3672 Nil!3631))))

(declare-fun b!249538 () Bool)

(assert (=> b!249538 (= e!161837 e!161838)))

(declare-fun c!41869 () Bool)

(assert (=> b!249538 (= c!41869 e!161836)))

(declare-fun res!122245 () Bool)

(assert (=> b!249538 (=> (not res!122245) (not e!161836))))

(assert (=> b!249538 (= res!122245 (bvslt #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun b!249539 () Bool)

(declare-fun isEmpty!530 (ListLongMap!3671) Bool)

(assert (=> b!249539 (= e!161839 (isEmpty!530 lt!125031))))

(assert (= (and d!60767 c!41871) b!249537))

(assert (= (and d!60767 (not c!41871)) b!249534))

(assert (= (and b!249534 c!41872) b!249529))

(assert (= (and b!249534 (not c!41872)) b!249531))

(assert (= (or b!249529 b!249531) bm!23421))

(assert (= (and d!60767 res!122246) b!249536))

(assert (= (and b!249536 res!122247) b!249538))

(assert (= (and b!249538 res!122245) b!249528))

(assert (= (and b!249538 c!41869) b!249535))

(assert (= (and b!249538 (not c!41869)) b!249530))

(assert (= (and b!249535 res!122244) b!249532))

(assert (= (and b!249530 c!41870) b!249533))

(assert (= (and b!249530 (not c!41870)) b!249539))

(declare-fun b_lambda!8089 () Bool)

(assert (=> (not b_lambda!8089) (not b!249529)))

(assert (=> b!249529 t!8659))

(declare-fun b_and!13643 () Bool)

(assert (= b_and!13641 (and (=> t!8659 result!5281) b_and!13643)))

(declare-fun b_lambda!8091 () Bool)

(assert (=> (not b_lambda!8091) (not b!249532)))

(assert (=> b!249532 t!8659))

(declare-fun b_and!13645 () Bool)

(assert (= b_and!13643 (and (=> t!8659 result!5281) b_and!13645)))

(declare-fun m!266187 () Bool)

(assert (=> b!249533 m!266187))

(declare-fun m!266189 () Bool)

(assert (=> b!249539 m!266189))

(assert (=> b!249528 m!265941))

(assert (=> b!249528 m!265941))

(assert (=> b!249528 m!265943))

(declare-fun m!266191 () Bool)

(assert (=> b!249529 m!266191))

(assert (=> b!249529 m!265941))

(declare-fun m!266193 () Bool)

(assert (=> b!249529 m!266193))

(assert (=> b!249529 m!266065))

(declare-fun m!266195 () Bool)

(assert (=> b!249529 m!266195))

(declare-fun m!266197 () Bool)

(assert (=> b!249529 m!266197))

(assert (=> b!249529 m!266063))

(assert (=> b!249529 m!266195))

(assert (=> b!249529 m!266063))

(assert (=> b!249529 m!266065))

(assert (=> b!249529 m!266067))

(assert (=> b!249534 m!265941))

(assert (=> b!249534 m!265941))

(assert (=> b!249534 m!265943))

(assert (=> b!249532 m!265941))

(assert (=> b!249532 m!265941))

(declare-fun m!266199 () Bool)

(assert (=> b!249532 m!266199))

(assert (=> b!249532 m!266065))

(assert (=> b!249532 m!266063))

(assert (=> b!249532 m!266065))

(assert (=> b!249532 m!266067))

(assert (=> b!249532 m!266063))

(declare-fun m!266201 () Bool)

(assert (=> d!60767 m!266201))

(assert (=> d!60767 m!265795))

(assert (=> bm!23421 m!266187))

(assert (=> b!249535 m!265941))

(assert (=> b!249535 m!265941))

(declare-fun m!266203 () Bool)

(assert (=> b!249535 m!266203))

(declare-fun m!266205 () Bool)

(assert (=> b!249536 m!266205))

(assert (=> b!249412 d!60767))

(declare-fun d!60769 () Bool)

(assert (=> d!60769 (= (apply!238 (+!665 lt!124980 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504))) lt!124977) (apply!238 lt!124980 lt!124977))))

(declare-fun lt!125038 () Unit!7683)

(declare-fun choose!1183 (ListLongMap!3671 (_ BitVec 64) V!8281 (_ BitVec 64)) Unit!7683)

(assert (=> d!60769 (= lt!125038 (choose!1183 lt!124980 lt!124965 (minValue!4446 thiss!1504) lt!124977))))

(declare-fun e!161842 () Bool)

(assert (=> d!60769 e!161842))

(declare-fun res!122250 () Bool)

(assert (=> d!60769 (=> (not res!122250) (not e!161842))))

(assert (=> d!60769 (= res!122250 (contains!1784 lt!124980 lt!124977))))

(assert (=> d!60769 (= (addApplyDifferent!214 lt!124980 lt!124965 (minValue!4446 thiss!1504) lt!124977) lt!125038)))

(declare-fun b!249543 () Bool)

(assert (=> b!249543 (= e!161842 (not (= lt!124977 lt!124965)))))

(assert (= (and d!60769 res!122250) b!249543))

(declare-fun m!266207 () Bool)

(assert (=> d!60769 m!266207))

(assert (=> d!60769 m!266037))

(assert (=> d!60769 m!266039))

(declare-fun m!266209 () Bool)

(assert (=> d!60769 m!266209))

(assert (=> d!60769 m!266029))

(assert (=> d!60769 m!266037))

(assert (=> b!249412 d!60769))

(declare-fun d!60771 () Bool)

(assert (=> d!60771 (= (apply!238 (+!665 lt!124962 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504))) lt!124969) (get!2992 (getValueByKey!297 (toList!1851 (+!665 lt!124962 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504)))) lt!124969)))))

(declare-fun bs!8968 () Bool)

(assert (= bs!8968 d!60771))

(declare-fun m!266211 () Bool)

(assert (=> bs!8968 m!266211))

(assert (=> bs!8968 m!266211))

(declare-fun m!266213 () Bool)

(assert (=> bs!8968 m!266213))

(assert (=> b!249412 d!60771))

(declare-fun d!60773 () Bool)

(assert (=> d!60773 (= (apply!238 (+!665 lt!124980 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504))) lt!124977) (get!2992 (getValueByKey!297 (toList!1851 (+!665 lt!124980 (tuple2!4757 lt!124965 (minValue!4446 thiss!1504)))) lt!124977)))))

(declare-fun bs!8969 () Bool)

(assert (= bs!8969 d!60773))

(declare-fun m!266215 () Bool)

(assert (=> bs!8969 m!266215))

(assert (=> bs!8969 m!266215))

(declare-fun m!266217 () Bool)

(assert (=> bs!8969 m!266217))

(assert (=> b!249412 d!60773))

(declare-fun d!60775 () Bool)

(assert (=> d!60775 (= (apply!238 (+!665 lt!124962 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504))) lt!124969) (apply!238 lt!124962 lt!124969))))

(declare-fun lt!125039 () Unit!7683)

(assert (=> d!60775 (= lt!125039 (choose!1183 lt!124962 lt!124963 (minValue!4446 thiss!1504) lt!124969))))

(declare-fun e!161843 () Bool)

(assert (=> d!60775 e!161843))

(declare-fun res!122251 () Bool)

(assert (=> d!60775 (=> (not res!122251) (not e!161843))))

(assert (=> d!60775 (= res!122251 (contains!1784 lt!124962 lt!124969))))

(assert (=> d!60775 (= (addApplyDifferent!214 lt!124962 lt!124963 (minValue!4446 thiss!1504) lt!124969) lt!125039)))

(declare-fun b!249544 () Bool)

(assert (=> b!249544 (= e!161843 (not (= lt!124969 lt!124963)))))

(assert (= (and d!60775 res!122251) b!249544))

(declare-fun m!266219 () Bool)

(assert (=> d!60775 m!266219))

(assert (=> d!60775 m!266041))

(assert (=> d!60775 m!266051))

(declare-fun m!266221 () Bool)

(assert (=> d!60775 m!266221))

(assert (=> d!60775 m!266047))

(assert (=> d!60775 m!266041))

(assert (=> b!249412 d!60775))

(declare-fun d!60777 () Bool)

(assert (=> d!60777 (contains!1784 (+!665 lt!124964 (tuple2!4757 lt!124968 (zeroValue!4446 thiss!1504))) lt!124975)))

(declare-fun lt!125042 () Unit!7683)

(declare-fun choose!1184 (ListLongMap!3671 (_ BitVec 64) V!8281 (_ BitVec 64)) Unit!7683)

(assert (=> d!60777 (= lt!125042 (choose!1184 lt!124964 lt!124968 (zeroValue!4446 thiss!1504) lt!124975))))

(assert (=> d!60777 (contains!1784 lt!124964 lt!124975)))

(assert (=> d!60777 (= (addStillContains!214 lt!124964 lt!124968 (zeroValue!4446 thiss!1504) lt!124975) lt!125042)))

(declare-fun bs!8970 () Bool)

(assert (= bs!8970 d!60777))

(assert (=> bs!8970 m!266043))

(assert (=> bs!8970 m!266043))

(assert (=> bs!8970 m!266049))

(declare-fun m!266223 () Bool)

(assert (=> bs!8970 m!266223))

(declare-fun m!266225 () Bool)

(assert (=> bs!8970 m!266225))

(assert (=> b!249412 d!60777))

(declare-fun d!60779 () Bool)

(declare-fun e!161844 () Bool)

(assert (=> d!60779 e!161844))

(declare-fun res!122253 () Bool)

(assert (=> d!60779 (=> (not res!122253) (not e!161844))))

(declare-fun lt!125044 () ListLongMap!3671)

(assert (=> d!60779 (= res!122253 (contains!1784 lt!125044 (_1!2389 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504)))))))

(declare-fun lt!125043 () List!3634)

(assert (=> d!60779 (= lt!125044 (ListLongMap!3672 lt!125043))))

(declare-fun lt!125046 () Unit!7683)

(declare-fun lt!125045 () Unit!7683)

(assert (=> d!60779 (= lt!125046 lt!125045)))

(assert (=> d!60779 (= (getValueByKey!297 lt!125043 (_1!2389 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504)))) (Some!302 (_2!2389 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504)))))))

(assert (=> d!60779 (= lt!125045 (lemmaContainsTupThenGetReturnValue!158 lt!125043 (_1!2389 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504))) (_2!2389 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504)))))))

(assert (=> d!60779 (= lt!125043 (insertStrictlySorted!161 (toList!1851 lt!124962) (_1!2389 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504))) (_2!2389 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504)))))))

(assert (=> d!60779 (= (+!665 lt!124962 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504))) lt!125044)))

(declare-fun b!249546 () Bool)

(declare-fun res!122252 () Bool)

(assert (=> b!249546 (=> (not res!122252) (not e!161844))))

(assert (=> b!249546 (= res!122252 (= (getValueByKey!297 (toList!1851 lt!125044) (_1!2389 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504)))) (Some!302 (_2!2389 (tuple2!4757 lt!124963 (minValue!4446 thiss!1504))))))))

(declare-fun b!249547 () Bool)

(assert (=> b!249547 (= e!161844 (contains!1787 (toList!1851 lt!125044) (tuple2!4757 lt!124963 (minValue!4446 thiss!1504))))))

(assert (= (and d!60779 res!122253) b!249546))

(assert (= (and b!249546 res!122252) b!249547))

(declare-fun m!266227 () Bool)

(assert (=> d!60779 m!266227))

(declare-fun m!266229 () Bool)

(assert (=> d!60779 m!266229))

(declare-fun m!266231 () Bool)

(assert (=> d!60779 m!266231))

(declare-fun m!266233 () Bool)

(assert (=> d!60779 m!266233))

(declare-fun m!266235 () Bool)

(assert (=> b!249546 m!266235))

(declare-fun m!266237 () Bool)

(assert (=> b!249547 m!266237))

(assert (=> b!249412 d!60779))

(declare-fun d!60781 () Bool)

(declare-fun e!161845 () Bool)

(assert (=> d!60781 e!161845))

(declare-fun res!122255 () Bool)

(assert (=> d!60781 (=> (not res!122255) (not e!161845))))

(declare-fun lt!125048 () ListLongMap!3671)

(assert (=> d!60781 (= res!122255 (contains!1784 lt!125048 (_1!2389 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504)))))))

(declare-fun lt!125047 () List!3634)

(assert (=> d!60781 (= lt!125048 (ListLongMap!3672 lt!125047))))

(declare-fun lt!125050 () Unit!7683)

(declare-fun lt!125049 () Unit!7683)

(assert (=> d!60781 (= lt!125050 lt!125049)))

(assert (=> d!60781 (= (getValueByKey!297 lt!125047 (_1!2389 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504)))) (Some!302 (_2!2389 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504)))))))

(assert (=> d!60781 (= lt!125049 (lemmaContainsTupThenGetReturnValue!158 lt!125047 (_1!2389 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504))) (_2!2389 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504)))))))

(assert (=> d!60781 (= lt!125047 (insertStrictlySorted!161 (toList!1851 lt!124960) (_1!2389 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504))) (_2!2389 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504)))))))

(assert (=> d!60781 (= (+!665 lt!124960 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504))) lt!125048)))

(declare-fun b!249548 () Bool)

(declare-fun res!122254 () Bool)

(assert (=> b!249548 (=> (not res!122254) (not e!161845))))

(assert (=> b!249548 (= res!122254 (= (getValueByKey!297 (toList!1851 lt!125048) (_1!2389 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504)))) (Some!302 (_2!2389 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504))))))))

(declare-fun b!249549 () Bool)

(assert (=> b!249549 (= e!161845 (contains!1787 (toList!1851 lt!125048) (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504))))))

(assert (= (and d!60781 res!122255) b!249548))

(assert (= (and b!249548 res!122254) b!249549))

(declare-fun m!266239 () Bool)

(assert (=> d!60781 m!266239))

(declare-fun m!266241 () Bool)

(assert (=> d!60781 m!266241))

(declare-fun m!266243 () Bool)

(assert (=> d!60781 m!266243))

(declare-fun m!266245 () Bool)

(assert (=> d!60781 m!266245))

(declare-fun m!266247 () Bool)

(assert (=> b!249548 m!266247))

(declare-fun m!266249 () Bool)

(assert (=> b!249549 m!266249))

(assert (=> b!249412 d!60781))

(declare-fun d!60783 () Bool)

(assert (=> d!60783 (= (apply!238 lt!124980 lt!124977) (get!2992 (getValueByKey!297 (toList!1851 lt!124980) lt!124977)))))

(declare-fun bs!8971 () Bool)

(assert (= bs!8971 d!60783))

(declare-fun m!266251 () Bool)

(assert (=> bs!8971 m!266251))

(assert (=> bs!8971 m!266251))

(declare-fun m!266253 () Bool)

(assert (=> bs!8971 m!266253))

(assert (=> b!249412 d!60783))

(declare-fun d!60785 () Bool)

(assert (=> d!60785 (= (apply!238 (+!665 lt!124960 (tuple2!4757 lt!124976 (zeroValue!4446 thiss!1504))) lt!124961) (apply!238 lt!124960 lt!124961))))

(declare-fun lt!125051 () Unit!7683)

(assert (=> d!60785 (= lt!125051 (choose!1183 lt!124960 lt!124976 (zeroValue!4446 thiss!1504) lt!124961))))

(declare-fun e!161846 () Bool)

(assert (=> d!60785 e!161846))

(declare-fun res!122256 () Bool)

(assert (=> d!60785 (=> (not res!122256) (not e!161846))))

(assert (=> d!60785 (= res!122256 (contains!1784 lt!124960 lt!124961))))

(assert (=> d!60785 (= (addApplyDifferent!214 lt!124960 lt!124976 (zeroValue!4446 thiss!1504) lt!124961) lt!125051)))

(declare-fun b!249550 () Bool)

(assert (=> b!249550 (= e!161846 (not (= lt!124961 lt!124976)))))

(assert (= (and d!60785 res!122256) b!249550))

(declare-fun m!266255 () Bool)

(assert (=> d!60785 m!266255))

(assert (=> d!60785 m!266031))

(assert (=> d!60785 m!266033))

(declare-fun m!266257 () Bool)

(assert (=> d!60785 m!266257))

(assert (=> d!60785 m!266057))

(assert (=> d!60785 m!266031))

(assert (=> b!249412 d!60785))

(declare-fun d!60787 () Bool)

(assert (=> d!60787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) (mask!10766 thiss!1504))))

(assert (=> d!60787 true))

(declare-fun _$56!21 () Unit!7683)

(assert (=> d!60787 (= (choose!102 key!932 (_keys!6733 thiss!1504) index!297 (mask!10766 thiss!1504)) _$56!21)))

(declare-fun bs!8972 () Bool)

(assert (= bs!8972 d!60787))

(assert (=> bs!8972 m!265809))

(assert (=> bs!8972 m!265981))

(assert (=> d!60703 d!60787))

(assert (=> d!60703 d!60689))

(declare-fun b!249551 () Bool)

(declare-fun e!161848 () Bool)

(declare-fun e!161847 () Bool)

(assert (=> b!249551 (= e!161848 e!161847)))

(declare-fun lt!125053 () (_ BitVec 64))

(assert (=> b!249551 (= lt!125053 (select (arr!5816 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!125052 () Unit!7683)

(assert (=> b!249551 (= lt!125052 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) lt!125053 #b00000000000000000000000000000000))))

(assert (=> b!249551 (arrayContainsKey!0 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) lt!125053 #b00000000000000000000000000000000)))

(declare-fun lt!125054 () Unit!7683)

(assert (=> b!249551 (= lt!125054 lt!125052)))

(declare-fun res!122258 () Bool)

(assert (=> b!249551 (= res!122258 (= (seekEntryOrOpen!0 (select (arr!5816 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504)))) #b00000000000000000000000000000000) (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) (mask!10766 thiss!1504)) (Found!1081 #b00000000000000000000000000000000)))))

(assert (=> b!249551 (=> (not res!122258) (not e!161847))))

(declare-fun b!249552 () Bool)

(declare-fun e!161849 () Bool)

(assert (=> b!249552 (= e!161849 e!161848)))

(declare-fun c!41873 () Bool)

(assert (=> b!249552 (= c!41873 (validKeyInArray!0 (select (arr!5816 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun call!23425 () Bool)

(declare-fun bm!23422 () Bool)

(assert (=> bm!23422 (= call!23425 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) (mask!10766 thiss!1504)))))

(declare-fun d!60789 () Bool)

(declare-fun res!122257 () Bool)

(assert (=> d!60789 (=> res!122257 e!161849)))

(assert (=> d!60789 (= res!122257 (bvsge #b00000000000000000000000000000000 (size!6159 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))))))))

(assert (=> d!60789 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) (mask!10766 thiss!1504)) e!161849)))

(declare-fun b!249553 () Bool)

(assert (=> b!249553 (= e!161848 call!23425)))

(declare-fun b!249554 () Bool)

(assert (=> b!249554 (= e!161847 call!23425)))

(assert (= (and d!60789 (not res!122257)) b!249552))

(assert (= (and b!249552 c!41873) b!249551))

(assert (= (and b!249552 (not c!41873)) b!249553))

(assert (= (and b!249551 res!122258) b!249554))

(assert (= (or b!249554 b!249553) bm!23422))

(assert (=> b!249551 m!266103))

(declare-fun m!266259 () Bool)

(assert (=> b!249551 m!266259))

(declare-fun m!266261 () Bool)

(assert (=> b!249551 m!266261))

(assert (=> b!249551 m!266103))

(declare-fun m!266263 () Bool)

(assert (=> b!249551 m!266263))

(assert (=> b!249552 m!266103))

(assert (=> b!249552 m!266103))

(assert (=> b!249552 m!266105))

(declare-fun m!266265 () Bool)

(assert (=> bm!23422 m!266265))

(assert (=> b!249300 d!60789))

(assert (=> d!60709 d!60707))

(declare-fun d!60791 () Bool)

(declare-fun e!161852 () Bool)

(assert (=> d!60791 e!161852))

(declare-fun res!122263 () Bool)

(assert (=> d!60791 (=> (not res!122263) (not e!161852))))

(declare-fun lt!125057 () SeekEntryResult!1081)

(assert (=> d!60791 (= res!122263 ((_ is Found!1081) lt!125057))))

(assert (=> d!60791 (= lt!125057 (seekEntryOrOpen!0 key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(assert (=> d!60791 true))

(declare-fun _$33!162 () Unit!7683)

(assert (=> d!60791 (= (choose!1180 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)) _$33!162)))

(declare-fun b!249559 () Bool)

(declare-fun res!122264 () Bool)

(assert (=> b!249559 (=> (not res!122264) (not e!161852))))

(assert (=> b!249559 (= res!122264 (inRange!0 (index!6495 lt!125057) (mask!10766 thiss!1504)))))

(declare-fun b!249560 () Bool)

(assert (=> b!249560 (= e!161852 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6495 lt!125057)) key!932))))

(assert (= (and d!60791 res!122263) b!249559))

(assert (= (and b!249559 res!122264) b!249560))

(assert (=> d!60791 m!265819))

(declare-fun m!266267 () Bool)

(assert (=> b!249559 m!266267))

(declare-fun m!266269 () Bool)

(assert (=> b!249560 m!266269))

(assert (=> d!60709 d!60791))

(assert (=> d!60709 d!60689))

(declare-fun d!60793 () Bool)

(declare-fun e!161853 () Bool)

(assert (=> d!60793 e!161853))

(declare-fun res!122265 () Bool)

(assert (=> d!60793 (=> res!122265 e!161853)))

(declare-fun lt!125061 () Bool)

(assert (=> d!60793 (= res!122265 (not lt!125061))))

(declare-fun lt!125059 () Bool)

(assert (=> d!60793 (= lt!125061 lt!125059)))

(declare-fun lt!125060 () Unit!7683)

(declare-fun e!161854 () Unit!7683)

(assert (=> d!60793 (= lt!125060 e!161854)))

(declare-fun c!41874 () Bool)

(assert (=> d!60793 (= c!41874 lt!125059)))

(assert (=> d!60793 (= lt!125059 (containsKey!288 (toList!1851 lt!124978) (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60793 (= (contains!1784 lt!124978 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)) lt!125061)))

(declare-fun b!249561 () Bool)

(declare-fun lt!125058 () Unit!7683)

(assert (=> b!249561 (= e!161854 lt!125058)))

(assert (=> b!249561 (= lt!125058 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1851 lt!124978) (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249561 (isDefined!237 (getValueByKey!297 (toList!1851 lt!124978) (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249562 () Bool)

(declare-fun Unit!7699 () Unit!7683)

(assert (=> b!249562 (= e!161854 Unit!7699)))

(declare-fun b!249563 () Bool)

(assert (=> b!249563 (= e!161853 (isDefined!237 (getValueByKey!297 (toList!1851 lt!124978) (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!60793 c!41874) b!249561))

(assert (= (and d!60793 (not c!41874)) b!249562))

(assert (= (and d!60793 (not res!122265)) b!249563))

(assert (=> d!60793 m!265941))

(declare-fun m!266271 () Bool)

(assert (=> d!60793 m!266271))

(assert (=> b!249561 m!265941))

(declare-fun m!266273 () Bool)

(assert (=> b!249561 m!266273))

(assert (=> b!249561 m!265941))

(declare-fun m!266275 () Bool)

(assert (=> b!249561 m!266275))

(assert (=> b!249561 m!266275))

(declare-fun m!266277 () Bool)

(assert (=> b!249561 m!266277))

(assert (=> b!249563 m!265941))

(assert (=> b!249563 m!266275))

(assert (=> b!249563 m!266275))

(assert (=> b!249563 m!266277))

(assert (=> b!249427 d!60793))

(assert (=> bm!23405 d!60767))

(declare-fun b!249582 () Bool)

(declare-fun lt!125067 () SeekEntryResult!1081)

(assert (=> b!249582 (and (bvsge (index!6496 lt!125067) #b00000000000000000000000000000000) (bvslt (index!6496 lt!125067) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun res!122272 () Bool)

(assert (=> b!249582 (= res!122272 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6496 lt!125067)) key!932))))

(declare-fun e!161869 () Bool)

(assert (=> b!249582 (=> res!122272 e!161869)))

(declare-fun e!161868 () Bool)

(assert (=> b!249582 (= e!161868 e!161869)))

(declare-fun b!249583 () Bool)

(assert (=> b!249583 (and (bvsge (index!6496 lt!125067) #b00000000000000000000000000000000) (bvslt (index!6496 lt!125067) (size!6159 (_keys!6733 thiss!1504))))))

(declare-fun res!122274 () Bool)

(assert (=> b!249583 (= res!122274 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6496 lt!125067)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249583 (=> res!122274 e!161869)))

(declare-fun b!249584 () Bool)

(declare-fun e!161867 () Bool)

(assert (=> b!249584 (= e!161867 (bvsge (x!24579 lt!125067) #b01111111111111111111111111111110))))

(declare-fun b!249585 () Bool)

(assert (=> b!249585 (and (bvsge (index!6496 lt!125067) #b00000000000000000000000000000000) (bvslt (index!6496 lt!125067) (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> b!249585 (= e!161869 (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6496 lt!125067)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249586 () Bool)

(assert (=> b!249586 (= e!161867 e!161868)))

(declare-fun res!122273 () Bool)

(assert (=> b!249586 (= res!122273 (and ((_ is Intermediate!1081) lt!125067) (not (undefined!1893 lt!125067)) (bvslt (x!24579 lt!125067) #b01111111111111111111111111111110) (bvsge (x!24579 lt!125067) #b00000000000000000000000000000000) (bvsge (x!24579 lt!125067) #b00000000000000000000000000000000)))))

(assert (=> b!249586 (=> (not res!122273) (not e!161868))))

(declare-fun b!249587 () Bool)

(declare-fun e!161866 () SeekEntryResult!1081)

(assert (=> b!249587 (= e!161866 (Intermediate!1081 false (toIndex!0 key!932 (mask!10766 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!249588 () Bool)

(declare-fun e!161865 () SeekEntryResult!1081)

(assert (=> b!249588 (= e!161865 e!161866)))

(declare-fun c!41881 () Bool)

(declare-fun lt!125066 () (_ BitVec 64))

(assert (=> b!249588 (= c!41881 (or (= lt!125066 key!932) (= (bvadd lt!125066 lt!125066) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249589 () Bool)

(assert (=> b!249589 (= e!161865 (Intermediate!1081 true (toIndex!0 key!932 (mask!10766 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!60795 () Bool)

(assert (=> d!60795 e!161867))

(declare-fun c!41883 () Bool)

(assert (=> d!60795 (= c!41883 (and ((_ is Intermediate!1081) lt!125067) (undefined!1893 lt!125067)))))

(assert (=> d!60795 (= lt!125067 e!161865)))

(declare-fun c!41882 () Bool)

(assert (=> d!60795 (= c!41882 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!60795 (= lt!125066 (select (arr!5816 (_keys!6733 thiss!1504)) (toIndex!0 key!932 (mask!10766 thiss!1504))))))

(assert (=> d!60795 (validMask!0 (mask!10766 thiss!1504))))

(assert (=> d!60795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10766 thiss!1504)) key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)) lt!125067)))

(declare-fun b!249590 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249590 (= e!161866 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10766 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10766 thiss!1504)) key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(assert (= (and d!60795 c!41882) b!249589))

(assert (= (and d!60795 (not c!41882)) b!249588))

(assert (= (and b!249588 c!41881) b!249587))

(assert (= (and b!249588 (not c!41881)) b!249590))

(assert (= (and d!60795 c!41883) b!249584))

(assert (= (and d!60795 (not c!41883)) b!249586))

(assert (= (and b!249586 res!122273) b!249582))

(assert (= (and b!249582 (not res!122272)) b!249583))

(assert (= (and b!249583 (not res!122274)) b!249585))

(declare-fun m!266279 () Bool)

(assert (=> b!249582 m!266279))

(assert (=> d!60795 m!265993))

(declare-fun m!266281 () Bool)

(assert (=> d!60795 m!266281))

(assert (=> d!60795 m!265795))

(assert (=> b!249585 m!266279))

(assert (=> b!249590 m!265993))

(declare-fun m!266283 () Bool)

(assert (=> b!249590 m!266283))

(assert (=> b!249590 m!266283))

(declare-fun m!266285 () Bool)

(assert (=> b!249590 m!266285))

(assert (=> b!249583 m!266279))

(assert (=> d!60707 d!60795))

(declare-fun d!60797 () Bool)

(declare-fun lt!125073 () (_ BitVec 32))

(declare-fun lt!125072 () (_ BitVec 32))

(assert (=> d!60797 (= lt!125073 (bvmul (bvxor lt!125072 (bvlshr lt!125072 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!60797 (= lt!125072 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!60797 (and (bvsge (mask!10766 thiss!1504) #b00000000000000000000000000000000) (let ((res!122275 (let ((h!4291 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24598 (bvmul (bvxor h!4291 (bvlshr h!4291 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24598 (bvlshr x!24598 #b00000000000000000000000000001101)) (mask!10766 thiss!1504)))))) (and (bvslt res!122275 (bvadd (mask!10766 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!122275 #b00000000000000000000000000000000))))))

(assert (=> d!60797 (= (toIndex!0 key!932 (mask!10766 thiss!1504)) (bvand (bvxor lt!125073 (bvlshr lt!125073 #b00000000000000000000000000001101)) (mask!10766 thiss!1504)))))

(assert (=> d!60707 d!60797))

(assert (=> d!60707 d!60689))

(declare-fun d!60799 () Bool)

(assert (=> d!60799 (= (arrayCountValidKeys!0 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6733 thiss!1504) #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!60799 true))

(declare-fun _$84!24 () Unit!7683)

(assert (=> d!60799 (= (choose!1 (_keys!6733 thiss!1504) index!297 key!932) _$84!24)))

(declare-fun bs!8973 () Bool)

(assert (= bs!8973 d!60799))

(assert (=> bs!8973 m!265809))

(assert (=> bs!8973 m!265961))

(assert (=> bs!8973 m!265811))

(assert (=> d!60697 d!60799))

(assert (=> d!60717 d!60721))

(assert (=> d!60717 d!60723))

(declare-fun d!60801 () Bool)

(assert (=> d!60801 (contains!1784 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) key!932)))

(assert (=> d!60801 true))

(declare-fun _$17!71 () Unit!7683)

(assert (=> d!60801 (= (choose!1182 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) _$17!71)))

(declare-fun bs!8974 () Bool)

(assert (= bs!8974 d!60801))

(assert (=> bs!8974 m!265831))

(assert (=> bs!8974 m!265831))

(assert (=> bs!8974 m!265833))

(assert (=> d!60717 d!60801))

(assert (=> d!60717 d!60689))

(declare-fun d!60803 () Bool)

(declare-fun e!161870 () Bool)

(assert (=> d!60803 e!161870))

(declare-fun res!122277 () Bool)

(assert (=> d!60803 (=> (not res!122277) (not e!161870))))

(declare-fun lt!125075 () ListLongMap!3671)

(assert (=> d!60803 (= res!122277 (contains!1784 lt!125075 (_1!2389 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(declare-fun lt!125074 () List!3634)

(assert (=> d!60803 (= lt!125075 (ListLongMap!3672 lt!125074))))

(declare-fun lt!125077 () Unit!7683)

(declare-fun lt!125076 () Unit!7683)

(assert (=> d!60803 (= lt!125077 lt!125076)))

(assert (=> d!60803 (= (getValueByKey!297 lt!125074 (_1!2389 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))) (Some!302 (_2!2389 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(assert (=> d!60803 (= lt!125076 (lemmaContainsTupThenGetReturnValue!158 lt!125074 (_1!2389 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))) (_2!2389 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(assert (=> d!60803 (= lt!125074 (insertStrictlySorted!161 (toList!1851 call!23405) (_1!2389 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))) (_2!2389 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(assert (=> d!60803 (= (+!665 call!23405 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))) lt!125075)))

(declare-fun b!249591 () Bool)

(declare-fun res!122276 () Bool)

(assert (=> b!249591 (=> (not res!122276) (not e!161870))))

(assert (=> b!249591 (= res!122276 (= (getValueByKey!297 (toList!1851 lt!125075) (_1!2389 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))) (Some!302 (_2!2389 (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))))

(declare-fun b!249592 () Bool)

(assert (=> b!249592 (= e!161870 (contains!1787 (toList!1851 lt!125075) (tuple2!4757 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))

(assert (= (and d!60803 res!122277) b!249591))

(assert (= (and b!249591 res!122276) b!249592))

(declare-fun m!266287 () Bool)

(assert (=> d!60803 m!266287))

(declare-fun m!266289 () Bool)

(assert (=> d!60803 m!266289))

(declare-fun m!266291 () Bool)

(assert (=> d!60803 m!266291))

(declare-fun m!266293 () Bool)

(assert (=> d!60803 m!266293))

(declare-fun m!266295 () Bool)

(assert (=> b!249591 m!266295))

(declare-fun m!266297 () Bool)

(assert (=> b!249592 m!266297))

(assert (=> b!249420 d!60803))

(declare-fun d!60805 () Bool)

(assert (=> d!60805 (arrayNoDuplicates!0 (array!12264 (store (arr!5816 (_keys!6733 thiss!1504)) index!297 key!932) (size!6159 (_keys!6733 thiss!1504))) #b00000000000000000000000000000000 Nil!3630)))

(assert (=> d!60805 true))

(declare-fun _$65!74 () Unit!7683)

(assert (=> d!60805 (= (choose!41 (_keys!6733 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3630) _$65!74)))

(declare-fun bs!8975 () Bool)

(assert (= bs!8975 d!60805))

(assert (=> bs!8975 m!265809))

(assert (=> bs!8975 m!265957))

(assert (=> d!60695 d!60805))

(declare-fun d!60807 () Bool)

(assert (=> d!60807 (= (apply!238 lt!124978 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)) (get!2992 (getValueByKey!297 (toList!1851 lt!124978) (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8976 () Bool)

(assert (= bs!8976 d!60807))

(assert (=> bs!8976 m!265941))

(assert (=> bs!8976 m!266275))

(assert (=> bs!8976 m!266275))

(declare-fun m!266299 () Bool)

(assert (=> bs!8976 m!266299))

(assert (=> b!249418 d!60807))

(declare-fun d!60809 () Bool)

(declare-fun c!41886 () Bool)

(assert (=> d!60809 (= c!41886 ((_ is ValueCellFull!2894) (select (arr!5815 (_values!4588 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!161873 () V!8281)

(assert (=> d!60809 (= (get!2991 (select (arr!5815 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!161873)))

(declare-fun b!249597 () Bool)

(declare-fun get!2993 (ValueCell!2894 V!8281) V!8281)

(assert (=> b!249597 (= e!161873 (get!2993 (select (arr!5815 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249598 () Bool)

(declare-fun get!2994 (ValueCell!2894 V!8281) V!8281)

(assert (=> b!249598 (= e!161873 (get!2994 (select (arr!5815 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!581 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60809 c!41886) b!249597))

(assert (= (and d!60809 (not c!41886)) b!249598))

(assert (=> b!249597 m!266063))

(assert (=> b!249597 m!266065))

(declare-fun m!266301 () Bool)

(assert (=> b!249597 m!266301))

(assert (=> b!249598 m!266063))

(assert (=> b!249598 m!266065))

(declare-fun m!266303 () Bool)

(assert (=> b!249598 m!266303))

(assert (=> b!249418 d!60809))

(declare-fun d!60811 () Bool)

(declare-fun res!122282 () Bool)

(declare-fun e!161878 () Bool)

(assert (=> d!60811 (=> res!122282 e!161878)))

(assert (=> d!60811 (= res!122282 (and ((_ is Cons!3630) (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) (= (_1!2389 (h!4288 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) key!932)))))

(assert (=> d!60811 (= (containsKey!288 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932) e!161878)))

(declare-fun b!249603 () Bool)

(declare-fun e!161879 () Bool)

(assert (=> b!249603 (= e!161878 e!161879)))

(declare-fun res!122283 () Bool)

(assert (=> b!249603 (=> (not res!122283) (not e!161879))))

(assert (=> b!249603 (= res!122283 (and (or (not ((_ is Cons!3630) (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) (bvsle (_1!2389 (h!4288 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) key!932)) ((_ is Cons!3630) (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) (bvslt (_1!2389 (h!4288 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) key!932)))))

(declare-fun b!249604 () Bool)

(assert (=> b!249604 (= e!161879 (containsKey!288 (t!8655 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) key!932))))

(assert (= (and d!60811 (not res!122282)) b!249603))

(assert (= (and b!249603 res!122283) b!249604))

(declare-fun m!266305 () Bool)

(assert (=> b!249604 m!266305))

(assert (=> d!60721 d!60811))

(assert (=> b!249416 d!60731))

(assert (=> b!249244 d!60731))

(declare-fun d!60813 () Bool)

(assert (=> d!60813 (= (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) index!297)) (and (not (= (select (arr!5816 (_keys!6733 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5816 (_keys!6733 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249276 d!60813))

(declare-fun b!249605 () Bool)

(declare-fun e!161881 () Bool)

(declare-fun e!161880 () Bool)

(assert (=> b!249605 (= e!161881 e!161880)))

(declare-fun lt!125079 () (_ BitVec 64))

(assert (=> b!249605 (= lt!125079 (select (arr!5816 lt!124787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!125078 () Unit!7683)

(assert (=> b!249605 (= lt!125078 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124787 lt!125079 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!249605 (arrayContainsKey!0 lt!124787 lt!125079 #b00000000000000000000000000000000)))

(declare-fun lt!125080 () Unit!7683)

(assert (=> b!249605 (= lt!125080 lt!125078)))

(declare-fun res!122285 () Bool)

(assert (=> b!249605 (= res!122285 (= (seekEntryOrOpen!0 (select (arr!5816 lt!124787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!124787 (mask!10766 thiss!1504)) (Found!1081 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!249605 (=> (not res!122285) (not e!161880))))

(declare-fun b!249606 () Bool)

(declare-fun e!161882 () Bool)

(assert (=> b!249606 (= e!161882 e!161881)))

(declare-fun c!41887 () Bool)

(assert (=> b!249606 (= c!41887 (validKeyInArray!0 (select (arr!5816 lt!124787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!23423 () Bool)

(declare-fun call!23426 () Bool)

(assert (=> bm!23423 (= call!23426 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!124787 (mask!10766 thiss!1504)))))

(declare-fun d!60815 () Bool)

(declare-fun res!122284 () Bool)

(assert (=> d!60815 (=> res!122284 e!161882)))

(assert (=> d!60815 (= res!122284 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 lt!124787)))))

(assert (=> d!60815 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124787 (mask!10766 thiss!1504)) e!161882)))

(declare-fun b!249607 () Bool)

(assert (=> b!249607 (= e!161881 call!23426)))

(declare-fun b!249608 () Bool)

(assert (=> b!249608 (= e!161880 call!23426)))

(assert (= (and d!60815 (not res!122284)) b!249606))

(assert (= (and b!249606 c!41887) b!249605))

(assert (= (and b!249606 (not c!41887)) b!249607))

(assert (= (and b!249605 res!122285) b!249608))

(assert (= (or b!249608 b!249607) bm!23423))

(assert (=> b!249605 m!266139))

(declare-fun m!266307 () Bool)

(assert (=> b!249605 m!266307))

(declare-fun m!266309 () Bool)

(assert (=> b!249605 m!266309))

(assert (=> b!249605 m!266139))

(declare-fun m!266311 () Bool)

(assert (=> b!249605 m!266311))

(assert (=> b!249606 m!266139))

(assert (=> b!249606 m!266139))

(assert (=> b!249606 m!266141))

(declare-fun m!266313 () Bool)

(assert (=> bm!23423 m!266313))

(assert (=> bm!23380 d!60815))

(assert (=> b!249263 d!60749))

(declare-fun d!60817 () Bool)

(assert (=> d!60817 (= (inRange!0 (ite c!41822 (index!6494 lt!124898) (index!6497 lt!124898)) (mask!10766 thiss!1504)) (and (bvsge (ite c!41822 (index!6494 lt!124898) (index!6497 lt!124898)) #b00000000000000000000000000000000) (bvslt (ite c!41822 (index!6494 lt!124898) (index!6497 lt!124898)) (bvadd (mask!10766 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23385 d!60817))

(declare-fun d!60819 () Bool)

(declare-fun isEmpty!531 (Option!303) Bool)

(assert (=> d!60819 (= (isDefined!237 (getValueByKey!297 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932)) (not (isEmpty!531 (getValueByKey!297 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))))

(declare-fun bs!8977 () Bool)

(assert (= bs!8977 d!60819))

(assert (=> bs!8977 m!266023))

(declare-fun m!266315 () Bool)

(assert (=> bs!8977 m!266315))

(assert (=> b!249366 d!60819))

(declare-fun b!249619 () Bool)

(declare-fun e!161888 () Option!303)

(assert (=> b!249619 (= e!161888 (getValueByKey!297 (t!8655 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) key!932))))

(declare-fun b!249620 () Bool)

(assert (=> b!249620 (= e!161888 None!301)))

(declare-fun d!60821 () Bool)

(declare-fun c!41892 () Bool)

(assert (=> d!60821 (= c!41892 (and ((_ is Cons!3630) (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) (= (_1!2389 (h!4288 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) key!932)))))

(declare-fun e!161887 () Option!303)

(assert (=> d!60821 (= (getValueByKey!297 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932) e!161887)))

(declare-fun b!249617 () Bool)

(assert (=> b!249617 (= e!161887 (Some!302 (_2!2389 (h!4288 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))))))

(declare-fun b!249618 () Bool)

(assert (=> b!249618 (= e!161887 e!161888)))

(declare-fun c!41893 () Bool)

(assert (=> b!249618 (= c!41893 (and ((_ is Cons!3630) (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) (not (= (_1!2389 (h!4288 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) key!932))))))

(assert (= (and d!60821 c!41892) b!249617))

(assert (= (and d!60821 (not c!41892)) b!249618))

(assert (= (and b!249618 c!41893) b!249619))

(assert (= (and b!249618 (not c!41893)) b!249620))

(declare-fun m!266317 () Bool)

(assert (=> b!249619 m!266317))

(assert (=> b!249366 d!60821))

(declare-fun d!60823 () Bool)

(declare-fun res!122286 () Bool)

(declare-fun e!161890 () Bool)

(assert (=> d!60823 (=> res!122286 e!161890)))

(assert (=> d!60823 (= res!122286 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 lt!124787)))))

(assert (=> d!60823 (= (arrayNoDuplicates!0 lt!124787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41803 (Cons!3629 (select (arr!5816 lt!124787) #b00000000000000000000000000000000) Nil!3630) Nil!3630)) e!161890)))

(declare-fun b!249621 () Bool)

(declare-fun e!161892 () Bool)

(assert (=> b!249621 (= e!161892 (contains!1786 (ite c!41803 (Cons!3629 (select (arr!5816 lt!124787) #b00000000000000000000000000000000) Nil!3630) Nil!3630) (select (arr!5816 lt!124787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249622 () Bool)

(declare-fun e!161891 () Bool)

(assert (=> b!249622 (= e!161890 e!161891)))

(declare-fun res!122287 () Bool)

(assert (=> b!249622 (=> (not res!122287) (not e!161891))))

(assert (=> b!249622 (= res!122287 (not e!161892))))

(declare-fun res!122288 () Bool)

(assert (=> b!249622 (=> (not res!122288) (not e!161892))))

(assert (=> b!249622 (= res!122288 (validKeyInArray!0 (select (arr!5816 lt!124787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249623 () Bool)

(declare-fun e!161889 () Bool)

(assert (=> b!249623 (= e!161891 e!161889)))

(declare-fun c!41894 () Bool)

(assert (=> b!249623 (= c!41894 (validKeyInArray!0 (select (arr!5816 lt!124787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249624 () Bool)

(declare-fun call!23427 () Bool)

(assert (=> b!249624 (= e!161889 call!23427)))

(declare-fun bm!23424 () Bool)

(assert (=> bm!23424 (= call!23427 (arrayNoDuplicates!0 lt!124787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!41894 (Cons!3629 (select (arr!5816 lt!124787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!41803 (Cons!3629 (select (arr!5816 lt!124787) #b00000000000000000000000000000000) Nil!3630) Nil!3630)) (ite c!41803 (Cons!3629 (select (arr!5816 lt!124787) #b00000000000000000000000000000000) Nil!3630) Nil!3630))))))

(declare-fun b!249625 () Bool)

(assert (=> b!249625 (= e!161889 call!23427)))

(assert (= (and d!60823 (not res!122286)) b!249622))

(assert (= (and b!249622 res!122288) b!249621))

(assert (= (and b!249622 res!122287) b!249623))

(assert (= (and b!249623 c!41894) b!249624))

(assert (= (and b!249623 (not c!41894)) b!249625))

(assert (= (or b!249624 b!249625) bm!23424))

(assert (=> b!249621 m!266139))

(assert (=> b!249621 m!266139))

(declare-fun m!266319 () Bool)

(assert (=> b!249621 m!266319))

(assert (=> b!249622 m!266139))

(assert (=> b!249622 m!266139))

(assert (=> b!249622 m!266141))

(assert (=> b!249623 m!266139))

(assert (=> b!249623 m!266139))

(assert (=> b!249623 m!266141))

(assert (=> bm!23424 m!266139))

(declare-fun m!266321 () Bool)

(assert (=> bm!23424 m!266321))

(assert (=> bm!23376 d!60823))

(declare-fun b!249626 () Bool)

(declare-fun e!161894 () Bool)

(declare-fun e!161893 () Bool)

(assert (=> b!249626 (= e!161894 e!161893)))

(declare-fun lt!125082 () (_ BitVec 64))

(assert (=> b!249626 (= lt!125082 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125081 () Unit!7683)

(assert (=> b!249626 (= lt!125081 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6733 thiss!1504) lt!125082 #b00000000000000000000000000000000))))

(assert (=> b!249626 (arrayContainsKey!0 (_keys!6733 thiss!1504) lt!125082 #b00000000000000000000000000000000)))

(declare-fun lt!125083 () Unit!7683)

(assert (=> b!249626 (= lt!125083 lt!125081)))

(declare-fun res!122290 () Bool)

(assert (=> b!249626 (= res!122290 (= (seekEntryOrOpen!0 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000) (_keys!6733 thiss!1504) (mask!10766 thiss!1504)) (Found!1081 #b00000000000000000000000000000000)))))

(assert (=> b!249626 (=> (not res!122290) (not e!161893))))

(declare-fun b!249627 () Bool)

(declare-fun e!161895 () Bool)

(assert (=> b!249627 (= e!161895 e!161894)))

(declare-fun c!41895 () Bool)

(assert (=> b!249627 (= c!41895 (validKeyInArray!0 (select (arr!5816 (_keys!6733 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23425 () Bool)

(declare-fun call!23428 () Bool)

(assert (=> bm!23425 (= call!23428 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(declare-fun d!60825 () Bool)

(declare-fun res!122289 () Bool)

(assert (=> d!60825 (=> res!122289 e!161895)))

(assert (=> d!60825 (= res!122289 (bvsge #b00000000000000000000000000000000 (size!6159 (_keys!6733 thiss!1504))))))

(assert (=> d!60825 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)) e!161895)))

(declare-fun b!249628 () Bool)

(assert (=> b!249628 (= e!161894 call!23428)))

(declare-fun b!249629 () Bool)

(assert (=> b!249629 (= e!161893 call!23428)))

(assert (= (and d!60825 (not res!122289)) b!249627))

(assert (= (and b!249627 c!41895) b!249626))

(assert (= (and b!249627 (not c!41895)) b!249628))

(assert (= (and b!249626 res!122290) b!249629))

(assert (= (or b!249629 b!249628) bm!23425))

(assert (=> b!249626 m!265941))

(declare-fun m!266323 () Bool)

(assert (=> b!249626 m!266323))

(declare-fun m!266325 () Bool)

(assert (=> b!249626 m!266325))

(assert (=> b!249626 m!265941))

(declare-fun m!266327 () Bool)

(assert (=> b!249626 m!266327))

(assert (=> b!249627 m!265941))

(assert (=> b!249627 m!265941))

(assert (=> b!249627 m!265943))

(declare-fun m!266329 () Bool)

(assert (=> bm!23425 m!266329))

(assert (=> b!249308 d!60825))

(declare-fun d!60827 () Bool)

(assert (=> d!60827 (isDefined!237 (getValueByKey!297 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(declare-fun lt!125086 () Unit!7683)

(declare-fun choose!1185 (List!3634 (_ BitVec 64)) Unit!7683)

(assert (=> d!60827 (= lt!125086 (choose!1185 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(declare-fun e!161898 () Bool)

(assert (=> d!60827 e!161898))

(declare-fun res!122293 () Bool)

(assert (=> d!60827 (=> (not res!122293) (not e!161898))))

(declare-fun isStrictlySorted!356 (List!3634) Bool)

(assert (=> d!60827 (= res!122293 (isStrictlySorted!356 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))))

(assert (=> d!60827 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932) lt!125086)))

(declare-fun b!249632 () Bool)

(assert (=> b!249632 (= e!161898 (containsKey!288 (toList!1851 (getCurrentListMap!1383 (_keys!6733 thiss!1504) (_values!4588 thiss!1504) (mask!10766 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(assert (= (and d!60827 res!122293) b!249632))

(assert (=> d!60827 m!266023))

(assert (=> d!60827 m!266023))

(assert (=> d!60827 m!266025))

(declare-fun m!266331 () Bool)

(assert (=> d!60827 m!266331))

(declare-fun m!266333 () Bool)

(assert (=> d!60827 m!266333))

(assert (=> b!249632 m!266019))

(assert (=> b!249364 d!60827))

(assert (=> b!249364 d!60819))

(assert (=> b!249364 d!60821))

(assert (=> b!249258 d!60749))

(declare-fun b!249642 () Bool)

(declare-fun res!122304 () Bool)

(declare-fun e!161901 () Bool)

(assert (=> b!249642 (=> (not res!122304) (not e!161901))))

(declare-fun size!6164 (LongMapFixedSize!3688) (_ BitVec 32))

(assert (=> b!249642 (= res!122304 (bvsge (size!6164 thiss!1504) (_size!1893 thiss!1504)))))

(declare-fun d!60829 () Bool)

(declare-fun res!122305 () Bool)

(assert (=> d!60829 (=> (not res!122305) (not e!161901))))

(assert (=> d!60829 (= res!122305 (validMask!0 (mask!10766 thiss!1504)))))

(assert (=> d!60829 (= (simpleValid!261 thiss!1504) e!161901)))

(declare-fun b!249643 () Bool)

(declare-fun res!122303 () Bool)

(assert (=> b!249643 (=> (not res!122303) (not e!161901))))

(assert (=> b!249643 (= res!122303 (= (size!6164 thiss!1504) (bvadd (_size!1893 thiss!1504) (bvsdiv (bvadd (extraKeys!4342 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!249641 () Bool)

(declare-fun res!122302 () Bool)

(assert (=> b!249641 (=> (not res!122302) (not e!161901))))

(assert (=> b!249641 (= res!122302 (and (= (size!6158 (_values!4588 thiss!1504)) (bvadd (mask!10766 thiss!1504) #b00000000000000000000000000000001)) (= (size!6159 (_keys!6733 thiss!1504)) (size!6158 (_values!4588 thiss!1504))) (bvsge (_size!1893 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1893 thiss!1504) (bvadd (mask!10766 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!249644 () Bool)

(assert (=> b!249644 (= e!161901 (and (bvsge (extraKeys!4342 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4342 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1893 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!60829 res!122305) b!249641))

(assert (= (and b!249641 res!122302) b!249642))

(assert (= (and b!249642 res!122304) b!249643))

(assert (= (and b!249643 res!122303) b!249644))

(declare-fun m!266335 () Bool)

(assert (=> b!249642 m!266335))

(assert (=> d!60829 m!265795))

(assert (=> b!249643 m!266335))

(assert (=> d!60705 d!60829))

(declare-fun d!60831 () Bool)

(assert (=> d!60831 (arrayContainsKey!0 lt!124787 lt!124874 #b00000000000000000000000000000000)))

(declare-fun lt!125089 () Unit!7683)

(declare-fun choose!13 (array!12263 (_ BitVec 64) (_ BitVec 32)) Unit!7683)

(assert (=> d!60831 (= lt!125089 (choose!13 lt!124787 lt!124874 #b00000000000000000000000000000000))))

(assert (=> d!60831 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!60831 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124787 lt!124874 #b00000000000000000000000000000000) lt!125089)))

(declare-fun bs!8978 () Bool)

(assert (= bs!8978 d!60831))

(assert (=> bs!8978 m!265971))

(declare-fun m!266337 () Bool)

(assert (=> bs!8978 m!266337))

(assert (=> b!249288 d!60831))

(declare-fun d!60833 () Bool)

(declare-fun res!122306 () Bool)

(declare-fun e!161902 () Bool)

(assert (=> d!60833 (=> res!122306 e!161902)))

(assert (=> d!60833 (= res!122306 (= (select (arr!5816 lt!124787) #b00000000000000000000000000000000) lt!124874))))

(assert (=> d!60833 (= (arrayContainsKey!0 lt!124787 lt!124874 #b00000000000000000000000000000000) e!161902)))

(declare-fun b!249645 () Bool)

(declare-fun e!161903 () Bool)

(assert (=> b!249645 (= e!161902 e!161903)))

(declare-fun res!122307 () Bool)

(assert (=> b!249645 (=> (not res!122307) (not e!161903))))

(assert (=> b!249645 (= res!122307 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6159 lt!124787)))))

(declare-fun b!249646 () Bool)

(assert (=> b!249646 (= e!161903 (arrayContainsKey!0 lt!124787 lt!124874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60833 (not res!122306)) b!249645))

(assert (= (and b!249645 res!122307) b!249646))

(assert (=> d!60833 m!265945))

(declare-fun m!266339 () Bool)

(assert (=> b!249646 m!266339))

(assert (=> b!249288 d!60833))

(declare-fun b!249647 () Bool)

(declare-fun e!161904 () SeekEntryResult!1081)

(declare-fun lt!125092 () SeekEntryResult!1081)

(assert (=> b!249647 (= e!161904 (MissingZero!1081 (index!6496 lt!125092)))))

(declare-fun d!60835 () Bool)

(declare-fun lt!125091 () SeekEntryResult!1081)

(assert (=> d!60835 (and (or ((_ is Undefined!1081) lt!125091) (not ((_ is Found!1081) lt!125091)) (and (bvsge (index!6495 lt!125091) #b00000000000000000000000000000000) (bvslt (index!6495 lt!125091) (size!6159 lt!124787)))) (or ((_ is Undefined!1081) lt!125091) ((_ is Found!1081) lt!125091) (not ((_ is MissingZero!1081) lt!125091)) (and (bvsge (index!6494 lt!125091) #b00000000000000000000000000000000) (bvslt (index!6494 lt!125091) (size!6159 lt!124787)))) (or ((_ is Undefined!1081) lt!125091) ((_ is Found!1081) lt!125091) ((_ is MissingZero!1081) lt!125091) (not ((_ is MissingVacant!1081) lt!125091)) (and (bvsge (index!6497 lt!125091) #b00000000000000000000000000000000) (bvslt (index!6497 lt!125091) (size!6159 lt!124787)))) (or ((_ is Undefined!1081) lt!125091) (ite ((_ is Found!1081) lt!125091) (= (select (arr!5816 lt!124787) (index!6495 lt!125091)) (select (arr!5816 lt!124787) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1081) lt!125091) (= (select (arr!5816 lt!124787) (index!6494 lt!125091)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1081) lt!125091) (= (select (arr!5816 lt!124787) (index!6497 lt!125091)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!161906 () SeekEntryResult!1081)

(assert (=> d!60835 (= lt!125091 e!161906)))

(declare-fun c!41896 () Bool)

(assert (=> d!60835 (= c!41896 (and ((_ is Intermediate!1081) lt!125092) (undefined!1893 lt!125092)))))

(assert (=> d!60835 (= lt!125092 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5816 lt!124787) #b00000000000000000000000000000000) (mask!10766 thiss!1504)) (select (arr!5816 lt!124787) #b00000000000000000000000000000000) lt!124787 (mask!10766 thiss!1504)))))

(assert (=> d!60835 (validMask!0 (mask!10766 thiss!1504))))

(assert (=> d!60835 (= (seekEntryOrOpen!0 (select (arr!5816 lt!124787) #b00000000000000000000000000000000) lt!124787 (mask!10766 thiss!1504)) lt!125091)))

(declare-fun b!249648 () Bool)

(declare-fun e!161905 () SeekEntryResult!1081)

(assert (=> b!249648 (= e!161905 (Found!1081 (index!6496 lt!125092)))))

(declare-fun b!249649 () Bool)

(assert (=> b!249649 (= e!161904 (seekKeyOrZeroReturnVacant!0 (x!24579 lt!125092) (index!6496 lt!125092) (index!6496 lt!125092) (select (arr!5816 lt!124787) #b00000000000000000000000000000000) lt!124787 (mask!10766 thiss!1504)))))

(declare-fun b!249650 () Bool)

(declare-fun c!41898 () Bool)

(declare-fun lt!125090 () (_ BitVec 64))

(assert (=> b!249650 (= c!41898 (= lt!125090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249650 (= e!161905 e!161904)))

(declare-fun b!249651 () Bool)

(assert (=> b!249651 (= e!161906 e!161905)))

(assert (=> b!249651 (= lt!125090 (select (arr!5816 lt!124787) (index!6496 lt!125092)))))

(declare-fun c!41897 () Bool)

(assert (=> b!249651 (= c!41897 (= lt!125090 (select (arr!5816 lt!124787) #b00000000000000000000000000000000)))))

(declare-fun b!249652 () Bool)

(assert (=> b!249652 (= e!161906 Undefined!1081)))

(assert (= (and d!60835 c!41896) b!249652))

(assert (= (and d!60835 (not c!41896)) b!249651))

(assert (= (and b!249651 c!41897) b!249648))

(assert (= (and b!249651 (not c!41897)) b!249650))

(assert (= (and b!249650 c!41898) b!249647))

(assert (= (and b!249650 (not c!41898)) b!249649))

(declare-fun m!266341 () Bool)

(assert (=> d!60835 m!266341))

(declare-fun m!266343 () Bool)

(assert (=> d!60835 m!266343))

(assert (=> d!60835 m!265945))

(declare-fun m!266345 () Bool)

(assert (=> d!60835 m!266345))

(assert (=> d!60835 m!265795))

(assert (=> d!60835 m!266345))

(assert (=> d!60835 m!265945))

(declare-fun m!266347 () Bool)

(assert (=> d!60835 m!266347))

(declare-fun m!266349 () Bool)

(assert (=> d!60835 m!266349))

(assert (=> b!249649 m!265945))

(declare-fun m!266351 () Bool)

(assert (=> b!249649 m!266351))

(declare-fun m!266353 () Bool)

(assert (=> b!249651 m!266353))

(assert (=> b!249288 d!60835))

(declare-fun b!249665 () Bool)

(declare-fun e!161915 () SeekEntryResult!1081)

(declare-fun e!161913 () SeekEntryResult!1081)

(assert (=> b!249665 (= e!161915 e!161913)))

(declare-fun c!41907 () Bool)

(declare-fun lt!125097 () (_ BitVec 64))

(assert (=> b!249665 (= c!41907 (= lt!125097 key!932))))

(declare-fun b!249666 () Bool)

(declare-fun c!41905 () Bool)

(assert (=> b!249666 (= c!41905 (= lt!125097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161914 () SeekEntryResult!1081)

(assert (=> b!249666 (= e!161913 e!161914)))

(declare-fun b!249667 () Bool)

(assert (=> b!249667 (= e!161913 (Found!1081 (index!6496 lt!124887)))))

(declare-fun b!249669 () Bool)

(assert (=> b!249669 (= e!161914 (MissingVacant!1081 (index!6496 lt!124887)))))

(declare-fun b!249670 () Bool)

(assert (=> b!249670 (= e!161915 Undefined!1081)))

(declare-fun d!60837 () Bool)

(declare-fun lt!125098 () SeekEntryResult!1081)

(assert (=> d!60837 (and (or ((_ is Undefined!1081) lt!125098) (not ((_ is Found!1081) lt!125098)) (and (bvsge (index!6495 lt!125098) #b00000000000000000000000000000000) (bvslt (index!6495 lt!125098) (size!6159 (_keys!6733 thiss!1504))))) (or ((_ is Undefined!1081) lt!125098) ((_ is Found!1081) lt!125098) (not ((_ is MissingVacant!1081) lt!125098)) (not (= (index!6497 lt!125098) (index!6496 lt!124887))) (and (bvsge (index!6497 lt!125098) #b00000000000000000000000000000000) (bvslt (index!6497 lt!125098) (size!6159 (_keys!6733 thiss!1504))))) (or ((_ is Undefined!1081) lt!125098) (ite ((_ is Found!1081) lt!125098) (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6495 lt!125098)) key!932) (and ((_ is MissingVacant!1081) lt!125098) (= (index!6497 lt!125098) (index!6496 lt!124887)) (= (select (arr!5816 (_keys!6733 thiss!1504)) (index!6497 lt!125098)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!60837 (= lt!125098 e!161915)))

(declare-fun c!41906 () Bool)

(assert (=> d!60837 (= c!41906 (bvsge (x!24579 lt!124887) #b01111111111111111111111111111110))))

(assert (=> d!60837 (= lt!125097 (select (arr!5816 (_keys!6733 thiss!1504)) (index!6496 lt!124887)))))

(assert (=> d!60837 (validMask!0 (mask!10766 thiss!1504))))

(assert (=> d!60837 (= (seekKeyOrZeroReturnVacant!0 (x!24579 lt!124887) (index!6496 lt!124887) (index!6496 lt!124887) key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)) lt!125098)))

(declare-fun b!249668 () Bool)

(assert (=> b!249668 (= e!161914 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24579 lt!124887) #b00000000000000000000000000000001) (nextIndex!0 (index!6496 lt!124887) (bvadd (x!24579 lt!124887) #b00000000000000000000000000000001) (mask!10766 thiss!1504)) (index!6496 lt!124887) key!932 (_keys!6733 thiss!1504) (mask!10766 thiss!1504)))))

(assert (= (and d!60837 c!41906) b!249670))

(assert (= (and d!60837 (not c!41906)) b!249665))

(assert (= (and b!249665 c!41907) b!249667))

(assert (= (and b!249665 (not c!41907)) b!249666))

(assert (= (and b!249666 c!41905) b!249669))

(assert (= (and b!249666 (not c!41905)) b!249668))

(declare-fun m!266355 () Bool)

(assert (=> d!60837 m!266355))

(declare-fun m!266357 () Bool)

(assert (=> d!60837 m!266357))

(assert (=> d!60837 m!266001))

(assert (=> d!60837 m!265795))

(declare-fun m!266359 () Bool)

(assert (=> b!249668 m!266359))

(assert (=> b!249668 m!266359))

(declare-fun m!266361 () Bool)

(assert (=> b!249668 m!266361))

(assert (=> b!249324 d!60837))

(declare-fun d!60839 () Bool)

(declare-fun lt!125101 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!165 (List!3633) (InoxSet (_ BitVec 64)))

(assert (=> d!60839 (= lt!125101 (select (content!165 Nil!3630) (select (arr!5816 lt!124787) #b00000000000000000000000000000000)))))

(declare-fun e!161920 () Bool)

(assert (=> d!60839 (= lt!125101 e!161920)))

(declare-fun res!122312 () Bool)

(assert (=> d!60839 (=> (not res!122312) (not e!161920))))

(assert (=> d!60839 (= res!122312 ((_ is Cons!3629) Nil!3630))))

(assert (=> d!60839 (= (contains!1786 Nil!3630 (select (arr!5816 lt!124787) #b00000000000000000000000000000000)) lt!125101)))

(declare-fun b!249675 () Bool)

(declare-fun e!161921 () Bool)

(assert (=> b!249675 (= e!161920 e!161921)))

(declare-fun res!122313 () Bool)

(assert (=> b!249675 (=> res!122313 e!161921)))

(assert (=> b!249675 (= res!122313 (= (h!4287 Nil!3630) (select (arr!5816 lt!124787) #b00000000000000000000000000000000)))))

(declare-fun b!249676 () Bool)

(assert (=> b!249676 (= e!161921 (contains!1786 (t!8654 Nil!3630) (select (arr!5816 lt!124787) #b00000000000000000000000000000000)))))

(assert (= (and d!60839 res!122312) b!249675))

(assert (= (and b!249675 (not res!122313)) b!249676))

(declare-fun m!266363 () Bool)

(assert (=> d!60839 m!266363))

(assert (=> d!60839 m!265945))

(declare-fun m!266365 () Bool)

(assert (=> d!60839 m!266365))

(assert (=> b!249676 m!265945))

(declare-fun m!266367 () Bool)

(assert (=> b!249676 m!266367))

(assert (=> b!249256 d!60839))

(declare-fun d!60841 () Bool)

(declare-fun e!161922 () Bool)

(assert (=> d!60841 e!161922))

(declare-fun res!122314 () Bool)

(assert (=> d!60841 (=> res!122314 e!161922)))

(declare-fun lt!125105 () Bool)

(assert (=> d!60841 (= res!122314 (not lt!125105))))

(declare-fun lt!125103 () Bool)

(assert (=> d!60841 (= lt!125105 lt!125103)))

(declare-fun lt!125104 () Unit!7683)

(declare-fun e!161923 () Unit!7683)

(assert (=> d!60841 (= lt!125104 e!161923)))

(declare-fun c!41908 () Bool)

(assert (=> d!60841 (= c!41908 lt!125103)))

(assert (=> d!60841 (= lt!125103 (containsKey!288 (toList!1851 lt!124978) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60841 (= (contains!1784 lt!124978 #b1000000000000000000000000000000000000000000000000000000000000000) lt!125105)))

(declare-fun b!249677 () Bool)

(declare-fun lt!125102 () Unit!7683)

(assert (=> b!249677 (= e!161923 lt!125102)))

(assert (=> b!249677 (= lt!125102 (lemmaContainsKeyImpliesGetValueByKeyDefined!236 (toList!1851 lt!124978) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249677 (isDefined!237 (getValueByKey!297 (toList!1851 lt!124978) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249678 () Bool)

(declare-fun Unit!7700 () Unit!7683)

(assert (=> b!249678 (= e!161923 Unit!7700)))

(declare-fun b!249679 () Bool)

(assert (=> b!249679 (= e!161922 (isDefined!237 (getValueByKey!297 (toList!1851 lt!124978) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60841 c!41908) b!249677))

(assert (= (and d!60841 (not c!41908)) b!249678))

(assert (= (and d!60841 (not res!122314)) b!249679))

(declare-fun m!266369 () Bool)

(assert (=> d!60841 m!266369))

(declare-fun m!266371 () Bool)

(assert (=> b!249677 m!266371))

(assert (=> b!249677 m!266083))

(assert (=> b!249677 m!266083))

(declare-fun m!266373 () Bool)

(assert (=> b!249677 m!266373))

(assert (=> b!249679 m!266083))

(assert (=> b!249679 m!266083))

(assert (=> b!249679 m!266373))

(assert (=> bm!23401 d!60841))

(declare-fun b!249681 () Bool)

(declare-fun e!161924 () Bool)

(assert (=> b!249681 (= e!161924 tp_is_empty!6475)))

(declare-fun b!249680 () Bool)

(declare-fun e!161925 () Bool)

(assert (=> b!249680 (= e!161925 tp_is_empty!6475)))

(declare-fun mapNonEmpty!11007 () Bool)

(declare-fun mapRes!11007 () Bool)

(declare-fun tp!23112 () Bool)

(assert (=> mapNonEmpty!11007 (= mapRes!11007 (and tp!23112 e!161925))))

(declare-fun mapKey!11007 () (_ BitVec 32))

(declare-fun mapRest!11007 () (Array (_ BitVec 32) ValueCell!2894))

(declare-fun mapValue!11007 () ValueCell!2894)

(assert (=> mapNonEmpty!11007 (= mapRest!11006 (store mapRest!11007 mapKey!11007 mapValue!11007))))

(declare-fun condMapEmpty!11007 () Bool)

(declare-fun mapDefault!11007 () ValueCell!2894)

(assert (=> mapNonEmpty!11006 (= condMapEmpty!11007 (= mapRest!11006 ((as const (Array (_ BitVec 32) ValueCell!2894)) mapDefault!11007)))))

(assert (=> mapNonEmpty!11006 (= tp!23111 (and e!161924 mapRes!11007))))

(declare-fun mapIsEmpty!11007 () Bool)

(assert (=> mapIsEmpty!11007 mapRes!11007))

(assert (= (and mapNonEmpty!11006 condMapEmpty!11007) mapIsEmpty!11007))

(assert (= (and mapNonEmpty!11006 (not condMapEmpty!11007)) mapNonEmpty!11007))

(assert (= (and mapNonEmpty!11007 ((_ is ValueCellFull!2894) mapValue!11007)) b!249680))

(assert (= (and mapNonEmpty!11006 ((_ is ValueCellFull!2894) mapDefault!11007)) b!249681))

(declare-fun m!266375 () Bool)

(assert (=> mapNonEmpty!11007 m!266375))

(declare-fun b_lambda!8093 () Bool)

(assert (= b_lambda!8089 (or (and b!249099 b_free!6613) b_lambda!8093)))

(declare-fun b_lambda!8095 () Bool)

(assert (= b_lambda!8091 (or (and b!249099 b_free!6613) b_lambda!8095)))

(check-sat (not d!60771) (not b!249492) (not bm!23416) (not b!249623) (not b_lambda!8087) (not b!249470) (not d!60777) (not b!249642) (not b!249547) (not bm!23413) (not d!60839) (not b!249632) (not bm!23414) (not d!60727) (not mapNonEmpty!11007) (not b!249532) (not b_next!6613) (not b!249539) (not bm!23424) (not b!249481) (not d!60755) (not b!249676) (not b!249621) (not d!60781) (not bm!23422) (not b!249497) (not b!249479) (not b!249480) (not b!249552) (not d!60829) (not b!249490) (not d!60827) (not b!249668) (not b!249622) (not b!249619) (not b!249503) (not b!249535) (not bm!23417) (not b!249501) tp_is_empty!6475 (not b!249468) (not b!249627) (not b!249559) (not d!60835) (not b!249591) (not d!60757) (not b!249528) (not b!249551) (not b!249482) (not d!60783) (not bm!23412) (not bm!23425) (not b!249536) (not d!60733) (not bm!23415) (not d!60769) (not d!60841) (not b!249500) (not b!249495) b_and!13645 (not b_lambda!8093) (not d!60759) (not b!249471) (not d!60803) (not b!249534) (not d!60767) (not b!249488) (not d!60799) (not bm!23421) (not d!60773) (not b!249563) (not b!249626) (not b!249546) (not d!60775) (not d!60819) (not b!249679) (not b!249549) (not b!249592) (not d!60831) (not bm!23423) (not d!60779) (not b_lambda!8095) (not b!249499) (not b!249597) (not b!249561) (not b!249606) (not d!60765) (not b!249598) (not b!249548) (not bm!23418) (not d!60761) (not b!249677) (not b!249498) (not d!60785) (not b!249605) (not d!60837) (not d!60795) (not b!249590) (not d!60807) (not b!249472) (not d!60801) (not b!249441) (not d!60805) (not b!249483) (not d!60751) (not b!249646) (not b!249529) (not b!249604) (not d!60725) (not d!60793) (not d!60739) (not b!249533) (not d!60787) (not d!60791) (not d!60763) (not b!249649) (not b!249643))
(check-sat b_and!13645 (not b_next!6613))
