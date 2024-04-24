; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22208 () Bool)

(assert start!22208)

(declare-fun b!232878 () Bool)

(declare-fun b_free!6271 () Bool)

(declare-fun b_next!6271 () Bool)

(assert (=> b!232878 (= b_free!6271 (not b_next!6271))))

(declare-fun tp!21955 () Bool)

(declare-fun b_and!13183 () Bool)

(assert (=> b!232878 (= tp!21955 b_and!13183)))

(declare-fun bm!21632 () Bool)

(declare-datatypes ((SeekEntryResult!938 0))(
  ( (MissingZero!938 (index!5922 (_ BitVec 32))) (Found!938 (index!5923 (_ BitVec 32))) (Intermediate!938 (undefined!1750 Bool) (index!5924 (_ BitVec 32)) (x!23550 (_ BitVec 32))) (Undefined!938) (MissingVacant!938 (index!5925 (_ BitVec 32))) )
))
(declare-fun lt!117802 () SeekEntryResult!938)

(declare-datatypes ((V!7825 0))(
  ( (V!7826 (val!3111 Int)) )
))
(declare-datatypes ((ValueCell!2723 0))(
  ( (ValueCellFull!2723 (v!5132 V!7825)) (EmptyCell!2723) )
))
(declare-datatypes ((array!11507 0))(
  ( (array!11508 (arr!5473 (Array (_ BitVec 32) ValueCell!2723)) (size!5806 (_ BitVec 32))) )
))
(declare-datatypes ((array!11509 0))(
  ( (array!11510 (arr!5474 (Array (_ BitVec 32) (_ BitVec 64))) (size!5807 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3346 0))(
  ( (LongMapFixedSize!3347 (defaultEntry!4332 Int) (mask!10250 (_ BitVec 32)) (extraKeys!4069 (_ BitVec 32)) (zeroValue!4173 V!7825) (minValue!4173 V!7825) (_size!1722 (_ BitVec 32)) (_keys!6386 array!11509) (_values!4315 array!11507) (_vacant!1722 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3346)

(declare-fun c!38736 () Bool)

(declare-fun call!21636 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21632 (= call!21636 (inRange!0 (ite c!38736 (index!5922 lt!117802) (index!5925 lt!117802)) (mask!10250 thiss!1504)))))

(declare-fun b!232858 () Bool)

(declare-datatypes ((Unit!7184 0))(
  ( (Unit!7185) )
))
(declare-fun e!151235 () Unit!7184)

(declare-fun lt!117807 () Unit!7184)

(assert (=> b!232858 (= e!151235 lt!117807)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!312 (array!11509 array!11507 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 64) Int) Unit!7184)

(assert (=> b!232858 (= lt!117807 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!312 (_keys!6386 thiss!1504) (_values!4315 thiss!1504) (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) key!932 (defaultEntry!4332 thiss!1504)))))

(get-info :version)

(assert (=> b!232858 (= c!38736 ((_ is MissingZero!938) lt!117802))))

(declare-fun e!151244 () Bool)

(assert (=> b!232858 e!151244))

(declare-fun bm!21633 () Bool)

(declare-fun call!21635 () Bool)

(declare-fun arrayContainsKey!0 (array!11509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21633 (= call!21635 (arrayContainsKey!0 (_keys!6386 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232859 () Bool)

(declare-fun e!151242 () Bool)

(assert (=> b!232859 (= e!151242 ((_ is Undefined!938) lt!117802))))

(declare-fun res!114316 () Bool)

(declare-fun e!151236 () Bool)

(assert (=> start!22208 (=> (not res!114316) (not e!151236))))

(declare-fun valid!1339 (LongMapFixedSize!3346) Bool)

(assert (=> start!22208 (= res!114316 (valid!1339 thiss!1504))))

(assert (=> start!22208 e!151236))

(declare-fun e!151243 () Bool)

(assert (=> start!22208 e!151243))

(assert (=> start!22208 true))

(declare-fun tp_is_empty!6133 () Bool)

(assert (=> start!22208 tp_is_empty!6133))

(declare-fun b!232860 () Bool)

(declare-fun res!114320 () Bool)

(declare-fun e!151233 () Bool)

(assert (=> b!232860 (=> (not res!114320) (not e!151233))))

(assert (=> b!232860 (= res!114320 (= (select (arr!5474 (_keys!6386 thiss!1504)) (index!5922 lt!117802)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!232861 () Bool)

(declare-fun Unit!7186 () Unit!7184)

(assert (=> b!232861 (= e!151235 Unit!7186)))

(declare-fun lt!117804 () Unit!7184)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!318 (array!11509 array!11507 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 64) Int) Unit!7184)

(assert (=> b!232861 (= lt!117804 (lemmaInListMapThenSeekEntryOrOpenFindsIt!318 (_keys!6386 thiss!1504) (_values!4315 thiss!1504) (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) key!932 (defaultEntry!4332 thiss!1504)))))

(assert (=> b!232861 false))

(declare-fun b!232862 () Bool)

(declare-fun e!151240 () Bool)

(declare-fun e!151232 () Bool)

(assert (=> b!232862 (= e!151240 e!151232)))

(declare-fun res!114314 () Bool)

(assert (=> b!232862 (=> (not res!114314) (not e!151232))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!232862 (= res!114314 (inRange!0 index!297 (mask!10250 thiss!1504)))))

(declare-fun lt!117800 () Unit!7184)

(assert (=> b!232862 (= lt!117800 e!151235)))

(declare-fun c!38734 () Bool)

(declare-datatypes ((tuple2!4522 0))(
  ( (tuple2!4523 (_1!2272 (_ BitVec 64)) (_2!2272 V!7825)) )
))
(declare-datatypes ((List!3431 0))(
  ( (Nil!3428) (Cons!3427 (h!4075 tuple2!4522) (t!8382 List!3431)) )
))
(declare-datatypes ((ListLongMap!3437 0))(
  ( (ListLongMap!3438 (toList!1734 List!3431)) )
))
(declare-fun lt!117793 () ListLongMap!3437)

(declare-fun contains!1616 (ListLongMap!3437 (_ BitVec 64)) Bool)

(assert (=> b!232862 (= c!38734 (contains!1616 lt!117793 key!932))))

(declare-fun getCurrentListMap!1266 (array!11509 array!11507 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 32) Int) ListLongMap!3437)

(assert (=> b!232862 (= lt!117793 (getCurrentListMap!1266 (_keys!6386 thiss!1504) (_values!4315 thiss!1504) (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4332 thiss!1504)))))

(declare-fun b!232863 () Bool)

(assert (=> b!232863 (= e!151236 e!151240)))

(declare-fun res!114317 () Bool)

(assert (=> b!232863 (=> (not res!114317) (not e!151240))))

(assert (=> b!232863 (= res!114317 (or (= lt!117802 (MissingZero!938 index!297)) (= lt!117802 (MissingVacant!938 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11509 (_ BitVec 32)) SeekEntryResult!938)

(assert (=> b!232863 (= lt!117802 (seekEntryOrOpen!0 key!932 (_keys!6386 thiss!1504) (mask!10250 thiss!1504)))))

(declare-fun b!232864 () Bool)

(declare-fun res!114321 () Bool)

(assert (=> b!232864 (=> (not res!114321) (not e!151236))))

(assert (=> b!232864 (= res!114321 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232865 () Bool)

(declare-fun res!114315 () Bool)

(assert (=> b!232865 (= res!114315 (= (select (arr!5474 (_keys!6386 thiss!1504)) (index!5925 lt!117802)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151238 () Bool)

(assert (=> b!232865 (=> (not res!114315) (not e!151238))))

(declare-fun b!232866 () Bool)

(declare-fun e!151231 () Bool)

(assert (=> b!232866 (= e!151232 (not e!151231))))

(declare-fun res!114322 () Bool)

(assert (=> b!232866 (=> res!114322 e!151231)))

(declare-fun lt!117790 () LongMapFixedSize!3346)

(assert (=> b!232866 (= res!114322 (not (valid!1339 lt!117790)))))

(declare-fun lt!117806 () ListLongMap!3437)

(assert (=> b!232866 (contains!1616 lt!117806 key!932)))

(declare-fun lt!117789 () array!11509)

(declare-fun lt!117801 () Unit!7184)

(declare-fun lt!117795 () array!11507)

(declare-fun lemmaValidKeyInArrayIsInListMap!150 (array!11509 array!11507 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 32) Int) Unit!7184)

(assert (=> b!232866 (= lt!117801 (lemmaValidKeyInArrayIsInListMap!150 lt!117789 lt!117795 (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) index!297 (defaultEntry!4332 thiss!1504)))))

(assert (=> b!232866 (= lt!117790 (LongMapFixedSize!3347 (defaultEntry!4332 thiss!1504) (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) (bvadd #b00000000000000000000000000000001 (_size!1722 thiss!1504)) lt!117789 lt!117795 (_vacant!1722 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11509 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!232866 (= (arrayCountValidKeys!0 lt!117789 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!117805 () Unit!7184)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11509 (_ BitVec 32)) Unit!7184)

(assert (=> b!232866 (= lt!117805 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!117789 index!297))))

(assert (=> b!232866 (arrayContainsKey!0 lt!117789 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!117799 () Unit!7184)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11509 (_ BitVec 64) (_ BitVec 32)) Unit!7184)

(assert (=> b!232866 (= lt!117799 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!117789 key!932 index!297))))

(declare-fun lt!117808 () ListLongMap!3437)

(assert (=> b!232866 (= lt!117808 lt!117806)))

(assert (=> b!232866 (= lt!117806 (getCurrentListMap!1266 lt!117789 lt!117795 (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4332 thiss!1504)))))

(declare-fun v!346 () V!7825)

(declare-fun +!629 (ListLongMap!3437 tuple2!4522) ListLongMap!3437)

(assert (=> b!232866 (= lt!117808 (+!629 lt!117793 (tuple2!4523 key!932 v!346)))))

(assert (=> b!232866 (= lt!117795 (array!11508 (store (arr!5473 (_values!4315 thiss!1504)) index!297 (ValueCellFull!2723 v!346)) (size!5806 (_values!4315 thiss!1504))))))

(declare-fun lt!117798 () Unit!7184)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!88 (array!11509 array!11507 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 32) (_ BitVec 64) V!7825 Int) Unit!7184)

(assert (=> b!232866 (= lt!117798 (lemmaAddValidKeyToArrayThenAddPairToListMap!88 (_keys!6386 thiss!1504) (_values!4315 thiss!1504) (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) index!297 key!932 v!346 (defaultEntry!4332 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11509 (_ BitVec 32)) Bool)

(assert (=> b!232866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!117789 (mask!10250 thiss!1504))))

(declare-fun lt!117792 () Unit!7184)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11509 (_ BitVec 32) (_ BitVec 32)) Unit!7184)

(assert (=> b!232866 (= lt!117792 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6386 thiss!1504) index!297 (mask!10250 thiss!1504)))))

(assert (=> b!232866 (= (arrayCountValidKeys!0 lt!117789 #b00000000000000000000000000000000 (size!5807 (_keys!6386 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6386 thiss!1504) #b00000000000000000000000000000000 (size!5807 (_keys!6386 thiss!1504)))))))

(declare-fun lt!117791 () Unit!7184)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11509 (_ BitVec 32) (_ BitVec 64)) Unit!7184)

(assert (=> b!232866 (= lt!117791 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6386 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3432 0))(
  ( (Nil!3429) (Cons!3428 (h!4076 (_ BitVec 64)) (t!8383 List!3432)) )
))
(declare-fun arrayNoDuplicates!0 (array!11509 (_ BitVec 32) List!3432) Bool)

(assert (=> b!232866 (arrayNoDuplicates!0 lt!117789 #b00000000000000000000000000000000 Nil!3429)))

(assert (=> b!232866 (= lt!117789 (array!11510 (store (arr!5474 (_keys!6386 thiss!1504)) index!297 key!932) (size!5807 (_keys!6386 thiss!1504))))))

(declare-fun lt!117803 () Unit!7184)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11509 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3432) Unit!7184)

(assert (=> b!232866 (= lt!117803 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6386 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3429))))

(declare-fun lt!117797 () Unit!7184)

(declare-fun e!151230 () Unit!7184)

(assert (=> b!232866 (= lt!117797 e!151230)))

(declare-fun c!38737 () Bool)

(assert (=> b!232866 (= c!38737 (arrayContainsKey!0 (_keys!6386 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232867 () Bool)

(assert (=> b!232867 (= e!151242 e!151238)))

(declare-fun res!114319 () Bool)

(assert (=> b!232867 (= res!114319 call!21636)))

(assert (=> b!232867 (=> (not res!114319) (not e!151238))))

(declare-fun b!232868 () Bool)

(declare-fun Unit!7187 () Unit!7184)

(assert (=> b!232868 (= e!151230 Unit!7187)))

(declare-fun b!232869 () Bool)

(assert (=> b!232869 (= e!151231 true)))

(declare-fun lt!117794 () Bool)

(declare-fun map!2571 (LongMapFixedSize!3346) ListLongMap!3437)

(assert (=> b!232869 (= lt!117794 (contains!1616 (map!2571 lt!117790) key!932))))

(declare-fun mapNonEmpty!10369 () Bool)

(declare-fun mapRes!10369 () Bool)

(declare-fun tp!21954 () Bool)

(declare-fun e!151239 () Bool)

(assert (=> mapNonEmpty!10369 (= mapRes!10369 (and tp!21954 e!151239))))

(declare-fun mapKey!10369 () (_ BitVec 32))

(declare-fun mapRest!10369 () (Array (_ BitVec 32) ValueCell!2723))

(declare-fun mapValue!10369 () ValueCell!2723)

(assert (=> mapNonEmpty!10369 (= (arr!5473 (_values!4315 thiss!1504)) (store mapRest!10369 mapKey!10369 mapValue!10369))))

(declare-fun b!232870 () Bool)

(declare-fun res!114318 () Bool)

(assert (=> b!232870 (=> (not res!114318) (not e!151233))))

(assert (=> b!232870 (= res!114318 call!21636)))

(assert (=> b!232870 (= e!151244 e!151233)))

(declare-fun b!232871 () Bool)

(declare-fun e!151237 () Bool)

(declare-fun e!151234 () Bool)

(assert (=> b!232871 (= e!151237 (and e!151234 mapRes!10369))))

(declare-fun condMapEmpty!10369 () Bool)

(declare-fun mapDefault!10369 () ValueCell!2723)

(assert (=> b!232871 (= condMapEmpty!10369 (= (arr!5473 (_values!4315 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2723)) mapDefault!10369)))))

(declare-fun b!232872 () Bool)

(declare-fun c!38735 () Bool)

(assert (=> b!232872 (= c!38735 ((_ is MissingVacant!938) lt!117802))))

(assert (=> b!232872 (= e!151244 e!151242)))

(declare-fun b!232873 () Bool)

(assert (=> b!232873 (= e!151239 tp_is_empty!6133)))

(declare-fun mapIsEmpty!10369 () Bool)

(assert (=> mapIsEmpty!10369 mapRes!10369))

(declare-fun b!232874 () Bool)

(assert (=> b!232874 (= e!151233 (not call!21635))))

(declare-fun b!232875 () Bool)

(assert (=> b!232875 (= e!151238 (not call!21635))))

(declare-fun b!232876 () Bool)

(declare-fun Unit!7188 () Unit!7184)

(assert (=> b!232876 (= e!151230 Unit!7188)))

(declare-fun lt!117796 () Unit!7184)

(declare-fun lemmaArrayContainsKeyThenInListMap!156 (array!11509 array!11507 (_ BitVec 32) (_ BitVec 32) V!7825 V!7825 (_ BitVec 64) (_ BitVec 32) Int) Unit!7184)

(assert (=> b!232876 (= lt!117796 (lemmaArrayContainsKeyThenInListMap!156 (_keys!6386 thiss!1504) (_values!4315 thiss!1504) (mask!10250 thiss!1504) (extraKeys!4069 thiss!1504) (zeroValue!4173 thiss!1504) (minValue!4173 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4332 thiss!1504)))))

(assert (=> b!232876 false))

(declare-fun b!232877 () Bool)

(assert (=> b!232877 (= e!151234 tp_is_empty!6133)))

(declare-fun array_inv!3587 (array!11509) Bool)

(declare-fun array_inv!3588 (array!11507) Bool)

(assert (=> b!232878 (= e!151243 (and tp!21955 tp_is_empty!6133 (array_inv!3587 (_keys!6386 thiss!1504)) (array_inv!3588 (_values!4315 thiss!1504)) e!151237))))

(assert (= (and start!22208 res!114316) b!232864))

(assert (= (and b!232864 res!114321) b!232863))

(assert (= (and b!232863 res!114317) b!232862))

(assert (= (and b!232862 c!38734) b!232861))

(assert (= (and b!232862 (not c!38734)) b!232858))

(assert (= (and b!232858 c!38736) b!232870))

(assert (= (and b!232858 (not c!38736)) b!232872))

(assert (= (and b!232870 res!114318) b!232860))

(assert (= (and b!232860 res!114320) b!232874))

(assert (= (and b!232872 c!38735) b!232867))

(assert (= (and b!232872 (not c!38735)) b!232859))

(assert (= (and b!232867 res!114319) b!232865))

(assert (= (and b!232865 res!114315) b!232875))

(assert (= (or b!232870 b!232867) bm!21632))

(assert (= (or b!232874 b!232875) bm!21633))

(assert (= (and b!232862 res!114314) b!232866))

(assert (= (and b!232866 c!38737) b!232876))

(assert (= (and b!232866 (not c!38737)) b!232868))

(assert (= (and b!232866 (not res!114322)) b!232869))

(assert (= (and b!232871 condMapEmpty!10369) mapIsEmpty!10369))

(assert (= (and b!232871 (not condMapEmpty!10369)) mapNonEmpty!10369))

(assert (= (and mapNonEmpty!10369 ((_ is ValueCellFull!2723) mapValue!10369)) b!232873))

(assert (= (and b!232871 ((_ is ValueCellFull!2723) mapDefault!10369)) b!232877))

(assert (= b!232878 b!232871))

(assert (= start!22208 b!232878))

(declare-fun m!254467 () Bool)

(assert (=> bm!21633 m!254467))

(declare-fun m!254469 () Bool)

(assert (=> b!232869 m!254469))

(assert (=> b!232869 m!254469))

(declare-fun m!254471 () Bool)

(assert (=> b!232869 m!254471))

(declare-fun m!254473 () Bool)

(assert (=> b!232860 m!254473))

(declare-fun m!254475 () Bool)

(assert (=> b!232858 m!254475))

(declare-fun m!254477 () Bool)

(assert (=> b!232866 m!254477))

(assert (=> b!232866 m!254467))

(declare-fun m!254479 () Bool)

(assert (=> b!232866 m!254479))

(declare-fun m!254481 () Bool)

(assert (=> b!232866 m!254481))

(declare-fun m!254483 () Bool)

(assert (=> b!232866 m!254483))

(declare-fun m!254485 () Bool)

(assert (=> b!232866 m!254485))

(declare-fun m!254487 () Bool)

(assert (=> b!232866 m!254487))

(declare-fun m!254489 () Bool)

(assert (=> b!232866 m!254489))

(declare-fun m!254491 () Bool)

(assert (=> b!232866 m!254491))

(declare-fun m!254493 () Bool)

(assert (=> b!232866 m!254493))

(declare-fun m!254495 () Bool)

(assert (=> b!232866 m!254495))

(declare-fun m!254497 () Bool)

(assert (=> b!232866 m!254497))

(declare-fun m!254499 () Bool)

(assert (=> b!232866 m!254499))

(declare-fun m!254501 () Bool)

(assert (=> b!232866 m!254501))

(declare-fun m!254503 () Bool)

(assert (=> b!232866 m!254503))

(declare-fun m!254505 () Bool)

(assert (=> b!232866 m!254505))

(declare-fun m!254507 () Bool)

(assert (=> b!232866 m!254507))

(declare-fun m!254509 () Bool)

(assert (=> b!232866 m!254509))

(declare-fun m!254511 () Bool)

(assert (=> b!232866 m!254511))

(declare-fun m!254513 () Bool)

(assert (=> b!232866 m!254513))

(declare-fun m!254515 () Bool)

(assert (=> b!232878 m!254515))

(declare-fun m!254517 () Bool)

(assert (=> b!232878 m!254517))

(declare-fun m!254519 () Bool)

(assert (=> start!22208 m!254519))

(declare-fun m!254521 () Bool)

(assert (=> b!232861 m!254521))

(declare-fun m!254523 () Bool)

(assert (=> mapNonEmpty!10369 m!254523))

(declare-fun m!254525 () Bool)

(assert (=> bm!21632 m!254525))

(declare-fun m!254527 () Bool)

(assert (=> b!232876 m!254527))

(declare-fun m!254529 () Bool)

(assert (=> b!232865 m!254529))

(declare-fun m!254531 () Bool)

(assert (=> b!232862 m!254531))

(declare-fun m!254533 () Bool)

(assert (=> b!232862 m!254533))

(declare-fun m!254535 () Bool)

(assert (=> b!232862 m!254535))

(declare-fun m!254537 () Bool)

(assert (=> b!232863 m!254537))

(check-sat (not b!232876) (not b!232878) (not mapNonEmpty!10369) (not bm!21633) (not b!232862) (not b!232863) (not b_next!6271) (not b!232869) (not b!232861) (not b!232858) b_and!13183 (not bm!21632) tp_is_empty!6133 (not b!232866) (not start!22208))
(check-sat b_and!13183 (not b_next!6271))
