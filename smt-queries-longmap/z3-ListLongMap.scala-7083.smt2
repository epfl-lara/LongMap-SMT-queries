; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89786 () Bool)

(assert start!89786)

(declare-fun b!1028534 () Bool)

(declare-fun b_free!20551 () Bool)

(declare-fun b_next!20551 () Bool)

(assert (=> b!1028534 (= b_free!20551 (not b_next!20551))))

(declare-fun tp!72698 () Bool)

(declare-fun b_and!32807 () Bool)

(assert (=> b!1028534 (= tp!72698 b_and!32807)))

(declare-fun b!1028526 () Bool)

(declare-fun e!580510 () Bool)

(declare-fun e!580507 () Bool)

(assert (=> b!1028526 (= e!580510 e!580507)))

(declare-fun res!688082 () Bool)

(assert (=> b!1028526 (=> (not res!688082) (not e!580507))))

(declare-datatypes ((SeekEntryResult!9621 0))(
  ( (MissingZero!9621 (index!40855 (_ BitVec 32))) (Found!9621 (index!40856 (_ BitVec 32))) (Intermediate!9621 (undefined!10433 Bool) (index!40857 (_ BitVec 32)) (x!91377 (_ BitVec 32))) (Undefined!9621) (MissingVacant!9621 (index!40858 (_ BitVec 32))) )
))
(declare-fun lt!452614 () SeekEntryResult!9621)

(get-info :version)

