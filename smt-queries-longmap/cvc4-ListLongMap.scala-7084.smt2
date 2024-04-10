; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89562 () Bool)

(assert start!89562)

(declare-fun b!1027362 () Bool)

(declare-fun b_free!20561 () Bool)

(declare-fun b_next!20561 () Bool)

(assert (=> b!1027362 (= b_free!20561 (not b_next!20561))))

(declare-fun tp!72729 () Bool)

(declare-fun b_and!32807 () Bool)

(assert (=> b!1027362 (= tp!72729 b_and!32807)))

(declare-fun b!1027361 () Bool)

(declare-fun res!687657 () Bool)

(declare-fun e!579786 () Bool)

(assert (=> b!1027361 (=> res!687657 e!579786)))

(declare-datatypes ((V!37247 0))(
  ( (V!37248 (val!12191 Int)) )
))
(declare-datatypes ((ValueCell!11437 0))(
  ( (ValueCellFull!11437 (v!14760 V!37247)) (EmptyCell!11437) )
))
(declare-datatypes ((array!64612 0))(
  ( (array!64613 (arr!31115 (Array (_ BitVec 32) (_ BitVec 64))) (size!31628 (_ BitVec 32))) )
))
(declare-datatypes ((array!64614 0))(
  ( (array!64615 (arr!31116 (Array (_ BitVec 32) ValueCell!11437)) (size!31629 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5468 0))(
  ( (LongMapFixedSize!5469 (defaultEntry!6086 Int) (mask!29800 (_ BitVec 32)) (extraKeys!5818 (_ BitVec 32)) (zeroValue!5922 V!37247) (minValue!5922 V!37247) (_size!2789 (_ BitVec 32)) (_keys!11233 array!64612) (_values!6109 array!64614) (_vacant!2789 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5468)

(assert (=> b!1027361 (= res!687657 (or (not (= (size!31629 (_values!6109 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29800 thiss!1427)))) (not (= (size!31628 (_keys!11233 thiss!1427)) (size!31629 (_values!6109 thiss!1427)))) (bvslt (mask!29800 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5818 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5818 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun e!579785 () Bool)

(declare-fun e!579787 () Bool)

(declare-fun tp_is_empty!24281 () Bool)

(declare-fun array_inv!24091 (array!64612) Bool)

(declare-fun array_inv!24092 (array!64614) Bool)

(assert (=> b!1027362 (= e!579787 (and tp!72729 tp_is_empty!24281 (array_inv!24091 (_keys!11233 thiss!1427)) (array_inv!24092 (_values!6109 thiss!1427)) e!579785))))

(declare-fun b!1027363 () Bool)

(declare-fun e!579788 () Bool)

(declare-fun e!579790 () Bool)

(assert (=> b!1027363 (= e!579788 e!579790)))

(declare-fun res!687661 () Bool)

(assert (=> b!1027363 (=> (not res!687661) (not e!579790))))

(declare-datatypes ((SeekEntryResult!9671 0))(
  ( (MissingZero!9671 (index!41055 (_ BitVec 32))) (Found!9671 (index!41056 (_ BitVec 32))) (Intermediate!9671 (undefined!10483 Bool) (index!41057 (_ BitVec 32)) (x!91413 (_ BitVec 32))) (Undefined!9671) (MissingVacant!9671 (index!41058 (_ BitVec 32))) )
))
(declare-fun lt!452204 () SeekEntryResult!9671)

(assert (=> b!1027363 (= res!687661 (is-Found!9671 lt!452204))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64612 (_ BitVec 32)) SeekEntryResult!9671)

(assert (=> b!1027363 (= lt!452204 (seekEntry!0 key!909 (_keys!11233 thiss!1427) (mask!29800 thiss!1427)))))

(declare-fun b!1027364 () Bool)

(declare-fun res!687662 () Bool)

(assert (=> b!1027364 (=> res!687662 e!579786)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64612 (_ BitVec 32)) Bool)

(assert (=> b!1027364 (= res!687662 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11233 thiss!1427) (mask!29800 thiss!1427))))))

(declare-fun mapIsEmpty!37850 () Bool)

(declare-fun mapRes!37850 () Bool)

(assert (=> mapIsEmpty!37850 mapRes!37850))

(declare-fun b!1027365 () Bool)

(assert (=> b!1027365 (= e!579790 (not e!579786))))

(declare-fun res!687659 () Bool)

(assert (=> b!1027365 (=> res!687659 e!579786)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027365 (= res!687659 (not (validMask!0 (mask!29800 thiss!1427))))))

(declare-fun lt!452203 () array!64612)

(declare-fun arrayContainsKey!0 (array!64612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027365 (not (arrayContainsKey!0 lt!452203 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33481 0))(
  ( (Unit!33482) )
))
(declare-fun lt!452208 () Unit!33481)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64612 (_ BitVec 32) (_ BitVec 64)) Unit!33481)

(assert (=> b!1027365 (= lt!452208 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11233 thiss!1427) (index!41056 lt!452204) key!909))))

(assert (=> b!1027365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452203 (mask!29800 thiss!1427))))

(declare-fun lt!452202 () Unit!33481)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64612 (_ BitVec 32) (_ BitVec 32)) Unit!33481)

(assert (=> b!1027365 (= lt!452202 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11233 thiss!1427) (index!41056 lt!452204) (mask!29800 thiss!1427)))))

