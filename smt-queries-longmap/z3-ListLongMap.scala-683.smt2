; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16606 () Bool)

(assert start!16606)

(declare-fun b!165655 () Bool)

(declare-fun b_free!3907 () Bool)

(declare-fun b_next!3907 () Bool)

(assert (=> b!165655 (= b_free!3907 (not b_next!3907))))

(declare-fun tp!14322 () Bool)

(declare-fun b_and!10335 () Bool)

(assert (=> b!165655 (= tp!14322 b_and!10335)))

(declare-fun b!165649 () Bool)

(declare-fun res!78617 () Bool)

(declare-fun e!108650 () Bool)

(assert (=> b!165649 (=> (not res!78617) (not e!108650))))

(declare-datatypes ((V!4593 0))(
  ( (V!4594 (val!1899 Int)) )
))
(declare-datatypes ((ValueCell!1511 0))(
  ( (ValueCellFull!1511 (v!3765 V!4593)) (EmptyCell!1511) )
))
(declare-datatypes ((array!6501 0))(
  ( (array!6502 (arr!3086 (Array (_ BitVec 32) (_ BitVec 64))) (size!3374 (_ BitVec 32))) )
))
(declare-datatypes ((array!6503 0))(
  ( (array!6504 (arr!3087 (Array (_ BitVec 32) ValueCell!1511)) (size!3375 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1930 0))(
  ( (LongMapFixedSize!1931 (defaultEntry!3407 Int) (mask!8122 (_ BitVec 32)) (extraKeys!3148 (_ BitVec 32)) (zeroValue!3250 V!4593) (minValue!3250 V!4593) (_size!1014 (_ BitVec 32)) (_keys!5232 array!6501) (_values!3390 array!6503) (_vacant!1014 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1930)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165649 (= res!78617 (validMask!0 (mask!8122 thiss!1248)))))

(declare-fun b!165650 () Bool)

(declare-fun res!78621 () Bool)

(assert (=> b!165650 (=> (not res!78621) (not e!108650))))

(assert (=> b!165650 (= res!78621 (and (= (size!3375 (_values!3390 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8122 thiss!1248))) (= (size!3374 (_keys!5232 thiss!1248)) (size!3375 (_values!3390 thiss!1248))) (bvsge (mask!8122 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3148 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3148 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165651 () Bool)

(declare-fun e!108655 () Bool)

(assert (=> b!165651 (= e!108655 e!108650)))

(declare-fun res!78615 () Bool)

(assert (=> b!165651 (=> (not res!78615) (not e!108650))))

(declare-datatypes ((SeekEntryResult!436 0))(
  ( (MissingZero!436 (index!3912 (_ BitVec 32))) (Found!436 (index!3913 (_ BitVec 32))) (Intermediate!436 (undefined!1248 Bool) (index!3914 (_ BitVec 32)) (x!18352 (_ BitVec 32))) (Undefined!436) (MissingVacant!436 (index!3915 (_ BitVec 32))) )
))
(declare-fun lt!83160 () SeekEntryResult!436)

(get-info :version)

(assert (=> b!165651 (= res!78615 (and (not ((_ is Undefined!436) lt!83160)) (not ((_ is MissingVacant!436) lt!83160)) (not ((_ is MissingZero!436) lt!83160)) ((_ is Found!436) lt!83160)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6501 (_ BitVec 32)) SeekEntryResult!436)

(assert (=> b!165651 (= lt!83160 (seekEntryOrOpen!0 key!828 (_keys!5232 thiss!1248) (mask!8122 thiss!1248)))))

(declare-fun mapIsEmpty!6282 () Bool)

(declare-fun mapRes!6282 () Bool)

(assert (=> mapIsEmpty!6282 mapRes!6282))

(declare-fun b!165653 () Bool)

(declare-fun e!108656 () Bool)

(declare-fun tp_is_empty!3709 () Bool)

(assert (=> b!165653 (= e!108656 tp_is_empty!3709)))

(declare-fun b!165654 () Bool)

(assert (=> b!165654 (= e!108650 false)))

(declare-fun lt!83159 () Bool)

(declare-datatypes ((List!2046 0))(
  ( (Nil!2043) (Cons!2042 (h!2659 (_ BitVec 64)) (t!6840 List!2046)) )
))
(declare-fun arrayNoDuplicates!0 (array!6501 (_ BitVec 32) List!2046) Bool)

(assert (=> b!165654 (= lt!83159 (arrayNoDuplicates!0 (_keys!5232 thiss!1248) #b00000000000000000000000000000000 Nil!2043))))

(declare-fun res!78620 () Bool)

(assert (=> start!16606 (=> (not res!78620) (not e!108655))))

(declare-fun valid!868 (LongMapFixedSize!1930) Bool)

(assert (=> start!16606 (= res!78620 (valid!868 thiss!1248))))

(assert (=> start!16606 e!108655))

(declare-fun e!108652 () Bool)

(assert (=> start!16606 e!108652))

(assert (=> start!16606 true))

(declare-fun b!165652 () Bool)

(declare-fun res!78616 () Bool)

(assert (=> b!165652 (=> (not res!78616) (not e!108655))))

(assert (=> b!165652 (= res!78616 (not (= key!828 (bvneg key!828))))))

(declare-fun e!108651 () Bool)

(declare-fun array_inv!1983 (array!6501) Bool)

(declare-fun array_inv!1984 (array!6503) Bool)

(assert (=> b!165655 (= e!108652 (and tp!14322 tp_is_empty!3709 (array_inv!1983 (_keys!5232 thiss!1248)) (array_inv!1984 (_values!3390 thiss!1248)) e!108651))))

(declare-fun b!165656 () Bool)

(declare-fun e!108653 () Bool)

(assert (=> b!165656 (= e!108653 tp_is_empty!3709)))

(declare-fun b!165657 () Bool)

(declare-fun res!78618 () Bool)

(assert (=> b!165657 (=> (not res!78618) (not e!108650))))

(declare-datatypes ((tuple2!3026 0))(
  ( (tuple2!3027 (_1!1524 (_ BitVec 64)) (_2!1524 V!4593)) )
))
(declare-datatypes ((List!2047 0))(
  ( (Nil!2044) (Cons!2043 (h!2660 tuple2!3026) (t!6841 List!2047)) )
))
(declare-datatypes ((ListLongMap!1987 0))(
  ( (ListLongMap!1988 (toList!1009 List!2047)) )
))
(declare-fun contains!1061 (ListLongMap!1987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!671 (array!6501 array!6503 (_ BitVec 32) (_ BitVec 32) V!4593 V!4593 (_ BitVec 32) Int) ListLongMap!1987)

(assert (=> b!165657 (= res!78618 (not (contains!1061 (getCurrentListMap!671 (_keys!5232 thiss!1248) (_values!3390 thiss!1248) (mask!8122 thiss!1248) (extraKeys!3148 thiss!1248) (zeroValue!3250 thiss!1248) (minValue!3250 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3407 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!6282 () Bool)

(declare-fun tp!14321 () Bool)

(assert (=> mapNonEmpty!6282 (= mapRes!6282 (and tp!14321 e!108656))))

(declare-fun mapValue!6282 () ValueCell!1511)

(declare-fun mapKey!6282 () (_ BitVec 32))

(declare-fun mapRest!6282 () (Array (_ BitVec 32) ValueCell!1511))

(assert (=> mapNonEmpty!6282 (= (arr!3087 (_values!3390 thiss!1248)) (store mapRest!6282 mapKey!6282 mapValue!6282))))

(declare-fun b!165658 () Bool)

(assert (=> b!165658 (= e!108651 (and e!108653 mapRes!6282))))

(declare-fun condMapEmpty!6282 () Bool)

(declare-fun mapDefault!6282 () ValueCell!1511)

(assert (=> b!165658 (= condMapEmpty!6282 (= (arr!3087 (_values!3390 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1511)) mapDefault!6282)))))

(declare-fun b!165659 () Bool)

(declare-fun res!78619 () Bool)

(assert (=> b!165659 (=> (not res!78619) (not e!108650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6501 (_ BitVec 32)) Bool)

(assert (=> b!165659 (= res!78619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5232 thiss!1248) (mask!8122 thiss!1248)))))

(assert (= (and start!16606 res!78620) b!165652))

(assert (= (and b!165652 res!78616) b!165651))

(assert (= (and b!165651 res!78615) b!165657))

(assert (= (and b!165657 res!78618) b!165649))

(assert (= (and b!165649 res!78617) b!165650))

(assert (= (and b!165650 res!78621) b!165659))

(assert (= (and b!165659 res!78619) b!165654))

(assert (= (and b!165658 condMapEmpty!6282) mapIsEmpty!6282))

(assert (= (and b!165658 (not condMapEmpty!6282)) mapNonEmpty!6282))

(assert (= (and mapNonEmpty!6282 ((_ is ValueCellFull!1511) mapValue!6282)) b!165653))

(assert (= (and b!165658 ((_ is ValueCellFull!1511) mapDefault!6282)) b!165656))

(assert (= b!165655 b!165658))

(assert (= start!16606 b!165655))

(declare-fun m!195533 () Bool)

(assert (=> b!165651 m!195533))

(declare-fun m!195535 () Bool)

(assert (=> mapNonEmpty!6282 m!195535))

(declare-fun m!195537 () Bool)

(assert (=> b!165654 m!195537))

(declare-fun m!195539 () Bool)

(assert (=> b!165659 m!195539))

(declare-fun m!195541 () Bool)

(assert (=> start!16606 m!195541))

(declare-fun m!195543 () Bool)

(assert (=> b!165657 m!195543))

(assert (=> b!165657 m!195543))

(declare-fun m!195545 () Bool)

(assert (=> b!165657 m!195545))

(declare-fun m!195547 () Bool)

(assert (=> b!165655 m!195547))

(declare-fun m!195549 () Bool)

(assert (=> b!165655 m!195549))

(declare-fun m!195551 () Bool)

(assert (=> b!165649 m!195551))

(check-sat (not b!165649) tp_is_empty!3709 (not b!165651) (not b!165657) (not b_next!3907) (not b!165655) (not mapNonEmpty!6282) (not b!165659) (not start!16606) b_and!10335 (not b!165654))
(check-sat b_and!10335 (not b_next!3907))
