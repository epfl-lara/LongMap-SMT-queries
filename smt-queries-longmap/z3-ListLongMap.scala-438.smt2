; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8242 () Bool)

(assert start!8242)

(declare-fun b!52349 () Bool)

(declare-fun b_free!1649 () Bool)

(declare-fun b_next!1649 () Bool)

(assert (=> b!52349 (= b_free!1649 (not b_next!1649))))

(declare-fun tp!7047 () Bool)

(declare-fun b_and!2859 () Bool)

(assert (=> b!52349 (= tp!7047 b_and!2859)))

(declare-fun b!52340 () Bool)

(declare-fun b_free!1651 () Bool)

(declare-fun b_next!1651 () Bool)

(assert (=> b!52340 (= b_free!1651 (not b_next!1651))))

(declare-fun tp!7050 () Bool)

(declare-fun b_and!2861 () Bool)

(assert (=> b!52340 (= tp!7050 b_and!2861)))

(declare-fun b!52336 () Bool)

(declare-fun e!34052 () Bool)

(declare-fun tp_is_empty!2241 () Bool)

(assert (=> b!52336 (= e!34052 tp_is_empty!2241)))

(declare-fun b!52337 () Bool)

(declare-fun res!29779 () Bool)

(declare-fun e!34049 () Bool)

(assert (=> b!52337 (=> (not res!29779) (not e!34049))))

