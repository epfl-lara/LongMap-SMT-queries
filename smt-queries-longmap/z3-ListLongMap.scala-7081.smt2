; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89538 () Bool)

(assert start!89538)

(declare-fun b!1026887 () Bool)

(declare-fun b_free!20539 () Bool)

(declare-fun b_next!20539 () Bool)

(assert (=> b!1026887 (= b_free!20539 (not b_next!20539))))

(declare-fun tp!72663 () Bool)

(declare-fun b_and!32759 () Bool)

(assert (=> b!1026887 (= tp!72663 b_and!32759)))

(declare-fun mapNonEmpty!37817 () Bool)

(declare-fun mapRes!37817 () Bool)

(declare-fun tp!72662 () Bool)

(declare-fun e!579432 () Bool)

(assert (=> mapNonEmpty!37817 (= mapRes!37817 (and tp!72662 e!579432))))

(declare-fun mapKey!37817 () (_ BitVec 32))

(declare-datatypes ((V!37219 0))(
  ( (V!37220 (val!12180 Int)) )
))
(declare-datatypes ((ValueCell!11426 0))(
  ( (ValueCellFull!11426 (v!14748 V!37219)) (EmptyCell!11426) )
))
(declare-fun mapRest!37817 () (Array (_ BitVec 32) ValueCell!11426))

(declare-datatypes ((array!64507 0))(
  ( (array!64508 (arr!31062 (Array (_ BitVec 32) (_ BitVec 64))) (size!31577 (_ BitVec 32))) )
))
(declare-datatypes ((array!64509 0))(
  ( (array!64510 (arr!31063 (Array (_ BitVec 32) ValueCell!11426)) (size!31578 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5446 0))(
  ( (LongMapFixedSize!5447 (defaultEntry!6075 Int) (mask!29778 (_ BitVec 32)) (extraKeys!5807 (_ BitVec 32)) (zeroValue!5911 V!37219) (minValue!5911 V!37219) (_size!2778 (_ BitVec 32)) (_keys!11218 array!64507) (_values!6098 array!64509) (_vacant!2778 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5446)

(declare-fun mapValue!37817 () ValueCell!11426)

(assert (=> mapNonEmpty!37817 (= (arr!31063 (_values!6098 thiss!1427)) (store mapRest!37817 mapKey!37817 mapValue!37817))))

(declare-fun b!1026880 () Bool)

(declare-fun e!579435 () Bool)

(declare-fun e!579430 () Bool)

(assert (=> b!1026880 (= e!579435 e!579430)))

(declare-fun res!687397 () Bool)

(assert (=> b!1026880 (=> (not res!687397) (not e!579430))))

(declare-datatypes ((SeekEntryResult!9653 0))(
  ( (MissingZero!9653 (index!40983 (_ BitVec 32))) (Found!9653 (index!40984 (_ BitVec 32))) (Intermediate!9653 (undefined!10465 Bool) (index!40985 (_ BitVec 32)) (x!91368 (_ BitVec 32))) (Undefined!9653) (MissingVacant!9653 (index!40986 (_ BitVec 32))) )
))
(declare-fun lt!451771 () SeekEntryResult!9653)

(get-info :version)

(assert (=> b!1026880 (= res!687397 ((_ is Found!9653) lt!451771))))

(declare-fun key!909 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64507 (_ BitVec 32)) SeekEntryResult!9653)

(assert (=> b!1026880 (= lt!451771 (seekEntry!0 key!909 (_keys!11218 thiss!1427) (mask!29778 thiss!1427)))))

(declare-fun b!1026881 () Bool)

(declare-fun res!687393 () Bool)

(declare-fun e!579431 () Bool)

(assert (=> b!1026881 (=> res!687393 e!579431)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64507 (_ BitVec 32)) Bool)

(assert (=> b!1026881 (= res!687393 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11218 thiss!1427) (mask!29778 thiss!1427))))))

(declare-fun b!1026882 () Bool)

(assert (=> b!1026882 (= e!579430 (not e!579431))))

(declare-fun res!687392 () Bool)

(assert (=> b!1026882 (=> res!687392 e!579431)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026882 (= res!687392 (not (validMask!0 (mask!29778 thiss!1427))))))

(declare-fun lt!451773 () array!64507)

(declare-fun arrayContainsKey!0 (array!64507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026882 (not (arrayContainsKey!0 lt!451773 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33353 0))(
  ( (Unit!33354) )
))
(declare-fun lt!451772 () Unit!33353)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64507 (_ BitVec 32) (_ BitVec 64)) Unit!33353)

(assert (=> b!1026882 (= lt!451772 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11218 thiss!1427) (index!40984 lt!451771) key!909))))

