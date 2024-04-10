; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89544 () Bool)

(assert start!89544)

(declare-fun b!1027100 () Bool)

(declare-fun b_free!20543 () Bool)

(declare-fun b_next!20543 () Bool)

(assert (=> b!1027100 (= b_free!20543 (not b_next!20543))))

(declare-fun tp!72675 () Bool)

(declare-fun b_and!32789 () Bool)

(assert (=> b!1027100 (= tp!72675 b_and!32789)))

(declare-fun b!1027091 () Bool)

(declare-fun res!687496 () Bool)

(declare-fun e!579572 () Bool)

(assert (=> b!1027091 (=> res!687496 e!579572)))

(declare-datatypes ((V!37223 0))(
  ( (V!37224 (val!12182 Int)) )
))
(declare-datatypes ((ValueCell!11428 0))(
  ( (ValueCellFull!11428 (v!14751 V!37223)) (EmptyCell!11428) )
))
(declare-datatypes ((array!64576 0))(
  ( (array!64577 (arr!31097 (Array (_ BitVec 32) (_ BitVec 64))) (size!31610 (_ BitVec 32))) )
))
(declare-datatypes ((array!64578 0))(
  ( (array!64579 (arr!31098 (Array (_ BitVec 32) ValueCell!11428)) (size!31611 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5450 0))(
  ( (LongMapFixedSize!5451 (defaultEntry!6077 Int) (mask!29785 (_ BitVec 32)) (extraKeys!5809 (_ BitVec 32)) (zeroValue!5913 V!37223) (minValue!5913 V!37223) (_size!2780 (_ BitVec 32)) (_keys!11224 array!64576) (_values!6100 array!64578) (_vacant!2780 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5450)

(assert (=> b!1027091 (= res!687496 (or (not (= (size!31611 (_values!6100 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29785 thiss!1427)))) (not (= (size!31610 (_keys!11224 thiss!1427)) (size!31611 (_values!6100 thiss!1427)))) (bvslt (mask!29785 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5809 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5809 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027092 () Bool)

(declare-fun e!579567 () Bool)

(declare-fun e!579573 () Bool)

(assert (=> b!1027092 (= e!579567 e!579573)))

(declare-fun res!687500 () Bool)

(assert (=> b!1027092 (=> (not res!687500) (not e!579573))))

(declare-datatypes ((SeekEntryResult!9664 0))(
  ( (MissingZero!9664 (index!41027 (_ BitVec 32))) (Found!9664 (index!41028 (_ BitVec 32))) (Intermediate!9664 (undefined!10476 Bool) (index!41029 (_ BitVec 32)) (x!91382 (_ BitVec 32))) (Undefined!9664) (MissingVacant!9664 (index!41030 (_ BitVec 32))) )
))
(declare-fun lt!452015 () SeekEntryResult!9664)

(assert (=> b!1027092 (= res!687500 (is-Found!9664 lt!452015))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64576 (_ BitVec 32)) SeekEntryResult!9664)

(assert (=> b!1027092 (= lt!452015 (seekEntry!0 key!909 (_keys!11224 thiss!1427) (mask!29785 thiss!1427)))))

(declare-fun mapNonEmpty!37823 () Bool)

(declare-fun mapRes!37823 () Bool)

(declare-fun tp!72674 () Bool)

(declare-fun e!579568 () Bool)

(assert (=> mapNonEmpty!37823 (= mapRes!37823 (and tp!72674 e!579568))))

(declare-fun mapKey!37823 () (_ BitVec 32))

(declare-fun mapValue!37823 () ValueCell!11428)

(declare-fun mapRest!37823 () (Array (_ BitVec 32) ValueCell!11428))

(assert (=> mapNonEmpty!37823 (= (arr!31098 (_values!6100 thiss!1427)) (store mapRest!37823 mapKey!37823 mapValue!37823))))

(declare-fun mapIsEmpty!37823 () Bool)

(assert (=> mapIsEmpty!37823 mapRes!37823))

(declare-fun b!1027093 () Bool)

(declare-fun res!687495 () Bool)

(assert (=> b!1027093 (=> (not res!687495) (not e!579567))))

(assert (=> b!1027093 (= res!687495 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027094 () Bool)

(assert (=> b!1027094 (= e!579572 true)))

(declare-fun lt!452017 () Bool)

(declare-datatypes ((List!21797 0))(
  ( (Nil!21794) (Cons!21793 (h!22991 (_ BitVec 64)) (t!30859 List!21797)) )
))
(declare-fun arrayNoDuplicates!0 (array!64576 (_ BitVec 32) List!21797) Bool)

(assert (=> b!1027094 (= lt!452017 (arrayNoDuplicates!0 (_keys!11224 thiss!1427) #b00000000000000000000000000000000 Nil!21794))))

(declare-fun b!1027095 () Bool)

(declare-fun e!579574 () Bool)

(declare-fun tp_is_empty!24263 () Bool)

(assert (=> b!1027095 (= e!579574 tp_is_empty!24263)))

(declare-fun b!1027096 () Bool)

(declare-fun res!687498 () Bool)

(assert (=> b!1027096 (=> res!687498 e!579572)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64576 (_ BitVec 32)) Bool)

(assert (=> b!1027096 (= res!687498 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11224 thiss!1427) (mask!29785 thiss!1427))))))

(declare-fun b!1027097 () Bool)

(assert (=> b!1027097 (= e!579573 (not e!579572))))

(declare-fun res!687497 () Bool)

(assert (=> b!1027097 (=> res!687497 e!579572)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027097 (= res!687497 (not (validMask!0 (mask!29785 thiss!1427))))))

(declare-fun lt!452018 () array!64576)

(declare-fun arrayContainsKey!0 (array!64576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027097 (not (arrayContainsKey!0 lt!452018 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33469 0))(
  ( (Unit!33470) )
))
(declare-fun lt!452014 () Unit!33469)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64576 (_ BitVec 32) (_ BitVec 64)) Unit!33469)

(assert (=> b!1027097 (= lt!452014 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11224 thiss!1427) (index!41028 lt!452015) key!909))))

(assert (=> b!1027097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452018 (mask!29785 thiss!1427))))

(declare-fun lt!452019 () Unit!33469)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64576 (_ BitVec 32) (_ BitVec 32)) Unit!33469)

(assert (=> b!1027097 (= lt!452019 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11224 thiss!1427) (index!41028 lt!452015) (mask!29785 thiss!1427)))))

(assert (=> b!1027097 (arrayNoDuplicates!0 lt!452018 #b00000000000000000000000000000000 Nil!21794)))

(declare-fun lt!452013 () Unit!33469)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64576 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21797) Unit!33469)

(assert (=> b!1027097 (= lt!452013 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11224 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41028 lt!452015) #b00000000000000000000000000000000 Nil!21794))))

(declare-fun arrayCountValidKeys!0 (array!64576 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027097 (= (arrayCountValidKeys!0 lt!452018 #b00000000000000000000000000000000 (size!31610 (_keys!11224 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11224 thiss!1427) #b00000000000000000000000000000000 (size!31610 (_keys!11224 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027097 (= lt!452018 (array!64577 (store (arr!31097 (_keys!11224 thiss!1427)) (index!41028 lt!452015) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31610 (_keys!11224 thiss!1427))))))

(declare-fun lt!452016 () Unit!33469)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64576 (_ BitVec 32) (_ BitVec 64)) Unit!33469)

(assert (=> b!1027097 (= lt!452016 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11224 thiss!1427) (index!41028 lt!452015) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027098 () Bool)

(declare-fun e!579570 () Bool)

(assert (=> b!1027098 (= e!579570 (and e!579574 mapRes!37823))))

(declare-fun condMapEmpty!37823 () Bool)

(declare-fun mapDefault!37823 () ValueCell!11428)

