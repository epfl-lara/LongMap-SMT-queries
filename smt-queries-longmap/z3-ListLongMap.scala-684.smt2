; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16610 () Bool)

(assert start!16610)

(declare-fun b!165744 () Bool)

(declare-fun b_free!3915 () Bool)

(declare-fun b_next!3915 () Bool)

(assert (=> b!165744 (= b_free!3915 (not b_next!3915))))

(declare-fun tp!14345 () Bool)

(declare-fun b_and!10329 () Bool)

(assert (=> b!165744 (= tp!14345 b_and!10329)))

(declare-fun b!165734 () Bool)

(declare-fun res!78683 () Bool)

(declare-fun e!108714 () Bool)

(assert (=> b!165734 (=> (not res!78683) (not e!108714))))

(declare-datatypes ((V!4603 0))(
  ( (V!4604 (val!1903 Int)) )
))
(declare-datatypes ((ValueCell!1515 0))(
  ( (ValueCellFull!1515 (v!3768 V!4603)) (EmptyCell!1515) )
))
(declare-datatypes ((array!6531 0))(
  ( (array!6532 (arr!3101 (Array (_ BitVec 32) (_ BitVec 64))) (size!3389 (_ BitVec 32))) )
))
(declare-datatypes ((array!6533 0))(
  ( (array!6534 (arr!3102 (Array (_ BitVec 32) ValueCell!1515)) (size!3390 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1938 0))(
  ( (LongMapFixedSize!1939 (defaultEntry!3411 Int) (mask!8128 (_ BitVec 32)) (extraKeys!3152 (_ BitVec 32)) (zeroValue!3254 V!4603) (minValue!3254 V!4603) (_size!1018 (_ BitVec 32)) (_keys!5236 array!6531) (_values!3394 array!6533) (_vacant!1018 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1938)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6531 (_ BitVec 32)) Bool)

(assert (=> b!165734 (= res!78683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5236 thiss!1248) (mask!8128 thiss!1248)))))

(declare-fun b!165735 () Bool)

(declare-fun res!78681 () Bool)

(assert (=> b!165735 (=> (not res!78681) (not e!108714))))

(assert (=> b!165735 (= res!78681 (and (= (size!3390 (_values!3394 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8128 thiss!1248))) (= (size!3389 (_keys!5236 thiss!1248)) (size!3390 (_values!3394 thiss!1248))) (bvsge (mask!8128 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3152 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3152 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165736 () Bool)

(assert (=> b!165736 (= e!108714 false)))

(declare-fun lt!83124 () Bool)

(declare-datatypes ((List!2066 0))(
  ( (Nil!2063) (Cons!2062 (h!2679 (_ BitVec 64)) (t!6868 List!2066)) )
))
(declare-fun arrayNoDuplicates!0 (array!6531 (_ BitVec 32) List!2066) Bool)

(assert (=> b!165736 (= lt!83124 (arrayNoDuplicates!0 (_keys!5236 thiss!1248) #b00000000000000000000000000000000 Nil!2063))))

(declare-fun b!165738 () Bool)

(declare-fun e!108712 () Bool)

(declare-fun tp_is_empty!3717 () Bool)

(assert (=> b!165738 (= e!108712 tp_is_empty!3717)))

(declare-fun mapNonEmpty!6294 () Bool)

(declare-fun mapRes!6294 () Bool)

(declare-fun tp!14346 () Bool)

(declare-fun e!108711 () Bool)

(assert (=> mapNonEmpty!6294 (= mapRes!6294 (and tp!14346 e!108711))))

(declare-fun mapKey!6294 () (_ BitVec 32))

(declare-fun mapValue!6294 () ValueCell!1515)

(declare-fun mapRest!6294 () (Array (_ BitVec 32) ValueCell!1515))

(assert (=> mapNonEmpty!6294 (= (arr!3102 (_values!3394 thiss!1248)) (store mapRest!6294 mapKey!6294 mapValue!6294))))

(declare-fun b!165739 () Bool)

(declare-fun e!108716 () Bool)

(assert (=> b!165739 (= e!108716 (and e!108712 mapRes!6294))))

(declare-fun condMapEmpty!6294 () Bool)

(declare-fun mapDefault!6294 () ValueCell!1515)

(assert (=> b!165739 (= condMapEmpty!6294 (= (arr!3102 (_values!3394 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1515)) mapDefault!6294)))))

(declare-fun b!165740 () Bool)

(declare-fun res!78679 () Bool)

(assert (=> b!165740 (=> (not res!78679) (not e!108714))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3082 0))(
  ( (tuple2!3083 (_1!1552 (_ BitVec 64)) (_2!1552 V!4603)) )
))
(declare-datatypes ((List!2067 0))(
  ( (Nil!2064) (Cons!2063 (h!2680 tuple2!3082) (t!6869 List!2067)) )
))
(declare-datatypes ((ListLongMap!2037 0))(
  ( (ListLongMap!2038 (toList!1034 List!2067)) )
))
(declare-fun contains!1076 (ListLongMap!2037 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!692 (array!6531 array!6533 (_ BitVec 32) (_ BitVec 32) V!4603 V!4603 (_ BitVec 32) Int) ListLongMap!2037)

(assert (=> b!165740 (= res!78679 (not (contains!1076 (getCurrentListMap!692 (_keys!5236 thiss!1248) (_values!3394 thiss!1248) (mask!8128 thiss!1248) (extraKeys!3152 thiss!1248) (zeroValue!3254 thiss!1248) (minValue!3254 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3411 thiss!1248)) key!828)))))

(declare-fun b!165741 () Bool)

(assert (=> b!165741 (= e!108711 tp_is_empty!3717)))

(declare-fun b!165742 () Bool)

(declare-fun e!108713 () Bool)

(assert (=> b!165742 (= e!108713 e!108714)))

(declare-fun res!78684 () Bool)

(assert (=> b!165742 (=> (not res!78684) (not e!108714))))

(declare-datatypes ((SeekEntryResult!442 0))(
  ( (MissingZero!442 (index!3936 (_ BitVec 32))) (Found!442 (index!3937 (_ BitVec 32))) (Intermediate!442 (undefined!1254 Bool) (index!3938 (_ BitVec 32)) (x!18366 (_ BitVec 32))) (Undefined!442) (MissingVacant!442 (index!3939 (_ BitVec 32))) )
))
(declare-fun lt!83125 () SeekEntryResult!442)

(get-info :version)

(assert (=> b!165742 (= res!78684 (and (not ((_ is Undefined!442) lt!83125)) (not ((_ is MissingVacant!442) lt!83125)) (not ((_ is MissingZero!442) lt!83125)) ((_ is Found!442) lt!83125)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6531 (_ BitVec 32)) SeekEntryResult!442)

(assert (=> b!165742 (= lt!83125 (seekEntryOrOpen!0 key!828 (_keys!5236 thiss!1248) (mask!8128 thiss!1248)))))

(declare-fun b!165743 () Bool)

(declare-fun res!78682 () Bool)

(assert (=> b!165743 (=> (not res!78682) (not e!108713))))

(assert (=> b!165743 (= res!78682 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165737 () Bool)

(declare-fun res!78680 () Bool)

(assert (=> b!165737 (=> (not res!78680) (not e!108714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165737 (= res!78680 (validMask!0 (mask!8128 thiss!1248)))))

(declare-fun res!78678 () Bool)

(assert (=> start!16610 (=> (not res!78678) (not e!108713))))

(declare-fun valid!856 (LongMapFixedSize!1938) Bool)

(assert (=> start!16610 (= res!78678 (valid!856 thiss!1248))))

(assert (=> start!16610 e!108713))

(declare-fun e!108710 () Bool)

(assert (=> start!16610 e!108710))

(assert (=> start!16610 true))

(declare-fun mapIsEmpty!6294 () Bool)

(assert (=> mapIsEmpty!6294 mapRes!6294))

(declare-fun array_inv!1991 (array!6531) Bool)

(declare-fun array_inv!1992 (array!6533) Bool)

(assert (=> b!165744 (= e!108710 (and tp!14345 tp_is_empty!3717 (array_inv!1991 (_keys!5236 thiss!1248)) (array_inv!1992 (_values!3394 thiss!1248)) e!108716))))

(assert (= (and start!16610 res!78678) b!165743))

(assert (= (and b!165743 res!78682) b!165742))

(assert (= (and b!165742 res!78684) b!165740))

(assert (= (and b!165740 res!78679) b!165737))

(assert (= (and b!165737 res!78680) b!165735))

(assert (= (and b!165735 res!78681) b!165734))

(assert (= (and b!165734 res!78683) b!165736))

(assert (= (and b!165739 condMapEmpty!6294) mapIsEmpty!6294))

(assert (= (and b!165739 (not condMapEmpty!6294)) mapNonEmpty!6294))

(assert (= (and mapNonEmpty!6294 ((_ is ValueCellFull!1515) mapValue!6294)) b!165741))

(assert (= (and b!165739 ((_ is ValueCellFull!1515) mapDefault!6294)) b!165738))

(assert (= b!165744 b!165739))

(assert (= start!16610 b!165744))

(declare-fun m!195431 () Bool)

(assert (=> b!165744 m!195431))

(declare-fun m!195433 () Bool)

(assert (=> b!165744 m!195433))

(declare-fun m!195435 () Bool)

(assert (=> b!165736 m!195435))

(declare-fun m!195437 () Bool)

(assert (=> b!165742 m!195437))

(declare-fun m!195439 () Bool)

(assert (=> start!16610 m!195439))

(declare-fun m!195441 () Bool)

(assert (=> b!165734 m!195441))

(declare-fun m!195443 () Bool)

(assert (=> b!165737 m!195443))

(declare-fun m!195445 () Bool)

(assert (=> b!165740 m!195445))

(assert (=> b!165740 m!195445))

(declare-fun m!195447 () Bool)

(assert (=> b!165740 m!195447))

(declare-fun m!195449 () Bool)

(assert (=> mapNonEmpty!6294 m!195449))

(check-sat (not b!165740) (not b_next!3915) (not start!16610) (not b!165744) (not b!165736) b_and!10329 (not b!165742) (not mapNonEmpty!6294) tp_is_empty!3717 (not b!165737) (not b!165734))
(check-sat b_and!10329 (not b_next!3915))
