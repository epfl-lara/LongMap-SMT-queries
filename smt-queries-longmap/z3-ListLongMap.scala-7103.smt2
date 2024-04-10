; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90066 () Bool)

(assert start!90066)

(declare-fun b!1031623 () Bool)

(declare-fun b_free!20673 () Bool)

(declare-fun b_next!20673 () Bool)

(assert (=> b!1031623 (= b_free!20673 (not b_next!20673))))

(declare-fun tp!73089 () Bool)

(declare-fun b_and!33113 () Bool)

(assert (=> b!1031623 (= tp!73089 b_and!33113)))

(declare-fun b!1031622 () Bool)

(declare-fun e!582687 () Bool)

(declare-fun tp_is_empty!24393 () Bool)

(assert (=> b!1031622 (= e!582687 tp_is_empty!24393)))

(declare-fun e!582686 () Bool)

(declare-fun e!582693 () Bool)

(declare-datatypes ((V!37397 0))(
  ( (V!37398 (val!12247 Int)) )
))
(declare-datatypes ((ValueCell!11493 0))(
  ( (ValueCellFull!11493 (v!14824 V!37397)) (EmptyCell!11493) )
))
(declare-datatypes ((array!64850 0))(
  ( (array!64851 (arr!31227 (Array (_ BitVec 32) (_ BitVec 64))) (size!31744 (_ BitVec 32))) )
))
(declare-datatypes ((array!64852 0))(
  ( (array!64853 (arr!31228 (Array (_ BitVec 32) ValueCell!11493)) (size!31745 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5580 0))(
  ( (LongMapFixedSize!5581 (defaultEntry!6164 Int) (mask!29964 (_ BitVec 32)) (extraKeys!5896 (_ BitVec 32)) (zeroValue!6000 V!37397) (minValue!6000 V!37397) (_size!2845 (_ BitVec 32)) (_keys!11337 array!64850) (_values!6187 array!64852) (_vacant!2845 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5580)

(declare-fun array_inv!24171 (array!64850) Bool)

(declare-fun array_inv!24172 (array!64852) Bool)

(assert (=> b!1031623 (= e!582686 (and tp!73089 tp_is_empty!24393 (array_inv!24171 (_keys!11337 thiss!1427)) (array_inv!24172 (_values!6187 thiss!1427)) e!582693))))

(declare-fun b!1031624 () Bool)

(declare-fun res!689762 () Bool)

(declare-fun e!582692 () Bool)

(assert (=> b!1031624 (=> res!689762 e!582692)))

(declare-datatypes ((Unit!33749 0))(
  ( (Unit!33750) )
))
(declare-datatypes ((tuple2!15676 0))(
  ( (tuple2!15677 (_1!7849 Unit!33749) (_2!7849 LongMapFixedSize!5580)) )
))
(declare-fun lt!455522 () tuple2!15676)

(assert (=> b!1031624 (= res!689762 (or (not (= (size!31745 (_values!6187 (_2!7849 lt!455522))) (bvadd #b00000000000000000000000000000001 (mask!29964 (_2!7849 lt!455522))))) (not (= (size!31744 (_keys!11337 (_2!7849 lt!455522))) (size!31745 (_values!6187 (_2!7849 lt!455522))))) (bvslt (mask!29964 (_2!7849 lt!455522)) #b00000000000000000000000000000000) (bvslt (extraKeys!5896 (_2!7849 lt!455522)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5896 (_2!7849 lt!455522)) #b00000000000000000000000000000011)))))

(declare-fun b!1031625 () Bool)

(declare-fun e!582689 () Bool)

(assert (=> b!1031625 (= e!582689 (not e!582692))))

(declare-fun res!689758 () Bool)

(assert (=> b!1031625 (=> res!689758 e!582692)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15678 0))(
  ( (tuple2!15679 (_1!7850 (_ BitVec 64)) (_2!7850 V!37397)) )
))
(declare-datatypes ((List!21875 0))(
  ( (Nil!21872) (Cons!21871 (h!23073 tuple2!15678) (t!31043 List!21875)) )
))
(declare-datatypes ((ListLongMap!13733 0))(
  ( (ListLongMap!13734 (toList!6882 List!21875)) )
))
(declare-fun contains!5996 (ListLongMap!13733 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3930 (array!64850 array!64852 (_ BitVec 32) (_ BitVec 32) V!37397 V!37397 (_ BitVec 32) Int) ListLongMap!13733)

(assert (=> b!1031625 (= res!689758 (not (contains!5996 (getCurrentListMap!3930 (_keys!11337 (_2!7849 lt!455522)) (_values!6187 (_2!7849 lt!455522)) (mask!29964 (_2!7849 lt!455522)) (extraKeys!5896 (_2!7849 lt!455522)) (zeroValue!6000 (_2!7849 lt!455522)) (minValue!6000 (_2!7849 lt!455522)) #b00000000000000000000000000000000 (defaultEntry!6164 (_2!7849 lt!455522))) key!909)))))

(declare-fun lt!455531 () array!64852)

(declare-fun lt!455529 () array!64850)

(declare-fun Unit!33751 () Unit!33749)

(declare-fun Unit!33752 () Unit!33749)

(assert (=> b!1031625 (= lt!455522 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2845 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15677 Unit!33751 (LongMapFixedSize!5581 (defaultEntry!6164 thiss!1427) (mask!29964 thiss!1427) (extraKeys!5896 thiss!1427) (zeroValue!6000 thiss!1427) (minValue!6000 thiss!1427) (bvsub (_size!2845 thiss!1427) #b00000000000000000000000000000001) lt!455529 lt!455531 (bvadd #b00000000000000000000000000000001 (_vacant!2845 thiss!1427)))) (tuple2!15677 Unit!33752 (LongMapFixedSize!5581 (defaultEntry!6164 thiss!1427) (mask!29964 thiss!1427) (extraKeys!5896 thiss!1427) (zeroValue!6000 thiss!1427) (minValue!6000 thiss!1427) (bvsub (_size!2845 thiss!1427) #b00000000000000000000000000000001) lt!455529 lt!455531 (_vacant!2845 thiss!1427)))))))

(declare-fun -!509 (ListLongMap!13733 (_ BitVec 64)) ListLongMap!13733)

(assert (=> b!1031625 (= (-!509 (getCurrentListMap!3930 (_keys!11337 thiss!1427) (_values!6187 thiss!1427) (mask!29964 thiss!1427) (extraKeys!5896 thiss!1427) (zeroValue!6000 thiss!1427) (minValue!6000 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6164 thiss!1427)) key!909) (getCurrentListMap!3930 lt!455529 lt!455531 (mask!29964 thiss!1427) (extraKeys!5896 thiss!1427) (zeroValue!6000 thiss!1427) (minValue!6000 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6164 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9712 0))(
  ( (MissingZero!9712 (index!41219 (_ BitVec 32))) (Found!9712 (index!41220 (_ BitVec 32))) (Intermediate!9712 (undefined!10524 Bool) (index!41221 (_ BitVec 32)) (x!91878 (_ BitVec 32))) (Undefined!9712) (MissingVacant!9712 (index!41222 (_ BitVec 32))) )
))
(declare-fun lt!455530 () SeekEntryResult!9712)

(declare-fun dynLambda!1979 (Int (_ BitVec 64)) V!37397)

(assert (=> b!1031625 (= lt!455531 (array!64853 (store (arr!31228 (_values!6187 thiss!1427)) (index!41220 lt!455530) (ValueCellFull!11493 (dynLambda!1979 (defaultEntry!6164 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31745 (_values!6187 thiss!1427))))))

(declare-fun lt!455527 () Unit!33749)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!35 (array!64850 array!64852 (_ BitVec 32) (_ BitVec 32) V!37397 V!37397 (_ BitVec 32) (_ BitVec 64) Int) Unit!33749)

(assert (=> b!1031625 (= lt!455527 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!35 (_keys!11337 thiss!1427) (_values!6187 thiss!1427) (mask!29964 thiss!1427) (extraKeys!5896 thiss!1427) (zeroValue!6000 thiss!1427) (minValue!6000 thiss!1427) (index!41220 lt!455530) key!909 (defaultEntry!6164 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031625 (not (arrayContainsKey!0 lt!455529 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455524 () Unit!33749)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64850 (_ BitVec 32) (_ BitVec 64)) Unit!33749)

(assert (=> b!1031625 (= lt!455524 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11337 thiss!1427) (index!41220 lt!455530) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64850 (_ BitVec 32)) Bool)

(assert (=> b!1031625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455529 (mask!29964 thiss!1427))))

(declare-fun lt!455525 () Unit!33749)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64850 (_ BitVec 32) (_ BitVec 32)) Unit!33749)

(assert (=> b!1031625 (= lt!455525 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11337 thiss!1427) (index!41220 lt!455530) (mask!29964 thiss!1427)))))

(declare-datatypes ((List!21876 0))(
  ( (Nil!21873) (Cons!21872 (h!23074 (_ BitVec 64)) (t!31044 List!21876)) )
))
(declare-fun arrayNoDuplicates!0 (array!64850 (_ BitVec 32) List!21876) Bool)

(assert (=> b!1031625 (arrayNoDuplicates!0 lt!455529 #b00000000000000000000000000000000 Nil!21873)))

(declare-fun lt!455523 () Unit!33749)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64850 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21876) Unit!33749)

(assert (=> b!1031625 (= lt!455523 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11337 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41220 lt!455530) #b00000000000000000000000000000000 Nil!21873))))

(declare-fun arrayCountValidKeys!0 (array!64850 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031625 (= (arrayCountValidKeys!0 lt!455529 #b00000000000000000000000000000000 (size!31744 (_keys!11337 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11337 thiss!1427) #b00000000000000000000000000000000 (size!31744 (_keys!11337 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031625 (= lt!455529 (array!64851 (store (arr!31227 (_keys!11337 thiss!1427)) (index!41220 lt!455530) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31744 (_keys!11337 thiss!1427))))))

(declare-fun lt!455526 () Unit!33749)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64850 (_ BitVec 32) (_ BitVec 64)) Unit!33749)

(assert (=> b!1031625 (= lt!455526 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11337 thiss!1427) (index!41220 lt!455530) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031626 () Bool)

(declare-fun res!689760 () Bool)

(assert (=> b!1031626 (=> res!689760 e!582692)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031626 (= res!689760 (not (validMask!0 (mask!29964 (_2!7849 lt!455522)))))))

(declare-fun mapIsEmpty!38043 () Bool)

(declare-fun mapRes!38043 () Bool)

(assert (=> mapIsEmpty!38043 mapRes!38043))

(declare-fun b!1031627 () Bool)

(assert (=> b!1031627 (= e!582692 true)))

(declare-fun lt!455528 () Bool)

(assert (=> b!1031627 (= lt!455528 (arrayNoDuplicates!0 (_keys!11337 (_2!7849 lt!455522)) #b00000000000000000000000000000000 Nil!21873))))

(declare-fun b!1031628 () Bool)

(assert (=> b!1031628 (= e!582693 (and e!582687 mapRes!38043))))

(declare-fun condMapEmpty!38043 () Bool)

(declare-fun mapDefault!38043 () ValueCell!11493)

(assert (=> b!1031628 (= condMapEmpty!38043 (= (arr!31228 (_values!6187 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11493)) mapDefault!38043)))))

(declare-fun res!689761 () Bool)

(declare-fun e!582690 () Bool)

(assert (=> start!90066 (=> (not res!689761) (not e!582690))))

(declare-fun valid!2113 (LongMapFixedSize!5580) Bool)

(assert (=> start!90066 (= res!689761 (valid!2113 thiss!1427))))

(assert (=> start!90066 e!582690))

(assert (=> start!90066 e!582686))

(assert (=> start!90066 true))

(declare-fun b!1031629 () Bool)

(declare-fun res!689759 () Bool)

(assert (=> b!1031629 (=> res!689759 e!582692)))

(assert (=> b!1031629 (= res!689759 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11337 (_2!7849 lt!455522)) (mask!29964 (_2!7849 lt!455522)))))))

(declare-fun b!1031630 () Bool)

(assert (=> b!1031630 (= e!582690 e!582689)))

(declare-fun res!689757 () Bool)

(assert (=> b!1031630 (=> (not res!689757) (not e!582689))))

(get-info :version)

(assert (=> b!1031630 (= res!689757 ((_ is Found!9712) lt!455530))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64850 (_ BitVec 32)) SeekEntryResult!9712)

(assert (=> b!1031630 (= lt!455530 (seekEntry!0 key!909 (_keys!11337 thiss!1427) (mask!29964 thiss!1427)))))

(declare-fun b!1031631 () Bool)

(declare-fun res!689756 () Bool)

(assert (=> b!1031631 (=> (not res!689756) (not e!582690))))

(assert (=> b!1031631 (= res!689756 (not (= key!909 (bvneg key!909))))))

(declare-fun mapNonEmpty!38043 () Bool)

(declare-fun tp!73090 () Bool)

(declare-fun e!582691 () Bool)

(assert (=> mapNonEmpty!38043 (= mapRes!38043 (and tp!73090 e!582691))))

(declare-fun mapValue!38043 () ValueCell!11493)

(declare-fun mapRest!38043 () (Array (_ BitVec 32) ValueCell!11493))

(declare-fun mapKey!38043 () (_ BitVec 32))

(assert (=> mapNonEmpty!38043 (= (arr!31228 (_values!6187 thiss!1427)) (store mapRest!38043 mapKey!38043 mapValue!38043))))

(declare-fun b!1031632 () Bool)

(assert (=> b!1031632 (= e!582691 tp_is_empty!24393)))

(assert (= (and start!90066 res!689761) b!1031631))

(assert (= (and b!1031631 res!689756) b!1031630))

(assert (= (and b!1031630 res!689757) b!1031625))

(assert (= (and b!1031625 (not res!689758)) b!1031626))

(assert (= (and b!1031626 (not res!689760)) b!1031624))

(assert (= (and b!1031624 (not res!689762)) b!1031629))

(assert (= (and b!1031629 (not res!689759)) b!1031627))

(assert (= (and b!1031628 condMapEmpty!38043) mapIsEmpty!38043))

(assert (= (and b!1031628 (not condMapEmpty!38043)) mapNonEmpty!38043))

(assert (= (and mapNonEmpty!38043 ((_ is ValueCellFull!11493) mapValue!38043)) b!1031632))

(assert (= (and b!1031628 ((_ is ValueCellFull!11493) mapDefault!38043)) b!1031622))

(assert (= b!1031623 b!1031628))

(assert (= start!90066 b!1031623))

(declare-fun b_lambda!16017 () Bool)

(assert (=> (not b_lambda!16017) (not b!1031625)))

(declare-fun t!31042 () Bool)

(declare-fun tb!6991 () Bool)

(assert (=> (and b!1031623 (= (defaultEntry!6164 thiss!1427) (defaultEntry!6164 thiss!1427)) t!31042) tb!6991))

(declare-fun result!14311 () Bool)

(assert (=> tb!6991 (= result!14311 tp_is_empty!24393)))

(assert (=> b!1031625 t!31042))

(declare-fun b_and!33115 () Bool)

(assert (= b_and!33113 (and (=> t!31042 result!14311) b_and!33115)))

(declare-fun m!951829 () Bool)

(assert (=> b!1031627 m!951829))

(declare-fun m!951831 () Bool)

(assert (=> start!90066 m!951831))

(declare-fun m!951833 () Bool)

(assert (=> b!1031630 m!951833))

(declare-fun m!951835 () Bool)

(assert (=> b!1031626 m!951835))

(declare-fun m!951837 () Bool)

(assert (=> b!1031625 m!951837))

(declare-fun m!951839 () Bool)

(assert (=> b!1031625 m!951839))

(declare-fun m!951841 () Bool)

(assert (=> b!1031625 m!951841))

(declare-fun m!951843 () Bool)

(assert (=> b!1031625 m!951843))

(declare-fun m!951845 () Bool)

(assert (=> b!1031625 m!951845))

(declare-fun m!951847 () Bool)

(assert (=> b!1031625 m!951847))

(declare-fun m!951849 () Bool)

(assert (=> b!1031625 m!951849))

(assert (=> b!1031625 m!951843))

(declare-fun m!951851 () Bool)

(assert (=> b!1031625 m!951851))

(declare-fun m!951853 () Bool)

(assert (=> b!1031625 m!951853))

(declare-fun m!951855 () Bool)

(assert (=> b!1031625 m!951855))

(declare-fun m!951857 () Bool)

(assert (=> b!1031625 m!951857))

(declare-fun m!951859 () Bool)

(assert (=> b!1031625 m!951859))

(declare-fun m!951861 () Bool)

(assert (=> b!1031625 m!951861))

(declare-fun m!951863 () Bool)

(assert (=> b!1031625 m!951863))

(declare-fun m!951865 () Bool)

(assert (=> b!1031625 m!951865))

(declare-fun m!951867 () Bool)

(assert (=> b!1031625 m!951867))

(assert (=> b!1031625 m!951855))

(declare-fun m!951869 () Bool)

(assert (=> b!1031625 m!951869))

(declare-fun m!951871 () Bool)

(assert (=> b!1031625 m!951871))

(declare-fun m!951873 () Bool)

(assert (=> mapNonEmpty!38043 m!951873))

(declare-fun m!951875 () Bool)

(assert (=> b!1031623 m!951875))

(declare-fun m!951877 () Bool)

(assert (=> b!1031623 m!951877))

(declare-fun m!951879 () Bool)

(assert (=> b!1031629 m!951879))

(check-sat (not b!1031629) (not b!1031630) (not b_next!20673) (not b_lambda!16017) (not b!1031623) (not b!1031625) (not b!1031627) tp_is_empty!24393 (not mapNonEmpty!38043) b_and!33115 (not start!90066) (not b!1031626))
(check-sat b_and!33115 (not b_next!20673))
