; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89612 () Bool)

(assert start!89612)

(declare-fun b!1027796 () Bool)

(declare-fun b_free!20579 () Bool)

(declare-fun b_next!20579 () Bool)

(assert (=> b!1027796 (= b_free!20579 (not b_next!20579))))

(declare-fun tp!72786 () Bool)

(declare-fun b_and!32841 () Bool)

(assert (=> b!1027796 (= tp!72786 b_and!32841)))

(declare-fun b!1027790 () Bool)

(declare-fun e!580117 () Bool)

(declare-fun e!580115 () Bool)

(assert (=> b!1027790 (= e!580117 e!580115)))

(declare-fun res!687869 () Bool)

(assert (=> b!1027790 (=> (not res!687869) (not e!580115))))

(declare-datatypes ((SeekEntryResult!9678 0))(
  ( (MissingZero!9678 (index!41083 (_ BitVec 32))) (Found!9678 (index!41084 (_ BitVec 32))) (Intermediate!9678 (undefined!10490 Bool) (index!41085 (_ BitVec 32)) (x!91466 (_ BitVec 32))) (Undefined!9678) (MissingVacant!9678 (index!41086 (_ BitVec 32))) )
))
(declare-fun lt!452554 () SeekEntryResult!9678)

(assert (=> b!1027790 (= res!687869 (is-Found!9678 lt!452554))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37271 0))(
  ( (V!37272 (val!12200 Int)) )
))
(declare-datatypes ((ValueCell!11446 0))(
  ( (ValueCellFull!11446 (v!14769 V!37271)) (EmptyCell!11446) )
))
(declare-datatypes ((array!64650 0))(
  ( (array!64651 (arr!31133 (Array (_ BitVec 32) (_ BitVec 64))) (size!31646 (_ BitVec 32))) )
))
(declare-datatypes ((array!64652 0))(
  ( (array!64653 (arr!31134 (Array (_ BitVec 32) ValueCell!11446)) (size!31647 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5486 0))(
  ( (LongMapFixedSize!5487 (defaultEntry!6097 Int) (mask!29821 (_ BitVec 32)) (extraKeys!5829 (_ BitVec 32)) (zeroValue!5933 V!37271) (minValue!5933 V!37271) (_size!2798 (_ BitVec 32)) (_keys!11246 array!64650) (_values!6120 array!64652) (_vacant!2798 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5486)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64650 (_ BitVec 32)) SeekEntryResult!9678)

(assert (=> b!1027790 (= lt!452554 (seekEntry!0 key!909 (_keys!11246 thiss!1427) (mask!29821 thiss!1427)))))

(declare-fun b!1027791 () Bool)

(declare-fun e!580113 () Bool)

(assert (=> b!1027791 (= e!580115 (not e!580113))))

(declare-fun res!687867 () Bool)

(assert (=> b!1027791 (=> res!687867 e!580113)))

(declare-datatypes ((Unit!33559 0))(
  ( (Unit!33560) )
))
(declare-datatypes ((tuple2!15538 0))(
  ( (tuple2!15539 (_1!7780 Unit!33559) (_2!7780 LongMapFixedSize!5486)) )
))
(declare-fun lt!452547 () tuple2!15538)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027791 (= res!687867 (not (validMask!0 (mask!29821 (_2!7780 lt!452547)))))))

(declare-fun lt!452553 () array!64650)

(declare-fun lt!452548 () array!64652)

(declare-fun Unit!33561 () Unit!33559)

(declare-fun Unit!33562 () Unit!33559)

(assert (=> b!1027791 (= lt!452547 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2798 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15539 Unit!33561 (LongMapFixedSize!5487 (defaultEntry!6097 thiss!1427) (mask!29821 thiss!1427) (extraKeys!5829 thiss!1427) (zeroValue!5933 thiss!1427) (minValue!5933 thiss!1427) (bvsub (_size!2798 thiss!1427) #b00000000000000000000000000000001) lt!452553 lt!452548 (bvadd #b00000000000000000000000000000001 (_vacant!2798 thiss!1427)))) (tuple2!15539 Unit!33562 (LongMapFixedSize!5487 (defaultEntry!6097 thiss!1427) (mask!29821 thiss!1427) (extraKeys!5829 thiss!1427) (zeroValue!5933 thiss!1427) (minValue!5933 thiss!1427) (bvsub (_size!2798 thiss!1427) #b00000000000000000000000000000001) lt!452553 lt!452548 (_vacant!2798 thiss!1427)))))))

(declare-datatypes ((tuple2!15540 0))(
  ( (tuple2!15541 (_1!7781 (_ BitVec 64)) (_2!7781 V!37271)) )
))
(declare-datatypes ((List!21813 0))(
  ( (Nil!21810) (Cons!21809 (h!23007 tuple2!15540) (t!30887 List!21813)) )
))
(declare-datatypes ((ListLongMap!13673 0))(
  ( (ListLongMap!13674 (toList!6852 List!21813)) )
))
(declare-fun -!479 (ListLongMap!13673 (_ BitVec 64)) ListLongMap!13673)

(declare-fun getCurrentListMap!3900 (array!64650 array!64652 (_ BitVec 32) (_ BitVec 32) V!37271 V!37271 (_ BitVec 32) Int) ListLongMap!13673)

(assert (=> b!1027791 (= (-!479 (getCurrentListMap!3900 (_keys!11246 thiss!1427) (_values!6120 thiss!1427) (mask!29821 thiss!1427) (extraKeys!5829 thiss!1427) (zeroValue!5933 thiss!1427) (minValue!5933 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6097 thiss!1427)) key!909) (getCurrentListMap!3900 lt!452553 lt!452548 (mask!29821 thiss!1427) (extraKeys!5829 thiss!1427) (zeroValue!5933 thiss!1427) (minValue!5933 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6097 thiss!1427)))))

(declare-fun dynLambda!1949 (Int (_ BitVec 64)) V!37271)

(assert (=> b!1027791 (= lt!452548 (array!64653 (store (arr!31134 (_values!6120 thiss!1427)) (index!41084 lt!452554) (ValueCellFull!11446 (dynLambda!1949 (defaultEntry!6097 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31647 (_values!6120 thiss!1427))))))

(declare-fun lt!452549 () Unit!33559)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!5 (array!64650 array!64652 (_ BitVec 32) (_ BitVec 32) V!37271 V!37271 (_ BitVec 32) (_ BitVec 64) Int) Unit!33559)

(assert (=> b!1027791 (= lt!452549 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!5 (_keys!11246 thiss!1427) (_values!6120 thiss!1427) (mask!29821 thiss!1427) (extraKeys!5829 thiss!1427) (zeroValue!5933 thiss!1427) (minValue!5933 thiss!1427) (index!41084 lt!452554) key!909 (defaultEntry!6097 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027791 (not (arrayContainsKey!0 lt!452553 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!452551 () Unit!33559)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64650 (_ BitVec 32) (_ BitVec 64)) Unit!33559)

(assert (=> b!1027791 (= lt!452551 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11246 thiss!1427) (index!41084 lt!452554) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64650 (_ BitVec 32)) Bool)

(assert (=> b!1027791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452553 (mask!29821 thiss!1427))))

(declare-fun lt!452550 () Unit!33559)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64650 (_ BitVec 32) (_ BitVec 32)) Unit!33559)

(assert (=> b!1027791 (= lt!452550 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11246 thiss!1427) (index!41084 lt!452554) (mask!29821 thiss!1427)))))

(declare-datatypes ((List!21814 0))(
  ( (Nil!21811) (Cons!21810 (h!23008 (_ BitVec 64)) (t!30888 List!21814)) )
))
(declare-fun arrayNoDuplicates!0 (array!64650 (_ BitVec 32) List!21814) Bool)

(assert (=> b!1027791 (arrayNoDuplicates!0 lt!452553 #b00000000000000000000000000000000 Nil!21811)))

(declare-fun lt!452555 () Unit!33559)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21814) Unit!33559)

(assert (=> b!1027791 (= lt!452555 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11246 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41084 lt!452554) #b00000000000000000000000000000000 Nil!21811))))

(declare-fun arrayCountValidKeys!0 (array!64650 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027791 (= (arrayCountValidKeys!0 lt!452553 #b00000000000000000000000000000000 (size!31646 (_keys!11246 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11246 thiss!1427) #b00000000000000000000000000000000 (size!31646 (_keys!11246 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027791 (= lt!452553 (array!64651 (store (arr!31133 (_keys!11246 thiss!1427)) (index!41084 lt!452554) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31646 (_keys!11246 thiss!1427))))))

(declare-fun lt!452552 () Unit!33559)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64650 (_ BitVec 32) (_ BitVec 64)) Unit!33559)

(assert (=> b!1027791 (= lt!452552 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11246 thiss!1427) (index!41084 lt!452554) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027792 () Bool)

(declare-fun e!580119 () Bool)

(declare-fun tp_is_empty!24299 () Bool)

(assert (=> b!1027792 (= e!580119 tp_is_empty!24299)))

(declare-fun b!1027793 () Bool)

(declare-fun e!580120 () Bool)

(assert (=> b!1027793 (= e!580120 tp_is_empty!24299)))

(declare-fun b!1027794 () Bool)

(declare-fun e!580116 () Bool)

(declare-fun mapRes!37880 () Bool)

(assert (=> b!1027794 (= e!580116 (and e!580120 mapRes!37880))))

(declare-fun condMapEmpty!37880 () Bool)

(declare-fun mapDefault!37880 () ValueCell!11446)

