; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16540 () Bool)

(assert start!16540)

(declare-fun b!164567 () Bool)

(declare-fun b_free!3841 () Bool)

(declare-fun b_next!3841 () Bool)

(assert (=> b!164567 (= b_free!3841 (not b_next!3841))))

(declare-fun tp!14124 () Bool)

(declare-fun b_and!10269 () Bool)

(assert (=> b!164567 (= tp!14124 b_and!10269)))

(declare-fun b!164560 () Bool)

(declare-fun e!107962 () Bool)

(assert (=> b!164560 (= e!107962 false)))

(declare-fun lt!82961 () Bool)

(declare-datatypes ((V!4505 0))(
  ( (V!4506 (val!1866 Int)) )
))
(declare-datatypes ((ValueCell!1478 0))(
  ( (ValueCellFull!1478 (v!3732 V!4505)) (EmptyCell!1478) )
))
(declare-datatypes ((array!6369 0))(
  ( (array!6370 (arr!3020 (Array (_ BitVec 32) (_ BitVec 64))) (size!3308 (_ BitVec 32))) )
))
(declare-datatypes ((array!6371 0))(
  ( (array!6372 (arr!3021 (Array (_ BitVec 32) ValueCell!1478)) (size!3309 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1864 0))(
  ( (LongMapFixedSize!1865 (defaultEntry!3374 Int) (mask!8067 (_ BitVec 32)) (extraKeys!3115 (_ BitVec 32)) (zeroValue!3217 V!4505) (minValue!3217 V!4505) (_size!981 (_ BitVec 32)) (_keys!5199 array!6369) (_values!3357 array!6371) (_vacant!981 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1864)

(declare-datatypes ((List!2004 0))(
  ( (Nil!2001) (Cons!2000 (h!2617 (_ BitVec 64)) (t!6798 List!2004)) )
))
(declare-fun arrayNoDuplicates!0 (array!6369 (_ BitVec 32) List!2004) Bool)

(assert (=> b!164560 (= lt!82961 (arrayNoDuplicates!0 (_keys!5199 thiss!1248) #b00000000000000000000000000000000 Nil!2001))))

(declare-fun mapIsEmpty!6183 () Bool)

(declare-fun mapRes!6183 () Bool)

(assert (=> mapIsEmpty!6183 mapRes!6183))

(declare-fun res!77927 () Bool)

(declare-fun e!107957 () Bool)

(assert (=> start!16540 (=> (not res!77927) (not e!107957))))

(declare-fun valid!848 (LongMapFixedSize!1864) Bool)

(assert (=> start!16540 (= res!77927 (valid!848 thiss!1248))))

(assert (=> start!16540 e!107957))

(declare-fun e!107963 () Bool)

(assert (=> start!16540 e!107963))

(assert (=> start!16540 true))

(declare-fun b!164561 () Bool)

(declare-fun res!77924 () Bool)

(assert (=> b!164561 (=> (not res!77924) (not e!107962))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2982 0))(
  ( (tuple2!2983 (_1!1502 (_ BitVec 64)) (_2!1502 V!4505)) )
))
(declare-datatypes ((List!2005 0))(
  ( (Nil!2002) (Cons!2001 (h!2618 tuple2!2982) (t!6799 List!2005)) )
))
(declare-datatypes ((ListLongMap!1943 0))(
  ( (ListLongMap!1944 (toList!987 List!2005)) )
))
(declare-fun contains!1039 (ListLongMap!1943 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!649 (array!6369 array!6371 (_ BitVec 32) (_ BitVec 32) V!4505 V!4505 (_ BitVec 32) Int) ListLongMap!1943)

(assert (=> b!164561 (= res!77924 (contains!1039 (getCurrentListMap!649 (_keys!5199 thiss!1248) (_values!3357 thiss!1248) (mask!8067 thiss!1248) (extraKeys!3115 thiss!1248) (zeroValue!3217 thiss!1248) (minValue!3217 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3374 thiss!1248)) key!828))))

(declare-fun b!164562 () Bool)

(declare-fun res!77922 () Bool)

(assert (=> b!164562 (=> (not res!77922) (not e!107962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6369 (_ BitVec 32)) Bool)

(assert (=> b!164562 (= res!77922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5199 thiss!1248) (mask!8067 thiss!1248)))))

(declare-fun b!164563 () Bool)

(declare-fun e!107961 () Bool)

(declare-fun tp_is_empty!3643 () Bool)

(assert (=> b!164563 (= e!107961 tp_is_empty!3643)))

(declare-fun b!164564 () Bool)

(assert (=> b!164564 (= e!107957 e!107962)))

(declare-fun res!77928 () Bool)

(assert (=> b!164564 (=> (not res!77928) (not e!107962))))

(declare-datatypes ((SeekEntryResult!411 0))(
  ( (MissingZero!411 (index!3812 (_ BitVec 32))) (Found!411 (index!3813 (_ BitVec 32))) (Intermediate!411 (undefined!1223 Bool) (index!3814 (_ BitVec 32)) (x!18239 (_ BitVec 32))) (Undefined!411) (MissingVacant!411 (index!3815 (_ BitVec 32))) )
))
(declare-fun lt!82962 () SeekEntryResult!411)

(get-info :version)

(assert (=> b!164564 (= res!77928 (and (not ((_ is Undefined!411) lt!82962)) (not ((_ is MissingVacant!411) lt!82962)) (not ((_ is MissingZero!411) lt!82962)) ((_ is Found!411) lt!82962)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6369 (_ BitVec 32)) SeekEntryResult!411)

(assert (=> b!164564 (= lt!82962 (seekEntryOrOpen!0 key!828 (_keys!5199 thiss!1248) (mask!8067 thiss!1248)))))

(declare-fun b!164565 () Bool)

(declare-fun e!107958 () Bool)

(assert (=> b!164565 (= e!107958 tp_is_empty!3643)))

(declare-fun b!164566 () Bool)

(declare-fun res!77926 () Bool)

(assert (=> b!164566 (=> (not res!77926) (not e!107962))))

(assert (=> b!164566 (= res!77926 (and (= (size!3309 (_values!3357 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8067 thiss!1248))) (= (size!3308 (_keys!5199 thiss!1248)) (size!3309 (_values!3357 thiss!1248))) (bvsge (mask!8067 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3115 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3115 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!107960 () Bool)

(declare-fun array_inv!1937 (array!6369) Bool)

(declare-fun array_inv!1938 (array!6371) Bool)

(assert (=> b!164567 (= e!107963 (and tp!14124 tp_is_empty!3643 (array_inv!1937 (_keys!5199 thiss!1248)) (array_inv!1938 (_values!3357 thiss!1248)) e!107960))))

(declare-fun mapNonEmpty!6183 () Bool)

(declare-fun tp!14123 () Bool)

(assert (=> mapNonEmpty!6183 (= mapRes!6183 (and tp!14123 e!107961))))

(declare-fun mapValue!6183 () ValueCell!1478)

(declare-fun mapRest!6183 () (Array (_ BitVec 32) ValueCell!1478))

(declare-fun mapKey!6183 () (_ BitVec 32))

(assert (=> mapNonEmpty!6183 (= (arr!3021 (_values!3357 thiss!1248)) (store mapRest!6183 mapKey!6183 mapValue!6183))))

(declare-fun b!164568 () Bool)

(declare-fun res!77923 () Bool)

(assert (=> b!164568 (=> (not res!77923) (not e!107957))))

(assert (=> b!164568 (= res!77923 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164569 () Bool)

(declare-fun res!77925 () Bool)

(assert (=> b!164569 (=> (not res!77925) (not e!107962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164569 (= res!77925 (validMask!0 (mask!8067 thiss!1248)))))

(declare-fun b!164570 () Bool)

(assert (=> b!164570 (= e!107960 (and e!107958 mapRes!6183))))

(declare-fun condMapEmpty!6183 () Bool)

(declare-fun mapDefault!6183 () ValueCell!1478)

(assert (=> b!164570 (= condMapEmpty!6183 (= (arr!3021 (_values!3357 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1478)) mapDefault!6183)))))

(assert (= (and start!16540 res!77927) b!164568))

(assert (= (and b!164568 res!77923) b!164564))

(assert (= (and b!164564 res!77928) b!164561))

(assert (= (and b!164561 res!77924) b!164569))

(assert (= (and b!164569 res!77925) b!164566))

(assert (= (and b!164566 res!77926) b!164562))

(assert (= (and b!164562 res!77922) b!164560))

(assert (= (and b!164570 condMapEmpty!6183) mapIsEmpty!6183))

(assert (= (and b!164570 (not condMapEmpty!6183)) mapNonEmpty!6183))

(assert (= (and mapNonEmpty!6183 ((_ is ValueCellFull!1478) mapValue!6183)) b!164563))

(assert (= (and b!164570 ((_ is ValueCellFull!1478) mapDefault!6183)) b!164565))

(assert (= b!164567 b!164570))

(assert (= start!16540 b!164567))

(declare-fun m!194873 () Bool)

(assert (=> b!164562 m!194873))

(declare-fun m!194875 () Bool)

(assert (=> b!164569 m!194875))

(declare-fun m!194877 () Bool)

(assert (=> mapNonEmpty!6183 m!194877))

(declare-fun m!194879 () Bool)

(assert (=> b!164560 m!194879))

(declare-fun m!194881 () Bool)

(assert (=> b!164564 m!194881))

(declare-fun m!194883 () Bool)

(assert (=> start!16540 m!194883))

(declare-fun m!194885 () Bool)

(assert (=> b!164561 m!194885))

(assert (=> b!164561 m!194885))

(declare-fun m!194887 () Bool)

(assert (=> b!164561 m!194887))

(declare-fun m!194889 () Bool)

(assert (=> b!164567 m!194889))

(declare-fun m!194891 () Bool)

(assert (=> b!164567 m!194891))

(check-sat (not start!16540) (not b_next!3841) b_and!10269 (not b!164569) (not b!164562) (not b!164560) (not b!164567) tp_is_empty!3643 (not b!164561) (not b!164564) (not mapNonEmpty!6183))
(check-sat b_and!10269 (not b_next!3841))
