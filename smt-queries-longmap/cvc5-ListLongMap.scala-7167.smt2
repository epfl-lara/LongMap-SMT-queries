; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91484 () Bool)

(assert start!91484)

(declare-fun b!1042242 () Bool)

(declare-fun b_free!21055 () Bool)

(declare-fun b_next!21055 () Bool)

(assert (=> b!1042242 (= b_free!21055 (not b_next!21055))))

(declare-fun tp!74387 () Bool)

(declare-fun b_and!33587 () Bool)

(assert (=> b!1042242 (= tp!74387 b_and!33587)))

(declare-fun b!1042241 () Bool)

(declare-fun e!590358 () Bool)

(declare-fun e!590360 () Bool)

(assert (=> b!1042241 (= e!590358 (not e!590360))))

(declare-fun res!694493 () Bool)

(assert (=> b!1042241 (=> res!694493 e!590360)))

(declare-datatypes ((V!37907 0))(
  ( (V!37908 (val!12438 Int)) )
))
(declare-datatypes ((ValueCell!11684 0))(
  ( (ValueCellFull!11684 (v!15029 V!37907)) (EmptyCell!11684) )
))
(declare-datatypes ((array!65702 0))(
  ( (array!65703 (arr!31609 (Array (_ BitVec 32) (_ BitVec 64))) (size!32144 (_ BitVec 32))) )
))
(declare-datatypes ((array!65704 0))(
  ( (array!65705 (arr!31610 (Array (_ BitVec 32) ValueCell!11684)) (size!32145 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5962 0))(
  ( (LongMapFixedSize!5963 (defaultEntry!6363 Int) (mask!30420 (_ BitVec 32)) (extraKeys!6091 (_ BitVec 32)) (zeroValue!6197 V!37907) (minValue!6197 V!37907) (_size!3036 (_ BitVec 32)) (_keys!11611 array!65702) (_values!6386 array!65704) (_vacant!3036 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5962)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1042241 (= res!694493 (not (validMask!0 (mask!30420 thiss!1427))))))

(declare-fun lt!459372 () array!65702)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!65702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1042241 (not (arrayContainsKey!0 lt!459372 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34041 0))(
  ( (Unit!34042) )
))
(declare-fun lt!459376 () Unit!34041)

(declare-datatypes ((SeekEntryResult!9813 0))(
  ( (MissingZero!9813 (index!41623 (_ BitVec 32))) (Found!9813 (index!41624 (_ BitVec 32))) (Intermediate!9813 (undefined!10625 Bool) (index!41625 (_ BitVec 32)) (x!93049 (_ BitVec 32))) (Undefined!9813) (MissingVacant!9813 (index!41626 (_ BitVec 32))) )
))
(declare-fun lt!459375 () SeekEntryResult!9813)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!65702 (_ BitVec 32) (_ BitVec 64)) Unit!34041)

(assert (=> b!1042241 (= lt!459376 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11611 thiss!1427) (index!41624 lt!459375) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65702 (_ BitVec 32)) Bool)

(assert (=> b!1042241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!459372 (mask!30420 thiss!1427))))

(declare-fun lt!459377 () Unit!34041)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!65702 (_ BitVec 32) (_ BitVec 32)) Unit!34041)

(assert (=> b!1042241 (= lt!459377 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11611 thiss!1427) (index!41624 lt!459375) (mask!30420 thiss!1427)))))

(declare-datatypes ((List!21972 0))(
  ( (Nil!21969) (Cons!21968 (h!23176 (_ BitVec 64)) (t!31186 List!21972)) )
))
(declare-fun arrayNoDuplicates!0 (array!65702 (_ BitVec 32) List!21972) Bool)

(assert (=> b!1042241 (arrayNoDuplicates!0 lt!459372 #b00000000000000000000000000000000 Nil!21969)))

(declare-fun lt!459373 () Unit!34041)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!65702 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21972) Unit!34041)

(assert (=> b!1042241 (= lt!459373 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11611 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41624 lt!459375) #b00000000000000000000000000000000 Nil!21969))))

(declare-fun arrayCountValidKeys!0 (array!65702 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1042241 (= (arrayCountValidKeys!0 lt!459372 #b00000000000000000000000000000000 (size!32144 (_keys!11611 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11611 thiss!1427) #b00000000000000000000000000000000 (size!32144 (_keys!11611 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1042241 (= lt!459372 (array!65703 (store (arr!31609 (_keys!11611 thiss!1427)) (index!41624 lt!459375) #b1000000000000000000000000000000000000000000000000000000000000000) (size!32144 (_keys!11611 thiss!1427))))))

(declare-fun lt!459374 () Unit!34041)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!65702 (_ BitVec 32) (_ BitVec 64)) Unit!34041)

(assert (=> b!1042241 (= lt!459374 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11611 thiss!1427) (index!41624 lt!459375) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!590359 () Bool)

(declare-fun e!590362 () Bool)

(declare-fun tp_is_empty!24775 () Bool)

(declare-fun array_inv!24423 (array!65702) Bool)

(declare-fun array_inv!24424 (array!65704) Bool)

(assert (=> b!1042242 (= e!590359 (and tp!74387 tp_is_empty!24775 (array_inv!24423 (_keys!11611 thiss!1427)) (array_inv!24424 (_values!6386 thiss!1427)) e!590362))))

(declare-fun mapIsEmpty!38768 () Bool)

(declare-fun mapRes!38768 () Bool)

(assert (=> mapIsEmpty!38768 mapRes!38768))

(declare-fun mapNonEmpty!38768 () Bool)

(declare-fun tp!74388 () Bool)

(declare-fun e!590361 () Bool)

(assert (=> mapNonEmpty!38768 (= mapRes!38768 (and tp!74388 e!590361))))

(declare-fun mapValue!38768 () ValueCell!11684)

(declare-fun mapRest!38768 () (Array (_ BitVec 32) ValueCell!11684))

(declare-fun mapKey!38768 () (_ BitVec 32))

(assert (=> mapNonEmpty!38768 (= (arr!31610 (_values!6386 thiss!1427)) (store mapRest!38768 mapKey!38768 mapValue!38768))))

(declare-fun b!1042243 () Bool)

(assert (=> b!1042243 (= e!590361 tp_is_empty!24775)))

(declare-fun res!694490 () Bool)

(declare-fun e!590357 () Bool)

(assert (=> start!91484 (=> (not res!694490) (not e!590357))))

(declare-fun valid!2240 (LongMapFixedSize!5962) Bool)

(assert (=> start!91484 (= res!694490 (valid!2240 thiss!1427))))

(assert (=> start!91484 e!590357))

(assert (=> start!91484 e!590359))

(assert (=> start!91484 true))

(declare-fun b!1042244 () Bool)

(assert (=> b!1042244 (= e!590357 e!590358)))

(declare-fun res!694489 () Bool)

(assert (=> b!1042244 (=> (not res!694489) (not e!590358))))

(assert (=> b!1042244 (= res!694489 (is-Found!9813 lt!459375))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!65702 (_ BitVec 32)) SeekEntryResult!9813)

(assert (=> b!1042244 (= lt!459375 (seekEntry!0 key!909 (_keys!11611 thiss!1427) (mask!30420 thiss!1427)))))

(declare-fun b!1042245 () Bool)

(declare-fun e!590356 () Bool)

(assert (=> b!1042245 (= e!590362 (and e!590356 mapRes!38768))))

(declare-fun condMapEmpty!38768 () Bool)

(declare-fun mapDefault!38768 () ValueCell!11684)

