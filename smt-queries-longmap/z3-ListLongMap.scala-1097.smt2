; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22530 () Bool)

(assert start!22530)

(declare-fun b!235353 () Bool)

(declare-fun b_free!6331 () Bool)

(declare-fun b_next!6331 () Bool)

(assert (=> b!235353 (= b_free!6331 (not b_next!6331))))

(declare-fun tp!22163 () Bool)

(declare-fun b_and!13235 () Bool)

(assert (=> b!235353 (= tp!22163 b_and!13235)))

(declare-fun b!235347 () Bool)

(declare-fun e!152835 () Bool)

(declare-fun tp_is_empty!6193 () Bool)

(assert (=> b!235347 (= e!152835 tp_is_empty!6193)))

(declare-fun b!235348 () Bool)

(declare-fun res!115386 () Bool)

(declare-fun e!152838 () Bool)

(assert (=> b!235348 (=> (not res!115386) (not e!152838))))

(declare-datatypes ((V!7905 0))(
  ( (V!7906 (val!3141 Int)) )
))
(declare-datatypes ((ValueCell!2753 0))(
  ( (ValueCellFull!2753 (v!5163 V!7905)) (EmptyCell!2753) )
))
(declare-datatypes ((array!11637 0))(
  ( (array!11638 (arr!5529 (Array (_ BitVec 32) ValueCell!2753)) (size!5867 (_ BitVec 32))) )
))
(declare-datatypes ((array!11639 0))(
  ( (array!11640 (arr!5530 (Array (_ BitVec 32) (_ BitVec 64))) (size!5868 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3406 0))(
  ( (LongMapFixedSize!3407 (defaultEntry!4374 Int) (mask!10345 (_ BitVec 32)) (extraKeys!4111 (_ BitVec 32)) (zeroValue!4215 V!7905) (minValue!4215 V!7905) (_size!1752 (_ BitVec 32)) (_keys!6449 array!11639) (_values!4357 array!11637) (_vacant!1752 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3406)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235348 (= res!115386 (validMask!0 (mask!10345 thiss!1504)))))

(declare-fun b!235349 () Bool)

(declare-fun res!115385 () Bool)

(assert (=> b!235349 (=> (not res!115385) (not e!152838))))

(assert (=> b!235349 (= res!115385 (and (= (size!5867 (_values!4357 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10345 thiss!1504))) (= (size!5868 (_keys!6449 thiss!1504)) (size!5867 (_values!4357 thiss!1504))) (bvsge (mask!10345 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4111 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4111 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!235350 () Bool)

(declare-fun e!152837 () Bool)

(declare-fun e!152834 () Bool)

(declare-fun mapRes!10487 () Bool)

(assert (=> b!235350 (= e!152837 (and e!152834 mapRes!10487))))

(declare-fun condMapEmpty!10487 () Bool)

(declare-fun mapDefault!10487 () ValueCell!2753)

(assert (=> b!235350 (= condMapEmpty!10487 (= (arr!5529 (_values!4357 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2753)) mapDefault!10487)))))

(declare-fun b!235351 () Bool)

(declare-fun res!115384 () Bool)

(declare-fun e!152839 () Bool)

(assert (=> b!235351 (=> (not res!115384) (not e!152839))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!235351 (= res!115384 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!235352 () Bool)

(assert (=> b!235352 (= e!152839 e!152838)))

(declare-fun res!115382 () Bool)

(assert (=> b!235352 (=> (not res!115382) (not e!152838))))

(declare-datatypes ((SeekEntryResult!991 0))(
  ( (MissingZero!991 (index!6134 (_ BitVec 32))) (Found!991 (index!6135 (_ BitVec 32))) (Intermediate!991 (undefined!1803 Bool) (index!6136 (_ BitVec 32)) (x!23794 (_ BitVec 32))) (Undefined!991) (MissingVacant!991 (index!6137 (_ BitVec 32))) )
))
(declare-fun lt!118955 () SeekEntryResult!991)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235352 (= res!115382 (or (= lt!118955 (MissingZero!991 index!297)) (= lt!118955 (MissingVacant!991 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11639 (_ BitVec 32)) SeekEntryResult!991)

(assert (=> b!235352 (= lt!118955 (seekEntryOrOpen!0 key!932 (_keys!6449 thiss!1504) (mask!10345 thiss!1504)))))

(declare-fun res!115383 () Bool)

(assert (=> start!22530 (=> (not res!115383) (not e!152839))))

(declare-fun valid!1357 (LongMapFixedSize!3406) Bool)

(assert (=> start!22530 (= res!115383 (valid!1357 thiss!1504))))

(assert (=> start!22530 e!152839))

(declare-fun e!152836 () Bool)

(assert (=> start!22530 e!152836))

(assert (=> start!22530 true))

(declare-fun array_inv!3651 (array!11639) Bool)

(declare-fun array_inv!3652 (array!11637) Bool)

(assert (=> b!235353 (= e!152836 (and tp!22163 tp_is_empty!6193 (array_inv!3651 (_keys!6449 thiss!1504)) (array_inv!3652 (_values!4357 thiss!1504)) e!152837))))

(declare-fun b!235354 () Bool)

(declare-fun res!115381 () Bool)

(assert (=> b!235354 (=> (not res!115381) (not e!152838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11639 (_ BitVec 32)) Bool)

(assert (=> b!235354 (= res!115381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6449 thiss!1504) (mask!10345 thiss!1504)))))

(declare-fun b!235355 () Bool)

(assert (=> b!235355 (= e!152838 false)))

(declare-fun lt!118956 () Bool)

(declare-datatypes ((List!3533 0))(
  ( (Nil!3530) (Cons!3529 (h!4181 (_ BitVec 64)) (t!8499 List!3533)) )
))
(declare-fun arrayNoDuplicates!0 (array!11639 (_ BitVec 32) List!3533) Bool)

(assert (=> b!235355 (= lt!118956 (arrayNoDuplicates!0 (_keys!6449 thiss!1504) #b00000000000000000000000000000000 Nil!3530))))

(declare-fun b!235356 () Bool)

(assert (=> b!235356 (= e!152834 tp_is_empty!6193)))

(declare-fun mapNonEmpty!10487 () Bool)

(declare-fun tp!22162 () Bool)

(assert (=> mapNonEmpty!10487 (= mapRes!10487 (and tp!22162 e!152835))))

(declare-fun mapValue!10487 () ValueCell!2753)

(declare-fun mapRest!10487 () (Array (_ BitVec 32) ValueCell!2753))

(declare-fun mapKey!10487 () (_ BitVec 32))

(assert (=> mapNonEmpty!10487 (= (arr!5529 (_values!4357 thiss!1504)) (store mapRest!10487 mapKey!10487 mapValue!10487))))

(declare-fun mapIsEmpty!10487 () Bool)

(assert (=> mapIsEmpty!10487 mapRes!10487))

(declare-fun b!235357 () Bool)

(declare-fun res!115387 () Bool)

(assert (=> b!235357 (=> (not res!115387) (not e!152838))))

(declare-datatypes ((tuple2!4606 0))(
  ( (tuple2!4607 (_1!2314 (_ BitVec 64)) (_2!2314 V!7905)) )
))
(declare-datatypes ((List!3534 0))(
  ( (Nil!3531) (Cons!3530 (h!4182 tuple2!4606) (t!8500 List!3534)) )
))
(declare-datatypes ((ListLongMap!3509 0))(
  ( (ListLongMap!3510 (toList!1770 List!3534)) )
))
(declare-fun contains!1650 (ListLongMap!3509 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1279 (array!11639 array!11637 (_ BitVec 32) (_ BitVec 32) V!7905 V!7905 (_ BitVec 32) Int) ListLongMap!3509)

(assert (=> b!235357 (= res!115387 (contains!1650 (getCurrentListMap!1279 (_keys!6449 thiss!1504) (_values!4357 thiss!1504) (mask!10345 thiss!1504) (extraKeys!4111 thiss!1504) (zeroValue!4215 thiss!1504) (minValue!4215 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4374 thiss!1504)) key!932))))

(assert (= (and start!22530 res!115383) b!235351))

(assert (= (and b!235351 res!115384) b!235352))

(assert (= (and b!235352 res!115382) b!235357))

(assert (= (and b!235357 res!115387) b!235348))

(assert (= (and b!235348 res!115386) b!235349))

(assert (= (and b!235349 res!115385) b!235354))

(assert (= (and b!235354 res!115381) b!235355))

(assert (= (and b!235350 condMapEmpty!10487) mapIsEmpty!10487))

(assert (= (and b!235350 (not condMapEmpty!10487)) mapNonEmpty!10487))

(get-info :version)

(assert (= (and mapNonEmpty!10487 ((_ is ValueCellFull!2753) mapValue!10487)) b!235347))

(assert (= (and b!235350 ((_ is ValueCellFull!2753) mapDefault!10487)) b!235356))

(assert (= b!235353 b!235350))

(assert (= start!22530 b!235353))

(declare-fun m!255977 () Bool)

(assert (=> b!235357 m!255977))

(assert (=> b!235357 m!255977))

(declare-fun m!255979 () Bool)

(assert (=> b!235357 m!255979))

(declare-fun m!255981 () Bool)

(assert (=> b!235348 m!255981))

(declare-fun m!255983 () Bool)

(assert (=> start!22530 m!255983))

(declare-fun m!255985 () Bool)

(assert (=> b!235353 m!255985))

(declare-fun m!255987 () Bool)

(assert (=> b!235353 m!255987))

(declare-fun m!255989 () Bool)

(assert (=> b!235352 m!255989))

(declare-fun m!255991 () Bool)

(assert (=> b!235355 m!255991))

(declare-fun m!255993 () Bool)

(assert (=> b!235354 m!255993))

(declare-fun m!255995 () Bool)

(assert (=> mapNonEmpty!10487 m!255995))

(check-sat (not b!235354) (not b!235355) b_and!13235 (not mapNonEmpty!10487) tp_is_empty!6193 (not b!235353) (not b!235352) (not b_next!6331) (not b!235348) (not start!22530) (not b!235357))
(check-sat b_and!13235 (not b_next!6331))
