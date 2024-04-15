; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19292 () Bool)

(assert start!19292)

(declare-fun b!189653 () Bool)

(declare-fun b_free!4657 () Bool)

(declare-fun b_next!4657 () Bool)

(assert (=> b!189653 (= b_free!4657 (not b_next!4657))))

(declare-fun tp!16806 () Bool)

(declare-fun b_and!11273 () Bool)

(assert (=> b!189653 (= tp!16806 b_and!11273)))

(declare-fun mapNonEmpty!7642 () Bool)

(declare-fun mapRes!7642 () Bool)

(declare-fun tp!16807 () Bool)

(declare-fun e!124804 () Bool)

(assert (=> mapNonEmpty!7642 (= mapRes!7642 (and tp!16807 e!124804))))

(declare-fun mapKey!7642 () (_ BitVec 32))

(declare-datatypes ((V!5553 0))(
  ( (V!5554 (val!2259 Int)) )
))
(declare-datatypes ((ValueCell!1871 0))(
  ( (ValueCellFull!1871 (v!4177 V!5553)) (EmptyCell!1871) )
))
(declare-fun mapRest!7642 () (Array (_ BitVec 32) ValueCell!1871))

(declare-datatypes ((array!8069 0))(
  ( (array!8070 (arr!3802 (Array (_ BitVec 32) (_ BitVec 64))) (size!4123 (_ BitVec 32))) )
))
(declare-datatypes ((array!8071 0))(
  ( (array!8072 (arr!3803 (Array (_ BitVec 32) ValueCell!1871)) (size!4124 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2650 0))(
  ( (LongMapFixedSize!2651 (defaultEntry!3873 Int) (mask!9065 (_ BitVec 32)) (extraKeys!3610 (_ BitVec 32)) (zeroValue!3714 V!5553) (minValue!3714 V!5553) (_size!1374 (_ BitVec 32)) (_keys!5840 array!8069) (_values!3856 array!8071) (_vacant!1374 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2650)

(declare-fun mapValue!7642 () ValueCell!1871)

(assert (=> mapNonEmpty!7642 (= (arr!3803 (_values!3856 thiss!1248)) (store mapRest!7642 mapKey!7642 mapValue!7642))))

(declare-fun b!189645 () Bool)

(declare-fun e!124803 () Bool)

(declare-fun e!124799 () Bool)

(assert (=> b!189645 (= e!124803 e!124799)))

(declare-fun res!89647 () Bool)

(assert (=> b!189645 (=> (not res!89647) (not e!124799))))

(declare-datatypes ((SeekEntryResult!673 0))(
  ( (MissingZero!673 (index!4862 (_ BitVec 32))) (Found!673 (index!4863 (_ BitVec 32))) (Intermediate!673 (undefined!1485 Bool) (index!4864 (_ BitVec 32)) (x!20456 (_ BitVec 32))) (Undefined!673) (MissingVacant!673 (index!4865 (_ BitVec 32))) )
))
(declare-fun lt!93799 () SeekEntryResult!673)

(get-info :version)

(assert (=> b!189645 (= res!89647 (and (not ((_ is Undefined!673) lt!93799)) (not ((_ is MissingVacant!673) lt!93799)) (not ((_ is MissingZero!673) lt!93799)) ((_ is Found!673) lt!93799)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8069 (_ BitVec 32)) SeekEntryResult!673)

(assert (=> b!189645 (= lt!93799 (seekEntryOrOpen!0 key!828 (_keys!5840 thiss!1248) (mask!9065 thiss!1248)))))

(declare-fun b!189646 () Bool)

(declare-datatypes ((Unit!5690 0))(
  ( (Unit!5691) )
))
(declare-fun e!124805 () Unit!5690)

(declare-fun Unit!5692 () Unit!5690)

(assert (=> b!189646 (= e!124805 Unit!5692)))

(declare-fun lt!93795 () Unit!5690)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!163 (array!8069 array!8071 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 64) Int) Unit!5690)

(assert (=> b!189646 (= lt!93795 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!163 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)))))

(assert (=> b!189646 false))

(declare-fun b!189647 () Bool)

(declare-fun e!124797 () Bool)

(declare-fun e!124802 () Bool)

(assert (=> b!189647 (= e!124797 (and e!124802 mapRes!7642))))

(declare-fun condMapEmpty!7642 () Bool)

(declare-fun mapDefault!7642 () ValueCell!1871)

(assert (=> b!189647 (= condMapEmpty!7642 (= (arr!3803 (_values!3856 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1871)) mapDefault!7642)))))

(declare-fun res!89646 () Bool)

(assert (=> start!19292 (=> (not res!89646) (not e!124803))))

(declare-fun valid!1108 (LongMapFixedSize!2650) Bool)

(assert (=> start!19292 (= res!89646 (valid!1108 thiss!1248))))

(assert (=> start!19292 e!124803))

(declare-fun e!124800 () Bool)

(assert (=> start!19292 e!124800))

(assert (=> start!19292 true))

(declare-fun tp_is_empty!4429 () Bool)

(assert (=> start!19292 tp_is_empty!4429))

(declare-fun b!189648 () Bool)

(assert (=> b!189648 (= e!124802 tp_is_empty!4429)))

(declare-fun b!189649 () Bool)

(assert (=> b!189649 (= e!124804 tp_is_empty!4429)))

(declare-fun e!124801 () Bool)

(declare-fun b!189650 () Bool)

(assert (=> b!189650 (= e!124801 (= (select (arr!3802 (_keys!5840 thiss!1248)) (index!4863 lt!93799)) key!828))))

(declare-fun mapIsEmpty!7642 () Bool)

(assert (=> mapIsEmpty!7642 mapRes!7642))

(declare-fun b!189651 () Bool)

(declare-fun res!89645 () Bool)

(assert (=> b!189651 (=> (not res!89645) (not e!124803))))

(assert (=> b!189651 (= res!89645 (not (= key!828 (bvneg key!828))))))

(declare-fun b!189652 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!189652 (= e!124799 (not (validMask!0 (mask!9065 thiss!1248))))))

(declare-fun v!309 () V!5553)

(declare-datatypes ((tuple2!3470 0))(
  ( (tuple2!3471 (_1!1746 (_ BitVec 64)) (_2!1746 V!5553)) )
))
(declare-datatypes ((List!2394 0))(
  ( (Nil!2391) (Cons!2390 (h!3027 tuple2!3470) (t!7291 List!2394)) )
))
(declare-datatypes ((ListLongMap!2379 0))(
  ( (ListLongMap!2380 (toList!1205 List!2394)) )
))
(declare-fun lt!93798 () ListLongMap!2379)

(declare-fun +!297 (ListLongMap!2379 tuple2!3470) ListLongMap!2379)

(declare-fun getCurrentListMap!838 (array!8069 array!8071 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 32) Int) ListLongMap!2379)

(assert (=> b!189652 (= (+!297 lt!93798 (tuple2!3471 key!828 v!309)) (getCurrentListMap!838 (_keys!5840 thiss!1248) (array!8072 (store (arr!3803 (_values!3856 thiss!1248)) (index!4863 lt!93799) (ValueCellFull!1871 v!309)) (size!4124 (_values!3856 thiss!1248))) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93800 () Unit!5690)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!113 (array!8069 array!8071 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 32) (_ BitVec 64) V!5553 Int) Unit!5690)

(assert (=> b!189652 (= lt!93800 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!113 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) (index!4863 lt!93799) key!828 v!309 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93797 () Unit!5690)

(assert (=> b!189652 (= lt!93797 e!124805)))

(declare-fun c!34074 () Bool)

(declare-fun contains!1319 (ListLongMap!2379 (_ BitVec 64)) Bool)

(assert (=> b!189652 (= c!34074 (contains!1319 lt!93798 key!828))))

(assert (=> b!189652 (= lt!93798 (getCurrentListMap!838 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun array_inv!2465 (array!8069) Bool)

(declare-fun array_inv!2466 (array!8071) Bool)

(assert (=> b!189653 (= e!124800 (and tp!16806 tp_is_empty!4429 (array_inv!2465 (_keys!5840 thiss!1248)) (array_inv!2466 (_values!3856 thiss!1248)) e!124797))))

(declare-fun b!189654 () Bool)

(declare-fun lt!93796 () Unit!5690)

(assert (=> b!189654 (= e!124805 lt!93796)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!164 (array!8069 array!8071 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 64) Int) Unit!5690)

(assert (=> b!189654 (= lt!93796 (lemmaInListMapThenSeekEntryOrOpenFindsIt!164 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)))))

(declare-fun res!89648 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189654 (= res!89648 (inRange!0 (index!4863 lt!93799) (mask!9065 thiss!1248)))))

(assert (=> b!189654 (=> (not res!89648) (not e!124801))))

(assert (=> b!189654 e!124801))

(assert (= (and start!19292 res!89646) b!189651))

(assert (= (and b!189651 res!89645) b!189645))

(assert (= (and b!189645 res!89647) b!189652))

(assert (= (and b!189652 c!34074) b!189654))

(assert (= (and b!189652 (not c!34074)) b!189646))

(assert (= (and b!189654 res!89648) b!189650))

(assert (= (and b!189647 condMapEmpty!7642) mapIsEmpty!7642))

(assert (= (and b!189647 (not condMapEmpty!7642)) mapNonEmpty!7642))

(assert (= (and mapNonEmpty!7642 ((_ is ValueCellFull!1871) mapValue!7642)) b!189649))

(assert (= (and b!189647 ((_ is ValueCellFull!1871) mapDefault!7642)) b!189648))

(assert (= b!189653 b!189647))

(assert (= start!19292 b!189653))

(declare-fun m!215491 () Bool)

(assert (=> b!189652 m!215491))

(declare-fun m!215493 () Bool)

(assert (=> b!189652 m!215493))

(declare-fun m!215495 () Bool)

(assert (=> b!189652 m!215495))

(declare-fun m!215497 () Bool)

(assert (=> b!189652 m!215497))

(declare-fun m!215499 () Bool)

(assert (=> b!189652 m!215499))

(declare-fun m!215501 () Bool)

(assert (=> b!189652 m!215501))

(declare-fun m!215503 () Bool)

(assert (=> b!189652 m!215503))

(declare-fun m!215505 () Bool)

(assert (=> b!189654 m!215505))

(declare-fun m!215507 () Bool)

(assert (=> b!189654 m!215507))

(declare-fun m!215509 () Bool)

(assert (=> b!189653 m!215509))

(declare-fun m!215511 () Bool)

(assert (=> b!189653 m!215511))

(declare-fun m!215513 () Bool)

(assert (=> b!189646 m!215513))

(declare-fun m!215515 () Bool)

(assert (=> start!19292 m!215515))

(declare-fun m!215517 () Bool)

(assert (=> mapNonEmpty!7642 m!215517))

(declare-fun m!215519 () Bool)

(assert (=> b!189650 m!215519))

(declare-fun m!215521 () Bool)

(assert (=> b!189645 m!215521))

(check-sat tp_is_empty!4429 (not start!19292) (not b_next!4657) (not mapNonEmpty!7642) (not b!189652) (not b!189653) b_and!11273 (not b!189654) (not b!189646) (not b!189645))
(check-sat b_and!11273 (not b_next!4657))
(get-model)

(declare-fun b!189731 () Bool)

(declare-fun e!124869 () Bool)

(declare-fun call!19117 () Bool)

(assert (=> b!189731 (= e!124869 (not call!19117))))

(declare-fun b!189732 () Bool)

(declare-fun res!89681 () Bool)

(assert (=> b!189732 (=> (not res!89681) (not e!124869))))

(declare-fun lt!93842 () SeekEntryResult!673)

(assert (=> b!189732 (= res!89681 (= (select (arr!3802 (_keys!5840 thiss!1248)) (index!4865 lt!93842)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189732 (and (bvsge (index!4865 lt!93842) #b00000000000000000000000000000000) (bvslt (index!4865 lt!93842) (size!4123 (_keys!5840 thiss!1248))))))

(declare-fun b!189733 () Bool)

(declare-fun e!124868 () Bool)

(declare-fun e!124870 () Bool)

(assert (=> b!189733 (= e!124868 e!124870)))

(declare-fun res!89684 () Bool)

(declare-fun call!19118 () Bool)

(assert (=> b!189733 (= res!89684 call!19118)))

(assert (=> b!189733 (=> (not res!89684) (not e!124870))))

(declare-fun bm!19114 () Bool)

(declare-fun arrayContainsKey!0 (array!8069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!19114 (= call!19117 (arrayContainsKey!0 (_keys!5840 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!189734 () Bool)

(declare-fun e!124871 () Bool)

(assert (=> b!189734 (= e!124871 ((_ is Undefined!673) lt!93842))))

(declare-fun b!189735 () Bool)

(assert (=> b!189735 (and (bvsge (index!4862 lt!93842) #b00000000000000000000000000000000) (bvslt (index!4862 lt!93842) (size!4123 (_keys!5840 thiss!1248))))))

(declare-fun res!89683 () Bool)

(assert (=> b!189735 (= res!89683 (= (select (arr!3802 (_keys!5840 thiss!1248)) (index!4862 lt!93842)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!189735 (=> (not res!89683) (not e!124870))))

(declare-fun d!55595 () Bool)

(assert (=> d!55595 e!124868))

(declare-fun c!34086 () Bool)

(assert (=> d!55595 (= c!34086 ((_ is MissingZero!673) lt!93842))))

(assert (=> d!55595 (= lt!93842 (seekEntryOrOpen!0 key!828 (_keys!5840 thiss!1248) (mask!9065 thiss!1248)))))

(declare-fun lt!93841 () Unit!5690)

(declare-fun choose!1024 (array!8069 array!8071 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 64) Int) Unit!5690)

(assert (=> d!55595 (= lt!93841 (choose!1024 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)))))

(assert (=> d!55595 (validMask!0 (mask!9065 thiss!1248))))

(assert (=> d!55595 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!163 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)) lt!93841)))

(declare-fun b!189736 () Bool)

(assert (=> b!189736 (= e!124868 e!124871)))

(declare-fun c!34085 () Bool)

(assert (=> b!189736 (= c!34085 ((_ is MissingVacant!673) lt!93842))))

(declare-fun b!189737 () Bool)

(assert (=> b!189737 (= e!124870 (not call!19117))))

(declare-fun b!189738 () Bool)

(declare-fun res!89682 () Bool)

(assert (=> b!189738 (=> (not res!89682) (not e!124869))))

(assert (=> b!189738 (= res!89682 call!19118)))

(assert (=> b!189738 (= e!124871 e!124869)))

(declare-fun bm!19115 () Bool)

(assert (=> bm!19115 (= call!19118 (inRange!0 (ite c!34086 (index!4862 lt!93842) (index!4865 lt!93842)) (mask!9065 thiss!1248)))))

(assert (= (and d!55595 c!34086) b!189733))

(assert (= (and d!55595 (not c!34086)) b!189736))

(assert (= (and b!189733 res!89684) b!189735))

(assert (= (and b!189735 res!89683) b!189737))

(assert (= (and b!189736 c!34085) b!189738))

(assert (= (and b!189736 (not c!34085)) b!189734))

(assert (= (and b!189738 res!89682) b!189732))

(assert (= (and b!189732 res!89681) b!189731))

(assert (= (or b!189733 b!189738) bm!19115))

(assert (= (or b!189737 b!189731) bm!19114))

(assert (=> d!55595 m!215521))

(declare-fun m!215587 () Bool)

(assert (=> d!55595 m!215587))

(assert (=> d!55595 m!215497))

(declare-fun m!215589 () Bool)

(assert (=> b!189732 m!215589))

(declare-fun m!215591 () Bool)

(assert (=> b!189735 m!215591))

(declare-fun m!215593 () Bool)

(assert (=> bm!19115 m!215593))

(declare-fun m!215595 () Bool)

(assert (=> bm!19114 m!215595))

(assert (=> b!189646 d!55595))

(declare-fun e!124880 () SeekEntryResult!673)

(declare-fun b!189751 () Bool)

(declare-fun lt!93849 () SeekEntryResult!673)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8069 (_ BitVec 32)) SeekEntryResult!673)

(assert (=> b!189751 (= e!124880 (seekKeyOrZeroReturnVacant!0 (x!20456 lt!93849) (index!4864 lt!93849) (index!4864 lt!93849) key!828 (_keys!5840 thiss!1248) (mask!9065 thiss!1248)))))

(declare-fun b!189752 () Bool)

(assert (=> b!189752 (= e!124880 (MissingZero!673 (index!4864 lt!93849)))))

(declare-fun b!189753 () Bool)

(declare-fun c!34094 () Bool)

(declare-fun lt!93850 () (_ BitVec 64))

(assert (=> b!189753 (= c!34094 (= lt!93850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!124879 () SeekEntryResult!673)

(assert (=> b!189753 (= e!124879 e!124880)))

(declare-fun b!189754 () Bool)

(assert (=> b!189754 (= e!124879 (Found!673 (index!4864 lt!93849)))))

(declare-fun b!189755 () Bool)

(declare-fun e!124878 () SeekEntryResult!673)

(assert (=> b!189755 (= e!124878 e!124879)))

(assert (=> b!189755 (= lt!93850 (select (arr!3802 (_keys!5840 thiss!1248)) (index!4864 lt!93849)))))

(declare-fun c!34093 () Bool)

(assert (=> b!189755 (= c!34093 (= lt!93850 key!828))))

(declare-fun b!189756 () Bool)

(assert (=> b!189756 (= e!124878 Undefined!673)))

(declare-fun d!55597 () Bool)

(declare-fun lt!93851 () SeekEntryResult!673)

(assert (=> d!55597 (and (or ((_ is Undefined!673) lt!93851) (not ((_ is Found!673) lt!93851)) (and (bvsge (index!4863 lt!93851) #b00000000000000000000000000000000) (bvslt (index!4863 lt!93851) (size!4123 (_keys!5840 thiss!1248))))) (or ((_ is Undefined!673) lt!93851) ((_ is Found!673) lt!93851) (not ((_ is MissingZero!673) lt!93851)) (and (bvsge (index!4862 lt!93851) #b00000000000000000000000000000000) (bvslt (index!4862 lt!93851) (size!4123 (_keys!5840 thiss!1248))))) (or ((_ is Undefined!673) lt!93851) ((_ is Found!673) lt!93851) ((_ is MissingZero!673) lt!93851) (not ((_ is MissingVacant!673) lt!93851)) (and (bvsge (index!4865 lt!93851) #b00000000000000000000000000000000) (bvslt (index!4865 lt!93851) (size!4123 (_keys!5840 thiss!1248))))) (or ((_ is Undefined!673) lt!93851) (ite ((_ is Found!673) lt!93851) (= (select (arr!3802 (_keys!5840 thiss!1248)) (index!4863 lt!93851)) key!828) (ite ((_ is MissingZero!673) lt!93851) (= (select (arr!3802 (_keys!5840 thiss!1248)) (index!4862 lt!93851)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!673) lt!93851) (= (select (arr!3802 (_keys!5840 thiss!1248)) (index!4865 lt!93851)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55597 (= lt!93851 e!124878)))

(declare-fun c!34095 () Bool)

(assert (=> d!55597 (= c!34095 (and ((_ is Intermediate!673) lt!93849) (undefined!1485 lt!93849)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8069 (_ BitVec 32)) SeekEntryResult!673)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55597 (= lt!93849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9065 thiss!1248)) key!828 (_keys!5840 thiss!1248) (mask!9065 thiss!1248)))))

(assert (=> d!55597 (validMask!0 (mask!9065 thiss!1248))))

(assert (=> d!55597 (= (seekEntryOrOpen!0 key!828 (_keys!5840 thiss!1248) (mask!9065 thiss!1248)) lt!93851)))

(assert (= (and d!55597 c!34095) b!189756))

(assert (= (and d!55597 (not c!34095)) b!189755))

(assert (= (and b!189755 c!34093) b!189754))

(assert (= (and b!189755 (not c!34093)) b!189753))

(assert (= (and b!189753 c!34094) b!189752))

(assert (= (and b!189753 (not c!34094)) b!189751))

(declare-fun m!215597 () Bool)

(assert (=> b!189751 m!215597))

(declare-fun m!215599 () Bool)

(assert (=> b!189755 m!215599))

(assert (=> d!55597 m!215497))

(declare-fun m!215601 () Bool)

(assert (=> d!55597 m!215601))

(declare-fun m!215603 () Bool)

(assert (=> d!55597 m!215603))

(declare-fun m!215605 () Bool)

(assert (=> d!55597 m!215605))

(declare-fun m!215607 () Bool)

(assert (=> d!55597 m!215607))

(declare-fun m!215609 () Bool)

(assert (=> d!55597 m!215609))

(assert (=> d!55597 m!215607))

(assert (=> b!189645 d!55597))

(declare-fun d!55599 () Bool)

(declare-fun res!89691 () Bool)

(declare-fun e!124883 () Bool)

(assert (=> d!55599 (=> (not res!89691) (not e!124883))))

(declare-fun simpleValid!194 (LongMapFixedSize!2650) Bool)

(assert (=> d!55599 (= res!89691 (simpleValid!194 thiss!1248))))

(assert (=> d!55599 (= (valid!1108 thiss!1248) e!124883)))

(declare-fun b!189763 () Bool)

(declare-fun res!89692 () Bool)

(assert (=> b!189763 (=> (not res!89692) (not e!124883))))

(declare-fun arrayCountValidKeys!0 (array!8069 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!189763 (= res!89692 (= (arrayCountValidKeys!0 (_keys!5840 thiss!1248) #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))) (_size!1374 thiss!1248)))))

(declare-fun b!189764 () Bool)

(declare-fun res!89693 () Bool)

(assert (=> b!189764 (=> (not res!89693) (not e!124883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8069 (_ BitVec 32)) Bool)

(assert (=> b!189764 (= res!89693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5840 thiss!1248) (mask!9065 thiss!1248)))))

(declare-fun b!189765 () Bool)

(declare-datatypes ((List!2396 0))(
  ( (Nil!2393) (Cons!2392 (h!3029 (_ BitVec 64)) (t!7295 List!2396)) )
))
(declare-fun arrayNoDuplicates!0 (array!8069 (_ BitVec 32) List!2396) Bool)

(assert (=> b!189765 (= e!124883 (arrayNoDuplicates!0 (_keys!5840 thiss!1248) #b00000000000000000000000000000000 Nil!2393))))

(assert (= (and d!55599 res!89691) b!189763))

(assert (= (and b!189763 res!89692) b!189764))

(assert (= (and b!189764 res!89693) b!189765))

(declare-fun m!215611 () Bool)

(assert (=> d!55599 m!215611))

(declare-fun m!215613 () Bool)

(assert (=> b!189763 m!215613))

(declare-fun m!215615 () Bool)

(assert (=> b!189764 m!215615))

(declare-fun m!215617 () Bool)

(assert (=> b!189765 m!215617))

(assert (=> start!19292 d!55599))

(declare-fun d!55601 () Bool)

(declare-fun e!124886 () Bool)

(assert (=> d!55601 e!124886))

(declare-fun res!89698 () Bool)

(assert (=> d!55601 (=> (not res!89698) (not e!124886))))

(declare-fun lt!93857 () SeekEntryResult!673)

(assert (=> d!55601 (= res!89698 ((_ is Found!673) lt!93857))))

(assert (=> d!55601 (= lt!93857 (seekEntryOrOpen!0 key!828 (_keys!5840 thiss!1248) (mask!9065 thiss!1248)))))

(declare-fun lt!93856 () Unit!5690)

(declare-fun choose!1025 (array!8069 array!8071 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 64) Int) Unit!5690)

(assert (=> d!55601 (= lt!93856 (choose!1025 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)))))

(assert (=> d!55601 (validMask!0 (mask!9065 thiss!1248))))

(assert (=> d!55601 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!164 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) key!828 (defaultEntry!3873 thiss!1248)) lt!93856)))

(declare-fun b!189770 () Bool)

(declare-fun res!89699 () Bool)

(assert (=> b!189770 (=> (not res!89699) (not e!124886))))

(assert (=> b!189770 (= res!89699 (inRange!0 (index!4863 lt!93857) (mask!9065 thiss!1248)))))

(declare-fun b!189771 () Bool)

(assert (=> b!189771 (= e!124886 (= (select (arr!3802 (_keys!5840 thiss!1248)) (index!4863 lt!93857)) key!828))))

(assert (=> b!189771 (and (bvsge (index!4863 lt!93857) #b00000000000000000000000000000000) (bvslt (index!4863 lt!93857) (size!4123 (_keys!5840 thiss!1248))))))

(assert (= (and d!55601 res!89698) b!189770))

(assert (= (and b!189770 res!89699) b!189771))

(assert (=> d!55601 m!215521))

(declare-fun m!215619 () Bool)

(assert (=> d!55601 m!215619))

(assert (=> d!55601 m!215497))

(declare-fun m!215621 () Bool)

(assert (=> b!189770 m!215621))

(declare-fun m!215623 () Bool)

(assert (=> b!189771 m!215623))

(assert (=> b!189654 d!55601))

(declare-fun d!55603 () Bool)

(assert (=> d!55603 (= (inRange!0 (index!4863 lt!93799) (mask!9065 thiss!1248)) (and (bvsge (index!4863 lt!93799) #b00000000000000000000000000000000) (bvslt (index!4863 lt!93799) (bvadd (mask!9065 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!189654 d!55603))

(declare-fun d!55605 () Bool)

(assert (=> d!55605 (= (array_inv!2465 (_keys!5840 thiss!1248)) (bvsge (size!4123 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189653 d!55605))

(declare-fun d!55607 () Bool)

(assert (=> d!55607 (= (array_inv!2466 (_values!3856 thiss!1248)) (bvsge (size!4124 (_values!3856 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189653 d!55607))

(declare-fun d!55609 () Bool)

(assert (=> d!55609 (= (validMask!0 (mask!9065 thiss!1248)) (and (or (= (mask!9065 thiss!1248) #b00000000000000000000000000000111) (= (mask!9065 thiss!1248) #b00000000000000000000000000001111) (= (mask!9065 thiss!1248) #b00000000000000000000000000011111) (= (mask!9065 thiss!1248) #b00000000000000000000000000111111) (= (mask!9065 thiss!1248) #b00000000000000000000000001111111) (= (mask!9065 thiss!1248) #b00000000000000000000000011111111) (= (mask!9065 thiss!1248) #b00000000000000000000000111111111) (= (mask!9065 thiss!1248) #b00000000000000000000001111111111) (= (mask!9065 thiss!1248) #b00000000000000000000011111111111) (= (mask!9065 thiss!1248) #b00000000000000000000111111111111) (= (mask!9065 thiss!1248) #b00000000000000000001111111111111) (= (mask!9065 thiss!1248) #b00000000000000000011111111111111) (= (mask!9065 thiss!1248) #b00000000000000000111111111111111) (= (mask!9065 thiss!1248) #b00000000000000001111111111111111) (= (mask!9065 thiss!1248) #b00000000000000011111111111111111) (= (mask!9065 thiss!1248) #b00000000000000111111111111111111) (= (mask!9065 thiss!1248) #b00000000000001111111111111111111) (= (mask!9065 thiss!1248) #b00000000000011111111111111111111) (= (mask!9065 thiss!1248) #b00000000000111111111111111111111) (= (mask!9065 thiss!1248) #b00000000001111111111111111111111) (= (mask!9065 thiss!1248) #b00000000011111111111111111111111) (= (mask!9065 thiss!1248) #b00000000111111111111111111111111) (= (mask!9065 thiss!1248) #b00000001111111111111111111111111) (= (mask!9065 thiss!1248) #b00000011111111111111111111111111) (= (mask!9065 thiss!1248) #b00000111111111111111111111111111) (= (mask!9065 thiss!1248) #b00001111111111111111111111111111) (= (mask!9065 thiss!1248) #b00011111111111111111111111111111) (= (mask!9065 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9065 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!189652 d!55609))

(declare-fun bm!19130 () Bool)

(declare-fun call!19139 () ListLongMap!2379)

(declare-fun getCurrentListMapNoExtraKeys!199 (array!8069 array!8071 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 32) Int) ListLongMap!2379)

(assert (=> bm!19130 (= call!19139 (getCurrentListMapNoExtraKeys!199 (_keys!5840 thiss!1248) (array!8072 (store (arr!3803 (_values!3856 thiss!1248)) (index!4863 lt!93799) (ValueCellFull!1871 v!309)) (size!4124 (_values!3856 thiss!1248))) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun b!189814 () Bool)

(declare-fun e!124921 () Bool)

(declare-fun e!124915 () Bool)

(assert (=> b!189814 (= e!124921 e!124915)))

(declare-fun c!34108 () Bool)

(assert (=> b!189814 (= c!34108 (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189815 () Bool)

(declare-fun e!124922 () ListLongMap!2379)

(declare-fun call!19134 () ListLongMap!2379)

(assert (=> b!189815 (= e!124922 call!19134)))

(declare-fun b!189816 () Bool)

(declare-fun e!124925 () Bool)

(declare-fun lt!93913 () ListLongMap!2379)

(declare-fun apply!178 (ListLongMap!2379 (_ BitVec 64)) V!5553)

(assert (=> b!189816 (= e!124925 (= (apply!178 lt!93913 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3714 thiss!1248)))))

(declare-fun b!189817 () Bool)

(declare-fun e!124924 () ListLongMap!2379)

(declare-fun call!19133 () ListLongMap!2379)

(assert (=> b!189817 (= e!124924 call!19133)))

(declare-fun bm!19132 () Bool)

(declare-fun call!19136 () ListLongMap!2379)

(assert (=> bm!19132 (= call!19136 call!19139)))

(declare-fun e!124920 () Bool)

(declare-fun b!189818 () Bool)

(declare-fun get!2189 (ValueCell!1871 V!5553) V!5553)

(declare-fun dynLambda!512 (Int (_ BitVec 64)) V!5553)

(assert (=> b!189818 (= e!124920 (= (apply!178 lt!93913 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000)) (get!2189 (select (arr!3803 (array!8072 (store (arr!3803 (_values!3856 thiss!1248)) (index!4863 lt!93799) (ValueCellFull!1871 v!309)) (size!4124 (_values!3856 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3873 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189818 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4124 (array!8072 (store (arr!3803 (_values!3856 thiss!1248)) (index!4863 lt!93799) (ValueCellFull!1871 v!309)) (size!4124 (_values!3856 thiss!1248))))))))

(assert (=> b!189818 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))))))

(declare-fun b!189819 () Bool)

(declare-fun e!124918 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!189819 (= e!124918 (validKeyInArray!0 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19133 () Bool)

(declare-fun call!19138 () ListLongMap!2379)

(assert (=> bm!19133 (= call!19133 call!19138)))

(declare-fun bm!19134 () Bool)

(assert (=> bm!19134 (= call!19134 call!19136)))

(declare-fun b!189820 () Bool)

(declare-fun e!124917 () Unit!5690)

(declare-fun Unit!5696 () Unit!5690)

(assert (=> b!189820 (= e!124917 Unit!5696)))

(declare-fun b!189821 () Bool)

(declare-fun call!19135 () Bool)

(assert (=> b!189821 (= e!124915 (not call!19135))))

(declare-fun b!189822 () Bool)

(declare-fun e!124913 () Bool)

(assert (=> b!189822 (= e!124913 (validKeyInArray!0 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189823 () Bool)

(declare-fun e!124916 () Bool)

(assert (=> b!189823 (= e!124916 (= (apply!178 lt!93913 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3714 thiss!1248)))))

(declare-fun b!189824 () Bool)

(declare-fun lt!93908 () Unit!5690)

(assert (=> b!189824 (= e!124917 lt!93908)))

(declare-fun lt!93907 () ListLongMap!2379)

(assert (=> b!189824 (= lt!93907 (getCurrentListMapNoExtraKeys!199 (_keys!5840 thiss!1248) (array!8072 (store (arr!3803 (_values!3856 thiss!1248)) (index!4863 lt!93799) (ValueCellFull!1871 v!309)) (size!4124 (_values!3856 thiss!1248))) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93916 () (_ BitVec 64))

(assert (=> b!189824 (= lt!93916 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93911 () (_ BitVec 64))

(assert (=> b!189824 (= lt!93911 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93909 () Unit!5690)

(declare-fun addStillContains!154 (ListLongMap!2379 (_ BitVec 64) V!5553 (_ BitVec 64)) Unit!5690)

(assert (=> b!189824 (= lt!93909 (addStillContains!154 lt!93907 lt!93916 (zeroValue!3714 thiss!1248) lt!93911))))

(assert (=> b!189824 (contains!1319 (+!297 lt!93907 (tuple2!3471 lt!93916 (zeroValue!3714 thiss!1248))) lt!93911)))

(declare-fun lt!93912 () Unit!5690)

(assert (=> b!189824 (= lt!93912 lt!93909)))

(declare-fun lt!93919 () ListLongMap!2379)

(assert (=> b!189824 (= lt!93919 (getCurrentListMapNoExtraKeys!199 (_keys!5840 thiss!1248) (array!8072 (store (arr!3803 (_values!3856 thiss!1248)) (index!4863 lt!93799) (ValueCellFull!1871 v!309)) (size!4124 (_values!3856 thiss!1248))) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93904 () (_ BitVec 64))

(assert (=> b!189824 (= lt!93904 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93906 () (_ BitVec 64))

(assert (=> b!189824 (= lt!93906 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93902 () Unit!5690)

(declare-fun addApplyDifferent!154 (ListLongMap!2379 (_ BitVec 64) V!5553 (_ BitVec 64)) Unit!5690)

(assert (=> b!189824 (= lt!93902 (addApplyDifferent!154 lt!93919 lt!93904 (minValue!3714 thiss!1248) lt!93906))))

(assert (=> b!189824 (= (apply!178 (+!297 lt!93919 (tuple2!3471 lt!93904 (minValue!3714 thiss!1248))) lt!93906) (apply!178 lt!93919 lt!93906))))

(declare-fun lt!93905 () Unit!5690)

(assert (=> b!189824 (= lt!93905 lt!93902)))

(declare-fun lt!93921 () ListLongMap!2379)

(assert (=> b!189824 (= lt!93921 (getCurrentListMapNoExtraKeys!199 (_keys!5840 thiss!1248) (array!8072 (store (arr!3803 (_values!3856 thiss!1248)) (index!4863 lt!93799) (ValueCellFull!1871 v!309)) (size!4124 (_values!3856 thiss!1248))) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93923 () (_ BitVec 64))

(assert (=> b!189824 (= lt!93923 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93917 () (_ BitVec 64))

(assert (=> b!189824 (= lt!93917 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93918 () Unit!5690)

(assert (=> b!189824 (= lt!93918 (addApplyDifferent!154 lt!93921 lt!93923 (zeroValue!3714 thiss!1248) lt!93917))))

(assert (=> b!189824 (= (apply!178 (+!297 lt!93921 (tuple2!3471 lt!93923 (zeroValue!3714 thiss!1248))) lt!93917) (apply!178 lt!93921 lt!93917))))

(declare-fun lt!93910 () Unit!5690)

(assert (=> b!189824 (= lt!93910 lt!93918)))

(declare-fun lt!93920 () ListLongMap!2379)

(assert (=> b!189824 (= lt!93920 (getCurrentListMapNoExtraKeys!199 (_keys!5840 thiss!1248) (array!8072 (store (arr!3803 (_values!3856 thiss!1248)) (index!4863 lt!93799) (ValueCellFull!1871 v!309)) (size!4124 (_values!3856 thiss!1248))) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93903 () (_ BitVec 64))

(assert (=> b!189824 (= lt!93903 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93915 () (_ BitVec 64))

(assert (=> b!189824 (= lt!93915 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189824 (= lt!93908 (addApplyDifferent!154 lt!93920 lt!93903 (minValue!3714 thiss!1248) lt!93915))))

(assert (=> b!189824 (= (apply!178 (+!297 lt!93920 (tuple2!3471 lt!93903 (minValue!3714 thiss!1248))) lt!93915) (apply!178 lt!93920 lt!93915))))

(declare-fun bm!19131 () Bool)

(declare-fun call!19137 () Bool)

(assert (=> bm!19131 (= call!19137 (contains!1319 lt!93913 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55611 () Bool)

(assert (=> d!55611 e!124921))

(declare-fun res!89721 () Bool)

(assert (=> d!55611 (=> (not res!89721) (not e!124921))))

(assert (=> d!55611 (= res!89721 (or (bvsge #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))))))))

(declare-fun lt!93914 () ListLongMap!2379)

(assert (=> d!55611 (= lt!93913 lt!93914)))

(declare-fun lt!93922 () Unit!5690)

(assert (=> d!55611 (= lt!93922 e!124917)))

(declare-fun c!34111 () Bool)

(assert (=> d!55611 (= c!34111 e!124913)))

(declare-fun res!89720 () Bool)

(assert (=> d!55611 (=> (not res!89720) (not e!124913))))

(assert (=> d!55611 (= res!89720 (bvslt #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))))))

(declare-fun e!124914 () ListLongMap!2379)

(assert (=> d!55611 (= lt!93914 e!124914)))

(declare-fun c!34109 () Bool)

(assert (=> d!55611 (= c!34109 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55611 (validMask!0 (mask!9065 thiss!1248))))

(assert (=> d!55611 (= (getCurrentListMap!838 (_keys!5840 thiss!1248) (array!8072 (store (arr!3803 (_values!3856 thiss!1248)) (index!4863 lt!93799) (ValueCellFull!1871 v!309)) (size!4124 (_values!3856 thiss!1248))) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)) lt!93913)))

(declare-fun b!189825 () Bool)

(assert (=> b!189825 (= e!124915 e!124925)))

(declare-fun res!89722 () Bool)

(assert (=> b!189825 (= res!89722 call!19135)))

(assert (=> b!189825 (=> (not res!89722) (not e!124925))))

(declare-fun b!189826 () Bool)

(assert (=> b!189826 (= e!124914 e!124924)))

(declare-fun c!34113 () Bool)

(assert (=> b!189826 (= c!34113 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189827 () Bool)

(declare-fun e!124919 () Bool)

(assert (=> b!189827 (= e!124919 e!124920)))

(declare-fun res!89718 () Bool)

(assert (=> b!189827 (=> (not res!89718) (not e!124920))))

(assert (=> b!189827 (= res!89718 (contains!1319 lt!93913 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))))))

(declare-fun b!189828 () Bool)

(assert (=> b!189828 (= e!124922 call!19133)))

(declare-fun b!189829 () Bool)

(declare-fun c!34110 () Bool)

(assert (=> b!189829 (= c!34110 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189829 (= e!124924 e!124922)))

(declare-fun b!189830 () Bool)

(declare-fun res!89723 () Bool)

(assert (=> b!189830 (=> (not res!89723) (not e!124921))))

(assert (=> b!189830 (= res!89723 e!124919)))

(declare-fun res!89724 () Bool)

(assert (=> b!189830 (=> res!89724 e!124919)))

(assert (=> b!189830 (= res!89724 (not e!124918))))

(declare-fun res!89719 () Bool)

(assert (=> b!189830 (=> (not res!89719) (not e!124918))))

(assert (=> b!189830 (= res!89719 (bvslt #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))))))

(declare-fun b!189831 () Bool)

(declare-fun res!89726 () Bool)

(assert (=> b!189831 (=> (not res!89726) (not e!124921))))

(declare-fun e!124923 () Bool)

(assert (=> b!189831 (= res!89726 e!124923)))

(declare-fun c!34112 () Bool)

(assert (=> b!189831 (= c!34112 (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!189832 () Bool)

(assert (=> b!189832 (= e!124923 (not call!19137))))

(declare-fun bm!19135 () Bool)

(assert (=> bm!19135 (= call!19135 (contains!1319 lt!93913 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189833 () Bool)

(assert (=> b!189833 (= e!124923 e!124916)))

(declare-fun res!89725 () Bool)

(assert (=> b!189833 (= res!89725 call!19137)))

(assert (=> b!189833 (=> (not res!89725) (not e!124916))))

(declare-fun b!189834 () Bool)

(assert (=> b!189834 (= e!124914 (+!297 call!19138 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3714 thiss!1248))))))

(declare-fun bm!19136 () Bool)

(assert (=> bm!19136 (= call!19138 (+!297 (ite c!34109 call!19139 (ite c!34113 call!19136 call!19134)) (ite (or c!34109 c!34113) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3714 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3714 thiss!1248)))))))

(assert (= (and d!55611 c!34109) b!189834))

(assert (= (and d!55611 (not c!34109)) b!189826))

(assert (= (and b!189826 c!34113) b!189817))

(assert (= (and b!189826 (not c!34113)) b!189829))

(assert (= (and b!189829 c!34110) b!189828))

(assert (= (and b!189829 (not c!34110)) b!189815))

(assert (= (or b!189828 b!189815) bm!19134))

(assert (= (or b!189817 bm!19134) bm!19132))

(assert (= (or b!189817 b!189828) bm!19133))

(assert (= (or b!189834 bm!19132) bm!19130))

(assert (= (or b!189834 bm!19133) bm!19136))

(assert (= (and d!55611 res!89720) b!189822))

(assert (= (and d!55611 c!34111) b!189824))

(assert (= (and d!55611 (not c!34111)) b!189820))

(assert (= (and d!55611 res!89721) b!189830))

(assert (= (and b!189830 res!89719) b!189819))

(assert (= (and b!189830 (not res!89724)) b!189827))

(assert (= (and b!189827 res!89718) b!189818))

(assert (= (and b!189830 res!89723) b!189831))

(assert (= (and b!189831 c!34112) b!189833))

(assert (= (and b!189831 (not c!34112)) b!189832))

(assert (= (and b!189833 res!89725) b!189823))

(assert (= (or b!189833 b!189832) bm!19131))

(assert (= (and b!189831 res!89726) b!189814))

(assert (= (and b!189814 c!34108) b!189825))

(assert (= (and b!189814 (not c!34108)) b!189821))

(assert (= (and b!189825 res!89722) b!189816))

(assert (= (or b!189825 b!189821) bm!19135))

(declare-fun b_lambda!7317 () Bool)

(assert (=> (not b_lambda!7317) (not b!189818)))

(declare-fun t!7294 () Bool)

(declare-fun tb!2859 () Bool)

(assert (=> (and b!189653 (= (defaultEntry!3873 thiss!1248) (defaultEntry!3873 thiss!1248)) t!7294) tb!2859))

(declare-fun result!4871 () Bool)

(assert (=> tb!2859 (= result!4871 tp_is_empty!4429)))

(assert (=> b!189818 t!7294))

(declare-fun b_and!11279 () Bool)

(assert (= b_and!11273 (and (=> t!7294 result!4871) b_and!11279)))

(declare-fun m!215625 () Bool)

(assert (=> b!189819 m!215625))

(assert (=> b!189819 m!215625))

(declare-fun m!215627 () Bool)

(assert (=> b!189819 m!215627))

(declare-fun m!215629 () Bool)

(assert (=> b!189818 m!215629))

(declare-fun m!215631 () Bool)

(assert (=> b!189818 m!215631))

(declare-fun m!215633 () Bool)

(assert (=> b!189818 m!215633))

(assert (=> b!189818 m!215625))

(assert (=> b!189818 m!215625))

(declare-fun m!215635 () Bool)

(assert (=> b!189818 m!215635))

(assert (=> b!189818 m!215631))

(assert (=> b!189818 m!215629))

(declare-fun m!215637 () Bool)

(assert (=> bm!19130 m!215637))

(assert (=> b!189827 m!215625))

(assert (=> b!189827 m!215625))

(declare-fun m!215639 () Bool)

(assert (=> b!189827 m!215639))

(declare-fun m!215641 () Bool)

(assert (=> b!189824 m!215641))

(assert (=> b!189824 m!215625))

(assert (=> b!189824 m!215637))

(declare-fun m!215643 () Bool)

(assert (=> b!189824 m!215643))

(declare-fun m!215645 () Bool)

(assert (=> b!189824 m!215645))

(assert (=> b!189824 m!215643))

(declare-fun m!215647 () Bool)

(assert (=> b!189824 m!215647))

(declare-fun m!215649 () Bool)

(assert (=> b!189824 m!215649))

(declare-fun m!215651 () Bool)

(assert (=> b!189824 m!215651))

(declare-fun m!215653 () Bool)

(assert (=> b!189824 m!215653))

(declare-fun m!215655 () Bool)

(assert (=> b!189824 m!215655))

(declare-fun m!215657 () Bool)

(assert (=> b!189824 m!215657))

(assert (=> b!189824 m!215645))

(declare-fun m!215659 () Bool)

(assert (=> b!189824 m!215659))

(declare-fun m!215661 () Bool)

(assert (=> b!189824 m!215661))

(declare-fun m!215663 () Bool)

(assert (=> b!189824 m!215663))

(assert (=> b!189824 m!215653))

(declare-fun m!215665 () Bool)

(assert (=> b!189824 m!215665))

(assert (=> b!189824 m!215651))

(declare-fun m!215667 () Bool)

(assert (=> b!189824 m!215667))

(declare-fun m!215669 () Bool)

(assert (=> b!189824 m!215669))

(assert (=> d!55611 m!215497))

(declare-fun m!215671 () Bool)

(assert (=> b!189816 m!215671))

(declare-fun m!215673 () Bool)

(assert (=> bm!19131 m!215673))

(assert (=> b!189822 m!215625))

(assert (=> b!189822 m!215625))

(assert (=> b!189822 m!215627))

(declare-fun m!215675 () Bool)

(assert (=> b!189834 m!215675))

(declare-fun m!215677 () Bool)

(assert (=> bm!19136 m!215677))

(declare-fun m!215679 () Bool)

(assert (=> bm!19135 m!215679))

(declare-fun m!215681 () Bool)

(assert (=> b!189823 m!215681))

(assert (=> b!189652 d!55611))

(declare-fun d!55613 () Bool)

(declare-fun e!124928 () Bool)

(assert (=> d!55613 e!124928))

(declare-fun res!89729 () Bool)

(assert (=> d!55613 (=> (not res!89729) (not e!124928))))

(assert (=> d!55613 (= res!89729 (and (bvsge (index!4863 lt!93799) #b00000000000000000000000000000000) (bvslt (index!4863 lt!93799) (size!4124 (_values!3856 thiss!1248)))))))

(declare-fun lt!93926 () Unit!5690)

(declare-fun choose!1026 (array!8069 array!8071 (_ BitVec 32) (_ BitVec 32) V!5553 V!5553 (_ BitVec 32) (_ BitVec 64) V!5553 Int) Unit!5690)

(assert (=> d!55613 (= lt!93926 (choose!1026 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) (index!4863 lt!93799) key!828 v!309 (defaultEntry!3873 thiss!1248)))))

(assert (=> d!55613 (validMask!0 (mask!9065 thiss!1248))))

(assert (=> d!55613 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!113 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) (index!4863 lt!93799) key!828 v!309 (defaultEntry!3873 thiss!1248)) lt!93926)))

(declare-fun b!189839 () Bool)

(assert (=> b!189839 (= e!124928 (= (+!297 (getCurrentListMap!838 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)) (tuple2!3471 key!828 v!309)) (getCurrentListMap!838 (_keys!5840 thiss!1248) (array!8072 (store (arr!3803 (_values!3856 thiss!1248)) (index!4863 lt!93799) (ValueCellFull!1871 v!309)) (size!4124 (_values!3856 thiss!1248))) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248))))))

(assert (= (and d!55613 res!89729) b!189839))

(declare-fun m!215683 () Bool)

(assert (=> d!55613 m!215683))

(assert (=> d!55613 m!215497))

(assert (=> b!189839 m!215501))

(assert (=> b!189839 m!215501))

(declare-fun m!215685 () Bool)

(assert (=> b!189839 m!215685))

(assert (=> b!189839 m!215493))

(assert (=> b!189839 m!215503))

(assert (=> b!189652 d!55613))

(declare-fun bm!19137 () Bool)

(declare-fun call!19146 () ListLongMap!2379)

(assert (=> bm!19137 (= call!19146 (getCurrentListMapNoExtraKeys!199 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun b!189840 () Bool)

(declare-fun e!124937 () Bool)

(declare-fun e!124931 () Bool)

(assert (=> b!189840 (= e!124937 e!124931)))

(declare-fun c!34114 () Bool)

(assert (=> b!189840 (= c!34114 (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189841 () Bool)

(declare-fun e!124938 () ListLongMap!2379)

(declare-fun call!19141 () ListLongMap!2379)

(assert (=> b!189841 (= e!124938 call!19141)))

(declare-fun b!189842 () Bool)

(declare-fun e!124941 () Bool)

(declare-fun lt!93938 () ListLongMap!2379)

(assert (=> b!189842 (= e!124941 (= (apply!178 lt!93938 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3714 thiss!1248)))))

(declare-fun b!189843 () Bool)

(declare-fun e!124940 () ListLongMap!2379)

(declare-fun call!19140 () ListLongMap!2379)

(assert (=> b!189843 (= e!124940 call!19140)))

(declare-fun bm!19139 () Bool)

(declare-fun call!19143 () ListLongMap!2379)

(assert (=> bm!19139 (= call!19143 call!19146)))

(declare-fun b!189844 () Bool)

(declare-fun e!124936 () Bool)

(assert (=> b!189844 (= e!124936 (= (apply!178 lt!93938 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000)) (get!2189 (select (arr!3803 (_values!3856 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!512 (defaultEntry!3873 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!189844 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4124 (_values!3856 thiss!1248))))))

(assert (=> b!189844 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))))))

(declare-fun b!189845 () Bool)

(declare-fun e!124934 () Bool)

(assert (=> b!189845 (= e!124934 (validKeyInArray!0 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19140 () Bool)

(declare-fun call!19145 () ListLongMap!2379)

(assert (=> bm!19140 (= call!19140 call!19145)))

(declare-fun bm!19141 () Bool)

(assert (=> bm!19141 (= call!19141 call!19143)))

(declare-fun b!189846 () Bool)

(declare-fun e!124933 () Unit!5690)

(declare-fun Unit!5697 () Unit!5690)

(assert (=> b!189846 (= e!124933 Unit!5697)))

(declare-fun b!189847 () Bool)

(declare-fun call!19142 () Bool)

(assert (=> b!189847 (= e!124931 (not call!19142))))

(declare-fun b!189848 () Bool)

(declare-fun e!124929 () Bool)

(assert (=> b!189848 (= e!124929 (validKeyInArray!0 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!189849 () Bool)

(declare-fun e!124932 () Bool)

(assert (=> b!189849 (= e!124932 (= (apply!178 lt!93938 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3714 thiss!1248)))))

(declare-fun b!189850 () Bool)

(declare-fun lt!93933 () Unit!5690)

(assert (=> b!189850 (= e!124933 lt!93933)))

(declare-fun lt!93932 () ListLongMap!2379)

(assert (=> b!189850 (= lt!93932 (getCurrentListMapNoExtraKeys!199 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93941 () (_ BitVec 64))

(assert (=> b!189850 (= lt!93941 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93936 () (_ BitVec 64))

(assert (=> b!189850 (= lt!93936 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93934 () Unit!5690)

(assert (=> b!189850 (= lt!93934 (addStillContains!154 lt!93932 lt!93941 (zeroValue!3714 thiss!1248) lt!93936))))

(assert (=> b!189850 (contains!1319 (+!297 lt!93932 (tuple2!3471 lt!93941 (zeroValue!3714 thiss!1248))) lt!93936)))

(declare-fun lt!93937 () Unit!5690)

(assert (=> b!189850 (= lt!93937 lt!93934)))

(declare-fun lt!93944 () ListLongMap!2379)

(assert (=> b!189850 (= lt!93944 (getCurrentListMapNoExtraKeys!199 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93929 () (_ BitVec 64))

(assert (=> b!189850 (= lt!93929 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93931 () (_ BitVec 64))

(assert (=> b!189850 (= lt!93931 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93927 () Unit!5690)

(assert (=> b!189850 (= lt!93927 (addApplyDifferent!154 lt!93944 lt!93929 (minValue!3714 thiss!1248) lt!93931))))

(assert (=> b!189850 (= (apply!178 (+!297 lt!93944 (tuple2!3471 lt!93929 (minValue!3714 thiss!1248))) lt!93931) (apply!178 lt!93944 lt!93931))))

(declare-fun lt!93930 () Unit!5690)

(assert (=> b!189850 (= lt!93930 lt!93927)))

(declare-fun lt!93946 () ListLongMap!2379)

(assert (=> b!189850 (= lt!93946 (getCurrentListMapNoExtraKeys!199 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93948 () (_ BitVec 64))

(assert (=> b!189850 (= lt!93948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93942 () (_ BitVec 64))

(assert (=> b!189850 (= lt!93942 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!93943 () Unit!5690)

(assert (=> b!189850 (= lt!93943 (addApplyDifferent!154 lt!93946 lt!93948 (zeroValue!3714 thiss!1248) lt!93942))))

(assert (=> b!189850 (= (apply!178 (+!297 lt!93946 (tuple2!3471 lt!93948 (zeroValue!3714 thiss!1248))) lt!93942) (apply!178 lt!93946 lt!93942))))

(declare-fun lt!93935 () Unit!5690)

(assert (=> b!189850 (= lt!93935 lt!93943)))

(declare-fun lt!93945 () ListLongMap!2379)

(assert (=> b!189850 (= lt!93945 (getCurrentListMapNoExtraKeys!199 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)))))

(declare-fun lt!93928 () (_ BitVec 64))

(assert (=> b!189850 (= lt!93928 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!93940 () (_ BitVec 64))

(assert (=> b!189850 (= lt!93940 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!189850 (= lt!93933 (addApplyDifferent!154 lt!93945 lt!93928 (minValue!3714 thiss!1248) lt!93940))))

(assert (=> b!189850 (= (apply!178 (+!297 lt!93945 (tuple2!3471 lt!93928 (minValue!3714 thiss!1248))) lt!93940) (apply!178 lt!93945 lt!93940))))

(declare-fun bm!19138 () Bool)

(declare-fun call!19144 () Bool)

(assert (=> bm!19138 (= call!19144 (contains!1319 lt!93938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!55615 () Bool)

(assert (=> d!55615 e!124937))

(declare-fun res!89733 () Bool)

(assert (=> d!55615 (=> (not res!89733) (not e!124937))))

(assert (=> d!55615 (= res!89733 (or (bvsge #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))))))))

(declare-fun lt!93939 () ListLongMap!2379)

(assert (=> d!55615 (= lt!93938 lt!93939)))

(declare-fun lt!93947 () Unit!5690)

(assert (=> d!55615 (= lt!93947 e!124933)))

(declare-fun c!34117 () Bool)

(assert (=> d!55615 (= c!34117 e!124929)))

(declare-fun res!89732 () Bool)

(assert (=> d!55615 (=> (not res!89732) (not e!124929))))

(assert (=> d!55615 (= res!89732 (bvslt #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))))))

(declare-fun e!124930 () ListLongMap!2379)

(assert (=> d!55615 (= lt!93939 e!124930)))

(declare-fun c!34115 () Bool)

(assert (=> d!55615 (= c!34115 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55615 (validMask!0 (mask!9065 thiss!1248))))

(assert (=> d!55615 (= (getCurrentListMap!838 (_keys!5840 thiss!1248) (_values!3856 thiss!1248) (mask!9065 thiss!1248) (extraKeys!3610 thiss!1248) (zeroValue!3714 thiss!1248) (minValue!3714 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3873 thiss!1248)) lt!93938)))

(declare-fun b!189851 () Bool)

(assert (=> b!189851 (= e!124931 e!124941)))

(declare-fun res!89734 () Bool)

(assert (=> b!189851 (= res!89734 call!19142)))

(assert (=> b!189851 (=> (not res!89734) (not e!124941))))

(declare-fun b!189852 () Bool)

(assert (=> b!189852 (= e!124930 e!124940)))

(declare-fun c!34119 () Bool)

(assert (=> b!189852 (= c!34119 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!189853 () Bool)

(declare-fun e!124935 () Bool)

(assert (=> b!189853 (= e!124935 e!124936)))

(declare-fun res!89730 () Bool)

(assert (=> b!189853 (=> (not res!89730) (not e!124936))))

(assert (=> b!189853 (= res!89730 (contains!1319 lt!93938 (select (arr!3802 (_keys!5840 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!189853 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))))))

(declare-fun b!189854 () Bool)

(assert (=> b!189854 (= e!124938 call!19140)))

(declare-fun b!189855 () Bool)

(declare-fun c!34116 () Bool)

(assert (=> b!189855 (= c!34116 (and (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!189855 (= e!124940 e!124938)))

(declare-fun b!189856 () Bool)

(declare-fun res!89735 () Bool)

(assert (=> b!189856 (=> (not res!89735) (not e!124937))))

(assert (=> b!189856 (= res!89735 e!124935)))

(declare-fun res!89736 () Bool)

(assert (=> b!189856 (=> res!89736 e!124935)))

(assert (=> b!189856 (= res!89736 (not e!124934))))

(declare-fun res!89731 () Bool)

(assert (=> b!189856 (=> (not res!89731) (not e!124934))))

(assert (=> b!189856 (= res!89731 (bvslt #b00000000000000000000000000000000 (size!4123 (_keys!5840 thiss!1248))))))

(declare-fun b!189857 () Bool)

(declare-fun res!89738 () Bool)

(assert (=> b!189857 (=> (not res!89738) (not e!124937))))

(declare-fun e!124939 () Bool)

(assert (=> b!189857 (= res!89738 e!124939)))

(declare-fun c!34118 () Bool)

(assert (=> b!189857 (= c!34118 (not (= (bvand (extraKeys!3610 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!189858 () Bool)

(assert (=> b!189858 (= e!124939 (not call!19144))))

(declare-fun bm!19142 () Bool)

(assert (=> bm!19142 (= call!19142 (contains!1319 lt!93938 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!189859 () Bool)

(assert (=> b!189859 (= e!124939 e!124932)))

(declare-fun res!89737 () Bool)

(assert (=> b!189859 (= res!89737 call!19144)))

(assert (=> b!189859 (=> (not res!89737) (not e!124932))))

(declare-fun b!189860 () Bool)

(assert (=> b!189860 (= e!124930 (+!297 call!19145 (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3714 thiss!1248))))))

(declare-fun bm!19143 () Bool)

(assert (=> bm!19143 (= call!19145 (+!297 (ite c!34115 call!19146 (ite c!34119 call!19143 call!19141)) (ite (or c!34115 c!34119) (tuple2!3471 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3714 thiss!1248)) (tuple2!3471 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3714 thiss!1248)))))))

(assert (= (and d!55615 c!34115) b!189860))

(assert (= (and d!55615 (not c!34115)) b!189852))

(assert (= (and b!189852 c!34119) b!189843))

(assert (= (and b!189852 (not c!34119)) b!189855))

(assert (= (and b!189855 c!34116) b!189854))

(assert (= (and b!189855 (not c!34116)) b!189841))

(assert (= (or b!189854 b!189841) bm!19141))

(assert (= (or b!189843 bm!19141) bm!19139))

(assert (= (or b!189843 b!189854) bm!19140))

(assert (= (or b!189860 bm!19139) bm!19137))

(assert (= (or b!189860 bm!19140) bm!19143))

(assert (= (and d!55615 res!89732) b!189848))

(assert (= (and d!55615 c!34117) b!189850))

(assert (= (and d!55615 (not c!34117)) b!189846))

(assert (= (and d!55615 res!89733) b!189856))

(assert (= (and b!189856 res!89731) b!189845))

(assert (= (and b!189856 (not res!89736)) b!189853))

(assert (= (and b!189853 res!89730) b!189844))

(assert (= (and b!189856 res!89735) b!189857))

(assert (= (and b!189857 c!34118) b!189859))

(assert (= (and b!189857 (not c!34118)) b!189858))

(assert (= (and b!189859 res!89737) b!189849))

(assert (= (or b!189859 b!189858) bm!19138))

(assert (= (and b!189857 res!89738) b!189840))

(assert (= (and b!189840 c!34114) b!189851))

(assert (= (and b!189840 (not c!34114)) b!189847))

(assert (= (and b!189851 res!89734) b!189842))

(assert (= (or b!189851 b!189847) bm!19142))

(declare-fun b_lambda!7319 () Bool)

(assert (=> (not b_lambda!7319) (not b!189844)))

(assert (=> b!189844 t!7294))

(declare-fun b_and!11281 () Bool)

(assert (= b_and!11279 (and (=> t!7294 result!4871) b_and!11281)))

(assert (=> b!189845 m!215625))

(assert (=> b!189845 m!215625))

(assert (=> b!189845 m!215627))

(declare-fun m!215687 () Bool)

(assert (=> b!189844 m!215687))

(assert (=> b!189844 m!215631))

(declare-fun m!215689 () Bool)

(assert (=> b!189844 m!215689))

(assert (=> b!189844 m!215625))

(assert (=> b!189844 m!215625))

(declare-fun m!215691 () Bool)

(assert (=> b!189844 m!215691))

(assert (=> b!189844 m!215631))

(assert (=> b!189844 m!215687))

(declare-fun m!215693 () Bool)

(assert (=> bm!19137 m!215693))

(assert (=> b!189853 m!215625))

(assert (=> b!189853 m!215625))

(declare-fun m!215695 () Bool)

(assert (=> b!189853 m!215695))

(declare-fun m!215697 () Bool)

(assert (=> b!189850 m!215697))

(assert (=> b!189850 m!215625))

(assert (=> b!189850 m!215693))

(declare-fun m!215699 () Bool)

(assert (=> b!189850 m!215699))

(declare-fun m!215701 () Bool)

(assert (=> b!189850 m!215701))

(assert (=> b!189850 m!215699))

(declare-fun m!215703 () Bool)

(assert (=> b!189850 m!215703))

(declare-fun m!215705 () Bool)

(assert (=> b!189850 m!215705))

(declare-fun m!215707 () Bool)

(assert (=> b!189850 m!215707))

(declare-fun m!215709 () Bool)

(assert (=> b!189850 m!215709))

(declare-fun m!215711 () Bool)

(assert (=> b!189850 m!215711))

(declare-fun m!215713 () Bool)

(assert (=> b!189850 m!215713))

(assert (=> b!189850 m!215701))

(declare-fun m!215715 () Bool)

(assert (=> b!189850 m!215715))

(declare-fun m!215717 () Bool)

(assert (=> b!189850 m!215717))

(declare-fun m!215719 () Bool)

(assert (=> b!189850 m!215719))

(assert (=> b!189850 m!215709))

(declare-fun m!215721 () Bool)

(assert (=> b!189850 m!215721))

(assert (=> b!189850 m!215707))

(declare-fun m!215723 () Bool)

(assert (=> b!189850 m!215723))

(declare-fun m!215725 () Bool)

(assert (=> b!189850 m!215725))

(assert (=> d!55615 m!215497))

(declare-fun m!215727 () Bool)

(assert (=> b!189842 m!215727))

(declare-fun m!215729 () Bool)

(assert (=> bm!19138 m!215729))

(assert (=> b!189848 m!215625))

(assert (=> b!189848 m!215625))

(assert (=> b!189848 m!215627))

(declare-fun m!215731 () Bool)

(assert (=> b!189860 m!215731))

(declare-fun m!215733 () Bool)

(assert (=> bm!19143 m!215733))

(declare-fun m!215735 () Bool)

(assert (=> bm!19142 m!215735))

(declare-fun m!215737 () Bool)

(assert (=> b!189849 m!215737))

(assert (=> b!189652 d!55615))

(declare-fun d!55617 () Bool)

(declare-fun e!124944 () Bool)

(assert (=> d!55617 e!124944))

(declare-fun res!89743 () Bool)

(assert (=> d!55617 (=> (not res!89743) (not e!124944))))

(declare-fun lt!93959 () ListLongMap!2379)

(assert (=> d!55617 (= res!89743 (contains!1319 lt!93959 (_1!1746 (tuple2!3471 key!828 v!309))))))

(declare-fun lt!93958 () List!2394)

(assert (=> d!55617 (= lt!93959 (ListLongMap!2380 lt!93958))))

(declare-fun lt!93960 () Unit!5690)

(declare-fun lt!93957 () Unit!5690)

(assert (=> d!55617 (= lt!93960 lt!93957)))

(declare-datatypes ((Option!239 0))(
  ( (Some!238 (v!4182 V!5553)) (None!237) )
))
(declare-fun getValueByKey!233 (List!2394 (_ BitVec 64)) Option!239)

(assert (=> d!55617 (= (getValueByKey!233 lt!93958 (_1!1746 (tuple2!3471 key!828 v!309))) (Some!238 (_2!1746 (tuple2!3471 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!123 (List!2394 (_ BitVec 64) V!5553) Unit!5690)

(assert (=> d!55617 (= lt!93957 (lemmaContainsTupThenGetReturnValue!123 lt!93958 (_1!1746 (tuple2!3471 key!828 v!309)) (_2!1746 (tuple2!3471 key!828 v!309))))))

(declare-fun insertStrictlySorted!126 (List!2394 (_ BitVec 64) V!5553) List!2394)

(assert (=> d!55617 (= lt!93958 (insertStrictlySorted!126 (toList!1205 lt!93798) (_1!1746 (tuple2!3471 key!828 v!309)) (_2!1746 (tuple2!3471 key!828 v!309))))))

(assert (=> d!55617 (= (+!297 lt!93798 (tuple2!3471 key!828 v!309)) lt!93959)))

(declare-fun b!189865 () Bool)

(declare-fun res!89744 () Bool)

(assert (=> b!189865 (=> (not res!89744) (not e!124944))))

(assert (=> b!189865 (= res!89744 (= (getValueByKey!233 (toList!1205 lt!93959) (_1!1746 (tuple2!3471 key!828 v!309))) (Some!238 (_2!1746 (tuple2!3471 key!828 v!309)))))))

(declare-fun b!189866 () Bool)

(declare-fun contains!1321 (List!2394 tuple2!3470) Bool)

(assert (=> b!189866 (= e!124944 (contains!1321 (toList!1205 lt!93959) (tuple2!3471 key!828 v!309)))))

(assert (= (and d!55617 res!89743) b!189865))

(assert (= (and b!189865 res!89744) b!189866))

(declare-fun m!215739 () Bool)

(assert (=> d!55617 m!215739))

(declare-fun m!215741 () Bool)

(assert (=> d!55617 m!215741))

(declare-fun m!215743 () Bool)

(assert (=> d!55617 m!215743))

(declare-fun m!215745 () Bool)

(assert (=> d!55617 m!215745))

(declare-fun m!215747 () Bool)

(assert (=> b!189865 m!215747))

(declare-fun m!215749 () Bool)

(assert (=> b!189866 m!215749))

(assert (=> b!189652 d!55617))

(declare-fun d!55619 () Bool)

(declare-fun e!124950 () Bool)

(assert (=> d!55619 e!124950))

(declare-fun res!89747 () Bool)

(assert (=> d!55619 (=> res!89747 e!124950)))

(declare-fun lt!93971 () Bool)

(assert (=> d!55619 (= res!89747 (not lt!93971))))

(declare-fun lt!93969 () Bool)

(assert (=> d!55619 (= lt!93971 lt!93969)))

(declare-fun lt!93972 () Unit!5690)

(declare-fun e!124949 () Unit!5690)

(assert (=> d!55619 (= lt!93972 e!124949)))

(declare-fun c!34122 () Bool)

(assert (=> d!55619 (= c!34122 lt!93969)))

(declare-fun containsKey!237 (List!2394 (_ BitVec 64)) Bool)

(assert (=> d!55619 (= lt!93969 (containsKey!237 (toList!1205 lt!93798) key!828))))

(assert (=> d!55619 (= (contains!1319 lt!93798 key!828) lt!93971)))

(declare-fun b!189873 () Bool)

(declare-fun lt!93970 () Unit!5690)

(assert (=> b!189873 (= e!124949 lt!93970)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!186 (List!2394 (_ BitVec 64)) Unit!5690)

(assert (=> b!189873 (= lt!93970 (lemmaContainsKeyImpliesGetValueByKeyDefined!186 (toList!1205 lt!93798) key!828))))

(declare-fun isDefined!187 (Option!239) Bool)

(assert (=> b!189873 (isDefined!187 (getValueByKey!233 (toList!1205 lt!93798) key!828))))

(declare-fun b!189874 () Bool)

(declare-fun Unit!5698 () Unit!5690)

(assert (=> b!189874 (= e!124949 Unit!5698)))

(declare-fun b!189875 () Bool)

(assert (=> b!189875 (= e!124950 (isDefined!187 (getValueByKey!233 (toList!1205 lt!93798) key!828)))))

(assert (= (and d!55619 c!34122) b!189873))

(assert (= (and d!55619 (not c!34122)) b!189874))

(assert (= (and d!55619 (not res!89747)) b!189875))

(declare-fun m!215751 () Bool)

(assert (=> d!55619 m!215751))

(declare-fun m!215753 () Bool)

(assert (=> b!189873 m!215753))

(declare-fun m!215755 () Bool)

(assert (=> b!189873 m!215755))

(assert (=> b!189873 m!215755))

(declare-fun m!215757 () Bool)

(assert (=> b!189873 m!215757))

(assert (=> b!189875 m!215755))

(assert (=> b!189875 m!215755))

(assert (=> b!189875 m!215757))

(assert (=> b!189652 d!55619))

(declare-fun b!189883 () Bool)

(declare-fun e!124955 () Bool)

(assert (=> b!189883 (= e!124955 tp_is_empty!4429)))

(declare-fun mapNonEmpty!7651 () Bool)

(declare-fun mapRes!7651 () Bool)

(declare-fun tp!16822 () Bool)

(declare-fun e!124956 () Bool)

(assert (=> mapNonEmpty!7651 (= mapRes!7651 (and tp!16822 e!124956))))

(declare-fun mapValue!7651 () ValueCell!1871)

(declare-fun mapKey!7651 () (_ BitVec 32))

(declare-fun mapRest!7651 () (Array (_ BitVec 32) ValueCell!1871))

(assert (=> mapNonEmpty!7651 (= mapRest!7642 (store mapRest!7651 mapKey!7651 mapValue!7651))))

(declare-fun b!189882 () Bool)

(assert (=> b!189882 (= e!124956 tp_is_empty!4429)))

(declare-fun condMapEmpty!7651 () Bool)

(declare-fun mapDefault!7651 () ValueCell!1871)

(assert (=> mapNonEmpty!7642 (= condMapEmpty!7651 (= mapRest!7642 ((as const (Array (_ BitVec 32) ValueCell!1871)) mapDefault!7651)))))

(assert (=> mapNonEmpty!7642 (= tp!16807 (and e!124955 mapRes!7651))))

(declare-fun mapIsEmpty!7651 () Bool)

(assert (=> mapIsEmpty!7651 mapRes!7651))

(assert (= (and mapNonEmpty!7642 condMapEmpty!7651) mapIsEmpty!7651))

(assert (= (and mapNonEmpty!7642 (not condMapEmpty!7651)) mapNonEmpty!7651))

(assert (= (and mapNonEmpty!7651 ((_ is ValueCellFull!1871) mapValue!7651)) b!189882))

(assert (= (and mapNonEmpty!7642 ((_ is ValueCellFull!1871) mapDefault!7651)) b!189883))

(declare-fun m!215759 () Bool)

(assert (=> mapNonEmpty!7651 m!215759))

(declare-fun b_lambda!7321 () Bool)

(assert (= b_lambda!7317 (or (and b!189653 b_free!4657) b_lambda!7321)))

(declare-fun b_lambda!7323 () Bool)

(assert (= b_lambda!7319 (or (and b!189653 b_free!4657) b_lambda!7323)))

(check-sat tp_is_empty!4429 (not bm!19143) (not b!189844) (not b!189763) (not d!55613) (not bm!19115) (not b!189818) (not b!189764) (not b!189751) (not bm!19138) (not b!189822) (not b!189865) (not b!189834) (not b_lambda!7323) (not b!189848) (not mapNonEmpty!7651) (not b!189827) (not bm!19131) (not d!55595) (not d!55615) (not bm!19114) (not b!189824) (not d!55611) (not bm!19137) (not b!189839) (not b_lambda!7321) (not d!55601) (not d!55599) (not bm!19136) (not b!189842) (not b!189850) (not b_next!4657) b_and!11281 (not b!189875) (not b!189845) (not b!189849) (not b!189853) (not d!55597) (not bm!19130) (not d!55617) (not b!189819) (not b!189816) (not b!189860) (not b!189873) (not bm!19142) (not b!189770) (not b!189866) (not bm!19135) (not b!189765) (not b!189823) (not d!55619))
(check-sat b_and!11281 (not b_next!4657))
