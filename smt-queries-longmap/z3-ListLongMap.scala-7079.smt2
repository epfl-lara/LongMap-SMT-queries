; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89530 () Bool)

(assert start!89530)

(declare-fun b!1026887 () Bool)

(declare-fun b_free!20529 () Bool)

(declare-fun b_next!20529 () Bool)

(assert (=> b!1026887 (= b_free!20529 (not b_next!20529))))

(declare-fun tp!72633 () Bool)

(declare-fun b_and!32775 () Bool)

(assert (=> b!1026887 (= tp!72633 b_and!32775)))

(declare-fun b!1026881 () Bool)

(declare-fun res!687373 () Bool)

(declare-fun e!579401 () Bool)

(assert (=> b!1026881 (=> res!687373 e!579401)))

(declare-datatypes ((V!37205 0))(
  ( (V!37206 (val!12175 Int)) )
))
(declare-datatypes ((ValueCell!11421 0))(
  ( (ValueCellFull!11421 (v!14744 V!37205)) (EmptyCell!11421) )
))
(declare-datatypes ((array!64548 0))(
  ( (array!64549 (arr!31083 (Array (_ BitVec 32) (_ BitVec 64))) (size!31596 (_ BitVec 32))) )
))
(declare-datatypes ((array!64550 0))(
  ( (array!64551 (arr!31084 (Array (_ BitVec 32) ValueCell!11421)) (size!31597 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5436 0))(
  ( (LongMapFixedSize!5437 (defaultEntry!6070 Int) (mask!29774 (_ BitVec 32)) (extraKeys!5802 (_ BitVec 32)) (zeroValue!5906 V!37205) (minValue!5906 V!37205) (_size!2773 (_ BitVec 32)) (_keys!11217 array!64548) (_values!6093 array!64550) (_vacant!2773 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5436)

(assert (=> b!1026881 (= res!687373 (or (not (= (size!31597 (_values!6093 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29774 thiss!1427)))) (not (= (size!31596 (_keys!11217 thiss!1427)) (size!31597 (_values!6093 thiss!1427)))) (bvslt (mask!29774 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5802 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5802 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026882 () Bool)

(declare-fun res!687374 () Bool)

(declare-fun e!579404 () Bool)

(assert (=> b!1026882 (=> (not res!687374) (not e!579404))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026882 (= res!687374 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026883 () Bool)

(declare-fun res!687372 () Bool)

(assert (=> b!1026883 (=> res!687372 e!579401)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64548 (_ BitVec 32)) Bool)

(assert (=> b!1026883 (= res!687372 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11217 thiss!1427) (mask!29774 thiss!1427))))))

(declare-fun b!1026884 () Bool)

(declare-fun e!579405 () Bool)

(declare-fun e!579400 () Bool)

(declare-fun mapRes!37802 () Bool)

(assert (=> b!1026884 (= e!579405 (and e!579400 mapRes!37802))))

(declare-fun condMapEmpty!37802 () Bool)

(declare-fun mapDefault!37802 () ValueCell!11421)

(assert (=> b!1026884 (= condMapEmpty!37802 (= (arr!31084 (_values!6093 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11421)) mapDefault!37802)))))

(declare-fun mapNonEmpty!37802 () Bool)

(declare-fun tp!72632 () Bool)

(declare-fun e!579406 () Bool)

(assert (=> mapNonEmpty!37802 (= mapRes!37802 (and tp!72632 e!579406))))

(declare-fun mapRest!37802 () (Array (_ BitVec 32) ValueCell!11421))

(declare-fun mapKey!37802 () (_ BitVec 32))

(declare-fun mapValue!37802 () ValueCell!11421)

(assert (=> mapNonEmpty!37802 (= (arr!31084 (_values!6093 thiss!1427)) (store mapRest!37802 mapKey!37802 mapValue!37802))))

(declare-fun b!1026885 () Bool)

(declare-fun e!579403 () Bool)

(assert (=> b!1026885 (= e!579404 e!579403)))

(declare-fun res!687369 () Bool)

(assert (=> b!1026885 (=> (not res!687369) (not e!579403))))

(declare-datatypes ((SeekEntryResult!9659 0))(
  ( (MissingZero!9659 (index!41007 (_ BitVec 32))) (Found!9659 (index!41008 (_ BitVec 32))) (Intermediate!9659 (undefined!10471 Bool) (index!41009 (_ BitVec 32)) (x!91361 (_ BitVec 32))) (Undefined!9659) (MissingVacant!9659 (index!41010 (_ BitVec 32))) )
))
(declare-fun lt!451871 () SeekEntryResult!9659)

(get-info :version)

(assert (=> b!1026885 (= res!687369 ((_ is Found!9659) lt!451871))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64548 (_ BitVec 32)) SeekEntryResult!9659)

(assert (=> b!1026885 (= lt!451871 (seekEntry!0 key!909 (_keys!11217 thiss!1427) (mask!29774 thiss!1427)))))

(declare-fun b!1026886 () Bool)

(assert (=> b!1026886 (= e!579401 true)))

(declare-fun lt!451867 () Bool)

(declare-datatypes ((List!21793 0))(
  ( (Nil!21790) (Cons!21789 (h!22987 (_ BitVec 64)) (t!30855 List!21793)) )
))
(declare-fun arrayNoDuplicates!0 (array!64548 (_ BitVec 32) List!21793) Bool)

(assert (=> b!1026886 (= lt!451867 (arrayNoDuplicates!0 (_keys!11217 thiss!1427) #b00000000000000000000000000000000 Nil!21790))))

(declare-fun res!687371 () Bool)

(assert (=> start!89530 (=> (not res!687371) (not e!579404))))

(declare-fun valid!2063 (LongMapFixedSize!5436) Bool)

(assert (=> start!89530 (= res!687371 (valid!2063 thiss!1427))))

(assert (=> start!89530 e!579404))

(declare-fun e!579402 () Bool)

(assert (=> start!89530 e!579402))

(assert (=> start!89530 true))

(declare-fun mapIsEmpty!37802 () Bool)

(assert (=> mapIsEmpty!37802 mapRes!37802))

(declare-fun tp_is_empty!24249 () Bool)

(declare-fun array_inv!24069 (array!64548) Bool)

(declare-fun array_inv!24070 (array!64550) Bool)

(assert (=> b!1026887 (= e!579402 (and tp!72633 tp_is_empty!24249 (array_inv!24069 (_keys!11217 thiss!1427)) (array_inv!24070 (_values!6093 thiss!1427)) e!579405))))

(declare-fun b!1026888 () Bool)

(assert (=> b!1026888 (= e!579400 tp_is_empty!24249)))

(declare-fun b!1026889 () Bool)

(assert (=> b!1026889 (= e!579406 tp_is_empty!24249)))

(declare-fun b!1026890 () Bool)

(assert (=> b!1026890 (= e!579403 (not e!579401))))

(declare-fun res!687370 () Bool)

(assert (=> b!1026890 (=> res!687370 e!579401)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026890 (= res!687370 (not (validMask!0 (mask!29774 thiss!1427))))))

(declare-fun lt!451870 () array!64548)

(declare-fun arrayContainsKey!0 (array!64548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026890 (not (arrayContainsKey!0 lt!451870 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33461 0))(
  ( (Unit!33462) )
))
(declare-fun lt!451869 () Unit!33461)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64548 (_ BitVec 32) (_ BitVec 64)) Unit!33461)

(assert (=> b!1026890 (= lt!451869 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11217 thiss!1427) (index!41008 lt!451871) key!909))))

(assert (=> b!1026890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451870 (mask!29774 thiss!1427))))

(declare-fun lt!451868 () Unit!33461)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64548 (_ BitVec 32) (_ BitVec 32)) Unit!33461)

(assert (=> b!1026890 (= lt!451868 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11217 thiss!1427) (index!41008 lt!451871) (mask!29774 thiss!1427)))))

(assert (=> b!1026890 (arrayNoDuplicates!0 lt!451870 #b00000000000000000000000000000000 Nil!21790)))

(declare-fun lt!451866 () Unit!33461)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64548 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21793) Unit!33461)

(assert (=> b!1026890 (= lt!451866 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11217 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41008 lt!451871) #b00000000000000000000000000000000 Nil!21790))))

(declare-fun arrayCountValidKeys!0 (array!64548 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026890 (= (arrayCountValidKeys!0 lt!451870 #b00000000000000000000000000000000 (size!31596 (_keys!11217 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11217 thiss!1427) #b00000000000000000000000000000000 (size!31596 (_keys!11217 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026890 (= lt!451870 (array!64549 (store (arr!31083 (_keys!11217 thiss!1427)) (index!41008 lt!451871) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31596 (_keys!11217 thiss!1427))))))

(declare-fun lt!451872 () Unit!33461)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64548 (_ BitVec 32) (_ BitVec 64)) Unit!33461)

(assert (=> b!1026890 (= lt!451872 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11217 thiss!1427) (index!41008 lt!451871) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89530 res!687371) b!1026882))

(assert (= (and b!1026882 res!687374) b!1026885))

(assert (= (and b!1026885 res!687369) b!1026890))

(assert (= (and b!1026890 (not res!687370)) b!1026881))

(assert (= (and b!1026881 (not res!687373)) b!1026883))

(assert (= (and b!1026883 (not res!687372)) b!1026886))

(assert (= (and b!1026884 condMapEmpty!37802) mapIsEmpty!37802))

(assert (= (and b!1026884 (not condMapEmpty!37802)) mapNonEmpty!37802))

(assert (= (and mapNonEmpty!37802 ((_ is ValueCellFull!11421) mapValue!37802)) b!1026889))

(assert (= (and b!1026884 ((_ is ValueCellFull!11421) mapDefault!37802)) b!1026888))

(assert (= b!1026887 b!1026884))

(assert (= start!89530 b!1026887))

(declare-fun m!945235 () Bool)

(assert (=> mapNonEmpty!37802 m!945235))

(declare-fun m!945237 () Bool)

(assert (=> b!1026883 m!945237))

(declare-fun m!945239 () Bool)

(assert (=> start!89530 m!945239))

(declare-fun m!945241 () Bool)

(assert (=> b!1026887 m!945241))

(declare-fun m!945243 () Bool)

(assert (=> b!1026887 m!945243))

(declare-fun m!945245 () Bool)

(assert (=> b!1026886 m!945245))

(declare-fun m!945247 () Bool)

(assert (=> b!1026890 m!945247))

(declare-fun m!945249 () Bool)

(assert (=> b!1026890 m!945249))

(declare-fun m!945251 () Bool)

(assert (=> b!1026890 m!945251))

(declare-fun m!945253 () Bool)

(assert (=> b!1026890 m!945253))

(declare-fun m!945255 () Bool)

(assert (=> b!1026890 m!945255))

(declare-fun m!945257 () Bool)

(assert (=> b!1026890 m!945257))

(declare-fun m!945259 () Bool)

(assert (=> b!1026890 m!945259))

(declare-fun m!945261 () Bool)

(assert (=> b!1026890 m!945261))

(declare-fun m!945263 () Bool)

(assert (=> b!1026890 m!945263))

(declare-fun m!945265 () Bool)

(assert (=> b!1026890 m!945265))

(declare-fun m!945267 () Bool)

(assert (=> b!1026890 m!945267))

(declare-fun m!945269 () Bool)

(assert (=> b!1026885 m!945269))

(check-sat (not b!1026883) (not b!1026887) (not b!1026885) tp_is_empty!24249 (not b!1026890) (not mapNonEmpty!37802) (not b_next!20529) (not start!89530) (not b!1026886) b_and!32775)
(check-sat b_and!32775 (not b_next!20529))
