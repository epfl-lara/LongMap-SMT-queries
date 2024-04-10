; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80408 () Bool)

(assert start!80408)

(declare-fun b!944456 () Bool)

(declare-fun b_free!18051 () Bool)

(declare-fun b_next!18051 () Bool)

(assert (=> b!944456 (= b_free!18051 (not b_next!18051))))

(declare-fun tp!62663 () Bool)

(declare-fun b_and!29469 () Bool)

(assert (=> b!944456 (= tp!62663 b_and!29469)))

(declare-fun res!634466 () Bool)

(declare-fun e!531117 () Bool)

(assert (=> start!80408 (=> (not res!634466) (not e!531117))))

(declare-datatypes ((V!32377 0))(
  ( (V!32378 (val!10330 Int)) )
))
(declare-datatypes ((ValueCell!9798 0))(
  ( (ValueCellFull!9798 (v!12862 V!32377)) (EmptyCell!9798) )
))
(declare-datatypes ((array!57086 0))(
  ( (array!57087 (arr!27468 (Array (_ BitVec 32) ValueCell!9798)) (size!27934 (_ BitVec 32))) )
))
(declare-datatypes ((array!57088 0))(
  ( (array!57089 (arr!27469 (Array (_ BitVec 32) (_ BitVec 64))) (size!27935 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4746 0))(
  ( (LongMapFixedSize!4747 (defaultEntry!5668 Int) (mask!27318 (_ BitVec 32)) (extraKeys!5400 (_ BitVec 32)) (zeroValue!5504 V!32377) (minValue!5504 V!32377) (_size!2428 (_ BitVec 32)) (_keys!10546 array!57088) (_values!5691 array!57086) (_vacant!2428 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4746)

(declare-fun valid!1814 (LongMapFixedSize!4746) Bool)

(assert (=> start!80408 (= res!634466 (valid!1814 thiss!1141))))

(assert (=> start!80408 e!531117))

(declare-fun e!531112 () Bool)

(assert (=> start!80408 e!531112))

(assert (=> start!80408 true))

(declare-fun b!944455 () Bool)

(declare-fun res!634465 () Bool)

(assert (=> b!944455 (=> (not res!634465) (not e!531117))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!944455 (= res!634465 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!20559 () Bool)

(declare-fun e!531118 () Bool)

(declare-fun array_inv!21340 (array!57088) Bool)

(declare-fun array_inv!21341 (array!57086) Bool)

(assert (=> b!944456 (= e!531112 (and tp!62663 tp_is_empty!20559 (array_inv!21340 (_keys!10546 thiss!1141)) (array_inv!21341 (_values!5691 thiss!1141)) e!531118))))

(declare-fun b!944457 () Bool)

(declare-fun e!531116 () Bool)

(assert (=> b!944457 (= e!531117 (not e!531116))))

(declare-fun res!634462 () Bool)

(assert (=> b!944457 (=> res!634462 e!531116)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944457 (= res!634462 (not (validMask!0 (mask!27318 thiss!1141))))))

(declare-fun lt!425634 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57088 (_ BitVec 32)) Bool)

(assert (=> b!944457 (arrayForallSeekEntryOrOpenFound!0 lt!425634 (_keys!10546 thiss!1141) (mask!27318 thiss!1141))))

(declare-datatypes ((Unit!31850 0))(
  ( (Unit!31851) )
))
(declare-fun lt!425637 () Unit!31850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31850)

(assert (=> b!944457 (= lt!425637 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10546 thiss!1141) (mask!27318 thiss!1141) #b00000000000000000000000000000000 lt!425634))))

(declare-fun arrayScanForKey!0 (array!57088 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944457 (= lt!425634 (arrayScanForKey!0 (_keys!10546 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944457 (arrayContainsKey!0 (_keys!10546 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!425635 () Unit!31850)

(declare-fun lemmaKeyInListMapIsInArray!305 (array!57088 array!57086 (_ BitVec 32) (_ BitVec 32) V!32377 V!32377 (_ BitVec 64) Int) Unit!31850)

(assert (=> b!944457 (= lt!425635 (lemmaKeyInListMapIsInArray!305 (_keys!10546 thiss!1141) (_values!5691 thiss!1141) (mask!27318 thiss!1141) (extraKeys!5400 thiss!1141) (zeroValue!5504 thiss!1141) (minValue!5504 thiss!1141) key!756 (defaultEntry!5668 thiss!1141)))))

(declare-fun b!944458 () Bool)

(declare-fun e!531114 () Bool)

(assert (=> b!944458 (= e!531114 tp_is_empty!20559)))

(declare-fun b!944459 () Bool)

(declare-fun mapRes!32664 () Bool)

(assert (=> b!944459 (= e!531118 (and e!531114 mapRes!32664))))

(declare-fun condMapEmpty!32664 () Bool)

(declare-fun mapDefault!32664 () ValueCell!9798)

(assert (=> b!944459 (= condMapEmpty!32664 (= (arr!27468 (_values!5691 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9798)) mapDefault!32664)))))

(declare-fun b!944460 () Bool)

(declare-fun res!634463 () Bool)

(assert (=> b!944460 (=> (not res!634463) (not e!531117))))

(declare-datatypes ((tuple2!13480 0))(
  ( (tuple2!13481 (_1!6751 (_ BitVec 64)) (_2!6751 V!32377)) )
))
(declare-datatypes ((List!19274 0))(
  ( (Nil!19271) (Cons!19270 (h!20421 tuple2!13480) (t!27591 List!19274)) )
))
(declare-datatypes ((ListLongMap!12177 0))(
  ( (ListLongMap!12178 (toList!6104 List!19274)) )
))
(declare-fun contains!5176 (ListLongMap!12177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3338 (array!57088 array!57086 (_ BitVec 32) (_ BitVec 32) V!32377 V!32377 (_ BitVec 32) Int) ListLongMap!12177)

(assert (=> b!944460 (= res!634463 (contains!5176 (getCurrentListMap!3338 (_keys!10546 thiss!1141) (_values!5691 thiss!1141) (mask!27318 thiss!1141) (extraKeys!5400 thiss!1141) (zeroValue!5504 thiss!1141) (minValue!5504 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5668 thiss!1141)) key!756))))

(declare-fun b!944461 () Bool)

(declare-fun res!634460 () Bool)

(assert (=> b!944461 (=> res!634460 e!531116)))

(assert (=> b!944461 (= res!634460 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10546 thiss!1141) (mask!27318 thiss!1141))))))

(declare-fun b!944462 () Bool)

(declare-fun res!634467 () Bool)

(assert (=> b!944462 (=> res!634467 e!531116)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944462 (= res!634467 (not (validKeyInArray!0 key!756)))))

(declare-fun b!944463 () Bool)

(assert (=> b!944463 (= e!531116 true)))

(declare-datatypes ((SeekEntryResult!9068 0))(
  ( (MissingZero!9068 (index!38643 (_ BitVec 32))) (Found!9068 (index!38644 (_ BitVec 32))) (Intermediate!9068 (undefined!9880 Bool) (index!38645 (_ BitVec 32)) (x!81119 (_ BitVec 32))) (Undefined!9068) (MissingVacant!9068 (index!38646 (_ BitVec 32))) )
))
(declare-fun lt!425636 () SeekEntryResult!9068)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57088 (_ BitVec 32)) SeekEntryResult!9068)

(assert (=> b!944463 (= lt!425636 (seekEntryOrOpen!0 key!756 (_keys!10546 thiss!1141) (mask!27318 thiss!1141)))))

(declare-fun b!944464 () Bool)

(declare-fun res!634461 () Bool)

(assert (=> b!944464 (=> (not res!634461) (not e!531117))))

(get-info :version)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57088 (_ BitVec 32)) SeekEntryResult!9068)

(assert (=> b!944464 (= res!634461 (not ((_ is Found!9068) (seekEntry!0 key!756 (_keys!10546 thiss!1141) (mask!27318 thiss!1141)))))))

(declare-fun mapIsEmpty!32664 () Bool)

(assert (=> mapIsEmpty!32664 mapRes!32664))

(declare-fun b!944465 () Bool)

(declare-fun res!634464 () Bool)

(assert (=> b!944465 (=> res!634464 e!531116)))

(assert (=> b!944465 (= res!634464 (not (= (size!27935 (_keys!10546 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27318 thiss!1141)))))))

(declare-fun mapNonEmpty!32664 () Bool)

(declare-fun tp!62662 () Bool)

(declare-fun e!531115 () Bool)

(assert (=> mapNonEmpty!32664 (= mapRes!32664 (and tp!62662 e!531115))))

(declare-fun mapRest!32664 () (Array (_ BitVec 32) ValueCell!9798))

(declare-fun mapKey!32664 () (_ BitVec 32))

(declare-fun mapValue!32664 () ValueCell!9798)

(assert (=> mapNonEmpty!32664 (= (arr!27468 (_values!5691 thiss!1141)) (store mapRest!32664 mapKey!32664 mapValue!32664))))

(declare-fun b!944466 () Bool)

(assert (=> b!944466 (= e!531115 tp_is_empty!20559)))

(assert (= (and start!80408 res!634466) b!944455))

(assert (= (and b!944455 res!634465) b!944464))

(assert (= (and b!944464 res!634461) b!944460))

(assert (= (and b!944460 res!634463) b!944457))

(assert (= (and b!944457 (not res!634462)) b!944465))

(assert (= (and b!944465 (not res!634464)) b!944461))

(assert (= (and b!944461 (not res!634460)) b!944462))

(assert (= (and b!944462 (not res!634467)) b!944463))

(assert (= (and b!944459 condMapEmpty!32664) mapIsEmpty!32664))

(assert (= (and b!944459 (not condMapEmpty!32664)) mapNonEmpty!32664))

(assert (= (and mapNonEmpty!32664 ((_ is ValueCellFull!9798) mapValue!32664)) b!944466))

(assert (= (and b!944459 ((_ is ValueCellFull!9798) mapDefault!32664)) b!944458))

(assert (= b!944456 b!944459))

(assert (= start!80408 b!944456))

(declare-fun m!878453 () Bool)

(assert (=> b!944462 m!878453))

(declare-fun m!878455 () Bool)

(assert (=> b!944457 m!878455))

(declare-fun m!878457 () Bool)

(assert (=> b!944457 m!878457))

(declare-fun m!878459 () Bool)

(assert (=> b!944457 m!878459))

(declare-fun m!878461 () Bool)

(assert (=> b!944457 m!878461))

(declare-fun m!878463 () Bool)

(assert (=> b!944457 m!878463))

(declare-fun m!878465 () Bool)

(assert (=> b!944457 m!878465))

(declare-fun m!878467 () Bool)

(assert (=> b!944461 m!878467))

(declare-fun m!878469 () Bool)

(assert (=> b!944464 m!878469))

(declare-fun m!878471 () Bool)

(assert (=> mapNonEmpty!32664 m!878471))

(declare-fun m!878473 () Bool)

(assert (=> b!944463 m!878473))

(declare-fun m!878475 () Bool)

(assert (=> b!944456 m!878475))

(declare-fun m!878477 () Bool)

(assert (=> b!944456 m!878477))

(declare-fun m!878479 () Bool)

(assert (=> start!80408 m!878479))

(declare-fun m!878481 () Bool)

(assert (=> b!944460 m!878481))

(assert (=> b!944460 m!878481))

(declare-fun m!878483 () Bool)

(assert (=> b!944460 m!878483))

(check-sat (not b!944460) (not b_next!18051) tp_is_empty!20559 (not b!944462) b_and!29469 (not b!944463) (not start!80408) (not b!944456) (not b!944464) (not mapNonEmpty!32664) (not b!944457) (not b!944461))
(check-sat b_and!29469 (not b_next!18051))
