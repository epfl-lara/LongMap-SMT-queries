; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16604 () Bool)

(assert start!16604)

(declare-fun b!165635 () Bool)

(declare-fun b_free!3909 () Bool)

(declare-fun b_next!3909 () Bool)

(assert (=> b!165635 (= b_free!3909 (not b_next!3909))))

(declare-fun tp!14327 () Bool)

(declare-fun b_and!10323 () Bool)

(assert (=> b!165635 (= tp!14327 b_and!10323)))

(declare-fun e!108649 () Bool)

(declare-datatypes ((V!4595 0))(
  ( (V!4596 (val!1900 Int)) )
))
(declare-datatypes ((ValueCell!1512 0))(
  ( (ValueCellFull!1512 (v!3765 V!4595)) (EmptyCell!1512) )
))
(declare-datatypes ((array!6519 0))(
  ( (array!6520 (arr!3095 (Array (_ BitVec 32) (_ BitVec 64))) (size!3383 (_ BitVec 32))) )
))
(declare-datatypes ((array!6521 0))(
  ( (array!6522 (arr!3096 (Array (_ BitVec 32) ValueCell!1512)) (size!3384 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1932 0))(
  ( (LongMapFixedSize!1933 (defaultEntry!3408 Int) (mask!8123 (_ BitVec 32)) (extraKeys!3149 (_ BitVec 32)) (zeroValue!3251 V!4595) (minValue!3251 V!4595) (_size!1015 (_ BitVec 32)) (_keys!5233 array!6519) (_values!3391 array!6521) (_vacant!1015 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1932)

(declare-fun e!108652 () Bool)

(declare-fun tp_is_empty!3711 () Bool)

(declare-fun array_inv!1989 (array!6519) Bool)

(declare-fun array_inv!1990 (array!6521) Bool)

(assert (=> b!165635 (= e!108652 (and tp!14327 tp_is_empty!3711 (array_inv!1989 (_keys!5233 thiss!1248)) (array_inv!1990 (_values!3391 thiss!1248)) e!108649))))

(declare-fun b!165637 () Bool)

(declare-fun res!78618 () Bool)

(declare-fun e!108650 () Bool)

(assert (=> b!165637 (=> (not res!78618) (not e!108650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165637 (= res!78618 (validMask!0 (mask!8123 thiss!1248)))))

(declare-fun b!165638 () Bool)

(assert (=> b!165638 (= e!108650 false)))

(declare-fun lt!83107 () Bool)

(declare-datatypes ((List!2061 0))(
  ( (Nil!2058) (Cons!2057 (h!2674 (_ BitVec 64)) (t!6863 List!2061)) )
))
(declare-fun arrayNoDuplicates!0 (array!6519 (_ BitVec 32) List!2061) Bool)

(assert (=> b!165638 (= lt!83107 (arrayNoDuplicates!0 (_keys!5233 thiss!1248) #b00000000000000000000000000000000 Nil!2058))))

(declare-fun b!165639 () Bool)

(declare-fun res!78619 () Bool)

(assert (=> b!165639 (=> (not res!78619) (not e!108650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6519 (_ BitVec 32)) Bool)

(assert (=> b!165639 (= res!78619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5233 thiss!1248) (mask!8123 thiss!1248)))))

(declare-fun mapNonEmpty!6285 () Bool)

(declare-fun mapRes!6285 () Bool)

(declare-fun tp!14328 () Bool)

(declare-fun e!108651 () Bool)

(assert (=> mapNonEmpty!6285 (= mapRes!6285 (and tp!14328 e!108651))))

(declare-fun mapRest!6285 () (Array (_ BitVec 32) ValueCell!1512))

(declare-fun mapValue!6285 () ValueCell!1512)

(declare-fun mapKey!6285 () (_ BitVec 32))

(assert (=> mapNonEmpty!6285 (= (arr!3096 (_values!3391 thiss!1248)) (store mapRest!6285 mapKey!6285 mapValue!6285))))

(declare-fun b!165640 () Bool)

(declare-fun res!78621 () Bool)

(declare-fun e!108648 () Bool)

(assert (=> b!165640 (=> (not res!78621) (not e!108648))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165640 (= res!78621 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165641 () Bool)

(declare-fun res!78617 () Bool)

(assert (=> b!165641 (=> (not res!78617) (not e!108650))))

(declare-datatypes ((tuple2!3076 0))(
  ( (tuple2!3077 (_1!1549 (_ BitVec 64)) (_2!1549 V!4595)) )
))
(declare-datatypes ((List!2062 0))(
  ( (Nil!2059) (Cons!2058 (h!2675 tuple2!3076) (t!6864 List!2062)) )
))
(declare-datatypes ((ListLongMap!2031 0))(
  ( (ListLongMap!2032 (toList!1031 List!2062)) )
))
(declare-fun contains!1073 (ListLongMap!2031 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!689 (array!6519 array!6521 (_ BitVec 32) (_ BitVec 32) V!4595 V!4595 (_ BitVec 32) Int) ListLongMap!2031)

(assert (=> b!165641 (= res!78617 (not (contains!1073 (getCurrentListMap!689 (_keys!5233 thiss!1248) (_values!3391 thiss!1248) (mask!8123 thiss!1248) (extraKeys!3149 thiss!1248) (zeroValue!3251 thiss!1248) (minValue!3251 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3408 thiss!1248)) key!828)))))

(declare-fun mapIsEmpty!6285 () Bool)

(assert (=> mapIsEmpty!6285 mapRes!6285))

(declare-fun b!165642 () Bool)

(assert (=> b!165642 (= e!108651 tp_is_empty!3711)))

(declare-fun b!165643 () Bool)

(declare-fun res!78615 () Bool)

(assert (=> b!165643 (=> (not res!78615) (not e!108650))))

(assert (=> b!165643 (= res!78615 (and (= (size!3384 (_values!3391 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8123 thiss!1248))) (= (size!3383 (_keys!5233 thiss!1248)) (size!3384 (_values!3391 thiss!1248))) (bvsge (mask!8123 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3149 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3149 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!78620 () Bool)

(assert (=> start!16604 (=> (not res!78620) (not e!108648))))

(declare-fun valid!854 (LongMapFixedSize!1932) Bool)

(assert (=> start!16604 (= res!78620 (valid!854 thiss!1248))))

(assert (=> start!16604 e!108648))

(assert (=> start!16604 e!108652))

(assert (=> start!16604 true))

(declare-fun b!165636 () Bool)

(declare-fun e!108647 () Bool)

(assert (=> b!165636 (= e!108647 tp_is_empty!3711)))

(declare-fun b!165644 () Bool)

(assert (=> b!165644 (= e!108649 (and e!108647 mapRes!6285))))

(declare-fun condMapEmpty!6285 () Bool)

(declare-fun mapDefault!6285 () ValueCell!1512)

(assert (=> b!165644 (= condMapEmpty!6285 (= (arr!3096 (_values!3391 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1512)) mapDefault!6285)))))

(declare-fun b!165645 () Bool)

(assert (=> b!165645 (= e!108648 e!108650)))

(declare-fun res!78616 () Bool)

(assert (=> b!165645 (=> (not res!78616) (not e!108650))))

(declare-datatypes ((SeekEntryResult!440 0))(
  ( (MissingZero!440 (index!3928 (_ BitVec 32))) (Found!440 (index!3929 (_ BitVec 32))) (Intermediate!440 (undefined!1252 Bool) (index!3930 (_ BitVec 32)) (x!18356 (_ BitVec 32))) (Undefined!440) (MissingVacant!440 (index!3931 (_ BitVec 32))) )
))
(declare-fun lt!83106 () SeekEntryResult!440)

(get-info :version)

(assert (=> b!165645 (= res!78616 (and (not ((_ is Undefined!440) lt!83106)) (not ((_ is MissingVacant!440) lt!83106)) (not ((_ is MissingZero!440) lt!83106)) ((_ is Found!440) lt!83106)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6519 (_ BitVec 32)) SeekEntryResult!440)

(assert (=> b!165645 (= lt!83106 (seekEntryOrOpen!0 key!828 (_keys!5233 thiss!1248) (mask!8123 thiss!1248)))))

(assert (= (and start!16604 res!78620) b!165640))

(assert (= (and b!165640 res!78621) b!165645))

(assert (= (and b!165645 res!78616) b!165641))

(assert (= (and b!165641 res!78617) b!165637))

(assert (= (and b!165637 res!78618) b!165643))

(assert (= (and b!165643 res!78615) b!165639))

(assert (= (and b!165639 res!78619) b!165638))

(assert (= (and b!165644 condMapEmpty!6285) mapIsEmpty!6285))

(assert (= (and b!165644 (not condMapEmpty!6285)) mapNonEmpty!6285))

(assert (= (and mapNonEmpty!6285 ((_ is ValueCellFull!1512) mapValue!6285)) b!165642))

(assert (= (and b!165644 ((_ is ValueCellFull!1512) mapDefault!6285)) b!165636))

(assert (= b!165635 b!165644))

(assert (= start!16604 b!165635))

(declare-fun m!195371 () Bool)

(assert (=> b!165639 m!195371))

(declare-fun m!195373 () Bool)

(assert (=> b!165645 m!195373))

(declare-fun m!195375 () Bool)

(assert (=> b!165635 m!195375))

(declare-fun m!195377 () Bool)

(assert (=> b!165635 m!195377))

(declare-fun m!195379 () Bool)

(assert (=> b!165638 m!195379))

(declare-fun m!195381 () Bool)

(assert (=> b!165637 m!195381))

(declare-fun m!195383 () Bool)

(assert (=> b!165641 m!195383))

(assert (=> b!165641 m!195383))

(declare-fun m!195385 () Bool)

(assert (=> b!165641 m!195385))

(declare-fun m!195387 () Bool)

(assert (=> start!16604 m!195387))

(declare-fun m!195389 () Bool)

(assert (=> mapNonEmpty!6285 m!195389))

(check-sat (not b_next!3909) (not b!165641) (not start!16604) (not mapNonEmpty!6285) (not b!165637) b_and!10323 tp_is_empty!3711 (not b!165638) (not b!165635) (not b!165645) (not b!165639))
(check-sat b_and!10323 (not b_next!3909))
