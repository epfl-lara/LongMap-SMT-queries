; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89528 () Bool)

(assert start!89528)

(declare-fun b!1026859 () Bool)

(declare-fun b_free!20527 () Bool)

(declare-fun b_next!20527 () Bool)

(assert (=> b!1026859 (= b_free!20527 (not b_next!20527))))

(declare-fun tp!72626 () Bool)

(declare-fun b_and!32773 () Bool)

(assert (=> b!1026859 (= tp!72626 b_and!32773)))

(declare-fun b!1026851 () Bool)

(declare-fun res!687356 () Bool)

(declare-fun e!579379 () Bool)

(assert (=> b!1026851 (=> (not res!687356) (not e!579379))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026851 (= res!687356 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026852 () Bool)

(declare-fun e!579380 () Bool)

(assert (=> b!1026852 (= e!579380 true)))

(declare-fun lt!451846 () Bool)

(declare-datatypes ((V!37203 0))(
  ( (V!37204 (val!12174 Int)) )
))
(declare-datatypes ((ValueCell!11420 0))(
  ( (ValueCellFull!11420 (v!14743 V!37203)) (EmptyCell!11420) )
))
(declare-datatypes ((array!64544 0))(
  ( (array!64545 (arr!31081 (Array (_ BitVec 32) (_ BitVec 64))) (size!31594 (_ BitVec 32))) )
))
(declare-datatypes ((array!64546 0))(
  ( (array!64547 (arr!31082 (Array (_ BitVec 32) ValueCell!11420)) (size!31595 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5434 0))(
  ( (LongMapFixedSize!5435 (defaultEntry!6069 Int) (mask!29773 (_ BitVec 32)) (extraKeys!5801 (_ BitVec 32)) (zeroValue!5905 V!37203) (minValue!5905 V!37203) (_size!2772 (_ BitVec 32)) (_keys!11216 array!64544) (_values!6092 array!64546) (_vacant!2772 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5434)

(declare-datatypes ((List!21792 0))(
  ( (Nil!21789) (Cons!21788 (h!22986 (_ BitVec 64)) (t!30854 List!21792)) )
))
(declare-fun arrayNoDuplicates!0 (array!64544 (_ BitVec 32) List!21792) Bool)

(assert (=> b!1026852 (= lt!451846 (arrayNoDuplicates!0 (_keys!11216 thiss!1427) #b00000000000000000000000000000000 Nil!21789))))

(declare-fun b!1026853 () Bool)

(declare-fun res!687353 () Bool)

(assert (=> b!1026853 (=> res!687353 e!579380)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64544 (_ BitVec 32)) Bool)

(assert (=> b!1026853 (= res!687353 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11216 thiss!1427) (mask!29773 thiss!1427))))))

(declare-fun mapIsEmpty!37799 () Bool)

(declare-fun mapRes!37799 () Bool)

(assert (=> mapIsEmpty!37799 mapRes!37799))

(declare-fun b!1026854 () Bool)

(declare-fun e!579382 () Bool)

(assert (=> b!1026854 (= e!579379 e!579382)))

(declare-fun res!687354 () Bool)

(assert (=> b!1026854 (=> (not res!687354) (not e!579382))))

(declare-datatypes ((SeekEntryResult!9658 0))(
  ( (MissingZero!9658 (index!41003 (_ BitVec 32))) (Found!9658 (index!41004 (_ BitVec 32))) (Intermediate!9658 (undefined!10470 Bool) (index!41005 (_ BitVec 32)) (x!91360 (_ BitVec 32))) (Undefined!9658) (MissingVacant!9658 (index!41006 (_ BitVec 32))) )
))
(declare-fun lt!451847 () SeekEntryResult!9658)

(assert (=> b!1026854 (= res!687354 (is-Found!9658 lt!451847))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64544 (_ BitVec 32)) SeekEntryResult!9658)

(assert (=> b!1026854 (= lt!451847 (seekEntry!0 key!909 (_keys!11216 thiss!1427) (mask!29773 thiss!1427)))))

(declare-fun b!1026855 () Bool)

(declare-fun e!579375 () Bool)

(declare-fun tp_is_empty!24247 () Bool)

(assert (=> b!1026855 (= e!579375 tp_is_empty!24247)))

(declare-fun b!1026856 () Bool)

(declare-fun res!687352 () Bool)

(assert (=> b!1026856 (=> res!687352 e!579380)))

(assert (=> b!1026856 (= res!687352 (or (not (= (size!31595 (_values!6092 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29773 thiss!1427)))) (not (= (size!31594 (_keys!11216 thiss!1427)) (size!31595 (_values!6092 thiss!1427)))) (bvslt (mask!29773 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5801 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5801 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026857 () Bool)

(assert (=> b!1026857 (= e!579382 (not e!579380))))

(declare-fun res!687351 () Bool)

(assert (=> b!1026857 (=> res!687351 e!579380)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026857 (= res!687351 (not (validMask!0 (mask!29773 thiss!1427))))))

(declare-fun lt!451850 () array!64544)

(declare-fun arrayContainsKey!0 (array!64544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026857 (not (arrayContainsKey!0 lt!451850 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33459 0))(
  ( (Unit!33460) )
))
(declare-fun lt!451851 () Unit!33459)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64544 (_ BitVec 32) (_ BitVec 64)) Unit!33459)

(assert (=> b!1026857 (= lt!451851 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11216 thiss!1427) (index!41004 lt!451847) key!909))))

(assert (=> b!1026857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451850 (mask!29773 thiss!1427))))

(declare-fun lt!451849 () Unit!33459)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64544 (_ BitVec 32) (_ BitVec 32)) Unit!33459)

(assert (=> b!1026857 (= lt!451849 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11216 thiss!1427) (index!41004 lt!451847) (mask!29773 thiss!1427)))))

(assert (=> b!1026857 (arrayNoDuplicates!0 lt!451850 #b00000000000000000000000000000000 Nil!21789)))

(declare-fun lt!451848 () Unit!33459)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21792) Unit!33459)

(assert (=> b!1026857 (= lt!451848 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11216 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41004 lt!451847) #b00000000000000000000000000000000 Nil!21789))))

(declare-fun arrayCountValidKeys!0 (array!64544 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026857 (= (arrayCountValidKeys!0 lt!451850 #b00000000000000000000000000000000 (size!31594 (_keys!11216 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11216 thiss!1427) #b00000000000000000000000000000000 (size!31594 (_keys!11216 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026857 (= lt!451850 (array!64545 (store (arr!31081 (_keys!11216 thiss!1427)) (index!41004 lt!451847) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31594 (_keys!11216 thiss!1427))))))

(declare-fun lt!451845 () Unit!33459)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64544 (_ BitVec 32) (_ BitVec 64)) Unit!33459)

(assert (=> b!1026857 (= lt!451845 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11216 thiss!1427) (index!41004 lt!451847) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026858 () Bool)

(declare-fun e!579378 () Bool)

(assert (=> b!1026858 (= e!579378 tp_is_empty!24247)))

(declare-fun res!687355 () Bool)

(assert (=> start!89528 (=> (not res!687355) (not e!579379))))

(declare-fun valid!2062 (LongMapFixedSize!5434) Bool)

(assert (=> start!89528 (= res!687355 (valid!2062 thiss!1427))))

(assert (=> start!89528 e!579379))

(declare-fun e!579377 () Bool)

(assert (=> start!89528 e!579377))

(assert (=> start!89528 true))

(declare-fun mapNonEmpty!37799 () Bool)

(declare-fun tp!72627 () Bool)

(assert (=> mapNonEmpty!37799 (= mapRes!37799 (and tp!72627 e!579375))))

(declare-fun mapKey!37799 () (_ BitVec 32))

(declare-fun mapRest!37799 () (Array (_ BitVec 32) ValueCell!11420))

(declare-fun mapValue!37799 () ValueCell!11420)

(assert (=> mapNonEmpty!37799 (= (arr!31082 (_values!6092 thiss!1427)) (store mapRest!37799 mapKey!37799 mapValue!37799))))

(declare-fun e!579376 () Bool)

(declare-fun array_inv!24067 (array!64544) Bool)

(declare-fun array_inv!24068 (array!64546) Bool)

(assert (=> b!1026859 (= e!579377 (and tp!72626 tp_is_empty!24247 (array_inv!24067 (_keys!11216 thiss!1427)) (array_inv!24068 (_values!6092 thiss!1427)) e!579376))))

(declare-fun b!1026860 () Bool)

(assert (=> b!1026860 (= e!579376 (and e!579378 mapRes!37799))))

(declare-fun condMapEmpty!37799 () Bool)

(declare-fun mapDefault!37799 () ValueCell!11420)

