; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90032 () Bool)

(assert start!90032)

(declare-fun b!1031033 () Bool)

(declare-fun b_free!20639 () Bool)

(declare-fun b_next!20639 () Bool)

(assert (=> b!1031033 (= b_free!20639 (not b_next!20639))))

(declare-fun tp!72987 () Bool)

(declare-fun b_and!33045 () Bool)

(assert (=> b!1031033 (= tp!72987 b_and!33045)))

(declare-fun b!1031027 () Bool)

(declare-fun e!582281 () Bool)

(assert (=> b!1031027 (= e!582281 true)))

(declare-fun lt!455020 () Bool)

(declare-datatypes ((V!37351 0))(
  ( (V!37352 (val!12230 Int)) )
))
(declare-datatypes ((ValueCell!11476 0))(
  ( (ValueCellFull!11476 (v!14807 V!37351)) (EmptyCell!11476) )
))
(declare-datatypes ((Unit!33693 0))(
  ( (Unit!33694) )
))
(declare-datatypes ((array!64782 0))(
  ( (array!64783 (arr!31193 (Array (_ BitVec 32) (_ BitVec 64))) (size!31710 (_ BitVec 32))) )
))
(declare-datatypes ((array!64784 0))(
  ( (array!64785 (arr!31194 (Array (_ BitVec 32) ValueCell!11476)) (size!31711 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5546 0))(
  ( (LongMapFixedSize!5547 (defaultEntry!6147 Int) (mask!29935 (_ BitVec 32)) (extraKeys!5879 (_ BitVec 32)) (zeroValue!5983 V!37351) (minValue!5983 V!37351) (_size!2828 (_ BitVec 32)) (_keys!11320 array!64782) (_values!6170 array!64784) (_vacant!2828 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15620 0))(
  ( (tuple2!15621 (_1!7821 Unit!33693) (_2!7821 LongMapFixedSize!5546)) )
))
(declare-fun lt!455016 () tuple2!15620)

(declare-datatypes ((List!21850 0))(
  ( (Nil!21847) (Cons!21846 (h!23048 (_ BitVec 64)) (t!30984 List!21850)) )
))
(declare-fun arrayNoDuplicates!0 (array!64782 (_ BitVec 32) List!21850) Bool)

(assert (=> b!1031027 (= lt!455020 (arrayNoDuplicates!0 (_keys!11320 (_2!7821 lt!455016)) #b00000000000000000000000000000000 Nil!21847))))

(declare-fun b!1031028 () Bool)

(declare-fun res!689401 () Bool)

(assert (=> b!1031028 (=> res!689401 e!582281)))

(assert (=> b!1031028 (= res!689401 (or (not (= (size!31711 (_values!6170 (_2!7821 lt!455016))) (bvadd #b00000000000000000000000000000001 (mask!29935 (_2!7821 lt!455016))))) (not (= (size!31710 (_keys!11320 (_2!7821 lt!455016))) (size!31711 (_values!6170 (_2!7821 lt!455016))))) (bvslt (mask!29935 (_2!7821 lt!455016)) #b00000000000000000000000000000000) (bvslt (extraKeys!5879 (_2!7821 lt!455016)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5879 (_2!7821 lt!455016)) #b00000000000000000000000000000011)))))

(declare-fun res!689399 () Bool)

(declare-fun e!582283 () Bool)

(assert (=> start!90032 (=> (not res!689399) (not e!582283))))

(declare-fun thiss!1427 () LongMapFixedSize!5546)

(declare-fun valid!2100 (LongMapFixedSize!5546) Bool)

(assert (=> start!90032 (= res!689399 (valid!2100 thiss!1427))))

(assert (=> start!90032 e!582283))

(declare-fun e!582279 () Bool)

(assert (=> start!90032 e!582279))

(assert (=> start!90032 true))

(declare-fun mapNonEmpty!37992 () Bool)

(declare-fun mapRes!37992 () Bool)

(declare-fun tp!72988 () Bool)

(declare-fun e!582280 () Bool)

(assert (=> mapNonEmpty!37992 (= mapRes!37992 (and tp!72988 e!582280))))

(declare-fun mapKey!37992 () (_ BitVec 32))

(declare-fun mapValue!37992 () ValueCell!11476)

(declare-fun mapRest!37992 () (Array (_ BitVec 32) ValueCell!11476))

(assert (=> mapNonEmpty!37992 (= (arr!31194 (_values!6170 thiss!1427)) (store mapRest!37992 mapKey!37992 mapValue!37992))))

(declare-fun b!1031029 () Bool)

(declare-fun res!689400 () Bool)

(assert (=> b!1031029 (=> res!689400 e!582281)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64782 (_ BitVec 32)) Bool)

(assert (=> b!1031029 (= res!689400 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11320 (_2!7821 lt!455016)) (mask!29935 (_2!7821 lt!455016)))))))

(declare-fun b!1031030 () Bool)

(declare-fun res!689403 () Bool)

(assert (=> b!1031030 (=> (not res!689403) (not e!582283))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1031030 (= res!689403 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031031 () Bool)

(declare-fun res!689404 () Bool)

(assert (=> b!1031031 (=> res!689404 e!582281)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031031 (= res!689404 (not (validMask!0 (mask!29935 (_2!7821 lt!455016)))))))

(declare-fun b!1031032 () Bool)

(declare-fun tp_is_empty!24359 () Bool)

(assert (=> b!1031032 (= e!582280 tp_is_empty!24359)))

(declare-fun e!582282 () Bool)

(declare-fun array_inv!24145 (array!64782) Bool)

(declare-fun array_inv!24146 (array!64784) Bool)

(assert (=> b!1031033 (= e!582279 (and tp!72987 tp_is_empty!24359 (array_inv!24145 (_keys!11320 thiss!1427)) (array_inv!24146 (_values!6170 thiss!1427)) e!582282))))

(declare-fun b!1031034 () Bool)

(declare-fun e!582285 () Bool)

(assert (=> b!1031034 (= e!582283 e!582285)))

(declare-fun res!689402 () Bool)

(assert (=> b!1031034 (=> (not res!689402) (not e!582285))))

(declare-datatypes ((SeekEntryResult!9698 0))(
  ( (MissingZero!9698 (index!41163 (_ BitVec 32))) (Found!9698 (index!41164 (_ BitVec 32))) (Intermediate!9698 (undefined!10510 Bool) (index!41165 (_ BitVec 32)) (x!91782 (_ BitVec 32))) (Undefined!9698) (MissingVacant!9698 (index!41166 (_ BitVec 32))) )
))
(declare-fun lt!455015 () SeekEntryResult!9698)

(assert (=> b!1031034 (= res!689402 (is-Found!9698 lt!455015))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64782 (_ BitVec 32)) SeekEntryResult!9698)

(assert (=> b!1031034 (= lt!455015 (seekEntry!0 key!909 (_keys!11320 thiss!1427) (mask!29935 thiss!1427)))))

(declare-fun b!1031035 () Bool)

(declare-fun e!582284 () Bool)

(assert (=> b!1031035 (= e!582284 tp_is_empty!24359)))

(declare-fun b!1031036 () Bool)

(assert (=> b!1031036 (= e!582285 (not e!582281))))

(declare-fun res!689405 () Bool)

(assert (=> b!1031036 (=> res!689405 e!582281)))

(declare-datatypes ((tuple2!15622 0))(
  ( (tuple2!15623 (_1!7822 (_ BitVec 64)) (_2!7822 V!37351)) )
))
(declare-datatypes ((List!21851 0))(
  ( (Nil!21848) (Cons!21847 (h!23049 tuple2!15622) (t!30985 List!21851)) )
))
(declare-datatypes ((ListLongMap!13709 0))(
  ( (ListLongMap!13710 (toList!6870 List!21851)) )
))
(declare-fun contains!5984 (ListLongMap!13709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3918 (array!64782 array!64784 (_ BitVec 32) (_ BitVec 32) V!37351 V!37351 (_ BitVec 32) Int) ListLongMap!13709)

(assert (=> b!1031036 (= res!689405 (not (contains!5984 (getCurrentListMap!3918 (_keys!11320 (_2!7821 lt!455016)) (_values!6170 (_2!7821 lt!455016)) (mask!29935 (_2!7821 lt!455016)) (extraKeys!5879 (_2!7821 lt!455016)) (zeroValue!5983 (_2!7821 lt!455016)) (minValue!5983 (_2!7821 lt!455016)) #b00000000000000000000000000000000 (defaultEntry!6147 (_2!7821 lt!455016))) key!909)))))

(declare-fun lt!455021 () array!64782)

(declare-fun lt!455012 () array!64784)

(declare-fun Unit!33695 () Unit!33693)

(declare-fun Unit!33696 () Unit!33693)

(assert (=> b!1031036 (= lt!455016 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2828 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15621 Unit!33695 (LongMapFixedSize!5547 (defaultEntry!6147 thiss!1427) (mask!29935 thiss!1427) (extraKeys!5879 thiss!1427) (zeroValue!5983 thiss!1427) (minValue!5983 thiss!1427) (bvsub (_size!2828 thiss!1427) #b00000000000000000000000000000001) lt!455021 lt!455012 (bvadd #b00000000000000000000000000000001 (_vacant!2828 thiss!1427)))) (tuple2!15621 Unit!33696 (LongMapFixedSize!5547 (defaultEntry!6147 thiss!1427) (mask!29935 thiss!1427) (extraKeys!5879 thiss!1427) (zeroValue!5983 thiss!1427) (minValue!5983 thiss!1427) (bvsub (_size!2828 thiss!1427) #b00000000000000000000000000000001) lt!455021 lt!455012 (_vacant!2828 thiss!1427)))))))

(declare-fun -!497 (ListLongMap!13709 (_ BitVec 64)) ListLongMap!13709)

(assert (=> b!1031036 (= (-!497 (getCurrentListMap!3918 (_keys!11320 thiss!1427) (_values!6170 thiss!1427) (mask!29935 thiss!1427) (extraKeys!5879 thiss!1427) (zeroValue!5983 thiss!1427) (minValue!5983 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6147 thiss!1427)) key!909) (getCurrentListMap!3918 lt!455021 lt!455012 (mask!29935 thiss!1427) (extraKeys!5879 thiss!1427) (zeroValue!5983 thiss!1427) (minValue!5983 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6147 thiss!1427)))))

(declare-fun dynLambda!1967 (Int (_ BitVec 64)) V!37351)

(assert (=> b!1031036 (= lt!455012 (array!64785 (store (arr!31194 (_values!6170 thiss!1427)) (index!41164 lt!455015) (ValueCellFull!11476 (dynLambda!1967 (defaultEntry!6147 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31711 (_values!6170 thiss!1427))))))

(declare-fun lt!455018 () Unit!33693)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!23 (array!64782 array!64784 (_ BitVec 32) (_ BitVec 32) V!37351 V!37351 (_ BitVec 32) (_ BitVec 64) Int) Unit!33693)

(assert (=> b!1031036 (= lt!455018 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!23 (_keys!11320 thiss!1427) (_values!6170 thiss!1427) (mask!29935 thiss!1427) (extraKeys!5879 thiss!1427) (zeroValue!5983 thiss!1427) (minValue!5983 thiss!1427) (index!41164 lt!455015) key!909 (defaultEntry!6147 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031036 (not (arrayContainsKey!0 lt!455021 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455013 () Unit!33693)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64782 (_ BitVec 32) (_ BitVec 64)) Unit!33693)

(assert (=> b!1031036 (= lt!455013 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11320 thiss!1427) (index!41164 lt!455015) key!909))))

(assert (=> b!1031036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455021 (mask!29935 thiss!1427))))

(declare-fun lt!455019 () Unit!33693)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64782 (_ BitVec 32) (_ BitVec 32)) Unit!33693)

(assert (=> b!1031036 (= lt!455019 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11320 thiss!1427) (index!41164 lt!455015) (mask!29935 thiss!1427)))))

(assert (=> b!1031036 (arrayNoDuplicates!0 lt!455021 #b00000000000000000000000000000000 Nil!21847)))

(declare-fun lt!455017 () Unit!33693)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64782 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21850) Unit!33693)

(assert (=> b!1031036 (= lt!455017 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11320 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41164 lt!455015) #b00000000000000000000000000000000 Nil!21847))))

(declare-fun arrayCountValidKeys!0 (array!64782 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031036 (= (arrayCountValidKeys!0 lt!455021 #b00000000000000000000000000000000 (size!31710 (_keys!11320 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11320 thiss!1427) #b00000000000000000000000000000000 (size!31710 (_keys!11320 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031036 (= lt!455021 (array!64783 (store (arr!31193 (_keys!11320 thiss!1427)) (index!41164 lt!455015) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31710 (_keys!11320 thiss!1427))))))

(declare-fun lt!455014 () Unit!33693)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64782 (_ BitVec 32) (_ BitVec 64)) Unit!33693)

(assert (=> b!1031036 (= lt!455014 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11320 thiss!1427) (index!41164 lt!455015) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37992 () Bool)

(assert (=> mapIsEmpty!37992 mapRes!37992))

(declare-fun b!1031037 () Bool)

(assert (=> b!1031037 (= e!582282 (and e!582284 mapRes!37992))))

(declare-fun condMapEmpty!37992 () Bool)

(declare-fun mapDefault!37992 () ValueCell!11476)

