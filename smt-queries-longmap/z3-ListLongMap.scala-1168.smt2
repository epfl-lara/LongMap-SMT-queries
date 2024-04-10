; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24916 () Bool)

(assert start!24916)

(declare-fun b!260073 () Bool)

(declare-fun b_free!6759 () Bool)

(declare-fun b_next!6759 () Bool)

(assert (=> b!260073 (= b_free!6759 (not b_next!6759))))

(declare-fun tp!23600 () Bool)

(declare-fun b_and!13865 () Bool)

(assert (=> b!260073 (= tp!23600 b_and!13865)))

(declare-fun b!260060 () Bool)

(declare-datatypes ((Unit!8087 0))(
  ( (Unit!8088) )
))
(declare-fun e!168558 () Unit!8087)

(declare-fun Unit!8089 () Unit!8087)

(assert (=> b!260060 (= e!168558 Unit!8089)))

(declare-fun lt!131124 () Unit!8087)

(declare-datatypes ((V!8475 0))(
  ( (V!8476 (val!3355 Int)) )
))
(declare-datatypes ((ValueCell!2967 0))(
  ( (ValueCellFull!2967 (v!5468 V!8475)) (EmptyCell!2967) )
))
(declare-datatypes ((array!12595 0))(
  ( (array!12596 (arr!5962 (Array (_ BitVec 32) ValueCell!2967)) (size!6311 (_ BitVec 32))) )
))
(declare-datatypes ((array!12597 0))(
  ( (array!12598 (arr!5963 (Array (_ BitVec 32) (_ BitVec 64))) (size!6312 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3834 0))(
  ( (LongMapFixedSize!3835 (defaultEntry!4795 Int) (mask!11121 (_ BitVec 32)) (extraKeys!4532 (_ BitVec 32)) (zeroValue!4636 V!8475) (minValue!4636 V!8475) (_size!1966 (_ BitVec 32)) (_keys!6975 array!12597) (_values!4778 array!12595) (_vacant!1966 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3834)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!442 (array!12597 array!12595 (_ BitVec 32) (_ BitVec 32) V!8475 V!8475 (_ BitVec 64) Int) Unit!8087)

(assert (=> b!260060 (= lt!131124 (lemmaInListMapThenSeekEntryOrOpenFindsIt!442 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 (defaultEntry!4795 thiss!1504)))))

(assert (=> b!260060 false))

(declare-fun mapNonEmpty!11282 () Bool)

(declare-fun mapRes!11282 () Bool)

(declare-fun tp!23599 () Bool)

(declare-fun e!168559 () Bool)

(assert (=> mapNonEmpty!11282 (= mapRes!11282 (and tp!23599 e!168559))))

(declare-fun mapKey!11282 () (_ BitVec 32))

(declare-fun mapRest!11282 () (Array (_ BitVec 32) ValueCell!2967))

(declare-fun mapValue!11282 () ValueCell!2967)

(assert (=> mapNonEmpty!11282 (= (arr!5962 (_values!4778 thiss!1504)) (store mapRest!11282 mapKey!11282 mapValue!11282))))

(declare-fun b!260061 () Bool)

(declare-fun e!168547 () Bool)

(declare-fun e!168549 () Bool)

(assert (=> b!260061 (= e!168547 (and e!168549 mapRes!11282))))

(declare-fun condMapEmpty!11282 () Bool)

(declare-fun mapDefault!11282 () ValueCell!2967)

(assert (=> b!260061 (= condMapEmpty!11282 (= (arr!5962 (_values!4778 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2967)) mapDefault!11282)))))

(declare-fun b!260062 () Bool)

(declare-fun e!168553 () Bool)

(declare-fun call!24786 () Bool)

(assert (=> b!260062 (= e!168553 (not call!24786))))

(declare-fun b!260063 () Bool)

(declare-fun tp_is_empty!6621 () Bool)

(assert (=> b!260063 (= e!168559 tp_is_empty!6621)))

(declare-fun b!260064 () Bool)

(declare-fun c!44173 () Bool)

(declare-datatypes ((SeekEntryResult!1183 0))(
  ( (MissingZero!1183 (index!6902 (_ BitVec 32))) (Found!1183 (index!6903 (_ BitVec 32))) (Intermediate!1183 (undefined!1995 Bool) (index!6904 (_ BitVec 32)) (x!25121 (_ BitVec 32))) (Undefined!1183) (MissingVacant!1183 (index!6905 (_ BitVec 32))) )
))
(declare-fun lt!131134 () SeekEntryResult!1183)

(get-info :version)

(assert (=> b!260064 (= c!44173 ((_ is MissingVacant!1183) lt!131134))))

(declare-fun e!168546 () Bool)

(declare-fun e!168552 () Bool)

(assert (=> b!260064 (= e!168546 e!168552)))

(declare-fun b!260065 () Bool)

(declare-fun res!127118 () Bool)

(assert (=> b!260065 (= res!127118 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6905 lt!131134)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168548 () Bool)

(assert (=> b!260065 (=> (not res!127118) (not e!168548))))

(declare-fun b!260066 () Bool)

(declare-fun e!168551 () Unit!8087)

(declare-fun Unit!8090 () Unit!8087)

(assert (=> b!260066 (= e!168551 Unit!8090)))

(declare-fun call!24785 () Bool)

(declare-fun c!44171 () Bool)

(declare-fun bm!24782 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24782 (= call!24785 (inRange!0 (ite c!44171 (index!6902 lt!131134) (index!6905 lt!131134)) (mask!11121 thiss!1504)))))

(declare-fun b!260067 () Bool)

(declare-fun e!168550 () Bool)

(assert (=> b!260067 (= e!168550 (or (not (= (size!6311 (_values!4778 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11121 thiss!1504)))) (not (= (size!6312 (_keys!6975 thiss!1504)) (size!6311 (_values!4778 thiss!1504)))) (bvslt (mask!11121 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4532 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun res!127120 () Bool)

(declare-fun e!168556 () Bool)

(assert (=> start!24916 (=> (not res!127120) (not e!168556))))

(declare-fun valid!1497 (LongMapFixedSize!3834) Bool)

(assert (=> start!24916 (= res!127120 (valid!1497 thiss!1504))))

(assert (=> start!24916 e!168556))

(declare-fun e!168554 () Bool)

(assert (=> start!24916 e!168554))

(assert (=> start!24916 true))

(assert (=> start!24916 tp_is_empty!6621))

(declare-fun b!260059 () Bool)

(assert (=> b!260059 (= e!168548 (not call!24786))))

(declare-fun b!260068 () Bool)

(declare-fun e!168557 () Bool)

(assert (=> b!260068 (= e!168556 e!168557)))

(declare-fun res!127122 () Bool)

(assert (=> b!260068 (=> (not res!127122) (not e!168557))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!260068 (= res!127122 (or (= lt!131134 (MissingZero!1183 index!297)) (= lt!131134 (MissingVacant!1183 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12597 (_ BitVec 32)) SeekEntryResult!1183)

(assert (=> b!260068 (= lt!131134 (seekEntryOrOpen!0 key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(declare-fun b!260069 () Bool)

(declare-fun res!127117 () Bool)

(assert (=> b!260069 (=> (not res!127117) (not e!168556))))

(assert (=> b!260069 (= res!127117 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260070 () Bool)

(declare-fun e!168555 () Bool)

(assert (=> b!260070 (= e!168555 (not e!168550))))

(declare-fun res!127116 () Bool)

(assert (=> b!260070 (=> res!127116 e!168550)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!260070 (= res!127116 (not (validMask!0 (mask!11121 thiss!1504))))))

(declare-fun lt!131133 () array!12597)

(declare-fun arrayCountValidKeys!0 (array!12597 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!260070 (= (arrayCountValidKeys!0 lt!131133 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!131132 () Unit!8087)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12597 (_ BitVec 32)) Unit!8087)

(assert (=> b!260070 (= lt!131132 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131133 index!297))))

(declare-fun arrayContainsKey!0 (array!12597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!260070 (arrayContainsKey!0 lt!131133 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131127 () Unit!8087)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12597 (_ BitVec 64) (_ BitVec 32)) Unit!8087)

(assert (=> b!260070 (= lt!131127 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131133 key!932 index!297))))

(declare-datatypes ((tuple2!4948 0))(
  ( (tuple2!4949 (_1!2485 (_ BitVec 64)) (_2!2485 V!8475)) )
))
(declare-datatypes ((List!3826 0))(
  ( (Nil!3823) (Cons!3822 (h!4486 tuple2!4948) (t!8895 List!3826)) )
))
(declare-datatypes ((ListLongMap!3861 0))(
  ( (ListLongMap!3862 (toList!1946 List!3826)) )
))
(declare-fun lt!131126 () ListLongMap!3861)

(declare-fun v!346 () V!8475)

(declare-fun +!699 (ListLongMap!3861 tuple2!4948) ListLongMap!3861)

(declare-fun getCurrentListMap!1474 (array!12597 array!12595 (_ BitVec 32) (_ BitVec 32) V!8475 V!8475 (_ BitVec 32) Int) ListLongMap!3861)

(assert (=> b!260070 (= (+!699 lt!131126 (tuple2!4949 key!932 v!346)) (getCurrentListMap!1474 lt!131133 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131125 () Unit!8087)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!109 (array!12597 array!12595 (_ BitVec 32) (_ BitVec 32) V!8475 V!8475 (_ BitVec 32) (_ BitVec 64) V!8475 Int) Unit!8087)

(assert (=> b!260070 (= lt!131125 (lemmaAddValidKeyToArrayThenAddPairToListMap!109 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) index!297 key!932 v!346 (defaultEntry!4795 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12597 (_ BitVec 32)) Bool)

(assert (=> b!260070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131133 (mask!11121 thiss!1504))))

(declare-fun lt!131123 () Unit!8087)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12597 (_ BitVec 32) (_ BitVec 32)) Unit!8087)

(assert (=> b!260070 (= lt!131123 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6975 thiss!1504) index!297 (mask!11121 thiss!1504)))))

(assert (=> b!260070 (= (arrayCountValidKeys!0 lt!131133 #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6975 thiss!1504) #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504)))))))

(declare-fun lt!131122 () Unit!8087)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12597 (_ BitVec 32) (_ BitVec 64)) Unit!8087)

(assert (=> b!260070 (= lt!131122 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6975 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3827 0))(
  ( (Nil!3824) (Cons!3823 (h!4487 (_ BitVec 64)) (t!8896 List!3827)) )
))
(declare-fun arrayNoDuplicates!0 (array!12597 (_ BitVec 32) List!3827) Bool)

(assert (=> b!260070 (arrayNoDuplicates!0 lt!131133 #b00000000000000000000000000000000 Nil!3824)))

(assert (=> b!260070 (= lt!131133 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun lt!131129 () Unit!8087)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12597 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3827) Unit!8087)

(assert (=> b!260070 (= lt!131129 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6975 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3824))))

(declare-fun lt!131131 () Unit!8087)

(assert (=> b!260070 (= lt!131131 e!168551)))

(declare-fun c!44172 () Bool)

(assert (=> b!260070 (= c!44172 (arrayContainsKey!0 (_keys!6975 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260071 () Bool)

(assert (=> b!260071 (= e!168552 ((_ is Undefined!1183) lt!131134))))

(declare-fun b!260072 () Bool)

(assert (=> b!260072 (= e!168549 tp_is_empty!6621)))

(declare-fun mapIsEmpty!11282 () Bool)

(assert (=> mapIsEmpty!11282 mapRes!11282))

(declare-fun array_inv!3939 (array!12597) Bool)

(declare-fun array_inv!3940 (array!12595) Bool)

(assert (=> b!260073 (= e!168554 (and tp!23600 tp_is_empty!6621 (array_inv!3939 (_keys!6975 thiss!1504)) (array_inv!3940 (_values!4778 thiss!1504)) e!168547))))

(declare-fun b!260074 () Bool)

(declare-fun Unit!8091 () Unit!8087)

(assert (=> b!260074 (= e!168551 Unit!8091)))

(declare-fun lt!131128 () Unit!8087)

(declare-fun lemmaArrayContainsKeyThenInListMap!251 (array!12597 array!12595 (_ BitVec 32) (_ BitVec 32) V!8475 V!8475 (_ BitVec 64) (_ BitVec 32) Int) Unit!8087)

(assert (=> b!260074 (= lt!131128 (lemmaArrayContainsKeyThenInListMap!251 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(assert (=> b!260074 false))

(declare-fun b!260075 () Bool)

(declare-fun lt!131121 () Unit!8087)

(assert (=> b!260075 (= e!168558 lt!131121)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!445 (array!12597 array!12595 (_ BitVec 32) (_ BitVec 32) V!8475 V!8475 (_ BitVec 64) Int) Unit!8087)

(assert (=> b!260075 (= lt!131121 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!445 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 (defaultEntry!4795 thiss!1504)))))

(assert (=> b!260075 (= c!44171 ((_ is MissingZero!1183) lt!131134))))

(assert (=> b!260075 e!168546))

(declare-fun b!260076 () Bool)

(declare-fun res!127119 () Bool)

(assert (=> b!260076 (=> (not res!127119) (not e!168553))))

(assert (=> b!260076 (= res!127119 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6902 lt!131134)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260077 () Bool)

(assert (=> b!260077 (= e!168552 e!168548)))

(declare-fun res!127123 () Bool)

(assert (=> b!260077 (= res!127123 call!24785)))

(assert (=> b!260077 (=> (not res!127123) (not e!168548))))

(declare-fun b!260078 () Bool)

(declare-fun res!127121 () Bool)

(assert (=> b!260078 (=> (not res!127121) (not e!168553))))

(assert (=> b!260078 (= res!127121 call!24785)))

(assert (=> b!260078 (= e!168546 e!168553)))

(declare-fun bm!24783 () Bool)

(assert (=> bm!24783 (= call!24786 (arrayContainsKey!0 (_keys!6975 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260079 () Bool)

(assert (=> b!260079 (= e!168557 e!168555)))

(declare-fun res!127115 () Bool)

(assert (=> b!260079 (=> (not res!127115) (not e!168555))))

(assert (=> b!260079 (= res!127115 (inRange!0 index!297 (mask!11121 thiss!1504)))))

(declare-fun lt!131130 () Unit!8087)

(assert (=> b!260079 (= lt!131130 e!168558)))

(declare-fun c!44174 () Bool)

(declare-fun contains!1891 (ListLongMap!3861 (_ BitVec 64)) Bool)

(assert (=> b!260079 (= c!44174 (contains!1891 lt!131126 key!932))))

(assert (=> b!260079 (= lt!131126 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(assert (= (and start!24916 res!127120) b!260069))

(assert (= (and b!260069 res!127117) b!260068))

(assert (= (and b!260068 res!127122) b!260079))

(assert (= (and b!260079 c!44174) b!260060))

(assert (= (and b!260079 (not c!44174)) b!260075))

(assert (= (and b!260075 c!44171) b!260078))

(assert (= (and b!260075 (not c!44171)) b!260064))

(assert (= (and b!260078 res!127121) b!260076))

(assert (= (and b!260076 res!127119) b!260062))

(assert (= (and b!260064 c!44173) b!260077))

(assert (= (and b!260064 (not c!44173)) b!260071))

(assert (= (and b!260077 res!127123) b!260065))

(assert (= (and b!260065 res!127118) b!260059))

(assert (= (or b!260078 b!260077) bm!24782))

(assert (= (or b!260062 b!260059) bm!24783))

(assert (= (and b!260079 res!127115) b!260070))

(assert (= (and b!260070 c!44172) b!260074))

(assert (= (and b!260070 (not c!44172)) b!260066))

(assert (= (and b!260070 (not res!127116)) b!260067))

(assert (= (and b!260061 condMapEmpty!11282) mapIsEmpty!11282))

(assert (= (and b!260061 (not condMapEmpty!11282)) mapNonEmpty!11282))

(assert (= (and mapNonEmpty!11282 ((_ is ValueCellFull!2967) mapValue!11282)) b!260063))

(assert (= (and b!260061 ((_ is ValueCellFull!2967) mapDefault!11282)) b!260072))

(assert (= b!260073 b!260061))

(assert (= start!24916 b!260073))

(declare-fun m!275745 () Bool)

(assert (=> b!260068 m!275745))

(declare-fun m!275747 () Bool)

(assert (=> b!260073 m!275747))

(declare-fun m!275749 () Bool)

(assert (=> b!260073 m!275749))

(declare-fun m!275751 () Bool)

(assert (=> start!24916 m!275751))

(declare-fun m!275753 () Bool)

(assert (=> b!260074 m!275753))

(declare-fun m!275755 () Bool)

(assert (=> b!260075 m!275755))

(declare-fun m!275757 () Bool)

(assert (=> bm!24782 m!275757))

(declare-fun m!275759 () Bool)

(assert (=> bm!24783 m!275759))

(declare-fun m!275761 () Bool)

(assert (=> b!260060 m!275761))

(declare-fun m!275763 () Bool)

(assert (=> b!260079 m!275763))

(declare-fun m!275765 () Bool)

(assert (=> b!260079 m!275765))

(declare-fun m!275767 () Bool)

(assert (=> b!260079 m!275767))

(declare-fun m!275769 () Bool)

(assert (=> b!260065 m!275769))

(declare-fun m!275771 () Bool)

(assert (=> b!260076 m!275771))

(declare-fun m!275773 () Bool)

(assert (=> mapNonEmpty!11282 m!275773))

(declare-fun m!275775 () Bool)

(assert (=> b!260070 m!275775))

(assert (=> b!260070 m!275759))

(declare-fun m!275777 () Bool)

(assert (=> b!260070 m!275777))

(declare-fun m!275779 () Bool)

(assert (=> b!260070 m!275779))

(declare-fun m!275781 () Bool)

(assert (=> b!260070 m!275781))

(declare-fun m!275783 () Bool)

(assert (=> b!260070 m!275783))

(declare-fun m!275785 () Bool)

(assert (=> b!260070 m!275785))

(declare-fun m!275787 () Bool)

(assert (=> b!260070 m!275787))

(declare-fun m!275789 () Bool)

(assert (=> b!260070 m!275789))

(declare-fun m!275791 () Bool)

(assert (=> b!260070 m!275791))

(declare-fun m!275793 () Bool)

(assert (=> b!260070 m!275793))

(declare-fun m!275795 () Bool)

(assert (=> b!260070 m!275795))

(declare-fun m!275797 () Bool)

(assert (=> b!260070 m!275797))

(declare-fun m!275799 () Bool)

(assert (=> b!260070 m!275799))

(declare-fun m!275801 () Bool)

(assert (=> b!260070 m!275801))

(declare-fun m!275803 () Bool)

(assert (=> b!260070 m!275803))

(declare-fun m!275805 () Bool)

(assert (=> b!260070 m!275805))

(declare-fun m!275807 () Bool)

(assert (=> b!260070 m!275807))

(check-sat (not b!260075) (not bm!24783) (not mapNonEmpty!11282) (not b!260068) (not b!260060) (not b!260074) tp_is_empty!6621 (not b!260079) (not b_next!6759) (not b!260070) b_and!13865 (not b!260073) (not start!24916) (not bm!24782))
(check-sat b_and!13865 (not b_next!6759))
(get-model)

(declare-fun d!62447 () Bool)

(assert (=> d!62447 (= (array_inv!3939 (_keys!6975 thiss!1504)) (bvsge (size!6312 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260073 d!62447))

(declare-fun d!62449 () Bool)

(assert (=> d!62449 (= (array_inv!3940 (_values!4778 thiss!1504)) (bvsge (size!6311 (_values!4778 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260073 d!62449))

(declare-fun d!62451 () Bool)

(declare-fun e!168607 () Bool)

(assert (=> d!62451 e!168607))

(declare-fun res!127156 () Bool)

(assert (=> d!62451 (=> (not res!127156) (not e!168607))))

(declare-fun lt!131181 () SeekEntryResult!1183)

(assert (=> d!62451 (= res!127156 ((_ is Found!1183) lt!131181))))

(assert (=> d!62451 (= lt!131181 (seekEntryOrOpen!0 key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(declare-fun lt!131182 () Unit!8087)

(declare-fun choose!1264 (array!12597 array!12595 (_ BitVec 32) (_ BitVec 32) V!8475 V!8475 (_ BitVec 64) Int) Unit!8087)

(assert (=> d!62451 (= lt!131182 (choose!1264 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 (defaultEntry!4795 thiss!1504)))))

(assert (=> d!62451 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62451 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!442 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 (defaultEntry!4795 thiss!1504)) lt!131182)))

(declare-fun b!260147 () Bool)

(declare-fun res!127155 () Bool)

(assert (=> b!260147 (=> (not res!127155) (not e!168607))))

(assert (=> b!260147 (= res!127155 (inRange!0 (index!6903 lt!131181) (mask!11121 thiss!1504)))))

(declare-fun b!260148 () Bool)

(assert (=> b!260148 (= e!168607 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6903 lt!131181)) key!932))))

(assert (=> b!260148 (and (bvsge (index!6903 lt!131181) #b00000000000000000000000000000000) (bvslt (index!6903 lt!131181) (size!6312 (_keys!6975 thiss!1504))))))

(assert (= (and d!62451 res!127156) b!260147))

(assert (= (and b!260147 res!127155) b!260148))

(assert (=> d!62451 m!275745))

(declare-fun m!275873 () Bool)

(assert (=> d!62451 m!275873))

(assert (=> d!62451 m!275775))

(declare-fun m!275875 () Bool)

(assert (=> b!260147 m!275875))

(declare-fun m!275877 () Bool)

(assert (=> b!260148 m!275877))

(assert (=> b!260060 d!62451))

(declare-fun b!260161 () Bool)

(declare-fun e!168616 () SeekEntryResult!1183)

(declare-fun lt!131191 () SeekEntryResult!1183)

(assert (=> b!260161 (= e!168616 (Found!1183 (index!6904 lt!131191)))))

(declare-fun b!260162 () Bool)

(declare-fun e!168614 () SeekEntryResult!1183)

(assert (=> b!260162 (= e!168614 e!168616)))

(declare-fun lt!131190 () (_ BitVec 64))

(assert (=> b!260162 (= lt!131190 (select (arr!5963 (_keys!6975 thiss!1504)) (index!6904 lt!131191)))))

(declare-fun c!44193 () Bool)

(assert (=> b!260162 (= c!44193 (= lt!131190 key!932))))

(declare-fun b!260163 () Bool)

(declare-fun c!44195 () Bool)

(assert (=> b!260163 (= c!44195 (= lt!131190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168615 () SeekEntryResult!1183)

(assert (=> b!260163 (= e!168616 e!168615)))

(declare-fun b!260164 () Bool)

(assert (=> b!260164 (= e!168614 Undefined!1183)))

(declare-fun b!260165 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12597 (_ BitVec 32)) SeekEntryResult!1183)

(assert (=> b!260165 (= e!168615 (seekKeyOrZeroReturnVacant!0 (x!25121 lt!131191) (index!6904 lt!131191) (index!6904 lt!131191) key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(declare-fun b!260166 () Bool)

(assert (=> b!260166 (= e!168615 (MissingZero!1183 (index!6904 lt!131191)))))

(declare-fun d!62453 () Bool)

(declare-fun lt!131189 () SeekEntryResult!1183)

(assert (=> d!62453 (and (or ((_ is Undefined!1183) lt!131189) (not ((_ is Found!1183) lt!131189)) (and (bvsge (index!6903 lt!131189) #b00000000000000000000000000000000) (bvslt (index!6903 lt!131189) (size!6312 (_keys!6975 thiss!1504))))) (or ((_ is Undefined!1183) lt!131189) ((_ is Found!1183) lt!131189) (not ((_ is MissingZero!1183) lt!131189)) (and (bvsge (index!6902 lt!131189) #b00000000000000000000000000000000) (bvslt (index!6902 lt!131189) (size!6312 (_keys!6975 thiss!1504))))) (or ((_ is Undefined!1183) lt!131189) ((_ is Found!1183) lt!131189) ((_ is MissingZero!1183) lt!131189) (not ((_ is MissingVacant!1183) lt!131189)) (and (bvsge (index!6905 lt!131189) #b00000000000000000000000000000000) (bvslt (index!6905 lt!131189) (size!6312 (_keys!6975 thiss!1504))))) (or ((_ is Undefined!1183) lt!131189) (ite ((_ is Found!1183) lt!131189) (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6903 lt!131189)) key!932) (ite ((_ is MissingZero!1183) lt!131189) (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6902 lt!131189)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1183) lt!131189) (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6905 lt!131189)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62453 (= lt!131189 e!168614)))

(declare-fun c!44194 () Bool)

(assert (=> d!62453 (= c!44194 (and ((_ is Intermediate!1183) lt!131191) (undefined!1995 lt!131191)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12597 (_ BitVec 32)) SeekEntryResult!1183)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62453 (= lt!131191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11121 thiss!1504)) key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(assert (=> d!62453 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62453 (= (seekEntryOrOpen!0 key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)) lt!131189)))

(assert (= (and d!62453 c!44194) b!260164))

(assert (= (and d!62453 (not c!44194)) b!260162))

(assert (= (and b!260162 c!44193) b!260161))

(assert (= (and b!260162 (not c!44193)) b!260163))

(assert (= (and b!260163 c!44195) b!260166))

(assert (= (and b!260163 (not c!44195)) b!260165))

(declare-fun m!275879 () Bool)

(assert (=> b!260162 m!275879))

(declare-fun m!275881 () Bool)

(assert (=> b!260165 m!275881))

(declare-fun m!275883 () Bool)

(assert (=> d!62453 m!275883))

(assert (=> d!62453 m!275775))

(declare-fun m!275885 () Bool)

(assert (=> d!62453 m!275885))

(declare-fun m!275887 () Bool)

(assert (=> d!62453 m!275887))

(declare-fun m!275889 () Bool)

(assert (=> d!62453 m!275889))

(assert (=> d!62453 m!275883))

(declare-fun m!275891 () Bool)

(assert (=> d!62453 m!275891))

(assert (=> b!260068 d!62453))

(declare-fun d!62455 () Bool)

(assert (=> d!62455 (contains!1891 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) key!932)))

(declare-fun lt!131194 () Unit!8087)

(declare-fun choose!1265 (array!12597 array!12595 (_ BitVec 32) (_ BitVec 32) V!8475 V!8475 (_ BitVec 64) (_ BitVec 32) Int) Unit!8087)

(assert (=> d!62455 (= lt!131194 (choose!1265 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(assert (=> d!62455 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62455 (= (lemmaArrayContainsKeyThenInListMap!251 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) lt!131194)))

(declare-fun bs!9163 () Bool)

(assert (= bs!9163 d!62455))

(assert (=> bs!9163 m!275767))

(assert (=> bs!9163 m!275767))

(declare-fun m!275893 () Bool)

(assert (=> bs!9163 m!275893))

(declare-fun m!275895 () Bool)

(assert (=> bs!9163 m!275895))

(assert (=> bs!9163 m!275775))

(assert (=> b!260074 d!62455))

(declare-fun d!62457 () Bool)

(assert (=> d!62457 (= (arrayCountValidKeys!0 lt!131133 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!131197 () Unit!8087)

(declare-fun choose!2 (array!12597 (_ BitVec 32)) Unit!8087)

(assert (=> d!62457 (= lt!131197 (choose!2 lt!131133 index!297))))

(declare-fun e!168619 () Bool)

(assert (=> d!62457 e!168619))

(declare-fun res!127161 () Bool)

(assert (=> d!62457 (=> (not res!127161) (not e!168619))))

(assert (=> d!62457 (= res!127161 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6312 lt!131133))))))

(assert (=> d!62457 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131133 index!297) lt!131197)))

(declare-fun b!260171 () Bool)

(declare-fun res!127162 () Bool)

(assert (=> b!260171 (=> (not res!127162) (not e!168619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!260171 (= res!127162 (validKeyInArray!0 (select (arr!5963 lt!131133) index!297)))))

(declare-fun b!260172 () Bool)

(assert (=> b!260172 (= e!168619 (bvslt (size!6312 lt!131133) #b01111111111111111111111111111111))))

(assert (= (and d!62457 res!127161) b!260171))

(assert (= (and b!260171 res!127162) b!260172))

(declare-fun m!275897 () Bool)

(assert (=> d!62457 m!275897))

(declare-fun m!275899 () Bool)

(assert (=> d!62457 m!275899))

(declare-fun m!275901 () Bool)

(assert (=> b!260171 m!275901))

(assert (=> b!260171 m!275901))

(declare-fun m!275903 () Bool)

(assert (=> b!260171 m!275903))

(assert (=> b!260070 d!62457))

(declare-fun d!62459 () Bool)

(assert (=> d!62459 (arrayContainsKey!0 lt!131133 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131200 () Unit!8087)

(declare-fun choose!13 (array!12597 (_ BitVec 64) (_ BitVec 32)) Unit!8087)

(assert (=> d!62459 (= lt!131200 (choose!13 lt!131133 key!932 index!297))))

(assert (=> d!62459 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62459 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131133 key!932 index!297) lt!131200)))

(declare-fun bs!9164 () Bool)

(assert (= bs!9164 d!62459))

(assert (=> bs!9164 m!275801))

(declare-fun m!275905 () Bool)

(assert (=> bs!9164 m!275905))

(assert (=> b!260070 d!62459))

(declare-fun b!260181 () Bool)

(declare-fun e!168627 () Bool)

(declare-fun call!24795 () Bool)

(assert (=> b!260181 (= e!168627 call!24795)))

(declare-fun d!62461 () Bool)

(declare-fun res!127167 () Bool)

(declare-fun e!168626 () Bool)

(assert (=> d!62461 (=> res!127167 e!168626)))

(assert (=> d!62461 (= res!127167 (bvsge #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(assert (=> d!62461 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131133 (mask!11121 thiss!1504)) e!168626)))

(declare-fun bm!24792 () Bool)

(assert (=> bm!24792 (= call!24795 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!131133 (mask!11121 thiss!1504)))))

(declare-fun b!260182 () Bool)

(declare-fun e!168628 () Bool)

(assert (=> b!260182 (= e!168628 call!24795)))

(declare-fun b!260183 () Bool)

(assert (=> b!260183 (= e!168627 e!168628)))

(declare-fun lt!131207 () (_ BitVec 64))

(assert (=> b!260183 (= lt!131207 (select (arr!5963 lt!131133) #b00000000000000000000000000000000))))

(declare-fun lt!131209 () Unit!8087)

(assert (=> b!260183 (= lt!131209 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131133 lt!131207 #b00000000000000000000000000000000))))

(assert (=> b!260183 (arrayContainsKey!0 lt!131133 lt!131207 #b00000000000000000000000000000000)))

(declare-fun lt!131208 () Unit!8087)

(assert (=> b!260183 (= lt!131208 lt!131209)))

(declare-fun res!127168 () Bool)

(assert (=> b!260183 (= res!127168 (= (seekEntryOrOpen!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000) lt!131133 (mask!11121 thiss!1504)) (Found!1183 #b00000000000000000000000000000000)))))

(assert (=> b!260183 (=> (not res!127168) (not e!168628))))

(declare-fun b!260184 () Bool)

(assert (=> b!260184 (= e!168626 e!168627)))

(declare-fun c!44198 () Bool)

(assert (=> b!260184 (= c!44198 (validKeyInArray!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(assert (= (and d!62461 (not res!127167)) b!260184))

(assert (= (and b!260184 c!44198) b!260183))

(assert (= (and b!260184 (not c!44198)) b!260181))

(assert (= (and b!260183 res!127168) b!260182))

(assert (= (or b!260182 b!260181) bm!24792))

(declare-fun m!275907 () Bool)

(assert (=> bm!24792 m!275907))

(declare-fun m!275909 () Bool)

(assert (=> b!260183 m!275909))

(declare-fun m!275911 () Bool)

(assert (=> b!260183 m!275911))

(declare-fun m!275913 () Bool)

(assert (=> b!260183 m!275913))

(assert (=> b!260183 m!275909))

(declare-fun m!275915 () Bool)

(assert (=> b!260183 m!275915))

(assert (=> b!260184 m!275909))

(assert (=> b!260184 m!275909))

(declare-fun m!275917 () Bool)

(assert (=> b!260184 m!275917))

(assert (=> b!260070 d!62461))

(declare-fun b!260193 () Bool)

(declare-fun e!168634 () (_ BitVec 32))

(declare-fun call!24798 () (_ BitVec 32))

(assert (=> b!260193 (= e!168634 (bvadd #b00000000000000000000000000000001 call!24798))))

(declare-fun bm!24795 () Bool)

(assert (=> bm!24795 (= call!24798 (arrayCountValidKeys!0 (_keys!6975 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260194 () Bool)

(declare-fun e!168633 () (_ BitVec 32))

(assert (=> b!260194 (= e!168633 #b00000000000000000000000000000000)))

(declare-fun d!62463 () Bool)

(declare-fun lt!131212 () (_ BitVec 32))

(assert (=> d!62463 (and (bvsge lt!131212 #b00000000000000000000000000000000) (bvsle lt!131212 (bvsub (size!6312 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62463 (= lt!131212 e!168633)))

(declare-fun c!44203 () Bool)

(assert (=> d!62463 (= c!44203 (bvsge #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> d!62463 (and (bvsle #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6312 (_keys!6975 thiss!1504)) (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> d!62463 (= (arrayCountValidKeys!0 (_keys!6975 thiss!1504) #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) lt!131212)))

(declare-fun b!260195 () Bool)

(assert (=> b!260195 (= e!168634 call!24798)))

(declare-fun b!260196 () Bool)

(assert (=> b!260196 (= e!168633 e!168634)))

(declare-fun c!44204 () Bool)

(assert (=> b!260196 (= c!44204 (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!62463 c!44203) b!260194))

(assert (= (and d!62463 (not c!44203)) b!260196))

(assert (= (and b!260196 c!44204) b!260193))

(assert (= (and b!260196 (not c!44204)) b!260195))

(assert (= (or b!260193 b!260195) bm!24795))

(declare-fun m!275919 () Bool)

(assert (=> bm!24795 m!275919))

(declare-fun m!275921 () Bool)

(assert (=> b!260196 m!275921))

(assert (=> b!260196 m!275921))

(declare-fun m!275923 () Bool)

(assert (=> b!260196 m!275923))

(assert (=> b!260070 d!62463))

(declare-fun d!62465 () Bool)

(declare-fun e!168637 () Bool)

(assert (=> d!62465 e!168637))

(declare-fun res!127171 () Bool)

(assert (=> d!62465 (=> (not res!127171) (not e!168637))))

(assert (=> d!62465 (= res!127171 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6312 (_keys!6975 thiss!1504))) (bvslt index!297 (size!6311 (_values!4778 thiss!1504)))))))

(declare-fun lt!131215 () Unit!8087)

(declare-fun choose!1266 (array!12597 array!12595 (_ BitVec 32) (_ BitVec 32) V!8475 V!8475 (_ BitVec 32) (_ BitVec 64) V!8475 Int) Unit!8087)

(assert (=> d!62465 (= lt!131215 (choose!1266 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) index!297 key!932 v!346 (defaultEntry!4795 thiss!1504)))))

(assert (=> d!62465 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62465 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!109 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) index!297 key!932 v!346 (defaultEntry!4795 thiss!1504)) lt!131215)))

(declare-fun b!260199 () Bool)

(assert (=> b!260199 (= e!168637 (= (+!699 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) (tuple2!4949 key!932 v!346)) (getCurrentListMap!1474 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504))))))

(assert (= (and d!62465 res!127171) b!260199))

(declare-fun m!275925 () Bool)

(assert (=> d!62465 m!275925))

(assert (=> d!62465 m!275775))

(assert (=> b!260199 m!275767))

(declare-fun m!275927 () Bool)

(assert (=> b!260199 m!275927))

(assert (=> b!260199 m!275805))

(declare-fun m!275929 () Bool)

(assert (=> b!260199 m!275929))

(assert (=> b!260199 m!275767))

(assert (=> b!260199 m!275781))

(assert (=> b!260070 d!62465))

(declare-fun d!62467 () Bool)

(assert (=> d!62467 (= (validMask!0 (mask!11121 thiss!1504)) (and (or (= (mask!11121 thiss!1504) #b00000000000000000000000000000111) (= (mask!11121 thiss!1504) #b00000000000000000000000000001111) (= (mask!11121 thiss!1504) #b00000000000000000000000000011111) (= (mask!11121 thiss!1504) #b00000000000000000000000000111111) (= (mask!11121 thiss!1504) #b00000000000000000000000001111111) (= (mask!11121 thiss!1504) #b00000000000000000000000011111111) (= (mask!11121 thiss!1504) #b00000000000000000000000111111111) (= (mask!11121 thiss!1504) #b00000000000000000000001111111111) (= (mask!11121 thiss!1504) #b00000000000000000000011111111111) (= (mask!11121 thiss!1504) #b00000000000000000000111111111111) (= (mask!11121 thiss!1504) #b00000000000000000001111111111111) (= (mask!11121 thiss!1504) #b00000000000000000011111111111111) (= (mask!11121 thiss!1504) #b00000000000000000111111111111111) (= (mask!11121 thiss!1504) #b00000000000000001111111111111111) (= (mask!11121 thiss!1504) #b00000000000000011111111111111111) (= (mask!11121 thiss!1504) #b00000000000000111111111111111111) (= (mask!11121 thiss!1504) #b00000000000001111111111111111111) (= (mask!11121 thiss!1504) #b00000000000011111111111111111111) (= (mask!11121 thiss!1504) #b00000000000111111111111111111111) (= (mask!11121 thiss!1504) #b00000000001111111111111111111111) (= (mask!11121 thiss!1504) #b00000000011111111111111111111111) (= (mask!11121 thiss!1504) #b00000000111111111111111111111111) (= (mask!11121 thiss!1504) #b00000001111111111111111111111111) (= (mask!11121 thiss!1504) #b00000011111111111111111111111111) (= (mask!11121 thiss!1504) #b00000111111111111111111111111111) (= (mask!11121 thiss!1504) #b00001111111111111111111111111111) (= (mask!11121 thiss!1504) #b00011111111111111111111111111111) (= (mask!11121 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11121 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!260070 d!62467))

(declare-fun b!260200 () Bool)

(declare-fun e!168639 () (_ BitVec 32))

(declare-fun call!24799 () (_ BitVec 32))

(assert (=> b!260200 (= e!168639 (bvadd #b00000000000000000000000000000001 call!24799))))

(declare-fun bm!24796 () Bool)

(assert (=> bm!24796 (= call!24799 (arrayCountValidKeys!0 lt!131133 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!260201 () Bool)

(declare-fun e!168638 () (_ BitVec 32))

(assert (=> b!260201 (= e!168638 #b00000000000000000000000000000000)))

(declare-fun d!62469 () Bool)

(declare-fun lt!131216 () (_ BitVec 32))

(assert (=> d!62469 (and (bvsge lt!131216 #b00000000000000000000000000000000) (bvsle lt!131216 (bvsub (size!6312 lt!131133) index!297)))))

(assert (=> d!62469 (= lt!131216 e!168638)))

(declare-fun c!44205 () Bool)

(assert (=> d!62469 (= c!44205 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62469 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6312 lt!131133)))))

(assert (=> d!62469 (= (arrayCountValidKeys!0 lt!131133 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!131216)))

(declare-fun b!260202 () Bool)

(assert (=> b!260202 (= e!168639 call!24799)))

(declare-fun b!260203 () Bool)

(assert (=> b!260203 (= e!168638 e!168639)))

(declare-fun c!44206 () Bool)

(assert (=> b!260203 (= c!44206 (validKeyInArray!0 (select (arr!5963 lt!131133) index!297)))))

(assert (= (and d!62469 c!44205) b!260201))

(assert (= (and d!62469 (not c!44205)) b!260203))

(assert (= (and b!260203 c!44206) b!260200))

(assert (= (and b!260203 (not c!44206)) b!260202))

(assert (= (or b!260200 b!260202) bm!24796))

(declare-fun m!275931 () Bool)

(assert (=> bm!24796 m!275931))

(assert (=> b!260203 m!275901))

(assert (=> b!260203 m!275901))

(assert (=> b!260203 m!275903))

(assert (=> b!260070 d!62469))

(declare-fun b!260214 () Bool)

(declare-fun e!168649 () Bool)

(declare-fun contains!1892 (List!3827 (_ BitVec 64)) Bool)

(assert (=> b!260214 (= e!168649 (contains!1892 Nil!3824 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(declare-fun b!260215 () Bool)

(declare-fun e!168650 () Bool)

(declare-fun call!24802 () Bool)

(assert (=> b!260215 (= e!168650 call!24802)))

(declare-fun bm!24799 () Bool)

(declare-fun c!44209 () Bool)

(assert (=> bm!24799 (= call!24802 (arrayNoDuplicates!0 lt!131133 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44209 (Cons!3823 (select (arr!5963 lt!131133) #b00000000000000000000000000000000) Nil!3824) Nil!3824)))))

(declare-fun b!260216 () Bool)

(assert (=> b!260216 (= e!168650 call!24802)))

(declare-fun b!260217 () Bool)

(declare-fun e!168651 () Bool)

(declare-fun e!168648 () Bool)

(assert (=> b!260217 (= e!168651 e!168648)))

(declare-fun res!127180 () Bool)

(assert (=> b!260217 (=> (not res!127180) (not e!168648))))

(assert (=> b!260217 (= res!127180 (not e!168649))))

(declare-fun res!127179 () Bool)

(assert (=> b!260217 (=> (not res!127179) (not e!168649))))

(assert (=> b!260217 (= res!127179 (validKeyInArray!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(declare-fun b!260218 () Bool)

(assert (=> b!260218 (= e!168648 e!168650)))

(assert (=> b!260218 (= c!44209 (validKeyInArray!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(declare-fun d!62471 () Bool)

(declare-fun res!127178 () Bool)

(assert (=> d!62471 (=> res!127178 e!168651)))

(assert (=> d!62471 (= res!127178 (bvsge #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(assert (=> d!62471 (= (arrayNoDuplicates!0 lt!131133 #b00000000000000000000000000000000 Nil!3824) e!168651)))

(assert (= (and d!62471 (not res!127178)) b!260217))

(assert (= (and b!260217 res!127179) b!260214))

(assert (= (and b!260217 res!127180) b!260218))

(assert (= (and b!260218 c!44209) b!260215))

(assert (= (and b!260218 (not c!44209)) b!260216))

(assert (= (or b!260215 b!260216) bm!24799))

(assert (=> b!260214 m!275909))

(assert (=> b!260214 m!275909))

(declare-fun m!275933 () Bool)

(assert (=> b!260214 m!275933))

(assert (=> bm!24799 m!275909))

(declare-fun m!275935 () Bool)

(assert (=> bm!24799 m!275935))

(assert (=> b!260217 m!275909))

(assert (=> b!260217 m!275909))

(assert (=> b!260217 m!275917))

(assert (=> b!260218 m!275909))

(assert (=> b!260218 m!275909))

(assert (=> b!260218 m!275917))

(assert (=> b!260070 d!62471))

(declare-fun d!62473 () Bool)

(declare-fun res!127185 () Bool)

(declare-fun e!168656 () Bool)

(assert (=> d!62473 (=> res!127185 e!168656)))

(assert (=> d!62473 (= res!127185 (= (select (arr!5963 lt!131133) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62473 (= (arrayContainsKey!0 lt!131133 key!932 #b00000000000000000000000000000000) e!168656)))

(declare-fun b!260223 () Bool)

(declare-fun e!168657 () Bool)

(assert (=> b!260223 (= e!168656 e!168657)))

(declare-fun res!127186 () Bool)

(assert (=> b!260223 (=> (not res!127186) (not e!168657))))

(assert (=> b!260223 (= res!127186 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 lt!131133)))))

(declare-fun b!260224 () Bool)

(assert (=> b!260224 (= e!168657 (arrayContainsKey!0 lt!131133 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62473 (not res!127185)) b!260223))

(assert (= (and b!260223 res!127186) b!260224))

(assert (=> d!62473 m!275909))

(declare-fun m!275937 () Bool)

(assert (=> b!260224 m!275937))

(assert (=> b!260070 d!62473))

(declare-fun b!260267 () Bool)

(declare-fun e!168693 () Unit!8087)

(declare-fun Unit!8094 () Unit!8087)

(assert (=> b!260267 (= e!168693 Unit!8094)))

(declare-fun b!260268 () Bool)

(declare-fun res!127211 () Bool)

(declare-fun e!168685 () Bool)

(assert (=> b!260268 (=> (not res!127211) (not e!168685))))

(declare-fun e!168686 () Bool)

(assert (=> b!260268 (= res!127211 e!168686)))

(declare-fun res!127213 () Bool)

(assert (=> b!260268 (=> res!127213 e!168686)))

(declare-fun e!168694 () Bool)

(assert (=> b!260268 (= res!127213 (not e!168694))))

(declare-fun res!127205 () Bool)

(assert (=> b!260268 (=> (not res!127205) (not e!168694))))

(assert (=> b!260268 (= res!127205 (bvslt #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(declare-fun b!260269 () Bool)

(declare-fun e!168684 () Bool)

(declare-fun call!24817 () Bool)

(assert (=> b!260269 (= e!168684 (not call!24817))))

(declare-fun d!62475 () Bool)

(assert (=> d!62475 e!168685))

(declare-fun res!127210 () Bool)

(assert (=> d!62475 (=> (not res!127210) (not e!168685))))

(assert (=> d!62475 (= res!127210 (or (bvsge #b00000000000000000000000000000000 (size!6312 lt!131133)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 lt!131133)))))))

(declare-fun lt!131263 () ListLongMap!3861)

(declare-fun lt!131269 () ListLongMap!3861)

(assert (=> d!62475 (= lt!131263 lt!131269)))

(declare-fun lt!131266 () Unit!8087)

(assert (=> d!62475 (= lt!131266 e!168693)))

(declare-fun c!44223 () Bool)

(declare-fun e!168689 () Bool)

(assert (=> d!62475 (= c!44223 e!168689)))

(declare-fun res!127209 () Bool)

(assert (=> d!62475 (=> (not res!127209) (not e!168689))))

(assert (=> d!62475 (= res!127209 (bvslt #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(declare-fun e!168695 () ListLongMap!3861)

(assert (=> d!62475 (= lt!131269 e!168695)))

(declare-fun c!44225 () Bool)

(assert (=> d!62475 (= c!44225 (and (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62475 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62475 (= (getCurrentListMap!1474 lt!131133 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) lt!131263)))

(declare-fun bm!24814 () Bool)

(declare-fun call!24819 () ListLongMap!3861)

(declare-fun call!24820 () ListLongMap!3861)

(assert (=> bm!24814 (= call!24819 call!24820)))

(declare-fun b!260270 () Bool)

(declare-fun res!127207 () Bool)

(assert (=> b!260270 (=> (not res!127207) (not e!168685))))

(assert (=> b!260270 (= res!127207 e!168684)))

(declare-fun c!44227 () Bool)

(assert (=> b!260270 (= c!44227 (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!260271 () Bool)

(declare-fun e!168687 () Bool)

(assert (=> b!260271 (= e!168685 e!168687)))

(declare-fun c!44226 () Bool)

(assert (=> b!260271 (= c!44226 (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260272 () Bool)

(declare-fun e!168688 () ListLongMap!3861)

(declare-fun call!24823 () ListLongMap!3861)

(assert (=> b!260272 (= e!168688 call!24823)))

(declare-fun bm!24815 () Bool)

(declare-fun call!24818 () ListLongMap!3861)

(assert (=> bm!24815 (= call!24823 call!24818)))

(declare-fun b!260273 () Bool)

(assert (=> b!260273 (= e!168694 (validKeyInArray!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(declare-fun b!260274 () Bool)

(declare-fun e!168690 () Bool)

(declare-fun apply!258 (ListLongMap!3861 (_ BitVec 64)) V!8475)

(assert (=> b!260274 (= e!168690 (= (apply!258 lt!131263 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4636 thiss!1504)))))

(declare-fun b!260275 () Bool)

(declare-fun e!168691 () Bool)

(assert (=> b!260275 (= e!168686 e!168691)))

(declare-fun res!127212 () Bool)

(assert (=> b!260275 (=> (not res!127212) (not e!168691))))

(assert (=> b!260275 (= res!127212 (contains!1891 lt!131263 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(assert (=> b!260275 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(declare-fun b!260276 () Bool)

(assert (=> b!260276 (= e!168695 (+!699 call!24818 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))

(declare-fun b!260277 () Bool)

(declare-fun e!168692 () Bool)

(assert (=> b!260277 (= e!168687 e!168692)))

(declare-fun res!127208 () Bool)

(declare-fun call!24821 () Bool)

(assert (=> b!260277 (= res!127208 call!24821)))

(assert (=> b!260277 (=> (not res!127208) (not e!168692))))

(declare-fun bm!24816 () Bool)

(assert (=> bm!24816 (= call!24817 (contains!1891 lt!131263 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24817 () Bool)

(declare-fun call!24822 () ListLongMap!3861)

(assert (=> bm!24817 (= call!24822 call!24819)))

(declare-fun b!260278 () Bool)

(declare-fun e!168696 () ListLongMap!3861)

(assert (=> b!260278 (= e!168695 e!168696)))

(declare-fun c!44224 () Bool)

(assert (=> b!260278 (= c!44224 (and (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260279 () Bool)

(assert (=> b!260279 (= e!168689 (validKeyInArray!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(declare-fun b!260280 () Bool)

(assert (=> b!260280 (= e!168692 (= (apply!258 lt!131263 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4636 thiss!1504)))))

(declare-fun b!260281 () Bool)

(assert (=> b!260281 (= e!168696 call!24823)))

(declare-fun b!260282 () Bool)

(declare-fun get!3071 (ValueCell!2967 V!8475) V!8475)

(declare-fun dynLambda!601 (Int (_ BitVec 64)) V!8475)

(assert (=> b!260282 (= e!168691 (= (apply!258 lt!131263 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)) (get!3071 (select (arr!5962 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6311 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))))))))

(assert (=> b!260282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(declare-fun b!260283 () Bool)

(assert (=> b!260283 (= e!168688 call!24822)))

(declare-fun bm!24818 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!580 (array!12597 array!12595 (_ BitVec 32) (_ BitVec 32) V!8475 V!8475 (_ BitVec 32) Int) ListLongMap!3861)

(assert (=> bm!24818 (= call!24820 (getCurrentListMapNoExtraKeys!580 lt!131133 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun b!260284 () Bool)

(declare-fun lt!131276 () Unit!8087)

(assert (=> b!260284 (= e!168693 lt!131276)))

(declare-fun lt!131271 () ListLongMap!3861)

(assert (=> b!260284 (= lt!131271 (getCurrentListMapNoExtraKeys!580 lt!131133 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131277 () (_ BitVec 64))

(assert (=> b!260284 (= lt!131277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131274 () (_ BitVec 64))

(assert (=> b!260284 (= lt!131274 (select (arr!5963 lt!131133) #b00000000000000000000000000000000))))

(declare-fun lt!131280 () Unit!8087)

(declare-fun addStillContains!234 (ListLongMap!3861 (_ BitVec 64) V!8475 (_ BitVec 64)) Unit!8087)

(assert (=> b!260284 (= lt!131280 (addStillContains!234 lt!131271 lt!131277 (zeroValue!4636 thiss!1504) lt!131274))))

(assert (=> b!260284 (contains!1891 (+!699 lt!131271 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504))) lt!131274)))

(declare-fun lt!131282 () Unit!8087)

(assert (=> b!260284 (= lt!131282 lt!131280)))

(declare-fun lt!131268 () ListLongMap!3861)

(assert (=> b!260284 (= lt!131268 (getCurrentListMapNoExtraKeys!580 lt!131133 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131281 () (_ BitVec 64))

(assert (=> b!260284 (= lt!131281 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131275 () (_ BitVec 64))

(assert (=> b!260284 (= lt!131275 (select (arr!5963 lt!131133) #b00000000000000000000000000000000))))

(declare-fun lt!131273 () Unit!8087)

(declare-fun addApplyDifferent!234 (ListLongMap!3861 (_ BitVec 64) V!8475 (_ BitVec 64)) Unit!8087)

(assert (=> b!260284 (= lt!131273 (addApplyDifferent!234 lt!131268 lt!131281 (minValue!4636 thiss!1504) lt!131275))))

(assert (=> b!260284 (= (apply!258 (+!699 lt!131268 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504))) lt!131275) (apply!258 lt!131268 lt!131275))))

(declare-fun lt!131261 () Unit!8087)

(assert (=> b!260284 (= lt!131261 lt!131273)))

(declare-fun lt!131278 () ListLongMap!3861)

(assert (=> b!260284 (= lt!131278 (getCurrentListMapNoExtraKeys!580 lt!131133 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131265 () (_ BitVec 64))

(assert (=> b!260284 (= lt!131265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131267 () (_ BitVec 64))

(assert (=> b!260284 (= lt!131267 (select (arr!5963 lt!131133) #b00000000000000000000000000000000))))

(declare-fun lt!131270 () Unit!8087)

(assert (=> b!260284 (= lt!131270 (addApplyDifferent!234 lt!131278 lt!131265 (zeroValue!4636 thiss!1504) lt!131267))))

(assert (=> b!260284 (= (apply!258 (+!699 lt!131278 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504))) lt!131267) (apply!258 lt!131278 lt!131267))))

(declare-fun lt!131279 () Unit!8087)

(assert (=> b!260284 (= lt!131279 lt!131270)))

(declare-fun lt!131272 () ListLongMap!3861)

(assert (=> b!260284 (= lt!131272 (getCurrentListMapNoExtraKeys!580 lt!131133 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131262 () (_ BitVec 64))

(assert (=> b!260284 (= lt!131262 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131264 () (_ BitVec 64))

(assert (=> b!260284 (= lt!131264 (select (arr!5963 lt!131133) #b00000000000000000000000000000000))))

(assert (=> b!260284 (= lt!131276 (addApplyDifferent!234 lt!131272 lt!131262 (minValue!4636 thiss!1504) lt!131264))))

(assert (=> b!260284 (= (apply!258 (+!699 lt!131272 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504))) lt!131264) (apply!258 lt!131272 lt!131264))))

(declare-fun bm!24819 () Bool)

(assert (=> bm!24819 (= call!24821 (contains!1891 lt!131263 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260285 () Bool)

(assert (=> b!260285 (= e!168684 e!168690)))

(declare-fun res!127206 () Bool)

(assert (=> b!260285 (= res!127206 call!24817)))

(assert (=> b!260285 (=> (not res!127206) (not e!168690))))

(declare-fun b!260286 () Bool)

(declare-fun c!44222 () Bool)

(assert (=> b!260286 (= c!44222 (and (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!260286 (= e!168696 e!168688)))

(declare-fun b!260287 () Bool)

(assert (=> b!260287 (= e!168687 (not call!24821))))

(declare-fun bm!24820 () Bool)

(assert (=> bm!24820 (= call!24818 (+!699 (ite c!44225 call!24820 (ite c!44224 call!24819 call!24822)) (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (= (and d!62475 c!44225) b!260276))

(assert (= (and d!62475 (not c!44225)) b!260278))

(assert (= (and b!260278 c!44224) b!260281))

(assert (= (and b!260278 (not c!44224)) b!260286))

(assert (= (and b!260286 c!44222) b!260272))

(assert (= (and b!260286 (not c!44222)) b!260283))

(assert (= (or b!260272 b!260283) bm!24817))

(assert (= (or b!260281 bm!24817) bm!24814))

(assert (= (or b!260281 b!260272) bm!24815))

(assert (= (or b!260276 bm!24814) bm!24818))

(assert (= (or b!260276 bm!24815) bm!24820))

(assert (= (and d!62475 res!127209) b!260279))

(assert (= (and d!62475 c!44223) b!260284))

(assert (= (and d!62475 (not c!44223)) b!260267))

(assert (= (and d!62475 res!127210) b!260268))

(assert (= (and b!260268 res!127205) b!260273))

(assert (= (and b!260268 (not res!127213)) b!260275))

(assert (= (and b!260275 res!127212) b!260282))

(assert (= (and b!260268 res!127211) b!260270))

(assert (= (and b!260270 c!44227) b!260285))

(assert (= (and b!260270 (not c!44227)) b!260269))

(assert (= (and b!260285 res!127206) b!260274))

(assert (= (or b!260285 b!260269) bm!24816))

(assert (= (and b!260270 res!127207) b!260271))

(assert (= (and b!260271 c!44226) b!260277))

(assert (= (and b!260271 (not c!44226)) b!260287))

(assert (= (and b!260277 res!127208) b!260280))

(assert (= (or b!260277 b!260287) bm!24819))

(declare-fun b_lambda!8259 () Bool)

(assert (=> (not b_lambda!8259) (not b!260282)))

(declare-fun t!8900 () Bool)

(declare-fun tb!3029 () Bool)

(assert (=> (and b!260073 (= (defaultEntry!4795 thiss!1504) (defaultEntry!4795 thiss!1504)) t!8900) tb!3029))

(declare-fun result!5409 () Bool)

(assert (=> tb!3029 (= result!5409 tp_is_empty!6621)))

(assert (=> b!260282 t!8900))

(declare-fun b_and!13869 () Bool)

(assert (= b_and!13865 (and (=> t!8900 result!5409) b_and!13869)))

(assert (=> b!260279 m!275909))

(assert (=> b!260279 m!275909))

(assert (=> b!260279 m!275917))

(declare-fun m!275939 () Bool)

(assert (=> b!260276 m!275939))

(declare-fun m!275941 () Bool)

(assert (=> bm!24816 m!275941))

(declare-fun m!275943 () Bool)

(assert (=> bm!24820 m!275943))

(declare-fun m!275945 () Bool)

(assert (=> b!260284 m!275945))

(declare-fun m!275947 () Bool)

(assert (=> b!260284 m!275947))

(declare-fun m!275949 () Bool)

(assert (=> b!260284 m!275949))

(declare-fun m!275951 () Bool)

(assert (=> b!260284 m!275951))

(assert (=> b!260284 m!275949))

(declare-fun m!275953 () Bool)

(assert (=> b!260284 m!275953))

(declare-fun m!275955 () Bool)

(assert (=> b!260284 m!275955))

(declare-fun m!275957 () Bool)

(assert (=> b!260284 m!275957))

(declare-fun m!275959 () Bool)

(assert (=> b!260284 m!275959))

(declare-fun m!275961 () Bool)

(assert (=> b!260284 m!275961))

(declare-fun m!275963 () Bool)

(assert (=> b!260284 m!275963))

(declare-fun m!275965 () Bool)

(assert (=> b!260284 m!275965))

(declare-fun m!275967 () Bool)

(assert (=> b!260284 m!275967))

(declare-fun m!275969 () Bool)

(assert (=> b!260284 m!275969))

(declare-fun m!275971 () Bool)

(assert (=> b!260284 m!275971))

(declare-fun m!275973 () Bool)

(assert (=> b!260284 m!275973))

(declare-fun m!275975 () Bool)

(assert (=> b!260284 m!275975))

(assert (=> b!260284 m!275965))

(assert (=> b!260284 m!275909))

(assert (=> b!260284 m!275973))

(assert (=> b!260284 m!275969))

(assert (=> bm!24818 m!275961))

(assert (=> b!260275 m!275909))

(assert (=> b!260275 m!275909))

(declare-fun m!275977 () Bool)

(assert (=> b!260275 m!275977))

(declare-fun m!275979 () Bool)

(assert (=> bm!24819 m!275979))

(declare-fun m!275981 () Bool)

(assert (=> b!260274 m!275981))

(assert (=> d!62475 m!275775))

(declare-fun m!275983 () Bool)

(assert (=> b!260280 m!275983))

(assert (=> b!260282 m!275909))

(declare-fun m!275985 () Bool)

(assert (=> b!260282 m!275985))

(assert (=> b!260282 m!275985))

(declare-fun m!275987 () Bool)

(assert (=> b!260282 m!275987))

(declare-fun m!275989 () Bool)

(assert (=> b!260282 m!275989))

(assert (=> b!260282 m!275987))

(assert (=> b!260282 m!275909))

(declare-fun m!275991 () Bool)

(assert (=> b!260282 m!275991))

(assert (=> b!260273 m!275909))

(assert (=> b!260273 m!275909))

(assert (=> b!260273 m!275917))

(assert (=> b!260070 d!62475))

(declare-fun d!62477 () Bool)

(declare-fun e!168699 () Bool)

(assert (=> d!62477 e!168699))

(declare-fun res!127218 () Bool)

(assert (=> d!62477 (=> (not res!127218) (not e!168699))))

(declare-fun lt!131292 () ListLongMap!3861)

(assert (=> d!62477 (= res!127218 (contains!1891 lt!131292 (_1!2485 (tuple2!4949 key!932 v!346))))))

(declare-fun lt!131294 () List!3826)

(assert (=> d!62477 (= lt!131292 (ListLongMap!3862 lt!131294))))

(declare-fun lt!131293 () Unit!8087)

(declare-fun lt!131291 () Unit!8087)

(assert (=> d!62477 (= lt!131293 lt!131291)))

(declare-datatypes ((Option!322 0))(
  ( (Some!321 (v!5472 V!8475)) (None!320) )
))
(declare-fun getValueByKey!316 (List!3826 (_ BitVec 64)) Option!322)

(assert (=> d!62477 (= (getValueByKey!316 lt!131294 (_1!2485 (tuple2!4949 key!932 v!346))) (Some!321 (_2!2485 (tuple2!4949 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!172 (List!3826 (_ BitVec 64) V!8475) Unit!8087)

(assert (=> d!62477 (= lt!131291 (lemmaContainsTupThenGetReturnValue!172 lt!131294 (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346))))))

(declare-fun insertStrictlySorted!175 (List!3826 (_ BitVec 64) V!8475) List!3826)

(assert (=> d!62477 (= lt!131294 (insertStrictlySorted!175 (toList!1946 lt!131126) (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346))))))

(assert (=> d!62477 (= (+!699 lt!131126 (tuple2!4949 key!932 v!346)) lt!131292)))

(declare-fun b!260294 () Bool)

(declare-fun res!127219 () Bool)

(assert (=> b!260294 (=> (not res!127219) (not e!168699))))

(assert (=> b!260294 (= res!127219 (= (getValueByKey!316 (toList!1946 lt!131292) (_1!2485 (tuple2!4949 key!932 v!346))) (Some!321 (_2!2485 (tuple2!4949 key!932 v!346)))))))

(declare-fun b!260295 () Bool)

(declare-fun contains!1893 (List!3826 tuple2!4948) Bool)

(assert (=> b!260295 (= e!168699 (contains!1893 (toList!1946 lt!131292) (tuple2!4949 key!932 v!346)))))

(assert (= (and d!62477 res!127218) b!260294))

(assert (= (and b!260294 res!127219) b!260295))

(declare-fun m!275993 () Bool)

(assert (=> d!62477 m!275993))

(declare-fun m!275995 () Bool)

(assert (=> d!62477 m!275995))

(declare-fun m!275997 () Bool)

(assert (=> d!62477 m!275997))

(declare-fun m!275999 () Bool)

(assert (=> d!62477 m!275999))

(declare-fun m!276001 () Bool)

(assert (=> b!260294 m!276001))

(declare-fun m!276003 () Bool)

(assert (=> b!260295 m!276003))

(assert (=> b!260070 d!62477))

(declare-fun d!62479 () Bool)

(declare-fun e!168702 () Bool)

(assert (=> d!62479 e!168702))

(declare-fun res!127222 () Bool)

(assert (=> d!62479 (=> (not res!127222) (not e!168702))))

(assert (=> d!62479 (= res!127222 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6312 (_keys!6975 thiss!1504)))))))

(declare-fun lt!131297 () Unit!8087)

(declare-fun choose!41 (array!12597 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3827) Unit!8087)

(assert (=> d!62479 (= lt!131297 (choose!41 (_keys!6975 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3824))))

(assert (=> d!62479 (bvslt (size!6312 (_keys!6975 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62479 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6975 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3824) lt!131297)))

(declare-fun b!260298 () Bool)

(assert (=> b!260298 (= e!168702 (arrayNoDuplicates!0 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) #b00000000000000000000000000000000 Nil!3824))))

(assert (= (and d!62479 res!127222) b!260298))

(declare-fun m!276005 () Bool)

(assert (=> d!62479 m!276005))

(assert (=> b!260298 m!275805))

(declare-fun m!276007 () Bool)

(assert (=> b!260298 m!276007))

(assert (=> b!260070 d!62479))

(declare-fun d!62481 () Bool)

(declare-fun e!168708 () Bool)

(assert (=> d!62481 e!168708))

(declare-fun res!127231 () Bool)

(assert (=> d!62481 (=> (not res!127231) (not e!168708))))

(assert (=> d!62481 (= res!127231 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6312 (_keys!6975 thiss!1504)))))))

(declare-fun lt!131300 () Unit!8087)

(declare-fun choose!1 (array!12597 (_ BitVec 32) (_ BitVec 64)) Unit!8087)

(assert (=> d!62481 (= lt!131300 (choose!1 (_keys!6975 thiss!1504) index!297 key!932))))

(declare-fun e!168707 () Bool)

(assert (=> d!62481 e!168707))

(declare-fun res!127234 () Bool)

(assert (=> d!62481 (=> (not res!127234) (not e!168707))))

(assert (=> d!62481 (= res!127234 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6312 (_keys!6975 thiss!1504)))))))

(assert (=> d!62481 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6975 thiss!1504) index!297 key!932) lt!131300)))

(declare-fun b!260308 () Bool)

(declare-fun res!127233 () Bool)

(assert (=> b!260308 (=> (not res!127233) (not e!168707))))

(assert (=> b!260308 (= res!127233 (validKeyInArray!0 key!932))))

(declare-fun b!260307 () Bool)

(declare-fun res!127232 () Bool)

(assert (=> b!260307 (=> (not res!127232) (not e!168707))))

(assert (=> b!260307 (= res!127232 (not (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) index!297))))))

(declare-fun b!260310 () Bool)

(assert (=> b!260310 (= e!168708 (= (arrayCountValidKeys!0 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6975 thiss!1504) #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!260309 () Bool)

(assert (=> b!260309 (= e!168707 (bvslt (size!6312 (_keys!6975 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!62481 res!127234) b!260307))

(assert (= (and b!260307 res!127232) b!260308))

(assert (= (and b!260308 res!127233) b!260309))

(assert (= (and d!62481 res!127231) b!260310))

(declare-fun m!276009 () Bool)

(assert (=> d!62481 m!276009))

(declare-fun m!276011 () Bool)

(assert (=> b!260308 m!276011))

(declare-fun m!276013 () Bool)

(assert (=> b!260307 m!276013))

(assert (=> b!260307 m!276013))

(declare-fun m!276015 () Bool)

(assert (=> b!260307 m!276015))

(assert (=> b!260310 m!275805))

(declare-fun m!276017 () Bool)

(assert (=> b!260310 m!276017))

(assert (=> b!260310 m!275793))

(assert (=> b!260070 d!62481))

(declare-fun b!260311 () Bool)

(declare-fun e!168710 () (_ BitVec 32))

(declare-fun call!24824 () (_ BitVec 32))

(assert (=> b!260311 (= e!168710 (bvadd #b00000000000000000000000000000001 call!24824))))

(declare-fun bm!24821 () Bool)

(assert (=> bm!24821 (= call!24824 (arrayCountValidKeys!0 lt!131133 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260312 () Bool)

(declare-fun e!168709 () (_ BitVec 32))

(assert (=> b!260312 (= e!168709 #b00000000000000000000000000000000)))

(declare-fun d!62483 () Bool)

(declare-fun lt!131301 () (_ BitVec 32))

(assert (=> d!62483 (and (bvsge lt!131301 #b00000000000000000000000000000000) (bvsle lt!131301 (bvsub (size!6312 lt!131133) #b00000000000000000000000000000000)))))

(assert (=> d!62483 (= lt!131301 e!168709)))

(declare-fun c!44228 () Bool)

(assert (=> d!62483 (= c!44228 (bvsge #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> d!62483 (and (bvsle #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6312 (_keys!6975 thiss!1504)) (size!6312 lt!131133)))))

(assert (=> d!62483 (= (arrayCountValidKeys!0 lt!131133 #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) lt!131301)))

(declare-fun b!260313 () Bool)

(assert (=> b!260313 (= e!168710 call!24824)))

(declare-fun b!260314 () Bool)

(assert (=> b!260314 (= e!168709 e!168710)))

(declare-fun c!44229 () Bool)

(assert (=> b!260314 (= c!44229 (validKeyInArray!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(assert (= (and d!62483 c!44228) b!260312))

(assert (= (and d!62483 (not c!44228)) b!260314))

(assert (= (and b!260314 c!44229) b!260311))

(assert (= (and b!260314 (not c!44229)) b!260313))

(assert (= (or b!260311 b!260313) bm!24821))

(declare-fun m!276019 () Bool)

(assert (=> bm!24821 m!276019))

(assert (=> b!260314 m!275909))

(assert (=> b!260314 m!275909))

(assert (=> b!260314 m!275917))

(assert (=> b!260070 d!62483))

(declare-fun d!62485 () Bool)

(declare-fun res!127235 () Bool)

(declare-fun e!168711 () Bool)

(assert (=> d!62485 (=> res!127235 e!168711)))

(assert (=> d!62485 (= res!127235 (= (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62485 (= (arrayContainsKey!0 (_keys!6975 thiss!1504) key!932 #b00000000000000000000000000000000) e!168711)))

(declare-fun b!260315 () Bool)

(declare-fun e!168712 () Bool)

(assert (=> b!260315 (= e!168711 e!168712)))

(declare-fun res!127236 () Bool)

(assert (=> b!260315 (=> (not res!127236) (not e!168712))))

(assert (=> b!260315 (= res!127236 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260316 () Bool)

(assert (=> b!260316 (= e!168712 (arrayContainsKey!0 (_keys!6975 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62485 (not res!127235)) b!260315))

(assert (= (and b!260315 res!127236) b!260316))

(assert (=> d!62485 m!275921))

(declare-fun m!276021 () Bool)

(assert (=> b!260316 m!276021))

(assert (=> b!260070 d!62485))

(declare-fun d!62487 () Bool)

(declare-fun e!168715 () Bool)

(assert (=> d!62487 e!168715))

(declare-fun res!127239 () Bool)

(assert (=> d!62487 (=> (not res!127239) (not e!168715))))

(assert (=> d!62487 (= res!127239 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6312 (_keys!6975 thiss!1504)))))))

(declare-fun lt!131304 () Unit!8087)

(declare-fun choose!102 ((_ BitVec 64) array!12597 (_ BitVec 32) (_ BitVec 32)) Unit!8087)

(assert (=> d!62487 (= lt!131304 (choose!102 key!932 (_keys!6975 thiss!1504) index!297 (mask!11121 thiss!1504)))))

(assert (=> d!62487 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62487 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6975 thiss!1504) index!297 (mask!11121 thiss!1504)) lt!131304)))

(declare-fun b!260319 () Bool)

(assert (=> b!260319 (= e!168715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (mask!11121 thiss!1504)))))

(assert (= (and d!62487 res!127239) b!260319))

(declare-fun m!276023 () Bool)

(assert (=> d!62487 m!276023))

(assert (=> d!62487 m!275775))

(assert (=> b!260319 m!275805))

(declare-fun m!276025 () Bool)

(assert (=> b!260319 m!276025))

(assert (=> b!260070 d!62487))

(assert (=> bm!24783 d!62485))

(declare-fun d!62489 () Bool)

(assert (=> d!62489 (= (inRange!0 (ite c!44171 (index!6902 lt!131134) (index!6905 lt!131134)) (mask!11121 thiss!1504)) (and (bvsge (ite c!44171 (index!6902 lt!131134) (index!6905 lt!131134)) #b00000000000000000000000000000000) (bvslt (ite c!44171 (index!6902 lt!131134) (index!6905 lt!131134)) (bvadd (mask!11121 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24782 d!62489))

(declare-fun d!62491 () Bool)

(assert (=> d!62491 (= (inRange!0 index!297 (mask!11121 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11121 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!260079 d!62491))

(declare-fun d!62493 () Bool)

(declare-fun e!168721 () Bool)

(assert (=> d!62493 e!168721))

(declare-fun res!127242 () Bool)

(assert (=> d!62493 (=> res!127242 e!168721)))

(declare-fun lt!131315 () Bool)

(assert (=> d!62493 (= res!127242 (not lt!131315))))

(declare-fun lt!131314 () Bool)

(assert (=> d!62493 (= lt!131315 lt!131314)))

(declare-fun lt!131313 () Unit!8087)

(declare-fun e!168720 () Unit!8087)

(assert (=> d!62493 (= lt!131313 e!168720)))

(declare-fun c!44232 () Bool)

(assert (=> d!62493 (= c!44232 lt!131314)))

(declare-fun containsKey!308 (List!3826 (_ BitVec 64)) Bool)

(assert (=> d!62493 (= lt!131314 (containsKey!308 (toList!1946 lt!131126) key!932))))

(assert (=> d!62493 (= (contains!1891 lt!131126 key!932) lt!131315)))

(declare-fun b!260326 () Bool)

(declare-fun lt!131316 () Unit!8087)

(assert (=> b!260326 (= e!168720 lt!131316)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!256 (List!3826 (_ BitVec 64)) Unit!8087)

(assert (=> b!260326 (= lt!131316 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 lt!131126) key!932))))

(declare-fun isDefined!257 (Option!322) Bool)

(assert (=> b!260326 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131126) key!932))))

(declare-fun b!260327 () Bool)

(declare-fun Unit!8095 () Unit!8087)

(assert (=> b!260327 (= e!168720 Unit!8095)))

(declare-fun b!260328 () Bool)

(assert (=> b!260328 (= e!168721 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131126) key!932)))))

(assert (= (and d!62493 c!44232) b!260326))

(assert (= (and d!62493 (not c!44232)) b!260327))

(assert (= (and d!62493 (not res!127242)) b!260328))

(declare-fun m!276027 () Bool)

(assert (=> d!62493 m!276027))

(declare-fun m!276029 () Bool)

(assert (=> b!260326 m!276029))

(declare-fun m!276031 () Bool)

(assert (=> b!260326 m!276031))

(assert (=> b!260326 m!276031))

(declare-fun m!276033 () Bool)

(assert (=> b!260326 m!276033))

(assert (=> b!260328 m!276031))

(assert (=> b!260328 m!276031))

(assert (=> b!260328 m!276033))

(assert (=> b!260079 d!62493))

(declare-fun b!260329 () Bool)

(declare-fun e!168731 () Unit!8087)

(declare-fun Unit!8096 () Unit!8087)

(assert (=> b!260329 (= e!168731 Unit!8096)))

(declare-fun b!260330 () Bool)

(declare-fun res!127249 () Bool)

(declare-fun e!168723 () Bool)

(assert (=> b!260330 (=> (not res!127249) (not e!168723))))

(declare-fun e!168724 () Bool)

(assert (=> b!260330 (= res!127249 e!168724)))

(declare-fun res!127251 () Bool)

(assert (=> b!260330 (=> res!127251 e!168724)))

(declare-fun e!168732 () Bool)

(assert (=> b!260330 (= res!127251 (not e!168732))))

(declare-fun res!127243 () Bool)

(assert (=> b!260330 (=> (not res!127243) (not e!168732))))

(assert (=> b!260330 (= res!127243 (bvslt #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260331 () Bool)

(declare-fun e!168722 () Bool)

(declare-fun call!24825 () Bool)

(assert (=> b!260331 (= e!168722 (not call!24825))))

(declare-fun d!62495 () Bool)

(assert (=> d!62495 e!168723))

(declare-fun res!127248 () Bool)

(assert (=> d!62495 (=> (not res!127248) (not e!168723))))

(assert (=> d!62495 (= res!127248 (or (bvsge #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))))

(declare-fun lt!131319 () ListLongMap!3861)

(declare-fun lt!131325 () ListLongMap!3861)

(assert (=> d!62495 (= lt!131319 lt!131325)))

(declare-fun lt!131322 () Unit!8087)

(assert (=> d!62495 (= lt!131322 e!168731)))

(declare-fun c!44234 () Bool)

(declare-fun e!168727 () Bool)

(assert (=> d!62495 (= c!44234 e!168727)))

(declare-fun res!127247 () Bool)

(assert (=> d!62495 (=> (not res!127247) (not e!168727))))

(assert (=> d!62495 (= res!127247 (bvslt #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun e!168733 () ListLongMap!3861)

(assert (=> d!62495 (= lt!131325 e!168733)))

(declare-fun c!44236 () Bool)

(assert (=> d!62495 (= c!44236 (and (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62495 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62495 (= (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) lt!131319)))

(declare-fun bm!24822 () Bool)

(declare-fun call!24827 () ListLongMap!3861)

(declare-fun call!24828 () ListLongMap!3861)

(assert (=> bm!24822 (= call!24827 call!24828)))

(declare-fun b!260332 () Bool)

(declare-fun res!127245 () Bool)

(assert (=> b!260332 (=> (not res!127245) (not e!168723))))

(assert (=> b!260332 (= res!127245 e!168722)))

(declare-fun c!44238 () Bool)

(assert (=> b!260332 (= c!44238 (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!260333 () Bool)

(declare-fun e!168725 () Bool)

(assert (=> b!260333 (= e!168723 e!168725)))

(declare-fun c!44237 () Bool)

(assert (=> b!260333 (= c!44237 (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260334 () Bool)

(declare-fun e!168726 () ListLongMap!3861)

(declare-fun call!24831 () ListLongMap!3861)

(assert (=> b!260334 (= e!168726 call!24831)))

(declare-fun bm!24823 () Bool)

(declare-fun call!24826 () ListLongMap!3861)

(assert (=> bm!24823 (= call!24831 call!24826)))

(declare-fun b!260335 () Bool)

(assert (=> b!260335 (= e!168732 (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260336 () Bool)

(declare-fun e!168728 () Bool)

(assert (=> b!260336 (= e!168728 (= (apply!258 lt!131319 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4636 thiss!1504)))))

(declare-fun b!260337 () Bool)

(declare-fun e!168729 () Bool)

(assert (=> b!260337 (= e!168724 e!168729)))

(declare-fun res!127250 () Bool)

(assert (=> b!260337 (=> (not res!127250) (not e!168729))))

(assert (=> b!260337 (= res!127250 (contains!1891 lt!131319 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260338 () Bool)

(assert (=> b!260338 (= e!168733 (+!699 call!24826 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))

(declare-fun b!260339 () Bool)

(declare-fun e!168730 () Bool)

(assert (=> b!260339 (= e!168725 e!168730)))

(declare-fun res!127246 () Bool)

(declare-fun call!24829 () Bool)

(assert (=> b!260339 (= res!127246 call!24829)))

(assert (=> b!260339 (=> (not res!127246) (not e!168730))))

(declare-fun bm!24824 () Bool)

(assert (=> bm!24824 (= call!24825 (contains!1891 lt!131319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24825 () Bool)

(declare-fun call!24830 () ListLongMap!3861)

(assert (=> bm!24825 (= call!24830 call!24827)))

(declare-fun b!260340 () Bool)

(declare-fun e!168734 () ListLongMap!3861)

(assert (=> b!260340 (= e!168733 e!168734)))

(declare-fun c!44235 () Bool)

(assert (=> b!260340 (= c!44235 (and (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260341 () Bool)

(assert (=> b!260341 (= e!168727 (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260342 () Bool)

(assert (=> b!260342 (= e!168730 (= (apply!258 lt!131319 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4636 thiss!1504)))))

(declare-fun b!260343 () Bool)

(assert (=> b!260343 (= e!168734 call!24831)))

(declare-fun b!260344 () Bool)

(assert (=> b!260344 (= e!168729 (= (apply!258 lt!131319 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)) (get!3071 (select (arr!5962 (_values!4778 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6311 (_values!4778 thiss!1504))))))

(assert (=> b!260344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260345 () Bool)

(assert (=> b!260345 (= e!168726 call!24830)))

(declare-fun bm!24826 () Bool)

(assert (=> bm!24826 (= call!24828 (getCurrentListMapNoExtraKeys!580 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun b!260346 () Bool)

(declare-fun lt!131332 () Unit!8087)

(assert (=> b!260346 (= e!168731 lt!131332)))

(declare-fun lt!131327 () ListLongMap!3861)

(assert (=> b!260346 (= lt!131327 (getCurrentListMapNoExtraKeys!580 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131333 () (_ BitVec 64))

(assert (=> b!260346 (= lt!131333 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131330 () (_ BitVec 64))

(assert (=> b!260346 (= lt!131330 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131336 () Unit!8087)

(assert (=> b!260346 (= lt!131336 (addStillContains!234 lt!131327 lt!131333 (zeroValue!4636 thiss!1504) lt!131330))))

(assert (=> b!260346 (contains!1891 (+!699 lt!131327 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504))) lt!131330)))

(declare-fun lt!131338 () Unit!8087)

(assert (=> b!260346 (= lt!131338 lt!131336)))

(declare-fun lt!131324 () ListLongMap!3861)

(assert (=> b!260346 (= lt!131324 (getCurrentListMapNoExtraKeys!580 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131337 () (_ BitVec 64))

(assert (=> b!260346 (= lt!131337 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131331 () (_ BitVec 64))

(assert (=> b!260346 (= lt!131331 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131329 () Unit!8087)

(assert (=> b!260346 (= lt!131329 (addApplyDifferent!234 lt!131324 lt!131337 (minValue!4636 thiss!1504) lt!131331))))

(assert (=> b!260346 (= (apply!258 (+!699 lt!131324 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504))) lt!131331) (apply!258 lt!131324 lt!131331))))

(declare-fun lt!131317 () Unit!8087)

(assert (=> b!260346 (= lt!131317 lt!131329)))

(declare-fun lt!131334 () ListLongMap!3861)

(assert (=> b!260346 (= lt!131334 (getCurrentListMapNoExtraKeys!580 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131321 () (_ BitVec 64))

(assert (=> b!260346 (= lt!131321 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131323 () (_ BitVec 64))

(assert (=> b!260346 (= lt!131323 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131326 () Unit!8087)

(assert (=> b!260346 (= lt!131326 (addApplyDifferent!234 lt!131334 lt!131321 (zeroValue!4636 thiss!1504) lt!131323))))

(assert (=> b!260346 (= (apply!258 (+!699 lt!131334 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504))) lt!131323) (apply!258 lt!131334 lt!131323))))

(declare-fun lt!131335 () Unit!8087)

(assert (=> b!260346 (= lt!131335 lt!131326)))

(declare-fun lt!131328 () ListLongMap!3861)

(assert (=> b!260346 (= lt!131328 (getCurrentListMapNoExtraKeys!580 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131318 () (_ BitVec 64))

(assert (=> b!260346 (= lt!131318 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131320 () (_ BitVec 64))

(assert (=> b!260346 (= lt!131320 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260346 (= lt!131332 (addApplyDifferent!234 lt!131328 lt!131318 (minValue!4636 thiss!1504) lt!131320))))

(assert (=> b!260346 (= (apply!258 (+!699 lt!131328 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504))) lt!131320) (apply!258 lt!131328 lt!131320))))

(declare-fun bm!24827 () Bool)

(assert (=> bm!24827 (= call!24829 (contains!1891 lt!131319 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260347 () Bool)

(assert (=> b!260347 (= e!168722 e!168728)))

(declare-fun res!127244 () Bool)

(assert (=> b!260347 (= res!127244 call!24825)))

(assert (=> b!260347 (=> (not res!127244) (not e!168728))))

(declare-fun b!260348 () Bool)

(declare-fun c!44233 () Bool)

(assert (=> b!260348 (= c!44233 (and (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!260348 (= e!168734 e!168726)))

(declare-fun b!260349 () Bool)

(assert (=> b!260349 (= e!168725 (not call!24829))))

(declare-fun bm!24828 () Bool)

(assert (=> bm!24828 (= call!24826 (+!699 (ite c!44236 call!24828 (ite c!44235 call!24827 call!24830)) (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (= (and d!62495 c!44236) b!260338))

(assert (= (and d!62495 (not c!44236)) b!260340))

(assert (= (and b!260340 c!44235) b!260343))

(assert (= (and b!260340 (not c!44235)) b!260348))

(assert (= (and b!260348 c!44233) b!260334))

(assert (= (and b!260348 (not c!44233)) b!260345))

(assert (= (or b!260334 b!260345) bm!24825))

(assert (= (or b!260343 bm!24825) bm!24822))

(assert (= (or b!260343 b!260334) bm!24823))

(assert (= (or b!260338 bm!24822) bm!24826))

(assert (= (or b!260338 bm!24823) bm!24828))

(assert (= (and d!62495 res!127247) b!260341))

(assert (= (and d!62495 c!44234) b!260346))

(assert (= (and d!62495 (not c!44234)) b!260329))

(assert (= (and d!62495 res!127248) b!260330))

(assert (= (and b!260330 res!127243) b!260335))

(assert (= (and b!260330 (not res!127251)) b!260337))

(assert (= (and b!260337 res!127250) b!260344))

(assert (= (and b!260330 res!127249) b!260332))

(assert (= (and b!260332 c!44238) b!260347))

(assert (= (and b!260332 (not c!44238)) b!260331))

(assert (= (and b!260347 res!127244) b!260336))

(assert (= (or b!260347 b!260331) bm!24824))

(assert (= (and b!260332 res!127245) b!260333))

(assert (= (and b!260333 c!44237) b!260339))

(assert (= (and b!260333 (not c!44237)) b!260349))

(assert (= (and b!260339 res!127246) b!260342))

(assert (= (or b!260339 b!260349) bm!24827))

(declare-fun b_lambda!8261 () Bool)

(assert (=> (not b_lambda!8261) (not b!260344)))

(assert (=> b!260344 t!8900))

(declare-fun b_and!13871 () Bool)

(assert (= b_and!13869 (and (=> t!8900 result!5409) b_and!13871)))

(assert (=> b!260341 m!275921))

(assert (=> b!260341 m!275921))

(assert (=> b!260341 m!275923))

(declare-fun m!276035 () Bool)

(assert (=> b!260338 m!276035))

(declare-fun m!276037 () Bool)

(assert (=> bm!24824 m!276037))

(declare-fun m!276039 () Bool)

(assert (=> bm!24828 m!276039))

(declare-fun m!276041 () Bool)

(assert (=> b!260346 m!276041))

(declare-fun m!276043 () Bool)

(assert (=> b!260346 m!276043))

(declare-fun m!276045 () Bool)

(assert (=> b!260346 m!276045))

(declare-fun m!276047 () Bool)

(assert (=> b!260346 m!276047))

(assert (=> b!260346 m!276045))

(declare-fun m!276049 () Bool)

(assert (=> b!260346 m!276049))

(declare-fun m!276051 () Bool)

(assert (=> b!260346 m!276051))

(declare-fun m!276053 () Bool)

(assert (=> b!260346 m!276053))

(declare-fun m!276055 () Bool)

(assert (=> b!260346 m!276055))

(declare-fun m!276057 () Bool)

(assert (=> b!260346 m!276057))

(declare-fun m!276059 () Bool)

(assert (=> b!260346 m!276059))

(declare-fun m!276061 () Bool)

(assert (=> b!260346 m!276061))

(declare-fun m!276063 () Bool)

(assert (=> b!260346 m!276063))

(declare-fun m!276065 () Bool)

(assert (=> b!260346 m!276065))

(declare-fun m!276067 () Bool)

(assert (=> b!260346 m!276067))

(declare-fun m!276069 () Bool)

(assert (=> b!260346 m!276069))

(declare-fun m!276071 () Bool)

(assert (=> b!260346 m!276071))

(assert (=> b!260346 m!276061))

(assert (=> b!260346 m!275921))

(assert (=> b!260346 m!276069))

(assert (=> b!260346 m!276065))

(assert (=> bm!24826 m!276057))

(assert (=> b!260337 m!275921))

(assert (=> b!260337 m!275921))

(declare-fun m!276073 () Bool)

(assert (=> b!260337 m!276073))

(declare-fun m!276075 () Bool)

(assert (=> bm!24827 m!276075))

(declare-fun m!276077 () Bool)

(assert (=> b!260336 m!276077))

(assert (=> d!62495 m!275775))

(declare-fun m!276079 () Bool)

(assert (=> b!260342 m!276079))

(assert (=> b!260344 m!275921))

(declare-fun m!276081 () Bool)

(assert (=> b!260344 m!276081))

(assert (=> b!260344 m!276081))

(assert (=> b!260344 m!275987))

(declare-fun m!276083 () Bool)

(assert (=> b!260344 m!276083))

(assert (=> b!260344 m!275987))

(assert (=> b!260344 m!275921))

(declare-fun m!276085 () Bool)

(assert (=> b!260344 m!276085))

(assert (=> b!260335 m!275921))

(assert (=> b!260335 m!275921))

(assert (=> b!260335 m!275923))

(assert (=> b!260079 d!62495))

(declare-fun b!260366 () Bool)

(declare-fun res!127263 () Bool)

(declare-fun e!168745 () Bool)

(assert (=> b!260366 (=> (not res!127263) (not e!168745))))

(declare-fun call!24837 () Bool)

(assert (=> b!260366 (= res!127263 call!24837)))

(declare-fun e!168744 () Bool)

(assert (=> b!260366 (= e!168744 e!168745)))

(declare-fun b!260367 () Bool)

(declare-fun e!168743 () Bool)

(declare-fun call!24836 () Bool)

(assert (=> b!260367 (= e!168743 (not call!24836))))

(declare-fun b!260368 () Bool)

(declare-fun lt!131343 () SeekEntryResult!1183)

(assert (=> b!260368 (and (bvsge (index!6902 lt!131343) #b00000000000000000000000000000000) (bvslt (index!6902 lt!131343) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun res!127260 () Bool)

(assert (=> b!260368 (= res!127260 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6902 lt!131343)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260368 (=> (not res!127260) (not e!168743))))

(declare-fun d!62497 () Bool)

(declare-fun e!168746 () Bool)

(assert (=> d!62497 e!168746))

(declare-fun c!44244 () Bool)

(assert (=> d!62497 (= c!44244 ((_ is MissingZero!1183) lt!131343))))

(assert (=> d!62497 (= lt!131343 (seekEntryOrOpen!0 key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(declare-fun lt!131344 () Unit!8087)

(declare-fun choose!1267 (array!12597 array!12595 (_ BitVec 32) (_ BitVec 32) V!8475 V!8475 (_ BitVec 64) Int) Unit!8087)

(assert (=> d!62497 (= lt!131344 (choose!1267 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 (defaultEntry!4795 thiss!1504)))))

(assert (=> d!62497 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62497 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!445 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 (defaultEntry!4795 thiss!1504)) lt!131344)))

(declare-fun b!260369 () Bool)

(assert (=> b!260369 (= e!168746 e!168744)))

(declare-fun c!44243 () Bool)

(assert (=> b!260369 (= c!44243 ((_ is MissingVacant!1183) lt!131343))))

(declare-fun bm!24833 () Bool)

(assert (=> bm!24833 (= call!24836 (arrayContainsKey!0 (_keys!6975 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260370 () Bool)

(assert (=> b!260370 (= e!168744 ((_ is Undefined!1183) lt!131343))))

(declare-fun b!260371 () Bool)

(assert (=> b!260371 (= e!168745 (not call!24836))))

(declare-fun b!260372 () Bool)

(declare-fun res!127261 () Bool)

(assert (=> b!260372 (=> (not res!127261) (not e!168745))))

(assert (=> b!260372 (= res!127261 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6905 lt!131343)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260372 (and (bvsge (index!6905 lt!131343) #b00000000000000000000000000000000) (bvslt (index!6905 lt!131343) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun bm!24834 () Bool)

(assert (=> bm!24834 (= call!24837 (inRange!0 (ite c!44244 (index!6902 lt!131343) (index!6905 lt!131343)) (mask!11121 thiss!1504)))))

(declare-fun b!260373 () Bool)

(assert (=> b!260373 (= e!168746 e!168743)))

(declare-fun res!127262 () Bool)

(assert (=> b!260373 (= res!127262 call!24837)))

(assert (=> b!260373 (=> (not res!127262) (not e!168743))))

(assert (= (and d!62497 c!44244) b!260373))

(assert (= (and d!62497 (not c!44244)) b!260369))

(assert (= (and b!260373 res!127262) b!260368))

(assert (= (and b!260368 res!127260) b!260367))

(assert (= (and b!260369 c!44243) b!260366))

(assert (= (and b!260369 (not c!44243)) b!260370))

(assert (= (and b!260366 res!127263) b!260372))

(assert (= (and b!260372 res!127261) b!260371))

(assert (= (or b!260373 b!260366) bm!24834))

(assert (= (or b!260367 b!260371) bm!24833))

(assert (=> d!62497 m!275745))

(declare-fun m!276087 () Bool)

(assert (=> d!62497 m!276087))

(assert (=> d!62497 m!275775))

(declare-fun m!276089 () Bool)

(assert (=> bm!24834 m!276089))

(declare-fun m!276091 () Bool)

(assert (=> b!260368 m!276091))

(declare-fun m!276093 () Bool)

(assert (=> b!260372 m!276093))

(assert (=> bm!24833 m!275759))

(assert (=> b!260075 d!62497))

(declare-fun d!62499 () Bool)

(declare-fun res!127270 () Bool)

(declare-fun e!168749 () Bool)

(assert (=> d!62499 (=> (not res!127270) (not e!168749))))

(declare-fun simpleValid!281 (LongMapFixedSize!3834) Bool)

(assert (=> d!62499 (= res!127270 (simpleValid!281 thiss!1504))))

(assert (=> d!62499 (= (valid!1497 thiss!1504) e!168749)))

(declare-fun b!260380 () Bool)

(declare-fun res!127271 () Bool)

(assert (=> b!260380 (=> (not res!127271) (not e!168749))))

(assert (=> b!260380 (= res!127271 (= (arrayCountValidKeys!0 (_keys!6975 thiss!1504) #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) (_size!1966 thiss!1504)))))

(declare-fun b!260381 () Bool)

(declare-fun res!127272 () Bool)

(assert (=> b!260381 (=> (not res!127272) (not e!168749))))

(assert (=> b!260381 (= res!127272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(declare-fun b!260382 () Bool)

(assert (=> b!260382 (= e!168749 (arrayNoDuplicates!0 (_keys!6975 thiss!1504) #b00000000000000000000000000000000 Nil!3824))))

(assert (= (and d!62499 res!127270) b!260380))

(assert (= (and b!260380 res!127271) b!260381))

(assert (= (and b!260381 res!127272) b!260382))

(declare-fun m!276095 () Bool)

(assert (=> d!62499 m!276095))

(assert (=> b!260380 m!275793))

(declare-fun m!276097 () Bool)

(assert (=> b!260381 m!276097))

(declare-fun m!276099 () Bool)

(assert (=> b!260382 m!276099))

(assert (=> start!24916 d!62499))

(declare-fun b!260389 () Bool)

(declare-fun e!168754 () Bool)

(assert (=> b!260389 (= e!168754 tp_is_empty!6621)))

(declare-fun mapIsEmpty!11288 () Bool)

(declare-fun mapRes!11288 () Bool)

(assert (=> mapIsEmpty!11288 mapRes!11288))

(declare-fun b!260390 () Bool)

(declare-fun e!168755 () Bool)

(assert (=> b!260390 (= e!168755 tp_is_empty!6621)))

(declare-fun mapNonEmpty!11288 () Bool)

(declare-fun tp!23609 () Bool)

(assert (=> mapNonEmpty!11288 (= mapRes!11288 (and tp!23609 e!168754))))

(declare-fun mapKey!11288 () (_ BitVec 32))

(declare-fun mapRest!11288 () (Array (_ BitVec 32) ValueCell!2967))

(declare-fun mapValue!11288 () ValueCell!2967)

(assert (=> mapNonEmpty!11288 (= mapRest!11282 (store mapRest!11288 mapKey!11288 mapValue!11288))))

(declare-fun condMapEmpty!11288 () Bool)

(declare-fun mapDefault!11288 () ValueCell!2967)

(assert (=> mapNonEmpty!11282 (= condMapEmpty!11288 (= mapRest!11282 ((as const (Array (_ BitVec 32) ValueCell!2967)) mapDefault!11288)))))

(assert (=> mapNonEmpty!11282 (= tp!23599 (and e!168755 mapRes!11288))))

(assert (= (and mapNonEmpty!11282 condMapEmpty!11288) mapIsEmpty!11288))

(assert (= (and mapNonEmpty!11282 (not condMapEmpty!11288)) mapNonEmpty!11288))

(assert (= (and mapNonEmpty!11288 ((_ is ValueCellFull!2967) mapValue!11288)) b!260389))

(assert (= (and mapNonEmpty!11282 ((_ is ValueCellFull!2967) mapDefault!11288)) b!260390))

(declare-fun m!276101 () Bool)

(assert (=> mapNonEmpty!11288 m!276101))

(declare-fun b_lambda!8263 () Bool)

(assert (= b_lambda!8259 (or (and b!260073 b_free!6759) b_lambda!8263)))

(declare-fun b_lambda!8265 () Bool)

(assert (= b_lambda!8261 (or (and b!260073 b_free!6759) b_lambda!8265)))

(check-sat (not b!260199) (not b!260342) (not d!62477) (not b!260381) (not b!260341) b_and!13871 (not d!62495) (not b!260336) (not b!260171) (not bm!24795) (not b!260338) (not b!260196) (not d!62451) (not b!260217) (not bm!24818) tp_is_empty!6621 (not d!62455) (not b!260183) (not d!62465) (not bm!24796) (not b!260380) (not b!260147) (not d!62493) (not b!260314) (not d!62487) (not bm!24834) (not b!260346) (not b!260184) (not bm!24820) (not b!260382) (not bm!24816) (not b!260337) (not b!260294) (not bm!24821) (not d!62497) (not b_next!6759) (not b!260218) (not b!260335) (not d!62479) (not b!260165) (not bm!24826) (not b_lambda!8263) (not b!260274) (not b!260328) (not bm!24799) (not bm!24824) (not bm!24792) (not b!260295) (not b!260224) (not b!260326) (not b!260310) (not b!260282) (not b!260276) (not b!260344) (not b!260298) (not bm!24833) (not d!62499) (not b!260284) (not d!62453) (not b!260275) (not mapNonEmpty!11288) (not b!260319) (not b!260273) (not bm!24819) (not d!62459) (not b_lambda!8265) (not d!62481) (not b!260214) (not d!62475) (not b!260203) (not bm!24828) (not b!260308) (not bm!24827) (not b!260279) (not b!260307) (not d!62457) (not b!260316) (not b!260280))
(check-sat b_and!13871 (not b_next!6759))
(get-model)

(declare-fun d!62501 () Bool)

(assert (=> d!62501 (= (validKeyInArray!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)) (and (not (= (select (arr!5963 lt!131133) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5963 lt!131133) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260314 d!62501))

(declare-fun b!260415 () Bool)

(declare-fun e!168775 () ListLongMap!3861)

(assert (=> b!260415 (= e!168775 (ListLongMap!3862 Nil!3823))))

(declare-fun b!260416 () Bool)

(declare-fun e!168770 () ListLongMap!3861)

(declare-fun call!24840 () ListLongMap!3861)

(assert (=> b!260416 (= e!168770 call!24840)))

(declare-fun b!260417 () Bool)

(declare-fun lt!131365 () Unit!8087)

(declare-fun lt!131363 () Unit!8087)

(assert (=> b!260417 (= lt!131365 lt!131363)))

(declare-fun lt!131364 () V!8475)

(declare-fun lt!131362 () (_ BitVec 64))

(declare-fun lt!131361 () (_ BitVec 64))

(declare-fun lt!131360 () ListLongMap!3861)

(assert (=> b!260417 (not (contains!1891 (+!699 lt!131360 (tuple2!4949 lt!131362 lt!131364)) lt!131361))))

(declare-fun addStillNotContains!127 (ListLongMap!3861 (_ BitVec 64) V!8475 (_ BitVec 64)) Unit!8087)

(assert (=> b!260417 (= lt!131363 (addStillNotContains!127 lt!131360 lt!131362 lt!131364 lt!131361))))

(assert (=> b!260417 (= lt!131361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!260417 (= lt!131364 (get!3071 (select (arr!5962 (_values!4778 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260417 (= lt!131362 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260417 (= lt!131360 call!24840)))

(assert (=> b!260417 (= e!168770 (+!699 call!24840 (tuple2!4949 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000) (get!3071 (select (arr!5962 (_values!4778 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!24837 () Bool)

(assert (=> bm!24837 (= call!24840 (getCurrentListMapNoExtraKeys!580 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4795 thiss!1504)))))

(declare-fun b!260418 () Bool)

(declare-fun res!127281 () Bool)

(declare-fun e!168773 () Bool)

(assert (=> b!260418 (=> (not res!127281) (not e!168773))))

(declare-fun lt!131359 () ListLongMap!3861)

(assert (=> b!260418 (= res!127281 (not (contains!1891 lt!131359 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!62503 () Bool)

(assert (=> d!62503 e!168773))

(declare-fun res!127283 () Bool)

(assert (=> d!62503 (=> (not res!127283) (not e!168773))))

(assert (=> d!62503 (= res!127283 (not (contains!1891 lt!131359 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62503 (= lt!131359 e!168775)))

(declare-fun c!44254 () Bool)

(assert (=> d!62503 (= c!44254 (bvsge #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> d!62503 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62503 (= (getCurrentListMapNoExtraKeys!580 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) lt!131359)))

(declare-fun b!260419 () Bool)

(declare-fun e!168772 () Bool)

(assert (=> b!260419 (= e!168772 (= lt!131359 (getCurrentListMapNoExtraKeys!580 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4795 thiss!1504))))))

(declare-fun b!260420 () Bool)

(declare-fun isEmpty!536 (ListLongMap!3861) Bool)

(assert (=> b!260420 (= e!168772 (isEmpty!536 lt!131359))))

(declare-fun b!260421 () Bool)

(declare-fun e!168771 () Bool)

(assert (=> b!260421 (= e!168771 (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260421 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!260422 () Bool)

(assert (=> b!260422 (= e!168775 e!168770)))

(declare-fun c!44255 () Bool)

(assert (=> b!260422 (= c!44255 (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260423 () Bool)

(declare-fun e!168776 () Bool)

(assert (=> b!260423 (= e!168776 e!168772)))

(declare-fun c!44253 () Bool)

(assert (=> b!260423 (= c!44253 (bvslt #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260424 () Bool)

(assert (=> b!260424 (= e!168773 e!168776)))

(declare-fun c!44256 () Bool)

(assert (=> b!260424 (= c!44256 e!168771)))

(declare-fun res!127284 () Bool)

(assert (=> b!260424 (=> (not res!127284) (not e!168771))))

(assert (=> b!260424 (= res!127284 (bvslt #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260425 () Bool)

(assert (=> b!260425 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> b!260425 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6311 (_values!4778 thiss!1504))))))

(declare-fun e!168774 () Bool)

(assert (=> b!260425 (= e!168774 (= (apply!258 lt!131359 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)) (get!3071 (select (arr!5962 (_values!4778 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260426 () Bool)

(assert (=> b!260426 (= e!168776 e!168774)))

(assert (=> b!260426 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun res!127282 () Bool)

(assert (=> b!260426 (= res!127282 (contains!1891 lt!131359 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260426 (=> (not res!127282) (not e!168774))))

(assert (= (and d!62503 c!44254) b!260415))

(assert (= (and d!62503 (not c!44254)) b!260422))

(assert (= (and b!260422 c!44255) b!260417))

(assert (= (and b!260422 (not c!44255)) b!260416))

(assert (= (or b!260417 b!260416) bm!24837))

(assert (= (and d!62503 res!127283) b!260418))

(assert (= (and b!260418 res!127281) b!260424))

(assert (= (and b!260424 res!127284) b!260421))

(assert (= (and b!260424 c!44256) b!260426))

(assert (= (and b!260424 (not c!44256)) b!260423))

(assert (= (and b!260426 res!127282) b!260425))

(assert (= (and b!260423 c!44253) b!260419))

(assert (= (and b!260423 (not c!44253)) b!260420))

(declare-fun b_lambda!8267 () Bool)

(assert (=> (not b_lambda!8267) (not b!260417)))

(assert (=> b!260417 t!8900))

(declare-fun b_and!13873 () Bool)

(assert (= b_and!13871 (and (=> t!8900 result!5409) b_and!13873)))

(declare-fun b_lambda!8269 () Bool)

(assert (=> (not b_lambda!8269) (not b!260425)))

(assert (=> b!260425 t!8900))

(declare-fun b_and!13875 () Bool)

(assert (= b_and!13873 (and (=> t!8900 result!5409) b_and!13875)))

(declare-fun m!276103 () Bool)

(assert (=> b!260418 m!276103))

(assert (=> b!260421 m!275921))

(assert (=> b!260421 m!275921))

(assert (=> b!260421 m!275923))

(assert (=> b!260417 m!275921))

(declare-fun m!276105 () Bool)

(assert (=> b!260417 m!276105))

(assert (=> b!260417 m!276081))

(assert (=> b!260417 m!276081))

(assert (=> b!260417 m!275987))

(assert (=> b!260417 m!276083))

(declare-fun m!276107 () Bool)

(assert (=> b!260417 m!276107))

(assert (=> b!260417 m!275987))

(assert (=> b!260417 m!276107))

(declare-fun m!276109 () Bool)

(assert (=> b!260417 m!276109))

(declare-fun m!276111 () Bool)

(assert (=> b!260417 m!276111))

(assert (=> b!260426 m!275921))

(assert (=> b!260426 m!275921))

(declare-fun m!276113 () Bool)

(assert (=> b!260426 m!276113))

(assert (=> b!260425 m!275921))

(assert (=> b!260425 m!276081))

(assert (=> b!260425 m!276081))

(assert (=> b!260425 m!275987))

(assert (=> b!260425 m!276083))

(assert (=> b!260425 m!275921))

(declare-fun m!276115 () Bool)

(assert (=> b!260425 m!276115))

(assert (=> b!260425 m!275987))

(declare-fun m!276117 () Bool)

(assert (=> b!260420 m!276117))

(assert (=> b!260422 m!275921))

(assert (=> b!260422 m!275921))

(assert (=> b!260422 m!275923))

(declare-fun m!276119 () Bool)

(assert (=> b!260419 m!276119))

(assert (=> bm!24837 m!276119))

(declare-fun m!276121 () Bool)

(assert (=> d!62503 m!276121))

(assert (=> d!62503 m!275775))

(assert (=> bm!24826 d!62503))

(assert (=> d!62475 d!62467))

(declare-fun d!62505 () Bool)

(assert (=> d!62505 (= (arrayCountValidKeys!0 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6975 thiss!1504) #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!62505 true))

(declare-fun _$84!42 () Unit!8087)

(assert (=> d!62505 (= (choose!1 (_keys!6975 thiss!1504) index!297 key!932) _$84!42)))

(declare-fun bs!9165 () Bool)

(assert (= bs!9165 d!62505))

(assert (=> bs!9165 m!275805))

(assert (=> bs!9165 m!276017))

(assert (=> bs!9165 m!275793))

(assert (=> d!62481 d!62505))

(declare-fun b!260427 () Bool)

(declare-fun e!168778 () (_ BitVec 32))

(declare-fun call!24841 () (_ BitVec 32))

(assert (=> b!260427 (= e!168778 (bvadd #b00000000000000000000000000000001 call!24841))))

(declare-fun bm!24838 () Bool)

(assert (=> bm!24838 (= call!24841 (arrayCountValidKeys!0 (_keys!6975 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260428 () Bool)

(declare-fun e!168777 () (_ BitVec 32))

(assert (=> b!260428 (= e!168777 #b00000000000000000000000000000000)))

(declare-fun d!62507 () Bool)

(declare-fun lt!131366 () (_ BitVec 32))

(assert (=> d!62507 (and (bvsge lt!131366 #b00000000000000000000000000000000) (bvsle lt!131366 (bvsub (size!6312 (_keys!6975 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!62507 (= lt!131366 e!168777)))

(declare-fun c!44257 () Bool)

(assert (=> d!62507 (= c!44257 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> d!62507 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6312 (_keys!6975 thiss!1504)) (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> d!62507 (= (arrayCountValidKeys!0 (_keys!6975 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))) lt!131366)))

(declare-fun b!260429 () Bool)

(assert (=> b!260429 (= e!168778 call!24841)))

(declare-fun b!260430 () Bool)

(assert (=> b!260430 (= e!168777 e!168778)))

(declare-fun c!44258 () Bool)

(assert (=> b!260430 (= c!44258 (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62507 c!44257) b!260428))

(assert (= (and d!62507 (not c!44257)) b!260430))

(assert (= (and b!260430 c!44258) b!260427))

(assert (= (and b!260430 (not c!44258)) b!260429))

(assert (= (or b!260427 b!260429) bm!24838))

(declare-fun m!276123 () Bool)

(assert (=> bm!24838 m!276123))

(declare-fun m!276125 () Bool)

(assert (=> b!260430 m!276125))

(assert (=> b!260430 m!276125))

(declare-fun m!276127 () Bool)

(assert (=> b!260430 m!276127))

(assert (=> bm!24795 d!62507))

(declare-fun d!62509 () Bool)

(declare-fun e!168780 () Bool)

(assert (=> d!62509 e!168780))

(declare-fun res!127285 () Bool)

(assert (=> d!62509 (=> res!127285 e!168780)))

(declare-fun lt!131369 () Bool)

(assert (=> d!62509 (= res!127285 (not lt!131369))))

(declare-fun lt!131368 () Bool)

(assert (=> d!62509 (= lt!131369 lt!131368)))

(declare-fun lt!131367 () Unit!8087)

(declare-fun e!168779 () Unit!8087)

(assert (=> d!62509 (= lt!131367 e!168779)))

(declare-fun c!44259 () Bool)

(assert (=> d!62509 (= c!44259 lt!131368)))

(assert (=> d!62509 (= lt!131368 (containsKey!308 (toList!1946 lt!131319) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62509 (= (contains!1891 lt!131319 #b1000000000000000000000000000000000000000000000000000000000000000) lt!131369)))

(declare-fun b!260431 () Bool)

(declare-fun lt!131370 () Unit!8087)

(assert (=> b!260431 (= e!168779 lt!131370)))

(assert (=> b!260431 (= lt!131370 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 lt!131319) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260431 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131319) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260432 () Bool)

(declare-fun Unit!8097 () Unit!8087)

(assert (=> b!260432 (= e!168779 Unit!8097)))

(declare-fun b!260433 () Bool)

(assert (=> b!260433 (= e!168780 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131319) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62509 c!44259) b!260431))

(assert (= (and d!62509 (not c!44259)) b!260432))

(assert (= (and d!62509 (not res!127285)) b!260433))

(declare-fun m!276129 () Bool)

(assert (=> d!62509 m!276129))

(declare-fun m!276131 () Bool)

(assert (=> b!260431 m!276131))

(declare-fun m!276133 () Bool)

(assert (=> b!260431 m!276133))

(assert (=> b!260431 m!276133))

(declare-fun m!276135 () Bool)

(assert (=> b!260431 m!276135))

(assert (=> b!260433 m!276133))

(assert (=> b!260433 m!276133))

(assert (=> b!260433 m!276135))

(assert (=> bm!24827 d!62509))

(declare-fun d!62511 () Bool)

(declare-fun res!127290 () Bool)

(declare-fun e!168785 () Bool)

(assert (=> d!62511 (=> res!127290 e!168785)))

(assert (=> d!62511 (= res!127290 (and ((_ is Cons!3822) (toList!1946 lt!131126)) (= (_1!2485 (h!4486 (toList!1946 lt!131126))) key!932)))))

(assert (=> d!62511 (= (containsKey!308 (toList!1946 lt!131126) key!932) e!168785)))

(declare-fun b!260438 () Bool)

(declare-fun e!168786 () Bool)

(assert (=> b!260438 (= e!168785 e!168786)))

(declare-fun res!127291 () Bool)

(assert (=> b!260438 (=> (not res!127291) (not e!168786))))

(assert (=> b!260438 (= res!127291 (and (or (not ((_ is Cons!3822) (toList!1946 lt!131126))) (bvsle (_1!2485 (h!4486 (toList!1946 lt!131126))) key!932)) ((_ is Cons!3822) (toList!1946 lt!131126)) (bvslt (_1!2485 (h!4486 (toList!1946 lt!131126))) key!932)))))

(declare-fun b!260439 () Bool)

(assert (=> b!260439 (= e!168786 (containsKey!308 (t!8895 (toList!1946 lt!131126)) key!932))))

(assert (= (and d!62511 (not res!127290)) b!260438))

(assert (= (and b!260438 res!127291) b!260439))

(declare-fun m!276137 () Bool)

(assert (=> b!260439 m!276137))

(assert (=> d!62493 d!62511))

(declare-fun b!260449 () Bool)

(declare-fun e!168791 () Option!322)

(declare-fun e!168792 () Option!322)

(assert (=> b!260449 (= e!168791 e!168792)))

(declare-fun c!44265 () Bool)

(assert (=> b!260449 (= c!44265 (and ((_ is Cons!3822) (toList!1946 lt!131292)) (not (= (_1!2485 (h!4486 (toList!1946 lt!131292))) (_1!2485 (tuple2!4949 key!932 v!346))))))))

(declare-fun b!260451 () Bool)

(assert (=> b!260451 (= e!168792 None!320)))

(declare-fun b!260448 () Bool)

(assert (=> b!260448 (= e!168791 (Some!321 (_2!2485 (h!4486 (toList!1946 lt!131292)))))))

(declare-fun d!62513 () Bool)

(declare-fun c!44264 () Bool)

(assert (=> d!62513 (= c!44264 (and ((_ is Cons!3822) (toList!1946 lt!131292)) (= (_1!2485 (h!4486 (toList!1946 lt!131292))) (_1!2485 (tuple2!4949 key!932 v!346)))))))

(assert (=> d!62513 (= (getValueByKey!316 (toList!1946 lt!131292) (_1!2485 (tuple2!4949 key!932 v!346))) e!168791)))

(declare-fun b!260450 () Bool)

(assert (=> b!260450 (= e!168792 (getValueByKey!316 (t!8895 (toList!1946 lt!131292)) (_1!2485 (tuple2!4949 key!932 v!346))))))

(assert (= (and d!62513 c!44264) b!260448))

(assert (= (and d!62513 (not c!44264)) b!260449))

(assert (= (and b!260449 c!44265) b!260450))

(assert (= (and b!260449 (not c!44265)) b!260451))

(declare-fun m!276139 () Bool)

(assert (=> b!260450 m!276139))

(assert (=> b!260294 d!62513))

(declare-fun d!62515 () Bool)

(declare-fun get!3072 (Option!322) V!8475)

(assert (=> d!62515 (= (apply!258 lt!131268 lt!131275) (get!3072 (getValueByKey!316 (toList!1946 lt!131268) lt!131275)))))

(declare-fun bs!9166 () Bool)

(assert (= bs!9166 d!62515))

(declare-fun m!276141 () Bool)

(assert (=> bs!9166 m!276141))

(assert (=> bs!9166 m!276141))

(declare-fun m!276143 () Bool)

(assert (=> bs!9166 m!276143))

(assert (=> b!260284 d!62515))

(declare-fun d!62517 () Bool)

(assert (=> d!62517 (= (apply!258 (+!699 lt!131272 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504))) lt!131264) (get!3072 (getValueByKey!316 (toList!1946 (+!699 lt!131272 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504)))) lt!131264)))))

(declare-fun bs!9167 () Bool)

(assert (= bs!9167 d!62517))

(declare-fun m!276145 () Bool)

(assert (=> bs!9167 m!276145))

(assert (=> bs!9167 m!276145))

(declare-fun m!276147 () Bool)

(assert (=> bs!9167 m!276147))

(assert (=> b!260284 d!62517))

(declare-fun d!62519 () Bool)

(assert (=> d!62519 (= (apply!258 lt!131272 lt!131264) (get!3072 (getValueByKey!316 (toList!1946 lt!131272) lt!131264)))))

(declare-fun bs!9168 () Bool)

(assert (= bs!9168 d!62519))

(declare-fun m!276149 () Bool)

(assert (=> bs!9168 m!276149))

(assert (=> bs!9168 m!276149))

(declare-fun m!276151 () Bool)

(assert (=> bs!9168 m!276151))

(assert (=> b!260284 d!62519))

(declare-fun d!62521 () Bool)

(assert (=> d!62521 (= (apply!258 (+!699 lt!131278 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504))) lt!131267) (apply!258 lt!131278 lt!131267))))

(declare-fun lt!131373 () Unit!8087)

(declare-fun choose!1268 (ListLongMap!3861 (_ BitVec 64) V!8475 (_ BitVec 64)) Unit!8087)

(assert (=> d!62521 (= lt!131373 (choose!1268 lt!131278 lt!131265 (zeroValue!4636 thiss!1504) lt!131267))))

(declare-fun e!168795 () Bool)

(assert (=> d!62521 e!168795))

(declare-fun res!127294 () Bool)

(assert (=> d!62521 (=> (not res!127294) (not e!168795))))

(assert (=> d!62521 (= res!127294 (contains!1891 lt!131278 lt!131267))))

(assert (=> d!62521 (= (addApplyDifferent!234 lt!131278 lt!131265 (zeroValue!4636 thiss!1504) lt!131267) lt!131373)))

(declare-fun b!260455 () Bool)

(assert (=> b!260455 (= e!168795 (not (= lt!131267 lt!131265)))))

(assert (= (and d!62521 res!127294) b!260455))

(declare-fun m!276153 () Bool)

(assert (=> d!62521 m!276153))

(assert (=> d!62521 m!275963))

(assert (=> d!62521 m!275949))

(assert (=> d!62521 m!275949))

(assert (=> d!62521 m!275953))

(declare-fun m!276155 () Bool)

(assert (=> d!62521 m!276155))

(assert (=> b!260284 d!62521))

(declare-fun d!62523 () Bool)

(assert (=> d!62523 (contains!1891 (+!699 lt!131271 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504))) lt!131274)))

(declare-fun lt!131376 () Unit!8087)

(declare-fun choose!1269 (ListLongMap!3861 (_ BitVec 64) V!8475 (_ BitVec 64)) Unit!8087)

(assert (=> d!62523 (= lt!131376 (choose!1269 lt!131271 lt!131277 (zeroValue!4636 thiss!1504) lt!131274))))

(assert (=> d!62523 (contains!1891 lt!131271 lt!131274)))

(assert (=> d!62523 (= (addStillContains!234 lt!131271 lt!131277 (zeroValue!4636 thiss!1504) lt!131274) lt!131376)))

(declare-fun bs!9169 () Bool)

(assert (= bs!9169 d!62523))

(assert (=> bs!9169 m!275973))

(assert (=> bs!9169 m!275973))

(assert (=> bs!9169 m!275975))

(declare-fun m!276157 () Bool)

(assert (=> bs!9169 m!276157))

(declare-fun m!276159 () Bool)

(assert (=> bs!9169 m!276159))

(assert (=> b!260284 d!62523))

(declare-fun d!62525 () Bool)

(declare-fun e!168796 () Bool)

(assert (=> d!62525 e!168796))

(declare-fun res!127295 () Bool)

(assert (=> d!62525 (=> (not res!127295) (not e!168796))))

(declare-fun lt!131378 () ListLongMap!3861)

(assert (=> d!62525 (= res!127295 (contains!1891 lt!131378 (_1!2485 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504)))))))

(declare-fun lt!131380 () List!3826)

(assert (=> d!62525 (= lt!131378 (ListLongMap!3862 lt!131380))))

(declare-fun lt!131379 () Unit!8087)

(declare-fun lt!131377 () Unit!8087)

(assert (=> d!62525 (= lt!131379 lt!131377)))

(assert (=> d!62525 (= (getValueByKey!316 lt!131380 (_1!2485 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62525 (= lt!131377 (lemmaContainsTupThenGetReturnValue!172 lt!131380 (_1!2485 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62525 (= lt!131380 (insertStrictlySorted!175 (toList!1946 lt!131278) (_1!2485 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62525 (= (+!699 lt!131278 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504))) lt!131378)))

(declare-fun b!260457 () Bool)

(declare-fun res!127296 () Bool)

(assert (=> b!260457 (=> (not res!127296) (not e!168796))))

(assert (=> b!260457 (= res!127296 (= (getValueByKey!316 (toList!1946 lt!131378) (_1!2485 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504))))))))

(declare-fun b!260458 () Bool)

(assert (=> b!260458 (= e!168796 (contains!1893 (toList!1946 lt!131378) (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504))))))

(assert (= (and d!62525 res!127295) b!260457))

(assert (= (and b!260457 res!127296) b!260458))

(declare-fun m!276161 () Bool)

(assert (=> d!62525 m!276161))

(declare-fun m!276163 () Bool)

(assert (=> d!62525 m!276163))

(declare-fun m!276165 () Bool)

(assert (=> d!62525 m!276165))

(declare-fun m!276167 () Bool)

(assert (=> d!62525 m!276167))

(declare-fun m!276169 () Bool)

(assert (=> b!260457 m!276169))

(declare-fun m!276171 () Bool)

(assert (=> b!260458 m!276171))

(assert (=> b!260284 d!62525))

(declare-fun d!62527 () Bool)

(assert (=> d!62527 (= (apply!258 (+!699 lt!131268 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504))) lt!131275) (get!3072 (getValueByKey!316 (toList!1946 (+!699 lt!131268 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504)))) lt!131275)))))

(declare-fun bs!9170 () Bool)

(assert (= bs!9170 d!62527))

(declare-fun m!276173 () Bool)

(assert (=> bs!9170 m!276173))

(assert (=> bs!9170 m!276173))

(declare-fun m!276175 () Bool)

(assert (=> bs!9170 m!276175))

(assert (=> b!260284 d!62527))

(declare-fun d!62529 () Bool)

(declare-fun e!168798 () Bool)

(assert (=> d!62529 e!168798))

(declare-fun res!127297 () Bool)

(assert (=> d!62529 (=> res!127297 e!168798)))

(declare-fun lt!131383 () Bool)

(assert (=> d!62529 (= res!127297 (not lt!131383))))

(declare-fun lt!131382 () Bool)

(assert (=> d!62529 (= lt!131383 lt!131382)))

(declare-fun lt!131381 () Unit!8087)

(declare-fun e!168797 () Unit!8087)

(assert (=> d!62529 (= lt!131381 e!168797)))

(declare-fun c!44266 () Bool)

(assert (=> d!62529 (= c!44266 lt!131382)))

(assert (=> d!62529 (= lt!131382 (containsKey!308 (toList!1946 (+!699 lt!131271 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504)))) lt!131274))))

(assert (=> d!62529 (= (contains!1891 (+!699 lt!131271 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504))) lt!131274) lt!131383)))

(declare-fun b!260459 () Bool)

(declare-fun lt!131384 () Unit!8087)

(assert (=> b!260459 (= e!168797 lt!131384)))

(assert (=> b!260459 (= lt!131384 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 (+!699 lt!131271 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504)))) lt!131274))))

(assert (=> b!260459 (isDefined!257 (getValueByKey!316 (toList!1946 (+!699 lt!131271 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504)))) lt!131274))))

(declare-fun b!260460 () Bool)

(declare-fun Unit!8098 () Unit!8087)

(assert (=> b!260460 (= e!168797 Unit!8098)))

(declare-fun b!260461 () Bool)

(assert (=> b!260461 (= e!168798 (isDefined!257 (getValueByKey!316 (toList!1946 (+!699 lt!131271 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504)))) lt!131274)))))

(assert (= (and d!62529 c!44266) b!260459))

(assert (= (and d!62529 (not c!44266)) b!260460))

(assert (= (and d!62529 (not res!127297)) b!260461))

(declare-fun m!276177 () Bool)

(assert (=> d!62529 m!276177))

(declare-fun m!276179 () Bool)

(assert (=> b!260459 m!276179))

(declare-fun m!276181 () Bool)

(assert (=> b!260459 m!276181))

(assert (=> b!260459 m!276181))

(declare-fun m!276183 () Bool)

(assert (=> b!260459 m!276183))

(assert (=> b!260461 m!276181))

(assert (=> b!260461 m!276181))

(assert (=> b!260461 m!276183))

(assert (=> b!260284 d!62529))

(declare-fun d!62531 () Bool)

(declare-fun e!168799 () Bool)

(assert (=> d!62531 e!168799))

(declare-fun res!127298 () Bool)

(assert (=> d!62531 (=> (not res!127298) (not e!168799))))

(declare-fun lt!131386 () ListLongMap!3861)

(assert (=> d!62531 (= res!127298 (contains!1891 lt!131386 (_1!2485 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504)))))))

(declare-fun lt!131388 () List!3826)

(assert (=> d!62531 (= lt!131386 (ListLongMap!3862 lt!131388))))

(declare-fun lt!131387 () Unit!8087)

(declare-fun lt!131385 () Unit!8087)

(assert (=> d!62531 (= lt!131387 lt!131385)))

(assert (=> d!62531 (= (getValueByKey!316 lt!131388 (_1!2485 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504)))))))

(assert (=> d!62531 (= lt!131385 (lemmaContainsTupThenGetReturnValue!172 lt!131388 (_1!2485 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504)))))))

(assert (=> d!62531 (= lt!131388 (insertStrictlySorted!175 (toList!1946 lt!131268) (_1!2485 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504)))))))

(assert (=> d!62531 (= (+!699 lt!131268 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504))) lt!131386)))

(declare-fun b!260462 () Bool)

(declare-fun res!127299 () Bool)

(assert (=> b!260462 (=> (not res!127299) (not e!168799))))

(assert (=> b!260462 (= res!127299 (= (getValueByKey!316 (toList!1946 lt!131386) (_1!2485 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504))))))))

(declare-fun b!260463 () Bool)

(assert (=> b!260463 (= e!168799 (contains!1893 (toList!1946 lt!131386) (tuple2!4949 lt!131281 (minValue!4636 thiss!1504))))))

(assert (= (and d!62531 res!127298) b!260462))

(assert (= (and b!260462 res!127299) b!260463))

(declare-fun m!276185 () Bool)

(assert (=> d!62531 m!276185))

(declare-fun m!276187 () Bool)

(assert (=> d!62531 m!276187))

(declare-fun m!276189 () Bool)

(assert (=> d!62531 m!276189))

(declare-fun m!276191 () Bool)

(assert (=> d!62531 m!276191))

(declare-fun m!276193 () Bool)

(assert (=> b!260462 m!276193))

(declare-fun m!276195 () Bool)

(assert (=> b!260463 m!276195))

(assert (=> b!260284 d!62531))

(declare-fun d!62533 () Bool)

(assert (=> d!62533 (= (apply!258 (+!699 lt!131272 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504))) lt!131264) (apply!258 lt!131272 lt!131264))))

(declare-fun lt!131389 () Unit!8087)

(assert (=> d!62533 (= lt!131389 (choose!1268 lt!131272 lt!131262 (minValue!4636 thiss!1504) lt!131264))))

(declare-fun e!168800 () Bool)

(assert (=> d!62533 e!168800))

(declare-fun res!127300 () Bool)

(assert (=> d!62533 (=> (not res!127300) (not e!168800))))

(assert (=> d!62533 (= res!127300 (contains!1891 lt!131272 lt!131264))))

(assert (=> d!62533 (= (addApplyDifferent!234 lt!131272 lt!131262 (minValue!4636 thiss!1504) lt!131264) lt!131389)))

(declare-fun b!260464 () Bool)

(assert (=> b!260464 (= e!168800 (not (= lt!131264 lt!131262)))))

(assert (= (and d!62533 res!127300) b!260464))

(declare-fun m!276197 () Bool)

(assert (=> d!62533 m!276197))

(assert (=> d!62533 m!275951))

(assert (=> d!62533 m!275965))

(assert (=> d!62533 m!275965))

(assert (=> d!62533 m!275967))

(declare-fun m!276199 () Bool)

(assert (=> d!62533 m!276199))

(assert (=> b!260284 d!62533))

(declare-fun d!62535 () Bool)

(assert (=> d!62535 (= (apply!258 (+!699 lt!131278 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504))) lt!131267) (get!3072 (getValueByKey!316 (toList!1946 (+!699 lt!131278 (tuple2!4949 lt!131265 (zeroValue!4636 thiss!1504)))) lt!131267)))))

(declare-fun bs!9171 () Bool)

(assert (= bs!9171 d!62535))

(declare-fun m!276201 () Bool)

(assert (=> bs!9171 m!276201))

(assert (=> bs!9171 m!276201))

(declare-fun m!276203 () Bool)

(assert (=> bs!9171 m!276203))

(assert (=> b!260284 d!62535))

(declare-fun d!62537 () Bool)

(declare-fun e!168801 () Bool)

(assert (=> d!62537 e!168801))

(declare-fun res!127301 () Bool)

(assert (=> d!62537 (=> (not res!127301) (not e!168801))))

(declare-fun lt!131391 () ListLongMap!3861)

(assert (=> d!62537 (= res!127301 (contains!1891 lt!131391 (_1!2485 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504)))))))

(declare-fun lt!131393 () List!3826)

(assert (=> d!62537 (= lt!131391 (ListLongMap!3862 lt!131393))))

(declare-fun lt!131392 () Unit!8087)

(declare-fun lt!131390 () Unit!8087)

(assert (=> d!62537 (= lt!131392 lt!131390)))

(assert (=> d!62537 (= (getValueByKey!316 lt!131393 (_1!2485 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504)))))))

(assert (=> d!62537 (= lt!131390 (lemmaContainsTupThenGetReturnValue!172 lt!131393 (_1!2485 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504)))))))

(assert (=> d!62537 (= lt!131393 (insertStrictlySorted!175 (toList!1946 lt!131272) (_1!2485 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504)))))))

(assert (=> d!62537 (= (+!699 lt!131272 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504))) lt!131391)))

(declare-fun b!260465 () Bool)

(declare-fun res!127302 () Bool)

(assert (=> b!260465 (=> (not res!127302) (not e!168801))))

(assert (=> b!260465 (= res!127302 (= (getValueByKey!316 (toList!1946 lt!131391) (_1!2485 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131262 (minValue!4636 thiss!1504))))))))

(declare-fun b!260466 () Bool)

(assert (=> b!260466 (= e!168801 (contains!1893 (toList!1946 lt!131391) (tuple2!4949 lt!131262 (minValue!4636 thiss!1504))))))

(assert (= (and d!62537 res!127301) b!260465))

(assert (= (and b!260465 res!127302) b!260466))

(declare-fun m!276205 () Bool)

(assert (=> d!62537 m!276205))

(declare-fun m!276207 () Bool)

(assert (=> d!62537 m!276207))

(declare-fun m!276209 () Bool)

(assert (=> d!62537 m!276209))

(declare-fun m!276211 () Bool)

(assert (=> d!62537 m!276211))

(declare-fun m!276213 () Bool)

(assert (=> b!260465 m!276213))

(declare-fun m!276215 () Bool)

(assert (=> b!260466 m!276215))

(assert (=> b!260284 d!62537))

(declare-fun d!62539 () Bool)

(declare-fun e!168802 () Bool)

(assert (=> d!62539 e!168802))

(declare-fun res!127303 () Bool)

(assert (=> d!62539 (=> (not res!127303) (not e!168802))))

(declare-fun lt!131395 () ListLongMap!3861)

(assert (=> d!62539 (= res!127303 (contains!1891 lt!131395 (_1!2485 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504)))))))

(declare-fun lt!131397 () List!3826)

(assert (=> d!62539 (= lt!131395 (ListLongMap!3862 lt!131397))))

(declare-fun lt!131396 () Unit!8087)

(declare-fun lt!131394 () Unit!8087)

(assert (=> d!62539 (= lt!131396 lt!131394)))

(assert (=> d!62539 (= (getValueByKey!316 lt!131397 (_1!2485 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62539 (= lt!131394 (lemmaContainsTupThenGetReturnValue!172 lt!131397 (_1!2485 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62539 (= lt!131397 (insertStrictlySorted!175 (toList!1946 lt!131271) (_1!2485 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62539 (= (+!699 lt!131271 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504))) lt!131395)))

(declare-fun b!260467 () Bool)

(declare-fun res!127304 () Bool)

(assert (=> b!260467 (=> (not res!127304) (not e!168802))))

(assert (=> b!260467 (= res!127304 (= (getValueByKey!316 (toList!1946 lt!131395) (_1!2485 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504))))))))

(declare-fun b!260468 () Bool)

(assert (=> b!260468 (= e!168802 (contains!1893 (toList!1946 lt!131395) (tuple2!4949 lt!131277 (zeroValue!4636 thiss!1504))))))

(assert (= (and d!62539 res!127303) b!260467))

(assert (= (and b!260467 res!127304) b!260468))

(declare-fun m!276217 () Bool)

(assert (=> d!62539 m!276217))

(declare-fun m!276219 () Bool)

(assert (=> d!62539 m!276219))

(declare-fun m!276221 () Bool)

(assert (=> d!62539 m!276221))

(declare-fun m!276223 () Bool)

(assert (=> d!62539 m!276223))

(declare-fun m!276225 () Bool)

(assert (=> b!260467 m!276225))

(declare-fun m!276227 () Bool)

(assert (=> b!260468 m!276227))

(assert (=> b!260284 d!62539))

(declare-fun d!62541 () Bool)

(assert (=> d!62541 (= (apply!258 (+!699 lt!131268 (tuple2!4949 lt!131281 (minValue!4636 thiss!1504))) lt!131275) (apply!258 lt!131268 lt!131275))))

(declare-fun lt!131398 () Unit!8087)

(assert (=> d!62541 (= lt!131398 (choose!1268 lt!131268 lt!131281 (minValue!4636 thiss!1504) lt!131275))))

(declare-fun e!168803 () Bool)

(assert (=> d!62541 e!168803))

(declare-fun res!127305 () Bool)

(assert (=> d!62541 (=> (not res!127305) (not e!168803))))

(assert (=> d!62541 (= res!127305 (contains!1891 lt!131268 lt!131275))))

(assert (=> d!62541 (= (addApplyDifferent!234 lt!131268 lt!131281 (minValue!4636 thiss!1504) lt!131275) lt!131398)))

(declare-fun b!260469 () Bool)

(assert (=> b!260469 (= e!168803 (not (= lt!131275 lt!131281)))))

(assert (= (and d!62541 res!127305) b!260469))

(declare-fun m!276229 () Bool)

(assert (=> d!62541 m!276229))

(assert (=> d!62541 m!275955))

(assert (=> d!62541 m!275969))

(assert (=> d!62541 m!275969))

(assert (=> d!62541 m!275971))

(declare-fun m!276231 () Bool)

(assert (=> d!62541 m!276231))

(assert (=> b!260284 d!62541))

(declare-fun d!62543 () Bool)

(assert (=> d!62543 (= (apply!258 lt!131278 lt!131267) (get!3072 (getValueByKey!316 (toList!1946 lt!131278) lt!131267)))))

(declare-fun bs!9172 () Bool)

(assert (= bs!9172 d!62543))

(declare-fun m!276233 () Bool)

(assert (=> bs!9172 m!276233))

(assert (=> bs!9172 m!276233))

(declare-fun m!276235 () Bool)

(assert (=> bs!9172 m!276235))

(assert (=> b!260284 d!62543))

(declare-fun b!260470 () Bool)

(declare-fun e!168809 () ListLongMap!3861)

(assert (=> b!260470 (= e!168809 (ListLongMap!3862 Nil!3823))))

(declare-fun b!260471 () Bool)

(declare-fun e!168804 () ListLongMap!3861)

(declare-fun call!24842 () ListLongMap!3861)

(assert (=> b!260471 (= e!168804 call!24842)))

(declare-fun b!260472 () Bool)

(declare-fun lt!131405 () Unit!8087)

(declare-fun lt!131403 () Unit!8087)

(assert (=> b!260472 (= lt!131405 lt!131403)))

(declare-fun lt!131401 () (_ BitVec 64))

(declare-fun lt!131400 () ListLongMap!3861)

(declare-fun lt!131402 () (_ BitVec 64))

(declare-fun lt!131404 () V!8475)

(assert (=> b!260472 (not (contains!1891 (+!699 lt!131400 (tuple2!4949 lt!131402 lt!131404)) lt!131401))))

(assert (=> b!260472 (= lt!131403 (addStillNotContains!127 lt!131400 lt!131402 lt!131404 lt!131401))))

(assert (=> b!260472 (= lt!131401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!260472 (= lt!131404 (get!3071 (select (arr!5962 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!260472 (= lt!131402 (select (arr!5963 lt!131133) #b00000000000000000000000000000000))))

(assert (=> b!260472 (= lt!131400 call!24842)))

(assert (=> b!260472 (= e!168804 (+!699 call!24842 (tuple2!4949 (select (arr!5963 lt!131133) #b00000000000000000000000000000000) (get!3071 (select (arr!5962 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!24839 () Bool)

(assert (=> bm!24839 (= call!24842 (getCurrentListMapNoExtraKeys!580 lt!131133 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4795 thiss!1504)))))

(declare-fun b!260473 () Bool)

(declare-fun res!127306 () Bool)

(declare-fun e!168807 () Bool)

(assert (=> b!260473 (=> (not res!127306) (not e!168807))))

(declare-fun lt!131399 () ListLongMap!3861)

(assert (=> b!260473 (= res!127306 (not (contains!1891 lt!131399 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!62545 () Bool)

(assert (=> d!62545 e!168807))

(declare-fun res!127308 () Bool)

(assert (=> d!62545 (=> (not res!127308) (not e!168807))))

(assert (=> d!62545 (= res!127308 (not (contains!1891 lt!131399 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62545 (= lt!131399 e!168809)))

(declare-fun c!44268 () Bool)

(assert (=> d!62545 (= c!44268 (bvsge #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(assert (=> d!62545 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62545 (= (getCurrentListMapNoExtraKeys!580 lt!131133 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) lt!131399)))

(declare-fun b!260474 () Bool)

(declare-fun e!168806 () Bool)

(assert (=> b!260474 (= e!168806 (= lt!131399 (getCurrentListMapNoExtraKeys!580 lt!131133 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4795 thiss!1504))))))

(declare-fun b!260475 () Bool)

(assert (=> b!260475 (= e!168806 (isEmpty!536 lt!131399))))

(declare-fun b!260476 () Bool)

(declare-fun e!168805 () Bool)

(assert (=> b!260476 (= e!168805 (validKeyInArray!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(assert (=> b!260476 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!260477 () Bool)

(assert (=> b!260477 (= e!168809 e!168804)))

(declare-fun c!44269 () Bool)

(assert (=> b!260477 (= c!44269 (validKeyInArray!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(declare-fun b!260478 () Bool)

(declare-fun e!168810 () Bool)

(assert (=> b!260478 (= e!168810 e!168806)))

(declare-fun c!44267 () Bool)

(assert (=> b!260478 (= c!44267 (bvslt #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(declare-fun b!260479 () Bool)

(assert (=> b!260479 (= e!168807 e!168810)))

(declare-fun c!44270 () Bool)

(assert (=> b!260479 (= c!44270 e!168805)))

(declare-fun res!127309 () Bool)

(assert (=> b!260479 (=> (not res!127309) (not e!168805))))

(assert (=> b!260479 (= res!127309 (bvslt #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(declare-fun b!260480 () Bool)

(assert (=> b!260480 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(assert (=> b!260480 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6311 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))))))))

(declare-fun e!168808 () Bool)

(assert (=> b!260480 (= e!168808 (= (apply!258 lt!131399 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)) (get!3071 (select (arr!5962 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!260481 () Bool)

(assert (=> b!260481 (= e!168810 e!168808)))

(assert (=> b!260481 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 lt!131133)))))

(declare-fun res!127307 () Bool)

(assert (=> b!260481 (= res!127307 (contains!1891 lt!131399 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(assert (=> b!260481 (=> (not res!127307) (not e!168808))))

(assert (= (and d!62545 c!44268) b!260470))

(assert (= (and d!62545 (not c!44268)) b!260477))

(assert (= (and b!260477 c!44269) b!260472))

(assert (= (and b!260477 (not c!44269)) b!260471))

(assert (= (or b!260472 b!260471) bm!24839))

(assert (= (and d!62545 res!127308) b!260473))

(assert (= (and b!260473 res!127306) b!260479))

(assert (= (and b!260479 res!127309) b!260476))

(assert (= (and b!260479 c!44270) b!260481))

(assert (= (and b!260479 (not c!44270)) b!260478))

(assert (= (and b!260481 res!127307) b!260480))

(assert (= (and b!260478 c!44267) b!260474))

(assert (= (and b!260478 (not c!44267)) b!260475))

(declare-fun b_lambda!8271 () Bool)

(assert (=> (not b_lambda!8271) (not b!260472)))

(assert (=> b!260472 t!8900))

(declare-fun b_and!13877 () Bool)

(assert (= b_and!13875 (and (=> t!8900 result!5409) b_and!13877)))

(declare-fun b_lambda!8273 () Bool)

(assert (=> (not b_lambda!8273) (not b!260480)))

(assert (=> b!260480 t!8900))

(declare-fun b_and!13879 () Bool)

(assert (= b_and!13877 (and (=> t!8900 result!5409) b_and!13879)))

(declare-fun m!276237 () Bool)

(assert (=> b!260473 m!276237))

(assert (=> b!260476 m!275909))

(assert (=> b!260476 m!275909))

(assert (=> b!260476 m!275917))

(assert (=> b!260472 m!275909))

(declare-fun m!276239 () Bool)

(assert (=> b!260472 m!276239))

(assert (=> b!260472 m!275985))

(assert (=> b!260472 m!275985))

(assert (=> b!260472 m!275987))

(assert (=> b!260472 m!275989))

(declare-fun m!276241 () Bool)

(assert (=> b!260472 m!276241))

(assert (=> b!260472 m!275987))

(assert (=> b!260472 m!276241))

(declare-fun m!276243 () Bool)

(assert (=> b!260472 m!276243))

(declare-fun m!276245 () Bool)

(assert (=> b!260472 m!276245))

(assert (=> b!260481 m!275909))

(assert (=> b!260481 m!275909))

(declare-fun m!276247 () Bool)

(assert (=> b!260481 m!276247))

(assert (=> b!260480 m!275909))

(assert (=> b!260480 m!275985))

(assert (=> b!260480 m!275985))

(assert (=> b!260480 m!275987))

(assert (=> b!260480 m!275989))

(assert (=> b!260480 m!275909))

(declare-fun m!276249 () Bool)

(assert (=> b!260480 m!276249))

(assert (=> b!260480 m!275987))

(declare-fun m!276251 () Bool)

(assert (=> b!260475 m!276251))

(assert (=> b!260477 m!275909))

(assert (=> b!260477 m!275909))

(assert (=> b!260477 m!275917))

(declare-fun m!276253 () Bool)

(assert (=> b!260474 m!276253))

(assert (=> bm!24839 m!276253))

(declare-fun m!276255 () Bool)

(assert (=> d!62545 m!276255))

(assert (=> d!62545 m!275775))

(assert (=> b!260284 d!62545))

(declare-fun d!62547 () Bool)

(declare-fun lt!131408 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!172 (List!3827) (InoxSet (_ BitVec 64)))

(assert (=> d!62547 (= lt!131408 (select (content!172 Nil!3824) (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(declare-fun e!168816 () Bool)

(assert (=> d!62547 (= lt!131408 e!168816)))

(declare-fun res!127315 () Bool)

(assert (=> d!62547 (=> (not res!127315) (not e!168816))))

(assert (=> d!62547 (= res!127315 ((_ is Cons!3823) Nil!3824))))

(assert (=> d!62547 (= (contains!1892 Nil!3824 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)) lt!131408)))

(declare-fun b!260486 () Bool)

(declare-fun e!168815 () Bool)

(assert (=> b!260486 (= e!168816 e!168815)))

(declare-fun res!127314 () Bool)

(assert (=> b!260486 (=> res!127314 e!168815)))

(assert (=> b!260486 (= res!127314 (= (h!4487 Nil!3824) (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(declare-fun b!260487 () Bool)

(assert (=> b!260487 (= e!168815 (contains!1892 (t!8896 Nil!3824) (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(assert (= (and d!62547 res!127315) b!260486))

(assert (= (and b!260486 (not res!127314)) b!260487))

(declare-fun m!276257 () Bool)

(assert (=> d!62547 m!276257))

(assert (=> d!62547 m!275909))

(declare-fun m!276259 () Bool)

(assert (=> d!62547 m!276259))

(assert (=> b!260487 m!275909))

(declare-fun m!276261 () Bool)

(assert (=> b!260487 m!276261))

(assert (=> b!260214 d!62547))

(declare-fun d!62549 () Bool)

(declare-fun e!168817 () Bool)

(assert (=> d!62549 e!168817))

(declare-fun res!127316 () Bool)

(assert (=> d!62549 (=> (not res!127316) (not e!168817))))

(declare-fun lt!131410 () ListLongMap!3861)

(assert (=> d!62549 (= res!127316 (contains!1891 lt!131410 (_1!2485 (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))))

(declare-fun lt!131412 () List!3826)

(assert (=> d!62549 (= lt!131410 (ListLongMap!3862 lt!131412))))

(declare-fun lt!131411 () Unit!8087)

(declare-fun lt!131409 () Unit!8087)

(assert (=> d!62549 (= lt!131411 lt!131409)))

(assert (=> d!62549 (= (getValueByKey!316 lt!131412 (_1!2485 (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))) (Some!321 (_2!2485 (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))))

(assert (=> d!62549 (= lt!131409 (lemmaContainsTupThenGetReturnValue!172 lt!131412 (_1!2485 (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))) (_2!2485 (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))))

(assert (=> d!62549 (= lt!131412 (insertStrictlySorted!175 (toList!1946 (ite c!44236 call!24828 (ite c!44235 call!24827 call!24830))) (_1!2485 (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))) (_2!2485 (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))))

(assert (=> d!62549 (= (+!699 (ite c!44236 call!24828 (ite c!44235 call!24827 call!24830)) (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))) lt!131410)))

(declare-fun b!260488 () Bool)

(declare-fun res!127317 () Bool)

(assert (=> b!260488 (=> (not res!127317) (not e!168817))))

(assert (=> b!260488 (= res!127317 (= (getValueByKey!316 (toList!1946 lt!131410) (_1!2485 (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))) (Some!321 (_2!2485 (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))))

(declare-fun b!260489 () Bool)

(assert (=> b!260489 (= e!168817 (contains!1893 (toList!1946 lt!131410) (ite (or c!44236 c!44235) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (= (and d!62549 res!127316) b!260488))

(assert (= (and b!260488 res!127317) b!260489))

(declare-fun m!276263 () Bool)

(assert (=> d!62549 m!276263))

(declare-fun m!276265 () Bool)

(assert (=> d!62549 m!276265))

(declare-fun m!276267 () Bool)

(assert (=> d!62549 m!276267))

(declare-fun m!276269 () Bool)

(assert (=> d!62549 m!276269))

(declare-fun m!276271 () Bool)

(assert (=> b!260488 m!276271))

(declare-fun m!276273 () Bool)

(assert (=> b!260489 m!276273))

(assert (=> bm!24828 d!62549))

(declare-fun b!260490 () Bool)

(declare-fun e!168819 () Bool)

(assert (=> b!260490 (= e!168819 (contains!1892 (ite c!44209 (Cons!3823 (select (arr!5963 lt!131133) #b00000000000000000000000000000000) Nil!3824) Nil!3824) (select (arr!5963 lt!131133) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!260491 () Bool)

(declare-fun e!168820 () Bool)

(declare-fun call!24843 () Bool)

(assert (=> b!260491 (= e!168820 call!24843)))

(declare-fun c!44271 () Bool)

(declare-fun bm!24840 () Bool)

(assert (=> bm!24840 (= call!24843 (arrayNoDuplicates!0 lt!131133 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44271 (Cons!3823 (select (arr!5963 lt!131133) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44209 (Cons!3823 (select (arr!5963 lt!131133) #b00000000000000000000000000000000) Nil!3824) Nil!3824)) (ite c!44209 (Cons!3823 (select (arr!5963 lt!131133) #b00000000000000000000000000000000) Nil!3824) Nil!3824))))))

(declare-fun b!260492 () Bool)

(assert (=> b!260492 (= e!168820 call!24843)))

(declare-fun b!260493 () Bool)

(declare-fun e!168821 () Bool)

(declare-fun e!168818 () Bool)

(assert (=> b!260493 (= e!168821 e!168818)))

(declare-fun res!127320 () Bool)

(assert (=> b!260493 (=> (not res!127320) (not e!168818))))

(assert (=> b!260493 (= res!127320 (not e!168819))))

(declare-fun res!127319 () Bool)

(assert (=> b!260493 (=> (not res!127319) (not e!168819))))

(assert (=> b!260493 (= res!127319 (validKeyInArray!0 (select (arr!5963 lt!131133) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!260494 () Bool)

(assert (=> b!260494 (= e!168818 e!168820)))

(assert (=> b!260494 (= c!44271 (validKeyInArray!0 (select (arr!5963 lt!131133) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62551 () Bool)

(declare-fun res!127318 () Bool)

(assert (=> d!62551 (=> res!127318 e!168821)))

(assert (=> d!62551 (= res!127318 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 lt!131133)))))

(assert (=> d!62551 (= (arrayNoDuplicates!0 lt!131133 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44209 (Cons!3823 (select (arr!5963 lt!131133) #b00000000000000000000000000000000) Nil!3824) Nil!3824)) e!168821)))

(assert (= (and d!62551 (not res!127318)) b!260493))

(assert (= (and b!260493 res!127319) b!260490))

(assert (= (and b!260493 res!127320) b!260494))

(assert (= (and b!260494 c!44271) b!260491))

(assert (= (and b!260494 (not c!44271)) b!260492))

(assert (= (or b!260491 b!260492) bm!24840))

(declare-fun m!276275 () Bool)

(assert (=> b!260490 m!276275))

(assert (=> b!260490 m!276275))

(declare-fun m!276277 () Bool)

(assert (=> b!260490 m!276277))

(assert (=> bm!24840 m!276275))

(declare-fun m!276279 () Bool)

(assert (=> bm!24840 m!276279))

(assert (=> b!260493 m!276275))

(assert (=> b!260493 m!276275))

(declare-fun m!276281 () Bool)

(assert (=> b!260493 m!276281))

(assert (=> b!260494 m!276275))

(assert (=> b!260494 m!276275))

(assert (=> b!260494 m!276281))

(assert (=> bm!24799 d!62551))

(assert (=> d!62451 d!62453))

(declare-fun d!62553 () Bool)

(declare-fun e!168824 () Bool)

(assert (=> d!62553 e!168824))

(declare-fun res!127326 () Bool)

(assert (=> d!62553 (=> (not res!127326) (not e!168824))))

(declare-fun lt!131415 () SeekEntryResult!1183)

(assert (=> d!62553 (= res!127326 ((_ is Found!1183) lt!131415))))

(assert (=> d!62553 (= lt!131415 (seekEntryOrOpen!0 key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(assert (=> d!62553 true))

(declare-fun _$33!180 () Unit!8087)

(assert (=> d!62553 (= (choose!1264 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 (defaultEntry!4795 thiss!1504)) _$33!180)))

(declare-fun b!260499 () Bool)

(declare-fun res!127325 () Bool)

(assert (=> b!260499 (=> (not res!127325) (not e!168824))))

(assert (=> b!260499 (= res!127325 (inRange!0 (index!6903 lt!131415) (mask!11121 thiss!1504)))))

(declare-fun b!260500 () Bool)

(assert (=> b!260500 (= e!168824 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6903 lt!131415)) key!932))))

(assert (= (and d!62553 res!127326) b!260499))

(assert (= (and b!260499 res!127325) b!260500))

(assert (=> d!62553 m!275745))

(declare-fun m!276283 () Bool)

(assert (=> b!260499 m!276283))

(declare-fun m!276285 () Bool)

(assert (=> b!260500 m!276285))

(assert (=> d!62451 d!62553))

(assert (=> d!62451 d!62467))

(assert (=> b!260380 d!62463))

(declare-fun d!62555 () Bool)

(assert (=> d!62555 (= (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260335 d!62555))

(declare-fun d!62557 () Bool)

(declare-fun res!127327 () Bool)

(declare-fun e!168825 () Bool)

(assert (=> d!62557 (=> res!127327 e!168825)))

(assert (=> d!62557 (= res!127327 (= (select (arr!5963 (_keys!6975 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62557 (= (arrayContainsKey!0 (_keys!6975 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!168825)))

(declare-fun b!260501 () Bool)

(declare-fun e!168826 () Bool)

(assert (=> b!260501 (= e!168825 e!168826)))

(declare-fun res!127328 () Bool)

(assert (=> b!260501 (=> (not res!127328) (not e!168826))))

(assert (=> b!260501 (= res!127328 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260502 () Bool)

(assert (=> b!260502 (= e!168826 (arrayContainsKey!0 (_keys!6975 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62557 (not res!127327)) b!260501))

(assert (= (and b!260501 res!127328) b!260502))

(assert (=> d!62557 m!276125))

(declare-fun m!276287 () Bool)

(assert (=> b!260502 m!276287))

(assert (=> b!260316 d!62557))

(assert (=> b!260217 d!62501))

(assert (=> b!260218 d!62501))

(declare-fun d!62559 () Bool)

(assert (=> d!62559 (= (apply!258 lt!131319 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3072 (getValueByKey!316 (toList!1946 lt!131319) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9173 () Bool)

(assert (= bs!9173 d!62559))

(declare-fun m!276289 () Bool)

(assert (=> bs!9173 m!276289))

(assert (=> bs!9173 m!276289))

(declare-fun m!276291 () Bool)

(assert (=> bs!9173 m!276291))

(assert (=> b!260336 d!62559))

(declare-fun b!260503 () Bool)

(declare-fun e!168828 () Bool)

(declare-fun call!24844 () Bool)

(assert (=> b!260503 (= e!168828 call!24844)))

(declare-fun d!62561 () Bool)

(declare-fun res!127329 () Bool)

(declare-fun e!168827 () Bool)

(assert (=> d!62561 (=> res!127329 e!168827)))

(assert (=> d!62561 (= res!127329 (bvsge #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))))))))

(assert (=> d!62561 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (mask!11121 thiss!1504)) e!168827)))

(declare-fun bm!24841 () Bool)

(assert (=> bm!24841 (= call!24844 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (mask!11121 thiss!1504)))))

(declare-fun b!260504 () Bool)

(declare-fun e!168829 () Bool)

(assert (=> b!260504 (= e!168829 call!24844)))

(declare-fun b!260505 () Bool)

(assert (=> b!260505 (= e!168828 e!168829)))

(declare-fun lt!131416 () (_ BitVec 64))

(assert (=> b!260505 (= lt!131416 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131418 () Unit!8087)

(assert (=> b!260505 (= lt!131418 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) lt!131416 #b00000000000000000000000000000000))))

(assert (=> b!260505 (arrayContainsKey!0 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) lt!131416 #b00000000000000000000000000000000)))

(declare-fun lt!131417 () Unit!8087)

(assert (=> b!260505 (= lt!131417 lt!131418)))

(declare-fun res!127330 () Bool)

(assert (=> b!260505 (= res!127330 (= (seekEntryOrOpen!0 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000) (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (mask!11121 thiss!1504)) (Found!1183 #b00000000000000000000000000000000)))))

(assert (=> b!260505 (=> (not res!127330) (not e!168829))))

(declare-fun b!260506 () Bool)

(assert (=> b!260506 (= e!168827 e!168828)))

(declare-fun c!44272 () Bool)

(assert (=> b!260506 (= c!44272 (validKeyInArray!0 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!62561 (not res!127329)) b!260506))

(assert (= (and b!260506 c!44272) b!260505))

(assert (= (and b!260506 (not c!44272)) b!260503))

(assert (= (and b!260505 res!127330) b!260504))

(assert (= (or b!260504 b!260503) bm!24841))

(declare-fun m!276293 () Bool)

(assert (=> bm!24841 m!276293))

(declare-fun m!276295 () Bool)

(assert (=> b!260505 m!276295))

(declare-fun m!276297 () Bool)

(assert (=> b!260505 m!276297))

(declare-fun m!276299 () Bool)

(assert (=> b!260505 m!276299))

(assert (=> b!260505 m!276295))

(declare-fun m!276301 () Bool)

(assert (=> b!260505 m!276301))

(assert (=> b!260506 m!276295))

(assert (=> b!260506 m!276295))

(declare-fun m!276303 () Bool)

(assert (=> b!260506 m!276303))

(assert (=> b!260319 d!62561))

(declare-fun d!62563 () Bool)

(declare-fun e!168830 () Bool)

(assert (=> d!62563 e!168830))

(declare-fun res!127331 () Bool)

(assert (=> d!62563 (=> (not res!127331) (not e!168830))))

(declare-fun lt!131420 () ListLongMap!3861)

(assert (=> d!62563 (= res!127331 (contains!1891 lt!131420 (_1!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(declare-fun lt!131422 () List!3826)

(assert (=> d!62563 (= lt!131420 (ListLongMap!3862 lt!131422))))

(declare-fun lt!131421 () Unit!8087)

(declare-fun lt!131419 () Unit!8087)

(assert (=> d!62563 (= lt!131421 lt!131419)))

(assert (=> d!62563 (= (getValueByKey!316 lt!131422 (_1!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (=> d!62563 (= lt!131419 (lemmaContainsTupThenGetReturnValue!172 lt!131422 (_1!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (=> d!62563 (= lt!131422 (insertStrictlySorted!175 (toList!1946 call!24826) (_1!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (=> d!62563 (= (+!699 call!24826 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))) lt!131420)))

(declare-fun b!260507 () Bool)

(declare-fun res!127332 () Bool)

(assert (=> b!260507 (=> (not res!127332) (not e!168830))))

(assert (=> b!260507 (= res!127332 (= (getValueByKey!316 (toList!1946 lt!131420) (_1!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))))

(declare-fun b!260508 () Bool)

(assert (=> b!260508 (= e!168830 (contains!1893 (toList!1946 lt!131420) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))

(assert (= (and d!62563 res!127331) b!260507))

(assert (= (and b!260507 res!127332) b!260508))

(declare-fun m!276305 () Bool)

(assert (=> d!62563 m!276305))

(declare-fun m!276307 () Bool)

(assert (=> d!62563 m!276307))

(declare-fun m!276309 () Bool)

(assert (=> d!62563 m!276309))

(declare-fun m!276311 () Bool)

(assert (=> d!62563 m!276311))

(declare-fun m!276313 () Bool)

(assert (=> b!260507 m!276313))

(declare-fun m!276315 () Bool)

(assert (=> b!260508 m!276315))

(assert (=> b!260338 d!62563))

(assert (=> b!260273 d!62501))

(declare-fun b!260521 () Bool)

(declare-fun e!168839 () SeekEntryResult!1183)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!260521 (= e!168839 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25121 lt!131191) #b00000000000000000000000000000001) (nextIndex!0 (index!6904 lt!131191) (x!25121 lt!131191) (mask!11121 thiss!1504)) (index!6904 lt!131191) key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(declare-fun b!260522 () Bool)

(declare-fun c!44280 () Bool)

(declare-fun lt!131427 () (_ BitVec 64))

(assert (=> b!260522 (= c!44280 (= lt!131427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168837 () SeekEntryResult!1183)

(assert (=> b!260522 (= e!168837 e!168839)))

(declare-fun b!260523 () Bool)

(declare-fun e!168838 () SeekEntryResult!1183)

(assert (=> b!260523 (= e!168838 Undefined!1183)))

(declare-fun b!260524 () Bool)

(assert (=> b!260524 (= e!168838 e!168837)))

(declare-fun c!44279 () Bool)

(assert (=> b!260524 (= c!44279 (= lt!131427 key!932))))

(declare-fun b!260525 () Bool)

(assert (=> b!260525 (= e!168839 (MissingVacant!1183 (index!6904 lt!131191)))))

(declare-fun lt!131428 () SeekEntryResult!1183)

(declare-fun d!62565 () Bool)

(assert (=> d!62565 (and (or ((_ is Undefined!1183) lt!131428) (not ((_ is Found!1183) lt!131428)) (and (bvsge (index!6903 lt!131428) #b00000000000000000000000000000000) (bvslt (index!6903 lt!131428) (size!6312 (_keys!6975 thiss!1504))))) (or ((_ is Undefined!1183) lt!131428) ((_ is Found!1183) lt!131428) (not ((_ is MissingVacant!1183) lt!131428)) (not (= (index!6905 lt!131428) (index!6904 lt!131191))) (and (bvsge (index!6905 lt!131428) #b00000000000000000000000000000000) (bvslt (index!6905 lt!131428) (size!6312 (_keys!6975 thiss!1504))))) (or ((_ is Undefined!1183) lt!131428) (ite ((_ is Found!1183) lt!131428) (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6903 lt!131428)) key!932) (and ((_ is MissingVacant!1183) lt!131428) (= (index!6905 lt!131428) (index!6904 lt!131191)) (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6905 lt!131428)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!62565 (= lt!131428 e!168838)))

(declare-fun c!44281 () Bool)

(assert (=> d!62565 (= c!44281 (bvsge (x!25121 lt!131191) #b01111111111111111111111111111110))))

(assert (=> d!62565 (= lt!131427 (select (arr!5963 (_keys!6975 thiss!1504)) (index!6904 lt!131191)))))

(assert (=> d!62565 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62565 (= (seekKeyOrZeroReturnVacant!0 (x!25121 lt!131191) (index!6904 lt!131191) (index!6904 lt!131191) key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)) lt!131428)))

(declare-fun b!260526 () Bool)

(assert (=> b!260526 (= e!168837 (Found!1183 (index!6904 lt!131191)))))

(assert (= (and d!62565 c!44281) b!260523))

(assert (= (and d!62565 (not c!44281)) b!260524))

(assert (= (and b!260524 c!44279) b!260526))

(assert (= (and b!260524 (not c!44279)) b!260522))

(assert (= (and b!260522 c!44280) b!260525))

(assert (= (and b!260522 (not c!44280)) b!260521))

(declare-fun m!276317 () Bool)

(assert (=> b!260521 m!276317))

(assert (=> b!260521 m!276317))

(declare-fun m!276319 () Bool)

(assert (=> b!260521 m!276319))

(declare-fun m!276321 () Bool)

(assert (=> d!62565 m!276321))

(declare-fun m!276323 () Bool)

(assert (=> d!62565 m!276323))

(assert (=> d!62565 m!275879))

(assert (=> d!62565 m!275775))

(assert (=> b!260165 d!62565))

(assert (=> bm!24833 d!62485))

(declare-fun d!62567 () Bool)

(declare-fun e!168841 () Bool)

(assert (=> d!62567 e!168841))

(declare-fun res!127333 () Bool)

(assert (=> d!62567 (=> res!127333 e!168841)))

(declare-fun lt!131431 () Bool)

(assert (=> d!62567 (= res!127333 (not lt!131431))))

(declare-fun lt!131430 () Bool)

(assert (=> d!62567 (= lt!131431 lt!131430)))

(declare-fun lt!131429 () Unit!8087)

(declare-fun e!168840 () Unit!8087)

(assert (=> d!62567 (= lt!131429 e!168840)))

(declare-fun c!44282 () Bool)

(assert (=> d!62567 (= c!44282 lt!131430)))

(assert (=> d!62567 (= lt!131430 (containsKey!308 (toList!1946 lt!131319) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62567 (= (contains!1891 lt!131319 #b0000000000000000000000000000000000000000000000000000000000000000) lt!131431)))

(declare-fun b!260527 () Bool)

(declare-fun lt!131432 () Unit!8087)

(assert (=> b!260527 (= e!168840 lt!131432)))

(assert (=> b!260527 (= lt!131432 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 lt!131319) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260527 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131319) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260528 () Bool)

(declare-fun Unit!8099 () Unit!8087)

(assert (=> b!260528 (= e!168840 Unit!8099)))

(declare-fun b!260529 () Bool)

(assert (=> b!260529 (= e!168841 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131319) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62567 c!44282) b!260527))

(assert (= (and d!62567 (not c!44282)) b!260528))

(assert (= (and d!62567 (not res!127333)) b!260529))

(declare-fun m!276325 () Bool)

(assert (=> d!62567 m!276325))

(declare-fun m!276327 () Bool)

(assert (=> b!260527 m!276327))

(assert (=> b!260527 m!276289))

(assert (=> b!260527 m!276289))

(declare-fun m!276329 () Bool)

(assert (=> b!260527 m!276329))

(assert (=> b!260529 m!276289))

(assert (=> b!260529 m!276289))

(assert (=> b!260529 m!276329))

(assert (=> bm!24824 d!62567))

(declare-fun d!62569 () Bool)

(declare-fun e!168843 () Bool)

(assert (=> d!62569 e!168843))

(declare-fun res!127334 () Bool)

(assert (=> d!62569 (=> res!127334 e!168843)))

(declare-fun lt!131435 () Bool)

(assert (=> d!62569 (= res!127334 (not lt!131435))))

(declare-fun lt!131434 () Bool)

(assert (=> d!62569 (= lt!131435 lt!131434)))

(declare-fun lt!131433 () Unit!8087)

(declare-fun e!168842 () Unit!8087)

(assert (=> d!62569 (= lt!131433 e!168842)))

(declare-fun c!44283 () Bool)

(assert (=> d!62569 (= c!44283 lt!131434)))

(assert (=> d!62569 (= lt!131434 (containsKey!308 (toList!1946 lt!131263) (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(assert (=> d!62569 (= (contains!1891 lt!131263 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)) lt!131435)))

(declare-fun b!260530 () Bool)

(declare-fun lt!131436 () Unit!8087)

(assert (=> b!260530 (= e!168842 lt!131436)))

(assert (=> b!260530 (= lt!131436 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 lt!131263) (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(assert (=> b!260530 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131263) (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(declare-fun b!260531 () Bool)

(declare-fun Unit!8100 () Unit!8087)

(assert (=> b!260531 (= e!168842 Unit!8100)))

(declare-fun b!260532 () Bool)

(assert (=> b!260532 (= e!168843 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131263) (select (arr!5963 lt!131133) #b00000000000000000000000000000000))))))

(assert (= (and d!62569 c!44283) b!260530))

(assert (= (and d!62569 (not c!44283)) b!260531))

(assert (= (and d!62569 (not res!127334)) b!260532))

(assert (=> d!62569 m!275909))

(declare-fun m!276331 () Bool)

(assert (=> d!62569 m!276331))

(assert (=> b!260530 m!275909))

(declare-fun m!276333 () Bool)

(assert (=> b!260530 m!276333))

(assert (=> b!260530 m!275909))

(declare-fun m!276335 () Bool)

(assert (=> b!260530 m!276335))

(assert (=> b!260530 m!276335))

(declare-fun m!276337 () Bool)

(assert (=> b!260530 m!276337))

(assert (=> b!260532 m!275909))

(assert (=> b!260532 m!276335))

(assert (=> b!260532 m!276335))

(assert (=> b!260532 m!276337))

(assert (=> b!260275 d!62569))

(declare-fun d!62571 () Bool)

(assert (=> d!62571 (= (+!699 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) (tuple2!4949 key!932 v!346)) (getCurrentListMap!1474 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(assert (=> d!62571 true))

(declare-fun _$3!61 () Unit!8087)

(assert (=> d!62571 (= (choose!1266 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) index!297 key!932 v!346 (defaultEntry!4795 thiss!1504)) _$3!61)))

(declare-fun bs!9174 () Bool)

(assert (= bs!9174 d!62571))

(assert (=> bs!9174 m!275767))

(assert (=> bs!9174 m!275927))

(assert (=> bs!9174 m!275805))

(assert (=> bs!9174 m!275929))

(assert (=> bs!9174 m!275781))

(assert (=> bs!9174 m!275767))

(assert (=> d!62465 d!62571))

(assert (=> d!62465 d!62467))

(declare-fun b!260533 () Bool)

(declare-fun e!168845 () Bool)

(declare-fun call!24845 () Bool)

(assert (=> b!260533 (= e!168845 call!24845)))

(declare-fun d!62573 () Bool)

(declare-fun res!127335 () Bool)

(declare-fun e!168844 () Bool)

(assert (=> d!62573 (=> res!127335 e!168844)))

(assert (=> d!62573 (= res!127335 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 lt!131133)))))

(assert (=> d!62573 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!131133 (mask!11121 thiss!1504)) e!168844)))

(declare-fun bm!24842 () Bool)

(assert (=> bm!24842 (= call!24845 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!131133 (mask!11121 thiss!1504)))))

(declare-fun b!260534 () Bool)

(declare-fun e!168846 () Bool)

(assert (=> b!260534 (= e!168846 call!24845)))

(declare-fun b!260535 () Bool)

(assert (=> b!260535 (= e!168845 e!168846)))

(declare-fun lt!131437 () (_ BitVec 64))

(assert (=> b!260535 (= lt!131437 (select (arr!5963 lt!131133) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!131439 () Unit!8087)

(assert (=> b!260535 (= lt!131439 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131133 lt!131437 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!260535 (arrayContainsKey!0 lt!131133 lt!131437 #b00000000000000000000000000000000)))

(declare-fun lt!131438 () Unit!8087)

(assert (=> b!260535 (= lt!131438 lt!131439)))

(declare-fun res!127336 () Bool)

(assert (=> b!260535 (= res!127336 (= (seekEntryOrOpen!0 (select (arr!5963 lt!131133) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!131133 (mask!11121 thiss!1504)) (Found!1183 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!260535 (=> (not res!127336) (not e!168846))))

(declare-fun b!260536 () Bool)

(assert (=> b!260536 (= e!168844 e!168845)))

(declare-fun c!44284 () Bool)

(assert (=> b!260536 (= c!44284 (validKeyInArray!0 (select (arr!5963 lt!131133) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62573 (not res!127335)) b!260536))

(assert (= (and b!260536 c!44284) b!260535))

(assert (= (and b!260536 (not c!44284)) b!260533))

(assert (= (and b!260535 res!127336) b!260534))

(assert (= (or b!260534 b!260533) bm!24842))

(declare-fun m!276339 () Bool)

(assert (=> bm!24842 m!276339))

(assert (=> b!260535 m!276275))

(declare-fun m!276341 () Bool)

(assert (=> b!260535 m!276341))

(declare-fun m!276343 () Bool)

(assert (=> b!260535 m!276343))

(assert (=> b!260535 m!276275))

(declare-fun m!276345 () Bool)

(assert (=> b!260535 m!276345))

(assert (=> b!260536 m!276275))

(assert (=> b!260536 m!276275))

(assert (=> b!260536 m!276281))

(assert (=> bm!24792 d!62573))

(declare-fun d!62575 () Bool)

(assert (=> d!62575 (= (inRange!0 (index!6903 lt!131181) (mask!11121 thiss!1504)) (and (bvsge (index!6903 lt!131181) #b00000000000000000000000000000000) (bvslt (index!6903 lt!131181) (bvadd (mask!11121 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!260147 d!62575))

(declare-fun d!62577 () Bool)

(assert (=> d!62577 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260308 d!62577))

(declare-fun d!62579 () Bool)

(assert (=> d!62579 (arrayContainsKey!0 lt!131133 lt!131207 #b00000000000000000000000000000000)))

(declare-fun lt!131440 () Unit!8087)

(assert (=> d!62579 (= lt!131440 (choose!13 lt!131133 lt!131207 #b00000000000000000000000000000000))))

(assert (=> d!62579 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62579 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131133 lt!131207 #b00000000000000000000000000000000) lt!131440)))

(declare-fun bs!9175 () Bool)

(assert (= bs!9175 d!62579))

(assert (=> bs!9175 m!275913))

(declare-fun m!276347 () Bool)

(assert (=> bs!9175 m!276347))

(assert (=> b!260183 d!62579))

(declare-fun d!62581 () Bool)

(declare-fun res!127337 () Bool)

(declare-fun e!168847 () Bool)

(assert (=> d!62581 (=> res!127337 e!168847)))

(assert (=> d!62581 (= res!127337 (= (select (arr!5963 lt!131133) #b00000000000000000000000000000000) lt!131207))))

(assert (=> d!62581 (= (arrayContainsKey!0 lt!131133 lt!131207 #b00000000000000000000000000000000) e!168847)))

(declare-fun b!260537 () Bool)

(declare-fun e!168848 () Bool)

(assert (=> b!260537 (= e!168847 e!168848)))

(declare-fun res!127338 () Bool)

(assert (=> b!260537 (=> (not res!127338) (not e!168848))))

(assert (=> b!260537 (= res!127338 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 lt!131133)))))

(declare-fun b!260538 () Bool)

(assert (=> b!260538 (= e!168848 (arrayContainsKey!0 lt!131133 lt!131207 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62581 (not res!127337)) b!260537))

(assert (= (and b!260537 res!127338) b!260538))

(assert (=> d!62581 m!275909))

(declare-fun m!276349 () Bool)

(assert (=> b!260538 m!276349))

(assert (=> b!260183 d!62581))

(declare-fun b!260539 () Bool)

(declare-fun e!168851 () SeekEntryResult!1183)

(declare-fun lt!131443 () SeekEntryResult!1183)

(assert (=> b!260539 (= e!168851 (Found!1183 (index!6904 lt!131443)))))

(declare-fun b!260540 () Bool)

(declare-fun e!168849 () SeekEntryResult!1183)

(assert (=> b!260540 (= e!168849 e!168851)))

(declare-fun lt!131442 () (_ BitVec 64))

(assert (=> b!260540 (= lt!131442 (select (arr!5963 lt!131133) (index!6904 lt!131443)))))

(declare-fun c!44285 () Bool)

(assert (=> b!260540 (= c!44285 (= lt!131442 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)))))

(declare-fun b!260541 () Bool)

(declare-fun c!44287 () Bool)

(assert (=> b!260541 (= c!44287 (= lt!131442 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168850 () SeekEntryResult!1183)

(assert (=> b!260541 (= e!168851 e!168850)))

(declare-fun b!260542 () Bool)

(assert (=> b!260542 (= e!168849 Undefined!1183)))

(declare-fun b!260543 () Bool)

(assert (=> b!260543 (= e!168850 (seekKeyOrZeroReturnVacant!0 (x!25121 lt!131443) (index!6904 lt!131443) (index!6904 lt!131443) (select (arr!5963 lt!131133) #b00000000000000000000000000000000) lt!131133 (mask!11121 thiss!1504)))))

(declare-fun b!260544 () Bool)

(assert (=> b!260544 (= e!168850 (MissingZero!1183 (index!6904 lt!131443)))))

(declare-fun d!62583 () Bool)

(declare-fun lt!131441 () SeekEntryResult!1183)

(assert (=> d!62583 (and (or ((_ is Undefined!1183) lt!131441) (not ((_ is Found!1183) lt!131441)) (and (bvsge (index!6903 lt!131441) #b00000000000000000000000000000000) (bvslt (index!6903 lt!131441) (size!6312 lt!131133)))) (or ((_ is Undefined!1183) lt!131441) ((_ is Found!1183) lt!131441) (not ((_ is MissingZero!1183) lt!131441)) (and (bvsge (index!6902 lt!131441) #b00000000000000000000000000000000) (bvslt (index!6902 lt!131441) (size!6312 lt!131133)))) (or ((_ is Undefined!1183) lt!131441) ((_ is Found!1183) lt!131441) ((_ is MissingZero!1183) lt!131441) (not ((_ is MissingVacant!1183) lt!131441)) (and (bvsge (index!6905 lt!131441) #b00000000000000000000000000000000) (bvslt (index!6905 lt!131441) (size!6312 lt!131133)))) (or ((_ is Undefined!1183) lt!131441) (ite ((_ is Found!1183) lt!131441) (= (select (arr!5963 lt!131133) (index!6903 lt!131441)) (select (arr!5963 lt!131133) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1183) lt!131441) (= (select (arr!5963 lt!131133) (index!6902 lt!131441)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1183) lt!131441) (= (select (arr!5963 lt!131133) (index!6905 lt!131441)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62583 (= lt!131441 e!168849)))

(declare-fun c!44286 () Bool)

(assert (=> d!62583 (= c!44286 (and ((_ is Intermediate!1183) lt!131443) (undefined!1995 lt!131443)))))

(assert (=> d!62583 (= lt!131443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000) (mask!11121 thiss!1504)) (select (arr!5963 lt!131133) #b00000000000000000000000000000000) lt!131133 (mask!11121 thiss!1504)))))

(assert (=> d!62583 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62583 (= (seekEntryOrOpen!0 (select (arr!5963 lt!131133) #b00000000000000000000000000000000) lt!131133 (mask!11121 thiss!1504)) lt!131441)))

(assert (= (and d!62583 c!44286) b!260542))

(assert (= (and d!62583 (not c!44286)) b!260540))

(assert (= (and b!260540 c!44285) b!260539))

(assert (= (and b!260540 (not c!44285)) b!260541))

(assert (= (and b!260541 c!44287) b!260544))

(assert (= (and b!260541 (not c!44287)) b!260543))

(declare-fun m!276351 () Bool)

(assert (=> b!260540 m!276351))

(assert (=> b!260543 m!275909))

(declare-fun m!276353 () Bool)

(assert (=> b!260543 m!276353))

(assert (=> d!62583 m!275909))

(declare-fun m!276355 () Bool)

(assert (=> d!62583 m!276355))

(assert (=> d!62583 m!275775))

(declare-fun m!276357 () Bool)

(assert (=> d!62583 m!276357))

(declare-fun m!276359 () Bool)

(assert (=> d!62583 m!276359))

(declare-fun m!276361 () Bool)

(assert (=> d!62583 m!276361))

(assert (=> d!62583 m!276355))

(assert (=> d!62583 m!275909))

(declare-fun m!276363 () Bool)

(assert (=> d!62583 m!276363))

(assert (=> b!260183 d!62583))

(declare-fun b!260545 () Bool)

(declare-fun e!168853 () Bool)

(assert (=> b!260545 (= e!168853 (contains!1892 Nil!3824 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260546 () Bool)

(declare-fun e!168854 () Bool)

(declare-fun call!24846 () Bool)

(assert (=> b!260546 (= e!168854 call!24846)))

(declare-fun c!44288 () Bool)

(declare-fun bm!24843 () Bool)

(assert (=> bm!24843 (= call!24846 (arrayNoDuplicates!0 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44288 (Cons!3823 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000) Nil!3824) Nil!3824)))))

(declare-fun b!260547 () Bool)

(assert (=> b!260547 (= e!168854 call!24846)))

(declare-fun b!260548 () Bool)

(declare-fun e!168855 () Bool)

(declare-fun e!168852 () Bool)

(assert (=> b!260548 (= e!168855 e!168852)))

(declare-fun res!127341 () Bool)

(assert (=> b!260548 (=> (not res!127341) (not e!168852))))

(assert (=> b!260548 (= res!127341 (not e!168853))))

(declare-fun res!127340 () Bool)

(assert (=> b!260548 (=> (not res!127340) (not e!168853))))

(assert (=> b!260548 (= res!127340 (validKeyInArray!0 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260549 () Bool)

(assert (=> b!260549 (= e!168852 e!168854)))

(assert (=> b!260549 (= c!44288 (validKeyInArray!0 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62585 () Bool)

(declare-fun res!127339 () Bool)

(assert (=> d!62585 (=> res!127339 e!168855)))

(assert (=> d!62585 (= res!127339 (bvsge #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))))))))

(assert (=> d!62585 (= (arrayNoDuplicates!0 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) #b00000000000000000000000000000000 Nil!3824) e!168855)))

(assert (= (and d!62585 (not res!127339)) b!260548))

(assert (= (and b!260548 res!127340) b!260545))

(assert (= (and b!260548 res!127341) b!260549))

(assert (= (and b!260549 c!44288) b!260546))

(assert (= (and b!260549 (not c!44288)) b!260547))

(assert (= (or b!260546 b!260547) bm!24843))

(assert (=> b!260545 m!276295))

(assert (=> b!260545 m!276295))

(declare-fun m!276365 () Bool)

(assert (=> b!260545 m!276365))

(assert (=> bm!24843 m!276295))

(declare-fun m!276367 () Bool)

(assert (=> bm!24843 m!276367))

(assert (=> b!260548 m!276295))

(assert (=> b!260548 m!276295))

(assert (=> b!260548 m!276303))

(assert (=> b!260549 m!276295))

(assert (=> b!260549 m!276295))

(assert (=> b!260549 m!276303))

(assert (=> b!260298 d!62585))

(declare-fun d!62587 () Bool)

(declare-fun e!168856 () Bool)

(assert (=> d!62587 e!168856))

(declare-fun res!127342 () Bool)

(assert (=> d!62587 (=> (not res!127342) (not e!168856))))

(declare-fun lt!131445 () ListLongMap!3861)

(assert (=> d!62587 (= res!127342 (contains!1891 lt!131445 (_1!2485 (tuple2!4949 key!932 v!346))))))

(declare-fun lt!131447 () List!3826)

(assert (=> d!62587 (= lt!131445 (ListLongMap!3862 lt!131447))))

(declare-fun lt!131446 () Unit!8087)

(declare-fun lt!131444 () Unit!8087)

(assert (=> d!62587 (= lt!131446 lt!131444)))

(assert (=> d!62587 (= (getValueByKey!316 lt!131447 (_1!2485 (tuple2!4949 key!932 v!346))) (Some!321 (_2!2485 (tuple2!4949 key!932 v!346))))))

(assert (=> d!62587 (= lt!131444 (lemmaContainsTupThenGetReturnValue!172 lt!131447 (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346))))))

(assert (=> d!62587 (= lt!131447 (insertStrictlySorted!175 (toList!1946 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504))) (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346))))))

(assert (=> d!62587 (= (+!699 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) (tuple2!4949 key!932 v!346)) lt!131445)))

(declare-fun b!260550 () Bool)

(declare-fun res!127343 () Bool)

(assert (=> b!260550 (=> (not res!127343) (not e!168856))))

(assert (=> b!260550 (= res!127343 (= (getValueByKey!316 (toList!1946 lt!131445) (_1!2485 (tuple2!4949 key!932 v!346))) (Some!321 (_2!2485 (tuple2!4949 key!932 v!346)))))))

(declare-fun b!260551 () Bool)

(assert (=> b!260551 (= e!168856 (contains!1893 (toList!1946 lt!131445) (tuple2!4949 key!932 v!346)))))

(assert (= (and d!62587 res!127342) b!260550))

(assert (= (and b!260550 res!127343) b!260551))

(declare-fun m!276369 () Bool)

(assert (=> d!62587 m!276369))

(declare-fun m!276371 () Bool)

(assert (=> d!62587 m!276371))

(declare-fun m!276373 () Bool)

(assert (=> d!62587 m!276373))

(declare-fun m!276375 () Bool)

(assert (=> d!62587 m!276375))

(declare-fun m!276377 () Bool)

(assert (=> b!260550 m!276377))

(declare-fun m!276379 () Bool)

(assert (=> b!260551 m!276379))

(assert (=> b!260199 d!62587))

(assert (=> b!260199 d!62495))

(declare-fun b!260552 () Bool)

(declare-fun e!168866 () Unit!8087)

(declare-fun Unit!8101 () Unit!8087)

(assert (=> b!260552 (= e!168866 Unit!8101)))

(declare-fun b!260553 () Bool)

(declare-fun res!127350 () Bool)

(declare-fun e!168858 () Bool)

(assert (=> b!260553 (=> (not res!127350) (not e!168858))))

(declare-fun e!168859 () Bool)

(assert (=> b!260553 (= res!127350 e!168859)))

(declare-fun res!127352 () Bool)

(assert (=> b!260553 (=> res!127352 e!168859)))

(declare-fun e!168867 () Bool)

(assert (=> b!260553 (= res!127352 (not e!168867))))

(declare-fun res!127344 () Bool)

(assert (=> b!260553 (=> (not res!127344) (not e!168867))))

(assert (=> b!260553 (= res!127344 (bvslt #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))))))))

(declare-fun b!260554 () Bool)

(declare-fun e!168857 () Bool)

(declare-fun call!24847 () Bool)

(assert (=> b!260554 (= e!168857 (not call!24847))))

(declare-fun d!62589 () Bool)

(assert (=> d!62589 e!168858))

(declare-fun res!127349 () Bool)

(assert (=> d!62589 (=> (not res!127349) (not e!168858))))

(assert (=> d!62589 (= res!127349 (or (bvsge #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))))))))))

(declare-fun lt!131450 () ListLongMap!3861)

(declare-fun lt!131456 () ListLongMap!3861)

(assert (=> d!62589 (= lt!131450 lt!131456)))

(declare-fun lt!131453 () Unit!8087)

(assert (=> d!62589 (= lt!131453 e!168866)))

(declare-fun c!44290 () Bool)

(declare-fun e!168862 () Bool)

(assert (=> d!62589 (= c!44290 e!168862)))

(declare-fun res!127348 () Bool)

(assert (=> d!62589 (=> (not res!127348) (not e!168862))))

(assert (=> d!62589 (= res!127348 (bvslt #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))))))))

(declare-fun e!168868 () ListLongMap!3861)

(assert (=> d!62589 (= lt!131456 e!168868)))

(declare-fun c!44292 () Bool)

(assert (=> d!62589 (= c!44292 (and (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62589 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62589 (= (getCurrentListMap!1474 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) lt!131450)))

(declare-fun bm!24844 () Bool)

(declare-fun call!24849 () ListLongMap!3861)

(declare-fun call!24850 () ListLongMap!3861)

(assert (=> bm!24844 (= call!24849 call!24850)))

(declare-fun b!260555 () Bool)

(declare-fun res!127346 () Bool)

(assert (=> b!260555 (=> (not res!127346) (not e!168858))))

(assert (=> b!260555 (= res!127346 e!168857)))

(declare-fun c!44294 () Bool)

(assert (=> b!260555 (= c!44294 (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!260556 () Bool)

(declare-fun e!168860 () Bool)

(assert (=> b!260556 (= e!168858 e!168860)))

(declare-fun c!44293 () Bool)

(assert (=> b!260556 (= c!44293 (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260557 () Bool)

(declare-fun e!168861 () ListLongMap!3861)

(declare-fun call!24853 () ListLongMap!3861)

(assert (=> b!260557 (= e!168861 call!24853)))

(declare-fun bm!24845 () Bool)

(declare-fun call!24848 () ListLongMap!3861)

(assert (=> bm!24845 (= call!24853 call!24848)))

(declare-fun b!260558 () Bool)

(assert (=> b!260558 (= e!168867 (validKeyInArray!0 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260559 () Bool)

(declare-fun e!168863 () Bool)

(assert (=> b!260559 (= e!168863 (= (apply!258 lt!131450 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4636 thiss!1504)))))

(declare-fun b!260560 () Bool)

(declare-fun e!168864 () Bool)

(assert (=> b!260560 (= e!168859 e!168864)))

(declare-fun res!127351 () Bool)

(assert (=> b!260560 (=> (not res!127351) (not e!168864))))

(assert (=> b!260560 (= res!127351 (contains!1891 lt!131450 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!260560 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))))))))

(declare-fun b!260561 () Bool)

(assert (=> b!260561 (= e!168868 (+!699 call!24848 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))

(declare-fun b!260562 () Bool)

(declare-fun e!168865 () Bool)

(assert (=> b!260562 (= e!168860 e!168865)))

(declare-fun res!127347 () Bool)

(declare-fun call!24851 () Bool)

(assert (=> b!260562 (= res!127347 call!24851)))

(assert (=> b!260562 (=> (not res!127347) (not e!168865))))

(declare-fun bm!24846 () Bool)

(assert (=> bm!24846 (= call!24847 (contains!1891 lt!131450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!24847 () Bool)

(declare-fun call!24852 () ListLongMap!3861)

(assert (=> bm!24847 (= call!24852 call!24849)))

(declare-fun b!260563 () Bool)

(declare-fun e!168869 () ListLongMap!3861)

(assert (=> b!260563 (= e!168868 e!168869)))

(declare-fun c!44291 () Bool)

(assert (=> b!260563 (= c!44291 (and (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!260564 () Bool)

(assert (=> b!260564 (= e!168862 (validKeyInArray!0 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!260565 () Bool)

(assert (=> b!260565 (= e!168865 (= (apply!258 lt!131450 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4636 thiss!1504)))))

(declare-fun b!260566 () Bool)

(assert (=> b!260566 (= e!168869 call!24853)))

(declare-fun b!260567 () Bool)

(assert (=> b!260567 (= e!168864 (= (apply!258 lt!131450 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000)) (get!3071 (select (arr!5962 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260567 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6311 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))))))))

(assert (=> b!260567 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6312 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))))))))

(declare-fun b!260568 () Bool)

(assert (=> b!260568 (= e!168861 call!24852)))

(declare-fun bm!24848 () Bool)

(assert (=> bm!24848 (= call!24850 (getCurrentListMapNoExtraKeys!580 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun b!260569 () Bool)

(declare-fun lt!131463 () Unit!8087)

(assert (=> b!260569 (= e!168866 lt!131463)))

(declare-fun lt!131458 () ListLongMap!3861)

(assert (=> b!260569 (= lt!131458 (getCurrentListMapNoExtraKeys!580 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131464 () (_ BitVec 64))

(assert (=> b!260569 (= lt!131464 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131461 () (_ BitVec 64))

(assert (=> b!260569 (= lt!131461 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131467 () Unit!8087)

(assert (=> b!260569 (= lt!131467 (addStillContains!234 lt!131458 lt!131464 (zeroValue!4636 thiss!1504) lt!131461))))

(assert (=> b!260569 (contains!1891 (+!699 lt!131458 (tuple2!4949 lt!131464 (zeroValue!4636 thiss!1504))) lt!131461)))

(declare-fun lt!131469 () Unit!8087)

(assert (=> b!260569 (= lt!131469 lt!131467)))

(declare-fun lt!131455 () ListLongMap!3861)

(assert (=> b!260569 (= lt!131455 (getCurrentListMapNoExtraKeys!580 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131468 () (_ BitVec 64))

(assert (=> b!260569 (= lt!131468 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131462 () (_ BitVec 64))

(assert (=> b!260569 (= lt!131462 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131460 () Unit!8087)

(assert (=> b!260569 (= lt!131460 (addApplyDifferent!234 lt!131455 lt!131468 (minValue!4636 thiss!1504) lt!131462))))

(assert (=> b!260569 (= (apply!258 (+!699 lt!131455 (tuple2!4949 lt!131468 (minValue!4636 thiss!1504))) lt!131462) (apply!258 lt!131455 lt!131462))))

(declare-fun lt!131448 () Unit!8087)

(assert (=> b!260569 (= lt!131448 lt!131460)))

(declare-fun lt!131465 () ListLongMap!3861)

(assert (=> b!260569 (= lt!131465 (getCurrentListMapNoExtraKeys!580 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131452 () (_ BitVec 64))

(assert (=> b!260569 (= lt!131452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131454 () (_ BitVec 64))

(assert (=> b!260569 (= lt!131454 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131457 () Unit!8087)

(assert (=> b!260569 (= lt!131457 (addApplyDifferent!234 lt!131465 lt!131452 (zeroValue!4636 thiss!1504) lt!131454))))

(assert (=> b!260569 (= (apply!258 (+!699 lt!131465 (tuple2!4949 lt!131452 (zeroValue!4636 thiss!1504))) lt!131454) (apply!258 lt!131465 lt!131454))))

(declare-fun lt!131466 () Unit!8087)

(assert (=> b!260569 (= lt!131466 lt!131457)))

(declare-fun lt!131459 () ListLongMap!3861)

(assert (=> b!260569 (= lt!131459 (getCurrentListMapNoExtraKeys!580 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504))) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)))))

(declare-fun lt!131449 () (_ BitVec 64))

(assert (=> b!260569 (= lt!131449 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131451 () (_ BitVec 64))

(assert (=> b!260569 (= lt!131451 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!260569 (= lt!131463 (addApplyDifferent!234 lt!131459 lt!131449 (minValue!4636 thiss!1504) lt!131451))))

(assert (=> b!260569 (= (apply!258 (+!699 lt!131459 (tuple2!4949 lt!131449 (minValue!4636 thiss!1504))) lt!131451) (apply!258 lt!131459 lt!131451))))

(declare-fun bm!24849 () Bool)

(assert (=> bm!24849 (= call!24851 (contains!1891 lt!131450 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260570 () Bool)

(assert (=> b!260570 (= e!168857 e!168863)))

(declare-fun res!127345 () Bool)

(assert (=> b!260570 (= res!127345 call!24847)))

(assert (=> b!260570 (=> (not res!127345) (not e!168863))))

(declare-fun b!260571 () Bool)

(declare-fun c!44289 () Bool)

(assert (=> b!260571 (= c!44289 (and (not (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!260571 (= e!168869 e!168861)))

(declare-fun b!260572 () Bool)

(assert (=> b!260572 (= e!168860 (not call!24851))))

(declare-fun bm!24850 () Bool)

(assert (=> bm!24850 (= call!24848 (+!699 (ite c!44292 call!24850 (ite c!44291 call!24849 call!24852)) (ite (or c!44292 c!44291) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (= (and d!62589 c!44292) b!260561))

(assert (= (and d!62589 (not c!44292)) b!260563))

(assert (= (and b!260563 c!44291) b!260566))

(assert (= (and b!260563 (not c!44291)) b!260571))

(assert (= (and b!260571 c!44289) b!260557))

(assert (= (and b!260571 (not c!44289)) b!260568))

(assert (= (or b!260557 b!260568) bm!24847))

(assert (= (or b!260566 bm!24847) bm!24844))

(assert (= (or b!260566 b!260557) bm!24845))

(assert (= (or b!260561 bm!24844) bm!24848))

(assert (= (or b!260561 bm!24845) bm!24850))

(assert (= (and d!62589 res!127348) b!260564))

(assert (= (and d!62589 c!44290) b!260569))

(assert (= (and d!62589 (not c!44290)) b!260552))

(assert (= (and d!62589 res!127349) b!260553))

(assert (= (and b!260553 res!127344) b!260558))

(assert (= (and b!260553 (not res!127352)) b!260560))

(assert (= (and b!260560 res!127351) b!260567))

(assert (= (and b!260553 res!127350) b!260555))

(assert (= (and b!260555 c!44294) b!260570))

(assert (= (and b!260555 (not c!44294)) b!260554))

(assert (= (and b!260570 res!127345) b!260559))

(assert (= (or b!260570 b!260554) bm!24846))

(assert (= (and b!260555 res!127346) b!260556))

(assert (= (and b!260556 c!44293) b!260562))

(assert (= (and b!260556 (not c!44293)) b!260572))

(assert (= (and b!260562 res!127347) b!260565))

(assert (= (or b!260562 b!260572) bm!24849))

(declare-fun b_lambda!8275 () Bool)

(assert (=> (not b_lambda!8275) (not b!260567)))

(assert (=> b!260567 t!8900))

(declare-fun b_and!13881 () Bool)

(assert (= b_and!13879 (and (=> t!8900 result!5409) b_and!13881)))

(assert (=> b!260564 m!276295))

(assert (=> b!260564 m!276295))

(assert (=> b!260564 m!276303))

(declare-fun m!276381 () Bool)

(assert (=> b!260561 m!276381))

(declare-fun m!276383 () Bool)

(assert (=> bm!24846 m!276383))

(declare-fun m!276385 () Bool)

(assert (=> bm!24850 m!276385))

(declare-fun m!276387 () Bool)

(assert (=> b!260569 m!276387))

(declare-fun m!276389 () Bool)

(assert (=> b!260569 m!276389))

(declare-fun m!276391 () Bool)

(assert (=> b!260569 m!276391))

(declare-fun m!276393 () Bool)

(assert (=> b!260569 m!276393))

(assert (=> b!260569 m!276391))

(declare-fun m!276395 () Bool)

(assert (=> b!260569 m!276395))

(declare-fun m!276397 () Bool)

(assert (=> b!260569 m!276397))

(declare-fun m!276399 () Bool)

(assert (=> b!260569 m!276399))

(declare-fun m!276401 () Bool)

(assert (=> b!260569 m!276401))

(declare-fun m!276403 () Bool)

(assert (=> b!260569 m!276403))

(declare-fun m!276405 () Bool)

(assert (=> b!260569 m!276405))

(declare-fun m!276407 () Bool)

(assert (=> b!260569 m!276407))

(declare-fun m!276409 () Bool)

(assert (=> b!260569 m!276409))

(declare-fun m!276411 () Bool)

(assert (=> b!260569 m!276411))

(declare-fun m!276413 () Bool)

(assert (=> b!260569 m!276413))

(declare-fun m!276415 () Bool)

(assert (=> b!260569 m!276415))

(declare-fun m!276417 () Bool)

(assert (=> b!260569 m!276417))

(assert (=> b!260569 m!276407))

(assert (=> b!260569 m!276295))

(assert (=> b!260569 m!276415))

(assert (=> b!260569 m!276411))

(assert (=> bm!24848 m!276403))

(assert (=> b!260560 m!276295))

(assert (=> b!260560 m!276295))

(declare-fun m!276419 () Bool)

(assert (=> b!260560 m!276419))

(declare-fun m!276421 () Bool)

(assert (=> bm!24849 m!276421))

(declare-fun m!276423 () Bool)

(assert (=> b!260559 m!276423))

(assert (=> d!62589 m!275775))

(declare-fun m!276425 () Bool)

(assert (=> b!260565 m!276425))

(assert (=> b!260567 m!276295))

(assert (=> b!260567 m!275985))

(assert (=> b!260567 m!275985))

(assert (=> b!260567 m!275987))

(assert (=> b!260567 m!275989))

(assert (=> b!260567 m!275987))

(assert (=> b!260567 m!276295))

(declare-fun m!276427 () Bool)

(assert (=> b!260567 m!276427))

(assert (=> b!260558 m!276295))

(assert (=> b!260558 m!276295))

(assert (=> b!260558 m!276303))

(assert (=> b!260199 d!62589))

(declare-fun b!260573 () Bool)

(declare-fun e!168871 () (_ BitVec 32))

(declare-fun call!24854 () (_ BitVec 32))

(assert (=> b!260573 (= e!168871 (bvadd #b00000000000000000000000000000001 call!24854))))

(declare-fun bm!24851 () Bool)

(assert (=> bm!24851 (= call!24854 (arrayCountValidKeys!0 lt!131133 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!260574 () Bool)

(declare-fun e!168870 () (_ BitVec 32))

(assert (=> b!260574 (= e!168870 #b00000000000000000000000000000000)))

(declare-fun d!62591 () Bool)

(declare-fun lt!131470 () (_ BitVec 32))

(assert (=> d!62591 (and (bvsge lt!131470 #b00000000000000000000000000000000) (bvsle lt!131470 (bvsub (size!6312 lt!131133) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!62591 (= lt!131470 e!168870)))

(declare-fun c!44295 () Bool)

(assert (=> d!62591 (= c!44295 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62591 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6312 lt!131133)))))

(assert (=> d!62591 (= (arrayCountValidKeys!0 lt!131133 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!131470)))

(declare-fun b!260575 () Bool)

(assert (=> b!260575 (= e!168871 call!24854)))

(declare-fun b!260576 () Bool)

(assert (=> b!260576 (= e!168870 e!168871)))

(declare-fun c!44296 () Bool)

(assert (=> b!260576 (= c!44296 (validKeyInArray!0 (select (arr!5963 lt!131133) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (= (and d!62591 c!44295) b!260574))

(assert (= (and d!62591 (not c!44295)) b!260576))

(assert (= (and b!260576 c!44296) b!260573))

(assert (= (and b!260576 (not c!44296)) b!260575))

(assert (= (or b!260573 b!260575) bm!24851))

(declare-fun m!276429 () Bool)

(assert (=> bm!24851 m!276429))

(declare-fun m!276431 () Bool)

(assert (=> b!260576 m!276431))

(assert (=> b!260576 m!276431))

(declare-fun m!276433 () Bool)

(assert (=> b!260576 m!276433))

(assert (=> bm!24796 d!62591))

(declare-fun d!62593 () Bool)

(assert (=> d!62593 (= (inRange!0 (ite c!44244 (index!6902 lt!131343) (index!6905 lt!131343)) (mask!11121 thiss!1504)) (and (bvsge (ite c!44244 (index!6902 lt!131343) (index!6905 lt!131343)) #b00000000000000000000000000000000) (bvslt (ite c!44244 (index!6902 lt!131343) (index!6905 lt!131343)) (bvadd (mask!11121 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24834 d!62593))

(declare-fun d!62595 () Bool)

(assert (=> d!62595 (= (apply!258 lt!131319 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3072 (getValueByKey!316 (toList!1946 lt!131319) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9176 () Bool)

(assert (= bs!9176 d!62595))

(assert (=> bs!9176 m!276133))

(assert (=> bs!9176 m!276133))

(declare-fun m!276435 () Bool)

(assert (=> bs!9176 m!276435))

(assert (=> b!260342 d!62595))

(declare-fun d!62597 () Bool)

(declare-fun res!127353 () Bool)

(declare-fun e!168872 () Bool)

(assert (=> d!62597 (=> res!127353 e!168872)))

(assert (=> d!62597 (= res!127353 (= (select (arr!5963 lt!131133) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62597 (= (arrayContainsKey!0 lt!131133 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!168872)))

(declare-fun b!260577 () Bool)

(declare-fun e!168873 () Bool)

(assert (=> b!260577 (= e!168872 e!168873)))

(declare-fun res!127354 () Bool)

(assert (=> b!260577 (=> (not res!127354) (not e!168873))))

(assert (=> b!260577 (= res!127354 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6312 lt!131133)))))

(declare-fun b!260578 () Bool)

(assert (=> b!260578 (= e!168873 (arrayContainsKey!0 lt!131133 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62597 (not res!127353)) b!260577))

(assert (= (and b!260577 res!127354) b!260578))

(assert (=> d!62597 m!276275))

(declare-fun m!276437 () Bool)

(assert (=> b!260578 m!276437))

(assert (=> b!260224 d!62597))

(declare-fun b!260579 () Bool)

(declare-fun e!168875 () (_ BitVec 32))

(declare-fun call!24855 () (_ BitVec 32))

(assert (=> b!260579 (= e!168875 (bvadd #b00000000000000000000000000000001 call!24855))))

(declare-fun bm!24852 () Bool)

(assert (=> bm!24852 (= call!24855 (arrayCountValidKeys!0 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260580 () Bool)

(declare-fun e!168874 () (_ BitVec 32))

(assert (=> b!260580 (= e!168874 #b00000000000000000000000000000000)))

(declare-fun d!62599 () Bool)

(declare-fun lt!131471 () (_ BitVec 32))

(assert (=> d!62599 (and (bvsge lt!131471 #b00000000000000000000000000000000) (bvsle lt!131471 (bvsub (size!6312 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!62599 (= lt!131471 e!168874)))

(declare-fun c!44297 () Bool)

(assert (=> d!62599 (= c!44297 (bvsge #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> d!62599 (and (bvsle #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6312 (_keys!6975 thiss!1504)) (size!6312 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))))))))

(assert (=> d!62599 (= (arrayCountValidKeys!0 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))) lt!131471)))

(declare-fun b!260581 () Bool)

(assert (=> b!260581 (= e!168875 call!24855)))

(declare-fun b!260582 () Bool)

(assert (=> b!260582 (= e!168874 e!168875)))

(declare-fun c!44298 () Bool)

(assert (=> b!260582 (= c!44298 (validKeyInArray!0 (select (arr!5963 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!62599 c!44297) b!260580))

(assert (= (and d!62599 (not c!44297)) b!260582))

(assert (= (and b!260582 c!44298) b!260579))

(assert (= (and b!260582 (not c!44298)) b!260581))

(assert (= (or b!260579 b!260581) bm!24852))

(declare-fun m!276439 () Bool)

(assert (=> bm!24852 m!276439))

(assert (=> b!260582 m!276295))

(assert (=> b!260582 m!276295))

(assert (=> b!260582 m!276303))

(assert (=> b!260310 d!62599))

(assert (=> b!260310 d!62463))

(declare-fun d!62601 () Bool)

(assert (=> d!62601 (= (apply!258 lt!131319 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)) (get!3072 (getValueByKey!316 (toList!1946 lt!131319) (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9177 () Bool)

(assert (= bs!9177 d!62601))

(assert (=> bs!9177 m!275921))

(declare-fun m!276441 () Bool)

(assert (=> bs!9177 m!276441))

(assert (=> bs!9177 m!276441))

(declare-fun m!276443 () Bool)

(assert (=> bs!9177 m!276443))

(assert (=> b!260344 d!62601))

(declare-fun d!62603 () Bool)

(declare-fun c!44301 () Bool)

(assert (=> d!62603 (= c!44301 ((_ is ValueCellFull!2967) (select (arr!5962 (_values!4778 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!168878 () V!8475)

(assert (=> d!62603 (= (get!3071 (select (arr!5962 (_values!4778 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168878)))

(declare-fun b!260587 () Bool)

(declare-fun get!3073 (ValueCell!2967 V!8475) V!8475)

(assert (=> b!260587 (= e!168878 (get!3073 (select (arr!5962 (_values!4778 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260588 () Bool)

(declare-fun get!3074 (ValueCell!2967 V!8475) V!8475)

(assert (=> b!260588 (= e!168878 (get!3074 (select (arr!5962 (_values!4778 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62603 c!44301) b!260587))

(assert (= (and d!62603 (not c!44301)) b!260588))

(assert (=> b!260587 m!276081))

(assert (=> b!260587 m!275987))

(declare-fun m!276445 () Bool)

(assert (=> b!260587 m!276445))

(assert (=> b!260588 m!276081))

(assert (=> b!260588 m!275987))

(declare-fun m!276447 () Bool)

(assert (=> b!260588 m!276447))

(assert (=> b!260344 d!62603))

(declare-fun d!62605 () Bool)

(assert (=> d!62605 (arrayNoDuplicates!0 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) #b00000000000000000000000000000000 Nil!3824)))

(assert (=> d!62605 true))

(declare-fun _$65!92 () Unit!8087)

(assert (=> d!62605 (= (choose!41 (_keys!6975 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3824) _$65!92)))

(declare-fun bs!9178 () Bool)

(assert (= bs!9178 d!62605))

(assert (=> bs!9178 m!275805))

(assert (=> bs!9178 m!276007))

(assert (=> d!62479 d!62605))

(assert (=> b!260279 d!62501))

(declare-fun d!62607 () Bool)

(assert (=> d!62607 (= (apply!258 lt!131263 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3072 (getValueByKey!316 (toList!1946 lt!131263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9179 () Bool)

(assert (= bs!9179 d!62607))

(declare-fun m!276449 () Bool)

(assert (=> bs!9179 m!276449))

(assert (=> bs!9179 m!276449))

(declare-fun m!276451 () Bool)

(assert (=> bs!9179 m!276451))

(assert (=> b!260280 d!62607))

(assert (=> d!62497 d!62453))

(declare-fun b!260605 () Bool)

(declare-fun e!168889 () Bool)

(declare-fun e!168890 () Bool)

(assert (=> b!260605 (= e!168889 e!168890)))

(declare-fun c!44307 () Bool)

(declare-fun lt!131474 () SeekEntryResult!1183)

(assert (=> b!260605 (= c!44307 ((_ is MissingVacant!1183) lt!131474))))

(declare-fun bm!24857 () Bool)

(declare-fun call!24861 () Bool)

(declare-fun c!44306 () Bool)

(assert (=> bm!24857 (= call!24861 (inRange!0 (ite c!44306 (index!6902 lt!131474) (index!6905 lt!131474)) (mask!11121 thiss!1504)))))

(declare-fun b!260606 () Bool)

(declare-fun res!127366 () Bool)

(assert (=> b!260606 (= res!127366 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6902 lt!131474)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!168887 () Bool)

(assert (=> b!260606 (=> (not res!127366) (not e!168887))))

(declare-fun b!260607 () Bool)

(declare-fun res!127363 () Bool)

(declare-fun e!168888 () Bool)

(assert (=> b!260607 (=> (not res!127363) (not e!168888))))

(assert (=> b!260607 (= res!127363 call!24861)))

(assert (=> b!260607 (= e!168890 e!168888)))

(declare-fun b!260608 () Bool)

(declare-fun call!24860 () Bool)

(assert (=> b!260608 (= e!168887 (not call!24860))))

(declare-fun b!260609 () Bool)

(assert (=> b!260609 (= e!168888 (not call!24860))))

(declare-fun d!62609 () Bool)

(assert (=> d!62609 e!168889))

(assert (=> d!62609 (= c!44306 ((_ is MissingZero!1183) lt!131474))))

(assert (=> d!62609 (= lt!131474 (seekEntryOrOpen!0 key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(assert (=> d!62609 true))

(declare-fun _$34!1125 () Unit!8087)

(assert (=> d!62609 (= (choose!1267 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 (defaultEntry!4795 thiss!1504)) _$34!1125)))

(declare-fun bm!24858 () Bool)

(assert (=> bm!24858 (= call!24860 (arrayContainsKey!0 (_keys!6975 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260610 () Bool)

(assert (=> b!260610 (= e!168889 e!168887)))

(declare-fun res!127364 () Bool)

(assert (=> b!260610 (= res!127364 call!24861)))

(assert (=> b!260610 (=> (not res!127364) (not e!168887))))

(declare-fun b!260611 () Bool)

(assert (=> b!260611 (= e!168890 ((_ is Undefined!1183) lt!131474))))

(declare-fun b!260612 () Bool)

(declare-fun res!127365 () Bool)

(assert (=> b!260612 (=> (not res!127365) (not e!168888))))

(assert (=> b!260612 (= res!127365 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6905 lt!131474)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!62609 c!44306) b!260610))

(assert (= (and d!62609 (not c!44306)) b!260605))

(assert (= (and b!260610 res!127364) b!260606))

(assert (= (and b!260606 res!127366) b!260608))

(assert (= (and b!260605 c!44307) b!260607))

(assert (= (and b!260605 (not c!44307)) b!260611))

(assert (= (and b!260607 res!127363) b!260612))

(assert (= (and b!260612 res!127365) b!260609))

(assert (= (or b!260610 b!260607) bm!24857))

(assert (= (or b!260608 b!260609) bm!24858))

(declare-fun m!276453 () Bool)

(assert (=> bm!24857 m!276453))

(assert (=> d!62609 m!275745))

(declare-fun m!276455 () Bool)

(assert (=> b!260606 m!276455))

(assert (=> bm!24858 m!275759))

(declare-fun m!276457 () Bool)

(assert (=> b!260612 m!276457))

(assert (=> d!62497 d!62609))

(assert (=> d!62497 d!62467))

(declare-fun d!62611 () Bool)

(assert (=> d!62611 (= (apply!258 lt!131263 (select (arr!5963 lt!131133) #b00000000000000000000000000000000)) (get!3072 (getValueByKey!316 (toList!1946 lt!131263) (select (arr!5963 lt!131133) #b00000000000000000000000000000000))))))

(declare-fun bs!9180 () Bool)

(assert (= bs!9180 d!62611))

(assert (=> bs!9180 m!275909))

(assert (=> bs!9180 m!276335))

(assert (=> bs!9180 m!276335))

(declare-fun m!276459 () Bool)

(assert (=> bs!9180 m!276459))

(assert (=> b!260282 d!62611))

(declare-fun c!44308 () Bool)

(declare-fun d!62613 () Bool)

(assert (=> d!62613 (= c!44308 ((_ is ValueCellFull!2967) (select (arr!5962 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!168891 () V!8475)

(assert (=> d!62613 (= (get!3071 (select (arr!5962 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!168891)))

(declare-fun b!260613 () Bool)

(assert (=> b!260613 (= e!168891 (get!3073 (select (arr!5962 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260614 () Bool)

(assert (=> b!260614 (= e!168891 (get!3074 (select (arr!5962 (array!12596 (store (arr!5962 (_values!4778 thiss!1504)) index!297 (ValueCellFull!2967 v!346)) (size!6311 (_values!4778 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!601 (defaultEntry!4795 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62613 c!44308) b!260613))

(assert (= (and d!62613 (not c!44308)) b!260614))

(assert (=> b!260613 m!275985))

(assert (=> b!260613 m!275987))

(declare-fun m!276461 () Bool)

(assert (=> b!260613 m!276461))

(assert (=> b!260614 m!275985))

(assert (=> b!260614 m!275987))

(declare-fun m!276463 () Bool)

(assert (=> b!260614 m!276463))

(assert (=> b!260282 d!62613))

(declare-fun d!62615 () Bool)

(assert (=> d!62615 (= (apply!258 lt!131324 lt!131331) (get!3072 (getValueByKey!316 (toList!1946 lt!131324) lt!131331)))))

(declare-fun bs!9181 () Bool)

(assert (= bs!9181 d!62615))

(declare-fun m!276465 () Bool)

(assert (=> bs!9181 m!276465))

(assert (=> bs!9181 m!276465))

(declare-fun m!276467 () Bool)

(assert (=> bs!9181 m!276467))

(assert (=> b!260346 d!62615))

(declare-fun d!62617 () Bool)

(assert (=> d!62617 (= (apply!258 lt!131334 lt!131323) (get!3072 (getValueByKey!316 (toList!1946 lt!131334) lt!131323)))))

(declare-fun bs!9182 () Bool)

(assert (= bs!9182 d!62617))

(declare-fun m!276469 () Bool)

(assert (=> bs!9182 m!276469))

(assert (=> bs!9182 m!276469))

(declare-fun m!276471 () Bool)

(assert (=> bs!9182 m!276471))

(assert (=> b!260346 d!62617))

(declare-fun d!62619 () Bool)

(declare-fun e!168892 () Bool)

(assert (=> d!62619 e!168892))

(declare-fun res!127367 () Bool)

(assert (=> d!62619 (=> (not res!127367) (not e!168892))))

(declare-fun lt!131476 () ListLongMap!3861)

(assert (=> d!62619 (= res!127367 (contains!1891 lt!131476 (_1!2485 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504)))))))

(declare-fun lt!131478 () List!3826)

(assert (=> d!62619 (= lt!131476 (ListLongMap!3862 lt!131478))))

(declare-fun lt!131477 () Unit!8087)

(declare-fun lt!131475 () Unit!8087)

(assert (=> d!62619 (= lt!131477 lt!131475)))

(assert (=> d!62619 (= (getValueByKey!316 lt!131478 (_1!2485 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62619 (= lt!131475 (lemmaContainsTupThenGetReturnValue!172 lt!131478 (_1!2485 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62619 (= lt!131478 (insertStrictlySorted!175 (toList!1946 lt!131327) (_1!2485 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62619 (= (+!699 lt!131327 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504))) lt!131476)))

(declare-fun b!260615 () Bool)

(declare-fun res!127368 () Bool)

(assert (=> b!260615 (=> (not res!127368) (not e!168892))))

(assert (=> b!260615 (= res!127368 (= (getValueByKey!316 (toList!1946 lt!131476) (_1!2485 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504))))))))

(declare-fun b!260616 () Bool)

(assert (=> b!260616 (= e!168892 (contains!1893 (toList!1946 lt!131476) (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504))))))

(assert (= (and d!62619 res!127367) b!260615))

(assert (= (and b!260615 res!127368) b!260616))

(declare-fun m!276473 () Bool)

(assert (=> d!62619 m!276473))

(declare-fun m!276475 () Bool)

(assert (=> d!62619 m!276475))

(declare-fun m!276477 () Bool)

(assert (=> d!62619 m!276477))

(declare-fun m!276479 () Bool)

(assert (=> d!62619 m!276479))

(declare-fun m!276481 () Bool)

(assert (=> b!260615 m!276481))

(declare-fun m!276483 () Bool)

(assert (=> b!260616 m!276483))

(assert (=> b!260346 d!62619))

(declare-fun d!62621 () Bool)

(assert (=> d!62621 (contains!1891 (+!699 lt!131327 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504))) lt!131330)))

(declare-fun lt!131479 () Unit!8087)

(assert (=> d!62621 (= lt!131479 (choose!1269 lt!131327 lt!131333 (zeroValue!4636 thiss!1504) lt!131330))))

(assert (=> d!62621 (contains!1891 lt!131327 lt!131330)))

(assert (=> d!62621 (= (addStillContains!234 lt!131327 lt!131333 (zeroValue!4636 thiss!1504) lt!131330) lt!131479)))

(declare-fun bs!9183 () Bool)

(assert (= bs!9183 d!62621))

(assert (=> bs!9183 m!276069))

(assert (=> bs!9183 m!276069))

(assert (=> bs!9183 m!276071))

(declare-fun m!276485 () Bool)

(assert (=> bs!9183 m!276485))

(declare-fun m!276487 () Bool)

(assert (=> bs!9183 m!276487))

(assert (=> b!260346 d!62621))

(assert (=> b!260346 d!62503))

(declare-fun d!62623 () Bool)

(declare-fun e!168894 () Bool)

(assert (=> d!62623 e!168894))

(declare-fun res!127369 () Bool)

(assert (=> d!62623 (=> res!127369 e!168894)))

(declare-fun lt!131482 () Bool)

(assert (=> d!62623 (= res!127369 (not lt!131482))))

(declare-fun lt!131481 () Bool)

(assert (=> d!62623 (= lt!131482 lt!131481)))

(declare-fun lt!131480 () Unit!8087)

(declare-fun e!168893 () Unit!8087)

(assert (=> d!62623 (= lt!131480 e!168893)))

(declare-fun c!44309 () Bool)

(assert (=> d!62623 (= c!44309 lt!131481)))

(assert (=> d!62623 (= lt!131481 (containsKey!308 (toList!1946 (+!699 lt!131327 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504)))) lt!131330))))

(assert (=> d!62623 (= (contains!1891 (+!699 lt!131327 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504))) lt!131330) lt!131482)))

(declare-fun b!260617 () Bool)

(declare-fun lt!131483 () Unit!8087)

(assert (=> b!260617 (= e!168893 lt!131483)))

(assert (=> b!260617 (= lt!131483 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 (+!699 lt!131327 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504)))) lt!131330))))

(assert (=> b!260617 (isDefined!257 (getValueByKey!316 (toList!1946 (+!699 lt!131327 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504)))) lt!131330))))

(declare-fun b!260618 () Bool)

(declare-fun Unit!8102 () Unit!8087)

(assert (=> b!260618 (= e!168893 Unit!8102)))

(declare-fun b!260619 () Bool)

(assert (=> b!260619 (= e!168894 (isDefined!257 (getValueByKey!316 (toList!1946 (+!699 lt!131327 (tuple2!4949 lt!131333 (zeroValue!4636 thiss!1504)))) lt!131330)))))

(assert (= (and d!62623 c!44309) b!260617))

(assert (= (and d!62623 (not c!44309)) b!260618))

(assert (= (and d!62623 (not res!127369)) b!260619))

(declare-fun m!276489 () Bool)

(assert (=> d!62623 m!276489))

(declare-fun m!276491 () Bool)

(assert (=> b!260617 m!276491))

(declare-fun m!276493 () Bool)

(assert (=> b!260617 m!276493))

(assert (=> b!260617 m!276493))

(declare-fun m!276495 () Bool)

(assert (=> b!260617 m!276495))

(assert (=> b!260619 m!276493))

(assert (=> b!260619 m!276493))

(assert (=> b!260619 m!276495))

(assert (=> b!260346 d!62623))

(declare-fun d!62625 () Bool)

(declare-fun e!168895 () Bool)

(assert (=> d!62625 e!168895))

(declare-fun res!127370 () Bool)

(assert (=> d!62625 (=> (not res!127370) (not e!168895))))

(declare-fun lt!131485 () ListLongMap!3861)

(assert (=> d!62625 (= res!127370 (contains!1891 lt!131485 (_1!2485 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504)))))))

(declare-fun lt!131487 () List!3826)

(assert (=> d!62625 (= lt!131485 (ListLongMap!3862 lt!131487))))

(declare-fun lt!131486 () Unit!8087)

(declare-fun lt!131484 () Unit!8087)

(assert (=> d!62625 (= lt!131486 lt!131484)))

(assert (=> d!62625 (= (getValueByKey!316 lt!131487 (_1!2485 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62625 (= lt!131484 (lemmaContainsTupThenGetReturnValue!172 lt!131487 (_1!2485 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62625 (= lt!131487 (insertStrictlySorted!175 (toList!1946 lt!131334) (_1!2485 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504)))))))

(assert (=> d!62625 (= (+!699 lt!131334 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504))) lt!131485)))

(declare-fun b!260620 () Bool)

(declare-fun res!127371 () Bool)

(assert (=> b!260620 (=> (not res!127371) (not e!168895))))

(assert (=> b!260620 (= res!127371 (= (getValueByKey!316 (toList!1946 lt!131485) (_1!2485 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504))))))))

(declare-fun b!260621 () Bool)

(assert (=> b!260621 (= e!168895 (contains!1893 (toList!1946 lt!131485) (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504))))))

(assert (= (and d!62625 res!127370) b!260620))

(assert (= (and b!260620 res!127371) b!260621))

(declare-fun m!276497 () Bool)

(assert (=> d!62625 m!276497))

(declare-fun m!276499 () Bool)

(assert (=> d!62625 m!276499))

(declare-fun m!276501 () Bool)

(assert (=> d!62625 m!276501))

(declare-fun m!276503 () Bool)

(assert (=> d!62625 m!276503))

(declare-fun m!276505 () Bool)

(assert (=> b!260620 m!276505))

(declare-fun m!276507 () Bool)

(assert (=> b!260621 m!276507))

(assert (=> b!260346 d!62625))

(declare-fun d!62627 () Bool)

(declare-fun e!168896 () Bool)

(assert (=> d!62627 e!168896))

(declare-fun res!127372 () Bool)

(assert (=> d!62627 (=> (not res!127372) (not e!168896))))

(declare-fun lt!131489 () ListLongMap!3861)

(assert (=> d!62627 (= res!127372 (contains!1891 lt!131489 (_1!2485 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504)))))))

(declare-fun lt!131491 () List!3826)

(assert (=> d!62627 (= lt!131489 (ListLongMap!3862 lt!131491))))

(declare-fun lt!131490 () Unit!8087)

(declare-fun lt!131488 () Unit!8087)

(assert (=> d!62627 (= lt!131490 lt!131488)))

(assert (=> d!62627 (= (getValueByKey!316 lt!131491 (_1!2485 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504)))))))

(assert (=> d!62627 (= lt!131488 (lemmaContainsTupThenGetReturnValue!172 lt!131491 (_1!2485 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504)))))))

(assert (=> d!62627 (= lt!131491 (insertStrictlySorted!175 (toList!1946 lt!131324) (_1!2485 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504)))))))

(assert (=> d!62627 (= (+!699 lt!131324 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504))) lt!131489)))

(declare-fun b!260622 () Bool)

(declare-fun res!127373 () Bool)

(assert (=> b!260622 (=> (not res!127373) (not e!168896))))

(assert (=> b!260622 (= res!127373 (= (getValueByKey!316 (toList!1946 lt!131489) (_1!2485 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504))))))))

(declare-fun b!260623 () Bool)

(assert (=> b!260623 (= e!168896 (contains!1893 (toList!1946 lt!131489) (tuple2!4949 lt!131337 (minValue!4636 thiss!1504))))))

(assert (= (and d!62627 res!127372) b!260622))

(assert (= (and b!260622 res!127373) b!260623))

(declare-fun m!276509 () Bool)

(assert (=> d!62627 m!276509))

(declare-fun m!276511 () Bool)

(assert (=> d!62627 m!276511))

(declare-fun m!276513 () Bool)

(assert (=> d!62627 m!276513))

(declare-fun m!276515 () Bool)

(assert (=> d!62627 m!276515))

(declare-fun m!276517 () Bool)

(assert (=> b!260622 m!276517))

(declare-fun m!276519 () Bool)

(assert (=> b!260623 m!276519))

(assert (=> b!260346 d!62627))

(declare-fun d!62629 () Bool)

(assert (=> d!62629 (= (apply!258 (+!699 lt!131324 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504))) lt!131331) (apply!258 lt!131324 lt!131331))))

(declare-fun lt!131492 () Unit!8087)

(assert (=> d!62629 (= lt!131492 (choose!1268 lt!131324 lt!131337 (minValue!4636 thiss!1504) lt!131331))))

(declare-fun e!168897 () Bool)

(assert (=> d!62629 e!168897))

(declare-fun res!127374 () Bool)

(assert (=> d!62629 (=> (not res!127374) (not e!168897))))

(assert (=> d!62629 (= res!127374 (contains!1891 lt!131324 lt!131331))))

(assert (=> d!62629 (= (addApplyDifferent!234 lt!131324 lt!131337 (minValue!4636 thiss!1504) lt!131331) lt!131492)))

(declare-fun b!260624 () Bool)

(assert (=> b!260624 (= e!168897 (not (= lt!131331 lt!131337)))))

(assert (= (and d!62629 res!127374) b!260624))

(declare-fun m!276521 () Bool)

(assert (=> d!62629 m!276521))

(assert (=> d!62629 m!276051))

(assert (=> d!62629 m!276065))

(assert (=> d!62629 m!276065))

(assert (=> d!62629 m!276067))

(declare-fun m!276523 () Bool)

(assert (=> d!62629 m!276523))

(assert (=> b!260346 d!62629))

(declare-fun d!62631 () Bool)

(declare-fun e!168898 () Bool)

(assert (=> d!62631 e!168898))

(declare-fun res!127375 () Bool)

(assert (=> d!62631 (=> (not res!127375) (not e!168898))))

(declare-fun lt!131494 () ListLongMap!3861)

(assert (=> d!62631 (= res!127375 (contains!1891 lt!131494 (_1!2485 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504)))))))

(declare-fun lt!131496 () List!3826)

(assert (=> d!62631 (= lt!131494 (ListLongMap!3862 lt!131496))))

(declare-fun lt!131495 () Unit!8087)

(declare-fun lt!131493 () Unit!8087)

(assert (=> d!62631 (= lt!131495 lt!131493)))

(assert (=> d!62631 (= (getValueByKey!316 lt!131496 (_1!2485 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504)))))))

(assert (=> d!62631 (= lt!131493 (lemmaContainsTupThenGetReturnValue!172 lt!131496 (_1!2485 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504)))))))

(assert (=> d!62631 (= lt!131496 (insertStrictlySorted!175 (toList!1946 lt!131328) (_1!2485 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504)))))))

(assert (=> d!62631 (= (+!699 lt!131328 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504))) lt!131494)))

(declare-fun b!260625 () Bool)

(declare-fun res!127376 () Bool)

(assert (=> b!260625 (=> (not res!127376) (not e!168898))))

(assert (=> b!260625 (= res!127376 (= (getValueByKey!316 (toList!1946 lt!131494) (_1!2485 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504))))))))

(declare-fun b!260626 () Bool)

(assert (=> b!260626 (= e!168898 (contains!1893 (toList!1946 lt!131494) (tuple2!4949 lt!131318 (minValue!4636 thiss!1504))))))

(assert (= (and d!62631 res!127375) b!260625))

(assert (= (and b!260625 res!127376) b!260626))

(declare-fun m!276525 () Bool)

(assert (=> d!62631 m!276525))

(declare-fun m!276527 () Bool)

(assert (=> d!62631 m!276527))

(declare-fun m!276529 () Bool)

(assert (=> d!62631 m!276529))

(declare-fun m!276531 () Bool)

(assert (=> d!62631 m!276531))

(declare-fun m!276533 () Bool)

(assert (=> b!260625 m!276533))

(declare-fun m!276535 () Bool)

(assert (=> b!260626 m!276535))

(assert (=> b!260346 d!62631))

(declare-fun d!62633 () Bool)

(assert (=> d!62633 (= (apply!258 (+!699 lt!131334 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504))) lt!131323) (apply!258 lt!131334 lt!131323))))

(declare-fun lt!131497 () Unit!8087)

(assert (=> d!62633 (= lt!131497 (choose!1268 lt!131334 lt!131321 (zeroValue!4636 thiss!1504) lt!131323))))

(declare-fun e!168899 () Bool)

(assert (=> d!62633 e!168899))

(declare-fun res!127377 () Bool)

(assert (=> d!62633 (=> (not res!127377) (not e!168899))))

(assert (=> d!62633 (= res!127377 (contains!1891 lt!131334 lt!131323))))

(assert (=> d!62633 (= (addApplyDifferent!234 lt!131334 lt!131321 (zeroValue!4636 thiss!1504) lt!131323) lt!131497)))

(declare-fun b!260627 () Bool)

(assert (=> b!260627 (= e!168899 (not (= lt!131323 lt!131321)))))

(assert (= (and d!62633 res!127377) b!260627))

(declare-fun m!276537 () Bool)

(assert (=> d!62633 m!276537))

(assert (=> d!62633 m!276059))

(assert (=> d!62633 m!276045))

(assert (=> d!62633 m!276045))

(assert (=> d!62633 m!276049))

(declare-fun m!276539 () Bool)

(assert (=> d!62633 m!276539))

(assert (=> b!260346 d!62633))

(declare-fun d!62635 () Bool)

(assert (=> d!62635 (= (apply!258 (+!699 lt!131328 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504))) lt!131320) (apply!258 lt!131328 lt!131320))))

(declare-fun lt!131498 () Unit!8087)

(assert (=> d!62635 (= lt!131498 (choose!1268 lt!131328 lt!131318 (minValue!4636 thiss!1504) lt!131320))))

(declare-fun e!168900 () Bool)

(assert (=> d!62635 e!168900))

(declare-fun res!127378 () Bool)

(assert (=> d!62635 (=> (not res!127378) (not e!168900))))

(assert (=> d!62635 (= res!127378 (contains!1891 lt!131328 lt!131320))))

(assert (=> d!62635 (= (addApplyDifferent!234 lt!131328 lt!131318 (minValue!4636 thiss!1504) lt!131320) lt!131498)))

(declare-fun b!260628 () Bool)

(assert (=> b!260628 (= e!168900 (not (= lt!131320 lt!131318)))))

(assert (= (and d!62635 res!127378) b!260628))

(declare-fun m!276541 () Bool)

(assert (=> d!62635 m!276541))

(assert (=> d!62635 m!276047))

(assert (=> d!62635 m!276061))

(assert (=> d!62635 m!276061))

(assert (=> d!62635 m!276063))

(declare-fun m!276543 () Bool)

(assert (=> d!62635 m!276543))

(assert (=> b!260346 d!62635))

(declare-fun d!62637 () Bool)

(assert (=> d!62637 (= (apply!258 (+!699 lt!131328 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504))) lt!131320) (get!3072 (getValueByKey!316 (toList!1946 (+!699 lt!131328 (tuple2!4949 lt!131318 (minValue!4636 thiss!1504)))) lt!131320)))))

(declare-fun bs!9184 () Bool)

(assert (= bs!9184 d!62637))

(declare-fun m!276545 () Bool)

(assert (=> bs!9184 m!276545))

(assert (=> bs!9184 m!276545))

(declare-fun m!276547 () Bool)

(assert (=> bs!9184 m!276547))

(assert (=> b!260346 d!62637))

(declare-fun d!62639 () Bool)

(assert (=> d!62639 (= (apply!258 lt!131328 lt!131320) (get!3072 (getValueByKey!316 (toList!1946 lt!131328) lt!131320)))))

(declare-fun bs!9185 () Bool)

(assert (= bs!9185 d!62639))

(declare-fun m!276549 () Bool)

(assert (=> bs!9185 m!276549))

(assert (=> bs!9185 m!276549))

(declare-fun m!276551 () Bool)

(assert (=> bs!9185 m!276551))

(assert (=> b!260346 d!62639))

(declare-fun d!62641 () Bool)

(assert (=> d!62641 (= (apply!258 (+!699 lt!131334 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504))) lt!131323) (get!3072 (getValueByKey!316 (toList!1946 (+!699 lt!131334 (tuple2!4949 lt!131321 (zeroValue!4636 thiss!1504)))) lt!131323)))))

(declare-fun bs!9186 () Bool)

(assert (= bs!9186 d!62641))

(declare-fun m!276553 () Bool)

(assert (=> bs!9186 m!276553))

(assert (=> bs!9186 m!276553))

(declare-fun m!276555 () Bool)

(assert (=> bs!9186 m!276555))

(assert (=> b!260346 d!62641))

(declare-fun d!62643 () Bool)

(assert (=> d!62643 (= (apply!258 (+!699 lt!131324 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504))) lt!131331) (get!3072 (getValueByKey!316 (toList!1946 (+!699 lt!131324 (tuple2!4949 lt!131337 (minValue!4636 thiss!1504)))) lt!131331)))))

(declare-fun bs!9187 () Bool)

(assert (= bs!9187 d!62643))

(declare-fun m!276557 () Bool)

(assert (=> bs!9187 m!276557))

(assert (=> bs!9187 m!276557))

(declare-fun m!276559 () Bool)

(assert (=> bs!9187 m!276559))

(assert (=> b!260346 d!62643))

(assert (=> bm!24818 d!62545))

(declare-fun d!62645 () Bool)

(declare-fun e!168915 () Bool)

(assert (=> d!62645 e!168915))

(declare-fun c!44317 () Bool)

(declare-fun lt!131503 () SeekEntryResult!1183)

(assert (=> d!62645 (= c!44317 (and ((_ is Intermediate!1183) lt!131503) (undefined!1995 lt!131503)))))

(declare-fun e!168913 () SeekEntryResult!1183)

(assert (=> d!62645 (= lt!131503 e!168913)))

(declare-fun c!44316 () Bool)

(assert (=> d!62645 (= c!44316 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!131504 () (_ BitVec 64))

(assert (=> d!62645 (= lt!131504 (select (arr!5963 (_keys!6975 thiss!1504)) (toIndex!0 key!932 (mask!11121 thiss!1504))))))

(assert (=> d!62645 (validMask!0 (mask!11121 thiss!1504))))

(assert (=> d!62645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11121 thiss!1504)) key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)) lt!131503)))

(declare-fun b!260647 () Bool)

(declare-fun e!168911 () SeekEntryResult!1183)

(assert (=> b!260647 (= e!168913 e!168911)))

(declare-fun c!44318 () Bool)

(assert (=> b!260647 (= c!44318 (or (= lt!131504 key!932) (= (bvadd lt!131504 lt!131504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260648 () Bool)

(assert (=> b!260648 (= e!168913 (Intermediate!1183 true (toIndex!0 key!932 (mask!11121 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!260649 () Bool)

(assert (=> b!260649 (and (bvsge (index!6904 lt!131503) #b00000000000000000000000000000000) (bvslt (index!6904 lt!131503) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun e!168912 () Bool)

(assert (=> b!260649 (= e!168912 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6904 lt!131503)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260650 () Bool)

(assert (=> b!260650 (= e!168915 (bvsge (x!25121 lt!131503) #b01111111111111111111111111111110))))

(declare-fun b!260651 () Bool)

(assert (=> b!260651 (= e!168911 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11121 thiss!1504)) #b00000000000000000000000000000000 (mask!11121 thiss!1504)) key!932 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(declare-fun b!260652 () Bool)

(assert (=> b!260652 (and (bvsge (index!6904 lt!131503) #b00000000000000000000000000000000) (bvslt (index!6904 lt!131503) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun res!127386 () Bool)

(assert (=> b!260652 (= res!127386 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6904 lt!131503)) key!932))))

(assert (=> b!260652 (=> res!127386 e!168912)))

(declare-fun e!168914 () Bool)

(assert (=> b!260652 (= e!168914 e!168912)))

(declare-fun b!260653 () Bool)

(assert (=> b!260653 (= e!168915 e!168914)))

(declare-fun res!127387 () Bool)

(assert (=> b!260653 (= res!127387 (and ((_ is Intermediate!1183) lt!131503) (not (undefined!1995 lt!131503)) (bvslt (x!25121 lt!131503) #b01111111111111111111111111111110) (bvsge (x!25121 lt!131503) #b00000000000000000000000000000000) (bvsge (x!25121 lt!131503) #b00000000000000000000000000000000)))))

(assert (=> b!260653 (=> (not res!127387) (not e!168914))))

(declare-fun b!260654 () Bool)

(assert (=> b!260654 (= e!168911 (Intermediate!1183 false (toIndex!0 key!932 (mask!11121 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!260655 () Bool)

(assert (=> b!260655 (and (bvsge (index!6904 lt!131503) #b00000000000000000000000000000000) (bvslt (index!6904 lt!131503) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun res!127385 () Bool)

(assert (=> b!260655 (= res!127385 (= (select (arr!5963 (_keys!6975 thiss!1504)) (index!6904 lt!131503)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260655 (=> res!127385 e!168912)))

(assert (= (and d!62645 c!44316) b!260648))

(assert (= (and d!62645 (not c!44316)) b!260647))

(assert (= (and b!260647 c!44318) b!260654))

(assert (= (and b!260647 (not c!44318)) b!260651))

(assert (= (and d!62645 c!44317) b!260650))

(assert (= (and d!62645 (not c!44317)) b!260653))

(assert (= (and b!260653 res!127387) b!260652))

(assert (= (and b!260652 (not res!127386)) b!260655))

(assert (= (and b!260655 (not res!127385)) b!260649))

(assert (=> d!62645 m!275883))

(declare-fun m!276561 () Bool)

(assert (=> d!62645 m!276561))

(assert (=> d!62645 m!275775))

(declare-fun m!276563 () Bool)

(assert (=> b!260649 m!276563))

(assert (=> b!260651 m!275883))

(declare-fun m!276565 () Bool)

(assert (=> b!260651 m!276565))

(assert (=> b!260651 m!276565))

(declare-fun m!276567 () Bool)

(assert (=> b!260651 m!276567))

(assert (=> b!260655 m!276563))

(assert (=> b!260652 m!276563))

(assert (=> d!62453 d!62645))

(declare-fun d!62647 () Bool)

(declare-fun lt!131510 () (_ BitVec 32))

(declare-fun lt!131509 () (_ BitVec 32))

(assert (=> d!62647 (= lt!131510 (bvmul (bvxor lt!131509 (bvlshr lt!131509 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!62647 (= lt!131509 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!62647 (and (bvsge (mask!11121 thiss!1504) #b00000000000000000000000000000000) (let ((res!127388 (let ((h!4490 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25140 (bvmul (bvxor h!4490 (bvlshr h!4490 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25140 (bvlshr x!25140 #b00000000000000000000000000001101)) (mask!11121 thiss!1504)))))) (and (bvslt res!127388 (bvadd (mask!11121 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!127388 #b00000000000000000000000000000000))))))

(assert (=> d!62647 (= (toIndex!0 key!932 (mask!11121 thiss!1504)) (bvand (bvxor lt!131510 (bvlshr lt!131510 #b00000000000000000000000000001101)) (mask!11121 thiss!1504)))))

(assert (=> d!62453 d!62647))

(assert (=> d!62453 d!62467))

(declare-fun d!62649 () Bool)

(declare-fun e!168917 () Bool)

(assert (=> d!62649 e!168917))

(declare-fun res!127389 () Bool)

(assert (=> d!62649 (=> res!127389 e!168917)))

(declare-fun lt!131513 () Bool)

(assert (=> d!62649 (= res!127389 (not lt!131513))))

(declare-fun lt!131512 () Bool)

(assert (=> d!62649 (= lt!131513 lt!131512)))

(declare-fun lt!131511 () Unit!8087)

(declare-fun e!168916 () Unit!8087)

(assert (=> d!62649 (= lt!131511 e!168916)))

(declare-fun c!44319 () Bool)

(assert (=> d!62649 (= c!44319 lt!131512)))

(assert (=> d!62649 (= lt!131512 (containsKey!308 (toList!1946 lt!131263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62649 (= (contains!1891 lt!131263 #b1000000000000000000000000000000000000000000000000000000000000000) lt!131513)))

(declare-fun b!260656 () Bool)

(declare-fun lt!131514 () Unit!8087)

(assert (=> b!260656 (= e!168916 lt!131514)))

(assert (=> b!260656 (= lt!131514 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 lt!131263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260656 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131263) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260657 () Bool)

(declare-fun Unit!8103 () Unit!8087)

(assert (=> b!260657 (= e!168916 Unit!8103)))

(declare-fun b!260658 () Bool)

(assert (=> b!260658 (= e!168917 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62649 c!44319) b!260656))

(assert (= (and d!62649 (not c!44319)) b!260657))

(assert (= (and d!62649 (not res!127389)) b!260658))

(declare-fun m!276569 () Bool)

(assert (=> d!62649 m!276569))

(declare-fun m!276571 () Bool)

(assert (=> b!260656 m!276571))

(assert (=> b!260656 m!276449))

(assert (=> b!260656 m!276449))

(declare-fun m!276573 () Bool)

(assert (=> b!260656 m!276573))

(assert (=> b!260658 m!276449))

(assert (=> b!260658 m!276449))

(assert (=> b!260658 m!276573))

(assert (=> bm!24819 d!62649))

(declare-fun d!62651 () Bool)

(declare-fun lt!131517 () Bool)

(declare-fun content!173 (List!3826) (InoxSet tuple2!4948))

(assert (=> d!62651 (= lt!131517 (select (content!173 (toList!1946 lt!131292)) (tuple2!4949 key!932 v!346)))))

(declare-fun e!168922 () Bool)

(assert (=> d!62651 (= lt!131517 e!168922)))

(declare-fun res!127394 () Bool)

(assert (=> d!62651 (=> (not res!127394) (not e!168922))))

(assert (=> d!62651 (= res!127394 ((_ is Cons!3822) (toList!1946 lt!131292)))))

(assert (=> d!62651 (= (contains!1893 (toList!1946 lt!131292) (tuple2!4949 key!932 v!346)) lt!131517)))

(declare-fun b!260663 () Bool)

(declare-fun e!168923 () Bool)

(assert (=> b!260663 (= e!168922 e!168923)))

(declare-fun res!127395 () Bool)

(assert (=> b!260663 (=> res!127395 e!168923)))

(assert (=> b!260663 (= res!127395 (= (h!4486 (toList!1946 lt!131292)) (tuple2!4949 key!932 v!346)))))

(declare-fun b!260664 () Bool)

(assert (=> b!260664 (= e!168923 (contains!1893 (t!8895 (toList!1946 lt!131292)) (tuple2!4949 key!932 v!346)))))

(assert (= (and d!62651 res!127394) b!260663))

(assert (= (and b!260663 (not res!127395)) b!260664))

(declare-fun m!276575 () Bool)

(assert (=> d!62651 m!276575))

(declare-fun m!276577 () Bool)

(assert (=> d!62651 m!276577))

(declare-fun m!276579 () Bool)

(assert (=> b!260664 m!276579))

(assert (=> b!260295 d!62651))

(assert (=> b!260196 d!62555))

(assert (=> d!62495 d!62467))

(declare-fun b!260673 () Bool)

(declare-fun res!127404 () Bool)

(declare-fun e!168926 () Bool)

(assert (=> b!260673 (=> (not res!127404) (not e!168926))))

(assert (=> b!260673 (= res!127404 (and (= (size!6311 (_values!4778 thiss!1504)) (bvadd (mask!11121 thiss!1504) #b00000000000000000000000000000001)) (= (size!6312 (_keys!6975 thiss!1504)) (size!6311 (_values!4778 thiss!1504))) (bvsge (_size!1966 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1966 thiss!1504) (bvadd (mask!11121 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!260676 () Bool)

(assert (=> b!260676 (= e!168926 (and (bvsge (extraKeys!4532 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4532 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1966 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!260674 () Bool)

(declare-fun res!127405 () Bool)

(assert (=> b!260674 (=> (not res!127405) (not e!168926))))

(declare-fun size!6315 (LongMapFixedSize!3834) (_ BitVec 32))

(assert (=> b!260674 (= res!127405 (bvsge (size!6315 thiss!1504) (_size!1966 thiss!1504)))))

(declare-fun d!62653 () Bool)

(declare-fun res!127407 () Bool)

(assert (=> d!62653 (=> (not res!127407) (not e!168926))))

(assert (=> d!62653 (= res!127407 (validMask!0 (mask!11121 thiss!1504)))))

(assert (=> d!62653 (= (simpleValid!281 thiss!1504) e!168926)))

(declare-fun b!260675 () Bool)

(declare-fun res!127406 () Bool)

(assert (=> b!260675 (=> (not res!127406) (not e!168926))))

(assert (=> b!260675 (= res!127406 (= (size!6315 thiss!1504) (bvadd (_size!1966 thiss!1504) (bvsdiv (bvadd (extraKeys!4532 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!62653 res!127407) b!260673))

(assert (= (and b!260673 res!127404) b!260674))

(assert (= (and b!260674 res!127405) b!260675))

(assert (= (and b!260675 res!127406) b!260676))

(declare-fun m!276581 () Bool)

(assert (=> b!260674 m!276581))

(assert (=> d!62653 m!275775))

(assert (=> b!260675 m!276581))

(assert (=> d!62499 d!62653))

(declare-fun b!260677 () Bool)

(declare-fun e!168928 () (_ BitVec 32))

(declare-fun call!24862 () (_ BitVec 32))

(assert (=> b!260677 (= e!168928 (bvadd #b00000000000000000000000000000001 call!24862))))

(declare-fun bm!24859 () Bool)

(assert (=> bm!24859 (= call!24862 (arrayCountValidKeys!0 lt!131133 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun b!260678 () Bool)

(declare-fun e!168927 () (_ BitVec 32))

(assert (=> b!260678 (= e!168927 #b00000000000000000000000000000000)))

(declare-fun d!62655 () Bool)

(declare-fun lt!131518 () (_ BitVec 32))

(assert (=> d!62655 (and (bvsge lt!131518 #b00000000000000000000000000000000) (bvsle lt!131518 (bvsub (size!6312 lt!131133) index!297)))))

(assert (=> d!62655 (= lt!131518 e!168927)))

(declare-fun c!44320 () Bool)

(assert (=> d!62655 (= c!44320 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!62655 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6312 lt!131133)))))

(assert (=> d!62655 (= (arrayCountValidKeys!0 lt!131133 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!131518)))

(declare-fun b!260679 () Bool)

(assert (=> b!260679 (= e!168928 call!24862)))

(declare-fun b!260680 () Bool)

(assert (=> b!260680 (= e!168927 e!168928)))

(declare-fun c!44321 () Bool)

(assert (=> b!260680 (= c!44321 (validKeyInArray!0 (select (arr!5963 lt!131133) index!297)))))

(assert (= (and d!62655 c!44320) b!260678))

(assert (= (and d!62655 (not c!44320)) b!260680))

(assert (= (and b!260680 c!44321) b!260677))

(assert (= (and b!260680 (not c!44321)) b!260679))

(assert (= (or b!260677 b!260679) bm!24859))

(declare-fun m!276583 () Bool)

(assert (=> bm!24859 m!276583))

(assert (=> b!260680 m!275901))

(assert (=> b!260680 m!275901))

(assert (=> b!260680 m!275903))

(assert (=> d!62457 d!62655))

(declare-fun d!62657 () Bool)

(assert (=> d!62657 (= (arrayCountValidKeys!0 lt!131133 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!62657 true))

(declare-fun _$85!27 () Unit!8087)

(assert (=> d!62657 (= (choose!2 lt!131133 index!297) _$85!27)))

(declare-fun bs!9188 () Bool)

(assert (= bs!9188 d!62657))

(assert (=> bs!9188 m!275897))

(assert (=> d!62457 d!62657))

(declare-fun d!62659 () Bool)

(assert (=> d!62659 (= (validKeyInArray!0 (select (arr!5963 lt!131133) index!297)) (and (not (= (select (arr!5963 lt!131133) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5963 lt!131133) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260171 d!62659))

(declare-fun d!62661 () Bool)

(declare-fun e!168930 () Bool)

(assert (=> d!62661 e!168930))

(declare-fun res!127408 () Bool)

(assert (=> d!62661 (=> res!127408 e!168930)))

(declare-fun lt!131521 () Bool)

(assert (=> d!62661 (= res!127408 (not lt!131521))))

(declare-fun lt!131520 () Bool)

(assert (=> d!62661 (= lt!131521 lt!131520)))

(declare-fun lt!131519 () Unit!8087)

(declare-fun e!168929 () Unit!8087)

(assert (=> d!62661 (= lt!131519 e!168929)))

(declare-fun c!44322 () Bool)

(assert (=> d!62661 (= c!44322 lt!131520)))

(assert (=> d!62661 (= lt!131520 (containsKey!308 (toList!1946 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504))) key!932))))

(assert (=> d!62661 (= (contains!1891 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) key!932) lt!131521)))

(declare-fun b!260681 () Bool)

(declare-fun lt!131522 () Unit!8087)

(assert (=> b!260681 (= e!168929 lt!131522)))

(assert (=> b!260681 (= lt!131522 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504))) key!932))))

(assert (=> b!260681 (isDefined!257 (getValueByKey!316 (toList!1946 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504))) key!932))))

(declare-fun b!260682 () Bool)

(declare-fun Unit!8104 () Unit!8087)

(assert (=> b!260682 (= e!168929 Unit!8104)))

(declare-fun b!260683 () Bool)

(assert (=> b!260683 (= e!168930 (isDefined!257 (getValueByKey!316 (toList!1946 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504))) key!932)))))

(assert (= (and d!62661 c!44322) b!260681))

(assert (= (and d!62661 (not c!44322)) b!260682))

(assert (= (and d!62661 (not res!127408)) b!260683))

(declare-fun m!276585 () Bool)

(assert (=> d!62661 m!276585))

(declare-fun m!276587 () Bool)

(assert (=> b!260681 m!276587))

(declare-fun m!276589 () Bool)

(assert (=> b!260681 m!276589))

(assert (=> b!260681 m!276589))

(declare-fun m!276591 () Bool)

(assert (=> b!260681 m!276591))

(assert (=> b!260683 m!276589))

(assert (=> b!260683 m!276589))

(assert (=> b!260683 m!276591))

(assert (=> d!62455 d!62661))

(assert (=> d!62455 d!62495))

(declare-fun d!62663 () Bool)

(assert (=> d!62663 (contains!1891 (getCurrentListMap!1474 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) key!932)))

(assert (=> d!62663 true))

(declare-fun _$17!89 () Unit!8087)

(assert (=> d!62663 (= (choose!1265 (_keys!6975 thiss!1504) (_values!4778 thiss!1504) (mask!11121 thiss!1504) (extraKeys!4532 thiss!1504) (zeroValue!4636 thiss!1504) (minValue!4636 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4795 thiss!1504)) _$17!89)))

(declare-fun bs!9189 () Bool)

(assert (= bs!9189 d!62663))

(assert (=> bs!9189 m!275767))

(assert (=> bs!9189 m!275767))

(assert (=> bs!9189 m!275893))

(assert (=> d!62455 d!62663))

(assert (=> d!62455 d!62467))

(declare-fun b!260684 () Bool)

(declare-fun e!168932 () Bool)

(declare-fun call!24863 () Bool)

(assert (=> b!260684 (= e!168932 call!24863)))

(declare-fun d!62665 () Bool)

(declare-fun res!127409 () Bool)

(declare-fun e!168931 () Bool)

(assert (=> d!62665 (=> res!127409 e!168931)))

(assert (=> d!62665 (= res!127409 (bvsge #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> d!62665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6975 thiss!1504) (mask!11121 thiss!1504)) e!168931)))

(declare-fun bm!24860 () Bool)

(assert (=> bm!24860 (= call!24863 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6975 thiss!1504) (mask!11121 thiss!1504)))))

(declare-fun b!260685 () Bool)

(declare-fun e!168933 () Bool)

(assert (=> b!260685 (= e!168933 call!24863)))

(declare-fun b!260686 () Bool)

(assert (=> b!260686 (= e!168932 e!168933)))

(declare-fun lt!131523 () (_ BitVec 64))

(assert (=> b!260686 (= lt!131523 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131525 () Unit!8087)

(assert (=> b!260686 (= lt!131525 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6975 thiss!1504) lt!131523 #b00000000000000000000000000000000))))

(assert (=> b!260686 (arrayContainsKey!0 (_keys!6975 thiss!1504) lt!131523 #b00000000000000000000000000000000)))

(declare-fun lt!131524 () Unit!8087)

(assert (=> b!260686 (= lt!131524 lt!131525)))

(declare-fun res!127410 () Bool)

(assert (=> b!260686 (= res!127410 (= (seekEntryOrOpen!0 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000) (_keys!6975 thiss!1504) (mask!11121 thiss!1504)) (Found!1183 #b00000000000000000000000000000000)))))

(assert (=> b!260686 (=> (not res!127410) (not e!168933))))

(declare-fun b!260687 () Bool)

(assert (=> b!260687 (= e!168931 e!168932)))

(declare-fun c!44323 () Bool)

(assert (=> b!260687 (= c!44323 (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!62665 (not res!127409)) b!260687))

(assert (= (and b!260687 c!44323) b!260686))

(assert (= (and b!260687 (not c!44323)) b!260684))

(assert (= (and b!260686 res!127410) b!260685))

(assert (= (or b!260685 b!260684) bm!24860))

(declare-fun m!276593 () Bool)

(assert (=> bm!24860 m!276593))

(assert (=> b!260686 m!275921))

(declare-fun m!276595 () Bool)

(assert (=> b!260686 m!276595))

(declare-fun m!276597 () Bool)

(assert (=> b!260686 m!276597))

(assert (=> b!260686 m!275921))

(declare-fun m!276599 () Bool)

(assert (=> b!260686 m!276599))

(assert (=> b!260687 m!275921))

(assert (=> b!260687 m!275921))

(assert (=> b!260687 m!275923))

(assert (=> b!260381 d!62665))

(declare-fun d!62667 () Bool)

(declare-fun e!168934 () Bool)

(assert (=> d!62667 e!168934))

(declare-fun res!127411 () Bool)

(assert (=> d!62667 (=> (not res!127411) (not e!168934))))

(declare-fun lt!131527 () ListLongMap!3861)

(assert (=> d!62667 (= res!127411 (contains!1891 lt!131527 (_1!2485 (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))))

(declare-fun lt!131529 () List!3826)

(assert (=> d!62667 (= lt!131527 (ListLongMap!3862 lt!131529))))

(declare-fun lt!131528 () Unit!8087)

(declare-fun lt!131526 () Unit!8087)

(assert (=> d!62667 (= lt!131528 lt!131526)))

(assert (=> d!62667 (= (getValueByKey!316 lt!131529 (_1!2485 (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))) (Some!321 (_2!2485 (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))))

(assert (=> d!62667 (= lt!131526 (lemmaContainsTupThenGetReturnValue!172 lt!131529 (_1!2485 (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))) (_2!2485 (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))))

(assert (=> d!62667 (= lt!131529 (insertStrictlySorted!175 (toList!1946 (ite c!44225 call!24820 (ite c!44224 call!24819 call!24822))) (_1!2485 (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))) (_2!2485 (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))))

(assert (=> d!62667 (= (+!699 (ite c!44225 call!24820 (ite c!44224 call!24819 call!24822)) (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))) lt!131527)))

(declare-fun b!260688 () Bool)

(declare-fun res!127412 () Bool)

(assert (=> b!260688 (=> (not res!127412) (not e!168934))))

(assert (=> b!260688 (= res!127412 (= (getValueByKey!316 (toList!1946 lt!131527) (_1!2485 (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))) (Some!321 (_2!2485 (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))))

(declare-fun b!260689 () Bool)

(assert (=> b!260689 (= e!168934 (contains!1893 (toList!1946 lt!131527) (ite (or c!44225 c!44224) (tuple2!4949 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4636 thiss!1504)) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (= (and d!62667 res!127411) b!260688))

(assert (= (and b!260688 res!127412) b!260689))

(declare-fun m!276601 () Bool)

(assert (=> d!62667 m!276601))

(declare-fun m!276603 () Bool)

(assert (=> d!62667 m!276603))

(declare-fun m!276605 () Bool)

(assert (=> d!62667 m!276605))

(declare-fun m!276607 () Bool)

(assert (=> d!62667 m!276607))

(declare-fun m!276609 () Bool)

(assert (=> b!260688 m!276609))

(declare-fun m!276611 () Bool)

(assert (=> b!260689 m!276611))

(assert (=> bm!24820 d!62667))

(declare-fun b!260690 () Bool)

(declare-fun e!168936 () Bool)

(assert (=> b!260690 (= e!168936 (contains!1892 Nil!3824 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260691 () Bool)

(declare-fun e!168937 () Bool)

(declare-fun call!24864 () Bool)

(assert (=> b!260691 (= e!168937 call!24864)))

(declare-fun bm!24861 () Bool)

(declare-fun c!44324 () Bool)

(assert (=> bm!24861 (= call!24864 (arrayNoDuplicates!0 (_keys!6975 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44324 (Cons!3823 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000) Nil!3824) Nil!3824)))))

(declare-fun b!260692 () Bool)

(assert (=> b!260692 (= e!168937 call!24864)))

(declare-fun b!260693 () Bool)

(declare-fun e!168938 () Bool)

(declare-fun e!168935 () Bool)

(assert (=> b!260693 (= e!168938 e!168935)))

(declare-fun res!127415 () Bool)

(assert (=> b!260693 (=> (not res!127415) (not e!168935))))

(assert (=> b!260693 (= res!127415 (not e!168936))))

(declare-fun res!127414 () Bool)

(assert (=> b!260693 (=> (not res!127414) (not e!168936))))

(assert (=> b!260693 (= res!127414 (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260694 () Bool)

(assert (=> b!260694 (= e!168935 e!168937)))

(assert (=> b!260694 (= c!44324 (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62669 () Bool)

(declare-fun res!127413 () Bool)

(assert (=> d!62669 (=> res!127413 e!168938)))

(assert (=> d!62669 (= res!127413 (bvsge #b00000000000000000000000000000000 (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> d!62669 (= (arrayNoDuplicates!0 (_keys!6975 thiss!1504) #b00000000000000000000000000000000 Nil!3824) e!168938)))

(assert (= (and d!62669 (not res!127413)) b!260693))

(assert (= (and b!260693 res!127414) b!260690))

(assert (= (and b!260693 res!127415) b!260694))

(assert (= (and b!260694 c!44324) b!260691))

(assert (= (and b!260694 (not c!44324)) b!260692))

(assert (= (or b!260691 b!260692) bm!24861))

(assert (=> b!260690 m!275921))

(assert (=> b!260690 m!275921))

(declare-fun m!276613 () Bool)

(assert (=> b!260690 m!276613))

(assert (=> bm!24861 m!275921))

(declare-fun m!276615 () Bool)

(assert (=> bm!24861 m!276615))

(assert (=> b!260693 m!275921))

(assert (=> b!260693 m!275921))

(assert (=> b!260693 m!275923))

(assert (=> b!260694 m!275921))

(assert (=> b!260694 m!275921))

(assert (=> b!260694 m!275923))

(assert (=> b!260382 d!62669))

(declare-fun d!62671 () Bool)

(declare-fun e!168940 () Bool)

(assert (=> d!62671 e!168940))

(declare-fun res!127416 () Bool)

(assert (=> d!62671 (=> res!127416 e!168940)))

(declare-fun lt!131532 () Bool)

(assert (=> d!62671 (= res!127416 (not lt!131532))))

(declare-fun lt!131531 () Bool)

(assert (=> d!62671 (= lt!131532 lt!131531)))

(declare-fun lt!131530 () Unit!8087)

(declare-fun e!168939 () Unit!8087)

(assert (=> d!62671 (= lt!131530 e!168939)))

(declare-fun c!44325 () Bool)

(assert (=> d!62671 (= c!44325 lt!131531)))

(assert (=> d!62671 (= lt!131531 (containsKey!308 (toList!1946 lt!131319) (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62671 (= (contains!1891 lt!131319 (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)) lt!131532)))

(declare-fun b!260695 () Bool)

(declare-fun lt!131533 () Unit!8087)

(assert (=> b!260695 (= e!168939 lt!131533)))

(assert (=> b!260695 (= lt!131533 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 lt!131319) (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!260695 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131319) (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!260696 () Bool)

(declare-fun Unit!8105 () Unit!8087)

(assert (=> b!260696 (= e!168939 Unit!8105)))

(declare-fun b!260697 () Bool)

(assert (=> b!260697 (= e!168940 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131319) (select (arr!5963 (_keys!6975 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62671 c!44325) b!260695))

(assert (= (and d!62671 (not c!44325)) b!260696))

(assert (= (and d!62671 (not res!127416)) b!260697))

(assert (=> d!62671 m!275921))

(declare-fun m!276617 () Bool)

(assert (=> d!62671 m!276617))

(assert (=> b!260695 m!275921))

(declare-fun m!276619 () Bool)

(assert (=> b!260695 m!276619))

(assert (=> b!260695 m!275921))

(assert (=> b!260695 m!276441))

(assert (=> b!260695 m!276441))

(declare-fun m!276621 () Bool)

(assert (=> b!260695 m!276621))

(assert (=> b!260697 m!275921))

(assert (=> b!260697 m!276441))

(assert (=> b!260697 m!276441))

(assert (=> b!260697 m!276621))

(assert (=> b!260337 d!62671))

(declare-fun d!62673 () Bool)

(assert (=> d!62673 (= (apply!258 lt!131263 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3072 (getValueByKey!316 (toList!1946 lt!131263) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9190 () Bool)

(assert (= bs!9190 d!62673))

(declare-fun m!276623 () Bool)

(assert (=> bs!9190 m!276623))

(assert (=> bs!9190 m!276623))

(declare-fun m!276625 () Bool)

(assert (=> bs!9190 m!276625))

(assert (=> b!260274 d!62673))

(declare-fun d!62675 () Bool)

(assert (=> d!62675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12598 (store (arr!5963 (_keys!6975 thiss!1504)) index!297 key!932) (size!6312 (_keys!6975 thiss!1504))) (mask!11121 thiss!1504))))

(assert (=> d!62675 true))

(declare-fun _$56!39 () Unit!8087)

(assert (=> d!62675 (= (choose!102 key!932 (_keys!6975 thiss!1504) index!297 (mask!11121 thiss!1504)) _$56!39)))

(declare-fun bs!9191 () Bool)

(assert (= bs!9191 d!62675))

(assert (=> bs!9191 m!275805))

(assert (=> bs!9191 m!276025))

(assert (=> d!62487 d!62675))

(assert (=> d!62487 d!62467))

(declare-fun d!62677 () Bool)

(declare-fun e!168941 () Bool)

(assert (=> d!62677 e!168941))

(declare-fun res!127417 () Bool)

(assert (=> d!62677 (=> (not res!127417) (not e!168941))))

(declare-fun lt!131535 () ListLongMap!3861)

(assert (=> d!62677 (= res!127417 (contains!1891 lt!131535 (_1!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(declare-fun lt!131537 () List!3826)

(assert (=> d!62677 (= lt!131535 (ListLongMap!3862 lt!131537))))

(declare-fun lt!131536 () Unit!8087)

(declare-fun lt!131534 () Unit!8087)

(assert (=> d!62677 (= lt!131536 lt!131534)))

(assert (=> d!62677 (= (getValueByKey!316 lt!131537 (_1!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (=> d!62677 (= lt!131534 (lemmaContainsTupThenGetReturnValue!172 lt!131537 (_1!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (=> d!62677 (= lt!131537 (insertStrictlySorted!175 (toList!1946 call!24818) (_1!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))) (_2!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))))))

(assert (=> d!62677 (= (+!699 call!24818 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))) lt!131535)))

(declare-fun b!260698 () Bool)

(declare-fun res!127418 () Bool)

(assert (=> b!260698 (=> (not res!127418) (not e!168941))))

(assert (=> b!260698 (= res!127418 (= (getValueByKey!316 (toList!1946 lt!131535) (_1!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504)))) (Some!321 (_2!2485 (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))))

(declare-fun b!260699 () Bool)

(assert (=> b!260699 (= e!168941 (contains!1893 (toList!1946 lt!131535) (tuple2!4949 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4636 thiss!1504))))))

(assert (= (and d!62677 res!127417) b!260698))

(assert (= (and b!260698 res!127418) b!260699))

(declare-fun m!276627 () Bool)

(assert (=> d!62677 m!276627))

(declare-fun m!276629 () Bool)

(assert (=> d!62677 m!276629))

(declare-fun m!276631 () Bool)

(assert (=> d!62677 m!276631))

(declare-fun m!276633 () Bool)

(assert (=> d!62677 m!276633))

(declare-fun m!276635 () Bool)

(assert (=> b!260698 m!276635))

(declare-fun m!276637 () Bool)

(assert (=> b!260699 m!276637))

(assert (=> b!260276 d!62677))

(declare-fun d!62679 () Bool)

(assert (=> d!62679 (= (validKeyInArray!0 (select (arr!5963 (_keys!6975 thiss!1504)) index!297)) (and (not (= (select (arr!5963 (_keys!6975 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5963 (_keys!6975 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!260307 d!62679))

(declare-fun d!62681 () Bool)

(assert (=> d!62681 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131126) key!932))))

(declare-fun lt!131540 () Unit!8087)

(declare-fun choose!1270 (List!3826 (_ BitVec 64)) Unit!8087)

(assert (=> d!62681 (= lt!131540 (choose!1270 (toList!1946 lt!131126) key!932))))

(declare-fun e!168944 () Bool)

(assert (=> d!62681 e!168944))

(declare-fun res!127421 () Bool)

(assert (=> d!62681 (=> (not res!127421) (not e!168944))))

(declare-fun isStrictlySorted!375 (List!3826) Bool)

(assert (=> d!62681 (= res!127421 (isStrictlySorted!375 (toList!1946 lt!131126)))))

(assert (=> d!62681 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 lt!131126) key!932) lt!131540)))

(declare-fun b!260702 () Bool)

(assert (=> b!260702 (= e!168944 (containsKey!308 (toList!1946 lt!131126) key!932))))

(assert (= (and d!62681 res!127421) b!260702))

(assert (=> d!62681 m!276031))

(assert (=> d!62681 m!276031))

(assert (=> d!62681 m!276033))

(declare-fun m!276639 () Bool)

(assert (=> d!62681 m!276639))

(declare-fun m!276641 () Bool)

(assert (=> d!62681 m!276641))

(assert (=> b!260702 m!276027))

(assert (=> b!260326 d!62681))

(declare-fun d!62683 () Bool)

(declare-fun isEmpty!537 (Option!322) Bool)

(assert (=> d!62683 (= (isDefined!257 (getValueByKey!316 (toList!1946 lt!131126) key!932)) (not (isEmpty!537 (getValueByKey!316 (toList!1946 lt!131126) key!932))))))

(declare-fun bs!9192 () Bool)

(assert (= bs!9192 d!62683))

(assert (=> bs!9192 m!276031))

(declare-fun m!276643 () Bool)

(assert (=> bs!9192 m!276643))

(assert (=> b!260326 d!62683))

(declare-fun b!260704 () Bool)

(declare-fun e!168945 () Option!322)

(declare-fun e!168946 () Option!322)

(assert (=> b!260704 (= e!168945 e!168946)))

(declare-fun c!44327 () Bool)

(assert (=> b!260704 (= c!44327 (and ((_ is Cons!3822) (toList!1946 lt!131126)) (not (= (_1!2485 (h!4486 (toList!1946 lt!131126))) key!932))))))

(declare-fun b!260706 () Bool)

(assert (=> b!260706 (= e!168946 None!320)))

(declare-fun b!260703 () Bool)

(assert (=> b!260703 (= e!168945 (Some!321 (_2!2485 (h!4486 (toList!1946 lt!131126)))))))

(declare-fun d!62685 () Bool)

(declare-fun c!44326 () Bool)

(assert (=> d!62685 (= c!44326 (and ((_ is Cons!3822) (toList!1946 lt!131126)) (= (_1!2485 (h!4486 (toList!1946 lt!131126))) key!932)))))

(assert (=> d!62685 (= (getValueByKey!316 (toList!1946 lt!131126) key!932) e!168945)))

(declare-fun b!260705 () Bool)

(assert (=> b!260705 (= e!168946 (getValueByKey!316 (t!8895 (toList!1946 lt!131126)) key!932))))

(assert (= (and d!62685 c!44326) b!260703))

(assert (= (and d!62685 (not c!44326)) b!260704))

(assert (= (and b!260704 c!44327) b!260705))

(assert (= (and b!260704 (not c!44327)) b!260706))

(declare-fun m!276645 () Bool)

(assert (=> b!260705 m!276645))

(assert (=> b!260326 d!62685))

(declare-fun d!62687 () Bool)

(declare-fun e!168948 () Bool)

(assert (=> d!62687 e!168948))

(declare-fun res!127422 () Bool)

(assert (=> d!62687 (=> res!127422 e!168948)))

(declare-fun lt!131543 () Bool)

(assert (=> d!62687 (= res!127422 (not lt!131543))))

(declare-fun lt!131542 () Bool)

(assert (=> d!62687 (= lt!131543 lt!131542)))

(declare-fun lt!131541 () Unit!8087)

(declare-fun e!168947 () Unit!8087)

(assert (=> d!62687 (= lt!131541 e!168947)))

(declare-fun c!44328 () Bool)

(assert (=> d!62687 (= c!44328 lt!131542)))

(assert (=> d!62687 (= lt!131542 (containsKey!308 (toList!1946 lt!131263) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62687 (= (contains!1891 lt!131263 #b0000000000000000000000000000000000000000000000000000000000000000) lt!131543)))

(declare-fun b!260707 () Bool)

(declare-fun lt!131544 () Unit!8087)

(assert (=> b!260707 (= e!168947 lt!131544)))

(assert (=> b!260707 (= lt!131544 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 lt!131263) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!260707 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131263) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260708 () Bool)

(declare-fun Unit!8106 () Unit!8087)

(assert (=> b!260708 (= e!168947 Unit!8106)))

(declare-fun b!260709 () Bool)

(assert (=> b!260709 (= e!168948 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131263) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62687 c!44328) b!260707))

(assert (= (and d!62687 (not c!44328)) b!260708))

(assert (= (and d!62687 (not res!127422)) b!260709))

(declare-fun m!276647 () Bool)

(assert (=> d!62687 m!276647))

(declare-fun m!276649 () Bool)

(assert (=> b!260707 m!276649))

(assert (=> b!260707 m!276623))

(assert (=> b!260707 m!276623))

(declare-fun m!276651 () Bool)

(assert (=> b!260707 m!276651))

(assert (=> b!260709 m!276623))

(assert (=> b!260709 m!276623))

(assert (=> b!260709 m!276651))

(assert (=> bm!24816 d!62687))

(assert (=> b!260341 d!62555))

(declare-fun b!260710 () Bool)

(declare-fun e!168950 () (_ BitVec 32))

(declare-fun call!24865 () (_ BitVec 32))

(assert (=> b!260710 (= e!168950 (bvadd #b00000000000000000000000000000001 call!24865))))

(declare-fun bm!24862 () Bool)

(assert (=> bm!24862 (= call!24865 (arrayCountValidKeys!0 lt!131133 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))))))

(declare-fun b!260711 () Bool)

(declare-fun e!168949 () (_ BitVec 32))

(assert (=> b!260711 (= e!168949 #b00000000000000000000000000000000)))

(declare-fun d!62689 () Bool)

(declare-fun lt!131545 () (_ BitVec 32))

(assert (=> d!62689 (and (bvsge lt!131545 #b00000000000000000000000000000000) (bvsle lt!131545 (bvsub (size!6312 lt!131133) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!62689 (= lt!131545 e!168949)))

(declare-fun c!44329 () Bool)

(assert (=> d!62689 (= c!44329 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))))))

(assert (=> d!62689 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6312 (_keys!6975 thiss!1504)) (size!6312 lt!131133)))))

(assert (=> d!62689 (= (arrayCountValidKeys!0 lt!131133 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6312 (_keys!6975 thiss!1504))) lt!131545)))

(declare-fun b!260712 () Bool)

(assert (=> b!260712 (= e!168950 call!24865)))

(declare-fun b!260713 () Bool)

(assert (=> b!260713 (= e!168949 e!168950)))

(declare-fun c!44330 () Bool)

(assert (=> b!260713 (= c!44330 (validKeyInArray!0 (select (arr!5963 lt!131133) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62689 c!44329) b!260711))

(assert (= (and d!62689 (not c!44329)) b!260713))

(assert (= (and b!260713 c!44330) b!260710))

(assert (= (and b!260713 (not c!44330)) b!260712))

(assert (= (or b!260710 b!260712) bm!24862))

(declare-fun m!276653 () Bool)

(assert (=> bm!24862 m!276653))

(assert (=> b!260713 m!276275))

(assert (=> b!260713 m!276275))

(assert (=> b!260713 m!276281))

(assert (=> bm!24821 d!62689))

(declare-fun d!62691 () Bool)

(declare-fun e!168952 () Bool)

(assert (=> d!62691 e!168952))

(declare-fun res!127423 () Bool)

(assert (=> d!62691 (=> res!127423 e!168952)))

(declare-fun lt!131548 () Bool)

(assert (=> d!62691 (= res!127423 (not lt!131548))))

(declare-fun lt!131547 () Bool)

(assert (=> d!62691 (= lt!131548 lt!131547)))

(declare-fun lt!131546 () Unit!8087)

(declare-fun e!168951 () Unit!8087)

(assert (=> d!62691 (= lt!131546 e!168951)))

(declare-fun c!44331 () Bool)

(assert (=> d!62691 (= c!44331 lt!131547)))

(assert (=> d!62691 (= lt!131547 (containsKey!308 (toList!1946 lt!131292) (_1!2485 (tuple2!4949 key!932 v!346))))))

(assert (=> d!62691 (= (contains!1891 lt!131292 (_1!2485 (tuple2!4949 key!932 v!346))) lt!131548)))

(declare-fun b!260714 () Bool)

(declare-fun lt!131549 () Unit!8087)

(assert (=> b!260714 (= e!168951 lt!131549)))

(assert (=> b!260714 (= lt!131549 (lemmaContainsKeyImpliesGetValueByKeyDefined!256 (toList!1946 lt!131292) (_1!2485 (tuple2!4949 key!932 v!346))))))

(assert (=> b!260714 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131292) (_1!2485 (tuple2!4949 key!932 v!346))))))

(declare-fun b!260715 () Bool)

(declare-fun Unit!8107 () Unit!8087)

(assert (=> b!260715 (= e!168951 Unit!8107)))

(declare-fun b!260716 () Bool)

(assert (=> b!260716 (= e!168952 (isDefined!257 (getValueByKey!316 (toList!1946 lt!131292) (_1!2485 (tuple2!4949 key!932 v!346)))))))

(assert (= (and d!62691 c!44331) b!260714))

(assert (= (and d!62691 (not c!44331)) b!260715))

(assert (= (and d!62691 (not res!127423)) b!260716))

(declare-fun m!276655 () Bool)

(assert (=> d!62691 m!276655))

(declare-fun m!276657 () Bool)

(assert (=> b!260714 m!276657))

(assert (=> b!260714 m!276001))

(assert (=> b!260714 m!276001))

(declare-fun m!276659 () Bool)

(assert (=> b!260714 m!276659))

(assert (=> b!260716 m!276001))

(assert (=> b!260716 m!276001))

(assert (=> b!260716 m!276659))

(assert (=> d!62477 d!62691))

(declare-fun b!260718 () Bool)

(declare-fun e!168953 () Option!322)

(declare-fun e!168954 () Option!322)

(assert (=> b!260718 (= e!168953 e!168954)))

(declare-fun c!44333 () Bool)

(assert (=> b!260718 (= c!44333 (and ((_ is Cons!3822) lt!131294) (not (= (_1!2485 (h!4486 lt!131294)) (_1!2485 (tuple2!4949 key!932 v!346))))))))

(declare-fun b!260720 () Bool)

(assert (=> b!260720 (= e!168954 None!320)))

(declare-fun b!260717 () Bool)

(assert (=> b!260717 (= e!168953 (Some!321 (_2!2485 (h!4486 lt!131294))))))

(declare-fun c!44332 () Bool)

(declare-fun d!62693 () Bool)

(assert (=> d!62693 (= c!44332 (and ((_ is Cons!3822) lt!131294) (= (_1!2485 (h!4486 lt!131294)) (_1!2485 (tuple2!4949 key!932 v!346)))))))

(assert (=> d!62693 (= (getValueByKey!316 lt!131294 (_1!2485 (tuple2!4949 key!932 v!346))) e!168953)))

(declare-fun b!260719 () Bool)

(assert (=> b!260719 (= e!168954 (getValueByKey!316 (t!8895 lt!131294) (_1!2485 (tuple2!4949 key!932 v!346))))))

(assert (= (and d!62693 c!44332) b!260717))

(assert (= (and d!62693 (not c!44332)) b!260718))

(assert (= (and b!260718 c!44333) b!260719))

(assert (= (and b!260718 (not c!44333)) b!260720))

(declare-fun m!276661 () Bool)

(assert (=> b!260719 m!276661))

(assert (=> d!62477 d!62693))

(declare-fun d!62695 () Bool)

(assert (=> d!62695 (= (getValueByKey!316 lt!131294 (_1!2485 (tuple2!4949 key!932 v!346))) (Some!321 (_2!2485 (tuple2!4949 key!932 v!346))))))

(declare-fun lt!131552 () Unit!8087)

(declare-fun choose!1271 (List!3826 (_ BitVec 64) V!8475) Unit!8087)

(assert (=> d!62695 (= lt!131552 (choose!1271 lt!131294 (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346))))))

(declare-fun e!168957 () Bool)

(assert (=> d!62695 e!168957))

(declare-fun res!127428 () Bool)

(assert (=> d!62695 (=> (not res!127428) (not e!168957))))

(assert (=> d!62695 (= res!127428 (isStrictlySorted!375 lt!131294))))

(assert (=> d!62695 (= (lemmaContainsTupThenGetReturnValue!172 lt!131294 (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346))) lt!131552)))

(declare-fun b!260725 () Bool)

(declare-fun res!127429 () Bool)

(assert (=> b!260725 (=> (not res!127429) (not e!168957))))

(assert (=> b!260725 (= res!127429 (containsKey!308 lt!131294 (_1!2485 (tuple2!4949 key!932 v!346))))))

(declare-fun b!260726 () Bool)

(assert (=> b!260726 (= e!168957 (contains!1893 lt!131294 (tuple2!4949 (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346)))))))

(assert (= (and d!62695 res!127428) b!260725))

(assert (= (and b!260725 res!127429) b!260726))

(assert (=> d!62695 m!275995))

(declare-fun m!276663 () Bool)

(assert (=> d!62695 m!276663))

(declare-fun m!276665 () Bool)

(assert (=> d!62695 m!276665))

(declare-fun m!276667 () Bool)

(assert (=> b!260725 m!276667))

(declare-fun m!276669 () Bool)

(assert (=> b!260726 m!276669))

(assert (=> d!62477 d!62695))

(declare-fun b!260747 () Bool)

(declare-fun e!168972 () List!3826)

(declare-fun call!24872 () List!3826)

(assert (=> b!260747 (= e!168972 call!24872)))

(declare-fun b!260748 () Bool)

(declare-fun e!168971 () List!3826)

(assert (=> b!260748 (= e!168971 e!168972)))

(declare-fun c!44342 () Bool)

(assert (=> b!260748 (= c!44342 (and ((_ is Cons!3822) (toList!1946 lt!131126)) (= (_1!2485 (h!4486 (toList!1946 lt!131126))) (_1!2485 (tuple2!4949 key!932 v!346)))))))

(declare-fun b!260749 () Bool)

(declare-fun e!168968 () List!3826)

(declare-fun call!24873 () List!3826)

(assert (=> b!260749 (= e!168968 call!24873)))

(declare-fun bm!24869 () Bool)

(assert (=> bm!24869 (= call!24873 call!24872)))

(declare-fun b!260750 () Bool)

(declare-fun call!24874 () List!3826)

(assert (=> b!260750 (= e!168971 call!24874)))

(declare-fun bm!24870 () Bool)

(assert (=> bm!24870 (= call!24872 call!24874)))

(declare-fun b!260751 () Bool)

(declare-fun c!44344 () Bool)

(assert (=> b!260751 (= c!44344 (and ((_ is Cons!3822) (toList!1946 lt!131126)) (bvsgt (_1!2485 (h!4486 (toList!1946 lt!131126))) (_1!2485 (tuple2!4949 key!932 v!346)))))))

(assert (=> b!260751 (= e!168972 e!168968)))

(declare-fun b!260752 () Bool)

(declare-fun res!127434 () Bool)

(declare-fun e!168969 () Bool)

(assert (=> b!260752 (=> (not res!127434) (not e!168969))))

(declare-fun lt!131555 () List!3826)

(assert (=> b!260752 (= res!127434 (containsKey!308 lt!131555 (_1!2485 (tuple2!4949 key!932 v!346))))))

(declare-fun c!44345 () Bool)

(declare-fun e!168970 () List!3826)

(declare-fun bm!24871 () Bool)

(declare-fun $colon$colon!106 (List!3826 tuple2!4948) List!3826)

(assert (=> bm!24871 (= call!24874 ($colon$colon!106 e!168970 (ite c!44345 (h!4486 (toList!1946 lt!131126)) (tuple2!4949 (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346))))))))

(declare-fun c!44343 () Bool)

(assert (=> bm!24871 (= c!44343 c!44345)))

(declare-fun b!260754 () Bool)

(assert (=> b!260754 (= e!168969 (contains!1893 lt!131555 (tuple2!4949 (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346)))))))

(declare-fun b!260755 () Bool)

(assert (=> b!260755 (= e!168970 (insertStrictlySorted!175 (t!8895 (toList!1946 lt!131126)) (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346))))))

(declare-fun b!260756 () Bool)

(assert (=> b!260756 (= e!168970 (ite c!44342 (t!8895 (toList!1946 lt!131126)) (ite c!44344 (Cons!3822 (h!4486 (toList!1946 lt!131126)) (t!8895 (toList!1946 lt!131126))) Nil!3823)))))

(declare-fun d!62697 () Bool)

(assert (=> d!62697 e!168969))

(declare-fun res!127435 () Bool)

(assert (=> d!62697 (=> (not res!127435) (not e!168969))))

(assert (=> d!62697 (= res!127435 (isStrictlySorted!375 lt!131555))))

(assert (=> d!62697 (= lt!131555 e!168971)))

(assert (=> d!62697 (= c!44345 (and ((_ is Cons!3822) (toList!1946 lt!131126)) (bvslt (_1!2485 (h!4486 (toList!1946 lt!131126))) (_1!2485 (tuple2!4949 key!932 v!346)))))))

(assert (=> d!62697 (isStrictlySorted!375 (toList!1946 lt!131126))))

(assert (=> d!62697 (= (insertStrictlySorted!175 (toList!1946 lt!131126) (_1!2485 (tuple2!4949 key!932 v!346)) (_2!2485 (tuple2!4949 key!932 v!346))) lt!131555)))

(declare-fun b!260753 () Bool)

(assert (=> b!260753 (= e!168968 call!24873)))

(assert (= (and d!62697 c!44345) b!260750))

(assert (= (and d!62697 (not c!44345)) b!260748))

(assert (= (and b!260748 c!44342) b!260747))

(assert (= (and b!260748 (not c!44342)) b!260751))

(assert (= (and b!260751 c!44344) b!260753))

(assert (= (and b!260751 (not c!44344)) b!260749))

(assert (= (or b!260753 b!260749) bm!24869))

(assert (= (or b!260747 bm!24869) bm!24870))

(assert (= (or b!260750 bm!24870) bm!24871))

(assert (= (and bm!24871 c!44343) b!260755))

(assert (= (and bm!24871 (not c!44343)) b!260756))

(assert (= (and d!62697 res!127435) b!260752))

(assert (= (and b!260752 res!127434) b!260754))

(declare-fun m!276671 () Bool)

(assert (=> b!260755 m!276671))

(declare-fun m!276673 () Bool)

(assert (=> bm!24871 m!276673))

(declare-fun m!276675 () Bool)

(assert (=> b!260752 m!276675))

(declare-fun m!276677 () Bool)

(assert (=> b!260754 m!276677))

(declare-fun m!276679 () Bool)

(assert (=> d!62697 m!276679))

(assert (=> d!62697 m!276641))

(assert (=> d!62477 d!62697))

(assert (=> b!260184 d!62501))

(assert (=> b!260328 d!62683))

(assert (=> b!260328 d!62685))

(assert (=> d!62459 d!62473))

(declare-fun d!62699 () Bool)

(assert (=> d!62699 (arrayContainsKey!0 lt!131133 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62699 true))

(declare-fun _$60!384 () Unit!8087)

(assert (=> d!62699 (= (choose!13 lt!131133 key!932 index!297) _$60!384)))

(declare-fun bs!9193 () Bool)

(assert (= bs!9193 d!62699))

(assert (=> bs!9193 m!275801))

(assert (=> d!62459 d!62699))

(assert (=> b!260203 d!62659))

(declare-fun b!260757 () Bool)

(declare-fun e!168973 () Bool)

(assert (=> b!260757 (= e!168973 tp_is_empty!6621)))

(declare-fun mapIsEmpty!11289 () Bool)

(declare-fun mapRes!11289 () Bool)

(assert (=> mapIsEmpty!11289 mapRes!11289))

(declare-fun b!260758 () Bool)

(declare-fun e!168974 () Bool)

(assert (=> b!260758 (= e!168974 tp_is_empty!6621)))

(declare-fun mapNonEmpty!11289 () Bool)

(declare-fun tp!23610 () Bool)

(assert (=> mapNonEmpty!11289 (= mapRes!11289 (and tp!23610 e!168973))))

(declare-fun mapKey!11289 () (_ BitVec 32))

(declare-fun mapRest!11289 () (Array (_ BitVec 32) ValueCell!2967))

(declare-fun mapValue!11289 () ValueCell!2967)

(assert (=> mapNonEmpty!11289 (= mapRest!11288 (store mapRest!11289 mapKey!11289 mapValue!11289))))

(declare-fun condMapEmpty!11289 () Bool)

(declare-fun mapDefault!11289 () ValueCell!2967)

(assert (=> mapNonEmpty!11288 (= condMapEmpty!11289 (= mapRest!11288 ((as const (Array (_ BitVec 32) ValueCell!2967)) mapDefault!11289)))))

(assert (=> mapNonEmpty!11288 (= tp!23609 (and e!168974 mapRes!11289))))

(assert (= (and mapNonEmpty!11288 condMapEmpty!11289) mapIsEmpty!11289))

(assert (= (and mapNonEmpty!11288 (not condMapEmpty!11289)) mapNonEmpty!11289))

(assert (= (and mapNonEmpty!11289 ((_ is ValueCellFull!2967) mapValue!11289)) b!260757))

(assert (= (and mapNonEmpty!11288 ((_ is ValueCellFull!2967) mapDefault!11289)) b!260758))

(declare-fun m!276681 () Bool)

(assert (=> mapNonEmpty!11289 m!276681))

(declare-fun b_lambda!8277 () Bool)

(assert (= b_lambda!8271 (or (and b!260073 b_free!6759) b_lambda!8277)))

(declare-fun b_lambda!8279 () Bool)

(assert (= b_lambda!8269 (or (and b!260073 b_free!6759) b_lambda!8279)))

(declare-fun b_lambda!8281 () Bool)

(assert (= b_lambda!8267 (or (and b!260073 b_free!6759) b_lambda!8281)))

(declare-fun b_lambda!8283 () Bool)

(assert (= b_lambda!8275 (or (and b!260073 b_free!6759) b_lambda!8283)))

(declare-fun b_lambda!8285 () Bool)

(assert (= b_lambda!8273 (or (and b!260073 b_free!6759) b_lambda!8285)))

(check-sat (not d!62629) (not b!260626) (not d!62543) (not b!260450) (not b!260419) (not mapNonEmpty!11289) (not b!260714) (not b!260616) (not bm!24838) (not b!260508) (not b!260664) (not b!260725) (not b_lambda!8279) (not b!260690) (not b!260569) (not d!62589) (not d!62625) (not d!62537) (not b!260565) (not b!260719) (not b_lambda!8285) (not b!260561) (not b!260545) (not bm!24843) (not b!260578) (not b!260548) (not b!260707) tp_is_empty!6621 (not bm!24862) (not b!260619) (not bm!24848) (not b!260418) (not b!260621) (not b!260474) (not d!62545) (not b!260467) (not d!62635) (not b!260505) (not b!260458) (not d!62649) (not d!62631) (not b!260536) (not b!260702) (not b!260550) (not d!62563) (not d!62607) (not bm!24841) (not b!260527) (not d!62697) (not b!260716) (not b_lambda!8281) (not d!62579) (not b_lambda!8277) (not b!260656) (not d!62587) (not b!260499) (not d!62627) (not b!260465) (not b!260431) (not b!260699) (not bm!24857) (not b!260489) (not b!260417) (not b!260532) (not d!62519) (not b!260726) (not b!260490) (not d!62695) (not d!62571) (not d!62529) (not d!62565) (not bm!24842) (not d!62651) (not d!62509) (not b!260709) (not bm!24849) (not d!62547) (not d!62667) (not bm!24871) (not b!260697) (not b!260681) (not b!260658) (not b!260473) (not b!260481) (not b!260535) (not d!62639) (not d!62611) (not d!62653) (not d!62609) (not bm!24852) (not b!260463) (not b!260476) (not d!62621) (not b!260695) (not d!62515) (not b!260459) (not d!62681) (not bm!24858) (not b!260674) (not b!260622) (not b!260439) (not d!62533) (not b!260754) (not b!260686) (not d!62601) (not b!260617) (not b!260487) (not d!62617) (not bm!24837) (not b!260680) (not b!260425) (not b!260576) (not d!62521) (not d!62531) (not b_next!6759) (not b!260689) (not b!260433) (not b_lambda!8263) (not b!260688) (not b!260614) (not d!62615) (not b!260494) (not b!260521) (not b!260551) (not b!260693) (not d!62619) (not bm!24859) (not d!62633) (not d!62525) (not b!260587) (not b!260549) (not d!62675) (not d!62661) (not d!62569) (not d!62641) (not d!62687) (not d!62605) (not b!260651) (not d!62539) (not b!260559) (not b!260564) (not b!260468) (not d!62549) (not b!260687) (not bm!24851) (not b!260426) (not d!62595) (not b!260507) (not b!260506) (not b!260477) (not b!260543) (not d!62559) (not d!62517) (not d!62663) (not b!260567) (not b!260538) (not bm!24840) (not d!62691) (not b_lambda!8283) (not b!260420) (not d!62553) b_and!13881 (not b_lambda!8265) (not b!260615) (not b!260694) (not d!62503) (not b!260613) (not bm!24850) (not b!260466) (not b!260675) (not b!260502) (not b!260582) (not b!260488) (not d!62567) (not b!260475) (not b!260623) (not d!62677) (not b!260430) (not d!62683) (not d!62583) (not b!260755) (not d!62535) (not d!62671) (not b!260683) (not b!260560) (not d!62523) (not d!62541) (not d!62699) (not b!260620) (not b!260461) (not b!260625) (not b!260698) (not d!62637) (not d!62657) (not b!260462) (not b!260588) (not b!260493) (not b!260752) (not b!260558) (not bm!24846) (not bm!24839) (not bm!24860) (not d!62643) (not b!260530) (not b!260421) (not b!260480) (not b!260472) (not b!260529) (not b!260457) (not d!62623) (not b!260713) (not bm!24861) (not b!260705) (not d!62673) (not b!260422) (not d!62645) (not d!62505) (not d!62527))
(check-sat b_and!13881 (not b_next!6759))
