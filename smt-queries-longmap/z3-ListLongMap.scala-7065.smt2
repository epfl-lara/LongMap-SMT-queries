; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89678 () Bool)

(assert start!89678)

(declare-fun b!1027001 () Bool)

(declare-fun b_free!20443 () Bool)

(declare-fun b_next!20443 () Bool)

(assert (=> b!1027001 (= b_free!20443 (not b_next!20443))))

(declare-fun tp!72374 () Bool)

(declare-fun b_and!32699 () Bool)

(assert (=> b!1027001 (= tp!72374 b_and!32699)))

(declare-fun b!1026998 () Bool)

(declare-fun e!579212 () Bool)

(declare-fun tp_is_empty!24163 () Bool)

(assert (=> b!1026998 (= e!579212 tp_is_empty!24163)))

(declare-fun b!1026999 () Bool)

(declare-fun e!579214 () Bool)

(declare-fun e!579210 () Bool)

(assert (=> b!1026999 (= e!579214 (not e!579210))))

(declare-fun res!687200 () Bool)

(assert (=> b!1026999 (=> res!687200 e!579210)))

(declare-datatypes ((V!37091 0))(
  ( (V!37092 (val!12132 Int)) )
))
(declare-datatypes ((ValueCell!11378 0))(
  ( (ValueCellFull!11378 (v!14697 V!37091)) (EmptyCell!11378) )
))
(declare-datatypes ((array!64425 0))(
  ( (array!64426 (arr!31015 (Array (_ BitVec 32) (_ BitVec 64))) (size!31529 (_ BitVec 32))) )
))
(declare-datatypes ((array!64427 0))(
  ( (array!64428 (arr!31016 (Array (_ BitVec 32) ValueCell!11378)) (size!31530 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5350 0))(
  ( (LongMapFixedSize!5351 (defaultEntry!6027 Int) (mask!29763 (_ BitVec 32)) (extraKeys!5759 (_ BitVec 32)) (zeroValue!5863 V!37091) (minValue!5863 V!37091) (_size!2730 (_ BitVec 32)) (_keys!11212 array!64425) (_values!6050 array!64427) (_vacant!2730 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5350)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026999 (= res!687200 (not (validMask!0 (mask!29763 thiss!1427))))))

(declare-fun lt!451564 () array!64425)

(declare-datatypes ((List!21745 0))(
  ( (Nil!21742) (Cons!21741 (h!22948 (_ BitVec 64)) (t!30799 List!21745)) )
))
(declare-fun arrayNoDuplicates!0 (array!64425 (_ BitVec 32) List!21745) Bool)

(assert (=> b!1026999 (arrayNoDuplicates!0 lt!451564 #b00000000000000000000000000000000 Nil!21742)))

(declare-datatypes ((Unit!33410 0))(
  ( (Unit!33411) )
))
(declare-fun lt!451565 () Unit!33410)

(declare-datatypes ((SeekEntryResult!9580 0))(
  ( (MissingZero!9580 (index!40691 (_ BitVec 32))) (Found!9580 (index!40692 (_ BitVec 32))) (Intermediate!9580 (undefined!10392 Bool) (index!40693 (_ BitVec 32)) (x!91192 (_ BitVec 32))) (Undefined!9580) (MissingVacant!9580 (index!40694 (_ BitVec 32))) )
))
(declare-fun lt!451567 () SeekEntryResult!9580)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64425 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21745) Unit!33410)

(assert (=> b!1026999 (= lt!451565 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11212 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40692 lt!451567) #b00000000000000000000000000000000 Nil!21742))))

(declare-fun arrayCountValidKeys!0 (array!64425 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026999 (= (arrayCountValidKeys!0 lt!451564 #b00000000000000000000000000000000 (size!31529 (_keys!11212 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11212 thiss!1427) #b00000000000000000000000000000000 (size!31529 (_keys!11212 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026999 (= lt!451564 (array!64426 (store (arr!31015 (_keys!11212 thiss!1427)) (index!40692 lt!451567) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31529 (_keys!11212 thiss!1427))))))

(declare-fun lt!451566 () Unit!33410)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64425 (_ BitVec 32) (_ BitVec 64)) Unit!33410)

(assert (=> b!1026999 (= lt!451566 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11212 thiss!1427) (index!40692 lt!451567) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1027000 () Bool)

(declare-fun res!687202 () Bool)

(assert (=> b!1027000 (=> res!687202 e!579210)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1027000 (= res!687202 (not (validKeyInArray!0 (select (arr!31015 (_keys!11212 thiss!1427)) (index!40692 lt!451567)))))))

(declare-fun e!579217 () Bool)

(declare-fun e!579213 () Bool)

(declare-fun array_inv!24039 (array!64425) Bool)

(declare-fun array_inv!24040 (array!64427) Bool)

(assert (=> b!1027001 (= e!579213 (and tp!72374 tp_is_empty!24163 (array_inv!24039 (_keys!11212 thiss!1427)) (array_inv!24040 (_values!6050 thiss!1427)) e!579217))))

(declare-fun mapIsEmpty!37673 () Bool)

(declare-fun mapRes!37673 () Bool)

(assert (=> mapIsEmpty!37673 mapRes!37673))

(declare-fun b!1027002 () Bool)

(declare-fun res!687198 () Bool)

(declare-fun e!579216 () Bool)

(assert (=> b!1027002 (=> (not res!687198) (not e!579216))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027002 (= res!687198 (not (= key!909 (bvneg key!909))))))

(declare-fun res!687201 () Bool)

(assert (=> start!89678 (=> (not res!687201) (not e!579216))))

(declare-fun valid!2039 (LongMapFixedSize!5350) Bool)

(assert (=> start!89678 (= res!687201 (valid!2039 thiss!1427))))

(assert (=> start!89678 e!579216))

(assert (=> start!89678 e!579213))

(assert (=> start!89678 true))

(declare-fun b!1027003 () Bool)

(declare-fun res!687197 () Bool)

(assert (=> b!1027003 (=> res!687197 e!579210)))

(assert (=> b!1027003 (= res!687197 (not (arrayNoDuplicates!0 (_keys!11212 thiss!1427) #b00000000000000000000000000000000 Nil!21742)))))

(declare-fun b!1027004 () Bool)

(assert (=> b!1027004 (= e!579210 true)))

(declare-fun lt!451568 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64425 (_ BitVec 32)) Bool)

(assert (=> b!1027004 (= lt!451568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11212 thiss!1427) (mask!29763 thiss!1427)))))

(declare-fun b!1027005 () Bool)

(declare-fun e!579211 () Bool)

(assert (=> b!1027005 (= e!579211 tp_is_empty!24163)))

(declare-fun b!1027006 () Bool)

(declare-fun res!687203 () Bool)

(assert (=> b!1027006 (=> res!687203 e!579210)))

(assert (=> b!1027006 (= res!687203 (or (not (= (size!31529 (_keys!11212 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29763 thiss!1427)))) (bvslt (index!40692 lt!451567) #b00000000000000000000000000000000) (bvsge (index!40692 lt!451567) (size!31529 (_keys!11212 thiss!1427)))))))

(declare-fun b!1027007 () Bool)

(assert (=> b!1027007 (= e!579217 (and e!579211 mapRes!37673))))

(declare-fun condMapEmpty!37673 () Bool)

(declare-fun mapDefault!37673 () ValueCell!11378)

(assert (=> b!1027007 (= condMapEmpty!37673 (= (arr!31016 (_values!6050 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11378)) mapDefault!37673)))))

(declare-fun mapNonEmpty!37673 () Bool)

(declare-fun tp!72375 () Bool)

(assert (=> mapNonEmpty!37673 (= mapRes!37673 (and tp!72375 e!579212))))

(declare-fun mapValue!37673 () ValueCell!11378)

(declare-fun mapRest!37673 () (Array (_ BitVec 32) ValueCell!11378))

(declare-fun mapKey!37673 () (_ BitVec 32))

(assert (=> mapNonEmpty!37673 (= (arr!31016 (_values!6050 thiss!1427)) (store mapRest!37673 mapKey!37673 mapValue!37673))))

(declare-fun b!1027008 () Bool)

(assert (=> b!1027008 (= e!579216 e!579214)))

(declare-fun res!687199 () Bool)

(assert (=> b!1027008 (=> (not res!687199) (not e!579214))))

(get-info :version)

(assert (=> b!1027008 (= res!687199 ((_ is Found!9580) lt!451567))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64425 (_ BitVec 32)) SeekEntryResult!9580)

(assert (=> b!1027008 (= lt!451567 (seekEntry!0 key!909 (_keys!11212 thiss!1427) (mask!29763 thiss!1427)))))

(assert (= (and start!89678 res!687201) b!1027002))

(assert (= (and b!1027002 res!687198) b!1027008))

(assert (= (and b!1027008 res!687199) b!1026999))

(assert (= (and b!1026999 (not res!687200)) b!1027006))

(assert (= (and b!1027006 (not res!687203)) b!1027000))

(assert (= (and b!1027000 (not res!687202)) b!1027003))

(assert (= (and b!1027003 (not res!687197)) b!1027004))

(assert (= (and b!1027007 condMapEmpty!37673) mapIsEmpty!37673))

(assert (= (and b!1027007 (not condMapEmpty!37673)) mapNonEmpty!37673))

(assert (= (and mapNonEmpty!37673 ((_ is ValueCellFull!11378) mapValue!37673)) b!1026998))

(assert (= (and b!1027007 ((_ is ValueCellFull!11378) mapDefault!37673)) b!1027005))

(assert (= b!1027001 b!1027007))

(assert (= start!89678 b!1027001))

(declare-fun m!945519 () Bool)

(assert (=> start!89678 m!945519))

(declare-fun m!945521 () Bool)

(assert (=> b!1027003 m!945521))

(declare-fun m!945523 () Bool)

(assert (=> b!1026999 m!945523))

(declare-fun m!945525 () Bool)

(assert (=> b!1026999 m!945525))

(declare-fun m!945527 () Bool)

(assert (=> b!1026999 m!945527))

(declare-fun m!945529 () Bool)

(assert (=> b!1026999 m!945529))

(declare-fun m!945531 () Bool)

(assert (=> b!1026999 m!945531))

(declare-fun m!945533 () Bool)

(assert (=> b!1026999 m!945533))

(declare-fun m!945535 () Bool)

(assert (=> b!1026999 m!945535))

(declare-fun m!945537 () Bool)

(assert (=> b!1027004 m!945537))

(declare-fun m!945539 () Bool)

(assert (=> mapNonEmpty!37673 m!945539))

(declare-fun m!945541 () Bool)

(assert (=> b!1027000 m!945541))

(assert (=> b!1027000 m!945541))

(declare-fun m!945543 () Bool)

(assert (=> b!1027000 m!945543))

(declare-fun m!945545 () Bool)

(assert (=> b!1027001 m!945545))

(declare-fun m!945547 () Bool)

(assert (=> b!1027001 m!945547))

(declare-fun m!945549 () Bool)

(assert (=> b!1027008 m!945549))

(check-sat (not b_next!20443) tp_is_empty!24163 (not start!89678) (not b!1027003) (not mapNonEmpty!37673) (not b!1027008) (not b!1027004) b_and!32699 (not b!1026999) (not b!1027000) (not b!1027001))
(check-sat b_and!32699 (not b_next!20443))
