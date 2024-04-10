; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89502 () Bool)

(assert start!89502)

(declare-fun b!1026463 () Bool)

(declare-fun b_free!20501 () Bool)

(declare-fun b_next!20501 () Bool)

(assert (=> b!1026463 (= b_free!20501 (not b_next!20501))))

(declare-fun tp!72548 () Bool)

(declare-fun b_and!32747 () Bool)

(assert (=> b!1026463 (= tp!72548 b_and!32747)))

(declare-fun res!687121 () Bool)

(declare-fun e!579069 () Bool)

(assert (=> start!89502 (=> (not res!687121) (not e!579069))))

(declare-datatypes ((V!37167 0))(
  ( (V!37168 (val!12161 Int)) )
))
(declare-datatypes ((ValueCell!11407 0))(
  ( (ValueCellFull!11407 (v!14730 V!37167)) (EmptyCell!11407) )
))
(declare-datatypes ((array!64492 0))(
  ( (array!64493 (arr!31055 (Array (_ BitVec 32) (_ BitVec 64))) (size!31568 (_ BitVec 32))) )
))
(declare-datatypes ((array!64494 0))(
  ( (array!64495 (arr!31056 (Array (_ BitVec 32) ValueCell!11407)) (size!31569 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5408 0))(
  ( (LongMapFixedSize!5409 (defaultEntry!6056 Int) (mask!29750 (_ BitVec 32)) (extraKeys!5788 (_ BitVec 32)) (zeroValue!5892 V!37167) (minValue!5892 V!37167) (_size!2759 (_ BitVec 32)) (_keys!11203 array!64492) (_values!6079 array!64494) (_vacant!2759 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5408)

(declare-fun valid!2053 (LongMapFixedSize!5408) Bool)

(assert (=> start!89502 (= res!687121 (valid!2053 thiss!1427))))

(assert (=> start!89502 e!579069))

(declare-fun e!579070 () Bool)

(assert (=> start!89502 e!579070))

(assert (=> start!89502 true))

(declare-fun mapNonEmpty!37760 () Bool)

(declare-fun mapRes!37760 () Bool)

(declare-fun tp!72549 () Bool)

(declare-fun e!579068 () Bool)

(assert (=> mapNonEmpty!37760 (= mapRes!37760 (and tp!72549 e!579068))))

(declare-fun mapValue!37760 () ValueCell!11407)

(declare-fun mapKey!37760 () (_ BitVec 32))

(declare-fun mapRest!37760 () (Array (_ BitVec 32) ValueCell!11407))

(assert (=> mapNonEmpty!37760 (= (arr!31056 (_values!6079 thiss!1427)) (store mapRest!37760 mapKey!37760 mapValue!37760))))

(declare-fun b!1026461 () Bool)

(declare-fun e!579064 () Bool)

(declare-fun e!579066 () Bool)

(assert (=> b!1026461 (= e!579064 (not e!579066))))

(declare-fun res!687118 () Bool)

(assert (=> b!1026461 (=> res!687118 e!579066)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026461 (= res!687118 (not (validMask!0 (mask!29750 thiss!1427))))))

(declare-fun lt!451578 () array!64492)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026461 (not (arrayContainsKey!0 lt!451578 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33439 0))(
  ( (Unit!33440) )
))
(declare-fun lt!451572 () Unit!33439)

(declare-datatypes ((SeekEntryResult!9648 0))(
  ( (MissingZero!9648 (index!40963 (_ BitVec 32))) (Found!9648 (index!40964 (_ BitVec 32))) (Intermediate!9648 (undefined!10460 Bool) (index!40965 (_ BitVec 32)) (x!91310 (_ BitVec 32))) (Undefined!9648) (MissingVacant!9648 (index!40966 (_ BitVec 32))) )
))
(declare-fun lt!451575 () SeekEntryResult!9648)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64492 (_ BitVec 32) (_ BitVec 64)) Unit!33439)

(assert (=> b!1026461 (= lt!451572 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11203 thiss!1427) (index!40964 lt!451575) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64492 (_ BitVec 32)) Bool)

(assert (=> b!1026461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451578 (mask!29750 thiss!1427))))

(declare-fun lt!451577 () Unit!33439)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64492 (_ BitVec 32) (_ BitVec 32)) Unit!33439)

(assert (=> b!1026461 (= lt!451577 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11203 thiss!1427) (index!40964 lt!451575) (mask!29750 thiss!1427)))))

