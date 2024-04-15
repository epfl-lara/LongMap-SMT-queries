; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89532 () Bool)

(assert start!89532)

(declare-fun b!1026792 () Bool)

(declare-fun b_free!20533 () Bool)

(declare-fun b_next!20533 () Bool)

(assert (=> b!1026792 (= b_free!20533 (not b_next!20533))))

(declare-fun tp!72644 () Bool)

(declare-fun b_and!32753 () Bool)

(assert (=> b!1026792 (= tp!72644 b_and!32753)))

(declare-fun b!1026790 () Bool)

(declare-fun e!579359 () Bool)

(declare-fun e!579357 () Bool)

(assert (=> b!1026790 (= e!579359 (not e!579357))))

(declare-fun res!687338 () Bool)

(assert (=> b!1026790 (=> res!687338 e!579357)))

(declare-datatypes ((V!37211 0))(
  ( (V!37212 (val!12177 Int)) )
))
(declare-datatypes ((ValueCell!11423 0))(
  ( (ValueCellFull!11423 (v!14745 V!37211)) (EmptyCell!11423) )
))
(declare-datatypes ((array!64495 0))(
  ( (array!64496 (arr!31056 (Array (_ BitVec 32) (_ BitVec 64))) (size!31571 (_ BitVec 32))) )
))
(declare-datatypes ((array!64497 0))(
  ( (array!64498 (arr!31057 (Array (_ BitVec 32) ValueCell!11423)) (size!31572 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5440 0))(
  ( (LongMapFixedSize!5441 (defaultEntry!6072 Int) (mask!29773 (_ BitVec 32)) (extraKeys!5804 (_ BitVec 32)) (zeroValue!5908 V!37211) (minValue!5908 V!37211) (_size!2775 (_ BitVec 32)) (_keys!11215 array!64495) (_values!6095 array!64497) (_vacant!2775 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5440)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026790 (= res!687338 (not (validMask!0 (mask!29773 thiss!1427))))))

(declare-fun lt!451710 () array!64495)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026790 (not (arrayContainsKey!0 lt!451710 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33351 0))(
  ( (Unit!33352) )
))
(declare-fun lt!451714 () Unit!33351)

(declare-datatypes ((SeekEntryResult!9651 0))(
  ( (MissingZero!9651 (index!40975 (_ BitVec 32))) (Found!9651 (index!40976 (_ BitVec 32))) (Intermediate!9651 (undefined!10463 Bool) (index!40977 (_ BitVec 32)) (x!91358 (_ BitVec 32))) (Undefined!9651) (MissingVacant!9651 (index!40978 (_ BitVec 32))) )
))
(declare-fun lt!451712 () SeekEntryResult!9651)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64495 (_ BitVec 32) (_ BitVec 64)) Unit!33351)

(assert (=> b!1026790 (= lt!451714 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11215 thiss!1427) (index!40976 lt!451712) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64495 (_ BitVec 32)) Bool)

(assert (=> b!1026790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451710 (mask!29773 thiss!1427))))

(declare-fun lt!451709 () Unit!33351)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64495 (_ BitVec 32) (_ BitVec 32)) Unit!33351)

(assert (=> b!1026790 (= lt!451709 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11215 thiss!1427) (index!40976 lt!451712) (mask!29773 thiss!1427)))))

(declare-datatypes ((List!21826 0))(
  ( (Nil!21823) (Cons!21822 (h!23020 (_ BitVec 64)) (t!30879 List!21826)) )
))
(declare-fun arrayNoDuplicates!0 (array!64495 (_ BitVec 32) List!21826) Bool)

