; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89522 () Bool)

(assert start!89522)

(declare-fun b!1026763 () Bool)

(declare-fun b_free!20521 () Bool)

(declare-fun b_next!20521 () Bool)

(assert (=> b!1026763 (= b_free!20521 (not b_next!20521))))

(declare-fun tp!72608 () Bool)

(declare-fun b_and!32767 () Bool)

(assert (=> b!1026763 (= tp!72608 b_and!32767)))

(declare-fun b!1026761 () Bool)

(declare-fun e!579305 () Bool)

(declare-fun tp_is_empty!24241 () Bool)

(assert (=> b!1026761 (= e!579305 tp_is_empty!24241)))

(declare-fun b!1026762 () Bool)

(declare-fun res!687297 () Bool)

(declare-fun e!579310 () Bool)

(assert (=> b!1026762 (=> res!687297 e!579310)))

(declare-datatypes ((V!37195 0))(
  ( (V!37196 (val!12171 Int)) )
))
(declare-datatypes ((ValueCell!11417 0))(
  ( (ValueCellFull!11417 (v!14740 V!37195)) (EmptyCell!11417) )
))
(declare-datatypes ((array!64532 0))(
  ( (array!64533 (arr!31075 (Array (_ BitVec 32) (_ BitVec 64))) (size!31588 (_ BitVec 32))) )
))
(declare-datatypes ((array!64534 0))(
  ( (array!64535 (arr!31076 (Array (_ BitVec 32) ValueCell!11417)) (size!31589 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5428 0))(
  ( (LongMapFixedSize!5429 (defaultEntry!6066 Int) (mask!29768 (_ BitVec 32)) (extraKeys!5798 (_ BitVec 32)) (zeroValue!5902 V!37195) (minValue!5902 V!37195) (_size!2769 (_ BitVec 32)) (_keys!11213 array!64532) (_values!6089 array!64534) (_vacant!2769 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5428)

(assert (=> b!1026762 (= res!687297 (or (not (= (size!31589 (_values!6089 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29768 thiss!1427)))) (not (= (size!31588 (_keys!11213 thiss!1427)) (size!31589 (_values!6089 thiss!1427)))) (bvslt (mask!29768 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5798 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5798 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!37790 () Bool)

(declare-fun mapRes!37790 () Bool)

(assert (=> mapIsEmpty!37790 mapRes!37790))

(declare-fun e!579306 () Bool)

(declare-fun e!579307 () Bool)

(declare-fun array_inv!24063 (array!64532) Bool)

(declare-fun array_inv!24064 (array!64534) Bool)

(assert (=> b!1026763 (= e!579306 (and tp!72608 tp_is_empty!24241 (array_inv!24063 (_keys!11213 thiss!1427)) (array_inv!24064 (_values!6089 thiss!1427)) e!579307))))

(declare-fun b!1026764 () Bool)

(declare-fun e!579309 () Bool)

(assert (=> b!1026764 (= e!579309 (not e!579310))))

(declare-fun res!687300 () Bool)

(assert (=> b!1026764 (=> res!687300 e!579310)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026764 (= res!687300 (not (validMask!0 (mask!29768 thiss!1427))))))

(declare-fun lt!451784 () array!64532)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026764 (not (arrayContainsKey!0 lt!451784 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9655 0))(
  ( (MissingZero!9655 (index!40991 (_ BitVec 32))) (Found!9655 (index!40992 (_ BitVec 32))) (Intermediate!9655 (undefined!10467 Bool) (index!40993 (_ BitVec 32)) (x!91349 (_ BitVec 32))) (Undefined!9655) (MissingVacant!9655 (index!40994 (_ BitVec 32))) )
))
(declare-fun lt!451787 () SeekEntryResult!9655)

(declare-datatypes ((Unit!33453 0))(
  ( (Unit!33454) )
))
(declare-fun lt!451782 () Unit!33453)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64532 (_ BitVec 32) (_ BitVec 64)) Unit!33453)

(assert (=> b!1026764 (= lt!451782 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11213 thiss!1427) (index!40992 lt!451787) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64532 (_ BitVec 32)) Bool)

(assert (=> b!1026764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451784 (mask!29768 thiss!1427))))

(declare-fun lt!451788 () Unit!33453)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64532 (_ BitVec 32) (_ BitVec 32)) Unit!33453)

(assert (=> b!1026764 (= lt!451788 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11213 thiss!1427) (index!40992 lt!451787) (mask!29768 thiss!1427)))))

(declare-datatypes ((List!21789 0))(
  ( (Nil!21786) (Cons!21785 (h!22983 (_ BitVec 64)) (t!30851 List!21789)) )
))
(declare-fun arrayNoDuplicates!0 (array!64532 (_ BitVec 32) List!21789) Bool)

(assert (=> b!1026764 (arrayNoDuplicates!0 lt!451784 #b00000000000000000000000000000000 Nil!21786)))

(declare-fun lt!451786 () Unit!33453)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21789) Unit!33453)

(assert (=> b!1026764 (= lt!451786 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11213 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40992 lt!451787) #b00000000000000000000000000000000 Nil!21786))))

(declare-fun arrayCountValidKeys!0 (array!64532 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026764 (= (arrayCountValidKeys!0 lt!451784 #b00000000000000000000000000000000 (size!31588 (_keys!11213 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11213 thiss!1427) #b00000000000000000000000000000000 (size!31588 (_keys!11213 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026764 (= lt!451784 (array!64533 (store (arr!31075 (_keys!11213 thiss!1427)) (index!40992 lt!451787) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31588 (_keys!11213 thiss!1427))))))

(declare-fun lt!451783 () Unit!33453)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64532 (_ BitVec 32) (_ BitVec 64)) Unit!33453)

(assert (=> b!1026764 (= lt!451783 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11213 thiss!1427) (index!40992 lt!451787) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026765 () Bool)

(declare-fun res!687299 () Bool)

(declare-fun e!579303 () Bool)

(assert (=> b!1026765 (=> (not res!687299) (not e!579303))))

(assert (=> b!1026765 (= res!687299 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026766 () Bool)

(declare-fun res!687298 () Bool)

(assert (=> b!1026766 (=> res!687298 e!579310)))

(assert (=> b!1026766 (= res!687298 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11213 thiss!1427) (mask!29768 thiss!1427))))))

(declare-fun mapNonEmpty!37790 () Bool)

(declare-fun tp!72609 () Bool)

(declare-fun e!579304 () Bool)

(assert (=> mapNonEmpty!37790 (= mapRes!37790 (and tp!72609 e!579304))))

(declare-fun mapValue!37790 () ValueCell!11417)

(declare-fun mapRest!37790 () (Array (_ BitVec 32) ValueCell!11417))

(declare-fun mapKey!37790 () (_ BitVec 32))

(assert (=> mapNonEmpty!37790 (= (arr!31076 (_values!6089 thiss!1427)) (store mapRest!37790 mapKey!37790 mapValue!37790))))

(declare-fun b!1026768 () Bool)

(assert (=> b!1026768 (= e!579310 true)))

(declare-fun lt!451785 () Bool)

(assert (=> b!1026768 (= lt!451785 (arrayNoDuplicates!0 (_keys!11213 thiss!1427) #b00000000000000000000000000000000 Nil!21786))))

(declare-fun b!1026769 () Bool)

(assert (=> b!1026769 (= e!579304 tp_is_empty!24241)))

(declare-fun b!1026770 () Bool)

(assert (=> b!1026770 (= e!579307 (and e!579305 mapRes!37790))))

(declare-fun condMapEmpty!37790 () Bool)

(declare-fun mapDefault!37790 () ValueCell!11417)

