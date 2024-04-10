; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89488 () Bool)

(assert start!89488)

(declare-fun b!1026260 () Bool)

(declare-fun b_free!20487 () Bool)

(declare-fun b_next!20487 () Bool)

(assert (=> b!1026260 (= b_free!20487 (not b_next!20487))))

(declare-fun tp!72506 () Bool)

(declare-fun b_and!32733 () Bool)

(assert (=> b!1026260 (= tp!72506 b_and!32733)))

(declare-fun b!1026259 () Bool)

(declare-fun e!578897 () Bool)

(assert (=> b!1026259 (= e!578897 true)))

(declare-fun lt!451433 () Bool)

(declare-datatypes ((V!37149 0))(
  ( (V!37150 (val!12154 Int)) )
))
(declare-datatypes ((ValueCell!11400 0))(
  ( (ValueCellFull!11400 (v!14723 V!37149)) (EmptyCell!11400) )
))
(declare-datatypes ((array!64464 0))(
  ( (array!64465 (arr!31041 (Array (_ BitVec 32) (_ BitVec 64))) (size!31554 (_ BitVec 32))) )
))
(declare-datatypes ((array!64466 0))(
  ( (array!64467 (arr!31042 (Array (_ BitVec 32) ValueCell!11400)) (size!31555 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5394 0))(
  ( (LongMapFixedSize!5395 (defaultEntry!6049 Int) (mask!29739 (_ BitVec 32)) (extraKeys!5781 (_ BitVec 32)) (zeroValue!5885 V!37149) (minValue!5885 V!37149) (_size!2752 (_ BitVec 32)) (_keys!11196 array!64464) (_values!6072 array!64466) (_vacant!2752 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5394)

(declare-datatypes ((List!21775 0))(
  ( (Nil!21772) (Cons!21771 (h!22969 (_ BitVec 64)) (t!30837 List!21775)) )
))
(declare-fun arrayNoDuplicates!0 (array!64464 (_ BitVec 32) List!21775) Bool)

(assert (=> b!1026259 (= lt!451433 (arrayNoDuplicates!0 (_keys!11196 thiss!1427) #b00000000000000000000000000000000 Nil!21772))))

(declare-fun b!1026261 () Bool)

(declare-fun e!578899 () Bool)

(declare-fun e!578898 () Bool)

(assert (=> b!1026261 (= e!578899 e!578898)))

(declare-fun res!687000 () Bool)

(assert (=> b!1026261 (=> (not res!687000) (not e!578898))))

(declare-datatypes ((SeekEntryResult!9643 0))(
  ( (MissingZero!9643 (index!40943 (_ BitVec 32))) (Found!9643 (index!40944 (_ BitVec 32))) (Intermediate!9643 (undefined!10455 Bool) (index!40945 (_ BitVec 32)) (x!91289 (_ BitVec 32))) (Undefined!9643) (MissingVacant!9643 (index!40946 (_ BitVec 32))) )
))
(declare-fun lt!451429 () SeekEntryResult!9643)

(get-info :version)

(assert (=> b!1026261 (= res!687000 ((_ is Found!9643) lt!451429))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64464 (_ BitVec 32)) SeekEntryResult!9643)

(assert (=> b!1026261 (= lt!451429 (seekEntry!0 key!909 (_keys!11196 thiss!1427) (mask!29739 thiss!1427)))))

(declare-fun b!1026262 () Bool)

(assert (=> b!1026262 (= e!578898 (not e!578897))))

(declare-fun res!686999 () Bool)

(assert (=> b!1026262 (=> res!686999 e!578897)))

(assert (=> b!1026262 (= res!686999 (or (bvslt (index!40944 lt!451429) #b00000000000000000000000000000000) (bvsge (index!40944 lt!451429) (size!31554 (_keys!11196 thiss!1427))) (bvsge (size!31554 (_keys!11196 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451430 () array!64464)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64464 (_ BitVec 32)) Bool)

(assert (=> b!1026262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451430 (mask!29739 thiss!1427))))

(declare-datatypes ((Unit!33431 0))(
  ( (Unit!33432) )
))
(declare-fun lt!451432 () Unit!33431)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64464 (_ BitVec 32) (_ BitVec 32)) Unit!33431)

(assert (=> b!1026262 (= lt!451432 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11196 thiss!1427) (index!40944 lt!451429) (mask!29739 thiss!1427)))))

(assert (=> b!1026262 (arrayNoDuplicates!0 lt!451430 #b00000000000000000000000000000000 Nil!21772)))

(declare-fun lt!451434 () Unit!33431)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64464 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21775) Unit!33431)

(assert (=> b!1026262 (= lt!451434 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11196 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40944 lt!451429) #b00000000000000000000000000000000 Nil!21772))))

(declare-fun arrayCountValidKeys!0 (array!64464 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026262 (= (arrayCountValidKeys!0 lt!451430 #b00000000000000000000000000000000 (size!31554 (_keys!11196 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11196 thiss!1427) #b00000000000000000000000000000000 (size!31554 (_keys!11196 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026262 (= lt!451430 (array!64465 (store (arr!31041 (_keys!11196 thiss!1427)) (index!40944 lt!451429) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31554 (_keys!11196 thiss!1427))))))

(declare-fun lt!451431 () Unit!33431)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64464 (_ BitVec 32) (_ BitVec 64)) Unit!33431)

(assert (=> b!1026262 (= lt!451431 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11196 thiss!1427) (index!40944 lt!451429) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37739 () Bool)

(declare-fun mapRes!37739 () Bool)

(declare-fun tp!72507 () Bool)

(declare-fun e!578901 () Bool)

(assert (=> mapNonEmpty!37739 (= mapRes!37739 (and tp!72507 e!578901))))

(declare-fun mapKey!37739 () (_ BitVec 32))

(declare-fun mapRest!37739 () (Array (_ BitVec 32) ValueCell!11400))

(declare-fun mapValue!37739 () ValueCell!11400)

(assert (=> mapNonEmpty!37739 (= (arr!31042 (_values!6072 thiss!1427)) (store mapRest!37739 mapKey!37739 mapValue!37739))))

(declare-fun b!1026263 () Bool)

(declare-fun e!578896 () Bool)

(declare-fun tp_is_empty!24207 () Bool)

(assert (=> b!1026263 (= e!578896 tp_is_empty!24207)))

(declare-fun b!1026264 () Bool)

(declare-fun res!687002 () Bool)

(assert (=> b!1026264 (=> (not res!687002) (not e!578899))))

(assert (=> b!1026264 (= res!687002 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026265 () Bool)

(assert (=> b!1026265 (= e!578901 tp_is_empty!24207)))

(declare-fun res!687001 () Bool)

(assert (=> start!89488 (=> (not res!687001) (not e!578899))))

(declare-fun valid!2049 (LongMapFixedSize!5394) Bool)

(assert (=> start!89488 (= res!687001 (valid!2049 thiss!1427))))

(assert (=> start!89488 e!578899))

(declare-fun e!578895 () Bool)

(assert (=> start!89488 e!578895))

(assert (=> start!89488 true))

(declare-fun e!578902 () Bool)

(declare-fun array_inv!24037 (array!64464) Bool)

(declare-fun array_inv!24038 (array!64466) Bool)

(assert (=> b!1026260 (= e!578895 (and tp!72506 tp_is_empty!24207 (array_inv!24037 (_keys!11196 thiss!1427)) (array_inv!24038 (_values!6072 thiss!1427)) e!578902))))

(declare-fun b!1026266 () Bool)

(assert (=> b!1026266 (= e!578902 (and e!578896 mapRes!37739))))

(declare-fun condMapEmpty!37739 () Bool)

(declare-fun mapDefault!37739 () ValueCell!11400)

(assert (=> b!1026266 (= condMapEmpty!37739 (= (arr!31042 (_values!6072 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11400)) mapDefault!37739)))))

(declare-fun mapIsEmpty!37739 () Bool)

(assert (=> mapIsEmpty!37739 mapRes!37739))

(assert (= (and start!89488 res!687001) b!1026264))

(assert (= (and b!1026264 res!687002) b!1026261))

(assert (= (and b!1026261 res!687000) b!1026262))

(assert (= (and b!1026262 (not res!686999)) b!1026259))

(assert (= (and b!1026266 condMapEmpty!37739) mapIsEmpty!37739))

(assert (= (and b!1026266 (not condMapEmpty!37739)) mapNonEmpty!37739))

(assert (= (and mapNonEmpty!37739 ((_ is ValueCellFull!11400) mapValue!37739)) b!1026265))

(assert (= (and b!1026266 ((_ is ValueCellFull!11400) mapDefault!37739)) b!1026263))

(assert (= b!1026260 b!1026266))

(assert (= start!89488 b!1026260))

(declare-fun m!944495 () Bool)

(assert (=> b!1026262 m!944495))

(declare-fun m!944497 () Bool)

(assert (=> b!1026262 m!944497))

(declare-fun m!944499 () Bool)

(assert (=> b!1026262 m!944499))

(declare-fun m!944501 () Bool)

(assert (=> b!1026262 m!944501))

(declare-fun m!944503 () Bool)

(assert (=> b!1026262 m!944503))

(declare-fun m!944505 () Bool)

(assert (=> b!1026262 m!944505))

(declare-fun m!944507 () Bool)

(assert (=> b!1026262 m!944507))

(declare-fun m!944509 () Bool)

(assert (=> b!1026262 m!944509))

(declare-fun m!944511 () Bool)

(assert (=> b!1026260 m!944511))

(declare-fun m!944513 () Bool)

(assert (=> b!1026260 m!944513))

(declare-fun m!944515 () Bool)

(assert (=> mapNonEmpty!37739 m!944515))

(declare-fun m!944517 () Bool)

(assert (=> start!89488 m!944517))

(declare-fun m!944519 () Bool)

(assert (=> b!1026261 m!944519))

(declare-fun m!944521 () Bool)

(assert (=> b!1026259 m!944521))

(check-sat (not b!1026259) (not b_next!20487) (not mapNonEmpty!37739) (not b!1026261) (not b!1026262) tp_is_empty!24207 b_and!32733 (not start!89488) (not b!1026260))
(check-sat b_and!32733 (not b_next!20487))
