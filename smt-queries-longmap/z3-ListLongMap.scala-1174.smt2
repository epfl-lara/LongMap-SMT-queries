; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25240 () Bool)

(assert start!25240)

(declare-fun b!262905 () Bool)

(declare-fun b_free!6793 () Bool)

(declare-fun b_next!6793 () Bool)

(assert (=> b!262905 (= b_free!6793 (not b_next!6793))))

(declare-fun tp!23716 () Bool)

(declare-fun b_and!13949 () Bool)

(assert (=> b!262905 (= tp!23716 b_and!13949)))

(declare-fun b!262898 () Bool)

(declare-fun res!128406 () Bool)

(declare-fun e!170360 () Bool)

(assert (=> b!262898 (=> (not res!128406) (not e!170360))))

(declare-fun call!25130 () Bool)

(assert (=> b!262898 (= res!128406 call!25130)))

(declare-fun e!170375 () Bool)

(assert (=> b!262898 (= e!170375 e!170360)))

(declare-fun b!262899 () Bool)

(declare-datatypes ((Unit!8164 0))(
  ( (Unit!8165) )
))
(declare-fun e!170362 () Unit!8164)

(declare-fun lt!133014 () Unit!8164)

(assert (=> b!262899 (= e!170362 lt!133014)))

(declare-datatypes ((V!8521 0))(
  ( (V!8522 (val!3372 Int)) )
))
(declare-datatypes ((ValueCell!2984 0))(
  ( (ValueCellFull!2984 (v!5504 V!8521)) (EmptyCell!2984) )
))
(declare-datatypes ((array!12669 0))(
  ( (array!12670 (arr!5995 (Array (_ BitVec 32) ValueCell!2984)) (size!6346 (_ BitVec 32))) )
))
(declare-datatypes ((array!12671 0))(
  ( (array!12672 (arr!5996 (Array (_ BitVec 32) (_ BitVec 64))) (size!6347 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3868 0))(
  ( (LongMapFixedSize!3869 (defaultEntry!4842 Int) (mask!11208 (_ BitVec 32)) (extraKeys!4579 (_ BitVec 32)) (zeroValue!4683 V!8521) (minValue!4683 V!8521) (_size!1983 (_ BitVec 32)) (_keys!7034 array!12671) (_values!4825 array!12669) (_vacant!1983 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3868)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!441 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) Int) Unit!8164)

(assert (=> b!262899 (= lt!133014 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!441 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)))))

(declare-fun c!44822 () Bool)

(declare-datatypes ((SeekEntryResult!1164 0))(
  ( (MissingZero!1164 (index!6826 (_ BitVec 32))) (Found!1164 (index!6827 (_ BitVec 32))) (Intermediate!1164 (undefined!1976 Bool) (index!6828 (_ BitVec 32)) (x!25206 (_ BitVec 32))) (Undefined!1164) (MissingVacant!1164 (index!6829 (_ BitVec 32))) )
))
(declare-fun lt!133015 () SeekEntryResult!1164)

(get-info :version)

(assert (=> b!262899 (= c!44822 ((_ is MissingZero!1164) lt!133015))))

(assert (=> b!262899 e!170375))

(declare-fun mapIsEmpty!11347 () Bool)

(declare-fun mapRes!11347 () Bool)

(assert (=> mapIsEmpty!11347 mapRes!11347))

(declare-fun b!262900 () Bool)

(declare-fun e!170369 () Bool)

(declare-fun e!170361 () Bool)

(assert (=> b!262900 (= e!170369 (and e!170361 mapRes!11347))))

(declare-fun condMapEmpty!11347 () Bool)

(declare-fun mapDefault!11347 () ValueCell!2984)

(assert (=> b!262900 (= condMapEmpty!11347 (= (arr!5995 (_values!4825 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2984)) mapDefault!11347)))))

(declare-fun b!262901 () Bool)

(declare-fun e!170365 () Bool)

(declare-fun call!25129 () Bool)

(assert (=> b!262901 (= e!170365 (not call!25129))))

(declare-fun b!262903 () Bool)

(declare-fun e!170368 () Bool)

(declare-fun e!170364 () Bool)

(assert (=> b!262903 (= e!170368 (not e!170364))))

(declare-fun res!128410 () Bool)

(assert (=> b!262903 (=> (not res!128410) (not e!170364))))

(declare-fun lt!133011 () LongMapFixedSize!3868)

(declare-fun valid!1513 (LongMapFixedSize!3868) Bool)

(assert (=> b!262903 (= res!128410 (valid!1513 lt!133011))))

(declare-datatypes ((tuple2!4886 0))(
  ( (tuple2!4887 (_1!2454 (_ BitVec 64)) (_2!2454 V!8521)) )
))
(declare-datatypes ((List!3763 0))(
  ( (Nil!3760) (Cons!3759 (h!4425 tuple2!4886) (t!8832 List!3763)) )
))
(declare-datatypes ((ListLongMap!3801 0))(
  ( (ListLongMap!3802 (toList!1916 List!3763)) )
))
(declare-fun lt!133003 () ListLongMap!3801)

(declare-fun contains!1885 (ListLongMap!3801 (_ BitVec 64)) Bool)

(assert (=> b!262903 (contains!1885 lt!133003 key!932)))

(declare-fun lt!133020 () array!12669)

(declare-fun lt!133016 () Unit!8164)

(declare-fun lt!133005 () array!12671)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaValidKeyInArrayIsInListMap!151 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) Int) Unit!8164)

(assert (=> b!262903 (= lt!133016 (lemmaValidKeyInArrayIsInListMap!151 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 (defaultEntry!4842 thiss!1504)))))

(assert (=> b!262903 (= lt!133011 (LongMapFixedSize!3869 (defaultEntry!4842 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1983 thiss!1504)) lt!133005 lt!133020 (_vacant!1983 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12671 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!262903 (= (arrayCountValidKeys!0 lt!133005 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!133009 () Unit!8164)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!12671 (_ BitVec 32)) Unit!8164)

(assert (=> b!262903 (= lt!133009 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!133005 index!297))))

(declare-fun arrayContainsKey!0 (array!12671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!262903 (arrayContainsKey!0 lt!133005 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!133022 () Unit!8164)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12671 (_ BitVec 64) (_ BitVec 32)) Unit!8164)

(assert (=> b!262903 (= lt!133022 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133005 key!932 index!297))))

(declare-fun lt!133012 () ListLongMap!3801)

(assert (=> b!262903 (= lt!133012 lt!133003)))

(declare-fun getCurrentListMap!1448 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) Int) ListLongMap!3801)

(assert (=> b!262903 (= lt!133003 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133013 () ListLongMap!3801)

(declare-fun lt!133017 () tuple2!4886)

(declare-fun +!712 (ListLongMap!3801 tuple2!4886) ListLongMap!3801)

(assert (=> b!262903 (= lt!133012 (+!712 lt!133013 lt!133017))))

(declare-fun v!346 () V!8521)

(assert (=> b!262903 (= lt!133020 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))))))

(assert (=> b!262903 (= lt!133017 (tuple2!4887 key!932 v!346))))

(declare-fun lt!133007 () Unit!8164)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!127 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) (_ BitVec 64) V!8521 Int) Unit!8164)

(assert (=> b!262903 (= lt!133007 (lemmaAddValidKeyToArrayThenAddPairToListMap!127 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 key!932 v!346 (defaultEntry!4842 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12671 (_ BitVec 32)) Bool)

(assert (=> b!262903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!133005 (mask!11208 thiss!1504))))

(declare-fun lt!133006 () Unit!8164)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12671 (_ BitVec 32) (_ BitVec 32)) Unit!8164)

(assert (=> b!262903 (= lt!133006 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7034 thiss!1504) index!297 (mask!11208 thiss!1504)))))

(assert (=> b!262903 (= (arrayCountValidKeys!0 lt!133005 #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!7034 thiss!1504) #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504)))))))

(declare-fun lt!133010 () Unit!8164)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12671 (_ BitVec 32) (_ BitVec 64)) Unit!8164)

(assert (=> b!262903 (= lt!133010 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7034 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3764 0))(
  ( (Nil!3761) (Cons!3760 (h!4426 (_ BitVec 64)) (t!8833 List!3764)) )
))
(declare-fun arrayNoDuplicates!0 (array!12671 (_ BitVec 32) List!3764) Bool)

(assert (=> b!262903 (arrayNoDuplicates!0 lt!133005 #b00000000000000000000000000000000 Nil!3761)))

(assert (=> b!262903 (= lt!133005 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun lt!133004 () Unit!8164)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12671 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3764) Unit!8164)

(assert (=> b!262903 (= lt!133004 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7034 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3761))))

(declare-fun lt!133021 () Unit!8164)

(declare-fun e!170366 () Unit!8164)

(assert (=> b!262903 (= lt!133021 e!170366)))

(declare-fun c!44824 () Bool)

(assert (=> b!262903 (= c!44824 (arrayContainsKey!0 (_keys!7034 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262904 () Bool)

(declare-fun c!44825 () Bool)

(assert (=> b!262904 (= c!44825 ((_ is MissingVacant!1164) lt!133015))))

(declare-fun e!170373 () Bool)

(assert (=> b!262904 (= e!170375 e!170373)))

(declare-fun e!170372 () Bool)

(declare-fun tp_is_empty!6655 () Bool)

(declare-fun array_inv!3947 (array!12671) Bool)

(declare-fun array_inv!3948 (array!12669) Bool)

(assert (=> b!262905 (= e!170372 (and tp!23716 tp_is_empty!6655 (array_inv!3947 (_keys!7034 thiss!1504)) (array_inv!3948 (_values!4825 thiss!1504)) e!170369))))

(declare-fun b!262906 () Bool)

(declare-fun Unit!8166 () Unit!8164)

(assert (=> b!262906 (= e!170366 Unit!8166)))

(declare-fun b!262907 () Bool)

(declare-fun res!128403 () Bool)

(assert (=> b!262907 (=> (not res!128403) (not e!170360))))

(assert (=> b!262907 (= res!128403 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6826 lt!133015)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!262908 () Bool)

(declare-fun e!170374 () Bool)

(assert (=> b!262908 (= e!170364 e!170374)))

(declare-fun res!128405 () Bool)

(assert (=> b!262908 (=> (not res!128405) (not e!170374))))

(declare-fun lt!133019 () ListLongMap!3801)

(assert (=> b!262908 (= res!128405 (contains!1885 lt!133019 key!932))))

(declare-fun map!2747 (LongMapFixedSize!3868) ListLongMap!3801)

(assert (=> b!262908 (= lt!133019 (map!2747 lt!133011))))

(declare-fun b!262909 () Bool)

(declare-fun e!170367 () Bool)

(assert (=> b!262909 (= e!170367 tp_is_empty!6655)))

(declare-fun b!262910 () Bool)

(assert (=> b!262910 (= e!170373 e!170365)))

(declare-fun res!128407 () Bool)

(assert (=> b!262910 (= res!128407 call!25130)))

(assert (=> b!262910 (=> (not res!128407) (not e!170365))))

(declare-fun b!262911 () Bool)

(declare-fun Unit!8167 () Unit!8164)

(assert (=> b!262911 (= e!170366 Unit!8167)))

(declare-fun lt!133018 () Unit!8164)

(declare-fun lemmaArrayContainsKeyThenInListMap!270 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) (_ BitVec 32) Int) Unit!8164)

(assert (=> b!262911 (= lt!133018 (lemmaArrayContainsKeyThenInListMap!270 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(assert (=> b!262911 false))

(declare-fun bm!25126 () Bool)

(assert (=> bm!25126 (= call!25129 (arrayContainsKey!0 (_keys!7034 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!262912 () Bool)

(assert (=> b!262912 (= e!170373 ((_ is Undefined!1164) lt!133015))))

(declare-fun b!262913 () Bool)

(declare-fun e!170371 () Bool)

(assert (=> b!262913 (= e!170371 e!170368)))

(declare-fun res!128411 () Bool)

(assert (=> b!262913 (=> (not res!128411) (not e!170368))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262913 (= res!128411 (inRange!0 index!297 (mask!11208 thiss!1504)))))

(declare-fun lt!133008 () Unit!8164)

(assert (=> b!262913 (= lt!133008 e!170362)))

(declare-fun c!44823 () Bool)

(assert (=> b!262913 (= c!44823 (contains!1885 lt!133013 key!932))))

(assert (=> b!262913 (= lt!133013 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun b!262914 () Bool)

(declare-fun Unit!8168 () Unit!8164)

(assert (=> b!262914 (= e!170362 Unit!8168)))

(declare-fun lt!133002 () Unit!8164)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!450 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) Int) Unit!8164)

(assert (=> b!262914 (= lt!133002 (lemmaInListMapThenSeekEntryOrOpenFindsIt!450 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)))))

(assert (=> b!262914 false))

(declare-fun mapNonEmpty!11347 () Bool)

(declare-fun tp!23715 () Bool)

(assert (=> mapNonEmpty!11347 (= mapRes!11347 (and tp!23715 e!170367))))

(declare-fun mapValue!11347 () ValueCell!2984)

(declare-fun mapRest!11347 () (Array (_ BitVec 32) ValueCell!2984))

(declare-fun mapKey!11347 () (_ BitVec 32))

(assert (=> mapNonEmpty!11347 (= (arr!5995 (_values!4825 thiss!1504)) (store mapRest!11347 mapKey!11347 mapValue!11347))))

(declare-fun res!128404 () Bool)

(declare-fun e!170363 () Bool)

(assert (=> start!25240 (=> (not res!128404) (not e!170363))))

(assert (=> start!25240 (= res!128404 (valid!1513 thiss!1504))))

(assert (=> start!25240 e!170363))

(assert (=> start!25240 e!170372))

(assert (=> start!25240 true))

(assert (=> start!25240 tp_is_empty!6655))

(declare-fun b!262902 () Bool)

(assert (=> b!262902 (= e!170363 e!170371)))

(declare-fun res!128402 () Bool)

(assert (=> b!262902 (=> (not res!128402) (not e!170371))))

(assert (=> b!262902 (= res!128402 (or (= lt!133015 (MissingZero!1164 index!297)) (= lt!133015 (MissingVacant!1164 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12671 (_ BitVec 32)) SeekEntryResult!1164)

(assert (=> b!262902 (= lt!133015 (seekEntryOrOpen!0 key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun b!262915 () Bool)

(assert (=> b!262915 (= e!170360 (not call!25129))))

(declare-fun b!262916 () Bool)

(declare-fun res!128408 () Bool)

(assert (=> b!262916 (= res!128408 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6829 lt!133015)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!262916 (=> (not res!128408) (not e!170365))))

(declare-fun b!262917 () Bool)

(declare-fun res!128409 () Bool)

(assert (=> b!262917 (=> (not res!128409) (not e!170363))))

(assert (=> b!262917 (= res!128409 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!25127 () Bool)

(assert (=> bm!25127 (= call!25130 (inRange!0 (ite c!44822 (index!6826 lt!133015) (index!6829 lt!133015)) (mask!11208 thiss!1504)))))

(declare-fun b!262918 () Bool)

(assert (=> b!262918 (= e!170361 tp_is_empty!6655)))

(declare-fun b!262919 () Bool)

(assert (=> b!262919 (= e!170374 (= lt!133019 (+!712 (map!2747 thiss!1504) lt!133017)))))

(assert (= (and start!25240 res!128404) b!262917))

(assert (= (and b!262917 res!128409) b!262902))

(assert (= (and b!262902 res!128402) b!262913))

(assert (= (and b!262913 c!44823) b!262914))

(assert (= (and b!262913 (not c!44823)) b!262899))

(assert (= (and b!262899 c!44822) b!262898))

(assert (= (and b!262899 (not c!44822)) b!262904))

(assert (= (and b!262898 res!128406) b!262907))

(assert (= (and b!262907 res!128403) b!262915))

(assert (= (and b!262904 c!44825) b!262910))

(assert (= (and b!262904 (not c!44825)) b!262912))

(assert (= (and b!262910 res!128407) b!262916))

(assert (= (and b!262916 res!128408) b!262901))

(assert (= (or b!262898 b!262910) bm!25127))

(assert (= (or b!262915 b!262901) bm!25126))

(assert (= (and b!262913 res!128411) b!262903))

(assert (= (and b!262903 c!44824) b!262911))

(assert (= (and b!262903 (not c!44824)) b!262906))

(assert (= (and b!262903 res!128410) b!262908))

(assert (= (and b!262908 res!128405) b!262919))

(assert (= (and b!262900 condMapEmpty!11347) mapIsEmpty!11347))

(assert (= (and b!262900 (not condMapEmpty!11347)) mapNonEmpty!11347))

(assert (= (and mapNonEmpty!11347 ((_ is ValueCellFull!2984) mapValue!11347)) b!262909))

(assert (= (and b!262900 ((_ is ValueCellFull!2984) mapDefault!11347)) b!262918))

(assert (= b!262905 b!262900))

(assert (= start!25240 b!262905))

(declare-fun m!279087 () Bool)

(assert (=> b!262913 m!279087))

(declare-fun m!279089 () Bool)

(assert (=> b!262913 m!279089))

(declare-fun m!279091 () Bool)

(assert (=> b!262913 m!279091))

(declare-fun m!279093 () Bool)

(assert (=> b!262903 m!279093))

(declare-fun m!279095 () Bool)

(assert (=> b!262903 m!279095))

(declare-fun m!279097 () Bool)

(assert (=> b!262903 m!279097))

(declare-fun m!279099 () Bool)

(assert (=> b!262903 m!279099))

(declare-fun m!279101 () Bool)

(assert (=> b!262903 m!279101))

(declare-fun m!279103 () Bool)

(assert (=> b!262903 m!279103))

(declare-fun m!279105 () Bool)

(assert (=> b!262903 m!279105))

(declare-fun m!279107 () Bool)

(assert (=> b!262903 m!279107))

(declare-fun m!279109 () Bool)

(assert (=> b!262903 m!279109))

(declare-fun m!279111 () Bool)

(assert (=> b!262903 m!279111))

(declare-fun m!279113 () Bool)

(assert (=> b!262903 m!279113))

(declare-fun m!279115 () Bool)

(assert (=> b!262903 m!279115))

(declare-fun m!279117 () Bool)

(assert (=> b!262903 m!279117))

(declare-fun m!279119 () Bool)

(assert (=> b!262903 m!279119))

(declare-fun m!279121 () Bool)

(assert (=> b!262903 m!279121))

(declare-fun m!279123 () Bool)

(assert (=> b!262903 m!279123))

(declare-fun m!279125 () Bool)

(assert (=> b!262903 m!279125))

(declare-fun m!279127 () Bool)

(assert (=> b!262903 m!279127))

(declare-fun m!279129 () Bool)

(assert (=> b!262903 m!279129))

(declare-fun m!279131 () Bool)

(assert (=> b!262903 m!279131))

(declare-fun m!279133 () Bool)

(assert (=> bm!25127 m!279133))

(declare-fun m!279135 () Bool)

(assert (=> mapNonEmpty!11347 m!279135))

(declare-fun m!279137 () Bool)

(assert (=> b!262916 m!279137))

(declare-fun m!279139 () Bool)

(assert (=> b!262902 m!279139))

(declare-fun m!279141 () Bool)

(assert (=> b!262914 m!279141))

(declare-fun m!279143 () Bool)

(assert (=> b!262911 m!279143))

(declare-fun m!279145 () Bool)

(assert (=> b!262908 m!279145))

(declare-fun m!279147 () Bool)

(assert (=> b!262908 m!279147))

(declare-fun m!279149 () Bool)

(assert (=> b!262919 m!279149))

(assert (=> b!262919 m!279149))

(declare-fun m!279151 () Bool)

(assert (=> b!262919 m!279151))

(assert (=> bm!25126 m!279109))

(declare-fun m!279153 () Bool)

(assert (=> b!262899 m!279153))

(declare-fun m!279155 () Bool)

(assert (=> b!262907 m!279155))

(declare-fun m!279157 () Bool)

(assert (=> b!262905 m!279157))

(declare-fun m!279159 () Bool)

(assert (=> b!262905 m!279159))

(declare-fun m!279161 () Bool)

(assert (=> start!25240 m!279161))

(check-sat (not b_next!6793) (not b!262913) (not b!262911) (not b!262908) (not b!262905) (not b!262899) (not b!262914) (not b!262903) (not start!25240) (not bm!25127) b_and!13949 tp_is_empty!6655 (not bm!25126) (not b!262919) (not mapNonEmpty!11347) (not b!262902))
(check-sat b_and!13949 (not b_next!6793))
(get-model)

(declare-fun b!263068 () Bool)

(declare-fun lt!133153 () SeekEntryResult!1164)

(assert (=> b!263068 (and (bvsge (index!6826 lt!133153) #b00000000000000000000000000000000) (bvslt (index!6826 lt!133153) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun res!128483 () Bool)

(assert (=> b!263068 (= res!128483 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6826 lt!133153)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170481 () Bool)

(assert (=> b!263068 (=> (not res!128483) (not e!170481))))

(declare-fun b!263069 () Bool)

(declare-fun e!170482 () Bool)

(assert (=> b!263069 (= e!170482 e!170481)))

(declare-fun res!128482 () Bool)

(declare-fun call!25147 () Bool)

(assert (=> b!263069 (= res!128482 call!25147)))

(assert (=> b!263069 (=> (not res!128482) (not e!170481))))

(declare-fun bm!25144 () Bool)

(declare-fun c!44854 () Bool)

(assert (=> bm!25144 (= call!25147 (inRange!0 (ite c!44854 (index!6826 lt!133153) (index!6829 lt!133153)) (mask!11208 thiss!1504)))))

(declare-fun b!263070 () Bool)

(declare-fun e!170480 () Bool)

(declare-fun call!25148 () Bool)

(assert (=> b!263070 (= e!170480 (not call!25148))))

(declare-fun b!263071 () Bool)

(declare-fun e!170483 () Bool)

(assert (=> b!263071 (= e!170483 ((_ is Undefined!1164) lt!133153))))

(declare-fun b!263072 () Bool)

(assert (=> b!263072 (= e!170482 e!170483)))

(declare-fun c!44855 () Bool)

(assert (=> b!263072 (= c!44855 ((_ is MissingVacant!1164) lt!133153))))

(declare-fun d!63151 () Bool)

(assert (=> d!63151 e!170482))

(assert (=> d!63151 (= c!44854 ((_ is MissingZero!1164) lt!133153))))

(assert (=> d!63151 (= lt!133153 (seekEntryOrOpen!0 key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun lt!133154 () Unit!8164)

(declare-fun choose!1295 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) Int) Unit!8164)

(assert (=> d!63151 (= lt!133154 (choose!1295 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!63151 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63151 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!441 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)) lt!133154)))

(declare-fun bm!25145 () Bool)

(assert (=> bm!25145 (= call!25148 (arrayContainsKey!0 (_keys!7034 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!263073 () Bool)

(declare-fun res!128480 () Bool)

(assert (=> b!263073 (=> (not res!128480) (not e!170480))))

(assert (=> b!263073 (= res!128480 call!25147)))

(assert (=> b!263073 (= e!170483 e!170480)))

(declare-fun b!263074 () Bool)

(declare-fun res!128481 () Bool)

(assert (=> b!263074 (=> (not res!128481) (not e!170480))))

(assert (=> b!263074 (= res!128481 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6829 lt!133153)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263074 (and (bvsge (index!6829 lt!133153) #b00000000000000000000000000000000) (bvslt (index!6829 lt!133153) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun b!263075 () Bool)

(assert (=> b!263075 (= e!170481 (not call!25148))))

(assert (= (and d!63151 c!44854) b!263069))

(assert (= (and d!63151 (not c!44854)) b!263072))

(assert (= (and b!263069 res!128482) b!263068))

(assert (= (and b!263068 res!128483) b!263075))

(assert (= (and b!263072 c!44855) b!263073))

(assert (= (and b!263072 (not c!44855)) b!263071))

(assert (= (and b!263073 res!128480) b!263074))

(assert (= (and b!263074 res!128481) b!263070))

(assert (= (or b!263069 b!263073) bm!25144))

(assert (= (or b!263075 b!263070) bm!25145))

(assert (=> d!63151 m!279139))

(declare-fun m!279315 () Bool)

(assert (=> d!63151 m!279315))

(declare-fun m!279317 () Bool)

(assert (=> d!63151 m!279317))

(declare-fun m!279319 () Bool)

(assert (=> bm!25144 m!279319))

(declare-fun m!279321 () Bool)

(assert (=> b!263074 m!279321))

(assert (=> bm!25145 m!279109))

(declare-fun m!279323 () Bool)

(assert (=> b!263068 m!279323))

(assert (=> b!262899 d!63151))

(declare-fun d!63153 () Bool)

(declare-fun e!170488 () Bool)

(assert (=> d!63153 e!170488))

(declare-fun res!128486 () Bool)

(assert (=> d!63153 (=> res!128486 e!170488)))

(declare-fun lt!133164 () Bool)

(assert (=> d!63153 (= res!128486 (not lt!133164))))

(declare-fun lt!133166 () Bool)

(assert (=> d!63153 (= lt!133164 lt!133166)))

(declare-fun lt!133165 () Unit!8164)

(declare-fun e!170489 () Unit!8164)

(assert (=> d!63153 (= lt!133165 e!170489)))

(declare-fun c!44858 () Bool)

(assert (=> d!63153 (= c!44858 lt!133166)))

(declare-fun containsKey!312 (List!3763 (_ BitVec 64)) Bool)

(assert (=> d!63153 (= lt!133166 (containsKey!312 (toList!1916 lt!133019) key!932))))

(assert (=> d!63153 (= (contains!1885 lt!133019 key!932) lt!133164)))

(declare-fun b!263082 () Bool)

(declare-fun lt!133163 () Unit!8164)

(assert (=> b!263082 (= e!170489 lt!133163)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!260 (List!3763 (_ BitVec 64)) Unit!8164)

(assert (=> b!263082 (= lt!133163 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133019) key!932))))

(declare-datatypes ((Option!327 0))(
  ( (Some!326 (v!5509 V!8521)) (None!325) )
))
(declare-fun isDefined!261 (Option!327) Bool)

(declare-fun getValueByKey!321 (List!3763 (_ BitVec 64)) Option!327)

(assert (=> b!263082 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133019) key!932))))

(declare-fun b!263083 () Bool)

(declare-fun Unit!8175 () Unit!8164)

(assert (=> b!263083 (= e!170489 Unit!8175)))

(declare-fun b!263084 () Bool)

(assert (=> b!263084 (= e!170488 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133019) key!932)))))

(assert (= (and d!63153 c!44858) b!263082))

(assert (= (and d!63153 (not c!44858)) b!263083))

(assert (= (and d!63153 (not res!128486)) b!263084))

(declare-fun m!279325 () Bool)

(assert (=> d!63153 m!279325))

(declare-fun m!279327 () Bool)

(assert (=> b!263082 m!279327))

(declare-fun m!279329 () Bool)

(assert (=> b!263082 m!279329))

(assert (=> b!263082 m!279329))

(declare-fun m!279331 () Bool)

(assert (=> b!263082 m!279331))

(assert (=> b!263084 m!279329))

(assert (=> b!263084 m!279329))

(assert (=> b!263084 m!279331))

(assert (=> b!262908 d!63153))

(declare-fun d!63155 () Bool)

(assert (=> d!63155 (= (map!2747 lt!133011) (getCurrentListMap!1448 (_keys!7034 lt!133011) (_values!4825 lt!133011) (mask!11208 lt!133011) (extraKeys!4579 lt!133011) (zeroValue!4683 lt!133011) (minValue!4683 lt!133011) #b00000000000000000000000000000000 (defaultEntry!4842 lt!133011)))))

(declare-fun bs!9266 () Bool)

(assert (= bs!9266 d!63155))

(declare-fun m!279333 () Bool)

(assert (=> bs!9266 m!279333))

(assert (=> b!262908 d!63155))

(declare-fun d!63157 () Bool)

(assert (=> d!63157 (= (inRange!0 (ite c!44822 (index!6826 lt!133015) (index!6829 lt!133015)) (mask!11208 thiss!1504)) (and (bvsge (ite c!44822 (index!6826 lt!133015) (index!6829 lt!133015)) #b00000000000000000000000000000000) (bvslt (ite c!44822 (index!6826 lt!133015) (index!6829 lt!133015)) (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25127 d!63157))

(declare-fun d!63159 () Bool)

(declare-fun e!170492 () Bool)

(assert (=> d!63159 e!170492))

(declare-fun res!128491 () Bool)

(assert (=> d!63159 (=> (not res!128491) (not e!170492))))

(declare-fun lt!133176 () ListLongMap!3801)

(assert (=> d!63159 (= res!128491 (contains!1885 lt!133176 (_1!2454 lt!133017)))))

(declare-fun lt!133177 () List!3763)

(assert (=> d!63159 (= lt!133176 (ListLongMap!3802 lt!133177))))

(declare-fun lt!133178 () Unit!8164)

(declare-fun lt!133175 () Unit!8164)

(assert (=> d!63159 (= lt!133178 lt!133175)))

(assert (=> d!63159 (= (getValueByKey!321 lt!133177 (_1!2454 lt!133017)) (Some!326 (_2!2454 lt!133017)))))

(declare-fun lemmaContainsTupThenGetReturnValue!177 (List!3763 (_ BitVec 64) V!8521) Unit!8164)

(assert (=> d!63159 (= lt!133175 (lemmaContainsTupThenGetReturnValue!177 lt!133177 (_1!2454 lt!133017) (_2!2454 lt!133017)))))

(declare-fun insertStrictlySorted!180 (List!3763 (_ BitVec 64) V!8521) List!3763)

(assert (=> d!63159 (= lt!133177 (insertStrictlySorted!180 (toList!1916 (map!2747 thiss!1504)) (_1!2454 lt!133017) (_2!2454 lt!133017)))))

(assert (=> d!63159 (= (+!712 (map!2747 thiss!1504) lt!133017) lt!133176)))

(declare-fun b!263089 () Bool)

(declare-fun res!128492 () Bool)

(assert (=> b!263089 (=> (not res!128492) (not e!170492))))

(assert (=> b!263089 (= res!128492 (= (getValueByKey!321 (toList!1916 lt!133176) (_1!2454 lt!133017)) (Some!326 (_2!2454 lt!133017))))))

(declare-fun b!263090 () Bool)

(declare-fun contains!1888 (List!3763 tuple2!4886) Bool)

(assert (=> b!263090 (= e!170492 (contains!1888 (toList!1916 lt!133176) lt!133017))))

(assert (= (and d!63159 res!128491) b!263089))

(assert (= (and b!263089 res!128492) b!263090))

(declare-fun m!279335 () Bool)

(assert (=> d!63159 m!279335))

(declare-fun m!279337 () Bool)

(assert (=> d!63159 m!279337))

(declare-fun m!279339 () Bool)

(assert (=> d!63159 m!279339))

(declare-fun m!279341 () Bool)

(assert (=> d!63159 m!279341))

(declare-fun m!279343 () Bool)

(assert (=> b!263089 m!279343))

(declare-fun m!279345 () Bool)

(assert (=> b!263090 m!279345))

(assert (=> b!262919 d!63159))

(declare-fun d!63161 () Bool)

(assert (=> d!63161 (= (map!2747 thiss!1504) (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun bs!9267 () Bool)

(assert (= bs!9267 d!63161))

(assert (=> bs!9267 m!279091))

(assert (=> b!262919 d!63161))

(declare-fun d!63163 () Bool)

(assert (=> d!63163 (contains!1885 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) key!932)))

(declare-fun lt!133181 () Unit!8164)

(declare-fun choose!1296 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) (_ BitVec 32) Int) Unit!8164)

(assert (=> d!63163 (= lt!133181 (choose!1296 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!63163 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63163 (= (lemmaArrayContainsKeyThenInListMap!270 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133181)))

(declare-fun bs!9268 () Bool)

(assert (= bs!9268 d!63163))

(assert (=> bs!9268 m!279091))

(assert (=> bs!9268 m!279091))

(declare-fun m!279347 () Bool)

(assert (=> bs!9268 m!279347))

(declare-fun m!279349 () Bool)

(assert (=> bs!9268 m!279349))

(assert (=> bs!9268 m!279317))

(assert (=> b!262911 d!63163))

(declare-fun lt!133190 () SeekEntryResult!1164)

(declare-fun e!170501 () SeekEntryResult!1164)

(declare-fun b!263103 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12671 (_ BitVec 32)) SeekEntryResult!1164)

(assert (=> b!263103 (= e!170501 (seekKeyOrZeroReturnVacant!0 (x!25206 lt!133190) (index!6828 lt!133190) (index!6828 lt!133190) key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun d!63165 () Bool)

(declare-fun lt!133188 () SeekEntryResult!1164)

(assert (=> d!63165 (and (or ((_ is Undefined!1164) lt!133188) (not ((_ is Found!1164) lt!133188)) (and (bvsge (index!6827 lt!133188) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133188) (size!6347 (_keys!7034 thiss!1504))))) (or ((_ is Undefined!1164) lt!133188) ((_ is Found!1164) lt!133188) (not ((_ is MissingZero!1164) lt!133188)) (and (bvsge (index!6826 lt!133188) #b00000000000000000000000000000000) (bvslt (index!6826 lt!133188) (size!6347 (_keys!7034 thiss!1504))))) (or ((_ is Undefined!1164) lt!133188) ((_ is Found!1164) lt!133188) ((_ is MissingZero!1164) lt!133188) (not ((_ is MissingVacant!1164) lt!133188)) (and (bvsge (index!6829 lt!133188) #b00000000000000000000000000000000) (bvslt (index!6829 lt!133188) (size!6347 (_keys!7034 thiss!1504))))) (or ((_ is Undefined!1164) lt!133188) (ite ((_ is Found!1164) lt!133188) (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6827 lt!133188)) key!932) (ite ((_ is MissingZero!1164) lt!133188) (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6826 lt!133188)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1164) lt!133188) (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6829 lt!133188)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!170499 () SeekEntryResult!1164)

(assert (=> d!63165 (= lt!133188 e!170499)))

(declare-fun c!44865 () Bool)

(assert (=> d!63165 (= c!44865 (and ((_ is Intermediate!1164) lt!133190) (undefined!1976 lt!133190)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12671 (_ BitVec 32)) SeekEntryResult!1164)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!63165 (= lt!133190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11208 thiss!1504)) key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(assert (=> d!63165 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63165 (= (seekEntryOrOpen!0 key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)) lt!133188)))

(declare-fun b!263104 () Bool)

(declare-fun c!44867 () Bool)

(declare-fun lt!133189 () (_ BitVec 64))

(assert (=> b!263104 (= c!44867 (= lt!133189 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170500 () SeekEntryResult!1164)

(assert (=> b!263104 (= e!170500 e!170501)))

(declare-fun b!263105 () Bool)

(assert (=> b!263105 (= e!170499 Undefined!1164)))

(declare-fun b!263106 () Bool)

(assert (=> b!263106 (= e!170501 (MissingZero!1164 (index!6828 lt!133190)))))

(declare-fun b!263107 () Bool)

(assert (=> b!263107 (= e!170499 e!170500)))

(assert (=> b!263107 (= lt!133189 (select (arr!5996 (_keys!7034 thiss!1504)) (index!6828 lt!133190)))))

(declare-fun c!44866 () Bool)

(assert (=> b!263107 (= c!44866 (= lt!133189 key!932))))

(declare-fun b!263108 () Bool)

(assert (=> b!263108 (= e!170500 (Found!1164 (index!6828 lt!133190)))))

(assert (= (and d!63165 c!44865) b!263105))

(assert (= (and d!63165 (not c!44865)) b!263107))

(assert (= (and b!263107 c!44866) b!263108))

(assert (= (and b!263107 (not c!44866)) b!263104))

(assert (= (and b!263104 c!44867) b!263106))

(assert (= (and b!263104 (not c!44867)) b!263103))

(declare-fun m!279351 () Bool)

(assert (=> b!263103 m!279351))

(assert (=> d!63165 m!279317))

(declare-fun m!279353 () Bool)

(assert (=> d!63165 m!279353))

(declare-fun m!279355 () Bool)

(assert (=> d!63165 m!279355))

(assert (=> d!63165 m!279353))

(declare-fun m!279357 () Bool)

(assert (=> d!63165 m!279357))

(declare-fun m!279359 () Bool)

(assert (=> d!63165 m!279359))

(declare-fun m!279361 () Bool)

(assert (=> d!63165 m!279361))

(declare-fun m!279363 () Bool)

(assert (=> b!263107 m!279363))

(assert (=> b!262902 d!63165))

(declare-fun d!63167 () Bool)

(declare-fun res!128497 () Bool)

(declare-fun e!170506 () Bool)

(assert (=> d!63167 (=> res!128497 e!170506)))

(assert (=> d!63167 (= res!128497 (= (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63167 (= (arrayContainsKey!0 (_keys!7034 thiss!1504) key!932 #b00000000000000000000000000000000) e!170506)))

(declare-fun b!263113 () Bool)

(declare-fun e!170507 () Bool)

(assert (=> b!263113 (= e!170506 e!170507)))

(declare-fun res!128498 () Bool)

(assert (=> b!263113 (=> (not res!128498) (not e!170507))))

(assert (=> b!263113 (= res!128498 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun b!263114 () Bool)

(assert (=> b!263114 (= e!170507 (arrayContainsKey!0 (_keys!7034 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63167 (not res!128497)) b!263113))

(assert (= (and b!263113 res!128498) b!263114))

(declare-fun m!279365 () Bool)

(assert (=> d!63167 m!279365))

(declare-fun m!279367 () Bool)

(assert (=> b!263114 m!279367))

(assert (=> bm!25126 d!63167))

(declare-fun d!63169 () Bool)

(assert (=> d!63169 (= (inRange!0 index!297 (mask!11208 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!262913 d!63169))

(declare-fun d!63171 () Bool)

(declare-fun e!170508 () Bool)

(assert (=> d!63171 e!170508))

(declare-fun res!128499 () Bool)

(assert (=> d!63171 (=> res!128499 e!170508)))

(declare-fun lt!133192 () Bool)

(assert (=> d!63171 (= res!128499 (not lt!133192))))

(declare-fun lt!133194 () Bool)

(assert (=> d!63171 (= lt!133192 lt!133194)))

(declare-fun lt!133193 () Unit!8164)

(declare-fun e!170509 () Unit!8164)

(assert (=> d!63171 (= lt!133193 e!170509)))

(declare-fun c!44868 () Bool)

(assert (=> d!63171 (= c!44868 lt!133194)))

(assert (=> d!63171 (= lt!133194 (containsKey!312 (toList!1916 lt!133013) key!932))))

(assert (=> d!63171 (= (contains!1885 lt!133013 key!932) lt!133192)))

(declare-fun b!263115 () Bool)

(declare-fun lt!133191 () Unit!8164)

(assert (=> b!263115 (= e!170509 lt!133191)))

(assert (=> b!263115 (= lt!133191 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133013) key!932))))

(assert (=> b!263115 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133013) key!932))))

(declare-fun b!263116 () Bool)

(declare-fun Unit!8176 () Unit!8164)

(assert (=> b!263116 (= e!170509 Unit!8176)))

(declare-fun b!263117 () Bool)

(assert (=> b!263117 (= e!170508 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133013) key!932)))))

(assert (= (and d!63171 c!44868) b!263115))

(assert (= (and d!63171 (not c!44868)) b!263116))

(assert (= (and d!63171 (not res!128499)) b!263117))

(declare-fun m!279369 () Bool)

(assert (=> d!63171 m!279369))

(declare-fun m!279371 () Bool)

(assert (=> b!263115 m!279371))

(declare-fun m!279373 () Bool)

(assert (=> b!263115 m!279373))

(assert (=> b!263115 m!279373))

(declare-fun m!279375 () Bool)

(assert (=> b!263115 m!279375))

(assert (=> b!263117 m!279373))

(assert (=> b!263117 m!279373))

(assert (=> b!263117 m!279375))

(assert (=> b!262913 d!63171))

(declare-fun b!263160 () Bool)

(declare-fun e!170538 () Bool)

(declare-fun lt!133244 () ListLongMap!3801)

(declare-fun apply!262 (ListLongMap!3801 (_ BitVec 64)) V!8521)

(assert (=> b!263160 (= e!170538 (= (apply!262 lt!133244 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4683 thiss!1504)))))

(declare-fun b!263161 () Bool)

(declare-fun e!170539 () Unit!8164)

(declare-fun Unit!8177 () Unit!8164)

(assert (=> b!263161 (= e!170539 Unit!8177)))

(declare-fun b!263162 () Bool)

(declare-fun e!170545 () Bool)

(declare-fun call!25168 () Bool)

(assert (=> b!263162 (= e!170545 (not call!25168))))

(declare-fun b!263163 () Bool)

(declare-fun e!170548 () Bool)

(assert (=> b!263163 (= e!170545 e!170548)))

(declare-fun res!128519 () Bool)

(assert (=> b!263163 (= res!128519 call!25168)))

(assert (=> b!263163 (=> (not res!128519) (not e!170548))))

(declare-fun b!263165 () Bool)

(declare-fun lt!133246 () Unit!8164)

(assert (=> b!263165 (= e!170539 lt!133246)))

(declare-fun lt!133253 () ListLongMap!3801)

(declare-fun getCurrentListMapNoExtraKeys!578 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) Int) ListLongMap!3801)

(assert (=> b!263165 (= lt!133253 (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133259 () (_ BitVec 64))

(assert (=> b!263165 (= lt!133259 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133242 () (_ BitVec 64))

(assert (=> b!263165 (= lt!133242 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!133248 () Unit!8164)

(declare-fun addStillContains!238 (ListLongMap!3801 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8164)

(assert (=> b!263165 (= lt!133248 (addStillContains!238 lt!133253 lt!133259 (zeroValue!4683 thiss!1504) lt!133242))))

(assert (=> b!263165 (contains!1885 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) lt!133242)))

(declare-fun lt!133239 () Unit!8164)

(assert (=> b!263165 (= lt!133239 lt!133248)))

(declare-fun lt!133256 () ListLongMap!3801)

(assert (=> b!263165 (= lt!133256 (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133247 () (_ BitVec 64))

(assert (=> b!263165 (= lt!133247 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133250 () (_ BitVec 64))

(assert (=> b!263165 (= lt!133250 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!133254 () Unit!8164)

(declare-fun addApplyDifferent!238 (ListLongMap!3801 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8164)

(assert (=> b!263165 (= lt!133254 (addApplyDifferent!238 lt!133256 lt!133247 (minValue!4683 thiss!1504) lt!133250))))

(assert (=> b!263165 (= (apply!262 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) lt!133250) (apply!262 lt!133256 lt!133250))))

(declare-fun lt!133251 () Unit!8164)

(assert (=> b!263165 (= lt!133251 lt!133254)))

(declare-fun lt!133257 () ListLongMap!3801)

(assert (=> b!263165 (= lt!133257 (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133240 () (_ BitVec 64))

(assert (=> b!263165 (= lt!133240 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133260 () (_ BitVec 64))

(assert (=> b!263165 (= lt!133260 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!133241 () Unit!8164)

(assert (=> b!263165 (= lt!133241 (addApplyDifferent!238 lt!133257 lt!133240 (zeroValue!4683 thiss!1504) lt!133260))))

(assert (=> b!263165 (= (apply!262 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) lt!133260) (apply!262 lt!133257 lt!133260))))

(declare-fun lt!133245 () Unit!8164)

(assert (=> b!263165 (= lt!133245 lt!133241)))

(declare-fun lt!133249 () ListLongMap!3801)

(assert (=> b!263165 (= lt!133249 (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133243 () (_ BitVec 64))

(assert (=> b!263165 (= lt!133243 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133258 () (_ BitVec 64))

(assert (=> b!263165 (= lt!133258 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!263165 (= lt!133246 (addApplyDifferent!238 lt!133249 lt!133243 (minValue!4683 thiss!1504) lt!133258))))

(assert (=> b!263165 (= (apply!262 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) lt!133258) (apply!262 lt!133249 lt!133258))))

(declare-fun bm!25160 () Bool)

(declare-fun call!25166 () ListLongMap!3801)

(declare-fun call!25163 () ListLongMap!3801)

(assert (=> bm!25160 (= call!25166 call!25163)))

(declare-fun b!263166 () Bool)

(declare-fun e!170546 () Bool)

(assert (=> b!263166 (= e!170546 e!170545)))

(declare-fun c!44886 () Bool)

(assert (=> b!263166 (= c!44886 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263167 () Bool)

(declare-fun e!170547 () ListLongMap!3801)

(declare-fun call!25169 () ListLongMap!3801)

(assert (=> b!263167 (= e!170547 (+!712 call!25169 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun b!263168 () Bool)

(declare-fun e!170541 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!263168 (= e!170541 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263169 () Bool)

(declare-fun e!170540 () ListLongMap!3801)

(assert (=> b!263169 (= e!170547 e!170540)))

(declare-fun c!44885 () Bool)

(assert (=> b!263169 (= c!44885 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263170 () Bool)

(declare-fun e!170542 () Bool)

(declare-fun get!3099 (ValueCell!2984 V!8521) V!8521)

(declare-fun dynLambda!605 (Int (_ BitVec 64)) V!8521)

(assert (=> b!263170 (= e!170542 (= (apply!262 lt!133244 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263170 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6346 (_values!4825 thiss!1504))))))

(assert (=> b!263170 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun b!263171 () Bool)

(declare-fun res!128523 () Bool)

(assert (=> b!263171 (=> (not res!128523) (not e!170546))))

(declare-fun e!170537 () Bool)

(assert (=> b!263171 (= res!128523 e!170537)))

(declare-fun c!44881 () Bool)

(assert (=> b!263171 (= c!44881 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!25161 () Bool)

(declare-fun call!25165 () ListLongMap!3801)

(assert (=> bm!25161 (= call!25165 (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263172 () Bool)

(declare-fun e!170536 () ListLongMap!3801)

(declare-fun call!25164 () ListLongMap!3801)

(assert (=> b!263172 (= e!170536 call!25164)))

(declare-fun b!263164 () Bool)

(declare-fun e!170544 () Bool)

(assert (=> b!263164 (= e!170544 e!170542)))

(declare-fun res!128524 () Bool)

(assert (=> b!263164 (=> (not res!128524) (not e!170542))))

(assert (=> b!263164 (= res!128524 (contains!1885 lt!133244 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263164 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun d!63173 () Bool)

(assert (=> d!63173 e!170546))

(declare-fun res!128522 () Bool)

(assert (=> d!63173 (=> (not res!128522) (not e!170546))))

(assert (=> d!63173 (= res!128522 (or (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))))

(declare-fun lt!133252 () ListLongMap!3801)

(assert (=> d!63173 (= lt!133244 lt!133252)))

(declare-fun lt!133255 () Unit!8164)

(assert (=> d!63173 (= lt!133255 e!170539)))

(declare-fun c!44884 () Bool)

(declare-fun e!170543 () Bool)

(assert (=> d!63173 (= c!44884 e!170543)))

(declare-fun res!128526 () Bool)

(assert (=> d!63173 (=> (not res!128526) (not e!170543))))

(assert (=> d!63173 (= res!128526 (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63173 (= lt!133252 e!170547)))

(declare-fun c!44882 () Bool)

(assert (=> d!63173 (= c!44882 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63173 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63173 (= (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133244)))

(declare-fun b!263173 () Bool)

(declare-fun c!44883 () Bool)

(assert (=> b!263173 (= c!44883 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!263173 (= e!170540 e!170536)))

(declare-fun bm!25162 () Bool)

(assert (=> bm!25162 (= call!25164 call!25169)))

(declare-fun bm!25163 () Bool)

(assert (=> bm!25163 (= call!25169 (+!712 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166)) (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!263174 () Bool)

(declare-fun call!25167 () Bool)

(assert (=> b!263174 (= e!170537 (not call!25167))))

(declare-fun b!263175 () Bool)

(assert (=> b!263175 (= e!170543 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263176 () Bool)

(assert (=> b!263176 (= e!170548 (= (apply!262 lt!133244 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4683 thiss!1504)))))

(declare-fun b!263177 () Bool)

(assert (=> b!263177 (= e!170536 call!25166)))

(declare-fun bm!25164 () Bool)

(assert (=> bm!25164 (= call!25168 (contains!1885 lt!133244 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263178 () Bool)

(assert (=> b!263178 (= e!170537 e!170538)))

(declare-fun res!128518 () Bool)

(assert (=> b!263178 (= res!128518 call!25167)))

(assert (=> b!263178 (=> (not res!128518) (not e!170538))))

(declare-fun bm!25165 () Bool)

(assert (=> bm!25165 (= call!25167 (contains!1885 lt!133244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25166 () Bool)

(assert (=> bm!25166 (= call!25163 call!25165)))

(declare-fun b!263179 () Bool)

(assert (=> b!263179 (= e!170540 call!25164)))

(declare-fun b!263180 () Bool)

(declare-fun res!128520 () Bool)

(assert (=> b!263180 (=> (not res!128520) (not e!170546))))

(assert (=> b!263180 (= res!128520 e!170544)))

(declare-fun res!128521 () Bool)

(assert (=> b!263180 (=> res!128521 e!170544)))

(assert (=> b!263180 (= res!128521 (not e!170541))))

(declare-fun res!128525 () Bool)

(assert (=> b!263180 (=> (not res!128525) (not e!170541))))

(assert (=> b!263180 (= res!128525 (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(assert (= (and d!63173 c!44882) b!263167))

(assert (= (and d!63173 (not c!44882)) b!263169))

(assert (= (and b!263169 c!44885) b!263179))

(assert (= (and b!263169 (not c!44885)) b!263173))

(assert (= (and b!263173 c!44883) b!263172))

(assert (= (and b!263173 (not c!44883)) b!263177))

(assert (= (or b!263172 b!263177) bm!25160))

(assert (= (or b!263179 bm!25160) bm!25166))

(assert (= (or b!263179 b!263172) bm!25162))

(assert (= (or b!263167 bm!25166) bm!25161))

(assert (= (or b!263167 bm!25162) bm!25163))

(assert (= (and d!63173 res!128526) b!263175))

(assert (= (and d!63173 c!44884) b!263165))

(assert (= (and d!63173 (not c!44884)) b!263161))

(assert (= (and d!63173 res!128522) b!263180))

(assert (= (and b!263180 res!128525) b!263168))

(assert (= (and b!263180 (not res!128521)) b!263164))

(assert (= (and b!263164 res!128524) b!263170))

(assert (= (and b!263180 res!128520) b!263171))

(assert (= (and b!263171 c!44881) b!263178))

(assert (= (and b!263171 (not c!44881)) b!263174))

(assert (= (and b!263178 res!128518) b!263160))

(assert (= (or b!263178 b!263174) bm!25165))

(assert (= (and b!263171 res!128523) b!263166))

(assert (= (and b!263166 c!44886) b!263163))

(assert (= (and b!263166 (not c!44886)) b!263162))

(assert (= (and b!263163 res!128519) b!263176))

(assert (= (or b!263163 b!263162) bm!25164))

(declare-fun b_lambda!8353 () Bool)

(assert (=> (not b_lambda!8353) (not b!263170)))

(declare-fun t!8837 () Bool)

(declare-fun tb!3029 () Bool)

(assert (=> (and b!262905 (= (defaultEntry!4842 thiss!1504) (defaultEntry!4842 thiss!1504)) t!8837) tb!3029))

(declare-fun result!5425 () Bool)

(assert (=> tb!3029 (= result!5425 tp_is_empty!6655)))

(assert (=> b!263170 t!8837))

(declare-fun b_and!13955 () Bool)

(assert (= b_and!13949 (and (=> t!8837 result!5425) b_and!13955)))

(declare-fun m!279377 () Bool)

(assert (=> bm!25161 m!279377))

(assert (=> b!263164 m!279365))

(assert (=> b!263164 m!279365))

(declare-fun m!279379 () Bool)

(assert (=> b!263164 m!279379))

(declare-fun m!279381 () Bool)

(assert (=> bm!25165 m!279381))

(assert (=> b!263170 m!279365))

(declare-fun m!279383 () Bool)

(assert (=> b!263170 m!279383))

(declare-fun m!279385 () Bool)

(assert (=> b!263170 m!279385))

(assert (=> b!263170 m!279383))

(declare-fun m!279387 () Bool)

(assert (=> b!263170 m!279387))

(assert (=> b!263170 m!279385))

(assert (=> b!263170 m!279365))

(declare-fun m!279389 () Bool)

(assert (=> b!263170 m!279389))

(assert (=> d!63173 m!279317))

(declare-fun m!279391 () Bool)

(assert (=> b!263176 m!279391))

(assert (=> b!263168 m!279365))

(assert (=> b!263168 m!279365))

(declare-fun m!279393 () Bool)

(assert (=> b!263168 m!279393))

(declare-fun m!279395 () Bool)

(assert (=> bm!25164 m!279395))

(declare-fun m!279397 () Bool)

(assert (=> b!263167 m!279397))

(assert (=> b!263175 m!279365))

(assert (=> b!263175 m!279365))

(assert (=> b!263175 m!279393))

(declare-fun m!279399 () Bool)

(assert (=> bm!25163 m!279399))

(declare-fun m!279401 () Bool)

(assert (=> b!263165 m!279401))

(declare-fun m!279403 () Bool)

(assert (=> b!263165 m!279403))

(declare-fun m!279405 () Bool)

(assert (=> b!263165 m!279405))

(declare-fun m!279407 () Bool)

(assert (=> b!263165 m!279407))

(declare-fun m!279409 () Bool)

(assert (=> b!263165 m!279409))

(declare-fun m!279411 () Bool)

(assert (=> b!263165 m!279411))

(declare-fun m!279413 () Bool)

(assert (=> b!263165 m!279413))

(declare-fun m!279415 () Bool)

(assert (=> b!263165 m!279415))

(declare-fun m!279417 () Bool)

(assert (=> b!263165 m!279417))

(assert (=> b!263165 m!279407))

(declare-fun m!279419 () Bool)

(assert (=> b!263165 m!279419))

(declare-fun m!279421 () Bool)

(assert (=> b!263165 m!279421))

(declare-fun m!279423 () Bool)

(assert (=> b!263165 m!279423))

(assert (=> b!263165 m!279411))

(assert (=> b!263165 m!279365))

(declare-fun m!279425 () Bool)

(assert (=> b!263165 m!279425))

(declare-fun m!279427 () Bool)

(assert (=> b!263165 m!279427))

(assert (=> b!263165 m!279401))

(assert (=> b!263165 m!279421))

(assert (=> b!263165 m!279377))

(declare-fun m!279429 () Bool)

(assert (=> b!263165 m!279429))

(declare-fun m!279431 () Bool)

(assert (=> b!263160 m!279431))

(assert (=> b!262913 d!63173))

(declare-fun b!263193 () Bool)

(declare-fun e!170560 () Bool)

(declare-fun call!25172 () Bool)

(assert (=> b!263193 (= e!170560 call!25172)))

(declare-fun b!263194 () Bool)

(declare-fun e!170557 () Bool)

(declare-fun contains!1889 (List!3764 (_ BitVec 64)) Bool)

(assert (=> b!263194 (= e!170557 (contains!1889 Nil!3761 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun b!263195 () Bool)

(declare-fun e!170559 () Bool)

(assert (=> b!263195 (= e!170559 e!170560)))

(declare-fun c!44889 () Bool)

(assert (=> b!263195 (= c!44889 (validKeyInArray!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun b!263196 () Bool)

(assert (=> b!263196 (= e!170560 call!25172)))

(declare-fun bm!25169 () Bool)

(assert (=> bm!25169 (= call!25172 (arrayNoDuplicates!0 lt!133005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)))))

(declare-fun b!263197 () Bool)

(declare-fun e!170558 () Bool)

(assert (=> b!263197 (= e!170558 e!170559)))

(declare-fun res!128533 () Bool)

(assert (=> b!263197 (=> (not res!128533) (not e!170559))))

(assert (=> b!263197 (= res!128533 (not e!170557))))

(declare-fun res!128535 () Bool)

(assert (=> b!263197 (=> (not res!128535) (not e!170557))))

(assert (=> b!263197 (= res!128535 (validKeyInArray!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun d!63175 () Bool)

(declare-fun res!128534 () Bool)

(assert (=> d!63175 (=> res!128534 e!170558)))

(assert (=> d!63175 (= res!128534 (bvsge #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(assert (=> d!63175 (= (arrayNoDuplicates!0 lt!133005 #b00000000000000000000000000000000 Nil!3761) e!170558)))

(assert (= (and d!63175 (not res!128534)) b!263197))

(assert (= (and b!263197 res!128535) b!263194))

(assert (= (and b!263197 res!128533) b!263195))

(assert (= (and b!263195 c!44889) b!263196))

(assert (= (and b!263195 (not c!44889)) b!263193))

(assert (= (or b!263196 b!263193) bm!25169))

(declare-fun m!279433 () Bool)

(assert (=> b!263194 m!279433))

(assert (=> b!263194 m!279433))

(declare-fun m!279435 () Bool)

(assert (=> b!263194 m!279435))

(assert (=> b!263195 m!279433))

(assert (=> b!263195 m!279433))

(declare-fun m!279437 () Bool)

(assert (=> b!263195 m!279437))

(assert (=> bm!25169 m!279433))

(declare-fun m!279439 () Bool)

(assert (=> bm!25169 m!279439))

(assert (=> b!263197 m!279433))

(assert (=> b!263197 m!279433))

(assert (=> b!263197 m!279437))

(assert (=> b!262903 d!63175))

(declare-fun d!63177 () Bool)

(declare-fun e!170563 () Bool)

(assert (=> d!63177 e!170563))

(declare-fun res!128538 () Bool)

(assert (=> d!63177 (=> (not res!128538) (not e!170563))))

(assert (=> d!63177 (= res!128538 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6347 (_keys!7034 thiss!1504))) (bvslt index!297 (size!6346 (_values!4825 thiss!1504)))))))

(declare-fun lt!133263 () Unit!8164)

(declare-fun choose!1297 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) (_ BitVec 64) V!8521 Int) Unit!8164)

(assert (=> d!63177 (= lt!133263 (choose!1297 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 key!932 v!346 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!63177 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63177 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!127 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 key!932 v!346 (defaultEntry!4842 thiss!1504)) lt!133263)))

(declare-fun b!263200 () Bool)

(assert (=> b!263200 (= e!170563 (= (+!712 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (tuple2!4887 key!932 v!346)) (getCurrentListMap!1448 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))))

(assert (= (and d!63177 res!128538) b!263200))

(declare-fun m!279441 () Bool)

(assert (=> d!63177 m!279441))

(assert (=> d!63177 m!279317))

(assert (=> b!263200 m!279091))

(declare-fun m!279443 () Bool)

(assert (=> b!263200 m!279443))

(declare-fun m!279445 () Bool)

(assert (=> b!263200 m!279445))

(assert (=> b!263200 m!279091))

(assert (=> b!263200 m!279095))

(assert (=> b!263200 m!279123))

(assert (=> b!262903 d!63177))

(declare-fun d!63179 () Bool)

(declare-fun e!170564 () Bool)

(assert (=> d!63179 e!170564))

(declare-fun res!128539 () Bool)

(assert (=> d!63179 (=> (not res!128539) (not e!170564))))

(declare-fun lt!133265 () ListLongMap!3801)

(assert (=> d!63179 (= res!128539 (contains!1885 lt!133265 (_1!2454 lt!133017)))))

(declare-fun lt!133266 () List!3763)

(assert (=> d!63179 (= lt!133265 (ListLongMap!3802 lt!133266))))

(declare-fun lt!133267 () Unit!8164)

(declare-fun lt!133264 () Unit!8164)

(assert (=> d!63179 (= lt!133267 lt!133264)))

(assert (=> d!63179 (= (getValueByKey!321 lt!133266 (_1!2454 lt!133017)) (Some!326 (_2!2454 lt!133017)))))

(assert (=> d!63179 (= lt!133264 (lemmaContainsTupThenGetReturnValue!177 lt!133266 (_1!2454 lt!133017) (_2!2454 lt!133017)))))

(assert (=> d!63179 (= lt!133266 (insertStrictlySorted!180 (toList!1916 lt!133013) (_1!2454 lt!133017) (_2!2454 lt!133017)))))

(assert (=> d!63179 (= (+!712 lt!133013 lt!133017) lt!133265)))

(declare-fun b!263201 () Bool)

(declare-fun res!128540 () Bool)

(assert (=> b!263201 (=> (not res!128540) (not e!170564))))

(assert (=> b!263201 (= res!128540 (= (getValueByKey!321 (toList!1916 lt!133265) (_1!2454 lt!133017)) (Some!326 (_2!2454 lt!133017))))))

(declare-fun b!263202 () Bool)

(assert (=> b!263202 (= e!170564 (contains!1888 (toList!1916 lt!133265) lt!133017))))

(assert (= (and d!63179 res!128539) b!263201))

(assert (= (and b!263201 res!128540) b!263202))

(declare-fun m!279447 () Bool)

(assert (=> d!63179 m!279447))

(declare-fun m!279449 () Bool)

(assert (=> d!63179 m!279449))

(declare-fun m!279451 () Bool)

(assert (=> d!63179 m!279451))

(declare-fun m!279453 () Bool)

(assert (=> d!63179 m!279453))

(declare-fun m!279455 () Bool)

(assert (=> b!263201 m!279455))

(declare-fun m!279457 () Bool)

(assert (=> b!263202 m!279457))

(assert (=> b!262903 d!63179))

(declare-fun b!263211 () Bool)

(declare-fun e!170569 () (_ BitVec 32))

(assert (=> b!263211 (= e!170569 #b00000000000000000000000000000000)))

(declare-fun b!263212 () Bool)

(declare-fun e!170570 () (_ BitVec 32))

(assert (=> b!263212 (= e!170569 e!170570)))

(declare-fun c!44894 () Bool)

(assert (=> b!263212 (= c!44894 (validKeyInArray!0 (select (arr!5996 lt!133005) index!297)))))

(declare-fun d!63181 () Bool)

(declare-fun lt!133270 () (_ BitVec 32))

(assert (=> d!63181 (and (bvsge lt!133270 #b00000000000000000000000000000000) (bvsle lt!133270 (bvsub (size!6347 lt!133005) index!297)))))

(assert (=> d!63181 (= lt!133270 e!170569)))

(declare-fun c!44895 () Bool)

(assert (=> d!63181 (= c!44895 (bvsge index!297 (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63181 (and (bvsle index!297 (bvadd #b00000000000000000000000000000001 index!297)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6347 lt!133005)))))

(assert (=> d!63181 (= (arrayCountValidKeys!0 lt!133005 index!297 (bvadd #b00000000000000000000000000000001 index!297)) lt!133270)))

(declare-fun b!263213 () Bool)

(declare-fun call!25175 () (_ BitVec 32))

(assert (=> b!263213 (= e!170570 call!25175)))

(declare-fun b!263214 () Bool)

(assert (=> b!263214 (= e!170570 (bvadd #b00000000000000000000000000000001 call!25175))))

(declare-fun bm!25172 () Bool)

(assert (=> bm!25172 (= call!25175 (arrayCountValidKeys!0 lt!133005 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (= (and d!63181 c!44895) b!263211))

(assert (= (and d!63181 (not c!44895)) b!263212))

(assert (= (and b!263212 c!44894) b!263214))

(assert (= (and b!263212 (not c!44894)) b!263213))

(assert (= (or b!263214 b!263213) bm!25172))

(declare-fun m!279459 () Bool)

(assert (=> b!263212 m!279459))

(assert (=> b!263212 m!279459))

(declare-fun m!279461 () Bool)

(assert (=> b!263212 m!279461))

(declare-fun m!279463 () Bool)

(assert (=> bm!25172 m!279463))

(assert (=> b!262903 d!63181))

(declare-fun b!263223 () Bool)

(declare-fun e!170577 () Bool)

(declare-fun call!25178 () Bool)

(assert (=> b!263223 (= e!170577 call!25178)))

(declare-fun bm!25175 () Bool)

(assert (=> bm!25175 (= call!25178 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!133005 (mask!11208 thiss!1504)))))

(declare-fun b!263224 () Bool)

(declare-fun e!170578 () Bool)

(assert (=> b!263224 (= e!170578 call!25178)))

(declare-fun b!263225 () Bool)

(declare-fun e!170579 () Bool)

(assert (=> b!263225 (= e!170579 e!170578)))

(declare-fun c!44898 () Bool)

(assert (=> b!263225 (= c!44898 (validKeyInArray!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun d!63183 () Bool)

(declare-fun res!128546 () Bool)

(assert (=> d!63183 (=> res!128546 e!170579)))

(assert (=> d!63183 (= res!128546 (bvsge #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(assert (=> d!63183 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!133005 (mask!11208 thiss!1504)) e!170579)))

(declare-fun b!263226 () Bool)

(assert (=> b!263226 (= e!170578 e!170577)))

(declare-fun lt!133278 () (_ BitVec 64))

(assert (=> b!263226 (= lt!133278 (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))

(declare-fun lt!133279 () Unit!8164)

(assert (=> b!263226 (= lt!133279 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133005 lt!133278 #b00000000000000000000000000000000))))

(assert (=> b!263226 (arrayContainsKey!0 lt!133005 lt!133278 #b00000000000000000000000000000000)))

(declare-fun lt!133277 () Unit!8164)

(assert (=> b!263226 (= lt!133277 lt!133279)))

(declare-fun res!128545 () Bool)

(assert (=> b!263226 (= res!128545 (= (seekEntryOrOpen!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) lt!133005 (mask!11208 thiss!1504)) (Found!1164 #b00000000000000000000000000000000)))))

(assert (=> b!263226 (=> (not res!128545) (not e!170577))))

(assert (= (and d!63183 (not res!128546)) b!263225))

(assert (= (and b!263225 c!44898) b!263226))

(assert (= (and b!263225 (not c!44898)) b!263224))

(assert (= (and b!263226 res!128545) b!263223))

(assert (= (or b!263223 b!263224) bm!25175))

(declare-fun m!279465 () Bool)

(assert (=> bm!25175 m!279465))

(assert (=> b!263225 m!279433))

(assert (=> b!263225 m!279433))

(assert (=> b!263225 m!279437))

(assert (=> b!263226 m!279433))

(declare-fun m!279467 () Bool)

(assert (=> b!263226 m!279467))

(declare-fun m!279469 () Bool)

(assert (=> b!263226 m!279469))

(assert (=> b!263226 m!279433))

(declare-fun m!279471 () Bool)

(assert (=> b!263226 m!279471))

(assert (=> b!262903 d!63183))

(declare-fun d!63185 () Bool)

(declare-fun e!170582 () Bool)

(assert (=> d!63185 e!170582))

(declare-fun res!128549 () Bool)

(assert (=> d!63185 (=> (not res!128549) (not e!170582))))

(assert (=> d!63185 (= res!128549 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6347 (_keys!7034 thiss!1504)))))))

(declare-fun lt!133282 () Unit!8164)

(declare-fun choose!41 (array!12671 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3764) Unit!8164)

(assert (=> d!63185 (= lt!133282 (choose!41 (_keys!7034 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3761))))

(assert (=> d!63185 (bvslt (size!6347 (_keys!7034 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!63185 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!7034 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3761) lt!133282)))

(declare-fun b!263229 () Bool)

(assert (=> b!263229 (= e!170582 (arrayNoDuplicates!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) #b00000000000000000000000000000000 Nil!3761))))

(assert (= (and d!63185 res!128549) b!263229))

(declare-fun m!279473 () Bool)

(assert (=> d!63185 m!279473))

(assert (=> b!263229 m!279123))

(declare-fun m!279475 () Bool)

(assert (=> b!263229 m!279475))

(assert (=> b!262903 d!63185))

(declare-fun e!170588 () Bool)

(declare-fun b!263241 () Bool)

(assert (=> b!263241 (= e!170588 (= (arrayCountValidKeys!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7034 thiss!1504) #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!263238 () Bool)

(declare-fun res!128558 () Bool)

(declare-fun e!170587 () Bool)

(assert (=> b!263238 (=> (not res!128558) (not e!170587))))

(assert (=> b!263238 (= res!128558 (not (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) index!297))))))

(declare-fun b!263239 () Bool)

(declare-fun res!128560 () Bool)

(assert (=> b!263239 (=> (not res!128560) (not e!170587))))

(assert (=> b!263239 (= res!128560 (validKeyInArray!0 key!932))))

(declare-fun b!263240 () Bool)

(assert (=> b!263240 (= e!170587 (bvslt (size!6347 (_keys!7034 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun d!63187 () Bool)

(assert (=> d!63187 e!170588))

(declare-fun res!128561 () Bool)

(assert (=> d!63187 (=> (not res!128561) (not e!170588))))

(assert (=> d!63187 (= res!128561 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6347 (_keys!7034 thiss!1504)))))))

(declare-fun lt!133285 () Unit!8164)

(declare-fun choose!1 (array!12671 (_ BitVec 32) (_ BitVec 64)) Unit!8164)

(assert (=> d!63187 (= lt!133285 (choose!1 (_keys!7034 thiss!1504) index!297 key!932))))

(assert (=> d!63187 e!170587))

(declare-fun res!128559 () Bool)

(assert (=> d!63187 (=> (not res!128559) (not e!170587))))

(assert (=> d!63187 (= res!128559 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6347 (_keys!7034 thiss!1504)))))))

(assert (=> d!63187 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!7034 thiss!1504) index!297 key!932) lt!133285)))

(assert (= (and d!63187 res!128559) b!263238))

(assert (= (and b!263238 res!128558) b!263239))

(assert (= (and b!263239 res!128560) b!263240))

(assert (= (and d!63187 res!128561) b!263241))

(assert (=> b!263241 m!279123))

(declare-fun m!279477 () Bool)

(assert (=> b!263241 m!279477))

(assert (=> b!263241 m!279107))

(declare-fun m!279479 () Bool)

(assert (=> b!263238 m!279479))

(assert (=> b!263238 m!279479))

(declare-fun m!279481 () Bool)

(assert (=> b!263238 m!279481))

(declare-fun m!279483 () Bool)

(assert (=> b!263239 m!279483))

(declare-fun m!279485 () Bool)

(assert (=> d!63187 m!279485))

(assert (=> b!262903 d!63187))

(declare-fun d!63189 () Bool)

(declare-fun e!170591 () Bool)

(assert (=> d!63189 e!170591))

(declare-fun res!128564 () Bool)

(assert (=> d!63189 (=> (not res!128564) (not e!170591))))

(assert (=> d!63189 (= res!128564 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6347 lt!133005))))))

(declare-fun lt!133288 () Unit!8164)

(declare-fun choose!1298 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 32) Int) Unit!8164)

(assert (=> d!63189 (= lt!133288 (choose!1298 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!63189 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63189 (= (lemmaValidKeyInArrayIsInListMap!151 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 (defaultEntry!4842 thiss!1504)) lt!133288)))

(declare-fun b!263244 () Bool)

(assert (=> b!263244 (= e!170591 (contains!1885 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (select (arr!5996 lt!133005) index!297)))))

(assert (= (and d!63189 res!128564) b!263244))

(declare-fun m!279487 () Bool)

(assert (=> d!63189 m!279487))

(assert (=> d!63189 m!279317))

(assert (=> b!263244 m!279103))

(assert (=> b!263244 m!279459))

(assert (=> b!263244 m!279103))

(assert (=> b!263244 m!279459))

(declare-fun m!279489 () Bool)

(assert (=> b!263244 m!279489))

(assert (=> b!262903 d!63189))

(declare-fun d!63191 () Bool)

(declare-fun res!128571 () Bool)

(declare-fun e!170594 () Bool)

(assert (=> d!63191 (=> (not res!128571) (not e!170594))))

(declare-fun simpleValid!285 (LongMapFixedSize!3868) Bool)

(assert (=> d!63191 (= res!128571 (simpleValid!285 lt!133011))))

(assert (=> d!63191 (= (valid!1513 lt!133011) e!170594)))

(declare-fun b!263251 () Bool)

(declare-fun res!128572 () Bool)

(assert (=> b!263251 (=> (not res!128572) (not e!170594))))

(assert (=> b!263251 (= res!128572 (= (arrayCountValidKeys!0 (_keys!7034 lt!133011) #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))) (_size!1983 lt!133011)))))

(declare-fun b!263252 () Bool)

(declare-fun res!128573 () Bool)

(assert (=> b!263252 (=> (not res!128573) (not e!170594))))

(assert (=> b!263252 (= res!128573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7034 lt!133011) (mask!11208 lt!133011)))))

(declare-fun b!263253 () Bool)

(assert (=> b!263253 (= e!170594 (arrayNoDuplicates!0 (_keys!7034 lt!133011) #b00000000000000000000000000000000 Nil!3761))))

(assert (= (and d!63191 res!128571) b!263251))

(assert (= (and b!263251 res!128572) b!263252))

(assert (= (and b!263252 res!128573) b!263253))

(declare-fun m!279491 () Bool)

(assert (=> d!63191 m!279491))

(declare-fun m!279493 () Bool)

(assert (=> b!263251 m!279493))

(declare-fun m!279495 () Bool)

(assert (=> b!263252 m!279495))

(declare-fun m!279497 () Bool)

(assert (=> b!263253 m!279497))

(assert (=> b!262903 d!63191))

(declare-fun d!63193 () Bool)

(assert (=> d!63193 (arrayContainsKey!0 lt!133005 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!133291 () Unit!8164)

(declare-fun choose!13 (array!12671 (_ BitVec 64) (_ BitVec 32)) Unit!8164)

(assert (=> d!63193 (= lt!133291 (choose!13 lt!133005 key!932 index!297))))

(assert (=> d!63193 (bvsge index!297 #b00000000000000000000000000000000)))

(assert (=> d!63193 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133005 key!932 index!297) lt!133291)))

(declare-fun bs!9269 () Bool)

(assert (= bs!9269 d!63193))

(assert (=> bs!9269 m!279127))

(declare-fun m!279499 () Bool)

(assert (=> bs!9269 m!279499))

(assert (=> b!262903 d!63193))

(assert (=> b!262903 d!63167))

(declare-fun d!63195 () Bool)

(declare-fun e!170597 () Bool)

(assert (=> d!63195 e!170597))

(declare-fun res!128576 () Bool)

(assert (=> d!63195 (=> (not res!128576) (not e!170597))))

(assert (=> d!63195 (= res!128576 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6347 (_keys!7034 thiss!1504)))))))

(declare-fun lt!133294 () Unit!8164)

(declare-fun choose!102 ((_ BitVec 64) array!12671 (_ BitVec 32) (_ BitVec 32)) Unit!8164)

(assert (=> d!63195 (= lt!133294 (choose!102 key!932 (_keys!7034 thiss!1504) index!297 (mask!11208 thiss!1504)))))

(assert (=> d!63195 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63195 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!7034 thiss!1504) index!297 (mask!11208 thiss!1504)) lt!133294)))

(declare-fun b!263256 () Bool)

(assert (=> b!263256 (= e!170597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504)))))

(assert (= (and d!63195 res!128576) b!263256))

(declare-fun m!279501 () Bool)

(assert (=> d!63195 m!279501))

(assert (=> d!63195 m!279317))

(assert (=> b!263256 m!279123))

(declare-fun m!279503 () Bool)

(assert (=> b!263256 m!279503))

(assert (=> b!262903 d!63195))

(declare-fun b!263257 () Bool)

(declare-fun e!170600 () Bool)

(declare-fun lt!133300 () ListLongMap!3801)

(assert (=> b!263257 (= e!170600 (= (apply!262 lt!133300 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4683 thiss!1504)))))

(declare-fun b!263258 () Bool)

(declare-fun e!170601 () Unit!8164)

(declare-fun Unit!8178 () Unit!8164)

(assert (=> b!263258 (= e!170601 Unit!8178)))

(declare-fun b!263259 () Bool)

(declare-fun e!170607 () Bool)

(declare-fun call!25184 () Bool)

(assert (=> b!263259 (= e!170607 (not call!25184))))

(declare-fun b!263260 () Bool)

(declare-fun e!170610 () Bool)

(assert (=> b!263260 (= e!170607 e!170610)))

(declare-fun res!128578 () Bool)

(assert (=> b!263260 (= res!128578 call!25184)))

(assert (=> b!263260 (=> (not res!128578) (not e!170610))))

(declare-fun b!263262 () Bool)

(declare-fun lt!133302 () Unit!8164)

(assert (=> b!263262 (= e!170601 lt!133302)))

(declare-fun lt!133309 () ListLongMap!3801)

(assert (=> b!263262 (= lt!133309 (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133315 () (_ BitVec 64))

(assert (=> b!263262 (= lt!133315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133298 () (_ BitVec 64))

(assert (=> b!263262 (= lt!133298 (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))

(declare-fun lt!133304 () Unit!8164)

(assert (=> b!263262 (= lt!133304 (addStillContains!238 lt!133309 lt!133315 (zeroValue!4683 thiss!1504) lt!133298))))

(assert (=> b!263262 (contains!1885 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) lt!133298)))

(declare-fun lt!133295 () Unit!8164)

(assert (=> b!263262 (= lt!133295 lt!133304)))

(declare-fun lt!133312 () ListLongMap!3801)

(assert (=> b!263262 (= lt!133312 (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133303 () (_ BitVec 64))

(assert (=> b!263262 (= lt!133303 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133306 () (_ BitVec 64))

(assert (=> b!263262 (= lt!133306 (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))

(declare-fun lt!133310 () Unit!8164)

(assert (=> b!263262 (= lt!133310 (addApplyDifferent!238 lt!133312 lt!133303 (minValue!4683 thiss!1504) lt!133306))))

(assert (=> b!263262 (= (apply!262 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) lt!133306) (apply!262 lt!133312 lt!133306))))

(declare-fun lt!133307 () Unit!8164)

(assert (=> b!263262 (= lt!133307 lt!133310)))

(declare-fun lt!133313 () ListLongMap!3801)

(assert (=> b!263262 (= lt!133313 (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133296 () (_ BitVec 64))

(assert (=> b!263262 (= lt!133296 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133316 () (_ BitVec 64))

(assert (=> b!263262 (= lt!133316 (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))

(declare-fun lt!133297 () Unit!8164)

(assert (=> b!263262 (= lt!133297 (addApplyDifferent!238 lt!133313 lt!133296 (zeroValue!4683 thiss!1504) lt!133316))))

(assert (=> b!263262 (= (apply!262 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) lt!133316) (apply!262 lt!133313 lt!133316))))

(declare-fun lt!133301 () Unit!8164)

(assert (=> b!263262 (= lt!133301 lt!133297)))

(declare-fun lt!133305 () ListLongMap!3801)

(assert (=> b!263262 (= lt!133305 (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133299 () (_ BitVec 64))

(assert (=> b!263262 (= lt!133299 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133314 () (_ BitVec 64))

(assert (=> b!263262 (= lt!133314 (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))

(assert (=> b!263262 (= lt!133302 (addApplyDifferent!238 lt!133305 lt!133299 (minValue!4683 thiss!1504) lt!133314))))

(assert (=> b!263262 (= (apply!262 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) lt!133314) (apply!262 lt!133305 lt!133314))))

(declare-fun bm!25176 () Bool)

(declare-fun call!25182 () ListLongMap!3801)

(declare-fun call!25179 () ListLongMap!3801)

(assert (=> bm!25176 (= call!25182 call!25179)))

(declare-fun b!263263 () Bool)

(declare-fun e!170608 () Bool)

(assert (=> b!263263 (= e!170608 e!170607)))

(declare-fun c!44904 () Bool)

(assert (=> b!263263 (= c!44904 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263264 () Bool)

(declare-fun e!170609 () ListLongMap!3801)

(declare-fun call!25185 () ListLongMap!3801)

(assert (=> b!263264 (= e!170609 (+!712 call!25185 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun b!263265 () Bool)

(declare-fun e!170603 () Bool)

(assert (=> b!263265 (= e!170603 (validKeyInArray!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun b!263266 () Bool)

(declare-fun e!170602 () ListLongMap!3801)

(assert (=> b!263266 (= e!170609 e!170602)))

(declare-fun c!44903 () Bool)

(assert (=> b!263266 (= c!44903 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263267 () Bool)

(declare-fun e!170604 () Bool)

(assert (=> b!263267 (= e!170604 (= (apply!262 lt!133300 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263267 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6346 lt!133020)))))

(assert (=> b!263267 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(declare-fun b!263268 () Bool)

(declare-fun res!128582 () Bool)

(assert (=> b!263268 (=> (not res!128582) (not e!170608))))

(declare-fun e!170599 () Bool)

(assert (=> b!263268 (= res!128582 e!170599)))

(declare-fun c!44899 () Bool)

(assert (=> b!263268 (= c!44899 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!25181 () ListLongMap!3801)

(declare-fun bm!25177 () Bool)

(assert (=> bm!25177 (= call!25181 (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263269 () Bool)

(declare-fun e!170598 () ListLongMap!3801)

(declare-fun call!25180 () ListLongMap!3801)

(assert (=> b!263269 (= e!170598 call!25180)))

(declare-fun b!263261 () Bool)

(declare-fun e!170606 () Bool)

(assert (=> b!263261 (= e!170606 e!170604)))

(declare-fun res!128583 () Bool)

(assert (=> b!263261 (=> (not res!128583) (not e!170604))))

(assert (=> b!263261 (= res!128583 (contains!1885 lt!133300 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (=> b!263261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(declare-fun d!63197 () Bool)

(assert (=> d!63197 e!170608))

(declare-fun res!128581 () Bool)

(assert (=> d!63197 (=> (not res!128581) (not e!170608))))

(assert (=> d!63197 (= res!128581 (or (bvsge #b00000000000000000000000000000000 (size!6347 lt!133005)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 lt!133005)))))))

(declare-fun lt!133308 () ListLongMap!3801)

(assert (=> d!63197 (= lt!133300 lt!133308)))

(declare-fun lt!133311 () Unit!8164)

(assert (=> d!63197 (= lt!133311 e!170601)))

(declare-fun c!44902 () Bool)

(declare-fun e!170605 () Bool)

(assert (=> d!63197 (= c!44902 e!170605)))

(declare-fun res!128585 () Bool)

(assert (=> d!63197 (=> (not res!128585) (not e!170605))))

(assert (=> d!63197 (= res!128585 (bvslt #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(assert (=> d!63197 (= lt!133308 e!170609)))

(declare-fun c!44900 () Bool)

(assert (=> d!63197 (= c!44900 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63197 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63197 (= (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133300)))

(declare-fun b!263270 () Bool)

(declare-fun c!44901 () Bool)

(assert (=> b!263270 (= c!44901 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!263270 (= e!170602 e!170598)))

(declare-fun bm!25178 () Bool)

(assert (=> bm!25178 (= call!25180 call!25185)))

(declare-fun bm!25179 () Bool)

(assert (=> bm!25179 (= call!25185 (+!712 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182)) (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!263271 () Bool)

(declare-fun call!25183 () Bool)

(assert (=> b!263271 (= e!170599 (not call!25183))))

(declare-fun b!263272 () Bool)

(assert (=> b!263272 (= e!170605 (validKeyInArray!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun b!263273 () Bool)

(assert (=> b!263273 (= e!170610 (= (apply!262 lt!133300 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4683 thiss!1504)))))

(declare-fun b!263274 () Bool)

(assert (=> b!263274 (= e!170598 call!25182)))

(declare-fun bm!25180 () Bool)

(assert (=> bm!25180 (= call!25184 (contains!1885 lt!133300 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263275 () Bool)

(assert (=> b!263275 (= e!170599 e!170600)))

(declare-fun res!128577 () Bool)

(assert (=> b!263275 (= res!128577 call!25183)))

(assert (=> b!263275 (=> (not res!128577) (not e!170600))))

(declare-fun bm!25181 () Bool)

(assert (=> bm!25181 (= call!25183 (contains!1885 lt!133300 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25182 () Bool)

(assert (=> bm!25182 (= call!25179 call!25181)))

(declare-fun b!263276 () Bool)

(assert (=> b!263276 (= e!170602 call!25180)))

(declare-fun b!263277 () Bool)

(declare-fun res!128579 () Bool)

(assert (=> b!263277 (=> (not res!128579) (not e!170608))))

(assert (=> b!263277 (= res!128579 e!170606)))

(declare-fun res!128580 () Bool)

(assert (=> b!263277 (=> res!128580 e!170606)))

(assert (=> b!263277 (= res!128580 (not e!170603))))

(declare-fun res!128584 () Bool)

(assert (=> b!263277 (=> (not res!128584) (not e!170603))))

(assert (=> b!263277 (= res!128584 (bvslt #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(assert (= (and d!63197 c!44900) b!263264))

(assert (= (and d!63197 (not c!44900)) b!263266))

(assert (= (and b!263266 c!44903) b!263276))

(assert (= (and b!263266 (not c!44903)) b!263270))

(assert (= (and b!263270 c!44901) b!263269))

(assert (= (and b!263270 (not c!44901)) b!263274))

(assert (= (or b!263269 b!263274) bm!25176))

(assert (= (or b!263276 bm!25176) bm!25182))

(assert (= (or b!263276 b!263269) bm!25178))

(assert (= (or b!263264 bm!25182) bm!25177))

(assert (= (or b!263264 bm!25178) bm!25179))

(assert (= (and d!63197 res!128585) b!263272))

(assert (= (and d!63197 c!44902) b!263262))

(assert (= (and d!63197 (not c!44902)) b!263258))

(assert (= (and d!63197 res!128581) b!263277))

(assert (= (and b!263277 res!128584) b!263265))

(assert (= (and b!263277 (not res!128580)) b!263261))

(assert (= (and b!263261 res!128583) b!263267))

(assert (= (and b!263277 res!128579) b!263268))

(assert (= (and b!263268 c!44899) b!263275))

(assert (= (and b!263268 (not c!44899)) b!263271))

(assert (= (and b!263275 res!128577) b!263257))

(assert (= (or b!263275 b!263271) bm!25181))

(assert (= (and b!263268 res!128582) b!263263))

(assert (= (and b!263263 c!44904) b!263260))

(assert (= (and b!263263 (not c!44904)) b!263259))

(assert (= (and b!263260 res!128578) b!263273))

(assert (= (or b!263260 b!263259) bm!25180))

(declare-fun b_lambda!8355 () Bool)

(assert (=> (not b_lambda!8355) (not b!263267)))

(assert (=> b!263267 t!8837))

(declare-fun b_and!13957 () Bool)

(assert (= b_and!13955 (and (=> t!8837 result!5425) b_and!13957)))

(declare-fun m!279505 () Bool)

(assert (=> bm!25177 m!279505))

(assert (=> b!263261 m!279433))

(assert (=> b!263261 m!279433))

(declare-fun m!279507 () Bool)

(assert (=> b!263261 m!279507))

(declare-fun m!279509 () Bool)

(assert (=> bm!25181 m!279509))

(assert (=> b!263267 m!279433))

(assert (=> b!263267 m!279383))

(declare-fun m!279511 () Bool)

(assert (=> b!263267 m!279511))

(assert (=> b!263267 m!279383))

(declare-fun m!279513 () Bool)

(assert (=> b!263267 m!279513))

(assert (=> b!263267 m!279511))

(assert (=> b!263267 m!279433))

(declare-fun m!279515 () Bool)

(assert (=> b!263267 m!279515))

(assert (=> d!63197 m!279317))

(declare-fun m!279517 () Bool)

(assert (=> b!263273 m!279517))

(assert (=> b!263265 m!279433))

(assert (=> b!263265 m!279433))

(assert (=> b!263265 m!279437))

(declare-fun m!279519 () Bool)

(assert (=> bm!25180 m!279519))

(declare-fun m!279521 () Bool)

(assert (=> b!263264 m!279521))

(assert (=> b!263272 m!279433))

(assert (=> b!263272 m!279433))

(assert (=> b!263272 m!279437))

(declare-fun m!279523 () Bool)

(assert (=> bm!25179 m!279523))

(declare-fun m!279525 () Bool)

(assert (=> b!263262 m!279525))

(declare-fun m!279527 () Bool)

(assert (=> b!263262 m!279527))

(declare-fun m!279529 () Bool)

(assert (=> b!263262 m!279529))

(declare-fun m!279531 () Bool)

(assert (=> b!263262 m!279531))

(declare-fun m!279533 () Bool)

(assert (=> b!263262 m!279533))

(declare-fun m!279535 () Bool)

(assert (=> b!263262 m!279535))

(declare-fun m!279537 () Bool)

(assert (=> b!263262 m!279537))

(declare-fun m!279539 () Bool)

(assert (=> b!263262 m!279539))

(declare-fun m!279541 () Bool)

(assert (=> b!263262 m!279541))

(assert (=> b!263262 m!279531))

(declare-fun m!279543 () Bool)

(assert (=> b!263262 m!279543))

(declare-fun m!279545 () Bool)

(assert (=> b!263262 m!279545))

(declare-fun m!279547 () Bool)

(assert (=> b!263262 m!279547))

(assert (=> b!263262 m!279535))

(assert (=> b!263262 m!279433))

(declare-fun m!279549 () Bool)

(assert (=> b!263262 m!279549))

(declare-fun m!279551 () Bool)

(assert (=> b!263262 m!279551))

(assert (=> b!263262 m!279525))

(assert (=> b!263262 m!279545))

(assert (=> b!263262 m!279505))

(declare-fun m!279553 () Bool)

(assert (=> b!263262 m!279553))

(declare-fun m!279555 () Bool)

(assert (=> b!263257 m!279555))

(assert (=> b!262903 d!63197))

(declare-fun b!263278 () Bool)

(declare-fun e!170611 () (_ BitVec 32))

(assert (=> b!263278 (= e!170611 #b00000000000000000000000000000000)))

(declare-fun b!263279 () Bool)

(declare-fun e!170612 () (_ BitVec 32))

(assert (=> b!263279 (= e!170611 e!170612)))

(declare-fun c!44905 () Bool)

(assert (=> b!263279 (= c!44905 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!63199 () Bool)

(declare-fun lt!133317 () (_ BitVec 32))

(assert (=> d!63199 (and (bvsge lt!133317 #b00000000000000000000000000000000) (bvsle lt!133317 (bvsub (size!6347 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63199 (= lt!133317 e!170611)))

(declare-fun c!44906 () Bool)

(assert (=> d!63199 (= c!44906 (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63199 (and (bvsle #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6347 (_keys!7034 thiss!1504)) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63199 (= (arrayCountValidKeys!0 (_keys!7034 thiss!1504) #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) lt!133317)))

(declare-fun b!263280 () Bool)

(declare-fun call!25186 () (_ BitVec 32))

(assert (=> b!263280 (= e!170612 call!25186)))

(declare-fun b!263281 () Bool)

(assert (=> b!263281 (= e!170612 (bvadd #b00000000000000000000000000000001 call!25186))))

(declare-fun bm!25183 () Bool)

(assert (=> bm!25183 (= call!25186 (arrayCountValidKeys!0 (_keys!7034 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (= (and d!63199 c!44906) b!263278))

(assert (= (and d!63199 (not c!44906)) b!263279))

(assert (= (and b!263279 c!44905) b!263281))

(assert (= (and b!263279 (not c!44905)) b!263280))

(assert (= (or b!263281 b!263280) bm!25183))

(assert (=> b!263279 m!279365))

(assert (=> b!263279 m!279365))

(assert (=> b!263279 m!279393))

(declare-fun m!279557 () Bool)

(assert (=> bm!25183 m!279557))

(assert (=> b!262903 d!63199))

(declare-fun b!263282 () Bool)

(declare-fun e!170613 () (_ BitVec 32))

(assert (=> b!263282 (= e!170613 #b00000000000000000000000000000000)))

(declare-fun b!263283 () Bool)

(declare-fun e!170614 () (_ BitVec 32))

(assert (=> b!263283 (= e!170613 e!170614)))

(declare-fun c!44907 () Bool)

(assert (=> b!263283 (= c!44907 (validKeyInArray!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun d!63201 () Bool)

(declare-fun lt!133318 () (_ BitVec 32))

(assert (=> d!63201 (and (bvsge lt!133318 #b00000000000000000000000000000000) (bvsle lt!133318 (bvsub (size!6347 lt!133005) #b00000000000000000000000000000000)))))

(assert (=> d!63201 (= lt!133318 e!170613)))

(declare-fun c!44908 () Bool)

(assert (=> d!63201 (= c!44908 (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63201 (and (bvsle #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6347 (_keys!7034 thiss!1504)) (size!6347 lt!133005)))))

(assert (=> d!63201 (= (arrayCountValidKeys!0 lt!133005 #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) lt!133318)))

(declare-fun b!263284 () Bool)

(declare-fun call!25187 () (_ BitVec 32))

(assert (=> b!263284 (= e!170614 call!25187)))

(declare-fun b!263285 () Bool)

(assert (=> b!263285 (= e!170614 (bvadd #b00000000000000000000000000000001 call!25187))))

(declare-fun bm!25184 () Bool)

(assert (=> bm!25184 (= call!25187 (arrayCountValidKeys!0 lt!133005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (= (and d!63201 c!44908) b!263282))

(assert (= (and d!63201 (not c!44908)) b!263283))

(assert (= (and b!263283 c!44907) b!263285))

(assert (= (and b!263283 (not c!44907)) b!263284))

(assert (= (or b!263285 b!263284) bm!25184))

(assert (=> b!263283 m!279433))

(assert (=> b!263283 m!279433))

(assert (=> b!263283 m!279437))

(declare-fun m!279559 () Bool)

(assert (=> bm!25184 m!279559))

(assert (=> b!262903 d!63201))

(declare-fun d!63203 () Bool)

(declare-fun e!170615 () Bool)

(assert (=> d!63203 e!170615))

(declare-fun res!128586 () Bool)

(assert (=> d!63203 (=> res!128586 e!170615)))

(declare-fun lt!133320 () Bool)

(assert (=> d!63203 (= res!128586 (not lt!133320))))

(declare-fun lt!133322 () Bool)

(assert (=> d!63203 (= lt!133320 lt!133322)))

(declare-fun lt!133321 () Unit!8164)

(declare-fun e!170616 () Unit!8164)

(assert (=> d!63203 (= lt!133321 e!170616)))

(declare-fun c!44909 () Bool)

(assert (=> d!63203 (= c!44909 lt!133322)))

(assert (=> d!63203 (= lt!133322 (containsKey!312 (toList!1916 lt!133003) key!932))))

(assert (=> d!63203 (= (contains!1885 lt!133003 key!932) lt!133320)))

(declare-fun b!263286 () Bool)

(declare-fun lt!133319 () Unit!8164)

(assert (=> b!263286 (= e!170616 lt!133319)))

(assert (=> b!263286 (= lt!133319 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133003) key!932))))

(assert (=> b!263286 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133003) key!932))))

(declare-fun b!263287 () Bool)

(declare-fun Unit!8179 () Unit!8164)

(assert (=> b!263287 (= e!170616 Unit!8179)))

(declare-fun b!263288 () Bool)

(assert (=> b!263288 (= e!170615 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133003) key!932)))))

(assert (= (and d!63203 c!44909) b!263286))

(assert (= (and d!63203 (not c!44909)) b!263287))

(assert (= (and d!63203 (not res!128586)) b!263288))

(declare-fun m!279561 () Bool)

(assert (=> d!63203 m!279561))

(declare-fun m!279563 () Bool)

(assert (=> b!263286 m!279563))

(declare-fun m!279565 () Bool)

(assert (=> b!263286 m!279565))

(assert (=> b!263286 m!279565))

(declare-fun m!279567 () Bool)

(assert (=> b!263286 m!279567))

(assert (=> b!263288 m!279565))

(assert (=> b!263288 m!279565))

(assert (=> b!263288 m!279567))

(assert (=> b!262903 d!63203))

(declare-fun d!63205 () Bool)

(assert (=> d!63205 (= (arrayCountValidKeys!0 lt!133005 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!133325 () Unit!8164)

(declare-fun choose!2 (array!12671 (_ BitVec 32)) Unit!8164)

(assert (=> d!63205 (= lt!133325 (choose!2 lt!133005 index!297))))

(declare-fun e!170619 () Bool)

(assert (=> d!63205 e!170619))

(declare-fun res!128591 () Bool)

(assert (=> d!63205 (=> (not res!128591) (not e!170619))))

(assert (=> d!63205 (= res!128591 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6347 lt!133005))))))

(assert (=> d!63205 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!133005 index!297) lt!133325)))

(declare-fun b!263293 () Bool)

(declare-fun res!128592 () Bool)

(assert (=> b!263293 (=> (not res!128592) (not e!170619))))

(assert (=> b!263293 (= res!128592 (validKeyInArray!0 (select (arr!5996 lt!133005) index!297)))))

(declare-fun b!263294 () Bool)

(assert (=> b!263294 (= e!170619 (bvslt (size!6347 lt!133005) #b01111111111111111111111111111111))))

(assert (= (and d!63205 res!128591) b!263293))

(assert (= (and b!263293 res!128592) b!263294))

(declare-fun m!279569 () Bool)

(assert (=> d!63205 m!279569))

(declare-fun m!279571 () Bool)

(assert (=> d!63205 m!279571))

(assert (=> b!263293 m!279459))

(assert (=> b!263293 m!279459))

(assert (=> b!263293 m!279461))

(assert (=> b!262903 d!63205))

(declare-fun d!63207 () Bool)

(declare-fun res!128593 () Bool)

(declare-fun e!170620 () Bool)

(assert (=> d!63207 (=> res!128593 e!170620)))

(assert (=> d!63207 (= res!128593 (= (select (arr!5996 lt!133005) #b00000000000000000000000000000000) key!932))))

(assert (=> d!63207 (= (arrayContainsKey!0 lt!133005 key!932 #b00000000000000000000000000000000) e!170620)))

(declare-fun b!263295 () Bool)

(declare-fun e!170621 () Bool)

(assert (=> b!263295 (= e!170620 e!170621)))

(declare-fun res!128594 () Bool)

(assert (=> b!263295 (=> (not res!128594) (not e!170621))))

(assert (=> b!263295 (= res!128594 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(declare-fun b!263296 () Bool)

(assert (=> b!263296 (= e!170621 (arrayContainsKey!0 lt!133005 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63207 (not res!128593)) b!263295))

(assert (= (and b!263295 res!128594) b!263296))

(assert (=> d!63207 m!279433))

(declare-fun m!279573 () Bool)

(assert (=> b!263296 m!279573))

(assert (=> b!262903 d!63207))

(declare-fun d!63209 () Bool)

(declare-fun e!170624 () Bool)

(assert (=> d!63209 e!170624))

(declare-fun res!128599 () Bool)

(assert (=> d!63209 (=> (not res!128599) (not e!170624))))

(declare-fun lt!133330 () SeekEntryResult!1164)

(assert (=> d!63209 (= res!128599 ((_ is Found!1164) lt!133330))))

(assert (=> d!63209 (= lt!133330 (seekEntryOrOpen!0 key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun lt!133331 () Unit!8164)

(declare-fun choose!1299 (array!12671 array!12669 (_ BitVec 32) (_ BitVec 32) V!8521 V!8521 (_ BitVec 64) Int) Unit!8164)

(assert (=> d!63209 (= lt!133331 (choose!1299 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!63209 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63209 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!450 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)) lt!133331)))

(declare-fun b!263301 () Bool)

(declare-fun res!128600 () Bool)

(assert (=> b!263301 (=> (not res!128600) (not e!170624))))

(assert (=> b!263301 (= res!128600 (inRange!0 (index!6827 lt!133330) (mask!11208 thiss!1504)))))

(declare-fun b!263302 () Bool)

(assert (=> b!263302 (= e!170624 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6827 lt!133330)) key!932))))

(assert (=> b!263302 (and (bvsge (index!6827 lt!133330) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133330) (size!6347 (_keys!7034 thiss!1504))))))

(assert (= (and d!63209 res!128599) b!263301))

(assert (= (and b!263301 res!128600) b!263302))

(assert (=> d!63209 m!279139))

(declare-fun m!279575 () Bool)

(assert (=> d!63209 m!279575))

(assert (=> d!63209 m!279317))

(declare-fun m!279577 () Bool)

(assert (=> b!263301 m!279577))

(declare-fun m!279579 () Bool)

(assert (=> b!263302 m!279579))

(assert (=> b!262914 d!63209))

(declare-fun d!63211 () Bool)

(declare-fun res!128601 () Bool)

(declare-fun e!170625 () Bool)

(assert (=> d!63211 (=> (not res!128601) (not e!170625))))

(assert (=> d!63211 (= res!128601 (simpleValid!285 thiss!1504))))

(assert (=> d!63211 (= (valid!1513 thiss!1504) e!170625)))

(declare-fun b!263303 () Bool)

(declare-fun res!128602 () Bool)

(assert (=> b!263303 (=> (not res!128602) (not e!170625))))

(assert (=> b!263303 (= res!128602 (= (arrayCountValidKeys!0 (_keys!7034 thiss!1504) #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) (_size!1983 thiss!1504)))))

(declare-fun b!263304 () Bool)

(declare-fun res!128603 () Bool)

(assert (=> b!263304 (=> (not res!128603) (not e!170625))))

(assert (=> b!263304 (= res!128603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun b!263305 () Bool)

(assert (=> b!263305 (= e!170625 (arrayNoDuplicates!0 (_keys!7034 thiss!1504) #b00000000000000000000000000000000 Nil!3761))))

(assert (= (and d!63211 res!128601) b!263303))

(assert (= (and b!263303 res!128602) b!263304))

(assert (= (and b!263304 res!128603) b!263305))

(declare-fun m!279581 () Bool)

(assert (=> d!63211 m!279581))

(assert (=> b!263303 m!279107))

(declare-fun m!279583 () Bool)

(assert (=> b!263304 m!279583))

(declare-fun m!279585 () Bool)

(assert (=> b!263305 m!279585))

(assert (=> start!25240 d!63211))

(declare-fun d!63213 () Bool)

(assert (=> d!63213 (= (array_inv!3947 (_keys!7034 thiss!1504)) (bvsge (size!6347 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262905 d!63213))

(declare-fun d!63215 () Bool)

(assert (=> d!63215 (= (array_inv!3948 (_values!4825 thiss!1504)) (bvsge (size!6346 (_values!4825 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!262905 d!63215))

(declare-fun mapIsEmpty!11356 () Bool)

(declare-fun mapRes!11356 () Bool)

(assert (=> mapIsEmpty!11356 mapRes!11356))

(declare-fun b!263313 () Bool)

(declare-fun e!170630 () Bool)

(assert (=> b!263313 (= e!170630 tp_is_empty!6655)))

(declare-fun mapNonEmpty!11356 () Bool)

(declare-fun tp!23731 () Bool)

(declare-fun e!170631 () Bool)

(assert (=> mapNonEmpty!11356 (= mapRes!11356 (and tp!23731 e!170631))))

(declare-fun mapValue!11356 () ValueCell!2984)

(declare-fun mapRest!11356 () (Array (_ BitVec 32) ValueCell!2984))

(declare-fun mapKey!11356 () (_ BitVec 32))

(assert (=> mapNonEmpty!11356 (= mapRest!11347 (store mapRest!11356 mapKey!11356 mapValue!11356))))

(declare-fun b!263312 () Bool)

(assert (=> b!263312 (= e!170631 tp_is_empty!6655)))

(declare-fun condMapEmpty!11356 () Bool)

(declare-fun mapDefault!11356 () ValueCell!2984)

(assert (=> mapNonEmpty!11347 (= condMapEmpty!11356 (= mapRest!11347 ((as const (Array (_ BitVec 32) ValueCell!2984)) mapDefault!11356)))))

(assert (=> mapNonEmpty!11347 (= tp!23715 (and e!170630 mapRes!11356))))

(assert (= (and mapNonEmpty!11347 condMapEmpty!11356) mapIsEmpty!11356))

(assert (= (and mapNonEmpty!11347 (not condMapEmpty!11356)) mapNonEmpty!11356))

(assert (= (and mapNonEmpty!11356 ((_ is ValueCellFull!2984) mapValue!11356)) b!263312))

(assert (= (and mapNonEmpty!11347 ((_ is ValueCellFull!2984) mapDefault!11356)) b!263313))

(declare-fun m!279587 () Bool)

(assert (=> mapNonEmpty!11356 m!279587))

(declare-fun b_lambda!8357 () Bool)

(assert (= b_lambda!8353 (or (and b!262905 b_free!6793) b_lambda!8357)))

(declare-fun b_lambda!8359 () Bool)

(assert (= b_lambda!8355 (or (and b!262905 b_free!6793) b_lambda!8359)))

(check-sat (not b!263226) (not d!63195) (not b!263160) (not d!63211) (not b!263241) (not d!63159) (not b!263164) (not b!263202) (not b_next!6793) (not b!263253) (not b!263273) (not bm!25169) (not d!63155) (not d!63193) (not b!263176) (not b!263264) (not bm!25172) (not d!63185) (not bm!25180) (not b!263225) (not b!263201) (not d!63191) (not b!263084) (not bm!25164) (not d!63197) (not b_lambda!8359) (not b!263262) (not b!263090) (not d!63203) (not b!263304) (not d!63171) (not bm!25177) (not b!263267) (not b!263170) (not b!263244) (not b!263283) (not d!63179) (not d!63189) (not d!63205) (not b!263257) (not b!263265) (not bm!25144) (not bm!25161) (not b!263305) (not d!63165) (not b!263117) (not bm!25181) (not b!263082) (not b!263303) (not b!263175) (not bm!25145) (not b!263286) (not b!263167) (not bm!25179) (not d!63177) (not b!263293) (not d!63151) (not b!263195) (not bm!25175) (not b!263239) (not d!63173) (not b!263114) (not b!263261) (not b!263115) b_and!13957 (not b!263197) (not b!263168) (not d!63163) (not d!63153) (not b!263103) (not b!263200) (not b!263288) (not b!263089) (not b!263165) (not b!263301) (not mapNonEmpty!11356) (not bm!25163) (not b!263251) (not d!63209) (not b_lambda!8357) (not bm!25183) (not b!263194) (not b!263229) (not b!263279) (not b!263212) (not b!263256) (not b!263252) (not b!263272) (not d!63161) (not bm!25165) tp_is_empty!6655 (not b!263238) (not b!263296) (not d!63187) (not bm!25184))
(check-sat b_and!13957 (not b_next!6793))
(get-model)

(declare-fun d!63217 () Bool)

(declare-fun e!170632 () Bool)

(assert (=> d!63217 e!170632))

(declare-fun res!128604 () Bool)

(assert (=> d!63217 (=> res!128604 e!170632)))

(declare-fun lt!133333 () Bool)

(assert (=> d!63217 (= res!128604 (not lt!133333))))

(declare-fun lt!133335 () Bool)

(assert (=> d!63217 (= lt!133333 lt!133335)))

(declare-fun lt!133334 () Unit!8164)

(declare-fun e!170633 () Unit!8164)

(assert (=> d!63217 (= lt!133334 e!170633)))

(declare-fun c!44910 () Bool)

(assert (=> d!63217 (= c!44910 lt!133335)))

(assert (=> d!63217 (= lt!133335 (containsKey!312 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63217 (= (contains!1885 lt!133300 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133333)))

(declare-fun b!263314 () Bool)

(declare-fun lt!133332 () Unit!8164)

(assert (=> b!263314 (= e!170633 lt!133332)))

(assert (=> b!263314 (= lt!133332 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263314 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263315 () Bool)

(declare-fun Unit!8180 () Unit!8164)

(assert (=> b!263315 (= e!170633 Unit!8180)))

(declare-fun b!263316 () Bool)

(assert (=> b!263316 (= e!170632 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63217 c!44910) b!263314))

(assert (= (and d!63217 (not c!44910)) b!263315))

(assert (= (and d!63217 (not res!128604)) b!263316))

(declare-fun m!279589 () Bool)

(assert (=> d!63217 m!279589))

(declare-fun m!279591 () Bool)

(assert (=> b!263314 m!279591))

(declare-fun m!279593 () Bool)

(assert (=> b!263314 m!279593))

(assert (=> b!263314 m!279593))

(declare-fun m!279595 () Bool)

(assert (=> b!263314 m!279595))

(assert (=> b!263316 m!279593))

(assert (=> b!263316 m!279593))

(assert (=> b!263316 m!279595))

(assert (=> bm!25180 d!63217))

(declare-fun b!263317 () Bool)

(declare-fun e!170634 () Bool)

(declare-fun call!25188 () Bool)

(assert (=> b!263317 (= e!170634 call!25188)))

(declare-fun bm!25185 () Bool)

(assert (=> bm!25185 (= call!25188 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7034 lt!133011) (mask!11208 lt!133011)))))

(declare-fun b!263318 () Bool)

(declare-fun e!170635 () Bool)

(assert (=> b!263318 (= e!170635 call!25188)))

(declare-fun b!263319 () Bool)

(declare-fun e!170636 () Bool)

(assert (=> b!263319 (= e!170636 e!170635)))

(declare-fun c!44911 () Bool)

(assert (=> b!263319 (= c!44911 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun d!63219 () Bool)

(declare-fun res!128606 () Bool)

(assert (=> d!63219 (=> res!128606 e!170636)))

(assert (=> d!63219 (= res!128606 (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(assert (=> d!63219 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7034 lt!133011) (mask!11208 lt!133011)) e!170636)))

(declare-fun b!263320 () Bool)

(assert (=> b!263320 (= e!170635 e!170634)))

(declare-fun lt!133337 () (_ BitVec 64))

(assert (=> b!263320 (= lt!133337 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000))))

(declare-fun lt!133338 () Unit!8164)

(assert (=> b!263320 (= lt!133338 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7034 lt!133011) lt!133337 #b00000000000000000000000000000000))))

(assert (=> b!263320 (arrayContainsKey!0 (_keys!7034 lt!133011) lt!133337 #b00000000000000000000000000000000)))

(declare-fun lt!133336 () Unit!8164)

(assert (=> b!263320 (= lt!133336 lt!133338)))

(declare-fun res!128605 () Bool)

(assert (=> b!263320 (= res!128605 (= (seekEntryOrOpen!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) (_keys!7034 lt!133011) (mask!11208 lt!133011)) (Found!1164 #b00000000000000000000000000000000)))))

(assert (=> b!263320 (=> (not res!128605) (not e!170634))))

(assert (= (and d!63219 (not res!128606)) b!263319))

(assert (= (and b!263319 c!44911) b!263320))

(assert (= (and b!263319 (not c!44911)) b!263318))

(assert (= (and b!263320 res!128605) b!263317))

(assert (= (or b!263317 b!263318) bm!25185))

(declare-fun m!279597 () Bool)

(assert (=> bm!25185 m!279597))

(declare-fun m!279599 () Bool)

(assert (=> b!263319 m!279599))

(assert (=> b!263319 m!279599))

(declare-fun m!279601 () Bool)

(assert (=> b!263319 m!279601))

(assert (=> b!263320 m!279599))

(declare-fun m!279603 () Bool)

(assert (=> b!263320 m!279603))

(declare-fun m!279605 () Bool)

(assert (=> b!263320 m!279605))

(assert (=> b!263320 m!279599))

(declare-fun m!279607 () Bool)

(assert (=> b!263320 m!279607))

(assert (=> b!263252 d!63219))

(declare-fun d!63221 () Bool)

(declare-fun res!128611 () Bool)

(declare-fun e!170641 () Bool)

(assert (=> d!63221 (=> res!128611 e!170641)))

(assert (=> d!63221 (= res!128611 (and ((_ is Cons!3759) (toList!1916 lt!133019)) (= (_1!2454 (h!4425 (toList!1916 lt!133019))) key!932)))))

(assert (=> d!63221 (= (containsKey!312 (toList!1916 lt!133019) key!932) e!170641)))

(declare-fun b!263325 () Bool)

(declare-fun e!170642 () Bool)

(assert (=> b!263325 (= e!170641 e!170642)))

(declare-fun res!128612 () Bool)

(assert (=> b!263325 (=> (not res!128612) (not e!170642))))

(assert (=> b!263325 (= res!128612 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133019))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133019))) key!932)) ((_ is Cons!3759) (toList!1916 lt!133019)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133019))) key!932)))))

(declare-fun b!263326 () Bool)

(assert (=> b!263326 (= e!170642 (containsKey!312 (t!8832 (toList!1916 lt!133019)) key!932))))

(assert (= (and d!63221 (not res!128611)) b!263325))

(assert (= (and b!263325 res!128612) b!263326))

(declare-fun m!279609 () Bool)

(assert (=> b!263326 m!279609))

(assert (=> d!63153 d!63221))

(declare-fun b!263327 () Bool)

(declare-fun e!170646 () Bool)

(declare-fun call!25189 () Bool)

(assert (=> b!263327 (= e!170646 call!25189)))

(declare-fun b!263328 () Bool)

(declare-fun e!170643 () Bool)

(assert (=> b!263328 (= e!170643 (contains!1889 Nil!3761 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263329 () Bool)

(declare-fun e!170645 () Bool)

(assert (=> b!263329 (= e!170645 e!170646)))

(declare-fun c!44912 () Bool)

(assert (=> b!263329 (= c!44912 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263330 () Bool)

(assert (=> b!263330 (= e!170646 call!25189)))

(declare-fun bm!25186 () Bool)

(assert (=> bm!25186 (= call!25189 (arrayNoDuplicates!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44912 (Cons!3760 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) Nil!3761) Nil!3761)))))

(declare-fun b!263331 () Bool)

(declare-fun e!170644 () Bool)

(assert (=> b!263331 (= e!170644 e!170645)))

(declare-fun res!128613 () Bool)

(assert (=> b!263331 (=> (not res!128613) (not e!170645))))

(assert (=> b!263331 (= res!128613 (not e!170643))))

(declare-fun res!128615 () Bool)

(assert (=> b!263331 (=> (not res!128615) (not e!170643))))

(assert (=> b!263331 (= res!128615 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!63223 () Bool)

(declare-fun res!128614 () Bool)

(assert (=> d!63223 (=> res!128614 e!170644)))

(assert (=> d!63223 (= res!128614 (bvsge #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(assert (=> d!63223 (= (arrayNoDuplicates!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) #b00000000000000000000000000000000 Nil!3761) e!170644)))

(assert (= (and d!63223 (not res!128614)) b!263331))

(assert (= (and b!263331 res!128615) b!263328))

(assert (= (and b!263331 res!128613) b!263329))

(assert (= (and b!263329 c!44912) b!263330))

(assert (= (and b!263329 (not c!44912)) b!263327))

(assert (= (or b!263330 b!263327) bm!25186))

(declare-fun m!279611 () Bool)

(assert (=> b!263328 m!279611))

(assert (=> b!263328 m!279611))

(declare-fun m!279613 () Bool)

(assert (=> b!263328 m!279613))

(assert (=> b!263329 m!279611))

(assert (=> b!263329 m!279611))

(declare-fun m!279615 () Bool)

(assert (=> b!263329 m!279615))

(assert (=> bm!25186 m!279611))

(declare-fun m!279617 () Bool)

(assert (=> bm!25186 m!279617))

(assert (=> b!263331 m!279611))

(assert (=> b!263331 m!279611))

(assert (=> b!263331 m!279615))

(assert (=> b!263229 d!63223))

(declare-fun d!63225 () Bool)

(assert (=> d!63225 (= (validKeyInArray!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) (and (not (= (select (arr!5996 lt!133005) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5996 lt!133005) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263283 d!63225))

(assert (=> b!263197 d!63225))

(declare-fun b!263332 () Bool)

(declare-fun e!170647 () (_ BitVec 32))

(assert (=> b!263332 (= e!170647 #b00000000000000000000000000000000)))

(declare-fun b!263333 () Bool)

(declare-fun e!170648 () (_ BitVec 32))

(assert (=> b!263333 (= e!170647 e!170648)))

(declare-fun c!44913 () Bool)

(assert (=> b!263333 (= c!44913 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun lt!133339 () (_ BitVec 32))

(declare-fun d!63227 () Bool)

(assert (=> d!63227 (and (bvsge lt!133339 #b00000000000000000000000000000000) (bvsle lt!133339 (bvsub (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!63227 (= lt!133339 e!170647)))

(declare-fun c!44914 () Bool)

(assert (=> d!63227 (= c!44914 (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63227 (and (bvsle #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6347 (_keys!7034 thiss!1504)) (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(assert (=> d!63227 (= (arrayCountValidKeys!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) lt!133339)))

(declare-fun b!263334 () Bool)

(declare-fun call!25190 () (_ BitVec 32))

(assert (=> b!263334 (= e!170648 call!25190)))

(declare-fun b!263335 () Bool)

(assert (=> b!263335 (= e!170648 (bvadd #b00000000000000000000000000000001 call!25190))))

(declare-fun bm!25187 () Bool)

(assert (=> bm!25187 (= call!25190 (arrayCountValidKeys!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (= (and d!63227 c!44914) b!263332))

(assert (= (and d!63227 (not c!44914)) b!263333))

(assert (= (and b!263333 c!44913) b!263335))

(assert (= (and b!263333 (not c!44913)) b!263334))

(assert (= (or b!263335 b!263334) bm!25187))

(assert (=> b!263333 m!279611))

(assert (=> b!263333 m!279611))

(assert (=> b!263333 m!279615))

(declare-fun m!279619 () Bool)

(assert (=> bm!25187 m!279619))

(assert (=> b!263241 d!63227))

(assert (=> b!263241 d!63199))

(declare-fun d!63229 () Bool)

(declare-fun e!170649 () Bool)

(assert (=> d!63229 e!170649))

(declare-fun res!128616 () Bool)

(assert (=> d!63229 (=> res!128616 e!170649)))

(declare-fun lt!133341 () Bool)

(assert (=> d!63229 (= res!128616 (not lt!133341))))

(declare-fun lt!133343 () Bool)

(assert (=> d!63229 (= lt!133341 lt!133343)))

(declare-fun lt!133342 () Unit!8164)

(declare-fun e!170650 () Unit!8164)

(assert (=> d!63229 (= lt!133342 e!170650)))

(declare-fun c!44915 () Bool)

(assert (=> d!63229 (= c!44915 lt!133343)))

(assert (=> d!63229 (= lt!133343 (containsKey!312 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63229 (= (contains!1885 lt!133300 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133341)))

(declare-fun b!263336 () Bool)

(declare-fun lt!133340 () Unit!8164)

(assert (=> b!263336 (= e!170650 lt!133340)))

(assert (=> b!263336 (= lt!133340 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263336 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263337 () Bool)

(declare-fun Unit!8181 () Unit!8164)

(assert (=> b!263337 (= e!170650 Unit!8181)))

(declare-fun b!263338 () Bool)

(assert (=> b!263338 (= e!170649 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63229 c!44915) b!263336))

(assert (= (and d!63229 (not c!44915)) b!263337))

(assert (= (and d!63229 (not res!128616)) b!263338))

(declare-fun m!279621 () Bool)

(assert (=> d!63229 m!279621))

(declare-fun m!279623 () Bool)

(assert (=> b!263336 m!279623))

(declare-fun m!279625 () Bool)

(assert (=> b!263336 m!279625))

(assert (=> b!263336 m!279625))

(declare-fun m!279627 () Bool)

(assert (=> b!263336 m!279627))

(assert (=> b!263338 m!279625))

(assert (=> b!263338 m!279625))

(assert (=> b!263338 m!279627))

(assert (=> bm!25181 d!63229))

(declare-fun d!63231 () Bool)

(assert (=> d!63231 (arrayNoDuplicates!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) #b00000000000000000000000000000000 Nil!3761)))

(assert (=> d!63231 true))

(declare-fun _$65!98 () Unit!8164)

(assert (=> d!63231 (= (choose!41 (_keys!7034 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3761) _$65!98)))

(declare-fun bs!9270 () Bool)

(assert (= bs!9270 d!63231))

(assert (=> bs!9270 m!279123))

(assert (=> bs!9270 m!279475))

(assert (=> d!63185 d!63231))

(declare-fun d!63233 () Bool)

(declare-fun e!170651 () Bool)

(assert (=> d!63233 e!170651))

(declare-fun res!128617 () Bool)

(assert (=> d!63233 (=> res!128617 e!170651)))

(declare-fun lt!133345 () Bool)

(assert (=> d!63233 (= res!128617 (not lt!133345))))

(declare-fun lt!133347 () Bool)

(assert (=> d!63233 (= lt!133345 lt!133347)))

(declare-fun lt!133346 () Unit!8164)

(declare-fun e!170652 () Unit!8164)

(assert (=> d!63233 (= lt!133346 e!170652)))

(declare-fun c!44916 () Bool)

(assert (=> d!63233 (= c!44916 lt!133347)))

(assert (=> d!63233 (= lt!133347 (containsKey!312 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(assert (=> d!63233 (= (contains!1885 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) key!932) lt!133345)))

(declare-fun b!263339 () Bool)

(declare-fun lt!133344 () Unit!8164)

(assert (=> b!263339 (= e!170652 lt!133344)))

(assert (=> b!263339 (= lt!133344 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(assert (=> b!263339 (isDefined!261 (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(declare-fun b!263340 () Bool)

(declare-fun Unit!8182 () Unit!8164)

(assert (=> b!263340 (= e!170652 Unit!8182)))

(declare-fun b!263341 () Bool)

(assert (=> b!263341 (= e!170651 (isDefined!261 (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932)))))

(assert (= (and d!63233 c!44916) b!263339))

(assert (= (and d!63233 (not c!44916)) b!263340))

(assert (= (and d!63233 (not res!128617)) b!263341))

(declare-fun m!279629 () Bool)

(assert (=> d!63233 m!279629))

(declare-fun m!279631 () Bool)

(assert (=> b!263339 m!279631))

(declare-fun m!279633 () Bool)

(assert (=> b!263339 m!279633))

(assert (=> b!263339 m!279633))

(declare-fun m!279635 () Bool)

(assert (=> b!263339 m!279635))

(assert (=> b!263341 m!279633))

(assert (=> b!263341 m!279633))

(assert (=> b!263341 m!279635))

(assert (=> d!63163 d!63233))

(assert (=> d!63163 d!63173))

(declare-fun d!63235 () Bool)

(assert (=> d!63235 (contains!1885 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) key!932)))

(assert (=> d!63235 true))

(declare-fun _$17!95 () Unit!8164)

(assert (=> d!63235 (= (choose!1296 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) _$17!95)))

(declare-fun bs!9271 () Bool)

(assert (= bs!9271 d!63235))

(assert (=> bs!9271 m!279091))

(assert (=> bs!9271 m!279091))

(assert (=> bs!9271 m!279347))

(assert (=> d!63163 d!63235))

(declare-fun d!63237 () Bool)

(assert (=> d!63237 (= (validMask!0 (mask!11208 thiss!1504)) (and (or (= (mask!11208 thiss!1504) #b00000000000000000000000000000111) (= (mask!11208 thiss!1504) #b00000000000000000000000000001111) (= (mask!11208 thiss!1504) #b00000000000000000000000000011111) (= (mask!11208 thiss!1504) #b00000000000000000000000000111111) (= (mask!11208 thiss!1504) #b00000000000000000000000001111111) (= (mask!11208 thiss!1504) #b00000000000000000000000011111111) (= (mask!11208 thiss!1504) #b00000000000000000000000111111111) (= (mask!11208 thiss!1504) #b00000000000000000000001111111111) (= (mask!11208 thiss!1504) #b00000000000000000000011111111111) (= (mask!11208 thiss!1504) #b00000000000000000000111111111111) (= (mask!11208 thiss!1504) #b00000000000000000001111111111111) (= (mask!11208 thiss!1504) #b00000000000000000011111111111111) (= (mask!11208 thiss!1504) #b00000000000000000111111111111111) (= (mask!11208 thiss!1504) #b00000000000000001111111111111111) (= (mask!11208 thiss!1504) #b00000000000000011111111111111111) (= (mask!11208 thiss!1504) #b00000000000000111111111111111111) (= (mask!11208 thiss!1504) #b00000000000001111111111111111111) (= (mask!11208 thiss!1504) #b00000000000011111111111111111111) (= (mask!11208 thiss!1504) #b00000000000111111111111111111111) (= (mask!11208 thiss!1504) #b00000000001111111111111111111111) (= (mask!11208 thiss!1504) #b00000000011111111111111111111111) (= (mask!11208 thiss!1504) #b00000000111111111111111111111111) (= (mask!11208 thiss!1504) #b00000001111111111111111111111111) (= (mask!11208 thiss!1504) #b00000011111111111111111111111111) (= (mask!11208 thiss!1504) #b00000111111111111111111111111111) (= (mask!11208 thiss!1504) #b00001111111111111111111111111111) (= (mask!11208 thiss!1504) #b00011111111111111111111111111111) (= (mask!11208 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!11208 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> d!63163 d!63237))

(declare-fun d!63239 () Bool)

(assert (=> d!63239 (= (inRange!0 (ite c!44854 (index!6826 lt!133153) (index!6829 lt!133153)) (mask!11208 thiss!1504)) (and (bvsge (ite c!44854 (index!6826 lt!133153) (index!6829 lt!133153)) #b00000000000000000000000000000000) (bvslt (ite c!44854 (index!6826 lt!133153) (index!6829 lt!133153)) (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25144 d!63239))

(declare-fun b!263360 () Bool)

(declare-fun e!170663 () SeekEntryResult!1164)

(assert (=> b!263360 (= e!170663 (Intermediate!1164 true (toIndex!0 key!932 (mask!11208 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!263361 () Bool)

(declare-fun e!170664 () SeekEntryResult!1164)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!263361 (= e!170664 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11208 thiss!1504)) key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun b!263362 () Bool)

(declare-fun e!170667 () Bool)

(declare-fun lt!133352 () SeekEntryResult!1164)

(assert (=> b!263362 (= e!170667 (bvsge (x!25206 lt!133352) #b01111111111111111111111111111110))))

(declare-fun b!263363 () Bool)

(declare-fun e!170666 () Bool)

(assert (=> b!263363 (= e!170667 e!170666)))

(declare-fun res!128626 () Bool)

(assert (=> b!263363 (= res!128626 (and ((_ is Intermediate!1164) lt!133352) (not (undefined!1976 lt!133352)) (bvslt (x!25206 lt!133352) #b01111111111111111111111111111110) (bvsge (x!25206 lt!133352) #b00000000000000000000000000000000) (bvsge (x!25206 lt!133352) #b00000000000000000000000000000000)))))

(assert (=> b!263363 (=> (not res!128626) (not e!170666))))

(declare-fun b!263364 () Bool)

(assert (=> b!263364 (and (bvsge (index!6828 lt!133352) #b00000000000000000000000000000000) (bvslt (index!6828 lt!133352) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun res!128625 () Bool)

(assert (=> b!263364 (= res!128625 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6828 lt!133352)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170665 () Bool)

(assert (=> b!263364 (=> res!128625 e!170665)))

(declare-fun b!263365 () Bool)

(assert (=> b!263365 (and (bvsge (index!6828 lt!133352) #b00000000000000000000000000000000) (bvslt (index!6828 lt!133352) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> b!263365 (= e!170665 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6828 lt!133352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263366 () Bool)

(assert (=> b!263366 (= e!170663 e!170664)))

(declare-fun c!44925 () Bool)

(declare-fun lt!133353 () (_ BitVec 64))

(assert (=> b!263366 (= c!44925 (or (= lt!133353 key!932) (= (bvadd lt!133353 lt!133353) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263367 () Bool)

(assert (=> b!263367 (= e!170664 (Intermediate!1164 false (toIndex!0 key!932 (mask!11208 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!263368 () Bool)

(assert (=> b!263368 (and (bvsge (index!6828 lt!133352) #b00000000000000000000000000000000) (bvslt (index!6828 lt!133352) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun res!128624 () Bool)

(assert (=> b!263368 (= res!128624 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6828 lt!133352)) key!932))))

(assert (=> b!263368 (=> res!128624 e!170665)))

(assert (=> b!263368 (= e!170666 e!170665)))

(declare-fun d!63241 () Bool)

(assert (=> d!63241 e!170667))

(declare-fun c!44924 () Bool)

(assert (=> d!63241 (= c!44924 (and ((_ is Intermediate!1164) lt!133352) (undefined!1976 lt!133352)))))

(assert (=> d!63241 (= lt!133352 e!170663)))

(declare-fun c!44923 () Bool)

(assert (=> d!63241 (= c!44923 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!63241 (= lt!133353 (select (arr!5996 (_keys!7034 thiss!1504)) (toIndex!0 key!932 (mask!11208 thiss!1504))))))

(assert (=> d!63241 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!11208 thiss!1504)) key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)) lt!133352)))

(assert (= (and d!63241 c!44923) b!263360))

(assert (= (and d!63241 (not c!44923)) b!263366))

(assert (= (and b!263366 c!44925) b!263367))

(assert (= (and b!263366 (not c!44925)) b!263361))

(assert (= (and d!63241 c!44924) b!263362))

(assert (= (and d!63241 (not c!44924)) b!263363))

(assert (= (and b!263363 res!128626) b!263368))

(assert (= (and b!263368 (not res!128624)) b!263364))

(assert (= (and b!263364 (not res!128625)) b!263365))

(declare-fun m!279637 () Bool)

(assert (=> b!263364 m!279637))

(assert (=> d!63241 m!279353))

(declare-fun m!279639 () Bool)

(assert (=> d!63241 m!279639))

(assert (=> d!63241 m!279317))

(assert (=> b!263365 m!279637))

(assert (=> b!263361 m!279353))

(declare-fun m!279641 () Bool)

(assert (=> b!263361 m!279641))

(assert (=> b!263361 m!279641))

(declare-fun m!279643 () Bool)

(assert (=> b!263361 m!279643))

(assert (=> b!263368 m!279637))

(assert (=> d!63165 d!63241))

(declare-fun d!63243 () Bool)

(declare-fun lt!133359 () (_ BitVec 32))

(declare-fun lt!133358 () (_ BitVec 32))

(assert (=> d!63243 (= lt!133359 (bvmul (bvxor lt!133358 (bvlshr lt!133358 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!63243 (= lt!133358 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!63243 (and (bvsge (mask!11208 thiss!1504) #b00000000000000000000000000000000) (let ((res!128627 (let ((h!4429 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25231 (bvmul (bvxor h!4429 (bvlshr h!4429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25231 (bvlshr x!25231 #b00000000000000000000000000001101)) (mask!11208 thiss!1504)))))) (and (bvslt res!128627 (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!128627 #b00000000000000000000000000000000))))))

(assert (=> d!63243 (= (toIndex!0 key!932 (mask!11208 thiss!1504)) (bvand (bvxor lt!133359 (bvlshr lt!133359 #b00000000000000000000000000001101)) (mask!11208 thiss!1504)))))

(assert (=> d!63165 d!63243))

(assert (=> d!63165 d!63237))

(declare-fun d!63245 () Bool)

(declare-fun e!170668 () Bool)

(assert (=> d!63245 e!170668))

(declare-fun res!128628 () Bool)

(assert (=> d!63245 (=> res!128628 e!170668)))

(declare-fun lt!133361 () Bool)

(assert (=> d!63245 (= res!128628 (not lt!133361))))

(declare-fun lt!133363 () Bool)

(assert (=> d!63245 (= lt!133361 lt!133363)))

(declare-fun lt!133362 () Unit!8164)

(declare-fun e!170669 () Unit!8164)

(assert (=> d!63245 (= lt!133362 e!170669)))

(declare-fun c!44926 () Bool)

(assert (=> d!63245 (= c!44926 lt!133363)))

(assert (=> d!63245 (= lt!133363 (containsKey!312 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63245 (= (contains!1885 lt!133244 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) lt!133361)))

(declare-fun b!263369 () Bool)

(declare-fun lt!133360 () Unit!8164)

(assert (=> b!263369 (= e!170669 lt!133360)))

(assert (=> b!263369 (= lt!133360 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263369 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263370 () Bool)

(declare-fun Unit!8183 () Unit!8164)

(assert (=> b!263370 (= e!170669 Unit!8183)))

(declare-fun b!263371 () Bool)

(assert (=> b!263371 (= e!170668 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!63245 c!44926) b!263369))

(assert (= (and d!63245 (not c!44926)) b!263370))

(assert (= (and d!63245 (not res!128628)) b!263371))

(assert (=> d!63245 m!279365))

(declare-fun m!279645 () Bool)

(assert (=> d!63245 m!279645))

(assert (=> b!263369 m!279365))

(declare-fun m!279647 () Bool)

(assert (=> b!263369 m!279647))

(assert (=> b!263369 m!279365))

(declare-fun m!279649 () Bool)

(assert (=> b!263369 m!279649))

(assert (=> b!263369 m!279649))

(declare-fun m!279651 () Bool)

(assert (=> b!263369 m!279651))

(assert (=> b!263371 m!279365))

(assert (=> b!263371 m!279649))

(assert (=> b!263371 m!279649))

(assert (=> b!263371 m!279651))

(assert (=> b!263164 d!63245))

(declare-fun d!63247 () Bool)

(declare-fun get!3100 (Option!327) V!8521)

(assert (=> d!63247 (= (apply!262 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) lt!133314) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) lt!133314)))))

(declare-fun bs!9272 () Bool)

(assert (= bs!9272 d!63247))

(declare-fun m!279653 () Bool)

(assert (=> bs!9272 m!279653))

(assert (=> bs!9272 m!279653))

(declare-fun m!279655 () Bool)

(assert (=> bs!9272 m!279655))

(assert (=> b!263262 d!63247))

(declare-fun b!263396 () Bool)

(declare-fun res!128637 () Bool)

(declare-fun e!170686 () Bool)

(assert (=> b!263396 (=> (not res!128637) (not e!170686))))

(declare-fun lt!133380 () ListLongMap!3801)

(assert (=> b!263396 (= res!128637 (not (contains!1885 lt!133380 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263397 () Bool)

(declare-fun e!170687 () Bool)

(assert (=> b!263397 (= e!170686 e!170687)))

(declare-fun c!44937 () Bool)

(declare-fun e!170690 () Bool)

(assert (=> b!263397 (= c!44937 e!170690)))

(declare-fun res!128640 () Bool)

(assert (=> b!263397 (=> (not res!128640) (not e!170690))))

(assert (=> b!263397 (= res!128640 (bvslt #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(declare-fun b!263398 () Bool)

(declare-fun e!170684 () ListLongMap!3801)

(declare-fun e!170688 () ListLongMap!3801)

(assert (=> b!263398 (= e!170684 e!170688)))

(declare-fun c!44938 () Bool)

(assert (=> b!263398 (= c!44938 (validKeyInArray!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun b!263399 () Bool)

(declare-fun call!25193 () ListLongMap!3801)

(assert (=> b!263399 (= e!170688 call!25193)))

(declare-fun b!263400 () Bool)

(declare-fun e!170685 () Bool)

(declare-fun isEmpty!546 (ListLongMap!3801) Bool)

(assert (=> b!263400 (= e!170685 (isEmpty!546 lt!133380))))

(declare-fun d!63249 () Bool)

(assert (=> d!63249 e!170686))

(declare-fun res!128638 () Bool)

(assert (=> d!63249 (=> (not res!128638) (not e!170686))))

(assert (=> d!63249 (= res!128638 (not (contains!1885 lt!133380 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63249 (= lt!133380 e!170684)))

(declare-fun c!44936 () Bool)

(assert (=> d!63249 (= c!44936 (bvsge #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(assert (=> d!63249 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63249 (= (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133380)))

(declare-fun b!263401 () Bool)

(assert (=> b!263401 (= e!170690 (validKeyInArray!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (=> b!263401 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263402 () Bool)

(assert (=> b!263402 (= e!170684 (ListLongMap!3802 Nil!3760))))

(declare-fun bm!25190 () Bool)

(assert (=> bm!25190 (= call!25193 (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263403 () Bool)

(assert (=> b!263403 (= e!170687 e!170685)))

(declare-fun c!44935 () Bool)

(assert (=> b!263403 (= c!44935 (bvslt #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(declare-fun b!263404 () Bool)

(assert (=> b!263404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(assert (=> b!263404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6346 lt!133020)))))

(declare-fun e!170689 () Bool)

(assert (=> b!263404 (= e!170689 (= (apply!262 lt!133380 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263405 () Bool)

(declare-fun lt!133379 () Unit!8164)

(declare-fun lt!133378 () Unit!8164)

(assert (=> b!263405 (= lt!133379 lt!133378)))

(declare-fun lt!133382 () ListLongMap!3801)

(declare-fun lt!133381 () (_ BitVec 64))

(declare-fun lt!133384 () (_ BitVec 64))

(declare-fun lt!133383 () V!8521)

(assert (=> b!263405 (not (contains!1885 (+!712 lt!133382 (tuple2!4887 lt!133381 lt!133383)) lt!133384))))

(declare-fun addStillNotContains!131 (ListLongMap!3801 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8164)

(assert (=> b!263405 (= lt!133378 (addStillNotContains!131 lt!133382 lt!133381 lt!133383 lt!133384))))

(assert (=> b!263405 (= lt!133384 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263405 (= lt!133383 (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263405 (= lt!133381 (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))

(assert (=> b!263405 (= lt!133382 call!25193)))

(assert (=> b!263405 (= e!170688 (+!712 call!25193 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!263406 () Bool)

(assert (=> b!263406 (= e!170685 (= lt!133380 (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504))))))

(declare-fun b!263407 () Bool)

(assert (=> b!263407 (= e!170687 e!170689)))

(assert (=> b!263407 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 lt!133005)))))

(declare-fun res!128639 () Bool)

(assert (=> b!263407 (= res!128639 (contains!1885 lt!133380 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (=> b!263407 (=> (not res!128639) (not e!170689))))

(assert (= (and d!63249 c!44936) b!263402))

(assert (= (and d!63249 (not c!44936)) b!263398))

(assert (= (and b!263398 c!44938) b!263405))

(assert (= (and b!263398 (not c!44938)) b!263399))

(assert (= (or b!263405 b!263399) bm!25190))

(assert (= (and d!63249 res!128638) b!263396))

(assert (= (and b!263396 res!128637) b!263397))

(assert (= (and b!263397 res!128640) b!263401))

(assert (= (and b!263397 c!44937) b!263407))

(assert (= (and b!263397 (not c!44937)) b!263403))

(assert (= (and b!263407 res!128639) b!263404))

(assert (= (and b!263403 c!44935) b!263406))

(assert (= (and b!263403 (not c!44935)) b!263400))

(declare-fun b_lambda!8361 () Bool)

(assert (=> (not b_lambda!8361) (not b!263404)))

(assert (=> b!263404 t!8837))

(declare-fun b_and!13959 () Bool)

(assert (= b_and!13957 (and (=> t!8837 result!5425) b_and!13959)))

(declare-fun b_lambda!8363 () Bool)

(assert (=> (not b_lambda!8363) (not b!263405)))

(assert (=> b!263405 t!8837))

(declare-fun b_and!13961 () Bool)

(assert (= b_and!13959 (and (=> t!8837 result!5425) b_and!13961)))

(declare-fun m!279657 () Bool)

(assert (=> b!263400 m!279657))

(assert (=> b!263401 m!279433))

(assert (=> b!263401 m!279433))

(assert (=> b!263401 m!279437))

(declare-fun m!279659 () Bool)

(assert (=> b!263406 m!279659))

(assert (=> b!263398 m!279433))

(assert (=> b!263398 m!279433))

(assert (=> b!263398 m!279437))

(assert (=> b!263404 m!279511))

(assert (=> b!263404 m!279433))

(assert (=> b!263404 m!279433))

(declare-fun m!279661 () Bool)

(assert (=> b!263404 m!279661))

(assert (=> b!263404 m!279511))

(assert (=> b!263404 m!279383))

(assert (=> b!263404 m!279513))

(assert (=> b!263404 m!279383))

(declare-fun m!279663 () Bool)

(assert (=> d!63249 m!279663))

(assert (=> d!63249 m!279317))

(declare-fun m!279665 () Bool)

(assert (=> b!263396 m!279665))

(assert (=> bm!25190 m!279659))

(assert (=> b!263407 m!279433))

(assert (=> b!263407 m!279433))

(declare-fun m!279667 () Bool)

(assert (=> b!263407 m!279667))

(declare-fun m!279669 () Bool)

(assert (=> b!263405 m!279669))

(assert (=> b!263405 m!279511))

(declare-fun m!279671 () Bool)

(assert (=> b!263405 m!279671))

(assert (=> b!263405 m!279433))

(assert (=> b!263405 m!279671))

(declare-fun m!279673 () Bool)

(assert (=> b!263405 m!279673))

(declare-fun m!279675 () Bool)

(assert (=> b!263405 m!279675))

(assert (=> b!263405 m!279511))

(assert (=> b!263405 m!279383))

(assert (=> b!263405 m!279513))

(assert (=> b!263405 m!279383))

(assert (=> b!263262 d!63249))

(declare-fun d!63251 () Bool)

(assert (=> d!63251 (= (apply!262 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) lt!133316) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) lt!133316)))))

(declare-fun bs!9273 () Bool)

(assert (= bs!9273 d!63251))

(declare-fun m!279677 () Bool)

(assert (=> bs!9273 m!279677))

(assert (=> bs!9273 m!279677))

(declare-fun m!279679 () Bool)

(assert (=> bs!9273 m!279679))

(assert (=> b!263262 d!63251))

(declare-fun d!63253 () Bool)

(assert (=> d!63253 (= (apply!262 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) lt!133316) (apply!262 lt!133313 lt!133316))))

(declare-fun lt!133387 () Unit!8164)

(declare-fun choose!1300 (ListLongMap!3801 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8164)

(assert (=> d!63253 (= lt!133387 (choose!1300 lt!133313 lt!133296 (zeroValue!4683 thiss!1504) lt!133316))))

(declare-fun e!170693 () Bool)

(assert (=> d!63253 e!170693))

(declare-fun res!128643 () Bool)

(assert (=> d!63253 (=> (not res!128643) (not e!170693))))

(assert (=> d!63253 (= res!128643 (contains!1885 lt!133313 lt!133316))))

(assert (=> d!63253 (= (addApplyDifferent!238 lt!133313 lt!133296 (zeroValue!4683 thiss!1504) lt!133316) lt!133387)))

(declare-fun b!263411 () Bool)

(assert (=> b!263411 (= e!170693 (not (= lt!133316 lt!133296)))))

(assert (= (and d!63253 res!128643) b!263411))

(assert (=> d!63253 m!279525))

(declare-fun m!279681 () Bool)

(assert (=> d!63253 m!279681))

(assert (=> d!63253 m!279549))

(declare-fun m!279683 () Bool)

(assert (=> d!63253 m!279683))

(assert (=> d!63253 m!279525))

(assert (=> d!63253 m!279527))

(assert (=> b!263262 d!63253))

(declare-fun d!63255 () Bool)

(declare-fun e!170694 () Bool)

(assert (=> d!63255 e!170694))

(declare-fun res!128644 () Bool)

(assert (=> d!63255 (=> (not res!128644) (not e!170694))))

(declare-fun lt!133389 () ListLongMap!3801)

(assert (=> d!63255 (= res!128644 (contains!1885 lt!133389 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133390 () List!3763)

(assert (=> d!63255 (= lt!133389 (ListLongMap!3802 lt!133390))))

(declare-fun lt!133391 () Unit!8164)

(declare-fun lt!133388 () Unit!8164)

(assert (=> d!63255 (= lt!133391 lt!133388)))

(assert (=> d!63255 (= (getValueByKey!321 lt!133390 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(assert (=> d!63255 (= lt!133388 (lemmaContainsTupThenGetReturnValue!177 lt!133390 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(assert (=> d!63255 (= lt!133390 (insertStrictlySorted!180 (toList!1916 lt!133312) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(assert (=> d!63255 (= (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) lt!133389)))

(declare-fun b!263412 () Bool)

(declare-fun res!128645 () Bool)

(assert (=> b!263412 (=> (not res!128645) (not e!170694))))

(assert (=> b!263412 (= res!128645 (= (getValueByKey!321 (toList!1916 lt!133389) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))))

(declare-fun b!263413 () Bool)

(assert (=> b!263413 (= e!170694 (contains!1888 (toList!1916 lt!133389) (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))

(assert (= (and d!63255 res!128644) b!263412))

(assert (= (and b!263412 res!128645) b!263413))

(declare-fun m!279685 () Bool)

(assert (=> d!63255 m!279685))

(declare-fun m!279687 () Bool)

(assert (=> d!63255 m!279687))

(declare-fun m!279689 () Bool)

(assert (=> d!63255 m!279689))

(declare-fun m!279691 () Bool)

(assert (=> d!63255 m!279691))

(declare-fun m!279693 () Bool)

(assert (=> b!263412 m!279693))

(declare-fun m!279695 () Bool)

(assert (=> b!263413 m!279695))

(assert (=> b!263262 d!63255))

(declare-fun d!63257 () Bool)

(assert (=> d!63257 (= (apply!262 lt!133313 lt!133316) (get!3100 (getValueByKey!321 (toList!1916 lt!133313) lt!133316)))))

(declare-fun bs!9274 () Bool)

(assert (= bs!9274 d!63257))

(declare-fun m!279697 () Bool)

(assert (=> bs!9274 m!279697))

(assert (=> bs!9274 m!279697))

(declare-fun m!279699 () Bool)

(assert (=> bs!9274 m!279699))

(assert (=> b!263262 d!63257))

(declare-fun d!63259 () Bool)

(declare-fun e!170695 () Bool)

(assert (=> d!63259 e!170695))

(declare-fun res!128646 () Bool)

(assert (=> d!63259 (=> res!128646 e!170695)))

(declare-fun lt!133393 () Bool)

(assert (=> d!63259 (= res!128646 (not lt!133393))))

(declare-fun lt!133395 () Bool)

(assert (=> d!63259 (= lt!133393 lt!133395)))

(declare-fun lt!133394 () Unit!8164)

(declare-fun e!170696 () Unit!8164)

(assert (=> d!63259 (= lt!133394 e!170696)))

(declare-fun c!44939 () Bool)

(assert (=> d!63259 (= c!44939 lt!133395)))

(assert (=> d!63259 (= lt!133395 (containsKey!312 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298))))

(assert (=> d!63259 (= (contains!1885 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) lt!133298) lt!133393)))

(declare-fun b!263414 () Bool)

(declare-fun lt!133392 () Unit!8164)

(assert (=> b!263414 (= e!170696 lt!133392)))

(assert (=> b!263414 (= lt!133392 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298))))

(assert (=> b!263414 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298))))

(declare-fun b!263415 () Bool)

(declare-fun Unit!8184 () Unit!8164)

(assert (=> b!263415 (= e!170696 Unit!8184)))

(declare-fun b!263416 () Bool)

(assert (=> b!263416 (= e!170695 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298)))))

(assert (= (and d!63259 c!44939) b!263414))

(assert (= (and d!63259 (not c!44939)) b!263415))

(assert (= (and d!63259 (not res!128646)) b!263416))

(declare-fun m!279701 () Bool)

(assert (=> d!63259 m!279701))

(declare-fun m!279703 () Bool)

(assert (=> b!263414 m!279703))

(declare-fun m!279705 () Bool)

(assert (=> b!263414 m!279705))

(assert (=> b!263414 m!279705))

(declare-fun m!279707 () Bool)

(assert (=> b!263414 m!279707))

(assert (=> b!263416 m!279705))

(assert (=> b!263416 m!279705))

(assert (=> b!263416 m!279707))

(assert (=> b!263262 d!63259))

(declare-fun d!63261 () Bool)

(assert (=> d!63261 (= (apply!262 lt!133305 lt!133314) (get!3100 (getValueByKey!321 (toList!1916 lt!133305) lt!133314)))))

(declare-fun bs!9275 () Bool)

(assert (= bs!9275 d!63261))

(declare-fun m!279709 () Bool)

(assert (=> bs!9275 m!279709))

(assert (=> bs!9275 m!279709))

(declare-fun m!279711 () Bool)

(assert (=> bs!9275 m!279711))

(assert (=> b!263262 d!63261))

(declare-fun d!63263 () Bool)

(declare-fun e!170697 () Bool)

(assert (=> d!63263 e!170697))

(declare-fun res!128647 () Bool)

(assert (=> d!63263 (=> (not res!128647) (not e!170697))))

(declare-fun lt!133397 () ListLongMap!3801)

(assert (=> d!63263 (= res!128647 (contains!1885 lt!133397 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133398 () List!3763)

(assert (=> d!63263 (= lt!133397 (ListLongMap!3802 lt!133398))))

(declare-fun lt!133399 () Unit!8164)

(declare-fun lt!133396 () Unit!8164)

(assert (=> d!63263 (= lt!133399 lt!133396)))

(assert (=> d!63263 (= (getValueByKey!321 lt!133398 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63263 (= lt!133396 (lemmaContainsTupThenGetReturnValue!177 lt!133398 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63263 (= lt!133398 (insertStrictlySorted!180 (toList!1916 lt!133313) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63263 (= (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) lt!133397)))

(declare-fun b!263417 () Bool)

(declare-fun res!128648 () Bool)

(assert (=> b!263417 (=> (not res!128648) (not e!170697))))

(assert (=> b!263417 (= res!128648 (= (getValueByKey!321 (toList!1916 lt!133397) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263418 () Bool)

(assert (=> b!263418 (= e!170697 (contains!1888 (toList!1916 lt!133397) (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63263 res!128647) b!263417))

(assert (= (and b!263417 res!128648) b!263418))

(declare-fun m!279713 () Bool)

(assert (=> d!63263 m!279713))

(declare-fun m!279715 () Bool)

(assert (=> d!63263 m!279715))

(declare-fun m!279717 () Bool)

(assert (=> d!63263 m!279717))

(declare-fun m!279719 () Bool)

(assert (=> d!63263 m!279719))

(declare-fun m!279721 () Bool)

(assert (=> b!263417 m!279721))

(declare-fun m!279723 () Bool)

(assert (=> b!263418 m!279723))

(assert (=> b!263262 d!63263))

(declare-fun d!63265 () Bool)

(assert (=> d!63265 (= (apply!262 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) lt!133306) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) lt!133306)))))

(declare-fun bs!9276 () Bool)

(assert (= bs!9276 d!63265))

(declare-fun m!279725 () Bool)

(assert (=> bs!9276 m!279725))

(assert (=> bs!9276 m!279725))

(declare-fun m!279727 () Bool)

(assert (=> bs!9276 m!279727))

(assert (=> b!263262 d!63265))

(declare-fun d!63267 () Bool)

(declare-fun e!170698 () Bool)

(assert (=> d!63267 e!170698))

(declare-fun res!128649 () Bool)

(assert (=> d!63267 (=> (not res!128649) (not e!170698))))

(declare-fun lt!133401 () ListLongMap!3801)

(assert (=> d!63267 (= res!128649 (contains!1885 lt!133401 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133402 () List!3763)

(assert (=> d!63267 (= lt!133401 (ListLongMap!3802 lt!133402))))

(declare-fun lt!133403 () Unit!8164)

(declare-fun lt!133400 () Unit!8164)

(assert (=> d!63267 (= lt!133403 lt!133400)))

(assert (=> d!63267 (= (getValueByKey!321 lt!133402 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(assert (=> d!63267 (= lt!133400 (lemmaContainsTupThenGetReturnValue!177 lt!133402 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(assert (=> d!63267 (= lt!133402 (insertStrictlySorted!180 (toList!1916 lt!133305) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(assert (=> d!63267 (= (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) lt!133401)))

(declare-fun b!263419 () Bool)

(declare-fun res!128650 () Bool)

(assert (=> b!263419 (=> (not res!128650) (not e!170698))))

(assert (=> b!263419 (= res!128650 (= (getValueByKey!321 (toList!1916 lt!133401) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))))

(declare-fun b!263420 () Bool)

(assert (=> b!263420 (= e!170698 (contains!1888 (toList!1916 lt!133401) (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))

(assert (= (and d!63267 res!128649) b!263419))

(assert (= (and b!263419 res!128650) b!263420))

(declare-fun m!279729 () Bool)

(assert (=> d!63267 m!279729))

(declare-fun m!279731 () Bool)

(assert (=> d!63267 m!279731))

(declare-fun m!279733 () Bool)

(assert (=> d!63267 m!279733))

(declare-fun m!279735 () Bool)

(assert (=> d!63267 m!279735))

(declare-fun m!279737 () Bool)

(assert (=> b!263419 m!279737))

(declare-fun m!279739 () Bool)

(assert (=> b!263420 m!279739))

(assert (=> b!263262 d!63267))

(declare-fun d!63269 () Bool)

(assert (=> d!63269 (= (apply!262 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) lt!133314) (apply!262 lt!133305 lt!133314))))

(declare-fun lt!133404 () Unit!8164)

(assert (=> d!63269 (= lt!133404 (choose!1300 lt!133305 lt!133299 (minValue!4683 thiss!1504) lt!133314))))

(declare-fun e!170699 () Bool)

(assert (=> d!63269 e!170699))

(declare-fun res!128651 () Bool)

(assert (=> d!63269 (=> (not res!128651) (not e!170699))))

(assert (=> d!63269 (= res!128651 (contains!1885 lt!133305 lt!133314))))

(assert (=> d!63269 (= (addApplyDifferent!238 lt!133305 lt!133299 (minValue!4683 thiss!1504) lt!133314) lt!133404)))

(declare-fun b!263421 () Bool)

(assert (=> b!263421 (= e!170699 (not (= lt!133314 lt!133299)))))

(assert (= (and d!63269 res!128651) b!263421))

(assert (=> d!63269 m!279531))

(declare-fun m!279741 () Bool)

(assert (=> d!63269 m!279741))

(assert (=> d!63269 m!279539))

(declare-fun m!279743 () Bool)

(assert (=> d!63269 m!279743))

(assert (=> d!63269 m!279531))

(assert (=> d!63269 m!279543))

(assert (=> b!263262 d!63269))

(declare-fun d!63271 () Bool)

(assert (=> d!63271 (= (apply!262 lt!133312 lt!133306) (get!3100 (getValueByKey!321 (toList!1916 lt!133312) lt!133306)))))

(declare-fun bs!9277 () Bool)

(assert (= bs!9277 d!63271))

(declare-fun m!279745 () Bool)

(assert (=> bs!9277 m!279745))

(assert (=> bs!9277 m!279745))

(declare-fun m!279747 () Bool)

(assert (=> bs!9277 m!279747))

(assert (=> b!263262 d!63271))

(declare-fun d!63273 () Bool)

(assert (=> d!63273 (contains!1885 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) lt!133298)))

(declare-fun lt!133407 () Unit!8164)

(declare-fun choose!1301 (ListLongMap!3801 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8164)

(assert (=> d!63273 (= lt!133407 (choose!1301 lt!133309 lt!133315 (zeroValue!4683 thiss!1504) lt!133298))))

(assert (=> d!63273 (contains!1885 lt!133309 lt!133298)))

(assert (=> d!63273 (= (addStillContains!238 lt!133309 lt!133315 (zeroValue!4683 thiss!1504) lt!133298) lt!133407)))

(declare-fun bs!9278 () Bool)

(assert (= bs!9278 d!63273))

(assert (=> bs!9278 m!279545))

(assert (=> bs!9278 m!279545))

(assert (=> bs!9278 m!279547))

(declare-fun m!279749 () Bool)

(assert (=> bs!9278 m!279749))

(declare-fun m!279751 () Bool)

(assert (=> bs!9278 m!279751))

(assert (=> b!263262 d!63273))

(declare-fun d!63275 () Bool)

(assert (=> d!63275 (= (apply!262 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) lt!133306) (apply!262 lt!133312 lt!133306))))

(declare-fun lt!133408 () Unit!8164)

(assert (=> d!63275 (= lt!133408 (choose!1300 lt!133312 lt!133303 (minValue!4683 thiss!1504) lt!133306))))

(declare-fun e!170700 () Bool)

(assert (=> d!63275 e!170700))

(declare-fun res!128652 () Bool)

(assert (=> d!63275 (=> (not res!128652) (not e!170700))))

(assert (=> d!63275 (= res!128652 (contains!1885 lt!133312 lt!133306))))

(assert (=> d!63275 (= (addApplyDifferent!238 lt!133312 lt!133303 (minValue!4683 thiss!1504) lt!133306) lt!133408)))

(declare-fun b!263423 () Bool)

(assert (=> b!263423 (= e!170700 (not (= lt!133306 lt!133303)))))

(assert (= (and d!63275 res!128652) b!263423))

(assert (=> d!63275 m!279535))

(declare-fun m!279753 () Bool)

(assert (=> d!63275 m!279753))

(assert (=> d!63275 m!279529))

(declare-fun m!279755 () Bool)

(assert (=> d!63275 m!279755))

(assert (=> d!63275 m!279535))

(assert (=> d!63275 m!279537))

(assert (=> b!263262 d!63275))

(declare-fun d!63277 () Bool)

(declare-fun e!170701 () Bool)

(assert (=> d!63277 e!170701))

(declare-fun res!128653 () Bool)

(assert (=> d!63277 (=> (not res!128653) (not e!170701))))

(declare-fun lt!133410 () ListLongMap!3801)

(assert (=> d!63277 (= res!128653 (contains!1885 lt!133410 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133411 () List!3763)

(assert (=> d!63277 (= lt!133410 (ListLongMap!3802 lt!133411))))

(declare-fun lt!133412 () Unit!8164)

(declare-fun lt!133409 () Unit!8164)

(assert (=> d!63277 (= lt!133412 lt!133409)))

(assert (=> d!63277 (= (getValueByKey!321 lt!133411 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63277 (= lt!133409 (lemmaContainsTupThenGetReturnValue!177 lt!133411 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63277 (= lt!133411 (insertStrictlySorted!180 (toList!1916 lt!133309) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63277 (= (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) lt!133410)))

(declare-fun b!263424 () Bool)

(declare-fun res!128654 () Bool)

(assert (=> b!263424 (=> (not res!128654) (not e!170701))))

(assert (=> b!263424 (= res!128654 (= (getValueByKey!321 (toList!1916 lt!133410) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263425 () Bool)

(assert (=> b!263425 (= e!170701 (contains!1888 (toList!1916 lt!133410) (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63277 res!128653) b!263424))

(assert (= (and b!263424 res!128654) b!263425))

(declare-fun m!279757 () Bool)

(assert (=> d!63277 m!279757))

(declare-fun m!279759 () Bool)

(assert (=> d!63277 m!279759))

(declare-fun m!279761 () Bool)

(assert (=> d!63277 m!279761))

(declare-fun m!279763 () Bool)

(assert (=> d!63277 m!279763))

(declare-fun m!279765 () Bool)

(assert (=> b!263424 m!279765))

(declare-fun m!279767 () Bool)

(assert (=> b!263425 m!279767))

(assert (=> b!263262 d!63277))

(declare-fun d!63279 () Bool)

(declare-fun e!170702 () Bool)

(assert (=> d!63279 e!170702))

(declare-fun res!128655 () Bool)

(assert (=> d!63279 (=> (not res!128655) (not e!170702))))

(declare-fun lt!133414 () ListLongMap!3801)

(assert (=> d!63279 (= res!128655 (contains!1885 lt!133414 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun lt!133415 () List!3763)

(assert (=> d!63279 (= lt!133414 (ListLongMap!3802 lt!133415))))

(declare-fun lt!133416 () Unit!8164)

(declare-fun lt!133413 () Unit!8164)

(assert (=> d!63279 (= lt!133416 lt!133413)))

(assert (=> d!63279 (= (getValueByKey!321 lt!133415 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!326 (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63279 (= lt!133413 (lemmaContainsTupThenGetReturnValue!177 lt!133415 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63279 (= lt!133415 (insertStrictlySorted!180 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166))) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63279 (= (+!712 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166)) (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133414)))

(declare-fun b!263426 () Bool)

(declare-fun res!128656 () Bool)

(assert (=> b!263426 (=> (not res!128656) (not e!170702))))

(assert (=> b!263426 (= res!128656 (= (getValueByKey!321 (toList!1916 lt!133414) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!326 (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263427 () Bool)

(assert (=> b!263427 (= e!170702 (contains!1888 (toList!1916 lt!133414) (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63279 res!128655) b!263426))

(assert (= (and b!263426 res!128656) b!263427))

(declare-fun m!279769 () Bool)

(assert (=> d!63279 m!279769))

(declare-fun m!279771 () Bool)

(assert (=> d!63279 m!279771))

(declare-fun m!279773 () Bool)

(assert (=> d!63279 m!279773))

(declare-fun m!279775 () Bool)

(assert (=> d!63279 m!279775))

(declare-fun m!279777 () Bool)

(assert (=> b!263426 m!279777))

(declare-fun m!279779 () Bool)

(assert (=> b!263427 m!279779))

(assert (=> bm!25163 d!63279))

(declare-fun d!63281 () Bool)

(assert (=> d!63281 (= (validKeyInArray!0 (select (arr!5996 lt!133005) index!297)) (and (not (= (select (arr!5996 lt!133005) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5996 lt!133005) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263212 d!63281))

(declare-fun d!63283 () Bool)

(declare-fun lt!133419 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!177 (List!3764) (InoxSet (_ BitVec 64)))

(assert (=> d!63283 (= lt!133419 (select (content!177 Nil!3761) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun e!170708 () Bool)

(assert (=> d!63283 (= lt!133419 e!170708)))

(declare-fun res!128662 () Bool)

(assert (=> d!63283 (=> (not res!128662) (not e!170708))))

(assert (=> d!63283 (= res!128662 ((_ is Cons!3760) Nil!3761))))

(assert (=> d!63283 (= (contains!1889 Nil!3761 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) lt!133419)))

(declare-fun b!263432 () Bool)

(declare-fun e!170707 () Bool)

(assert (=> b!263432 (= e!170708 e!170707)))

(declare-fun res!128661 () Bool)

(assert (=> b!263432 (=> res!128661 e!170707)))

(assert (=> b!263432 (= res!128661 (= (h!4426 Nil!3761) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun b!263433 () Bool)

(assert (=> b!263433 (= e!170707 (contains!1889 (t!8833 Nil!3761) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (= (and d!63283 res!128662) b!263432))

(assert (= (and b!263432 (not res!128661)) b!263433))

(declare-fun m!279781 () Bool)

(assert (=> d!63283 m!279781))

(assert (=> d!63283 m!279433))

(declare-fun m!279783 () Bool)

(assert (=> d!63283 m!279783))

(assert (=> b!263433 m!279433))

(declare-fun m!279785 () Bool)

(assert (=> b!263433 m!279785))

(assert (=> b!263194 d!63283))

(declare-fun d!63285 () Bool)

(assert (=> d!63285 (= (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263175 d!63285))

(declare-fun d!63287 () Bool)

(declare-fun e!170709 () Bool)

(assert (=> d!63287 e!170709))

(declare-fun res!128663 () Bool)

(assert (=> d!63287 (=> res!128663 e!170709)))

(declare-fun lt!133421 () Bool)

(assert (=> d!63287 (= res!128663 (not lt!133421))))

(declare-fun lt!133423 () Bool)

(assert (=> d!63287 (= lt!133421 lt!133423)))

(declare-fun lt!133422 () Unit!8164)

(declare-fun e!170710 () Unit!8164)

(assert (=> d!63287 (= lt!133422 e!170710)))

(declare-fun c!44940 () Bool)

(assert (=> d!63287 (= c!44940 lt!133423)))

(assert (=> d!63287 (= lt!133423 (containsKey!312 (toList!1916 lt!133176) (_1!2454 lt!133017)))))

(assert (=> d!63287 (= (contains!1885 lt!133176 (_1!2454 lt!133017)) lt!133421)))

(declare-fun b!263434 () Bool)

(declare-fun lt!133420 () Unit!8164)

(assert (=> b!263434 (= e!170710 lt!133420)))

(assert (=> b!263434 (= lt!133420 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133176) (_1!2454 lt!133017)))))

(assert (=> b!263434 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133176) (_1!2454 lt!133017)))))

(declare-fun b!263435 () Bool)

(declare-fun Unit!8185 () Unit!8164)

(assert (=> b!263435 (= e!170710 Unit!8185)))

(declare-fun b!263436 () Bool)

(assert (=> b!263436 (= e!170709 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133176) (_1!2454 lt!133017))))))

(assert (= (and d!63287 c!44940) b!263434))

(assert (= (and d!63287 (not c!44940)) b!263435))

(assert (= (and d!63287 (not res!128663)) b!263436))

(declare-fun m!279787 () Bool)

(assert (=> d!63287 m!279787))

(declare-fun m!279789 () Bool)

(assert (=> b!263434 m!279789))

(assert (=> b!263434 m!279343))

(assert (=> b!263434 m!279343))

(declare-fun m!279791 () Bool)

(assert (=> b!263434 m!279791))

(assert (=> b!263436 m!279343))

(assert (=> b!263436 m!279343))

(assert (=> b!263436 m!279791))

(assert (=> d!63159 d!63287))

(declare-fun b!263448 () Bool)

(declare-fun e!170716 () Option!327)

(assert (=> b!263448 (= e!170716 None!325)))

(declare-fun b!263446 () Bool)

(declare-fun e!170715 () Option!327)

(assert (=> b!263446 (= e!170715 e!170716)))

(declare-fun c!44946 () Bool)

(assert (=> b!263446 (= c!44946 (and ((_ is Cons!3759) lt!133177) (not (= (_1!2454 (h!4425 lt!133177)) (_1!2454 lt!133017)))))))

(declare-fun b!263447 () Bool)

(assert (=> b!263447 (= e!170716 (getValueByKey!321 (t!8832 lt!133177) (_1!2454 lt!133017)))))

(declare-fun d!63289 () Bool)

(declare-fun c!44945 () Bool)

(assert (=> d!63289 (= c!44945 (and ((_ is Cons!3759) lt!133177) (= (_1!2454 (h!4425 lt!133177)) (_1!2454 lt!133017))))))

(assert (=> d!63289 (= (getValueByKey!321 lt!133177 (_1!2454 lt!133017)) e!170715)))

(declare-fun b!263445 () Bool)

(assert (=> b!263445 (= e!170715 (Some!326 (_2!2454 (h!4425 lt!133177))))))

(assert (= (and d!63289 c!44945) b!263445))

(assert (= (and d!63289 (not c!44945)) b!263446))

(assert (= (and b!263446 c!44946) b!263447))

(assert (= (and b!263446 (not c!44946)) b!263448))

(declare-fun m!279793 () Bool)

(assert (=> b!263447 m!279793))

(assert (=> d!63159 d!63289))

(declare-fun d!63291 () Bool)

(assert (=> d!63291 (= (getValueByKey!321 lt!133177 (_1!2454 lt!133017)) (Some!326 (_2!2454 lt!133017)))))

(declare-fun lt!133426 () Unit!8164)

(declare-fun choose!1302 (List!3763 (_ BitVec 64) V!8521) Unit!8164)

(assert (=> d!63291 (= lt!133426 (choose!1302 lt!133177 (_1!2454 lt!133017) (_2!2454 lt!133017)))))

(declare-fun e!170719 () Bool)

(assert (=> d!63291 e!170719))

(declare-fun res!128668 () Bool)

(assert (=> d!63291 (=> (not res!128668) (not e!170719))))

(declare-fun isStrictlySorted!364 (List!3763) Bool)

(assert (=> d!63291 (= res!128668 (isStrictlySorted!364 lt!133177))))

(assert (=> d!63291 (= (lemmaContainsTupThenGetReturnValue!177 lt!133177 (_1!2454 lt!133017) (_2!2454 lt!133017)) lt!133426)))

(declare-fun b!263453 () Bool)

(declare-fun res!128669 () Bool)

(assert (=> b!263453 (=> (not res!128669) (not e!170719))))

(assert (=> b!263453 (= res!128669 (containsKey!312 lt!133177 (_1!2454 lt!133017)))))

(declare-fun b!263454 () Bool)

(assert (=> b!263454 (= e!170719 (contains!1888 lt!133177 (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(assert (= (and d!63291 res!128668) b!263453))

(assert (= (and b!263453 res!128669) b!263454))

(assert (=> d!63291 m!279337))

(declare-fun m!279795 () Bool)

(assert (=> d!63291 m!279795))

(declare-fun m!279797 () Bool)

(assert (=> d!63291 m!279797))

(declare-fun m!279799 () Bool)

(assert (=> b!263453 m!279799))

(declare-fun m!279801 () Bool)

(assert (=> b!263454 m!279801))

(assert (=> d!63159 d!63291))

(declare-fun b!263475 () Bool)

(declare-fun e!170732 () List!3763)

(declare-fun call!25202 () List!3763)

(assert (=> b!263475 (= e!170732 call!25202)))

(declare-fun b!263476 () Bool)

(declare-fun e!170734 () List!3763)

(declare-fun call!25200 () List!3763)

(assert (=> b!263476 (= e!170734 call!25200)))

(declare-fun b!263477 () Bool)

(assert (=> b!263477 (= e!170732 call!25202)))

(declare-fun e!170730 () List!3763)

(declare-fun c!44956 () Bool)

(declare-fun bm!25197 () Bool)

(declare-fun call!25201 () List!3763)

(declare-fun $colon$colon!107 (List!3763 tuple2!4886) List!3763)

(assert (=> bm!25197 (= call!25201 ($colon$colon!107 e!170730 (ite c!44956 (h!4425 (toList!1916 (map!2747 thiss!1504))) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017)))))))

(declare-fun c!44958 () Bool)

(assert (=> bm!25197 (= c!44958 c!44956)))

(declare-fun b!263478 () Bool)

(declare-fun c!44957 () Bool)

(declare-fun c!44955 () Bool)

(assert (=> b!263478 (= e!170730 (ite c!44957 (t!8832 (toList!1916 (map!2747 thiss!1504))) (ite c!44955 (Cons!3759 (h!4425 (toList!1916 (map!2747 thiss!1504))) (t!8832 (toList!1916 (map!2747 thiss!1504)))) Nil!3760)))))

(declare-fun b!263479 () Bool)

(assert (=> b!263479 (= e!170730 (insertStrictlySorted!180 (t!8832 (toList!1916 (map!2747 thiss!1504))) (_1!2454 lt!133017) (_2!2454 lt!133017)))))

(declare-fun bm!25198 () Bool)

(assert (=> bm!25198 (= call!25202 call!25200)))

(declare-fun d!63293 () Bool)

(declare-fun e!170733 () Bool)

(assert (=> d!63293 e!170733))

(declare-fun res!128674 () Bool)

(assert (=> d!63293 (=> (not res!128674) (not e!170733))))

(declare-fun lt!133429 () List!3763)

(assert (=> d!63293 (= res!128674 (isStrictlySorted!364 lt!133429))))

(declare-fun e!170731 () List!3763)

(assert (=> d!63293 (= lt!133429 e!170731)))

(assert (=> d!63293 (= c!44956 (and ((_ is Cons!3759) (toList!1916 (map!2747 thiss!1504))) (bvslt (_1!2454 (h!4425 (toList!1916 (map!2747 thiss!1504)))) (_1!2454 lt!133017))))))

(assert (=> d!63293 (isStrictlySorted!364 (toList!1916 (map!2747 thiss!1504)))))

(assert (=> d!63293 (= (insertStrictlySorted!180 (toList!1916 (map!2747 thiss!1504)) (_1!2454 lt!133017) (_2!2454 lt!133017)) lt!133429)))

(declare-fun b!263480 () Bool)

(assert (=> b!263480 (= e!170731 call!25201)))

(declare-fun bm!25199 () Bool)

(assert (=> bm!25199 (= call!25200 call!25201)))

(declare-fun b!263481 () Bool)

(assert (=> b!263481 (= e!170731 e!170734)))

(assert (=> b!263481 (= c!44957 (and ((_ is Cons!3759) (toList!1916 (map!2747 thiss!1504))) (= (_1!2454 (h!4425 (toList!1916 (map!2747 thiss!1504)))) (_1!2454 lt!133017))))))

(declare-fun b!263482 () Bool)

(assert (=> b!263482 (= e!170733 (contains!1888 lt!133429 (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun b!263483 () Bool)

(assert (=> b!263483 (= c!44955 (and ((_ is Cons!3759) (toList!1916 (map!2747 thiss!1504))) (bvsgt (_1!2454 (h!4425 (toList!1916 (map!2747 thiss!1504)))) (_1!2454 lt!133017))))))

(assert (=> b!263483 (= e!170734 e!170732)))

(declare-fun b!263484 () Bool)

(declare-fun res!128675 () Bool)

(assert (=> b!263484 (=> (not res!128675) (not e!170733))))

(assert (=> b!263484 (= res!128675 (containsKey!312 lt!133429 (_1!2454 lt!133017)))))

(assert (= (and d!63293 c!44956) b!263480))

(assert (= (and d!63293 (not c!44956)) b!263481))

(assert (= (and b!263481 c!44957) b!263476))

(assert (= (and b!263481 (not c!44957)) b!263483))

(assert (= (and b!263483 c!44955) b!263475))

(assert (= (and b!263483 (not c!44955)) b!263477))

(assert (= (or b!263475 b!263477) bm!25198))

(assert (= (or b!263476 bm!25198) bm!25199))

(assert (= (or b!263480 bm!25199) bm!25197))

(assert (= (and bm!25197 c!44958) b!263479))

(assert (= (and bm!25197 (not c!44958)) b!263478))

(assert (= (and d!63293 res!128674) b!263484))

(assert (= (and b!263484 res!128675) b!263482))

(declare-fun m!279803 () Bool)

(assert (=> b!263484 m!279803))

(declare-fun m!279805 () Bool)

(assert (=> b!263482 m!279805))

(declare-fun m!279807 () Bool)

(assert (=> b!263479 m!279807))

(declare-fun m!279809 () Bool)

(assert (=> bm!25197 m!279809))

(declare-fun m!279811 () Bool)

(assert (=> d!63293 m!279811))

(declare-fun m!279813 () Bool)

(assert (=> d!63293 m!279813))

(assert (=> d!63159 d!63293))

(declare-fun d!63295 () Bool)

(assert (=> d!63295 (= (apply!262 lt!133300 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3100 (getValueByKey!321 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9279 () Bool)

(assert (= bs!9279 d!63295))

(assert (=> bs!9279 m!279593))

(assert (=> bs!9279 m!279593))

(declare-fun m!279815 () Bool)

(assert (=> bs!9279 m!279815))

(assert (=> b!263273 d!63295))

(declare-fun b!263494 () Bool)

(declare-fun res!128686 () Bool)

(declare-fun e!170737 () Bool)

(assert (=> b!263494 (=> (not res!128686) (not e!170737))))

(declare-fun size!6352 (LongMapFixedSize!3868) (_ BitVec 32))

(assert (=> b!263494 (= res!128686 (bvsge (size!6352 lt!133011) (_size!1983 lt!133011)))))

(declare-fun d!63297 () Bool)

(declare-fun res!128687 () Bool)

(assert (=> d!63297 (=> (not res!128687) (not e!170737))))

(assert (=> d!63297 (= res!128687 (validMask!0 (mask!11208 lt!133011)))))

(assert (=> d!63297 (= (simpleValid!285 lt!133011) e!170737)))

(declare-fun b!263493 () Bool)

(declare-fun res!128685 () Bool)

(assert (=> b!263493 (=> (not res!128685) (not e!170737))))

(assert (=> b!263493 (= res!128685 (and (= (size!6346 (_values!4825 lt!133011)) (bvadd (mask!11208 lt!133011) #b00000000000000000000000000000001)) (= (size!6347 (_keys!7034 lt!133011)) (size!6346 (_values!4825 lt!133011))) (bvsge (_size!1983 lt!133011) #b00000000000000000000000000000000) (bvsle (_size!1983 lt!133011) (bvadd (mask!11208 lt!133011) #b00000000000000000000000000000001))))))

(declare-fun b!263496 () Bool)

(assert (=> b!263496 (= e!170737 (and (bvsge (extraKeys!4579 lt!133011) #b00000000000000000000000000000000) (bvsle (extraKeys!4579 lt!133011) #b00000000000000000000000000000011) (bvsge (_vacant!1983 lt!133011) #b00000000000000000000000000000000)))))

(declare-fun b!263495 () Bool)

(declare-fun res!128684 () Bool)

(assert (=> b!263495 (=> (not res!128684) (not e!170737))))

(assert (=> b!263495 (= res!128684 (= (size!6352 lt!133011) (bvadd (_size!1983 lt!133011) (bvsdiv (bvadd (extraKeys!4579 lt!133011) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!63297 res!128687) b!263493))

(assert (= (and b!263493 res!128685) b!263494))

(assert (= (and b!263494 res!128686) b!263495))

(assert (= (and b!263495 res!128684) b!263496))

(declare-fun m!279817 () Bool)

(assert (=> b!263494 m!279817))

(declare-fun m!279819 () Bool)

(assert (=> d!63297 m!279819))

(assert (=> b!263495 m!279817))

(assert (=> d!63191 d!63297))

(declare-fun b!263497 () Bool)

(declare-fun e!170738 () Bool)

(declare-fun call!25203 () Bool)

(assert (=> b!263497 (= e!170738 call!25203)))

(declare-fun bm!25200 () Bool)

(assert (=> bm!25200 (= call!25203 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504)))))

(declare-fun b!263498 () Bool)

(declare-fun e!170739 () Bool)

(assert (=> b!263498 (= e!170739 call!25203)))

(declare-fun b!263499 () Bool)

(declare-fun e!170740 () Bool)

(assert (=> b!263499 (= e!170740 e!170739)))

(declare-fun c!44959 () Bool)

(assert (=> b!263499 (= c!44959 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!63299 () Bool)

(declare-fun res!128689 () Bool)

(assert (=> d!63299 (=> res!128689 e!170740)))

(assert (=> d!63299 (= res!128689 (bvsge #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(assert (=> d!63299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504)) e!170740)))

(declare-fun b!263500 () Bool)

(assert (=> b!263500 (= e!170739 e!170738)))

(declare-fun lt!133431 () (_ BitVec 64))

(assert (=> b!263500 (= lt!133431 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133432 () Unit!8164)

(assert (=> b!263500 (= lt!133432 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) lt!133431 #b00000000000000000000000000000000))))

(assert (=> b!263500 (arrayContainsKey!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) lt!133431 #b00000000000000000000000000000000)))

(declare-fun lt!133430 () Unit!8164)

(assert (=> b!263500 (= lt!133430 lt!133432)))

(declare-fun res!128688 () Bool)

(assert (=> b!263500 (= res!128688 (= (seekEntryOrOpen!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504)) (Found!1164 #b00000000000000000000000000000000)))))

(assert (=> b!263500 (=> (not res!128688) (not e!170738))))

(assert (= (and d!63299 (not res!128689)) b!263499))

(assert (= (and b!263499 c!44959) b!263500))

(assert (= (and b!263499 (not c!44959)) b!263498))

(assert (= (and b!263500 res!128688) b!263497))

(assert (= (or b!263497 b!263498) bm!25200))

(declare-fun m!279821 () Bool)

(assert (=> bm!25200 m!279821))

(assert (=> b!263499 m!279611))

(assert (=> b!263499 m!279611))

(assert (=> b!263499 m!279615))

(assert (=> b!263500 m!279611))

(declare-fun m!279823 () Bool)

(assert (=> b!263500 m!279823))

(declare-fun m!279825 () Bool)

(assert (=> b!263500 m!279825))

(assert (=> b!263500 m!279611))

(declare-fun m!279827 () Bool)

(assert (=> b!263500 m!279827))

(assert (=> b!263256 d!63299))

(declare-fun b!263502 () Bool)

(declare-fun res!128692 () Bool)

(declare-fun e!170741 () Bool)

(assert (=> b!263502 (=> (not res!128692) (not e!170741))))

(assert (=> b!263502 (= res!128692 (bvsge (size!6352 thiss!1504) (_size!1983 thiss!1504)))))

(declare-fun d!63301 () Bool)

(declare-fun res!128693 () Bool)

(assert (=> d!63301 (=> (not res!128693) (not e!170741))))

(assert (=> d!63301 (= res!128693 (validMask!0 (mask!11208 thiss!1504)))))

(assert (=> d!63301 (= (simpleValid!285 thiss!1504) e!170741)))

(declare-fun b!263501 () Bool)

(declare-fun res!128691 () Bool)

(assert (=> b!263501 (=> (not res!128691) (not e!170741))))

(assert (=> b!263501 (= res!128691 (and (= (size!6346 (_values!4825 thiss!1504)) (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001)) (= (size!6347 (_keys!7034 thiss!1504)) (size!6346 (_values!4825 thiss!1504))) (bvsge (_size!1983 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1983 thiss!1504) (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!263504 () Bool)

(assert (=> b!263504 (= e!170741 (and (bvsge (extraKeys!4579 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4579 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1983 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!263503 () Bool)

(declare-fun res!128690 () Bool)

(assert (=> b!263503 (=> (not res!128690) (not e!170741))))

(assert (=> b!263503 (= res!128690 (= (size!6352 thiss!1504) (bvadd (_size!1983 thiss!1504) (bvsdiv (bvadd (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!63301 res!128693) b!263501))

(assert (= (and b!263501 res!128691) b!263502))

(assert (= (and b!263502 res!128692) b!263503))

(assert (= (and b!263503 res!128690) b!263504))

(declare-fun m!279829 () Bool)

(assert (=> b!263502 m!279829))

(assert (=> d!63301 m!279317))

(assert (=> b!263503 m!279829))

(assert (=> d!63211 d!63301))

(declare-fun d!63303 () Bool)

(assert (=> d!63303 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263239 d!63303))

(declare-fun d!63305 () Bool)

(assert (=> d!63305 (= (apply!262 lt!133244 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3100 (getValueByKey!321 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9280 () Bool)

(assert (= bs!9280 d!63305))

(declare-fun m!279831 () Bool)

(assert (=> bs!9280 m!279831))

(assert (=> bs!9280 m!279831))

(declare-fun m!279833 () Bool)

(assert (=> bs!9280 m!279833))

(assert (=> b!263160 d!63305))

(declare-fun d!63307 () Bool)

(assert (=> d!63307 (= (+!712 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (tuple2!4887 key!932 v!346)) (getCurrentListMap!1448 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(assert (=> d!63307 true))

(declare-fun _$3!67 () Unit!8164)

(assert (=> d!63307 (= (choose!1297 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 key!932 v!346 (defaultEntry!4842 thiss!1504)) _$3!67)))

(declare-fun bs!9281 () Bool)

(assert (= bs!9281 d!63307))

(assert (=> bs!9281 m!279091))

(assert (=> bs!9281 m!279443))

(assert (=> bs!9281 m!279123))

(assert (=> bs!9281 m!279095))

(assert (=> bs!9281 m!279445))

(assert (=> bs!9281 m!279091))

(assert (=> d!63177 d!63307))

(assert (=> d!63177 d!63237))

(declare-fun d!63309 () Bool)

(assert (=> d!63309 (= (apply!262 lt!133300 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) (get!3100 (getValueByKey!321 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))))

(declare-fun bs!9282 () Bool)

(assert (= bs!9282 d!63309))

(assert (=> bs!9282 m!279433))

(declare-fun m!279835 () Bool)

(assert (=> bs!9282 m!279835))

(assert (=> bs!9282 m!279835))

(declare-fun m!279837 () Bool)

(assert (=> bs!9282 m!279837))

(assert (=> b!263267 d!63309))

(declare-fun d!63311 () Bool)

(declare-fun c!44962 () Bool)

(assert (=> d!63311 (= c!44962 ((_ is ValueCellFull!2984) (select (arr!5995 lt!133020) #b00000000000000000000000000000000)))))

(declare-fun e!170744 () V!8521)

(assert (=> d!63311 (= (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!170744)))

(declare-fun b!263509 () Bool)

(declare-fun get!3101 (ValueCell!2984 V!8521) V!8521)

(assert (=> b!263509 (= e!170744 (get!3101 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263510 () Bool)

(declare-fun get!3102 (ValueCell!2984 V!8521) V!8521)

(assert (=> b!263510 (= e!170744 (get!3102 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63311 c!44962) b!263509))

(assert (= (and d!63311 (not c!44962)) b!263510))

(assert (=> b!263509 m!279511))

(assert (=> b!263509 m!279383))

(declare-fun m!279839 () Bool)

(assert (=> b!263509 m!279839))

(assert (=> b!263510 m!279511))

(assert (=> b!263510 m!279383))

(declare-fun m!279841 () Bool)

(assert (=> b!263510 m!279841))

(assert (=> b!263267 d!63311))

(declare-fun b!263511 () Bool)

(declare-fun e!170745 () Bool)

(declare-fun call!25204 () Bool)

(assert (=> b!263511 (= e!170745 call!25204)))

(declare-fun bm!25201 () Bool)

(assert (=> bm!25201 (= call!25204 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!133005 (mask!11208 thiss!1504)))))

(declare-fun b!263512 () Bool)

(declare-fun e!170746 () Bool)

(assert (=> b!263512 (= e!170746 call!25204)))

(declare-fun b!263513 () Bool)

(declare-fun e!170747 () Bool)

(assert (=> b!263513 (= e!170747 e!170746)))

(declare-fun c!44963 () Bool)

(assert (=> b!263513 (= c!44963 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63313 () Bool)

(declare-fun res!128695 () Bool)

(assert (=> d!63313 (=> res!128695 e!170747)))

(assert (=> d!63313 (= res!128695 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(assert (=> d!63313 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!133005 (mask!11208 thiss!1504)) e!170747)))

(declare-fun b!263514 () Bool)

(assert (=> b!263514 (= e!170746 e!170745)))

(declare-fun lt!133434 () (_ BitVec 64))

(assert (=> b!263514 (= lt!133434 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133435 () Unit!8164)

(assert (=> b!263514 (= lt!133435 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133005 lt!133434 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!263514 (arrayContainsKey!0 lt!133005 lt!133434 #b00000000000000000000000000000000)))

(declare-fun lt!133433 () Unit!8164)

(assert (=> b!263514 (= lt!133433 lt!133435)))

(declare-fun res!128694 () Bool)

(assert (=> b!263514 (= res!128694 (= (seekEntryOrOpen!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133005 (mask!11208 thiss!1504)) (Found!1164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263514 (=> (not res!128694) (not e!170745))))

(assert (= (and d!63313 (not res!128695)) b!263513))

(assert (= (and b!263513 c!44963) b!263514))

(assert (= (and b!263513 (not c!44963)) b!263512))

(assert (= (and b!263514 res!128694) b!263511))

(assert (= (or b!263511 b!263512) bm!25201))

(declare-fun m!279843 () Bool)

(assert (=> bm!25201 m!279843))

(declare-fun m!279845 () Bool)

(assert (=> b!263513 m!279845))

(assert (=> b!263513 m!279845))

(declare-fun m!279847 () Bool)

(assert (=> b!263513 m!279847))

(assert (=> b!263514 m!279845))

(declare-fun m!279849 () Bool)

(assert (=> b!263514 m!279849))

(declare-fun m!279851 () Bool)

(assert (=> b!263514 m!279851))

(assert (=> b!263514 m!279845))

(declare-fun m!279853 () Bool)

(assert (=> b!263514 m!279853))

(assert (=> bm!25175 d!63313))

(declare-fun d!63315 () Bool)

(assert (=> d!63315 (= (inRange!0 (index!6827 lt!133330) (mask!11208 thiss!1504)) (and (bvsge (index!6827 lt!133330) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133330) (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!263301 d!63315))

(assert (=> bm!25177 d!63249))

(assert (=> b!263225 d!63225))

(declare-fun d!63317 () Bool)

(assert (=> d!63317 (contains!1885 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (select (arr!5996 lt!133005) index!297))))

(assert (=> d!63317 true))

(declare-fun _$16!169 () Unit!8164)

(assert (=> d!63317 (= (choose!1298 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) index!297 (defaultEntry!4842 thiss!1504)) _$16!169)))

(declare-fun bs!9283 () Bool)

(assert (= bs!9283 d!63317))

(assert (=> bs!9283 m!279103))

(assert (=> bs!9283 m!279459))

(assert (=> bs!9283 m!279103))

(assert (=> bs!9283 m!279459))

(assert (=> bs!9283 m!279489))

(assert (=> d!63189 d!63317))

(assert (=> d!63189 d!63237))

(declare-fun d!63319 () Bool)

(declare-fun e!170748 () Bool)

(assert (=> d!63319 e!170748))

(declare-fun res!128696 () Bool)

(assert (=> d!63319 (=> (not res!128696) (not e!170748))))

(declare-fun lt!133437 () ListLongMap!3801)

(assert (=> d!63319 (= res!128696 (contains!1885 lt!133437 (_1!2454 (tuple2!4887 key!932 v!346))))))

(declare-fun lt!133438 () List!3763)

(assert (=> d!63319 (= lt!133437 (ListLongMap!3802 lt!133438))))

(declare-fun lt!133439 () Unit!8164)

(declare-fun lt!133436 () Unit!8164)

(assert (=> d!63319 (= lt!133439 lt!133436)))

(assert (=> d!63319 (= (getValueByKey!321 lt!133438 (_1!2454 (tuple2!4887 key!932 v!346))) (Some!326 (_2!2454 (tuple2!4887 key!932 v!346))))))

(assert (=> d!63319 (= lt!133436 (lemmaContainsTupThenGetReturnValue!177 lt!133438 (_1!2454 (tuple2!4887 key!932 v!346)) (_2!2454 (tuple2!4887 key!932 v!346))))))

(assert (=> d!63319 (= lt!133438 (insertStrictlySorted!180 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (_1!2454 (tuple2!4887 key!932 v!346)) (_2!2454 (tuple2!4887 key!932 v!346))))))

(assert (=> d!63319 (= (+!712 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (tuple2!4887 key!932 v!346)) lt!133437)))

(declare-fun b!263515 () Bool)

(declare-fun res!128697 () Bool)

(assert (=> b!263515 (=> (not res!128697) (not e!170748))))

(assert (=> b!263515 (= res!128697 (= (getValueByKey!321 (toList!1916 lt!133437) (_1!2454 (tuple2!4887 key!932 v!346))) (Some!326 (_2!2454 (tuple2!4887 key!932 v!346)))))))

(declare-fun b!263516 () Bool)

(assert (=> b!263516 (= e!170748 (contains!1888 (toList!1916 lt!133437) (tuple2!4887 key!932 v!346)))))

(assert (= (and d!63319 res!128696) b!263515))

(assert (= (and b!263515 res!128697) b!263516))

(declare-fun m!279855 () Bool)

(assert (=> d!63319 m!279855))

(declare-fun m!279857 () Bool)

(assert (=> d!63319 m!279857))

(declare-fun m!279859 () Bool)

(assert (=> d!63319 m!279859))

(declare-fun m!279861 () Bool)

(assert (=> d!63319 m!279861))

(declare-fun m!279863 () Bool)

(assert (=> b!263515 m!279863))

(declare-fun m!279865 () Bool)

(assert (=> b!263516 m!279865))

(assert (=> b!263200 d!63319))

(assert (=> b!263200 d!63173))

(declare-fun b!263517 () Bool)

(declare-fun e!170751 () Bool)

(declare-fun lt!133445 () ListLongMap!3801)

(assert (=> b!263517 (= e!170751 (= (apply!262 lt!133445 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4683 thiss!1504)))))

(declare-fun b!263518 () Bool)

(declare-fun e!170752 () Unit!8164)

(declare-fun Unit!8186 () Unit!8164)

(assert (=> b!263518 (= e!170752 Unit!8186)))

(declare-fun b!263519 () Bool)

(declare-fun e!170758 () Bool)

(declare-fun call!25210 () Bool)

(assert (=> b!263519 (= e!170758 (not call!25210))))

(declare-fun b!263520 () Bool)

(declare-fun e!170761 () Bool)

(assert (=> b!263520 (= e!170758 e!170761)))

(declare-fun res!128699 () Bool)

(assert (=> b!263520 (= res!128699 call!25210)))

(assert (=> b!263520 (=> (not res!128699) (not e!170761))))

(declare-fun b!263522 () Bool)

(declare-fun lt!133447 () Unit!8164)

(assert (=> b!263522 (= e!170752 lt!133447)))

(declare-fun lt!133454 () ListLongMap!3801)

(assert (=> b!263522 (= lt!133454 (getCurrentListMapNoExtraKeys!578 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133460 () (_ BitVec 64))

(assert (=> b!263522 (= lt!133460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133443 () (_ BitVec 64))

(assert (=> b!263522 (= lt!133443 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133449 () Unit!8164)

(assert (=> b!263522 (= lt!133449 (addStillContains!238 lt!133454 lt!133460 (zeroValue!4683 thiss!1504) lt!133443))))

(assert (=> b!263522 (contains!1885 (+!712 lt!133454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504))) lt!133443)))

(declare-fun lt!133440 () Unit!8164)

(assert (=> b!263522 (= lt!133440 lt!133449)))

(declare-fun lt!133457 () ListLongMap!3801)

(assert (=> b!263522 (= lt!133457 (getCurrentListMapNoExtraKeys!578 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133448 () (_ BitVec 64))

(assert (=> b!263522 (= lt!133448 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133451 () (_ BitVec 64))

(assert (=> b!263522 (= lt!133451 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133455 () Unit!8164)

(assert (=> b!263522 (= lt!133455 (addApplyDifferent!238 lt!133457 lt!133448 (minValue!4683 thiss!1504) lt!133451))))

(assert (=> b!263522 (= (apply!262 (+!712 lt!133457 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504))) lt!133451) (apply!262 lt!133457 lt!133451))))

(declare-fun lt!133452 () Unit!8164)

(assert (=> b!263522 (= lt!133452 lt!133455)))

(declare-fun lt!133458 () ListLongMap!3801)

(assert (=> b!263522 (= lt!133458 (getCurrentListMapNoExtraKeys!578 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133441 () (_ BitVec 64))

(assert (=> b!263522 (= lt!133441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133461 () (_ BitVec 64))

(assert (=> b!263522 (= lt!133461 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!133442 () Unit!8164)

(assert (=> b!263522 (= lt!133442 (addApplyDifferent!238 lt!133458 lt!133441 (zeroValue!4683 thiss!1504) lt!133461))))

(assert (=> b!263522 (= (apply!262 (+!712 lt!133458 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504))) lt!133461) (apply!262 lt!133458 lt!133461))))

(declare-fun lt!133446 () Unit!8164)

(assert (=> b!263522 (= lt!133446 lt!133442)))

(declare-fun lt!133450 () ListLongMap!3801)

(assert (=> b!263522 (= lt!133450 (getCurrentListMapNoExtraKeys!578 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun lt!133444 () (_ BitVec 64))

(assert (=> b!263522 (= lt!133444 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133459 () (_ BitVec 64))

(assert (=> b!263522 (= lt!133459 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!263522 (= lt!133447 (addApplyDifferent!238 lt!133450 lt!133444 (minValue!4683 thiss!1504) lt!133459))))

(assert (=> b!263522 (= (apply!262 (+!712 lt!133450 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504))) lt!133459) (apply!262 lt!133450 lt!133459))))

(declare-fun bm!25202 () Bool)

(declare-fun call!25208 () ListLongMap!3801)

(declare-fun call!25205 () ListLongMap!3801)

(assert (=> bm!25202 (= call!25208 call!25205)))

(declare-fun b!263523 () Bool)

(declare-fun e!170759 () Bool)

(assert (=> b!263523 (= e!170759 e!170758)))

(declare-fun c!44969 () Bool)

(assert (=> b!263523 (= c!44969 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263524 () Bool)

(declare-fun e!170760 () ListLongMap!3801)

(declare-fun call!25211 () ListLongMap!3801)

(assert (=> b!263524 (= e!170760 (+!712 call!25211 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun b!263525 () Bool)

(declare-fun e!170754 () Bool)

(assert (=> b!263525 (= e!170754 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263526 () Bool)

(declare-fun e!170753 () ListLongMap!3801)

(assert (=> b!263526 (= e!170760 e!170753)))

(declare-fun c!44968 () Bool)

(assert (=> b!263526 (= c!44968 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263527 () Bool)

(declare-fun e!170755 () Bool)

(assert (=> b!263527 (= e!170755 (= (apply!262 lt!133445 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)) (get!3099 (select (arr!5995 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6346 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))))))))

(assert (=> b!263527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(declare-fun b!263528 () Bool)

(declare-fun res!128703 () Bool)

(assert (=> b!263528 (=> (not res!128703) (not e!170759))))

(declare-fun e!170750 () Bool)

(assert (=> b!263528 (= res!128703 e!170750)))

(declare-fun c!44964 () Bool)

(assert (=> b!263528 (= c!44964 (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!25203 () Bool)

(declare-fun call!25207 () ListLongMap!3801)

(assert (=> bm!25203 (= call!25207 (getCurrentListMapNoExtraKeys!578 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263529 () Bool)

(declare-fun e!170749 () ListLongMap!3801)

(declare-fun call!25206 () ListLongMap!3801)

(assert (=> b!263529 (= e!170749 call!25206)))

(declare-fun b!263521 () Bool)

(declare-fun e!170757 () Bool)

(assert (=> b!263521 (= e!170757 e!170755)))

(declare-fun res!128704 () Bool)

(assert (=> b!263521 (=> (not res!128704) (not e!170755))))

(assert (=> b!263521 (= res!128704 (contains!1885 lt!133445 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(declare-fun d!63321 () Bool)

(assert (=> d!63321 e!170759))

(declare-fun res!128702 () Bool)

(assert (=> d!63321 (=> (not res!128702) (not e!170759))))

(assert (=> d!63321 (= res!128702 (or (bvsge #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))))

(declare-fun lt!133453 () ListLongMap!3801)

(assert (=> d!63321 (= lt!133445 lt!133453)))

(declare-fun lt!133456 () Unit!8164)

(assert (=> d!63321 (= lt!133456 e!170752)))

(declare-fun c!44967 () Bool)

(declare-fun e!170756 () Bool)

(assert (=> d!63321 (= c!44967 e!170756)))

(declare-fun res!128706 () Bool)

(assert (=> d!63321 (=> (not res!128706) (not e!170756))))

(assert (=> d!63321 (= res!128706 (bvslt #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(assert (=> d!63321 (= lt!133453 e!170760)))

(declare-fun c!44965 () Bool)

(assert (=> d!63321 (= c!44965 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63321 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63321 (= (getCurrentListMap!1448 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133445)))

(declare-fun b!263530 () Bool)

(declare-fun c!44966 () Bool)

(assert (=> b!263530 (= c!44966 (and (not (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!263530 (= e!170753 e!170749)))

(declare-fun bm!25204 () Bool)

(assert (=> bm!25204 (= call!25206 call!25211)))

(declare-fun bm!25205 () Bool)

(assert (=> bm!25205 (= call!25211 (+!712 (ite c!44965 call!25207 (ite c!44968 call!25205 call!25208)) (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!263531 () Bool)

(declare-fun call!25209 () Bool)

(assert (=> b!263531 (= e!170750 (not call!25209))))

(declare-fun b!263532 () Bool)

(assert (=> b!263532 (= e!170756 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263533 () Bool)

(assert (=> b!263533 (= e!170761 (= (apply!262 lt!133445 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4683 thiss!1504)))))

(declare-fun b!263534 () Bool)

(assert (=> b!263534 (= e!170749 call!25208)))

(declare-fun bm!25206 () Bool)

(assert (=> bm!25206 (= call!25210 (contains!1885 lt!133445 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263535 () Bool)

(assert (=> b!263535 (= e!170750 e!170751)))

(declare-fun res!128698 () Bool)

(assert (=> b!263535 (= res!128698 call!25209)))

(assert (=> b!263535 (=> (not res!128698) (not e!170751))))

(declare-fun bm!25207 () Bool)

(assert (=> bm!25207 (= call!25209 (contains!1885 lt!133445 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25208 () Bool)

(assert (=> bm!25208 (= call!25205 call!25207)))

(declare-fun b!263536 () Bool)

(assert (=> b!263536 (= e!170753 call!25206)))

(declare-fun b!263537 () Bool)

(declare-fun res!128700 () Bool)

(assert (=> b!263537 (=> (not res!128700) (not e!170759))))

(assert (=> b!263537 (= res!128700 e!170757)))

(declare-fun res!128701 () Bool)

(assert (=> b!263537 (=> res!128701 e!170757)))

(assert (=> b!263537 (= res!128701 (not e!170754))))

(declare-fun res!128705 () Bool)

(assert (=> b!263537 (=> (not res!128705) (not e!170754))))

(assert (=> b!263537 (= res!128705 (bvslt #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(assert (= (and d!63321 c!44965) b!263524))

(assert (= (and d!63321 (not c!44965)) b!263526))

(assert (= (and b!263526 c!44968) b!263536))

(assert (= (and b!263526 (not c!44968)) b!263530))

(assert (= (and b!263530 c!44966) b!263529))

(assert (= (and b!263530 (not c!44966)) b!263534))

(assert (= (or b!263529 b!263534) bm!25202))

(assert (= (or b!263536 bm!25202) bm!25208))

(assert (= (or b!263536 b!263529) bm!25204))

(assert (= (or b!263524 bm!25208) bm!25203))

(assert (= (or b!263524 bm!25204) bm!25205))

(assert (= (and d!63321 res!128706) b!263532))

(assert (= (and d!63321 c!44967) b!263522))

(assert (= (and d!63321 (not c!44967)) b!263518))

(assert (= (and d!63321 res!128702) b!263537))

(assert (= (and b!263537 res!128705) b!263525))

(assert (= (and b!263537 (not res!128701)) b!263521))

(assert (= (and b!263521 res!128704) b!263527))

(assert (= (and b!263537 res!128700) b!263528))

(assert (= (and b!263528 c!44964) b!263535))

(assert (= (and b!263528 (not c!44964)) b!263531))

(assert (= (and b!263535 res!128698) b!263517))

(assert (= (or b!263535 b!263531) bm!25207))

(assert (= (and b!263528 res!128703) b!263523))

(assert (= (and b!263523 c!44969) b!263520))

(assert (= (and b!263523 (not c!44969)) b!263519))

(assert (= (and b!263520 res!128699) b!263533))

(assert (= (or b!263520 b!263519) bm!25206))

(declare-fun b_lambda!8365 () Bool)

(assert (=> (not b_lambda!8365) (not b!263527)))

(assert (=> b!263527 t!8837))

(declare-fun b_and!13963 () Bool)

(assert (= b_and!13961 (and (=> t!8837 result!5425) b_and!13963)))

(declare-fun m!279867 () Bool)

(assert (=> bm!25203 m!279867))

(assert (=> b!263521 m!279611))

(assert (=> b!263521 m!279611))

(declare-fun m!279869 () Bool)

(assert (=> b!263521 m!279869))

(declare-fun m!279871 () Bool)

(assert (=> bm!25207 m!279871))

(assert (=> b!263527 m!279611))

(assert (=> b!263527 m!279383))

(declare-fun m!279873 () Bool)

(assert (=> b!263527 m!279873))

(assert (=> b!263527 m!279383))

(declare-fun m!279875 () Bool)

(assert (=> b!263527 m!279875))

(assert (=> b!263527 m!279873))

(assert (=> b!263527 m!279611))

(declare-fun m!279877 () Bool)

(assert (=> b!263527 m!279877))

(assert (=> d!63321 m!279317))

(declare-fun m!279879 () Bool)

(assert (=> b!263533 m!279879))

(assert (=> b!263525 m!279611))

(assert (=> b!263525 m!279611))

(assert (=> b!263525 m!279615))

(declare-fun m!279881 () Bool)

(assert (=> bm!25206 m!279881))

(declare-fun m!279883 () Bool)

(assert (=> b!263524 m!279883))

(assert (=> b!263532 m!279611))

(assert (=> b!263532 m!279611))

(assert (=> b!263532 m!279615))

(declare-fun m!279885 () Bool)

(assert (=> bm!25205 m!279885))

(declare-fun m!279887 () Bool)

(assert (=> b!263522 m!279887))

(declare-fun m!279889 () Bool)

(assert (=> b!263522 m!279889))

(declare-fun m!279891 () Bool)

(assert (=> b!263522 m!279891))

(declare-fun m!279893 () Bool)

(assert (=> b!263522 m!279893))

(declare-fun m!279895 () Bool)

(assert (=> b!263522 m!279895))

(declare-fun m!279897 () Bool)

(assert (=> b!263522 m!279897))

(declare-fun m!279899 () Bool)

(assert (=> b!263522 m!279899))

(declare-fun m!279901 () Bool)

(assert (=> b!263522 m!279901))

(declare-fun m!279903 () Bool)

(assert (=> b!263522 m!279903))

(assert (=> b!263522 m!279893))

(declare-fun m!279905 () Bool)

(assert (=> b!263522 m!279905))

(declare-fun m!279907 () Bool)

(assert (=> b!263522 m!279907))

(declare-fun m!279909 () Bool)

(assert (=> b!263522 m!279909))

(assert (=> b!263522 m!279897))

(assert (=> b!263522 m!279611))

(declare-fun m!279911 () Bool)

(assert (=> b!263522 m!279911))

(declare-fun m!279913 () Bool)

(assert (=> b!263522 m!279913))

(assert (=> b!263522 m!279887))

(assert (=> b!263522 m!279907))

(assert (=> b!263522 m!279867))

(declare-fun m!279915 () Bool)

(assert (=> b!263522 m!279915))

(declare-fun m!279917 () Bool)

(assert (=> b!263517 m!279917))

(assert (=> b!263200 d!63321))

(declare-fun d!63323 () Bool)

(assert (=> d!63323 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133019) key!932))))

(declare-fun lt!133464 () Unit!8164)

(declare-fun choose!1303 (List!3763 (_ BitVec 64)) Unit!8164)

(assert (=> d!63323 (= lt!133464 (choose!1303 (toList!1916 lt!133019) key!932))))

(declare-fun e!170764 () Bool)

(assert (=> d!63323 e!170764))

(declare-fun res!128709 () Bool)

(assert (=> d!63323 (=> (not res!128709) (not e!170764))))

(assert (=> d!63323 (= res!128709 (isStrictlySorted!364 (toList!1916 lt!133019)))))

(assert (=> d!63323 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133019) key!932) lt!133464)))

(declare-fun b!263540 () Bool)

(assert (=> b!263540 (= e!170764 (containsKey!312 (toList!1916 lt!133019) key!932))))

(assert (= (and d!63323 res!128709) b!263540))

(assert (=> d!63323 m!279329))

(assert (=> d!63323 m!279329))

(assert (=> d!63323 m!279331))

(declare-fun m!279919 () Bool)

(assert (=> d!63323 m!279919))

(declare-fun m!279921 () Bool)

(assert (=> d!63323 m!279921))

(assert (=> b!263540 m!279325))

(assert (=> b!263082 d!63323))

(declare-fun d!63325 () Bool)

(declare-fun isEmpty!547 (Option!327) Bool)

(assert (=> d!63325 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133019) key!932)) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133019) key!932))))))

(declare-fun bs!9284 () Bool)

(assert (= bs!9284 d!63325))

(assert (=> bs!9284 m!279329))

(declare-fun m!279923 () Bool)

(assert (=> bs!9284 m!279923))

(assert (=> b!263082 d!63325))

(declare-fun b!263544 () Bool)

(declare-fun e!170766 () Option!327)

(assert (=> b!263544 (= e!170766 None!325)))

(declare-fun b!263542 () Bool)

(declare-fun e!170765 () Option!327)

(assert (=> b!263542 (= e!170765 e!170766)))

(declare-fun c!44971 () Bool)

(assert (=> b!263542 (= c!44971 (and ((_ is Cons!3759) (toList!1916 lt!133019)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133019))) key!932))))))

(declare-fun b!263543 () Bool)

(assert (=> b!263543 (= e!170766 (getValueByKey!321 (t!8832 (toList!1916 lt!133019)) key!932))))

(declare-fun d!63327 () Bool)

(declare-fun c!44970 () Bool)

(assert (=> d!63327 (= c!44970 (and ((_ is Cons!3759) (toList!1916 lt!133019)) (= (_1!2454 (h!4425 (toList!1916 lt!133019))) key!932)))))

(assert (=> d!63327 (= (getValueByKey!321 (toList!1916 lt!133019) key!932) e!170765)))

(declare-fun b!263541 () Bool)

(assert (=> b!263541 (= e!170765 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133019)))))))

(assert (= (and d!63327 c!44970) b!263541))

(assert (= (and d!63327 (not c!44970)) b!263542))

(assert (= (and b!263542 c!44971) b!263543))

(assert (= (and b!263542 (not c!44971)) b!263544))

(declare-fun m!279925 () Bool)

(assert (=> b!263543 m!279925))

(assert (=> b!263082 d!63327))

(assert (=> d!63197 d!63237))

(declare-fun b!263545 () Bool)

(declare-fun e!170767 () Bool)

(declare-fun call!25212 () Bool)

(assert (=> b!263545 (= e!170767 call!25212)))

(declare-fun bm!25209 () Bool)

(assert (=> bm!25209 (= call!25212 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun b!263546 () Bool)

(declare-fun e!170768 () Bool)

(assert (=> b!263546 (= e!170768 call!25212)))

(declare-fun b!263547 () Bool)

(declare-fun e!170769 () Bool)

(assert (=> b!263547 (= e!170769 e!170768)))

(declare-fun c!44972 () Bool)

(assert (=> b!263547 (= c!44972 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!63329 () Bool)

(declare-fun res!128711 () Bool)

(assert (=> d!63329 (=> res!128711 e!170769)))

(assert (=> d!63329 (= res!128711 (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)) e!170769)))

(declare-fun b!263548 () Bool)

(assert (=> b!263548 (= e!170768 e!170767)))

(declare-fun lt!133466 () (_ BitVec 64))

(assert (=> b!263548 (= lt!133466 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!133467 () Unit!8164)

(assert (=> b!263548 (= lt!133467 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7034 thiss!1504) lt!133466 #b00000000000000000000000000000000))))

(assert (=> b!263548 (arrayContainsKey!0 (_keys!7034 thiss!1504) lt!133466 #b00000000000000000000000000000000)))

(declare-fun lt!133465 () Unit!8164)

(assert (=> b!263548 (= lt!133465 lt!133467)))

(declare-fun res!128710 () Bool)

(assert (=> b!263548 (= res!128710 (= (seekEntryOrOpen!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (_keys!7034 thiss!1504) (mask!11208 thiss!1504)) (Found!1164 #b00000000000000000000000000000000)))))

(assert (=> b!263548 (=> (not res!128710) (not e!170767))))

(assert (= (and d!63329 (not res!128711)) b!263547))

(assert (= (and b!263547 c!44972) b!263548))

(assert (= (and b!263547 (not c!44972)) b!263546))

(assert (= (and b!263548 res!128710) b!263545))

(assert (= (or b!263545 b!263546) bm!25209))

(declare-fun m!279927 () Bool)

(assert (=> bm!25209 m!279927))

(assert (=> b!263547 m!279365))

(assert (=> b!263547 m!279365))

(assert (=> b!263547 m!279393))

(assert (=> b!263548 m!279365))

(declare-fun m!279929 () Bool)

(assert (=> b!263548 m!279929))

(declare-fun m!279931 () Bool)

(assert (=> b!263548 m!279931))

(assert (=> b!263548 m!279365))

(declare-fun m!279933 () Bool)

(assert (=> b!263548 m!279933))

(assert (=> b!263304 d!63329))

(declare-fun d!63331 () Bool)

(assert (=> d!63331 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133013) key!932))))

(declare-fun lt!133468 () Unit!8164)

(assert (=> d!63331 (= lt!133468 (choose!1303 (toList!1916 lt!133013) key!932))))

(declare-fun e!170770 () Bool)

(assert (=> d!63331 e!170770))

(declare-fun res!128712 () Bool)

(assert (=> d!63331 (=> (not res!128712) (not e!170770))))

(assert (=> d!63331 (= res!128712 (isStrictlySorted!364 (toList!1916 lt!133013)))))

(assert (=> d!63331 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133013) key!932) lt!133468)))

(declare-fun b!263549 () Bool)

(assert (=> b!263549 (= e!170770 (containsKey!312 (toList!1916 lt!133013) key!932))))

(assert (= (and d!63331 res!128712) b!263549))

(assert (=> d!63331 m!279373))

(assert (=> d!63331 m!279373))

(assert (=> d!63331 m!279375))

(declare-fun m!279935 () Bool)

(assert (=> d!63331 m!279935))

(declare-fun m!279937 () Bool)

(assert (=> d!63331 m!279937))

(assert (=> b!263549 m!279369))

(assert (=> b!263115 d!63331))

(declare-fun d!63333 () Bool)

(assert (=> d!63333 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133013) key!932)) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133013) key!932))))))

(declare-fun bs!9285 () Bool)

(assert (= bs!9285 d!63333))

(assert (=> bs!9285 m!279373))

(declare-fun m!279939 () Bool)

(assert (=> bs!9285 m!279939))

(assert (=> b!263115 d!63333))

(declare-fun b!263553 () Bool)

(declare-fun e!170772 () Option!327)

(assert (=> b!263553 (= e!170772 None!325)))

(declare-fun b!263551 () Bool)

(declare-fun e!170771 () Option!327)

(assert (=> b!263551 (= e!170771 e!170772)))

(declare-fun c!44974 () Bool)

(assert (=> b!263551 (= c!44974 (and ((_ is Cons!3759) (toList!1916 lt!133013)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133013))) key!932))))))

(declare-fun b!263552 () Bool)

(assert (=> b!263552 (= e!170772 (getValueByKey!321 (t!8832 (toList!1916 lt!133013)) key!932))))

(declare-fun d!63335 () Bool)

(declare-fun c!44973 () Bool)

(assert (=> d!63335 (= c!44973 (and ((_ is Cons!3759) (toList!1916 lt!133013)) (= (_1!2454 (h!4425 (toList!1916 lt!133013))) key!932)))))

(assert (=> d!63335 (= (getValueByKey!321 (toList!1916 lt!133013) key!932) e!170771)))

(declare-fun b!263550 () Bool)

(assert (=> b!263550 (= e!170771 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133013)))))))

(assert (= (and d!63335 c!44973) b!263550))

(assert (= (and d!63335 (not c!44973)) b!263551))

(assert (= (and b!263551 c!44974) b!263552))

(assert (= (and b!263551 (not c!44974)) b!263553))

(declare-fun m!279941 () Bool)

(assert (=> b!263552 m!279941))

(assert (=> b!263115 d!63335))

(declare-fun d!63337 () Bool)

(assert (=> d!63337 (= (arrayCountValidKeys!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!7034 thiss!1504) #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!63337 true))

(declare-fun _$84!48 () Unit!8164)

(assert (=> d!63337 (= (choose!1 (_keys!7034 thiss!1504) index!297 key!932) _$84!48)))

(declare-fun bs!9286 () Bool)

(assert (= bs!9286 d!63337))

(assert (=> bs!9286 m!279123))

(assert (=> bs!9286 m!279477))

(assert (=> bs!9286 m!279107))

(assert (=> d!63187 d!63337))

(assert (=> b!263117 d!63333))

(assert (=> b!263117 d!63335))

(assert (=> bm!25145 d!63167))

(declare-fun d!63339 () Bool)

(declare-fun lt!133471 () Bool)

(declare-fun content!178 (List!3763) (InoxSet tuple2!4886))

(assert (=> d!63339 (= lt!133471 (select (content!178 (toList!1916 lt!133176)) lt!133017))))

(declare-fun e!170778 () Bool)

(assert (=> d!63339 (= lt!133471 e!170778)))

(declare-fun res!128718 () Bool)

(assert (=> d!63339 (=> (not res!128718) (not e!170778))))

(assert (=> d!63339 (= res!128718 ((_ is Cons!3759) (toList!1916 lt!133176)))))

(assert (=> d!63339 (= (contains!1888 (toList!1916 lt!133176) lt!133017) lt!133471)))

(declare-fun b!263558 () Bool)

(declare-fun e!170777 () Bool)

(assert (=> b!263558 (= e!170778 e!170777)))

(declare-fun res!128717 () Bool)

(assert (=> b!263558 (=> res!128717 e!170777)))

(assert (=> b!263558 (= res!128717 (= (h!4425 (toList!1916 lt!133176)) lt!133017))))

(declare-fun b!263559 () Bool)

(assert (=> b!263559 (= e!170777 (contains!1888 (t!8832 (toList!1916 lt!133176)) lt!133017))))

(assert (= (and d!63339 res!128718) b!263558))

(assert (= (and b!263558 (not res!128717)) b!263559))

(declare-fun m!279943 () Bool)

(assert (=> d!63339 m!279943))

(declare-fun m!279945 () Bool)

(assert (=> d!63339 m!279945))

(declare-fun m!279947 () Bool)

(assert (=> b!263559 m!279947))

(assert (=> b!263090 d!63339))

(assert (=> b!263279 d!63285))

(declare-fun d!63341 () Bool)

(declare-fun e!170779 () Bool)

(assert (=> d!63341 e!170779))

(declare-fun res!128719 () Bool)

(assert (=> d!63341 (=> (not res!128719) (not e!170779))))

(declare-fun lt!133473 () ListLongMap!3801)

(assert (=> d!63341 (= res!128719 (contains!1885 lt!133473 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133474 () List!3763)

(assert (=> d!63341 (= lt!133473 (ListLongMap!3802 lt!133474))))

(declare-fun lt!133475 () Unit!8164)

(declare-fun lt!133472 () Unit!8164)

(assert (=> d!63341 (= lt!133475 lt!133472)))

(assert (=> d!63341 (= (getValueByKey!321 lt!133474 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63341 (= lt!133472 (lemmaContainsTupThenGetReturnValue!177 lt!133474 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63341 (= lt!133474 (insertStrictlySorted!180 (toList!1916 call!25169) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63341 (= (+!712 call!25169 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) lt!133473)))

(declare-fun b!263560 () Bool)

(declare-fun res!128720 () Bool)

(assert (=> b!263560 (=> (not res!128720) (not e!170779))))

(assert (=> b!263560 (= res!128720 (= (getValueByKey!321 (toList!1916 lt!133473) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!263561 () Bool)

(assert (=> b!263561 (= e!170779 (contains!1888 (toList!1916 lt!133473) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(assert (= (and d!63341 res!128719) b!263560))

(assert (= (and b!263560 res!128720) b!263561))

(declare-fun m!279949 () Bool)

(assert (=> d!63341 m!279949))

(declare-fun m!279951 () Bool)

(assert (=> d!63341 m!279951))

(declare-fun m!279953 () Bool)

(assert (=> d!63341 m!279953))

(declare-fun m!279955 () Bool)

(assert (=> d!63341 m!279955))

(declare-fun m!279957 () Bool)

(assert (=> b!263560 m!279957))

(declare-fun m!279959 () Bool)

(assert (=> b!263561 m!279959))

(assert (=> b!263167 d!63341))

(declare-fun b!263574 () Bool)

(declare-fun e!170787 () SeekEntryResult!1164)

(assert (=> b!263574 (= e!170787 (Found!1164 (index!6828 lt!133190)))))

(declare-fun b!263575 () Bool)

(declare-fun e!170788 () SeekEntryResult!1164)

(assert (=> b!263575 (= e!170788 e!170787)))

(declare-fun c!44983 () Bool)

(declare-fun lt!133481 () (_ BitVec 64))

(assert (=> b!263575 (= c!44983 (= lt!133481 key!932))))

(declare-fun b!263576 () Bool)

(assert (=> b!263576 (= e!170788 Undefined!1164)))

(declare-fun b!263577 () Bool)

(declare-fun e!170786 () SeekEntryResult!1164)

(assert (=> b!263577 (= e!170786 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001) (nextIndex!0 (index!6828 lt!133190) (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001) (mask!11208 thiss!1504)) (index!6828 lt!133190) key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun lt!133480 () SeekEntryResult!1164)

(declare-fun d!63343 () Bool)

(assert (=> d!63343 (and (or ((_ is Undefined!1164) lt!133480) (not ((_ is Found!1164) lt!133480)) (and (bvsge (index!6827 lt!133480) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133480) (size!6347 (_keys!7034 thiss!1504))))) (or ((_ is Undefined!1164) lt!133480) ((_ is Found!1164) lt!133480) (not ((_ is MissingVacant!1164) lt!133480)) (not (= (index!6829 lt!133480) (index!6828 lt!133190))) (and (bvsge (index!6829 lt!133480) #b00000000000000000000000000000000) (bvslt (index!6829 lt!133480) (size!6347 (_keys!7034 thiss!1504))))) (or ((_ is Undefined!1164) lt!133480) (ite ((_ is Found!1164) lt!133480) (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6827 lt!133480)) key!932) (and ((_ is MissingVacant!1164) lt!133480) (= (index!6829 lt!133480) (index!6828 lt!133190)) (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6829 lt!133480)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!63343 (= lt!133480 e!170788)))

(declare-fun c!44982 () Bool)

(assert (=> d!63343 (= c!44982 (bvsge (x!25206 lt!133190) #b01111111111111111111111111111110))))

(assert (=> d!63343 (= lt!133481 (select (arr!5996 (_keys!7034 thiss!1504)) (index!6828 lt!133190)))))

(assert (=> d!63343 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63343 (= (seekKeyOrZeroReturnVacant!0 (x!25206 lt!133190) (index!6828 lt!133190) (index!6828 lt!133190) key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)) lt!133480)))

(declare-fun b!263578 () Bool)

(assert (=> b!263578 (= e!170786 (MissingVacant!1164 (index!6828 lt!133190)))))

(declare-fun b!263579 () Bool)

(declare-fun c!44981 () Bool)

(assert (=> b!263579 (= c!44981 (= lt!133481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263579 (= e!170787 e!170786)))

(assert (= (and d!63343 c!44982) b!263576))

(assert (= (and d!63343 (not c!44982)) b!263575))

(assert (= (and b!263575 c!44983) b!263574))

(assert (= (and b!263575 (not c!44983)) b!263579))

(assert (= (and b!263579 c!44981) b!263578))

(assert (= (and b!263579 (not c!44981)) b!263577))

(declare-fun m!279961 () Bool)

(assert (=> b!263577 m!279961))

(assert (=> b!263577 m!279961))

(declare-fun m!279963 () Bool)

(assert (=> b!263577 m!279963))

(declare-fun m!279965 () Bool)

(assert (=> d!63343 m!279965))

(declare-fun m!279967 () Bool)

(assert (=> d!63343 m!279967))

(assert (=> d!63343 m!279363))

(assert (=> d!63343 m!279317))

(assert (=> b!263103 d!63343))

(assert (=> b!263265 d!63225))

(declare-fun d!63345 () Bool)

(declare-fun lt!133482 () Bool)

(assert (=> d!63345 (= lt!133482 (select (content!178 (toList!1916 lt!133265)) lt!133017))))

(declare-fun e!170790 () Bool)

(assert (=> d!63345 (= lt!133482 e!170790)))

(declare-fun res!128722 () Bool)

(assert (=> d!63345 (=> (not res!128722) (not e!170790))))

(assert (=> d!63345 (= res!128722 ((_ is Cons!3759) (toList!1916 lt!133265)))))

(assert (=> d!63345 (= (contains!1888 (toList!1916 lt!133265) lt!133017) lt!133482)))

(declare-fun b!263580 () Bool)

(declare-fun e!170789 () Bool)

(assert (=> b!263580 (= e!170790 e!170789)))

(declare-fun res!128721 () Bool)

(assert (=> b!263580 (=> res!128721 e!170789)))

(assert (=> b!263580 (= res!128721 (= (h!4425 (toList!1916 lt!133265)) lt!133017))))

(declare-fun b!263581 () Bool)

(assert (=> b!263581 (= e!170789 (contains!1888 (t!8832 (toList!1916 lt!133265)) lt!133017))))

(assert (= (and d!63345 res!128722) b!263580))

(assert (= (and b!263580 (not res!128721)) b!263581))

(declare-fun m!279969 () Bool)

(assert (=> d!63345 m!279969))

(declare-fun m!279971 () Bool)

(assert (=> d!63345 m!279971))

(declare-fun m!279973 () Bool)

(assert (=> b!263581 m!279973))

(assert (=> b!263202 d!63345))

(declare-fun d!63347 () Bool)

(declare-fun res!128723 () Bool)

(declare-fun e!170791 () Bool)

(assert (=> d!63347 (=> res!128723 e!170791)))

(assert (=> d!63347 (= res!128723 (= (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63347 (= (arrayContainsKey!0 (_keys!7034 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!170791)))

(declare-fun b!263582 () Bool)

(declare-fun e!170792 () Bool)

(assert (=> b!263582 (= e!170791 e!170792)))

(declare-fun res!128724 () Bool)

(assert (=> b!263582 (=> (not res!128724) (not e!170792))))

(assert (=> b!263582 (= res!128724 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun b!263583 () Bool)

(assert (=> b!263583 (= e!170792 (arrayContainsKey!0 (_keys!7034 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63347 (not res!128723)) b!263582))

(assert (= (and b!263582 res!128724) b!263583))

(declare-fun m!279975 () Bool)

(assert (=> d!63347 m!279975))

(declare-fun m!279977 () Bool)

(assert (=> b!263583 m!279977))

(assert (=> b!263114 d!63347))

(declare-fun d!63349 () Bool)

(declare-fun e!170793 () Bool)

(assert (=> d!63349 e!170793))

(declare-fun res!128725 () Bool)

(assert (=> d!63349 (=> res!128725 e!170793)))

(declare-fun lt!133484 () Bool)

(assert (=> d!63349 (= res!128725 (not lt!133484))))

(declare-fun lt!133486 () Bool)

(assert (=> d!63349 (= lt!133484 lt!133486)))

(declare-fun lt!133485 () Unit!8164)

(declare-fun e!170794 () Unit!8164)

(assert (=> d!63349 (= lt!133485 e!170794)))

(declare-fun c!44984 () Bool)

(assert (=> d!63349 (= c!44984 lt!133486)))

(assert (=> d!63349 (= lt!133486 (containsKey!312 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63349 (= (contains!1885 lt!133244 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133484)))

(declare-fun b!263584 () Bool)

(declare-fun lt!133483 () Unit!8164)

(assert (=> b!263584 (= e!170794 lt!133483)))

(assert (=> b!263584 (= lt!133483 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263584 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263585 () Bool)

(declare-fun Unit!8187 () Unit!8164)

(assert (=> b!263585 (= e!170794 Unit!8187)))

(declare-fun b!263586 () Bool)

(assert (=> b!263586 (= e!170793 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63349 c!44984) b!263584))

(assert (= (and d!63349 (not c!44984)) b!263585))

(assert (= (and d!63349 (not res!128725)) b!263586))

(declare-fun m!279979 () Bool)

(assert (=> d!63349 m!279979))

(declare-fun m!279981 () Bool)

(assert (=> b!263584 m!279981))

(declare-fun m!279983 () Bool)

(assert (=> b!263584 m!279983))

(assert (=> b!263584 m!279983))

(declare-fun m!279985 () Bool)

(assert (=> b!263584 m!279985))

(assert (=> b!263586 m!279983))

(assert (=> b!263586 m!279983))

(assert (=> b!263586 m!279985))

(assert (=> bm!25164 d!63349))

(declare-fun b!263587 () Bool)

(declare-fun e!170798 () Bool)

(declare-fun call!25213 () Bool)

(assert (=> b!263587 (= e!170798 call!25213)))

(declare-fun b!263588 () Bool)

(declare-fun e!170795 () Bool)

(assert (=> b!263588 (= e!170795 (contains!1889 (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761) (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263589 () Bool)

(declare-fun e!170797 () Bool)

(assert (=> b!263589 (= e!170797 e!170798)))

(declare-fun c!44985 () Bool)

(assert (=> b!263589 (= c!44985 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263590 () Bool)

(assert (=> b!263590 (= e!170798 call!25213)))

(declare-fun bm!25210 () Bool)

(assert (=> bm!25210 (= call!25213 (arrayNoDuplicates!0 lt!133005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44985 (Cons!3760 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761))))))

(declare-fun b!263591 () Bool)

(declare-fun e!170796 () Bool)

(assert (=> b!263591 (= e!170796 e!170797)))

(declare-fun res!128726 () Bool)

(assert (=> b!263591 (=> (not res!128726) (not e!170797))))

(assert (=> b!263591 (= res!128726 (not e!170795))))

(declare-fun res!128728 () Bool)

(assert (=> b!263591 (=> (not res!128728) (not e!170795))))

(assert (=> b!263591 (= res!128728 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63351 () Bool)

(declare-fun res!128727 () Bool)

(assert (=> d!63351 (=> res!128727 e!170796)))

(assert (=> d!63351 (= res!128727 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(assert (=> d!63351 (= (arrayNoDuplicates!0 lt!133005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) e!170796)))

(assert (= (and d!63351 (not res!128727)) b!263591))

(assert (= (and b!263591 res!128728) b!263588))

(assert (= (and b!263591 res!128726) b!263589))

(assert (= (and b!263589 c!44985) b!263590))

(assert (= (and b!263589 (not c!44985)) b!263587))

(assert (= (or b!263590 b!263587) bm!25210))

(assert (=> b!263588 m!279845))

(assert (=> b!263588 m!279845))

(declare-fun m!279987 () Bool)

(assert (=> b!263588 m!279987))

(assert (=> b!263589 m!279845))

(assert (=> b!263589 m!279845))

(assert (=> b!263589 m!279847))

(assert (=> bm!25210 m!279845))

(declare-fun m!279989 () Bool)

(assert (=> bm!25210 m!279989))

(assert (=> b!263591 m!279845))

(assert (=> b!263591 m!279845))

(assert (=> b!263591 m!279847))

(assert (=> bm!25169 d!63351))

(assert (=> d!63161 d!63173))

(declare-fun b!263592 () Bool)

(declare-fun e!170802 () Bool)

(declare-fun call!25214 () Bool)

(assert (=> b!263592 (= e!170802 call!25214)))

(declare-fun b!263593 () Bool)

(declare-fun e!170799 () Bool)

(assert (=> b!263593 (= e!170799 (contains!1889 Nil!3761 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun b!263594 () Bool)

(declare-fun e!170801 () Bool)

(assert (=> b!263594 (= e!170801 e!170802)))

(declare-fun c!44986 () Bool)

(assert (=> b!263594 (= c!44986 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun b!263595 () Bool)

(assert (=> b!263595 (= e!170802 call!25214)))

(declare-fun bm!25211 () Bool)

(assert (=> bm!25211 (= call!25214 (arrayNoDuplicates!0 (_keys!7034 lt!133011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44986 (Cons!3760 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) Nil!3761) Nil!3761)))))

(declare-fun b!263596 () Bool)

(declare-fun e!170800 () Bool)

(assert (=> b!263596 (= e!170800 e!170801)))

(declare-fun res!128729 () Bool)

(assert (=> b!263596 (=> (not res!128729) (not e!170801))))

(assert (=> b!263596 (= res!128729 (not e!170799))))

(declare-fun res!128731 () Bool)

(assert (=> b!263596 (=> (not res!128731) (not e!170799))))

(assert (=> b!263596 (= res!128731 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun d!63353 () Bool)

(declare-fun res!128730 () Bool)

(assert (=> d!63353 (=> res!128730 e!170800)))

(assert (=> d!63353 (= res!128730 (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(assert (=> d!63353 (= (arrayNoDuplicates!0 (_keys!7034 lt!133011) #b00000000000000000000000000000000 Nil!3761) e!170800)))

(assert (= (and d!63353 (not res!128730)) b!263596))

(assert (= (and b!263596 res!128731) b!263593))

(assert (= (and b!263596 res!128729) b!263594))

(assert (= (and b!263594 c!44986) b!263595))

(assert (= (and b!263594 (not c!44986)) b!263592))

(assert (= (or b!263595 b!263592) bm!25211))

(assert (=> b!263593 m!279599))

(assert (=> b!263593 m!279599))

(declare-fun m!279991 () Bool)

(assert (=> b!263593 m!279991))

(assert (=> b!263594 m!279599))

(assert (=> b!263594 m!279599))

(assert (=> b!263594 m!279601))

(assert (=> bm!25211 m!279599))

(declare-fun m!279993 () Bool)

(assert (=> bm!25211 m!279993))

(assert (=> b!263596 m!279599))

(assert (=> b!263596 m!279599))

(assert (=> b!263596 m!279601))

(assert (=> b!263253 d!63353))

(declare-fun d!63355 () Bool)

(declare-fun e!170803 () Bool)

(assert (=> d!63355 e!170803))

(declare-fun res!128732 () Bool)

(assert (=> d!63355 (=> res!128732 e!170803)))

(declare-fun lt!133488 () Bool)

(assert (=> d!63355 (= res!128732 (not lt!133488))))

(declare-fun lt!133490 () Bool)

(assert (=> d!63355 (= lt!133488 lt!133490)))

(declare-fun lt!133489 () Unit!8164)

(declare-fun e!170804 () Unit!8164)

(assert (=> d!63355 (= lt!133489 e!170804)))

(declare-fun c!44987 () Bool)

(assert (=> d!63355 (= c!44987 lt!133490)))

(assert (=> d!63355 (= lt!133490 (containsKey!312 (toList!1916 lt!133265) (_1!2454 lt!133017)))))

(assert (=> d!63355 (= (contains!1885 lt!133265 (_1!2454 lt!133017)) lt!133488)))

(declare-fun b!263597 () Bool)

(declare-fun lt!133487 () Unit!8164)

(assert (=> b!263597 (= e!170804 lt!133487)))

(assert (=> b!263597 (= lt!133487 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133265) (_1!2454 lt!133017)))))

(assert (=> b!263597 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133265) (_1!2454 lt!133017)))))

(declare-fun b!263598 () Bool)

(declare-fun Unit!8188 () Unit!8164)

(assert (=> b!263598 (= e!170804 Unit!8188)))

(declare-fun b!263599 () Bool)

(assert (=> b!263599 (= e!170803 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133265) (_1!2454 lt!133017))))))

(assert (= (and d!63355 c!44987) b!263597))

(assert (= (and d!63355 (not c!44987)) b!263598))

(assert (= (and d!63355 (not res!128732)) b!263599))

(declare-fun m!279995 () Bool)

(assert (=> d!63355 m!279995))

(declare-fun m!279997 () Bool)

(assert (=> b!263597 m!279997))

(assert (=> b!263597 m!279455))

(assert (=> b!263597 m!279455))

(declare-fun m!279999 () Bool)

(assert (=> b!263597 m!279999))

(assert (=> b!263599 m!279455))

(assert (=> b!263599 m!279455))

(assert (=> b!263599 m!279999))

(assert (=> d!63179 d!63355))

(declare-fun b!263603 () Bool)

(declare-fun e!170806 () Option!327)

(assert (=> b!263603 (= e!170806 None!325)))

(declare-fun b!263601 () Bool)

(declare-fun e!170805 () Option!327)

(assert (=> b!263601 (= e!170805 e!170806)))

(declare-fun c!44989 () Bool)

(assert (=> b!263601 (= c!44989 (and ((_ is Cons!3759) lt!133266) (not (= (_1!2454 (h!4425 lt!133266)) (_1!2454 lt!133017)))))))

(declare-fun b!263602 () Bool)

(assert (=> b!263602 (= e!170806 (getValueByKey!321 (t!8832 lt!133266) (_1!2454 lt!133017)))))

(declare-fun d!63357 () Bool)

(declare-fun c!44988 () Bool)

(assert (=> d!63357 (= c!44988 (and ((_ is Cons!3759) lt!133266) (= (_1!2454 (h!4425 lt!133266)) (_1!2454 lt!133017))))))

(assert (=> d!63357 (= (getValueByKey!321 lt!133266 (_1!2454 lt!133017)) e!170805)))

(declare-fun b!263600 () Bool)

(assert (=> b!263600 (= e!170805 (Some!326 (_2!2454 (h!4425 lt!133266))))))

(assert (= (and d!63357 c!44988) b!263600))

(assert (= (and d!63357 (not c!44988)) b!263601))

(assert (= (and b!263601 c!44989) b!263602))

(assert (= (and b!263601 (not c!44989)) b!263603))

(declare-fun m!280001 () Bool)

(assert (=> b!263602 m!280001))

(assert (=> d!63179 d!63357))

(declare-fun d!63359 () Bool)

(assert (=> d!63359 (= (getValueByKey!321 lt!133266 (_1!2454 lt!133017)) (Some!326 (_2!2454 lt!133017)))))

(declare-fun lt!133491 () Unit!8164)

(assert (=> d!63359 (= lt!133491 (choose!1302 lt!133266 (_1!2454 lt!133017) (_2!2454 lt!133017)))))

(declare-fun e!170807 () Bool)

(assert (=> d!63359 e!170807))

(declare-fun res!128733 () Bool)

(assert (=> d!63359 (=> (not res!128733) (not e!170807))))

(assert (=> d!63359 (= res!128733 (isStrictlySorted!364 lt!133266))))

(assert (=> d!63359 (= (lemmaContainsTupThenGetReturnValue!177 lt!133266 (_1!2454 lt!133017) (_2!2454 lt!133017)) lt!133491)))

(declare-fun b!263604 () Bool)

(declare-fun res!128734 () Bool)

(assert (=> b!263604 (=> (not res!128734) (not e!170807))))

(assert (=> b!263604 (= res!128734 (containsKey!312 lt!133266 (_1!2454 lt!133017)))))

(declare-fun b!263605 () Bool)

(assert (=> b!263605 (= e!170807 (contains!1888 lt!133266 (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(assert (= (and d!63359 res!128733) b!263604))

(assert (= (and b!263604 res!128734) b!263605))

(assert (=> d!63359 m!279449))

(declare-fun m!280003 () Bool)

(assert (=> d!63359 m!280003))

(declare-fun m!280005 () Bool)

(assert (=> d!63359 m!280005))

(declare-fun m!280007 () Bool)

(assert (=> b!263604 m!280007))

(declare-fun m!280009 () Bool)

(assert (=> b!263605 m!280009))

(assert (=> d!63179 d!63359))

(declare-fun b!263606 () Bool)

(declare-fun e!170810 () List!3763)

(declare-fun call!25217 () List!3763)

(assert (=> b!263606 (= e!170810 call!25217)))

(declare-fun b!263607 () Bool)

(declare-fun e!170812 () List!3763)

(declare-fun call!25215 () List!3763)

(assert (=> b!263607 (= e!170812 call!25215)))

(declare-fun b!263608 () Bool)

(assert (=> b!263608 (= e!170810 call!25217)))

(declare-fun call!25216 () List!3763)

(declare-fun bm!25212 () Bool)

(declare-fun e!170808 () List!3763)

(declare-fun c!44991 () Bool)

(assert (=> bm!25212 (= call!25216 ($colon$colon!107 e!170808 (ite c!44991 (h!4425 (toList!1916 lt!133013)) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017)))))))

(declare-fun c!44993 () Bool)

(assert (=> bm!25212 (= c!44993 c!44991)))

(declare-fun c!44990 () Bool)

(declare-fun b!263609 () Bool)

(declare-fun c!44992 () Bool)

(assert (=> b!263609 (= e!170808 (ite c!44992 (t!8832 (toList!1916 lt!133013)) (ite c!44990 (Cons!3759 (h!4425 (toList!1916 lt!133013)) (t!8832 (toList!1916 lt!133013))) Nil!3760)))))

(declare-fun b!263610 () Bool)

(assert (=> b!263610 (= e!170808 (insertStrictlySorted!180 (t!8832 (toList!1916 lt!133013)) (_1!2454 lt!133017) (_2!2454 lt!133017)))))

(declare-fun bm!25213 () Bool)

(assert (=> bm!25213 (= call!25217 call!25215)))

(declare-fun d!63361 () Bool)

(declare-fun e!170811 () Bool)

(assert (=> d!63361 e!170811))

(declare-fun res!128735 () Bool)

(assert (=> d!63361 (=> (not res!128735) (not e!170811))))

(declare-fun lt!133492 () List!3763)

(assert (=> d!63361 (= res!128735 (isStrictlySorted!364 lt!133492))))

(declare-fun e!170809 () List!3763)

(assert (=> d!63361 (= lt!133492 e!170809)))

(assert (=> d!63361 (= c!44991 (and ((_ is Cons!3759) (toList!1916 lt!133013)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133013))) (_1!2454 lt!133017))))))

(assert (=> d!63361 (isStrictlySorted!364 (toList!1916 lt!133013))))

(assert (=> d!63361 (= (insertStrictlySorted!180 (toList!1916 lt!133013) (_1!2454 lt!133017) (_2!2454 lt!133017)) lt!133492)))

(declare-fun b!263611 () Bool)

(assert (=> b!263611 (= e!170809 call!25216)))

(declare-fun bm!25214 () Bool)

(assert (=> bm!25214 (= call!25215 call!25216)))

(declare-fun b!263612 () Bool)

(assert (=> b!263612 (= e!170809 e!170812)))

(assert (=> b!263612 (= c!44992 (and ((_ is Cons!3759) (toList!1916 lt!133013)) (= (_1!2454 (h!4425 (toList!1916 lt!133013))) (_1!2454 lt!133017))))))

(declare-fun b!263613 () Bool)

(assert (=> b!263613 (= e!170811 (contains!1888 lt!133492 (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun b!263614 () Bool)

(assert (=> b!263614 (= c!44990 (and ((_ is Cons!3759) (toList!1916 lt!133013)) (bvsgt (_1!2454 (h!4425 (toList!1916 lt!133013))) (_1!2454 lt!133017))))))

(assert (=> b!263614 (= e!170812 e!170810)))

(declare-fun b!263615 () Bool)

(declare-fun res!128736 () Bool)

(assert (=> b!263615 (=> (not res!128736) (not e!170811))))

(assert (=> b!263615 (= res!128736 (containsKey!312 lt!133492 (_1!2454 lt!133017)))))

(assert (= (and d!63361 c!44991) b!263611))

(assert (= (and d!63361 (not c!44991)) b!263612))

(assert (= (and b!263612 c!44992) b!263607))

(assert (= (and b!263612 (not c!44992)) b!263614))

(assert (= (and b!263614 c!44990) b!263606))

(assert (= (and b!263614 (not c!44990)) b!263608))

(assert (= (or b!263606 b!263608) bm!25213))

(assert (= (or b!263607 bm!25213) bm!25214))

(assert (= (or b!263611 bm!25214) bm!25212))

(assert (= (and bm!25212 c!44993) b!263610))

(assert (= (and bm!25212 (not c!44993)) b!263609))

(assert (= (and d!63361 res!128735) b!263615))

(assert (= (and b!263615 res!128736) b!263613))

(declare-fun m!280011 () Bool)

(assert (=> b!263615 m!280011))

(declare-fun m!280013 () Bool)

(assert (=> b!263613 m!280013))

(declare-fun m!280015 () Bool)

(assert (=> b!263610 m!280015))

(declare-fun m!280017 () Bool)

(assert (=> bm!25212 m!280017))

(declare-fun m!280019 () Bool)

(assert (=> d!63361 m!280019))

(assert (=> d!63361 m!279937))

(assert (=> d!63179 d!63361))

(declare-fun d!63363 () Bool)

(declare-fun e!170813 () Bool)

(assert (=> d!63363 e!170813))

(declare-fun res!128737 () Bool)

(assert (=> d!63363 (=> res!128737 e!170813)))

(declare-fun lt!133494 () Bool)

(assert (=> d!63363 (= res!128737 (not lt!133494))))

(declare-fun lt!133496 () Bool)

(assert (=> d!63363 (= lt!133494 lt!133496)))

(declare-fun lt!133495 () Unit!8164)

(declare-fun e!170814 () Unit!8164)

(assert (=> d!63363 (= lt!133495 e!170814)))

(declare-fun c!44994 () Bool)

(assert (=> d!63363 (= c!44994 lt!133496)))

(assert (=> d!63363 (= lt!133496 (containsKey!312 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63363 (= (contains!1885 lt!133244 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133494)))

(declare-fun b!263616 () Bool)

(declare-fun lt!133493 () Unit!8164)

(assert (=> b!263616 (= e!170814 lt!133493)))

(assert (=> b!263616 (= lt!133493 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263616 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263617 () Bool)

(declare-fun Unit!8189 () Unit!8164)

(assert (=> b!263617 (= e!170814 Unit!8189)))

(declare-fun b!263618 () Bool)

(assert (=> b!263618 (= e!170813 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63363 c!44994) b!263616))

(assert (= (and d!63363 (not c!44994)) b!263617))

(assert (= (and d!63363 (not res!128737)) b!263618))

(declare-fun m!280021 () Bool)

(assert (=> d!63363 m!280021))

(declare-fun m!280023 () Bool)

(assert (=> b!263616 m!280023))

(assert (=> b!263616 m!279831))

(assert (=> b!263616 m!279831))

(declare-fun m!280025 () Bool)

(assert (=> b!263616 m!280025))

(assert (=> b!263618 m!279831))

(assert (=> b!263618 m!279831))

(assert (=> b!263618 m!280025))

(assert (=> bm!25165 d!63363))

(assert (=> d!63209 d!63165))

(declare-fun d!63365 () Bool)

(declare-fun e!170817 () Bool)

(assert (=> d!63365 e!170817))

(declare-fun res!128743 () Bool)

(assert (=> d!63365 (=> (not res!128743) (not e!170817))))

(declare-fun lt!133499 () SeekEntryResult!1164)

(assert (=> d!63365 (= res!128743 ((_ is Found!1164) lt!133499))))

(assert (=> d!63365 (= lt!133499 (seekEntryOrOpen!0 key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(assert (=> d!63365 true))

(declare-fun _$33!186 () Unit!8164)

(assert (=> d!63365 (= (choose!1299 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)) _$33!186)))

(declare-fun b!263623 () Bool)

(declare-fun res!128742 () Bool)

(assert (=> b!263623 (=> (not res!128742) (not e!170817))))

(assert (=> b!263623 (= res!128742 (inRange!0 (index!6827 lt!133499) (mask!11208 thiss!1504)))))

(declare-fun b!263624 () Bool)

(assert (=> b!263624 (= e!170817 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6827 lt!133499)) key!932))))

(assert (= (and d!63365 res!128743) b!263623))

(assert (= (and b!263623 res!128742) b!263624))

(assert (=> d!63365 m!279139))

(declare-fun m!280027 () Bool)

(assert (=> b!263623 m!280027))

(declare-fun m!280029 () Bool)

(assert (=> b!263624 m!280029))

(assert (=> d!63209 d!63365))

(assert (=> d!63209 d!63237))

(declare-fun d!63367 () Bool)

(assert (=> d!63367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504))))

(assert (=> d!63367 true))

(declare-fun _$56!45 () Unit!8164)

(assert (=> d!63367 (= (choose!102 key!932 (_keys!7034 thiss!1504) index!297 (mask!11208 thiss!1504)) _$56!45)))

(declare-fun bs!9287 () Bool)

(assert (= bs!9287 d!63367))

(assert (=> bs!9287 m!279123))

(assert (=> bs!9287 m!279503))

(assert (=> d!63195 d!63367))

(assert (=> d!63195 d!63237))

(declare-fun d!63369 () Bool)

(declare-fun e!170818 () Bool)

(assert (=> d!63369 e!170818))

(declare-fun res!128744 () Bool)

(assert (=> d!63369 (=> res!128744 e!170818)))

(declare-fun lt!133501 () Bool)

(assert (=> d!63369 (= res!128744 (not lt!133501))))

(declare-fun lt!133503 () Bool)

(assert (=> d!63369 (= lt!133501 lt!133503)))

(declare-fun lt!133502 () Unit!8164)

(declare-fun e!170819 () Unit!8164)

(assert (=> d!63369 (= lt!133502 e!170819)))

(declare-fun c!44995 () Bool)

(assert (=> d!63369 (= c!44995 lt!133503)))

(assert (=> d!63369 (= lt!133503 (containsKey!312 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (=> d!63369 (= (contains!1885 lt!133300 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) lt!133501)))

(declare-fun b!263625 () Bool)

(declare-fun lt!133500 () Unit!8164)

(assert (=> b!263625 (= e!170819 lt!133500)))

(assert (=> b!263625 (= lt!133500 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (=> b!263625 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun b!263626 () Bool)

(declare-fun Unit!8190 () Unit!8164)

(assert (=> b!263626 (= e!170819 Unit!8190)))

(declare-fun b!263627 () Bool)

(assert (=> b!263627 (= e!170818 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))))

(assert (= (and d!63369 c!44995) b!263625))

(assert (= (and d!63369 (not c!44995)) b!263626))

(assert (= (and d!63369 (not res!128744)) b!263627))

(assert (=> d!63369 m!279433))

(declare-fun m!280031 () Bool)

(assert (=> d!63369 m!280031))

(assert (=> b!263625 m!279433))

(declare-fun m!280033 () Bool)

(assert (=> b!263625 m!280033))

(assert (=> b!263625 m!279433))

(assert (=> b!263625 m!279835))

(assert (=> b!263625 m!279835))

(declare-fun m!280035 () Bool)

(assert (=> b!263625 m!280035))

(assert (=> b!263627 m!279433))

(assert (=> b!263627 m!279835))

(assert (=> b!263627 m!279835))

(assert (=> b!263627 m!280035))

(assert (=> b!263261 d!63369))

(assert (=> b!263303 d!63199))

(declare-fun d!63371 () Bool)

(assert (=> d!63371 (= (apply!262 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) lt!133260) (apply!262 lt!133257 lt!133260))))

(declare-fun lt!133504 () Unit!8164)

(assert (=> d!63371 (= lt!133504 (choose!1300 lt!133257 lt!133240 (zeroValue!4683 thiss!1504) lt!133260))))

(declare-fun e!170820 () Bool)

(assert (=> d!63371 e!170820))

(declare-fun res!128745 () Bool)

(assert (=> d!63371 (=> (not res!128745) (not e!170820))))

(assert (=> d!63371 (= res!128745 (contains!1885 lt!133257 lt!133260))))

(assert (=> d!63371 (= (addApplyDifferent!238 lt!133257 lt!133240 (zeroValue!4683 thiss!1504) lt!133260) lt!133504)))

(declare-fun b!263628 () Bool)

(assert (=> b!263628 (= e!170820 (not (= lt!133260 lt!133240)))))

(assert (= (and d!63371 res!128745) b!263628))

(assert (=> d!63371 m!279401))

(declare-fun m!280037 () Bool)

(assert (=> d!63371 m!280037))

(assert (=> d!63371 m!279425))

(declare-fun m!280039 () Bool)

(assert (=> d!63371 m!280039))

(assert (=> d!63371 m!279401))

(assert (=> d!63371 m!279403))

(assert (=> b!263165 d!63371))

(declare-fun d!63373 () Bool)

(assert (=> d!63373 (= (apply!262 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) lt!133250) (apply!262 lt!133256 lt!133250))))

(declare-fun lt!133505 () Unit!8164)

(assert (=> d!63373 (= lt!133505 (choose!1300 lt!133256 lt!133247 (minValue!4683 thiss!1504) lt!133250))))

(declare-fun e!170821 () Bool)

(assert (=> d!63373 e!170821))

(declare-fun res!128746 () Bool)

(assert (=> d!63373 (=> (not res!128746) (not e!170821))))

(assert (=> d!63373 (= res!128746 (contains!1885 lt!133256 lt!133250))))

(assert (=> d!63373 (= (addApplyDifferent!238 lt!133256 lt!133247 (minValue!4683 thiss!1504) lt!133250) lt!133505)))

(declare-fun b!263629 () Bool)

(assert (=> b!263629 (= e!170821 (not (= lt!133250 lt!133247)))))

(assert (= (and d!63373 res!128746) b!263629))

(assert (=> d!63373 m!279411))

(declare-fun m!280041 () Bool)

(assert (=> d!63373 m!280041))

(assert (=> d!63373 m!279405))

(declare-fun m!280043 () Bool)

(assert (=> d!63373 m!280043))

(assert (=> d!63373 m!279411))

(assert (=> d!63373 m!279413))

(assert (=> b!263165 d!63373))

(declare-fun d!63375 () Bool)

(declare-fun e!170822 () Bool)

(assert (=> d!63375 e!170822))

(declare-fun res!128747 () Bool)

(assert (=> d!63375 (=> (not res!128747) (not e!170822))))

(declare-fun lt!133507 () ListLongMap!3801)

(assert (=> d!63375 (= res!128747 (contains!1885 lt!133507 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133508 () List!3763)

(assert (=> d!63375 (= lt!133507 (ListLongMap!3802 lt!133508))))

(declare-fun lt!133509 () Unit!8164)

(declare-fun lt!133506 () Unit!8164)

(assert (=> d!63375 (= lt!133509 lt!133506)))

(assert (=> d!63375 (= (getValueByKey!321 lt!133508 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63375 (= lt!133506 (lemmaContainsTupThenGetReturnValue!177 lt!133508 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63375 (= lt!133508 (insertStrictlySorted!180 (toList!1916 lt!133257) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63375 (= (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) lt!133507)))

(declare-fun b!263630 () Bool)

(declare-fun res!128748 () Bool)

(assert (=> b!263630 (=> (not res!128748) (not e!170822))))

(assert (=> b!263630 (= res!128748 (= (getValueByKey!321 (toList!1916 lt!133507) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263631 () Bool)

(assert (=> b!263631 (= e!170822 (contains!1888 (toList!1916 lt!133507) (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63375 res!128747) b!263630))

(assert (= (and b!263630 res!128748) b!263631))

(declare-fun m!280045 () Bool)

(assert (=> d!63375 m!280045))

(declare-fun m!280047 () Bool)

(assert (=> d!63375 m!280047))

(declare-fun m!280049 () Bool)

(assert (=> d!63375 m!280049))

(declare-fun m!280051 () Bool)

(assert (=> d!63375 m!280051))

(declare-fun m!280053 () Bool)

(assert (=> b!263630 m!280053))

(declare-fun m!280055 () Bool)

(assert (=> b!263631 m!280055))

(assert (=> b!263165 d!63375))

(declare-fun d!63377 () Bool)

(declare-fun e!170823 () Bool)

(assert (=> d!63377 e!170823))

(declare-fun res!128749 () Bool)

(assert (=> d!63377 (=> (not res!128749) (not e!170823))))

(declare-fun lt!133511 () ListLongMap!3801)

(assert (=> d!63377 (= res!128749 (contains!1885 lt!133511 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133512 () List!3763)

(assert (=> d!63377 (= lt!133511 (ListLongMap!3802 lt!133512))))

(declare-fun lt!133513 () Unit!8164)

(declare-fun lt!133510 () Unit!8164)

(assert (=> d!63377 (= lt!133513 lt!133510)))

(assert (=> d!63377 (= (getValueByKey!321 lt!133512 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63377 (= lt!133510 (lemmaContainsTupThenGetReturnValue!177 lt!133512 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63377 (= lt!133512 (insertStrictlySorted!180 (toList!1916 lt!133253) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63377 (= (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) lt!133511)))

(declare-fun b!263632 () Bool)

(declare-fun res!128750 () Bool)

(assert (=> b!263632 (=> (not res!128750) (not e!170823))))

(assert (=> b!263632 (= res!128750 (= (getValueByKey!321 (toList!1916 lt!133511) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263633 () Bool)

(assert (=> b!263633 (= e!170823 (contains!1888 (toList!1916 lt!133511) (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63377 res!128749) b!263632))

(assert (= (and b!263632 res!128750) b!263633))

(declare-fun m!280057 () Bool)

(assert (=> d!63377 m!280057))

(declare-fun m!280059 () Bool)

(assert (=> d!63377 m!280059))

(declare-fun m!280061 () Bool)

(assert (=> d!63377 m!280061))

(declare-fun m!280063 () Bool)

(assert (=> d!63377 m!280063))

(declare-fun m!280065 () Bool)

(assert (=> b!263632 m!280065))

(declare-fun m!280067 () Bool)

(assert (=> b!263633 m!280067))

(assert (=> b!263165 d!63377))

(declare-fun d!63379 () Bool)

(assert (=> d!63379 (= (apply!262 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) lt!133258) (apply!262 lt!133249 lt!133258))))

(declare-fun lt!133514 () Unit!8164)

(assert (=> d!63379 (= lt!133514 (choose!1300 lt!133249 lt!133243 (minValue!4683 thiss!1504) lt!133258))))

(declare-fun e!170824 () Bool)

(assert (=> d!63379 e!170824))

(declare-fun res!128751 () Bool)

(assert (=> d!63379 (=> (not res!128751) (not e!170824))))

(assert (=> d!63379 (= res!128751 (contains!1885 lt!133249 lt!133258))))

(assert (=> d!63379 (= (addApplyDifferent!238 lt!133249 lt!133243 (minValue!4683 thiss!1504) lt!133258) lt!133514)))

(declare-fun b!263634 () Bool)

(assert (=> b!263634 (= e!170824 (not (= lt!133258 lt!133243)))))

(assert (= (and d!63379 res!128751) b!263634))

(assert (=> d!63379 m!279407))

(declare-fun m!280069 () Bool)

(assert (=> d!63379 m!280069))

(assert (=> d!63379 m!279415))

(declare-fun m!280071 () Bool)

(assert (=> d!63379 m!280071))

(assert (=> d!63379 m!279407))

(assert (=> d!63379 m!279419))

(assert (=> b!263165 d!63379))

(declare-fun b!263635 () Bool)

(declare-fun res!128752 () Bool)

(declare-fun e!170827 () Bool)

(assert (=> b!263635 (=> (not res!128752) (not e!170827))))

(declare-fun lt!133517 () ListLongMap!3801)

(assert (=> b!263635 (= res!128752 (not (contains!1885 lt!133517 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263636 () Bool)

(declare-fun e!170828 () Bool)

(assert (=> b!263636 (= e!170827 e!170828)))

(declare-fun c!44998 () Bool)

(declare-fun e!170831 () Bool)

(assert (=> b!263636 (= c!44998 e!170831)))

(declare-fun res!128755 () Bool)

(assert (=> b!263636 (=> (not res!128755) (not e!170831))))

(assert (=> b!263636 (= res!128755 (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun b!263637 () Bool)

(declare-fun e!170825 () ListLongMap!3801)

(declare-fun e!170829 () ListLongMap!3801)

(assert (=> b!263637 (= e!170825 e!170829)))

(declare-fun c!44999 () Bool)

(assert (=> b!263637 (= c!44999 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263638 () Bool)

(declare-fun call!25218 () ListLongMap!3801)

(assert (=> b!263638 (= e!170829 call!25218)))

(declare-fun b!263639 () Bool)

(declare-fun e!170826 () Bool)

(assert (=> b!263639 (= e!170826 (isEmpty!546 lt!133517))))

(declare-fun d!63381 () Bool)

(assert (=> d!63381 e!170827))

(declare-fun res!128753 () Bool)

(assert (=> d!63381 (=> (not res!128753) (not e!170827))))

(assert (=> d!63381 (= res!128753 (not (contains!1885 lt!133517 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63381 (= lt!133517 e!170825)))

(declare-fun c!44997 () Bool)

(assert (=> d!63381 (= c!44997 (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63381 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63381 (= (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133517)))

(declare-fun b!263640 () Bool)

(assert (=> b!263640 (= e!170831 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263640 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263641 () Bool)

(assert (=> b!263641 (= e!170825 (ListLongMap!3802 Nil!3760))))

(declare-fun bm!25215 () Bool)

(assert (=> bm!25215 (= call!25218 (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263642 () Bool)

(assert (=> b!263642 (= e!170828 e!170826)))

(declare-fun c!44996 () Bool)

(assert (=> b!263642 (= c!44996 (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun b!263643 () Bool)

(assert (=> b!263643 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> b!263643 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6346 (_values!4825 thiss!1504))))))

(declare-fun e!170830 () Bool)

(assert (=> b!263643 (= e!170830 (= (apply!262 lt!133517 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263644 () Bool)

(declare-fun lt!133516 () Unit!8164)

(declare-fun lt!133515 () Unit!8164)

(assert (=> b!263644 (= lt!133516 lt!133515)))

(declare-fun lt!133519 () ListLongMap!3801)

(declare-fun lt!133521 () (_ BitVec 64))

(declare-fun lt!133518 () (_ BitVec 64))

(declare-fun lt!133520 () V!8521)

(assert (=> b!263644 (not (contains!1885 (+!712 lt!133519 (tuple2!4887 lt!133518 lt!133520)) lt!133521))))

(assert (=> b!263644 (= lt!133515 (addStillNotContains!131 lt!133519 lt!133518 lt!133520 lt!133521))))

(assert (=> b!263644 (= lt!133521 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263644 (= lt!133520 (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263644 (= lt!133518 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!263644 (= lt!133519 call!25218)))

(assert (=> b!263644 (= e!170829 (+!712 call!25218 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!263645 () Bool)

(assert (=> b!263645 (= e!170826 (= lt!133517 (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504))))))

(declare-fun b!263646 () Bool)

(assert (=> b!263646 (= e!170828 e!170830)))

(assert (=> b!263646 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun res!128754 () Bool)

(assert (=> b!263646 (= res!128754 (contains!1885 lt!133517 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263646 (=> (not res!128754) (not e!170830))))

(assert (= (and d!63381 c!44997) b!263641))

(assert (= (and d!63381 (not c!44997)) b!263637))

(assert (= (and b!263637 c!44999) b!263644))

(assert (= (and b!263637 (not c!44999)) b!263638))

(assert (= (or b!263644 b!263638) bm!25215))

(assert (= (and d!63381 res!128753) b!263635))

(assert (= (and b!263635 res!128752) b!263636))

(assert (= (and b!263636 res!128755) b!263640))

(assert (= (and b!263636 c!44998) b!263646))

(assert (= (and b!263636 (not c!44998)) b!263642))

(assert (= (and b!263646 res!128754) b!263643))

(assert (= (and b!263642 c!44996) b!263645))

(assert (= (and b!263642 (not c!44996)) b!263639))

(declare-fun b_lambda!8367 () Bool)

(assert (=> (not b_lambda!8367) (not b!263643)))

(assert (=> b!263643 t!8837))

(declare-fun b_and!13965 () Bool)

(assert (= b_and!13963 (and (=> t!8837 result!5425) b_and!13965)))

(declare-fun b_lambda!8369 () Bool)

(assert (=> (not b_lambda!8369) (not b!263644)))

(assert (=> b!263644 t!8837))

(declare-fun b_and!13967 () Bool)

(assert (= b_and!13965 (and (=> t!8837 result!5425) b_and!13967)))

(declare-fun m!280073 () Bool)

(assert (=> b!263639 m!280073))

(assert (=> b!263640 m!279365))

(assert (=> b!263640 m!279365))

(assert (=> b!263640 m!279393))

(declare-fun m!280075 () Bool)

(assert (=> b!263645 m!280075))

(assert (=> b!263637 m!279365))

(assert (=> b!263637 m!279365))

(assert (=> b!263637 m!279393))

(assert (=> b!263643 m!279385))

(assert (=> b!263643 m!279365))

(assert (=> b!263643 m!279365))

(declare-fun m!280077 () Bool)

(assert (=> b!263643 m!280077))

(assert (=> b!263643 m!279385))

(assert (=> b!263643 m!279383))

(assert (=> b!263643 m!279387))

(assert (=> b!263643 m!279383))

(declare-fun m!280079 () Bool)

(assert (=> d!63381 m!280079))

(assert (=> d!63381 m!279317))

(declare-fun m!280081 () Bool)

(assert (=> b!263635 m!280081))

(assert (=> bm!25215 m!280075))

(assert (=> b!263646 m!279365))

(assert (=> b!263646 m!279365))

(declare-fun m!280083 () Bool)

(assert (=> b!263646 m!280083))

(declare-fun m!280085 () Bool)

(assert (=> b!263644 m!280085))

(assert (=> b!263644 m!279385))

(declare-fun m!280087 () Bool)

(assert (=> b!263644 m!280087))

(assert (=> b!263644 m!279365))

(assert (=> b!263644 m!280087))

(declare-fun m!280089 () Bool)

(assert (=> b!263644 m!280089))

(declare-fun m!280091 () Bool)

(assert (=> b!263644 m!280091))

(assert (=> b!263644 m!279385))

(assert (=> b!263644 m!279383))

(assert (=> b!263644 m!279387))

(assert (=> b!263644 m!279383))

(assert (=> b!263165 d!63381))

(declare-fun d!63383 () Bool)

(assert (=> d!63383 (= (apply!262 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) lt!133258) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) lt!133258)))))

(declare-fun bs!9288 () Bool)

(assert (= bs!9288 d!63383))

(declare-fun m!280093 () Bool)

(assert (=> bs!9288 m!280093))

(assert (=> bs!9288 m!280093))

(declare-fun m!280095 () Bool)

(assert (=> bs!9288 m!280095))

(assert (=> b!263165 d!63383))

(declare-fun d!63385 () Bool)

(assert (=> d!63385 (= (apply!262 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) lt!133250) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) lt!133250)))))

(declare-fun bs!9289 () Bool)

(assert (= bs!9289 d!63385))

(declare-fun m!280097 () Bool)

(assert (=> bs!9289 m!280097))

(assert (=> bs!9289 m!280097))

(declare-fun m!280099 () Bool)

(assert (=> bs!9289 m!280099))

(assert (=> b!263165 d!63385))

(declare-fun d!63387 () Bool)

(declare-fun e!170832 () Bool)

(assert (=> d!63387 e!170832))

(declare-fun res!128756 () Bool)

(assert (=> d!63387 (=> res!128756 e!170832)))

(declare-fun lt!133523 () Bool)

(assert (=> d!63387 (= res!128756 (not lt!133523))))

(declare-fun lt!133525 () Bool)

(assert (=> d!63387 (= lt!133523 lt!133525)))

(declare-fun lt!133524 () Unit!8164)

(declare-fun e!170833 () Unit!8164)

(assert (=> d!63387 (= lt!133524 e!170833)))

(declare-fun c!45000 () Bool)

(assert (=> d!63387 (= c!45000 lt!133525)))

(assert (=> d!63387 (= lt!133525 (containsKey!312 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242))))

(assert (=> d!63387 (= (contains!1885 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) lt!133242) lt!133523)))

(declare-fun b!263647 () Bool)

(declare-fun lt!133522 () Unit!8164)

(assert (=> b!263647 (= e!170833 lt!133522)))

(assert (=> b!263647 (= lt!133522 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242))))

(assert (=> b!263647 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242))))

(declare-fun b!263648 () Bool)

(declare-fun Unit!8191 () Unit!8164)

(assert (=> b!263648 (= e!170833 Unit!8191)))

(declare-fun b!263649 () Bool)

(assert (=> b!263649 (= e!170832 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242)))))

(assert (= (and d!63387 c!45000) b!263647))

(assert (= (and d!63387 (not c!45000)) b!263648))

(assert (= (and d!63387 (not res!128756)) b!263649))

(declare-fun m!280101 () Bool)

(assert (=> d!63387 m!280101))

(declare-fun m!280103 () Bool)

(assert (=> b!263647 m!280103))

(declare-fun m!280105 () Bool)

(assert (=> b!263647 m!280105))

(assert (=> b!263647 m!280105))

(declare-fun m!280107 () Bool)

(assert (=> b!263647 m!280107))

(assert (=> b!263649 m!280105))

(assert (=> b!263649 m!280105))

(assert (=> b!263649 m!280107))

(assert (=> b!263165 d!63387))

(declare-fun d!63389 () Bool)

(assert (=> d!63389 (= (apply!262 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) lt!133260) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) lt!133260)))))

(declare-fun bs!9290 () Bool)

(assert (= bs!9290 d!63389))

(declare-fun m!280109 () Bool)

(assert (=> bs!9290 m!280109))

(assert (=> bs!9290 m!280109))

(declare-fun m!280111 () Bool)

(assert (=> bs!9290 m!280111))

(assert (=> b!263165 d!63389))

(declare-fun d!63391 () Bool)

(assert (=> d!63391 (= (apply!262 lt!133249 lt!133258) (get!3100 (getValueByKey!321 (toList!1916 lt!133249) lt!133258)))))

(declare-fun bs!9291 () Bool)

(assert (= bs!9291 d!63391))

(declare-fun m!280113 () Bool)

(assert (=> bs!9291 m!280113))

(assert (=> bs!9291 m!280113))

(declare-fun m!280115 () Bool)

(assert (=> bs!9291 m!280115))

(assert (=> b!263165 d!63391))

(declare-fun d!63393 () Bool)

(assert (=> d!63393 (contains!1885 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) lt!133242)))

(declare-fun lt!133526 () Unit!8164)

(assert (=> d!63393 (= lt!133526 (choose!1301 lt!133253 lt!133259 (zeroValue!4683 thiss!1504) lt!133242))))

(assert (=> d!63393 (contains!1885 lt!133253 lt!133242)))

(assert (=> d!63393 (= (addStillContains!238 lt!133253 lt!133259 (zeroValue!4683 thiss!1504) lt!133242) lt!133526)))

(declare-fun bs!9292 () Bool)

(assert (= bs!9292 d!63393))

(assert (=> bs!9292 m!279421))

(assert (=> bs!9292 m!279421))

(assert (=> bs!9292 m!279423))

(declare-fun m!280117 () Bool)

(assert (=> bs!9292 m!280117))

(declare-fun m!280119 () Bool)

(assert (=> bs!9292 m!280119))

(assert (=> b!263165 d!63393))

(declare-fun d!63395 () Bool)

(assert (=> d!63395 (= (apply!262 lt!133257 lt!133260) (get!3100 (getValueByKey!321 (toList!1916 lt!133257) lt!133260)))))

(declare-fun bs!9293 () Bool)

(assert (= bs!9293 d!63395))

(declare-fun m!280121 () Bool)

(assert (=> bs!9293 m!280121))

(assert (=> bs!9293 m!280121))

(declare-fun m!280123 () Bool)

(assert (=> bs!9293 m!280123))

(assert (=> b!263165 d!63395))

(declare-fun d!63397 () Bool)

(assert (=> d!63397 (= (apply!262 lt!133256 lt!133250) (get!3100 (getValueByKey!321 (toList!1916 lt!133256) lt!133250)))))

(declare-fun bs!9294 () Bool)

(assert (= bs!9294 d!63397))

(declare-fun m!280125 () Bool)

(assert (=> bs!9294 m!280125))

(assert (=> bs!9294 m!280125))

(declare-fun m!280127 () Bool)

(assert (=> bs!9294 m!280127))

(assert (=> b!263165 d!63397))

(declare-fun d!63399 () Bool)

(declare-fun e!170834 () Bool)

(assert (=> d!63399 e!170834))

(declare-fun res!128757 () Bool)

(assert (=> d!63399 (=> (not res!128757) (not e!170834))))

(declare-fun lt!133528 () ListLongMap!3801)

(assert (=> d!63399 (= res!128757 (contains!1885 lt!133528 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133529 () List!3763)

(assert (=> d!63399 (= lt!133528 (ListLongMap!3802 lt!133529))))

(declare-fun lt!133530 () Unit!8164)

(declare-fun lt!133527 () Unit!8164)

(assert (=> d!63399 (= lt!133530 lt!133527)))

(assert (=> d!63399 (= (getValueByKey!321 lt!133529 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(assert (=> d!63399 (= lt!133527 (lemmaContainsTupThenGetReturnValue!177 lt!133529 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(assert (=> d!63399 (= lt!133529 (insertStrictlySorted!180 (toList!1916 lt!133256) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(assert (=> d!63399 (= (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) lt!133528)))

(declare-fun b!263650 () Bool)

(declare-fun res!128758 () Bool)

(assert (=> b!263650 (=> (not res!128758) (not e!170834))))

(assert (=> b!263650 (= res!128758 (= (getValueByKey!321 (toList!1916 lt!133528) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))))

(declare-fun b!263651 () Bool)

(assert (=> b!263651 (= e!170834 (contains!1888 (toList!1916 lt!133528) (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))

(assert (= (and d!63399 res!128757) b!263650))

(assert (= (and b!263650 res!128758) b!263651))

(declare-fun m!280129 () Bool)

(assert (=> d!63399 m!280129))

(declare-fun m!280131 () Bool)

(assert (=> d!63399 m!280131))

(declare-fun m!280133 () Bool)

(assert (=> d!63399 m!280133))

(declare-fun m!280135 () Bool)

(assert (=> d!63399 m!280135))

(declare-fun m!280137 () Bool)

(assert (=> b!263650 m!280137))

(declare-fun m!280139 () Bool)

(assert (=> b!263651 m!280139))

(assert (=> b!263165 d!63399))

(declare-fun d!63401 () Bool)

(declare-fun e!170835 () Bool)

(assert (=> d!63401 e!170835))

(declare-fun res!128759 () Bool)

(assert (=> d!63401 (=> (not res!128759) (not e!170835))))

(declare-fun lt!133532 () ListLongMap!3801)

(assert (=> d!63401 (= res!128759 (contains!1885 lt!133532 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133533 () List!3763)

(assert (=> d!63401 (= lt!133532 (ListLongMap!3802 lt!133533))))

(declare-fun lt!133534 () Unit!8164)

(declare-fun lt!133531 () Unit!8164)

(assert (=> d!63401 (= lt!133534 lt!133531)))

(assert (=> d!63401 (= (getValueByKey!321 lt!133533 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(assert (=> d!63401 (= lt!133531 (lemmaContainsTupThenGetReturnValue!177 lt!133533 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(assert (=> d!63401 (= lt!133533 (insertStrictlySorted!180 (toList!1916 lt!133249) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(assert (=> d!63401 (= (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) lt!133532)))

(declare-fun b!263652 () Bool)

(declare-fun res!128760 () Bool)

(assert (=> b!263652 (=> (not res!128760) (not e!170835))))

(assert (=> b!263652 (= res!128760 (= (getValueByKey!321 (toList!1916 lt!133532) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))))

(declare-fun b!263653 () Bool)

(assert (=> b!263653 (= e!170835 (contains!1888 (toList!1916 lt!133532) (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))

(assert (= (and d!63401 res!128759) b!263652))

(assert (= (and b!263652 res!128760) b!263653))

(declare-fun m!280141 () Bool)

(assert (=> d!63401 m!280141))

(declare-fun m!280143 () Bool)

(assert (=> d!63401 m!280143))

(declare-fun m!280145 () Bool)

(assert (=> d!63401 m!280145))

(declare-fun m!280147 () Bool)

(assert (=> d!63401 m!280147))

(declare-fun m!280149 () Bool)

(assert (=> b!263652 m!280149))

(declare-fun m!280151 () Bool)

(assert (=> b!263653 m!280151))

(assert (=> b!263165 d!63401))

(declare-fun b!263654 () Bool)

(declare-fun e!170836 () (_ BitVec 32))

(assert (=> b!263654 (= e!170836 #b00000000000000000000000000000000)))

(declare-fun b!263655 () Bool)

(declare-fun e!170837 () (_ BitVec 32))

(assert (=> b!263655 (= e!170836 e!170837)))

(declare-fun c!45001 () Bool)

(assert (=> b!263655 (= c!45001 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63403 () Bool)

(declare-fun lt!133535 () (_ BitVec 32))

(assert (=> d!63403 (and (bvsge lt!133535 #b00000000000000000000000000000000) (bvsle lt!133535 (bvsub (size!6347 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!63403 (= lt!133535 e!170836)))

(declare-fun c!45002 () Bool)

(assert (=> d!63403 (= c!45002 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63403 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6347 (_keys!7034 thiss!1504)) (size!6347 lt!133005)))))

(assert (=> d!63403 (= (arrayCountValidKeys!0 lt!133005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))) lt!133535)))

(declare-fun b!263656 () Bool)

(declare-fun call!25219 () (_ BitVec 32))

(assert (=> b!263656 (= e!170837 call!25219)))

(declare-fun b!263657 () Bool)

(assert (=> b!263657 (= e!170837 (bvadd #b00000000000000000000000000000001 call!25219))))

(declare-fun bm!25216 () Bool)

(assert (=> bm!25216 (= call!25219 (arrayCountValidKeys!0 lt!133005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (= (and d!63403 c!45002) b!263654))

(assert (= (and d!63403 (not c!45002)) b!263655))

(assert (= (and b!263655 c!45001) b!263657))

(assert (= (and b!263655 (not c!45001)) b!263656))

(assert (= (or b!263657 b!263656) bm!25216))

(assert (=> b!263655 m!279845))

(assert (=> b!263655 m!279845))

(assert (=> b!263655 m!279847))

(declare-fun m!280153 () Bool)

(assert (=> bm!25216 m!280153))

(assert (=> bm!25184 d!63403))

(assert (=> b!263084 d!63325))

(assert (=> b!263084 d!63327))

(declare-fun d!63405 () Bool)

(assert (=> d!63405 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133003) key!932))))

(declare-fun lt!133536 () Unit!8164)

(assert (=> d!63405 (= lt!133536 (choose!1303 (toList!1916 lt!133003) key!932))))

(declare-fun e!170838 () Bool)

(assert (=> d!63405 e!170838))

(declare-fun res!128761 () Bool)

(assert (=> d!63405 (=> (not res!128761) (not e!170838))))

(assert (=> d!63405 (= res!128761 (isStrictlySorted!364 (toList!1916 lt!133003)))))

(assert (=> d!63405 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133003) key!932) lt!133536)))

(declare-fun b!263658 () Bool)

(assert (=> b!263658 (= e!170838 (containsKey!312 (toList!1916 lt!133003) key!932))))

(assert (= (and d!63405 res!128761) b!263658))

(assert (=> d!63405 m!279565))

(assert (=> d!63405 m!279565))

(assert (=> d!63405 m!279567))

(declare-fun m!280155 () Bool)

(assert (=> d!63405 m!280155))

(declare-fun m!280157 () Bool)

(assert (=> d!63405 m!280157))

(assert (=> b!263658 m!279561))

(assert (=> b!263286 d!63405))

(declare-fun d!63407 () Bool)

(assert (=> d!63407 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133003) key!932)) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133003) key!932))))))

(declare-fun bs!9295 () Bool)

(assert (= bs!9295 d!63407))

(assert (=> bs!9295 m!279565))

(declare-fun m!280159 () Bool)

(assert (=> bs!9295 m!280159))

(assert (=> b!263286 d!63407))

(declare-fun b!263662 () Bool)

(declare-fun e!170840 () Option!327)

(assert (=> b!263662 (= e!170840 None!325)))

(declare-fun b!263660 () Bool)

(declare-fun e!170839 () Option!327)

(assert (=> b!263660 (= e!170839 e!170840)))

(declare-fun c!45004 () Bool)

(assert (=> b!263660 (= c!45004 (and ((_ is Cons!3759) (toList!1916 lt!133003)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133003))) key!932))))))

(declare-fun b!263661 () Bool)

(assert (=> b!263661 (= e!170840 (getValueByKey!321 (t!8832 (toList!1916 lt!133003)) key!932))))

(declare-fun d!63409 () Bool)

(declare-fun c!45003 () Bool)

(assert (=> d!63409 (= c!45003 (and ((_ is Cons!3759) (toList!1916 lt!133003)) (= (_1!2454 (h!4425 (toList!1916 lt!133003))) key!932)))))

(assert (=> d!63409 (= (getValueByKey!321 (toList!1916 lt!133003) key!932) e!170839)))

(declare-fun b!263659 () Bool)

(assert (=> b!263659 (= e!170839 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133003)))))))

(assert (= (and d!63409 c!45003) b!263659))

(assert (= (and d!63409 (not c!45003)) b!263660))

(assert (= (and b!263660 c!45004) b!263661))

(assert (= (and b!263660 (not c!45004)) b!263662))

(declare-fun m!280161 () Bool)

(assert (=> b!263661 m!280161))

(assert (=> b!263286 d!63409))

(declare-fun d!63411 () Bool)

(declare-fun e!170841 () Bool)

(assert (=> d!63411 e!170841))

(declare-fun res!128762 () Bool)

(assert (=> d!63411 (=> (not res!128762) (not e!170841))))

(declare-fun lt!133538 () ListLongMap!3801)

(assert (=> d!63411 (= res!128762 (contains!1885 lt!133538 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun lt!133539 () List!3763)

(assert (=> d!63411 (= lt!133538 (ListLongMap!3802 lt!133539))))

(declare-fun lt!133540 () Unit!8164)

(declare-fun lt!133537 () Unit!8164)

(assert (=> d!63411 (= lt!133540 lt!133537)))

(assert (=> d!63411 (= (getValueByKey!321 lt!133539 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!326 (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63411 (= lt!133537 (lemmaContainsTupThenGetReturnValue!177 lt!133539 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63411 (= lt!133539 (insertStrictlySorted!180 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182))) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63411 (= (+!712 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182)) (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133538)))

(declare-fun b!263663 () Bool)

(declare-fun res!128763 () Bool)

(assert (=> b!263663 (=> (not res!128763) (not e!170841))))

(assert (=> b!263663 (= res!128763 (= (getValueByKey!321 (toList!1916 lt!133538) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!326 (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263664 () Bool)

(assert (=> b!263664 (= e!170841 (contains!1888 (toList!1916 lt!133538) (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63411 res!128762) b!263663))

(assert (= (and b!263663 res!128763) b!263664))

(declare-fun m!280163 () Bool)

(assert (=> d!63411 m!280163))

(declare-fun m!280165 () Bool)

(assert (=> d!63411 m!280165))

(declare-fun m!280167 () Bool)

(assert (=> d!63411 m!280167))

(declare-fun m!280169 () Bool)

(assert (=> d!63411 m!280169))

(declare-fun m!280171 () Bool)

(assert (=> b!263663 m!280171))

(declare-fun m!280173 () Bool)

(assert (=> b!263664 m!280173))

(assert (=> bm!25179 d!63411))

(assert (=> d!63173 d!63237))

(declare-fun d!63413 () Bool)

(declare-fun res!128764 () Bool)

(declare-fun e!170842 () Bool)

(assert (=> d!63413 (=> res!128764 e!170842)))

(assert (=> d!63413 (= res!128764 (and ((_ is Cons!3759) (toList!1916 lt!133013)) (= (_1!2454 (h!4425 (toList!1916 lt!133013))) key!932)))))

(assert (=> d!63413 (= (containsKey!312 (toList!1916 lt!133013) key!932) e!170842)))

(declare-fun b!263665 () Bool)

(declare-fun e!170843 () Bool)

(assert (=> b!263665 (= e!170842 e!170843)))

(declare-fun res!128765 () Bool)

(assert (=> b!263665 (=> (not res!128765) (not e!170843))))

(assert (=> b!263665 (= res!128765 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133013))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133013))) key!932)) ((_ is Cons!3759) (toList!1916 lt!133013)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133013))) key!932)))))

(declare-fun b!263666 () Bool)

(assert (=> b!263666 (= e!170843 (containsKey!312 (t!8832 (toList!1916 lt!133013)) key!932))))

(assert (= (and d!63413 (not res!128764)) b!263665))

(assert (= (and b!263665 res!128765) b!263666))

(declare-fun m!280175 () Bool)

(assert (=> b!263666 m!280175))

(assert (=> d!63171 d!63413))

(assert (=> b!263288 d!63407))

(assert (=> b!263288 d!63409))

(assert (=> b!263272 d!63225))

(declare-fun d!63415 () Bool)

(assert (=> d!63415 (= (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) index!297)) (and (not (= (select (arr!5996 (_keys!7034 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5996 (_keys!7034 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263238 d!63415))

(declare-fun b!263667 () Bool)

(declare-fun e!170844 () (_ BitVec 32))

(assert (=> b!263667 (= e!170844 #b00000000000000000000000000000000)))

(declare-fun b!263668 () Bool)

(declare-fun e!170845 () (_ BitVec 32))

(assert (=> b!263668 (= e!170844 e!170845)))

(declare-fun c!45005 () Bool)

(assert (=> b!263668 (= c!45005 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun d!63417 () Bool)

(declare-fun lt!133541 () (_ BitVec 32))

(assert (=> d!63417 (and (bvsge lt!133541 #b00000000000000000000000000000000) (bvsle lt!133541 (bvsub (size!6347 lt!133005) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!63417 (= lt!133541 e!170844)))

(declare-fun c!45006 () Bool)

(assert (=> d!63417 (= c!45006 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63417 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6347 lt!133005)))))

(assert (=> d!63417 (= (arrayCountValidKeys!0 lt!133005 (bvadd index!297 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!133541)))

(declare-fun b!263669 () Bool)

(declare-fun call!25220 () (_ BitVec 32))

(assert (=> b!263669 (= e!170845 call!25220)))

(declare-fun b!263670 () Bool)

(assert (=> b!263670 (= e!170845 (bvadd #b00000000000000000000000000000001 call!25220))))

(declare-fun bm!25217 () Bool)

(assert (=> bm!25217 (= call!25220 (arrayCountValidKeys!0 lt!133005 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (= (and d!63417 c!45006) b!263667))

(assert (= (and d!63417 (not c!45006)) b!263668))

(assert (= (and b!263668 c!45005) b!263670))

(assert (= (and b!263668 (not c!45005)) b!263669))

(assert (= (or b!263670 b!263669) bm!25217))

(declare-fun m!280177 () Bool)

(assert (=> b!263668 m!280177))

(assert (=> b!263668 m!280177))

(declare-fun m!280179 () Bool)

(assert (=> b!263668 m!280179))

(declare-fun m!280181 () Bool)

(assert (=> bm!25217 m!280181))

(assert (=> bm!25172 d!63417))

(assert (=> b!263195 d!63225))

(declare-fun d!63419 () Bool)

(assert (=> d!63419 (= (apply!262 lt!133244 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3100 (getValueByKey!321 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9296 () Bool)

(assert (= bs!9296 d!63419))

(assert (=> bs!9296 m!279983))

(assert (=> bs!9296 m!279983))

(declare-fun m!280183 () Bool)

(assert (=> bs!9296 m!280183))

(assert (=> b!263176 d!63419))

(declare-fun d!63421 () Bool)

(declare-fun res!128766 () Bool)

(declare-fun e!170846 () Bool)

(assert (=> d!63421 (=> res!128766 e!170846)))

(assert (=> d!63421 (= res!128766 (= (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63421 (= (arrayContainsKey!0 lt!133005 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!170846)))

(declare-fun b!263671 () Bool)

(declare-fun e!170847 () Bool)

(assert (=> b!263671 (= e!170846 e!170847)))

(declare-fun res!128767 () Bool)

(assert (=> b!263671 (=> (not res!128767) (not e!170847))))

(assert (=> b!263671 (= res!128767 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(declare-fun b!263672 () Bool)

(assert (=> b!263672 (= e!170847 (arrayContainsKey!0 lt!133005 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63421 (not res!128766)) b!263671))

(assert (= (and b!263671 res!128767) b!263672))

(assert (=> d!63421 m!279845))

(declare-fun m!280185 () Bool)

(assert (=> b!263672 m!280185))

(assert (=> b!263296 d!63421))

(declare-fun d!63423 () Bool)

(assert (=> d!63423 (= (apply!262 lt!133300 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3100 (getValueByKey!321 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9297 () Bool)

(assert (= bs!9297 d!63423))

(assert (=> bs!9297 m!279625))

(assert (=> bs!9297 m!279625))

(declare-fun m!280187 () Bool)

(assert (=> bs!9297 m!280187))

(assert (=> b!263257 d!63423))

(declare-fun b!263673 () Bool)

(declare-fun e!170848 () (_ BitVec 32))

(assert (=> b!263673 (= e!170848 #b00000000000000000000000000000000)))

(declare-fun b!263674 () Bool)

(declare-fun e!170849 () (_ BitVec 32))

(assert (=> b!263674 (= e!170848 e!170849)))

(declare-fun c!45007 () Bool)

(assert (=> b!263674 (= c!45007 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun d!63425 () Bool)

(declare-fun lt!133542 () (_ BitVec 32))

(assert (=> d!63425 (and (bvsge lt!133542 #b00000000000000000000000000000000) (bvsle lt!133542 (bvsub (size!6347 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(assert (=> d!63425 (= lt!133542 e!170848)))

(declare-fun c!45008 () Bool)

(assert (=> d!63425 (= c!45008 (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(assert (=> d!63425 (and (bvsle #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6347 (_keys!7034 lt!133011)) (size!6347 (_keys!7034 lt!133011))))))

(assert (=> d!63425 (= (arrayCountValidKeys!0 (_keys!7034 lt!133011) #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))) lt!133542)))

(declare-fun b!263675 () Bool)

(declare-fun call!25221 () (_ BitVec 32))

(assert (=> b!263675 (= e!170849 call!25221)))

(declare-fun b!263676 () Bool)

(assert (=> b!263676 (= e!170849 (bvadd #b00000000000000000000000000000001 call!25221))))

(declare-fun bm!25218 () Bool)

(assert (=> bm!25218 (= call!25221 (arrayCountValidKeys!0 (_keys!7034 lt!133011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 lt!133011))))))

(assert (= (and d!63425 c!45008) b!263673))

(assert (= (and d!63425 (not c!45008)) b!263674))

(assert (= (and b!263674 c!45007) b!263676))

(assert (= (and b!263674 (not c!45007)) b!263675))

(assert (= (or b!263676 b!263675) bm!25218))

(assert (=> b!263674 m!279599))

(assert (=> b!263674 m!279599))

(assert (=> b!263674 m!279601))

(declare-fun m!280189 () Bool)

(assert (=> bm!25218 m!280189))

(assert (=> b!263251 d!63425))

(assert (=> d!63193 d!63207))

(declare-fun d!63427 () Bool)

(assert (=> d!63427 (arrayContainsKey!0 lt!133005 key!932 #b00000000000000000000000000000000)))

(assert (=> d!63427 true))

(declare-fun _$60!390 () Unit!8164)

(assert (=> d!63427 (= (choose!13 lt!133005 key!932 index!297) _$60!390)))

(declare-fun bs!9298 () Bool)

(assert (= bs!9298 d!63427))

(assert (=> bs!9298 m!279127))

(assert (=> d!63193 d!63427))

(assert (=> bm!25161 d!63381))

(declare-fun d!63429 () Bool)

(assert (=> d!63429 (arrayContainsKey!0 lt!133005 lt!133278 #b00000000000000000000000000000000)))

(declare-fun lt!133543 () Unit!8164)

(assert (=> d!63429 (= lt!133543 (choose!13 lt!133005 lt!133278 #b00000000000000000000000000000000))))

(assert (=> d!63429 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!63429 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133005 lt!133278 #b00000000000000000000000000000000) lt!133543)))

(declare-fun bs!9299 () Bool)

(assert (= bs!9299 d!63429))

(assert (=> bs!9299 m!279469))

(declare-fun m!280191 () Bool)

(assert (=> bs!9299 m!280191))

(assert (=> b!263226 d!63429))

(declare-fun d!63431 () Bool)

(declare-fun res!128768 () Bool)

(declare-fun e!170850 () Bool)

(assert (=> d!63431 (=> res!128768 e!170850)))

(assert (=> d!63431 (= res!128768 (= (select (arr!5996 lt!133005) #b00000000000000000000000000000000) lt!133278))))

(assert (=> d!63431 (= (arrayContainsKey!0 lt!133005 lt!133278 #b00000000000000000000000000000000) e!170850)))

(declare-fun b!263677 () Bool)

(declare-fun e!170851 () Bool)

(assert (=> b!263677 (= e!170850 e!170851)))

(declare-fun res!128769 () Bool)

(assert (=> b!263677 (=> (not res!128769) (not e!170851))))

(assert (=> b!263677 (= res!128769 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(declare-fun b!263678 () Bool)

(assert (=> b!263678 (= e!170851 (arrayContainsKey!0 lt!133005 lt!133278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63431 (not res!128768)) b!263677))

(assert (= (and b!263677 res!128769) b!263678))

(assert (=> d!63431 m!279433))

(declare-fun m!280193 () Bool)

(assert (=> b!263678 m!280193))

(assert (=> b!263226 d!63431))

(declare-fun e!170854 () SeekEntryResult!1164)

(declare-fun b!263679 () Bool)

(declare-fun lt!133546 () SeekEntryResult!1164)

(assert (=> b!263679 (= e!170854 (seekKeyOrZeroReturnVacant!0 (x!25206 lt!133546) (index!6828 lt!133546) (index!6828 lt!133546) (select (arr!5996 lt!133005) #b00000000000000000000000000000000) lt!133005 (mask!11208 thiss!1504)))))

(declare-fun d!63433 () Bool)

(declare-fun lt!133544 () SeekEntryResult!1164)

(assert (=> d!63433 (and (or ((_ is Undefined!1164) lt!133544) (not ((_ is Found!1164) lt!133544)) (and (bvsge (index!6827 lt!133544) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133544) (size!6347 lt!133005)))) (or ((_ is Undefined!1164) lt!133544) ((_ is Found!1164) lt!133544) (not ((_ is MissingZero!1164) lt!133544)) (and (bvsge (index!6826 lt!133544) #b00000000000000000000000000000000) (bvslt (index!6826 lt!133544) (size!6347 lt!133005)))) (or ((_ is Undefined!1164) lt!133544) ((_ is Found!1164) lt!133544) ((_ is MissingZero!1164) lt!133544) (not ((_ is MissingVacant!1164) lt!133544)) (and (bvsge (index!6829 lt!133544) #b00000000000000000000000000000000) (bvslt (index!6829 lt!133544) (size!6347 lt!133005)))) (or ((_ is Undefined!1164) lt!133544) (ite ((_ is Found!1164) lt!133544) (= (select (arr!5996 lt!133005) (index!6827 lt!133544)) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1164) lt!133544) (= (select (arr!5996 lt!133005) (index!6826 lt!133544)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1164) lt!133544) (= (select (arr!5996 lt!133005) (index!6829 lt!133544)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!170852 () SeekEntryResult!1164)

(assert (=> d!63433 (= lt!133544 e!170852)))

(declare-fun c!45009 () Bool)

(assert (=> d!63433 (= c!45009 (and ((_ is Intermediate!1164) lt!133546) (undefined!1976 lt!133546)))))

(assert (=> d!63433 (= lt!133546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (mask!11208 thiss!1504)) (select (arr!5996 lt!133005) #b00000000000000000000000000000000) lt!133005 (mask!11208 thiss!1504)))))

(assert (=> d!63433 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63433 (= (seekEntryOrOpen!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) lt!133005 (mask!11208 thiss!1504)) lt!133544)))

(declare-fun b!263680 () Bool)

(declare-fun c!45011 () Bool)

(declare-fun lt!133545 () (_ BitVec 64))

(assert (=> b!263680 (= c!45011 (= lt!133545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170853 () SeekEntryResult!1164)

(assert (=> b!263680 (= e!170853 e!170854)))

(declare-fun b!263681 () Bool)

(assert (=> b!263681 (= e!170852 Undefined!1164)))

(declare-fun b!263682 () Bool)

(assert (=> b!263682 (= e!170854 (MissingZero!1164 (index!6828 lt!133546)))))

(declare-fun b!263683 () Bool)

(assert (=> b!263683 (= e!170852 e!170853)))

(assert (=> b!263683 (= lt!133545 (select (arr!5996 lt!133005) (index!6828 lt!133546)))))

(declare-fun c!45010 () Bool)

(assert (=> b!263683 (= c!45010 (= lt!133545 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun b!263684 () Bool)

(assert (=> b!263684 (= e!170853 (Found!1164 (index!6828 lt!133546)))))

(assert (= (and d!63433 c!45009) b!263681))

(assert (= (and d!63433 (not c!45009)) b!263683))

(assert (= (and b!263683 c!45010) b!263684))

(assert (= (and b!263683 (not c!45010)) b!263680))

(assert (= (and b!263680 c!45011) b!263682))

(assert (= (and b!263680 (not c!45011)) b!263679))

(assert (=> b!263679 m!279433))

(declare-fun m!280195 () Bool)

(assert (=> b!263679 m!280195))

(assert (=> d!63433 m!279317))

(assert (=> d!63433 m!279433))

(declare-fun m!280197 () Bool)

(assert (=> d!63433 m!280197))

(declare-fun m!280199 () Bool)

(assert (=> d!63433 m!280199))

(assert (=> d!63433 m!280197))

(assert (=> d!63433 m!279433))

(declare-fun m!280201 () Bool)

(assert (=> d!63433 m!280201))

(declare-fun m!280203 () Bool)

(assert (=> d!63433 m!280203))

(declare-fun m!280205 () Bool)

(assert (=> d!63433 m!280205))

(declare-fun m!280207 () Bool)

(assert (=> b!263683 m!280207))

(assert (=> b!263226 d!63433))

(assert (=> d!63151 d!63165))

(declare-fun b!263701 () Bool)

(declare-fun e!170865 () Bool)

(declare-fun call!25226 () Bool)

(assert (=> b!263701 (= e!170865 (not call!25226))))

(declare-fun b!263702 () Bool)

(declare-fun e!170866 () Bool)

(assert (=> b!263702 (= e!170866 (not call!25226))))

(declare-fun bm!25223 () Bool)

(assert (=> bm!25223 (= call!25226 (arrayContainsKey!0 (_keys!7034 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!263703 () Bool)

(declare-fun e!170864 () Bool)

(declare-fun e!170863 () Bool)

(assert (=> b!263703 (= e!170864 e!170863)))

(declare-fun c!45016 () Bool)

(declare-fun lt!133549 () SeekEntryResult!1164)

(assert (=> b!263703 (= c!45016 ((_ is MissingVacant!1164) lt!133549))))

(declare-fun bm!25224 () Bool)

(declare-fun call!25227 () Bool)

(declare-fun c!45017 () Bool)

(assert (=> bm!25224 (= call!25227 (inRange!0 (ite c!45017 (index!6826 lt!133549) (index!6829 lt!133549)) (mask!11208 thiss!1504)))))

(declare-fun b!263704 () Bool)

(declare-fun res!128780 () Bool)

(assert (=> b!263704 (=> (not res!128780) (not e!170865))))

(assert (=> b!263704 (= res!128780 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6829 lt!133549)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263705 () Bool)

(declare-fun res!128779 () Bool)

(assert (=> b!263705 (=> (not res!128779) (not e!170865))))

(assert (=> b!263705 (= res!128779 call!25227)))

(assert (=> b!263705 (= e!170863 e!170865)))

(declare-fun b!263706 () Bool)

(declare-fun res!128781 () Bool)

(assert (=> b!263706 (= res!128781 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6826 lt!133549)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263706 (=> (not res!128781) (not e!170866))))

(declare-fun d!63435 () Bool)

(assert (=> d!63435 e!170864))

(assert (=> d!63435 (= c!45017 ((_ is MissingZero!1164) lt!133549))))

(assert (=> d!63435 (= lt!133549 (seekEntryOrOpen!0 key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(assert (=> d!63435 true))

(declare-fun _$34!1131 () Unit!8164)

(assert (=> d!63435 (= (choose!1295 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) key!932 (defaultEntry!4842 thiss!1504)) _$34!1131)))

(declare-fun b!263707 () Bool)

(assert (=> b!263707 (= e!170864 e!170866)))

(declare-fun res!128778 () Bool)

(assert (=> b!263707 (= res!128778 call!25227)))

(assert (=> b!263707 (=> (not res!128778) (not e!170866))))

(declare-fun b!263708 () Bool)

(assert (=> b!263708 (= e!170863 ((_ is Undefined!1164) lt!133549))))

(assert (= (and d!63435 c!45017) b!263707))

(assert (= (and d!63435 (not c!45017)) b!263703))

(assert (= (and b!263707 res!128778) b!263706))

(assert (= (and b!263706 res!128781) b!263702))

(assert (= (and b!263703 c!45016) b!263705))

(assert (= (and b!263703 (not c!45016)) b!263708))

(assert (= (and b!263705 res!128779) b!263704))

(assert (= (and b!263704 res!128780) b!263701))

(assert (= (or b!263707 b!263705) bm!25224))

(assert (= (or b!263702 b!263701) bm!25223))

(assert (=> d!63435 m!279139))

(declare-fun m!280209 () Bool)

(assert (=> b!263704 m!280209))

(assert (=> bm!25223 m!279109))

(declare-fun m!280211 () Bool)

(assert (=> bm!25224 m!280211))

(declare-fun m!280213 () Bool)

(assert (=> b!263706 m!280213))

(assert (=> d!63151 d!63435))

(assert (=> d!63151 d!63237))

(declare-fun d!63437 () Bool)

(declare-fun e!170867 () Bool)

(assert (=> d!63437 e!170867))

(declare-fun res!128782 () Bool)

(assert (=> d!63437 (=> res!128782 e!170867)))

(declare-fun lt!133551 () Bool)

(assert (=> d!63437 (= res!128782 (not lt!133551))))

(declare-fun lt!133553 () Bool)

(assert (=> d!63437 (= lt!133551 lt!133553)))

(declare-fun lt!133552 () Unit!8164)

(declare-fun e!170868 () Unit!8164)

(assert (=> d!63437 (= lt!133552 e!170868)))

(declare-fun c!45018 () Bool)

(assert (=> d!63437 (= c!45018 lt!133553)))

(assert (=> d!63437 (= lt!133553 (containsKey!312 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297)))))

(assert (=> d!63437 (= (contains!1885 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) (select (arr!5996 lt!133005) index!297)) lt!133551)))

(declare-fun b!263709 () Bool)

(declare-fun lt!133550 () Unit!8164)

(assert (=> b!263709 (= e!170868 lt!133550)))

(assert (=> b!263709 (= lt!133550 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297)))))

(assert (=> b!263709 (isDefined!261 (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297)))))

(declare-fun b!263710 () Bool)

(declare-fun Unit!8192 () Unit!8164)

(assert (=> b!263710 (= e!170868 Unit!8192)))

(declare-fun b!263711 () Bool)

(assert (=> b!263711 (= e!170867 (isDefined!261 (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297))))))

(assert (= (and d!63437 c!45018) b!263709))

(assert (= (and d!63437 (not c!45018)) b!263710))

(assert (= (and d!63437 (not res!128782)) b!263711))

(assert (=> d!63437 m!279459))

(declare-fun m!280215 () Bool)

(assert (=> d!63437 m!280215))

(assert (=> b!263709 m!279459))

(declare-fun m!280217 () Bool)

(assert (=> b!263709 m!280217))

(assert (=> b!263709 m!279459))

(declare-fun m!280219 () Bool)

(assert (=> b!263709 m!280219))

(assert (=> b!263709 m!280219))

(declare-fun m!280221 () Bool)

(assert (=> b!263709 m!280221))

(assert (=> b!263711 m!279459))

(assert (=> b!263711 m!280219))

(assert (=> b!263711 m!280219))

(assert (=> b!263711 m!280221))

(assert (=> b!263244 d!63437))

(assert (=> b!263244 d!63197))

(declare-fun b!263712 () Bool)

(declare-fun e!170871 () Bool)

(declare-fun lt!133559 () ListLongMap!3801)

(assert (=> b!263712 (= e!170871 (= (apply!262 lt!133559 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4683 lt!133011)))))

(declare-fun b!263713 () Bool)

(declare-fun e!170872 () Unit!8164)

(declare-fun Unit!8193 () Unit!8164)

(assert (=> b!263713 (= e!170872 Unit!8193)))

(declare-fun b!263714 () Bool)

(declare-fun e!170878 () Bool)

(declare-fun call!25233 () Bool)

(assert (=> b!263714 (= e!170878 (not call!25233))))

(declare-fun b!263715 () Bool)

(declare-fun e!170881 () Bool)

(assert (=> b!263715 (= e!170878 e!170881)))

(declare-fun res!128784 () Bool)

(assert (=> b!263715 (= res!128784 call!25233)))

(assert (=> b!263715 (=> (not res!128784) (not e!170881))))

(declare-fun b!263717 () Bool)

(declare-fun lt!133561 () Unit!8164)

(assert (=> b!263717 (= e!170872 lt!133561)))

(declare-fun lt!133568 () ListLongMap!3801)

(assert (=> b!263717 (= lt!133568 (getCurrentListMapNoExtraKeys!578 (_keys!7034 lt!133011) (_values!4825 lt!133011) (mask!11208 lt!133011) (extraKeys!4579 lt!133011) (zeroValue!4683 lt!133011) (minValue!4683 lt!133011) #b00000000000000000000000000000000 (defaultEntry!4842 lt!133011)))))

(declare-fun lt!133574 () (_ BitVec 64))

(assert (=> b!263717 (= lt!133574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133557 () (_ BitVec 64))

(assert (=> b!263717 (= lt!133557 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000))))

(declare-fun lt!133563 () Unit!8164)

(assert (=> b!263717 (= lt!133563 (addStillContains!238 lt!133568 lt!133574 (zeroValue!4683 lt!133011) lt!133557))))

(assert (=> b!263717 (contains!1885 (+!712 lt!133568 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011))) lt!133557)))

(declare-fun lt!133554 () Unit!8164)

(assert (=> b!263717 (= lt!133554 lt!133563)))

(declare-fun lt!133571 () ListLongMap!3801)

(assert (=> b!263717 (= lt!133571 (getCurrentListMapNoExtraKeys!578 (_keys!7034 lt!133011) (_values!4825 lt!133011) (mask!11208 lt!133011) (extraKeys!4579 lt!133011) (zeroValue!4683 lt!133011) (minValue!4683 lt!133011) #b00000000000000000000000000000000 (defaultEntry!4842 lt!133011)))))

(declare-fun lt!133562 () (_ BitVec 64))

(assert (=> b!263717 (= lt!133562 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133565 () (_ BitVec 64))

(assert (=> b!263717 (= lt!133565 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000))))

(declare-fun lt!133569 () Unit!8164)

(assert (=> b!263717 (= lt!133569 (addApplyDifferent!238 lt!133571 lt!133562 (minValue!4683 lt!133011) lt!133565))))

(assert (=> b!263717 (= (apply!262 (+!712 lt!133571 (tuple2!4887 lt!133562 (minValue!4683 lt!133011))) lt!133565) (apply!262 lt!133571 lt!133565))))

(declare-fun lt!133566 () Unit!8164)

(assert (=> b!263717 (= lt!133566 lt!133569)))

(declare-fun lt!133572 () ListLongMap!3801)

(assert (=> b!263717 (= lt!133572 (getCurrentListMapNoExtraKeys!578 (_keys!7034 lt!133011) (_values!4825 lt!133011) (mask!11208 lt!133011) (extraKeys!4579 lt!133011) (zeroValue!4683 lt!133011) (minValue!4683 lt!133011) #b00000000000000000000000000000000 (defaultEntry!4842 lt!133011)))))

(declare-fun lt!133555 () (_ BitVec 64))

(assert (=> b!263717 (= lt!133555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133575 () (_ BitVec 64))

(assert (=> b!263717 (= lt!133575 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000))))

(declare-fun lt!133556 () Unit!8164)

(assert (=> b!263717 (= lt!133556 (addApplyDifferent!238 lt!133572 lt!133555 (zeroValue!4683 lt!133011) lt!133575))))

(assert (=> b!263717 (= (apply!262 (+!712 lt!133572 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011))) lt!133575) (apply!262 lt!133572 lt!133575))))

(declare-fun lt!133560 () Unit!8164)

(assert (=> b!263717 (= lt!133560 lt!133556)))

(declare-fun lt!133564 () ListLongMap!3801)

(assert (=> b!263717 (= lt!133564 (getCurrentListMapNoExtraKeys!578 (_keys!7034 lt!133011) (_values!4825 lt!133011) (mask!11208 lt!133011) (extraKeys!4579 lt!133011) (zeroValue!4683 lt!133011) (minValue!4683 lt!133011) #b00000000000000000000000000000000 (defaultEntry!4842 lt!133011)))))

(declare-fun lt!133558 () (_ BitVec 64))

(assert (=> b!263717 (= lt!133558 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!133573 () (_ BitVec 64))

(assert (=> b!263717 (= lt!133573 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000))))

(assert (=> b!263717 (= lt!133561 (addApplyDifferent!238 lt!133564 lt!133558 (minValue!4683 lt!133011) lt!133573))))

(assert (=> b!263717 (= (apply!262 (+!712 lt!133564 (tuple2!4887 lt!133558 (minValue!4683 lt!133011))) lt!133573) (apply!262 lt!133564 lt!133573))))

(declare-fun bm!25225 () Bool)

(declare-fun call!25231 () ListLongMap!3801)

(declare-fun call!25228 () ListLongMap!3801)

(assert (=> bm!25225 (= call!25231 call!25228)))

(declare-fun b!263718 () Bool)

(declare-fun e!170879 () Bool)

(assert (=> b!263718 (= e!170879 e!170878)))

(declare-fun c!45024 () Bool)

(assert (=> b!263718 (= c!45024 (not (= (bvand (extraKeys!4579 lt!133011) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263719 () Bool)

(declare-fun e!170880 () ListLongMap!3801)

(declare-fun call!25234 () ListLongMap!3801)

(assert (=> b!263719 (= e!170880 (+!712 call!25234 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))))))

(declare-fun b!263720 () Bool)

(declare-fun e!170874 () Bool)

(assert (=> b!263720 (= e!170874 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun b!263721 () Bool)

(declare-fun e!170873 () ListLongMap!3801)

(assert (=> b!263721 (= e!170880 e!170873)))

(declare-fun c!45023 () Bool)

(assert (=> b!263721 (= c!45023 (and (not (= (bvand (extraKeys!4579 lt!133011) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 lt!133011) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!263722 () Bool)

(declare-fun e!170875 () Bool)

(assert (=> b!263722 (= e!170875 (= (apply!262 lt!133559 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)) (get!3099 (select (arr!5995 (_values!4825 lt!133011)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 lt!133011) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263722 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6346 (_values!4825 lt!133011))))))

(assert (=> b!263722 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(declare-fun b!263723 () Bool)

(declare-fun res!128788 () Bool)

(assert (=> b!263723 (=> (not res!128788) (not e!170879))))

(declare-fun e!170870 () Bool)

(assert (=> b!263723 (= res!128788 e!170870)))

(declare-fun c!45019 () Bool)

(assert (=> b!263723 (= c!45019 (not (= (bvand (extraKeys!4579 lt!133011) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!25226 () Bool)

(declare-fun call!25230 () ListLongMap!3801)

(assert (=> bm!25226 (= call!25230 (getCurrentListMapNoExtraKeys!578 (_keys!7034 lt!133011) (_values!4825 lt!133011) (mask!11208 lt!133011) (extraKeys!4579 lt!133011) (zeroValue!4683 lt!133011) (minValue!4683 lt!133011) #b00000000000000000000000000000000 (defaultEntry!4842 lt!133011)))))

(declare-fun b!263724 () Bool)

(declare-fun e!170869 () ListLongMap!3801)

(declare-fun call!25229 () ListLongMap!3801)

(assert (=> b!263724 (= e!170869 call!25229)))

(declare-fun b!263716 () Bool)

(declare-fun e!170877 () Bool)

(assert (=> b!263716 (= e!170877 e!170875)))

(declare-fun res!128789 () Bool)

(assert (=> b!263716 (=> (not res!128789) (not e!170875))))

(assert (=> b!263716 (= res!128789 (contains!1885 lt!133559 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(assert (=> b!263716 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(declare-fun d!63439 () Bool)

(assert (=> d!63439 e!170879))

(declare-fun res!128787 () Bool)

(assert (=> d!63439 (=> (not res!128787) (not e!170879))))

(assert (=> d!63439 (= res!128787 (or (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))))

(declare-fun lt!133567 () ListLongMap!3801)

(assert (=> d!63439 (= lt!133559 lt!133567)))

(declare-fun lt!133570 () Unit!8164)

(assert (=> d!63439 (= lt!133570 e!170872)))

(declare-fun c!45022 () Bool)

(declare-fun e!170876 () Bool)

(assert (=> d!63439 (= c!45022 e!170876)))

(declare-fun res!128791 () Bool)

(assert (=> d!63439 (=> (not res!128791) (not e!170876))))

(assert (=> d!63439 (= res!128791 (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(assert (=> d!63439 (= lt!133567 e!170880)))

(declare-fun c!45020 () Bool)

(assert (=> d!63439 (= c!45020 (and (not (= (bvand (extraKeys!4579 lt!133011) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4579 lt!133011) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!63439 (validMask!0 (mask!11208 lt!133011))))

(assert (=> d!63439 (= (getCurrentListMap!1448 (_keys!7034 lt!133011) (_values!4825 lt!133011) (mask!11208 lt!133011) (extraKeys!4579 lt!133011) (zeroValue!4683 lt!133011) (minValue!4683 lt!133011) #b00000000000000000000000000000000 (defaultEntry!4842 lt!133011)) lt!133559)))

(declare-fun b!263725 () Bool)

(declare-fun c!45021 () Bool)

(assert (=> b!263725 (= c!45021 (and (not (= (bvand (extraKeys!4579 lt!133011) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4579 lt!133011) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!263725 (= e!170873 e!170869)))

(declare-fun bm!25227 () Bool)

(assert (=> bm!25227 (= call!25229 call!25234)))

(declare-fun bm!25228 () Bool)

(assert (=> bm!25228 (= call!25234 (+!712 (ite c!45020 call!25230 (ite c!45023 call!25228 call!25231)) (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))))))

(declare-fun b!263726 () Bool)

(declare-fun call!25232 () Bool)

(assert (=> b!263726 (= e!170870 (not call!25232))))

(declare-fun b!263727 () Bool)

(assert (=> b!263727 (= e!170876 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun b!263728 () Bool)

(assert (=> b!263728 (= e!170881 (= (apply!262 lt!133559 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4683 lt!133011)))))

(declare-fun b!263729 () Bool)

(assert (=> b!263729 (= e!170869 call!25231)))

(declare-fun bm!25229 () Bool)

(assert (=> bm!25229 (= call!25233 (contains!1885 lt!133559 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263730 () Bool)

(assert (=> b!263730 (= e!170870 e!170871)))

(declare-fun res!128783 () Bool)

(assert (=> b!263730 (= res!128783 call!25232)))

(assert (=> b!263730 (=> (not res!128783) (not e!170871))))

(declare-fun bm!25230 () Bool)

(assert (=> bm!25230 (= call!25232 (contains!1885 lt!133559 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!25231 () Bool)

(assert (=> bm!25231 (= call!25228 call!25230)))

(declare-fun b!263731 () Bool)

(assert (=> b!263731 (= e!170873 call!25229)))

(declare-fun b!263732 () Bool)

(declare-fun res!128785 () Bool)

(assert (=> b!263732 (=> (not res!128785) (not e!170879))))

(assert (=> b!263732 (= res!128785 e!170877)))

(declare-fun res!128786 () Bool)

(assert (=> b!263732 (=> res!128786 e!170877)))

(assert (=> b!263732 (= res!128786 (not e!170874))))

(declare-fun res!128790 () Bool)

(assert (=> b!263732 (=> (not res!128790) (not e!170874))))

(assert (=> b!263732 (= res!128790 (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(assert (= (and d!63439 c!45020) b!263719))

(assert (= (and d!63439 (not c!45020)) b!263721))

(assert (= (and b!263721 c!45023) b!263731))

(assert (= (and b!263721 (not c!45023)) b!263725))

(assert (= (and b!263725 c!45021) b!263724))

(assert (= (and b!263725 (not c!45021)) b!263729))

(assert (= (or b!263724 b!263729) bm!25225))

(assert (= (or b!263731 bm!25225) bm!25231))

(assert (= (or b!263731 b!263724) bm!25227))

(assert (= (or b!263719 bm!25231) bm!25226))

(assert (= (or b!263719 bm!25227) bm!25228))

(assert (= (and d!63439 res!128791) b!263727))

(assert (= (and d!63439 c!45022) b!263717))

(assert (= (and d!63439 (not c!45022)) b!263713))

(assert (= (and d!63439 res!128787) b!263732))

(assert (= (and b!263732 res!128790) b!263720))

(assert (= (and b!263732 (not res!128786)) b!263716))

(assert (= (and b!263716 res!128789) b!263722))

(assert (= (and b!263732 res!128785) b!263723))

(assert (= (and b!263723 c!45019) b!263730))

(assert (= (and b!263723 (not c!45019)) b!263726))

(assert (= (and b!263730 res!128783) b!263712))

(assert (= (or b!263730 b!263726) bm!25230))

(assert (= (and b!263723 res!128788) b!263718))

(assert (= (and b!263718 c!45024) b!263715))

(assert (= (and b!263718 (not c!45024)) b!263714))

(assert (= (and b!263715 res!128784) b!263728))

(assert (= (or b!263715 b!263714) bm!25229))

(declare-fun b_lambda!8371 () Bool)

(assert (=> (not b_lambda!8371) (not b!263722)))

(declare-fun tb!3031 () Bool)

(declare-fun t!8839 () Bool)

(assert (=> (and b!262905 (= (defaultEntry!4842 thiss!1504) (defaultEntry!4842 lt!133011)) t!8839) tb!3031))

(declare-fun result!5431 () Bool)

(assert (=> tb!3031 (= result!5431 tp_is_empty!6655)))

(assert (=> b!263722 t!8839))

(declare-fun b_and!13969 () Bool)

(assert (= b_and!13967 (and (=> t!8839 result!5431) b_and!13969)))

(declare-fun m!280223 () Bool)

(assert (=> bm!25226 m!280223))

(assert (=> b!263716 m!279599))

(assert (=> b!263716 m!279599))

(declare-fun m!280225 () Bool)

(assert (=> b!263716 m!280225))

(declare-fun m!280227 () Bool)

(assert (=> bm!25230 m!280227))

(assert (=> b!263722 m!279599))

(declare-fun m!280229 () Bool)

(assert (=> b!263722 m!280229))

(declare-fun m!280231 () Bool)

(assert (=> b!263722 m!280231))

(assert (=> b!263722 m!280229))

(declare-fun m!280233 () Bool)

(assert (=> b!263722 m!280233))

(assert (=> b!263722 m!280231))

(assert (=> b!263722 m!279599))

(declare-fun m!280235 () Bool)

(assert (=> b!263722 m!280235))

(assert (=> d!63439 m!279819))

(declare-fun m!280237 () Bool)

(assert (=> b!263728 m!280237))

(assert (=> b!263720 m!279599))

(assert (=> b!263720 m!279599))

(assert (=> b!263720 m!279601))

(declare-fun m!280239 () Bool)

(assert (=> bm!25229 m!280239))

(declare-fun m!280241 () Bool)

(assert (=> b!263719 m!280241))

(assert (=> b!263727 m!279599))

(assert (=> b!263727 m!279599))

(assert (=> b!263727 m!279601))

(declare-fun m!280243 () Bool)

(assert (=> bm!25228 m!280243))

(declare-fun m!280245 () Bool)

(assert (=> b!263717 m!280245))

(declare-fun m!280247 () Bool)

(assert (=> b!263717 m!280247))

(declare-fun m!280249 () Bool)

(assert (=> b!263717 m!280249))

(declare-fun m!280251 () Bool)

(assert (=> b!263717 m!280251))

(declare-fun m!280253 () Bool)

(assert (=> b!263717 m!280253))

(declare-fun m!280255 () Bool)

(assert (=> b!263717 m!280255))

(declare-fun m!280257 () Bool)

(assert (=> b!263717 m!280257))

(declare-fun m!280259 () Bool)

(assert (=> b!263717 m!280259))

(declare-fun m!280261 () Bool)

(assert (=> b!263717 m!280261))

(assert (=> b!263717 m!280251))

(declare-fun m!280263 () Bool)

(assert (=> b!263717 m!280263))

(declare-fun m!280265 () Bool)

(assert (=> b!263717 m!280265))

(declare-fun m!280267 () Bool)

(assert (=> b!263717 m!280267))

(assert (=> b!263717 m!280255))

(assert (=> b!263717 m!279599))

(declare-fun m!280269 () Bool)

(assert (=> b!263717 m!280269))

(declare-fun m!280271 () Bool)

(assert (=> b!263717 m!280271))

(assert (=> b!263717 m!280245))

(assert (=> b!263717 m!280265))

(assert (=> b!263717 m!280223))

(declare-fun m!280273 () Bool)

(assert (=> b!263717 m!280273))

(declare-fun m!280275 () Bool)

(assert (=> b!263712 m!280275))

(assert (=> d!63155 d!63439))

(declare-fun b!263733 () Bool)

(declare-fun e!170885 () Bool)

(declare-fun call!25235 () Bool)

(assert (=> b!263733 (= e!170885 call!25235)))

(declare-fun b!263734 () Bool)

(declare-fun e!170882 () Bool)

(assert (=> b!263734 (= e!170882 (contains!1889 Nil!3761 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263735 () Bool)

(declare-fun e!170884 () Bool)

(assert (=> b!263735 (= e!170884 e!170885)))

(declare-fun c!45025 () Bool)

(assert (=> b!263735 (= c!45025 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263736 () Bool)

(assert (=> b!263736 (= e!170885 call!25235)))

(declare-fun bm!25232 () Bool)

(assert (=> bm!25232 (= call!25235 (arrayNoDuplicates!0 (_keys!7034 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45025 (Cons!3760 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) Nil!3761) Nil!3761)))))

(declare-fun b!263737 () Bool)

(declare-fun e!170883 () Bool)

(assert (=> b!263737 (= e!170883 e!170884)))

(declare-fun res!128792 () Bool)

(assert (=> b!263737 (=> (not res!128792) (not e!170884))))

(assert (=> b!263737 (= res!128792 (not e!170882))))

(declare-fun res!128794 () Bool)

(assert (=> b!263737 (=> (not res!128794) (not e!170882))))

(assert (=> b!263737 (= res!128794 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!63441 () Bool)

(declare-fun res!128793 () Bool)

(assert (=> d!63441 (=> res!128793 e!170883)))

(assert (=> d!63441 (= res!128793 (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63441 (= (arrayNoDuplicates!0 (_keys!7034 thiss!1504) #b00000000000000000000000000000000 Nil!3761) e!170883)))

(assert (= (and d!63441 (not res!128793)) b!263737))

(assert (= (and b!263737 res!128794) b!263734))

(assert (= (and b!263737 res!128792) b!263735))

(assert (= (and b!263735 c!45025) b!263736))

(assert (= (and b!263735 (not c!45025)) b!263733))

(assert (= (or b!263736 b!263733) bm!25232))

(assert (=> b!263734 m!279365))

(assert (=> b!263734 m!279365))

(declare-fun m!280277 () Bool)

(assert (=> b!263734 m!280277))

(assert (=> b!263735 m!279365))

(assert (=> b!263735 m!279365))

(assert (=> b!263735 m!279393))

(assert (=> bm!25232 m!279365))

(declare-fun m!280279 () Bool)

(assert (=> bm!25232 m!280279))

(assert (=> b!263737 m!279365))

(assert (=> b!263737 m!279365))

(assert (=> b!263737 m!279393))

(assert (=> b!263305 d!63441))

(declare-fun b!263741 () Bool)

(declare-fun e!170887 () Option!327)

(assert (=> b!263741 (= e!170887 None!325)))

(declare-fun b!263739 () Bool)

(declare-fun e!170886 () Option!327)

(assert (=> b!263739 (= e!170886 e!170887)))

(declare-fun c!45027 () Bool)

(assert (=> b!263739 (= c!45027 (and ((_ is Cons!3759) (toList!1916 lt!133176)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133176))) (_1!2454 lt!133017)))))))

(declare-fun b!263740 () Bool)

(assert (=> b!263740 (= e!170887 (getValueByKey!321 (t!8832 (toList!1916 lt!133176)) (_1!2454 lt!133017)))))

(declare-fun d!63443 () Bool)

(declare-fun c!45026 () Bool)

(assert (=> d!63443 (= c!45026 (and ((_ is Cons!3759) (toList!1916 lt!133176)) (= (_1!2454 (h!4425 (toList!1916 lt!133176))) (_1!2454 lt!133017))))))

(assert (=> d!63443 (= (getValueByKey!321 (toList!1916 lt!133176) (_1!2454 lt!133017)) e!170886)))

(declare-fun b!263738 () Bool)

(assert (=> b!263738 (= e!170886 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133176)))))))

(assert (= (and d!63443 c!45026) b!263738))

(assert (= (and d!63443 (not c!45026)) b!263739))

(assert (= (and b!263739 c!45027) b!263740))

(assert (= (and b!263739 (not c!45027)) b!263741))

(declare-fun m!280281 () Bool)

(assert (=> b!263740 m!280281))

(assert (=> b!263089 d!63443))

(declare-fun d!63445 () Bool)

(declare-fun e!170888 () Bool)

(assert (=> d!63445 e!170888))

(declare-fun res!128795 () Bool)

(assert (=> d!63445 (=> (not res!128795) (not e!170888))))

(declare-fun lt!133577 () ListLongMap!3801)

(assert (=> d!63445 (= res!128795 (contains!1885 lt!133577 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133578 () List!3763)

(assert (=> d!63445 (= lt!133577 (ListLongMap!3802 lt!133578))))

(declare-fun lt!133579 () Unit!8164)

(declare-fun lt!133576 () Unit!8164)

(assert (=> d!63445 (= lt!133579 lt!133576)))

(assert (=> d!63445 (= (getValueByKey!321 lt!133578 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63445 (= lt!133576 (lemmaContainsTupThenGetReturnValue!177 lt!133578 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63445 (= lt!133578 (insertStrictlySorted!180 (toList!1916 call!25185) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63445 (= (+!712 call!25185 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) lt!133577)))

(declare-fun b!263742 () Bool)

(declare-fun res!128796 () Bool)

(assert (=> b!263742 (=> (not res!128796) (not e!170888))))

(assert (=> b!263742 (= res!128796 (= (getValueByKey!321 (toList!1916 lt!133577) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!263743 () Bool)

(assert (=> b!263743 (= e!170888 (contains!1888 (toList!1916 lt!133577) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(assert (= (and d!63445 res!128795) b!263742))

(assert (= (and b!263742 res!128796) b!263743))

(declare-fun m!280283 () Bool)

(assert (=> d!63445 m!280283))

(declare-fun m!280285 () Bool)

(assert (=> d!63445 m!280285))

(declare-fun m!280287 () Bool)

(assert (=> d!63445 m!280287))

(declare-fun m!280289 () Bool)

(assert (=> d!63445 m!280289))

(declare-fun m!280291 () Bool)

(assert (=> b!263742 m!280291))

(declare-fun m!280293 () Bool)

(assert (=> b!263743 m!280293))

(assert (=> b!263264 d!63445))

(declare-fun b!263744 () Bool)

(declare-fun e!170889 () (_ BitVec 32))

(assert (=> b!263744 (= e!170889 #b00000000000000000000000000000000)))

(declare-fun b!263745 () Bool)

(declare-fun e!170890 () (_ BitVec 32))

(assert (=> b!263745 (= e!170889 e!170890)))

(declare-fun c!45028 () Bool)

(assert (=> b!263745 (= c!45028 (validKeyInArray!0 (select (arr!5996 lt!133005) index!297)))))

(declare-fun d!63447 () Bool)

(declare-fun lt!133580 () (_ BitVec 32))

(assert (=> d!63447 (and (bvsge lt!133580 #b00000000000000000000000000000000) (bvsle lt!133580 (bvsub (size!6347 lt!133005) index!297)))))

(assert (=> d!63447 (= lt!133580 e!170889)))

(declare-fun c!45029 () Bool)

(assert (=> d!63447 (= c!45029 (bvsge index!297 (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!63447 (and (bvsle index!297 (bvadd index!297 #b00000000000000000000000000000001)) (bvsge index!297 #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(assert (=> d!63447 (= (arrayCountValidKeys!0 lt!133005 index!297 (bvadd index!297 #b00000000000000000000000000000001)) lt!133580)))

(declare-fun b!263746 () Bool)

(declare-fun call!25236 () (_ BitVec 32))

(assert (=> b!263746 (= e!170890 call!25236)))

(declare-fun b!263747 () Bool)

(assert (=> b!263747 (= e!170890 (bvadd #b00000000000000000000000000000001 call!25236))))

(declare-fun bm!25233 () Bool)

(assert (=> bm!25233 (= call!25236 (arrayCountValidKeys!0 lt!133005 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (= (and d!63447 c!45029) b!263744))

(assert (= (and d!63447 (not c!45029)) b!263745))

(assert (= (and b!263745 c!45028) b!263747))

(assert (= (and b!263745 (not c!45028)) b!263746))

(assert (= (or b!263747 b!263746) bm!25233))

(assert (=> b!263745 m!279459))

(assert (=> b!263745 m!279459))

(assert (=> b!263745 m!279461))

(declare-fun m!280295 () Bool)

(assert (=> bm!25233 m!280295))

(assert (=> d!63205 d!63447))

(declare-fun d!63449 () Bool)

(assert (=> d!63449 (= (arrayCountValidKeys!0 lt!133005 index!297 (bvadd index!297 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(assert (=> d!63449 true))

(declare-fun _$85!33 () Unit!8164)

(assert (=> d!63449 (= (choose!2 lt!133005 index!297) _$85!33)))

(declare-fun bs!9300 () Bool)

(assert (= bs!9300 d!63449))

(assert (=> bs!9300 m!279569))

(assert (=> d!63205 d!63449))

(assert (=> b!263293 d!63281))

(assert (=> b!263168 d!63285))

(declare-fun d!63451 () Bool)

(declare-fun res!128797 () Bool)

(declare-fun e!170891 () Bool)

(assert (=> d!63451 (=> res!128797 e!170891)))

(assert (=> d!63451 (= res!128797 (and ((_ is Cons!3759) (toList!1916 lt!133003)) (= (_1!2454 (h!4425 (toList!1916 lt!133003))) key!932)))))

(assert (=> d!63451 (= (containsKey!312 (toList!1916 lt!133003) key!932) e!170891)))

(declare-fun b!263748 () Bool)

(declare-fun e!170892 () Bool)

(assert (=> b!263748 (= e!170891 e!170892)))

(declare-fun res!128798 () Bool)

(assert (=> b!263748 (=> (not res!128798) (not e!170892))))

(assert (=> b!263748 (= res!128798 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133003))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133003))) key!932)) ((_ is Cons!3759) (toList!1916 lt!133003)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133003))) key!932)))))

(declare-fun b!263749 () Bool)

(assert (=> b!263749 (= e!170892 (containsKey!312 (t!8832 (toList!1916 lt!133003)) key!932))))

(assert (= (and d!63451 (not res!128797)) b!263748))

(assert (= (and b!263748 res!128798) b!263749))

(declare-fun m!280297 () Bool)

(assert (=> b!263749 m!280297))

(assert (=> d!63203 d!63451))

(declare-fun b!263753 () Bool)

(declare-fun e!170894 () Option!327)

(assert (=> b!263753 (= e!170894 None!325)))

(declare-fun b!263751 () Bool)

(declare-fun e!170893 () Option!327)

(assert (=> b!263751 (= e!170893 e!170894)))

(declare-fun c!45031 () Bool)

(assert (=> b!263751 (= c!45031 (and ((_ is Cons!3759) (toList!1916 lt!133265)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133265))) (_1!2454 lt!133017)))))))

(declare-fun b!263752 () Bool)

(assert (=> b!263752 (= e!170894 (getValueByKey!321 (t!8832 (toList!1916 lt!133265)) (_1!2454 lt!133017)))))

(declare-fun d!63453 () Bool)

(declare-fun c!45030 () Bool)

(assert (=> d!63453 (= c!45030 (and ((_ is Cons!3759) (toList!1916 lt!133265)) (= (_1!2454 (h!4425 (toList!1916 lt!133265))) (_1!2454 lt!133017))))))

(assert (=> d!63453 (= (getValueByKey!321 (toList!1916 lt!133265) (_1!2454 lt!133017)) e!170893)))

(declare-fun b!263750 () Bool)

(assert (=> b!263750 (= e!170893 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133265)))))))

(assert (= (and d!63453 c!45030) b!263750))

(assert (= (and d!63453 (not c!45030)) b!263751))

(assert (= (and b!263751 c!45031) b!263752))

(assert (= (and b!263751 (not c!45031)) b!263753))

(declare-fun m!280299 () Bool)

(assert (=> b!263752 m!280299))

(assert (=> b!263201 d!63453))

(declare-fun b!263754 () Bool)

(declare-fun e!170895 () (_ BitVec 32))

(assert (=> b!263754 (= e!170895 #b00000000000000000000000000000000)))

(declare-fun b!263755 () Bool)

(declare-fun e!170896 () (_ BitVec 32))

(assert (=> b!263755 (= e!170895 e!170896)))

(declare-fun c!45032 () Bool)

(assert (=> b!263755 (= c!45032 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63455 () Bool)

(declare-fun lt!133581 () (_ BitVec 32))

(assert (=> d!63455 (and (bvsge lt!133581 #b00000000000000000000000000000000) (bvsle lt!133581 (bvsub (size!6347 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!63455 (= lt!133581 e!170895)))

(declare-fun c!45033 () Bool)

(assert (=> d!63455 (= c!45033 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63455 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6347 (_keys!7034 thiss!1504)) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63455 (= (arrayCountValidKeys!0 (_keys!7034 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))) lt!133581)))

(declare-fun b!263756 () Bool)

(declare-fun call!25237 () (_ BitVec 32))

(assert (=> b!263756 (= e!170896 call!25237)))

(declare-fun b!263757 () Bool)

(assert (=> b!263757 (= e!170896 (bvadd #b00000000000000000000000000000001 call!25237))))

(declare-fun bm!25234 () Bool)

(assert (=> bm!25234 (= call!25237 (arrayCountValidKeys!0 (_keys!7034 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (= (and d!63455 c!45033) b!263754))

(assert (= (and d!63455 (not c!45033)) b!263755))

(assert (= (and b!263755 c!45032) b!263757))

(assert (= (and b!263755 (not c!45032)) b!263756))

(assert (= (or b!263757 b!263756) bm!25234))

(assert (=> b!263755 m!279975))

(assert (=> b!263755 m!279975))

(declare-fun m!280301 () Bool)

(assert (=> b!263755 m!280301))

(declare-fun m!280303 () Bool)

(assert (=> bm!25234 m!280303))

(assert (=> bm!25183 d!63455))

(declare-fun d!63457 () Bool)

(assert (=> d!63457 (= (apply!262 lt!133244 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) (get!3100 (getValueByKey!321 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9301 () Bool)

(assert (= bs!9301 d!63457))

(assert (=> bs!9301 m!279365))

(assert (=> bs!9301 m!279649))

(assert (=> bs!9301 m!279649))

(declare-fun m!280305 () Bool)

(assert (=> bs!9301 m!280305))

(assert (=> b!263170 d!63457))

(declare-fun d!63459 () Bool)

(declare-fun c!45034 () Bool)

(assert (=> d!63459 (= c!45034 ((_ is ValueCellFull!2984) (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!170897 () V!8521)

(assert (=> d!63459 (= (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!170897)))

(declare-fun b!263758 () Bool)

(assert (=> b!263758 (= e!170897 (get!3101 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263759 () Bool)

(assert (=> b!263759 (= e!170897 (get!3102 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63459 c!45034) b!263758))

(assert (= (and d!63459 (not c!45034)) b!263759))

(assert (=> b!263758 m!279385))

(assert (=> b!263758 m!279383))

(declare-fun m!280307 () Bool)

(assert (=> b!263758 m!280307))

(assert (=> b!263759 m!279385))

(assert (=> b!263759 m!279383))

(declare-fun m!280309 () Bool)

(assert (=> b!263759 m!280309))

(assert (=> b!263170 d!63459))

(declare-fun mapIsEmpty!11357 () Bool)

(declare-fun mapRes!11357 () Bool)

(assert (=> mapIsEmpty!11357 mapRes!11357))

(declare-fun b!263761 () Bool)

(declare-fun e!170898 () Bool)

(assert (=> b!263761 (= e!170898 tp_is_empty!6655)))

(declare-fun mapNonEmpty!11357 () Bool)

(declare-fun tp!23732 () Bool)

(declare-fun e!170899 () Bool)

(assert (=> mapNonEmpty!11357 (= mapRes!11357 (and tp!23732 e!170899))))

(declare-fun mapKey!11357 () (_ BitVec 32))

(declare-fun mapValue!11357 () ValueCell!2984)

(declare-fun mapRest!11357 () (Array (_ BitVec 32) ValueCell!2984))

(assert (=> mapNonEmpty!11357 (= mapRest!11356 (store mapRest!11357 mapKey!11357 mapValue!11357))))

(declare-fun b!263760 () Bool)

(assert (=> b!263760 (= e!170899 tp_is_empty!6655)))

(declare-fun condMapEmpty!11357 () Bool)

(declare-fun mapDefault!11357 () ValueCell!2984)

(assert (=> mapNonEmpty!11356 (= condMapEmpty!11357 (= mapRest!11356 ((as const (Array (_ BitVec 32) ValueCell!2984)) mapDefault!11357)))))

(assert (=> mapNonEmpty!11356 (= tp!23731 (and e!170898 mapRes!11357))))

(assert (= (and mapNonEmpty!11356 condMapEmpty!11357) mapIsEmpty!11357))

(assert (= (and mapNonEmpty!11356 (not condMapEmpty!11357)) mapNonEmpty!11357))

(assert (= (and mapNonEmpty!11357 ((_ is ValueCellFull!2984) mapValue!11357)) b!263760))

(assert (= (and mapNonEmpty!11356 ((_ is ValueCellFull!2984) mapDefault!11357)) b!263761))

(declare-fun m!280311 () Bool)

(assert (=> mapNonEmpty!11357 m!280311))

(declare-fun b_lambda!8373 () Bool)

(assert (= b_lambda!8361 (or (and b!262905 b_free!6793) b_lambda!8373)))

(declare-fun b_lambda!8375 () Bool)

(assert (= b_lambda!8367 (or (and b!262905 b_free!6793) b_lambda!8375)))

(declare-fun b_lambda!8377 () Bool)

(assert (= b_lambda!8369 (or (and b!262905 b_free!6793) b_lambda!8377)))

(declare-fun b_lambda!8379 () Bool)

(assert (= b_lambda!8363 (or (and b!262905 b_free!6793) b_lambda!8379)))

(declare-fun b_lambda!8381 () Bool)

(assert (= b_lambda!8365 (or (and b!262905 b_free!6793) b_lambda!8381)))

(check-sat (not d!63407) (not b!263742) (not d!63445) (not b!263599) (not d!63317) (not b!263419) (not b!263625) (not b_next!6793) (not bm!25190) (not b!263329) (not b!263479) (not b!263610) (not d!63231) (not d!63261) (not d!63295) (not b!263509) (not b!263549) (not bm!25215) (not b!263644) (not b!263635) (not bm!25230) (not d!63367) (not d!63379) (not bm!25226) (not b!263521) (not d!63387) (not d!63265) (not d!63241) (not b!263663) (not b!263552) (not d!63405) (not d!63339) (not d!63217) (not b!263583) (not b!263499) (not bm!25217) (not b!263339) (not d!63457) (not bm!25206) (not b!263412) (not b!263517) (not d!63373) (not b!263543) (not d!63263) (not d!63323) (not bm!25209) (not d!63345) (not d!63291) (not d!63277) (not b!263743) (not b_lambda!8359) (not b!263664) (not b!263341) (not b!263404) (not b!263331) (not d!63355) (not bm!25207) (not b!263752) (not d!63259) (not b!263717) (not d!63275) (not d!63283) (not bm!25223) b_and!13969 (not bm!25229) (not b!263326) (not b!263647) (not b!263482) (not d!63257) (not b_lambda!8373) (not b!263588) (not b!263651) (not d!63321) (not b!263436) (not b!263338) (not d!63319) (not b!263401) (not bm!25228) (not b!263502) (not d!63377) (not b!263425) (not d!63293) (not b!263540) (not d!63301) (not b!263616) (not b_lambda!8379) (not b!263627) (not b!263666) (not d!63233) (not b!263447) (not b!263453) (not bm!25218) (not d!63287) (not b!263745) (not b!263314) (not b!263524) (not b!263650) (not b_lambda!8377) (not b!263640) (not d!63381) (not d!63253) (not d!63359) (not b!263679) (not d!63423) (not b!263417) (not b!263737) (not b!263418) (not d!63371) (not bm!25186) (not d!63255) (not b!263591) (not b!263369) (not b!263371) (not b_lambda!8375) (not b!263559) (not b!263503) (not bm!25197) (not b!263433) (not b!263712) (not bm!25205) (not b!263547) (not d!63349) (not b!263735) (not b!263434) (not b!263668) (not bm!25210) (not b!263639) (not b!263561) (not b!263623) (not b!263336) (not b!263513) (not d!63269) (not b!263584) (not d!63399) (not b!263533) (not d!63435) (not b!263361) (not b!263548) (not b!263716) (not b_lambda!8371) (not b!263413) (not b!263749) (not d!63307) (not d!63297) (not b!263615) (not b!263755) (not d!63419) (not d!63309) (not b!263637) (not bm!25187) (not d!63389) (not b!263618) (not d!63245) (not d!63337) (not b!263649) (not d!63267) (not b!263424) (not bm!25232) (not d!63235) (not d!63251) (not b!263398) (not bm!25233) (not bm!25201) (not b!263427) (not b!263740) (not b!263586) (not b!263516) (not d!63361) (not b!263320) (not b!263759) (not d!63331) (not b!263500) (not bm!25203) (not bm!25185) (not b!263734) (not d!63427) (not b!263495) (not b!263646) (not d!63279) (not d!63411) (not b!263728) (not b!263596) (not b!263672) (not bm!25216) (not b!263613) (not b!263522) (not d!63229) (not b!263722) (not b!263527) (not bm!25211) (not b!263758) (not b!263645) (not b!263514) (not bm!25234) (not d!63341) (not b!263319) (not b!263416) (not b!263577) (not b!263454) (not b!263414) (not b!263655) (not b!263632) (not b!263643) (not bm!25224) (not b!263711) (not b!263420) (not d!63343) (not b!263494) (not b!263405) (not d!63449) (not b!263589) (not b!263426) (not b!263396) (not b!263532) (not b!263630) (not d!63391) (not b!263652) (not b!263604) (not b!263510) (not b_lambda!8357) (not b!263333) (not b!263593) (not d!63385) (not bm!25200) (not b!263581) (not d!63325) (not b!263727) (not d!63249) (not d!63247) (not d!63401) (not b!263653) (not d!63433) (not d!63393) (not b!263316) (not b_lambda!8381) (not b!263602) (not b!263631) (not b!263328) (not b!263597) (not b!263400) (not b!263525) (not b!263678) (not mapNonEmpty!11357) (not b!263484) (not d!63369) (not d!63383) (not b!263658) (not b!263661) (not d!63397) (not d!63439) (not b!263720) (not b!263515) (not d!63271) (not d!63273) (not d!63365) (not d!63437) (not d!63333) (not b!263633) (not d!63363) (not d!63305) (not d!63395) (not b!263605) (not bm!25212) (not b!263709) (not d!63375) tp_is_empty!6655 (not b!263406) (not b!263594) (not d!63429) (not b!263719) (not b!263407) (not b!263674) (not b!263560))
(check-sat b_and!13969 (not b_next!6793))
(get-model)

(declare-fun d!63461 () Bool)

(declare-fun lt!133582 () Bool)

(assert (=> d!63461 (= lt!133582 (select (content!178 (toList!1916 lt!133410)) (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))

(declare-fun e!170901 () Bool)

(assert (=> d!63461 (= lt!133582 e!170901)))

(declare-fun res!128800 () Bool)

(assert (=> d!63461 (=> (not res!128800) (not e!170901))))

(assert (=> d!63461 (= res!128800 ((_ is Cons!3759) (toList!1916 lt!133410)))))

(assert (=> d!63461 (= (contains!1888 (toList!1916 lt!133410) (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) lt!133582)))

(declare-fun b!263762 () Bool)

(declare-fun e!170900 () Bool)

(assert (=> b!263762 (= e!170901 e!170900)))

(declare-fun res!128799 () Bool)

(assert (=> b!263762 (=> res!128799 e!170900)))

(assert (=> b!263762 (= res!128799 (= (h!4425 (toList!1916 lt!133410)) (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))

(declare-fun b!263763 () Bool)

(assert (=> b!263763 (= e!170900 (contains!1888 (t!8832 (toList!1916 lt!133410)) (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63461 res!128800) b!263762))

(assert (= (and b!263762 (not res!128799)) b!263763))

(declare-fun m!280313 () Bool)

(assert (=> d!63461 m!280313))

(declare-fun m!280315 () Bool)

(assert (=> d!63461 m!280315))

(declare-fun m!280317 () Bool)

(assert (=> b!263763 m!280317))

(assert (=> b!263425 d!63461))

(declare-fun b!263764 () Bool)

(declare-fun e!170905 () Bool)

(declare-fun call!25238 () Bool)

(assert (=> b!263764 (= e!170905 call!25238)))

(declare-fun b!263765 () Bool)

(declare-fun e!170902 () Bool)

(assert (=> b!263765 (= e!170902 (contains!1889 (ite c!44986 (Cons!3760 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) Nil!3761) Nil!3761) (select (arr!5996 (_keys!7034 lt!133011)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263766 () Bool)

(declare-fun e!170904 () Bool)

(assert (=> b!263766 (= e!170904 e!170905)))

(declare-fun c!45035 () Bool)

(assert (=> b!263766 (= c!45035 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263767 () Bool)

(assert (=> b!263767 (= e!170905 call!25238)))

(declare-fun bm!25235 () Bool)

(assert (=> bm!25235 (= call!25238 (arrayNoDuplicates!0 (_keys!7034 lt!133011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45035 (Cons!3760 (select (arr!5996 (_keys!7034 lt!133011)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44986 (Cons!3760 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (ite c!44986 (Cons!3760 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) Nil!3761) Nil!3761))))))

(declare-fun b!263768 () Bool)

(declare-fun e!170903 () Bool)

(assert (=> b!263768 (= e!170903 e!170904)))

(declare-fun res!128801 () Bool)

(assert (=> b!263768 (=> (not res!128801) (not e!170904))))

(assert (=> b!263768 (= res!128801 (not e!170902))))

(declare-fun res!128803 () Bool)

(assert (=> b!263768 (=> (not res!128803) (not e!170902))))

(assert (=> b!263768 (= res!128803 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63463 () Bool)

(declare-fun res!128802 () Bool)

(assert (=> d!63463 (=> res!128802 e!170903)))

(assert (=> d!63463 (= res!128802 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 lt!133011))))))

(assert (=> d!63463 (= (arrayNoDuplicates!0 (_keys!7034 lt!133011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44986 (Cons!3760 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) e!170903)))

(assert (= (and d!63463 (not res!128802)) b!263768))

(assert (= (and b!263768 res!128803) b!263765))

(assert (= (and b!263768 res!128801) b!263766))

(assert (= (and b!263766 c!45035) b!263767))

(assert (= (and b!263766 (not c!45035)) b!263764))

(assert (= (or b!263767 b!263764) bm!25235))

(declare-fun m!280319 () Bool)

(assert (=> b!263765 m!280319))

(assert (=> b!263765 m!280319))

(declare-fun m!280321 () Bool)

(assert (=> b!263765 m!280321))

(assert (=> b!263766 m!280319))

(assert (=> b!263766 m!280319))

(declare-fun m!280323 () Bool)

(assert (=> b!263766 m!280323))

(assert (=> bm!25235 m!280319))

(declare-fun m!280325 () Bool)

(assert (=> bm!25235 m!280325))

(assert (=> b!263768 m!280319))

(assert (=> b!263768 m!280319))

(assert (=> b!263768 m!280323))

(assert (=> bm!25211 d!63463))

(assert (=> b!263549 d!63413))

(declare-fun d!63465 () Bool)

(assert (=> d!63465 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133312) lt!133306)) (v!5509 (getValueByKey!321 (toList!1916 lt!133312) lt!133306)))))

(assert (=> d!63271 d!63465))

(declare-fun b!263772 () Bool)

(declare-fun e!170907 () Option!327)

(assert (=> b!263772 (= e!170907 None!325)))

(declare-fun b!263770 () Bool)

(declare-fun e!170906 () Option!327)

(assert (=> b!263770 (= e!170906 e!170907)))

(declare-fun c!45037 () Bool)

(assert (=> b!263770 (= c!45037 (and ((_ is Cons!3759) (toList!1916 lt!133312)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133312))) lt!133306))))))

(declare-fun b!263771 () Bool)

(assert (=> b!263771 (= e!170907 (getValueByKey!321 (t!8832 (toList!1916 lt!133312)) lt!133306))))

(declare-fun d!63467 () Bool)

(declare-fun c!45036 () Bool)

(assert (=> d!63467 (= c!45036 (and ((_ is Cons!3759) (toList!1916 lt!133312)) (= (_1!2454 (h!4425 (toList!1916 lt!133312))) lt!133306)))))

(assert (=> d!63467 (= (getValueByKey!321 (toList!1916 lt!133312) lt!133306) e!170906)))

(declare-fun b!263769 () Bool)

(assert (=> b!263769 (= e!170906 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133312)))))))

(assert (= (and d!63467 c!45036) b!263769))

(assert (= (and d!63467 (not c!45036)) b!263770))

(assert (= (and b!263770 c!45037) b!263771))

(assert (= (and b!263770 (not c!45037)) b!263772))

(declare-fun m!280327 () Bool)

(assert (=> b!263771 m!280327))

(assert (=> d!63271 d!63467))

(declare-fun d!63469 () Bool)

(assert (=> d!63469 (= (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263319 d!63469))

(declare-fun d!63471 () Bool)

(assert (=> d!63471 (= (apply!262 (+!712 lt!133457 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504))) lt!133451) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133457 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504)))) lt!133451)))))

(declare-fun bs!9302 () Bool)

(assert (= bs!9302 d!63471))

(declare-fun m!280329 () Bool)

(assert (=> bs!9302 m!280329))

(assert (=> bs!9302 m!280329))

(declare-fun m!280331 () Bool)

(assert (=> bs!9302 m!280331))

(assert (=> b!263522 d!63471))

(declare-fun d!63473 () Bool)

(assert (=> d!63473 (= (apply!262 (+!712 lt!133457 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504))) lt!133451) (apply!262 lt!133457 lt!133451))))

(declare-fun lt!133583 () Unit!8164)

(assert (=> d!63473 (= lt!133583 (choose!1300 lt!133457 lt!133448 (minValue!4683 thiss!1504) lt!133451))))

(declare-fun e!170908 () Bool)

(assert (=> d!63473 e!170908))

(declare-fun res!128804 () Bool)

(assert (=> d!63473 (=> (not res!128804) (not e!170908))))

(assert (=> d!63473 (= res!128804 (contains!1885 lt!133457 lt!133451))))

(assert (=> d!63473 (= (addApplyDifferent!238 lt!133457 lt!133448 (minValue!4683 thiss!1504) lt!133451) lt!133583)))

(declare-fun b!263773 () Bool)

(assert (=> b!263773 (= e!170908 (not (= lt!133451 lt!133448)))))

(assert (= (and d!63473 res!128804) b!263773))

(assert (=> d!63473 m!279897))

(declare-fun m!280333 () Bool)

(assert (=> d!63473 m!280333))

(assert (=> d!63473 m!279891))

(declare-fun m!280335 () Bool)

(assert (=> d!63473 m!280335))

(assert (=> d!63473 m!279897))

(assert (=> d!63473 m!279899))

(assert (=> b!263522 d!63473))

(declare-fun d!63475 () Bool)

(assert (=> d!63475 (= (apply!262 lt!133450 lt!133459) (get!3100 (getValueByKey!321 (toList!1916 lt!133450) lt!133459)))))

(declare-fun bs!9303 () Bool)

(assert (= bs!9303 d!63475))

(declare-fun m!280337 () Bool)

(assert (=> bs!9303 m!280337))

(assert (=> bs!9303 m!280337))

(declare-fun m!280339 () Bool)

(assert (=> bs!9303 m!280339))

(assert (=> b!263522 d!63475))

(declare-fun d!63477 () Bool)

(declare-fun e!170909 () Bool)

(assert (=> d!63477 e!170909))

(declare-fun res!128805 () Bool)

(assert (=> d!63477 (=> (not res!128805) (not e!170909))))

(declare-fun lt!133585 () ListLongMap!3801)

(assert (=> d!63477 (= res!128805 (contains!1885 lt!133585 (_1!2454 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133586 () List!3763)

(assert (=> d!63477 (= lt!133585 (ListLongMap!3802 lt!133586))))

(declare-fun lt!133587 () Unit!8164)

(declare-fun lt!133584 () Unit!8164)

(assert (=> d!63477 (= lt!133587 lt!133584)))

(assert (=> d!63477 (= (getValueByKey!321 lt!133586 (_1!2454 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504)))))))

(assert (=> d!63477 (= lt!133584 (lemmaContainsTupThenGetReturnValue!177 lt!133586 (_1!2454 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504)))))))

(assert (=> d!63477 (= lt!133586 (insertStrictlySorted!180 (toList!1916 lt!133450) (_1!2454 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504)))))))

(assert (=> d!63477 (= (+!712 lt!133450 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504))) lt!133585)))

(declare-fun b!263774 () Bool)

(declare-fun res!128806 () Bool)

(assert (=> b!263774 (=> (not res!128806) (not e!170909))))

(assert (=> b!263774 (= res!128806 (= (getValueByKey!321 (toList!1916 lt!133585) (_1!2454 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504))))))))

(declare-fun b!263775 () Bool)

(assert (=> b!263775 (= e!170909 (contains!1888 (toList!1916 lt!133585) (tuple2!4887 lt!133444 (minValue!4683 thiss!1504))))))

(assert (= (and d!63477 res!128805) b!263774))

(assert (= (and b!263774 res!128806) b!263775))

(declare-fun m!280341 () Bool)

(assert (=> d!63477 m!280341))

(declare-fun m!280343 () Bool)

(assert (=> d!63477 m!280343))

(declare-fun m!280345 () Bool)

(assert (=> d!63477 m!280345))

(declare-fun m!280347 () Bool)

(assert (=> d!63477 m!280347))

(declare-fun m!280349 () Bool)

(assert (=> b!263774 m!280349))

(declare-fun m!280351 () Bool)

(assert (=> b!263775 m!280351))

(assert (=> b!263522 d!63477))

(declare-fun d!63479 () Bool)

(assert (=> d!63479 (= (apply!262 lt!133457 lt!133451) (get!3100 (getValueByKey!321 (toList!1916 lt!133457) lt!133451)))))

(declare-fun bs!9304 () Bool)

(assert (= bs!9304 d!63479))

(declare-fun m!280353 () Bool)

(assert (=> bs!9304 m!280353))

(assert (=> bs!9304 m!280353))

(declare-fun m!280355 () Bool)

(assert (=> bs!9304 m!280355))

(assert (=> b!263522 d!63479))

(declare-fun d!63481 () Bool)

(assert (=> d!63481 (= (apply!262 lt!133458 lt!133461) (get!3100 (getValueByKey!321 (toList!1916 lt!133458) lt!133461)))))

(declare-fun bs!9305 () Bool)

(assert (= bs!9305 d!63481))

(declare-fun m!280357 () Bool)

(assert (=> bs!9305 m!280357))

(assert (=> bs!9305 m!280357))

(declare-fun m!280359 () Bool)

(assert (=> bs!9305 m!280359))

(assert (=> b!263522 d!63481))

(declare-fun d!63483 () Bool)

(declare-fun e!170910 () Bool)

(assert (=> d!63483 e!170910))

(declare-fun res!128807 () Bool)

(assert (=> d!63483 (=> (not res!128807) (not e!170910))))

(declare-fun lt!133589 () ListLongMap!3801)

(assert (=> d!63483 (= res!128807 (contains!1885 lt!133589 (_1!2454 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133590 () List!3763)

(assert (=> d!63483 (= lt!133589 (ListLongMap!3802 lt!133590))))

(declare-fun lt!133591 () Unit!8164)

(declare-fun lt!133588 () Unit!8164)

(assert (=> d!63483 (= lt!133591 lt!133588)))

(assert (=> d!63483 (= (getValueByKey!321 lt!133590 (_1!2454 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504)))))))

(assert (=> d!63483 (= lt!133588 (lemmaContainsTupThenGetReturnValue!177 lt!133590 (_1!2454 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504)))))))

(assert (=> d!63483 (= lt!133590 (insertStrictlySorted!180 (toList!1916 lt!133457) (_1!2454 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504)))))))

(assert (=> d!63483 (= (+!712 lt!133457 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504))) lt!133589)))

(declare-fun b!263776 () Bool)

(declare-fun res!128808 () Bool)

(assert (=> b!263776 (=> (not res!128808) (not e!170910))))

(assert (=> b!263776 (= res!128808 (= (getValueByKey!321 (toList!1916 lt!133589) (_1!2454 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133448 (minValue!4683 thiss!1504))))))))

(declare-fun b!263777 () Bool)

(assert (=> b!263777 (= e!170910 (contains!1888 (toList!1916 lt!133589) (tuple2!4887 lt!133448 (minValue!4683 thiss!1504))))))

(assert (= (and d!63483 res!128807) b!263776))

(assert (= (and b!263776 res!128808) b!263777))

(declare-fun m!280361 () Bool)

(assert (=> d!63483 m!280361))

(declare-fun m!280363 () Bool)

(assert (=> d!63483 m!280363))

(declare-fun m!280365 () Bool)

(assert (=> d!63483 m!280365))

(declare-fun m!280367 () Bool)

(assert (=> d!63483 m!280367))

(declare-fun m!280369 () Bool)

(assert (=> b!263776 m!280369))

(declare-fun m!280371 () Bool)

(assert (=> b!263777 m!280371))

(assert (=> b!263522 d!63483))

(declare-fun d!63485 () Bool)

(assert (=> d!63485 (contains!1885 (+!712 lt!133454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504))) lt!133443)))

(declare-fun lt!133592 () Unit!8164)

(assert (=> d!63485 (= lt!133592 (choose!1301 lt!133454 lt!133460 (zeroValue!4683 thiss!1504) lt!133443))))

(assert (=> d!63485 (contains!1885 lt!133454 lt!133443)))

(assert (=> d!63485 (= (addStillContains!238 lt!133454 lt!133460 (zeroValue!4683 thiss!1504) lt!133443) lt!133592)))

(declare-fun bs!9306 () Bool)

(assert (= bs!9306 d!63485))

(assert (=> bs!9306 m!279907))

(assert (=> bs!9306 m!279907))

(assert (=> bs!9306 m!279909))

(declare-fun m!280373 () Bool)

(assert (=> bs!9306 m!280373))

(declare-fun m!280375 () Bool)

(assert (=> bs!9306 m!280375))

(assert (=> b!263522 d!63485))

(declare-fun d!63487 () Bool)

(declare-fun e!170911 () Bool)

(assert (=> d!63487 e!170911))

(declare-fun res!128809 () Bool)

(assert (=> d!63487 (=> (not res!128809) (not e!170911))))

(declare-fun lt!133594 () ListLongMap!3801)

(assert (=> d!63487 (= res!128809 (contains!1885 lt!133594 (_1!2454 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133595 () List!3763)

(assert (=> d!63487 (= lt!133594 (ListLongMap!3802 lt!133595))))

(declare-fun lt!133596 () Unit!8164)

(declare-fun lt!133593 () Unit!8164)

(assert (=> d!63487 (= lt!133596 lt!133593)))

(assert (=> d!63487 (= (getValueByKey!321 lt!133595 (_1!2454 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63487 (= lt!133593 (lemmaContainsTupThenGetReturnValue!177 lt!133595 (_1!2454 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63487 (= lt!133595 (insertStrictlySorted!180 (toList!1916 lt!133458) (_1!2454 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63487 (= (+!712 lt!133458 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504))) lt!133594)))

(declare-fun b!263778 () Bool)

(declare-fun res!128810 () Bool)

(assert (=> b!263778 (=> (not res!128810) (not e!170911))))

(assert (=> b!263778 (= res!128810 (= (getValueByKey!321 (toList!1916 lt!133594) (_1!2454 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263779 () Bool)

(assert (=> b!263779 (= e!170911 (contains!1888 (toList!1916 lt!133594) (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63487 res!128809) b!263778))

(assert (= (and b!263778 res!128810) b!263779))

(declare-fun m!280377 () Bool)

(assert (=> d!63487 m!280377))

(declare-fun m!280379 () Bool)

(assert (=> d!63487 m!280379))

(declare-fun m!280381 () Bool)

(assert (=> d!63487 m!280381))

(declare-fun m!280383 () Bool)

(assert (=> d!63487 m!280383))

(declare-fun m!280385 () Bool)

(assert (=> b!263778 m!280385))

(declare-fun m!280387 () Bool)

(assert (=> b!263779 m!280387))

(assert (=> b!263522 d!63487))

(declare-fun d!63489 () Bool)

(declare-fun e!170912 () Bool)

(assert (=> d!63489 e!170912))

(declare-fun res!128811 () Bool)

(assert (=> d!63489 (=> res!128811 e!170912)))

(declare-fun lt!133598 () Bool)

(assert (=> d!63489 (= res!128811 (not lt!133598))))

(declare-fun lt!133600 () Bool)

(assert (=> d!63489 (= lt!133598 lt!133600)))

(declare-fun lt!133599 () Unit!8164)

(declare-fun e!170913 () Unit!8164)

(assert (=> d!63489 (= lt!133599 e!170913)))

(declare-fun c!45038 () Bool)

(assert (=> d!63489 (= c!45038 lt!133600)))

(assert (=> d!63489 (= lt!133600 (containsKey!312 (toList!1916 (+!712 lt!133454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504)))) lt!133443))))

(assert (=> d!63489 (= (contains!1885 (+!712 lt!133454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504))) lt!133443) lt!133598)))

(declare-fun b!263780 () Bool)

(declare-fun lt!133597 () Unit!8164)

(assert (=> b!263780 (= e!170913 lt!133597)))

(assert (=> b!263780 (= lt!133597 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (+!712 lt!133454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504)))) lt!133443))))

(assert (=> b!263780 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504)))) lt!133443))))

(declare-fun b!263781 () Bool)

(declare-fun Unit!8194 () Unit!8164)

(assert (=> b!263781 (= e!170913 Unit!8194)))

(declare-fun b!263782 () Bool)

(assert (=> b!263782 (= e!170912 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504)))) lt!133443)))))

(assert (= (and d!63489 c!45038) b!263780))

(assert (= (and d!63489 (not c!45038)) b!263781))

(assert (= (and d!63489 (not res!128811)) b!263782))

(declare-fun m!280389 () Bool)

(assert (=> d!63489 m!280389))

(declare-fun m!280391 () Bool)

(assert (=> b!263780 m!280391))

(declare-fun m!280393 () Bool)

(assert (=> b!263780 m!280393))

(assert (=> b!263780 m!280393))

(declare-fun m!280395 () Bool)

(assert (=> b!263780 m!280395))

(assert (=> b!263782 m!280393))

(assert (=> b!263782 m!280393))

(assert (=> b!263782 m!280395))

(assert (=> b!263522 d!63489))

(declare-fun d!63491 () Bool)

(assert (=> d!63491 (= (apply!262 (+!712 lt!133450 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504))) lt!133459) (apply!262 lt!133450 lt!133459))))

(declare-fun lt!133601 () Unit!8164)

(assert (=> d!63491 (= lt!133601 (choose!1300 lt!133450 lt!133444 (minValue!4683 thiss!1504) lt!133459))))

(declare-fun e!170914 () Bool)

(assert (=> d!63491 e!170914))

(declare-fun res!128812 () Bool)

(assert (=> d!63491 (=> (not res!128812) (not e!170914))))

(assert (=> d!63491 (= res!128812 (contains!1885 lt!133450 lt!133459))))

(assert (=> d!63491 (= (addApplyDifferent!238 lt!133450 lt!133444 (minValue!4683 thiss!1504) lt!133459) lt!133601)))

(declare-fun b!263783 () Bool)

(assert (=> b!263783 (= e!170914 (not (= lt!133459 lt!133444)))))

(assert (= (and d!63491 res!128812) b!263783))

(assert (=> d!63491 m!279893))

(declare-fun m!280397 () Bool)

(assert (=> d!63491 m!280397))

(assert (=> d!63491 m!279901))

(declare-fun m!280399 () Bool)

(assert (=> d!63491 m!280399))

(assert (=> d!63491 m!279893))

(assert (=> d!63491 m!279905))

(assert (=> b!263522 d!63491))

(declare-fun d!63493 () Bool)

(declare-fun e!170915 () Bool)

(assert (=> d!63493 e!170915))

(declare-fun res!128813 () Bool)

(assert (=> d!63493 (=> (not res!128813) (not e!170915))))

(declare-fun lt!133603 () ListLongMap!3801)

(assert (=> d!63493 (= res!128813 (contains!1885 lt!133603 (_1!2454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133604 () List!3763)

(assert (=> d!63493 (= lt!133603 (ListLongMap!3802 lt!133604))))

(declare-fun lt!133605 () Unit!8164)

(declare-fun lt!133602 () Unit!8164)

(assert (=> d!63493 (= lt!133605 lt!133602)))

(assert (=> d!63493 (= (getValueByKey!321 lt!133604 (_1!2454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63493 (= lt!133602 (lemmaContainsTupThenGetReturnValue!177 lt!133604 (_1!2454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63493 (= lt!133604 (insertStrictlySorted!180 (toList!1916 lt!133454) (_1!2454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63493 (= (+!712 lt!133454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504))) lt!133603)))

(declare-fun b!263784 () Bool)

(declare-fun res!128814 () Bool)

(assert (=> b!263784 (=> (not res!128814) (not e!170915))))

(assert (=> b!263784 (= res!128814 (= (getValueByKey!321 (toList!1916 lt!133603) (_1!2454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263785 () Bool)

(assert (=> b!263785 (= e!170915 (contains!1888 (toList!1916 lt!133603) (tuple2!4887 lt!133460 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63493 res!128813) b!263784))

(assert (= (and b!263784 res!128814) b!263785))

(declare-fun m!280401 () Bool)

(assert (=> d!63493 m!280401))

(declare-fun m!280403 () Bool)

(assert (=> d!63493 m!280403))

(declare-fun m!280405 () Bool)

(assert (=> d!63493 m!280405))

(declare-fun m!280407 () Bool)

(assert (=> d!63493 m!280407))

(declare-fun m!280409 () Bool)

(assert (=> b!263784 m!280409))

(declare-fun m!280411 () Bool)

(assert (=> b!263785 m!280411))

(assert (=> b!263522 d!63493))

(declare-fun b!263786 () Bool)

(declare-fun res!128815 () Bool)

(declare-fun e!170918 () Bool)

(assert (=> b!263786 (=> (not res!128815) (not e!170918))))

(declare-fun lt!133608 () ListLongMap!3801)

(assert (=> b!263786 (= res!128815 (not (contains!1885 lt!133608 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263787 () Bool)

(declare-fun e!170919 () Bool)

(assert (=> b!263787 (= e!170918 e!170919)))

(declare-fun c!45041 () Bool)

(declare-fun e!170922 () Bool)

(assert (=> b!263787 (= c!45041 e!170922)))

(declare-fun res!128818 () Bool)

(assert (=> b!263787 (=> (not res!128818) (not e!170922))))

(assert (=> b!263787 (= res!128818 (bvslt #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(declare-fun b!263788 () Bool)

(declare-fun e!170916 () ListLongMap!3801)

(declare-fun e!170920 () ListLongMap!3801)

(assert (=> b!263788 (= e!170916 e!170920)))

(declare-fun c!45042 () Bool)

(assert (=> b!263788 (= c!45042 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263789 () Bool)

(declare-fun call!25239 () ListLongMap!3801)

(assert (=> b!263789 (= e!170920 call!25239)))

(declare-fun b!263790 () Bool)

(declare-fun e!170917 () Bool)

(assert (=> b!263790 (= e!170917 (isEmpty!546 lt!133608))))

(declare-fun d!63495 () Bool)

(assert (=> d!63495 e!170918))

(declare-fun res!128816 () Bool)

(assert (=> d!63495 (=> (not res!128816) (not e!170918))))

(assert (=> d!63495 (= res!128816 (not (contains!1885 lt!133608 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63495 (= lt!133608 e!170916)))

(declare-fun c!45040 () Bool)

(assert (=> d!63495 (= c!45040 (bvsge #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(assert (=> d!63495 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63495 (= (getCurrentListMapNoExtraKeys!578 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)) lt!133608)))

(declare-fun b!263791 () Bool)

(assert (=> b!263791 (= e!170922 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263791 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!263792 () Bool)

(assert (=> b!263792 (= e!170916 (ListLongMap!3802 Nil!3760))))

(declare-fun bm!25236 () Bool)

(assert (=> bm!25236 (= call!25239 (getCurrentListMapNoExtraKeys!578 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)))))

(declare-fun b!263793 () Bool)

(assert (=> b!263793 (= e!170919 e!170917)))

(declare-fun c!45039 () Bool)

(assert (=> b!263793 (= c!45039 (bvslt #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(declare-fun b!263794 () Bool)

(assert (=> b!263794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(assert (=> b!263794 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6346 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))))))))

(declare-fun e!170921 () Bool)

(assert (=> b!263794 (= e!170921 (= (apply!262 lt!133608 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)) (get!3099 (select (arr!5995 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263795 () Bool)

(declare-fun lt!133607 () Unit!8164)

(declare-fun lt!133606 () Unit!8164)

(assert (=> b!263795 (= lt!133607 lt!133606)))

(declare-fun lt!133610 () ListLongMap!3801)

(declare-fun lt!133612 () (_ BitVec 64))

(declare-fun lt!133611 () V!8521)

(declare-fun lt!133609 () (_ BitVec 64))

(assert (=> b!263795 (not (contains!1885 (+!712 lt!133610 (tuple2!4887 lt!133609 lt!133611)) lt!133612))))

(assert (=> b!263795 (= lt!133606 (addStillNotContains!131 lt!133610 lt!133609 lt!133611 lt!133612))))

(assert (=> b!263795 (= lt!133612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!263795 (= lt!133611 (get!3099 (select (arr!5995 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!263795 (= lt!133609 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000))))

(assert (=> b!263795 (= lt!133610 call!25239)))

(assert (=> b!263795 (= e!170920 (+!712 call!25239 (tuple2!4887 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!263796 () Bool)

(assert (=> b!263796 (= e!170917 (= lt!133608 (getCurrentListMapNoExtraKeys!578 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504))) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504))))))

(declare-fun b!263797 () Bool)

(assert (=> b!263797 (= e!170919 e!170921)))

(assert (=> b!263797 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(declare-fun res!128817 () Bool)

(assert (=> b!263797 (= res!128817 (contains!1885 lt!133608 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263797 (=> (not res!128817) (not e!170921))))

(assert (= (and d!63495 c!45040) b!263792))

(assert (= (and d!63495 (not c!45040)) b!263788))

(assert (= (and b!263788 c!45042) b!263795))

(assert (= (and b!263788 (not c!45042)) b!263789))

(assert (= (or b!263795 b!263789) bm!25236))

(assert (= (and d!63495 res!128816) b!263786))

(assert (= (and b!263786 res!128815) b!263787))

(assert (= (and b!263787 res!128818) b!263791))

(assert (= (and b!263787 c!45041) b!263797))

(assert (= (and b!263787 (not c!45041)) b!263793))

(assert (= (and b!263797 res!128817) b!263794))

(assert (= (and b!263793 c!45039) b!263796))

(assert (= (and b!263793 (not c!45039)) b!263790))

(declare-fun b_lambda!8383 () Bool)

(assert (=> (not b_lambda!8383) (not b!263794)))

(assert (=> b!263794 t!8837))

(declare-fun b_and!13971 () Bool)

(assert (= b_and!13969 (and (=> t!8837 result!5425) b_and!13971)))

(declare-fun b_lambda!8385 () Bool)

(assert (=> (not b_lambda!8385) (not b!263795)))

(assert (=> b!263795 t!8837))

(declare-fun b_and!13973 () Bool)

(assert (= b_and!13971 (and (=> t!8837 result!5425) b_and!13973)))

(declare-fun m!280413 () Bool)

(assert (=> b!263790 m!280413))

(assert (=> b!263791 m!279611))

(assert (=> b!263791 m!279611))

(assert (=> b!263791 m!279615))

(declare-fun m!280415 () Bool)

(assert (=> b!263796 m!280415))

(assert (=> b!263788 m!279611))

(assert (=> b!263788 m!279611))

(assert (=> b!263788 m!279615))

(assert (=> b!263794 m!279873))

(assert (=> b!263794 m!279611))

(assert (=> b!263794 m!279611))

(declare-fun m!280417 () Bool)

(assert (=> b!263794 m!280417))

(assert (=> b!263794 m!279873))

(assert (=> b!263794 m!279383))

(assert (=> b!263794 m!279875))

(assert (=> b!263794 m!279383))

(declare-fun m!280419 () Bool)

(assert (=> d!63495 m!280419))

(assert (=> d!63495 m!279317))

(declare-fun m!280421 () Bool)

(assert (=> b!263786 m!280421))

(assert (=> bm!25236 m!280415))

(assert (=> b!263797 m!279611))

(assert (=> b!263797 m!279611))

(declare-fun m!280423 () Bool)

(assert (=> b!263797 m!280423))

(declare-fun m!280425 () Bool)

(assert (=> b!263795 m!280425))

(assert (=> b!263795 m!279873))

(declare-fun m!280427 () Bool)

(assert (=> b!263795 m!280427))

(assert (=> b!263795 m!279611))

(assert (=> b!263795 m!280427))

(declare-fun m!280429 () Bool)

(assert (=> b!263795 m!280429))

(declare-fun m!280431 () Bool)

(assert (=> b!263795 m!280431))

(assert (=> b!263795 m!279873))

(assert (=> b!263795 m!279383))

(assert (=> b!263795 m!279875))

(assert (=> b!263795 m!279383))

(assert (=> b!263522 d!63495))

(declare-fun d!63497 () Bool)

(assert (=> d!63497 (= (apply!262 (+!712 lt!133450 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504))) lt!133459) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133450 (tuple2!4887 lt!133444 (minValue!4683 thiss!1504)))) lt!133459)))))

(declare-fun bs!9307 () Bool)

(assert (= bs!9307 d!63497))

(declare-fun m!280433 () Bool)

(assert (=> bs!9307 m!280433))

(assert (=> bs!9307 m!280433))

(declare-fun m!280435 () Bool)

(assert (=> bs!9307 m!280435))

(assert (=> b!263522 d!63497))

(declare-fun d!63499 () Bool)

(assert (=> d!63499 (= (apply!262 (+!712 lt!133458 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504))) lt!133461) (apply!262 lt!133458 lt!133461))))

(declare-fun lt!133613 () Unit!8164)

(assert (=> d!63499 (= lt!133613 (choose!1300 lt!133458 lt!133441 (zeroValue!4683 thiss!1504) lt!133461))))

(declare-fun e!170923 () Bool)

(assert (=> d!63499 e!170923))

(declare-fun res!128819 () Bool)

(assert (=> d!63499 (=> (not res!128819) (not e!170923))))

(assert (=> d!63499 (= res!128819 (contains!1885 lt!133458 lt!133461))))

(assert (=> d!63499 (= (addApplyDifferent!238 lt!133458 lt!133441 (zeroValue!4683 thiss!1504) lt!133461) lt!133613)))

(declare-fun b!263798 () Bool)

(assert (=> b!263798 (= e!170923 (not (= lt!133461 lt!133441)))))

(assert (= (and d!63499 res!128819) b!263798))

(assert (=> d!63499 m!279887))

(declare-fun m!280437 () Bool)

(assert (=> d!63499 m!280437))

(assert (=> d!63499 m!279911))

(declare-fun m!280439 () Bool)

(assert (=> d!63499 m!280439))

(assert (=> d!63499 m!279887))

(assert (=> d!63499 m!279889))

(assert (=> b!263522 d!63499))

(declare-fun d!63501 () Bool)

(assert (=> d!63501 (= (apply!262 (+!712 lt!133458 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504))) lt!133461) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133458 (tuple2!4887 lt!133441 (zeroValue!4683 thiss!1504)))) lt!133461)))))

(declare-fun bs!9308 () Bool)

(assert (= bs!9308 d!63501))

(declare-fun m!280441 () Bool)

(assert (=> bs!9308 m!280441))

(assert (=> bs!9308 m!280441))

(declare-fun m!280443 () Bool)

(assert (=> bs!9308 m!280443))

(assert (=> b!263522 d!63501))

(declare-fun lt!133614 () Bool)

(declare-fun d!63503 () Bool)

(assert (=> d!63503 (= lt!133614 (select (content!178 (toList!1916 lt!133528)) (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))

(declare-fun e!170925 () Bool)

(assert (=> d!63503 (= lt!133614 e!170925)))

(declare-fun res!128821 () Bool)

(assert (=> d!63503 (=> (not res!128821) (not e!170925))))

(assert (=> d!63503 (= res!128821 ((_ is Cons!3759) (toList!1916 lt!133528)))))

(assert (=> d!63503 (= (contains!1888 (toList!1916 lt!133528) (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) lt!133614)))

(declare-fun b!263799 () Bool)

(declare-fun e!170924 () Bool)

(assert (=> b!263799 (= e!170925 e!170924)))

(declare-fun res!128820 () Bool)

(assert (=> b!263799 (=> res!128820 e!170924)))

(assert (=> b!263799 (= res!128820 (= (h!4425 (toList!1916 lt!133528)) (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))

(declare-fun b!263800 () Bool)

(assert (=> b!263800 (= e!170924 (contains!1888 (t!8832 (toList!1916 lt!133528)) (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))

(assert (= (and d!63503 res!128821) b!263799))

(assert (= (and b!263799 (not res!128820)) b!263800))

(declare-fun m!280445 () Bool)

(assert (=> d!63503 m!280445))

(declare-fun m!280447 () Bool)

(assert (=> d!63503 m!280447))

(declare-fun m!280449 () Bool)

(assert (=> b!263800 m!280449))

(assert (=> b!263651 d!63503))

(declare-fun lt!133615 () Bool)

(declare-fun d!63505 () Bool)

(assert (=> d!63505 (= lt!133615 (select (content!178 (toList!1916 lt!133507)) (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))

(declare-fun e!170927 () Bool)

(assert (=> d!63505 (= lt!133615 e!170927)))

(declare-fun res!128823 () Bool)

(assert (=> d!63505 (=> (not res!128823) (not e!170927))))

(assert (=> d!63505 (= res!128823 ((_ is Cons!3759) (toList!1916 lt!133507)))))

(assert (=> d!63505 (= (contains!1888 (toList!1916 lt!133507) (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) lt!133615)))

(declare-fun b!263801 () Bool)

(declare-fun e!170926 () Bool)

(assert (=> b!263801 (= e!170927 e!170926)))

(declare-fun res!128822 () Bool)

(assert (=> b!263801 (=> res!128822 e!170926)))

(assert (=> b!263801 (= res!128822 (= (h!4425 (toList!1916 lt!133507)) (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))

(declare-fun b!263802 () Bool)

(assert (=> b!263802 (= e!170926 (contains!1888 (t!8832 (toList!1916 lt!133507)) (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63505 res!128823) b!263801))

(assert (= (and b!263801 (not res!128822)) b!263802))

(declare-fun m!280451 () Bool)

(assert (=> d!63505 m!280451))

(declare-fun m!280453 () Bool)

(assert (=> d!63505 m!280453))

(declare-fun m!280455 () Bool)

(assert (=> b!263802 m!280455))

(assert (=> b!263631 d!63505))

(assert (=> bm!25203 d!63495))

(declare-fun d!63507 () Bool)

(assert (=> d!63507 (= (isDefined!261 (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297))) (not (isEmpty!547 (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297)))))))

(declare-fun bs!9309 () Bool)

(assert (= bs!9309 d!63507))

(assert (=> bs!9309 m!280219))

(declare-fun m!280457 () Bool)

(assert (=> bs!9309 m!280457))

(assert (=> b!263711 d!63507))

(declare-fun b!263806 () Bool)

(declare-fun e!170929 () Option!327)

(assert (=> b!263806 (= e!170929 None!325)))

(declare-fun b!263804 () Bool)

(declare-fun e!170928 () Option!327)

(assert (=> b!263804 (= e!170928 e!170929)))

(declare-fun c!45044 () Bool)

(assert (=> b!263804 (= c!45044 (and ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (not (= (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (select (arr!5996 lt!133005) index!297)))))))

(declare-fun b!263805 () Bool)

(assert (=> b!263805 (= e!170929 (getValueByKey!321 (t!8832 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (select (arr!5996 lt!133005) index!297)))))

(declare-fun d!63509 () Bool)

(declare-fun c!45043 () Bool)

(assert (=> d!63509 (= c!45043 (and ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (= (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (select (arr!5996 lt!133005) index!297))))))

(assert (=> d!63509 (= (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297)) e!170928)))

(declare-fun b!263803 () Bool)

(assert (=> b!263803 (= e!170928 (Some!326 (_2!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))))))

(assert (= (and d!63509 c!45043) b!263803))

(assert (= (and d!63509 (not c!45043)) b!263804))

(assert (= (and b!263804 c!45044) b!263805))

(assert (= (and b!263804 (not c!45044)) b!263806))

(assert (=> b!263805 m!279459))

(declare-fun m!280459 () Bool)

(assert (=> b!263805 m!280459))

(assert (=> b!263711 d!63509))

(declare-fun d!63511 () Bool)

(assert (=> d!63511 (= (size!6352 lt!133011) (bvadd (_size!1983 lt!133011) (bvsdiv (bvadd (extraKeys!4579 lt!133011) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!263494 d!63511))

(declare-fun b!263807 () Bool)

(declare-fun e!170930 () Bool)

(declare-fun call!25240 () Bool)

(assert (=> b!263807 (= e!170930 call!25240)))

(declare-fun bm!25237 () Bool)

(assert (=> bm!25237 (= call!25240 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun b!263808 () Bool)

(declare-fun e!170931 () Bool)

(assert (=> b!263808 (= e!170931 call!25240)))

(declare-fun b!263809 () Bool)

(declare-fun e!170932 () Bool)

(assert (=> b!263809 (= e!170932 e!170931)))

(declare-fun c!45045 () Bool)

(assert (=> b!263809 (= c!45045 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63513 () Bool)

(declare-fun res!128825 () Bool)

(assert (=> d!63513 (=> res!128825 e!170932)))

(assert (=> d!63513 (= res!128825 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63513 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7034 thiss!1504) (mask!11208 thiss!1504)) e!170932)))

(declare-fun b!263810 () Bool)

(assert (=> b!263810 (= e!170931 e!170930)))

(declare-fun lt!133617 () (_ BitVec 64))

(assert (=> b!263810 (= lt!133617 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133618 () Unit!8164)

(assert (=> b!263810 (= lt!133618 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7034 thiss!1504) lt!133617 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!263810 (arrayContainsKey!0 (_keys!7034 thiss!1504) lt!133617 #b00000000000000000000000000000000)))

(declare-fun lt!133616 () Unit!8164)

(assert (=> b!263810 (= lt!133616 lt!133618)))

(declare-fun res!128824 () Bool)

(assert (=> b!263810 (= res!128824 (= (seekEntryOrOpen!0 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!7034 thiss!1504) (mask!11208 thiss!1504)) (Found!1164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!263810 (=> (not res!128824) (not e!170930))))

(assert (= (and d!63513 (not res!128825)) b!263809))

(assert (= (and b!263809 c!45045) b!263810))

(assert (= (and b!263809 (not c!45045)) b!263808))

(assert (= (and b!263810 res!128824) b!263807))

(assert (= (or b!263807 b!263808) bm!25237))

(declare-fun m!280461 () Bool)

(assert (=> bm!25237 m!280461))

(assert (=> b!263809 m!279975))

(assert (=> b!263809 m!279975))

(assert (=> b!263809 m!280301))

(assert (=> b!263810 m!279975))

(declare-fun m!280463 () Bool)

(assert (=> b!263810 m!280463))

(declare-fun m!280465 () Bool)

(assert (=> b!263810 m!280465))

(assert (=> b!263810 m!279975))

(declare-fun m!280467 () Bool)

(assert (=> b!263810 m!280467))

(assert (=> bm!25209 d!63513))

(declare-fun b!263814 () Bool)

(declare-fun e!170934 () Option!327)

(assert (=> b!263814 (= e!170934 None!325)))

(declare-fun b!263812 () Bool)

(declare-fun e!170933 () Option!327)

(assert (=> b!263812 (= e!170933 e!170934)))

(declare-fun c!45047 () Bool)

(assert (=> b!263812 (= c!45047 (and ((_ is Cons!3759) (toList!1916 lt!133401)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133401))) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263813 () Bool)

(assert (=> b!263813 (= e!170934 (getValueByKey!321 (t!8832 (toList!1916 lt!133401)) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(declare-fun c!45046 () Bool)

(declare-fun d!63515 () Bool)

(assert (=> d!63515 (= c!45046 (and ((_ is Cons!3759) (toList!1916 lt!133401)) (= (_1!2454 (h!4425 (toList!1916 lt!133401))) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))))

(assert (=> d!63515 (= (getValueByKey!321 (toList!1916 lt!133401) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) e!170933)))

(declare-fun b!263811 () Bool)

(assert (=> b!263811 (= e!170933 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133401)))))))

(assert (= (and d!63515 c!45046) b!263811))

(assert (= (and d!63515 (not c!45046)) b!263812))

(assert (= (and b!263812 c!45047) b!263813))

(assert (= (and b!263812 (not c!45047)) b!263814))

(declare-fun m!280469 () Bool)

(assert (=> b!263813 m!280469))

(assert (=> b!263419 d!63515))

(declare-fun d!63517 () Bool)

(declare-fun e!170935 () Bool)

(assert (=> d!63517 e!170935))

(declare-fun res!128826 () Bool)

(assert (=> d!63517 (=> res!128826 e!170935)))

(declare-fun lt!133620 () Bool)

(assert (=> d!63517 (= res!128826 (not lt!133620))))

(declare-fun lt!133622 () Bool)

(assert (=> d!63517 (= lt!133620 lt!133622)))

(declare-fun lt!133621 () Unit!8164)

(declare-fun e!170936 () Unit!8164)

(assert (=> d!63517 (= lt!133621 e!170936)))

(declare-fun c!45048 () Bool)

(assert (=> d!63517 (= c!45048 lt!133622)))

(assert (=> d!63517 (= lt!133622 (containsKey!312 (toList!1916 lt!133473) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63517 (= (contains!1885 lt!133473 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133620)))

(declare-fun b!263815 () Bool)

(declare-fun lt!133619 () Unit!8164)

(assert (=> b!263815 (= e!170936 lt!133619)))

(assert (=> b!263815 (= lt!133619 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133473) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> b!263815 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133473) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!263816 () Bool)

(declare-fun Unit!8195 () Unit!8164)

(assert (=> b!263816 (= e!170936 Unit!8195)))

(declare-fun b!263817 () Bool)

(assert (=> b!263817 (= e!170935 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133473) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63517 c!45048) b!263815))

(assert (= (and d!63517 (not c!45048)) b!263816))

(assert (= (and d!63517 (not res!128826)) b!263817))

(declare-fun m!280471 () Bool)

(assert (=> d!63517 m!280471))

(declare-fun m!280473 () Bool)

(assert (=> b!263815 m!280473))

(assert (=> b!263815 m!279957))

(assert (=> b!263815 m!279957))

(declare-fun m!280475 () Bool)

(assert (=> b!263815 m!280475))

(assert (=> b!263817 m!279957))

(assert (=> b!263817 m!279957))

(assert (=> b!263817 m!280475))

(assert (=> d!63341 d!63517))

(declare-fun b!263821 () Bool)

(declare-fun e!170938 () Option!327)

(assert (=> b!263821 (= e!170938 None!325)))

(declare-fun b!263819 () Bool)

(declare-fun e!170937 () Option!327)

(assert (=> b!263819 (= e!170937 e!170938)))

(declare-fun c!45050 () Bool)

(assert (=> b!263819 (= c!45050 (and ((_ is Cons!3759) lt!133474) (not (= (_1!2454 (h!4425 lt!133474)) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263820 () Bool)

(assert (=> b!263820 (= e!170938 (getValueByKey!321 (t!8832 lt!133474) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun d!63519 () Bool)

(declare-fun c!45049 () Bool)

(assert (=> d!63519 (= c!45049 (and ((_ is Cons!3759) lt!133474) (= (_1!2454 (h!4425 lt!133474)) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63519 (= (getValueByKey!321 lt!133474 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) e!170937)))

(declare-fun b!263818 () Bool)

(assert (=> b!263818 (= e!170937 (Some!326 (_2!2454 (h!4425 lt!133474))))))

(assert (= (and d!63519 c!45049) b!263818))

(assert (= (and d!63519 (not c!45049)) b!263819))

(assert (= (and b!263819 c!45050) b!263820))

(assert (= (and b!263819 (not c!45050)) b!263821))

(declare-fun m!280477 () Bool)

(assert (=> b!263820 m!280477))

(assert (=> d!63341 d!63519))

(declare-fun d!63521 () Bool)

(assert (=> d!63521 (= (getValueByKey!321 lt!133474 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133623 () Unit!8164)

(assert (=> d!63521 (= lt!133623 (choose!1302 lt!133474 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun e!170939 () Bool)

(assert (=> d!63521 e!170939))

(declare-fun res!128827 () Bool)

(assert (=> d!63521 (=> (not res!128827) (not e!170939))))

(assert (=> d!63521 (= res!128827 (isStrictlySorted!364 lt!133474))))

(assert (=> d!63521 (= (lemmaContainsTupThenGetReturnValue!177 lt!133474 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133623)))

(declare-fun b!263822 () Bool)

(declare-fun res!128828 () Bool)

(assert (=> b!263822 (=> (not res!128828) (not e!170939))))

(assert (=> b!263822 (= res!128828 (containsKey!312 lt!133474 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!263823 () Bool)

(assert (=> b!263823 (= e!170939 (contains!1888 lt!133474 (tuple2!4887 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63521 res!128827) b!263822))

(assert (= (and b!263822 res!128828) b!263823))

(assert (=> d!63521 m!279951))

(declare-fun m!280479 () Bool)

(assert (=> d!63521 m!280479))

(declare-fun m!280481 () Bool)

(assert (=> d!63521 m!280481))

(declare-fun m!280483 () Bool)

(assert (=> b!263822 m!280483))

(declare-fun m!280485 () Bool)

(assert (=> b!263823 m!280485))

(assert (=> d!63341 d!63521))

(declare-fun b!263824 () Bool)

(declare-fun e!170942 () List!3763)

(declare-fun call!25243 () List!3763)

(assert (=> b!263824 (= e!170942 call!25243)))

(declare-fun b!263825 () Bool)

(declare-fun e!170944 () List!3763)

(declare-fun call!25241 () List!3763)

(assert (=> b!263825 (= e!170944 call!25241)))

(declare-fun b!263826 () Bool)

(assert (=> b!263826 (= e!170942 call!25243)))

(declare-fun bm!25238 () Bool)

(declare-fun c!45052 () Bool)

(declare-fun call!25242 () List!3763)

(declare-fun e!170940 () List!3763)

(assert (=> bm!25238 (= call!25242 ($colon$colon!107 e!170940 (ite c!45052 (h!4425 (toList!1916 call!25169)) (tuple2!4887 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45054 () Bool)

(assert (=> bm!25238 (= c!45054 c!45052)))

(declare-fun c!45053 () Bool)

(declare-fun b!263827 () Bool)

(declare-fun c!45051 () Bool)

(assert (=> b!263827 (= e!170940 (ite c!45053 (t!8832 (toList!1916 call!25169)) (ite c!45051 (Cons!3759 (h!4425 (toList!1916 call!25169)) (t!8832 (toList!1916 call!25169))) Nil!3760)))))

(declare-fun b!263828 () Bool)

(assert (=> b!263828 (= e!170940 (insertStrictlySorted!180 (t!8832 (toList!1916 call!25169)) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun bm!25239 () Bool)

(assert (=> bm!25239 (= call!25243 call!25241)))

(declare-fun d!63523 () Bool)

(declare-fun e!170943 () Bool)

(assert (=> d!63523 e!170943))

(declare-fun res!128829 () Bool)

(assert (=> d!63523 (=> (not res!128829) (not e!170943))))

(declare-fun lt!133624 () List!3763)

(assert (=> d!63523 (= res!128829 (isStrictlySorted!364 lt!133624))))

(declare-fun e!170941 () List!3763)

(assert (=> d!63523 (= lt!133624 e!170941)))

(assert (=> d!63523 (= c!45052 (and ((_ is Cons!3759) (toList!1916 call!25169)) (bvslt (_1!2454 (h!4425 (toList!1916 call!25169))) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63523 (isStrictlySorted!364 (toList!1916 call!25169))))

(assert (=> d!63523 (= (insertStrictlySorted!180 (toList!1916 call!25169) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133624)))

(declare-fun b!263829 () Bool)

(assert (=> b!263829 (= e!170941 call!25242)))

(declare-fun bm!25240 () Bool)

(assert (=> bm!25240 (= call!25241 call!25242)))

(declare-fun b!263830 () Bool)

(assert (=> b!263830 (= e!170941 e!170944)))

(assert (=> b!263830 (= c!45053 (and ((_ is Cons!3759) (toList!1916 call!25169)) (= (_1!2454 (h!4425 (toList!1916 call!25169))) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!263831 () Bool)

(assert (=> b!263831 (= e!170943 (contains!1888 lt!133624 (tuple2!4887 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!263832 () Bool)

(assert (=> b!263832 (= c!45051 (and ((_ is Cons!3759) (toList!1916 call!25169)) (bvsgt (_1!2454 (h!4425 (toList!1916 call!25169))) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> b!263832 (= e!170944 e!170942)))

(declare-fun b!263833 () Bool)

(declare-fun res!128830 () Bool)

(assert (=> b!263833 (=> (not res!128830) (not e!170943))))

(assert (=> b!263833 (= res!128830 (containsKey!312 lt!133624 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63523 c!45052) b!263829))

(assert (= (and d!63523 (not c!45052)) b!263830))

(assert (= (and b!263830 c!45053) b!263825))

(assert (= (and b!263830 (not c!45053)) b!263832))

(assert (= (and b!263832 c!45051) b!263824))

(assert (= (and b!263832 (not c!45051)) b!263826))

(assert (= (or b!263824 b!263826) bm!25239))

(assert (= (or b!263825 bm!25239) bm!25240))

(assert (= (or b!263829 bm!25240) bm!25238))

(assert (= (and bm!25238 c!45054) b!263828))

(assert (= (and bm!25238 (not c!45054)) b!263827))

(assert (= (and d!63523 res!128829) b!263833))

(assert (= (and b!263833 res!128830) b!263831))

(declare-fun m!280487 () Bool)

(assert (=> b!263833 m!280487))

(declare-fun m!280489 () Bool)

(assert (=> b!263831 m!280489))

(declare-fun m!280491 () Bool)

(assert (=> b!263828 m!280491))

(declare-fun m!280493 () Bool)

(assert (=> bm!25238 m!280493))

(declare-fun m!280495 () Bool)

(assert (=> d!63523 m!280495))

(declare-fun m!280497 () Bool)

(assert (=> d!63523 m!280497))

(assert (=> d!63341 d!63523))

(declare-fun b!263837 () Bool)

(declare-fun e!170946 () Option!327)

(assert (=> b!263837 (= e!170946 None!325)))

(declare-fun b!263835 () Bool)

(declare-fun e!170945 () Option!327)

(assert (=> b!263835 (= e!170945 e!170946)))

(declare-fun c!45056 () Bool)

(assert (=> b!263835 (= c!45056 (and ((_ is Cons!3759) (t!8832 lt!133266)) (not (= (_1!2454 (h!4425 (t!8832 lt!133266))) (_1!2454 lt!133017)))))))

(declare-fun b!263836 () Bool)

(assert (=> b!263836 (= e!170946 (getValueByKey!321 (t!8832 (t!8832 lt!133266)) (_1!2454 lt!133017)))))

(declare-fun d!63525 () Bool)

(declare-fun c!45055 () Bool)

(assert (=> d!63525 (= c!45055 (and ((_ is Cons!3759) (t!8832 lt!133266)) (= (_1!2454 (h!4425 (t!8832 lt!133266))) (_1!2454 lt!133017))))))

(assert (=> d!63525 (= (getValueByKey!321 (t!8832 lt!133266) (_1!2454 lt!133017)) e!170945)))

(declare-fun b!263834 () Bool)

(assert (=> b!263834 (= e!170945 (Some!326 (_2!2454 (h!4425 (t!8832 lt!133266)))))))

(assert (= (and d!63525 c!45055) b!263834))

(assert (= (and d!63525 (not c!45055)) b!263835))

(assert (= (and b!263835 c!45056) b!263836))

(assert (= (and b!263835 (not c!45056)) b!263837))

(declare-fun m!280499 () Bool)

(assert (=> b!263836 m!280499))

(assert (=> b!263602 d!63525))

(declare-fun d!63527 () Bool)

(declare-fun e!170947 () Bool)

(assert (=> d!63527 e!170947))

(declare-fun res!128831 () Bool)

(assert (=> d!63527 (=> res!128831 e!170947)))

(declare-fun lt!133626 () Bool)

(assert (=> d!63527 (= res!128831 (not lt!133626))))

(declare-fun lt!133628 () Bool)

(assert (=> d!63527 (= lt!133626 lt!133628)))

(declare-fun lt!133627 () Unit!8164)

(declare-fun e!170948 () Unit!8164)

(assert (=> d!63527 (= lt!133627 e!170948)))

(declare-fun c!45057 () Bool)

(assert (=> d!63527 (= c!45057 lt!133628)))

(assert (=> d!63527 (= lt!133628 (containsKey!312 (toList!1916 lt!133559) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63527 (= (contains!1885 lt!133559 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133626)))

(declare-fun b!263838 () Bool)

(declare-fun lt!133625 () Unit!8164)

(assert (=> b!263838 (= e!170948 lt!133625)))

(assert (=> b!263838 (= lt!133625 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133559) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263838 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133559) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263839 () Bool)

(declare-fun Unit!8196 () Unit!8164)

(assert (=> b!263839 (= e!170948 Unit!8196)))

(declare-fun b!263840 () Bool)

(assert (=> b!263840 (= e!170947 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133559) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63527 c!45057) b!263838))

(assert (= (and d!63527 (not c!45057)) b!263839))

(assert (= (and d!63527 (not res!128831)) b!263840))

(declare-fun m!280501 () Bool)

(assert (=> d!63527 m!280501))

(declare-fun m!280503 () Bool)

(assert (=> b!263838 m!280503))

(declare-fun m!280505 () Bool)

(assert (=> b!263838 m!280505))

(assert (=> b!263838 m!280505))

(declare-fun m!280507 () Bool)

(assert (=> b!263838 m!280507))

(assert (=> b!263840 m!280505))

(assert (=> b!263840 m!280505))

(assert (=> b!263840 m!280507))

(assert (=> bm!25230 d!63527))

(declare-fun b!263841 () Bool)

(declare-fun e!170951 () List!3763)

(declare-fun call!25246 () List!3763)

(assert (=> b!263841 (= e!170951 call!25246)))

(declare-fun b!263842 () Bool)

(declare-fun e!170953 () List!3763)

(declare-fun call!25244 () List!3763)

(assert (=> b!263842 (= e!170953 call!25244)))

(declare-fun b!263843 () Bool)

(assert (=> b!263843 (= e!170951 call!25246)))

(declare-fun call!25245 () List!3763)

(declare-fun e!170949 () List!3763)

(declare-fun c!45059 () Bool)

(declare-fun bm!25241 () Bool)

(assert (=> bm!25241 (= call!25245 ($colon$colon!107 e!170949 (ite c!45059 (h!4425 (t!8832 (toList!1916 lt!133013))) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017)))))))

(declare-fun c!45061 () Bool)

(assert (=> bm!25241 (= c!45061 c!45059)))

(declare-fun c!45058 () Bool)

(declare-fun b!263844 () Bool)

(declare-fun c!45060 () Bool)

(assert (=> b!263844 (= e!170949 (ite c!45060 (t!8832 (t!8832 (toList!1916 lt!133013))) (ite c!45058 (Cons!3759 (h!4425 (t!8832 (toList!1916 lt!133013))) (t!8832 (t!8832 (toList!1916 lt!133013)))) Nil!3760)))))

(declare-fun b!263845 () Bool)

(assert (=> b!263845 (= e!170949 (insertStrictlySorted!180 (t!8832 (t!8832 (toList!1916 lt!133013))) (_1!2454 lt!133017) (_2!2454 lt!133017)))))

(declare-fun bm!25242 () Bool)

(assert (=> bm!25242 (= call!25246 call!25244)))

(declare-fun d!63529 () Bool)

(declare-fun e!170952 () Bool)

(assert (=> d!63529 e!170952))

(declare-fun res!128832 () Bool)

(assert (=> d!63529 (=> (not res!128832) (not e!170952))))

(declare-fun lt!133629 () List!3763)

(assert (=> d!63529 (= res!128832 (isStrictlySorted!364 lt!133629))))

(declare-fun e!170950 () List!3763)

(assert (=> d!63529 (= lt!133629 e!170950)))

(assert (=> d!63529 (= c!45059 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133013))) (bvslt (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133013)))) (_1!2454 lt!133017))))))

(assert (=> d!63529 (isStrictlySorted!364 (t!8832 (toList!1916 lt!133013)))))

(assert (=> d!63529 (= (insertStrictlySorted!180 (t!8832 (toList!1916 lt!133013)) (_1!2454 lt!133017) (_2!2454 lt!133017)) lt!133629)))

(declare-fun b!263846 () Bool)

(assert (=> b!263846 (= e!170950 call!25245)))

(declare-fun bm!25243 () Bool)

(assert (=> bm!25243 (= call!25244 call!25245)))

(declare-fun b!263847 () Bool)

(assert (=> b!263847 (= e!170950 e!170953)))

(assert (=> b!263847 (= c!45060 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133013))) (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133013)))) (_1!2454 lt!133017))))))

(declare-fun b!263848 () Bool)

(assert (=> b!263848 (= e!170952 (contains!1888 lt!133629 (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun b!263849 () Bool)

(assert (=> b!263849 (= c!45058 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133013))) (bvsgt (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133013)))) (_1!2454 lt!133017))))))

(assert (=> b!263849 (= e!170953 e!170951)))

(declare-fun b!263850 () Bool)

(declare-fun res!128833 () Bool)

(assert (=> b!263850 (=> (not res!128833) (not e!170952))))

(assert (=> b!263850 (= res!128833 (containsKey!312 lt!133629 (_1!2454 lt!133017)))))

(assert (= (and d!63529 c!45059) b!263846))

(assert (= (and d!63529 (not c!45059)) b!263847))

(assert (= (and b!263847 c!45060) b!263842))

(assert (= (and b!263847 (not c!45060)) b!263849))

(assert (= (and b!263849 c!45058) b!263841))

(assert (= (and b!263849 (not c!45058)) b!263843))

(assert (= (or b!263841 b!263843) bm!25242))

(assert (= (or b!263842 bm!25242) bm!25243))

(assert (= (or b!263846 bm!25243) bm!25241))

(assert (= (and bm!25241 c!45061) b!263845))

(assert (= (and bm!25241 (not c!45061)) b!263844))

(assert (= (and d!63529 res!128832) b!263850))

(assert (= (and b!263850 res!128833) b!263848))

(declare-fun m!280509 () Bool)

(assert (=> b!263850 m!280509))

(declare-fun m!280511 () Bool)

(assert (=> b!263848 m!280511))

(declare-fun m!280513 () Bool)

(assert (=> b!263845 m!280513))

(declare-fun m!280515 () Bool)

(assert (=> bm!25241 m!280515))

(declare-fun m!280517 () Bool)

(assert (=> d!63529 m!280517))

(declare-fun m!280519 () Bool)

(assert (=> d!63529 m!280519))

(assert (=> b!263610 d!63529))

(declare-fun b!263854 () Bool)

(declare-fun e!170955 () Option!327)

(assert (=> b!263854 (= e!170955 None!325)))

(declare-fun b!263852 () Bool)

(declare-fun e!170954 () Option!327)

(assert (=> b!263852 (= e!170954 e!170955)))

(declare-fun c!45063 () Bool)

(assert (=> b!263852 (= c!45063 (and ((_ is Cons!3759) (toList!1916 lt!133473)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133473))) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263853 () Bool)

(assert (=> b!263853 (= e!170955 (getValueByKey!321 (t!8832 (toList!1916 lt!133473)) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun d!63531 () Bool)

(declare-fun c!45062 () Bool)

(assert (=> d!63531 (= c!45062 (and ((_ is Cons!3759) (toList!1916 lt!133473)) (= (_1!2454 (h!4425 (toList!1916 lt!133473))) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63531 (= (getValueByKey!321 (toList!1916 lt!133473) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) e!170954)))

(declare-fun b!263851 () Bool)

(assert (=> b!263851 (= e!170954 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133473)))))))

(assert (= (and d!63531 c!45062) b!263851))

(assert (= (and d!63531 (not c!45062)) b!263852))

(assert (= (and b!263852 c!45063) b!263853))

(assert (= (and b!263852 (not c!45063)) b!263854))

(declare-fun m!280521 () Bool)

(assert (=> b!263853 m!280521))

(assert (=> b!263560 d!63531))

(assert (=> d!63435 d!63165))

(assert (=> b!263737 d!63285))

(declare-fun d!63533 () Bool)

(declare-fun e!170956 () Bool)

(assert (=> d!63533 e!170956))

(declare-fun res!128834 () Bool)

(assert (=> d!63533 (=> res!128834 e!170956)))

(declare-fun lt!133631 () Bool)

(assert (=> d!63533 (= res!128834 (not lt!133631))))

(declare-fun lt!133633 () Bool)

(assert (=> d!63533 (= lt!133631 lt!133633)))

(declare-fun lt!133632 () Unit!8164)

(declare-fun e!170957 () Unit!8164)

(assert (=> d!63533 (= lt!133632 e!170957)))

(declare-fun c!45064 () Bool)

(assert (=> d!63533 (= c!45064 lt!133633)))

(assert (=> d!63533 (= lt!133633 (containsKey!312 (toList!1916 lt!133528) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(assert (=> d!63533 (= (contains!1885 lt!133528 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) lt!133631)))

(declare-fun b!263855 () Bool)

(declare-fun lt!133630 () Unit!8164)

(assert (=> b!263855 (= e!170957 lt!133630)))

(assert (=> b!263855 (= lt!133630 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133528) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(assert (=> b!263855 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133528) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(declare-fun b!263856 () Bool)

(declare-fun Unit!8197 () Unit!8164)

(assert (=> b!263856 (= e!170957 Unit!8197)))

(declare-fun b!263857 () Bool)

(assert (=> b!263857 (= e!170956 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133528) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63533 c!45064) b!263855))

(assert (= (and d!63533 (not c!45064)) b!263856))

(assert (= (and d!63533 (not res!128834)) b!263857))

(declare-fun m!280523 () Bool)

(assert (=> d!63533 m!280523))

(declare-fun m!280525 () Bool)

(assert (=> b!263855 m!280525))

(assert (=> b!263855 m!280137))

(assert (=> b!263855 m!280137))

(declare-fun m!280527 () Bool)

(assert (=> b!263855 m!280527))

(assert (=> b!263857 m!280137))

(assert (=> b!263857 m!280137))

(assert (=> b!263857 m!280527))

(assert (=> d!63399 d!63533))

(declare-fun b!263861 () Bool)

(declare-fun e!170959 () Option!327)

(assert (=> b!263861 (= e!170959 None!325)))

(declare-fun b!263859 () Bool)

(declare-fun e!170958 () Option!327)

(assert (=> b!263859 (= e!170958 e!170959)))

(declare-fun c!45066 () Bool)

(assert (=> b!263859 (= c!45066 (and ((_ is Cons!3759) lt!133529) (not (= (_1!2454 (h!4425 lt!133529)) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263860 () Bool)

(assert (=> b!263860 (= e!170959 (getValueByKey!321 (t!8832 lt!133529) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(declare-fun d!63535 () Bool)

(declare-fun c!45065 () Bool)

(assert (=> d!63535 (= c!45065 (and ((_ is Cons!3759) lt!133529) (= (_1!2454 (h!4425 lt!133529)) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))))

(assert (=> d!63535 (= (getValueByKey!321 lt!133529 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) e!170958)))

(declare-fun b!263858 () Bool)

(assert (=> b!263858 (= e!170958 (Some!326 (_2!2454 (h!4425 lt!133529))))))

(assert (= (and d!63535 c!45065) b!263858))

(assert (= (and d!63535 (not c!45065)) b!263859))

(assert (= (and b!263859 c!45066) b!263860))

(assert (= (and b!263859 (not c!45066)) b!263861))

(declare-fun m!280529 () Bool)

(assert (=> b!263860 m!280529))

(assert (=> d!63399 d!63535))

(declare-fun d!63537 () Bool)

(assert (=> d!63537 (= (getValueByKey!321 lt!133529 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133634 () Unit!8164)

(assert (=> d!63537 (= lt!133634 (choose!1302 lt!133529 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(declare-fun e!170960 () Bool)

(assert (=> d!63537 e!170960))

(declare-fun res!128835 () Bool)

(assert (=> d!63537 (=> (not res!128835) (not e!170960))))

(assert (=> d!63537 (= res!128835 (isStrictlySorted!364 lt!133529))))

(assert (=> d!63537 (= (lemmaContainsTupThenGetReturnValue!177 lt!133529 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) lt!133634)))

(declare-fun b!263862 () Bool)

(declare-fun res!128836 () Bool)

(assert (=> b!263862 (=> (not res!128836) (not e!170960))))

(assert (=> b!263862 (= res!128836 (containsKey!312 lt!133529 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(declare-fun b!263863 () Bool)

(assert (=> b!263863 (= e!170960 (contains!1888 lt!133529 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63537 res!128835) b!263862))

(assert (= (and b!263862 res!128836) b!263863))

(assert (=> d!63537 m!280131))

(declare-fun m!280531 () Bool)

(assert (=> d!63537 m!280531))

(declare-fun m!280533 () Bool)

(assert (=> d!63537 m!280533))

(declare-fun m!280535 () Bool)

(assert (=> b!263862 m!280535))

(declare-fun m!280537 () Bool)

(assert (=> b!263863 m!280537))

(assert (=> d!63399 d!63537))

(declare-fun b!263864 () Bool)

(declare-fun e!170963 () List!3763)

(declare-fun call!25249 () List!3763)

(assert (=> b!263864 (= e!170963 call!25249)))

(declare-fun b!263865 () Bool)

(declare-fun e!170965 () List!3763)

(declare-fun call!25247 () List!3763)

(assert (=> b!263865 (= e!170965 call!25247)))

(declare-fun b!263866 () Bool)

(assert (=> b!263866 (= e!170963 call!25249)))

(declare-fun e!170961 () List!3763)

(declare-fun bm!25244 () Bool)

(declare-fun c!45068 () Bool)

(declare-fun call!25248 () List!3763)

(assert (=> bm!25244 (= call!25248 ($colon$colon!107 e!170961 (ite c!45068 (h!4425 (toList!1916 lt!133256)) (tuple2!4887 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45070 () Bool)

(assert (=> bm!25244 (= c!45070 c!45068)))

(declare-fun c!45069 () Bool)

(declare-fun c!45067 () Bool)

(declare-fun b!263867 () Bool)

(assert (=> b!263867 (= e!170961 (ite c!45069 (t!8832 (toList!1916 lt!133256)) (ite c!45067 (Cons!3759 (h!4425 (toList!1916 lt!133256)) (t!8832 (toList!1916 lt!133256))) Nil!3760)))))

(declare-fun b!263868 () Bool)

(assert (=> b!263868 (= e!170961 (insertStrictlySorted!180 (t!8832 (toList!1916 lt!133256)) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(declare-fun bm!25245 () Bool)

(assert (=> bm!25245 (= call!25249 call!25247)))

(declare-fun d!63539 () Bool)

(declare-fun e!170964 () Bool)

(assert (=> d!63539 e!170964))

(declare-fun res!128837 () Bool)

(assert (=> d!63539 (=> (not res!128837) (not e!170964))))

(declare-fun lt!133635 () List!3763)

(assert (=> d!63539 (= res!128837 (isStrictlySorted!364 lt!133635))))

(declare-fun e!170962 () List!3763)

(assert (=> d!63539 (= lt!133635 e!170962)))

(assert (=> d!63539 (= c!45068 (and ((_ is Cons!3759) (toList!1916 lt!133256)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133256))) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))))

(assert (=> d!63539 (isStrictlySorted!364 (toList!1916 lt!133256))))

(assert (=> d!63539 (= (insertStrictlySorted!180 (toList!1916 lt!133256) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) lt!133635)))

(declare-fun b!263869 () Bool)

(assert (=> b!263869 (= e!170962 call!25248)))

(declare-fun bm!25246 () Bool)

(assert (=> bm!25246 (= call!25247 call!25248)))

(declare-fun b!263870 () Bool)

(assert (=> b!263870 (= e!170962 e!170965)))

(assert (=> b!263870 (= c!45069 (and ((_ is Cons!3759) (toList!1916 lt!133256)) (= (_1!2454 (h!4425 (toList!1916 lt!133256))) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))))

(declare-fun b!263871 () Bool)

(assert (=> b!263871 (= e!170964 (contains!1888 lt!133635 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))))

(declare-fun b!263872 () Bool)

(assert (=> b!263872 (= c!45067 (and ((_ is Cons!3759) (toList!1916 lt!133256)) (bvsgt (_1!2454 (h!4425 (toList!1916 lt!133256))) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))))

(assert (=> b!263872 (= e!170965 e!170963)))

(declare-fun b!263873 () Bool)

(declare-fun res!128838 () Bool)

(assert (=> b!263873 (=> (not res!128838) (not e!170964))))

(assert (=> b!263873 (= res!128838 (containsKey!312 lt!133635 (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63539 c!45068) b!263869))

(assert (= (and d!63539 (not c!45068)) b!263870))

(assert (= (and b!263870 c!45069) b!263865))

(assert (= (and b!263870 (not c!45069)) b!263872))

(assert (= (and b!263872 c!45067) b!263864))

(assert (= (and b!263872 (not c!45067)) b!263866))

(assert (= (or b!263864 b!263866) bm!25245))

(assert (= (or b!263865 bm!25245) bm!25246))

(assert (= (or b!263869 bm!25246) bm!25244))

(assert (= (and bm!25244 c!45070) b!263868))

(assert (= (and bm!25244 (not c!45070)) b!263867))

(assert (= (and d!63539 res!128837) b!263873))

(assert (= (and b!263873 res!128838) b!263871))

(declare-fun m!280539 () Bool)

(assert (=> b!263873 m!280539))

(declare-fun m!280541 () Bool)

(assert (=> b!263871 m!280541))

(declare-fun m!280543 () Bool)

(assert (=> b!263868 m!280543))

(declare-fun m!280545 () Bool)

(assert (=> bm!25244 m!280545))

(declare-fun m!280547 () Bool)

(assert (=> d!63539 m!280547))

(declare-fun m!280549 () Bool)

(assert (=> d!63539 m!280549))

(assert (=> d!63399 d!63539))

(declare-fun d!63541 () Bool)

(declare-fun lt!133636 () Bool)

(assert (=> d!63541 (= lt!133636 (select (content!178 (t!8832 (toList!1916 lt!133265))) lt!133017))))

(declare-fun e!170967 () Bool)

(assert (=> d!63541 (= lt!133636 e!170967)))

(declare-fun res!128840 () Bool)

(assert (=> d!63541 (=> (not res!128840) (not e!170967))))

(assert (=> d!63541 (= res!128840 ((_ is Cons!3759) (t!8832 (toList!1916 lt!133265))))))

(assert (=> d!63541 (= (contains!1888 (t!8832 (toList!1916 lt!133265)) lt!133017) lt!133636)))

(declare-fun b!263874 () Bool)

(declare-fun e!170966 () Bool)

(assert (=> b!263874 (= e!170967 e!170966)))

(declare-fun res!128839 () Bool)

(assert (=> b!263874 (=> res!128839 e!170966)))

(assert (=> b!263874 (= res!128839 (= (h!4425 (t!8832 (toList!1916 lt!133265))) lt!133017))))

(declare-fun b!263875 () Bool)

(assert (=> b!263875 (= e!170966 (contains!1888 (t!8832 (t!8832 (toList!1916 lt!133265))) lt!133017))))

(assert (= (and d!63541 res!128840) b!263874))

(assert (= (and b!263874 (not res!128839)) b!263875))

(declare-fun m!280551 () Bool)

(assert (=> d!63541 m!280551))

(declare-fun m!280553 () Bool)

(assert (=> d!63541 m!280553))

(declare-fun m!280555 () Bool)

(assert (=> b!263875 m!280555))

(assert (=> b!263581 d!63541))

(declare-fun d!63543 () Bool)

(declare-fun e!170968 () Bool)

(assert (=> d!63543 e!170968))

(declare-fun res!128841 () Bool)

(assert (=> d!63543 (=> res!128841 e!170968)))

(declare-fun lt!133638 () Bool)

(assert (=> d!63543 (= res!128841 (not lt!133638))))

(declare-fun lt!133640 () Bool)

(assert (=> d!63543 (= lt!133638 lt!133640)))

(declare-fun lt!133639 () Unit!8164)

(declare-fun e!170969 () Unit!8164)

(assert (=> d!63543 (= lt!133639 e!170969)))

(declare-fun c!45071 () Bool)

(assert (=> d!63543 (= c!45071 lt!133640)))

(assert (=> d!63543 (= lt!133640 (containsKey!312 (toList!1916 lt!133410) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63543 (= (contains!1885 lt!133410 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133638)))

(declare-fun b!263876 () Bool)

(declare-fun lt!133637 () Unit!8164)

(assert (=> b!263876 (= e!170969 lt!133637)))

(assert (=> b!263876 (= lt!133637 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133410) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(assert (=> b!263876 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133410) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!263877 () Bool)

(declare-fun Unit!8198 () Unit!8164)

(assert (=> b!263877 (= e!170969 Unit!8198)))

(declare-fun b!263878 () Bool)

(assert (=> b!263878 (= e!170968 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133410) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63543 c!45071) b!263876))

(assert (= (and d!63543 (not c!45071)) b!263877))

(assert (= (and d!63543 (not res!128841)) b!263878))

(declare-fun m!280557 () Bool)

(assert (=> d!63543 m!280557))

(declare-fun m!280559 () Bool)

(assert (=> b!263876 m!280559))

(assert (=> b!263876 m!279765))

(assert (=> b!263876 m!279765))

(declare-fun m!280561 () Bool)

(assert (=> b!263876 m!280561))

(assert (=> b!263878 m!279765))

(assert (=> b!263878 m!279765))

(assert (=> b!263878 m!280561))

(assert (=> d!63277 d!63543))

(declare-fun b!263882 () Bool)

(declare-fun e!170971 () Option!327)

(assert (=> b!263882 (= e!170971 None!325)))

(declare-fun b!263880 () Bool)

(declare-fun e!170970 () Option!327)

(assert (=> b!263880 (= e!170970 e!170971)))

(declare-fun c!45073 () Bool)

(assert (=> b!263880 (= c!45073 (and ((_ is Cons!3759) lt!133411) (not (= (_1!2454 (h!4425 lt!133411)) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!263881 () Bool)

(assert (=> b!263881 (= e!170971 (getValueByKey!321 (t!8832 lt!133411) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(declare-fun c!45072 () Bool)

(declare-fun d!63545 () Bool)

(assert (=> d!63545 (= c!45072 (and ((_ is Cons!3759) lt!133411) (= (_1!2454 (h!4425 lt!133411)) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63545 (= (getValueByKey!321 lt!133411 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) e!170970)))

(declare-fun b!263879 () Bool)

(assert (=> b!263879 (= e!170970 (Some!326 (_2!2454 (h!4425 lt!133411))))))

(assert (= (and d!63545 c!45072) b!263879))

(assert (= (and d!63545 (not c!45072)) b!263880))

(assert (= (and b!263880 c!45073) b!263881))

(assert (= (and b!263880 (not c!45073)) b!263882))

(declare-fun m!280563 () Bool)

(assert (=> b!263881 m!280563))

(assert (=> d!63277 d!63545))

(declare-fun d!63547 () Bool)

(assert (=> d!63547 (= (getValueByKey!321 lt!133411 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133641 () Unit!8164)

(assert (=> d!63547 (= lt!133641 (choose!1302 lt!133411 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(declare-fun e!170972 () Bool)

(assert (=> d!63547 e!170972))

(declare-fun res!128842 () Bool)

(assert (=> d!63547 (=> (not res!128842) (not e!170972))))

(assert (=> d!63547 (= res!128842 (isStrictlySorted!364 lt!133411))))

(assert (=> d!63547 (= (lemmaContainsTupThenGetReturnValue!177 lt!133411 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133641)))

(declare-fun b!263883 () Bool)

(declare-fun res!128843 () Bool)

(assert (=> b!263883 (=> (not res!128843) (not e!170972))))

(assert (=> b!263883 (= res!128843 (containsKey!312 lt!133411 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!263884 () Bool)

(assert (=> b!263884 (= e!170972 (contains!1888 lt!133411 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63547 res!128842) b!263883))

(assert (= (and b!263883 res!128843) b!263884))

(assert (=> d!63547 m!279759))

(declare-fun m!280565 () Bool)

(assert (=> d!63547 m!280565))

(declare-fun m!280567 () Bool)

(assert (=> d!63547 m!280567))

(declare-fun m!280569 () Bool)

(assert (=> b!263883 m!280569))

(declare-fun m!280571 () Bool)

(assert (=> b!263884 m!280571))

(assert (=> d!63277 d!63547))

(declare-fun b!263885 () Bool)

(declare-fun e!170975 () List!3763)

(declare-fun call!25252 () List!3763)

(assert (=> b!263885 (= e!170975 call!25252)))

(declare-fun b!263886 () Bool)

(declare-fun e!170977 () List!3763)

(declare-fun call!25250 () List!3763)

(assert (=> b!263886 (= e!170977 call!25250)))

(declare-fun b!263887 () Bool)

(assert (=> b!263887 (= e!170975 call!25252)))

(declare-fun e!170973 () List!3763)

(declare-fun call!25251 () List!3763)

(declare-fun bm!25247 () Bool)

(declare-fun c!45075 () Bool)

(assert (=> bm!25247 (= call!25251 ($colon$colon!107 e!170973 (ite c!45075 (h!4425 (toList!1916 lt!133309)) (tuple2!4887 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))))

(declare-fun c!45077 () Bool)

(assert (=> bm!25247 (= c!45077 c!45075)))

(declare-fun b!263888 () Bool)

(declare-fun c!45074 () Bool)

(declare-fun c!45076 () Bool)

(assert (=> b!263888 (= e!170973 (ite c!45076 (t!8832 (toList!1916 lt!133309)) (ite c!45074 (Cons!3759 (h!4425 (toList!1916 lt!133309)) (t!8832 (toList!1916 lt!133309))) Nil!3760)))))

(declare-fun b!263889 () Bool)

(assert (=> b!263889 (= e!170973 (insertStrictlySorted!180 (t!8832 (toList!1916 lt!133309)) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(declare-fun bm!25248 () Bool)

(assert (=> bm!25248 (= call!25252 call!25250)))

(declare-fun d!63549 () Bool)

(declare-fun e!170976 () Bool)

(assert (=> d!63549 e!170976))

(declare-fun res!128844 () Bool)

(assert (=> d!63549 (=> (not res!128844) (not e!170976))))

(declare-fun lt!133642 () List!3763)

(assert (=> d!63549 (= res!128844 (isStrictlySorted!364 lt!133642))))

(declare-fun e!170974 () List!3763)

(assert (=> d!63549 (= lt!133642 e!170974)))

(assert (=> d!63549 (= c!45075 (and ((_ is Cons!3759) (toList!1916 lt!133309)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133309))) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63549 (isStrictlySorted!364 (toList!1916 lt!133309))))

(assert (=> d!63549 (= (insertStrictlySorted!180 (toList!1916 lt!133309) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133642)))

(declare-fun b!263890 () Bool)

(assert (=> b!263890 (= e!170974 call!25251)))

(declare-fun bm!25249 () Bool)

(assert (=> bm!25249 (= call!25250 call!25251)))

(declare-fun b!263891 () Bool)

(assert (=> b!263891 (= e!170974 e!170977)))

(assert (=> b!263891 (= c!45076 (and ((_ is Cons!3759) (toList!1916 lt!133309)) (= (_1!2454 (h!4425 (toList!1916 lt!133309))) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263892 () Bool)

(assert (=> b!263892 (= e!170976 (contains!1888 lt!133642 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263893 () Bool)

(assert (=> b!263893 (= c!45074 (and ((_ is Cons!3759) (toList!1916 lt!133309)) (bvsgt (_1!2454 (h!4425 (toList!1916 lt!133309))) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))

(assert (=> b!263893 (= e!170977 e!170975)))

(declare-fun b!263894 () Bool)

(declare-fun res!128845 () Bool)

(assert (=> b!263894 (=> (not res!128845) (not e!170976))))

(assert (=> b!263894 (= res!128845 (containsKey!312 lt!133642 (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63549 c!45075) b!263890))

(assert (= (and d!63549 (not c!45075)) b!263891))

(assert (= (and b!263891 c!45076) b!263886))

(assert (= (and b!263891 (not c!45076)) b!263893))

(assert (= (and b!263893 c!45074) b!263885))

(assert (= (and b!263893 (not c!45074)) b!263887))

(assert (= (or b!263885 b!263887) bm!25248))

(assert (= (or b!263886 bm!25248) bm!25249))

(assert (= (or b!263890 bm!25249) bm!25247))

(assert (= (and bm!25247 c!45077) b!263889))

(assert (= (and bm!25247 (not c!45077)) b!263888))

(assert (= (and d!63549 res!128844) b!263894))

(assert (= (and b!263894 res!128845) b!263892))

(declare-fun m!280573 () Bool)

(assert (=> b!263894 m!280573))

(declare-fun m!280575 () Bool)

(assert (=> b!263892 m!280575))

(declare-fun m!280577 () Bool)

(assert (=> b!263889 m!280577))

(declare-fun m!280579 () Bool)

(assert (=> bm!25247 m!280579))

(declare-fun m!280581 () Bool)

(assert (=> d!63549 m!280581))

(declare-fun m!280583 () Bool)

(assert (=> d!63549 m!280583))

(assert (=> d!63277 d!63549))

(declare-fun d!63551 () Bool)

(declare-fun e!170978 () Bool)

(assert (=> d!63551 e!170978))

(declare-fun res!128846 () Bool)

(assert (=> d!63551 (=> res!128846 e!170978)))

(declare-fun lt!133644 () Bool)

(assert (=> d!63551 (= res!128846 (not lt!133644))))

(declare-fun lt!133646 () Bool)

(assert (=> d!63551 (= lt!133644 lt!133646)))

(declare-fun lt!133645 () Unit!8164)

(declare-fun e!170979 () Unit!8164)

(assert (=> d!63551 (= lt!133645 e!170979)))

(declare-fun c!45078 () Bool)

(assert (=> d!63551 (= c!45078 lt!133646)))

(assert (=> d!63551 (= lt!133646 (containsKey!312 (toList!1916 lt!133507) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63551 (= (contains!1885 lt!133507 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) lt!133644)))

(declare-fun b!263895 () Bool)

(declare-fun lt!133643 () Unit!8164)

(assert (=> b!263895 (= e!170979 lt!133643)))

(assert (=> b!263895 (= lt!133643 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133507) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(assert (=> b!263895 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133507) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!263896 () Bool)

(declare-fun Unit!8199 () Unit!8164)

(assert (=> b!263896 (= e!170979 Unit!8199)))

(declare-fun b!263897 () Bool)

(assert (=> b!263897 (= e!170978 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133507) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63551 c!45078) b!263895))

(assert (= (and d!63551 (not c!45078)) b!263896))

(assert (= (and d!63551 (not res!128846)) b!263897))

(declare-fun m!280585 () Bool)

(assert (=> d!63551 m!280585))

(declare-fun m!280587 () Bool)

(assert (=> b!263895 m!280587))

(assert (=> b!263895 m!280053))

(assert (=> b!263895 m!280053))

(declare-fun m!280589 () Bool)

(assert (=> b!263895 m!280589))

(assert (=> b!263897 m!280053))

(assert (=> b!263897 m!280053))

(assert (=> b!263897 m!280589))

(assert (=> d!63375 d!63551))

(declare-fun b!263901 () Bool)

(declare-fun e!170981 () Option!327)

(assert (=> b!263901 (= e!170981 None!325)))

(declare-fun b!263899 () Bool)

(declare-fun e!170980 () Option!327)

(assert (=> b!263899 (= e!170980 e!170981)))

(declare-fun c!45080 () Bool)

(assert (=> b!263899 (= c!45080 (and ((_ is Cons!3759) lt!133508) (not (= (_1!2454 (h!4425 lt!133508)) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!263900 () Bool)

(assert (=> b!263900 (= e!170981 (getValueByKey!321 (t!8832 lt!133508) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(declare-fun c!45079 () Bool)

(declare-fun d!63553 () Bool)

(assert (=> d!63553 (= c!45079 (and ((_ is Cons!3759) lt!133508) (= (_1!2454 (h!4425 lt!133508)) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63553 (= (getValueByKey!321 lt!133508 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) e!170980)))

(declare-fun b!263898 () Bool)

(assert (=> b!263898 (= e!170980 (Some!326 (_2!2454 (h!4425 lt!133508))))))

(assert (= (and d!63553 c!45079) b!263898))

(assert (= (and d!63553 (not c!45079)) b!263899))

(assert (= (and b!263899 c!45080) b!263900))

(assert (= (and b!263899 (not c!45080)) b!263901))

(declare-fun m!280591 () Bool)

(assert (=> b!263900 m!280591))

(assert (=> d!63375 d!63553))

(declare-fun d!63555 () Bool)

(assert (=> d!63555 (= (getValueByKey!321 lt!133508 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133647 () Unit!8164)

(assert (=> d!63555 (= lt!133647 (choose!1302 lt!133508 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(declare-fun e!170982 () Bool)

(assert (=> d!63555 e!170982))

(declare-fun res!128847 () Bool)

(assert (=> d!63555 (=> (not res!128847) (not e!170982))))

(assert (=> d!63555 (= res!128847 (isStrictlySorted!364 lt!133508))))

(assert (=> d!63555 (= (lemmaContainsTupThenGetReturnValue!177 lt!133508 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) lt!133647)))

(declare-fun b!263902 () Bool)

(declare-fun res!128848 () Bool)

(assert (=> b!263902 (=> (not res!128848) (not e!170982))))

(assert (=> b!263902 (= res!128848 (containsKey!312 lt!133508 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!263903 () Bool)

(assert (=> b!263903 (= e!170982 (contains!1888 lt!133508 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63555 res!128847) b!263902))

(assert (= (and b!263902 res!128848) b!263903))

(assert (=> d!63555 m!280047))

(declare-fun m!280593 () Bool)

(assert (=> d!63555 m!280593))

(declare-fun m!280595 () Bool)

(assert (=> d!63555 m!280595))

(declare-fun m!280597 () Bool)

(assert (=> b!263902 m!280597))

(declare-fun m!280599 () Bool)

(assert (=> b!263903 m!280599))

(assert (=> d!63375 d!63555))

(declare-fun b!263904 () Bool)

(declare-fun e!170985 () List!3763)

(declare-fun call!25255 () List!3763)

(assert (=> b!263904 (= e!170985 call!25255)))

(declare-fun b!263905 () Bool)

(declare-fun e!170987 () List!3763)

(declare-fun call!25253 () List!3763)

(assert (=> b!263905 (= e!170987 call!25253)))

(declare-fun b!263906 () Bool)

(assert (=> b!263906 (= e!170985 call!25255)))

(declare-fun e!170983 () List!3763)

(declare-fun bm!25250 () Bool)

(declare-fun call!25254 () List!3763)

(declare-fun c!45082 () Bool)

(assert (=> bm!25250 (= call!25254 ($colon$colon!107 e!170983 (ite c!45082 (h!4425 (toList!1916 lt!133257)) (tuple2!4887 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))))

(declare-fun c!45084 () Bool)

(assert (=> bm!25250 (= c!45084 c!45082)))

(declare-fun c!45083 () Bool)

(declare-fun b!263907 () Bool)

(declare-fun c!45081 () Bool)

(assert (=> b!263907 (= e!170983 (ite c!45083 (t!8832 (toList!1916 lt!133257)) (ite c!45081 (Cons!3759 (h!4425 (toList!1916 lt!133257)) (t!8832 (toList!1916 lt!133257))) Nil!3760)))))

(declare-fun b!263908 () Bool)

(assert (=> b!263908 (= e!170983 (insertStrictlySorted!180 (t!8832 (toList!1916 lt!133257)) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(declare-fun bm!25251 () Bool)

(assert (=> bm!25251 (= call!25255 call!25253)))

(declare-fun d!63557 () Bool)

(declare-fun e!170986 () Bool)

(assert (=> d!63557 e!170986))

(declare-fun res!128849 () Bool)

(assert (=> d!63557 (=> (not res!128849) (not e!170986))))

(declare-fun lt!133648 () List!3763)

(assert (=> d!63557 (= res!128849 (isStrictlySorted!364 lt!133648))))

(declare-fun e!170984 () List!3763)

(assert (=> d!63557 (= lt!133648 e!170984)))

(assert (=> d!63557 (= c!45082 (and ((_ is Cons!3759) (toList!1916 lt!133257)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133257))) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63557 (isStrictlySorted!364 (toList!1916 lt!133257))))

(assert (=> d!63557 (= (insertStrictlySorted!180 (toList!1916 lt!133257) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) lt!133648)))

(declare-fun b!263909 () Bool)

(assert (=> b!263909 (= e!170984 call!25254)))

(declare-fun bm!25252 () Bool)

(assert (=> bm!25252 (= call!25253 call!25254)))

(declare-fun b!263910 () Bool)

(assert (=> b!263910 (= e!170984 e!170987)))

(assert (=> b!263910 (= c!45083 (and ((_ is Cons!3759) (toList!1916 lt!133257)) (= (_1!2454 (h!4425 (toList!1916 lt!133257))) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263911 () Bool)

(assert (=> b!263911 (= e!170986 (contains!1888 lt!133648 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!263912 () Bool)

(assert (=> b!263912 (= c!45081 (and ((_ is Cons!3759) (toList!1916 lt!133257)) (bvsgt (_1!2454 (h!4425 (toList!1916 lt!133257))) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))))

(assert (=> b!263912 (= e!170987 e!170985)))

(declare-fun b!263913 () Bool)

(declare-fun res!128850 () Bool)

(assert (=> b!263913 (=> (not res!128850) (not e!170986))))

(assert (=> b!263913 (= res!128850 (containsKey!312 lt!133648 (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63557 c!45082) b!263909))

(assert (= (and d!63557 (not c!45082)) b!263910))

(assert (= (and b!263910 c!45083) b!263905))

(assert (= (and b!263910 (not c!45083)) b!263912))

(assert (= (and b!263912 c!45081) b!263904))

(assert (= (and b!263912 (not c!45081)) b!263906))

(assert (= (or b!263904 b!263906) bm!25251))

(assert (= (or b!263905 bm!25251) bm!25252))

(assert (= (or b!263909 bm!25252) bm!25250))

(assert (= (and bm!25250 c!45084) b!263908))

(assert (= (and bm!25250 (not c!45084)) b!263907))

(assert (= (and d!63557 res!128849) b!263913))

(assert (= (and b!263913 res!128850) b!263911))

(declare-fun m!280601 () Bool)

(assert (=> b!263913 m!280601))

(declare-fun m!280603 () Bool)

(assert (=> b!263911 m!280603))

(declare-fun m!280605 () Bool)

(assert (=> b!263908 m!280605))

(declare-fun m!280607 () Bool)

(assert (=> bm!25250 m!280607))

(declare-fun m!280609 () Bool)

(assert (=> d!63557 m!280609))

(declare-fun m!280611 () Bool)

(assert (=> d!63557 m!280611))

(assert (=> d!63375 d!63557))

(declare-fun b!263917 () Bool)

(declare-fun e!170989 () Option!327)

(assert (=> b!263917 (= e!170989 None!325)))

(declare-fun b!263915 () Bool)

(declare-fun e!170988 () Option!327)

(assert (=> b!263915 (= e!170988 e!170989)))

(declare-fun c!45086 () Bool)

(assert (=> b!263915 (= c!45086 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133019))) (not (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133019)))) key!932))))))

(declare-fun b!263916 () Bool)

(assert (=> b!263916 (= e!170989 (getValueByKey!321 (t!8832 (t!8832 (toList!1916 lt!133019))) key!932))))

(declare-fun d!63559 () Bool)

(declare-fun c!45085 () Bool)

(assert (=> d!63559 (= c!45085 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133019))) (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133019)))) key!932)))))

(assert (=> d!63559 (= (getValueByKey!321 (t!8832 (toList!1916 lt!133019)) key!932) e!170988)))

(declare-fun b!263914 () Bool)

(assert (=> b!263914 (= e!170988 (Some!326 (_2!2454 (h!4425 (t!8832 (toList!1916 lt!133019))))))))

(assert (= (and d!63559 c!45085) b!263914))

(assert (= (and d!63559 (not c!45085)) b!263915))

(assert (= (and b!263915 c!45086) b!263916))

(assert (= (and b!263915 (not c!45086)) b!263917))

(declare-fun m!280613 () Bool)

(assert (=> b!263916 m!280613))

(assert (=> b!263543 d!63559))

(declare-fun d!63561 () Bool)

(declare-fun isEmpty!548 (List!3763) Bool)

(assert (=> d!63561 (= (isEmpty!546 lt!133517) (isEmpty!548 (toList!1916 lt!133517)))))

(declare-fun bs!9310 () Bool)

(assert (= bs!9310 d!63561))

(declare-fun m!280615 () Bool)

(assert (=> bs!9310 m!280615))

(assert (=> b!263639 d!63561))

(declare-fun b!263921 () Bool)

(declare-fun e!170991 () Option!327)

(assert (=> b!263921 (= e!170991 None!325)))

(declare-fun b!263919 () Bool)

(declare-fun e!170990 () Option!327)

(assert (=> b!263919 (= e!170990 e!170991)))

(declare-fun c!45088 () Bool)

(assert (=> b!263919 (= c!45088 (and ((_ is Cons!3759) (toList!1916 lt!133507)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133507))) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!263920 () Bool)

(assert (=> b!263920 (= e!170991 (getValueByKey!321 (t!8832 (toList!1916 lt!133507)) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))))

(declare-fun d!63563 () Bool)

(declare-fun c!45087 () Bool)

(assert (=> d!63563 (= c!45087 (and ((_ is Cons!3759) (toList!1916 lt!133507)) (= (_1!2454 (h!4425 (toList!1916 lt!133507))) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63563 (= (getValueByKey!321 (toList!1916 lt!133507) (_1!2454 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) e!170990)))

(declare-fun b!263918 () Bool)

(assert (=> b!263918 (= e!170990 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133507)))))))

(assert (= (and d!63563 c!45087) b!263918))

(assert (= (and d!63563 (not c!45087)) b!263919))

(assert (= (and b!263919 c!45088) b!263920))

(assert (= (and b!263919 (not c!45088)) b!263921))

(declare-fun m!280617 () Bool)

(assert (=> b!263920 m!280617))

(assert (=> b!263630 d!63563))

(declare-fun b!263922 () Bool)

(declare-fun e!170992 () (_ BitVec 32))

(assert (=> b!263922 (= e!170992 #b00000000000000000000000000000000)))

(declare-fun b!263923 () Bool)

(declare-fun e!170993 () (_ BitVec 32))

(assert (=> b!263923 (= e!170992 e!170993)))

(declare-fun c!45089 () Bool)

(assert (=> b!263923 (= c!45089 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!63565 () Bool)

(declare-fun lt!133649 () (_ BitVec 32))

(assert (=> d!63565 (and (bvsge lt!133649 #b00000000000000000000000000000000) (bvsle lt!133649 (bvsub (size!6347 lt!133005) (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!63565 (= lt!133649 e!170992)))

(declare-fun c!45090 () Bool)

(assert (=> d!63565 (= c!45090 (bvsge (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (=> d!63565 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) (bvsge (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 index!297) (size!6347 lt!133005)))))

(assert (=> d!63565 (= (arrayCountValidKeys!0 lt!133005 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)) lt!133649)))

(declare-fun b!263924 () Bool)

(declare-fun call!25256 () (_ BitVec 32))

(assert (=> b!263924 (= e!170993 call!25256)))

(declare-fun b!263925 () Bool)

(assert (=> b!263925 (= e!170993 (bvadd #b00000000000000000000000000000001 call!25256))))

(declare-fun bm!25253 () Bool)

(assert (=> bm!25253 (= call!25256 (arrayCountValidKeys!0 lt!133005 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 index!297)))))

(assert (= (and d!63565 c!45090) b!263922))

(assert (= (and d!63565 (not c!45090)) b!263923))

(assert (= (and b!263923 c!45089) b!263925))

(assert (= (and b!263923 (not c!45089)) b!263924))

(assert (= (or b!263925 b!263924) bm!25253))

(declare-fun m!280619 () Bool)

(assert (=> b!263923 m!280619))

(assert (=> b!263923 m!280619))

(declare-fun m!280621 () Bool)

(assert (=> b!263923 m!280621))

(declare-fun m!280623 () Bool)

(assert (=> bm!25253 m!280623))

(assert (=> bm!25217 d!63565))

(declare-fun d!63567 () Bool)

(assert (=> d!63567 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133265) (_1!2454 lt!133017)))))

(declare-fun lt!133650 () Unit!8164)

(assert (=> d!63567 (= lt!133650 (choose!1303 (toList!1916 lt!133265) (_1!2454 lt!133017)))))

(declare-fun e!170994 () Bool)

(assert (=> d!63567 e!170994))

(declare-fun res!128851 () Bool)

(assert (=> d!63567 (=> (not res!128851) (not e!170994))))

(assert (=> d!63567 (= res!128851 (isStrictlySorted!364 (toList!1916 lt!133265)))))

(assert (=> d!63567 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133265) (_1!2454 lt!133017)) lt!133650)))

(declare-fun b!263926 () Bool)

(assert (=> b!263926 (= e!170994 (containsKey!312 (toList!1916 lt!133265) (_1!2454 lt!133017)))))

(assert (= (and d!63567 res!128851) b!263926))

(assert (=> d!63567 m!279455))

(assert (=> d!63567 m!279455))

(assert (=> d!63567 m!279999))

(declare-fun m!280625 () Bool)

(assert (=> d!63567 m!280625))

(declare-fun m!280627 () Bool)

(assert (=> d!63567 m!280627))

(assert (=> b!263926 m!279995))

(assert (=> b!263597 d!63567))

(declare-fun d!63569 () Bool)

(assert (=> d!63569 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133265) (_1!2454 lt!133017))) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133265) (_1!2454 lt!133017)))))))

(declare-fun bs!9311 () Bool)

(assert (= bs!9311 d!63569))

(assert (=> bs!9311 m!279455))

(declare-fun m!280629 () Bool)

(assert (=> bs!9311 m!280629))

(assert (=> b!263597 d!63569))

(assert (=> b!263597 d!63453))

(declare-fun d!63571 () Bool)

(assert (=> d!63571 (arrayContainsKey!0 lt!133005 lt!133434 #b00000000000000000000000000000000)))

(declare-fun lt!133651 () Unit!8164)

(assert (=> d!63571 (= lt!133651 (choose!13 lt!133005 lt!133434 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!63571 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!63571 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133005 lt!133434 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133651)))

(declare-fun bs!9312 () Bool)

(assert (= bs!9312 d!63571))

(assert (=> bs!9312 m!279851))

(declare-fun m!280631 () Bool)

(assert (=> bs!9312 m!280631))

(assert (=> b!263514 d!63571))

(declare-fun d!63573 () Bool)

(declare-fun res!128852 () Bool)

(declare-fun e!170995 () Bool)

(assert (=> d!63573 (=> res!128852 e!170995)))

(assert (=> d!63573 (= res!128852 (= (select (arr!5996 lt!133005) #b00000000000000000000000000000000) lt!133434))))

(assert (=> d!63573 (= (arrayContainsKey!0 lt!133005 lt!133434 #b00000000000000000000000000000000) e!170995)))

(declare-fun b!263927 () Bool)

(declare-fun e!170996 () Bool)

(assert (=> b!263927 (= e!170995 e!170996)))

(declare-fun res!128853 () Bool)

(assert (=> b!263927 (=> (not res!128853) (not e!170996))))

(assert (=> b!263927 (= res!128853 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(declare-fun b!263928 () Bool)

(assert (=> b!263928 (= e!170996 (arrayContainsKey!0 lt!133005 lt!133434 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63573 (not res!128852)) b!263927))

(assert (= (and b!263927 res!128853) b!263928))

(assert (=> d!63573 m!279433))

(declare-fun m!280633 () Bool)

(assert (=> b!263928 m!280633))

(assert (=> b!263514 d!63573))

(declare-fun b!263929 () Bool)

(declare-fun e!170999 () SeekEntryResult!1164)

(declare-fun lt!133654 () SeekEntryResult!1164)

(assert (=> b!263929 (= e!170999 (seekKeyOrZeroReturnVacant!0 (x!25206 lt!133654) (index!6828 lt!133654) (index!6828 lt!133654) (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133005 (mask!11208 thiss!1504)))))

(declare-fun d!63575 () Bool)

(declare-fun lt!133652 () SeekEntryResult!1164)

(assert (=> d!63575 (and (or ((_ is Undefined!1164) lt!133652) (not ((_ is Found!1164) lt!133652)) (and (bvsge (index!6827 lt!133652) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133652) (size!6347 lt!133005)))) (or ((_ is Undefined!1164) lt!133652) ((_ is Found!1164) lt!133652) (not ((_ is MissingZero!1164) lt!133652)) (and (bvsge (index!6826 lt!133652) #b00000000000000000000000000000000) (bvslt (index!6826 lt!133652) (size!6347 lt!133005)))) (or ((_ is Undefined!1164) lt!133652) ((_ is Found!1164) lt!133652) ((_ is MissingZero!1164) lt!133652) (not ((_ is MissingVacant!1164) lt!133652)) (and (bvsge (index!6829 lt!133652) #b00000000000000000000000000000000) (bvslt (index!6829 lt!133652) (size!6347 lt!133005)))) (or ((_ is Undefined!1164) lt!133652) (ite ((_ is Found!1164) lt!133652) (= (select (arr!5996 lt!133005) (index!6827 lt!133652)) (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!1164) lt!133652) (= (select (arr!5996 lt!133005) (index!6826 lt!133652)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1164) lt!133652) (= (select (arr!5996 lt!133005) (index!6829 lt!133652)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!170997 () SeekEntryResult!1164)

(assert (=> d!63575 (= lt!133652 e!170997)))

(declare-fun c!45091 () Bool)

(assert (=> d!63575 (= c!45091 (and ((_ is Intermediate!1164) lt!133654) (undefined!1976 lt!133654)))))

(assert (=> d!63575 (= lt!133654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (mask!11208 thiss!1504)) (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133005 (mask!11208 thiss!1504)))))

(assert (=> d!63575 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63575 (= (seekEntryOrOpen!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133005 (mask!11208 thiss!1504)) lt!133652)))

(declare-fun b!263930 () Bool)

(declare-fun c!45093 () Bool)

(declare-fun lt!133653 () (_ BitVec 64))

(assert (=> b!263930 (= c!45093 (= lt!133653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!170998 () SeekEntryResult!1164)

(assert (=> b!263930 (= e!170998 e!170999)))

(declare-fun b!263931 () Bool)

(assert (=> b!263931 (= e!170997 Undefined!1164)))

(declare-fun b!263932 () Bool)

(assert (=> b!263932 (= e!170999 (MissingZero!1164 (index!6828 lt!133654)))))

(declare-fun b!263933 () Bool)

(assert (=> b!263933 (= e!170997 e!170998)))

(assert (=> b!263933 (= lt!133653 (select (arr!5996 lt!133005) (index!6828 lt!133654)))))

(declare-fun c!45092 () Bool)

(assert (=> b!263933 (= c!45092 (= lt!133653 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263934 () Bool)

(assert (=> b!263934 (= e!170998 (Found!1164 (index!6828 lt!133654)))))

(assert (= (and d!63575 c!45091) b!263931))

(assert (= (and d!63575 (not c!45091)) b!263933))

(assert (= (and b!263933 c!45092) b!263934))

(assert (= (and b!263933 (not c!45092)) b!263930))

(assert (= (and b!263930 c!45093) b!263932))

(assert (= (and b!263930 (not c!45093)) b!263929))

(assert (=> b!263929 m!279845))

(declare-fun m!280635 () Bool)

(assert (=> b!263929 m!280635))

(assert (=> d!63575 m!279317))

(assert (=> d!63575 m!279845))

(declare-fun m!280637 () Bool)

(assert (=> d!63575 m!280637))

(declare-fun m!280639 () Bool)

(assert (=> d!63575 m!280639))

(assert (=> d!63575 m!280637))

(assert (=> d!63575 m!279845))

(declare-fun m!280641 () Bool)

(assert (=> d!63575 m!280641))

(declare-fun m!280643 () Bool)

(assert (=> d!63575 m!280643))

(declare-fun m!280645 () Bool)

(assert (=> d!63575 m!280645))

(declare-fun m!280647 () Bool)

(assert (=> b!263933 m!280647))

(assert (=> b!263514 d!63575))

(declare-fun d!63577 () Bool)

(declare-fun e!171000 () Bool)

(assert (=> d!63577 e!171000))

(declare-fun res!128854 () Bool)

(assert (=> d!63577 (=> res!128854 e!171000)))

(declare-fun lt!133656 () Bool)

(assert (=> d!63577 (= res!128854 (not lt!133656))))

(declare-fun lt!133658 () Bool)

(assert (=> d!63577 (= lt!133656 lt!133658)))

(declare-fun lt!133657 () Unit!8164)

(declare-fun e!171001 () Unit!8164)

(assert (=> d!63577 (= lt!133657 e!171001)))

(declare-fun c!45094 () Bool)

(assert (=> d!63577 (= c!45094 lt!133658)))

(assert (=> d!63577 (= lt!133658 (containsKey!312 (toList!1916 lt!133517) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!63577 (= (contains!1885 lt!133517 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) lt!133656)))

(declare-fun b!263935 () Bool)

(declare-fun lt!133655 () Unit!8164)

(assert (=> b!263935 (= e!171001 lt!133655)))

(assert (=> b!263935 (= lt!133655 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133517) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263935 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133517) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!263936 () Bool)

(declare-fun Unit!8200 () Unit!8164)

(assert (=> b!263936 (= e!171001 Unit!8200)))

(declare-fun b!263937 () Bool)

(assert (=> b!263937 (= e!171000 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133517) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!63577 c!45094) b!263935))

(assert (= (and d!63577 (not c!45094)) b!263936))

(assert (= (and d!63577 (not res!128854)) b!263937))

(assert (=> d!63577 m!279365))

(declare-fun m!280649 () Bool)

(assert (=> d!63577 m!280649))

(assert (=> b!263935 m!279365))

(declare-fun m!280651 () Bool)

(assert (=> b!263935 m!280651))

(assert (=> b!263935 m!279365))

(declare-fun m!280653 () Bool)

(assert (=> b!263935 m!280653))

(assert (=> b!263935 m!280653))

(declare-fun m!280655 () Bool)

(assert (=> b!263935 m!280655))

(assert (=> b!263937 m!279365))

(assert (=> b!263937 m!280653))

(assert (=> b!263937 m!280653))

(assert (=> b!263937 m!280655))

(assert (=> b!263646 d!63577))

(assert (=> d!63301 d!63237))

(declare-fun d!63579 () Bool)

(assert (=> d!63579 (= (apply!262 lt!133380 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) (get!3100 (getValueByKey!321 (toList!1916 lt!133380) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))))

(declare-fun bs!9313 () Bool)

(assert (= bs!9313 d!63579))

(assert (=> bs!9313 m!279433))

(declare-fun m!280657 () Bool)

(assert (=> bs!9313 m!280657))

(assert (=> bs!9313 m!280657))

(declare-fun m!280659 () Bool)

(assert (=> bs!9313 m!280659))

(assert (=> b!263404 d!63579))

(assert (=> b!263404 d!63311))

(declare-fun b!263941 () Bool)

(declare-fun e!171003 () Option!327)

(assert (=> b!263941 (= e!171003 None!325)))

(declare-fun b!263939 () Bool)

(declare-fun e!171002 () Option!327)

(assert (=> b!263939 (= e!171002 e!171003)))

(declare-fun c!45096 () Bool)

(assert (=> b!263939 (= c!45096 (and ((_ is Cons!3759) (toList!1916 lt!133410)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133410))) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!263940 () Bool)

(assert (=> b!263940 (= e!171003 (getValueByKey!321 (t!8832 (toList!1916 lt!133410)) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))))

(declare-fun d!63581 () Bool)

(declare-fun c!45095 () Bool)

(assert (=> d!63581 (= c!45095 (and ((_ is Cons!3759) (toList!1916 lt!133410)) (= (_1!2454 (h!4425 (toList!1916 lt!133410))) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63581 (= (getValueByKey!321 (toList!1916 lt!133410) (_1!2454 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) e!171002)))

(declare-fun b!263938 () Bool)

(assert (=> b!263938 (= e!171002 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133410)))))))

(assert (= (and d!63581 c!45095) b!263938))

(assert (= (and d!63581 (not c!45095)) b!263939))

(assert (= (and b!263939 c!45096) b!263940))

(assert (= (and b!263939 (not c!45096)) b!263941))

(declare-fun m!280661 () Bool)

(assert (=> b!263940 m!280661))

(assert (=> b!263424 d!63581))

(assert (=> d!63367 d!63299))

(assert (=> bm!25223 d!63167))

(assert (=> d!63317 d!63437))

(assert (=> d!63317 d!63197))

(declare-fun d!63583 () Bool)

(declare-fun res!128855 () Bool)

(declare-fun e!171004 () Bool)

(assert (=> d!63583 (=> res!128855 e!171004)))

(assert (=> d!63583 (= res!128855 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133013))) (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133013)))) key!932)))))

(assert (=> d!63583 (= (containsKey!312 (t!8832 (toList!1916 lt!133013)) key!932) e!171004)))

(declare-fun b!263942 () Bool)

(declare-fun e!171005 () Bool)

(assert (=> b!263942 (= e!171004 e!171005)))

(declare-fun res!128856 () Bool)

(assert (=> b!263942 (=> (not res!128856) (not e!171005))))

(assert (=> b!263942 (= res!128856 (and (or (not ((_ is Cons!3759) (t!8832 (toList!1916 lt!133013)))) (bvsle (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133013)))) key!932)) ((_ is Cons!3759) (t!8832 (toList!1916 lt!133013))) (bvslt (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133013)))) key!932)))))

(declare-fun b!263943 () Bool)

(assert (=> b!263943 (= e!171005 (containsKey!312 (t!8832 (t!8832 (toList!1916 lt!133013))) key!932))))

(assert (= (and d!63583 (not res!128855)) b!263942))

(assert (= (and b!263942 res!128856) b!263943))

(declare-fun m!280663 () Bool)

(assert (=> b!263943 m!280663))

(assert (=> b!263666 d!63583))

(declare-fun d!63585 () Bool)

(declare-fun e!171006 () Bool)

(assert (=> d!63585 e!171006))

(declare-fun res!128857 () Bool)

(assert (=> d!63585 (=> res!128857 e!171006)))

(declare-fun lt!133660 () Bool)

(assert (=> d!63585 (= res!128857 (not lt!133660))))

(declare-fun lt!133662 () Bool)

(assert (=> d!63585 (= lt!133660 lt!133662)))

(declare-fun lt!133661 () Unit!8164)

(declare-fun e!171007 () Unit!8164)

(assert (=> d!63585 (= lt!133661 e!171007)))

(declare-fun c!45097 () Bool)

(assert (=> d!63585 (= c!45097 lt!133662)))

(assert (=> d!63585 (= lt!133662 (containsKey!312 (toList!1916 lt!133445) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!63585 (= (contains!1885 lt!133445 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)) lt!133660)))

(declare-fun b!263944 () Bool)

(declare-fun lt!133659 () Unit!8164)

(assert (=> b!263944 (= e!171007 lt!133659)))

(assert (=> b!263944 (= lt!133659 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133445) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> b!263944 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133445) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!263945 () Bool)

(declare-fun Unit!8201 () Unit!8164)

(assert (=> b!263945 (= e!171007 Unit!8201)))

(declare-fun b!263946 () Bool)

(assert (=> b!263946 (= e!171006 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133445) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000))))))

(assert (= (and d!63585 c!45097) b!263944))

(assert (= (and d!63585 (not c!45097)) b!263945))

(assert (= (and d!63585 (not res!128857)) b!263946))

(assert (=> d!63585 m!279611))

(declare-fun m!280665 () Bool)

(assert (=> d!63585 m!280665))

(assert (=> b!263944 m!279611))

(declare-fun m!280667 () Bool)

(assert (=> b!263944 m!280667))

(assert (=> b!263944 m!279611))

(declare-fun m!280669 () Bool)

(assert (=> b!263944 m!280669))

(assert (=> b!263944 m!280669))

(declare-fun m!280671 () Bool)

(assert (=> b!263944 m!280671))

(assert (=> b!263946 m!279611))

(assert (=> b!263946 m!280669))

(assert (=> b!263946 m!280669))

(assert (=> b!263946 m!280671))

(assert (=> b!263521 d!63585))

(declare-fun b!263950 () Bool)

(declare-fun e!171009 () Option!327)

(assert (=> b!263950 (= e!171009 None!325)))

(declare-fun b!263948 () Bool)

(declare-fun e!171008 () Option!327)

(assert (=> b!263948 (= e!171008 e!171009)))

(declare-fun c!45099 () Bool)

(assert (=> b!263948 (= c!45099 (and ((_ is Cons!3759) (toList!1916 lt!133528)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133528))) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))))

(declare-fun b!263949 () Bool)

(assert (=> b!263949 (= e!171009 (getValueByKey!321 (t!8832 (toList!1916 lt!133528)) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))))

(declare-fun d!63587 () Bool)

(declare-fun c!45098 () Bool)

(assert (=> d!63587 (= c!45098 (and ((_ is Cons!3759) (toList!1916 lt!133528)) (= (_1!2454 (h!4425 (toList!1916 lt!133528))) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))))

(assert (=> d!63587 (= (getValueByKey!321 (toList!1916 lt!133528) (_1!2454 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) e!171008)))

(declare-fun b!263947 () Bool)

(assert (=> b!263947 (= e!171008 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133528)))))))

(assert (= (and d!63587 c!45098) b!263947))

(assert (= (and d!63587 (not c!45098)) b!263948))

(assert (= (and b!263948 c!45099) b!263949))

(assert (= (and b!263948 (not c!45099)) b!263950))

(declare-fun m!280673 () Bool)

(assert (=> b!263949 m!280673))

(assert (=> b!263650 d!63587))

(declare-fun d!63589 () Bool)

(declare-fun lt!133663 () Bool)

(assert (=> d!63589 (= lt!133663 (select (content!178 (toList!1916 lt!133437)) (tuple2!4887 key!932 v!346)))))

(declare-fun e!171011 () Bool)

(assert (=> d!63589 (= lt!133663 e!171011)))

(declare-fun res!128859 () Bool)

(assert (=> d!63589 (=> (not res!128859) (not e!171011))))

(assert (=> d!63589 (= res!128859 ((_ is Cons!3759) (toList!1916 lt!133437)))))

(assert (=> d!63589 (= (contains!1888 (toList!1916 lt!133437) (tuple2!4887 key!932 v!346)) lt!133663)))

(declare-fun b!263951 () Bool)

(declare-fun e!171010 () Bool)

(assert (=> b!263951 (= e!171011 e!171010)))

(declare-fun res!128858 () Bool)

(assert (=> b!263951 (=> res!128858 e!171010)))

(assert (=> b!263951 (= res!128858 (= (h!4425 (toList!1916 lt!133437)) (tuple2!4887 key!932 v!346)))))

(declare-fun b!263952 () Bool)

(assert (=> b!263952 (= e!171010 (contains!1888 (t!8832 (toList!1916 lt!133437)) (tuple2!4887 key!932 v!346)))))

(assert (= (and d!63589 res!128859) b!263951))

(assert (= (and b!263951 (not res!128858)) b!263952))

(declare-fun m!280675 () Bool)

(assert (=> d!63589 m!280675))

(declare-fun m!280677 () Bool)

(assert (=> d!63589 m!280677))

(declare-fun m!280679 () Bool)

(assert (=> b!263952 m!280679))

(assert (=> b!263516 d!63589))

(declare-fun d!63591 () Bool)

(assert (=> d!63591 (= (size!6352 thiss!1504) (bvadd (_size!1983 thiss!1504) (bvsdiv (bvadd (extraKeys!4579 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!263503 d!63591))

(declare-fun d!63593 () Bool)

(assert (=> d!63593 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133664 () Unit!8164)

(assert (=> d!63593 (= lt!133664 (choose!1303 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171012 () Bool)

(assert (=> d!63593 e!171012))

(declare-fun res!128860 () Bool)

(assert (=> d!63593 (=> (not res!128860) (not e!171012))))

(assert (=> d!63593 (= res!128860 (isStrictlySorted!364 (toList!1916 lt!133300)))))

(assert (=> d!63593 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000) lt!133664)))

(declare-fun b!263953 () Bool)

(assert (=> b!263953 (= e!171012 (containsKey!312 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63593 res!128860) b!263953))

(assert (=> d!63593 m!279593))

(assert (=> d!63593 m!279593))

(assert (=> d!63593 m!279595))

(declare-fun m!280681 () Bool)

(assert (=> d!63593 m!280681))

(declare-fun m!280683 () Bool)

(assert (=> d!63593 m!280683))

(assert (=> b!263953 m!279589))

(assert (=> b!263314 d!63593))

(declare-fun d!63595 () Bool)

(assert (=> d!63595 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9314 () Bool)

(assert (= bs!9314 d!63595))

(assert (=> bs!9314 m!279593))

(declare-fun m!280685 () Bool)

(assert (=> bs!9314 m!280685))

(assert (=> b!263314 d!63595))

(declare-fun b!263957 () Bool)

(declare-fun e!171014 () Option!327)

(assert (=> b!263957 (= e!171014 None!325)))

(declare-fun b!263955 () Bool)

(declare-fun e!171013 () Option!327)

(assert (=> b!263955 (= e!171013 e!171014)))

(declare-fun c!45101 () Bool)

(assert (=> b!263955 (= c!45101 (and ((_ is Cons!3759) (toList!1916 lt!133300)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133300))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263956 () Bool)

(assert (=> b!263956 (= e!171014 (getValueByKey!321 (t!8832 (toList!1916 lt!133300)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!63597 () Bool)

(declare-fun c!45100 () Bool)

(assert (=> d!63597 (= c!45100 (and ((_ is Cons!3759) (toList!1916 lt!133300)) (= (_1!2454 (h!4425 (toList!1916 lt!133300))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63597 (= (getValueByKey!321 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000) e!171013)))

(declare-fun b!263954 () Bool)

(assert (=> b!263954 (= e!171013 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133300)))))))

(assert (= (and d!63597 c!45100) b!263954))

(assert (= (and d!63597 (not c!45100)) b!263955))

(assert (= (and b!263955 c!45101) b!263956))

(assert (= (and b!263955 (not c!45101)) b!263957))

(declare-fun m!280687 () Bool)

(assert (=> b!263956 m!280687))

(assert (=> b!263314 d!63597))

(assert (=> d!63291 d!63289))

(declare-fun d!63599 () Bool)

(assert (=> d!63599 (= (getValueByKey!321 lt!133177 (_1!2454 lt!133017)) (Some!326 (_2!2454 lt!133017)))))

(assert (=> d!63599 true))

(declare-fun _$22!543 () Unit!8164)

(assert (=> d!63599 (= (choose!1302 lt!133177 (_1!2454 lt!133017) (_2!2454 lt!133017)) _$22!543)))

(declare-fun bs!9315 () Bool)

(assert (= bs!9315 d!63599))

(assert (=> bs!9315 m!279337))

(assert (=> d!63291 d!63599))

(declare-fun d!63601 () Bool)

(declare-fun res!128865 () Bool)

(declare-fun e!171019 () Bool)

(assert (=> d!63601 (=> res!128865 e!171019)))

(assert (=> d!63601 (= res!128865 (or ((_ is Nil!3760) lt!133177) ((_ is Nil!3760) (t!8832 lt!133177))))))

(assert (=> d!63601 (= (isStrictlySorted!364 lt!133177) e!171019)))

(declare-fun b!263962 () Bool)

(declare-fun e!171020 () Bool)

(assert (=> b!263962 (= e!171019 e!171020)))

(declare-fun res!128866 () Bool)

(assert (=> b!263962 (=> (not res!128866) (not e!171020))))

(assert (=> b!263962 (= res!128866 (bvslt (_1!2454 (h!4425 lt!133177)) (_1!2454 (h!4425 (t!8832 lt!133177)))))))

(declare-fun b!263963 () Bool)

(assert (=> b!263963 (= e!171020 (isStrictlySorted!364 (t!8832 lt!133177)))))

(assert (= (and d!63601 (not res!128865)) b!263962))

(assert (= (and b!263962 res!128866) b!263963))

(declare-fun m!280689 () Bool)

(assert (=> b!263963 m!280689))

(assert (=> d!63291 d!63601))

(declare-fun d!63603 () Bool)

(assert (=> d!63603 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!5509 (getValueByKey!321 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63419 d!63603))

(declare-fun b!263967 () Bool)

(declare-fun e!171022 () Option!327)

(assert (=> b!263967 (= e!171022 None!325)))

(declare-fun b!263965 () Bool)

(declare-fun e!171021 () Option!327)

(assert (=> b!263965 (= e!171021 e!171022)))

(declare-fun c!45103 () Bool)

(assert (=> b!263965 (= c!45103 (and ((_ is Cons!3759) (toList!1916 lt!133244)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133244))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!263966 () Bool)

(assert (=> b!263966 (= e!171022 (getValueByKey!321 (t!8832 (toList!1916 lt!133244)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!63605 () Bool)

(declare-fun c!45102 () Bool)

(assert (=> d!63605 (= c!45102 (and ((_ is Cons!3759) (toList!1916 lt!133244)) (= (_1!2454 (h!4425 (toList!1916 lt!133244))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63605 (= (getValueByKey!321 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000) e!171021)))

(declare-fun b!263964 () Bool)

(assert (=> b!263964 (= e!171021 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133244)))))))

(assert (= (and d!63605 c!45102) b!263964))

(assert (= (and d!63605 (not c!45102)) b!263965))

(assert (= (and b!263965 c!45103) b!263966))

(assert (= (and b!263965 (not c!45103)) b!263967))

(declare-fun m!280691 () Bool)

(assert (=> b!263966 m!280691))

(assert (=> d!63419 d!63605))

(declare-fun d!63607 () Bool)

(assert (=> d!63607 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133176) (_1!2454 lt!133017)))))

(declare-fun lt!133665 () Unit!8164)

(assert (=> d!63607 (= lt!133665 (choose!1303 (toList!1916 lt!133176) (_1!2454 lt!133017)))))

(declare-fun e!171023 () Bool)

(assert (=> d!63607 e!171023))

(declare-fun res!128867 () Bool)

(assert (=> d!63607 (=> (not res!128867) (not e!171023))))

(assert (=> d!63607 (= res!128867 (isStrictlySorted!364 (toList!1916 lt!133176)))))

(assert (=> d!63607 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133176) (_1!2454 lt!133017)) lt!133665)))

(declare-fun b!263968 () Bool)

(assert (=> b!263968 (= e!171023 (containsKey!312 (toList!1916 lt!133176) (_1!2454 lt!133017)))))

(assert (= (and d!63607 res!128867) b!263968))

(assert (=> d!63607 m!279343))

(assert (=> d!63607 m!279343))

(assert (=> d!63607 m!279791))

(declare-fun m!280693 () Bool)

(assert (=> d!63607 m!280693))

(declare-fun m!280695 () Bool)

(assert (=> d!63607 m!280695))

(assert (=> b!263968 m!279787))

(assert (=> b!263434 d!63607))

(declare-fun d!63609 () Bool)

(assert (=> d!63609 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133176) (_1!2454 lt!133017))) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133176) (_1!2454 lt!133017)))))))

(declare-fun bs!9316 () Bool)

(assert (= bs!9316 d!63609))

(assert (=> bs!9316 m!279343))

(declare-fun m!280697 () Bool)

(assert (=> bs!9316 m!280697))

(assert (=> b!263434 d!63609))

(assert (=> b!263434 d!63443))

(declare-fun d!63611 () Bool)

(assert (=> d!63611 (= (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) lt!133316)) (v!5509 (getValueByKey!321 (toList!1916 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) lt!133316)))))

(assert (=> d!63251 d!63611))

(declare-fun b!263972 () Bool)

(declare-fun e!171025 () Option!327)

(assert (=> b!263972 (= e!171025 None!325)))

(declare-fun b!263970 () Bool)

(declare-fun e!171024 () Option!327)

(assert (=> b!263970 (= e!171024 e!171025)))

(declare-fun c!45105 () Bool)

(assert (=> b!263970 (= c!45105 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))) (not (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))) lt!133316))))))

(declare-fun b!263971 () Bool)

(assert (=> b!263971 (= e!171025 (getValueByKey!321 (t!8832 (toList!1916 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))) lt!133316))))

(declare-fun c!45104 () Bool)

(declare-fun d!63613 () Bool)

(assert (=> d!63613 (= c!45104 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))) (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))) lt!133316)))))

(assert (=> d!63613 (= (getValueByKey!321 (toList!1916 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) lt!133316) e!171024)))

(declare-fun b!263969 () Bool)

(assert (=> b!263969 (= e!171024 (Some!326 (_2!2454 (h!4425 (toList!1916 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))))))

(assert (= (and d!63613 c!45104) b!263969))

(assert (= (and d!63613 (not c!45104)) b!263970))

(assert (= (and b!263970 c!45105) b!263971))

(assert (= (and b!263970 (not c!45105)) b!263972))

(declare-fun m!280699 () Bool)

(assert (=> b!263971 m!280699))

(assert (=> d!63251 d!63613))

(declare-fun d!63615 () Bool)

(declare-fun e!171026 () Bool)

(assert (=> d!63615 e!171026))

(declare-fun res!128868 () Bool)

(assert (=> d!63615 (=> res!128868 e!171026)))

(declare-fun lt!133667 () Bool)

(assert (=> d!63615 (= res!128868 (not lt!133667))))

(declare-fun lt!133669 () Bool)

(assert (=> d!63615 (= lt!133667 lt!133669)))

(declare-fun lt!133668 () Unit!8164)

(declare-fun e!171027 () Unit!8164)

(assert (=> d!63615 (= lt!133668 e!171027)))

(declare-fun c!45106 () Bool)

(assert (=> d!63615 (= c!45106 lt!133669)))

(assert (=> d!63615 (= lt!133669 (containsKey!312 (toList!1916 lt!133380) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63615 (= (contains!1885 lt!133380 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133667)))

(declare-fun b!263973 () Bool)

(declare-fun lt!133666 () Unit!8164)

(assert (=> b!263973 (= e!171027 lt!133666)))

(assert (=> b!263973 (= lt!133666 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133380) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263973 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133380) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!263974 () Bool)

(declare-fun Unit!8202 () Unit!8164)

(assert (=> b!263974 (= e!171027 Unit!8202)))

(declare-fun b!263975 () Bool)

(assert (=> b!263975 (= e!171026 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63615 c!45106) b!263973))

(assert (= (and d!63615 (not c!45106)) b!263974))

(assert (= (and d!63615 (not res!128868)) b!263975))

(declare-fun m!280701 () Bool)

(assert (=> d!63615 m!280701))

(declare-fun m!280703 () Bool)

(assert (=> b!263973 m!280703))

(declare-fun m!280705 () Bool)

(assert (=> b!263973 m!280705))

(assert (=> b!263973 m!280705))

(declare-fun m!280707 () Bool)

(assert (=> b!263973 m!280707))

(assert (=> b!263975 m!280705))

(assert (=> b!263975 m!280705))

(assert (=> b!263975 m!280707))

(assert (=> b!263396 d!63615))

(declare-fun d!63617 () Bool)

(declare-fun res!128869 () Bool)

(declare-fun e!171028 () Bool)

(assert (=> d!63617 (=> res!128869 e!171028)))

(assert (=> d!63617 (= res!128869 (and ((_ is Cons!3759) (toList!1916 lt!133300)) (= (_1!2454 (h!4425 (toList!1916 lt!133300))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63617 (= (containsKey!312 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000) e!171028)))

(declare-fun b!263976 () Bool)

(declare-fun e!171029 () Bool)

(assert (=> b!263976 (= e!171028 e!171029)))

(declare-fun res!128870 () Bool)

(assert (=> b!263976 (=> (not res!128870) (not e!171029))))

(assert (=> b!263976 (= res!128870 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133300))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133300))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3759) (toList!1916 lt!133300)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133300))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!263977 () Bool)

(assert (=> b!263977 (= e!171029 (containsKey!312 (t!8832 (toList!1916 lt!133300)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63617 (not res!128869)) b!263976))

(assert (= (and b!263976 res!128870) b!263977))

(declare-fun m!280709 () Bool)

(assert (=> b!263977 m!280709))

(assert (=> d!63217 d!63617))

(declare-fun d!63619 () Bool)

(declare-fun res!128871 () Bool)

(declare-fun e!171030 () Bool)

(assert (=> d!63619 (=> res!128871 e!171030)))

(assert (=> d!63619 (= res!128871 (and ((_ is Cons!3759) (toList!1916 lt!133176)) (= (_1!2454 (h!4425 (toList!1916 lt!133176))) (_1!2454 lt!133017))))))

(assert (=> d!63619 (= (containsKey!312 (toList!1916 lt!133176) (_1!2454 lt!133017)) e!171030)))

(declare-fun b!263978 () Bool)

(declare-fun e!171031 () Bool)

(assert (=> b!263978 (= e!171030 e!171031)))

(declare-fun res!128872 () Bool)

(assert (=> b!263978 (=> (not res!128872) (not e!171031))))

(assert (=> b!263978 (= res!128872 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133176))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133176))) (_1!2454 lt!133017))) ((_ is Cons!3759) (toList!1916 lt!133176)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133176))) (_1!2454 lt!133017))))))

(declare-fun b!263979 () Bool)

(assert (=> b!263979 (= e!171031 (containsKey!312 (t!8832 (toList!1916 lt!133176)) (_1!2454 lt!133017)))))

(assert (= (and d!63619 (not res!128871)) b!263978))

(assert (= (and b!263978 res!128872) b!263979))

(declare-fun m!280711 () Bool)

(assert (=> b!263979 m!280711))

(assert (=> d!63287 d!63619))

(assert (=> d!63269 d!63247))

(declare-fun d!63621 () Bool)

(assert (=> d!63621 (= (apply!262 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) lt!133314) (apply!262 lt!133305 lt!133314))))

(assert (=> d!63621 true))

(declare-fun _$34!1134 () Unit!8164)

(assert (=> d!63621 (= (choose!1300 lt!133305 lt!133299 (minValue!4683 thiss!1504) lt!133314) _$34!1134)))

(declare-fun bs!9317 () Bool)

(assert (= bs!9317 d!63621))

(assert (=> bs!9317 m!279531))

(assert (=> bs!9317 m!279531))

(assert (=> bs!9317 m!279543))

(assert (=> bs!9317 m!279539))

(assert (=> d!63269 d!63621))

(assert (=> d!63269 d!63261))

(declare-fun d!63623 () Bool)

(declare-fun e!171032 () Bool)

(assert (=> d!63623 e!171032))

(declare-fun res!128873 () Bool)

(assert (=> d!63623 (=> res!128873 e!171032)))

(declare-fun lt!133671 () Bool)

(assert (=> d!63623 (= res!128873 (not lt!133671))))

(declare-fun lt!133673 () Bool)

(assert (=> d!63623 (= lt!133671 lt!133673)))

(declare-fun lt!133672 () Unit!8164)

(declare-fun e!171033 () Unit!8164)

(assert (=> d!63623 (= lt!133672 e!171033)))

(declare-fun c!45107 () Bool)

(assert (=> d!63623 (= c!45107 lt!133673)))

(assert (=> d!63623 (= lt!133673 (containsKey!312 (toList!1916 lt!133305) lt!133314))))

(assert (=> d!63623 (= (contains!1885 lt!133305 lt!133314) lt!133671)))

(declare-fun b!263981 () Bool)

(declare-fun lt!133670 () Unit!8164)

(assert (=> b!263981 (= e!171033 lt!133670)))

(assert (=> b!263981 (= lt!133670 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133305) lt!133314))))

(assert (=> b!263981 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133305) lt!133314))))

(declare-fun b!263982 () Bool)

(declare-fun Unit!8203 () Unit!8164)

(assert (=> b!263982 (= e!171033 Unit!8203)))

(declare-fun b!263983 () Bool)

(assert (=> b!263983 (= e!171032 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133305) lt!133314)))))

(assert (= (and d!63623 c!45107) b!263981))

(assert (= (and d!63623 (not c!45107)) b!263982))

(assert (= (and d!63623 (not res!128873)) b!263983))

(declare-fun m!280713 () Bool)

(assert (=> d!63623 m!280713))

(declare-fun m!280715 () Bool)

(assert (=> b!263981 m!280715))

(assert (=> b!263981 m!279709))

(assert (=> b!263981 m!279709))

(declare-fun m!280717 () Bool)

(assert (=> b!263981 m!280717))

(assert (=> b!263983 m!279709))

(assert (=> b!263983 m!279709))

(assert (=> b!263983 m!280717))

(assert (=> d!63269 d!63623))

(assert (=> d!63269 d!63267))

(declare-fun b!263984 () Bool)

(declare-fun e!171037 () Bool)

(declare-fun call!25257 () Bool)

(assert (=> b!263984 (= e!171037 call!25257)))

(declare-fun b!263985 () Bool)

(declare-fun e!171034 () Bool)

(assert (=> b!263985 (= e!171034 (contains!1889 (ite c!45025 (Cons!3760 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) Nil!3761) Nil!3761) (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263986 () Bool)

(declare-fun e!171036 () Bool)

(assert (=> b!263986 (= e!171036 e!171037)))

(declare-fun c!45108 () Bool)

(assert (=> b!263986 (= c!45108 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!263987 () Bool)

(assert (=> b!263987 (= e!171037 call!25257)))

(declare-fun bm!25254 () Bool)

(assert (=> bm!25254 (= call!25257 (arrayNoDuplicates!0 (_keys!7034 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45108 (Cons!3760 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!45025 (Cons!3760 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (ite c!45025 (Cons!3760 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) Nil!3761) Nil!3761))))))

(declare-fun b!263988 () Bool)

(declare-fun e!171035 () Bool)

(assert (=> b!263988 (= e!171035 e!171036)))

(declare-fun res!128874 () Bool)

(assert (=> b!263988 (=> (not res!128874) (not e!171036))))

(assert (=> b!263988 (= res!128874 (not e!171034))))

(declare-fun res!128876 () Bool)

(assert (=> b!263988 (=> (not res!128876) (not e!171034))))

(assert (=> b!263988 (= res!128876 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63625 () Bool)

(declare-fun res!128875 () Bool)

(assert (=> d!63625 (=> res!128875 e!171035)))

(assert (=> d!63625 (= res!128875 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63625 (= (arrayNoDuplicates!0 (_keys!7034 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45025 (Cons!3760 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) e!171035)))

(assert (= (and d!63625 (not res!128875)) b!263988))

(assert (= (and b!263988 res!128876) b!263985))

(assert (= (and b!263988 res!128874) b!263986))

(assert (= (and b!263986 c!45108) b!263987))

(assert (= (and b!263986 (not c!45108)) b!263984))

(assert (= (or b!263987 b!263984) bm!25254))

(assert (=> b!263985 m!279975))

(assert (=> b!263985 m!279975))

(declare-fun m!280719 () Bool)

(assert (=> b!263985 m!280719))

(assert (=> b!263986 m!279975))

(assert (=> b!263986 m!279975))

(assert (=> b!263986 m!280301))

(assert (=> bm!25254 m!279975))

(declare-fun m!280721 () Bool)

(assert (=> bm!25254 m!280721))

(assert (=> b!263988 m!279975))

(assert (=> b!263988 m!279975))

(assert (=> b!263988 m!280301))

(assert (=> bm!25232 d!63625))

(declare-fun b!263992 () Bool)

(declare-fun e!171039 () Option!327)

(assert (=> b!263992 (= e!171039 None!325)))

(declare-fun b!263990 () Bool)

(declare-fun e!171038 () Option!327)

(assert (=> b!263990 (= e!171038 e!171039)))

(declare-fun c!45110 () Bool)

(assert (=> b!263990 (= c!45110 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133003))) (not (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133003)))) key!932))))))

(declare-fun b!263991 () Bool)

(assert (=> b!263991 (= e!171039 (getValueByKey!321 (t!8832 (t!8832 (toList!1916 lt!133003))) key!932))))

(declare-fun d!63627 () Bool)

(declare-fun c!45109 () Bool)

(assert (=> d!63627 (= c!45109 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133003))) (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133003)))) key!932)))))

(assert (=> d!63627 (= (getValueByKey!321 (t!8832 (toList!1916 lt!133003)) key!932) e!171038)))

(declare-fun b!263989 () Bool)

(assert (=> b!263989 (= e!171038 (Some!326 (_2!2454 (h!4425 (t!8832 (toList!1916 lt!133003))))))))

(assert (= (and d!63627 c!45109) b!263989))

(assert (= (and d!63627 (not c!45109)) b!263990))

(assert (= (and b!263990 c!45110) b!263991))

(assert (= (and b!263990 (not c!45110)) b!263992))

(declare-fun m!280723 () Bool)

(assert (=> b!263991 m!280723))

(assert (=> b!263661 d!63627))

(assert (=> b!263502 d!63591))

(declare-fun b!263996 () Bool)

(declare-fun e!171041 () Option!327)

(assert (=> b!263996 (= e!171041 None!325)))

(declare-fun b!263994 () Bool)

(declare-fun e!171040 () Option!327)

(assert (=> b!263994 (= e!171040 e!171041)))

(declare-fun c!45112 () Bool)

(assert (=> b!263994 (= c!45112 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133265))) (not (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133265)))) (_1!2454 lt!133017)))))))

(declare-fun b!263995 () Bool)

(assert (=> b!263995 (= e!171041 (getValueByKey!321 (t!8832 (t!8832 (toList!1916 lt!133265))) (_1!2454 lt!133017)))))

(declare-fun d!63629 () Bool)

(declare-fun c!45111 () Bool)

(assert (=> d!63629 (= c!45111 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133265))) (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133265)))) (_1!2454 lt!133017))))))

(assert (=> d!63629 (= (getValueByKey!321 (t!8832 (toList!1916 lt!133265)) (_1!2454 lt!133017)) e!171040)))

(declare-fun b!263993 () Bool)

(assert (=> b!263993 (= e!171040 (Some!326 (_2!2454 (h!4425 (t!8832 (toList!1916 lt!133265))))))))

(assert (= (and d!63629 c!45111) b!263993))

(assert (= (and d!63629 (not c!45111)) b!263994))

(assert (= (and b!263994 c!45112) b!263995))

(assert (= (and b!263994 (not c!45112)) b!263996))

(declare-fun m!280725 () Bool)

(assert (=> b!263995 m!280725))

(assert (=> b!263752 d!63629))

(declare-fun d!63631 () Bool)

(declare-fun res!128877 () Bool)

(declare-fun e!171042 () Bool)

(assert (=> d!63631 (=> res!128877 e!171042)))

(assert (=> d!63631 (= res!128877 (and ((_ is Cons!3759) (toList!1916 lt!133265)) (= (_1!2454 (h!4425 (toList!1916 lt!133265))) (_1!2454 lt!133017))))))

(assert (=> d!63631 (= (containsKey!312 (toList!1916 lt!133265) (_1!2454 lt!133017)) e!171042)))

(declare-fun b!263997 () Bool)

(declare-fun e!171043 () Bool)

(assert (=> b!263997 (= e!171042 e!171043)))

(declare-fun res!128878 () Bool)

(assert (=> b!263997 (=> (not res!128878) (not e!171043))))

(assert (=> b!263997 (= res!128878 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133265))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133265))) (_1!2454 lt!133017))) ((_ is Cons!3759) (toList!1916 lt!133265)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133265))) (_1!2454 lt!133017))))))

(declare-fun b!263998 () Bool)

(assert (=> b!263998 (= e!171043 (containsKey!312 (t!8832 (toList!1916 lt!133265)) (_1!2454 lt!133017)))))

(assert (= (and d!63631 (not res!128877)) b!263997))

(assert (= (and b!263997 res!128878) b!263998))

(declare-fun m!280727 () Bool)

(assert (=> b!263998 m!280727))

(assert (=> d!63355 d!63631))

(declare-fun d!63633 () Bool)

(assert (=> d!63633 (= (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263513 d!63633))

(assert (=> b!263745 d!63281))

(declare-fun b!263999 () Bool)

(declare-fun res!128879 () Bool)

(declare-fun e!171046 () Bool)

(assert (=> b!263999 (=> (not res!128879) (not e!171046))))

(declare-fun lt!133676 () ListLongMap!3801)

(assert (=> b!263999 (= res!128879 (not (contains!1885 lt!133676 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264000 () Bool)

(declare-fun e!171047 () Bool)

(assert (=> b!264000 (= e!171046 e!171047)))

(declare-fun c!45115 () Bool)

(declare-fun e!171050 () Bool)

(assert (=> b!264000 (= c!45115 e!171050)))

(declare-fun res!128882 () Bool)

(assert (=> b!264000 (=> (not res!128882) (not e!171050))))

(assert (=> b!264000 (= res!128882 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun b!264001 () Bool)

(declare-fun e!171044 () ListLongMap!3801)

(declare-fun e!171048 () ListLongMap!3801)

(assert (=> b!264001 (= e!171044 e!171048)))

(declare-fun c!45116 () Bool)

(assert (=> b!264001 (= c!45116 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264002 () Bool)

(declare-fun call!25258 () ListLongMap!3801)

(assert (=> b!264002 (= e!171048 call!25258)))

(declare-fun b!264003 () Bool)

(declare-fun e!171045 () Bool)

(assert (=> b!264003 (= e!171045 (isEmpty!546 lt!133676))))

(declare-fun d!63635 () Bool)

(assert (=> d!63635 e!171046))

(declare-fun res!128880 () Bool)

(assert (=> d!63635 (=> (not res!128880) (not e!171046))))

(assert (=> d!63635 (= res!128880 (not (contains!1885 lt!133676 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63635 (= lt!133676 e!171044)))

(declare-fun c!45114 () Bool)

(assert (=> d!63635 (= c!45114 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63635 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63635 (= (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)) lt!133676)))

(declare-fun b!264004 () Bool)

(assert (=> b!264004 (= e!171050 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264004 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!264005 () Bool)

(assert (=> b!264005 (= e!171044 (ListLongMap!3802 Nil!3760))))

(declare-fun bm!25255 () Bool)

(assert (=> bm!25255 (= call!25258 (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)))))

(declare-fun b!264006 () Bool)

(assert (=> b!264006 (= e!171047 e!171045)))

(declare-fun c!45113 () Bool)

(assert (=> b!264006 (= c!45113 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun b!264007 () Bool)

(assert (=> b!264007 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> b!264007 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6346 (_values!4825 thiss!1504))))))

(declare-fun e!171049 () Bool)

(assert (=> b!264007 (= e!171049 (= (apply!262 lt!133676 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!264008 () Bool)

(declare-fun lt!133675 () Unit!8164)

(declare-fun lt!133674 () Unit!8164)

(assert (=> b!264008 (= lt!133675 lt!133674)))

(declare-fun lt!133679 () V!8521)

(declare-fun lt!133677 () (_ BitVec 64))

(declare-fun lt!133680 () (_ BitVec 64))

(declare-fun lt!133678 () ListLongMap!3801)

(assert (=> b!264008 (not (contains!1885 (+!712 lt!133678 (tuple2!4887 lt!133677 lt!133679)) lt!133680))))

(assert (=> b!264008 (= lt!133674 (addStillNotContains!131 lt!133678 lt!133677 lt!133679 lt!133680))))

(assert (=> b!264008 (= lt!133680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!264008 (= lt!133679 (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!264008 (= lt!133677 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!264008 (= lt!133678 call!25258)))

(assert (=> b!264008 (= e!171048 (+!712 call!25258 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!264009 () Bool)

(assert (=> b!264009 (= e!171045 (= lt!133676 (getCurrentListMapNoExtraKeys!578 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504))))))

(declare-fun b!264010 () Bool)

(assert (=> b!264010 (= e!171047 e!171049)))

(assert (=> b!264010 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun res!128881 () Bool)

(assert (=> b!264010 (= res!128881 (contains!1885 lt!133676 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264010 (=> (not res!128881) (not e!171049))))

(assert (= (and d!63635 c!45114) b!264005))

(assert (= (and d!63635 (not c!45114)) b!264001))

(assert (= (and b!264001 c!45116) b!264008))

(assert (= (and b!264001 (not c!45116)) b!264002))

(assert (= (or b!264008 b!264002) bm!25255))

(assert (= (and d!63635 res!128880) b!263999))

(assert (= (and b!263999 res!128879) b!264000))

(assert (= (and b!264000 res!128882) b!264004))

(assert (= (and b!264000 c!45115) b!264010))

(assert (= (and b!264000 (not c!45115)) b!264006))

(assert (= (and b!264010 res!128881) b!264007))

(assert (= (and b!264006 c!45113) b!264009))

(assert (= (and b!264006 (not c!45113)) b!264003))

(declare-fun b_lambda!8387 () Bool)

(assert (=> (not b_lambda!8387) (not b!264007)))

(assert (=> b!264007 t!8837))

(declare-fun b_and!13975 () Bool)

(assert (= b_and!13973 (and (=> t!8837 result!5425) b_and!13975)))

(declare-fun b_lambda!8389 () Bool)

(assert (=> (not b_lambda!8389) (not b!264008)))

(assert (=> b!264008 t!8837))

(declare-fun b_and!13977 () Bool)

(assert (= b_and!13975 (and (=> t!8837 result!5425) b_and!13977)))

(declare-fun m!280729 () Bool)

(assert (=> b!264003 m!280729))

(assert (=> b!264004 m!279975))

(assert (=> b!264004 m!279975))

(assert (=> b!264004 m!280301))

(declare-fun m!280731 () Bool)

(assert (=> b!264009 m!280731))

(assert (=> b!264001 m!279975))

(assert (=> b!264001 m!279975))

(assert (=> b!264001 m!280301))

(declare-fun m!280733 () Bool)

(assert (=> b!264007 m!280733))

(assert (=> b!264007 m!279975))

(assert (=> b!264007 m!279975))

(declare-fun m!280735 () Bool)

(assert (=> b!264007 m!280735))

(assert (=> b!264007 m!280733))

(assert (=> b!264007 m!279383))

(declare-fun m!280737 () Bool)

(assert (=> b!264007 m!280737))

(assert (=> b!264007 m!279383))

(declare-fun m!280739 () Bool)

(assert (=> d!63635 m!280739))

(assert (=> d!63635 m!279317))

(declare-fun m!280741 () Bool)

(assert (=> b!263999 m!280741))

(assert (=> bm!25255 m!280731))

(assert (=> b!264010 m!279975))

(assert (=> b!264010 m!279975))

(declare-fun m!280743 () Bool)

(assert (=> b!264010 m!280743))

(declare-fun m!280745 () Bool)

(assert (=> b!264008 m!280745))

(assert (=> b!264008 m!280733))

(declare-fun m!280747 () Bool)

(assert (=> b!264008 m!280747))

(assert (=> b!264008 m!279975))

(assert (=> b!264008 m!280747))

(declare-fun m!280749 () Bool)

(assert (=> b!264008 m!280749))

(declare-fun m!280751 () Bool)

(assert (=> b!264008 m!280751))

(assert (=> b!264008 m!280733))

(assert (=> b!264008 m!279383))

(assert (=> b!264008 m!280737))

(assert (=> b!264008 m!279383))

(assert (=> b!263645 d!63635))

(assert (=> d!63273 d!63259))

(assert (=> d!63273 d!63277))

(declare-fun d!63637 () Bool)

(assert (=> d!63637 (contains!1885 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))) lt!133298)))

(assert (=> d!63637 true))

(declare-fun _$35!420 () Unit!8164)

(assert (=> d!63637 (= (choose!1301 lt!133309 lt!133315 (zeroValue!4683 thiss!1504) lt!133298) _$35!420)))

(declare-fun bs!9318 () Bool)

(assert (= bs!9318 d!63637))

(assert (=> bs!9318 m!279545))

(assert (=> bs!9318 m!279545))

(assert (=> bs!9318 m!279547))

(assert (=> d!63273 d!63637))

(declare-fun d!63639 () Bool)

(declare-fun e!171051 () Bool)

(assert (=> d!63639 e!171051))

(declare-fun res!128883 () Bool)

(assert (=> d!63639 (=> res!128883 e!171051)))

(declare-fun lt!133682 () Bool)

(assert (=> d!63639 (= res!128883 (not lt!133682))))

(declare-fun lt!133684 () Bool)

(assert (=> d!63639 (= lt!133682 lt!133684)))

(declare-fun lt!133683 () Unit!8164)

(declare-fun e!171052 () Unit!8164)

(assert (=> d!63639 (= lt!133683 e!171052)))

(declare-fun c!45117 () Bool)

(assert (=> d!63639 (= c!45117 lt!133684)))

(assert (=> d!63639 (= lt!133684 (containsKey!312 (toList!1916 lt!133309) lt!133298))))

(assert (=> d!63639 (= (contains!1885 lt!133309 lt!133298) lt!133682)))

(declare-fun b!264012 () Bool)

(declare-fun lt!133681 () Unit!8164)

(assert (=> b!264012 (= e!171052 lt!133681)))

(assert (=> b!264012 (= lt!133681 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133309) lt!133298))))

(assert (=> b!264012 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133309) lt!133298))))

(declare-fun b!264013 () Bool)

(declare-fun Unit!8204 () Unit!8164)

(assert (=> b!264013 (= e!171052 Unit!8204)))

(declare-fun b!264014 () Bool)

(assert (=> b!264014 (= e!171051 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133309) lt!133298)))))

(assert (= (and d!63639 c!45117) b!264012))

(assert (= (and d!63639 (not c!45117)) b!264013))

(assert (= (and d!63639 (not res!128883)) b!264014))

(declare-fun m!280753 () Bool)

(assert (=> d!63639 m!280753))

(declare-fun m!280755 () Bool)

(assert (=> b!264012 m!280755))

(declare-fun m!280757 () Bool)

(assert (=> b!264012 m!280757))

(assert (=> b!264012 m!280757))

(declare-fun m!280759 () Bool)

(assert (=> b!264012 m!280759))

(assert (=> b!264014 m!280757))

(assert (=> b!264014 m!280757))

(assert (=> b!264014 m!280759))

(assert (=> d!63273 d!63639))

(declare-fun d!63641 () Bool)

(assert (=> d!63641 (= (apply!262 lt!133445 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3100 (getValueByKey!321 (toList!1916 lt!133445) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9319 () Bool)

(assert (= bs!9319 d!63641))

(declare-fun m!280761 () Bool)

(assert (=> bs!9319 m!280761))

(assert (=> bs!9319 m!280761))

(declare-fun m!280763 () Bool)

(assert (=> bs!9319 m!280763))

(assert (=> b!263533 d!63641))

(declare-fun d!63643 () Bool)

(declare-fun res!128884 () Bool)

(declare-fun e!171053 () Bool)

(assert (=> d!63643 (=> res!128884 e!171053)))

(assert (=> d!63643 (= res!128884 (or ((_ is Nil!3760) lt!133429) ((_ is Nil!3760) (t!8832 lt!133429))))))

(assert (=> d!63643 (= (isStrictlySorted!364 lt!133429) e!171053)))

(declare-fun b!264015 () Bool)

(declare-fun e!171054 () Bool)

(assert (=> b!264015 (= e!171053 e!171054)))

(declare-fun res!128885 () Bool)

(assert (=> b!264015 (=> (not res!128885) (not e!171054))))

(assert (=> b!264015 (= res!128885 (bvslt (_1!2454 (h!4425 lt!133429)) (_1!2454 (h!4425 (t!8832 lt!133429)))))))

(declare-fun b!264016 () Bool)

(assert (=> b!264016 (= e!171054 (isStrictlySorted!364 (t!8832 lt!133429)))))

(assert (= (and d!63643 (not res!128884)) b!264015))

(assert (= (and b!264015 res!128885) b!264016))

(declare-fun m!280765 () Bool)

(assert (=> b!264016 m!280765))

(assert (=> d!63293 d!63643))

(declare-fun d!63645 () Bool)

(declare-fun res!128886 () Bool)

(declare-fun e!171055 () Bool)

(assert (=> d!63645 (=> res!128886 e!171055)))

(assert (=> d!63645 (= res!128886 (or ((_ is Nil!3760) (toList!1916 (map!2747 thiss!1504))) ((_ is Nil!3760) (t!8832 (toList!1916 (map!2747 thiss!1504))))))))

(assert (=> d!63645 (= (isStrictlySorted!364 (toList!1916 (map!2747 thiss!1504))) e!171055)))

(declare-fun b!264017 () Bool)

(declare-fun e!171056 () Bool)

(assert (=> b!264017 (= e!171055 e!171056)))

(declare-fun res!128887 () Bool)

(assert (=> b!264017 (=> (not res!128887) (not e!171056))))

(assert (=> b!264017 (= res!128887 (bvslt (_1!2454 (h!4425 (toList!1916 (map!2747 thiss!1504)))) (_1!2454 (h!4425 (t!8832 (toList!1916 (map!2747 thiss!1504)))))))))

(declare-fun b!264018 () Bool)

(assert (=> b!264018 (= e!171056 (isStrictlySorted!364 (t!8832 (toList!1916 (map!2747 thiss!1504)))))))

(assert (= (and d!63645 (not res!128886)) b!264017))

(assert (= (and b!264017 res!128887) b!264018))

(declare-fun m!280767 () Bool)

(assert (=> b!264018 m!280767))

(assert (=> d!63293 d!63645))

(declare-fun d!63647 () Bool)

(assert (=> d!63647 (= (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) lt!133314)) (v!5509 (getValueByKey!321 (toList!1916 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) lt!133314)))))

(assert (=> d!63247 d!63647))

(declare-fun b!264022 () Bool)

(declare-fun e!171058 () Option!327)

(assert (=> b!264022 (= e!171058 None!325)))

(declare-fun b!264020 () Bool)

(declare-fun e!171057 () Option!327)

(assert (=> b!264020 (= e!171057 e!171058)))

(declare-fun c!45119 () Bool)

(assert (=> b!264020 (= c!45119 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))) (not (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))) lt!133314))))))

(declare-fun b!264021 () Bool)

(assert (=> b!264021 (= e!171058 (getValueByKey!321 (t!8832 (toList!1916 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))) lt!133314))))

(declare-fun c!45118 () Bool)

(declare-fun d!63649 () Bool)

(assert (=> d!63649 (= c!45118 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))) (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))) lt!133314)))))

(assert (=> d!63649 (= (getValueByKey!321 (toList!1916 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) lt!133314) e!171057)))

(declare-fun b!264019 () Bool)

(assert (=> b!264019 (= e!171057 (Some!326 (_2!2454 (h!4425 (toList!1916 (+!712 lt!133305 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))))))

(assert (= (and d!63649 c!45118) b!264019))

(assert (= (and d!63649 (not c!45118)) b!264020))

(assert (= (and b!264020 c!45119) b!264021))

(assert (= (and b!264020 (not c!45119)) b!264022))

(declare-fun m!280769 () Bool)

(assert (=> b!264021 m!280769))

(assert (=> d!63247 d!63649))

(declare-fun b!264023 () Bool)

(declare-fun e!171059 () SeekEntryResult!1164)

(assert (=> b!264023 (= e!171059 (Intermediate!1164 true (toIndex!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (mask!11208 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!264024 () Bool)

(declare-fun e!171060 () SeekEntryResult!1164)

(assert (=> b!264024 (= e!171060 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11208 thiss!1504)) (select (arr!5996 lt!133005) #b00000000000000000000000000000000) lt!133005 (mask!11208 thiss!1504)))))

(declare-fun b!264025 () Bool)

(declare-fun e!171063 () Bool)

(declare-fun lt!133685 () SeekEntryResult!1164)

(assert (=> b!264025 (= e!171063 (bvsge (x!25206 lt!133685) #b01111111111111111111111111111110))))

(declare-fun b!264026 () Bool)

(declare-fun e!171062 () Bool)

(assert (=> b!264026 (= e!171063 e!171062)))

(declare-fun res!128890 () Bool)

(assert (=> b!264026 (= res!128890 (and ((_ is Intermediate!1164) lt!133685) (not (undefined!1976 lt!133685)) (bvslt (x!25206 lt!133685) #b01111111111111111111111111111110) (bvsge (x!25206 lt!133685) #b00000000000000000000000000000000) (bvsge (x!25206 lt!133685) #b00000000000000000000000000000000)))))

(assert (=> b!264026 (=> (not res!128890) (not e!171062))))

(declare-fun b!264027 () Bool)

(assert (=> b!264027 (and (bvsge (index!6828 lt!133685) #b00000000000000000000000000000000) (bvslt (index!6828 lt!133685) (size!6347 lt!133005)))))

(declare-fun res!128889 () Bool)

(assert (=> b!264027 (= res!128889 (= (select (arr!5996 lt!133005) (index!6828 lt!133685)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171061 () Bool)

(assert (=> b!264027 (=> res!128889 e!171061)))

(declare-fun b!264028 () Bool)

(assert (=> b!264028 (and (bvsge (index!6828 lt!133685) #b00000000000000000000000000000000) (bvslt (index!6828 lt!133685) (size!6347 lt!133005)))))

(assert (=> b!264028 (= e!171061 (= (select (arr!5996 lt!133005) (index!6828 lt!133685)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264029 () Bool)

(assert (=> b!264029 (= e!171059 e!171060)))

(declare-fun c!45122 () Bool)

(declare-fun lt!133686 () (_ BitVec 64))

(assert (=> b!264029 (= c!45122 (or (= lt!133686 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) (= (bvadd lt!133686 lt!133686) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264030 () Bool)

(assert (=> b!264030 (= e!171060 (Intermediate!1164 false (toIndex!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (mask!11208 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!264031 () Bool)

(assert (=> b!264031 (and (bvsge (index!6828 lt!133685) #b00000000000000000000000000000000) (bvslt (index!6828 lt!133685) (size!6347 lt!133005)))))

(declare-fun res!128888 () Bool)

(assert (=> b!264031 (= res!128888 (= (select (arr!5996 lt!133005) (index!6828 lt!133685)) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (=> b!264031 (=> res!128888 e!171061)))

(assert (=> b!264031 (= e!171062 e!171061)))

(declare-fun d!63651 () Bool)

(assert (=> d!63651 e!171063))

(declare-fun c!45121 () Bool)

(assert (=> d!63651 (= c!45121 (and ((_ is Intermediate!1164) lt!133685) (undefined!1976 lt!133685)))))

(assert (=> d!63651 (= lt!133685 e!171059)))

(declare-fun c!45120 () Bool)

(assert (=> d!63651 (= c!45120 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!63651 (= lt!133686 (select (arr!5996 lt!133005) (toIndex!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (mask!11208 thiss!1504))))))

(assert (=> d!63651 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (mask!11208 thiss!1504)) (select (arr!5996 lt!133005) #b00000000000000000000000000000000) lt!133005 (mask!11208 thiss!1504)) lt!133685)))

(assert (= (and d!63651 c!45120) b!264023))

(assert (= (and d!63651 (not c!45120)) b!264029))

(assert (= (and b!264029 c!45122) b!264030))

(assert (= (and b!264029 (not c!45122)) b!264024))

(assert (= (and d!63651 c!45121) b!264025))

(assert (= (and d!63651 (not c!45121)) b!264026))

(assert (= (and b!264026 res!128890) b!264031))

(assert (= (and b!264031 (not res!128888)) b!264027))

(assert (= (and b!264027 (not res!128889)) b!264028))

(declare-fun m!280771 () Bool)

(assert (=> b!264027 m!280771))

(assert (=> d!63651 m!280197))

(declare-fun m!280773 () Bool)

(assert (=> d!63651 m!280773))

(assert (=> d!63651 m!279317))

(assert (=> b!264028 m!280771))

(assert (=> b!264024 m!280197))

(declare-fun m!280775 () Bool)

(assert (=> b!264024 m!280775))

(assert (=> b!264024 m!280775))

(assert (=> b!264024 m!279433))

(declare-fun m!280777 () Bool)

(assert (=> b!264024 m!280777))

(assert (=> b!264031 m!280771))

(assert (=> d!63433 d!63651))

(declare-fun d!63653 () Bool)

(declare-fun lt!133688 () (_ BitVec 32))

(declare-fun lt!133687 () (_ BitVec 32))

(assert (=> d!63653 (= lt!133688 (bvmul (bvxor lt!133687 (bvlshr lt!133687 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!63653 (= lt!133687 ((_ extract 31 0) (bvand (bvxor (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (bvlshr (select (arr!5996 lt!133005) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!63653 (and (bvsge (mask!11208 thiss!1504) #b00000000000000000000000000000000) (let ((res!128627 (let ((h!4429 ((_ extract 31 0) (bvand (bvxor (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (bvlshr (select (arr!5996 lt!133005) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!25231 (bvmul (bvxor h!4429 (bvlshr h!4429 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!25231 (bvlshr x!25231 #b00000000000000000000000000001101)) (mask!11208 thiss!1504)))))) (and (bvslt res!128627 (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!128627 #b00000000000000000000000000000000))))))

(assert (=> d!63653 (= (toIndex!0 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (mask!11208 thiss!1504)) (bvand (bvxor lt!133688 (bvlshr lt!133688 #b00000000000000000000000000001101)) (mask!11208 thiss!1504)))))

(assert (=> d!63433 d!63653))

(assert (=> d!63433 d!63237))

(assert (=> b!263589 d!63633))

(declare-fun d!63655 () Bool)

(declare-fun res!128891 () Bool)

(declare-fun e!171064 () Bool)

(assert (=> d!63655 (=> res!128891 e!171064)))

(assert (=> d!63655 (= res!128891 (and ((_ is Cons!3759) (toList!1916 lt!133300)) (= (_1!2454 (h!4425 (toList!1916 lt!133300))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63655 (= (containsKey!312 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000) e!171064)))

(declare-fun b!264032 () Bool)

(declare-fun e!171065 () Bool)

(assert (=> b!264032 (= e!171064 e!171065)))

(declare-fun res!128892 () Bool)

(assert (=> b!264032 (=> (not res!128892) (not e!171065))))

(assert (=> b!264032 (= res!128892 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133300))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133300))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3759) (toList!1916 lt!133300)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133300))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264033 () Bool)

(assert (=> b!264033 (= e!171065 (containsKey!312 (t!8832 (toList!1916 lt!133300)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63655 (not res!128891)) b!264032))

(assert (= (and b!264032 res!128892) b!264033))

(declare-fun m!280779 () Bool)

(assert (=> b!264033 m!280779))

(assert (=> d!63229 d!63655))

(declare-fun d!63657 () Bool)

(assert (=> d!63657 (= (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) lt!133306)) (v!5509 (getValueByKey!321 (toList!1916 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) lt!133306)))))

(assert (=> d!63265 d!63657))

(declare-fun b!264037 () Bool)

(declare-fun e!171067 () Option!327)

(assert (=> b!264037 (= e!171067 None!325)))

(declare-fun b!264035 () Bool)

(declare-fun e!171066 () Option!327)

(assert (=> b!264035 (= e!171066 e!171067)))

(declare-fun c!45124 () Bool)

(assert (=> b!264035 (= c!45124 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))) (not (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))) lt!133306))))))

(declare-fun b!264036 () Bool)

(assert (=> b!264036 (= e!171067 (getValueByKey!321 (t!8832 (toList!1916 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))) lt!133306))))

(declare-fun d!63659 () Bool)

(declare-fun c!45123 () Bool)

(assert (=> d!63659 (= c!45123 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))) (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))) lt!133306)))))

(assert (=> d!63659 (= (getValueByKey!321 (toList!1916 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) lt!133306) e!171066)))

(declare-fun b!264034 () Bool)

(assert (=> b!264034 (= e!171066 (Some!326 (_2!2454 (h!4425 (toList!1916 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))))))

(assert (= (and d!63659 c!45123) b!264034))

(assert (= (and d!63659 (not c!45123)) b!264035))

(assert (= (and b!264035 c!45124) b!264036))

(assert (= (and b!264035 (not c!45124)) b!264037))

(declare-fun m!280781 () Bool)

(assert (=> b!264036 m!280781))

(assert (=> d!63265 d!63659))

(declare-fun d!63661 () Bool)

(assert (=> d!63661 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133689 () Unit!8164)

(assert (=> d!63661 (= lt!133689 (choose!1303 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171068 () Bool)

(assert (=> d!63661 e!171068))

(declare-fun res!128893 () Bool)

(assert (=> d!63661 (=> (not res!128893) (not e!171068))))

(assert (=> d!63661 (= res!128893 (isStrictlySorted!364 (toList!1916 lt!133244)))))

(assert (=> d!63661 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000) lt!133689)))

(declare-fun b!264038 () Bool)

(assert (=> b!264038 (= e!171068 (containsKey!312 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63661 res!128893) b!264038))

(assert (=> d!63661 m!279831))

(assert (=> d!63661 m!279831))

(assert (=> d!63661 m!280025))

(declare-fun m!280783 () Bool)

(assert (=> d!63661 m!280783))

(declare-fun m!280785 () Bool)

(assert (=> d!63661 m!280785))

(assert (=> b!264038 m!280021))

(assert (=> b!263616 d!63661))

(declare-fun d!63663 () Bool)

(assert (=> d!63663 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9320 () Bool)

(assert (= bs!9320 d!63663))

(assert (=> bs!9320 m!279831))

(declare-fun m!280787 () Bool)

(assert (=> bs!9320 m!280787))

(assert (=> b!263616 d!63663))

(declare-fun b!264042 () Bool)

(declare-fun e!171070 () Option!327)

(assert (=> b!264042 (= e!171070 None!325)))

(declare-fun b!264040 () Bool)

(declare-fun e!171069 () Option!327)

(assert (=> b!264040 (= e!171069 e!171070)))

(declare-fun c!45126 () Bool)

(assert (=> b!264040 (= c!45126 (and ((_ is Cons!3759) (toList!1916 lt!133244)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133244))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!264041 () Bool)

(assert (=> b!264041 (= e!171070 (getValueByKey!321 (t!8832 (toList!1916 lt!133244)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!63665 () Bool)

(declare-fun c!45125 () Bool)

(assert (=> d!63665 (= c!45125 (and ((_ is Cons!3759) (toList!1916 lt!133244)) (= (_1!2454 (h!4425 (toList!1916 lt!133244))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63665 (= (getValueByKey!321 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000) e!171069)))

(declare-fun b!264039 () Bool)

(assert (=> b!264039 (= e!171069 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133244)))))))

(assert (= (and d!63665 c!45125) b!264039))

(assert (= (and d!63665 (not c!45125)) b!264040))

(assert (= (and b!264040 c!45126) b!264041))

(assert (= (and b!264040 (not c!45126)) b!264042))

(declare-fun m!280789 () Bool)

(assert (=> b!264041 m!280789))

(assert (=> b!263616 d!63665))

(declare-fun d!63667 () Bool)

(assert (=> d!63667 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298))))

(declare-fun lt!133690 () Unit!8164)

(assert (=> d!63667 (= lt!133690 (choose!1303 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298))))

(declare-fun e!171071 () Bool)

(assert (=> d!63667 e!171071))

(declare-fun res!128894 () Bool)

(assert (=> d!63667 (=> (not res!128894) (not e!171071))))

(assert (=> d!63667 (= res!128894 (isStrictlySorted!364 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63667 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298) lt!133690)))

(declare-fun b!264043 () Bool)

(assert (=> b!264043 (= e!171071 (containsKey!312 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298))))

(assert (= (and d!63667 res!128894) b!264043))

(assert (=> d!63667 m!279705))

(assert (=> d!63667 m!279705))

(assert (=> d!63667 m!279707))

(declare-fun m!280791 () Bool)

(assert (=> d!63667 m!280791))

(declare-fun m!280793 () Bool)

(assert (=> d!63667 m!280793))

(assert (=> b!264043 m!279701))

(assert (=> b!263414 d!63667))

(declare-fun d!63669 () Bool)

(assert (=> d!63669 (= (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298)) (not (isEmpty!547 (getValueByKey!321 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298))))))

(declare-fun bs!9321 () Bool)

(assert (= bs!9321 d!63669))

(assert (=> bs!9321 m!279705))

(declare-fun m!280795 () Bool)

(assert (=> bs!9321 m!280795))

(assert (=> b!263414 d!63669))

(declare-fun b!264047 () Bool)

(declare-fun e!171073 () Option!327)

(assert (=> b!264047 (= e!171073 None!325)))

(declare-fun b!264045 () Bool)

(declare-fun e!171072 () Option!327)

(assert (=> b!264045 (= e!171072 e!171073)))

(declare-fun c!45128 () Bool)

(assert (=> b!264045 (= c!45128 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))) (not (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))) lt!133298))))))

(declare-fun b!264046 () Bool)

(assert (=> b!264046 (= e!171073 (getValueByKey!321 (t!8832 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))) lt!133298))))

(declare-fun c!45127 () Bool)

(declare-fun d!63671 () Bool)

(assert (=> d!63671 (= c!45127 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))) (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))) lt!133298)))))

(assert (=> d!63671 (= (getValueByKey!321 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298) e!171072)))

(declare-fun b!264044 () Bool)

(assert (=> b!264044 (= e!171072 (Some!326 (_2!2454 (h!4425 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))))))))

(assert (= (and d!63671 c!45127) b!264044))

(assert (= (and d!63671 (not c!45127)) b!264045))

(assert (= (and b!264045 c!45128) b!264046))

(assert (= (and b!264045 (not c!45128)) b!264047))

(declare-fun m!280797 () Bool)

(assert (=> b!264046 m!280797))

(assert (=> b!263414 d!63671))

(declare-fun d!63673 () Bool)

(assert (=> d!63673 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133257) lt!133260)) (v!5509 (getValueByKey!321 (toList!1916 lt!133257) lt!133260)))))

(assert (=> d!63395 d!63673))

(declare-fun b!264051 () Bool)

(declare-fun e!171075 () Option!327)

(assert (=> b!264051 (= e!171075 None!325)))

(declare-fun b!264049 () Bool)

(declare-fun e!171074 () Option!327)

(assert (=> b!264049 (= e!171074 e!171075)))

(declare-fun c!45130 () Bool)

(assert (=> b!264049 (= c!45130 (and ((_ is Cons!3759) (toList!1916 lt!133257)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133257))) lt!133260))))))

(declare-fun b!264050 () Bool)

(assert (=> b!264050 (= e!171075 (getValueByKey!321 (t!8832 (toList!1916 lt!133257)) lt!133260))))

(declare-fun d!63675 () Bool)

(declare-fun c!45129 () Bool)

(assert (=> d!63675 (= c!45129 (and ((_ is Cons!3759) (toList!1916 lt!133257)) (= (_1!2454 (h!4425 (toList!1916 lt!133257))) lt!133260)))))

(assert (=> d!63675 (= (getValueByKey!321 (toList!1916 lt!133257) lt!133260) e!171074)))

(declare-fun b!264048 () Bool)

(assert (=> b!264048 (= e!171074 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133257)))))))

(assert (= (and d!63675 c!45129) b!264048))

(assert (= (and d!63675 (not c!45129)) b!264049))

(assert (= (and b!264049 c!45130) b!264050))

(assert (= (and b!264049 (not c!45130)) b!264051))

(declare-fun m!280799 () Bool)

(assert (=> b!264050 m!280799))

(assert (=> d!63395 d!63675))

(declare-fun d!63677 () Bool)

(declare-fun res!128895 () Bool)

(declare-fun e!171076 () Bool)

(assert (=> d!63677 (=> res!128895 e!171076)))

(assert (=> d!63677 (= res!128895 (and ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (= (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) key!932)))))

(assert (=> d!63677 (= (containsKey!312 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932) e!171076)))

(declare-fun b!264052 () Bool)

(declare-fun e!171077 () Bool)

(assert (=> b!264052 (= e!171076 e!171077)))

(declare-fun res!128896 () Bool)

(assert (=> b!264052 (=> (not res!128896) (not e!171077))))

(assert (=> b!264052 (= res!128896 (and (or (not ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (bvsle (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) key!932)) ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (bvslt (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) key!932)))))

(declare-fun b!264053 () Bool)

(assert (=> b!264053 (= e!171077 (containsKey!312 (t!8832 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) key!932))))

(assert (= (and d!63677 (not res!128895)) b!264052))

(assert (= (and b!264052 res!128896) b!264053))

(declare-fun m!280801 () Bool)

(assert (=> b!264053 m!280801))

(assert (=> d!63233 d!63677))

(assert (=> b!263547 d!63285))

(declare-fun d!63679 () Bool)

(assert (=> d!63679 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242))))

(declare-fun lt!133691 () Unit!8164)

(assert (=> d!63679 (= lt!133691 (choose!1303 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242))))

(declare-fun e!171078 () Bool)

(assert (=> d!63679 e!171078))

(declare-fun res!128897 () Bool)

(assert (=> d!63679 (=> (not res!128897) (not e!171078))))

(assert (=> d!63679 (= res!128897 (isStrictlySorted!364 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63679 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242) lt!133691)))

(declare-fun b!264054 () Bool)

(assert (=> b!264054 (= e!171078 (containsKey!312 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242))))

(assert (= (and d!63679 res!128897) b!264054))

(assert (=> d!63679 m!280105))

(assert (=> d!63679 m!280105))

(assert (=> d!63679 m!280107))

(declare-fun m!280803 () Bool)

(assert (=> d!63679 m!280803))

(declare-fun m!280805 () Bool)

(assert (=> d!63679 m!280805))

(assert (=> b!264054 m!280101))

(assert (=> b!263647 d!63679))

(declare-fun d!63681 () Bool)

(assert (=> d!63681 (= (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242)) (not (isEmpty!547 (getValueByKey!321 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242))))))

(declare-fun bs!9322 () Bool)

(assert (= bs!9322 d!63681))

(assert (=> bs!9322 m!280105))

(declare-fun m!280807 () Bool)

(assert (=> bs!9322 m!280807))

(assert (=> b!263647 d!63681))

(declare-fun b!264058 () Bool)

(declare-fun e!171080 () Option!327)

(assert (=> b!264058 (= e!171080 None!325)))

(declare-fun b!264056 () Bool)

(declare-fun e!171079 () Option!327)

(assert (=> b!264056 (= e!171079 e!171080)))

(declare-fun c!45132 () Bool)

(assert (=> b!264056 (= c!45132 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))) (not (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))) lt!133242))))))

(declare-fun b!264057 () Bool)

(assert (=> b!264057 (= e!171080 (getValueByKey!321 (t!8832 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))) lt!133242))))

(declare-fun c!45131 () Bool)

(declare-fun d!63683 () Bool)

(assert (=> d!63683 (= c!45131 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))) (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))) lt!133242)))))

(assert (=> d!63683 (= (getValueByKey!321 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242) e!171079)))

(declare-fun b!264055 () Bool)

(assert (=> b!264055 (= e!171079 (Some!326 (_2!2454 (h!4425 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))))

(assert (= (and d!63683 c!45131) b!264055))

(assert (= (and d!63683 (not c!45131)) b!264056))

(assert (= (and b!264056 c!45132) b!264057))

(assert (= (and b!264056 (not c!45132)) b!264058))

(declare-fun m!280809 () Bool)

(assert (=> b!264057 m!280809))

(assert (=> b!263647 d!63683))

(declare-fun d!63685 () Bool)

(declare-fun lt!133692 () Bool)

(assert (=> d!63685 (= lt!133692 (select (content!178 lt!133266) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun e!171082 () Bool)

(assert (=> d!63685 (= lt!133692 e!171082)))

(declare-fun res!128899 () Bool)

(assert (=> d!63685 (=> (not res!128899) (not e!171082))))

(assert (=> d!63685 (= res!128899 ((_ is Cons!3759) lt!133266))))

(assert (=> d!63685 (= (contains!1888 lt!133266 (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))) lt!133692)))

(declare-fun b!264059 () Bool)

(declare-fun e!171081 () Bool)

(assert (=> b!264059 (= e!171082 e!171081)))

(declare-fun res!128898 () Bool)

(assert (=> b!264059 (=> res!128898 e!171081)))

(assert (=> b!264059 (= res!128898 (= (h!4425 lt!133266) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun b!264060 () Bool)

(assert (=> b!264060 (= e!171081 (contains!1888 (t!8832 lt!133266) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(assert (= (and d!63685 res!128899) b!264059))

(assert (= (and b!264059 (not res!128898)) b!264060))

(declare-fun m!280811 () Bool)

(assert (=> d!63685 m!280811))

(declare-fun m!280813 () Bool)

(assert (=> d!63685 m!280813))

(declare-fun m!280815 () Bool)

(assert (=> b!264060 m!280815))

(assert (=> b!263605 d!63685))

(declare-fun b!264061 () Bool)

(declare-fun res!128900 () Bool)

(declare-fun e!171085 () Bool)

(assert (=> b!264061 (=> (not res!128900) (not e!171085))))

(declare-fun lt!133695 () ListLongMap!3801)

(assert (=> b!264061 (= res!128900 (not (contains!1885 lt!133695 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264062 () Bool)

(declare-fun e!171086 () Bool)

(assert (=> b!264062 (= e!171085 e!171086)))

(declare-fun c!45135 () Bool)

(declare-fun e!171089 () Bool)

(assert (=> b!264062 (= c!45135 e!171089)))

(declare-fun res!128903 () Bool)

(assert (=> b!264062 (=> (not res!128903) (not e!171089))))

(assert (=> b!264062 (= res!128903 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(declare-fun b!264063 () Bool)

(declare-fun e!171083 () ListLongMap!3801)

(declare-fun e!171087 () ListLongMap!3801)

(assert (=> b!264063 (= e!171083 e!171087)))

(declare-fun c!45136 () Bool)

(assert (=> b!264063 (= c!45136 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264064 () Bool)

(declare-fun call!25259 () ListLongMap!3801)

(assert (=> b!264064 (= e!171087 call!25259)))

(declare-fun b!264065 () Bool)

(declare-fun e!171084 () Bool)

(assert (=> b!264065 (= e!171084 (isEmpty!546 lt!133695))))

(declare-fun d!63687 () Bool)

(assert (=> d!63687 e!171085))

(declare-fun res!128901 () Bool)

(assert (=> d!63687 (=> (not res!128901) (not e!171085))))

(assert (=> d!63687 (= res!128901 (not (contains!1885 lt!133695 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63687 (= lt!133695 e!171083)))

(declare-fun c!45134 () Bool)

(assert (=> d!63687 (= c!45134 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(assert (=> d!63687 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63687 (= (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)) lt!133695)))

(declare-fun b!264066 () Bool)

(assert (=> b!264066 (= e!171089 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264066 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!264067 () Bool)

(assert (=> b!264067 (= e!171083 (ListLongMap!3802 Nil!3760))))

(declare-fun bm!25256 () Bool)

(assert (=> bm!25256 (= call!25259 (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504)))))

(declare-fun b!264068 () Bool)

(assert (=> b!264068 (= e!171086 e!171084)))

(declare-fun c!45133 () Bool)

(assert (=> b!264068 (= c!45133 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(declare-fun b!264069 () Bool)

(assert (=> b!264069 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(assert (=> b!264069 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6346 lt!133020)))))

(declare-fun e!171088 () Bool)

(assert (=> b!264069 (= e!171088 (= (apply!262 lt!133695 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!3099 (select (arr!5995 lt!133020) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!264070 () Bool)

(declare-fun lt!133694 () Unit!8164)

(declare-fun lt!133693 () Unit!8164)

(assert (=> b!264070 (= lt!133694 lt!133693)))

(declare-fun lt!133699 () (_ BitVec 64))

(declare-fun lt!133697 () ListLongMap!3801)

(declare-fun lt!133696 () (_ BitVec 64))

(declare-fun lt!133698 () V!8521)

(assert (=> b!264070 (not (contains!1885 (+!712 lt!133697 (tuple2!4887 lt!133696 lt!133698)) lt!133699))))

(assert (=> b!264070 (= lt!133693 (addStillNotContains!131 lt!133697 lt!133696 lt!133698 lt!133699))))

(assert (=> b!264070 (= lt!133699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!264070 (= lt!133698 (get!3099 (select (arr!5995 lt!133020) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!264070 (= lt!133696 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!264070 (= lt!133697 call!25259)))

(assert (=> b!264070 (= e!171087 (+!712 call!25259 (tuple2!4887 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!3099 (select (arr!5995 lt!133020) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!264071 () Bool)

(assert (=> b!264071 (= e!171084 (= lt!133695 (getCurrentListMapNoExtraKeys!578 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!4842 thiss!1504))))))

(declare-fun b!264072 () Bool)

(assert (=> b!264072 (= e!171086 e!171088)))

(assert (=> b!264072 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(declare-fun res!128902 () Bool)

(assert (=> b!264072 (= res!128902 (contains!1885 lt!133695 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264072 (=> (not res!128902) (not e!171088))))

(assert (= (and d!63687 c!45134) b!264067))

(assert (= (and d!63687 (not c!45134)) b!264063))

(assert (= (and b!264063 c!45136) b!264070))

(assert (= (and b!264063 (not c!45136)) b!264064))

(assert (= (or b!264070 b!264064) bm!25256))

(assert (= (and d!63687 res!128901) b!264061))

(assert (= (and b!264061 res!128900) b!264062))

(assert (= (and b!264062 res!128903) b!264066))

(assert (= (and b!264062 c!45135) b!264072))

(assert (= (and b!264062 (not c!45135)) b!264068))

(assert (= (and b!264072 res!128902) b!264069))

(assert (= (and b!264068 c!45133) b!264071))

(assert (= (and b!264068 (not c!45133)) b!264065))

(declare-fun b_lambda!8391 () Bool)

(assert (=> (not b_lambda!8391) (not b!264069)))

(assert (=> b!264069 t!8837))

(declare-fun b_and!13979 () Bool)

(assert (= b_and!13977 (and (=> t!8837 result!5425) b_and!13979)))

(declare-fun b_lambda!8393 () Bool)

(assert (=> (not b_lambda!8393) (not b!264070)))

(assert (=> b!264070 t!8837))

(declare-fun b_and!13981 () Bool)

(assert (= b_and!13979 (and (=> t!8837 result!5425) b_and!13981)))

(declare-fun m!280817 () Bool)

(assert (=> b!264065 m!280817))

(assert (=> b!264066 m!279845))

(assert (=> b!264066 m!279845))

(assert (=> b!264066 m!279847))

(declare-fun m!280819 () Bool)

(assert (=> b!264071 m!280819))

(assert (=> b!264063 m!279845))

(assert (=> b!264063 m!279845))

(assert (=> b!264063 m!279847))

(declare-fun m!280821 () Bool)

(assert (=> b!264069 m!280821))

(assert (=> b!264069 m!279845))

(assert (=> b!264069 m!279845))

(declare-fun m!280823 () Bool)

(assert (=> b!264069 m!280823))

(assert (=> b!264069 m!280821))

(assert (=> b!264069 m!279383))

(declare-fun m!280825 () Bool)

(assert (=> b!264069 m!280825))

(assert (=> b!264069 m!279383))

(declare-fun m!280827 () Bool)

(assert (=> d!63687 m!280827))

(assert (=> d!63687 m!279317))

(declare-fun m!280829 () Bool)

(assert (=> b!264061 m!280829))

(assert (=> bm!25256 m!280819))

(assert (=> b!264072 m!279845))

(assert (=> b!264072 m!279845))

(declare-fun m!280831 () Bool)

(assert (=> b!264072 m!280831))

(declare-fun m!280833 () Bool)

(assert (=> b!264070 m!280833))

(assert (=> b!264070 m!280821))

(declare-fun m!280835 () Bool)

(assert (=> b!264070 m!280835))

(assert (=> b!264070 m!279845))

(assert (=> b!264070 m!280835))

(declare-fun m!280837 () Bool)

(assert (=> b!264070 m!280837))

(declare-fun m!280839 () Bool)

(assert (=> b!264070 m!280839))

(assert (=> b!264070 m!280821))

(assert (=> b!264070 m!279383))

(assert (=> b!264070 m!280825))

(assert (=> b!264070 m!279383))

(assert (=> b!263406 d!63687))

(declare-fun d!63689 () Bool)

(declare-fun lt!133700 () Bool)

(assert (=> d!63689 (= lt!133700 (select (content!178 lt!133429) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun e!171091 () Bool)

(assert (=> d!63689 (= lt!133700 e!171091)))

(declare-fun res!128905 () Bool)

(assert (=> d!63689 (=> (not res!128905) (not e!171091))))

(assert (=> d!63689 (= res!128905 ((_ is Cons!3759) lt!133429))))

(assert (=> d!63689 (= (contains!1888 lt!133429 (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))) lt!133700)))

(declare-fun b!264073 () Bool)

(declare-fun e!171090 () Bool)

(assert (=> b!264073 (= e!171091 e!171090)))

(declare-fun res!128904 () Bool)

(assert (=> b!264073 (=> res!128904 e!171090)))

(assert (=> b!264073 (= res!128904 (= (h!4425 lt!133429) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun b!264074 () Bool)

(assert (=> b!264074 (= e!171090 (contains!1888 (t!8832 lt!133429) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(assert (= (and d!63689 res!128905) b!264073))

(assert (= (and b!264073 (not res!128904)) b!264074))

(declare-fun m!280841 () Bool)

(assert (=> d!63689 m!280841))

(declare-fun m!280843 () Bool)

(assert (=> d!63689 m!280843))

(declare-fun m!280845 () Bool)

(assert (=> b!264074 m!280845))

(assert (=> b!263482 d!63689))

(declare-fun lt!133701 () Bool)

(declare-fun d!63691 () Bool)

(assert (=> d!63691 (= lt!133701 (select (content!177 Nil!3761) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!171093 () Bool)

(assert (=> d!63691 (= lt!133701 e!171093)))

(declare-fun res!128907 () Bool)

(assert (=> d!63691 (=> (not res!128907) (not e!171093))))

(assert (=> d!63691 (= res!128907 ((_ is Cons!3760) Nil!3761))))

(assert (=> d!63691 (= (contains!1889 Nil!3761 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)) lt!133701)))

(declare-fun b!264075 () Bool)

(declare-fun e!171092 () Bool)

(assert (=> b!264075 (= e!171093 e!171092)))

(declare-fun res!128906 () Bool)

(assert (=> b!264075 (=> res!128906 e!171092)))

(assert (=> b!264075 (= res!128906 (= (h!4426 Nil!3761) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!264076 () Bool)

(assert (=> b!264076 (= e!171092 (contains!1889 (t!8833 Nil!3761) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!63691 res!128907) b!264075))

(assert (= (and b!264075 (not res!128906)) b!264076))

(assert (=> d!63691 m!279781))

(assert (=> d!63691 m!279611))

(declare-fun m!280847 () Bool)

(assert (=> d!63691 m!280847))

(assert (=> b!264076 m!279611))

(declare-fun m!280849 () Bool)

(assert (=> b!264076 m!280849))

(assert (=> b!263328 d!63691))

(assert (=> b!263674 d!63469))

(declare-fun d!63693 () Bool)

(declare-fun res!128908 () Bool)

(declare-fun e!171094 () Bool)

(assert (=> d!63693 (=> res!128908 e!171094)))

(assert (=> d!63693 (= res!128908 (and ((_ is Cons!3759) (toList!1916 lt!133244)) (= (_1!2454 (h!4425 (toList!1916 lt!133244))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63693 (= (containsKey!312 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000) e!171094)))

(declare-fun b!264077 () Bool)

(declare-fun e!171095 () Bool)

(assert (=> b!264077 (= e!171094 e!171095)))

(declare-fun res!128909 () Bool)

(assert (=> b!264077 (=> (not res!128909) (not e!171095))))

(assert (=> b!264077 (= res!128909 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133244))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133244))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3759) (toList!1916 lt!133244)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133244))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264078 () Bool)

(assert (=> b!264078 (= e!171095 (containsKey!312 (t!8832 (toList!1916 lt!133244)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63693 (not res!128908)) b!264077))

(assert (= (and b!264077 res!128909) b!264078))

(declare-fun m!280851 () Bool)

(assert (=> b!264078 m!280851))

(assert (=> d!63363 d!63693))

(assert (=> d!63405 d!63407))

(assert (=> d!63405 d!63409))

(declare-fun d!63695 () Bool)

(assert (=> d!63695 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133003) key!932))))

(assert (=> d!63695 true))

(declare-fun _$12!454 () Unit!8164)

(assert (=> d!63695 (= (choose!1303 (toList!1916 lt!133003) key!932) _$12!454)))

(declare-fun bs!9323 () Bool)

(assert (= bs!9323 d!63695))

(assert (=> bs!9323 m!279565))

(assert (=> bs!9323 m!279565))

(assert (=> bs!9323 m!279567))

(assert (=> d!63405 d!63695))

(declare-fun d!63697 () Bool)

(declare-fun res!128910 () Bool)

(declare-fun e!171096 () Bool)

(assert (=> d!63697 (=> res!128910 e!171096)))

(assert (=> d!63697 (= res!128910 (or ((_ is Nil!3760) (toList!1916 lt!133003)) ((_ is Nil!3760) (t!8832 (toList!1916 lt!133003)))))))

(assert (=> d!63697 (= (isStrictlySorted!364 (toList!1916 lt!133003)) e!171096)))

(declare-fun b!264079 () Bool)

(declare-fun e!171097 () Bool)

(assert (=> b!264079 (= e!171096 e!171097)))

(declare-fun res!128911 () Bool)

(assert (=> b!264079 (=> (not res!128911) (not e!171097))))

(assert (=> b!264079 (= res!128911 (bvslt (_1!2454 (h!4425 (toList!1916 lt!133003))) (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133003))))))))

(declare-fun b!264080 () Bool)

(assert (=> b!264080 (= e!171097 (isStrictlySorted!364 (t!8832 (toList!1916 lt!133003))))))

(assert (= (and d!63697 (not res!128910)) b!264079))

(assert (= (and b!264079 res!128911) b!264080))

(declare-fun m!280853 () Bool)

(assert (=> b!264080 m!280853))

(assert (=> d!63405 d!63697))

(declare-fun d!63699 () Bool)

(declare-fun res!128912 () Bool)

(declare-fun e!171098 () Bool)

(assert (=> d!63699 (=> res!128912 e!171098)))

(assert (=> d!63699 (= res!128912 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))) (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))) lt!133242)))))

(assert (=> d!63699 (= (containsKey!312 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133242) e!171098)))

(declare-fun b!264081 () Bool)

(declare-fun e!171099 () Bool)

(assert (=> b!264081 (= e!171098 e!171099)))

(declare-fun res!128913 () Bool)

(assert (=> b!264081 (=> (not res!128913) (not e!171099))))

(assert (=> b!264081 (= res!128913 (and (or (not ((_ is Cons!3759) (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))) (bvsle (_1!2454 (h!4425 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))) lt!133242)) ((_ is Cons!3759) (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))) (bvslt (_1!2454 (h!4425 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))) lt!133242)))))

(declare-fun b!264082 () Bool)

(assert (=> b!264082 (= e!171099 (containsKey!312 (t!8832 (toList!1916 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))) lt!133242))))

(assert (= (and d!63699 (not res!128912)) b!264081))

(assert (= (and b!264081 res!128913) b!264082))

(declare-fun m!280855 () Bool)

(assert (=> b!264082 m!280855))

(assert (=> d!63387 d!63699))

(declare-fun d!63701 () Bool)

(declare-fun lt!133702 () Bool)

(assert (=> d!63701 (= lt!133702 (select (content!178 (toList!1916 lt!133577)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun e!171101 () Bool)

(assert (=> d!63701 (= lt!133702 e!171101)))

(declare-fun res!128915 () Bool)

(assert (=> d!63701 (=> (not res!128915) (not e!171101))))

(assert (=> d!63701 (= res!128915 ((_ is Cons!3759) (toList!1916 lt!133577)))))

(assert (=> d!63701 (= (contains!1888 (toList!1916 lt!133577) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) lt!133702)))

(declare-fun b!264083 () Bool)

(declare-fun e!171100 () Bool)

(assert (=> b!264083 (= e!171101 e!171100)))

(declare-fun res!128914 () Bool)

(assert (=> b!264083 (=> res!128914 e!171100)))

(assert (=> b!264083 (= res!128914 (= (h!4425 (toList!1916 lt!133577)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun b!264084 () Bool)

(assert (=> b!264084 (= e!171100 (contains!1888 (t!8832 (toList!1916 lt!133577)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(assert (= (and d!63701 res!128915) b!264083))

(assert (= (and b!264083 (not res!128914)) b!264084))

(declare-fun m!280857 () Bool)

(assert (=> d!63701 m!280857))

(declare-fun m!280859 () Bool)

(assert (=> d!63701 m!280859))

(declare-fun m!280861 () Bool)

(assert (=> b!264084 m!280861))

(assert (=> b!263743 d!63701))

(declare-fun d!63703 () Bool)

(assert (=> d!63703 (= (validMask!0 (mask!11208 lt!133011)) (and (or (= (mask!11208 lt!133011) #b00000000000000000000000000000111) (= (mask!11208 lt!133011) #b00000000000000000000000000001111) (= (mask!11208 lt!133011) #b00000000000000000000000000011111) (= (mask!11208 lt!133011) #b00000000000000000000000000111111) (= (mask!11208 lt!133011) #b00000000000000000000000001111111) (= (mask!11208 lt!133011) #b00000000000000000000000011111111) (= (mask!11208 lt!133011) #b00000000000000000000000111111111) (= (mask!11208 lt!133011) #b00000000000000000000001111111111) (= (mask!11208 lt!133011) #b00000000000000000000011111111111) (= (mask!11208 lt!133011) #b00000000000000000000111111111111) (= (mask!11208 lt!133011) #b00000000000000000001111111111111) (= (mask!11208 lt!133011) #b00000000000000000011111111111111) (= (mask!11208 lt!133011) #b00000000000000000111111111111111) (= (mask!11208 lt!133011) #b00000000000000001111111111111111) (= (mask!11208 lt!133011) #b00000000000000011111111111111111) (= (mask!11208 lt!133011) #b00000000000000111111111111111111) (= (mask!11208 lt!133011) #b00000000000001111111111111111111) (= (mask!11208 lt!133011) #b00000000000011111111111111111111) (= (mask!11208 lt!133011) #b00000000000111111111111111111111) (= (mask!11208 lt!133011) #b00000000001111111111111111111111) (= (mask!11208 lt!133011) #b00000000011111111111111111111111) (= (mask!11208 lt!133011) #b00000000111111111111111111111111) (= (mask!11208 lt!133011) #b00000001111111111111111111111111) (= (mask!11208 lt!133011) #b00000011111111111111111111111111) (= (mask!11208 lt!133011) #b00000111111111111111111111111111) (= (mask!11208 lt!133011) #b00001111111111111111111111111111) (= (mask!11208 lt!133011) #b00011111111111111111111111111111) (= (mask!11208 lt!133011) #b00111111111111111111111111111111)) (bvsle (mask!11208 lt!133011) #b00111111111111111111111111111111)))))

(assert (=> d!63439 d!63703))

(declare-fun d!63705 () Bool)

(assert (=> d!63705 (= (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133019) key!932)) (not ((_ is Some!326) (getValueByKey!321 (toList!1916 lt!133019) key!932))))))

(assert (=> d!63325 d!63705))

(declare-fun d!63707 () Bool)

(declare-fun res!128916 () Bool)

(declare-fun e!171102 () Bool)

(assert (=> d!63707 (=> res!128916 e!171102)))

(assert (=> d!63707 (= res!128916 (= (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!63707 (= (arrayContainsKey!0 lt!133005 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!171102)))

(declare-fun b!264085 () Bool)

(declare-fun e!171103 () Bool)

(assert (=> b!264085 (= e!171102 e!171103)))

(declare-fun res!128917 () Bool)

(assert (=> b!264085 (=> (not res!128917) (not e!171103))))

(assert (=> b!264085 (= res!128917 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(declare-fun b!264086 () Bool)

(assert (=> b!264086 (= e!171103 (arrayContainsKey!0 lt!133005 key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63707 (not res!128916)) b!264085))

(assert (= (and b!264085 res!128917) b!264086))

(declare-fun m!280863 () Bool)

(assert (=> d!63707 m!280863))

(declare-fun m!280865 () Bool)

(assert (=> b!264086 m!280865))

(assert (=> b!263672 d!63707))

(assert (=> b!263316 d!63595))

(assert (=> b!263316 d!63597))

(assert (=> b!263596 d!63469))

(assert (=> b!263436 d!63609))

(assert (=> b!263436 d!63443))

(declare-fun d!63709 () Bool)

(declare-fun res!128918 () Bool)

(declare-fun e!171104 () Bool)

(assert (=> d!63709 (=> res!128918 e!171104)))

(assert (=> d!63709 (= res!128918 (and ((_ is Cons!3759) lt!133266) (= (_1!2454 (h!4425 lt!133266)) (_1!2454 lt!133017))))))

(assert (=> d!63709 (= (containsKey!312 lt!133266 (_1!2454 lt!133017)) e!171104)))

(declare-fun b!264087 () Bool)

(declare-fun e!171105 () Bool)

(assert (=> b!264087 (= e!171104 e!171105)))

(declare-fun res!128919 () Bool)

(assert (=> b!264087 (=> (not res!128919) (not e!171105))))

(assert (=> b!264087 (= res!128919 (and (or (not ((_ is Cons!3759) lt!133266)) (bvsle (_1!2454 (h!4425 lt!133266)) (_1!2454 lt!133017))) ((_ is Cons!3759) lt!133266) (bvslt (_1!2454 (h!4425 lt!133266)) (_1!2454 lt!133017))))))

(declare-fun b!264088 () Bool)

(assert (=> b!264088 (= e!171105 (containsKey!312 (t!8832 lt!133266) (_1!2454 lt!133017)))))

(assert (= (and d!63709 (not res!128918)) b!264087))

(assert (= (and b!264087 res!128919) b!264088))

(declare-fun m!280867 () Bool)

(assert (=> b!264088 m!280867))

(assert (=> b!263604 d!63709))

(assert (=> b!263398 d!63225))

(declare-fun b!264089 () Bool)

(declare-fun e!171106 () (_ BitVec 32))

(assert (=> b!264089 (= e!171106 #b00000000000000000000000000000000)))

(declare-fun b!264090 () Bool)

(declare-fun e!171107 () (_ BitVec 32))

(assert (=> b!264090 (= e!171106 e!171107)))

(declare-fun c!45137 () Bool)

(assert (=> b!264090 (= c!45137 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd index!297 #b00000000000000000000000000000001))))))

(declare-fun d!63711 () Bool)

(declare-fun lt!133703 () (_ BitVec 32))

(assert (=> d!63711 (and (bvsge lt!133703 #b00000000000000000000000000000000) (bvsle lt!133703 (bvsub (size!6347 lt!133005) (bvadd index!297 #b00000000000000000000000000000001))))))

(assert (=> d!63711 (= lt!133703 e!171106)))

(declare-fun c!45138 () Bool)

(assert (=> d!63711 (= c!45138 (bvsge (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (=> d!63711 (and (bvsle (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)) (bvsge (bvadd index!297 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd index!297 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(assert (=> d!63711 (= (arrayCountValidKeys!0 lt!133005 (bvadd index!297 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)) lt!133703)))

(declare-fun b!264091 () Bool)

(declare-fun call!25260 () (_ BitVec 32))

(assert (=> b!264091 (= e!171107 call!25260)))

(declare-fun b!264092 () Bool)

(assert (=> b!264092 (= e!171107 (bvadd #b00000000000000000000000000000001 call!25260))))

(declare-fun bm!25257 () Bool)

(assert (=> bm!25257 (= call!25260 (arrayCountValidKeys!0 lt!133005 (bvadd index!297 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd index!297 #b00000000000000000000000000000001)))))

(assert (= (and d!63711 c!45138) b!264089))

(assert (= (and d!63711 (not c!45138)) b!264090))

(assert (= (and b!264090 c!45137) b!264092))

(assert (= (and b!264090 (not c!45137)) b!264091))

(assert (= (or b!264092 b!264091) bm!25257))

(assert (=> b!264090 m!280177))

(assert (=> b!264090 m!280177))

(assert (=> b!264090 m!280179))

(declare-fun m!280869 () Bool)

(assert (=> bm!25257 m!280869))

(assert (=> bm!25233 d!63711))

(declare-fun d!63713 () Bool)

(declare-fun lt!133704 () Bool)

(assert (=> d!63713 (= lt!133704 (select (content!177 (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!171109 () Bool)

(assert (=> d!63713 (= lt!133704 e!171109)))

(declare-fun res!128921 () Bool)

(assert (=> d!63713 (=> (not res!128921) (not e!171109))))

(assert (=> d!63713 (= res!128921 ((_ is Cons!3760) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)))))

(assert (=> d!63713 (= (contains!1889 (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761) (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!133704)))

(declare-fun b!264093 () Bool)

(declare-fun e!171108 () Bool)

(assert (=> b!264093 (= e!171109 e!171108)))

(declare-fun res!128920 () Bool)

(assert (=> b!264093 (=> res!128920 e!171108)))

(assert (=> b!264093 (= res!128920 (= (h!4426 (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264094 () Bool)

(assert (=> b!264094 (= e!171108 (contains!1889 (t!8833 (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!63713 res!128921) b!264093))

(assert (= (and b!264093 (not res!128920)) b!264094))

(declare-fun m!280871 () Bool)

(assert (=> d!63713 m!280871))

(assert (=> d!63713 m!279845))

(declare-fun m!280873 () Bool)

(assert (=> d!63713 m!280873))

(assert (=> b!264094 m!279845))

(declare-fun m!280875 () Bool)

(assert (=> b!264094 m!280875))

(assert (=> b!263588 d!63713))

(declare-fun d!63715 () Bool)

(assert (=> d!63715 (arrayContainsKey!0 (_keys!7034 lt!133011) lt!133337 #b00000000000000000000000000000000)))

(declare-fun lt!133705 () Unit!8164)

(assert (=> d!63715 (= lt!133705 (choose!13 (_keys!7034 lt!133011) lt!133337 #b00000000000000000000000000000000))))

(assert (=> d!63715 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!63715 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7034 lt!133011) lt!133337 #b00000000000000000000000000000000) lt!133705)))

(declare-fun bs!9324 () Bool)

(assert (= bs!9324 d!63715))

(assert (=> bs!9324 m!279605))

(declare-fun m!280877 () Bool)

(assert (=> bs!9324 m!280877))

(assert (=> b!263320 d!63715))

(declare-fun d!63717 () Bool)

(declare-fun res!128922 () Bool)

(declare-fun e!171110 () Bool)

(assert (=> d!63717 (=> res!128922 e!171110)))

(assert (=> d!63717 (= res!128922 (= (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) lt!133337))))

(assert (=> d!63717 (= (arrayContainsKey!0 (_keys!7034 lt!133011) lt!133337 #b00000000000000000000000000000000) e!171110)))

(declare-fun b!264095 () Bool)

(declare-fun e!171111 () Bool)

(assert (=> b!264095 (= e!171110 e!171111)))

(declare-fun res!128923 () Bool)

(assert (=> b!264095 (=> (not res!128923) (not e!171111))))

(assert (=> b!264095 (= res!128923 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 lt!133011))))))

(declare-fun b!264096 () Bool)

(assert (=> b!264096 (= e!171111 (arrayContainsKey!0 (_keys!7034 lt!133011) lt!133337 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63717 (not res!128922)) b!264095))

(assert (= (and b!264095 res!128923) b!264096))

(assert (=> d!63717 m!279599))

(declare-fun m!280879 () Bool)

(assert (=> b!264096 m!280879))

(assert (=> b!263320 d!63717))

(declare-fun b!264097 () Bool)

(declare-fun e!171114 () SeekEntryResult!1164)

(declare-fun lt!133708 () SeekEntryResult!1164)

(assert (=> b!264097 (= e!171114 (seekKeyOrZeroReturnVacant!0 (x!25206 lt!133708) (index!6828 lt!133708) (index!6828 lt!133708) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) (_keys!7034 lt!133011) (mask!11208 lt!133011)))))

(declare-fun d!63719 () Bool)

(declare-fun lt!133706 () SeekEntryResult!1164)

(assert (=> d!63719 (and (or ((_ is Undefined!1164) lt!133706) (not ((_ is Found!1164) lt!133706)) (and (bvsge (index!6827 lt!133706) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133706) (size!6347 (_keys!7034 lt!133011))))) (or ((_ is Undefined!1164) lt!133706) ((_ is Found!1164) lt!133706) (not ((_ is MissingZero!1164) lt!133706)) (and (bvsge (index!6826 lt!133706) #b00000000000000000000000000000000) (bvslt (index!6826 lt!133706) (size!6347 (_keys!7034 lt!133011))))) (or ((_ is Undefined!1164) lt!133706) ((_ is Found!1164) lt!133706) ((_ is MissingZero!1164) lt!133706) (not ((_ is MissingVacant!1164) lt!133706)) (and (bvsge (index!6829 lt!133706) #b00000000000000000000000000000000) (bvslt (index!6829 lt!133706) (size!6347 (_keys!7034 lt!133011))))) (or ((_ is Undefined!1164) lt!133706) (ite ((_ is Found!1164) lt!133706) (= (select (arr!5996 (_keys!7034 lt!133011)) (index!6827 lt!133706)) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1164) lt!133706) (= (select (arr!5996 (_keys!7034 lt!133011)) (index!6826 lt!133706)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1164) lt!133706) (= (select (arr!5996 (_keys!7034 lt!133011)) (index!6829 lt!133706)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!171112 () SeekEntryResult!1164)

(assert (=> d!63719 (= lt!133706 e!171112)))

(declare-fun c!45139 () Bool)

(assert (=> d!63719 (= c!45139 (and ((_ is Intermediate!1164) lt!133708) (undefined!1976 lt!133708)))))

(assert (=> d!63719 (= lt!133708 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) (mask!11208 lt!133011)) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) (_keys!7034 lt!133011) (mask!11208 lt!133011)))))

(assert (=> d!63719 (validMask!0 (mask!11208 lt!133011))))

(assert (=> d!63719 (= (seekEntryOrOpen!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) (_keys!7034 lt!133011) (mask!11208 lt!133011)) lt!133706)))

(declare-fun b!264098 () Bool)

(declare-fun c!45141 () Bool)

(declare-fun lt!133707 () (_ BitVec 64))

(assert (=> b!264098 (= c!45141 (= lt!133707 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171113 () SeekEntryResult!1164)

(assert (=> b!264098 (= e!171113 e!171114)))

(declare-fun b!264099 () Bool)

(assert (=> b!264099 (= e!171112 Undefined!1164)))

(declare-fun b!264100 () Bool)

(assert (=> b!264100 (= e!171114 (MissingZero!1164 (index!6828 lt!133708)))))

(declare-fun b!264101 () Bool)

(assert (=> b!264101 (= e!171112 e!171113)))

(assert (=> b!264101 (= lt!133707 (select (arr!5996 (_keys!7034 lt!133011)) (index!6828 lt!133708)))))

(declare-fun c!45140 () Bool)

(assert (=> b!264101 (= c!45140 (= lt!133707 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun b!264102 () Bool)

(assert (=> b!264102 (= e!171113 (Found!1164 (index!6828 lt!133708)))))

(assert (= (and d!63719 c!45139) b!264099))

(assert (= (and d!63719 (not c!45139)) b!264101))

(assert (= (and b!264101 c!45140) b!264102))

(assert (= (and b!264101 (not c!45140)) b!264098))

(assert (= (and b!264098 c!45141) b!264100))

(assert (= (and b!264098 (not c!45141)) b!264097))

(assert (=> b!264097 m!279599))

(declare-fun m!280881 () Bool)

(assert (=> b!264097 m!280881))

(assert (=> d!63719 m!279819))

(assert (=> d!63719 m!279599))

(declare-fun m!280883 () Bool)

(assert (=> d!63719 m!280883))

(declare-fun m!280885 () Bool)

(assert (=> d!63719 m!280885))

(assert (=> d!63719 m!280883))

(assert (=> d!63719 m!279599))

(declare-fun m!280887 () Bool)

(assert (=> d!63719 m!280887))

(declare-fun m!280889 () Bool)

(assert (=> d!63719 m!280889))

(declare-fun m!280891 () Bool)

(assert (=> d!63719 m!280891))

(declare-fun m!280893 () Bool)

(assert (=> b!264101 m!280893))

(assert (=> b!263320 d!63719))

(assert (=> b!263599 d!63569))

(assert (=> b!263599 d!63453))

(declare-fun b!264106 () Bool)

(declare-fun e!171116 () Option!327)

(assert (=> b!264106 (= e!171116 None!325)))

(declare-fun b!264104 () Bool)

(declare-fun e!171115 () Option!327)

(assert (=> b!264104 (= e!171115 e!171116)))

(declare-fun c!45143 () Bool)

(assert (=> b!264104 (= c!45143 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133013))) (not (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133013)))) key!932))))))

(declare-fun b!264105 () Bool)

(assert (=> b!264105 (= e!171116 (getValueByKey!321 (t!8832 (t!8832 (toList!1916 lt!133013))) key!932))))

(declare-fun d!63721 () Bool)

(declare-fun c!45142 () Bool)

(assert (=> d!63721 (= c!45142 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133013))) (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133013)))) key!932)))))

(assert (=> d!63721 (= (getValueByKey!321 (t!8832 (toList!1916 lt!133013)) key!932) e!171115)))

(declare-fun b!264103 () Bool)

(assert (=> b!264103 (= e!171115 (Some!326 (_2!2454 (h!4425 (t!8832 (toList!1916 lt!133013))))))))

(assert (= (and d!63721 c!45142) b!264103))

(assert (= (and d!63721 (not c!45142)) b!264104))

(assert (= (and b!264104 c!45143) b!264105))

(assert (= (and b!264104 (not c!45143)) b!264106))

(declare-fun m!280895 () Bool)

(assert (=> b!264105 m!280895))

(assert (=> b!263552 d!63721))

(assert (=> b!263720 d!63469))

(declare-fun d!63723 () Bool)

(declare-fun res!128924 () Bool)

(declare-fun e!171117 () Bool)

(assert (=> d!63723 (=> res!128924 e!171117)))

(assert (=> d!63723 (= res!128924 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))) (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))) lt!133298)))))

(assert (=> d!63723 (= (containsKey!312 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))) lt!133298) e!171117)))

(declare-fun b!264107 () Bool)

(declare-fun e!171118 () Bool)

(assert (=> b!264107 (= e!171117 e!171118)))

(declare-fun res!128925 () Bool)

(assert (=> b!264107 (=> (not res!128925) (not e!171118))))

(assert (=> b!264107 (= res!128925 (and (or (not ((_ is Cons!3759) (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))) (bvsle (_1!2454 (h!4425 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))) lt!133298)) ((_ is Cons!3759) (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))) (bvslt (_1!2454 (h!4425 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504)))))) lt!133298)))))

(declare-fun b!264108 () Bool)

(assert (=> b!264108 (= e!171118 (containsKey!312 (t!8832 (toList!1916 (+!712 lt!133309 (tuple2!4887 lt!133315 (zeroValue!4683 thiss!1504))))) lt!133298))))

(assert (= (and d!63723 (not res!128924)) b!264107))

(assert (= (and b!264107 res!128925) b!264108))

(declare-fun m!280897 () Bool)

(assert (=> b!264108 m!280897))

(assert (=> d!63259 d!63723))

(declare-fun d!63725 () Bool)

(declare-fun e!171119 () Bool)

(assert (=> d!63725 e!171119))

(declare-fun res!128926 () Bool)

(assert (=> d!63725 (=> (not res!128926) (not e!171119))))

(declare-fun lt!133710 () ListLongMap!3801)

(assert (=> d!63725 (= res!128926 (contains!1885 lt!133710 (_1!2454 (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))))))))

(declare-fun lt!133711 () List!3763)

(assert (=> d!63725 (= lt!133710 (ListLongMap!3802 lt!133711))))

(declare-fun lt!133712 () Unit!8164)

(declare-fun lt!133709 () Unit!8164)

(assert (=> d!63725 (= lt!133712 lt!133709)))

(assert (=> d!63725 (= (getValueByKey!321 lt!133711 (_1!2454 (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))))) (Some!326 (_2!2454 (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))))))))

(assert (=> d!63725 (= lt!133709 (lemmaContainsTupThenGetReturnValue!177 lt!133711 (_1!2454 (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))) (_2!2454 (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))))))))

(assert (=> d!63725 (= lt!133711 (insertStrictlySorted!180 (toList!1916 (ite c!45020 call!25230 (ite c!45023 call!25228 call!25231))) (_1!2454 (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))) (_2!2454 (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))))))))

(assert (=> d!63725 (= (+!712 (ite c!45020 call!25230 (ite c!45023 call!25228 call!25231)) (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))) lt!133710)))

(declare-fun b!264109 () Bool)

(declare-fun res!128927 () Bool)

(assert (=> b!264109 (=> (not res!128927) (not e!171119))))

(assert (=> b!264109 (= res!128927 (= (getValueByKey!321 (toList!1916 lt!133710) (_1!2454 (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))))) (Some!326 (_2!2454 (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))))))))

(declare-fun b!264110 () Bool)

(assert (=> b!264110 (= e!171119 (contains!1888 (toList!1916 lt!133710) (ite (or c!45020 c!45023) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 lt!133011)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))))))

(assert (= (and d!63725 res!128926) b!264109))

(assert (= (and b!264109 res!128927) b!264110))

(declare-fun m!280899 () Bool)

(assert (=> d!63725 m!280899))

(declare-fun m!280901 () Bool)

(assert (=> d!63725 m!280901))

(declare-fun m!280903 () Bool)

(assert (=> d!63725 m!280903))

(declare-fun m!280905 () Bool)

(assert (=> d!63725 m!280905))

(declare-fun m!280907 () Bool)

(assert (=> b!264109 m!280907))

(declare-fun m!280909 () Bool)

(assert (=> b!264110 m!280909))

(assert (=> bm!25228 d!63725))

(assert (=> b!263495 d!63511))

(declare-fun d!63727 () Bool)

(assert (=> d!63727 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133256) lt!133250)) (v!5509 (getValueByKey!321 (toList!1916 lt!133256) lt!133250)))))

(assert (=> d!63397 d!63727))

(declare-fun b!264114 () Bool)

(declare-fun e!171121 () Option!327)

(assert (=> b!264114 (= e!171121 None!325)))

(declare-fun b!264112 () Bool)

(declare-fun e!171120 () Option!327)

(assert (=> b!264112 (= e!171120 e!171121)))

(declare-fun c!45145 () Bool)

(assert (=> b!264112 (= c!45145 (and ((_ is Cons!3759) (toList!1916 lt!133256)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133256))) lt!133250))))))

(declare-fun b!264113 () Bool)

(assert (=> b!264113 (= e!171121 (getValueByKey!321 (t!8832 (toList!1916 lt!133256)) lt!133250))))

(declare-fun d!63729 () Bool)

(declare-fun c!45144 () Bool)

(assert (=> d!63729 (= c!45144 (and ((_ is Cons!3759) (toList!1916 lt!133256)) (= (_1!2454 (h!4425 (toList!1916 lt!133256))) lt!133250)))))

(assert (=> d!63729 (= (getValueByKey!321 (toList!1916 lt!133256) lt!133250) e!171120)))

(declare-fun b!264111 () Bool)

(assert (=> b!264111 (= e!171120 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133256)))))))

(assert (= (and d!63729 c!45144) b!264111))

(assert (= (and d!63729 (not c!45144)) b!264112))

(assert (= (and b!264112 c!45145) b!264113))

(assert (= (and b!264112 (not c!45145)) b!264114))

(declare-fun m!280911 () Bool)

(assert (=> b!264113 m!280911))

(assert (=> d!63397 d!63729))

(declare-fun d!63731 () Bool)

(declare-fun c!45148 () Bool)

(assert (=> d!63731 (= c!45148 ((_ is Nil!3760) (toList!1916 lt!133265)))))

(declare-fun e!171124 () (InoxSet tuple2!4886))

(assert (=> d!63731 (= (content!178 (toList!1916 lt!133265)) e!171124)))

(declare-fun b!264119 () Bool)

(assert (=> b!264119 (= e!171124 ((as const (Array tuple2!4886 Bool)) false))))

(declare-fun b!264120 () Bool)

(assert (=> b!264120 (= e!171124 ((_ map or) (store ((as const (Array tuple2!4886 Bool)) false) (h!4425 (toList!1916 lt!133265)) true) (content!178 (t!8832 (toList!1916 lt!133265)))))))

(assert (= (and d!63731 c!45148) b!264119))

(assert (= (and d!63731 (not c!45148)) b!264120))

(declare-fun m!280913 () Bool)

(assert (=> b!264120 m!280913))

(assert (=> b!264120 m!280551))

(assert (=> d!63345 d!63731))

(declare-fun d!63733 () Bool)

(assert (=> d!63733 (= (inRange!0 (ite c!45017 (index!6826 lt!133549) (index!6829 lt!133549)) (mask!11208 thiss!1504)) (and (bvsge (ite c!45017 (index!6826 lt!133549) (index!6829 lt!133549)) #b00000000000000000000000000000000) (bvslt (ite c!45017 (index!6826 lt!133549) (index!6829 lt!133549)) (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!25224 d!63733))

(declare-fun lt!133713 () Bool)

(declare-fun d!63735 () Bool)

(assert (=> d!63735 (= lt!133713 (select (content!178 (toList!1916 lt!133401)) (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))

(declare-fun e!171126 () Bool)

(assert (=> d!63735 (= lt!133713 e!171126)))

(declare-fun res!128929 () Bool)

(assert (=> d!63735 (=> (not res!128929) (not e!171126))))

(assert (=> d!63735 (= res!128929 ((_ is Cons!3759) (toList!1916 lt!133401)))))

(assert (=> d!63735 (= (contains!1888 (toList!1916 lt!133401) (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) lt!133713)))

(declare-fun b!264121 () Bool)

(declare-fun e!171125 () Bool)

(assert (=> b!264121 (= e!171126 e!171125)))

(declare-fun res!128928 () Bool)

(assert (=> b!264121 (=> res!128928 e!171125)))

(assert (=> b!264121 (= res!128928 (= (h!4425 (toList!1916 lt!133401)) (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))

(declare-fun b!264122 () Bool)

(assert (=> b!264122 (= e!171125 (contains!1888 (t!8832 (toList!1916 lt!133401)) (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))

(assert (= (and d!63735 res!128929) b!264121))

(assert (= (and b!264121 (not res!128928)) b!264122))

(declare-fun m!280915 () Bool)

(assert (=> d!63735 m!280915))

(declare-fun m!280917 () Bool)

(assert (=> d!63735 m!280917))

(declare-fun m!280919 () Bool)

(assert (=> b!264122 m!280919))

(assert (=> b!263420 d!63735))

(declare-fun d!63737 () Bool)

(declare-fun e!171127 () Bool)

(assert (=> d!63737 e!171127))

(declare-fun res!128930 () Bool)

(assert (=> d!63737 (=> res!128930 e!171127)))

(declare-fun lt!133715 () Bool)

(assert (=> d!63737 (= res!128930 (not lt!133715))))

(declare-fun lt!133717 () Bool)

(assert (=> d!63737 (= lt!133715 lt!133717)))

(declare-fun lt!133716 () Unit!8164)

(declare-fun e!171128 () Unit!8164)

(assert (=> d!63737 (= lt!133716 e!171128)))

(declare-fun c!45149 () Bool)

(assert (=> d!63737 (= c!45149 lt!133717)))

(assert (=> d!63737 (= lt!133717 (containsKey!312 (toList!1916 lt!133380) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63737 (= (contains!1885 lt!133380 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133715)))

(declare-fun b!264123 () Bool)

(declare-fun lt!133714 () Unit!8164)

(assert (=> b!264123 (= e!171128 lt!133714)))

(assert (=> b!264123 (= lt!133714 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133380) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264123 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133380) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264124 () Bool)

(declare-fun Unit!8205 () Unit!8164)

(assert (=> b!264124 (= e!171128 Unit!8205)))

(declare-fun b!264125 () Bool)

(assert (=> b!264125 (= e!171127 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133380) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63737 c!45149) b!264123))

(assert (= (and d!63737 (not c!45149)) b!264124))

(assert (= (and d!63737 (not res!128930)) b!264125))

(declare-fun m!280921 () Bool)

(assert (=> d!63737 m!280921))

(declare-fun m!280923 () Bool)

(assert (=> b!264123 m!280923))

(declare-fun m!280925 () Bool)

(assert (=> b!264123 m!280925))

(assert (=> b!264123 m!280925))

(declare-fun m!280927 () Bool)

(assert (=> b!264123 m!280927))

(assert (=> b!264125 m!280925))

(assert (=> b!264125 m!280925))

(assert (=> b!264125 m!280927))

(assert (=> d!63249 d!63737))

(assert (=> d!63249 d!63237))

(declare-fun d!63739 () Bool)

(declare-fun lt!133718 () Bool)

(assert (=> d!63739 (= lt!133718 (select (content!178 (toList!1916 lt!133473)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun e!171130 () Bool)

(assert (=> d!63739 (= lt!133718 e!171130)))

(declare-fun res!128932 () Bool)

(assert (=> d!63739 (=> (not res!128932) (not e!171130))))

(assert (=> d!63739 (= res!128932 ((_ is Cons!3759) (toList!1916 lt!133473)))))

(assert (=> d!63739 (= (contains!1888 (toList!1916 lt!133473) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) lt!133718)))

(declare-fun b!264126 () Bool)

(declare-fun e!171129 () Bool)

(assert (=> b!264126 (= e!171130 e!171129)))

(declare-fun res!128931 () Bool)

(assert (=> b!264126 (=> res!128931 e!171129)))

(assert (=> b!264126 (= res!128931 (= (h!4425 (toList!1916 lt!133473)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(declare-fun b!264127 () Bool)

(assert (=> b!264127 (= e!171129 (contains!1888 (t!8832 (toList!1916 lt!133473)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(assert (= (and d!63739 res!128932) b!264126))

(assert (= (and b!264126 (not res!128931)) b!264127))

(declare-fun m!280929 () Bool)

(assert (=> d!63739 m!280929))

(declare-fun m!280931 () Bool)

(assert (=> d!63739 m!280931))

(declare-fun m!280933 () Bool)

(assert (=> b!264127 m!280933))

(assert (=> b!263561 d!63739))

(declare-fun d!63741 () Bool)

(declare-fun e!171131 () Bool)

(assert (=> d!63741 e!171131))

(declare-fun res!128933 () Bool)

(assert (=> d!63741 (=> res!128933 e!171131)))

(declare-fun lt!133720 () Bool)

(assert (=> d!63741 (= res!128933 (not lt!133720))))

(declare-fun lt!133722 () Bool)

(assert (=> d!63741 (= lt!133720 lt!133722)))

(declare-fun lt!133721 () Unit!8164)

(declare-fun e!171132 () Unit!8164)

(assert (=> d!63741 (= lt!133721 e!171132)))

(declare-fun c!45150 () Bool)

(assert (=> d!63741 (= c!45150 lt!133722)))

(assert (=> d!63741 (= lt!133722 (containsKey!312 (toList!1916 lt!133401) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(assert (=> d!63741 (= (contains!1885 lt!133401 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) lt!133720)))

(declare-fun b!264128 () Bool)

(declare-fun lt!133719 () Unit!8164)

(assert (=> b!264128 (= e!171132 lt!133719)))

(assert (=> b!264128 (= lt!133719 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133401) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(assert (=> b!264128 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133401) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(declare-fun b!264129 () Bool)

(declare-fun Unit!8206 () Unit!8164)

(assert (=> b!264129 (= e!171132 Unit!8206)))

(declare-fun b!264130 () Bool)

(assert (=> b!264130 (= e!171131 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133401) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63741 c!45150) b!264128))

(assert (= (and d!63741 (not c!45150)) b!264129))

(assert (= (and d!63741 (not res!128933)) b!264130))

(declare-fun m!280935 () Bool)

(assert (=> d!63741 m!280935))

(declare-fun m!280937 () Bool)

(assert (=> b!264128 m!280937))

(assert (=> b!264128 m!279737))

(assert (=> b!264128 m!279737))

(declare-fun m!280939 () Bool)

(assert (=> b!264128 m!280939))

(assert (=> b!264130 m!279737))

(assert (=> b!264130 m!279737))

(assert (=> b!264130 m!280939))

(assert (=> d!63267 d!63741))

(declare-fun b!264134 () Bool)

(declare-fun e!171134 () Option!327)

(assert (=> b!264134 (= e!171134 None!325)))

(declare-fun b!264132 () Bool)

(declare-fun e!171133 () Option!327)

(assert (=> b!264132 (= e!171133 e!171134)))

(declare-fun c!45152 () Bool)

(assert (=> b!264132 (= c!45152 (and ((_ is Cons!3759) lt!133402) (not (= (_1!2454 (h!4425 lt!133402)) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264133 () Bool)

(assert (=> b!264133 (= e!171134 (getValueByKey!321 (t!8832 lt!133402) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(declare-fun c!45151 () Bool)

(declare-fun d!63743 () Bool)

(assert (=> d!63743 (= c!45151 (and ((_ is Cons!3759) lt!133402) (= (_1!2454 (h!4425 lt!133402)) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))))

(assert (=> d!63743 (= (getValueByKey!321 lt!133402 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) e!171133)))

(declare-fun b!264131 () Bool)

(assert (=> b!264131 (= e!171133 (Some!326 (_2!2454 (h!4425 lt!133402))))))

(assert (= (and d!63743 c!45151) b!264131))

(assert (= (and d!63743 (not c!45151)) b!264132))

(assert (= (and b!264132 c!45152) b!264133))

(assert (= (and b!264132 (not c!45152)) b!264134))

(declare-fun m!280941 () Bool)

(assert (=> b!264133 m!280941))

(assert (=> d!63267 d!63743))

(declare-fun d!63745 () Bool)

(assert (=> d!63745 (= (getValueByKey!321 lt!133402 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133723 () Unit!8164)

(assert (=> d!63745 (= lt!133723 (choose!1302 lt!133402 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(declare-fun e!171135 () Bool)

(assert (=> d!63745 e!171135))

(declare-fun res!128934 () Bool)

(assert (=> d!63745 (=> (not res!128934) (not e!171135))))

(assert (=> d!63745 (= res!128934 (isStrictlySorted!364 lt!133402))))

(assert (=> d!63745 (= (lemmaContainsTupThenGetReturnValue!177 lt!133402 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) lt!133723)))

(declare-fun b!264135 () Bool)

(declare-fun res!128935 () Bool)

(assert (=> b!264135 (=> (not res!128935) (not e!171135))))

(assert (=> b!264135 (= res!128935 (containsKey!312 lt!133402 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(declare-fun b!264136 () Bool)

(assert (=> b!264136 (= e!171135 (contains!1888 lt!133402 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63745 res!128934) b!264135))

(assert (= (and b!264135 res!128935) b!264136))

(assert (=> d!63745 m!279731))

(declare-fun m!280943 () Bool)

(assert (=> d!63745 m!280943))

(declare-fun m!280945 () Bool)

(assert (=> d!63745 m!280945))

(declare-fun m!280947 () Bool)

(assert (=> b!264135 m!280947))

(declare-fun m!280949 () Bool)

(assert (=> b!264136 m!280949))

(assert (=> d!63267 d!63745))

(declare-fun b!264137 () Bool)

(declare-fun e!171138 () List!3763)

(declare-fun call!25263 () List!3763)

(assert (=> b!264137 (= e!171138 call!25263)))

(declare-fun b!264138 () Bool)

(declare-fun e!171140 () List!3763)

(declare-fun call!25261 () List!3763)

(assert (=> b!264138 (= e!171140 call!25261)))

(declare-fun b!264139 () Bool)

(assert (=> b!264139 (= e!171138 call!25263)))

(declare-fun c!45154 () Bool)

(declare-fun call!25262 () List!3763)

(declare-fun bm!25258 () Bool)

(declare-fun e!171136 () List!3763)

(assert (=> bm!25258 (= call!25262 ($colon$colon!107 e!171136 (ite c!45154 (h!4425 (toList!1916 lt!133305)) (tuple2!4887 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45156 () Bool)

(assert (=> bm!25258 (= c!45156 c!45154)))

(declare-fun b!264140 () Bool)

(declare-fun c!45155 () Bool)

(declare-fun c!45153 () Bool)

(assert (=> b!264140 (= e!171136 (ite c!45155 (t!8832 (toList!1916 lt!133305)) (ite c!45153 (Cons!3759 (h!4425 (toList!1916 lt!133305)) (t!8832 (toList!1916 lt!133305))) Nil!3760)))))

(declare-fun b!264141 () Bool)

(assert (=> b!264141 (= e!171136 (insertStrictlySorted!180 (t!8832 (toList!1916 lt!133305)) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(declare-fun bm!25259 () Bool)

(assert (=> bm!25259 (= call!25263 call!25261)))

(declare-fun d!63747 () Bool)

(declare-fun e!171139 () Bool)

(assert (=> d!63747 e!171139))

(declare-fun res!128936 () Bool)

(assert (=> d!63747 (=> (not res!128936) (not e!171139))))

(declare-fun lt!133724 () List!3763)

(assert (=> d!63747 (= res!128936 (isStrictlySorted!364 lt!133724))))

(declare-fun e!171137 () List!3763)

(assert (=> d!63747 (= lt!133724 e!171137)))

(assert (=> d!63747 (= c!45154 (and ((_ is Cons!3759) (toList!1916 lt!133305)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133305))) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))))

(assert (=> d!63747 (isStrictlySorted!364 (toList!1916 lt!133305))))

(assert (=> d!63747 (= (insertStrictlySorted!180 (toList!1916 lt!133305) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))) lt!133724)))

(declare-fun b!264142 () Bool)

(assert (=> b!264142 (= e!171137 call!25262)))

(declare-fun bm!25260 () Bool)

(assert (=> bm!25260 (= call!25261 call!25262)))

(declare-fun b!264143 () Bool)

(assert (=> b!264143 (= e!171137 e!171140)))

(assert (=> b!264143 (= c!45155 (and ((_ is Cons!3759) (toList!1916 lt!133305)) (= (_1!2454 (h!4425 (toList!1916 lt!133305))) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))))

(declare-fun b!264144 () Bool)

(assert (=> b!264144 (= e!171139 (contains!1888 lt!133724 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))))

(declare-fun b!264145 () Bool)

(assert (=> b!264145 (= c!45153 (and ((_ is Cons!3759) (toList!1916 lt!133305)) (bvsgt (_1!2454 (h!4425 (toList!1916 lt!133305))) (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504))))))))

(assert (=> b!264145 (= e!171140 e!171138)))

(declare-fun b!264146 () Bool)

(declare-fun res!128937 () Bool)

(assert (=> b!264146 (=> (not res!128937) (not e!171139))))

(assert (=> b!264146 (= res!128937 (containsKey!312 lt!133724 (_1!2454 (tuple2!4887 lt!133299 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63747 c!45154) b!264142))

(assert (= (and d!63747 (not c!45154)) b!264143))

(assert (= (and b!264143 c!45155) b!264138))

(assert (= (and b!264143 (not c!45155)) b!264145))

(assert (= (and b!264145 c!45153) b!264137))

(assert (= (and b!264145 (not c!45153)) b!264139))

(assert (= (or b!264137 b!264139) bm!25259))

(assert (= (or b!264138 bm!25259) bm!25260))

(assert (= (or b!264142 bm!25260) bm!25258))

(assert (= (and bm!25258 c!45156) b!264141))

(assert (= (and bm!25258 (not c!45156)) b!264140))

(assert (= (and d!63747 res!128936) b!264146))

(assert (= (and b!264146 res!128937) b!264144))

(declare-fun m!280951 () Bool)

(assert (=> b!264146 m!280951))

(declare-fun m!280953 () Bool)

(assert (=> b!264144 m!280953))

(declare-fun m!280955 () Bool)

(assert (=> b!264141 m!280955))

(declare-fun m!280957 () Bool)

(assert (=> bm!25258 m!280957))

(declare-fun m!280959 () Bool)

(assert (=> d!63747 m!280959))

(declare-fun m!280961 () Bool)

(assert (=> d!63747 m!280961))

(assert (=> d!63267 d!63747))

(declare-fun d!63749 () Bool)

(assert (=> d!63749 (= (apply!262 lt!133559 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3100 (getValueByKey!321 (toList!1916 lt!133559) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9325 () Bool)

(assert (= bs!9325 d!63749))

(assert (=> bs!9325 m!280505))

(assert (=> bs!9325 m!280505))

(declare-fun m!280963 () Bool)

(assert (=> bs!9325 m!280963))

(assert (=> b!263712 d!63749))

(assert (=> b!263640 d!63285))

(declare-fun d!63751 () Bool)

(declare-fun e!171141 () Bool)

(assert (=> d!63751 e!171141))

(declare-fun res!128938 () Bool)

(assert (=> d!63751 (=> res!128938 e!171141)))

(declare-fun lt!133726 () Bool)

(assert (=> d!63751 (= res!128938 (not lt!133726))))

(declare-fun lt!133728 () Bool)

(assert (=> d!63751 (= lt!133726 lt!133728)))

(declare-fun lt!133727 () Unit!8164)

(declare-fun e!171142 () Unit!8164)

(assert (=> d!63751 (= lt!133727 e!171142)))

(declare-fun c!45157 () Bool)

(assert (=> d!63751 (= c!45157 lt!133728)))

(assert (=> d!63751 (= lt!133728 (containsKey!312 (toList!1916 lt!133577) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63751 (= (contains!1885 lt!133577 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133726)))

(declare-fun b!264147 () Bool)

(declare-fun lt!133725 () Unit!8164)

(assert (=> b!264147 (= e!171142 lt!133725)))

(assert (=> b!264147 (= lt!133725 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133577) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> b!264147 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133577) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!264148 () Bool)

(declare-fun Unit!8207 () Unit!8164)

(assert (=> b!264148 (= e!171142 Unit!8207)))

(declare-fun b!264149 () Bool)

(assert (=> b!264149 (= e!171141 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133577) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63751 c!45157) b!264147))

(assert (= (and d!63751 (not c!45157)) b!264148))

(assert (= (and d!63751 (not res!128938)) b!264149))

(declare-fun m!280965 () Bool)

(assert (=> d!63751 m!280965))

(declare-fun m!280967 () Bool)

(assert (=> b!264147 m!280967))

(assert (=> b!264147 m!280291))

(assert (=> b!264147 m!280291))

(declare-fun m!280969 () Bool)

(assert (=> b!264147 m!280969))

(assert (=> b!264149 m!280291))

(assert (=> b!264149 m!280291))

(assert (=> b!264149 m!280969))

(assert (=> d!63445 d!63751))

(declare-fun b!264153 () Bool)

(declare-fun e!171144 () Option!327)

(assert (=> b!264153 (= e!171144 None!325)))

(declare-fun b!264151 () Bool)

(declare-fun e!171143 () Option!327)

(assert (=> b!264151 (= e!171143 e!171144)))

(declare-fun c!45159 () Bool)

(assert (=> b!264151 (= c!45159 (and ((_ is Cons!3759) lt!133578) (not (= (_1!2454 (h!4425 lt!133578)) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264152 () Bool)

(assert (=> b!264152 (= e!171144 (getValueByKey!321 (t!8832 lt!133578) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun d!63753 () Bool)

(declare-fun c!45158 () Bool)

(assert (=> d!63753 (= c!45158 (and ((_ is Cons!3759) lt!133578) (= (_1!2454 (h!4425 lt!133578)) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63753 (= (getValueByKey!321 lt!133578 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) e!171143)))

(declare-fun b!264150 () Bool)

(assert (=> b!264150 (= e!171143 (Some!326 (_2!2454 (h!4425 lt!133578))))))

(assert (= (and d!63753 c!45158) b!264150))

(assert (= (and d!63753 (not c!45158)) b!264151))

(assert (= (and b!264151 c!45159) b!264152))

(assert (= (and b!264151 (not c!45159)) b!264153))

(declare-fun m!280971 () Bool)

(assert (=> b!264152 m!280971))

(assert (=> d!63445 d!63753))

(declare-fun d!63755 () Bool)

(assert (=> d!63755 (= (getValueByKey!321 lt!133578 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133729 () Unit!8164)

(assert (=> d!63755 (= lt!133729 (choose!1302 lt!133578 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun e!171145 () Bool)

(assert (=> d!63755 e!171145))

(declare-fun res!128939 () Bool)

(assert (=> d!63755 (=> (not res!128939) (not e!171145))))

(assert (=> d!63755 (= res!128939 (isStrictlySorted!364 lt!133578))))

(assert (=> d!63755 (= (lemmaContainsTupThenGetReturnValue!177 lt!133578 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133729)))

(declare-fun b!264154 () Bool)

(declare-fun res!128940 () Bool)

(assert (=> b!264154 (=> (not res!128940) (not e!171145))))

(assert (=> b!264154 (= res!128940 (containsKey!312 lt!133578 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!264155 () Bool)

(assert (=> b!264155 (= e!171145 (contains!1888 lt!133578 (tuple2!4887 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63755 res!128939) b!264154))

(assert (= (and b!264154 res!128940) b!264155))

(assert (=> d!63755 m!280285))

(declare-fun m!280973 () Bool)

(assert (=> d!63755 m!280973))

(declare-fun m!280975 () Bool)

(assert (=> d!63755 m!280975))

(declare-fun m!280977 () Bool)

(assert (=> b!264154 m!280977))

(declare-fun m!280979 () Bool)

(assert (=> b!264155 m!280979))

(assert (=> d!63445 d!63755))

(declare-fun b!264156 () Bool)

(declare-fun e!171148 () List!3763)

(declare-fun call!25266 () List!3763)

(assert (=> b!264156 (= e!171148 call!25266)))

(declare-fun b!264157 () Bool)

(declare-fun e!171150 () List!3763)

(declare-fun call!25264 () List!3763)

(assert (=> b!264157 (= e!171150 call!25264)))

(declare-fun b!264158 () Bool)

(assert (=> b!264158 (= e!171148 call!25266)))

(declare-fun c!45161 () Bool)

(declare-fun call!25265 () List!3763)

(declare-fun e!171146 () List!3763)

(declare-fun bm!25261 () Bool)

(assert (=> bm!25261 (= call!25265 ($colon$colon!107 e!171146 (ite c!45161 (h!4425 (toList!1916 call!25185)) (tuple2!4887 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45163 () Bool)

(assert (=> bm!25261 (= c!45163 c!45161)))

(declare-fun b!264159 () Bool)

(declare-fun c!45162 () Bool)

(declare-fun c!45160 () Bool)

(assert (=> b!264159 (= e!171146 (ite c!45162 (t!8832 (toList!1916 call!25185)) (ite c!45160 (Cons!3759 (h!4425 (toList!1916 call!25185)) (t!8832 (toList!1916 call!25185))) Nil!3760)))))

(declare-fun b!264160 () Bool)

(assert (=> b!264160 (= e!171146 (insertStrictlySorted!180 (t!8832 (toList!1916 call!25185)) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun bm!25262 () Bool)

(assert (=> bm!25262 (= call!25266 call!25264)))

(declare-fun d!63757 () Bool)

(declare-fun e!171149 () Bool)

(assert (=> d!63757 e!171149))

(declare-fun res!128941 () Bool)

(assert (=> d!63757 (=> (not res!128941) (not e!171149))))

(declare-fun lt!133730 () List!3763)

(assert (=> d!63757 (= res!128941 (isStrictlySorted!364 lt!133730))))

(declare-fun e!171147 () List!3763)

(assert (=> d!63757 (= lt!133730 e!171147)))

(assert (=> d!63757 (= c!45161 (and ((_ is Cons!3759) (toList!1916 call!25185)) (bvslt (_1!2454 (h!4425 (toList!1916 call!25185))) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63757 (isStrictlySorted!364 (toList!1916 call!25185))))

(assert (=> d!63757 (= (insertStrictlySorted!180 (toList!1916 call!25185) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133730)))

(declare-fun b!264161 () Bool)

(assert (=> b!264161 (= e!171147 call!25265)))

(declare-fun bm!25263 () Bool)

(assert (=> bm!25263 (= call!25264 call!25265)))

(declare-fun b!264162 () Bool)

(assert (=> b!264162 (= e!171147 e!171150)))

(assert (=> b!264162 (= c!45162 (and ((_ is Cons!3759) (toList!1916 call!25185)) (= (_1!2454 (h!4425 (toList!1916 call!25185))) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264163 () Bool)

(assert (=> b!264163 (= e!171149 (contains!1888 lt!133730 (tuple2!4887 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264164 () Bool)

(assert (=> b!264164 (= c!45160 (and ((_ is Cons!3759) (toList!1916 call!25185)) (bvsgt (_1!2454 (h!4425 (toList!1916 call!25185))) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> b!264164 (= e!171150 e!171148)))

(declare-fun b!264165 () Bool)

(declare-fun res!128942 () Bool)

(assert (=> b!264165 (=> (not res!128942) (not e!171149))))

(assert (=> b!264165 (= res!128942 (containsKey!312 lt!133730 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63757 c!45161) b!264161))

(assert (= (and d!63757 (not c!45161)) b!264162))

(assert (= (and b!264162 c!45162) b!264157))

(assert (= (and b!264162 (not c!45162)) b!264164))

(assert (= (and b!264164 c!45160) b!264156))

(assert (= (and b!264164 (not c!45160)) b!264158))

(assert (= (or b!264156 b!264158) bm!25262))

(assert (= (or b!264157 bm!25262) bm!25263))

(assert (= (or b!264161 bm!25263) bm!25261))

(assert (= (and bm!25261 c!45163) b!264160))

(assert (= (and bm!25261 (not c!45163)) b!264159))

(assert (= (and d!63757 res!128941) b!264165))

(assert (= (and b!264165 res!128942) b!264163))

(declare-fun m!280981 () Bool)

(assert (=> b!264165 m!280981))

(declare-fun m!280983 () Bool)

(assert (=> b!264163 m!280983))

(declare-fun m!280985 () Bool)

(assert (=> b!264160 m!280985))

(declare-fun m!280987 () Bool)

(assert (=> bm!25261 m!280987))

(declare-fun m!280989 () Bool)

(assert (=> d!63757 m!280989))

(declare-fun m!280991 () Bool)

(assert (=> d!63757 m!280991))

(assert (=> d!63445 d!63757))

(declare-fun d!63759 () Bool)

(declare-fun e!171151 () Bool)

(assert (=> d!63759 e!171151))

(declare-fun res!128943 () Bool)

(assert (=> d!63759 (=> (not res!128943) (not e!171151))))

(declare-fun lt!133732 () ListLongMap!3801)

(assert (=> d!63759 (= res!128943 (contains!1885 lt!133732 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))))))

(declare-fun lt!133733 () List!3763)

(assert (=> d!63759 (= lt!133732 (ListLongMap!3802 lt!133733))))

(declare-fun lt!133734 () Unit!8164)

(declare-fun lt!133731 () Unit!8164)

(assert (=> d!63759 (= lt!133734 lt!133731)))

(assert (=> d!63759 (= (getValueByKey!321 lt!133733 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))) (Some!326 (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))))))

(assert (=> d!63759 (= lt!133731 (lemmaContainsTupThenGetReturnValue!177 lt!133733 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))))))

(assert (=> d!63759 (= lt!133733 (insertStrictlySorted!180 (toList!1916 call!25234) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))))))

(assert (=> d!63759 (= (+!712 call!25234 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))) lt!133732)))

(declare-fun b!264166 () Bool)

(declare-fun res!128944 () Bool)

(assert (=> b!264166 (=> (not res!128944) (not e!171151))))

(assert (=> b!264166 (= res!128944 (= (getValueByKey!321 (toList!1916 lt!133732) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011)))) (Some!326 (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))))))))

(declare-fun b!264167 () Bool)

(assert (=> b!264167 (= e!171151 (contains!1888 (toList!1916 lt!133732) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 lt!133011))))))

(assert (= (and d!63759 res!128943) b!264166))

(assert (= (and b!264166 res!128944) b!264167))

(declare-fun m!280993 () Bool)

(assert (=> d!63759 m!280993))

(declare-fun m!280995 () Bool)

(assert (=> d!63759 m!280995))

(declare-fun m!280997 () Bool)

(assert (=> d!63759 m!280997))

(declare-fun m!280999 () Bool)

(assert (=> d!63759 m!280999))

(declare-fun m!281001 () Bool)

(assert (=> b!264166 m!281001))

(declare-fun m!281003 () Bool)

(assert (=> b!264167 m!281003))

(assert (=> b!263719 d!63759))

(declare-fun d!63761 () Bool)

(assert (=> d!63761 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!5509 (getValueByKey!321 (toList!1916 lt!133300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63295 d!63761))

(assert (=> d!63295 d!63597))

(assert (=> d!63427 d!63207))

(declare-fun d!63763 () Bool)

(declare-fun lt!133735 () Bool)

(assert (=> d!63763 (= lt!133735 (select (content!178 (t!8832 (toList!1916 lt!133176))) lt!133017))))

(declare-fun e!171153 () Bool)

(assert (=> d!63763 (= lt!133735 e!171153)))

(declare-fun res!128946 () Bool)

(assert (=> d!63763 (=> (not res!128946) (not e!171153))))

(assert (=> d!63763 (= res!128946 ((_ is Cons!3759) (t!8832 (toList!1916 lt!133176))))))

(assert (=> d!63763 (= (contains!1888 (t!8832 (toList!1916 lt!133176)) lt!133017) lt!133735)))

(declare-fun b!264168 () Bool)

(declare-fun e!171152 () Bool)

(assert (=> b!264168 (= e!171153 e!171152)))

(declare-fun res!128945 () Bool)

(assert (=> b!264168 (=> res!128945 e!171152)))

(assert (=> b!264168 (= res!128945 (= (h!4425 (t!8832 (toList!1916 lt!133176))) lt!133017))))

(declare-fun b!264169 () Bool)

(assert (=> b!264169 (= e!171152 (contains!1888 (t!8832 (t!8832 (toList!1916 lt!133176))) lt!133017))))

(assert (= (and d!63763 res!128946) b!264168))

(assert (= (and b!264168 (not res!128945)) b!264169))

(declare-fun m!281005 () Bool)

(assert (=> d!63763 m!281005))

(declare-fun m!281007 () Bool)

(assert (=> d!63763 m!281007))

(declare-fun m!281009 () Bool)

(assert (=> b!264169 m!281009))

(assert (=> b!263559 d!63763))

(declare-fun d!63765 () Bool)

(assert (=> d!63765 (= (inRange!0 (index!6827 lt!133499) (mask!11208 thiss!1504)) (and (bvsge (index!6827 lt!133499) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133499) (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!263623 d!63765))

(declare-fun d!63767 () Bool)

(declare-fun e!171154 () Bool)

(assert (=> d!63767 e!171154))

(declare-fun res!128947 () Bool)

(assert (=> d!63767 (=> res!128947 e!171154)))

(declare-fun lt!133737 () Bool)

(assert (=> d!63767 (= res!128947 (not lt!133737))))

(declare-fun lt!133739 () Bool)

(assert (=> d!63767 (= lt!133737 lt!133739)))

(declare-fun lt!133738 () Unit!8164)

(declare-fun e!171155 () Unit!8164)

(assert (=> d!63767 (= lt!133738 e!171155)))

(declare-fun c!45164 () Bool)

(assert (=> d!63767 (= c!45164 lt!133739)))

(assert (=> d!63767 (= lt!133739 (containsKey!312 (toList!1916 lt!133445) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63767 (= (contains!1885 lt!133445 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133737)))

(declare-fun b!264170 () Bool)

(declare-fun lt!133736 () Unit!8164)

(assert (=> b!264170 (= e!171155 lt!133736)))

(assert (=> b!264170 (= lt!133736 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133445) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264170 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133445) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264171 () Bool)

(declare-fun Unit!8208 () Unit!8164)

(assert (=> b!264171 (= e!171155 Unit!8208)))

(declare-fun b!264172 () Bool)

(assert (=> b!264172 (= e!171154 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133445) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63767 c!45164) b!264170))

(assert (= (and d!63767 (not c!45164)) b!264171))

(assert (= (and d!63767 (not res!128947)) b!264172))

(declare-fun m!281011 () Bool)

(assert (=> d!63767 m!281011))

(declare-fun m!281013 () Bool)

(assert (=> b!264170 m!281013))

(assert (=> b!264170 m!280761))

(assert (=> b!264170 m!280761))

(declare-fun m!281015 () Bool)

(assert (=> b!264170 m!281015))

(assert (=> b!264172 m!280761))

(assert (=> b!264172 m!280761))

(assert (=> b!264172 m!281015))

(assert (=> bm!25206 d!63767))

(declare-fun b!264176 () Bool)

(declare-fun e!171157 () Option!327)

(assert (=> b!264176 (= e!171157 None!325)))

(declare-fun b!264174 () Bool)

(declare-fun e!171156 () Option!327)

(assert (=> b!264174 (= e!171156 e!171157)))

(declare-fun c!45166 () Bool)

(assert (=> b!264174 (= c!45166 (and ((_ is Cons!3759) (toList!1916 lt!133577)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133577))) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264175 () Bool)

(assert (=> b!264175 (= e!171157 (getValueByKey!321 (t!8832 (toList!1916 lt!133577)) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun d!63769 () Bool)

(declare-fun c!45165 () Bool)

(assert (=> d!63769 (= c!45165 (and ((_ is Cons!3759) (toList!1916 lt!133577)) (= (_1!2454 (h!4425 (toList!1916 lt!133577))) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63769 (= (getValueByKey!321 (toList!1916 lt!133577) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) e!171156)))

(declare-fun b!264173 () Bool)

(assert (=> b!264173 (= e!171156 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133577)))))))

(assert (= (and d!63769 c!45165) b!264173))

(assert (= (and d!63769 (not c!45165)) b!264174))

(assert (= (and b!264174 c!45166) b!264175))

(assert (= (and b!264174 (not c!45166)) b!264176))

(declare-fun m!281017 () Bool)

(assert (=> b!264175 m!281017))

(assert (=> b!263742 d!63769))

(declare-fun d!63771 () Bool)

(declare-fun e!171158 () Bool)

(assert (=> d!63771 e!171158))

(declare-fun res!128948 () Bool)

(assert (=> d!63771 (=> (not res!128948) (not e!171158))))

(declare-fun lt!133741 () ListLongMap!3801)

(assert (=> d!63771 (= res!128948 (contains!1885 lt!133741 (_1!2454 (tuple2!4887 lt!133381 lt!133383))))))

(declare-fun lt!133742 () List!3763)

(assert (=> d!63771 (= lt!133741 (ListLongMap!3802 lt!133742))))

(declare-fun lt!133743 () Unit!8164)

(declare-fun lt!133740 () Unit!8164)

(assert (=> d!63771 (= lt!133743 lt!133740)))

(assert (=> d!63771 (= (getValueByKey!321 lt!133742 (_1!2454 (tuple2!4887 lt!133381 lt!133383))) (Some!326 (_2!2454 (tuple2!4887 lt!133381 lt!133383))))))

(assert (=> d!63771 (= lt!133740 (lemmaContainsTupThenGetReturnValue!177 lt!133742 (_1!2454 (tuple2!4887 lt!133381 lt!133383)) (_2!2454 (tuple2!4887 lt!133381 lt!133383))))))

(assert (=> d!63771 (= lt!133742 (insertStrictlySorted!180 (toList!1916 lt!133382) (_1!2454 (tuple2!4887 lt!133381 lt!133383)) (_2!2454 (tuple2!4887 lt!133381 lt!133383))))))

(assert (=> d!63771 (= (+!712 lt!133382 (tuple2!4887 lt!133381 lt!133383)) lt!133741)))

(declare-fun b!264177 () Bool)

(declare-fun res!128949 () Bool)

(assert (=> b!264177 (=> (not res!128949) (not e!171158))))

(assert (=> b!264177 (= res!128949 (= (getValueByKey!321 (toList!1916 lt!133741) (_1!2454 (tuple2!4887 lt!133381 lt!133383))) (Some!326 (_2!2454 (tuple2!4887 lt!133381 lt!133383)))))))

(declare-fun b!264178 () Bool)

(assert (=> b!264178 (= e!171158 (contains!1888 (toList!1916 lt!133741) (tuple2!4887 lt!133381 lt!133383)))))

(assert (= (and d!63771 res!128948) b!264177))

(assert (= (and b!264177 res!128949) b!264178))

(declare-fun m!281019 () Bool)

(assert (=> d!63771 m!281019))

(declare-fun m!281021 () Bool)

(assert (=> d!63771 m!281021))

(declare-fun m!281023 () Bool)

(assert (=> d!63771 m!281023))

(declare-fun m!281025 () Bool)

(assert (=> d!63771 m!281025))

(declare-fun m!281027 () Bool)

(assert (=> b!264177 m!281027))

(declare-fun m!281029 () Bool)

(assert (=> b!264178 m!281029))

(assert (=> b!263405 d!63771))

(declare-fun d!63773 () Bool)

(declare-fun e!171159 () Bool)

(assert (=> d!63773 e!171159))

(declare-fun res!128950 () Bool)

(assert (=> d!63773 (=> (not res!128950) (not e!171159))))

(declare-fun lt!133745 () ListLongMap!3801)

(assert (=> d!63773 (= res!128950 (contains!1885 lt!133745 (_1!2454 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!133746 () List!3763)

(assert (=> d!63773 (= lt!133745 (ListLongMap!3802 lt!133746))))

(declare-fun lt!133747 () Unit!8164)

(declare-fun lt!133744 () Unit!8164)

(assert (=> d!63773 (= lt!133747 lt!133744)))

(assert (=> d!63773 (= (getValueByKey!321 lt!133746 (_1!2454 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!326 (_2!2454 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63773 (= lt!133744 (lemmaContainsTupThenGetReturnValue!177 lt!133746 (_1!2454 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2454 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63773 (= lt!133746 (insertStrictlySorted!180 (toList!1916 call!25193) (_1!2454 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2454 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!63773 (= (+!712 call!25193 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!133745)))

(declare-fun b!264179 () Bool)

(declare-fun res!128951 () Bool)

(assert (=> b!264179 (=> (not res!128951) (not e!171159))))

(assert (=> b!264179 (= res!128951 (= (getValueByKey!321 (toList!1916 lt!133745) (_1!2454 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!326 (_2!2454 (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!264180 () Bool)

(assert (=> b!264180 (= e!171159 (contains!1888 (toList!1916 lt!133745) (tuple2!4887 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!63773 res!128950) b!264179))

(assert (= (and b!264179 res!128951) b!264180))

(declare-fun m!281031 () Bool)

(assert (=> d!63773 m!281031))

(declare-fun m!281033 () Bool)

(assert (=> d!63773 m!281033))

(declare-fun m!281035 () Bool)

(assert (=> d!63773 m!281035))

(declare-fun m!281037 () Bool)

(assert (=> d!63773 m!281037))

(declare-fun m!281039 () Bool)

(assert (=> b!264179 m!281039))

(declare-fun m!281041 () Bool)

(assert (=> b!264180 m!281041))

(assert (=> b!263405 d!63773))

(declare-fun d!63775 () Bool)

(assert (=> d!63775 (not (contains!1885 (+!712 lt!133382 (tuple2!4887 lt!133381 lt!133383)) lt!133384))))

(declare-fun lt!133750 () Unit!8164)

(declare-fun choose!1304 (ListLongMap!3801 (_ BitVec 64) V!8521 (_ BitVec 64)) Unit!8164)

(assert (=> d!63775 (= lt!133750 (choose!1304 lt!133382 lt!133381 lt!133383 lt!133384))))

(declare-fun e!171162 () Bool)

(assert (=> d!63775 e!171162))

(declare-fun res!128954 () Bool)

(assert (=> d!63775 (=> (not res!128954) (not e!171162))))

(assert (=> d!63775 (= res!128954 (not (contains!1885 lt!133382 lt!133384)))))

(assert (=> d!63775 (= (addStillNotContains!131 lt!133382 lt!133381 lt!133383 lt!133384) lt!133750)))

(declare-fun b!264184 () Bool)

(assert (=> b!264184 (= e!171162 (not (= lt!133381 lt!133384)))))

(assert (= (and d!63775 res!128954) b!264184))

(assert (=> d!63775 m!279671))

(assert (=> d!63775 m!279671))

(assert (=> d!63775 m!279673))

(declare-fun m!281043 () Bool)

(assert (=> d!63775 m!281043))

(declare-fun m!281045 () Bool)

(assert (=> d!63775 m!281045))

(assert (=> b!263405 d!63775))

(assert (=> b!263405 d!63311))

(declare-fun d!63777 () Bool)

(declare-fun e!171163 () Bool)

(assert (=> d!63777 e!171163))

(declare-fun res!128955 () Bool)

(assert (=> d!63777 (=> res!128955 e!171163)))

(declare-fun lt!133752 () Bool)

(assert (=> d!63777 (= res!128955 (not lt!133752))))

(declare-fun lt!133754 () Bool)

(assert (=> d!63777 (= lt!133752 lt!133754)))

(declare-fun lt!133753 () Unit!8164)

(declare-fun e!171164 () Unit!8164)

(assert (=> d!63777 (= lt!133753 e!171164)))

(declare-fun c!45167 () Bool)

(assert (=> d!63777 (= c!45167 lt!133754)))

(assert (=> d!63777 (= lt!133754 (containsKey!312 (toList!1916 (+!712 lt!133382 (tuple2!4887 lt!133381 lt!133383))) lt!133384))))

(assert (=> d!63777 (= (contains!1885 (+!712 lt!133382 (tuple2!4887 lt!133381 lt!133383)) lt!133384) lt!133752)))

(declare-fun b!264185 () Bool)

(declare-fun lt!133751 () Unit!8164)

(assert (=> b!264185 (= e!171164 lt!133751)))

(assert (=> b!264185 (= lt!133751 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (+!712 lt!133382 (tuple2!4887 lt!133381 lt!133383))) lt!133384))))

(assert (=> b!264185 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133382 (tuple2!4887 lt!133381 lt!133383))) lt!133384))))

(declare-fun b!264186 () Bool)

(declare-fun Unit!8209 () Unit!8164)

(assert (=> b!264186 (= e!171164 Unit!8209)))

(declare-fun b!264187 () Bool)

(assert (=> b!264187 (= e!171163 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133382 (tuple2!4887 lt!133381 lt!133383))) lt!133384)))))

(assert (= (and d!63777 c!45167) b!264185))

(assert (= (and d!63777 (not c!45167)) b!264186))

(assert (= (and d!63777 (not res!128955)) b!264187))

(declare-fun m!281047 () Bool)

(assert (=> d!63777 m!281047))

(declare-fun m!281049 () Bool)

(assert (=> b!264185 m!281049))

(declare-fun m!281051 () Bool)

(assert (=> b!264185 m!281051))

(assert (=> b!264185 m!281051))

(declare-fun m!281053 () Bool)

(assert (=> b!264185 m!281053))

(assert (=> b!264187 m!281051))

(assert (=> b!264187 m!281051))

(assert (=> b!264187 m!281053))

(assert (=> b!263405 d!63777))

(declare-fun d!63779 () Bool)

(declare-fun c!45168 () Bool)

(assert (=> d!63779 (= c!45168 ((_ is Nil!3760) (toList!1916 lt!133176)))))

(declare-fun e!171165 () (InoxSet tuple2!4886))

(assert (=> d!63779 (= (content!178 (toList!1916 lt!133176)) e!171165)))

(declare-fun b!264188 () Bool)

(assert (=> b!264188 (= e!171165 ((as const (Array tuple2!4886 Bool)) false))))

(declare-fun b!264189 () Bool)

(assert (=> b!264189 (= e!171165 ((_ map or) (store ((as const (Array tuple2!4886 Bool)) false) (h!4425 (toList!1916 lt!133176)) true) (content!178 (t!8832 (toList!1916 lt!133176)))))))

(assert (= (and d!63779 c!45168) b!264188))

(assert (= (and d!63779 (not c!45168)) b!264189))

(declare-fun m!281055 () Bool)

(assert (=> b!264189 m!281055))

(assert (=> b!264189 m!281005))

(assert (=> d!63339 d!63779))

(declare-fun lt!133755 () Bool)

(declare-fun d!63781 () Bool)

(assert (=> d!63781 (= lt!133755 (select (content!178 (toList!1916 lt!133538)) (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun e!171167 () Bool)

(assert (=> d!63781 (= lt!133755 e!171167)))

(declare-fun res!128957 () Bool)

(assert (=> d!63781 (=> (not res!128957) (not e!171167))))

(assert (=> d!63781 (= res!128957 ((_ is Cons!3759) (toList!1916 lt!133538)))))

(assert (=> d!63781 (= (contains!1888 (toList!1916 lt!133538) (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133755)))

(declare-fun b!264190 () Bool)

(declare-fun e!171166 () Bool)

(assert (=> b!264190 (= e!171167 e!171166)))

(declare-fun res!128956 () Bool)

(assert (=> b!264190 (=> res!128956 e!171166)))

(assert (=> b!264190 (= res!128956 (= (h!4425 (toList!1916 lt!133538)) (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!264191 () Bool)

(assert (=> b!264191 (= e!171166 (contains!1888 (t!8832 (toList!1916 lt!133538)) (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63781 res!128957) b!264190))

(assert (= (and b!264190 (not res!128956)) b!264191))

(declare-fun m!281057 () Bool)

(assert (=> d!63781 m!281057))

(declare-fun m!281059 () Bool)

(assert (=> d!63781 m!281059))

(declare-fun m!281061 () Bool)

(assert (=> b!264191 m!281061))

(assert (=> b!263664 d!63781))

(declare-fun b!264192 () Bool)

(declare-fun e!171171 () Bool)

(declare-fun call!25267 () Bool)

(assert (=> b!264192 (= e!171171 call!25267)))

(declare-fun e!171168 () Bool)

(declare-fun b!264193 () Bool)

(assert (=> b!264193 (= e!171168 (contains!1889 (ite c!44985 (Cons!3760 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!264194 () Bool)

(declare-fun e!171170 () Bool)

(assert (=> b!264194 (= e!171170 e!171171)))

(declare-fun c!45169 () Bool)

(assert (=> b!264194 (= c!45169 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!264195 () Bool)

(assert (=> b!264195 (= e!171171 call!25267)))

(declare-fun bm!25264 () Bool)

(assert (=> bm!25264 (= call!25267 (arrayNoDuplicates!0 lt!133005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45169 (Cons!3760 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!44985 (Cons!3760 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761))) (ite c!44985 (Cons!3760 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)))))))

(declare-fun b!264196 () Bool)

(declare-fun e!171169 () Bool)

(assert (=> b!264196 (= e!171169 e!171170)))

(declare-fun res!128958 () Bool)

(assert (=> b!264196 (=> (not res!128958) (not e!171170))))

(assert (=> b!264196 (= res!128958 (not e!171168))))

(declare-fun res!128960 () Bool)

(assert (=> b!264196 (=> (not res!128960) (not e!171168))))

(assert (=> b!264196 (= res!128960 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!63783 () Bool)

(declare-fun res!128959 () Bool)

(assert (=> d!63783 (=> res!128959 e!171169)))

(assert (=> d!63783 (= res!128959 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(assert (=> d!63783 (= (arrayNoDuplicates!0 lt!133005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!44985 (Cons!3760 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (ite c!44889 (Cons!3760 (select (arr!5996 lt!133005) #b00000000000000000000000000000000) Nil!3761) Nil!3761))) e!171169)))

(assert (= (and d!63783 (not res!128959)) b!264196))

(assert (= (and b!264196 res!128960) b!264193))

(assert (= (and b!264196 res!128958) b!264194))

(assert (= (and b!264194 c!45169) b!264195))

(assert (= (and b!264194 (not c!45169)) b!264192))

(assert (= (or b!264195 b!264192) bm!25264))

(assert (=> b!264193 m!280863))

(assert (=> b!264193 m!280863))

(declare-fun m!281063 () Bool)

(assert (=> b!264193 m!281063))

(assert (=> b!264194 m!280863))

(assert (=> b!264194 m!280863))

(declare-fun m!281065 () Bool)

(assert (=> b!264194 m!281065))

(assert (=> bm!25264 m!280863))

(declare-fun m!281067 () Bool)

(assert (=> bm!25264 m!281067))

(assert (=> b!264196 m!280863))

(assert (=> b!264196 m!280863))

(assert (=> b!264196 m!281065))

(assert (=> bm!25210 d!63783))

(declare-fun d!63785 () Bool)

(declare-fun e!171172 () Bool)

(assert (=> d!63785 e!171172))

(declare-fun res!128961 () Bool)

(assert (=> d!63785 (=> res!128961 e!171172)))

(declare-fun lt!133757 () Bool)

(assert (=> d!63785 (= res!128961 (not lt!133757))))

(declare-fun lt!133759 () Bool)

(assert (=> d!63785 (= lt!133757 lt!133759)))

(declare-fun lt!133758 () Unit!8164)

(declare-fun e!171173 () Unit!8164)

(assert (=> d!63785 (= lt!133758 e!171173)))

(declare-fun c!45170 () Bool)

(assert (=> d!63785 (= c!45170 lt!133759)))

(assert (=> d!63785 (= lt!133759 (containsKey!312 (toList!1916 lt!133397) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!63785 (= (contains!1885 lt!133397 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) lt!133757)))

(declare-fun b!264197 () Bool)

(declare-fun lt!133756 () Unit!8164)

(assert (=> b!264197 (= e!171173 lt!133756)))

(assert (=> b!264197 (= lt!133756 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133397) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(assert (=> b!264197 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133397) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264198 () Bool)

(declare-fun Unit!8210 () Unit!8164)

(assert (=> b!264198 (= e!171173 Unit!8210)))

(declare-fun b!264199 () Bool)

(assert (=> b!264199 (= e!171172 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133397) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63785 c!45170) b!264197))

(assert (= (and d!63785 (not c!45170)) b!264198))

(assert (= (and d!63785 (not res!128961)) b!264199))

(declare-fun m!281069 () Bool)

(assert (=> d!63785 m!281069))

(declare-fun m!281071 () Bool)

(assert (=> b!264197 m!281071))

(assert (=> b!264197 m!279721))

(assert (=> b!264197 m!279721))

(declare-fun m!281073 () Bool)

(assert (=> b!264197 m!281073))

(assert (=> b!264199 m!279721))

(assert (=> b!264199 m!279721))

(assert (=> b!264199 m!281073))

(assert (=> d!63263 d!63785))

(declare-fun b!264203 () Bool)

(declare-fun e!171175 () Option!327)

(assert (=> b!264203 (= e!171175 None!325)))

(declare-fun b!264201 () Bool)

(declare-fun e!171174 () Option!327)

(assert (=> b!264201 (= e!171174 e!171175)))

(declare-fun c!45172 () Bool)

(assert (=> b!264201 (= c!45172 (and ((_ is Cons!3759) lt!133398) (not (= (_1!2454 (h!4425 lt!133398)) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!264202 () Bool)

(assert (=> b!264202 (= e!171175 (getValueByKey!321 (t!8832 lt!133398) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(declare-fun d!63787 () Bool)

(declare-fun c!45171 () Bool)

(assert (=> d!63787 (= c!45171 (and ((_ is Cons!3759) lt!133398) (= (_1!2454 (h!4425 lt!133398)) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63787 (= (getValueByKey!321 lt!133398 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) e!171174)))

(declare-fun b!264200 () Bool)

(assert (=> b!264200 (= e!171174 (Some!326 (_2!2454 (h!4425 lt!133398))))))

(assert (= (and d!63787 c!45171) b!264200))

(assert (= (and d!63787 (not c!45171)) b!264201))

(assert (= (and b!264201 c!45172) b!264202))

(assert (= (and b!264201 (not c!45172)) b!264203))

(declare-fun m!281075 () Bool)

(assert (=> b!264202 m!281075))

(assert (=> d!63263 d!63787))

(declare-fun d!63789 () Bool)

(assert (=> d!63789 (= (getValueByKey!321 lt!133398 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133760 () Unit!8164)

(assert (=> d!63789 (= lt!133760 (choose!1302 lt!133398 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(declare-fun e!171176 () Bool)

(assert (=> d!63789 e!171176))

(declare-fun res!128962 () Bool)

(assert (=> d!63789 (=> (not res!128962) (not e!171176))))

(assert (=> d!63789 (= res!128962 (isStrictlySorted!364 lt!133398))))

(assert (=> d!63789 (= (lemmaContainsTupThenGetReturnValue!177 lt!133398 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) lt!133760)))

(declare-fun b!264204 () Bool)

(declare-fun res!128963 () Bool)

(assert (=> b!264204 (=> (not res!128963) (not e!171176))))

(assert (=> b!264204 (= res!128963 (containsKey!312 lt!133398 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264205 () Bool)

(assert (=> b!264205 (= e!171176 (contains!1888 lt!133398 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!63789 res!128962) b!264204))

(assert (= (and b!264204 res!128963) b!264205))

(assert (=> d!63789 m!279715))

(declare-fun m!281077 () Bool)

(assert (=> d!63789 m!281077))

(declare-fun m!281079 () Bool)

(assert (=> d!63789 m!281079))

(declare-fun m!281081 () Bool)

(assert (=> b!264204 m!281081))

(declare-fun m!281083 () Bool)

(assert (=> b!264205 m!281083))

(assert (=> d!63263 d!63789))

(declare-fun b!264206 () Bool)

(declare-fun e!171179 () List!3763)

(declare-fun call!25270 () List!3763)

(assert (=> b!264206 (= e!171179 call!25270)))

(declare-fun b!264207 () Bool)

(declare-fun e!171181 () List!3763)

(declare-fun call!25268 () List!3763)

(assert (=> b!264207 (= e!171181 call!25268)))

(declare-fun b!264208 () Bool)

(assert (=> b!264208 (= e!171179 call!25270)))

(declare-fun bm!25265 () Bool)

(declare-fun c!45174 () Bool)

(declare-fun call!25269 () List!3763)

(declare-fun e!171177 () List!3763)

(assert (=> bm!25265 (= call!25269 ($colon$colon!107 e!171177 (ite c!45174 (h!4425 (toList!1916 lt!133313)) (tuple2!4887 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))))

(declare-fun c!45176 () Bool)

(assert (=> bm!25265 (= c!45176 c!45174)))

(declare-fun b!264209 () Bool)

(declare-fun c!45175 () Bool)

(declare-fun c!45173 () Bool)

(assert (=> b!264209 (= e!171177 (ite c!45175 (t!8832 (toList!1916 lt!133313)) (ite c!45173 (Cons!3759 (h!4425 (toList!1916 lt!133313)) (t!8832 (toList!1916 lt!133313))) Nil!3760)))))

(declare-fun b!264210 () Bool)

(assert (=> b!264210 (= e!171177 (insertStrictlySorted!180 (t!8832 (toList!1916 lt!133313)) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(declare-fun bm!25266 () Bool)

(assert (=> bm!25266 (= call!25270 call!25268)))

(declare-fun d!63791 () Bool)

(declare-fun e!171180 () Bool)

(assert (=> d!63791 e!171180))

(declare-fun res!128964 () Bool)

(assert (=> d!63791 (=> (not res!128964) (not e!171180))))

(declare-fun lt!133761 () List!3763)

(assert (=> d!63791 (= res!128964 (isStrictlySorted!364 lt!133761))))

(declare-fun e!171178 () List!3763)

(assert (=> d!63791 (= lt!133761 e!171178)))

(assert (=> d!63791 (= c!45174 (and ((_ is Cons!3759) (toList!1916 lt!133313)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133313))) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63791 (isStrictlySorted!364 (toList!1916 lt!133313))))

(assert (=> d!63791 (= (insertStrictlySorted!180 (toList!1916 lt!133313) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) lt!133761)))

(declare-fun b!264211 () Bool)

(assert (=> b!264211 (= e!171178 call!25269)))

(declare-fun bm!25267 () Bool)

(assert (=> bm!25267 (= call!25268 call!25269)))

(declare-fun b!264212 () Bool)

(assert (=> b!264212 (= e!171178 e!171181)))

(assert (=> b!264212 (= c!45175 (and ((_ is Cons!3759) (toList!1916 lt!133313)) (= (_1!2454 (h!4425 (toList!1916 lt!133313))) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!264213 () Bool)

(assert (=> b!264213 (= e!171180 (contains!1888 lt!133761 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!264214 () Bool)

(assert (=> b!264214 (= c!45173 (and ((_ is Cons!3759) (toList!1916 lt!133313)) (bvsgt (_1!2454 (h!4425 (toList!1916 lt!133313))) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))))

(assert (=> b!264214 (= e!171181 e!171179)))

(declare-fun b!264215 () Bool)

(declare-fun res!128965 () Bool)

(assert (=> b!264215 (=> (not res!128965) (not e!171180))))

(assert (=> b!264215 (= res!128965 (containsKey!312 lt!133761 (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!63791 c!45174) b!264211))

(assert (= (and d!63791 (not c!45174)) b!264212))

(assert (= (and b!264212 c!45175) b!264207))

(assert (= (and b!264212 (not c!45175)) b!264214))

(assert (= (and b!264214 c!45173) b!264206))

(assert (= (and b!264214 (not c!45173)) b!264208))

(assert (= (or b!264206 b!264208) bm!25266))

(assert (= (or b!264207 bm!25266) bm!25267))

(assert (= (or b!264211 bm!25267) bm!25265))

(assert (= (and bm!25265 c!45176) b!264210))

(assert (= (and bm!25265 (not c!45176)) b!264209))

(assert (= (and d!63791 res!128964) b!264215))

(assert (= (and b!264215 res!128965) b!264213))

(declare-fun m!281085 () Bool)

(assert (=> b!264215 m!281085))

(declare-fun m!281087 () Bool)

(assert (=> b!264213 m!281087))

(declare-fun m!281089 () Bool)

(assert (=> b!264210 m!281089))

(declare-fun m!281091 () Bool)

(assert (=> bm!25265 m!281091))

(declare-fun m!281093 () Bool)

(assert (=> d!63791 m!281093))

(declare-fun m!281095 () Bool)

(assert (=> d!63791 m!281095))

(assert (=> d!63263 d!63791))

(assert (=> b!263618 d!63663))

(assert (=> b!263618 d!63665))

(declare-fun d!63793 () Bool)

(declare-fun res!128966 () Bool)

(declare-fun e!171182 () Bool)

(assert (=> d!63793 (=> res!128966 e!171182)))

(assert (=> d!63793 (= res!128966 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133003))) (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133003)))) key!932)))))

(assert (=> d!63793 (= (containsKey!312 (t!8832 (toList!1916 lt!133003)) key!932) e!171182)))

(declare-fun b!264216 () Bool)

(declare-fun e!171183 () Bool)

(assert (=> b!264216 (= e!171182 e!171183)))

(declare-fun res!128967 () Bool)

(assert (=> b!264216 (=> (not res!128967) (not e!171183))))

(assert (=> b!264216 (= res!128967 (and (or (not ((_ is Cons!3759) (t!8832 (toList!1916 lt!133003)))) (bvsle (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133003)))) key!932)) ((_ is Cons!3759) (t!8832 (toList!1916 lt!133003))) (bvslt (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133003)))) key!932)))))

(declare-fun b!264217 () Bool)

(assert (=> b!264217 (= e!171183 (containsKey!312 (t!8832 (t!8832 (toList!1916 lt!133003))) key!932))))

(assert (= (and d!63793 (not res!128966)) b!264216))

(assert (= (and b!264216 res!128967) b!264217))

(declare-fun m!281097 () Bool)

(assert (=> b!264217 m!281097))

(assert (=> b!263749 d!63793))

(assert (=> b!263401 d!63225))

(declare-fun d!63795 () Bool)

(assert (=> d!63795 (= (get!3102 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263759 d!63795))

(assert (=> d!63365 d!63165))

(declare-fun d!63797 () Bool)

(declare-fun lt!133762 () Bool)

(assert (=> d!63797 (= lt!133762 (select (content!177 Nil!3761) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!171185 () Bool)

(assert (=> d!63797 (= lt!133762 e!171185)))

(declare-fun res!128969 () Bool)

(assert (=> d!63797 (=> (not res!128969) (not e!171185))))

(assert (=> d!63797 (= res!128969 ((_ is Cons!3760) Nil!3761))))

(assert (=> d!63797 (= (contains!1889 Nil!3761 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) lt!133762)))

(declare-fun b!264218 () Bool)

(declare-fun e!171184 () Bool)

(assert (=> b!264218 (= e!171185 e!171184)))

(declare-fun res!128968 () Bool)

(assert (=> b!264218 (=> res!128968 e!171184)))

(assert (=> b!264218 (= res!128968 (= (h!4426 Nil!3761) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!264219 () Bool)

(assert (=> b!264219 (= e!171184 (contains!1889 (t!8833 Nil!3761) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63797 res!128969) b!264218))

(assert (= (and b!264218 (not res!128968)) b!264219))

(assert (=> d!63797 m!279781))

(assert (=> d!63797 m!279365))

(declare-fun m!281099 () Bool)

(assert (=> d!63797 m!281099))

(assert (=> b!264219 m!279365))

(declare-fun m!281101 () Bool)

(assert (=> b!264219 m!281101))

(assert (=> b!263734 d!63797))

(declare-fun b!264223 () Bool)

(declare-fun e!171187 () Option!327)

(assert (=> b!264223 (= e!171187 None!325)))

(declare-fun b!264221 () Bool)

(declare-fun e!171186 () Option!327)

(assert (=> b!264221 (= e!171186 e!171187)))

(declare-fun c!45178 () Bool)

(assert (=> b!264221 (= c!45178 (and ((_ is Cons!3759) (toList!1916 lt!133389)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133389))) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264222 () Bool)

(assert (=> b!264222 (= e!171187 (getValueByKey!321 (t!8832 (toList!1916 lt!133389)) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(declare-fun d!63799 () Bool)

(declare-fun c!45177 () Bool)

(assert (=> d!63799 (= c!45177 (and ((_ is Cons!3759) (toList!1916 lt!133389)) (= (_1!2454 (h!4425 (toList!1916 lt!133389))) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))))

(assert (=> d!63799 (= (getValueByKey!321 (toList!1916 lt!133389) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) e!171186)))

(declare-fun b!264220 () Bool)

(assert (=> b!264220 (= e!171186 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133389)))))))

(assert (= (and d!63799 c!45177) b!264220))

(assert (= (and d!63799 (not c!45177)) b!264221))

(assert (= (and b!264221 c!45178) b!264222))

(assert (= (and b!264221 (not c!45178)) b!264223))

(declare-fun m!281103 () Bool)

(assert (=> b!264222 m!281103))

(assert (=> b!263412 d!63799))

(declare-fun d!63801 () Bool)

(declare-fun e!171188 () Bool)

(assert (=> d!63801 e!171188))

(declare-fun res!128970 () Bool)

(assert (=> d!63801 (=> res!128970 e!171188)))

(declare-fun lt!133764 () Bool)

(assert (=> d!63801 (= res!128970 (not lt!133764))))

(declare-fun lt!133766 () Bool)

(assert (=> d!63801 (= lt!133764 lt!133766)))

(declare-fun lt!133765 () Unit!8164)

(declare-fun e!171189 () Unit!8164)

(assert (=> d!63801 (= lt!133765 e!171189)))

(declare-fun c!45179 () Bool)

(assert (=> d!63801 (= c!45179 lt!133766)))

(assert (=> d!63801 (= lt!133766 (containsKey!312 (toList!1916 lt!133517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63801 (= (contains!1885 lt!133517 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133764)))

(declare-fun b!264224 () Bool)

(declare-fun lt!133763 () Unit!8164)

(assert (=> b!264224 (= e!171189 lt!133763)))

(assert (=> b!264224 (= lt!133763 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264224 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264225 () Bool)

(declare-fun Unit!8211 () Unit!8164)

(assert (=> b!264225 (= e!171189 Unit!8211)))

(declare-fun b!264226 () Bool)

(assert (=> b!264226 (= e!171188 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133517) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63801 c!45179) b!264224))

(assert (= (and d!63801 (not c!45179)) b!264225))

(assert (= (and d!63801 (not res!128970)) b!264226))

(declare-fun m!281105 () Bool)

(assert (=> d!63801 m!281105))

(declare-fun m!281107 () Bool)

(assert (=> b!264224 m!281107))

(declare-fun m!281109 () Bool)

(assert (=> b!264224 m!281109))

(assert (=> b!264224 m!281109))

(declare-fun m!281111 () Bool)

(assert (=> b!264224 m!281111))

(assert (=> b!264226 m!281109))

(assert (=> b!264226 m!281109))

(assert (=> b!264226 m!281111))

(assert (=> b!263635 d!63801))

(assert (=> d!63321 d!63237))

(declare-fun d!63803 () Bool)

(assert (=> d!63803 (= (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) lt!133258)) (v!5509 (getValueByKey!321 (toList!1916 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) lt!133258)))))

(assert (=> d!63383 d!63803))

(declare-fun b!264230 () Bool)

(declare-fun e!171191 () Option!327)

(assert (=> b!264230 (= e!171191 None!325)))

(declare-fun b!264228 () Bool)

(declare-fun e!171190 () Option!327)

(assert (=> b!264228 (= e!171190 e!171191)))

(declare-fun c!45181 () Bool)

(assert (=> b!264228 (= c!45181 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))) (not (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))) lt!133258))))))

(declare-fun b!264229 () Bool)

(assert (=> b!264229 (= e!171191 (getValueByKey!321 (t!8832 (toList!1916 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))) lt!133258))))

(declare-fun c!45180 () Bool)

(declare-fun d!63805 () Bool)

(assert (=> d!63805 (= c!45180 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))) (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))) lt!133258)))))

(assert (=> d!63805 (= (getValueByKey!321 (toList!1916 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) lt!133258) e!171190)))

(declare-fun b!264227 () Bool)

(assert (=> b!264227 (= e!171190 (Some!326 (_2!2454 (h!4425 (toList!1916 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))))))

(assert (= (and d!63805 c!45180) b!264227))

(assert (= (and d!63805 (not c!45180)) b!264228))

(assert (= (and b!264228 c!45181) b!264229))

(assert (= (and b!264228 (not c!45181)) b!264230))

(declare-fun m!281113 () Bool)

(assert (=> b!264229 m!281113))

(assert (=> d!63383 d!63805))

(declare-fun d!63807 () Bool)

(declare-fun res!128971 () Bool)

(declare-fun e!171192 () Bool)

(assert (=> d!63807 (=> res!128971 e!171192)))

(assert (=> d!63807 (= res!128971 (and ((_ is Cons!3759) lt!133177) (= (_1!2454 (h!4425 lt!133177)) (_1!2454 lt!133017))))))

(assert (=> d!63807 (= (containsKey!312 lt!133177 (_1!2454 lt!133017)) e!171192)))

(declare-fun b!264231 () Bool)

(declare-fun e!171193 () Bool)

(assert (=> b!264231 (= e!171192 e!171193)))

(declare-fun res!128972 () Bool)

(assert (=> b!264231 (=> (not res!128972) (not e!171193))))

(assert (=> b!264231 (= res!128972 (and (or (not ((_ is Cons!3759) lt!133177)) (bvsle (_1!2454 (h!4425 lt!133177)) (_1!2454 lt!133017))) ((_ is Cons!3759) lt!133177) (bvslt (_1!2454 (h!4425 lt!133177)) (_1!2454 lt!133017))))))

(declare-fun b!264232 () Bool)

(assert (=> b!264232 (= e!171193 (containsKey!312 (t!8832 lt!133177) (_1!2454 lt!133017)))))

(assert (= (and d!63807 (not res!128971)) b!264231))

(assert (= (and b!264231 res!128972) b!264232))

(declare-fun m!281115 () Bool)

(assert (=> b!264232 m!281115))

(assert (=> b!263453 d!63807))

(declare-fun d!63809 () Bool)

(assert (=> d!63809 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133249) lt!133258)) (v!5509 (getValueByKey!321 (toList!1916 lt!133249) lt!133258)))))

(assert (=> d!63391 d!63809))

(declare-fun b!264236 () Bool)

(declare-fun e!171195 () Option!327)

(assert (=> b!264236 (= e!171195 None!325)))

(declare-fun b!264234 () Bool)

(declare-fun e!171194 () Option!327)

(assert (=> b!264234 (= e!171194 e!171195)))

(declare-fun c!45183 () Bool)

(assert (=> b!264234 (= c!45183 (and ((_ is Cons!3759) (toList!1916 lt!133249)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133249))) lt!133258))))))

(declare-fun b!264235 () Bool)

(assert (=> b!264235 (= e!171195 (getValueByKey!321 (t!8832 (toList!1916 lt!133249)) lt!133258))))

(declare-fun d!63811 () Bool)

(declare-fun c!45182 () Bool)

(assert (=> d!63811 (= c!45182 (and ((_ is Cons!3759) (toList!1916 lt!133249)) (= (_1!2454 (h!4425 (toList!1916 lt!133249))) lt!133258)))))

(assert (=> d!63811 (= (getValueByKey!321 (toList!1916 lt!133249) lt!133258) e!171194)))

(declare-fun b!264233 () Bool)

(assert (=> b!264233 (= e!171194 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133249)))))))

(assert (= (and d!63811 c!45182) b!264233))

(assert (= (and d!63811 (not c!45182)) b!264234))

(assert (= (and b!264234 c!45183) b!264235))

(assert (= (and b!264234 (not c!45183)) b!264236))

(declare-fun m!281117 () Bool)

(assert (=> b!264235 m!281117))

(assert (=> d!63391 d!63811))

(declare-fun d!63813 () Bool)

(assert (=> d!63813 (= (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263525 d!63813))

(declare-fun b!264237 () Bool)

(declare-fun e!171196 () SeekEntryResult!1164)

(assert (=> b!264237 (= e!171196 (Intermediate!1164 true (nextIndex!0 (toIndex!0 key!932 (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!264238 () Bool)

(declare-fun e!171197 () SeekEntryResult!1164)

(assert (=> b!264238 (= e!171197 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 key!932 (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (mask!11208 thiss!1504)) key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun b!264239 () Bool)

(declare-fun e!171200 () Bool)

(declare-fun lt!133767 () SeekEntryResult!1164)

(assert (=> b!264239 (= e!171200 (bvsge (x!25206 lt!133767) #b01111111111111111111111111111110))))

(declare-fun b!264240 () Bool)

(declare-fun e!171199 () Bool)

(assert (=> b!264240 (= e!171200 e!171199)))

(declare-fun res!128975 () Bool)

(assert (=> b!264240 (= res!128975 (and ((_ is Intermediate!1164) lt!133767) (not (undefined!1976 lt!133767)) (bvslt (x!25206 lt!133767) #b01111111111111111111111111111110) (bvsge (x!25206 lt!133767) #b00000000000000000000000000000000) (bvsge (x!25206 lt!133767) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264240 (=> (not res!128975) (not e!171199))))

(declare-fun b!264241 () Bool)

(assert (=> b!264241 (and (bvsge (index!6828 lt!133767) #b00000000000000000000000000000000) (bvslt (index!6828 lt!133767) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun res!128974 () Bool)

(assert (=> b!264241 (= res!128974 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6828 lt!133767)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171198 () Bool)

(assert (=> b!264241 (=> res!128974 e!171198)))

(declare-fun b!264242 () Bool)

(assert (=> b!264242 (and (bvsge (index!6828 lt!133767) #b00000000000000000000000000000000) (bvslt (index!6828 lt!133767) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> b!264242 (= e!171198 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6828 lt!133767)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264243 () Bool)

(assert (=> b!264243 (= e!171196 e!171197)))

(declare-fun c!45186 () Bool)

(declare-fun lt!133768 () (_ BitVec 64))

(assert (=> b!264243 (= c!45186 (or (= lt!133768 key!932) (= (bvadd lt!133768 lt!133768) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264244 () Bool)

(assert (=> b!264244 (= e!171197 (Intermediate!1164 false (nextIndex!0 (toIndex!0 key!932 (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!264245 () Bool)

(assert (=> b!264245 (and (bvsge (index!6828 lt!133767) #b00000000000000000000000000000000) (bvslt (index!6828 lt!133767) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun res!128973 () Bool)

(assert (=> b!264245 (= res!128973 (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6828 lt!133767)) key!932))))

(assert (=> b!264245 (=> res!128973 e!171198)))

(assert (=> b!264245 (= e!171199 e!171198)))

(declare-fun d!63815 () Bool)

(assert (=> d!63815 e!171200))

(declare-fun c!45185 () Bool)

(assert (=> d!63815 (= c!45185 (and ((_ is Intermediate!1164) lt!133767) (undefined!1976 lt!133767)))))

(assert (=> d!63815 (= lt!133767 e!171196)))

(declare-fun c!45184 () Bool)

(assert (=> d!63815 (= c!45184 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!63815 (= lt!133768 (select (arr!5996 (_keys!7034 thiss!1504)) (nextIndex!0 (toIndex!0 key!932 (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11208 thiss!1504))))))

(assert (=> d!63815 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63815 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11208 thiss!1504)) key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)) lt!133767)))

(assert (= (and d!63815 c!45184) b!264237))

(assert (= (and d!63815 (not c!45184)) b!264243))

(assert (= (and b!264243 c!45186) b!264244))

(assert (= (and b!264243 (not c!45186)) b!264238))

(assert (= (and d!63815 c!45185) b!264239))

(assert (= (and d!63815 (not c!45185)) b!264240))

(assert (= (and b!264240 res!128975) b!264245))

(assert (= (and b!264245 (not res!128973)) b!264241))

(assert (= (and b!264241 (not res!128974)) b!264242))

(declare-fun m!281119 () Bool)

(assert (=> b!264241 m!281119))

(assert (=> d!63815 m!279641))

(declare-fun m!281121 () Bool)

(assert (=> d!63815 m!281121))

(assert (=> d!63815 m!279317))

(assert (=> b!264242 m!281119))

(assert (=> b!264238 m!279641))

(declare-fun m!281123 () Bool)

(assert (=> b!264238 m!281123))

(assert (=> b!264238 m!281123))

(declare-fun m!281125 () Bool)

(assert (=> b!264238 m!281125))

(assert (=> b!264245 m!281119))

(assert (=> b!263361 d!63815))

(declare-fun d!63817 () Bool)

(declare-fun lt!133771 () (_ BitVec 32))

(assert (=> d!63817 (and (bvsge lt!133771 #b00000000000000000000000000000000) (bvslt lt!133771 (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!63817 (= lt!133771 (choose!52 (toIndex!0 key!932 (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11208 thiss!1504)))))

(assert (=> d!63817 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63817 (= (nextIndex!0 (toIndex!0 key!932 (mask!11208 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!11208 thiss!1504)) lt!133771)))

(declare-fun bs!9326 () Bool)

(assert (= bs!9326 d!63817))

(assert (=> bs!9326 m!279353))

(declare-fun m!281127 () Bool)

(assert (=> bs!9326 m!281127))

(assert (=> bs!9326 m!279317))

(assert (=> b!263361 d!63817))

(declare-fun b!264249 () Bool)

(declare-fun e!171202 () Option!327)

(assert (=> b!264249 (= e!171202 None!325)))

(declare-fun b!264247 () Bool)

(declare-fun e!171201 () Option!327)

(assert (=> b!264247 (= e!171201 e!171202)))

(declare-fun c!45188 () Bool)

(assert (=> b!264247 (= c!45188 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133176))) (not (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133176)))) (_1!2454 lt!133017)))))))

(declare-fun b!264248 () Bool)

(assert (=> b!264248 (= e!171202 (getValueByKey!321 (t!8832 (t!8832 (toList!1916 lt!133176))) (_1!2454 lt!133017)))))

(declare-fun d!63819 () Bool)

(declare-fun c!45187 () Bool)

(assert (=> d!63819 (= c!45187 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133176))) (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133176)))) (_1!2454 lt!133017))))))

(assert (=> d!63819 (= (getValueByKey!321 (t!8832 (toList!1916 lt!133176)) (_1!2454 lt!133017)) e!171201)))

(declare-fun b!264246 () Bool)

(assert (=> b!264246 (= e!171201 (Some!326 (_2!2454 (h!4425 (t!8832 (toList!1916 lt!133176))))))))

(assert (= (and d!63819 c!45187) b!264246))

(assert (= (and d!63819 (not c!45187)) b!264247))

(assert (= (and b!264247 c!45188) b!264248))

(assert (= (and b!264247 (not c!45188)) b!264249))

(declare-fun m!281129 () Bool)

(assert (=> b!264248 m!281129))

(assert (=> b!263740 d!63819))

(declare-fun b!264253 () Bool)

(declare-fun e!171204 () Option!327)

(assert (=> b!264253 (= e!171204 None!325)))

(declare-fun b!264251 () Bool)

(declare-fun e!171203 () Option!327)

(assert (=> b!264251 (= e!171203 e!171204)))

(declare-fun c!45190 () Bool)

(assert (=> b!264251 (= c!45190 (and ((_ is Cons!3759) (toList!1916 lt!133397)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133397))) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!264252 () Bool)

(assert (=> b!264252 (= e!171204 (getValueByKey!321 (t!8832 (toList!1916 lt!133397)) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))))))

(declare-fun c!45189 () Bool)

(declare-fun d!63821 () Bool)

(assert (=> d!63821 (= c!45189 (and ((_ is Cons!3759) (toList!1916 lt!133397)) (= (_1!2454 (h!4425 (toList!1916 lt!133397))) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!63821 (= (getValueByKey!321 (toList!1916 lt!133397) (_1!2454 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504)))) e!171203)))

(declare-fun b!264250 () Bool)

(assert (=> b!264250 (= e!171203 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133397)))))))

(assert (= (and d!63821 c!45189) b!264250))

(assert (= (and d!63821 (not c!45189)) b!264251))

(assert (= (and b!264251 c!45190) b!264252))

(assert (= (and b!264251 (not c!45190)) b!264253))

(declare-fun m!281131 () Bool)

(assert (=> b!264252 m!281131))

(assert (=> b!263417 d!63821))

(declare-fun d!63823 () Bool)

(declare-fun res!128976 () Bool)

(declare-fun e!171205 () Bool)

(assert (=> d!63823 (=> res!128976 e!171205)))

(assert (=> d!63823 (= res!128976 (or ((_ is Nil!3760) lt!133492) ((_ is Nil!3760) (t!8832 lt!133492))))))

(assert (=> d!63823 (= (isStrictlySorted!364 lt!133492) e!171205)))

(declare-fun b!264254 () Bool)

(declare-fun e!171206 () Bool)

(assert (=> b!264254 (= e!171205 e!171206)))

(declare-fun res!128977 () Bool)

(assert (=> b!264254 (=> (not res!128977) (not e!171206))))

(assert (=> b!264254 (= res!128977 (bvslt (_1!2454 (h!4425 lt!133492)) (_1!2454 (h!4425 (t!8832 lt!133492)))))))

(declare-fun b!264255 () Bool)

(assert (=> b!264255 (= e!171206 (isStrictlySorted!364 (t!8832 lt!133492)))))

(assert (= (and d!63823 (not res!128976)) b!264254))

(assert (= (and b!264254 res!128977) b!264255))

(declare-fun m!281133 () Bool)

(assert (=> b!264255 m!281133))

(assert (=> d!63361 d!63823))

(declare-fun d!63825 () Bool)

(declare-fun res!128978 () Bool)

(declare-fun e!171207 () Bool)

(assert (=> d!63825 (=> res!128978 e!171207)))

(assert (=> d!63825 (= res!128978 (or ((_ is Nil!3760) (toList!1916 lt!133013)) ((_ is Nil!3760) (t!8832 (toList!1916 lt!133013)))))))

(assert (=> d!63825 (= (isStrictlySorted!364 (toList!1916 lt!133013)) e!171207)))

(declare-fun b!264256 () Bool)

(declare-fun e!171208 () Bool)

(assert (=> b!264256 (= e!171207 e!171208)))

(declare-fun res!128979 () Bool)

(assert (=> b!264256 (=> (not res!128979) (not e!171208))))

(assert (=> b!264256 (= res!128979 (bvslt (_1!2454 (h!4425 (toList!1916 lt!133013))) (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133013))))))))

(declare-fun b!264257 () Bool)

(assert (=> b!264257 (= e!171208 (isStrictlySorted!364 (t!8832 (toList!1916 lt!133013))))))

(assert (= (and d!63825 (not res!128978)) b!264256))

(assert (= (and b!264256 res!128979) b!264257))

(assert (=> b!264257 m!280519))

(assert (=> d!63361 d!63825))

(declare-fun b!264258 () Bool)

(declare-fun e!171210 () SeekEntryResult!1164)

(assert (=> b!264258 (= e!171210 (Found!1164 (index!6828 lt!133546)))))

(declare-fun b!264259 () Bool)

(declare-fun e!171211 () SeekEntryResult!1164)

(assert (=> b!264259 (= e!171211 e!171210)))

(declare-fun c!45193 () Bool)

(declare-fun lt!133773 () (_ BitVec 64))

(assert (=> b!264259 (= c!45193 (= lt!133773 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun b!264260 () Bool)

(assert (=> b!264260 (= e!171211 Undefined!1164)))

(declare-fun b!264261 () Bool)

(declare-fun e!171209 () SeekEntryResult!1164)

(assert (=> b!264261 (= e!171209 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25206 lt!133546) #b00000000000000000000000000000001) (nextIndex!0 (index!6828 lt!133546) (bvadd (x!25206 lt!133546) #b00000000000000000000000000000001) (mask!11208 thiss!1504)) (index!6828 lt!133546) (select (arr!5996 lt!133005) #b00000000000000000000000000000000) lt!133005 (mask!11208 thiss!1504)))))

(declare-fun d!63827 () Bool)

(declare-fun lt!133772 () SeekEntryResult!1164)

(assert (=> d!63827 (and (or ((_ is Undefined!1164) lt!133772) (not ((_ is Found!1164) lt!133772)) (and (bvsge (index!6827 lt!133772) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133772) (size!6347 lt!133005)))) (or ((_ is Undefined!1164) lt!133772) ((_ is Found!1164) lt!133772) (not ((_ is MissingVacant!1164) lt!133772)) (not (= (index!6829 lt!133772) (index!6828 lt!133546))) (and (bvsge (index!6829 lt!133772) #b00000000000000000000000000000000) (bvslt (index!6829 lt!133772) (size!6347 lt!133005)))) (or ((_ is Undefined!1164) lt!133772) (ite ((_ is Found!1164) lt!133772) (= (select (arr!5996 lt!133005) (index!6827 lt!133772)) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!1164) lt!133772) (= (index!6829 lt!133772) (index!6828 lt!133546)) (= (select (arr!5996 lt!133005) (index!6829 lt!133772)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!63827 (= lt!133772 e!171211)))

(declare-fun c!45192 () Bool)

(assert (=> d!63827 (= c!45192 (bvsge (x!25206 lt!133546) #b01111111111111111111111111111110))))

(assert (=> d!63827 (= lt!133773 (select (arr!5996 lt!133005) (index!6828 lt!133546)))))

(assert (=> d!63827 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63827 (= (seekKeyOrZeroReturnVacant!0 (x!25206 lt!133546) (index!6828 lt!133546) (index!6828 lt!133546) (select (arr!5996 lt!133005) #b00000000000000000000000000000000) lt!133005 (mask!11208 thiss!1504)) lt!133772)))

(declare-fun b!264262 () Bool)

(assert (=> b!264262 (= e!171209 (MissingVacant!1164 (index!6828 lt!133546)))))

(declare-fun b!264263 () Bool)

(declare-fun c!45191 () Bool)

(assert (=> b!264263 (= c!45191 (= lt!133773 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264263 (= e!171210 e!171209)))

(assert (= (and d!63827 c!45192) b!264260))

(assert (= (and d!63827 (not c!45192)) b!264259))

(assert (= (and b!264259 c!45193) b!264258))

(assert (= (and b!264259 (not c!45193)) b!264263))

(assert (= (and b!264263 c!45191) b!264262))

(assert (= (and b!264263 (not c!45191)) b!264261))

(declare-fun m!281135 () Bool)

(assert (=> b!264261 m!281135))

(assert (=> b!264261 m!281135))

(assert (=> b!264261 m!279433))

(declare-fun m!281137 () Bool)

(assert (=> b!264261 m!281137))

(declare-fun m!281139 () Bool)

(assert (=> d!63827 m!281139))

(declare-fun m!281141 () Bool)

(assert (=> d!63827 m!281141))

(assert (=> d!63827 m!280207))

(assert (=> d!63827 m!279317))

(assert (=> b!263679 d!63827))

(declare-fun d!63829 () Bool)

(declare-fun e!171212 () Bool)

(assert (=> d!63829 e!171212))

(declare-fun res!128980 () Bool)

(assert (=> d!63829 (=> (not res!128980) (not e!171212))))

(declare-fun lt!133775 () ListLongMap!3801)

(assert (=> d!63829 (= res!128980 (contains!1885 lt!133775 (_1!2454 (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun lt!133776 () List!3763)

(assert (=> d!63829 (= lt!133775 (ListLongMap!3802 lt!133776))))

(declare-fun lt!133777 () Unit!8164)

(declare-fun lt!133774 () Unit!8164)

(assert (=> d!63829 (= lt!133777 lt!133774)))

(assert (=> d!63829 (= (getValueByKey!321 lt!133776 (_1!2454 (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!326 (_2!2454 (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63829 (= lt!133774 (lemmaContainsTupThenGetReturnValue!177 lt!133776 (_1!2454 (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63829 (= lt!133776 (insertStrictlySorted!180 (toList!1916 (ite c!44965 call!25207 (ite c!44968 call!25205 call!25208))) (_1!2454 (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63829 (= (+!712 (ite c!44965 call!25207 (ite c!44968 call!25205 call!25208)) (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133775)))

(declare-fun b!264264 () Bool)

(declare-fun res!128981 () Bool)

(assert (=> b!264264 (=> (not res!128981) (not e!171212))))

(assert (=> b!264264 (= res!128981 (= (getValueByKey!321 (toList!1916 lt!133775) (_1!2454 (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!326 (_2!2454 (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264265 () Bool)

(assert (=> b!264265 (= e!171212 (contains!1888 (toList!1916 lt!133775) (ite (or c!44965 c!44968) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63829 res!128980) b!264264))

(assert (= (and b!264264 res!128981) b!264265))

(declare-fun m!281143 () Bool)

(assert (=> d!63829 m!281143))

(declare-fun m!281145 () Bool)

(assert (=> d!63829 m!281145))

(declare-fun m!281147 () Bool)

(assert (=> d!63829 m!281147))

(declare-fun m!281149 () Bool)

(assert (=> d!63829 m!281149))

(declare-fun m!281151 () Bool)

(assert (=> b!264264 m!281151))

(declare-fun m!281153 () Bool)

(assert (=> b!264265 m!281153))

(assert (=> bm!25205 d!63829))

(declare-fun d!63831 () Bool)

(declare-fun res!128982 () Bool)

(declare-fun e!171213 () Bool)

(assert (=> d!63831 (=> res!128982 e!171213)))

(assert (=> d!63831 (= res!128982 (and ((_ is Cons!3759) lt!133429) (= (_1!2454 (h!4425 lt!133429)) (_1!2454 lt!133017))))))

(assert (=> d!63831 (= (containsKey!312 lt!133429 (_1!2454 lt!133017)) e!171213)))

(declare-fun b!264266 () Bool)

(declare-fun e!171214 () Bool)

(assert (=> b!264266 (= e!171213 e!171214)))

(declare-fun res!128983 () Bool)

(assert (=> b!264266 (=> (not res!128983) (not e!171214))))

(assert (=> b!264266 (= res!128983 (and (or (not ((_ is Cons!3759) lt!133429)) (bvsle (_1!2454 (h!4425 lt!133429)) (_1!2454 lt!133017))) ((_ is Cons!3759) lt!133429) (bvslt (_1!2454 (h!4425 lt!133429)) (_1!2454 lt!133017))))))

(declare-fun b!264267 () Bool)

(assert (=> b!264267 (= e!171214 (containsKey!312 (t!8832 lt!133429) (_1!2454 lt!133017)))))

(assert (= (and d!63831 (not res!128982)) b!264266))

(assert (= (and b!264266 res!128983) b!264267))

(declare-fun m!281155 () Bool)

(assert (=> b!264267 m!281155))

(assert (=> b!263484 d!63831))

(assert (=> b!263540 d!63221))

(declare-fun d!63833 () Bool)

(assert (=> d!63833 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))) (v!5509 (getValueByKey!321 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (=> d!63457 d!63833))

(declare-fun b!264271 () Bool)

(declare-fun e!171216 () Option!327)

(assert (=> b!264271 (= e!171216 None!325)))

(declare-fun b!264269 () Bool)

(declare-fun e!171215 () Option!327)

(assert (=> b!264269 (= e!171215 e!171216)))

(declare-fun c!45195 () Bool)

(assert (=> b!264269 (= c!45195 (and ((_ is Cons!3759) (toList!1916 lt!133244)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133244))) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))))

(declare-fun b!264270 () Bool)

(assert (=> b!264270 (= e!171216 (getValueByKey!321 (t!8832 (toList!1916 lt!133244)) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!63835 () Bool)

(declare-fun c!45194 () Bool)

(assert (=> d!63835 (= c!45194 (and ((_ is Cons!3759) (toList!1916 lt!133244)) (= (_1!2454 (h!4425 (toList!1916 lt!133244))) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (=> d!63835 (= (getValueByKey!321 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) e!171215)))

(declare-fun b!264268 () Bool)

(assert (=> b!264268 (= e!171215 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133244)))))))

(assert (= (and d!63835 c!45194) b!264268))

(assert (= (and d!63835 (not c!45194)) b!264269))

(assert (= (and b!264269 c!45195) b!264270))

(assert (= (and b!264269 (not c!45195)) b!264271))

(assert (=> b!264270 m!279365))

(declare-fun m!281157 () Bool)

(assert (=> b!264270 m!281157))

(assert (=> d!63457 d!63835))

(declare-fun d!63837 () Bool)

(assert (=> d!63837 (= (apply!262 lt!133559 #b1000000000000000000000000000000000000000000000000000000000000000) (get!3100 (getValueByKey!321 (toList!1916 lt!133559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9327 () Bool)

(assert (= bs!9327 d!63837))

(declare-fun m!281159 () Bool)

(assert (=> bs!9327 m!281159))

(assert (=> bs!9327 m!281159))

(declare-fun m!281161 () Bool)

(assert (=> bs!9327 m!281161))

(assert (=> b!263728 d!63837))

(assert (=> b!263649 d!63681))

(assert (=> b!263649 d!63683))

(declare-fun d!63839 () Bool)

(assert (=> d!63839 (= (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133003) key!932)) (not ((_ is Some!326) (getValueByKey!321 (toList!1916 lt!133003) key!932))))))

(assert (=> d!63407 d!63839))

(declare-fun d!63841 () Bool)

(assert (=> d!63841 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133778 () Unit!8164)

(assert (=> d!63841 (= lt!133778 (choose!1303 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171217 () Bool)

(assert (=> d!63841 e!171217))

(declare-fun res!128984 () Bool)

(assert (=> d!63841 (=> (not res!128984) (not e!171217))))

(assert (=> d!63841 (= res!128984 (isStrictlySorted!364 (toList!1916 lt!133244)))))

(assert (=> d!63841 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000) lt!133778)))

(declare-fun b!264272 () Bool)

(assert (=> b!264272 (= e!171217 (containsKey!312 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63841 res!128984) b!264272))

(assert (=> d!63841 m!279983))

(assert (=> d!63841 m!279983))

(assert (=> d!63841 m!279985))

(declare-fun m!281163 () Bool)

(assert (=> d!63841 m!281163))

(assert (=> d!63841 m!280785))

(assert (=> b!264272 m!279979))

(assert (=> b!263584 d!63841))

(declare-fun d!63843 () Bool)

(assert (=> d!63843 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9328 () Bool)

(assert (= bs!9328 d!63843))

(assert (=> bs!9328 m!279983))

(declare-fun m!281165 () Bool)

(assert (=> bs!9328 m!281165))

(assert (=> b!263584 d!63843))

(assert (=> b!263584 d!63605))

(declare-fun d!63845 () Bool)

(assert (=> d!63845 (= (get!3101 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5504 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!263758 d!63845))

(declare-fun d!63847 () Bool)

(assert (=> d!63847 (= (get!3102 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!263510 d!63847))

(assert (=> b!263416 d!63669))

(assert (=> b!263416 d!63671))

(declare-fun d!63849 () Bool)

(assert (=> d!63849 (= (apply!262 lt!133445 #b0000000000000000000000000000000000000000000000000000000000000000) (get!3100 (getValueByKey!321 (toList!1916 lt!133445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!9329 () Bool)

(assert (= bs!9329 d!63849))

(declare-fun m!281167 () Bool)

(assert (=> bs!9329 m!281167))

(assert (=> bs!9329 m!281167))

(declare-fun m!281169 () Bool)

(assert (=> bs!9329 m!281169))

(assert (=> b!263517 d!63849))

(declare-fun d!63851 () Bool)

(declare-fun e!171218 () Bool)

(assert (=> d!63851 e!171218))

(declare-fun res!128985 () Bool)

(assert (=> d!63851 (=> res!128985 e!171218)))

(declare-fun lt!133780 () Bool)

(assert (=> d!63851 (= res!128985 (not lt!133780))))

(declare-fun lt!133782 () Bool)

(assert (=> d!63851 (= lt!133780 lt!133782)))

(declare-fun lt!133781 () Unit!8164)

(declare-fun e!171219 () Unit!8164)

(assert (=> d!63851 (= lt!133781 e!171219)))

(declare-fun c!45196 () Bool)

(assert (=> d!63851 (= c!45196 lt!133782)))

(assert (=> d!63851 (= lt!133782 (containsKey!312 (toList!1916 lt!133538) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!63851 (= (contains!1885 lt!133538 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133780)))

(declare-fun b!264273 () Bool)

(declare-fun lt!133779 () Unit!8164)

(assert (=> b!264273 (= e!171219 lt!133779)))

(assert (=> b!264273 (= lt!133779 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133538) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> b!264273 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133538) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264274 () Bool)

(declare-fun Unit!8212 () Unit!8164)

(assert (=> b!264274 (= e!171219 Unit!8212)))

(declare-fun b!264275 () Bool)

(assert (=> b!264275 (= e!171218 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133538) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (= (and d!63851 c!45196) b!264273))

(assert (= (and d!63851 (not c!45196)) b!264274))

(assert (= (and d!63851 (not res!128985)) b!264275))

(declare-fun m!281171 () Bool)

(assert (=> d!63851 m!281171))

(declare-fun m!281173 () Bool)

(assert (=> b!264273 m!281173))

(assert (=> b!264273 m!280171))

(assert (=> b!264273 m!280171))

(declare-fun m!281175 () Bool)

(assert (=> b!264273 m!281175))

(assert (=> b!264275 m!280171))

(assert (=> b!264275 m!280171))

(assert (=> b!264275 m!281175))

(assert (=> d!63411 d!63851))

(declare-fun b!264279 () Bool)

(declare-fun e!171221 () Option!327)

(assert (=> b!264279 (= e!171221 None!325)))

(declare-fun b!264277 () Bool)

(declare-fun e!171220 () Option!327)

(assert (=> b!264277 (= e!171220 e!171221)))

(declare-fun c!45198 () Bool)

(assert (=> b!264277 (= c!45198 (and ((_ is Cons!3759) lt!133539) (not (= (_1!2454 (h!4425 lt!133539)) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun b!264278 () Bool)

(assert (=> b!264278 (= e!171221 (getValueByKey!321 (t!8832 lt!133539) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun d!63853 () Bool)

(declare-fun c!45197 () Bool)

(assert (=> d!63853 (= c!45197 (and ((_ is Cons!3759) lt!133539) (= (_1!2454 (h!4425 lt!133539)) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!63853 (= (getValueByKey!321 lt!133539 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) e!171220)))

(declare-fun b!264276 () Bool)

(assert (=> b!264276 (= e!171220 (Some!326 (_2!2454 (h!4425 lt!133539))))))

(assert (= (and d!63853 c!45197) b!264276))

(assert (= (and d!63853 (not c!45197)) b!264277))

(assert (= (and b!264277 c!45198) b!264278))

(assert (= (and b!264277 (not c!45198)) b!264279))

(declare-fun m!281177 () Bool)

(assert (=> b!264278 m!281177))

(assert (=> d!63411 d!63853))

(declare-fun d!63855 () Bool)

(assert (=> d!63855 (= (getValueByKey!321 lt!133539 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!326 (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun lt!133783 () Unit!8164)

(assert (=> d!63855 (= lt!133783 (choose!1302 lt!133539 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun e!171222 () Bool)

(assert (=> d!63855 e!171222))

(declare-fun res!128986 () Bool)

(assert (=> d!63855 (=> (not res!128986) (not e!171222))))

(assert (=> d!63855 (= res!128986 (isStrictlySorted!364 lt!133539))))

(assert (=> d!63855 (= (lemmaContainsTupThenGetReturnValue!177 lt!133539 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133783)))

(declare-fun b!264280 () Bool)

(declare-fun res!128987 () Bool)

(assert (=> b!264280 (=> (not res!128987) (not e!171222))))

(assert (=> b!264280 (= res!128987 (containsKey!312 lt!133539 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264281 () Bool)

(assert (=> b!264281 (= e!171222 (contains!1888 lt!133539 (tuple2!4887 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (= (and d!63855 res!128986) b!264280))

(assert (= (and b!264280 res!128987) b!264281))

(assert (=> d!63855 m!280165))

(declare-fun m!281179 () Bool)

(assert (=> d!63855 m!281179))

(declare-fun m!281181 () Bool)

(assert (=> d!63855 m!281181))

(declare-fun m!281183 () Bool)

(assert (=> b!264280 m!281183))

(declare-fun m!281185 () Bool)

(assert (=> b!264281 m!281185))

(assert (=> d!63411 d!63855))

(declare-fun b!264282 () Bool)

(declare-fun e!171225 () List!3763)

(declare-fun call!25273 () List!3763)

(assert (=> b!264282 (= e!171225 call!25273)))

(declare-fun b!264283 () Bool)

(declare-fun e!171227 () List!3763)

(declare-fun call!25271 () List!3763)

(assert (=> b!264283 (= e!171227 call!25271)))

(declare-fun b!264284 () Bool)

(assert (=> b!264284 (= e!171225 call!25273)))

(declare-fun c!45200 () Bool)

(declare-fun call!25272 () List!3763)

(declare-fun bm!25268 () Bool)

(declare-fun e!171223 () List!3763)

(assert (=> bm!25268 (= call!25272 ($colon$colon!107 e!171223 (ite c!45200 (h!4425 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182)))) (tuple2!4887 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun c!45202 () Bool)

(assert (=> bm!25268 (= c!45202 c!45200)))

(declare-fun b!264285 () Bool)

(declare-fun c!45199 () Bool)

(declare-fun c!45201 () Bool)

(assert (=> b!264285 (= e!171223 (ite c!45201 (t!8832 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182)))) (ite c!45199 (Cons!3759 (h!4425 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182)))) (t!8832 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182))))) Nil!3760)))))

(declare-fun b!264286 () Bool)

(assert (=> b!264286 (= e!171223 (insertStrictlySorted!180 (t!8832 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182)))) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun bm!25269 () Bool)

(assert (=> bm!25269 (= call!25273 call!25271)))

(declare-fun d!63857 () Bool)

(declare-fun e!171226 () Bool)

(assert (=> d!63857 e!171226))

(declare-fun res!128988 () Bool)

(assert (=> d!63857 (=> (not res!128988) (not e!171226))))

(declare-fun lt!133784 () List!3763)

(assert (=> d!63857 (= res!128988 (isStrictlySorted!364 lt!133784))))

(declare-fun e!171224 () List!3763)

(assert (=> d!63857 (= lt!133784 e!171224)))

(assert (=> d!63857 (= c!45200 (and ((_ is Cons!3759) (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182)))) (bvslt (_1!2454 (h!4425 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182))))) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!63857 (isStrictlySorted!364 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182))))))

(assert (=> d!63857 (= (insertStrictlySorted!180 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182))) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133784)))

(declare-fun b!264287 () Bool)

(assert (=> b!264287 (= e!171224 call!25272)))

(declare-fun bm!25270 () Bool)

(assert (=> bm!25270 (= call!25271 call!25272)))

(declare-fun b!264288 () Bool)

(assert (=> b!264288 (= e!171224 e!171227)))

(assert (=> b!264288 (= c!45201 (and ((_ is Cons!3759) (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182)))) (= (_1!2454 (h!4425 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182))))) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264289 () Bool)

(assert (=> b!264289 (= e!171226 (contains!1888 lt!133784 (tuple2!4887 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264290 () Bool)

(assert (=> b!264290 (= c!45199 (and ((_ is Cons!3759) (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182)))) (bvsgt (_1!2454 (h!4425 (toList!1916 (ite c!44900 call!25181 (ite c!44903 call!25179 call!25182))))) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> b!264290 (= e!171227 e!171225)))

(declare-fun b!264291 () Bool)

(declare-fun res!128989 () Bool)

(assert (=> b!264291 (=> (not res!128989) (not e!171226))))

(assert (=> b!264291 (= res!128989 (containsKey!312 lt!133784 (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63857 c!45200) b!264287))

(assert (= (and d!63857 (not c!45200)) b!264288))

(assert (= (and b!264288 c!45201) b!264283))

(assert (= (and b!264288 (not c!45201)) b!264290))

(assert (= (and b!264290 c!45199) b!264282))

(assert (= (and b!264290 (not c!45199)) b!264284))

(assert (= (or b!264282 b!264284) bm!25269))

(assert (= (or b!264283 bm!25269) bm!25270))

(assert (= (or b!264287 bm!25270) bm!25268))

(assert (= (and bm!25268 c!45202) b!264286))

(assert (= (and bm!25268 (not c!45202)) b!264285))

(assert (= (and d!63857 res!128988) b!264291))

(assert (= (and b!264291 res!128989) b!264289))

(declare-fun m!281187 () Bool)

(assert (=> b!264291 m!281187))

(declare-fun m!281189 () Bool)

(assert (=> b!264289 m!281189))

(declare-fun m!281191 () Bool)

(assert (=> b!264286 m!281191))

(declare-fun m!281193 () Bool)

(assert (=> bm!25268 m!281193))

(declare-fun m!281195 () Bool)

(assert (=> d!63857 m!281195))

(declare-fun m!281197 () Bool)

(assert (=> d!63857 m!281197))

(assert (=> d!63411 d!63857))

(declare-fun d!63859 () Bool)

(assert (=> d!63859 (= (apply!262 (+!712 lt!133249 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) lt!133258) (apply!262 lt!133249 lt!133258))))

(assert (=> d!63859 true))

(declare-fun _$34!1135 () Unit!8164)

(assert (=> d!63859 (= (choose!1300 lt!133249 lt!133243 (minValue!4683 thiss!1504) lt!133258) _$34!1135)))

(declare-fun bs!9330 () Bool)

(assert (= bs!9330 d!63859))

(assert (=> bs!9330 m!279407))

(assert (=> bs!9330 m!279407))

(assert (=> bs!9330 m!279419))

(assert (=> bs!9330 m!279415))

(assert (=> d!63379 d!63859))

(assert (=> d!63379 d!63391))

(declare-fun d!63861 () Bool)

(declare-fun e!171228 () Bool)

(assert (=> d!63861 e!171228))

(declare-fun res!128990 () Bool)

(assert (=> d!63861 (=> res!128990 e!171228)))

(declare-fun lt!133786 () Bool)

(assert (=> d!63861 (= res!128990 (not lt!133786))))

(declare-fun lt!133788 () Bool)

(assert (=> d!63861 (= lt!133786 lt!133788)))

(declare-fun lt!133787 () Unit!8164)

(declare-fun e!171229 () Unit!8164)

(assert (=> d!63861 (= lt!133787 e!171229)))

(declare-fun c!45203 () Bool)

(assert (=> d!63861 (= c!45203 lt!133788)))

(assert (=> d!63861 (= lt!133788 (containsKey!312 (toList!1916 lt!133249) lt!133258))))

(assert (=> d!63861 (= (contains!1885 lt!133249 lt!133258) lt!133786)))

(declare-fun b!264292 () Bool)

(declare-fun lt!133785 () Unit!8164)

(assert (=> b!264292 (= e!171229 lt!133785)))

(assert (=> b!264292 (= lt!133785 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133249) lt!133258))))

(assert (=> b!264292 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133249) lt!133258))))

(declare-fun b!264293 () Bool)

(declare-fun Unit!8213 () Unit!8164)

(assert (=> b!264293 (= e!171229 Unit!8213)))

(declare-fun b!264294 () Bool)

(assert (=> b!264294 (= e!171228 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133249) lt!133258)))))

(assert (= (and d!63861 c!45203) b!264292))

(assert (= (and d!63861 (not c!45203)) b!264293))

(assert (= (and d!63861 (not res!128990)) b!264294))

(declare-fun m!281199 () Bool)

(assert (=> d!63861 m!281199))

(declare-fun m!281201 () Bool)

(assert (=> b!264292 m!281201))

(assert (=> b!264292 m!280113))

(assert (=> b!264292 m!280113))

(declare-fun m!281203 () Bool)

(assert (=> b!264292 m!281203))

(assert (=> b!264294 m!280113))

(assert (=> b!264294 m!280113))

(assert (=> b!264294 m!281203))

(assert (=> d!63379 d!63861))

(assert (=> d!63379 d!63383))

(assert (=> d!63379 d!63401))

(declare-fun d!63863 () Bool)

(declare-fun e!171230 () Bool)

(assert (=> d!63863 e!171230))

(declare-fun res!128991 () Bool)

(assert (=> d!63863 (=> (not res!128991) (not e!171230))))

(declare-fun lt!133790 () ListLongMap!3801)

(assert (=> d!63863 (= res!128991 (contains!1885 lt!133790 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133791 () List!3763)

(assert (=> d!63863 (= lt!133790 (ListLongMap!3802 lt!133791))))

(declare-fun lt!133792 () Unit!8164)

(declare-fun lt!133789 () Unit!8164)

(assert (=> d!63863 (= lt!133792 lt!133789)))

(assert (=> d!63863 (= (getValueByKey!321 lt!133791 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63863 (= lt!133789 (lemmaContainsTupThenGetReturnValue!177 lt!133791 (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63863 (= lt!133791 (insertStrictlySorted!180 (toList!1916 call!25211) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (=> d!63863 (= (+!712 call!25211 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))) lt!133790)))

(declare-fun b!264295 () Bool)

(declare-fun res!128992 () Bool)

(assert (=> b!264295 (=> (not res!128992) (not e!171230))))

(assert (=> b!264295 (= res!128992 (= (getValueByKey!321 (toList!1916 lt!133790) (_1!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264296 () Bool)

(assert (=> b!264296 (= e!171230 (contains!1888 (toList!1916 lt!133790) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))

(assert (= (and d!63863 res!128991) b!264295))

(assert (= (and b!264295 res!128992) b!264296))

(declare-fun m!281205 () Bool)

(assert (=> d!63863 m!281205))

(declare-fun m!281207 () Bool)

(assert (=> d!63863 m!281207))

(declare-fun m!281209 () Bool)

(assert (=> d!63863 m!281209))

(declare-fun m!281211 () Bool)

(assert (=> d!63863 m!281211))

(declare-fun m!281213 () Bool)

(assert (=> b!264295 m!281213))

(declare-fun m!281215 () Bool)

(assert (=> b!264296 m!281215))

(assert (=> b!263524 d!63863))

(declare-fun d!63865 () Bool)

(assert (=> d!63865 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun lt!133793 () Unit!8164)

(assert (=> d!63865 (= lt!133793 (choose!1303 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun e!171231 () Bool)

(assert (=> d!63865 e!171231))

(declare-fun res!128993 () Bool)

(assert (=> d!63865 (=> (not res!128993) (not e!171231))))

(assert (=> d!63865 (= res!128993 (isStrictlySorted!364 (toList!1916 lt!133300)))))

(assert (=> d!63865 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) lt!133793)))

(declare-fun b!264297 () Bool)

(assert (=> b!264297 (= e!171231 (containsKey!312 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (= (and d!63865 res!128993) b!264297))

(assert (=> d!63865 m!279433))

(assert (=> d!63865 m!279835))

(assert (=> d!63865 m!279835))

(assert (=> d!63865 m!280035))

(assert (=> d!63865 m!279433))

(declare-fun m!281217 () Bool)

(assert (=> d!63865 m!281217))

(assert (=> d!63865 m!280683))

(assert (=> b!264297 m!279433))

(assert (=> b!264297 m!280031))

(assert (=> b!263625 d!63865))

(declare-fun d!63867 () Bool)

(assert (=> d!63867 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))))

(declare-fun bs!9331 () Bool)

(assert (= bs!9331 d!63867))

(assert (=> bs!9331 m!279835))

(declare-fun m!281219 () Bool)

(assert (=> bs!9331 m!281219))

(assert (=> b!263625 d!63867))

(declare-fun b!264301 () Bool)

(declare-fun e!171233 () Option!327)

(assert (=> b!264301 (= e!171233 None!325)))

(declare-fun b!264299 () Bool)

(declare-fun e!171232 () Option!327)

(assert (=> b!264299 (= e!171232 e!171233)))

(declare-fun c!45205 () Bool)

(assert (=> b!264299 (= c!45205 (and ((_ is Cons!3759) (toList!1916 lt!133300)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133300))) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))))

(declare-fun b!264300 () Bool)

(assert (=> b!264300 (= e!171233 (getValueByKey!321 (t!8832 (toList!1916 lt!133300)) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun d!63869 () Bool)

(declare-fun c!45204 () Bool)

(assert (=> d!63869 (= c!45204 (and ((_ is Cons!3759) (toList!1916 lt!133300)) (= (_1!2454 (h!4425 (toList!1916 lt!133300))) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))))

(assert (=> d!63869 (= (getValueByKey!321 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) e!171232)))

(declare-fun b!264298 () Bool)

(assert (=> b!264298 (= e!171232 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133300)))))))

(assert (= (and d!63869 c!45204) b!264298))

(assert (= (and d!63869 (not c!45204)) b!264299))

(assert (= (and b!264299 c!45205) b!264300))

(assert (= (and b!264299 (not c!45205)) b!264301))

(assert (=> b!264300 m!279433))

(declare-fun m!281221 () Bool)

(assert (=> b!264300 m!281221))

(assert (=> b!263625 d!63869))

(assert (=> b!263655 d!63633))

(declare-fun d!63871 () Bool)

(assert (=> d!63871 (= (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263755 d!63871))

(declare-fun b!264305 () Bool)

(declare-fun e!171235 () Option!327)

(assert (=> b!264305 (= e!171235 None!325)))

(declare-fun b!264303 () Bool)

(declare-fun e!171234 () Option!327)

(assert (=> b!264303 (= e!171234 e!171235)))

(declare-fun c!45207 () Bool)

(assert (=> b!264303 (= c!45207 (and ((_ is Cons!3759) (toList!1916 lt!133538)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133538))) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun b!264304 () Bool)

(assert (=> b!264304 (= e!171235 (getValueByKey!321 (t!8832 (toList!1916 lt!133538)) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun d!63873 () Bool)

(declare-fun c!45206 () Bool)

(assert (=> d!63873 (= c!45206 (and ((_ is Cons!3759) (toList!1916 lt!133538)) (= (_1!2454 (h!4425 (toList!1916 lt!133538))) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!63873 (= (getValueByKey!321 (toList!1916 lt!133538) (_1!2454 (ite (or c!44900 c!44903) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) e!171234)))

(declare-fun b!264302 () Bool)

(assert (=> b!264302 (= e!171234 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133538)))))))

(assert (= (and d!63873 c!45206) b!264302))

(assert (= (and d!63873 (not c!45206)) b!264303))

(assert (= (and b!264303 c!45207) b!264304))

(assert (= (and b!264303 (not c!45207)) b!264305))

(declare-fun m!281223 () Bool)

(assert (=> b!264304 m!281223))

(assert (=> b!263663 d!63873))

(declare-fun d!63875 () Bool)

(assert (=> d!63875 (= (apply!262 lt!133559 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)) (get!3100 (getValueByKey!321 (toList!1916 lt!133559) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000))))))

(declare-fun bs!9332 () Bool)

(assert (= bs!9332 d!63875))

(assert (=> bs!9332 m!279599))

(declare-fun m!281225 () Bool)

(assert (=> bs!9332 m!281225))

(assert (=> bs!9332 m!281225))

(declare-fun m!281227 () Bool)

(assert (=> bs!9332 m!281227))

(assert (=> b!263722 d!63875))

(declare-fun d!63877 () Bool)

(declare-fun c!45208 () Bool)

(assert (=> d!63877 (= c!45208 ((_ is ValueCellFull!2984) (select (arr!5995 (_values!4825 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun e!171236 () V!8521)

(assert (=> d!63877 (= (get!3099 (select (arr!5995 (_values!4825 lt!133011)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 lt!133011) #b0000000000000000000000000000000000000000000000000000000000000000)) e!171236)))

(declare-fun b!264306 () Bool)

(assert (=> b!264306 (= e!171236 (get!3101 (select (arr!5995 (_values!4825 lt!133011)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 lt!133011) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264307 () Bool)

(assert (=> b!264307 (= e!171236 (get!3102 (select (arr!5995 (_values!4825 lt!133011)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 lt!133011) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63877 c!45208) b!264306))

(assert (= (and d!63877 (not c!45208)) b!264307))

(assert (=> b!264306 m!280231))

(assert (=> b!264306 m!280229))

(declare-fun m!281229 () Bool)

(assert (=> b!264306 m!281229))

(assert (=> b!264307 m!280231))

(assert (=> b!264307 m!280229))

(declare-fun m!281231 () Bool)

(assert (=> b!264307 m!281231))

(assert (=> b!263722 d!63877))

(declare-fun d!63879 () Bool)

(assert (=> d!63879 (= (isEmpty!546 lt!133380) (isEmpty!548 (toList!1916 lt!133380)))))

(declare-fun bs!9333 () Bool)

(assert (= bs!9333 d!63879))

(declare-fun m!281233 () Bool)

(assert (=> bs!9333 m!281233))

(assert (=> b!263400 d!63879))

(declare-fun d!63881 () Bool)

(assert (=> d!63881 (isDefined!261 (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(declare-fun lt!133794 () Unit!8164)

(assert (=> d!63881 (= lt!133794 (choose!1303 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(declare-fun e!171237 () Bool)

(assert (=> d!63881 e!171237))

(declare-fun res!128994 () Bool)

(assert (=> d!63881 (=> (not res!128994) (not e!171237))))

(assert (=> d!63881 (= res!128994 (isStrictlySorted!364 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))))

(assert (=> d!63881 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932) lt!133794)))

(declare-fun b!264308 () Bool)

(assert (=> b!264308 (= e!171237 (containsKey!312 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))

(assert (= (and d!63881 res!128994) b!264308))

(assert (=> d!63881 m!279633))

(assert (=> d!63881 m!279633))

(assert (=> d!63881 m!279635))

(declare-fun m!281235 () Bool)

(assert (=> d!63881 m!281235))

(declare-fun m!281237 () Bool)

(assert (=> d!63881 m!281237))

(assert (=> b!264308 m!279629))

(assert (=> b!263339 d!63881))

(declare-fun d!63883 () Bool)

(assert (=> d!63883 (= (isDefined!261 (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932)) (not (isEmpty!547 (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932))))))

(declare-fun bs!9334 () Bool)

(assert (= bs!9334 d!63883))

(assert (=> bs!9334 m!279633))

(declare-fun m!281239 () Bool)

(assert (=> bs!9334 m!281239))

(assert (=> b!263339 d!63883))

(declare-fun b!264312 () Bool)

(declare-fun e!171239 () Option!327)

(assert (=> b!264312 (= e!171239 None!325)))

(declare-fun b!264310 () Bool)

(declare-fun e!171238 () Option!327)

(assert (=> b!264310 (= e!171238 e!171239)))

(declare-fun c!45210 () Bool)

(assert (=> b!264310 (= c!45210 (and ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (not (= (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) key!932))))))

(declare-fun b!264311 () Bool)

(assert (=> b!264311 (= e!171239 (getValueByKey!321 (t!8832 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) key!932))))

(declare-fun d!63885 () Bool)

(declare-fun c!45209 () Bool)

(assert (=> d!63885 (= c!45209 (and ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (= (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) key!932)))))

(assert (=> d!63885 (= (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) key!932) e!171238)))

(declare-fun b!264309 () Bool)

(assert (=> b!264309 (= e!171238 (Some!326 (_2!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))))))

(assert (= (and d!63885 c!45209) b!264309))

(assert (= (and d!63885 (not c!45209)) b!264310))

(assert (= (and b!264310 c!45210) b!264311))

(assert (= (and b!264310 (not c!45210)) b!264312))

(declare-fun m!281241 () Bool)

(assert (=> b!264311 m!281241))

(assert (=> b!263339 d!63885))

(declare-fun d!63887 () Bool)

(assert (=> d!63887 (= ($colon$colon!107 e!170730 (ite c!44956 (h!4425 (toList!1916 (map!2747 thiss!1504))) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017)))) (Cons!3759 (ite c!44956 (h!4425 (toList!1916 (map!2747 thiss!1504))) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))) e!170730))))

(assert (=> bm!25197 d!63887))

(declare-fun b!264313 () Bool)

(declare-fun e!171240 () Bool)

(declare-fun call!25274 () Bool)

(assert (=> b!264313 (= e!171240 call!25274)))

(declare-fun bm!25271 () Bool)

(assert (=> bm!25271 (= call!25274 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504)))))

(declare-fun b!264314 () Bool)

(declare-fun e!171241 () Bool)

(assert (=> b!264314 (= e!171241 call!25274)))

(declare-fun b!264315 () Bool)

(declare-fun e!171242 () Bool)

(assert (=> b!264315 (= e!171242 e!171241)))

(declare-fun c!45211 () Bool)

(assert (=> b!264315 (= c!45211 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63889 () Bool)

(declare-fun res!128996 () Bool)

(assert (=> d!63889 (=> res!128996 e!171242)))

(assert (=> d!63889 (= res!128996 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(assert (=> d!63889 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504)) e!171242)))

(declare-fun b!264316 () Bool)

(assert (=> b!264316 (= e!171241 e!171240)))

(declare-fun lt!133796 () (_ BitVec 64))

(assert (=> b!264316 (= lt!133796 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133797 () Unit!8164)

(assert (=> b!264316 (= lt!133797 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) lt!133796 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!264316 (arrayContainsKey!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) lt!133796 #b00000000000000000000000000000000)))

(declare-fun lt!133795 () Unit!8164)

(assert (=> b!264316 (= lt!133795 lt!133797)))

(declare-fun res!128995 () Bool)

(assert (=> b!264316 (= res!128995 (= (seekEntryOrOpen!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504)) (Found!1164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264316 (=> (not res!128995) (not e!171240))))

(assert (= (and d!63889 (not res!128996)) b!264315))

(assert (= (and b!264315 c!45211) b!264316))

(assert (= (and b!264315 (not c!45211)) b!264314))

(assert (= (and b!264316 res!128995) b!264313))

(assert (= (or b!264313 b!264314) bm!25271))

(declare-fun m!281243 () Bool)

(assert (=> bm!25271 m!281243))

(declare-fun m!281245 () Bool)

(assert (=> b!264315 m!281245))

(assert (=> b!264315 m!281245))

(declare-fun m!281247 () Bool)

(assert (=> b!264315 m!281247))

(assert (=> b!264316 m!281245))

(declare-fun m!281249 () Bool)

(assert (=> b!264316 m!281249))

(declare-fun m!281251 () Bool)

(assert (=> b!264316 m!281251))

(assert (=> b!264316 m!281245))

(declare-fun m!281253 () Bool)

(assert (=> b!264316 m!281253))

(assert (=> bm!25200 d!63889))

(assert (=> d!63429 d!63431))

(declare-fun d!63891 () Bool)

(assert (=> d!63891 (arrayContainsKey!0 lt!133005 lt!133278 #b00000000000000000000000000000000)))

(assert (=> d!63891 true))

(declare-fun _$60!391 () Unit!8164)

(assert (=> d!63891 (= (choose!13 lt!133005 lt!133278 #b00000000000000000000000000000000) _$60!391)))

(declare-fun bs!9335 () Bool)

(assert (= bs!9335 d!63891))

(assert (=> bs!9335 m!279469))

(assert (=> d!63429 d!63891))

(assert (=> b!263727 d!63469))

(assert (=> b!263333 d!63813))

(declare-fun d!63893 () Bool)

(declare-fun res!128997 () Bool)

(declare-fun e!171243 () Bool)

(assert (=> d!63893 (=> res!128997 e!171243)))

(assert (=> d!63893 (= res!128997 (and ((_ is Cons!3759) (t!8832 (toList!1916 lt!133019))) (= (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133019)))) key!932)))))

(assert (=> d!63893 (= (containsKey!312 (t!8832 (toList!1916 lt!133019)) key!932) e!171243)))

(declare-fun b!264317 () Bool)

(declare-fun e!171244 () Bool)

(assert (=> b!264317 (= e!171243 e!171244)))

(declare-fun res!128998 () Bool)

(assert (=> b!264317 (=> (not res!128998) (not e!171244))))

(assert (=> b!264317 (= res!128998 (and (or (not ((_ is Cons!3759) (t!8832 (toList!1916 lt!133019)))) (bvsle (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133019)))) key!932)) ((_ is Cons!3759) (t!8832 (toList!1916 lt!133019))) (bvslt (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133019)))) key!932)))))

(declare-fun b!264318 () Bool)

(assert (=> b!264318 (= e!171244 (containsKey!312 (t!8832 (t!8832 (toList!1916 lt!133019))) key!932))))

(assert (= (and d!63893 (not res!128997)) b!264317))

(assert (= (and b!264317 res!128998) b!264318))

(declare-fun m!281255 () Bool)

(assert (=> b!264318 m!281255))

(assert (=> b!263326 d!63893))

(declare-fun d!63895 () Bool)

(assert (=> d!63895 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun lt!133798 () Unit!8164)

(assert (=> d!63895 (= lt!133798 (choose!1303 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!171245 () Bool)

(assert (=> d!63895 e!171245))

(declare-fun res!128999 () Bool)

(assert (=> d!63895 (=> (not res!128999) (not e!171245))))

(assert (=> d!63895 (= res!128999 (isStrictlySorted!364 (toList!1916 lt!133244)))))

(assert (=> d!63895 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) lt!133798)))

(declare-fun b!264319 () Bool)

(assert (=> b!264319 (= e!171245 (containsKey!312 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63895 res!128999) b!264319))

(assert (=> d!63895 m!279365))

(assert (=> d!63895 m!279649))

(assert (=> d!63895 m!279649))

(assert (=> d!63895 m!279651))

(assert (=> d!63895 m!279365))

(declare-fun m!281257 () Bool)

(assert (=> d!63895 m!281257))

(assert (=> d!63895 m!280785))

(assert (=> b!264319 m!279365))

(assert (=> b!264319 m!279645))

(assert (=> b!263369 d!63895))

(declare-fun d!63897 () Bool)

(assert (=> d!63897 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))))

(declare-fun bs!9336 () Bool)

(assert (= bs!9336 d!63897))

(assert (=> bs!9336 m!279649))

(declare-fun m!281259 () Bool)

(assert (=> bs!9336 m!281259))

(assert (=> b!263369 d!63897))

(assert (=> b!263369 d!63835))

(declare-fun d!63899 () Bool)

(declare-fun e!171246 () Bool)

(assert (=> d!63899 e!171246))

(declare-fun res!129000 () Bool)

(assert (=> d!63899 (=> res!129000 e!171246)))

(declare-fun lt!133800 () Bool)

(assert (=> d!63899 (= res!129000 (not lt!133800))))

(declare-fun lt!133802 () Bool)

(assert (=> d!63899 (= lt!133800 lt!133802)))

(declare-fun lt!133801 () Unit!8164)

(declare-fun e!171247 () Unit!8164)

(assert (=> d!63899 (= lt!133801 e!171247)))

(declare-fun c!45212 () Bool)

(assert (=> d!63899 (= c!45212 lt!133802)))

(assert (=> d!63899 (= lt!133802 (containsKey!312 (toList!1916 lt!133380) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (=> d!63899 (= (contains!1885 lt!133380 (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) lt!133800)))

(declare-fun b!264320 () Bool)

(declare-fun lt!133799 () Unit!8164)

(assert (=> b!264320 (= e!171247 lt!133799)))

(assert (=> b!264320 (= lt!133799 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133380) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (=> b!264320 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133380) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(declare-fun b!264321 () Bool)

(declare-fun Unit!8214 () Unit!8164)

(assert (=> b!264321 (= e!171247 Unit!8214)))

(declare-fun b!264322 () Bool)

(assert (=> b!264322 (= e!171246 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133380) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))))

(assert (= (and d!63899 c!45212) b!264320))

(assert (= (and d!63899 (not c!45212)) b!264321))

(assert (= (and d!63899 (not res!129000)) b!264322))

(assert (=> d!63899 m!279433))

(declare-fun m!281261 () Bool)

(assert (=> d!63899 m!281261))

(assert (=> b!264320 m!279433))

(declare-fun m!281263 () Bool)

(assert (=> b!264320 m!281263))

(assert (=> b!264320 m!279433))

(assert (=> b!264320 m!280657))

(assert (=> b!264320 m!280657))

(declare-fun m!281265 () Bool)

(assert (=> b!264320 m!281265))

(assert (=> b!264322 m!279433))

(assert (=> b!264322 m!280657))

(assert (=> b!264322 m!280657))

(assert (=> b!264322 m!281265))

(assert (=> b!263407 d!63899))

(assert (=> bm!25215 d!63635))

(declare-fun d!63901 () Bool)

(assert (=> d!63901 (= (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) lt!133250)) (v!5509 (getValueByKey!321 (toList!1916 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) lt!133250)))))

(assert (=> d!63385 d!63901))

(declare-fun b!264326 () Bool)

(declare-fun e!171249 () Option!327)

(assert (=> b!264326 (= e!171249 None!325)))

(declare-fun b!264324 () Bool)

(declare-fun e!171248 () Option!327)

(assert (=> b!264324 (= e!171248 e!171249)))

(declare-fun c!45214 () Bool)

(assert (=> b!264324 (= c!45214 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))) (not (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))) lt!133250))))))

(declare-fun b!264325 () Bool)

(assert (=> b!264325 (= e!171249 (getValueByKey!321 (t!8832 (toList!1916 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))) lt!133250))))

(declare-fun c!45213 () Bool)

(declare-fun d!63903 () Bool)

(assert (=> d!63903 (= c!45213 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))) (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))))) lt!133250)))))

(assert (=> d!63903 (= (getValueByKey!321 (toList!1916 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504)))) lt!133250) e!171248)))

(declare-fun b!264323 () Bool)

(assert (=> b!264323 (= e!171248 (Some!326 (_2!2454 (h!4425 (toList!1916 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))))))))))

(assert (= (and d!63903 c!45213) b!264323))

(assert (= (and d!63903 (not c!45213)) b!264324))

(assert (= (and b!264324 c!45214) b!264325))

(assert (= (and b!264324 (not c!45214)) b!264326))

(declare-fun m!281267 () Bool)

(assert (=> b!264325 m!281267))

(assert (=> d!63385 d!63903))

(declare-fun d!63905 () Bool)

(assert (=> d!63905 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!133803 () Unit!8164)

(assert (=> d!63905 (= lt!133803 (choose!1303 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171250 () Bool)

(assert (=> d!63905 e!171250))

(declare-fun res!129001 () Bool)

(assert (=> d!63905 (=> (not res!129001) (not e!171250))))

(assert (=> d!63905 (= res!129001 (isStrictlySorted!364 (toList!1916 lt!133300)))))

(assert (=> d!63905 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000) lt!133803)))

(declare-fun b!264327 () Bool)

(assert (=> b!264327 (= e!171250 (containsKey!312 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63905 res!129001) b!264327))

(assert (=> d!63905 m!279625))

(assert (=> d!63905 m!279625))

(assert (=> d!63905 m!279627))

(declare-fun m!281269 () Bool)

(assert (=> d!63905 m!281269))

(assert (=> d!63905 m!280683))

(assert (=> b!264327 m!279621))

(assert (=> b!263336 d!63905))

(declare-fun d!63907 () Bool)

(assert (=> d!63907 (= (isDefined!261 (getValueByKey!321 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!9337 () Bool)

(assert (= bs!9337 d!63907))

(assert (=> bs!9337 m!279625))

(declare-fun m!281271 () Bool)

(assert (=> bs!9337 m!281271))

(assert (=> b!263336 d!63907))

(declare-fun b!264331 () Bool)

(declare-fun e!171252 () Option!327)

(assert (=> b!264331 (= e!171252 None!325)))

(declare-fun b!264329 () Bool)

(declare-fun e!171251 () Option!327)

(assert (=> b!264329 (= e!171251 e!171252)))

(declare-fun c!45216 () Bool)

(assert (=> b!264329 (= c!45216 (and ((_ is Cons!3759) (toList!1916 lt!133300)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133300))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!264330 () Bool)

(assert (=> b!264330 (= e!171252 (getValueByKey!321 (t!8832 (toList!1916 lt!133300)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!63909 () Bool)

(declare-fun c!45215 () Bool)

(assert (=> d!63909 (= c!45215 (and ((_ is Cons!3759) (toList!1916 lt!133300)) (= (_1!2454 (h!4425 (toList!1916 lt!133300))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63909 (= (getValueByKey!321 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000) e!171251)))

(declare-fun b!264328 () Bool)

(assert (=> b!264328 (= e!171251 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133300)))))))

(assert (= (and d!63909 c!45215) b!264328))

(assert (= (and d!63909 (not c!45215)) b!264329))

(assert (= (and b!264329 c!45216) b!264330))

(assert (= (and b!264329 (not c!45216)) b!264331))

(declare-fun m!281273 () Bool)

(assert (=> b!264330 m!281273))

(assert (=> b!263336 d!63909))

(assert (=> d!63393 d!63387))

(assert (=> d!63393 d!63377))

(declare-fun d!63911 () Bool)

(assert (=> d!63911 (contains!1885 (+!712 lt!133253 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) lt!133242)))

(assert (=> d!63911 true))

(declare-fun _$35!421 () Unit!8164)

(assert (=> d!63911 (= (choose!1301 lt!133253 lt!133259 (zeroValue!4683 thiss!1504) lt!133242) _$35!421)))

(declare-fun bs!9338 () Bool)

(assert (= bs!9338 d!63911))

(assert (=> bs!9338 m!279421))

(assert (=> bs!9338 m!279421))

(assert (=> bs!9338 m!279423))

(assert (=> d!63393 d!63911))

(declare-fun d!63913 () Bool)

(declare-fun e!171253 () Bool)

(assert (=> d!63913 e!171253))

(declare-fun res!129002 () Bool)

(assert (=> d!63913 (=> res!129002 e!171253)))

(declare-fun lt!133805 () Bool)

(assert (=> d!63913 (= res!129002 (not lt!133805))))

(declare-fun lt!133807 () Bool)

(assert (=> d!63913 (= lt!133805 lt!133807)))

(declare-fun lt!133806 () Unit!8164)

(declare-fun e!171254 () Unit!8164)

(assert (=> d!63913 (= lt!133806 e!171254)))

(declare-fun c!45217 () Bool)

(assert (=> d!63913 (= c!45217 lt!133807)))

(assert (=> d!63913 (= lt!133807 (containsKey!312 (toList!1916 lt!133253) lt!133242))))

(assert (=> d!63913 (= (contains!1885 lt!133253 lt!133242) lt!133805)))

(declare-fun b!264332 () Bool)

(declare-fun lt!133804 () Unit!8164)

(assert (=> b!264332 (= e!171254 lt!133804)))

(assert (=> b!264332 (= lt!133804 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133253) lt!133242))))

(assert (=> b!264332 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133253) lt!133242))))

(declare-fun b!264333 () Bool)

(declare-fun Unit!8215 () Unit!8164)

(assert (=> b!264333 (= e!171254 Unit!8215)))

(declare-fun b!264334 () Bool)

(assert (=> b!264334 (= e!171253 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133253) lt!133242)))))

(assert (= (and d!63913 c!45217) b!264332))

(assert (= (and d!63913 (not c!45217)) b!264333))

(assert (= (and d!63913 (not res!129002)) b!264334))

(declare-fun m!281275 () Bool)

(assert (=> d!63913 m!281275))

(declare-fun m!281277 () Bool)

(assert (=> b!264332 m!281277))

(declare-fun m!281279 () Bool)

(assert (=> b!264332 m!281279))

(assert (=> b!264332 m!281279))

(declare-fun m!281281 () Bool)

(assert (=> b!264332 m!281281))

(assert (=> b!264334 m!281279))

(assert (=> b!264334 m!281279))

(assert (=> b!264334 m!281281))

(assert (=> d!63393 d!63913))

(assert (=> b!263329 d!63813))

(declare-fun b!264338 () Bool)

(declare-fun e!171256 () Option!327)

(assert (=> b!264338 (= e!171256 None!325)))

(declare-fun b!264336 () Bool)

(declare-fun e!171255 () Option!327)

(assert (=> b!264336 (= e!171255 e!171256)))

(declare-fun c!45219 () Bool)

(assert (=> b!264336 (= c!45219 (and ((_ is Cons!3759) (t!8832 lt!133177)) (not (= (_1!2454 (h!4425 (t!8832 lt!133177))) (_1!2454 lt!133017)))))))

(declare-fun b!264337 () Bool)

(assert (=> b!264337 (= e!171256 (getValueByKey!321 (t!8832 (t!8832 lt!133177)) (_1!2454 lt!133017)))))

(declare-fun d!63915 () Bool)

(declare-fun c!45218 () Bool)

(assert (=> d!63915 (= c!45218 (and ((_ is Cons!3759) (t!8832 lt!133177)) (= (_1!2454 (h!4425 (t!8832 lt!133177))) (_1!2454 lt!133017))))))

(assert (=> d!63915 (= (getValueByKey!321 (t!8832 lt!133177) (_1!2454 lt!133017)) e!171255)))

(declare-fun b!264335 () Bool)

(assert (=> b!264335 (= e!171255 (Some!326 (_2!2454 (h!4425 (t!8832 lt!133177)))))))

(assert (= (and d!63915 c!45218) b!264335))

(assert (= (and d!63915 (not c!45218)) b!264336))

(assert (= (and b!264336 c!45219) b!264337))

(assert (= (and b!264336 (not c!45219)) b!264338))

(declare-fun m!281283 () Bool)

(assert (=> b!264337 m!281283))

(assert (=> b!263447 d!63915))

(declare-fun d!63917 () Bool)

(declare-fun res!129003 () Bool)

(declare-fun e!171257 () Bool)

(assert (=> d!63917 (=> res!129003 e!171257)))

(assert (=> d!63917 (= res!129003 (and ((_ is Cons!3759) (toList!1916 lt!133244)) (= (_1!2454 (h!4425 (toList!1916 lt!133244))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63917 (= (containsKey!312 (toList!1916 lt!133244) #b1000000000000000000000000000000000000000000000000000000000000000) e!171257)))

(declare-fun b!264339 () Bool)

(declare-fun e!171258 () Bool)

(assert (=> b!264339 (= e!171257 e!171258)))

(declare-fun res!129004 () Bool)

(assert (=> b!264339 (=> (not res!129004) (not e!171258))))

(assert (=> b!264339 (= res!129004 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133244))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133244))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!3759) (toList!1916 lt!133244)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133244))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264340 () Bool)

(assert (=> b!264340 (= e!171258 (containsKey!312 (t!8832 (toList!1916 lt!133244)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!63917 (not res!129003)) b!264339))

(assert (= (and b!264339 res!129004) b!264340))

(declare-fun m!281285 () Bool)

(assert (=> b!264340 m!281285))

(assert (=> d!63349 d!63917))

(declare-fun d!63919 () Bool)

(assert (=> d!63919 (arrayContainsKey!0 (_keys!7034 thiss!1504) lt!133466 #b00000000000000000000000000000000)))

(declare-fun lt!133808 () Unit!8164)

(assert (=> d!63919 (= lt!133808 (choose!13 (_keys!7034 thiss!1504) lt!133466 #b00000000000000000000000000000000))))

(assert (=> d!63919 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!63919 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7034 thiss!1504) lt!133466 #b00000000000000000000000000000000) lt!133808)))

(declare-fun bs!9339 () Bool)

(assert (= bs!9339 d!63919))

(assert (=> bs!9339 m!279931))

(declare-fun m!281287 () Bool)

(assert (=> bs!9339 m!281287))

(assert (=> b!263548 d!63919))

(declare-fun d!63921 () Bool)

(declare-fun res!129005 () Bool)

(declare-fun e!171259 () Bool)

(assert (=> d!63921 (=> res!129005 e!171259)))

(assert (=> d!63921 (= res!129005 (= (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) lt!133466))))

(assert (=> d!63921 (= (arrayContainsKey!0 (_keys!7034 thiss!1504) lt!133466 #b00000000000000000000000000000000) e!171259)))

(declare-fun b!264341 () Bool)

(declare-fun e!171260 () Bool)

(assert (=> b!264341 (= e!171259 e!171260)))

(declare-fun res!129006 () Bool)

(assert (=> b!264341 (=> (not res!129006) (not e!171260))))

(assert (=> b!264341 (= res!129006 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun b!264342 () Bool)

(assert (=> b!264342 (= e!171260 (arrayContainsKey!0 (_keys!7034 thiss!1504) lt!133466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63921 (not res!129005)) b!264341))

(assert (= (and b!264341 res!129006) b!264342))

(assert (=> d!63921 m!279365))

(declare-fun m!281289 () Bool)

(assert (=> b!264342 m!281289))

(assert (=> b!263548 d!63921))

(declare-fun b!264343 () Bool)

(declare-fun e!171263 () SeekEntryResult!1164)

(declare-fun lt!133811 () SeekEntryResult!1164)

(assert (=> b!264343 (= e!171263 (seekKeyOrZeroReturnVacant!0 (x!25206 lt!133811) (index!6828 lt!133811) (index!6828 lt!133811) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun d!63923 () Bool)

(declare-fun lt!133809 () SeekEntryResult!1164)

(assert (=> d!63923 (and (or ((_ is Undefined!1164) lt!133809) (not ((_ is Found!1164) lt!133809)) (and (bvsge (index!6827 lt!133809) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133809) (size!6347 (_keys!7034 thiss!1504))))) (or ((_ is Undefined!1164) lt!133809) ((_ is Found!1164) lt!133809) (not ((_ is MissingZero!1164) lt!133809)) (and (bvsge (index!6826 lt!133809) #b00000000000000000000000000000000) (bvslt (index!6826 lt!133809) (size!6347 (_keys!7034 thiss!1504))))) (or ((_ is Undefined!1164) lt!133809) ((_ is Found!1164) lt!133809) ((_ is MissingZero!1164) lt!133809) (not ((_ is MissingVacant!1164) lt!133809)) (and (bvsge (index!6829 lt!133809) #b00000000000000000000000000000000) (bvslt (index!6829 lt!133809) (size!6347 (_keys!7034 thiss!1504))))) (or ((_ is Undefined!1164) lt!133809) (ite ((_ is Found!1164) lt!133809) (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6827 lt!133809)) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1164) lt!133809) (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6826 lt!133809)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1164) lt!133809) (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6829 lt!133809)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!171261 () SeekEntryResult!1164)

(assert (=> d!63923 (= lt!133809 e!171261)))

(declare-fun c!45220 () Bool)

(assert (=> d!63923 (= c!45220 (and ((_ is Intermediate!1164) lt!133811) (undefined!1976 lt!133811)))))

(assert (=> d!63923 (= lt!133811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (mask!11208 thiss!1504)) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(assert (=> d!63923 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63923 (= (seekEntryOrOpen!0 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (_keys!7034 thiss!1504) (mask!11208 thiss!1504)) lt!133809)))

(declare-fun b!264344 () Bool)

(declare-fun c!45222 () Bool)

(declare-fun lt!133810 () (_ BitVec 64))

(assert (=> b!264344 (= c!45222 (= lt!133810 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171262 () SeekEntryResult!1164)

(assert (=> b!264344 (= e!171262 e!171263)))

(declare-fun b!264345 () Bool)

(assert (=> b!264345 (= e!171261 Undefined!1164)))

(declare-fun b!264346 () Bool)

(assert (=> b!264346 (= e!171263 (MissingZero!1164 (index!6828 lt!133811)))))

(declare-fun b!264347 () Bool)

(assert (=> b!264347 (= e!171261 e!171262)))

(assert (=> b!264347 (= lt!133810 (select (arr!5996 (_keys!7034 thiss!1504)) (index!6828 lt!133811)))))

(declare-fun c!45221 () Bool)

(assert (=> b!264347 (= c!45221 (= lt!133810 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!264348 () Bool)

(assert (=> b!264348 (= e!171262 (Found!1164 (index!6828 lt!133811)))))

(assert (= (and d!63923 c!45220) b!264345))

(assert (= (and d!63923 (not c!45220)) b!264347))

(assert (= (and b!264347 c!45221) b!264348))

(assert (= (and b!264347 (not c!45221)) b!264344))

(assert (= (and b!264344 c!45222) b!264346))

(assert (= (and b!264344 (not c!45222)) b!264343))

(assert (=> b!264343 m!279365))

(declare-fun m!281291 () Bool)

(assert (=> b!264343 m!281291))

(assert (=> d!63923 m!279317))

(assert (=> d!63923 m!279365))

(declare-fun m!281293 () Bool)

(assert (=> d!63923 m!281293))

(declare-fun m!281295 () Bool)

(assert (=> d!63923 m!281295))

(assert (=> d!63923 m!281293))

(assert (=> d!63923 m!279365))

(declare-fun m!281297 () Bool)

(assert (=> d!63923 m!281297))

(declare-fun m!281299 () Bool)

(assert (=> d!63923 m!281299))

(declare-fun m!281301 () Bool)

(assert (=> d!63923 m!281301))

(declare-fun m!281303 () Bool)

(assert (=> b!264347 m!281303))

(assert (=> b!263548 d!63923))

(declare-fun d!63925 () Bool)

(declare-fun e!171264 () Bool)

(assert (=> d!63925 e!171264))

(declare-fun res!129007 () Bool)

(assert (=> d!63925 (=> res!129007 e!171264)))

(declare-fun lt!133813 () Bool)

(assert (=> d!63925 (= res!129007 (not lt!133813))))

(declare-fun lt!133815 () Bool)

(assert (=> d!63925 (= lt!133813 lt!133815)))

(declare-fun lt!133814 () Unit!8164)

(declare-fun e!171265 () Unit!8164)

(assert (=> d!63925 (= lt!133814 e!171265)))

(declare-fun c!45223 () Bool)

(assert (=> d!63925 (= c!45223 lt!133815)))

(assert (=> d!63925 (= lt!133815 (containsKey!312 (toList!1916 lt!133445) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!63925 (= (contains!1885 lt!133445 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133813)))

(declare-fun b!264349 () Bool)

(declare-fun lt!133812 () Unit!8164)

(assert (=> b!264349 (= e!171265 lt!133812)))

(assert (=> b!264349 (= lt!133812 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133445) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264349 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133445) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264350 () Bool)

(declare-fun Unit!8216 () Unit!8164)

(assert (=> b!264350 (= e!171265 Unit!8216)))

(declare-fun b!264351 () Bool)

(assert (=> b!264351 (= e!171264 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63925 c!45223) b!264349))

(assert (= (and d!63925 (not c!45223)) b!264350))

(assert (= (and d!63925 (not res!129007)) b!264351))

(declare-fun m!281305 () Bool)

(assert (=> d!63925 m!281305))

(declare-fun m!281307 () Bool)

(assert (=> b!264349 m!281307))

(assert (=> b!264349 m!281167))

(assert (=> b!264349 m!281167))

(declare-fun m!281309 () Bool)

(assert (=> b!264349 m!281309))

(assert (=> b!264351 m!281167))

(assert (=> b!264351 m!281167))

(assert (=> b!264351 m!281309))

(assert (=> bm!25207 d!63925))

(declare-fun d!63927 () Bool)

(assert (=> d!63927 (= (get!3101 (select (arr!5995 lt!133020) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5504 (select (arr!5995 lt!133020) #b00000000000000000000000000000000)))))

(assert (=> b!263509 d!63927))

(declare-fun d!63929 () Bool)

(declare-fun res!129008 () Bool)

(declare-fun e!171266 () Bool)

(assert (=> d!63929 (=> res!129008 e!171266)))

(assert (=> d!63929 (= res!129008 (and ((_ is Cons!3759) (toList!1916 lt!133300)) (= (_1!2454 (h!4425 (toList!1916 lt!133300))) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))))

(assert (=> d!63929 (= (containsKey!312 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)) e!171266)))

(declare-fun b!264352 () Bool)

(declare-fun e!171267 () Bool)

(assert (=> b!264352 (= e!171266 e!171267)))

(declare-fun res!129009 () Bool)

(assert (=> b!264352 (=> (not res!129009) (not e!171267))))

(assert (=> b!264352 (= res!129009 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133300))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133300))) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))) ((_ is Cons!3759) (toList!1916 lt!133300)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133300))) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))))

(declare-fun b!264353 () Bool)

(assert (=> b!264353 (= e!171267 (containsKey!312 (t!8832 (toList!1916 lt!133300)) (select (arr!5996 lt!133005) #b00000000000000000000000000000000)))))

(assert (= (and d!63929 (not res!129008)) b!264352))

(assert (= (and b!264352 res!129009) b!264353))

(assert (=> b!264353 m!279433))

(declare-fun m!281311 () Bool)

(assert (=> b!264353 m!281311))

(assert (=> d!63369 d!63929))

(declare-fun d!63931 () Bool)

(declare-fun res!129010 () Bool)

(declare-fun e!171268 () Bool)

(assert (=> d!63931 (=> res!129010 e!171268)))

(assert (=> d!63931 (= res!129010 (and ((_ is Cons!3759) (toList!1916 lt!133244)) (= (_1!2454 (h!4425 (toList!1916 lt!133244))) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (=> d!63931 (= (containsKey!312 (toList!1916 lt!133244) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) e!171268)))

(declare-fun b!264354 () Bool)

(declare-fun e!171269 () Bool)

(assert (=> b!264354 (= e!171268 e!171269)))

(declare-fun res!129011 () Bool)

(assert (=> b!264354 (=> (not res!129011) (not e!171269))))

(assert (=> b!264354 (= res!129011 (and (or (not ((_ is Cons!3759) (toList!1916 lt!133244))) (bvsle (_1!2454 (h!4425 (toList!1916 lt!133244))) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))) ((_ is Cons!3759) (toList!1916 lt!133244)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133244))) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun b!264355 () Bool)

(assert (=> b!264355 (= e!171269 (containsKey!312 (t!8832 (toList!1916 lt!133244)) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!63931 (not res!129010)) b!264354))

(assert (= (and b!264354 res!129011) b!264355))

(assert (=> b!264355 m!279365))

(declare-fun m!281313 () Bool)

(assert (=> b!264355 m!281313))

(assert (=> d!63245 d!63931))

(declare-fun d!63933 () Bool)

(assert (=> d!63933 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133313) lt!133316)) (v!5509 (getValueByKey!321 (toList!1916 lt!133313) lt!133316)))))

(assert (=> d!63257 d!63933))

(declare-fun b!264359 () Bool)

(declare-fun e!171271 () Option!327)

(assert (=> b!264359 (= e!171271 None!325)))

(declare-fun b!264357 () Bool)

(declare-fun e!171270 () Option!327)

(assert (=> b!264357 (= e!171270 e!171271)))

(declare-fun c!45225 () Bool)

(assert (=> b!264357 (= c!45225 (and ((_ is Cons!3759) (toList!1916 lt!133313)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133313))) lt!133316))))))

(declare-fun b!264358 () Bool)

(assert (=> b!264358 (= e!171271 (getValueByKey!321 (t!8832 (toList!1916 lt!133313)) lt!133316))))

(declare-fun d!63935 () Bool)

(declare-fun c!45224 () Bool)

(assert (=> d!63935 (= c!45224 (and ((_ is Cons!3759) (toList!1916 lt!133313)) (= (_1!2454 (h!4425 (toList!1916 lt!133313))) lt!133316)))))

(assert (=> d!63935 (= (getValueByKey!321 (toList!1916 lt!133313) lt!133316) e!171270)))

(declare-fun b!264356 () Bool)

(assert (=> b!264356 (= e!171270 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133313)))))))

(assert (= (and d!63935 c!45224) b!264356))

(assert (= (and d!63935 (not c!45224)) b!264357))

(assert (= (and b!264357 c!45225) b!264358))

(assert (= (and b!264357 (not c!45225)) b!264359))

(declare-fun m!281315 () Bool)

(assert (=> b!264358 m!281315))

(assert (=> d!63257 d!63935))

(declare-fun b!264360 () Bool)

(declare-fun e!171272 () Bool)

(declare-fun call!25275 () Bool)

(assert (=> b!264360 (= e!171272 call!25275)))

(declare-fun bm!25272 () Bool)

(assert (=> bm!25272 (= call!25275 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!7034 lt!133011) (mask!11208 lt!133011)))))

(declare-fun b!264361 () Bool)

(declare-fun e!171273 () Bool)

(assert (=> b!264361 (= e!171273 call!25275)))

(declare-fun b!264362 () Bool)

(declare-fun e!171274 () Bool)

(assert (=> b!264362 (= e!171274 e!171273)))

(declare-fun c!45226 () Bool)

(assert (=> b!264362 (= c!45226 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63937 () Bool)

(declare-fun res!129013 () Bool)

(assert (=> d!63937 (=> res!129013 e!171274)))

(assert (=> d!63937 (= res!129013 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 lt!133011))))))

(assert (=> d!63937 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!7034 lt!133011) (mask!11208 lt!133011)) e!171274)))

(declare-fun b!264363 () Bool)

(assert (=> b!264363 (= e!171273 e!171272)))

(declare-fun lt!133817 () (_ BitVec 64))

(assert (=> b!264363 (= lt!133817 (select (arr!5996 (_keys!7034 lt!133011)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!133818 () Unit!8164)

(assert (=> b!264363 (= lt!133818 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!7034 lt!133011) lt!133817 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!264363 (arrayContainsKey!0 (_keys!7034 lt!133011) lt!133817 #b00000000000000000000000000000000)))

(declare-fun lt!133816 () Unit!8164)

(assert (=> b!264363 (= lt!133816 lt!133818)))

(declare-fun res!129012 () Bool)

(assert (=> b!264363 (= res!129012 (= (seekEntryOrOpen!0 (select (arr!5996 (_keys!7034 lt!133011)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!7034 lt!133011) (mask!11208 lt!133011)) (Found!1164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!264363 (=> (not res!129012) (not e!171272))))

(assert (= (and d!63937 (not res!129013)) b!264362))

(assert (= (and b!264362 c!45226) b!264363))

(assert (= (and b!264362 (not c!45226)) b!264361))

(assert (= (and b!264363 res!129012) b!264360))

(assert (= (or b!264360 b!264361) bm!25272))

(declare-fun m!281317 () Bool)

(assert (=> bm!25272 m!281317))

(assert (=> b!264362 m!280319))

(assert (=> b!264362 m!280319))

(assert (=> b!264362 m!280323))

(assert (=> b!264363 m!280319))

(declare-fun m!281319 () Bool)

(assert (=> b!264363 m!281319))

(declare-fun m!281321 () Bool)

(assert (=> b!264363 m!281321))

(assert (=> b!264363 m!280319))

(declare-fun m!281323 () Bool)

(assert (=> b!264363 m!281323))

(assert (=> bm!25185 d!63937))

(declare-fun d!63939 () Bool)

(assert (=> d!63939 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5509 (getValueByKey!321 (toList!1916 lt!133244) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63305 d!63939))

(assert (=> d!63305 d!63665))

(declare-fun lt!133819 () Bool)

(declare-fun d!63941 () Bool)

(assert (=> d!63941 (= lt!133819 (select (content!178 (toList!1916 lt!133532)) (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))

(declare-fun e!171276 () Bool)

(assert (=> d!63941 (= lt!133819 e!171276)))

(declare-fun res!129015 () Bool)

(assert (=> d!63941 (=> (not res!129015) (not e!171276))))

(assert (=> d!63941 (= res!129015 ((_ is Cons!3759) (toList!1916 lt!133532)))))

(assert (=> d!63941 (= (contains!1888 (toList!1916 lt!133532) (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) lt!133819)))

(declare-fun b!264364 () Bool)

(declare-fun e!171275 () Bool)

(assert (=> b!264364 (= e!171276 e!171275)))

(declare-fun res!129014 () Bool)

(assert (=> b!264364 (=> res!129014 e!171275)))

(assert (=> b!264364 (= res!129014 (= (h!4425 (toList!1916 lt!133532)) (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))

(declare-fun b!264365 () Bool)

(assert (=> b!264365 (= e!171275 (contains!1888 (t!8832 (toList!1916 lt!133532)) (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))

(assert (= (and d!63941 res!129015) b!264364))

(assert (= (and b!264364 (not res!129014)) b!264365))

(declare-fun m!281325 () Bool)

(assert (=> d!63941 m!281325))

(declare-fun m!281327 () Bool)

(assert (=> d!63941 m!281327))

(declare-fun m!281329 () Bool)

(assert (=> b!264365 m!281329))

(assert (=> b!263653 d!63941))

(declare-fun d!63943 () Bool)

(assert (=> d!63943 (= (apply!262 (+!712 lt!133256 (tuple2!4887 lt!133247 (minValue!4683 thiss!1504))) lt!133250) (apply!262 lt!133256 lt!133250))))

(assert (=> d!63943 true))

(declare-fun _$34!1136 () Unit!8164)

(assert (=> d!63943 (= (choose!1300 lt!133256 lt!133247 (minValue!4683 thiss!1504) lt!133250) _$34!1136)))

(declare-fun bs!9340 () Bool)

(assert (= bs!9340 d!63943))

(assert (=> bs!9340 m!279411))

(assert (=> bs!9340 m!279411))

(assert (=> bs!9340 m!279413))

(assert (=> bs!9340 m!279405))

(assert (=> d!63373 d!63943))

(assert (=> d!63373 d!63397))

(declare-fun d!63945 () Bool)

(declare-fun e!171277 () Bool)

(assert (=> d!63945 e!171277))

(declare-fun res!129016 () Bool)

(assert (=> d!63945 (=> res!129016 e!171277)))

(declare-fun lt!133821 () Bool)

(assert (=> d!63945 (= res!129016 (not lt!133821))))

(declare-fun lt!133823 () Bool)

(assert (=> d!63945 (= lt!133821 lt!133823)))

(declare-fun lt!133822 () Unit!8164)

(declare-fun e!171278 () Unit!8164)

(assert (=> d!63945 (= lt!133822 e!171278)))

(declare-fun c!45227 () Bool)

(assert (=> d!63945 (= c!45227 lt!133823)))

(assert (=> d!63945 (= lt!133823 (containsKey!312 (toList!1916 lt!133256) lt!133250))))

(assert (=> d!63945 (= (contains!1885 lt!133256 lt!133250) lt!133821)))

(declare-fun b!264366 () Bool)

(declare-fun lt!133820 () Unit!8164)

(assert (=> b!264366 (= e!171278 lt!133820)))

(assert (=> b!264366 (= lt!133820 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133256) lt!133250))))

(assert (=> b!264366 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133256) lt!133250))))

(declare-fun b!264367 () Bool)

(declare-fun Unit!8217 () Unit!8164)

(assert (=> b!264367 (= e!171278 Unit!8217)))

(declare-fun b!264368 () Bool)

(assert (=> b!264368 (= e!171277 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133256) lt!133250)))))

(assert (= (and d!63945 c!45227) b!264366))

(assert (= (and d!63945 (not c!45227)) b!264367))

(assert (= (and d!63945 (not res!129016)) b!264368))

(declare-fun m!281331 () Bool)

(assert (=> d!63945 m!281331))

(declare-fun m!281333 () Bool)

(assert (=> b!264366 m!281333))

(assert (=> b!264366 m!280125))

(assert (=> b!264366 m!280125))

(declare-fun m!281335 () Bool)

(assert (=> b!264366 m!281335))

(assert (=> b!264368 m!280125))

(assert (=> b!264368 m!280125))

(assert (=> b!264368 m!281335))

(assert (=> d!63373 d!63945))

(assert (=> d!63373 d!63385))

(assert (=> d!63373 d!63399))

(declare-fun d!63947 () Bool)

(declare-fun lt!133824 () Bool)

(assert (=> d!63947 (= lt!133824 (select (content!178 (toList!1916 lt!133414)) (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun e!171280 () Bool)

(assert (=> d!63947 (= lt!133824 e!171280)))

(declare-fun res!129018 () Bool)

(assert (=> d!63947 (=> (not res!129018) (not e!171280))))

(assert (=> d!63947 (= res!129018 ((_ is Cons!3759) (toList!1916 lt!133414)))))

(assert (=> d!63947 (= (contains!1888 (toList!1916 lt!133414) (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) lt!133824)))

(declare-fun b!264369 () Bool)

(declare-fun e!171279 () Bool)

(assert (=> b!264369 (= e!171280 e!171279)))

(declare-fun res!129017 () Bool)

(assert (=> b!264369 (=> res!129017 e!171279)))

(assert (=> b!264369 (= res!129017 (= (h!4425 (toList!1916 lt!133414)) (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(declare-fun b!264370 () Bool)

(assert (=> b!264370 (= e!171279 (contains!1888 (t!8832 (toList!1916 lt!133414)) (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63947 res!129018) b!264369))

(assert (= (and b!264369 (not res!129017)) b!264370))

(declare-fun m!281337 () Bool)

(assert (=> d!63947 m!281337))

(declare-fun m!281339 () Bool)

(assert (=> d!63947 m!281339))

(declare-fun m!281341 () Bool)

(assert (=> b!264370 m!281341))

(assert (=> b!263427 d!63947))

(declare-fun lt!133825 () Bool)

(declare-fun d!63949 () Bool)

(assert (=> d!63949 (= lt!133825 (select (content!178 (toList!1916 lt!133511)) (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))

(declare-fun e!171282 () Bool)

(assert (=> d!63949 (= lt!133825 e!171282)))

(declare-fun res!129020 () Bool)

(assert (=> d!63949 (=> (not res!129020) (not e!171282))))

(assert (=> d!63949 (= res!129020 ((_ is Cons!3759) (toList!1916 lt!133511)))))

(assert (=> d!63949 (= (contains!1888 (toList!1916 lt!133511) (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) lt!133825)))

(declare-fun b!264371 () Bool)

(declare-fun e!171281 () Bool)

(assert (=> b!264371 (= e!171282 e!171281)))

(declare-fun res!129019 () Bool)

(assert (=> b!264371 (=> res!129019 e!171281)))

(assert (=> b!264371 (= res!129019 (= (h!4425 (toList!1916 lt!133511)) (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))

(declare-fun b!264372 () Bool)

(assert (=> b!264372 (= e!171281 (contains!1888 (t!8832 (toList!1916 lt!133511)) (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!63949 res!129020) b!264371))

(assert (= (and b!264371 (not res!129019)) b!264372))

(declare-fun m!281343 () Bool)

(assert (=> d!63949 m!281343))

(declare-fun m!281345 () Bool)

(assert (=> d!63949 m!281345))

(declare-fun m!281347 () Bool)

(assert (=> b!264372 m!281347))

(assert (=> b!263633 d!63949))

(assert (=> b!263594 d!63469))

(assert (=> d!63275 d!63265))

(assert (=> d!63275 d!63255))

(declare-fun d!63951 () Bool)

(assert (=> d!63951 (= (apply!262 (+!712 lt!133312 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) lt!133306) (apply!262 lt!133312 lt!133306))))

(assert (=> d!63951 true))

(declare-fun _$34!1137 () Unit!8164)

(assert (=> d!63951 (= (choose!1300 lt!133312 lt!133303 (minValue!4683 thiss!1504) lt!133306) _$34!1137)))

(declare-fun bs!9341 () Bool)

(assert (= bs!9341 d!63951))

(assert (=> bs!9341 m!279535))

(assert (=> bs!9341 m!279535))

(assert (=> bs!9341 m!279537))

(assert (=> bs!9341 m!279529))

(assert (=> d!63275 d!63951))

(assert (=> d!63275 d!63271))

(declare-fun d!63953 () Bool)

(declare-fun e!171283 () Bool)

(assert (=> d!63953 e!171283))

(declare-fun res!129021 () Bool)

(assert (=> d!63953 (=> res!129021 e!171283)))

(declare-fun lt!133827 () Bool)

(assert (=> d!63953 (= res!129021 (not lt!133827))))

(declare-fun lt!133829 () Bool)

(assert (=> d!63953 (= lt!133827 lt!133829)))

(declare-fun lt!133828 () Unit!8164)

(declare-fun e!171284 () Unit!8164)

(assert (=> d!63953 (= lt!133828 e!171284)))

(declare-fun c!45228 () Bool)

(assert (=> d!63953 (= c!45228 lt!133829)))

(assert (=> d!63953 (= lt!133829 (containsKey!312 (toList!1916 lt!133312) lt!133306))))

(assert (=> d!63953 (= (contains!1885 lt!133312 lt!133306) lt!133827)))

(declare-fun b!264373 () Bool)

(declare-fun lt!133826 () Unit!8164)

(assert (=> b!264373 (= e!171284 lt!133826)))

(assert (=> b!264373 (= lt!133826 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133312) lt!133306))))

(assert (=> b!264373 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133312) lt!133306))))

(declare-fun b!264374 () Bool)

(declare-fun Unit!8218 () Unit!8164)

(assert (=> b!264374 (= e!171284 Unit!8218)))

(declare-fun b!264375 () Bool)

(assert (=> b!264375 (= e!171283 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133312) lt!133306)))))

(assert (= (and d!63953 c!45228) b!264373))

(assert (= (and d!63953 (not c!45228)) b!264374))

(assert (= (and d!63953 (not res!129021)) b!264375))

(declare-fun m!281349 () Bool)

(assert (=> d!63953 m!281349))

(declare-fun m!281351 () Bool)

(assert (=> b!264373 m!281351))

(assert (=> b!264373 m!279745))

(assert (=> b!264373 m!279745))

(declare-fun m!281353 () Bool)

(assert (=> b!264373 m!281353))

(assert (=> b!264375 m!279745))

(assert (=> b!264375 m!279745))

(assert (=> b!264375 m!281353))

(assert (=> d!63275 d!63953))

(assert (=> d!63231 d!63223))

(declare-fun b!264379 () Bool)

(declare-fun e!171286 () Option!327)

(assert (=> b!264379 (= e!171286 None!325)))

(declare-fun b!264377 () Bool)

(declare-fun e!171285 () Option!327)

(assert (=> b!264377 (= e!171285 e!171286)))

(declare-fun c!45230 () Bool)

(assert (=> b!264377 (= c!45230 (and ((_ is Cons!3759) (toList!1916 lt!133437)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133437))) (_1!2454 (tuple2!4887 key!932 v!346))))))))

(declare-fun b!264378 () Bool)

(assert (=> b!264378 (= e!171286 (getValueByKey!321 (t!8832 (toList!1916 lt!133437)) (_1!2454 (tuple2!4887 key!932 v!346))))))

(declare-fun c!45229 () Bool)

(declare-fun d!63955 () Bool)

(assert (=> d!63955 (= c!45229 (and ((_ is Cons!3759) (toList!1916 lt!133437)) (= (_1!2454 (h!4425 (toList!1916 lt!133437))) (_1!2454 (tuple2!4887 key!932 v!346)))))))

(assert (=> d!63955 (= (getValueByKey!321 (toList!1916 lt!133437) (_1!2454 (tuple2!4887 key!932 v!346))) e!171285)))

(declare-fun b!264376 () Bool)

(assert (=> b!264376 (= e!171285 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133437)))))))

(assert (= (and d!63955 c!45229) b!264376))

(assert (= (and d!63955 (not c!45229)) b!264377))

(assert (= (and b!264377 c!45230) b!264378))

(assert (= (and b!264377 (not c!45230)) b!264379))

(declare-fun m!281355 () Bool)

(assert (=> b!264378 m!281355))

(assert (=> b!263515 d!63955))

(declare-fun d!63957 () Bool)

(declare-fun res!129022 () Bool)

(declare-fun e!171287 () Bool)

(assert (=> d!63957 (=> res!129022 e!171287)))

(assert (=> d!63957 (= res!129022 (= (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!133278))))

(assert (=> d!63957 (= (arrayContainsKey!0 lt!133005 lt!133278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!171287)))

(declare-fun b!264380 () Bool)

(declare-fun e!171288 () Bool)

(assert (=> b!264380 (= e!171287 e!171288)))

(declare-fun res!129023 () Bool)

(assert (=> b!264380 (=> (not res!129023) (not e!171288))))

(assert (=> b!264380 (= res!129023 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(declare-fun b!264381 () Bool)

(assert (=> b!264381 (= e!171288 (arrayContainsKey!0 lt!133005 lt!133278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!63957 (not res!129022)) b!264380))

(assert (= (and b!264380 res!129023) b!264381))

(assert (=> d!63957 m!279845))

(declare-fun m!281357 () Bool)

(assert (=> b!264381 m!281357))

(assert (=> b!263678 d!63957))

(declare-fun d!63959 () Bool)

(declare-fun res!129024 () Bool)

(declare-fun e!171289 () Bool)

(assert (=> d!63959 (=> res!129024 e!171289)))

(assert (=> d!63959 (= res!129024 (and ((_ is Cons!3759) lt!133492) (= (_1!2454 (h!4425 lt!133492)) (_1!2454 lt!133017))))))

(assert (=> d!63959 (= (containsKey!312 lt!133492 (_1!2454 lt!133017)) e!171289)))

(declare-fun b!264382 () Bool)

(declare-fun e!171290 () Bool)

(assert (=> b!264382 (= e!171289 e!171290)))

(declare-fun res!129025 () Bool)

(assert (=> b!264382 (=> (not res!129025) (not e!171290))))

(assert (=> b!264382 (= res!129025 (and (or (not ((_ is Cons!3759) lt!133492)) (bvsle (_1!2454 (h!4425 lt!133492)) (_1!2454 lt!133017))) ((_ is Cons!3759) lt!133492) (bvslt (_1!2454 (h!4425 lt!133492)) (_1!2454 lt!133017))))))

(declare-fun b!264383 () Bool)

(assert (=> b!264383 (= e!171290 (containsKey!312 (t!8832 lt!133492) (_1!2454 lt!133017)))))

(assert (= (and d!63959 (not res!129024)) b!264382))

(assert (= (and b!264382 res!129025) b!264383))

(declare-fun m!281359 () Bool)

(assert (=> b!264383 m!281359))

(assert (=> b!263615 d!63959))

(assert (=> d!63235 d!63233))

(assert (=> d!63235 d!63173))

(assert (=> b!263637 d!63285))

(declare-fun d!63961 () Bool)

(assert (=> d!63961 (= (isEmpty!547 (getValueByKey!321 (toList!1916 lt!133013) key!932)) (not ((_ is Some!326) (getValueByKey!321 (toList!1916 lt!133013) key!932))))))

(assert (=> d!63333 d!63961))

(declare-fun d!63963 () Bool)

(declare-fun e!171291 () Bool)

(assert (=> d!63963 e!171291))

(declare-fun res!129026 () Bool)

(assert (=> d!63963 (=> res!129026 e!171291)))

(declare-fun lt!133831 () Bool)

(assert (=> d!63963 (= res!129026 (not lt!133831))))

(declare-fun lt!133833 () Bool)

(assert (=> d!63963 (= lt!133831 lt!133833)))

(declare-fun lt!133832 () Unit!8164)

(declare-fun e!171292 () Unit!8164)

(assert (=> d!63963 (= lt!133832 e!171292)))

(declare-fun c!45231 () Bool)

(assert (=> d!63963 (= c!45231 lt!133833)))

(assert (=> d!63963 (= lt!133833 (containsKey!312 (toList!1916 lt!133437) (_1!2454 (tuple2!4887 key!932 v!346))))))

(assert (=> d!63963 (= (contains!1885 lt!133437 (_1!2454 (tuple2!4887 key!932 v!346))) lt!133831)))

(declare-fun b!264384 () Bool)

(declare-fun lt!133830 () Unit!8164)

(assert (=> b!264384 (= e!171292 lt!133830)))

(assert (=> b!264384 (= lt!133830 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133437) (_1!2454 (tuple2!4887 key!932 v!346))))))

(assert (=> b!264384 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133437) (_1!2454 (tuple2!4887 key!932 v!346))))))

(declare-fun b!264385 () Bool)

(declare-fun Unit!8219 () Unit!8164)

(assert (=> b!264385 (= e!171292 Unit!8219)))

(declare-fun b!264386 () Bool)

(assert (=> b!264386 (= e!171291 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133437) (_1!2454 (tuple2!4887 key!932 v!346)))))))

(assert (= (and d!63963 c!45231) b!264384))

(assert (= (and d!63963 (not c!45231)) b!264385))

(assert (= (and d!63963 (not res!129026)) b!264386))

(declare-fun m!281361 () Bool)

(assert (=> d!63963 m!281361))

(declare-fun m!281363 () Bool)

(assert (=> b!264384 m!281363))

(assert (=> b!264384 m!279863))

(assert (=> b!264384 m!279863))

(declare-fun m!281365 () Bool)

(assert (=> b!264384 m!281365))

(assert (=> b!264386 m!279863))

(assert (=> b!264386 m!279863))

(assert (=> b!264386 m!281365))

(assert (=> d!63319 d!63963))

(declare-fun b!264390 () Bool)

(declare-fun e!171294 () Option!327)

(assert (=> b!264390 (= e!171294 None!325)))

(declare-fun b!264388 () Bool)

(declare-fun e!171293 () Option!327)

(assert (=> b!264388 (= e!171293 e!171294)))

(declare-fun c!45233 () Bool)

(assert (=> b!264388 (= c!45233 (and ((_ is Cons!3759) lt!133438) (not (= (_1!2454 (h!4425 lt!133438)) (_1!2454 (tuple2!4887 key!932 v!346))))))))

(declare-fun b!264389 () Bool)

(assert (=> b!264389 (= e!171294 (getValueByKey!321 (t!8832 lt!133438) (_1!2454 (tuple2!4887 key!932 v!346))))))

(declare-fun c!45232 () Bool)

(declare-fun d!63965 () Bool)

(assert (=> d!63965 (= c!45232 (and ((_ is Cons!3759) lt!133438) (= (_1!2454 (h!4425 lt!133438)) (_1!2454 (tuple2!4887 key!932 v!346)))))))

(assert (=> d!63965 (= (getValueByKey!321 lt!133438 (_1!2454 (tuple2!4887 key!932 v!346))) e!171293)))

(declare-fun b!264387 () Bool)

(assert (=> b!264387 (= e!171293 (Some!326 (_2!2454 (h!4425 lt!133438))))))

(assert (= (and d!63965 c!45232) b!264387))

(assert (= (and d!63965 (not c!45232)) b!264388))

(assert (= (and b!264388 c!45233) b!264389))

(assert (= (and b!264388 (not c!45233)) b!264390))

(declare-fun m!281367 () Bool)

(assert (=> b!264389 m!281367))

(assert (=> d!63319 d!63965))

(declare-fun d!63967 () Bool)

(assert (=> d!63967 (= (getValueByKey!321 lt!133438 (_1!2454 (tuple2!4887 key!932 v!346))) (Some!326 (_2!2454 (tuple2!4887 key!932 v!346))))))

(declare-fun lt!133834 () Unit!8164)

(assert (=> d!63967 (= lt!133834 (choose!1302 lt!133438 (_1!2454 (tuple2!4887 key!932 v!346)) (_2!2454 (tuple2!4887 key!932 v!346))))))

(declare-fun e!171295 () Bool)

(assert (=> d!63967 e!171295))

(declare-fun res!129027 () Bool)

(assert (=> d!63967 (=> (not res!129027) (not e!171295))))

(assert (=> d!63967 (= res!129027 (isStrictlySorted!364 lt!133438))))

(assert (=> d!63967 (= (lemmaContainsTupThenGetReturnValue!177 lt!133438 (_1!2454 (tuple2!4887 key!932 v!346)) (_2!2454 (tuple2!4887 key!932 v!346))) lt!133834)))

(declare-fun b!264391 () Bool)

(declare-fun res!129028 () Bool)

(assert (=> b!264391 (=> (not res!129028) (not e!171295))))

(assert (=> b!264391 (= res!129028 (containsKey!312 lt!133438 (_1!2454 (tuple2!4887 key!932 v!346))))))

(declare-fun b!264392 () Bool)

(assert (=> b!264392 (= e!171295 (contains!1888 lt!133438 (tuple2!4887 (_1!2454 (tuple2!4887 key!932 v!346)) (_2!2454 (tuple2!4887 key!932 v!346)))))))

(assert (= (and d!63967 res!129027) b!264391))

(assert (= (and b!264391 res!129028) b!264392))

(assert (=> d!63967 m!279857))

(declare-fun m!281369 () Bool)

(assert (=> d!63967 m!281369))

(declare-fun m!281371 () Bool)

(assert (=> d!63967 m!281371))

(declare-fun m!281373 () Bool)

(assert (=> b!264391 m!281373))

(declare-fun m!281375 () Bool)

(assert (=> b!264392 m!281375))

(assert (=> d!63319 d!63967))

(declare-fun b!264393 () Bool)

(declare-fun e!171298 () List!3763)

(declare-fun call!25278 () List!3763)

(assert (=> b!264393 (= e!171298 call!25278)))

(declare-fun b!264394 () Bool)

(declare-fun e!171300 () List!3763)

(declare-fun call!25276 () List!3763)

(assert (=> b!264394 (= e!171300 call!25276)))

(declare-fun b!264395 () Bool)

(assert (=> b!264395 (= e!171298 call!25278)))

(declare-fun c!45235 () Bool)

(declare-fun e!171296 () List!3763)

(declare-fun call!25277 () List!3763)

(declare-fun bm!25273 () Bool)

(assert (=> bm!25273 (= call!25277 ($colon$colon!107 e!171296 (ite c!45235 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (tuple2!4887 (_1!2454 (tuple2!4887 key!932 v!346)) (_2!2454 (tuple2!4887 key!932 v!346))))))))

(declare-fun c!45237 () Bool)

(assert (=> bm!25273 (= c!45237 c!45235)))

(declare-fun b!264396 () Bool)

(declare-fun c!45236 () Bool)

(declare-fun c!45234 () Bool)

(assert (=> b!264396 (= e!171296 (ite c!45236 (t!8832 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (ite c!45234 (Cons!3759 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (t!8832 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) Nil!3760)))))

(declare-fun b!264397 () Bool)

(assert (=> b!264397 (= e!171296 (insertStrictlySorted!180 (t!8832 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (_1!2454 (tuple2!4887 key!932 v!346)) (_2!2454 (tuple2!4887 key!932 v!346))))))

(declare-fun bm!25274 () Bool)

(assert (=> bm!25274 (= call!25278 call!25276)))

(declare-fun d!63969 () Bool)

(declare-fun e!171299 () Bool)

(assert (=> d!63969 e!171299))

(declare-fun res!129029 () Bool)

(assert (=> d!63969 (=> (not res!129029) (not e!171299))))

(declare-fun lt!133835 () List!3763)

(assert (=> d!63969 (= res!129029 (isStrictlySorted!364 lt!133835))))

(declare-fun e!171297 () List!3763)

(assert (=> d!63969 (= lt!133835 e!171297)))

(assert (=> d!63969 (= c!45235 (and ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (bvslt (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (_1!2454 (tuple2!4887 key!932 v!346)))))))

(assert (=> d!63969 (isStrictlySorted!364 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))))

(assert (=> d!63969 (= (insertStrictlySorted!180 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (_1!2454 (tuple2!4887 key!932 v!346)) (_2!2454 (tuple2!4887 key!932 v!346))) lt!133835)))

(declare-fun b!264398 () Bool)

(assert (=> b!264398 (= e!171297 call!25277)))

(declare-fun bm!25275 () Bool)

(assert (=> bm!25275 (= call!25276 call!25277)))

(declare-fun b!264399 () Bool)

(assert (=> b!264399 (= e!171297 e!171300)))

(assert (=> b!264399 (= c!45236 (and ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (= (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (_1!2454 (tuple2!4887 key!932 v!346)))))))

(declare-fun b!264400 () Bool)

(assert (=> b!264400 (= e!171299 (contains!1888 lt!133835 (tuple2!4887 (_1!2454 (tuple2!4887 key!932 v!346)) (_2!2454 (tuple2!4887 key!932 v!346)))))))

(declare-fun b!264401 () Bool)

(assert (=> b!264401 (= c!45234 (and ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (bvsgt (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 (_keys!7034 thiss!1504) (_values!4825 thiss!1504) (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (_1!2454 (tuple2!4887 key!932 v!346)))))))

(assert (=> b!264401 (= e!171300 e!171298)))

(declare-fun b!264402 () Bool)

(declare-fun res!129030 () Bool)

(assert (=> b!264402 (=> (not res!129030) (not e!171299))))

(assert (=> b!264402 (= res!129030 (containsKey!312 lt!133835 (_1!2454 (tuple2!4887 key!932 v!346))))))

(assert (= (and d!63969 c!45235) b!264398))

(assert (= (and d!63969 (not c!45235)) b!264399))

(assert (= (and b!264399 c!45236) b!264394))

(assert (= (and b!264399 (not c!45236)) b!264401))

(assert (= (and b!264401 c!45234) b!264393))

(assert (= (and b!264401 (not c!45234)) b!264395))

(assert (= (or b!264393 b!264395) bm!25274))

(assert (= (or b!264394 bm!25274) bm!25275))

(assert (= (or b!264398 bm!25275) bm!25273))

(assert (= (and bm!25273 c!45237) b!264397))

(assert (= (and bm!25273 (not c!45237)) b!264396))

(assert (= (and d!63969 res!129029) b!264402))

(assert (= (and b!264402 res!129030) b!264400))

(declare-fun m!281377 () Bool)

(assert (=> b!264402 m!281377))

(declare-fun m!281379 () Bool)

(assert (=> b!264400 m!281379))

(declare-fun m!281381 () Bool)

(assert (=> b!264397 m!281381))

(declare-fun m!281383 () Bool)

(assert (=> bm!25273 m!281383))

(declare-fun m!281385 () Bool)

(assert (=> d!63969 m!281385))

(assert (=> d!63969 m!281237))

(assert (=> d!63319 d!63969))

(assert (=> d!63343 d!63237))

(declare-fun d!63971 () Bool)

(assert (=> d!63971 (= (apply!262 lt!133445 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)) (get!3100 (getValueByKey!321 (toList!1916 lt!133445) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000))))))

(declare-fun bs!9342 () Bool)

(assert (= bs!9342 d!63971))

(assert (=> bs!9342 m!279611))

(assert (=> bs!9342 m!280669))

(assert (=> bs!9342 m!280669))

(declare-fun m!281387 () Bool)

(assert (=> bs!9342 m!281387))

(assert (=> b!263527 d!63971))

(declare-fun d!63973 () Bool)

(declare-fun c!45238 () Bool)

(assert (=> d!63973 (= c!45238 ((_ is ValueCellFull!2984) (select (arr!5995 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!171301 () V!8521)

(assert (=> d!63973 (= (get!3099 (select (arr!5995 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!171301)))

(declare-fun b!264403 () Bool)

(assert (=> b!264403 (= e!171301 (get!3101 (select (arr!5995 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264404 () Bool)

(assert (=> b!264404 (= e!171301 (get!3102 (select (arr!5995 (array!12670 (store (arr!5995 (_values!4825 thiss!1504)) index!297 (ValueCellFull!2984 v!346)) (size!6346 (_values!4825 thiss!1504)))) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!63973 c!45238) b!264403))

(assert (= (and d!63973 (not c!45238)) b!264404))

(assert (=> b!264403 m!279873))

(assert (=> b!264403 m!279383))

(declare-fun m!281389 () Bool)

(assert (=> b!264403 m!281389))

(assert (=> b!264404 m!279873))

(assert (=> b!264404 m!279383))

(declare-fun m!281391 () Bool)

(assert (=> b!264404 m!281391))

(assert (=> b!263527 d!63973))

(declare-fun d!63975 () Bool)

(assert (=> d!63975 (arrayContainsKey!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) lt!133431 #b00000000000000000000000000000000)))

(declare-fun lt!133836 () Unit!8164)

(assert (=> d!63975 (= lt!133836 (choose!13 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) lt!133431 #b00000000000000000000000000000000))))

(assert (=> d!63975 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!63975 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) lt!133431 #b00000000000000000000000000000000) lt!133836)))

(declare-fun bs!9343 () Bool)

(assert (= bs!9343 d!63975))

(assert (=> bs!9343 m!279825))

(declare-fun m!281393 () Bool)

(assert (=> bs!9343 m!281393))

(assert (=> b!263500 d!63975))

(declare-fun d!63977 () Bool)

(declare-fun res!129031 () Bool)

(declare-fun e!171302 () Bool)

(assert (=> d!63977 (=> res!129031 e!171302)))

(assert (=> d!63977 (= res!129031 (= (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) lt!133431))))

(assert (=> d!63977 (= (arrayContainsKey!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) lt!133431 #b00000000000000000000000000000000) e!171302)))

(declare-fun b!264405 () Bool)

(declare-fun e!171303 () Bool)

(assert (=> b!264405 (= e!171302 e!171303)))

(declare-fun res!129032 () Bool)

(assert (=> b!264405 (=> (not res!129032) (not e!171303))))

(assert (=> b!264405 (= res!129032 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(declare-fun b!264406 () Bool)

(assert (=> b!264406 (= e!171303 (arrayContainsKey!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) lt!133431 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!63977 (not res!129031)) b!264405))

(assert (= (and b!264405 res!129032) b!264406))

(assert (=> d!63977 m!279611))

(declare-fun m!281395 () Bool)

(assert (=> b!264406 m!281395))

(assert (=> b!263500 d!63977))

(declare-fun lt!133839 () SeekEntryResult!1164)

(declare-fun e!171306 () SeekEntryResult!1164)

(declare-fun b!264407 () Bool)

(assert (=> b!264407 (= e!171306 (seekKeyOrZeroReturnVacant!0 (x!25206 lt!133839) (index!6828 lt!133839) (index!6828 lt!133839) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504)))))

(declare-fun lt!133837 () SeekEntryResult!1164)

(declare-fun d!63979 () Bool)

(assert (=> d!63979 (and (or ((_ is Undefined!1164) lt!133837) (not ((_ is Found!1164) lt!133837)) (and (bvsge (index!6827 lt!133837) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133837) (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))) (or ((_ is Undefined!1164) lt!133837) ((_ is Found!1164) lt!133837) (not ((_ is MissingZero!1164) lt!133837)) (and (bvsge (index!6826 lt!133837) #b00000000000000000000000000000000) (bvslt (index!6826 lt!133837) (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))) (or ((_ is Undefined!1164) lt!133837) ((_ is Found!1164) lt!133837) ((_ is MissingZero!1164) lt!133837) (not ((_ is MissingVacant!1164) lt!133837)) (and (bvsge (index!6829 lt!133837) #b00000000000000000000000000000000) (bvslt (index!6829 lt!133837) (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))) (or ((_ is Undefined!1164) lt!133837) (ite ((_ is Found!1164) lt!133837) (= (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (index!6827 lt!133837)) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1164) lt!133837) (= (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (index!6826 lt!133837)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1164) lt!133837) (= (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (index!6829 lt!133837)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!171304 () SeekEntryResult!1164)

(assert (=> d!63979 (= lt!133837 e!171304)))

(declare-fun c!45239 () Bool)

(assert (=> d!63979 (= c!45239 (and ((_ is Intermediate!1164) lt!133839) (undefined!1976 lt!133839)))))

(assert (=> d!63979 (= lt!133839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) (mask!11208 thiss!1504)) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504)))))

(assert (=> d!63979 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63979 (= (seekEntryOrOpen!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (mask!11208 thiss!1504)) lt!133837)))

(declare-fun b!264408 () Bool)

(declare-fun c!45241 () Bool)

(declare-fun lt!133838 () (_ BitVec 64))

(assert (=> b!264408 (= c!45241 (= lt!133838 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171305 () SeekEntryResult!1164)

(assert (=> b!264408 (= e!171305 e!171306)))

(declare-fun b!264409 () Bool)

(assert (=> b!264409 (= e!171304 Undefined!1164)))

(declare-fun b!264410 () Bool)

(assert (=> b!264410 (= e!171306 (MissingZero!1164 (index!6828 lt!133839)))))

(declare-fun b!264411 () Bool)

(assert (=> b!264411 (= e!171304 e!171305)))

(assert (=> b!264411 (= lt!133838 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (index!6828 lt!133839)))))

(declare-fun c!45240 () Bool)

(assert (=> b!264411 (= c!45240 (= lt!133838 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!264412 () Bool)

(assert (=> b!264412 (= e!171305 (Found!1164 (index!6828 lt!133839)))))

(assert (= (and d!63979 c!45239) b!264409))

(assert (= (and d!63979 (not c!45239)) b!264411))

(assert (= (and b!264411 c!45240) b!264412))

(assert (= (and b!264411 (not c!45240)) b!264408))

(assert (= (and b!264408 c!45241) b!264410))

(assert (= (and b!264408 (not c!45241)) b!264407))

(assert (=> b!264407 m!279611))

(declare-fun m!281397 () Bool)

(assert (=> b!264407 m!281397))

(assert (=> d!63979 m!279317))

(assert (=> d!63979 m!279611))

(declare-fun m!281399 () Bool)

(assert (=> d!63979 m!281399))

(declare-fun m!281401 () Bool)

(assert (=> d!63979 m!281401))

(assert (=> d!63979 m!281399))

(assert (=> d!63979 m!279611))

(declare-fun m!281403 () Bool)

(assert (=> d!63979 m!281403))

(declare-fun m!281405 () Bool)

(assert (=> d!63979 m!281405))

(declare-fun m!281407 () Bool)

(assert (=> d!63979 m!281407))

(declare-fun m!281409 () Bool)

(assert (=> b!264411 m!281409))

(assert (=> b!263500 d!63979))

(declare-fun b!264413 () Bool)

(declare-fun e!171307 () (_ BitVec 32))

(assert (=> b!264413 (= e!171307 #b00000000000000000000000000000000)))

(declare-fun b!264414 () Bool)

(declare-fun e!171308 () (_ BitVec 32))

(assert (=> b!264414 (= e!171307 e!171308)))

(declare-fun c!45242 () Bool)

(assert (=> b!264414 (= c!45242 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!63981 () Bool)

(declare-fun lt!133840 () (_ BitVec 32))

(assert (=> d!63981 (and (bvsge lt!133840 #b00000000000000000000000000000000) (bvsle lt!133840 (bvsub (size!6347 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!63981 (= lt!133840 e!171307)))

(declare-fun c!45243 () Bool)

(assert (=> d!63981 (= c!45243 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63981 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6347 (_keys!7034 thiss!1504)) (size!6347 lt!133005)))))

(assert (=> d!63981 (= (arrayCountValidKeys!0 lt!133005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))) lt!133840)))

(declare-fun b!264415 () Bool)

(declare-fun call!25279 () (_ BitVec 32))

(assert (=> b!264415 (= e!171308 call!25279)))

(declare-fun b!264416 () Bool)

(assert (=> b!264416 (= e!171308 (bvadd #b00000000000000000000000000000001 call!25279))))

(declare-fun bm!25276 () Bool)

(assert (=> bm!25276 (= call!25279 (arrayCountValidKeys!0 lt!133005 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (= (and d!63981 c!45243) b!264413))

(assert (= (and d!63981 (not c!45243)) b!264414))

(assert (= (and b!264414 c!45242) b!264416))

(assert (= (and b!264414 (not c!45242)) b!264415))

(assert (= (or b!264416 b!264415) bm!25276))

(assert (=> b!264414 m!280863))

(assert (=> b!264414 m!280863))

(assert (=> b!264414 m!281065))

(declare-fun m!281411 () Bool)

(assert (=> bm!25276 m!281411))

(assert (=> bm!25216 d!63981))

(declare-fun d!63983 () Bool)

(assert (=> d!63983 (isDefined!261 (getValueByKey!321 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297)))))

(declare-fun lt!133841 () Unit!8164)

(assert (=> d!63983 (= lt!133841 (choose!1303 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297)))))

(declare-fun e!171309 () Bool)

(assert (=> d!63983 e!171309))

(declare-fun res!129033 () Bool)

(assert (=> d!63983 (=> (not res!129033) (not e!171309))))

(assert (=> d!63983 (= res!129033 (isStrictlySorted!364 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))))))

(assert (=> d!63983 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297)) lt!133841)))

(declare-fun b!264417 () Bool)

(assert (=> b!264417 (= e!171309 (containsKey!312 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297)))))

(assert (= (and d!63983 res!129033) b!264417))

(assert (=> d!63983 m!279459))

(assert (=> d!63983 m!280219))

(assert (=> d!63983 m!280219))

(assert (=> d!63983 m!280221))

(assert (=> d!63983 m!279459))

(declare-fun m!281413 () Bool)

(assert (=> d!63983 m!281413))

(declare-fun m!281415 () Bool)

(assert (=> d!63983 m!281415))

(assert (=> b!264417 m!279459))

(assert (=> b!264417 m!280215))

(assert (=> b!263709 d!63983))

(assert (=> b!263709 d!63507))

(assert (=> b!263709 d!63509))

(declare-fun b!264418 () Bool)

(declare-fun e!171310 () (_ BitVec 32))

(assert (=> b!264418 (= e!171310 #b00000000000000000000000000000000)))

(declare-fun b!264419 () Bool)

(declare-fun e!171311 () (_ BitVec 32))

(assert (=> b!264419 (= e!171310 e!171311)))

(declare-fun c!45244 () Bool)

(assert (=> b!264419 (= c!45244 (validKeyInArray!0 (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!63985 () Bool)

(declare-fun lt!133842 () (_ BitVec 32))

(assert (=> d!63985 (and (bvsge lt!133842 #b00000000000000000000000000000000) (bvsle lt!133842 (bvsub (size!6347 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!63985 (= lt!133842 e!171310)))

(declare-fun c!45245 () Bool)

(assert (=> d!63985 (= c!45245 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63985 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6347 (_keys!7034 thiss!1504)) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63985 (= (arrayCountValidKeys!0 (_keys!7034 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))) lt!133842)))

(declare-fun b!264420 () Bool)

(declare-fun call!25280 () (_ BitVec 32))

(assert (=> b!264420 (= e!171311 call!25280)))

(declare-fun b!264421 () Bool)

(assert (=> b!264421 (= e!171311 (bvadd #b00000000000000000000000000000001 call!25280))))

(declare-fun bm!25277 () Bool)

(assert (=> bm!25277 (= call!25280 (arrayCountValidKeys!0 (_keys!7034 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (= (and d!63985 c!45245) b!264418))

(assert (= (and d!63985 (not c!45245)) b!264419))

(assert (= (and b!264419 c!45244) b!264421))

(assert (= (and b!264419 (not c!45244)) b!264420))

(assert (= (or b!264421 b!264420) bm!25277))

(declare-fun m!281417 () Bool)

(assert (=> b!264419 m!281417))

(assert (=> b!264419 m!281417))

(declare-fun m!281419 () Bool)

(assert (=> b!264419 m!281419))

(declare-fun m!281421 () Bool)

(assert (=> bm!25277 m!281421))

(assert (=> bm!25234 d!63985))

(declare-fun b!264422 () Bool)

(declare-fun e!171312 () (_ BitVec 32))

(assert (=> b!264422 (= e!171312 #b00000000000000000000000000000000)))

(declare-fun b!264423 () Bool)

(declare-fun e!171313 () (_ BitVec 32))

(assert (=> b!264423 (= e!171312 e!171313)))

(declare-fun c!45246 () Bool)

(assert (=> b!264423 (= c!45246 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!63987 () Bool)

(declare-fun lt!133843 () (_ BitVec 32))

(assert (=> d!63987 (and (bvsge lt!133843 #b00000000000000000000000000000000) (bvsle lt!133843 (bvsub (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!63987 (= lt!133843 e!171312)))

(declare-fun c!45247 () Bool)

(assert (=> d!63987 (= c!45247 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (=> d!63987 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6347 (_keys!7034 thiss!1504)) (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(assert (=> d!63987 (= (arrayCountValidKeys!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))) lt!133843)))

(declare-fun b!264424 () Bool)

(declare-fun call!25281 () (_ BitVec 32))

(assert (=> b!264424 (= e!171313 call!25281)))

(declare-fun b!264425 () Bool)

(assert (=> b!264425 (= e!171313 (bvadd #b00000000000000000000000000000001 call!25281))))

(declare-fun bm!25278 () Bool)

(assert (=> bm!25278 (= call!25281 (arrayCountValidKeys!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(assert (= (and d!63987 c!45247) b!264422))

(assert (= (and d!63987 (not c!45247)) b!264423))

(assert (= (and b!264423 c!45246) b!264425))

(assert (= (and b!264423 (not c!45246)) b!264424))

(assert (= (or b!264425 b!264424) bm!25278))

(assert (=> b!264423 m!281245))

(assert (=> b!264423 m!281245))

(assert (=> b!264423 m!281247))

(declare-fun m!281423 () Bool)

(assert (=> bm!25278 m!281423))

(assert (=> bm!25187 d!63987))

(assert (=> d!63337 d!63227))

(assert (=> d!63337 d!63199))

(declare-fun d!63989 () Bool)

(declare-fun e!171314 () Bool)

(assert (=> d!63989 e!171314))

(declare-fun res!129034 () Bool)

(assert (=> d!63989 (=> res!129034 e!171314)))

(declare-fun lt!133845 () Bool)

(assert (=> d!63989 (= res!129034 (not lt!133845))))

(declare-fun lt!133847 () Bool)

(assert (=> d!63989 (= lt!133845 lt!133847)))

(declare-fun lt!133846 () Unit!8164)

(declare-fun e!171315 () Unit!8164)

(assert (=> d!63989 (= lt!133846 e!171315)))

(declare-fun c!45248 () Bool)

(assert (=> d!63989 (= c!45248 lt!133847)))

(assert (=> d!63989 (= lt!133847 (containsKey!312 (toList!1916 lt!133532) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(assert (=> d!63989 (= (contains!1885 lt!133532 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) lt!133845)))

(declare-fun b!264426 () Bool)

(declare-fun lt!133844 () Unit!8164)

(assert (=> b!264426 (= e!171315 lt!133844)))

(assert (=> b!264426 (= lt!133844 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133532) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(assert (=> b!264426 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133532) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(declare-fun b!264427 () Bool)

(declare-fun Unit!8220 () Unit!8164)

(assert (=> b!264427 (= e!171315 Unit!8220)))

(declare-fun b!264428 () Bool)

(assert (=> b!264428 (= e!171314 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133532) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63989 c!45248) b!264426))

(assert (= (and d!63989 (not c!45248)) b!264427))

(assert (= (and d!63989 (not res!129034)) b!264428))

(declare-fun m!281425 () Bool)

(assert (=> d!63989 m!281425))

(declare-fun m!281427 () Bool)

(assert (=> b!264426 m!281427))

(assert (=> b!264426 m!280149))

(assert (=> b!264426 m!280149))

(declare-fun m!281429 () Bool)

(assert (=> b!264426 m!281429))

(assert (=> b!264428 m!280149))

(assert (=> b!264428 m!280149))

(assert (=> b!264428 m!281429))

(assert (=> d!63401 d!63989))

(declare-fun b!264432 () Bool)

(declare-fun e!171317 () Option!327)

(assert (=> b!264432 (= e!171317 None!325)))

(declare-fun b!264430 () Bool)

(declare-fun e!171316 () Option!327)

(assert (=> b!264430 (= e!171316 e!171317)))

(declare-fun c!45250 () Bool)

(assert (=> b!264430 (= c!45250 (and ((_ is Cons!3759) lt!133533) (not (= (_1!2454 (h!4425 lt!133533)) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264431 () Bool)

(assert (=> b!264431 (= e!171317 (getValueByKey!321 (t!8832 lt!133533) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(declare-fun c!45249 () Bool)

(declare-fun d!63991 () Bool)

(assert (=> d!63991 (= c!45249 (and ((_ is Cons!3759) lt!133533) (= (_1!2454 (h!4425 lt!133533)) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))))

(assert (=> d!63991 (= (getValueByKey!321 lt!133533 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) e!171316)))

(declare-fun b!264429 () Bool)

(assert (=> b!264429 (= e!171316 (Some!326 (_2!2454 (h!4425 lt!133533))))))

(assert (= (and d!63991 c!45249) b!264429))

(assert (= (and d!63991 (not c!45249)) b!264430))

(assert (= (and b!264430 c!45250) b!264431))

(assert (= (and b!264430 (not c!45250)) b!264432))

(declare-fun m!281431 () Bool)

(assert (=> b!264431 m!281431))

(assert (=> d!63401 d!63991))

(declare-fun d!63993 () Bool)

(assert (=> d!63993 (= (getValueByKey!321 lt!133533 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133848 () Unit!8164)

(assert (=> d!63993 (= lt!133848 (choose!1302 lt!133533 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(declare-fun e!171318 () Bool)

(assert (=> d!63993 e!171318))

(declare-fun res!129035 () Bool)

(assert (=> d!63993 (=> (not res!129035) (not e!171318))))

(assert (=> d!63993 (= res!129035 (isStrictlySorted!364 lt!133533))))

(assert (=> d!63993 (= (lemmaContainsTupThenGetReturnValue!177 lt!133533 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) lt!133848)))

(declare-fun b!264433 () Bool)

(declare-fun res!129036 () Bool)

(assert (=> b!264433 (=> (not res!129036) (not e!171318))))

(assert (=> b!264433 (= res!129036 (containsKey!312 lt!133533 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(declare-fun b!264434 () Bool)

(assert (=> b!264434 (= e!171318 (contains!1888 lt!133533 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))))

(assert (= (and d!63993 res!129035) b!264433))

(assert (= (and b!264433 res!129036) b!264434))

(assert (=> d!63993 m!280143))

(declare-fun m!281433 () Bool)

(assert (=> d!63993 m!281433))

(declare-fun m!281435 () Bool)

(assert (=> d!63993 m!281435))

(declare-fun m!281437 () Bool)

(assert (=> b!264433 m!281437))

(declare-fun m!281439 () Bool)

(assert (=> b!264434 m!281439))

(assert (=> d!63401 d!63993))

(declare-fun b!264435 () Bool)

(declare-fun e!171321 () List!3763)

(declare-fun call!25284 () List!3763)

(assert (=> b!264435 (= e!171321 call!25284)))

(declare-fun b!264436 () Bool)

(declare-fun e!171323 () List!3763)

(declare-fun call!25282 () List!3763)

(assert (=> b!264436 (= e!171323 call!25282)))

(declare-fun b!264437 () Bool)

(assert (=> b!264437 (= e!171321 call!25284)))

(declare-fun c!45252 () Bool)

(declare-fun call!25283 () List!3763)

(declare-fun e!171319 () List!3763)

(declare-fun bm!25279 () Bool)

(assert (=> bm!25279 (= call!25283 ($colon$colon!107 e!171319 (ite c!45252 (h!4425 (toList!1916 lt!133249)) (tuple2!4887 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45254 () Bool)

(assert (=> bm!25279 (= c!45254 c!45252)))

(declare-fun b!264438 () Bool)

(declare-fun c!45253 () Bool)

(declare-fun c!45251 () Bool)

(assert (=> b!264438 (= e!171319 (ite c!45253 (t!8832 (toList!1916 lt!133249)) (ite c!45251 (Cons!3759 (h!4425 (toList!1916 lt!133249)) (t!8832 (toList!1916 lt!133249))) Nil!3760)))))

(declare-fun b!264439 () Bool)

(assert (=> b!264439 (= e!171319 (insertStrictlySorted!180 (t!8832 (toList!1916 lt!133249)) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(declare-fun bm!25280 () Bool)

(assert (=> bm!25280 (= call!25284 call!25282)))

(declare-fun d!63995 () Bool)

(declare-fun e!171322 () Bool)

(assert (=> d!63995 e!171322))

(declare-fun res!129037 () Bool)

(assert (=> d!63995 (=> (not res!129037) (not e!171322))))

(declare-fun lt!133849 () List!3763)

(assert (=> d!63995 (= res!129037 (isStrictlySorted!364 lt!133849))))

(declare-fun e!171320 () List!3763)

(assert (=> d!63995 (= lt!133849 e!171320)))

(assert (=> d!63995 (= c!45252 (and ((_ is Cons!3759) (toList!1916 lt!133249)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133249))) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))))

(assert (=> d!63995 (isStrictlySorted!364 (toList!1916 lt!133249))))

(assert (=> d!63995 (= (insertStrictlySorted!180 (toList!1916 lt!133249) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) lt!133849)))

(declare-fun b!264440 () Bool)

(assert (=> b!264440 (= e!171320 call!25283)))

(declare-fun bm!25281 () Bool)

(assert (=> bm!25281 (= call!25282 call!25283)))

(declare-fun b!264441 () Bool)

(assert (=> b!264441 (= e!171320 e!171323)))

(assert (=> b!264441 (= c!45253 (and ((_ is Cons!3759) (toList!1916 lt!133249)) (= (_1!2454 (h!4425 (toList!1916 lt!133249))) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))))

(declare-fun b!264442 () Bool)

(assert (=> b!264442 (= e!171322 (contains!1888 lt!133849 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))))

(declare-fun b!264443 () Bool)

(assert (=> b!264443 (= c!45251 (and ((_ is Cons!3759) (toList!1916 lt!133249)) (bvsgt (_1!2454 (h!4425 (toList!1916 lt!133249))) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))))

(assert (=> b!264443 (= e!171323 e!171321)))

(declare-fun b!264444 () Bool)

(declare-fun res!129038 () Bool)

(assert (=> b!264444 (=> (not res!129038) (not e!171322))))

(assert (=> b!264444 (= res!129038 (containsKey!312 lt!133849 (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(assert (= (and d!63995 c!45252) b!264440))

(assert (= (and d!63995 (not c!45252)) b!264441))

(assert (= (and b!264441 c!45253) b!264436))

(assert (= (and b!264441 (not c!45253)) b!264443))

(assert (= (and b!264443 c!45251) b!264435))

(assert (= (and b!264443 (not c!45251)) b!264437))

(assert (= (or b!264435 b!264437) bm!25280))

(assert (= (or b!264436 bm!25280) bm!25281))

(assert (= (or b!264440 bm!25281) bm!25279))

(assert (= (and bm!25279 c!45254) b!264439))

(assert (= (and bm!25279 (not c!45254)) b!264438))

(assert (= (and d!63995 res!129037) b!264444))

(assert (= (and b!264444 res!129038) b!264442))

(declare-fun m!281441 () Bool)

(assert (=> b!264444 m!281441))

(declare-fun m!281443 () Bool)

(assert (=> b!264442 m!281443))

(declare-fun m!281445 () Bool)

(assert (=> b!264439 m!281445))

(declare-fun m!281447 () Bool)

(assert (=> bm!25279 m!281447))

(declare-fun m!281449 () Bool)

(assert (=> d!63995 m!281449))

(declare-fun m!281451 () Bool)

(assert (=> d!63995 m!281451))

(assert (=> d!63401 d!63995))

(declare-fun b!264445 () Bool)

(declare-fun e!171325 () SeekEntryResult!1164)

(assert (=> b!264445 (= e!171325 (Found!1164 (nextIndex!0 (index!6828 lt!133190) (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001) (mask!11208 thiss!1504))))))

(declare-fun b!264446 () Bool)

(declare-fun e!171326 () SeekEntryResult!1164)

(assert (=> b!264446 (= e!171326 e!171325)))

(declare-fun c!45257 () Bool)

(declare-fun lt!133851 () (_ BitVec 64))

(assert (=> b!264446 (= c!45257 (= lt!133851 key!932))))

(declare-fun b!264447 () Bool)

(assert (=> b!264447 (= e!171326 Undefined!1164)))

(declare-fun e!171324 () SeekEntryResult!1164)

(declare-fun b!264448 () Bool)

(assert (=> b!264448 (= e!171324 (seekKeyOrZeroReturnVacant!0 (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (index!6828 lt!133190) (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001) (mask!11208 thiss!1504)) (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (mask!11208 thiss!1504)) (index!6828 lt!133190) key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)))))

(declare-fun lt!133850 () SeekEntryResult!1164)

(declare-fun d!63997 () Bool)

(assert (=> d!63997 (and (or ((_ is Undefined!1164) lt!133850) (not ((_ is Found!1164) lt!133850)) (and (bvsge (index!6827 lt!133850) #b00000000000000000000000000000000) (bvslt (index!6827 lt!133850) (size!6347 (_keys!7034 thiss!1504))))) (or ((_ is Undefined!1164) lt!133850) ((_ is Found!1164) lt!133850) (not ((_ is MissingVacant!1164) lt!133850)) (not (= (index!6829 lt!133850) (index!6828 lt!133190))) (and (bvsge (index!6829 lt!133850) #b00000000000000000000000000000000) (bvslt (index!6829 lt!133850) (size!6347 (_keys!7034 thiss!1504))))) (or ((_ is Undefined!1164) lt!133850) (ite ((_ is Found!1164) lt!133850) (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6827 lt!133850)) key!932) (and ((_ is MissingVacant!1164) lt!133850) (= (index!6829 lt!133850) (index!6828 lt!133190)) (= (select (arr!5996 (_keys!7034 thiss!1504)) (index!6829 lt!133850)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!63997 (= lt!133850 e!171326)))

(declare-fun c!45256 () Bool)

(assert (=> d!63997 (= c!45256 (bvsge (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!63997 (= lt!133851 (select (arr!5996 (_keys!7034 thiss!1504)) (nextIndex!0 (index!6828 lt!133190) (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001) (mask!11208 thiss!1504))))))

(assert (=> d!63997 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63997 (= (seekKeyOrZeroReturnVacant!0 (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001) (nextIndex!0 (index!6828 lt!133190) (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001) (mask!11208 thiss!1504)) (index!6828 lt!133190) key!932 (_keys!7034 thiss!1504) (mask!11208 thiss!1504)) lt!133850)))

(declare-fun b!264449 () Bool)

(assert (=> b!264449 (= e!171324 (MissingVacant!1164 (index!6828 lt!133190)))))

(declare-fun b!264450 () Bool)

(declare-fun c!45255 () Bool)

(assert (=> b!264450 (= c!45255 (= lt!133851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264450 (= e!171325 e!171324)))

(assert (= (and d!63997 c!45256) b!264447))

(assert (= (and d!63997 (not c!45256)) b!264446))

(assert (= (and b!264446 c!45257) b!264445))

(assert (= (and b!264446 (not c!45257)) b!264450))

(assert (= (and b!264450 c!45255) b!264449))

(assert (= (and b!264450 (not c!45255)) b!264448))

(assert (=> b!264448 m!279961))

(declare-fun m!281453 () Bool)

(assert (=> b!264448 m!281453))

(assert (=> b!264448 m!281453))

(declare-fun m!281455 () Bool)

(assert (=> b!264448 m!281455))

(declare-fun m!281457 () Bool)

(assert (=> d!63997 m!281457))

(declare-fun m!281459 () Bool)

(assert (=> d!63997 m!281459))

(assert (=> d!63997 m!279961))

(declare-fun m!281461 () Bool)

(assert (=> d!63997 m!281461))

(assert (=> d!63997 m!279317))

(assert (=> b!263577 d!63997))

(declare-fun d!63999 () Bool)

(declare-fun lt!133852 () (_ BitVec 32))

(assert (=> d!63999 (and (bvsge lt!133852 #b00000000000000000000000000000000) (bvslt lt!133852 (bvadd (mask!11208 thiss!1504) #b00000000000000000000000000000001)))))

(assert (=> d!63999 (= lt!133852 (choose!52 (index!6828 lt!133190) (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001) (mask!11208 thiss!1504)))))

(assert (=> d!63999 (validMask!0 (mask!11208 thiss!1504))))

(assert (=> d!63999 (= (nextIndex!0 (index!6828 lt!133190) (bvadd (x!25206 lt!133190) #b00000000000000000000000000000001) (mask!11208 thiss!1504)) lt!133852)))

(declare-fun bs!9344 () Bool)

(assert (= bs!9344 d!63999))

(declare-fun m!281463 () Bool)

(assert (=> bs!9344 m!281463))

(assert (=> bs!9344 m!279317))

(assert (=> b!263577 d!63999))

(assert (=> d!63297 d!63703))

(assert (=> b!263658 d!63451))

(declare-fun d!64001 () Bool)

(declare-fun e!171327 () Bool)

(assert (=> d!64001 e!171327))

(declare-fun res!129039 () Bool)

(assert (=> d!64001 (=> res!129039 e!171327)))

(declare-fun lt!133854 () Bool)

(assert (=> d!64001 (= res!129039 (not lt!133854))))

(declare-fun lt!133856 () Bool)

(assert (=> d!64001 (= lt!133854 lt!133856)))

(declare-fun lt!133855 () Unit!8164)

(declare-fun e!171328 () Unit!8164)

(assert (=> d!64001 (= lt!133855 e!171328)))

(declare-fun c!45258 () Bool)

(assert (=> d!64001 (= c!45258 lt!133856)))

(assert (=> d!64001 (= lt!133856 (containsKey!312 (toList!1916 lt!133511) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(assert (=> d!64001 (= (contains!1885 lt!133511 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133854)))

(declare-fun b!264451 () Bool)

(declare-fun lt!133853 () Unit!8164)

(assert (=> b!264451 (= e!171328 lt!133853)))

(assert (=> b!264451 (= lt!133853 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133511) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(assert (=> b!264451 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133511) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264452 () Bool)

(declare-fun Unit!8221 () Unit!8164)

(assert (=> b!264452 (= e!171328 Unit!8221)))

(declare-fun b!264453 () Bool)

(assert (=> b!264453 (= e!171327 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133511) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!64001 c!45258) b!264451))

(assert (= (and d!64001 (not c!45258)) b!264452))

(assert (= (and d!64001 (not res!129039)) b!264453))

(declare-fun m!281465 () Bool)

(assert (=> d!64001 m!281465))

(declare-fun m!281467 () Bool)

(assert (=> b!264451 m!281467))

(assert (=> b!264451 m!280065))

(assert (=> b!264451 m!280065))

(declare-fun m!281469 () Bool)

(assert (=> b!264451 m!281469))

(assert (=> b!264453 m!280065))

(assert (=> b!264453 m!280065))

(assert (=> b!264453 m!281469))

(assert (=> d!63377 d!64001))

(declare-fun b!264457 () Bool)

(declare-fun e!171330 () Option!327)

(assert (=> b!264457 (= e!171330 None!325)))

(declare-fun b!264455 () Bool)

(declare-fun e!171329 () Option!327)

(assert (=> b!264455 (= e!171329 e!171330)))

(declare-fun c!45260 () Bool)

(assert (=> b!264455 (= c!45260 (and ((_ is Cons!3759) lt!133512) (not (= (_1!2454 (h!4425 lt!133512)) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!264456 () Bool)

(assert (=> b!264456 (= e!171330 (getValueByKey!321 (t!8832 lt!133512) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(declare-fun d!64003 () Bool)

(declare-fun c!45259 () Bool)

(assert (=> d!64003 (= c!45259 (and ((_ is Cons!3759) lt!133512) (= (_1!2454 (h!4425 lt!133512)) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!64003 (= (getValueByKey!321 lt!133512 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) e!171329)))

(declare-fun b!264454 () Bool)

(assert (=> b!264454 (= e!171329 (Some!326 (_2!2454 (h!4425 lt!133512))))))

(assert (= (and d!64003 c!45259) b!264454))

(assert (= (and d!64003 (not c!45259)) b!264455))

(assert (= (and b!264455 c!45260) b!264456))

(assert (= (and b!264455 (not c!45260)) b!264457))

(declare-fun m!281471 () Bool)

(assert (=> b!264456 m!281471))

(assert (=> d!63377 d!64003))

(declare-fun d!64005 () Bool)

(assert (=> d!64005 (= (getValueByKey!321 lt!133512 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(declare-fun lt!133857 () Unit!8164)

(assert (=> d!64005 (= lt!133857 (choose!1302 lt!133512 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(declare-fun e!171331 () Bool)

(assert (=> d!64005 e!171331))

(declare-fun res!129040 () Bool)

(assert (=> d!64005 (=> (not res!129040) (not e!171331))))

(assert (=> d!64005 (= res!129040 (isStrictlySorted!364 lt!133512))))

(assert (=> d!64005 (= (lemmaContainsTupThenGetReturnValue!177 lt!133512 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133857)))

(declare-fun b!264458 () Bool)

(declare-fun res!129041 () Bool)

(assert (=> b!264458 (=> (not res!129041) (not e!171331))))

(assert (=> b!264458 (= res!129041 (containsKey!312 lt!133512 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(declare-fun b!264459 () Bool)

(assert (=> b!264459 (= e!171331 (contains!1888 lt!133512 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))

(assert (= (and d!64005 res!129040) b!264458))

(assert (= (and b!264458 res!129041) b!264459))

(assert (=> d!64005 m!280059))

(declare-fun m!281473 () Bool)

(assert (=> d!64005 m!281473))

(declare-fun m!281475 () Bool)

(assert (=> d!64005 m!281475))

(declare-fun m!281477 () Bool)

(assert (=> b!264458 m!281477))

(declare-fun m!281479 () Bool)

(assert (=> b!264459 m!281479))

(assert (=> d!63377 d!64005))

(declare-fun b!264460 () Bool)

(declare-fun e!171334 () List!3763)

(declare-fun call!25287 () List!3763)

(assert (=> b!264460 (= e!171334 call!25287)))

(declare-fun b!264461 () Bool)

(declare-fun e!171336 () List!3763)

(declare-fun call!25285 () List!3763)

(assert (=> b!264461 (= e!171336 call!25285)))

(declare-fun b!264462 () Bool)

(assert (=> b!264462 (= e!171334 call!25287)))

(declare-fun bm!25282 () Bool)

(declare-fun e!171332 () List!3763)

(declare-fun call!25286 () List!3763)

(declare-fun c!45262 () Bool)

(assert (=> bm!25282 (= call!25286 ($colon$colon!107 e!171332 (ite c!45262 (h!4425 (toList!1916 lt!133253)) (tuple2!4887 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))))

(declare-fun c!45264 () Bool)

(assert (=> bm!25282 (= c!45264 c!45262)))

(declare-fun c!45263 () Bool)

(declare-fun c!45261 () Bool)

(declare-fun b!264463 () Bool)

(assert (=> b!264463 (= e!171332 (ite c!45263 (t!8832 (toList!1916 lt!133253)) (ite c!45261 (Cons!3759 (h!4425 (toList!1916 lt!133253)) (t!8832 (toList!1916 lt!133253))) Nil!3760)))))

(declare-fun b!264464 () Bool)

(assert (=> b!264464 (= e!171332 (insertStrictlySorted!180 (t!8832 (toList!1916 lt!133253)) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(declare-fun bm!25283 () Bool)

(assert (=> bm!25283 (= call!25287 call!25285)))

(declare-fun d!64007 () Bool)

(declare-fun e!171335 () Bool)

(assert (=> d!64007 e!171335))

(declare-fun res!129042 () Bool)

(assert (=> d!64007 (=> (not res!129042) (not e!171335))))

(declare-fun lt!133858 () List!3763)

(assert (=> d!64007 (= res!129042 (isStrictlySorted!364 lt!133858))))

(declare-fun e!171333 () List!3763)

(assert (=> d!64007 (= lt!133858 e!171333)))

(assert (=> d!64007 (= c!45262 (and ((_ is Cons!3759) (toList!1916 lt!133253)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133253))) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!64007 (isStrictlySorted!364 (toList!1916 lt!133253))))

(assert (=> d!64007 (= (insertStrictlySorted!180 (toList!1916 lt!133253) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) lt!133858)))

(declare-fun b!264465 () Bool)

(assert (=> b!264465 (= e!171333 call!25286)))

(declare-fun bm!25284 () Bool)

(assert (=> bm!25284 (= call!25285 call!25286)))

(declare-fun b!264466 () Bool)

(assert (=> b!264466 (= e!171333 e!171336)))

(assert (=> b!264466 (= c!45263 (and ((_ is Cons!3759) (toList!1916 lt!133253)) (= (_1!2454 (h!4425 (toList!1916 lt!133253))) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!264467 () Bool)

(assert (=> b!264467 (= e!171335 (contains!1888 lt!133858 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))

(declare-fun b!264468 () Bool)

(assert (=> b!264468 (= c!45261 (and ((_ is Cons!3759) (toList!1916 lt!133253)) (bvsgt (_1!2454 (h!4425 (toList!1916 lt!133253))) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))

(assert (=> b!264468 (= e!171336 e!171334)))

(declare-fun b!264469 () Bool)

(declare-fun res!129043 () Bool)

(assert (=> b!264469 (=> (not res!129043) (not e!171335))))

(assert (=> b!264469 (= res!129043 (containsKey!312 lt!133858 (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(assert (= (and d!64007 c!45262) b!264465))

(assert (= (and d!64007 (not c!45262)) b!264466))

(assert (= (and b!264466 c!45263) b!264461))

(assert (= (and b!264466 (not c!45263)) b!264468))

(assert (= (and b!264468 c!45261) b!264460))

(assert (= (and b!264468 (not c!45261)) b!264462))

(assert (= (or b!264460 b!264462) bm!25283))

(assert (= (or b!264461 bm!25283) bm!25284))

(assert (= (or b!264465 bm!25284) bm!25282))

(assert (= (and bm!25282 c!45264) b!264464))

(assert (= (and bm!25282 (not c!45264)) b!264463))

(assert (= (and d!64007 res!129042) b!264469))

(assert (= (and b!264469 res!129043) b!264467))

(declare-fun m!281481 () Bool)

(assert (=> b!264469 m!281481))

(declare-fun m!281483 () Bool)

(assert (=> b!264467 m!281483))

(declare-fun m!281485 () Bool)

(assert (=> b!264464 m!281485))

(declare-fun m!281487 () Bool)

(assert (=> bm!25282 m!281487))

(declare-fun m!281489 () Bool)

(assert (=> d!64007 m!281489))

(declare-fun m!281491 () Bool)

(assert (=> d!64007 m!281491))

(assert (=> d!63377 d!64007))

(declare-fun d!64009 () Bool)

(declare-fun e!171337 () Bool)

(assert (=> d!64009 e!171337))

(declare-fun res!129044 () Bool)

(assert (=> d!64009 (=> res!129044 e!171337)))

(declare-fun lt!133860 () Bool)

(assert (=> d!64009 (= res!129044 (not lt!133860))))

(declare-fun lt!133862 () Bool)

(assert (=> d!64009 (= lt!133860 lt!133862)))

(declare-fun lt!133861 () Unit!8164)

(declare-fun e!171338 () Unit!8164)

(assert (=> d!64009 (= lt!133861 e!171338)))

(declare-fun c!45265 () Bool)

(assert (=> d!64009 (= c!45265 lt!133862)))

(assert (=> d!64009 (= lt!133862 (containsKey!312 (toList!1916 lt!133559) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!64009 (= (contains!1885 lt!133559 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133860)))

(declare-fun b!264470 () Bool)

(declare-fun lt!133859 () Unit!8164)

(assert (=> b!264470 (= e!171338 lt!133859)))

(assert (=> b!264470 (= lt!133859 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133559) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264470 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133559) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264471 () Bool)

(declare-fun Unit!8222 () Unit!8164)

(assert (=> b!264471 (= e!171338 Unit!8222)))

(declare-fun b!264472 () Bool)

(assert (=> b!264472 (= e!171337 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133559) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!64009 c!45265) b!264470))

(assert (= (and d!64009 (not c!45265)) b!264471))

(assert (= (and d!64009 (not res!129044)) b!264472))

(declare-fun m!281493 () Bool)

(assert (=> d!64009 m!281493))

(declare-fun m!281495 () Bool)

(assert (=> b!264470 m!281495))

(assert (=> b!264470 m!281159))

(assert (=> b!264470 m!281159))

(declare-fun m!281497 () Bool)

(assert (=> b!264470 m!281497))

(assert (=> b!264472 m!281159))

(assert (=> b!264472 m!281159))

(assert (=> b!264472 m!281497))

(assert (=> bm!25229 d!64009))

(declare-fun d!64011 () Bool)

(assert (=> d!64011 (= ($colon$colon!107 e!170808 (ite c!44991 (h!4425 (toList!1916 lt!133013)) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017)))) (Cons!3759 (ite c!44991 (h!4425 (toList!1916 lt!133013)) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))) e!170808))))

(assert (=> bm!25212 d!64011))

(declare-fun d!64013 () Bool)

(declare-fun e!171339 () Bool)

(assert (=> d!64013 e!171339))

(declare-fun res!129045 () Bool)

(assert (=> d!64013 (=> res!129045 e!171339)))

(declare-fun lt!133864 () Bool)

(assert (=> d!64013 (= res!129045 (not lt!133864))))

(declare-fun lt!133866 () Bool)

(assert (=> d!64013 (= lt!133864 lt!133866)))

(declare-fun lt!133865 () Unit!8164)

(declare-fun e!171340 () Unit!8164)

(assert (=> d!64013 (= lt!133865 e!171340)))

(declare-fun c!45266 () Bool)

(assert (=> d!64013 (= c!45266 lt!133866)))

(assert (=> d!64013 (= lt!133866 (containsKey!312 (toList!1916 lt!133414) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> d!64013 (= (contains!1885 lt!133414 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133864)))

(declare-fun b!264473 () Bool)

(declare-fun lt!133863 () Unit!8164)

(assert (=> b!264473 (= e!171340 lt!133863)))

(assert (=> b!264473 (= lt!133863 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133414) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (=> b!264473 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133414) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264474 () Bool)

(declare-fun Unit!8223 () Unit!8164)

(assert (=> b!264474 (= e!171340 Unit!8223)))

(declare-fun b!264475 () Bool)

(assert (=> b!264475 (= e!171339 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133414) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (= (and d!64013 c!45266) b!264473))

(assert (= (and d!64013 (not c!45266)) b!264474))

(assert (= (and d!64013 (not res!129045)) b!264475))

(declare-fun m!281499 () Bool)

(assert (=> d!64013 m!281499))

(declare-fun m!281501 () Bool)

(assert (=> b!264473 m!281501))

(assert (=> b!264473 m!279777))

(assert (=> b!264473 m!279777))

(declare-fun m!281503 () Bool)

(assert (=> b!264473 m!281503))

(assert (=> b!264475 m!279777))

(assert (=> b!264475 m!279777))

(assert (=> b!264475 m!281503))

(assert (=> d!63279 d!64013))

(declare-fun b!264479 () Bool)

(declare-fun e!171342 () Option!327)

(assert (=> b!264479 (= e!171342 None!325)))

(declare-fun b!264477 () Bool)

(declare-fun e!171341 () Option!327)

(assert (=> b!264477 (= e!171341 e!171342)))

(declare-fun c!45268 () Bool)

(assert (=> b!264477 (= c!45268 (and ((_ is Cons!3759) lt!133415) (not (= (_1!2454 (h!4425 lt!133415)) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun b!264478 () Bool)

(assert (=> b!264478 (= e!171342 (getValueByKey!321 (t!8832 lt!133415) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun d!64015 () Bool)

(declare-fun c!45267 () Bool)

(assert (=> d!64015 (= c!45267 (and ((_ is Cons!3759) lt!133415) (= (_1!2454 (h!4425 lt!133415)) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!64015 (= (getValueByKey!321 lt!133415 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) e!171341)))

(declare-fun b!264476 () Bool)

(assert (=> b!264476 (= e!171341 (Some!326 (_2!2454 (h!4425 lt!133415))))))

(assert (= (and d!64015 c!45267) b!264476))

(assert (= (and d!64015 (not c!45267)) b!264477))

(assert (= (and b!264477 c!45268) b!264478))

(assert (= (and b!264477 (not c!45268)) b!264479))

(declare-fun m!281505 () Bool)

(assert (=> b!264478 m!281505))

(assert (=> d!63279 d!64015))

(declare-fun d!64017 () Bool)

(assert (=> d!64017 (= (getValueByKey!321 lt!133415 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) (Some!326 (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun lt!133867 () Unit!8164)

(assert (=> d!64017 (= lt!133867 (choose!1302 lt!133415 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun e!171343 () Bool)

(assert (=> d!64017 e!171343))

(declare-fun res!129046 () Bool)

(assert (=> d!64017 (=> (not res!129046) (not e!171343))))

(assert (=> d!64017 (= res!129046 (isStrictlySorted!364 lt!133415))))

(assert (=> d!64017 (= (lemmaContainsTupThenGetReturnValue!177 lt!133415 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133867)))

(declare-fun b!264480 () Bool)

(declare-fun res!129047 () Bool)

(assert (=> b!264480 (=> (not res!129047) (not e!171343))))

(assert (=> b!264480 (= res!129047 (containsKey!312 lt!133415 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun b!264481 () Bool)

(assert (=> b!264481 (= e!171343 (contains!1888 lt!133415 (tuple2!4887 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (= (and d!64017 res!129046) b!264480))

(assert (= (and b!264480 res!129047) b!264481))

(assert (=> d!64017 m!279771))

(declare-fun m!281507 () Bool)

(assert (=> d!64017 m!281507))

(declare-fun m!281509 () Bool)

(assert (=> d!64017 m!281509))

(declare-fun m!281511 () Bool)

(assert (=> b!264480 m!281511))

(declare-fun m!281513 () Bool)

(assert (=> b!264481 m!281513))

(assert (=> d!63279 d!64017))

(declare-fun b!264482 () Bool)

(declare-fun e!171346 () List!3763)

(declare-fun call!25290 () List!3763)

(assert (=> b!264482 (= e!171346 call!25290)))

(declare-fun b!264483 () Bool)

(declare-fun e!171348 () List!3763)

(declare-fun call!25288 () List!3763)

(assert (=> b!264483 (= e!171348 call!25288)))

(declare-fun b!264484 () Bool)

(assert (=> b!264484 (= e!171346 call!25290)))

(declare-fun bm!25285 () Bool)

(declare-fun call!25289 () List!3763)

(declare-fun c!45270 () Bool)

(declare-fun e!171344 () List!3763)

(assert (=> bm!25285 (= call!25289 ($colon$colon!107 e!171344 (ite c!45270 (h!4425 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166)))) (tuple2!4887 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun c!45272 () Bool)

(assert (=> bm!25285 (= c!45272 c!45270)))

(declare-fun c!45271 () Bool)

(declare-fun c!45269 () Bool)

(declare-fun b!264485 () Bool)

(assert (=> b!264485 (= e!171344 (ite c!45271 (t!8832 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166)))) (ite c!45269 (Cons!3759 (h!4425 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166)))) (t!8832 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166))))) Nil!3760)))))

(declare-fun b!264486 () Bool)

(assert (=> b!264486 (= e!171344 (insertStrictlySorted!180 (t!8832 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166)))) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun bm!25286 () Bool)

(assert (=> bm!25286 (= call!25290 call!25288)))

(declare-fun d!64019 () Bool)

(declare-fun e!171347 () Bool)

(assert (=> d!64019 e!171347))

(declare-fun res!129048 () Bool)

(assert (=> d!64019 (=> (not res!129048) (not e!171347))))

(declare-fun lt!133868 () List!3763)

(assert (=> d!64019 (= res!129048 (isStrictlySorted!364 lt!133868))))

(declare-fun e!171345 () List!3763)

(assert (=> d!64019 (= lt!133868 e!171345)))

(assert (=> d!64019 (= c!45270 (and ((_ is Cons!3759) (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166)))) (bvslt (_1!2454 (h!4425 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166))))) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!64019 (isStrictlySorted!364 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166))))))

(assert (=> d!64019 (= (insertStrictlySorted!180 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166))) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) lt!133868)))

(declare-fun b!264487 () Bool)

(assert (=> b!264487 (= e!171345 call!25289)))

(declare-fun bm!25287 () Bool)

(assert (=> bm!25287 (= call!25288 call!25289)))

(declare-fun b!264488 () Bool)

(assert (=> b!264488 (= e!171345 e!171348)))

(assert (=> b!264488 (= c!45271 (and ((_ is Cons!3759) (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166)))) (= (_1!2454 (h!4425 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166))))) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264489 () Bool)

(assert (=> b!264489 (= e!171347 (contains!1888 lt!133868 (tuple2!4887 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))) (_2!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264490 () Bool)

(assert (=> b!264490 (= c!45269 (and ((_ is Cons!3759) (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166)))) (bvsgt (_1!2454 (h!4425 (toList!1916 (ite c!44882 call!25165 (ite c!44885 call!25163 call!25166))))) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> b!264490 (= e!171348 e!171346)))

(declare-fun b!264491 () Bool)

(declare-fun res!129049 () Bool)

(assert (=> b!264491 (=> (not res!129049) (not e!171347))))

(assert (=> b!264491 (= res!129049 (containsKey!312 lt!133868 (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(assert (= (and d!64019 c!45270) b!264487))

(assert (= (and d!64019 (not c!45270)) b!264488))

(assert (= (and b!264488 c!45271) b!264483))

(assert (= (and b!264488 (not c!45271)) b!264490))

(assert (= (and b!264490 c!45269) b!264482))

(assert (= (and b!264490 (not c!45269)) b!264484))

(assert (= (or b!264482 b!264484) bm!25286))

(assert (= (or b!264483 bm!25286) bm!25287))

(assert (= (or b!264487 bm!25287) bm!25285))

(assert (= (and bm!25285 c!45272) b!264486))

(assert (= (and bm!25285 (not c!45272)) b!264485))

(assert (= (and d!64019 res!129048) b!264491))

(assert (= (and b!264491 res!129049) b!264489))

(declare-fun m!281515 () Bool)

(assert (=> b!264491 m!281515))

(declare-fun m!281517 () Bool)

(assert (=> b!264489 m!281517))

(declare-fun m!281519 () Bool)

(assert (=> b!264486 m!281519))

(declare-fun m!281521 () Bool)

(assert (=> bm!25285 m!281521))

(declare-fun m!281523 () Bool)

(assert (=> d!64019 m!281523))

(declare-fun m!281525 () Bool)

(assert (=> d!64019 m!281525))

(assert (=> d!63279 d!64019))

(declare-fun d!64021 () Bool)

(assert (=> d!64021 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))) (v!5509 (getValueByKey!321 (toList!1916 lt!133300) (select (arr!5996 lt!133005) #b00000000000000000000000000000000))))))

(assert (=> d!63309 d!64021))

(assert (=> d!63309 d!63869))

(declare-fun d!64023 () Bool)

(assert (=> d!64023 (= (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) lt!133260)) (v!5509 (getValueByKey!321 (toList!1916 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) lt!133260)))))

(assert (=> d!63389 d!64023))

(declare-fun b!264495 () Bool)

(declare-fun e!171350 () Option!327)

(assert (=> b!264495 (= e!171350 None!325)))

(declare-fun b!264493 () Bool)

(declare-fun e!171349 () Option!327)

(assert (=> b!264493 (= e!171349 e!171350)))

(declare-fun c!45274 () Bool)

(assert (=> b!264493 (= c!45274 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))) (not (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))) lt!133260))))))

(declare-fun b!264494 () Bool)

(assert (=> b!264494 (= e!171350 (getValueByKey!321 (t!8832 (toList!1916 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))) lt!133260))))

(declare-fun d!64025 () Bool)

(declare-fun c!45273 () Bool)

(assert (=> d!64025 (= c!45273 (and ((_ is Cons!3759) (toList!1916 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))) (= (_1!2454 (h!4425 (toList!1916 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))))) lt!133260)))))

(assert (=> d!64025 (= (getValueByKey!321 (toList!1916 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504)))) lt!133260) e!171349)))

(declare-fun b!264492 () Bool)

(assert (=> b!264492 (= e!171349 (Some!326 (_2!2454 (h!4425 (toList!1916 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))))))))))

(assert (= (and d!64025 c!45273) b!264492))

(assert (= (and d!64025 (not c!45273)) b!264493))

(assert (= (and b!264493 c!45274) b!264494))

(assert (= (and b!264493 (not c!45274)) b!264495))

(declare-fun m!281527 () Bool)

(assert (=> b!264494 m!281527))

(assert (=> d!63389 d!64025))

(assert (=> d!63253 d!63263))

(assert (=> d!63253 d!63251))

(declare-fun d!64027 () Bool)

(declare-fun e!171351 () Bool)

(assert (=> d!64027 e!171351))

(declare-fun res!129050 () Bool)

(assert (=> d!64027 (=> res!129050 e!171351)))

(declare-fun lt!133870 () Bool)

(assert (=> d!64027 (= res!129050 (not lt!133870))))

(declare-fun lt!133872 () Bool)

(assert (=> d!64027 (= lt!133870 lt!133872)))

(declare-fun lt!133871 () Unit!8164)

(declare-fun e!171352 () Unit!8164)

(assert (=> d!64027 (= lt!133871 e!171352)))

(declare-fun c!45275 () Bool)

(assert (=> d!64027 (= c!45275 lt!133872)))

(assert (=> d!64027 (= lt!133872 (containsKey!312 (toList!1916 lt!133313) lt!133316))))

(assert (=> d!64027 (= (contains!1885 lt!133313 lt!133316) lt!133870)))

(declare-fun b!264496 () Bool)

(declare-fun lt!133869 () Unit!8164)

(assert (=> b!264496 (= e!171352 lt!133869)))

(assert (=> b!264496 (= lt!133869 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133313) lt!133316))))

(assert (=> b!264496 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133313) lt!133316))))

(declare-fun b!264497 () Bool)

(declare-fun Unit!8224 () Unit!8164)

(assert (=> b!264497 (= e!171352 Unit!8224)))

(declare-fun b!264498 () Bool)

(assert (=> b!264498 (= e!171351 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133313) lt!133316)))))

(assert (= (and d!64027 c!45275) b!264496))

(assert (= (and d!64027 (not c!45275)) b!264497))

(assert (= (and d!64027 (not res!129050)) b!264498))

(declare-fun m!281529 () Bool)

(assert (=> d!64027 m!281529))

(declare-fun m!281531 () Bool)

(assert (=> b!264496 m!281531))

(assert (=> b!264496 m!279697))

(assert (=> b!264496 m!279697))

(declare-fun m!281533 () Bool)

(assert (=> b!264496 m!281533))

(assert (=> b!264498 m!279697))

(assert (=> b!264498 m!279697))

(assert (=> b!264498 m!281533))

(assert (=> d!63253 d!64027))

(assert (=> d!63253 d!63257))

(declare-fun d!64029 () Bool)

(assert (=> d!64029 (= (apply!262 (+!712 lt!133313 (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) lt!133316) (apply!262 lt!133313 lt!133316))))

(assert (=> d!64029 true))

(declare-fun _$34!1138 () Unit!8164)

(assert (=> d!64029 (= (choose!1300 lt!133313 lt!133296 (zeroValue!4683 thiss!1504) lt!133316) _$34!1138)))

(declare-fun bs!9345 () Bool)

(assert (= bs!9345 d!64029))

(assert (=> bs!9345 m!279525))

(assert (=> bs!9345 m!279525))

(assert (=> bs!9345 m!279527))

(assert (=> bs!9345 m!279549))

(assert (=> d!63253 d!64029))

(assert (=> bm!25190 d!63687))

(declare-fun d!64031 () Bool)

(declare-fun res!129051 () Bool)

(declare-fun e!171353 () Bool)

(assert (=> d!64031 (=> res!129051 e!171353)))

(assert (=> d!64031 (= res!129051 (and ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (= (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (select (arr!5996 lt!133005) index!297))))))

(assert (=> d!64031 (= (containsKey!312 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))) (select (arr!5996 lt!133005) index!297)) e!171353)))

(declare-fun b!264499 () Bool)

(declare-fun e!171354 () Bool)

(assert (=> b!264499 (= e!171353 e!171354)))

(declare-fun res!129052 () Bool)

(assert (=> b!264499 (=> (not res!129052) (not e!171354))))

(assert (=> b!264499 (= res!129052 (and (or (not ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (bvsle (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (select (arr!5996 lt!133005) index!297))) ((_ is Cons!3759) (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (bvslt (_1!2454 (h!4425 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504))))) (select (arr!5996 lt!133005) index!297))))))

(declare-fun b!264500 () Bool)

(assert (=> b!264500 (= e!171354 (containsKey!312 (t!8832 (toList!1916 (getCurrentListMap!1448 lt!133005 lt!133020 (mask!11208 thiss!1504) (extraKeys!4579 thiss!1504) (zeroValue!4683 thiss!1504) (minValue!4683 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4842 thiss!1504)))) (select (arr!5996 lt!133005) index!297)))))

(assert (= (and d!64031 (not res!129051)) b!264499))

(assert (= (and b!264499 res!129052) b!264500))

(assert (=> b!264500 m!279459))

(declare-fun m!281535 () Bool)

(assert (=> b!264500 m!281535))

(assert (=> d!63437 d!64031))

(declare-fun d!64033 () Bool)

(declare-fun e!171355 () Bool)

(assert (=> d!64033 e!171355))

(declare-fun res!129053 () Bool)

(assert (=> d!64033 (=> res!129053 e!171355)))

(declare-fun lt!133874 () Bool)

(assert (=> d!64033 (= res!129053 (not lt!133874))))

(declare-fun lt!133876 () Bool)

(assert (=> d!64033 (= lt!133874 lt!133876)))

(declare-fun lt!133875 () Unit!8164)

(declare-fun e!171356 () Unit!8164)

(assert (=> d!64033 (= lt!133875 e!171356)))

(declare-fun c!45276 () Bool)

(assert (=> d!64033 (= c!45276 lt!133876)))

(assert (=> d!64033 (= lt!133876 (containsKey!312 (toList!1916 (+!712 lt!133519 (tuple2!4887 lt!133518 lt!133520))) lt!133521))))

(assert (=> d!64033 (= (contains!1885 (+!712 lt!133519 (tuple2!4887 lt!133518 lt!133520)) lt!133521) lt!133874)))

(declare-fun b!264501 () Bool)

(declare-fun lt!133873 () Unit!8164)

(assert (=> b!264501 (= e!171356 lt!133873)))

(assert (=> b!264501 (= lt!133873 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (+!712 lt!133519 (tuple2!4887 lt!133518 lt!133520))) lt!133521))))

(assert (=> b!264501 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133519 (tuple2!4887 lt!133518 lt!133520))) lt!133521))))

(declare-fun b!264502 () Bool)

(declare-fun Unit!8225 () Unit!8164)

(assert (=> b!264502 (= e!171356 Unit!8225)))

(declare-fun b!264503 () Bool)

(assert (=> b!264503 (= e!171355 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133519 (tuple2!4887 lt!133518 lt!133520))) lt!133521)))))

(assert (= (and d!64033 c!45276) b!264501))

(assert (= (and d!64033 (not c!45276)) b!264502))

(assert (= (and d!64033 (not res!129053)) b!264503))

(declare-fun m!281537 () Bool)

(assert (=> d!64033 m!281537))

(declare-fun m!281539 () Bool)

(assert (=> b!264501 m!281539))

(declare-fun m!281541 () Bool)

(assert (=> b!264501 m!281541))

(assert (=> b!264501 m!281541))

(declare-fun m!281543 () Bool)

(assert (=> b!264501 m!281543))

(assert (=> b!264503 m!281541))

(assert (=> b!264503 m!281541))

(assert (=> b!264503 m!281543))

(assert (=> b!263644 d!64033))

(assert (=> b!263644 d!63459))

(declare-fun d!64035 () Bool)

(declare-fun e!171357 () Bool)

(assert (=> d!64035 e!171357))

(declare-fun res!129054 () Bool)

(assert (=> d!64035 (=> (not res!129054) (not e!171357))))

(declare-fun lt!133878 () ListLongMap!3801)

(assert (=> d!64035 (= res!129054 (contains!1885 lt!133878 (_1!2454 (tuple2!4887 lt!133518 lt!133520))))))

(declare-fun lt!133879 () List!3763)

(assert (=> d!64035 (= lt!133878 (ListLongMap!3802 lt!133879))))

(declare-fun lt!133880 () Unit!8164)

(declare-fun lt!133877 () Unit!8164)

(assert (=> d!64035 (= lt!133880 lt!133877)))

(assert (=> d!64035 (= (getValueByKey!321 lt!133879 (_1!2454 (tuple2!4887 lt!133518 lt!133520))) (Some!326 (_2!2454 (tuple2!4887 lt!133518 lt!133520))))))

(assert (=> d!64035 (= lt!133877 (lemmaContainsTupThenGetReturnValue!177 lt!133879 (_1!2454 (tuple2!4887 lt!133518 lt!133520)) (_2!2454 (tuple2!4887 lt!133518 lt!133520))))))

(assert (=> d!64035 (= lt!133879 (insertStrictlySorted!180 (toList!1916 lt!133519) (_1!2454 (tuple2!4887 lt!133518 lt!133520)) (_2!2454 (tuple2!4887 lt!133518 lt!133520))))))

(assert (=> d!64035 (= (+!712 lt!133519 (tuple2!4887 lt!133518 lt!133520)) lt!133878)))

(declare-fun b!264504 () Bool)

(declare-fun res!129055 () Bool)

(assert (=> b!264504 (=> (not res!129055) (not e!171357))))

(assert (=> b!264504 (= res!129055 (= (getValueByKey!321 (toList!1916 lt!133878) (_1!2454 (tuple2!4887 lt!133518 lt!133520))) (Some!326 (_2!2454 (tuple2!4887 lt!133518 lt!133520)))))))

(declare-fun b!264505 () Bool)

(assert (=> b!264505 (= e!171357 (contains!1888 (toList!1916 lt!133878) (tuple2!4887 lt!133518 lt!133520)))))

(assert (= (and d!64035 res!129054) b!264504))

(assert (= (and b!264504 res!129055) b!264505))

(declare-fun m!281545 () Bool)

(assert (=> d!64035 m!281545))

(declare-fun m!281547 () Bool)

(assert (=> d!64035 m!281547))

(declare-fun m!281549 () Bool)

(assert (=> d!64035 m!281549))

(declare-fun m!281551 () Bool)

(assert (=> d!64035 m!281551))

(declare-fun m!281553 () Bool)

(assert (=> b!264504 m!281553))

(declare-fun m!281555 () Bool)

(assert (=> b!264505 m!281555))

(assert (=> b!263644 d!64035))

(declare-fun d!64037 () Bool)

(assert (=> d!64037 (not (contains!1885 (+!712 lt!133519 (tuple2!4887 lt!133518 lt!133520)) lt!133521))))

(declare-fun lt!133881 () Unit!8164)

(assert (=> d!64037 (= lt!133881 (choose!1304 lt!133519 lt!133518 lt!133520 lt!133521))))

(declare-fun e!171358 () Bool)

(assert (=> d!64037 e!171358))

(declare-fun res!129056 () Bool)

(assert (=> d!64037 (=> (not res!129056) (not e!171358))))

(assert (=> d!64037 (= res!129056 (not (contains!1885 lt!133519 lt!133521)))))

(assert (=> d!64037 (= (addStillNotContains!131 lt!133519 lt!133518 lt!133520 lt!133521) lt!133881)))

(declare-fun b!264506 () Bool)

(assert (=> b!264506 (= e!171358 (not (= lt!133518 lt!133521)))))

(assert (= (and d!64037 res!129056) b!264506))

(assert (=> d!64037 m!280087))

(assert (=> d!64037 m!280087))

(assert (=> d!64037 m!280089))

(declare-fun m!281557 () Bool)

(assert (=> d!64037 m!281557))

(declare-fun m!281559 () Bool)

(assert (=> d!64037 m!281559))

(assert (=> b!263644 d!64037))

(declare-fun d!64039 () Bool)

(declare-fun e!171359 () Bool)

(assert (=> d!64039 e!171359))

(declare-fun res!129057 () Bool)

(assert (=> d!64039 (=> (not res!129057) (not e!171359))))

(declare-fun lt!133883 () ListLongMap!3801)

(assert (=> d!64039 (= res!129057 (contains!1885 lt!133883 (_1!2454 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!133884 () List!3763)

(assert (=> d!64039 (= lt!133883 (ListLongMap!3802 lt!133884))))

(declare-fun lt!133885 () Unit!8164)

(declare-fun lt!133882 () Unit!8164)

(assert (=> d!64039 (= lt!133885 lt!133882)))

(assert (=> d!64039 (= (getValueByKey!321 lt!133884 (_1!2454 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!326 (_2!2454 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64039 (= lt!133882 (lemmaContainsTupThenGetReturnValue!177 lt!133884 (_1!2454 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2454 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64039 (= lt!133884 (insertStrictlySorted!180 (toList!1916 call!25218) (_1!2454 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!2454 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64039 (= (+!712 call!25218 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!133883)))

(declare-fun b!264507 () Bool)

(declare-fun res!129058 () Bool)

(assert (=> b!264507 (=> (not res!129058) (not e!171359))))

(assert (=> b!264507 (= res!129058 (= (getValueByKey!321 (toList!1916 lt!133883) (_1!2454 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!326 (_2!2454 (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!264508 () Bool)

(assert (=> b!264508 (= e!171359 (contains!1888 (toList!1916 lt!133883) (tuple2!4887 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!64039 res!129057) b!264507))

(assert (= (and b!264507 res!129058) b!264508))

(declare-fun m!281561 () Bool)

(assert (=> d!64039 m!281561))

(declare-fun m!281563 () Bool)

(assert (=> d!64039 m!281563))

(declare-fun m!281565 () Bool)

(assert (=> d!64039 m!281565))

(declare-fun m!281567 () Bool)

(assert (=> d!64039 m!281567))

(declare-fun m!281569 () Bool)

(assert (=> b!264507 m!281569))

(declare-fun m!281571 () Bool)

(assert (=> b!264508 m!281571))

(assert (=> b!263644 d!64039))

(declare-fun d!64041 () Bool)

(assert (=> d!64041 (= (apply!262 lt!133571 lt!133565) (get!3100 (getValueByKey!321 (toList!1916 lt!133571) lt!133565)))))

(declare-fun bs!9346 () Bool)

(assert (= bs!9346 d!64041))

(declare-fun m!281573 () Bool)

(assert (=> bs!9346 m!281573))

(assert (=> bs!9346 m!281573))

(declare-fun m!281575 () Bool)

(assert (=> bs!9346 m!281575))

(assert (=> b!263717 d!64041))

(declare-fun b!264509 () Bool)

(declare-fun res!129059 () Bool)

(declare-fun e!171362 () Bool)

(assert (=> b!264509 (=> (not res!129059) (not e!171362))))

(declare-fun lt!133888 () ListLongMap!3801)

(assert (=> b!264509 (= res!129059 (not (contains!1885 lt!133888 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!264510 () Bool)

(declare-fun e!171363 () Bool)

(assert (=> b!264510 (= e!171362 e!171363)))

(declare-fun c!45279 () Bool)

(declare-fun e!171366 () Bool)

(assert (=> b!264510 (= c!45279 e!171366)))

(declare-fun res!129062 () Bool)

(assert (=> b!264510 (=> (not res!129062) (not e!171366))))

(assert (=> b!264510 (= res!129062 (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(declare-fun b!264511 () Bool)

(declare-fun e!171360 () ListLongMap!3801)

(declare-fun e!171364 () ListLongMap!3801)

(assert (=> b!264511 (= e!171360 e!171364)))

(declare-fun c!45280 () Bool)

(assert (=> b!264511 (= c!45280 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun b!264512 () Bool)

(declare-fun call!25291 () ListLongMap!3801)

(assert (=> b!264512 (= e!171364 call!25291)))

(declare-fun b!264513 () Bool)

(declare-fun e!171361 () Bool)

(assert (=> b!264513 (= e!171361 (isEmpty!546 lt!133888))))

(declare-fun d!64043 () Bool)

(assert (=> d!64043 e!171362))

(declare-fun res!129060 () Bool)

(assert (=> d!64043 (=> (not res!129060) (not e!171362))))

(assert (=> d!64043 (= res!129060 (not (contains!1885 lt!133888 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64043 (= lt!133888 e!171360)))

(declare-fun c!45278 () Bool)

(assert (=> d!64043 (= c!45278 (bvsge #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(assert (=> d!64043 (validMask!0 (mask!11208 lt!133011))))

(assert (=> d!64043 (= (getCurrentListMapNoExtraKeys!578 (_keys!7034 lt!133011) (_values!4825 lt!133011) (mask!11208 lt!133011) (extraKeys!4579 lt!133011) (zeroValue!4683 lt!133011) (minValue!4683 lt!133011) #b00000000000000000000000000000000 (defaultEntry!4842 lt!133011)) lt!133888)))

(declare-fun b!264514 () Bool)

(assert (=> b!264514 (= e!171366 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(assert (=> b!264514 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!264515 () Bool)

(assert (=> b!264515 (= e!171360 (ListLongMap!3802 Nil!3760))))

(declare-fun bm!25288 () Bool)

(assert (=> bm!25288 (= call!25291 (getCurrentListMapNoExtraKeys!578 (_keys!7034 lt!133011) (_values!4825 lt!133011) (mask!11208 lt!133011) (extraKeys!4579 lt!133011) (zeroValue!4683 lt!133011) (minValue!4683 lt!133011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 lt!133011)))))

(declare-fun b!264516 () Bool)

(assert (=> b!264516 (= e!171363 e!171361)))

(declare-fun c!45277 () Bool)

(assert (=> b!264516 (= c!45277 (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(declare-fun b!264517 () Bool)

(assert (=> b!264517 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(assert (=> b!264517 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6346 (_values!4825 lt!133011))))))

(declare-fun e!171365 () Bool)

(assert (=> b!264517 (= e!171365 (= (apply!262 lt!133888 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)) (get!3099 (select (arr!5995 (_values!4825 lt!133011)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 lt!133011) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!264518 () Bool)

(declare-fun lt!133887 () Unit!8164)

(declare-fun lt!133886 () Unit!8164)

(assert (=> b!264518 (= lt!133887 lt!133886)))

(declare-fun lt!133889 () (_ BitVec 64))

(declare-fun lt!133890 () ListLongMap!3801)

(declare-fun lt!133891 () V!8521)

(declare-fun lt!133892 () (_ BitVec 64))

(assert (=> b!264518 (not (contains!1885 (+!712 lt!133890 (tuple2!4887 lt!133889 lt!133891)) lt!133892))))

(assert (=> b!264518 (= lt!133886 (addStillNotContains!131 lt!133890 lt!133889 lt!133891 lt!133892))))

(assert (=> b!264518 (= lt!133892 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!264518 (= lt!133891 (get!3099 (select (arr!5995 (_values!4825 lt!133011)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 lt!133011) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!264518 (= lt!133889 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000))))

(assert (=> b!264518 (= lt!133890 call!25291)))

(assert (=> b!264518 (= e!171364 (+!712 call!25291 (tuple2!4887 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000) (get!3099 (select (arr!5995 (_values!4825 lt!133011)) #b00000000000000000000000000000000) (dynLambda!605 (defaultEntry!4842 lt!133011) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!264519 () Bool)

(assert (=> b!264519 (= e!171361 (= lt!133888 (getCurrentListMapNoExtraKeys!578 (_keys!7034 lt!133011) (_values!4825 lt!133011) (mask!11208 lt!133011) (extraKeys!4579 lt!133011) (zeroValue!4683 lt!133011) (minValue!4683 lt!133011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4842 lt!133011))))))

(declare-fun b!264520 () Bool)

(assert (=> b!264520 (= e!171363 e!171365)))

(assert (=> b!264520 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6347 (_keys!7034 lt!133011))))))

(declare-fun res!129061 () Bool)

(assert (=> b!264520 (= res!129061 (contains!1885 lt!133888 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(assert (=> b!264520 (=> (not res!129061) (not e!171365))))

(assert (= (and d!64043 c!45278) b!264515))

(assert (= (and d!64043 (not c!45278)) b!264511))

(assert (= (and b!264511 c!45280) b!264518))

(assert (= (and b!264511 (not c!45280)) b!264512))

(assert (= (or b!264518 b!264512) bm!25288))

(assert (= (and d!64043 res!129060) b!264509))

(assert (= (and b!264509 res!129059) b!264510))

(assert (= (and b!264510 res!129062) b!264514))

(assert (= (and b!264510 c!45279) b!264520))

(assert (= (and b!264510 (not c!45279)) b!264516))

(assert (= (and b!264520 res!129061) b!264517))

(assert (= (and b!264516 c!45277) b!264519))

(assert (= (and b!264516 (not c!45277)) b!264513))

(declare-fun b_lambda!8395 () Bool)

(assert (=> (not b_lambda!8395) (not b!264517)))

(assert (=> b!264517 t!8839))

(declare-fun b_and!13983 () Bool)

(assert (= b_and!13981 (and (=> t!8839 result!5431) b_and!13983)))

(declare-fun b_lambda!8397 () Bool)

(assert (=> (not b_lambda!8397) (not b!264518)))

(assert (=> b!264518 t!8839))

(declare-fun b_and!13985 () Bool)

(assert (= b_and!13983 (and (=> t!8839 result!5431) b_and!13985)))

(declare-fun m!281577 () Bool)

(assert (=> b!264513 m!281577))

(assert (=> b!264514 m!279599))

(assert (=> b!264514 m!279599))

(assert (=> b!264514 m!279601))

(declare-fun m!281579 () Bool)

(assert (=> b!264519 m!281579))

(assert (=> b!264511 m!279599))

(assert (=> b!264511 m!279599))

(assert (=> b!264511 m!279601))

(assert (=> b!264517 m!280231))

(assert (=> b!264517 m!279599))

(assert (=> b!264517 m!279599))

(declare-fun m!281581 () Bool)

(assert (=> b!264517 m!281581))

(assert (=> b!264517 m!280231))

(assert (=> b!264517 m!280229))

(assert (=> b!264517 m!280233))

(assert (=> b!264517 m!280229))

(declare-fun m!281583 () Bool)

(assert (=> d!64043 m!281583))

(assert (=> d!64043 m!279819))

(declare-fun m!281585 () Bool)

(assert (=> b!264509 m!281585))

(assert (=> bm!25288 m!281579))

(assert (=> b!264520 m!279599))

(assert (=> b!264520 m!279599))

(declare-fun m!281587 () Bool)

(assert (=> b!264520 m!281587))

(declare-fun m!281589 () Bool)

(assert (=> b!264518 m!281589))

(assert (=> b!264518 m!280231))

(declare-fun m!281591 () Bool)

(assert (=> b!264518 m!281591))

(assert (=> b!264518 m!279599))

(assert (=> b!264518 m!281591))

(declare-fun m!281593 () Bool)

(assert (=> b!264518 m!281593))

(declare-fun m!281595 () Bool)

(assert (=> b!264518 m!281595))

(assert (=> b!264518 m!280231))

(assert (=> b!264518 m!280229))

(assert (=> b!264518 m!280233))

(assert (=> b!264518 m!280229))

(assert (=> b!263717 d!64043))

(declare-fun d!64045 () Bool)

(assert (=> d!64045 (= (apply!262 (+!712 lt!133572 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011))) lt!133575) (apply!262 lt!133572 lt!133575))))

(declare-fun lt!133893 () Unit!8164)

(assert (=> d!64045 (= lt!133893 (choose!1300 lt!133572 lt!133555 (zeroValue!4683 lt!133011) lt!133575))))

(declare-fun e!171367 () Bool)

(assert (=> d!64045 e!171367))

(declare-fun res!129063 () Bool)

(assert (=> d!64045 (=> (not res!129063) (not e!171367))))

(assert (=> d!64045 (= res!129063 (contains!1885 lt!133572 lt!133575))))

(assert (=> d!64045 (= (addApplyDifferent!238 lt!133572 lt!133555 (zeroValue!4683 lt!133011) lt!133575) lt!133893)))

(declare-fun b!264521 () Bool)

(assert (=> b!264521 (= e!171367 (not (= lt!133575 lt!133555)))))

(assert (= (and d!64045 res!129063) b!264521))

(assert (=> d!64045 m!280245))

(declare-fun m!281597 () Bool)

(assert (=> d!64045 m!281597))

(assert (=> d!64045 m!280269))

(declare-fun m!281599 () Bool)

(assert (=> d!64045 m!281599))

(assert (=> d!64045 m!280245))

(assert (=> d!64045 m!280247))

(assert (=> b!263717 d!64045))

(declare-fun d!64047 () Bool)

(assert (=> d!64047 (= (apply!262 (+!712 lt!133571 (tuple2!4887 lt!133562 (minValue!4683 lt!133011))) lt!133565) (apply!262 lt!133571 lt!133565))))

(declare-fun lt!133894 () Unit!8164)

(assert (=> d!64047 (= lt!133894 (choose!1300 lt!133571 lt!133562 (minValue!4683 lt!133011) lt!133565))))

(declare-fun e!171368 () Bool)

(assert (=> d!64047 e!171368))

(declare-fun res!129064 () Bool)

(assert (=> d!64047 (=> (not res!129064) (not e!171368))))

(assert (=> d!64047 (= res!129064 (contains!1885 lt!133571 lt!133565))))

(assert (=> d!64047 (= (addApplyDifferent!238 lt!133571 lt!133562 (minValue!4683 lt!133011) lt!133565) lt!133894)))

(declare-fun b!264522 () Bool)

(assert (=> b!264522 (= e!171368 (not (= lt!133565 lt!133562)))))

(assert (= (and d!64047 res!129064) b!264522))

(assert (=> d!64047 m!280255))

(declare-fun m!281601 () Bool)

(assert (=> d!64047 m!281601))

(assert (=> d!64047 m!280249))

(declare-fun m!281603 () Bool)

(assert (=> d!64047 m!281603))

(assert (=> d!64047 m!280255))

(assert (=> d!64047 m!280257))

(assert (=> b!263717 d!64047))

(declare-fun d!64049 () Bool)

(assert (=> d!64049 (= (apply!262 lt!133572 lt!133575) (get!3100 (getValueByKey!321 (toList!1916 lt!133572) lt!133575)))))

(declare-fun bs!9347 () Bool)

(assert (= bs!9347 d!64049))

(declare-fun m!281605 () Bool)

(assert (=> bs!9347 m!281605))

(assert (=> bs!9347 m!281605))

(declare-fun m!281607 () Bool)

(assert (=> bs!9347 m!281607))

(assert (=> b!263717 d!64049))

(declare-fun d!64051 () Bool)

(declare-fun e!171369 () Bool)

(assert (=> d!64051 e!171369))

(declare-fun res!129065 () Bool)

(assert (=> d!64051 (=> (not res!129065) (not e!171369))))

(declare-fun lt!133896 () ListLongMap!3801)

(assert (=> d!64051 (= res!129065 (contains!1885 lt!133896 (_1!2454 (tuple2!4887 lt!133562 (minValue!4683 lt!133011)))))))

(declare-fun lt!133897 () List!3763)

(assert (=> d!64051 (= lt!133896 (ListLongMap!3802 lt!133897))))

(declare-fun lt!133898 () Unit!8164)

(declare-fun lt!133895 () Unit!8164)

(assert (=> d!64051 (= lt!133898 lt!133895)))

(assert (=> d!64051 (= (getValueByKey!321 lt!133897 (_1!2454 (tuple2!4887 lt!133562 (minValue!4683 lt!133011)))) (Some!326 (_2!2454 (tuple2!4887 lt!133562 (minValue!4683 lt!133011)))))))

(assert (=> d!64051 (= lt!133895 (lemmaContainsTupThenGetReturnValue!177 lt!133897 (_1!2454 (tuple2!4887 lt!133562 (minValue!4683 lt!133011))) (_2!2454 (tuple2!4887 lt!133562 (minValue!4683 lt!133011)))))))

(assert (=> d!64051 (= lt!133897 (insertStrictlySorted!180 (toList!1916 lt!133571) (_1!2454 (tuple2!4887 lt!133562 (minValue!4683 lt!133011))) (_2!2454 (tuple2!4887 lt!133562 (minValue!4683 lt!133011)))))))

(assert (=> d!64051 (= (+!712 lt!133571 (tuple2!4887 lt!133562 (minValue!4683 lt!133011))) lt!133896)))

(declare-fun b!264523 () Bool)

(declare-fun res!129066 () Bool)

(assert (=> b!264523 (=> (not res!129066) (not e!171369))))

(assert (=> b!264523 (= res!129066 (= (getValueByKey!321 (toList!1916 lt!133896) (_1!2454 (tuple2!4887 lt!133562 (minValue!4683 lt!133011)))) (Some!326 (_2!2454 (tuple2!4887 lt!133562 (minValue!4683 lt!133011))))))))

(declare-fun b!264524 () Bool)

(assert (=> b!264524 (= e!171369 (contains!1888 (toList!1916 lt!133896) (tuple2!4887 lt!133562 (minValue!4683 lt!133011))))))

(assert (= (and d!64051 res!129065) b!264523))

(assert (= (and b!264523 res!129066) b!264524))

(declare-fun m!281609 () Bool)

(assert (=> d!64051 m!281609))

(declare-fun m!281611 () Bool)

(assert (=> d!64051 m!281611))

(declare-fun m!281613 () Bool)

(assert (=> d!64051 m!281613))

(declare-fun m!281615 () Bool)

(assert (=> d!64051 m!281615))

(declare-fun m!281617 () Bool)

(assert (=> b!264523 m!281617))

(declare-fun m!281619 () Bool)

(assert (=> b!264524 m!281619))

(assert (=> b!263717 d!64051))

(declare-fun d!64053 () Bool)

(declare-fun e!171370 () Bool)

(assert (=> d!64053 e!171370))

(declare-fun res!129067 () Bool)

(assert (=> d!64053 (=> res!129067 e!171370)))

(declare-fun lt!133900 () Bool)

(assert (=> d!64053 (= res!129067 (not lt!133900))))

(declare-fun lt!133902 () Bool)

(assert (=> d!64053 (= lt!133900 lt!133902)))

(declare-fun lt!133901 () Unit!8164)

(declare-fun e!171371 () Unit!8164)

(assert (=> d!64053 (= lt!133901 e!171371)))

(declare-fun c!45281 () Bool)

(assert (=> d!64053 (= c!45281 lt!133902)))

(assert (=> d!64053 (= lt!133902 (containsKey!312 (toList!1916 (+!712 lt!133568 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011)))) lt!133557))))

(assert (=> d!64053 (= (contains!1885 (+!712 lt!133568 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011))) lt!133557) lt!133900)))

(declare-fun b!264525 () Bool)

(declare-fun lt!133899 () Unit!8164)

(assert (=> b!264525 (= e!171371 lt!133899)))

(assert (=> b!264525 (= lt!133899 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 (+!712 lt!133568 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011)))) lt!133557))))

(assert (=> b!264525 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133568 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011)))) lt!133557))))

(declare-fun b!264526 () Bool)

(declare-fun Unit!8226 () Unit!8164)

(assert (=> b!264526 (= e!171371 Unit!8226)))

(declare-fun b!264527 () Bool)

(assert (=> b!264527 (= e!171370 (isDefined!261 (getValueByKey!321 (toList!1916 (+!712 lt!133568 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011)))) lt!133557)))))

(assert (= (and d!64053 c!45281) b!264525))

(assert (= (and d!64053 (not c!45281)) b!264526))

(assert (= (and d!64053 (not res!129067)) b!264527))

(declare-fun m!281621 () Bool)

(assert (=> d!64053 m!281621))

(declare-fun m!281623 () Bool)

(assert (=> b!264525 m!281623))

(declare-fun m!281625 () Bool)

(assert (=> b!264525 m!281625))

(assert (=> b!264525 m!281625))

(declare-fun m!281627 () Bool)

(assert (=> b!264525 m!281627))

(assert (=> b!264527 m!281625))

(assert (=> b!264527 m!281625))

(assert (=> b!264527 m!281627))

(assert (=> b!263717 d!64053))

(declare-fun d!64055 () Bool)

(assert (=> d!64055 (= (apply!262 (+!712 lt!133571 (tuple2!4887 lt!133562 (minValue!4683 lt!133011))) lt!133565) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133571 (tuple2!4887 lt!133562 (minValue!4683 lt!133011)))) lt!133565)))))

(declare-fun bs!9348 () Bool)

(assert (= bs!9348 d!64055))

(declare-fun m!281629 () Bool)

(assert (=> bs!9348 m!281629))

(assert (=> bs!9348 m!281629))

(declare-fun m!281631 () Bool)

(assert (=> bs!9348 m!281631))

(assert (=> b!263717 d!64055))

(declare-fun d!64057 () Bool)

(assert (=> d!64057 (= (apply!262 (+!712 lt!133564 (tuple2!4887 lt!133558 (minValue!4683 lt!133011))) lt!133573) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133564 (tuple2!4887 lt!133558 (minValue!4683 lt!133011)))) lt!133573)))))

(declare-fun bs!9349 () Bool)

(assert (= bs!9349 d!64057))

(declare-fun m!281633 () Bool)

(assert (=> bs!9349 m!281633))

(assert (=> bs!9349 m!281633))

(declare-fun m!281635 () Bool)

(assert (=> bs!9349 m!281635))

(assert (=> b!263717 d!64057))

(declare-fun d!64059 () Bool)

(declare-fun e!171372 () Bool)

(assert (=> d!64059 e!171372))

(declare-fun res!129068 () Bool)

(assert (=> d!64059 (=> (not res!129068) (not e!171372))))

(declare-fun lt!133904 () ListLongMap!3801)

(assert (=> d!64059 (= res!129068 (contains!1885 lt!133904 (_1!2454 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011)))))))

(declare-fun lt!133905 () List!3763)

(assert (=> d!64059 (= lt!133904 (ListLongMap!3802 lt!133905))))

(declare-fun lt!133906 () Unit!8164)

(declare-fun lt!133903 () Unit!8164)

(assert (=> d!64059 (= lt!133906 lt!133903)))

(assert (=> d!64059 (= (getValueByKey!321 lt!133905 (_1!2454 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011)))) (Some!326 (_2!2454 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011)))))))

(assert (=> d!64059 (= lt!133903 (lemmaContainsTupThenGetReturnValue!177 lt!133905 (_1!2454 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011))) (_2!2454 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011)))))))

(assert (=> d!64059 (= lt!133905 (insertStrictlySorted!180 (toList!1916 lt!133572) (_1!2454 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011))) (_2!2454 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011)))))))

(assert (=> d!64059 (= (+!712 lt!133572 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011))) lt!133904)))

(declare-fun b!264528 () Bool)

(declare-fun res!129069 () Bool)

(assert (=> b!264528 (=> (not res!129069) (not e!171372))))

(assert (=> b!264528 (= res!129069 (= (getValueByKey!321 (toList!1916 lt!133904) (_1!2454 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011)))) (Some!326 (_2!2454 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011))))))))

(declare-fun b!264529 () Bool)

(assert (=> b!264529 (= e!171372 (contains!1888 (toList!1916 lt!133904) (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011))))))

(assert (= (and d!64059 res!129068) b!264528))

(assert (= (and b!264528 res!129069) b!264529))

(declare-fun m!281637 () Bool)

(assert (=> d!64059 m!281637))

(declare-fun m!281639 () Bool)

(assert (=> d!64059 m!281639))

(declare-fun m!281641 () Bool)

(assert (=> d!64059 m!281641))

(declare-fun m!281643 () Bool)

(assert (=> d!64059 m!281643))

(declare-fun m!281645 () Bool)

(assert (=> b!264528 m!281645))

(declare-fun m!281647 () Bool)

(assert (=> b!264529 m!281647))

(assert (=> b!263717 d!64059))

(declare-fun d!64061 () Bool)

(assert (=> d!64061 (= (apply!262 lt!133564 lt!133573) (get!3100 (getValueByKey!321 (toList!1916 lt!133564) lt!133573)))))

(declare-fun bs!9350 () Bool)

(assert (= bs!9350 d!64061))

(declare-fun m!281649 () Bool)

(assert (=> bs!9350 m!281649))

(assert (=> bs!9350 m!281649))

(declare-fun m!281651 () Bool)

(assert (=> bs!9350 m!281651))

(assert (=> b!263717 d!64061))

(declare-fun d!64063 () Bool)

(assert (=> d!64063 (= (apply!262 (+!712 lt!133572 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011))) lt!133575) (get!3100 (getValueByKey!321 (toList!1916 (+!712 lt!133572 (tuple2!4887 lt!133555 (zeroValue!4683 lt!133011)))) lt!133575)))))

(declare-fun bs!9351 () Bool)

(assert (= bs!9351 d!64063))

(declare-fun m!281653 () Bool)

(assert (=> bs!9351 m!281653))

(assert (=> bs!9351 m!281653))

(declare-fun m!281655 () Bool)

(assert (=> bs!9351 m!281655))

(assert (=> b!263717 d!64063))

(declare-fun d!64065 () Bool)

(assert (=> d!64065 (contains!1885 (+!712 lt!133568 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011))) lt!133557)))

(declare-fun lt!133907 () Unit!8164)

(assert (=> d!64065 (= lt!133907 (choose!1301 lt!133568 lt!133574 (zeroValue!4683 lt!133011) lt!133557))))

(assert (=> d!64065 (contains!1885 lt!133568 lt!133557)))

(assert (=> d!64065 (= (addStillContains!238 lt!133568 lt!133574 (zeroValue!4683 lt!133011) lt!133557) lt!133907)))

(declare-fun bs!9352 () Bool)

(assert (= bs!9352 d!64065))

(assert (=> bs!9352 m!280265))

(assert (=> bs!9352 m!280265))

(assert (=> bs!9352 m!280267))

(declare-fun m!281657 () Bool)

(assert (=> bs!9352 m!281657))

(declare-fun m!281659 () Bool)

(assert (=> bs!9352 m!281659))

(assert (=> b!263717 d!64065))

(declare-fun d!64067 () Bool)

(declare-fun e!171373 () Bool)

(assert (=> d!64067 e!171373))

(declare-fun res!129070 () Bool)

(assert (=> d!64067 (=> (not res!129070) (not e!171373))))

(declare-fun lt!133909 () ListLongMap!3801)

(assert (=> d!64067 (= res!129070 (contains!1885 lt!133909 (_1!2454 (tuple2!4887 lt!133558 (minValue!4683 lt!133011)))))))

(declare-fun lt!133910 () List!3763)

(assert (=> d!64067 (= lt!133909 (ListLongMap!3802 lt!133910))))

(declare-fun lt!133911 () Unit!8164)

(declare-fun lt!133908 () Unit!8164)

(assert (=> d!64067 (= lt!133911 lt!133908)))

(assert (=> d!64067 (= (getValueByKey!321 lt!133910 (_1!2454 (tuple2!4887 lt!133558 (minValue!4683 lt!133011)))) (Some!326 (_2!2454 (tuple2!4887 lt!133558 (minValue!4683 lt!133011)))))))

(assert (=> d!64067 (= lt!133908 (lemmaContainsTupThenGetReturnValue!177 lt!133910 (_1!2454 (tuple2!4887 lt!133558 (minValue!4683 lt!133011))) (_2!2454 (tuple2!4887 lt!133558 (minValue!4683 lt!133011)))))))

(assert (=> d!64067 (= lt!133910 (insertStrictlySorted!180 (toList!1916 lt!133564) (_1!2454 (tuple2!4887 lt!133558 (minValue!4683 lt!133011))) (_2!2454 (tuple2!4887 lt!133558 (minValue!4683 lt!133011)))))))

(assert (=> d!64067 (= (+!712 lt!133564 (tuple2!4887 lt!133558 (minValue!4683 lt!133011))) lt!133909)))

(declare-fun b!264530 () Bool)

(declare-fun res!129071 () Bool)

(assert (=> b!264530 (=> (not res!129071) (not e!171373))))

(assert (=> b!264530 (= res!129071 (= (getValueByKey!321 (toList!1916 lt!133909) (_1!2454 (tuple2!4887 lt!133558 (minValue!4683 lt!133011)))) (Some!326 (_2!2454 (tuple2!4887 lt!133558 (minValue!4683 lt!133011))))))))

(declare-fun b!264531 () Bool)

(assert (=> b!264531 (= e!171373 (contains!1888 (toList!1916 lt!133909) (tuple2!4887 lt!133558 (minValue!4683 lt!133011))))))

(assert (= (and d!64067 res!129070) b!264530))

(assert (= (and b!264530 res!129071) b!264531))

(declare-fun m!281661 () Bool)

(assert (=> d!64067 m!281661))

(declare-fun m!281663 () Bool)

(assert (=> d!64067 m!281663))

(declare-fun m!281665 () Bool)

(assert (=> d!64067 m!281665))

(declare-fun m!281667 () Bool)

(assert (=> d!64067 m!281667))

(declare-fun m!281669 () Bool)

(assert (=> b!264530 m!281669))

(declare-fun m!281671 () Bool)

(assert (=> b!264531 m!281671))

(assert (=> b!263717 d!64067))

(declare-fun d!64069 () Bool)

(declare-fun e!171374 () Bool)

(assert (=> d!64069 e!171374))

(declare-fun res!129072 () Bool)

(assert (=> d!64069 (=> (not res!129072) (not e!171374))))

(declare-fun lt!133913 () ListLongMap!3801)

(assert (=> d!64069 (= res!129072 (contains!1885 lt!133913 (_1!2454 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011)))))))

(declare-fun lt!133914 () List!3763)

(assert (=> d!64069 (= lt!133913 (ListLongMap!3802 lt!133914))))

(declare-fun lt!133915 () Unit!8164)

(declare-fun lt!133912 () Unit!8164)

(assert (=> d!64069 (= lt!133915 lt!133912)))

(assert (=> d!64069 (= (getValueByKey!321 lt!133914 (_1!2454 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011)))) (Some!326 (_2!2454 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011)))))))

(assert (=> d!64069 (= lt!133912 (lemmaContainsTupThenGetReturnValue!177 lt!133914 (_1!2454 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011))) (_2!2454 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011)))))))

(assert (=> d!64069 (= lt!133914 (insertStrictlySorted!180 (toList!1916 lt!133568) (_1!2454 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011))) (_2!2454 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011)))))))

(assert (=> d!64069 (= (+!712 lt!133568 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011))) lt!133913)))

(declare-fun b!264532 () Bool)

(declare-fun res!129073 () Bool)

(assert (=> b!264532 (=> (not res!129073) (not e!171374))))

(assert (=> b!264532 (= res!129073 (= (getValueByKey!321 (toList!1916 lt!133913) (_1!2454 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011)))) (Some!326 (_2!2454 (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011))))))))

(declare-fun b!264533 () Bool)

(assert (=> b!264533 (= e!171374 (contains!1888 (toList!1916 lt!133913) (tuple2!4887 lt!133574 (zeroValue!4683 lt!133011))))))

(assert (= (and d!64069 res!129072) b!264532))

(assert (= (and b!264532 res!129073) b!264533))

(declare-fun m!281673 () Bool)

(assert (=> d!64069 m!281673))

(declare-fun m!281675 () Bool)

(assert (=> d!64069 m!281675))

(declare-fun m!281677 () Bool)

(assert (=> d!64069 m!281677))

(declare-fun m!281679 () Bool)

(assert (=> d!64069 m!281679))

(declare-fun m!281681 () Bool)

(assert (=> b!264532 m!281681))

(declare-fun m!281683 () Bool)

(assert (=> b!264533 m!281683))

(assert (=> b!263717 d!64069))

(declare-fun d!64071 () Bool)

(assert (=> d!64071 (= (apply!262 (+!712 lt!133564 (tuple2!4887 lt!133558 (minValue!4683 lt!133011))) lt!133573) (apply!262 lt!133564 lt!133573))))

(declare-fun lt!133916 () Unit!8164)

(assert (=> d!64071 (= lt!133916 (choose!1300 lt!133564 lt!133558 (minValue!4683 lt!133011) lt!133573))))

(declare-fun e!171375 () Bool)

(assert (=> d!64071 e!171375))

(declare-fun res!129074 () Bool)

(assert (=> d!64071 (=> (not res!129074) (not e!171375))))

(assert (=> d!64071 (= res!129074 (contains!1885 lt!133564 lt!133573))))

(assert (=> d!64071 (= (addApplyDifferent!238 lt!133564 lt!133558 (minValue!4683 lt!133011) lt!133573) lt!133916)))

(declare-fun b!264534 () Bool)

(assert (=> b!264534 (= e!171375 (not (= lt!133573 lt!133558)))))

(assert (= (and d!64071 res!129074) b!264534))

(assert (=> d!64071 m!280251))

(declare-fun m!281685 () Bool)

(assert (=> d!64071 m!281685))

(assert (=> d!64071 m!280259))

(declare-fun m!281687 () Bool)

(assert (=> d!64071 m!281687))

(assert (=> d!64071 m!280251))

(assert (=> d!64071 m!280263))

(assert (=> b!263717 d!64071))

(assert (=> b!263532 d!63813))

(declare-fun d!64073 () Bool)

(declare-fun e!171376 () Bool)

(assert (=> d!64073 e!171376))

(declare-fun res!129075 () Bool)

(assert (=> d!64073 (=> res!129075 e!171376)))

(declare-fun lt!133918 () Bool)

(assert (=> d!64073 (= res!129075 (not lt!133918))))

(declare-fun lt!133920 () Bool)

(assert (=> d!64073 (= lt!133918 lt!133920)))

(declare-fun lt!133919 () Unit!8164)

(declare-fun e!171377 () Unit!8164)

(assert (=> d!64073 (= lt!133919 e!171377)))

(declare-fun c!45282 () Bool)

(assert (=> d!64073 (= c!45282 lt!133920)))

(assert (=> d!64073 (= lt!133920 (containsKey!312 (toList!1916 lt!133517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!64073 (= (contains!1885 lt!133517 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133918)))

(declare-fun b!264535 () Bool)

(declare-fun lt!133917 () Unit!8164)

(assert (=> b!264535 (= e!171377 lt!133917)))

(assert (=> b!264535 (= lt!133917 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!264535 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!264536 () Bool)

(declare-fun Unit!8227 () Unit!8164)

(assert (=> b!264536 (= e!171377 Unit!8227)))

(declare-fun b!264537 () Bool)

(assert (=> b!264537 (= e!171376 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133517) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!64073 c!45282) b!264535))

(assert (= (and d!64073 (not c!45282)) b!264536))

(assert (= (and d!64073 (not res!129075)) b!264537))

(declare-fun m!281689 () Bool)

(assert (=> d!64073 m!281689))

(declare-fun m!281691 () Bool)

(assert (=> b!264535 m!281691))

(declare-fun m!281693 () Bool)

(assert (=> b!264535 m!281693))

(assert (=> b!264535 m!281693))

(declare-fun m!281695 () Bool)

(assert (=> b!264535 m!281695))

(assert (=> b!264537 m!281693))

(assert (=> b!264537 m!281693))

(assert (=> b!264537 m!281695))

(assert (=> d!63381 d!64073))

(assert (=> d!63381 d!63237))

(declare-fun d!64075 () Bool)

(assert (not d!64075))

(assert (=> b!263433 d!64075))

(assert (=> bm!25226 d!64043))

(declare-fun b!264541 () Bool)

(declare-fun e!171379 () Option!327)

(assert (=> b!264541 (= e!171379 None!325)))

(declare-fun b!264539 () Bool)

(declare-fun e!171378 () Option!327)

(assert (=> b!264539 (= e!171378 e!171379)))

(declare-fun c!45284 () Bool)

(assert (=> b!264539 (= c!45284 (and ((_ is Cons!3759) (toList!1916 lt!133414)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133414))) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))))

(declare-fun b!264540 () Bool)

(assert (=> b!264540 (= e!171379 (getValueByKey!321 (t!8832 (toList!1916 lt!133414)) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))))))

(declare-fun d!64077 () Bool)

(declare-fun c!45283 () Bool)

(assert (=> d!64077 (= c!45283 (and ((_ is Cons!3759) (toList!1916 lt!133414)) (= (_1!2454 (h!4425 (toList!1916 lt!133414))) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504)))))))))

(assert (=> d!64077 (= (getValueByKey!321 (toList!1916 lt!133414) (_1!2454 (ite (or c!44882 c!44885) (tuple2!4887 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4683 thiss!1504)) (tuple2!4887 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4683 thiss!1504))))) e!171378)))

(declare-fun b!264538 () Bool)

(assert (=> b!264538 (= e!171378 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133414)))))))

(assert (= (and d!64077 c!45283) b!264538))

(assert (= (and d!64077 (not c!45283)) b!264539))

(assert (= (and b!264539 c!45284) b!264540))

(assert (= (and b!264539 (not c!45284)) b!264541))

(declare-fun m!281697 () Bool)

(assert (=> b!264540 m!281697))

(assert (=> b!263426 d!64077))

(declare-fun b!264545 () Bool)

(declare-fun e!171381 () Option!327)

(assert (=> b!264545 (= e!171381 None!325)))

(declare-fun b!264543 () Bool)

(declare-fun e!171380 () Option!327)

(assert (=> b!264543 (= e!171380 e!171381)))

(declare-fun c!45286 () Bool)

(assert (=> b!264543 (= c!45286 (and ((_ is Cons!3759) (toList!1916 lt!133532)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133532))) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264544 () Bool)

(assert (=> b!264544 (= e!171381 (getValueByKey!321 (t!8832 (toList!1916 lt!133532)) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))))))

(declare-fun c!45285 () Bool)

(declare-fun d!64079 () Bool)

(assert (=> d!64079 (= c!45285 (and ((_ is Cons!3759) (toList!1916 lt!133532)) (= (_1!2454 (h!4425 (toList!1916 lt!133532))) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504))))))))

(assert (=> d!64079 (= (getValueByKey!321 (toList!1916 lt!133532) (_1!2454 (tuple2!4887 lt!133243 (minValue!4683 thiss!1504)))) e!171380)))

(declare-fun b!264542 () Bool)

(assert (=> b!264542 (= e!171380 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133532)))))))

(assert (= (and d!64079 c!45285) b!264542))

(assert (= (and d!64079 (not c!45285)) b!264543))

(assert (= (and b!264543 c!45286) b!264544))

(assert (= (and b!264543 (not c!45286)) b!264545))

(declare-fun m!281699 () Bool)

(assert (=> b!264544 m!281699))

(assert (=> b!263652 d!64079))

(assert (=> b!263586 d!63843))

(assert (=> b!263586 d!63605))

(declare-fun b!264546 () Bool)

(declare-fun e!171382 () Bool)

(declare-fun call!25292 () Bool)

(assert (=> b!264546 (= e!171382 call!25292)))

(declare-fun bm!25289 () Bool)

(assert (=> bm!25289 (= call!25292 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!133005 (mask!11208 thiss!1504)))))

(declare-fun b!264547 () Bool)

(declare-fun e!171383 () Bool)

(assert (=> b!264547 (= e!171383 call!25292)))

(declare-fun b!264548 () Bool)

(declare-fun e!171384 () Bool)

(assert (=> b!264548 (= e!171384 e!171383)))

(declare-fun c!45287 () Bool)

(assert (=> b!264548 (= c!45287 (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!64081 () Bool)

(declare-fun res!129077 () Bool)

(assert (=> d!64081 (=> res!129077 e!171384)))

(assert (=> d!64081 (= res!129077 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 lt!133005)))))

(assert (=> d!64081 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!133005 (mask!11208 thiss!1504)) e!171384)))

(declare-fun b!264549 () Bool)

(assert (=> b!264549 (= e!171383 e!171382)))

(declare-fun lt!133922 () (_ BitVec 64))

(assert (=> b!264549 (= lt!133922 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!133923 () Unit!8164)

(assert (=> b!264549 (= lt!133923 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!133005 lt!133922 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!264549 (arrayContainsKey!0 lt!133005 lt!133922 #b00000000000000000000000000000000)))

(declare-fun lt!133921 () Unit!8164)

(assert (=> b!264549 (= lt!133921 lt!133923)))

(declare-fun res!129076 () Bool)

(assert (=> b!264549 (= res!129076 (= (seekEntryOrOpen!0 (select (arr!5996 lt!133005) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!133005 (mask!11208 thiss!1504)) (Found!1164 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!264549 (=> (not res!129076) (not e!171382))))

(assert (= (and d!64081 (not res!129077)) b!264548))

(assert (= (and b!264548 c!45287) b!264549))

(assert (= (and b!264548 (not c!45287)) b!264547))

(assert (= (and b!264549 res!129076) b!264546))

(assert (= (or b!264546 b!264547) bm!25289))

(declare-fun m!281701 () Bool)

(assert (=> bm!25289 m!281701))

(assert (=> b!264548 m!280863))

(assert (=> b!264548 m!280863))

(assert (=> b!264548 m!281065))

(assert (=> b!264549 m!280863))

(declare-fun m!281703 () Bool)

(assert (=> b!264549 m!281703))

(declare-fun m!281705 () Bool)

(assert (=> b!264549 m!281705))

(assert (=> b!264549 m!280863))

(declare-fun m!281707 () Bool)

(assert (=> b!264549 m!281707))

(assert (=> bm!25201 d!64081))

(declare-fun b!264553 () Bool)

(declare-fun e!171386 () Option!327)

(assert (=> b!264553 (= e!171386 None!325)))

(declare-fun b!264551 () Bool)

(declare-fun e!171385 () Option!327)

(assert (=> b!264551 (= e!171385 e!171386)))

(declare-fun c!45289 () Bool)

(assert (=> b!264551 (= c!45289 (and ((_ is Cons!3759) (toList!1916 lt!133511)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133511))) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))))

(declare-fun b!264552 () Bool)

(assert (=> b!264552 (= e!171386 (getValueByKey!321 (t!8832 (toList!1916 lt!133511)) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))))))

(declare-fun c!45288 () Bool)

(declare-fun d!64083 () Bool)

(assert (=> d!64083 (= c!45288 (and ((_ is Cons!3759) (toList!1916 lt!133511)) (= (_1!2454 (h!4425 (toList!1916 lt!133511))) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504))))))))

(assert (=> d!64083 (= (getValueByKey!321 (toList!1916 lt!133511) (_1!2454 (tuple2!4887 lt!133259 (zeroValue!4683 thiss!1504)))) e!171385)))

(declare-fun b!264550 () Bool)

(assert (=> b!264550 (= e!171385 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133511)))))))

(assert (= (and d!64083 c!45288) b!264550))

(assert (= (and d!64083 (not c!45288)) b!264551))

(assert (= (and b!264551 c!45289) b!264552))

(assert (= (and b!264551 (not c!45289)) b!264553))

(declare-fun m!281709 () Bool)

(assert (=> b!264552 m!281709))

(assert (=> b!263632 d!64083))

(declare-fun d!64085 () Bool)

(declare-fun lt!133924 () Bool)

(assert (=> d!64085 (= lt!133924 (select (content!177 Nil!3761) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun e!171388 () Bool)

(assert (=> d!64085 (= lt!133924 e!171388)))

(declare-fun res!129079 () Bool)

(assert (=> d!64085 (=> (not res!129079) (not e!171388))))

(assert (=> d!64085 (= res!129079 ((_ is Cons!3760) Nil!3761))))

(assert (=> d!64085 (= (contains!1889 Nil!3761 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)) lt!133924)))

(declare-fun b!264554 () Bool)

(declare-fun e!171387 () Bool)

(assert (=> b!264554 (= e!171388 e!171387)))

(declare-fun res!129078 () Bool)

(assert (=> b!264554 (=> res!129078 e!171387)))

(assert (=> b!264554 (= res!129078 (= (h!4426 Nil!3761) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun b!264555 () Bool)

(assert (=> b!264555 (= e!171387 (contains!1889 (t!8833 Nil!3761) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(assert (= (and d!64085 res!129079) b!264554))

(assert (= (and b!264554 (not res!129078)) b!264555))

(assert (=> d!64085 m!279781))

(assert (=> d!64085 m!279599))

(declare-fun m!281711 () Bool)

(assert (=> d!64085 m!281711))

(assert (=> b!264555 m!279599))

(declare-fun m!281713 () Bool)

(assert (=> b!264555 m!281713))

(assert (=> b!263593 d!64085))

(declare-fun d!64087 () Bool)

(assert (=> d!64087 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!5509 (getValueByKey!321 (toList!1916 lt!133300) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!63423 d!64087))

(assert (=> d!63423 d!63909))

(assert (=> b!263331 d!63813))

(declare-fun d!64089 () Bool)

(assert (=> d!64089 (= (get!3100 (getValueByKey!321 (toList!1916 lt!133305) lt!133314)) (v!5509 (getValueByKey!321 (toList!1916 lt!133305) lt!133314)))))

(assert (=> d!63261 d!64089))

(declare-fun b!264559 () Bool)

(declare-fun e!171390 () Option!327)

(assert (=> b!264559 (= e!171390 None!325)))

(declare-fun b!264557 () Bool)

(declare-fun e!171389 () Option!327)

(assert (=> b!264557 (= e!171389 e!171390)))

(declare-fun c!45291 () Bool)

(assert (=> b!264557 (= c!45291 (and ((_ is Cons!3759) (toList!1916 lt!133305)) (not (= (_1!2454 (h!4425 (toList!1916 lt!133305))) lt!133314))))))

(declare-fun b!264558 () Bool)

(assert (=> b!264558 (= e!171390 (getValueByKey!321 (t!8832 (toList!1916 lt!133305)) lt!133314))))

(declare-fun d!64091 () Bool)

(declare-fun c!45290 () Bool)

(assert (=> d!64091 (= c!45290 (and ((_ is Cons!3759) (toList!1916 lt!133305)) (= (_1!2454 (h!4425 (toList!1916 lt!133305))) lt!133314)))))

(assert (=> d!64091 (= (getValueByKey!321 (toList!1916 lt!133305) lt!133314) e!171389)))

(declare-fun b!264556 () Bool)

(assert (=> b!264556 (= e!171389 (Some!326 (_2!2454 (h!4425 (toList!1916 lt!133305)))))))

(assert (= (and d!64091 c!45290) b!264556))

(assert (= (and d!64091 (not c!45290)) b!264557))

(assert (= (and b!264557 c!45291) b!264558))

(assert (= (and b!264557 (not c!45291)) b!264559))

(declare-fun m!281715 () Bool)

(assert (=> b!264558 m!281715))

(assert (=> d!63261 d!64091))

(declare-fun lt!133925 () Bool)

(declare-fun d!64093 () Bool)

(assert (=> d!64093 (= lt!133925 (select (content!178 (toList!1916 lt!133389)) (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))

(declare-fun e!171392 () Bool)

(assert (=> d!64093 (= lt!133925 e!171392)))

(declare-fun res!129081 () Bool)

(assert (=> d!64093 (=> (not res!129081) (not e!171392))))

(assert (=> d!64093 (= res!129081 ((_ is Cons!3759) (toList!1916 lt!133389)))))

(assert (=> d!64093 (= (contains!1888 (toList!1916 lt!133389) (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) lt!133925)))

(declare-fun b!264560 () Bool)

(declare-fun e!171391 () Bool)

(assert (=> b!264560 (= e!171392 e!171391)))

(declare-fun res!129080 () Bool)

(assert (=> b!264560 (=> res!129080 e!171391)))

(assert (=> b!264560 (= res!129080 (= (h!4425 (toList!1916 lt!133389)) (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))

(declare-fun b!264561 () Bool)

(assert (=> b!264561 (= e!171391 (contains!1888 (t!8832 (toList!1916 lt!133389)) (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))

(assert (= (and d!64093 res!129081) b!264560))

(assert (= (and b!264560 (not res!129080)) b!264561))

(declare-fun m!281717 () Bool)

(assert (=> d!64093 m!281717))

(declare-fun m!281719 () Bool)

(assert (=> d!64093 m!281719))

(declare-fun m!281721 () Bool)

(assert (=> b!264561 m!281721))

(assert (=> b!263413 d!64093))

(assert (=> b!263499 d!63813))

(declare-fun d!64095 () Bool)

(assert (=> d!64095 (= (content!177 Nil!3761) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!63283 d!64095))

(assert (=> d!63241 d!63237))

(assert (=> b!263627 d!63867))

(assert (=> b!263627 d!63869))

(assert (=> d!63449 d!63447))

(declare-fun d!64097 () Bool)

(declare-fun res!129082 () Bool)

(declare-fun e!171393 () Bool)

(assert (=> d!64097 (=> res!129082 e!171393)))

(assert (=> d!64097 (= res!129082 (= (select (arr!5996 (_keys!7034 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!64097 (= (arrayContainsKey!0 (_keys!7034 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!171393)))

(declare-fun b!264562 () Bool)

(declare-fun e!171394 () Bool)

(assert (=> b!264562 (= e!171393 e!171394)))

(declare-fun res!129083 () Bool)

(assert (=> b!264562 (=> (not res!129083) (not e!171394))))

(assert (=> b!264562 (= res!129083 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 thiss!1504))))))

(declare-fun b!264563 () Bool)

(assert (=> b!264563 (= e!171394 (arrayContainsKey!0 (_keys!7034 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!64097 (not res!129082)) b!264562))

(assert (= (and b!264562 res!129083) b!264563))

(assert (=> d!64097 m!281417))

(declare-fun m!281723 () Bool)

(assert (=> b!264563 m!281723))

(assert (=> b!263583 d!64097))

(declare-fun d!64099 () Bool)

(declare-fun lt!133926 () Bool)

(assert (=> d!64099 (= lt!133926 (select (content!178 lt!133177) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun e!171396 () Bool)

(assert (=> d!64099 (= lt!133926 e!171396)))

(declare-fun res!129085 () Bool)

(assert (=> d!64099 (=> (not res!129085) (not e!171396))))

(assert (=> d!64099 (= res!129085 ((_ is Cons!3759) lt!133177))))

(assert (=> d!64099 (= (contains!1888 lt!133177 (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))) lt!133926)))

(declare-fun b!264564 () Bool)

(declare-fun e!171395 () Bool)

(assert (=> b!264564 (= e!171396 e!171395)))

(declare-fun res!129084 () Bool)

(assert (=> b!264564 (=> res!129084 e!171395)))

(assert (=> b!264564 (= res!129084 (= (h!4425 lt!133177) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun b!264565 () Bool)

(assert (=> b!264565 (= e!171395 (contains!1888 (t!8832 lt!133177) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(assert (= (and d!64099 res!129085) b!264564))

(assert (= (and b!264564 (not res!129084)) b!264565))

(declare-fun m!281725 () Bool)

(assert (=> d!64099 m!281725))

(declare-fun m!281727 () Bool)

(assert (=> d!64099 m!281727))

(declare-fun m!281729 () Bool)

(assert (=> b!264565 m!281729))

(assert (=> b!263454 d!64099))

(assert (=> b!263371 d!63897))

(assert (=> b!263371 d!63835))

(assert (=> b!263591 d!63633))

(declare-fun d!64101 () Bool)

(declare-fun lt!133927 () Bool)

(assert (=> d!64101 (= lt!133927 (select (content!178 (toList!1916 lt!133397)) (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))

(declare-fun e!171398 () Bool)

(assert (=> d!64101 (= lt!133927 e!171398)))

(declare-fun res!129087 () Bool)

(assert (=> d!64101 (=> (not res!129087) (not e!171398))))

(assert (=> d!64101 (= res!129087 ((_ is Cons!3759) (toList!1916 lt!133397)))))

(assert (=> d!64101 (= (contains!1888 (toList!1916 lt!133397) (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))) lt!133927)))

(declare-fun b!264566 () Bool)

(declare-fun e!171397 () Bool)

(assert (=> b!264566 (= e!171398 e!171397)))

(declare-fun res!129086 () Bool)

(assert (=> b!264566 (=> res!129086 e!171397)))

(assert (=> b!264566 (= res!129086 (= (h!4425 (toList!1916 lt!133397)) (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))

(declare-fun b!264567 () Bool)

(assert (=> b!264567 (= e!171397 (contains!1888 (t!8832 (toList!1916 lt!133397)) (tuple2!4887 lt!133296 (zeroValue!4683 thiss!1504))))))

(assert (= (and d!64101 res!129087) b!264566))

(assert (= (and b!264566 (not res!129086)) b!264567))

(declare-fun m!281731 () Bool)

(assert (=> d!64101 m!281731))

(declare-fun m!281733 () Bool)

(assert (=> d!64101 m!281733))

(declare-fun m!281735 () Bool)

(assert (=> b!264567 m!281735))

(assert (=> b!263418 d!64101))

(declare-fun d!64103 () Bool)

(assert (=> d!64103 (= (apply!262 (+!712 lt!133257 (tuple2!4887 lt!133240 (zeroValue!4683 thiss!1504))) lt!133260) (apply!262 lt!133257 lt!133260))))

(assert (=> d!64103 true))

(declare-fun _$34!1139 () Unit!8164)

(assert (=> d!64103 (= (choose!1300 lt!133257 lt!133240 (zeroValue!4683 thiss!1504) lt!133260) _$34!1139)))

(declare-fun bs!9353 () Bool)

(assert (= bs!9353 d!64103))

(assert (=> bs!9353 m!279401))

(assert (=> bs!9353 m!279401))

(assert (=> bs!9353 m!279403))

(assert (=> bs!9353 m!279425))

(assert (=> d!63371 d!64103))

(declare-fun d!64105 () Bool)

(declare-fun e!171399 () Bool)

(assert (=> d!64105 e!171399))

(declare-fun res!129088 () Bool)

(assert (=> d!64105 (=> res!129088 e!171399)))

(declare-fun lt!133929 () Bool)

(assert (=> d!64105 (= res!129088 (not lt!133929))))

(declare-fun lt!133931 () Bool)

(assert (=> d!64105 (= lt!133929 lt!133931)))

(declare-fun lt!133930 () Unit!8164)

(declare-fun e!171400 () Unit!8164)

(assert (=> d!64105 (= lt!133930 e!171400)))

(declare-fun c!45292 () Bool)

(assert (=> d!64105 (= c!45292 lt!133931)))

(assert (=> d!64105 (= lt!133931 (containsKey!312 (toList!1916 lt!133257) lt!133260))))

(assert (=> d!64105 (= (contains!1885 lt!133257 lt!133260) lt!133929)))

(declare-fun b!264568 () Bool)

(declare-fun lt!133928 () Unit!8164)

(assert (=> b!264568 (= e!171400 lt!133928)))

(assert (=> b!264568 (= lt!133928 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133257) lt!133260))))

(assert (=> b!264568 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133257) lt!133260))))

(declare-fun b!264569 () Bool)

(declare-fun Unit!8228 () Unit!8164)

(assert (=> b!264569 (= e!171400 Unit!8228)))

(declare-fun b!264570 () Bool)

(assert (=> b!264570 (= e!171399 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133257) lt!133260)))))

(assert (= (and d!64105 c!45292) b!264568))

(assert (= (and d!64105 (not c!45292)) b!264569))

(assert (= (and d!64105 (not res!129088)) b!264570))

(declare-fun m!281737 () Bool)

(assert (=> d!64105 m!281737))

(declare-fun m!281739 () Bool)

(assert (=> b!264568 m!281739))

(assert (=> b!264568 m!280121))

(assert (=> b!264568 m!280121))

(declare-fun m!281741 () Bool)

(assert (=> b!264568 m!281741))

(assert (=> b!264570 m!280121))

(assert (=> b!264570 m!280121))

(assert (=> b!264570 m!281741))

(assert (=> d!63371 d!64105))

(assert (=> d!63371 d!63375))

(assert (=> d!63371 d!63395))

(assert (=> d!63371 d!63389))

(assert (=> b!263338 d!63907))

(assert (=> b!263338 d!63909))

(declare-fun b!264571 () Bool)

(declare-fun e!171404 () Bool)

(declare-fun call!25293 () Bool)

(assert (=> b!264571 (= e!171404 call!25293)))

(declare-fun e!171401 () Bool)

(declare-fun b!264572 () Bool)

(assert (=> b!264572 (= e!171401 (contains!1889 (ite c!44912 (Cons!3760 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) Nil!3761) Nil!3761) (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264573 () Bool)

(declare-fun e!171403 () Bool)

(assert (=> b!264573 (= e!171403 e!171404)))

(declare-fun c!45293 () Bool)

(assert (=> b!264573 (= c!45293 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!264574 () Bool)

(assert (=> b!264574 (= e!171404 call!25293)))

(declare-fun bm!25290 () Bool)

(assert (=> bm!25290 (= call!25293 (arrayNoDuplicates!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!45293 (Cons!3760 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!44912 (Cons!3760 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) (ite c!44912 (Cons!3760 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) Nil!3761) Nil!3761))))))

(declare-fun b!264575 () Bool)

(declare-fun e!171402 () Bool)

(assert (=> b!264575 (= e!171402 e!171403)))

(declare-fun res!129089 () Bool)

(assert (=> b!264575 (=> (not res!129089) (not e!171403))))

(assert (=> b!264575 (= res!129089 (not e!171401))))

(declare-fun res!129091 () Bool)

(assert (=> b!264575 (=> (not res!129091) (not e!171401))))

(assert (=> b!264575 (= res!129091 (validKeyInArray!0 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!64107 () Bool)

(declare-fun res!129090 () Bool)

(assert (=> d!64107 (=> res!129090 e!171402)))

(assert (=> d!64107 (= res!129090 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))))))))

(assert (=> d!64107 (= (arrayNoDuplicates!0 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!44912 (Cons!3760 (select (arr!5996 (array!12672 (store (arr!5996 (_keys!7034 thiss!1504)) index!297 key!932) (size!6347 (_keys!7034 thiss!1504)))) #b00000000000000000000000000000000) Nil!3761) Nil!3761)) e!171402)))

(assert (= (and d!64107 (not res!129090)) b!264575))

(assert (= (and b!264575 res!129091) b!264572))

(assert (= (and b!264575 res!129089) b!264573))

(assert (= (and b!264573 c!45293) b!264574))

(assert (= (and b!264573 (not c!45293)) b!264571))

(assert (= (or b!264574 b!264571) bm!25290))

(assert (=> b!264572 m!281245))

(assert (=> b!264572 m!281245))

(declare-fun m!281743 () Bool)

(assert (=> b!264572 m!281743))

(assert (=> b!264573 m!281245))

(assert (=> b!264573 m!281245))

(assert (=> b!264573 m!281247))

(assert (=> bm!25290 m!281245))

(declare-fun m!281745 () Bool)

(assert (=> bm!25290 m!281745))

(assert (=> b!264575 m!281245))

(assert (=> b!264575 m!281245))

(assert (=> b!264575 m!281247))

(assert (=> bm!25186 d!64107))

(assert (=> b!263735 d!63285))

(assert (=> d!63331 d!63333))

(assert (=> d!63331 d!63335))

(declare-fun d!64109 () Bool)

(assert (=> d!64109 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133013) key!932))))

(assert (=> d!64109 true))

(declare-fun _$12!455 () Unit!8164)

(assert (=> d!64109 (= (choose!1303 (toList!1916 lt!133013) key!932) _$12!455)))

(declare-fun bs!9354 () Bool)

(assert (= bs!9354 d!64109))

(assert (=> bs!9354 m!279373))

(assert (=> bs!9354 m!279373))

(assert (=> bs!9354 m!279375))

(assert (=> d!63331 d!64109))

(assert (=> d!63331 d!63825))

(assert (=> d!63359 d!63357))

(declare-fun d!64111 () Bool)

(assert (=> d!64111 (= (getValueByKey!321 lt!133266 (_1!2454 lt!133017)) (Some!326 (_2!2454 lt!133017)))))

(assert (=> d!64111 true))

(declare-fun _$22!544 () Unit!8164)

(assert (=> d!64111 (= (choose!1302 lt!133266 (_1!2454 lt!133017) (_2!2454 lt!133017)) _$22!544)))

(declare-fun bs!9355 () Bool)

(assert (= bs!9355 d!64111))

(assert (=> bs!9355 m!279449))

(assert (=> d!63359 d!64111))

(declare-fun d!64113 () Bool)

(declare-fun res!129092 () Bool)

(declare-fun e!171405 () Bool)

(assert (=> d!64113 (=> res!129092 e!171405)))

(assert (=> d!64113 (= res!129092 (or ((_ is Nil!3760) lt!133266) ((_ is Nil!3760) (t!8832 lt!133266))))))

(assert (=> d!64113 (= (isStrictlySorted!364 lt!133266) e!171405)))

(declare-fun b!264576 () Bool)

(declare-fun e!171406 () Bool)

(assert (=> b!264576 (= e!171405 e!171406)))

(declare-fun res!129093 () Bool)

(assert (=> b!264576 (=> (not res!129093) (not e!171406))))

(assert (=> b!264576 (= res!129093 (bvslt (_1!2454 (h!4425 lt!133266)) (_1!2454 (h!4425 (t!8832 lt!133266)))))))

(declare-fun b!264577 () Bool)

(assert (=> b!264577 (= e!171406 (isStrictlySorted!364 (t!8832 lt!133266)))))

(assert (= (and d!64113 (not res!129092)) b!264576))

(assert (= (and b!264576 res!129093) b!264577))

(declare-fun m!281747 () Bool)

(assert (=> b!264577 m!281747))

(assert (=> d!63359 d!64113))

(assert (=> b!263341 d!63883))

(assert (=> b!263341 d!63885))

(declare-fun b!264578 () Bool)

(declare-fun e!171409 () List!3763)

(declare-fun call!25296 () List!3763)

(assert (=> b!264578 (= e!171409 call!25296)))

(declare-fun b!264579 () Bool)

(declare-fun e!171411 () List!3763)

(declare-fun call!25294 () List!3763)

(assert (=> b!264579 (= e!171411 call!25294)))

(declare-fun b!264580 () Bool)

(assert (=> b!264580 (= e!171409 call!25296)))

(declare-fun call!25295 () List!3763)

(declare-fun c!45295 () Bool)

(declare-fun bm!25291 () Bool)

(declare-fun e!171407 () List!3763)

(assert (=> bm!25291 (= call!25295 ($colon$colon!107 e!171407 (ite c!45295 (h!4425 (t!8832 (toList!1916 (map!2747 thiss!1504)))) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017)))))))

(declare-fun c!45297 () Bool)

(assert (=> bm!25291 (= c!45297 c!45295)))

(declare-fun c!45294 () Bool)

(declare-fun c!45296 () Bool)

(declare-fun b!264581 () Bool)

(assert (=> b!264581 (= e!171407 (ite c!45296 (t!8832 (t!8832 (toList!1916 (map!2747 thiss!1504)))) (ite c!45294 (Cons!3759 (h!4425 (t!8832 (toList!1916 (map!2747 thiss!1504)))) (t!8832 (t!8832 (toList!1916 (map!2747 thiss!1504))))) Nil!3760)))))

(declare-fun b!264582 () Bool)

(assert (=> b!264582 (= e!171407 (insertStrictlySorted!180 (t!8832 (t!8832 (toList!1916 (map!2747 thiss!1504)))) (_1!2454 lt!133017) (_2!2454 lt!133017)))))

(declare-fun bm!25292 () Bool)

(assert (=> bm!25292 (= call!25296 call!25294)))

(declare-fun d!64115 () Bool)

(declare-fun e!171410 () Bool)

(assert (=> d!64115 e!171410))

(declare-fun res!129094 () Bool)

(assert (=> d!64115 (=> (not res!129094) (not e!171410))))

(declare-fun lt!133932 () List!3763)

(assert (=> d!64115 (= res!129094 (isStrictlySorted!364 lt!133932))))

(declare-fun e!171408 () List!3763)

(assert (=> d!64115 (= lt!133932 e!171408)))

(assert (=> d!64115 (= c!45295 (and ((_ is Cons!3759) (t!8832 (toList!1916 (map!2747 thiss!1504)))) (bvslt (_1!2454 (h!4425 (t!8832 (toList!1916 (map!2747 thiss!1504))))) (_1!2454 lt!133017))))))

(assert (=> d!64115 (isStrictlySorted!364 (t!8832 (toList!1916 (map!2747 thiss!1504))))))

(assert (=> d!64115 (= (insertStrictlySorted!180 (t!8832 (toList!1916 (map!2747 thiss!1504))) (_1!2454 lt!133017) (_2!2454 lt!133017)) lt!133932)))

(declare-fun b!264583 () Bool)

(assert (=> b!264583 (= e!171408 call!25295)))

(declare-fun bm!25293 () Bool)

(assert (=> bm!25293 (= call!25294 call!25295)))

(declare-fun b!264584 () Bool)

(assert (=> b!264584 (= e!171408 e!171411)))

(assert (=> b!264584 (= c!45296 (and ((_ is Cons!3759) (t!8832 (toList!1916 (map!2747 thiss!1504)))) (= (_1!2454 (h!4425 (t!8832 (toList!1916 (map!2747 thiss!1504))))) (_1!2454 lt!133017))))))

(declare-fun b!264585 () Bool)

(assert (=> b!264585 (= e!171410 (contains!1888 lt!133932 (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun b!264586 () Bool)

(assert (=> b!264586 (= c!45294 (and ((_ is Cons!3759) (t!8832 (toList!1916 (map!2747 thiss!1504)))) (bvsgt (_1!2454 (h!4425 (t!8832 (toList!1916 (map!2747 thiss!1504))))) (_1!2454 lt!133017))))))

(assert (=> b!264586 (= e!171411 e!171409)))

(declare-fun b!264587 () Bool)

(declare-fun res!129095 () Bool)

(assert (=> b!264587 (=> (not res!129095) (not e!171410))))

(assert (=> b!264587 (= res!129095 (containsKey!312 lt!133932 (_1!2454 lt!133017)))))

(assert (= (and d!64115 c!45295) b!264583))

(assert (= (and d!64115 (not c!45295)) b!264584))

(assert (= (and b!264584 c!45296) b!264579))

(assert (= (and b!264584 (not c!45296)) b!264586))

(assert (= (and b!264586 c!45294) b!264578))

(assert (= (and b!264586 (not c!45294)) b!264580))

(assert (= (or b!264578 b!264580) bm!25292))

(assert (= (or b!264579 bm!25292) bm!25293))

(assert (= (or b!264583 bm!25293) bm!25291))

(assert (= (and bm!25291 c!45297) b!264582))

(assert (= (and bm!25291 (not c!45297)) b!264581))

(assert (= (and d!64115 res!129094) b!264587))

(assert (= (and b!264587 res!129095) b!264585))

(declare-fun m!281749 () Bool)

(assert (=> b!264587 m!281749))

(declare-fun m!281751 () Bool)

(assert (=> b!264585 m!281751))

(declare-fun m!281753 () Bool)

(assert (=> b!264582 m!281753))

(declare-fun m!281755 () Bool)

(assert (=> bm!25291 m!281755))

(declare-fun m!281757 () Bool)

(assert (=> d!64115 m!281757))

(assert (=> d!64115 m!280767))

(assert (=> b!263479 d!64115))

(declare-fun d!64117 () Bool)

(declare-fun lt!133933 () Bool)

(assert (=> d!64117 (= lt!133933 (select (content!178 lt!133492) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun e!171413 () Bool)

(assert (=> d!64117 (= lt!133933 e!171413)))

(declare-fun res!129097 () Bool)

(assert (=> d!64117 (=> (not res!129097) (not e!171413))))

(assert (=> d!64117 (= res!129097 ((_ is Cons!3759) lt!133492))))

(assert (=> d!64117 (= (contains!1888 lt!133492 (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))) lt!133933)))

(declare-fun b!264588 () Bool)

(declare-fun e!171412 () Bool)

(assert (=> b!264588 (= e!171413 e!171412)))

(declare-fun res!129096 () Bool)

(assert (=> b!264588 (=> res!129096 e!171412)))

(assert (=> b!264588 (= res!129096 (= (h!4425 lt!133492) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(declare-fun b!264589 () Bool)

(assert (=> b!264589 (= e!171412 (contains!1888 (t!8832 lt!133492) (tuple2!4887 (_1!2454 lt!133017) (_2!2454 lt!133017))))))

(assert (= (and d!64117 res!129097) b!264588))

(assert (= (and b!264588 (not res!129096)) b!264589))

(declare-fun m!281759 () Bool)

(assert (=> d!64117 m!281759))

(declare-fun m!281761 () Bool)

(assert (=> d!64117 m!281761))

(declare-fun m!281763 () Bool)

(assert (=> b!264589 m!281763))

(assert (=> b!263613 d!64117))

(assert (=> d!63323 d!63325))

(assert (=> d!63323 d!63327))

(declare-fun d!64119 () Bool)

(assert (=> d!64119 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133019) key!932))))

(assert (=> d!64119 true))

(declare-fun _$12!456 () Unit!8164)

(assert (=> d!64119 (= (choose!1303 (toList!1916 lt!133019) key!932) _$12!456)))

(declare-fun bs!9356 () Bool)

(assert (= bs!9356 d!64119))

(assert (=> bs!9356 m!279329))

(assert (=> bs!9356 m!279329))

(assert (=> bs!9356 m!279331))

(assert (=> d!63323 d!64119))

(declare-fun d!64121 () Bool)

(declare-fun res!129098 () Bool)

(declare-fun e!171414 () Bool)

(assert (=> d!64121 (=> res!129098 e!171414)))

(assert (=> d!64121 (= res!129098 (or ((_ is Nil!3760) (toList!1916 lt!133019)) ((_ is Nil!3760) (t!8832 (toList!1916 lt!133019)))))))

(assert (=> d!64121 (= (isStrictlySorted!364 (toList!1916 lt!133019)) e!171414)))

(declare-fun b!264590 () Bool)

(declare-fun e!171415 () Bool)

(assert (=> b!264590 (= e!171414 e!171415)))

(declare-fun res!129099 () Bool)

(assert (=> b!264590 (=> (not res!129099) (not e!171415))))

(assert (=> b!264590 (= res!129099 (bvslt (_1!2454 (h!4425 (toList!1916 lt!133019))) (_1!2454 (h!4425 (t!8832 (toList!1916 lt!133019))))))))

(declare-fun b!264591 () Bool)

(assert (=> b!264591 (= e!171415 (isStrictlySorted!364 (t!8832 (toList!1916 lt!133019))))))

(assert (= (and d!64121 (not res!129098)) b!264590))

(assert (= (and b!264590 res!129099) b!264591))

(declare-fun m!281765 () Bool)

(assert (=> b!264591 m!281765))

(assert (=> d!63323 d!64121))

(assert (=> d!63307 d!63319))

(assert (=> d!63307 d!63173))

(assert (=> d!63307 d!63321))

(declare-fun d!64123 () Bool)

(declare-fun e!171416 () Bool)

(assert (=> d!64123 e!171416))

(declare-fun res!129100 () Bool)

(assert (=> d!64123 (=> res!129100 e!171416)))

(declare-fun lt!133935 () Bool)

(assert (=> d!64123 (= res!129100 (not lt!133935))))

(declare-fun lt!133937 () Bool)

(assert (=> d!64123 (= lt!133935 lt!133937)))

(declare-fun lt!133936 () Unit!8164)

(declare-fun e!171417 () Unit!8164)

(assert (=> d!64123 (= lt!133936 e!171417)))

(declare-fun c!45298 () Bool)

(assert (=> d!64123 (= c!45298 lt!133937)))

(assert (=> d!64123 (= lt!133937 (containsKey!312 (toList!1916 lt!133389) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(assert (=> d!64123 (= (contains!1885 lt!133389 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) lt!133935)))

(declare-fun b!264592 () Bool)

(declare-fun lt!133934 () Unit!8164)

(assert (=> b!264592 (= e!171417 lt!133934)))

(assert (=> b!264592 (= lt!133934 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133389) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(assert (=> b!264592 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133389) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(declare-fun b!264593 () Bool)

(declare-fun Unit!8229 () Unit!8164)

(assert (=> b!264593 (= e!171417 Unit!8229)))

(declare-fun b!264594 () Bool)

(assert (=> b!264594 (= e!171416 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133389) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))))

(assert (= (and d!64123 c!45298) b!264592))

(assert (= (and d!64123 (not c!45298)) b!264593))

(assert (= (and d!64123 (not res!129100)) b!264594))

(declare-fun m!281767 () Bool)

(assert (=> d!64123 m!281767))

(declare-fun m!281769 () Bool)

(assert (=> b!264592 m!281769))

(assert (=> b!264592 m!279693))

(assert (=> b!264592 m!279693))

(declare-fun m!281771 () Bool)

(assert (=> b!264592 m!281771))

(assert (=> b!264594 m!279693))

(assert (=> b!264594 m!279693))

(assert (=> b!264594 m!281771))

(assert (=> d!63255 d!64123))

(declare-fun b!264598 () Bool)

(declare-fun e!171419 () Option!327)

(assert (=> b!264598 (= e!171419 None!325)))

(declare-fun b!264596 () Bool)

(declare-fun e!171418 () Option!327)

(assert (=> b!264596 (= e!171418 e!171419)))

(declare-fun c!45300 () Bool)

(assert (=> b!264596 (= c!45300 (and ((_ is Cons!3759) lt!133390) (not (= (_1!2454 (h!4425 lt!133390)) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))))

(declare-fun b!264597 () Bool)

(assert (=> b!264597 (= e!171419 (getValueByKey!321 (t!8832 lt!133390) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(declare-fun c!45299 () Bool)

(declare-fun d!64125 () Bool)

(assert (=> d!64125 (= c!45299 (and ((_ is Cons!3759) lt!133390) (= (_1!2454 (h!4425 lt!133390)) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))))

(assert (=> d!64125 (= (getValueByKey!321 lt!133390 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) e!171418)))

(declare-fun b!264595 () Bool)

(assert (=> b!264595 (= e!171418 (Some!326 (_2!2454 (h!4425 lt!133390))))))

(assert (= (and d!64125 c!45299) b!264595))

(assert (= (and d!64125 (not c!45299)) b!264596))

(assert (= (and b!264596 c!45300) b!264597))

(assert (= (and b!264596 (not c!45300)) b!264598))

(declare-fun m!281773 () Bool)

(assert (=> b!264597 m!281773))

(assert (=> d!63255 d!64125))

(declare-fun d!64127 () Bool)

(assert (=> d!64127 (= (getValueByKey!321 lt!133390 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) (Some!326 (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(declare-fun lt!133938 () Unit!8164)

(assert (=> d!64127 (= lt!133938 (choose!1302 lt!133390 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(declare-fun e!171420 () Bool)

(assert (=> d!64127 e!171420))

(declare-fun res!129101 () Bool)

(assert (=> d!64127 (=> (not res!129101) (not e!171420))))

(assert (=> d!64127 (= res!129101 (isStrictlySorted!364 lt!133390))))

(assert (=> d!64127 (= (lemmaContainsTupThenGetReturnValue!177 lt!133390 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) lt!133938)))

(declare-fun b!264599 () Bool)

(declare-fun res!129102 () Bool)

(assert (=> b!264599 (=> (not res!129102) (not e!171420))))

(assert (=> b!264599 (= res!129102 (containsKey!312 lt!133390 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(declare-fun b!264600 () Bool)

(assert (=> b!264600 (= e!171420 (contains!1888 lt!133390 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))))

(assert (= (and d!64127 res!129101) b!264599))

(assert (= (and b!264599 res!129102) b!264600))

(assert (=> d!64127 m!279687))

(declare-fun m!281775 () Bool)

(assert (=> d!64127 m!281775))

(declare-fun m!281777 () Bool)

(assert (=> d!64127 m!281777))

(declare-fun m!281779 () Bool)

(assert (=> b!264599 m!281779))

(declare-fun m!281781 () Bool)

(assert (=> b!264600 m!281781))

(assert (=> d!63255 d!64127))

(declare-fun b!264601 () Bool)

(declare-fun e!171423 () List!3763)

(declare-fun call!25299 () List!3763)

(assert (=> b!264601 (= e!171423 call!25299)))

(declare-fun b!264602 () Bool)

(declare-fun e!171425 () List!3763)

(declare-fun call!25297 () List!3763)

(assert (=> b!264602 (= e!171425 call!25297)))

(declare-fun b!264603 () Bool)

(assert (=> b!264603 (= e!171423 call!25299)))

(declare-fun e!171421 () List!3763)

(declare-fun c!45302 () Bool)

(declare-fun bm!25294 () Bool)

(declare-fun call!25298 () List!3763)

(assert (=> bm!25294 (= call!25298 ($colon$colon!107 e!171421 (ite c!45302 (h!4425 (toList!1916 lt!133312)) (tuple2!4887 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))))

(declare-fun c!45304 () Bool)

(assert (=> bm!25294 (= c!45304 c!45302)))

(declare-fun b!264604 () Bool)

(declare-fun c!45303 () Bool)

(declare-fun c!45301 () Bool)

(assert (=> b!264604 (= e!171421 (ite c!45303 (t!8832 (toList!1916 lt!133312)) (ite c!45301 (Cons!3759 (h!4425 (toList!1916 lt!133312)) (t!8832 (toList!1916 lt!133312))) Nil!3760)))))

(declare-fun b!264605 () Bool)

(assert (=> b!264605 (= e!171421 (insertStrictlySorted!180 (t!8832 (toList!1916 lt!133312)) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(declare-fun bm!25295 () Bool)

(assert (=> bm!25295 (= call!25299 call!25297)))

(declare-fun d!64129 () Bool)

(declare-fun e!171424 () Bool)

(assert (=> d!64129 e!171424))

(declare-fun res!129103 () Bool)

(assert (=> d!64129 (=> (not res!129103) (not e!171424))))

(declare-fun lt!133939 () List!3763)

(assert (=> d!64129 (= res!129103 (isStrictlySorted!364 lt!133939))))

(declare-fun e!171422 () List!3763)

(assert (=> d!64129 (= lt!133939 e!171422)))

(assert (=> d!64129 (= c!45302 (and ((_ is Cons!3759) (toList!1916 lt!133312)) (bvslt (_1!2454 (h!4425 (toList!1916 lt!133312))) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))))

(assert (=> d!64129 (isStrictlySorted!364 (toList!1916 lt!133312))))

(assert (=> d!64129 (= (insertStrictlySorted!180 (toList!1916 lt!133312) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))) lt!133939)))

(declare-fun b!264606 () Bool)

(assert (=> b!264606 (= e!171422 call!25298)))

(declare-fun bm!25296 () Bool)

(assert (=> bm!25296 (= call!25297 call!25298)))

(declare-fun b!264607 () Bool)

(assert (=> b!264607 (= e!171422 e!171425)))

(assert (=> b!264607 (= c!45303 (and ((_ is Cons!3759) (toList!1916 lt!133312)) (= (_1!2454 (h!4425 (toList!1916 lt!133312))) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))))

(declare-fun b!264608 () Bool)

(assert (=> b!264608 (= e!171424 (contains!1888 lt!133939 (tuple2!4887 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))) (_2!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))))

(declare-fun b!264609 () Bool)

(assert (=> b!264609 (= c!45301 (and ((_ is Cons!3759) (toList!1916 lt!133312)) (bvsgt (_1!2454 (h!4425 (toList!1916 lt!133312))) (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504))))))))

(assert (=> b!264609 (= e!171425 e!171423)))

(declare-fun b!264610 () Bool)

(declare-fun res!129104 () Bool)

(assert (=> b!264610 (=> (not res!129104) (not e!171424))))

(assert (=> b!264610 (= res!129104 (containsKey!312 lt!133939 (_1!2454 (tuple2!4887 lt!133303 (minValue!4683 thiss!1504)))))))

(assert (= (and d!64129 c!45302) b!264606))

(assert (= (and d!64129 (not c!45302)) b!264607))

(assert (= (and b!264607 c!45303) b!264602))

(assert (= (and b!264607 (not c!45303)) b!264609))

(assert (= (and b!264609 c!45301) b!264601))

(assert (= (and b!264609 (not c!45301)) b!264603))

(assert (= (or b!264601 b!264603) bm!25295))

(assert (= (or b!264602 bm!25295) bm!25296))

(assert (= (or b!264606 bm!25296) bm!25294))

(assert (= (and bm!25294 c!45304) b!264605))

(assert (= (and bm!25294 (not c!45304)) b!264604))

(assert (= (and d!64129 res!129103) b!264610))

(assert (= (and b!264610 res!129104) b!264608))

(declare-fun m!281783 () Bool)

(assert (=> b!264610 m!281783))

(declare-fun m!281785 () Bool)

(assert (=> b!264608 m!281785))

(declare-fun m!281787 () Bool)

(assert (=> b!264605 m!281787))

(declare-fun m!281789 () Bool)

(assert (=> bm!25294 m!281789))

(declare-fun m!281791 () Bool)

(assert (=> d!64129 m!281791))

(declare-fun m!281793 () Bool)

(assert (=> d!64129 m!281793))

(assert (=> d!63255 d!64129))

(declare-fun d!64131 () Bool)

(assert (=> d!64131 (= (validKeyInArray!0 (select (arr!5996 lt!133005) (bvadd index!297 #b00000000000000000000000000000001))) (and (not (= (select (arr!5996 lt!133005) (bvadd index!297 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5996 lt!133005) (bvadd index!297 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!263668 d!64131))

(declare-fun d!64133 () Bool)

(declare-fun e!171426 () Bool)

(assert (=> d!64133 e!171426))

(declare-fun res!129105 () Bool)

(assert (=> d!64133 (=> res!129105 e!171426)))

(declare-fun lt!133941 () Bool)

(assert (=> d!64133 (= res!129105 (not lt!133941))))

(declare-fun lt!133943 () Bool)

(assert (=> d!64133 (= lt!133941 lt!133943)))

(declare-fun lt!133942 () Unit!8164)

(declare-fun e!171427 () Unit!8164)

(assert (=> d!64133 (= lt!133942 e!171427)))

(declare-fun c!45305 () Bool)

(assert (=> d!64133 (= c!45305 lt!133943)))

(assert (=> d!64133 (= lt!133943 (containsKey!312 (toList!1916 lt!133559) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(assert (=> d!64133 (= (contains!1885 lt!133559 (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)) lt!133941)))

(declare-fun b!264611 () Bool)

(declare-fun lt!133940 () Unit!8164)

(assert (=> b!264611 (= e!171427 lt!133940)))

(assert (=> b!264611 (= lt!133940 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1916 lt!133559) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(assert (=> b!264611 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133559) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000)))))

(declare-fun b!264612 () Bool)

(declare-fun Unit!8230 () Unit!8164)

(assert (=> b!264612 (= e!171427 Unit!8230)))

(declare-fun b!264613 () Bool)

(assert (=> b!264613 (= e!171426 (isDefined!261 (getValueByKey!321 (toList!1916 lt!133559) (select (arr!5996 (_keys!7034 lt!133011)) #b00000000000000000000000000000000))))))

(assert (= (and d!64133 c!45305) b!264611))

(assert (= (and d!64133 (not c!45305)) b!264612))

(assert (= (and d!64133 (not res!129105)) b!264613))

(assert (=> d!64133 m!279599))

(declare-fun m!281795 () Bool)

(assert (=> d!64133 m!281795))

(assert (=> b!264611 m!279599))

(declare-fun m!281797 () Bool)

(assert (=> b!264611 m!281797))

(assert (=> b!264611 m!279599))

(assert (=> b!264611 m!281225))

(assert (=> b!264611 m!281225))

(declare-fun m!281799 () Bool)

(assert (=> b!264611 m!281799))

(assert (=> b!264613 m!279599))

(assert (=> b!264613 m!281225))

(assert (=> b!264613 m!281225))

(assert (=> b!264613 m!281799))

(assert (=> b!263716 d!64133))

(declare-fun d!64135 () Bool)

(assert (=> d!64135 (= (apply!262 lt!133517 (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000)) (get!3100 (getValueByKey!321 (toList!1916 lt!133517) (select (arr!5996 (_keys!7034 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!9357 () Bool)

(assert (= bs!9357 d!64135))

(assert (=> bs!9357 m!279365))

(assert (=> bs!9357 m!280653))

(assert (=> bs!9357 m!280653))

(declare-fun m!281801 () Bool)

(assert (=> bs!9357 m!281801))

(assert (=> b!263643 d!64135))

(assert (=> b!263643 d!63459))

(declare-fun b!264614 () Bool)

(declare-fun e!171428 () (_ BitVec 32))

(assert (=> b!264614 (= e!171428 #b00000000000000000000000000000000)))

(declare-fun b!264615 () Bool)

(declare-fun e!171429 () (_ BitVec 32))

(assert (=> b!264615 (= e!171428 e!171429)))

(declare-fun c!45306 () Bool)

(assert (=> b!264615 (= c!45306 (validKeyInArray!0 (select (arr!5996 (_keys!7034 lt!133011)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!64137 () Bool)

(declare-fun lt!133944 () (_ BitVec 32))

(assert (=> d!64137 (and (bvsge lt!133944 #b00000000000000000000000000000000) (bvsle lt!133944 (bvsub (size!6347 (_keys!7034 lt!133011)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!64137 (= lt!133944 e!171428)))

(declare-fun c!45307 () Bool)

(assert (=> d!64137 (= c!45307 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 lt!133011))))))

(assert (=> d!64137 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 lt!133011))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6347 (_keys!7034 lt!133011)) (size!6347 (_keys!7034 lt!133011))))))

(assert (=> d!64137 (= (arrayCountValidKeys!0 (_keys!7034 lt!133011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6347 (_keys!7034 lt!133011))) lt!133944)))

(declare-fun b!264616 () Bool)

(declare-fun call!25300 () (_ BitVec 32))

(assert (=> b!264616 (= e!171429 call!25300)))

(declare-fun b!264617 () Bool)

(assert (=> b!264617 (= e!171429 (bvadd #b00000000000000000000000000000001 call!25300))))

(declare-fun bm!25297 () Bool)

(assert (=> bm!25297 (= call!25300 (arrayCountValidKeys!0 (_keys!7034 lt!133011) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6347 (_keys!7034 lt!133011))))))

(assert (= (and d!64137 c!45307) b!264614))

(assert (= (and d!64137 (not c!45307)) b!264615))

(assert (= (and b!264615 c!45306) b!264617))

(assert (= (and b!264615 (not c!45306)) b!264616))

(assert (= (or b!264617 b!264616) bm!25297))

(assert (=> b!264615 m!280319))

(assert (=> b!264615 m!280319))

(assert (=> b!264615 m!280323))

(declare-fun m!281803 () Bool)

(assert (=> bm!25297 m!281803))

(assert (=> bm!25218 d!64137))

(declare-fun mapIsEmpty!11358 () Bool)

(declare-fun mapRes!11358 () Bool)

(assert (=> mapIsEmpty!11358 mapRes!11358))

(declare-fun b!264619 () Bool)

(declare-fun e!171430 () Bool)

(assert (=> b!264619 (= e!171430 tp_is_empty!6655)))

(declare-fun mapNonEmpty!11358 () Bool)

(declare-fun tp!23733 () Bool)

(declare-fun e!171431 () Bool)

(assert (=> mapNonEmpty!11358 (= mapRes!11358 (and tp!23733 e!171431))))

(declare-fun mapValue!11358 () ValueCell!2984)

(declare-fun mapRest!11358 () (Array (_ BitVec 32) ValueCell!2984))

(declare-fun mapKey!11358 () (_ BitVec 32))

(assert (=> mapNonEmpty!11358 (= mapRest!11357 (store mapRest!11358 mapKey!11358 mapValue!11358))))

(declare-fun b!264618 () Bool)

(assert (=> b!264618 (= e!171431 tp_is_empty!6655)))

(declare-fun condMapEmpty!11358 () Bool)

(declare-fun mapDefault!11358 () ValueCell!2984)

(assert (=> mapNonEmpty!11357 (= condMapEmpty!11358 (= mapRest!11357 ((as const (Array (_ BitVec 32) ValueCell!2984)) mapDefault!11358)))))

(assert (=> mapNonEmpty!11357 (= tp!23732 (and e!171430 mapRes!11358))))

(assert (= (and mapNonEmpty!11357 condMapEmpty!11358) mapIsEmpty!11358))

(assert (= (and mapNonEmpty!11357 (not condMapEmpty!11358)) mapNonEmpty!11358))

(assert (= (and mapNonEmpty!11358 ((_ is ValueCellFull!2984) mapValue!11358)) b!264618))

(assert (= (and mapNonEmpty!11357 ((_ is ValueCellFull!2984) mapDefault!11358)) b!264619))

(declare-fun m!281805 () Bool)

(assert (=> mapNonEmpty!11358 m!281805))

(declare-fun b_lambda!8399 () Bool)

(assert (= b_lambda!8389 (or (and b!262905 b_free!6793) b_lambda!8399)))

(declare-fun b_lambda!8401 () Bool)

(assert (= b_lambda!8391 (or (and b!262905 b_free!6793) b_lambda!8401)))

(declare-fun b_lambda!8403 () Bool)

(assert (= b_lambda!8387 (or (and b!262905 b_free!6793) b_lambda!8403)))

(declare-fun b_lambda!8405 () Bool)

(assert (= b_lambda!8383 (or (and b!262905 b_free!6793) b_lambda!8405)))

(declare-fun b_lambda!8407 () Bool)

(assert (= b_lambda!8393 (or (and b!262905 b_free!6793) b_lambda!8407)))

(declare-fun b_lambda!8409 () Bool)

(assert (= b_lambda!8371 (or (and b!262905 b_free!6793 (= (defaultEntry!4842 thiss!1504) (defaultEntry!4842 lt!133011))) b_lambda!8409)))

(declare-fun b_lambda!8411 () Bool)

(assert (= b_lambda!8385 (or (and b!262905 b_free!6793) b_lambda!8411)))

(check-sat (not d!63849) (not b!264280) (not b!263855) (not d!63745) (not b!264389) (not b!264177) (not d!63595) (not b!264063) (not b!264524) (not b!264054) (not b!264135) (not b!264076) (not d!64033) (not d!64103) (not d!64051) (not b!264120) (not b!264066) (not b!264144) (not b!264300) (not d!63639) (not d!63737) (not b!264464) (not d!64029) (not b_next!6793) (not b!264325) (not d!63691) (not b!264532) (not b!263853) (not bm!25257) (not b!263897) (not b!264475) (not b!264088) (not b!264272) (not b!264500) (not b!264531) (not b!263883) (not d!64055) (not b!264084) (not d!63593) (not d!63539) (not b!264278) (not bm!25235) (not b!264496) (not d!63599) (not b!264582) (not d!63773) (not d!63489) (not b!263911) (not b!264165) (not d!63923) (not d!63953) (not d!64013) (not b!264270) (not d!64093) (not d!63507) (not b!264175) (not d!63857) (not b!264519) (not b!264308) (not d!63759) (not d!63555) (not b!264504) (not b_lambda!8407) (not b!263881) (not b!263763) (not b!264136) (not d!63995) (not d!63767) (not b!263794) (not d!64067) (not d!63951) (not b!263903) (not b!264563) (not bm!25238) (not bm!25272) (not b!264179) (not b!264378) (not d!63855) (not b!263822) (not d!63815) (not bm!25297) (not d!64035) (not b!263836) (not d!63867) (not d!63607) (not b!264610) (not b!264215) (not b!264577) (not d!63999) (not d!63837) (not b!264281) (not b!264057) (not b!264403) (not b!264540) (not b!263916) (not d!63945) (not d!64049) (not b!264530) (not b!263800) (not bm!25285) (not b!263828) (not b!264187) (not b!264110) (not b!264294) (not d!64065) (not b!264480) (not d!63487) (not bm!25261) (not b!264456) (not d!63771) (not d!63863) (not b!264428) (not d!64105) (not b!264113) (not b!263797) (not d!63501) (not b!264397) (not b!263944) (not b!264128) (not d!63751) (not d!64127) (not b!263995) (not b!263840) (not b!264358) (not b!264423) (not b_lambda!8359) (not b!264419) (not d!64009) (not b!264152) (not b!264238) (not b!264123) (not d!63859) (not d!63505) (not d!63785) (not b!264154) (not b!264149) (not b!263998) (not b!264414) (not b!264517) (not b!264383) (not d!63861) (not d!63913) (not b!264008) (not b!264611) (not b!264046) (not b!263988) (not b!264513) (not b!264549) (not b!263920) (not b!263820) (not b!264078) (not b!263796) (not b!264155) (not b!264426) (not b!264572) (not b!263771) (not bm!25264) (not b!264160) (not d!63637) (not d!63523) (not d!64063) (not d!63521) (not d!64115) (not b!264613) (not b!263777) (not b!264010) (not b!264561) (not b!263975) (not d!63777) (not b!264036) (not b_lambda!8373) (not b!264511) (not b!264072) (not b!264210) (not b!264094) (not b!264180) (not d!63875) (not b!264163) (not d!63495) (not b!263981) (not b!264599) (not d!63689) (not d!63475) (not d!63715) (not d!64001) (not b!264125) (not b!263778) (not b!264082) (not b!263952) (not b!263889) (not b!264070) (not b!264402) (not d!63485) (not b!263935) (not d!63791) (not b!264196) (not b!263926) (not d!64111) (not b!263900) (not b!264080) (not b!264570) (not d!63895) (not b_lambda!8395) (not b!264229) (not b!263831) (not b!263862) (not b!264592) (not b!264567) (not b!264141) (not d!63967) (not b!264330) (not b!263894) (not bm!25294) (not d!63963) (not b!264264) (not d!63537) (not b!264295) (not b!264467) (not b!263788) (not d!64117) (not b!263809) (not b!264202) (not b!263779) (not b!264232) (not bm!25289) (not d!63569) (not b!264433) (not b_lambda!8379) (not b!264296) (not b!263775) (not b!263863) (not b!263963) (not b!264147) (not b!264012) (not b_lambda!8401) (not d!63775) (not b!264199) (not d!64123) (not b!263913) (not b!264458) (not b!263817) (not d!63725) (not d!64071) (not d!63989) (not b!264505) (not d!63585) (not b!264050) (not d!63947) (not b!264316) (not d!63883) (not b!264518) (not b!263971) (not b!264509) (not b_lambda!8377) (not b!264597) (not b!264289) (not bm!25253) (not b!264489) (not b!264400) (not d!63827) (not b!264191) (not b!264003) (not bm!25258) (not b!264086) (not d!63543) (not b!264431) (not b!264451) (not b!264170) (not b!263979) (not b!264306) (not b!264407) (not d!63483) (not b!263943) (not b!264366) (not b!264478) (not d!63829) (not d!63567) (not b!264185) (not b!264448) (not b!263774) (not d!63997) (not d!63843) (not bm!25291) (not d!64007) (not d!63529) (not d!63471) (not b!263780) (not b!264004) (not b!264286) (not d!64043) (not b!264434) (not bm!25256) (not bm!25278) (not d!63493) (not d!63713) (not b!263953) (not d!64059) (not b!264033) (not bm!25237) (not b!264252) (not b!263999) (not d!63755) (not d!64005) (not b!264334) (not d!63741) (not b!264146) (not b!263790) (not d!63497) (not b_lambda!8375) (not b!264021) (not d!63701) (not b!264372) (not b!264311) (not bm!25277) (not d!63669) (not b!264043) (not d!63641) (not b!264065) (not bm!25244) (not d!63661) (not b!264009) (not b!264337) (not b!264304) (not b!264555) (not b!264525) (not b_lambda!8403) (not d!63685) (not d!64129) (not b!263786) (not b!264481) (not b!264404) (not d!64119) (not bm!25265) (not d!63551) (not b!263768) (not d!63621) (not b!264315) (not d!63461) (not b!264507) (not b!264363) (not b!264197) (not b!264568) (not b!263838) (not d!63905) (not d!63503) (not d!63589) (not d!64037) (not d!63925) (not d!63763) (not b!264381) (not bm!25282) (not d!63527) (not b_lambda!8409) (not bm!25268) (not b!263966) (not b!264605) (not b!263805) (not b!264169) (not b!264255) (not b!264226) (not b!264565) (not b!263833) (not b!264585) (not b!263782) (not b!264172) (not b!264544) (not d!63479) (not d!63491) (not b!263848) (not b!264053) (not b!263860) (not d!64133) (not b!264273) (not d!63549) (not d!64135) (not d!64041) (not d!63749) (not b!264520) (not b!264222) (not b!264193) (not d!63577) (not b!264503) (not d!63557) (not b!263892) (not b!264386) (not bm!25271) (not b!264514) (not b!264349) (not b!263873) (not b!263871) (not b!264406) (not b!264319) (not d!63941) (not b!264442) (not d!63757) (not d!63477) (not d!64069) (not b!264392) (not b!264472) (not b!263884) (not d!63797) (not bm!25276) (not b!264109) (not bm!25290) (not b!264355) (not b!264368) (not b!264608) (not b_lambda!8405) (not b!263937) (not d!63533) (not b!264589) (not d!63891) (not b!264523) (not b_lambda!8399) (not d!63561) (not b!264508) (not b!264007) (not b!264552) (not d!63635) (not bm!25279) (not d!64045) (not b!264108) (not d!63983) (not b!264001) (not d!63979) (not d!63547) (not b!264267) (not b!264600) (not d!63681) (not d!63579) (not b!264391) (not b!264469) (not b!264318) (not b!264322) (not d!64085) (not b!263868) (not d!63817) (not bm!25250) (not b!264074) (not b!264498) (not b!263791) (not b!264297) b_and!13985 (not b!263983) (not b!264494) (not d!63907) (not b!264024) (not b!264061) (not b!264486) (not d!64073) (not b!264257) (not b!264205) (not d!63969) (not d!63881) (not d!64101) (not bm!25241) (not b!264340) (not b!264096) (not b!264533) (not b!263823) (not b!264575) (not d!63473) (not d!63911) (not d!63541) (not b!264444) (not d!63481) (not b!264069) (not d!64039) (not b!264219) (not b!264459) (not b!263977) (not b!264166) (not b!264527) (not d!63739) (not b!264343) (not d!64047) (not d!63971) (not d!63735) (not d!63879) (not b!263940) (not b!263923) (not b!263785) (not b!264018) (not d!63499) (not b!264261) (not b!263973) (not b!263802) (not b!264235) (not b!263946) (not d!63865) (not b!264320) (not b!264291) (not b!264370) (not b!264213) (not d!63609) (not b!264016) (not b_lambda!8411) (not b!264353) (not d!63897) (not d!63719) (not b!264439) (not b!264453) (not d!64027) (not d!63571) (not b!264351) (not d!64057) (not b!264122) (not bm!25273) (not b!264548) (not b!263878) (not b!264362) (not b!263956) (not b!264041) (not b_lambda!8357) (not b!264535) (not b!263875) (not bm!25288) (not mapNonEmpty!11358) (not b!264178) (not b!263815) (not d!63993) (not d!63623) (not b!264071) (not b!264105) (not d!64019) (not b!264097) (not d!64109) (not b!263784) (not b!264248) (not b!263876) (not b!263949) (not b!264189) (not b!264501) (not b!264470) (not b!264375) (not b!264594) (not b!264332) (not b!263813) (not d!63747) (not b!264265) (not b!264342) (not d!64017) (not b!264194) (not b!264373) (not b!264038) (not b!264417) (not d!63781) (not b_lambda!8381) (not b!263766) (not d!63975) (not d!63789) (not d!63651) (not b!264130) (not b!264217) (not b!263810) (not d!63851) (not d!63919) (not b!264060) (not b_lambda!8397) (not d!63801) (not b!264090) (not bm!25254) (not d!64053) (not b!263928) (not d!63687) (not b!264327) (not b!264307) (not d!63943) (not b!263776) (not b!264537) (not b!264384) (not b!263986) (not d!63695) (not d!64061) (not b!263895) (not b!264528) (not d!63663) (not b!263968) (not bm!25247) (not b!263902) (not b!263985) (not d!63841) (not b!264167) (not bm!25236) (not b!263991) (not b!264127) (not b!263929) (not d!63949) (not b!263765) (not b!263795) (not b!264587) (not d!63575) (not d!63517) (not b!263908) tp_is_empty!6655 (not d!63679) (not b!264591) (not d!63667) (not bm!25255) (not b!264529) (not d!63899) (not b!264014) (not b!264133) (not b!264573) (not b!264491) (not b!264275) (not b!264615) (not b!263857) (not b!264558) (not b!263845) (not b!264473) (not d!63615) (not b!264204) (not b!264224) (not b!263850) (not b!264365) (not b!264292) (not d!64099))
(check-sat b_and!13985 (not b_next!6793))
