; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89618 () Bool)

(assert start!89618)

(declare-fun b!1026015 () Bool)

(declare-fun b_free!20383 () Bool)

(declare-fun b_next!20383 () Bool)

(assert (=> b!1026015 (= b_free!20383 (not b_next!20383))))

(declare-fun tp!72195 () Bool)

(declare-fun b_and!32639 () Bool)

(assert (=> b!1026015 (= tp!72195 b_and!32639)))

(declare-fun b!1026008 () Bool)

(declare-fun res!686573 () Bool)

(declare-fun e!578495 () Bool)

(assert (=> b!1026008 (=> res!686573 e!578495)))

(declare-datatypes ((List!21723 0))(
  ( (Nil!21720) (Cons!21719 (h!22926 (_ BitVec 64)) (t!30777 List!21723)) )
))
(declare-fun noDuplicate!1479 (List!21723) Bool)

(assert (=> b!1026008 (= res!686573 (not (noDuplicate!1479 Nil!21720)))))

(declare-fun b!1026009 () Bool)

(declare-fun res!686572 () Bool)

(assert (=> b!1026009 (=> res!686572 e!578495)))

(declare-fun contains!5976 (List!21723 (_ BitVec 64)) Bool)

(assert (=> b!1026009 (= res!686572 (contains!5976 Nil!21720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026010 () Bool)

(declare-fun e!578496 () Bool)

(declare-fun tp_is_empty!24103 () Bool)

(assert (=> b!1026010 (= e!578496 tp_is_empty!24103)))

(declare-fun b!1026011 () Bool)

(declare-fun e!578494 () Bool)

(declare-fun e!578491 () Bool)

(assert (=> b!1026011 (= e!578494 e!578491)))

(declare-fun res!686567 () Bool)

(assert (=> b!1026011 (=> (not res!686567) (not e!578491))))

(declare-datatypes ((SeekEntryResult!9557 0))(
  ( (MissingZero!9557 (index!40599 (_ BitVec 32))) (Found!9557 (index!40600 (_ BitVec 32))) (Intermediate!9557 (undefined!10369 Bool) (index!40601 (_ BitVec 32)) (x!91089 (_ BitVec 32))) (Undefined!9557) (MissingVacant!9557 (index!40602 (_ BitVec 32))) )
))
(declare-fun lt!451201 () SeekEntryResult!9557)

(get-info :version)

(assert (=> b!1026011 (= res!686567 ((_ is Found!9557) lt!451201))))

(declare-fun key!909 () (_ BitVec 64))

(declare-datatypes ((V!37011 0))(
  ( (V!37012 (val!12102 Int)) )
))
(declare-datatypes ((ValueCell!11348 0))(
  ( (ValueCellFull!11348 (v!14667 V!37011)) (EmptyCell!11348) )
))
(declare-datatypes ((array!64305 0))(
  ( (array!64306 (arr!30955 (Array (_ BitVec 32) (_ BitVec 64))) (size!31469 (_ BitVec 32))) )
))
(declare-datatypes ((array!64307 0))(
  ( (array!64308 (arr!30956 (Array (_ BitVec 32) ValueCell!11348)) (size!31470 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5290 0))(
  ( (LongMapFixedSize!5291 (defaultEntry!5997 Int) (mask!29713 (_ BitVec 32)) (extraKeys!5729 (_ BitVec 32)) (zeroValue!5833 V!37011) (minValue!5833 V!37011) (_size!2700 (_ BitVec 32)) (_keys!11182 array!64305) (_values!6020 array!64307) (_vacant!2700 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5290)

(declare-fun seekEntry!0 ((_ BitVec 64) array!64305 (_ BitVec 32)) SeekEntryResult!9557)

(assert (=> b!1026011 (= lt!451201 (seekEntry!0 key!909 (_keys!11182 thiss!1427) (mask!29713 thiss!1427)))))

(declare-fun mapNonEmpty!37583 () Bool)

(declare-fun mapRes!37583 () Bool)

(declare-fun tp!72194 () Bool)

(declare-fun e!578493 () Bool)

(assert (=> mapNonEmpty!37583 (= mapRes!37583 (and tp!72194 e!578493))))

(declare-fun mapValue!37583 () ValueCell!11348)

(declare-fun mapKey!37583 () (_ BitVec 32))

(declare-fun mapRest!37583 () (Array (_ BitVec 32) ValueCell!11348))

(assert (=> mapNonEmpty!37583 (= (arr!30956 (_values!6020 thiss!1427)) (store mapRest!37583 mapKey!37583 mapValue!37583))))

(declare-fun b!1026012 () Bool)

(declare-fun res!686570 () Bool)

(assert (=> b!1026012 (=> res!686570 e!578495)))

(assert (=> b!1026012 (= res!686570 (contains!5976 Nil!21720 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1026013 () Bool)

(declare-fun res!686571 () Bool)

(assert (=> b!1026013 (=> (not res!686571) (not e!578494))))

(assert (=> b!1026013 (= res!686571 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026014 () Bool)

(assert (=> b!1026014 (= e!578495 true)))

(declare-fun lt!451202 () Bool)

(declare-fun arrayNoDuplicates!0 (array!64305 (_ BitVec 32) List!21723) Bool)

(assert (=> b!1026014 (= lt!451202 (arrayNoDuplicates!0 (_keys!11182 thiss!1427) #b00000000000000000000000000000000 Nil!21720))))

(declare-fun e!578492 () Bool)

(declare-fun e!578490 () Bool)

(declare-fun array_inv!23997 (array!64305) Bool)

(declare-fun array_inv!23998 (array!64307) Bool)

(assert (=> b!1026015 (= e!578492 (and tp!72195 tp_is_empty!24103 (array_inv!23997 (_keys!11182 thiss!1427)) (array_inv!23998 (_values!6020 thiss!1427)) e!578490))))

(declare-fun b!1026016 () Bool)

(assert (=> b!1026016 (= e!578490 (and e!578496 mapRes!37583))))

(declare-fun condMapEmpty!37583 () Bool)

(declare-fun mapDefault!37583 () ValueCell!11348)

(assert (=> b!1026016 (= condMapEmpty!37583 (= (arr!30956 (_values!6020 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11348)) mapDefault!37583)))))

(declare-fun mapIsEmpty!37583 () Bool)

(assert (=> mapIsEmpty!37583 mapRes!37583))

(declare-fun res!686569 () Bool)

(assert (=> start!89618 (=> (not res!686569) (not e!578494))))

(declare-fun valid!2019 (LongMapFixedSize!5290) Bool)

(assert (=> start!89618 (= res!686569 (valid!2019 thiss!1427))))

(assert (=> start!89618 e!578494))

(assert (=> start!89618 e!578492))

(assert (=> start!89618 true))

(declare-fun b!1026017 () Bool)

(assert (=> b!1026017 (= e!578493 tp_is_empty!24103)))

(declare-fun b!1026018 () Bool)

(assert (=> b!1026018 (= e!578491 (not e!578495))))

(declare-fun res!686568 () Bool)

(assert (=> b!1026018 (=> res!686568 e!578495)))

(assert (=> b!1026018 (= res!686568 (or (bvsge (size!31469 (_keys!11182 thiss!1427)) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!31469 (_keys!11182 thiss!1427)))))))

(declare-fun arrayCountValidKeys!0 (array!64305 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1026018 (= (arrayCountValidKeys!0 (array!64306 (store (arr!30955 (_keys!11182 thiss!1427)) (index!40600 lt!451201) #b1000000000000000000000000000000000000000000000000000000000000000) (size!31469 (_keys!11182 thiss!1427))) #b00000000000000000000000000000000 (size!31469 (_keys!11182 thiss!1427))) (bvsub (arrayCountValidKeys!0 (_keys!11182 thiss!1427) #b00000000000000000000000000000000 (size!31469 (_keys!11182 thiss!1427))) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!33368 0))(
  ( (Unit!33369) )
))
(declare-fun lt!451200 () Unit!33368)

(declare-fun lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (array!64305 (_ BitVec 32) (_ BitVec 64)) Unit!33368)

(assert (=> b!1026018 (= lt!451200 (lemmaRemoveValidKeyDecreasesNumberOfValidKeysInArray!0 (_keys!11182 thiss!1427) (index!40600 lt!451201) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!89618 res!686569) b!1026013))

(assert (= (and b!1026013 res!686571) b!1026011))

(assert (= (and b!1026011 res!686567) b!1026018))

(assert (= (and b!1026018 (not res!686568)) b!1026008))

(assert (= (and b!1026008 (not res!686573)) b!1026009))

(assert (= (and b!1026009 (not res!686572)) b!1026012))

(assert (= (and b!1026012 (not res!686570)) b!1026014))

(assert (= (and b!1026016 condMapEmpty!37583) mapIsEmpty!37583))

(assert (= (and b!1026016 (not condMapEmpty!37583)) mapNonEmpty!37583))

(assert (= (and mapNonEmpty!37583 ((_ is ValueCellFull!11348) mapValue!37583)) b!1026017))

(assert (= (and b!1026016 ((_ is ValueCellFull!11348) mapDefault!37583)) b!1026010))

(assert (= b!1026015 b!1026016))

(assert (= start!89618 b!1026015))

(declare-fun m!944649 () Bool)

(assert (=> b!1026018 m!944649))

(declare-fun m!944651 () Bool)

(assert (=> b!1026018 m!944651))

(declare-fun m!944653 () Bool)

(assert (=> b!1026018 m!944653))

(declare-fun m!944655 () Bool)

(assert (=> b!1026018 m!944655))

(declare-fun m!944657 () Bool)

(assert (=> b!1026014 m!944657))

(declare-fun m!944659 () Bool)

(assert (=> b!1026011 m!944659))

(declare-fun m!944661 () Bool)

(assert (=> b!1026015 m!944661))

(declare-fun m!944663 () Bool)

(assert (=> b!1026015 m!944663))

(declare-fun m!944665 () Bool)

(assert (=> b!1026012 m!944665))

(declare-fun m!944667 () Bool)

(assert (=> b!1026009 m!944667))

(declare-fun m!944669 () Bool)

(assert (=> start!89618 m!944669))

(declare-fun m!944671 () Bool)

(assert (=> mapNonEmpty!37583 m!944671))

(declare-fun m!944673 () Bool)

(assert (=> b!1026008 m!944673))

(check-sat (not b!1026008) b_and!32639 tp_is_empty!24103 (not b!1026011) (not b!1026009) (not b!1026012) (not b!1026014) (not mapNonEmpty!37583) (not start!89618) (not b!1026018) (not b_next!20383) (not b!1026015))
(check-sat b_and!32639 (not b_next!20383))
