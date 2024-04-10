; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91168 () Bool)

(assert start!91168)

(declare-fun b!1040495 () Bool)

(declare-fun b_free!21013 () Bool)

(declare-fun b_next!21013 () Bool)

(assert (=> b!1040495 (= b_free!21013 (not b_next!21013))))

(declare-fun tp!74237 () Bool)

(declare-fun b_and!33545 () Bool)

(assert (=> b!1040495 (= tp!74237 b_and!33545)))

(declare-fun b!1040487 () Bool)

(declare-fun e!589086 () Bool)

(declare-fun e!589082 () Bool)

(assert (=> b!1040487 (= e!589086 e!589082)))

(declare-fun res!693687 () Bool)

(assert (=> b!1040487 (=> (not res!693687) (not e!589082))))

(declare-datatypes ((SeekEntryResult!9796 0))(
  ( (MissingZero!9796 (index!41555 (_ BitVec 32))) (Found!9796 (index!41556 (_ BitVec 32))) (Intermediate!9796 (undefined!10608 Bool) (index!41557 (_ BitVec 32)) (x!92884 (_ BitVec 32))) (Undefined!9796) (MissingVacant!9796 (index!41558 (_ BitVec 32))) )
))
(declare-fun lt!458565 () SeekEntryResult!9796)

(assert (=> b!1040487 (= res!693687 (is-Found!9796 lt!458565))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37851 0))(
  ( (V!37852 (val!12417 Int)) )
))
(declare-datatypes ((ValueCell!11663 0))(
  ( (ValueCellFull!11663 (v!15004 V!37851)) (EmptyCell!11663) )
))
(declare-datatypes ((array!65604 0))(
  ( (array!65605 (arr!31567 (Array (_ BitVec 32) (_ BitVec 64))) (size!32098 (_ BitVec 32))) )
))
(declare-datatypes ((array!65606 0))(
  ( (array!65607 (arr!31568 (Array (_ BitVec 32) ValueCell!11663)) (size!32099 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5920 0))(
  ( (LongMapFixedSize!5921 (defaultEntry!6342 Int) (mask!30338 (_ BitVec 32)) (extraKeys!6070 (_ BitVec 32)) (zeroValue!6176 V!37851) (minValue!6176 V!37851) (_size!3015 (_ BitVec 32)) (_keys!11564 array!65604) (_values!6365 array!65606) (_vacant!3015 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5920)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65604 (_ BitVec 32)) SeekEntryResult!9796)

(assert (=> b!1040487 (= lt!458565 (seekEntry!0 key!909 (_keys!11564 thiss!1427) (mask!30338 thiss!1427)))))

(declare-fun b!1040488 () Bool)

(declare-fun res!693684 () Bool)

(assert (=> b!1040488 (=> (not res!693684) (not e!589086))))

(assert (=> b!1040488 (= res!693684 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040489 () Bool)

(declare-fun res!693688 () Bool)

(declare-fun e!589083 () Bool)

(assert (=> b!1040489 (=> res!693688 e!589083)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1040489 (= res!693688 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1040490 () Bool)

(declare-fun e!589088 () Bool)

(declare-fun tp_is_empty!24733 () Bool)

(assert (=> b!1040490 (= e!589088 tp_is_empty!24733)))

(declare-fun b!1040491 () Bool)

(assert (=> b!1040491 (= e!589082 (not e!589083))))

(declare-fun res!693686 () Bool)

(assert (=> b!1040491 (=> res!693686 e!589083)))

(assert (=> b!1040491 (= res!693686 (or (bvslt (index!41556 lt!458565) #b00000000000000000000000000000000) (bvsge (index!41556 lt!458565) (size!32098 (_keys!11564 thiss!1427))) (bvsge (size!32098 (_keys!11564 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!458567 () array!65604)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65604 (_ BitVec 32)) Bool)

(assert (=> b!1040491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458567 (mask!30338 thiss!1427))))

(declare-datatypes ((Unit!34015 0))(
  ( (Unit!34016) )
))
(declare-fun lt!458569 () Unit!34015)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65604 (_ BitVec 32) (_ BitVec 32)) Unit!34015)

(assert (=> b!1040491 (= lt!458569 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11564 thiss!1427) (index!41556 lt!458565) (mask!30338 thiss!1427)))))

(declare-datatypes ((List!21959 0))(
  ( (Nil!21956) (Cons!21955 (h!23159 (_ BitVec 64)) (t!31173 List!21959)) )
))
(declare-fun arrayNoDuplicates!0 (array!65604 (_ BitVec 32) List!21959) Bool)

(assert (=> b!1040491 (arrayNoDuplicates!0 lt!458567 #b00000000000000000000000000000000 Nil!21956)))

(declare-fun lt!458568 () Unit!34015)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65604 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21959) Unit!34015)

(assert (=> b!1040491 (= lt!458568 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11564 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41556 lt!458565) #b00000000000000000000000000000000 Nil!21956))))

(declare-fun arrayCountValidKeys!0 (array!65604 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040491 (= (arrayCountValidKeys!0 lt!458567 #b00000000000000000000000000000000 (size!32098 (_keys!11564 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11564 thiss!1427) #b00000000000000000000000000000000 (size!32098 (_keys!11564 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040491 (= lt!458567 (array!65605 (store (arr!31567 (_keys!11564 thiss!1427)) (index!41556 lt!458565) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32098 (_keys!11564 thiss!1427))))))

(declare-fun lt!458566 () Unit!34015)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65604 (_ BitVec 32) (_ BitVec 64)) Unit!34015)

(assert (=> b!1040491 (= lt!458566 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11564 thiss!1427) (index!41556 lt!458565) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040492 () Bool)

(declare-fun e!589084 () Bool)

(assert (=> b!1040492 (= e!589084 tp_is_empty!24733)))

(declare-fun b!1040493 () Bool)

(assert (=> b!1040493 (= e!589083 (= (select (arr!31567 (_keys!11564 thiss!1427)) (index!41556 lt!458565)) key!909))))

(declare-fun b!1040494 () Bool)

(declare-fun e!589085 () Bool)

(declare-fun mapRes!38680 () Bool)

(assert (=> b!1040494 (= e!589085 (and e!589088 mapRes!38680))))

(declare-fun condMapEmpty!38680 () Bool)

(declare-fun mapDefault!38680 () ValueCell!11663)

