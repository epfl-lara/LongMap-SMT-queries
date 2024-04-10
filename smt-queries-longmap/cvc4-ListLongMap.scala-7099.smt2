; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90044 () Bool)

(assert start!90044)

(declare-fun b!1031245 () Bool)

(declare-fun b_free!20651 () Bool)

(declare-fun b_next!20651 () Bool)

(assert (=> b!1031245 (= b_free!20651 (not b_next!20651))))

(declare-fun tp!73023 () Bool)

(declare-fun b_and!33069 () Bool)

(assert (=> b!1031245 (= tp!73023 b_and!33069)))

(declare-fun b!1031237 () Bool)

(declare-fun e!582429 () Bool)

(declare-fun tp_is_empty!24371 () Bool)

(assert (=> b!1031237 (= e!582429 tp_is_empty!24371)))

(declare-fun res!689525 () Bool)

(declare-fun e!582424 () Bool)

(assert (=> start!90044 (=> (not res!689525) (not e!582424))))

(declare-datatypes ((V!37367 0))(
  ( (V!37368 (val!12236 Int)) )
))
(declare-datatypes ((ValueCell!11482 0))(
  ( (ValueCellFull!11482 (v!14813 V!37367)) (EmptyCell!11482) )
))
(declare-datatypes ((array!64806 0))(
  ( (array!64807 (arr!31205 (Array (_ BitVec 32) (_ BitVec 64))) (size!31722 (_ BitVec 32))) )
))
(declare-datatypes ((array!64808 0))(
  ( (array!64809 (arr!31206 (Array (_ BitVec 32) ValueCell!11482)) (size!31723 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5558 0))(
  ( (LongMapFixedSize!5559 (defaultEntry!6153 Int) (mask!29945 (_ BitVec 32)) (extraKeys!5885 (_ BitVec 32)) (zeroValue!5989 V!37367) (minValue!5989 V!37367) (_size!2834 (_ BitVec 32)) (_keys!11326 array!64806) (_values!6176 array!64808) (_vacant!2834 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5558)

(declare-fun valid!2105 (LongMapFixedSize!5558) Bool)

(assert (=> start!90044 (= res!689525 (valid!2105 thiss!1427))))

(assert (=> start!90044 e!582424))

(declare-fun e!582422 () Bool)

(assert (=> start!90044 e!582422))

(assert (=> start!90044 true))

(declare-fun b!1031238 () Bool)

(declare-fun e!582423 () Bool)

(declare-fun e!582428 () Bool)

(assert (=> b!1031238 (= e!582423 (not e!582428))))

(declare-fun res!689526 () Bool)

(assert (=> b!1031238 (=> res!689526 e!582428)))

(declare-datatypes ((Unit!33713 0))(
  ( (Unit!33714) )
))
(declare-datatypes ((tuple2!15640 0))(
  ( (tuple2!15641 (_1!7831 Unit!33713) (_2!7831 LongMapFixedSize!5558)) )
))
(declare-fun lt!455195 () tuple2!15640)

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15642 0))(
  ( (tuple2!15643 (_1!7832 (_ BitVec 64)) (_2!7832 V!37367)) )
))
(declare-datatypes ((List!21859 0))(
  ( (Nil!21856) (Cons!21855 (h!23057 tuple2!15642) (t!31005 List!21859)) )
))
(declare-datatypes ((ListLongMap!13717 0))(
  ( (ListLongMap!13718 (toList!6874 List!21859)) )
))
(declare-fun contains!5988 (ListLongMap!13717 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3922 (array!64806 array!64808 (_ BitVec 32) (_ BitVec 32) V!37367 V!37367 (_ BitVec 32) Int) ListLongMap!13717)

(assert (=> b!1031238 (= res!689526 (not (contains!5988 (getCurrentListMap!3922 (_keys!11326 (_2!7831 lt!455195)) (_values!6176 (_2!7831 lt!455195)) (mask!29945 (_2!7831 lt!455195)) (extraKeys!5885 (_2!7831 lt!455195)) (zeroValue!5989 (_2!7831 lt!455195)) (minValue!5989 (_2!7831 lt!455195)) #b00000000000000000000000000000000 (defaultEntry!6153 (_2!7831 lt!455195))) key!909)))))

(declare-fun lt!455196 () array!64806)

(declare-fun lt!455197 () array!64808)

(declare-fun Unit!33715 () Unit!33713)

(declare-fun Unit!33716 () Unit!33713)

(assert (=> b!1031238 (= lt!455195 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2834 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15641 Unit!33715 (LongMapFixedSize!5559 (defaultEntry!6153 thiss!1427) (mask!29945 thiss!1427) (extraKeys!5885 thiss!1427) (zeroValue!5989 thiss!1427) (minValue!5989 thiss!1427) (bvsub (_size!2834 thiss!1427) #b00000000000000000000000000000001) lt!455196 lt!455197 (bvadd #b00000000000000000000000000000001 (_vacant!2834 thiss!1427)))) (tuple2!15641 Unit!33716 (LongMapFixedSize!5559 (defaultEntry!6153 thiss!1427) (mask!29945 thiss!1427) (extraKeys!5885 thiss!1427) (zeroValue!5989 thiss!1427) (minValue!5989 thiss!1427) (bvsub (_size!2834 thiss!1427) #b00000000000000000000000000000001) lt!455196 lt!455197 (_vacant!2834 thiss!1427)))))))

(declare-fun -!501 (ListLongMap!13717 (_ BitVec 64)) ListLongMap!13717)

(assert (=> b!1031238 (= (-!501 (getCurrentListMap!3922 (_keys!11326 thiss!1427) (_values!6176 thiss!1427) (mask!29945 thiss!1427) (extraKeys!5885 thiss!1427) (zeroValue!5989 thiss!1427) (minValue!5989 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6153 thiss!1427)) key!909) (getCurrentListMap!3922 lt!455196 lt!455197 (mask!29945 thiss!1427) (extraKeys!5885 thiss!1427) (zeroValue!5989 thiss!1427) (minValue!5989 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6153 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9702 0))(
  ( (MissingZero!9702 (index!41179 (_ BitVec 32))) (Found!9702 (index!41180 (_ BitVec 32))) (Intermediate!9702 (undefined!10514 Bool) (index!41181 (_ BitVec 32)) (x!91814 (_ BitVec 32))) (Undefined!9702) (MissingVacant!9702 (index!41182 (_ BitVec 32))) )
))
(declare-fun lt!455194 () SeekEntryResult!9702)

(declare-fun dynLambda!1971 (Int (_ BitVec 64)) V!37367)

(assert (=> b!1031238 (= lt!455197 (array!64809 (store (arr!31206 (_values!6176 thiss!1427)) (index!41180 lt!455194) (ValueCellFull!11482 (dynLambda!1971 (defaultEntry!6153 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31723 (_values!6176 thiss!1427))))))

(declare-fun lt!455198 () Unit!33713)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!27 (array!64806 array!64808 (_ BitVec 32) (_ BitVec 32) V!37367 V!37367 (_ BitVec 32) (_ BitVec 64) Int) Unit!33713)

(assert (=> b!1031238 (= lt!455198 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!27 (_keys!11326 thiss!1427) (_values!6176 thiss!1427) (mask!29945 thiss!1427) (extraKeys!5885 thiss!1427) (zeroValue!5989 thiss!1427) (minValue!5989 thiss!1427) (index!41180 lt!455194) key!909 (defaultEntry!6153 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031238 (not (arrayContainsKey!0 lt!455196 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455201 () Unit!33713)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64806 (_ BitVec 32) (_ BitVec 64)) Unit!33713)

(assert (=> b!1031238 (= lt!455201 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11326 thiss!1427) (index!41180 lt!455194) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64806 (_ BitVec 32)) Bool)

(assert (=> b!1031238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455196 (mask!29945 thiss!1427))))

(declare-fun lt!455200 () Unit!33713)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64806 (_ BitVec 32) (_ BitVec 32)) Unit!33713)

(assert (=> b!1031238 (= lt!455200 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11326 thiss!1427) (index!41180 lt!455194) (mask!29945 thiss!1427)))))

(declare-datatypes ((List!21860 0))(
  ( (Nil!21857) (Cons!21856 (h!23058 (_ BitVec 64)) (t!31006 List!21860)) )
))
(declare-fun arrayNoDuplicates!0 (array!64806 (_ BitVec 32) List!21860) Bool)

(assert (=> b!1031238 (arrayNoDuplicates!0 lt!455196 #b00000000000000000000000000000000 Nil!21857)))

(declare-fun lt!455199 () Unit!33713)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64806 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21860) Unit!33713)

(assert (=> b!1031238 (= lt!455199 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11326 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41180 lt!455194) #b00000000000000000000000000000000 Nil!21857))))

(declare-fun arrayCountValidKeys!0 (array!64806 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031238 (= (arrayCountValidKeys!0 lt!455196 #b00000000000000000000000000000000 (size!31722 (_keys!11326 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11326 thiss!1427) #b00000000000000000000000000000000 (size!31722 (_keys!11326 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031238 (= lt!455196 (array!64807 (store (arr!31205 (_keys!11326 thiss!1427)) (index!41180 lt!455194) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31722 (_keys!11326 thiss!1427))))))

(declare-fun lt!455192 () Unit!33713)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64806 (_ BitVec 32) (_ BitVec 64)) Unit!33713)

(assert (=> b!1031238 (= lt!455192 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11326 thiss!1427) (index!41180 lt!455194) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1031239 () Bool)

(declare-fun res!689529 () Bool)

(assert (=> b!1031239 (=> (not res!689529) (not e!582424))))

(assert (=> b!1031239 (= res!689529 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1031240 () Bool)

(declare-fun res!689531 () Bool)

(assert (=> b!1031240 (=> res!689531 e!582428)))

(assert (=> b!1031240 (= res!689531 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11326 (_2!7831 lt!455195)) (mask!29945 (_2!7831 lt!455195)))))))

(declare-fun b!1031241 () Bool)

(assert (=> b!1031241 (= e!582424 e!582423)))

(declare-fun res!689530 () Bool)

(assert (=> b!1031241 (=> (not res!689530) (not e!582423))))

(assert (=> b!1031241 (= res!689530 (is-Found!9702 lt!455194))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64806 (_ BitVec 32)) SeekEntryResult!9702)

(assert (=> b!1031241 (= lt!455194 (seekEntry!0 key!909 (_keys!11326 thiss!1427) (mask!29945 thiss!1427)))))

(declare-fun b!1031242 () Bool)

(declare-fun res!689528 () Bool)

(assert (=> b!1031242 (=> res!689528 e!582428)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031242 (= res!689528 (not (validMask!0 (mask!29945 (_2!7831 lt!455195)))))))

(declare-fun mapNonEmpty!38010 () Bool)

(declare-fun mapRes!38010 () Bool)

(declare-fun tp!73024 () Bool)

(declare-fun e!582425 () Bool)

(assert (=> mapNonEmpty!38010 (= mapRes!38010 (and tp!73024 e!582425))))

(declare-fun mapValue!38010 () ValueCell!11482)

(declare-fun mapKey!38010 () (_ BitVec 32))

(declare-fun mapRest!38010 () (Array (_ BitVec 32) ValueCell!11482))

(assert (=> mapNonEmpty!38010 (= (arr!31206 (_values!6176 thiss!1427)) (store mapRest!38010 mapKey!38010 mapValue!38010))))

(declare-fun b!1031243 () Bool)

(assert (=> b!1031243 (= e!582428 true)))

(declare-fun lt!455193 () Bool)

(assert (=> b!1031243 (= lt!455193 (arrayNoDuplicates!0 (_keys!11326 (_2!7831 lt!455195)) #b00000000000000000000000000000000 Nil!21857))))

(declare-fun b!1031244 () Bool)

(declare-fun e!582426 () Bool)

(assert (=> b!1031244 (= e!582426 (and e!582429 mapRes!38010))))

(declare-fun condMapEmpty!38010 () Bool)

(declare-fun mapDefault!38010 () ValueCell!11482)

