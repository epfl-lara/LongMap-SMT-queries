; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19068 () Bool)

(assert start!19068)

(declare-fun b!187829 () Bool)

(declare-fun b_free!4617 () Bool)

(declare-fun b_next!4617 () Bool)

(assert (=> b!187829 (= b_free!4617 (not b_next!4617))))

(declare-fun tp!16668 () Bool)

(declare-fun b_and!11241 () Bool)

(assert (=> b!187829 (= tp!16668 b_and!11241)))

(declare-fun b!187819 () Bool)

(declare-datatypes ((Unit!5661 0))(
  ( (Unit!5662) )
))
(declare-fun e!123613 () Unit!5661)

(declare-fun Unit!5663 () Unit!5661)

(assert (=> b!187819 (= e!123613 Unit!5663)))

(declare-fun lt!92933 () Unit!5661)

(declare-datatypes ((V!5499 0))(
  ( (V!5500 (val!2239 Int)) )
))
(declare-datatypes ((ValueCell!1851 0))(
  ( (ValueCellFull!1851 (v!4155 V!5499)) (EmptyCell!1851) )
))
(declare-datatypes ((array!7997 0))(
  ( (array!7998 (arr!3773 (Array (_ BitVec 32) (_ BitVec 64))) (size!4092 (_ BitVec 32))) )
))
(declare-datatypes ((array!7999 0))(
  ( (array!8000 (arr!3774 (Array (_ BitVec 32) ValueCell!1851)) (size!4093 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2610 0))(
  ( (LongMapFixedSize!2611 (defaultEntry!3831 Int) (mask!8985 (_ BitVec 32)) (extraKeys!3568 (_ BitVec 32)) (zeroValue!3672 V!5499) (minValue!3672 V!5499) (_size!1354 (_ BitVec 32)) (_keys!5786 array!7997) (_values!3814 array!7999) (_vacant!1354 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2610)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!156 (array!7997 array!7999 (_ BitVec 32) (_ BitVec 32) V!5499 V!5499 (_ BitVec 64) Int) Unit!5661)

(assert (=> b!187819 (= lt!92933 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!156 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) key!828 (defaultEntry!3831 thiss!1248)))))

(assert (=> b!187819 false))

(declare-fun b!187820 () Bool)

(declare-fun e!123618 () Bool)

(declare-fun e!123620 () Bool)

(assert (=> b!187820 (= e!123618 e!123620)))

(declare-fun res!88798 () Bool)

(assert (=> b!187820 (=> (not res!88798) (not e!123620))))

(declare-datatypes ((SeekEntryResult!650 0))(
  ( (MissingZero!650 (index!4770 (_ BitVec 32))) (Found!650 (index!4771 (_ BitVec 32))) (Intermediate!650 (undefined!1462 Bool) (index!4772 (_ BitVec 32)) (x!20310 (_ BitVec 32))) (Undefined!650) (MissingVacant!650 (index!4773 (_ BitVec 32))) )
))
(declare-fun lt!92934 () SeekEntryResult!650)

(get-info :version)

(assert (=> b!187820 (= res!88798 (and (not ((_ is Undefined!650) lt!92934)) (not ((_ is MissingVacant!650) lt!92934)) (not ((_ is MissingZero!650) lt!92934)) ((_ is Found!650) lt!92934)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7997 (_ BitVec 32)) SeekEntryResult!650)

(assert (=> b!187820 (= lt!92934 (seekEntryOrOpen!0 key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(declare-fun res!88799 () Bool)

(assert (=> start!19068 (=> (not res!88799) (not e!123618))))

(declare-fun valid!1074 (LongMapFixedSize!2610) Bool)

(assert (=> start!19068 (= res!88799 (valid!1074 thiss!1248))))

(assert (=> start!19068 e!123618))

(declare-fun e!123614 () Bool)

(assert (=> start!19068 e!123614))

(assert (=> start!19068 true))

(declare-fun b!187821 () Bool)

(declare-fun e!123622 () Bool)

(declare-fun tp_is_empty!4389 () Bool)

(assert (=> b!187821 (= e!123622 tp_is_empty!4389)))

(declare-fun e!123616 () Bool)

(declare-fun b!187822 () Bool)

(assert (=> b!187822 (= e!123616 (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4771 lt!92934)) key!828))))

(declare-fun b!187823 () Bool)

(declare-fun e!123615 () Bool)

(assert (=> b!187823 (= e!123620 e!123615)))

(declare-fun res!88800 () Bool)

(assert (=> b!187823 (=> (not res!88800) (not e!123615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187823 (= res!88800 (validMask!0 (mask!8985 thiss!1248)))))

(declare-fun lt!92932 () Unit!5661)

(assert (=> b!187823 (= lt!92932 e!123613)))

(declare-fun c!33736 () Bool)

(declare-datatypes ((tuple2!3482 0))(
  ( (tuple2!3483 (_1!1752 (_ BitVec 64)) (_2!1752 V!5499)) )
))
(declare-datatypes ((List!2385 0))(
  ( (Nil!2382) (Cons!2381 (h!3017 tuple2!3482) (t!7279 List!2385)) )
))
(declare-datatypes ((ListLongMap!2399 0))(
  ( (ListLongMap!2400 (toList!1215 List!2385)) )
))
(declare-fun contains!1317 (ListLongMap!2399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!863 (array!7997 array!7999 (_ BitVec 32) (_ BitVec 32) V!5499 V!5499 (_ BitVec 32) Int) ListLongMap!2399)

(assert (=> b!187823 (= c!33736 (contains!1317 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!7563 () Bool)

(declare-fun mapRes!7563 () Bool)

(assert (=> mapIsEmpty!7563 mapRes!7563))

(declare-fun mapNonEmpty!7563 () Bool)

(declare-fun tp!16667 () Bool)

(assert (=> mapNonEmpty!7563 (= mapRes!7563 (and tp!16667 e!123622))))

(declare-fun mapKey!7563 () (_ BitVec 32))

(declare-fun mapRest!7563 () (Array (_ BitVec 32) ValueCell!1851))

(declare-fun mapValue!7563 () ValueCell!1851)

(assert (=> mapNonEmpty!7563 (= (arr!3774 (_values!3814 thiss!1248)) (store mapRest!7563 mapKey!7563 mapValue!7563))))

(declare-fun b!187824 () Bool)

(declare-fun e!123619 () Bool)

(assert (=> b!187824 (= e!123619 tp_is_empty!4389)))

(declare-fun b!187825 () Bool)

(declare-fun res!88802 () Bool)

(assert (=> b!187825 (=> (not res!88802) (not e!123618))))

(assert (=> b!187825 (= res!88802 (not (= key!828 (bvneg key!828))))))

(declare-fun b!187826 () Bool)

(declare-fun e!123621 () Bool)

(assert (=> b!187826 (= e!123621 (and e!123619 mapRes!7563))))

(declare-fun condMapEmpty!7563 () Bool)

(declare-fun mapDefault!7563 () ValueCell!1851)

(assert (=> b!187826 (= condMapEmpty!7563 (= (arr!3774 (_values!3814 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1851)) mapDefault!7563)))))

(declare-fun b!187827 () Bool)

(declare-fun lt!92931 () Unit!5661)

(assert (=> b!187827 (= e!123613 lt!92931)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!152 (array!7997 array!7999 (_ BitVec 32) (_ BitVec 32) V!5499 V!5499 (_ BitVec 64) Int) Unit!5661)

(assert (=> b!187827 (= lt!92931 (lemmaInListMapThenSeekEntryOrOpenFindsIt!152 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) key!828 (defaultEntry!3831 thiss!1248)))))

(declare-fun res!88801 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187827 (= res!88801 (inRange!0 (index!4771 lt!92934) (mask!8985 thiss!1248)))))

(assert (=> b!187827 (=> (not res!88801) (not e!123616))))

(assert (=> b!187827 e!123616))

(declare-fun b!187828 () Bool)

(assert (=> b!187828 (= e!123615 (and (= (size!4093 (_values!3814 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8985 thiss!1248))) (= (size!4092 (_keys!5786 thiss!1248)) (size!4093 (_values!3814 thiss!1248))) (bvsge (mask!8985 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3568 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3568 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun array_inv!2443 (array!7997) Bool)

(declare-fun array_inv!2444 (array!7999) Bool)

(assert (=> b!187829 (= e!123614 (and tp!16668 tp_is_empty!4389 (array_inv!2443 (_keys!5786 thiss!1248)) (array_inv!2444 (_values!3814 thiss!1248)) e!123621))))

(assert (= (and start!19068 res!88799) b!187825))

(assert (= (and b!187825 res!88802) b!187820))

(assert (= (and b!187820 res!88798) b!187823))

(assert (= (and b!187823 c!33736) b!187827))

(assert (= (and b!187823 (not c!33736)) b!187819))

(assert (= (and b!187827 res!88801) b!187822))

(assert (= (and b!187823 res!88800) b!187828))

(assert (= (and b!187826 condMapEmpty!7563) mapIsEmpty!7563))

(assert (= (and b!187826 (not condMapEmpty!7563)) mapNonEmpty!7563))

(assert (= (and mapNonEmpty!7563 ((_ is ValueCellFull!1851) mapValue!7563)) b!187821))

(assert (= (and b!187826 ((_ is ValueCellFull!1851) mapDefault!7563)) b!187824))

(assert (= b!187829 b!187826))

(assert (= start!19068 b!187829))

(declare-fun m!214577 () Bool)

(assert (=> b!187819 m!214577))

(declare-fun m!214579 () Bool)

(assert (=> b!187829 m!214579))

(declare-fun m!214581 () Bool)

(assert (=> b!187829 m!214581))

(declare-fun m!214583 () Bool)

(assert (=> mapNonEmpty!7563 m!214583))

(declare-fun m!214585 () Bool)

(assert (=> b!187820 m!214585))

(declare-fun m!214587 () Bool)

(assert (=> b!187823 m!214587))

(declare-fun m!214589 () Bool)

(assert (=> b!187823 m!214589))

(assert (=> b!187823 m!214589))

(declare-fun m!214591 () Bool)

(assert (=> b!187823 m!214591))

(declare-fun m!214593 () Bool)

(assert (=> b!187822 m!214593))

(declare-fun m!214595 () Bool)

(assert (=> b!187827 m!214595))

(declare-fun m!214597 () Bool)

(assert (=> b!187827 m!214597))

(declare-fun m!214599 () Bool)

(assert (=> start!19068 m!214599))

(check-sat (not b!187827) (not b!187829) (not b!187820) (not b_next!4617) tp_is_empty!4389 (not start!19068) (not b!187823) b_and!11241 (not b!187819) (not mapNonEmpty!7563))
(check-sat b_and!11241 (not b_next!4617))
(get-model)

(declare-fun d!55505 () Bool)

(assert (=> d!55505 (= (array_inv!2443 (_keys!5786 thiss!1248)) (bvsge (size!4092 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187829 d!55505))

(declare-fun d!55507 () Bool)

(assert (=> d!55507 (= (array_inv!2444 (_values!3814 thiss!1248)) (bvsge (size!4093 (_values!3814 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187829 d!55507))

(declare-fun b!187875 () Bool)

(declare-fun c!33747 () Bool)

(declare-fun lt!92954 () (_ BitVec 64))

(assert (=> b!187875 (= c!33747 (= lt!92954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123661 () SeekEntryResult!650)

(declare-fun e!123659 () SeekEntryResult!650)

(assert (=> b!187875 (= e!123661 e!123659)))

(declare-fun b!187876 () Bool)

(declare-fun lt!92953 () SeekEntryResult!650)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7997 (_ BitVec 32)) SeekEntryResult!650)

(assert (=> b!187876 (= e!123659 (seekKeyOrZeroReturnVacant!0 (x!20310 lt!92953) (index!4772 lt!92953) (index!4772 lt!92953) key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(declare-fun b!187877 () Bool)

(declare-fun e!123660 () SeekEntryResult!650)

(assert (=> b!187877 (= e!123660 e!123661)))

(assert (=> b!187877 (= lt!92954 (select (arr!3773 (_keys!5786 thiss!1248)) (index!4772 lt!92953)))))

(declare-fun c!33748 () Bool)

(assert (=> b!187877 (= c!33748 (= lt!92954 key!828))))

(declare-fun b!187878 () Bool)

(assert (=> b!187878 (= e!123661 (Found!650 (index!4772 lt!92953)))))

(declare-fun b!187879 () Bool)

(assert (=> b!187879 (= e!123660 Undefined!650)))

(declare-fun d!55509 () Bool)

(declare-fun lt!92955 () SeekEntryResult!650)

(assert (=> d!55509 (and (or ((_ is Undefined!650) lt!92955) (not ((_ is Found!650) lt!92955)) (and (bvsge (index!4771 lt!92955) #b00000000000000000000000000000000) (bvslt (index!4771 lt!92955) (size!4092 (_keys!5786 thiss!1248))))) (or ((_ is Undefined!650) lt!92955) ((_ is Found!650) lt!92955) (not ((_ is MissingZero!650) lt!92955)) (and (bvsge (index!4770 lt!92955) #b00000000000000000000000000000000) (bvslt (index!4770 lt!92955) (size!4092 (_keys!5786 thiss!1248))))) (or ((_ is Undefined!650) lt!92955) ((_ is Found!650) lt!92955) ((_ is MissingZero!650) lt!92955) (not ((_ is MissingVacant!650) lt!92955)) (and (bvsge (index!4773 lt!92955) #b00000000000000000000000000000000) (bvslt (index!4773 lt!92955) (size!4092 (_keys!5786 thiss!1248))))) (or ((_ is Undefined!650) lt!92955) (ite ((_ is Found!650) lt!92955) (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4771 lt!92955)) key!828) (ite ((_ is MissingZero!650) lt!92955) (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4770 lt!92955)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!650) lt!92955) (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4773 lt!92955)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55509 (= lt!92955 e!123660)))

(declare-fun c!33746 () Bool)

(assert (=> d!55509 (= c!33746 (and ((_ is Intermediate!650) lt!92953) (undefined!1462 lt!92953)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7997 (_ BitVec 32)) SeekEntryResult!650)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55509 (= lt!92953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8985 thiss!1248)) key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(assert (=> d!55509 (validMask!0 (mask!8985 thiss!1248))))

(assert (=> d!55509 (= (seekEntryOrOpen!0 key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)) lt!92955)))

(declare-fun b!187880 () Bool)

(assert (=> b!187880 (= e!123659 (MissingZero!650 (index!4772 lt!92953)))))

(assert (= (and d!55509 c!33746) b!187879))

(assert (= (and d!55509 (not c!33746)) b!187877))

(assert (= (and b!187877 c!33748) b!187878))

(assert (= (and b!187877 (not c!33748)) b!187875))

(assert (= (and b!187875 c!33747) b!187880))

(assert (= (and b!187875 (not c!33747)) b!187876))

(declare-fun m!214625 () Bool)

(assert (=> b!187876 m!214625))

(declare-fun m!214627 () Bool)

(assert (=> b!187877 m!214627))

(declare-fun m!214629 () Bool)

(assert (=> d!55509 m!214629))

(declare-fun m!214631 () Bool)

(assert (=> d!55509 m!214631))

(declare-fun m!214633 () Bool)

(assert (=> d!55509 m!214633))

(assert (=> d!55509 m!214629))

(declare-fun m!214635 () Bool)

(assert (=> d!55509 m!214635))

(declare-fun m!214637 () Bool)

(assert (=> d!55509 m!214637))

(assert (=> d!55509 m!214587))

(assert (=> b!187820 d!55509))

(declare-fun b!187897 () Bool)

(declare-fun res!88826 () Bool)

(declare-fun e!123671 () Bool)

(assert (=> b!187897 (=> (not res!88826) (not e!123671))))

(declare-fun lt!92960 () SeekEntryResult!650)

(assert (=> b!187897 (= res!88826 (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4773 lt!92960)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187897 (and (bvsge (index!4773 lt!92960) #b00000000000000000000000000000000) (bvslt (index!4773 lt!92960) (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun b!187898 () Bool)

(declare-fun e!123672 () Bool)

(declare-fun e!123673 () Bool)

(assert (=> b!187898 (= e!123672 e!123673)))

(declare-fun c!33754 () Bool)

(assert (=> b!187898 (= c!33754 ((_ is MissingVacant!650) lt!92960))))

(declare-fun d!55511 () Bool)

(assert (=> d!55511 e!123672))

(declare-fun c!33753 () Bool)

(assert (=> d!55511 (= c!33753 ((_ is MissingZero!650) lt!92960))))

(assert (=> d!55511 (= lt!92960 (seekEntryOrOpen!0 key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(declare-fun lt!92961 () Unit!5661)

(declare-fun choose!1001 (array!7997 array!7999 (_ BitVec 32) (_ BitVec 32) V!5499 V!5499 (_ BitVec 64) Int) Unit!5661)

(assert (=> d!55511 (= lt!92961 (choose!1001 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) key!828 (defaultEntry!3831 thiss!1248)))))

(assert (=> d!55511 (validMask!0 (mask!8985 thiss!1248))))

(assert (=> d!55511 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!156 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) key!828 (defaultEntry!3831 thiss!1248)) lt!92961)))

(declare-fun b!187899 () Bool)

(declare-fun e!123670 () Bool)

(declare-fun call!18933 () Bool)

(assert (=> b!187899 (= e!123670 (not call!18933))))

(declare-fun b!187900 () Bool)

(assert (=> b!187900 (= e!123673 ((_ is Undefined!650) lt!92960))))

(declare-fun b!187901 () Bool)

(declare-fun res!88828 () Bool)

(assert (=> b!187901 (=> (not res!88828) (not e!123671))))

(declare-fun call!18934 () Bool)

(assert (=> b!187901 (= res!88828 call!18934)))

(assert (=> b!187901 (= e!123673 e!123671)))

(declare-fun b!187902 () Bool)

(assert (=> b!187902 (and (bvsge (index!4770 lt!92960) #b00000000000000000000000000000000) (bvslt (index!4770 lt!92960) (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun res!88827 () Bool)

(assert (=> b!187902 (= res!88827 (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4770 lt!92960)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187902 (=> (not res!88827) (not e!123670))))

(declare-fun b!187903 () Bool)

(assert (=> b!187903 (= e!123671 (not call!18933))))

(declare-fun b!187904 () Bool)

(assert (=> b!187904 (= e!123672 e!123670)))

(declare-fun res!88829 () Bool)

(assert (=> b!187904 (= res!88829 call!18934)))

(assert (=> b!187904 (=> (not res!88829) (not e!123670))))

(declare-fun bm!18930 () Bool)

(declare-fun arrayContainsKey!0 (array!7997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18930 (= call!18933 (arrayContainsKey!0 (_keys!5786 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun bm!18931 () Bool)

(assert (=> bm!18931 (= call!18934 (inRange!0 (ite c!33753 (index!4770 lt!92960) (index!4773 lt!92960)) (mask!8985 thiss!1248)))))

(assert (= (and d!55511 c!33753) b!187904))

(assert (= (and d!55511 (not c!33753)) b!187898))

(assert (= (and b!187904 res!88829) b!187902))

(assert (= (and b!187902 res!88827) b!187899))

(assert (= (and b!187898 c!33754) b!187901))

(assert (= (and b!187898 (not c!33754)) b!187900))

(assert (= (and b!187901 res!88828) b!187897))

(assert (= (and b!187897 res!88826) b!187903))

(assert (= (or b!187904 b!187901) bm!18931))

(assert (= (or b!187899 b!187903) bm!18930))

(declare-fun m!214639 () Bool)

(assert (=> bm!18930 m!214639))

(declare-fun m!214641 () Bool)

(assert (=> bm!18931 m!214641))

(declare-fun m!214643 () Bool)

(assert (=> b!187902 m!214643))

(declare-fun m!214645 () Bool)

(assert (=> b!187897 m!214645))

(assert (=> d!55511 m!214585))

(declare-fun m!214647 () Bool)

(assert (=> d!55511 m!214647))

(assert (=> d!55511 m!214587))

(assert (=> b!187819 d!55511))

(declare-fun d!55513 () Bool)

(declare-fun e!123676 () Bool)

(assert (=> d!55513 e!123676))

(declare-fun res!88834 () Bool)

(assert (=> d!55513 (=> (not res!88834) (not e!123676))))

(declare-fun lt!92966 () SeekEntryResult!650)

(assert (=> d!55513 (= res!88834 ((_ is Found!650) lt!92966))))

(assert (=> d!55513 (= lt!92966 (seekEntryOrOpen!0 key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(declare-fun lt!92967 () Unit!5661)

(declare-fun choose!1002 (array!7997 array!7999 (_ BitVec 32) (_ BitVec 32) V!5499 V!5499 (_ BitVec 64) Int) Unit!5661)

(assert (=> d!55513 (= lt!92967 (choose!1002 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) key!828 (defaultEntry!3831 thiss!1248)))))

(assert (=> d!55513 (validMask!0 (mask!8985 thiss!1248))))

(assert (=> d!55513 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!152 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) key!828 (defaultEntry!3831 thiss!1248)) lt!92967)))

(declare-fun b!187909 () Bool)

(declare-fun res!88835 () Bool)

(assert (=> b!187909 (=> (not res!88835) (not e!123676))))

(assert (=> b!187909 (= res!88835 (inRange!0 (index!4771 lt!92966) (mask!8985 thiss!1248)))))

(declare-fun b!187910 () Bool)

(assert (=> b!187910 (= e!123676 (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4771 lt!92966)) key!828))))

(assert (=> b!187910 (and (bvsge (index!4771 lt!92966) #b00000000000000000000000000000000) (bvslt (index!4771 lt!92966) (size!4092 (_keys!5786 thiss!1248))))))

(assert (= (and d!55513 res!88834) b!187909))

(assert (= (and b!187909 res!88835) b!187910))

(assert (=> d!55513 m!214585))

(declare-fun m!214649 () Bool)

(assert (=> d!55513 m!214649))

(assert (=> d!55513 m!214587))

(declare-fun m!214651 () Bool)

(assert (=> b!187909 m!214651))

(declare-fun m!214653 () Bool)

(assert (=> b!187910 m!214653))

(assert (=> b!187827 d!55513))

(declare-fun d!55515 () Bool)

(assert (=> d!55515 (= (inRange!0 (index!4771 lt!92934) (mask!8985 thiss!1248)) (and (bvsge (index!4771 lt!92934) #b00000000000000000000000000000000) (bvslt (index!4771 lt!92934) (bvadd (mask!8985 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187827 d!55515))

(declare-fun d!55517 () Bool)

(declare-fun res!88842 () Bool)

(declare-fun e!123679 () Bool)

(assert (=> d!55517 (=> (not res!88842) (not e!123679))))

(declare-fun simpleValid!188 (LongMapFixedSize!2610) Bool)

(assert (=> d!55517 (= res!88842 (simpleValid!188 thiss!1248))))

(assert (=> d!55517 (= (valid!1074 thiss!1248) e!123679)))

(declare-fun b!187917 () Bool)

(declare-fun res!88843 () Bool)

(assert (=> b!187917 (=> (not res!88843) (not e!123679))))

(declare-fun arrayCountValidKeys!0 (array!7997 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187917 (= res!88843 (= (arrayCountValidKeys!0 (_keys!5786 thiss!1248) #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))) (_size!1354 thiss!1248)))))

(declare-fun b!187918 () Bool)

(declare-fun res!88844 () Bool)

(assert (=> b!187918 (=> (not res!88844) (not e!123679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7997 (_ BitVec 32)) Bool)

(assert (=> b!187918 (= res!88844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(declare-fun b!187919 () Bool)

(declare-datatypes ((List!2387 0))(
  ( (Nil!2384) (Cons!2383 (h!3019 (_ BitVec 64)) (t!7283 List!2387)) )
))
(declare-fun arrayNoDuplicates!0 (array!7997 (_ BitVec 32) List!2387) Bool)

(assert (=> b!187919 (= e!123679 (arrayNoDuplicates!0 (_keys!5786 thiss!1248) #b00000000000000000000000000000000 Nil!2384))))

(assert (= (and d!55517 res!88842) b!187917))

(assert (= (and b!187917 res!88843) b!187918))

(assert (= (and b!187918 res!88844) b!187919))

(declare-fun m!214655 () Bool)

(assert (=> d!55517 m!214655))

(declare-fun m!214657 () Bool)

(assert (=> b!187917 m!214657))

(declare-fun m!214659 () Bool)

(assert (=> b!187918 m!214659))

(declare-fun m!214661 () Bool)

(assert (=> b!187919 m!214661))

(assert (=> start!19068 d!55517))

(declare-fun d!55519 () Bool)

(assert (=> d!55519 (= (validMask!0 (mask!8985 thiss!1248)) (and (or (= (mask!8985 thiss!1248) #b00000000000000000000000000000111) (= (mask!8985 thiss!1248) #b00000000000000000000000000001111) (= (mask!8985 thiss!1248) #b00000000000000000000000000011111) (= (mask!8985 thiss!1248) #b00000000000000000000000000111111) (= (mask!8985 thiss!1248) #b00000000000000000000000001111111) (= (mask!8985 thiss!1248) #b00000000000000000000000011111111) (= (mask!8985 thiss!1248) #b00000000000000000000000111111111) (= (mask!8985 thiss!1248) #b00000000000000000000001111111111) (= (mask!8985 thiss!1248) #b00000000000000000000011111111111) (= (mask!8985 thiss!1248) #b00000000000000000000111111111111) (= (mask!8985 thiss!1248) #b00000000000000000001111111111111) (= (mask!8985 thiss!1248) #b00000000000000000011111111111111) (= (mask!8985 thiss!1248) #b00000000000000000111111111111111) (= (mask!8985 thiss!1248) #b00000000000000001111111111111111) (= (mask!8985 thiss!1248) #b00000000000000011111111111111111) (= (mask!8985 thiss!1248) #b00000000000000111111111111111111) (= (mask!8985 thiss!1248) #b00000000000001111111111111111111) (= (mask!8985 thiss!1248) #b00000000000011111111111111111111) (= (mask!8985 thiss!1248) #b00000000000111111111111111111111) (= (mask!8985 thiss!1248) #b00000000001111111111111111111111) (= (mask!8985 thiss!1248) #b00000000011111111111111111111111) (= (mask!8985 thiss!1248) #b00000000111111111111111111111111) (= (mask!8985 thiss!1248) #b00000001111111111111111111111111) (= (mask!8985 thiss!1248) #b00000011111111111111111111111111) (= (mask!8985 thiss!1248) #b00000111111111111111111111111111) (= (mask!8985 thiss!1248) #b00001111111111111111111111111111) (= (mask!8985 thiss!1248) #b00011111111111111111111111111111) (= (mask!8985 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8985 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!187823 d!55519))

(declare-fun d!55521 () Bool)

(declare-fun e!123684 () Bool)

(assert (=> d!55521 e!123684))

(declare-fun res!88847 () Bool)

(assert (=> d!55521 (=> res!88847 e!123684)))

(declare-fun lt!92977 () Bool)

(assert (=> d!55521 (= res!88847 (not lt!92977))))

(declare-fun lt!92979 () Bool)

(assert (=> d!55521 (= lt!92977 lt!92979)))

(declare-fun lt!92976 () Unit!5661)

(declare-fun e!123685 () Unit!5661)

(assert (=> d!55521 (= lt!92976 e!123685)))

(declare-fun c!33757 () Bool)

(assert (=> d!55521 (= c!33757 lt!92979)))

(declare-fun containsKey!233 (List!2385 (_ BitVec 64)) Bool)

(assert (=> d!55521 (= lt!92979 (containsKey!233 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828))))

(assert (=> d!55521 (= (contains!1317 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)) key!828) lt!92977)))

(declare-fun b!187926 () Bool)

(declare-fun lt!92978 () Unit!5661)

(assert (=> b!187926 (= e!123685 lt!92978)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!181 (List!2385 (_ BitVec 64)) Unit!5661)

(assert (=> b!187926 (= lt!92978 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828))))

(declare-datatypes ((Option!235 0))(
  ( (Some!234 (v!4157 V!5499)) (None!233) )
))
(declare-fun isDefined!182 (Option!235) Bool)

(declare-fun getValueByKey!229 (List!2385 (_ BitVec 64)) Option!235)

(assert (=> b!187926 (isDefined!182 (getValueByKey!229 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828))))

(declare-fun b!187927 () Bool)

(declare-fun Unit!5667 () Unit!5661)

(assert (=> b!187927 (= e!123685 Unit!5667)))

(declare-fun b!187928 () Bool)

(assert (=> b!187928 (= e!123684 (isDefined!182 (getValueByKey!229 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828)))))

(assert (= (and d!55521 c!33757) b!187926))

(assert (= (and d!55521 (not c!33757)) b!187927))

(assert (= (and d!55521 (not res!88847)) b!187928))

(declare-fun m!214663 () Bool)

(assert (=> d!55521 m!214663))

(declare-fun m!214665 () Bool)

(assert (=> b!187926 m!214665))

(declare-fun m!214667 () Bool)

(assert (=> b!187926 m!214667))

(assert (=> b!187926 m!214667))

(declare-fun m!214669 () Bool)

(assert (=> b!187926 m!214669))

(assert (=> b!187928 m!214667))

(assert (=> b!187928 m!214667))

(assert (=> b!187928 m!214669))

(assert (=> b!187823 d!55521))

(declare-fun c!33773 () Bool)

(declare-fun c!33771 () Bool)

(declare-fun call!18951 () ListLongMap!2399)

(declare-fun call!18949 () ListLongMap!2399)

(declare-fun call!18954 () ListLongMap!2399)

(declare-fun bm!18946 () Bool)

(declare-fun call!18952 () ListLongMap!2399)

(declare-fun +!292 (ListLongMap!2399 tuple2!3482) ListLongMap!2399)

(assert (=> bm!18946 (= call!18949 (+!292 (ite c!33773 call!18952 (ite c!33771 call!18951 call!18954)) (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))))))

(declare-fun b!187971 () Bool)

(declare-fun e!123721 () Bool)

(declare-fun e!123720 () Bool)

(assert (=> b!187971 (= e!123721 e!123720)))

(declare-fun res!88868 () Bool)

(declare-fun call!18955 () Bool)

(assert (=> b!187971 (= res!88868 call!18955)))

(assert (=> b!187971 (=> (not res!88868) (not e!123720))))

(declare-fun bm!18947 () Bool)

(assert (=> bm!18947 (= call!18951 call!18952)))

(declare-fun b!187972 () Bool)

(declare-fun lt!93044 () ListLongMap!2399)

(declare-fun apply!172 (ListLongMap!2399 (_ BitVec 64)) V!5499)

(assert (=> b!187972 (= e!123720 (= (apply!172 lt!93044 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3672 thiss!1248)))))

(declare-fun b!187973 () Bool)

(declare-fun c!33774 () Bool)

(assert (=> b!187973 (= c!33774 (and (not (= (bvand (extraKeys!3568 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3568 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!123714 () ListLongMap!2399)

(declare-fun e!123718 () ListLongMap!2399)

(assert (=> b!187973 (= e!123714 e!123718)))

(declare-fun b!187974 () Bool)

(declare-fun res!88866 () Bool)

(declare-fun e!123723 () Bool)

(assert (=> b!187974 (=> (not res!88866) (not e!123723))))

(assert (=> b!187974 (= res!88866 e!123721)))

(declare-fun c!33770 () Bool)

(assert (=> b!187974 (= c!33770 (not (= (bvand (extraKeys!3568 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!187975 () Bool)

(declare-fun e!123722 () Unit!5661)

(declare-fun Unit!5668 () Unit!5661)

(assert (=> b!187975 (= e!123722 Unit!5668)))

(declare-fun bm!18948 () Bool)

(declare-fun call!18950 () Bool)

(assert (=> bm!18948 (= call!18950 (contains!1317 lt!93044 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187976 () Bool)

(declare-fun e!123717 () Bool)

(assert (=> b!187976 (= e!123717 (= (apply!172 lt!93044 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3672 thiss!1248)))))

(declare-fun d!55523 () Bool)

(assert (=> d!55523 e!123723))

(declare-fun res!88873 () Bool)

(assert (=> d!55523 (=> (not res!88873) (not e!123723))))

(assert (=> d!55523 (= res!88873 (or (bvsge #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))))

(declare-fun lt!93038 () ListLongMap!2399)

(assert (=> d!55523 (= lt!93044 lt!93038)))

(declare-fun lt!93028 () Unit!5661)

(assert (=> d!55523 (= lt!93028 e!123722)))

(declare-fun c!33772 () Bool)

(declare-fun e!123713 () Bool)

(assert (=> d!55523 (= c!33772 e!123713)))

(declare-fun res!88870 () Bool)

(assert (=> d!55523 (=> (not res!88870) (not e!123713))))

(assert (=> d!55523 (= res!88870 (bvslt #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun e!123716 () ListLongMap!2399)

(assert (=> d!55523 (= lt!93038 e!123716)))

(assert (=> d!55523 (= c!33773 (and (not (= (bvand (extraKeys!3568 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3568 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55523 (validMask!0 (mask!8985 thiss!1248))))

(assert (=> d!55523 (= (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)) lt!93044)))

(declare-fun bm!18949 () Bool)

(assert (=> bm!18949 (= call!18955 (contains!1317 lt!93044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187977 () Bool)

(declare-fun lt!93034 () Unit!5661)

(assert (=> b!187977 (= e!123722 lt!93034)))

(declare-fun lt!93030 () ListLongMap!2399)

(declare-fun getCurrentListMapNoExtraKeys!205 (array!7997 array!7999 (_ BitVec 32) (_ BitVec 32) V!5499 V!5499 (_ BitVec 32) Int) ListLongMap!2399)

(assert (=> b!187977 (= lt!93030 (getCurrentListMapNoExtraKeys!205 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))))

(declare-fun lt!93037 () (_ BitVec 64))

(assert (=> b!187977 (= lt!93037 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93026 () (_ BitVec 64))

(assert (=> b!187977 (= lt!93026 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93043 () Unit!5661)

(declare-fun addStillContains!148 (ListLongMap!2399 (_ BitVec 64) V!5499 (_ BitVec 64)) Unit!5661)

(assert (=> b!187977 (= lt!93043 (addStillContains!148 lt!93030 lt!93037 (zeroValue!3672 thiss!1248) lt!93026))))

(assert (=> b!187977 (contains!1317 (+!292 lt!93030 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248))) lt!93026)))

(declare-fun lt!93032 () Unit!5661)

(assert (=> b!187977 (= lt!93032 lt!93043)))

(declare-fun lt!93039 () ListLongMap!2399)

(assert (=> b!187977 (= lt!93039 (getCurrentListMapNoExtraKeys!205 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))))

(declare-fun lt!93033 () (_ BitVec 64))

(assert (=> b!187977 (= lt!93033 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93025 () (_ BitVec 64))

(assert (=> b!187977 (= lt!93025 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93040 () Unit!5661)

(declare-fun addApplyDifferent!148 (ListLongMap!2399 (_ BitVec 64) V!5499 (_ BitVec 64)) Unit!5661)

(assert (=> b!187977 (= lt!93040 (addApplyDifferent!148 lt!93039 lt!93033 (minValue!3672 thiss!1248) lt!93025))))

(assert (=> b!187977 (= (apply!172 (+!292 lt!93039 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248))) lt!93025) (apply!172 lt!93039 lt!93025))))

(declare-fun lt!93035 () Unit!5661)

(assert (=> b!187977 (= lt!93035 lt!93040)))

(declare-fun lt!93024 () ListLongMap!2399)

(assert (=> b!187977 (= lt!93024 (getCurrentListMapNoExtraKeys!205 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))))

(declare-fun lt!93029 () (_ BitVec 64))

(assert (=> b!187977 (= lt!93029 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93036 () (_ BitVec 64))

(assert (=> b!187977 (= lt!93036 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93027 () Unit!5661)

(assert (=> b!187977 (= lt!93027 (addApplyDifferent!148 lt!93024 lt!93029 (zeroValue!3672 thiss!1248) lt!93036))))

(assert (=> b!187977 (= (apply!172 (+!292 lt!93024 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248))) lt!93036) (apply!172 lt!93024 lt!93036))))

(declare-fun lt!93045 () Unit!5661)

(assert (=> b!187977 (= lt!93045 lt!93027)))

(declare-fun lt!93031 () ListLongMap!2399)

(assert (=> b!187977 (= lt!93031 (getCurrentListMapNoExtraKeys!205 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))))

(declare-fun lt!93041 () (_ BitVec 64))

(assert (=> b!187977 (= lt!93041 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93042 () (_ BitVec 64))

(assert (=> b!187977 (= lt!93042 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187977 (= lt!93034 (addApplyDifferent!148 lt!93031 lt!93041 (minValue!3672 thiss!1248) lt!93042))))

(assert (=> b!187977 (= (apply!172 (+!292 lt!93031 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248))) lt!93042) (apply!172 lt!93031 lt!93042))))

(declare-fun b!187978 () Bool)

(declare-fun e!123715 () Bool)

(assert (=> b!187978 (= e!123715 (not call!18950))))

(declare-fun b!187979 () Bool)

(assert (=> b!187979 (= e!123716 (+!292 call!18949 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))))))

(declare-fun b!187980 () Bool)

(declare-fun res!88874 () Bool)

(assert (=> b!187980 (=> (not res!88874) (not e!123723))))

(declare-fun e!123712 () Bool)

(assert (=> b!187980 (= res!88874 e!123712)))

(declare-fun res!88867 () Bool)

(assert (=> b!187980 (=> res!88867 e!123712)))

(declare-fun e!123724 () Bool)

(assert (=> b!187980 (= res!88867 (not e!123724))))

(declare-fun res!88872 () Bool)

(assert (=> b!187980 (=> (not res!88872) (not e!123724))))

(assert (=> b!187980 (= res!88872 (bvslt #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun b!187981 () Bool)

(assert (=> b!187981 (= e!123715 e!123717)))

(declare-fun res!88871 () Bool)

(assert (=> b!187981 (= res!88871 call!18950)))

(assert (=> b!187981 (=> (not res!88871) (not e!123717))))

(declare-fun bm!18950 () Bool)

(assert (=> bm!18950 (= call!18954 call!18951)))

(declare-fun bm!18951 () Bool)

(declare-fun call!18953 () ListLongMap!2399)

(assert (=> bm!18951 (= call!18953 call!18949)))

(declare-fun b!187982 () Bool)

(assert (=> b!187982 (= e!123723 e!123715)))

(declare-fun c!33775 () Bool)

(assert (=> b!187982 (= c!33775 (not (= (bvand (extraKeys!3568 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!187983 () Bool)

(assert (=> b!187983 (= e!123718 call!18954)))

(declare-fun b!187984 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!187984 (= e!123713 (validKeyInArray!0 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18952 () Bool)

(assert (=> bm!18952 (= call!18952 (getCurrentListMapNoExtraKeys!205 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))))

(declare-fun b!187985 () Bool)

(assert (=> b!187985 (= e!123724 (validKeyInArray!0 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187986 () Bool)

(assert (=> b!187986 (= e!123721 (not call!18955))))

(declare-fun b!187987 () Bool)

(declare-fun e!123719 () Bool)

(assert (=> b!187987 (= e!123712 e!123719)))

(declare-fun res!88869 () Bool)

(assert (=> b!187987 (=> (not res!88869) (not e!123719))))

(assert (=> b!187987 (= res!88869 (contains!1317 lt!93044 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187987 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun b!187988 () Bool)

(assert (=> b!187988 (= e!123716 e!123714)))

(assert (=> b!187988 (= c!33771 (and (not (= (bvand (extraKeys!3568 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3568 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!187989 () Bool)

(assert (=> b!187989 (= e!123718 call!18953)))

(declare-fun b!187990 () Bool)

(assert (=> b!187990 (= e!123714 call!18953)))

(declare-fun b!187991 () Bool)

(declare-fun get!2172 (ValueCell!1851 V!5499) V!5499)

(declare-fun dynLambda!515 (Int (_ BitVec 64)) V!5499)

(assert (=> b!187991 (= e!123719 (= (apply!172 lt!93044 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)) (get!2172 (select (arr!3774 (_values!3814 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3831 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187991 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4093 (_values!3814 thiss!1248))))))

(assert (=> b!187991 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(assert (= (and d!55523 c!33773) b!187979))

(assert (= (and d!55523 (not c!33773)) b!187988))

(assert (= (and b!187988 c!33771) b!187990))

(assert (= (and b!187988 (not c!33771)) b!187973))

(assert (= (and b!187973 c!33774) b!187989))

(assert (= (and b!187973 (not c!33774)) b!187983))

(assert (= (or b!187989 b!187983) bm!18950))

(assert (= (or b!187990 bm!18950) bm!18947))

(assert (= (or b!187990 b!187989) bm!18951))

(assert (= (or b!187979 bm!18947) bm!18952))

(assert (= (or b!187979 bm!18951) bm!18946))

(assert (= (and d!55523 res!88870) b!187984))

(assert (= (and d!55523 c!33772) b!187977))

(assert (= (and d!55523 (not c!33772)) b!187975))

(assert (= (and d!55523 res!88873) b!187980))

(assert (= (and b!187980 res!88872) b!187985))

(assert (= (and b!187980 (not res!88867)) b!187987))

(assert (= (and b!187987 res!88869) b!187991))

(assert (= (and b!187980 res!88874) b!187974))

(assert (= (and b!187974 c!33770) b!187971))

(assert (= (and b!187974 (not c!33770)) b!187986))

(assert (= (and b!187971 res!88868) b!187972))

(assert (= (or b!187971 b!187986) bm!18949))

(assert (= (and b!187974 res!88866) b!187982))

(assert (= (and b!187982 c!33775) b!187981))

(assert (= (and b!187982 (not c!33775)) b!187978))

(assert (= (and b!187981 res!88871) b!187976))

(assert (= (or b!187981 b!187978) bm!18948))

(declare-fun b_lambda!7299 () Bool)

(assert (=> (not b_lambda!7299) (not b!187991)))

(declare-fun t!7282 () Bool)

(declare-fun tb!2855 () Bool)

(assert (=> (and b!187829 (= (defaultEntry!3831 thiss!1248) (defaultEntry!3831 thiss!1248)) t!7282) tb!2855))

(declare-fun result!4843 () Bool)

(assert (=> tb!2855 (= result!4843 tp_is_empty!4389)))

(assert (=> b!187991 t!7282))

(declare-fun b_and!11245 () Bool)

(assert (= b_and!11241 (and (=> t!7282 result!4843) b_and!11245)))

(assert (=> d!55523 m!214587))

(declare-fun m!214671 () Bool)

(assert (=> b!187985 m!214671))

(assert (=> b!187985 m!214671))

(declare-fun m!214673 () Bool)

(assert (=> b!187985 m!214673))

(assert (=> b!187991 m!214671))

(declare-fun m!214675 () Bool)

(assert (=> b!187991 m!214675))

(declare-fun m!214677 () Bool)

(assert (=> b!187991 m!214677))

(declare-fun m!214679 () Bool)

(assert (=> b!187991 m!214679))

(declare-fun m!214681 () Bool)

(assert (=> b!187991 m!214681))

(assert (=> b!187991 m!214679))

(assert (=> b!187991 m!214677))

(assert (=> b!187991 m!214671))

(declare-fun m!214683 () Bool)

(assert (=> bm!18952 m!214683))

(declare-fun m!214685 () Bool)

(assert (=> bm!18948 m!214685))

(assert (=> b!187987 m!214671))

(assert (=> b!187987 m!214671))

(declare-fun m!214687 () Bool)

(assert (=> b!187987 m!214687))

(declare-fun m!214689 () Bool)

(assert (=> b!187972 m!214689))

(declare-fun m!214691 () Bool)

(assert (=> b!187976 m!214691))

(declare-fun m!214693 () Bool)

(assert (=> b!187979 m!214693))

(declare-fun m!214695 () Bool)

(assert (=> b!187977 m!214695))

(declare-fun m!214697 () Bool)

(assert (=> b!187977 m!214697))

(declare-fun m!214699 () Bool)

(assert (=> b!187977 m!214699))

(declare-fun m!214701 () Bool)

(assert (=> b!187977 m!214701))

(declare-fun m!214703 () Bool)

(assert (=> b!187977 m!214703))

(declare-fun m!214705 () Bool)

(assert (=> b!187977 m!214705))

(declare-fun m!214707 () Bool)

(assert (=> b!187977 m!214707))

(assert (=> b!187977 m!214695))

(assert (=> b!187977 m!214705))

(declare-fun m!214709 () Bool)

(assert (=> b!187977 m!214709))

(declare-fun m!214711 () Bool)

(assert (=> b!187977 m!214711))

(declare-fun m!214713 () Bool)

(assert (=> b!187977 m!214713))

(declare-fun m!214715 () Bool)

(assert (=> b!187977 m!214715))

(assert (=> b!187977 m!214701))

(assert (=> b!187977 m!214713))

(declare-fun m!214717 () Bool)

(assert (=> b!187977 m!214717))

(assert (=> b!187977 m!214683))

(declare-fun m!214719 () Bool)

(assert (=> b!187977 m!214719))

(assert (=> b!187977 m!214671))

(declare-fun m!214721 () Bool)

(assert (=> b!187977 m!214721))

(declare-fun m!214723 () Bool)

(assert (=> b!187977 m!214723))

(declare-fun m!214725 () Bool)

(assert (=> bm!18949 m!214725))

(assert (=> b!187984 m!214671))

(assert (=> b!187984 m!214671))

(assert (=> b!187984 m!214673))

(declare-fun m!214727 () Bool)

(assert (=> bm!18946 m!214727))

(assert (=> b!187823 d!55523))

(declare-fun mapNonEmpty!7569 () Bool)

(declare-fun mapRes!7569 () Bool)

(declare-fun tp!16677 () Bool)

(declare-fun e!123730 () Bool)

(assert (=> mapNonEmpty!7569 (= mapRes!7569 (and tp!16677 e!123730))))

(declare-fun mapValue!7569 () ValueCell!1851)

(declare-fun mapKey!7569 () (_ BitVec 32))

(declare-fun mapRest!7569 () (Array (_ BitVec 32) ValueCell!1851))

(assert (=> mapNonEmpty!7569 (= mapRest!7563 (store mapRest!7569 mapKey!7569 mapValue!7569))))

(declare-fun mapIsEmpty!7569 () Bool)

(assert (=> mapIsEmpty!7569 mapRes!7569))

(declare-fun condMapEmpty!7569 () Bool)

(declare-fun mapDefault!7569 () ValueCell!1851)

(assert (=> mapNonEmpty!7563 (= condMapEmpty!7569 (= mapRest!7563 ((as const (Array (_ BitVec 32) ValueCell!1851)) mapDefault!7569)))))

(declare-fun e!123729 () Bool)

(assert (=> mapNonEmpty!7563 (= tp!16667 (and e!123729 mapRes!7569))))

(declare-fun b!188000 () Bool)

(assert (=> b!188000 (= e!123730 tp_is_empty!4389)))

(declare-fun b!188001 () Bool)

(assert (=> b!188001 (= e!123729 tp_is_empty!4389)))

(assert (= (and mapNonEmpty!7563 condMapEmpty!7569) mapIsEmpty!7569))

(assert (= (and mapNonEmpty!7563 (not condMapEmpty!7569)) mapNonEmpty!7569))

(assert (= (and mapNonEmpty!7569 ((_ is ValueCellFull!1851) mapValue!7569)) b!188000))

(assert (= (and mapNonEmpty!7563 ((_ is ValueCellFull!1851) mapDefault!7569)) b!188001))

(declare-fun m!214729 () Bool)

(assert (=> mapNonEmpty!7569 m!214729))

(declare-fun b_lambda!7301 () Bool)

(assert (= b_lambda!7299 (or (and b!187829 b_free!4617) b_lambda!7301)))

(check-sat (not b!187928) (not b!187976) (not d!55523) (not d!55521) (not d!55511) (not d!55513) (not b_lambda!7301) (not b!187991) (not bm!18931) (not b!187977) b_and!11245 (not b!187917) (not b!187987) (not b!187984) (not b_next!4617) (not bm!18949) (not b!187985) tp_is_empty!4389 (not b!187926) (not b!187918) (not d!55509) (not mapNonEmpty!7569) (not bm!18946) (not bm!18930) (not d!55517) (not b!187919) (not bm!18952) (not b!187876) (not b!187972) (not bm!18948) (not b!187909) (not b!187979))
(check-sat b_and!11245 (not b_next!4617))
(get-model)

(declare-fun d!55525 () Bool)

(assert (=> d!55525 (= (validKeyInArray!0 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187984 d!55525))

(declare-fun b!188010 () Bool)

(declare-fun e!123739 () Bool)

(declare-fun e!123738 () Bool)

(assert (=> b!188010 (= e!123739 e!123738)))

(declare-fun lt!93054 () (_ BitVec 64))

(assert (=> b!188010 (= lt!93054 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93053 () Unit!5661)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7997 (_ BitVec 64) (_ BitVec 32)) Unit!5661)

(assert (=> b!188010 (= lt!93053 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5786 thiss!1248) lt!93054 #b00000000000000000000000000000000))))

(assert (=> b!188010 (arrayContainsKey!0 (_keys!5786 thiss!1248) lt!93054 #b00000000000000000000000000000000)))

(declare-fun lt!93052 () Unit!5661)

(assert (=> b!188010 (= lt!93052 lt!93053)))

(declare-fun res!88879 () Bool)

(assert (=> b!188010 (= res!88879 (= (seekEntryOrOpen!0 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000) (_keys!5786 thiss!1248) (mask!8985 thiss!1248)) (Found!650 #b00000000000000000000000000000000)))))

(assert (=> b!188010 (=> (not res!88879) (not e!123738))))

(declare-fun bm!18955 () Bool)

(declare-fun call!18958 () Bool)

(assert (=> bm!18955 (= call!18958 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(declare-fun d!55527 () Bool)

(declare-fun res!88880 () Bool)

(declare-fun e!123737 () Bool)

(assert (=> d!55527 (=> res!88880 e!123737)))

(assert (=> d!55527 (= res!88880 (bvsge #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(assert (=> d!55527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)) e!123737)))

(declare-fun b!188011 () Bool)

(assert (=> b!188011 (= e!123737 e!123739)))

(declare-fun c!33778 () Bool)

(assert (=> b!188011 (= c!33778 (validKeyInArray!0 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188012 () Bool)

(assert (=> b!188012 (= e!123738 call!18958)))

(declare-fun b!188013 () Bool)

(assert (=> b!188013 (= e!123739 call!18958)))

(assert (= (and d!55527 (not res!88880)) b!188011))

(assert (= (and b!188011 c!33778) b!188010))

(assert (= (and b!188011 (not c!33778)) b!188013))

(assert (= (and b!188010 res!88879) b!188012))

(assert (= (or b!188012 b!188013) bm!18955))

(assert (=> b!188010 m!214671))

(declare-fun m!214731 () Bool)

(assert (=> b!188010 m!214731))

(declare-fun m!214733 () Bool)

(assert (=> b!188010 m!214733))

(assert (=> b!188010 m!214671))

(declare-fun m!214735 () Bool)

(assert (=> b!188010 m!214735))

(declare-fun m!214737 () Bool)

(assert (=> bm!18955 m!214737))

(assert (=> b!188011 m!214671))

(assert (=> b!188011 m!214671))

(assert (=> b!188011 m!214673))

(assert (=> b!187918 d!55527))

(assert (=> d!55523 d!55519))

(declare-fun bm!18958 () Bool)

(declare-fun call!18961 () (_ BitVec 32))

(assert (=> bm!18958 (= call!18961 (arrayCountValidKeys!0 (_keys!5786 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun b!188022 () Bool)

(declare-fun e!123745 () (_ BitVec 32))

(assert (=> b!188022 (= e!123745 (bvadd #b00000000000000000000000000000001 call!18961))))

(declare-fun b!188023 () Bool)

(declare-fun e!123744 () (_ BitVec 32))

(assert (=> b!188023 (= e!123744 e!123745)))

(declare-fun c!33784 () Bool)

(assert (=> b!188023 (= c!33784 (validKeyInArray!0 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188024 () Bool)

(assert (=> b!188024 (= e!123744 #b00000000000000000000000000000000)))

(declare-fun b!188025 () Bool)

(assert (=> b!188025 (= e!123745 call!18961)))

(declare-fun d!55529 () Bool)

(declare-fun lt!93057 () (_ BitVec 32))

(assert (=> d!55529 (and (bvsge lt!93057 #b00000000000000000000000000000000) (bvsle lt!93057 (bvsub (size!4092 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55529 (= lt!93057 e!123744)))

(declare-fun c!33783 () Bool)

(assert (=> d!55529 (= c!33783 (bvsge #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(assert (=> d!55529 (and (bvsle #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4092 (_keys!5786 thiss!1248)) (size!4092 (_keys!5786 thiss!1248))))))

(assert (=> d!55529 (= (arrayCountValidKeys!0 (_keys!5786 thiss!1248) #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))) lt!93057)))

(assert (= (and d!55529 c!33783) b!188024))

(assert (= (and d!55529 (not c!33783)) b!188023))

(assert (= (and b!188023 c!33784) b!188022))

(assert (= (and b!188023 (not c!33784)) b!188025))

(assert (= (or b!188022 b!188025) bm!18958))

(declare-fun m!214739 () Bool)

(assert (=> bm!18958 m!214739))

(assert (=> b!188023 m!214671))

(assert (=> b!188023 m!214671))

(assert (=> b!188023 m!214673))

(assert (=> b!187917 d!55529))

(declare-fun d!55531 () Bool)

(declare-fun res!88891 () Bool)

(declare-fun e!123748 () Bool)

(assert (=> d!55531 (=> (not res!88891) (not e!123748))))

(assert (=> d!55531 (= res!88891 (validMask!0 (mask!8985 thiss!1248)))))

(assert (=> d!55531 (= (simpleValid!188 thiss!1248) e!123748)))

(declare-fun b!188034 () Bool)

(declare-fun res!88892 () Bool)

(assert (=> b!188034 (=> (not res!88892) (not e!123748))))

(assert (=> b!188034 (= res!88892 (and (= (size!4093 (_values!3814 thiss!1248)) (bvadd (mask!8985 thiss!1248) #b00000000000000000000000000000001)) (= (size!4092 (_keys!5786 thiss!1248)) (size!4093 (_values!3814 thiss!1248))) (bvsge (_size!1354 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1354 thiss!1248) (bvadd (mask!8985 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!188035 () Bool)

(declare-fun res!88889 () Bool)

(assert (=> b!188035 (=> (not res!88889) (not e!123748))))

(declare-fun size!4096 (LongMapFixedSize!2610) (_ BitVec 32))

(assert (=> b!188035 (= res!88889 (bvsge (size!4096 thiss!1248) (_size!1354 thiss!1248)))))

(declare-fun b!188036 () Bool)

(declare-fun res!88890 () Bool)

(assert (=> b!188036 (=> (not res!88890) (not e!123748))))

(assert (=> b!188036 (= res!88890 (= (size!4096 thiss!1248) (bvadd (_size!1354 thiss!1248) (bvsdiv (bvadd (extraKeys!3568 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!188037 () Bool)

(assert (=> b!188037 (= e!123748 (and (bvsge (extraKeys!3568 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3568 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1354 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!55531 res!88891) b!188034))

(assert (= (and b!188034 res!88892) b!188035))

(assert (= (and b!188035 res!88889) b!188036))

(assert (= (and b!188036 res!88890) b!188037))

(assert (=> d!55531 m!214587))

(declare-fun m!214741 () Bool)

(assert (=> b!188035 m!214741))

(assert (=> b!188036 m!214741))

(assert (=> d!55517 d!55531))

(assert (=> b!187985 d!55525))

(declare-fun d!55533 () Bool)

(declare-fun e!123751 () Bool)

(assert (=> d!55533 e!123751))

(declare-fun res!88898 () Bool)

(assert (=> d!55533 (=> (not res!88898) (not e!123751))))

(declare-fun lt!93068 () ListLongMap!2399)

(assert (=> d!55533 (= res!88898 (contains!1317 lt!93068 (_1!1752 (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))))))))

(declare-fun lt!93066 () List!2385)

(assert (=> d!55533 (= lt!93068 (ListLongMap!2400 lt!93066))))

(declare-fun lt!93067 () Unit!5661)

(declare-fun lt!93069 () Unit!5661)

(assert (=> d!55533 (= lt!93067 lt!93069)))

(assert (=> d!55533 (= (getValueByKey!229 lt!93066 (_1!1752 (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))))) (Some!234 (_2!1752 (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!120 (List!2385 (_ BitVec 64) V!5499) Unit!5661)

(assert (=> d!55533 (= lt!93069 (lemmaContainsTupThenGetReturnValue!120 lt!93066 (_1!1752 (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))) (_2!1752 (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))))))))

(declare-fun insertStrictlySorted!123 (List!2385 (_ BitVec 64) V!5499) List!2385)

(assert (=> d!55533 (= lt!93066 (insertStrictlySorted!123 (toList!1215 (ite c!33773 call!18952 (ite c!33771 call!18951 call!18954))) (_1!1752 (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))) (_2!1752 (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))))))))

(assert (=> d!55533 (= (+!292 (ite c!33773 call!18952 (ite c!33771 call!18951 call!18954)) (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))) lt!93068)))

(declare-fun b!188042 () Bool)

(declare-fun res!88897 () Bool)

(assert (=> b!188042 (=> (not res!88897) (not e!123751))))

(assert (=> b!188042 (= res!88897 (= (getValueByKey!229 (toList!1215 lt!93068) (_1!1752 (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))))) (Some!234 (_2!1752 (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))))))))

(declare-fun b!188043 () Bool)

(declare-fun contains!1319 (List!2385 tuple2!3482) Bool)

(assert (=> b!188043 (= e!123751 (contains!1319 (toList!1215 lt!93068) (ite (or c!33773 c!33771) (tuple2!3483 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3672 thiss!1248)) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))))))

(assert (= (and d!55533 res!88898) b!188042))

(assert (= (and b!188042 res!88897) b!188043))

(declare-fun m!214743 () Bool)

(assert (=> d!55533 m!214743))

(declare-fun m!214745 () Bool)

(assert (=> d!55533 m!214745))

(declare-fun m!214747 () Bool)

(assert (=> d!55533 m!214747))

(declare-fun m!214749 () Bool)

(assert (=> d!55533 m!214749))

(declare-fun m!214751 () Bool)

(assert (=> b!188042 m!214751))

(declare-fun m!214753 () Bool)

(assert (=> b!188043 m!214753))

(assert (=> bm!18946 d!55533))

(declare-fun b!188068 () Bool)

(declare-fun e!123772 () ListLongMap!2399)

(declare-fun call!18964 () ListLongMap!2399)

(assert (=> b!188068 (= e!123772 call!18964)))

(declare-fun b!188069 () Bool)

(declare-fun e!123770 () Bool)

(declare-fun e!123769 () Bool)

(assert (=> b!188069 (= e!123770 e!123769)))

(declare-fun c!33794 () Bool)

(assert (=> b!188069 (= c!33794 (bvslt #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun b!188070 () Bool)

(declare-fun e!123767 () Bool)

(assert (=> b!188070 (= e!123767 e!123770)))

(declare-fun c!33795 () Bool)

(declare-fun e!123771 () Bool)

(assert (=> b!188070 (= c!33795 e!123771)))

(declare-fun res!88909 () Bool)

(assert (=> b!188070 (=> (not res!88909) (not e!123771))))

(assert (=> b!188070 (= res!88909 (bvslt #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun b!188071 () Bool)

(declare-fun e!123768 () Bool)

(assert (=> b!188071 (= e!123770 e!123768)))

(assert (=> b!188071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun res!88908 () Bool)

(declare-fun lt!93088 () ListLongMap!2399)

(assert (=> b!188071 (= res!88908 (contains!1317 lt!93088 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188071 (=> (not res!88908) (not e!123768))))

(declare-fun b!188072 () Bool)

(assert (=> b!188072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(assert (=> b!188072 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4093 (_values!3814 thiss!1248))))))

(assert (=> b!188072 (= e!123768 (= (apply!172 lt!93088 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)) (get!2172 (select (arr!3774 (_values!3814 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3831 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!188073 () Bool)

(declare-fun isEmpty!477 (ListLongMap!2399) Bool)

(assert (=> b!188073 (= e!123769 (isEmpty!477 lt!93088))))

(declare-fun b!188074 () Bool)

(declare-fun e!123766 () ListLongMap!2399)

(assert (=> b!188074 (= e!123766 (ListLongMap!2400 Nil!2382))))

(declare-fun d!55535 () Bool)

(assert (=> d!55535 e!123767))

(declare-fun res!88910 () Bool)

(assert (=> d!55535 (=> (not res!88910) (not e!123767))))

(assert (=> d!55535 (= res!88910 (not (contains!1317 lt!93088 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55535 (= lt!93088 e!123766)))

(declare-fun c!33793 () Bool)

(assert (=> d!55535 (= c!33793 (bvsge #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(assert (=> d!55535 (validMask!0 (mask!8985 thiss!1248))))

(assert (=> d!55535 (= (getCurrentListMapNoExtraKeys!205 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)) lt!93088)))

(declare-fun b!188075 () Bool)

(assert (=> b!188075 (= e!123771 (validKeyInArray!0 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188075 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!18961 () Bool)

(assert (=> bm!18961 (= call!18964 (getCurrentListMapNoExtraKeys!205 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3831 thiss!1248)))))

(declare-fun b!188076 () Bool)

(assert (=> b!188076 (= e!123766 e!123772)))

(declare-fun c!33796 () Bool)

(assert (=> b!188076 (= c!33796 (validKeyInArray!0 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188077 () Bool)

(assert (=> b!188077 (= e!123769 (= lt!93088 (getCurrentListMapNoExtraKeys!205 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3831 thiss!1248))))))

(declare-fun b!188078 () Bool)

(declare-fun res!88907 () Bool)

(assert (=> b!188078 (=> (not res!88907) (not e!123767))))

(assert (=> b!188078 (= res!88907 (not (contains!1317 lt!93088 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!188079 () Bool)

(declare-fun lt!93085 () Unit!5661)

(declare-fun lt!93084 () Unit!5661)

(assert (=> b!188079 (= lt!93085 lt!93084)))

(declare-fun lt!93090 () (_ BitVec 64))

(declare-fun lt!93089 () (_ BitVec 64))

(declare-fun lt!93086 () ListLongMap!2399)

(declare-fun lt!93087 () V!5499)

(assert (=> b!188079 (not (contains!1317 (+!292 lt!93086 (tuple2!3483 lt!93090 lt!93087)) lt!93089))))

(declare-fun addStillNotContains!92 (ListLongMap!2399 (_ BitVec 64) V!5499 (_ BitVec 64)) Unit!5661)

(assert (=> b!188079 (= lt!93084 (addStillNotContains!92 lt!93086 lt!93090 lt!93087 lt!93089))))

(assert (=> b!188079 (= lt!93089 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!188079 (= lt!93087 (get!2172 (select (arr!3774 (_values!3814 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3831 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188079 (= lt!93090 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188079 (= lt!93086 call!18964)))

(assert (=> b!188079 (= e!123772 (+!292 call!18964 (tuple2!3483 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000) (get!2172 (select (arr!3774 (_values!3814 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3831 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!55535 c!33793) b!188074))

(assert (= (and d!55535 (not c!33793)) b!188076))

(assert (= (and b!188076 c!33796) b!188079))

(assert (= (and b!188076 (not c!33796)) b!188068))

(assert (= (or b!188079 b!188068) bm!18961))

(assert (= (and d!55535 res!88910) b!188078))

(assert (= (and b!188078 res!88907) b!188070))

(assert (= (and b!188070 res!88909) b!188075))

(assert (= (and b!188070 c!33795) b!188071))

(assert (= (and b!188070 (not c!33795)) b!188069))

(assert (= (and b!188071 res!88908) b!188072))

(assert (= (and b!188069 c!33794) b!188077))

(assert (= (and b!188069 (not c!33794)) b!188073))

(declare-fun b_lambda!7303 () Bool)

(assert (=> (not b_lambda!7303) (not b!188072)))

(assert (=> b!188072 t!7282))

(declare-fun b_and!11247 () Bool)

(assert (= b_and!11245 (and (=> t!7282 result!4843) b_and!11247)))

(declare-fun b_lambda!7305 () Bool)

(assert (=> (not b_lambda!7305) (not b!188079)))

(assert (=> b!188079 t!7282))

(declare-fun b_and!11249 () Bool)

(assert (= b_and!11247 (and (=> t!7282 result!4843) b_and!11249)))

(assert (=> b!188079 m!214677))

(assert (=> b!188079 m!214677))

(assert (=> b!188079 m!214679))

(assert (=> b!188079 m!214681))

(declare-fun m!214755 () Bool)

(assert (=> b!188079 m!214755))

(declare-fun m!214757 () Bool)

(assert (=> b!188079 m!214757))

(assert (=> b!188079 m!214757))

(declare-fun m!214759 () Bool)

(assert (=> b!188079 m!214759))

(declare-fun m!214761 () Bool)

(assert (=> b!188079 m!214761))

(assert (=> b!188079 m!214671))

(assert (=> b!188079 m!214679))

(assert (=> b!188075 m!214671))

(assert (=> b!188075 m!214671))

(assert (=> b!188075 m!214673))

(assert (=> b!188076 m!214671))

(assert (=> b!188076 m!214671))

(assert (=> b!188076 m!214673))

(declare-fun m!214763 () Bool)

(assert (=> bm!18961 m!214763))

(assert (=> b!188071 m!214671))

(assert (=> b!188071 m!214671))

(declare-fun m!214765 () Bool)

(assert (=> b!188071 m!214765))

(declare-fun m!214767 () Bool)

(assert (=> d!55535 m!214767))

(assert (=> d!55535 m!214587))

(declare-fun m!214769 () Bool)

(assert (=> b!188073 m!214769))

(assert (=> b!188077 m!214763))

(declare-fun m!214771 () Bool)

(assert (=> b!188078 m!214771))

(assert (=> b!188072 m!214677))

(assert (=> b!188072 m!214671))

(declare-fun m!214773 () Bool)

(assert (=> b!188072 m!214773))

(assert (=> b!188072 m!214677))

(assert (=> b!188072 m!214679))

(assert (=> b!188072 m!214681))

(assert (=> b!188072 m!214671))

(assert (=> b!188072 m!214679))

(assert (=> bm!18952 d!55535))

(declare-fun b!188090 () Bool)

(declare-fun e!123784 () Bool)

(declare-fun call!18967 () Bool)

(assert (=> b!188090 (= e!123784 call!18967)))

(declare-fun b!188091 () Bool)

(declare-fun e!123781 () Bool)

(declare-fun e!123783 () Bool)

(assert (=> b!188091 (= e!123781 e!123783)))

(declare-fun res!88919 () Bool)

(assert (=> b!188091 (=> (not res!88919) (not e!123783))))

(declare-fun e!123782 () Bool)

(assert (=> b!188091 (= res!88919 (not e!123782))))

(declare-fun res!88918 () Bool)

(assert (=> b!188091 (=> (not res!88918) (not e!123782))))

(assert (=> b!188091 (= res!88918 (validKeyInArray!0 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55537 () Bool)

(declare-fun res!88917 () Bool)

(assert (=> d!55537 (=> res!88917 e!123781)))

(assert (=> d!55537 (= res!88917 (bvsge #b00000000000000000000000000000000 (size!4092 (_keys!5786 thiss!1248))))))

(assert (=> d!55537 (= (arrayNoDuplicates!0 (_keys!5786 thiss!1248) #b00000000000000000000000000000000 Nil!2384) e!123781)))

(declare-fun b!188092 () Bool)

(declare-fun contains!1320 (List!2387 (_ BitVec 64)) Bool)

(assert (=> b!188092 (= e!123782 (contains!1320 Nil!2384 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188093 () Bool)

(assert (=> b!188093 (= e!123784 call!18967)))

(declare-fun bm!18964 () Bool)

(declare-fun c!33799 () Bool)

(assert (=> bm!18964 (= call!18967 (arrayNoDuplicates!0 (_keys!5786 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33799 (Cons!2383 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000) Nil!2384) Nil!2384)))))

(declare-fun b!188094 () Bool)

(assert (=> b!188094 (= e!123783 e!123784)))

(assert (=> b!188094 (= c!33799 (validKeyInArray!0 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55537 (not res!88917)) b!188091))

(assert (= (and b!188091 res!88918) b!188092))

(assert (= (and b!188091 res!88919) b!188094))

(assert (= (and b!188094 c!33799) b!188093))

(assert (= (and b!188094 (not c!33799)) b!188090))

(assert (= (or b!188093 b!188090) bm!18964))

(assert (=> b!188091 m!214671))

(assert (=> b!188091 m!214671))

(assert (=> b!188091 m!214673))

(assert (=> b!188092 m!214671))

(assert (=> b!188092 m!214671))

(declare-fun m!214775 () Bool)

(assert (=> b!188092 m!214775))

(assert (=> bm!18964 m!214671))

(declare-fun m!214777 () Bool)

(assert (=> bm!18964 m!214777))

(assert (=> b!188094 m!214671))

(assert (=> b!188094 m!214671))

(assert (=> b!188094 m!214673))

(assert (=> b!187919 d!55537))

(declare-fun d!55539 () Bool)

(declare-fun get!2173 (Option!235) V!5499)

(assert (=> d!55539 (= (apply!172 lt!93044 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2173 (getValueByKey!229 (toList!1215 lt!93044) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7576 () Bool)

(assert (= bs!7576 d!55539))

(declare-fun m!214779 () Bool)

(assert (=> bs!7576 m!214779))

(assert (=> bs!7576 m!214779))

(declare-fun m!214781 () Bool)

(assert (=> bs!7576 m!214781))

(assert (=> b!187972 d!55539))

(declare-fun d!55541 () Bool)

(assert (=> d!55541 (= (inRange!0 (ite c!33753 (index!4770 lt!92960) (index!4773 lt!92960)) (mask!8985 thiss!1248)) (and (bvsge (ite c!33753 (index!4770 lt!92960) (index!4773 lt!92960)) #b00000000000000000000000000000000) (bvslt (ite c!33753 (index!4770 lt!92960) (index!4773 lt!92960)) (bvadd (mask!8985 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18931 d!55541))

(declare-fun d!55543 () Bool)

(assert (=> d!55543 (= (inRange!0 (index!4771 lt!92966) (mask!8985 thiss!1248)) (and (bvsge (index!4771 lt!92966) #b00000000000000000000000000000000) (bvslt (index!4771 lt!92966) (bvadd (mask!8985 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187909 d!55543))

(declare-fun d!55545 () Bool)

(declare-fun e!123785 () Bool)

(assert (=> d!55545 e!123785))

(declare-fun res!88920 () Bool)

(assert (=> d!55545 (=> res!88920 e!123785)))

(declare-fun lt!93092 () Bool)

(assert (=> d!55545 (= res!88920 (not lt!93092))))

(declare-fun lt!93094 () Bool)

(assert (=> d!55545 (= lt!93092 lt!93094)))

(declare-fun lt!93091 () Unit!5661)

(declare-fun e!123786 () Unit!5661)

(assert (=> d!55545 (= lt!93091 e!123786)))

(declare-fun c!33800 () Bool)

(assert (=> d!55545 (= c!33800 lt!93094)))

(assert (=> d!55545 (= lt!93094 (containsKey!233 (toList!1215 lt!93044) (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55545 (= (contains!1317 lt!93044 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)) lt!93092)))

(declare-fun b!188095 () Bool)

(declare-fun lt!93093 () Unit!5661)

(assert (=> b!188095 (= e!123786 lt!93093)))

(assert (=> b!188095 (= lt!93093 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1215 lt!93044) (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188095 (isDefined!182 (getValueByKey!229 (toList!1215 lt!93044) (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188096 () Bool)

(declare-fun Unit!5669 () Unit!5661)

(assert (=> b!188096 (= e!123786 Unit!5669)))

(declare-fun b!188097 () Bool)

(assert (=> b!188097 (= e!123785 (isDefined!182 (getValueByKey!229 (toList!1215 lt!93044) (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55545 c!33800) b!188095))

(assert (= (and d!55545 (not c!33800)) b!188096))

(assert (= (and d!55545 (not res!88920)) b!188097))

(assert (=> d!55545 m!214671))

(declare-fun m!214783 () Bool)

(assert (=> d!55545 m!214783))

(assert (=> b!188095 m!214671))

(declare-fun m!214785 () Bool)

(assert (=> b!188095 m!214785))

(assert (=> b!188095 m!214671))

(declare-fun m!214787 () Bool)

(assert (=> b!188095 m!214787))

(assert (=> b!188095 m!214787))

(declare-fun m!214789 () Bool)

(assert (=> b!188095 m!214789))

(assert (=> b!188097 m!214671))

(assert (=> b!188097 m!214787))

(assert (=> b!188097 m!214787))

(assert (=> b!188097 m!214789))

(assert (=> b!187987 d!55545))

(declare-fun d!55547 () Bool)

(declare-fun res!88925 () Bool)

(declare-fun e!123791 () Bool)

(assert (=> d!55547 (=> res!88925 e!123791)))

(assert (=> d!55547 (= res!88925 (= (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55547 (= (arrayContainsKey!0 (_keys!5786 thiss!1248) key!828 #b00000000000000000000000000000000) e!123791)))

(declare-fun b!188102 () Bool)

(declare-fun e!123792 () Bool)

(assert (=> b!188102 (= e!123791 e!123792)))

(declare-fun res!88926 () Bool)

(assert (=> b!188102 (=> (not res!88926) (not e!123792))))

(assert (=> b!188102 (= res!88926 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun b!188103 () Bool)

(assert (=> b!188103 (= e!123792 (arrayContainsKey!0 (_keys!5786 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55547 (not res!88925)) b!188102))

(assert (= (and b!188102 res!88926) b!188103))

(assert (=> d!55547 m!214671))

(declare-fun m!214791 () Bool)

(assert (=> b!188103 m!214791))

(assert (=> bm!18930 d!55547))

(declare-fun b!188122 () Bool)

(declare-fun lt!93099 () SeekEntryResult!650)

(assert (=> b!188122 (and (bvsge (index!4772 lt!93099) #b00000000000000000000000000000000) (bvslt (index!4772 lt!93099) (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun res!88935 () Bool)

(assert (=> b!188122 (= res!88935 (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4772 lt!93099)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123803 () Bool)

(assert (=> b!188122 (=> res!88935 e!123803)))

(declare-fun b!188123 () Bool)

(assert (=> b!188123 (and (bvsge (index!4772 lt!93099) #b00000000000000000000000000000000) (bvslt (index!4772 lt!93099) (size!4092 (_keys!5786 thiss!1248))))))

(declare-fun res!88933 () Bool)

(assert (=> b!188123 (= res!88933 (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4772 lt!93099)) key!828))))

(assert (=> b!188123 (=> res!88933 e!123803)))

(declare-fun e!123806 () Bool)

(assert (=> b!188123 (= e!123806 e!123803)))

(declare-fun b!188124 () Bool)

(declare-fun e!123804 () SeekEntryResult!650)

(assert (=> b!188124 (= e!123804 (Intermediate!650 false (toIndex!0 key!828 (mask!8985 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!188125 () Bool)

(declare-fun e!123805 () Bool)

(assert (=> b!188125 (= e!123805 e!123806)))

(declare-fun res!88934 () Bool)

(assert (=> b!188125 (= res!88934 (and ((_ is Intermediate!650) lt!93099) (not (undefined!1462 lt!93099)) (bvslt (x!20310 lt!93099) #b01111111111111111111111111111110) (bvsge (x!20310 lt!93099) #b00000000000000000000000000000000) (bvsge (x!20310 lt!93099) #b00000000000000000000000000000000)))))

(assert (=> b!188125 (=> (not res!88934) (not e!123806))))

(declare-fun b!188126 () Bool)

(assert (=> b!188126 (and (bvsge (index!4772 lt!93099) #b00000000000000000000000000000000) (bvslt (index!4772 lt!93099) (size!4092 (_keys!5786 thiss!1248))))))

(assert (=> b!188126 (= e!123803 (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4772 lt!93099)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188127 () Bool)

(assert (=> b!188127 (= e!123805 (bvsge (x!20310 lt!93099) #b01111111111111111111111111111110))))

(declare-fun d!55549 () Bool)

(assert (=> d!55549 e!123805))

(declare-fun c!33807 () Bool)

(assert (=> d!55549 (= c!33807 (and ((_ is Intermediate!650) lt!93099) (undefined!1462 lt!93099)))))

(declare-fun e!123807 () SeekEntryResult!650)

(assert (=> d!55549 (= lt!93099 e!123807)))

(declare-fun c!33808 () Bool)

(assert (=> d!55549 (= c!33808 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!93100 () (_ BitVec 64))

(assert (=> d!55549 (= lt!93100 (select (arr!3773 (_keys!5786 thiss!1248)) (toIndex!0 key!828 (mask!8985 thiss!1248))))))

(assert (=> d!55549 (validMask!0 (mask!8985 thiss!1248))))

(assert (=> d!55549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8985 thiss!1248)) key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)) lt!93099)))

(declare-fun b!188128 () Bool)

(assert (=> b!188128 (= e!123807 e!123804)))

(declare-fun c!33809 () Bool)

(assert (=> b!188128 (= c!33809 (or (= lt!93100 key!828) (= (bvadd lt!93100 lt!93100) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!188129 () Bool)

(assert (=> b!188129 (= e!123807 (Intermediate!650 true (toIndex!0 key!828 (mask!8985 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!188130 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!188130 (= e!123804 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8985 thiss!1248)) #b00000000000000000000000000000000 (mask!8985 thiss!1248)) key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(assert (= (and d!55549 c!33808) b!188129))

(assert (= (and d!55549 (not c!33808)) b!188128))

(assert (= (and b!188128 c!33809) b!188124))

(assert (= (and b!188128 (not c!33809)) b!188130))

(assert (= (and d!55549 c!33807) b!188127))

(assert (= (and d!55549 (not c!33807)) b!188125))

(assert (= (and b!188125 res!88934) b!188123))

(assert (= (and b!188123 (not res!88933)) b!188122))

(assert (= (and b!188122 (not res!88935)) b!188126))

(declare-fun m!214793 () Bool)

(assert (=> b!188126 m!214793))

(assert (=> b!188130 m!214629))

(declare-fun m!214795 () Bool)

(assert (=> b!188130 m!214795))

(assert (=> b!188130 m!214795))

(declare-fun m!214797 () Bool)

(assert (=> b!188130 m!214797))

(assert (=> b!188122 m!214793))

(assert (=> d!55549 m!214629))

(declare-fun m!214799 () Bool)

(assert (=> d!55549 m!214799))

(assert (=> d!55549 m!214587))

(assert (=> b!188123 m!214793))

(assert (=> d!55509 d!55549))

(declare-fun d!55551 () Bool)

(declare-fun lt!93106 () (_ BitVec 32))

(declare-fun lt!93105 () (_ BitVec 32))

(assert (=> d!55551 (= lt!93106 (bvmul (bvxor lt!93105 (bvlshr lt!93105 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55551 (= lt!93105 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55551 (and (bvsge (mask!8985 thiss!1248) #b00000000000000000000000000000000) (let ((res!88936 (let ((h!3020 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20328 (bvmul (bvxor h!3020 (bvlshr h!3020 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20328 (bvlshr x!20328 #b00000000000000000000000000001101)) (mask!8985 thiss!1248)))))) (and (bvslt res!88936 (bvadd (mask!8985 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88936 #b00000000000000000000000000000000))))))

(assert (=> d!55551 (= (toIndex!0 key!828 (mask!8985 thiss!1248)) (bvand (bvxor lt!93106 (bvlshr lt!93106 #b00000000000000000000000000001101)) (mask!8985 thiss!1248)))))

(assert (=> d!55509 d!55551))

(assert (=> d!55509 d!55519))

(declare-fun d!55553 () Bool)

(assert (=> d!55553 (= (apply!172 lt!93044 (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000)) (get!2173 (getValueByKey!229 (toList!1215 lt!93044) (select (arr!3773 (_keys!5786 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7577 () Bool)

(assert (= bs!7577 d!55553))

(assert (=> bs!7577 m!214671))

(assert (=> bs!7577 m!214787))

(assert (=> bs!7577 m!214787))

(declare-fun m!214801 () Bool)

(assert (=> bs!7577 m!214801))

(assert (=> b!187991 d!55553))

(declare-fun d!55555 () Bool)

(declare-fun c!33812 () Bool)

(assert (=> d!55555 (= c!33812 ((_ is ValueCellFull!1851) (select (arr!3774 (_values!3814 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!123810 () V!5499)

(assert (=> d!55555 (= (get!2172 (select (arr!3774 (_values!3814 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3831 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!123810)))

(declare-fun b!188135 () Bool)

(declare-fun get!2174 (ValueCell!1851 V!5499) V!5499)

(assert (=> b!188135 (= e!123810 (get!2174 (select (arr!3774 (_values!3814 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3831 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!188136 () Bool)

(declare-fun get!2175 (ValueCell!1851 V!5499) V!5499)

(assert (=> b!188136 (= e!123810 (get!2175 (select (arr!3774 (_values!3814 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3831 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55555 c!33812) b!188135))

(assert (= (and d!55555 (not c!33812)) b!188136))

(assert (=> b!188135 m!214677))

(assert (=> b!188135 m!214679))

(declare-fun m!214803 () Bool)

(assert (=> b!188135 m!214803))

(assert (=> b!188136 m!214677))

(assert (=> b!188136 m!214679))

(declare-fun m!214805 () Bool)

(assert (=> b!188136 m!214805))

(assert (=> b!187991 d!55555))

(declare-fun d!55557 () Bool)

(assert (=> d!55557 (isDefined!182 (getValueByKey!229 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828))))

(declare-fun lt!93109 () Unit!5661)

(declare-fun choose!1003 (List!2385 (_ BitVec 64)) Unit!5661)

(assert (=> d!55557 (= lt!93109 (choose!1003 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828))))

(declare-fun e!123813 () Bool)

(assert (=> d!55557 e!123813))

(declare-fun res!88939 () Bool)

(assert (=> d!55557 (=> (not res!88939) (not e!123813))))

(declare-fun isStrictlySorted!352 (List!2385) Bool)

(assert (=> d!55557 (= res!88939 (isStrictlySorted!352 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))))))

(assert (=> d!55557 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828) lt!93109)))

(declare-fun b!188139 () Bool)

(assert (=> b!188139 (= e!123813 (containsKey!233 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828))))

(assert (= (and d!55557 res!88939) b!188139))

(assert (=> d!55557 m!214667))

(assert (=> d!55557 m!214667))

(assert (=> d!55557 m!214669))

(declare-fun m!214807 () Bool)

(assert (=> d!55557 m!214807))

(declare-fun m!214809 () Bool)

(assert (=> d!55557 m!214809))

(assert (=> b!188139 m!214663))

(assert (=> b!187926 d!55557))

(declare-fun d!55559 () Bool)

(declare-fun isEmpty!478 (Option!235) Bool)

(assert (=> d!55559 (= (isDefined!182 (getValueByKey!229 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828)) (not (isEmpty!478 (getValueByKey!229 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828))))))

(declare-fun bs!7578 () Bool)

(assert (= bs!7578 d!55559))

(assert (=> bs!7578 m!214667))

(declare-fun m!214811 () Bool)

(assert (=> bs!7578 m!214811))

(assert (=> b!187926 d!55559))

(declare-fun b!188149 () Bool)

(declare-fun e!123818 () Option!235)

(declare-fun e!123819 () Option!235)

(assert (=> b!188149 (= e!123818 e!123819)))

(declare-fun c!33818 () Bool)

(assert (=> b!188149 (= c!33818 (and ((_ is Cons!2381) (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))) (not (= (_1!1752 (h!3017 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))))) key!828))))))

(declare-fun b!188151 () Bool)

(assert (=> b!188151 (= e!123819 None!233)))

(declare-fun b!188148 () Bool)

(assert (=> b!188148 (= e!123818 (Some!234 (_2!1752 (h!3017 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))))))))

(declare-fun b!188150 () Bool)

(assert (=> b!188150 (= e!123819 (getValueByKey!229 (t!7279 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))) key!828))))

(declare-fun d!55561 () Bool)

(declare-fun c!33817 () Bool)

(assert (=> d!55561 (= c!33817 (and ((_ is Cons!2381) (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))) (= (_1!1752 (h!3017 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))))) key!828)))))

(assert (=> d!55561 (= (getValueByKey!229 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828) e!123818)))

(assert (= (and d!55561 c!33817) b!188148))

(assert (= (and d!55561 (not c!33817)) b!188149))

(assert (= (and b!188149 c!33818) b!188150))

(assert (= (and b!188149 (not c!33818)) b!188151))

(declare-fun m!214813 () Bool)

(assert (=> b!188150 m!214813))

(assert (=> b!187926 d!55561))

(declare-fun b!188164 () Bool)

(declare-fun e!123826 () SeekEntryResult!650)

(assert (=> b!188164 (= e!123826 (Found!650 (index!4772 lt!92953)))))

(declare-fun b!188165 () Bool)

(declare-fun e!123828 () SeekEntryResult!650)

(assert (=> b!188165 (= e!123828 (MissingVacant!650 (index!4772 lt!92953)))))

(declare-fun b!188166 () Bool)

(declare-fun e!123827 () SeekEntryResult!650)

(assert (=> b!188166 (= e!123827 Undefined!650)))

(declare-fun b!188168 () Bool)

(assert (=> b!188168 (= e!123827 e!123826)))

(declare-fun c!33825 () Bool)

(declare-fun lt!93114 () (_ BitVec 64))

(assert (=> b!188168 (= c!33825 (= lt!93114 key!828))))

(declare-fun b!188169 () Bool)

(declare-fun c!33827 () Bool)

(assert (=> b!188169 (= c!33827 (= lt!93114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188169 (= e!123826 e!123828)))

(declare-fun b!188167 () Bool)

(assert (=> b!188167 (= e!123828 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20310 lt!92953) #b00000000000000000000000000000001) (nextIndex!0 (index!4772 lt!92953) (x!20310 lt!92953) (mask!8985 thiss!1248)) (index!4772 lt!92953) key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(declare-fun lt!93115 () SeekEntryResult!650)

(declare-fun d!55563 () Bool)

(assert (=> d!55563 (and (or ((_ is Undefined!650) lt!93115) (not ((_ is Found!650) lt!93115)) (and (bvsge (index!4771 lt!93115) #b00000000000000000000000000000000) (bvslt (index!4771 lt!93115) (size!4092 (_keys!5786 thiss!1248))))) (or ((_ is Undefined!650) lt!93115) ((_ is Found!650) lt!93115) (not ((_ is MissingVacant!650) lt!93115)) (not (= (index!4773 lt!93115) (index!4772 lt!92953))) (and (bvsge (index!4773 lt!93115) #b00000000000000000000000000000000) (bvslt (index!4773 lt!93115) (size!4092 (_keys!5786 thiss!1248))))) (or ((_ is Undefined!650) lt!93115) (ite ((_ is Found!650) lt!93115) (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4771 lt!93115)) key!828) (and ((_ is MissingVacant!650) lt!93115) (= (index!4773 lt!93115) (index!4772 lt!92953)) (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4773 lt!93115)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55563 (= lt!93115 e!123827)))

(declare-fun c!33826 () Bool)

(assert (=> d!55563 (= c!33826 (bvsge (x!20310 lt!92953) #b01111111111111111111111111111110))))

(assert (=> d!55563 (= lt!93114 (select (arr!3773 (_keys!5786 thiss!1248)) (index!4772 lt!92953)))))

(assert (=> d!55563 (validMask!0 (mask!8985 thiss!1248))))

(assert (=> d!55563 (= (seekKeyOrZeroReturnVacant!0 (x!20310 lt!92953) (index!4772 lt!92953) (index!4772 lt!92953) key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)) lt!93115)))

(assert (= (and d!55563 c!33826) b!188166))

(assert (= (and d!55563 (not c!33826)) b!188168))

(assert (= (and b!188168 c!33825) b!188164))

(assert (= (and b!188168 (not c!33825)) b!188169))

(assert (= (and b!188169 c!33827) b!188165))

(assert (= (and b!188169 (not c!33827)) b!188167))

(declare-fun m!214815 () Bool)

(assert (=> b!188167 m!214815))

(assert (=> b!188167 m!214815))

(declare-fun m!214817 () Bool)

(assert (=> b!188167 m!214817))

(declare-fun m!214819 () Bool)

(assert (=> d!55563 m!214819))

(declare-fun m!214821 () Bool)

(assert (=> d!55563 m!214821))

(assert (=> d!55563 m!214627))

(assert (=> d!55563 m!214587))

(assert (=> b!187876 d!55563))

(declare-fun d!55565 () Bool)

(assert (=> d!55565 (= (apply!172 lt!93044 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2173 (getValueByKey!229 (toList!1215 lt!93044) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7579 () Bool)

(assert (= bs!7579 d!55565))

(declare-fun m!214823 () Bool)

(assert (=> bs!7579 m!214823))

(assert (=> bs!7579 m!214823))

(declare-fun m!214825 () Bool)

(assert (=> bs!7579 m!214825))

(assert (=> b!187976 d!55565))

(assert (=> b!187928 d!55559))

(assert (=> b!187928 d!55561))

(declare-fun d!55567 () Bool)

(declare-fun e!123829 () Bool)

(assert (=> d!55567 e!123829))

(declare-fun res!88940 () Bool)

(assert (=> d!55567 (=> res!88940 e!123829)))

(declare-fun lt!93117 () Bool)

(assert (=> d!55567 (= res!88940 (not lt!93117))))

(declare-fun lt!93119 () Bool)

(assert (=> d!55567 (= lt!93117 lt!93119)))

(declare-fun lt!93116 () Unit!5661)

(declare-fun e!123830 () Unit!5661)

(assert (=> d!55567 (= lt!93116 e!123830)))

(declare-fun c!33828 () Bool)

(assert (=> d!55567 (= c!33828 lt!93119)))

(assert (=> d!55567 (= lt!93119 (containsKey!233 (toList!1215 lt!93044) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55567 (= (contains!1317 lt!93044 #b1000000000000000000000000000000000000000000000000000000000000000) lt!93117)))

(declare-fun b!188170 () Bool)

(declare-fun lt!93118 () Unit!5661)

(assert (=> b!188170 (= e!123830 lt!93118)))

(assert (=> b!188170 (= lt!93118 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1215 lt!93044) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188170 (isDefined!182 (getValueByKey!229 (toList!1215 lt!93044) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188171 () Bool)

(declare-fun Unit!5670 () Unit!5661)

(assert (=> b!188171 (= e!123830 Unit!5670)))

(declare-fun b!188172 () Bool)

(assert (=> b!188172 (= e!123829 (isDefined!182 (getValueByKey!229 (toList!1215 lt!93044) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55567 c!33828) b!188170))

(assert (= (and d!55567 (not c!33828)) b!188171))

(assert (= (and d!55567 (not res!88940)) b!188172))

(declare-fun m!214827 () Bool)

(assert (=> d!55567 m!214827))

(declare-fun m!214829 () Bool)

(assert (=> b!188170 m!214829))

(assert (=> b!188170 m!214823))

(assert (=> b!188170 m!214823))

(declare-fun m!214831 () Bool)

(assert (=> b!188170 m!214831))

(assert (=> b!188172 m!214823))

(assert (=> b!188172 m!214823))

(assert (=> b!188172 m!214831))

(assert (=> bm!18948 d!55567))

(assert (=> d!55511 d!55509))

(declare-fun b!188189 () Bool)

(declare-fun e!123841 () Bool)

(declare-fun call!18973 () Bool)

(assert (=> b!188189 (= e!123841 (not call!18973))))

(declare-fun b!188190 () Bool)

(declare-fun e!123842 () Bool)

(assert (=> b!188190 (= e!123842 (not call!18973))))

(declare-fun b!188191 () Bool)

(declare-fun res!88949 () Bool)

(assert (=> b!188191 (=> (not res!88949) (not e!123842))))

(declare-fun lt!93122 () SeekEntryResult!650)

(assert (=> b!188191 (= res!88949 (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4773 lt!93122)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188192 () Bool)

(declare-fun e!123839 () Bool)

(declare-fun e!123840 () Bool)

(assert (=> b!188192 (= e!123839 e!123840)))

(declare-fun c!33833 () Bool)

(assert (=> b!188192 (= c!33833 ((_ is MissingVacant!650) lt!93122))))

(declare-fun call!18972 () Bool)

(declare-fun bm!18969 () Bool)

(declare-fun c!33834 () Bool)

(assert (=> bm!18969 (= call!18972 (inRange!0 (ite c!33834 (index!4770 lt!93122) (index!4773 lt!93122)) (mask!8985 thiss!1248)))))

(declare-fun b!188193 () Bool)

(declare-fun res!88952 () Bool)

(assert (=> b!188193 (= res!88952 (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4770 lt!93122)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188193 (=> (not res!88952) (not e!123841))))

(declare-fun b!188194 () Bool)

(assert (=> b!188194 (= e!123840 ((_ is Undefined!650) lt!93122))))

(declare-fun b!188195 () Bool)

(declare-fun res!88950 () Bool)

(assert (=> b!188195 (=> (not res!88950) (not e!123842))))

(assert (=> b!188195 (= res!88950 call!18972)))

(assert (=> b!188195 (= e!123840 e!123842)))

(declare-fun bm!18970 () Bool)

(assert (=> bm!18970 (= call!18973 (arrayContainsKey!0 (_keys!5786 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!188196 () Bool)

(assert (=> b!188196 (= e!123839 e!123841)))

(declare-fun res!88951 () Bool)

(assert (=> b!188196 (= res!88951 call!18972)))

(assert (=> b!188196 (=> (not res!88951) (not e!123841))))

(declare-fun d!55569 () Bool)

(assert (=> d!55569 e!123839))

(assert (=> d!55569 (= c!33834 ((_ is MissingZero!650) lt!93122))))

(assert (=> d!55569 (= lt!93122 (seekEntryOrOpen!0 key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(assert (=> d!55569 true))

(declare-fun _$34!1072 () Unit!5661)

(assert (=> d!55569 (= (choose!1001 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) key!828 (defaultEntry!3831 thiss!1248)) _$34!1072)))

(assert (= (and d!55569 c!33834) b!188196))

(assert (= (and d!55569 (not c!33834)) b!188192))

(assert (= (and b!188196 res!88951) b!188193))

(assert (= (and b!188193 res!88952) b!188189))

(assert (= (and b!188192 c!33833) b!188195))

(assert (= (and b!188192 (not c!33833)) b!188194))

(assert (= (and b!188195 res!88950) b!188191))

(assert (= (and b!188191 res!88949) b!188190))

(assert (= (or b!188196 b!188195) bm!18969))

(assert (= (or b!188189 b!188190) bm!18970))

(declare-fun m!214833 () Bool)

(assert (=> bm!18969 m!214833))

(declare-fun m!214835 () Bool)

(assert (=> b!188193 m!214835))

(assert (=> bm!18970 m!214639))

(assert (=> d!55569 m!214585))

(declare-fun m!214837 () Bool)

(assert (=> b!188191 m!214837))

(assert (=> d!55511 d!55569))

(assert (=> d!55511 d!55519))

(declare-fun d!55571 () Bool)

(declare-fun e!123843 () Bool)

(assert (=> d!55571 e!123843))

(declare-fun res!88953 () Bool)

(assert (=> d!55571 (=> res!88953 e!123843)))

(declare-fun lt!93124 () Bool)

(assert (=> d!55571 (= res!88953 (not lt!93124))))

(declare-fun lt!93126 () Bool)

(assert (=> d!55571 (= lt!93124 lt!93126)))

(declare-fun lt!93123 () Unit!5661)

(declare-fun e!123844 () Unit!5661)

(assert (=> d!55571 (= lt!93123 e!123844)))

(declare-fun c!33835 () Bool)

(assert (=> d!55571 (= c!33835 lt!93126)))

(assert (=> d!55571 (= lt!93126 (containsKey!233 (toList!1215 (+!292 lt!93030 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248)))) lt!93026))))

(assert (=> d!55571 (= (contains!1317 (+!292 lt!93030 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248))) lt!93026) lt!93124)))

(declare-fun b!188197 () Bool)

(declare-fun lt!93125 () Unit!5661)

(assert (=> b!188197 (= e!123844 lt!93125)))

(assert (=> b!188197 (= lt!93125 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1215 (+!292 lt!93030 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248)))) lt!93026))))

(assert (=> b!188197 (isDefined!182 (getValueByKey!229 (toList!1215 (+!292 lt!93030 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248)))) lt!93026))))

(declare-fun b!188198 () Bool)

(declare-fun Unit!5671 () Unit!5661)

(assert (=> b!188198 (= e!123844 Unit!5671)))

(declare-fun b!188199 () Bool)

(assert (=> b!188199 (= e!123843 (isDefined!182 (getValueByKey!229 (toList!1215 (+!292 lt!93030 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248)))) lt!93026)))))

(assert (= (and d!55571 c!33835) b!188197))

(assert (= (and d!55571 (not c!33835)) b!188198))

(assert (= (and d!55571 (not res!88953)) b!188199))

(declare-fun m!214839 () Bool)

(assert (=> d!55571 m!214839))

(declare-fun m!214841 () Bool)

(assert (=> b!188197 m!214841))

(declare-fun m!214843 () Bool)

(assert (=> b!188197 m!214843))

(assert (=> b!188197 m!214843))

(declare-fun m!214845 () Bool)

(assert (=> b!188197 m!214845))

(assert (=> b!188199 m!214843))

(assert (=> b!188199 m!214843))

(assert (=> b!188199 m!214845))

(assert (=> b!187977 d!55571))

(assert (=> b!187977 d!55535))

(declare-fun d!55573 () Bool)

(assert (=> d!55573 (= (apply!172 (+!292 lt!93031 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248))) lt!93042) (apply!172 lt!93031 lt!93042))))

(declare-fun lt!93129 () Unit!5661)

(declare-fun choose!1004 (ListLongMap!2399 (_ BitVec 64) V!5499 (_ BitVec 64)) Unit!5661)

(assert (=> d!55573 (= lt!93129 (choose!1004 lt!93031 lt!93041 (minValue!3672 thiss!1248) lt!93042))))

(declare-fun e!123847 () Bool)

(assert (=> d!55573 e!123847))

(declare-fun res!88956 () Bool)

(assert (=> d!55573 (=> (not res!88956) (not e!123847))))

(assert (=> d!55573 (= res!88956 (contains!1317 lt!93031 lt!93042))))

(assert (=> d!55573 (= (addApplyDifferent!148 lt!93031 lt!93041 (minValue!3672 thiss!1248) lt!93042) lt!93129)))

(declare-fun b!188203 () Bool)

(assert (=> b!188203 (= e!123847 (not (= lt!93042 lt!93041)))))

(assert (= (and d!55573 res!88956) b!188203))

(declare-fun m!214847 () Bool)

(assert (=> d!55573 m!214847))

(assert (=> d!55573 m!214701))

(assert (=> d!55573 m!214703))

(assert (=> d!55573 m!214721))

(assert (=> d!55573 m!214701))

(declare-fun m!214849 () Bool)

(assert (=> d!55573 m!214849))

(assert (=> b!187977 d!55573))

(declare-fun d!55575 () Bool)

(assert (=> d!55575 (= (apply!172 lt!93031 lt!93042) (get!2173 (getValueByKey!229 (toList!1215 lt!93031) lt!93042)))))

(declare-fun bs!7580 () Bool)

(assert (= bs!7580 d!55575))

(declare-fun m!214851 () Bool)

(assert (=> bs!7580 m!214851))

(assert (=> bs!7580 m!214851))

(declare-fun m!214853 () Bool)

(assert (=> bs!7580 m!214853))

(assert (=> b!187977 d!55575))

(declare-fun d!55577 () Bool)

(assert (=> d!55577 (= (apply!172 (+!292 lt!93039 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248))) lt!93025) (get!2173 (getValueByKey!229 (toList!1215 (+!292 lt!93039 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248)))) lt!93025)))))

(declare-fun bs!7581 () Bool)

(assert (= bs!7581 d!55577))

(declare-fun m!214855 () Bool)

(assert (=> bs!7581 m!214855))

(assert (=> bs!7581 m!214855))

(declare-fun m!214857 () Bool)

(assert (=> bs!7581 m!214857))

(assert (=> b!187977 d!55577))

(declare-fun d!55579 () Bool)

(declare-fun e!123848 () Bool)

(assert (=> d!55579 e!123848))

(declare-fun res!88958 () Bool)

(assert (=> d!55579 (=> (not res!88958) (not e!123848))))

(declare-fun lt!93132 () ListLongMap!2399)

(assert (=> d!55579 (= res!88958 (contains!1317 lt!93132 (_1!1752 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248)))))))

(declare-fun lt!93130 () List!2385)

(assert (=> d!55579 (= lt!93132 (ListLongMap!2400 lt!93130))))

(declare-fun lt!93131 () Unit!5661)

(declare-fun lt!93133 () Unit!5661)

(assert (=> d!55579 (= lt!93131 lt!93133)))

(assert (=> d!55579 (= (getValueByKey!229 lt!93130 (_1!1752 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248)))) (Some!234 (_2!1752 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248)))))))

(assert (=> d!55579 (= lt!93133 (lemmaContainsTupThenGetReturnValue!120 lt!93130 (_1!1752 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248))) (_2!1752 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248)))))))

(assert (=> d!55579 (= lt!93130 (insertStrictlySorted!123 (toList!1215 lt!93031) (_1!1752 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248))) (_2!1752 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248)))))))

(assert (=> d!55579 (= (+!292 lt!93031 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248))) lt!93132)))

(declare-fun b!188204 () Bool)

(declare-fun res!88957 () Bool)

(assert (=> b!188204 (=> (not res!88957) (not e!123848))))

(assert (=> b!188204 (= res!88957 (= (getValueByKey!229 (toList!1215 lt!93132) (_1!1752 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248)))) (Some!234 (_2!1752 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248))))))))

(declare-fun b!188205 () Bool)

(assert (=> b!188205 (= e!123848 (contains!1319 (toList!1215 lt!93132) (tuple2!3483 lt!93041 (minValue!3672 thiss!1248))))))

(assert (= (and d!55579 res!88958) b!188204))

(assert (= (and b!188204 res!88957) b!188205))

(declare-fun m!214859 () Bool)

(assert (=> d!55579 m!214859))

(declare-fun m!214861 () Bool)

(assert (=> d!55579 m!214861))

(declare-fun m!214863 () Bool)

(assert (=> d!55579 m!214863))

(declare-fun m!214865 () Bool)

(assert (=> d!55579 m!214865))

(declare-fun m!214867 () Bool)

(assert (=> b!188204 m!214867))

(declare-fun m!214869 () Bool)

(assert (=> b!188205 m!214869))

(assert (=> b!187977 d!55579))

(declare-fun d!55581 () Bool)

(assert (=> d!55581 (= (apply!172 (+!292 lt!93031 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248))) lt!93042) (get!2173 (getValueByKey!229 (toList!1215 (+!292 lt!93031 (tuple2!3483 lt!93041 (minValue!3672 thiss!1248)))) lt!93042)))))

(declare-fun bs!7582 () Bool)

(assert (= bs!7582 d!55581))

(declare-fun m!214871 () Bool)

(assert (=> bs!7582 m!214871))

(assert (=> bs!7582 m!214871))

(declare-fun m!214873 () Bool)

(assert (=> bs!7582 m!214873))

(assert (=> b!187977 d!55581))

(declare-fun d!55583 () Bool)

(assert (=> d!55583 (= (apply!172 lt!93039 lt!93025) (get!2173 (getValueByKey!229 (toList!1215 lt!93039) lt!93025)))))

(declare-fun bs!7583 () Bool)

(assert (= bs!7583 d!55583))

(declare-fun m!214875 () Bool)

(assert (=> bs!7583 m!214875))

(assert (=> bs!7583 m!214875))

(declare-fun m!214877 () Bool)

(assert (=> bs!7583 m!214877))

(assert (=> b!187977 d!55583))

(declare-fun d!55585 () Bool)

(declare-fun e!123849 () Bool)

(assert (=> d!55585 e!123849))

(declare-fun res!88960 () Bool)

(assert (=> d!55585 (=> (not res!88960) (not e!123849))))

(declare-fun lt!93136 () ListLongMap!2399)

(assert (=> d!55585 (= res!88960 (contains!1317 lt!93136 (_1!1752 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248)))))))

(declare-fun lt!93134 () List!2385)

(assert (=> d!55585 (= lt!93136 (ListLongMap!2400 lt!93134))))

(declare-fun lt!93135 () Unit!5661)

(declare-fun lt!93137 () Unit!5661)

(assert (=> d!55585 (= lt!93135 lt!93137)))

(assert (=> d!55585 (= (getValueByKey!229 lt!93134 (_1!1752 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248)))) (Some!234 (_2!1752 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248)))))))

(assert (=> d!55585 (= lt!93137 (lemmaContainsTupThenGetReturnValue!120 lt!93134 (_1!1752 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248))) (_2!1752 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248)))))))

(assert (=> d!55585 (= lt!93134 (insertStrictlySorted!123 (toList!1215 lt!93039) (_1!1752 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248))) (_2!1752 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248)))))))

(assert (=> d!55585 (= (+!292 lt!93039 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248))) lt!93136)))

(declare-fun b!188206 () Bool)

(declare-fun res!88959 () Bool)

(assert (=> b!188206 (=> (not res!88959) (not e!123849))))

(assert (=> b!188206 (= res!88959 (= (getValueByKey!229 (toList!1215 lt!93136) (_1!1752 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248)))) (Some!234 (_2!1752 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248))))))))

(declare-fun b!188207 () Bool)

(assert (=> b!188207 (= e!123849 (contains!1319 (toList!1215 lt!93136) (tuple2!3483 lt!93033 (minValue!3672 thiss!1248))))))

(assert (= (and d!55585 res!88960) b!188206))

(assert (= (and b!188206 res!88959) b!188207))

(declare-fun m!214879 () Bool)

(assert (=> d!55585 m!214879))

(declare-fun m!214881 () Bool)

(assert (=> d!55585 m!214881))

(declare-fun m!214883 () Bool)

(assert (=> d!55585 m!214883))

(declare-fun m!214885 () Bool)

(assert (=> d!55585 m!214885))

(declare-fun m!214887 () Bool)

(assert (=> b!188206 m!214887))

(declare-fun m!214889 () Bool)

(assert (=> b!188207 m!214889))

(assert (=> b!187977 d!55585))

(declare-fun d!55587 () Bool)

(assert (=> d!55587 (contains!1317 (+!292 lt!93030 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248))) lt!93026)))

(declare-fun lt!93140 () Unit!5661)

(declare-fun choose!1005 (ListLongMap!2399 (_ BitVec 64) V!5499 (_ BitVec 64)) Unit!5661)

(assert (=> d!55587 (= lt!93140 (choose!1005 lt!93030 lt!93037 (zeroValue!3672 thiss!1248) lt!93026))))

(assert (=> d!55587 (contains!1317 lt!93030 lt!93026)))

(assert (=> d!55587 (= (addStillContains!148 lt!93030 lt!93037 (zeroValue!3672 thiss!1248) lt!93026) lt!93140)))

(declare-fun bs!7584 () Bool)

(assert (= bs!7584 d!55587))

(assert (=> bs!7584 m!214713))

(assert (=> bs!7584 m!214713))

(assert (=> bs!7584 m!214717))

(declare-fun m!214891 () Bool)

(assert (=> bs!7584 m!214891))

(declare-fun m!214893 () Bool)

(assert (=> bs!7584 m!214893))

(assert (=> b!187977 d!55587))

(declare-fun d!55589 () Bool)

(assert (=> d!55589 (= (apply!172 (+!292 lt!93024 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248))) lt!93036) (get!2173 (getValueByKey!229 (toList!1215 (+!292 lt!93024 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248)))) lt!93036)))))

(declare-fun bs!7585 () Bool)

(assert (= bs!7585 d!55589))

(declare-fun m!214895 () Bool)

(assert (=> bs!7585 m!214895))

(assert (=> bs!7585 m!214895))

(declare-fun m!214897 () Bool)

(assert (=> bs!7585 m!214897))

(assert (=> b!187977 d!55589))

(declare-fun d!55591 () Bool)

(assert (=> d!55591 (= (apply!172 (+!292 lt!93039 (tuple2!3483 lt!93033 (minValue!3672 thiss!1248))) lt!93025) (apply!172 lt!93039 lt!93025))))

(declare-fun lt!93141 () Unit!5661)

(assert (=> d!55591 (= lt!93141 (choose!1004 lt!93039 lt!93033 (minValue!3672 thiss!1248) lt!93025))))

(declare-fun e!123850 () Bool)

(assert (=> d!55591 e!123850))

(declare-fun res!88961 () Bool)

(assert (=> d!55591 (=> (not res!88961) (not e!123850))))

(assert (=> d!55591 (= res!88961 (contains!1317 lt!93039 lt!93025))))

(assert (=> d!55591 (= (addApplyDifferent!148 lt!93039 lt!93033 (minValue!3672 thiss!1248) lt!93025) lt!93141)))

(declare-fun b!188209 () Bool)

(assert (=> b!188209 (= e!123850 (not (= lt!93025 lt!93033)))))

(assert (= (and d!55591 res!88961) b!188209))

(declare-fun m!214899 () Bool)

(assert (=> d!55591 m!214899))

(assert (=> d!55591 m!214695))

(assert (=> d!55591 m!214697))

(assert (=> d!55591 m!214719))

(assert (=> d!55591 m!214695))

(declare-fun m!214901 () Bool)

(assert (=> d!55591 m!214901))

(assert (=> b!187977 d!55591))

(declare-fun d!55593 () Bool)

(assert (=> d!55593 (= (apply!172 lt!93024 lt!93036) (get!2173 (getValueByKey!229 (toList!1215 lt!93024) lt!93036)))))

(declare-fun bs!7586 () Bool)

(assert (= bs!7586 d!55593))

(declare-fun m!214903 () Bool)

(assert (=> bs!7586 m!214903))

(assert (=> bs!7586 m!214903))

(declare-fun m!214905 () Bool)

(assert (=> bs!7586 m!214905))

(assert (=> b!187977 d!55593))

(declare-fun d!55595 () Bool)

(declare-fun e!123851 () Bool)

(assert (=> d!55595 e!123851))

(declare-fun res!88963 () Bool)

(assert (=> d!55595 (=> (not res!88963) (not e!123851))))

(declare-fun lt!93144 () ListLongMap!2399)

(assert (=> d!55595 (= res!88963 (contains!1317 lt!93144 (_1!1752 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248)))))))

(declare-fun lt!93142 () List!2385)

(assert (=> d!55595 (= lt!93144 (ListLongMap!2400 lt!93142))))

(declare-fun lt!93143 () Unit!5661)

(declare-fun lt!93145 () Unit!5661)

(assert (=> d!55595 (= lt!93143 lt!93145)))

(assert (=> d!55595 (= (getValueByKey!229 lt!93142 (_1!1752 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248)))) (Some!234 (_2!1752 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248)))))))

(assert (=> d!55595 (= lt!93145 (lemmaContainsTupThenGetReturnValue!120 lt!93142 (_1!1752 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248))) (_2!1752 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248)))))))

(assert (=> d!55595 (= lt!93142 (insertStrictlySorted!123 (toList!1215 lt!93024) (_1!1752 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248))) (_2!1752 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248)))))))

(assert (=> d!55595 (= (+!292 lt!93024 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248))) lt!93144)))

(declare-fun b!188210 () Bool)

(declare-fun res!88962 () Bool)

(assert (=> b!188210 (=> (not res!88962) (not e!123851))))

(assert (=> b!188210 (= res!88962 (= (getValueByKey!229 (toList!1215 lt!93144) (_1!1752 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248)))) (Some!234 (_2!1752 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248))))))))

(declare-fun b!188211 () Bool)

(assert (=> b!188211 (= e!123851 (contains!1319 (toList!1215 lt!93144) (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248))))))

(assert (= (and d!55595 res!88963) b!188210))

(assert (= (and b!188210 res!88962) b!188211))

(declare-fun m!214907 () Bool)

(assert (=> d!55595 m!214907))

(declare-fun m!214909 () Bool)

(assert (=> d!55595 m!214909))

(declare-fun m!214911 () Bool)

(assert (=> d!55595 m!214911))

(declare-fun m!214913 () Bool)

(assert (=> d!55595 m!214913))

(declare-fun m!214915 () Bool)

(assert (=> b!188210 m!214915))

(declare-fun m!214917 () Bool)

(assert (=> b!188211 m!214917))

(assert (=> b!187977 d!55595))

(declare-fun d!55597 () Bool)

(declare-fun e!123852 () Bool)

(assert (=> d!55597 e!123852))

(declare-fun res!88965 () Bool)

(assert (=> d!55597 (=> (not res!88965) (not e!123852))))

(declare-fun lt!93148 () ListLongMap!2399)

(assert (=> d!55597 (= res!88965 (contains!1317 lt!93148 (_1!1752 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248)))))))

(declare-fun lt!93146 () List!2385)

(assert (=> d!55597 (= lt!93148 (ListLongMap!2400 lt!93146))))

(declare-fun lt!93147 () Unit!5661)

(declare-fun lt!93149 () Unit!5661)

(assert (=> d!55597 (= lt!93147 lt!93149)))

(assert (=> d!55597 (= (getValueByKey!229 lt!93146 (_1!1752 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248)))) (Some!234 (_2!1752 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248)))))))

(assert (=> d!55597 (= lt!93149 (lemmaContainsTupThenGetReturnValue!120 lt!93146 (_1!1752 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248))) (_2!1752 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248)))))))

(assert (=> d!55597 (= lt!93146 (insertStrictlySorted!123 (toList!1215 lt!93030) (_1!1752 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248))) (_2!1752 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248)))))))

(assert (=> d!55597 (= (+!292 lt!93030 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248))) lt!93148)))

(declare-fun b!188212 () Bool)

(declare-fun res!88964 () Bool)

(assert (=> b!188212 (=> (not res!88964) (not e!123852))))

(assert (=> b!188212 (= res!88964 (= (getValueByKey!229 (toList!1215 lt!93148) (_1!1752 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248)))) (Some!234 (_2!1752 (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248))))))))

(declare-fun b!188213 () Bool)

(assert (=> b!188213 (= e!123852 (contains!1319 (toList!1215 lt!93148) (tuple2!3483 lt!93037 (zeroValue!3672 thiss!1248))))))

(assert (= (and d!55597 res!88965) b!188212))

(assert (= (and b!188212 res!88964) b!188213))

(declare-fun m!214919 () Bool)

(assert (=> d!55597 m!214919))

(declare-fun m!214921 () Bool)

(assert (=> d!55597 m!214921))

(declare-fun m!214923 () Bool)

(assert (=> d!55597 m!214923))

(declare-fun m!214925 () Bool)

(assert (=> d!55597 m!214925))

(declare-fun m!214927 () Bool)

(assert (=> b!188212 m!214927))

(declare-fun m!214929 () Bool)

(assert (=> b!188213 m!214929))

(assert (=> b!187977 d!55597))

(declare-fun d!55599 () Bool)

(assert (=> d!55599 (= (apply!172 (+!292 lt!93024 (tuple2!3483 lt!93029 (zeroValue!3672 thiss!1248))) lt!93036) (apply!172 lt!93024 lt!93036))))

(declare-fun lt!93150 () Unit!5661)

(assert (=> d!55599 (= lt!93150 (choose!1004 lt!93024 lt!93029 (zeroValue!3672 thiss!1248) lt!93036))))

(declare-fun e!123853 () Bool)

(assert (=> d!55599 e!123853))

(declare-fun res!88966 () Bool)

(assert (=> d!55599 (=> (not res!88966) (not e!123853))))

(assert (=> d!55599 (= res!88966 (contains!1317 lt!93024 lt!93036))))

(assert (=> d!55599 (= (addApplyDifferent!148 lt!93024 lt!93029 (zeroValue!3672 thiss!1248) lt!93036) lt!93150)))

(declare-fun b!188214 () Bool)

(assert (=> b!188214 (= e!123853 (not (= lt!93036 lt!93029)))))

(assert (= (and d!55599 res!88966) b!188214))

(declare-fun m!214931 () Bool)

(assert (=> d!55599 m!214931))

(assert (=> d!55599 m!214705))

(assert (=> d!55599 m!214709))

(assert (=> d!55599 m!214707))

(assert (=> d!55599 m!214705))

(declare-fun m!214933 () Bool)

(assert (=> d!55599 m!214933))

(assert (=> b!187977 d!55599))

(declare-fun d!55601 () Bool)

(declare-fun e!123854 () Bool)

(assert (=> d!55601 e!123854))

(declare-fun res!88967 () Bool)

(assert (=> d!55601 (=> res!88967 e!123854)))

(declare-fun lt!93152 () Bool)

(assert (=> d!55601 (= res!88967 (not lt!93152))))

(declare-fun lt!93154 () Bool)

(assert (=> d!55601 (= lt!93152 lt!93154)))

(declare-fun lt!93151 () Unit!5661)

(declare-fun e!123855 () Unit!5661)

(assert (=> d!55601 (= lt!93151 e!123855)))

(declare-fun c!33836 () Bool)

(assert (=> d!55601 (= c!33836 lt!93154)))

(assert (=> d!55601 (= lt!93154 (containsKey!233 (toList!1215 lt!93044) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55601 (= (contains!1317 lt!93044 #b0000000000000000000000000000000000000000000000000000000000000000) lt!93152)))

(declare-fun b!188215 () Bool)

(declare-fun lt!93153 () Unit!5661)

(assert (=> b!188215 (= e!123855 lt!93153)))

(assert (=> b!188215 (= lt!93153 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1215 lt!93044) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188215 (isDefined!182 (getValueByKey!229 (toList!1215 lt!93044) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188216 () Bool)

(declare-fun Unit!5672 () Unit!5661)

(assert (=> b!188216 (= e!123855 Unit!5672)))

(declare-fun b!188217 () Bool)

(assert (=> b!188217 (= e!123854 (isDefined!182 (getValueByKey!229 (toList!1215 lt!93044) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55601 c!33836) b!188215))

(assert (= (and d!55601 (not c!33836)) b!188216))

(assert (= (and d!55601 (not res!88967)) b!188217))

(declare-fun m!214935 () Bool)

(assert (=> d!55601 m!214935))

(declare-fun m!214937 () Bool)

(assert (=> b!188215 m!214937))

(assert (=> b!188215 m!214779))

(assert (=> b!188215 m!214779))

(declare-fun m!214939 () Bool)

(assert (=> b!188215 m!214939))

(assert (=> b!188217 m!214779))

(assert (=> b!188217 m!214779))

(assert (=> b!188217 m!214939))

(assert (=> bm!18949 d!55601))

(declare-fun d!55603 () Bool)

(declare-fun res!88972 () Bool)

(declare-fun e!123860 () Bool)

(assert (=> d!55603 (=> res!88972 e!123860)))

(assert (=> d!55603 (= res!88972 (and ((_ is Cons!2381) (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))) (= (_1!1752 (h!3017 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))))) key!828)))))

(assert (=> d!55603 (= (containsKey!233 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))) key!828) e!123860)))

(declare-fun b!188222 () Bool)

(declare-fun e!123861 () Bool)

(assert (=> b!188222 (= e!123860 e!123861)))

(declare-fun res!88973 () Bool)

(assert (=> b!188222 (=> (not res!88973) (not e!123861))))

(assert (=> b!188222 (= res!88973 (and (or (not ((_ is Cons!2381) (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))))) (bvsle (_1!1752 (h!3017 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))))) key!828)) ((_ is Cons!2381) (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))) (bvslt (_1!1752 (h!3017 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248))))) key!828)))))

(declare-fun b!188223 () Bool)

(assert (=> b!188223 (= e!123861 (containsKey!233 (t!7279 (toList!1215 (getCurrentListMap!863 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3831 thiss!1248)))) key!828))))

(assert (= (and d!55603 (not res!88972)) b!188222))

(assert (= (and b!188222 res!88973) b!188223))

(declare-fun m!214941 () Bool)

(assert (=> b!188223 m!214941))

(assert (=> d!55521 d!55603))

(declare-fun d!55605 () Bool)

(declare-fun e!123862 () Bool)

(assert (=> d!55605 e!123862))

(declare-fun res!88975 () Bool)

(assert (=> d!55605 (=> (not res!88975) (not e!123862))))

(declare-fun lt!93157 () ListLongMap!2399)

(assert (=> d!55605 (= res!88975 (contains!1317 lt!93157 (_1!1752 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))))))

(declare-fun lt!93155 () List!2385)

(assert (=> d!55605 (= lt!93157 (ListLongMap!2400 lt!93155))))

(declare-fun lt!93156 () Unit!5661)

(declare-fun lt!93158 () Unit!5661)

(assert (=> d!55605 (= lt!93156 lt!93158)))

(assert (=> d!55605 (= (getValueByKey!229 lt!93155 (_1!1752 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))) (Some!234 (_2!1752 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))))))

(assert (=> d!55605 (= lt!93158 (lemmaContainsTupThenGetReturnValue!120 lt!93155 (_1!1752 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))) (_2!1752 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))))))

(assert (=> d!55605 (= lt!93155 (insertStrictlySorted!123 (toList!1215 call!18949) (_1!1752 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))) (_2!1752 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))))))

(assert (=> d!55605 (= (+!292 call!18949 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))) lt!93157)))

(declare-fun b!188224 () Bool)

(declare-fun res!88974 () Bool)

(assert (=> b!188224 (=> (not res!88974) (not e!123862))))

(assert (=> b!188224 (= res!88974 (= (getValueByKey!229 (toList!1215 lt!93157) (_1!1752 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248)))) (Some!234 (_2!1752 (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))))))))

(declare-fun b!188225 () Bool)

(assert (=> b!188225 (= e!123862 (contains!1319 (toList!1215 lt!93157) (tuple2!3483 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3672 thiss!1248))))))

(assert (= (and d!55605 res!88975) b!188224))

(assert (= (and b!188224 res!88974) b!188225))

(declare-fun m!214943 () Bool)

(assert (=> d!55605 m!214943))

(declare-fun m!214945 () Bool)

(assert (=> d!55605 m!214945))

(declare-fun m!214947 () Bool)

(assert (=> d!55605 m!214947))

(declare-fun m!214949 () Bool)

(assert (=> d!55605 m!214949))

(declare-fun m!214951 () Bool)

(assert (=> b!188224 m!214951))

(declare-fun m!214953 () Bool)

(assert (=> b!188225 m!214953))

(assert (=> b!187979 d!55605))

(assert (=> d!55513 d!55509))

(declare-fun d!55607 () Bool)

(declare-fun e!123865 () Bool)

(assert (=> d!55607 e!123865))

(declare-fun res!88981 () Bool)

(assert (=> d!55607 (=> (not res!88981) (not e!123865))))

(declare-fun lt!93161 () SeekEntryResult!650)

(assert (=> d!55607 (= res!88981 ((_ is Found!650) lt!93161))))

(assert (=> d!55607 (= lt!93161 (seekEntryOrOpen!0 key!828 (_keys!5786 thiss!1248) (mask!8985 thiss!1248)))))

(assert (=> d!55607 true))

(declare-fun _$33!135 () Unit!5661)

(assert (=> d!55607 (= (choose!1002 (_keys!5786 thiss!1248) (_values!3814 thiss!1248) (mask!8985 thiss!1248) (extraKeys!3568 thiss!1248) (zeroValue!3672 thiss!1248) (minValue!3672 thiss!1248) key!828 (defaultEntry!3831 thiss!1248)) _$33!135)))

(declare-fun b!188230 () Bool)

(declare-fun res!88980 () Bool)

(assert (=> b!188230 (=> (not res!88980) (not e!123865))))

(assert (=> b!188230 (= res!88980 (inRange!0 (index!4771 lt!93161) (mask!8985 thiss!1248)))))

(declare-fun b!188231 () Bool)

(assert (=> b!188231 (= e!123865 (= (select (arr!3773 (_keys!5786 thiss!1248)) (index!4771 lt!93161)) key!828))))

(assert (= (and d!55607 res!88981) b!188230))

(assert (= (and b!188230 res!88980) b!188231))

(assert (=> d!55607 m!214585))

(declare-fun m!214955 () Bool)

(assert (=> b!188230 m!214955))

(declare-fun m!214957 () Bool)

(assert (=> b!188231 m!214957))

(assert (=> d!55513 d!55607))

(assert (=> d!55513 d!55519))

(declare-fun mapNonEmpty!7570 () Bool)

(declare-fun mapRes!7570 () Bool)

(declare-fun tp!16678 () Bool)

(declare-fun e!123867 () Bool)

(assert (=> mapNonEmpty!7570 (= mapRes!7570 (and tp!16678 e!123867))))

(declare-fun mapKey!7570 () (_ BitVec 32))

(declare-fun mapRest!7570 () (Array (_ BitVec 32) ValueCell!1851))

(declare-fun mapValue!7570 () ValueCell!1851)

(assert (=> mapNonEmpty!7570 (= mapRest!7569 (store mapRest!7570 mapKey!7570 mapValue!7570))))

(declare-fun mapIsEmpty!7570 () Bool)

(assert (=> mapIsEmpty!7570 mapRes!7570))

(declare-fun condMapEmpty!7570 () Bool)

(declare-fun mapDefault!7570 () ValueCell!1851)

(assert (=> mapNonEmpty!7569 (= condMapEmpty!7570 (= mapRest!7569 ((as const (Array (_ BitVec 32) ValueCell!1851)) mapDefault!7570)))))

(declare-fun e!123866 () Bool)

(assert (=> mapNonEmpty!7569 (= tp!16677 (and e!123866 mapRes!7570))))

(declare-fun b!188232 () Bool)

(assert (=> b!188232 (= e!123867 tp_is_empty!4389)))

(declare-fun b!188233 () Bool)

(assert (=> b!188233 (= e!123866 tp_is_empty!4389)))

(assert (= (and mapNonEmpty!7569 condMapEmpty!7570) mapIsEmpty!7570))

(assert (= (and mapNonEmpty!7569 (not condMapEmpty!7570)) mapNonEmpty!7570))

(assert (= (and mapNonEmpty!7570 ((_ is ValueCellFull!1851) mapValue!7570)) b!188232))

(assert (= (and mapNonEmpty!7569 ((_ is ValueCellFull!1851) mapDefault!7570)) b!188233))

(declare-fun m!214959 () Bool)

(assert (=> mapNonEmpty!7570 m!214959))

(declare-fun b_lambda!7307 () Bool)

(assert (= b_lambda!7303 (or (and b!187829 b_free!4617) b_lambda!7307)))

(declare-fun b_lambda!7309 () Bool)

(assert (= b_lambda!7305 (or (and b!187829 b_free!4617) b_lambda!7309)))

(check-sat (not b!188071) (not d!55557) (not b!188212) (not b!188135) (not b!188092) (not b!188042) (not bm!18964) (not b!188213) (not b!188217) (not b!188078) (not bm!18970) (not d!55573) (not b!188215) (not b_lambda!7307) (not d!55599) (not b!188035) (not b!188230) (not d!55579) (not b!188036) (not b!188043) (not b!188072) (not d!55535) (not b!188172) (not b!188207) (not d!55565) (not b!188130) (not d!55533) (not b!188079) (not b_next!4617) (not d!55593) (not d!55581) (not d!55575) tp_is_empty!4389 (not d!55605) (not d!55577) (not d!55591) (not b!188011) (not d!55559) (not d!55563) (not b!188103) (not b!188097) (not b_lambda!7309) (not d!55549) (not b!188223) (not b!188224) (not d!55571) b_and!11249 (not b!188010) (not b_lambda!7301) (not bm!18955) (not b!188076) (not b!188225) (not b!188205) (not d!55601) (not d!55587) (not bm!18958) (not b!188199) (not b!188095) (not d!55589) (not b!188206) (not b!188167) (not d!55545) (not b!188091) (not d!55607) (not d!55595) (not b!188094) (not b!188210) (not b!188075) (not b!188077) (not b!188023) (not d!55585) (not mapNonEmpty!7570) (not b!188150) (not bm!18969) (not b!188139) (not d!55539) (not b!188197) (not b!188073) (not d!55583) (not d!55567) (not d!55531) (not b!188204) (not b!188136) (not b!188170) (not d!55597) (not d!55553) (not b!188211) (not d!55569) (not bm!18961))
(check-sat b_and!11249 (not b_next!4617))
