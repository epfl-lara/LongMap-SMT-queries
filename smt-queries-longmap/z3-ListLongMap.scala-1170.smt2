; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25126 () Bool)

(assert start!25126)

(declare-fun b!261659 () Bool)

(declare-fun b_free!6769 () Bool)

(declare-fun b_next!6769 () Bool)

(assert (=> b!261659 (= b_free!6769 (not b_next!6769))))

(declare-fun tp!23638 () Bool)

(declare-fun b_and!13917 () Bool)

(assert (=> b!261659 (= tp!23638 b_and!13917)))

(declare-fun b!261651 () Bool)

(declare-datatypes ((Unit!8111 0))(
  ( (Unit!8112) )
))
(declare-fun e!169544 () Unit!8111)

(declare-fun Unit!8113 () Unit!8111)

(assert (=> b!261651 (= e!169544 Unit!8113)))

(declare-fun lt!132148 () Unit!8111)

(declare-datatypes ((V!8489 0))(
  ( (V!8490 (val!3360 Int)) )
))
(declare-datatypes ((ValueCell!2972 0))(
  ( (ValueCellFull!2972 (v!5486 V!8489)) (EmptyCell!2972) )
))
(declare-datatypes ((array!12617 0))(
  ( (array!12618 (arr!5971 (Array (_ BitVec 32) ValueCell!2972)) (size!6322 (_ BitVec 32))) )
))
(declare-datatypes ((array!12619 0))(
  ( (array!12620 (arr!5972 (Array (_ BitVec 32) (_ BitVec 64))) (size!6323 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3844 0))(
  ( (LongMapFixedSize!3845 (defaultEntry!4820 Int) (mask!11168 (_ BitVec 32)) (extraKeys!4557 (_ BitVec 32)) (zeroValue!4661 V!8489) (minValue!4661 V!8489) (_size!1971 (_ BitVec 32)) (_keys!7008 array!12619) (_values!4803 array!12617) (_vacant!1971 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3844)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!261 (array!12619 array!12617 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 64) (_ BitVec 32) Int) Unit!8111)

(assert (=> b!261651 (= lt!132148 (lemmaArrayContainsKeyThenInListMap!261 (_keys!7008 thiss!1504) (_values!4803 thiss!1504) (mask!11168 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4820 thiss!1504)))))

(assert (=> b!261651 false))

(declare-fun b!261652 () Bool)

(declare-fun e!169533 () Bool)

(declare-fun e!169539 () Bool)

(declare-fun mapRes!11305 () Bool)

(assert (=> b!261652 (= e!169533 (and e!169539 mapRes!11305))))

(declare-fun condMapEmpty!11305 () Bool)

(declare-fun mapDefault!11305 () ValueCell!2972)

(assert (=> b!261652 (= condMapEmpty!11305 (= (arr!5971 (_values!4803 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2972)) mapDefault!11305)))))

(declare-fun b!261653 () Bool)

(declare-fun res!127840 () Bool)

(declare-fun e!169537 () Bool)

(assert (=> b!261653 (=> (not res!127840) (not e!169537))))

(declare-fun call!24967 () Bool)

(assert (=> b!261653 (= res!127840 call!24967)))

(declare-fun e!169541 () Bool)

(assert (=> b!261653 (= e!169541 e!169537)))

(declare-fun b!261654 () Bool)

(declare-fun e!169535 () Unit!8111)

(declare-fun Unit!8114 () Unit!8111)

(assert (=> b!261654 (= e!169535 Unit!8114)))

(declare-fun lt!132158 () Unit!8111)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!443 (array!12619 array!12617 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 64) Int) Unit!8111)

(assert (=> b!261654 (= lt!132158 (lemmaInListMapThenSeekEntryOrOpenFindsIt!443 (_keys!7008 thiss!1504) (_values!4803 thiss!1504) (mask!11168 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) key!932 (defaultEntry!4820 thiss!1504)))))

(assert (=> b!261654 false))

(declare-fun b!261655 () Bool)

(declare-fun e!169532 () Bool)

(declare-fun tp_is_empty!6631 () Bool)

(assert (=> b!261655 (= e!169532 tp_is_empty!6631)))

(declare-fun b!261656 () Bool)

(declare-fun Unit!8115 () Unit!8111)

(assert (=> b!261656 (= e!169544 Unit!8115)))

(declare-fun b!261657 () Bool)

(declare-fun res!127841 () Bool)

(declare-datatypes ((SeekEntryResult!1153 0))(
  ( (MissingZero!1153 (index!6782 (_ BitVec 32))) (Found!1153 (index!6783 (_ BitVec 32))) (Intermediate!1153 (undefined!1965 Bool) (index!6784 (_ BitVec 32)) (x!25143 (_ BitVec 32))) (Undefined!1153) (MissingVacant!1153 (index!6785 (_ BitVec 32))) )
))
(declare-fun lt!132150 () SeekEntryResult!1153)

(assert (=> b!261657 (= res!127841 (= (select (arr!5972 (_keys!7008 thiss!1504)) (index!6785 lt!132150)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169542 () Bool)

(assert (=> b!261657 (=> (not res!127841) (not e!169542))))

(declare-fun b!261658 () Bool)

(assert (=> b!261658 (= e!169539 tp_is_empty!6631)))

(declare-fun e!169540 () Bool)

(declare-fun array_inv!3933 (array!12619) Bool)

(declare-fun array_inv!3934 (array!12617) Bool)

(assert (=> b!261659 (= e!169540 (and tp!23638 tp_is_empty!6631 (array_inv!3933 (_keys!7008 thiss!1504)) (array_inv!3934 (_values!4803 thiss!1504)) e!169533))))

(declare-fun res!127846 () Bool)

(declare-fun e!169534 () Bool)

(assert (=> start!25126 (=> (not res!127846) (not e!169534))))

(declare-fun valid!1507 (LongMapFixedSize!3844) Bool)

(assert (=> start!25126 (= res!127846 (valid!1507 thiss!1504))))

(assert (=> start!25126 e!169534))

(assert (=> start!25126 e!169540))

(assert (=> start!25126 true))

(assert (=> start!25126 tp_is_empty!6631))

(declare-fun bm!24964 () Bool)

(declare-fun c!44565 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24964 (= call!24967 (inRange!0 (ite c!44565 (index!6782 lt!132150) (index!6785 lt!132150)) (mask!11168 thiss!1504)))))

(declare-fun mapIsEmpty!11305 () Bool)

(assert (=> mapIsEmpty!11305 mapRes!11305))

(declare-fun b!261660 () Bool)

(declare-fun c!44563 () Bool)

(get-info :version)

(assert (=> b!261660 (= c!44563 ((_ is MissingVacant!1153) lt!132150))))

(declare-fun e!169536 () Bool)

(assert (=> b!261660 (= e!169541 e!169536)))

(declare-fun mapNonEmpty!11305 () Bool)

(declare-fun tp!23637 () Bool)

(assert (=> mapNonEmpty!11305 (= mapRes!11305 (and tp!23637 e!169532))))

(declare-fun mapKey!11305 () (_ BitVec 32))

(declare-fun mapRest!11305 () (Array (_ BitVec 32) ValueCell!2972))

(declare-fun mapValue!11305 () ValueCell!2972)

(assert (=> mapNonEmpty!11305 (= (arr!5971 (_values!4803 thiss!1504)) (store mapRest!11305 mapKey!11305 mapValue!11305))))

(declare-fun b!261661 () Bool)

(declare-fun call!24968 () Bool)

(assert (=> b!261661 (= e!169542 (not call!24968))))

(declare-fun b!261662 () Bool)

(assert (=> b!261662 (= e!169536 e!169542)))

(declare-fun res!127842 () Bool)

(assert (=> b!261662 (= res!127842 call!24967)))

(assert (=> b!261662 (=> (not res!127842) (not e!169542))))

(declare-fun bm!24965 () Bool)

(declare-fun arrayContainsKey!0 (array!12619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24965 (= call!24968 (arrayContainsKey!0 (_keys!7008 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261663 () Bool)

(assert (=> b!261663 (= e!169537 (not call!24968))))

(declare-fun b!261664 () Bool)

(declare-fun e!169545 () Bool)

(assert (=> b!261664 (= e!169545 (not true))))

(declare-fun lt!132159 () array!12619)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!12619 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!261664 (= (arrayCountValidKeys!0 lt!132159 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!132156 () Unit!8111)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12619 (_ BitVec 32)) Unit!8111)

(assert (=> b!261664 (= lt!132156 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!132159 index!297))))

(assert (=> b!261664 (arrayContainsKey!0 lt!132159 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!132149 () Unit!8111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12619 (_ BitVec 64) (_ BitVec 32)) Unit!8111)

(assert (=> b!261664 (= lt!132149 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!132159 key!932 index!297))))

(declare-datatypes ((tuple2!4864 0))(
  ( (tuple2!4865 (_1!2443 (_ BitVec 64)) (_2!2443 V!8489)) )
))
(declare-datatypes ((List!3742 0))(
  ( (Nil!3739) (Cons!3738 (h!4404 tuple2!4864) (t!8807 List!3742)) )
))
(declare-datatypes ((ListLongMap!3779 0))(
  ( (ListLongMap!3780 (toList!1905 List!3742)) )
))
(declare-fun lt!132155 () ListLongMap!3779)

(declare-fun v!346 () V!8489)

(declare-fun +!702 (ListLongMap!3779 tuple2!4864) ListLongMap!3779)

(declare-fun getCurrentListMap!1437 (array!12619 array!12617 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 32) Int) ListLongMap!3779)

(assert (=> b!261664 (= (+!702 lt!132155 (tuple2!4865 key!932 v!346)) (getCurrentListMap!1437 lt!132159 (array!12618 (store (arr!5971 (_values!4803 thiss!1504)) index!297 (ValueCellFull!2972 v!346)) (size!6322 (_values!4803 thiss!1504))) (mask!11168 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4820 thiss!1504)))))

(declare-fun lt!132151 () Unit!8111)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!117 (array!12619 array!12617 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 32) (_ BitVec 64) V!8489 Int) Unit!8111)

(assert (=> b!261664 (= lt!132151 (lemmaAddValidKeyToArrayThenAddPairToListMap!117 (_keys!7008 thiss!1504) (_values!4803 thiss!1504) (mask!11168 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) index!297 key!932 v!346 (defaultEntry!4820 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12619 (_ BitVec 32)) Bool)

(assert (=> b!261664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!132159 (mask!11168 thiss!1504))))

(declare-fun lt!132153 () Unit!8111)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12619 (_ BitVec 32) (_ BitVec 32)) Unit!8111)

(assert (=> b!261664 (= lt!132153 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7008 thiss!1504) index!297 (mask!11168 thiss!1504)))))

(assert (=> b!261664 (= (arrayCountValidKeys!0 lt!132159 #b00000000000000000000000000000000 (size!6323 (_keys!7008 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7008 thiss!1504) #b00000000000000000000000000000000 (size!6323 (_keys!7008 thiss!1504)))))))

(declare-fun lt!132157 () Unit!8111)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12619 (_ BitVec 32) (_ BitVec 64)) Unit!8111)

(assert (=> b!261664 (= lt!132157 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7008 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3743 0))(
  ( (Nil!3740) (Cons!3739 (h!4405 (_ BitVec 64)) (t!8808 List!3743)) )
))
(declare-fun arrayNoDuplicates!0 (array!12619 (_ BitVec 32) List!3743) Bool)

(assert (=> b!261664 (arrayNoDuplicates!0 lt!132159 #b00000000000000000000000000000000 Nil!3740)))

(assert (=> b!261664 (= lt!132159 (array!12620 (store (arr!5972 (_keys!7008 thiss!1504)) index!297 key!932) (size!6323 (_keys!7008 thiss!1504))))))

(declare-fun lt!132154 () Unit!8111)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12619 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3743) Unit!8111)

(assert (=> b!261664 (= lt!132154 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7008 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3740))))

(declare-fun lt!132161 () Unit!8111)

(assert (=> b!261664 (= lt!132161 e!169544)))

(declare-fun c!44562 () Bool)

(assert (=> b!261664 (= c!44562 (arrayContainsKey!0 (_keys!7008 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261665 () Bool)

(declare-fun res!127844 () Bool)

(assert (=> b!261665 (=> (not res!127844) (not e!169534))))

(assert (=> b!261665 (= res!127844 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!261666 () Bool)

(declare-fun res!127839 () Bool)

(assert (=> b!261666 (=> (not res!127839) (not e!169537))))

(assert (=> b!261666 (= res!127839 (= (select (arr!5972 (_keys!7008 thiss!1504)) (index!6782 lt!132150)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!261667 () Bool)

(declare-fun lt!132152 () Unit!8111)

(assert (=> b!261667 (= e!169535 lt!132152)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!433 (array!12619 array!12617 (_ BitVec 32) (_ BitVec 32) V!8489 V!8489 (_ BitVec 64) Int) Unit!8111)

(assert (=> b!261667 (= lt!132152 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!433 (_keys!7008 thiss!1504) (_values!4803 thiss!1504) (mask!11168 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) key!932 (defaultEntry!4820 thiss!1504)))))

(assert (=> b!261667 (= c!44565 ((_ is MissingZero!1153) lt!132150))))

(assert (=> b!261667 e!169541))

(declare-fun b!261668 () Bool)

(assert (=> b!261668 (= e!169536 ((_ is Undefined!1153) lt!132150))))

(declare-fun b!261669 () Bool)

(declare-fun e!169543 () Bool)

(assert (=> b!261669 (= e!169543 e!169545)))

(declare-fun res!127843 () Bool)

(assert (=> b!261669 (=> (not res!127843) (not e!169545))))

(assert (=> b!261669 (= res!127843 (inRange!0 index!297 (mask!11168 thiss!1504)))))

(declare-fun lt!132160 () Unit!8111)

(assert (=> b!261669 (= lt!132160 e!169535)))

(declare-fun c!44564 () Bool)

(declare-fun contains!1874 (ListLongMap!3779 (_ BitVec 64)) Bool)

(assert (=> b!261669 (= c!44564 (contains!1874 lt!132155 key!932))))

(assert (=> b!261669 (= lt!132155 (getCurrentListMap!1437 (_keys!7008 thiss!1504) (_values!4803 thiss!1504) (mask!11168 thiss!1504) (extraKeys!4557 thiss!1504) (zeroValue!4661 thiss!1504) (minValue!4661 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4820 thiss!1504)))))

(declare-fun b!261670 () Bool)

(assert (=> b!261670 (= e!169534 e!169543)))

(declare-fun res!127845 () Bool)

(assert (=> b!261670 (=> (not res!127845) (not e!169543))))

(assert (=> b!261670 (= res!127845 (or (= lt!132150 (MissingZero!1153 index!297)) (= lt!132150 (MissingVacant!1153 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12619 (_ BitVec 32)) SeekEntryResult!1153)

(assert (=> b!261670 (= lt!132150 (seekEntryOrOpen!0 key!932 (_keys!7008 thiss!1504) (mask!11168 thiss!1504)))))

(assert (= (and start!25126 res!127846) b!261665))

(assert (= (and b!261665 res!127844) b!261670))

(assert (= (and b!261670 res!127845) b!261669))

(assert (= (and b!261669 c!44564) b!261654))

(assert (= (and b!261669 (not c!44564)) b!261667))

(assert (= (and b!261667 c!44565) b!261653))

(assert (= (and b!261667 (not c!44565)) b!261660))

(assert (= (and b!261653 res!127840) b!261666))

(assert (= (and b!261666 res!127839) b!261663))

(assert (= (and b!261660 c!44563) b!261662))

(assert (= (and b!261660 (not c!44563)) b!261668))

(assert (= (and b!261662 res!127842) b!261657))

(assert (= (and b!261657 res!127841) b!261661))

(assert (= (or b!261653 b!261662) bm!24964))

(assert (= (or b!261663 b!261661) bm!24965))

(assert (= (and b!261669 res!127843) b!261664))

(assert (= (and b!261664 c!44562) b!261651))

(assert (= (and b!261664 (not c!44562)) b!261656))

(assert (= (and b!261652 condMapEmpty!11305) mapIsEmpty!11305))

(assert (= (and b!261652 (not condMapEmpty!11305)) mapNonEmpty!11305))

(assert (= (and mapNonEmpty!11305 ((_ is ValueCellFull!2972) mapValue!11305)) b!261655))

(assert (= (and b!261652 ((_ is ValueCellFull!2972) mapDefault!11305)) b!261658))

(assert (= b!261659 b!261652))

(assert (= start!25126 b!261659))

(declare-fun m!277867 () Bool)

(assert (=> b!261670 m!277867))

(declare-fun m!277869 () Bool)

(assert (=> mapNonEmpty!11305 m!277869))

(declare-fun m!277871 () Bool)

(assert (=> bm!24964 m!277871))

(declare-fun m!277873 () Bool)

(assert (=> start!25126 m!277873))

(declare-fun m!277875 () Bool)

(assert (=> bm!24965 m!277875))

(declare-fun m!277877 () Bool)

(assert (=> b!261654 m!277877))

(declare-fun m!277879 () Bool)

(assert (=> b!261669 m!277879))

(declare-fun m!277881 () Bool)

(assert (=> b!261669 m!277881))

(declare-fun m!277883 () Bool)

(assert (=> b!261669 m!277883))

(declare-fun m!277885 () Bool)

(assert (=> b!261664 m!277885))

(declare-fun m!277887 () Bool)

(assert (=> b!261664 m!277887))

(declare-fun m!277889 () Bool)

(assert (=> b!261664 m!277889))

(declare-fun m!277891 () Bool)

(assert (=> b!261664 m!277891))

(declare-fun m!277893 () Bool)

(assert (=> b!261664 m!277893))

(declare-fun m!277895 () Bool)

(assert (=> b!261664 m!277895))

(declare-fun m!277897 () Bool)

(assert (=> b!261664 m!277897))

(declare-fun m!277899 () Bool)

(assert (=> b!261664 m!277899))

(declare-fun m!277901 () Bool)

(assert (=> b!261664 m!277901))

(declare-fun m!277903 () Bool)

(assert (=> b!261664 m!277903))

(assert (=> b!261664 m!277875))

(declare-fun m!277905 () Bool)

(assert (=> b!261664 m!277905))

(declare-fun m!277907 () Bool)

(assert (=> b!261664 m!277907))

(declare-fun m!277909 () Bool)

(assert (=> b!261664 m!277909))

(declare-fun m!277911 () Bool)

(assert (=> b!261664 m!277911))

(declare-fun m!277913 () Bool)

(assert (=> b!261664 m!277913))

(declare-fun m!277915 () Bool)

(assert (=> b!261664 m!277915))

(declare-fun m!277917 () Bool)

(assert (=> b!261667 m!277917))

(declare-fun m!277919 () Bool)

(assert (=> b!261666 m!277919))

(declare-fun m!277921 () Bool)

(assert (=> b!261657 m!277921))

(declare-fun m!277923 () Bool)

(assert (=> b!261651 m!277923))

(declare-fun m!277925 () Bool)

(assert (=> b!261659 m!277925))

(declare-fun m!277927 () Bool)

(assert (=> b!261659 m!277927))

(check-sat (not b_next!6769) b_and!13917 (not b!261651) (not mapNonEmpty!11305) (not b!261654) (not b!261667) (not bm!24964) (not b!261669) (not bm!24965) (not b!261664) (not b!261659) tp_is_empty!6631 (not start!25126) (not b!261670))
(check-sat b_and!13917 (not b_next!6769))
