; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80556 () Bool)

(assert start!80556)

(declare-fun b!945055 () Bool)

(declare-fun b_free!18031 () Bool)

(declare-fun b_next!18031 () Bool)

(assert (=> b!945055 (= b_free!18031 (not b_next!18031))))

(declare-fun tp!62604 () Bool)

(declare-fun b_and!29459 () Bool)

(assert (=> b!945055 (= tp!62604 b_and!29459)))

(declare-fun b!945048 () Bool)

(declare-fun e!531484 () Bool)

(declare-fun e!531485 () Bool)

(declare-fun mapRes!32634 () Bool)

(assert (=> b!945048 (= e!531484 (and e!531485 mapRes!32634))))

(declare-fun condMapEmpty!32634 () Bool)

(declare-datatypes ((V!32351 0))(
  ( (V!32352 (val!10320 Int)) )
))
(declare-datatypes ((ValueCell!9788 0))(
  ( (ValueCellFull!9788 (v!12849 V!32351)) (EmptyCell!9788) )
))
(declare-datatypes ((array!57097 0))(
  ( (array!57098 (arr!27469 (Array (_ BitVec 32) ValueCell!9788)) (size!27936 (_ BitVec 32))) )
))
(declare-datatypes ((array!57099 0))(
  ( (array!57100 (arr!27470 (Array (_ BitVec 32) (_ BitVec 64))) (size!27937 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4726 0))(
  ( (LongMapFixedSize!4727 (defaultEntry!5658 Int) (mask!27345 (_ BitVec 32)) (extraKeys!5390 (_ BitVec 32)) (zeroValue!5494 V!32351) (minValue!5494 V!32351) (_size!2418 (_ BitVec 32)) (_keys!10564 array!57099) (_values!5681 array!57097) (_vacant!2418 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4726)

(declare-fun mapDefault!32634 () ValueCell!9788)

(assert (=> b!945048 (= condMapEmpty!32634 (= (arr!27469 (_values!5681 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9788)) mapDefault!32634)))))

(declare-fun res!634617 () Bool)

(declare-fun e!531487 () Bool)

(assert (=> start!80556 (=> (not res!634617) (not e!531487))))

(declare-fun valid!1815 (LongMapFixedSize!4726) Bool)

(assert (=> start!80556 (= res!634617 (valid!1815 thiss!1141))))

(assert (=> start!80556 e!531487))

(declare-fun e!531488 () Bool)

(assert (=> start!80556 e!531488))

(assert (=> start!80556 true))

(declare-fun b!945049 () Bool)

(declare-fun res!634614 () Bool)

(assert (=> b!945049 (=> (not res!634614) (not e!531487))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!945049 (= res!634614 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945050 () Bool)

(declare-fun res!634615 () Bool)

(assert (=> b!945050 (=> (not res!634615) (not e!531487))))

(declare-datatypes ((tuple2!13450 0))(
  ( (tuple2!13451 (_1!6736 (_ BitVec 64)) (_2!6736 V!32351)) )
))
(declare-datatypes ((List!19254 0))(
  ( (Nil!19251) (Cons!19250 (h!20407 tuple2!13450) (t!27563 List!19254)) )
))
(declare-datatypes ((ListLongMap!12149 0))(
  ( (ListLongMap!12150 (toList!6090 List!19254)) )
))
(declare-fun contains!5173 (ListLongMap!12149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3324 (array!57099 array!57097 (_ BitVec 32) (_ BitVec 32) V!32351 V!32351 (_ BitVec 32) Int) ListLongMap!12149)

(assert (=> b!945050 (= res!634615 (contains!5173 (getCurrentListMap!3324 (_keys!10564 thiss!1141) (_values!5681 thiss!1141) (mask!27345 thiss!1141) (extraKeys!5390 thiss!1141) (zeroValue!5494 thiss!1141) (minValue!5494 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5658 thiss!1141)) key!756))))

(declare-fun mapIsEmpty!32634 () Bool)

(assert (=> mapIsEmpty!32634 mapRes!32634))

(declare-fun b!945051 () Bool)

(declare-fun tp_is_empty!20539 () Bool)

(assert (=> b!945051 (= e!531485 tp_is_empty!20539)))

(declare-fun b!945052 () Bool)

(declare-fun res!634618 () Bool)

(assert (=> b!945052 (=> (not res!634618) (not e!531487))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9022 0))(
  ( (MissingZero!9022 (index!38459 (_ BitVec 32))) (Found!9022 (index!38460 (_ BitVec 32))) (Intermediate!9022 (undefined!9834 Bool) (index!38461 (_ BitVec 32)) (x!81063 (_ BitVec 32))) (Undefined!9022) (MissingVacant!9022 (index!38462 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57099 (_ BitVec 32)) SeekEntryResult!9022)

(assert (=> b!945052 (= res!634618 (not ((_ is Found!9022) (seekEntry!0 key!756 (_keys!10564 thiss!1141) (mask!27345 thiss!1141)))))))

(declare-fun b!945053 () Bool)

(declare-fun res!634619 () Bool)

(declare-fun e!531490 () Bool)

(assert (=> b!945053 (=> res!634619 e!531490)))

(declare-fun lt!425901 () (_ BitVec 32))

(assert (=> b!945053 (= res!634619 (or (not (= (size!27937 (_keys!10564 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27345 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27937 (_keys!10564 thiss!1141))) (bvslt lt!425901 #b00000000000000000000000000000000) (bvsgt lt!425901 (size!27937 (_keys!10564 thiss!1141)))))))

(declare-fun b!945054 () Bool)

(declare-fun e!531486 () Bool)

(assert (=> b!945054 (= e!531486 tp_is_empty!20539)))

(declare-fun mapNonEmpty!32634 () Bool)

(declare-fun tp!62603 () Bool)

(assert (=> mapNonEmpty!32634 (= mapRes!32634 (and tp!62603 e!531486))))

(declare-fun mapValue!32634 () ValueCell!9788)

(declare-fun mapKey!32634 () (_ BitVec 32))

(declare-fun mapRest!32634 () (Array (_ BitVec 32) ValueCell!9788))

(assert (=> mapNonEmpty!32634 (= (arr!27469 (_values!5681 thiss!1141)) (store mapRest!32634 mapKey!32634 mapValue!32634))))

(declare-fun array_inv!21426 (array!57099) Bool)

(declare-fun array_inv!21427 (array!57097) Bool)

(assert (=> b!945055 (= e!531488 (and tp!62604 tp_is_empty!20539 (array_inv!21426 (_keys!10564 thiss!1141)) (array_inv!21427 (_values!5681 thiss!1141)) e!531484))))

(declare-fun b!945056 () Bool)

(assert (=> b!945056 (= e!531490 true)))

(declare-fun lt!425900 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57099 (_ BitVec 32)) Bool)

(assert (=> b!945056 (= lt!425900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10564 thiss!1141) (mask!27345 thiss!1141)))))

(declare-fun b!945057 () Bool)

(assert (=> b!945057 (= e!531487 (not e!531490))))

(declare-fun res!634616 () Bool)

(assert (=> b!945057 (=> res!634616 e!531490)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!945057 (= res!634616 (not (validMask!0 (mask!27345 thiss!1141))))))

(declare-fun arrayScanForKey!0 (array!57099 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945057 (= lt!425901 (arrayScanForKey!0 (_keys!10564 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945057 (arrayContainsKey!0 (_keys!10564 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31814 0))(
  ( (Unit!31815) )
))
(declare-fun lt!425902 () Unit!31814)

(declare-fun lemmaKeyInListMapIsInArray!298 (array!57099 array!57097 (_ BitVec 32) (_ BitVec 32) V!32351 V!32351 (_ BitVec 64) Int) Unit!31814)

(assert (=> b!945057 (= lt!425902 (lemmaKeyInListMapIsInArray!298 (_keys!10564 thiss!1141) (_values!5681 thiss!1141) (mask!27345 thiss!1141) (extraKeys!5390 thiss!1141) (zeroValue!5494 thiss!1141) (minValue!5494 thiss!1141) key!756 (defaultEntry!5658 thiss!1141)))))

(assert (= (and start!80556 res!634617) b!945049))

(assert (= (and b!945049 res!634614) b!945052))

(assert (= (and b!945052 res!634618) b!945050))

(assert (= (and b!945050 res!634615) b!945057))

(assert (= (and b!945057 (not res!634616)) b!945053))

(assert (= (and b!945053 (not res!634619)) b!945056))

(assert (= (and b!945048 condMapEmpty!32634) mapIsEmpty!32634))

(assert (= (and b!945048 (not condMapEmpty!32634)) mapNonEmpty!32634))

(assert (= (and mapNonEmpty!32634 ((_ is ValueCellFull!9788) mapValue!32634)) b!945054))

(assert (= (and b!945048 ((_ is ValueCellFull!9788) mapDefault!32634)) b!945051))

(assert (= b!945055 b!945048))

(assert (= start!80556 b!945055))

(declare-fun m!879499 () Bool)

(assert (=> b!945050 m!879499))

(assert (=> b!945050 m!879499))

(declare-fun m!879501 () Bool)

(assert (=> b!945050 m!879501))

(declare-fun m!879503 () Bool)

(assert (=> b!945052 m!879503))

(declare-fun m!879505 () Bool)

(assert (=> b!945055 m!879505))

(declare-fun m!879507 () Bool)

(assert (=> b!945055 m!879507))

(declare-fun m!879509 () Bool)

(assert (=> start!80556 m!879509))

(declare-fun m!879511 () Bool)

(assert (=> b!945057 m!879511))

(declare-fun m!879513 () Bool)

(assert (=> b!945057 m!879513))

(declare-fun m!879515 () Bool)

(assert (=> b!945057 m!879515))

(declare-fun m!879517 () Bool)

(assert (=> b!945057 m!879517))

(declare-fun m!879519 () Bool)

(assert (=> mapNonEmpty!32634 m!879519))

(declare-fun m!879521 () Bool)

(assert (=> b!945056 m!879521))

(check-sat (not start!80556) (not b!945057) (not b!945052) (not b_next!18031) b_and!29459 (not b!945056) (not mapNonEmpty!32634) tp_is_empty!20539 (not b!945050) (not b!945055))
(check-sat b_and!29459 (not b_next!18031))
