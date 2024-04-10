; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91772 () Bool)

(assert start!91772)

(declare-fun b!1044305 () Bool)

(declare-fun b_free!21115 () Bool)

(declare-fun b_next!21115 () Bool)

(assert (=> b!1044305 (= b_free!21115 (not b_next!21115))))

(declare-fun tp!74591 () Bool)

(declare-fun b_and!33685 () Bool)

(assert (=> b!1044305 (= tp!74591 b_and!33685)))

(declare-fun b!1044303 () Bool)

(declare-fun e!591822 () Bool)

(declare-fun tp_is_empty!24835 () Bool)

(assert (=> b!1044303 (= e!591822 tp_is_empty!24835)))

(declare-fun b!1044304 () Bool)

(declare-fun e!591823 () Bool)

(declare-fun e!591818 () Bool)

(assert (=> b!1044304 (= e!591823 e!591818)))

(declare-fun res!695561 () Bool)

(assert (=> b!1044304 (=> (not res!695561) (not e!591818))))

(declare-datatypes ((SeekEntryResult!9838 0))(
  ( (MissingZero!9838 (index!41723 (_ BitVec 32))) (Found!9838 (index!41724 (_ BitVec 32))) (Intermediate!9838 (undefined!10650 Bool) (index!41725 (_ BitVec 32)) (x!93252 (_ BitVec 32))) (Undefined!9838) (MissingVacant!9838 (index!41726 (_ BitVec 32))) )
))
(declare-fun lt!460610 () SeekEntryResult!9838)

