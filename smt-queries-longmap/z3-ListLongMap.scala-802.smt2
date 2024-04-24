; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19264 () Bool)

(assert start!19264)

(declare-fun b!189588 () Bool)

(declare-fun b_free!4651 () Bool)

(declare-fun b_next!4651 () Bool)

(assert (=> b!189588 (= b_free!4651 (not b_next!4651))))

(declare-fun tp!16785 () Bool)

(declare-fun b_and!11303 () Bool)

(assert (=> b!189588 (= tp!16785 b_and!11303)))

(declare-fun b!189580 () Bool)

(declare-fun e!124746 () Bool)

(declare-fun e!124744 () Bool)

(assert (=> b!189580 (= e!124746 e!124744)))

(declare-fun res!89653 () Bool)

(assert (=> b!189580 (=> (not res!89653) (not e!124744))))

(declare-datatypes ((SeekEntryResult!656 0))(
  ( (MissingZero!656 (index!4794 (_ BitVec 32))) (Found!656 (index!4795 (_ BitVec 32))) (Intermediate!656 (undefined!1468 Bool) (index!4796 (_ BitVec 32)) (x!20422 (_ BitVec 32))) (Undefined!656) (MissingVacant!656 (index!4797 (_ BitVec 32))) )
))
(declare-fun lt!93845 () SeekEntryResult!656)

(get-info :version)

