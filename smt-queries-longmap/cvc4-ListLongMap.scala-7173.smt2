; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91658 () Bool)

(assert start!91658)

(declare-fun b!1043454 () Bool)

(declare-fun b_free!21095 () Bool)

(declare-fun b_next!21095 () Bool)

(assert (=> b!1043454 (= b_free!21095 (not b_next!21095))))

(declare-fun tp!74522 () Bool)

(declare-fun b_and!33627 () Bool)

(assert (=> b!1043454 (= tp!74522 b_and!33627)))

(declare-fun b!1043453 () Bool)

(declare-fun e!591213 () Bool)

(declare-fun e!591211 () Bool)

(assert (=> b!1043453 (= e!591213 (not e!591211))))

(declare-fun res!695176 () Bool)

(assert (=> b!1043453 (=> res!695176 e!591211)))

(declare-datatypes ((V!37959 0))(
  ( (V!37960 (val!12458 Int)) )
))
(declare-datatypes ((ValueCell!11704 0))(
  ( (ValueCellFull!11704 (v!15049 V!37959)) (EmptyCell!11704) )
))
(declare-datatypes ((array!65792 0))(
  ( (array!65793 (arr!31649 (Array (_ BitVec 32) (_ BitVec 64))) (size!32184 (_ BitVec 32))) )
))
(declare-datatypes ((array!65794 0))(
  ( (array!65795 (arr!31650 (Array (_ BitVec 32) ValueCell!11704)) (size!32185 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6002 0))(
  ( (LongMapFixedSize!6003 (defaultEntry!6383 Int) (mask!30472 (_ BitVec 32)) (extraKeys!6111 (_ BitVec 32)) (zeroValue!6217 V!37959) (minValue!6217 V!37959) (_size!3056 (_ BitVec 32)) (_keys!11641 array!65792) (_values!6406 array!65794) (_vacant!3056 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!6002)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1043453 (= res!695176 (not (validMask!0 (mask!30472 thiss!1427))))))

(declare-fun lt!459952 () array!65792)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1043453 (not (arrayContainsKey!0 lt!459952 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9830 0))(
  ( (MissingZero!9830 (index!41691 (_ BitVec 32))) (Found!9830 (index!41692 (_ BitVec 32))) (Intermediate!9830 (undefined!10642 Bool) (index!41693 (_ BitVec 32)) (x!93154 (_ BitVec 32))) (Undefined!9830) (MissingVacant!9830 (index!41694 (_ BitVec 32))) )
))
(declare-fun lt!459951 () SeekEntryResult!9830)

(declare-datatypes ((Unit!34067 0))(
  ( (Unit!34068) )
))
(declare-fun lt!459950 () Unit!34067)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65792 (_ BitVec 32) (_ BitVec 64)) Unit!34067)

(assert (=> b!1043453 (= lt!459950 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11641 thiss!1427) (index!41692 lt!459951) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65792 (_ BitVec 32)) Bool)

(assert (=> b!1043453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459952 (mask!30472 thiss!1427))))

(declare-fun lt!459954 () Unit!34067)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65792 (_ BitVec 32) (_ BitVec 32)) Unit!34067)

(assert (=> b!1043453 (= lt!459954 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11641 thiss!1427) (index!41692 lt!459951) (mask!30472 thiss!1427)))))

(declare-datatypes ((List!21987 0))(
  ( (Nil!21984) (Cons!21983 (h!23191 (_ BitVec 64)) (t!31201 List!21987)) )
))
(declare-fun arrayNoDuplicates!0 (array!65792 (_ BitVec 32) List!21987) Bool)

(assert (=> b!1043453 (arrayNoDuplicates!0 lt!459952 #b00000000000000000000000000000000 Nil!21984)))

(declare-fun lt!459949 () Unit!34067)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65792 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21987) Unit!34067)

(assert (=> b!1043453 (= lt!459949 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11641 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41692 lt!459951) #b00000000000000000000000000000000 Nil!21984))))

(declare-fun arrayCountValidKeys!0 (array!65792 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1043453 (= (arrayCountValidKeys!0 lt!459952 #b00000000000000000000000000000000 (size!32184 (_keys!11641 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11641 thiss!1427) #b00000000000000000000000000000000 (size!32184 (_keys!11641 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1043453 (= lt!459952 (array!65793 (store (arr!31649 (_keys!11641 thiss!1427)) (index!41692 lt!459951) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32184 (_keys!11641 thiss!1427))))))

(declare-fun lt!459955 () Unit!34067)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65792 (_ BitVec 32) (_ BitVec 64)) Unit!34067)

(assert (=> b!1043453 (= lt!459955 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11641 thiss!1427) (index!41692 lt!459951) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!591209 () Bool)

(declare-fun e!591207 () Bool)

(declare-fun tp_is_empty!24815 () Bool)

(declare-fun array_inv!24451 (array!65792) Bool)

(declare-fun array_inv!24452 (array!65794) Bool)

(assert (=> b!1043454 (= e!591209 (and tp!74522 tp_is_empty!24815 (array_inv!24451 (_keys!11641 thiss!1427)) (array_inv!24452 (_values!6406 thiss!1427)) e!591207))))

(declare-fun b!1043455 () Bool)

(declare-fun e!591210 () Bool)

(assert (=> b!1043455 (= e!591210 tp_is_empty!24815)))

(declare-fun b!1043456 () Bool)

(declare-fun e!591206 () Bool)

(assert (=> b!1043456 (= e!591206 e!591213)))

(declare-fun res!695175 () Bool)

(assert (=> b!1043456 (=> (not res!695175) (not e!591213))))

(assert (=> b!1043456 (= res!695175 (is-Found!9830 lt!459951))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65792 (_ BitVec 32)) SeekEntryResult!9830)

(assert (=> b!1043456 (= lt!459951 (seekEntry!0 key!909 (_keys!11641 thiss!1427) (mask!30472 thiss!1427)))))

(declare-fun b!1043457 () Bool)

(declare-fun mapRes!38843 () Bool)

(assert (=> b!1043457 (= e!591207 (and e!591210 mapRes!38843))))

(declare-fun condMapEmpty!38843 () Bool)

(declare-fun mapDefault!38843 () ValueCell!11704)