(declare-datatypes ((List!21805 0))(
  ( (Nil!21802) (Cons!21801 (h!22999 (_ BitVec 64)) (t!30867 List!21805)) )
))
(declare-fun arrayNoDuplicates!0 (array!64612 (_ BitVec 32) List!21805) Bool)

(assert (=> b!1027365 (arrayNoDuplicates!0 lt!452203 #b00000000000000000000000000000000 Nil!21802)))

(declare-fun lt!452206 () Unit!33481)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64612 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21805) Unit!33481)

(assert (=> b!1027365 (= lt!452206 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11233 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41056 lt!452204) #b00000000000000000000000000000000 Nil!21802))))

(declare-fun arrayCountValidKeys!0 (array!64612 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027365 (= (arrayCountValidKeys!0 lt!452203 #b00000000000000000000000000000000 (size!31628 (_keys!11233 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11233 thiss!1427) #b00000000000000000000000000000000 (size!31628 (_keys!11233 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027365 (= lt!452203 (array!64613 (store (arr!31115 (_keys!11233 thiss!1427)) (index!41056 lt!452204) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31628 (_keys!11233 thiss!1427))))))

(declare-fun lt!452205 () Unit!33481)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64612 (_ BitVec 32) (_ BitVec 64)) Unit!33481)

(assert (=> b!1027365 (= lt!452205 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11233 thiss!1427) (index!41056 lt!452204) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027366 () Bool)

(declare-fun e!579783 () Bool)

(assert (=> b!1027366 (= e!579783 tp_is_empty!24281)))

(declare-fun b!1027367 () Bool)

(declare-fun res!687658 () Bool)

(assert (=> b!1027367 (=> (not res!687658) (not e!579788))))

(assert (=> b!1027367 (= res!687658 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027369 () Bool)

(declare-fun e!579789 () Bool)

(assert (=> b!1027369 (= e!579789 tp_is_empty!24281)))

(declare-fun b!1027370 () Bool)

(assert (=> b!1027370 (= e!579786 true)))

(declare-fun lt!452207 () Bool)

(assert (=> b!1027370 (= lt!452207 (arrayNoDuplicates!0 (_keys!11233 thiss!1427) #b00000000000000000000000000000000 Nil!21802))))

(declare-fun mapNonEmpty!37850 () Bool)

(declare-fun tp!72728 () Bool)

(assert (=> mapNonEmpty!37850 (= mapRes!37850 (and tp!72728 e!579789))))

(declare-fun mapKey!37850 () (_ BitVec 32))

(declare-fun mapValue!37850 () ValueCell!11437)

(declare-fun mapRest!37850 () (Array (_ BitVec 32) ValueCell!11437))

(assert (=> mapNonEmpty!37850 (= (arr!31116 (_values!6109 thiss!1427)) (store mapRest!37850 mapKey!37850 mapValue!37850))))

(declare-fun res!687660 () Bool)

(assert (=> start!89562 (=> (not res!687660) (not e!579788))))

(declare-fun valid!2071 (LongMapFixedSize!5468) Bool)

(assert (=> start!89562 (= res!687660 (valid!2071 thiss!1427))))

(assert (=> start!89562 e!579788))

(assert (=> start!89562 e!579787))

(assert (=> start!89562 true))

(declare-fun b!1027368 () Bool)

(assert (=> b!1027368 (= e!579785 (and e!579783 mapRes!37850))))

(declare-fun condMapEmpty!37850 () Bool)

(declare-fun mapDefault!37850 () ValueCell!11437)

