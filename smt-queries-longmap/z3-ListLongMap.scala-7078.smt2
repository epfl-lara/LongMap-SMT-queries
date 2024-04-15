; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89520 () Bool)

(assert start!89520)

(declare-fun b!1026617 () Bool)

(declare-fun b_free!20521 () Bool)

(declare-fun b_next!20521 () Bool)

(assert (=> b!1026617 (= b_free!20521 (not b_next!20521))))

(declare-fun tp!72608 () Bool)

(declare-fun b_and!32741 () Bool)

(assert (=> b!1026617 (= tp!72608 b_and!32741)))

(declare-fun mapNonEmpty!37790 () Bool)

(declare-fun mapRes!37790 () Bool)

(declare-fun tp!72609 () Bool)

(declare-fun e!579217 () Bool)

(assert (=> mapNonEmpty!37790 (= mapRes!37790 (and tp!72609 e!579217))))

(declare-datatypes ((V!37195 0))(
  ( (V!37196 (val!12171 Int)) )
))
(declare-datatypes ((ValueCell!11417 0))(
  ( (ValueCellFull!11417 (v!14739 V!37195)) (EmptyCell!11417) )
))
(declare-fun mapRest!37790 () (Array (_ BitVec 32) ValueCell!11417))

(declare-fun mapKey!37790 () (_ BitVec 32))

