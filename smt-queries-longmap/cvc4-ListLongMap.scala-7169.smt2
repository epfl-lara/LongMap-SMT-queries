; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91552 () Bool)

(assert start!91552)

(declare-fun b!1042712 () Bool)

(declare-fun b_free!21071 () Bool)

(declare-fun b_next!21071 () Bool)

(assert (=> b!1042712 (= b_free!21071 (not b_next!21071))))

(declare-fun tp!74442 () Bool)

(declare-fun b_and!33603 () Bool)

(assert (=> b!1042712 (= tp!74442 b_and!33603)))

(declare-fun b!1042705 () Bool)

(declare-fun res!694743 () Bool)

(declare-fun e!590695 () Bool)

(assert (=> b!1042705 (=> res!694743 e!590695)))

(declare-datatypes ((V!37927 0))(
  ( (V!37928 (val!12446 Int)) )
))
(declare-datatypes ((ValueCell!11692 0))(
  ( (ValueCellFull!11692 (v!15037 V!37927)) (EmptyCell!11692) )
))
(declare-datatypes ((array!65738 0))(
  ( (array!65739 (arr!31625 (Array (_ BitVec 32) (_ BitVec 64))) (size!32160 (_ BitVec 32))) )
))
(declare-datatypes ((array!65740 0))(
  ( (array!65741 (arr!31626 (Array (_ BitVec 32) ValueCell!11692)) (size!32161 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5978 0))(
  ( (LongMapFixedSize!5979 (defaultEntry!6371 Int) (mask!30440 (_ BitVec 32)) (extraKeys!6099 (_ BitVec 32)) (zeroValue!6205 V!37927) (minValue!6205 V!37927) (_size!3044 (_ BitVec 32)) (_keys!11623 array!65738) (_values!6394 array!65740) (_vacant!3044 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5978)

(declare-datatypes ((List!21978 0))(
  ( (Nil!21975) (Cons!21974 (h!23182 (_ BitVec 64)) (t!31192 List!21978)) )
))
(declare-fun arrayNoDuplicates!0 (array!65738 (_ BitVec 32) List!21978) Bool)

(assert (=> b!1042705 (= res!694743 (not (arrayNoDuplicates!0 (_keys!11623 thiss!1427) #b00000000000000000000000000000000 Nil!21975)))))

(declare-fun b!1042706 () Bool)

(declare-fun e!590693 () Bool)

(declare-fun e!590699 () Bool)

(assert (=> b!1042706 (= e!590693 e!590699)))

(declare-fun res!694749 () Bool)

(assert (=> b!1042706 (=> (not res!694749) (not e!590699))))

(declare-datatypes ((SeekEntryResult!9820 0))(
  ( (MissingZero!9820 (index!41651 (_ BitVec 32))) (Found!9820 (index!41652 (_ BitVec 32))) (Intermediate!9820 (undefined!10632 Bool) (index!41653 (_ BitVec 32)) (x!93088 (_ BitVec 32))) (Undefined!9820) (MissingVacant!9820 (index!41654 (_ BitVec 32))) )
))
(declare-fun lt!459598 () SeekEntryResult!9820)

(assert (=> b!1042706 (= res!694749 (is-Found!9820 lt!459598))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65738 (_ BitVec 32)) SeekEntryResult!9820)

(assert (=> b!1042706 (= lt!459598 (seekEntry!0 key!909 (_keys!11623 thiss!1427) (mask!30440 thiss!1427)))))

(declare-fun b!1042707 () Bool)

(assert (=> b!1042707 (= e!590695 (and (bvsge (index!41652 lt!459598) #b00000000000000000000000000000000) (bvslt (index!41652 lt!459598) (size!32160 (_keys!11623 thiss!1427)))))))

(declare-fun b!1042708 () Bool)

(assert (=> b!1042708 (= e!590699 (not e!590695))))

(declare-fun res!694745 () Bool)

(assert (=> b!1042708 (=> res!694745 e!590695)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042708 (= res!694745 (not (validMask!0 (mask!30440 thiss!1427))))))

(declare-fun lt!459601 () array!65738)

(declare-fun arrayContainsKey!0 (array!65738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042708 (not (arrayContainsKey!0 lt!459601 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34053 0))(
  ( (Unit!34054) )
))
(declare-fun lt!459599 () Unit!34053)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65738 (_ BitVec 32) (_ BitVec 64)) Unit!34053)

(assert (=> b!1042708 (= lt!459599 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11623 thiss!1427) (index!41652 lt!459598) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65738 (_ BitVec 32)) Bool)

(assert (=> b!1042708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459601 (mask!30440 thiss!1427))))

(declare-fun lt!459597 () Unit!34053)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65738 (_ BitVec 32) (_ BitVec 32)) Unit!34053)

(assert (=> b!1042708 (= lt!459597 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11623 thiss!1427) (index!41652 lt!459598) (mask!30440 thiss!1427)))))

(assert (=> b!1042708 (arrayNoDuplicates!0 lt!459601 #b00000000000000000000000000000000 Nil!21975)))

(declare-fun lt!459600 () Unit!34053)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65738 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21978) Unit!34053)

(assert (=> b!1042708 (= lt!459600 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11623 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41652 lt!459598) #b00000000000000000000000000000000 Nil!21975))))

(declare-fun arrayCountValidKeys!0 (array!65738 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042708 (= (arrayCountValidKeys!0 lt!459601 #b00000000000000000000000000000000 (size!32160 (_keys!11623 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11623 thiss!1427) #b00000000000000000000000000000000 (size!32160 (_keys!11623 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042708 (= lt!459601 (array!65739 (store (arr!31625 (_keys!11623 thiss!1427)) (index!41652 lt!459598) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32160 (_keys!11623 thiss!1427))))))

(declare-fun lt!459596 () Unit!34053)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65738 (_ BitVec 32) (_ BitVec 64)) Unit!34053)

(assert (=> b!1042708 (= lt!459596 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11623 thiss!1427) (index!41652 lt!459598) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1042709 () Bool)

(declare-fun res!694744 () Bool)

(assert (=> b!1042709 (=> res!694744 e!590695)))

(assert (=> b!1042709 (= res!694744 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11623 thiss!1427) (mask!30440 thiss!1427))))))

(declare-fun b!1042711 () Bool)

(declare-fun res!694748 () Bool)

(assert (=> b!1042711 (=> res!694748 e!590695)))

(assert (=> b!1042711 (= res!694748 (or (not (= (size!32161 (_values!6394 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30440 thiss!1427)))) (not (= (size!32160 (_keys!11623 thiss!1427)) (size!32161 (_values!6394 thiss!1427)))) (bvslt (mask!30440 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!6099 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!6099 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!38798 () Bool)

(declare-fun mapRes!38798 () Bool)

(declare-fun tp!74441 () Bool)

(declare-fun e!590698 () Bool)

(assert (=> mapNonEmpty!38798 (= mapRes!38798 (and tp!74441 e!590698))))

(declare-fun mapRest!38798 () (Array (_ BitVec 32) ValueCell!11692))

(declare-fun mapValue!38798 () ValueCell!11692)

(declare-fun mapKey!38798 () (_ BitVec 32))

(assert (=> mapNonEmpty!38798 (= (arr!31626 (_values!6394 thiss!1427)) (store mapRest!38798 mapKey!38798 mapValue!38798))))

(declare-fun e!590700 () Bool)

(declare-fun e!590697 () Bool)

(declare-fun tp_is_empty!24791 () Bool)

(declare-fun array_inv!24435 (array!65738) Bool)

(declare-fun array_inv!24436 (array!65740) Bool)

(assert (=> b!1042712 (= e!590697 (and tp!74442 tp_is_empty!24791 (array_inv!24435 (_keys!11623 thiss!1427)) (array_inv!24436 (_values!6394 thiss!1427)) e!590700))))

(declare-fun b!1042713 () Bool)

(declare-fun e!590694 () Bool)

(assert (=> b!1042713 (= e!590700 (and e!590694 mapRes!38798))))

(declare-fun condMapEmpty!38798 () Bool)

(declare-fun mapDefault!38798 () ValueCell!11692)

