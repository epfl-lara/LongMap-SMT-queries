; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90034 () Bool)

(assert start!90034)

(declare-fun b!1031064 () Bool)

(declare-fun b_free!20641 () Bool)

(declare-fun b_next!20641 () Bool)

(assert (=> b!1031064 (= b_free!20641 (not b_next!20641))))

(declare-fun tp!72993 () Bool)

(declare-fun b_and!33049 () Bool)

(assert (=> b!1031064 (= tp!72993 b_and!33049)))

(declare-fun b!1031062 () Bool)

(declare-fun e!582302 () Bool)

(declare-fun tp_is_empty!24361 () Bool)

(assert (=> b!1031062 (= e!582302 tp_is_empty!24361)))

(declare-fun b!1031063 () Bool)

(declare-fun e!582304 () Bool)

(assert (=> b!1031063 (= e!582304 tp_is_empty!24361)))

(declare-fun e!582303 () Bool)

(declare-fun e!582309 () Bool)

(declare-datatypes ((V!37355 0))(
  ( (V!37356 (val!12231 Int)) )
))
(declare-datatypes ((ValueCell!11477 0))(
  ( (ValueCellFull!11477 (v!14808 V!37355)) (EmptyCell!11477) )
))
(declare-datatypes ((array!64786 0))(
  ( (array!64787 (arr!31195 (Array (_ BitVec 32) (_ BitVec 64))) (size!31712 (_ BitVec 32))) )
))
(declare-datatypes ((array!64788 0))(
  ( (array!64789 (arr!31196 (Array (_ BitVec 32) ValueCell!11477)) (size!31713 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5548 0))(
  ( (LongMapFixedSize!5549 (defaultEntry!6148 Int) (mask!29938 (_ BitVec 32)) (extraKeys!5880 (_ BitVec 32)) (zeroValue!5984 V!37355) (minValue!5984 V!37355) (_size!2829 (_ BitVec 32)) (_keys!11321 array!64786) (_values!6171 array!64788) (_vacant!2829 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5548)

(declare-fun array_inv!24147 (array!64786) Bool)

(declare-fun array_inv!24148 (array!64788) Bool)

(assert (=> b!1031064 (= e!582303 (and tp!72993 tp_is_empty!24361 (array_inv!24147 (_keys!11321 thiss!1427)) (array_inv!24148 (_values!6171 thiss!1427)) e!582309))))

(declare-fun b!1031065 () Bool)

(declare-fun e!582306 () Bool)

(declare-fun e!582305 () Bool)

(assert (=> b!1031065 (= e!582306 (not e!582305))))

(declare-fun res!689425 () Bool)

(assert (=> b!1031065 (=> res!689425 e!582305)))

(declare-datatypes ((Unit!33697 0))(
  ( (Unit!33698) )
))
(declare-datatypes ((tuple2!15624 0))(
  ( (tuple2!15625 (_1!7823 Unit!33697) (_2!7823 LongMapFixedSize!5548)) )
))
(declare-fun lt!455045 () tuple2!15624)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15626 0))(
  ( (tuple2!15627 (_1!7824 (_ BitVec 64)) (_2!7824 V!37355)) )
))
(declare-datatypes ((List!21852 0))(
  ( (Nil!21849) (Cons!21848 (h!23050 tuple2!15626) (t!30988 List!21852)) )
))
(declare-datatypes ((ListLongMap!13711 0))(
  ( (ListLongMap!13712 (toList!6871 List!21852)) )
))
(declare-fun contains!5985 (ListLongMap!13711 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3919 (array!64786 array!64788 (_ BitVec 32) (_ BitVec 32) V!37355 V!37355 (_ BitVec 32) Int) ListLongMap!13711)

(assert (=> b!1031065 (= res!689425 (not (contains!5985 (getCurrentListMap!3919 (_keys!11321 (_2!7823 lt!455045)) (_values!6171 (_2!7823 lt!455045)) (mask!29938 (_2!7823 lt!455045)) (extraKeys!5880 (_2!7823 lt!455045)) (zeroValue!5984 (_2!7823 lt!455045)) (minValue!5984 (_2!7823 lt!455045)) #b00000000000000000000000000000000 (defaultEntry!6148 (_2!7823 lt!455045))) key!909)))))

(declare-fun lt!455042 () array!64788)

(declare-fun lt!455047 () array!64786)

(declare-fun Unit!33699 () Unit!33697)

(declare-fun Unit!33700 () Unit!33697)

(assert (=> b!1031065 (= lt!455045 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2829 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15625 Unit!33699 (LongMapFixedSize!5549 (defaultEntry!6148 thiss!1427) (mask!29938 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) (bvsub (_size!2829 thiss!1427) #b00000000000000000000000000000001) lt!455047 lt!455042 (bvadd #b00000000000000000000000000000001 (_vacant!2829 thiss!1427)))) (tuple2!15625 Unit!33700 (LongMapFixedSize!5549 (defaultEntry!6148 thiss!1427) (mask!29938 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) (bvsub (_size!2829 thiss!1427) #b00000000000000000000000000000001) lt!455047 lt!455042 (_vacant!2829 thiss!1427)))))))

(declare-fun -!498 (ListLongMap!13711 (_ BitVec 64)) ListLongMap!13711)

(assert (=> b!1031065 (= (-!498 (getCurrentListMap!3919 (_keys!11321 thiss!1427) (_values!6171 thiss!1427) (mask!29938 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6148 thiss!1427)) key!909) (getCurrentListMap!3919 lt!455047 lt!455042 (mask!29938 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6148 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9699 0))(
  ( (MissingZero!9699 (index!41167 (_ BitVec 32))) (Found!9699 (index!41168 (_ BitVec 32))) (Intermediate!9699 (undefined!10511 Bool) (index!41169 (_ BitVec 32)) (x!91793 (_ BitVec 32))) (Undefined!9699) (MissingVacant!9699 (index!41170 (_ BitVec 32))) )
))
(declare-fun lt!455043 () SeekEntryResult!9699)

(declare-fun dynLambda!1968 (Int (_ BitVec 64)) V!37355)

(assert (=> b!1031065 (= lt!455042 (array!64789 (store (arr!31196 (_values!6171 thiss!1427)) (index!41168 lt!455043) (ValueCellFull!11477 (dynLambda!1968 (defaultEntry!6148 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31713 (_values!6171 thiss!1427))))))

(declare-fun lt!455051 () Unit!33697)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!24 (array!64786 array!64788 (_ BitVec 32) (_ BitVec 32) V!37355 V!37355 (_ BitVec 32) (_ BitVec 64) Int) Unit!33697)

(assert (=> b!1031065 (= lt!455051 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!24 (_keys!11321 thiss!1427) (_values!6171 thiss!1427) (mask!29938 thiss!1427) (extraKeys!5880 thiss!1427) (zeroValue!5984 thiss!1427) (minValue!5984 thiss!1427) (index!41168 lt!455043) key!909 (defaultEntry!6148 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031065 (not (arrayContainsKey!0 lt!455047 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455046 () Unit!33697)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64786 (_ BitVec 32) (_ BitVec 64)) Unit!33697)

(assert (=> b!1031065 (= lt!455046 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11321 thiss!1427) (index!41168 lt!455043) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64786 (_ BitVec 32)) Bool)

(assert (=> b!1031065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455047 (mask!29938 thiss!1427))))

(declare-fun lt!455050 () Unit!33697)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64786 (_ BitVec 32) (_ BitVec 32)) Unit!33697)

(assert (=> b!1031065 (= lt!455050 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11321 thiss!1427) (index!41168 lt!455043) (mask!29938 thiss!1427)))))

(declare-datatypes ((List!21853 0))(
  ( (Nil!21850) (Cons!21849 (h!23051 (_ BitVec 64)) (t!30989 List!21853)) )
))
(declare-fun arrayNoDuplicates!0 (array!64786 (_ BitVec 32) List!21853) Bool)

(assert (=> b!1031065 (arrayNoDuplicates!0 lt!455047 #b00000000000000000000000000000000 Nil!21850)))

(declare-fun lt!455048 () Unit!33697)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64786 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21853) Unit!33697)

(assert (=> b!1031065 (= lt!455048 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11321 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41168 lt!455043) #b00000000000000000000000000000000 Nil!21850))))

(declare-fun arrayCountValidKeys!0 (array!64786 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031065 (= (arrayCountValidKeys!0 lt!455047 #b00000000000000000000000000000000 (size!31712 (_keys!11321 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11321 thiss!1427) #b00000000000000000000000000000000 (size!31712 (_keys!11321 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031065 (= lt!455047 (array!64787 (store (arr!31195 (_keys!11321 thiss!1427)) (index!41168 lt!455043) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31712 (_keys!11321 thiss!1427))))))

(declare-fun lt!455049 () Unit!33697)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64786 (_ BitVec 32) (_ BitVec 64)) Unit!33697)

(assert (=> b!1031065 (= lt!455049 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11321 thiss!1427) (index!41168 lt!455043) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031066 () Bool)

(assert (=> b!1031066 (= e!582305 true)))

(declare-fun lt!455044 () Bool)

(assert (=> b!1031066 (= lt!455044 (arrayNoDuplicates!0 (_keys!11321 (_2!7823 lt!455045)) #b00000000000000000000000000000000 Nil!21850))))

(declare-fun res!689422 () Bool)

(declare-fun e!582308 () Bool)

(assert (=> start!90034 (=> (not res!689422) (not e!582308))))

(declare-fun valid!2101 (LongMapFixedSize!5548) Bool)

(assert (=> start!90034 (= res!689422 (valid!2101 thiss!1427))))

(assert (=> start!90034 e!582308))

(assert (=> start!90034 e!582303))

(assert (=> start!90034 true))

(declare-fun b!1031067 () Bool)

(declare-fun res!689420 () Bool)

(assert (=> b!1031067 (=> res!689420 e!582305)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031067 (= res!689420 (not (validMask!0 (mask!29938 (_2!7823 lt!455045)))))))

(declare-fun b!1031068 () Bool)

(assert (=> b!1031068 (= e!582308 e!582306)))

(declare-fun res!689421 () Bool)

(assert (=> b!1031068 (=> (not res!689421) (not e!582306))))

(assert (=> b!1031068 (= res!689421 (is-Found!9699 lt!455043))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64786 (_ BitVec 32)) SeekEntryResult!9699)

(assert (=> b!1031068 (= lt!455043 (seekEntry!0 key!909 (_keys!11321 thiss!1427) (mask!29938 thiss!1427)))))

(declare-fun b!1031069 () Bool)

(declare-fun res!689426 () Bool)

(assert (=> b!1031069 (=> res!689426 e!582305)))

(assert (=> b!1031069 (= res!689426 (or (not (= (size!31713 (_values!6171 (_2!7823 lt!455045))) (bvadd #b00000000000000000000000000000001 (mask!29938 (_2!7823 lt!455045))))) (not (= (size!31712 (_keys!11321 (_2!7823 lt!455045))) (size!31713 (_values!6171 (_2!7823 lt!455045))))) (bvslt (mask!29938 (_2!7823 lt!455045)) #b00000000000000000000000000000000) (bvslt (extraKeys!5880 (_2!7823 lt!455045)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5880 (_2!7823 lt!455045)) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37995 () Bool)

(declare-fun mapRes!37995 () Bool)

(assert (=> mapIsEmpty!37995 mapRes!37995))

(declare-fun b!1031070 () Bool)

(assert (=> b!1031070 (= e!582309 (and e!582304 mapRes!37995))))

(declare-fun condMapEmpty!37995 () Bool)

(declare-fun mapDefault!37995 () ValueCell!11477)

