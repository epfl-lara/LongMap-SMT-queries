; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89612 () Bool)

(assert start!89612)

(declare-fun b!1025917 () Bool)

(declare-fun b_free!20377 () Bool)

(declare-fun b_next!20377 () Bool)

(assert (=> b!1025917 (= b_free!20377 (not b_next!20377))))

(declare-fun tp!72176 () Bool)

(declare-fun b_and!32633 () Bool)

(assert (=> b!1025917 (= tp!72176 b_and!32633)))

(declare-fun mapIsEmpty!37574 () Bool)

(declare-fun mapRes!37574 () Bool)

(assert (=> mapIsEmpty!37574 mapRes!37574))

(declare-fun b!1025909 () Bool)

(declare-fun e!578421 () Bool)

(declare-fun e!578423 () Bool)

(assert (=> b!1025909 (= e!578421 e!578423)))

(declare-fun res!686505 () Bool)

(assert (=> b!1025909 (=> (not res!686505) (not e!578423))))

(declare-datatypes ((SeekEntryResult!9554 0))(
  ( (MissingZero!9554 (index!40587 (_ BitVec 32))) (Found!9554 (index!40588 (_ BitVec 32))) (Intermediate!9554 (undefined!10366 Bool) (index!40589 (_ BitVec 32)) (x!91078 (_ BitVec 32))) (Undefined!9554) (MissingVacant!9554 (index!40590 (_ BitVec 32))) )
))
(declare-fun lt!451173 () SeekEntryResult!9554)

(get-info :version)

