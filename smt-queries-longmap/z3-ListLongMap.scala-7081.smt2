; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89542 () Bool)

(assert start!89542)

(declare-fun b!1027065 () Bool)

(declare-fun b_free!20541 () Bool)

(declare-fun b_next!20541 () Bool)

(assert (=> b!1027065 (= b_free!20541 (not b_next!20541))))

(declare-fun tp!72668 () Bool)

(declare-fun b_and!32787 () Bool)

(assert (=> b!1027065 (= tp!72668 b_and!32787)))

(declare-fun b!1027061 () Bool)

(declare-fun e!579543 () Bool)

(declare-fun e!579550 () Bool)

(assert (=> b!1027061 (= e!579543 e!579550)))

(declare-fun res!687477 () Bool)

(assert (=> b!1027061 (=> (not res!687477) (not e!579550))))

(declare-datatypes ((SeekEntryResult!9663 0))(
  ( (MissingZero!9663 (index!41023 (_ BitVec 32))) (Found!9663 (index!41024 (_ BitVec 32))) (Intermediate!9663 (undefined!10475 Bool) (index!41025 (_ BitVec 32)) (x!91381 (_ BitVec 32))) (Undefined!9663) (MissingVacant!9663 (index!41026 (_ BitVec 32))) )
))
(declare-fun lt!451992 () SeekEntryResult!9663)

(get-info :version)

(assert (=> b!1027061 (= res!687477 ((_ is Found!9663) lt!451992))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37221 0))(
  ( (V!37222 (val!12181 Int)) )
))
(declare-datatypes ((ValueCell!11427 0))(
  ( (ValueCellFull!11427 (v!14750 V!37221)) (EmptyCell!11427) )
))
(declare-datatypes ((array!64572 0))(
  ( (array!64573 (arr!31095 (Array (_ BitVec 32) (_ BitVec 64))) (size!31608 (_ BitVec 32))) )
))
(declare-datatypes ((array!64574 0))(
  ( (array!64575 (arr!31096 (Array (_ BitVec 32) ValueCell!11427)) (size!31609 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5448 0))(
  ( (LongMapFixedSize!5449 (defaultEntry!6076 Int) (mask!29784 (_ BitVec 32)) (extraKeys!5808 (_ BitVec 32)) (zeroValue!5912 V!37221) (minValue!5912 V!37221) (_size!2779 (_ BitVec 32)) (_keys!11223 array!64572) (_values!6099 array!64574) (_vacant!2779 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5448)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64572 (_ BitVec 32)) SeekEntryResult!9663)

(assert (=> b!1027061 (= lt!451992 (seekEntry!0 key!909 (_keys!11223 thiss!1427) (mask!29784 thiss!1427)))))

(declare-fun b!1027062 () Bool)

(declare-fun e!579545 () Bool)

(assert (=> b!1027062 (= e!579550 (not e!579545))))

(declare-fun res!687481 () Bool)

(assert (=> b!1027062 (=> res!687481 e!579545)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027062 (= res!687481 (not (validMask!0 (mask!29784 thiss!1427))))))

(declare-fun lt!451994 () array!64572)

(declare-fun arrayContainsKey!0 (array!64572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027062 (not (arrayContainsKey!0 lt!451994 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33467 0))(
  ( (Unit!33468) )
))
(declare-fun lt!451997 () Unit!33467)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64572 (_ BitVec 32) (_ BitVec 64)) Unit!33467)

(assert (=> b!1027062 (= lt!451997 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11223 thiss!1427) (index!41024 lt!451992) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64572 (_ BitVec 32)) Bool)

(assert (=> b!1027062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451994 (mask!29784 thiss!1427))))

(declare-fun lt!451993 () Unit!33467)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64572 (_ BitVec 32) (_ BitVec 32)) Unit!33467)

(assert (=> b!1027062 (= lt!451993 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11223 thiss!1427) (index!41024 lt!451992) (mask!29784 thiss!1427)))))

