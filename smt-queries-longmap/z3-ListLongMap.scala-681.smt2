; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16594 () Bool)

(assert start!16594)

(declare-fun b!165456 () Bool)

(declare-fun b_free!3895 () Bool)

(declare-fun b_next!3895 () Bool)

(assert (=> b!165456 (= b_free!3895 (not b_next!3895))))

(declare-fun tp!14286 () Bool)

(declare-fun b_and!10323 () Bool)

(assert (=> b!165456 (= tp!14286 b_and!10323)))

(declare-fun b!165451 () Bool)

(declare-fun res!78491 () Bool)

(declare-fun e!108529 () Bool)

(assert (=> b!165451 (=> (not res!78491) (not e!108529))))

(declare-datatypes ((V!4577 0))(
  ( (V!4578 (val!1893 Int)) )
))
(declare-datatypes ((ValueCell!1505 0))(
  ( (ValueCellFull!1505 (v!3759 V!4577)) (EmptyCell!1505) )
))
(declare-datatypes ((array!6477 0))(
  ( (array!6478 (arr!3074 (Array (_ BitVec 32) (_ BitVec 64))) (size!3362 (_ BitVec 32))) )
))
(declare-datatypes ((array!6479 0))(
  ( (array!6480 (arr!3075 (Array (_ BitVec 32) ValueCell!1505)) (size!3363 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1918 0))(
  ( (LongMapFixedSize!1919 (defaultEntry!3401 Int) (mask!8112 (_ BitVec 32)) (extraKeys!3142 (_ BitVec 32)) (zeroValue!3244 V!4577) (minValue!3244 V!4577) (_size!1008 (_ BitVec 32)) (_keys!5226 array!6477) (_values!3384 array!6479) (_vacant!1008 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1918)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3018 0))(
  ( (tuple2!3019 (_1!1520 (_ BitVec 64)) (_2!1520 V!4577)) )
))
(declare-datatypes ((List!2039 0))(
  ( (Nil!2036) (Cons!2035 (h!2652 tuple2!3018) (t!6833 List!2039)) )
))
(declare-datatypes ((ListLongMap!1979 0))(
  ( (ListLongMap!1980 (toList!1005 List!2039)) )
))
(declare-fun contains!1057 (ListLongMap!1979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!667 (array!6477 array!6479 (_ BitVec 32) (_ BitVec 32) V!4577 V!4577 (_ BitVec 32) Int) ListLongMap!1979)

(assert (=> b!165451 (= res!78491 (not (contains!1057 (getCurrentListMap!667 (_keys!5226 thiss!1248) (_values!3384 thiss!1248) (mask!8112 thiss!1248) (extraKeys!3142 thiss!1248) (zeroValue!3244 thiss!1248) (minValue!3244 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3401 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!6264 () Bool)

(declare-fun mapRes!6264 () Bool)

(declare-fun tp!14285 () Bool)

(declare-fun e!108528 () Bool)

(assert (=> mapNonEmpty!6264 (= mapRes!6264 (and tp!14285 e!108528))))

(declare-fun mapValue!6264 () ValueCell!1505)

(declare-fun mapKey!6264 () (_ BitVec 32))

(declare-fun mapRest!6264 () (Array (_ BitVec 32) ValueCell!1505))

(assert (=> mapNonEmpty!6264 (= (arr!3075 (_values!3384 thiss!1248)) (store mapRest!6264 mapKey!6264 mapValue!6264))))

(declare-fun b!165452 () Bool)

(declare-fun e!108527 () Bool)

(declare-fun tp_is_empty!3697 () Bool)

(assert (=> b!165452 (= e!108527 tp_is_empty!3697)))

(declare-fun res!78492 () Bool)

(declare-fun e!108524 () Bool)

(assert (=> start!16594 (=> (not res!78492) (not e!108524))))

(declare-fun valid!865 (LongMapFixedSize!1918) Bool)

(assert (=> start!16594 (= res!78492 (valid!865 thiss!1248))))

(assert (=> start!16594 e!108524))

(declare-fun e!108530 () Bool)

(assert (=> start!16594 e!108530))

(assert (=> start!16594 true))

(declare-fun b!165453 () Bool)

(assert (=> b!165453 (= e!108528 tp_is_empty!3697)))

(declare-fun b!165454 () Bool)

(declare-fun res!78493 () Bool)

(assert (=> b!165454 (=> (not res!78493) (not e!108524))))

(assert (=> b!165454 (= res!78493 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165455 () Bool)

(declare-fun e!108526 () Bool)

(assert (=> b!165455 (= e!108526 (and e!108527 mapRes!6264))))

(declare-fun condMapEmpty!6264 () Bool)

(declare-fun mapDefault!6264 () ValueCell!1505)

(assert (=> b!165455 (= condMapEmpty!6264 (= (arr!3075 (_values!3384 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1505)) mapDefault!6264)))))

(declare-fun array_inv!1975 (array!6477) Bool)

(declare-fun array_inv!1976 (array!6479) Bool)

(assert (=> b!165456 (= e!108530 (and tp!14286 tp_is_empty!3697 (array_inv!1975 (_keys!5226 thiss!1248)) (array_inv!1976 (_values!3384 thiss!1248)) e!108526))))

(declare-fun b!165457 () Bool)

(assert (=> b!165457 (= e!108524 e!108529)))

(declare-fun res!78494 () Bool)

(assert (=> b!165457 (=> (not res!78494) (not e!108529))))

(declare-datatypes ((SeekEntryResult!431 0))(
  ( (MissingZero!431 (index!3892 (_ BitVec 32))) (Found!431 (index!3893 (_ BitVec 32))) (Intermediate!431 (undefined!1243 Bool) (index!3894 (_ BitVec 32)) (x!18331 (_ BitVec 32))) (Undefined!431) (MissingVacant!431 (index!3895 (_ BitVec 32))) )
))
(declare-fun lt!83123 () SeekEntryResult!431)

(get-info :version)

(assert (=> b!165457 (= res!78494 (and (not ((_ is Undefined!431) lt!83123)) (not ((_ is MissingVacant!431) lt!83123)) (not ((_ is MissingZero!431) lt!83123)) ((_ is Found!431) lt!83123)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6477 (_ BitVec 32)) SeekEntryResult!431)

(assert (=> b!165457 (= lt!83123 (seekEntryOrOpen!0 key!828 (_keys!5226 thiss!1248) (mask!8112 thiss!1248)))))

(declare-fun b!165458 () Bool)

(declare-fun res!78490 () Bool)

(assert (=> b!165458 (=> (not res!78490) (not e!108529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6477 (_ BitVec 32)) Bool)

(assert (=> b!165458 (= res!78490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5226 thiss!1248) (mask!8112 thiss!1248)))))

(declare-fun b!165459 () Bool)

(declare-fun res!78489 () Bool)

(assert (=> b!165459 (=> (not res!78489) (not e!108529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165459 (= res!78489 (validMask!0 (mask!8112 thiss!1248)))))

(declare-fun b!165460 () Bool)

(assert (=> b!165460 (= e!108529 false)))

(declare-fun lt!83124 () Bool)

(declare-datatypes ((List!2040 0))(
  ( (Nil!2037) (Cons!2036 (h!2653 (_ BitVec 64)) (t!6834 List!2040)) )
))
(declare-fun arrayNoDuplicates!0 (array!6477 (_ BitVec 32) List!2040) Bool)

(assert (=> b!165460 (= lt!83124 (arrayNoDuplicates!0 (_keys!5226 thiss!1248) #b00000000000000000000000000000000 Nil!2037))))

(declare-fun mapIsEmpty!6264 () Bool)

(assert (=> mapIsEmpty!6264 mapRes!6264))

(declare-fun b!165461 () Bool)

(declare-fun res!78495 () Bool)

(assert (=> b!165461 (=> (not res!78495) (not e!108529))))

(assert (=> b!165461 (= res!78495 (and (= (size!3363 (_values!3384 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8112 thiss!1248))) (= (size!3362 (_keys!5226 thiss!1248)) (size!3363 (_values!3384 thiss!1248))) (bvsge (mask!8112 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3142 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3142 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!16594 res!78492) b!165454))

(assert (= (and b!165454 res!78493) b!165457))

(assert (= (and b!165457 res!78494) b!165451))

(assert (= (and b!165451 res!78491) b!165459))

(assert (= (and b!165459 res!78489) b!165461))

(assert (= (and b!165461 res!78495) b!165458))

(assert (= (and b!165458 res!78490) b!165460))

(assert (= (and b!165455 condMapEmpty!6264) mapIsEmpty!6264))

(assert (= (and b!165455 (not condMapEmpty!6264)) mapNonEmpty!6264))

(assert (= (and mapNonEmpty!6264 ((_ is ValueCellFull!1505) mapValue!6264)) b!165453))

(assert (= (and b!165455 ((_ is ValueCellFull!1505) mapDefault!6264)) b!165452))

(assert (= b!165456 b!165455))

(assert (= start!16594 b!165456))

(declare-fun m!195413 () Bool)

(assert (=> b!165451 m!195413))

(assert (=> b!165451 m!195413))

(declare-fun m!195415 () Bool)

(assert (=> b!165451 m!195415))

(declare-fun m!195417 () Bool)

(assert (=> b!165460 m!195417))

(declare-fun m!195419 () Bool)

(assert (=> mapNonEmpty!6264 m!195419))

(declare-fun m!195421 () Bool)

(assert (=> b!165457 m!195421))

(declare-fun m!195423 () Bool)

(assert (=> b!165458 m!195423))

(declare-fun m!195425 () Bool)

(assert (=> b!165459 m!195425))

(declare-fun m!195427 () Bool)

(assert (=> start!16594 m!195427))

(declare-fun m!195429 () Bool)

(assert (=> b!165456 m!195429))

(declare-fun m!195431 () Bool)

(assert (=> b!165456 m!195431))

(check-sat (not b!165451) (not b!165456) (not b!165458) tp_is_empty!3697 (not b!165460) (not b_next!3895) (not b!165457) b_and!10323 (not start!16594) (not b!165459) (not mapNonEmpty!6264))
(check-sat b_and!10323 (not b_next!3895))
