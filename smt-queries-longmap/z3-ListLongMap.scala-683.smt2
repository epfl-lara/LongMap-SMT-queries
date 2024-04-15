; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16606 () Bool)

(assert start!16606)

(declare-fun b!165465 () Bool)

(declare-fun b_free!3907 () Bool)

(declare-fun b_next!3907 () Bool)

(assert (=> b!165465 (= b_free!3907 (not b_next!3907))))

(declare-fun tp!14322 () Bool)

(declare-fun b_and!10295 () Bool)

(assert (=> b!165465 (= tp!14322 b_and!10295)))

(declare-fun b!165455 () Bool)

(declare-fun e!108526 () Bool)

(assert (=> b!165455 (= e!108526 false)))

(declare-fun lt!82919 () Bool)

(declare-datatypes ((V!4593 0))(
  ( (V!4594 (val!1899 Int)) )
))
(declare-datatypes ((ValueCell!1511 0))(
  ( (ValueCellFull!1511 (v!3758 V!4593)) (EmptyCell!1511) )
))
(declare-datatypes ((array!6495 0))(
  ( (array!6496 (arr!3082 (Array (_ BitVec 32) (_ BitVec 64))) (size!3371 (_ BitVec 32))) )
))
(declare-datatypes ((array!6497 0))(
  ( (array!6498 (arr!3083 (Array (_ BitVec 32) ValueCell!1511)) (size!3372 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1930 0))(
  ( (LongMapFixedSize!1931 (defaultEntry!3407 Int) (mask!8121 (_ BitVec 32)) (extraKeys!3148 (_ BitVec 32)) (zeroValue!3250 V!4593) (minValue!3250 V!4593) (_size!1014 (_ BitVec 32)) (_keys!5231 array!6495) (_values!3390 array!6497) (_vacant!1014 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1930)

(declare-datatypes ((List!2061 0))(
  ( (Nil!2058) (Cons!2057 (h!2674 (_ BitVec 64)) (t!6854 List!2061)) )
))
(declare-fun arrayNoDuplicates!0 (array!6495 (_ BitVec 32) List!2061) Bool)

(assert (=> b!165455 (= lt!82919 (arrayNoDuplicates!0 (_keys!5231 thiss!1248) #b00000000000000000000000000000000 Nil!2058))))

(declare-fun b!165456 () Bool)

(declare-fun res!78505 () Bool)

(assert (=> b!165456 (=> (not res!78505) (not e!108526))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3060 0))(
  ( (tuple2!3061 (_1!1541 (_ BitVec 64)) (_2!1541 V!4593)) )
))
(declare-datatypes ((List!2062 0))(
  ( (Nil!2059) (Cons!2058 (h!2675 tuple2!3060) (t!6855 List!2062)) )
))
(declare-datatypes ((ListLongMap!2003 0))(
  ( (ListLongMap!2004 (toList!1017 List!2062)) )
))
(declare-fun contains!1062 (ListLongMap!2003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!659 (array!6495 array!6497 (_ BitVec 32) (_ BitVec 32) V!4593 V!4593 (_ BitVec 32) Int) ListLongMap!2003)

(assert (=> b!165456 (= res!78505 (not (contains!1062 (getCurrentListMap!659 (_keys!5231 thiss!1248) (_values!3390 thiss!1248) (mask!8121 thiss!1248) (extraKeys!3148 thiss!1248) (zeroValue!3250 thiss!1248) (minValue!3250 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3407 thiss!1248)) key!828)))))

(declare-fun b!165457 () Bool)

(declare-fun res!78500 () Bool)

(declare-fun e!108530 () Bool)

(assert (=> b!165457 (=> (not res!78500) (not e!108530))))

(assert (=> b!165457 (= res!78500 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6282 () Bool)

(declare-fun mapRes!6282 () Bool)

(declare-fun tp!14321 () Bool)

(declare-fun e!108529 () Bool)

(assert (=> mapNonEmpty!6282 (= mapRes!6282 (and tp!14321 e!108529))))

(declare-fun mapKey!6282 () (_ BitVec 32))

(declare-fun mapRest!6282 () (Array (_ BitVec 32) ValueCell!1511))

(declare-fun mapValue!6282 () ValueCell!1511)

(assert (=> mapNonEmpty!6282 (= (arr!3083 (_values!3390 thiss!1248)) (store mapRest!6282 mapKey!6282 mapValue!6282))))

(declare-fun b!165459 () Bool)

(declare-fun res!78504 () Bool)

(assert (=> b!165459 (=> (not res!78504) (not e!108526))))

(assert (=> b!165459 (= res!78504 (and (= (size!3372 (_values!3390 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8121 thiss!1248))) (= (size!3371 (_keys!5231 thiss!1248)) (size!3372 (_values!3390 thiss!1248))) (bvsge (mask!8121 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3148 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3148 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!165460 () Bool)

(declare-fun tp_is_empty!3709 () Bool)

(assert (=> b!165460 (= e!108529 tp_is_empty!3709)))

(declare-fun b!165461 () Bool)

(declare-fun e!108528 () Bool)

(assert (=> b!165461 (= e!108528 tp_is_empty!3709)))

(declare-fun mapIsEmpty!6282 () Bool)

(assert (=> mapIsEmpty!6282 mapRes!6282))

(declare-fun res!78499 () Bool)

(assert (=> start!16606 (=> (not res!78499) (not e!108530))))

(declare-fun valid!858 (LongMapFixedSize!1930) Bool)

(assert (=> start!16606 (= res!78499 (valid!858 thiss!1248))))

(assert (=> start!16606 e!108530))

(declare-fun e!108525 () Bool)

(assert (=> start!16606 e!108525))

(assert (=> start!16606 true))

(declare-fun b!165458 () Bool)

(assert (=> b!165458 (= e!108530 e!108526)))

(declare-fun res!78501 () Bool)

(assert (=> b!165458 (=> (not res!78501) (not e!108526))))

(declare-datatypes ((SeekEntryResult!449 0))(
  ( (MissingZero!449 (index!3964 (_ BitVec 32))) (Found!449 (index!3965 (_ BitVec 32))) (Intermediate!449 (undefined!1261 Bool) (index!3966 (_ BitVec 32)) (x!18364 (_ BitVec 32))) (Undefined!449) (MissingVacant!449 (index!3967 (_ BitVec 32))) )
))
(declare-fun lt!82920 () SeekEntryResult!449)

(get-info :version)

(assert (=> b!165458 (= res!78501 (and (not ((_ is Undefined!449) lt!82920)) (not ((_ is MissingVacant!449) lt!82920)) (not ((_ is MissingZero!449) lt!82920)) ((_ is Found!449) lt!82920)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6495 (_ BitVec 32)) SeekEntryResult!449)

(assert (=> b!165458 (= lt!82920 (seekEntryOrOpen!0 key!828 (_keys!5231 thiss!1248) (mask!8121 thiss!1248)))))

(declare-fun b!165462 () Bool)

(declare-fun e!108531 () Bool)

(assert (=> b!165462 (= e!108531 (and e!108528 mapRes!6282))))

(declare-fun condMapEmpty!6282 () Bool)

(declare-fun mapDefault!6282 () ValueCell!1511)

(assert (=> b!165462 (= condMapEmpty!6282 (= (arr!3083 (_values!3390 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1511)) mapDefault!6282)))))

(declare-fun b!165463 () Bool)

(declare-fun res!78502 () Bool)

(assert (=> b!165463 (=> (not res!78502) (not e!108526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6495 (_ BitVec 32)) Bool)

(assert (=> b!165463 (= res!78502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5231 thiss!1248) (mask!8121 thiss!1248)))))

(declare-fun b!165464 () Bool)

(declare-fun res!78503 () Bool)

(assert (=> b!165464 (=> (not res!78503) (not e!108526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165464 (= res!78503 (validMask!0 (mask!8121 thiss!1248)))))

(declare-fun array_inv!1981 (array!6495) Bool)

(declare-fun array_inv!1982 (array!6497) Bool)

(assert (=> b!165465 (= e!108525 (and tp!14322 tp_is_empty!3709 (array_inv!1981 (_keys!5231 thiss!1248)) (array_inv!1982 (_values!3390 thiss!1248)) e!108531))))

(assert (= (and start!16606 res!78499) b!165457))

(assert (= (and b!165457 res!78500) b!165458))

(assert (= (and b!165458 res!78501) b!165456))

(assert (= (and b!165456 res!78505) b!165464))

(assert (= (and b!165464 res!78503) b!165459))

(assert (= (and b!165459 res!78504) b!165463))

(assert (= (and b!165463 res!78502) b!165455))

(assert (= (and b!165462 condMapEmpty!6282) mapIsEmpty!6282))

(assert (= (and b!165462 (not condMapEmpty!6282)) mapNonEmpty!6282))

(assert (= (and mapNonEmpty!6282 ((_ is ValueCellFull!1511) mapValue!6282)) b!165460))

(assert (= (and b!165462 ((_ is ValueCellFull!1511) mapDefault!6282)) b!165461))

(assert (= b!165465 b!165462))

(assert (= start!16606 b!165465))

(declare-fun m!194731 () Bool)

(assert (=> mapNonEmpty!6282 m!194731))

(declare-fun m!194733 () Bool)

(assert (=> b!165455 m!194733))

(declare-fun m!194735 () Bool)

(assert (=> b!165463 m!194735))

(declare-fun m!194737 () Bool)

(assert (=> b!165456 m!194737))

(assert (=> b!165456 m!194737))

(declare-fun m!194739 () Bool)

(assert (=> b!165456 m!194739))

(declare-fun m!194741 () Bool)

(assert (=> start!16606 m!194741))

(declare-fun m!194743 () Bool)

(assert (=> b!165464 m!194743))

(declare-fun m!194745 () Bool)

(assert (=> b!165458 m!194745))

(declare-fun m!194747 () Bool)

(assert (=> b!165465 m!194747))

(declare-fun m!194749 () Bool)

(assert (=> b!165465 m!194749))

(check-sat (not b!165463) (not b_next!3907) (not mapNonEmpty!6282) tp_is_empty!3709 (not b!165458) (not b!165464) (not start!16606) (not b!165455) (not b!165465) (not b!165456) b_and!10295)
(check-sat b_and!10295 (not b_next!3907))
