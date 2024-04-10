; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91200 () Bool)

(assert start!91200)

(declare-fun b!1040719 () Bool)

(declare-fun b_free!21023 () Bool)

(declare-fun b_next!21023 () Bool)

(assert (=> b!1040719 (= b_free!21023 (not b_next!21023))))

(declare-fun tp!74269 () Bool)

(declare-fun b_and!33555 () Bool)

(assert (=> b!1040719 (= tp!74269 b_and!33555)))

(declare-fun mapNonEmpty!38698 () Bool)

(declare-fun mapRes!38698 () Bool)

(declare-fun tp!74270 () Bool)

(declare-fun e!589258 () Bool)

(assert (=> mapNonEmpty!38698 (= mapRes!38698 (and tp!74270 e!589258))))

(declare-datatypes ((V!37863 0))(
  ( (V!37864 (val!12422 Int)) )
))
(declare-datatypes ((ValueCell!11668 0))(
  ( (ValueCellFull!11668 (v!15009 V!37863)) (EmptyCell!11668) )
))
(declare-fun mapRest!38698 () (Array (_ BitVec 32) ValueCell!11668))

(declare-fun mapValue!38698 () ValueCell!11668)

(declare-fun mapKey!38698 () (_ BitVec 32))

(declare-datatypes ((array!65626 0))(
  ( (array!65627 (arr!31577 (Array (_ BitVec 32) (_ BitVec 64))) (size!32108 (_ BitVec 32))) )
))
(declare-datatypes ((array!65628 0))(
  ( (array!65629 (arr!31578 (Array (_ BitVec 32) ValueCell!11668)) (size!32109 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5930 0))(
  ( (LongMapFixedSize!5931 (defaultEntry!6347 Int) (mask!30348 (_ BitVec 32)) (extraKeys!6075 (_ BitVec 32)) (zeroValue!6181 V!37863) (minValue!6181 V!37863) (_size!3020 (_ BitVec 32)) (_keys!11571 array!65626) (_values!6370 array!65628) (_vacant!3020 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5930)

(assert (=> mapNonEmpty!38698 (= (arr!31578 (_values!6370 thiss!1427)) (store mapRest!38698 mapKey!38698 mapValue!38698))))

(declare-fun res!693794 () Bool)

(declare-fun e!589261 () Bool)

(assert (=> start!91200 (=> (not res!693794) (not e!589261))))

(declare-fun valid!2226 (LongMapFixedSize!5930) Bool)

(assert (=> start!91200 (= res!693794 (valid!2226 thiss!1427))))

(assert (=> start!91200 e!589261))

(declare-fun e!589256 () Bool)

(assert (=> start!91200 e!589256))

(assert (=> start!91200 true))

(declare-fun b!1040714 () Bool)

(declare-fun e!589257 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1040714 (= e!589257 (not (validMask!0 (mask!30348 thiss!1427))))))

(declare-fun lt!458685 () array!65626)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1040714 (not (arrayContainsKey!0 lt!458685 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9801 0))(
  ( (MissingZero!9801 (index!41575 (_ BitVec 32))) (Found!9801 (index!41576 (_ BitVec 32))) (Intermediate!9801 (undefined!10613 Bool) (index!41577 (_ BitVec 32)) (x!92905 (_ BitVec 32))) (Undefined!9801) (MissingVacant!9801 (index!41578 (_ BitVec 32))) )
))
(declare-fun lt!458687 () SeekEntryResult!9801)

(declare-datatypes ((Unit!34023 0))(
  ( (Unit!34024) )
))
(declare-fun lt!458684 () Unit!34023)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65626 (_ BitVec 32) (_ BitVec 64)) Unit!34023)

(assert (=> b!1040714 (= lt!458684 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11571 thiss!1427) (index!41576 lt!458687) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65626 (_ BitVec 32)) Bool)

(assert (=> b!1040714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!458685 (mask!30348 thiss!1427))))

(declare-fun lt!458682 () Unit!34023)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65626 (_ BitVec 32) (_ BitVec 32)) Unit!34023)

(assert (=> b!1040714 (= lt!458682 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11571 thiss!1427) (index!41576 lt!458687) (mask!30348 thiss!1427)))))

(declare-datatypes ((List!21963 0))(
  ( (Nil!21960) (Cons!21959 (h!23163 (_ BitVec 64)) (t!31177 List!21963)) )
))
(declare-fun arrayNoDuplicates!0 (array!65626 (_ BitVec 32) List!21963) Bool)

(assert (=> b!1040714 (arrayNoDuplicates!0 lt!458685 #b00000000000000000000000000000000 Nil!21960)))

(declare-fun lt!458686 () Unit!34023)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65626 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21963) Unit!34023)

(assert (=> b!1040714 (= lt!458686 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11571 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41576 lt!458687) #b00000000000000000000000000000000 Nil!21960))))

(declare-fun arrayCountValidKeys!0 (array!65626 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1040714 (= (arrayCountValidKeys!0 lt!458685 #b00000000000000000000000000000000 (size!32108 (_keys!11571 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11571 thiss!1427) #b00000000000000000000000000000000 (size!32108 (_keys!11571 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1040714 (= lt!458685 (array!65627 (store (arr!31577 (_keys!11571 thiss!1427)) (index!41576 lt!458687) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32108 (_keys!11571 thiss!1427))))))

(declare-fun lt!458683 () Unit!34023)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65626 (_ BitVec 32) (_ BitVec 64)) Unit!34023)

(assert (=> b!1040714 (= lt!458683 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11571 thiss!1427) (index!41576 lt!458687) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1040715 () Bool)

(declare-fun res!693795 () Bool)

(assert (=> b!1040715 (=> (not res!693795) (not e!589261))))

(assert (=> b!1040715 (= res!693795 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1040716 () Bool)

(declare-fun e!589262 () Bool)

(declare-fun e!589260 () Bool)

(assert (=> b!1040716 (= e!589262 (and e!589260 mapRes!38698))))

(declare-fun condMapEmpty!38698 () Bool)

(declare-fun mapDefault!38698 () ValueCell!11668)

