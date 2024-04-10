; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91516 () Bool)

(assert start!91516)

(declare-fun b!1042440 () Bool)

(declare-fun b_free!21061 () Bool)

(declare-fun b_next!21061 () Bool)

(assert (=> b!1042440 (= b_free!21061 (not b_next!21061))))

(declare-fun tp!74408 () Bool)

(declare-fun b_and!33593 () Bool)

(assert (=> b!1042440 (= tp!74408 b_and!33593)))

(declare-fun b!1042433 () Bool)

(declare-fun e!590499 () Bool)

(declare-fun tp_is_empty!24781 () Bool)

(assert (=> b!1042433 (= e!590499 tp_is_empty!24781)))

(declare-fun res!694592 () Bool)

(declare-fun e!590504 () Bool)

(assert (=> start!91516 (=> (not res!694592) (not e!590504))))

(declare-datatypes ((V!37915 0))(
  ( (V!37916 (val!12441 Int)) )
))
(declare-datatypes ((ValueCell!11687 0))(
  ( (ValueCellFull!11687 (v!15032 V!37915)) (EmptyCell!11687) )
))
(declare-datatypes ((array!65716 0))(
  ( (array!65717 (arr!31615 (Array (_ BitVec 32) (_ BitVec 64))) (size!32150 (_ BitVec 32))) )
))
(declare-datatypes ((array!65718 0))(
  ( (array!65719 (arr!31616 (Array (_ BitVec 32) ValueCell!11687)) (size!32151 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5968 0))(
  ( (LongMapFixedSize!5969 (defaultEntry!6366 Int) (mask!30429 (_ BitVec 32)) (extraKeys!6094 (_ BitVec 32)) (zeroValue!6200 V!37915) (minValue!6200 V!37915) (_size!3039 (_ BitVec 32)) (_keys!11616 array!65716) (_values!6389 array!65718) (_vacant!3039 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5968)

(declare-fun valid!2242 (LongMapFixedSize!5968) Bool)

(assert (=> start!91516 (= res!694592 (valid!2242 thiss!1427))))

(assert (=> start!91516 e!590504))

(declare-fun e!590505 () Bool)

(assert (=> start!91516 e!590505))

(assert (=> start!91516 true))

(declare-fun b!1042434 () Bool)

(declare-fun e!590501 () Bool)

(assert (=> b!1042434 (= e!590501 tp_is_empty!24781)))

(declare-fun b!1042435 () Bool)

(declare-fun res!694594 () Bool)

(declare-fun e!590503 () Bool)

(assert (=> b!1042435 (=> res!694594 e!590503)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65716 (_ BitVec 32)) Bool)

(assert (=> b!1042435 (= res!694594 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11616 thiss!1427) (mask!30429 thiss!1427))))))

(declare-fun b!1042436 () Bool)

(declare-fun res!694590 () Bool)

(assert (=> b!1042436 (=> (not res!694590) (not e!590504))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1042436 (= res!694590 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1042437 () Bool)

(declare-fun e!590500 () Bool)

(assert (=> b!1042437 (= e!590500 (not e!590503))))

(declare-fun res!694593 () Bool)

(assert (=> b!1042437 (=> res!694593 e!590503)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042437 (= res!694593 (not (validMask!0 (mask!30429 thiss!1427))))))

(declare-fun lt!459470 () array!65716)

(declare-fun arrayContainsKey!0 (array!65716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042437 (not (arrayContainsKey!0 lt!459470 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34045 0))(
  ( (Unit!34046) )
))
(declare-fun lt!459467 () Unit!34045)

(declare-datatypes ((SeekEntryResult!9816 0))(
  ( (MissingZero!9816 (index!41635 (_ BitVec 32))) (Found!9816 (index!41636 (_ BitVec 32))) (Intermediate!9816 (undefined!10628 Bool) (index!41637 (_ BitVec 32)) (x!93068 (_ BitVec 32))) (Undefined!9816) (MissingVacant!9816 (index!41638 (_ BitVec 32))) )
))
(declare-fun lt!459471 () SeekEntryResult!9816)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65716 (_ BitVec 32) (_ BitVec 64)) Unit!34045)

(assert (=> b!1042437 (= lt!459467 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11616 thiss!1427) (index!41636 lt!459471) key!909))))

(assert (=> b!1042437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459470 (mask!30429 thiss!1427))))

(declare-fun lt!459469 () Unit!34045)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65716 (_ BitVec 32) (_ BitVec 32)) Unit!34045)

(assert (=> b!1042437 (= lt!459469 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11616 thiss!1427) (index!41636 lt!459471) (mask!30429 thiss!1427)))))

(declare-datatypes ((List!21974 0))(
  ( (Nil!21971) (Cons!21970 (h!23178 (_ BitVec 64)) (t!31188 List!21974)) )
))
(declare-fun arrayNoDuplicates!0 (array!65716 (_ BitVec 32) List!21974) Bool)

(assert (=> b!1042437 (arrayNoDuplicates!0 lt!459470 #b00000000000000000000000000000000 Nil!21971)))

(declare-fun lt!459468 () Unit!34045)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65716 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21974) Unit!34045)

(assert (=> b!1042437 (= lt!459468 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11616 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41636 lt!459471) #b00000000000000000000000000000000 Nil!21971))))

(declare-fun arrayCountValidKeys!0 (array!65716 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042437 (= (arrayCountValidKeys!0 lt!459470 #b00000000000000000000000000000000 (size!32150 (_keys!11616 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11616 thiss!1427) #b00000000000000000000000000000000 (size!32150 (_keys!11616 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042437 (= lt!459470 (array!65717 (store (arr!31615 (_keys!11616 thiss!1427)) (index!41636 lt!459471) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32150 (_keys!11616 thiss!1427))))))

(declare-fun lt!459466 () Unit!34045)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65716 (_ BitVec 32) (_ BitVec 64)) Unit!34045)

(assert (=> b!1042437 (= lt!459466 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11616 thiss!1427) (index!41636 lt!459471) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38780 () Bool)

(declare-fun mapRes!38780 () Bool)

(assert (=> mapIsEmpty!38780 mapRes!38780))

(declare-fun b!1042438 () Bool)

(declare-fun e!590498 () Bool)

(assert (=> b!1042438 (= e!590498 (and e!590501 mapRes!38780))))

(declare-fun condMapEmpty!38780 () Bool)

(declare-fun mapDefault!38780 () ValueCell!11687)

