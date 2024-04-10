; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90058 () Bool)

(assert start!90058)

(declare-fun b!1031488 () Bool)

(declare-fun b_free!20665 () Bool)

(declare-fun b_next!20665 () Bool)

(assert (=> b!1031488 (= b_free!20665 (not b_next!20665))))

(declare-fun tp!73066 () Bool)

(declare-fun b_and!33097 () Bool)

(assert (=> b!1031488 (= tp!73066 b_and!33097)))

(declare-fun b!1031482 () Bool)

(declare-fun res!689673 () Bool)

(declare-fun e!582594 () Bool)

(assert (=> b!1031482 (=> res!689673 e!582594)))

(declare-datatypes ((V!37387 0))(
  ( (V!37388 (val!12243 Int)) )
))
(declare-datatypes ((ValueCell!11489 0))(
  ( (ValueCellFull!11489 (v!14820 V!37387)) (EmptyCell!11489) )
))
(declare-datatypes ((Unit!33733 0))(
  ( (Unit!33734) )
))
(declare-datatypes ((array!64834 0))(
  ( (array!64835 (arr!31219 (Array (_ BitVec 32) (_ BitVec 64))) (size!31736 (_ BitVec 32))) )
))
(declare-datatypes ((array!64836 0))(
  ( (array!64837 (arr!31220 (Array (_ BitVec 32) ValueCell!11489)) (size!31737 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5572 0))(
  ( (LongMapFixedSize!5573 (defaultEntry!6160 Int) (mask!29958 (_ BitVec 32)) (extraKeys!5892 (_ BitVec 32)) (zeroValue!5996 V!37387) (minValue!5996 V!37387) (_size!2841 (_ BitVec 32)) (_keys!11333 array!64834) (_values!6183 array!64836) (_vacant!2841 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15660 0))(
  ( (tuple2!15661 (_1!7841 Unit!33733) (_2!7841 LongMapFixedSize!5572)) )
))
(declare-fun lt!455403 () tuple2!15660)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64834 (_ BitVec 32)) Bool)

(assert (=> b!1031482 (= res!689673 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11333 (_2!7841 lt!455403)) (mask!29958 (_2!7841 lt!455403)))))))

(declare-fun b!1031483 () Bool)

(declare-fun e!582597 () Bool)

(declare-fun e!582593 () Bool)

(assert (=> b!1031483 (= e!582597 e!582593)))

(declare-fun res!689674 () Bool)

(assert (=> b!1031483 (=> (not res!689674) (not e!582593))))

(declare-datatypes ((SeekEntryResult!9708 0))(
  ( (MissingZero!9708 (index!41203 (_ BitVec 32))) (Found!9708 (index!41204 (_ BitVec 32))) (Intermediate!9708 (undefined!10520 Bool) (index!41205 (_ BitVec 32)) (x!91858 (_ BitVec 32))) (Undefined!9708) (MissingVacant!9708 (index!41206 (_ BitVec 32))) )
))
(declare-fun lt!455404 () SeekEntryResult!9708)

(assert (=> b!1031483 (= res!689674 (is-Found!9708 lt!455404))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun thiss!1427 () LongMapFixedSize!5572)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64834 (_ BitVec 32)) SeekEntryResult!9708)

(assert (=> b!1031483 (= lt!455404 (seekEntry!0 key!909 (_keys!11333 thiss!1427) (mask!29958 thiss!1427)))))

(declare-fun b!1031484 () Bool)

(declare-fun res!689677 () Bool)

(assert (=> b!1031484 (=> (not res!689677) (not e!582597))))

