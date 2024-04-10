; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91696 () Bool)

(assert start!91696)

(declare-fun b!1043738 () Bool)

(declare-fun b_free!21103 () Bool)

(declare-fun b_next!21103 () Bool)

(assert (=> b!1043738 (= b_free!21103 (not b_next!21103))))

(declare-fun tp!74549 () Bool)

(declare-fun b_and!33647 () Bool)

(assert (=> b!1043738 (= tp!74549 b_and!33647)))

(declare-fun e!591419 () Bool)

(declare-datatypes ((V!37971 0))(
  ( (V!37972 (val!12462 Int)) )
))
(declare-datatypes ((ValueCell!11708 0))(
  ( (ValueCellFull!11708 (v!15053 V!37971)) (EmptyCell!11708) )
))
(declare-datatypes ((array!65810 0))(
  ( (array!65811 (arr!31657 (Array (_ BitVec 32) (_ BitVec 64))) (size!32192 (_ BitVec 32))) )
))
(declare-datatypes ((array!65812 0))(
  ( (array!65813 (arr!31658 (Array (_ BitVec 32) ValueCell!11708)) (size!32193 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6010 0))(
  ( (LongMapFixedSize!6011 (defaultEntry!6389 Int) (mask!30485 (_ BitVec 32)) (extraKeys!6117 (_ BitVec 32)) (zeroValue!6223 V!37971) (minValue!6223 V!37971) (_size!3060 (_ BitVec 32)) (_keys!11649 array!65810) (_values!6412 array!65812) (_vacant!3060 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6010)

(declare-fun tp_is_empty!24823 () Bool)

(declare-fun e!591415 () Bool)

(declare-fun array_inv!24455 (array!65810) Bool)

(declare-fun array_inv!24456 (array!65812) Bool)

(assert (=> b!1043738 (= e!591419 (and tp!74549 tp_is_empty!24823 (array_inv!24455 (_keys!11649 thiss!1427)) (array_inv!24456 (_values!6412 thiss!1427)) e!591415))))

(declare-fun b!1043739 () Bool)

(declare-fun e!591414 () Bool)

(assert (=> b!1043739 (= e!591414 tp_is_empty!24823)))

(declare-fun mapNonEmpty!38858 () Bool)

(declare-fun mapRes!38858 () Bool)

(declare-fun tp!74550 () Bool)

(assert (=> mapNonEmpty!38858 (= mapRes!38858 (and tp!74550 e!591414))))

(declare-fun mapRest!38858 () (Array (_ BitVec 32) ValueCell!11708))

(declare-fun mapValue!38858 () ValueCell!11708)

(declare-fun mapKey!38858 () (_ BitVec 32))

(assert (=> mapNonEmpty!38858 (= (arr!31658 (_values!6412 thiss!1427)) (store mapRest!38858 mapKey!38858 mapValue!38858))))

(declare-fun mapIsEmpty!38858 () Bool)

(assert (=> mapIsEmpty!38858 mapRes!38858))

(declare-fun b!1043741 () Bool)

(declare-fun e!591418 () Bool)

(declare-fun e!591417 () Bool)

(assert (=> b!1043741 (= e!591418 e!591417)))

(declare-fun res!695304 () Bool)

(assert (=> b!1043741 (=> (not res!695304) (not e!591417))))

(declare-datatypes ((SeekEntryResult!9834 0))(
  ( (MissingZero!9834 (index!41707 (_ BitVec 32))) (Found!9834 (index!41708 (_ BitVec 32))) (Intermediate!9834 (undefined!10646 Bool) (index!41709 (_ BitVec 32)) (x!93192 (_ BitVec 32))) (Undefined!9834) (MissingVacant!9834 (index!41710 (_ BitVec 32))) )
))
(declare-fun lt!460164 () SeekEntryResult!9834)

(assert (=> b!1043741 (= res!695304 (is-Found!9834 lt!460164))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65810 (_ BitVec 32)) SeekEntryResult!9834)

(assert (=> b!1043741 (= lt!460164 (seekEntry!0 key!909 (_keys!11649 thiss!1427) (mask!30485 thiss!1427)))))

(declare-fun b!1043742 () Bool)

(assert (=> b!1043742 (= e!591417 (not (and (bvsge (index!41708 lt!460164) #b00000000000000000000000000000000) (bvslt (index!41708 lt!460164) (size!32193 (_values!6412 thiss!1427))))))))

(declare-fun lt!460166 () array!65810)

(declare-datatypes ((tuple2!15740 0))(
  ( (tuple2!15741 (_1!7881 (_ BitVec 64)) (_2!7881 V!37971)) )
))
(declare-datatypes ((List!21994 0))(
  ( (Nil!21991) (Cons!21990 (h!23198 tuple2!15740) (t!31216 List!21994)) )
))
(declare-datatypes ((ListLongMap!13769 0))(
  ( (ListLongMap!13770 (toList!6900 List!21994)) )
))
(declare-fun -!527 (ListLongMap!13769 (_ BitVec 64)) ListLongMap!13769)

(declare-fun getCurrentListMap!3948 (array!65810 array!65812 (_ BitVec 32) (_ BitVec 32) V!37971 V!37971 (_ BitVec 32) Int) ListLongMap!13769)

(declare-fun dynLambda!1997 (Int (_ BitVec 64)) V!37971)

(assert (=> b!1043742 (= (-!527 (getCurrentListMap!3948 (_keys!11649 thiss!1427) (_values!6412 thiss!1427) (mask!30485 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)) key!909) (getCurrentListMap!3948 lt!460166 (array!65813 (store (arr!31658 (_values!6412 thiss!1427)) (index!41708 lt!460164) (ValueCellFull!11708 (dynLambda!1997 (defaultEntry!6389 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32193 (_values!6412 thiss!1427))) (mask!30485 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6389 thiss!1427)))))

(declare-datatypes ((Unit!34077 0))(
  ( (Unit!34078) )
))
(declare-fun lt!460165 () Unit!34077)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!48 (array!65810 array!65812 (_ BitVec 32) (_ BitVec 32) V!37971 V!37971 (_ BitVec 32) (_ BitVec 64) Int) Unit!34077)

(assert (=> b!1043742 (= lt!460165 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!48 (_keys!11649 thiss!1427) (_values!6412 thiss!1427) (mask!30485 thiss!1427) (extraKeys!6117 thiss!1427) (zeroValue!6223 thiss!1427) (minValue!6223 thiss!1427) (index!41708 lt!460164) key!909 (defaultEntry!6389 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043742 (not (arrayContainsKey!0 lt!460166 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460170 () Unit!34077)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65810 (_ BitVec 32) (_ BitVec 64)) Unit!34077)

(assert (=> b!1043742 (= lt!460170 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11649 thiss!1427) (index!41708 lt!460164) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65810 (_ BitVec 32)) Bool)

(assert (=> b!1043742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460166 (mask!30485 thiss!1427))))

(declare-fun lt!460167 () Unit!34077)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65810 (_ BitVec 32) (_ BitVec 32)) Unit!34077)

(assert (=> b!1043742 (= lt!460167 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11649 thiss!1427) (index!41708 lt!460164) (mask!30485 thiss!1427)))))

(declare-datatypes ((List!21995 0))(
  ( (Nil!21992) (Cons!21991 (h!23199 (_ BitVec 64)) (t!31217 List!21995)) )
))
(declare-fun arrayNoDuplicates!0 (array!65810 (_ BitVec 32) List!21995) Bool)

(assert (=> b!1043742 (arrayNoDuplicates!0 lt!460166 #b00000000000000000000000000000000 Nil!21992)))

(declare-fun lt!460169 () Unit!34077)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65810 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21995) Unit!34077)

(assert (=> b!1043742 (= lt!460169 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11649 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41708 lt!460164) #b00000000000000000000000000000000 Nil!21992))))

(declare-fun arrayCountValidKeys!0 (array!65810 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043742 (= (arrayCountValidKeys!0 lt!460166 #b00000000000000000000000000000000 (size!32192 (_keys!11649 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11649 thiss!1427) #b00000000000000000000000000000000 (size!32192 (_keys!11649 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043742 (= lt!460166 (array!65811 (store (arr!31657 (_keys!11649 thiss!1427)) (index!41708 lt!460164) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32192 (_keys!11649 thiss!1427))))))

(declare-fun lt!460168 () Unit!34077)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65810 (_ BitVec 32) (_ BitVec 64)) Unit!34077)

(assert (=> b!1043742 (= lt!460168 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11649 thiss!1427) (index!41708 lt!460164) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1043743 () Bool)

(declare-fun e!591416 () Bool)

(assert (=> b!1043743 (= e!591416 tp_is_empty!24823)))

(declare-fun b!1043744 () Bool)

(assert (=> b!1043744 (= e!591415 (and e!591416 mapRes!38858))))

(declare-fun condMapEmpty!38858 () Bool)

(declare-fun mapDefault!38858 () ValueCell!11708)

