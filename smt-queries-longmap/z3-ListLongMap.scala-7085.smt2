; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89562 () Bool)

(assert start!89562)

(declare-fun b!1027242 () Bool)

(declare-fun b_free!20563 () Bool)

(declare-fun b_next!20563 () Bool)

(assert (=> b!1027242 (= b_free!20563 (not b_next!20563))))

(declare-fun tp!72735 () Bool)

(declare-fun b_and!32783 () Bool)

(assert (=> b!1027242 (= tp!72735 b_and!32783)))

(declare-fun b!1027240 () Bool)

(declare-fun e!579719 () Bool)

(declare-fun e!579720 () Bool)

(declare-fun mapRes!37853 () Bool)

(assert (=> b!1027240 (= e!579719 (and e!579720 mapRes!37853))))

(declare-fun condMapEmpty!37853 () Bool)

(declare-datatypes ((V!37251 0))(
  ( (V!37252 (val!12192 Int)) )
))
(declare-datatypes ((ValueCell!11438 0))(
  ( (ValueCellFull!11438 (v!14760 V!37251)) (EmptyCell!11438) )
))
(declare-datatypes ((array!64555 0))(
  ( (array!64556 (arr!31086 (Array (_ BitVec 32) (_ BitVec 64))) (size!31601 (_ BitVec 32))) )
))
(declare-datatypes ((array!64557 0))(
  ( (array!64558 (arr!31087 (Array (_ BitVec 32) ValueCell!11438)) (size!31602 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5470 0))(
  ( (LongMapFixedSize!5471 (defaultEntry!6087 Int) (mask!29798 (_ BitVec 32)) (extraKeys!5819 (_ BitVec 32)) (zeroValue!5923 V!37251) (minValue!5923 V!37251) (_size!2790 (_ BitVec 32)) (_keys!11230 array!64555) (_values!6110 array!64557) (_vacant!2790 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5470)

(declare-fun mapDefault!37853 () ValueCell!11438)

(assert (=> b!1027240 (= condMapEmpty!37853 (= (arr!31087 (_values!6110 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11438)) mapDefault!37853)))))

(declare-fun b!1027241 () Bool)

(declare-fun res!687613 () Bool)

(declare-fun e!579722 () Bool)

(assert (=> b!1027241 (=> res!687613 e!579722)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64555 (_ BitVec 32)) Bool)

(assert (=> b!1027241 (= res!687613 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11230 thiss!1427) (mask!29798 thiss!1427))))))

(declare-fun mapNonEmpty!37853 () Bool)

(declare-fun tp!72734 () Bool)

(declare-fun e!579717 () Bool)

(assert (=> mapNonEmpty!37853 (= mapRes!37853 (and tp!72734 e!579717))))

(declare-fun mapValue!37853 () ValueCell!11438)

(declare-fun mapKey!37853 () (_ BitVec 32))

(declare-fun mapRest!37853 () (Array (_ BitVec 32) ValueCell!11438))

(assert (=> mapNonEmpty!37853 (= (arr!31087 (_values!6110 thiss!1427)) (store mapRest!37853 mapKey!37853 mapValue!37853))))

(declare-fun e!579716 () Bool)

(declare-fun tp_is_empty!24283 () Bool)

(declare-fun array_inv!24069 (array!64555) Bool)

(declare-fun array_inv!24070 (array!64557) Bool)

(assert (=> b!1027242 (= e!579716 (and tp!72735 tp_is_empty!24283 (array_inv!24069 (_keys!11230 thiss!1427)) (array_inv!24070 (_values!6110 thiss!1427)) e!579719))))

(declare-fun res!687609 () Bool)

(declare-fun e!579721 () Bool)

(assert (=> start!89562 (=> (not res!687609) (not e!579721))))

(declare-fun valid!2064 (LongMapFixedSize!5470) Bool)

(assert (=> start!89562 (= res!687609 (valid!2064 thiss!1427))))

(assert (=> start!89562 e!579721))

(assert (=> start!89562 e!579716))

(assert (=> start!89562 true))

(declare-fun b!1027243 () Bool)

(declare-fun e!579718 () Bool)

(assert (=> b!1027243 (= e!579718 (not e!579722))))

(declare-fun res!687610 () Bool)

(assert (=> b!1027243 (=> res!687610 e!579722)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1027243 (= res!687610 (not (validMask!0 (mask!29798 thiss!1427))))))

(declare-fun lt!452026 () array!64555)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1027243 (not (arrayContainsKey!0 lt!452026 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33365 0))(
  ( (Unit!33366) )
))
(declare-fun lt!452028 () Unit!33365)

(declare-datatypes ((SeekEntryResult!9661 0))(
  ( (MissingZero!9661 (index!41015 (_ BitVec 32))) (Found!9661 (index!41016 (_ BitVec 32))) (Intermediate!9661 (undefined!10473 Bool) (index!41017 (_ BitVec 32)) (x!91408 (_ BitVec 32))) (Undefined!9661) (MissingVacant!9661 (index!41018 (_ BitVec 32))) )
))
(declare-fun lt!452024 () SeekEntryResult!9661)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64555 (_ BitVec 32) (_ BitVec 64)) Unit!33365)