(declare-datatypes ((array!64471 0))(
  ( (array!64472 (arr!31044 (Array (_ BitVec 32) (_ BitVec 64))) (size!31559 (_ BitVec 32))) )
))
(declare-datatypes ((array!64473 0))(
  ( (array!64474 (arr!31045 (Array (_ BitVec 32) ValueCell!11417)) (size!31560 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5428 0))(
  ( (LongMapFixedSize!5429 (defaultEntry!6066 Int) (mask!29763 (_ BitVec 32)) (extraKeys!5798 (_ BitVec 32)) (zeroValue!5902 V!37195) (minValue!5902 V!37195) (_size!2769 (_ BitVec 32)) (_keys!11209 array!64471) (_values!6089 array!64473) (_vacant!2769 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5428)

(declare-fun mapValue!37790 () ValueCell!11417)

(assert (=> mapNonEmpty!37790 (= (arr!31045 (_values!6089 thiss!1427)) (store mapRest!37790 mapKey!37790 mapValue!37790))))

(declare-fun b!1026610 () Bool)

(declare-fun e!579218 () Bool)

(declare-fun tp_is_empty!24241 () Bool)

(assert (=> b!1026610 (= e!579218 tp_is_empty!24241)))

(declare-fun b!1026611 () Bool)

(declare-fun e!579213 () Bool)

(declare-fun e!579215 () Bool)

(assert (=> b!1026611 (= e!579213 (not e!579215))))

(declare-fun res!687233 () Bool)

(assert (=> b!1026611 (=> res!687233 e!579215)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1026611 (= res!687233 (not (validMask!0 (mask!29763 thiss!1427))))))

(declare-fun lt!451586 () array!64471)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!64471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1026611 (not (arrayContainsKey!0 lt!451586 key!909 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!9648 0))(
  ( (MissingZero!9648 (index!40963 (_ BitVec 32))) (Found!9648 (index!40964 (_ BitVec 32))) (Intermediate!9648 (undefined!10460 Bool) (index!40965 (_ BitVec 32)) (x!91339 (_ BitVec 32))) (Undefined!9648) (MissingVacant!9648 (index!40966 (_ BitVec 32))) )
))
(declare-fun lt!451584 () SeekEntryResult!9648)

(declare-datatypes ((Unit!33347 0))(
  ( (Unit!33348) )
))
(declare-fun lt!451582 () Unit!33347)

(declare-fun lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (array!64471 (_ BitVec 32) (_ BitVec 64)) Unit!33347)

(assert (=> b!1026611 (= lt!451582 (lemmaArrayNoDuplicateRemoveOneThenNotContain!0 (_keys!11209 thiss!1427) (index!40964 lt!451584) key!909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64471 (_ BitVec 32)) Bool)

(assert (=> b!1026611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!451586 (mask!29763 thiss!1427))))

(declare-fun lt!451588 () Unit!33347)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (array!64471 (_ BitVec 32) (_ BitVec 32)) Unit!33347)

(assert (=> b!1026611 (= lt!451588 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpen!0 (_keys!11209 thiss!1427) (index!40964 lt!451584) (mask!29763 thiss!1427)))))

(declare-datatypes ((List!21821 0))(
  ( (Nil!21818) (Cons!21817 (h!23015 (_ BitVec 64)) (t!30874 List!21821)) )
))
(declare-fun arrayNoDuplicates!0 (array!64471 (_ BitVec 32) List!21821) Bool)

(assert (=> b!1026611 (arrayNoDuplicates!0 lt!451586 #b00000000000000000000000000000000 Nil!21818)))

(declare-fun lt!451585 () Unit!33347)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!64471 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!21821) Unit!33347)

(assert (=> b!1026611 (= lt!451585 (lemmaPutNonValidKeyPreservesNoDuplicate!0 (_keys!11209 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000 (index!40964 lt!451584) #b00000000000000000000000000000000 Nil!21818))))

(declare-fun arrayCountValidKeys!0 (array!64471 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026611 (= (arrayCountValidKeys!0 lt!451586 #b00000000000000000000000000000000 (size!31559 (_keys!11209 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11209 thiss!1427) #b00000000000000000000000000000000 (size!31559 (_keys!11209 thiss!1427))) #b00000000000000000000000000000001))))

(assert (=> b!1026611 (= lt!451586 (array!64472 (store (arr!31044 (_keys!11209 thiss!1427)) (index!40964 lt!451584) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31559 (_keys!11209 thiss!1427))))))

(declare-fun lt!451587 () Unit!33347)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64471 (_ BitVec 32) (_ BitVec 64)) Unit!33347)

(assert (=> b!1026611 (= lt!451587 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11209 thiss!1427) (index!40964 lt!451584) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!687234 () Bool)

(declare-fun e!579214 () Bool)

(assert (=> start!89520 (=> (not res!687234) (not e!579214))))

(declare-fun valid!2053 (LongMapFixedSize!5428) Bool)

(assert (=> start!89520 (= res!687234 (valid!2053 thiss!1427))))

(assert (=> start!89520 e!579214))

(declare-fun e!579219 () Bool)

(assert (=> start!89520 e!579219))

(assert (=> start!89520 true))

(declare-fun b!1026612 () Bool)

(assert (=> b!1026612 (= e!579214 e!579213)))

(declare-fun res!687232 () Bool)

(assert (=> b!1026612 (=> (not res!687232) (not e!579213))))

(get-info :version)

(assert (=> b!1026612 (= res!687232 ((_ is Found!9648) lt!451584))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!64471 (_ BitVec 32)) SeekEntryResult!9648)

(assert (=> b!1026612 (= lt!451584 (seekEntry!0 key!909 (_keys!11209 thiss!1427) (mask!29763 thiss!1427)))))

(declare-fun mapIsEmpty!37790 () Bool)

(assert (=> mapIsEmpty!37790 mapRes!37790))

(declare-fun b!1026613 () Bool)

(declare-fun res!687231 () Bool)

(assert (=> b!1026613 (=> (not res!687231) (not e!579214))))

(assert (=> b!1026613 (= res!687231 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026614 () Bool)

(assert (=> b!1026614 (= e!579215 true)))

(declare-fun lt!451583 () Bool)

(assert (=> b!1026614 (= lt!451583 (arrayNoDuplicates!0 (_keys!11209 thiss!1427) #b00000000000000000000000000000000 Nil!21818))))

(declare-fun b!1026615 () Bool)

(declare-fun res!687235 () Bool)

(assert (=> b!1026615 (=> res!687235 e!579215)))

(assert (=> b!1026615 (= res!687235 (or (not (= (size!31560 (_values!6089 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29763 thiss!1427)))) (not (= (size!31559 (_keys!11209 thiss!1427)) (size!31560 (_values!6089 thiss!1427)))) (bvslt (mask!29763 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5798 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5798 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1026616 () Bool)

(assert (=> b!1026616 (= e!579217 tp_is_empty!24241)))

(declare-fun e!579212 () Bool)

(declare-fun array_inv!24047 (array!64471) Bool)

(declare-fun array_inv!24048 (array!64473) Bool)

(assert (=> b!1026617 (= e!579219 (and tp!72608 tp_is_empty!24241 (array_inv!24047 (_keys!11209 thiss!1427)) (array_inv!24048 (_values!6089 thiss!1427)) e!579212))))

(declare-fun b!1026618 () Bool)

(assert (=> b!1026618 (= e!579212 (and e!579218 mapRes!37790))))

(declare-fun condMapEmpty!37790 () Bool)

(declare-fun mapDefault!37790 () ValueCell!11417)

(assert (=> b!1026618 (= condMapEmpty!37790 (= (arr!31045 (_values!6089 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11417)) mapDefault!37790)))))

(declare-fun b!1026619 () Bool)

(declare-fun res!687230 () Bool)

(assert (=> b!1026619 (=> res!687230 e!579215)))

(assert (=> b!1026619 (= res!687230 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11209 thiss!1427) (mask!29763 thiss!1427))))))

(assert (= (and start!89520 res!687234) b!1026613))

(assert (= (and b!1026613 res!687231) b!1026612))

(assert (= (and b!1026612 res!687232) b!1026611))

(assert (= (and b!1026611 (not res!687233)) b!1026615))

(assert (= (and b!1026615 (not res!687235)) b!1026619))

(assert (= (and b!1026619 (not res!687230)) b!1026614))

(assert (= (and b!1026618 condMapEmpty!37790) mapIsEmpty!37790))

(assert (= (and b!1026618 (not condMapEmpty!37790)) mapNonEmpty!37790))

(assert (= (and mapNonEmpty!37790 ((_ is ValueCellFull!11417) mapValue!37790)) b!1026616))

(assert (= (and b!1026618 ((_ is ValueCellFull!11417) mapDefault!37790)) b!1026610))

(assert (= b!1026617 b!1026618))

(assert (= start!89520 b!1026617))

(declare-fun m!944471 () Bool)

(assert (=> b!1026611 m!944471))

(declare-fun m!944473 () Bool)

(assert (=> b!1026611 m!944473))

(declare-fun m!944475 () Bool)

(assert (=> b!1026611 m!944475))

(declare-fun m!944477 () Bool)

(assert (=> b!1026611 m!944477))

(declare-fun m!944479 () Bool)

(assert (=> b!1026611 m!944479))

(declare-fun m!944481 () Bool)

(assert (=> b!1026611 m!944481))

(declare-fun m!944483 () Bool)

(assert (=> b!1026611 m!944483))

(declare-fun m!944485 () Bool)

(assert (=> b!1026611 m!944485))

(declare-fun m!944487 () Bool)

(assert (=> b!1026611 m!944487))

(declare-fun m!944489 () Bool)

(assert (=> b!1026611 m!944489))

(declare-fun m!944491 () Bool)

(assert (=> b!1026611 m!944491))

(declare-fun m!944493 () Bool)

(assert (=> mapNonEmpty!37790 m!944493))

(declare-fun m!944495 () Bool)

(assert (=> b!1026617 m!944495))

(declare-fun m!944497 () Bool)

(assert (=> b!1026617 m!944497))

(declare-fun m!944499 () Bool)

(assert (=> b!1026612 m!944499))

(declare-fun m!944501 () Bool)

(assert (=> b!1026614 m!944501))

(declare-fun m!944503 () Bool)

(assert (=> start!89520 m!944503))

(declare-fun m!944505 () Bool)

(assert (=> b!1026619 m!944505))

(check-sat tp_is_empty!24241 (not b!1026619) (not start!89520) (not b_next!20521) (not b!1026617) (not mapNonEmpty!37790) b_and!32741 (not b!1026614) (not b!1026612) (not b!1026611))
(check-sat b_and!32741 (not b_next!20521))
