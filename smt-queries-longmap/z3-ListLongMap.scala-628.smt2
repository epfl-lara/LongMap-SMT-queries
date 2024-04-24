; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16120 () Bool)

(assert start!16120)

(declare-fun b!160374 () Bool)

(declare-fun b_free!3577 () Bool)

(declare-fun b_next!3577 () Bool)

(assert (=> b!160374 (= b_free!3577 (not b_next!3577))))

(declare-fun tp!13301 () Bool)

(declare-fun b_and!10005 () Bool)

(assert (=> b!160374 (= tp!13301 b_and!10005)))

(declare-fun b!160367 () Bool)

(declare-fun res!75915 () Bool)

(declare-fun e!104866 () Bool)

(assert (=> b!160367 (=> (not res!75915) (not e!104866))))

(declare-datatypes ((V!4153 0))(
  ( (V!4154 (val!1734 Int)) )
))
(declare-datatypes ((ValueCell!1346 0))(
  ( (ValueCellFull!1346 (v!3600 V!4153)) (EmptyCell!1346) )
))
(declare-datatypes ((array!5823 0))(
  ( (array!5824 (arr!2756 (Array (_ BitVec 32) (_ BitVec 64))) (size!3040 (_ BitVec 32))) )
))
(declare-datatypes ((array!5825 0))(
  ( (array!5826 (arr!2757 (Array (_ BitVec 32) ValueCell!1346)) (size!3041 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1600 0))(
  ( (LongMapFixedSize!1601 (defaultEntry!3242 Int) (mask!7810 (_ BitVec 32)) (extraKeys!2983 (_ BitVec 32)) (zeroValue!3085 V!4153) (minValue!3085 V!4153) (_size!849 (_ BitVec 32)) (_keys!5043 array!5823) (_values!3225 array!5825) (_vacant!849 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1600)

(assert (=> b!160367 (= res!75915 (and (= (size!3041 (_values!3225 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7810 thiss!1248))) (= (size!3040 (_keys!5043 thiss!1248)) (size!3041 (_values!3225 thiss!1248))) (bvsge (mask!7810 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2983 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2983 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160368 () Bool)

(declare-fun e!104865 () Bool)

(declare-fun tp_is_empty!3379 () Bool)

(assert (=> b!160368 (= e!104865 tp_is_empty!3379)))

(declare-fun b!160369 () Bool)

(declare-fun res!75912 () Bool)

(assert (=> b!160369 (=> (not res!75912) (not e!104866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5823 (_ BitVec 32)) Bool)

(assert (=> b!160369 (= res!75912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5043 thiss!1248) (mask!7810 thiss!1248)))))

(declare-fun b!160370 () Bool)

(assert (=> b!160370 (= e!104866 false)))

(declare-fun lt!82137 () Bool)

(declare-datatypes ((List!1927 0))(
  ( (Nil!1924) (Cons!1923 (h!2536 (_ BitVec 64)) (t!6721 List!1927)) )
))
(declare-fun arrayNoDuplicates!0 (array!5823 (_ BitVec 32) List!1927) Bool)

(assert (=> b!160370 (= lt!82137 (arrayNoDuplicates!0 (_keys!5043 thiss!1248) #b00000000000000000000000000000000 Nil!1924))))

(declare-fun b!160371 () Bool)

(declare-fun e!104868 () Bool)

(assert (=> b!160371 (= e!104868 tp_is_empty!3379)))

(declare-fun b!160372 () Bool)

(declare-fun e!104864 () Bool)

(declare-fun mapRes!5756 () Bool)

(assert (=> b!160372 (= e!104864 (and e!104868 mapRes!5756))))

(declare-fun condMapEmpty!5756 () Bool)

(declare-fun mapDefault!5756 () ValueCell!1346)

(assert (=> b!160372 (= condMapEmpty!5756 (= (arr!2757 (_values!3225 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1346)) mapDefault!5756)))))

(declare-fun mapIsEmpty!5756 () Bool)

(assert (=> mapIsEmpty!5756 mapRes!5756))

(declare-fun e!104863 () Bool)

(declare-fun array_inv!1761 (array!5823) Bool)

(declare-fun array_inv!1762 (array!5825) Bool)

(assert (=> b!160374 (= e!104863 (and tp!13301 tp_is_empty!3379 (array_inv!1761 (_keys!5043 thiss!1248)) (array_inv!1762 (_values!3225 thiss!1248)) e!104864))))

(declare-fun b!160375 () Bool)

(declare-fun res!75914 () Bool)

(assert (=> b!160375 (=> (not res!75914) (not e!104866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160375 (= res!75914 (validMask!0 (mask!7810 thiss!1248)))))

(declare-fun b!160376 () Bool)

(declare-fun res!75913 () Bool)

(assert (=> b!160376 (=> (not res!75913) (not e!104866))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2862 0))(
  ( (tuple2!2863 (_1!1442 (_ BitVec 64)) (_2!1442 V!4153)) )
))
(declare-datatypes ((List!1928 0))(
  ( (Nil!1925) (Cons!1924 (h!2537 tuple2!2862) (t!6722 List!1928)) )
))
(declare-datatypes ((ListLongMap!1861 0))(
  ( (ListLongMap!1862 (toList!946 List!1928)) )
))
(declare-fun contains!992 (ListLongMap!1861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!613 (array!5823 array!5825 (_ BitVec 32) (_ BitVec 32) V!4153 V!4153 (_ BitVec 32) Int) ListLongMap!1861)

(assert (=> b!160376 (= res!75913 (not (contains!992 (getCurrentListMap!613 (_keys!5043 thiss!1248) (_values!3225 thiss!1248) (mask!7810 thiss!1248) (extraKeys!2983 thiss!1248) (zeroValue!3085 thiss!1248) (minValue!3085 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3242 thiss!1248)) key!828)))))

(declare-fun b!160373 () Bool)

(declare-fun res!75917 () Bool)

(assert (=> b!160373 (=> (not res!75917) (not e!104866))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!323 0))(
  ( (MissingZero!323 (index!3460 (_ BitVec 32))) (Found!323 (index!3461 (_ BitVec 32))) (Intermediate!323 (undefined!1135 Bool) (index!3462 (_ BitVec 32)) (x!17691 (_ BitVec 32))) (Undefined!323) (MissingVacant!323 (index!3463 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5823 (_ BitVec 32)) SeekEntryResult!323)

(assert (=> b!160373 (= res!75917 ((_ is Undefined!323) (seekEntryOrOpen!0 key!828 (_keys!5043 thiss!1248) (mask!7810 thiss!1248))))))

(declare-fun res!75916 () Bool)

(assert (=> start!16120 (=> (not res!75916) (not e!104866))))

(declare-fun valid!762 (LongMapFixedSize!1600) Bool)

(assert (=> start!16120 (= res!75916 (valid!762 thiss!1248))))

(assert (=> start!16120 e!104866))

(assert (=> start!16120 e!104863))

(assert (=> start!16120 true))

(declare-fun mapNonEmpty!5756 () Bool)

(declare-fun tp!13300 () Bool)

(assert (=> mapNonEmpty!5756 (= mapRes!5756 (and tp!13300 e!104865))))

(declare-fun mapRest!5756 () (Array (_ BitVec 32) ValueCell!1346))

(declare-fun mapValue!5756 () ValueCell!1346)

(declare-fun mapKey!5756 () (_ BitVec 32))

(assert (=> mapNonEmpty!5756 (= (arr!2757 (_values!3225 thiss!1248)) (store mapRest!5756 mapKey!5756 mapValue!5756))))

(declare-fun b!160377 () Bool)

(declare-fun res!75911 () Bool)

(assert (=> b!160377 (=> (not res!75911) (not e!104866))))

(assert (=> b!160377 (= res!75911 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16120 res!75916) b!160377))

(assert (= (and b!160377 res!75911) b!160373))

(assert (= (and b!160373 res!75917) b!160376))

(assert (= (and b!160376 res!75913) b!160375))

(assert (= (and b!160375 res!75914) b!160367))

(assert (= (and b!160367 res!75915) b!160369))

(assert (= (and b!160369 res!75912) b!160370))

(assert (= (and b!160372 condMapEmpty!5756) mapIsEmpty!5756))

(assert (= (and b!160372 (not condMapEmpty!5756)) mapNonEmpty!5756))

(assert (= (and mapNonEmpty!5756 ((_ is ValueCellFull!1346) mapValue!5756)) b!160368))

(assert (= (and b!160372 ((_ is ValueCellFull!1346) mapDefault!5756)) b!160371))

(assert (= b!160374 b!160372))

(assert (= start!16120 b!160374))

(declare-fun m!192419 () Bool)

(assert (=> b!160375 m!192419))

(declare-fun m!192421 () Bool)

(assert (=> b!160374 m!192421))

(declare-fun m!192423 () Bool)

(assert (=> b!160374 m!192423))

(declare-fun m!192425 () Bool)

(assert (=> b!160370 m!192425))

(declare-fun m!192427 () Bool)

(assert (=> mapNonEmpty!5756 m!192427))

(declare-fun m!192429 () Bool)

(assert (=> start!16120 m!192429))

(declare-fun m!192431 () Bool)

(assert (=> b!160369 m!192431))

(declare-fun m!192433 () Bool)

(assert (=> b!160376 m!192433))

(assert (=> b!160376 m!192433))

(declare-fun m!192435 () Bool)

(assert (=> b!160376 m!192435))

(declare-fun m!192437 () Bool)

(assert (=> b!160373 m!192437))

(check-sat (not b!160375) (not start!16120) (not b!160374) (not b!160369) (not b_next!3577) tp_is_empty!3379 (not mapNonEmpty!5756) b_and!10005 (not b!160370) (not b!160376) (not b!160373))
(check-sat b_and!10005 (not b_next!3577))
