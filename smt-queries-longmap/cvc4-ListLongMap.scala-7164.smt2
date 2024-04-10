; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91344 () Bool)

(assert start!91344)

(declare-fun b!1041503 () Bool)

(declare-fun b_free!21041 () Bool)

(declare-fun b_next!21041 () Bool)

(assert (=> b!1041503 (= b_free!21041 (not b_next!21041))))

(declare-fun tp!74335 () Bool)

(declare-fun b_and!33573 () Bool)

(assert (=> b!1041503 (= tp!74335 b_and!33573)))

(declare-fun res!694153 () Bool)

(declare-fun e!589836 () Bool)

(assert (=> start!91344 (=> (not res!694153) (not e!589836))))

(declare-datatypes ((V!37887 0))(
  ( (V!37888 (val!12431 Int)) )
))
(declare-datatypes ((ValueCell!11677 0))(
  ( (ValueCellFull!11677 (v!15020 V!37887)) (EmptyCell!11677) )
))
(declare-datatypes ((array!65668 0))(
  ( (array!65669 (arr!31595 (Array (_ BitVec 32) (_ BitVec 64))) (size!32128 (_ BitVec 32))) )
))
(declare-datatypes ((array!65670 0))(
  ( (array!65671 (arr!31596 (Array (_ BitVec 32) ValueCell!11677)) (size!32129 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5948 0))(
  ( (LongMapFixedSize!5949 (defaultEntry!6356 Int) (mask!30385 (_ BitVec 32)) (extraKeys!6084 (_ BitVec 32)) (zeroValue!6190 V!37887) (minValue!6190 V!37887) (_size!3029 (_ BitVec 32)) (_keys!11592 array!65668) (_values!6379 array!65670) (_vacant!3029 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5948)

(declare-fun valid!2234 (LongMapFixedSize!5948) Bool)

(assert (=> start!91344 (= res!694153 (valid!2234 thiss!1427))))

(assert (=> start!91344 e!589836))

(declare-fun e!589831 () Bool)

(assert (=> start!91344 e!589831))

(assert (=> start!91344 true))

(declare-fun b!1041500 () Bool)

(declare-fun res!694155 () Bool)

(assert (=> b!1041500 (=> (not res!694155) (not e!589836))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1041500 (= res!694155 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38736 () Bool)

(declare-fun mapRes!38736 () Bool)

(assert (=> mapIsEmpty!38736 mapRes!38736))

(declare-fun b!1041501 () Bool)

(declare-fun e!589829 () Bool)

(declare-fun e!589835 () Bool)

(assert (=> b!1041501 (= e!589829 (not e!589835))))

(declare-fun res!694154 () Bool)

(assert (=> b!1041501 (=> res!694154 e!589835)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1041501 (= res!694154 (not (validMask!0 (mask!30385 thiss!1427))))))

(declare-fun lt!459046 () array!65668)

(declare-fun arrayContainsKey!0 (array!65668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1041501 (not (arrayContainsKey!0 lt!459046 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9808 0))(
  ( (MissingZero!9808 (index!41603 (_ BitVec 32))) (Found!9808 (index!41604 (_ BitVec 32))) (Intermediate!9808 (undefined!10620 Bool) (index!41605 (_ BitVec 32)) (x!92978 (_ BitVec 32))) (Undefined!9808) (MissingVacant!9808 (index!41606 (_ BitVec 32))) )
))
(declare-fun lt!459049 () SeekEntryResult!9808)

(declare-datatypes ((Unit!34035 0))(
  ( (Unit!34036) )
))
(declare-fun lt!459050 () Unit!34035)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65668 (_ BitVec 32) (_ BitVec 64)) Unit!34035)

(assert (=> b!1041501 (= lt!459050 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11592 thiss!1427) (index!41604 lt!459049) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65668 (_ BitVec 32)) Bool)

(assert (=> b!1041501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459046 (mask!30385 thiss!1427))))

(declare-fun lt!459048 () Unit!34035)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65668 (_ BitVec 32) (_ BitVec 32)) Unit!34035)

(assert (=> b!1041501 (= lt!459048 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11592 thiss!1427) (index!41604 lt!459049) (mask!30385 thiss!1427)))))

(declare-datatypes ((List!21969 0))(
  ( (Nil!21966) (Cons!21965 (h!23171 (_ BitVec 64)) (t!31183 List!21969)) )
))
(declare-fun arrayNoDuplicates!0 (array!65668 (_ BitVec 32) List!21969) Bool)

(assert (=> b!1041501 (arrayNoDuplicates!0 lt!459046 #b00000000000000000000000000000000 Nil!21966)))

(declare-fun lt!459047 () Unit!34035)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21969) Unit!34035)

(assert (=> b!1041501 (= lt!459047 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11592 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41604 lt!459049) #b00000000000000000000000000000000 Nil!21966))))

(declare-fun arrayCountValidKeys!0 (array!65668 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1041501 (= (arrayCountValidKeys!0 lt!459046 #b00000000000000000000000000000000 (size!32128 (_keys!11592 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11592 thiss!1427) #b00000000000000000000000000000000 (size!32128 (_keys!11592 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1041501 (= lt!459046 (array!65669 (store (arr!31595 (_keys!11592 thiss!1427)) (index!41604 lt!459049) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32128 (_keys!11592 thiss!1427))))))

(declare-fun lt!459045 () Unit!34035)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65668 (_ BitVec 32) (_ BitVec 64)) Unit!34035)

(assert (=> b!1041501 (= lt!459045 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11592 thiss!1427) (index!41604 lt!459049) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1041502 () Bool)

(declare-fun e!589832 () Bool)

(declare-fun tp_is_empty!24761 () Bool)

(assert (=> b!1041502 (= e!589832 tp_is_empty!24761)))

(declare-fun e!589833 () Bool)

(declare-fun array_inv!24411 (array!65668) Bool)

(declare-fun array_inv!24412 (array!65670) Bool)

(assert (=> b!1041503 (= e!589831 (and tp!74335 tp_is_empty!24761 (array_inv!24411 (_keys!11592 thiss!1427)) (array_inv!24412 (_values!6379 thiss!1427)) e!589833))))

(declare-fun b!1041504 () Bool)

(assert (=> b!1041504 (= e!589835 (or (not (= (size!32129 (_values!6379 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30385 thiss!1427)))) (not (= (size!32128 (_keys!11592 thiss!1427)) (size!32129 (_values!6379 thiss!1427)))) (bvsge (mask!30385 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!38736 () Bool)

(declare-fun tp!74334 () Bool)

(declare-fun e!589830 () Bool)

(assert (=> mapNonEmpty!38736 (= mapRes!38736 (and tp!74334 e!589830))))

(declare-fun mapValue!38736 () ValueCell!11677)

(declare-fun mapKey!38736 () (_ BitVec 32))

(declare-fun mapRest!38736 () (Array (_ BitVec 32) ValueCell!11677))

(assert (=> mapNonEmpty!38736 (= (arr!31596 (_values!6379 thiss!1427)) (store mapRest!38736 mapKey!38736 mapValue!38736))))

(declare-fun b!1041505 () Bool)

(assert (=> b!1041505 (= e!589836 e!589829)))

(declare-fun res!694152 () Bool)

(assert (=> b!1041505 (=> (not res!694152) (not e!589829))))

(assert (=> b!1041505 (= res!694152 (is-Found!9808 lt!459049))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65668 (_ BitVec 32)) SeekEntryResult!9808)

(assert (=> b!1041505 (= lt!459049 (seekEntry!0 key!909 (_keys!11592 thiss!1427) (mask!30385 thiss!1427)))))

(declare-fun b!1041506 () Bool)

(assert (=> b!1041506 (= e!589833 (and e!589832 mapRes!38736))))

(declare-fun condMapEmpty!38736 () Bool)

(declare-fun mapDefault!38736 () ValueCell!11677)

