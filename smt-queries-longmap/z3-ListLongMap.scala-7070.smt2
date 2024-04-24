; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89708 () Bool)

(assert start!89708)

(declare-fun b!1027411 () Bool)

(declare-fun b_free!20473 () Bool)

(declare-fun b_next!20473 () Bool)

(assert (=> b!1027411 (= b_free!20473 (not b_next!20473))))

(declare-fun tp!72464 () Bool)

(declare-fun b_and!32729 () Bool)

(assert (=> b!1027411 (= tp!72464 b_and!32729)))

(declare-fun b!1027406 () Bool)

(declare-fun e!579574 () Bool)

(declare-fun tp_is_empty!24193 () Bool)

(assert (=> b!1027406 (= e!579574 tp_is_empty!24193)))

(declare-fun res!687425 () Bool)

(declare-fun e!579573 () Bool)

(assert (=> start!89708 (=> (not res!687425) (not e!579573))))

(declare-datatypes ((V!37131 0))(
  ( (V!37132 (val!12147 Int)) )
))
(declare-datatypes ((ValueCell!11393 0))(
  ( (ValueCellFull!11393 (v!14712 V!37131)) (EmptyCell!11393) )
))
(declare-datatypes ((array!64485 0))(
  ( (array!64486 (arr!31045 (Array (_ BitVec 32) (_ BitVec 64))) (size!31559 (_ BitVec 32))) )
))
(declare-datatypes ((array!64487 0))(
  ( (array!64488 (arr!31046 (Array (_ BitVec 32) ValueCell!11393)) (size!31560 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5380 0))(
  ( (LongMapFixedSize!5381 (defaultEntry!6042 Int) (mask!29788 (_ BitVec 32)) (extraKeys!5774 (_ BitVec 32)) (zeroValue!5878 V!37131) (minValue!5878 V!37131) (_size!2745 (_ BitVec 32)) (_keys!11227 array!64485) (_values!6065 array!64487) (_vacant!2745 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5380)

(declare-fun valid!2052 (LongMapFixedSize!5380) Bool)

(assert (=> start!89708 (= res!687425 (valid!2052 thiss!1427))))

(assert (=> start!89708 e!579573))

(declare-fun e!579575 () Bool)

(assert (=> start!89708 e!579575))

(assert (=> start!89708 true))

(declare-fun b!1027407 () Bool)

(declare-fun e!579571 () Bool)

(assert (=> b!1027407 (= e!579571 tp_is_empty!24193)))

(declare-fun b!1027408 () Bool)

(declare-fun e!579572 () Bool)

(assert (=> b!1027408 (= e!579572 true)))

(declare-fun lt!451820 () Bool)

(declare-datatypes ((List!21758 0))(
  ( (Nil!21755) (Cons!21754 (h!22961 (_ BitVec 64)) (t!30812 List!21758)) )
))
(declare-fun arrayNoDuplicates!0 (array!64485 (_ BitVec 32) List!21758) Bool)

(assert (=> b!1027408 (= lt!451820 (arrayNoDuplicates!0 (_keys!11227 thiss!1427) #b00000000000000000000000000000000 Nil!21755))))

(declare-fun b!1027409 () Bool)

(declare-fun e!579576 () Bool)

(assert (=> b!1027409 (= e!579573 e!579576)))

(declare-fun res!687426 () Bool)

(assert (=> b!1027409 (=> (not res!687426) (not e!579576))))

(declare-datatypes ((SeekEntryResult!9592 0))(
  ( (MissingZero!9592 (index!40739 (_ BitVec 32))) (Found!9592 (index!40740 (_ BitVec 32))) (Intermediate!9592 (undefined!10404 Bool) (index!40741 (_ BitVec 32)) (x!91244 (_ BitVec 32))) (Undefined!9592) (MissingVacant!9592 (index!40742 (_ BitVec 32))) )
))
(declare-fun lt!451819 () SeekEntryResult!9592)

(get-info :version)

(assert (=> b!1027409 (= res!687426 ((_ is Found!9592) lt!451819))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64485 (_ BitVec 32)) SeekEntryResult!9592)

(assert (=> b!1027409 (= lt!451819 (seekEntry!0 key!909 (_keys!11227 thiss!1427) (mask!29788 thiss!1427)))))

(declare-fun mapNonEmpty!37718 () Bool)

(declare-fun mapRes!37718 () Bool)

(declare-fun tp!72465 () Bool)

(assert (=> mapNonEmpty!37718 (= mapRes!37718 (and tp!72465 e!579574))))

(declare-fun mapKey!37718 () (_ BitVec 32))

(declare-fun mapValue!37718 () ValueCell!11393)

(declare-fun mapRest!37718 () (Array (_ BitVec 32) ValueCell!11393))

(assert (=> mapNonEmpty!37718 (= (arr!31046 (_values!6065 thiss!1427)) (store mapRest!37718 mapKey!37718 mapValue!37718))))

(declare-fun b!1027410 () Bool)

(declare-fun e!579577 () Bool)

(assert (=> b!1027410 (= e!579577 (and e!579571 mapRes!37718))))

(declare-fun condMapEmpty!37718 () Bool)

(declare-fun mapDefault!37718 () ValueCell!11393)

(assert (=> b!1027410 (= condMapEmpty!37718 (= (arr!31046 (_values!6065 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11393)) mapDefault!37718)))))

(declare-fun array_inv!24063 (array!64485) Bool)

(declare-fun array_inv!24064 (array!64487) Bool)

(assert (=> b!1027411 (= e!579575 (and tp!72464 tp_is_empty!24193 (array_inv!24063 (_keys!11227 thiss!1427)) (array_inv!24064 (_values!6065 thiss!1427)) e!579577))))

(declare-fun b!1027412 () Bool)

(declare-fun res!687427 () Bool)

(assert (=> b!1027412 (=> (not res!687427) (not e!579573))))

(assert (=> b!1027412 (= res!687427 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027413 () Bool)

(assert (=> b!1027413 (= e!579576 (not e!579572))))

(declare-fun res!687428 () Bool)

(assert (=> b!1027413 (=> res!687428 e!579572)))

(assert (=> b!1027413 (= res!687428 (or (bvslt (index!40740 lt!451819) #b00000000000000000000000000000000) (bvsge (index!40740 lt!451819) (size!31559 (_keys!11227 thiss!1427))) (bvsge (size!31559 (_keys!11227 thiss!1427)) #b01111111111111111111111111111111)))))

(declare-fun lt!451823 () array!64485)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64485 (_ BitVec 32)) Bool)

(assert (=> b!1027413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451823 (mask!29788 thiss!1427))))

(declare-datatypes ((Unit!33432 0))(
  ( (Unit!33433) )
))
(declare-fun lt!451818 () Unit!33432)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64485 (_ BitVec 32) (_ BitVec 32)) Unit!33432)

(assert (=> b!1027413 (= lt!451818 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11227 thiss!1427) (index!40740 lt!451819) (mask!29788 thiss!1427)))))

(assert (=> b!1027413 (arrayNoDuplicates!0 lt!451823 #b00000000000000000000000000000000 Nil!21755)))

(declare-fun lt!451822 () Unit!33432)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21758) Unit!33432)

(assert (=> b!1027413 (= lt!451822 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11227 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40740 lt!451819) #b00000000000000000000000000000000 Nil!21755))))

(declare-fun arrayCountValidKeys!0 (array!64485 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027413 (= (arrayCountValidKeys!0 lt!451823 #b00000000000000000000000000000000 (size!31559 (_keys!11227 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11227 thiss!1427) #b00000000000000000000000000000000 (size!31559 (_keys!11227 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027413 (= lt!451823 (array!64486 (store (arr!31045 (_keys!11227 thiss!1427)) (index!40740 lt!451819) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31559 (_keys!11227 thiss!1427))))))

(declare-fun lt!451821 () Unit!33432)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64485 (_ BitVec 32) (_ BitVec 64)) Unit!33432)

(assert (=> b!1027413 (= lt!451821 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11227 thiss!1427) (index!40740 lt!451819) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37718 () Bool)

(assert (=> mapIsEmpty!37718 mapRes!37718))

(assert (= (and start!89708 res!687425) b!1027412))

(assert (= (and b!1027412 res!687427) b!1027409))

(assert (= (and b!1027409 res!687426) b!1027413))

(assert (= (and b!1027413 (not res!687428)) b!1027408))

(assert (= (and b!1027410 condMapEmpty!37718) mapIsEmpty!37718))

(assert (= (and b!1027410 (not condMapEmpty!37718)) mapNonEmpty!37718))

(assert (= (and mapNonEmpty!37718 ((_ is ValueCellFull!11393) mapValue!37718)) b!1027406))

(assert (= (and b!1027410 ((_ is ValueCellFull!11393) mapDefault!37718)) b!1027407))

(assert (= b!1027411 b!1027410))

(assert (= start!89708 b!1027411))

(declare-fun m!945963 () Bool)

(assert (=> mapNonEmpty!37718 m!945963))

(declare-fun m!945965 () Bool)

(assert (=> b!1027409 m!945965))

(declare-fun m!945967 () Bool)

(assert (=> b!1027408 m!945967))

(declare-fun m!945969 () Bool)

(assert (=> b!1027411 m!945969))

(declare-fun m!945971 () Bool)

(assert (=> b!1027411 m!945971))

(declare-fun m!945973 () Bool)

(assert (=> start!89708 m!945973))

(declare-fun m!945975 () Bool)

(assert (=> b!1027413 m!945975))

(declare-fun m!945977 () Bool)

(assert (=> b!1027413 m!945977))

(declare-fun m!945979 () Bool)

(assert (=> b!1027413 m!945979))

(declare-fun m!945981 () Bool)

(assert (=> b!1027413 m!945981))

(declare-fun m!945983 () Bool)

(assert (=> b!1027413 m!945983))

(declare-fun m!945985 () Bool)

(assert (=> b!1027413 m!945985))

(declare-fun m!945987 () Bool)

(assert (=> b!1027413 m!945987))

(declare-fun m!945989 () Bool)

(assert (=> b!1027413 m!945989))

(check-sat (not b!1027409) (not b!1027411) (not b!1027408) (not b!1027413) (not start!89708) tp_is_empty!24193 b_and!32729 (not mapNonEmpty!37718) (not b_next!20473))
(check-sat b_and!32729 (not b_next!20473))
