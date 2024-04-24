; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89774 () Bool)

(assert start!89774)

(declare-fun b!1028354 () Bool)

(declare-fun b_free!20539 () Bool)

(declare-fun b_next!20539 () Bool)

(assert (=> b!1028354 (= b_free!20539 (not b_next!20539))))

(declare-fun tp!72662 () Bool)

(declare-fun b_and!32795 () Bool)

(assert (=> b!1028354 (= tp!72662 b_and!32795)))

(declare-fun b!1028346 () Bool)

(declare-fun e!580366 () Bool)

(declare-fun e!580367 () Bool)

(declare-fun mapRes!37817 () Bool)

(assert (=> b!1028346 (= e!580366 (and e!580367 mapRes!37817))))

(declare-fun condMapEmpty!37817 () Bool)

(declare-datatypes ((V!37219 0))(
  ( (V!37220 (val!12180 Int)) )
))
(declare-datatypes ((ValueCell!11426 0))(
  ( (ValueCellFull!11426 (v!14745 V!37219)) (EmptyCell!11426) )
))
(declare-datatypes ((array!64617 0))(
  ( (array!64618 (arr!31111 (Array (_ BitVec 32) (_ BitVec 64))) (size!31625 (_ BitVec 32))) )
))
(declare-datatypes ((array!64619 0))(
  ( (array!64620 (arr!31112 (Array (_ BitVec 32) ValueCell!11426)) (size!31626 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5446 0))(
  ( (LongMapFixedSize!5447 (defaultEntry!6075 Int) (mask!29843 (_ BitVec 32)) (extraKeys!5807 (_ BitVec 32)) (zeroValue!5911 V!37219) (minValue!5911 V!37219) (_size!2778 (_ BitVec 32)) (_keys!11260 array!64617) (_values!6098 array!64619) (_vacant!2778 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5446)

(declare-fun mapDefault!37817 () ValueCell!11426)

(assert (=> b!1028346 (= condMapEmpty!37817 (= (arr!31112 (_values!6098 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11426)) mapDefault!37817)))))

(declare-fun b!1028347 () Bool)

(declare-fun res!687971 () Bool)

(declare-fun e!580369 () Bool)

(assert (=> b!1028347 (=> res!687971 e!580369)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64617 (_ BitVec 32)) Bool)

(assert (=> b!1028347 (= res!687971 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11260 thiss!1427) (mask!29843 thiss!1427))))))

(declare-fun b!1028348 () Bool)

(declare-fun tp_is_empty!24259 () Bool)

(assert (=> b!1028348 (= e!580367 tp_is_empty!24259)))

(declare-fun mapIsEmpty!37817 () Bool)

(assert (=> mapIsEmpty!37817 mapRes!37817))

(declare-fun b!1028349 () Bool)

(assert (=> b!1028349 (= e!580369 true)))

(declare-fun lt!452490 () Bool)

(declare-datatypes ((List!21782 0))(
  ( (Nil!21779) (Cons!21778 (h!22985 (_ BitVec 64)) (t!30836 List!21782)) )
))
(declare-fun arrayNoDuplicates!0 (array!64617 (_ BitVec 32) List!21782) Bool)

(assert (=> b!1028349 (= lt!452490 (arrayNoDuplicates!0 (_keys!11260 thiss!1427) #b00000000000000000000000000000000 Nil!21779))))

(declare-fun b!1028350 () Bool)

(declare-fun e!580362 () Bool)

(assert (=> b!1028350 (= e!580362 tp_is_empty!24259)))

(declare-fun res!687970 () Bool)

(declare-fun e!580363 () Bool)

(assert (=> start!89774 (=> (not res!687970) (not e!580363))))

(declare-fun valid!2072 (LongMapFixedSize!5446) Bool)

(assert (=> start!89774 (= res!687970 (valid!2072 thiss!1427))))

(assert (=> start!89774 e!580363))

(declare-fun e!580364 () Bool)

(assert (=> start!89774 e!580364))

(assert (=> start!89774 true))

(declare-fun b!1028351 () Bool)

(declare-fun res!687974 () Bool)

(assert (=> b!1028351 (=> (not res!687974) (not e!580363))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1028351 (= res!687974 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1028352 () Bool)

(declare-fun res!687972 () Bool)

(assert (=> b!1028352 (=> res!687972 e!580369)))

(assert (=> b!1028352 (= res!687972 (or (not (= (size!31626 (_values!6098 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29843 thiss!1427)))) (not (= (size!31625 (_keys!11260 thiss!1427)) (size!31626 (_values!6098 thiss!1427)))) (bvslt (mask!29843 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5807 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5807 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1028353 () Bool)

(declare-fun e!580365 () Bool)

(assert (=> b!1028353 (= e!580365 (not e!580369))))

(declare-fun res!687969 () Bool)

(assert (=> b!1028353 (=> res!687969 e!580369)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028353 (= res!687969 (not (validMask!0 (mask!29843 thiss!1427))))))

(declare-fun lt!452491 () array!64617)

(declare-fun arrayContainsKey!0 (array!64617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028353 (not (arrayContainsKey!0 lt!452491 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9617 0))(
  ( (MissingZero!9617 (index!40839 (_ BitVec 32))) (Found!9617 (index!40840 (_ BitVec 32))) (Intermediate!9617 (undefined!10429 Bool) (index!40841 (_ BitVec 32)) (x!91357 (_ BitVec 32))) (Undefined!9617) (MissingVacant!9617 (index!40842 (_ BitVec 32))) )
))
(declare-fun lt!452487 () SeekEntryResult!9617)

(declare-datatypes ((Unit!33476 0))(
  ( (Unit!33477) )
))
(declare-fun lt!452486 () Unit!33476)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64617 (_ BitVec 32) (_ BitVec 64)) Unit!33476)

(assert (=> b!1028353 (= lt!452486 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11260 thiss!1427) (index!40840 lt!452487) key!909))))

(assert (=> b!1028353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452491 (mask!29843 thiss!1427))))

(declare-fun lt!452492 () Unit!33476)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64617 (_ BitVec 32) (_ BitVec 32)) Unit!33476)

(assert (=> b!1028353 (= lt!452492 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11260 thiss!1427) (index!40840 lt!452487) (mask!29843 thiss!1427)))))

(assert (=> b!1028353 (arrayNoDuplicates!0 lt!452491 #b00000000000000000000000000000000 Nil!21779)))

(declare-fun lt!452488 () Unit!33476)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64617 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21782) Unit!33476)

(assert (=> b!1028353 (= lt!452488 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11260 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40840 lt!452487) #b00000000000000000000000000000000 Nil!21779))))

(declare-fun arrayCountValidKeys!0 (array!64617 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028353 (= (arrayCountValidKeys!0 lt!452491 #b00000000000000000000000000000000 (size!31625 (_keys!11260 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11260 thiss!1427) #b00000000000000000000000000000000 (size!31625 (_keys!11260 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028353 (= lt!452491 (array!64618 (store (arr!31111 (_keys!11260 thiss!1427)) (index!40840 lt!452487) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31625 (_keys!11260 thiss!1427))))))

(declare-fun lt!452489 () Unit!33476)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64617 (_ BitVec 32) (_ BitVec 64)) Unit!33476)

(assert (=> b!1028353 (= lt!452489 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11260 thiss!1427) (index!40840 lt!452487) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!24101 (array!64617) Bool)

(declare-fun array_inv!24102 (array!64619) Bool)

(assert (=> b!1028354 (= e!580364 (and tp!72662 tp_is_empty!24259 (array_inv!24101 (_keys!11260 thiss!1427)) (array_inv!24102 (_values!6098 thiss!1427)) e!580366))))

(declare-fun b!1028355 () Bool)

(assert (=> b!1028355 (= e!580363 e!580365)))

(declare-fun res!687973 () Bool)

(assert (=> b!1028355 (=> (not res!687973) (not e!580365))))

(get-info :version)

(assert (=> b!1028355 (= res!687973 ((_ is Found!9617) lt!452487))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64617 (_ BitVec 32)) SeekEntryResult!9617)

(assert (=> b!1028355 (= lt!452487 (seekEntry!0 key!909 (_keys!11260 thiss!1427) (mask!29843 thiss!1427)))))

(declare-fun mapNonEmpty!37817 () Bool)

(declare-fun tp!72663 () Bool)

(assert (=> mapNonEmpty!37817 (= mapRes!37817 (and tp!72663 e!580362))))

(declare-fun mapValue!37817 () ValueCell!11426)

(declare-fun mapKey!37817 () (_ BitVec 32))

(declare-fun mapRest!37817 () (Array (_ BitVec 32) ValueCell!11426))

(assert (=> mapNonEmpty!37817 (= (arr!31112 (_values!6098 thiss!1427)) (store mapRest!37817 mapKey!37817 mapValue!37817))))

(assert (= (and start!89774 res!687970) b!1028351))

(assert (= (and b!1028351 res!687974) b!1028355))

(assert (= (and b!1028355 res!687973) b!1028353))

(assert (= (and b!1028353 (not res!687969)) b!1028352))

(assert (= (and b!1028352 (not res!687972)) b!1028347))

(assert (= (and b!1028347 (not res!687971)) b!1028349))

(assert (= (and b!1028346 condMapEmpty!37817) mapIsEmpty!37817))

(assert (= (and b!1028346 (not condMapEmpty!37817)) mapNonEmpty!37817))

(assert (= (and mapNonEmpty!37817 ((_ is ValueCellFull!11426) mapValue!37817)) b!1028350))

(assert (= (and b!1028346 ((_ is ValueCellFull!11426) mapDefault!37817)) b!1028348))

(assert (= b!1028354 b!1028346))

(assert (= start!89774 b!1028354))

(declare-fun m!947079 () Bool)

(assert (=> start!89774 m!947079))

(declare-fun m!947081 () Bool)

(assert (=> mapNonEmpty!37817 m!947081))

(declare-fun m!947083 () Bool)

(assert (=> b!1028354 m!947083))

(declare-fun m!947085 () Bool)

(assert (=> b!1028354 m!947085))

(declare-fun m!947087 () Bool)

(assert (=> b!1028349 m!947087))

(declare-fun m!947089 () Bool)

(assert (=> b!1028353 m!947089))

(declare-fun m!947091 () Bool)

(assert (=> b!1028353 m!947091))

(declare-fun m!947093 () Bool)

(assert (=> b!1028353 m!947093))

(declare-fun m!947095 () Bool)

(assert (=> b!1028353 m!947095))

(declare-fun m!947097 () Bool)

(assert (=> b!1028353 m!947097))

(declare-fun m!947099 () Bool)

(assert (=> b!1028353 m!947099))

(declare-fun m!947101 () Bool)

(assert (=> b!1028353 m!947101))

(declare-fun m!947103 () Bool)

(assert (=> b!1028353 m!947103))

(declare-fun m!947105 () Bool)

(assert (=> b!1028353 m!947105))

(declare-fun m!947107 () Bool)

(assert (=> b!1028353 m!947107))

(declare-fun m!947109 () Bool)

(assert (=> b!1028353 m!947109))

(declare-fun m!947111 () Bool)

(assert (=> b!1028347 m!947111))

(declare-fun m!947113 () Bool)

(assert (=> b!1028355 m!947113))

(check-sat (not b!1028354) (not start!89774) (not b!1028355) tp_is_empty!24259 (not b!1028353) (not b!1028347) (not mapNonEmpty!37817) (not b_next!20539) (not b!1028349) b_and!32795)
(check-sat b_and!32795 (not b_next!20539))
