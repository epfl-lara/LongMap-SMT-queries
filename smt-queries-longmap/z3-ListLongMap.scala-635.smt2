; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16160 () Bool)

(assert start!16160)

(declare-fun b!161054 () Bool)

(declare-fun b_free!3621 () Bool)

(declare-fun b_next!3621 () Bool)

(assert (=> b!161054 (= b_free!3621 (not b_next!3621))))

(declare-fun tp!13433 () Bool)

(declare-fun b_and!10035 () Bool)

(assert (=> b!161054 (= tp!13433 b_and!10035)))

(declare-fun b!161046 () Bool)

(declare-fun res!76352 () Bool)

(declare-fun e!105236 () Bool)

(assert (=> b!161046 (=> (not res!76352) (not e!105236))))

(declare-datatypes ((V!4211 0))(
  ( (V!4212 (val!1756 Int)) )
))
(declare-datatypes ((ValueCell!1368 0))(
  ( (ValueCellFull!1368 (v!3621 V!4211)) (EmptyCell!1368) )
))
(declare-datatypes ((array!5925 0))(
  ( (array!5926 (arr!2807 (Array (_ BitVec 32) (_ BitVec 64))) (size!3091 (_ BitVec 32))) )
))
(declare-datatypes ((array!5927 0))(
  ( (array!5928 (arr!2808 (Array (_ BitVec 32) ValueCell!1368)) (size!3092 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1644 0))(
  ( (LongMapFixedSize!1645 (defaultEntry!3264 Int) (mask!7846 (_ BitVec 32)) (extraKeys!3005 (_ BitVec 32)) (zeroValue!3107 V!4211) (minValue!3107 V!4211) (_size!871 (_ BitVec 32)) (_keys!5065 array!5925) (_values!3247 array!5927) (_vacant!871 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1644)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!161046 (= res!76352 (validMask!0 (mask!7846 thiss!1248)))))

(declare-fun b!161047 () Bool)

(declare-fun res!76353 () Bool)

(assert (=> b!161047 (=> (not res!76353) (not e!105236))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2946 0))(
  ( (tuple2!2947 (_1!1484 (_ BitVec 64)) (_2!1484 V!4211)) )
))
(declare-datatypes ((List!1966 0))(
  ( (Nil!1963) (Cons!1962 (h!2575 tuple2!2946) (t!6768 List!1966)) )
))
(declare-datatypes ((ListLongMap!1933 0))(
  ( (ListLongMap!1934 (toList!982 List!1966)) )
))
(declare-fun contains!1018 (ListLongMap!1933 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!646 (array!5925 array!5927 (_ BitVec 32) (_ BitVec 32) V!4211 V!4211 (_ BitVec 32) Int) ListLongMap!1933)

(assert (=> b!161047 (= res!76353 (not (contains!1018 (getCurrentListMap!646 (_keys!5065 thiss!1248) (_values!3247 thiss!1248) (mask!7846 thiss!1248) (extraKeys!3005 thiss!1248) (zeroValue!3107 thiss!1248) (minValue!3107 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3264 thiss!1248)) key!828)))))

(declare-fun b!161048 () Bool)

(declare-fun res!76357 () Bool)

(assert (=> b!161048 (=> (not res!76357) (not e!105236))))

(assert (=> b!161048 (= res!76357 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161049 () Bool)

(assert (=> b!161049 (= e!105236 false)))

(declare-fun lt!82144 () Bool)

(declare-datatypes ((List!1967 0))(
  ( (Nil!1964) (Cons!1963 (h!2576 (_ BitVec 64)) (t!6769 List!1967)) )
))
(declare-fun arrayNoDuplicates!0 (array!5925 (_ BitVec 32) List!1967) Bool)

(assert (=> b!161049 (= lt!82144 (arrayNoDuplicates!0 (_keys!5065 thiss!1248) #b00000000000000000000000000000000 Nil!1964))))

(declare-fun res!76354 () Bool)

(assert (=> start!16160 (=> (not res!76354) (not e!105236))))

(declare-fun valid!757 (LongMapFixedSize!1644) Bool)

(assert (=> start!16160 (= res!76354 (valid!757 thiss!1248))))

(assert (=> start!16160 e!105236))

(declare-fun e!105235 () Bool)

(assert (=> start!16160 e!105235))

(assert (=> start!16160 true))

(declare-fun mapIsEmpty!5822 () Bool)

(declare-fun mapRes!5822 () Bool)

(assert (=> mapIsEmpty!5822 mapRes!5822))

(declare-fun mapNonEmpty!5822 () Bool)

(declare-fun tp!13432 () Bool)

(declare-fun e!105240 () Bool)

(assert (=> mapNonEmpty!5822 (= mapRes!5822 (and tp!13432 e!105240))))

(declare-fun mapValue!5822 () ValueCell!1368)

(declare-fun mapRest!5822 () (Array (_ BitVec 32) ValueCell!1368))

(declare-fun mapKey!5822 () (_ BitVec 32))

(assert (=> mapNonEmpty!5822 (= (arr!2808 (_values!3247 thiss!1248)) (store mapRest!5822 mapKey!5822 mapValue!5822))))

(declare-fun b!161050 () Bool)

(declare-fun tp_is_empty!3423 () Bool)

(assert (=> b!161050 (= e!105240 tp_is_empty!3423)))

(declare-fun b!161051 () Bool)

(declare-fun res!76358 () Bool)

(assert (=> b!161051 (=> (not res!76358) (not e!105236))))

(assert (=> b!161051 (= res!76358 (and (= (size!3092 (_values!3247 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7846 thiss!1248))) (= (size!3091 (_keys!5065 thiss!1248)) (size!3092 (_values!3247 thiss!1248))) (bvsge (mask!7846 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3005 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3005 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!161052 () Bool)

(declare-fun e!105237 () Bool)

(assert (=> b!161052 (= e!105237 tp_is_empty!3423)))

(declare-fun b!161053 () Bool)

(declare-fun res!76356 () Bool)

(assert (=> b!161053 (=> (not res!76356) (not e!105236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5925 (_ BitVec 32)) Bool)

(assert (=> b!161053 (= res!76356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5065 thiss!1248) (mask!7846 thiss!1248)))))

(declare-fun e!105239 () Bool)

(declare-fun array_inv!1793 (array!5925) Bool)

(declare-fun array_inv!1794 (array!5927) Bool)

(assert (=> b!161054 (= e!105235 (and tp!13433 tp_is_empty!3423 (array_inv!1793 (_keys!5065 thiss!1248)) (array_inv!1794 (_values!3247 thiss!1248)) e!105239))))

(declare-fun b!161055 () Bool)

(assert (=> b!161055 (= e!105239 (and e!105237 mapRes!5822))))

(declare-fun condMapEmpty!5822 () Bool)

(declare-fun mapDefault!5822 () ValueCell!1368)

(assert (=> b!161055 (= condMapEmpty!5822 (= (arr!2808 (_values!3247 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1368)) mapDefault!5822)))))

(declare-fun b!161056 () Bool)

(declare-fun res!76355 () Bool)

(assert (=> b!161056 (=> (not res!76355) (not e!105236))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!345 0))(
  ( (MissingZero!345 (index!3548 (_ BitVec 32))) (Found!345 (index!3549 (_ BitVec 32))) (Intermediate!345 (undefined!1157 Bool) (index!3550 (_ BitVec 32)) (x!17769 (_ BitVec 32))) (Undefined!345) (MissingVacant!345 (index!3551 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5925 (_ BitVec 32)) SeekEntryResult!345)

(assert (=> b!161056 (= res!76355 ((_ is Undefined!345) (seekEntryOrOpen!0 key!828 (_keys!5065 thiss!1248) (mask!7846 thiss!1248))))))

(assert (= (and start!16160 res!76354) b!161048))

(assert (= (and b!161048 res!76357) b!161056))

(assert (= (and b!161056 res!76355) b!161047))

(assert (= (and b!161047 res!76353) b!161046))

(assert (= (and b!161046 res!76352) b!161051))

(assert (= (and b!161051 res!76358) b!161053))

(assert (= (and b!161053 res!76356) b!161049))

(assert (= (and b!161055 condMapEmpty!5822) mapIsEmpty!5822))

(assert (= (and b!161055 (not condMapEmpty!5822)) mapNonEmpty!5822))

(assert (= (and mapNonEmpty!5822 ((_ is ValueCellFull!1368) mapValue!5822)) b!161050))

(assert (= (and b!161055 ((_ is ValueCellFull!1368) mapDefault!5822)) b!161052))

(assert (= b!161054 b!161055))

(assert (= start!16160 b!161054))

(declare-fun m!192677 () Bool)

(assert (=> b!161053 m!192677))

(declare-fun m!192679 () Bool)

(assert (=> b!161054 m!192679))

(declare-fun m!192681 () Bool)

(assert (=> b!161054 m!192681))

(declare-fun m!192683 () Bool)

(assert (=> b!161056 m!192683))

(declare-fun m!192685 () Bool)

(assert (=> b!161049 m!192685))

(declare-fun m!192687 () Bool)

(assert (=> mapNonEmpty!5822 m!192687))

(declare-fun m!192689 () Bool)

(assert (=> b!161047 m!192689))

(assert (=> b!161047 m!192689))

(declare-fun m!192691 () Bool)

(assert (=> b!161047 m!192691))

(declare-fun m!192693 () Bool)

(assert (=> b!161046 m!192693))

(declare-fun m!192695 () Bool)

(assert (=> start!16160 m!192695))

(check-sat (not b!161046) (not b!161047) (not mapNonEmpty!5822) b_and!10035 tp_is_empty!3423 (not b!161056) (not start!16160) (not b_next!3621) (not b!161054) (not b!161049) (not b!161053))
(check-sat b_and!10035 (not b_next!3621))
