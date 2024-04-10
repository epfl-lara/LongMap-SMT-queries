; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19262 () Bool)

(assert start!19262)

(declare-fun b!189572 () Bool)

(declare-fun b_free!4653 () Bool)

(declare-fun b_next!4653 () Bool)

(assert (=> b!189572 (= b_free!4653 (not b_next!4653))))

(declare-fun tp!16791 () Bool)

(declare-fun b_and!11291 () Bool)

(assert (=> b!189572 (= tp!16791 b_and!11291)))

(declare-fun mapIsEmpty!7633 () Bool)

(declare-fun mapRes!7633 () Bool)

(assert (=> mapIsEmpty!7633 mapRes!7633))

(declare-fun res!89644 () Bool)

(declare-fun e!124751 () Bool)

(assert (=> start!19262 (=> (not res!89644) (not e!124751))))

(declare-datatypes ((V!5547 0))(
  ( (V!5548 (val!2257 Int)) )
))
(declare-datatypes ((ValueCell!1869 0))(
  ( (ValueCellFull!1869 (v!4178 V!5547)) (EmptyCell!1869) )
))
(declare-datatypes ((array!8079 0))(
  ( (array!8080 (arr!3809 (Array (_ BitVec 32) (_ BitVec 64))) (size!4129 (_ BitVec 32))) )
))
(declare-datatypes ((array!8081 0))(
  ( (array!8082 (arr!3810 (Array (_ BitVec 32) ValueCell!1869)) (size!4130 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2646 0))(
  ( (LongMapFixedSize!2647 (defaultEntry!3867 Int) (mask!9056 (_ BitVec 32)) (extraKeys!3604 (_ BitVec 32)) (zeroValue!3708 V!5547) (minValue!3708 V!5547) (_size!1372 (_ BitVec 32)) (_keys!5834 array!8079) (_values!3850 array!8081) (_vacant!1372 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2646)

(declare-fun valid!1086 (LongMapFixedSize!2646) Bool)

(assert (=> start!19262 (= res!89644 (valid!1086 thiss!1248))))

(assert (=> start!19262 e!124751))

(declare-fun e!124755 () Bool)

(assert (=> start!19262 e!124755))

(assert (=> start!19262 true))

(declare-fun tp_is_empty!4425 () Bool)

(assert (=> start!19262 tp_is_empty!4425))

(declare-fun b!189563 () Bool)

(declare-fun e!124747 () Bool)

(assert (=> b!189563 (= e!124747 tp_is_empty!4425)))

(declare-fun b!189564 () Bool)

(declare-datatypes ((Unit!5722 0))(
  ( (Unit!5723) )
))
(declare-fun e!124753 () Unit!5722)

(declare-fun Unit!5724 () Unit!5722)

(assert (=> b!189564 (= e!124753 Unit!5724)))

(declare-fun lt!93804 () Unit!5722)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!169 (array!8079 array!8081 (_ BitVec 32) (_ BitVec 32) V!5547 V!5547 (_ BitVec 64) Int) Unit!5722)

(assert (=> b!189564 (= lt!93804 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!169 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) key!828 (defaultEntry!3867 thiss!1248)))))

(assert (=> b!189564 false))

(declare-fun b!189565 () Bool)

(declare-datatypes ((SeekEntryResult!666 0))(
  ( (MissingZero!666 (index!4834 (_ BitVec 32))) (Found!666 (index!4835 (_ BitVec 32))) (Intermediate!666 (undefined!1478 Bool) (index!4836 (_ BitVec 32)) (x!20432 (_ BitVec 32))) (Undefined!666) (MissingVacant!666 (index!4837 (_ BitVec 32))) )
))
(declare-fun lt!93809 () SeekEntryResult!666)

(declare-fun e!124748 () Bool)

(assert (=> b!189565 (= e!124748 (= (select (arr!3809 (_keys!5834 thiss!1248)) (index!4835 lt!93809)) key!828))))

(declare-fun b!189566 () Bool)

(declare-fun res!89643 () Bool)

(assert (=> b!189566 (=> (not res!89643) (not e!124751))))

(assert (=> b!189566 (= res!89643 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189567 () Bool)

(declare-fun e!124754 () Bool)

(assert (=> b!189567 (= e!124754 (and e!124747 mapRes!7633))))

(declare-fun condMapEmpty!7633 () Bool)

(declare-fun mapDefault!7633 () ValueCell!1869)

(assert (=> b!189567 (= condMapEmpty!7633 (= (arr!3810 (_values!3850 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1869)) mapDefault!7633)))))

(declare-fun b!189568 () Bool)

(declare-fun e!124749 () Bool)

(assert (=> b!189568 (= e!124749 tp_is_empty!4425)))

(declare-fun b!189569 () Bool)

(declare-fun e!124750 () Bool)

(assert (=> b!189569 (= e!124751 e!124750)))

(declare-fun res!89642 () Bool)

(assert (=> b!189569 (=> (not res!89642) (not e!124750))))

(get-info :version)

(assert (=> b!189569 (= res!89642 (and (not ((_ is Undefined!666) lt!93809)) (not ((_ is MissingVacant!666) lt!93809)) (not ((_ is MissingZero!666) lt!93809)) ((_ is Found!666) lt!93809)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8079 (_ BitVec 32)) SeekEntryResult!666)

(assert (=> b!189569 (= lt!93809 (seekEntryOrOpen!0 key!828 (_keys!5834 thiss!1248) (mask!9056 thiss!1248)))))

(declare-fun b!189570 () Bool)

(declare-fun lt!93805 () Unit!5722)

(assert (=> b!189570 (= e!124753 lt!93805)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!166 (array!8079 array!8081 (_ BitVec 32) (_ BitVec 32) V!5547 V!5547 (_ BitVec 64) Int) Unit!5722)

(assert (=> b!189570 (= lt!93805 (lemmaInListMapThenSeekEntryOrOpenFindsIt!166 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) key!828 (defaultEntry!3867 thiss!1248)))))

(declare-fun res!89641 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189570 (= res!89641 (inRange!0 (index!4835 lt!93809) (mask!9056 thiss!1248)))))

(assert (=> b!189570 (=> (not res!89641) (not e!124748))))

(assert (=> b!189570 e!124748))

(declare-fun b!189571 () Bool)

(assert (=> b!189571 (= e!124750 (not (and (bvsge (index!4835 lt!93809) #b00000000000000000000000000000000) (bvslt (index!4835 lt!93809) (size!4130 (_values!3850 thiss!1248))))))))

(declare-datatypes ((tuple2!3510 0))(
  ( (tuple2!3511 (_1!1766 (_ BitVec 64)) (_2!1766 V!5547)) )
))
(declare-datatypes ((List!2409 0))(
  ( (Nil!2406) (Cons!2405 (h!3042 tuple2!3510) (t!7313 List!2409)) )
))
(declare-datatypes ((ListLongMap!2427 0))(
  ( (ListLongMap!2428 (toList!1229 List!2409)) )
))
(declare-fun lt!93806 () ListLongMap!2427)

(declare-fun v!309 () V!5547)

(declare-fun +!297 (ListLongMap!2427 tuple2!3510) ListLongMap!2427)

(declare-fun getCurrentListMap!877 (array!8079 array!8081 (_ BitVec 32) (_ BitVec 32) V!5547 V!5547 (_ BitVec 32) Int) ListLongMap!2427)

(assert (=> b!189571 (= (+!297 lt!93806 (tuple2!3511 key!828 v!309)) (getCurrentListMap!877 (_keys!5834 thiss!1248) (array!8082 (store (arr!3810 (_values!3850 thiss!1248)) (index!4835 lt!93809) (ValueCellFull!1869 v!309)) (size!4130 (_values!3850 thiss!1248))) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun lt!93808 () Unit!5722)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!98 (array!8079 array!8081 (_ BitVec 32) (_ BitVec 32) V!5547 V!5547 (_ BitVec 32) (_ BitVec 64) V!5547 Int) Unit!5722)

(assert (=> b!189571 (= lt!93808 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!98 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) (index!4835 lt!93809) key!828 v!309 (defaultEntry!3867 thiss!1248)))))

(declare-fun lt!93807 () Unit!5722)

(assert (=> b!189571 (= lt!93807 e!124753)))

(declare-fun c!34052 () Bool)

(declare-fun contains!1336 (ListLongMap!2427 (_ BitVec 64)) Bool)

(assert (=> b!189571 (= c!34052 (contains!1336 lt!93806 key!828))))

(assert (=> b!189571 (= lt!93806 (getCurrentListMap!877 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun array_inv!2469 (array!8079) Bool)

(declare-fun array_inv!2470 (array!8081) Bool)

(assert (=> b!189572 (= e!124755 (and tp!16791 tp_is_empty!4425 (array_inv!2469 (_keys!5834 thiss!1248)) (array_inv!2470 (_values!3850 thiss!1248)) e!124754))))

(declare-fun mapNonEmpty!7633 () Bool)

(declare-fun tp!16792 () Bool)

(assert (=> mapNonEmpty!7633 (= mapRes!7633 (and tp!16792 e!124749))))

(declare-fun mapRest!7633 () (Array (_ BitVec 32) ValueCell!1869))

(declare-fun mapValue!7633 () ValueCell!1869)

(declare-fun mapKey!7633 () (_ BitVec 32))

(assert (=> mapNonEmpty!7633 (= (arr!3810 (_values!3850 thiss!1248)) (store mapRest!7633 mapKey!7633 mapValue!7633))))

(assert (= (and start!19262 res!89644) b!189566))

(assert (= (and b!189566 res!89643) b!189569))

(assert (= (and b!189569 res!89642) b!189571))

(assert (= (and b!189571 c!34052) b!189570))

(assert (= (and b!189571 (not c!34052)) b!189564))

(assert (= (and b!189570 res!89641) b!189565))

(assert (= (and b!189567 condMapEmpty!7633) mapIsEmpty!7633))

(assert (= (and b!189567 (not condMapEmpty!7633)) mapNonEmpty!7633))

(assert (= (and mapNonEmpty!7633 ((_ is ValueCellFull!1869) mapValue!7633)) b!189568))

(assert (= (and b!189567 ((_ is ValueCellFull!1869) mapDefault!7633)) b!189563))

(assert (= b!189572 b!189567))

(assert (= start!19262 b!189572))

(declare-fun m!215871 () Bool)

(assert (=> b!189570 m!215871))

(declare-fun m!215873 () Bool)

(assert (=> b!189570 m!215873))

(declare-fun m!215875 () Bool)

(assert (=> b!189564 m!215875))

(declare-fun m!215877 () Bool)

(assert (=> mapNonEmpty!7633 m!215877))

(declare-fun m!215879 () Bool)

(assert (=> b!189565 m!215879))

(declare-fun m!215881 () Bool)

(assert (=> start!19262 m!215881))

(declare-fun m!215883 () Bool)

(assert (=> b!189571 m!215883))

(declare-fun m!215885 () Bool)

(assert (=> b!189571 m!215885))

(declare-fun m!215887 () Bool)

(assert (=> b!189571 m!215887))

(declare-fun m!215889 () Bool)

(assert (=> b!189571 m!215889))

(declare-fun m!215891 () Bool)

(assert (=> b!189571 m!215891))

(declare-fun m!215893 () Bool)

(assert (=> b!189571 m!215893))

(declare-fun m!215895 () Bool)

(assert (=> b!189569 m!215895))

(declare-fun m!215897 () Bool)

(assert (=> b!189572 m!215897))

(declare-fun m!215899 () Bool)

(assert (=> b!189572 m!215899))

(check-sat b_and!11291 (not mapNonEmpty!7633) tp_is_empty!4425 (not b!189570) (not b!189569) (not b!189572) (not b_next!4653) (not start!19262) (not b!189571) (not b!189564))
(check-sat b_and!11291 (not b_next!4653))
(get-model)

(declare-fun d!55717 () Bool)

(declare-fun res!89663 () Bool)

(declare-fun e!124785 () Bool)

(assert (=> d!55717 (=> (not res!89663) (not e!124785))))

(declare-fun simpleValid!193 (LongMapFixedSize!2646) Bool)

(assert (=> d!55717 (= res!89663 (simpleValid!193 thiss!1248))))

(assert (=> d!55717 (= (valid!1086 thiss!1248) e!124785)))

(declare-fun b!189609 () Bool)

(declare-fun res!89664 () Bool)

(assert (=> b!189609 (=> (not res!89664) (not e!124785))))

(declare-fun arrayCountValidKeys!0 (array!8079 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!189609 (= res!89664 (= (arrayCountValidKeys!0 (_keys!5834 thiss!1248) #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))) (_size!1372 thiss!1248)))))

(declare-fun b!189610 () Bool)

(declare-fun res!89665 () Bool)

(assert (=> b!189610 (=> (not res!89665) (not e!124785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8079 (_ BitVec 32)) Bool)

(assert (=> b!189610 (= res!89665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5834 thiss!1248) (mask!9056 thiss!1248)))))

(declare-fun b!189611 () Bool)

(declare-datatypes ((List!2411 0))(
  ( (Nil!2408) (Cons!2407 (h!3044 (_ BitVec 64)) (t!7317 List!2411)) )
))
(declare-fun arrayNoDuplicates!0 (array!8079 (_ BitVec 32) List!2411) Bool)

(assert (=> b!189611 (= e!124785 (arrayNoDuplicates!0 (_keys!5834 thiss!1248) #b00000000000000000000000000000000 Nil!2408))))

(assert (= (and d!55717 res!89663) b!189609))

(assert (= (and b!189609 res!89664) b!189610))

(assert (= (and b!189610 res!89665) b!189611))

(declare-fun m!215931 () Bool)

(assert (=> d!55717 m!215931))

(declare-fun m!215933 () Bool)

(assert (=> b!189609 m!215933))

(declare-fun m!215935 () Bool)

(assert (=> b!189610 m!215935))

(declare-fun m!215937 () Bool)

(assert (=> b!189611 m!215937))

(assert (=> start!19262 d!55717))

(declare-fun bm!19104 () Bool)

(declare-fun call!19107 () Bool)

(declare-fun lt!93833 () SeekEntryResult!666)

(declare-fun c!34060 () Bool)

(assert (=> bm!19104 (= call!19107 (inRange!0 (ite c!34060 (index!4834 lt!93833) (index!4837 lt!93833)) (mask!9056 thiss!1248)))))

(declare-fun b!189628 () Bool)

(declare-fun e!124797 () Bool)

(declare-fun call!19108 () Bool)

(assert (=> b!189628 (= e!124797 (not call!19108))))

(declare-fun b!189629 () Bool)

(declare-fun res!89677 () Bool)

(assert (=> b!189629 (=> (not res!89677) (not e!124797))))

(assert (=> b!189629 (= res!89677 call!19107)))

(declare-fun e!124796 () Bool)

(assert (=> b!189629 (= e!124796 e!124797)))

(declare-fun b!189630 () Bool)

(declare-fun e!124794 () Bool)

(assert (=> b!189630 (= e!124794 e!124796)))

(declare-fun c!34061 () Bool)

(assert (=> b!189630 (= c!34061 ((_ is MissingVacant!666) lt!93833))))

(declare-fun b!189631 () Bool)

(declare-fun e!124795 () Bool)

(assert (=> b!189631 (= e!124794 e!124795)))

(declare-fun res!89674 () Bool)

(assert (=> b!189631 (= res!89674 call!19107)))

(assert (=> b!189631 (=> (not res!89674) (not e!124795))))

(declare-fun b!189632 () Bool)

(assert (=> b!189632 (= e!124796 ((_ is Undefined!666) lt!93833))))

(declare-fun b!189633 () Bool)

(declare-fun res!89676 () Bool)

(assert (=> b!189633 (=> (not res!89676) (not e!124797))))

(assert (=> b!189633 (= res!89676 (= (select (arr!3809 (_keys!5834 thiss!1248)) (index!4837 lt!93833)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189633 (and (bvsge (index!4837 lt!93833) #b00000000000000000000000000000000) (bvslt (index!4837 lt!93833) (size!4129 (_keys!5834 thiss!1248))))))

(declare-fun b!189634 () Bool)

(assert (=> b!189634 (and (bvsge (index!4834 lt!93833) #b00000000000000000000000000000000) (bvslt (index!4834 lt!93833) (size!4129 (_keys!5834 thiss!1248))))))

(declare-fun res!89675 () Bool)

(assert (=> b!189634 (= res!89675 (= (select (arr!3809 (_keys!5834 thiss!1248)) (index!4834 lt!93833)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189634 (=> (not res!89675) (not e!124795))))

(declare-fun bm!19105 () Bool)

(declare-fun arrayContainsKey!0 (array!8079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19105 (= call!19108 (arrayContainsKey!0 (_keys!5834 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!189635 () Bool)

(assert (=> b!189635 (= e!124795 (not call!19108))))

(declare-fun d!55719 () Bool)

(assert (=> d!55719 e!124794))

(assert (=> d!55719 (= c!34060 ((_ is MissingZero!666) lt!93833))))

(assert (=> d!55719 (= lt!93833 (seekEntryOrOpen!0 key!828 (_keys!5834 thiss!1248) (mask!9056 thiss!1248)))))

(declare-fun lt!93832 () Unit!5722)

(declare-fun choose!1014 (array!8079 array!8081 (_ BitVec 32) (_ BitVec 32) V!5547 V!5547 (_ BitVec 64) Int) Unit!5722)

(assert (=> d!55719 (= lt!93832 (choose!1014 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) key!828 (defaultEntry!3867 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!55719 (validMask!0 (mask!9056 thiss!1248))))

(assert (=> d!55719 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!169 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) key!828 (defaultEntry!3867 thiss!1248)) lt!93832)))

(assert (= (and d!55719 c!34060) b!189631))

(assert (= (and d!55719 (not c!34060)) b!189630))

(assert (= (and b!189631 res!89674) b!189634))

(assert (= (and b!189634 res!89675) b!189635))

(assert (= (and b!189630 c!34061) b!189629))

(assert (= (and b!189630 (not c!34061)) b!189632))

(assert (= (and b!189629 res!89677) b!189633))

(assert (= (and b!189633 res!89676) b!189628))

(assert (= (or b!189631 b!189629) bm!19104))

(assert (= (or b!189635 b!189628) bm!19105))

(declare-fun m!215939 () Bool)

(assert (=> bm!19104 m!215939))

(declare-fun m!215941 () Bool)

(assert (=> bm!19105 m!215941))

(assert (=> d!55719 m!215895))

(declare-fun m!215943 () Bool)

(assert (=> d!55719 m!215943))

(declare-fun m!215945 () Bool)

(assert (=> d!55719 m!215945))

(declare-fun m!215947 () Bool)

(assert (=> b!189633 m!215947))

(declare-fun m!215949 () Bool)

(assert (=> b!189634 m!215949))

(assert (=> b!189564 d!55719))

(declare-fun lt!93842 () SeekEntryResult!666)

(declare-fun e!124805 () SeekEntryResult!666)

(declare-fun b!189648 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8079 (_ BitVec 32)) SeekEntryResult!666)

(assert (=> b!189648 (= e!124805 (seekKeyOrZeroReturnVacant!0 (x!20432 lt!93842) (index!4836 lt!93842) (index!4836 lt!93842) key!828 (_keys!5834 thiss!1248) (mask!9056 thiss!1248)))))

(declare-fun b!189649 () Bool)

(declare-fun e!124804 () SeekEntryResult!666)

(assert (=> b!189649 (= e!124804 (Found!666 (index!4836 lt!93842)))))

(declare-fun b!189650 () Bool)

(declare-fun c!34069 () Bool)

(declare-fun lt!93841 () (_ BitVec 64))

(assert (=> b!189650 (= c!34069 (= lt!93841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189650 (= e!124804 e!124805)))

(declare-fun d!55721 () Bool)

(declare-fun lt!93840 () SeekEntryResult!666)

(assert (=> d!55721 (and (or ((_ is Undefined!666) lt!93840) (not ((_ is Found!666) lt!93840)) (and (bvsge (index!4835 lt!93840) #b00000000000000000000000000000000) (bvslt (index!4835 lt!93840) (size!4129 (_keys!5834 thiss!1248))))) (or ((_ is Undefined!666) lt!93840) ((_ is Found!666) lt!93840) (not ((_ is MissingZero!666) lt!93840)) (and (bvsge (index!4834 lt!93840) #b00000000000000000000000000000000) (bvslt (index!4834 lt!93840) (size!4129 (_keys!5834 thiss!1248))))) (or ((_ is Undefined!666) lt!93840) ((_ is Found!666) lt!93840) ((_ is MissingZero!666) lt!93840) (not ((_ is MissingVacant!666) lt!93840)) (and (bvsge (index!4837 lt!93840) #b00000000000000000000000000000000) (bvslt (index!4837 lt!93840) (size!4129 (_keys!5834 thiss!1248))))) (or ((_ is Undefined!666) lt!93840) (ite ((_ is Found!666) lt!93840) (= (select (arr!3809 (_keys!5834 thiss!1248)) (index!4835 lt!93840)) key!828) (ite ((_ is MissingZero!666) lt!93840) (= (select (arr!3809 (_keys!5834 thiss!1248)) (index!4834 lt!93840)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!666) lt!93840) (= (select (arr!3809 (_keys!5834 thiss!1248)) (index!4837 lt!93840)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!124806 () SeekEntryResult!666)

(assert (=> d!55721 (= lt!93840 e!124806)))

(declare-fun c!34068 () Bool)

(assert (=> d!55721 (= c!34068 (and ((_ is Intermediate!666) lt!93842) (undefined!1478 lt!93842)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8079 (_ BitVec 32)) SeekEntryResult!666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55721 (= lt!93842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9056 thiss!1248)) key!828 (_keys!5834 thiss!1248) (mask!9056 thiss!1248)))))

(assert (=> d!55721 (validMask!0 (mask!9056 thiss!1248))))

(assert (=> d!55721 (= (seekEntryOrOpen!0 key!828 (_keys!5834 thiss!1248) (mask!9056 thiss!1248)) lt!93840)))

(declare-fun b!189651 () Bool)

(assert (=> b!189651 (= e!124806 e!124804)))

(assert (=> b!189651 (= lt!93841 (select (arr!3809 (_keys!5834 thiss!1248)) (index!4836 lt!93842)))))

(declare-fun c!34070 () Bool)

(assert (=> b!189651 (= c!34070 (= lt!93841 key!828))))

(declare-fun b!189652 () Bool)

(assert (=> b!189652 (= e!124806 Undefined!666)))

(declare-fun b!189653 () Bool)

(assert (=> b!189653 (= e!124805 (MissingZero!666 (index!4836 lt!93842)))))

(assert (= (and d!55721 c!34068) b!189652))

(assert (= (and d!55721 (not c!34068)) b!189651))

(assert (= (and b!189651 c!34070) b!189649))

(assert (= (and b!189651 (not c!34070)) b!189650))

(assert (= (and b!189650 c!34069) b!189653))

(assert (= (and b!189650 (not c!34069)) b!189648))

(declare-fun m!215951 () Bool)

(assert (=> b!189648 m!215951))

(declare-fun m!215953 () Bool)

(assert (=> d!55721 m!215953))

(declare-fun m!215955 () Bool)

(assert (=> d!55721 m!215955))

(declare-fun m!215957 () Bool)

(assert (=> d!55721 m!215957))

(declare-fun m!215959 () Bool)

(assert (=> d!55721 m!215959))

(declare-fun m!215961 () Bool)

(assert (=> d!55721 m!215961))

(assert (=> d!55721 m!215945))

(assert (=> d!55721 m!215953))

(declare-fun m!215963 () Bool)

(assert (=> b!189651 m!215963))

(assert (=> b!189569 d!55721))

(declare-fun d!55723 () Bool)

(declare-fun e!124809 () Bool)

(assert (=> d!55723 e!124809))

(declare-fun res!89680 () Bool)

(assert (=> d!55723 (=> (not res!89680) (not e!124809))))

(assert (=> d!55723 (= res!89680 (and (bvsge (index!4835 lt!93809) #b00000000000000000000000000000000) (bvslt (index!4835 lt!93809) (size!4130 (_values!3850 thiss!1248)))))))

(declare-fun lt!93845 () Unit!5722)

(declare-fun choose!1015 (array!8079 array!8081 (_ BitVec 32) (_ BitVec 32) V!5547 V!5547 (_ BitVec 32) (_ BitVec 64) V!5547 Int) Unit!5722)

(assert (=> d!55723 (= lt!93845 (choose!1015 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) (index!4835 lt!93809) key!828 v!309 (defaultEntry!3867 thiss!1248)))))

(assert (=> d!55723 (validMask!0 (mask!9056 thiss!1248))))

(assert (=> d!55723 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!98 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) (index!4835 lt!93809) key!828 v!309 (defaultEntry!3867 thiss!1248)) lt!93845)))

(declare-fun b!189656 () Bool)

(assert (=> b!189656 (= e!124809 (= (+!297 (getCurrentListMap!877 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)) (tuple2!3511 key!828 v!309)) (getCurrentListMap!877 (_keys!5834 thiss!1248) (array!8082 (store (arr!3810 (_values!3850 thiss!1248)) (index!4835 lt!93809) (ValueCellFull!1869 v!309)) (size!4130 (_values!3850 thiss!1248))) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248))))))

(assert (= (and d!55723 res!89680) b!189656))

(declare-fun m!215965 () Bool)

(assert (=> d!55723 m!215965))

(assert (=> d!55723 m!215945))

(assert (=> b!189656 m!215887))

(assert (=> b!189656 m!215887))

(declare-fun m!215967 () Bool)

(assert (=> b!189656 m!215967))

(assert (=> b!189656 m!215889))

(assert (=> b!189656 m!215893))

(assert (=> b!189571 d!55723))

(declare-fun b!189699 () Bool)

(declare-fun e!124844 () Bool)

(declare-fun e!124842 () Bool)

(assert (=> b!189699 (= e!124844 e!124842)))

(declare-fun c!34086 () Bool)

(assert (=> b!189699 (= c!34086 (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189700 () Bool)

(declare-fun e!124836 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189700 (= e!124836 (validKeyInArray!0 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189701 () Bool)

(declare-fun e!124847 () Bool)

(declare-fun e!124848 () Bool)

(assert (=> b!189701 (= e!124847 e!124848)))

(declare-fun res!89703 () Bool)

(declare-fun call!19123 () Bool)

(assert (=> b!189701 (= res!89703 call!19123)))

(assert (=> b!189701 (=> (not res!89703) (not e!124848))))

(declare-fun b!189702 () Bool)

(declare-fun e!124846 () Bool)

(declare-fun lt!93900 () ListLongMap!2427)

(declare-fun apply!177 (ListLongMap!2427 (_ BitVec 64)) V!5547)

(assert (=> b!189702 (= e!124846 (= (apply!177 lt!93900 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3708 thiss!1248)))))

(declare-fun b!189703 () Bool)

(declare-fun e!124839 () ListLongMap!2427)

(declare-fun call!19124 () ListLongMap!2427)

(assert (=> b!189703 (= e!124839 call!19124)))

(declare-fun b!189704 () Bool)

(declare-fun e!124845 () ListLongMap!2427)

(declare-fun call!19127 () ListLongMap!2427)

(assert (=> b!189704 (= e!124845 (+!297 call!19127 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3708 thiss!1248))))))

(declare-fun b!189705 () Bool)

(declare-fun c!34088 () Bool)

(assert (=> b!189705 (= c!34088 (and (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!124838 () ListLongMap!2427)

(assert (=> b!189705 (= e!124839 e!124838)))

(declare-fun bm!19121 () Bool)

(declare-fun call!19125 () ListLongMap!2427)

(declare-fun call!19128 () ListLongMap!2427)

(assert (=> bm!19121 (= call!19125 call!19128)))

(declare-fun b!189706 () Bool)

(declare-fun call!19129 () ListLongMap!2427)

(assert (=> b!189706 (= e!124838 call!19129)))

(declare-fun b!189707 () Bool)

(declare-fun res!89707 () Bool)

(assert (=> b!189707 (=> (not res!89707) (not e!124844))))

(assert (=> b!189707 (= res!89707 e!124847)))

(declare-fun c!34087 () Bool)

(assert (=> b!189707 (= c!34087 (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19122 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!210 (array!8079 array!8081 (_ BitVec 32) (_ BitVec 32) V!5547 V!5547 (_ BitVec 32) Int) ListLongMap!2427)

(assert (=> bm!19122 (= call!19128 (getCurrentListMapNoExtraKeys!210 (_keys!5834 thiss!1248) (array!8082 (store (arr!3810 (_values!3850 thiss!1248)) (index!4835 lt!93809) (ValueCellFull!1869 v!309)) (size!4130 (_values!3850 thiss!1248))) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun bm!19123 () Bool)

(assert (=> bm!19123 (= call!19124 call!19127)))

(declare-fun b!189708 () Bool)

(declare-fun e!124837 () Bool)

(assert (=> b!189708 (= e!124837 (validKeyInArray!0 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19124 () Bool)

(assert (=> bm!19124 (= call!19123 (contains!1336 lt!93900 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55725 () Bool)

(assert (=> d!55725 e!124844))

(declare-fun res!89706 () Bool)

(assert (=> d!55725 (=> (not res!89706) (not e!124844))))

(assert (=> d!55725 (= res!89706 (or (bvsge #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))))))))

(declare-fun lt!93904 () ListLongMap!2427)

(assert (=> d!55725 (= lt!93900 lt!93904)))

(declare-fun lt!93899 () Unit!5722)

(declare-fun e!124840 () Unit!5722)

(assert (=> d!55725 (= lt!93899 e!124840)))

(declare-fun c!34083 () Bool)

(assert (=> d!55725 (= c!34083 e!124837)))

(declare-fun res!89705 () Bool)

(assert (=> d!55725 (=> (not res!89705) (not e!124837))))

(assert (=> d!55725 (= res!89705 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))))))

(assert (=> d!55725 (= lt!93904 e!124845)))

(declare-fun c!34085 () Bool)

(assert (=> d!55725 (= c!34085 (and (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55725 (validMask!0 (mask!9056 thiss!1248))))

(assert (=> d!55725 (= (getCurrentListMap!877 (_keys!5834 thiss!1248) (array!8082 (store (arr!3810 (_values!3850 thiss!1248)) (index!4835 lt!93809) (ValueCellFull!1869 v!309)) (size!4130 (_values!3850 thiss!1248))) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)) lt!93900)))

(declare-fun bm!19120 () Bool)

(declare-fun c!34084 () Bool)

(assert (=> bm!19120 (= call!19127 (+!297 (ite c!34085 call!19128 (ite c!34084 call!19125 call!19129)) (ite (or c!34085 c!34084) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3708 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3708 thiss!1248)))))))

(declare-fun e!124843 () Bool)

(declare-fun b!189709 () Bool)

(declare-fun get!2192 (ValueCell!1869 V!5547) V!5547)

(declare-fun dynLambda!520 (Int (_ BitVec 64)) V!5547)

(assert (=> b!189709 (= e!124843 (= (apply!177 lt!93900 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000)) (get!2192 (select (arr!3810 (array!8082 (store (arr!3810 (_values!3850 thiss!1248)) (index!4835 lt!93809) (ValueCellFull!1869 v!309)) (size!4130 (_values!3850 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!520 (defaultEntry!3867 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4130 (array!8082 (store (arr!3810 (_values!3850 thiss!1248)) (index!4835 lt!93809) (ValueCellFull!1869 v!309)) (size!4130 (_values!3850 thiss!1248))))))))

(assert (=> b!189709 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))))))

(declare-fun bm!19125 () Bool)

(assert (=> bm!19125 (= call!19129 call!19125)))

(declare-fun b!189710 () Bool)

(declare-fun lt!93897 () Unit!5722)

(assert (=> b!189710 (= e!124840 lt!93897)))

(declare-fun lt!93905 () ListLongMap!2427)

(assert (=> b!189710 (= lt!93905 (getCurrentListMapNoExtraKeys!210 (_keys!5834 thiss!1248) (array!8082 (store (arr!3810 (_values!3850 thiss!1248)) (index!4835 lt!93809) (ValueCellFull!1869 v!309)) (size!4130 (_values!3850 thiss!1248))) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun lt!93909 () (_ BitVec 64))

(assert (=> b!189710 (= lt!93909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93892 () (_ BitVec 64))

(assert (=> b!189710 (= lt!93892 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93908 () Unit!5722)

(declare-fun addStillContains!153 (ListLongMap!2427 (_ BitVec 64) V!5547 (_ BitVec 64)) Unit!5722)

(assert (=> b!189710 (= lt!93908 (addStillContains!153 lt!93905 lt!93909 (zeroValue!3708 thiss!1248) lt!93892))))

(assert (=> b!189710 (contains!1336 (+!297 lt!93905 (tuple2!3511 lt!93909 (zeroValue!3708 thiss!1248))) lt!93892)))

(declare-fun lt!93894 () Unit!5722)

(assert (=> b!189710 (= lt!93894 lt!93908)))

(declare-fun lt!93911 () ListLongMap!2427)

(assert (=> b!189710 (= lt!93911 (getCurrentListMapNoExtraKeys!210 (_keys!5834 thiss!1248) (array!8082 (store (arr!3810 (_values!3850 thiss!1248)) (index!4835 lt!93809) (ValueCellFull!1869 v!309)) (size!4130 (_values!3850 thiss!1248))) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun lt!93910 () (_ BitVec 64))

(assert (=> b!189710 (= lt!93910 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93890 () (_ BitVec 64))

(assert (=> b!189710 (= lt!93890 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93903 () Unit!5722)

(declare-fun addApplyDifferent!153 (ListLongMap!2427 (_ BitVec 64) V!5547 (_ BitVec 64)) Unit!5722)

(assert (=> b!189710 (= lt!93903 (addApplyDifferent!153 lt!93911 lt!93910 (minValue!3708 thiss!1248) lt!93890))))

(assert (=> b!189710 (= (apply!177 (+!297 lt!93911 (tuple2!3511 lt!93910 (minValue!3708 thiss!1248))) lt!93890) (apply!177 lt!93911 lt!93890))))

(declare-fun lt!93896 () Unit!5722)

(assert (=> b!189710 (= lt!93896 lt!93903)))

(declare-fun lt!93901 () ListLongMap!2427)

(assert (=> b!189710 (= lt!93901 (getCurrentListMapNoExtraKeys!210 (_keys!5834 thiss!1248) (array!8082 (store (arr!3810 (_values!3850 thiss!1248)) (index!4835 lt!93809) (ValueCellFull!1869 v!309)) (size!4130 (_values!3850 thiss!1248))) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun lt!93893 () (_ BitVec 64))

(assert (=> b!189710 (= lt!93893 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93907 () (_ BitVec 64))

(assert (=> b!189710 (= lt!93907 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93895 () Unit!5722)

(assert (=> b!189710 (= lt!93895 (addApplyDifferent!153 lt!93901 lt!93893 (zeroValue!3708 thiss!1248) lt!93907))))

(assert (=> b!189710 (= (apply!177 (+!297 lt!93901 (tuple2!3511 lt!93893 (zeroValue!3708 thiss!1248))) lt!93907) (apply!177 lt!93901 lt!93907))))

(declare-fun lt!93898 () Unit!5722)

(assert (=> b!189710 (= lt!93898 lt!93895)))

(declare-fun lt!93891 () ListLongMap!2427)

(assert (=> b!189710 (= lt!93891 (getCurrentListMapNoExtraKeys!210 (_keys!5834 thiss!1248) (array!8082 (store (arr!3810 (_values!3850 thiss!1248)) (index!4835 lt!93809) (ValueCellFull!1869 v!309)) (size!4130 (_values!3850 thiss!1248))) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun lt!93906 () (_ BitVec 64))

(assert (=> b!189710 (= lt!93906 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93902 () (_ BitVec 64))

(assert (=> b!189710 (= lt!93902 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189710 (= lt!93897 (addApplyDifferent!153 lt!93891 lt!93906 (minValue!3708 thiss!1248) lt!93902))))

(assert (=> b!189710 (= (apply!177 (+!297 lt!93891 (tuple2!3511 lt!93906 (minValue!3708 thiss!1248))) lt!93902) (apply!177 lt!93891 lt!93902))))

(declare-fun b!189711 () Bool)

(assert (=> b!189711 (= e!124845 e!124839)))

(assert (=> b!189711 (= c!34084 (and (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189712 () Bool)

(assert (=> b!189712 (= e!124848 (= (apply!177 lt!93900 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3708 thiss!1248)))))

(declare-fun bm!19126 () Bool)

(declare-fun call!19126 () Bool)

(assert (=> bm!19126 (= call!19126 (contains!1336 lt!93900 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189713 () Bool)

(assert (=> b!189713 (= e!124842 e!124846)))

(declare-fun res!89699 () Bool)

(assert (=> b!189713 (= res!89699 call!19126)))

(assert (=> b!189713 (=> (not res!89699) (not e!124846))))

(declare-fun b!189714 () Bool)

(declare-fun res!89700 () Bool)

(assert (=> b!189714 (=> (not res!89700) (not e!124844))))

(declare-fun e!124841 () Bool)

(assert (=> b!189714 (= res!89700 e!124841)))

(declare-fun res!89702 () Bool)

(assert (=> b!189714 (=> res!89702 e!124841)))

(assert (=> b!189714 (= res!89702 (not e!124836))))

(declare-fun res!89701 () Bool)

(assert (=> b!189714 (=> (not res!89701) (not e!124836))))

(assert (=> b!189714 (= res!89701 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))))))

(declare-fun b!189715 () Bool)

(assert (=> b!189715 (= e!124838 call!19124)))

(declare-fun b!189716 () Bool)

(assert (=> b!189716 (= e!124841 e!124843)))

(declare-fun res!89704 () Bool)

(assert (=> b!189716 (=> (not res!89704) (not e!124843))))

(assert (=> b!189716 (= res!89704 (contains!1336 lt!93900 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189716 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))))))

(declare-fun b!189717 () Bool)

(assert (=> b!189717 (= e!124842 (not call!19126))))

(declare-fun b!189718 () Bool)

(assert (=> b!189718 (= e!124847 (not call!19123))))

(declare-fun b!189719 () Bool)

(declare-fun Unit!5728 () Unit!5722)

(assert (=> b!189719 (= e!124840 Unit!5728)))

(assert (= (and d!55725 c!34085) b!189704))

(assert (= (and d!55725 (not c!34085)) b!189711))

(assert (= (and b!189711 c!34084) b!189703))

(assert (= (and b!189711 (not c!34084)) b!189705))

(assert (= (and b!189705 c!34088) b!189715))

(assert (= (and b!189705 (not c!34088)) b!189706))

(assert (= (or b!189715 b!189706) bm!19125))

(assert (= (or b!189703 bm!19125) bm!19121))

(assert (= (or b!189703 b!189715) bm!19123))

(assert (= (or b!189704 bm!19121) bm!19122))

(assert (= (or b!189704 bm!19123) bm!19120))

(assert (= (and d!55725 res!89705) b!189708))

(assert (= (and d!55725 c!34083) b!189710))

(assert (= (and d!55725 (not c!34083)) b!189719))

(assert (= (and d!55725 res!89706) b!189714))

(assert (= (and b!189714 res!89701) b!189700))

(assert (= (and b!189714 (not res!89702)) b!189716))

(assert (= (and b!189716 res!89704) b!189709))

(assert (= (and b!189714 res!89700) b!189707))

(assert (= (and b!189707 c!34087) b!189701))

(assert (= (and b!189707 (not c!34087)) b!189718))

(assert (= (and b!189701 res!89703) b!189712))

(assert (= (or b!189701 b!189718) bm!19124))

(assert (= (and b!189707 res!89707) b!189699))

(assert (= (and b!189699 c!34086) b!189713))

(assert (= (and b!189699 (not c!34086)) b!189717))

(assert (= (and b!189713 res!89699) b!189702))

(assert (= (or b!189713 b!189717) bm!19126))

(declare-fun b_lambda!7327 () Bool)

(assert (=> (not b_lambda!7327) (not b!189709)))

(declare-fun t!7316 () Bool)

(declare-fun tb!2865 () Bool)

(assert (=> (and b!189572 (= (defaultEntry!3867 thiss!1248) (defaultEntry!3867 thiss!1248)) t!7316) tb!2865))

(declare-fun result!4873 () Bool)

(assert (=> tb!2865 (= result!4873 tp_is_empty!4425)))

(assert (=> b!189709 t!7316))

(declare-fun b_and!11295 () Bool)

(assert (= b_and!11291 (and (=> t!7316 result!4873) b_and!11295)))

(declare-fun m!215969 () Bool)

(assert (=> bm!19120 m!215969))

(declare-fun m!215971 () Bool)

(assert (=> bm!19126 m!215971))

(declare-fun m!215973 () Bool)

(assert (=> b!189709 m!215973))

(declare-fun m!215975 () Bool)

(assert (=> b!189709 m!215975))

(declare-fun m!215977 () Bool)

(assert (=> b!189709 m!215977))

(assert (=> b!189709 m!215977))

(declare-fun m!215979 () Bool)

(assert (=> b!189709 m!215979))

(declare-fun m!215981 () Bool)

(assert (=> b!189709 m!215981))

(assert (=> b!189709 m!215979))

(assert (=> b!189709 m!215973))

(declare-fun m!215983 () Bool)

(assert (=> bm!19122 m!215983))

(assert (=> d!55725 m!215945))

(declare-fun m!215985 () Bool)

(assert (=> b!189712 m!215985))

(declare-fun m!215987 () Bool)

(assert (=> b!189704 m!215987))

(assert (=> b!189708 m!215973))

(assert (=> b!189708 m!215973))

(declare-fun m!215989 () Bool)

(assert (=> b!189708 m!215989))

(declare-fun m!215991 () Bool)

(assert (=> b!189710 m!215991))

(assert (=> b!189710 m!215983))

(declare-fun m!215993 () Bool)

(assert (=> b!189710 m!215993))

(declare-fun m!215995 () Bool)

(assert (=> b!189710 m!215995))

(declare-fun m!215997 () Bool)

(assert (=> b!189710 m!215997))

(declare-fun m!215999 () Bool)

(assert (=> b!189710 m!215999))

(assert (=> b!189710 m!215973))

(assert (=> b!189710 m!215995))

(declare-fun m!216001 () Bool)

(assert (=> b!189710 m!216001))

(declare-fun m!216003 () Bool)

(assert (=> b!189710 m!216003))

(declare-fun m!216005 () Bool)

(assert (=> b!189710 m!216005))

(declare-fun m!216007 () Bool)

(assert (=> b!189710 m!216007))

(assert (=> b!189710 m!216007))

(declare-fun m!216009 () Bool)

(assert (=> b!189710 m!216009))

(declare-fun m!216011 () Bool)

(assert (=> b!189710 m!216011))

(declare-fun m!216013 () Bool)

(assert (=> b!189710 m!216013))

(declare-fun m!216015 () Bool)

(assert (=> b!189710 m!216015))

(assert (=> b!189710 m!216003))

(declare-fun m!216017 () Bool)

(assert (=> b!189710 m!216017))

(assert (=> b!189710 m!216013))

(declare-fun m!216019 () Bool)

(assert (=> b!189710 m!216019))

(assert (=> b!189716 m!215973))

(assert (=> b!189716 m!215973))

(declare-fun m!216021 () Bool)

(assert (=> b!189716 m!216021))

(assert (=> b!189700 m!215973))

(assert (=> b!189700 m!215973))

(assert (=> b!189700 m!215989))

(declare-fun m!216023 () Bool)

(assert (=> b!189702 m!216023))

(declare-fun m!216025 () Bool)

(assert (=> bm!19124 m!216025))

(assert (=> b!189571 d!55725))

(declare-fun d!55727 () Bool)

(declare-fun e!124851 () Bool)

(assert (=> d!55727 e!124851))

(declare-fun res!89712 () Bool)

(assert (=> d!55727 (=> (not res!89712) (not e!124851))))

(declare-fun lt!93920 () ListLongMap!2427)

(assert (=> d!55727 (= res!89712 (contains!1336 lt!93920 (_1!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun lt!93922 () List!2409)

(assert (=> d!55727 (= lt!93920 (ListLongMap!2428 lt!93922))))

(declare-fun lt!93923 () Unit!5722)

(declare-fun lt!93921 () Unit!5722)

(assert (=> d!55727 (= lt!93923 lt!93921)))

(declare-datatypes ((Option!240 0))(
  ( (Some!239 (v!4182 V!5547)) (None!238) )
))
(declare-fun getValueByKey!234 (List!2409 (_ BitVec 64)) Option!240)

(assert (=> d!55727 (= (getValueByKey!234 lt!93922 (_1!1766 (tuple2!3511 key!828 v!309))) (Some!239 (_2!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!121 (List!2409 (_ BitVec 64) V!5547) Unit!5722)

(assert (=> d!55727 (= lt!93921 (lemmaContainsTupThenGetReturnValue!121 lt!93922 (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309))))))

(declare-fun insertStrictlySorted!124 (List!2409 (_ BitVec 64) V!5547) List!2409)

(assert (=> d!55727 (= lt!93922 (insertStrictlySorted!124 (toList!1229 lt!93806) (_1!1766 (tuple2!3511 key!828 v!309)) (_2!1766 (tuple2!3511 key!828 v!309))))))

(assert (=> d!55727 (= (+!297 lt!93806 (tuple2!3511 key!828 v!309)) lt!93920)))

(declare-fun b!189726 () Bool)

(declare-fun res!89713 () Bool)

(assert (=> b!189726 (=> (not res!89713) (not e!124851))))

(assert (=> b!189726 (= res!89713 (= (getValueByKey!234 (toList!1229 lt!93920) (_1!1766 (tuple2!3511 key!828 v!309))) (Some!239 (_2!1766 (tuple2!3511 key!828 v!309)))))))

(declare-fun b!189727 () Bool)

(declare-fun contains!1338 (List!2409 tuple2!3510) Bool)

(assert (=> b!189727 (= e!124851 (contains!1338 (toList!1229 lt!93920) (tuple2!3511 key!828 v!309)))))

(assert (= (and d!55727 res!89712) b!189726))

(assert (= (and b!189726 res!89713) b!189727))

(declare-fun m!216027 () Bool)

(assert (=> d!55727 m!216027))

(declare-fun m!216029 () Bool)

(assert (=> d!55727 m!216029))

(declare-fun m!216031 () Bool)

(assert (=> d!55727 m!216031))

(declare-fun m!216033 () Bool)

(assert (=> d!55727 m!216033))

(declare-fun m!216035 () Bool)

(assert (=> b!189726 m!216035))

(declare-fun m!216037 () Bool)

(assert (=> b!189727 m!216037))

(assert (=> b!189571 d!55727))

(declare-fun d!55729 () Bool)

(declare-fun e!124857 () Bool)

(assert (=> d!55729 e!124857))

(declare-fun res!89716 () Bool)

(assert (=> d!55729 (=> res!89716 e!124857)))

(declare-fun lt!93933 () Bool)

(assert (=> d!55729 (= res!89716 (not lt!93933))))

(declare-fun lt!93934 () Bool)

(assert (=> d!55729 (= lt!93933 lt!93934)))

(declare-fun lt!93932 () Unit!5722)

(declare-fun e!124856 () Unit!5722)

(assert (=> d!55729 (= lt!93932 e!124856)))

(declare-fun c!34091 () Bool)

(assert (=> d!55729 (= c!34091 lt!93934)))

(declare-fun containsKey!238 (List!2409 (_ BitVec 64)) Bool)

(assert (=> d!55729 (= lt!93934 (containsKey!238 (toList!1229 lt!93806) key!828))))

(assert (=> d!55729 (= (contains!1336 lt!93806 key!828) lt!93933)))

(declare-fun b!189734 () Bool)

(declare-fun lt!93935 () Unit!5722)

(assert (=> b!189734 (= e!124856 lt!93935)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!186 (List!2409 (_ BitVec 64)) Unit!5722)

(assert (=> b!189734 (= lt!93935 (lemmaContainsKeyImpliesGetValueByKeyDefined!186 (toList!1229 lt!93806) key!828))))

(declare-fun isDefined!187 (Option!240) Bool)

(assert (=> b!189734 (isDefined!187 (getValueByKey!234 (toList!1229 lt!93806) key!828))))

(declare-fun b!189735 () Bool)

(declare-fun Unit!5729 () Unit!5722)

(assert (=> b!189735 (= e!124856 Unit!5729)))

(declare-fun b!189736 () Bool)

(assert (=> b!189736 (= e!124857 (isDefined!187 (getValueByKey!234 (toList!1229 lt!93806) key!828)))))

(assert (= (and d!55729 c!34091) b!189734))

(assert (= (and d!55729 (not c!34091)) b!189735))

(assert (= (and d!55729 (not res!89716)) b!189736))

(declare-fun m!216039 () Bool)

(assert (=> d!55729 m!216039))

(declare-fun m!216041 () Bool)

(assert (=> b!189734 m!216041))

(declare-fun m!216043 () Bool)

(assert (=> b!189734 m!216043))

(assert (=> b!189734 m!216043))

(declare-fun m!216045 () Bool)

(assert (=> b!189734 m!216045))

(assert (=> b!189736 m!216043))

(assert (=> b!189736 m!216043))

(assert (=> b!189736 m!216045))

(assert (=> b!189571 d!55729))

(declare-fun b!189737 () Bool)

(declare-fun e!124866 () Bool)

(declare-fun e!124864 () Bool)

(assert (=> b!189737 (= e!124866 e!124864)))

(declare-fun c!34095 () Bool)

(assert (=> b!189737 (= c!34095 (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189738 () Bool)

(declare-fun e!124858 () Bool)

(assert (=> b!189738 (= e!124858 (validKeyInArray!0 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189739 () Bool)

(declare-fun e!124869 () Bool)

(declare-fun e!124870 () Bool)

(assert (=> b!189739 (= e!124869 e!124870)))

(declare-fun res!89721 () Bool)

(declare-fun call!19130 () Bool)

(assert (=> b!189739 (= res!89721 call!19130)))

(assert (=> b!189739 (=> (not res!89721) (not e!124870))))

(declare-fun b!189740 () Bool)

(declare-fun e!124868 () Bool)

(declare-fun lt!93946 () ListLongMap!2427)

(assert (=> b!189740 (= e!124868 (= (apply!177 lt!93946 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3708 thiss!1248)))))

(declare-fun b!189741 () Bool)

(declare-fun e!124861 () ListLongMap!2427)

(declare-fun call!19131 () ListLongMap!2427)

(assert (=> b!189741 (= e!124861 call!19131)))

(declare-fun b!189742 () Bool)

(declare-fun e!124867 () ListLongMap!2427)

(declare-fun call!19134 () ListLongMap!2427)

(assert (=> b!189742 (= e!124867 (+!297 call!19134 (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3708 thiss!1248))))))

(declare-fun b!189743 () Bool)

(declare-fun c!34097 () Bool)

(assert (=> b!189743 (= c!34097 (and (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!124860 () ListLongMap!2427)

(assert (=> b!189743 (= e!124861 e!124860)))

(declare-fun bm!19128 () Bool)

(declare-fun call!19132 () ListLongMap!2427)

(declare-fun call!19135 () ListLongMap!2427)

(assert (=> bm!19128 (= call!19132 call!19135)))

(declare-fun b!189744 () Bool)

(declare-fun call!19136 () ListLongMap!2427)

(assert (=> b!189744 (= e!124860 call!19136)))

(declare-fun b!189745 () Bool)

(declare-fun res!89725 () Bool)

(assert (=> b!189745 (=> (not res!89725) (not e!124866))))

(assert (=> b!189745 (= res!89725 e!124869)))

(declare-fun c!34096 () Bool)

(assert (=> b!189745 (= c!34096 (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19129 () Bool)

(assert (=> bm!19129 (= call!19135 (getCurrentListMapNoExtraKeys!210 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun bm!19130 () Bool)

(assert (=> bm!19130 (= call!19131 call!19134)))

(declare-fun b!189746 () Bool)

(declare-fun e!124859 () Bool)

(assert (=> b!189746 (= e!124859 (validKeyInArray!0 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19131 () Bool)

(assert (=> bm!19131 (= call!19130 (contains!1336 lt!93946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55731 () Bool)

(assert (=> d!55731 e!124866))

(declare-fun res!89724 () Bool)

(assert (=> d!55731 (=> (not res!89724) (not e!124866))))

(assert (=> d!55731 (= res!89724 (or (bvsge #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))))))))

(declare-fun lt!93950 () ListLongMap!2427)

(assert (=> d!55731 (= lt!93946 lt!93950)))

(declare-fun lt!93945 () Unit!5722)

(declare-fun e!124862 () Unit!5722)

(assert (=> d!55731 (= lt!93945 e!124862)))

(declare-fun c!34092 () Bool)

(assert (=> d!55731 (= c!34092 e!124859)))

(declare-fun res!89723 () Bool)

(assert (=> d!55731 (=> (not res!89723) (not e!124859))))

(assert (=> d!55731 (= res!89723 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))))))

(assert (=> d!55731 (= lt!93950 e!124867)))

(declare-fun c!34094 () Bool)

(assert (=> d!55731 (= c!34094 (and (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55731 (validMask!0 (mask!9056 thiss!1248))))

(assert (=> d!55731 (= (getCurrentListMap!877 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)) lt!93946)))

(declare-fun c!34093 () Bool)

(declare-fun bm!19127 () Bool)

(assert (=> bm!19127 (= call!19134 (+!297 (ite c!34094 call!19135 (ite c!34093 call!19132 call!19136)) (ite (or c!34094 c!34093) (tuple2!3511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3708 thiss!1248)) (tuple2!3511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3708 thiss!1248)))))))

(declare-fun b!189747 () Bool)

(declare-fun e!124865 () Bool)

(assert (=> b!189747 (= e!124865 (= (apply!177 lt!93946 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000)) (get!2192 (select (arr!3810 (_values!3850 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!520 (defaultEntry!3867 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4130 (_values!3850 thiss!1248))))))

(assert (=> b!189747 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))))))

(declare-fun bm!19132 () Bool)

(assert (=> bm!19132 (= call!19136 call!19132)))

(declare-fun b!189748 () Bool)

(declare-fun lt!93943 () Unit!5722)

(assert (=> b!189748 (= e!124862 lt!93943)))

(declare-fun lt!93951 () ListLongMap!2427)

(assert (=> b!189748 (= lt!93951 (getCurrentListMapNoExtraKeys!210 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun lt!93955 () (_ BitVec 64))

(assert (=> b!189748 (= lt!93955 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93938 () (_ BitVec 64))

(assert (=> b!189748 (= lt!93938 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93954 () Unit!5722)

(assert (=> b!189748 (= lt!93954 (addStillContains!153 lt!93951 lt!93955 (zeroValue!3708 thiss!1248) lt!93938))))

(assert (=> b!189748 (contains!1336 (+!297 lt!93951 (tuple2!3511 lt!93955 (zeroValue!3708 thiss!1248))) lt!93938)))

(declare-fun lt!93940 () Unit!5722)

(assert (=> b!189748 (= lt!93940 lt!93954)))

(declare-fun lt!93957 () ListLongMap!2427)

(assert (=> b!189748 (= lt!93957 (getCurrentListMapNoExtraKeys!210 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun lt!93956 () (_ BitVec 64))

(assert (=> b!189748 (= lt!93956 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93936 () (_ BitVec 64))

(assert (=> b!189748 (= lt!93936 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93949 () Unit!5722)

(assert (=> b!189748 (= lt!93949 (addApplyDifferent!153 lt!93957 lt!93956 (minValue!3708 thiss!1248) lt!93936))))

(assert (=> b!189748 (= (apply!177 (+!297 lt!93957 (tuple2!3511 lt!93956 (minValue!3708 thiss!1248))) lt!93936) (apply!177 lt!93957 lt!93936))))

(declare-fun lt!93942 () Unit!5722)

(assert (=> b!189748 (= lt!93942 lt!93949)))

(declare-fun lt!93947 () ListLongMap!2427)

(assert (=> b!189748 (= lt!93947 (getCurrentListMapNoExtraKeys!210 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun lt!93939 () (_ BitVec 64))

(assert (=> b!189748 (= lt!93939 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93953 () (_ BitVec 64))

(assert (=> b!189748 (= lt!93953 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93941 () Unit!5722)

(assert (=> b!189748 (= lt!93941 (addApplyDifferent!153 lt!93947 lt!93939 (zeroValue!3708 thiss!1248) lt!93953))))

(assert (=> b!189748 (= (apply!177 (+!297 lt!93947 (tuple2!3511 lt!93939 (zeroValue!3708 thiss!1248))) lt!93953) (apply!177 lt!93947 lt!93953))))

(declare-fun lt!93944 () Unit!5722)

(assert (=> b!189748 (= lt!93944 lt!93941)))

(declare-fun lt!93937 () ListLongMap!2427)

(assert (=> b!189748 (= lt!93937 (getCurrentListMapNoExtraKeys!210 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3867 thiss!1248)))))

(declare-fun lt!93952 () (_ BitVec 64))

(assert (=> b!189748 (= lt!93952 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93948 () (_ BitVec 64))

(assert (=> b!189748 (= lt!93948 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189748 (= lt!93943 (addApplyDifferent!153 lt!93937 lt!93952 (minValue!3708 thiss!1248) lt!93948))))

(assert (=> b!189748 (= (apply!177 (+!297 lt!93937 (tuple2!3511 lt!93952 (minValue!3708 thiss!1248))) lt!93948) (apply!177 lt!93937 lt!93948))))

(declare-fun b!189749 () Bool)

(assert (=> b!189749 (= e!124867 e!124861)))

(assert (=> b!189749 (= c!34093 (and (not (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3604 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189750 () Bool)

(assert (=> b!189750 (= e!124870 (= (apply!177 lt!93946 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3708 thiss!1248)))))

(declare-fun bm!19133 () Bool)

(declare-fun call!19133 () Bool)

(assert (=> bm!19133 (= call!19133 (contains!1336 lt!93946 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189751 () Bool)

(assert (=> b!189751 (= e!124864 e!124868)))

(declare-fun res!89717 () Bool)

(assert (=> b!189751 (= res!89717 call!19133)))

(assert (=> b!189751 (=> (not res!89717) (not e!124868))))

(declare-fun b!189752 () Bool)

(declare-fun res!89718 () Bool)

(assert (=> b!189752 (=> (not res!89718) (not e!124866))))

(declare-fun e!124863 () Bool)

(assert (=> b!189752 (= res!89718 e!124863)))

(declare-fun res!89720 () Bool)

(assert (=> b!189752 (=> res!89720 e!124863)))

(assert (=> b!189752 (= res!89720 (not e!124858))))

(declare-fun res!89719 () Bool)

(assert (=> b!189752 (=> (not res!89719) (not e!124858))))

(assert (=> b!189752 (= res!89719 (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))))))

(declare-fun b!189753 () Bool)

(assert (=> b!189753 (= e!124860 call!19131)))

(declare-fun b!189754 () Bool)

(assert (=> b!189754 (= e!124863 e!124865)))

(declare-fun res!89722 () Bool)

(assert (=> b!189754 (=> (not res!89722) (not e!124865))))

(assert (=> b!189754 (= res!89722 (contains!1336 lt!93946 (select (arr!3809 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189754 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4129 (_keys!5834 thiss!1248))))))

(declare-fun b!189755 () Bool)

(assert (=> b!189755 (= e!124864 (not call!19133))))

(declare-fun b!189756 () Bool)

(assert (=> b!189756 (= e!124869 (not call!19130))))

(declare-fun b!189757 () Bool)

(declare-fun Unit!5730 () Unit!5722)

(assert (=> b!189757 (= e!124862 Unit!5730)))

(assert (= (and d!55731 c!34094) b!189742))

(assert (= (and d!55731 (not c!34094)) b!189749))

(assert (= (and b!189749 c!34093) b!189741))

(assert (= (and b!189749 (not c!34093)) b!189743))

(assert (= (and b!189743 c!34097) b!189753))

(assert (= (and b!189743 (not c!34097)) b!189744))

(assert (= (or b!189753 b!189744) bm!19132))

(assert (= (or b!189741 bm!19132) bm!19128))

(assert (= (or b!189741 b!189753) bm!19130))

(assert (= (or b!189742 bm!19128) bm!19129))

(assert (= (or b!189742 bm!19130) bm!19127))

(assert (= (and d!55731 res!89723) b!189746))

(assert (= (and d!55731 c!34092) b!189748))

(assert (= (and d!55731 (not c!34092)) b!189757))

(assert (= (and d!55731 res!89724) b!189752))

(assert (= (and b!189752 res!89719) b!189738))

(assert (= (and b!189752 (not res!89720)) b!189754))

(assert (= (and b!189754 res!89722) b!189747))

(assert (= (and b!189752 res!89718) b!189745))

(assert (= (and b!189745 c!34096) b!189739))

(assert (= (and b!189745 (not c!34096)) b!189756))

(assert (= (and b!189739 res!89721) b!189750))

(assert (= (or b!189739 b!189756) bm!19131))

(assert (= (and b!189745 res!89725) b!189737))

(assert (= (and b!189737 c!34095) b!189751))

(assert (= (and b!189737 (not c!34095)) b!189755))

(assert (= (and b!189751 res!89717) b!189740))

(assert (= (or b!189751 b!189755) bm!19133))

(declare-fun b_lambda!7329 () Bool)

(assert (=> (not b_lambda!7329) (not b!189747)))

(assert (=> b!189747 t!7316))

(declare-fun b_and!11297 () Bool)

(assert (= b_and!11295 (and (=> t!7316 result!4873) b_and!11297)))

(declare-fun m!216047 () Bool)

(assert (=> bm!19127 m!216047))

(declare-fun m!216049 () Bool)

(assert (=> bm!19133 m!216049))

(assert (=> b!189747 m!215973))

(declare-fun m!216051 () Bool)

(assert (=> b!189747 m!216051))

(declare-fun m!216053 () Bool)

(assert (=> b!189747 m!216053))

(assert (=> b!189747 m!216053))

(assert (=> b!189747 m!215979))

(declare-fun m!216055 () Bool)

(assert (=> b!189747 m!216055))

(assert (=> b!189747 m!215979))

(assert (=> b!189747 m!215973))

(declare-fun m!216057 () Bool)

(assert (=> bm!19129 m!216057))

(assert (=> d!55731 m!215945))

(declare-fun m!216059 () Bool)

(assert (=> b!189750 m!216059))

(declare-fun m!216061 () Bool)

(assert (=> b!189742 m!216061))

(assert (=> b!189746 m!215973))

(assert (=> b!189746 m!215973))

(assert (=> b!189746 m!215989))

(declare-fun m!216063 () Bool)

(assert (=> b!189748 m!216063))

(assert (=> b!189748 m!216057))

(declare-fun m!216065 () Bool)

(assert (=> b!189748 m!216065))

(declare-fun m!216067 () Bool)

(assert (=> b!189748 m!216067))

(declare-fun m!216069 () Bool)

(assert (=> b!189748 m!216069))

(declare-fun m!216071 () Bool)

(assert (=> b!189748 m!216071))

(assert (=> b!189748 m!215973))

(assert (=> b!189748 m!216067))

(declare-fun m!216073 () Bool)

(assert (=> b!189748 m!216073))

(declare-fun m!216075 () Bool)

(assert (=> b!189748 m!216075))

(declare-fun m!216077 () Bool)

(assert (=> b!189748 m!216077))

(declare-fun m!216079 () Bool)

(assert (=> b!189748 m!216079))

(assert (=> b!189748 m!216079))

(declare-fun m!216081 () Bool)

(assert (=> b!189748 m!216081))

(declare-fun m!216083 () Bool)

(assert (=> b!189748 m!216083))

(declare-fun m!216085 () Bool)

(assert (=> b!189748 m!216085))

(declare-fun m!216087 () Bool)

(assert (=> b!189748 m!216087))

(assert (=> b!189748 m!216075))

(declare-fun m!216089 () Bool)

(assert (=> b!189748 m!216089))

(assert (=> b!189748 m!216085))

(declare-fun m!216091 () Bool)

(assert (=> b!189748 m!216091))

(assert (=> b!189754 m!215973))

(assert (=> b!189754 m!215973))

(declare-fun m!216093 () Bool)

(assert (=> b!189754 m!216093))

(assert (=> b!189738 m!215973))

(assert (=> b!189738 m!215973))

(assert (=> b!189738 m!215989))

(declare-fun m!216095 () Bool)

(assert (=> b!189740 m!216095))

(declare-fun m!216097 () Bool)

(assert (=> bm!19131 m!216097))

(assert (=> b!189571 d!55731))

(declare-fun d!55733 () Bool)

(assert (=> d!55733 (= (array_inv!2469 (_keys!5834 thiss!1248)) (bvsge (size!4129 (_keys!5834 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189572 d!55733))

(declare-fun d!55735 () Bool)

(assert (=> d!55735 (= (array_inv!2470 (_values!3850 thiss!1248)) (bvsge (size!4130 (_values!3850 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189572 d!55735))

(declare-fun d!55737 () Bool)

(declare-fun e!124873 () Bool)

(assert (=> d!55737 e!124873))

(declare-fun res!89730 () Bool)

(assert (=> d!55737 (=> (not res!89730) (not e!124873))))

(declare-fun lt!93963 () SeekEntryResult!666)

(assert (=> d!55737 (= res!89730 ((_ is Found!666) lt!93963))))

(assert (=> d!55737 (= lt!93963 (seekEntryOrOpen!0 key!828 (_keys!5834 thiss!1248) (mask!9056 thiss!1248)))))

(declare-fun lt!93962 () Unit!5722)

(declare-fun choose!1016 (array!8079 array!8081 (_ BitVec 32) (_ BitVec 32) V!5547 V!5547 (_ BitVec 64) Int) Unit!5722)

(assert (=> d!55737 (= lt!93962 (choose!1016 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) key!828 (defaultEntry!3867 thiss!1248)))))

(assert (=> d!55737 (validMask!0 (mask!9056 thiss!1248))))

(assert (=> d!55737 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!166 (_keys!5834 thiss!1248) (_values!3850 thiss!1248) (mask!9056 thiss!1248) (extraKeys!3604 thiss!1248) (zeroValue!3708 thiss!1248) (minValue!3708 thiss!1248) key!828 (defaultEntry!3867 thiss!1248)) lt!93962)))

(declare-fun b!189762 () Bool)

(declare-fun res!89731 () Bool)

(assert (=> b!189762 (=> (not res!89731) (not e!124873))))

(assert (=> b!189762 (= res!89731 (inRange!0 (index!4835 lt!93963) (mask!9056 thiss!1248)))))

(declare-fun b!189763 () Bool)

(assert (=> b!189763 (= e!124873 (= (select (arr!3809 (_keys!5834 thiss!1248)) (index!4835 lt!93963)) key!828))))

(assert (=> b!189763 (and (bvsge (index!4835 lt!93963) #b00000000000000000000000000000000) (bvslt (index!4835 lt!93963) (size!4129 (_keys!5834 thiss!1248))))))

(assert (= (and d!55737 res!89730) b!189762))

(assert (= (and b!189762 res!89731) b!189763))

(assert (=> d!55737 m!215895))

(declare-fun m!216099 () Bool)

(assert (=> d!55737 m!216099))

(assert (=> d!55737 m!215945))

(declare-fun m!216101 () Bool)

(assert (=> b!189762 m!216101))

(declare-fun m!216103 () Bool)

(assert (=> b!189763 m!216103))

(assert (=> b!189570 d!55737))

(declare-fun d!55739 () Bool)

(assert (=> d!55739 (= (inRange!0 (index!4835 lt!93809) (mask!9056 thiss!1248)) (and (bvsge (index!4835 lt!93809) #b00000000000000000000000000000000) (bvslt (index!4835 lt!93809) (bvadd (mask!9056 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!189570 d!55739))

(declare-fun b!189770 () Bool)

(declare-fun e!124879 () Bool)

(assert (=> b!189770 (= e!124879 tp_is_empty!4425)))

(declare-fun mapNonEmpty!7639 () Bool)

(declare-fun mapRes!7639 () Bool)

(declare-fun tp!16801 () Bool)

(assert (=> mapNonEmpty!7639 (= mapRes!7639 (and tp!16801 e!124879))))

(declare-fun mapValue!7639 () ValueCell!1869)

(declare-fun mapKey!7639 () (_ BitVec 32))

(declare-fun mapRest!7639 () (Array (_ BitVec 32) ValueCell!1869))

(assert (=> mapNonEmpty!7639 (= mapRest!7633 (store mapRest!7639 mapKey!7639 mapValue!7639))))

(declare-fun mapIsEmpty!7639 () Bool)

(assert (=> mapIsEmpty!7639 mapRes!7639))

(declare-fun condMapEmpty!7639 () Bool)

(declare-fun mapDefault!7639 () ValueCell!1869)

(assert (=> mapNonEmpty!7633 (= condMapEmpty!7639 (= mapRest!7633 ((as const (Array (_ BitVec 32) ValueCell!1869)) mapDefault!7639)))))

(declare-fun e!124878 () Bool)

(assert (=> mapNonEmpty!7633 (= tp!16792 (and e!124878 mapRes!7639))))

(declare-fun b!189771 () Bool)

(assert (=> b!189771 (= e!124878 tp_is_empty!4425)))

(assert (= (and mapNonEmpty!7633 condMapEmpty!7639) mapIsEmpty!7639))

(assert (= (and mapNonEmpty!7633 (not condMapEmpty!7639)) mapNonEmpty!7639))

(assert (= (and mapNonEmpty!7639 ((_ is ValueCellFull!1869) mapValue!7639)) b!189770))

(assert (= (and mapNonEmpty!7633 ((_ is ValueCellFull!1869) mapDefault!7639)) b!189771))

(declare-fun m!216105 () Bool)

(assert (=> mapNonEmpty!7639 m!216105))

(declare-fun b_lambda!7331 () Bool)

(assert (= b_lambda!7329 (or (and b!189572 b_free!4653) b_lambda!7331)))

(declare-fun b_lambda!7333 () Bool)

(assert (= b_lambda!7327 (or (and b!189572 b_free!4653) b_lambda!7333)))

(check-sat (not b!189610) b_and!11297 (not bm!19120) (not b!189748) (not b_next!4653) (not d!55723) (not b!189738) (not b!189750) (not b!189648) (not bm!19126) (not b!189726) (not bm!19133) (not mapNonEmpty!7639) (not b!189704) (not bm!19122) (not b!189747) (not bm!19127) (not bm!19105) (not b!189700) (not b!189709) (not b!189727) (not d!55729) (not b!189716) (not b!189656) (not bm!19131) tp_is_empty!4425 (not b!189746) (not b!189754) (not b!189609) (not b!189710) (not bm!19124) (not b!189712) (not d!55737) (not b!189611) (not bm!19104) (not d!55725) (not b!189736) (not b!189742) (not b!189734) (not b!189762) (not d!55731) (not b_lambda!7331) (not d!55717) (not b_lambda!7333) (not d!55719) (not d!55721) (not bm!19129) (not d!55727) (not b!189708) (not b!189740) (not b!189702))
(check-sat b_and!11297 (not b_next!4653))