(assert (=> b!1031484 (= res!689677 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!38031 () Bool)

(declare-fun mapRes!38031 () Bool)

(assert (=> mapIsEmpty!38031 mapRes!38031))

(declare-fun b!1031485 () Bool)

(declare-fun e!582596 () Bool)

(declare-fun tp_is_empty!24385 () Bool)

(assert (=> b!1031485 (= e!582596 tp_is_empty!24385)))

(declare-fun b!1031486 () Bool)

(assert (=> b!1031486 (= e!582593 (not e!582594))))

(declare-fun res!689675 () Bool)

(assert (=> b!1031486 (=> res!689675 e!582594)))

(declare-datatypes ((tuple2!15662 0))(
  ( (tuple2!15663 (_1!7842 (_ BitVec 64)) (_2!7842 V!37387)) )
))
(declare-datatypes ((List!21867 0))(
  ( (Nil!21864) (Cons!21863 (h!23065 tuple2!15662) (t!31027 List!21867)) )
))
(declare-datatypes ((ListLongMap!13725 0))(
  ( (ListLongMap!13726 (toList!6878 List!21867)) )
))
(declare-fun contains!5992 (ListLongMap!13725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3926 (array!64834 array!64836 (_ BitVec 32) (_ BitVec 32) V!37387 V!37387 (_ BitVec 32) Int) ListLongMap!13725)

(assert (=> b!1031486 (= res!689675 (not (contains!5992 (getCurrentListMap!3926 (_keys!11333 (_2!7841 lt!455403)) (_values!6183 (_2!7841 lt!455403)) (mask!29958 (_2!7841 lt!455403)) (extraKeys!5892 (_2!7841 lt!455403)) (zeroValue!5996 (_2!7841 lt!455403)) (minValue!5996 (_2!7841 lt!455403)) #b00000000000000000000000000000000 (defaultEntry!6160 (_2!7841 lt!455403))) key!909)))))

(declare-fun lt!455402 () array!64836)

(declare-fun lt!455409 () array!64834)

(declare-fun Unit!33735 () Unit!33733)

(declare-fun Unit!33736 () Unit!33733)

(assert (=> b!1031486 (= lt!455403 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2841 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15661 Unit!33735 (LongMapFixedSize!5573 (defaultEntry!6160 thiss!1427) (mask!29958 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) (bvsub (_size!2841 thiss!1427) #b00000000000000000000000000000001) lt!455409 lt!455402 (bvadd #b00000000000000000000000000000001 (_vacant!2841 thiss!1427)))) (tuple2!15661 Unit!33736 (LongMapFixedSize!5573 (defaultEntry!6160 thiss!1427) (mask!29958 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) (bvsub (_size!2841 thiss!1427) #b00000000000000000000000000000001) lt!455409 lt!455402 (_vacant!2841 thiss!1427)))))))

(declare-fun -!505 (ListLongMap!13725 (_ BitVec 64)) ListLongMap!13725)

(assert (=> b!1031486 (= (-!505 (getCurrentListMap!3926 (_keys!11333 thiss!1427) (_values!6183 thiss!1427) (mask!29958 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6160 thiss!1427)) key!909) (getCurrentListMap!3926 lt!455409 lt!455402 (mask!29958 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6160 thiss!1427)))))

(declare-fun dynLambda!1975 (Int (_ BitVec 64)) V!37387)

(assert (=> b!1031486 (= lt!455402 (array!64837 (store (arr!31220 (_values!6183 thiss!1427)) (index!41204 lt!455404) (ValueCellFull!11489 (dynLambda!1975 (defaultEntry!6160 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31737 (_values!6183 thiss!1427))))))

(declare-fun lt!455406 () Unit!33733)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!31 (array!64834 array!64836 (_ BitVec 32) (_ BitVec 32) V!37387 V!37387 (_ BitVec 32) (_ BitVec 64) Int) Unit!33733)

(assert (=> b!1031486 (= lt!455406 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!31 (_keys!11333 thiss!1427) (_values!6183 thiss!1427) (mask!29958 thiss!1427) (extraKeys!5892 thiss!1427) (zeroValue!5996 thiss!1427) (minValue!5996 thiss!1427) (index!41204 lt!455404) key!909 (defaultEntry!6160 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031486 (not (arrayContainsKey!0 lt!455409 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455405 () Unit!33733)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64834 (_ BitVec 32) (_ BitVec 64)) Unit!33733)

(assert (=> b!1031486 (= lt!455405 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11333 thiss!1427) (index!41204 lt!455404) key!909))))

(assert (=> b!1031486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455409 (mask!29958 thiss!1427))))

(declare-fun lt!455411 () Unit!33733)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64834 (_ BitVec 32) (_ BitVec 32)) Unit!33733)

(assert (=> b!1031486 (= lt!455411 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11333 thiss!1427) (index!41204 lt!455404) (mask!29958 thiss!1427)))))

(declare-datatypes ((List!21868 0))(
  ( (Nil!21865) (Cons!21864 (h!23066 (_ BitVec 64)) (t!31028 List!21868)) )
))
(declare-fun arrayNoDuplicates!0 (array!64834 (_ BitVec 32) List!21868) Bool)

(assert (=> b!1031486 (arrayNoDuplicates!0 lt!455409 #b00000000000000000000000000000000 Nil!21865)))

(declare-fun lt!455408 () Unit!33733)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64834 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21868) Unit!33733)

(assert (=> b!1031486 (= lt!455408 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11333 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41204 lt!455404) #b00000000000000000000000000000000 Nil!21865))))

(declare-fun arrayCountValidKeys!0 (array!64834 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031486 (= (arrayCountValidKeys!0 lt!455409 #b00000000000000000000000000000000 (size!31736 (_keys!11333 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11333 thiss!1427) #b00000000000000000000000000000000 (size!31736 (_keys!11333 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031486 (= lt!455409 (array!64835 (store (arr!31219 (_keys!11333 thiss!1427)) (index!41204 lt!455404) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31736 (_keys!11333 thiss!1427))))))

(declare-fun lt!455410 () Unit!33733)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64834 (_ BitVec 32) (_ BitVec 64)) Unit!33733)

(assert (=> b!1031486 (= lt!455410 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11333 thiss!1427) (index!41204 lt!455404) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!38031 () Bool)

(declare-fun tp!73065 () Bool)

(assert (=> mapNonEmpty!38031 (= mapRes!38031 (and tp!73065 e!582596))))

(declare-fun mapKey!38031 () (_ BitVec 32))

(declare-fun mapValue!38031 () ValueCell!11489)

(declare-fun mapRest!38031 () (Array (_ BitVec 32) ValueCell!11489))

(assert (=> mapNonEmpty!38031 (= (arr!31220 (_values!6183 thiss!1427)) (store mapRest!38031 mapKey!38031 mapValue!38031))))

(declare-fun res!689676 () Bool)

(assert (=> start!90058 (=> (not res!689676) (not e!582597))))

(declare-fun valid!2109 (LongMapFixedSize!5572) Bool)

(assert (=> start!90058 (= res!689676 (valid!2109 thiss!1427))))

(assert (=> start!90058 e!582597))

(declare-fun e!582591 () Bool)

(assert (=> start!90058 e!582591))

(assert (=> start!90058 true))

(declare-fun b!1031487 () Bool)

(assert (=> b!1031487 (= e!582594 true)))

(declare-fun lt!455407 () Bool)

(assert (=> b!1031487 (= lt!455407 (arrayNoDuplicates!0 (_keys!11333 (_2!7841 lt!455403)) #b00000000000000000000000000000000 Nil!21865))))

(declare-fun e!582590 () Bool)

(declare-fun array_inv!24165 (array!64834) Bool)

(declare-fun array_inv!24166 (array!64836) Bool)

(assert (=> b!1031488 (= e!582591 (and tp!73066 tp_is_empty!24385 (array_inv!24165 (_keys!11333 thiss!1427)) (array_inv!24166 (_values!6183 thiss!1427)) e!582590))))

(declare-fun b!1031489 () Bool)

(declare-fun res!689678 () Bool)

(assert (=> b!1031489 (=> res!689678 e!582594)))

(assert (=> b!1031489 (= res!689678 (or (not (= (size!31737 (_values!6183 (_2!7841 lt!455403))) (bvadd #b00000000000000000000000000000001 (mask!29958 (_2!7841 lt!455403))))) (not (= (size!31736 (_keys!11333 (_2!7841 lt!455403))) (size!31737 (_values!6183 (_2!7841 lt!455403))))) (bvslt (mask!29958 (_2!7841 lt!455403)) #b00000000000000000000000000000000) (bvslt (extraKeys!5892 (_2!7841 lt!455403)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5892 (_2!7841 lt!455403)) #b00000000000000000000000000000011)))))

(declare-fun b!1031490 () Bool)

(declare-fun res!689672 () Bool)

(assert (=> b!1031490 (=> res!689672 e!582594)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031490 (= res!689672 (not (validMask!0 (mask!29958 (_2!7841 lt!455403)))))))

(declare-fun b!1031491 () Bool)

(declare-fun e!582595 () Bool)

(assert (=> b!1031491 (= e!582595 tp_is_empty!24385)))

(declare-fun b!1031492 () Bool)

(assert (=> b!1031492 (= e!582590 (and e!582595 mapRes!38031))))

(declare-fun condMapEmpty!38031 () Bool)

(declare-fun mapDefault!38031 () ValueCell!11489)

