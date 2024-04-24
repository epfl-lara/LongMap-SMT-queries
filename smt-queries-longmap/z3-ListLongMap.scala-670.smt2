; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16528 () Bool)

(assert start!16528)

(declare-fun b!164366 () Bool)

(declare-fun b_free!3829 () Bool)

(declare-fun b_next!3829 () Bool)

(assert (=> b!164366 (= b_free!3829 (not b_next!3829))))

(declare-fun tp!14088 () Bool)

(declare-fun b_and!10257 () Bool)

(assert (=> b!164366 (= tp!14088 b_and!10257)))

(declare-fun b!164362 () Bool)

(declare-fun res!77801 () Bool)

(declare-fun e!107833 () Bool)

(assert (=> b!164362 (=> (not res!77801) (not e!107833))))

(declare-datatypes ((V!4489 0))(
  ( (V!4490 (val!1860 Int)) )
))
(declare-datatypes ((ValueCell!1472 0))(
  ( (ValueCellFull!1472 (v!3726 V!4489)) (EmptyCell!1472) )
))
(declare-datatypes ((array!6345 0))(
  ( (array!6346 (arr!3008 (Array (_ BitVec 32) (_ BitVec 64))) (size!3296 (_ BitVec 32))) )
))
(declare-datatypes ((array!6347 0))(
  ( (array!6348 (arr!3009 (Array (_ BitVec 32) ValueCell!1472)) (size!3297 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1852 0))(
  ( (LongMapFixedSize!1853 (defaultEntry!3368 Int) (mask!8057 (_ BitVec 32)) (extraKeys!3109 (_ BitVec 32)) (zeroValue!3211 V!4489) (minValue!3211 V!4489) (_size!975 (_ BitVec 32)) (_keys!5193 array!6345) (_values!3351 array!6347) (_vacant!975 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1852)

(assert (=> b!164362 (= res!77801 (and (= (size!3297 (_values!3351 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8057 thiss!1248))) (= (size!3296 (_keys!5193 thiss!1248)) (size!3297 (_values!3351 thiss!1248))) (bvsge (mask!8057 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3109 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3109 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!77797 () Bool)

(declare-fun e!107834 () Bool)

(assert (=> start!16528 (=> (not res!77797) (not e!107834))))

(declare-fun valid!844 (LongMapFixedSize!1852) Bool)

(assert (=> start!16528 (= res!77797 (valid!844 thiss!1248))))

(assert (=> start!16528 e!107834))

(declare-fun e!107837 () Bool)

(assert (=> start!16528 e!107837))

(assert (=> start!16528 true))

(declare-fun mapNonEmpty!6165 () Bool)

(declare-fun mapRes!6165 () Bool)

(declare-fun tp!14087 () Bool)

(declare-fun e!107831 () Bool)

(assert (=> mapNonEmpty!6165 (= mapRes!6165 (and tp!14087 e!107831))))

(declare-fun mapKey!6165 () (_ BitVec 32))

(declare-fun mapValue!6165 () ValueCell!1472)

(declare-fun mapRest!6165 () (Array (_ BitVec 32) ValueCell!1472))

(assert (=> mapNonEmpty!6165 (= (arr!3009 (_values!3351 thiss!1248)) (store mapRest!6165 mapKey!6165 mapValue!6165))))

(declare-fun b!164363 () Bool)

(declare-fun res!77799 () Bool)

(assert (=> b!164363 (=> (not res!77799) (not e!107833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164363 (= res!77799 (validMask!0 (mask!8057 thiss!1248)))))

(declare-fun b!164364 () Bool)

(declare-fun e!107832 () Bool)

(declare-fun tp_is_empty!3631 () Bool)

(assert (=> b!164364 (= e!107832 tp_is_empty!3631)))

(declare-fun b!164365 () Bool)

(assert (=> b!164365 (= e!107833 false)))

(declare-fun lt!82926 () Bool)

(declare-datatypes ((List!1996 0))(
  ( (Nil!1993) (Cons!1992 (h!2609 (_ BitVec 64)) (t!6790 List!1996)) )
))
(declare-fun arrayNoDuplicates!0 (array!6345 (_ BitVec 32) List!1996) Bool)

(assert (=> b!164365 (= lt!82926 (arrayNoDuplicates!0 (_keys!5193 thiss!1248) #b00000000000000000000000000000000 Nil!1993))))

(declare-fun mapIsEmpty!6165 () Bool)

(assert (=> mapIsEmpty!6165 mapRes!6165))

(declare-fun e!107835 () Bool)

(declare-fun array_inv!1931 (array!6345) Bool)

(declare-fun array_inv!1932 (array!6347) Bool)

(assert (=> b!164366 (= e!107837 (and tp!14088 tp_is_empty!3631 (array_inv!1931 (_keys!5193 thiss!1248)) (array_inv!1932 (_values!3351 thiss!1248)) e!107835))))

(declare-fun b!164367 () Bool)

(assert (=> b!164367 (= e!107831 tp_is_empty!3631)))

(declare-fun b!164368 () Bool)

(assert (=> b!164368 (= e!107834 e!107833)))

(declare-fun res!77802 () Bool)

(assert (=> b!164368 (=> (not res!77802) (not e!107833))))

(declare-datatypes ((SeekEntryResult!407 0))(
  ( (MissingZero!407 (index!3796 (_ BitVec 32))) (Found!407 (index!3797 (_ BitVec 32))) (Intermediate!407 (undefined!1219 Bool) (index!3798 (_ BitVec 32)) (x!18219 (_ BitVec 32))) (Undefined!407) (MissingVacant!407 (index!3799 (_ BitVec 32))) )
))
(declare-fun lt!82925 () SeekEntryResult!407)

(get-info :version)

(assert (=> b!164368 (= res!77802 (and (not ((_ is Undefined!407) lt!82925)) (not ((_ is MissingVacant!407) lt!82925)) (not ((_ is MissingZero!407) lt!82925)) ((_ is Found!407) lt!82925)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6345 (_ BitVec 32)) SeekEntryResult!407)

(assert (=> b!164368 (= lt!82925 (seekEntryOrOpen!0 key!828 (_keys!5193 thiss!1248) (mask!8057 thiss!1248)))))

(declare-fun b!164369 () Bool)

(declare-fun res!77796 () Bool)

(assert (=> b!164369 (=> (not res!77796) (not e!107833))))

(declare-datatypes ((tuple2!2974 0))(
  ( (tuple2!2975 (_1!1498 (_ BitVec 64)) (_2!1498 V!4489)) )
))
(declare-datatypes ((List!1997 0))(
  ( (Nil!1994) (Cons!1993 (h!2610 tuple2!2974) (t!6791 List!1997)) )
))
(declare-datatypes ((ListLongMap!1935 0))(
  ( (ListLongMap!1936 (toList!983 List!1997)) )
))
(declare-fun contains!1035 (ListLongMap!1935 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!645 (array!6345 array!6347 (_ BitVec 32) (_ BitVec 32) V!4489 V!4489 (_ BitVec 32) Int) ListLongMap!1935)

(assert (=> b!164369 (= res!77796 (contains!1035 (getCurrentListMap!645 (_keys!5193 thiss!1248) (_values!3351 thiss!1248) (mask!8057 thiss!1248) (extraKeys!3109 thiss!1248) (zeroValue!3211 thiss!1248) (minValue!3211 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3368 thiss!1248)) key!828))))

(declare-fun b!164370 () Bool)

(declare-fun res!77798 () Bool)

(assert (=> b!164370 (=> (not res!77798) (not e!107834))))

(assert (=> b!164370 (= res!77798 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164371 () Bool)

(assert (=> b!164371 (= e!107835 (and e!107832 mapRes!6165))))

(declare-fun condMapEmpty!6165 () Bool)

(declare-fun mapDefault!6165 () ValueCell!1472)

(assert (=> b!164371 (= condMapEmpty!6165 (= (arr!3009 (_values!3351 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1472)) mapDefault!6165)))))

(declare-fun b!164372 () Bool)

(declare-fun res!77800 () Bool)

(assert (=> b!164372 (=> (not res!77800) (not e!107833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6345 (_ BitVec 32)) Bool)

(assert (=> b!164372 (= res!77800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5193 thiss!1248) (mask!8057 thiss!1248)))))

(assert (= (and start!16528 res!77797) b!164370))

(assert (= (and b!164370 res!77798) b!164368))

(assert (= (and b!164368 res!77802) b!164369))

(assert (= (and b!164369 res!77796) b!164363))

(assert (= (and b!164363 res!77799) b!164362))

(assert (= (and b!164362 res!77801) b!164372))

(assert (= (and b!164372 res!77800) b!164365))

(assert (= (and b!164371 condMapEmpty!6165) mapIsEmpty!6165))

(assert (= (and b!164371 (not condMapEmpty!6165)) mapNonEmpty!6165))

(assert (= (and mapNonEmpty!6165 ((_ is ValueCellFull!1472) mapValue!6165)) b!164367))

(assert (= (and b!164371 ((_ is ValueCellFull!1472) mapDefault!6165)) b!164364))

(assert (= b!164366 b!164371))

(assert (= start!16528 b!164366))

(declare-fun m!194753 () Bool)

(assert (=> b!164366 m!194753))

(declare-fun m!194755 () Bool)

(assert (=> b!164366 m!194755))

(declare-fun m!194757 () Bool)

(assert (=> b!164368 m!194757))

(declare-fun m!194759 () Bool)

(assert (=> mapNonEmpty!6165 m!194759))

(declare-fun m!194761 () Bool)

(assert (=> b!164363 m!194761))

(declare-fun m!194763 () Bool)

(assert (=> b!164369 m!194763))

(assert (=> b!164369 m!194763))

(declare-fun m!194765 () Bool)

(assert (=> b!164369 m!194765))

(declare-fun m!194767 () Bool)

(assert (=> start!16528 m!194767))

(declare-fun m!194769 () Bool)

(assert (=> b!164372 m!194769))

(declare-fun m!194771 () Bool)

(assert (=> b!164365 m!194771))

(check-sat b_and!10257 (not b!164372) (not b!164365) (not b_next!3829) (not mapNonEmpty!6165) (not b!164369) (not b!164366) (not b!164363) tp_is_empty!3631 (not start!16528) (not b!164368))
(check-sat b_and!10257 (not b_next!3829))
