; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25020 () Bool)

(assert start!25020)

(declare-fun b!260867 () Bool)

(declare-fun b_free!6765 () Bool)

(declare-fun b_next!6765 () Bool)

(assert (=> b!260867 (= b_free!6765 (not b_next!6765))))

(declare-fun tp!23621 () Bool)

(declare-fun b_and!13885 () Bool)

(assert (=> b!260867 (= tp!23621 b_and!13885)))

(declare-fun b!260864 () Bool)

(declare-fun res!127486 () Bool)

(declare-datatypes ((V!8483 0))(
  ( (V!8484 (val!3358 Int)) )
))
(declare-datatypes ((ValueCell!2970 0))(
  ( (ValueCellFull!2970 (v!5477 V!8483)) (EmptyCell!2970) )
))
(declare-datatypes ((array!12609 0))(
  ( (array!12610 (arr!5968 (Array (_ BitVec 32) ValueCell!2970)) (size!6318 (_ BitVec 32))) )
))
(declare-datatypes ((array!12611 0))(
  ( (array!12612 (arr!5969 (Array (_ BitVec 32) (_ BitVec 64))) (size!6319 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3840 0))(
  ( (LongMapFixedSize!3841 (defaultEntry!4808 Int) (mask!11145 (_ BitVec 32)) (extraKeys!4545 (_ BitVec 32)) (zeroValue!4649 V!8483) (minValue!4649 V!8483) (_size!1969 (_ BitVec 32)) (_keys!6992 array!12611) (_values!4791 array!12609) (_vacant!1969 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3840)

(declare-datatypes ((SeekEntryResult!1185 0))(
  ( (MissingZero!1185 (index!6910 (_ BitVec 32))) (Found!1185 (index!6911 (_ BitVec 32))) (Intermediate!1185 (undefined!1997 Bool) (index!6912 (_ BitVec 32)) (x!25149 (_ BitVec 32))) (Undefined!1185) (MissingVacant!1185 (index!6913 (_ BitVec 32))) )
))
(declare-fun lt!131626 () SeekEntryResult!1185)

(assert (=> b!260864 (= res!127486 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6913 lt!131626)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169053 () Bool)

(assert (=> b!260864 (=> (not res!127486) (not e!169053))))

(declare-fun b!260865 () Bool)

(declare-datatypes ((Unit!8108 0))(
  ( (Unit!8109) )
))
(declare-fun e!169059 () Unit!8108)

(declare-fun Unit!8110 () Unit!8108)

(assert (=> b!260865 (= e!169059 Unit!8110)))

(declare-fun lt!131637 () Unit!8108)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!443 (array!12611 array!12609 (_ BitVec 32) (_ BitVec 32) V!8483 V!8483 (_ BitVec 64) Int) Unit!8108)

(assert (=> b!260865 (= lt!131637 (lemmaInListMapThenSeekEntryOrOpenFindsIt!443 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 (defaultEntry!4808 thiss!1504)))))

(assert (=> b!260865 false))

(declare-fun b!260866 () Bool)

(declare-fun res!127485 () Bool)

(declare-fun e!169052 () Bool)

(assert (=> b!260866 (=> (not res!127485) (not e!169052))))

(assert (=> b!260866 (= res!127485 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!6627 () Bool)

(declare-fun e!169058 () Bool)

(declare-fun e!169057 () Bool)

(declare-fun array_inv!3941 (array!12611) Bool)

(declare-fun array_inv!3942 (array!12609) Bool)

(assert (=> b!260867 (= e!169058 (and tp!23621 tp_is_empty!6627 (array_inv!3941 (_keys!6992 thiss!1504)) (array_inv!3942 (_values!4791 thiss!1504)) e!169057))))

(declare-fun b!260869 () Bool)

(declare-fun e!169064 () Bool)

(assert (=> b!260869 (= e!169064 (or (not (= (size!6318 (_values!4791 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!11145 thiss!1504)))) (not (= (size!6319 (_keys!6992 thiss!1504)) (size!6318 (_values!4791 thiss!1504)))) (bvslt (mask!11145 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4545 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4545 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11295 () Bool)

(declare-fun mapRes!11295 () Bool)

(assert (=> mapIsEmpty!11295 mapRes!11295))

(declare-fun b!260870 () Bool)

(declare-fun e!169061 () Unit!8108)

(declare-fun Unit!8111 () Unit!8108)

(assert (=> b!260870 (= e!169061 Unit!8111)))

(declare-fun mapNonEmpty!11295 () Bool)

(declare-fun tp!23622 () Bool)

(declare-fun e!169050 () Bool)

(assert (=> mapNonEmpty!11295 (= mapRes!11295 (and tp!23622 e!169050))))

(declare-fun mapRest!11295 () (Array (_ BitVec 32) ValueCell!2970))

(declare-fun mapValue!11295 () ValueCell!2970)

(declare-fun mapKey!11295 () (_ BitVec 32))

(assert (=> mapNonEmpty!11295 (= (arr!5968 (_values!4791 thiss!1504)) (store mapRest!11295 mapKey!11295 mapValue!11295))))

(declare-fun b!260871 () Bool)

(declare-fun e!169062 () Bool)

(declare-fun call!24886 () Bool)

(assert (=> b!260871 (= e!169062 (not call!24886))))

(declare-fun b!260872 () Bool)

(declare-fun e!169051 () Bool)

(assert (=> b!260872 (= e!169057 (and e!169051 mapRes!11295))))

(declare-fun condMapEmpty!11295 () Bool)

(declare-fun mapDefault!11295 () ValueCell!2970)

(assert (=> b!260872 (= condMapEmpty!11295 (= (arr!5968 (_values!4791 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2970)) mapDefault!11295)))))

(declare-fun b!260873 () Bool)

(declare-fun e!169054 () Bool)

(declare-fun e!169055 () Bool)

(assert (=> b!260873 (= e!169054 e!169055)))

(declare-fun res!127481 () Bool)

(assert (=> b!260873 (=> (not res!127481) (not e!169055))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260873 (= res!127481 (inRange!0 index!297 (mask!11145 thiss!1504)))))

(declare-fun lt!131630 () Unit!8108)

(assert (=> b!260873 (= lt!131630 e!169059)))

(declare-fun c!44366 () Bool)

(declare-datatypes ((tuple2!4952 0))(
  ( (tuple2!4953 (_1!2487 (_ BitVec 64)) (_2!2487 V!8483)) )
))
(declare-datatypes ((List!3830 0))(
  ( (Nil!3827) (Cons!3826 (h!4491 tuple2!4952) (t!8901 List!3830)) )
))
(declare-datatypes ((ListLongMap!3865 0))(
  ( (ListLongMap!3866 (toList!1948 List!3830)) )
))
(declare-fun lt!131634 () ListLongMap!3865)

(declare-fun contains!1894 (ListLongMap!3865 (_ BitVec 64)) Bool)

(assert (=> b!260873 (= c!44366 (contains!1894 lt!131634 key!932))))

(declare-fun getCurrentListMap!1476 (array!12611 array!12609 (_ BitVec 32) (_ BitVec 32) V!8483 V!8483 (_ BitVec 32) Int) ListLongMap!3865)

(assert (=> b!260873 (= lt!131634 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun b!260874 () Bool)

(declare-fun c!44367 () Bool)

(get-info :version)

(assert (=> b!260874 (= c!44367 ((_ is MissingVacant!1185) lt!131626))))

(declare-fun e!169056 () Bool)

(declare-fun e!169063 () Bool)

(assert (=> b!260874 (= e!169056 e!169063)))

(declare-fun b!260875 () Bool)

(declare-fun lt!131629 () Unit!8108)

(assert (=> b!260875 (= e!169059 lt!131629)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!447 (array!12611 array!12609 (_ BitVec 32) (_ BitVec 32) V!8483 V!8483 (_ BitVec 64) Int) Unit!8108)

(assert (=> b!260875 (= lt!131629 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!447 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 (defaultEntry!4808 thiss!1504)))))

(declare-fun c!44368 () Bool)

(assert (=> b!260875 (= c!44368 ((_ is MissingZero!1185) lt!131626))))

(assert (=> b!260875 e!169056))

(declare-fun b!260876 () Bool)

(declare-fun Unit!8112 () Unit!8108)

(assert (=> b!260876 (= e!169061 Unit!8112)))

(declare-fun lt!131635 () Unit!8108)

(declare-fun lemmaArrayContainsKeyThenInListMap!252 (array!12611 array!12609 (_ BitVec 32) (_ BitVec 32) V!8483 V!8483 (_ BitVec 64) (_ BitVec 32) Int) Unit!8108)

(assert (=> b!260876 (= lt!131635 (lemmaArrayContainsKeyThenInListMap!252 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(assert (=> b!260876 false))

(declare-fun b!260877 () Bool)

(assert (=> b!260877 (= e!169050 tp_is_empty!6627)))

(declare-fun b!260878 () Bool)

(assert (=> b!260878 (= e!169063 e!169053)))

(declare-fun res!127483 () Bool)

(declare-fun call!24885 () Bool)

(assert (=> b!260878 (= res!127483 call!24885)))

(assert (=> b!260878 (=> (not res!127483) (not e!169053))))

(declare-fun b!260879 () Bool)

(assert (=> b!260879 (= e!169051 tp_is_empty!6627)))

(declare-fun bm!24882 () Bool)

(declare-fun arrayContainsKey!0 (array!12611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24882 (= call!24886 (arrayContainsKey!0 (_keys!6992 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!260880 () Bool)

(assert (=> b!260880 (= e!169055 (not e!169064))))

(declare-fun res!127489 () Bool)

(assert (=> b!260880 (=> res!127489 e!169064)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!260880 (= res!127489 (not (validMask!0 (mask!11145 thiss!1504))))))

(declare-fun lt!131631 () array!12611)

(declare-fun arrayCountValidKeys!0 (array!12611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!260880 (= (arrayCountValidKeys!0 lt!131631 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!131627 () Unit!8108)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12611 (_ BitVec 32)) Unit!8108)

(assert (=> b!260880 (= lt!131627 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131631 index!297))))

(assert (=> b!260880 (arrayContainsKey!0 lt!131631 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131636 () Unit!8108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12611 (_ BitVec 64) (_ BitVec 32)) Unit!8108)

(assert (=> b!260880 (= lt!131636 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131631 key!932 index!297))))

(declare-fun v!346 () V!8483)

(declare-fun +!701 (ListLongMap!3865 tuple2!4952) ListLongMap!3865)

(assert (=> b!260880 (= (+!701 lt!131634 (tuple2!4953 key!932 v!346)) (getCurrentListMap!1476 lt!131631 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131632 () Unit!8108)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!111 (array!12611 array!12609 (_ BitVec 32) (_ BitVec 32) V!8483 V!8483 (_ BitVec 32) (_ BitVec 64) V!8483 Int) Unit!8108)

(assert (=> b!260880 (= lt!131632 (lemmaAddValidKeyToArrayThenAddPairToListMap!111 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) index!297 key!932 v!346 (defaultEntry!4808 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12611 (_ BitVec 32)) Bool)

(assert (=> b!260880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131631 (mask!11145 thiss!1504))))

(declare-fun lt!131638 () Unit!8108)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12611 (_ BitVec 32) (_ BitVec 32)) Unit!8108)

(assert (=> b!260880 (= lt!131638 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6992 thiss!1504) index!297 (mask!11145 thiss!1504)))))

(assert (=> b!260880 (= (arrayCountValidKeys!0 lt!131631 #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6992 thiss!1504) #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504)))))))

(declare-fun lt!131633 () Unit!8108)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12611 (_ BitVec 32) (_ BitVec 64)) Unit!8108)

(assert (=> b!260880 (= lt!131633 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6992 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3831 0))(
  ( (Nil!3828) (Cons!3827 (h!4492 (_ BitVec 64)) (t!8902 List!3831)) )
))
(declare-fun arrayNoDuplicates!0 (array!12611 (_ BitVec 32) List!3831) Bool)

(assert (=> b!260880 (arrayNoDuplicates!0 lt!131631 #b00000000000000000000000000000000 Nil!3828)))

(assert (=> b!260880 (= lt!131631 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun lt!131628 () Unit!8108)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12611 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3831) Unit!8108)

(assert (=> b!260880 (= lt!131628 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6992 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3828))))

(declare-fun lt!131639 () Unit!8108)

(assert (=> b!260880 (= lt!131639 e!169061)))

(declare-fun c!44369 () Bool)

(assert (=> b!260880 (= c!44369 (arrayContainsKey!0 (_keys!6992 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!24883 () Bool)

(assert (=> bm!24883 (= call!24885 (inRange!0 (ite c!44368 (index!6910 lt!131626) (index!6913 lt!131626)) (mask!11145 thiss!1504)))))

(declare-fun b!260868 () Bool)

(assert (=> b!260868 (= e!169063 ((_ is Undefined!1185) lt!131626))))

(declare-fun res!127482 () Bool)

(assert (=> start!25020 (=> (not res!127482) (not e!169052))))

(declare-fun valid!1498 (LongMapFixedSize!3840) Bool)

(assert (=> start!25020 (= res!127482 (valid!1498 thiss!1504))))

(assert (=> start!25020 e!169052))

(assert (=> start!25020 e!169058))

(assert (=> start!25020 true))

(assert (=> start!25020 tp_is_empty!6627))

(declare-fun b!260881 () Bool)

(declare-fun res!127484 () Bool)

(assert (=> b!260881 (=> (not res!127484) (not e!169062))))

(assert (=> b!260881 (= res!127484 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6910 lt!131626)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!260882 () Bool)

(assert (=> b!260882 (= e!169052 e!169054)))

(declare-fun res!127487 () Bool)

(assert (=> b!260882 (=> (not res!127487) (not e!169054))))

(assert (=> b!260882 (= res!127487 (or (= lt!131626 (MissingZero!1185 index!297)) (= lt!131626 (MissingVacant!1185 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12611 (_ BitVec 32)) SeekEntryResult!1185)

(assert (=> b!260882 (= lt!131626 (seekEntryOrOpen!0 key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(declare-fun b!260883 () Bool)

(declare-fun res!127488 () Bool)

(assert (=> b!260883 (=> (not res!127488) (not e!169062))))

(assert (=> b!260883 (= res!127488 call!24885)))

(assert (=> b!260883 (= e!169056 e!169062)))

(declare-fun b!260884 () Bool)

(assert (=> b!260884 (= e!169053 (not call!24886))))

(assert (= (and start!25020 res!127482) b!260866))

(assert (= (and b!260866 res!127485) b!260882))

(assert (= (and b!260882 res!127487) b!260873))

(assert (= (and b!260873 c!44366) b!260865))

(assert (= (and b!260873 (not c!44366)) b!260875))

(assert (= (and b!260875 c!44368) b!260883))

(assert (= (and b!260875 (not c!44368)) b!260874))

(assert (= (and b!260883 res!127488) b!260881))

(assert (= (and b!260881 res!127484) b!260871))

(assert (= (and b!260874 c!44367) b!260878))

(assert (= (and b!260874 (not c!44367)) b!260868))

(assert (= (and b!260878 res!127483) b!260864))

(assert (= (and b!260864 res!127486) b!260884))

(assert (= (or b!260883 b!260878) bm!24883))

(assert (= (or b!260871 b!260884) bm!24882))

(assert (= (and b!260873 res!127481) b!260880))

(assert (= (and b!260880 c!44369) b!260876))

(assert (= (and b!260880 (not c!44369)) b!260870))

(assert (= (and b!260880 (not res!127489)) b!260869))

(assert (= (and b!260872 condMapEmpty!11295) mapIsEmpty!11295))

(assert (= (and b!260872 (not condMapEmpty!11295)) mapNonEmpty!11295))

(assert (= (and mapNonEmpty!11295 ((_ is ValueCellFull!2970) mapValue!11295)) b!260877))

(assert (= (and b!260872 ((_ is ValueCellFull!2970) mapDefault!11295)) b!260879))

(assert (= b!260867 b!260872))

(assert (= start!25020 b!260867))

(declare-fun m!276747 () Bool)

(assert (=> b!260865 m!276747))

(declare-fun m!276749 () Bool)

(assert (=> b!260875 m!276749))

(declare-fun m!276751 () Bool)

(assert (=> mapNonEmpty!11295 m!276751))

(declare-fun m!276753 () Bool)

(assert (=> b!260882 m!276753))

(declare-fun m!276755 () Bool)

(assert (=> start!25020 m!276755))

(declare-fun m!276757 () Bool)

(assert (=> bm!24882 m!276757))

(declare-fun m!276759 () Bool)

(assert (=> b!260881 m!276759))

(assert (=> b!260880 m!276757))

(declare-fun m!276761 () Bool)

(assert (=> b!260880 m!276761))

(declare-fun m!276763 () Bool)

(assert (=> b!260880 m!276763))

(declare-fun m!276765 () Bool)

(assert (=> b!260880 m!276765))

(declare-fun m!276767 () Bool)

(assert (=> b!260880 m!276767))

(declare-fun m!276769 () Bool)

(assert (=> b!260880 m!276769))

(declare-fun m!276771 () Bool)

(assert (=> b!260880 m!276771))

(declare-fun m!276773 () Bool)

(assert (=> b!260880 m!276773))

(declare-fun m!276775 () Bool)

(assert (=> b!260880 m!276775))

(declare-fun m!276777 () Bool)

(assert (=> b!260880 m!276777))

(declare-fun m!276779 () Bool)

(assert (=> b!260880 m!276779))

(declare-fun m!276781 () Bool)

(assert (=> b!260880 m!276781))

(declare-fun m!276783 () Bool)

(assert (=> b!260880 m!276783))

(declare-fun m!276785 () Bool)

(assert (=> b!260880 m!276785))

(declare-fun m!276787 () Bool)

(assert (=> b!260880 m!276787))

(declare-fun m!276789 () Bool)

(assert (=> b!260880 m!276789))

(declare-fun m!276791 () Bool)

(assert (=> b!260880 m!276791))

(declare-fun m!276793 () Bool)

(assert (=> b!260880 m!276793))

(declare-fun m!276795 () Bool)

(assert (=> bm!24883 m!276795))

(declare-fun m!276797 () Bool)

(assert (=> b!260876 m!276797))

(declare-fun m!276799 () Bool)

(assert (=> b!260873 m!276799))

(declare-fun m!276801 () Bool)

(assert (=> b!260873 m!276801))

(declare-fun m!276803 () Bool)

(assert (=> b!260873 m!276803))

(declare-fun m!276805 () Bool)

(assert (=> b!260864 m!276805))

(declare-fun m!276807 () Bool)

(assert (=> b!260867 m!276807))

(declare-fun m!276809 () Bool)

(assert (=> b!260867 m!276809))

(check-sat (not bm!24883) tp_is_empty!6627 (not b!260865) (not b!260873) (not b!260875) (not b!260882) (not start!25020) b_and!13885 (not b!260867) (not b_next!6765) (not mapNonEmpty!11295) (not b!260880) (not b!260876) (not bm!24882))
(check-sat b_and!13885 (not b_next!6765))
(get-model)

(declare-fun d!62703 () Bool)

(assert (=> d!62703 (= (inRange!0 (ite c!44368 (index!6910 lt!131626) (index!6913 lt!131626)) (mask!11145 thiss!1504)) (and (bvsge (ite c!44368 (index!6910 lt!131626) (index!6913 lt!131626)) #b00000000000000000000000000000000) (bvslt (ite c!44368 (index!6910 lt!131626) (index!6913 lt!131626)) (bvadd (mask!11145 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24883 d!62703))

(declare-fun d!62705 () Bool)

(declare-fun res!127523 () Bool)

(declare-fun e!169112 () Bool)

(assert (=> d!62705 (=> (not res!127523) (not e!169112))))

(declare-fun simpleValid!282 (LongMapFixedSize!3840) Bool)

(assert (=> d!62705 (= res!127523 (simpleValid!282 thiss!1504))))

(assert (=> d!62705 (= (valid!1498 thiss!1504) e!169112)))

(declare-fun b!260954 () Bool)

(declare-fun res!127524 () Bool)

(assert (=> b!260954 (=> (not res!127524) (not e!169112))))

(assert (=> b!260954 (= res!127524 (= (arrayCountValidKeys!0 (_keys!6992 thiss!1504) #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) (_size!1969 thiss!1504)))))

(declare-fun b!260955 () Bool)

(declare-fun res!127525 () Bool)

(assert (=> b!260955 (=> (not res!127525) (not e!169112))))

(assert (=> b!260955 (= res!127525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(declare-fun b!260956 () Bool)

(assert (=> b!260956 (= e!169112 (arrayNoDuplicates!0 (_keys!6992 thiss!1504) #b00000000000000000000000000000000 Nil!3828))))

(assert (= (and d!62705 res!127523) b!260954))

(assert (= (and b!260954 res!127524) b!260955))

(assert (= (and b!260955 res!127525) b!260956))

(declare-fun m!276875 () Bool)

(assert (=> d!62705 m!276875))

(assert (=> b!260954 m!276777))

(declare-fun m!276877 () Bool)

(assert (=> b!260955 m!276877))

(declare-fun m!276879 () Bool)

(assert (=> b!260956 m!276879))

(assert (=> start!25020 d!62705))

(declare-fun d!62707 () Bool)

(declare-fun lt!131684 () (_ BitVec 32))

(assert (=> d!62707 (and (bvsge lt!131684 #b00000000000000000000000000000000) (bvsle lt!131684 (bvsub (size!6319 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun e!169118 () (_ BitVec 32))

(assert (=> d!62707 (= lt!131684 e!169118)))

(declare-fun c!44386 () Bool)

(assert (=> d!62707 (= c!44386 (bvsge #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> d!62707 (and (bvsle #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6319 (_keys!6992 thiss!1504)) (size!6319 lt!131631)))))

(assert (=> d!62707 (= (arrayCountValidKeys!0 lt!131631 #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) lt!131684)))

(declare-fun bm!24892 () Bool)

(declare-fun call!24895 () (_ BitVec 32))

(assert (=> bm!24892 (= call!24895 (arrayCountValidKeys!0 lt!131631 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!260965 () Bool)

(declare-fun e!169117 () (_ BitVec 32))

(assert (=> b!260965 (= e!169117 (bvadd #b00000000000000000000000000000001 call!24895))))

(declare-fun b!260966 () Bool)

(assert (=> b!260966 (= e!169118 #b00000000000000000000000000000000)))

(declare-fun b!260967 () Bool)

(assert (=> b!260967 (= e!169117 call!24895)))

(declare-fun b!260968 () Bool)

(assert (=> b!260968 (= e!169118 e!169117)))

(declare-fun c!44387 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!260968 (= c!44387 (validKeyInArray!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(assert (= (and d!62707 c!44386) b!260966))

(assert (= (and d!62707 (not c!44386)) b!260968))

(assert (= (and b!260968 c!44387) b!260965))

(assert (= (and b!260968 (not c!44387)) b!260967))

(assert (= (or b!260965 b!260967) bm!24892))

(declare-fun m!276881 () Bool)

(assert (=> bm!24892 m!276881))

(declare-fun m!276883 () Bool)

(assert (=> b!260968 m!276883))

(assert (=> b!260968 m!276883))

(declare-fun m!276885 () Bool)

(assert (=> b!260968 m!276885))

(assert (=> b!260880 d!62707))

(declare-fun d!62709 () Bool)

(declare-fun res!127530 () Bool)

(declare-fun e!169123 () Bool)

(assert (=> d!62709 (=> res!127530 e!169123)))

(assert (=> d!62709 (= res!127530 (= (select (arr!5969 lt!131631) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62709 (= (arrayContainsKey!0 lt!131631 key!932 #b00000000000000000000000000000000) e!169123)))

(declare-fun b!260973 () Bool)

(declare-fun e!169124 () Bool)

(assert (=> b!260973 (= e!169123 e!169124)))

(declare-fun res!127531 () Bool)

(assert (=> b!260973 (=> (not res!127531) (not e!169124))))

(assert (=> b!260973 (= res!127531 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 lt!131631)))))

(declare-fun b!260974 () Bool)

(assert (=> b!260974 (= e!169124 (arrayContainsKey!0 lt!131631 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62709 (not res!127530)) b!260973))

(assert (= (and b!260973 res!127531) b!260974))

(assert (=> d!62709 m!276883))

(declare-fun m!276887 () Bool)

(assert (=> b!260974 m!276887))

(assert (=> b!260880 d!62709))

(declare-fun d!62711 () Bool)

(assert (=> d!62711 (arrayContainsKey!0 lt!131631 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!131687 () Unit!8108)

(declare-fun choose!13 (array!12611 (_ BitVec 64) (_ BitVec 32)) Unit!8108)

(assert (=> d!62711 (= lt!131687 (choose!13 lt!131631 key!932 index!297))))

(assert (=> d!62711 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!62711 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131631 key!932 index!297) lt!131687)))

(declare-fun bs!9197 () Bool)

(assert (= bs!9197 d!62711))

(assert (=> bs!9197 m!276773))

(declare-fun m!276889 () Bool)

(assert (=> bs!9197 m!276889))

(assert (=> b!260880 d!62711))

(declare-fun d!62713 () Bool)

(declare-fun lt!131688 () (_ BitVec 32))

(assert (=> d!62713 (and (bvsge lt!131688 #b00000000000000000000000000000000) (bvsle lt!131688 (bvsub (size!6319 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!169126 () (_ BitVec 32))

(assert (=> d!62713 (= lt!131688 e!169126)))

(declare-fun c!44388 () Bool)

(assert (=> d!62713 (= c!44388 (bvsge #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> d!62713 (and (bvsle #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6319 (_keys!6992 thiss!1504)) (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> d!62713 (= (arrayCountValidKeys!0 (_keys!6992 thiss!1504) #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) lt!131688)))

(declare-fun bm!24893 () Bool)

(declare-fun call!24896 () (_ BitVec 32))

(assert (=> bm!24893 (= call!24896 (arrayCountValidKeys!0 (_keys!6992 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!260975 () Bool)

(declare-fun e!169125 () (_ BitVec 32))

(assert (=> b!260975 (= e!169125 (bvadd #b00000000000000000000000000000001 call!24896))))

(declare-fun b!260976 () Bool)

(assert (=> b!260976 (= e!169126 #b00000000000000000000000000000000)))

(declare-fun b!260977 () Bool)

(assert (=> b!260977 (= e!169125 call!24896)))

(declare-fun b!260978 () Bool)

(assert (=> b!260978 (= e!169126 e!169125)))

(declare-fun c!44389 () Bool)

(assert (=> b!260978 (= c!44389 (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!62713 c!44388) b!260976))

(assert (= (and d!62713 (not c!44388)) b!260978))

(assert (= (and b!260978 c!44389) b!260975))

(assert (= (and b!260978 (not c!44389)) b!260977))

(assert (= (or b!260975 b!260977) bm!24893))

(declare-fun m!276891 () Bool)

(assert (=> bm!24893 m!276891))

(declare-fun m!276893 () Bool)

(assert (=> b!260978 m!276893))

(assert (=> b!260978 m!276893))

(declare-fun m!276895 () Bool)

(assert (=> b!260978 m!276895))

(assert (=> b!260880 d!62713))

(declare-fun d!62715 () Bool)

(assert (=> d!62715 (= (validMask!0 (mask!11145 thiss!1504)) (and (or (= (mask!11145 thiss!1504) #b00000000000000000000000000000111) (= (mask!11145 thiss!1504) #b00000000000000000000000000001111) (= (mask!11145 thiss!1504) #b00000000000000000000000000011111) (= (mask!11145 thiss!1504) #b00000000000000000000000000111111) (= (mask!11145 thiss!1504) #b00000000000000000000000001111111) (= (mask!11145 thiss!1504) #b00000000000000000000000011111111) (= (mask!11145 thiss!1504) #b00000000000000000000000111111111) (= (mask!11145 thiss!1504) #b00000000000000000000001111111111) (= (mask!11145 thiss!1504) #b00000000000000000000011111111111) (= (mask!11145 thiss!1504) #b00000000000000000000111111111111) (= (mask!11145 thiss!1504) #b00000000000000000001111111111111) (= (mask!11145 thiss!1504) #b00000000000000000011111111111111) (= (mask!11145 thiss!1504) #b00000000000000000111111111111111) (= (mask!11145 thiss!1504) #b00000000000000001111111111111111) (= (mask!11145 thiss!1504) #b00000000000000011111111111111111) (= (mask!11145 thiss!1504) #b00000000000000111111111111111111) (= (mask!11145 thiss!1504) #b00000000000001111111111111111111) (= (mask!11145 thiss!1504) #b00000000000011111111111111111111) (= (mask!11145 thiss!1504) #b00000000000111111111111111111111) (= (mask!11145 thiss!1504) #b00000000001111111111111111111111) (= (mask!11145 thiss!1504) #b00000000011111111111111111111111) (= (mask!11145 thiss!1504) #b00000000111111111111111111111111) (= (mask!11145 thiss!1504) #b00000001111111111111111111111111) (= (mask!11145 thiss!1504) #b00000011111111111111111111111111) (= (mask!11145 thiss!1504) #b00000111111111111111111111111111) (= (mask!11145 thiss!1504) #b00001111111111111111111111111111) (= (mask!11145 thiss!1504) #b00011111111111111111111111111111) (= (mask!11145 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11145 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!260880 d!62715))

(declare-fun b!260987 () Bool)

(declare-fun e!169133 () Bool)

(declare-fun call!24899 () Bool)

(assert (=> b!260987 (= e!169133 call!24899)))

(declare-fun bm!24896 () Bool)

(assert (=> bm!24896 (= call!24899 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!131631 (mask!11145 thiss!1504)))))

(declare-fun b!260988 () Bool)

(declare-fun e!169135 () Bool)

(declare-fun e!169134 () Bool)

(assert (=> b!260988 (= e!169135 e!169134)))

(declare-fun c!44392 () Bool)

(assert (=> b!260988 (= c!44392 (validKeyInArray!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun d!62717 () Bool)

(declare-fun res!127537 () Bool)

(assert (=> d!62717 (=> res!127537 e!169135)))

(assert (=> d!62717 (= res!127537 (bvsge #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(assert (=> d!62717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!131631 (mask!11145 thiss!1504)) e!169135)))

(declare-fun b!260989 () Bool)

(assert (=> b!260989 (= e!169134 call!24899)))

(declare-fun b!260990 () Bool)

(assert (=> b!260990 (= e!169134 e!169133)))

(declare-fun lt!131696 () (_ BitVec 64))

(assert (=> b!260990 (= lt!131696 (select (arr!5969 lt!131631) #b00000000000000000000000000000000))))

(declare-fun lt!131695 () Unit!8108)

(assert (=> b!260990 (= lt!131695 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131631 lt!131696 #b00000000000000000000000000000000))))

(assert (=> b!260990 (arrayContainsKey!0 lt!131631 lt!131696 #b00000000000000000000000000000000)))

(declare-fun lt!131697 () Unit!8108)

(assert (=> b!260990 (= lt!131697 lt!131695)))

(declare-fun res!127536 () Bool)

(assert (=> b!260990 (= res!127536 (= (seekEntryOrOpen!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000) lt!131631 (mask!11145 thiss!1504)) (Found!1185 #b00000000000000000000000000000000)))))

(assert (=> b!260990 (=> (not res!127536) (not e!169133))))

(assert (= (and d!62717 (not res!127537)) b!260988))

(assert (= (and b!260988 c!44392) b!260990))

(assert (= (and b!260988 (not c!44392)) b!260989))

(assert (= (and b!260990 res!127536) b!260987))

(assert (= (or b!260987 b!260989) bm!24896))

(declare-fun m!276897 () Bool)

(assert (=> bm!24896 m!276897))

(assert (=> b!260988 m!276883))

(assert (=> b!260988 m!276883))

(assert (=> b!260988 m!276885))

(assert (=> b!260990 m!276883))

(declare-fun m!276899 () Bool)

(assert (=> b!260990 m!276899))

(declare-fun m!276901 () Bool)

(assert (=> b!260990 m!276901))

(assert (=> b!260990 m!276883))

(declare-fun m!276903 () Bool)

(assert (=> b!260990 m!276903))

(assert (=> b!260880 d!62717))

(declare-fun d!62719 () Bool)

(declare-fun e!169138 () Bool)

(assert (=> d!62719 e!169138))

(declare-fun res!127540 () Bool)

(assert (=> d!62719 (=> (not res!127540) (not e!169138))))

(assert (=> d!62719 (= res!127540 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6319 (_keys!6992 thiss!1504)))))))

(declare-fun lt!131700 () Unit!8108)

(declare-fun choose!41 (array!12611 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3831) Unit!8108)

(assert (=> d!62719 (= lt!131700 (choose!41 (_keys!6992 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3828))))

(assert (=> d!62719 (bvslt (size!6319 (_keys!6992 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!62719 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6992 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3828) lt!131700)))

(declare-fun b!260993 () Bool)

(assert (=> b!260993 (= e!169138 (arrayNoDuplicates!0 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) #b00000000000000000000000000000000 Nil!3828))))

(assert (= (and d!62719 res!127540) b!260993))

(declare-fun m!276905 () Bool)

(assert (=> d!62719 m!276905))

(assert (=> b!260993 m!276775))

(declare-fun m!276907 () Bool)

(assert (=> b!260993 m!276907))

(assert (=> b!260880 d!62719))

(declare-fun b!261003 () Bool)

(declare-fun res!127552 () Bool)

(declare-fun e!169143 () Bool)

(assert (=> b!261003 (=> (not res!127552) (not e!169143))))

(assert (=> b!261003 (= res!127552 (validKeyInArray!0 key!932))))

(declare-fun b!261002 () Bool)

(declare-fun res!127549 () Bool)

(assert (=> b!261002 (=> (not res!127549) (not e!169143))))

(assert (=> b!261002 (= res!127549 (not (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) index!297))))))

(declare-fun b!261005 () Bool)

(declare-fun e!169144 () Bool)

(assert (=> b!261005 (= e!169144 (= (arrayCountValidKeys!0 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6992 thiss!1504) #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!261004 () Bool)

(assert (=> b!261004 (= e!169143 (bvslt (size!6319 (_keys!6992 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!62721 () Bool)

(assert (=> d!62721 e!169144))

(declare-fun res!127551 () Bool)

(assert (=> d!62721 (=> (not res!127551) (not e!169144))))

(assert (=> d!62721 (= res!127551 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6319 (_keys!6992 thiss!1504)))))))

(declare-fun lt!131703 () Unit!8108)

(declare-fun choose!1 (array!12611 (_ BitVec 32) (_ BitVec 64)) Unit!8108)

(assert (=> d!62721 (= lt!131703 (choose!1 (_keys!6992 thiss!1504) index!297 key!932))))

(assert (=> d!62721 e!169143))

(declare-fun res!127550 () Bool)

(assert (=> d!62721 (=> (not res!127550) (not e!169143))))

(assert (=> d!62721 (= res!127550 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6319 (_keys!6992 thiss!1504)))))))

(assert (=> d!62721 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6992 thiss!1504) index!297 key!932) lt!131703)))

(assert (= (and d!62721 res!127550) b!261002))

(assert (= (and b!261002 res!127549) b!261003))

(assert (= (and b!261003 res!127552) b!261004))

(assert (= (and d!62721 res!127551) b!261005))

(declare-fun m!276909 () Bool)

(assert (=> b!261003 m!276909))

(declare-fun m!276911 () Bool)

(assert (=> b!261002 m!276911))

(assert (=> b!261002 m!276911))

(declare-fun m!276913 () Bool)

(assert (=> b!261002 m!276913))

(assert (=> b!261005 m!276775))

(declare-fun m!276915 () Bool)

(assert (=> b!261005 m!276915))

(assert (=> b!261005 m!276777))

(declare-fun m!276917 () Bool)

(assert (=> d!62721 m!276917))

(assert (=> b!260880 d!62721))

(declare-fun bm!24911 () Bool)

(declare-fun call!24918 () ListLongMap!3865)

(declare-fun call!24920 () ListLongMap!3865)

(assert (=> bm!24911 (= call!24918 call!24920)))

(declare-fun d!62723 () Bool)

(declare-fun e!169172 () Bool)

(assert (=> d!62723 e!169172))

(declare-fun res!127572 () Bool)

(assert (=> d!62723 (=> (not res!127572) (not e!169172))))

(assert (=> d!62723 (= res!127572 (or (bvsge #b00000000000000000000000000000000 (size!6319 lt!131631)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 lt!131631)))))))

(declare-fun lt!131769 () ListLongMap!3865)

(declare-fun lt!131760 () ListLongMap!3865)

(assert (=> d!62723 (= lt!131769 lt!131760)))

(declare-fun lt!131752 () Unit!8108)

(declare-fun e!169176 () Unit!8108)

(assert (=> d!62723 (= lt!131752 e!169176)))

(declare-fun c!44406 () Bool)

(declare-fun e!169182 () Bool)

(assert (=> d!62723 (= c!44406 e!169182)))

(declare-fun res!127573 () Bool)

(assert (=> d!62723 (=> (not res!127573) (not e!169182))))

(assert (=> d!62723 (= res!127573 (bvslt #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(declare-fun e!169177 () ListLongMap!3865)

(assert (=> d!62723 (= lt!131760 e!169177)))

(declare-fun c!44409 () Bool)

(assert (=> d!62723 (= c!44409 (and (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62723 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62723 (= (getCurrentListMap!1476 lt!131631 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) lt!131769)))

(declare-fun call!24914 () ListLongMap!3865)

(declare-fun c!44407 () Bool)

(declare-fun call!24917 () ListLongMap!3865)

(declare-fun bm!24912 () Bool)

(assert (=> bm!24912 (= call!24914 (+!701 (ite c!44409 call!24920 (ite c!44407 call!24918 call!24917)) (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(declare-fun b!261048 () Bool)

(declare-fun e!169180 () ListLongMap!3865)

(assert (=> b!261048 (= e!169177 e!169180)))

(assert (=> b!261048 (= c!44407 (and (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261049 () Bool)

(declare-fun call!24916 () ListLongMap!3865)

(assert (=> b!261049 (= e!169180 call!24916)))

(declare-fun bm!24913 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!581 (array!12611 array!12609 (_ BitVec 32) (_ BitVec 32) V!8483 V!8483 (_ BitVec 32) Int) ListLongMap!3865)

(assert (=> bm!24913 (= call!24920 (getCurrentListMapNoExtraKeys!581 lt!131631 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun b!261050 () Bool)

(assert (=> b!261050 (= e!169182 (validKeyInArray!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun bm!24914 () Bool)

(assert (=> bm!24914 (= call!24917 call!24918)))

(declare-fun b!261051 () Bool)

(declare-fun e!169174 () Bool)

(declare-fun apply!259 (ListLongMap!3865 (_ BitVec 64)) V!8483)

(assert (=> b!261051 (= e!169174 (= (apply!259 lt!131769 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4649 thiss!1504)))))

(declare-fun bm!24915 () Bool)

(declare-fun call!24915 () Bool)

(assert (=> bm!24915 (= call!24915 (contains!1894 lt!131769 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261052 () Bool)

(declare-fun e!169183 () Bool)

(declare-fun get!3077 (ValueCell!2970 V!8483) V!8483)

(declare-fun dynLambda!602 (Int (_ BitVec 64)) V!8483)

(assert (=> b!261052 (= e!169183 (= (apply!259 lt!131769 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)) (get!3077 (select (arr!5968 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261052 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6318 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))))))))

(assert (=> b!261052 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(declare-fun b!261053 () Bool)

(declare-fun e!169173 () Bool)

(assert (=> b!261053 (= e!169173 (validKeyInArray!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun b!261054 () Bool)

(declare-fun c!44408 () Bool)

(assert (=> b!261054 (= c!44408 (and (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!169179 () ListLongMap!3865)

(assert (=> b!261054 (= e!169180 e!169179)))

(declare-fun b!261055 () Bool)

(assert (=> b!261055 (= e!169179 call!24916)))

(declare-fun b!261056 () Bool)

(declare-fun e!169178 () Bool)

(declare-fun e!169171 () Bool)

(assert (=> b!261056 (= e!169178 e!169171)))

(declare-fun res!127576 () Bool)

(assert (=> b!261056 (= res!127576 call!24915)))

(assert (=> b!261056 (=> (not res!127576) (not e!169171))))

(declare-fun b!261057 () Bool)

(assert (=> b!261057 (= e!169179 call!24917)))

(declare-fun b!261058 () Bool)

(declare-fun lt!131762 () Unit!8108)

(assert (=> b!261058 (= e!169176 lt!131762)))

(declare-fun lt!131749 () ListLongMap!3865)

(assert (=> b!261058 (= lt!131749 (getCurrentListMapNoExtraKeys!581 lt!131631 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131766 () (_ BitVec 64))

(assert (=> b!261058 (= lt!131766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131754 () (_ BitVec 64))

(assert (=> b!261058 (= lt!131754 (select (arr!5969 lt!131631) #b00000000000000000000000000000000))))

(declare-fun lt!131768 () Unit!8108)

(declare-fun addStillContains!235 (ListLongMap!3865 (_ BitVec 64) V!8483 (_ BitVec 64)) Unit!8108)

(assert (=> b!261058 (= lt!131768 (addStillContains!235 lt!131749 lt!131766 (zeroValue!4649 thiss!1504) lt!131754))))

(assert (=> b!261058 (contains!1894 (+!701 lt!131749 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504))) lt!131754)))

(declare-fun lt!131751 () Unit!8108)

(assert (=> b!261058 (= lt!131751 lt!131768)))

(declare-fun lt!131757 () ListLongMap!3865)

(assert (=> b!261058 (= lt!131757 (getCurrentListMapNoExtraKeys!581 lt!131631 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131753 () (_ BitVec 64))

(assert (=> b!261058 (= lt!131753 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131764 () (_ BitVec 64))

(assert (=> b!261058 (= lt!131764 (select (arr!5969 lt!131631) #b00000000000000000000000000000000))))

(declare-fun lt!131761 () Unit!8108)

(declare-fun addApplyDifferent!235 (ListLongMap!3865 (_ BitVec 64) V!8483 (_ BitVec 64)) Unit!8108)

(assert (=> b!261058 (= lt!131761 (addApplyDifferent!235 lt!131757 lt!131753 (minValue!4649 thiss!1504) lt!131764))))

(assert (=> b!261058 (= (apply!259 (+!701 lt!131757 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504))) lt!131764) (apply!259 lt!131757 lt!131764))))

(declare-fun lt!131750 () Unit!8108)

(assert (=> b!261058 (= lt!131750 lt!131761)))

(declare-fun lt!131759 () ListLongMap!3865)

(assert (=> b!261058 (= lt!131759 (getCurrentListMapNoExtraKeys!581 lt!131631 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131765 () (_ BitVec 64))

(assert (=> b!261058 (= lt!131765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131748 () (_ BitVec 64))

(assert (=> b!261058 (= lt!131748 (select (arr!5969 lt!131631) #b00000000000000000000000000000000))))

(declare-fun lt!131758 () Unit!8108)

(assert (=> b!261058 (= lt!131758 (addApplyDifferent!235 lt!131759 lt!131765 (zeroValue!4649 thiss!1504) lt!131748))))

(assert (=> b!261058 (= (apply!259 (+!701 lt!131759 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504))) lt!131748) (apply!259 lt!131759 lt!131748))))

(declare-fun lt!131767 () Unit!8108)

(assert (=> b!261058 (= lt!131767 lt!131758)))

(declare-fun lt!131763 () ListLongMap!3865)

(assert (=> b!261058 (= lt!131763 (getCurrentListMapNoExtraKeys!581 lt!131631 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131756 () (_ BitVec 64))

(assert (=> b!261058 (= lt!131756 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131755 () (_ BitVec 64))

(assert (=> b!261058 (= lt!131755 (select (arr!5969 lt!131631) #b00000000000000000000000000000000))))

(assert (=> b!261058 (= lt!131762 (addApplyDifferent!235 lt!131763 lt!131756 (minValue!4649 thiss!1504) lt!131755))))

(assert (=> b!261058 (= (apply!259 (+!701 lt!131763 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504))) lt!131755) (apply!259 lt!131763 lt!131755))))

(declare-fun b!261059 () Bool)

(declare-fun Unit!8116 () Unit!8108)

(assert (=> b!261059 (= e!169176 Unit!8116)))

(declare-fun b!261060 () Bool)

(declare-fun res!127578 () Bool)

(assert (=> b!261060 (=> (not res!127578) (not e!169172))))

(assert (=> b!261060 (= res!127578 e!169178)))

(declare-fun c!44410 () Bool)

(assert (=> b!261060 (= c!44410 (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!261061 () Bool)

(assert (=> b!261061 (= e!169178 (not call!24915))))

(declare-fun b!261062 () Bool)

(declare-fun e!169181 () Bool)

(assert (=> b!261062 (= e!169172 e!169181)))

(declare-fun c!44405 () Bool)

(assert (=> b!261062 (= c!44405 (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261063 () Bool)

(assert (=> b!261063 (= e!169171 (= (apply!259 lt!131769 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4649 thiss!1504)))))

(declare-fun bm!24916 () Bool)

(assert (=> bm!24916 (= call!24916 call!24914)))

(declare-fun b!261064 () Bool)

(declare-fun e!169175 () Bool)

(assert (=> b!261064 (= e!169175 e!169183)))

(declare-fun res!127571 () Bool)

(assert (=> b!261064 (=> (not res!127571) (not e!169183))))

(assert (=> b!261064 (= res!127571 (contains!1894 lt!131769 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(assert (=> b!261064 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(declare-fun b!261065 () Bool)

(declare-fun res!127574 () Bool)

(assert (=> b!261065 (=> (not res!127574) (not e!169172))))

(assert (=> b!261065 (= res!127574 e!169175)))

(declare-fun res!127575 () Bool)

(assert (=> b!261065 (=> res!127575 e!169175)))

(assert (=> b!261065 (= res!127575 (not e!169173))))

(declare-fun res!127577 () Bool)

(assert (=> b!261065 (=> (not res!127577) (not e!169173))))

(assert (=> b!261065 (= res!127577 (bvslt #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(declare-fun bm!24917 () Bool)

(declare-fun call!24919 () Bool)

(assert (=> bm!24917 (= call!24919 (contains!1894 lt!131769 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261066 () Bool)

(assert (=> b!261066 (= e!169177 (+!701 call!24914 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))

(declare-fun b!261067 () Bool)

(assert (=> b!261067 (= e!169181 e!169174)))

(declare-fun res!127579 () Bool)

(assert (=> b!261067 (= res!127579 call!24919)))

(assert (=> b!261067 (=> (not res!127579) (not e!169174))))

(declare-fun b!261068 () Bool)

(assert (=> b!261068 (= e!169181 (not call!24919))))

(assert (= (and d!62723 c!44409) b!261066))

(assert (= (and d!62723 (not c!44409)) b!261048))

(assert (= (and b!261048 c!44407) b!261049))

(assert (= (and b!261048 (not c!44407)) b!261054))

(assert (= (and b!261054 c!44408) b!261055))

(assert (= (and b!261054 (not c!44408)) b!261057))

(assert (= (or b!261055 b!261057) bm!24914))

(assert (= (or b!261049 bm!24914) bm!24911))

(assert (= (or b!261049 b!261055) bm!24916))

(assert (= (or b!261066 bm!24911) bm!24913))

(assert (= (or b!261066 bm!24916) bm!24912))

(assert (= (and d!62723 res!127573) b!261050))

(assert (= (and d!62723 c!44406) b!261058))

(assert (= (and d!62723 (not c!44406)) b!261059))

(assert (= (and d!62723 res!127572) b!261065))

(assert (= (and b!261065 res!127577) b!261053))

(assert (= (and b!261065 (not res!127575)) b!261064))

(assert (= (and b!261064 res!127571) b!261052))

(assert (= (and b!261065 res!127574) b!261060))

(assert (= (and b!261060 c!44410) b!261056))

(assert (= (and b!261060 (not c!44410)) b!261061))

(assert (= (and b!261056 res!127576) b!261063))

(assert (= (or b!261056 b!261061) bm!24915))

(assert (= (and b!261060 res!127578) b!261062))

(assert (= (and b!261062 c!44405) b!261067))

(assert (= (and b!261062 (not c!44405)) b!261068))

(assert (= (and b!261067 res!127579) b!261051))

(assert (= (or b!261067 b!261068) bm!24917))

(declare-fun b_lambda!8287 () Bool)

(assert (=> (not b_lambda!8287) (not b!261052)))

(declare-fun t!8905 () Bool)

(declare-fun tb!3031 () Bool)

(assert (=> (and b!260867 (= (defaultEntry!4808 thiss!1504) (defaultEntry!4808 thiss!1504)) t!8905) tb!3031))

(declare-fun result!5415 () Bool)

(assert (=> tb!3031 (= result!5415 tp_is_empty!6627)))

(assert (=> b!261052 t!8905))

(declare-fun b_and!13889 () Bool)

(assert (= b_and!13885 (and (=> t!8905 result!5415) b_and!13889)))

(declare-fun m!276919 () Bool)

(assert (=> b!261058 m!276919))

(declare-fun m!276921 () Bool)

(assert (=> b!261058 m!276921))

(declare-fun m!276923 () Bool)

(assert (=> b!261058 m!276923))

(declare-fun m!276925 () Bool)

(assert (=> b!261058 m!276925))

(declare-fun m!276927 () Bool)

(assert (=> b!261058 m!276927))

(assert (=> b!261058 m!276919))

(assert (=> b!261058 m!276883))

(declare-fun m!276929 () Bool)

(assert (=> b!261058 m!276929))

(declare-fun m!276931 () Bool)

(assert (=> b!261058 m!276931))

(declare-fun m!276933 () Bool)

(assert (=> b!261058 m!276933))

(declare-fun m!276935 () Bool)

(assert (=> b!261058 m!276935))

(declare-fun m!276937 () Bool)

(assert (=> b!261058 m!276937))

(declare-fun m!276939 () Bool)

(assert (=> b!261058 m!276939))

(assert (=> b!261058 m!276937))

(declare-fun m!276941 () Bool)

(assert (=> b!261058 m!276941))

(declare-fun m!276943 () Bool)

(assert (=> b!261058 m!276943))

(assert (=> b!261058 m!276933))

(declare-fun m!276945 () Bool)

(assert (=> b!261058 m!276945))

(assert (=> b!261058 m!276931))

(declare-fun m!276947 () Bool)

(assert (=> b!261058 m!276947))

(declare-fun m!276949 () Bool)

(assert (=> b!261058 m!276949))

(declare-fun m!276951 () Bool)

(assert (=> bm!24912 m!276951))

(declare-fun m!276953 () Bool)

(assert (=> bm!24915 m!276953))

(declare-fun m!276955 () Bool)

(assert (=> b!261066 m!276955))

(assert (=> bm!24913 m!276949))

(declare-fun m!276957 () Bool)

(assert (=> b!261052 m!276957))

(assert (=> b!261052 m!276883))

(declare-fun m!276959 () Bool)

(assert (=> b!261052 m!276959))

(assert (=> b!261052 m!276957))

(assert (=> b!261052 m!276959))

(declare-fun m!276961 () Bool)

(assert (=> b!261052 m!276961))

(assert (=> b!261052 m!276883))

(declare-fun m!276963 () Bool)

(assert (=> b!261052 m!276963))

(declare-fun m!276965 () Bool)

(assert (=> b!261051 m!276965))

(assert (=> b!261064 m!276883))

(assert (=> b!261064 m!276883))

(declare-fun m!276967 () Bool)

(assert (=> b!261064 m!276967))

(assert (=> b!261050 m!276883))

(assert (=> b!261050 m!276883))

(assert (=> b!261050 m!276885))

(assert (=> d!62723 m!276785))

(assert (=> b!261053 m!276883))

(assert (=> b!261053 m!276883))

(assert (=> b!261053 m!276885))

(declare-fun m!276969 () Bool)

(assert (=> b!261063 m!276969))

(declare-fun m!276971 () Bool)

(assert (=> bm!24917 m!276971))

(assert (=> b!260880 d!62723))

(declare-fun d!62725 () Bool)

(declare-fun res!127580 () Bool)

(declare-fun e!169184 () Bool)

(assert (=> d!62725 (=> res!127580 e!169184)))

(assert (=> d!62725 (= res!127580 (= (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!62725 (= (arrayContainsKey!0 (_keys!6992 thiss!1504) key!932 #b00000000000000000000000000000000) e!169184)))

(declare-fun b!261071 () Bool)

(declare-fun e!169185 () Bool)

(assert (=> b!261071 (= e!169184 e!169185)))

(declare-fun res!127581 () Bool)

(assert (=> b!261071 (=> (not res!127581) (not e!169185))))

(assert (=> b!261071 (= res!127581 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!261072 () Bool)

(assert (=> b!261072 (= e!169185 (arrayContainsKey!0 (_keys!6992 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62725 (not res!127580)) b!261071))

(assert (= (and b!261071 res!127581) b!261072))

(assert (=> d!62725 m!276893))

(declare-fun m!276973 () Bool)

(assert (=> b!261072 m!276973))

(assert (=> b!260880 d!62725))

(declare-fun d!62727 () Bool)

(declare-fun e!169188 () Bool)

(assert (=> d!62727 e!169188))

(declare-fun res!127584 () Bool)

(assert (=> d!62727 (=> (not res!127584) (not e!169188))))

(assert (=> d!62727 (= res!127584 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6319 (_keys!6992 thiss!1504)))))))

(declare-fun lt!131772 () Unit!8108)

(declare-fun choose!102 ((_ BitVec 64) array!12611 (_ BitVec 32) (_ BitVec 32)) Unit!8108)

(assert (=> d!62727 (= lt!131772 (choose!102 key!932 (_keys!6992 thiss!1504) index!297 (mask!11145 thiss!1504)))))

(assert (=> d!62727 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62727 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6992 thiss!1504) index!297 (mask!11145 thiss!1504)) lt!131772)))

(declare-fun b!261075 () Bool)

(assert (=> b!261075 (= e!169188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (mask!11145 thiss!1504)))))

(assert (= (and d!62727 res!127584) b!261075))

(declare-fun m!276975 () Bool)

(assert (=> d!62727 m!276975))

(assert (=> d!62727 m!276785))

(assert (=> b!261075 m!276775))

(declare-fun m!276977 () Bool)

(assert (=> b!261075 m!276977))

(assert (=> b!260880 d!62727))

(declare-fun d!62729 () Bool)

(declare-fun e!169191 () Bool)

(assert (=> d!62729 e!169191))

(declare-fun res!127587 () Bool)

(assert (=> d!62729 (=> (not res!127587) (not e!169191))))

(assert (=> d!62729 (= res!127587 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6319 (_keys!6992 thiss!1504))) (bvslt index!297 (size!6318 (_values!4791 thiss!1504)))))))

(declare-fun lt!131775 () Unit!8108)

(declare-fun choose!1272 (array!12611 array!12609 (_ BitVec 32) (_ BitVec 32) V!8483 V!8483 (_ BitVec 32) (_ BitVec 64) V!8483 Int) Unit!8108)

(assert (=> d!62729 (= lt!131775 (choose!1272 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) index!297 key!932 v!346 (defaultEntry!4808 thiss!1504)))))

(assert (=> d!62729 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62729 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!111 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) index!297 key!932 v!346 (defaultEntry!4808 thiss!1504)) lt!131775)))

(declare-fun b!261078 () Bool)

(assert (=> b!261078 (= e!169191 (= (+!701 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) (tuple2!4953 key!932 v!346)) (getCurrentListMap!1476 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504))))))

(assert (= (and d!62729 res!127587) b!261078))

(declare-fun m!276979 () Bool)

(assert (=> d!62729 m!276979))

(assert (=> d!62729 m!276785))

(assert (=> b!261078 m!276803))

(declare-fun m!276981 () Bool)

(assert (=> b!261078 m!276981))

(declare-fun m!276983 () Bool)

(assert (=> b!261078 m!276983))

(assert (=> b!261078 m!276775))

(assert (=> b!261078 m!276765))

(assert (=> b!261078 m!276803))

(assert (=> b!260880 d!62729))

(declare-fun d!62731 () Bool)

(assert (=> d!62731 (= (arrayCountValidKeys!0 lt!131631 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!131778 () Unit!8108)

(declare-fun choose!2 (array!12611 (_ BitVec 32)) Unit!8108)

(assert (=> d!62731 (= lt!131778 (choose!2 lt!131631 index!297))))

(declare-fun e!169194 () Bool)

(assert (=> d!62731 e!169194))

(declare-fun res!127592 () Bool)

(assert (=> d!62731 (=> (not res!127592) (not e!169194))))

(assert (=> d!62731 (= res!127592 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6319 lt!131631))))))

(assert (=> d!62731 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!131631 index!297) lt!131778)))

(declare-fun b!261083 () Bool)

(declare-fun res!127593 () Bool)

(assert (=> b!261083 (=> (not res!127593) (not e!169194))))

(assert (=> b!261083 (= res!127593 (validKeyInArray!0 (select (arr!5969 lt!131631) index!297)))))

(declare-fun b!261084 () Bool)

(assert (=> b!261084 (= e!169194 (bvslt (size!6319 lt!131631) #b01111111111111111111111111111111))))

(assert (= (and d!62731 res!127592) b!261083))

(assert (= (and b!261083 res!127593) b!261084))

(declare-fun m!276985 () Bool)

(assert (=> d!62731 m!276985))

(declare-fun m!276987 () Bool)

(assert (=> d!62731 m!276987))

(declare-fun m!276989 () Bool)

(assert (=> b!261083 m!276989))

(assert (=> b!261083 m!276989))

(declare-fun m!276991 () Bool)

(assert (=> b!261083 m!276991))

(assert (=> b!260880 d!62731))

(declare-fun d!62733 () Bool)

(declare-fun lt!131779 () (_ BitVec 32))

(assert (=> d!62733 (and (bvsge lt!131779 #b00000000000000000000000000000000) (bvsle lt!131779 (bvsub (size!6319 lt!131631) index!297)))))

(declare-fun e!169196 () (_ BitVec 32))

(assert (=> d!62733 (= lt!131779 e!169196)))

(declare-fun c!44411 () Bool)

(assert (=> d!62733 (= c!44411 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62733 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6319 lt!131631)))))

(assert (=> d!62733 (= (arrayCountValidKeys!0 lt!131631 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!131779)))

(declare-fun bm!24918 () Bool)

(declare-fun call!24921 () (_ BitVec 32))

(assert (=> bm!24918 (= call!24921 (arrayCountValidKeys!0 lt!131631 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!261085 () Bool)

(declare-fun e!169195 () (_ BitVec 32))

(assert (=> b!261085 (= e!169195 (bvadd #b00000000000000000000000000000001 call!24921))))

(declare-fun b!261086 () Bool)

(assert (=> b!261086 (= e!169196 #b00000000000000000000000000000000)))

(declare-fun b!261087 () Bool)

(assert (=> b!261087 (= e!169195 call!24921)))

(declare-fun b!261088 () Bool)

(assert (=> b!261088 (= e!169196 e!169195)))

(declare-fun c!44412 () Bool)

(assert (=> b!261088 (= c!44412 (validKeyInArray!0 (select (arr!5969 lt!131631) index!297)))))

(assert (= (and d!62733 c!44411) b!261086))

(assert (= (and d!62733 (not c!44411)) b!261088))

(assert (= (and b!261088 c!44412) b!261085))

(assert (= (and b!261088 (not c!44412)) b!261087))

(assert (= (or b!261085 b!261087) bm!24918))

(declare-fun m!276993 () Bool)

(assert (=> bm!24918 m!276993))

(assert (=> b!261088 m!276989))

(assert (=> b!261088 m!276989))

(assert (=> b!261088 m!276991))

(assert (=> b!260880 d!62733))

(declare-fun d!62735 () Bool)

(declare-fun e!169199 () Bool)

(assert (=> d!62735 e!169199))

(declare-fun res!127598 () Bool)

(assert (=> d!62735 (=> (not res!127598) (not e!169199))))

(declare-fun lt!131791 () ListLongMap!3865)

(assert (=> d!62735 (= res!127598 (contains!1894 lt!131791 (_1!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun lt!131788 () List!3830)

(assert (=> d!62735 (= lt!131791 (ListLongMap!3866 lt!131788))))

(declare-fun lt!131789 () Unit!8108)

(declare-fun lt!131790 () Unit!8108)

(assert (=> d!62735 (= lt!131789 lt!131790)))

(declare-datatypes ((Option!323 0))(
  ( (Some!322 (v!5481 V!8483)) (None!321) )
))
(declare-fun getValueByKey!317 (List!3830 (_ BitVec 64)) Option!323)

(assert (=> d!62735 (= (getValueByKey!317 lt!131788 (_1!2487 (tuple2!4953 key!932 v!346))) (Some!322 (_2!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun lemmaContainsTupThenGetReturnValue!173 (List!3830 (_ BitVec 64) V!8483) Unit!8108)

(assert (=> d!62735 (= lt!131790 (lemmaContainsTupThenGetReturnValue!173 lt!131788 (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun insertStrictlySorted!176 (List!3830 (_ BitVec 64) V!8483) List!3830)

(assert (=> d!62735 (= lt!131788 (insertStrictlySorted!176 (toList!1948 lt!131634) (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346))))))

(assert (=> d!62735 (= (+!701 lt!131634 (tuple2!4953 key!932 v!346)) lt!131791)))

(declare-fun b!261093 () Bool)

(declare-fun res!127599 () Bool)

(assert (=> b!261093 (=> (not res!127599) (not e!169199))))

(assert (=> b!261093 (= res!127599 (= (getValueByKey!317 (toList!1948 lt!131791) (_1!2487 (tuple2!4953 key!932 v!346))) (Some!322 (_2!2487 (tuple2!4953 key!932 v!346)))))))

(declare-fun b!261094 () Bool)

(declare-fun contains!1896 (List!3830 tuple2!4952) Bool)

(assert (=> b!261094 (= e!169199 (contains!1896 (toList!1948 lt!131791) (tuple2!4953 key!932 v!346)))))

(assert (= (and d!62735 res!127598) b!261093))

(assert (= (and b!261093 res!127599) b!261094))

(declare-fun m!276995 () Bool)

(assert (=> d!62735 m!276995))

(declare-fun m!276997 () Bool)

(assert (=> d!62735 m!276997))

(declare-fun m!276999 () Bool)

(assert (=> d!62735 m!276999))

(declare-fun m!277001 () Bool)

(assert (=> d!62735 m!277001))

(declare-fun m!277003 () Bool)

(assert (=> b!261093 m!277003))

(declare-fun m!277005 () Bool)

(assert (=> b!261094 m!277005))

(assert (=> b!260880 d!62735))

(declare-fun b!261105 () Bool)

(declare-fun e!169210 () Bool)

(declare-fun e!169209 () Bool)

(assert (=> b!261105 (= e!169210 e!169209)))

(declare-fun c!44415 () Bool)

(assert (=> b!261105 (= c!44415 (validKeyInArray!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun bm!24921 () Bool)

(declare-fun call!24924 () Bool)

(assert (=> bm!24921 (= call!24924 (arrayNoDuplicates!0 lt!131631 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44415 (Cons!3827 (select (arr!5969 lt!131631) #b00000000000000000000000000000000) Nil!3828) Nil!3828)))))

(declare-fun b!261106 () Bool)

(assert (=> b!261106 (= e!169209 call!24924)))

(declare-fun b!261107 () Bool)

(declare-fun e!169211 () Bool)

(declare-fun contains!1897 (List!3831 (_ BitVec 64)) Bool)

(assert (=> b!261107 (= e!169211 (contains!1897 Nil!3828 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun b!261108 () Bool)

(declare-fun e!169208 () Bool)

(assert (=> b!261108 (= e!169208 e!169210)))

(declare-fun res!127606 () Bool)

(assert (=> b!261108 (=> (not res!127606) (not e!169210))))

(assert (=> b!261108 (= res!127606 (not e!169211))))

(declare-fun res!127608 () Bool)

(assert (=> b!261108 (=> (not res!127608) (not e!169211))))

(assert (=> b!261108 (= res!127608 (validKeyInArray!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun d!62737 () Bool)

(declare-fun res!127607 () Bool)

(assert (=> d!62737 (=> res!127607 e!169208)))

(assert (=> d!62737 (= res!127607 (bvsge #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(assert (=> d!62737 (= (arrayNoDuplicates!0 lt!131631 #b00000000000000000000000000000000 Nil!3828) e!169208)))

(declare-fun b!261109 () Bool)

(assert (=> b!261109 (= e!169209 call!24924)))

(assert (= (and d!62737 (not res!127607)) b!261108))

(assert (= (and b!261108 res!127608) b!261107))

(assert (= (and b!261108 res!127606) b!261105))

(assert (= (and b!261105 c!44415) b!261109))

(assert (= (and b!261105 (not c!44415)) b!261106))

(assert (= (or b!261109 b!261106) bm!24921))

(assert (=> b!261105 m!276883))

(assert (=> b!261105 m!276883))

(assert (=> b!261105 m!276885))

(assert (=> bm!24921 m!276883))

(declare-fun m!277007 () Bool)

(assert (=> bm!24921 m!277007))

(assert (=> b!261107 m!276883))

(assert (=> b!261107 m!276883))

(declare-fun m!277009 () Bool)

(assert (=> b!261107 m!277009))

(assert (=> b!261108 m!276883))

(assert (=> b!261108 m!276883))

(assert (=> b!261108 m!276885))

(assert (=> b!260880 d!62737))

(declare-fun d!62739 () Bool)

(assert (=> d!62739 (= (array_inv!3941 (_keys!6992 thiss!1504)) (bvsge (size!6319 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260867 d!62739))

(declare-fun d!62741 () Bool)

(assert (=> d!62741 (= (array_inv!3942 (_values!4791 thiss!1504)) (bvsge (size!6318 (_values!4791 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!260867 d!62741))

(declare-fun d!62743 () Bool)

(assert (=> d!62743 (contains!1894 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) key!932)))

(declare-fun lt!131794 () Unit!8108)

(declare-fun choose!1273 (array!12611 array!12609 (_ BitVec 32) (_ BitVec 32) V!8483 V!8483 (_ BitVec 64) (_ BitVec 32) Int) Unit!8108)

(assert (=> d!62743 (= lt!131794 (choose!1273 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(assert (=> d!62743 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62743 (= (lemmaArrayContainsKeyThenInListMap!252 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) lt!131794)))

(declare-fun bs!9198 () Bool)

(assert (= bs!9198 d!62743))

(assert (=> bs!9198 m!276803))

(assert (=> bs!9198 m!276803))

(declare-fun m!277011 () Bool)

(assert (=> bs!9198 m!277011))

(declare-fun m!277013 () Bool)

(assert (=> bs!9198 m!277013))

(assert (=> bs!9198 m!276785))

(assert (=> b!260876 d!62743))

(declare-fun b!261126 () Bool)

(declare-fun lt!131800 () SeekEntryResult!1185)

(assert (=> b!261126 (and (bvsge (index!6910 lt!131800) #b00000000000000000000000000000000) (bvslt (index!6910 lt!131800) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun res!127617 () Bool)

(assert (=> b!261126 (= res!127617 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6910 lt!131800)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169220 () Bool)

(assert (=> b!261126 (=> (not res!127617) (not e!169220))))

(declare-fun b!261127 () Bool)

(declare-fun e!169223 () Bool)

(assert (=> b!261127 (= e!169223 ((_ is Undefined!1185) lt!131800))))

(declare-fun b!261128 () Bool)

(declare-fun call!24930 () Bool)

(assert (=> b!261128 (= e!169220 (not call!24930))))

(declare-fun b!261129 () Bool)

(declare-fun res!127620 () Bool)

(declare-fun e!169222 () Bool)

(assert (=> b!261129 (=> (not res!127620) (not e!169222))))

(assert (=> b!261129 (= res!127620 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6913 lt!131800)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261129 (and (bvsge (index!6913 lt!131800) #b00000000000000000000000000000000) (bvslt (index!6913 lt!131800) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!261130 () Bool)

(declare-fun e!169221 () Bool)

(assert (=> b!261130 (= e!169221 e!169223)))

(declare-fun c!44420 () Bool)

(assert (=> b!261130 (= c!44420 ((_ is MissingVacant!1185) lt!131800))))

(declare-fun b!261131 () Bool)

(declare-fun res!127618 () Bool)

(assert (=> b!261131 (=> (not res!127618) (not e!169222))))

(declare-fun call!24929 () Bool)

(assert (=> b!261131 (= res!127618 call!24929)))

(assert (=> b!261131 (= e!169223 e!169222)))

(declare-fun bm!24927 () Bool)

(assert (=> bm!24927 (= call!24930 (arrayContainsKey!0 (_keys!6992 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun c!44421 () Bool)

(declare-fun bm!24926 () Bool)

(assert (=> bm!24926 (= call!24929 (inRange!0 (ite c!44421 (index!6910 lt!131800) (index!6913 lt!131800)) (mask!11145 thiss!1504)))))

(declare-fun d!62745 () Bool)

(assert (=> d!62745 e!169221))

(assert (=> d!62745 (= c!44421 ((_ is MissingZero!1185) lt!131800))))

(assert (=> d!62745 (= lt!131800 (seekEntryOrOpen!0 key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(declare-fun lt!131799 () Unit!8108)

(declare-fun choose!1274 (array!12611 array!12609 (_ BitVec 32) (_ BitVec 32) V!8483 V!8483 (_ BitVec 64) Int) Unit!8108)

(assert (=> d!62745 (= lt!131799 (choose!1274 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 (defaultEntry!4808 thiss!1504)))))

(assert (=> d!62745 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62745 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!447 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 (defaultEntry!4808 thiss!1504)) lt!131799)))

(declare-fun b!261132 () Bool)

(assert (=> b!261132 (= e!169222 (not call!24930))))

(declare-fun b!261133 () Bool)

(assert (=> b!261133 (= e!169221 e!169220)))

(declare-fun res!127619 () Bool)

(assert (=> b!261133 (= res!127619 call!24929)))

(assert (=> b!261133 (=> (not res!127619) (not e!169220))))

(assert (= (and d!62745 c!44421) b!261133))

(assert (= (and d!62745 (not c!44421)) b!261130))

(assert (= (and b!261133 res!127619) b!261126))

(assert (= (and b!261126 res!127617) b!261128))

(assert (= (and b!261130 c!44420) b!261131))

(assert (= (and b!261130 (not c!44420)) b!261127))

(assert (= (and b!261131 res!127618) b!261129))

(assert (= (and b!261129 res!127620) b!261132))

(assert (= (or b!261133 b!261131) bm!24926))

(assert (= (or b!261128 b!261132) bm!24927))

(declare-fun m!277015 () Bool)

(assert (=> bm!24926 m!277015))

(declare-fun m!277017 () Bool)

(assert (=> b!261126 m!277017))

(assert (=> d!62745 m!276753))

(declare-fun m!277019 () Bool)

(assert (=> d!62745 m!277019))

(assert (=> d!62745 m!276785))

(declare-fun m!277021 () Bool)

(assert (=> b!261129 m!277021))

(assert (=> bm!24927 m!276757))

(assert (=> b!260875 d!62745))

(assert (=> bm!24882 d!62725))

(declare-fun d!62747 () Bool)

(assert (=> d!62747 (= (inRange!0 index!297 (mask!11145 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11145 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!260873 d!62747))

(declare-fun d!62749 () Bool)

(declare-fun e!169228 () Bool)

(assert (=> d!62749 e!169228))

(declare-fun res!127623 () Bool)

(assert (=> d!62749 (=> res!127623 e!169228)))

(declare-fun lt!131810 () Bool)

(assert (=> d!62749 (= res!127623 (not lt!131810))))

(declare-fun lt!131809 () Bool)

(assert (=> d!62749 (= lt!131810 lt!131809)))

(declare-fun lt!131811 () Unit!8108)

(declare-fun e!169229 () Unit!8108)

(assert (=> d!62749 (= lt!131811 e!169229)))

(declare-fun c!44424 () Bool)

(assert (=> d!62749 (= c!44424 lt!131809)))

(declare-fun containsKey!309 (List!3830 (_ BitVec 64)) Bool)

(assert (=> d!62749 (= lt!131809 (containsKey!309 (toList!1948 lt!131634) key!932))))

(assert (=> d!62749 (= (contains!1894 lt!131634 key!932) lt!131810)))

(declare-fun b!261140 () Bool)

(declare-fun lt!131812 () Unit!8108)

(assert (=> b!261140 (= e!169229 lt!131812)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!257 (List!3830 (_ BitVec 64)) Unit!8108)

(assert (=> b!261140 (= lt!131812 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 lt!131634) key!932))))

(declare-fun isDefined!258 (Option!323) Bool)

(assert (=> b!261140 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131634) key!932))))

(declare-fun b!261141 () Bool)

(declare-fun Unit!8117 () Unit!8108)

(assert (=> b!261141 (= e!169229 Unit!8117)))

(declare-fun b!261142 () Bool)

(assert (=> b!261142 (= e!169228 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131634) key!932)))))

(assert (= (and d!62749 c!44424) b!261140))

(assert (= (and d!62749 (not c!44424)) b!261141))

(assert (= (and d!62749 (not res!127623)) b!261142))

(declare-fun m!277023 () Bool)

(assert (=> d!62749 m!277023))

(declare-fun m!277025 () Bool)

(assert (=> b!261140 m!277025))

(declare-fun m!277027 () Bool)

(assert (=> b!261140 m!277027))

(assert (=> b!261140 m!277027))

(declare-fun m!277029 () Bool)

(assert (=> b!261140 m!277029))

(assert (=> b!261142 m!277027))

(assert (=> b!261142 m!277027))

(assert (=> b!261142 m!277029))

(assert (=> b!260873 d!62749))

(declare-fun bm!24928 () Bool)

(declare-fun call!24935 () ListLongMap!3865)

(declare-fun call!24937 () ListLongMap!3865)

(assert (=> bm!24928 (= call!24935 call!24937)))

(declare-fun d!62751 () Bool)

(declare-fun e!169231 () Bool)

(assert (=> d!62751 e!169231))

(declare-fun res!127625 () Bool)

(assert (=> d!62751 (=> (not res!127625) (not e!169231))))

(assert (=> d!62751 (= res!127625 (or (bvsge #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))))

(declare-fun lt!131834 () ListLongMap!3865)

(declare-fun lt!131825 () ListLongMap!3865)

(assert (=> d!62751 (= lt!131834 lt!131825)))

(declare-fun lt!131817 () Unit!8108)

(declare-fun e!169235 () Unit!8108)

(assert (=> d!62751 (= lt!131817 e!169235)))

(declare-fun c!44426 () Bool)

(declare-fun e!169241 () Bool)

(assert (=> d!62751 (= c!44426 e!169241)))

(declare-fun res!127626 () Bool)

(assert (=> d!62751 (=> (not res!127626) (not e!169241))))

(assert (=> d!62751 (= res!127626 (bvslt #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun e!169236 () ListLongMap!3865)

(assert (=> d!62751 (= lt!131825 e!169236)))

(declare-fun c!44429 () Bool)

(assert (=> d!62751 (= c!44429 (and (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62751 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62751 (= (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) lt!131834)))

(declare-fun c!44427 () Bool)

(declare-fun call!24931 () ListLongMap!3865)

(declare-fun call!24934 () ListLongMap!3865)

(declare-fun bm!24929 () Bool)

(assert (=> bm!24929 (= call!24931 (+!701 (ite c!44429 call!24937 (ite c!44427 call!24935 call!24934)) (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(declare-fun b!261143 () Bool)

(declare-fun e!169239 () ListLongMap!3865)

(assert (=> b!261143 (= e!169236 e!169239)))

(assert (=> b!261143 (= c!44427 (and (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261144 () Bool)

(declare-fun call!24933 () ListLongMap!3865)

(assert (=> b!261144 (= e!169239 call!24933)))

(declare-fun bm!24930 () Bool)

(assert (=> bm!24930 (= call!24937 (getCurrentListMapNoExtraKeys!581 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun b!261145 () Bool)

(assert (=> b!261145 (= e!169241 (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24931 () Bool)

(assert (=> bm!24931 (= call!24934 call!24935)))

(declare-fun b!261146 () Bool)

(declare-fun e!169233 () Bool)

(assert (=> b!261146 (= e!169233 (= (apply!259 lt!131834 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4649 thiss!1504)))))

(declare-fun bm!24932 () Bool)

(declare-fun call!24932 () Bool)

(assert (=> bm!24932 (= call!24932 (contains!1894 lt!131834 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261147 () Bool)

(declare-fun e!169242 () Bool)

(assert (=> b!261147 (= e!169242 (= (apply!259 lt!131834 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)) (get!3077 (select (arr!5968 (_values!4791 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6318 (_values!4791 thiss!1504))))))

(assert (=> b!261147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!261148 () Bool)

(declare-fun e!169232 () Bool)

(assert (=> b!261148 (= e!169232 (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261149 () Bool)

(declare-fun c!44428 () Bool)

(assert (=> b!261149 (= c!44428 (and (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!169238 () ListLongMap!3865)

(assert (=> b!261149 (= e!169239 e!169238)))

(declare-fun b!261150 () Bool)

(assert (=> b!261150 (= e!169238 call!24933)))

(declare-fun b!261151 () Bool)

(declare-fun e!169237 () Bool)

(declare-fun e!169230 () Bool)

(assert (=> b!261151 (= e!169237 e!169230)))

(declare-fun res!127629 () Bool)

(assert (=> b!261151 (= res!127629 call!24932)))

(assert (=> b!261151 (=> (not res!127629) (not e!169230))))

(declare-fun b!261152 () Bool)

(assert (=> b!261152 (= e!169238 call!24934)))

(declare-fun b!261153 () Bool)

(declare-fun lt!131827 () Unit!8108)

(assert (=> b!261153 (= e!169235 lt!131827)))

(declare-fun lt!131814 () ListLongMap!3865)

(assert (=> b!261153 (= lt!131814 (getCurrentListMapNoExtraKeys!581 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131831 () (_ BitVec 64))

(assert (=> b!261153 (= lt!131831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131819 () (_ BitVec 64))

(assert (=> b!261153 (= lt!131819 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131833 () Unit!8108)

(assert (=> b!261153 (= lt!131833 (addStillContains!235 lt!131814 lt!131831 (zeroValue!4649 thiss!1504) lt!131819))))

(assert (=> b!261153 (contains!1894 (+!701 lt!131814 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504))) lt!131819)))

(declare-fun lt!131816 () Unit!8108)

(assert (=> b!261153 (= lt!131816 lt!131833)))

(declare-fun lt!131822 () ListLongMap!3865)

(assert (=> b!261153 (= lt!131822 (getCurrentListMapNoExtraKeys!581 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131818 () (_ BitVec 64))

(assert (=> b!261153 (= lt!131818 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131829 () (_ BitVec 64))

(assert (=> b!261153 (= lt!131829 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131826 () Unit!8108)

(assert (=> b!261153 (= lt!131826 (addApplyDifferent!235 lt!131822 lt!131818 (minValue!4649 thiss!1504) lt!131829))))

(assert (=> b!261153 (= (apply!259 (+!701 lt!131822 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504))) lt!131829) (apply!259 lt!131822 lt!131829))))

(declare-fun lt!131815 () Unit!8108)

(assert (=> b!261153 (= lt!131815 lt!131826)))

(declare-fun lt!131824 () ListLongMap!3865)

(assert (=> b!261153 (= lt!131824 (getCurrentListMapNoExtraKeys!581 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131830 () (_ BitVec 64))

(assert (=> b!261153 (= lt!131830 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131813 () (_ BitVec 64))

(assert (=> b!261153 (= lt!131813 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!131823 () Unit!8108)

(assert (=> b!261153 (= lt!131823 (addApplyDifferent!235 lt!131824 lt!131830 (zeroValue!4649 thiss!1504) lt!131813))))

(assert (=> b!261153 (= (apply!259 (+!701 lt!131824 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504))) lt!131813) (apply!259 lt!131824 lt!131813))))

(declare-fun lt!131832 () Unit!8108)

(assert (=> b!261153 (= lt!131832 lt!131823)))

(declare-fun lt!131828 () ListLongMap!3865)

(assert (=> b!261153 (= lt!131828 (getCurrentListMapNoExtraKeys!581 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131821 () (_ BitVec 64))

(assert (=> b!261153 (= lt!131821 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131820 () (_ BitVec 64))

(assert (=> b!261153 (= lt!131820 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!261153 (= lt!131827 (addApplyDifferent!235 lt!131828 lt!131821 (minValue!4649 thiss!1504) lt!131820))))

(assert (=> b!261153 (= (apply!259 (+!701 lt!131828 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504))) lt!131820) (apply!259 lt!131828 lt!131820))))

(declare-fun b!261154 () Bool)

(declare-fun Unit!8118 () Unit!8108)

(assert (=> b!261154 (= e!169235 Unit!8118)))

(declare-fun b!261155 () Bool)

(declare-fun res!127631 () Bool)

(assert (=> b!261155 (=> (not res!127631) (not e!169231))))

(assert (=> b!261155 (= res!127631 e!169237)))

(declare-fun c!44430 () Bool)

(assert (=> b!261155 (= c!44430 (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!261156 () Bool)

(assert (=> b!261156 (= e!169237 (not call!24932))))

(declare-fun b!261157 () Bool)

(declare-fun e!169240 () Bool)

(assert (=> b!261157 (= e!169231 e!169240)))

(declare-fun c!44425 () Bool)

(assert (=> b!261157 (= c!44425 (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261158 () Bool)

(assert (=> b!261158 (= e!169230 (= (apply!259 lt!131834 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4649 thiss!1504)))))

(declare-fun bm!24933 () Bool)

(assert (=> bm!24933 (= call!24933 call!24931)))

(declare-fun b!261159 () Bool)

(declare-fun e!169234 () Bool)

(assert (=> b!261159 (= e!169234 e!169242)))

(declare-fun res!127624 () Bool)

(assert (=> b!261159 (=> (not res!127624) (not e!169242))))

(assert (=> b!261159 (= res!127624 (contains!1894 lt!131834 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!261160 () Bool)

(declare-fun res!127627 () Bool)

(assert (=> b!261160 (=> (not res!127627) (not e!169231))))

(assert (=> b!261160 (= res!127627 e!169234)))

(declare-fun res!127628 () Bool)

(assert (=> b!261160 (=> res!127628 e!169234)))

(assert (=> b!261160 (= res!127628 (not e!169232))))

(declare-fun res!127630 () Bool)

(assert (=> b!261160 (=> (not res!127630) (not e!169232))))

(assert (=> b!261160 (= res!127630 (bvslt #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun bm!24934 () Bool)

(declare-fun call!24936 () Bool)

(assert (=> bm!24934 (= call!24936 (contains!1894 lt!131834 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261161 () Bool)

(assert (=> b!261161 (= e!169236 (+!701 call!24931 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))

(declare-fun b!261162 () Bool)

(assert (=> b!261162 (= e!169240 e!169233)))

(declare-fun res!127632 () Bool)

(assert (=> b!261162 (= res!127632 call!24936)))

(assert (=> b!261162 (=> (not res!127632) (not e!169233))))

(declare-fun b!261163 () Bool)

(assert (=> b!261163 (= e!169240 (not call!24936))))

(assert (= (and d!62751 c!44429) b!261161))

(assert (= (and d!62751 (not c!44429)) b!261143))

(assert (= (and b!261143 c!44427) b!261144))

(assert (= (and b!261143 (not c!44427)) b!261149))

(assert (= (and b!261149 c!44428) b!261150))

(assert (= (and b!261149 (not c!44428)) b!261152))

(assert (= (or b!261150 b!261152) bm!24931))

(assert (= (or b!261144 bm!24931) bm!24928))

(assert (= (or b!261144 b!261150) bm!24933))

(assert (= (or b!261161 bm!24928) bm!24930))

(assert (= (or b!261161 bm!24933) bm!24929))

(assert (= (and d!62751 res!127626) b!261145))

(assert (= (and d!62751 c!44426) b!261153))

(assert (= (and d!62751 (not c!44426)) b!261154))

(assert (= (and d!62751 res!127625) b!261160))

(assert (= (and b!261160 res!127630) b!261148))

(assert (= (and b!261160 (not res!127628)) b!261159))

(assert (= (and b!261159 res!127624) b!261147))

(assert (= (and b!261160 res!127627) b!261155))

(assert (= (and b!261155 c!44430) b!261151))

(assert (= (and b!261155 (not c!44430)) b!261156))

(assert (= (and b!261151 res!127629) b!261158))

(assert (= (or b!261151 b!261156) bm!24932))

(assert (= (and b!261155 res!127631) b!261157))

(assert (= (and b!261157 c!44425) b!261162))

(assert (= (and b!261157 (not c!44425)) b!261163))

(assert (= (and b!261162 res!127632) b!261146))

(assert (= (or b!261162 b!261163) bm!24934))

(declare-fun b_lambda!8289 () Bool)

(assert (=> (not b_lambda!8289) (not b!261147)))

(assert (=> b!261147 t!8905))

(declare-fun b_and!13891 () Bool)

(assert (= b_and!13889 (and (=> t!8905 result!5415) b_and!13891)))

(declare-fun m!277031 () Bool)

(assert (=> b!261153 m!277031))

(declare-fun m!277033 () Bool)

(assert (=> b!261153 m!277033))

(declare-fun m!277035 () Bool)

(assert (=> b!261153 m!277035))

(declare-fun m!277037 () Bool)

(assert (=> b!261153 m!277037))

(declare-fun m!277039 () Bool)

(assert (=> b!261153 m!277039))

(assert (=> b!261153 m!277031))

(assert (=> b!261153 m!276893))

(declare-fun m!277041 () Bool)

(assert (=> b!261153 m!277041))

(declare-fun m!277043 () Bool)

(assert (=> b!261153 m!277043))

(declare-fun m!277045 () Bool)

(assert (=> b!261153 m!277045))

(declare-fun m!277047 () Bool)

(assert (=> b!261153 m!277047))

(declare-fun m!277049 () Bool)

(assert (=> b!261153 m!277049))

(declare-fun m!277051 () Bool)

(assert (=> b!261153 m!277051))

(assert (=> b!261153 m!277049))

(declare-fun m!277053 () Bool)

(assert (=> b!261153 m!277053))

(declare-fun m!277055 () Bool)

(assert (=> b!261153 m!277055))

(assert (=> b!261153 m!277045))

(declare-fun m!277057 () Bool)

(assert (=> b!261153 m!277057))

(assert (=> b!261153 m!277043))

(declare-fun m!277059 () Bool)

(assert (=> b!261153 m!277059))

(declare-fun m!277061 () Bool)

(assert (=> b!261153 m!277061))

(declare-fun m!277063 () Bool)

(assert (=> bm!24929 m!277063))

(declare-fun m!277065 () Bool)

(assert (=> bm!24932 m!277065))

(declare-fun m!277067 () Bool)

(assert (=> b!261161 m!277067))

(assert (=> bm!24930 m!277061))

(declare-fun m!277069 () Bool)

(assert (=> b!261147 m!277069))

(assert (=> b!261147 m!276893))

(assert (=> b!261147 m!276959))

(assert (=> b!261147 m!277069))

(assert (=> b!261147 m!276959))

(declare-fun m!277071 () Bool)

(assert (=> b!261147 m!277071))

(assert (=> b!261147 m!276893))

(declare-fun m!277073 () Bool)

(assert (=> b!261147 m!277073))

(declare-fun m!277075 () Bool)

(assert (=> b!261146 m!277075))

(assert (=> b!261159 m!276893))

(assert (=> b!261159 m!276893))

(declare-fun m!277077 () Bool)

(assert (=> b!261159 m!277077))

(assert (=> b!261145 m!276893))

(assert (=> b!261145 m!276893))

(assert (=> b!261145 m!276895))

(assert (=> d!62751 m!276785))

(assert (=> b!261148 m!276893))

(assert (=> b!261148 m!276893))

(assert (=> b!261148 m!276895))

(declare-fun m!277079 () Bool)

(assert (=> b!261158 m!277079))

(declare-fun m!277081 () Bool)

(assert (=> bm!24934 m!277081))

(assert (=> b!260873 d!62751))

(declare-fun d!62753 () Bool)

(declare-fun e!169245 () Bool)

(assert (=> d!62753 e!169245))

(declare-fun res!127638 () Bool)

(assert (=> d!62753 (=> (not res!127638) (not e!169245))))

(declare-fun lt!131839 () SeekEntryResult!1185)

(assert (=> d!62753 (= res!127638 ((_ is Found!1185) lt!131839))))

(assert (=> d!62753 (= lt!131839 (seekEntryOrOpen!0 key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(declare-fun lt!131840 () Unit!8108)

(declare-fun choose!1275 (array!12611 array!12609 (_ BitVec 32) (_ BitVec 32) V!8483 V!8483 (_ BitVec 64) Int) Unit!8108)

(assert (=> d!62753 (= lt!131840 (choose!1275 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 (defaultEntry!4808 thiss!1504)))))

(assert (=> d!62753 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62753 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!443 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 (defaultEntry!4808 thiss!1504)) lt!131840)))

(declare-fun b!261168 () Bool)

(declare-fun res!127637 () Bool)

(assert (=> b!261168 (=> (not res!127637) (not e!169245))))

(assert (=> b!261168 (= res!127637 (inRange!0 (index!6911 lt!131839) (mask!11145 thiss!1504)))))

(declare-fun b!261169 () Bool)

(assert (=> b!261169 (= e!169245 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6911 lt!131839)) key!932))))

(assert (=> b!261169 (and (bvsge (index!6911 lt!131839) #b00000000000000000000000000000000) (bvslt (index!6911 lt!131839) (size!6319 (_keys!6992 thiss!1504))))))

(assert (= (and d!62753 res!127638) b!261168))

(assert (= (and b!261168 res!127637) b!261169))

(assert (=> d!62753 m!276753))

(declare-fun m!277083 () Bool)

(assert (=> d!62753 m!277083))

(assert (=> d!62753 m!276785))

(declare-fun m!277085 () Bool)

(assert (=> b!261168 m!277085))

(declare-fun m!277087 () Bool)

(assert (=> b!261169 m!277087))

(assert (=> b!260865 d!62753))

(declare-fun b!261182 () Bool)

(declare-fun e!169253 () SeekEntryResult!1185)

(declare-fun lt!131847 () SeekEntryResult!1185)

(assert (=> b!261182 (= e!169253 (MissingZero!1185 (index!6912 lt!131847)))))

(declare-fun b!261183 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12611 (_ BitVec 32)) SeekEntryResult!1185)

(assert (=> b!261183 (= e!169253 (seekKeyOrZeroReturnVacant!0 (x!25149 lt!131847) (index!6912 lt!131847) (index!6912 lt!131847) key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(declare-fun b!261184 () Bool)

(declare-fun e!169252 () SeekEntryResult!1185)

(assert (=> b!261184 (= e!169252 Undefined!1185)))

(declare-fun d!62755 () Bool)

(declare-fun lt!131848 () SeekEntryResult!1185)

(assert (=> d!62755 (and (or ((_ is Undefined!1185) lt!131848) (not ((_ is Found!1185) lt!131848)) (and (bvsge (index!6911 lt!131848) #b00000000000000000000000000000000) (bvslt (index!6911 lt!131848) (size!6319 (_keys!6992 thiss!1504))))) (or ((_ is Undefined!1185) lt!131848) ((_ is Found!1185) lt!131848) (not ((_ is MissingZero!1185) lt!131848)) (and (bvsge (index!6910 lt!131848) #b00000000000000000000000000000000) (bvslt (index!6910 lt!131848) (size!6319 (_keys!6992 thiss!1504))))) (or ((_ is Undefined!1185) lt!131848) ((_ is Found!1185) lt!131848) ((_ is MissingZero!1185) lt!131848) (not ((_ is MissingVacant!1185) lt!131848)) (and (bvsge (index!6913 lt!131848) #b00000000000000000000000000000000) (bvslt (index!6913 lt!131848) (size!6319 (_keys!6992 thiss!1504))))) (or ((_ is Undefined!1185) lt!131848) (ite ((_ is Found!1185) lt!131848) (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6911 lt!131848)) key!932) (ite ((_ is MissingZero!1185) lt!131848) (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6910 lt!131848)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1185) lt!131848) (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6913 lt!131848)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62755 (= lt!131848 e!169252)))

(declare-fun c!44438 () Bool)

(assert (=> d!62755 (= c!44438 (and ((_ is Intermediate!1185) lt!131847) (undefined!1997 lt!131847)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12611 (_ BitVec 32)) SeekEntryResult!1185)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!62755 (= lt!131847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11145 thiss!1504)) key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(assert (=> d!62755 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62755 (= (seekEntryOrOpen!0 key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)) lt!131848)))

(declare-fun b!261185 () Bool)

(declare-fun c!44437 () Bool)

(declare-fun lt!131849 () (_ BitVec 64))

(assert (=> b!261185 (= c!44437 (= lt!131849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169254 () SeekEntryResult!1185)

(assert (=> b!261185 (= e!169254 e!169253)))

(declare-fun b!261186 () Bool)

(assert (=> b!261186 (= e!169254 (Found!1185 (index!6912 lt!131847)))))

(declare-fun b!261187 () Bool)

(assert (=> b!261187 (= e!169252 e!169254)))

(assert (=> b!261187 (= lt!131849 (select (arr!5969 (_keys!6992 thiss!1504)) (index!6912 lt!131847)))))

(declare-fun c!44439 () Bool)

(assert (=> b!261187 (= c!44439 (= lt!131849 key!932))))

(assert (= (and d!62755 c!44438) b!261184))

(assert (= (and d!62755 (not c!44438)) b!261187))

(assert (= (and b!261187 c!44439) b!261186))

(assert (= (and b!261187 (not c!44439)) b!261185))

(assert (= (and b!261185 c!44437) b!261182))

(assert (= (and b!261185 (not c!44437)) b!261183))

(declare-fun m!277089 () Bool)

(assert (=> b!261183 m!277089))

(declare-fun m!277091 () Bool)

(assert (=> d!62755 m!277091))

(declare-fun m!277093 () Bool)

(assert (=> d!62755 m!277093))

(declare-fun m!277095 () Bool)

(assert (=> d!62755 m!277095))

(assert (=> d!62755 m!276785))

(assert (=> d!62755 m!277091))

(declare-fun m!277097 () Bool)

(assert (=> d!62755 m!277097))

(declare-fun m!277099 () Bool)

(assert (=> d!62755 m!277099))

(declare-fun m!277101 () Bool)

(assert (=> b!261187 m!277101))

(assert (=> b!260882 d!62755))

(declare-fun b!261194 () Bool)

(declare-fun e!169260 () Bool)

(assert (=> b!261194 (= e!169260 tp_is_empty!6627)))

(declare-fun b!261195 () Bool)

(declare-fun e!169259 () Bool)

(assert (=> b!261195 (= e!169259 tp_is_empty!6627)))

(declare-fun mapNonEmpty!11301 () Bool)

(declare-fun mapRes!11301 () Bool)

(declare-fun tp!23631 () Bool)

(assert (=> mapNonEmpty!11301 (= mapRes!11301 (and tp!23631 e!169260))))

(declare-fun mapValue!11301 () ValueCell!2970)

(declare-fun mapKey!11301 () (_ BitVec 32))

(declare-fun mapRest!11301 () (Array (_ BitVec 32) ValueCell!2970))

(assert (=> mapNonEmpty!11301 (= mapRest!11295 (store mapRest!11301 mapKey!11301 mapValue!11301))))

(declare-fun condMapEmpty!11301 () Bool)

(declare-fun mapDefault!11301 () ValueCell!2970)

(assert (=> mapNonEmpty!11295 (= condMapEmpty!11301 (= mapRest!11295 ((as const (Array (_ BitVec 32) ValueCell!2970)) mapDefault!11301)))))

(assert (=> mapNonEmpty!11295 (= tp!23622 (and e!169259 mapRes!11301))))

(declare-fun mapIsEmpty!11301 () Bool)

(assert (=> mapIsEmpty!11301 mapRes!11301))

(assert (= (and mapNonEmpty!11295 condMapEmpty!11301) mapIsEmpty!11301))

(assert (= (and mapNonEmpty!11295 (not condMapEmpty!11301)) mapNonEmpty!11301))

(assert (= (and mapNonEmpty!11301 ((_ is ValueCellFull!2970) mapValue!11301)) b!261194))

(assert (= (and mapNonEmpty!11295 ((_ is ValueCellFull!2970) mapDefault!11301)) b!261195))

(declare-fun m!277103 () Bool)

(assert (=> mapNonEmpty!11301 m!277103))

(declare-fun b_lambda!8291 () Bool)

(assert (= b_lambda!8289 (or (and b!260867 b_free!6765) b_lambda!8291)))

(declare-fun b_lambda!8293 () Bool)

(assert (= b_lambda!8287 (or (and b!260867 b_free!6765) b_lambda!8293)))

(check-sat (not b!260954) (not b_next!6765) (not b!260988) (not b!261066) (not b!261063) (not bm!24896) (not bm!24912) (not d!62743) (not b!261058) (not d!62753) (not d!62705) (not b!261105) (not d!62755) (not b!260990) (not d!62745) (not d!62727) (not bm!24927) (not b!261052) (not b!260956) (not bm!24893) (not d!62723) (not bm!24913) (not d!62719) (not b!261064) (not bm!24915) (not bm!24921) (not b!261003) (not b!261075) (not bm!24892) (not b!261083) (not b!261140) (not d!62751) (not b!261147) (not d!62749) (not bm!24918) (not d!62711) (not b!261161) tp_is_empty!6627 (not b!261142) (not bm!24929) (not b!260978) b_and!13891 (not b!261146) (not d!62729) (not b!261153) (not b_lambda!8291) (not b!261005) (not b!261107) (not b!261078) (not b!260968) (not b!260993) (not b!261050) (not b!261183) (not d!62731) (not b!261093) (not b!260955) (not b!261094) (not d!62721) (not bm!24930) (not b!261051) (not d!62735) (not b!261053) (not bm!24934) (not b!260974) (not b_lambda!8293) (not bm!24926) (not b!261168) (not b!261158) (not b!261108) (not mapNonEmpty!11301) (not b!261002) (not bm!24917) (not b!261145) (not b!261088) (not b!261072) (not bm!24932) (not b!261148) (not b!261159))
(check-sat b_and!13891 (not b_next!6765))
(get-model)

(declare-fun d!62757 () Bool)

(declare-fun lt!131852 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!174 (List!3830) (InoxSet tuple2!4952))

(assert (=> d!62757 (= lt!131852 (select (content!174 (toList!1948 lt!131791)) (tuple2!4953 key!932 v!346)))))

(declare-fun e!169266 () Bool)

(assert (=> d!62757 (= lt!131852 e!169266)))

(declare-fun res!127643 () Bool)

(assert (=> d!62757 (=> (not res!127643) (not e!169266))))

(assert (=> d!62757 (= res!127643 ((_ is Cons!3826) (toList!1948 lt!131791)))))

(assert (=> d!62757 (= (contains!1896 (toList!1948 lt!131791) (tuple2!4953 key!932 v!346)) lt!131852)))

(declare-fun b!261200 () Bool)

(declare-fun e!169265 () Bool)

(assert (=> b!261200 (= e!169266 e!169265)))

(declare-fun res!127644 () Bool)

(assert (=> b!261200 (=> res!127644 e!169265)))

(assert (=> b!261200 (= res!127644 (= (h!4491 (toList!1948 lt!131791)) (tuple2!4953 key!932 v!346)))))

(declare-fun b!261201 () Bool)

(assert (=> b!261201 (= e!169265 (contains!1896 (t!8901 (toList!1948 lt!131791)) (tuple2!4953 key!932 v!346)))))

(assert (= (and d!62757 res!127643) b!261200))

(assert (= (and b!261200 (not res!127644)) b!261201))

(declare-fun m!277105 () Bool)

(assert (=> d!62757 m!277105))

(declare-fun m!277107 () Bool)

(assert (=> d!62757 m!277107))

(declare-fun m!277109 () Bool)

(assert (=> b!261201 m!277109))

(assert (=> b!261094 d!62757))

(declare-fun d!62759 () Bool)

(assert (=> d!62759 (= (validKeyInArray!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)) (and (not (= (select (arr!5969 lt!131631) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5969 lt!131631) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261108 d!62759))

(declare-fun d!62761 () Bool)

(declare-fun e!169267 () Bool)

(assert (=> d!62761 e!169267))

(declare-fun res!127645 () Bool)

(assert (=> d!62761 (=> (not res!127645) (not e!169267))))

(declare-fun lt!131856 () ListLongMap!3865)

(assert (=> d!62761 (= res!127645 (contains!1894 lt!131856 (_1!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun lt!131853 () List!3830)

(assert (=> d!62761 (= lt!131856 (ListLongMap!3866 lt!131853))))

(declare-fun lt!131854 () Unit!8108)

(declare-fun lt!131855 () Unit!8108)

(assert (=> d!62761 (= lt!131854 lt!131855)))

(assert (=> d!62761 (= (getValueByKey!317 lt!131853 (_1!2487 (tuple2!4953 key!932 v!346))) (Some!322 (_2!2487 (tuple2!4953 key!932 v!346))))))

(assert (=> d!62761 (= lt!131855 (lemmaContainsTupThenGetReturnValue!173 lt!131853 (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346))))))

(assert (=> d!62761 (= lt!131853 (insertStrictlySorted!176 (toList!1948 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504))) (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346))))))

(assert (=> d!62761 (= (+!701 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) (tuple2!4953 key!932 v!346)) lt!131856)))

(declare-fun b!261202 () Bool)

(declare-fun res!127646 () Bool)

(assert (=> b!261202 (=> (not res!127646) (not e!169267))))

(assert (=> b!261202 (= res!127646 (= (getValueByKey!317 (toList!1948 lt!131856) (_1!2487 (tuple2!4953 key!932 v!346))) (Some!322 (_2!2487 (tuple2!4953 key!932 v!346)))))))

(declare-fun b!261203 () Bool)

(assert (=> b!261203 (= e!169267 (contains!1896 (toList!1948 lt!131856) (tuple2!4953 key!932 v!346)))))

(assert (= (and d!62761 res!127645) b!261202))

(assert (= (and b!261202 res!127646) b!261203))

(declare-fun m!277111 () Bool)

(assert (=> d!62761 m!277111))

(declare-fun m!277113 () Bool)

(assert (=> d!62761 m!277113))

(declare-fun m!277115 () Bool)

(assert (=> d!62761 m!277115))

(declare-fun m!277117 () Bool)

(assert (=> d!62761 m!277117))

(declare-fun m!277119 () Bool)

(assert (=> b!261202 m!277119))

(declare-fun m!277121 () Bool)

(assert (=> b!261203 m!277121))

(assert (=> b!261078 d!62761))

(assert (=> b!261078 d!62751))

(declare-fun bm!24935 () Bool)

(declare-fun call!24942 () ListLongMap!3865)

(declare-fun call!24944 () ListLongMap!3865)

(assert (=> bm!24935 (= call!24942 call!24944)))

(declare-fun d!62763 () Bool)

(declare-fun e!169269 () Bool)

(assert (=> d!62763 e!169269))

(declare-fun res!127648 () Bool)

(assert (=> d!62763 (=> (not res!127648) (not e!169269))))

(assert (=> d!62763 (= res!127648 (or (bvsge #b00000000000000000000000000000000 (size!6319 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))))))))))

(declare-fun lt!131878 () ListLongMap!3865)

(declare-fun lt!131869 () ListLongMap!3865)

(assert (=> d!62763 (= lt!131878 lt!131869)))

(declare-fun lt!131861 () Unit!8108)

(declare-fun e!169273 () Unit!8108)

(assert (=> d!62763 (= lt!131861 e!169273)))

(declare-fun c!44441 () Bool)

(declare-fun e!169279 () Bool)

(assert (=> d!62763 (= c!44441 e!169279)))

(declare-fun res!127649 () Bool)

(assert (=> d!62763 (=> (not res!127649) (not e!169279))))

(assert (=> d!62763 (= res!127649 (bvslt #b00000000000000000000000000000000 (size!6319 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))))))))

(declare-fun e!169274 () ListLongMap!3865)

(assert (=> d!62763 (= lt!131869 e!169274)))

(declare-fun c!44444 () Bool)

(assert (=> d!62763 (= c!44444 (and (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!62763 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62763 (= (getCurrentListMap!1476 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) lt!131878)))

(declare-fun c!44442 () Bool)

(declare-fun bm!24936 () Bool)

(declare-fun call!24938 () ListLongMap!3865)

(declare-fun call!24941 () ListLongMap!3865)

(assert (=> bm!24936 (= call!24938 (+!701 (ite c!44444 call!24944 (ite c!44442 call!24942 call!24941)) (ite (or c!44444 c!44442) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(declare-fun b!261204 () Bool)

(declare-fun e!169277 () ListLongMap!3865)

(assert (=> b!261204 (= e!169274 e!169277)))

(assert (=> b!261204 (= c!44442 (and (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261205 () Bool)

(declare-fun call!24940 () ListLongMap!3865)

(assert (=> b!261205 (= e!169277 call!24940)))

(declare-fun bm!24937 () Bool)

(assert (=> bm!24937 (= call!24944 (getCurrentListMapNoExtraKeys!581 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun b!261206 () Bool)

(assert (=> b!261206 (= e!169279 (validKeyInArray!0 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!24938 () Bool)

(assert (=> bm!24938 (= call!24941 call!24942)))

(declare-fun b!261207 () Bool)

(declare-fun e!169271 () Bool)

(assert (=> b!261207 (= e!169271 (= (apply!259 lt!131878 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4649 thiss!1504)))))

(declare-fun bm!24939 () Bool)

(declare-fun call!24939 () Bool)

(assert (=> bm!24939 (= call!24939 (contains!1894 lt!131878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261208 () Bool)

(declare-fun e!169280 () Bool)

(assert (=> b!261208 (= e!169280 (= (apply!259 lt!131878 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000)) (get!3077 (select (arr!5968 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261208 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6318 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))))))))

(assert (=> b!261208 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))))))))

(declare-fun b!261209 () Bool)

(declare-fun e!169270 () Bool)

(assert (=> b!261209 (= e!169270 (validKeyInArray!0 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261210 () Bool)

(declare-fun c!44443 () Bool)

(assert (=> b!261210 (= c!44443 (and (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!169276 () ListLongMap!3865)

(assert (=> b!261210 (= e!169277 e!169276)))

(declare-fun b!261211 () Bool)

(assert (=> b!261211 (= e!169276 call!24940)))

(declare-fun b!261212 () Bool)

(declare-fun e!169275 () Bool)

(declare-fun e!169268 () Bool)

(assert (=> b!261212 (= e!169275 e!169268)))

(declare-fun res!127652 () Bool)

(assert (=> b!261212 (= res!127652 call!24939)))

(assert (=> b!261212 (=> (not res!127652) (not e!169268))))

(declare-fun b!261213 () Bool)

(assert (=> b!261213 (= e!169276 call!24941)))

(declare-fun b!261214 () Bool)

(declare-fun lt!131871 () Unit!8108)

(assert (=> b!261214 (= e!169273 lt!131871)))

(declare-fun lt!131858 () ListLongMap!3865)

(assert (=> b!261214 (= lt!131858 (getCurrentListMapNoExtraKeys!581 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131875 () (_ BitVec 64))

(assert (=> b!261214 (= lt!131875 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131863 () (_ BitVec 64))

(assert (=> b!261214 (= lt!131863 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131877 () Unit!8108)

(assert (=> b!261214 (= lt!131877 (addStillContains!235 lt!131858 lt!131875 (zeroValue!4649 thiss!1504) lt!131863))))

(assert (=> b!261214 (contains!1894 (+!701 lt!131858 (tuple2!4953 lt!131875 (zeroValue!4649 thiss!1504))) lt!131863)))

(declare-fun lt!131860 () Unit!8108)

(assert (=> b!261214 (= lt!131860 lt!131877)))

(declare-fun lt!131866 () ListLongMap!3865)

(assert (=> b!261214 (= lt!131866 (getCurrentListMapNoExtraKeys!581 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131862 () (_ BitVec 64))

(assert (=> b!261214 (= lt!131862 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131873 () (_ BitVec 64))

(assert (=> b!261214 (= lt!131873 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131870 () Unit!8108)

(assert (=> b!261214 (= lt!131870 (addApplyDifferent!235 lt!131866 lt!131862 (minValue!4649 thiss!1504) lt!131873))))

(assert (=> b!261214 (= (apply!259 (+!701 lt!131866 (tuple2!4953 lt!131862 (minValue!4649 thiss!1504))) lt!131873) (apply!259 lt!131866 lt!131873))))

(declare-fun lt!131859 () Unit!8108)

(assert (=> b!261214 (= lt!131859 lt!131870)))

(declare-fun lt!131868 () ListLongMap!3865)

(assert (=> b!261214 (= lt!131868 (getCurrentListMapNoExtraKeys!581 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131874 () (_ BitVec 64))

(assert (=> b!261214 (= lt!131874 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131857 () (_ BitVec 64))

(assert (=> b!261214 (= lt!131857 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!131867 () Unit!8108)

(assert (=> b!261214 (= lt!131867 (addApplyDifferent!235 lt!131868 lt!131874 (zeroValue!4649 thiss!1504) lt!131857))))

(assert (=> b!261214 (= (apply!259 (+!701 lt!131868 (tuple2!4953 lt!131874 (zeroValue!4649 thiss!1504))) lt!131857) (apply!259 lt!131868 lt!131857))))

(declare-fun lt!131876 () Unit!8108)

(assert (=> b!261214 (= lt!131876 lt!131867)))

(declare-fun lt!131872 () ListLongMap!3865)

(assert (=> b!261214 (= lt!131872 (getCurrentListMapNoExtraKeys!581 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(declare-fun lt!131865 () (_ BitVec 64))

(assert (=> b!261214 (= lt!131865 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!131864 () (_ BitVec 64))

(assert (=> b!261214 (= lt!131864 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!261214 (= lt!131871 (addApplyDifferent!235 lt!131872 lt!131865 (minValue!4649 thiss!1504) lt!131864))))

(assert (=> b!261214 (= (apply!259 (+!701 lt!131872 (tuple2!4953 lt!131865 (minValue!4649 thiss!1504))) lt!131864) (apply!259 lt!131872 lt!131864))))

(declare-fun b!261215 () Bool)

(declare-fun Unit!8119 () Unit!8108)

(assert (=> b!261215 (= e!169273 Unit!8119)))

(declare-fun b!261216 () Bool)

(declare-fun res!127654 () Bool)

(assert (=> b!261216 (=> (not res!127654) (not e!169269))))

(assert (=> b!261216 (= res!127654 e!169275)))

(declare-fun c!44445 () Bool)

(assert (=> b!261216 (= c!44445 (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!261217 () Bool)

(assert (=> b!261217 (= e!169275 (not call!24939))))

(declare-fun b!261218 () Bool)

(declare-fun e!169278 () Bool)

(assert (=> b!261218 (= e!169269 e!169278)))

(declare-fun c!44440 () Bool)

(assert (=> b!261218 (= c!44440 (not (= (bvand (extraKeys!4545 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!261219 () Bool)

(assert (=> b!261219 (= e!169268 (= (apply!259 lt!131878 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4649 thiss!1504)))))

(declare-fun bm!24940 () Bool)

(assert (=> bm!24940 (= call!24940 call!24938)))

(declare-fun b!261220 () Bool)

(declare-fun e!169272 () Bool)

(assert (=> b!261220 (= e!169272 e!169280)))

(declare-fun res!127647 () Bool)

(assert (=> b!261220 (=> (not res!127647) (not e!169280))))

(assert (=> b!261220 (= res!127647 (contains!1894 lt!131878 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!261220 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))))))))

(declare-fun b!261221 () Bool)

(declare-fun res!127650 () Bool)

(assert (=> b!261221 (=> (not res!127650) (not e!169269))))

(assert (=> b!261221 (= res!127650 e!169272)))

(declare-fun res!127651 () Bool)

(assert (=> b!261221 (=> res!127651 e!169272)))

(assert (=> b!261221 (= res!127651 (not e!169270))))

(declare-fun res!127653 () Bool)

(assert (=> b!261221 (=> (not res!127653) (not e!169270))))

(assert (=> b!261221 (= res!127653 (bvslt #b00000000000000000000000000000000 (size!6319 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))))))))

(declare-fun bm!24941 () Bool)

(declare-fun call!24943 () Bool)

(assert (=> bm!24941 (= call!24943 (contains!1894 lt!131878 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261222 () Bool)

(assert (=> b!261222 (= e!169274 (+!701 call!24938 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))

(declare-fun b!261223 () Bool)

(assert (=> b!261223 (= e!169278 e!169271)))

(declare-fun res!127655 () Bool)

(assert (=> b!261223 (= res!127655 call!24943)))

(assert (=> b!261223 (=> (not res!127655) (not e!169271))))

(declare-fun b!261224 () Bool)

(assert (=> b!261224 (= e!169278 (not call!24943))))

(assert (= (and d!62763 c!44444) b!261222))

(assert (= (and d!62763 (not c!44444)) b!261204))

(assert (= (and b!261204 c!44442) b!261205))

(assert (= (and b!261204 (not c!44442)) b!261210))

(assert (= (and b!261210 c!44443) b!261211))

(assert (= (and b!261210 (not c!44443)) b!261213))

(assert (= (or b!261211 b!261213) bm!24938))

(assert (= (or b!261205 bm!24938) bm!24935))

(assert (= (or b!261205 b!261211) bm!24940))

(assert (= (or b!261222 bm!24935) bm!24937))

(assert (= (or b!261222 bm!24940) bm!24936))

(assert (= (and d!62763 res!127649) b!261206))

(assert (= (and d!62763 c!44441) b!261214))

(assert (= (and d!62763 (not c!44441)) b!261215))

(assert (= (and d!62763 res!127648) b!261221))

(assert (= (and b!261221 res!127653) b!261209))

(assert (= (and b!261221 (not res!127651)) b!261220))

(assert (= (and b!261220 res!127647) b!261208))

(assert (= (and b!261221 res!127650) b!261216))

(assert (= (and b!261216 c!44445) b!261212))

(assert (= (and b!261216 (not c!44445)) b!261217))

(assert (= (and b!261212 res!127652) b!261219))

(assert (= (or b!261212 b!261217) bm!24939))

(assert (= (and b!261216 res!127654) b!261218))

(assert (= (and b!261218 c!44440) b!261223))

(assert (= (and b!261218 (not c!44440)) b!261224))

(assert (= (and b!261223 res!127655) b!261207))

(assert (= (or b!261223 b!261224) bm!24941))

(declare-fun b_lambda!8295 () Bool)

(assert (=> (not b_lambda!8295) (not b!261208)))

(assert (=> b!261208 t!8905))

(declare-fun b_and!13893 () Bool)

(assert (= b_and!13891 (and (=> t!8905 result!5415) b_and!13893)))

(declare-fun m!277123 () Bool)

(assert (=> b!261214 m!277123))

(declare-fun m!277125 () Bool)

(assert (=> b!261214 m!277125))

(declare-fun m!277127 () Bool)

(assert (=> b!261214 m!277127))

(declare-fun m!277129 () Bool)

(assert (=> b!261214 m!277129))

(declare-fun m!277131 () Bool)

(assert (=> b!261214 m!277131))

(assert (=> b!261214 m!277123))

(declare-fun m!277133 () Bool)

(assert (=> b!261214 m!277133))

(declare-fun m!277135 () Bool)

(assert (=> b!261214 m!277135))

(declare-fun m!277137 () Bool)

(assert (=> b!261214 m!277137))

(declare-fun m!277139 () Bool)

(assert (=> b!261214 m!277139))

(declare-fun m!277141 () Bool)

(assert (=> b!261214 m!277141))

(declare-fun m!277143 () Bool)

(assert (=> b!261214 m!277143))

(declare-fun m!277145 () Bool)

(assert (=> b!261214 m!277145))

(assert (=> b!261214 m!277143))

(declare-fun m!277147 () Bool)

(assert (=> b!261214 m!277147))

(declare-fun m!277149 () Bool)

(assert (=> b!261214 m!277149))

(assert (=> b!261214 m!277139))

(declare-fun m!277151 () Bool)

(assert (=> b!261214 m!277151))

(assert (=> b!261214 m!277137))

(declare-fun m!277153 () Bool)

(assert (=> b!261214 m!277153))

(declare-fun m!277155 () Bool)

(assert (=> b!261214 m!277155))

(declare-fun m!277157 () Bool)

(assert (=> bm!24936 m!277157))

(declare-fun m!277159 () Bool)

(assert (=> bm!24939 m!277159))

(declare-fun m!277161 () Bool)

(assert (=> b!261222 m!277161))

(assert (=> bm!24937 m!277155))

(assert (=> b!261208 m!276957))

(assert (=> b!261208 m!277133))

(assert (=> b!261208 m!276959))

(assert (=> b!261208 m!276957))

(assert (=> b!261208 m!276959))

(assert (=> b!261208 m!276961))

(assert (=> b!261208 m!277133))

(declare-fun m!277163 () Bool)

(assert (=> b!261208 m!277163))

(declare-fun m!277165 () Bool)

(assert (=> b!261207 m!277165))

(assert (=> b!261220 m!277133))

(assert (=> b!261220 m!277133))

(declare-fun m!277167 () Bool)

(assert (=> b!261220 m!277167))

(assert (=> b!261206 m!277133))

(assert (=> b!261206 m!277133))

(declare-fun m!277169 () Bool)

(assert (=> b!261206 m!277169))

(assert (=> d!62763 m!276785))

(assert (=> b!261209 m!277133))

(assert (=> b!261209 m!277133))

(assert (=> b!261209 m!277169))

(declare-fun m!277171 () Bool)

(assert (=> b!261219 m!277171))

(declare-fun m!277173 () Bool)

(assert (=> bm!24941 m!277173))

(assert (=> b!261078 d!62763))

(declare-fun d!62765 () Bool)

(declare-fun get!3078 (Option!323) V!8483)

(assert (=> d!62765 (= (apply!259 lt!131769 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)) (get!3078 (getValueByKey!317 (toList!1948 lt!131769) (select (arr!5969 lt!131631) #b00000000000000000000000000000000))))))

(declare-fun bs!9199 () Bool)

(assert (= bs!9199 d!62765))

(assert (=> bs!9199 m!276883))

(declare-fun m!277175 () Bool)

(assert (=> bs!9199 m!277175))

(assert (=> bs!9199 m!277175))

(declare-fun m!277177 () Bool)

(assert (=> bs!9199 m!277177))

(assert (=> b!261052 d!62765))

(declare-fun c!44448 () Bool)

(declare-fun d!62767 () Bool)

(assert (=> d!62767 (= c!44448 ((_ is ValueCellFull!2970) (select (arr!5968 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!169283 () V!8483)

(assert (=> d!62767 (= (get!3077 (select (arr!5968 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!169283)))

(declare-fun b!261229 () Bool)

(declare-fun get!3079 (ValueCell!2970 V!8483) V!8483)

(assert (=> b!261229 (= e!169283 (get!3079 (select (arr!5968 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261230 () Bool)

(declare-fun get!3080 (ValueCell!2970 V!8483) V!8483)

(assert (=> b!261230 (= e!169283 (get!3080 (select (arr!5968 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62767 c!44448) b!261229))

(assert (= (and d!62767 (not c!44448)) b!261230))

(assert (=> b!261229 m!276957))

(assert (=> b!261229 m!276959))

(declare-fun m!277179 () Bool)

(assert (=> b!261229 m!277179))

(assert (=> b!261230 m!276957))

(assert (=> b!261230 m!276959))

(declare-fun m!277181 () Bool)

(assert (=> b!261230 m!277181))

(assert (=> b!261052 d!62767))

(declare-fun b!261249 () Bool)

(declare-fun lt!131884 () SeekEntryResult!1185)

(assert (=> b!261249 (and (bvsge (index!6912 lt!131884) #b00000000000000000000000000000000) (bvslt (index!6912 lt!131884) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun e!169294 () Bool)

(assert (=> b!261249 (= e!169294 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6912 lt!131884)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261250 () Bool)

(declare-fun e!169295 () SeekEntryResult!1185)

(assert (=> b!261250 (= e!169295 (Intermediate!1185 false (toIndex!0 key!932 (mask!11145 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!62769 () Bool)

(declare-fun e!169297 () Bool)

(assert (=> d!62769 e!169297))

(declare-fun c!44457 () Bool)

(assert (=> d!62769 (= c!44457 (and ((_ is Intermediate!1185) lt!131884) (undefined!1997 lt!131884)))))

(declare-fun e!169296 () SeekEntryResult!1185)

(assert (=> d!62769 (= lt!131884 e!169296)))

(declare-fun c!44456 () Bool)

(assert (=> d!62769 (= c!44456 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!131883 () (_ BitVec 64))

(assert (=> d!62769 (= lt!131883 (select (arr!5969 (_keys!6992 thiss!1504)) (toIndex!0 key!932 (mask!11145 thiss!1504))))))

(assert (=> d!62769 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11145 thiss!1504)) key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)) lt!131884)))

(declare-fun b!261251 () Bool)

(assert (=> b!261251 (= e!169297 (bvsge (x!25149 lt!131884) #b01111111111111111111111111111110))))

(declare-fun b!261252 () Bool)

(assert (=> b!261252 (and (bvsge (index!6912 lt!131884) #b00000000000000000000000000000000) (bvslt (index!6912 lt!131884) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun res!127663 () Bool)

(assert (=> b!261252 (= res!127663 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6912 lt!131884)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261252 (=> res!127663 e!169294)))

(declare-fun b!261253 () Bool)

(assert (=> b!261253 (and (bvsge (index!6912 lt!131884) #b00000000000000000000000000000000) (bvslt (index!6912 lt!131884) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun res!127664 () Bool)

(assert (=> b!261253 (= res!127664 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6912 lt!131884)) key!932))))

(assert (=> b!261253 (=> res!127664 e!169294)))

(declare-fun e!169298 () Bool)

(assert (=> b!261253 (= e!169298 e!169294)))

(declare-fun b!261254 () Bool)

(assert (=> b!261254 (= e!169296 e!169295)))

(declare-fun c!44455 () Bool)

(assert (=> b!261254 (= c!44455 (or (= lt!131883 key!932) (= (bvadd lt!131883 lt!131883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261255 () Bool)

(assert (=> b!261255 (= e!169297 e!169298)))

(declare-fun res!127662 () Bool)

(assert (=> b!261255 (= res!127662 (and ((_ is Intermediate!1185) lt!131884) (not (undefined!1997 lt!131884)) (bvslt (x!25149 lt!131884) #b01111111111111111111111111111110) (bvsge (x!25149 lt!131884) #b00000000000000000000000000000000) (bvsge (x!25149 lt!131884) #b00000000000000000000000000000000)))))

(assert (=> b!261255 (=> (not res!127662) (not e!169298))))

(declare-fun b!261256 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261256 (= e!169295 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11145 thiss!1504)) #b00000000000000000000000000000000 (mask!11145 thiss!1504)) key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(declare-fun b!261257 () Bool)

(assert (=> b!261257 (= e!169296 (Intermediate!1185 true (toIndex!0 key!932 (mask!11145 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!62769 c!44456) b!261257))

(assert (= (and d!62769 (not c!44456)) b!261254))

(assert (= (and b!261254 c!44455) b!261250))

(assert (= (and b!261254 (not c!44455)) b!261256))

(assert (= (and d!62769 c!44457) b!261251))

(assert (= (and d!62769 (not c!44457)) b!261255))

(assert (= (and b!261255 res!127662) b!261253))

(assert (= (and b!261253 (not res!127664)) b!261252))

(assert (= (and b!261252 (not res!127663)) b!261249))

(declare-fun m!277183 () Bool)

(assert (=> b!261249 m!277183))

(assert (=> b!261256 m!277091))

(declare-fun m!277185 () Bool)

(assert (=> b!261256 m!277185))

(assert (=> b!261256 m!277185))

(declare-fun m!277187 () Bool)

(assert (=> b!261256 m!277187))

(assert (=> b!261252 m!277183))

(assert (=> b!261253 m!277183))

(assert (=> d!62769 m!277091))

(declare-fun m!277189 () Bool)

(assert (=> d!62769 m!277189))

(assert (=> d!62769 m!276785))

(assert (=> d!62755 d!62769))

(declare-fun d!62771 () Bool)

(declare-fun lt!131890 () (_ BitVec 32))

(declare-fun lt!131889 () (_ BitVec 32))

(assert (=> d!62771 (= lt!131890 (bvmul (bvxor lt!131889 (bvlshr lt!131889 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!62771 (= lt!131889 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!62771 (and (bvsge (mask!11145 thiss!1504) #b00000000000000000000000000000000) (let ((res!127665 (let ((h!4494 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25166 (bvmul (bvxor h!4494 (bvlshr h!4494 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25166 (bvlshr x!25166 #b00000000000000000000000000001101)) (mask!11145 thiss!1504)))))) (and (bvslt res!127665 (bvadd (mask!11145 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!127665 #b00000000000000000000000000000000))))))

(assert (=> d!62771 (= (toIndex!0 key!932 (mask!11145 thiss!1504)) (bvand (bvxor lt!131890 (bvlshr lt!131890 #b00000000000000000000000000001101)) (mask!11145 thiss!1504)))))

(assert (=> d!62755 d!62771))

(assert (=> d!62755 d!62715))

(declare-fun d!62773 () Bool)

(assert (=> d!62773 (= (apply!259 lt!131769 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3078 (getValueByKey!317 (toList!1948 lt!131769) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9200 () Bool)

(assert (= bs!9200 d!62773))

(declare-fun m!277191 () Bool)

(assert (=> bs!9200 m!277191))

(assert (=> bs!9200 m!277191))

(declare-fun m!277193 () Bool)

(assert (=> bs!9200 m!277193))

(assert (=> b!261051 d!62773))

(declare-fun d!62775 () Bool)

(declare-fun e!169299 () Bool)

(assert (=> d!62775 e!169299))

(declare-fun res!127666 () Bool)

(assert (=> d!62775 (=> res!127666 e!169299)))

(declare-fun lt!131892 () Bool)

(assert (=> d!62775 (= res!127666 (not lt!131892))))

(declare-fun lt!131891 () Bool)

(assert (=> d!62775 (= lt!131892 lt!131891)))

(declare-fun lt!131893 () Unit!8108)

(declare-fun e!169300 () Unit!8108)

(assert (=> d!62775 (= lt!131893 e!169300)))

(declare-fun c!44458 () Bool)

(assert (=> d!62775 (= c!44458 lt!131891)))

(assert (=> d!62775 (= lt!131891 (containsKey!309 (toList!1948 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504))) key!932))))

(assert (=> d!62775 (= (contains!1894 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) key!932) lt!131892)))

(declare-fun b!261258 () Bool)

(declare-fun lt!131894 () Unit!8108)

(assert (=> b!261258 (= e!169300 lt!131894)))

(assert (=> b!261258 (= lt!131894 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504))) key!932))))

(assert (=> b!261258 (isDefined!258 (getValueByKey!317 (toList!1948 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504))) key!932))))

(declare-fun b!261259 () Bool)

(declare-fun Unit!8120 () Unit!8108)

(assert (=> b!261259 (= e!169300 Unit!8120)))

(declare-fun b!261260 () Bool)

(assert (=> b!261260 (= e!169299 (isDefined!258 (getValueByKey!317 (toList!1948 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504))) key!932)))))

(assert (= (and d!62775 c!44458) b!261258))

(assert (= (and d!62775 (not c!44458)) b!261259))

(assert (= (and d!62775 (not res!127666)) b!261260))

(declare-fun m!277195 () Bool)

(assert (=> d!62775 m!277195))

(declare-fun m!277197 () Bool)

(assert (=> b!261258 m!277197))

(declare-fun m!277199 () Bool)

(assert (=> b!261258 m!277199))

(assert (=> b!261258 m!277199))

(declare-fun m!277201 () Bool)

(assert (=> b!261258 m!277201))

(assert (=> b!261260 m!277199))

(assert (=> b!261260 m!277199))

(assert (=> b!261260 m!277201))

(assert (=> d!62743 d!62775))

(assert (=> d!62743 d!62751))

(declare-fun d!62777 () Bool)

(assert (=> d!62777 (contains!1894 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) key!932)))

(assert (=> d!62777 true))

(declare-fun _$17!92 () Unit!8108)

(assert (=> d!62777 (= (choose!1273 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) _$17!92)))

(declare-fun bs!9201 () Bool)

(assert (= bs!9201 d!62777))

(assert (=> bs!9201 m!276803))

(assert (=> bs!9201 m!276803))

(assert (=> bs!9201 m!277011))

(assert (=> d!62743 d!62777))

(assert (=> d!62743 d!62715))

(declare-fun d!62779 () Bool)

(declare-fun e!169301 () Bool)

(assert (=> d!62779 e!169301))

(declare-fun res!127667 () Bool)

(assert (=> d!62779 (=> (not res!127667) (not e!169301))))

(declare-fun lt!131898 () ListLongMap!3865)

(assert (=> d!62779 (= res!127667 (contains!1894 lt!131898 (_1!2487 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504)))))))

(declare-fun lt!131895 () List!3830)

(assert (=> d!62779 (= lt!131898 (ListLongMap!3866 lt!131895))))

(declare-fun lt!131896 () Unit!8108)

(declare-fun lt!131897 () Unit!8108)

(assert (=> d!62779 (= lt!131896 lt!131897)))

(assert (=> d!62779 (= (getValueByKey!317 lt!131895 (_1!2487 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62779 (= lt!131897 (lemmaContainsTupThenGetReturnValue!173 lt!131895 (_1!2487 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62779 (= lt!131895 (insertStrictlySorted!176 (toList!1948 lt!131824) (_1!2487 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62779 (= (+!701 lt!131824 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504))) lt!131898)))

(declare-fun b!261261 () Bool)

(declare-fun res!127668 () Bool)

(assert (=> b!261261 (=> (not res!127668) (not e!169301))))

(assert (=> b!261261 (= res!127668 (= (getValueByKey!317 (toList!1948 lt!131898) (_1!2487 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504))))))))

(declare-fun b!261262 () Bool)

(assert (=> b!261262 (= e!169301 (contains!1896 (toList!1948 lt!131898) (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504))))))

(assert (= (and d!62779 res!127667) b!261261))

(assert (= (and b!261261 res!127668) b!261262))

(declare-fun m!277203 () Bool)

(assert (=> d!62779 m!277203))

(declare-fun m!277205 () Bool)

(assert (=> d!62779 m!277205))

(declare-fun m!277207 () Bool)

(assert (=> d!62779 m!277207))

(declare-fun m!277209 () Bool)

(assert (=> d!62779 m!277209))

(declare-fun m!277211 () Bool)

(assert (=> b!261261 m!277211))

(declare-fun m!277213 () Bool)

(assert (=> b!261262 m!277213))

(assert (=> b!261153 d!62779))

(declare-fun d!62781 () Bool)

(declare-fun e!169302 () Bool)

(assert (=> d!62781 e!169302))

(declare-fun res!127669 () Bool)

(assert (=> d!62781 (=> res!127669 e!169302)))

(declare-fun lt!131900 () Bool)

(assert (=> d!62781 (= res!127669 (not lt!131900))))

(declare-fun lt!131899 () Bool)

(assert (=> d!62781 (= lt!131900 lt!131899)))

(declare-fun lt!131901 () Unit!8108)

(declare-fun e!169303 () Unit!8108)

(assert (=> d!62781 (= lt!131901 e!169303)))

(declare-fun c!44459 () Bool)

(assert (=> d!62781 (= c!44459 lt!131899)))

(assert (=> d!62781 (= lt!131899 (containsKey!309 (toList!1948 (+!701 lt!131814 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504)))) lt!131819))))

(assert (=> d!62781 (= (contains!1894 (+!701 lt!131814 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504))) lt!131819) lt!131900)))

(declare-fun b!261263 () Bool)

(declare-fun lt!131902 () Unit!8108)

(assert (=> b!261263 (= e!169303 lt!131902)))

(assert (=> b!261263 (= lt!131902 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 (+!701 lt!131814 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504)))) lt!131819))))

(assert (=> b!261263 (isDefined!258 (getValueByKey!317 (toList!1948 (+!701 lt!131814 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504)))) lt!131819))))

(declare-fun b!261264 () Bool)

(declare-fun Unit!8121 () Unit!8108)

(assert (=> b!261264 (= e!169303 Unit!8121)))

(declare-fun b!261265 () Bool)

(assert (=> b!261265 (= e!169302 (isDefined!258 (getValueByKey!317 (toList!1948 (+!701 lt!131814 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504)))) lt!131819)))))

(assert (= (and d!62781 c!44459) b!261263))

(assert (= (and d!62781 (not c!44459)) b!261264))

(assert (= (and d!62781 (not res!127669)) b!261265))

(declare-fun m!277215 () Bool)

(assert (=> d!62781 m!277215))

(declare-fun m!277217 () Bool)

(assert (=> b!261263 m!277217))

(declare-fun m!277219 () Bool)

(assert (=> b!261263 m!277219))

(assert (=> b!261263 m!277219))

(declare-fun m!277221 () Bool)

(assert (=> b!261263 m!277221))

(assert (=> b!261265 m!277219))

(assert (=> b!261265 m!277219))

(assert (=> b!261265 m!277221))

(assert (=> b!261153 d!62781))

(declare-fun d!62783 () Bool)

(assert (=> d!62783 (= (apply!259 lt!131822 lt!131829) (get!3078 (getValueByKey!317 (toList!1948 lt!131822) lt!131829)))))

(declare-fun bs!9202 () Bool)

(assert (= bs!9202 d!62783))

(declare-fun m!277223 () Bool)

(assert (=> bs!9202 m!277223))

(assert (=> bs!9202 m!277223))

(declare-fun m!277225 () Bool)

(assert (=> bs!9202 m!277225))

(assert (=> b!261153 d!62783))

(declare-fun d!62785 () Bool)

(declare-fun e!169304 () Bool)

(assert (=> d!62785 e!169304))

(declare-fun res!127670 () Bool)

(assert (=> d!62785 (=> (not res!127670) (not e!169304))))

(declare-fun lt!131906 () ListLongMap!3865)

(assert (=> d!62785 (= res!127670 (contains!1894 lt!131906 (_1!2487 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504)))))))

(declare-fun lt!131903 () List!3830)

(assert (=> d!62785 (= lt!131906 (ListLongMap!3866 lt!131903))))

(declare-fun lt!131904 () Unit!8108)

(declare-fun lt!131905 () Unit!8108)

(assert (=> d!62785 (= lt!131904 lt!131905)))

(assert (=> d!62785 (= (getValueByKey!317 lt!131903 (_1!2487 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62785 (= lt!131905 (lemmaContainsTupThenGetReturnValue!173 lt!131903 (_1!2487 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62785 (= lt!131903 (insertStrictlySorted!176 (toList!1948 lt!131814) (_1!2487 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62785 (= (+!701 lt!131814 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504))) lt!131906)))

(declare-fun b!261266 () Bool)

(declare-fun res!127671 () Bool)

(assert (=> b!261266 (=> (not res!127671) (not e!169304))))

(assert (=> b!261266 (= res!127671 (= (getValueByKey!317 (toList!1948 lt!131906) (_1!2487 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504))))))))

(declare-fun b!261267 () Bool)

(assert (=> b!261267 (= e!169304 (contains!1896 (toList!1948 lt!131906) (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504))))))

(assert (= (and d!62785 res!127670) b!261266))

(assert (= (and b!261266 res!127671) b!261267))

(declare-fun m!277227 () Bool)

(assert (=> d!62785 m!277227))

(declare-fun m!277229 () Bool)

(assert (=> d!62785 m!277229))

(declare-fun m!277231 () Bool)

(assert (=> d!62785 m!277231))

(declare-fun m!277233 () Bool)

(assert (=> d!62785 m!277233))

(declare-fun m!277235 () Bool)

(assert (=> b!261266 m!277235))

(declare-fun m!277237 () Bool)

(assert (=> b!261267 m!277237))

(assert (=> b!261153 d!62785))

(declare-fun d!62787 () Bool)

(declare-fun e!169305 () Bool)

(assert (=> d!62787 e!169305))

(declare-fun res!127672 () Bool)

(assert (=> d!62787 (=> (not res!127672) (not e!169305))))

(declare-fun lt!131910 () ListLongMap!3865)

(assert (=> d!62787 (= res!127672 (contains!1894 lt!131910 (_1!2487 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504)))))))

(declare-fun lt!131907 () List!3830)

(assert (=> d!62787 (= lt!131910 (ListLongMap!3866 lt!131907))))

(declare-fun lt!131908 () Unit!8108)

(declare-fun lt!131909 () Unit!8108)

(assert (=> d!62787 (= lt!131908 lt!131909)))

(assert (=> d!62787 (= (getValueByKey!317 lt!131907 (_1!2487 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504)))))))

(assert (=> d!62787 (= lt!131909 (lemmaContainsTupThenGetReturnValue!173 lt!131907 (_1!2487 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504)))))))

(assert (=> d!62787 (= lt!131907 (insertStrictlySorted!176 (toList!1948 lt!131822) (_1!2487 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504)))))))

(assert (=> d!62787 (= (+!701 lt!131822 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504))) lt!131910)))

(declare-fun b!261268 () Bool)

(declare-fun res!127673 () Bool)

(assert (=> b!261268 (=> (not res!127673) (not e!169305))))

(assert (=> b!261268 (= res!127673 (= (getValueByKey!317 (toList!1948 lt!131910) (_1!2487 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504))))))))

(declare-fun b!261269 () Bool)

(assert (=> b!261269 (= e!169305 (contains!1896 (toList!1948 lt!131910) (tuple2!4953 lt!131818 (minValue!4649 thiss!1504))))))

(assert (= (and d!62787 res!127672) b!261268))

(assert (= (and b!261268 res!127673) b!261269))

(declare-fun m!277239 () Bool)

(assert (=> d!62787 m!277239))

(declare-fun m!277241 () Bool)

(assert (=> d!62787 m!277241))

(declare-fun m!277243 () Bool)

(assert (=> d!62787 m!277243))

(declare-fun m!277245 () Bool)

(assert (=> d!62787 m!277245))

(declare-fun m!277247 () Bool)

(assert (=> b!261268 m!277247))

(declare-fun m!277249 () Bool)

(assert (=> b!261269 m!277249))

(assert (=> b!261153 d!62787))

(declare-fun d!62789 () Bool)

(assert (=> d!62789 (= (apply!259 (+!701 lt!131824 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504))) lt!131813) (get!3078 (getValueByKey!317 (toList!1948 (+!701 lt!131824 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504)))) lt!131813)))))

(declare-fun bs!9203 () Bool)

(assert (= bs!9203 d!62789))

(declare-fun m!277251 () Bool)

(assert (=> bs!9203 m!277251))

(assert (=> bs!9203 m!277251))

(declare-fun m!277253 () Bool)

(assert (=> bs!9203 m!277253))

(assert (=> b!261153 d!62789))

(declare-fun d!62791 () Bool)

(assert (=> d!62791 (= (apply!259 (+!701 lt!131828 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504))) lt!131820) (apply!259 lt!131828 lt!131820))))

(declare-fun lt!131913 () Unit!8108)

(declare-fun choose!1276 (ListLongMap!3865 (_ BitVec 64) V!8483 (_ BitVec 64)) Unit!8108)

(assert (=> d!62791 (= lt!131913 (choose!1276 lt!131828 lt!131821 (minValue!4649 thiss!1504) lt!131820))))

(declare-fun e!169308 () Bool)

(assert (=> d!62791 e!169308))

(declare-fun res!127676 () Bool)

(assert (=> d!62791 (=> (not res!127676) (not e!169308))))

(assert (=> d!62791 (= res!127676 (contains!1894 lt!131828 lt!131820))))

(assert (=> d!62791 (= (addApplyDifferent!235 lt!131828 lt!131821 (minValue!4649 thiss!1504) lt!131820) lt!131913)))

(declare-fun b!261273 () Bool)

(assert (=> b!261273 (= e!169308 (not (= lt!131820 lt!131821)))))

(assert (= (and d!62791 res!127676) b!261273))

(declare-fun m!277255 () Bool)

(assert (=> d!62791 m!277255))

(assert (=> d!62791 m!277051))

(assert (=> d!62791 m!277045))

(assert (=> d!62791 m!277045))

(assert (=> d!62791 m!277047))

(declare-fun m!277257 () Bool)

(assert (=> d!62791 m!277257))

(assert (=> b!261153 d!62791))

(declare-fun d!62793 () Bool)

(assert (=> d!62793 (= (apply!259 (+!701 lt!131822 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504))) lt!131829) (get!3078 (getValueByKey!317 (toList!1948 (+!701 lt!131822 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504)))) lt!131829)))))

(declare-fun bs!9204 () Bool)

(assert (= bs!9204 d!62793))

(declare-fun m!277259 () Bool)

(assert (=> bs!9204 m!277259))

(assert (=> bs!9204 m!277259))

(declare-fun m!277261 () Bool)

(assert (=> bs!9204 m!277261))

(assert (=> b!261153 d!62793))

(declare-fun d!62795 () Bool)

(assert (=> d!62795 (= (apply!259 lt!131828 lt!131820) (get!3078 (getValueByKey!317 (toList!1948 lt!131828) lt!131820)))))

(declare-fun bs!9205 () Bool)

(assert (= bs!9205 d!62795))

(declare-fun m!277263 () Bool)

(assert (=> bs!9205 m!277263))

(assert (=> bs!9205 m!277263))

(declare-fun m!277265 () Bool)

(assert (=> bs!9205 m!277265))

(assert (=> b!261153 d!62795))

(declare-fun d!62797 () Bool)

(assert (=> d!62797 (= (apply!259 (+!701 lt!131824 (tuple2!4953 lt!131830 (zeroValue!4649 thiss!1504))) lt!131813) (apply!259 lt!131824 lt!131813))))

(declare-fun lt!131914 () Unit!8108)

(assert (=> d!62797 (= lt!131914 (choose!1276 lt!131824 lt!131830 (zeroValue!4649 thiss!1504) lt!131813))))

(declare-fun e!169309 () Bool)

(assert (=> d!62797 e!169309))

(declare-fun res!127677 () Bool)

(assert (=> d!62797 (=> (not res!127677) (not e!169309))))

(assert (=> d!62797 (= res!127677 (contains!1894 lt!131824 lt!131813))))

(assert (=> d!62797 (= (addApplyDifferent!235 lt!131824 lt!131830 (zeroValue!4649 thiss!1504) lt!131813) lt!131914)))

(declare-fun b!261274 () Bool)

(assert (=> b!261274 (= e!169309 (not (= lt!131813 lt!131830)))))

(assert (= (and d!62797 res!127677) b!261274))

(declare-fun m!277267 () Bool)

(assert (=> d!62797 m!277267))

(assert (=> d!62797 m!277035))

(assert (=> d!62797 m!277031))

(assert (=> d!62797 m!277031))

(assert (=> d!62797 m!277033))

(declare-fun m!277269 () Bool)

(assert (=> d!62797 m!277269))

(assert (=> b!261153 d!62797))

(declare-fun d!62799 () Bool)

(declare-fun e!169310 () Bool)

(assert (=> d!62799 e!169310))

(declare-fun res!127678 () Bool)

(assert (=> d!62799 (=> (not res!127678) (not e!169310))))

(declare-fun lt!131918 () ListLongMap!3865)

(assert (=> d!62799 (= res!127678 (contains!1894 lt!131918 (_1!2487 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504)))))))

(declare-fun lt!131915 () List!3830)

(assert (=> d!62799 (= lt!131918 (ListLongMap!3866 lt!131915))))

(declare-fun lt!131916 () Unit!8108)

(declare-fun lt!131917 () Unit!8108)

(assert (=> d!62799 (= lt!131916 lt!131917)))

(assert (=> d!62799 (= (getValueByKey!317 lt!131915 (_1!2487 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504)))))))

(assert (=> d!62799 (= lt!131917 (lemmaContainsTupThenGetReturnValue!173 lt!131915 (_1!2487 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504)))))))

(assert (=> d!62799 (= lt!131915 (insertStrictlySorted!176 (toList!1948 lt!131828) (_1!2487 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504)))))))

(assert (=> d!62799 (= (+!701 lt!131828 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504))) lt!131918)))

(declare-fun b!261275 () Bool)

(declare-fun res!127679 () Bool)

(assert (=> b!261275 (=> (not res!127679) (not e!169310))))

(assert (=> b!261275 (= res!127679 (= (getValueByKey!317 (toList!1948 lt!131918) (_1!2487 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504))))))))

(declare-fun b!261276 () Bool)

(assert (=> b!261276 (= e!169310 (contains!1896 (toList!1948 lt!131918) (tuple2!4953 lt!131821 (minValue!4649 thiss!1504))))))

(assert (= (and d!62799 res!127678) b!261275))

(assert (= (and b!261275 res!127679) b!261276))

(declare-fun m!277271 () Bool)

(assert (=> d!62799 m!277271))

(declare-fun m!277273 () Bool)

(assert (=> d!62799 m!277273))

(declare-fun m!277275 () Bool)

(assert (=> d!62799 m!277275))

(declare-fun m!277277 () Bool)

(assert (=> d!62799 m!277277))

(declare-fun m!277279 () Bool)

(assert (=> b!261275 m!277279))

(declare-fun m!277281 () Bool)

(assert (=> b!261276 m!277281))

(assert (=> b!261153 d!62799))

(declare-fun d!62801 () Bool)

(assert (=> d!62801 (= (apply!259 lt!131824 lt!131813) (get!3078 (getValueByKey!317 (toList!1948 lt!131824) lt!131813)))))

(declare-fun bs!9206 () Bool)

(assert (= bs!9206 d!62801))

(declare-fun m!277283 () Bool)

(assert (=> bs!9206 m!277283))

(assert (=> bs!9206 m!277283))

(declare-fun m!277285 () Bool)

(assert (=> bs!9206 m!277285))

(assert (=> b!261153 d!62801))

(declare-fun d!62803 () Bool)

(assert (=> d!62803 (= (apply!259 (+!701 lt!131828 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504))) lt!131820) (get!3078 (getValueByKey!317 (toList!1948 (+!701 lt!131828 (tuple2!4953 lt!131821 (minValue!4649 thiss!1504)))) lt!131820)))))

(declare-fun bs!9207 () Bool)

(assert (= bs!9207 d!62803))

(declare-fun m!277287 () Bool)

(assert (=> bs!9207 m!277287))

(assert (=> bs!9207 m!277287))

(declare-fun m!277289 () Bool)

(assert (=> bs!9207 m!277289))

(assert (=> b!261153 d!62803))

(declare-fun d!62805 () Bool)

(assert (=> d!62805 (contains!1894 (+!701 lt!131814 (tuple2!4953 lt!131831 (zeroValue!4649 thiss!1504))) lt!131819)))

(declare-fun lt!131921 () Unit!8108)

(declare-fun choose!1277 (ListLongMap!3865 (_ BitVec 64) V!8483 (_ BitVec 64)) Unit!8108)

(assert (=> d!62805 (= lt!131921 (choose!1277 lt!131814 lt!131831 (zeroValue!4649 thiss!1504) lt!131819))))

(assert (=> d!62805 (contains!1894 lt!131814 lt!131819)))

(assert (=> d!62805 (= (addStillContains!235 lt!131814 lt!131831 (zeroValue!4649 thiss!1504) lt!131819) lt!131921)))

(declare-fun bs!9208 () Bool)

(assert (= bs!9208 d!62805))

(assert (=> bs!9208 m!277043))

(assert (=> bs!9208 m!277043))

(assert (=> bs!9208 m!277059))

(declare-fun m!277291 () Bool)

(assert (=> bs!9208 m!277291))

(declare-fun m!277293 () Bool)

(assert (=> bs!9208 m!277293))

(assert (=> b!261153 d!62805))

(declare-fun b!261302 () Bool)

(declare-fun e!169325 () Bool)

(assert (=> b!261302 (= e!169325 (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261302 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!261303 () Bool)

(assert (=> b!261303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> b!261303 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6318 (_values!4791 thiss!1504))))))

(declare-fun e!169328 () Bool)

(declare-fun lt!131936 () ListLongMap!3865)

(assert (=> b!261303 (= e!169328 (= (apply!259 lt!131936 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)) (get!3077 (select (arr!5968 (_values!4791 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261304 () Bool)

(declare-fun e!169331 () ListLongMap!3865)

(declare-fun e!169327 () ListLongMap!3865)

(assert (=> b!261304 (= e!169331 e!169327)))

(declare-fun c!44468 () Bool)

(assert (=> b!261304 (= c!44468 (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261305 () Bool)

(declare-fun e!169329 () Bool)

(declare-fun isEmpty!538 (ListLongMap!3865) Bool)

(assert (=> b!261305 (= e!169329 (isEmpty!538 lt!131936))))

(declare-fun d!62807 () Bool)

(declare-fun e!169326 () Bool)

(assert (=> d!62807 e!169326))

(declare-fun res!127690 () Bool)

(assert (=> d!62807 (=> (not res!127690) (not e!169326))))

(assert (=> d!62807 (= res!127690 (not (contains!1894 lt!131936 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62807 (= lt!131936 e!169331)))

(declare-fun c!44470 () Bool)

(assert (=> d!62807 (= c!44470 (bvsge #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> d!62807 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62807 (= (getCurrentListMapNoExtraKeys!581 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) lt!131936)))

(declare-fun b!261306 () Bool)

(assert (=> b!261306 (= e!169331 (ListLongMap!3866 Nil!3827))))

(declare-fun b!261307 () Bool)

(declare-fun call!24947 () ListLongMap!3865)

(assert (=> b!261307 (= e!169327 call!24947)))

(declare-fun b!261308 () Bool)

(declare-fun res!127688 () Bool)

(assert (=> b!261308 (=> (not res!127688) (not e!169326))))

(assert (=> b!261308 (= res!127688 (not (contains!1894 lt!131936 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261309 () Bool)

(declare-fun lt!131942 () Unit!8108)

(declare-fun lt!131937 () Unit!8108)

(assert (=> b!261309 (= lt!131942 lt!131937)))

(declare-fun lt!131939 () ListLongMap!3865)

(declare-fun lt!131938 () V!8483)

(declare-fun lt!131940 () (_ BitVec 64))

(declare-fun lt!131941 () (_ BitVec 64))

(assert (=> b!261309 (not (contains!1894 (+!701 lt!131939 (tuple2!4953 lt!131940 lt!131938)) lt!131941))))

(declare-fun addStillNotContains!128 (ListLongMap!3865 (_ BitVec 64) V!8483 (_ BitVec 64)) Unit!8108)

(assert (=> b!261309 (= lt!131937 (addStillNotContains!128 lt!131939 lt!131940 lt!131938 lt!131941))))

(assert (=> b!261309 (= lt!131941 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!261309 (= lt!131938 (get!3077 (select (arr!5968 (_values!4791 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261309 (= lt!131940 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!261309 (= lt!131939 call!24947)))

(assert (=> b!261309 (= e!169327 (+!701 call!24947 (tuple2!4953 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000) (get!3077 (select (arr!5968 (_values!4791 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!261310 () Bool)

(declare-fun e!169330 () Bool)

(assert (=> b!261310 (= e!169326 e!169330)))

(declare-fun c!44471 () Bool)

(assert (=> b!261310 (= c!44471 e!169325)))

(declare-fun res!127691 () Bool)

(assert (=> b!261310 (=> (not res!127691) (not e!169325))))

(assert (=> b!261310 (= res!127691 (bvslt #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!261311 () Bool)

(assert (=> b!261311 (= e!169330 e!169329)))

(declare-fun c!44469 () Bool)

(assert (=> b!261311 (= c!44469 (bvslt #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun bm!24944 () Bool)

(assert (=> bm!24944 (= call!24947 (getCurrentListMapNoExtraKeys!581 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4808 thiss!1504)))))

(declare-fun b!261312 () Bool)

(assert (=> b!261312 (= e!169330 e!169328)))

(assert (=> b!261312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun res!127689 () Bool)

(assert (=> b!261312 (= res!127689 (contains!1894 lt!131936 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261312 (=> (not res!127689) (not e!169328))))

(declare-fun b!261313 () Bool)

(assert (=> b!261313 (= e!169329 (= lt!131936 (getCurrentListMapNoExtraKeys!581 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4808 thiss!1504))))))

(assert (= (and d!62807 c!44470) b!261306))

(assert (= (and d!62807 (not c!44470)) b!261304))

(assert (= (and b!261304 c!44468) b!261309))

(assert (= (and b!261304 (not c!44468)) b!261307))

(assert (= (or b!261309 b!261307) bm!24944))

(assert (= (and d!62807 res!127690) b!261308))

(assert (= (and b!261308 res!127688) b!261310))

(assert (= (and b!261310 res!127691) b!261302))

(assert (= (and b!261310 c!44471) b!261312))

(assert (= (and b!261310 (not c!44471)) b!261311))

(assert (= (and b!261312 res!127689) b!261303))

(assert (= (and b!261311 c!44469) b!261313))

(assert (= (and b!261311 (not c!44469)) b!261305))

(declare-fun b_lambda!8297 () Bool)

(assert (=> (not b_lambda!8297) (not b!261303)))

(assert (=> b!261303 t!8905))

(declare-fun b_and!13895 () Bool)

(assert (= b_and!13893 (and (=> t!8905 result!5415) b_and!13895)))

(declare-fun b_lambda!8299 () Bool)

(assert (=> (not b_lambda!8299) (not b!261309)))

(assert (=> b!261309 t!8905))

(declare-fun b_and!13897 () Bool)

(assert (= b_and!13895 (and (=> t!8905 result!5415) b_and!13897)))

(declare-fun m!277295 () Bool)

(assert (=> b!261305 m!277295))

(declare-fun m!277297 () Bool)

(assert (=> b!261313 m!277297))

(assert (=> b!261303 m!276893))

(assert (=> b!261303 m!277069))

(assert (=> b!261303 m!276959))

(assert (=> b!261303 m!277071))

(assert (=> b!261303 m!276893))

(declare-fun m!277299 () Bool)

(assert (=> b!261303 m!277299))

(assert (=> b!261303 m!276959))

(assert (=> b!261303 m!277069))

(assert (=> b!261304 m!276893))

(assert (=> b!261304 m!276893))

(assert (=> b!261304 m!276895))

(declare-fun m!277301 () Bool)

(assert (=> d!62807 m!277301))

(assert (=> d!62807 m!276785))

(assert (=> b!261302 m!276893))

(assert (=> b!261302 m!276893))

(assert (=> b!261302 m!276895))

(declare-fun m!277303 () Bool)

(assert (=> b!261308 m!277303))

(assert (=> bm!24944 m!277297))

(assert (=> b!261312 m!276893))

(assert (=> b!261312 m!276893))

(declare-fun m!277305 () Bool)

(assert (=> b!261312 m!277305))

(declare-fun m!277307 () Bool)

(assert (=> b!261309 m!277307))

(declare-fun m!277309 () Bool)

(assert (=> b!261309 m!277309))

(assert (=> b!261309 m!276893))

(assert (=> b!261309 m!276959))

(declare-fun m!277311 () Bool)

(assert (=> b!261309 m!277311))

(assert (=> b!261309 m!277307))

(assert (=> b!261309 m!277069))

(assert (=> b!261309 m!276959))

(assert (=> b!261309 m!277071))

(declare-fun m!277313 () Bool)

(assert (=> b!261309 m!277313))

(assert (=> b!261309 m!277069))

(assert (=> b!261153 d!62807))

(declare-fun d!62809 () Bool)

(assert (=> d!62809 (= (apply!259 (+!701 lt!131822 (tuple2!4953 lt!131818 (minValue!4649 thiss!1504))) lt!131829) (apply!259 lt!131822 lt!131829))))

(declare-fun lt!131943 () Unit!8108)

(assert (=> d!62809 (= lt!131943 (choose!1276 lt!131822 lt!131818 (minValue!4649 thiss!1504) lt!131829))))

(declare-fun e!169332 () Bool)

(assert (=> d!62809 e!169332))

(declare-fun res!127692 () Bool)

(assert (=> d!62809 (=> (not res!127692) (not e!169332))))

(assert (=> d!62809 (= res!127692 (contains!1894 lt!131822 lt!131829))))

(assert (=> d!62809 (= (addApplyDifferent!235 lt!131822 lt!131818 (minValue!4649 thiss!1504) lt!131829) lt!131943)))

(declare-fun b!261314 () Bool)

(assert (=> b!261314 (= e!169332 (not (= lt!131829 lt!131818)))))

(assert (= (and d!62809 res!127692) b!261314))

(declare-fun m!277315 () Bool)

(assert (=> d!62809 m!277315))

(assert (=> d!62809 m!277037))

(assert (=> d!62809 m!277049))

(assert (=> d!62809 m!277049))

(assert (=> d!62809 m!277053))

(declare-fun m!277317 () Bool)

(assert (=> d!62809 m!277317))

(assert (=> b!261153 d!62809))

(assert (=> b!261105 d!62759))

(declare-fun d!62811 () Bool)

(assert (=> d!62811 (= (+!701 (getCurrentListMap!1476 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) (tuple2!4953 key!932 v!346)) (getCurrentListMap!1476 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)))))

(assert (=> d!62811 true))

(declare-fun _$3!64 () Unit!8108)

(assert (=> d!62811 (= (choose!1272 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) index!297 key!932 v!346 (defaultEntry!4808 thiss!1504)) _$3!64)))

(declare-fun bs!9209 () Bool)

(assert (= bs!9209 d!62811))

(assert (=> bs!9209 m!276803))

(assert (=> bs!9209 m!276983))

(assert (=> bs!9209 m!276775))

(assert (=> bs!9209 m!276803))

(assert (=> bs!9209 m!276981))

(assert (=> bs!9209 m!276765))

(assert (=> d!62729 d!62811))

(assert (=> d!62729 d!62715))

(assert (=> b!261050 d!62759))

(declare-fun d!62813 () Bool)

(assert (=> d!62813 (= (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) index!297)) (and (not (= (select (arr!5969 (_keys!6992 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5969 (_keys!6992 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261002 d!62813))

(declare-fun d!62815 () Bool)

(declare-fun e!169333 () Bool)

(assert (=> d!62815 e!169333))

(declare-fun res!127693 () Bool)

(assert (=> d!62815 (=> res!127693 e!169333)))

(declare-fun lt!131945 () Bool)

(assert (=> d!62815 (= res!127693 (not lt!131945))))

(declare-fun lt!131944 () Bool)

(assert (=> d!62815 (= lt!131945 lt!131944)))

(declare-fun lt!131946 () Unit!8108)

(declare-fun e!169334 () Unit!8108)

(assert (=> d!62815 (= lt!131946 e!169334)))

(declare-fun c!44472 () Bool)

(assert (=> d!62815 (= c!44472 lt!131944)))

(assert (=> d!62815 (= lt!131944 (containsKey!309 (toList!1948 lt!131769) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62815 (= (contains!1894 lt!131769 #b1000000000000000000000000000000000000000000000000000000000000000) lt!131945)))

(declare-fun b!261315 () Bool)

(declare-fun lt!131947 () Unit!8108)

(assert (=> b!261315 (= e!169334 lt!131947)))

(assert (=> b!261315 (= lt!131947 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 lt!131769) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261315 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131769) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261316 () Bool)

(declare-fun Unit!8122 () Unit!8108)

(assert (=> b!261316 (= e!169334 Unit!8122)))

(declare-fun b!261317 () Bool)

(assert (=> b!261317 (= e!169333 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131769) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62815 c!44472) b!261315))

(assert (= (and d!62815 (not c!44472)) b!261316))

(assert (= (and d!62815 (not res!127693)) b!261317))

(declare-fun m!277319 () Bool)

(assert (=> d!62815 m!277319))

(declare-fun m!277321 () Bool)

(assert (=> b!261315 m!277321))

(assert (=> b!261315 m!277191))

(assert (=> b!261315 m!277191))

(declare-fun m!277323 () Bool)

(assert (=> b!261315 m!277323))

(assert (=> b!261317 m!277191))

(assert (=> b!261317 m!277191))

(assert (=> b!261317 m!277323))

(assert (=> bm!24917 d!62815))

(assert (=> d!62745 d!62755))

(declare-fun b!261334 () Bool)

(declare-fun res!127705 () Bool)

(declare-fun e!169346 () Bool)

(assert (=> b!261334 (=> (not res!127705) (not e!169346))))

(declare-fun lt!131950 () SeekEntryResult!1185)

(assert (=> b!261334 (= res!127705 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6913 lt!131950)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261335 () Bool)

(declare-fun res!127702 () Bool)

(assert (=> b!261335 (= res!127702 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6910 lt!131950)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169345 () Bool)

(assert (=> b!261335 (=> (not res!127702) (not e!169345))))

(declare-fun b!261336 () Bool)

(declare-fun res!127703 () Bool)

(assert (=> b!261336 (=> (not res!127703) (not e!169346))))

(declare-fun call!24952 () Bool)

(assert (=> b!261336 (= res!127703 call!24952)))

(declare-fun e!169343 () Bool)

(assert (=> b!261336 (= e!169343 e!169346)))

(declare-fun bm!24949 () Bool)

(declare-fun c!44478 () Bool)

(assert (=> bm!24949 (= call!24952 (inRange!0 (ite c!44478 (index!6910 lt!131950) (index!6913 lt!131950)) (mask!11145 thiss!1504)))))

(declare-fun b!261337 () Bool)

(declare-fun call!24953 () Bool)

(assert (=> b!261337 (= e!169346 (not call!24953))))

(declare-fun b!261338 () Bool)

(assert (=> b!261338 (= e!169345 (not call!24953))))

(declare-fun b!261339 () Bool)

(declare-fun e!169344 () Bool)

(assert (=> b!261339 (= e!169344 e!169343)))

(declare-fun c!44477 () Bool)

(assert (=> b!261339 (= c!44477 ((_ is MissingVacant!1185) lt!131950))))

(declare-fun bm!24950 () Bool)

(assert (=> bm!24950 (= call!24953 (arrayContainsKey!0 (_keys!6992 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261341 () Bool)

(assert (=> b!261341 (= e!169343 ((_ is Undefined!1185) lt!131950))))

(declare-fun b!261340 () Bool)

(assert (=> b!261340 (= e!169344 e!169345)))

(declare-fun res!127704 () Bool)

(assert (=> b!261340 (= res!127704 call!24952)))

(assert (=> b!261340 (=> (not res!127704) (not e!169345))))

(declare-fun d!62817 () Bool)

(assert (=> d!62817 e!169344))

(assert (=> d!62817 (= c!44478 ((_ is MissingZero!1185) lt!131950))))

(assert (=> d!62817 (= lt!131950 (seekEntryOrOpen!0 key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(assert (=> d!62817 true))

(declare-fun _$34!1128 () Unit!8108)

(assert (=> d!62817 (= (choose!1274 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 (defaultEntry!4808 thiss!1504)) _$34!1128)))

(assert (= (and d!62817 c!44478) b!261340))

(assert (= (and d!62817 (not c!44478)) b!261339))

(assert (= (and b!261340 res!127704) b!261335))

(assert (= (and b!261335 res!127702) b!261338))

(assert (= (and b!261339 c!44477) b!261336))

(assert (= (and b!261339 (not c!44477)) b!261341))

(assert (= (and b!261336 res!127703) b!261334))

(assert (= (and b!261334 res!127705) b!261337))

(assert (= (or b!261340 b!261336) bm!24949))

(assert (= (or b!261338 b!261337) bm!24950))

(assert (=> bm!24950 m!276757))

(declare-fun m!277325 () Bool)

(assert (=> bm!24949 m!277325))

(declare-fun m!277327 () Bool)

(assert (=> b!261335 m!277327))

(assert (=> d!62817 m!276753))

(declare-fun m!277329 () Bool)

(assert (=> b!261334 m!277329))

(assert (=> d!62745 d!62817))

(assert (=> d!62745 d!62715))

(declare-fun d!62819 () Bool)

(declare-fun lt!131951 () (_ BitVec 32))

(assert (=> d!62819 (and (bvsge lt!131951 #b00000000000000000000000000000000) (bvsle lt!131951 (bvsub (size!6319 lt!131631) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!169348 () (_ BitVec 32))

(assert (=> d!62819 (= lt!131951 e!169348)))

(declare-fun c!44479 () Bool)

(assert (=> d!62819 (= c!44479 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> d!62819 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6319 (_keys!6992 thiss!1504)) (size!6319 lt!131631)))))

(assert (=> d!62819 (= (arrayCountValidKeys!0 lt!131631 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))) lt!131951)))

(declare-fun bm!24951 () Bool)

(declare-fun call!24954 () (_ BitVec 32))

(assert (=> bm!24951 (= call!24954 (arrayCountValidKeys!0 lt!131631 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!261342 () Bool)

(declare-fun e!169347 () (_ BitVec 32))

(assert (=> b!261342 (= e!169347 (bvadd #b00000000000000000000000000000001 call!24954))))

(declare-fun b!261343 () Bool)

(assert (=> b!261343 (= e!169348 #b00000000000000000000000000000000)))

(declare-fun b!261344 () Bool)

(assert (=> b!261344 (= e!169347 call!24954)))

(declare-fun b!261345 () Bool)

(assert (=> b!261345 (= e!169348 e!169347)))

(declare-fun c!44480 () Bool)

(assert (=> b!261345 (= c!44480 (validKeyInArray!0 (select (arr!5969 lt!131631) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62819 c!44479) b!261343))

(assert (= (and d!62819 (not c!44479)) b!261345))

(assert (= (and b!261345 c!44480) b!261342))

(assert (= (and b!261345 (not c!44480)) b!261344))

(assert (= (or b!261342 b!261344) bm!24951))

(declare-fun m!277331 () Bool)

(assert (=> bm!24951 m!277331))

(declare-fun m!277333 () Bool)

(assert (=> b!261345 m!277333))

(assert (=> b!261345 m!277333))

(declare-fun m!277335 () Bool)

(assert (=> b!261345 m!277335))

(assert (=> bm!24892 d!62819))

(declare-fun b!261346 () Bool)

(declare-fun e!169351 () Bool)

(declare-fun e!169350 () Bool)

(assert (=> b!261346 (= e!169351 e!169350)))

(declare-fun c!44481 () Bool)

(assert (=> b!261346 (= c!44481 (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!24952 () Bool)

(declare-fun call!24955 () Bool)

(assert (=> bm!24952 (= call!24955 (arrayNoDuplicates!0 (_keys!6992 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44481 (Cons!3827 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000) Nil!3828) Nil!3828)))))

(declare-fun b!261347 () Bool)

(assert (=> b!261347 (= e!169350 call!24955)))

(declare-fun b!261348 () Bool)

(declare-fun e!169352 () Bool)

(assert (=> b!261348 (= e!169352 (contains!1897 Nil!3828 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261349 () Bool)

(declare-fun e!169349 () Bool)

(assert (=> b!261349 (= e!169349 e!169351)))

(declare-fun res!127706 () Bool)

(assert (=> b!261349 (=> (not res!127706) (not e!169351))))

(assert (=> b!261349 (= res!127706 (not e!169352))))

(declare-fun res!127708 () Bool)

(assert (=> b!261349 (=> (not res!127708) (not e!169352))))

(assert (=> b!261349 (= res!127708 (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62821 () Bool)

(declare-fun res!127707 () Bool)

(assert (=> d!62821 (=> res!127707 e!169349)))

(assert (=> d!62821 (= res!127707 (bvsge #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> d!62821 (= (arrayNoDuplicates!0 (_keys!6992 thiss!1504) #b00000000000000000000000000000000 Nil!3828) e!169349)))

(declare-fun b!261350 () Bool)

(assert (=> b!261350 (= e!169350 call!24955)))

(assert (= (and d!62821 (not res!127707)) b!261349))

(assert (= (and b!261349 res!127708) b!261348))

(assert (= (and b!261349 res!127706) b!261346))

(assert (= (and b!261346 c!44481) b!261350))

(assert (= (and b!261346 (not c!44481)) b!261347))

(assert (= (or b!261350 b!261347) bm!24952))

(assert (=> b!261346 m!276893))

(assert (=> b!261346 m!276893))

(assert (=> b!261346 m!276895))

(assert (=> bm!24952 m!276893))

(declare-fun m!277337 () Bool)

(assert (=> bm!24952 m!277337))

(assert (=> b!261348 m!276893))

(assert (=> b!261348 m!276893))

(declare-fun m!277339 () Bool)

(assert (=> b!261348 m!277339))

(assert (=> b!261349 m!276893))

(assert (=> b!261349 m!276893))

(assert (=> b!261349 m!276895))

(assert (=> b!260956 d!62821))

(declare-fun d!62823 () Bool)

(assert (=> d!62823 (= (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261148 d!62823))

(assert (=> b!260954 d!62713))

(declare-fun d!62825 () Bool)

(declare-fun e!169353 () Bool)

(assert (=> d!62825 e!169353))

(declare-fun res!127709 () Bool)

(assert (=> d!62825 (=> res!127709 e!169353)))

(declare-fun lt!131953 () Bool)

(assert (=> d!62825 (= res!127709 (not lt!131953))))

(declare-fun lt!131952 () Bool)

(assert (=> d!62825 (= lt!131953 lt!131952)))

(declare-fun lt!131954 () Unit!8108)

(declare-fun e!169354 () Unit!8108)

(assert (=> d!62825 (= lt!131954 e!169354)))

(declare-fun c!44482 () Bool)

(assert (=> d!62825 (= c!44482 lt!131952)))

(assert (=> d!62825 (= lt!131952 (containsKey!309 (toList!1948 lt!131834) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62825 (= (contains!1894 lt!131834 #b0000000000000000000000000000000000000000000000000000000000000000) lt!131953)))

(declare-fun b!261351 () Bool)

(declare-fun lt!131955 () Unit!8108)

(assert (=> b!261351 (= e!169354 lt!131955)))

(assert (=> b!261351 (= lt!131955 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 lt!131834) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261351 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131834) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261352 () Bool)

(declare-fun Unit!8123 () Unit!8108)

(assert (=> b!261352 (= e!169354 Unit!8123)))

(declare-fun b!261353 () Bool)

(assert (=> b!261353 (= e!169353 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131834) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62825 c!44482) b!261351))

(assert (= (and d!62825 (not c!44482)) b!261352))

(assert (= (and d!62825 (not res!127709)) b!261353))

(declare-fun m!277341 () Bool)

(assert (=> d!62825 m!277341))

(declare-fun m!277343 () Bool)

(assert (=> b!261351 m!277343))

(declare-fun m!277345 () Bool)

(assert (=> b!261351 m!277345))

(assert (=> b!261351 m!277345))

(declare-fun m!277347 () Bool)

(assert (=> b!261351 m!277347))

(assert (=> b!261353 m!277345))

(assert (=> b!261353 m!277345))

(assert (=> b!261353 m!277347))

(assert (=> bm!24932 d!62825))

(declare-fun d!62827 () Bool)

(assert (=> d!62827 (= (inRange!0 (index!6911 lt!131839) (mask!11145 thiss!1504)) (and (bvsge (index!6911 lt!131839) #b00000000000000000000000000000000) (bvslt (index!6911 lt!131839) (bvadd (mask!11145 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!261168 d!62827))

(assert (=> b!260978 d!62823))

(declare-fun d!62829 () Bool)

(declare-fun res!127710 () Bool)

(declare-fun e!169355 () Bool)

(assert (=> d!62829 (=> res!127710 e!169355)))

(assert (=> d!62829 (= res!127710 (= (select (arr!5969 (_keys!6992 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62829 (= (arrayContainsKey!0 (_keys!6992 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!169355)))

(declare-fun b!261354 () Bool)

(declare-fun e!169356 () Bool)

(assert (=> b!261354 (= e!169355 e!169356)))

(declare-fun res!127711 () Bool)

(assert (=> b!261354 (=> (not res!127711) (not e!169356))))

(assert (=> b!261354 (= res!127711 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!261355 () Bool)

(assert (=> b!261355 (= e!169356 (arrayContainsKey!0 (_keys!6992 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62829 (not res!127710)) b!261354))

(assert (= (and b!261354 res!127711) b!261355))

(declare-fun m!277349 () Bool)

(assert (=> d!62829 m!277349))

(declare-fun m!277351 () Bool)

(assert (=> b!261355 m!277351))

(assert (=> b!261072 d!62829))

(declare-fun d!62831 () Bool)

(assert (=> d!62831 (arrayContainsKey!0 lt!131631 lt!131696 #b00000000000000000000000000000000)))

(declare-fun lt!131956 () Unit!8108)

(assert (=> d!62831 (= lt!131956 (choose!13 lt!131631 lt!131696 #b00000000000000000000000000000000))))

(assert (=> d!62831 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!62831 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131631 lt!131696 #b00000000000000000000000000000000) lt!131956)))

(declare-fun bs!9210 () Bool)

(assert (= bs!9210 d!62831))

(assert (=> bs!9210 m!276901))

(declare-fun m!277353 () Bool)

(assert (=> bs!9210 m!277353))

(assert (=> b!260990 d!62831))

(declare-fun d!62833 () Bool)

(declare-fun res!127712 () Bool)

(declare-fun e!169357 () Bool)

(assert (=> d!62833 (=> res!127712 e!169357)))

(assert (=> d!62833 (= res!127712 (= (select (arr!5969 lt!131631) #b00000000000000000000000000000000) lt!131696))))

(assert (=> d!62833 (= (arrayContainsKey!0 lt!131631 lt!131696 #b00000000000000000000000000000000) e!169357)))

(declare-fun b!261356 () Bool)

(declare-fun e!169358 () Bool)

(assert (=> b!261356 (= e!169357 e!169358)))

(declare-fun res!127713 () Bool)

(assert (=> b!261356 (=> (not res!127713) (not e!169358))))

(assert (=> b!261356 (= res!127713 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 lt!131631)))))

(declare-fun b!261357 () Bool)

(assert (=> b!261357 (= e!169358 (arrayContainsKey!0 lt!131631 lt!131696 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!62833 (not res!127712)) b!261356))

(assert (= (and b!261356 res!127713) b!261357))

(assert (=> d!62833 m!276883))

(declare-fun m!277355 () Bool)

(assert (=> b!261357 m!277355))

(assert (=> b!260990 d!62833))

(declare-fun b!261358 () Bool)

(declare-fun e!169360 () SeekEntryResult!1185)

(declare-fun lt!131957 () SeekEntryResult!1185)

(assert (=> b!261358 (= e!169360 (MissingZero!1185 (index!6912 lt!131957)))))

(declare-fun b!261359 () Bool)

(assert (=> b!261359 (= e!169360 (seekKeyOrZeroReturnVacant!0 (x!25149 lt!131957) (index!6912 lt!131957) (index!6912 lt!131957) (select (arr!5969 lt!131631) #b00000000000000000000000000000000) lt!131631 (mask!11145 thiss!1504)))))

(declare-fun b!261360 () Bool)

(declare-fun e!169359 () SeekEntryResult!1185)

(assert (=> b!261360 (= e!169359 Undefined!1185)))

(declare-fun d!62835 () Bool)

(declare-fun lt!131958 () SeekEntryResult!1185)

(assert (=> d!62835 (and (or ((_ is Undefined!1185) lt!131958) (not ((_ is Found!1185) lt!131958)) (and (bvsge (index!6911 lt!131958) #b00000000000000000000000000000000) (bvslt (index!6911 lt!131958) (size!6319 lt!131631)))) (or ((_ is Undefined!1185) lt!131958) ((_ is Found!1185) lt!131958) (not ((_ is MissingZero!1185) lt!131958)) (and (bvsge (index!6910 lt!131958) #b00000000000000000000000000000000) (bvslt (index!6910 lt!131958) (size!6319 lt!131631)))) (or ((_ is Undefined!1185) lt!131958) ((_ is Found!1185) lt!131958) ((_ is MissingZero!1185) lt!131958) (not ((_ is MissingVacant!1185) lt!131958)) (and (bvsge (index!6913 lt!131958) #b00000000000000000000000000000000) (bvslt (index!6913 lt!131958) (size!6319 lt!131631)))) (or ((_ is Undefined!1185) lt!131958) (ite ((_ is Found!1185) lt!131958) (= (select (arr!5969 lt!131631) (index!6911 lt!131958)) (select (arr!5969 lt!131631) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1185) lt!131958) (= (select (arr!5969 lt!131631) (index!6910 lt!131958)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1185) lt!131958) (= (select (arr!5969 lt!131631) (index!6913 lt!131958)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!62835 (= lt!131958 e!169359)))

(declare-fun c!44484 () Bool)

(assert (=> d!62835 (= c!44484 (and ((_ is Intermediate!1185) lt!131957) (undefined!1997 lt!131957)))))

(assert (=> d!62835 (= lt!131957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000) (mask!11145 thiss!1504)) (select (arr!5969 lt!131631) #b00000000000000000000000000000000) lt!131631 (mask!11145 thiss!1504)))))

(assert (=> d!62835 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62835 (= (seekEntryOrOpen!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000) lt!131631 (mask!11145 thiss!1504)) lt!131958)))

(declare-fun b!261361 () Bool)

(declare-fun c!44483 () Bool)

(declare-fun lt!131959 () (_ BitVec 64))

(assert (=> b!261361 (= c!44483 (= lt!131959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169361 () SeekEntryResult!1185)

(assert (=> b!261361 (= e!169361 e!169360)))

(declare-fun b!261362 () Bool)

(assert (=> b!261362 (= e!169361 (Found!1185 (index!6912 lt!131957)))))

(declare-fun b!261363 () Bool)

(assert (=> b!261363 (= e!169359 e!169361)))

(assert (=> b!261363 (= lt!131959 (select (arr!5969 lt!131631) (index!6912 lt!131957)))))

(declare-fun c!44485 () Bool)

(assert (=> b!261363 (= c!44485 (= lt!131959 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(assert (= (and d!62835 c!44484) b!261360))

(assert (= (and d!62835 (not c!44484)) b!261363))

(assert (= (and b!261363 c!44485) b!261362))

(assert (= (and b!261363 (not c!44485)) b!261361))

(assert (= (and b!261361 c!44483) b!261358))

(assert (= (and b!261361 (not c!44483)) b!261359))

(assert (=> b!261359 m!276883))

(declare-fun m!277357 () Bool)

(assert (=> b!261359 m!277357))

(declare-fun m!277359 () Bool)

(assert (=> d!62835 m!277359))

(assert (=> d!62835 m!276883))

(declare-fun m!277361 () Bool)

(assert (=> d!62835 m!277361))

(declare-fun m!277363 () Bool)

(assert (=> d!62835 m!277363))

(assert (=> d!62835 m!276785))

(assert (=> d!62835 m!276883))

(assert (=> d!62835 m!277359))

(declare-fun m!277365 () Bool)

(assert (=> d!62835 m!277365))

(declare-fun m!277367 () Bool)

(assert (=> d!62835 m!277367))

(declare-fun m!277369 () Bool)

(assert (=> b!261363 m!277369))

(assert (=> b!260990 d!62835))

(assert (=> b!260988 d!62759))

(declare-fun d!62837 () Bool)

(assert (=> d!62837 (= (validKeyInArray!0 (select (arr!5969 lt!131631) index!297)) (and (not (= (select (arr!5969 lt!131631) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5969 lt!131631) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261083 d!62837))

(declare-fun d!62839 () Bool)

(declare-fun lt!131960 () (_ BitVec 32))

(assert (=> d!62839 (and (bvsge lt!131960 #b00000000000000000000000000000000) (bvsle lt!131960 (bvsub (size!6319 lt!131631) index!297)))))

(declare-fun e!169363 () (_ BitVec 32))

(assert (=> d!62839 (= lt!131960 e!169363)))

(declare-fun c!44486 () Bool)

(assert (=> d!62839 (= c!44486 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!62839 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6319 lt!131631)))))

(assert (=> d!62839 (= (arrayCountValidKeys!0 lt!131631 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!131960)))

(declare-fun bm!24953 () Bool)

(declare-fun call!24956 () (_ BitVec 32))

(assert (=> bm!24953 (= call!24956 (arrayCountValidKeys!0 lt!131631 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(declare-fun b!261364 () Bool)

(declare-fun e!169362 () (_ BitVec 32))

(assert (=> b!261364 (= e!169362 (bvadd #b00000000000000000000000000000001 call!24956))))

(declare-fun b!261365 () Bool)

(assert (=> b!261365 (= e!169363 #b00000000000000000000000000000000)))

(declare-fun b!261366 () Bool)

(assert (=> b!261366 (= e!169362 call!24956)))

(declare-fun b!261367 () Bool)

(assert (=> b!261367 (= e!169363 e!169362)))

(declare-fun c!44487 () Bool)

(assert (=> b!261367 (= c!44487 (validKeyInArray!0 (select (arr!5969 lt!131631) index!297)))))

(assert (= (and d!62839 c!44486) b!261365))

(assert (= (and d!62839 (not c!44486)) b!261367))

(assert (= (and b!261367 c!44487) b!261364))

(assert (= (and b!261367 (not c!44487)) b!261366))

(assert (= (or b!261364 b!261366) bm!24953))

(declare-fun m!277371 () Bool)

(assert (=> bm!24953 m!277371))

(assert (=> b!261367 m!276989))

(assert (=> b!261367 m!276989))

(assert (=> b!261367 m!276991))

(assert (=> d!62731 d!62839))

(declare-fun d!62841 () Bool)

(assert (=> d!62841 (= (arrayCountValidKeys!0 lt!131631 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!62841 true))

(declare-fun _$85!30 () Unit!8108)

(assert (=> d!62841 (= (choose!2 lt!131631 index!297) _$85!30)))

(declare-fun bs!9211 () Bool)

(assert (= bs!9211 d!62841))

(assert (=> bs!9211 m!276985))

(assert (=> d!62731 d!62841))

(assert (=> bm!24930 d!62807))

(declare-fun d!62843 () Bool)

(assert (=> d!62843 (= (apply!259 (+!701 lt!131759 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504))) lt!131748) (apply!259 lt!131759 lt!131748))))

(declare-fun lt!131961 () Unit!8108)

(assert (=> d!62843 (= lt!131961 (choose!1276 lt!131759 lt!131765 (zeroValue!4649 thiss!1504) lt!131748))))

(declare-fun e!169364 () Bool)

(assert (=> d!62843 e!169364))

(declare-fun res!127714 () Bool)

(assert (=> d!62843 (=> (not res!127714) (not e!169364))))

(assert (=> d!62843 (= res!127714 (contains!1894 lt!131759 lt!131748))))

(assert (=> d!62843 (= (addApplyDifferent!235 lt!131759 lt!131765 (zeroValue!4649 thiss!1504) lt!131748) lt!131961)))

(declare-fun b!261368 () Bool)

(assert (=> b!261368 (= e!169364 (not (= lt!131748 lt!131765)))))

(assert (= (and d!62843 res!127714) b!261368))

(declare-fun m!277373 () Bool)

(assert (=> d!62843 m!277373))

(assert (=> d!62843 m!276923))

(assert (=> d!62843 m!276919))

(assert (=> d!62843 m!276919))

(assert (=> d!62843 m!276921))

(declare-fun m!277375 () Bool)

(assert (=> d!62843 m!277375))

(assert (=> b!261058 d!62843))

(declare-fun d!62845 () Bool)

(declare-fun e!169365 () Bool)

(assert (=> d!62845 e!169365))

(declare-fun res!127715 () Bool)

(assert (=> d!62845 (=> (not res!127715) (not e!169365))))

(declare-fun lt!131965 () ListLongMap!3865)

(assert (=> d!62845 (= res!127715 (contains!1894 lt!131965 (_1!2487 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504)))))))

(declare-fun lt!131962 () List!3830)

(assert (=> d!62845 (= lt!131965 (ListLongMap!3866 lt!131962))))

(declare-fun lt!131963 () Unit!8108)

(declare-fun lt!131964 () Unit!8108)

(assert (=> d!62845 (= lt!131963 lt!131964)))

(assert (=> d!62845 (= (getValueByKey!317 lt!131962 (_1!2487 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62845 (= lt!131964 (lemmaContainsTupThenGetReturnValue!173 lt!131962 (_1!2487 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62845 (= lt!131962 (insertStrictlySorted!176 (toList!1948 lt!131759) (_1!2487 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62845 (= (+!701 lt!131759 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504))) lt!131965)))

(declare-fun b!261369 () Bool)

(declare-fun res!127716 () Bool)

(assert (=> b!261369 (=> (not res!127716) (not e!169365))))

(assert (=> b!261369 (= res!127716 (= (getValueByKey!317 (toList!1948 lt!131965) (_1!2487 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504))))))))

(declare-fun b!261370 () Bool)

(assert (=> b!261370 (= e!169365 (contains!1896 (toList!1948 lt!131965) (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504))))))

(assert (= (and d!62845 res!127715) b!261369))

(assert (= (and b!261369 res!127716) b!261370))

(declare-fun m!277377 () Bool)

(assert (=> d!62845 m!277377))

(declare-fun m!277379 () Bool)

(assert (=> d!62845 m!277379))

(declare-fun m!277381 () Bool)

(assert (=> d!62845 m!277381))

(declare-fun m!277383 () Bool)

(assert (=> d!62845 m!277383))

(declare-fun m!277385 () Bool)

(assert (=> b!261369 m!277385))

(declare-fun m!277387 () Bool)

(assert (=> b!261370 m!277387))

(assert (=> b!261058 d!62845))

(declare-fun d!62847 () Bool)

(assert (=> d!62847 (contains!1894 (+!701 lt!131749 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504))) lt!131754)))

(declare-fun lt!131966 () Unit!8108)

(assert (=> d!62847 (= lt!131966 (choose!1277 lt!131749 lt!131766 (zeroValue!4649 thiss!1504) lt!131754))))

(assert (=> d!62847 (contains!1894 lt!131749 lt!131754)))

(assert (=> d!62847 (= (addStillContains!235 lt!131749 lt!131766 (zeroValue!4649 thiss!1504) lt!131754) lt!131966)))

(declare-fun bs!9212 () Bool)

(assert (= bs!9212 d!62847))

(assert (=> bs!9212 m!276931))

(assert (=> bs!9212 m!276931))

(assert (=> bs!9212 m!276947))

(declare-fun m!277389 () Bool)

(assert (=> bs!9212 m!277389))

(declare-fun m!277391 () Bool)

(assert (=> bs!9212 m!277391))

(assert (=> b!261058 d!62847))

(declare-fun d!62849 () Bool)

(assert (=> d!62849 (= (apply!259 (+!701 lt!131763 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504))) lt!131755) (apply!259 lt!131763 lt!131755))))

(declare-fun lt!131967 () Unit!8108)

(assert (=> d!62849 (= lt!131967 (choose!1276 lt!131763 lt!131756 (minValue!4649 thiss!1504) lt!131755))))

(declare-fun e!169366 () Bool)

(assert (=> d!62849 e!169366))

(declare-fun res!127717 () Bool)

(assert (=> d!62849 (=> (not res!127717) (not e!169366))))

(assert (=> d!62849 (= res!127717 (contains!1894 lt!131763 lt!131755))))

(assert (=> d!62849 (= (addApplyDifferent!235 lt!131763 lt!131756 (minValue!4649 thiss!1504) lt!131755) lt!131967)))

(declare-fun b!261371 () Bool)

(assert (=> b!261371 (= e!169366 (not (= lt!131755 lt!131756)))))

(assert (= (and d!62849 res!127717) b!261371))

(declare-fun m!277393 () Bool)

(assert (=> d!62849 m!277393))

(assert (=> d!62849 m!276939))

(assert (=> d!62849 m!276933))

(assert (=> d!62849 m!276933))

(assert (=> d!62849 m!276935))

(declare-fun m!277395 () Bool)

(assert (=> d!62849 m!277395))

(assert (=> b!261058 d!62849))

(declare-fun b!261372 () Bool)

(declare-fun e!169367 () Bool)

(assert (=> b!261372 (= e!169367 (validKeyInArray!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(assert (=> b!261372 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!261373 () Bool)

(assert (=> b!261373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(assert (=> b!261373 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6318 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))))))))

(declare-fun e!169370 () Bool)

(declare-fun lt!131968 () ListLongMap!3865)

(assert (=> b!261373 (= e!169370 (= (apply!259 lt!131968 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)) (get!3077 (select (arr!5968 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261374 () Bool)

(declare-fun e!169373 () ListLongMap!3865)

(declare-fun e!169369 () ListLongMap!3865)

(assert (=> b!261374 (= e!169373 e!169369)))

(declare-fun c!44488 () Bool)

(assert (=> b!261374 (= c!44488 (validKeyInArray!0 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun b!261375 () Bool)

(declare-fun e!169371 () Bool)

(assert (=> b!261375 (= e!169371 (isEmpty!538 lt!131968))))

(declare-fun d!62851 () Bool)

(declare-fun e!169368 () Bool)

(assert (=> d!62851 e!169368))

(declare-fun res!127720 () Bool)

(assert (=> d!62851 (=> (not res!127720) (not e!169368))))

(assert (=> d!62851 (= res!127720 (not (contains!1894 lt!131968 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!62851 (= lt!131968 e!169373)))

(declare-fun c!44490 () Bool)

(assert (=> d!62851 (= c!44490 (bvsge #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(assert (=> d!62851 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62851 (= (getCurrentListMapNoExtraKeys!581 lt!131631 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4808 thiss!1504)) lt!131968)))

(declare-fun b!261376 () Bool)

(assert (=> b!261376 (= e!169373 (ListLongMap!3866 Nil!3827))))

(declare-fun b!261377 () Bool)

(declare-fun call!24957 () ListLongMap!3865)

(assert (=> b!261377 (= e!169369 call!24957)))

(declare-fun b!261378 () Bool)

(declare-fun res!127718 () Bool)

(assert (=> b!261378 (=> (not res!127718) (not e!169368))))

(assert (=> b!261378 (= res!127718 (not (contains!1894 lt!131968 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261379 () Bool)

(declare-fun lt!131974 () Unit!8108)

(declare-fun lt!131969 () Unit!8108)

(assert (=> b!261379 (= lt!131974 lt!131969)))

(declare-fun lt!131973 () (_ BitVec 64))

(declare-fun lt!131972 () (_ BitVec 64))

(declare-fun lt!131971 () ListLongMap!3865)

(declare-fun lt!131970 () V!8483)

(assert (=> b!261379 (not (contains!1894 (+!701 lt!131971 (tuple2!4953 lt!131972 lt!131970)) lt!131973))))

(assert (=> b!261379 (= lt!131969 (addStillNotContains!128 lt!131971 lt!131972 lt!131970 lt!131973))))

(assert (=> b!261379 (= lt!131973 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!261379 (= lt!131970 (get!3077 (select (arr!5968 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261379 (= lt!131972 (select (arr!5969 lt!131631) #b00000000000000000000000000000000))))

(assert (=> b!261379 (= lt!131971 call!24957)))

(assert (=> b!261379 (= e!169369 (+!701 call!24957 (tuple2!4953 (select (arr!5969 lt!131631) #b00000000000000000000000000000000) (get!3077 (select (arr!5968 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!261380 () Bool)

(declare-fun e!169372 () Bool)

(assert (=> b!261380 (= e!169368 e!169372)))

(declare-fun c!44491 () Bool)

(assert (=> b!261380 (= c!44491 e!169367)))

(declare-fun res!127721 () Bool)

(assert (=> b!261380 (=> (not res!127721) (not e!169367))))

(assert (=> b!261380 (= res!127721 (bvslt #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(declare-fun b!261381 () Bool)

(assert (=> b!261381 (= e!169372 e!169371)))

(declare-fun c!44489 () Bool)

(assert (=> b!261381 (= c!44489 (bvslt #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(declare-fun bm!24954 () Bool)

(assert (=> bm!24954 (= call!24957 (getCurrentListMapNoExtraKeys!581 lt!131631 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4808 thiss!1504)))))

(declare-fun b!261382 () Bool)

(assert (=> b!261382 (= e!169372 e!169370)))

(assert (=> b!261382 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6319 lt!131631)))))

(declare-fun res!127719 () Bool)

(assert (=> b!261382 (= res!127719 (contains!1894 lt!131968 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(assert (=> b!261382 (=> (not res!127719) (not e!169370))))

(declare-fun b!261383 () Bool)

(assert (=> b!261383 (= e!169371 (= lt!131968 (getCurrentListMapNoExtraKeys!581 lt!131631 (array!12610 (store (arr!5968 (_values!4791 thiss!1504)) index!297 (ValueCellFull!2970 v!346)) (size!6318 (_values!4791 thiss!1504))) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4808 thiss!1504))))))

(assert (= (and d!62851 c!44490) b!261376))

(assert (= (and d!62851 (not c!44490)) b!261374))

(assert (= (and b!261374 c!44488) b!261379))

(assert (= (and b!261374 (not c!44488)) b!261377))

(assert (= (or b!261379 b!261377) bm!24954))

(assert (= (and d!62851 res!127720) b!261378))

(assert (= (and b!261378 res!127718) b!261380))

(assert (= (and b!261380 res!127721) b!261372))

(assert (= (and b!261380 c!44491) b!261382))

(assert (= (and b!261380 (not c!44491)) b!261381))

(assert (= (and b!261382 res!127719) b!261373))

(assert (= (and b!261381 c!44489) b!261383))

(assert (= (and b!261381 (not c!44489)) b!261375))

(declare-fun b_lambda!8301 () Bool)

(assert (=> (not b_lambda!8301) (not b!261373)))

(assert (=> b!261373 t!8905))

(declare-fun b_and!13899 () Bool)

(assert (= b_and!13897 (and (=> t!8905 result!5415) b_and!13899)))

(declare-fun b_lambda!8303 () Bool)

(assert (=> (not b_lambda!8303) (not b!261379)))

(assert (=> b!261379 t!8905))

(declare-fun b_and!13901 () Bool)

(assert (= b_and!13899 (and (=> t!8905 result!5415) b_and!13901)))

(declare-fun m!277397 () Bool)

(assert (=> b!261375 m!277397))

(declare-fun m!277399 () Bool)

(assert (=> b!261383 m!277399))

(assert (=> b!261373 m!276883))

(assert (=> b!261373 m!276957))

(assert (=> b!261373 m!276959))

(assert (=> b!261373 m!276961))

(assert (=> b!261373 m!276883))

(declare-fun m!277401 () Bool)

(assert (=> b!261373 m!277401))

(assert (=> b!261373 m!276959))

(assert (=> b!261373 m!276957))

(assert (=> b!261374 m!276883))

(assert (=> b!261374 m!276883))

(assert (=> b!261374 m!276885))

(declare-fun m!277403 () Bool)

(assert (=> d!62851 m!277403))

(assert (=> d!62851 m!276785))

(assert (=> b!261372 m!276883))

(assert (=> b!261372 m!276883))

(assert (=> b!261372 m!276885))

(declare-fun m!277405 () Bool)

(assert (=> b!261378 m!277405))

(assert (=> bm!24954 m!277399))

(assert (=> b!261382 m!276883))

(assert (=> b!261382 m!276883))

(declare-fun m!277407 () Bool)

(assert (=> b!261382 m!277407))

(declare-fun m!277409 () Bool)

(assert (=> b!261379 m!277409))

(declare-fun m!277411 () Bool)

(assert (=> b!261379 m!277411))

(assert (=> b!261379 m!276883))

(assert (=> b!261379 m!276959))

(declare-fun m!277413 () Bool)

(assert (=> b!261379 m!277413))

(assert (=> b!261379 m!277409))

(assert (=> b!261379 m!276957))

(assert (=> b!261379 m!276959))

(assert (=> b!261379 m!276961))

(declare-fun m!277415 () Bool)

(assert (=> b!261379 m!277415))

(assert (=> b!261379 m!276957))

(assert (=> b!261058 d!62851))

(declare-fun d!62853 () Bool)

(assert (=> d!62853 (= (apply!259 lt!131763 lt!131755) (get!3078 (getValueByKey!317 (toList!1948 lt!131763) lt!131755)))))

(declare-fun bs!9213 () Bool)

(assert (= bs!9213 d!62853))

(declare-fun m!277417 () Bool)

(assert (=> bs!9213 m!277417))

(assert (=> bs!9213 m!277417))

(declare-fun m!277419 () Bool)

(assert (=> bs!9213 m!277419))

(assert (=> b!261058 d!62853))

(declare-fun d!62855 () Bool)

(declare-fun e!169374 () Bool)

(assert (=> d!62855 e!169374))

(declare-fun res!127722 () Bool)

(assert (=> d!62855 (=> (not res!127722) (not e!169374))))

(declare-fun lt!131978 () ListLongMap!3865)

(assert (=> d!62855 (= res!127722 (contains!1894 lt!131978 (_1!2487 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504)))))))

(declare-fun lt!131975 () List!3830)

(assert (=> d!62855 (= lt!131978 (ListLongMap!3866 lt!131975))))

(declare-fun lt!131976 () Unit!8108)

(declare-fun lt!131977 () Unit!8108)

(assert (=> d!62855 (= lt!131976 lt!131977)))

(assert (=> d!62855 (= (getValueByKey!317 lt!131975 (_1!2487 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504)))))))

(assert (=> d!62855 (= lt!131977 (lemmaContainsTupThenGetReturnValue!173 lt!131975 (_1!2487 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504)))))))

(assert (=> d!62855 (= lt!131975 (insertStrictlySorted!176 (toList!1948 lt!131757) (_1!2487 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504)))))))

(assert (=> d!62855 (= (+!701 lt!131757 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504))) lt!131978)))

(declare-fun b!261384 () Bool)

(declare-fun res!127723 () Bool)

(assert (=> b!261384 (=> (not res!127723) (not e!169374))))

(assert (=> b!261384 (= res!127723 (= (getValueByKey!317 (toList!1948 lt!131978) (_1!2487 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504))))))))

(declare-fun b!261385 () Bool)

(assert (=> b!261385 (= e!169374 (contains!1896 (toList!1948 lt!131978) (tuple2!4953 lt!131753 (minValue!4649 thiss!1504))))))

(assert (= (and d!62855 res!127722) b!261384))

(assert (= (and b!261384 res!127723) b!261385))

(declare-fun m!277421 () Bool)

(assert (=> d!62855 m!277421))

(declare-fun m!277423 () Bool)

(assert (=> d!62855 m!277423))

(declare-fun m!277425 () Bool)

(assert (=> d!62855 m!277425))

(declare-fun m!277427 () Bool)

(assert (=> d!62855 m!277427))

(declare-fun m!277429 () Bool)

(assert (=> b!261384 m!277429))

(declare-fun m!277431 () Bool)

(assert (=> b!261385 m!277431))

(assert (=> b!261058 d!62855))

(declare-fun d!62857 () Bool)

(assert (=> d!62857 (= (apply!259 (+!701 lt!131763 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504))) lt!131755) (get!3078 (getValueByKey!317 (toList!1948 (+!701 lt!131763 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504)))) lt!131755)))))

(declare-fun bs!9214 () Bool)

(assert (= bs!9214 d!62857))

(declare-fun m!277433 () Bool)

(assert (=> bs!9214 m!277433))

(assert (=> bs!9214 m!277433))

(declare-fun m!277435 () Bool)

(assert (=> bs!9214 m!277435))

(assert (=> b!261058 d!62857))

(declare-fun d!62859 () Bool)

(assert (=> d!62859 (= (apply!259 (+!701 lt!131759 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504))) lt!131748) (get!3078 (getValueByKey!317 (toList!1948 (+!701 lt!131759 (tuple2!4953 lt!131765 (zeroValue!4649 thiss!1504)))) lt!131748)))))

(declare-fun bs!9215 () Bool)

(assert (= bs!9215 d!62859))

(declare-fun m!277437 () Bool)

(assert (=> bs!9215 m!277437))

(assert (=> bs!9215 m!277437))

(declare-fun m!277439 () Bool)

(assert (=> bs!9215 m!277439))

(assert (=> b!261058 d!62859))

(declare-fun d!62861 () Bool)

(declare-fun e!169375 () Bool)

(assert (=> d!62861 e!169375))

(declare-fun res!127724 () Bool)

(assert (=> d!62861 (=> res!127724 e!169375)))

(declare-fun lt!131980 () Bool)

(assert (=> d!62861 (= res!127724 (not lt!131980))))

(declare-fun lt!131979 () Bool)

(assert (=> d!62861 (= lt!131980 lt!131979)))

(declare-fun lt!131981 () Unit!8108)

(declare-fun e!169376 () Unit!8108)

(assert (=> d!62861 (= lt!131981 e!169376)))

(declare-fun c!44492 () Bool)

(assert (=> d!62861 (= c!44492 lt!131979)))

(assert (=> d!62861 (= lt!131979 (containsKey!309 (toList!1948 (+!701 lt!131749 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504)))) lt!131754))))

(assert (=> d!62861 (= (contains!1894 (+!701 lt!131749 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504))) lt!131754) lt!131980)))

(declare-fun b!261386 () Bool)

(declare-fun lt!131982 () Unit!8108)

(assert (=> b!261386 (= e!169376 lt!131982)))

(assert (=> b!261386 (= lt!131982 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 (+!701 lt!131749 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504)))) lt!131754))))

(assert (=> b!261386 (isDefined!258 (getValueByKey!317 (toList!1948 (+!701 lt!131749 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504)))) lt!131754))))

(declare-fun b!261387 () Bool)

(declare-fun Unit!8124 () Unit!8108)

(assert (=> b!261387 (= e!169376 Unit!8124)))

(declare-fun b!261388 () Bool)

(assert (=> b!261388 (= e!169375 (isDefined!258 (getValueByKey!317 (toList!1948 (+!701 lt!131749 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504)))) lt!131754)))))

(assert (= (and d!62861 c!44492) b!261386))

(assert (= (and d!62861 (not c!44492)) b!261387))

(assert (= (and d!62861 (not res!127724)) b!261388))

(declare-fun m!277441 () Bool)

(assert (=> d!62861 m!277441))

(declare-fun m!277443 () Bool)

(assert (=> b!261386 m!277443))

(declare-fun m!277445 () Bool)

(assert (=> b!261386 m!277445))

(assert (=> b!261386 m!277445))

(declare-fun m!277447 () Bool)

(assert (=> b!261386 m!277447))

(assert (=> b!261388 m!277445))

(assert (=> b!261388 m!277445))

(assert (=> b!261388 m!277447))

(assert (=> b!261058 d!62861))

(declare-fun d!62863 () Bool)

(declare-fun e!169377 () Bool)

(assert (=> d!62863 e!169377))

(declare-fun res!127725 () Bool)

(assert (=> d!62863 (=> (not res!127725) (not e!169377))))

(declare-fun lt!131986 () ListLongMap!3865)

(assert (=> d!62863 (= res!127725 (contains!1894 lt!131986 (_1!2487 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504)))))))

(declare-fun lt!131983 () List!3830)

(assert (=> d!62863 (= lt!131986 (ListLongMap!3866 lt!131983))))

(declare-fun lt!131984 () Unit!8108)

(declare-fun lt!131985 () Unit!8108)

(assert (=> d!62863 (= lt!131984 lt!131985)))

(assert (=> d!62863 (= (getValueByKey!317 lt!131983 (_1!2487 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504)))))))

(assert (=> d!62863 (= lt!131985 (lemmaContainsTupThenGetReturnValue!173 lt!131983 (_1!2487 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504)))))))

(assert (=> d!62863 (= lt!131983 (insertStrictlySorted!176 (toList!1948 lt!131763) (_1!2487 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504)))))))

(assert (=> d!62863 (= (+!701 lt!131763 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504))) lt!131986)))

(declare-fun b!261389 () Bool)

(declare-fun res!127726 () Bool)

(assert (=> b!261389 (=> (not res!127726) (not e!169377))))

(assert (=> b!261389 (= res!127726 (= (getValueByKey!317 (toList!1948 lt!131986) (_1!2487 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131756 (minValue!4649 thiss!1504))))))))

(declare-fun b!261390 () Bool)

(assert (=> b!261390 (= e!169377 (contains!1896 (toList!1948 lt!131986) (tuple2!4953 lt!131756 (minValue!4649 thiss!1504))))))

(assert (= (and d!62863 res!127725) b!261389))

(assert (= (and b!261389 res!127726) b!261390))

(declare-fun m!277449 () Bool)

(assert (=> d!62863 m!277449))

(declare-fun m!277451 () Bool)

(assert (=> d!62863 m!277451))

(declare-fun m!277453 () Bool)

(assert (=> d!62863 m!277453))

(declare-fun m!277455 () Bool)

(assert (=> d!62863 m!277455))

(declare-fun m!277457 () Bool)

(assert (=> b!261389 m!277457))

(declare-fun m!277459 () Bool)

(assert (=> b!261390 m!277459))

(assert (=> b!261058 d!62863))

(declare-fun d!62865 () Bool)

(assert (=> d!62865 (= (apply!259 lt!131759 lt!131748) (get!3078 (getValueByKey!317 (toList!1948 lt!131759) lt!131748)))))

(declare-fun bs!9216 () Bool)

(assert (= bs!9216 d!62865))

(declare-fun m!277461 () Bool)

(assert (=> bs!9216 m!277461))

(assert (=> bs!9216 m!277461))

(declare-fun m!277463 () Bool)

(assert (=> bs!9216 m!277463))

(assert (=> b!261058 d!62865))

(declare-fun d!62867 () Bool)

(assert (=> d!62867 (= (apply!259 lt!131757 lt!131764) (get!3078 (getValueByKey!317 (toList!1948 lt!131757) lt!131764)))))

(declare-fun bs!9217 () Bool)

(assert (= bs!9217 d!62867))

(declare-fun m!277465 () Bool)

(assert (=> bs!9217 m!277465))

(assert (=> bs!9217 m!277465))

(declare-fun m!277467 () Bool)

(assert (=> bs!9217 m!277467))

(assert (=> b!261058 d!62867))

(declare-fun d!62869 () Bool)

(assert (=> d!62869 (= (apply!259 (+!701 lt!131757 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504))) lt!131764) (apply!259 lt!131757 lt!131764))))

(declare-fun lt!131987 () Unit!8108)

(assert (=> d!62869 (= lt!131987 (choose!1276 lt!131757 lt!131753 (minValue!4649 thiss!1504) lt!131764))))

(declare-fun e!169378 () Bool)

(assert (=> d!62869 e!169378))

(declare-fun res!127727 () Bool)

(assert (=> d!62869 (=> (not res!127727) (not e!169378))))

(assert (=> d!62869 (= res!127727 (contains!1894 lt!131757 lt!131764))))

(assert (=> d!62869 (= (addApplyDifferent!235 lt!131757 lt!131753 (minValue!4649 thiss!1504) lt!131764) lt!131987)))

(declare-fun b!261391 () Bool)

(assert (=> b!261391 (= e!169378 (not (= lt!131764 lt!131753)))))

(assert (= (and d!62869 res!127727) b!261391))

(declare-fun m!277469 () Bool)

(assert (=> d!62869 m!277469))

(assert (=> d!62869 m!276925))

(assert (=> d!62869 m!276937))

(assert (=> d!62869 m!276937))

(assert (=> d!62869 m!276941))

(declare-fun m!277471 () Bool)

(assert (=> d!62869 m!277471))

(assert (=> b!261058 d!62869))

(declare-fun d!62871 () Bool)

(declare-fun e!169379 () Bool)

(assert (=> d!62871 e!169379))

(declare-fun res!127728 () Bool)

(assert (=> d!62871 (=> (not res!127728) (not e!169379))))

(declare-fun lt!131991 () ListLongMap!3865)

(assert (=> d!62871 (= res!127728 (contains!1894 lt!131991 (_1!2487 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504)))))))

(declare-fun lt!131988 () List!3830)

(assert (=> d!62871 (= lt!131991 (ListLongMap!3866 lt!131988))))

(declare-fun lt!131989 () Unit!8108)

(declare-fun lt!131990 () Unit!8108)

(assert (=> d!62871 (= lt!131989 lt!131990)))

(assert (=> d!62871 (= (getValueByKey!317 lt!131988 (_1!2487 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62871 (= lt!131990 (lemmaContainsTupThenGetReturnValue!173 lt!131988 (_1!2487 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62871 (= lt!131988 (insertStrictlySorted!176 (toList!1948 lt!131749) (_1!2487 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504)))))))

(assert (=> d!62871 (= (+!701 lt!131749 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504))) lt!131991)))

(declare-fun b!261392 () Bool)

(declare-fun res!127729 () Bool)

(assert (=> b!261392 (=> (not res!127729) (not e!169379))))

(assert (=> b!261392 (= res!127729 (= (getValueByKey!317 (toList!1948 lt!131991) (_1!2487 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504))))))))

(declare-fun b!261393 () Bool)

(assert (=> b!261393 (= e!169379 (contains!1896 (toList!1948 lt!131991) (tuple2!4953 lt!131766 (zeroValue!4649 thiss!1504))))))

(assert (= (and d!62871 res!127728) b!261392))

(assert (= (and b!261392 res!127729) b!261393))

(declare-fun m!277473 () Bool)

(assert (=> d!62871 m!277473))

(declare-fun m!277475 () Bool)

(assert (=> d!62871 m!277475))

(declare-fun m!277477 () Bool)

(assert (=> d!62871 m!277477))

(declare-fun m!277479 () Bool)

(assert (=> d!62871 m!277479))

(declare-fun m!277481 () Bool)

(assert (=> b!261392 m!277481))

(declare-fun m!277483 () Bool)

(assert (=> b!261393 m!277483))

(assert (=> b!261058 d!62871))

(declare-fun d!62873 () Bool)

(assert (=> d!62873 (= (apply!259 (+!701 lt!131757 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504))) lt!131764) (get!3078 (getValueByKey!317 (toList!1948 (+!701 lt!131757 (tuple2!4953 lt!131753 (minValue!4649 thiss!1504)))) lt!131764)))))

(declare-fun bs!9218 () Bool)

(assert (= bs!9218 d!62873))

(declare-fun m!277485 () Bool)

(assert (=> bs!9218 m!277485))

(assert (=> bs!9218 m!277485))

(declare-fun m!277487 () Bool)

(assert (=> bs!9218 m!277487))

(assert (=> b!261058 d!62873))

(declare-fun d!62875 () Bool)

(declare-fun lt!131992 () (_ BitVec 32))

(assert (=> d!62875 (and (bvsge lt!131992 #b00000000000000000000000000000000) (bvsle lt!131992 (bvsub (size!6319 (_keys!6992 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!169381 () (_ BitVec 32))

(assert (=> d!62875 (= lt!131992 e!169381)))

(declare-fun c!44493 () Bool)

(assert (=> d!62875 (= c!44493 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> d!62875 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6319 (_keys!6992 thiss!1504)) (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> d!62875 (= (arrayCountValidKeys!0 (_keys!6992 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))) lt!131992)))

(declare-fun bm!24955 () Bool)

(declare-fun call!24958 () (_ BitVec 32))

(assert (=> bm!24955 (= call!24958 (arrayCountValidKeys!0 (_keys!6992 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!261394 () Bool)

(declare-fun e!169380 () (_ BitVec 32))

(assert (=> b!261394 (= e!169380 (bvadd #b00000000000000000000000000000001 call!24958))))

(declare-fun b!261395 () Bool)

(assert (=> b!261395 (= e!169381 #b00000000000000000000000000000000)))

(declare-fun b!261396 () Bool)

(assert (=> b!261396 (= e!169380 call!24958)))

(declare-fun b!261397 () Bool)

(assert (=> b!261397 (= e!169381 e!169380)))

(declare-fun c!44494 () Bool)

(assert (=> b!261397 (= c!44494 (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!62875 c!44493) b!261395))

(assert (= (and d!62875 (not c!44493)) b!261397))

(assert (= (and b!261397 c!44494) b!261394))

(assert (= (and b!261397 (not c!44494)) b!261396))

(assert (= (or b!261394 b!261396) bm!24955))

(declare-fun m!277489 () Bool)

(assert (=> bm!24955 m!277489))

(assert (=> b!261397 m!277349))

(assert (=> b!261397 m!277349))

(declare-fun m!277491 () Bool)

(assert (=> b!261397 m!277491))

(assert (=> bm!24893 d!62875))

(declare-fun d!62877 () Bool)

(declare-fun e!169382 () Bool)

(assert (=> d!62877 e!169382))

(declare-fun res!127730 () Bool)

(assert (=> d!62877 (=> (not res!127730) (not e!169382))))

(declare-fun lt!131996 () ListLongMap!3865)

(assert (=> d!62877 (= res!127730 (contains!1894 lt!131996 (_1!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(declare-fun lt!131993 () List!3830)

(assert (=> d!62877 (= lt!131996 (ListLongMap!3866 lt!131993))))

(declare-fun lt!131994 () Unit!8108)

(declare-fun lt!131995 () Unit!8108)

(assert (=> d!62877 (= lt!131994 lt!131995)))

(assert (=> d!62877 (= (getValueByKey!317 lt!131993 (_1!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(assert (=> d!62877 (= lt!131995 (lemmaContainsTupThenGetReturnValue!173 lt!131993 (_1!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(assert (=> d!62877 (= lt!131993 (insertStrictlySorted!176 (toList!1948 call!24931) (_1!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(assert (=> d!62877 (= (+!701 call!24931 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))) lt!131996)))

(declare-fun b!261398 () Bool)

(declare-fun res!127731 () Bool)

(assert (=> b!261398 (=> (not res!127731) (not e!169382))))

(assert (=> b!261398 (= res!127731 (= (getValueByKey!317 (toList!1948 lt!131996) (_1!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))))

(declare-fun b!261399 () Bool)

(assert (=> b!261399 (= e!169382 (contains!1896 (toList!1948 lt!131996) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))

(assert (= (and d!62877 res!127730) b!261398))

(assert (= (and b!261398 res!127731) b!261399))

(declare-fun m!277493 () Bool)

(assert (=> d!62877 m!277493))

(declare-fun m!277495 () Bool)

(assert (=> d!62877 m!277495))

(declare-fun m!277497 () Bool)

(assert (=> d!62877 m!277497))

(declare-fun m!277499 () Bool)

(assert (=> d!62877 m!277499))

(declare-fun m!277501 () Bool)

(assert (=> b!261398 m!277501))

(declare-fun m!277503 () Bool)

(assert (=> b!261399 m!277503))

(assert (=> b!261161 d!62877))

(declare-fun d!62879 () Bool)

(declare-fun res!127736 () Bool)

(declare-fun e!169387 () Bool)

(assert (=> d!62879 (=> res!127736 e!169387)))

(assert (=> d!62879 (= res!127736 (and ((_ is Cons!3826) (toList!1948 lt!131634)) (= (_1!2487 (h!4491 (toList!1948 lt!131634))) key!932)))))

(assert (=> d!62879 (= (containsKey!309 (toList!1948 lt!131634) key!932) e!169387)))

(declare-fun b!261404 () Bool)

(declare-fun e!169388 () Bool)

(assert (=> b!261404 (= e!169387 e!169388)))

(declare-fun res!127737 () Bool)

(assert (=> b!261404 (=> (not res!127737) (not e!169388))))

(assert (=> b!261404 (= res!127737 (and (or (not ((_ is Cons!3826) (toList!1948 lt!131634))) (bvsle (_1!2487 (h!4491 (toList!1948 lt!131634))) key!932)) ((_ is Cons!3826) (toList!1948 lt!131634)) (bvslt (_1!2487 (h!4491 (toList!1948 lt!131634))) key!932)))))

(declare-fun b!261405 () Bool)

(assert (=> b!261405 (= e!169388 (containsKey!309 (t!8901 (toList!1948 lt!131634)) key!932))))

(assert (= (and d!62879 (not res!127736)) b!261404))

(assert (= (and b!261404 res!127737) b!261405))

(declare-fun m!277505 () Bool)

(assert (=> b!261405 m!277505))

(assert (=> d!62749 d!62879))

(declare-fun d!62881 () Bool)

(assert (=> d!62881 (= (arrayCountValidKeys!0 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6992 thiss!1504) #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!62881 true))

(declare-fun _$84!45 () Unit!8108)

(assert (=> d!62881 (= (choose!1 (_keys!6992 thiss!1504) index!297 key!932) _$84!45)))

(declare-fun bs!9219 () Bool)

(assert (= bs!9219 d!62881))

(assert (=> bs!9219 m!276775))

(assert (=> bs!9219 m!276915))

(assert (=> bs!9219 m!276777))

(assert (=> d!62721 d!62881))

(declare-fun d!62883 () Bool)

(declare-fun e!169389 () Bool)

(assert (=> d!62883 e!169389))

(declare-fun res!127738 () Bool)

(assert (=> d!62883 (=> res!127738 e!169389)))

(declare-fun lt!131998 () Bool)

(assert (=> d!62883 (= res!127738 (not lt!131998))))

(declare-fun lt!131997 () Bool)

(assert (=> d!62883 (= lt!131998 lt!131997)))

(declare-fun lt!131999 () Unit!8108)

(declare-fun e!169390 () Unit!8108)

(assert (=> d!62883 (= lt!131999 e!169390)))

(declare-fun c!44495 () Bool)

(assert (=> d!62883 (= c!44495 lt!131997)))

(assert (=> d!62883 (= lt!131997 (containsKey!309 (toList!1948 lt!131834) (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!62883 (= (contains!1894 lt!131834 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)) lt!131998)))

(declare-fun b!261406 () Bool)

(declare-fun lt!132000 () Unit!8108)

(assert (=> b!261406 (= e!169390 lt!132000)))

(assert (=> b!261406 (= lt!132000 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 lt!131834) (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!261406 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131834) (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!261407 () Bool)

(declare-fun Unit!8125 () Unit!8108)

(assert (=> b!261407 (= e!169390 Unit!8125)))

(declare-fun b!261408 () Bool)

(assert (=> b!261408 (= e!169389 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131834) (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!62883 c!44495) b!261406))

(assert (= (and d!62883 (not c!44495)) b!261407))

(assert (= (and d!62883 (not res!127738)) b!261408))

(assert (=> d!62883 m!276893))

(declare-fun m!277507 () Bool)

(assert (=> d!62883 m!277507))

(assert (=> b!261406 m!276893))

(declare-fun m!277509 () Bool)

(assert (=> b!261406 m!277509))

(assert (=> b!261406 m!276893))

(declare-fun m!277511 () Bool)

(assert (=> b!261406 m!277511))

(assert (=> b!261406 m!277511))

(declare-fun m!277513 () Bool)

(assert (=> b!261406 m!277513))

(assert (=> b!261408 m!276893))

(assert (=> b!261408 m!277511))

(assert (=> b!261408 m!277511))

(assert (=> b!261408 m!277513))

(assert (=> b!261159 d!62883))

(declare-fun d!62885 () Bool)

(declare-fun e!169391 () Bool)

(assert (=> d!62885 e!169391))

(declare-fun res!127739 () Bool)

(assert (=> d!62885 (=> (not res!127739) (not e!169391))))

(declare-fun lt!132004 () ListLongMap!3865)

(assert (=> d!62885 (= res!127739 (contains!1894 lt!132004 (_1!2487 (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))))

(declare-fun lt!132001 () List!3830)

(assert (=> d!62885 (= lt!132004 (ListLongMap!3866 lt!132001))))

(declare-fun lt!132002 () Unit!8108)

(declare-fun lt!132003 () Unit!8108)

(assert (=> d!62885 (= lt!132002 lt!132003)))

(assert (=> d!62885 (= (getValueByKey!317 lt!132001 (_1!2487 (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))) (Some!322 (_2!2487 (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))))

(assert (=> d!62885 (= lt!132003 (lemmaContainsTupThenGetReturnValue!173 lt!132001 (_1!2487 (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))) (_2!2487 (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))))

(assert (=> d!62885 (= lt!132001 (insertStrictlySorted!176 (toList!1948 (ite c!44429 call!24937 (ite c!44427 call!24935 call!24934))) (_1!2487 (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))) (_2!2487 (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))))

(assert (=> d!62885 (= (+!701 (ite c!44429 call!24937 (ite c!44427 call!24935 call!24934)) (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))) lt!132004)))

(declare-fun b!261409 () Bool)

(declare-fun res!127740 () Bool)

(assert (=> b!261409 (=> (not res!127740) (not e!169391))))

(assert (=> b!261409 (= res!127740 (= (getValueByKey!317 (toList!1948 lt!132004) (_1!2487 (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))) (Some!322 (_2!2487 (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))))

(declare-fun b!261410 () Bool)

(assert (=> b!261410 (= e!169391 (contains!1896 (toList!1948 lt!132004) (ite (or c!44429 c!44427) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(assert (= (and d!62885 res!127739) b!261409))

(assert (= (and b!261409 res!127740) b!261410))

(declare-fun m!277515 () Bool)

(assert (=> d!62885 m!277515))

(declare-fun m!277517 () Bool)

(assert (=> d!62885 m!277517))

(declare-fun m!277519 () Bool)

(assert (=> d!62885 m!277519))

(declare-fun m!277521 () Bool)

(assert (=> d!62885 m!277521))

(declare-fun m!277523 () Bool)

(assert (=> b!261409 m!277523))

(declare-fun m!277525 () Bool)

(assert (=> b!261410 m!277525))

(assert (=> bm!24929 d!62885))

(declare-fun d!62887 () Bool)

(assert (=> d!62887 (= (apply!259 lt!131834 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3078 (getValueByKey!317 (toList!1948 lt!131834) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9220 () Bool)

(assert (= bs!9220 d!62887))

(assert (=> bs!9220 m!277345))

(assert (=> bs!9220 m!277345))

(declare-fun m!277527 () Bool)

(assert (=> bs!9220 m!277527))

(assert (=> b!261158 d!62887))

(assert (=> b!261053 d!62759))

(assert (=> d!62753 d!62755))

(declare-fun d!62889 () Bool)

(declare-fun e!169394 () Bool)

(assert (=> d!62889 e!169394))

(declare-fun res!127745 () Bool)

(assert (=> d!62889 (=> (not res!127745) (not e!169394))))

(declare-fun lt!132007 () SeekEntryResult!1185)

(assert (=> d!62889 (= res!127745 ((_ is Found!1185) lt!132007))))

(assert (=> d!62889 (= lt!132007 (seekEntryOrOpen!0 key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(assert (=> d!62889 true))

(declare-fun _$33!183 () Unit!8108)

(assert (=> d!62889 (= (choose!1275 (_keys!6992 thiss!1504) (_values!4791 thiss!1504) (mask!11145 thiss!1504) (extraKeys!4545 thiss!1504) (zeroValue!4649 thiss!1504) (minValue!4649 thiss!1504) key!932 (defaultEntry!4808 thiss!1504)) _$33!183)))

(declare-fun b!261415 () Bool)

(declare-fun res!127746 () Bool)

(assert (=> b!261415 (=> (not res!127746) (not e!169394))))

(assert (=> b!261415 (= res!127746 (inRange!0 (index!6911 lt!132007) (mask!11145 thiss!1504)))))

(declare-fun b!261416 () Bool)

(assert (=> b!261416 (= e!169394 (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6911 lt!132007)) key!932))))

(assert (= (and d!62889 res!127745) b!261415))

(assert (= (and b!261415 res!127746) b!261416))

(assert (=> d!62889 m!276753))

(declare-fun m!277529 () Bool)

(assert (=> b!261415 m!277529))

(declare-fun m!277531 () Bool)

(assert (=> b!261416 m!277531))

(assert (=> d!62753 d!62889))

(assert (=> d!62753 d!62715))

(declare-fun d!62891 () Bool)

(declare-fun e!169395 () Bool)

(assert (=> d!62891 e!169395))

(declare-fun res!127747 () Bool)

(assert (=> d!62891 (=> res!127747 e!169395)))

(declare-fun lt!132009 () Bool)

(assert (=> d!62891 (= res!127747 (not lt!132009))))

(declare-fun lt!132008 () Bool)

(assert (=> d!62891 (= lt!132009 lt!132008)))

(declare-fun lt!132010 () Unit!8108)

(declare-fun e!169396 () Unit!8108)

(assert (=> d!62891 (= lt!132010 e!169396)))

(declare-fun c!44496 () Bool)

(assert (=> d!62891 (= c!44496 lt!132008)))

(assert (=> d!62891 (= lt!132008 (containsKey!309 (toList!1948 lt!131769) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62891 (= (contains!1894 lt!131769 #b0000000000000000000000000000000000000000000000000000000000000000) lt!132009)))

(declare-fun b!261417 () Bool)

(declare-fun lt!132011 () Unit!8108)

(assert (=> b!261417 (= e!169396 lt!132011)))

(assert (=> b!261417 (= lt!132011 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 lt!131769) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261417 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131769) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261418 () Bool)

(declare-fun Unit!8126 () Unit!8108)

(assert (=> b!261418 (= e!169396 Unit!8126)))

(declare-fun b!261419 () Bool)

(assert (=> b!261419 (= e!169395 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131769) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62891 c!44496) b!261417))

(assert (= (and d!62891 (not c!44496)) b!261418))

(assert (= (and d!62891 (not res!127747)) b!261419))

(declare-fun m!277533 () Bool)

(assert (=> d!62891 m!277533))

(declare-fun m!277535 () Bool)

(assert (=> b!261417 m!277535))

(declare-fun m!277537 () Bool)

(assert (=> b!261417 m!277537))

(assert (=> b!261417 m!277537))

(declare-fun m!277539 () Bool)

(assert (=> b!261417 m!277539))

(assert (=> b!261419 m!277537))

(assert (=> b!261419 m!277537))

(assert (=> b!261419 m!277539))

(assert (=> bm!24915 d!62891))

(declare-fun b!261431 () Bool)

(declare-fun e!169402 () Option!323)

(assert (=> b!261431 (= e!169402 None!321)))

(declare-fun b!261430 () Bool)

(assert (=> b!261430 (= e!169402 (getValueByKey!317 (t!8901 (toList!1948 lt!131791)) (_1!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun b!261428 () Bool)

(declare-fun e!169401 () Option!323)

(assert (=> b!261428 (= e!169401 (Some!322 (_2!2487 (h!4491 (toList!1948 lt!131791)))))))

(declare-fun c!44501 () Bool)

(declare-fun d!62893 () Bool)

(assert (=> d!62893 (= c!44501 (and ((_ is Cons!3826) (toList!1948 lt!131791)) (= (_1!2487 (h!4491 (toList!1948 lt!131791))) (_1!2487 (tuple2!4953 key!932 v!346)))))))

(assert (=> d!62893 (= (getValueByKey!317 (toList!1948 lt!131791) (_1!2487 (tuple2!4953 key!932 v!346))) e!169401)))

(declare-fun b!261429 () Bool)

(assert (=> b!261429 (= e!169401 e!169402)))

(declare-fun c!44502 () Bool)

(assert (=> b!261429 (= c!44502 (and ((_ is Cons!3826) (toList!1948 lt!131791)) (not (= (_1!2487 (h!4491 (toList!1948 lt!131791))) (_1!2487 (tuple2!4953 key!932 v!346))))))))

(assert (= (and d!62893 c!44501) b!261428))

(assert (= (and d!62893 (not c!44501)) b!261429))

(assert (= (and b!261429 c!44502) b!261430))

(assert (= (and b!261429 (not c!44502)) b!261431))

(declare-fun m!277541 () Bool)

(assert (=> b!261430 m!277541))

(assert (=> b!261093 d!62893))

(declare-fun d!62895 () Bool)

(assert (=> d!62895 (arrayNoDuplicates!0 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) #b00000000000000000000000000000000 Nil!3828)))

(assert (=> d!62895 true))

(declare-fun _$65!95 () Unit!8108)

(assert (=> d!62895 (= (choose!41 (_keys!6992 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3828) _$65!95)))

(declare-fun bs!9221 () Bool)

(assert (= bs!9221 d!62895))

(assert (=> bs!9221 m!276775))

(assert (=> bs!9221 m!276907))

(assert (=> d!62719 d!62895))

(declare-fun d!62897 () Bool)

(declare-fun isEmpty!539 (Option!323) Bool)

(assert (=> d!62897 (= (isDefined!258 (getValueByKey!317 (toList!1948 lt!131634) key!932)) (not (isEmpty!539 (getValueByKey!317 (toList!1948 lt!131634) key!932))))))

(declare-fun bs!9222 () Bool)

(assert (= bs!9222 d!62897))

(assert (=> bs!9222 m!277027))

(declare-fun m!277543 () Bool)

(assert (=> bs!9222 m!277543))

(assert (=> b!261142 d!62897))

(declare-fun b!261435 () Bool)

(declare-fun e!169404 () Option!323)

(assert (=> b!261435 (= e!169404 None!321)))

(declare-fun b!261434 () Bool)

(assert (=> b!261434 (= e!169404 (getValueByKey!317 (t!8901 (toList!1948 lt!131634)) key!932))))

(declare-fun b!261432 () Bool)

(declare-fun e!169403 () Option!323)

(assert (=> b!261432 (= e!169403 (Some!322 (_2!2487 (h!4491 (toList!1948 lt!131634)))))))

(declare-fun d!62899 () Bool)

(declare-fun c!44503 () Bool)

(assert (=> d!62899 (= c!44503 (and ((_ is Cons!3826) (toList!1948 lt!131634)) (= (_1!2487 (h!4491 (toList!1948 lt!131634))) key!932)))))

(assert (=> d!62899 (= (getValueByKey!317 (toList!1948 lt!131634) key!932) e!169403)))

(declare-fun b!261433 () Bool)

(assert (=> b!261433 (= e!169403 e!169404)))

(declare-fun c!44504 () Bool)

(assert (=> b!261433 (= c!44504 (and ((_ is Cons!3826) (toList!1948 lt!131634)) (not (= (_1!2487 (h!4491 (toList!1948 lt!131634))) key!932))))))

(assert (= (and d!62899 c!44503) b!261432))

(assert (= (and d!62899 (not c!44503)) b!261433))

(assert (= (and b!261433 c!44504) b!261434))

(assert (= (and b!261433 (not c!44504)) b!261435))

(declare-fun m!277545 () Bool)

(assert (=> b!261434 m!277545))

(assert (=> b!261142 d!62899))

(declare-fun d!62901 () Bool)

(declare-fun lt!132014 () Bool)

(declare-fun content!175 (List!3831) (InoxSet (_ BitVec 64)))

(assert (=> d!62901 (= lt!132014 (select (content!175 Nil!3828) (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun e!169409 () Bool)

(assert (=> d!62901 (= lt!132014 e!169409)))

(declare-fun res!127752 () Bool)

(assert (=> d!62901 (=> (not res!127752) (not e!169409))))

(assert (=> d!62901 (= res!127752 ((_ is Cons!3827) Nil!3828))))

(assert (=> d!62901 (= (contains!1897 Nil!3828 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)) lt!132014)))

(declare-fun b!261440 () Bool)

(declare-fun e!169410 () Bool)

(assert (=> b!261440 (= e!169409 e!169410)))

(declare-fun res!127753 () Bool)

(assert (=> b!261440 (=> res!127753 e!169410)))

(assert (=> b!261440 (= res!127753 (= (h!4492 Nil!3828) (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun b!261441 () Bool)

(assert (=> b!261441 (= e!169410 (contains!1897 (t!8902 Nil!3828) (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(assert (= (and d!62901 res!127752) b!261440))

(assert (= (and b!261440 (not res!127753)) b!261441))

(declare-fun m!277547 () Bool)

(assert (=> d!62901 m!277547))

(assert (=> d!62901 m!276883))

(declare-fun m!277549 () Bool)

(assert (=> d!62901 m!277549))

(assert (=> b!261441 m!276883))

(declare-fun m!277551 () Bool)

(assert (=> b!261441 m!277551))

(assert (=> b!261107 d!62901))

(declare-fun b!261442 () Bool)

(declare-fun e!169413 () Bool)

(declare-fun e!169412 () Bool)

(assert (=> b!261442 (= e!169413 e!169412)))

(declare-fun c!44505 () Bool)

(assert (=> b!261442 (= c!44505 (validKeyInArray!0 (select (arr!5969 lt!131631) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!24956 () Bool)

(declare-fun call!24959 () Bool)

(assert (=> bm!24956 (= call!24959 (arrayNoDuplicates!0 lt!131631 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44505 (Cons!3827 (select (arr!5969 lt!131631) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44415 (Cons!3827 (select (arr!5969 lt!131631) #b00000000000000000000000000000000) Nil!3828) Nil!3828)) (ite c!44415 (Cons!3827 (select (arr!5969 lt!131631) #b00000000000000000000000000000000) Nil!3828) Nil!3828))))))

(declare-fun b!261443 () Bool)

(assert (=> b!261443 (= e!169412 call!24959)))

(declare-fun b!261444 () Bool)

(declare-fun e!169414 () Bool)

(assert (=> b!261444 (= e!169414 (contains!1897 (ite c!44415 (Cons!3827 (select (arr!5969 lt!131631) #b00000000000000000000000000000000) Nil!3828) Nil!3828) (select (arr!5969 lt!131631) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261445 () Bool)

(declare-fun e!169411 () Bool)

(assert (=> b!261445 (= e!169411 e!169413)))

(declare-fun res!127754 () Bool)

(assert (=> b!261445 (=> (not res!127754) (not e!169413))))

(assert (=> b!261445 (= res!127754 (not e!169414))))

(declare-fun res!127756 () Bool)

(assert (=> b!261445 (=> (not res!127756) (not e!169414))))

(assert (=> b!261445 (= res!127756 (validKeyInArray!0 (select (arr!5969 lt!131631) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62903 () Bool)

(declare-fun res!127755 () Bool)

(assert (=> d!62903 (=> res!127755 e!169411)))

(assert (=> d!62903 (= res!127755 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 lt!131631)))))

(assert (=> d!62903 (= (arrayNoDuplicates!0 lt!131631 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44415 (Cons!3827 (select (arr!5969 lt!131631) #b00000000000000000000000000000000) Nil!3828) Nil!3828)) e!169411)))

(declare-fun b!261446 () Bool)

(assert (=> b!261446 (= e!169412 call!24959)))

(assert (= (and d!62903 (not res!127755)) b!261445))

(assert (= (and b!261445 res!127756) b!261444))

(assert (= (and b!261445 res!127754) b!261442))

(assert (= (and b!261442 c!44505) b!261446))

(assert (= (and b!261442 (not c!44505)) b!261443))

(assert (= (or b!261446 b!261443) bm!24956))

(assert (=> b!261442 m!277333))

(assert (=> b!261442 m!277333))

(assert (=> b!261442 m!277335))

(assert (=> bm!24956 m!277333))

(declare-fun m!277553 () Bool)

(assert (=> bm!24956 m!277553))

(assert (=> b!261444 m!277333))

(assert (=> b!261444 m!277333))

(declare-fun m!277555 () Bool)

(assert (=> b!261444 m!277555))

(assert (=> b!261445 m!277333))

(assert (=> b!261445 m!277333))

(assert (=> b!261445 m!277335))

(assert (=> bm!24921 d!62903))

(declare-fun d!62905 () Bool)

(declare-fun lt!132015 () (_ BitVec 32))

(assert (=> d!62905 (and (bvsge lt!132015 #b00000000000000000000000000000000) (bvsle lt!132015 (bvsub (size!6319 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!169416 () (_ BitVec 32))

(assert (=> d!62905 (= lt!132015 e!169416)))

(declare-fun c!44506 () Bool)

(assert (=> d!62905 (= c!44506 (bvsge #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> d!62905 (and (bvsle #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6319 (_keys!6992 thiss!1504)) (size!6319 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))))))))

(assert (=> d!62905 (= (arrayCountValidKeys!0 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))) lt!132015)))

(declare-fun call!24960 () (_ BitVec 32))

(declare-fun bm!24957 () Bool)

(assert (=> bm!24957 (= call!24960 (arrayCountValidKeys!0 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 (_keys!6992 thiss!1504))))))

(declare-fun b!261447 () Bool)

(declare-fun e!169415 () (_ BitVec 32))

(assert (=> b!261447 (= e!169415 (bvadd #b00000000000000000000000000000001 call!24960))))

(declare-fun b!261448 () Bool)

(assert (=> b!261448 (= e!169416 #b00000000000000000000000000000000)))

(declare-fun b!261449 () Bool)

(assert (=> b!261449 (= e!169415 call!24960)))

(declare-fun b!261450 () Bool)

(assert (=> b!261450 (= e!169416 e!169415)))

(declare-fun c!44507 () Bool)

(assert (=> b!261450 (= c!44507 (validKeyInArray!0 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!62905 c!44506) b!261448))

(assert (= (and d!62905 (not c!44506)) b!261450))

(assert (= (and b!261450 c!44507) b!261447))

(assert (= (and b!261450 (not c!44507)) b!261449))

(assert (= (or b!261447 b!261449) bm!24957))

(declare-fun m!277557 () Bool)

(assert (=> bm!24957 m!277557))

(assert (=> b!261450 m!277133))

(assert (=> b!261450 m!277133))

(assert (=> b!261450 m!277169))

(assert (=> b!261005 d!62905))

(assert (=> b!261005 d!62713))

(assert (=> bm!24913 d!62851))

(declare-fun d!62907 () Bool)

(assert (=> d!62907 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!261003 d!62907))

(declare-fun d!62909 () Bool)

(assert (=> d!62909 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131634) key!932))))

(declare-fun lt!132018 () Unit!8108)

(declare-fun choose!1278 (List!3830 (_ BitVec 64)) Unit!8108)

(assert (=> d!62909 (= lt!132018 (choose!1278 (toList!1948 lt!131634) key!932))))

(declare-fun e!169419 () Bool)

(assert (=> d!62909 e!169419))

(declare-fun res!127759 () Bool)

(assert (=> d!62909 (=> (not res!127759) (not e!169419))))

(declare-fun isStrictlySorted!376 (List!3830) Bool)

(assert (=> d!62909 (= res!127759 (isStrictlySorted!376 (toList!1948 lt!131634)))))

(assert (=> d!62909 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 lt!131634) key!932) lt!132018)))

(declare-fun b!261453 () Bool)

(assert (=> b!261453 (= e!169419 (containsKey!309 (toList!1948 lt!131634) key!932))))

(assert (= (and d!62909 res!127759) b!261453))

(assert (=> d!62909 m!277027))

(assert (=> d!62909 m!277027))

(assert (=> d!62909 m!277029))

(declare-fun m!277559 () Bool)

(assert (=> d!62909 m!277559))

(declare-fun m!277561 () Bool)

(assert (=> d!62909 m!277561))

(assert (=> b!261453 m!277023))

(assert (=> b!261140 d!62909))

(assert (=> b!261140 d!62897))

(assert (=> b!261140 d!62899))

(declare-fun b!261454 () Bool)

(declare-fun e!169422 () Bool)

(declare-fun e!169421 () Bool)

(assert (=> b!261454 (= e!169422 e!169421)))

(declare-fun c!44508 () Bool)

(assert (=> b!261454 (= c!44508 (validKeyInArray!0 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun call!24961 () Bool)

(declare-fun bm!24958 () Bool)

(assert (=> bm!24958 (= call!24961 (arrayNoDuplicates!0 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44508 (Cons!3827 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000) Nil!3828) Nil!3828)))))

(declare-fun b!261455 () Bool)

(assert (=> b!261455 (= e!169421 call!24961)))

(declare-fun e!169423 () Bool)

(declare-fun b!261456 () Bool)

(assert (=> b!261456 (= e!169423 (contains!1897 Nil!3828 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!261457 () Bool)

(declare-fun e!169420 () Bool)

(assert (=> b!261457 (= e!169420 e!169422)))

(declare-fun res!127760 () Bool)

(assert (=> b!261457 (=> (not res!127760) (not e!169422))))

(assert (=> b!261457 (= res!127760 (not e!169423))))

(declare-fun res!127762 () Bool)

(assert (=> b!261457 (=> (not res!127762) (not e!169423))))

(assert (=> b!261457 (= res!127762 (validKeyInArray!0 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62911 () Bool)

(declare-fun res!127761 () Bool)

(assert (=> d!62911 (=> res!127761 e!169420)))

(assert (=> d!62911 (= res!127761 (bvsge #b00000000000000000000000000000000 (size!6319 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))))))))

(assert (=> d!62911 (= (arrayNoDuplicates!0 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) #b00000000000000000000000000000000 Nil!3828) e!169420)))

(declare-fun b!261458 () Bool)

(assert (=> b!261458 (= e!169421 call!24961)))

(assert (= (and d!62911 (not res!127761)) b!261457))

(assert (= (and b!261457 res!127762) b!261456))

(assert (= (and b!261457 res!127760) b!261454))

(assert (= (and b!261454 c!44508) b!261458))

(assert (= (and b!261454 (not c!44508)) b!261455))

(assert (= (or b!261458 b!261455) bm!24958))

(assert (=> b!261454 m!277133))

(assert (=> b!261454 m!277133))

(assert (=> b!261454 m!277169))

(assert (=> bm!24958 m!277133))

(declare-fun m!277563 () Bool)

(assert (=> bm!24958 m!277563))

(assert (=> b!261456 m!277133))

(assert (=> b!261456 m!277133))

(declare-fun m!277565 () Bool)

(assert (=> b!261456 m!277565))

(assert (=> b!261457 m!277133))

(assert (=> b!261457 m!277133))

(assert (=> b!261457 m!277169))

(assert (=> b!260993 d!62911))

(assert (=> b!260968 d!62759))

(declare-fun d!62913 () Bool)

(declare-fun e!169424 () Bool)

(assert (=> d!62913 e!169424))

(declare-fun res!127763 () Bool)

(assert (=> d!62913 (=> (not res!127763) (not e!169424))))

(declare-fun lt!132022 () ListLongMap!3865)

(assert (=> d!62913 (= res!127763 (contains!1894 lt!132022 (_1!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(declare-fun lt!132019 () List!3830)

(assert (=> d!62913 (= lt!132022 (ListLongMap!3866 lt!132019))))

(declare-fun lt!132020 () Unit!8108)

(declare-fun lt!132021 () Unit!8108)

(assert (=> d!62913 (= lt!132020 lt!132021)))

(assert (=> d!62913 (= (getValueByKey!317 lt!132019 (_1!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(assert (=> d!62913 (= lt!132021 (lemmaContainsTupThenGetReturnValue!173 lt!132019 (_1!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(assert (=> d!62913 (= lt!132019 (insertStrictlySorted!176 (toList!1948 call!24914) (_1!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))) (_2!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(assert (=> d!62913 (= (+!701 call!24914 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))) lt!132022)))

(declare-fun b!261459 () Bool)

(declare-fun res!127764 () Bool)

(assert (=> b!261459 (=> (not res!127764) (not e!169424))))

(assert (=> b!261459 (= res!127764 (= (getValueByKey!317 (toList!1948 lt!132022) (_1!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))) (Some!322 (_2!2487 (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))))

(declare-fun b!261460 () Bool)

(assert (=> b!261460 (= e!169424 (contains!1896 (toList!1948 lt!132022) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))

(assert (= (and d!62913 res!127763) b!261459))

(assert (= (and b!261459 res!127764) b!261460))

(declare-fun m!277567 () Bool)

(assert (=> d!62913 m!277567))

(declare-fun m!277569 () Bool)

(assert (=> d!62913 m!277569))

(declare-fun m!277571 () Bool)

(assert (=> d!62913 m!277571))

(declare-fun m!277573 () Bool)

(assert (=> d!62913 m!277573))

(declare-fun m!277575 () Bool)

(assert (=> b!261459 m!277575))

(declare-fun m!277577 () Bool)

(assert (=> b!261460 m!277577))

(assert (=> b!261066 d!62913))

(declare-fun d!62915 () Bool)

(assert (=> d!62915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (mask!11145 thiss!1504))))

(assert (=> d!62915 true))

(declare-fun _$56!42 () Unit!8108)

(assert (=> d!62915 (= (choose!102 key!932 (_keys!6992 thiss!1504) index!297 (mask!11145 thiss!1504)) _$56!42)))

(declare-fun bs!9223 () Bool)

(assert (= bs!9223 d!62915))

(assert (=> bs!9223 m!276775))

(assert (=> bs!9223 m!276977))

(assert (=> d!62727 d!62915))

(assert (=> d!62727 d!62715))

(declare-fun d!62917 () Bool)

(declare-fun e!169425 () Bool)

(assert (=> d!62917 e!169425))

(declare-fun res!127765 () Bool)

(assert (=> d!62917 (=> res!127765 e!169425)))

(declare-fun lt!132024 () Bool)

(assert (=> d!62917 (= res!127765 (not lt!132024))))

(declare-fun lt!132023 () Bool)

(assert (=> d!62917 (= lt!132024 lt!132023)))

(declare-fun lt!132025 () Unit!8108)

(declare-fun e!169426 () Unit!8108)

(assert (=> d!62917 (= lt!132025 e!169426)))

(declare-fun c!44509 () Bool)

(assert (=> d!62917 (= c!44509 lt!132023)))

(assert (=> d!62917 (= lt!132023 (containsKey!309 (toList!1948 lt!131769) (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(assert (=> d!62917 (= (contains!1894 lt!131769 (select (arr!5969 lt!131631) #b00000000000000000000000000000000)) lt!132024)))

(declare-fun b!261461 () Bool)

(declare-fun lt!132026 () Unit!8108)

(assert (=> b!261461 (= e!169426 lt!132026)))

(assert (=> b!261461 (= lt!132026 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 lt!131769) (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(assert (=> b!261461 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131769) (select (arr!5969 lt!131631) #b00000000000000000000000000000000)))))

(declare-fun b!261462 () Bool)

(declare-fun Unit!8127 () Unit!8108)

(assert (=> b!261462 (= e!169426 Unit!8127)))

(declare-fun b!261463 () Bool)

(assert (=> b!261463 (= e!169425 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131769) (select (arr!5969 lt!131631) #b00000000000000000000000000000000))))))

(assert (= (and d!62917 c!44509) b!261461))

(assert (= (and d!62917 (not c!44509)) b!261462))

(assert (= (and d!62917 (not res!127765)) b!261463))

(assert (=> d!62917 m!276883))

(declare-fun m!277579 () Bool)

(assert (=> d!62917 m!277579))

(assert (=> b!261461 m!276883))

(declare-fun m!277581 () Bool)

(assert (=> b!261461 m!277581))

(assert (=> b!261461 m!276883))

(assert (=> b!261461 m!277175))

(assert (=> b!261461 m!277175))

(declare-fun m!277583 () Bool)

(assert (=> b!261461 m!277583))

(assert (=> b!261463 m!276883))

(assert (=> b!261463 m!277175))

(assert (=> b!261463 m!277175))

(assert (=> b!261463 m!277583))

(assert (=> b!261064 d!62917))

(declare-fun d!62919 () Bool)

(declare-fun e!169427 () Bool)

(assert (=> d!62919 e!169427))

(declare-fun res!127766 () Bool)

(assert (=> d!62919 (=> (not res!127766) (not e!169427))))

(declare-fun lt!132030 () ListLongMap!3865)

(assert (=> d!62919 (= res!127766 (contains!1894 lt!132030 (_1!2487 (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))))

(declare-fun lt!132027 () List!3830)

(assert (=> d!62919 (= lt!132030 (ListLongMap!3866 lt!132027))))

(declare-fun lt!132028 () Unit!8108)

(declare-fun lt!132029 () Unit!8108)

(assert (=> d!62919 (= lt!132028 lt!132029)))

(assert (=> d!62919 (= (getValueByKey!317 lt!132027 (_1!2487 (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))) (Some!322 (_2!2487 (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))))

(assert (=> d!62919 (= lt!132029 (lemmaContainsTupThenGetReturnValue!173 lt!132027 (_1!2487 (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))) (_2!2487 (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))))

(assert (=> d!62919 (= lt!132027 (insertStrictlySorted!176 (toList!1948 (ite c!44409 call!24920 (ite c!44407 call!24918 call!24917))) (_1!2487 (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))) (_2!2487 (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))))))

(assert (=> d!62919 (= (+!701 (ite c!44409 call!24920 (ite c!44407 call!24918 call!24917)) (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))) lt!132030)))

(declare-fun b!261464 () Bool)

(declare-fun res!127767 () Bool)

(assert (=> b!261464 (=> (not res!127767) (not e!169427))))

(assert (=> b!261464 (= res!127767 (= (getValueByKey!317 (toList!1948 lt!132030) (_1!2487 (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504))))) (Some!322 (_2!2487 (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))))

(declare-fun b!261465 () Bool)

(assert (=> b!261465 (= e!169427 (contains!1896 (toList!1948 lt!132030) (ite (or c!44409 c!44407) (tuple2!4953 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4649 thiss!1504)) (tuple2!4953 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4649 thiss!1504)))))))

(assert (= (and d!62919 res!127766) b!261464))

(assert (= (and b!261464 res!127767) b!261465))

(declare-fun m!277585 () Bool)

(assert (=> d!62919 m!277585))

(declare-fun m!277587 () Bool)

(assert (=> d!62919 m!277587))

(declare-fun m!277589 () Bool)

(assert (=> d!62919 m!277589))

(declare-fun m!277591 () Bool)

(assert (=> d!62919 m!277591))

(declare-fun m!277593 () Bool)

(assert (=> b!261464 m!277593))

(declare-fun m!277595 () Bool)

(assert (=> b!261465 m!277595))

(assert (=> bm!24912 d!62919))

(declare-fun d!62921 () Bool)

(assert (=> d!62921 (= (apply!259 lt!131769 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3078 (getValueByKey!317 (toList!1948 lt!131769) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9224 () Bool)

(assert (= bs!9224 d!62921))

(assert (=> bs!9224 m!277537))

(assert (=> bs!9224 m!277537))

(declare-fun m!277597 () Bool)

(assert (=> bs!9224 m!277597))

(assert (=> b!261063 d!62921))

(declare-fun b!261466 () Bool)

(declare-fun e!169428 () Bool)

(declare-fun call!24962 () Bool)

(assert (=> b!261466 (= e!169428 call!24962)))

(declare-fun bm!24959 () Bool)

(assert (=> bm!24959 (= call!24962 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(declare-fun b!261467 () Bool)

(declare-fun e!169430 () Bool)

(declare-fun e!169429 () Bool)

(assert (=> b!261467 (= e!169430 e!169429)))

(declare-fun c!44510 () Bool)

(assert (=> b!261467 (= c!44510 (validKeyInArray!0 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!62923 () Bool)

(declare-fun res!127769 () Bool)

(assert (=> d!62923 (=> res!127769 e!169430)))

(assert (=> d!62923 (= res!127769 (bvsge #b00000000000000000000000000000000 (size!6319 (_keys!6992 thiss!1504))))))

(assert (=> d!62923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)) e!169430)))

(declare-fun b!261468 () Bool)

(assert (=> b!261468 (= e!169429 call!24962)))

(declare-fun b!261469 () Bool)

(assert (=> b!261469 (= e!169429 e!169428)))

(declare-fun lt!132032 () (_ BitVec 64))

(assert (=> b!261469 (= lt!132032 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!132031 () Unit!8108)

(assert (=> b!261469 (= lt!132031 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6992 thiss!1504) lt!132032 #b00000000000000000000000000000000))))

(assert (=> b!261469 (arrayContainsKey!0 (_keys!6992 thiss!1504) lt!132032 #b00000000000000000000000000000000)))

(declare-fun lt!132033 () Unit!8108)

(assert (=> b!261469 (= lt!132033 lt!132031)))

(declare-fun res!127768 () Bool)

(assert (=> b!261469 (= res!127768 (= (seekEntryOrOpen!0 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000) (_keys!6992 thiss!1504) (mask!11145 thiss!1504)) (Found!1185 #b00000000000000000000000000000000)))))

(assert (=> b!261469 (=> (not res!127768) (not e!169428))))

(assert (= (and d!62923 (not res!127769)) b!261467))

(assert (= (and b!261467 c!44510) b!261469))

(assert (= (and b!261467 (not c!44510)) b!261468))

(assert (= (and b!261469 res!127768) b!261466))

(assert (= (or b!261466 b!261468) bm!24959))

(declare-fun m!277599 () Bool)

(assert (=> bm!24959 m!277599))

(assert (=> b!261467 m!276893))

(assert (=> b!261467 m!276893))

(assert (=> b!261467 m!276895))

(assert (=> b!261469 m!276893))

(declare-fun m!277601 () Bool)

(assert (=> b!261469 m!277601))

(declare-fun m!277603 () Bool)

(assert (=> b!261469 m!277603))

(assert (=> b!261469 m!276893))

(declare-fun m!277605 () Bool)

(assert (=> b!261469 m!277605))

(assert (=> b!260955 d!62923))

(declare-fun b!261470 () Bool)

(declare-fun e!169431 () Bool)

(declare-fun call!24963 () Bool)

(assert (=> b!261470 (= e!169431 call!24963)))

(declare-fun bm!24960 () Bool)

(assert (=> bm!24960 (= call!24963 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (mask!11145 thiss!1504)))))

(declare-fun b!261471 () Bool)

(declare-fun e!169433 () Bool)

(declare-fun e!169432 () Bool)

(assert (=> b!261471 (= e!169433 e!169432)))

(declare-fun c!44511 () Bool)

(assert (=> b!261471 (= c!44511 (validKeyInArray!0 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!62925 () Bool)

(declare-fun res!127771 () Bool)

(assert (=> d!62925 (=> res!127771 e!169433)))

(assert (=> d!62925 (= res!127771 (bvsge #b00000000000000000000000000000000 (size!6319 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))))))))

(assert (=> d!62925 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (mask!11145 thiss!1504)) e!169433)))

(declare-fun b!261472 () Bool)

(assert (=> b!261472 (= e!169432 call!24963)))

(declare-fun b!261473 () Bool)

(assert (=> b!261473 (= e!169432 e!169431)))

(declare-fun lt!132035 () (_ BitVec 64))

(assert (=> b!261473 (= lt!132035 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!132034 () Unit!8108)

(assert (=> b!261473 (= lt!132034 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) lt!132035 #b00000000000000000000000000000000))))

(assert (=> b!261473 (arrayContainsKey!0 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) lt!132035 #b00000000000000000000000000000000)))

(declare-fun lt!132036 () Unit!8108)

(assert (=> b!261473 (= lt!132036 lt!132034)))

(declare-fun res!127770 () Bool)

(assert (=> b!261473 (= res!127770 (= (seekEntryOrOpen!0 (select (arr!5969 (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504)))) #b00000000000000000000000000000000) (array!12612 (store (arr!5969 (_keys!6992 thiss!1504)) index!297 key!932) (size!6319 (_keys!6992 thiss!1504))) (mask!11145 thiss!1504)) (Found!1185 #b00000000000000000000000000000000)))))

(assert (=> b!261473 (=> (not res!127770) (not e!169431))))

(assert (= (and d!62925 (not res!127771)) b!261471))

(assert (= (and b!261471 c!44511) b!261473))

(assert (= (and b!261471 (not c!44511)) b!261472))

(assert (= (and b!261473 res!127770) b!261470))

(assert (= (or b!261470 b!261472) bm!24960))

(declare-fun m!277607 () Bool)

(assert (=> bm!24960 m!277607))

(assert (=> b!261471 m!277133))

(assert (=> b!261471 m!277133))

(assert (=> b!261471 m!277169))

(assert (=> b!261473 m!277133))

(declare-fun m!277609 () Bool)

(assert (=> b!261473 m!277609))

(declare-fun m!277611 () Bool)

(assert (=> b!261473 m!277611))

(assert (=> b!261473 m!277133))

(declare-fun m!277613 () Bool)

(assert (=> b!261473 m!277613))

(assert (=> b!261075 d!62925))

(declare-fun d!62927 () Bool)

(declare-fun e!169434 () Bool)

(assert (=> d!62927 e!169434))

(declare-fun res!127772 () Bool)

(assert (=> d!62927 (=> res!127772 e!169434)))

(declare-fun lt!132038 () Bool)

(assert (=> d!62927 (= res!127772 (not lt!132038))))

(declare-fun lt!132037 () Bool)

(assert (=> d!62927 (= lt!132038 lt!132037)))

(declare-fun lt!132039 () Unit!8108)

(declare-fun e!169435 () Unit!8108)

(assert (=> d!62927 (= lt!132039 e!169435)))

(declare-fun c!44512 () Bool)

(assert (=> d!62927 (= c!44512 lt!132037)))

(assert (=> d!62927 (= lt!132037 (containsKey!309 (toList!1948 lt!131791) (_1!2487 (tuple2!4953 key!932 v!346))))))

(assert (=> d!62927 (= (contains!1894 lt!131791 (_1!2487 (tuple2!4953 key!932 v!346))) lt!132038)))

(declare-fun b!261474 () Bool)

(declare-fun lt!132040 () Unit!8108)

(assert (=> b!261474 (= e!169435 lt!132040)))

(assert (=> b!261474 (= lt!132040 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 lt!131791) (_1!2487 (tuple2!4953 key!932 v!346))))))

(assert (=> b!261474 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131791) (_1!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun b!261475 () Bool)

(declare-fun Unit!8128 () Unit!8108)

(assert (=> b!261475 (= e!169435 Unit!8128)))

(declare-fun b!261476 () Bool)

(assert (=> b!261476 (= e!169434 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131791) (_1!2487 (tuple2!4953 key!932 v!346)))))))

(assert (= (and d!62927 c!44512) b!261474))

(assert (= (and d!62927 (not c!44512)) b!261475))

(assert (= (and d!62927 (not res!127772)) b!261476))

(declare-fun m!277615 () Bool)

(assert (=> d!62927 m!277615))

(declare-fun m!277617 () Bool)

(assert (=> b!261474 m!277617))

(assert (=> b!261474 m!277003))

(assert (=> b!261474 m!277003))

(declare-fun m!277619 () Bool)

(assert (=> b!261474 m!277619))

(assert (=> b!261476 m!277003))

(assert (=> b!261476 m!277003))

(assert (=> b!261476 m!277619))

(assert (=> d!62735 d!62927))

(declare-fun b!261480 () Bool)

(declare-fun e!169437 () Option!323)

(assert (=> b!261480 (= e!169437 None!321)))

(declare-fun b!261479 () Bool)

(assert (=> b!261479 (= e!169437 (getValueByKey!317 (t!8901 lt!131788) (_1!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun b!261477 () Bool)

(declare-fun e!169436 () Option!323)

(assert (=> b!261477 (= e!169436 (Some!322 (_2!2487 (h!4491 lt!131788))))))

(declare-fun d!62929 () Bool)

(declare-fun c!44513 () Bool)

(assert (=> d!62929 (= c!44513 (and ((_ is Cons!3826) lt!131788) (= (_1!2487 (h!4491 lt!131788)) (_1!2487 (tuple2!4953 key!932 v!346)))))))

(assert (=> d!62929 (= (getValueByKey!317 lt!131788 (_1!2487 (tuple2!4953 key!932 v!346))) e!169436)))

(declare-fun b!261478 () Bool)

(assert (=> b!261478 (= e!169436 e!169437)))

(declare-fun c!44514 () Bool)

(assert (=> b!261478 (= c!44514 (and ((_ is Cons!3826) lt!131788) (not (= (_1!2487 (h!4491 lt!131788)) (_1!2487 (tuple2!4953 key!932 v!346))))))))

(assert (= (and d!62929 c!44513) b!261477))

(assert (= (and d!62929 (not c!44513)) b!261478))

(assert (= (and b!261478 c!44514) b!261479))

(assert (= (and b!261478 (not c!44514)) b!261480))

(declare-fun m!277621 () Bool)

(assert (=> b!261479 m!277621))

(assert (=> d!62735 d!62929))

(declare-fun d!62931 () Bool)

(assert (=> d!62931 (= (getValueByKey!317 lt!131788 (_1!2487 (tuple2!4953 key!932 v!346))) (Some!322 (_2!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun lt!132043 () Unit!8108)

(declare-fun choose!1279 (List!3830 (_ BitVec 64) V!8483) Unit!8108)

(assert (=> d!62931 (= lt!132043 (choose!1279 lt!131788 (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun e!169440 () Bool)

(assert (=> d!62931 e!169440))

(declare-fun res!127777 () Bool)

(assert (=> d!62931 (=> (not res!127777) (not e!169440))))

(assert (=> d!62931 (= res!127777 (isStrictlySorted!376 lt!131788))))

(assert (=> d!62931 (= (lemmaContainsTupThenGetReturnValue!173 lt!131788 (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346))) lt!132043)))

(declare-fun b!261485 () Bool)

(declare-fun res!127778 () Bool)

(assert (=> b!261485 (=> (not res!127778) (not e!169440))))

(assert (=> b!261485 (= res!127778 (containsKey!309 lt!131788 (_1!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun b!261486 () Bool)

(assert (=> b!261486 (= e!169440 (contains!1896 lt!131788 (tuple2!4953 (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346)))))))

(assert (= (and d!62931 res!127777) b!261485))

(assert (= (and b!261485 res!127778) b!261486))

(assert (=> d!62931 m!276997))

(declare-fun m!277623 () Bool)

(assert (=> d!62931 m!277623))

(declare-fun m!277625 () Bool)

(assert (=> d!62931 m!277625))

(declare-fun m!277627 () Bool)

(assert (=> b!261485 m!277627))

(declare-fun m!277629 () Bool)

(assert (=> b!261486 m!277629))

(assert (=> d!62735 d!62931))

(declare-fun e!169455 () List!3830)

(declare-fun b!261507 () Bool)

(assert (=> b!261507 (= e!169455 (insertStrictlySorted!176 (t!8901 (toList!1948 lt!131634)) (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun b!261508 () Bool)

(declare-fun e!169453 () List!3830)

(declare-fun call!24972 () List!3830)

(assert (=> b!261508 (= e!169453 call!24972)))

(declare-fun b!261509 () Bool)

(declare-fun c!44523 () Bool)

(assert (=> b!261509 (= c!44523 (and ((_ is Cons!3826) (toList!1948 lt!131634)) (bvsgt (_1!2487 (h!4491 (toList!1948 lt!131634))) (_1!2487 (tuple2!4953 key!932 v!346)))))))

(declare-fun e!169452 () List!3830)

(assert (=> b!261509 (= e!169452 e!169453)))

(declare-fun b!261510 () Bool)

(declare-fun call!24971 () List!3830)

(assert (=> b!261510 (= e!169452 call!24971)))

(declare-fun b!261511 () Bool)

(assert (=> b!261511 (= e!169453 call!24972)))

(declare-fun e!169451 () Bool)

(declare-fun b!261512 () Bool)

(declare-fun lt!132046 () List!3830)

(assert (=> b!261512 (= e!169451 (contains!1896 lt!132046 (tuple2!4953 (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346)))))))

(declare-fun bm!24967 () Bool)

(declare-fun call!24970 () List!3830)

(assert (=> bm!24967 (= call!24971 call!24970)))

(declare-fun c!44526 () Bool)

(declare-fun bm!24968 () Bool)

(declare-fun $colon$colon!107 (List!3830 tuple2!4952) List!3830)

(assert (=> bm!24968 (= call!24970 ($colon$colon!107 e!169455 (ite c!44526 (h!4491 (toList!1948 lt!131634)) (tuple2!4953 (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346))))))))

(declare-fun c!44525 () Bool)

(assert (=> bm!24968 (= c!44525 c!44526)))

(declare-fun bm!24969 () Bool)

(assert (=> bm!24969 (= call!24972 call!24971)))

(declare-fun b!261514 () Bool)

(declare-fun e!169454 () List!3830)

(assert (=> b!261514 (= e!169454 call!24970)))

(declare-fun b!261513 () Bool)

(declare-fun res!127784 () Bool)

(assert (=> b!261513 (=> (not res!127784) (not e!169451))))

(assert (=> b!261513 (= res!127784 (containsKey!309 lt!132046 (_1!2487 (tuple2!4953 key!932 v!346))))))

(declare-fun d!62933 () Bool)

(assert (=> d!62933 e!169451))

(declare-fun res!127783 () Bool)

(assert (=> d!62933 (=> (not res!127783) (not e!169451))))

(assert (=> d!62933 (= res!127783 (isStrictlySorted!376 lt!132046))))

(assert (=> d!62933 (= lt!132046 e!169454)))

(assert (=> d!62933 (= c!44526 (and ((_ is Cons!3826) (toList!1948 lt!131634)) (bvslt (_1!2487 (h!4491 (toList!1948 lt!131634))) (_1!2487 (tuple2!4953 key!932 v!346)))))))

(assert (=> d!62933 (isStrictlySorted!376 (toList!1948 lt!131634))))

(assert (=> d!62933 (= (insertStrictlySorted!176 (toList!1948 lt!131634) (_1!2487 (tuple2!4953 key!932 v!346)) (_2!2487 (tuple2!4953 key!932 v!346))) lt!132046)))

(declare-fun b!261515 () Bool)

(assert (=> b!261515 (= e!169454 e!169452)))

(declare-fun c!44524 () Bool)

(assert (=> b!261515 (= c!44524 (and ((_ is Cons!3826) (toList!1948 lt!131634)) (= (_1!2487 (h!4491 (toList!1948 lt!131634))) (_1!2487 (tuple2!4953 key!932 v!346)))))))

(declare-fun b!261516 () Bool)

(assert (=> b!261516 (= e!169455 (ite c!44524 (t!8901 (toList!1948 lt!131634)) (ite c!44523 (Cons!3826 (h!4491 (toList!1948 lt!131634)) (t!8901 (toList!1948 lt!131634))) Nil!3827)))))

(assert (= (and d!62933 c!44526) b!261514))

(assert (= (and d!62933 (not c!44526)) b!261515))

(assert (= (and b!261515 c!44524) b!261510))

(assert (= (and b!261515 (not c!44524)) b!261509))

(assert (= (and b!261509 c!44523) b!261508))

(assert (= (and b!261509 (not c!44523)) b!261511))

(assert (= (or b!261508 b!261511) bm!24969))

(assert (= (or b!261510 bm!24969) bm!24967))

(assert (= (or b!261514 bm!24967) bm!24968))

(assert (= (and bm!24968 c!44525) b!261507))

(assert (= (and bm!24968 (not c!44525)) b!261516))

(assert (= (and d!62933 res!127783) b!261513))

(assert (= (and b!261513 res!127784) b!261512))

(declare-fun m!277631 () Bool)

(assert (=> b!261507 m!277631))

(declare-fun m!277633 () Bool)

(assert (=> bm!24968 m!277633))

(declare-fun m!277635 () Bool)

(assert (=> b!261512 m!277635))

(declare-fun m!277637 () Bool)

(assert (=> b!261513 m!277637))

(declare-fun m!277639 () Bool)

(assert (=> d!62933 m!277639))

(assert (=> d!62933 m!277561))

(assert (=> d!62735 d!62933))

(declare-fun d!62935 () Bool)

(assert (=> d!62935 (= (apply!259 lt!131834 (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000)) (get!3078 (getValueByKey!317 (toList!1948 lt!131834) (select (arr!5969 (_keys!6992 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9225 () Bool)

(assert (= bs!9225 d!62935))

(assert (=> bs!9225 m!276893))

(assert (=> bs!9225 m!277511))

(assert (=> bs!9225 m!277511))

(declare-fun m!277641 () Bool)

(assert (=> bs!9225 m!277641))

(assert (=> b!261147 d!62935))

(declare-fun d!62937 () Bool)

(declare-fun c!44527 () Bool)

(assert (=> d!62937 (= c!44527 ((_ is ValueCellFull!2970) (select (arr!5968 (_values!4791 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!169456 () V!8483)

(assert (=> d!62937 (= (get!3077 (select (arr!5968 (_values!4791 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!169456)))

(declare-fun b!261517 () Bool)

(assert (=> b!261517 (= e!169456 (get!3079 (select (arr!5968 (_values!4791 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!261518 () Bool)

(assert (=> b!261518 (= e!169456 (get!3080 (select (arr!5968 (_values!4791 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!602 (defaultEntry!4808 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62937 c!44527) b!261517))

(assert (= (and d!62937 (not c!44527)) b!261518))

(assert (=> b!261517 m!277069))

(assert (=> b!261517 m!276959))

(declare-fun m!277643 () Bool)

(assert (=> b!261517 m!277643))

(assert (=> b!261518 m!277069))

(assert (=> b!261518 m!276959))

(declare-fun m!277645 () Bool)

(assert (=> b!261518 m!277645))

(assert (=> b!261147 d!62937))

(assert (=> bm!24927 d!62725))

(declare-fun d!62939 () Bool)

(assert (=> d!62939 (= (apply!259 lt!131834 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3078 (getValueByKey!317 (toList!1948 lt!131834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9226 () Bool)

(assert (= bs!9226 d!62939))

(declare-fun m!277647 () Bool)

(assert (=> bs!9226 m!277647))

(assert (=> bs!9226 m!277647))

(declare-fun m!277649 () Bool)

(assert (=> bs!9226 m!277649))

(assert (=> b!261146 d!62939))

(declare-fun b!261529 () Bool)

(declare-fun res!127795 () Bool)

(declare-fun e!169459 () Bool)

(assert (=> b!261529 (=> (not res!127795) (not e!169459))))

(declare-fun size!6322 (LongMapFixedSize!3840) (_ BitVec 32))

(assert (=> b!261529 (= res!127795 (= (size!6322 thiss!1504) (bvadd (_size!1969 thiss!1504) (bvsdiv (bvadd (extraKeys!4545 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!62941 () Bool)

(declare-fun res!127793 () Bool)

(assert (=> d!62941 (=> (not res!127793) (not e!169459))))

(assert (=> d!62941 (= res!127793 (validMask!0 (mask!11145 thiss!1504)))))

(assert (=> d!62941 (= (simpleValid!282 thiss!1504) e!169459)))

(declare-fun b!261530 () Bool)

(assert (=> b!261530 (= e!169459 (and (bvsge (extraKeys!4545 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4545 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1969 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!261527 () Bool)

(declare-fun res!127794 () Bool)

(assert (=> b!261527 (=> (not res!127794) (not e!169459))))

(assert (=> b!261527 (= res!127794 (and (= (size!6318 (_values!4791 thiss!1504)) (bvadd (mask!11145 thiss!1504) #b00000000000000000000000000000001)) (= (size!6319 (_keys!6992 thiss!1504)) (size!6318 (_values!4791 thiss!1504))) (bvsge (_size!1969 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1969 thiss!1504) (bvadd (mask!11145 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!261528 () Bool)

(declare-fun res!127796 () Bool)

(assert (=> b!261528 (=> (not res!127796) (not e!169459))))

(assert (=> b!261528 (= res!127796 (bvsge (size!6322 thiss!1504) (_size!1969 thiss!1504)))))

(assert (= (and d!62941 res!127793) b!261527))

(assert (= (and b!261527 res!127794) b!261528))

(assert (= (and b!261528 res!127796) b!261529))

(assert (= (and b!261529 res!127795) b!261530))

(declare-fun m!277651 () Bool)

(assert (=> b!261529 m!277651))

(assert (=> d!62941 m!276785))

(assert (=> b!261528 m!277651))

(assert (=> d!62705 d!62941))

(assert (=> d!62723 d!62715))

(assert (=> d!62751 d!62715))

(assert (=> d!62711 d!62709))

(declare-fun d!62943 () Bool)

(assert (=> d!62943 (arrayContainsKey!0 lt!131631 key!932 #b00000000000000000000000000000000)))

(assert (=> d!62943 true))

(declare-fun _$60!387 () Unit!8108)

(assert (=> d!62943 (= (choose!13 lt!131631 key!932 index!297) _$60!387)))

(declare-fun bs!9227 () Bool)

(assert (= bs!9227 d!62943))

(assert (=> bs!9227 m!276773))

(assert (=> d!62711 d!62943))

(assert (=> b!261088 d!62837))

(declare-fun b!261531 () Bool)

(declare-fun e!169460 () Bool)

(declare-fun call!24973 () Bool)

(assert (=> b!261531 (= e!169460 call!24973)))

(declare-fun bm!24970 () Bool)

(assert (=> bm!24970 (= call!24973 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!131631 (mask!11145 thiss!1504)))))

(declare-fun b!261532 () Bool)

(declare-fun e!169462 () Bool)

(declare-fun e!169461 () Bool)

(assert (=> b!261532 (= e!169462 e!169461)))

(declare-fun c!44528 () Bool)

(assert (=> b!261532 (= c!44528 (validKeyInArray!0 (select (arr!5969 lt!131631) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!62945 () Bool)

(declare-fun res!127798 () Bool)

(assert (=> d!62945 (=> res!127798 e!169462)))

(assert (=> d!62945 (= res!127798 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6319 lt!131631)))))

(assert (=> d!62945 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!131631 (mask!11145 thiss!1504)) e!169462)))

(declare-fun b!261533 () Bool)

(assert (=> b!261533 (= e!169461 call!24973)))

(declare-fun b!261534 () Bool)

(assert (=> b!261534 (= e!169461 e!169460)))

(declare-fun lt!132048 () (_ BitVec 64))

(assert (=> b!261534 (= lt!132048 (select (arr!5969 lt!131631) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!132047 () Unit!8108)

(assert (=> b!261534 (= lt!132047 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!131631 lt!132048 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!261534 (arrayContainsKey!0 lt!131631 lt!132048 #b00000000000000000000000000000000)))

(declare-fun lt!132049 () Unit!8108)

(assert (=> b!261534 (= lt!132049 lt!132047)))

(declare-fun res!127797 () Bool)

(assert (=> b!261534 (= res!127797 (= (seekEntryOrOpen!0 (select (arr!5969 lt!131631) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!131631 (mask!11145 thiss!1504)) (Found!1185 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!261534 (=> (not res!127797) (not e!169460))))

(assert (= (and d!62945 (not res!127798)) b!261532))

(assert (= (and b!261532 c!44528) b!261534))

(assert (= (and b!261532 (not c!44528)) b!261533))

(assert (= (and b!261534 res!127797) b!261531))

(assert (= (or b!261531 b!261533) bm!24970))

(declare-fun m!277653 () Bool)

(assert (=> bm!24970 m!277653))

(assert (=> b!261532 m!277333))

(assert (=> b!261532 m!277333))

(assert (=> b!261532 m!277335))

(assert (=> b!261534 m!277333))

(declare-fun m!277655 () Bool)

(assert (=> b!261534 m!277655))

(declare-fun m!277657 () Bool)

(assert (=> b!261534 m!277657))

(assert (=> b!261534 m!277333))

(declare-fun m!277659 () Bool)

(assert (=> b!261534 m!277659))

(assert (=> bm!24896 d!62945))

(assert (=> b!261145 d!62823))

(declare-fun d!62947 () Bool)

(assert (=> d!62947 (= (inRange!0 (ite c!44421 (index!6910 lt!131800) (index!6913 lt!131800)) (mask!11145 thiss!1504)) (and (bvsge (ite c!44421 (index!6910 lt!131800) (index!6913 lt!131800)) #b00000000000000000000000000000000) (bvslt (ite c!44421 (index!6910 lt!131800) (index!6913 lt!131800)) (bvadd (mask!11145 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!24926 d!62947))

(declare-fun d!62949 () Bool)

(declare-fun e!169463 () Bool)

(assert (=> d!62949 e!169463))

(declare-fun res!127799 () Bool)

(assert (=> d!62949 (=> res!127799 e!169463)))

(declare-fun lt!132051 () Bool)

(assert (=> d!62949 (= res!127799 (not lt!132051))))

(declare-fun lt!132050 () Bool)

(assert (=> d!62949 (= lt!132051 lt!132050)))

(declare-fun lt!132052 () Unit!8108)

(declare-fun e!169464 () Unit!8108)

(assert (=> d!62949 (= lt!132052 e!169464)))

(declare-fun c!44529 () Bool)

(assert (=> d!62949 (= c!44529 lt!132050)))

(assert (=> d!62949 (= lt!132050 (containsKey!309 (toList!1948 lt!131834) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!62949 (= (contains!1894 lt!131834 #b1000000000000000000000000000000000000000000000000000000000000000) lt!132051)))

(declare-fun b!261535 () Bool)

(declare-fun lt!132053 () Unit!8108)

(assert (=> b!261535 (= e!169464 lt!132053)))

(assert (=> b!261535 (= lt!132053 (lemmaContainsKeyImpliesGetValueByKeyDefined!257 (toList!1948 lt!131834) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261535 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131834) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261536 () Bool)

(declare-fun Unit!8129 () Unit!8108)

(assert (=> b!261536 (= e!169464 Unit!8129)))

(declare-fun b!261537 () Bool)

(assert (=> b!261537 (= e!169463 (isDefined!258 (getValueByKey!317 (toList!1948 lt!131834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!62949 c!44529) b!261535))

(assert (= (and d!62949 (not c!44529)) b!261536))

(assert (= (and d!62949 (not res!127799)) b!261537))

(declare-fun m!277661 () Bool)

(assert (=> d!62949 m!277661))

(declare-fun m!277663 () Bool)

(assert (=> b!261535 m!277663))

(assert (=> b!261535 m!277647))

(assert (=> b!261535 m!277647))

(declare-fun m!277665 () Bool)

(assert (=> b!261535 m!277665))

(assert (=> b!261537 m!277647))

(assert (=> b!261537 m!277647))

(assert (=> b!261537 m!277665))

(assert (=> bm!24934 d!62949))

(declare-fun d!62951 () Bool)

(declare-fun res!127800 () Bool)

(declare-fun e!169465 () Bool)

(assert (=> d!62951 (=> res!127800 e!169465)))

(assert (=> d!62951 (= res!127800 (= (select (arr!5969 lt!131631) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!62951 (= (arrayContainsKey!0 lt!131631 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!169465)))

(declare-fun b!261538 () Bool)

(declare-fun e!169466 () Bool)

(assert (=> b!261538 (= e!169465 e!169466)))

(declare-fun res!127801 () Bool)

(assert (=> b!261538 (=> (not res!127801) (not e!169466))))

(assert (=> b!261538 (= res!127801 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6319 lt!131631)))))

(declare-fun b!261539 () Bool)

(assert (=> b!261539 (= e!169466 (arrayContainsKey!0 lt!131631 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!62951 (not res!127800)) b!261538))

(assert (= (and b!261538 res!127801) b!261539))

(assert (=> d!62951 m!277333))

(declare-fun m!277667 () Bool)

(assert (=> b!261539 m!277667))

(assert (=> b!260974 d!62951))

(declare-fun d!62953 () Bool)

(declare-fun lt!132058 () SeekEntryResult!1185)

(assert (=> d!62953 (and (or ((_ is Undefined!1185) lt!132058) (not ((_ is Found!1185) lt!132058)) (and (bvsge (index!6911 lt!132058) #b00000000000000000000000000000000) (bvslt (index!6911 lt!132058) (size!6319 (_keys!6992 thiss!1504))))) (or ((_ is Undefined!1185) lt!132058) ((_ is Found!1185) lt!132058) (not ((_ is MissingVacant!1185) lt!132058)) (not (= (index!6913 lt!132058) (index!6912 lt!131847))) (and (bvsge (index!6913 lt!132058) #b00000000000000000000000000000000) (bvslt (index!6913 lt!132058) (size!6319 (_keys!6992 thiss!1504))))) (or ((_ is Undefined!1185) lt!132058) (ite ((_ is Found!1185) lt!132058) (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6911 lt!132058)) key!932) (and ((_ is MissingVacant!1185) lt!132058) (= (index!6913 lt!132058) (index!6912 lt!131847)) (= (select (arr!5969 (_keys!6992 thiss!1504)) (index!6913 lt!132058)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!169473 () SeekEntryResult!1185)

(assert (=> d!62953 (= lt!132058 e!169473)))

(declare-fun c!44536 () Bool)

(assert (=> d!62953 (= c!44536 (bvsge (x!25149 lt!131847) #b01111111111111111111111111111110))))

(declare-fun lt!132059 () (_ BitVec 64))

(assert (=> d!62953 (= lt!132059 (select (arr!5969 (_keys!6992 thiss!1504)) (index!6912 lt!131847)))))

(assert (=> d!62953 (validMask!0 (mask!11145 thiss!1504))))

(assert (=> d!62953 (= (seekKeyOrZeroReturnVacant!0 (x!25149 lt!131847) (index!6912 lt!131847) (index!6912 lt!131847) key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)) lt!132058)))

(declare-fun b!261552 () Bool)

(assert (=> b!261552 (= e!169473 Undefined!1185)))

(declare-fun b!261553 () Bool)

(declare-fun e!169475 () SeekEntryResult!1185)

(assert (=> b!261553 (= e!169475 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25149 lt!131847) #b00000000000000000000000000000001) (nextIndex!0 (index!6912 lt!131847) (x!25149 lt!131847) (mask!11145 thiss!1504)) (index!6912 lt!131847) key!932 (_keys!6992 thiss!1504) (mask!11145 thiss!1504)))))

(declare-fun b!261554 () Bool)

(declare-fun c!44538 () Bool)

(assert (=> b!261554 (= c!44538 (= lt!132059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169474 () SeekEntryResult!1185)

(assert (=> b!261554 (= e!169474 e!169475)))

(declare-fun b!261555 () Bool)

(assert (=> b!261555 (= e!169475 (MissingVacant!1185 (index!6912 lt!131847)))))

(declare-fun b!261556 () Bool)

(assert (=> b!261556 (= e!169474 (Found!1185 (index!6912 lt!131847)))))

(declare-fun b!261557 () Bool)

(assert (=> b!261557 (= e!169473 e!169474)))

(declare-fun c!44537 () Bool)

(assert (=> b!261557 (= c!44537 (= lt!132059 key!932))))

(assert (= (and d!62953 c!44536) b!261552))

(assert (= (and d!62953 (not c!44536)) b!261557))

(assert (= (and b!261557 c!44537) b!261556))

(assert (= (and b!261557 (not c!44537)) b!261554))

(assert (= (and b!261554 c!44538) b!261555))

(assert (= (and b!261554 (not c!44538)) b!261553))

(declare-fun m!277669 () Bool)

(assert (=> d!62953 m!277669))

(declare-fun m!277671 () Bool)

(assert (=> d!62953 m!277671))

(assert (=> d!62953 m!277101))

(assert (=> d!62953 m!276785))

(declare-fun m!277673 () Bool)

(assert (=> b!261553 m!277673))

(assert (=> b!261553 m!277673))

(declare-fun m!277675 () Bool)

(assert (=> b!261553 m!277675))

(assert (=> b!261183 d!62953))

(declare-fun d!62955 () Bool)

(declare-fun lt!132060 () (_ BitVec 32))

(assert (=> d!62955 (and (bvsge lt!132060 #b00000000000000000000000000000000) (bvsle lt!132060 (bvsub (size!6319 lt!131631) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun e!169477 () (_ BitVec 32))

(assert (=> d!62955 (= lt!132060 e!169477)))

(declare-fun c!44539 () Bool)

(assert (=> d!62955 (= c!44539 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!62955 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6319 lt!131631)))))

(assert (=> d!62955 (= (arrayCountValidKeys!0 lt!131631 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!132060)))

(declare-fun bm!24971 () Bool)

(declare-fun call!24974 () (_ BitVec 32))

(assert (=> bm!24971 (= call!24974 (arrayCountValidKeys!0 lt!131631 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(declare-fun b!261558 () Bool)

(declare-fun e!169476 () (_ BitVec 32))

(assert (=> b!261558 (= e!169476 (bvadd #b00000000000000000000000000000001 call!24974))))

(declare-fun b!261559 () Bool)

(assert (=> b!261559 (= e!169477 #b00000000000000000000000000000000)))

(declare-fun b!261560 () Bool)

(assert (=> b!261560 (= e!169476 call!24974)))

(declare-fun b!261561 () Bool)

(assert (=> b!261561 (= e!169477 e!169476)))

(declare-fun c!44540 () Bool)

(assert (=> b!261561 (= c!44540 (validKeyInArray!0 (select (arr!5969 lt!131631) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (= (and d!62955 c!44539) b!261559))

(assert (= (and d!62955 (not c!44539)) b!261561))

(assert (= (and b!261561 c!44540) b!261558))

(assert (= (and b!261561 (not c!44540)) b!261560))

(assert (= (or b!261558 b!261560) bm!24971))

(declare-fun m!277677 () Bool)

(assert (=> bm!24971 m!277677))

(declare-fun m!277679 () Bool)

(assert (=> b!261561 m!277679))

(assert (=> b!261561 m!277679))

(declare-fun m!277681 () Bool)

(assert (=> b!261561 m!277681))

(assert (=> bm!24918 d!62955))

(declare-fun b!261562 () Bool)

(declare-fun e!169479 () Bool)

(assert (=> b!261562 (= e!169479 tp_is_empty!6627)))

(declare-fun b!261563 () Bool)

(declare-fun e!169478 () Bool)

(assert (=> b!261563 (= e!169478 tp_is_empty!6627)))

(declare-fun mapNonEmpty!11302 () Bool)

(declare-fun mapRes!11302 () Bool)

(declare-fun tp!23632 () Bool)

(assert (=> mapNonEmpty!11302 (= mapRes!11302 (and tp!23632 e!169479))))

(declare-fun mapRest!11302 () (Array (_ BitVec 32) ValueCell!2970))

(declare-fun mapKey!11302 () (_ BitVec 32))

(declare-fun mapValue!11302 () ValueCell!2970)

(assert (=> mapNonEmpty!11302 (= mapRest!11301 (store mapRest!11302 mapKey!11302 mapValue!11302))))

(declare-fun condMapEmpty!11302 () Bool)

(declare-fun mapDefault!11302 () ValueCell!2970)

(assert (=> mapNonEmpty!11301 (= condMapEmpty!11302 (= mapRest!11301 ((as const (Array (_ BitVec 32) ValueCell!2970)) mapDefault!11302)))))

(assert (=> mapNonEmpty!11301 (= tp!23631 (and e!169478 mapRes!11302))))

(declare-fun mapIsEmpty!11302 () Bool)

(assert (=> mapIsEmpty!11302 mapRes!11302))

(assert (= (and mapNonEmpty!11301 condMapEmpty!11302) mapIsEmpty!11302))

(assert (= (and mapNonEmpty!11301 (not condMapEmpty!11302)) mapNonEmpty!11302))

(assert (= (and mapNonEmpty!11302 ((_ is ValueCellFull!2970) mapValue!11302)) b!261562))

(assert (= (and mapNonEmpty!11301 ((_ is ValueCellFull!2970) mapDefault!11302)) b!261563))

(declare-fun m!277683 () Bool)

(assert (=> mapNonEmpty!11302 m!277683))

(declare-fun b_lambda!8305 () Bool)

(assert (= b_lambda!8297 (or (and b!260867 b_free!6765) b_lambda!8305)))

(declare-fun b_lambda!8307 () Bool)

(assert (= b_lambda!8303 (or (and b!260867 b_free!6765) b_lambda!8307)))

(declare-fun b_lambda!8309 () Bool)

(assert (= b_lambda!8295 (or (and b!260867 b_free!6765) b_lambda!8309)))

(declare-fun b_lambda!8311 () Bool)

(assert (= b_lambda!8299 (or (and b!260867 b_free!6765) b_lambda!8311)))

(declare-fun b_lambda!8313 () Bool)

(assert (= b_lambda!8301 (or (and b!260867 b_free!6765) b_lambda!8313)))

(check-sat (not b!261513) (not b!261378) (not b!261471) (not d!62831) (not b!261267) (not b!261260) (not b!261379) (not b!261409) (not b!261372) (not b!261384) b_and!13901 (not bm!24970) (not d!62799) (not b!261417) (not d!62851) (not bm!24959) (not d!62889) (not b!261262) (not d!62805) (not mapNonEmpty!11302) (not b_next!6765) (not d!62845) (not b!261275) (not b!261419) (not d!62765) (not b!261463) (not b!261469) (not d!62757) (not bm!24957) (not b!261261) (not b!261304) (not b!261507) (not d!62909) (not bm!24950) (not b!261269) (not b!261397) (not b!261528) (not b!261406) (not bm!24937) (not b_lambda!8305) (not b!261219) (not b!261317) (not d!62775) (not b!261386) (not b!261512) (not d!62873) (not b!261456) (not b!261529) (not b!261460) (not d!62891) (not b!261467) (not b!261399) (not b!261265) (not b!261457) (not d!62769) (not bm!24936) (not b!261373) (not b!261383) (not b!261454) (not b!261351) (not b!261459) (not d!62841) (not b!261308) (not d!62953) (not b!261256) (not d!62861) (not b!261485) (not b!261346) (not d!62933) (not b!261441) tp_is_empty!6627 (not b!261345) (not b!261355) (not b!261209) (not bm!24949) (not d!62795) (not d!62847) (not b!261303) (not d!62781) (not b!261349) (not d!62777) (not d!62885) (not b!261561) (not bm!24944) (not b_lambda!8291) (not d!62791) (not bm!24956) (not b!261442) (not b!261359) (not b!261230) (not b!261518) (not d!62779) (not b!261385) (not b!261353) (not b!261258) (not b!261408) (not b!261348) (not b!261370) (not b!261453) (not b!261410) (not d!62917) (not b!261532) (not b_lambda!8309) (not b!261539) (not d!62857) (not b!261476) (not d!62855) (not b!261208) (not bm!24953) (not b!261305) (not bm!24954) (not d!62809) (not bm!24958) (not bm!24939) (not b!261430) (not d!62927) (not b!261357) (not b!261382) (not b!261206) (not b!261375) (not b!261405) (not b!261313) (not d!62801) (not d!62773) (not d!62895) (not d!62789) (not bm!24968) (not b!261202) (not bm!24941) (not d!62803) (not d!62835) (not d!62921) (not bm!24952) (not b!261390) (not b!261474) (not b!261444) (not b!261479) (not d!62859) (not b!261315) (not d!62853) (not d!62943) (not d!62865) (not b!261214) (not b!261367) (not d!62915) (not d!62881) (not d!62897) (not b!261389) (not b!261203) (not d!62871) (not d!62843) (not b!261276) (not b_lambda!8293) (not b!261535) (not b!261434) (not b!261229) (not d!62935) (not b!261369) (not b!261415) (not b!261445) (not b!261222) (not b!261398) (not d!62919) (not b!261392) (not b!261374) (not d!62807) (not d!62877) (not b!261465) (not b!261268) (not b!261309) (not d!62913) (not b!261263) (not b!261312) (not b!261534) (not d!62787) (not b!261220) (not bm!24960) (not d!62941) (not d!62811) (not b!261517) (not d!62901) (not bm!24971) (not b!261302) (not d!62761) (not d!62939) (not b!261388) (not b!261393) (not d!62783) (not d!62931) (not b!261450) (not b!261486) (not d!62763) (not bm!24955) (not d!62815) (not d!62825) (not d!62867) (not d!62869) (not b!261201) (not b!261207) (not d!62797) (not bm!24951) (not b_lambda!8307) (not b!261473) (not d!62785) (not d!62849) (not b!261266) (not d!62883) (not b!261464) (not d!62793) (not b!261537) (not b!261461) (not d!62863) (not d!62949) (not d!62887) (not d!62817) (not b_lambda!8311) (not b_lambda!8313) (not b!261553))
(check-sat b_and!13901 (not b_next!6765))
