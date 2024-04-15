; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24226 () Bool)

(assert start!24226)

(declare-fun b!253108 () Bool)

(declare-fun b_free!6661 () Bool)

(declare-fun b_next!6661 () Bool)

(assert (=> b!253108 (= b_free!6661 (not b_next!6661))))

(declare-fun tp!23268 () Bool)

(declare-fun b_and!13675 () Bool)

(assert (=> b!253108 (= tp!23268 b_and!13675)))

(declare-fun b!253105 () Bool)

(declare-fun res!123870 () Bool)

(declare-fun e!164108 () Bool)

(assert (=> b!253105 (=> (not res!123870) (not e!164108))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!253105 (= res!123870 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!253106 () Bool)

(declare-fun e!164111 () Bool)

(declare-datatypes ((SeekEntryResult!1136 0))(
  ( (MissingZero!1136 (index!6714 (_ BitVec 32))) (Found!1136 (index!6715 (_ BitVec 32))) (Intermediate!1136 (undefined!1948 Bool) (index!6716 (_ BitVec 32)) (x!24809 (_ BitVec 32))) (Undefined!1136) (MissingVacant!1136 (index!6717 (_ BitVec 32))) )
))
(declare-fun lt!126773 () SeekEntryResult!1136)

(get-info :version)

(assert (=> b!253106 (= e!164111 ((_ is Undefined!1136) lt!126773))))

(declare-fun b!253107 () Bool)

(declare-fun e!164102 () Bool)

(declare-fun call!23866 () Bool)

(assert (=> b!253107 (= e!164102 (not call!23866))))

(declare-fun tp_is_empty!6523 () Bool)

(declare-datatypes ((V!8345 0))(
  ( (V!8346 (val!3306 Int)) )
))
(declare-datatypes ((ValueCell!2918 0))(
  ( (ValueCellFull!2918 (v!5373 V!8345)) (EmptyCell!2918) )
))
(declare-datatypes ((array!12367 0))(
  ( (array!12368 (arr!5859 (Array (_ BitVec 32) ValueCell!2918)) (size!6207 (_ BitVec 32))) )
))
(declare-datatypes ((array!12369 0))(
  ( (array!12370 (arr!5860 (Array (_ BitVec 32) (_ BitVec 64))) (size!6208 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3736 0))(
  ( (LongMapFixedSize!3737 (defaultEntry!4677 Int) (mask!10909 (_ BitVec 32)) (extraKeys!4414 (_ BitVec 32)) (zeroValue!4518 V!8345) (minValue!4518 V!8345) (_size!1917 (_ BitVec 32)) (_keys!6828 array!12369) (_values!4660 array!12367) (_vacant!1917 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3736)

(declare-fun e!164114 () Bool)

(declare-fun e!164106 () Bool)

(declare-fun array_inv!3867 (array!12369) Bool)

(declare-fun array_inv!3868 (array!12367) Bool)

(assert (=> b!253108 (= e!164106 (and tp!23268 tp_is_empty!6523 (array_inv!3867 (_keys!6828 thiss!1504)) (array_inv!3868 (_values!4660 thiss!1504)) e!164114))))

(declare-fun b!253109 () Bool)

(assert (=> b!253109 (= e!164111 e!164102)))

(declare-fun res!123864 () Bool)

(declare-fun call!23865 () Bool)

(assert (=> b!253109 (= res!123864 call!23865)))

(assert (=> b!253109 (=> (not res!123864) (not e!164102))))

(declare-fun b!253110 () Bool)

(declare-datatypes ((Unit!7813 0))(
  ( (Unit!7814) )
))
(declare-fun e!164101 () Unit!7813)

(declare-fun Unit!7815 () Unit!7813)

(assert (=> b!253110 (= e!164101 Unit!7815)))

(declare-fun lt!126772 () Unit!7813)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!409 (array!12369 array!12367 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) Int) Unit!7813)

(assert (=> b!253110 (= lt!126772 (lemmaInListMapThenSeekEntryOrOpenFindsIt!409 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)))))

(assert (=> b!253110 false))

(declare-fun b!253111 () Bool)

(declare-fun res!123867 () Bool)

(declare-fun e!164100 () Bool)

(assert (=> b!253111 (=> (not res!123867) (not e!164100))))

(assert (=> b!253111 (= res!123867 call!23865)))

(declare-fun e!164103 () Bool)

(assert (=> b!253111 (= e!164103 e!164100)))

(declare-fun b!253112 () Bool)

(declare-fun e!164104 () Unit!7813)

(declare-fun Unit!7816 () Unit!7813)

(assert (=> b!253112 (= e!164104 Unit!7816)))

(declare-fun lt!126769 () Unit!7813)

(declare-fun lemmaArrayContainsKeyThenInListMap!218 (array!12369 array!12367 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) (_ BitVec 32) Int) Unit!7813)

(assert (=> b!253112 (= lt!126769 (lemmaArrayContainsKeyThenInListMap!218 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(assert (=> b!253112 false))

(declare-fun mapIsEmpty!11097 () Bool)

(declare-fun mapRes!11097 () Bool)

(assert (=> mapIsEmpty!11097 mapRes!11097))

(declare-fun b!253113 () Bool)

(declare-fun res!123874 () Bool)

(declare-fun e!164109 () Bool)

(assert (=> b!253113 (=> res!123874 e!164109)))

(declare-datatypes ((List!3728 0))(
  ( (Nil!3725) (Cons!3724 (h!4386 (_ BitVec 64)) (t!8764 List!3728)) )
))
(declare-fun arrayNoDuplicates!0 (array!12369 (_ BitVec 32) List!3728) Bool)

(assert (=> b!253113 (= res!123874 (not (arrayNoDuplicates!0 (_keys!6828 thiss!1504) #b00000000000000000000000000000000 Nil!3725)))))

(declare-fun b!253114 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253114 (= e!164109 (validKeyInArray!0 key!932))))

(declare-fun b!253115 () Bool)

(declare-fun Unit!7817 () Unit!7813)

(assert (=> b!253115 (= e!164104 Unit!7817)))

(declare-fun b!253116 () Bool)

(declare-fun e!164112 () Bool)

(assert (=> b!253116 (= e!164114 (and e!164112 mapRes!11097))))

(declare-fun condMapEmpty!11097 () Bool)

(declare-fun mapDefault!11097 () ValueCell!2918)

(assert (=> b!253116 (= condMapEmpty!11097 (= (arr!5859 (_values!4660 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2918)) mapDefault!11097)))))

(declare-fun b!253117 () Bool)

(declare-fun e!164107 () Bool)

(assert (=> b!253117 (= e!164107 tp_is_empty!6523)))

(declare-fun c!42678 () Bool)

(declare-fun bm!23862 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23862 (= call!23865 (inRange!0 (ite c!42678 (index!6714 lt!126773) (index!6717 lt!126773)) (mask!10909 thiss!1504)))))

(declare-fun b!253118 () Bool)

(assert (=> b!253118 (= e!164112 tp_is_empty!6523)))

(declare-fun b!253119 () Bool)

(declare-fun res!123866 () Bool)

(assert (=> b!253119 (=> res!123866 e!164109)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12369 (_ BitVec 32)) Bool)

(assert (=> b!253119 (= res!123866 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6828 thiss!1504) (mask!10909 thiss!1504))))))

(declare-fun b!253120 () Bool)

(declare-fun res!123873 () Bool)

(assert (=> b!253120 (=> (not res!123873) (not e!164100))))

(assert (=> b!253120 (= res!123873 (= (select (arr!5860 (_keys!6828 thiss!1504)) (index!6714 lt!126773)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253121 () Bool)

(declare-fun res!123863 () Bool)

(assert (=> b!253121 (=> res!123863 e!164109)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!253121 (= res!123863 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6208 (_keys!6828 thiss!1504)))))))

(declare-fun b!253122 () Bool)

(declare-fun e!164105 () Bool)

(assert (=> b!253122 (= e!164108 e!164105)))

(declare-fun res!123868 () Bool)

(assert (=> b!253122 (=> (not res!123868) (not e!164105))))

(assert (=> b!253122 (= res!123868 (or (= lt!126773 (MissingZero!1136 index!297)) (= lt!126773 (MissingVacant!1136 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12369 (_ BitVec 32)) SeekEntryResult!1136)

(assert (=> b!253122 (= lt!126773 (seekEntryOrOpen!0 key!932 (_keys!6828 thiss!1504) (mask!10909 thiss!1504)))))

(declare-fun res!123871 () Bool)

(assert (=> start!24226 (=> (not res!123871) (not e!164108))))

(declare-fun valid!1464 (LongMapFixedSize!3736) Bool)

(assert (=> start!24226 (= res!123871 (valid!1464 thiss!1504))))

(assert (=> start!24226 e!164108))

(assert (=> start!24226 e!164106))

(assert (=> start!24226 true))

(declare-fun b!253123 () Bool)

(declare-fun e!164113 () Bool)

(assert (=> b!253123 (= e!164113 (not e!164109))))

(declare-fun res!123875 () Bool)

(assert (=> b!253123 (=> res!123875 e!164109)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!253123 (= res!123875 (not (validMask!0 (mask!10909 thiss!1504))))))

(declare-fun lt!126774 () array!12369)

(assert (=> b!253123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126774 (mask!10909 thiss!1504))))

(declare-fun lt!126775 () Unit!7813)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12369 (_ BitVec 32) (_ BitVec 32)) Unit!7813)

(assert (=> b!253123 (= lt!126775 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6828 thiss!1504) index!297 (mask!10909 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12369 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!253123 (= (arrayCountValidKeys!0 lt!126774 #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6828 thiss!1504) #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504)))))))

(declare-fun lt!126770 () Unit!7813)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12369 (_ BitVec 32) (_ BitVec 64)) Unit!7813)

(assert (=> b!253123 (= lt!126770 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6828 thiss!1504) index!297 key!932))))

(assert (=> b!253123 (arrayNoDuplicates!0 lt!126774 #b00000000000000000000000000000000 Nil!3725)))

(assert (=> b!253123 (= lt!126774 (array!12370 (store (arr!5860 (_keys!6828 thiss!1504)) index!297 key!932) (size!6208 (_keys!6828 thiss!1504))))))

(declare-fun lt!126777 () Unit!7813)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12369 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3728) Unit!7813)

(assert (=> b!253123 (= lt!126777 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6828 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3725))))

(declare-fun lt!126771 () Unit!7813)

(assert (=> b!253123 (= lt!126771 e!164104)))

(declare-fun c!42680 () Bool)

(declare-fun arrayContainsKey!0 (array!12369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!253123 (= c!42680 (arrayContainsKey!0 (_keys!6828 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253124 () Bool)

(declare-fun c!42677 () Bool)

(assert (=> b!253124 (= c!42677 ((_ is MissingVacant!1136) lt!126773))))

(assert (=> b!253124 (= e!164103 e!164111)))

(declare-fun b!253125 () Bool)

(assert (=> b!253125 (= e!164100 (not call!23866))))

(declare-fun b!253126 () Bool)

(assert (=> b!253126 (= e!164105 e!164113)))

(declare-fun res!123872 () Bool)

(assert (=> b!253126 (=> (not res!123872) (not e!164113))))

(assert (=> b!253126 (= res!123872 (inRange!0 index!297 (mask!10909 thiss!1504)))))

(declare-fun lt!126776 () Unit!7813)

(assert (=> b!253126 (= lt!126776 e!164101)))

(declare-fun c!42679 () Bool)

(declare-datatypes ((tuple2!4828 0))(
  ( (tuple2!4829 (_1!2425 (_ BitVec 64)) (_2!2425 V!8345)) )
))
(declare-datatypes ((List!3729 0))(
  ( (Nil!3726) (Cons!3725 (h!4387 tuple2!4828) (t!8765 List!3729)) )
))
(declare-datatypes ((ListLongMap!3731 0))(
  ( (ListLongMap!3732 (toList!1881 List!3729)) )
))
(declare-fun contains!1815 (ListLongMap!3731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1390 (array!12369 array!12367 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 32) Int) ListLongMap!3731)

(assert (=> b!253126 (= c!42679 (contains!1815 (getCurrentListMap!1390 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!11097 () Bool)

(declare-fun tp!23267 () Bool)

(assert (=> mapNonEmpty!11097 (= mapRes!11097 (and tp!23267 e!164107))))

(declare-fun mapRest!11097 () (Array (_ BitVec 32) ValueCell!2918))

(declare-fun mapKey!11097 () (_ BitVec 32))

(declare-fun mapValue!11097 () ValueCell!2918)

(assert (=> mapNonEmpty!11097 (= (arr!5859 (_values!4660 thiss!1504)) (store mapRest!11097 mapKey!11097 mapValue!11097))))

(declare-fun bm!23863 () Bool)

(assert (=> bm!23863 (= call!23866 (arrayContainsKey!0 (_keys!6828 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253127 () Bool)

(declare-fun res!123865 () Bool)

(assert (=> b!253127 (= res!123865 (= (select (arr!5860 (_keys!6828 thiss!1504)) (index!6717 lt!126773)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253127 (=> (not res!123865) (not e!164102))))

(declare-fun b!253128 () Bool)

(declare-fun res!123869 () Bool)

(assert (=> b!253128 (=> res!123869 e!164109)))

(assert (=> b!253128 (= res!123869 (or (not (= (size!6207 (_values!4660 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10909 thiss!1504)))) (not (= (size!6208 (_keys!6828 thiss!1504)) (size!6207 (_values!4660 thiss!1504)))) (bvslt (mask!10909 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4414 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4414 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!253129 () Bool)

(declare-fun lt!126768 () Unit!7813)

(assert (=> b!253129 (= e!164101 lt!126768)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!409 (array!12369 array!12367 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) Int) Unit!7813)

(assert (=> b!253129 (= lt!126768 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!409 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)))))

(assert (=> b!253129 (= c!42678 ((_ is MissingZero!1136) lt!126773))))

(assert (=> b!253129 e!164103))

(assert (= (and start!24226 res!123871) b!253105))

(assert (= (and b!253105 res!123870) b!253122))

(assert (= (and b!253122 res!123868) b!253126))

(assert (= (and b!253126 c!42679) b!253110))

(assert (= (and b!253126 (not c!42679)) b!253129))

(assert (= (and b!253129 c!42678) b!253111))

(assert (= (and b!253129 (not c!42678)) b!253124))

(assert (= (and b!253111 res!123867) b!253120))

(assert (= (and b!253120 res!123873) b!253125))

(assert (= (and b!253124 c!42677) b!253109))

(assert (= (and b!253124 (not c!42677)) b!253106))

(assert (= (and b!253109 res!123864) b!253127))

(assert (= (and b!253127 res!123865) b!253107))

(assert (= (or b!253111 b!253109) bm!23862))

(assert (= (or b!253125 b!253107) bm!23863))

(assert (= (and b!253126 res!123872) b!253123))

(assert (= (and b!253123 c!42680) b!253112))

(assert (= (and b!253123 (not c!42680)) b!253115))

(assert (= (and b!253123 (not res!123875)) b!253128))

(assert (= (and b!253128 (not res!123869)) b!253119))

(assert (= (and b!253119 (not res!123866)) b!253113))

(assert (= (and b!253113 (not res!123874)) b!253121))

(assert (= (and b!253121 (not res!123863)) b!253114))

(assert (= (and b!253116 condMapEmpty!11097) mapIsEmpty!11097))

(assert (= (and b!253116 (not condMapEmpty!11097)) mapNonEmpty!11097))

(assert (= (and mapNonEmpty!11097 ((_ is ValueCellFull!2918) mapValue!11097)) b!253117))

(assert (= (and b!253116 ((_ is ValueCellFull!2918) mapDefault!11097)) b!253118))

(assert (= b!253108 b!253116))

(assert (= start!24226 b!253108))

(declare-fun m!268529 () Bool)

(assert (=> b!253122 m!268529))

(declare-fun m!268531 () Bool)

(assert (=> b!253123 m!268531))

(declare-fun m!268533 () Bool)

(assert (=> b!253123 m!268533))

(declare-fun m!268535 () Bool)

(assert (=> b!253123 m!268535))

(declare-fun m!268537 () Bool)

(assert (=> b!253123 m!268537))

(declare-fun m!268539 () Bool)

(assert (=> b!253123 m!268539))

(declare-fun m!268541 () Bool)

(assert (=> b!253123 m!268541))

(declare-fun m!268543 () Bool)

(assert (=> b!253123 m!268543))

(declare-fun m!268545 () Bool)

(assert (=> b!253123 m!268545))

(declare-fun m!268547 () Bool)

(assert (=> b!253123 m!268547))

(declare-fun m!268549 () Bool)

(assert (=> b!253123 m!268549))

(declare-fun m!268551 () Bool)

(assert (=> mapNonEmpty!11097 m!268551))

(declare-fun m!268553 () Bool)

(assert (=> b!253110 m!268553))

(declare-fun m!268555 () Bool)

(assert (=> b!253129 m!268555))

(declare-fun m!268557 () Bool)

(assert (=> b!253126 m!268557))

(declare-fun m!268559 () Bool)

(assert (=> b!253126 m!268559))

(assert (=> b!253126 m!268559))

(declare-fun m!268561 () Bool)

(assert (=> b!253126 m!268561))

(declare-fun m!268563 () Bool)

(assert (=> b!253113 m!268563))

(assert (=> bm!23863 m!268533))

(declare-fun m!268565 () Bool)

(assert (=> b!253120 m!268565))

(declare-fun m!268567 () Bool)

(assert (=> b!253119 m!268567))

(declare-fun m!268569 () Bool)

(assert (=> b!253127 m!268569))

(declare-fun m!268571 () Bool)

(assert (=> bm!23862 m!268571))

(declare-fun m!268573 () Bool)

(assert (=> b!253112 m!268573))

(declare-fun m!268575 () Bool)

(assert (=> b!253108 m!268575))

(declare-fun m!268577 () Bool)

(assert (=> b!253108 m!268577))

(declare-fun m!268579 () Bool)

(assert (=> start!24226 m!268579))

(declare-fun m!268581 () Bool)

(assert (=> b!253114 m!268581))

(check-sat (not mapNonEmpty!11097) (not bm!23862) (not b!253119) tp_is_empty!6523 (not b!253113) (not b!253123) (not b!253122) (not b!253112) b_and!13675 (not b!253114) (not b!253108) (not b_next!6661) (not b!253126) (not b!253129) (not bm!23863) (not start!24226) (not b!253110))
(check-sat b_and!13675 (not b_next!6661))
(get-model)

(declare-fun b!253296 () Bool)

(declare-fun e!164213 () Bool)

(declare-fun call!23884 () Bool)

(assert (=> b!253296 (= e!164213 (not call!23884))))

(declare-fun bm!23880 () Bool)

(assert (=> bm!23880 (= call!23884 (arrayContainsKey!0 (_keys!6828 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!253297 () Bool)

(declare-fun res!123963 () Bool)

(declare-fun e!164216 () Bool)

(assert (=> b!253297 (=> (not res!123963) (not e!164216))))

(declare-fun call!23883 () Bool)

(assert (=> b!253297 (= res!123963 call!23883)))

(declare-fun e!164215 () Bool)

(assert (=> b!253297 (= e!164215 e!164216)))

(declare-fun b!253298 () Bool)

(assert (=> b!253298 (= e!164216 (not call!23884))))

(declare-fun bm!23881 () Bool)

(declare-fun lt!126842 () SeekEntryResult!1136)

(declare-fun c!42709 () Bool)

(assert (=> bm!23881 (= call!23883 (inRange!0 (ite c!42709 (index!6714 lt!126842) (index!6717 lt!126842)) (mask!10909 thiss!1504)))))

(declare-fun b!253299 () Bool)

(declare-fun e!164214 () Bool)

(assert (=> b!253299 (= e!164214 e!164215)))

(declare-fun c!42710 () Bool)

(assert (=> b!253299 (= c!42710 ((_ is MissingVacant!1136) lt!126842))))

(declare-fun b!253300 () Bool)

(assert (=> b!253300 (= e!164215 ((_ is Undefined!1136) lt!126842))))

(declare-fun b!253301 () Bool)

(declare-fun res!123965 () Bool)

(assert (=> b!253301 (=> (not res!123965) (not e!164216))))

(assert (=> b!253301 (= res!123965 (= (select (arr!5860 (_keys!6828 thiss!1504)) (index!6717 lt!126842)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253301 (and (bvsge (index!6717 lt!126842) #b00000000000000000000000000000000) (bvslt (index!6717 lt!126842) (size!6208 (_keys!6828 thiss!1504))))))

(declare-fun d!61281 () Bool)

(assert (=> d!61281 e!164214))

(assert (=> d!61281 (= c!42709 ((_ is MissingZero!1136) lt!126842))))

(assert (=> d!61281 (= lt!126842 (seekEntryOrOpen!0 key!932 (_keys!6828 thiss!1504) (mask!10909 thiss!1504)))))

(declare-fun lt!126843 () Unit!7813)

(declare-fun choose!1216 (array!12369 array!12367 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) Int) Unit!7813)

(assert (=> d!61281 (= lt!126843 (choose!1216 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)))))

(assert (=> d!61281 (validMask!0 (mask!10909 thiss!1504))))

(assert (=> d!61281 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!409 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)) lt!126843)))

(declare-fun b!253302 () Bool)

(assert (=> b!253302 (and (bvsge (index!6714 lt!126842) #b00000000000000000000000000000000) (bvslt (index!6714 lt!126842) (size!6208 (_keys!6828 thiss!1504))))))

(declare-fun res!123962 () Bool)

(assert (=> b!253302 (= res!123962 (= (select (arr!5860 (_keys!6828 thiss!1504)) (index!6714 lt!126842)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253302 (=> (not res!123962) (not e!164213))))

(declare-fun b!253303 () Bool)

(assert (=> b!253303 (= e!164214 e!164213)))

(declare-fun res!123964 () Bool)

(assert (=> b!253303 (= res!123964 call!23883)))

(assert (=> b!253303 (=> (not res!123964) (not e!164213))))

(assert (= (and d!61281 c!42709) b!253303))

(assert (= (and d!61281 (not c!42709)) b!253299))

(assert (= (and b!253303 res!123964) b!253302))

(assert (= (and b!253302 res!123962) b!253296))

(assert (= (and b!253299 c!42710) b!253297))

(assert (= (and b!253299 (not c!42710)) b!253300))

(assert (= (and b!253297 res!123963) b!253301))

(assert (= (and b!253301 res!123965) b!253298))

(assert (= (or b!253303 b!253297) bm!23881))

(assert (= (or b!253296 b!253298) bm!23880))

(assert (=> d!61281 m!268529))

(declare-fun m!268691 () Bool)

(assert (=> d!61281 m!268691))

(assert (=> d!61281 m!268531))

(assert (=> bm!23880 m!268533))

(declare-fun m!268693 () Bool)

(assert (=> b!253301 m!268693))

(declare-fun m!268695 () Bool)

(assert (=> bm!23881 m!268695))

(declare-fun m!268697 () Bool)

(assert (=> b!253302 m!268697))

(assert (=> b!253129 d!61281))

(declare-fun d!61283 () Bool)

(assert (=> d!61283 (contains!1815 (getCurrentListMap!1390 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)) key!932)))

(declare-fun lt!126846 () Unit!7813)

(declare-fun choose!1217 (array!12369 array!12367 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) (_ BitVec 32) Int) Unit!7813)

(assert (=> d!61283 (= lt!126846 (choose!1217 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(assert (=> d!61283 (validMask!0 (mask!10909 thiss!1504))))

(assert (=> d!61283 (= (lemmaArrayContainsKeyThenInListMap!218 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)) lt!126846)))

(declare-fun bs!9014 () Bool)

(assert (= bs!9014 d!61283))

(assert (=> bs!9014 m!268559))

(assert (=> bs!9014 m!268559))

(assert (=> bs!9014 m!268561))

(declare-fun m!268699 () Bool)

(assert (=> bs!9014 m!268699))

(assert (=> bs!9014 m!268531))

(assert (=> b!253112 d!61283))

(declare-fun d!61285 () Bool)

(declare-fun res!123972 () Bool)

(declare-fun e!164219 () Bool)

(assert (=> d!61285 (=> (not res!123972) (not e!164219))))

(declare-fun simpleValid!269 (LongMapFixedSize!3736) Bool)

(assert (=> d!61285 (= res!123972 (simpleValid!269 thiss!1504))))

(assert (=> d!61285 (= (valid!1464 thiss!1504) e!164219)))

(declare-fun b!253310 () Bool)

(declare-fun res!123973 () Bool)

(assert (=> b!253310 (=> (not res!123973) (not e!164219))))

(assert (=> b!253310 (= res!123973 (= (arrayCountValidKeys!0 (_keys!6828 thiss!1504) #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))) (_size!1917 thiss!1504)))))

(declare-fun b!253311 () Bool)

(declare-fun res!123974 () Bool)

(assert (=> b!253311 (=> (not res!123974) (not e!164219))))

(assert (=> b!253311 (= res!123974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6828 thiss!1504) (mask!10909 thiss!1504)))))

(declare-fun b!253312 () Bool)

(assert (=> b!253312 (= e!164219 (arrayNoDuplicates!0 (_keys!6828 thiss!1504) #b00000000000000000000000000000000 Nil!3725))))

(assert (= (and d!61285 res!123972) b!253310))

(assert (= (and b!253310 res!123973) b!253311))

(assert (= (and b!253311 res!123974) b!253312))

(declare-fun m!268701 () Bool)

(assert (=> d!61285 m!268701))

(assert (=> b!253310 m!268545))

(assert (=> b!253311 m!268567))

(assert (=> b!253312 m!268563))

(assert (=> start!24226 d!61285))

(declare-fun b!253325 () Bool)

(declare-fun e!164227 () SeekEntryResult!1136)

(declare-fun e!164226 () SeekEntryResult!1136)

(assert (=> b!253325 (= e!164227 e!164226)))

(declare-fun lt!126853 () (_ BitVec 64))

(declare-fun lt!126855 () SeekEntryResult!1136)

(assert (=> b!253325 (= lt!126853 (select (arr!5860 (_keys!6828 thiss!1504)) (index!6716 lt!126855)))))

(declare-fun c!42719 () Bool)

(assert (=> b!253325 (= c!42719 (= lt!126853 key!932))))

(declare-fun b!253326 () Bool)

(assert (=> b!253326 (= e!164226 (Found!1136 (index!6716 lt!126855)))))

(declare-fun b!253327 () Bool)

(declare-fun c!42718 () Bool)

(assert (=> b!253327 (= c!42718 (= lt!126853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164228 () SeekEntryResult!1136)

(assert (=> b!253327 (= e!164226 e!164228)))

(declare-fun b!253328 () Bool)

(assert (=> b!253328 (= e!164227 Undefined!1136)))

(declare-fun b!253329 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12369 (_ BitVec 32)) SeekEntryResult!1136)

(assert (=> b!253329 (= e!164228 (seekKeyOrZeroReturnVacant!0 (x!24809 lt!126855) (index!6716 lt!126855) (index!6716 lt!126855) key!932 (_keys!6828 thiss!1504) (mask!10909 thiss!1504)))))

(declare-fun b!253330 () Bool)

(assert (=> b!253330 (= e!164228 (MissingZero!1136 (index!6716 lt!126855)))))

(declare-fun d!61287 () Bool)

(declare-fun lt!126854 () SeekEntryResult!1136)

(assert (=> d!61287 (and (or ((_ is Undefined!1136) lt!126854) (not ((_ is Found!1136) lt!126854)) (and (bvsge (index!6715 lt!126854) #b00000000000000000000000000000000) (bvslt (index!6715 lt!126854) (size!6208 (_keys!6828 thiss!1504))))) (or ((_ is Undefined!1136) lt!126854) ((_ is Found!1136) lt!126854) (not ((_ is MissingZero!1136) lt!126854)) (and (bvsge (index!6714 lt!126854) #b00000000000000000000000000000000) (bvslt (index!6714 lt!126854) (size!6208 (_keys!6828 thiss!1504))))) (or ((_ is Undefined!1136) lt!126854) ((_ is Found!1136) lt!126854) ((_ is MissingZero!1136) lt!126854) (not ((_ is MissingVacant!1136) lt!126854)) (and (bvsge (index!6717 lt!126854) #b00000000000000000000000000000000) (bvslt (index!6717 lt!126854) (size!6208 (_keys!6828 thiss!1504))))) (or ((_ is Undefined!1136) lt!126854) (ite ((_ is Found!1136) lt!126854) (= (select (arr!5860 (_keys!6828 thiss!1504)) (index!6715 lt!126854)) key!932) (ite ((_ is MissingZero!1136) lt!126854) (= (select (arr!5860 (_keys!6828 thiss!1504)) (index!6714 lt!126854)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1136) lt!126854) (= (select (arr!5860 (_keys!6828 thiss!1504)) (index!6717 lt!126854)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61287 (= lt!126854 e!164227)))

(declare-fun c!42717 () Bool)

(assert (=> d!61287 (= c!42717 (and ((_ is Intermediate!1136) lt!126855) (undefined!1948 lt!126855)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12369 (_ BitVec 32)) SeekEntryResult!1136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61287 (= lt!126855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10909 thiss!1504)) key!932 (_keys!6828 thiss!1504) (mask!10909 thiss!1504)))))

(assert (=> d!61287 (validMask!0 (mask!10909 thiss!1504))))

(assert (=> d!61287 (= (seekEntryOrOpen!0 key!932 (_keys!6828 thiss!1504) (mask!10909 thiss!1504)) lt!126854)))

(assert (= (and d!61287 c!42717) b!253328))

(assert (= (and d!61287 (not c!42717)) b!253325))

(assert (= (and b!253325 c!42719) b!253326))

(assert (= (and b!253325 (not c!42719)) b!253327))

(assert (= (and b!253327 c!42718) b!253330))

(assert (= (and b!253327 (not c!42718)) b!253329))

(declare-fun m!268703 () Bool)

(assert (=> b!253325 m!268703))

(declare-fun m!268705 () Bool)

(assert (=> b!253329 m!268705))

(declare-fun m!268707 () Bool)

(assert (=> d!61287 m!268707))

(assert (=> d!61287 m!268531))

(declare-fun m!268709 () Bool)

(assert (=> d!61287 m!268709))

(assert (=> d!61287 m!268709))

(declare-fun m!268711 () Bool)

(assert (=> d!61287 m!268711))

(declare-fun m!268713 () Bool)

(assert (=> d!61287 m!268713))

(declare-fun m!268715 () Bool)

(assert (=> d!61287 m!268715))

(assert (=> b!253122 d!61287))

(declare-fun d!61289 () Bool)

(declare-fun res!123979 () Bool)

(declare-fun e!164233 () Bool)

(assert (=> d!61289 (=> res!123979 e!164233)))

(assert (=> d!61289 (= res!123979 (= (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61289 (= (arrayContainsKey!0 (_keys!6828 thiss!1504) key!932 #b00000000000000000000000000000000) e!164233)))

(declare-fun b!253335 () Bool)

(declare-fun e!164234 () Bool)

(assert (=> b!253335 (= e!164233 e!164234)))

(declare-fun res!123980 () Bool)

(assert (=> b!253335 (=> (not res!123980) (not e!164234))))

(assert (=> b!253335 (= res!123980 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6208 (_keys!6828 thiss!1504))))))

(declare-fun b!253336 () Bool)

(assert (=> b!253336 (= e!164234 (arrayContainsKey!0 (_keys!6828 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61289 (not res!123979)) b!253335))

(assert (= (and b!253335 res!123980) b!253336))

(declare-fun m!268717 () Bool)

(assert (=> d!61289 m!268717))

(declare-fun m!268719 () Bool)

(assert (=> b!253336 m!268719))

(assert (=> bm!23863 d!61289))

(declare-fun b!253345 () Bool)

(declare-fun e!164243 () Bool)

(declare-fun call!23887 () Bool)

(assert (=> b!253345 (= e!164243 call!23887)))

(declare-fun bm!23884 () Bool)

(assert (=> bm!23884 (= call!23887 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6828 thiss!1504) (mask!10909 thiss!1504)))))

(declare-fun b!253346 () Bool)

(declare-fun e!164242 () Bool)

(assert (=> b!253346 (= e!164242 e!164243)))

(declare-fun c!42722 () Bool)

(assert (=> b!253346 (= c!42722 (validKeyInArray!0 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253347 () Bool)

(declare-fun e!164241 () Bool)

(assert (=> b!253347 (= e!164243 e!164241)))

(declare-fun lt!126863 () (_ BitVec 64))

(assert (=> b!253347 (= lt!126863 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126864 () Unit!7813)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12369 (_ BitVec 64) (_ BitVec 32)) Unit!7813)

(assert (=> b!253347 (= lt!126864 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6828 thiss!1504) lt!126863 #b00000000000000000000000000000000))))

(assert (=> b!253347 (arrayContainsKey!0 (_keys!6828 thiss!1504) lt!126863 #b00000000000000000000000000000000)))

(declare-fun lt!126862 () Unit!7813)

(assert (=> b!253347 (= lt!126862 lt!126864)))

(declare-fun res!123986 () Bool)

(assert (=> b!253347 (= res!123986 (= (seekEntryOrOpen!0 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000) (_keys!6828 thiss!1504) (mask!10909 thiss!1504)) (Found!1136 #b00000000000000000000000000000000)))))

(assert (=> b!253347 (=> (not res!123986) (not e!164241))))

(declare-fun b!253348 () Bool)

(assert (=> b!253348 (= e!164241 call!23887)))

(declare-fun d!61291 () Bool)

(declare-fun res!123985 () Bool)

(assert (=> d!61291 (=> res!123985 e!164242)))

(assert (=> d!61291 (= res!123985 (bvsge #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))))))

(assert (=> d!61291 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6828 thiss!1504) (mask!10909 thiss!1504)) e!164242)))

(assert (= (and d!61291 (not res!123985)) b!253346))

(assert (= (and b!253346 c!42722) b!253347))

(assert (= (and b!253346 (not c!42722)) b!253345))

(assert (= (and b!253347 res!123986) b!253348))

(assert (= (or b!253348 b!253345) bm!23884))

(declare-fun m!268721 () Bool)

(assert (=> bm!23884 m!268721))

(assert (=> b!253346 m!268717))

(assert (=> b!253346 m!268717))

(declare-fun m!268723 () Bool)

(assert (=> b!253346 m!268723))

(assert (=> b!253347 m!268717))

(declare-fun m!268725 () Bool)

(assert (=> b!253347 m!268725))

(declare-fun m!268727 () Bool)

(assert (=> b!253347 m!268727))

(assert (=> b!253347 m!268717))

(declare-fun m!268729 () Bool)

(assert (=> b!253347 m!268729))

(assert (=> b!253119 d!61291))

(declare-fun d!61293 () Bool)

(declare-fun e!164246 () Bool)

(assert (=> d!61293 e!164246))

(declare-fun res!123992 () Bool)

(assert (=> d!61293 (=> (not res!123992) (not e!164246))))

(declare-fun lt!126869 () SeekEntryResult!1136)

(assert (=> d!61293 (= res!123992 ((_ is Found!1136) lt!126869))))

(assert (=> d!61293 (= lt!126869 (seekEntryOrOpen!0 key!932 (_keys!6828 thiss!1504) (mask!10909 thiss!1504)))))

(declare-fun lt!126870 () Unit!7813)

(declare-fun choose!1218 (array!12369 array!12367 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 64) Int) Unit!7813)

(assert (=> d!61293 (= lt!126870 (choose!1218 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)))))

(assert (=> d!61293 (validMask!0 (mask!10909 thiss!1504))))

(assert (=> d!61293 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!409 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) key!932 (defaultEntry!4677 thiss!1504)) lt!126870)))

(declare-fun b!253353 () Bool)

(declare-fun res!123991 () Bool)

(assert (=> b!253353 (=> (not res!123991) (not e!164246))))

(assert (=> b!253353 (= res!123991 (inRange!0 (index!6715 lt!126869) (mask!10909 thiss!1504)))))

(declare-fun b!253354 () Bool)

(assert (=> b!253354 (= e!164246 (= (select (arr!5860 (_keys!6828 thiss!1504)) (index!6715 lt!126869)) key!932))))

(assert (=> b!253354 (and (bvsge (index!6715 lt!126869) #b00000000000000000000000000000000) (bvslt (index!6715 lt!126869) (size!6208 (_keys!6828 thiss!1504))))))

(assert (= (and d!61293 res!123992) b!253353))

(assert (= (and b!253353 res!123991) b!253354))

(assert (=> d!61293 m!268529))

(declare-fun m!268731 () Bool)

(assert (=> d!61293 m!268731))

(assert (=> d!61293 m!268531))

(declare-fun m!268733 () Bool)

(assert (=> b!253353 m!268733))

(declare-fun m!268735 () Bool)

(assert (=> b!253354 m!268735))

(assert (=> b!253110 d!61293))

(declare-fun d!61295 () Bool)

(assert (=> d!61295 (= (inRange!0 index!297 (mask!10909 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10909 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!253126 d!61295))

(declare-fun d!61297 () Bool)

(declare-fun e!164251 () Bool)

(assert (=> d!61297 e!164251))

(declare-fun res!123995 () Bool)

(assert (=> d!61297 (=> res!123995 e!164251)))

(declare-fun lt!126880 () Bool)

(assert (=> d!61297 (= res!123995 (not lt!126880))))

(declare-fun lt!126882 () Bool)

(assert (=> d!61297 (= lt!126880 lt!126882)))

(declare-fun lt!126879 () Unit!7813)

(declare-fun e!164252 () Unit!7813)

(assert (=> d!61297 (= lt!126879 e!164252)))

(declare-fun c!42725 () Bool)

(assert (=> d!61297 (= c!42725 lt!126882)))

(declare-fun containsKey!294 (List!3729 (_ BitVec 64)) Bool)

(assert (=> d!61297 (= lt!126882 (containsKey!294 (toList!1881 (getCurrentListMap!1390 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504))) key!932))))

(assert (=> d!61297 (= (contains!1815 (getCurrentListMap!1390 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)) key!932) lt!126880)))

(declare-fun b!253361 () Bool)

(declare-fun lt!126881 () Unit!7813)

(assert (=> b!253361 (= e!164252 lt!126881)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!243 (List!3729 (_ BitVec 64)) Unit!7813)

(assert (=> b!253361 (= lt!126881 (lemmaContainsKeyImpliesGetValueByKeyDefined!243 (toList!1881 (getCurrentListMap!1390 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504))) key!932))))

(declare-datatypes ((Option!308 0))(
  ( (Some!307 (v!5376 V!8345)) (None!306) )
))
(declare-fun isDefined!244 (Option!308) Bool)

(declare-fun getValueByKey!302 (List!3729 (_ BitVec 64)) Option!308)

(assert (=> b!253361 (isDefined!244 (getValueByKey!302 (toList!1881 (getCurrentListMap!1390 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504))) key!932))))

(declare-fun b!253362 () Bool)

(declare-fun Unit!7818 () Unit!7813)

(assert (=> b!253362 (= e!164252 Unit!7818)))

(declare-fun b!253363 () Bool)

(assert (=> b!253363 (= e!164251 (isDefined!244 (getValueByKey!302 (toList!1881 (getCurrentListMap!1390 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504))) key!932)))))

(assert (= (and d!61297 c!42725) b!253361))

(assert (= (and d!61297 (not c!42725)) b!253362))

(assert (= (and d!61297 (not res!123995)) b!253363))

(declare-fun m!268737 () Bool)

(assert (=> d!61297 m!268737))

(declare-fun m!268739 () Bool)

(assert (=> b!253361 m!268739))

(declare-fun m!268741 () Bool)

(assert (=> b!253361 m!268741))

(assert (=> b!253361 m!268741))

(declare-fun m!268743 () Bool)

(assert (=> b!253361 m!268743))

(assert (=> b!253363 m!268741))

(assert (=> b!253363 m!268741))

(assert (=> b!253363 m!268743))

(assert (=> b!253126 d!61297))

(declare-fun bm!23899 () Bool)

(declare-fun call!23902 () ListLongMap!3731)

(declare-fun getCurrentListMapNoExtraKeys!562 (array!12369 array!12367 (_ BitVec 32) (_ BitVec 32) V!8345 V!8345 (_ BitVec 32) Int) ListLongMap!3731)

(assert (=> bm!23899 (= call!23902 (getCurrentListMapNoExtraKeys!562 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(declare-fun b!253406 () Bool)

(declare-fun e!164290 () Bool)

(declare-fun call!23905 () Bool)

(assert (=> b!253406 (= e!164290 (not call!23905))))

(declare-fun b!253407 () Bool)

(declare-fun c!42743 () Bool)

(assert (=> b!253407 (= c!42743 (and (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!164289 () ListLongMap!3731)

(declare-fun e!164285 () ListLongMap!3731)

(assert (=> b!253407 (= e!164289 e!164285)))

(declare-fun b!253408 () Bool)

(declare-fun res!124015 () Bool)

(declare-fun e!164288 () Bool)

(assert (=> b!253408 (=> (not res!124015) (not e!164288))))

(declare-fun e!164287 () Bool)

(assert (=> b!253408 (= res!124015 e!164287)))

(declare-fun res!124022 () Bool)

(assert (=> b!253408 (=> res!124022 e!164287)))

(declare-fun e!164280 () Bool)

(assert (=> b!253408 (= res!124022 (not e!164280))))

(declare-fun res!124016 () Bool)

(assert (=> b!253408 (=> (not res!124016) (not e!164280))))

(assert (=> b!253408 (= res!124016 (bvslt #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))))))

(declare-fun b!253409 () Bool)

(declare-fun call!23904 () ListLongMap!3731)

(assert (=> b!253409 (= e!164289 call!23904)))

(declare-fun b!253410 () Bool)

(declare-fun e!164281 () Bool)

(assert (=> b!253410 (= e!164288 e!164281)))

(declare-fun c!42740 () Bool)

(assert (=> b!253410 (= c!42740 (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!253411 () Bool)

(assert (=> b!253411 (= e!164285 call!23904)))

(declare-fun b!253413 () Bool)

(declare-fun call!23907 () Bool)

(assert (=> b!253413 (= e!164281 (not call!23907))))

(declare-fun bm!23900 () Bool)

(declare-fun call!23906 () ListLongMap!3731)

(assert (=> bm!23900 (= call!23906 call!23902)))

(declare-fun b!253414 () Bool)

(declare-fun e!164286 () Bool)

(assert (=> b!253414 (= e!164287 e!164286)))

(declare-fun res!124018 () Bool)

(assert (=> b!253414 (=> (not res!124018) (not e!164286))))

(declare-fun lt!126935 () ListLongMap!3731)

(assert (=> b!253414 (= res!124018 (contains!1815 lt!126935 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!253414 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))))))

(declare-fun b!253415 () Bool)

(declare-fun e!164291 () Bool)

(assert (=> b!253415 (= e!164290 e!164291)))

(declare-fun res!124020 () Bool)

(assert (=> b!253415 (= res!124020 call!23905)))

(assert (=> b!253415 (=> (not res!124020) (not e!164291))))

(declare-fun b!253416 () Bool)

(declare-fun e!164283 () Bool)

(assert (=> b!253416 (= e!164283 (validKeyInArray!0 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun call!23903 () ListLongMap!3731)

(declare-fun c!42739 () Bool)

(declare-fun c!42741 () Bool)

(declare-fun bm!23901 () Bool)

(declare-fun call!23908 () ListLongMap!3731)

(declare-fun +!679 (ListLongMap!3731 tuple2!4828) ListLongMap!3731)

(assert (=> bm!23901 (= call!23908 (+!679 (ite c!42739 call!23902 (ite c!42741 call!23906 call!23903)) (ite (or c!42739 c!42741) (tuple2!4829 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4518 thiss!1504)) (tuple2!4829 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4518 thiss!1504)))))))

(declare-fun b!253417 () Bool)

(declare-fun apply!246 (ListLongMap!3731 (_ BitVec 64)) V!8345)

(declare-fun get!3015 (ValueCell!2918 V!8345) V!8345)

(declare-fun dynLambda!580 (Int (_ BitVec 64)) V!8345)

(assert (=> b!253417 (= e!164286 (= (apply!246 lt!126935 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000)) (get!3015 (select (arr!5859 (_values!4660 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!580 (defaultEntry!4677 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!253417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6207 (_values!4660 thiss!1504))))))

(assert (=> b!253417 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))))))

(declare-fun b!253418 () Bool)

(declare-fun e!164279 () Bool)

(assert (=> b!253418 (= e!164281 e!164279)))

(declare-fun res!124021 () Bool)

(assert (=> b!253418 (= res!124021 call!23907)))

(assert (=> b!253418 (=> (not res!124021) (not e!164279))))

(declare-fun b!253419 () Bool)

(assert (=> b!253419 (= e!164279 (= (apply!246 lt!126935 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4518 thiss!1504)))))

(declare-fun b!253420 () Bool)

(declare-fun e!164284 () Unit!7813)

(declare-fun lt!126936 () Unit!7813)

(assert (=> b!253420 (= e!164284 lt!126936)))

(declare-fun lt!126930 () ListLongMap!3731)

(assert (=> b!253420 (= lt!126930 (getCurrentListMapNoExtraKeys!562 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(declare-fun lt!126942 () (_ BitVec 64))

(assert (=> b!253420 (= lt!126942 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126946 () (_ BitVec 64))

(assert (=> b!253420 (= lt!126946 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126943 () Unit!7813)

(declare-fun addStillContains!222 (ListLongMap!3731 (_ BitVec 64) V!8345 (_ BitVec 64)) Unit!7813)

(assert (=> b!253420 (= lt!126943 (addStillContains!222 lt!126930 lt!126942 (zeroValue!4518 thiss!1504) lt!126946))))

(assert (=> b!253420 (contains!1815 (+!679 lt!126930 (tuple2!4829 lt!126942 (zeroValue!4518 thiss!1504))) lt!126946)))

(declare-fun lt!126929 () Unit!7813)

(assert (=> b!253420 (= lt!126929 lt!126943)))

(declare-fun lt!126928 () ListLongMap!3731)

(assert (=> b!253420 (= lt!126928 (getCurrentListMapNoExtraKeys!562 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(declare-fun lt!126932 () (_ BitVec 64))

(assert (=> b!253420 (= lt!126932 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126937 () (_ BitVec 64))

(assert (=> b!253420 (= lt!126937 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126947 () Unit!7813)

(declare-fun addApplyDifferent!222 (ListLongMap!3731 (_ BitVec 64) V!8345 (_ BitVec 64)) Unit!7813)

(assert (=> b!253420 (= lt!126947 (addApplyDifferent!222 lt!126928 lt!126932 (minValue!4518 thiss!1504) lt!126937))))

(assert (=> b!253420 (= (apply!246 (+!679 lt!126928 (tuple2!4829 lt!126932 (minValue!4518 thiss!1504))) lt!126937) (apply!246 lt!126928 lt!126937))))

(declare-fun lt!126938 () Unit!7813)

(assert (=> b!253420 (= lt!126938 lt!126947)))

(declare-fun lt!126939 () ListLongMap!3731)

(assert (=> b!253420 (= lt!126939 (getCurrentListMapNoExtraKeys!562 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(declare-fun lt!126934 () (_ BitVec 64))

(assert (=> b!253420 (= lt!126934 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126945 () (_ BitVec 64))

(assert (=> b!253420 (= lt!126945 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126931 () Unit!7813)

(assert (=> b!253420 (= lt!126931 (addApplyDifferent!222 lt!126939 lt!126934 (zeroValue!4518 thiss!1504) lt!126945))))

(assert (=> b!253420 (= (apply!246 (+!679 lt!126939 (tuple2!4829 lt!126934 (zeroValue!4518 thiss!1504))) lt!126945) (apply!246 lt!126939 lt!126945))))

(declare-fun lt!126940 () Unit!7813)

(assert (=> b!253420 (= lt!126940 lt!126931)))

(declare-fun lt!126944 () ListLongMap!3731)

(assert (=> b!253420 (= lt!126944 (getCurrentListMapNoExtraKeys!562 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)))))

(declare-fun lt!126941 () (_ BitVec 64))

(assert (=> b!253420 (= lt!126941 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126933 () (_ BitVec 64))

(assert (=> b!253420 (= lt!126933 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253420 (= lt!126936 (addApplyDifferent!222 lt!126944 lt!126941 (minValue!4518 thiss!1504) lt!126933))))

(assert (=> b!253420 (= (apply!246 (+!679 lt!126944 (tuple2!4829 lt!126941 (minValue!4518 thiss!1504))) lt!126933) (apply!246 lt!126944 lt!126933))))

(declare-fun bm!23902 () Bool)

(assert (=> bm!23902 (= call!23905 (contains!1815 lt!126935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23903 () Bool)

(assert (=> bm!23903 (= call!23907 (contains!1815 lt!126935 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253421 () Bool)

(declare-fun e!164282 () ListLongMap!3731)

(assert (=> b!253421 (= e!164282 (+!679 call!23908 (tuple2!4829 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4518 thiss!1504))))))

(declare-fun bm!23904 () Bool)

(assert (=> bm!23904 (= call!23904 call!23908)))

(declare-fun b!253412 () Bool)

(declare-fun res!124014 () Bool)

(assert (=> b!253412 (=> (not res!124014) (not e!164288))))

(assert (=> b!253412 (= res!124014 e!164290)))

(declare-fun c!42742 () Bool)

(assert (=> b!253412 (= c!42742 (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!61299 () Bool)

(assert (=> d!61299 e!164288))

(declare-fun res!124019 () Bool)

(assert (=> d!61299 (=> (not res!124019) (not e!164288))))

(assert (=> d!61299 (= res!124019 (or (bvsge #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))))))))

(declare-fun lt!126948 () ListLongMap!3731)

(assert (=> d!61299 (= lt!126935 lt!126948)))

(declare-fun lt!126927 () Unit!7813)

(assert (=> d!61299 (= lt!126927 e!164284)))

(declare-fun c!42738 () Bool)

(assert (=> d!61299 (= c!42738 e!164283)))

(declare-fun res!124017 () Bool)

(assert (=> d!61299 (=> (not res!124017) (not e!164283))))

(assert (=> d!61299 (= res!124017 (bvslt #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))))))

(assert (=> d!61299 (= lt!126948 e!164282)))

(assert (=> d!61299 (= c!42739 (and (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61299 (validMask!0 (mask!10909 thiss!1504))))

(assert (=> d!61299 (= (getCurrentListMap!1390 (_keys!6828 thiss!1504) (_values!4660 thiss!1504) (mask!10909 thiss!1504) (extraKeys!4414 thiss!1504) (zeroValue!4518 thiss!1504) (minValue!4518 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4677 thiss!1504)) lt!126935)))

(declare-fun b!253422 () Bool)

(assert (=> b!253422 (= e!164285 call!23903)))

(declare-fun b!253423 () Bool)

(assert (=> b!253423 (= e!164282 e!164289)))

(assert (=> b!253423 (= c!42741 (and (not (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4414 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23905 () Bool)

(assert (=> bm!23905 (= call!23903 call!23906)))

(declare-fun b!253424 () Bool)

(declare-fun Unit!7819 () Unit!7813)

(assert (=> b!253424 (= e!164284 Unit!7819)))

(declare-fun b!253425 () Bool)

(assert (=> b!253425 (= e!164280 (validKeyInArray!0 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253426 () Bool)

(assert (=> b!253426 (= e!164291 (= (apply!246 lt!126935 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4518 thiss!1504)))))

(assert (= (and d!61299 c!42739) b!253421))

(assert (= (and d!61299 (not c!42739)) b!253423))

(assert (= (and b!253423 c!42741) b!253409))

(assert (= (and b!253423 (not c!42741)) b!253407))

(assert (= (and b!253407 c!42743) b!253411))

(assert (= (and b!253407 (not c!42743)) b!253422))

(assert (= (or b!253411 b!253422) bm!23905))

(assert (= (or b!253409 bm!23905) bm!23900))

(assert (= (or b!253409 b!253411) bm!23904))

(assert (= (or b!253421 bm!23900) bm!23899))

(assert (= (or b!253421 bm!23904) bm!23901))

(assert (= (and d!61299 res!124017) b!253416))

(assert (= (and d!61299 c!42738) b!253420))

(assert (= (and d!61299 (not c!42738)) b!253424))

(assert (= (and d!61299 res!124019) b!253408))

(assert (= (and b!253408 res!124016) b!253425))

(assert (= (and b!253408 (not res!124022)) b!253414))

(assert (= (and b!253414 res!124018) b!253417))

(assert (= (and b!253408 res!124015) b!253412))

(assert (= (and b!253412 c!42742) b!253415))

(assert (= (and b!253412 (not c!42742)) b!253406))

(assert (= (and b!253415 res!124020) b!253426))

(assert (= (or b!253415 b!253406) bm!23902))

(assert (= (and b!253412 res!124014) b!253410))

(assert (= (and b!253410 c!42740) b!253418))

(assert (= (and b!253410 (not c!42740)) b!253413))

(assert (= (and b!253418 res!124021) b!253419))

(assert (= (or b!253418 b!253413) bm!23903))

(declare-fun b_lambda!8109 () Bool)

(assert (=> (not b_lambda!8109) (not b!253417)))

(declare-fun t!8768 () Bool)

(declare-fun tb!2997 () Bool)

(assert (=> (and b!253108 (= (defaultEntry!4677 thiss!1504) (defaultEntry!4677 thiss!1504)) t!8768) tb!2997))

(declare-fun result!5329 () Bool)

(assert (=> tb!2997 (= result!5329 tp_is_empty!6523)))

(assert (=> b!253417 t!8768))

(declare-fun b_and!13681 () Bool)

(assert (= b_and!13675 (and (=> t!8768 result!5329) b_and!13681)))

(assert (=> b!253414 m!268717))

(assert (=> b!253414 m!268717))

(declare-fun m!268745 () Bool)

(assert (=> b!253414 m!268745))

(declare-fun m!268747 () Bool)

(assert (=> bm!23899 m!268747))

(declare-fun m!268749 () Bool)

(assert (=> bm!23903 m!268749))

(assert (=> b!253416 m!268717))

(assert (=> b!253416 m!268717))

(assert (=> b!253416 m!268723))

(declare-fun m!268751 () Bool)

(assert (=> b!253417 m!268751))

(assert (=> b!253417 m!268717))

(declare-fun m!268753 () Bool)

(assert (=> b!253417 m!268753))

(assert (=> b!253417 m!268717))

(declare-fun m!268755 () Bool)

(assert (=> b!253417 m!268755))

(assert (=> b!253417 m!268753))

(assert (=> b!253417 m!268751))

(declare-fun m!268757 () Bool)

(assert (=> b!253417 m!268757))

(assert (=> d!61299 m!268531))

(declare-fun m!268759 () Bool)

(assert (=> bm!23902 m!268759))

(declare-fun m!268761 () Bool)

(assert (=> b!253419 m!268761))

(assert (=> b!253420 m!268747))

(declare-fun m!268763 () Bool)

(assert (=> b!253420 m!268763))

(declare-fun m!268765 () Bool)

(assert (=> b!253420 m!268765))

(assert (=> b!253420 m!268765))

(declare-fun m!268767 () Bool)

(assert (=> b!253420 m!268767))

(declare-fun m!268769 () Bool)

(assert (=> b!253420 m!268769))

(declare-fun m!268771 () Bool)

(assert (=> b!253420 m!268771))

(declare-fun m!268773 () Bool)

(assert (=> b!253420 m!268773))

(declare-fun m!268775 () Bool)

(assert (=> b!253420 m!268775))

(declare-fun m!268777 () Bool)

(assert (=> b!253420 m!268777))

(assert (=> b!253420 m!268717))

(declare-fun m!268779 () Bool)

(assert (=> b!253420 m!268779))

(declare-fun m!268781 () Bool)

(assert (=> b!253420 m!268781))

(declare-fun m!268783 () Bool)

(assert (=> b!253420 m!268783))

(declare-fun m!268785 () Bool)

(assert (=> b!253420 m!268785))

(declare-fun m!268787 () Bool)

(assert (=> b!253420 m!268787))

(assert (=> b!253420 m!268775))

(declare-fun m!268789 () Bool)

(assert (=> b!253420 m!268789))

(assert (=> b!253420 m!268771))

(assert (=> b!253420 m!268785))

(declare-fun m!268791 () Bool)

(assert (=> b!253420 m!268791))

(declare-fun m!268793 () Bool)

(assert (=> b!253426 m!268793))

(assert (=> b!253425 m!268717))

(assert (=> b!253425 m!268717))

(assert (=> b!253425 m!268723))

(declare-fun m!268795 () Bool)

(assert (=> bm!23901 m!268795))

(declare-fun m!268797 () Bool)

(assert (=> b!253421 m!268797))

(assert (=> b!253126 d!61299))

(declare-fun d!61301 () Bool)

(assert (=> d!61301 (= (inRange!0 (ite c!42678 (index!6714 lt!126773) (index!6717 lt!126773)) (mask!10909 thiss!1504)) (and (bvsge (ite c!42678 (index!6714 lt!126773) (index!6717 lt!126773)) #b00000000000000000000000000000000) (bvslt (ite c!42678 (index!6714 lt!126773) (index!6717 lt!126773)) (bvadd (mask!10909 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23862 d!61301))

(declare-fun d!61303 () Bool)

(assert (=> d!61303 (= (array_inv!3867 (_keys!6828 thiss!1504)) (bvsge (size!6208 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253108 d!61303))

(declare-fun d!61305 () Bool)

(assert (=> d!61305 (= (array_inv!3868 (_values!4660 thiss!1504)) (bvsge (size!6207 (_values!4660 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253108 d!61305))

(declare-fun b!253429 () Bool)

(declare-fun e!164294 () Bool)

(declare-fun call!23909 () Bool)

(assert (=> b!253429 (= e!164294 call!23909)))

(declare-fun bm!23906 () Bool)

(assert (=> bm!23906 (= call!23909 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126774 (mask!10909 thiss!1504)))))

(declare-fun b!253430 () Bool)

(declare-fun e!164293 () Bool)

(assert (=> b!253430 (= e!164293 e!164294)))

(declare-fun c!42744 () Bool)

(assert (=> b!253430 (= c!42744 (validKeyInArray!0 (select (arr!5860 lt!126774) #b00000000000000000000000000000000)))))

(declare-fun b!253431 () Bool)

(declare-fun e!164292 () Bool)

(assert (=> b!253431 (= e!164294 e!164292)))

(declare-fun lt!126950 () (_ BitVec 64))

(assert (=> b!253431 (= lt!126950 (select (arr!5860 lt!126774) #b00000000000000000000000000000000))))

(declare-fun lt!126951 () Unit!7813)

(assert (=> b!253431 (= lt!126951 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126774 lt!126950 #b00000000000000000000000000000000))))

(assert (=> b!253431 (arrayContainsKey!0 lt!126774 lt!126950 #b00000000000000000000000000000000)))

(declare-fun lt!126949 () Unit!7813)

(assert (=> b!253431 (= lt!126949 lt!126951)))

(declare-fun res!124024 () Bool)

(assert (=> b!253431 (= res!124024 (= (seekEntryOrOpen!0 (select (arr!5860 lt!126774) #b00000000000000000000000000000000) lt!126774 (mask!10909 thiss!1504)) (Found!1136 #b00000000000000000000000000000000)))))

(assert (=> b!253431 (=> (not res!124024) (not e!164292))))

(declare-fun b!253432 () Bool)

(assert (=> b!253432 (= e!164292 call!23909)))

(declare-fun d!61307 () Bool)

(declare-fun res!124023 () Bool)

(assert (=> d!61307 (=> res!124023 e!164293)))

(assert (=> d!61307 (= res!124023 (bvsge #b00000000000000000000000000000000 (size!6208 lt!126774)))))

(assert (=> d!61307 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126774 (mask!10909 thiss!1504)) e!164293)))

(assert (= (and d!61307 (not res!124023)) b!253430))

(assert (= (and b!253430 c!42744) b!253431))

(assert (= (and b!253430 (not c!42744)) b!253429))

(assert (= (and b!253431 res!124024) b!253432))

(assert (= (or b!253432 b!253429) bm!23906))

(declare-fun m!268799 () Bool)

(assert (=> bm!23906 m!268799))

(declare-fun m!268801 () Bool)

(assert (=> b!253430 m!268801))

(assert (=> b!253430 m!268801))

(declare-fun m!268803 () Bool)

(assert (=> b!253430 m!268803))

(assert (=> b!253431 m!268801))

(declare-fun m!268805 () Bool)

(assert (=> b!253431 m!268805))

(declare-fun m!268807 () Bool)

(assert (=> b!253431 m!268807))

(assert (=> b!253431 m!268801))

(declare-fun m!268809 () Bool)

(assert (=> b!253431 m!268809))

(assert (=> b!253123 d!61307))

(declare-fun b!253444 () Bool)

(declare-fun e!164299 () Bool)

(assert (=> b!253444 (= e!164299 (= (arrayCountValidKeys!0 (array!12370 (store (arr!5860 (_keys!6828 thiss!1504)) index!297 key!932) (size!6208 (_keys!6828 thiss!1504))) #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6828 thiss!1504) #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun d!61309 () Bool)

(assert (=> d!61309 e!164299))

(declare-fun res!124035 () Bool)

(assert (=> d!61309 (=> (not res!124035) (not e!164299))))

(assert (=> d!61309 (= res!124035 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6208 (_keys!6828 thiss!1504)))))))

(declare-fun lt!126954 () Unit!7813)

(declare-fun choose!1 (array!12369 (_ BitVec 32) (_ BitVec 64)) Unit!7813)

(assert (=> d!61309 (= lt!126954 (choose!1 (_keys!6828 thiss!1504) index!297 key!932))))

(declare-fun e!164300 () Bool)

(assert (=> d!61309 e!164300))

(declare-fun res!124036 () Bool)

(assert (=> d!61309 (=> (not res!124036) (not e!164300))))

(assert (=> d!61309 (= res!124036 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6208 (_keys!6828 thiss!1504)))))))

(assert (=> d!61309 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6828 thiss!1504) index!297 key!932) lt!126954)))

(declare-fun b!253441 () Bool)

(declare-fun res!124034 () Bool)

(assert (=> b!253441 (=> (not res!124034) (not e!164300))))

(assert (=> b!253441 (= res!124034 (not (validKeyInArray!0 (select (arr!5860 (_keys!6828 thiss!1504)) index!297))))))

(declare-fun b!253442 () Bool)

(declare-fun res!124033 () Bool)

(assert (=> b!253442 (=> (not res!124033) (not e!164300))))

(assert (=> b!253442 (= res!124033 (validKeyInArray!0 key!932))))

(declare-fun b!253443 () Bool)

(assert (=> b!253443 (= e!164300 (bvslt (size!6208 (_keys!6828 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!61309 res!124036) b!253441))

(assert (= (and b!253441 res!124034) b!253442))

(assert (= (and b!253442 res!124033) b!253443))

(assert (= (and d!61309 res!124035) b!253444))

(assert (=> b!253444 m!268543))

(declare-fun m!268811 () Bool)

(assert (=> b!253444 m!268811))

(assert (=> b!253444 m!268545))

(declare-fun m!268813 () Bool)

(assert (=> d!61309 m!268813))

(declare-fun m!268815 () Bool)

(assert (=> b!253441 m!268815))

(assert (=> b!253441 m!268815))

(declare-fun m!268817 () Bool)

(assert (=> b!253441 m!268817))

(assert (=> b!253442 m!268581))

(assert (=> b!253123 d!61309))

(declare-fun d!61311 () Bool)

(declare-fun res!124045 () Bool)

(declare-fun e!164312 () Bool)

(assert (=> d!61311 (=> res!124045 e!164312)))

(assert (=> d!61311 (= res!124045 (bvsge #b00000000000000000000000000000000 (size!6208 lt!126774)))))

(assert (=> d!61311 (= (arrayNoDuplicates!0 lt!126774 #b00000000000000000000000000000000 Nil!3725) e!164312)))

(declare-fun b!253455 () Bool)

(declare-fun e!164311 () Bool)

(declare-fun call!23912 () Bool)

(assert (=> b!253455 (= e!164311 call!23912)))

(declare-fun b!253456 () Bool)

(declare-fun e!164310 () Bool)

(assert (=> b!253456 (= e!164312 e!164310)))

(declare-fun res!124044 () Bool)

(assert (=> b!253456 (=> (not res!124044) (not e!164310))))

(declare-fun e!164309 () Bool)

(assert (=> b!253456 (= res!124044 (not e!164309))))

(declare-fun res!124043 () Bool)

(assert (=> b!253456 (=> (not res!124043) (not e!164309))))

(assert (=> b!253456 (= res!124043 (validKeyInArray!0 (select (arr!5860 lt!126774) #b00000000000000000000000000000000)))))

(declare-fun bm!23909 () Bool)

(declare-fun c!42747 () Bool)

(assert (=> bm!23909 (= call!23912 (arrayNoDuplicates!0 lt!126774 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42747 (Cons!3724 (select (arr!5860 lt!126774) #b00000000000000000000000000000000) Nil!3725) Nil!3725)))))

(declare-fun b!253457 () Bool)

(assert (=> b!253457 (= e!164311 call!23912)))

(declare-fun b!253458 () Bool)

(assert (=> b!253458 (= e!164310 e!164311)))

(assert (=> b!253458 (= c!42747 (validKeyInArray!0 (select (arr!5860 lt!126774) #b00000000000000000000000000000000)))))

(declare-fun b!253459 () Bool)

(declare-fun contains!1816 (List!3728 (_ BitVec 64)) Bool)

(assert (=> b!253459 (= e!164309 (contains!1816 Nil!3725 (select (arr!5860 lt!126774) #b00000000000000000000000000000000)))))

(assert (= (and d!61311 (not res!124045)) b!253456))

(assert (= (and b!253456 res!124043) b!253459))

(assert (= (and b!253456 res!124044) b!253458))

(assert (= (and b!253458 c!42747) b!253455))

(assert (= (and b!253458 (not c!42747)) b!253457))

(assert (= (or b!253455 b!253457) bm!23909))

(assert (=> b!253456 m!268801))

(assert (=> b!253456 m!268801))

(assert (=> b!253456 m!268803))

(assert (=> bm!23909 m!268801))

(declare-fun m!268819 () Bool)

(assert (=> bm!23909 m!268819))

(assert (=> b!253458 m!268801))

(assert (=> b!253458 m!268801))

(assert (=> b!253458 m!268803))

(assert (=> b!253459 m!268801))

(assert (=> b!253459 m!268801))

(declare-fun m!268821 () Bool)

(assert (=> b!253459 m!268821))

(assert (=> b!253123 d!61311))

(declare-fun b!253468 () Bool)

(declare-fun e!164317 () (_ BitVec 32))

(declare-fun e!164318 () (_ BitVec 32))

(assert (=> b!253468 (= e!164317 e!164318)))

(declare-fun c!42752 () Bool)

(assert (=> b!253468 (= c!42752 (validKeyInArray!0 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61313 () Bool)

(declare-fun lt!126957 () (_ BitVec 32))

(assert (=> d!61313 (and (bvsge lt!126957 #b00000000000000000000000000000000) (bvsle lt!126957 (bvsub (size!6208 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!61313 (= lt!126957 e!164317)))

(declare-fun c!42753 () Bool)

(assert (=> d!61313 (= c!42753 (bvsge #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))))))

(assert (=> d!61313 (and (bvsle #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6208 (_keys!6828 thiss!1504)) (size!6208 (_keys!6828 thiss!1504))))))

(assert (=> d!61313 (= (arrayCountValidKeys!0 (_keys!6828 thiss!1504) #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))) lt!126957)))

(declare-fun b!253469 () Bool)

(assert (=> b!253469 (= e!164317 #b00000000000000000000000000000000)))

(declare-fun bm!23912 () Bool)

(declare-fun call!23915 () (_ BitVec 32))

(assert (=> bm!23912 (= call!23915 (arrayCountValidKeys!0 (_keys!6828 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6208 (_keys!6828 thiss!1504))))))

(declare-fun b!253470 () Bool)

(assert (=> b!253470 (= e!164318 call!23915)))

(declare-fun b!253471 () Bool)

(assert (=> b!253471 (= e!164318 (bvadd #b00000000000000000000000000000001 call!23915))))

(assert (= (and d!61313 c!42753) b!253469))

(assert (= (and d!61313 (not c!42753)) b!253468))

(assert (= (and b!253468 c!42752) b!253471))

(assert (= (and b!253468 (not c!42752)) b!253470))

(assert (= (or b!253471 b!253470) bm!23912))

(assert (=> b!253468 m!268717))

(assert (=> b!253468 m!268717))

(assert (=> b!253468 m!268723))

(declare-fun m!268823 () Bool)

(assert (=> bm!23912 m!268823))

(assert (=> b!253123 d!61313))

(declare-fun d!61315 () Bool)

(assert (=> d!61315 (= (validMask!0 (mask!10909 thiss!1504)) (and (or (= (mask!10909 thiss!1504) #b00000000000000000000000000000111) (= (mask!10909 thiss!1504) #b00000000000000000000000000001111) (= (mask!10909 thiss!1504) #b00000000000000000000000000011111) (= (mask!10909 thiss!1504) #b00000000000000000000000000111111) (= (mask!10909 thiss!1504) #b00000000000000000000000001111111) (= (mask!10909 thiss!1504) #b00000000000000000000000011111111) (= (mask!10909 thiss!1504) #b00000000000000000000000111111111) (= (mask!10909 thiss!1504) #b00000000000000000000001111111111) (= (mask!10909 thiss!1504) #b00000000000000000000011111111111) (= (mask!10909 thiss!1504) #b00000000000000000000111111111111) (= (mask!10909 thiss!1504) #b00000000000000000001111111111111) (= (mask!10909 thiss!1504) #b00000000000000000011111111111111) (= (mask!10909 thiss!1504) #b00000000000000000111111111111111) (= (mask!10909 thiss!1504) #b00000000000000001111111111111111) (= (mask!10909 thiss!1504) #b00000000000000011111111111111111) (= (mask!10909 thiss!1504) #b00000000000000111111111111111111) (= (mask!10909 thiss!1504) #b00000000000001111111111111111111) (= (mask!10909 thiss!1504) #b00000000000011111111111111111111) (= (mask!10909 thiss!1504) #b00000000000111111111111111111111) (= (mask!10909 thiss!1504) #b00000000001111111111111111111111) (= (mask!10909 thiss!1504) #b00000000011111111111111111111111) (= (mask!10909 thiss!1504) #b00000000111111111111111111111111) (= (mask!10909 thiss!1504) #b00000001111111111111111111111111) (= (mask!10909 thiss!1504) #b00000011111111111111111111111111) (= (mask!10909 thiss!1504) #b00000111111111111111111111111111) (= (mask!10909 thiss!1504) #b00001111111111111111111111111111) (= (mask!10909 thiss!1504) #b00011111111111111111111111111111) (= (mask!10909 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10909 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!253123 d!61315))

(declare-fun b!253472 () Bool)

(declare-fun e!164319 () (_ BitVec 32))

(declare-fun e!164320 () (_ BitVec 32))

(assert (=> b!253472 (= e!164319 e!164320)))

(declare-fun c!42754 () Bool)

(assert (=> b!253472 (= c!42754 (validKeyInArray!0 (select (arr!5860 lt!126774) #b00000000000000000000000000000000)))))

(declare-fun d!61317 () Bool)

(declare-fun lt!126958 () (_ BitVec 32))

(assert (=> d!61317 (and (bvsge lt!126958 #b00000000000000000000000000000000) (bvsle lt!126958 (bvsub (size!6208 lt!126774) #b00000000000000000000000000000000)))))

(assert (=> d!61317 (= lt!126958 e!164319)))

(declare-fun c!42755 () Bool)

(assert (=> d!61317 (= c!42755 (bvsge #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))))))

(assert (=> d!61317 (and (bvsle #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6208 (_keys!6828 thiss!1504)) (size!6208 lt!126774)))))

(assert (=> d!61317 (= (arrayCountValidKeys!0 lt!126774 #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))) lt!126958)))

(declare-fun b!253473 () Bool)

(assert (=> b!253473 (= e!164319 #b00000000000000000000000000000000)))

(declare-fun bm!23913 () Bool)

(declare-fun call!23916 () (_ BitVec 32))

(assert (=> bm!23913 (= call!23916 (arrayCountValidKeys!0 lt!126774 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6208 (_keys!6828 thiss!1504))))))

(declare-fun b!253474 () Bool)

(assert (=> b!253474 (= e!164320 call!23916)))

(declare-fun b!253475 () Bool)

(assert (=> b!253475 (= e!164320 (bvadd #b00000000000000000000000000000001 call!23916))))

(assert (= (and d!61317 c!42755) b!253473))

(assert (= (and d!61317 (not c!42755)) b!253472))

(assert (= (and b!253472 c!42754) b!253475))

(assert (= (and b!253472 (not c!42754)) b!253474))

(assert (= (or b!253475 b!253474) bm!23913))

(assert (=> b!253472 m!268801))

(assert (=> b!253472 m!268801))

(assert (=> b!253472 m!268803))

(declare-fun m!268825 () Bool)

(assert (=> bm!23913 m!268825))

(assert (=> b!253123 d!61317))

(declare-fun d!61319 () Bool)

(declare-fun e!164323 () Bool)

(assert (=> d!61319 e!164323))

(declare-fun res!124048 () Bool)

(assert (=> d!61319 (=> (not res!124048) (not e!164323))))

(assert (=> d!61319 (= res!124048 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6208 (_keys!6828 thiss!1504)))))))

(declare-fun lt!126961 () Unit!7813)

(declare-fun choose!41 (array!12369 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3728) Unit!7813)

(assert (=> d!61319 (= lt!126961 (choose!41 (_keys!6828 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3725))))

(assert (=> d!61319 (bvslt (size!6208 (_keys!6828 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61319 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6828 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3725) lt!126961)))

(declare-fun b!253478 () Bool)

(assert (=> b!253478 (= e!164323 (arrayNoDuplicates!0 (array!12370 (store (arr!5860 (_keys!6828 thiss!1504)) index!297 key!932) (size!6208 (_keys!6828 thiss!1504))) #b00000000000000000000000000000000 Nil!3725))))

(assert (= (and d!61319 res!124048) b!253478))

(declare-fun m!268827 () Bool)

(assert (=> d!61319 m!268827))

(assert (=> b!253478 m!268543))

(declare-fun m!268829 () Bool)

(assert (=> b!253478 m!268829))

(assert (=> b!253123 d!61319))

(assert (=> b!253123 d!61289))

(declare-fun d!61321 () Bool)

(declare-fun e!164326 () Bool)

(assert (=> d!61321 e!164326))

(declare-fun res!124051 () Bool)

(assert (=> d!61321 (=> (not res!124051) (not e!164326))))

(assert (=> d!61321 (= res!124051 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6208 (_keys!6828 thiss!1504)))))))

(declare-fun lt!126964 () Unit!7813)

(declare-fun choose!102 ((_ BitVec 64) array!12369 (_ BitVec 32) (_ BitVec 32)) Unit!7813)

(assert (=> d!61321 (= lt!126964 (choose!102 key!932 (_keys!6828 thiss!1504) index!297 (mask!10909 thiss!1504)))))

(assert (=> d!61321 (validMask!0 (mask!10909 thiss!1504))))

(assert (=> d!61321 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6828 thiss!1504) index!297 (mask!10909 thiss!1504)) lt!126964)))

(declare-fun b!253481 () Bool)

(assert (=> b!253481 (= e!164326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12370 (store (arr!5860 (_keys!6828 thiss!1504)) index!297 key!932) (size!6208 (_keys!6828 thiss!1504))) (mask!10909 thiss!1504)))))

(assert (= (and d!61321 res!124051) b!253481))

(declare-fun m!268831 () Bool)

(assert (=> d!61321 m!268831))

(assert (=> d!61321 m!268531))

(assert (=> b!253481 m!268543))

(declare-fun m!268833 () Bool)

(assert (=> b!253481 m!268833))

(assert (=> b!253123 d!61321))

(declare-fun d!61323 () Bool)

(declare-fun res!124054 () Bool)

(declare-fun e!164330 () Bool)

(assert (=> d!61323 (=> res!124054 e!164330)))

(assert (=> d!61323 (= res!124054 (bvsge #b00000000000000000000000000000000 (size!6208 (_keys!6828 thiss!1504))))))

(assert (=> d!61323 (= (arrayNoDuplicates!0 (_keys!6828 thiss!1504) #b00000000000000000000000000000000 Nil!3725) e!164330)))

(declare-fun b!253482 () Bool)

(declare-fun e!164329 () Bool)

(declare-fun call!23917 () Bool)

(assert (=> b!253482 (= e!164329 call!23917)))

(declare-fun b!253483 () Bool)

(declare-fun e!164328 () Bool)

(assert (=> b!253483 (= e!164330 e!164328)))

(declare-fun res!124053 () Bool)

(assert (=> b!253483 (=> (not res!124053) (not e!164328))))

(declare-fun e!164327 () Bool)

(assert (=> b!253483 (= res!124053 (not e!164327))))

(declare-fun res!124052 () Bool)

(assert (=> b!253483 (=> (not res!124052) (not e!164327))))

(assert (=> b!253483 (= res!124052 (validKeyInArray!0 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23914 () Bool)

(declare-fun c!42756 () Bool)

(assert (=> bm!23914 (= call!23917 (arrayNoDuplicates!0 (_keys!6828 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42756 (Cons!3724 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000) Nil!3725) Nil!3725)))))

(declare-fun b!253484 () Bool)

(assert (=> b!253484 (= e!164329 call!23917)))

(declare-fun b!253485 () Bool)

(assert (=> b!253485 (= e!164328 e!164329)))

(assert (=> b!253485 (= c!42756 (validKeyInArray!0 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253486 () Bool)

(assert (=> b!253486 (= e!164327 (contains!1816 Nil!3725 (select (arr!5860 (_keys!6828 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61323 (not res!124054)) b!253483))

(assert (= (and b!253483 res!124052) b!253486))

(assert (= (and b!253483 res!124053) b!253485))

(assert (= (and b!253485 c!42756) b!253482))

(assert (= (and b!253485 (not c!42756)) b!253484))

(assert (= (or b!253482 b!253484) bm!23914))

(assert (=> b!253483 m!268717))

(assert (=> b!253483 m!268717))

(assert (=> b!253483 m!268723))

(assert (=> bm!23914 m!268717))

(declare-fun m!268835 () Bool)

(assert (=> bm!23914 m!268835))

(assert (=> b!253485 m!268717))

(assert (=> b!253485 m!268717))

(assert (=> b!253485 m!268723))

(assert (=> b!253486 m!268717))

(assert (=> b!253486 m!268717))

(declare-fun m!268837 () Bool)

(assert (=> b!253486 m!268837))

(assert (=> b!253113 d!61323))

(declare-fun d!61325 () Bool)

(assert (=> d!61325 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!253114 d!61325))

(declare-fun b!253493 () Bool)

(declare-fun e!164335 () Bool)

(assert (=> b!253493 (= e!164335 tp_is_empty!6523)))

(declare-fun condMapEmpty!11106 () Bool)

(declare-fun mapDefault!11106 () ValueCell!2918)

(assert (=> mapNonEmpty!11097 (= condMapEmpty!11106 (= mapRest!11097 ((as const (Array (_ BitVec 32) ValueCell!2918)) mapDefault!11106)))))

(declare-fun e!164336 () Bool)

(declare-fun mapRes!11106 () Bool)

(assert (=> mapNonEmpty!11097 (= tp!23267 (and e!164336 mapRes!11106))))

(declare-fun mapNonEmpty!11106 () Bool)

(declare-fun tp!23283 () Bool)

(assert (=> mapNonEmpty!11106 (= mapRes!11106 (and tp!23283 e!164335))))

(declare-fun mapRest!11106 () (Array (_ BitVec 32) ValueCell!2918))

(declare-fun mapValue!11106 () ValueCell!2918)

(declare-fun mapKey!11106 () (_ BitVec 32))

(assert (=> mapNonEmpty!11106 (= mapRest!11097 (store mapRest!11106 mapKey!11106 mapValue!11106))))

(declare-fun b!253494 () Bool)

(assert (=> b!253494 (= e!164336 tp_is_empty!6523)))

(declare-fun mapIsEmpty!11106 () Bool)

(assert (=> mapIsEmpty!11106 mapRes!11106))

(assert (= (and mapNonEmpty!11097 condMapEmpty!11106) mapIsEmpty!11106))

(assert (= (and mapNonEmpty!11097 (not condMapEmpty!11106)) mapNonEmpty!11106))

(assert (= (and mapNonEmpty!11106 ((_ is ValueCellFull!2918) mapValue!11106)) b!253493))

(assert (= (and mapNonEmpty!11097 ((_ is ValueCellFull!2918) mapDefault!11106)) b!253494))

(declare-fun m!268839 () Bool)

(assert (=> mapNonEmpty!11106 m!268839))

(declare-fun b_lambda!8111 () Bool)

(assert (= b_lambda!8109 (or (and b!253108 b_free!6661) b_lambda!8111)))

(check-sat (not bm!23912) (not b!253431) (not b_lambda!8111) (not b!253441) (not b!253414) (not bm!23913) (not b!253444) (not bm!23899) (not b!253419) (not b_next!6661) (not d!61321) (not b!253442) (not d!61287) (not b!253478) (not d!61285) (not b!253336) (not d!61283) (not b!253430) (not b!253425) (not bm!23901) (not b!253329) (not b!253417) (not bm!23909) tp_is_empty!6523 (not b!253420) (not bm!23906) (not b!253416) (not b!253312) b_and!13681 (not b!253468) (not b!253485) (not d!61319) (not bm!23880) (not d!61281) (not bm!23884) (not b!253426) (not mapNonEmpty!11106) (not bm!23914) (not b!253347) (not b!253472) (not b!253346) (not bm!23902) (not b!253486) (not b!253459) (not b!253483) (not b!253310) (not bm!23903) (not b!253481) (not b!253456) (not d!61293) (not b!253311) (not bm!23881) (not b!253458) (not d!61299) (not d!61309) (not b!253361) (not b!253353) (not d!61297) (not b!253421) (not b!253363))
(check-sat b_and!13681 (not b_next!6661))