(assert (=> b!1028526 (= res!688082 ((_ is Found!9621) lt!452614))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37235 0))(
  ( (V!37236 (val!12186 Int)) )
))
(declare-datatypes ((ValueCell!11432 0))(
  ( (ValueCellFull!11432 (v!14751 V!37235)) (EmptyCell!11432) )
))
(declare-datatypes ((array!64641 0))(
  ( (array!64642 (arr!31123 (Array (_ BitVec 32) (_ BitVec 64))) (size!31637 (_ BitVec 32))) )
))
(declare-datatypes ((array!64643 0))(
  ( (array!64644 (arr!31124 (Array (_ BitVec 32) ValueCell!11432)) (size!31638 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5458 0))(
  ( (LongMapFixedSize!5459 (defaultEntry!6081 Int) (mask!29853 (_ BitVec 32)) (extraKeys!5813 (_ BitVec 32)) (zeroValue!5917 V!37235) (minValue!5917 V!37235) (_size!2784 (_ BitVec 32)) (_keys!11266 array!64641) (_values!6104 array!64643) (_vacant!2784 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5458)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64641 (_ BitVec 32)) SeekEntryResult!9621)

(assert (=> b!1028526 (= lt!452614 (seekEntry!0 key!909 (_keys!11266 thiss!1427) (mask!29853 thiss!1427)))))

(declare-fun mapNonEmpty!37835 () Bool)

(declare-fun mapRes!37835 () Bool)

(declare-fun tp!72699 () Bool)

(declare-fun e!580512 () Bool)

(assert (=> mapNonEmpty!37835 (= mapRes!37835 (and tp!72699 e!580512))))

(declare-fun mapKey!37835 () (_ BitVec 32))

(declare-fun mapRest!37835 () (Array (_ BitVec 32) ValueCell!11432))

(declare-fun mapValue!37835 () ValueCell!11432)

(assert (=> mapNonEmpty!37835 (= (arr!31124 (_values!6104 thiss!1427)) (store mapRest!37835 mapKey!37835 mapValue!37835))))

(declare-fun b!1028527 () Bool)

(declare-fun e!580511 () Bool)

(declare-fun e!580508 () Bool)

(assert (=> b!1028527 (= e!580511 (and e!580508 mapRes!37835))))

(declare-fun condMapEmpty!37835 () Bool)

(declare-fun mapDefault!37835 () ValueCell!11432)

(assert (=> b!1028527 (= condMapEmpty!37835 (= (arr!31124 (_values!6104 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11432)) mapDefault!37835)))))

(declare-fun res!688079 () Bool)

(assert (=> start!89786 (=> (not res!688079) (not e!580510))))

(declare-fun valid!2076 (LongMapFixedSize!5458) Bool)

(assert (=> start!89786 (= res!688079 (valid!2076 thiss!1427))))

(assert (=> start!89786 e!580510))

(declare-fun e!580513 () Bool)

(assert (=> start!89786 e!580513))

(assert (=> start!89786 true))

(declare-fun b!1028528 () Bool)

(declare-fun e!580509 () Bool)

(assert (=> b!1028528 (= e!580509 true)))

(declare-fun lt!452613 () Bool)

(declare-datatypes ((List!21786 0))(
  ( (Nil!21783) (Cons!21782 (h!22989 (_ BitVec 64)) (t!30840 List!21786)) )
))
(declare-fun arrayNoDuplicates!0 (array!64641 (_ BitVec 32) List!21786) Bool)

(assert (=> b!1028528 (= lt!452613 (arrayNoDuplicates!0 (_keys!11266 thiss!1427) #b00000000000000000000000000000000 Nil!21783))))

(declare-fun b!1028529 () Bool)

(declare-fun res!688078 () Bool)

(assert (=> b!1028529 (=> (not res!688078) (not e!580510))))

(assert (=> b!1028529 (= res!688078 (not (= key!909 (bvneg key!909))))))

(declare-fun mapIsEmpty!37835 () Bool)

(assert (=> mapIsEmpty!37835 mapRes!37835))

(declare-fun b!1028530 () Bool)

(declare-fun tp_is_empty!24271 () Bool)

(assert (=> b!1028530 (= e!580512 tp_is_empty!24271)))

(declare-fun b!1028531 () Bool)

(declare-fun res!688081 () Bool)

(assert (=> b!1028531 (=> res!688081 e!580509)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64641 (_ BitVec 32)) Bool)

(assert (=> b!1028531 (= res!688081 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11266 thiss!1427) (mask!29853 thiss!1427))))))

(declare-fun b!1028532 () Bool)

(assert (=> b!1028532 (= e!580508 tp_is_empty!24271)))

(declare-fun b!1028533 () Bool)

(assert (=> b!1028533 (= e!580507 (not e!580509))))

(declare-fun res!688080 () Bool)

(assert (=> b!1028533 (=> res!688080 e!580509)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1028533 (= res!688080 (not (validMask!0 (mask!29853 thiss!1427))))))

(declare-fun lt!452618 () array!64641)

(declare-fun arrayContainsKey!0 (array!64641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1028533 (not (arrayContainsKey!0 lt!452618 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33482 0))(
  ( (Unit!33483) )
))
(declare-fun lt!452615 () Unit!33482)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64641 (_ BitVec 32) (_ BitVec 64)) Unit!33482)

(assert (=> b!1028533 (= lt!452615 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11266 thiss!1427) (index!40856 lt!452614) key!909))))

(assert (=> b!1028533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452618 (mask!29853 thiss!1427))))

(declare-fun lt!452612 () Unit!33482)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64641 (_ BitVec 32) (_ BitVec 32)) Unit!33482)

(assert (=> b!1028533 (= lt!452612 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11266 thiss!1427) (index!40856 lt!452614) (mask!29853 thiss!1427)))))

