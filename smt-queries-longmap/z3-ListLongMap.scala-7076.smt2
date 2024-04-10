; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89512 () Bool)

(assert start!89512)

(declare-fun b!1026611 () Bool)

(declare-fun b_free!20511 () Bool)

(declare-fun b_next!20511 () Bool)

(assert (=> b!1026611 (= b_free!20511 (not b_next!20511))))

(declare-fun tp!72579 () Bool)

(declare-fun b_and!32757 () Bool)

(assert (=> b!1026611 (= tp!72579 b_and!32757)))

(declare-fun e!579185 () Bool)

(declare-fun e!579189 () Bool)

(declare-datatypes ((V!37181 0))(
  ( (V!37182 (val!12166 Int)) )
))
(declare-datatypes ((ValueCell!11412 0))(
  ( (ValueCellFull!11412 (v!14735 V!37181)) (EmptyCell!11412) )
))
(declare-datatypes ((array!64512 0))(
  ( (array!64513 (arr!31065 (Array (_ BitVec 32) (_ BitVec 64))) (size!31578 (_ BitVec 32))) )
))
(declare-datatypes ((array!64514 0))(
  ( (array!64515 (arr!31066 (Array (_ BitVec 32) ValueCell!11412)) (size!31579 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5418 0))(
  ( (LongMapFixedSize!5419 (defaultEntry!6061 Int) (mask!29759 (_ BitVec 32)) (extraKeys!5793 (_ BitVec 32)) (zeroValue!5897 V!37181) (minValue!5897 V!37181) (_size!2764 (_ BitVec 32)) (_keys!11208 array!64512) (_values!6084 array!64514) (_vacant!2764 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5418)

(declare-fun tp_is_empty!24231 () Bool)

(declare-fun array_inv!24055 (array!64512) Bool)

(declare-fun array_inv!24056 (array!64514) Bool)

(assert (=> b!1026611 (= e!579185 (and tp!72579 tp_is_empty!24231 (array_inv!24055 (_keys!11208 thiss!1427)) (array_inv!24056 (_values!6084 thiss!1427)) e!579189))))

(declare-fun res!687210 () Bool)

(declare-fun e!579188 () Bool)

(assert (=> start!89512 (=> (not res!687210) (not e!579188))))

(declare-fun valid!2057 (LongMapFixedSize!5418) Bool)

(assert (=> start!89512 (= res!687210 (valid!2057 thiss!1427))))

(assert (=> start!89512 e!579188))

(assert (=> start!89512 e!579185))

(assert (=> start!89512 true))

(declare-fun mapIsEmpty!37775 () Bool)

(declare-fun mapRes!37775 () Bool)

(assert (=> mapIsEmpty!37775 mapRes!37775))

(declare-fun mapNonEmpty!37775 () Bool)

(declare-fun tp!72578 () Bool)

(declare-fun e!579186 () Bool)

(assert (=> mapNonEmpty!37775 (= mapRes!37775 (and tp!72578 e!579186))))

(declare-fun mapRest!37775 () (Array (_ BitVec 32) ValueCell!11412))

(declare-fun mapValue!37775 () ValueCell!11412)

(declare-fun mapKey!37775 () (_ BitVec 32))

(assert (=> mapNonEmpty!37775 (= (arr!31066 (_values!6084 thiss!1427)) (store mapRest!37775 mapKey!37775 mapValue!37775))))

(declare-fun b!1026612 () Bool)

(declare-fun res!687208 () Bool)

(declare-fun e!579190 () Bool)

(assert (=> b!1026612 (=> res!687208 e!579190)))

(assert (=> b!1026612 (= res!687208 (or (not (= (size!31579 (_values!6084 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29759 thiss!1427)))) (not (= (size!31578 (_keys!11208 thiss!1427)) (size!31579 (_values!6084 thiss!1427)))) (bvslt (mask!29759 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5793 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5793 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026613 () Bool)

(declare-fun e!579183 () Bool)

(assert (=> b!1026613 (= e!579183 (not e!579190))))

(declare-fun res!687211 () Bool)

(assert (=> b!1026613 (=> res!687211 e!579190)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026613 (= res!687211 (not (validMask!0 (mask!29759 thiss!1427))))))

(declare-fun lt!451682 () array!64512)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026613 (not (arrayContainsKey!0 lt!451682 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33445 0))(
  ( (Unit!33446) )
))
(declare-fun lt!451683 () Unit!33445)

(declare-datatypes ((SeekEntryResult!9651 0))(
  ( (MissingZero!9651 (index!40975 (_ BitVec 32))) (Found!9651 (index!40976 (_ BitVec 32))) (Intermediate!9651 (undefined!10463 Bool) (index!40977 (_ BitVec 32)) (x!91329 (_ BitVec 32))) (Undefined!9651) (MissingVacant!9651 (index!40978 (_ BitVec 32))) )
))
(declare-fun lt!451679 () SeekEntryResult!9651)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64512 (_ BitVec 32) (_ BitVec 64)) Unit!33445)

(assert (=> b!1026613 (= lt!451683 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11208 thiss!1427) (index!40976 lt!451679) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64512 (_ BitVec 32)) Bool)

(assert (=> b!1026613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451682 (mask!29759 thiss!1427))))

(declare-fun lt!451678 () Unit!33445)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64512 (_ BitVec 32) (_ BitVec 32)) Unit!33445)

(assert (=> b!1026613 (= lt!451678 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11208 thiss!1427) (index!40976 lt!451679) (mask!29759 thiss!1427)))))

(declare-datatypes ((List!21785 0))(
  ( (Nil!21782) (Cons!21781 (h!22979 (_ BitVec 64)) (t!30847 List!21785)) )
))
(declare-fun arrayNoDuplicates!0 (array!64512 (_ BitVec 32) List!21785) Bool)

(assert (=> b!1026613 (arrayNoDuplicates!0 lt!451682 #b00000000000000000000000000000000 Nil!21782)))

(declare-fun lt!451677 () Unit!33445)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64512 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21785) Unit!33445)

(assert (=> b!1026613 (= lt!451677 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11208 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40976 lt!451679) #b00000000000000000000000000000000 Nil!21782))))

(declare-fun arrayCountValidKeys!0 (array!64512 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026613 (= (arrayCountValidKeys!0 lt!451682 #b00000000000000000000000000000000 (size!31578 (_keys!11208 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11208 thiss!1427) #b00000000000000000000000000000000 (size!31578 (_keys!11208 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026613 (= lt!451682 (array!64513 (store (arr!31065 (_keys!11208 thiss!1427)) (index!40976 lt!451679) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31578 (_keys!11208 thiss!1427))))))

(declare-fun lt!451681 () Unit!33445)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64512 (_ BitVec 32) (_ BitVec 64)) Unit!33445)

(assert (=> b!1026613 (= lt!451681 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11208 thiss!1427) (index!40976 lt!451679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026614 () Bool)

(assert (=> b!1026614 (= e!579188 e!579183)))

(declare-fun res!687209 () Bool)

(assert (=> b!1026614 (=> (not res!687209) (not e!579183))))

(get-info :version)

(assert (=> b!1026614 (= res!687209 ((_ is Found!9651) lt!451679))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64512 (_ BitVec 32)) SeekEntryResult!9651)

(assert (=> b!1026614 (= lt!451679 (seekEntry!0 key!909 (_keys!11208 thiss!1427) (mask!29759 thiss!1427)))))

(declare-fun b!1026615 () Bool)

(assert (=> b!1026615 (= e!579190 true)))

(declare-fun lt!451680 () Bool)

(assert (=> b!1026615 (= lt!451680 (arrayNoDuplicates!0 (_keys!11208 thiss!1427) #b00000000000000000000000000000000 Nil!21782))))

(declare-fun b!1026616 () Bool)

(declare-fun e!579184 () Bool)

(assert (=> b!1026616 (= e!579189 (and e!579184 mapRes!37775))))

(declare-fun condMapEmpty!37775 () Bool)

(declare-fun mapDefault!37775 () ValueCell!11412)

(assert (=> b!1026616 (= condMapEmpty!37775 (= (arr!31066 (_values!6084 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11412)) mapDefault!37775)))))

(declare-fun b!1026617 () Bool)

(assert (=> b!1026617 (= e!579184 tp_is_empty!24231)))

(declare-fun b!1026618 () Bool)

(declare-fun res!687212 () Bool)

(assert (=> b!1026618 (=> (not res!687212) (not e!579188))))

(assert (=> b!1026618 (= res!687212 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026619 () Bool)

(assert (=> b!1026619 (= e!579186 tp_is_empty!24231)))

(declare-fun b!1026620 () Bool)

(declare-fun res!687207 () Bool)

(assert (=> b!1026620 (=> res!687207 e!579190)))

(assert (=> b!1026620 (= res!687207 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11208 thiss!1427) (mask!29759 thiss!1427))))))

(assert (= (and start!89512 res!687210) b!1026618))

(assert (= (and b!1026618 res!687212) b!1026614))

(assert (= (and b!1026614 res!687209) b!1026613))

(assert (= (and b!1026613 (not res!687211)) b!1026612))

(assert (= (and b!1026612 (not res!687208)) b!1026620))

(assert (= (and b!1026620 (not res!687207)) b!1026615))

(assert (= (and b!1026616 condMapEmpty!37775) mapIsEmpty!37775))

(assert (= (and b!1026616 (not condMapEmpty!37775)) mapNonEmpty!37775))

(assert (= (and mapNonEmpty!37775 ((_ is ValueCellFull!11412) mapValue!37775)) b!1026619))

(assert (= (and b!1026616 ((_ is ValueCellFull!11412) mapDefault!37775)) b!1026617))

(assert (= b!1026611 b!1026616))

(assert (= start!89512 b!1026611))

(declare-fun m!944911 () Bool)

(assert (=> mapNonEmpty!37775 m!944911))

(declare-fun m!944913 () Bool)

(assert (=> b!1026615 m!944913))

(declare-fun m!944915 () Bool)

(assert (=> b!1026611 m!944915))

(declare-fun m!944917 () Bool)

(assert (=> b!1026611 m!944917))

(declare-fun m!944919 () Bool)

(assert (=> start!89512 m!944919))

(declare-fun m!944921 () Bool)

(assert (=> b!1026613 m!944921))

(declare-fun m!944923 () Bool)

(assert (=> b!1026613 m!944923))

(declare-fun m!944925 () Bool)

(assert (=> b!1026613 m!944925))

(declare-fun m!944927 () Bool)

(assert (=> b!1026613 m!944927))

(declare-fun m!944929 () Bool)

(assert (=> b!1026613 m!944929))

(declare-fun m!944931 () Bool)

(assert (=> b!1026613 m!944931))

(declare-fun m!944933 () Bool)

(assert (=> b!1026613 m!944933))

(declare-fun m!944935 () Bool)

(assert (=> b!1026613 m!944935))

(declare-fun m!944937 () Bool)

(assert (=> b!1026613 m!944937))

(declare-fun m!944939 () Bool)

(assert (=> b!1026613 m!944939))

(declare-fun m!944941 () Bool)

(assert (=> b!1026613 m!944941))

(declare-fun m!944943 () Bool)

(assert (=> b!1026614 m!944943))

(declare-fun m!944945 () Bool)

(assert (=> b!1026620 m!944945))

(check-sat (not b!1026615) (not b!1026613) (not start!89512) (not b_next!20511) (not b!1026614) (not b!1026620) b_and!32757 (not b!1026611) (not mapNonEmpty!37775) tp_is_empty!24231)
(check-sat b_and!32757 (not b_next!20511))
