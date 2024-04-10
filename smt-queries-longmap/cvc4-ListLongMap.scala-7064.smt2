; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89442 () Bool)

(assert start!89442)

(declare-fun b!1025657 () Bool)

(declare-fun b_free!20441 () Bool)

(declare-fun b_next!20441 () Bool)

(assert (=> b!1025657 (= b_free!20441 (not b_next!20441))))

(declare-fun tp!72369 () Bool)

(declare-fun b_and!32687 () Bool)

(assert (=> b!1025657 (= tp!72369 b_and!32687)))

(declare-fun b!1025650 () Bool)

(declare-fun e!578348 () Bool)

(assert (=> b!1025650 (= e!578348 true)))

(declare-fun lt!451038 () Bool)

(declare-datatypes ((V!37087 0))(
  ( (V!37088 (val!12131 Int)) )
))
(declare-datatypes ((ValueCell!11377 0))(
  ( (ValueCellFull!11377 (v!14700 V!37087)) (EmptyCell!11377) )
))
(declare-datatypes ((array!64372 0))(
  ( (array!64373 (arr!30995 (Array (_ BitVec 32) (_ BitVec 64))) (size!31508 (_ BitVec 32))) )
))
(declare-datatypes ((array!64374 0))(
  ( (array!64375 (arr!30996 (Array (_ BitVec 32) ValueCell!11377)) (size!31509 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5348 0))(
  ( (LongMapFixedSize!5349 (defaultEntry!6026 Int) (mask!29700 (_ BitVec 32)) (extraKeys!5758 (_ BitVec 32)) (zeroValue!5862 V!37087) (minValue!5862 V!37087) (_size!2729 (_ BitVec 32)) (_keys!11173 array!64372) (_values!6049 array!64374) (_vacant!2729 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5348)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64372 (_ BitVec 32)) Bool)

(assert (=> b!1025650 (= lt!451038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11173 thiss!1427) (mask!29700 thiss!1427)))))

(declare-fun b!1025651 () Bool)

(declare-fun res!686666 () Bool)

(assert (=> b!1025651 (=> res!686666 e!578348)))

(declare-datatypes ((SeekEntryResult!9625 0))(
  ( (MissingZero!9625 (index!40871 (_ BitVec 32))) (Found!9625 (index!40872 (_ BitVec 32))) (Intermediate!9625 (undefined!10437 Bool) (index!40873 (_ BitVec 32)) (x!91207 (_ BitVec 32))) (Undefined!9625) (MissingVacant!9625 (index!40874 (_ BitVec 32))) )
))
(declare-fun lt!451037 () SeekEntryResult!9625)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1025651 (= res!686666 (not (validKeyInArray!0 (select (arr!30995 (_keys!11173 thiss!1427)) (index!40872 lt!451037)))))))

(declare-fun b!1025652 () Bool)

(declare-fun res!686669 () Bool)

(assert (=> b!1025652 (=> res!686669 e!578348)))

(declare-datatypes ((List!21757 0))(
  ( (Nil!21754) (Cons!21753 (h!22951 (_ BitVec 64)) (t!30819 List!21757)) )
))
(declare-fun arrayNoDuplicates!0 (array!64372 (_ BitVec 32) List!21757) Bool)

