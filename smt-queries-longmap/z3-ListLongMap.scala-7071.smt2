; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89714 () Bool)

(assert start!89714)

(declare-fun b!1027485 () Bool)

(declare-fun b_free!20479 () Bool)

(declare-fun b_next!20479 () Bool)

(assert (=> b!1027485 (= b_free!20479 (not b_next!20479))))

(declare-fun tp!72483 () Bool)

(declare-fun b_and!32735 () Bool)

(assert (=> b!1027485 (= tp!72483 b_and!32735)))

(declare-fun res!687462 () Bool)

(declare-fun e!579648 () Bool)

(assert (=> start!89714 (=> (not res!687462) (not e!579648))))

(declare-datatypes ((V!37139 0))(
  ( (V!37140 (val!12150 Int)) )
))
(declare-datatypes ((ValueCell!11396 0))(
  ( (ValueCellFull!11396 (v!14715 V!37139)) (EmptyCell!11396) )
))
(declare-datatypes ((array!64497 0))(
  ( (array!64498 (arr!31051 (Array (_ BitVec 32) (_ BitVec 64))) (size!31565 (_ BitVec 32))) )
))
(declare-datatypes ((array!64499 0))(
  ( (array!64500 (arr!31052 (Array (_ BitVec 32) ValueCell!11396)) (size!31566 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5386 0))(
  ( (LongMapFixedSize!5387 (defaultEntry!6045 Int) (mask!29793 (_ BitVec 32)) (extraKeys!5777 (_ BitVec 32)) (zeroValue!5881 V!37139) (minValue!5881 V!37139) (_size!2748 (_ BitVec 32)) (_keys!11230 array!64497) (_values!6068 array!64499) (_vacant!2748 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5386)

(declare-fun valid!2054 (LongMapFixedSize!5386) Bool)

(assert (=> start!89714 (= res!687462 (valid!2054 thiss!1427))))

(assert (=> start!89714 e!579648))

(declare-fun e!579645 () Bool)

(assert (=> start!89714 e!579645))

(assert (=> start!89714 true))

(declare-fun b!1027478 () Bool)

(declare-fun e!579647 () Bool)

(declare-fun tp_is_empty!24199 () Bool)

(assert (=> b!1027478 (= e!579647 tp_is_empty!24199)))

(declare-fun b!1027479 () Bool)

(declare-fun e!579643 () Bool)

(declare-fun mapRes!37727 () Bool)

(assert (=> b!1027479 (= e!579643 (and e!579647 mapRes!37727))))

(declare-fun condMapEmpty!37727 () Bool)

(declare-fun mapDefault!37727 () ValueCell!11396)

(assert (=> b!1027479 (= condMapEmpty!37727 (= (arr!31052 (_values!6068 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11396)) mapDefault!37727)))))

(declare-fun b!1027480 () Bool)

(declare-fun res!687463 () Bool)

(assert (=> b!1027480 (=> (not res!687463) (not e!579648))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1027480 (= res!687463 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027481 () Bool)

(declare-fun e!579644 () Bool)

(assert (=> b!1027481 (= e!579644 true)))

(declare-fun lt!451875 () Bool)

(declare-datatypes ((List!21761 0))(
  ( (Nil!21758) (Cons!21757 (h!22964 (_ BitVec 64)) (t!30815 List!21761)) )
))
(declare-fun arrayNoDuplicates!0 (array!64497 (_ BitVec 32) List!21761) Bool)

(assert (=> b!1027481 (= lt!451875 (arrayNoDuplicates!0 (_keys!11230 thiss!1427) #b00000000000000000000000000000000 Nil!21758))))

(declare-fun b!1027482 () Bool)

(declare-fun e!579649 () Bool)

(assert (=> b!1027482 (= e!579648 e!579649)))

(declare-fun res!687461 () Bool)

(assert (=> b!1027482 (=> (not res!687461) (not e!579649))))

(declare-datatypes ((SeekEntryResult!9595 0))(
  ( (MissingZero!9595 (index!40751 (_ BitVec 32))) (Found!9595 (index!40752 (_ BitVec 32))) (Intermediate!9595 (undefined!10407 Bool) (index!40753 (_ BitVec 32)) (x!91255 (_ BitVec 32))) (Undefined!9595) (MissingVacant!9595 (index!40754 (_ BitVec 32))) )
))
(declare-fun lt!451877 () SeekEntryResult!9595)

(get-info :version)

(assert (=> b!1027482 (= res!687461 ((_ is Found!9595) lt!451877))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64497 (_ BitVec 32)) SeekEntryResult!9595)

(assert (=> b!1027482 (= lt!451877 (seekEntry!0 key!909 (_keys!11230 thiss!1427) (mask!29793 thiss!1427)))))

(declare-fun b!1027483 () Bool)

(declare-fun e!579646 () Bool)

(assert (=> b!1027483 (= e!579646 tp_is_empty!24199)))

(declare-fun b!1027484 () Bool)

(assert (=> b!1027484 (= e!579649 (not e!579644))))

(declare-fun res!687464 () Bool)

(assert (=> b!1027484 (=> res!687464 e!579644)))

(assert (=> b!1027484 (= res!687464 (or (bvslt (index!40752 lt!451877) #b00000000000000000000000000000000) (bvsge (index!40752 lt!451877) (size!31565 (_keys!11230 thiss!1427))) (bvsge (size!31565 (_keys!11230 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451876 () array!64497)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64497 (_ BitVec 32)) Bool)

(assert (=> b!1027484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451876 (mask!29793 thiss!1427))))

(declare-datatypes ((Unit!33438 0))(
  ( (Unit!33439) )
))
(declare-fun lt!451873 () Unit!33438)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64497 (_ BitVec 32) (_ BitVec 32)) Unit!33438)

(assert (=> b!1027484 (= lt!451873 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11230 thiss!1427) (index!40752 lt!451877) (mask!29793 thiss!1427)))))

(assert (=> b!1027484 (arrayNoDuplicates!0 lt!451876 #b00000000000000000000000000000000 Nil!21758)))

(declare-fun lt!451872 () Unit!33438)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64497 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21761) Unit!33438)

(assert (=> b!1027484 (= lt!451872 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11230 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40752 lt!451877) #b00000000000000000000000000000000 Nil!21758))))

(declare-fun arrayCountValidKeys!0 (array!64497 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027484 (= (arrayCountValidKeys!0 lt!451876 #b00000000000000000000000000000000 (size!31565 (_keys!11230 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11230 thiss!1427) #b00000000000000000000000000000000 (size!31565 (_keys!11230 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027484 (= lt!451876 (array!64498 (store (arr!31051 (_keys!11230 thiss!1427)) (index!40752 lt!451877) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31565 (_keys!11230 thiss!1427))))))

(declare-fun lt!451874 () Unit!33438)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64497 (_ BitVec 32) (_ BitVec 64)) Unit!33438)

(assert (=> b!1027484 (= lt!451874 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11230 thiss!1427) (index!40752 lt!451877) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37727 () Bool)

(declare-fun tp!72482 () Bool)

(assert (=> mapNonEmpty!37727 (= mapRes!37727 (and tp!72482 e!579646))))

(declare-fun mapKey!37727 () (_ BitVec 32))

(declare-fun mapValue!37727 () ValueCell!11396)

(declare-fun mapRest!37727 () (Array (_ BitVec 32) ValueCell!11396))

(assert (=> mapNonEmpty!37727 (= (arr!31052 (_values!6068 thiss!1427)) (store mapRest!37727 mapKey!37727 mapValue!37727))))

(declare-fun array_inv!24067 (array!64497) Bool)

(declare-fun array_inv!24068 (array!64499) Bool)

(assert (=> b!1027485 (= e!579645 (and tp!72483 tp_is_empty!24199 (array_inv!24067 (_keys!11230 thiss!1427)) (array_inv!24068 (_values!6068 thiss!1427)) e!579643))))

(declare-fun mapIsEmpty!37727 () Bool)

(assert (=> mapIsEmpty!37727 mapRes!37727))

(assert (= (and start!89714 res!687462) b!1027480))

(assert (= (and b!1027480 res!687463) b!1027482))

(assert (= (and b!1027482 res!687461) b!1027484))

(assert (= (and b!1027484 (not res!687464)) b!1027481))

(assert (= (and b!1027479 condMapEmpty!37727) mapIsEmpty!37727))

(assert (= (and b!1027479 (not condMapEmpty!37727)) mapNonEmpty!37727))

(assert (= (and mapNonEmpty!37727 ((_ is ValueCellFull!11396) mapValue!37727)) b!1027483))

(assert (= (and b!1027479 ((_ is ValueCellFull!11396) mapDefault!37727)) b!1027478))

(assert (= b!1027485 b!1027479))

(assert (= start!89714 b!1027485))

(declare-fun m!946047 () Bool)

(assert (=> b!1027482 m!946047))

(declare-fun m!946049 () Bool)

(assert (=> b!1027484 m!946049))

(declare-fun m!946051 () Bool)

(assert (=> b!1027484 m!946051))

(declare-fun m!946053 () Bool)

(assert (=> b!1027484 m!946053))

(declare-fun m!946055 () Bool)

(assert (=> b!1027484 m!946055))

(declare-fun m!946057 () Bool)

(assert (=> b!1027484 m!946057))

(declare-fun m!946059 () Bool)

(assert (=> b!1027484 m!946059))

(declare-fun m!946061 () Bool)

(assert (=> b!1027484 m!946061))

(declare-fun m!946063 () Bool)

(assert (=> b!1027484 m!946063))

(declare-fun m!946065 () Bool)

(assert (=> start!89714 m!946065))

(declare-fun m!946067 () Bool)

(assert (=> mapNonEmpty!37727 m!946067))

(declare-fun m!946069 () Bool)

(assert (=> b!1027481 m!946069))

(declare-fun m!946071 () Bool)

(assert (=> b!1027485 m!946071))

(declare-fun m!946073 () Bool)

(assert (=> b!1027485 m!946073))

(check-sat (not b!1027485) (not mapNonEmpty!37727) tp_is_empty!24199 (not start!89714) b_and!32735 (not b_next!20479) (not b!1027484) (not b!1027481) (not b!1027482))
(check-sat b_and!32735 (not b_next!20479))