(assert (=> b!1025909 (= res!686505 ((_ is Found!9554) lt!451173))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37003 0))(
  ( (V!37004 (val!12099 Int)) )
))
(declare-datatypes ((ValueCell!11345 0))(
  ( (ValueCellFull!11345 (v!14664 V!37003)) (EmptyCell!11345) )
))
(declare-datatypes ((array!64293 0))(
  ( (array!64294 (arr!30949 (Array (_ BitVec 32) (_ BitVec 64))) (size!31463 (_ BitVec 32))) )
))
(declare-datatypes ((array!64295 0))(
  ( (array!64296 (arr!30950 (Array (_ BitVec 32) ValueCell!11345)) (size!31464 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5284 0))(
  ( (LongMapFixedSize!5285 (defaultEntry!5994 Int) (mask!29708 (_ BitVec 32)) (extraKeys!5726 (_ BitVec 32)) (zeroValue!5830 V!37003) (minValue!5830 V!37003) (_size!2697 (_ BitVec 32)) (_keys!11179 array!64293) (_values!6017 array!64295) (_vacant!2697 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5284)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64293 (_ BitVec 32)) SeekEntryResult!9554)

(assert (=> b!1025909 (= lt!451173 (seekEntry!0 key!909 (_keys!11179 thiss!1427) (mask!29708 thiss!1427)))))

(declare-fun b!1025910 () Bool)

(declare-fun res!686506 () Bool)

(assert (=> b!1025910 (=> (not res!686506) (not e!578421))))

(assert (=> b!1025910 (= res!686506 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1025911 () Bool)

(declare-fun e!578420 () Bool)

(declare-fun tp_is_empty!24097 () Bool)

(assert (=> b!1025911 (= e!578420 tp_is_empty!24097)))

(declare-fun b!1025912 () Bool)

(declare-fun e!578424 () Bool)

(assert (=> b!1025912 (= e!578424 tp_is_empty!24097)))

(declare-fun b!1025913 () Bool)

(declare-fun e!578425 () Bool)

(assert (=> b!1025913 (= e!578425 (and e!578420 mapRes!37574))))

(declare-fun condMapEmpty!37574 () Bool)

(declare-fun mapDefault!37574 () ValueCell!11345)

(assert (=> b!1025913 (= condMapEmpty!37574 (= (arr!30950 (_values!6017 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11345)) mapDefault!37574)))))

(declare-fun b!1025914 () Bool)

(declare-fun res!686510 () Bool)

(declare-fun e!578419 () Bool)

(assert (=> b!1025914 (=> res!686510 e!578419)))

(declare-datatypes ((List!21721 0))(
  ( (Nil!21718) (Cons!21717 (h!22924 (_ BitVec 64)) (t!30775 List!21721)) )
))
(declare-fun contains!5974 (List!21721 (_ BitVec 64)) Bool)

(assert (=> b!1025914 (= res!686510 (contains!5974 Nil!21718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37574 () Bool)

(declare-fun tp!72177 () Bool)

(assert (=> mapNonEmpty!37574 (= mapRes!37574 (and tp!72177 e!578424))))

(declare-fun mapValue!37574 () ValueCell!11345)

(declare-fun mapRest!37574 () (Array (_ BitVec 32) ValueCell!11345))

(declare-fun mapKey!37574 () (_ BitVec 32))

(assert (=> mapNonEmpty!37574 (= (arr!30950 (_values!6017 thiss!1427)) (store mapRest!37574 mapKey!37574 mapValue!37574))))

(declare-fun res!686508 () Bool)

(assert (=> start!89612 (=> (not res!686508) (not e!578421))))

(declare-fun valid!2016 (LongMapFixedSize!5284) Bool)

(assert (=> start!89612 (= res!686508 (valid!2016 thiss!1427))))

(assert (=> start!89612 e!578421))

(declare-fun e!578418 () Bool)

(assert (=> start!89612 e!578418))

(assert (=> start!89612 true))

(declare-fun b!1025915 () Bool)

(declare-fun res!686509 () Bool)

(assert (=> b!1025915 (=> res!686509 e!578419)))

(declare-fun noDuplicate!1477 (List!21721) Bool)

(assert (=> b!1025915 (= res!686509 (not (noDuplicate!1477 Nil!21718)))))

(declare-fun b!1025916 () Bool)

(declare-fun res!686504 () Bool)

(assert (=> b!1025916 (=> res!686504 e!578419)))

(assert (=> b!1025916 (= res!686504 (contains!5974 Nil!21718 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun array_inv!23993 (array!64293) Bool)

(declare-fun array_inv!23994 (array!64295) Bool)

(assert (=> b!1025917 (= e!578418 (and tp!72176 tp_is_empty!24097 (array_inv!23993 (_keys!11179 thiss!1427)) (array_inv!23994 (_values!6017 thiss!1427)) e!578425))))

(declare-fun b!1025918 () Bool)

(assert (=> b!1025918 (= e!578423 (not e!578419))))

(declare-fun res!686507 () Bool)

(assert (=> b!1025918 (=> res!686507 e!578419)))

(assert (=> b!1025918 (= res!686507 (or (bvsge (size!31463 (_keys!11179 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31463 (_keys!11179 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64293 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1025918 (= (arrayCountValidKeys!0 (array!64294 (store (arr!30949 (_keys!11179 thiss!1427)) (index!40588 lt!451173) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31463 (_keys!11179 thiss!1427))) #b00000000000000000000000000000000 (size!31463 (_keys!11179 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11179 thiss!1427) #b00000000000000000000000000000000 (size!31463 (_keys!11179 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33364 0))(
  ( (Unit!33365) )
))
(declare-fun lt!451174 () Unit!33364)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64293 (_ BitVec 32) (_ BitVec 64)) Unit!33364)

(assert (=> b!1025918 (= lt!451174 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11179 thiss!1427) (index!40588 lt!451173) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1025919 () Bool)

(assert (=> b!1025919 (= e!578419 true)))

(declare-fun lt!451175 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64293 (_ BitVec 32) List!21721) Bool)

(assert (=> b!1025919 (= lt!451175 (arrayNoDuplicates!0 (_keys!11179 thiss!1427) #b00000000000000000000000000000000 Nil!21718))))

(assert (= (and start!89612 res!686508) b!1025910))

(assert (= (and b!1025910 res!686506) b!1025909))

(assert (= (and b!1025909 res!686505) b!1025918))

(assert (= (and b!1025918 (not res!686507)) b!1025915))

(assert (= (and b!1025915 (not res!686509)) b!1025914))

(assert (= (and b!1025914 (not res!686510)) b!1025916))

(assert (= (and b!1025916 (not res!686504)) b!1025919))

(assert (= (and b!1025913 condMapEmpty!37574) mapIsEmpty!37574))

(assert (= (and b!1025913 (not condMapEmpty!37574)) mapNonEmpty!37574))

(assert (= (and mapNonEmpty!37574 ((_ is ValueCellFull!11345) mapValue!37574)) b!1025912))

(assert (= (and b!1025913 ((_ is ValueCellFull!11345) mapDefault!37574)) b!1025911))

(assert (= b!1025917 b!1025913))

(assert (= start!89612 b!1025917))

(declare-fun m!944571 () Bool)

(assert (=> b!1025909 m!944571))

(declare-fun m!944573 () Bool)

(assert (=> b!1025916 m!944573))

(declare-fun m!944575 () Bool)

(assert (=> b!1025915 m!944575))

(declare-fun m!944577 () Bool)

(assert (=> mapNonEmpty!37574 m!944577))

(declare-fun m!944579 () Bool)

(assert (=> b!1025917 m!944579))

(declare-fun m!944581 () Bool)

(assert (=> b!1025917 m!944581))

(declare-fun m!944583 () Bool)

(assert (=> start!89612 m!944583))

(declare-fun m!944585 () Bool)

(assert (=> b!1025919 m!944585))

(declare-fun m!944587 () Bool)

(assert (=> b!1025914 m!944587))

(declare-fun m!944589 () Bool)

(assert (=> b!1025918 m!944589))

(declare-fun m!944591 () Bool)

(assert (=> b!1025918 m!944591))

(declare-fun m!944593 () Bool)

(assert (=> b!1025918 m!944593))

(declare-fun m!944595 () Bool)

(assert (=> b!1025918 m!944595))

(check-sat (not b!1025914) (not b!1025915) (not b!1025917) tp_is_empty!24097 (not mapNonEmpty!37574) (not b!1025919) (not b_next!20377) (not b!1025918) (not b!1025909) (not b!1025916) b_and!32633 (not start!89612))
(check-sat b_and!32633 (not b_next!20377))
