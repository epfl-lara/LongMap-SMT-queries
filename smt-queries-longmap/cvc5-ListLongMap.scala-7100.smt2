; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90046 () Bool)

(assert start!90046)

(declare-fun b!1031274 () Bool)

(declare-fun b_free!20653 () Bool)

(declare-fun b_next!20653 () Bool)

(assert (=> b!1031274 (= b_free!20653 (not b_next!20653))))

(declare-fun tp!73029 () Bool)

(declare-fun b_and!33073 () Bool)

(assert (=> b!1031274 (= tp!73029 b_and!33073)))

(declare-fun b!1031272 () Bool)

(declare-fun e!582451 () Bool)

(declare-fun tp_is_empty!24373 () Bool)

(assert (=> b!1031272 (= e!582451 tp_is_empty!24373)))

(declare-fun b!1031273 () Bool)

(declare-fun res!689551 () Bool)

(declare-fun e!582448 () Bool)

(assert (=> b!1031273 (=> res!689551 e!582448)))

(declare-datatypes ((V!37371 0))(
  ( (V!37372 (val!12237 Int)) )
))
(declare-datatypes ((ValueCell!11483 0))(
  ( (ValueCellFull!11483 (v!14814 V!37371)) (EmptyCell!11483) )
))
(declare-datatypes ((Unit!33717 0))(
  ( (Unit!33718) )
))
(declare-datatypes ((array!64810 0))(
  ( (array!64811 (arr!31207 (Array (_ BitVec 32) (_ BitVec 64))) (size!31724 (_ BitVec 32))) )
))
(declare-datatypes ((array!64812 0))(
  ( (array!64813 (arr!31208 (Array (_ BitVec 32) ValueCell!11483)) (size!31725 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5560 0))(
  ( (LongMapFixedSize!5561 (defaultEntry!6154 Int) (mask!29948 (_ BitVec 32)) (extraKeys!5886 (_ BitVec 32)) (zeroValue!5990 V!37371) (minValue!5990 V!37371) (_size!2835 (_ BitVec 32)) (_keys!11327 array!64810) (_values!6177 array!64812) (_vacant!2835 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15644 0))(
  ( (tuple2!15645 (_1!7833 Unit!33717) (_2!7833 LongMapFixedSize!5560)) )
))
(declare-fun lt!455223 () tuple2!15644)

(assert (=> b!1031273 (= res!689551 (or (not (= (size!31725 (_values!6177 (_2!7833 lt!455223))) (bvadd #b00000000000000000000000000000001 (mask!29948 (_2!7833 lt!455223))))) (not (= (size!31724 (_keys!11327 (_2!7833 lt!455223))) (size!31725 (_values!6177 (_2!7833 lt!455223))))) (bvslt (mask!29948 (_2!7833 lt!455223)) #b00000000000000000000000000000000) (bvslt (extraKeys!5886 (_2!7833 lt!455223)) #b00000000000000000000000000000000) (bvsgt (extraKeys!5886 (_2!7833 lt!455223)) #b00000000000000000000000000000011)))))

(declare-fun e!582446 () Bool)

(declare-fun e!582447 () Bool)

(declare-fun thiss!1427 () LongMapFixedSize!5560)

(declare-fun array_inv!24155 (array!64810) Bool)

(declare-fun array_inv!24156 (array!64812) Bool)

(assert (=> b!1031274 (= e!582447 (and tp!73029 tp_is_empty!24373 (array_inv!24155 (_keys!11327 thiss!1427)) (array_inv!24156 (_values!6177 thiss!1427)) e!582446))))

(declare-fun b!1031275 () Bool)

(declare-fun e!582452 () Bool)

(assert (=> b!1031275 (= e!582452 (not e!582448))))

(declare-fun res!689550 () Bool)

(assert (=> b!1031275 (=> res!689550 e!582448)))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((tuple2!15646 0))(
  ( (tuple2!15647 (_1!7834 (_ BitVec 64)) (_2!7834 V!37371)) )
))
(declare-datatypes ((List!21861 0))(
  ( (Nil!21858) (Cons!21857 (h!23059 tuple2!15646) (t!31009 List!21861)) )
))
(declare-datatypes ((ListLongMap!13719 0))(
  ( (ListLongMap!13720 (toList!6875 List!21861)) )
))
(declare-fun contains!5989 (ListLongMap!13719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3923 (array!64810 array!64812 (_ BitVec 32) (_ BitVec 32) V!37371 V!37371 (_ BitVec 32) Int) ListLongMap!13719)

(assert (=> b!1031275 (= res!689550 (not (contains!5989 (getCurrentListMap!3923 (_keys!11327 (_2!7833 lt!455223)) (_values!6177 (_2!7833 lt!455223)) (mask!29948 (_2!7833 lt!455223)) (extraKeys!5886 (_2!7833 lt!455223)) (zeroValue!5990 (_2!7833 lt!455223)) (minValue!5990 (_2!7833 lt!455223)) #b00000000000000000000000000000000 (defaultEntry!6154 (_2!7833 lt!455223))) key!909)))))

(declare-fun lt!455231 () array!64810)

(declare-fun lt!455227 () array!64812)

(declare-fun Unit!33719 () Unit!33717)

(declare-fun Unit!33720 () Unit!33717)

(assert (=> b!1031275 (= lt!455223 (ite (bvsgt (bvadd #b00000000000000000000000000000001 (_vacant!2835 thiss!1427)) #b00000000000000000000000000000000) (tuple2!15645 Unit!33719 (LongMapFixedSize!5561 (defaultEntry!6154 thiss!1427) (mask!29948 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) (bvsub (_size!2835 thiss!1427) #b00000000000000000000000000000001) lt!455231 lt!455227 (bvadd #b00000000000000000000000000000001 (_vacant!2835 thiss!1427)))) (tuple2!15645 Unit!33720 (LongMapFixedSize!5561 (defaultEntry!6154 thiss!1427) (mask!29948 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) (bvsub (_size!2835 thiss!1427) #b00000000000000000000000000000001) lt!455231 lt!455227 (_vacant!2835 thiss!1427)))))))

(declare-fun -!502 (ListLongMap!13719 (_ BitVec 64)) ListLongMap!13719)

(assert (=> b!1031275 (= (-!502 (getCurrentListMap!3923 (_keys!11327 thiss!1427) (_values!6177 thiss!1427) (mask!29948 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6154 thiss!1427)) key!909) (getCurrentListMap!3923 lt!455231 lt!455227 (mask!29948 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6154 thiss!1427)))))

(declare-datatypes ((SeekEntryResult!9703 0))(
  ( (MissingZero!9703 (index!41183 (_ BitVec 32))) (Found!9703 (index!41184 (_ BitVec 32))) (Intermediate!9703 (undefined!10515 Bool) (index!41185 (_ BitVec 32)) (x!91825 (_ BitVec 32))) (Undefined!9703) (MissingVacant!9703 (index!41186 (_ BitVec 32))) )
))
(declare-fun lt!455226 () SeekEntryResult!9703)

(declare-fun dynLambda!1972 (Int (_ BitVec 64)) V!37371)

(assert (=> b!1031275 (= lt!455227 (array!64813 (store (arr!31208 (_values!6177 thiss!1427)) (index!41184 lt!455226) (ValueCellFull!11483 (dynLambda!1972 (defaultEntry!6154 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))) (size!31725 (_values!6177 thiss!1427))))))

(declare-fun lt!455225 () Unit!33717)

(declare-fun lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!28 (array!64810 array!64812 (_ BitVec 32) (_ BitVec 32) V!37371 V!37371 (_ BitVec 32) (_ BitVec 64) Int) Unit!33717)

(assert (=> b!1031275 (= lt!455225 (lemmaRemoveValidKeyToArrayThenRemoveKeyFromListMap!28 (_keys!11327 thiss!1427) (_values!6177 thiss!1427) (mask!29948 thiss!1427) (extraKeys!5886 thiss!1427) (zeroValue!5990 thiss!1427) (minValue!5990 thiss!1427) (index!41184 lt!455226) key!909 (defaultEntry!6154 thiss!1427)))))

(declare-fun arrayContainsKey!0 (array!64810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1031275 (not (arrayContainsKey!0 lt!455231 key!909 #b00000000000000000000000000000000))))

(declare-fun lt!455230 () Unit!33717)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64810 (_ BitVec 32) (_ BitVec 64)) Unit!33717)

(assert (=> b!1031275 (= lt!455230 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11327 thiss!1427) (index!41184 lt!455226) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64810 (_ BitVec 32)) Bool)

(assert (=> b!1031275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!455231 (mask!29948 thiss!1427))))

(declare-fun lt!455228 () Unit!33717)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64810 (_ BitVec 32) (_ BitVec 32)) Unit!33717)

(assert (=> b!1031275 (= lt!455228 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11327 thiss!1427) (index!41184 lt!455226) (mask!29948 thiss!1427)))))

(declare-datatypes ((List!21862 0))(
  ( (Nil!21859) (Cons!21858 (h!23060 (_ BitVec 64)) (t!31010 List!21862)) )
))
(declare-fun arrayNoDuplicates!0 (array!64810 (_ BitVec 32) List!21862) Bool)

(assert (=> b!1031275 (arrayNoDuplicates!0 lt!455231 #b00000000000000000000000000000000 Nil!21859)))

(declare-fun lt!455224 () Unit!33717)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64810 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21862) Unit!33717)

(assert (=> b!1031275 (= lt!455224 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11327 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41184 lt!455226) #b00000000000000000000000000000000 Nil!21859))))

(declare-fun arrayCountValidKeys!0 (array!64810 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1031275 (= (arrayCountValidKeys!0 lt!455231 #b00000000000000000000000000000000 (size!31724 (_keys!11327 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11327 thiss!1427) #b00000000000000000000000000000000 (size!31724 (_keys!11327 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1031275 (= lt!455231 (array!64811 (store (arr!31207 (_keys!11327 thiss!1427)) (index!41184 lt!455226) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31724 (_keys!11327 thiss!1427))))))

(declare-fun lt!455222 () Unit!33717)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64810 (_ BitVec 32) (_ BitVec 64)) Unit!33717)

(assert (=> b!1031275 (= lt!455222 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11327 thiss!1427) (index!41184 lt!455226) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!38013 () Bool)

(declare-fun mapRes!38013 () Bool)

(assert (=> mapIsEmpty!38013 mapRes!38013))

(declare-fun b!1031276 () Bool)

(declare-fun res!689548 () Bool)

(assert (=> b!1031276 (=> res!689548 e!582448)))

(assert (=> b!1031276 (= res!689548 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11327 (_2!7833 lt!455223)) (mask!29948 (_2!7833 lt!455223)))))))

(declare-fun b!1031277 () Bool)

(declare-fun e!582453 () Bool)

(assert (=> b!1031277 (= e!582453 e!582452)))

(declare-fun res!689549 () Bool)

(assert (=> b!1031277 (=> (not res!689549) (not e!582452))))

(assert (=> b!1031277 (= res!689549 (is-Found!9703 lt!455226))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64810 (_ BitVec 32)) SeekEntryResult!9703)

(assert (=> b!1031277 (= lt!455226 (seekEntry!0 key!909 (_keys!11327 thiss!1427) (mask!29948 thiss!1427)))))

(declare-fun mapNonEmpty!38013 () Bool)

(declare-fun tp!73030 () Bool)

(assert (=> mapNonEmpty!38013 (= mapRes!38013 (and tp!73030 e!582451))))

(declare-fun mapRest!38013 () (Array (_ BitVec 32) ValueCell!11483))

(declare-fun mapValue!38013 () ValueCell!11483)

(declare-fun mapKey!38013 () (_ BitVec 32))

(assert (=> mapNonEmpty!38013 (= (arr!31208 (_values!6177 thiss!1427)) (store mapRest!38013 mapKey!38013 mapValue!38013))))

(declare-fun b!1031278 () Bool)

(declare-fun res!689552 () Bool)

(assert (=> b!1031278 (=> res!689552 e!582448)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1031278 (= res!689552 (not (validMask!0 (mask!29948 (_2!7833 lt!455223)))))))

(declare-fun b!1031279 () Bool)

(declare-fun e!582449 () Bool)

(assert (=> b!1031279 (= e!582446 (and e!582449 mapRes!38013))))

(declare-fun condMapEmpty!38013 () Bool)

(declare-fun mapDefault!38013 () ValueCell!11483)