(assert (=> b!189580 (= res!89653 (and (not ((_ is Undefined!656) lt!93845)) (not ((_ is MissingVacant!656) lt!93845)) (not ((_ is MissingZero!656) lt!93845)) ((_ is Found!656) lt!93845)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5545 0))(
  ( (V!5546 (val!2256 Int)) )
))
(declare-datatypes ((ValueCell!1868 0))(
  ( (ValueCellFull!1868 (v!4178 V!5545)) (EmptyCell!1868) )
))
(declare-datatypes ((array!8061 0))(
  ( (array!8062 (arr!3800 (Array (_ BitVec 32) (_ BitVec 64))) (size!4120 (_ BitVec 32))) )
))
(declare-datatypes ((array!8063 0))(
  ( (array!8064 (arr!3801 (Array (_ BitVec 32) ValueCell!1868)) (size!4121 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2644 0))(
  ( (LongMapFixedSize!2645 (defaultEntry!3866 Int) (mask!9055 (_ BitVec 32)) (extraKeys!3603 (_ BitVec 32)) (zeroValue!3707 V!5545) (minValue!3707 V!5545) (_size!1371 (_ BitVec 32)) (_keys!5833 array!8061) (_values!3849 array!8063) (_vacant!1371 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2644)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8061 (_ BitVec 32)) SeekEntryResult!656)

(assert (=> b!189580 (= lt!93845 (seekEntryOrOpen!0 key!828 (_keys!5833 thiss!1248) (mask!9055 thiss!1248)))))

(declare-fun b!189581 () Bool)

(declare-datatypes ((Unit!5715 0))(
  ( (Unit!5716) )
))
(declare-fun e!124750 () Unit!5715)

(declare-fun Unit!5717 () Unit!5715)

(assert (=> b!189581 (= e!124750 Unit!5717)))

(declare-fun lt!93849 () Unit!5715)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!160 (array!8061 array!8063 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 64) Int) Unit!5715)

(assert (=> b!189581 (= lt!93849 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!160 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)))))

(assert (=> b!189581 false))

(declare-fun res!89652 () Bool)

(assert (=> start!19264 (=> (not res!89652) (not e!124746))))

(declare-fun valid!1112 (LongMapFixedSize!2644) Bool)

(assert (=> start!19264 (= res!89652 (valid!1112 thiss!1248))))

(assert (=> start!19264 e!124746))

(declare-fun e!124752 () Bool)

(assert (=> start!19264 e!124752))

(assert (=> start!19264 true))

(declare-fun tp_is_empty!4423 () Bool)

(assert (=> start!19264 tp_is_empty!4423))

(declare-fun e!124748 () Bool)

(declare-fun b!189582 () Bool)

(assert (=> b!189582 (= e!124748 (= (select (arr!3800 (_keys!5833 thiss!1248)) (index!4795 lt!93845)) key!828))))

(declare-fun b!189583 () Bool)

(assert (=> b!189583 (= e!124744 (not (and (bvsge (index!4795 lt!93845) #b00000000000000000000000000000000) (bvslt (index!4795 lt!93845) (size!4121 (_values!3849 thiss!1248))))))))

(declare-fun v!309 () V!5545)

(declare-datatypes ((tuple2!3456 0))(
  ( (tuple2!3457 (_1!1739 (_ BitVec 64)) (_2!1739 V!5545)) )
))
(declare-datatypes ((List!2372 0))(
  ( (Nil!2369) (Cons!2368 (h!3005 tuple2!3456) (t!7268 List!2372)) )
))
(declare-datatypes ((ListLongMap!2377 0))(
  ( (ListLongMap!2378 (toList!1204 List!2372)) )
))
(declare-fun lt!93850 () ListLongMap!2377)

(declare-fun +!297 (ListLongMap!2377 tuple2!3456) ListLongMap!2377)

(declare-fun getCurrentListMap!856 (array!8061 array!8063 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 32) Int) ListLongMap!2377)

(assert (=> b!189583 (= (+!297 lt!93850 (tuple2!3457 key!828 v!309)) (getCurrentListMap!856 (_keys!5833 thiss!1248) (array!8064 (store (arr!3801 (_values!3849 thiss!1248)) (index!4795 lt!93845) (ValueCellFull!1868 v!309)) (size!4121 (_values!3849 thiss!1248))) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93846 () Unit!5715)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!101 (array!8061 array!8063 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 32) (_ BitVec 64) V!5545 Int) Unit!5715)

(assert (=> b!189583 (= lt!93846 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!101 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) (index!4795 lt!93845) key!828 v!309 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93847 () Unit!5715)

(assert (=> b!189583 (= lt!93847 e!124750)))

(declare-fun c!34062 () Bool)

(declare-fun contains!1323 (ListLongMap!2377 (_ BitVec 64)) Bool)

(assert (=> b!189583 (= c!34062 (contains!1323 lt!93850 key!828))))

(assert (=> b!189583 (= lt!93850 (getCurrentListMap!856 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun b!189584 () Bool)

(declare-fun res!89651 () Bool)

(assert (=> b!189584 (=> (not res!89651) (not e!124746))))

(assert (=> b!189584 (= res!89651 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189585 () Bool)

(declare-fun e!124749 () Bool)

(declare-fun e!124747 () Bool)

(declare-fun mapRes!7630 () Bool)

(assert (=> b!189585 (= e!124749 (and e!124747 mapRes!7630))))

(declare-fun condMapEmpty!7630 () Bool)

(declare-fun mapDefault!7630 () ValueCell!1868)

(assert (=> b!189585 (= condMapEmpty!7630 (= (arr!3801 (_values!3849 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1868)) mapDefault!7630)))))

(declare-fun b!189586 () Bool)

(assert (=> b!189586 (= e!124747 tp_is_empty!4423)))

(declare-fun b!189587 () Bool)

(declare-fun lt!93848 () Unit!5715)

(assert (=> b!189587 (= e!124750 lt!93848)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!166 (array!8061 array!8063 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 64) Int) Unit!5715)

(assert (=> b!189587 (= lt!93848 (lemmaInListMapThenSeekEntryOrOpenFindsIt!166 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)))))

(declare-fun res!89650 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189587 (= res!89650 (inRange!0 (index!4795 lt!93845) (mask!9055 thiss!1248)))))

(assert (=> b!189587 (=> (not res!89650) (not e!124748))))

(assert (=> b!189587 e!124748))

(declare-fun array_inv!2451 (array!8061) Bool)

(declare-fun array_inv!2452 (array!8063) Bool)

(assert (=> b!189588 (= e!124752 (and tp!16785 tp_is_empty!4423 (array_inv!2451 (_keys!5833 thiss!1248)) (array_inv!2452 (_values!3849 thiss!1248)) e!124749))))

(declare-fun b!189589 () Bool)

(declare-fun e!124745 () Bool)

(assert (=> b!189589 (= e!124745 tp_is_empty!4423)))

(declare-fun mapIsEmpty!7630 () Bool)

(assert (=> mapIsEmpty!7630 mapRes!7630))

(declare-fun mapNonEmpty!7630 () Bool)

(declare-fun tp!16786 () Bool)

(assert (=> mapNonEmpty!7630 (= mapRes!7630 (and tp!16786 e!124745))))

(declare-fun mapValue!7630 () ValueCell!1868)

(declare-fun mapRest!7630 () (Array (_ BitVec 32) ValueCell!1868))

(declare-fun mapKey!7630 () (_ BitVec 32))

(assert (=> mapNonEmpty!7630 (= (arr!3801 (_values!3849 thiss!1248)) (store mapRest!7630 mapKey!7630 mapValue!7630))))

(assert (= (and start!19264 res!89652) b!189584))

(assert (= (and b!189584 res!89651) b!189580))

(assert (= (and b!189580 res!89653) b!189583))

(assert (= (and b!189583 c!34062) b!189587))

(assert (= (and b!189583 (not c!34062)) b!189581))

(assert (= (and b!189587 res!89650) b!189582))

(assert (= (and b!189585 condMapEmpty!7630) mapIsEmpty!7630))

(assert (= (and b!189585 (not condMapEmpty!7630)) mapNonEmpty!7630))

(assert (= (and mapNonEmpty!7630 ((_ is ValueCellFull!1868) mapValue!7630)) b!189589))

(assert (= (and b!189585 ((_ is ValueCellFull!1868) mapDefault!7630)) b!189586))

(assert (= b!189588 b!189585))

(assert (= start!19264 b!189588))

(declare-fun m!216023 () Bool)

(assert (=> mapNonEmpty!7630 m!216023))

(declare-fun m!216025 () Bool)

(assert (=> b!189587 m!216025))

(declare-fun m!216027 () Bool)

(assert (=> b!189587 m!216027))

(declare-fun m!216029 () Bool)

(assert (=> b!189582 m!216029))

(declare-fun m!216031 () Bool)

(assert (=> start!19264 m!216031))

(declare-fun m!216033 () Bool)

(assert (=> b!189588 m!216033))

(declare-fun m!216035 () Bool)

(assert (=> b!189588 m!216035))

(declare-fun m!216037 () Bool)

(assert (=> b!189583 m!216037))

(declare-fun m!216039 () Bool)

(assert (=> b!189583 m!216039))

(declare-fun m!216041 () Bool)

(assert (=> b!189583 m!216041))

(declare-fun m!216043 () Bool)

(assert (=> b!189583 m!216043))

(declare-fun m!216045 () Bool)

(assert (=> b!189583 m!216045))

(declare-fun m!216047 () Bool)

(assert (=> b!189583 m!216047))

(declare-fun m!216049 () Bool)

(assert (=> b!189581 m!216049))

(declare-fun m!216051 () Bool)

(assert (=> b!189580 m!216051))

(check-sat (not b!189580) tp_is_empty!4423 (not start!19264) (not mapNonEmpty!7630) (not b!189587) (not b!189588) b_and!11303 (not b!189581) (not b!189583) (not b_next!4651))
(check-sat b_and!11303 (not b_next!4651))
(get-model)

(declare-fun b!189662 () Bool)

(declare-fun c!34075 () Bool)

(declare-fun lt!93895 () (_ BitVec 64))

(assert (=> b!189662 (= c!34075 (= lt!93895 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!124814 () SeekEntryResult!656)

(declare-fun e!124813 () SeekEntryResult!656)

(assert (=> b!189662 (= e!124814 e!124813)))

(declare-fun b!189663 () Bool)

(declare-fun lt!93894 () SeekEntryResult!656)

(assert (=> b!189663 (= e!124814 (Found!656 (index!4796 lt!93894)))))

(declare-fun b!189664 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8061 (_ BitVec 32)) SeekEntryResult!656)

(assert (=> b!189664 (= e!124813 (seekKeyOrZeroReturnVacant!0 (x!20422 lt!93894) (index!4796 lt!93894) (index!4796 lt!93894) key!828 (_keys!5833 thiss!1248) (mask!9055 thiss!1248)))))

(declare-fun b!189665 () Bool)

(assert (=> b!189665 (= e!124813 (MissingZero!656 (index!4796 lt!93894)))))

(declare-fun b!189666 () Bool)

(declare-fun e!124815 () SeekEntryResult!656)

(assert (=> b!189666 (= e!124815 Undefined!656)))

(declare-fun b!189667 () Bool)

(assert (=> b!189667 (= e!124815 e!124814)))

(assert (=> b!189667 (= lt!93895 (select (arr!3800 (_keys!5833 thiss!1248)) (index!4796 lt!93894)))))

(declare-fun c!34076 () Bool)

(assert (=> b!189667 (= c!34076 (= lt!93895 key!828))))

(declare-fun d!55791 () Bool)

(declare-fun lt!93893 () SeekEntryResult!656)

(assert (=> d!55791 (and (or ((_ is Undefined!656) lt!93893) (not ((_ is Found!656) lt!93893)) (and (bvsge (index!4795 lt!93893) #b00000000000000000000000000000000) (bvslt (index!4795 lt!93893) (size!4120 (_keys!5833 thiss!1248))))) (or ((_ is Undefined!656) lt!93893) ((_ is Found!656) lt!93893) (not ((_ is MissingZero!656) lt!93893)) (and (bvsge (index!4794 lt!93893) #b00000000000000000000000000000000) (bvslt (index!4794 lt!93893) (size!4120 (_keys!5833 thiss!1248))))) (or ((_ is Undefined!656) lt!93893) ((_ is Found!656) lt!93893) ((_ is MissingZero!656) lt!93893) (not ((_ is MissingVacant!656) lt!93893)) (and (bvsge (index!4797 lt!93893) #b00000000000000000000000000000000) (bvslt (index!4797 lt!93893) (size!4120 (_keys!5833 thiss!1248))))) (or ((_ is Undefined!656) lt!93893) (ite ((_ is Found!656) lt!93893) (= (select (arr!3800 (_keys!5833 thiss!1248)) (index!4795 lt!93893)) key!828) (ite ((_ is MissingZero!656) lt!93893) (= (select (arr!3800 (_keys!5833 thiss!1248)) (index!4794 lt!93893)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!656) lt!93893) (= (select (arr!3800 (_keys!5833 thiss!1248)) (index!4797 lt!93893)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55791 (= lt!93893 e!124815)))

(declare-fun c!34077 () Bool)

(assert (=> d!55791 (= c!34077 (and ((_ is Intermediate!656) lt!93894) (undefined!1468 lt!93894)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8061 (_ BitVec 32)) SeekEntryResult!656)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55791 (= lt!93894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9055 thiss!1248)) key!828 (_keys!5833 thiss!1248) (mask!9055 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!55791 (validMask!0 (mask!9055 thiss!1248))))

(assert (=> d!55791 (= (seekEntryOrOpen!0 key!828 (_keys!5833 thiss!1248) (mask!9055 thiss!1248)) lt!93893)))

(assert (= (and d!55791 c!34077) b!189666))

(assert (= (and d!55791 (not c!34077)) b!189667))

(assert (= (and b!189667 c!34076) b!189663))

(assert (= (and b!189667 (not c!34076)) b!189662))

(assert (= (and b!189662 c!34075) b!189665))

(assert (= (and b!189662 (not c!34075)) b!189664))

(declare-fun m!216113 () Bool)

(assert (=> b!189664 m!216113))

(declare-fun m!216115 () Bool)

(assert (=> b!189667 m!216115))

(declare-fun m!216117 () Bool)

(assert (=> d!55791 m!216117))

(declare-fun m!216119 () Bool)

(assert (=> d!55791 m!216119))

(declare-fun m!216121 () Bool)

(assert (=> d!55791 m!216121))

(declare-fun m!216123 () Bool)

(assert (=> d!55791 m!216123))

(declare-fun m!216125 () Bool)

(assert (=> d!55791 m!216125))

(declare-fun m!216127 () Bool)

(assert (=> d!55791 m!216127))

(assert (=> d!55791 m!216117))

(assert (=> b!189580 d!55791))

(declare-fun d!55793 () Bool)

(declare-fun e!124818 () Bool)

(assert (=> d!55793 e!124818))

(declare-fun res!89680 () Bool)

(assert (=> d!55793 (=> (not res!89680) (not e!124818))))

(assert (=> d!55793 (= res!89680 (and (bvsge (index!4795 lt!93845) #b00000000000000000000000000000000) (bvslt (index!4795 lt!93845) (size!4121 (_values!3849 thiss!1248)))))))

(declare-fun lt!93898 () Unit!5715)

(declare-fun choose!1021 (array!8061 array!8063 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 32) (_ BitVec 64) V!5545 Int) Unit!5715)

(assert (=> d!55793 (= lt!93898 (choose!1021 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) (index!4795 lt!93845) key!828 v!309 (defaultEntry!3866 thiss!1248)))))

(assert (=> d!55793 (validMask!0 (mask!9055 thiss!1248))))

(assert (=> d!55793 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!101 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) (index!4795 lt!93845) key!828 v!309 (defaultEntry!3866 thiss!1248)) lt!93898)))

(declare-fun b!189670 () Bool)

(assert (=> b!189670 (= e!124818 (= (+!297 (getCurrentListMap!856 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)) (tuple2!3457 key!828 v!309)) (getCurrentListMap!856 (_keys!5833 thiss!1248) (array!8064 (store (arr!3801 (_values!3849 thiss!1248)) (index!4795 lt!93845) (ValueCellFull!1868 v!309)) (size!4121 (_values!3849 thiss!1248))) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248))))))

(assert (= (and d!55793 res!89680) b!189670))

(declare-fun m!216129 () Bool)

(assert (=> d!55793 m!216129))

(assert (=> d!55793 m!216121))

(assert (=> b!189670 m!216039))

(assert (=> b!189670 m!216039))

(declare-fun m!216131 () Bool)

(assert (=> b!189670 m!216131))

(assert (=> b!189670 m!216043))

(assert (=> b!189670 m!216045))

(assert (=> b!189583 d!55793))

(declare-fun b!189713 () Bool)

(declare-fun e!124847 () Bool)

(declare-fun e!124854 () Bool)

(assert (=> b!189713 (= e!124847 e!124854)))

(declare-fun res!89700 () Bool)

(declare-fun call!19106 () Bool)

(assert (=> b!189713 (= res!89700 call!19106)))

(assert (=> b!189713 (=> (not res!89700) (not e!124854))))

(declare-fun b!189714 () Bool)

(declare-fun e!124852 () Bool)

(assert (=> b!189714 (= e!124852 e!124847)))

(declare-fun c!34095 () Bool)

(assert (=> b!189714 (= c!34095 (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189715 () Bool)

(declare-fun res!89704 () Bool)

(assert (=> b!189715 (=> (not res!89704) (not e!124852))))

(declare-fun e!124855 () Bool)

(assert (=> b!189715 (= res!89704 e!124855)))

(declare-fun res!89706 () Bool)

(assert (=> b!189715 (=> res!89706 e!124855)))

(declare-fun e!124851 () Bool)

(assert (=> b!189715 (= res!89706 (not e!124851))))

(declare-fun res!89707 () Bool)

(assert (=> b!189715 (=> (not res!89707) (not e!124851))))

(assert (=> b!189715 (= res!89707 (bvslt #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))))))

(declare-fun b!189716 () Bool)

(declare-fun e!124850 () ListLongMap!2377)

(declare-fun call!19107 () ListLongMap!2377)

(assert (=> b!189716 (= e!124850 call!19107)))

(declare-fun d!55795 () Bool)

(assert (=> d!55795 e!124852))

(declare-fun res!89703 () Bool)

(assert (=> d!55795 (=> (not res!89703) (not e!124852))))

(assert (=> d!55795 (= res!89703 (or (bvsge #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))))))))

(declare-fun lt!93959 () ListLongMap!2377)

(declare-fun lt!93964 () ListLongMap!2377)

(assert (=> d!55795 (= lt!93959 lt!93964)))

(declare-fun lt!93954 () Unit!5715)

(declare-fun e!124846 () Unit!5715)

(assert (=> d!55795 (= lt!93954 e!124846)))

(declare-fun c!34092 () Bool)

(declare-fun e!124849 () Bool)

(assert (=> d!55795 (= c!34092 e!124849)))

(declare-fun res!89701 () Bool)

(assert (=> d!55795 (=> (not res!89701) (not e!124849))))

(assert (=> d!55795 (= res!89701 (bvslt #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))))))

(declare-fun e!124853 () ListLongMap!2377)

(assert (=> d!55795 (= lt!93964 e!124853)))

(declare-fun c!34090 () Bool)

(assert (=> d!55795 (= c!34090 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55795 (validMask!0 (mask!9055 thiss!1248))))

(assert (=> d!55795 (= (getCurrentListMap!856 (_keys!5833 thiss!1248) (array!8064 (store (arr!3801 (_values!3849 thiss!1248)) (index!4795 lt!93845) (ValueCellFull!1868 v!309)) (size!4121 (_values!3849 thiss!1248))) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)) lt!93959)))

(declare-fun b!189717 () Bool)

(declare-fun Unit!5721 () Unit!5715)

(assert (=> b!189717 (= e!124846 Unit!5721)))

(declare-fun b!189718 () Bool)

(declare-fun apply!177 (ListLongMap!2377 (_ BitVec 64)) V!5545)

(assert (=> b!189718 (= e!124854 (= (apply!177 lt!93959 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3707 thiss!1248)))))

(declare-fun b!189719 () Bool)

(declare-fun e!124856 () ListLongMap!2377)

(assert (=> b!189719 (= e!124853 e!124856)))

(declare-fun c!34094 () Bool)

(assert (=> b!189719 (= c!34094 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!19110 () ListLongMap!2377)

(declare-fun call!19111 () ListLongMap!2377)

(declare-fun call!19109 () ListLongMap!2377)

(declare-fun bm!19102 () Bool)

(assert (=> bm!19102 (= call!19110 (+!297 (ite c!34090 call!19111 (ite c!34094 call!19109 call!19107)) (ite (or c!34090 c!34094) (tuple2!3457 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3707 thiss!1248)) (tuple2!3457 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3707 thiss!1248)))))))

(declare-fun b!189720 () Bool)

(assert (=> b!189720 (= e!124853 (+!297 call!19110 (tuple2!3457 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3707 thiss!1248))))))

(declare-fun b!189721 () Bool)

(declare-fun call!19108 () ListLongMap!2377)

(assert (=> b!189721 (= e!124850 call!19108)))

(declare-fun b!189722 () Bool)

(assert (=> b!189722 (= e!124847 (not call!19106))))

(declare-fun b!189723 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189723 (= e!124851 (validKeyInArray!0 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189724 () Bool)

(declare-fun c!34091 () Bool)

(assert (=> b!189724 (= c!34091 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189724 (= e!124856 e!124850)))

(declare-fun bm!19103 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!208 (array!8061 array!8063 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 32) Int) ListLongMap!2377)

(assert (=> bm!19103 (= call!19111 (getCurrentListMapNoExtraKeys!208 (_keys!5833 thiss!1248) (array!8064 (store (arr!3801 (_values!3849 thiss!1248)) (index!4795 lt!93845) (ValueCellFull!1868 v!309)) (size!4121 (_values!3849 thiss!1248))) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun b!189725 () Bool)

(declare-fun e!124848 () Bool)

(declare-fun e!124845 () Bool)

(assert (=> b!189725 (= e!124848 e!124845)))

(declare-fun res!89702 () Bool)

(declare-fun call!19105 () Bool)

(assert (=> b!189725 (= res!89702 call!19105)))

(assert (=> b!189725 (=> (not res!89702) (not e!124845))))

(declare-fun bm!19104 () Bool)

(assert (=> bm!19104 (= call!19107 call!19109)))

(declare-fun b!189726 () Bool)

(assert (=> b!189726 (= e!124848 (not call!19105))))

(declare-fun b!189727 () Bool)

(assert (=> b!189727 (= e!124849 (validKeyInArray!0 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189728 () Bool)

(declare-fun e!124857 () Bool)

(assert (=> b!189728 (= e!124855 e!124857)))

(declare-fun res!89705 () Bool)

(assert (=> b!189728 (=> (not res!89705) (not e!124857))))

(assert (=> b!189728 (= res!89705 (contains!1323 lt!93959 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))))))

(declare-fun b!189729 () Bool)

(declare-fun get!2198 (ValueCell!1868 V!5545) V!5545)

(declare-fun dynLambda!520 (Int (_ BitVec 64)) V!5545)

(assert (=> b!189729 (= e!124857 (= (apply!177 lt!93959 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000)) (get!2198 (select (arr!3801 (array!8064 (store (arr!3801 (_values!3849 thiss!1248)) (index!4795 lt!93845) (ValueCellFull!1868 v!309)) (size!4121 (_values!3849 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!520 (defaultEntry!3866 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4121 (array!8064 (store (arr!3801 (_values!3849 thiss!1248)) (index!4795 lt!93845) (ValueCellFull!1868 v!309)) (size!4121 (_values!3849 thiss!1248))))))))

(assert (=> b!189729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))))))

(declare-fun b!189730 () Bool)

(declare-fun res!89699 () Bool)

(assert (=> b!189730 (=> (not res!89699) (not e!124852))))

(assert (=> b!189730 (= res!89699 e!124848)))

(declare-fun c!34093 () Bool)

(assert (=> b!189730 (= c!34093 (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19105 () Bool)

(assert (=> bm!19105 (= call!19108 call!19110)))

(declare-fun bm!19106 () Bool)

(assert (=> bm!19106 (= call!19109 call!19111)))

(declare-fun b!189731 () Bool)

(assert (=> b!189731 (= e!124845 (= (apply!177 lt!93959 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3707 thiss!1248)))))

(declare-fun b!189732 () Bool)

(declare-fun lt!93946 () Unit!5715)

(assert (=> b!189732 (= e!124846 lt!93946)))

(declare-fun lt!93947 () ListLongMap!2377)

(assert (=> b!189732 (= lt!93947 (getCurrentListMapNoExtraKeys!208 (_keys!5833 thiss!1248) (array!8064 (store (arr!3801 (_values!3849 thiss!1248)) (index!4795 lt!93845) (ValueCellFull!1868 v!309)) (size!4121 (_values!3849 thiss!1248))) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93949 () (_ BitVec 64))

(assert (=> b!189732 (= lt!93949 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93943 () (_ BitVec 64))

(assert (=> b!189732 (= lt!93943 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93948 () Unit!5715)

(declare-fun addStillContains!153 (ListLongMap!2377 (_ BitVec 64) V!5545 (_ BitVec 64)) Unit!5715)

(assert (=> b!189732 (= lt!93948 (addStillContains!153 lt!93947 lt!93949 (zeroValue!3707 thiss!1248) lt!93943))))

(assert (=> b!189732 (contains!1323 (+!297 lt!93947 (tuple2!3457 lt!93949 (zeroValue!3707 thiss!1248))) lt!93943)))

(declare-fun lt!93950 () Unit!5715)

(assert (=> b!189732 (= lt!93950 lt!93948)))

(declare-fun lt!93956 () ListLongMap!2377)

(assert (=> b!189732 (= lt!93956 (getCurrentListMapNoExtraKeys!208 (_keys!5833 thiss!1248) (array!8064 (store (arr!3801 (_values!3849 thiss!1248)) (index!4795 lt!93845) (ValueCellFull!1868 v!309)) (size!4121 (_values!3849 thiss!1248))) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93953 () (_ BitVec 64))

(assert (=> b!189732 (= lt!93953 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93951 () (_ BitVec 64))

(assert (=> b!189732 (= lt!93951 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93963 () Unit!5715)

(declare-fun addApplyDifferent!153 (ListLongMap!2377 (_ BitVec 64) V!5545 (_ BitVec 64)) Unit!5715)

(assert (=> b!189732 (= lt!93963 (addApplyDifferent!153 lt!93956 lt!93953 (minValue!3707 thiss!1248) lt!93951))))

(assert (=> b!189732 (= (apply!177 (+!297 lt!93956 (tuple2!3457 lt!93953 (minValue!3707 thiss!1248))) lt!93951) (apply!177 lt!93956 lt!93951))))

(declare-fun lt!93957 () Unit!5715)

(assert (=> b!189732 (= lt!93957 lt!93963)))

(declare-fun lt!93944 () ListLongMap!2377)

(assert (=> b!189732 (= lt!93944 (getCurrentListMapNoExtraKeys!208 (_keys!5833 thiss!1248) (array!8064 (store (arr!3801 (_values!3849 thiss!1248)) (index!4795 lt!93845) (ValueCellFull!1868 v!309)) (size!4121 (_values!3849 thiss!1248))) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93958 () (_ BitVec 64))

(assert (=> b!189732 (= lt!93958 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93952 () (_ BitVec 64))

(assert (=> b!189732 (= lt!93952 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93962 () Unit!5715)

(assert (=> b!189732 (= lt!93962 (addApplyDifferent!153 lt!93944 lt!93958 (zeroValue!3707 thiss!1248) lt!93952))))

(assert (=> b!189732 (= (apply!177 (+!297 lt!93944 (tuple2!3457 lt!93958 (zeroValue!3707 thiss!1248))) lt!93952) (apply!177 lt!93944 lt!93952))))

(declare-fun lt!93945 () Unit!5715)

(assert (=> b!189732 (= lt!93945 lt!93962)))

(declare-fun lt!93955 () ListLongMap!2377)

(assert (=> b!189732 (= lt!93955 (getCurrentListMapNoExtraKeys!208 (_keys!5833 thiss!1248) (array!8064 (store (arr!3801 (_values!3849 thiss!1248)) (index!4795 lt!93845) (ValueCellFull!1868 v!309)) (size!4121 (_values!3849 thiss!1248))) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93960 () (_ BitVec 64))

(assert (=> b!189732 (= lt!93960 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93961 () (_ BitVec 64))

(assert (=> b!189732 (= lt!93961 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189732 (= lt!93946 (addApplyDifferent!153 lt!93955 lt!93960 (minValue!3707 thiss!1248) lt!93961))))

(assert (=> b!189732 (= (apply!177 (+!297 lt!93955 (tuple2!3457 lt!93960 (minValue!3707 thiss!1248))) lt!93961) (apply!177 lt!93955 lt!93961))))

(declare-fun bm!19107 () Bool)

(assert (=> bm!19107 (= call!19105 (contains!1323 lt!93959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189733 () Bool)

(assert (=> b!189733 (= e!124856 call!19108)))

(declare-fun bm!19108 () Bool)

(assert (=> bm!19108 (= call!19106 (contains!1323 lt!93959 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!55795 c!34090) b!189720))

(assert (= (and d!55795 (not c!34090)) b!189719))

(assert (= (and b!189719 c!34094) b!189733))

(assert (= (and b!189719 (not c!34094)) b!189724))

(assert (= (and b!189724 c!34091) b!189721))

(assert (= (and b!189724 (not c!34091)) b!189716))

(assert (= (or b!189721 b!189716) bm!19104))

(assert (= (or b!189733 bm!19104) bm!19106))

(assert (= (or b!189733 b!189721) bm!19105))

(assert (= (or b!189720 bm!19106) bm!19103))

(assert (= (or b!189720 bm!19105) bm!19102))

(assert (= (and d!55795 res!89701) b!189727))

(assert (= (and d!55795 c!34092) b!189732))

(assert (= (and d!55795 (not c!34092)) b!189717))

(assert (= (and d!55795 res!89703) b!189715))

(assert (= (and b!189715 res!89707) b!189723))

(assert (= (and b!189715 (not res!89706)) b!189728))

(assert (= (and b!189728 res!89705) b!189729))

(assert (= (and b!189715 res!89704) b!189730))

(assert (= (and b!189730 c!34093) b!189725))

(assert (= (and b!189730 (not c!34093)) b!189726))

(assert (= (and b!189725 res!89702) b!189731))

(assert (= (or b!189725 b!189726) bm!19107))

(assert (= (and b!189730 res!89699) b!189714))

(assert (= (and b!189714 c!34095) b!189713))

(assert (= (and b!189714 (not c!34095)) b!189722))

(assert (= (and b!189713 res!89700) b!189718))

(assert (= (or b!189713 b!189722) bm!19108))

(declare-fun b_lambda!7349 () Bool)

(assert (=> (not b_lambda!7349) (not b!189729)))

(declare-fun t!7270 () Bool)

(declare-fun tb!2857 () Bool)

(assert (=> (and b!189588 (= (defaultEntry!3866 thiss!1248) (defaultEntry!3866 thiss!1248)) t!7270) tb!2857))

(declare-fun result!4865 () Bool)

(assert (=> tb!2857 (= result!4865 tp_is_empty!4423)))

(assert (=> b!189729 t!7270))

(declare-fun b_and!11309 () Bool)

(assert (= b_and!11303 (and (=> t!7270 result!4865) b_and!11309)))

(declare-fun m!216133 () Bool)

(assert (=> b!189728 m!216133))

(assert (=> b!189728 m!216133))

(declare-fun m!216135 () Bool)

(assert (=> b!189728 m!216135))

(assert (=> b!189723 m!216133))

(assert (=> b!189723 m!216133))

(declare-fun m!216137 () Bool)

(assert (=> b!189723 m!216137))

(declare-fun m!216139 () Bool)

(assert (=> b!189720 m!216139))

(declare-fun m!216141 () Bool)

(assert (=> bm!19107 m!216141))

(declare-fun m!216143 () Bool)

(assert (=> b!189731 m!216143))

(declare-fun m!216145 () Bool)

(assert (=> bm!19102 m!216145))

(declare-fun m!216147 () Bool)

(assert (=> bm!19103 m!216147))

(declare-fun m!216149 () Bool)

(assert (=> b!189718 m!216149))

(assert (=> b!189729 m!216133))

(declare-fun m!216151 () Bool)

(assert (=> b!189729 m!216151))

(declare-fun m!216153 () Bool)

(assert (=> b!189729 m!216153))

(assert (=> b!189729 m!216133))

(assert (=> b!189729 m!216153))

(declare-fun m!216155 () Bool)

(assert (=> b!189729 m!216155))

(declare-fun m!216157 () Bool)

(assert (=> b!189729 m!216157))

(assert (=> b!189729 m!216155))

(assert (=> d!55795 m!216121))

(declare-fun m!216159 () Bool)

(assert (=> bm!19108 m!216159))

(declare-fun m!216161 () Bool)

(assert (=> b!189732 m!216161))

(declare-fun m!216163 () Bool)

(assert (=> b!189732 m!216163))

(declare-fun m!216165 () Bool)

(assert (=> b!189732 m!216165))

(declare-fun m!216167 () Bool)

(assert (=> b!189732 m!216167))

(assert (=> b!189732 m!216133))

(declare-fun m!216169 () Bool)

(assert (=> b!189732 m!216169))

(declare-fun m!216171 () Bool)

(assert (=> b!189732 m!216171))

(declare-fun m!216173 () Bool)

(assert (=> b!189732 m!216173))

(assert (=> b!189732 m!216173))

(declare-fun m!216175 () Bool)

(assert (=> b!189732 m!216175))

(assert (=> b!189732 m!216161))

(declare-fun m!216177 () Bool)

(assert (=> b!189732 m!216177))

(assert (=> b!189732 m!216171))

(declare-fun m!216179 () Bool)

(assert (=> b!189732 m!216179))

(declare-fun m!216181 () Bool)

(assert (=> b!189732 m!216181))

(declare-fun m!216183 () Bool)

(assert (=> b!189732 m!216183))

(assert (=> b!189732 m!216183))

(declare-fun m!216185 () Bool)

(assert (=> b!189732 m!216185))

(declare-fun m!216187 () Bool)

(assert (=> b!189732 m!216187))

(declare-fun m!216189 () Bool)

(assert (=> b!189732 m!216189))

(assert (=> b!189732 m!216147))

(assert (=> b!189727 m!216133))

(assert (=> b!189727 m!216133))

(assert (=> b!189727 m!216137))

(assert (=> b!189583 d!55795))

(declare-fun b!189736 () Bool)

(declare-fun e!124860 () Bool)

(declare-fun e!124867 () Bool)

(assert (=> b!189736 (= e!124860 e!124867)))

(declare-fun res!89709 () Bool)

(declare-fun call!19113 () Bool)

(assert (=> b!189736 (= res!89709 call!19113)))

(assert (=> b!189736 (=> (not res!89709) (not e!124867))))

(declare-fun b!189737 () Bool)

(declare-fun e!124865 () Bool)

(assert (=> b!189737 (= e!124865 e!124860)))

(declare-fun c!34101 () Bool)

(assert (=> b!189737 (= c!34101 (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189738 () Bool)

(declare-fun res!89713 () Bool)

(assert (=> b!189738 (=> (not res!89713) (not e!124865))))

(declare-fun e!124868 () Bool)

(assert (=> b!189738 (= res!89713 e!124868)))

(declare-fun res!89715 () Bool)

(assert (=> b!189738 (=> res!89715 e!124868)))

(declare-fun e!124864 () Bool)

(assert (=> b!189738 (= res!89715 (not e!124864))))

(declare-fun res!89716 () Bool)

(assert (=> b!189738 (=> (not res!89716) (not e!124864))))

(assert (=> b!189738 (= res!89716 (bvslt #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))))))

(declare-fun b!189739 () Bool)

(declare-fun e!124863 () ListLongMap!2377)

(declare-fun call!19114 () ListLongMap!2377)

(assert (=> b!189739 (= e!124863 call!19114)))

(declare-fun d!55797 () Bool)

(assert (=> d!55797 e!124865))

(declare-fun res!89712 () Bool)

(assert (=> d!55797 (=> (not res!89712) (not e!124865))))

(assert (=> d!55797 (= res!89712 (or (bvsge #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))))))))

(declare-fun lt!93981 () ListLongMap!2377)

(declare-fun lt!93986 () ListLongMap!2377)

(assert (=> d!55797 (= lt!93981 lt!93986)))

(declare-fun lt!93976 () Unit!5715)

(declare-fun e!124859 () Unit!5715)

(assert (=> d!55797 (= lt!93976 e!124859)))

(declare-fun c!34098 () Bool)

(declare-fun e!124862 () Bool)

(assert (=> d!55797 (= c!34098 e!124862)))

(declare-fun res!89710 () Bool)

(assert (=> d!55797 (=> (not res!89710) (not e!124862))))

(assert (=> d!55797 (= res!89710 (bvslt #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))))))

(declare-fun e!124866 () ListLongMap!2377)

(assert (=> d!55797 (= lt!93986 e!124866)))

(declare-fun c!34096 () Bool)

(assert (=> d!55797 (= c!34096 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55797 (validMask!0 (mask!9055 thiss!1248))))

(assert (=> d!55797 (= (getCurrentListMap!856 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)) lt!93981)))

(declare-fun b!189740 () Bool)

(declare-fun Unit!5722 () Unit!5715)

(assert (=> b!189740 (= e!124859 Unit!5722)))

(declare-fun b!189741 () Bool)

(assert (=> b!189741 (= e!124867 (= (apply!177 lt!93981 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3707 thiss!1248)))))

(declare-fun b!189742 () Bool)

(declare-fun e!124869 () ListLongMap!2377)

(assert (=> b!189742 (= e!124866 e!124869)))

(declare-fun c!34100 () Bool)

(assert (=> b!189742 (= c!34100 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!19117 () ListLongMap!2377)

(declare-fun call!19118 () ListLongMap!2377)

(declare-fun bm!19109 () Bool)

(declare-fun call!19116 () ListLongMap!2377)

(assert (=> bm!19109 (= call!19117 (+!297 (ite c!34096 call!19118 (ite c!34100 call!19116 call!19114)) (ite (or c!34096 c!34100) (tuple2!3457 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3707 thiss!1248)) (tuple2!3457 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3707 thiss!1248)))))))

(declare-fun b!189743 () Bool)

(assert (=> b!189743 (= e!124866 (+!297 call!19117 (tuple2!3457 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3707 thiss!1248))))))

(declare-fun b!189744 () Bool)

(declare-fun call!19115 () ListLongMap!2377)

(assert (=> b!189744 (= e!124863 call!19115)))

(declare-fun b!189745 () Bool)

(assert (=> b!189745 (= e!124860 (not call!19113))))

(declare-fun b!189746 () Bool)

(assert (=> b!189746 (= e!124864 (validKeyInArray!0 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189747 () Bool)

(declare-fun c!34097 () Bool)

(assert (=> b!189747 (= c!34097 (and (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189747 (= e!124869 e!124863)))

(declare-fun bm!19110 () Bool)

(assert (=> bm!19110 (= call!19118 (getCurrentListMapNoExtraKeys!208 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun b!189748 () Bool)

(declare-fun e!124861 () Bool)

(declare-fun e!124858 () Bool)

(assert (=> b!189748 (= e!124861 e!124858)))

(declare-fun res!89711 () Bool)

(declare-fun call!19112 () Bool)

(assert (=> b!189748 (= res!89711 call!19112)))

(assert (=> b!189748 (=> (not res!89711) (not e!124858))))

(declare-fun bm!19111 () Bool)

(assert (=> bm!19111 (= call!19114 call!19116)))

(declare-fun b!189749 () Bool)

(assert (=> b!189749 (= e!124861 (not call!19112))))

(declare-fun b!189750 () Bool)

(assert (=> b!189750 (= e!124862 (validKeyInArray!0 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189751 () Bool)

(declare-fun e!124870 () Bool)

(assert (=> b!189751 (= e!124868 e!124870)))

(declare-fun res!89714 () Bool)

(assert (=> b!189751 (=> (not res!89714) (not e!124870))))

(assert (=> b!189751 (= res!89714 (contains!1323 lt!93981 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189751 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))))))

(declare-fun b!189752 () Bool)

(assert (=> b!189752 (= e!124870 (= (apply!177 lt!93981 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000)) (get!2198 (select (arr!3801 (_values!3849 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!520 (defaultEntry!3866 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4121 (_values!3849 thiss!1248))))))

(assert (=> b!189752 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))))))

(declare-fun b!189753 () Bool)

(declare-fun res!89708 () Bool)

(assert (=> b!189753 (=> (not res!89708) (not e!124865))))

(assert (=> b!189753 (= res!89708 e!124861)))

(declare-fun c!34099 () Bool)

(assert (=> b!189753 (= c!34099 (not (= (bvand (extraKeys!3603 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!19112 () Bool)

(assert (=> bm!19112 (= call!19115 call!19117)))

(declare-fun bm!19113 () Bool)

(assert (=> bm!19113 (= call!19116 call!19118)))

(declare-fun b!189754 () Bool)

(assert (=> b!189754 (= e!124858 (= (apply!177 lt!93981 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3707 thiss!1248)))))

(declare-fun b!189755 () Bool)

(declare-fun lt!93968 () Unit!5715)

(assert (=> b!189755 (= e!124859 lt!93968)))

(declare-fun lt!93969 () ListLongMap!2377)

(assert (=> b!189755 (= lt!93969 (getCurrentListMapNoExtraKeys!208 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93971 () (_ BitVec 64))

(assert (=> b!189755 (= lt!93971 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93965 () (_ BitVec 64))

(assert (=> b!189755 (= lt!93965 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93970 () Unit!5715)

(assert (=> b!189755 (= lt!93970 (addStillContains!153 lt!93969 lt!93971 (zeroValue!3707 thiss!1248) lt!93965))))

(assert (=> b!189755 (contains!1323 (+!297 lt!93969 (tuple2!3457 lt!93971 (zeroValue!3707 thiss!1248))) lt!93965)))

(declare-fun lt!93972 () Unit!5715)

(assert (=> b!189755 (= lt!93972 lt!93970)))

(declare-fun lt!93978 () ListLongMap!2377)

(assert (=> b!189755 (= lt!93978 (getCurrentListMapNoExtraKeys!208 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93975 () (_ BitVec 64))

(assert (=> b!189755 (= lt!93975 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93973 () (_ BitVec 64))

(assert (=> b!189755 (= lt!93973 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93985 () Unit!5715)

(assert (=> b!189755 (= lt!93985 (addApplyDifferent!153 lt!93978 lt!93975 (minValue!3707 thiss!1248) lt!93973))))

(assert (=> b!189755 (= (apply!177 (+!297 lt!93978 (tuple2!3457 lt!93975 (minValue!3707 thiss!1248))) lt!93973) (apply!177 lt!93978 lt!93973))))

(declare-fun lt!93979 () Unit!5715)

(assert (=> b!189755 (= lt!93979 lt!93985)))

(declare-fun lt!93966 () ListLongMap!2377)

(assert (=> b!189755 (= lt!93966 (getCurrentListMapNoExtraKeys!208 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93980 () (_ BitVec 64))

(assert (=> b!189755 (= lt!93980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93974 () (_ BitVec 64))

(assert (=> b!189755 (= lt!93974 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93984 () Unit!5715)

(assert (=> b!189755 (= lt!93984 (addApplyDifferent!153 lt!93966 lt!93980 (zeroValue!3707 thiss!1248) lt!93974))))

(assert (=> b!189755 (= (apply!177 (+!297 lt!93966 (tuple2!3457 lt!93980 (zeroValue!3707 thiss!1248))) lt!93974) (apply!177 lt!93966 lt!93974))))

(declare-fun lt!93967 () Unit!5715)

(assert (=> b!189755 (= lt!93967 lt!93984)))

(declare-fun lt!93977 () ListLongMap!2377)

(assert (=> b!189755 (= lt!93977 (getCurrentListMapNoExtraKeys!208 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3866 thiss!1248)))))

(declare-fun lt!93982 () (_ BitVec 64))

(assert (=> b!189755 (= lt!93982 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93983 () (_ BitVec 64))

(assert (=> b!189755 (= lt!93983 (select (arr!3800 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189755 (= lt!93968 (addApplyDifferent!153 lt!93977 lt!93982 (minValue!3707 thiss!1248) lt!93983))))

(assert (=> b!189755 (= (apply!177 (+!297 lt!93977 (tuple2!3457 lt!93982 (minValue!3707 thiss!1248))) lt!93983) (apply!177 lt!93977 lt!93983))))

(declare-fun bm!19114 () Bool)

(assert (=> bm!19114 (= call!19112 (contains!1323 lt!93981 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189756 () Bool)

(assert (=> b!189756 (= e!124869 call!19115)))

(declare-fun bm!19115 () Bool)

(assert (=> bm!19115 (= call!19113 (contains!1323 lt!93981 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!55797 c!34096) b!189743))

(assert (= (and d!55797 (not c!34096)) b!189742))

(assert (= (and b!189742 c!34100) b!189756))

(assert (= (and b!189742 (not c!34100)) b!189747))

(assert (= (and b!189747 c!34097) b!189744))

(assert (= (and b!189747 (not c!34097)) b!189739))

(assert (= (or b!189744 b!189739) bm!19111))

(assert (= (or b!189756 bm!19111) bm!19113))

(assert (= (or b!189756 b!189744) bm!19112))

(assert (= (or b!189743 bm!19113) bm!19110))

(assert (= (or b!189743 bm!19112) bm!19109))

(assert (= (and d!55797 res!89710) b!189750))

(assert (= (and d!55797 c!34098) b!189755))

(assert (= (and d!55797 (not c!34098)) b!189740))

(assert (= (and d!55797 res!89712) b!189738))

(assert (= (and b!189738 res!89716) b!189746))

(assert (= (and b!189738 (not res!89715)) b!189751))

(assert (= (and b!189751 res!89714) b!189752))

(assert (= (and b!189738 res!89713) b!189753))

(assert (= (and b!189753 c!34099) b!189748))

(assert (= (and b!189753 (not c!34099)) b!189749))

(assert (= (and b!189748 res!89711) b!189754))

(assert (= (or b!189748 b!189749) bm!19114))

(assert (= (and b!189753 res!89708) b!189737))

(assert (= (and b!189737 c!34101) b!189736))

(assert (= (and b!189737 (not c!34101)) b!189745))

(assert (= (and b!189736 res!89709) b!189741))

(assert (= (or b!189736 b!189745) bm!19115))

(declare-fun b_lambda!7351 () Bool)

(assert (=> (not b_lambda!7351) (not b!189752)))

(assert (=> b!189752 t!7270))

(declare-fun b_and!11311 () Bool)

(assert (= b_and!11309 (and (=> t!7270 result!4865) b_and!11311)))

(assert (=> b!189751 m!216133))

(assert (=> b!189751 m!216133))

(declare-fun m!216191 () Bool)

(assert (=> b!189751 m!216191))

(assert (=> b!189746 m!216133))

(assert (=> b!189746 m!216133))

(assert (=> b!189746 m!216137))

(declare-fun m!216193 () Bool)

(assert (=> b!189743 m!216193))

(declare-fun m!216195 () Bool)

(assert (=> bm!19114 m!216195))

(declare-fun m!216197 () Bool)

(assert (=> b!189754 m!216197))

(declare-fun m!216199 () Bool)

(assert (=> bm!19109 m!216199))

(declare-fun m!216201 () Bool)

(assert (=> bm!19110 m!216201))

(declare-fun m!216203 () Bool)

(assert (=> b!189741 m!216203))

(assert (=> b!189752 m!216133))

(declare-fun m!216205 () Bool)

(assert (=> b!189752 m!216205))

(declare-fun m!216207 () Bool)

(assert (=> b!189752 m!216207))

(assert (=> b!189752 m!216133))

(assert (=> b!189752 m!216207))

(assert (=> b!189752 m!216155))

(declare-fun m!216209 () Bool)

(assert (=> b!189752 m!216209))

(assert (=> b!189752 m!216155))

(assert (=> d!55797 m!216121))

(declare-fun m!216211 () Bool)

(assert (=> bm!19115 m!216211))

(declare-fun m!216213 () Bool)

(assert (=> b!189755 m!216213))

(declare-fun m!216215 () Bool)

(assert (=> b!189755 m!216215))

(declare-fun m!216217 () Bool)

(assert (=> b!189755 m!216217))

(declare-fun m!216219 () Bool)

(assert (=> b!189755 m!216219))

(assert (=> b!189755 m!216133))

(declare-fun m!216221 () Bool)

(assert (=> b!189755 m!216221))

(declare-fun m!216223 () Bool)

(assert (=> b!189755 m!216223))

(declare-fun m!216225 () Bool)

(assert (=> b!189755 m!216225))

(assert (=> b!189755 m!216225))

(declare-fun m!216227 () Bool)

(assert (=> b!189755 m!216227))

(assert (=> b!189755 m!216213))

(declare-fun m!216229 () Bool)

(assert (=> b!189755 m!216229))

(assert (=> b!189755 m!216223))

(declare-fun m!216231 () Bool)

(assert (=> b!189755 m!216231))

(declare-fun m!216233 () Bool)

(assert (=> b!189755 m!216233))

(declare-fun m!216235 () Bool)

(assert (=> b!189755 m!216235))

(assert (=> b!189755 m!216235))

(declare-fun m!216237 () Bool)

(assert (=> b!189755 m!216237))

(declare-fun m!216239 () Bool)

(assert (=> b!189755 m!216239))

(declare-fun m!216241 () Bool)

(assert (=> b!189755 m!216241))

(assert (=> b!189755 m!216201))

(assert (=> b!189750 m!216133))

(assert (=> b!189750 m!216133))

(assert (=> b!189750 m!216137))

(assert (=> b!189583 d!55797))

(declare-fun d!55799 () Bool)

(declare-fun e!124873 () Bool)

(assert (=> d!55799 e!124873))

(declare-fun res!89722 () Bool)

(assert (=> d!55799 (=> (not res!89722) (not e!124873))))

(declare-fun lt!93995 () ListLongMap!2377)

(assert (=> d!55799 (= res!89722 (contains!1323 lt!93995 (_1!1739 (tuple2!3457 key!828 v!309))))))

(declare-fun lt!93998 () List!2372)

(assert (=> d!55799 (= lt!93995 (ListLongMap!2378 lt!93998))))

(declare-fun lt!93997 () Unit!5715)

(declare-fun lt!93996 () Unit!5715)

(assert (=> d!55799 (= lt!93997 lt!93996)))

(declare-datatypes ((Option!241 0))(
  ( (Some!240 (v!4183 V!5545)) (None!239) )
))
(declare-fun getValueByKey!235 (List!2372 (_ BitVec 64)) Option!241)

(assert (=> d!55799 (= (getValueByKey!235 lt!93998 (_1!1739 (tuple2!3457 key!828 v!309))) (Some!240 (_2!1739 (tuple2!3457 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!122 (List!2372 (_ BitVec 64) V!5545) Unit!5715)

(assert (=> d!55799 (= lt!93996 (lemmaContainsTupThenGetReturnValue!122 lt!93998 (_1!1739 (tuple2!3457 key!828 v!309)) (_2!1739 (tuple2!3457 key!828 v!309))))))

(declare-fun insertStrictlySorted!125 (List!2372 (_ BitVec 64) V!5545) List!2372)

(assert (=> d!55799 (= lt!93998 (insertStrictlySorted!125 (toList!1204 lt!93850) (_1!1739 (tuple2!3457 key!828 v!309)) (_2!1739 (tuple2!3457 key!828 v!309))))))

(assert (=> d!55799 (= (+!297 lt!93850 (tuple2!3457 key!828 v!309)) lt!93995)))

(declare-fun b!189761 () Bool)

(declare-fun res!89721 () Bool)

(assert (=> b!189761 (=> (not res!89721) (not e!124873))))

(assert (=> b!189761 (= res!89721 (= (getValueByKey!235 (toList!1204 lt!93995) (_1!1739 (tuple2!3457 key!828 v!309))) (Some!240 (_2!1739 (tuple2!3457 key!828 v!309)))))))

(declare-fun b!189762 () Bool)

(declare-fun contains!1324 (List!2372 tuple2!3456) Bool)

(assert (=> b!189762 (= e!124873 (contains!1324 (toList!1204 lt!93995) (tuple2!3457 key!828 v!309)))))

(assert (= (and d!55799 res!89722) b!189761))

(assert (= (and b!189761 res!89721) b!189762))

(declare-fun m!216243 () Bool)

(assert (=> d!55799 m!216243))

(declare-fun m!216245 () Bool)

(assert (=> d!55799 m!216245))

(declare-fun m!216247 () Bool)

(assert (=> d!55799 m!216247))

(declare-fun m!216249 () Bool)

(assert (=> d!55799 m!216249))

(declare-fun m!216251 () Bool)

(assert (=> b!189761 m!216251))

(declare-fun m!216253 () Bool)

(assert (=> b!189762 m!216253))

(assert (=> b!189583 d!55799))

(declare-fun d!55801 () Bool)

(declare-fun e!124878 () Bool)

(assert (=> d!55801 e!124878))

(declare-fun res!89725 () Bool)

(assert (=> d!55801 (=> res!89725 e!124878)))

(declare-fun lt!94008 () Bool)

(assert (=> d!55801 (= res!89725 (not lt!94008))))

(declare-fun lt!94007 () Bool)

(assert (=> d!55801 (= lt!94008 lt!94007)))

(declare-fun lt!94010 () Unit!5715)

(declare-fun e!124879 () Unit!5715)

(assert (=> d!55801 (= lt!94010 e!124879)))

(declare-fun c!34104 () Bool)

(assert (=> d!55801 (= c!34104 lt!94007)))

(declare-fun containsKey!238 (List!2372 (_ BitVec 64)) Bool)

(assert (=> d!55801 (= lt!94007 (containsKey!238 (toList!1204 lt!93850) key!828))))

(assert (=> d!55801 (= (contains!1323 lt!93850 key!828) lt!94008)))

(declare-fun b!189769 () Bool)

(declare-fun lt!94009 () Unit!5715)

(assert (=> b!189769 (= e!124879 lt!94009)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!186 (List!2372 (_ BitVec 64)) Unit!5715)

(assert (=> b!189769 (= lt!94009 (lemmaContainsKeyImpliesGetValueByKeyDefined!186 (toList!1204 lt!93850) key!828))))

(declare-fun isDefined!187 (Option!241) Bool)

(assert (=> b!189769 (isDefined!187 (getValueByKey!235 (toList!1204 lt!93850) key!828))))

(declare-fun b!189770 () Bool)

(declare-fun Unit!5723 () Unit!5715)

(assert (=> b!189770 (= e!124879 Unit!5723)))

(declare-fun b!189771 () Bool)

(assert (=> b!189771 (= e!124878 (isDefined!187 (getValueByKey!235 (toList!1204 lt!93850) key!828)))))

(assert (= (and d!55801 c!34104) b!189769))

(assert (= (and d!55801 (not c!34104)) b!189770))

(assert (= (and d!55801 (not res!89725)) b!189771))

(declare-fun m!216255 () Bool)

(assert (=> d!55801 m!216255))

(declare-fun m!216257 () Bool)

(assert (=> b!189769 m!216257))

(declare-fun m!216259 () Bool)

(assert (=> b!189769 m!216259))

(assert (=> b!189769 m!216259))

(declare-fun m!216261 () Bool)

(assert (=> b!189769 m!216261))

(assert (=> b!189771 m!216259))

(assert (=> b!189771 m!216259))

(assert (=> b!189771 m!216261))

(assert (=> b!189583 d!55801))

(declare-fun d!55803 () Bool)

(assert (=> d!55803 (= (array_inv!2451 (_keys!5833 thiss!1248)) (bvsge (size!4120 (_keys!5833 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189588 d!55803))

(declare-fun d!55805 () Bool)

(assert (=> d!55805 (= (array_inv!2452 (_values!3849 thiss!1248)) (bvsge (size!4121 (_values!3849 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189588 d!55805))

(declare-fun d!55807 () Bool)

(declare-fun e!124882 () Bool)

(assert (=> d!55807 e!124882))

(declare-fun res!89731 () Bool)

(assert (=> d!55807 (=> (not res!89731) (not e!124882))))

(declare-fun lt!94016 () SeekEntryResult!656)

(assert (=> d!55807 (= res!89731 ((_ is Found!656) lt!94016))))

(assert (=> d!55807 (= lt!94016 (seekEntryOrOpen!0 key!828 (_keys!5833 thiss!1248) (mask!9055 thiss!1248)))))

(declare-fun lt!94015 () Unit!5715)

(declare-fun choose!1022 (array!8061 array!8063 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 64) Int) Unit!5715)

(assert (=> d!55807 (= lt!94015 (choose!1022 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)))))

(assert (=> d!55807 (validMask!0 (mask!9055 thiss!1248))))

(assert (=> d!55807 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!166 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)) lt!94015)))

(declare-fun b!189776 () Bool)

(declare-fun res!89730 () Bool)

(assert (=> b!189776 (=> (not res!89730) (not e!124882))))

(assert (=> b!189776 (= res!89730 (inRange!0 (index!4795 lt!94016) (mask!9055 thiss!1248)))))

(declare-fun b!189777 () Bool)

(assert (=> b!189777 (= e!124882 (= (select (arr!3800 (_keys!5833 thiss!1248)) (index!4795 lt!94016)) key!828))))

(assert (=> b!189777 (and (bvsge (index!4795 lt!94016) #b00000000000000000000000000000000) (bvslt (index!4795 lt!94016) (size!4120 (_keys!5833 thiss!1248))))))

(assert (= (and d!55807 res!89731) b!189776))

(assert (= (and b!189776 res!89730) b!189777))

(assert (=> d!55807 m!216051))

(declare-fun m!216263 () Bool)

(assert (=> d!55807 m!216263))

(assert (=> d!55807 m!216121))

(declare-fun m!216265 () Bool)

(assert (=> b!189776 m!216265))

(declare-fun m!216267 () Bool)

(assert (=> b!189777 m!216267))

(assert (=> b!189587 d!55807))

(declare-fun d!55809 () Bool)

(assert (=> d!55809 (= (inRange!0 (index!4795 lt!93845) (mask!9055 thiss!1248)) (and (bvsge (index!4795 lt!93845) #b00000000000000000000000000000000) (bvslt (index!4795 lt!93845) (bvadd (mask!9055 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!189587 d!55809))

(declare-fun b!189794 () Bool)

(declare-fun e!124891 () Bool)

(declare-fun e!124893 () Bool)

(assert (=> b!189794 (= e!124891 e!124893)))

(declare-fun c!34109 () Bool)

(declare-fun lt!94022 () SeekEntryResult!656)

(assert (=> b!189794 (= c!34109 ((_ is MissingVacant!656) lt!94022))))

(declare-fun call!19124 () Bool)

(declare-fun c!34110 () Bool)

(declare-fun bm!19120 () Bool)

(assert (=> bm!19120 (= call!19124 (inRange!0 (ite c!34110 (index!4794 lt!94022) (index!4797 lt!94022)) (mask!9055 thiss!1248)))))

(declare-fun b!189795 () Bool)

(declare-fun e!124894 () Bool)

(assert (=> b!189795 (= e!124891 e!124894)))

(declare-fun res!89741 () Bool)

(assert (=> b!189795 (= res!89741 call!19124)))

(assert (=> b!189795 (=> (not res!89741) (not e!124894))))

(declare-fun b!189796 () Bool)

(declare-fun res!89743 () Bool)

(declare-fun e!124892 () Bool)

(assert (=> b!189796 (=> (not res!89743) (not e!124892))))

(assert (=> b!189796 (= res!89743 call!19124)))

(assert (=> b!189796 (= e!124893 e!124892)))

(declare-fun b!189797 () Bool)

(declare-fun call!19123 () Bool)

(assert (=> b!189797 (= e!124894 (not call!19123))))

(declare-fun d!55811 () Bool)

(assert (=> d!55811 e!124891))

(assert (=> d!55811 (= c!34110 ((_ is MissingZero!656) lt!94022))))

(assert (=> d!55811 (= lt!94022 (seekEntryOrOpen!0 key!828 (_keys!5833 thiss!1248) (mask!9055 thiss!1248)))))

(declare-fun lt!94021 () Unit!5715)

(declare-fun choose!1023 (array!8061 array!8063 (_ BitVec 32) (_ BitVec 32) V!5545 V!5545 (_ BitVec 64) Int) Unit!5715)

(assert (=> d!55811 (= lt!94021 (choose!1023 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)))))

(assert (=> d!55811 (validMask!0 (mask!9055 thiss!1248))))

(assert (=> d!55811 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!160 (_keys!5833 thiss!1248) (_values!3849 thiss!1248) (mask!9055 thiss!1248) (extraKeys!3603 thiss!1248) (zeroValue!3707 thiss!1248) (minValue!3707 thiss!1248) key!828 (defaultEntry!3866 thiss!1248)) lt!94021)))

(declare-fun b!189798 () Bool)

(assert (=> b!189798 (and (bvsge (index!4794 lt!94022) #b00000000000000000000000000000000) (bvslt (index!4794 lt!94022) (size!4120 (_keys!5833 thiss!1248))))))

(declare-fun res!89740 () Bool)

(assert (=> b!189798 (= res!89740 (= (select (arr!3800 (_keys!5833 thiss!1248)) (index!4794 lt!94022)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189798 (=> (not res!89740) (not e!124894))))

(declare-fun b!189799 () Bool)

(assert (=> b!189799 (= e!124893 ((_ is Undefined!656) lt!94022))))

(declare-fun b!189800 () Bool)

(declare-fun res!89742 () Bool)

(assert (=> b!189800 (=> (not res!89742) (not e!124892))))

(assert (=> b!189800 (= res!89742 (= (select (arr!3800 (_keys!5833 thiss!1248)) (index!4797 lt!94022)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189800 (and (bvsge (index!4797 lt!94022) #b00000000000000000000000000000000) (bvslt (index!4797 lt!94022) (size!4120 (_keys!5833 thiss!1248))))))

(declare-fun bm!19121 () Bool)

(declare-fun arrayContainsKey!0 (array!8061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19121 (= call!19123 (arrayContainsKey!0 (_keys!5833 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!189801 () Bool)

(assert (=> b!189801 (= e!124892 (not call!19123))))

(assert (= (and d!55811 c!34110) b!189795))

(assert (= (and d!55811 (not c!34110)) b!189794))

(assert (= (and b!189795 res!89741) b!189798))

(assert (= (and b!189798 res!89740) b!189797))

(assert (= (and b!189794 c!34109) b!189796))

(assert (= (and b!189794 (not c!34109)) b!189799))

(assert (= (and b!189796 res!89743) b!189800))

(assert (= (and b!189800 res!89742) b!189801))

(assert (= (or b!189795 b!189796) bm!19120))

(assert (= (or b!189797 b!189801) bm!19121))

(declare-fun m!216269 () Bool)

(assert (=> b!189800 m!216269))

(declare-fun m!216271 () Bool)

(assert (=> bm!19121 m!216271))

(declare-fun m!216273 () Bool)

(assert (=> b!189798 m!216273))

(assert (=> d!55811 m!216051))

(declare-fun m!216275 () Bool)

(assert (=> d!55811 m!216275))

(assert (=> d!55811 m!216121))

(declare-fun m!216277 () Bool)

(assert (=> bm!19120 m!216277))

(assert (=> b!189581 d!55811))

(declare-fun d!55813 () Bool)

(declare-fun res!89750 () Bool)

(declare-fun e!124897 () Bool)

(assert (=> d!55813 (=> (not res!89750) (not e!124897))))

(declare-fun simpleValid!193 (LongMapFixedSize!2644) Bool)

(assert (=> d!55813 (= res!89750 (simpleValid!193 thiss!1248))))

(assert (=> d!55813 (= (valid!1112 thiss!1248) e!124897)))

(declare-fun b!189808 () Bool)

(declare-fun res!89751 () Bool)

(assert (=> b!189808 (=> (not res!89751) (not e!124897))))

(declare-fun arrayCountValidKeys!0 (array!8061 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!189808 (= res!89751 (= (arrayCountValidKeys!0 (_keys!5833 thiss!1248) #b00000000000000000000000000000000 (size!4120 (_keys!5833 thiss!1248))) (_size!1371 thiss!1248)))))

(declare-fun b!189809 () Bool)

(declare-fun res!89752 () Bool)

(assert (=> b!189809 (=> (not res!89752) (not e!124897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8061 (_ BitVec 32)) Bool)

(assert (=> b!189809 (= res!89752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5833 thiss!1248) (mask!9055 thiss!1248)))))

(declare-fun b!189810 () Bool)

(declare-datatypes ((List!2373 0))(
  ( (Nil!2370) (Cons!2369 (h!3006 (_ BitVec 64)) (t!7271 List!2373)) )
))
(declare-fun arrayNoDuplicates!0 (array!8061 (_ BitVec 32) List!2373) Bool)

(assert (=> b!189810 (= e!124897 (arrayNoDuplicates!0 (_keys!5833 thiss!1248) #b00000000000000000000000000000000 Nil!2370))))

(assert (= (and d!55813 res!89750) b!189808))

(assert (= (and b!189808 res!89751) b!189809))

(assert (= (and b!189809 res!89752) b!189810))

(declare-fun m!216279 () Bool)

(assert (=> d!55813 m!216279))

(declare-fun m!216281 () Bool)

(assert (=> b!189808 m!216281))

(declare-fun m!216283 () Bool)

(assert (=> b!189809 m!216283))

(declare-fun m!216285 () Bool)

(assert (=> b!189810 m!216285))

(assert (=> start!19264 d!55813))

(declare-fun condMapEmpty!7639 () Bool)

(declare-fun mapDefault!7639 () ValueCell!1868)

(assert (=> mapNonEmpty!7630 (= condMapEmpty!7639 (= mapRest!7630 ((as const (Array (_ BitVec 32) ValueCell!1868)) mapDefault!7639)))))

(declare-fun e!124903 () Bool)

(declare-fun mapRes!7639 () Bool)

(assert (=> mapNonEmpty!7630 (= tp!16786 (and e!124903 mapRes!7639))))

(declare-fun b!189817 () Bool)

(declare-fun e!124902 () Bool)

(assert (=> b!189817 (= e!124902 tp_is_empty!4423)))

(declare-fun mapIsEmpty!7639 () Bool)

(assert (=> mapIsEmpty!7639 mapRes!7639))

(declare-fun mapNonEmpty!7639 () Bool)

(declare-fun tp!16801 () Bool)

(assert (=> mapNonEmpty!7639 (= mapRes!7639 (and tp!16801 e!124902))))

(declare-fun mapRest!7639 () (Array (_ BitVec 32) ValueCell!1868))

(declare-fun mapKey!7639 () (_ BitVec 32))

(declare-fun mapValue!7639 () ValueCell!1868)

(assert (=> mapNonEmpty!7639 (= mapRest!7630 (store mapRest!7639 mapKey!7639 mapValue!7639))))

(declare-fun b!189818 () Bool)

(assert (=> b!189818 (= e!124903 tp_is_empty!4423)))

(assert (= (and mapNonEmpty!7630 condMapEmpty!7639) mapIsEmpty!7639))

(assert (= (and mapNonEmpty!7630 (not condMapEmpty!7639)) mapNonEmpty!7639))

(assert (= (and mapNonEmpty!7639 ((_ is ValueCellFull!1868) mapValue!7639)) b!189817))

(assert (= (and mapNonEmpty!7630 ((_ is ValueCellFull!1868) mapDefault!7639)) b!189818))

(declare-fun m!216287 () Bool)

(assert (=> mapNonEmpty!7639 m!216287))

(declare-fun b_lambda!7353 () Bool)

(assert (= b_lambda!7349 (or (and b!189588 b_free!4651) b_lambda!7353)))

(declare-fun b_lambda!7355 () Bool)

(assert (= b_lambda!7351 (or (and b!189588 b_free!4651) b_lambda!7355)))

(check-sat (not bm!19110) (not b!189728) (not b!189810) (not b!189776) (not b!189741) (not b!189731) (not d!55801) (not b_lambda!7353) (not b!189727) (not b_next!4651) (not bm!19109) (not bm!19115) (not bm!19108) (not bm!19107) (not d!55799) (not b!189771) (not d!55793) (not b!189750) (not b!189808) (not b_lambda!7355) tp_is_empty!4423 (not b!189670) (not b!189762) (not bm!19120) (not bm!19121) (not b!189718) (not b!189720) (not b!189729) (not b!189664) (not b!189809) (not b!189732) (not b!189752) (not b!189723) (not d!55811) (not d!55791) (not b!189746) (not bm!19114) (not b!189751) (not bm!19102) (not bm!19103) b_and!11311 (not mapNonEmpty!7639) (not d!55797) (not b!189754) (not b!189769) (not b!189755) (not d!55807) (not d!55795) (not b!189761) (not b!189743) (not d!55813))
(check-sat b_and!11311 (not b_next!4651))