(declare-datatypes ((List!21796 0))(
  ( (Nil!21793) (Cons!21792 (h!22990 (_ BitVec 64)) (t!30858 List!21796)) )
))
(declare-fun arrayNoDuplicates!0 (array!64572 (_ BitVec 32) List!21796) Bool)

(assert (=> b!1027062 (arrayNoDuplicates!0 lt!451994 #b00000000000000000000000000000000 Nil!21793)))

(declare-fun lt!451996 () Unit!33467)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64572 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21796) Unit!33467)

(assert (=> b!1027062 (= lt!451996 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11223 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41024 lt!451992) #b00000000000000000000000000000000 Nil!21793))))

(declare-fun arrayCountValidKeys!0 (array!64572 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027062 (= (arrayCountValidKeys!0 lt!451994 #b00000000000000000000000000000000 (size!31608 (_keys!11223 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11223 thiss!1427) #b00000000000000000000000000000000 (size!31608 (_keys!11223 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027062 (= lt!451994 (array!64573 (store (arr!31095 (_keys!11223 thiss!1427)) (index!41024 lt!451992) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31608 (_keys!11223 thiss!1427))))))

(declare-fun lt!451998 () Unit!33467)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64572 (_ BitVec 32) (_ BitVec 64)) Unit!33467)

(assert (=> b!1027062 (= lt!451998 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11223 thiss!1427) (index!41024 lt!451992) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!687482 () Bool)

(assert (=> start!89542 (=> (not res!687482) (not e!579543))))

(declare-fun valid!2066 (LongMapFixedSize!5448) Bool)

(assert (=> start!89542 (= res!687482 (valid!2066 thiss!1427))))

(assert (=> start!89542 e!579543))

(declare-fun e!579544 () Bool)

(assert (=> start!89542 e!579544))

(assert (=> start!89542 true))

(declare-fun b!1027063 () Bool)

(assert (=> b!1027063 (= e!579545 true)))

(declare-fun lt!451995 () Bool)

(assert (=> b!1027063 (= lt!451995 (arrayNoDuplicates!0 (_keys!11223 thiss!1427) #b00000000000000000000000000000000 Nil!21793))))

(declare-fun b!1027064 () Bool)

(declare-fun e!579548 () Bool)

(declare-fun tp_is_empty!24261 () Bool)

(assert (=> b!1027064 (= e!579548 tp_is_empty!24261)))

(declare-fun e!579547 () Bool)

(declare-fun array_inv!24077 (array!64572) Bool)

(declare-fun array_inv!24078 (array!64574) Bool)

(assert (=> b!1027065 (= e!579544 (and tp!72668 tp_is_empty!24261 (array_inv!24077 (_keys!11223 thiss!1427)) (array_inv!24078 (_values!6099 thiss!1427)) e!579547))))

(declare-fun b!1027066 () Bool)

(declare-fun e!579549 () Bool)

(declare-fun mapRes!37820 () Bool)

(assert (=> b!1027066 (= e!579547 (and e!579549 mapRes!37820))))

(declare-fun condMapEmpty!37820 () Bool)

(declare-fun mapDefault!37820 () ValueCell!11427)

(assert (=> b!1027066 (= condMapEmpty!37820 (= (arr!31096 (_values!6099 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11427)) mapDefault!37820)))))

(declare-fun b!1027067 () Bool)

(declare-fun res!687480 () Bool)

(assert (=> b!1027067 (=> res!687480 e!579545)))

(assert (=> b!1027067 (= res!687480 (or (not (= (size!31609 (_values!6099 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29784 thiss!1427)))) (not (= (size!31608 (_keys!11223 thiss!1427)) (size!31609 (_values!6099 thiss!1427)))) (bvslt (mask!29784 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5808 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5808 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027068 () Bool)

(assert (=> b!1027068 (= e!579549 tp_is_empty!24261)))

(declare-fun mapIsEmpty!37820 () Bool)

(assert (=> mapIsEmpty!37820 mapRes!37820))

(declare-fun mapNonEmpty!37820 () Bool)

(declare-fun tp!72669 () Bool)

(assert (=> mapNonEmpty!37820 (= mapRes!37820 (and tp!72669 e!579548))))

(declare-fun mapKey!37820 () (_ BitVec 32))

(declare-fun mapRest!37820 () (Array (_ BitVec 32) ValueCell!11427))

(declare-fun mapValue!37820 () ValueCell!11427)

(assert (=> mapNonEmpty!37820 (= (arr!31096 (_values!6099 thiss!1427)) (store mapRest!37820 mapKey!37820 mapValue!37820))))

(declare-fun b!1027069 () Bool)

(declare-fun res!687478 () Bool)

(assert (=> b!1027069 (=> (not res!687478) (not e!579543))))

(assert (=> b!1027069 (= res!687478 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027070 () Bool)

(declare-fun res!687479 () Bool)

(assert (=> b!1027070 (=> res!687479 e!579545)))

(assert (=> b!1027070 (= res!687479 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11223 thiss!1427) (mask!29784 thiss!1427))))))

(assert (= (and start!89542 res!687482) b!1027069))

(assert (= (and b!1027069 res!687478) b!1027061))

(assert (= (and b!1027061 res!687477) b!1027062))

(assert (= (and b!1027062 (not res!687481)) b!1027067))

(assert (= (and b!1027067 (not res!687480)) b!1027070))

(assert (= (and b!1027070 (not res!687479)) b!1027063))

(assert (= (and b!1027066 condMapEmpty!37820) mapIsEmpty!37820))

(assert (= (and b!1027066 (not condMapEmpty!37820)) mapNonEmpty!37820))

(assert (= (and mapNonEmpty!37820 ((_ is ValueCellFull!11427) mapValue!37820)) b!1027064))

(assert (= (and b!1027066 ((_ is ValueCellFull!11427) mapDefault!37820)) b!1027068))

(assert (= b!1027065 b!1027066))

(assert (= start!89542 b!1027065))

(declare-fun m!945451 () Bool)

(assert (=> mapNonEmpty!37820 m!945451))

(declare-fun m!945453 () Bool)

(assert (=> b!1027063 m!945453))

(declare-fun m!945455 () Bool)

(assert (=> b!1027062 m!945455))

(declare-fun m!945457 () Bool)

(assert (=> b!1027062 m!945457))

(declare-fun m!945459 () Bool)

(assert (=> b!1027062 m!945459))

(declare-fun m!945461 () Bool)

(assert (=> b!1027062 m!945461))

(declare-fun m!945463 () Bool)

(assert (=> b!1027062 m!945463))

(declare-fun m!945465 () Bool)

(assert (=> b!1027062 m!945465))

(declare-fun m!945467 () Bool)

(assert (=> b!1027062 m!945467))

(declare-fun m!945469 () Bool)

(assert (=> b!1027062 m!945469))

(declare-fun m!945471 () Bool)

(assert (=> b!1027062 m!945471))

(declare-fun m!945473 () Bool)

(assert (=> b!1027062 m!945473))

(declare-fun m!945475 () Bool)

(assert (=> b!1027062 m!945475))

(declare-fun m!945477 () Bool)

(assert (=> b!1027065 m!945477))

(declare-fun m!945479 () Bool)

(assert (=> b!1027065 m!945479))

(declare-fun m!945481 () Bool)

(assert (=> b!1027070 m!945481))

(declare-fun m!945483 () Bool)

(assert (=> start!89542 m!945483))

(declare-fun m!945485 () Bool)

(assert (=> b!1027061 m!945485))

(check-sat tp_is_empty!24261 (not b!1027062) (not mapNonEmpty!37820) (not b!1027070) b_and!32787 (not b!1027061) (not b_next!20541) (not b!1027065) (not b!1027063) (not start!89542))
(check-sat b_and!32787 (not b_next!20541))
