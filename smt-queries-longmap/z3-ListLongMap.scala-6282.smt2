; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80352 () Bool)

(assert start!80352)

(declare-fun b!943656 () Bool)

(declare-fun b_free!18013 () Bool)

(declare-fun b_next!18013 () Bool)

(assert (=> b!943656 (= b_free!18013 (not b_next!18013))))

(declare-fun tp!62550 () Bool)

(declare-fun b_and!29405 () Bool)

(assert (=> b!943656 (= tp!62550 b_and!29405)))

(declare-fun b!943650 () Bool)

(declare-fun res!634014 () Bool)

(declare-fun e!530573 () Bool)

(assert (=> b!943650 (=> (not res!634014) (not e!530573))))

(declare-datatypes ((V!32327 0))(
  ( (V!32328 (val!10311 Int)) )
))
(declare-datatypes ((ValueCell!9779 0))(
  ( (ValueCellFull!9779 (v!12842 V!32327)) (EmptyCell!9779) )
))
(declare-datatypes ((array!56975 0))(
  ( (array!56976 (arr!27413 (Array (_ BitVec 32) ValueCell!9779)) (size!27881 (_ BitVec 32))) )
))
(declare-datatypes ((array!56977 0))(
  ( (array!56978 (arr!27414 (Array (_ BitVec 32) (_ BitVec 64))) (size!27882 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4708 0))(
  ( (LongMapFixedSize!4709 (defaultEntry!5649 Int) (mask!27280 (_ BitVec 32)) (extraKeys!5381 (_ BitVec 32)) (zeroValue!5485 V!32327) (minValue!5485 V!32327) (_size!2409 (_ BitVec 32)) (_keys!10522 array!56977) (_values!5672 array!56975) (_vacant!2409 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4708)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13498 0))(
  ( (tuple2!13499 (_1!6760 (_ BitVec 64)) (_2!6760 V!32327)) )
))
(declare-datatypes ((List!19264 0))(
  ( (Nil!19261) (Cons!19260 (h!20411 tuple2!13498) (t!27572 List!19264)) )
))
(declare-datatypes ((ListLongMap!12185 0))(
  ( (ListLongMap!12186 (toList!6108 List!19264)) )
))
(declare-fun contains!5123 (ListLongMap!12185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3271 (array!56977 array!56975 (_ BitVec 32) (_ BitVec 32) V!32327 V!32327 (_ BitVec 32) Int) ListLongMap!12185)

(assert (=> b!943650 (= res!634014 (contains!5123 (getCurrentListMap!3271 (_keys!10522 thiss!1141) (_values!5672 thiss!1141) (mask!27280 thiss!1141) (extraKeys!5381 thiss!1141) (zeroValue!5485 thiss!1141) (minValue!5485 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5649 thiss!1141)) key!756))))

(declare-fun b!943651 () Bool)

(declare-fun e!530576 () Bool)

(declare-fun tp_is_empty!20521 () Bool)

(assert (=> b!943651 (= e!530576 tp_is_empty!20521)))

(declare-fun mapNonEmpty!32607 () Bool)

(declare-fun mapRes!32607 () Bool)

(declare-fun tp!62549 () Bool)

(assert (=> mapNonEmpty!32607 (= mapRes!32607 (and tp!62549 e!530576))))

(declare-fun mapRest!32607 () (Array (_ BitVec 32) ValueCell!9779))

(declare-fun mapKey!32607 () (_ BitVec 32))

(declare-fun mapValue!32607 () ValueCell!9779)

(assert (=> mapNonEmpty!32607 (= (arr!27413 (_values!5672 thiss!1141)) (store mapRest!32607 mapKey!32607 mapValue!32607))))

(declare-fun b!943652 () Bool)

(declare-fun e!530577 () Bool)

(assert (=> b!943652 (= e!530577 tp_is_empty!20521)))

(declare-fun mapIsEmpty!32607 () Bool)

(assert (=> mapIsEmpty!32607 mapRes!32607))

(declare-fun b!943653 () Bool)

(declare-fun res!634012 () Bool)

(assert (=> b!943653 (=> (not res!634012) (not e!530573))))

(assert (=> b!943653 (= res!634012 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!634015 () Bool)

(assert (=> start!80352 (=> (not res!634015) (not e!530573))))

(declare-fun valid!1805 (LongMapFixedSize!4708) Bool)

(assert (=> start!80352 (= res!634015 (valid!1805 thiss!1141))))

(assert (=> start!80352 e!530573))

(declare-fun e!530574 () Bool)

(assert (=> start!80352 e!530574))

(assert (=> start!80352 true))

(declare-fun b!943654 () Bool)

(assert (=> b!943654 (= e!530573 (not true))))

(declare-fun arrayContainsKey!0 (array!56977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943654 (arrayContainsKey!0 (_keys!10522 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31707 0))(
  ( (Unit!31708) )
))
(declare-fun lt!425236 () Unit!31707)

(declare-fun lemmaKeyInListMapIsInArray!282 (array!56977 array!56975 (_ BitVec 32) (_ BitVec 32) V!32327 V!32327 (_ BitVec 64) Int) Unit!31707)

(assert (=> b!943654 (= lt!425236 (lemmaKeyInListMapIsInArray!282 (_keys!10522 thiss!1141) (_values!5672 thiss!1141) (mask!27280 thiss!1141) (extraKeys!5381 thiss!1141) (zeroValue!5485 thiss!1141) (minValue!5485 thiss!1141) key!756 (defaultEntry!5649 thiss!1141)))))

(declare-fun b!943655 () Bool)

(declare-fun e!530575 () Bool)

(assert (=> b!943655 (= e!530575 (and e!530577 mapRes!32607))))

(declare-fun condMapEmpty!32607 () Bool)

(declare-fun mapDefault!32607 () ValueCell!9779)

(assert (=> b!943655 (= condMapEmpty!32607 (= (arr!27413 (_values!5672 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9779)) mapDefault!32607)))))

(declare-fun array_inv!21356 (array!56977) Bool)

(declare-fun array_inv!21357 (array!56975) Bool)

(assert (=> b!943656 (= e!530574 (and tp!62550 tp_is_empty!20521 (array_inv!21356 (_keys!10522 thiss!1141)) (array_inv!21357 (_values!5672 thiss!1141)) e!530575))))

(declare-fun b!943657 () Bool)

(declare-fun res!634013 () Bool)

(assert (=> b!943657 (=> (not res!634013) (not e!530573))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9053 0))(
  ( (MissingZero!9053 (index!38583 (_ BitVec 32))) (Found!9053 (index!38584 (_ BitVec 32))) (Intermediate!9053 (undefined!9865 Bool) (index!38585 (_ BitVec 32)) (x!81051 (_ BitVec 32))) (Undefined!9053) (MissingVacant!9053 (index!38586 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56977 (_ BitVec 32)) SeekEntryResult!9053)

(assert (=> b!943657 (= res!634013 (not ((_ is Found!9053) (seekEntry!0 key!756 (_keys!10522 thiss!1141) (mask!27280 thiss!1141)))))))

(assert (= (and start!80352 res!634015) b!943653))

(assert (= (and b!943653 res!634012) b!943657))

(assert (= (and b!943657 res!634013) b!943650))

(assert (= (and b!943650 res!634014) b!943654))

(assert (= (and b!943655 condMapEmpty!32607) mapIsEmpty!32607))

(assert (= (and b!943655 (not condMapEmpty!32607)) mapNonEmpty!32607))

(assert (= (and mapNonEmpty!32607 ((_ is ValueCellFull!9779) mapValue!32607)) b!943651))

(assert (= (and b!943655 ((_ is ValueCellFull!9779) mapDefault!32607)) b!943652))

(assert (= b!943656 b!943655))

(assert (= start!80352 b!943656))

(declare-fun m!877249 () Bool)

(assert (=> mapNonEmpty!32607 m!877249))

(declare-fun m!877251 () Bool)

(assert (=> b!943650 m!877251))

(assert (=> b!943650 m!877251))

(declare-fun m!877253 () Bool)

(assert (=> b!943650 m!877253))

(declare-fun m!877255 () Bool)

(assert (=> start!80352 m!877255))

(declare-fun m!877257 () Bool)

(assert (=> b!943654 m!877257))

(declare-fun m!877259 () Bool)

(assert (=> b!943654 m!877259))

(declare-fun m!877261 () Bool)

(assert (=> b!943657 m!877261))

(declare-fun m!877263 () Bool)

(assert (=> b!943656 m!877263))

(declare-fun m!877265 () Bool)

(assert (=> b!943656 m!877265))

(check-sat (not start!80352) (not mapNonEmpty!32607) tp_is_empty!20521 (not b!943656) (not b!943650) (not b_next!18013) (not b!943657) (not b!943654) b_and!29405)
(check-sat b_and!29405 (not b_next!18013))