(assert (=> b!1026882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451773 (mask!29778 thiss!1427))))

(declare-fun lt!451774 () Unit!33353)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64507 (_ BitVec 32) (_ BitVec 32)) Unit!33353)

(assert (=> b!1026882 (= lt!451774 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11218 thiss!1427) (index!40984 lt!451771) (mask!29778 thiss!1427)))))

(declare-datatypes ((List!21828 0))(
  ( (Nil!21825) (Cons!21824 (h!23022 (_ BitVec 64)) (t!30881 List!21828)) )
))
(declare-fun arrayNoDuplicates!0 (array!64507 (_ BitVec 32) List!21828) Bool)

(assert (=> b!1026882 (arrayNoDuplicates!0 lt!451773 #b00000000000000000000000000000000 Nil!21825)))

(declare-fun lt!451775 () Unit!33353)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64507 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21828) Unit!33353)

(assert (=> b!1026882 (= lt!451775 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11218 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40984 lt!451771) #b00000000000000000000000000000000 Nil!21825))))

(declare-fun arrayCountValidKeys!0 (array!64507 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026882 (= (arrayCountValidKeys!0 lt!451773 #b00000000000000000000000000000000 (size!31577 (_keys!11218 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11218 thiss!1427) #b00000000000000000000000000000000 (size!31577 (_keys!11218 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026882 (= lt!451773 (array!64508 (store (arr!31062 (_keys!11218 thiss!1427)) (index!40984 lt!451771) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31577 (_keys!11218 thiss!1427))))))

(declare-fun lt!451777 () Unit!33353)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64507 (_ BitVec 32) (_ BitVec 64)) Unit!33353)

(assert (=> b!1026882 (= lt!451777 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11218 thiss!1427) (index!40984 lt!451771) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!687396 () Bool)

(assert (=> start!89538 (=> (not res!687396) (not e!579435))))

(declare-fun valid!2058 (LongMapFixedSize!5446) Bool)

(assert (=> start!89538 (= res!687396 (valid!2058 thiss!1427))))

(assert (=> start!89538 e!579435))

(declare-fun e!579429 () Bool)

(assert (=> start!89538 e!579429))

(assert (=> start!89538 true))

(declare-fun b!1026883 () Bool)

(declare-fun e!579433 () Bool)

(declare-fun e!579434 () Bool)

(assert (=> b!1026883 (= e!579433 (and e!579434 mapRes!37817))))

(declare-fun condMapEmpty!37817 () Bool)

(declare-fun mapDefault!37817 () ValueCell!11426)

(assert (=> b!1026883 (= condMapEmpty!37817 (= (arr!31063 (_values!6098 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11426)) mapDefault!37817)))))

(declare-fun mapIsEmpty!37817 () Bool)

(assert (=> mapIsEmpty!37817 mapRes!37817))

(declare-fun b!1026884 () Bool)

(declare-fun tp_is_empty!24259 () Bool)

(assert (=> b!1026884 (= e!579432 tp_is_empty!24259)))

(declare-fun b!1026885 () Bool)

(declare-fun res!687395 () Bool)

(assert (=> b!1026885 (=> (not res!687395) (not e!579435))))

(assert (=> b!1026885 (= res!687395 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026886 () Bool)

(declare-fun res!687394 () Bool)

(assert (=> b!1026886 (=> res!687394 e!579431)))

(assert (=> b!1026886 (= res!687394 (or (not (= (size!31578 (_values!6098 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29778 thiss!1427)))) (not (= (size!31577 (_keys!11218 thiss!1427)) (size!31578 (_values!6098 thiss!1427)))) (bvslt (mask!29778 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5807 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5807 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun array_inv!24057 (array!64507) Bool)

(declare-fun array_inv!24058 (array!64509) Bool)

(assert (=> b!1026887 (= e!579429 (and tp!72663 tp_is_empty!24259 (array_inv!24057 (_keys!11218 thiss!1427)) (array_inv!24058 (_values!6098 thiss!1427)) e!579433))))

(declare-fun b!1026888 () Bool)

(assert (=> b!1026888 (= e!579434 tp_is_empty!24259)))

(declare-fun b!1026889 () Bool)

(assert (=> b!1026889 (= e!579431 true)))

(declare-fun lt!451776 () Bool)

(assert (=> b!1026889 (= lt!451776 (arrayNoDuplicates!0 (_keys!11218 thiss!1427) #b00000000000000000000000000000000 Nil!21825))))

(assert (= (and start!89538 res!687396) b!1026885))

(assert (= (and b!1026885 res!687395) b!1026880))

(assert (= (and b!1026880 res!687397) b!1026882))

(assert (= (and b!1026882 (not res!687392)) b!1026886))

(assert (= (and b!1026886 (not res!687394)) b!1026881))

(assert (= (and b!1026881 (not res!687393)) b!1026889))

(assert (= (and b!1026883 condMapEmpty!37817) mapIsEmpty!37817))

(assert (= (and b!1026883 (not condMapEmpty!37817)) mapNonEmpty!37817))

(assert (= (and mapNonEmpty!37817 ((_ is ValueCellFull!11426) mapValue!37817)) b!1026884))

(assert (= (and b!1026883 ((_ is ValueCellFull!11426) mapDefault!37817)) b!1026888))

(assert (= b!1026887 b!1026883))

(assert (= start!89538 b!1026887))

(declare-fun m!944795 () Bool)

(assert (=> b!1026889 m!944795))

(declare-fun m!944797 () Bool)

(assert (=> start!89538 m!944797))

(declare-fun m!944799 () Bool)

(assert (=> b!1026880 m!944799))

(declare-fun m!944801 () Bool)

(assert (=> b!1026882 m!944801))

(declare-fun m!944803 () Bool)

(assert (=> b!1026882 m!944803))

(declare-fun m!944805 () Bool)

(assert (=> b!1026882 m!944805))

(declare-fun m!944807 () Bool)

(assert (=> b!1026882 m!944807))

(declare-fun m!944809 () Bool)

(assert (=> b!1026882 m!944809))

(declare-fun m!944811 () Bool)

(assert (=> b!1026882 m!944811))

(declare-fun m!944813 () Bool)

(assert (=> b!1026882 m!944813))

(declare-fun m!944815 () Bool)

(assert (=> b!1026882 m!944815))

(declare-fun m!944817 () Bool)

(assert (=> b!1026882 m!944817))

(declare-fun m!944819 () Bool)

(assert (=> b!1026882 m!944819))

(declare-fun m!944821 () Bool)

(assert (=> b!1026882 m!944821))

(declare-fun m!944823 () Bool)

(assert (=> b!1026887 m!944823))

(declare-fun m!944825 () Bool)

(assert (=> b!1026887 m!944825))

(declare-fun m!944827 () Bool)

(assert (=> mapNonEmpty!37817 m!944827))

(declare-fun m!944829 () Bool)

(assert (=> b!1026881 m!944829))

(check-sat (not b!1026887) (not mapNonEmpty!37817) b_and!32759 (not b!1026881) (not b!1026880) (not b!1026882) (not start!89538) (not b_next!20539) (not b!1026889) tp_is_empty!24259)
(check-sat b_and!32759 (not b_next!20539))
