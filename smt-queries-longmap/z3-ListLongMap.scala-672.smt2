; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16540 () Bool)

(assert start!16540)

(declare-fun b!164373 () Bool)

(declare-fun b_free!3841 () Bool)

(declare-fun b_next!3841 () Bool)

(assert (=> b!164373 (= b_free!3841 (not b_next!3841))))

(declare-fun tp!14124 () Bool)

(declare-fun b_and!10229 () Bool)

(assert (=> b!164373 (= tp!14124 b_and!10229)))

(declare-fun b!164366 () Bool)

(declare-fun e!107832 () Bool)

(declare-fun tp_is_empty!3643 () Bool)

(assert (=> b!164366 (= e!107832 tp_is_empty!3643)))

(declare-fun mapIsEmpty!6183 () Bool)

(declare-fun mapRes!6183 () Bool)

(assert (=> mapIsEmpty!6183 mapRes!6183))

(declare-fun mapNonEmpty!6183 () Bool)

(declare-fun tp!14123 () Bool)

(assert (=> mapNonEmpty!6183 (= mapRes!6183 (and tp!14123 e!107832))))

(declare-fun mapKey!6183 () (_ BitVec 32))

(declare-datatypes ((V!4505 0))(
  ( (V!4506 (val!1866 Int)) )
))
(declare-datatypes ((ValueCell!1478 0))(
  ( (ValueCellFull!1478 (v!3725 V!4505)) (EmptyCell!1478) )
))
(declare-fun mapRest!6183 () (Array (_ BitVec 32) ValueCell!1478))

