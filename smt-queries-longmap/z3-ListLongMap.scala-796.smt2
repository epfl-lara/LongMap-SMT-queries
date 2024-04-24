; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19070 () Bool)

(assert start!19070)

(declare-fun b!187838 () Bool)

(declare-fun b_free!4615 () Bool)

(declare-fun b_next!4615 () Bool)

(assert (=> b!187838 (= b_free!4615 (not b_next!4615))))

(declare-fun tp!16662 () Bool)

(declare-fun b_and!11253 () Bool)

(assert (=> b!187838 (= tp!16662 b_and!11253)))

(declare-fun b!187833 () Bool)

(declare-fun e!123615 () Bool)

(declare-fun e!123616 () Bool)

(assert (=> b!187833 (= e!123615 e!123616)))

(declare-fun res!88808 () Bool)

(assert (=> b!187833 (=> (not res!88808) (not e!123616))))

(declare-datatypes ((V!5497 0))(
  ( (V!5498 (val!2238 Int)) )
))
(declare-datatypes ((ValueCell!1850 0))(
  ( (ValueCellFull!1850 (v!4155 V!5497)) (EmptyCell!1850) )
))
(declare-datatypes ((array!7979 0))(
  ( (array!7980 (arr!3764 (Array (_ BitVec 32) (_ BitVec 64))) (size!4083 (_ BitVec 32))) )
))
(declare-datatypes ((array!7981 0))(
  ( (array!7982 (arr!3765 (Array (_ BitVec 32) ValueCell!1850)) (size!4084 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2608 0))(
  ( (LongMapFixedSize!2609 (defaultEntry!3830 Int) (mask!8984 (_ BitVec 32)) (extraKeys!3567 (_ BitVec 32)) (zeroValue!3671 V!5497) (minValue!3671 V!5497) (_size!1353 (_ BitVec 32)) (_keys!5785 array!7979) (_values!3813 array!7981) (_vacant!1353 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2608)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187833 (= res!88808 (validMask!0 (mask!8984 thiss!1248)))))

(declare-datatypes ((Unit!5665 0))(
  ( (Unit!5666) )
))
(declare-fun lt!92981 () Unit!5665)

(declare-fun e!123612 () Unit!5665)

(assert (=> b!187833 (= lt!92981 e!123612)))

(declare-fun c!33746 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3432 0))(
  ( (tuple2!3433 (_1!1727 (_ BitVec 64)) (_2!1727 V!5497)) )
))
(declare-datatypes ((List!2353 0))(
  ( (Nil!2350) (Cons!2349 (h!2985 tuple2!3432) (t!7239 List!2353)) )
))
(declare-datatypes ((ListLongMap!2353 0))(
  ( (ListLongMap!2354 (toList!1192 List!2353)) )
))
(declare-fun contains!1306 (ListLongMap!2353 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!844 (array!7979 array!7981 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 32) Int) ListLongMap!2353)

(assert (=> b!187833 (= c!33746 (contains!1306 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)) key!828))))

(declare-fun b!187834 () Bool)

(declare-fun res!88805 () Bool)

(declare-fun e!123610 () Bool)

(assert (=> b!187834 (=> (not res!88805) (not e!123610))))

(assert (=> b!187834 (= res!88805 (not (= key!828 (bvneg key!828))))))

(declare-fun b!187835 () Bool)

(declare-fun e!123607 () Bool)

(declare-fun e!123609 () Bool)

(declare-fun mapRes!7560 () Bool)

(assert (=> b!187835 (= e!123607 (and e!123609 mapRes!7560))))

(declare-fun condMapEmpty!7560 () Bool)

(declare-fun mapDefault!7560 () ValueCell!1850)

(assert (=> b!187835 (= condMapEmpty!7560 (= (arr!3765 (_values!3813 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1850)) mapDefault!7560)))))

(declare-fun b!187836 () Bool)

(assert (=> b!187836 (= e!123616 (and (= (size!4084 (_values!3813 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8984 thiss!1248))) (= (size!4083 (_keys!5785 thiss!1248)) (size!4084 (_values!3813 thiss!1248))) (bvsge (mask!8984 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3567 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3567 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7560 () Bool)

(declare-fun tp!16661 () Bool)

(declare-fun e!123611 () Bool)

(assert (=> mapNonEmpty!7560 (= mapRes!7560 (and tp!16661 e!123611))))

(declare-fun mapValue!7560 () ValueCell!1850)

(declare-fun mapKey!7560 () (_ BitVec 32))

(declare-fun mapRest!7560 () (Array (_ BitVec 32) ValueCell!1850))

(assert (=> mapNonEmpty!7560 (= (arr!3765 (_values!3813 thiss!1248)) (store mapRest!7560 mapKey!7560 mapValue!7560))))

(declare-fun b!187837 () Bool)

(declare-fun lt!92979 () Unit!5665)

(assert (=> b!187837 (= e!123612 lt!92979)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!156 (array!7979 array!7981 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 64) Int) Unit!5665)

(assert (=> b!187837 (= lt!92979 (lemmaInListMapThenSeekEntryOrOpenFindsIt!156 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)))))

(declare-fun res!88806 () Bool)

(declare-datatypes ((SeekEntryResult!642 0))(
  ( (MissingZero!642 (index!4738 (_ BitVec 32))) (Found!642 (index!4739 (_ BitVec 32))) (Intermediate!642 (undefined!1454 Bool) (index!4740 (_ BitVec 32)) (x!20302 (_ BitVec 32))) (Undefined!642) (MissingVacant!642 (index!4741 (_ BitVec 32))) )
))
(declare-fun lt!92980 () SeekEntryResult!642)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187837 (= res!88806 (inRange!0 (index!4739 lt!92980) (mask!8984 thiss!1248)))))

(declare-fun e!123614 () Bool)

(assert (=> b!187837 (=> (not res!88806) (not e!123614))))

(assert (=> b!187837 e!123614))

(declare-fun tp_is_empty!4387 () Bool)

(declare-fun e!123613 () Bool)

(declare-fun array_inv!2429 (array!7979) Bool)

(declare-fun array_inv!2430 (array!7981) Bool)

(assert (=> b!187838 (= e!123613 (and tp!16662 tp_is_empty!4387 (array_inv!2429 (_keys!5785 thiss!1248)) (array_inv!2430 (_values!3813 thiss!1248)) e!123607))))

(declare-fun mapIsEmpty!7560 () Bool)

(assert (=> mapIsEmpty!7560 mapRes!7560))

(declare-fun b!187839 () Bool)

(assert (=> b!187839 (= e!123610 e!123615)))

(declare-fun res!88807 () Bool)

(assert (=> b!187839 (=> (not res!88807) (not e!123615))))

(get-info :version)

(assert (=> b!187839 (= res!88807 (and (not ((_ is Undefined!642) lt!92980)) (not ((_ is MissingVacant!642) lt!92980)) (not ((_ is MissingZero!642) lt!92980)) ((_ is Found!642) lt!92980)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7979 (_ BitVec 32)) SeekEntryResult!642)

(assert (=> b!187839 (= lt!92980 (seekEntryOrOpen!0 key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(declare-fun res!88804 () Bool)

(assert (=> start!19070 (=> (not res!88804) (not e!123610))))

(declare-fun valid!1100 (LongMapFixedSize!2608) Bool)

(assert (=> start!19070 (= res!88804 (valid!1100 thiss!1248))))

(assert (=> start!19070 e!123610))

(assert (=> start!19070 e!123613))

(assert (=> start!19070 true))

(declare-fun b!187840 () Bool)

(assert (=> b!187840 (= e!123614 (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4739 lt!92980)) key!828))))

(declare-fun b!187841 () Bool)

(assert (=> b!187841 (= e!123609 tp_is_empty!4387)))

(declare-fun b!187842 () Bool)

(declare-fun Unit!5667 () Unit!5665)

(assert (=> b!187842 (= e!123612 Unit!5667)))

(declare-fun lt!92978 () Unit!5665)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!150 (array!7979 array!7981 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 64) Int) Unit!5665)

(assert (=> b!187842 (= lt!92978 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!150 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)))))

(assert (=> b!187842 false))

(declare-fun b!187843 () Bool)

(assert (=> b!187843 (= e!123611 tp_is_empty!4387)))

(assert (= (and start!19070 res!88804) b!187834))

(assert (= (and b!187834 res!88805) b!187839))

(assert (= (and b!187839 res!88807) b!187833))

(assert (= (and b!187833 c!33746) b!187837))

(assert (= (and b!187833 (not c!33746)) b!187842))

(assert (= (and b!187837 res!88806) b!187840))

(assert (= (and b!187833 res!88808) b!187836))

(assert (= (and b!187835 condMapEmpty!7560) mapIsEmpty!7560))

(assert (= (and b!187835 (not condMapEmpty!7560)) mapNonEmpty!7560))

(assert (= (and mapNonEmpty!7560 ((_ is ValueCellFull!1850) mapValue!7560)) b!187843))

(assert (= (and b!187835 ((_ is ValueCellFull!1850) mapDefault!7560)) b!187841))

(assert (= b!187838 b!187835))

(assert (= start!19070 b!187838))

(declare-fun m!214735 () Bool)

(assert (=> b!187840 m!214735))

(declare-fun m!214737 () Bool)

(assert (=> b!187839 m!214737))

(declare-fun m!214739 () Bool)

(assert (=> b!187842 m!214739))

(declare-fun m!214741 () Bool)

(assert (=> b!187833 m!214741))

(declare-fun m!214743 () Bool)

(assert (=> b!187833 m!214743))

(assert (=> b!187833 m!214743))

(declare-fun m!214745 () Bool)

(assert (=> b!187833 m!214745))

(declare-fun m!214747 () Bool)

(assert (=> b!187837 m!214747))

(declare-fun m!214749 () Bool)

(assert (=> b!187837 m!214749))

(declare-fun m!214751 () Bool)

(assert (=> start!19070 m!214751))

(declare-fun m!214753 () Bool)

(assert (=> mapNonEmpty!7560 m!214753))

(declare-fun m!214755 () Bool)

(assert (=> b!187838 m!214755))

(declare-fun m!214757 () Bool)

(assert (=> b!187838 m!214757))

(check-sat (not b!187842) (not b!187839) (not b!187838) tp_is_empty!4387 (not b!187837) (not b_next!4615) (not b!187833) (not mapNonEmpty!7560) b_and!11253 (not start!19070))
(check-sat b_and!11253 (not b_next!4615))
(get-model)

(declare-fun d!55579 () Bool)

(declare-fun e!123679 () Bool)

(assert (=> d!55579 e!123679))

(declare-fun res!88844 () Bool)

(assert (=> d!55579 (=> (not res!88844) (not e!123679))))

(declare-fun lt!93011 () SeekEntryResult!642)

(assert (=> d!55579 (= res!88844 ((_ is Found!642) lt!93011))))

(assert (=> d!55579 (= lt!93011 (seekEntryOrOpen!0 key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(declare-fun lt!93010 () Unit!5665)

(declare-fun choose!1008 (array!7979 array!7981 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 64) Int) Unit!5665)

(assert (=> d!55579 (= lt!93010 (choose!1008 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)))))

(assert (=> d!55579 (validMask!0 (mask!8984 thiss!1248))))

(assert (=> d!55579 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!156 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)) lt!93010)))

(declare-fun b!187914 () Bool)

(declare-fun res!88843 () Bool)

(assert (=> b!187914 (=> (not res!88843) (not e!123679))))

(assert (=> b!187914 (= res!88843 (inRange!0 (index!4739 lt!93011) (mask!8984 thiss!1248)))))

(declare-fun b!187915 () Bool)

(assert (=> b!187915 (= e!123679 (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4739 lt!93011)) key!828))))

