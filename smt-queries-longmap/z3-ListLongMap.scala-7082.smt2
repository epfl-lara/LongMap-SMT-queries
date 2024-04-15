; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89544 () Bool)

(assert start!89544)

(declare-fun b!1026976 () Bool)

(declare-fun b_free!20545 () Bool)

(declare-fun b_next!20545 () Bool)

(assert (=> b!1026976 (= b_free!20545 (not b_next!20545))))

(declare-fun tp!72680 () Bool)

(declare-fun b_and!32765 () Bool)

(assert (=> b!1026976 (= tp!72680 b_and!32765)))

(declare-fun b!1026970 () Bool)

(declare-fun res!687448 () Bool)

(declare-fun e!579503 () Bool)

(assert (=> b!1026970 (=> res!687448 e!579503)))

(declare-datatypes ((V!37227 0))(
  ( (V!37228 (val!12183 Int)) )
))
(declare-datatypes ((ValueCell!11429 0))(
  ( (ValueCellFull!11429 (v!14751 V!37227)) (EmptyCell!11429) )
))
(declare-datatypes ((array!64519 0))(
  ( (array!64520 (arr!31068 (Array (_ BitVec 32) (_ BitVec 64))) (size!31583 (_ BitVec 32))) )
))
(declare-datatypes ((array!64521 0))(
  ( (array!64522 (arr!31069 (Array (_ BitVec 32) ValueCell!11429)) (size!31584 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5452 0))(
  ( (LongMapFixedSize!5453 (defaultEntry!6078 Int) (mask!29783 (_ BitVec 32)) (extraKeys!5810 (_ BitVec 32)) (zeroValue!5914 V!37227) (minValue!5914 V!37227) (_size!2781 (_ BitVec 32)) (_keys!11221 array!64519) (_values!6101 array!64521) (_vacant!2781 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5452)

(assert (=> b!1026970 (= res!687448 (or (not (= (size!31584 (_values!6101 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29783 thiss!1427)))) (not (= (size!31583 (_keys!11221 thiss!1427)) (size!31584 (_values!6101 thiss!1427)))) (bvslt (mask!29783 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5810 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5810 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026971 () Bool)

(declare-fun e!579507 () Bool)

(assert (=> b!1026971 (= e!579507 (not e!579503))))

(declare-fun res!687451 () Bool)

(assert (=> b!1026971 (=> res!687451 e!579503)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026971 (= res!687451 (not (validMask!0 (mask!29783 thiss!1427))))))

(declare-fun lt!451835 () array!64519)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026971 (not (arrayContainsKey!0 lt!451835 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9656 0))(
  ( (MissingZero!9656 (index!40995 (_ BitVec 32))) (Found!9656 (index!40996 (_ BitVec 32))) (Intermediate!9656 (undefined!10468 Bool) (index!40997 (_ BitVec 32)) (x!91379 (_ BitVec 32))) (Undefined!9656) (MissingVacant!9656 (index!40998 (_ BitVec 32))) )
))
(declare-fun lt!451839 () SeekEntryResult!9656)

(declare-datatypes ((Unit!33357 0))(
  ( (Unit!33358) )
))
(declare-fun lt!451834 () Unit!33357)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64519 (_ BitVec 32) (_ BitVec 64)) Unit!33357)

(assert (=> b!1026971 (= lt!451834 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11221 thiss!1427) (index!40996 lt!451839) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64519 (_ BitVec 32)) Bool)

(assert (=> b!1026971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451835 (mask!29783 thiss!1427))))

(declare-fun lt!451837 () Unit!33357)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64519 (_ BitVec 32) (_ BitVec 32)) Unit!33357)

(assert (=> b!1026971 (= lt!451837 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11221 thiss!1427) (index!40996 lt!451839) (mask!29783 thiss!1427)))))

(declare-datatypes ((List!21831 0))(
  ( (Nil!21828) (Cons!21827 (h!23025 (_ BitVec 64)) (t!30884 List!21831)) )
))
(declare-fun arrayNoDuplicates!0 (array!64519 (_ BitVec 32) List!21831) Bool)

(assert (=> b!1026971 (arrayNoDuplicates!0 lt!451835 #b00000000000000000000000000000000 Nil!21828)))

(declare-fun lt!451836 () Unit!33357)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64519 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21831) Unit!33357)

(assert (=> b!1026971 (= lt!451836 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11221 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40996 lt!451839) #b00000000000000000000000000000000 Nil!21828))))

(declare-fun arrayCountValidKeys!0 (array!64519 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026971 (= (arrayCountValidKeys!0 lt!451835 #b00000000000000000000000000000000 (size!31583 (_keys!11221 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11221 thiss!1427) #b00000000000000000000000000000000 (size!31583 (_keys!11221 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026971 (= lt!451835 (array!64520 (store (arr!31068 (_keys!11221 thiss!1427)) (index!40996 lt!451839) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31583 (_keys!11221 thiss!1427))))))

(declare-fun lt!451840 () Unit!33357)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64519 (_ BitVec 32) (_ BitVec 64)) Unit!33357)

(assert (=> b!1026971 (= lt!451840 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11221 thiss!1427) (index!40996 lt!451839) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37826 () Bool)

(declare-fun mapRes!37826 () Bool)

(assert (=> mapIsEmpty!37826 mapRes!37826))

(declare-fun b!1026972 () Bool)

(declare-fun e!579500 () Bool)

(declare-fun e!579502 () Bool)

(assert (=> b!1026972 (= e!579500 (and e!579502 mapRes!37826))))

(declare-fun condMapEmpty!37826 () Bool)

(declare-fun mapDefault!37826 () ValueCell!11429)

(assert (=> b!1026972 (= condMapEmpty!37826 (= (arr!31069 (_values!6101 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11429)) mapDefault!37826)))))

(declare-fun b!1026974 () Bool)

(declare-fun res!687447 () Bool)

(assert (=> b!1026974 (=> res!687447 e!579503)))

(assert (=> b!1026974 (= res!687447 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11221 thiss!1427) (mask!29783 thiss!1427))))))

(declare-fun mapNonEmpty!37826 () Bool)

(declare-fun tp!72681 () Bool)

(declare-fun e!579501 () Bool)

(assert (=> mapNonEmpty!37826 (= mapRes!37826 (and tp!72681 e!579501))))

(declare-fun mapValue!37826 () ValueCell!11429)

(declare-fun mapKey!37826 () (_ BitVec 32))

(declare-fun mapRest!37826 () (Array (_ BitVec 32) ValueCell!11429))

(assert (=> mapNonEmpty!37826 (= (arr!31069 (_values!6101 thiss!1427)) (store mapRest!37826 mapKey!37826 mapValue!37826))))

(declare-fun b!1026975 () Bool)

(assert (=> b!1026975 (= e!579503 true)))

(declare-fun lt!451838 () Bool)

(assert (=> b!1026975 (= lt!451838 (arrayNoDuplicates!0 (_keys!11221 thiss!1427) #b00000000000000000000000000000000 Nil!21828))))

(declare-fun tp_is_empty!24265 () Bool)

(declare-fun e!579505 () Bool)

(declare-fun array_inv!24059 (array!64519) Bool)

(declare-fun array_inv!24060 (array!64521) Bool)

(assert (=> b!1026976 (= e!579505 (and tp!72680 tp_is_empty!24265 (array_inv!24059 (_keys!11221 thiss!1427)) (array_inv!24060 (_values!6101 thiss!1427)) e!579500))))

(declare-fun b!1026977 () Bool)

(assert (=> b!1026977 (= e!579502 tp_is_empty!24265)))

(declare-fun b!1026978 () Bool)

(declare-fun e!579504 () Bool)

(assert (=> b!1026978 (= e!579504 e!579507)))

(declare-fun res!687449 () Bool)

(assert (=> b!1026978 (=> (not res!687449) (not e!579507))))

(get-info :version)

(assert (=> b!1026978 (= res!687449 ((_ is Found!9656) lt!451839))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64519 (_ BitVec 32)) SeekEntryResult!9656)

(assert (=> b!1026978 (= lt!451839 (seekEntry!0 key!909 (_keys!11221 thiss!1427) (mask!29783 thiss!1427)))))

(declare-fun b!1026979 () Bool)

(assert (=> b!1026979 (= e!579501 tp_is_empty!24265)))

(declare-fun res!687450 () Bool)

(assert (=> start!89544 (=> (not res!687450) (not e!579504))))

(declare-fun valid!2059 (LongMapFixedSize!5452) Bool)

(assert (=> start!89544 (= res!687450 (valid!2059 thiss!1427))))

(assert (=> start!89544 e!579504))

(assert (=> start!89544 e!579505))

(assert (=> start!89544 true))

(declare-fun b!1026973 () Bool)

(declare-fun res!687446 () Bool)

(assert (=> b!1026973 (=> (not res!687446) (not e!579504))))

(assert (=> b!1026973 (= res!687446 (not (= key!909 (bvneg key!909))))))

(assert (= (and start!89544 res!687450) b!1026973))

(assert (= (and b!1026973 res!687446) b!1026978))

(assert (= (and b!1026978 res!687449) b!1026971))

(assert (= (and b!1026971 (not res!687451)) b!1026970))

(assert (= (and b!1026970 (not res!687448)) b!1026974))

(assert (= (and b!1026974 (not res!687447)) b!1026975))

(assert (= (and b!1026972 condMapEmpty!37826) mapIsEmpty!37826))

(assert (= (and b!1026972 (not condMapEmpty!37826)) mapNonEmpty!37826))

(assert (= (and mapNonEmpty!37826 ((_ is ValueCellFull!11429) mapValue!37826)) b!1026979))

(assert (= (and b!1026972 ((_ is ValueCellFull!11429) mapDefault!37826)) b!1026977))

(assert (= b!1026976 b!1026972))

(assert (= start!89544 b!1026976))

(declare-fun m!944903 () Bool)

(assert (=> b!1026978 m!944903))

(declare-fun m!944905 () Bool)

(assert (=> b!1026971 m!944905))

(declare-fun m!944907 () Bool)

(assert (=> b!1026971 m!944907))

(declare-fun m!944909 () Bool)

(assert (=> b!1026971 m!944909))

(declare-fun m!944911 () Bool)

(assert (=> b!1026971 m!944911))

(declare-fun m!944913 () Bool)

(assert (=> b!1026971 m!944913))

(declare-fun m!944915 () Bool)

(assert (=> b!1026971 m!944915))

(declare-fun m!944917 () Bool)

(assert (=> b!1026971 m!944917))

(declare-fun m!944919 () Bool)

(assert (=> b!1026971 m!944919))

(declare-fun m!944921 () Bool)

(assert (=> b!1026971 m!944921))

(declare-fun m!944923 () Bool)

(assert (=> b!1026971 m!944923))

(declare-fun m!944925 () Bool)

(assert (=> b!1026971 m!944925))

(declare-fun m!944927 () Bool)

(assert (=> start!89544 m!944927))

(declare-fun m!944929 () Bool)

(assert (=> mapNonEmpty!37826 m!944929))

(declare-fun m!944931 () Bool)

(assert (=> b!1026976 m!944931))

(declare-fun m!944933 () Bool)

(assert (=> b!1026976 m!944933))

(declare-fun m!944935 () Bool)

(assert (=> b!1026975 m!944935))

(declare-fun m!944937 () Bool)

(assert (=> b!1026974 m!944937))

(check-sat (not b!1026974) (not b_next!20545) tp_is_empty!24265 (not mapNonEmpty!37826) (not b!1026975) (not start!89544) (not b!1026978) b_and!32765 (not b!1026971) (not b!1026976))
(check-sat b_and!32765 (not b_next!20545))