(declare-datatypes ((List!21781 0))(
  ( (Nil!21778) (Cons!21777 (h!22975 (_ BitVec 64)) (t!30843 List!21781)) )
))
(declare-fun arrayNoDuplicates!0 (array!64492 (_ BitVec 32) List!21781) Bool)

(assert (=> b!1026461 (arrayNoDuplicates!0 lt!451578 #b00000000000000000000000000000000 Nil!21778)))

(declare-fun lt!451573 () Unit!33439)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64492 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21781) Unit!33439)

(assert (=> b!1026461 (= lt!451573 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11203 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40964 lt!451575) #b00000000000000000000000000000000 Nil!21778))))

(declare-fun arrayCountValidKeys!0 (array!64492 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026461 (= (arrayCountValidKeys!0 lt!451578 #b00000000000000000000000000000000 (size!31568 (_keys!11203 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11203 thiss!1427) #b00000000000000000000000000000000 (size!31568 (_keys!11203 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026461 (= lt!451578 (array!64493 (store (arr!31055 (_keys!11203 thiss!1427)) (index!40964 lt!451575) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31568 (_keys!11203 thiss!1427))))))

(declare-fun lt!451576 () Unit!33439)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64492 (_ BitVec 32) (_ BitVec 64)) Unit!33439)

(assert (=> b!1026461 (= lt!451576 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11203 thiss!1427) (index!40964 lt!451575) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37760 () Bool)

(assert (=> mapIsEmpty!37760 mapRes!37760))

(declare-fun b!1026462 () Bool)

(assert (=> b!1026462 (= e!579066 true)))

(declare-fun lt!451574 () Bool)

(assert (=> b!1026462 (= lt!451574 (arrayNoDuplicates!0 (_keys!11203 thiss!1427) #b00000000000000000000000000000000 Nil!21778))))

(declare-fun tp_is_empty!24221 () Bool)

(declare-fun e!579067 () Bool)

(declare-fun array_inv!24045 (array!64492) Bool)

(declare-fun array_inv!24046 (array!64494) Bool)

(assert (=> b!1026463 (= e!579070 (and tp!72548 tp_is_empty!24221 (array_inv!24045 (_keys!11203 thiss!1427)) (array_inv!24046 (_values!6079 thiss!1427)) e!579067))))

(declare-fun b!1026464 () Bool)

(declare-fun res!687122 () Bool)

(assert (=> b!1026464 (=> (not res!687122) (not e!579069))))

(assert (=> b!1026464 (= res!687122 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026465 () Bool)

(assert (=> b!1026465 (= e!579068 tp_is_empty!24221)))

(declare-fun b!1026466 () Bool)

(declare-fun e!579065 () Bool)

(assert (=> b!1026466 (= e!579065 tp_is_empty!24221)))

(declare-fun b!1026467 () Bool)

(declare-fun res!687119 () Bool)

(assert (=> b!1026467 (=> res!687119 e!579066)))

(assert (=> b!1026467 (= res!687119 (or (not (= (size!31569 (_values!6079 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29750 thiss!1427)))) (not (= (size!31568 (_keys!11203 thiss!1427)) (size!31569 (_values!6079 thiss!1427)))) (bvslt (mask!29750 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5788 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5788 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026468 () Bool)

(assert (=> b!1026468 (= e!579069 e!579064)))

(declare-fun res!687120 () Bool)

(assert (=> b!1026468 (=> (not res!687120) (not e!579064))))

(assert (=> b!1026468 (= res!687120 (is-Found!9648 lt!451575))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64492 (_ BitVec 32)) SeekEntryResult!9648)

(assert (=> b!1026468 (= lt!451575 (seekEntry!0 key!909 (_keys!11203 thiss!1427) (mask!29750 thiss!1427)))))

(declare-fun b!1026469 () Bool)

(declare-fun res!687117 () Bool)

(assert (=> b!1026469 (=> res!687117 e!579066)))

(assert (=> b!1026469 (= res!687117 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11203 thiss!1427) (mask!29750 thiss!1427))))))

(declare-fun b!1026470 () Bool)

(assert (=> b!1026470 (= e!579067 (and e!579065 mapRes!37760))))

(declare-fun condMapEmpty!37760 () Bool)

(declare-fun mapDefault!37760 () ValueCell!11407)

