; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89768 () Bool)

(assert start!89768)

(declare-fun b!1028865 () Bool)

(declare-fun b_free!20587 () Bool)

(declare-fun b_next!20587 () Bool)

(assert (=> b!1028865 (= b_free!20587 (not b_next!20587))))

(declare-fun tp!72818 () Bool)

(declare-fun b_and!32893 () Bool)

(assert (=> b!1028865 (= tp!72818 b_and!32893)))

(declare-fun b!1028860 () Bool)

(declare-fun res!688344 () Bool)

(declare-fun e!580805 () Bool)

(assert (=> b!1028860 (=> (not res!688344) (not e!580805))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1028860 (= res!688344 (not (= key!909 (bvneg key!909))))))

(declare-fun res!688345 () Bool)

(assert (=> start!89768 (=> (not res!688345) (not e!580805))))

(declare-datatypes ((V!37283 0))(
  ( (V!37284 (val!12204 Int)) )
))
(declare-datatypes ((ValueCell!11450 0))(
  ( (ValueCellFull!11450 (v!14777 V!37283)) (EmptyCell!11450) )
))
(declare-datatypes ((array!64670 0))(
  ( (array!64671 (arr!31141 (Array (_ BitVec 32) (_ BitVec 64))) (size!31656 (_ BitVec 32))) )
))
(declare-datatypes ((array!64672 0))(
  ( (array!64673 (arr!31142 (Array (_ BitVec 32) ValueCell!11450)) (size!31657 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5494 0))(
  ( (LongMapFixedSize!5495 (defaultEntry!6109 Int) (mask!29855 (_ BitVec 32)) (extraKeys!5841 (_ BitVec 32)) (zeroValue!5945 V!37283) (minValue!5945 V!37283) (_size!2802 (_ BitVec 32)) (_keys!11268 array!64670) (_values!6132 array!64672) (_vacant!2802 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5494)

(declare-fun valid!2080 (LongMapFixedSize!5494) Bool)

(assert (=> start!89768 (= res!688345 (valid!2080 thiss!1427))))

(assert (=> start!89768 e!580805))

(declare-fun e!580809 () Bool)

(assert (=> start!89768 e!580809))

(assert (=> start!89768 true))

(declare-fun b!1028861 () Bool)

(declare-fun e!580811 () Bool)

(declare-fun tp_is_empty!24307 () Bool)

(assert (=> b!1028861 (= e!580811 tp_is_empty!24307)))

(declare-fun b!1028862 () Bool)

(declare-fun e!580807 () Bool)

(declare-fun e!580812 () Bool)

(assert (=> b!1028862 (= e!580807 (not e!580812))))

(declare-fun res!688342 () Bool)

(assert (=> b!1028862 (=> res!688342 e!580812)))

(declare-datatypes ((Unit!33591 0))(
  ( (Unit!33592) )
))
(declare-datatypes ((tuple2!15546 0))(
  ( (tuple2!15547 (_1!7784 Unit!33591) (_2!7784 LongMapFixedSize!5494)) )
))
(declare-fun lt!453341 () tuple2!15546)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028862 (= res!688342 (not (validMask!0 (mask!29855 (_2!7784 lt!453341)))))))

(declare-fun lt!453344 () array!64672)

(declare-fun lt!453338 () array!64670)

(declare-fun Unit!33593 () Unit!33591)

(declare-fun Unit!33594 () Unit!33591)

(assert (=> b!1028862 (= lt!453341 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2802 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15547 Unit!33593 (LongMapFixedSize!5495 (defaultEntry!6109 thiss!1427) (mask!29855 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (bvsub (_size!2802 thiss!1427) #b00000000000000000000000000000001) lt!453338 lt!453344 (bvadd #b00000000000000000000000000000001 (_vacant!2802 thiss!1427)))) (tuple2!15547 Unit!33594 (LongMapFixedSize!5495 (defaultEntry!6109 thiss!1427) (mask!29855 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (bvsub (_size!2802 thiss!1427) #b00000000000000000000000000000001) lt!453338 lt!453344 (_vacant!2802 thiss!1427)))))))

(declare-datatypes ((tuple2!15548 0))(
  ( (tuple2!15549 (_1!7785 (_ BitVec 64)) (_2!7785 V!37283)) )
))
(declare-datatypes ((List!21817 0))(
  ( (Nil!21814) (Cons!21813 (h!23013 tuple2!15548) (t!30899 List!21817)) )
))
(declare-datatypes ((ListLongMap!13677 0))(
  ( (ListLongMap!13678 (toList!6854 List!21817)) )
))
(declare-fun -!481 (ListLongMap!13677 (_ BitVec 64)) ListLongMap!13677)

(declare-fun getCurrentListMap!3902 (array!64670 array!64672 (_ BitVec 32) (_ BitVec 32) V!37283 V!37283 (_ BitVec 32) Int) ListLongMap!13677)

(assert (=> b!1028862 (= (-!481 (getCurrentListMap!3902 (_keys!11268 thiss!1427) (_values!6132 thiss!1427) (mask!29855 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)) key!909) (getCurrentListMap!3902 lt!453338 lt!453344 (mask!29855 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6109 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9680 0))(
  ( (MissingZero!9680 (index!41091 (_ BitVec 32))) (Found!9680 (index!41092 (_ BitVec 32))) (Intermediate!9680 (undefined!10492 Bool) (index!41093 (_ BitVec 32)) (x!91552 (_ BitVec 32))) (Undefined!9680) (MissingVacant!9680 (index!41094 (_ BitVec 32))) )
))
(declare-fun lt!453343 () SeekEntryResult!9680)

(declare-fun dynLambda!1951 (Int (_ BitVec 64)) V!37283)

(assert (=> b!1028862 (= lt!453344 (array!64673 (store (arr!31142 (_values!6132 thiss!1427)) (index!41092 lt!453343) (ValueCellFull!11450 (dynLambda!1951 (defaultEntry!6109 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31657 (_values!6132 thiss!1427))))))

(declare-fun lt!453345 () Unit!33591)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!7 (array!64670 array!64672 (_ BitVec 32) (_ BitVec 32) V!37283 V!37283 (_ BitVec 32) (_ BitVec 64) Int) Unit!33591)

(assert (=> b!1028862 (= lt!453345 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!7 (_keys!11268 thiss!1427) (_values!6132 thiss!1427) (mask!29855 thiss!1427) (extraKeys!5841 thiss!1427) (zeroValue!5945 thiss!1427) (minValue!5945 thiss!1427) (index!41092 lt!453343) key!909 (defaultEntry!6109 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028862 (not (arrayContainsKey!0 lt!453338 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!453337 () Unit!33591)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64670 (_ BitVec 32) (_ BitVec 64)) Unit!33591)

(assert (=> b!1028862 (= lt!453337 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11268 thiss!1427) (index!41092 lt!453343) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64670 (_ BitVec 32)) Bool)

(assert (=> b!1028862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!453338 (mask!29855 thiss!1427))))

(declare-fun lt!453340 () Unit!33591)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64670 (_ BitVec 32) (_ BitVec 32)) Unit!33591)

(assert (=> b!1028862 (= lt!453340 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11268 thiss!1427) (index!41092 lt!453343) (mask!29855 thiss!1427)))))

(declare-datatypes ((List!21818 0))(
  ( (Nil!21815) (Cons!21814 (h!23014 (_ BitVec 64)) (t!30900 List!21818)) )
))
(declare-fun arrayNoDuplicates!0 (array!64670 (_ BitVec 32) List!21818) Bool)

(assert (=> b!1028862 (arrayNoDuplicates!0 lt!453338 #b00000000000000000000000000000000 Nil!21815)))

(declare-fun lt!453339 () Unit!33591)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64670 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21818) Unit!33591)

(assert (=> b!1028862 (= lt!453339 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11268 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41092 lt!453343) #b00000000000000000000000000000000 Nil!21815))))

(declare-fun arrayCountValidKeys!0 (array!64670 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028862 (= (arrayCountValidKeys!0 lt!453338 #b00000000000000000000000000000000 (size!31656 (_keys!11268 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11268 thiss!1427) #b00000000000000000000000000000000 (size!31656 (_keys!11268 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028862 (= lt!453338 (array!64671 (store (arr!31141 (_keys!11268 thiss!1427)) (index!41092 lt!453343) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31656 (_keys!11268 thiss!1427))))))

(declare-fun lt!453342 () Unit!33591)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64670 (_ BitVec 32) (_ BitVec 64)) Unit!33591)

(assert (=> b!1028862 (= lt!453342 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11268 thiss!1427) (index!41092 lt!453343) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1028863 () Bool)

(declare-fun e!580806 () Bool)

(assert (=> b!1028863 (= e!580806 tp_is_empty!24307)))

(declare-fun mapIsEmpty!37900 () Bool)

(declare-fun mapRes!37900 () Bool)

(assert (=> mapIsEmpty!37900 mapRes!37900))

(declare-fun b!1028864 () Bool)

(assert (=> b!1028864 (= e!580805 e!580807)))

(declare-fun res!688343 () Bool)

(assert (=> b!1028864 (=> (not res!688343) (not e!580807))))

(assert (=> b!1028864 (= res!688343 (is-Found!9680 lt!453343))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64670 (_ BitVec 32)) SeekEntryResult!9680)

(assert (=> b!1028864 (= lt!453343 (seekEntry!0 key!909 (_keys!11268 thiss!1427) (mask!29855 thiss!1427)))))

(declare-fun e!580810 () Bool)

(declare-fun array_inv!24105 (array!64670) Bool)

(declare-fun array_inv!24106 (array!64672) Bool)

(assert (=> b!1028865 (= e!580809 (and tp!72818 tp_is_empty!24307 (array_inv!24105 (_keys!11268 thiss!1427)) (array_inv!24106 (_values!6132 thiss!1427)) e!580810))))

(declare-fun mapNonEmpty!37900 () Bool)

(declare-fun tp!72817 () Bool)

(assert (=> mapNonEmpty!37900 (= mapRes!37900 (and tp!72817 e!580806))))

(declare-fun mapRest!37900 () (Array (_ BitVec 32) ValueCell!11450))

(declare-fun mapKey!37900 () (_ BitVec 32))

(declare-fun mapValue!37900 () ValueCell!11450)

(assert (=> mapNonEmpty!37900 (= (arr!31142 (_values!6132 thiss!1427)) (store mapRest!37900 mapKey!37900 mapValue!37900))))

(declare-fun b!1028866 () Bool)

(assert (=> b!1028866 (= e!580810 (and e!580811 mapRes!37900))))

(declare-fun condMapEmpty!37900 () Bool)

(declare-fun mapDefault!37900 () ValueCell!11450)