(assert (=> b!187915 (and (bvsge (index!4739 lt!93011) #b00000000000000000000000000000000) (bvslt (index!4739 lt!93011) (size!4083 (_keys!5785 thiss!1248))))))

(assert (= (and d!55579 res!88844) b!187914))

(assert (= (and b!187914 res!88843) b!187915))

(assert (=> d!55579 m!214737))

(declare-fun m!214807 () Bool)

(assert (=> d!55579 m!214807))

(assert (=> d!55579 m!214741))

(declare-fun m!214809 () Bool)

(assert (=> b!187914 m!214809))

(declare-fun m!214811 () Bool)

(assert (=> b!187915 m!214811))

(assert (=> b!187837 d!55579))

(declare-fun d!55581 () Bool)

(assert (=> d!55581 (= (inRange!0 (index!4739 lt!92980) (mask!8984 thiss!1248)) (and (bvsge (index!4739 lt!92980) #b00000000000000000000000000000000) (bvslt (index!4739 lt!92980) (bvadd (mask!8984 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187837 d!55581))

(declare-fun d!55583 () Bool)

(declare-fun res!88851 () Bool)

(declare-fun e!123682 () Bool)

(assert (=> d!55583 (=> (not res!88851) (not e!123682))))

(declare-fun simpleValid!188 (LongMapFixedSize!2608) Bool)

(assert (=> d!55583 (= res!88851 (simpleValid!188 thiss!1248))))

(assert (=> d!55583 (= (valid!1100 thiss!1248) e!123682)))

(declare-fun b!187922 () Bool)

(declare-fun res!88852 () Bool)

(assert (=> b!187922 (=> (not res!88852) (not e!123682))))

(declare-fun arrayCountValidKeys!0 (array!7979 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187922 (= res!88852 (= (arrayCountValidKeys!0 (_keys!5785 thiss!1248) #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))) (_size!1353 thiss!1248)))))

(declare-fun b!187923 () Bool)

(declare-fun res!88853 () Bool)

(assert (=> b!187923 (=> (not res!88853) (not e!123682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7979 (_ BitVec 32)) Bool)

(assert (=> b!187923 (= res!88853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(declare-fun b!187924 () Bool)

(declare-datatypes ((List!2355 0))(
  ( (Nil!2352) (Cons!2351 (h!2987 (_ BitVec 64)) (t!7243 List!2355)) )
))
(declare-fun arrayNoDuplicates!0 (array!7979 (_ BitVec 32) List!2355) Bool)

(assert (=> b!187924 (= e!123682 (arrayNoDuplicates!0 (_keys!5785 thiss!1248) #b00000000000000000000000000000000 Nil!2352))))

(assert (= (and d!55583 res!88851) b!187922))

(assert (= (and b!187922 res!88852) b!187923))

(assert (= (and b!187923 res!88853) b!187924))

(declare-fun m!214813 () Bool)

(assert (=> d!55583 m!214813))

(declare-fun m!214815 () Bool)

(assert (=> b!187922 m!214815))

(declare-fun m!214817 () Bool)

(assert (=> b!187923 m!214817))

(declare-fun m!214819 () Bool)

(assert (=> b!187924 m!214819))

(assert (=> start!19070 d!55583))

(declare-fun b!187937 () Bool)

(declare-fun c!33760 () Bool)

(declare-fun lt!93020 () (_ BitVec 64))

(assert (=> b!187937 (= c!33760 (= lt!93020 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123691 () SeekEntryResult!642)

(declare-fun e!123689 () SeekEntryResult!642)

(assert (=> b!187937 (= e!123691 e!123689)))

(declare-fun b!187938 () Bool)

(declare-fun lt!93019 () SeekEntryResult!642)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7979 (_ BitVec 32)) SeekEntryResult!642)

(assert (=> b!187938 (= e!123689 (seekKeyOrZeroReturnVacant!0 (x!20302 lt!93019) (index!4740 lt!93019) (index!4740 lt!93019) key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(declare-fun d!55585 () Bool)

(declare-fun lt!93018 () SeekEntryResult!642)

(assert (=> d!55585 (and (or ((_ is Undefined!642) lt!93018) (not ((_ is Found!642) lt!93018)) (and (bvsge (index!4739 lt!93018) #b00000000000000000000000000000000) (bvslt (index!4739 lt!93018) (size!4083 (_keys!5785 thiss!1248))))) (or ((_ is Undefined!642) lt!93018) ((_ is Found!642) lt!93018) (not ((_ is MissingZero!642) lt!93018)) (and (bvsge (index!4738 lt!93018) #b00000000000000000000000000000000) (bvslt (index!4738 lt!93018) (size!4083 (_keys!5785 thiss!1248))))) (or ((_ is Undefined!642) lt!93018) ((_ is Found!642) lt!93018) ((_ is MissingZero!642) lt!93018) (not ((_ is MissingVacant!642) lt!93018)) (and (bvsge (index!4741 lt!93018) #b00000000000000000000000000000000) (bvslt (index!4741 lt!93018) (size!4083 (_keys!5785 thiss!1248))))) (or ((_ is Undefined!642) lt!93018) (ite ((_ is Found!642) lt!93018) (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4739 lt!93018)) key!828) (ite ((_ is MissingZero!642) lt!93018) (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4738 lt!93018)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!642) lt!93018) (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4741 lt!93018)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!123690 () SeekEntryResult!642)

(assert (=> d!55585 (= lt!93018 e!123690)))

(declare-fun c!33761 () Bool)

(assert (=> d!55585 (= c!33761 (and ((_ is Intermediate!642) lt!93019) (undefined!1454 lt!93019)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7979 (_ BitVec 32)) SeekEntryResult!642)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55585 (= lt!93019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8984 thiss!1248)) key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(assert (=> d!55585 (validMask!0 (mask!8984 thiss!1248))))

(assert (=> d!55585 (= (seekEntryOrOpen!0 key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)) lt!93018)))

(declare-fun b!187939 () Bool)

(assert (=> b!187939 (= e!123691 (Found!642 (index!4740 lt!93019)))))

(declare-fun b!187940 () Bool)

(assert (=> b!187940 (= e!123690 Undefined!642)))

(declare-fun b!187941 () Bool)

(assert (=> b!187941 (= e!123690 e!123691)))

(assert (=> b!187941 (= lt!93020 (select (arr!3764 (_keys!5785 thiss!1248)) (index!4740 lt!93019)))))

(declare-fun c!33759 () Bool)

(assert (=> b!187941 (= c!33759 (= lt!93020 key!828))))

(declare-fun b!187942 () Bool)

(assert (=> b!187942 (= e!123689 (MissingZero!642 (index!4740 lt!93019)))))

(assert (= (and d!55585 c!33761) b!187940))

(assert (= (and d!55585 (not c!33761)) b!187941))

(assert (= (and b!187941 c!33759) b!187939))

(assert (= (and b!187941 (not c!33759)) b!187937))

(assert (= (and b!187937 c!33760) b!187942))

(assert (= (and b!187937 (not c!33760)) b!187938))

(declare-fun m!214821 () Bool)

(assert (=> b!187938 m!214821))

(declare-fun m!214823 () Bool)

(assert (=> d!55585 m!214823))

(declare-fun m!214825 () Bool)

(assert (=> d!55585 m!214825))

(assert (=> d!55585 m!214825))

(declare-fun m!214827 () Bool)

(assert (=> d!55585 m!214827))

(declare-fun m!214829 () Bool)

(assert (=> d!55585 m!214829))

(assert (=> d!55585 m!214741))

(declare-fun m!214831 () Bool)

(assert (=> d!55585 m!214831))

(declare-fun m!214833 () Bool)

(assert (=> b!187941 m!214833))

(assert (=> b!187839 d!55585))

(declare-fun d!55587 () Bool)

(assert (=> d!55587 (= (array_inv!2429 (_keys!5785 thiss!1248)) (bvsge (size!4083 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187838 d!55587))

(declare-fun d!55589 () Bool)

(assert (=> d!55589 (= (array_inv!2430 (_values!3813 thiss!1248)) (bvsge (size!4084 (_values!3813 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187838 d!55589))

(declare-fun b!187959 () Bool)

(declare-fun res!88863 () Bool)

(declare-fun e!123702 () Bool)

(assert (=> b!187959 (=> (not res!88863) (not e!123702))))

(declare-fun lt!93025 () SeekEntryResult!642)

(assert (=> b!187959 (= res!88863 (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4741 lt!93025)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187959 (and (bvsge (index!4741 lt!93025) #b00000000000000000000000000000000) (bvslt (index!4741 lt!93025) (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun d!55591 () Bool)

(declare-fun e!123700 () Bool)

(assert (=> d!55591 e!123700))

(declare-fun c!33767 () Bool)

(assert (=> d!55591 (= c!33767 ((_ is MissingZero!642) lt!93025))))

(assert (=> d!55591 (= lt!93025 (seekEntryOrOpen!0 key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(declare-fun lt!93026 () Unit!5665)

(declare-fun choose!1009 (array!7979 array!7981 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 64) Int) Unit!5665)

(assert (=> d!55591 (= lt!93026 (choose!1009 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)))))

(assert (=> d!55591 (validMask!0 (mask!8984 thiss!1248))))

(assert (=> d!55591 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!150 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)) lt!93026)))

(declare-fun b!187960 () Bool)

(assert (=> b!187960 (and (bvsge (index!4738 lt!93025) #b00000000000000000000000000000000) (bvslt (index!4738 lt!93025) (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun res!88862 () Bool)

(assert (=> b!187960 (= res!88862 (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4738 lt!93025)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123703 () Bool)

(assert (=> b!187960 (=> (not res!88862) (not e!123703))))

(declare-fun b!187961 () Bool)

(declare-fun res!88865 () Bool)

(assert (=> b!187961 (=> (not res!88865) (not e!123702))))

(declare-fun call!18922 () Bool)

(assert (=> b!187961 (= res!88865 call!18922)))

(declare-fun e!123701 () Bool)

(assert (=> b!187961 (= e!123701 e!123702)))

(declare-fun bm!18918 () Bool)

(declare-fun call!18921 () Bool)

(declare-fun arrayContainsKey!0 (array!7979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18918 (= call!18921 (arrayContainsKey!0 (_keys!5785 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!187962 () Bool)

(assert (=> b!187962 (= e!123701 ((_ is Undefined!642) lt!93025))))

(declare-fun b!187963 () Bool)

(assert (=> b!187963 (= e!123703 (not call!18921))))

(declare-fun b!187964 () Bool)

(assert (=> b!187964 (= e!123702 (not call!18921))))

(declare-fun bm!18919 () Bool)

(assert (=> bm!18919 (= call!18922 (inRange!0 (ite c!33767 (index!4738 lt!93025) (index!4741 lt!93025)) (mask!8984 thiss!1248)))))

(declare-fun b!187965 () Bool)

(assert (=> b!187965 (= e!123700 e!123701)))

(declare-fun c!33766 () Bool)

(assert (=> b!187965 (= c!33766 ((_ is MissingVacant!642) lt!93025))))

(declare-fun b!187966 () Bool)

(assert (=> b!187966 (= e!123700 e!123703)))

(declare-fun res!88864 () Bool)

(assert (=> b!187966 (= res!88864 call!18922)))

(assert (=> b!187966 (=> (not res!88864) (not e!123703))))

(assert (= (and d!55591 c!33767) b!187966))

(assert (= (and d!55591 (not c!33767)) b!187965))

(assert (= (and b!187966 res!88864) b!187960))

(assert (= (and b!187960 res!88862) b!187963))

(assert (= (and b!187965 c!33766) b!187961))

(assert (= (and b!187965 (not c!33766)) b!187962))

(assert (= (and b!187961 res!88865) b!187959))

(assert (= (and b!187959 res!88863) b!187964))

(assert (= (or b!187966 b!187961) bm!18919))

(assert (= (or b!187963 b!187964) bm!18918))

(declare-fun m!214835 () Bool)

(assert (=> bm!18919 m!214835))

(declare-fun m!214837 () Bool)

(assert (=> bm!18918 m!214837))

(assert (=> d!55591 m!214737))

(declare-fun m!214839 () Bool)

(assert (=> d!55591 m!214839))

(assert (=> d!55591 m!214741))

(declare-fun m!214841 () Bool)

(assert (=> b!187959 m!214841))

(declare-fun m!214843 () Bool)

(assert (=> b!187960 m!214843))

(assert (=> b!187842 d!55591))

(declare-fun d!55593 () Bool)

(assert (=> d!55593 (= (validMask!0 (mask!8984 thiss!1248)) (and (or (= (mask!8984 thiss!1248) #b00000000000000000000000000000111) (= (mask!8984 thiss!1248) #b00000000000000000000000000001111) (= (mask!8984 thiss!1248) #b00000000000000000000000000011111) (= (mask!8984 thiss!1248) #b00000000000000000000000000111111) (= (mask!8984 thiss!1248) #b00000000000000000000000001111111) (= (mask!8984 thiss!1248) #b00000000000000000000000011111111) (= (mask!8984 thiss!1248) #b00000000000000000000000111111111) (= (mask!8984 thiss!1248) #b00000000000000000000001111111111) (= (mask!8984 thiss!1248) #b00000000000000000000011111111111) (= (mask!8984 thiss!1248) #b00000000000000000000111111111111) (= (mask!8984 thiss!1248) #b00000000000000000001111111111111) (= (mask!8984 thiss!1248) #b00000000000000000011111111111111) (= (mask!8984 thiss!1248) #b00000000000000000111111111111111) (= (mask!8984 thiss!1248) #b00000000000000001111111111111111) (= (mask!8984 thiss!1248) #b00000000000000011111111111111111) (= (mask!8984 thiss!1248) #b00000000000000111111111111111111) (= (mask!8984 thiss!1248) #b00000000000001111111111111111111) (= (mask!8984 thiss!1248) #b00000000000011111111111111111111) (= (mask!8984 thiss!1248) #b00000000000111111111111111111111) (= (mask!8984 thiss!1248) #b00000000001111111111111111111111) (= (mask!8984 thiss!1248) #b00000000011111111111111111111111) (= (mask!8984 thiss!1248) #b00000000111111111111111111111111) (= (mask!8984 thiss!1248) #b00000001111111111111111111111111) (= (mask!8984 thiss!1248) #b00000011111111111111111111111111) (= (mask!8984 thiss!1248) #b00000111111111111111111111111111) (= (mask!8984 thiss!1248) #b00001111111111111111111111111111) (= (mask!8984 thiss!1248) #b00011111111111111111111111111111) (= (mask!8984 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8984 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!187833 d!55593))

(declare-fun d!55595 () Bool)

(declare-fun e!123709 () Bool)

(assert (=> d!55595 e!123709))

(declare-fun res!88868 () Bool)

(assert (=> d!55595 (=> res!88868 e!123709)))

(declare-fun lt!93038 () Bool)

(assert (=> d!55595 (= res!88868 (not lt!93038))))

(declare-fun lt!93036 () Bool)

(assert (=> d!55595 (= lt!93038 lt!93036)))

(declare-fun lt!93037 () Unit!5665)

(declare-fun e!123708 () Unit!5665)

(assert (=> d!55595 (= lt!93037 e!123708)))

(declare-fun c!33770 () Bool)

(assert (=> d!55595 (= c!33770 lt!93036)))

(declare-fun containsKey!233 (List!2353 (_ BitVec 64)) Bool)

(assert (=> d!55595 (= lt!93036 (containsKey!233 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(assert (=> d!55595 (= (contains!1306 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)) key!828) lt!93038)))

(declare-fun b!187973 () Bool)

(declare-fun lt!93035 () Unit!5665)

(assert (=> b!187973 (= e!123708 lt!93035)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!181 (List!2353 (_ BitVec 64)) Unit!5665)

(assert (=> b!187973 (= lt!93035 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(declare-datatypes ((Option!236 0))(
  ( (Some!235 (v!4158 V!5497)) (None!234) )
))
(declare-fun isDefined!182 (Option!236) Bool)

(declare-fun getValueByKey!230 (List!2353 (_ BitVec 64)) Option!236)

(assert (=> b!187973 (isDefined!182 (getValueByKey!230 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(declare-fun b!187974 () Bool)

(declare-fun Unit!5671 () Unit!5665)

(assert (=> b!187974 (= e!123708 Unit!5671)))

(declare-fun b!187975 () Bool)

(assert (=> b!187975 (= e!123709 (isDefined!182 (getValueByKey!230 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828)))))

(assert (= (and d!55595 c!33770) b!187973))

(assert (= (and d!55595 (not c!33770)) b!187974))

(assert (= (and d!55595 (not res!88868)) b!187975))

(declare-fun m!214845 () Bool)

(assert (=> d!55595 m!214845))

(declare-fun m!214847 () Bool)

(assert (=> b!187973 m!214847))

(declare-fun m!214849 () Bool)

(assert (=> b!187973 m!214849))

(assert (=> b!187973 m!214849))

(declare-fun m!214851 () Bool)

(assert (=> b!187973 m!214851))

(assert (=> b!187975 m!214849))

(assert (=> b!187975 m!214849))

(assert (=> b!187975 m!214851))

(assert (=> b!187833 d!55595))

(declare-fun b!188018 () Bool)

(declare-fun e!123748 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!188018 (= e!123748 (validKeyInArray!0 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18934 () Bool)

(declare-fun call!18937 () ListLongMap!2353)

(declare-fun getCurrentListMapNoExtraKeys!203 (array!7979 array!7981 (_ BitVec 32) (_ BitVec 32) V!5497 V!5497 (_ BitVec 32) Int) ListLongMap!2353)

(assert (=> bm!18934 (= call!18937 (getCurrentListMapNoExtraKeys!203 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))

(declare-fun b!188019 () Bool)

(declare-fun e!123740 () Bool)

(declare-fun e!123743 () Bool)

(assert (=> b!188019 (= e!123740 e!123743)))

(declare-fun res!88895 () Bool)

(declare-fun call!18938 () Bool)

(assert (=> b!188019 (= res!88895 call!18938)))

(assert (=> b!188019 (=> (not res!88895) (not e!123743))))

(declare-fun b!188020 () Bool)

(declare-fun e!123742 () Bool)

(assert (=> b!188020 (= e!123742 (validKeyInArray!0 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55597 () Bool)

(declare-fun e!123736 () Bool)

(assert (=> d!55597 e!123736))

(declare-fun res!88892 () Bool)

(assert (=> d!55597 (=> (not res!88892) (not e!123736))))

(assert (=> d!55597 (= res!88892 (or (bvsge #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))))

(declare-fun lt!93092 () ListLongMap!2353)

(declare-fun lt!93093 () ListLongMap!2353)

(assert (=> d!55597 (= lt!93092 lt!93093)))

(declare-fun lt!93101 () Unit!5665)

(declare-fun e!123738 () Unit!5665)

(assert (=> d!55597 (= lt!93101 e!123738)))

(declare-fun c!33787 () Bool)

(assert (=> d!55597 (= c!33787 e!123742)))

(declare-fun res!88891 () Bool)

(assert (=> d!55597 (=> (not res!88891) (not e!123742))))

(assert (=> d!55597 (= res!88891 (bvslt #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun e!123739 () ListLongMap!2353)

(assert (=> d!55597 (= lt!93093 e!123739)))

(declare-fun c!33786 () Bool)

(assert (=> d!55597 (= c!33786 (and (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55597 (validMask!0 (mask!8984 thiss!1248))))

(assert (=> d!55597 (= (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)) lt!93092)))

(declare-fun b!188021 () Bool)

(declare-fun e!123746 () Bool)

(declare-fun apply!172 (ListLongMap!2353 (_ BitVec 64)) V!5497)

(declare-fun get!2178 (ValueCell!1850 V!5497) V!5497)

(declare-fun dynLambda!515 (Int (_ BitVec 64)) V!5497)

(assert (=> b!188021 (= e!123746 (= (apply!172 lt!93092 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)) (get!2178 (select (arr!3765 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!188021 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4084 (_values!3813 thiss!1248))))))

(assert (=> b!188021 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun b!188022 () Bool)

(declare-fun c!33785 () Bool)

(assert (=> b!188022 (= c!33785 (and (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!123737 () ListLongMap!2353)

(declare-fun e!123745 () ListLongMap!2353)

(assert (=> b!188022 (= e!123737 e!123745)))

(declare-fun b!188023 () Bool)

(declare-fun res!88888 () Bool)

(assert (=> b!188023 (=> (not res!88888) (not e!123736))))

(declare-fun e!123741 () Bool)

(assert (=> b!188023 (= res!88888 e!123741)))

(declare-fun c!33784 () Bool)

(assert (=> b!188023 (= c!33784 (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!188024 () Bool)

(declare-fun lt!93097 () Unit!5665)

(assert (=> b!188024 (= e!123738 lt!93097)))

(declare-fun lt!93098 () ListLongMap!2353)

(assert (=> b!188024 (= lt!93098 (getCurrentListMapNoExtraKeys!203 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))

(declare-fun lt!93083 () (_ BitVec 64))

(assert (=> b!188024 (= lt!93083 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93102 () (_ BitVec 64))

(assert (=> b!188024 (= lt!93102 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93095 () Unit!5665)

(declare-fun addStillContains!148 (ListLongMap!2353 (_ BitVec 64) V!5497 (_ BitVec 64)) Unit!5665)

(assert (=> b!188024 (= lt!93095 (addStillContains!148 lt!93098 lt!93083 (zeroValue!3671 thiss!1248) lt!93102))))

(declare-fun +!292 (ListLongMap!2353 tuple2!3432) ListLongMap!2353)

(assert (=> b!188024 (contains!1306 (+!292 lt!93098 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248))) lt!93102)))

(declare-fun lt!93100 () Unit!5665)

(assert (=> b!188024 (= lt!93100 lt!93095)))

(declare-fun lt!93099 () ListLongMap!2353)

(assert (=> b!188024 (= lt!93099 (getCurrentListMapNoExtraKeys!203 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))

(declare-fun lt!93096 () (_ BitVec 64))

(assert (=> b!188024 (= lt!93096 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93084 () (_ BitVec 64))

(assert (=> b!188024 (= lt!93084 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93085 () Unit!5665)

(declare-fun addApplyDifferent!148 (ListLongMap!2353 (_ BitVec 64) V!5497 (_ BitVec 64)) Unit!5665)

(assert (=> b!188024 (= lt!93085 (addApplyDifferent!148 lt!93099 lt!93096 (minValue!3671 thiss!1248) lt!93084))))

(assert (=> b!188024 (= (apply!172 (+!292 lt!93099 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248))) lt!93084) (apply!172 lt!93099 lt!93084))))

(declare-fun lt!93089 () Unit!5665)

(assert (=> b!188024 (= lt!93089 lt!93085)))

(declare-fun lt!93088 () ListLongMap!2353)

(assert (=> b!188024 (= lt!93088 (getCurrentListMapNoExtraKeys!203 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))

(declare-fun lt!93104 () (_ BitVec 64))

(assert (=> b!188024 (= lt!93104 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93103 () (_ BitVec 64))

(assert (=> b!188024 (= lt!93103 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93090 () Unit!5665)

(assert (=> b!188024 (= lt!93090 (addApplyDifferent!148 lt!93088 lt!93104 (zeroValue!3671 thiss!1248) lt!93103))))

(assert (=> b!188024 (= (apply!172 (+!292 lt!93088 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248))) lt!93103) (apply!172 lt!93088 lt!93103))))

(declare-fun lt!93091 () Unit!5665)

(assert (=> b!188024 (= lt!93091 lt!93090)))

(declare-fun lt!93087 () ListLongMap!2353)

(assert (=> b!188024 (= lt!93087 (getCurrentListMapNoExtraKeys!203 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))

(declare-fun lt!93094 () (_ BitVec 64))

(assert (=> b!188024 (= lt!93094 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93086 () (_ BitVec 64))

(assert (=> b!188024 (= lt!93086 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188024 (= lt!93097 (addApplyDifferent!148 lt!93087 lt!93094 (minValue!3671 thiss!1248) lt!93086))))

(assert (=> b!188024 (= (apply!172 (+!292 lt!93087 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248))) lt!93086) (apply!172 lt!93087 lt!93086))))

(declare-fun b!188025 () Bool)

(declare-fun res!88890 () Bool)

(assert (=> b!188025 (=> (not res!88890) (not e!123736))))

(declare-fun e!123747 () Bool)

(assert (=> b!188025 (= res!88890 e!123747)))

(declare-fun res!88889 () Bool)

(assert (=> b!188025 (=> res!88889 e!123747)))

(assert (=> b!188025 (= res!88889 (not e!123748))))

(declare-fun res!88893 () Bool)

(assert (=> b!188025 (=> (not res!88893) (not e!123748))))

(assert (=> b!188025 (= res!88893 (bvslt #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun bm!18935 () Bool)

(assert (=> bm!18935 (= call!18938 (contains!1306 lt!93092 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188026 () Bool)

(declare-fun e!123744 () Bool)

(assert (=> b!188026 (= e!123741 e!123744)))

(declare-fun res!88887 () Bool)

(declare-fun call!18943 () Bool)

(assert (=> b!188026 (= res!88887 call!18943)))

(assert (=> b!188026 (=> (not res!88887) (not e!123744))))

(declare-fun b!188027 () Bool)

(declare-fun call!18939 () ListLongMap!2353)

(assert (=> b!188027 (= e!123745 call!18939)))

(declare-fun b!188028 () Bool)

(assert (=> b!188028 (= e!123736 e!123740)))

(declare-fun c!33783 () Bool)

(assert (=> b!188028 (= c!33783 (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!33788 () Bool)

(declare-fun bm!18936 () Bool)

(declare-fun call!18940 () ListLongMap!2353)

(declare-fun call!18942 () ListLongMap!2353)

(assert (=> bm!18936 (= call!18940 (+!292 (ite c!33786 call!18937 (ite c!33788 call!18942 call!18939)) (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(declare-fun b!188029 () Bool)

(assert (=> b!188029 (= e!123747 e!123746)))

(declare-fun res!88894 () Bool)

(assert (=> b!188029 (=> (not res!88894) (not e!123746))))

(assert (=> b!188029 (= res!88894 (contains!1306 lt!93092 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun b!188030 () Bool)

(assert (=> b!188030 (= e!123743 (= (apply!172 lt!93092 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3671 thiss!1248)))))

(declare-fun b!188031 () Bool)

(declare-fun call!18941 () ListLongMap!2353)

(assert (=> b!188031 (= e!123737 call!18941)))

(declare-fun bm!18937 () Bool)

(assert (=> bm!18937 (= call!18943 (contains!1306 lt!93092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188032 () Bool)

(assert (=> b!188032 (= e!123739 e!123737)))

(assert (=> b!188032 (= c!33788 (and (not (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3567 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18938 () Bool)

(assert (=> bm!18938 (= call!18942 call!18937)))

(declare-fun b!188033 () Bool)

(assert (=> b!188033 (= e!123745 call!18941)))

(declare-fun bm!18939 () Bool)

(assert (=> bm!18939 (= call!18941 call!18940)))

(declare-fun b!188034 () Bool)

(assert (=> b!188034 (= e!123741 (not call!18943))))

(declare-fun b!188035 () Bool)

(assert (=> b!188035 (= e!123739 (+!292 call!18940 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))

(declare-fun b!188036 () Bool)

(declare-fun Unit!5672 () Unit!5665)

(assert (=> b!188036 (= e!123738 Unit!5672)))

(declare-fun b!188037 () Bool)

(assert (=> b!188037 (= e!123740 (not call!18938))))

(declare-fun b!188038 () Bool)

(assert (=> b!188038 (= e!123744 (= (apply!172 lt!93092 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3671 thiss!1248)))))

(declare-fun bm!18940 () Bool)

(assert (=> bm!18940 (= call!18939 call!18942)))

(assert (= (and d!55597 c!33786) b!188035))

(assert (= (and d!55597 (not c!33786)) b!188032))

(assert (= (and b!188032 c!33788) b!188031))

(assert (= (and b!188032 (not c!33788)) b!188022))

(assert (= (and b!188022 c!33785) b!188033))

(assert (= (and b!188022 (not c!33785)) b!188027))

(assert (= (or b!188033 b!188027) bm!18940))

(assert (= (or b!188031 bm!18940) bm!18938))

(assert (= (or b!188031 b!188033) bm!18939))

(assert (= (or b!188035 bm!18938) bm!18934))

(assert (= (or b!188035 bm!18939) bm!18936))

(assert (= (and d!55597 res!88891) b!188020))

(assert (= (and d!55597 c!33787) b!188024))

(assert (= (and d!55597 (not c!33787)) b!188036))

(assert (= (and d!55597 res!88892) b!188025))

(assert (= (and b!188025 res!88893) b!188018))

(assert (= (and b!188025 (not res!88889)) b!188029))

(assert (= (and b!188029 res!88894) b!188021))

(assert (= (and b!188025 res!88890) b!188023))

(assert (= (and b!188023 c!33784) b!188026))

(assert (= (and b!188023 (not c!33784)) b!188034))

(assert (= (and b!188026 res!88887) b!188038))

(assert (= (or b!188026 b!188034) bm!18937))

(assert (= (and b!188023 res!88888) b!188028))

(assert (= (and b!188028 c!33783) b!188019))

(assert (= (and b!188028 (not c!33783)) b!188037))

(assert (= (and b!188019 res!88895) b!188030))

(assert (= (or b!188019 b!188037) bm!18935))

(declare-fun b_lambda!7321 () Bool)

(assert (=> (not b_lambda!7321) (not b!188021)))

(declare-fun t!7242 () Bool)

(declare-fun tb!2847 () Bool)

(assert (=> (and b!187838 (= (defaultEntry!3830 thiss!1248) (defaultEntry!3830 thiss!1248)) t!7242) tb!2847))

(declare-fun result!4835 () Bool)

(assert (=> tb!2847 (= result!4835 tp_is_empty!4387)))

(assert (=> b!188021 t!7242))

(declare-fun b_and!11259 () Bool)

(assert (= b_and!11253 (and (=> t!7242 result!4835) b_and!11259)))

(declare-fun m!214853 () Bool)

(assert (=> b!188018 m!214853))

(assert (=> b!188018 m!214853))

(declare-fun m!214855 () Bool)

(assert (=> b!188018 m!214855))

(declare-fun m!214857 () Bool)

(assert (=> bm!18936 m!214857))

(assert (=> b!188029 m!214853))

(assert (=> b!188029 m!214853))

(declare-fun m!214859 () Bool)

(assert (=> b!188029 m!214859))

(declare-fun m!214861 () Bool)

(assert (=> b!188035 m!214861))

(assert (=> d!55597 m!214741))

(declare-fun m!214863 () Bool)

(assert (=> bm!18935 m!214863))

(declare-fun m!214865 () Bool)

(assert (=> bm!18937 m!214865))

(assert (=> b!188020 m!214853))

(assert (=> b!188020 m!214853))

(assert (=> b!188020 m!214855))

(declare-fun m!214867 () Bool)

(assert (=> b!188030 m!214867))

(declare-fun m!214869 () Bool)

(assert (=> b!188021 m!214869))

(assert (=> b!188021 m!214853))

(assert (=> b!188021 m!214853))

(declare-fun m!214871 () Bool)

(assert (=> b!188021 m!214871))

(assert (=> b!188021 m!214869))

(declare-fun m!214873 () Bool)

(assert (=> b!188021 m!214873))

(declare-fun m!214875 () Bool)

(assert (=> b!188021 m!214875))

(assert (=> b!188021 m!214873))

(declare-fun m!214877 () Bool)

(assert (=> bm!18934 m!214877))

(declare-fun m!214879 () Bool)

(assert (=> b!188038 m!214879))

(declare-fun m!214881 () Bool)

(assert (=> b!188024 m!214881))

(declare-fun m!214883 () Bool)

(assert (=> b!188024 m!214883))

(assert (=> b!188024 m!214853))

(assert (=> b!188024 m!214877))

(declare-fun m!214885 () Bool)

(assert (=> b!188024 m!214885))

(declare-fun m!214887 () Bool)

(assert (=> b!188024 m!214887))

(declare-fun m!214889 () Bool)

(assert (=> b!188024 m!214889))

(declare-fun m!214891 () Bool)

(assert (=> b!188024 m!214891))

(declare-fun m!214893 () Bool)

(assert (=> b!188024 m!214893))

(assert (=> b!188024 m!214891))

(declare-fun m!214895 () Bool)

(assert (=> b!188024 m!214895))

(assert (=> b!188024 m!214885))

(assert (=> b!188024 m!214889))

(declare-fun m!214897 () Bool)

(assert (=> b!188024 m!214897))

(declare-fun m!214899 () Bool)

(assert (=> b!188024 m!214899))

(declare-fun m!214901 () Bool)

(assert (=> b!188024 m!214901))

(assert (=> b!188024 m!214899))

(declare-fun m!214903 () Bool)

(assert (=> b!188024 m!214903))

(declare-fun m!214905 () Bool)

(assert (=> b!188024 m!214905))

(declare-fun m!214907 () Bool)

(assert (=> b!188024 m!214907))

(declare-fun m!214909 () Bool)

(assert (=> b!188024 m!214909))

(assert (=> b!187833 d!55597))

(declare-fun b!188048 () Bool)

(declare-fun e!123754 () Bool)

(assert (=> b!188048 (= e!123754 tp_is_empty!4387)))

(declare-fun condMapEmpty!7569 () Bool)

(declare-fun mapDefault!7569 () ValueCell!1850)

(assert (=> mapNonEmpty!7560 (= condMapEmpty!7569 (= mapRest!7560 ((as const (Array (_ BitVec 32) ValueCell!1850)) mapDefault!7569)))))

(declare-fun mapRes!7569 () Bool)

(assert (=> mapNonEmpty!7560 (= tp!16661 (and e!123754 mapRes!7569))))

(declare-fun b!188047 () Bool)

(declare-fun e!123753 () Bool)

(assert (=> b!188047 (= e!123753 tp_is_empty!4387)))

(declare-fun mapIsEmpty!7569 () Bool)

(assert (=> mapIsEmpty!7569 mapRes!7569))

(declare-fun mapNonEmpty!7569 () Bool)

(declare-fun tp!16677 () Bool)

(assert (=> mapNonEmpty!7569 (= mapRes!7569 (and tp!16677 e!123753))))

(declare-fun mapKey!7569 () (_ BitVec 32))

(declare-fun mapRest!7569 () (Array (_ BitVec 32) ValueCell!1850))

(declare-fun mapValue!7569 () ValueCell!1850)

(assert (=> mapNonEmpty!7569 (= mapRest!7560 (store mapRest!7569 mapKey!7569 mapValue!7569))))

(assert (= (and mapNonEmpty!7560 condMapEmpty!7569) mapIsEmpty!7569))

(assert (= (and mapNonEmpty!7560 (not condMapEmpty!7569)) mapNonEmpty!7569))

(assert (= (and mapNonEmpty!7569 ((_ is ValueCellFull!1850) mapValue!7569)) b!188047))

(assert (= (and mapNonEmpty!7560 ((_ is ValueCellFull!1850) mapDefault!7569)) b!188048))

(declare-fun m!214911 () Bool)

(assert (=> mapNonEmpty!7569 m!214911))

(declare-fun b_lambda!7323 () Bool)

(assert (= b_lambda!7321 (or (and b!187838 b_free!4615) b_lambda!7323)))

(check-sat (not d!55597) (not b!188021) (not bm!18934) (not b_next!4615) (not d!55585) (not d!55591) (not d!55595) (not mapNonEmpty!7569) (not b!188020) (not bm!18935) b_and!11259 (not b_lambda!7323) (not bm!18918) (not b!188024) (not b!188018) (not bm!18937) (not b!188038) (not b!187973) (not bm!18919) (not b!187924) tp_is_empty!4387 (not b!187975) (not b!188035) (not d!55583) (not b!187914) (not bm!18936) (not b!188029) (not b!188030) (not b!187938) (not b!187923) (not b!187922) (not d!55579))
(check-sat b_and!11259 (not b_next!4615))
(get-model)

(declare-fun d!55599 () Bool)

(assert (=> d!55599 (= (validKeyInArray!0 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!188018 d!55599))

(assert (=> d!55591 d!55585))

(declare-fun b!188065 () Bool)

(declare-fun res!88905 () Bool)

(declare-fun e!123766 () Bool)

(assert (=> b!188065 (=> (not res!88905) (not e!123766))))

(declare-fun lt!93107 () SeekEntryResult!642)

(assert (=> b!188065 (= res!88905 (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4741 lt!93107)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188066 () Bool)

(declare-fun e!123765 () Bool)

(declare-fun call!18949 () Bool)

(assert (=> b!188066 (= e!123765 (not call!18949))))

(declare-fun b!188067 () Bool)

(declare-fun res!88904 () Bool)

(assert (=> b!188067 (=> (not res!88904) (not e!123766))))

(declare-fun call!18948 () Bool)

(assert (=> b!188067 (= res!88904 call!18948)))

(declare-fun e!123764 () Bool)

(assert (=> b!188067 (= e!123764 e!123766)))

(declare-fun bm!18945 () Bool)

(assert (=> bm!18945 (= call!18949 (arrayContainsKey!0 (_keys!5785 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!188068 () Bool)

(assert (=> b!188068 (= e!123764 ((_ is Undefined!642) lt!93107))))

(declare-fun b!188069 () Bool)

(declare-fun e!123763 () Bool)

(assert (=> b!188069 (= e!123763 e!123764)))

(declare-fun c!33793 () Bool)

(assert (=> b!188069 (= c!33793 ((_ is MissingVacant!642) lt!93107))))

(declare-fun b!188070 () Bool)

(assert (=> b!188070 (= e!123763 e!123765)))

(declare-fun res!88906 () Bool)

(assert (=> b!188070 (= res!88906 call!18948)))

(assert (=> b!188070 (=> (not res!88906) (not e!123765))))

(declare-fun b!188071 () Bool)

(assert (=> b!188071 (= e!123766 (not call!18949))))

(declare-fun b!188072 () Bool)

(declare-fun res!88907 () Bool)

(assert (=> b!188072 (= res!88907 (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4738 lt!93107)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188072 (=> (not res!88907) (not e!123765))))

(declare-fun c!33794 () Bool)

(declare-fun bm!18946 () Bool)

(assert (=> bm!18946 (= call!18948 (inRange!0 (ite c!33794 (index!4738 lt!93107) (index!4741 lt!93107)) (mask!8984 thiss!1248)))))

(declare-fun d!55601 () Bool)

(assert (=> d!55601 e!123763))

(assert (=> d!55601 (= c!33794 ((_ is MissingZero!642) lt!93107))))

(assert (=> d!55601 (= lt!93107 (seekEntryOrOpen!0 key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(assert (=> d!55601 true))

(declare-fun _$34!1072 () Unit!5665)

(assert (=> d!55601 (= (choose!1009 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)) _$34!1072)))

(assert (= (and d!55601 c!33794) b!188070))

(assert (= (and d!55601 (not c!33794)) b!188069))

(assert (= (and b!188070 res!88906) b!188072))

(assert (= (and b!188072 res!88907) b!188066))

(assert (= (and b!188069 c!33793) b!188067))

(assert (= (and b!188069 (not c!33793)) b!188068))

(assert (= (and b!188067 res!88904) b!188065))

(assert (= (and b!188065 res!88905) b!188071))

(assert (= (or b!188070 b!188067) bm!18946))

(assert (= (or b!188066 b!188071) bm!18945))

(assert (=> d!55601 m!214737))

(assert (=> bm!18945 m!214837))

(declare-fun m!214913 () Bool)

(assert (=> b!188072 m!214913))

(declare-fun m!214915 () Bool)

(assert (=> b!188065 m!214915))

(declare-fun m!214917 () Bool)

(assert (=> bm!18946 m!214917))

(assert (=> d!55591 d!55601))

(assert (=> d!55591 d!55593))

(declare-fun d!55603 () Bool)

(assert (=> d!55603 (= (inRange!0 (index!4739 lt!93011) (mask!8984 thiss!1248)) (and (bvsge (index!4739 lt!93011) #b00000000000000000000000000000000) (bvslt (index!4739 lt!93011) (bvadd (mask!8984 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187914 d!55603))

(assert (=> b!188020 d!55599))

(declare-fun d!55605 () Bool)

(declare-fun e!123769 () Bool)

(assert (=> d!55605 e!123769))

(declare-fun res!88912 () Bool)

(assert (=> d!55605 (=> (not res!88912) (not e!123769))))

(declare-fun lt!93119 () ListLongMap!2353)

(assert (=> d!55605 (= res!88912 (contains!1306 lt!93119 (_1!1727 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(declare-fun lt!93117 () List!2353)

(assert (=> d!55605 (= lt!93119 (ListLongMap!2354 lt!93117))))

(declare-fun lt!93116 () Unit!5665)

(declare-fun lt!93118 () Unit!5665)

(assert (=> d!55605 (= lt!93116 lt!93118)))

(assert (=> d!55605 (= (getValueByKey!230 lt!93117 (_1!1727 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))) (Some!235 (_2!1727 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!121 (List!2353 (_ BitVec 64) V!5497) Unit!5665)

(assert (=> d!55605 (= lt!93118 (lemmaContainsTupThenGetReturnValue!121 lt!93117 (_1!1727 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))) (_2!1727 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(declare-fun insertStrictlySorted!124 (List!2353 (_ BitVec 64) V!5497) List!2353)

(assert (=> d!55605 (= lt!93117 (insertStrictlySorted!124 (toList!1192 call!18940) (_1!1727 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))) (_2!1727 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(assert (=> d!55605 (= (+!292 call!18940 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))) lt!93119)))

(declare-fun b!188077 () Bool)

(declare-fun res!88913 () Bool)

(assert (=> b!188077 (=> (not res!88913) (not e!123769))))

(assert (=> b!188077 (= res!88913 (= (getValueByKey!230 (toList!1192 lt!93119) (_1!1727 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))) (Some!235 (_2!1727 (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))))

(declare-fun b!188078 () Bool)

(declare-fun contains!1308 (List!2353 tuple2!3432) Bool)

(assert (=> b!188078 (= e!123769 (contains!1308 (toList!1192 lt!93119) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))

(assert (= (and d!55605 res!88912) b!188077))

(assert (= (and b!188077 res!88913) b!188078))

(declare-fun m!214919 () Bool)

(assert (=> d!55605 m!214919))

(declare-fun m!214921 () Bool)

(assert (=> d!55605 m!214921))

(declare-fun m!214923 () Bool)

(assert (=> d!55605 m!214923))

(declare-fun m!214925 () Bool)

(assert (=> d!55605 m!214925))

(declare-fun m!214927 () Bool)

(assert (=> b!188077 m!214927))

(declare-fun m!214929 () Bool)

(assert (=> b!188078 m!214929))

(assert (=> b!188035 d!55605))

(declare-fun d!55607 () Bool)

(declare-fun e!123785 () Bool)

(assert (=> d!55607 e!123785))

(declare-fun res!88925 () Bool)

(assert (=> d!55607 (=> (not res!88925) (not e!123785))))

(declare-fun lt!93140 () ListLongMap!2353)

(assert (=> d!55607 (= res!88925 (not (contains!1306 lt!93140 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!123790 () ListLongMap!2353)

(assert (=> d!55607 (= lt!93140 e!123790)))

(declare-fun c!33803 () Bool)

(assert (=> d!55607 (= c!33803 (bvsge #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(assert (=> d!55607 (validMask!0 (mask!8984 thiss!1248))))

(assert (=> d!55607 (= (getCurrentListMapNoExtraKeys!203 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)) lt!93140)))

(declare-fun b!188103 () Bool)

(declare-fun e!123789 () Bool)

(assert (=> b!188103 (= e!123789 (= lt!93140 (getCurrentListMapNoExtraKeys!203 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3830 thiss!1248))))))

(declare-fun b!188104 () Bool)

(declare-fun e!123784 () ListLongMap!2353)

(assert (=> b!188104 (= e!123790 e!123784)))

(declare-fun c!33806 () Bool)

(assert (=> b!188104 (= c!33806 (validKeyInArray!0 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18949 () Bool)

(declare-fun call!18952 () ListLongMap!2353)

(assert (=> bm!18949 (= call!18952 (getCurrentListMapNoExtraKeys!203 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3830 thiss!1248)))))

(declare-fun b!188105 () Bool)

(declare-fun lt!93138 () Unit!5665)

(declare-fun lt!93137 () Unit!5665)

(assert (=> b!188105 (= lt!93138 lt!93137)))

(declare-fun lt!93135 () V!5497)

(declare-fun lt!93134 () (_ BitVec 64))

(declare-fun lt!93139 () (_ BitVec 64))

(declare-fun lt!93136 () ListLongMap!2353)

(assert (=> b!188105 (not (contains!1306 (+!292 lt!93136 (tuple2!3433 lt!93134 lt!93135)) lt!93139))))

(declare-fun addStillNotContains!94 (ListLongMap!2353 (_ BitVec 64) V!5497 (_ BitVec 64)) Unit!5665)

(assert (=> b!188105 (= lt!93137 (addStillNotContains!94 lt!93136 lt!93134 lt!93135 lt!93139))))

(assert (=> b!188105 (= lt!93139 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!188105 (= lt!93135 (get!2178 (select (arr!3765 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!188105 (= lt!93134 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!188105 (= lt!93136 call!18952)))

(assert (=> b!188105 (= e!123784 (+!292 call!18952 (tuple2!3433 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000) (get!2178 (select (arr!3765 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!188106 () Bool)

(declare-fun isEmpty!483 (ListLongMap!2353) Bool)

(assert (=> b!188106 (= e!123789 (isEmpty!483 lt!93140))))

(declare-fun b!188107 () Bool)

(assert (=> b!188107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(assert (=> b!188107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4084 (_values!3813 thiss!1248))))))

(declare-fun e!123788 () Bool)

(assert (=> b!188107 (= e!123788 (= (apply!172 lt!93140 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)) (get!2178 (select (arr!3765 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!188108 () Bool)

(declare-fun e!123787 () Bool)

(assert (=> b!188108 (= e!123785 e!123787)))

(declare-fun c!33804 () Bool)

(declare-fun e!123786 () Bool)

(assert (=> b!188108 (= c!33804 e!123786)))

(declare-fun res!88923 () Bool)

(assert (=> b!188108 (=> (not res!88923) (not e!123786))))

(assert (=> b!188108 (= res!88923 (bvslt #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun b!188109 () Bool)

(declare-fun res!88924 () Bool)

(assert (=> b!188109 (=> (not res!88924) (not e!123785))))

(assert (=> b!188109 (= res!88924 (not (contains!1306 lt!93140 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!188110 () Bool)

(assert (=> b!188110 (= e!123786 (validKeyInArray!0 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188110 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!188111 () Bool)

(assert (=> b!188111 (= e!123790 (ListLongMap!2354 Nil!2350))))

(declare-fun b!188112 () Bool)

(assert (=> b!188112 (= e!123784 call!18952)))

(declare-fun b!188113 () Bool)

(assert (=> b!188113 (= e!123787 e!123788)))

(assert (=> b!188113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun res!88922 () Bool)

(assert (=> b!188113 (= res!88922 (contains!1306 lt!93140 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188113 (=> (not res!88922) (not e!123788))))

(declare-fun b!188114 () Bool)

(assert (=> b!188114 (= e!123787 e!123789)))

(declare-fun c!33805 () Bool)

(assert (=> b!188114 (= c!33805 (bvslt #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(assert (= (and d!55607 c!33803) b!188111))

(assert (= (and d!55607 (not c!33803)) b!188104))

(assert (= (and b!188104 c!33806) b!188105))

(assert (= (and b!188104 (not c!33806)) b!188112))

(assert (= (or b!188105 b!188112) bm!18949))

(assert (= (and d!55607 res!88925) b!188109))

(assert (= (and b!188109 res!88924) b!188108))

(assert (= (and b!188108 res!88923) b!188110))

(assert (= (and b!188108 c!33804) b!188113))

(assert (= (and b!188108 (not c!33804)) b!188114))

(assert (= (and b!188113 res!88922) b!188107))

(assert (= (and b!188114 c!33805) b!188103))

(assert (= (and b!188114 (not c!33805)) b!188106))

(declare-fun b_lambda!7325 () Bool)

(assert (=> (not b_lambda!7325) (not b!188105)))

(assert (=> b!188105 t!7242))

(declare-fun b_and!11261 () Bool)

(assert (= b_and!11259 (and (=> t!7242 result!4835) b_and!11261)))

(declare-fun b_lambda!7327 () Bool)

(assert (=> (not b_lambda!7327) (not b!188107)))

(assert (=> b!188107 t!7242))

(declare-fun b_and!11263 () Bool)

(assert (= b_and!11261 (and (=> t!7242 result!4835) b_and!11263)))

(assert (=> b!188105 m!214869))

(assert (=> b!188105 m!214873))

(assert (=> b!188105 m!214875))

(declare-fun m!214931 () Bool)

(assert (=> b!188105 m!214931))

(assert (=> b!188105 m!214873))

(assert (=> b!188105 m!214869))

(declare-fun m!214933 () Bool)

(assert (=> b!188105 m!214933))

(assert (=> b!188105 m!214933))

(declare-fun m!214935 () Bool)

(assert (=> b!188105 m!214935))

(declare-fun m!214937 () Bool)

(assert (=> b!188105 m!214937))

(assert (=> b!188105 m!214853))

(declare-fun m!214939 () Bool)

(assert (=> b!188103 m!214939))

(declare-fun m!214941 () Bool)

(assert (=> d!55607 m!214941))

(assert (=> d!55607 m!214741))

(assert (=> b!188110 m!214853))

(assert (=> b!188110 m!214853))

(assert (=> b!188110 m!214855))

(assert (=> b!188113 m!214853))

(assert (=> b!188113 m!214853))

(declare-fun m!214943 () Bool)

(assert (=> b!188113 m!214943))

(assert (=> b!188107 m!214869))

(assert (=> b!188107 m!214873))

(assert (=> b!188107 m!214875))

(assert (=> b!188107 m!214853))

(declare-fun m!214945 () Bool)

(assert (=> b!188107 m!214945))

(assert (=> b!188107 m!214873))

(assert (=> b!188107 m!214869))

(assert (=> b!188107 m!214853))

(assert (=> bm!18949 m!214939))

(declare-fun m!214947 () Bool)

(assert (=> b!188106 m!214947))

(declare-fun m!214949 () Bool)

(assert (=> b!188109 m!214949))

(assert (=> b!188104 m!214853))

(assert (=> b!188104 m!214853))

(assert (=> b!188104 m!214855))

(assert (=> bm!18934 d!55607))

(declare-fun d!55609 () Bool)

(declare-fun get!2179 (Option!236) V!5497)

(assert (=> d!55609 (= (apply!172 lt!93092 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2179 (getValueByKey!230 (toList!1192 lt!93092) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7595 () Bool)

(assert (= bs!7595 d!55609))

(declare-fun m!214951 () Bool)

(assert (=> bs!7595 m!214951))

(assert (=> bs!7595 m!214951))

(declare-fun m!214953 () Bool)

(assert (=> bs!7595 m!214953))

(assert (=> b!188038 d!55609))

(declare-fun d!55611 () Bool)

(assert (=> d!55611 (= (apply!172 lt!93092 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)) (get!2179 (getValueByKey!230 (toList!1192 lt!93092) (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7596 () Bool)

(assert (= bs!7596 d!55611))

(assert (=> bs!7596 m!214853))

(declare-fun m!214955 () Bool)

(assert (=> bs!7596 m!214955))

(assert (=> bs!7596 m!214955))

(declare-fun m!214957 () Bool)

(assert (=> bs!7596 m!214957))

(assert (=> b!188021 d!55611))

(declare-fun d!55613 () Bool)

(declare-fun c!33809 () Bool)

(assert (=> d!55613 (= c!33809 ((_ is ValueCellFull!1850) (select (arr!3765 (_values!3813 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!123793 () V!5497)

(assert (=> d!55613 (= (get!2178 (select (arr!3765 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!123793)))

(declare-fun b!188119 () Bool)

(declare-fun get!2180 (ValueCell!1850 V!5497) V!5497)

(assert (=> b!188119 (= e!123793 (get!2180 (select (arr!3765 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!188120 () Bool)

(declare-fun get!2181 (ValueCell!1850 V!5497) V!5497)

(assert (=> b!188120 (= e!123793 (get!2181 (select (arr!3765 (_values!3813 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!515 (defaultEntry!3830 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55613 c!33809) b!188119))

(assert (= (and d!55613 (not c!33809)) b!188120))

(assert (=> b!188119 m!214869))

(assert (=> b!188119 m!214873))

(declare-fun m!214959 () Bool)

(assert (=> b!188119 m!214959))

(assert (=> b!188120 m!214869))

(assert (=> b!188120 m!214873))

(declare-fun m!214961 () Bool)

(assert (=> b!188120 m!214961))

(assert (=> b!188021 d!55613))

(declare-fun d!55615 () Bool)

(declare-fun isEmpty!484 (Option!236) Bool)

(assert (=> d!55615 (= (isDefined!182 (getValueByKey!230 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828)) (not (isEmpty!484 (getValueByKey!230 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))))

(declare-fun bs!7597 () Bool)

(assert (= bs!7597 d!55615))

(assert (=> bs!7597 m!214849))

(declare-fun m!214963 () Bool)

(assert (=> bs!7597 m!214963))

(assert (=> b!187975 d!55615))

(declare-fun b!188132 () Bool)

(declare-fun e!123799 () Option!236)

(assert (=> b!188132 (= e!123799 None!234)))

(declare-fun b!188131 () Bool)

(assert (=> b!188131 (= e!123799 (getValueByKey!230 (t!7239 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) key!828))))

(declare-fun d!55617 () Bool)

(declare-fun c!33814 () Bool)

(assert (=> d!55617 (= c!33814 (and ((_ is Cons!2349) (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) (= (_1!1727 (h!2985 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) key!828)))))

(declare-fun e!123798 () Option!236)

(assert (=> d!55617 (= (getValueByKey!230 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828) e!123798)))

(declare-fun b!188130 () Bool)

(assert (=> b!188130 (= e!123798 e!123799)))

(declare-fun c!33815 () Bool)

(assert (=> b!188130 (= c!33815 (and ((_ is Cons!2349) (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) (not (= (_1!1727 (h!2985 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) key!828))))))

(declare-fun b!188129 () Bool)

(assert (=> b!188129 (= e!123798 (Some!235 (_2!1727 (h!2985 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))))))

(assert (= (and d!55617 c!33814) b!188129))

(assert (= (and d!55617 (not c!33814)) b!188130))

(assert (= (and b!188130 c!33815) b!188131))

(assert (= (and b!188130 (not c!33815)) b!188132))

(declare-fun m!214965 () Bool)

(assert (=> b!188131 m!214965))

(assert (=> b!187975 d!55617))

(declare-fun d!55619 () Bool)

(assert (=> d!55619 (= (apply!172 (+!292 lt!93087 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248))) lt!93086) (apply!172 lt!93087 lt!93086))))

(declare-fun lt!93143 () Unit!5665)

(declare-fun choose!1010 (ListLongMap!2353 (_ BitVec 64) V!5497 (_ BitVec 64)) Unit!5665)

(assert (=> d!55619 (= lt!93143 (choose!1010 lt!93087 lt!93094 (minValue!3671 thiss!1248) lt!93086))))

(declare-fun e!123802 () Bool)

(assert (=> d!55619 e!123802))

(declare-fun res!88928 () Bool)

(assert (=> d!55619 (=> (not res!88928) (not e!123802))))

(assert (=> d!55619 (= res!88928 (contains!1306 lt!93087 lt!93086))))

(assert (=> d!55619 (= (addApplyDifferent!148 lt!93087 lt!93094 (minValue!3671 thiss!1248) lt!93086) lt!93143)))

(declare-fun b!188136 () Bool)

(assert (=> b!188136 (= e!123802 (not (= lt!93086 lt!93094)))))

(assert (= (and d!55619 res!88928) b!188136))

(declare-fun m!214967 () Bool)

(assert (=> d!55619 m!214967))

(assert (=> d!55619 m!214889))

(assert (=> d!55619 m!214883))

(assert (=> d!55619 m!214889))

(assert (=> d!55619 m!214897))

(declare-fun m!214969 () Bool)

(assert (=> d!55619 m!214969))

(assert (=> b!188024 d!55619))

(assert (=> b!188024 d!55607))

(declare-fun d!55621 () Bool)

(assert (=> d!55621 (= (apply!172 lt!93087 lt!93086) (get!2179 (getValueByKey!230 (toList!1192 lt!93087) lt!93086)))))

(declare-fun bs!7598 () Bool)

(assert (= bs!7598 d!55621))

(declare-fun m!214971 () Bool)

(assert (=> bs!7598 m!214971))

(assert (=> bs!7598 m!214971))

(declare-fun m!214973 () Bool)

(assert (=> bs!7598 m!214973))

(assert (=> b!188024 d!55621))

(declare-fun d!55623 () Bool)

(assert (=> d!55623 (= (apply!172 (+!292 lt!93087 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248))) lt!93086) (get!2179 (getValueByKey!230 (toList!1192 (+!292 lt!93087 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248)))) lt!93086)))))

(declare-fun bs!7599 () Bool)

(assert (= bs!7599 d!55623))

(declare-fun m!214975 () Bool)

(assert (=> bs!7599 m!214975))

(assert (=> bs!7599 m!214975))

(declare-fun m!214977 () Bool)

(assert (=> bs!7599 m!214977))

(assert (=> b!188024 d!55623))

(declare-fun d!55625 () Bool)

(assert (=> d!55625 (= (apply!172 (+!292 lt!93088 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248))) lt!93103) (apply!172 lt!93088 lt!93103))))

(declare-fun lt!93144 () Unit!5665)

(assert (=> d!55625 (= lt!93144 (choose!1010 lt!93088 lt!93104 (zeroValue!3671 thiss!1248) lt!93103))))

(declare-fun e!123803 () Bool)

(assert (=> d!55625 e!123803))

(declare-fun res!88929 () Bool)

(assert (=> d!55625 (=> (not res!88929) (not e!123803))))

(assert (=> d!55625 (= res!88929 (contains!1306 lt!93088 lt!93103))))

(assert (=> d!55625 (= (addApplyDifferent!148 lt!93088 lt!93104 (zeroValue!3671 thiss!1248) lt!93103) lt!93144)))

(declare-fun b!188137 () Bool)

(assert (=> b!188137 (= e!123803 (not (= lt!93103 lt!93104)))))

(assert (= (and d!55625 res!88929) b!188137))

(declare-fun m!214979 () Bool)

(assert (=> d!55625 m!214979))

(assert (=> d!55625 m!214885))

(assert (=> d!55625 m!214893))

(assert (=> d!55625 m!214885))

(assert (=> d!55625 m!214887))

(declare-fun m!214981 () Bool)

(assert (=> d!55625 m!214981))

(assert (=> b!188024 d!55625))

(declare-fun d!55627 () Bool)

(assert (=> d!55627 (= (apply!172 (+!292 lt!93099 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248))) lt!93084) (apply!172 lt!93099 lt!93084))))

(declare-fun lt!93145 () Unit!5665)

(assert (=> d!55627 (= lt!93145 (choose!1010 lt!93099 lt!93096 (minValue!3671 thiss!1248) lt!93084))))

(declare-fun e!123804 () Bool)

(assert (=> d!55627 e!123804))

(declare-fun res!88930 () Bool)

(assert (=> d!55627 (=> (not res!88930) (not e!123804))))

(assert (=> d!55627 (= res!88930 (contains!1306 lt!93099 lt!93084))))

(assert (=> d!55627 (= (addApplyDifferent!148 lt!93099 lt!93096 (minValue!3671 thiss!1248) lt!93084) lt!93145)))

(declare-fun b!188138 () Bool)

(assert (=> b!188138 (= e!123804 (not (= lt!93084 lt!93096)))))

(assert (= (and d!55627 res!88930) b!188138))

(declare-fun m!214983 () Bool)

(assert (=> d!55627 m!214983))

(assert (=> d!55627 m!214891))

(assert (=> d!55627 m!214881))

(assert (=> d!55627 m!214891))

(assert (=> d!55627 m!214895))

(declare-fun m!214985 () Bool)

(assert (=> d!55627 m!214985))

(assert (=> b!188024 d!55627))

(declare-fun d!55629 () Bool)

(assert (=> d!55629 (= (apply!172 lt!93099 lt!93084) (get!2179 (getValueByKey!230 (toList!1192 lt!93099) lt!93084)))))

(declare-fun bs!7600 () Bool)

(assert (= bs!7600 d!55629))

(declare-fun m!214987 () Bool)

(assert (=> bs!7600 m!214987))

(assert (=> bs!7600 m!214987))

(declare-fun m!214989 () Bool)

(assert (=> bs!7600 m!214989))

(assert (=> b!188024 d!55629))

(declare-fun d!55631 () Bool)

(assert (=> d!55631 (= (apply!172 (+!292 lt!93099 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248))) lt!93084) (get!2179 (getValueByKey!230 (toList!1192 (+!292 lt!93099 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248)))) lt!93084)))))

(declare-fun bs!7601 () Bool)

(assert (= bs!7601 d!55631))

(declare-fun m!214991 () Bool)

(assert (=> bs!7601 m!214991))

(assert (=> bs!7601 m!214991))

(declare-fun m!214993 () Bool)

(assert (=> bs!7601 m!214993))

(assert (=> b!188024 d!55631))

(declare-fun d!55633 () Bool)

(assert (=> d!55633 (contains!1306 (+!292 lt!93098 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248))) lt!93102)))

(declare-fun lt!93148 () Unit!5665)

(declare-fun choose!1011 (ListLongMap!2353 (_ BitVec 64) V!5497 (_ BitVec 64)) Unit!5665)

(assert (=> d!55633 (= lt!93148 (choose!1011 lt!93098 lt!93083 (zeroValue!3671 thiss!1248) lt!93102))))

(assert (=> d!55633 (contains!1306 lt!93098 lt!93102)))

(assert (=> d!55633 (= (addStillContains!148 lt!93098 lt!93083 (zeroValue!3671 thiss!1248) lt!93102) lt!93148)))

(declare-fun bs!7602 () Bool)

(assert (= bs!7602 d!55633))

(assert (=> bs!7602 m!214899))

(assert (=> bs!7602 m!214899))

(assert (=> bs!7602 m!214903))

(declare-fun m!214995 () Bool)

(assert (=> bs!7602 m!214995))

(declare-fun m!214997 () Bool)

(assert (=> bs!7602 m!214997))

(assert (=> b!188024 d!55633))

(declare-fun d!55635 () Bool)

(assert (=> d!55635 (= (apply!172 (+!292 lt!93088 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248))) lt!93103) (get!2179 (getValueByKey!230 (toList!1192 (+!292 lt!93088 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248)))) lt!93103)))))

(declare-fun bs!7603 () Bool)

(assert (= bs!7603 d!55635))

(declare-fun m!214999 () Bool)

(assert (=> bs!7603 m!214999))

(assert (=> bs!7603 m!214999))

(declare-fun m!215001 () Bool)

(assert (=> bs!7603 m!215001))

(assert (=> b!188024 d!55635))

(declare-fun d!55637 () Bool)

(assert (=> d!55637 (= (apply!172 lt!93088 lt!93103) (get!2179 (getValueByKey!230 (toList!1192 lt!93088) lt!93103)))))

(declare-fun bs!7604 () Bool)

(assert (= bs!7604 d!55637))

(declare-fun m!215003 () Bool)

(assert (=> bs!7604 m!215003))

(assert (=> bs!7604 m!215003))

(declare-fun m!215005 () Bool)

(assert (=> bs!7604 m!215005))

(assert (=> b!188024 d!55637))

(declare-fun d!55639 () Bool)

(declare-fun e!123805 () Bool)

(assert (=> d!55639 e!123805))

(declare-fun res!88931 () Bool)

(assert (=> d!55639 (=> (not res!88931) (not e!123805))))

(declare-fun lt!93152 () ListLongMap!2353)

(assert (=> d!55639 (= res!88931 (contains!1306 lt!93152 (_1!1727 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248)))))))

(declare-fun lt!93150 () List!2353)

(assert (=> d!55639 (= lt!93152 (ListLongMap!2354 lt!93150))))

(declare-fun lt!93149 () Unit!5665)

(declare-fun lt!93151 () Unit!5665)

(assert (=> d!55639 (= lt!93149 lt!93151)))

(assert (=> d!55639 (= (getValueByKey!230 lt!93150 (_1!1727 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248)))) (Some!235 (_2!1727 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248)))))))

(assert (=> d!55639 (= lt!93151 (lemmaContainsTupThenGetReturnValue!121 lt!93150 (_1!1727 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248))) (_2!1727 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248)))))))

(assert (=> d!55639 (= lt!93150 (insertStrictlySorted!124 (toList!1192 lt!93087) (_1!1727 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248))) (_2!1727 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248)))))))

(assert (=> d!55639 (= (+!292 lt!93087 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248))) lt!93152)))

(declare-fun b!188140 () Bool)

(declare-fun res!88932 () Bool)

(assert (=> b!188140 (=> (not res!88932) (not e!123805))))

(assert (=> b!188140 (= res!88932 (= (getValueByKey!230 (toList!1192 lt!93152) (_1!1727 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248)))) (Some!235 (_2!1727 (tuple2!3433 lt!93094 (minValue!3671 thiss!1248))))))))

(declare-fun b!188141 () Bool)

(assert (=> b!188141 (= e!123805 (contains!1308 (toList!1192 lt!93152) (tuple2!3433 lt!93094 (minValue!3671 thiss!1248))))))

(assert (= (and d!55639 res!88931) b!188140))

(assert (= (and b!188140 res!88932) b!188141))

(declare-fun m!215007 () Bool)

(assert (=> d!55639 m!215007))

(declare-fun m!215009 () Bool)

(assert (=> d!55639 m!215009))

(declare-fun m!215011 () Bool)

(assert (=> d!55639 m!215011))

(declare-fun m!215013 () Bool)

(assert (=> d!55639 m!215013))

(declare-fun m!215015 () Bool)

(assert (=> b!188140 m!215015))

(declare-fun m!215017 () Bool)

(assert (=> b!188141 m!215017))

(assert (=> b!188024 d!55639))

(declare-fun d!55641 () Bool)

(declare-fun e!123807 () Bool)

(assert (=> d!55641 e!123807))

(declare-fun res!88933 () Bool)

(assert (=> d!55641 (=> res!88933 e!123807)))

(declare-fun lt!93156 () Bool)

(assert (=> d!55641 (= res!88933 (not lt!93156))))

(declare-fun lt!93154 () Bool)

(assert (=> d!55641 (= lt!93156 lt!93154)))

(declare-fun lt!93155 () Unit!5665)

(declare-fun e!123806 () Unit!5665)

(assert (=> d!55641 (= lt!93155 e!123806)))

(declare-fun c!33816 () Bool)

(assert (=> d!55641 (= c!33816 lt!93154)))

(assert (=> d!55641 (= lt!93154 (containsKey!233 (toList!1192 (+!292 lt!93098 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248)))) lt!93102))))

(assert (=> d!55641 (= (contains!1306 (+!292 lt!93098 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248))) lt!93102) lt!93156)))

(declare-fun b!188142 () Bool)

(declare-fun lt!93153 () Unit!5665)

(assert (=> b!188142 (= e!123806 lt!93153)))

(assert (=> b!188142 (= lt!93153 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1192 (+!292 lt!93098 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248)))) lt!93102))))

(assert (=> b!188142 (isDefined!182 (getValueByKey!230 (toList!1192 (+!292 lt!93098 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248)))) lt!93102))))

(declare-fun b!188143 () Bool)

(declare-fun Unit!5673 () Unit!5665)

(assert (=> b!188143 (= e!123806 Unit!5673)))

(declare-fun b!188144 () Bool)

(assert (=> b!188144 (= e!123807 (isDefined!182 (getValueByKey!230 (toList!1192 (+!292 lt!93098 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248)))) lt!93102)))))

(assert (= (and d!55641 c!33816) b!188142))

(assert (= (and d!55641 (not c!33816)) b!188143))

(assert (= (and d!55641 (not res!88933)) b!188144))

(declare-fun m!215019 () Bool)

(assert (=> d!55641 m!215019))

(declare-fun m!215021 () Bool)

(assert (=> b!188142 m!215021))

(declare-fun m!215023 () Bool)

(assert (=> b!188142 m!215023))

(assert (=> b!188142 m!215023))

(declare-fun m!215025 () Bool)

(assert (=> b!188142 m!215025))

(assert (=> b!188144 m!215023))

(assert (=> b!188144 m!215023))

(assert (=> b!188144 m!215025))

(assert (=> b!188024 d!55641))

(declare-fun d!55643 () Bool)

(declare-fun e!123808 () Bool)

(assert (=> d!55643 e!123808))

(declare-fun res!88934 () Bool)

(assert (=> d!55643 (=> (not res!88934) (not e!123808))))

(declare-fun lt!93160 () ListLongMap!2353)

(assert (=> d!55643 (= res!88934 (contains!1306 lt!93160 (_1!1727 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248)))))))

(declare-fun lt!93158 () List!2353)

(assert (=> d!55643 (= lt!93160 (ListLongMap!2354 lt!93158))))

(declare-fun lt!93157 () Unit!5665)

(declare-fun lt!93159 () Unit!5665)

(assert (=> d!55643 (= lt!93157 lt!93159)))

(assert (=> d!55643 (= (getValueByKey!230 lt!93158 (_1!1727 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248)))) (Some!235 (_2!1727 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248)))))))

(assert (=> d!55643 (= lt!93159 (lemmaContainsTupThenGetReturnValue!121 lt!93158 (_1!1727 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248))) (_2!1727 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248)))))))

(assert (=> d!55643 (= lt!93158 (insertStrictlySorted!124 (toList!1192 lt!93098) (_1!1727 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248))) (_2!1727 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248)))))))

(assert (=> d!55643 (= (+!292 lt!93098 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248))) lt!93160)))

(declare-fun b!188145 () Bool)

(declare-fun res!88935 () Bool)

(assert (=> b!188145 (=> (not res!88935) (not e!123808))))

(assert (=> b!188145 (= res!88935 (= (getValueByKey!230 (toList!1192 lt!93160) (_1!1727 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248)))) (Some!235 (_2!1727 (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248))))))))

(declare-fun b!188146 () Bool)

(assert (=> b!188146 (= e!123808 (contains!1308 (toList!1192 lt!93160) (tuple2!3433 lt!93083 (zeroValue!3671 thiss!1248))))))

(assert (= (and d!55643 res!88934) b!188145))

(assert (= (and b!188145 res!88935) b!188146))

(declare-fun m!215027 () Bool)

(assert (=> d!55643 m!215027))

(declare-fun m!215029 () Bool)

(assert (=> d!55643 m!215029))

(declare-fun m!215031 () Bool)

(assert (=> d!55643 m!215031))

(declare-fun m!215033 () Bool)

(assert (=> d!55643 m!215033))

(declare-fun m!215035 () Bool)

(assert (=> b!188145 m!215035))

(declare-fun m!215037 () Bool)

(assert (=> b!188146 m!215037))

(assert (=> b!188024 d!55643))

(declare-fun d!55645 () Bool)

(declare-fun e!123809 () Bool)

(assert (=> d!55645 e!123809))

(declare-fun res!88936 () Bool)

(assert (=> d!55645 (=> (not res!88936) (not e!123809))))

(declare-fun lt!93164 () ListLongMap!2353)

(assert (=> d!55645 (= res!88936 (contains!1306 lt!93164 (_1!1727 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248)))))))

(declare-fun lt!93162 () List!2353)

(assert (=> d!55645 (= lt!93164 (ListLongMap!2354 lt!93162))))

(declare-fun lt!93161 () Unit!5665)

(declare-fun lt!93163 () Unit!5665)

(assert (=> d!55645 (= lt!93161 lt!93163)))

(assert (=> d!55645 (= (getValueByKey!230 lt!93162 (_1!1727 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248)))) (Some!235 (_2!1727 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248)))))))

(assert (=> d!55645 (= lt!93163 (lemmaContainsTupThenGetReturnValue!121 lt!93162 (_1!1727 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248))) (_2!1727 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248)))))))

(assert (=> d!55645 (= lt!93162 (insertStrictlySorted!124 (toList!1192 lt!93099) (_1!1727 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248))) (_2!1727 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248)))))))

(assert (=> d!55645 (= (+!292 lt!93099 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248))) lt!93164)))

(declare-fun b!188147 () Bool)

(declare-fun res!88937 () Bool)

(assert (=> b!188147 (=> (not res!88937) (not e!123809))))

(assert (=> b!188147 (= res!88937 (= (getValueByKey!230 (toList!1192 lt!93164) (_1!1727 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248)))) (Some!235 (_2!1727 (tuple2!3433 lt!93096 (minValue!3671 thiss!1248))))))))

(declare-fun b!188148 () Bool)

(assert (=> b!188148 (= e!123809 (contains!1308 (toList!1192 lt!93164) (tuple2!3433 lt!93096 (minValue!3671 thiss!1248))))))

(assert (= (and d!55645 res!88936) b!188147))

(assert (= (and b!188147 res!88937) b!188148))

(declare-fun m!215039 () Bool)

(assert (=> d!55645 m!215039))

(declare-fun m!215041 () Bool)

(assert (=> d!55645 m!215041))

(declare-fun m!215043 () Bool)

(assert (=> d!55645 m!215043))

(declare-fun m!215045 () Bool)

(assert (=> d!55645 m!215045))

(declare-fun m!215047 () Bool)

(assert (=> b!188147 m!215047))

(declare-fun m!215049 () Bool)

(assert (=> b!188148 m!215049))

(assert (=> b!188024 d!55645))

(declare-fun d!55647 () Bool)

(declare-fun e!123810 () Bool)

(assert (=> d!55647 e!123810))

(declare-fun res!88938 () Bool)

(assert (=> d!55647 (=> (not res!88938) (not e!123810))))

(declare-fun lt!93168 () ListLongMap!2353)

(assert (=> d!55647 (= res!88938 (contains!1306 lt!93168 (_1!1727 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248)))))))

(declare-fun lt!93166 () List!2353)

(assert (=> d!55647 (= lt!93168 (ListLongMap!2354 lt!93166))))

(declare-fun lt!93165 () Unit!5665)

(declare-fun lt!93167 () Unit!5665)

(assert (=> d!55647 (= lt!93165 lt!93167)))

(assert (=> d!55647 (= (getValueByKey!230 lt!93166 (_1!1727 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248)))) (Some!235 (_2!1727 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248)))))))

(assert (=> d!55647 (= lt!93167 (lemmaContainsTupThenGetReturnValue!121 lt!93166 (_1!1727 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248))) (_2!1727 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248)))))))

(assert (=> d!55647 (= lt!93166 (insertStrictlySorted!124 (toList!1192 lt!93088) (_1!1727 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248))) (_2!1727 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248)))))))

(assert (=> d!55647 (= (+!292 lt!93088 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248))) lt!93168)))

(declare-fun b!188149 () Bool)

(declare-fun res!88939 () Bool)

(assert (=> b!188149 (=> (not res!88939) (not e!123810))))

(assert (=> b!188149 (= res!88939 (= (getValueByKey!230 (toList!1192 lt!93168) (_1!1727 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248)))) (Some!235 (_2!1727 (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248))))))))

(declare-fun b!188150 () Bool)

(assert (=> b!188150 (= e!123810 (contains!1308 (toList!1192 lt!93168) (tuple2!3433 lt!93104 (zeroValue!3671 thiss!1248))))))

(assert (= (and d!55647 res!88938) b!188149))

(assert (= (and b!188149 res!88939) b!188150))

(declare-fun m!215051 () Bool)

(assert (=> d!55647 m!215051))

(declare-fun m!215053 () Bool)

(assert (=> d!55647 m!215053))

(declare-fun m!215055 () Bool)

(assert (=> d!55647 m!215055))

(declare-fun m!215057 () Bool)

(assert (=> d!55647 m!215057))

(declare-fun m!215059 () Bool)

(assert (=> b!188149 m!215059))

(declare-fun m!215061 () Bool)

(assert (=> b!188150 m!215061))

(assert (=> b!188024 d!55647))

(declare-fun d!55649 () Bool)

(assert (=> d!55649 (isDefined!182 (getValueByKey!230 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(declare-fun lt!93171 () Unit!5665)

(declare-fun choose!1012 (List!2353 (_ BitVec 64)) Unit!5665)

(assert (=> d!55649 (= lt!93171 (choose!1012 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(declare-fun e!123813 () Bool)

(assert (=> d!55649 e!123813))

(declare-fun res!88942 () Bool)

(assert (=> d!55649 (=> (not res!88942) (not e!123813))))

(declare-fun isStrictlySorted!339 (List!2353) Bool)

(assert (=> d!55649 (= res!88942 (isStrictlySorted!339 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))))))

(assert (=> d!55649 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828) lt!93171)))

(declare-fun b!188153 () Bool)

(assert (=> b!188153 (= e!123813 (containsKey!233 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828))))

(assert (= (and d!55649 res!88942) b!188153))

(assert (=> d!55649 m!214849))

(assert (=> d!55649 m!214849))

(assert (=> d!55649 m!214851))

(declare-fun m!215063 () Bool)

(assert (=> d!55649 m!215063))

(declare-fun m!215065 () Bool)

(assert (=> d!55649 m!215065))

(assert (=> b!188153 m!214845))

(assert (=> b!187973 d!55649))

(assert (=> b!187973 d!55615))

(assert (=> b!187973 d!55617))

(declare-fun b!188172 () Bool)

(declare-fun e!123826 () SeekEntryResult!642)

(assert (=> b!188172 (= e!123826 (Intermediate!642 false (toIndex!0 key!828 (mask!8984 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!188173 () Bool)

(declare-fun e!123827 () SeekEntryResult!642)

(assert (=> b!188173 (= e!123827 (Intermediate!642 true (toIndex!0 key!828 (mask!8984 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!55651 () Bool)

(declare-fun e!123828 () Bool)

(assert (=> d!55651 e!123828))

(declare-fun c!33823 () Bool)

(declare-fun lt!93176 () SeekEntryResult!642)

(assert (=> d!55651 (= c!33823 (and ((_ is Intermediate!642) lt!93176) (undefined!1454 lt!93176)))))

(assert (=> d!55651 (= lt!93176 e!123827)))

(declare-fun c!33825 () Bool)

(assert (=> d!55651 (= c!33825 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!93177 () (_ BitVec 64))

(assert (=> d!55651 (= lt!93177 (select (arr!3764 (_keys!5785 thiss!1248)) (toIndex!0 key!828 (mask!8984 thiss!1248))))))

(assert (=> d!55651 (validMask!0 (mask!8984 thiss!1248))))

(assert (=> d!55651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8984 thiss!1248)) key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)) lt!93176)))

(declare-fun b!188174 () Bool)

(assert (=> b!188174 (= e!123827 e!123826)))

(declare-fun c!33824 () Bool)

(assert (=> b!188174 (= c!33824 (or (= lt!93177 key!828) (= (bvadd lt!93177 lt!93177) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!188175 () Bool)

(assert (=> b!188175 (and (bvsge (index!4740 lt!93176) #b00000000000000000000000000000000) (bvslt (index!4740 lt!93176) (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun e!123824 () Bool)

(assert (=> b!188175 (= e!123824 (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4740 lt!93176)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188176 () Bool)

(assert (=> b!188176 (= e!123828 (bvsge (x!20302 lt!93176) #b01111111111111111111111111111110))))

(declare-fun b!188177 () Bool)

(declare-fun e!123825 () Bool)

(assert (=> b!188177 (= e!123828 e!123825)))

(declare-fun res!88949 () Bool)

(assert (=> b!188177 (= res!88949 (and ((_ is Intermediate!642) lt!93176) (not (undefined!1454 lt!93176)) (bvslt (x!20302 lt!93176) #b01111111111111111111111111111110) (bvsge (x!20302 lt!93176) #b00000000000000000000000000000000) (bvsge (x!20302 lt!93176) #b00000000000000000000000000000000)))))

(assert (=> b!188177 (=> (not res!88949) (not e!123825))))

(declare-fun b!188178 () Bool)

(assert (=> b!188178 (and (bvsge (index!4740 lt!93176) #b00000000000000000000000000000000) (bvslt (index!4740 lt!93176) (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun res!88950 () Bool)

(assert (=> b!188178 (= res!88950 (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4740 lt!93176)) key!828))))

(assert (=> b!188178 (=> res!88950 e!123824)))

(assert (=> b!188178 (= e!123825 e!123824)))

(declare-fun b!188179 () Bool)

(assert (=> b!188179 (and (bvsge (index!4740 lt!93176) #b00000000000000000000000000000000) (bvslt (index!4740 lt!93176) (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun res!88951 () Bool)

(assert (=> b!188179 (= res!88951 (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4740 lt!93176)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188179 (=> res!88951 e!123824)))

(declare-fun b!188180 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!188180 (= e!123826 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8984 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!8984 thiss!1248)) key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(assert (= (and d!55651 c!33825) b!188173))

(assert (= (and d!55651 (not c!33825)) b!188174))

(assert (= (and b!188174 c!33824) b!188172))

(assert (= (and b!188174 (not c!33824)) b!188180))

(assert (= (and d!55651 c!33823) b!188176))

(assert (= (and d!55651 (not c!33823)) b!188177))

(assert (= (and b!188177 res!88949) b!188178))

(assert (= (and b!188178 (not res!88950)) b!188179))

(assert (= (and b!188179 (not res!88951)) b!188175))

(assert (=> b!188180 m!214825))

(declare-fun m!215067 () Bool)

(assert (=> b!188180 m!215067))

(assert (=> b!188180 m!215067))

(declare-fun m!215069 () Bool)

(assert (=> b!188180 m!215069))

(declare-fun m!215071 () Bool)

(assert (=> b!188179 m!215071))

(assert (=> b!188178 m!215071))

(assert (=> b!188175 m!215071))

(assert (=> d!55651 m!214825))

(declare-fun m!215073 () Bool)

(assert (=> d!55651 m!215073))

(assert (=> d!55651 m!214741))

(assert (=> d!55585 d!55651))

(declare-fun d!55653 () Bool)

(declare-fun lt!93183 () (_ BitVec 32))

(declare-fun lt!93182 () (_ BitVec 32))

(assert (=> d!55653 (= lt!93183 (bvmul (bvxor lt!93182 (bvlshr lt!93182 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55653 (= lt!93182 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55653 (and (bvsge (mask!8984 thiss!1248) #b00000000000000000000000000000000) (let ((res!88952 (let ((h!2988 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20321 (bvmul (bvxor h!2988 (bvlshr h!2988 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20321 (bvlshr x!20321 #b00000000000000000000000000001101)) (mask!8984 thiss!1248)))))) (and (bvslt res!88952 (bvadd (mask!8984 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88952 #b00000000000000000000000000000000))))))

(assert (=> d!55653 (= (toIndex!0 key!828 (mask!8984 thiss!1248)) (bvand (bvxor lt!93183 (bvlshr lt!93183 #b00000000000000000000000000001101)) (mask!8984 thiss!1248)))))

(assert (=> d!55585 d!55653))

(assert (=> d!55585 d!55593))

(declare-fun d!55655 () Bool)

(declare-fun e!123830 () Bool)

(assert (=> d!55655 e!123830))

(declare-fun res!88953 () Bool)

(assert (=> d!55655 (=> res!88953 e!123830)))

(declare-fun lt!93187 () Bool)

(assert (=> d!55655 (= res!88953 (not lt!93187))))

(declare-fun lt!93185 () Bool)

(assert (=> d!55655 (= lt!93187 lt!93185)))

(declare-fun lt!93186 () Unit!5665)

(declare-fun e!123829 () Unit!5665)

(assert (=> d!55655 (= lt!93186 e!123829)))

(declare-fun c!33826 () Bool)

(assert (=> d!55655 (= c!33826 lt!93185)))

(assert (=> d!55655 (= lt!93185 (containsKey!233 (toList!1192 lt!93092) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55655 (= (contains!1306 lt!93092 #b1000000000000000000000000000000000000000000000000000000000000000) lt!93187)))

(declare-fun b!188181 () Bool)

(declare-fun lt!93184 () Unit!5665)

(assert (=> b!188181 (= e!123829 lt!93184)))

(assert (=> b!188181 (= lt!93184 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1192 lt!93092) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188181 (isDefined!182 (getValueByKey!230 (toList!1192 lt!93092) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188182 () Bool)

(declare-fun Unit!5674 () Unit!5665)

(assert (=> b!188182 (= e!123829 Unit!5674)))

(declare-fun b!188183 () Bool)

(assert (=> b!188183 (= e!123830 (isDefined!182 (getValueByKey!230 (toList!1192 lt!93092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55655 c!33826) b!188181))

(assert (= (and d!55655 (not c!33826)) b!188182))

(assert (= (and d!55655 (not res!88953)) b!188183))

(declare-fun m!215075 () Bool)

(assert (=> d!55655 m!215075))

(declare-fun m!215077 () Bool)

(assert (=> b!188181 m!215077))

(declare-fun m!215079 () Bool)

(assert (=> b!188181 m!215079))

(assert (=> b!188181 m!215079))

(declare-fun m!215081 () Bool)

(assert (=> b!188181 m!215081))

(assert (=> b!188183 m!215079))

(assert (=> b!188183 m!215079))

(assert (=> b!188183 m!215081))

(assert (=> bm!18935 d!55655))

(declare-fun d!55657 () Bool)

(declare-fun res!88958 () Bool)

(declare-fun e!123835 () Bool)

(assert (=> d!55657 (=> res!88958 e!123835)))

(assert (=> d!55657 (= res!88958 (and ((_ is Cons!2349) (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) (= (_1!1727 (h!2985 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) key!828)))))

(assert (=> d!55657 (= (containsKey!233 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))) key!828) e!123835)))

(declare-fun b!188188 () Bool)

(declare-fun e!123836 () Bool)

(assert (=> b!188188 (= e!123835 e!123836)))

(declare-fun res!88959 () Bool)

(assert (=> b!188188 (=> (not res!88959) (not e!123836))))

(assert (=> b!188188 (= res!88959 (and (or (not ((_ is Cons!2349) (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) (bvsle (_1!1727 (h!2985 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) key!828)) ((_ is Cons!2349) (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) (bvslt (_1!1727 (h!2985 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248))))) key!828)))))

(declare-fun b!188189 () Bool)

(assert (=> b!188189 (= e!123836 (containsKey!233 (t!7239 (toList!1192 (getCurrentListMap!844 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3830 thiss!1248)))) key!828))))

(assert (= (and d!55657 (not res!88958)) b!188188))

(assert (= (and b!188188 res!88959) b!188189))

(declare-fun m!215083 () Bool)

(assert (=> b!188189 m!215083))

(assert (=> d!55595 d!55657))

(declare-fun b!188202 () Bool)

(declare-fun e!123843 () SeekEntryResult!642)

(declare-fun e!123845 () SeekEntryResult!642)

(assert (=> b!188202 (= e!123843 e!123845)))

(declare-fun c!33835 () Bool)

(declare-fun lt!93192 () (_ BitVec 64))

(assert (=> b!188202 (= c!33835 (= lt!93192 key!828))))

(declare-fun b!188203 () Bool)

(assert (=> b!188203 (= e!123845 (Found!642 (index!4740 lt!93019)))))

(declare-fun b!188204 () Bool)

(declare-fun e!123844 () SeekEntryResult!642)

(assert (=> b!188204 (= e!123844 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20302 lt!93019) #b00000000000000000000000000000001) (nextIndex!0 (index!4740 lt!93019) (bvadd (x!20302 lt!93019) #b00000000000000000000000000000001) (mask!8984 thiss!1248)) (index!4740 lt!93019) key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(declare-fun lt!93193 () SeekEntryResult!642)

(declare-fun d!55659 () Bool)

(assert (=> d!55659 (and (or ((_ is Undefined!642) lt!93193) (not ((_ is Found!642) lt!93193)) (and (bvsge (index!4739 lt!93193) #b00000000000000000000000000000000) (bvslt (index!4739 lt!93193) (size!4083 (_keys!5785 thiss!1248))))) (or ((_ is Undefined!642) lt!93193) ((_ is Found!642) lt!93193) (not ((_ is MissingVacant!642) lt!93193)) (not (= (index!4741 lt!93193) (index!4740 lt!93019))) (and (bvsge (index!4741 lt!93193) #b00000000000000000000000000000000) (bvslt (index!4741 lt!93193) (size!4083 (_keys!5785 thiss!1248))))) (or ((_ is Undefined!642) lt!93193) (ite ((_ is Found!642) lt!93193) (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4739 lt!93193)) key!828) (and ((_ is MissingVacant!642) lt!93193) (= (index!4741 lt!93193) (index!4740 lt!93019)) (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4741 lt!93193)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55659 (= lt!93193 e!123843)))

(declare-fun c!33834 () Bool)

(assert (=> d!55659 (= c!33834 (bvsge (x!20302 lt!93019) #b01111111111111111111111111111110))))

(assert (=> d!55659 (= lt!93192 (select (arr!3764 (_keys!5785 thiss!1248)) (index!4740 lt!93019)))))

(assert (=> d!55659 (validMask!0 (mask!8984 thiss!1248))))

(assert (=> d!55659 (= (seekKeyOrZeroReturnVacant!0 (x!20302 lt!93019) (index!4740 lt!93019) (index!4740 lt!93019) key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)) lt!93193)))

(declare-fun b!188205 () Bool)

(assert (=> b!188205 (= e!123843 Undefined!642)))

(declare-fun b!188206 () Bool)

(declare-fun c!33833 () Bool)

(assert (=> b!188206 (= c!33833 (= lt!93192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188206 (= e!123845 e!123844)))

(declare-fun b!188207 () Bool)

(assert (=> b!188207 (= e!123844 (MissingVacant!642 (index!4740 lt!93019)))))

(assert (= (and d!55659 c!33834) b!188205))

(assert (= (and d!55659 (not c!33834)) b!188202))

(assert (= (and b!188202 c!33835) b!188203))

(assert (= (and b!188202 (not c!33835)) b!188206))

(assert (= (and b!188206 c!33833) b!188207))

(assert (= (and b!188206 (not c!33833)) b!188204))

(declare-fun m!215085 () Bool)

(assert (=> b!188204 m!215085))

(assert (=> b!188204 m!215085))

(declare-fun m!215087 () Bool)

(assert (=> b!188204 m!215087))

(declare-fun m!215089 () Bool)

(assert (=> d!55659 m!215089))

(declare-fun m!215091 () Bool)

(assert (=> d!55659 m!215091))

(assert (=> d!55659 m!214833))

(assert (=> d!55659 m!214741))

(assert (=> b!187938 d!55659))

(assert (=> d!55579 d!55585))

(declare-fun d!55661 () Bool)

(declare-fun e!123848 () Bool)

(assert (=> d!55661 e!123848))

(declare-fun res!88965 () Bool)

(assert (=> d!55661 (=> (not res!88965) (not e!123848))))

(declare-fun lt!93196 () SeekEntryResult!642)

(assert (=> d!55661 (= res!88965 ((_ is Found!642) lt!93196))))

(assert (=> d!55661 (= lt!93196 (seekEntryOrOpen!0 key!828 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(assert (=> d!55661 true))

(declare-fun _$33!135 () Unit!5665)

(assert (=> d!55661 (= (choose!1008 (_keys!5785 thiss!1248) (_values!3813 thiss!1248) (mask!8984 thiss!1248) (extraKeys!3567 thiss!1248) (zeroValue!3671 thiss!1248) (minValue!3671 thiss!1248) key!828 (defaultEntry!3830 thiss!1248)) _$33!135)))

(declare-fun b!188212 () Bool)

(declare-fun res!88964 () Bool)

(assert (=> b!188212 (=> (not res!88964) (not e!123848))))

(assert (=> b!188212 (= res!88964 (inRange!0 (index!4739 lt!93196) (mask!8984 thiss!1248)))))

(declare-fun b!188213 () Bool)

(assert (=> b!188213 (= e!123848 (= (select (arr!3764 (_keys!5785 thiss!1248)) (index!4739 lt!93196)) key!828))))

(assert (= (and d!55661 res!88965) b!188212))

(assert (= (and b!188212 res!88964) b!188213))

(assert (=> d!55661 m!214737))

(declare-fun m!215093 () Bool)

(assert (=> b!188212 m!215093))

(declare-fun m!215095 () Bool)

(assert (=> b!188213 m!215095))

(assert (=> d!55579 d!55661))

(assert (=> d!55579 d!55593))

(declare-fun d!55663 () Bool)

(declare-fun e!123849 () Bool)

(assert (=> d!55663 e!123849))

(declare-fun res!88966 () Bool)

(assert (=> d!55663 (=> (not res!88966) (not e!123849))))

(declare-fun lt!93200 () ListLongMap!2353)

(assert (=> d!55663 (= res!88966 (contains!1306 lt!93200 (_1!1727 (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))))

(declare-fun lt!93198 () List!2353)

(assert (=> d!55663 (= lt!93200 (ListLongMap!2354 lt!93198))))

(declare-fun lt!93197 () Unit!5665)

(declare-fun lt!93199 () Unit!5665)

(assert (=> d!55663 (= lt!93197 lt!93199)))

(assert (=> d!55663 (= (getValueByKey!230 lt!93198 (_1!1727 (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))) (Some!235 (_2!1727 (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))))

(assert (=> d!55663 (= lt!93199 (lemmaContainsTupThenGetReturnValue!121 lt!93198 (_1!1727 (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))) (_2!1727 (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))))

(assert (=> d!55663 (= lt!93198 (insertStrictlySorted!124 (toList!1192 (ite c!33786 call!18937 (ite c!33788 call!18942 call!18939))) (_1!1727 (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))) (_2!1727 (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))))))

(assert (=> d!55663 (= (+!292 (ite c!33786 call!18937 (ite c!33788 call!18942 call!18939)) (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))) lt!93200)))

(declare-fun b!188214 () Bool)

(declare-fun res!88967 () Bool)

(assert (=> b!188214 (=> (not res!88967) (not e!123849))))

(assert (=> b!188214 (= res!88967 (= (getValueByKey!230 (toList!1192 lt!93200) (_1!1727 (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248))))) (Some!235 (_2!1727 (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))))

(declare-fun b!188215 () Bool)

(assert (=> b!188215 (= e!123849 (contains!1308 (toList!1192 lt!93200) (ite (or c!33786 c!33788) (tuple2!3433 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3671 thiss!1248)) (tuple2!3433 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3671 thiss!1248)))))))

(assert (= (and d!55663 res!88966) b!188214))

(assert (= (and b!188214 res!88967) b!188215))

(declare-fun m!215097 () Bool)

(assert (=> d!55663 m!215097))

(declare-fun m!215099 () Bool)

(assert (=> d!55663 m!215099))

(declare-fun m!215101 () Bool)

(assert (=> d!55663 m!215101))

(declare-fun m!215103 () Bool)

(assert (=> d!55663 m!215103))

(declare-fun m!215105 () Bool)

(assert (=> b!188214 m!215105))

(declare-fun m!215107 () Bool)

(assert (=> b!188215 m!215107))

(assert (=> bm!18936 d!55663))

(declare-fun d!55665 () Bool)

(declare-fun res!88972 () Bool)

(declare-fun e!123854 () Bool)

(assert (=> d!55665 (=> res!88972 e!123854)))

(assert (=> d!55665 (= res!88972 (= (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55665 (= (arrayContainsKey!0 (_keys!5785 thiss!1248) key!828 #b00000000000000000000000000000000) e!123854)))

(declare-fun b!188220 () Bool)

(declare-fun e!123855 () Bool)

(assert (=> b!188220 (= e!123854 e!123855)))

(declare-fun res!88973 () Bool)

(assert (=> b!188220 (=> (not res!88973) (not e!123855))))

(assert (=> b!188220 (= res!88973 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun b!188221 () Bool)

(assert (=> b!188221 (= e!123855 (arrayContainsKey!0 (_keys!5785 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55665 (not res!88972)) b!188220))

(assert (= (and b!188220 res!88973) b!188221))

(assert (=> d!55665 m!214853))

(declare-fun m!215109 () Bool)

(assert (=> b!188221 m!215109))

(assert (=> bm!18918 d!55665))

(declare-fun d!55667 () Bool)

(assert (=> d!55667 (= (inRange!0 (ite c!33767 (index!4738 lt!93025) (index!4741 lt!93025)) (mask!8984 thiss!1248)) (and (bvsge (ite c!33767 (index!4738 lt!93025) (index!4741 lt!93025)) #b00000000000000000000000000000000) (bvslt (ite c!33767 (index!4738 lt!93025) (index!4741 lt!93025)) (bvadd (mask!8984 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18919 d!55667))

(declare-fun bm!18952 () Bool)

(declare-fun call!18955 () (_ BitVec 32))

(assert (=> bm!18952 (= call!18955 (arrayCountValidKeys!0 (_keys!5785 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4083 (_keys!5785 thiss!1248))))))

(declare-fun b!188231 () Bool)

(declare-fun e!123861 () (_ BitVec 32))

(declare-fun e!123860 () (_ BitVec 32))

(assert (=> b!188231 (= e!123861 e!123860)))

(declare-fun c!33841 () Bool)

(assert (=> b!188231 (= c!33841 (validKeyInArray!0 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188232 () Bool)

(assert (=> b!188232 (= e!123860 call!18955)))

(declare-fun b!188233 () Bool)

(assert (=> b!188233 (= e!123860 (bvadd #b00000000000000000000000000000001 call!18955))))

(declare-fun d!55669 () Bool)

(declare-fun lt!93203 () (_ BitVec 32))

(assert (=> d!55669 (and (bvsge lt!93203 #b00000000000000000000000000000000) (bvsle lt!93203 (bvsub (size!4083 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55669 (= lt!93203 e!123861)))

(declare-fun c!33840 () Bool)

(assert (=> d!55669 (= c!33840 (bvsge #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(assert (=> d!55669 (and (bvsle #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4083 (_keys!5785 thiss!1248)) (size!4083 (_keys!5785 thiss!1248))))))

(assert (=> d!55669 (= (arrayCountValidKeys!0 (_keys!5785 thiss!1248) #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))) lt!93203)))

(declare-fun b!188230 () Bool)

(assert (=> b!188230 (= e!123861 #b00000000000000000000000000000000)))

(assert (= (and d!55669 c!33840) b!188230))

(assert (= (and d!55669 (not c!33840)) b!188231))

(assert (= (and b!188231 c!33841) b!188233))

(assert (= (and b!188231 (not c!33841)) b!188232))

(assert (= (or b!188233 b!188232) bm!18952))

(declare-fun m!215111 () Bool)

(assert (=> bm!18952 m!215111))

(assert (=> b!188231 m!214853))

(assert (=> b!188231 m!214853))

(assert (=> b!188231 m!214855))

(assert (=> b!187922 d!55669))

(declare-fun b!188243 () Bool)

(declare-fun res!88985 () Bool)

(declare-fun e!123864 () Bool)

(assert (=> b!188243 (=> (not res!88985) (not e!123864))))

(declare-fun size!4089 (LongMapFixedSize!2608) (_ BitVec 32))

(assert (=> b!188243 (= res!88985 (bvsge (size!4089 thiss!1248) (_size!1353 thiss!1248)))))

(declare-fun b!188245 () Bool)

(assert (=> b!188245 (= e!123864 (and (bvsge (extraKeys!3567 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3567 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1353 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!188242 () Bool)

(declare-fun res!88983 () Bool)

(assert (=> b!188242 (=> (not res!88983) (not e!123864))))

(assert (=> b!188242 (= res!88983 (and (= (size!4084 (_values!3813 thiss!1248)) (bvadd (mask!8984 thiss!1248) #b00000000000000000000000000000001)) (= (size!4083 (_keys!5785 thiss!1248)) (size!4084 (_values!3813 thiss!1248))) (bvsge (_size!1353 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1353 thiss!1248) (bvadd (mask!8984 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!55671 () Bool)

(declare-fun res!88982 () Bool)

(assert (=> d!55671 (=> (not res!88982) (not e!123864))))

(assert (=> d!55671 (= res!88982 (validMask!0 (mask!8984 thiss!1248)))))

(assert (=> d!55671 (= (simpleValid!188 thiss!1248) e!123864)))

(declare-fun b!188244 () Bool)

(declare-fun res!88984 () Bool)

(assert (=> b!188244 (=> (not res!88984) (not e!123864))))

(assert (=> b!188244 (= res!88984 (= (size!4089 thiss!1248) (bvadd (_size!1353 thiss!1248) (bvsdiv (bvadd (extraKeys!3567 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!55671 res!88982) b!188242))

(assert (= (and b!188242 res!88983) b!188243))

(assert (= (and b!188243 res!88985) b!188244))

(assert (= (and b!188244 res!88984) b!188245))

(declare-fun m!215113 () Bool)

(assert (=> b!188243 m!215113))

(assert (=> d!55671 m!214741))

(assert (=> b!188244 m!215113))

(assert (=> d!55583 d!55671))

(declare-fun d!55673 () Bool)

(assert (=> d!55673 (= (apply!172 lt!93092 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2179 (getValueByKey!230 (toList!1192 lt!93092) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7605 () Bool)

(assert (= bs!7605 d!55673))

(assert (=> bs!7605 m!215079))

(assert (=> bs!7605 m!215079))

(declare-fun m!215115 () Bool)

(assert (=> bs!7605 m!215115))

(assert (=> b!188030 d!55673))

(declare-fun d!55675 () Bool)

(declare-fun e!123866 () Bool)

(assert (=> d!55675 e!123866))

(declare-fun res!88986 () Bool)

(assert (=> d!55675 (=> res!88986 e!123866)))

(declare-fun lt!93207 () Bool)

(assert (=> d!55675 (= res!88986 (not lt!93207))))

(declare-fun lt!93205 () Bool)

(assert (=> d!55675 (= lt!93207 lt!93205)))

(declare-fun lt!93206 () Unit!5665)

(declare-fun e!123865 () Unit!5665)

(assert (=> d!55675 (= lt!93206 e!123865)))

(declare-fun c!33842 () Bool)

(assert (=> d!55675 (= c!33842 lt!93205)))

(assert (=> d!55675 (= lt!93205 (containsKey!233 (toList!1192 lt!93092) (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55675 (= (contains!1306 lt!93092 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)) lt!93207)))

(declare-fun b!188246 () Bool)

(declare-fun lt!93204 () Unit!5665)

(assert (=> b!188246 (= e!123865 lt!93204)))

(assert (=> b!188246 (= lt!93204 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1192 lt!93092) (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!188246 (isDefined!182 (getValueByKey!230 (toList!1192 lt!93092) (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188247 () Bool)

(declare-fun Unit!5675 () Unit!5665)

(assert (=> b!188247 (= e!123865 Unit!5675)))

(declare-fun b!188248 () Bool)

(assert (=> b!188248 (= e!123866 (isDefined!182 (getValueByKey!230 (toList!1192 lt!93092) (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55675 c!33842) b!188246))

(assert (= (and d!55675 (not c!33842)) b!188247))

(assert (= (and d!55675 (not res!88986)) b!188248))

(assert (=> d!55675 m!214853))

(declare-fun m!215117 () Bool)

(assert (=> d!55675 m!215117))

(assert (=> b!188246 m!214853))

(declare-fun m!215119 () Bool)

(assert (=> b!188246 m!215119))

(assert (=> b!188246 m!214853))

(assert (=> b!188246 m!214955))

(assert (=> b!188246 m!214955))

(declare-fun m!215121 () Bool)

(assert (=> b!188246 m!215121))

(assert (=> b!188248 m!214853))

(assert (=> b!188248 m!214955))

(assert (=> b!188248 m!214955))

(assert (=> b!188248 m!215121))

(assert (=> b!188029 d!55675))

(assert (=> d!55597 d!55593))

(declare-fun d!55677 () Bool)

(declare-fun res!88995 () Bool)

(declare-fun e!123875 () Bool)

(assert (=> d!55677 (=> res!88995 e!123875)))

(assert (=> d!55677 (= res!88995 (bvsge #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(assert (=> d!55677 (= (arrayNoDuplicates!0 (_keys!5785 thiss!1248) #b00000000000000000000000000000000 Nil!2352) e!123875)))

(declare-fun b!188259 () Bool)

(declare-fun e!123878 () Bool)

(assert (=> b!188259 (= e!123875 e!123878)))

(declare-fun res!88993 () Bool)

(assert (=> b!188259 (=> (not res!88993) (not e!123878))))

(declare-fun e!123877 () Bool)

(assert (=> b!188259 (= res!88993 (not e!123877))))

(declare-fun res!88994 () Bool)

(assert (=> b!188259 (=> (not res!88994) (not e!123877))))

(assert (=> b!188259 (= res!88994 (validKeyInArray!0 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188260 () Bool)

(declare-fun e!123876 () Bool)

(declare-fun call!18958 () Bool)

(assert (=> b!188260 (= e!123876 call!18958)))

(declare-fun b!188261 () Bool)

(assert (=> b!188261 (= e!123876 call!18958)))

(declare-fun bm!18955 () Bool)

(declare-fun c!33845 () Bool)

(assert (=> bm!18955 (= call!18958 (arrayNoDuplicates!0 (_keys!5785 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33845 (Cons!2351 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000) Nil!2352) Nil!2352)))))

(declare-fun b!188262 () Bool)

(declare-fun contains!1309 (List!2355 (_ BitVec 64)) Bool)

(assert (=> b!188262 (= e!123877 (contains!1309 Nil!2352 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!188263 () Bool)

(assert (=> b!188263 (= e!123878 e!123876)))

(assert (=> b!188263 (= c!33845 (validKeyInArray!0 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55677 (not res!88995)) b!188259))

(assert (= (and b!188259 res!88994) b!188262))

(assert (= (and b!188259 res!88993) b!188263))

(assert (= (and b!188263 c!33845) b!188260))

(assert (= (and b!188263 (not c!33845)) b!188261))

(assert (= (or b!188260 b!188261) bm!18955))

(assert (=> b!188259 m!214853))

(assert (=> b!188259 m!214853))

(assert (=> b!188259 m!214855))

(assert (=> bm!18955 m!214853))

(declare-fun m!215123 () Bool)

(assert (=> bm!18955 m!215123))

(assert (=> b!188262 m!214853))

(assert (=> b!188262 m!214853))

(declare-fun m!215125 () Bool)

(assert (=> b!188262 m!215125))

(assert (=> b!188263 m!214853))

(assert (=> b!188263 m!214853))

(assert (=> b!188263 m!214855))

(assert (=> b!187924 d!55677))

(declare-fun b!188272 () Bool)

(declare-fun e!123886 () Bool)

(declare-fun e!123885 () Bool)

(assert (=> b!188272 (= e!123886 e!123885)))

(declare-fun lt!93215 () (_ BitVec 64))

(assert (=> b!188272 (= lt!93215 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93216 () Unit!5665)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7979 (_ BitVec 64) (_ BitVec 32)) Unit!5665)

(assert (=> b!188272 (= lt!93216 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5785 thiss!1248) lt!93215 #b00000000000000000000000000000000))))

(assert (=> b!188272 (arrayContainsKey!0 (_keys!5785 thiss!1248) lt!93215 #b00000000000000000000000000000000)))

(declare-fun lt!93214 () Unit!5665)

(assert (=> b!188272 (= lt!93214 lt!93216)))

(declare-fun res!89001 () Bool)

(assert (=> b!188272 (= res!89001 (= (seekEntryOrOpen!0 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000) (_keys!5785 thiss!1248) (mask!8984 thiss!1248)) (Found!642 #b00000000000000000000000000000000)))))

(assert (=> b!188272 (=> (not res!89001) (not e!123885))))

(declare-fun b!188273 () Bool)

(declare-fun call!18961 () Bool)

(assert (=> b!188273 (= e!123885 call!18961)))

(declare-fun bm!18958 () Bool)

(assert (=> bm!18958 (= call!18961 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5785 thiss!1248) (mask!8984 thiss!1248)))))

(declare-fun b!188274 () Bool)

(declare-fun e!123887 () Bool)

(assert (=> b!188274 (= e!123887 e!123886)))

(declare-fun c!33848 () Bool)

(assert (=> b!188274 (= c!33848 (validKeyInArray!0 (select (arr!3764 (_keys!5785 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55679 () Bool)

(declare-fun res!89000 () Bool)

(assert (=> d!55679 (=> res!89000 e!123887)))

(assert (=> d!55679 (= res!89000 (bvsge #b00000000000000000000000000000000 (size!4083 (_keys!5785 thiss!1248))))))

(assert (=> d!55679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5785 thiss!1248) (mask!8984 thiss!1248)) e!123887)))

(declare-fun b!188275 () Bool)

(assert (=> b!188275 (= e!123886 call!18961)))

(assert (= (and d!55679 (not res!89000)) b!188274))

(assert (= (and b!188274 c!33848) b!188272))

(assert (= (and b!188274 (not c!33848)) b!188275))

(assert (= (and b!188272 res!89001) b!188273))

(assert (= (or b!188273 b!188275) bm!18958))

(assert (=> b!188272 m!214853))

(declare-fun m!215127 () Bool)

(assert (=> b!188272 m!215127))

(declare-fun m!215129 () Bool)

(assert (=> b!188272 m!215129))

(assert (=> b!188272 m!214853))

(declare-fun m!215131 () Bool)

(assert (=> b!188272 m!215131))

(declare-fun m!215133 () Bool)

(assert (=> bm!18958 m!215133))

(assert (=> b!188274 m!214853))

(assert (=> b!188274 m!214853))

(assert (=> b!188274 m!214855))

(assert (=> b!187923 d!55679))

(declare-fun d!55681 () Bool)

(declare-fun e!123889 () Bool)

(assert (=> d!55681 e!123889))

(declare-fun res!89002 () Bool)

(assert (=> d!55681 (=> res!89002 e!123889)))

(declare-fun lt!93220 () Bool)

(assert (=> d!55681 (= res!89002 (not lt!93220))))

(declare-fun lt!93218 () Bool)

(assert (=> d!55681 (= lt!93220 lt!93218)))

(declare-fun lt!93219 () Unit!5665)

(declare-fun e!123888 () Unit!5665)

(assert (=> d!55681 (= lt!93219 e!123888)))

(declare-fun c!33849 () Bool)

(assert (=> d!55681 (= c!33849 lt!93218)))

(assert (=> d!55681 (= lt!93218 (containsKey!233 (toList!1192 lt!93092) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55681 (= (contains!1306 lt!93092 #b0000000000000000000000000000000000000000000000000000000000000000) lt!93220)))

(declare-fun b!188276 () Bool)

(declare-fun lt!93217 () Unit!5665)

(assert (=> b!188276 (= e!123888 lt!93217)))

(assert (=> b!188276 (= lt!93217 (lemmaContainsKeyImpliesGetValueByKeyDefined!181 (toList!1192 lt!93092) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!188276 (isDefined!182 (getValueByKey!230 (toList!1192 lt!93092) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!188277 () Bool)

(declare-fun Unit!5676 () Unit!5665)

(assert (=> b!188277 (= e!123888 Unit!5676)))

(declare-fun b!188278 () Bool)

(assert (=> b!188278 (= e!123889 (isDefined!182 (getValueByKey!230 (toList!1192 lt!93092) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55681 c!33849) b!188276))

(assert (= (and d!55681 (not c!33849)) b!188277))

(assert (= (and d!55681 (not res!89002)) b!188278))

(declare-fun m!215135 () Bool)

(assert (=> d!55681 m!215135))

(declare-fun m!215137 () Bool)

(assert (=> b!188276 m!215137))

(assert (=> b!188276 m!214951))

(assert (=> b!188276 m!214951))

(declare-fun m!215139 () Bool)

(assert (=> b!188276 m!215139))

(assert (=> b!188278 m!214951))

(assert (=> b!188278 m!214951))

(assert (=> b!188278 m!215139))

(assert (=> bm!18937 d!55681))

(declare-fun b!188280 () Bool)

(declare-fun e!123891 () Bool)

(assert (=> b!188280 (= e!123891 tp_is_empty!4387)))

(declare-fun condMapEmpty!7570 () Bool)

(declare-fun mapDefault!7570 () ValueCell!1850)

(assert (=> mapNonEmpty!7569 (= condMapEmpty!7570 (= mapRest!7569 ((as const (Array (_ BitVec 32) ValueCell!1850)) mapDefault!7570)))))

(declare-fun mapRes!7570 () Bool)

(assert (=> mapNonEmpty!7569 (= tp!16677 (and e!123891 mapRes!7570))))

(declare-fun b!188279 () Bool)

(declare-fun e!123890 () Bool)

(assert (=> b!188279 (= e!123890 tp_is_empty!4387)))

(declare-fun mapIsEmpty!7570 () Bool)

(assert (=> mapIsEmpty!7570 mapRes!7570))

(declare-fun mapNonEmpty!7570 () Bool)

(declare-fun tp!16678 () Bool)

(assert (=> mapNonEmpty!7570 (= mapRes!7570 (and tp!16678 e!123890))))

(declare-fun mapRest!7570 () (Array (_ BitVec 32) ValueCell!1850))

(declare-fun mapValue!7570 () ValueCell!1850)

(declare-fun mapKey!7570 () (_ BitVec 32))

(assert (=> mapNonEmpty!7570 (= mapRest!7569 (store mapRest!7570 mapKey!7570 mapValue!7570))))

(assert (= (and mapNonEmpty!7569 condMapEmpty!7570) mapIsEmpty!7570))

(assert (= (and mapNonEmpty!7569 (not condMapEmpty!7570)) mapNonEmpty!7570))

(assert (= (and mapNonEmpty!7570 ((_ is ValueCellFull!1850) mapValue!7570)) b!188279))

(assert (= (and mapNonEmpty!7569 ((_ is ValueCellFull!1850) mapDefault!7570)) b!188280))

(declare-fun m!215141 () Bool)

(assert (=> mapNonEmpty!7570 m!215141))

(declare-fun b_lambda!7329 () Bool)

(assert (= b_lambda!7327 (or (and b!187838 b_free!4615) b_lambda!7329)))

(declare-fun b_lambda!7331 () Bool)

(assert (= b_lambda!7325 (or (and b!187838 b_free!4615) b_lambda!7331)))

(check-sat (not b_lambda!7323) (not d!55651) (not b!188274) (not b!188183) (not d!55661) (not d!55633) (not d!55647) (not d!55637) (not b!188142) (not d!55655) (not b!188140) (not d!55629) (not d!55625) (not d!55621) (not b!188153) (not b!188246) (not b!188078) (not d!55623) (not b!188181) (not b!188148) (not mapNonEmpty!7570) (not b!188248) (not b!188276) b_and!11263 (not d!55627) (not d!55673) (not b!188243) (not b!188189) (not d!55641) (not b!188149) (not bm!18955) (not b!188150) (not b!188104) (not b!188263) (not d!55635) (not b!188109) (not b!188146) (not b!188144) (not d!55639) (not d!55671) (not b_lambda!7329) (not b!188262) (not b!188215) (not b!188120) tp_is_empty!4387 (not d!55681) (not b!188113) (not b!188145) (not b_next!4615) (not d!55605) (not b_lambda!7331) (not b!188107) (not bm!18946) (not b!188214) (not b!188272) (not d!55649) (not d!55663) (not d!55611) (not b!188110) (not b!188103) (not d!55619) (not b!188204) (not b!188221) (not d!55643) (not b!188141) (not b!188077) (not d!55601) (not d!55609) (not b!188105) (not d!55659) (not b!188180) (not b!188278) (not b!188259) (not b!188244) (not d!55631) (not b!188106) (not b!188147) (not b!188212) (not bm!18949) (not bm!18958) (not b!188131) (not d!55675) (not bm!18952) (not d!55645) (not b!188231) (not d!55607) (not d!55615) (not b!188119) (not bm!18945))
(check-sat b_and!11263 (not b_next!4615))