(declare-datatypes ((array!6363 0))(
  ( (array!6364 (arr!3016 (Array (_ BitVec 32) (_ BitVec 64))) (size!3305 (_ BitVec 32))) )
))
(declare-datatypes ((array!6365 0))(
  ( (array!6366 (arr!3017 (Array (_ BitVec 32) ValueCell!1478)) (size!3306 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1864 0))(
  ( (LongMapFixedSize!1865 (defaultEntry!3374 Int) (mask!8066 (_ BitVec 32)) (extraKeys!3115 (_ BitVec 32)) (zeroValue!3217 V!4505) (minValue!3217 V!4505) (_size!981 (_ BitVec 32)) (_keys!5198 array!6363) (_values!3357 array!6365) (_vacant!981 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1864)

(declare-fun mapValue!6183 () ValueCell!1478)

(assert (=> mapNonEmpty!6183 (= (arr!3017 (_values!3357 thiss!1248)) (store mapRest!6183 mapKey!6183 mapValue!6183))))

(declare-fun b!164367 () Bool)

(declare-fun e!107833 () Bool)

(declare-fun e!107836 () Bool)

(assert (=> b!164367 (= e!107833 e!107836)))

(declare-fun res!77808 () Bool)

(assert (=> b!164367 (=> (not res!77808) (not e!107836))))

(declare-datatypes ((SeekEntryResult!427 0))(
  ( (MissingZero!427 (index!3876 (_ BitVec 32))) (Found!427 (index!3877 (_ BitVec 32))) (Intermediate!427 (undefined!1239 Bool) (index!3878 (_ BitVec 32)) (x!18254 (_ BitVec 32))) (Undefined!427) (MissingVacant!427 (index!3879 (_ BitVec 32))) )
))
(declare-fun lt!82721 () SeekEntryResult!427)

(get-info :version)

(assert (=> b!164367 (= res!77808 (and (not ((_ is Undefined!427) lt!82721)) (not ((_ is MissingVacant!427) lt!82721)) (not ((_ is MissingZero!427) lt!82721)) ((_ is Found!427) lt!82721)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6363 (_ BitVec 32)) SeekEntryResult!427)

(assert (=> b!164367 (= lt!82721 (seekEntryOrOpen!0 key!828 (_keys!5198 thiss!1248) (mask!8066 thiss!1248)))))

(declare-fun b!164368 () Bool)

(declare-fun res!77809 () Bool)

(assert (=> b!164368 (=> (not res!77809) (not e!107833))))

(assert (=> b!164368 (= res!77809 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164369 () Bool)

(declare-fun e!107835 () Bool)

(declare-fun e!107834 () Bool)

(assert (=> b!164369 (= e!107835 (and e!107834 mapRes!6183))))

(declare-fun condMapEmpty!6183 () Bool)

(declare-fun mapDefault!6183 () ValueCell!1478)

(assert (=> b!164369 (= condMapEmpty!6183 (= (arr!3017 (_values!3357 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1478)) mapDefault!6183)))))

(declare-fun b!164370 () Bool)

(declare-fun res!77810 () Bool)

(assert (=> b!164370 (=> (not res!77810) (not e!107836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6363 (_ BitVec 32)) Bool)

(assert (=> b!164370 (= res!77810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5198 thiss!1248) (mask!8066 thiss!1248)))))

(declare-fun b!164372 () Bool)

(declare-fun res!77811 () Bool)

(assert (=> b!164372 (=> (not res!77811) (not e!107836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164372 (= res!77811 (validMask!0 (mask!8066 thiss!1248)))))

(declare-fun e!107838 () Bool)

(declare-fun array_inv!1941 (array!6363) Bool)

(declare-fun array_inv!1942 (array!6365) Bool)

(assert (=> b!164373 (= e!107838 (and tp!14124 tp_is_empty!3643 (array_inv!1941 (_keys!5198 thiss!1248)) (array_inv!1942 (_values!3357 thiss!1248)) e!107835))))

(declare-fun b!164374 () Bool)

(assert (=> b!164374 (= e!107836 false)))

(declare-fun lt!82722 () Bool)

(declare-datatypes ((List!2020 0))(
  ( (Nil!2017) (Cons!2016 (h!2633 (_ BitVec 64)) (t!6813 List!2020)) )
))
(declare-fun arrayNoDuplicates!0 (array!6363 (_ BitVec 32) List!2020) Bool)

(assert (=> b!164374 (= lt!82722 (arrayNoDuplicates!0 (_keys!5198 thiss!1248) #b00000000000000000000000000000000 Nil!2017))))

(declare-fun b!164375 () Bool)

(assert (=> b!164375 (= e!107834 tp_is_empty!3643)))

(declare-fun b!164376 () Bool)

(declare-fun res!77807 () Bool)

(assert (=> b!164376 (=> (not res!77807) (not e!107836))))

(assert (=> b!164376 (= res!77807 (and (= (size!3306 (_values!3357 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8066 thiss!1248))) (= (size!3305 (_keys!5198 thiss!1248)) (size!3306 (_values!3357 thiss!1248))) (bvsge (mask!8066 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3115 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3115 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164371 () Bool)

(declare-fun res!77812 () Bool)

(assert (=> b!164371 (=> (not res!77812) (not e!107836))))

(declare-datatypes ((tuple2!3020 0))(
  ( (tuple2!3021 (_1!1521 (_ BitVec 64)) (_2!1521 V!4505)) )
))
(declare-datatypes ((List!2021 0))(
  ( (Nil!2018) (Cons!2017 (h!2634 tuple2!3020) (t!6814 List!2021)) )
))
(declare-datatypes ((ListLongMap!1963 0))(
  ( (ListLongMap!1964 (toList!997 List!2021)) )
))
(declare-fun contains!1042 (ListLongMap!1963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!639 (array!6363 array!6365 (_ BitVec 32) (_ BitVec 32) V!4505 V!4505 (_ BitVec 32) Int) ListLongMap!1963)

(assert (=> b!164371 (= res!77812 (contains!1042 (getCurrentListMap!639 (_keys!5198 thiss!1248) (_values!3357 thiss!1248) (mask!8066 thiss!1248) (extraKeys!3115 thiss!1248) (zeroValue!3217 thiss!1248) (minValue!3217 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3374 thiss!1248)) key!828))))

(declare-fun res!77806 () Bool)

(assert (=> start!16540 (=> (not res!77806) (not e!107833))))

(declare-fun valid!836 (LongMapFixedSize!1864) Bool)

(assert (=> start!16540 (= res!77806 (valid!836 thiss!1248))))

(assert (=> start!16540 e!107833))

(assert (=> start!16540 e!107838))

(assert (=> start!16540 true))

(assert (= (and start!16540 res!77806) b!164368))

(assert (= (and b!164368 res!77809) b!164367))

(assert (= (and b!164367 res!77808) b!164371))

(assert (= (and b!164371 res!77812) b!164372))

(assert (= (and b!164372 res!77811) b!164376))

(assert (= (and b!164376 res!77807) b!164370))

(assert (= (and b!164370 res!77810) b!164374))

(assert (= (and b!164369 condMapEmpty!6183) mapIsEmpty!6183))

(assert (= (and b!164369 (not condMapEmpty!6183)) mapNonEmpty!6183))

(assert (= (and mapNonEmpty!6183 ((_ is ValueCellFull!1478) mapValue!6183)) b!164366))

(assert (= (and b!164369 ((_ is ValueCellFull!1478) mapDefault!6183)) b!164375))

(assert (= b!164373 b!164369))

(assert (= start!16540 b!164373))

(declare-fun m!194071 () Bool)

(assert (=> b!164371 m!194071))

(assert (=> b!164371 m!194071))

(declare-fun m!194073 () Bool)

(assert (=> b!164371 m!194073))

(declare-fun m!194075 () Bool)

(assert (=> mapNonEmpty!6183 m!194075))

(declare-fun m!194077 () Bool)

(assert (=> b!164367 m!194077))

(declare-fun m!194079 () Bool)

(assert (=> b!164373 m!194079))

(declare-fun m!194081 () Bool)

(assert (=> b!164373 m!194081))

(declare-fun m!194083 () Bool)

(assert (=> b!164372 m!194083))

(declare-fun m!194085 () Bool)

(assert (=> b!164370 m!194085))

(declare-fun m!194087 () Bool)

(assert (=> b!164374 m!194087))

(declare-fun m!194089 () Bool)

(assert (=> start!16540 m!194089))

(check-sat (not b!164371) (not start!16540) (not b!164374) b_and!10229 (not b_next!3841) tp_is_empty!3643 (not mapNonEmpty!6183) (not b!164373) (not b!164372) (not b!164370) (not b!164367))
(check-sat b_and!10229 (not b_next!3841))