(assert (=> b!1026790 (arrayNoDuplicates!0 lt!451710 #b00000000000000000000000000000000 Nil!21823)))

(declare-fun lt!451711 () Unit!33351)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64495 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21826) Unit!33351)

(assert (=> b!1026790 (= lt!451711 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11215 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40976 lt!451712) #b00000000000000000000000000000000 Nil!21823))))

(declare-fun arrayCountValidKeys!0 (array!64495 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026790 (= (arrayCountValidKeys!0 lt!451710 #b00000000000000000000000000000000 (size!31571 (_keys!11215 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11215 thiss!1427) #b00000000000000000000000000000000 (size!31571 (_keys!11215 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026790 (= lt!451710 (array!64496 (store (arr!31056 (_keys!11215 thiss!1427)) (index!40976 lt!451712) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31571 (_keys!11215 thiss!1427))))))

(declare-fun lt!451708 () Unit!33351)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64495 (_ BitVec 32) (_ BitVec 64)) Unit!33351)

(assert (=> b!1026790 (= lt!451708 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11215 thiss!1427) (index!40976 lt!451712) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!687340 () Bool)

(declare-fun e!579360 () Bool)

(assert (=> start!89532 (=> (not res!687340) (not e!579360))))

(declare-fun valid!2056 (LongMapFixedSize!5440) Bool)

(assert (=> start!89532 (= res!687340 (valid!2056 thiss!1427))))

(assert (=> start!89532 e!579360))

(declare-fun e!579356 () Bool)

(assert (=> start!89532 e!579356))

(assert (=> start!89532 true))

(declare-fun b!1026791 () Bool)

(assert (=> b!1026791 (= e!579357 true)))

(declare-fun lt!451713 () Bool)

(assert (=> b!1026791 (= lt!451713 (arrayNoDuplicates!0 (_keys!11215 thiss!1427) #b00000000000000000000000000000000 Nil!21823))))

(declare-fun e!579363 () Bool)

(declare-fun tp_is_empty!24253 () Bool)

(declare-fun array_inv!24055 (array!64495) Bool)

(declare-fun array_inv!24056 (array!64497) Bool)

(assert (=> b!1026792 (= e!579356 (and tp!72644 tp_is_empty!24253 (array_inv!24055 (_keys!11215 thiss!1427)) (array_inv!24056 (_values!6095 thiss!1427)) e!579363))))

(declare-fun mapNonEmpty!37808 () Bool)

(declare-fun mapRes!37808 () Bool)

(declare-fun tp!72645 () Bool)

(declare-fun e!579361 () Bool)

(assert (=> mapNonEmpty!37808 (= mapRes!37808 (and tp!72645 e!579361))))

(declare-fun mapRest!37808 () (Array (_ BitVec 32) ValueCell!11423))

(declare-fun mapValue!37808 () ValueCell!11423)

(declare-fun mapKey!37808 () (_ BitVec 32))

(assert (=> mapNonEmpty!37808 (= (arr!31057 (_values!6095 thiss!1427)) (store mapRest!37808 mapKey!37808 mapValue!37808))))

(declare-fun mapIsEmpty!37808 () Bool)

(assert (=> mapIsEmpty!37808 mapRes!37808))

(declare-fun b!1026793 () Bool)

(assert (=> b!1026793 (= e!579361 tp_is_empty!24253)))

(declare-fun b!1026794 () Bool)

(declare-fun res!687343 () Bool)

(assert (=> b!1026794 (=> res!687343 e!579357)))

(assert (=> b!1026794 (= res!687343 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11215 thiss!1427) (mask!29773 thiss!1427))))))

(declare-fun b!1026795 () Bool)

(declare-fun res!687341 () Bool)

(assert (=> b!1026795 (=> (not res!687341) (not e!579360))))

(assert (=> b!1026795 (= res!687341 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026796 () Bool)

(assert (=> b!1026796 (= e!579360 e!579359)))

(declare-fun res!687339 () Bool)

(assert (=> b!1026796 (=> (not res!687339) (not e!579359))))

(get-info :version)

(assert (=> b!1026796 (= res!687339 ((_ is Found!9651) lt!451712))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64495 (_ BitVec 32)) SeekEntryResult!9651)

(assert (=> b!1026796 (= lt!451712 (seekEntry!0 key!909 (_keys!11215 thiss!1427) (mask!29773 thiss!1427)))))

(declare-fun b!1026797 () Bool)

(declare-fun e!579362 () Bool)

(assert (=> b!1026797 (= e!579362 tp_is_empty!24253)))

(declare-fun b!1026798 () Bool)

(declare-fun res!687342 () Bool)

(assert (=> b!1026798 (=> res!687342 e!579357)))

(assert (=> b!1026798 (= res!687342 (or (not (= (size!31572 (_values!6095 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29773 thiss!1427)))) (not (= (size!31571 (_keys!11215 thiss!1427)) (size!31572 (_values!6095 thiss!1427)))) (bvslt (mask!29773 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5804 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5804 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026799 () Bool)

(assert (=> b!1026799 (= e!579363 (and e!579362 mapRes!37808))))

(declare-fun condMapEmpty!37808 () Bool)

(declare-fun mapDefault!37808 () ValueCell!11423)

(assert (=> b!1026799 (= condMapEmpty!37808 (= (arr!31057 (_values!6095 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11423)) mapDefault!37808)))))

(assert (= (and start!89532 res!687340) b!1026795))

(assert (= (and b!1026795 res!687341) b!1026796))

(assert (= (and b!1026796 res!687339) b!1026790))

(assert (= (and b!1026790 (not res!687338)) b!1026798))

(assert (= (and b!1026798 (not res!687342)) b!1026794))

(assert (= (and b!1026794 (not res!687343)) b!1026791))

(assert (= (and b!1026799 condMapEmpty!37808) mapIsEmpty!37808))

(assert (= (and b!1026799 (not condMapEmpty!37808)) mapNonEmpty!37808))

(assert (= (and mapNonEmpty!37808 ((_ is ValueCellFull!11423) mapValue!37808)) b!1026793))

(assert (= (and b!1026799 ((_ is ValueCellFull!11423) mapDefault!37808)) b!1026797))

(assert (= b!1026792 b!1026799))

(assert (= start!89532 b!1026792))

(declare-fun m!944687 () Bool)

(assert (=> b!1026796 m!944687))

(declare-fun m!944689 () Bool)

(assert (=> b!1026794 m!944689))

(declare-fun m!944691 () Bool)

(assert (=> mapNonEmpty!37808 m!944691))

(declare-fun m!944693 () Bool)

(assert (=> start!89532 m!944693))

(declare-fun m!944695 () Bool)

(assert (=> b!1026791 m!944695))

(declare-fun m!944697 () Bool)

(assert (=> b!1026792 m!944697))

(declare-fun m!944699 () Bool)

(assert (=> b!1026792 m!944699))

(declare-fun m!944701 () Bool)

(assert (=> b!1026790 m!944701))

(declare-fun m!944703 () Bool)

(assert (=> b!1026790 m!944703))

(declare-fun m!944705 () Bool)

(assert (=> b!1026790 m!944705))

(declare-fun m!944707 () Bool)

(assert (=> b!1026790 m!944707))

(declare-fun m!944709 () Bool)

(assert (=> b!1026790 m!944709))

(declare-fun m!944711 () Bool)

(assert (=> b!1026790 m!944711))

(declare-fun m!944713 () Bool)

(assert (=> b!1026790 m!944713))

(declare-fun m!944715 () Bool)

(assert (=> b!1026790 m!944715))

(declare-fun m!944717 () Bool)

(assert (=> b!1026790 m!944717))

(declare-fun m!944719 () Bool)

(assert (=> b!1026790 m!944719))

(declare-fun m!944721 () Bool)

(assert (=> b!1026790 m!944721))

(check-sat (not mapNonEmpty!37808) (not b!1026790) (not b!1026794) (not b!1026792) (not b!1026796) (not b!1026791) tp_is_empty!24253 (not b_next!20533) (not start!89532) b_and!32753)
(check-sat b_and!32753 (not b_next!20533))
