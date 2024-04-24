; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89702 () Bool)

(assert start!89702)

(declare-fun b!1027337 () Bool)

(declare-fun b_free!20467 () Bool)

(declare-fun b_next!20467 () Bool)

(assert (=> b!1027337 (= b_free!20467 (not b_next!20467))))

(declare-fun tp!72446 () Bool)

(declare-fun b_and!32723 () Bool)

(assert (=> b!1027337 (= tp!72446 b_and!32723)))

(declare-fun b!1027334 () Bool)

(declare-fun e!579505 () Bool)

(assert (=> b!1027334 (= e!579505 true)))

(declare-fun lt!451769 () Bool)

(declare-datatypes ((V!37123 0))(
  ( (V!37124 (val!12144 Int)) )
))
(declare-datatypes ((ValueCell!11390 0))(
  ( (ValueCellFull!11390 (v!14709 V!37123)) (EmptyCell!11390) )
))
(declare-datatypes ((array!64473 0))(
  ( (array!64474 (arr!31039 (Array (_ BitVec 32) (_ BitVec 64))) (size!31553 (_ BitVec 32))) )
))
(declare-datatypes ((array!64475 0))(
  ( (array!64476 (arr!31040 (Array (_ BitVec 32) ValueCell!11390)) (size!31554 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5374 0))(
  ( (LongMapFixedSize!5375 (defaultEntry!6039 Int) (mask!29783 (_ BitVec 32)) (extraKeys!5771 (_ BitVec 32)) (zeroValue!5875 V!37123) (minValue!5875 V!37123) (_size!2742 (_ BitVec 32)) (_keys!11224 array!64473) (_values!6062 array!64475) (_vacant!2742 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5374)

(declare-datatypes ((List!21755 0))(
  ( (Nil!21752) (Cons!21751 (h!22958 (_ BitVec 64)) (t!30809 List!21755)) )
))
(declare-fun arrayNoDuplicates!0 (array!64473 (_ BitVec 32) List!21755) Bool)

(assert (=> b!1027334 (= lt!451769 (arrayNoDuplicates!0 (_keys!11224 thiss!1427) #b00000000000000000000000000000000 Nil!21752))))

(declare-fun b!1027335 () Bool)

(declare-fun e!579502 () Bool)

(declare-fun e!579500 () Bool)

(declare-fun mapRes!37709 () Bool)

(assert (=> b!1027335 (= e!579502 (and e!579500 mapRes!37709))))

(declare-fun condMapEmpty!37709 () Bool)

(declare-fun mapDefault!37709 () ValueCell!11390)

(assert (=> b!1027335 (= condMapEmpty!37709 (= (arr!31040 (_values!6062 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11390)) mapDefault!37709)))))

(declare-fun res!687390 () Bool)

(declare-fun e!579499 () Bool)

(assert (=> start!89702 (=> (not res!687390) (not e!579499))))

(declare-fun valid!2050 (LongMapFixedSize!5374) Bool)

(assert (=> start!89702 (= res!687390 (valid!2050 thiss!1427))))

(assert (=> start!89702 e!579499))

(declare-fun e!579501 () Bool)

(assert (=> start!89702 e!579501))

(assert (=> start!89702 true))

(declare-fun b!1027336 () Bool)

(declare-fun e!579498 () Bool)

(declare-fun tp_is_empty!24187 () Bool)

(assert (=> b!1027336 (= e!579498 tp_is_empty!24187)))

(declare-fun array_inv!24057 (array!64473) Bool)

(declare-fun array_inv!24058 (array!64475) Bool)

(assert (=> b!1027337 (= e!579501 (and tp!72446 tp_is_empty!24187 (array_inv!24057 (_keys!11224 thiss!1427)) (array_inv!24058 (_values!6062 thiss!1427)) e!579502))))

(declare-fun b!1027338 () Bool)

(declare-fun e!579503 () Bool)

(assert (=> b!1027338 (= e!579499 e!579503)))

(declare-fun res!687392 () Bool)

(assert (=> b!1027338 (=> (not res!687392) (not e!579503))))

(declare-datatypes ((SeekEntryResult!9590 0))(
  ( (MissingZero!9590 (index!40731 (_ BitVec 32))) (Found!9590 (index!40732 (_ BitVec 32))) (Intermediate!9590 (undefined!10402 Bool) (index!40733 (_ BitVec 32)) (x!91234 (_ BitVec 32))) (Undefined!9590) (MissingVacant!9590 (index!40734 (_ BitVec 32))) )
))
(declare-fun lt!451766 () SeekEntryResult!9590)

(get-info :version)

(assert (=> b!1027338 (= res!687392 ((_ is Found!9590) lt!451766))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64473 (_ BitVec 32)) SeekEntryResult!9590)

(assert (=> b!1027338 (= lt!451766 (seekEntry!0 key!909 (_keys!11224 thiss!1427) (mask!29783 thiss!1427)))))

(declare-fun mapNonEmpty!37709 () Bool)

(declare-fun tp!72447 () Bool)

(assert (=> mapNonEmpty!37709 (= mapRes!37709 (and tp!72447 e!579498))))

(declare-fun mapKey!37709 () (_ BitVec 32))

(declare-fun mapRest!37709 () (Array (_ BitVec 32) ValueCell!11390))

(declare-fun mapValue!37709 () ValueCell!11390)

(assert (=> mapNonEmpty!37709 (= (arr!31040 (_values!6062 thiss!1427)) (store mapRest!37709 mapKey!37709 mapValue!37709))))

(declare-fun b!1027339 () Bool)

(declare-fun res!687389 () Bool)

(assert (=> b!1027339 (=> (not res!687389) (not e!579499))))

(assert (=> b!1027339 (= res!687389 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027340 () Bool)

(assert (=> b!1027340 (= e!579500 tp_is_empty!24187)))

(declare-fun mapIsEmpty!37709 () Bool)

(assert (=> mapIsEmpty!37709 mapRes!37709))

(declare-fun b!1027341 () Bool)

(assert (=> b!1027341 (= e!579503 (not e!579505))))

(declare-fun res!687391 () Bool)

(assert (=> b!1027341 (=> res!687391 e!579505)))

(assert (=> b!1027341 (= res!687391 (or (bvslt (index!40732 lt!451766) #b00000000000000000000000000000000) (bvsge (index!40732 lt!451766) (size!31553 (_keys!11224 thiss!1427))) (bvsge (size!31553 (_keys!11224 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451764 () array!64473)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64473 (_ BitVec 32)) Bool)

(assert (=> b!1027341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451764 (mask!29783 thiss!1427))))

(declare-datatypes ((Unit!33428 0))(
  ( (Unit!33429) )
))
(declare-fun lt!451767 () Unit!33428)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64473 (_ BitVec 32) (_ BitVec 32)) Unit!33428)

(assert (=> b!1027341 (= lt!451767 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11224 thiss!1427) (index!40732 lt!451766) (mask!29783 thiss!1427)))))

(assert (=> b!1027341 (arrayNoDuplicates!0 lt!451764 #b00000000000000000000000000000000 Nil!21752)))

(declare-fun lt!451765 () Unit!33428)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64473 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21755) Unit!33428)

(assert (=> b!1027341 (= lt!451765 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11224 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40732 lt!451766) #b00000000000000000000000000000000 Nil!21752))))

(declare-fun arrayCountValidKeys!0 (array!64473 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027341 (= (arrayCountValidKeys!0 lt!451764 #b00000000000000000000000000000000 (size!31553 (_keys!11224 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11224 thiss!1427) #b00000000000000000000000000000000 (size!31553 (_keys!11224 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027341 (= lt!451764 (array!64474 (store (arr!31039 (_keys!11224 thiss!1427)) (index!40732 lt!451766) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31553 (_keys!11224 thiss!1427))))))

(declare-fun lt!451768 () Unit!33428)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64473 (_ BitVec 32) (_ BitVec 64)) Unit!33428)

(assert (=> b!1027341 (= lt!451768 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11224 thiss!1427) (index!40732 lt!451766) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89702 res!687390) b!1027339))

(assert (= (and b!1027339 res!687389) b!1027338))

(assert (= (and b!1027338 res!687392) b!1027341))

(assert (= (and b!1027341 (not res!687391)) b!1027334))

(assert (= (and b!1027335 condMapEmpty!37709) mapIsEmpty!37709))

(assert (= (and b!1027335 (not condMapEmpty!37709)) mapNonEmpty!37709))

(assert (= (and mapNonEmpty!37709 ((_ is ValueCellFull!11390) mapValue!37709)) b!1027336))

(assert (= (and b!1027335 ((_ is ValueCellFull!11390) mapDefault!37709)) b!1027340))

(assert (= b!1027337 b!1027335))

(assert (= start!89702 b!1027337))

(declare-fun m!945879 () Bool)

(assert (=> b!1027341 m!945879))

(declare-fun m!945881 () Bool)

(assert (=> b!1027341 m!945881))

(declare-fun m!945883 () Bool)

(assert (=> b!1027341 m!945883))

(declare-fun m!945885 () Bool)

(assert (=> b!1027341 m!945885))

(declare-fun m!945887 () Bool)

(assert (=> b!1027341 m!945887))

(declare-fun m!945889 () Bool)

(assert (=> b!1027341 m!945889))

(declare-fun m!945891 () Bool)

(assert (=> b!1027341 m!945891))

(declare-fun m!945893 () Bool)

(assert (=> b!1027341 m!945893))

(declare-fun m!945895 () Bool)

(assert (=> b!1027334 m!945895))

(declare-fun m!945897 () Bool)

(assert (=> start!89702 m!945897))

(declare-fun m!945899 () Bool)

(assert (=> mapNonEmpty!37709 m!945899))

(declare-fun m!945901 () Bool)

(assert (=> b!1027338 m!945901))

(declare-fun m!945903 () Bool)

(assert (=> b!1027337 m!945903))

(declare-fun m!945905 () Bool)

(assert (=> b!1027337 m!945905))

(check-sat (not b!1027334) (not b!1027338) (not mapNonEmpty!37709) b_and!32723 (not start!89702) (not b!1027337) tp_is_empty!24187 (not b_next!20467) (not b!1027341))
(check-sat b_and!32723 (not b_next!20467))
