; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91548 () Bool)

(assert start!91548)

(declare-fun b!1042645 () Bool)

(declare-fun b_free!21067 () Bool)

(declare-fun b_next!21067 () Bool)

(assert (=> b!1042645 (= b_free!21067 (not b_next!21067))))

(declare-fun tp!74430 () Bool)

(declare-fun b_and!33599 () Bool)

(assert (=> b!1042645 (= tp!74430 b_and!33599)))

(declare-fun b!1042639 () Bool)

(declare-fun e!590645 () Bool)

(declare-fun e!590649 () Bool)

(assert (=> b!1042639 (= e!590645 (not e!590649))))

(declare-fun res!694703 () Bool)

(assert (=> b!1042639 (=> res!694703 e!590649)))

(declare-datatypes ((V!37923 0))(
  ( (V!37924 (val!12444 Int)) )
))
(declare-datatypes ((ValueCell!11690 0))(
  ( (ValueCellFull!11690 (v!15035 V!37923)) (EmptyCell!11690) )
))
(declare-datatypes ((array!65730 0))(
  ( (array!65731 (arr!31621 (Array (_ BitVec 32) (_ BitVec 64))) (size!32156 (_ BitVec 32))) )
))
(declare-datatypes ((array!65732 0))(
  ( (array!65733 (arr!31622 (Array (_ BitVec 32) ValueCell!11690)) (size!32157 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5974 0))(
  ( (LongMapFixedSize!5975 (defaultEntry!6369 Int) (mask!30438 (_ BitVec 32)) (extraKeys!6097 (_ BitVec 32)) (zeroValue!6203 V!37923) (minValue!6203 V!37923) (_size!3042 (_ BitVec 32)) (_keys!11621 array!65730) (_values!6392 array!65732) (_vacant!3042 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5974)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042639 (= res!694703 (not (validMask!0 (mask!30438 thiss!1427))))))

(declare-fun lt!459565 () array!65730)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042639 (not (arrayContainsKey!0 lt!459565 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9818 0))(
  ( (MissingZero!9818 (index!41643 (_ BitVec 32))) (Found!9818 (index!41644 (_ BitVec 32))) (Intermediate!9818 (undefined!10630 Bool) (index!41645 (_ BitVec 32)) (x!93086 (_ BitVec 32))) (Undefined!9818) (MissingVacant!9818 (index!41646 (_ BitVec 32))) )
))
(declare-fun lt!459564 () SeekEntryResult!9818)

(declare-datatypes ((Unit!34049 0))(
  ( (Unit!34050) )
))
(declare-fun lt!459563 () Unit!34049)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65730 (_ BitVec 32) (_ BitVec 64)) Unit!34049)

(assert (=> b!1042639 (= lt!459563 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11621 thiss!1427) (index!41644 lt!459564) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65730 (_ BitVec 32)) Bool)

(assert (=> b!1042639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459565 (mask!30438 thiss!1427))))

(declare-fun lt!459561 () Unit!34049)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65730 (_ BitVec 32) (_ BitVec 32)) Unit!34049)

(assert (=> b!1042639 (= lt!459561 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11621 thiss!1427) (index!41644 lt!459564) (mask!30438 thiss!1427)))))

(declare-datatypes ((List!21976 0))(
  ( (Nil!21973) (Cons!21972 (h!23180 (_ BitVec 64)) (t!31190 List!21976)) )
))
(declare-fun arrayNoDuplicates!0 (array!65730 (_ BitVec 32) List!21976) Bool)

(assert (=> b!1042639 (arrayNoDuplicates!0 lt!459565 #b00000000000000000000000000000000 Nil!21973)))

(declare-fun lt!459562 () Unit!34049)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65730 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21976) Unit!34049)

(assert (=> b!1042639 (= lt!459562 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11621 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41644 lt!459564) #b00000000000000000000000000000000 Nil!21973))))

(declare-fun arrayCountValidKeys!0 (array!65730 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042639 (= (arrayCountValidKeys!0 lt!459565 #b00000000000000000000000000000000 (size!32156 (_keys!11621 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11621 thiss!1427) #b00000000000000000000000000000000 (size!32156 (_keys!11621 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042639 (= lt!459565 (array!65731 (store (arr!31621 (_keys!11621 thiss!1427)) (index!41644 lt!459564) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32156 (_keys!11621 thiss!1427))))))

(declare-fun lt!459560 () Unit!34049)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65730 (_ BitVec 32) (_ BitVec 64)) Unit!34049)

(assert (=> b!1042639 (= lt!459560 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11621 thiss!1427) (index!41644 lt!459564) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042640 () Bool)

(declare-fun res!694707 () Bool)

(assert (=> b!1042640 (=> res!694707 e!590649)))

(assert (=> b!1042640 (= res!694707 (or (not (= (size!32157 (_values!6392 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30438 thiss!1427)))) (not (= (size!32156 (_keys!11621 thiss!1427)) (size!32157 (_values!6392 thiss!1427)))) (bvslt (mask!30438 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6097 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6097 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1042641 () Bool)

(declare-fun res!694702 () Bool)

(assert (=> b!1042641 (=> res!694702 e!590649)))

(assert (=> b!1042641 (= res!694702 (not (arrayNoDuplicates!0 (_keys!11621 thiss!1427) #b00000000000000000000000000000000 Nil!21973)))))

(declare-fun b!1042642 () Bool)

(declare-fun e!590652 () Bool)

(declare-fun e!590650 () Bool)

(declare-fun mapRes!38792 () Bool)

(assert (=> b!1042642 (= e!590652 (and e!590650 mapRes!38792))))

(declare-fun condMapEmpty!38792 () Bool)

(declare-fun mapDefault!38792 () ValueCell!11690)