(assert (=> b!1027243 (= lt!452028 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11230 thiss!1427) (index!41016 lt!452024) key!909))))

(assert (=> b!1027243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!452026 (mask!29798 thiss!1427))))

(declare-fun lt!452027 () Unit!33365)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64555 (_ BitVec 32) (_ BitVec 32)) Unit!33365)

(assert (=> b!1027243 (= lt!452027 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11230 thiss!1427) (index!41016 lt!452024) (mask!29798 thiss!1427)))))

(declare-datatypes ((List!21836 0))(
  ( (Nil!21833) (Cons!21832 (h!23030 (_ BitVec 64)) (t!30889 List!21836)) )
))
(declare-fun arrayNoDuplicates!0 (array!64555 (_ BitVec 32) List!21836) Bool)

(assert (=> b!1027243 (arrayNoDuplicates!0 lt!452026 #b00000000000000000000000000000000 Nil!21833)))

(declare-fun lt!452023 () Unit!33365)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21836) Unit!33365)

(assert (=> b!1027243 (= lt!452023 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11230 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!41016 lt!452024) #b00000000000000000000000000000000 Nil!21833))))

(declare-fun arrayCountValidKeys!0 (array!64555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1027243 (= (arrayCountValidKeys!0 lt!452026 #b00000000000000000000000000000000 (size!31601 (_keys!11230 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11230 thiss!1427) #b00000000000000000000000000000000 (size!31601 (_keys!11230 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1027243 (= lt!452026 (array!64556 (store (arr!31086 (_keys!11230 thiss!1427)) (index!41016 lt!452024) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31601 (_keys!11230 thiss!1427))))))

(declare-fun lt!452025 () Unit!33365)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64555 (_ BitVec 32) (_ BitVec 64)) Unit!33365)

(assert (=> b!1027243 (= lt!452025 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11230 thiss!1427) (index!41016 lt!452024) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!37853 () Bool)

(assert (=> mapIsEmpty!37853 mapRes!37853))

(declare-fun b!1027244 () Bool)

(assert (=> b!1027244 (= e!579721 e!579718)))

(declare-fun res!687612 () Bool)

(assert (=> b!1027244 (=> (not res!687612) (not e!579718))))

(get-info :version)

(assert (=> b!1027244 (= res!687612 ((_ is Found!9661) lt!452024))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64555 (_ BitVec 32)) SeekEntryResult!9661)

(assert (=> b!1027244 (= lt!452024 (seekEntry!0 key!909 (_keys!11230 thiss!1427) (mask!29798 thiss!1427)))))

(declare-fun b!1027245 () Bool)

(declare-fun res!687611 () Bool)

(assert (=> b!1027245 (=> res!687611 e!579722)))

(assert (=> b!1027245 (= res!687611 (or (not (= (size!31602 (_values!6110 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29798 thiss!1427)))) (not (= (size!31601 (_keys!11230 thiss!1427)) (size!31602 (_values!6110 thiss!1427)))) (bvslt (mask!29798 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5819 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5819 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1027246 () Bool)

(assert (=> b!1027246 (= e!579717 tp_is_empty!24283)))

(declare-fun b!1027247 () Bool)

(assert (=> b!1027247 (= e!579722 true)))

(declare-fun lt!452029 () Bool)

(assert (=> b!1027247 (= lt!452029 (arrayNoDuplicates!0 (_keys!11230 thiss!1427) #b00000000000000000000000000000000 Nil!21833))))

(declare-fun b!1027248 () Bool)

(declare-fun res!687608 () Bool)

(assert (=> b!1027248 (=> (not res!687608) (not e!579721))))

(assert (=> b!1027248 (= res!687608 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1027249 () Bool)

(assert (=> b!1027249 (= e!579720 tp_is_empty!24283)))

(assert (= (and start!89562 res!687609) b!1027248))

(assert (= (and b!1027248 res!687608) b!1027244))

(assert (= (and b!1027244 res!687612) b!1027243))

(assert (= (and b!1027243 (not res!687610)) b!1027245))

(assert (= (and b!1027245 (not res!687611)) b!1027241))

(assert (= (and b!1027241 (not res!687613)) b!1027247))

(assert (= (and b!1027240 condMapEmpty!37853) mapIsEmpty!37853))

(assert (= (and b!1027240 (not condMapEmpty!37853)) mapNonEmpty!37853))

(assert (= (and mapNonEmpty!37853 ((_ is ValueCellFull!11438) mapValue!37853)) b!1027246))

(assert (= (and b!1027240 ((_ is ValueCellFull!11438) mapDefault!37853)) b!1027249))

(assert (= b!1027242 b!1027240))

(assert (= start!89562 b!1027242))

(declare-fun m!945227 () Bool)

(assert (=> b!1027244 m!945227))

(declare-fun m!945229 () Bool)

(assert (=> b!1027241 m!945229))

(declare-fun m!945231 () Bool)

(assert (=> b!1027243 m!945231))

(declare-fun m!945233 () Bool)

(assert (=> b!1027243 m!945233))

(declare-fun m!945235 () Bool)

(assert (=> b!1027243 m!945235))

(declare-fun m!945237 () Bool)

(assert (=> b!1027243 m!945237))

(declare-fun m!945239 () Bool)

(assert (=> b!1027243 m!945239))

(declare-fun m!945241 () Bool)

(assert (=> b!1027243 m!945241))

(declare-fun m!945243 () Bool)

(assert (=> b!1027243 m!945243))

(declare-fun m!945245 () Bool)

(assert (=> b!1027243 m!945245))

(declare-fun m!945247 () Bool)

(assert (=> b!1027243 m!945247))

(declare-fun m!945249 () Bool)

(assert (=> b!1027243 m!945249))

(declare-fun m!945251 () Bool)

(assert (=> b!1027243 m!945251))

(declare-fun m!945253 () Bool)

(assert (=> b!1027242 m!945253))

(declare-fun m!945255 () Bool)

(assert (=> b!1027242 m!945255))

(declare-fun m!945257 () Bool)

(assert (=> mapNonEmpty!37853 m!945257))

(declare-fun m!945259 () Bool)

(assert (=> start!89562 m!945259))

(declare-fun m!945261 () Bool)

(assert (=> b!1027247 m!945261))

(check-sat (not start!89562) b_and!32783 (not b!1027247) (not b!1027241) tp_is_empty!24283 (not b!1027242) (not b!1027243) (not b_next!20563) (not mapNonEmpty!37853) (not b!1027244))
(check-sat b_and!32783 (not b_next!20563))
