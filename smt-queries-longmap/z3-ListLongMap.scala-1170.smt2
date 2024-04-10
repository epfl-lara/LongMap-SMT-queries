; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25124 () Bool)

(assert start!25124)

(declare-fun b!261665 () Bool)

(declare-fun b_free!6771 () Bool)

(declare-fun b_next!6771 () Bool)

(assert (=> b!261665 (= b_free!6771 (not b_next!6771))))

(declare-fun tp!23644 () Bool)

(declare-fun b_and!13905 () Bool)

(assert (=> b!261665 (= tp!23644 b_and!13905)))

(declare-fun b!261664 () Bool)

(declare-fun e!169552 () Bool)

(declare-fun call!24986 () Bool)

(assert (=> b!261664 (= e!169552 (not call!24986))))

(declare-fun e!169555 () Bool)

(declare-fun e!169562 () Bool)

(declare-fun tp_is_empty!6633 () Bool)

(declare-datatypes ((V!8491 0))(
  ( (V!8492 (val!3361 Int)) )
))
(declare-datatypes ((ValueCell!2973 0))(
  ( (ValueCellFull!2973 (v!5486 V!8491)) (EmptyCell!2973) )
))
(declare-datatypes ((array!12623 0))(
  ( (array!12624 (arr!5974 (Array (_ BitVec 32) ValueCell!2973)) (size!6325 (_ BitVec 32))) )
))
(declare-datatypes ((array!12625 0))(
  ( (array!12626 (arr!5975 (Array (_ BitVec 32) (_ BitVec 64))) (size!6326 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3846 0))(
  ( (LongMapFixedSize!3847 (defaultEntry!4821 Int) (mask!11169 (_ BitVec 32)) (extraKeys!4558 (_ BitVec 32)) (zeroValue!4662 V!8491) (minValue!4662 V!8491) (_size!1972 (_ BitVec 32)) (_keys!7009 array!12625) (_values!4804 array!12623) (_vacant!1972 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3846)

(declare-fun array_inv!3947 (array!12625) Bool)

(declare-fun array_inv!3948 (array!12623) Bool)

(assert (=> b!261665 (= e!169562 (and tp!23644 tp_is_empty!6633 (array_inv!3947 (_keys!7009 thiss!1504)) (array_inv!3948 (_values!4804 thiss!1504)) e!169555))))

(declare-datatypes ((SeekEntryResult!1188 0))(
  ( (MissingZero!1188 (index!6922 (_ BitVec 32))) (Found!1188 (index!6923 (_ BitVec 32))) (Intermediate!1188 (undefined!2000 Bool) (index!6924 (_ BitVec 32)) (x!25178 (_ BitVec 32))) (Undefined!1188) (MissingVacant!1188 (index!6925 (_ BitVec 32))) )
))
(declare-fun lt!132143 () SeekEntryResult!1188)

(declare-fun bm!24982 () Bool)

(declare-fun c!44562 () Bool)

(declare-fun call!24985 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24982 (= call!24985 (inRange!0 (ite c!44562 (index!6922 lt!132143) (index!6925 lt!132143)) (mask!11169 thiss!1504)))))

(declare-fun b!261666 () Bool)

(declare-fun e!169563 () Bool)

(assert (=> b!261666 (= e!169563 (not call!24986))))

(declare-fun b!261667 () Bool)

(declare-fun res!127844 () Bool)

(declare-fun e!169551 () Bool)

(assert (=> b!261667 (=> (not res!127844) (not e!169551))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!261667 (= res!127844 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!11308 () Bool)

(declare-fun mapRes!11308 () Bool)

(declare-fun tp!23643 () Bool)

(declare-fun e!169561 () Bool)

(assert (=> mapNonEmpty!11308 (= mapRes!11308 (and tp!23643 e!169561))))

(declare-fun mapKey!11308 () (_ BitVec 32))

(declare-fun mapValue!11308 () ValueCell!2973)

(declare-fun mapRest!11308 () (Array (_ BitVec 32) ValueCell!2973))

(assert (=> mapNonEmpty!11308 (= (arr!5974 (_values!4804 thiss!1504)) (store mapRest!11308 mapKey!11308 mapValue!11308))))

(declare-fun b!261668 () Bool)

(declare-fun e!169556 () Bool)

(assert (=> b!261668 (= e!169556 e!169552)))

(declare-fun res!127845 () Bool)

(assert (=> b!261668 (= res!127845 call!24985)))

(assert (=> b!261668 (=> (not res!127845) (not e!169552))))

(declare-fun b!261669 () Bool)

(declare-fun e!169553 () Bool)

(assert (=> b!261669 (= e!169555 (and e!169553 mapRes!11308))))

(declare-fun condMapEmpty!11308 () Bool)

(declare-fun mapDefault!11308 () ValueCell!2973)

(assert (=> b!261669 (= condMapEmpty!11308 (= (arr!5974 (_values!4804 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2973)) mapDefault!11308)))))

(declare-fun bm!24983 () Bool)

(declare-fun arrayContainsKey!0 (array!12625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24983 (= call!24986 (arrayContainsKey!0 (_keys!7009 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261670 () Bool)

(declare-fun e!169559 () Bool)

(assert (=> b!261670 (= e!169551 e!169559)))

(declare-fun res!127849 () Bool)

(assert (=> b!261670 (=> (not res!127849) (not e!169559))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!261670 (= res!127849 (or (= lt!132143 (MissingZero!1188 index!297)) (= lt!132143 (MissingVacant!1188 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12625 (_ BitVec 32)) SeekEntryResult!1188)

(assert (=> b!261670 (= lt!132143 (seekEntryOrOpen!0 key!932 (_keys!7009 thiss!1504) (mask!11169 thiss!1504)))))

(declare-fun b!261671 () Bool)

(assert (=> b!261671 (= e!169561 tp_is_empty!6633)))

(declare-fun b!261672 () Bool)

(declare-datatypes ((Unit!8134 0))(
  ( (Unit!8135) )
))
(declare-fun e!169560 () Unit!8134)

(declare-fun Unit!8136 () Unit!8134)

(assert (=> b!261672 (= e!169560 Unit!8136)))

(declare-fun lt!132137 () Unit!8134)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!446 (array!12625 array!12623 (_ BitVec 32) (_ BitVec 32) V!8491 V!8491 (_ BitVec 64) Int) Unit!8134)

(assert (=> b!261672 (= lt!132137 (lemmaInListMapThenSeekEntryOrOpenFindsIt!446 (_keys!7009 thiss!1504) (_values!4804 thiss!1504) (mask!11169 thiss!1504) (extraKeys!4558 thiss!1504) (zeroValue!4662 thiss!1504) (minValue!4662 thiss!1504) key!932 (defaultEntry!4821 thiss!1504)))))

(assert (=> b!261672 false))

(declare-fun b!261673 () Bool)

(declare-fun lt!132144 () Unit!8134)

(assert (=> b!261673 (= e!169560 lt!132144)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!448 (array!12625 array!12623 (_ BitVec 32) (_ BitVec 32) V!8491 V!8491 (_ BitVec 64) Int) Unit!8134)

(assert (=> b!261673 (= lt!132144 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!448 (_keys!7009 thiss!1504) (_values!4804 thiss!1504) (mask!11169 thiss!1504) (extraKeys!4558 thiss!1504) (zeroValue!4662 thiss!1504) (minValue!4662 thiss!1504) key!932 (defaultEntry!4821 thiss!1504)))))

(get-info :version)

(assert (=> b!261673 (= c!44562 ((_ is MissingZero!1188) lt!132143))))

(declare-fun e!169554 () Bool)

(assert (=> b!261673 e!169554))

(declare-fun b!261675 () Bool)

(declare-fun e!169557 () Bool)

(assert (=> b!261675 (= e!169557 (not true))))

(declare-fun lt!132140 () array!12625)

(declare-fun arrayCountValidKeys!0 (array!12625 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261675 (= (arrayCountValidKeys!0 lt!132140 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132134 () Unit!8134)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12625 (_ BitVec 32)) Unit!8134)

(assert (=> b!261675 (= lt!132134 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132140 index!297))))

(assert (=> b!261675 (arrayContainsKey!0 lt!132140 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132132 () Unit!8134)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12625 (_ BitVec 64) (_ BitVec 32)) Unit!8134)

(assert (=> b!261675 (= lt!132132 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132140 key!932 index!297))))

(declare-datatypes ((tuple2!4958 0))(
  ( (tuple2!4959 (_1!2490 (_ BitVec 64)) (_2!2490 V!8491)) )
))
(declare-datatypes ((List!3834 0))(
  ( (Nil!3831) (Cons!3830 (h!4496 tuple2!4958) (t!8907 List!3834)) )
))
(declare-datatypes ((ListLongMap!3871 0))(
  ( (ListLongMap!3872 (toList!1951 List!3834)) )
))
(declare-fun lt!132141 () ListLongMap!3871)

(declare-fun v!346 () V!8491)

(declare-fun +!702 (ListLongMap!3871 tuple2!4958) ListLongMap!3871)

(declare-fun getCurrentListMap!1479 (array!12625 array!12623 (_ BitVec 32) (_ BitVec 32) V!8491 V!8491 (_ BitVec 32) Int) ListLongMap!3871)

(assert (=> b!261675 (= (+!702 lt!132141 (tuple2!4959 key!932 v!346)) (getCurrentListMap!1479 lt!132140 (array!12624 (store (arr!5974 (_values!4804 thiss!1504)) index!297 (ValueCellFull!2973 v!346)) (size!6325 (_values!4804 thiss!1504))) (mask!11169 thiss!1504) (extraKeys!4558 thiss!1504) (zeroValue!4662 thiss!1504) (minValue!4662 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4821 thiss!1504)))))

(declare-fun lt!132131 () Unit!8134)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!112 (array!12625 array!12623 (_ BitVec 32) (_ BitVec 32) V!8491 V!8491 (_ BitVec 32) (_ BitVec 64) V!8491 Int) Unit!8134)

(assert (=> b!261675 (= lt!132131 (lemmaAddValidKeyToArrayThenAddPairToListMap!112 (_keys!7009 thiss!1504) (_values!4804 thiss!1504) (mask!11169 thiss!1504) (extraKeys!4558 thiss!1504) (zeroValue!4662 thiss!1504) (minValue!4662 thiss!1504) index!297 key!932 v!346 (defaultEntry!4821 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12625 (_ BitVec 32)) Bool)

(assert (=> b!261675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132140 (mask!11169 thiss!1504))))

(declare-fun lt!132139 () Unit!8134)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12625 (_ BitVec 32) (_ BitVec 32)) Unit!8134)

(assert (=> b!261675 (= lt!132139 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7009 thiss!1504) index!297 (mask!11169 thiss!1504)))))

(assert (=> b!261675 (= (arrayCountValidKeys!0 lt!132140 #b00000000000000000000000000000000 (size!6326 (_keys!7009 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7009 thiss!1504) #b00000000000000000000000000000000 (size!6326 (_keys!7009 thiss!1504)))))))

(declare-fun lt!132138 () Unit!8134)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12625 (_ BitVec 32) (_ BitVec 64)) Unit!8134)

(assert (=> b!261675 (= lt!132138 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7009 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3835 0))(
  ( (Nil!3832) (Cons!3831 (h!4497 (_ BitVec 64)) (t!8908 List!3835)) )
))
(declare-fun arrayNoDuplicates!0 (array!12625 (_ BitVec 32) List!3835) Bool)

(assert (=> b!261675 (arrayNoDuplicates!0 lt!132140 #b00000000000000000000000000000000 Nil!3832)))

(assert (=> b!261675 (= lt!132140 (array!12626 (store (arr!5975 (_keys!7009 thiss!1504)) index!297 key!932) (size!6326 (_keys!7009 thiss!1504))))))

(declare-fun lt!132135 () Unit!8134)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3835) Unit!8134)

(assert (=> b!261675 (= lt!132135 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7009 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3832))))

(declare-fun lt!132142 () Unit!8134)

(declare-fun e!169550 () Unit!8134)

(assert (=> b!261675 (= lt!132142 e!169550)))

(declare-fun c!44564 () Bool)

(assert (=> b!261675 (= c!44564 (arrayContainsKey!0 (_keys!7009 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261676 () Bool)

(assert (=> b!261676 (= e!169553 tp_is_empty!6633)))

(declare-fun b!261677 () Bool)

(declare-fun res!127847 () Bool)

(assert (=> b!261677 (=> (not res!127847) (not e!169563))))

(assert (=> b!261677 (= res!127847 call!24985)))

(assert (=> b!261677 (= e!169554 e!169563)))

(declare-fun b!261678 () Bool)

(declare-fun Unit!8137 () Unit!8134)

(assert (=> b!261678 (= e!169550 Unit!8137)))

(declare-fun lt!132133 () Unit!8134)

(declare-fun lemmaArrayContainsKeyThenInListMap!254 (array!12625 array!12623 (_ BitVec 32) (_ BitVec 32) V!8491 V!8491 (_ BitVec 64) (_ BitVec 32) Int) Unit!8134)

(assert (=> b!261678 (= lt!132133 (lemmaArrayContainsKeyThenInListMap!254 (_keys!7009 thiss!1504) (_values!4804 thiss!1504) (mask!11169 thiss!1504) (extraKeys!4558 thiss!1504) (zeroValue!4662 thiss!1504) (minValue!4662 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4821 thiss!1504)))))

(assert (=> b!261678 false))

(declare-fun b!261679 () Bool)

(assert (=> b!261679 (= e!169556 ((_ is Undefined!1188) lt!132143))))

(declare-fun b!261680 () Bool)

(assert (=> b!261680 (= e!169559 e!169557)))

(declare-fun res!127842 () Bool)

(assert (=> b!261680 (=> (not res!127842) (not e!169557))))

(assert (=> b!261680 (= res!127842 (inRange!0 index!297 (mask!11169 thiss!1504)))))

(declare-fun lt!132136 () Unit!8134)

(assert (=> b!261680 (= lt!132136 e!169560)))

(declare-fun c!44561 () Bool)

(declare-fun contains!1899 (ListLongMap!3871 (_ BitVec 64)) Bool)

(assert (=> b!261680 (= c!44561 (contains!1899 lt!132141 key!932))))

(assert (=> b!261680 (= lt!132141 (getCurrentListMap!1479 (_keys!7009 thiss!1504) (_values!4804 thiss!1504) (mask!11169 thiss!1504) (extraKeys!4558 thiss!1504) (zeroValue!4662 thiss!1504) (minValue!4662 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4821 thiss!1504)))))

(declare-fun b!261681 () Bool)

(declare-fun Unit!8138 () Unit!8134)

(assert (=> b!261681 (= e!169550 Unit!8138)))

(declare-fun b!261682 () Bool)

(declare-fun res!127846 () Bool)

(assert (=> b!261682 (=> (not res!127846) (not e!169563))))

(assert (=> b!261682 (= res!127846 (= (select (arr!5975 (_keys!7009 thiss!1504)) (index!6922 lt!132143)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261683 () Bool)

(declare-fun res!127843 () Bool)

(assert (=> b!261683 (= res!127843 (= (select (arr!5975 (_keys!7009 thiss!1504)) (index!6925 lt!132143)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!261683 (=> (not res!127843) (not e!169552))))

(declare-fun mapIsEmpty!11308 () Bool)

(assert (=> mapIsEmpty!11308 mapRes!11308))

(declare-fun b!261674 () Bool)

(declare-fun c!44563 () Bool)

(assert (=> b!261674 (= c!44563 ((_ is MissingVacant!1188) lt!132143))))

(assert (=> b!261674 (= e!169554 e!169556)))

(declare-fun res!127848 () Bool)

(assert (=> start!25124 (=> (not res!127848) (not e!169551))))

(declare-fun valid!1500 (LongMapFixedSize!3846) Bool)

(assert (=> start!25124 (= res!127848 (valid!1500 thiss!1504))))

(assert (=> start!25124 e!169551))

(assert (=> start!25124 e!169562))

(assert (=> start!25124 true))

(assert (=> start!25124 tp_is_empty!6633))

(assert (= (and start!25124 res!127848) b!261667))

(assert (= (and b!261667 res!127844) b!261670))

(assert (= (and b!261670 res!127849) b!261680))

(assert (= (and b!261680 c!44561) b!261672))

(assert (= (and b!261680 (not c!44561)) b!261673))

(assert (= (and b!261673 c!44562) b!261677))

(assert (= (and b!261673 (not c!44562)) b!261674))

(assert (= (and b!261677 res!127847) b!261682))

(assert (= (and b!261682 res!127846) b!261666))

(assert (= (and b!261674 c!44563) b!261668))

(assert (= (and b!261674 (not c!44563)) b!261679))

(assert (= (and b!261668 res!127845) b!261683))

(assert (= (and b!261683 res!127843) b!261664))

(assert (= (or b!261677 b!261668) bm!24982))

(assert (= (or b!261666 b!261664) bm!24983))

(assert (= (and b!261680 res!127842) b!261675))

(assert (= (and b!261675 c!44564) b!261678))

(assert (= (and b!261675 (not c!44564)) b!261681))

(assert (= (and b!261669 condMapEmpty!11308) mapIsEmpty!11308))

(assert (= (and b!261669 (not condMapEmpty!11308)) mapNonEmpty!11308))

(assert (= (and mapNonEmpty!11308 ((_ is ValueCellFull!2973) mapValue!11308)) b!261671))

(assert (= (and b!261669 ((_ is ValueCellFull!2973) mapDefault!11308)) b!261676))

(assert (= b!261665 b!261669))

(assert (= start!25124 b!261665))

(declare-fun m!277747 () Bool)

(assert (=> b!261675 m!277747))

(declare-fun m!277749 () Bool)

(assert (=> b!261675 m!277749))

(declare-fun m!277751 () Bool)

(assert (=> b!261675 m!277751))

(declare-fun m!277753 () Bool)

(assert (=> b!261675 m!277753))

(declare-fun m!277755 () Bool)

(assert (=> b!261675 m!277755))

(declare-fun m!277757 () Bool)

(assert (=> b!261675 m!277757))

(declare-fun m!277759 () Bool)

(assert (=> b!261675 m!277759))

(declare-fun m!277761 () Bool)

(assert (=> b!261675 m!277761))

(declare-fun m!277763 () Bool)

(assert (=> b!261675 m!277763))

(declare-fun m!277765 () Bool)

(assert (=> b!261675 m!277765))

(declare-fun m!277767 () Bool)

(assert (=> b!261675 m!277767))

(declare-fun m!277769 () Bool)

(assert (=> b!261675 m!277769))

(declare-fun m!277771 () Bool)

(assert (=> b!261675 m!277771))

(declare-fun m!277773 () Bool)

(assert (=> b!261675 m!277773))

(declare-fun m!277775 () Bool)

(assert (=> b!261675 m!277775))

(declare-fun m!277777 () Bool)

(assert (=> b!261675 m!277777))

(declare-fun m!277779 () Bool)

(assert (=> b!261675 m!277779))

(declare-fun m!277781 () Bool)

(assert (=> start!25124 m!277781))

(declare-fun m!277783 () Bool)

(assert (=> mapNonEmpty!11308 m!277783))

(declare-fun m!277785 () Bool)

(assert (=> b!261672 m!277785))

(declare-fun m!277787 () Bool)

(assert (=> b!261678 m!277787))

(declare-fun m!277789 () Bool)

(assert (=> b!261665 m!277789))

(declare-fun m!277791 () Bool)

(assert (=> b!261665 m!277791))

(declare-fun m!277793 () Bool)

(assert (=> b!261682 m!277793))

(declare-fun m!277795 () Bool)

(assert (=> b!261680 m!277795))

(declare-fun m!277797 () Bool)

(assert (=> b!261680 m!277797))

(declare-fun m!277799 () Bool)

(assert (=> b!261680 m!277799))

(declare-fun m!277801 () Bool)

(assert (=> b!261670 m!277801))

(declare-fun m!277803 () Bool)

(assert (=> bm!24982 m!277803))

(assert (=> bm!24983 m!277765))

(declare-fun m!277805 () Bool)

(assert (=> b!261683 m!277805))

(declare-fun m!277807 () Bool)

(assert (=> b!261673 m!277807))

(check-sat (not b!261665) (not b_next!6771) (not b!261680) (not start!25124) (not b!261672) (not b!261675) (not bm!24982) (not mapNonEmpty!11308) (not b!261670) (not b!261673) tp_is_empty!6633 (not bm!24983) b_and!13905 (not b!261678))
(check-sat b_and!13905 (not b_next!6771))