(assert (=> b!1025652 (= res!686669 (not (arrayNoDuplicates!0 (_keys!11173 thiss!1427) #b00000000000000000000000000000000 Nil!21754)))))

(declare-fun mapNonEmpty!37670 () Bool)

(declare-fun mapRes!37670 () Bool)

(declare-fun tp!72368 () Bool)

(declare-fun e!578343 () Bool)

(assert (=> mapNonEmpty!37670 (= mapRes!37670 (and tp!72368 e!578343))))

(declare-fun mapValue!37670 () ValueCell!11377)

(declare-fun mapRest!37670 () (Array (_ BitVec 32) ValueCell!11377))

(declare-fun mapKey!37670 () (_ BitVec 32))

(assert (=> mapNonEmpty!37670 (= (arr!30996 (_values!6049 thiss!1427)) (store mapRest!37670 mapKey!37670 mapValue!37670))))

(declare-fun b!1025653 () Bool)

(declare-fun e!578347 () Bool)

(declare-fun e!578349 () Bool)

(assert (=> b!1025653 (= e!578347 e!578349)))

(declare-fun res!686667 () Bool)

(assert (=> b!1025653 (=> (not res!686667) (not e!578349))))

(assert (=> b!1025653 (= res!686667 (is-Found!9625 lt!451037))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64372 (_ BitVec 32)) SeekEntryResult!9625)

(assert (=> b!1025653 (= lt!451037 (seekEntry!0 key!909 (_keys!11173 thiss!1427) (mask!29700 thiss!1427)))))

(declare-fun mapIsEmpty!37670 () Bool)

(assert (=> mapIsEmpty!37670 mapRes!37670))

(declare-fun b!1025654 () Bool)

(declare-fun e!578344 () Bool)

(declare-fun tp_is_empty!24161 () Bool)

(assert (=> b!1025654 (= e!578344 tp_is_empty!24161)))

(declare-fun b!1025655 () Bool)

(assert (=> b!1025655 (= e!578343 tp_is_empty!24161)))

(declare-fun b!1025656 () Bool)

(assert (=> b!1025656 (= e!578349 (not e!578348))))

(declare-fun res!686668 () Bool)

(assert (=> b!1025656 (=> res!686668 e!578348)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1025656 (= res!686668 (not (validMask!0 (mask!29700 thiss!1427))))))

(declare-fun lt!451036 () array!64372)

(assert (=> b!1025656 (arrayNoDuplicates!0 lt!451036 #b00000000000000000000000000000000 Nil!21754)))

(declare-datatypes ((Unit!33399 0))(
  ( (Unit!33400) )
))
(declare-fun lt!451034 () Unit!33399)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64372 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21757) Unit!33399)

(assert (=> b!1025656 (= lt!451034 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11173 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40872 lt!451037) #b00000000000000000000000000000000 Nil!21754))))

(declare-fun arrayCountValidKeys!0 (array!64372 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025656 (= (arrayCountValidKeys!0 lt!451036 #b00000000000000000000000000000000 (size!31508 (_keys!11173 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11173 thiss!1427) #b00000000000000000000000000000000 (size!31508 (_keys!11173 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1025656 (= lt!451036 (array!64373 (store (arr!30995 (_keys!11173 thiss!1427)) (index!40872 lt!451037) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31508 (_keys!11173 thiss!1427))))))

(declare-fun lt!451035 () Unit!33399)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64372 (_ BitVec 32) (_ BitVec 64)) Unit!33399)

(assert (=> b!1025656 (= lt!451035 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11173 thiss!1427) (index!40872 lt!451037) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!686672 () Bool)

(assert (=> start!89442 (=> (not res!686672) (not e!578347))))

(declare-fun valid!2032 (LongMapFixedSize!5348) Bool)

(assert (=> start!89442 (= res!686672 (valid!2032 thiss!1427))))

(assert (=> start!89442 e!578347))

(declare-fun e!578346 () Bool)

(assert (=> start!89442 e!578346))

(assert (=> start!89442 true))

(declare-fun e!578345 () Bool)

(declare-fun array_inv!24005 (array!64372) Bool)

(declare-fun array_inv!24006 (array!64374) Bool)

(assert (=> b!1025657 (= e!578346 (and tp!72369 tp_is_empty!24161 (array_inv!24005 (_keys!11173 thiss!1427)) (array_inv!24006 (_values!6049 thiss!1427)) e!578345))))

(declare-fun b!1025658 () Bool)

(declare-fun res!686671 () Bool)

(assert (=> b!1025658 (=> res!686671 e!578348)))

(assert (=> b!1025658 (= res!686671 (or (not (= (size!31508 (_keys!11173 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29700 thiss!1427)))) (bvslt (index!40872 lt!451037) #b00000000000000000000000000000000) (bvsge (index!40872 lt!451037) (size!31508 (_keys!11173 thiss!1427)))))))

(declare-fun b!1025659 () Bool)

(declare-fun res!686670 () Bool)

(assert (=> b!1025659 (=> (not res!686670) (not e!578347))))

(assert (=> b!1025659 (= res!686670 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025660 () Bool)

(assert (=> b!1025660 (= e!578345 (and e!578344 mapRes!37670))))

(declare-fun condMapEmpty!37670 () Bool)

(declare-fun mapDefault!37670 () ValueCell!11377)

