; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91196 () Bool)

(assert start!91196)

(declare-fun b!1040673 () Bool)

(declare-fun b_free!21019 () Bool)

(declare-fun b_next!21019 () Bool)

(assert (=> b!1040673 (= b_free!21019 (not b_next!21019))))

(declare-fun tp!74257 () Bool)

(declare-fun b_and!33551 () Bool)

(assert (=> b!1040673 (= tp!74257 b_and!33551)))

(declare-fun b!1040672 () Bool)

(declare-fun e!589217 () Bool)

(declare-fun tp_is_empty!24739 () Bool)

(assert (=> b!1040672 (= e!589217 tp_is_empty!24739)))

(declare-fun mapIsEmpty!38692 () Bool)

(declare-fun mapRes!38692 () Bool)

(assert (=> mapIsEmpty!38692 mapRes!38692))

(declare-fun b!1040674 () Bool)

(declare-fun e!589216 () Bool)

(declare-datatypes ((V!37859 0))(
  ( (V!37860 (val!12420 Int)) )
))
(declare-datatypes ((ValueCell!11666 0))(
  ( (ValueCellFull!11666 (v!15007 V!37859)) (EmptyCell!11666) )
))
(declare-datatypes ((array!65618 0))(
  ( (array!65619 (arr!31573 (Array (_ BitVec 32) (_ BitVec 64))) (size!32104 (_ BitVec 32))) )
))
(declare-datatypes ((array!65620 0))(
  ( (array!65621 (arr!31574 (Array (_ BitVec 32) ValueCell!11666)) (size!32105 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5926 0))(
  ( (LongMapFixedSize!5927 (defaultEntry!6345 Int) (mask!30346 (_ BitVec 32)) (extraKeys!6073 (_ BitVec 32)) (zeroValue!6179 V!37859) (minValue!6179 V!37859) (_size!3018 (_ BitVec 32)) (_keys!11569 array!65618) (_values!6368 array!65620) (_vacant!3018 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5926)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040674 (= e!589216 (not (validMask!0 (mask!30346 thiss!1427))))))

(declare-fun lt!458646 () array!65618)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040674 (not (arrayContainsKey!0 lt!458646 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34019 0))(
  ( (Unit!34020) )
))
(declare-fun lt!458650 () Unit!34019)

(declare-datatypes ((SeekEntryResult!9799 0))(
  ( (MissingZero!9799 (index!41567 (_ BitVec 32))) (Found!9799 (index!41568 (_ BitVec 32))) (Intermediate!9799 (undefined!10611 Bool) (index!41569 (_ BitVec 32)) (x!92903 (_ BitVec 32))) (Undefined!9799) (MissingVacant!9799 (index!41570 (_ BitVec 32))) )
))
(declare-fun lt!458651 () SeekEntryResult!9799)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65618 (_ BitVec 32) (_ BitVec 64)) Unit!34019)

(assert (=> b!1040674 (= lt!458650 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11569 thiss!1427) (index!41568 lt!458651) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65618 (_ BitVec 32)) Bool)

(assert (=> b!1040674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458646 (mask!30346 thiss!1427))))

(declare-fun lt!458649 () Unit!34019)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65618 (_ BitVec 32) (_ BitVec 32)) Unit!34019)

(assert (=> b!1040674 (= lt!458649 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11569 thiss!1427) (index!41568 lt!458651) (mask!30346 thiss!1427)))))

(declare-datatypes ((List!21961 0))(
  ( (Nil!21958) (Cons!21957 (h!23161 (_ BitVec 64)) (t!31175 List!21961)) )
))
(declare-fun arrayNoDuplicates!0 (array!65618 (_ BitVec 32) List!21961) Bool)

(assert (=> b!1040674 (arrayNoDuplicates!0 lt!458646 #b00000000000000000000000000000000 Nil!21958)))

(declare-fun lt!458648 () Unit!34019)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65618 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21961) Unit!34019)

(assert (=> b!1040674 (= lt!458648 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11569 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41568 lt!458651) #b00000000000000000000000000000000 Nil!21958))))

(declare-fun arrayCountValidKeys!0 (array!65618 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040674 (= (arrayCountValidKeys!0 lt!458646 #b00000000000000000000000000000000 (size!32104 (_keys!11569 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11569 thiss!1427) #b00000000000000000000000000000000 (size!32104 (_keys!11569 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040674 (= lt!458646 (array!65619 (store (arr!31573 (_keys!11569 thiss!1427)) (index!41568 lt!458651) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32104 (_keys!11569 thiss!1427))))))

(declare-fun lt!458647 () Unit!34019)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65618 (_ BitVec 32) (_ BitVec 64)) Unit!34019)

(assert (=> b!1040674 (= lt!458647 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11569 thiss!1427) (index!41568 lt!458651) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040675 () Bool)

(declare-fun e!589219 () Bool)

(assert (=> b!1040675 (= e!589219 tp_is_empty!24739)))

(declare-fun b!1040676 () Bool)

(declare-fun res!693777 () Bool)

(declare-fun e!589218 () Bool)

(assert (=> b!1040676 (=> (not res!693777) (not e!589218))))

(assert (=> b!1040676 (= res!693777 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040677 () Bool)

(declare-fun e!589215 () Bool)

(assert (=> b!1040677 (= e!589215 (and e!589219 mapRes!38692))))

(declare-fun condMapEmpty!38692 () Bool)

(declare-fun mapDefault!38692 () ValueCell!11666)