(declare-datatypes ((V!2635 0))(
  ( (V!2636 (val!1165 Int)) )
))
(declare-datatypes ((array!3405 0))(
  ( (array!3406 (arr!1625 (Array (_ BitVec 32) (_ BitVec 64))) (size!1854 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!777 0))(
  ( (ValueCellFull!777 (v!2219 V!2635)) (EmptyCell!777) )
))
(declare-datatypes ((array!3407 0))(
  ( (array!3408 (arr!1626 (Array (_ BitVec 32) ValueCell!777)) (size!1855 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!462 0))(
  ( (LongMapFixedSize!463 (defaultEntry!1945 Int) (mask!5768 (_ BitVec 32)) (extraKeys!1836 (_ BitVec 32)) (zeroValue!1863 V!2635) (minValue!1863 V!2635) (_size!280 (_ BitVec 32)) (_keys!3565 array!3405) (_values!1928 array!3407) (_vacant!280 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!462)

(declare-datatypes ((Cell!284 0))(
  ( (Cell!285 (v!2220 LongMapFixedSize!462)) )
))
(declare-datatypes ((LongMap!284 0))(
  ( (LongMap!285 (underlying!153 Cell!284)) )
))
(declare-fun thiss!992 () LongMap!284)

(assert (=> b!52337 (= res!29779 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5768 newMap!16)) (_size!280 (v!2220 (underlying!153 thiss!992)))))))

(declare-fun b!52338 () Bool)

(assert (=> b!52338 (= e!34049 false)))

(declare-datatypes ((tuple2!1844 0))(
  ( (tuple2!1845 (_1!933 (_ BitVec 64)) (_2!933 V!2635)) )
))
(declare-datatypes ((List!1338 0))(
  ( (Nil!1335) (Cons!1334 (h!1914 tuple2!1844) (t!4372 List!1338)) )
))
(declare-datatypes ((ListLongMap!1259 0))(
  ( (ListLongMap!1260 (toList!645 List!1338)) )
))
(declare-fun lt!21270 () ListLongMap!1259)

(declare-fun map!1009 (LongMapFixedSize!462) ListLongMap!1259)

(assert (=> b!52338 (= lt!21270 (map!1009 newMap!16))))

(declare-fun lt!21269 () ListLongMap!1259)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun getCurrentListMap!358 (array!3405 array!3407 (_ BitVec 32) (_ BitVec 32) V!2635 V!2635 (_ BitVec 32) Int) ListLongMap!1259)

(assert (=> b!52338 (= lt!21269 (getCurrentListMap!358 (_keys!3565 (v!2220 (underlying!153 thiss!992))) (_values!1928 (v!2220 (underlying!153 thiss!992))) (mask!5768 (v!2220 (underlying!153 thiss!992))) (extraKeys!1836 (v!2220 (underlying!153 thiss!992))) (zeroValue!1863 (v!2220 (underlying!153 thiss!992))) (minValue!1863 (v!2220 (underlying!153 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1945 (v!2220 (underlying!153 thiss!992)))))))

(declare-fun b!52339 () Bool)

(declare-fun e!34050 () Bool)

(assert (=> b!52339 (= e!34050 tp_is_empty!2241)))

(declare-fun mapIsEmpty!2393 () Bool)

(declare-fun mapRes!2393 () Bool)

(assert (=> mapIsEmpty!2393 mapRes!2393))

(declare-fun res!29777 () Bool)

(assert (=> start!8242 (=> (not res!29777) (not e!34049))))

(declare-fun valid!166 (LongMap!284) Bool)

(assert (=> start!8242 (= res!29777 (valid!166 thiss!992))))

(assert (=> start!8242 e!34049))

(declare-fun e!34055 () Bool)

(assert (=> start!8242 e!34055))

(assert (=> start!8242 true))

(declare-fun e!34061 () Bool)

(assert (=> start!8242 e!34061))

(declare-fun mapNonEmpty!2393 () Bool)

(declare-fun tp!7049 () Bool)

(declare-fun e!34051 () Bool)

(assert (=> mapNonEmpty!2393 (= mapRes!2393 (and tp!7049 e!34051))))

(declare-fun mapRest!2394 () (Array (_ BitVec 32) ValueCell!777))

(declare-fun mapValue!2393 () ValueCell!777)

(declare-fun mapKey!2394 () (_ BitVec 32))

(assert (=> mapNonEmpty!2393 (= (arr!1626 (_values!1928 (v!2220 (underlying!153 thiss!992)))) (store mapRest!2394 mapKey!2394 mapValue!2393))))

(declare-fun e!34056 () Bool)

(declare-fun array_inv!1001 (array!3405) Bool)

(declare-fun array_inv!1002 (array!3407) Bool)

(assert (=> b!52340 (= e!34061 (and tp!7050 tp_is_empty!2241 (array_inv!1001 (_keys!3565 newMap!16)) (array_inv!1002 (_values!1928 newMap!16)) e!34056))))

(declare-fun mapIsEmpty!2394 () Bool)

(declare-fun mapRes!2394 () Bool)

(assert (=> mapIsEmpty!2394 mapRes!2394))

(declare-fun b!52341 () Bool)

(declare-fun res!29778 () Bool)

(assert (=> b!52341 (=> (not res!29778) (not e!34049))))

(declare-fun valid!167 (LongMapFixedSize!462) Bool)

(assert (=> b!52341 (= res!29778 (valid!167 newMap!16))))

(declare-fun mapNonEmpty!2394 () Bool)

(declare-fun tp!7048 () Bool)

(declare-fun e!34058 () Bool)

(assert (=> mapNonEmpty!2394 (= mapRes!2394 (and tp!7048 e!34058))))

(declare-fun mapValue!2394 () ValueCell!777)

(declare-fun mapRest!2393 () (Array (_ BitVec 32) ValueCell!777))

(declare-fun mapKey!2393 () (_ BitVec 32))

(assert (=> mapNonEmpty!2394 (= (arr!1626 (_values!1928 newMap!16)) (store mapRest!2393 mapKey!2393 mapValue!2394))))

(declare-fun b!52342 () Bool)

(assert (=> b!52342 (= e!34051 tp_is_empty!2241)))

(declare-fun b!52343 () Bool)

(declare-fun e!34053 () Bool)

(assert (=> b!52343 (= e!34053 (and e!34050 mapRes!2393))))

(declare-fun condMapEmpty!2394 () Bool)

(declare-fun mapDefault!2394 () ValueCell!777)

(assert (=> b!52343 (= condMapEmpty!2394 (= (arr!1626 (_values!1928 (v!2220 (underlying!153 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!777)) mapDefault!2394)))))

(declare-fun b!52344 () Bool)

(declare-fun res!29780 () Bool)

(assert (=> b!52344 (=> (not res!29780) (not e!34049))))

(assert (=> b!52344 (= res!29780 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1854 (_keys!3565 (v!2220 (underlying!153 thiss!992)))))))))

(declare-fun b!52345 () Bool)

(declare-fun e!34054 () Bool)

(assert (=> b!52345 (= e!34055 e!34054)))

(declare-fun b!52346 () Bool)

(assert (=> b!52346 (= e!34056 (and e!34052 mapRes!2394))))

(declare-fun condMapEmpty!2393 () Bool)

(declare-fun mapDefault!2393 () ValueCell!777)

(assert (=> b!52346 (= condMapEmpty!2393 (= (arr!1626 (_values!1928 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!777)) mapDefault!2393)))))

(declare-fun b!52347 () Bool)

(assert (=> b!52347 (= e!34058 tp_is_empty!2241)))

(declare-fun b!52348 () Bool)

(declare-fun e!34060 () Bool)

(assert (=> b!52348 (= e!34054 e!34060)))

(assert (=> b!52349 (= e!34060 (and tp!7047 tp_is_empty!2241 (array_inv!1001 (_keys!3565 (v!2220 (underlying!153 thiss!992)))) (array_inv!1002 (_values!1928 (v!2220 (underlying!153 thiss!992)))) e!34053))))

(assert (= (and start!8242 res!29777) b!52344))

(assert (= (and b!52344 res!29780) b!52341))

(assert (= (and b!52341 res!29778) b!52337))

(assert (= (and b!52337 res!29779) b!52338))

(assert (= (and b!52343 condMapEmpty!2394) mapIsEmpty!2393))

(assert (= (and b!52343 (not condMapEmpty!2394)) mapNonEmpty!2393))

(get-info :version)

(assert (= (and mapNonEmpty!2393 ((_ is ValueCellFull!777) mapValue!2393)) b!52342))

(assert (= (and b!52343 ((_ is ValueCellFull!777) mapDefault!2394)) b!52339))

(assert (= b!52349 b!52343))

(assert (= b!52348 b!52349))

(assert (= b!52345 b!52348))

(assert (= start!8242 b!52345))

(assert (= (and b!52346 condMapEmpty!2393) mapIsEmpty!2394))

(assert (= (and b!52346 (not condMapEmpty!2393)) mapNonEmpty!2394))

(assert (= (and mapNonEmpty!2394 ((_ is ValueCellFull!777) mapValue!2394)) b!52347))

(assert (= (and b!52346 ((_ is ValueCellFull!777) mapDefault!2393)) b!52336))

(assert (= b!52340 b!52346))

(assert (= start!8242 b!52340))

(declare-fun m!44785 () Bool)

(assert (=> b!52341 m!44785))

(declare-fun m!44787 () Bool)

(assert (=> b!52349 m!44787))

(declare-fun m!44789 () Bool)

(assert (=> b!52349 m!44789))

(declare-fun m!44791 () Bool)

(assert (=> b!52338 m!44791))

(declare-fun m!44793 () Bool)

(assert (=> b!52338 m!44793))

(declare-fun m!44795 () Bool)

(assert (=> mapNonEmpty!2393 m!44795))

(declare-fun m!44797 () Bool)

(assert (=> b!52340 m!44797))

(declare-fun m!44799 () Bool)

(assert (=> b!52340 m!44799))

(declare-fun m!44801 () Bool)

(assert (=> mapNonEmpty!2394 m!44801))

(declare-fun m!44803 () Bool)

(assert (=> start!8242 m!44803))

(check-sat tp_is_empty!2241 b_and!2859 (not b!52338) (not mapNonEmpty!2393) (not b_next!1651) (not b!52349) (not mapNonEmpty!2394) (not b!52341) (not b!52340) (not b_next!1649) b_and!2861 (not start!8242))
(check-sat b_and!2859 b_and!2861 (not b_next!1649) (not b_next!1651))
