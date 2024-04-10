; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23290 () Bool)

(assert start!23290)

(declare-fun b!244770 () Bool)

(declare-fun b_free!6543 () Bool)

(declare-fun b_next!6543 () Bool)

(assert (=> b!244770 (= b_free!6543 (not b_next!6543))))

(declare-fun tp!22857 () Bool)

(declare-fun b_and!13529 () Bool)

(assert (=> b!244770 (= tp!22857 b_and!13529)))

(declare-fun b!244745 () Bool)

(declare-fun res!120062 () Bool)

(declare-fun e!158805 () Bool)

(assert (=> b!244745 (=> (not res!120062) (not e!158805))))

(declare-datatypes ((List!3662 0))(
  ( (Nil!3659) (Cons!3658 (h!4315 (_ BitVec 64)) (t!8673 List!3662)) )
))
(declare-fun contains!1768 (List!3662 (_ BitVec 64)) Bool)

(assert (=> b!244745 (= res!120062 (not (contains!1768 Nil!3659 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244746 () Bool)

(declare-fun e!158808 () Bool)

(assert (=> b!244746 (= e!158808 e!158805)))

(declare-fun res!120057 () Bool)

(assert (=> b!244746 (=> (not res!120057) (not e!158805))))

(declare-datatypes ((V!8187 0))(
  ( (V!8188 (val!3247 Int)) )
))
(declare-datatypes ((ValueCell!2859 0))(
  ( (ValueCellFull!2859 (v!5298 V!8187)) (EmptyCell!2859) )
))
(declare-datatypes ((array!12105 0))(
  ( (array!12106 (arr!5746 (Array (_ BitVec 32) ValueCell!2859)) (size!6088 (_ BitVec 32))) )
))
(declare-datatypes ((array!12107 0))(
  ( (array!12108 (arr!5747 (Array (_ BitVec 32) (_ BitVec 64))) (size!6089 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3618 0))(
  ( (LongMapFixedSize!3619 (defaultEntry!4530 Int) (mask!10633 (_ BitVec 32)) (extraKeys!4267 (_ BitVec 32)) (zeroValue!4371 V!8187) (minValue!4371 V!8187) (_size!1858 (_ BitVec 32)) (_keys!6643 array!12107) (_values!4513 array!12105) (_vacant!1858 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3618)

(assert (=> b!244746 (= res!120057 (and (bvslt (size!6089 (_keys!6643 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6089 (_keys!6643 thiss!1504)))))))

(declare-datatypes ((Unit!7556 0))(
  ( (Unit!7557) )
))
(declare-fun lt!122626 () Unit!7556)

(declare-fun e!158801 () Unit!7556)

(assert (=> b!244746 (= lt!122626 e!158801)))

(declare-fun c!40850 () Bool)

(declare-fun lt!122623 () Bool)

(assert (=> b!244746 (= c!40850 lt!122623)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!244746 (= lt!122623 (arrayContainsKey!0 (_keys!6643 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244747 () Bool)

(declare-fun e!158799 () Bool)

(declare-datatypes ((SeekEntryResult!1082 0))(
  ( (MissingZero!1082 (index!6498 (_ BitVec 32))) (Found!1082 (index!6499 (_ BitVec 32))) (Intermediate!1082 (undefined!1894 Bool) (index!6500 (_ BitVec 32)) (x!24386 (_ BitVec 32))) (Undefined!1082) (MissingVacant!1082 (index!6501 (_ BitVec 32))) )
))
(declare-fun lt!122621 () SeekEntryResult!1082)

(get-info :version)

(assert (=> b!244747 (= e!158799 ((_ is Undefined!1082) lt!122621))))

(declare-fun b!244748 () Bool)

(declare-fun Unit!7558 () Unit!7556)

(assert (=> b!244748 (= e!158801 Unit!7558)))

(declare-fun b!244749 () Bool)

(declare-fun res!120067 () Bool)

(assert (=> b!244749 (=> (not res!120067) (not e!158805))))

(declare-fun noDuplicate!103 (List!3662) Bool)

(assert (=> b!244749 (= res!120067 (noDuplicate!103 Nil!3659))))

(declare-fun b!244750 () Bool)

(declare-fun e!158807 () Bool)

(declare-fun tp_is_empty!6405 () Bool)

(assert (=> b!244750 (= e!158807 tp_is_empty!6405)))

(declare-fun res!120059 () Bool)

(declare-fun e!158809 () Bool)

(assert (=> start!23290 (=> (not res!120059) (not e!158809))))

(declare-fun valid!1418 (LongMapFixedSize!3618) Bool)

(assert (=> start!23290 (= res!120059 (valid!1418 thiss!1504))))

(assert (=> start!23290 e!158809))

(declare-fun e!158804 () Bool)

(assert (=> start!23290 e!158804))

(assert (=> start!23290 true))

(declare-fun b!244751 () Bool)

(declare-fun res!120068 () Bool)

(declare-fun e!158800 () Bool)

(assert (=> b!244751 (=> (not res!120068) (not e!158800))))

(assert (=> b!244751 (= res!120068 (= (select (arr!5747 (_keys!6643 thiss!1504)) (index!6498 lt!122621)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244752 () Bool)

(declare-fun res!120066 () Bool)

(assert (=> b!244752 (=> (not res!120066) (not e!158805))))

(assert (=> b!244752 (= res!120066 (not (contains!1768 Nil!3659 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244753 () Bool)

(declare-fun c!40849 () Bool)

(assert (=> b!244753 (= c!40849 ((_ is MissingVacant!1082) lt!122621))))

(declare-fun e!158795 () Bool)

(assert (=> b!244753 (= e!158795 e!158799)))

(declare-fun b!244754 () Bool)

(declare-fun res!120060 () Bool)

(assert (=> b!244754 (=> (not res!120060) (not e!158805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244754 (= res!120060 (validKeyInArray!0 key!932))))

(declare-fun b!244755 () Bool)

(declare-fun e!158797 () Unit!7556)

(declare-fun lt!122622 () Unit!7556)

(assert (=> b!244755 (= e!158797 lt!122622)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!374 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8187 V!8187 (_ BitVec 64) Int) Unit!7556)

(assert (=> b!244755 (= lt!122622 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!374 (_keys!6643 thiss!1504) (_values!4513 thiss!1504) (mask!10633 thiss!1504) (extraKeys!4267 thiss!1504) (zeroValue!4371 thiss!1504) (minValue!4371 thiss!1504) key!932 (defaultEntry!4530 thiss!1504)))))

(declare-fun c!40851 () Bool)

(assert (=> b!244755 (= c!40851 ((_ is MissingZero!1082) lt!122621))))

(assert (=> b!244755 e!158795))

(declare-fun mapIsEmpty!10864 () Bool)

(declare-fun mapRes!10864 () Bool)

(assert (=> mapIsEmpty!10864 mapRes!10864))

(declare-fun b!244756 () Bool)

(declare-fun call!22833 () Bool)

(assert (=> b!244756 (= e!158800 (not call!22833))))

(declare-fun b!244757 () Bool)

(declare-fun e!158802 () Bool)

(assert (=> b!244757 (= e!158802 tp_is_empty!6405)))

(declare-fun b!244758 () Bool)

(declare-fun e!158793 () Bool)

(assert (=> b!244758 (= e!158793 e!158808)))

(declare-fun res!120069 () Bool)

(assert (=> b!244758 (=> (not res!120069) (not e!158808))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244758 (= res!120069 (inRange!0 index!297 (mask!10633 thiss!1504)))))

(declare-fun lt!122625 () Unit!7556)

(assert (=> b!244758 (= lt!122625 e!158797)))

(declare-fun c!40848 () Bool)

(declare-datatypes ((tuple2!4780 0))(
  ( (tuple2!4781 (_1!2401 (_ BitVec 64)) (_2!2401 V!8187)) )
))
(declare-datatypes ((List!3663 0))(
  ( (Nil!3660) (Cons!3659 (h!4316 tuple2!4780) (t!8674 List!3663)) )
))
(declare-datatypes ((ListLongMap!3693 0))(
  ( (ListLongMap!3694 (toList!1862 List!3663)) )
))
(declare-fun contains!1769 (ListLongMap!3693 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1390 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8187 V!8187 (_ BitVec 32) Int) ListLongMap!3693)

(assert (=> b!244758 (= c!40848 (contains!1769 (getCurrentListMap!1390 (_keys!6643 thiss!1504) (_values!4513 thiss!1504) (mask!10633 thiss!1504) (extraKeys!4267 thiss!1504) (zeroValue!4371 thiss!1504) (minValue!4371 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4530 thiss!1504)) key!932))))

(declare-fun b!244759 () Bool)

(assert (=> b!244759 (= e!158809 e!158793)))

(declare-fun res!120063 () Bool)

(assert (=> b!244759 (=> (not res!120063) (not e!158793))))

(assert (=> b!244759 (= res!120063 (or (= lt!122621 (MissingZero!1082 index!297)) (= lt!122621 (MissingVacant!1082 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12107 (_ BitVec 32)) SeekEntryResult!1082)

(assert (=> b!244759 (= lt!122621 (seekEntryOrOpen!0 key!932 (_keys!6643 thiss!1504) (mask!10633 thiss!1504)))))

(declare-fun b!244760 () Bool)

(declare-fun e!158796 () Bool)

(assert (=> b!244760 (= e!158796 (not call!22833))))

(declare-fun bm!22829 () Bool)

(declare-fun call!22832 () Bool)

(assert (=> bm!22829 (= call!22832 (inRange!0 (ite c!40851 (index!6498 lt!122621) (index!6501 lt!122621)) (mask!10633 thiss!1504)))))

(declare-fun b!244761 () Bool)

(declare-fun e!158794 () Bool)

(assert (=> b!244761 (= e!158794 (contains!1768 Nil!3659 key!932))))

(declare-fun b!244762 () Bool)

(declare-fun Unit!7559 () Unit!7556)

(assert (=> b!244762 (= e!158801 Unit!7559)))

(declare-fun lt!122624 () Unit!7556)

(declare-fun lemmaArrayContainsKeyThenInListMap!172 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8187 V!8187 (_ BitVec 64) (_ BitVec 32) Int) Unit!7556)

(assert (=> b!244762 (= lt!122624 (lemmaArrayContainsKeyThenInListMap!172 (_keys!6643 thiss!1504) (_values!4513 thiss!1504) (mask!10633 thiss!1504) (extraKeys!4267 thiss!1504) (zeroValue!4371 thiss!1504) (minValue!4371 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4530 thiss!1504)))))

(assert (=> b!244762 false))

(declare-fun b!244763 () Bool)

(declare-fun e!158792 () Bool)

(declare-fun e!158798 () Bool)

(assert (=> b!244763 (= e!158792 e!158798)))

(declare-fun res!120071 () Bool)

(assert (=> b!244763 (=> (not res!120071) (not e!158798))))

(assert (=> b!244763 (= res!120071 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!244764 () Bool)

(assert (=> b!244764 (= e!158799 e!158796)))

(declare-fun res!120070 () Bool)

(assert (=> b!244764 (= res!120070 call!22832)))

(assert (=> b!244764 (=> (not res!120070) (not e!158796))))

(declare-fun b!244765 () Bool)

(assert (=> b!244765 (= e!158805 lt!122623)))

(declare-fun b!244766 () Bool)

(declare-fun e!158806 () Bool)

(assert (=> b!244766 (= e!158806 (and e!158802 mapRes!10864))))

(declare-fun condMapEmpty!10864 () Bool)

(declare-fun mapDefault!10864 () ValueCell!2859)

(assert (=> b!244766 (= condMapEmpty!10864 (= (arr!5746 (_values!4513 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2859)) mapDefault!10864)))))

(declare-fun b!244767 () Bool)

(declare-fun res!120056 () Bool)

(assert (=> b!244767 (=> (not res!120056) (not e!158805))))

(assert (=> b!244767 (= res!120056 e!158792)))

(declare-fun res!120055 () Bool)

(assert (=> b!244767 (=> res!120055 e!158792)))

(assert (=> b!244767 (= res!120055 e!158794)))

(declare-fun res!120058 () Bool)

(assert (=> b!244767 (=> (not res!120058) (not e!158794))))

(assert (=> b!244767 (= res!120058 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!244768 () Bool)

(declare-fun Unit!7560 () Unit!7556)

(assert (=> b!244768 (= e!158797 Unit!7560)))

(declare-fun lt!122627 () Unit!7556)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!368 (array!12107 array!12105 (_ BitVec 32) (_ BitVec 32) V!8187 V!8187 (_ BitVec 64) Int) Unit!7556)

(assert (=> b!244768 (= lt!122627 (lemmaInListMapThenSeekEntryOrOpenFindsIt!368 (_keys!6643 thiss!1504) (_values!4513 thiss!1504) (mask!10633 thiss!1504) (extraKeys!4267 thiss!1504) (zeroValue!4371 thiss!1504) (minValue!4371 thiss!1504) key!932 (defaultEntry!4530 thiss!1504)))))

(assert (=> b!244768 false))

(declare-fun b!244769 () Bool)

(declare-fun res!120072 () Bool)

(assert (=> b!244769 (=> (not res!120072) (not e!158800))))

(assert (=> b!244769 (= res!120072 call!22832)))

(assert (=> b!244769 (= e!158795 e!158800)))

(declare-fun array_inv!3799 (array!12107) Bool)

(declare-fun array_inv!3800 (array!12105) Bool)

(assert (=> b!244770 (= e!158804 (and tp!22857 tp_is_empty!6405 (array_inv!3799 (_keys!6643 thiss!1504)) (array_inv!3800 (_values!4513 thiss!1504)) e!158806))))

(declare-fun b!244771 () Bool)

(declare-fun res!120054 () Bool)

(assert (=> b!244771 (=> (not res!120054) (not e!158805))))

(declare-fun arrayNoDuplicates!0 (array!12107 (_ BitVec 32) List!3662) Bool)

(assert (=> b!244771 (= res!120054 (arrayNoDuplicates!0 (_keys!6643 thiss!1504) #b00000000000000000000000000000000 Nil!3659))))

(declare-fun mapNonEmpty!10864 () Bool)

(declare-fun tp!22858 () Bool)

(assert (=> mapNonEmpty!10864 (= mapRes!10864 (and tp!22858 e!158807))))

(declare-fun mapValue!10864 () ValueCell!2859)

(declare-fun mapKey!10864 () (_ BitVec 32))

(declare-fun mapRest!10864 () (Array (_ BitVec 32) ValueCell!2859))

(assert (=> mapNonEmpty!10864 (= (arr!5746 (_values!4513 thiss!1504)) (store mapRest!10864 mapKey!10864 mapValue!10864))))

(declare-fun bm!22830 () Bool)

(assert (=> bm!22830 (= call!22833 (arrayContainsKey!0 (_keys!6643 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244772 () Bool)

(assert (=> b!244772 (= e!158798 (not (contains!1768 Nil!3659 key!932)))))

(declare-fun b!244773 () Bool)

(declare-fun res!120061 () Bool)

(assert (=> b!244773 (=> (not res!120061) (not e!158805))))

(assert (=> b!244773 (= res!120061 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6089 (_keys!6643 thiss!1504)))))))

(declare-fun b!244774 () Bool)

(declare-fun res!120064 () Bool)

(assert (=> b!244774 (= res!120064 (= (select (arr!5747 (_keys!6643 thiss!1504)) (index!6501 lt!122621)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244774 (=> (not res!120064) (not e!158796))))

(declare-fun b!244775 () Bool)

(declare-fun res!120065 () Bool)

(assert (=> b!244775 (=> (not res!120065) (not e!158809))))

(assert (=> b!244775 (= res!120065 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!23290 res!120059) b!244775))

(assert (= (and b!244775 res!120065) b!244759))

(assert (= (and b!244759 res!120063) b!244758))

(assert (= (and b!244758 c!40848) b!244768))

(assert (= (and b!244758 (not c!40848)) b!244755))

(assert (= (and b!244755 c!40851) b!244769))

(assert (= (and b!244755 (not c!40851)) b!244753))

(assert (= (and b!244769 res!120072) b!244751))

(assert (= (and b!244751 res!120068) b!244756))

(assert (= (and b!244753 c!40849) b!244764))

(assert (= (and b!244753 (not c!40849)) b!244747))

(assert (= (and b!244764 res!120070) b!244774))

(assert (= (and b!244774 res!120064) b!244760))

(assert (= (or b!244769 b!244764) bm!22829))

(assert (= (or b!244756 b!244760) bm!22830))

(assert (= (and b!244758 res!120069) b!244746))

(assert (= (and b!244746 c!40850) b!244762))

(assert (= (and b!244746 (not c!40850)) b!244748))

(assert (= (and b!244746 res!120057) b!244749))

(assert (= (and b!244749 res!120067) b!244745))

(assert (= (and b!244745 res!120062) b!244752))

(assert (= (and b!244752 res!120066) b!244767))

(assert (= (and b!244767 res!120058) b!244761))

(assert (= (and b!244767 (not res!120055)) b!244763))

(assert (= (and b!244763 res!120071) b!244772))

(assert (= (and b!244767 res!120056) b!244771))

(assert (= (and b!244771 res!120054) b!244773))

(assert (= (and b!244773 res!120061) b!244754))

(assert (= (and b!244754 res!120060) b!244765))

(assert (= (and b!244766 condMapEmpty!10864) mapIsEmpty!10864))

(assert (= (and b!244766 (not condMapEmpty!10864)) mapNonEmpty!10864))

(assert (= (and mapNonEmpty!10864 ((_ is ValueCellFull!2859) mapValue!10864)) b!244750))

(assert (= (and b!244766 ((_ is ValueCellFull!2859) mapDefault!10864)) b!244757))

(assert (= b!244770 b!244766))

(assert (= start!23290 b!244770))

(declare-fun m!262579 () Bool)

(assert (=> mapNonEmpty!10864 m!262579))

(declare-fun m!262581 () Bool)

(assert (=> b!244751 m!262581))

(declare-fun m!262583 () Bool)

(assert (=> b!244758 m!262583))

(declare-fun m!262585 () Bool)

(assert (=> b!244758 m!262585))

(assert (=> b!244758 m!262585))

(declare-fun m!262587 () Bool)

(assert (=> b!244758 m!262587))

(declare-fun m!262589 () Bool)

(assert (=> b!244771 m!262589))

(declare-fun m!262591 () Bool)

(assert (=> start!23290 m!262591))

(declare-fun m!262593 () Bool)

(assert (=> b!244746 m!262593))

(declare-fun m!262595 () Bool)

(assert (=> bm!22829 m!262595))

(declare-fun m!262597 () Bool)

(assert (=> b!244772 m!262597))

(declare-fun m!262599 () Bool)

(assert (=> b!244749 m!262599))

(declare-fun m!262601 () Bool)

(assert (=> b!244774 m!262601))

(declare-fun m!262603 () Bool)

(assert (=> b!244768 m!262603))

(declare-fun m!262605 () Bool)

(assert (=> b!244755 m!262605))

(declare-fun m!262607 () Bool)

(assert (=> b!244754 m!262607))

(declare-fun m!262609 () Bool)

(assert (=> b!244752 m!262609))

(declare-fun m!262611 () Bool)

(assert (=> b!244770 m!262611))

(declare-fun m!262613 () Bool)

(assert (=> b!244770 m!262613))

(assert (=> b!244761 m!262597))

(declare-fun m!262615 () Bool)

(assert (=> b!244759 m!262615))

(declare-fun m!262617 () Bool)

(assert (=> b!244745 m!262617))

(declare-fun m!262619 () Bool)

(assert (=> b!244762 m!262619))

(assert (=> bm!22830 m!262593))

(check-sat (not mapNonEmpty!10864) (not b_next!6543) (not b!244772) (not b!244771) (not b!244762) (not b!244758) (not start!23290) (not b!244754) (not b!244746) tp_is_empty!6405 (not bm!22830) (not b!244761) (not bm!22829) (not b!244745) (not b!244749) (not b!244755) b_and!13529 (not b!244768) (not b!244752) (not b!244759) (not b!244770))
(check-sat b_and!13529 (not b_next!6543))
