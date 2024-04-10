; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91732 () Bool)

(assert start!91732)

(declare-fun b!1044008 () Bool)

(declare-fun b_free!21109 () Bool)

(declare-fun b_next!21109 () Bool)

(assert (=> b!1044008 (= b_free!21109 (not b_next!21109))))

(declare-fun tp!74571 () Bool)

(declare-fun b_and!33665 () Bool)

(assert (=> b!1044008 (= tp!74571 b_and!33665)))

(declare-fun b!1044001 () Bool)

(declare-fun e!591604 () Bool)

(declare-fun e!591608 () Bool)

(assert (=> b!1044001 (= e!591604 (not e!591608))))

(declare-fun res!695422 () Bool)

(assert (=> b!1044001 (=> res!695422 e!591608)))

(declare-datatypes ((V!37979 0))(
  ( (V!37980 (val!12465 Int)) )
))
(declare-datatypes ((ValueCell!11711 0))(
  ( (ValueCellFull!11711 (v!15056 V!37979)) (EmptyCell!11711) )
))
(declare-datatypes ((Unit!34083 0))(
  ( (Unit!34084) )
))
(declare-datatypes ((array!65824 0))(
  ( (array!65825 (arr!31663 (Array (_ BitVec 32) (_ BitVec 64))) (size!32198 (_ BitVec 32))) )
))
(declare-datatypes ((array!65826 0))(
  ( (array!65827 (arr!31664 (Array (_ BitVec 32) ValueCell!11711)) (size!32199 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6016 0))(
  ( (LongMapFixedSize!6017 (defaultEntry!6394 Int) (mask!30495 (_ BitVec 32)) (extraKeys!6122 (_ BitVec 32)) (zeroValue!6228 V!37979) (minValue!6228 V!37979) (_size!3063 (_ BitVec 32)) (_keys!11656 array!65824) (_values!6417 array!65826) (_vacant!3063 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15744 0))(
  ( (tuple2!15745 (_1!7883 Unit!34083) (_2!7883 LongMapFixedSize!6016)) )
))
(declare-fun lt!460365 () tuple2!15744)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15746 0))(
  ( (tuple2!15747 (_1!7884 (_ BitVec 64)) (_2!7884 V!37979)) )
))
(declare-datatypes ((List!21998 0))(
  ( (Nil!21995) (Cons!21994 (h!23202 tuple2!15746) (t!31226 List!21998)) )
))
(declare-datatypes ((ListLongMap!13773 0))(
  ( (ListLongMap!13774 (toList!6902 List!21998)) )
))
(declare-fun contains!6066 (ListLongMap!13773 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3950 (array!65824 array!65826 (_ BitVec 32) (_ BitVec 32) V!37979 V!37979 (_ BitVec 32) Int) ListLongMap!13773)

(assert (=> b!1044001 (= res!695422 (not (contains!6066 (getCurrentListMap!3950 (_keys!11656 (_2!7883 lt!460365)) (_values!6417 (_2!7883 lt!460365)) (mask!30495 (_2!7883 lt!460365)) (extraKeys!6122 (_2!7883 lt!460365)) (zeroValue!6228 (_2!7883 lt!460365)) (minValue!6228 (_2!7883 lt!460365)) #b00000000000000000000000000000000 (defaultEntry!6394 (_2!7883 lt!460365))) key!909)))))

(declare-fun lt!460369 () array!65826)

(declare-fun lt!460367 () array!65824)

(declare-fun thiss!1427 () LongMapFixedSize!6016)

(declare-fun Unit!34085 () Unit!34083)

(declare-fun Unit!34086 () Unit!34083)

(assert (=> b!1044001 (= lt!460365 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3063 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15745 Unit!34085 (LongMapFixedSize!6017 (defaultEntry!6394 thiss!1427) (mask!30495 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (bvsub (_size!3063 thiss!1427) #b00000000000000000000000000000001) lt!460367 lt!460369 (bvadd #b00000000000000000000000000000001 (_vacant!3063 thiss!1427)))) (tuple2!15745 Unit!34086 (LongMapFixedSize!6017 (defaultEntry!6394 thiss!1427) (mask!30495 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (bvsub (_size!3063 thiss!1427) #b00000000000000000000000000000001) lt!460367 lt!460369 (_vacant!3063 thiss!1427)))))))

(declare-fun -!529 (ListLongMap!13773 (_ BitVec 64)) ListLongMap!13773)

(assert (=> b!1044001 (= (-!529 (getCurrentListMap!3950 (_keys!11656 thiss!1427) (_values!6417 thiss!1427) (mask!30495 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)) key!909) (getCurrentListMap!3950 lt!460367 lt!460369 (mask!30495 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6394 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9836 0))(
  ( (MissingZero!9836 (index!41715 (_ BitVec 32))) (Found!9836 (index!41716 (_ BitVec 32))) (Intermediate!9836 (undefined!10648 Bool) (index!41717 (_ BitVec 32)) (x!93218 (_ BitVec 32))) (Undefined!9836) (MissingVacant!9836 (index!41718 (_ BitVec 32))) )
))
(declare-fun lt!460370 () SeekEntryResult!9836)

(declare-fun dynLambda!1999 (Int (_ BitVec 64)) V!37979)

(assert (=> b!1044001 (= lt!460369 (array!65827 (store (arr!31664 (_values!6417 thiss!1427)) (index!41716 lt!460370) (ValueCellFull!11711 (dynLambda!1999 (defaultEntry!6394 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32199 (_values!6417 thiss!1427))))))

(declare-fun lt!460364 () Unit!34083)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!50 (array!65824 array!65826 (_ BitVec 32) (_ BitVec 32) V!37979 V!37979 (_ BitVec 32) (_ BitVec 64) Int) Unit!34083)

(assert (=> b!1044001 (= lt!460364 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!50 (_keys!11656 thiss!1427) (_values!6417 thiss!1427) (mask!30495 thiss!1427) (extraKeys!6122 thiss!1427) (zeroValue!6228 thiss!1427) (minValue!6228 thiss!1427) (index!41716 lt!460370) key!909 (defaultEntry!6394 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044001 (not (arrayContainsKey!0 lt!460367 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460366 () Unit!34083)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65824 (_ BitVec 32) (_ BitVec 64)) Unit!34083)

(assert (=> b!1044001 (= lt!460366 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11656 thiss!1427) (index!41716 lt!460370) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65824 (_ BitVec 32)) Bool)

(assert (=> b!1044001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460367 (mask!30495 thiss!1427))))

(declare-fun lt!460362 () Unit!34083)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65824 (_ BitVec 32) (_ BitVec 32)) Unit!34083)

(assert (=> b!1044001 (= lt!460362 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11656 thiss!1427) (index!41716 lt!460370) (mask!30495 thiss!1427)))))

(declare-datatypes ((List!21999 0))(
  ( (Nil!21996) (Cons!21995 (h!23203 (_ BitVec 64)) (t!31227 List!21999)) )
))
(declare-fun arrayNoDuplicates!0 (array!65824 (_ BitVec 32) List!21999) Bool)

(assert (=> b!1044001 (arrayNoDuplicates!0 lt!460367 #b00000000000000000000000000000000 Nil!21996)))

(declare-fun lt!460368 () Unit!34083)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65824 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21999) Unit!34083)

(assert (=> b!1044001 (= lt!460368 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11656 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41716 lt!460370) #b00000000000000000000000000000000 Nil!21996))))

(declare-fun arrayCountValidKeys!0 (array!65824 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044001 (= (arrayCountValidKeys!0 lt!460367 #b00000000000000000000000000000000 (size!32198 (_keys!11656 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11656 thiss!1427) #b00000000000000000000000000000000 (size!32198 (_keys!11656 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044001 (= lt!460367 (array!65825 (store (arr!31663 (_keys!11656 thiss!1427)) (index!41716 lt!460370) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32198 (_keys!11656 thiss!1427))))))

(declare-fun lt!460363 () Unit!34083)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65824 (_ BitVec 32) (_ BitVec 64)) Unit!34083)

(assert (=> b!1044001 (= lt!460363 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11656 thiss!1427) (index!41716 lt!460370) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044002 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1044002 (= e!591608 (validMask!0 (mask!30495 (_2!7883 lt!460365))))))

(declare-fun b!1044003 () Bool)

(declare-fun res!695424 () Bool)

(declare-fun e!591602 () Bool)

(assert (=> b!1044003 (=> (not res!695424) (not e!591602))))

(assert (=> b!1044003 (= res!695424 (not (= key!909 (bvneg key!909))))))

(declare-fun res!695423 () Bool)

(assert (=> start!91732 (=> (not res!695423) (not e!591602))))

(declare-fun valid!2257 (LongMapFixedSize!6016) Bool)

(assert (=> start!91732 (= res!695423 (valid!2257 thiss!1427))))

(assert (=> start!91732 e!591602))

(declare-fun e!591606 () Bool)

(assert (=> start!91732 e!591606))

(assert (=> start!91732 true))

(declare-fun mapIsEmpty!38870 () Bool)

(declare-fun mapRes!38870 () Bool)

(assert (=> mapIsEmpty!38870 mapRes!38870))

(declare-fun b!1044004 () Bool)

(declare-fun e!591607 () Bool)

(declare-fun e!591603 () Bool)

(assert (=> b!1044004 (= e!591607 (and e!591603 mapRes!38870))))

(declare-fun condMapEmpty!38870 () Bool)

(declare-fun mapDefault!38870 () ValueCell!11711)