(assert (=> b!1028533 (arrayNoDuplicates!0 lt!452618 #b00000000000000000000000000000000 Nil!21783)))

(declare-fun lt!452617 () Unit!33482)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64641 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21786) Unit!33482)

(assert (=> b!1028533 (= lt!452617 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11266 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40856 lt!452614) #b00000000000000000000000000000000 Nil!21783))))

(declare-fun arrayCountValidKeys!0 (array!64641 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1028533 (= (arrayCountValidKeys!0 lt!452618 #b00000000000000000000000000000000 (size!31637 (_keys!11266 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11266 thiss!1427) #b00000000000000000000000000000000 (size!31637 (_keys!11266 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1028533 (= lt!452618 (array!64642 (store (arr!31123 (_keys!11266 thiss!1427)) (index!40856 lt!452614) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31637 (_keys!11266 thiss!1427))))))

(declare-fun lt!452616 () Unit!33482)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64641 (_ BitVec 32) (_ BitVec 64)) Unit!33482)

(assert (=> b!1028533 (= lt!452616 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11266 thiss!1427) (index!40856 lt!452614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!24109 (array!64641) Bool)

(declare-fun array_inv!24110 (array!64643) Bool)

(assert (=> b!1028534 (= e!580513 (and tp!72698 tp_is_empty!24271 (array_inv!24109 (_keys!11266 thiss!1427)) (array_inv!24110 (_values!6104 thiss!1427)) e!580511))))

(declare-fun b!1028535 () Bool)

(declare-fun res!688077 () Bool)

(assert (=> b!1028535 (=> res!688077 e!580509)))

(assert (=> b!1028535 (= res!688077 (or (not (= (size!31638 (_values!6104 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29853 thiss!1427)))) (not (= (size!31637 (_keys!11266 thiss!1427)) (size!31638 (_values!6104 thiss!1427)))) (bvslt (mask!29853 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5813 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5813 thiss!1427) #b00000000000000000000000000000011)))))

(assert (= (and start!89786 res!688079) b!1028529))

(assert (= (and b!1028529 res!688078) b!1028526))

(assert (= (and b!1028526 res!688082) b!1028533))

(assert (= (and b!1028533 (not res!688080)) b!1028535))

(assert (= (and b!1028535 (not res!688077)) b!1028531))

(assert (= (and b!1028531 (not res!688081)) b!1028528))

(assert (= (and b!1028527 condMapEmpty!37835) mapIsEmpty!37835))

(assert (= (and b!1028527 (not condMapEmpty!37835)) mapNonEmpty!37835))

(assert (= (and mapNonEmpty!37835 ((_ is ValueCellFull!11432) mapValue!37835)) b!1028530))

(assert (= (and b!1028527 ((_ is ValueCellFull!11432) mapDefault!37835)) b!1028532))

(assert (= b!1028534 b!1028527))

(assert (= start!89786 b!1028534))

(declare-fun m!947295 () Bool)

(assert (=> b!1028528 m!947295))

(declare-fun m!947297 () Bool)

(assert (=> mapNonEmpty!37835 m!947297))

(declare-fun m!947299 () Bool)

(assert (=> b!1028531 m!947299))

(declare-fun m!947301 () Bool)

(assert (=> b!1028526 m!947301))

(declare-fun m!947303 () Bool)

(assert (=> b!1028534 m!947303))

(declare-fun m!947305 () Bool)

(assert (=> b!1028534 m!947305))

(declare-fun m!947307 () Bool)

(assert (=> b!1028533 m!947307))

(declare-fun m!947309 () Bool)

(assert (=> b!1028533 m!947309))

(declare-fun m!947311 () Bool)

(assert (=> b!1028533 m!947311))

(declare-fun m!947313 () Bool)

(assert (=> b!1028533 m!947313))

(declare-fun m!947315 () Bool)

(assert (=> b!1028533 m!947315))

(declare-fun m!947317 () Bool)

(assert (=> b!1028533 m!947317))

(declare-fun m!947319 () Bool)

(assert (=> b!1028533 m!947319))

(declare-fun m!947321 () Bool)

(assert (=> b!1028533 m!947321))

(declare-fun m!947323 () Bool)

(assert (=> b!1028533 m!947323))

(declare-fun m!947325 () Bool)

(assert (=> b!1028533 m!947325))

(declare-fun m!947327 () Bool)

(assert (=> b!1028533 m!947327))

(declare-fun m!947329 () Bool)

(assert (=> start!89786 m!947329))

(check-sat tp_is_empty!24271 b_and!32807 (not b_next!20551) (not b!1028534) (not b!1028526) (not mapNonEmpty!37835) (not start!89786) (not b!1028531) (not b!1028533) (not b!1028528))
(check-sat b_and!32807 (not b_next!20551))