(assert (=> b!1044304 (= res!695561 (is-Found!9838 lt!460610))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37987 0))(
  ( (V!37988 (val!12468 Int)) )
))
(declare-datatypes ((ValueCell!11714 0))(
  ( (ValueCellFull!11714 (v!15060 V!37987)) (EmptyCell!11714) )
))
(declare-datatypes ((array!65838 0))(
  ( (array!65839 (arr!31669 (Array (_ BitVec 32) (_ BitVec 64))) (size!32204 (_ BitVec 32))) )
))
(declare-datatypes ((array!65840 0))(
  ( (array!65841 (arr!31670 (Array (_ BitVec 32) ValueCell!11714)) (size!32205 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6022 0))(
  ( (LongMapFixedSize!6023 (defaultEntry!6399 Int) (mask!30506 (_ BitVec 32)) (extraKeys!6127 (_ BitVec 32)) (zeroValue!6233 V!37987) (minValue!6233 V!37987) (_size!3066 (_ BitVec 32)) (_keys!11663 array!65838) (_values!6422 array!65840) (_vacant!3066 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6022)

(declare-fun seekEntry!0 ((_ BitVec 64) array!65838 (_ BitVec 32)) SeekEntryResult!9838)

(assert (=> b!1044304 (= lt!460610 (seekEntry!0 key!909 (_keys!11663 thiss!1427) (mask!30506 thiss!1427)))))

(declare-fun mapIsEmpty!38882 () Bool)

(declare-fun mapRes!38882 () Bool)

(assert (=> mapIsEmpty!38882 mapRes!38882))

(declare-fun b!1044306 () Bool)

(declare-fun e!591817 () Bool)

(declare-datatypes ((Unit!34095 0))(
  ( (Unit!34096) )
))
(declare-datatypes ((tuple2!15752 0))(
  ( (tuple2!15753 (_1!7887 Unit!34095) (_2!7887 LongMapFixedSize!6022)) )
))
(declare-fun lt!460613 () tuple2!15752)

(assert (=> b!1044306 (= e!591817 (= (size!32205 (_values!6422 (_2!7887 lt!460613))) (bvadd #b00000000000000000000000000000001 (mask!30506 (_2!7887 lt!460613)))))))

(declare-fun res!695565 () Bool)

(assert (=> start!91772 (=> (not res!695565) (not e!591823))))

(declare-fun valid!2259 (LongMapFixedSize!6022) Bool)

(assert (=> start!91772 (= res!695565 (valid!2259 thiss!1427))))

(assert (=> start!91772 e!591823))

(declare-fun e!591821 () Bool)

(assert (=> start!91772 e!591821))

(assert (=> start!91772 true))

(declare-fun e!591816 () Bool)

(declare-fun array_inv!24461 (array!65838) Bool)

(declare-fun array_inv!24462 (array!65840) Bool)

(assert (=> b!1044305 (= e!591821 (and tp!74591 tp_is_empty!24835 (array_inv!24461 (_keys!11663 thiss!1427)) (array_inv!24462 (_values!6422 thiss!1427)) e!591816))))

(declare-fun b!1044307 () Bool)

(assert (=> b!1044307 (= e!591818 (not e!591817))))

(declare-fun res!695562 () Bool)

(assert (=> b!1044307 (=> res!695562 e!591817)))

(declare-datatypes ((tuple2!15754 0))(
  ( (tuple2!15755 (_1!7888 (_ BitVec 64)) (_2!7888 V!37987)) )
))
(declare-datatypes ((List!22002 0))(
  ( (Nil!21999) (Cons!21998 (h!23206 tuple2!15754) (t!31238 List!22002)) )
))
(declare-datatypes ((ListLongMap!13777 0))(
  ( (ListLongMap!13778 (toList!6904 List!22002)) )
))
(declare-fun contains!6069 (ListLongMap!13777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3952 (array!65838 array!65840 (_ BitVec 32) (_ BitVec 32) V!37987 V!37987 (_ BitVec 32) Int) ListLongMap!13777)

(assert (=> b!1044307 (= res!695562 (not (contains!6069 (getCurrentListMap!3952 (_keys!11663 (_2!7887 lt!460613)) (_values!6422 (_2!7887 lt!460613)) (mask!30506 (_2!7887 lt!460613)) (extraKeys!6127 (_2!7887 lt!460613)) (zeroValue!6233 (_2!7887 lt!460613)) (minValue!6233 (_2!7887 lt!460613)) #b00000000000000000000000000000000 (defaultEntry!6399 (_2!7887 lt!460613))) key!909)))))

(declare-fun lt!460615 () array!65840)

(declare-fun lt!460612 () array!65838)

(declare-fun Unit!34097 () Unit!34095)

(declare-fun Unit!34098 () Unit!34095)

(assert (=> b!1044307 (= lt!460613 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!3066 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15753 Unit!34097 (LongMapFixedSize!6023 (defaultEntry!6399 thiss!1427) (mask!30506 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (bvsub (_size!3066 thiss!1427) #b00000000000000000000000000000001) lt!460612 lt!460615 (bvadd #b00000000000000000000000000000001 (_vacant!3066 thiss!1427)))) (tuple2!15753 Unit!34098 (LongMapFixedSize!6023 (defaultEntry!6399 thiss!1427) (mask!30506 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (bvsub (_size!3066 thiss!1427) #b00000000000000000000000000000001) lt!460612 lt!460615 (_vacant!3066 thiss!1427)))))))

(declare-fun -!531 (ListLongMap!13777 (_ BitVec 64)) ListLongMap!13777)

(assert (=> b!1044307 (= (-!531 (getCurrentListMap!3952 (_keys!11663 thiss!1427) (_values!6422 thiss!1427) (mask!30506 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)) key!909) (getCurrentListMap!3952 lt!460612 lt!460615 (mask!30506 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6399 thiss!1427)))))

(declare-fun dynLambda!2001 (Int (_ BitVec 64)) V!37987)

(assert (=> b!1044307 (= lt!460615 (array!65841 (store (arr!31670 (_values!6422 thiss!1427)) (index!41724 lt!460610) (ValueCellFull!11714 (dynLambda!2001 (defaultEntry!6399 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!32205 (_values!6422 thiss!1427))))))

(declare-fun lt!460608 () Unit!34095)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!52 (array!65838 array!65840 (_ BitVec 32) (_ BitVec 32) V!37987 V!37987 (_ BitVec 32) (_ BitVec 64) Int) Unit!34095)

(assert (=> b!1044307 (= lt!460608 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!52 (_keys!11663 thiss!1427) (_values!6422 thiss!1427) (mask!30506 thiss!1427) (extraKeys!6127 thiss!1427) (zeroValue!6233 thiss!1427) (minValue!6233 thiss!1427) (index!41724 lt!460610) key!909 (defaultEntry!6399 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!65838 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1044307 (not (arrayContainsKey!0 lt!460612 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!460614 () Unit!34095)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65838 (_ BitVec 32) (_ BitVec 64)) Unit!34095)

(assert (=> b!1044307 (= lt!460614 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11663 thiss!1427) (index!41724 lt!460610) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65838 (_ BitVec 32)) Bool)

(assert (=> b!1044307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!460612 (mask!30506 thiss!1427))))

(declare-fun lt!460611 () Unit!34095)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65838 (_ BitVec 32) (_ BitVec 32)) Unit!34095)

(assert (=> b!1044307 (= lt!460611 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11663 thiss!1427) (index!41724 lt!460610) (mask!30506 thiss!1427)))))

(declare-datatypes ((List!22003 0))(
  ( (Nil!22000) (Cons!21999 (h!23207 (_ BitVec 64)) (t!31239 List!22003)) )
))
(declare-fun arrayNoDuplicates!0 (array!65838 (_ BitVec 32) List!22003) Bool)

(assert (=> b!1044307 (arrayNoDuplicates!0 lt!460612 #b00000000000000000000000000000000 Nil!22000)))

(declare-fun lt!460609 () Unit!34095)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65838 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!22003) Unit!34095)

(assert (=> b!1044307 (= lt!460609 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11663 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41724 lt!460610) #b00000000000000000000000000000000 Nil!22000))))

(declare-fun arrayCountValidKeys!0 (array!65838 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1044307 (= (arrayCountValidKeys!0 lt!460612 #b00000000000000000000000000000000 (size!32204 (_keys!11663 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11663 thiss!1427) #b00000000000000000000000000000000 (size!32204 (_keys!11663 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1044307 (= lt!460612 (array!65839 (store (arr!31669 (_keys!11663 thiss!1427)) (index!41724 lt!460610) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32204 (_keys!11663 thiss!1427))))))

(declare-fun lt!460616 () Unit!34095)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65838 (_ BitVec 32) (_ BitVec 64)) Unit!34095)

(assert (=> b!1044307 (= lt!460616 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11663 thiss!1427) (index!41724 lt!460610) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1044308 () Bool)

(assert (=> b!1044308 (= e!591816 (and e!591822 mapRes!38882))))

(declare-fun condMapEmpty!38882 () Bool)

(declare-fun mapDefault!38882 () ValueCell!11714)

