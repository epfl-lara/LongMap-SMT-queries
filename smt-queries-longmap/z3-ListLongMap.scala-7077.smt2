; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89518 () Bool)

(assert start!89518)

(declare-fun b!1026708 () Bool)

(declare-fun b_free!20517 () Bool)

(declare-fun b_next!20517 () Bool)

(assert (=> b!1026708 (= b_free!20517 (not b_next!20517))))

(declare-fun tp!72597 () Bool)

(declare-fun b_and!32763 () Bool)

(assert (=> b!1026708 (= tp!72597 b_and!32763)))

(declare-fun b!1026701 () Bool)

(declare-fun res!687263 () Bool)

(declare-fun e!579260 () Bool)

(assert (=> b!1026701 (=> res!687263 e!579260)))

(declare-datatypes ((V!37189 0))(
  ( (V!37190 (val!12169 Int)) )
))
(declare-datatypes ((ValueCell!11415 0))(
  ( (ValueCellFull!11415 (v!14738 V!37189)) (EmptyCell!11415) )
))
(declare-datatypes ((array!64524 0))(
  ( (array!64525 (arr!31071 (Array (_ BitVec 32) (_ BitVec 64))) (size!31584 (_ BitVec 32))) )
))
(declare-datatypes ((array!64526 0))(
  ( (array!64527 (arr!31072 (Array (_ BitVec 32) ValueCell!11415)) (size!31585 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5424 0))(
  ( (LongMapFixedSize!5425 (defaultEntry!6064 Int) (mask!29764 (_ BitVec 32)) (extraKeys!5796 (_ BitVec 32)) (zeroValue!5900 V!37189) (minValue!5900 V!37189) (_size!2767 (_ BitVec 32)) (_keys!11211 array!64524) (_values!6087 array!64526) (_vacant!2767 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5424)

(assert (=> b!1026701 (= res!687263 (or (not (= (size!31585 (_values!6087 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29764 thiss!1427)))) (not (= (size!31584 (_keys!11211 thiss!1427)) (size!31585 (_values!6087 thiss!1427)))) (bvslt (mask!29764 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5796 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5796 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026702 () Bool)

(declare-fun e!579262 () Bool)

(declare-fun e!579258 () Bool)

(declare-fun mapRes!37784 () Bool)

(assert (=> b!1026702 (= e!579262 (and e!579258 mapRes!37784))))

(declare-fun condMapEmpty!37784 () Bool)

(declare-fun mapDefault!37784 () ValueCell!11415)

(assert (=> b!1026702 (= condMapEmpty!37784 (= (arr!31072 (_values!6087 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11415)) mapDefault!37784)))))

(declare-fun res!687261 () Bool)

(declare-fun e!579255 () Bool)

(assert (=> start!89518 (=> (not res!687261) (not e!579255))))

(declare-fun valid!2059 (LongMapFixedSize!5424) Bool)

(assert (=> start!89518 (= res!687261 (valid!2059 thiss!1427))))

(assert (=> start!89518 e!579255))

(declare-fun e!579256 () Bool)

(assert (=> start!89518 e!579256))

(assert (=> start!89518 true))

(declare-fun b!1026703 () Bool)

(declare-fun e!579257 () Bool)

(assert (=> b!1026703 (= e!579257 (not e!579260))))

(declare-fun res!687262 () Bool)

(assert (=> b!1026703 (=> res!687262 e!579260)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026703 (= res!687262 (not (validMask!0 (mask!29764 thiss!1427))))))

(declare-fun lt!451743 () array!64524)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026703 (not (arrayContainsKey!0 lt!451743 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33449 0))(
  ( (Unit!33450) )
))
(declare-fun lt!451741 () Unit!33449)

(declare-datatypes ((SeekEntryResult!9653 0))(
  ( (MissingZero!9653 (index!40983 (_ BitVec 32))) (Found!9653 (index!40984 (_ BitVec 32))) (Intermediate!9653 (undefined!10465 Bool) (index!40985 (_ BitVec 32)) (x!91339 (_ BitVec 32))) (Undefined!9653) (MissingVacant!9653 (index!40986 (_ BitVec 32))) )
))
(declare-fun lt!451744 () SeekEntryResult!9653)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64524 (_ BitVec 32) (_ BitVec 64)) Unit!33449)

(assert (=> b!1026703 (= lt!451741 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11211 thiss!1427) (index!40984 lt!451744) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64524 (_ BitVec 32)) Bool)

(assert (=> b!1026703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451743 (mask!29764 thiss!1427))))

(declare-fun lt!451746 () Unit!33449)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64524 (_ BitVec 32) (_ BitVec 32)) Unit!33449)

(assert (=> b!1026703 (= lt!451746 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11211 thiss!1427) (index!40984 lt!451744) (mask!29764 thiss!1427)))))

(declare-datatypes ((List!21787 0))(
  ( (Nil!21784) (Cons!21783 (h!22981 (_ BitVec 64)) (t!30849 List!21787)) )
))
(declare-fun arrayNoDuplicates!0 (array!64524 (_ BitVec 32) List!21787) Bool)

(assert (=> b!1026703 (arrayNoDuplicates!0 lt!451743 #b00000000000000000000000000000000 Nil!21784)))

(declare-fun lt!451742 () Unit!33449)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64524 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21787) Unit!33449)

(assert (=> b!1026703 (= lt!451742 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11211 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40984 lt!451744) #b00000000000000000000000000000000 Nil!21784))))

(declare-fun arrayCountValidKeys!0 (array!64524 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026703 (= (arrayCountValidKeys!0 lt!451743 #b00000000000000000000000000000000 (size!31584 (_keys!11211 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11211 thiss!1427) #b00000000000000000000000000000000 (size!31584 (_keys!11211 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026703 (= lt!451743 (array!64525 (store (arr!31071 (_keys!11211 thiss!1427)) (index!40984 lt!451744) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31584 (_keys!11211 thiss!1427))))))

(declare-fun lt!451740 () Unit!33449)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64524 (_ BitVec 32) (_ BitVec 64)) Unit!33449)

(assert (=> b!1026703 (= lt!451740 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11211 thiss!1427) (index!40984 lt!451744) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026704 () Bool)

(assert (=> b!1026704 (= e!579260 true)))

(declare-fun lt!451745 () Bool)

(assert (=> b!1026704 (= lt!451745 (arrayNoDuplicates!0 (_keys!11211 thiss!1427) #b00000000000000000000000000000000 Nil!21784))))

(declare-fun mapNonEmpty!37784 () Bool)

(declare-fun tp!72596 () Bool)

(declare-fun e!579261 () Bool)

(assert (=> mapNonEmpty!37784 (= mapRes!37784 (and tp!72596 e!579261))))

(declare-fun mapValue!37784 () ValueCell!11415)

(declare-fun mapKey!37784 () (_ BitVec 32))

(declare-fun mapRest!37784 () (Array (_ BitVec 32) ValueCell!11415))

(assert (=> mapNonEmpty!37784 (= (arr!31072 (_values!6087 thiss!1427)) (store mapRest!37784 mapKey!37784 mapValue!37784))))

(declare-fun b!1026705 () Bool)

(declare-fun tp_is_empty!24237 () Bool)

(assert (=> b!1026705 (= e!579261 tp_is_empty!24237)))

(declare-fun b!1026706 () Bool)

(declare-fun res!687264 () Bool)

(assert (=> b!1026706 (=> (not res!687264) (not e!579255))))

(assert (=> b!1026706 (= res!687264 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026707 () Bool)

(assert (=> b!1026707 (= e!579258 tp_is_empty!24237)))

(declare-fun array_inv!24059 (array!64524) Bool)

(declare-fun array_inv!24060 (array!64526) Bool)

(assert (=> b!1026708 (= e!579256 (and tp!72597 tp_is_empty!24237 (array_inv!24059 (_keys!11211 thiss!1427)) (array_inv!24060 (_values!6087 thiss!1427)) e!579262))))

(declare-fun b!1026709 () Bool)

(declare-fun res!687265 () Bool)

(assert (=> b!1026709 (=> res!687265 e!579260)))

(assert (=> b!1026709 (= res!687265 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11211 thiss!1427) (mask!29764 thiss!1427))))))

(declare-fun b!1026710 () Bool)

(assert (=> b!1026710 (= e!579255 e!579257)))

(declare-fun res!687266 () Bool)

(assert (=> b!1026710 (=> (not res!687266) (not e!579257))))

(get-info :version)

(assert (=> b!1026710 (= res!687266 ((_ is Found!9653) lt!451744))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64524 (_ BitVec 32)) SeekEntryResult!9653)

(assert (=> b!1026710 (= lt!451744 (seekEntry!0 key!909 (_keys!11211 thiss!1427) (mask!29764 thiss!1427)))))

(declare-fun mapIsEmpty!37784 () Bool)

(assert (=> mapIsEmpty!37784 mapRes!37784))

(assert (= (and start!89518 res!687261) b!1026706))

(assert (= (and b!1026706 res!687264) b!1026710))

(assert (= (and b!1026710 res!687266) b!1026703))

(assert (= (and b!1026703 (not res!687262)) b!1026701))

(assert (= (and b!1026701 (not res!687263)) b!1026709))

(assert (= (and b!1026709 (not res!687265)) b!1026704))

(assert (= (and b!1026702 condMapEmpty!37784) mapIsEmpty!37784))

(assert (= (and b!1026702 (not condMapEmpty!37784)) mapNonEmpty!37784))

(assert (= (and mapNonEmpty!37784 ((_ is ValueCellFull!11415) mapValue!37784)) b!1026705))

(assert (= (and b!1026702 ((_ is ValueCellFull!11415) mapDefault!37784)) b!1026707))

(assert (= b!1026708 b!1026702))

(assert (= start!89518 b!1026708))

(declare-fun m!945019 () Bool)

(assert (=> b!1026709 m!945019))

(declare-fun m!945021 () Bool)

(assert (=> start!89518 m!945021))

(declare-fun m!945023 () Bool)

(assert (=> b!1026704 m!945023))

(declare-fun m!945025 () Bool)

(assert (=> b!1026703 m!945025))

(declare-fun m!945027 () Bool)

(assert (=> b!1026703 m!945027))

(declare-fun m!945029 () Bool)

(assert (=> b!1026703 m!945029))

(declare-fun m!945031 () Bool)

(assert (=> b!1026703 m!945031))

(declare-fun m!945033 () Bool)

(assert (=> b!1026703 m!945033))

(declare-fun m!945035 () Bool)

(assert (=> b!1026703 m!945035))

(declare-fun m!945037 () Bool)

(assert (=> b!1026703 m!945037))

(declare-fun m!945039 () Bool)

(assert (=> b!1026703 m!945039))

(declare-fun m!945041 () Bool)

(assert (=> b!1026703 m!945041))

(declare-fun m!945043 () Bool)

(assert (=> b!1026703 m!945043))

(declare-fun m!945045 () Bool)

(assert (=> b!1026703 m!945045))

(declare-fun m!945047 () Bool)

(assert (=> mapNonEmpty!37784 m!945047))

(declare-fun m!945049 () Bool)

(assert (=> b!1026710 m!945049))

(declare-fun m!945051 () Bool)

(assert (=> b!1026708 m!945051))

(declare-fun m!945053 () Bool)

(assert (=> b!1026708 m!945053))

(check-sat (not b_next!20517) (not b!1026708) (not mapNonEmpty!37784) b_and!32763 (not b!1026703) (not start!89518) (not b!1026710) (not b!1026704) tp_is_empty!24237 (not b!1026709))
(check-sat b_and!32763 (not b_next!20517))
