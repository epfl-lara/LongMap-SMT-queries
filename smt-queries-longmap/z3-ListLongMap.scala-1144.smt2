; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23706 () Bool)

(assert start!23706)

(declare-fun b!248895 () Bool)

(declare-fun b_free!6613 () Bool)

(declare-fun b_next!6613 () Bool)

(assert (=> b!248895 (= b_free!6613 (not b_next!6613))))

(declare-fun tp!23095 () Bool)

(declare-fun b_and!13595 () Bool)

(assert (=> b!248895 (= tp!23095 b_and!13595)))

(declare-fun b!248893 () Bool)

(declare-fun res!121933 () Bool)

(declare-fun e!161437 () Bool)

(assert (=> b!248893 (=> (not res!121933) (not e!161437))))

(declare-datatypes ((V!8281 0))(
  ( (V!8282 (val!3282 Int)) )
))
(declare-datatypes ((ValueCell!2894 0))(
  ( (ValueCellFull!2894 (v!5337 V!8281)) (EmptyCell!2894) )
))
(declare-datatypes ((array!12255 0))(
  ( (array!12256 (arr!5811 (Array (_ BitVec 32) ValueCell!2894)) (size!6155 (_ BitVec 32))) )
))
(declare-datatypes ((array!12257 0))(
  ( (array!12258 (arr!5812 (Array (_ BitVec 32) (_ BitVec 64))) (size!6156 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3688 0))(
  ( (LongMapFixedSize!3689 (defaultEntry!4605 Int) (mask!10765 (_ BitVec 32)) (extraKeys!4342 (_ BitVec 32)) (zeroValue!4446 V!8281) (minValue!4446 V!8281) (_size!1893 (_ BitVec 32)) (_keys!6732 array!12257) (_values!4588 array!12255) (_vacant!1893 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3688)

(declare-datatypes ((SeekEntryResult!1113 0))(
  ( (MissingZero!1113 (index!6622 (_ BitVec 32))) (Found!1113 (index!6623 (_ BitVec 32))) (Intermediate!1113 (undefined!1925 Bool) (index!6624 (_ BitVec 32)) (x!24610 (_ BitVec 32))) (Undefined!1113) (MissingVacant!1113 (index!6625 (_ BitVec 32))) )
))
(declare-fun lt!124552 () SeekEntryResult!1113)

(assert (=> b!248893 (= res!121933 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6622 lt!124552)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248894 () Bool)

(declare-fun call!23349 () Bool)

(assert (=> b!248894 (= e!161437 (not call!23349))))

(declare-fun mapNonEmpty!10997 () Bool)

(declare-fun mapRes!10997 () Bool)

(declare-fun tp!23096 () Bool)

(declare-fun e!161441 () Bool)

(assert (=> mapNonEmpty!10997 (= mapRes!10997 (and tp!23096 e!161441))))

(declare-fun mapKey!10997 () (_ BitVec 32))

(declare-fun mapValue!10997 () ValueCell!2894)

(declare-fun mapRest!10997 () (Array (_ BitVec 32) ValueCell!2894))

(assert (=> mapNonEmpty!10997 (= (arr!5811 (_values!4588 thiss!1504)) (store mapRest!10997 mapKey!10997 mapValue!10997))))

(declare-fun c!41729 () Bool)

(declare-fun bm!23345 () Bool)

(declare-fun call!23348 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23345 (= call!23348 (inRange!0 (ite c!41729 (index!6622 lt!124552) (index!6625 lt!124552)) (mask!10765 thiss!1504)))))

(declare-fun mapIsEmpty!10997 () Bool)

(assert (=> mapIsEmpty!10997 mapRes!10997))

(declare-fun b!248896 () Bool)

(declare-fun e!161427 () Bool)

(declare-fun e!161438 () Bool)

(assert (=> b!248896 (= e!161427 e!161438)))

(declare-fun res!121929 () Bool)

(assert (=> b!248896 (=> (not res!121929) (not e!161438))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!248896 (= res!121929 (inRange!0 index!297 (mask!10765 thiss!1504)))))

(declare-datatypes ((Unit!7693 0))(
  ( (Unit!7694) )
))
(declare-fun lt!124556 () Unit!7693)

(declare-fun e!161434 () Unit!7693)

(assert (=> b!248896 (= lt!124556 e!161434)))

(declare-fun c!41730 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4796 0))(
  ( (tuple2!4797 (_1!2409 (_ BitVec 64)) (_2!2409 V!8281)) )
))
(declare-datatypes ((List!3697 0))(
  ( (Nil!3694) (Cons!3693 (h!4351 tuple2!4796) (t!8717 List!3697)) )
))
(declare-datatypes ((ListLongMap!3699 0))(
  ( (ListLongMap!3700 (toList!1865 List!3697)) )
))
(declare-fun contains!1787 (ListLongMap!3699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1374 (array!12257 array!12255 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 32) Int) ListLongMap!3699)

(assert (=> b!248896 (= c!41730 (contains!1787 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) key!932))))

(declare-fun b!248897 () Bool)

(declare-fun e!161439 () Bool)

(declare-fun e!161430 () Bool)

(assert (=> b!248897 (= e!161439 e!161430)))

(declare-fun res!121930 () Bool)

(assert (=> b!248897 (= res!121930 call!23348)))

(assert (=> b!248897 (=> (not res!121930) (not e!161430))))

(declare-fun b!248898 () Bool)

(declare-fun tp_is_empty!6475 () Bool)

(assert (=> b!248898 (= e!161441 tp_is_empty!6475)))

(declare-fun b!248899 () Bool)

(assert (=> b!248899 (= e!161430 (not call!23349))))

(declare-fun b!248900 () Bool)

(declare-fun c!41731 () Bool)

(get-info :version)

(assert (=> b!248900 (= c!41731 ((_ is MissingVacant!1113) lt!124552))))

(declare-fun e!161432 () Bool)

(assert (=> b!248900 (= e!161432 e!161439)))

(declare-fun b!248901 () Bool)

(declare-fun e!161433 () Bool)

(assert (=> b!248901 (= e!161433 tp_is_empty!6475)))

(declare-fun b!248902 () Bool)

(declare-fun e!161429 () Bool)

(assert (=> b!248902 (= e!161429 (and e!161433 mapRes!10997))))

(declare-fun condMapEmpty!10997 () Bool)

(declare-fun mapDefault!10997 () ValueCell!2894)

(assert (=> b!248902 (= condMapEmpty!10997 (= (arr!5811 (_values!4588 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2894)) mapDefault!10997)))))

(declare-fun b!248903 () Bool)

(assert (=> b!248903 (= e!161439 ((_ is Undefined!1113) lt!124552))))

(declare-fun b!248904 () Bool)

(declare-fun res!121935 () Bool)

(assert (=> b!248904 (= res!121935 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6625 lt!124552)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248904 (=> (not res!121935) (not e!161430))))

(declare-fun b!248905 () Bool)

(declare-fun res!121932 () Bool)

(declare-fun e!161431 () Bool)

(assert (=> b!248905 (=> (not res!121932) (not e!161431))))

(assert (=> b!248905 (= res!121932 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!161428 () Bool)

(declare-fun array_inv!3833 (array!12257) Bool)

(declare-fun array_inv!3834 (array!12255) Bool)

(assert (=> b!248895 (= e!161428 (and tp!23095 tp_is_empty!6475 (array_inv!3833 (_keys!6732 thiss!1504)) (array_inv!3834 (_values!4588 thiss!1504)) e!161429))))

(declare-fun res!121936 () Bool)

(assert (=> start!23706 (=> (not res!121936) (not e!161431))))

(declare-fun valid!1448 (LongMapFixedSize!3688) Bool)

(assert (=> start!23706 (= res!121936 (valid!1448 thiss!1504))))

(assert (=> start!23706 e!161431))

(assert (=> start!23706 e!161428))

(assert (=> start!23706 true))

(declare-fun bm!23346 () Bool)

(declare-fun arrayContainsKey!0 (array!12257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23346 (= call!23349 (arrayContainsKey!0 (_keys!6732 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248906 () Bool)

(declare-fun e!161435 () Bool)

(assert (=> b!248906 (= e!161435 (= (size!6155 (_values!4588 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10765 thiss!1504))))))

(declare-fun b!248907 () Bool)

(assert (=> b!248907 (= e!161431 e!161427)))

(declare-fun res!121931 () Bool)

(assert (=> b!248907 (=> (not res!121931) (not e!161427))))

(assert (=> b!248907 (= res!121931 (or (= lt!124552 (MissingZero!1113 index!297)) (= lt!124552 (MissingVacant!1113 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12257 (_ BitVec 32)) SeekEntryResult!1113)

(assert (=> b!248907 (= lt!124552 (seekEntryOrOpen!0 key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(declare-fun b!248908 () Bool)

(declare-fun lt!124549 () Unit!7693)

(assert (=> b!248908 (= e!161434 lt!124549)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!393 (array!12257 array!12255 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) Int) Unit!7693)

(assert (=> b!248908 (= lt!124549 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!393 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)))))

(assert (=> b!248908 (= c!41729 ((_ is MissingZero!1113) lt!124552))))

(assert (=> b!248908 e!161432))

(declare-fun b!248909 () Bool)

(declare-fun e!161440 () Unit!7693)

(declare-fun Unit!7695 () Unit!7693)

(assert (=> b!248909 (= e!161440 Unit!7695)))

(declare-fun lt!124554 () Unit!7693)

(declare-fun lemmaArrayContainsKeyThenInListMap!203 (array!12257 array!12255 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) (_ BitVec 32) Int) Unit!7693)

(assert (=> b!248909 (= lt!124554 (lemmaArrayContainsKeyThenInListMap!203 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(assert (=> b!248909 false))

(declare-fun b!248910 () Bool)

(declare-fun Unit!7696 () Unit!7693)

(assert (=> b!248910 (= e!161440 Unit!7696)))

(declare-fun b!248911 () Bool)

(assert (=> b!248911 (= e!161438 (not e!161435))))

(declare-fun res!121937 () Bool)

(assert (=> b!248911 (=> res!121937 e!161435)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!248911 (= res!121937 (not (validMask!0 (mask!10765 thiss!1504))))))

(declare-fun lt!124553 () array!12257)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12257 (_ BitVec 32)) Bool)

(assert (=> b!248911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124553 (mask!10765 thiss!1504))))

(declare-fun lt!124555 () Unit!7693)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12257 (_ BitVec 32) (_ BitVec 32)) Unit!7693)

(assert (=> b!248911 (= lt!124555 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6732 thiss!1504) index!297 (mask!10765 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12257 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!248911 (= (arrayCountValidKeys!0 lt!124553 #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6732 thiss!1504) #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504)))))))

(declare-fun lt!124551 () Unit!7693)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12257 (_ BitVec 32) (_ BitVec 64)) Unit!7693)

(assert (=> b!248911 (= lt!124551 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6732 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3698 0))(
  ( (Nil!3695) (Cons!3694 (h!4352 (_ BitVec 64)) (t!8718 List!3698)) )
))
(declare-fun arrayNoDuplicates!0 (array!12257 (_ BitVec 32) List!3698) Bool)

(assert (=> b!248911 (arrayNoDuplicates!0 lt!124553 #b00000000000000000000000000000000 Nil!3695)))

(assert (=> b!248911 (= lt!124553 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun lt!124548 () Unit!7693)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3698) Unit!7693)

(assert (=> b!248911 (= lt!124548 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6732 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3695))))

(declare-fun lt!124550 () Unit!7693)

(assert (=> b!248911 (= lt!124550 e!161440)))

(declare-fun c!41728 () Bool)

(assert (=> b!248911 (= c!41728 (arrayContainsKey!0 (_keys!6732 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248912 () Bool)

(declare-fun res!121934 () Bool)

(assert (=> b!248912 (=> (not res!121934) (not e!161437))))

(assert (=> b!248912 (= res!121934 call!23348)))

(assert (=> b!248912 (= e!161432 e!161437)))

(declare-fun b!248913 () Bool)

(declare-fun Unit!7697 () Unit!7693)

(assert (=> b!248913 (= e!161434 Unit!7697)))

(declare-fun lt!124547 () Unit!7693)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!395 (array!12257 array!12255 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) Int) Unit!7693)

(assert (=> b!248913 (= lt!124547 (lemmaInListMapThenSeekEntryOrOpenFindsIt!395 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)))))

(assert (=> b!248913 false))

(assert (= (and start!23706 res!121936) b!248905))

(assert (= (and b!248905 res!121932) b!248907))

(assert (= (and b!248907 res!121931) b!248896))

(assert (= (and b!248896 c!41730) b!248913))

(assert (= (and b!248896 (not c!41730)) b!248908))

(assert (= (and b!248908 c!41729) b!248912))

(assert (= (and b!248908 (not c!41729)) b!248900))

(assert (= (and b!248912 res!121934) b!248893))

(assert (= (and b!248893 res!121933) b!248894))

(assert (= (and b!248900 c!41731) b!248897))

(assert (= (and b!248900 (not c!41731)) b!248903))

(assert (= (and b!248897 res!121930) b!248904))

(assert (= (and b!248904 res!121935) b!248899))

(assert (= (or b!248912 b!248897) bm!23345))

(assert (= (or b!248894 b!248899) bm!23346))

(assert (= (and b!248896 res!121929) b!248911))

(assert (= (and b!248911 c!41728) b!248909))

(assert (= (and b!248911 (not c!41728)) b!248910))

(assert (= (and b!248911 (not res!121937)) b!248906))

(assert (= (and b!248902 condMapEmpty!10997) mapIsEmpty!10997))

(assert (= (and b!248902 (not condMapEmpty!10997)) mapNonEmpty!10997))

(assert (= (and mapNonEmpty!10997 ((_ is ValueCellFull!2894) mapValue!10997)) b!248898))

(assert (= (and b!248902 ((_ is ValueCellFull!2894) mapDefault!10997)) b!248901))

(assert (= b!248895 b!248902))

(assert (= start!23706 b!248895))

(declare-fun m!264997 () Bool)

(assert (=> start!23706 m!264997))

(declare-fun m!264999 () Bool)

(assert (=> bm!23346 m!264999))

(declare-fun m!265001 () Bool)

(assert (=> mapNonEmpty!10997 m!265001))

(declare-fun m!265003 () Bool)

(assert (=> b!248895 m!265003))

(declare-fun m!265005 () Bool)

(assert (=> b!248895 m!265005))

(declare-fun m!265007 () Bool)

(assert (=> b!248909 m!265007))

(declare-fun m!265009 () Bool)

(assert (=> b!248911 m!265009))

(assert (=> b!248911 m!264999))

(declare-fun m!265011 () Bool)

(assert (=> b!248911 m!265011))

(declare-fun m!265013 () Bool)

(assert (=> b!248911 m!265013))

(declare-fun m!265015 () Bool)

(assert (=> b!248911 m!265015))

(declare-fun m!265017 () Bool)

(assert (=> b!248911 m!265017))

(declare-fun m!265019 () Bool)

(assert (=> b!248911 m!265019))

(declare-fun m!265021 () Bool)

(assert (=> b!248911 m!265021))

(declare-fun m!265023 () Bool)

(assert (=> b!248911 m!265023))

(declare-fun m!265025 () Bool)

(assert (=> b!248911 m!265025))

(declare-fun m!265027 () Bool)

(assert (=> b!248907 m!265027))

(declare-fun m!265029 () Bool)

(assert (=> b!248904 m!265029))

(declare-fun m!265031 () Bool)

(assert (=> b!248908 m!265031))

(declare-fun m!265033 () Bool)

(assert (=> b!248893 m!265033))

(declare-fun m!265035 () Bool)

(assert (=> bm!23345 m!265035))

(declare-fun m!265037 () Bool)

(assert (=> b!248896 m!265037))

(declare-fun m!265039 () Bool)

(assert (=> b!248896 m!265039))

(assert (=> b!248896 m!265039))

(declare-fun m!265041 () Bool)

(assert (=> b!248896 m!265041))

(declare-fun m!265043 () Bool)

(assert (=> b!248913 m!265043))

(check-sat (not b!248913) (not b!248908) (not bm!23346) (not bm!23345) (not b!248911) (not mapNonEmpty!10997) (not b!248909) (not b_next!6613) tp_is_empty!6475 (not b!248896) (not b!248907) (not b!248895) b_and!13595 (not start!23706))
(check-sat b_and!13595 (not b_next!6613))
(get-model)

(declare-fun d!60463 () Bool)

(assert (=> d!60463 (= (array_inv!3833 (_keys!6732 thiss!1504)) (bvsge (size!6156 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248895 d!60463))

(declare-fun d!60465 () Bool)

(assert (=> d!60465 (= (array_inv!3834 (_values!4588 thiss!1504)) (bvsge (size!6155 (_values!4588 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!248895 d!60465))

(declare-fun d!60467 () Bool)

(assert (=> d!60467 (contains!1787 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) key!932)))

(declare-fun lt!124619 () Unit!7693)

(declare-fun choose!1180 (array!12257 array!12255 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) (_ BitVec 32) Int) Unit!7693)

(assert (=> d!60467 (= lt!124619 (choose!1180 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(assert (=> d!60467 (validMask!0 (mask!10765 thiss!1504))))

(assert (=> d!60467 (= (lemmaArrayContainsKeyThenInListMap!203 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) lt!124619)))

(declare-fun bs!8918 () Bool)

(assert (= bs!8918 d!60467))

(assert (=> bs!8918 m!265039))

(assert (=> bs!8918 m!265039))

(assert (=> bs!8918 m!265041))

(declare-fun m!265141 () Bool)

(assert (=> bs!8918 m!265141))

(assert (=> bs!8918 m!265009))

(assert (=> b!248909 d!60467))

(declare-fun b!249056 () Bool)

(declare-fun e!161540 () Bool)

(declare-fun lt!124625 () SeekEntryResult!1113)

(assert (=> b!249056 (= e!161540 ((_ is Undefined!1113) lt!124625))))

(declare-fun b!249057 () Bool)

(declare-fun res!122001 () Bool)

(declare-fun e!161541 () Bool)

(assert (=> b!249057 (=> (not res!122001) (not e!161541))))

(declare-fun call!23366 () Bool)

(assert (=> b!249057 (= res!122001 call!23366)))

(assert (=> b!249057 (= e!161540 e!161541)))

(declare-fun bm!23363 () Bool)

(declare-fun c!41761 () Bool)

(assert (=> bm!23363 (= call!23366 (inRange!0 (ite c!41761 (index!6622 lt!124625) (index!6625 lt!124625)) (mask!10765 thiss!1504)))))

(declare-fun b!249058 () Bool)

(declare-fun call!23367 () Bool)

(assert (=> b!249058 (= e!161541 (not call!23367))))

(declare-fun b!249059 () Bool)

(declare-fun e!161542 () Bool)

(assert (=> b!249059 (= e!161542 e!161540)))

(declare-fun c!41760 () Bool)

(assert (=> b!249059 (= c!41760 ((_ is MissingVacant!1113) lt!124625))))

(declare-fun b!249060 () Bool)

(declare-fun res!122000 () Bool)

(assert (=> b!249060 (=> (not res!122000) (not e!161541))))

(assert (=> b!249060 (= res!122000 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6625 lt!124625)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249060 (and (bvsge (index!6625 lt!124625) #b00000000000000000000000000000000) (bvslt (index!6625 lt!124625) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249061 () Bool)

(assert (=> b!249061 (and (bvsge (index!6622 lt!124625) #b00000000000000000000000000000000) (bvslt (index!6622 lt!124625) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun res!122002 () Bool)

(assert (=> b!249061 (= res!122002 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6622 lt!124625)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161543 () Bool)

(assert (=> b!249061 (=> (not res!122002) (not e!161543))))

(declare-fun b!249062 () Bool)

(assert (=> b!249062 (= e!161543 (not call!23367))))

(declare-fun b!249063 () Bool)

(assert (=> b!249063 (= e!161542 e!161543)))

(declare-fun res!122003 () Bool)

(assert (=> b!249063 (= res!122003 call!23366)))

(assert (=> b!249063 (=> (not res!122003) (not e!161543))))

(declare-fun bm!23364 () Bool)

(assert (=> bm!23364 (= call!23367 (arrayContainsKey!0 (_keys!6732 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun d!60469 () Bool)

(assert (=> d!60469 e!161542))

(assert (=> d!60469 (= c!41761 ((_ is MissingZero!1113) lt!124625))))

(assert (=> d!60469 (= lt!124625 (seekEntryOrOpen!0 key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(declare-fun lt!124624 () Unit!7693)

(declare-fun choose!1181 (array!12257 array!12255 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) Int) Unit!7693)

(assert (=> d!60469 (= lt!124624 (choose!1181 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)))))

(assert (=> d!60469 (validMask!0 (mask!10765 thiss!1504))))

(assert (=> d!60469 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!393 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)) lt!124624)))

(assert (= (and d!60469 c!41761) b!249063))

(assert (= (and d!60469 (not c!41761)) b!249059))

(assert (= (and b!249063 res!122003) b!249061))

(assert (= (and b!249061 res!122002) b!249062))

(assert (= (and b!249059 c!41760) b!249057))

(assert (= (and b!249059 (not c!41760)) b!249056))

(assert (= (and b!249057 res!122001) b!249060))

(assert (= (and b!249060 res!122000) b!249058))

(assert (= (or b!249063 b!249057) bm!23363))

(assert (= (or b!249062 b!249058) bm!23364))

(declare-fun m!265143 () Bool)

(assert (=> b!249061 m!265143))

(declare-fun m!265145 () Bool)

(assert (=> b!249060 m!265145))

(declare-fun m!265147 () Bool)

(assert (=> bm!23363 m!265147))

(assert (=> d!60469 m!265027))

(declare-fun m!265149 () Bool)

(assert (=> d!60469 m!265149))

(assert (=> d!60469 m!265009))

(assert (=> bm!23364 m!264999))

(assert (=> b!248908 d!60469))

(declare-fun d!60471 () Bool)

(assert (=> d!60471 (= (inRange!0 (ite c!41729 (index!6622 lt!124552) (index!6625 lt!124552)) (mask!10765 thiss!1504)) (and (bvsge (ite c!41729 (index!6622 lt!124552) (index!6625 lt!124552)) #b00000000000000000000000000000000) (bvslt (ite c!41729 (index!6622 lt!124552) (index!6625 lt!124552)) (bvadd (mask!10765 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23345 d!60471))

(declare-fun d!60473 () Bool)

(declare-fun e!161546 () Bool)

(assert (=> d!60473 e!161546))

(declare-fun res!122009 () Bool)

(assert (=> d!60473 (=> (not res!122009) (not e!161546))))

(declare-fun lt!124631 () SeekEntryResult!1113)

(assert (=> d!60473 (= res!122009 ((_ is Found!1113) lt!124631))))

(assert (=> d!60473 (= lt!124631 (seekEntryOrOpen!0 key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(declare-fun lt!124630 () Unit!7693)

(declare-fun choose!1182 (array!12257 array!12255 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 64) Int) Unit!7693)

(assert (=> d!60473 (= lt!124630 (choose!1182 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)))))

(assert (=> d!60473 (validMask!0 (mask!10765 thiss!1504))))

(assert (=> d!60473 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!395 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)) lt!124630)))

(declare-fun b!249068 () Bool)

(declare-fun res!122008 () Bool)

(assert (=> b!249068 (=> (not res!122008) (not e!161546))))

(assert (=> b!249068 (= res!122008 (inRange!0 (index!6623 lt!124631) (mask!10765 thiss!1504)))))

(declare-fun b!249069 () Bool)

(assert (=> b!249069 (= e!161546 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6623 lt!124631)) key!932))))

(assert (=> b!249069 (and (bvsge (index!6623 lt!124631) #b00000000000000000000000000000000) (bvslt (index!6623 lt!124631) (size!6156 (_keys!6732 thiss!1504))))))

(assert (= (and d!60473 res!122009) b!249068))

(assert (= (and b!249068 res!122008) b!249069))

(assert (=> d!60473 m!265027))

(declare-fun m!265151 () Bool)

(assert (=> d!60473 m!265151))

(assert (=> d!60473 m!265009))

(declare-fun m!265153 () Bool)

(assert (=> b!249068 m!265153))

(declare-fun m!265155 () Bool)

(assert (=> b!249069 m!265155))

(assert (=> b!248913 d!60473))

(declare-fun b!249082 () Bool)

(declare-fun e!161555 () SeekEntryResult!1113)

(assert (=> b!249082 (= e!161555 Undefined!1113)))

(declare-fun b!249083 () Bool)

(declare-fun e!161553 () SeekEntryResult!1113)

(declare-fun lt!124639 () SeekEntryResult!1113)

(assert (=> b!249083 (= e!161553 (MissingZero!1113 (index!6624 lt!124639)))))

(declare-fun b!249084 () Bool)

(declare-fun c!41769 () Bool)

(declare-fun lt!124640 () (_ BitVec 64))

(assert (=> b!249084 (= c!41769 (= lt!124640 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161554 () SeekEntryResult!1113)

(assert (=> b!249084 (= e!161554 e!161553)))

(declare-fun b!249085 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12257 (_ BitVec 32)) SeekEntryResult!1113)

(assert (=> b!249085 (= e!161553 (seekKeyOrZeroReturnVacant!0 (x!24610 lt!124639) (index!6624 lt!124639) (index!6624 lt!124639) key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(declare-fun b!249086 () Bool)

(assert (=> b!249086 (= e!161555 e!161554)))

(assert (=> b!249086 (= lt!124640 (select (arr!5812 (_keys!6732 thiss!1504)) (index!6624 lt!124639)))))

(declare-fun c!41768 () Bool)

(assert (=> b!249086 (= c!41768 (= lt!124640 key!932))))

(declare-fun d!60475 () Bool)

(declare-fun lt!124638 () SeekEntryResult!1113)

(assert (=> d!60475 (and (or ((_ is Undefined!1113) lt!124638) (not ((_ is Found!1113) lt!124638)) (and (bvsge (index!6623 lt!124638) #b00000000000000000000000000000000) (bvslt (index!6623 lt!124638) (size!6156 (_keys!6732 thiss!1504))))) (or ((_ is Undefined!1113) lt!124638) ((_ is Found!1113) lt!124638) (not ((_ is MissingZero!1113) lt!124638)) (and (bvsge (index!6622 lt!124638) #b00000000000000000000000000000000) (bvslt (index!6622 lt!124638) (size!6156 (_keys!6732 thiss!1504))))) (or ((_ is Undefined!1113) lt!124638) ((_ is Found!1113) lt!124638) ((_ is MissingZero!1113) lt!124638) (not ((_ is MissingVacant!1113) lt!124638)) (and (bvsge (index!6625 lt!124638) #b00000000000000000000000000000000) (bvslt (index!6625 lt!124638) (size!6156 (_keys!6732 thiss!1504))))) (or ((_ is Undefined!1113) lt!124638) (ite ((_ is Found!1113) lt!124638) (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6623 lt!124638)) key!932) (ite ((_ is MissingZero!1113) lt!124638) (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6622 lt!124638)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1113) lt!124638) (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6625 lt!124638)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60475 (= lt!124638 e!161555)))

(declare-fun c!41770 () Bool)

(assert (=> d!60475 (= c!41770 (and ((_ is Intermediate!1113) lt!124639) (undefined!1925 lt!124639)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12257 (_ BitVec 32)) SeekEntryResult!1113)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60475 (= lt!124639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10765 thiss!1504)) key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(assert (=> d!60475 (validMask!0 (mask!10765 thiss!1504))))

(assert (=> d!60475 (= (seekEntryOrOpen!0 key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)) lt!124638)))

(declare-fun b!249087 () Bool)

(assert (=> b!249087 (= e!161554 (Found!1113 (index!6624 lt!124639)))))

(assert (= (and d!60475 c!41770) b!249082))

(assert (= (and d!60475 (not c!41770)) b!249086))

(assert (= (and b!249086 c!41768) b!249087))

(assert (= (and b!249086 (not c!41768)) b!249084))

(assert (= (and b!249084 c!41769) b!249083))

(assert (= (and b!249084 (not c!41769)) b!249085))

(declare-fun m!265157 () Bool)

(assert (=> b!249085 m!265157))

(declare-fun m!265159 () Bool)

(assert (=> b!249086 m!265159))

(declare-fun m!265161 () Bool)

(assert (=> d!60475 m!265161))

(declare-fun m!265163 () Bool)

(assert (=> d!60475 m!265163))

(declare-fun m!265165 () Bool)

(assert (=> d!60475 m!265165))

(assert (=> d!60475 m!265009))

(assert (=> d!60475 m!265163))

(declare-fun m!265167 () Bool)

(assert (=> d!60475 m!265167))

(declare-fun m!265169 () Bool)

(assert (=> d!60475 m!265169))

(assert (=> b!248907 d!60475))

(declare-fun d!60477 () Bool)

(declare-fun lt!124643 () (_ BitVec 32))

(assert (=> d!60477 (and (bvsge lt!124643 #b00000000000000000000000000000000) (bvsle lt!124643 (bvsub (size!6156 lt!124553) #b00000000000000000000000000000000)))))

(declare-fun e!161560 () (_ BitVec 32))

(assert (=> d!60477 (= lt!124643 e!161560)))

(declare-fun c!41775 () Bool)

(assert (=> d!60477 (= c!41775 (bvsge #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60477 (and (bvsle #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6156 (_keys!6732 thiss!1504)) (size!6156 lt!124553)))))

(assert (=> d!60477 (= (arrayCountValidKeys!0 lt!124553 #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) lt!124643)))

(declare-fun bm!23367 () Bool)

(declare-fun call!23370 () (_ BitVec 32))

(assert (=> bm!23367 (= call!23370 (arrayCountValidKeys!0 lt!124553 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249096 () Bool)

(assert (=> b!249096 (= e!161560 #b00000000000000000000000000000000)))

(declare-fun b!249097 () Bool)

(declare-fun e!161561 () (_ BitVec 32))

(assert (=> b!249097 (= e!161560 e!161561)))

(declare-fun c!41776 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!249097 (= c!41776 (validKeyInArray!0 (select (arr!5812 lt!124553) #b00000000000000000000000000000000)))))

(declare-fun b!249098 () Bool)

(assert (=> b!249098 (= e!161561 call!23370)))

(declare-fun b!249099 () Bool)

(assert (=> b!249099 (= e!161561 (bvadd #b00000000000000000000000000000001 call!23370))))

(assert (= (and d!60477 c!41775) b!249096))

(assert (= (and d!60477 (not c!41775)) b!249097))

(assert (= (and b!249097 c!41776) b!249099))

(assert (= (and b!249097 (not c!41776)) b!249098))

(assert (= (or b!249099 b!249098) bm!23367))

(declare-fun m!265171 () Bool)

(assert (=> bm!23367 m!265171))

(declare-fun m!265173 () Bool)

(assert (=> b!249097 m!265173))

(assert (=> b!249097 m!265173))

(declare-fun m!265175 () Bool)

(assert (=> b!249097 m!265175))

(assert (=> b!248911 d!60477))

(declare-fun b!249108 () Bool)

(declare-fun res!122021 () Bool)

(declare-fun e!161567 () Bool)

(assert (=> b!249108 (=> (not res!122021) (not e!161567))))

(assert (=> b!249108 (= res!122021 (not (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) index!297))))))

(declare-fun d!60479 () Bool)

(declare-fun e!161566 () Bool)

(assert (=> d!60479 e!161566))

(declare-fun res!122019 () Bool)

(assert (=> d!60479 (=> (not res!122019) (not e!161566))))

(assert (=> d!60479 (= res!122019 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6156 (_keys!6732 thiss!1504)))))))

(declare-fun lt!124646 () Unit!7693)

(declare-fun choose!1 (array!12257 (_ BitVec 32) (_ BitVec 64)) Unit!7693)

(assert (=> d!60479 (= lt!124646 (choose!1 (_keys!6732 thiss!1504) index!297 key!932))))

(assert (=> d!60479 e!161567))

(declare-fun res!122020 () Bool)

(assert (=> d!60479 (=> (not res!122020) (not e!161567))))

(assert (=> d!60479 (= res!122020 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6156 (_keys!6732 thiss!1504)))))))

(assert (=> d!60479 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6732 thiss!1504) index!297 key!932) lt!124646)))

(declare-fun b!249111 () Bool)

(assert (=> b!249111 (= e!161566 (= (arrayCountValidKeys!0 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6732 thiss!1504) #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!249110 () Bool)

(assert (=> b!249110 (= e!161567 (bvslt (size!6156 (_keys!6732 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!249109 () Bool)

(declare-fun res!122018 () Bool)

(assert (=> b!249109 (=> (not res!122018) (not e!161567))))

(assert (=> b!249109 (= res!122018 (validKeyInArray!0 key!932))))

(assert (= (and d!60479 res!122020) b!249108))

(assert (= (and b!249108 res!122021) b!249109))

(assert (= (and b!249109 res!122018) b!249110))

(assert (= (and d!60479 res!122019) b!249111))

(declare-fun m!265177 () Bool)

(assert (=> b!249108 m!265177))

(assert (=> b!249108 m!265177))

(declare-fun m!265179 () Bool)

(assert (=> b!249108 m!265179))

(declare-fun m!265181 () Bool)

(assert (=> d!60479 m!265181))

(assert (=> b!249111 m!265017))

(declare-fun m!265183 () Bool)

(assert (=> b!249111 m!265183))

(assert (=> b!249111 m!265019))

(declare-fun m!265185 () Bool)

(assert (=> b!249109 m!265185))

(assert (=> b!248911 d!60479))

(declare-fun d!60481 () Bool)

(declare-fun lt!124647 () (_ BitVec 32))

(assert (=> d!60481 (and (bvsge lt!124647 #b00000000000000000000000000000000) (bvsle lt!124647 (bvsub (size!6156 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!161568 () (_ BitVec 32))

(assert (=> d!60481 (= lt!124647 e!161568)))

(declare-fun c!41777 () Bool)

(assert (=> d!60481 (= c!41777 (bvsge #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60481 (and (bvsle #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6156 (_keys!6732 thiss!1504)) (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60481 (= (arrayCountValidKeys!0 (_keys!6732 thiss!1504) #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) lt!124647)))

(declare-fun bm!23368 () Bool)

(declare-fun call!23371 () (_ BitVec 32))

(assert (=> bm!23368 (= call!23371 (arrayCountValidKeys!0 (_keys!6732 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249112 () Bool)

(assert (=> b!249112 (= e!161568 #b00000000000000000000000000000000)))

(declare-fun b!249113 () Bool)

(declare-fun e!161569 () (_ BitVec 32))

(assert (=> b!249113 (= e!161568 e!161569)))

(declare-fun c!41778 () Bool)

(assert (=> b!249113 (= c!41778 (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249114 () Bool)

(assert (=> b!249114 (= e!161569 call!23371)))

(declare-fun b!249115 () Bool)

(assert (=> b!249115 (= e!161569 (bvadd #b00000000000000000000000000000001 call!23371))))

(assert (= (and d!60481 c!41777) b!249112))

(assert (= (and d!60481 (not c!41777)) b!249113))

(assert (= (and b!249113 c!41778) b!249115))

(assert (= (and b!249113 (not c!41778)) b!249114))

(assert (= (or b!249115 b!249114) bm!23368))

(declare-fun m!265187 () Bool)

(assert (=> bm!23368 m!265187))

(declare-fun m!265189 () Bool)

(assert (=> b!249113 m!265189))

(assert (=> b!249113 m!265189))

(declare-fun m!265191 () Bool)

(assert (=> b!249113 m!265191))

(assert (=> b!248911 d!60481))

(declare-fun d!60483 () Bool)

(assert (=> d!60483 (= (validMask!0 (mask!10765 thiss!1504)) (and (or (= (mask!10765 thiss!1504) #b00000000000000000000000000000111) (= (mask!10765 thiss!1504) #b00000000000000000000000000001111) (= (mask!10765 thiss!1504) #b00000000000000000000000000011111) (= (mask!10765 thiss!1504) #b00000000000000000000000000111111) (= (mask!10765 thiss!1504) #b00000000000000000000000001111111) (= (mask!10765 thiss!1504) #b00000000000000000000000011111111) (= (mask!10765 thiss!1504) #b00000000000000000000000111111111) (= (mask!10765 thiss!1504) #b00000000000000000000001111111111) (= (mask!10765 thiss!1504) #b00000000000000000000011111111111) (= (mask!10765 thiss!1504) #b00000000000000000000111111111111) (= (mask!10765 thiss!1504) #b00000000000000000001111111111111) (= (mask!10765 thiss!1504) #b00000000000000000011111111111111) (= (mask!10765 thiss!1504) #b00000000000000000111111111111111) (= (mask!10765 thiss!1504) #b00000000000000001111111111111111) (= (mask!10765 thiss!1504) #b00000000000000011111111111111111) (= (mask!10765 thiss!1504) #b00000000000000111111111111111111) (= (mask!10765 thiss!1504) #b00000000000001111111111111111111) (= (mask!10765 thiss!1504) #b00000000000011111111111111111111) (= (mask!10765 thiss!1504) #b00000000000111111111111111111111) (= (mask!10765 thiss!1504) #b00000000001111111111111111111111) (= (mask!10765 thiss!1504) #b00000000011111111111111111111111) (= (mask!10765 thiss!1504) #b00000000111111111111111111111111) (= (mask!10765 thiss!1504) #b00000001111111111111111111111111) (= (mask!10765 thiss!1504) #b00000011111111111111111111111111) (= (mask!10765 thiss!1504) #b00000111111111111111111111111111) (= (mask!10765 thiss!1504) #b00001111111111111111111111111111) (= (mask!10765 thiss!1504) #b00011111111111111111111111111111) (= (mask!10765 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10765 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!248911 d!60483))

(declare-fun b!249124 () Bool)

(declare-fun e!161576 () Bool)

(declare-fun call!23374 () Bool)

(assert (=> b!249124 (= e!161576 call!23374)))

(declare-fun b!249125 () Bool)

(declare-fun e!161577 () Bool)

(assert (=> b!249125 (= e!161577 call!23374)))

(declare-fun b!249126 () Bool)

(assert (=> b!249126 (= e!161576 e!161577)))

(declare-fun lt!124655 () (_ BitVec 64))

(assert (=> b!249126 (= lt!124655 (select (arr!5812 lt!124553) #b00000000000000000000000000000000))))

(declare-fun lt!124654 () Unit!7693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12257 (_ BitVec 64) (_ BitVec 32)) Unit!7693)

(assert (=> b!249126 (= lt!124654 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124553 lt!124655 #b00000000000000000000000000000000))))

(assert (=> b!249126 (arrayContainsKey!0 lt!124553 lt!124655 #b00000000000000000000000000000000)))

(declare-fun lt!124656 () Unit!7693)

(assert (=> b!249126 (= lt!124656 lt!124654)))

(declare-fun res!122026 () Bool)

(assert (=> b!249126 (= res!122026 (= (seekEntryOrOpen!0 (select (arr!5812 lt!124553) #b00000000000000000000000000000000) lt!124553 (mask!10765 thiss!1504)) (Found!1113 #b00000000000000000000000000000000)))))

(assert (=> b!249126 (=> (not res!122026) (not e!161577))))

(declare-fun bm!23371 () Bool)

(assert (=> bm!23371 (= call!23374 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124553 (mask!10765 thiss!1504)))))

(declare-fun b!249127 () Bool)

(declare-fun e!161578 () Bool)

(assert (=> b!249127 (= e!161578 e!161576)))

(declare-fun c!41781 () Bool)

(assert (=> b!249127 (= c!41781 (validKeyInArray!0 (select (arr!5812 lt!124553) #b00000000000000000000000000000000)))))

(declare-fun d!60485 () Bool)

(declare-fun res!122027 () Bool)

(assert (=> d!60485 (=> res!122027 e!161578)))

(assert (=> d!60485 (= res!122027 (bvsge #b00000000000000000000000000000000 (size!6156 lt!124553)))))

(assert (=> d!60485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!124553 (mask!10765 thiss!1504)) e!161578)))

(assert (= (and d!60485 (not res!122027)) b!249127))

(assert (= (and b!249127 c!41781) b!249126))

(assert (= (and b!249127 (not c!41781)) b!249124))

(assert (= (and b!249126 res!122026) b!249125))

(assert (= (or b!249125 b!249124) bm!23371))

(assert (=> b!249126 m!265173))

(declare-fun m!265193 () Bool)

(assert (=> b!249126 m!265193))

(declare-fun m!265195 () Bool)

(assert (=> b!249126 m!265195))

(assert (=> b!249126 m!265173))

(declare-fun m!265197 () Bool)

(assert (=> b!249126 m!265197))

(declare-fun m!265199 () Bool)

(assert (=> bm!23371 m!265199))

(assert (=> b!249127 m!265173))

(assert (=> b!249127 m!265173))

(assert (=> b!249127 m!265175))

(assert (=> b!248911 d!60485))

(declare-fun b!249138 () Bool)

(declare-fun e!161587 () Bool)

(declare-fun call!23377 () Bool)

(assert (=> b!249138 (= e!161587 call!23377)))

(declare-fun b!249139 () Bool)

(declare-fun e!161590 () Bool)

(assert (=> b!249139 (= e!161590 e!161587)))

(declare-fun c!41784 () Bool)

(assert (=> b!249139 (= c!41784 (validKeyInArray!0 (select (arr!5812 lt!124553) #b00000000000000000000000000000000)))))

(declare-fun d!60487 () Bool)

(declare-fun res!122034 () Bool)

(declare-fun e!161589 () Bool)

(assert (=> d!60487 (=> res!122034 e!161589)))

(assert (=> d!60487 (= res!122034 (bvsge #b00000000000000000000000000000000 (size!6156 lt!124553)))))

(assert (=> d!60487 (= (arrayNoDuplicates!0 lt!124553 #b00000000000000000000000000000000 Nil!3695) e!161589)))

(declare-fun b!249140 () Bool)

(assert (=> b!249140 (= e!161589 e!161590)))

(declare-fun res!122035 () Bool)

(assert (=> b!249140 (=> (not res!122035) (not e!161590))))

(declare-fun e!161588 () Bool)

(assert (=> b!249140 (= res!122035 (not e!161588))))

(declare-fun res!122036 () Bool)

(assert (=> b!249140 (=> (not res!122036) (not e!161588))))

(assert (=> b!249140 (= res!122036 (validKeyInArray!0 (select (arr!5812 lt!124553) #b00000000000000000000000000000000)))))

(declare-fun bm!23374 () Bool)

(assert (=> bm!23374 (= call!23377 (arrayNoDuplicates!0 lt!124553 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41784 (Cons!3694 (select (arr!5812 lt!124553) #b00000000000000000000000000000000) Nil!3695) Nil!3695)))))

(declare-fun b!249141 () Bool)

(assert (=> b!249141 (= e!161587 call!23377)))

(declare-fun b!249142 () Bool)

(declare-fun contains!1790 (List!3698 (_ BitVec 64)) Bool)

(assert (=> b!249142 (= e!161588 (contains!1790 Nil!3695 (select (arr!5812 lt!124553) #b00000000000000000000000000000000)))))

(assert (= (and d!60487 (not res!122034)) b!249140))

(assert (= (and b!249140 res!122036) b!249142))

(assert (= (and b!249140 res!122035) b!249139))

(assert (= (and b!249139 c!41784) b!249138))

(assert (= (and b!249139 (not c!41784)) b!249141))

(assert (= (or b!249138 b!249141) bm!23374))

(assert (=> b!249139 m!265173))

(assert (=> b!249139 m!265173))

(assert (=> b!249139 m!265175))

(assert (=> b!249140 m!265173))

(assert (=> b!249140 m!265173))

(assert (=> b!249140 m!265175))

(assert (=> bm!23374 m!265173))

(declare-fun m!265201 () Bool)

(assert (=> bm!23374 m!265201))

(assert (=> b!249142 m!265173))

(assert (=> b!249142 m!265173))

(declare-fun m!265203 () Bool)

(assert (=> b!249142 m!265203))

(assert (=> b!248911 d!60487))

(declare-fun d!60489 () Bool)

(declare-fun e!161593 () Bool)

(assert (=> d!60489 e!161593))

(declare-fun res!122039 () Bool)

(assert (=> d!60489 (=> (not res!122039) (not e!161593))))

(assert (=> d!60489 (= res!122039 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6156 (_keys!6732 thiss!1504)))))))

(declare-fun lt!124659 () Unit!7693)

(declare-fun choose!41 (array!12257 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3698) Unit!7693)

(assert (=> d!60489 (= lt!124659 (choose!41 (_keys!6732 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3695))))

(assert (=> d!60489 (bvslt (size!6156 (_keys!6732 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60489 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6732 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3695) lt!124659)))

(declare-fun b!249145 () Bool)

(assert (=> b!249145 (= e!161593 (arrayNoDuplicates!0 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) #b00000000000000000000000000000000 Nil!3695))))

(assert (= (and d!60489 res!122039) b!249145))

(declare-fun m!265205 () Bool)

(assert (=> d!60489 m!265205))

(assert (=> b!249145 m!265017))

(declare-fun m!265207 () Bool)

(assert (=> b!249145 m!265207))

(assert (=> b!248911 d!60489))

(declare-fun d!60491 () Bool)

(declare-fun res!122044 () Bool)

(declare-fun e!161598 () Bool)

(assert (=> d!60491 (=> res!122044 e!161598)))

(assert (=> d!60491 (= res!122044 (= (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60491 (= (arrayContainsKey!0 (_keys!6732 thiss!1504) key!932 #b00000000000000000000000000000000) e!161598)))

(declare-fun b!249150 () Bool)

(declare-fun e!161599 () Bool)

(assert (=> b!249150 (= e!161598 e!161599)))

(declare-fun res!122045 () Bool)

(assert (=> b!249150 (=> (not res!122045) (not e!161599))))

(assert (=> b!249150 (= res!122045 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249151 () Bool)

(assert (=> b!249151 (= e!161599 (arrayContainsKey!0 (_keys!6732 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60491 (not res!122044)) b!249150))

(assert (= (and b!249150 res!122045) b!249151))

(assert (=> d!60491 m!265189))

(declare-fun m!265209 () Bool)

(assert (=> b!249151 m!265209))

(assert (=> b!248911 d!60491))

(declare-fun d!60493 () Bool)

(declare-fun e!161602 () Bool)

(assert (=> d!60493 e!161602))

(declare-fun res!122048 () Bool)

(assert (=> d!60493 (=> (not res!122048) (not e!161602))))

(assert (=> d!60493 (= res!122048 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6156 (_keys!6732 thiss!1504)))))))

(declare-fun lt!124662 () Unit!7693)

(declare-fun choose!102 ((_ BitVec 64) array!12257 (_ BitVec 32) (_ BitVec 32)) Unit!7693)

(assert (=> d!60493 (= lt!124662 (choose!102 key!932 (_keys!6732 thiss!1504) index!297 (mask!10765 thiss!1504)))))

(assert (=> d!60493 (validMask!0 (mask!10765 thiss!1504))))

(assert (=> d!60493 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6732 thiss!1504) index!297 (mask!10765 thiss!1504)) lt!124662)))

(declare-fun b!249154 () Bool)

(assert (=> b!249154 (= e!161602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) (mask!10765 thiss!1504)))))

(assert (= (and d!60493 res!122048) b!249154))

(declare-fun m!265211 () Bool)

(assert (=> d!60493 m!265211))

(assert (=> d!60493 m!265009))

(assert (=> b!249154 m!265017))

(declare-fun m!265213 () Bool)

(assert (=> b!249154 m!265213))

(assert (=> b!248911 d!60493))

(declare-fun d!60495 () Bool)

(assert (=> d!60495 (= (inRange!0 index!297 (mask!10765 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10765 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!248896 d!60495))

(declare-fun d!60497 () Bool)

(declare-fun e!161607 () Bool)

(assert (=> d!60497 e!161607))

(declare-fun res!122051 () Bool)

(assert (=> d!60497 (=> res!122051 e!161607)))

(declare-fun lt!124674 () Bool)

(assert (=> d!60497 (= res!122051 (not lt!124674))))

(declare-fun lt!124673 () Bool)

(assert (=> d!60497 (= lt!124674 lt!124673)))

(declare-fun lt!124672 () Unit!7693)

(declare-fun e!161608 () Unit!7693)

(assert (=> d!60497 (= lt!124672 e!161608)))

(declare-fun c!41787 () Bool)

(assert (=> d!60497 (= c!41787 lt!124673)))

(declare-fun containsKey!286 (List!3697 (_ BitVec 64)) Bool)

(assert (=> d!60497 (= lt!124673 (containsKey!286 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(assert (=> d!60497 (= (contains!1787 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) key!932) lt!124674)))

(declare-fun b!249161 () Bool)

(declare-fun lt!124671 () Unit!7693)

(assert (=> b!249161 (= e!161608 lt!124671)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!235 (List!3697 (_ BitVec 64)) Unit!7693)

(assert (=> b!249161 (= lt!124671 (lemmaContainsKeyImpliesGetValueByKeyDefined!235 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(declare-datatypes ((Option!300 0))(
  ( (Some!299 (v!5340 V!8281)) (None!298) )
))
(declare-fun isDefined!236 (Option!300) Bool)

(declare-fun getValueByKey!294 (List!3697 (_ BitVec 64)) Option!300)

(assert (=> b!249161 (isDefined!236 (getValueByKey!294 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(declare-fun b!249162 () Bool)

(declare-fun Unit!7704 () Unit!7693)

(assert (=> b!249162 (= e!161608 Unit!7704)))

(declare-fun b!249163 () Bool)

(assert (=> b!249163 (= e!161607 (isDefined!236 (getValueByKey!294 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932)))))

(assert (= (and d!60497 c!41787) b!249161))

(assert (= (and d!60497 (not c!41787)) b!249162))

(assert (= (and d!60497 (not res!122051)) b!249163))

(declare-fun m!265215 () Bool)

(assert (=> d!60497 m!265215))

(declare-fun m!265217 () Bool)

(assert (=> b!249161 m!265217))

(declare-fun m!265219 () Bool)

(assert (=> b!249161 m!265219))

(assert (=> b!249161 m!265219))

(declare-fun m!265221 () Bool)

(assert (=> b!249161 m!265221))

(assert (=> b!249163 m!265219))

(assert (=> b!249163 m!265219))

(assert (=> b!249163 m!265221))

(assert (=> b!248896 d!60497))

(declare-fun b!249206 () Bool)

(declare-fun e!161644 () Bool)

(declare-fun e!161642 () Bool)

(assert (=> b!249206 (= e!161644 e!161642)))

(declare-fun res!122078 () Bool)

(declare-fun call!23394 () Bool)

(assert (=> b!249206 (= res!122078 call!23394)))

(assert (=> b!249206 (=> (not res!122078) (not e!161642))))

(declare-fun b!249207 () Bool)

(declare-fun e!161647 () ListLongMap!3699)

(declare-fun call!23393 () ListLongMap!3699)

(assert (=> b!249207 (= e!161647 call!23393)))

(declare-fun b!249208 () Bool)

(declare-fun e!161645 () Bool)

(declare-fun call!23392 () Bool)

(assert (=> b!249208 (= e!161645 (not call!23392))))

(declare-fun b!249209 () Bool)

(declare-fun e!161635 () ListLongMap!3699)

(assert (=> b!249209 (= e!161635 call!23393)))

(declare-fun b!249211 () Bool)

(declare-fun e!161641 () Bool)

(assert (=> b!249211 (= e!161641 e!161645)))

(declare-fun c!41804 () Bool)

(assert (=> b!249211 (= c!41804 (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23389 () Bool)

(declare-fun call!23396 () ListLongMap!3699)

(declare-fun call!23397 () ListLongMap!3699)

(assert (=> bm!23389 (= call!23396 call!23397)))

(declare-fun b!249212 () Bool)

(declare-fun e!161636 () ListLongMap!3699)

(declare-fun call!23395 () ListLongMap!3699)

(declare-fun +!671 (ListLongMap!3699 tuple2!4796) ListLongMap!3699)

(assert (=> b!249212 (= e!161636 (+!671 call!23395 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))

(declare-fun c!41803 () Bool)

(declare-fun bm!23390 () Bool)

(declare-fun call!23398 () ListLongMap!3699)

(declare-fun c!41801 () Bool)

(assert (=> bm!23390 (= call!23395 (+!671 (ite c!41801 call!23397 (ite c!41803 call!23396 call!23398)) (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(declare-fun b!249213 () Bool)

(declare-fun e!161638 () Bool)

(assert (=> b!249213 (= e!161645 e!161638)))

(declare-fun res!122073 () Bool)

(assert (=> b!249213 (= res!122073 call!23392)))

(assert (=> b!249213 (=> (not res!122073) (not e!161638))))

(declare-fun b!249214 () Bool)

(declare-fun e!161640 () Unit!7693)

(declare-fun Unit!7705 () Unit!7693)

(assert (=> b!249214 (= e!161640 Unit!7705)))

(declare-fun b!249215 () Bool)

(declare-fun res!122076 () Bool)

(assert (=> b!249215 (=> (not res!122076) (not e!161641))))

(assert (=> b!249215 (= res!122076 e!161644)))

(declare-fun c!41802 () Bool)

(assert (=> b!249215 (= c!41802 (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!249216 () Bool)

(declare-fun lt!124719 () ListLongMap!3699)

(declare-fun apply!238 (ListLongMap!3699 (_ BitVec 64)) V!8281)

(assert (=> b!249216 (= e!161642 (= (apply!238 lt!124719 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4446 thiss!1504)))))

(declare-fun bm!23391 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!554 (array!12257 array!12255 (_ BitVec 32) (_ BitVec 32) V!8281 V!8281 (_ BitVec 32) Int) ListLongMap!3699)

(assert (=> bm!23391 (= call!23397 (getCurrentListMapNoExtraKeys!554 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(declare-fun b!249217 () Bool)

(declare-fun res!122072 () Bool)

(assert (=> b!249217 (=> (not res!122072) (not e!161641))))

(declare-fun e!161646 () Bool)

(assert (=> b!249217 (= res!122072 e!161646)))

(declare-fun res!122077 () Bool)

(assert (=> b!249217 (=> res!122077 e!161646)))

(declare-fun e!161643 () Bool)

(assert (=> b!249217 (= res!122077 (not e!161643))))

(declare-fun res!122070 () Bool)

(assert (=> b!249217 (=> (not res!122070) (not e!161643))))

(assert (=> b!249217 (= res!122070 (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249218 () Bool)

(assert (=> b!249218 (= e!161638 (= (apply!238 lt!124719 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4446 thiss!1504)))))

(declare-fun bm!23392 () Bool)

(assert (=> bm!23392 (= call!23394 (contains!1787 lt!124719 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249219 () Bool)

(declare-fun lt!124722 () Unit!7693)

(assert (=> b!249219 (= e!161640 lt!124722)))

(declare-fun lt!124730 () ListLongMap!3699)

(assert (=> b!249219 (= lt!124730 (getCurrentListMapNoExtraKeys!554 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(declare-fun lt!124731 () (_ BitVec 64))

(assert (=> b!249219 (= lt!124731 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124732 () (_ BitVec 64))

(assert (=> b!249219 (= lt!124732 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124729 () Unit!7693)

(declare-fun addStillContains!214 (ListLongMap!3699 (_ BitVec 64) V!8281 (_ BitVec 64)) Unit!7693)

(assert (=> b!249219 (= lt!124729 (addStillContains!214 lt!124730 lt!124731 (zeroValue!4446 thiss!1504) lt!124732))))

(assert (=> b!249219 (contains!1787 (+!671 lt!124730 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504))) lt!124732)))

(declare-fun lt!124739 () Unit!7693)

(assert (=> b!249219 (= lt!124739 lt!124729)))

(declare-fun lt!124724 () ListLongMap!3699)

(assert (=> b!249219 (= lt!124724 (getCurrentListMapNoExtraKeys!554 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(declare-fun lt!124723 () (_ BitVec 64))

(assert (=> b!249219 (= lt!124723 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124725 () (_ BitVec 64))

(assert (=> b!249219 (= lt!124725 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124740 () Unit!7693)

(declare-fun addApplyDifferent!214 (ListLongMap!3699 (_ BitVec 64) V!8281 (_ BitVec 64)) Unit!7693)

(assert (=> b!249219 (= lt!124740 (addApplyDifferent!214 lt!124724 lt!124723 (minValue!4446 thiss!1504) lt!124725))))

(assert (=> b!249219 (= (apply!238 (+!671 lt!124724 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504))) lt!124725) (apply!238 lt!124724 lt!124725))))

(declare-fun lt!124737 () Unit!7693)

(assert (=> b!249219 (= lt!124737 lt!124740)))

(declare-fun lt!124727 () ListLongMap!3699)

(assert (=> b!249219 (= lt!124727 (getCurrentListMapNoExtraKeys!554 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(declare-fun lt!124721 () (_ BitVec 64))

(assert (=> b!249219 (= lt!124721 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124738 () (_ BitVec 64))

(assert (=> b!249219 (= lt!124738 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124733 () Unit!7693)

(assert (=> b!249219 (= lt!124733 (addApplyDifferent!214 lt!124727 lt!124721 (zeroValue!4446 thiss!1504) lt!124738))))

(assert (=> b!249219 (= (apply!238 (+!671 lt!124727 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504))) lt!124738) (apply!238 lt!124727 lt!124738))))

(declare-fun lt!124726 () Unit!7693)

(assert (=> b!249219 (= lt!124726 lt!124733)))

(declare-fun lt!124735 () ListLongMap!3699)

(assert (=> b!249219 (= lt!124735 (getCurrentListMapNoExtraKeys!554 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))

(declare-fun lt!124720 () (_ BitVec 64))

(assert (=> b!249219 (= lt!124720 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124728 () (_ BitVec 64))

(assert (=> b!249219 (= lt!124728 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249219 (= lt!124722 (addApplyDifferent!214 lt!124735 lt!124720 (minValue!4446 thiss!1504) lt!124728))))

(assert (=> b!249219 (= (apply!238 (+!671 lt!124735 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504))) lt!124728) (apply!238 lt!124735 lt!124728))))

(declare-fun d!60499 () Bool)

(assert (=> d!60499 e!161641))

(declare-fun res!122075 () Bool)

(assert (=> d!60499 (=> (not res!122075) (not e!161641))))

(assert (=> d!60499 (= res!122075 (or (bvsge #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))))

(declare-fun lt!124736 () ListLongMap!3699)

(assert (=> d!60499 (= lt!124719 lt!124736)))

(declare-fun lt!124734 () Unit!7693)

(assert (=> d!60499 (= lt!124734 e!161640)))

(declare-fun c!41800 () Bool)

(declare-fun e!161639 () Bool)

(assert (=> d!60499 (= c!41800 e!161639)))

(declare-fun res!122071 () Bool)

(assert (=> d!60499 (=> (not res!122071) (not e!161639))))

(assert (=> d!60499 (= res!122071 (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60499 (= lt!124736 e!161636)))

(assert (=> d!60499 (= c!41801 (and (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60499 (validMask!0 (mask!10765 thiss!1504))))

(assert (=> d!60499 (= (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) lt!124719)))

(declare-fun b!249210 () Bool)

(declare-fun c!41805 () Bool)

(assert (=> b!249210 (= c!41805 (and (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!249210 (= e!161635 e!161647)))

(declare-fun b!249220 () Bool)

(assert (=> b!249220 (= e!161644 (not call!23394))))

(declare-fun b!249221 () Bool)

(assert (=> b!249221 (= e!161639 (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249222 () Bool)

(declare-fun e!161637 () Bool)

(declare-fun get!2979 (ValueCell!2894 V!8281) V!8281)

(declare-fun dynLambda!572 (Int (_ BitVec 64)) V!8281)

(assert (=> b!249222 (= e!161637 (= (apply!238 lt!124719 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)) (get!2979 (select (arr!5811 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!572 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6155 (_values!4588 thiss!1504))))))

(assert (=> b!249222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249223 () Bool)

(assert (=> b!249223 (= e!161643 (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23393 () Bool)

(assert (=> bm!23393 (= call!23392 (contains!1787 lt!124719 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249224 () Bool)

(assert (=> b!249224 (= e!161646 e!161637)))

(declare-fun res!122074 () Bool)

(assert (=> b!249224 (=> (not res!122074) (not e!161637))))

(assert (=> b!249224 (= res!122074 (contains!1787 lt!124719 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249224 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249225 () Bool)

(assert (=> b!249225 (= e!161636 e!161635)))

(assert (=> b!249225 (= c!41803 (and (not (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4342 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23394 () Bool)

(assert (=> bm!23394 (= call!23393 call!23395)))

(declare-fun b!249226 () Bool)

(assert (=> b!249226 (= e!161647 call!23398)))

(declare-fun bm!23395 () Bool)

(assert (=> bm!23395 (= call!23398 call!23396)))

(assert (= (and d!60499 c!41801) b!249212))

(assert (= (and d!60499 (not c!41801)) b!249225))

(assert (= (and b!249225 c!41803) b!249209))

(assert (= (and b!249225 (not c!41803)) b!249210))

(assert (= (and b!249210 c!41805) b!249207))

(assert (= (and b!249210 (not c!41805)) b!249226))

(assert (= (or b!249207 b!249226) bm!23395))

(assert (= (or b!249209 bm!23395) bm!23389))

(assert (= (or b!249209 b!249207) bm!23394))

(assert (= (or b!249212 bm!23389) bm!23391))

(assert (= (or b!249212 bm!23394) bm!23390))

(assert (= (and d!60499 res!122071) b!249221))

(assert (= (and d!60499 c!41800) b!249219))

(assert (= (and d!60499 (not c!41800)) b!249214))

(assert (= (and d!60499 res!122075) b!249217))

(assert (= (and b!249217 res!122070) b!249223))

(assert (= (and b!249217 (not res!122077)) b!249224))

(assert (= (and b!249224 res!122074) b!249222))

(assert (= (and b!249217 res!122072) b!249215))

(assert (= (and b!249215 c!41802) b!249206))

(assert (= (and b!249215 (not c!41802)) b!249220))

(assert (= (and b!249206 res!122078) b!249216))

(assert (= (or b!249206 b!249220) bm!23392))

(assert (= (and b!249215 res!122076) b!249211))

(assert (= (and b!249211 c!41804) b!249213))

(assert (= (and b!249211 (not c!41804)) b!249208))

(assert (= (and b!249213 res!122073) b!249218))

(assert (= (or b!249213 b!249208) bm!23393))

(declare-fun b_lambda!8045 () Bool)

(assert (=> (not b_lambda!8045) (not b!249222)))

(declare-fun t!8722 () Bool)

(declare-fun tb!2981 () Bool)

(assert (=> (and b!248895 (= (defaultEntry!4605 thiss!1504) (defaultEntry!4605 thiss!1504)) t!8722) tb!2981))

(declare-fun result!5281 () Bool)

(assert (=> tb!2981 (= result!5281 tp_is_empty!6475)))

(assert (=> b!249222 t!8722))

(declare-fun b_and!13601 () Bool)

(assert (= b_and!13595 (and (=> t!8722 result!5281) b_and!13601)))

(declare-fun m!265223 () Bool)

(assert (=> b!249218 m!265223))

(declare-fun m!265225 () Bool)

(assert (=> bm!23390 m!265225))

(assert (=> b!249221 m!265189))

(assert (=> b!249221 m!265189))

(assert (=> b!249221 m!265191))

(declare-fun m!265227 () Bool)

(assert (=> b!249219 m!265227))

(declare-fun m!265229 () Bool)

(assert (=> b!249219 m!265229))

(declare-fun m!265231 () Bool)

(assert (=> b!249219 m!265231))

(declare-fun m!265233 () Bool)

(assert (=> b!249219 m!265233))

(declare-fun m!265235 () Bool)

(assert (=> b!249219 m!265235))

(declare-fun m!265237 () Bool)

(assert (=> b!249219 m!265237))

(assert (=> b!249219 m!265189))

(assert (=> b!249219 m!265235))

(declare-fun m!265239 () Bool)

(assert (=> b!249219 m!265239))

(declare-fun m!265241 () Bool)

(assert (=> b!249219 m!265241))

(declare-fun m!265243 () Bool)

(assert (=> b!249219 m!265243))

(declare-fun m!265245 () Bool)

(assert (=> b!249219 m!265245))

(declare-fun m!265247 () Bool)

(assert (=> b!249219 m!265247))

(declare-fun m!265249 () Bool)

(assert (=> b!249219 m!265249))

(declare-fun m!265251 () Bool)

(assert (=> b!249219 m!265251))

(assert (=> b!249219 m!265251))

(declare-fun m!265253 () Bool)

(assert (=> b!249219 m!265253))

(declare-fun m!265255 () Bool)

(assert (=> b!249219 m!265255))

(assert (=> b!249219 m!265227))

(assert (=> b!249219 m!265255))

(declare-fun m!265257 () Bool)

(assert (=> b!249219 m!265257))

(assert (=> d!60499 m!265009))

(declare-fun m!265259 () Bool)

(assert (=> bm!23393 m!265259))

(declare-fun m!265261 () Bool)

(assert (=> b!249212 m!265261))

(assert (=> bm!23391 m!265249))

(declare-fun m!265263 () Bool)

(assert (=> bm!23392 m!265263))

(declare-fun m!265265 () Bool)

(assert (=> b!249222 m!265265))

(declare-fun m!265267 () Bool)

(assert (=> b!249222 m!265267))

(declare-fun m!265269 () Bool)

(assert (=> b!249222 m!265269))

(assert (=> b!249222 m!265189))

(assert (=> b!249222 m!265265))

(assert (=> b!249222 m!265189))

(declare-fun m!265271 () Bool)

(assert (=> b!249222 m!265271))

(assert (=> b!249222 m!265267))

(assert (=> b!249224 m!265189))

(assert (=> b!249224 m!265189))

(declare-fun m!265273 () Bool)

(assert (=> b!249224 m!265273))

(assert (=> b!249223 m!265189))

(assert (=> b!249223 m!265189))

(assert (=> b!249223 m!265191))

(declare-fun m!265275 () Bool)

(assert (=> b!249216 m!265275))

(assert (=> b!248896 d!60499))

(declare-fun d!60501 () Bool)

(declare-fun res!122085 () Bool)

(declare-fun e!161650 () Bool)

(assert (=> d!60501 (=> (not res!122085) (not e!161650))))

(declare-fun simpleValid!261 (LongMapFixedSize!3688) Bool)

(assert (=> d!60501 (= res!122085 (simpleValid!261 thiss!1504))))

(assert (=> d!60501 (= (valid!1448 thiss!1504) e!161650)))

(declare-fun b!249235 () Bool)

(declare-fun res!122086 () Bool)

(assert (=> b!249235 (=> (not res!122086) (not e!161650))))

(assert (=> b!249235 (= res!122086 (= (arrayCountValidKeys!0 (_keys!6732 thiss!1504) #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) (_size!1893 thiss!1504)))))

(declare-fun b!249236 () Bool)

(declare-fun res!122087 () Bool)

(assert (=> b!249236 (=> (not res!122087) (not e!161650))))

(assert (=> b!249236 (= res!122087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(declare-fun b!249237 () Bool)

(assert (=> b!249237 (= e!161650 (arrayNoDuplicates!0 (_keys!6732 thiss!1504) #b00000000000000000000000000000000 Nil!3695))))

(assert (= (and d!60501 res!122085) b!249235))

(assert (= (and b!249235 res!122086) b!249236))

(assert (= (and b!249236 res!122087) b!249237))

(declare-fun m!265277 () Bool)

(assert (=> d!60501 m!265277))

(assert (=> b!249235 m!265019))

(declare-fun m!265279 () Bool)

(assert (=> b!249236 m!265279))

(declare-fun m!265281 () Bool)

(assert (=> b!249237 m!265281))

(assert (=> start!23706 d!60501))

(assert (=> bm!23346 d!60491))

(declare-fun mapIsEmpty!11006 () Bool)

(declare-fun mapRes!11006 () Bool)

(assert (=> mapIsEmpty!11006 mapRes!11006))

(declare-fun b!249244 () Bool)

(declare-fun e!161656 () Bool)

(assert (=> b!249244 (= e!161656 tp_is_empty!6475)))

(declare-fun b!249245 () Bool)

(declare-fun e!161655 () Bool)

(assert (=> b!249245 (= e!161655 tp_is_empty!6475)))

(declare-fun condMapEmpty!11006 () Bool)

(declare-fun mapDefault!11006 () ValueCell!2894)

(assert (=> mapNonEmpty!10997 (= condMapEmpty!11006 (= mapRest!10997 ((as const (Array (_ BitVec 32) ValueCell!2894)) mapDefault!11006)))))

(assert (=> mapNonEmpty!10997 (= tp!23096 (and e!161655 mapRes!11006))))

(declare-fun mapNonEmpty!11006 () Bool)

(declare-fun tp!23111 () Bool)

(assert (=> mapNonEmpty!11006 (= mapRes!11006 (and tp!23111 e!161656))))

(declare-fun mapKey!11006 () (_ BitVec 32))

(declare-fun mapRest!11006 () (Array (_ BitVec 32) ValueCell!2894))

(declare-fun mapValue!11006 () ValueCell!2894)

(assert (=> mapNonEmpty!11006 (= mapRest!10997 (store mapRest!11006 mapKey!11006 mapValue!11006))))

(assert (= (and mapNonEmpty!10997 condMapEmpty!11006) mapIsEmpty!11006))

(assert (= (and mapNonEmpty!10997 (not condMapEmpty!11006)) mapNonEmpty!11006))

(assert (= (and mapNonEmpty!11006 ((_ is ValueCellFull!2894) mapValue!11006)) b!249244))

(assert (= (and mapNonEmpty!10997 ((_ is ValueCellFull!2894) mapDefault!11006)) b!249245))

(declare-fun m!265283 () Bool)

(assert (=> mapNonEmpty!11006 m!265283))

(declare-fun b_lambda!8047 () Bool)

(assert (= b_lambda!8045 (or (and b!248895 b_free!6613) b_lambda!8047)))

(check-sat (not d!60479) (not bm!23390) (not b!249127) (not b_lambda!8047) (not d!60469) (not b!249154) (not b!249223) (not d!60489) (not bm!23363) (not b_next!6613) (not bm!23393) (not b!249145) (not b!249068) b_and!13601 (not b!249140) (not bm!23391) (not bm!23374) (not d!60501) (not d!60475) (not b!249161) (not d!60467) (not b!249218) (not mapNonEmpty!11006) tp_is_empty!6475 (not b!249222) (not bm!23364) (not b!249126) (not b!249108) (not b!249235) (not b!249139) (not b!249224) (not b!249216) (not d!60493) (not b!249097) (not b!249113) (not b!249236) (not b!249109) (not d!60473) (not bm!23392) (not b!249151) (not b!249163) (not b!249085) (not b!249219) (not b!249221) (not d!60499) (not b!249111) (not d!60497) (not b!249237) (not bm!23368) (not b!249212) (not bm!23367) (not bm!23371) (not b!249142))
(check-sat b_and!13601 (not b_next!6613))
(get-model)

(assert (=> d!60473 d!60475))

(declare-fun d!60503 () Bool)

(declare-fun e!161659 () Bool)

(assert (=> d!60503 e!161659))

(declare-fun res!122093 () Bool)

(assert (=> d!60503 (=> (not res!122093) (not e!161659))))

(declare-fun lt!124743 () SeekEntryResult!1113)

(assert (=> d!60503 (= res!122093 ((_ is Found!1113) lt!124743))))

(assert (=> d!60503 (= lt!124743 (seekEntryOrOpen!0 key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(assert (=> d!60503 true))

(declare-fun _$33!162 () Unit!7693)

(assert (=> d!60503 (= (choose!1182 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)) _$33!162)))

(declare-fun b!249250 () Bool)

(declare-fun res!122092 () Bool)

(assert (=> b!249250 (=> (not res!122092) (not e!161659))))

(assert (=> b!249250 (= res!122092 (inRange!0 (index!6623 lt!124743) (mask!10765 thiss!1504)))))

(declare-fun b!249251 () Bool)

(assert (=> b!249251 (= e!161659 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6623 lt!124743)) key!932))))

(assert (= (and d!60503 res!122093) b!249250))

(assert (= (and b!249250 res!122092) b!249251))

(assert (=> d!60503 m!265027))

(declare-fun m!265285 () Bool)

(assert (=> b!249250 m!265285))

(declare-fun m!265287 () Bool)

(assert (=> b!249251 m!265287))

(assert (=> d!60473 d!60503))

(assert (=> d!60473 d!60483))

(declare-fun b!249252 () Bool)

(declare-fun e!161660 () Bool)

(declare-fun call!23399 () Bool)

(assert (=> b!249252 (= e!161660 call!23399)))

(declare-fun b!249253 () Bool)

(declare-fun e!161661 () Bool)

(assert (=> b!249253 (= e!161661 call!23399)))

(declare-fun b!249254 () Bool)

(assert (=> b!249254 (= e!161660 e!161661)))

(declare-fun lt!124745 () (_ BitVec 64))

(assert (=> b!249254 (= lt!124745 (select (arr!5812 lt!124553) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!124744 () Unit!7693)

(assert (=> b!249254 (= lt!124744 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124553 lt!124745 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!249254 (arrayContainsKey!0 lt!124553 lt!124745 #b00000000000000000000000000000000)))

(declare-fun lt!124746 () Unit!7693)

(assert (=> b!249254 (= lt!124746 lt!124744)))

(declare-fun res!122094 () Bool)

(assert (=> b!249254 (= res!122094 (= (seekEntryOrOpen!0 (select (arr!5812 lt!124553) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!124553 (mask!10765 thiss!1504)) (Found!1113 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!249254 (=> (not res!122094) (not e!161661))))

(declare-fun bm!23396 () Bool)

(assert (=> bm!23396 (= call!23399 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!124553 (mask!10765 thiss!1504)))))

(declare-fun b!249255 () Bool)

(declare-fun e!161662 () Bool)

(assert (=> b!249255 (= e!161662 e!161660)))

(declare-fun c!41806 () Bool)

(assert (=> b!249255 (= c!41806 (validKeyInArray!0 (select (arr!5812 lt!124553) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!60505 () Bool)

(declare-fun res!122095 () Bool)

(assert (=> d!60505 (=> res!122095 e!161662)))

(assert (=> d!60505 (= res!122095 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 lt!124553)))))

(assert (=> d!60505 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!124553 (mask!10765 thiss!1504)) e!161662)))

(assert (= (and d!60505 (not res!122095)) b!249255))

(assert (= (and b!249255 c!41806) b!249254))

(assert (= (and b!249255 (not c!41806)) b!249252))

(assert (= (and b!249254 res!122094) b!249253))

(assert (= (or b!249253 b!249252) bm!23396))

(declare-fun m!265289 () Bool)

(assert (=> b!249254 m!265289))

(declare-fun m!265291 () Bool)

(assert (=> b!249254 m!265291))

(declare-fun m!265293 () Bool)

(assert (=> b!249254 m!265293))

(assert (=> b!249254 m!265289))

(declare-fun m!265295 () Bool)

(assert (=> b!249254 m!265295))

(declare-fun m!265297 () Bool)

(assert (=> bm!23396 m!265297))

(assert (=> b!249255 m!265289))

(assert (=> b!249255 m!265289))

(declare-fun m!265299 () Bool)

(assert (=> b!249255 m!265299))

(assert (=> bm!23371 d!60505))

(declare-fun b!249256 () Bool)

(declare-fun e!161663 () Bool)

(declare-fun call!23400 () Bool)

(assert (=> b!249256 (= e!161663 call!23400)))

(declare-fun b!249257 () Bool)

(declare-fun e!161666 () Bool)

(assert (=> b!249257 (= e!161666 e!161663)))

(declare-fun c!41807 () Bool)

(assert (=> b!249257 (= c!41807 (validKeyInArray!0 (select (arr!5812 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!60507 () Bool)

(declare-fun res!122096 () Bool)

(declare-fun e!161665 () Bool)

(assert (=> d!60507 (=> res!122096 e!161665)))

(assert (=> d!60507 (= res!122096 (bvsge #b00000000000000000000000000000000 (size!6156 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))))))))

(assert (=> d!60507 (= (arrayNoDuplicates!0 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) #b00000000000000000000000000000000 Nil!3695) e!161665)))

(declare-fun b!249258 () Bool)

(assert (=> b!249258 (= e!161665 e!161666)))

(declare-fun res!122097 () Bool)

(assert (=> b!249258 (=> (not res!122097) (not e!161666))))

(declare-fun e!161664 () Bool)

(assert (=> b!249258 (= res!122097 (not e!161664))))

(declare-fun res!122098 () Bool)

(assert (=> b!249258 (=> (not res!122098) (not e!161664))))

(assert (=> b!249258 (= res!122098 (validKeyInArray!0 (select (arr!5812 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!23397 () Bool)

(assert (=> bm!23397 (= call!23400 (arrayNoDuplicates!0 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41807 (Cons!3694 (select (arr!5812 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504)))) #b00000000000000000000000000000000) Nil!3695) Nil!3695)))))

(declare-fun b!249259 () Bool)

(assert (=> b!249259 (= e!161663 call!23400)))

(declare-fun b!249260 () Bool)

(assert (=> b!249260 (= e!161664 (contains!1790 Nil!3695 (select (arr!5812 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60507 (not res!122096)) b!249258))

(assert (= (and b!249258 res!122098) b!249260))

(assert (= (and b!249258 res!122097) b!249257))

(assert (= (and b!249257 c!41807) b!249256))

(assert (= (and b!249257 (not c!41807)) b!249259))

(assert (= (or b!249256 b!249259) bm!23397))

(declare-fun m!265301 () Bool)

(assert (=> b!249257 m!265301))

(assert (=> b!249257 m!265301))

(declare-fun m!265303 () Bool)

(assert (=> b!249257 m!265303))

(assert (=> b!249258 m!265301))

(assert (=> b!249258 m!265301))

(assert (=> b!249258 m!265303))

(assert (=> bm!23397 m!265301))

(declare-fun m!265305 () Bool)

(assert (=> bm!23397 m!265305))

(assert (=> b!249260 m!265301))

(assert (=> b!249260 m!265301))

(declare-fun m!265307 () Bool)

(assert (=> b!249260 m!265307))

(assert (=> b!249145 d!60507))

(declare-fun d!60509 () Bool)

(assert (=> d!60509 (= (inRange!0 (ite c!41761 (index!6622 lt!124625) (index!6625 lt!124625)) (mask!10765 thiss!1504)) (and (bvsge (ite c!41761 (index!6622 lt!124625) (index!6625 lt!124625)) #b00000000000000000000000000000000) (bvslt (ite c!41761 (index!6622 lt!124625) (index!6625 lt!124625)) (bvadd (mask!10765 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23363 d!60509))

(declare-fun d!60511 () Bool)

(declare-fun get!2980 (Option!300) V!8281)

(assert (=> d!60511 (= (apply!238 lt!124724 lt!124725) (get!2980 (getValueByKey!294 (toList!1865 lt!124724) lt!124725)))))

(declare-fun bs!8919 () Bool)

(assert (= bs!8919 d!60511))

(declare-fun m!265309 () Bool)

(assert (=> bs!8919 m!265309))

(assert (=> bs!8919 m!265309))

(declare-fun m!265311 () Bool)

(assert (=> bs!8919 m!265311))

(assert (=> b!249219 d!60511))

(declare-fun d!60513 () Bool)

(assert (=> d!60513 (= (apply!238 lt!124727 lt!124738) (get!2980 (getValueByKey!294 (toList!1865 lt!124727) lt!124738)))))

(declare-fun bs!8920 () Bool)

(assert (= bs!8920 d!60513))

(declare-fun m!265313 () Bool)

(assert (=> bs!8920 m!265313))

(assert (=> bs!8920 m!265313))

(declare-fun m!265315 () Bool)

(assert (=> bs!8920 m!265315))

(assert (=> b!249219 d!60513))

(declare-fun d!60515 () Bool)

(assert (=> d!60515 (= (apply!238 (+!671 lt!124727 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504))) lt!124738) (get!2980 (getValueByKey!294 (toList!1865 (+!671 lt!124727 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504)))) lt!124738)))))

(declare-fun bs!8921 () Bool)

(assert (= bs!8921 d!60515))

(declare-fun m!265317 () Bool)

(assert (=> bs!8921 m!265317))

(assert (=> bs!8921 m!265317))

(declare-fun m!265319 () Bool)

(assert (=> bs!8921 m!265319))

(assert (=> b!249219 d!60515))

(declare-fun d!60517 () Bool)

(declare-fun e!161669 () Bool)

(assert (=> d!60517 e!161669))

(declare-fun res!122103 () Bool)

(assert (=> d!60517 (=> (not res!122103) (not e!161669))))

(declare-fun lt!124756 () ListLongMap!3699)

(assert (=> d!60517 (= res!122103 (contains!1787 lt!124756 (_1!2409 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504)))))))

(declare-fun lt!124757 () List!3697)

(assert (=> d!60517 (= lt!124756 (ListLongMap!3700 lt!124757))))

(declare-fun lt!124758 () Unit!7693)

(declare-fun lt!124755 () Unit!7693)

(assert (=> d!60517 (= lt!124758 lt!124755)))

(assert (=> d!60517 (= (getValueByKey!294 lt!124757 (_1!2409 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504)))) (Some!299 (_2!2409 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!158 (List!3697 (_ BitVec 64) V!8281) Unit!7693)

(assert (=> d!60517 (= lt!124755 (lemmaContainsTupThenGetReturnValue!158 lt!124757 (_1!2409 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504))) (_2!2409 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504)))))))

(declare-fun insertStrictlySorted!161 (List!3697 (_ BitVec 64) V!8281) List!3697)

(assert (=> d!60517 (= lt!124757 (insertStrictlySorted!161 (toList!1865 lt!124730) (_1!2409 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504))) (_2!2409 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504)))))))

(assert (=> d!60517 (= (+!671 lt!124730 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504))) lt!124756)))

(declare-fun b!249265 () Bool)

(declare-fun res!122104 () Bool)

(assert (=> b!249265 (=> (not res!122104) (not e!161669))))

(assert (=> b!249265 (= res!122104 (= (getValueByKey!294 (toList!1865 lt!124756) (_1!2409 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504)))) (Some!299 (_2!2409 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504))))))))

(declare-fun b!249266 () Bool)

(declare-fun contains!1791 (List!3697 tuple2!4796) Bool)

(assert (=> b!249266 (= e!161669 (contains!1791 (toList!1865 lt!124756) (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504))))))

(assert (= (and d!60517 res!122103) b!249265))

(assert (= (and b!249265 res!122104) b!249266))

(declare-fun m!265321 () Bool)

(assert (=> d!60517 m!265321))

(declare-fun m!265323 () Bool)

(assert (=> d!60517 m!265323))

(declare-fun m!265325 () Bool)

(assert (=> d!60517 m!265325))

(declare-fun m!265327 () Bool)

(assert (=> d!60517 m!265327))

(declare-fun m!265329 () Bool)

(assert (=> b!249265 m!265329))

(declare-fun m!265331 () Bool)

(assert (=> b!249266 m!265331))

(assert (=> b!249219 d!60517))

(declare-fun b!249291 () Bool)

(declare-fun e!161689 () Bool)

(declare-fun lt!124778 () ListLongMap!3699)

(declare-fun isEmpty!528 (ListLongMap!3699) Bool)

(assert (=> b!249291 (= e!161689 (isEmpty!528 lt!124778))))

(declare-fun b!249292 () Bool)

(declare-fun e!161686 () Bool)

(assert (=> b!249292 (= e!161686 e!161689)))

(declare-fun c!41816 () Bool)

(assert (=> b!249292 (= c!41816 (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249293 () Bool)

(declare-fun e!161685 () Bool)

(assert (=> b!249293 (= e!161685 e!161686)))

(declare-fun c!41819 () Bool)

(declare-fun e!161684 () Bool)

(assert (=> b!249293 (= c!41819 e!161684)))

(declare-fun res!122114 () Bool)

(assert (=> b!249293 (=> (not res!122114) (not e!161684))))

(assert (=> b!249293 (= res!122114 (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249294 () Bool)

(assert (=> b!249294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> b!249294 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6155 (_values!4588 thiss!1504))))))

(declare-fun e!161687 () Bool)

(assert (=> b!249294 (= e!161687 (= (apply!238 lt!124778 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)) (get!2979 (select (arr!5811 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!572 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!249295 () Bool)

(declare-fun lt!124779 () Unit!7693)

(declare-fun lt!124776 () Unit!7693)

(assert (=> b!249295 (= lt!124779 lt!124776)))

(declare-fun lt!124774 () (_ BitVec 64))

(declare-fun lt!124775 () (_ BitVec 64))

(declare-fun lt!124773 () V!8281)

(declare-fun lt!124777 () ListLongMap!3699)

(assert (=> b!249295 (not (contains!1787 (+!671 lt!124777 (tuple2!4797 lt!124775 lt!124773)) lt!124774))))

(declare-fun addStillNotContains!122 (ListLongMap!3699 (_ BitVec 64) V!8281 (_ BitVec 64)) Unit!7693)

(assert (=> b!249295 (= lt!124776 (addStillNotContains!122 lt!124777 lt!124775 lt!124773 lt!124774))))

(assert (=> b!249295 (= lt!124774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!249295 (= lt!124773 (get!2979 (select (arr!5811 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!572 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!249295 (= lt!124775 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!23403 () ListLongMap!3699)

(assert (=> b!249295 (= lt!124777 call!23403)))

(declare-fun e!161690 () ListLongMap!3699)

(assert (=> b!249295 (= e!161690 (+!671 call!23403 (tuple2!4797 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000) (get!2979 (select (arr!5811 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!572 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!249296 () Bool)

(declare-fun e!161688 () ListLongMap!3699)

(assert (=> b!249296 (= e!161688 (ListLongMap!3700 Nil!3694))))

(declare-fun b!249298 () Bool)

(assert (=> b!249298 (= e!161684 (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249298 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!249299 () Bool)

(assert (=> b!249299 (= e!161688 e!161690)))

(declare-fun c!41818 () Bool)

(assert (=> b!249299 (= c!41818 (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249300 () Bool)

(assert (=> b!249300 (= e!161689 (= lt!124778 (getCurrentListMapNoExtraKeys!554 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4605 thiss!1504))))))

(declare-fun b!249301 () Bool)

(assert (=> b!249301 (= e!161686 e!161687)))

(assert (=> b!249301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun res!122113 () Bool)

(assert (=> b!249301 (= res!122113 (contains!1787 lt!124778 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249301 (=> (not res!122113) (not e!161687))))

(declare-fun bm!23400 () Bool)

(assert (=> bm!23400 (= call!23403 (getCurrentListMapNoExtraKeys!554 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4605 thiss!1504)))))

(declare-fun b!249302 () Bool)

(declare-fun res!122116 () Bool)

(assert (=> b!249302 (=> (not res!122116) (not e!161685))))

(assert (=> b!249302 (= res!122116 (not (contains!1787 lt!124778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249297 () Bool)

(assert (=> b!249297 (= e!161690 call!23403)))

(declare-fun d!60519 () Bool)

(assert (=> d!60519 e!161685))

(declare-fun res!122115 () Bool)

(assert (=> d!60519 (=> (not res!122115) (not e!161685))))

(assert (=> d!60519 (= res!122115 (not (contains!1787 lt!124778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60519 (= lt!124778 e!161688)))

(declare-fun c!41817 () Bool)

(assert (=> d!60519 (= c!41817 (bvsge #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60519 (validMask!0 (mask!10765 thiss!1504))))

(assert (=> d!60519 (= (getCurrentListMapNoExtraKeys!554 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) lt!124778)))

(assert (= (and d!60519 c!41817) b!249296))

(assert (= (and d!60519 (not c!41817)) b!249299))

(assert (= (and b!249299 c!41818) b!249295))

(assert (= (and b!249299 (not c!41818)) b!249297))

(assert (= (or b!249295 b!249297) bm!23400))

(assert (= (and d!60519 res!122115) b!249302))

(assert (= (and b!249302 res!122116) b!249293))

(assert (= (and b!249293 res!122114) b!249298))

(assert (= (and b!249293 c!41819) b!249301))

(assert (= (and b!249293 (not c!41819)) b!249292))

(assert (= (and b!249301 res!122113) b!249294))

(assert (= (and b!249292 c!41816) b!249300))

(assert (= (and b!249292 (not c!41816)) b!249291))

(declare-fun b_lambda!8049 () Bool)

(assert (=> (not b_lambda!8049) (not b!249294)))

(assert (=> b!249294 t!8722))

(declare-fun b_and!13603 () Bool)

(assert (= b_and!13601 (and (=> t!8722 result!5281) b_and!13603)))

(declare-fun b_lambda!8051 () Bool)

(assert (=> (not b_lambda!8051) (not b!249295)))

(assert (=> b!249295 t!8722))

(declare-fun b_and!13605 () Bool)

(assert (= b_and!13603 (and (=> t!8722 result!5281) b_and!13605)))

(declare-fun m!265333 () Bool)

(assert (=> d!60519 m!265333))

(assert (=> d!60519 m!265009))

(declare-fun m!265335 () Bool)

(assert (=> bm!23400 m!265335))

(assert (=> b!249299 m!265189))

(assert (=> b!249299 m!265189))

(assert (=> b!249299 m!265191))

(declare-fun m!265337 () Bool)

(assert (=> b!249302 m!265337))

(assert (=> b!249300 m!265335))

(declare-fun m!265339 () Bool)

(assert (=> b!249295 m!265339))

(assert (=> b!249295 m!265265))

(declare-fun m!265341 () Bool)

(assert (=> b!249295 m!265341))

(assert (=> b!249295 m!265189))

(declare-fun m!265343 () Bool)

(assert (=> b!249295 m!265343))

(assert (=> b!249295 m!265267))

(assert (=> b!249295 m!265341))

(declare-fun m!265345 () Bool)

(assert (=> b!249295 m!265345))

(assert (=> b!249295 m!265265))

(assert (=> b!249295 m!265267))

(assert (=> b!249295 m!265269))

(declare-fun m!265347 () Bool)

(assert (=> b!249291 m!265347))

(assert (=> b!249298 m!265189))

(assert (=> b!249298 m!265189))

(assert (=> b!249298 m!265191))

(assert (=> b!249294 m!265265))

(assert (=> b!249294 m!265189))

(declare-fun m!265349 () Bool)

(assert (=> b!249294 m!265349))

(assert (=> b!249294 m!265189))

(assert (=> b!249294 m!265267))

(assert (=> b!249294 m!265265))

(assert (=> b!249294 m!265267))

(assert (=> b!249294 m!265269))

(assert (=> b!249301 m!265189))

(assert (=> b!249301 m!265189))

(declare-fun m!265351 () Bool)

(assert (=> b!249301 m!265351))

(assert (=> b!249219 d!60519))

(declare-fun d!60521 () Bool)

(assert (=> d!60521 (= (apply!238 (+!671 lt!124727 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504))) lt!124738) (apply!238 lt!124727 lt!124738))))

(declare-fun lt!124782 () Unit!7693)

(declare-fun choose!1183 (ListLongMap!3699 (_ BitVec 64) V!8281 (_ BitVec 64)) Unit!7693)

(assert (=> d!60521 (= lt!124782 (choose!1183 lt!124727 lt!124721 (zeroValue!4446 thiss!1504) lt!124738))))

(declare-fun e!161693 () Bool)

(assert (=> d!60521 e!161693))

(declare-fun res!122119 () Bool)

(assert (=> d!60521 (=> (not res!122119) (not e!161693))))

(assert (=> d!60521 (= res!122119 (contains!1787 lt!124727 lt!124738))))

(assert (=> d!60521 (= (addApplyDifferent!214 lt!124727 lt!124721 (zeroValue!4446 thiss!1504) lt!124738) lt!124782)))

(declare-fun b!249306 () Bool)

(assert (=> b!249306 (= e!161693 (not (= lt!124738 lt!124721)))))

(assert (= (and d!60521 res!122119) b!249306))

(assert (=> d!60521 m!265251))

(declare-fun m!265353 () Bool)

(assert (=> d!60521 m!265353))

(declare-fun m!265355 () Bool)

(assert (=> d!60521 m!265355))

(assert (=> d!60521 m!265231))

(assert (=> d!60521 m!265251))

(assert (=> d!60521 m!265253))

(assert (=> b!249219 d!60521))

(declare-fun d!60523 () Bool)

(assert (=> d!60523 (= (apply!238 (+!671 lt!124724 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504))) lt!124725) (apply!238 lt!124724 lt!124725))))

(declare-fun lt!124783 () Unit!7693)

(assert (=> d!60523 (= lt!124783 (choose!1183 lt!124724 lt!124723 (minValue!4446 thiss!1504) lt!124725))))

(declare-fun e!161694 () Bool)

(assert (=> d!60523 e!161694))

(declare-fun res!122120 () Bool)

(assert (=> d!60523 (=> (not res!122120) (not e!161694))))

(assert (=> d!60523 (= res!122120 (contains!1787 lt!124724 lt!124725))))

(assert (=> d!60523 (= (addApplyDifferent!214 lt!124724 lt!124723 (minValue!4446 thiss!1504) lt!124725) lt!124783)))

(declare-fun b!249307 () Bool)

(assert (=> b!249307 (= e!161694 (not (= lt!124725 lt!124723)))))

(assert (= (and d!60523 res!122120) b!249307))

(assert (=> d!60523 m!265227))

(declare-fun m!265357 () Bool)

(assert (=> d!60523 m!265357))

(declare-fun m!265359 () Bool)

(assert (=> d!60523 m!265359))

(assert (=> d!60523 m!265241))

(assert (=> d!60523 m!265227))

(assert (=> d!60523 m!265229))

(assert (=> b!249219 d!60523))

(declare-fun d!60525 () Bool)

(declare-fun e!161695 () Bool)

(assert (=> d!60525 e!161695))

(declare-fun res!122121 () Bool)

(assert (=> d!60525 (=> (not res!122121) (not e!161695))))

(declare-fun lt!124785 () ListLongMap!3699)

(assert (=> d!60525 (= res!122121 (contains!1787 lt!124785 (_1!2409 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504)))))))

(declare-fun lt!124786 () List!3697)

(assert (=> d!60525 (= lt!124785 (ListLongMap!3700 lt!124786))))

(declare-fun lt!124787 () Unit!7693)

(declare-fun lt!124784 () Unit!7693)

(assert (=> d!60525 (= lt!124787 lt!124784)))

(assert (=> d!60525 (= (getValueByKey!294 lt!124786 (_1!2409 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504)))) (Some!299 (_2!2409 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504)))))))

(assert (=> d!60525 (= lt!124784 (lemmaContainsTupThenGetReturnValue!158 lt!124786 (_1!2409 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504))) (_2!2409 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504)))))))

(assert (=> d!60525 (= lt!124786 (insertStrictlySorted!161 (toList!1865 lt!124735) (_1!2409 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504))) (_2!2409 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504)))))))

(assert (=> d!60525 (= (+!671 lt!124735 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504))) lt!124785)))

(declare-fun b!249308 () Bool)

(declare-fun res!122122 () Bool)

(assert (=> b!249308 (=> (not res!122122) (not e!161695))))

(assert (=> b!249308 (= res!122122 (= (getValueByKey!294 (toList!1865 lt!124785) (_1!2409 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504)))) (Some!299 (_2!2409 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504))))))))

(declare-fun b!249309 () Bool)

(assert (=> b!249309 (= e!161695 (contains!1791 (toList!1865 lt!124785) (tuple2!4797 lt!124720 (minValue!4446 thiss!1504))))))

(assert (= (and d!60525 res!122121) b!249308))

(assert (= (and b!249308 res!122122) b!249309))

(declare-fun m!265361 () Bool)

(assert (=> d!60525 m!265361))

(declare-fun m!265363 () Bool)

(assert (=> d!60525 m!265363))

(declare-fun m!265365 () Bool)

(assert (=> d!60525 m!265365))

(declare-fun m!265367 () Bool)

(assert (=> d!60525 m!265367))

(declare-fun m!265369 () Bool)

(assert (=> b!249308 m!265369))

(declare-fun m!265371 () Bool)

(assert (=> b!249309 m!265371))

(assert (=> b!249219 d!60525))

(declare-fun d!60527 () Bool)

(assert (=> d!60527 (contains!1787 (+!671 lt!124730 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504))) lt!124732)))

(declare-fun lt!124790 () Unit!7693)

(declare-fun choose!1184 (ListLongMap!3699 (_ BitVec 64) V!8281 (_ BitVec 64)) Unit!7693)

(assert (=> d!60527 (= lt!124790 (choose!1184 lt!124730 lt!124731 (zeroValue!4446 thiss!1504) lt!124732))))

(assert (=> d!60527 (contains!1787 lt!124730 lt!124732)))

(assert (=> d!60527 (= (addStillContains!214 lt!124730 lt!124731 (zeroValue!4446 thiss!1504) lt!124732) lt!124790)))

(declare-fun bs!8922 () Bool)

(assert (= bs!8922 d!60527))

(assert (=> bs!8922 m!265235))

(assert (=> bs!8922 m!265235))

(assert (=> bs!8922 m!265239))

(declare-fun m!265373 () Bool)

(assert (=> bs!8922 m!265373))

(declare-fun m!265375 () Bool)

(assert (=> bs!8922 m!265375))

(assert (=> b!249219 d!60527))

(declare-fun d!60529 () Bool)

(assert (=> d!60529 (= (apply!238 (+!671 lt!124735 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504))) lt!124728) (apply!238 lt!124735 lt!124728))))

(declare-fun lt!124791 () Unit!7693)

(assert (=> d!60529 (= lt!124791 (choose!1183 lt!124735 lt!124720 (minValue!4446 thiss!1504) lt!124728))))

(declare-fun e!161696 () Bool)

(assert (=> d!60529 e!161696))

(declare-fun res!122123 () Bool)

(assert (=> d!60529 (=> (not res!122123) (not e!161696))))

(assert (=> d!60529 (= res!122123 (contains!1787 lt!124735 lt!124728))))

(assert (=> d!60529 (= (addApplyDifferent!214 lt!124735 lt!124720 (minValue!4446 thiss!1504) lt!124728) lt!124791)))

(declare-fun b!249311 () Bool)

(assert (=> b!249311 (= e!161696 (not (= lt!124728 lt!124720)))))

(assert (= (and d!60529 res!122123) b!249311))

(assert (=> d!60529 m!265255))

(declare-fun m!265377 () Bool)

(assert (=> d!60529 m!265377))

(declare-fun m!265379 () Bool)

(assert (=> d!60529 m!265379))

(assert (=> d!60529 m!265233))

(assert (=> d!60529 m!265255))

(assert (=> d!60529 m!265257))

(assert (=> b!249219 d!60529))

(declare-fun d!60531 () Bool)

(declare-fun e!161697 () Bool)

(assert (=> d!60531 e!161697))

(declare-fun res!122124 () Bool)

(assert (=> d!60531 (=> (not res!122124) (not e!161697))))

(declare-fun lt!124793 () ListLongMap!3699)

(assert (=> d!60531 (= res!122124 (contains!1787 lt!124793 (_1!2409 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504)))))))

(declare-fun lt!124794 () List!3697)

(assert (=> d!60531 (= lt!124793 (ListLongMap!3700 lt!124794))))

(declare-fun lt!124795 () Unit!7693)

(declare-fun lt!124792 () Unit!7693)

(assert (=> d!60531 (= lt!124795 lt!124792)))

(assert (=> d!60531 (= (getValueByKey!294 lt!124794 (_1!2409 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504)))) (Some!299 (_2!2409 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504)))))))

(assert (=> d!60531 (= lt!124792 (lemmaContainsTupThenGetReturnValue!158 lt!124794 (_1!2409 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504))) (_2!2409 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504)))))))

(assert (=> d!60531 (= lt!124794 (insertStrictlySorted!161 (toList!1865 lt!124724) (_1!2409 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504))) (_2!2409 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504)))))))

(assert (=> d!60531 (= (+!671 lt!124724 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504))) lt!124793)))

(declare-fun b!249312 () Bool)

(declare-fun res!122125 () Bool)

(assert (=> b!249312 (=> (not res!122125) (not e!161697))))

(assert (=> b!249312 (= res!122125 (= (getValueByKey!294 (toList!1865 lt!124793) (_1!2409 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504)))) (Some!299 (_2!2409 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504))))))))

(declare-fun b!249313 () Bool)

(assert (=> b!249313 (= e!161697 (contains!1791 (toList!1865 lt!124793) (tuple2!4797 lt!124723 (minValue!4446 thiss!1504))))))

(assert (= (and d!60531 res!122124) b!249312))

(assert (= (and b!249312 res!122125) b!249313))

(declare-fun m!265381 () Bool)

(assert (=> d!60531 m!265381))

(declare-fun m!265383 () Bool)

(assert (=> d!60531 m!265383))

(declare-fun m!265385 () Bool)

(assert (=> d!60531 m!265385))

(declare-fun m!265387 () Bool)

(assert (=> d!60531 m!265387))

(declare-fun m!265389 () Bool)

(assert (=> b!249312 m!265389))

(declare-fun m!265391 () Bool)

(assert (=> b!249313 m!265391))

(assert (=> b!249219 d!60531))

(declare-fun d!60533 () Bool)

(assert (=> d!60533 (= (apply!238 (+!671 lt!124735 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504))) lt!124728) (get!2980 (getValueByKey!294 (toList!1865 (+!671 lt!124735 (tuple2!4797 lt!124720 (minValue!4446 thiss!1504)))) lt!124728)))))

(declare-fun bs!8923 () Bool)

(assert (= bs!8923 d!60533))

(declare-fun m!265393 () Bool)

(assert (=> bs!8923 m!265393))

(assert (=> bs!8923 m!265393))

(declare-fun m!265395 () Bool)

(assert (=> bs!8923 m!265395))

(assert (=> b!249219 d!60533))

(declare-fun d!60535 () Bool)

(declare-fun e!161698 () Bool)

(assert (=> d!60535 e!161698))

(declare-fun res!122126 () Bool)

(assert (=> d!60535 (=> (not res!122126) (not e!161698))))

(declare-fun lt!124797 () ListLongMap!3699)

(assert (=> d!60535 (= res!122126 (contains!1787 lt!124797 (_1!2409 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504)))))))

(declare-fun lt!124798 () List!3697)

(assert (=> d!60535 (= lt!124797 (ListLongMap!3700 lt!124798))))

(declare-fun lt!124799 () Unit!7693)

(declare-fun lt!124796 () Unit!7693)

(assert (=> d!60535 (= lt!124799 lt!124796)))

(assert (=> d!60535 (= (getValueByKey!294 lt!124798 (_1!2409 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504)))) (Some!299 (_2!2409 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504)))))))

(assert (=> d!60535 (= lt!124796 (lemmaContainsTupThenGetReturnValue!158 lt!124798 (_1!2409 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504))) (_2!2409 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504)))))))

(assert (=> d!60535 (= lt!124798 (insertStrictlySorted!161 (toList!1865 lt!124727) (_1!2409 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504))) (_2!2409 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504)))))))

(assert (=> d!60535 (= (+!671 lt!124727 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504))) lt!124797)))

(declare-fun b!249314 () Bool)

(declare-fun res!122127 () Bool)

(assert (=> b!249314 (=> (not res!122127) (not e!161698))))

(assert (=> b!249314 (= res!122127 (= (getValueByKey!294 (toList!1865 lt!124797) (_1!2409 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504)))) (Some!299 (_2!2409 (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504))))))))

(declare-fun b!249315 () Bool)

(assert (=> b!249315 (= e!161698 (contains!1791 (toList!1865 lt!124797) (tuple2!4797 lt!124721 (zeroValue!4446 thiss!1504))))))

(assert (= (and d!60535 res!122126) b!249314))

(assert (= (and b!249314 res!122127) b!249315))

(declare-fun m!265397 () Bool)

(assert (=> d!60535 m!265397))

(declare-fun m!265399 () Bool)

(assert (=> d!60535 m!265399))

(declare-fun m!265401 () Bool)

(assert (=> d!60535 m!265401))

(declare-fun m!265403 () Bool)

(assert (=> d!60535 m!265403))

(declare-fun m!265405 () Bool)

(assert (=> b!249314 m!265405))

(declare-fun m!265407 () Bool)

(assert (=> b!249315 m!265407))

(assert (=> b!249219 d!60535))

(declare-fun d!60537 () Bool)

(declare-fun e!161699 () Bool)

(assert (=> d!60537 e!161699))

(declare-fun res!122128 () Bool)

(assert (=> d!60537 (=> res!122128 e!161699)))

(declare-fun lt!124803 () Bool)

(assert (=> d!60537 (= res!122128 (not lt!124803))))

(declare-fun lt!124802 () Bool)

(assert (=> d!60537 (= lt!124803 lt!124802)))

(declare-fun lt!124801 () Unit!7693)

(declare-fun e!161700 () Unit!7693)

(assert (=> d!60537 (= lt!124801 e!161700)))

(declare-fun c!41820 () Bool)

(assert (=> d!60537 (= c!41820 lt!124802)))

(assert (=> d!60537 (= lt!124802 (containsKey!286 (toList!1865 (+!671 lt!124730 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504)))) lt!124732))))

(assert (=> d!60537 (= (contains!1787 (+!671 lt!124730 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504))) lt!124732) lt!124803)))

(declare-fun b!249316 () Bool)

(declare-fun lt!124800 () Unit!7693)

(assert (=> b!249316 (= e!161700 lt!124800)))

(assert (=> b!249316 (= lt!124800 (lemmaContainsKeyImpliesGetValueByKeyDefined!235 (toList!1865 (+!671 lt!124730 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504)))) lt!124732))))

(assert (=> b!249316 (isDefined!236 (getValueByKey!294 (toList!1865 (+!671 lt!124730 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504)))) lt!124732))))

(declare-fun b!249317 () Bool)

(declare-fun Unit!7706 () Unit!7693)

(assert (=> b!249317 (= e!161700 Unit!7706)))

(declare-fun b!249318 () Bool)

(assert (=> b!249318 (= e!161699 (isDefined!236 (getValueByKey!294 (toList!1865 (+!671 lt!124730 (tuple2!4797 lt!124731 (zeroValue!4446 thiss!1504)))) lt!124732)))))

(assert (= (and d!60537 c!41820) b!249316))

(assert (= (and d!60537 (not c!41820)) b!249317))

(assert (= (and d!60537 (not res!122128)) b!249318))

(declare-fun m!265409 () Bool)

(assert (=> d!60537 m!265409))

(declare-fun m!265411 () Bool)

(assert (=> b!249316 m!265411))

(declare-fun m!265413 () Bool)

(assert (=> b!249316 m!265413))

(assert (=> b!249316 m!265413))

(declare-fun m!265415 () Bool)

(assert (=> b!249316 m!265415))

(assert (=> b!249318 m!265413))

(assert (=> b!249318 m!265413))

(assert (=> b!249318 m!265415))

(assert (=> b!249219 d!60537))

(declare-fun d!60539 () Bool)

(assert (=> d!60539 (= (apply!238 (+!671 lt!124724 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504))) lt!124725) (get!2980 (getValueByKey!294 (toList!1865 (+!671 lt!124724 (tuple2!4797 lt!124723 (minValue!4446 thiss!1504)))) lt!124725)))))

(declare-fun bs!8924 () Bool)

(assert (= bs!8924 d!60539))

(declare-fun m!265417 () Bool)

(assert (=> bs!8924 m!265417))

(assert (=> bs!8924 m!265417))

(declare-fun m!265419 () Bool)

(assert (=> bs!8924 m!265419))

(assert (=> b!249219 d!60539))

(declare-fun d!60541 () Bool)

(assert (=> d!60541 (= (apply!238 lt!124735 lt!124728) (get!2980 (getValueByKey!294 (toList!1865 lt!124735) lt!124728)))))

(declare-fun bs!8925 () Bool)

(assert (= bs!8925 d!60541))

(declare-fun m!265421 () Bool)

(assert (=> bs!8925 m!265421))

(assert (=> bs!8925 m!265421))

(declare-fun m!265423 () Bool)

(assert (=> bs!8925 m!265423))

(assert (=> b!249219 d!60541))

(declare-fun b!249319 () Bool)

(declare-fun e!161701 () Bool)

(declare-fun call!23404 () Bool)

(assert (=> b!249319 (= e!161701 call!23404)))

(declare-fun b!249320 () Bool)

(declare-fun e!161702 () Bool)

(assert (=> b!249320 (= e!161702 call!23404)))

(declare-fun b!249321 () Bool)

(assert (=> b!249321 (= e!161701 e!161702)))

(declare-fun lt!124805 () (_ BitVec 64))

(assert (=> b!249321 (= lt!124805 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!124804 () Unit!7693)

(assert (=> b!249321 (= lt!124804 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6732 thiss!1504) lt!124805 #b00000000000000000000000000000000))))

(assert (=> b!249321 (arrayContainsKey!0 (_keys!6732 thiss!1504) lt!124805 #b00000000000000000000000000000000)))

(declare-fun lt!124806 () Unit!7693)

(assert (=> b!249321 (= lt!124806 lt!124804)))

(declare-fun res!122129 () Bool)

(assert (=> b!249321 (= res!122129 (= (seekEntryOrOpen!0 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000) (_keys!6732 thiss!1504) (mask!10765 thiss!1504)) (Found!1113 #b00000000000000000000000000000000)))))

(assert (=> b!249321 (=> (not res!122129) (not e!161702))))

(declare-fun bm!23401 () Bool)

(assert (=> bm!23401 (= call!23404 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(declare-fun b!249322 () Bool)

(declare-fun e!161703 () Bool)

(assert (=> b!249322 (= e!161703 e!161701)))

(declare-fun c!41821 () Bool)

(assert (=> b!249322 (= c!41821 (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60543 () Bool)

(declare-fun res!122130 () Bool)

(assert (=> d!60543 (=> res!122130 e!161703)))

(assert (=> d!60543 (= res!122130 (bvsge #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)) e!161703)))

(assert (= (and d!60543 (not res!122130)) b!249322))

(assert (= (and b!249322 c!41821) b!249321))

(assert (= (and b!249322 (not c!41821)) b!249319))

(assert (= (and b!249321 res!122129) b!249320))

(assert (= (or b!249320 b!249319) bm!23401))

(assert (=> b!249321 m!265189))

(declare-fun m!265425 () Bool)

(assert (=> b!249321 m!265425))

(declare-fun m!265427 () Bool)

(assert (=> b!249321 m!265427))

(assert (=> b!249321 m!265189))

(declare-fun m!265429 () Bool)

(assert (=> b!249321 m!265429))

(declare-fun m!265431 () Bool)

(assert (=> bm!23401 m!265431))

(assert (=> b!249322 m!265189))

(assert (=> b!249322 m!265189))

(assert (=> b!249322 m!265191))

(assert (=> b!249236 d!60543))

(declare-fun d!60545 () Bool)

(assert (=> d!60545 (= (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) index!297)) (and (not (= (select (arr!5812 (_keys!6732 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5812 (_keys!6732 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249108 d!60545))

(declare-fun d!60547 () Bool)

(assert (=> d!60547 (= (apply!238 lt!124719 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2980 (getValueByKey!294 (toList!1865 lt!124719) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8926 () Bool)

(assert (= bs!8926 d!60547))

(declare-fun m!265433 () Bool)

(assert (=> bs!8926 m!265433))

(assert (=> bs!8926 m!265433))

(declare-fun m!265435 () Bool)

(assert (=> bs!8926 m!265435))

(assert (=> b!249218 d!60547))

(declare-fun d!60549 () Bool)

(declare-fun lt!124809 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!164 (List!3698) (InoxSet (_ BitVec 64)))

(assert (=> d!60549 (= lt!124809 (select (content!164 Nil!3695) (select (arr!5812 lt!124553) #b00000000000000000000000000000000)))))

(declare-fun e!161709 () Bool)

(assert (=> d!60549 (= lt!124809 e!161709)))

(declare-fun res!122135 () Bool)

(assert (=> d!60549 (=> (not res!122135) (not e!161709))))

(assert (=> d!60549 (= res!122135 ((_ is Cons!3694) Nil!3695))))

(assert (=> d!60549 (= (contains!1790 Nil!3695 (select (arr!5812 lt!124553) #b00000000000000000000000000000000)) lt!124809)))

(declare-fun b!249327 () Bool)

(declare-fun e!161708 () Bool)

(assert (=> b!249327 (= e!161709 e!161708)))

(declare-fun res!122136 () Bool)

(assert (=> b!249327 (=> res!122136 e!161708)))

(assert (=> b!249327 (= res!122136 (= (h!4352 Nil!3695) (select (arr!5812 lt!124553) #b00000000000000000000000000000000)))))

(declare-fun b!249328 () Bool)

(assert (=> b!249328 (= e!161708 (contains!1790 (t!8718 Nil!3695) (select (arr!5812 lt!124553) #b00000000000000000000000000000000)))))

(assert (= (and d!60549 res!122135) b!249327))

(assert (= (and b!249327 (not res!122136)) b!249328))

(declare-fun m!265437 () Bool)

(assert (=> d!60549 m!265437))

(assert (=> d!60549 m!265173))

(declare-fun m!265439 () Bool)

(assert (=> d!60549 m!265439))

(assert (=> b!249328 m!265173))

(declare-fun m!265441 () Bool)

(assert (=> b!249328 m!265441))

(assert (=> b!249142 d!60549))

(declare-fun b!249339 () Bool)

(declare-fun res!122148 () Bool)

(declare-fun e!161712 () Bool)

(assert (=> b!249339 (=> (not res!122148) (not e!161712))))

(declare-fun size!6161 (LongMapFixedSize!3688) (_ BitVec 32))

(assert (=> b!249339 (= res!122148 (= (size!6161 thiss!1504) (bvadd (_size!1893 thiss!1504) (bvsdiv (bvadd (extraKeys!4342 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!249338 () Bool)

(declare-fun res!122145 () Bool)

(assert (=> b!249338 (=> (not res!122145) (not e!161712))))

(assert (=> b!249338 (= res!122145 (bvsge (size!6161 thiss!1504) (_size!1893 thiss!1504)))))

(declare-fun d!60551 () Bool)

(declare-fun res!122146 () Bool)

(assert (=> d!60551 (=> (not res!122146) (not e!161712))))

(assert (=> d!60551 (= res!122146 (validMask!0 (mask!10765 thiss!1504)))))

(assert (=> d!60551 (= (simpleValid!261 thiss!1504) e!161712)))

(declare-fun b!249337 () Bool)

(declare-fun res!122147 () Bool)

(assert (=> b!249337 (=> (not res!122147) (not e!161712))))

(assert (=> b!249337 (= res!122147 (and (= (size!6155 (_values!4588 thiss!1504)) (bvadd (mask!10765 thiss!1504) #b00000000000000000000000000000001)) (= (size!6156 (_keys!6732 thiss!1504)) (size!6155 (_values!4588 thiss!1504))) (bvsge (_size!1893 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1893 thiss!1504) (bvadd (mask!10765 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!249340 () Bool)

(assert (=> b!249340 (= e!161712 (and (bvsge (extraKeys!4342 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4342 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1893 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!60551 res!122146) b!249337))

(assert (= (and b!249337 res!122147) b!249338))

(assert (= (and b!249338 res!122145) b!249339))

(assert (= (and b!249339 res!122148) b!249340))

(declare-fun m!265443 () Bool)

(assert (=> b!249339 m!265443))

(assert (=> b!249338 m!265443))

(assert (=> d!60551 m!265009))

(assert (=> d!60501 d!60551))

(declare-fun d!60553 () Bool)

(declare-fun res!122153 () Bool)

(declare-fun e!161717 () Bool)

(assert (=> d!60553 (=> res!122153 e!161717)))

(assert (=> d!60553 (= res!122153 (and ((_ is Cons!3693) (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) (= (_1!2409 (h!4351 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) key!932)))))

(assert (=> d!60553 (= (containsKey!286 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932) e!161717)))

(declare-fun b!249345 () Bool)

(declare-fun e!161718 () Bool)

(assert (=> b!249345 (= e!161717 e!161718)))

(declare-fun res!122154 () Bool)

(assert (=> b!249345 (=> (not res!122154) (not e!161718))))

(assert (=> b!249345 (= res!122154 (and (or (not ((_ is Cons!3693) (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) (bvsle (_1!2409 (h!4351 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) key!932)) ((_ is Cons!3693) (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) (bvslt (_1!2409 (h!4351 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) key!932)))))

(declare-fun b!249346 () Bool)

(assert (=> b!249346 (= e!161718 (containsKey!286 (t!8717 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) key!932))))

(assert (= (and d!60553 (not res!122153)) b!249345))

(assert (= (and b!249345 res!122154) b!249346))

(declare-fun m!265445 () Bool)

(assert (=> b!249346 m!265445))

(assert (=> d!60497 d!60553))

(assert (=> bm!23391 d!60519))

(declare-fun b!249347 () Bool)

(declare-fun e!161719 () Bool)

(declare-fun call!23405 () Bool)

(assert (=> b!249347 (= e!161719 call!23405)))

(declare-fun b!249348 () Bool)

(declare-fun e!161722 () Bool)

(assert (=> b!249348 (= e!161722 e!161719)))

(declare-fun c!41822 () Bool)

(assert (=> b!249348 (= c!41822 (validKeyInArray!0 (select (arr!5812 lt!124553) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!60555 () Bool)

(declare-fun res!122155 () Bool)

(declare-fun e!161721 () Bool)

(assert (=> d!60555 (=> res!122155 e!161721)))

(assert (=> d!60555 (= res!122155 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 lt!124553)))))

(assert (=> d!60555 (= (arrayNoDuplicates!0 lt!124553 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41784 (Cons!3694 (select (arr!5812 lt!124553) #b00000000000000000000000000000000) Nil!3695) Nil!3695)) e!161721)))

(declare-fun b!249349 () Bool)

(assert (=> b!249349 (= e!161721 e!161722)))

(declare-fun res!122156 () Bool)

(assert (=> b!249349 (=> (not res!122156) (not e!161722))))

(declare-fun e!161720 () Bool)

(assert (=> b!249349 (= res!122156 (not e!161720))))

(declare-fun res!122157 () Bool)

(assert (=> b!249349 (=> (not res!122157) (not e!161720))))

(assert (=> b!249349 (= res!122157 (validKeyInArray!0 (select (arr!5812 lt!124553) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!23402 () Bool)

(assert (=> bm!23402 (= call!23405 (arrayNoDuplicates!0 lt!124553 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!41822 (Cons!3694 (select (arr!5812 lt!124553) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!41784 (Cons!3694 (select (arr!5812 lt!124553) #b00000000000000000000000000000000) Nil!3695) Nil!3695)) (ite c!41784 (Cons!3694 (select (arr!5812 lt!124553) #b00000000000000000000000000000000) Nil!3695) Nil!3695))))))

(declare-fun b!249350 () Bool)

(assert (=> b!249350 (= e!161719 call!23405)))

(declare-fun b!249351 () Bool)

(assert (=> b!249351 (= e!161720 (contains!1790 (ite c!41784 (Cons!3694 (select (arr!5812 lt!124553) #b00000000000000000000000000000000) Nil!3695) Nil!3695) (select (arr!5812 lt!124553) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!60555 (not res!122155)) b!249349))

(assert (= (and b!249349 res!122157) b!249351))

(assert (= (and b!249349 res!122156) b!249348))

(assert (= (and b!249348 c!41822) b!249347))

(assert (= (and b!249348 (not c!41822)) b!249350))

(assert (= (or b!249347 b!249350) bm!23402))

(assert (=> b!249348 m!265289))

(assert (=> b!249348 m!265289))

(assert (=> b!249348 m!265299))

(assert (=> b!249349 m!265289))

(assert (=> b!249349 m!265289))

(assert (=> b!249349 m!265299))

(assert (=> bm!23402 m!265289))

(declare-fun m!265447 () Bool)

(assert (=> bm!23402 m!265447))

(assert (=> b!249351 m!265289))

(assert (=> b!249351 m!265289))

(declare-fun m!265449 () Bool)

(assert (=> b!249351 m!265449))

(assert (=> bm!23374 d!60555))

(declare-fun d!60557 () Bool)

(assert (=> d!60557 (= (validKeyInArray!0 (select (arr!5812 lt!124553) #b00000000000000000000000000000000)) (and (not (= (select (arr!5812 lt!124553) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5812 lt!124553) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249139 d!60557))

(declare-fun d!60559 () Bool)

(declare-fun e!161723 () Bool)

(assert (=> d!60559 e!161723))

(declare-fun res!122158 () Bool)

(assert (=> d!60559 (=> (not res!122158) (not e!161723))))

(declare-fun lt!124811 () ListLongMap!3699)

(assert (=> d!60559 (= res!122158 (contains!1787 lt!124811 (_1!2409 (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))))

(declare-fun lt!124812 () List!3697)

(assert (=> d!60559 (= lt!124811 (ListLongMap!3700 lt!124812))))

(declare-fun lt!124813 () Unit!7693)

(declare-fun lt!124810 () Unit!7693)

(assert (=> d!60559 (= lt!124813 lt!124810)))

(assert (=> d!60559 (= (getValueByKey!294 lt!124812 (_1!2409 (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))) (Some!299 (_2!2409 (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))))

(assert (=> d!60559 (= lt!124810 (lemmaContainsTupThenGetReturnValue!158 lt!124812 (_1!2409 (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))) (_2!2409 (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))))

(assert (=> d!60559 (= lt!124812 (insertStrictlySorted!161 (toList!1865 (ite c!41801 call!23397 (ite c!41803 call!23396 call!23398))) (_1!2409 (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))) (_2!2409 (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))))

(assert (=> d!60559 (= (+!671 (ite c!41801 call!23397 (ite c!41803 call!23396 call!23398)) (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))) lt!124811)))

(declare-fun b!249352 () Bool)

(declare-fun res!122159 () Bool)

(assert (=> b!249352 (=> (not res!122159) (not e!161723))))

(assert (=> b!249352 (= res!122159 (= (getValueByKey!294 (toList!1865 lt!124811) (_1!2409 (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))) (Some!299 (_2!2409 (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))))

(declare-fun b!249353 () Bool)

(assert (=> b!249353 (= e!161723 (contains!1791 (toList!1865 lt!124811) (ite (or c!41801 c!41803) (tuple2!4797 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4446 thiss!1504)) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(assert (= (and d!60559 res!122158) b!249352))

(assert (= (and b!249352 res!122159) b!249353))

(declare-fun m!265451 () Bool)

(assert (=> d!60559 m!265451))

(declare-fun m!265453 () Bool)

(assert (=> d!60559 m!265453))

(declare-fun m!265455 () Bool)

(assert (=> d!60559 m!265455))

(declare-fun m!265457 () Bool)

(assert (=> d!60559 m!265457))

(declare-fun m!265459 () Bool)

(assert (=> b!249352 m!265459))

(declare-fun m!265461 () Bool)

(assert (=> b!249353 m!265461))

(assert (=> bm!23390 d!60559))

(declare-fun d!60561 () Bool)

(declare-fun isEmpty!529 (Option!300) Bool)

(assert (=> d!60561 (= (isDefined!236 (getValueByKey!294 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932)) (not (isEmpty!529 (getValueByKey!294 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))))

(declare-fun bs!8927 () Bool)

(assert (= bs!8927 d!60561))

(assert (=> bs!8927 m!265219))

(declare-fun m!265463 () Bool)

(assert (=> bs!8927 m!265463))

(assert (=> b!249163 d!60561))

(declare-fun b!249364 () Bool)

(declare-fun e!161729 () Option!300)

(assert (=> b!249364 (= e!161729 (getValueByKey!294 (t!8717 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) key!932))))

(declare-fun b!249363 () Bool)

(declare-fun e!161728 () Option!300)

(assert (=> b!249363 (= e!161728 e!161729)))

(declare-fun c!41828 () Bool)

(assert (=> b!249363 (= c!41828 (and ((_ is Cons!3693) (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) (not (= (_1!2409 (h!4351 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) key!932))))))

(declare-fun d!60563 () Bool)

(declare-fun c!41827 () Bool)

(assert (=> d!60563 (= c!41827 (and ((_ is Cons!3693) (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))) (= (_1!2409 (h!4351 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))))) key!932)))))

(assert (=> d!60563 (= (getValueByKey!294 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932) e!161728)))

(declare-fun b!249365 () Bool)

(assert (=> b!249365 (= e!161729 None!298)))

(declare-fun b!249362 () Bool)

(assert (=> b!249362 (= e!161728 (Some!299 (_2!2409 (h!4351 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))))))

(assert (= (and d!60563 c!41827) b!249362))

(assert (= (and d!60563 (not c!41827)) b!249363))

(assert (= (and b!249363 c!41828) b!249364))

(assert (= (and b!249363 (not c!41828)) b!249365))

(declare-fun m!265465 () Bool)

(assert (=> b!249364 m!265465))

(assert (=> b!249163 d!60563))

(declare-fun d!60565 () Bool)

(assert (=> d!60565 (isDefined!236 (getValueByKey!294 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(declare-fun lt!124816 () Unit!7693)

(declare-fun choose!1185 (List!3697 (_ BitVec 64)) Unit!7693)

(assert (=> d!60565 (= lt!124816 (choose!1185 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(declare-fun e!161732 () Bool)

(assert (=> d!60565 e!161732))

(declare-fun res!122162 () Bool)

(assert (=> d!60565 (=> (not res!122162) (not e!161732))))

(declare-fun isStrictlySorted!364 (List!3697) Bool)

(assert (=> d!60565 (= res!122162 (isStrictlySorted!364 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)))))))

(assert (=> d!60565 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!235 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932) lt!124816)))

(declare-fun b!249368 () Bool)

(assert (=> b!249368 (= e!161732 (containsKey!286 (toList!1865 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504))) key!932))))

(assert (= (and d!60565 res!122162) b!249368))

(assert (=> d!60565 m!265219))

(assert (=> d!60565 m!265219))

(assert (=> d!60565 m!265221))

(declare-fun m!265467 () Bool)

(assert (=> d!60565 m!265467))

(declare-fun m!265469 () Bool)

(assert (=> d!60565 m!265469))

(assert (=> b!249368 m!265215))

(assert (=> b!249161 d!60565))

(assert (=> b!249161 d!60561))

(assert (=> b!249161 d!60563))

(declare-fun d!60567 () Bool)

(declare-fun res!122163 () Bool)

(declare-fun e!161733 () Bool)

(assert (=> d!60567 (=> res!122163 e!161733)))

(assert (=> d!60567 (= res!122163 (= (select (arr!5812 (_keys!6732 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!60567 (= (arrayContainsKey!0 (_keys!6732 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!161733)))

(declare-fun b!249369 () Bool)

(declare-fun e!161734 () Bool)

(assert (=> b!249369 (= e!161733 e!161734)))

(declare-fun res!122164 () Bool)

(assert (=> b!249369 (=> (not res!122164) (not e!161734))))

(assert (=> b!249369 (= res!122164 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249370 () Bool)

(assert (=> b!249370 (= e!161734 (arrayContainsKey!0 (_keys!6732 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!60567 (not res!122163)) b!249369))

(assert (= (and b!249369 res!122164) b!249370))

(declare-fun m!265471 () Bool)

(assert (=> d!60567 m!265471))

(declare-fun m!265473 () Bool)

(assert (=> b!249370 m!265473))

(assert (=> b!249151 d!60567))

(declare-fun d!60569 () Bool)

(declare-fun e!161735 () Bool)

(assert (=> d!60569 e!161735))

(declare-fun res!122165 () Bool)

(assert (=> d!60569 (=> res!122165 e!161735)))

(declare-fun lt!124820 () Bool)

(assert (=> d!60569 (= res!122165 (not lt!124820))))

(declare-fun lt!124819 () Bool)

(assert (=> d!60569 (= lt!124820 lt!124819)))

(declare-fun lt!124818 () Unit!7693)

(declare-fun e!161736 () Unit!7693)

(assert (=> d!60569 (= lt!124818 e!161736)))

(declare-fun c!41829 () Bool)

(assert (=> d!60569 (= c!41829 lt!124819)))

(assert (=> d!60569 (= lt!124819 (containsKey!286 (toList!1865 lt!124719) (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60569 (= (contains!1787 lt!124719 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)) lt!124820)))

(declare-fun b!249371 () Bool)

(declare-fun lt!124817 () Unit!7693)

(assert (=> b!249371 (= e!161736 lt!124817)))

(assert (=> b!249371 (= lt!124817 (lemmaContainsKeyImpliesGetValueByKeyDefined!235 (toList!1865 lt!124719) (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249371 (isDefined!236 (getValueByKey!294 (toList!1865 lt!124719) (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249372 () Bool)

(declare-fun Unit!7707 () Unit!7693)

(assert (=> b!249372 (= e!161736 Unit!7707)))

(declare-fun b!249373 () Bool)

(assert (=> b!249373 (= e!161735 (isDefined!236 (getValueByKey!294 (toList!1865 lt!124719) (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!60569 c!41829) b!249371))

(assert (= (and d!60569 (not c!41829)) b!249372))

(assert (= (and d!60569 (not res!122165)) b!249373))

(assert (=> d!60569 m!265189))

(declare-fun m!265475 () Bool)

(assert (=> d!60569 m!265475))

(assert (=> b!249371 m!265189))

(declare-fun m!265477 () Bool)

(assert (=> b!249371 m!265477))

(assert (=> b!249371 m!265189))

(declare-fun m!265479 () Bool)

(assert (=> b!249371 m!265479))

(assert (=> b!249371 m!265479))

(declare-fun m!265481 () Bool)

(assert (=> b!249371 m!265481))

(assert (=> b!249373 m!265189))

(assert (=> b!249373 m!265479))

(assert (=> b!249373 m!265479))

(assert (=> b!249373 m!265481))

(assert (=> b!249224 d!60569))

(declare-fun b!249387 () Bool)

(declare-fun c!41837 () Bool)

(declare-fun lt!124825 () (_ BitVec 64))

(assert (=> b!249387 (= c!41837 (= lt!124825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161745 () SeekEntryResult!1113)

(declare-fun e!161743 () SeekEntryResult!1113)

(assert (=> b!249387 (= e!161745 e!161743)))

(declare-fun b!249388 () Bool)

(assert (=> b!249388 (= e!161745 (Found!1113 (index!6624 lt!124639)))))

(declare-fun b!249389 () Bool)

(declare-fun e!161744 () SeekEntryResult!1113)

(assert (=> b!249389 (= e!161744 Undefined!1113)))

(declare-fun b!249390 () Bool)

(assert (=> b!249390 (= e!161743 (MissingVacant!1113 (index!6624 lt!124639)))))

(declare-fun b!249391 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249391 (= e!161743 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24610 lt!124639) #b00000000000000000000000000000001) (nextIndex!0 (index!6624 lt!124639) (x!24610 lt!124639) (mask!10765 thiss!1504)) (index!6624 lt!124639) key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(declare-fun b!249386 () Bool)

(assert (=> b!249386 (= e!161744 e!161745)))

(declare-fun c!41836 () Bool)

(assert (=> b!249386 (= c!41836 (= lt!124825 key!932))))

(declare-fun lt!124826 () SeekEntryResult!1113)

(declare-fun d!60571 () Bool)

(assert (=> d!60571 (and (or ((_ is Undefined!1113) lt!124826) (not ((_ is Found!1113) lt!124826)) (and (bvsge (index!6623 lt!124826) #b00000000000000000000000000000000) (bvslt (index!6623 lt!124826) (size!6156 (_keys!6732 thiss!1504))))) (or ((_ is Undefined!1113) lt!124826) ((_ is Found!1113) lt!124826) (not ((_ is MissingVacant!1113) lt!124826)) (not (= (index!6625 lt!124826) (index!6624 lt!124639))) (and (bvsge (index!6625 lt!124826) #b00000000000000000000000000000000) (bvslt (index!6625 lt!124826) (size!6156 (_keys!6732 thiss!1504))))) (or ((_ is Undefined!1113) lt!124826) (ite ((_ is Found!1113) lt!124826) (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6623 lt!124826)) key!932) (and ((_ is MissingVacant!1113) lt!124826) (= (index!6625 lt!124826) (index!6624 lt!124639)) (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6625 lt!124826)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!60571 (= lt!124826 e!161744)))

(declare-fun c!41838 () Bool)

(assert (=> d!60571 (= c!41838 (bvsge (x!24610 lt!124639) #b01111111111111111111111111111110))))

(assert (=> d!60571 (= lt!124825 (select (arr!5812 (_keys!6732 thiss!1504)) (index!6624 lt!124639)))))

(assert (=> d!60571 (validMask!0 (mask!10765 thiss!1504))))

(assert (=> d!60571 (= (seekKeyOrZeroReturnVacant!0 (x!24610 lt!124639) (index!6624 lt!124639) (index!6624 lt!124639) key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)) lt!124826)))

(assert (= (and d!60571 c!41838) b!249389))

(assert (= (and d!60571 (not c!41838)) b!249386))

(assert (= (and b!249386 c!41836) b!249388))

(assert (= (and b!249386 (not c!41836)) b!249387))

(assert (= (and b!249387 c!41837) b!249390))

(assert (= (and b!249387 (not c!41837)) b!249391))

(declare-fun m!265483 () Bool)

(assert (=> b!249391 m!265483))

(assert (=> b!249391 m!265483))

(declare-fun m!265485 () Bool)

(assert (=> b!249391 m!265485))

(declare-fun m!265487 () Bool)

(assert (=> d!60571 m!265487))

(declare-fun m!265489 () Bool)

(assert (=> d!60571 m!265489))

(assert (=> d!60571 m!265159))

(assert (=> d!60571 m!265009))

(assert (=> b!249085 d!60571))

(declare-fun d!60573 () Bool)

(assert (=> d!60573 (= (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249223 d!60573))

(declare-fun d!60575 () Bool)

(assert (=> d!60575 (arrayNoDuplicates!0 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) #b00000000000000000000000000000000 Nil!3695)))

(assert (=> d!60575 true))

(declare-fun _$65!74 () Unit!7693)

(assert (=> d!60575 (= (choose!41 (_keys!6732 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3695) _$65!74)))

(declare-fun bs!8928 () Bool)

(assert (= bs!8928 d!60575))

(assert (=> bs!8928 m!265017))

(assert (=> bs!8928 m!265207))

(assert (=> d!60489 d!60575))

(assert (=> b!249221 d!60573))

(assert (=> d!60499 d!60483))

(assert (=> b!249113 d!60573))

(declare-fun lt!124827 () (_ BitVec 32))

(declare-fun d!60577 () Bool)

(assert (=> d!60577 (and (bvsge lt!124827 #b00000000000000000000000000000000) (bvsle lt!124827 (bvsub (size!6156 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun e!161746 () (_ BitVec 32))

(assert (=> d!60577 (= lt!124827 e!161746)))

(declare-fun c!41839 () Bool)

(assert (=> d!60577 (= c!41839 (bvsge #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60577 (and (bvsle #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6156 (_keys!6732 thiss!1504)) (size!6156 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))))))))

(assert (=> d!60577 (= (arrayCountValidKeys!0 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) lt!124827)))

(declare-fun call!23406 () (_ BitVec 32))

(declare-fun bm!23403 () Bool)

(assert (=> bm!23403 (= call!23406 (arrayCountValidKeys!0 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249392 () Bool)

(assert (=> b!249392 (= e!161746 #b00000000000000000000000000000000)))

(declare-fun b!249393 () Bool)

(declare-fun e!161747 () (_ BitVec 32))

(assert (=> b!249393 (= e!161746 e!161747)))

(declare-fun c!41840 () Bool)

(assert (=> b!249393 (= c!41840 (validKeyInArray!0 (select (arr!5812 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!249394 () Bool)

(assert (=> b!249394 (= e!161747 call!23406)))

(declare-fun b!249395 () Bool)

(assert (=> b!249395 (= e!161747 (bvadd #b00000000000000000000000000000001 call!23406))))

(assert (= (and d!60577 c!41839) b!249392))

(assert (= (and d!60577 (not c!41839)) b!249393))

(assert (= (and b!249393 c!41840) b!249395))

(assert (= (and b!249393 (not c!41840)) b!249394))

(assert (= (or b!249395 b!249394) bm!23403))

(declare-fun m!265491 () Bool)

(assert (=> bm!23403 m!265491))

(assert (=> b!249393 m!265301))

(assert (=> b!249393 m!265301))

(assert (=> b!249393 m!265303))

(assert (=> b!249111 d!60577))

(assert (=> b!249111 d!60481))

(declare-fun b!249396 () Bool)

(declare-fun e!161748 () Bool)

(declare-fun call!23407 () Bool)

(assert (=> b!249396 (= e!161748 call!23407)))

(declare-fun b!249397 () Bool)

(declare-fun e!161751 () Bool)

(assert (=> b!249397 (= e!161751 e!161748)))

(declare-fun c!41841 () Bool)

(assert (=> b!249397 (= c!41841 (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60579 () Bool)

(declare-fun res!122166 () Bool)

(declare-fun e!161750 () Bool)

(assert (=> d!60579 (=> res!122166 e!161750)))

(assert (=> d!60579 (= res!122166 (bvsge #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60579 (= (arrayNoDuplicates!0 (_keys!6732 thiss!1504) #b00000000000000000000000000000000 Nil!3695) e!161750)))

(declare-fun b!249398 () Bool)

(assert (=> b!249398 (= e!161750 e!161751)))

(declare-fun res!122167 () Bool)

(assert (=> b!249398 (=> (not res!122167) (not e!161751))))

(declare-fun e!161749 () Bool)

(assert (=> b!249398 (= res!122167 (not e!161749))))

(declare-fun res!122168 () Bool)

(assert (=> b!249398 (=> (not res!122168) (not e!161749))))

(assert (=> b!249398 (= res!122168 (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23404 () Bool)

(assert (=> bm!23404 (= call!23407 (arrayNoDuplicates!0 (_keys!6732 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41841 (Cons!3694 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000) Nil!3695) Nil!3695)))))

(declare-fun b!249399 () Bool)

(assert (=> b!249399 (= e!161748 call!23407)))

(declare-fun b!249400 () Bool)

(assert (=> b!249400 (= e!161749 (contains!1790 Nil!3695 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!60579 (not res!122166)) b!249398))

(assert (= (and b!249398 res!122168) b!249400))

(assert (= (and b!249398 res!122167) b!249397))

(assert (= (and b!249397 c!41841) b!249396))

(assert (= (and b!249397 (not c!41841)) b!249399))

(assert (= (or b!249396 b!249399) bm!23404))

(assert (=> b!249397 m!265189))

(assert (=> b!249397 m!265189))

(assert (=> b!249397 m!265191))

(assert (=> b!249398 m!265189))

(assert (=> b!249398 m!265189))

(assert (=> b!249398 m!265191))

(assert (=> bm!23404 m!265189))

(declare-fun m!265493 () Bool)

(assert (=> bm!23404 m!265493))

(assert (=> b!249400 m!265189))

(assert (=> b!249400 m!265189))

(declare-fun m!265495 () Bool)

(assert (=> b!249400 m!265495))

(assert (=> b!249237 d!60579))

(declare-fun d!60581 () Bool)

(assert (=> d!60581 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249109 d!60581))

(declare-fun d!60583 () Bool)

(assert (=> d!60583 (arrayContainsKey!0 lt!124553 lt!124655 #b00000000000000000000000000000000)))

(declare-fun lt!124830 () Unit!7693)

(declare-fun choose!13 (array!12257 (_ BitVec 64) (_ BitVec 32)) Unit!7693)

(assert (=> d!60583 (= lt!124830 (choose!13 lt!124553 lt!124655 #b00000000000000000000000000000000))))

(assert (=> d!60583 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!60583 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!124553 lt!124655 #b00000000000000000000000000000000) lt!124830)))

(declare-fun bs!8929 () Bool)

(assert (= bs!8929 d!60583))

(assert (=> bs!8929 m!265195))

(declare-fun m!265497 () Bool)

(assert (=> bs!8929 m!265497))

(assert (=> b!249126 d!60583))

(declare-fun d!60585 () Bool)

(declare-fun res!122169 () Bool)

(declare-fun e!161752 () Bool)

(assert (=> d!60585 (=> res!122169 e!161752)))

(assert (=> d!60585 (= res!122169 (= (select (arr!5812 lt!124553) #b00000000000000000000000000000000) lt!124655))))

(assert (=> d!60585 (= (arrayContainsKey!0 lt!124553 lt!124655 #b00000000000000000000000000000000) e!161752)))

(declare-fun b!249401 () Bool)

(declare-fun e!161753 () Bool)

(assert (=> b!249401 (= e!161752 e!161753)))

(declare-fun res!122170 () Bool)

(assert (=> b!249401 (=> (not res!122170) (not e!161753))))

(assert (=> b!249401 (= res!122170 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 lt!124553)))))

(declare-fun b!249402 () Bool)

(assert (=> b!249402 (= e!161753 (arrayContainsKey!0 lt!124553 lt!124655 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60585 (not res!122169)) b!249401))

(assert (= (and b!249401 res!122170) b!249402))

(assert (=> d!60585 m!265173))

(declare-fun m!265499 () Bool)

(assert (=> b!249402 m!265499))

(assert (=> b!249126 d!60585))

(declare-fun b!249403 () Bool)

(declare-fun e!161756 () SeekEntryResult!1113)

(assert (=> b!249403 (= e!161756 Undefined!1113)))

(declare-fun b!249404 () Bool)

(declare-fun e!161754 () SeekEntryResult!1113)

(declare-fun lt!124832 () SeekEntryResult!1113)

(assert (=> b!249404 (= e!161754 (MissingZero!1113 (index!6624 lt!124832)))))

(declare-fun b!249405 () Bool)

(declare-fun c!41843 () Bool)

(declare-fun lt!124833 () (_ BitVec 64))

(assert (=> b!249405 (= c!41843 (= lt!124833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161755 () SeekEntryResult!1113)

(assert (=> b!249405 (= e!161755 e!161754)))

(declare-fun b!249406 () Bool)

(assert (=> b!249406 (= e!161754 (seekKeyOrZeroReturnVacant!0 (x!24610 lt!124832) (index!6624 lt!124832) (index!6624 lt!124832) (select (arr!5812 lt!124553) #b00000000000000000000000000000000) lt!124553 (mask!10765 thiss!1504)))))

(declare-fun b!249407 () Bool)

(assert (=> b!249407 (= e!161756 e!161755)))

(assert (=> b!249407 (= lt!124833 (select (arr!5812 lt!124553) (index!6624 lt!124832)))))

(declare-fun c!41842 () Bool)

(assert (=> b!249407 (= c!41842 (= lt!124833 (select (arr!5812 lt!124553) #b00000000000000000000000000000000)))))

(declare-fun d!60587 () Bool)

(declare-fun lt!124831 () SeekEntryResult!1113)

(assert (=> d!60587 (and (or ((_ is Undefined!1113) lt!124831) (not ((_ is Found!1113) lt!124831)) (and (bvsge (index!6623 lt!124831) #b00000000000000000000000000000000) (bvslt (index!6623 lt!124831) (size!6156 lt!124553)))) (or ((_ is Undefined!1113) lt!124831) ((_ is Found!1113) lt!124831) (not ((_ is MissingZero!1113) lt!124831)) (and (bvsge (index!6622 lt!124831) #b00000000000000000000000000000000) (bvslt (index!6622 lt!124831) (size!6156 lt!124553)))) (or ((_ is Undefined!1113) lt!124831) ((_ is Found!1113) lt!124831) ((_ is MissingZero!1113) lt!124831) (not ((_ is MissingVacant!1113) lt!124831)) (and (bvsge (index!6625 lt!124831) #b00000000000000000000000000000000) (bvslt (index!6625 lt!124831) (size!6156 lt!124553)))) (or ((_ is Undefined!1113) lt!124831) (ite ((_ is Found!1113) lt!124831) (= (select (arr!5812 lt!124553) (index!6623 lt!124831)) (select (arr!5812 lt!124553) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1113) lt!124831) (= (select (arr!5812 lt!124553) (index!6622 lt!124831)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1113) lt!124831) (= (select (arr!5812 lt!124553) (index!6625 lt!124831)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60587 (= lt!124831 e!161756)))

(declare-fun c!41844 () Bool)

(assert (=> d!60587 (= c!41844 (and ((_ is Intermediate!1113) lt!124832) (undefined!1925 lt!124832)))))

(assert (=> d!60587 (= lt!124832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5812 lt!124553) #b00000000000000000000000000000000) (mask!10765 thiss!1504)) (select (arr!5812 lt!124553) #b00000000000000000000000000000000) lt!124553 (mask!10765 thiss!1504)))))

(assert (=> d!60587 (validMask!0 (mask!10765 thiss!1504))))

(assert (=> d!60587 (= (seekEntryOrOpen!0 (select (arr!5812 lt!124553) #b00000000000000000000000000000000) lt!124553 (mask!10765 thiss!1504)) lt!124831)))

(declare-fun b!249408 () Bool)

(assert (=> b!249408 (= e!161755 (Found!1113 (index!6624 lt!124832)))))

(assert (= (and d!60587 c!41844) b!249403))

(assert (= (and d!60587 (not c!41844)) b!249407))

(assert (= (and b!249407 c!41842) b!249408))

(assert (= (and b!249407 (not c!41842)) b!249405))

(assert (= (and b!249405 c!41843) b!249404))

(assert (= (and b!249405 (not c!41843)) b!249406))

(assert (=> b!249406 m!265173))

(declare-fun m!265501 () Bool)

(assert (=> b!249406 m!265501))

(declare-fun m!265503 () Bool)

(assert (=> b!249407 m!265503))

(declare-fun m!265505 () Bool)

(assert (=> d!60587 m!265505))

(assert (=> d!60587 m!265173))

(declare-fun m!265507 () Bool)

(assert (=> d!60587 m!265507))

(declare-fun m!265509 () Bool)

(assert (=> d!60587 m!265509))

(assert (=> d!60587 m!265009))

(assert (=> d!60587 m!265507))

(assert (=> d!60587 m!265173))

(declare-fun m!265511 () Bool)

(assert (=> d!60587 m!265511))

(declare-fun m!265513 () Bool)

(assert (=> d!60587 m!265513))

(assert (=> b!249126 d!60587))

(declare-fun d!60589 () Bool)

(declare-fun e!161757 () Bool)

(assert (=> d!60589 e!161757))

(declare-fun res!122171 () Bool)

(assert (=> d!60589 (=> res!122171 e!161757)))

(declare-fun lt!124837 () Bool)

(assert (=> d!60589 (= res!122171 (not lt!124837))))

(declare-fun lt!124836 () Bool)

(assert (=> d!60589 (= lt!124837 lt!124836)))

(declare-fun lt!124835 () Unit!7693)

(declare-fun e!161758 () Unit!7693)

(assert (=> d!60589 (= lt!124835 e!161758)))

(declare-fun c!41845 () Bool)

(assert (=> d!60589 (= c!41845 lt!124836)))

(assert (=> d!60589 (= lt!124836 (containsKey!286 (toList!1865 lt!124719) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60589 (= (contains!1787 lt!124719 #b0000000000000000000000000000000000000000000000000000000000000000) lt!124837)))

(declare-fun b!249409 () Bool)

(declare-fun lt!124834 () Unit!7693)

(assert (=> b!249409 (= e!161758 lt!124834)))

(assert (=> b!249409 (= lt!124834 (lemmaContainsKeyImpliesGetValueByKeyDefined!235 (toList!1865 lt!124719) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249409 (isDefined!236 (getValueByKey!294 (toList!1865 lt!124719) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249410 () Bool)

(declare-fun Unit!7708 () Unit!7693)

(assert (=> b!249410 (= e!161758 Unit!7708)))

(declare-fun b!249411 () Bool)

(assert (=> b!249411 (= e!161757 (isDefined!236 (getValueByKey!294 (toList!1865 lt!124719) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60589 c!41845) b!249409))

(assert (= (and d!60589 (not c!41845)) b!249410))

(assert (= (and d!60589 (not res!122171)) b!249411))

(declare-fun m!265515 () Bool)

(assert (=> d!60589 m!265515))

(declare-fun m!265517 () Bool)

(assert (=> b!249409 m!265517))

(declare-fun m!265519 () Bool)

(assert (=> b!249409 m!265519))

(assert (=> b!249409 m!265519))

(declare-fun m!265521 () Bool)

(assert (=> b!249409 m!265521))

(assert (=> b!249411 m!265519))

(assert (=> b!249411 m!265519))

(assert (=> b!249411 m!265521))

(assert (=> bm!23392 d!60589))

(declare-fun d!60591 () Bool)

(declare-fun lt!124838 () (_ BitVec 32))

(assert (=> d!60591 (and (bvsge lt!124838 #b00000000000000000000000000000000) (bvsle lt!124838 (bvsub (size!6156 (_keys!6732 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!161759 () (_ BitVec 32))

(assert (=> d!60591 (= lt!124838 e!161759)))

(declare-fun c!41846 () Bool)

(assert (=> d!60591 (= c!41846 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60591 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6156 (_keys!6732 thiss!1504)) (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60591 (= (arrayCountValidKeys!0 (_keys!6732 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))) lt!124838)))

(declare-fun bm!23405 () Bool)

(declare-fun call!23408 () (_ BitVec 32))

(assert (=> bm!23405 (= call!23408 (arrayCountValidKeys!0 (_keys!6732 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249412 () Bool)

(assert (=> b!249412 (= e!161759 #b00000000000000000000000000000000)))

(declare-fun b!249413 () Bool)

(declare-fun e!161760 () (_ BitVec 32))

(assert (=> b!249413 (= e!161759 e!161760)))

(declare-fun c!41847 () Bool)

(assert (=> b!249413 (= c!41847 (validKeyInArray!0 (select (arr!5812 (_keys!6732 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249414 () Bool)

(assert (=> b!249414 (= e!161760 call!23408)))

(declare-fun b!249415 () Bool)

(assert (=> b!249415 (= e!161760 (bvadd #b00000000000000000000000000000001 call!23408))))

(assert (= (and d!60591 c!41846) b!249412))

(assert (= (and d!60591 (not c!41846)) b!249413))

(assert (= (and b!249413 c!41847) b!249415))

(assert (= (and b!249413 (not c!41847)) b!249414))

(assert (= (or b!249415 b!249414) bm!23405))

(declare-fun m!265523 () Bool)

(assert (=> bm!23405 m!265523))

(assert (=> b!249413 m!265471))

(assert (=> b!249413 m!265471))

(declare-fun m!265525 () Bool)

(assert (=> b!249413 m!265525))

(assert (=> bm!23368 d!60591))

(declare-fun b!249435 () Bool)

(declare-fun lt!124844 () SeekEntryResult!1113)

(assert (=> b!249435 (and (bvsge (index!6624 lt!124844) #b00000000000000000000000000000000) (bvslt (index!6624 lt!124844) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun res!122179 () Bool)

(assert (=> b!249435 (= res!122179 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6624 lt!124844)) key!932))))

(declare-fun e!161772 () Bool)

(assert (=> b!249435 (=> res!122179 e!161772)))

(declare-fun e!161774 () Bool)

(assert (=> b!249435 (= e!161774 e!161772)))

(declare-fun b!249436 () Bool)

(declare-fun e!161771 () SeekEntryResult!1113)

(assert (=> b!249436 (= e!161771 (Intermediate!1113 true (toIndex!0 key!932 (mask!10765 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!249437 () Bool)

(declare-fun e!161775 () SeekEntryResult!1113)

(assert (=> b!249437 (= e!161771 e!161775)))

(declare-fun c!41854 () Bool)

(declare-fun lt!124843 () (_ BitVec 64))

(assert (=> b!249437 (= c!41854 (or (= lt!124843 key!932) (= (bvadd lt!124843 lt!124843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249438 () Bool)

(assert (=> b!249438 (and (bvsge (index!6624 lt!124844) #b00000000000000000000000000000000) (bvslt (index!6624 lt!124844) (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> b!249438 (= e!161772 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6624 lt!124844)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249439 () Bool)

(assert (=> b!249439 (and (bvsge (index!6624 lt!124844) #b00000000000000000000000000000000) (bvslt (index!6624 lt!124844) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun res!122178 () Bool)

(assert (=> b!249439 (= res!122178 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6624 lt!124844)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249439 (=> res!122178 e!161772)))

(declare-fun b!249440 () Bool)

(assert (=> b!249440 (= e!161775 (Intermediate!1113 false (toIndex!0 key!932 (mask!10765 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!249434 () Bool)

(declare-fun e!161773 () Bool)

(assert (=> b!249434 (= e!161773 e!161774)))

(declare-fun res!122180 () Bool)

(assert (=> b!249434 (= res!122180 (and ((_ is Intermediate!1113) lt!124844) (not (undefined!1925 lt!124844)) (bvslt (x!24610 lt!124844) #b01111111111111111111111111111110) (bvsge (x!24610 lt!124844) #b00000000000000000000000000000000) (bvsge (x!24610 lt!124844) #b00000000000000000000000000000000)))))

(assert (=> b!249434 (=> (not res!122180) (not e!161774))))

(declare-fun d!60593 () Bool)

(assert (=> d!60593 e!161773))

(declare-fun c!41856 () Bool)

(assert (=> d!60593 (= c!41856 (and ((_ is Intermediate!1113) lt!124844) (undefined!1925 lt!124844)))))

(assert (=> d!60593 (= lt!124844 e!161771)))

(declare-fun c!41855 () Bool)

(assert (=> d!60593 (= c!41855 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!60593 (= lt!124843 (select (arr!5812 (_keys!6732 thiss!1504)) (toIndex!0 key!932 (mask!10765 thiss!1504))))))

(assert (=> d!60593 (validMask!0 (mask!10765 thiss!1504))))

(assert (=> d!60593 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10765 thiss!1504)) key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)) lt!124844)))

(declare-fun b!249441 () Bool)

(assert (=> b!249441 (= e!161775 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10765 thiss!1504)) #b00000000000000000000000000000000 (mask!10765 thiss!1504)) key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(declare-fun b!249442 () Bool)

(assert (=> b!249442 (= e!161773 (bvsge (x!24610 lt!124844) #b01111111111111111111111111111110))))

(assert (= (and d!60593 c!41855) b!249436))

(assert (= (and d!60593 (not c!41855)) b!249437))

(assert (= (and b!249437 c!41854) b!249440))

(assert (= (and b!249437 (not c!41854)) b!249441))

(assert (= (and d!60593 c!41856) b!249442))

(assert (= (and d!60593 (not c!41856)) b!249434))

(assert (= (and b!249434 res!122180) b!249435))

(assert (= (and b!249435 (not res!122179)) b!249439))

(assert (= (and b!249439 (not res!122178)) b!249438))

(declare-fun m!265527 () Bool)

(assert (=> b!249435 m!265527))

(assert (=> b!249438 m!265527))

(assert (=> d!60593 m!265163))

(declare-fun m!265529 () Bool)

(assert (=> d!60593 m!265529))

(assert (=> d!60593 m!265009))

(assert (=> b!249439 m!265527))

(assert (=> b!249441 m!265163))

(declare-fun m!265531 () Bool)

(assert (=> b!249441 m!265531))

(assert (=> b!249441 m!265531))

(declare-fun m!265533 () Bool)

(assert (=> b!249441 m!265533))

(assert (=> d!60475 d!60593))

(declare-fun d!60595 () Bool)

(declare-fun lt!124850 () (_ BitVec 32))

(declare-fun lt!124849 () (_ BitVec 32))

(assert (=> d!60595 (= lt!124850 (bvmul (bvxor lt!124849 (bvlshr lt!124849 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!60595 (= lt!124849 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!60595 (and (bvsge (mask!10765 thiss!1504) #b00000000000000000000000000000000) (let ((res!122181 (let ((h!4355 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24630 (bvmul (bvxor h!4355 (bvlshr h!4355 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24630 (bvlshr x!24630 #b00000000000000000000000000001101)) (mask!10765 thiss!1504)))))) (and (bvslt res!122181 (bvadd (mask!10765 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!122181 #b00000000000000000000000000000000))))))

(assert (=> d!60595 (= (toIndex!0 key!932 (mask!10765 thiss!1504)) (bvand (bvxor lt!124850 (bvlshr lt!124850 #b00000000000000000000000000001101)) (mask!10765 thiss!1504)))))

(assert (=> d!60475 d!60595))

(assert (=> d!60475 d!60483))

(assert (=> b!249235 d!60481))

(assert (=> b!249097 d!60557))

(declare-fun d!60597 () Bool)

(declare-fun lt!124851 () (_ BitVec 32))

(assert (=> d!60597 (and (bvsge lt!124851 #b00000000000000000000000000000000) (bvsle lt!124851 (bvsub (size!6156 lt!124553) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!161776 () (_ BitVec 32))

(assert (=> d!60597 (= lt!124851 e!161776)))

(declare-fun c!41857 () Bool)

(assert (=> d!60597 (= c!41857 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))))))

(assert (=> d!60597 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6156 (_keys!6732 thiss!1504)) (size!6156 lt!124553)))))

(assert (=> d!60597 (= (arrayCountValidKeys!0 lt!124553 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))) lt!124851)))

(declare-fun bm!23406 () Bool)

(declare-fun call!23409 () (_ BitVec 32))

(assert (=> bm!23406 (= call!23409 (arrayCountValidKeys!0 lt!124553 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6156 (_keys!6732 thiss!1504))))))

(declare-fun b!249443 () Bool)

(assert (=> b!249443 (= e!161776 #b00000000000000000000000000000000)))

(declare-fun b!249444 () Bool)

(declare-fun e!161777 () (_ BitVec 32))

(assert (=> b!249444 (= e!161776 e!161777)))

(declare-fun c!41858 () Bool)

(assert (=> b!249444 (= c!41858 (validKeyInArray!0 (select (arr!5812 lt!124553) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!249445 () Bool)

(assert (=> b!249445 (= e!161777 call!23409)))

(declare-fun b!249446 () Bool)

(assert (=> b!249446 (= e!161777 (bvadd #b00000000000000000000000000000001 call!23409))))

(assert (= (and d!60597 c!41857) b!249443))

(assert (= (and d!60597 (not c!41857)) b!249444))

(assert (= (and b!249444 c!41858) b!249446))

(assert (= (and b!249444 (not c!41858)) b!249445))

(assert (= (or b!249446 b!249445) bm!23406))

(declare-fun m!265535 () Bool)

(assert (=> bm!23406 m!265535))

(assert (=> b!249444 m!265289))

(assert (=> b!249444 m!265289))

(assert (=> b!249444 m!265299))

(assert (=> bm!23367 d!60597))

(declare-fun d!60599 () Bool)

(assert (=> d!60599 (= (apply!238 lt!124719 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2980 (getValueByKey!294 (toList!1865 lt!124719) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8930 () Bool)

(assert (= bs!8930 d!60599))

(assert (=> bs!8930 m!265519))

(assert (=> bs!8930 m!265519))

(declare-fun m!265537 () Bool)

(assert (=> bs!8930 m!265537))

(assert (=> b!249216 d!60599))

(assert (=> b!249140 d!60557))

(declare-fun d!60601 () Bool)

(assert (=> d!60601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) (mask!10765 thiss!1504))))

(assert (=> d!60601 true))

(declare-fun _$56!21 () Unit!7693)

(assert (=> d!60601 (= (choose!102 key!932 (_keys!6732 thiss!1504) index!297 (mask!10765 thiss!1504)) _$56!21)))

(declare-fun bs!8931 () Bool)

(assert (= bs!8931 d!60601))

(assert (=> bs!8931 m!265017))

(assert (=> bs!8931 m!265213))

(assert (=> d!60493 d!60601))

(assert (=> d!60493 d!60483))

(assert (=> d!60467 d!60497))

(assert (=> d!60467 d!60499))

(declare-fun d!60603 () Bool)

(assert (=> d!60603 (contains!1787 (getCurrentListMap!1374 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) key!932)))

(assert (=> d!60603 true))

(declare-fun _$17!71 () Unit!7693)

(assert (=> d!60603 (= (choose!1180 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4605 thiss!1504)) _$17!71)))

(declare-fun bs!8932 () Bool)

(assert (= bs!8932 d!60603))

(assert (=> bs!8932 m!265039))

(assert (=> bs!8932 m!265039))

(assert (=> bs!8932 m!265041))

(assert (=> d!60467 d!60603))

(assert (=> d!60467 d!60483))

(declare-fun d!60605 () Bool)

(declare-fun e!161778 () Bool)

(assert (=> d!60605 e!161778))

(declare-fun res!122182 () Bool)

(assert (=> d!60605 (=> (not res!122182) (not e!161778))))

(declare-fun lt!124853 () ListLongMap!3699)

(assert (=> d!60605 (= res!122182 (contains!1787 lt!124853 (_1!2409 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(declare-fun lt!124854 () List!3697)

(assert (=> d!60605 (= lt!124853 (ListLongMap!3700 lt!124854))))

(declare-fun lt!124855 () Unit!7693)

(declare-fun lt!124852 () Unit!7693)

(assert (=> d!60605 (= lt!124855 lt!124852)))

(assert (=> d!60605 (= (getValueByKey!294 lt!124854 (_1!2409 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))) (Some!299 (_2!2409 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(assert (=> d!60605 (= lt!124852 (lemmaContainsTupThenGetReturnValue!158 lt!124854 (_1!2409 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))) (_2!2409 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(assert (=> d!60605 (= lt!124854 (insertStrictlySorted!161 (toList!1865 call!23395) (_1!2409 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))) (_2!2409 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))))))

(assert (=> d!60605 (= (+!671 call!23395 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))) lt!124853)))

(declare-fun b!249447 () Bool)

(declare-fun res!122183 () Bool)

(assert (=> b!249447 (=> (not res!122183) (not e!161778))))

(assert (=> b!249447 (= res!122183 (= (getValueByKey!294 (toList!1865 lt!124853) (_1!2409 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504)))) (Some!299 (_2!2409 (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))))

(declare-fun b!249448 () Bool)

(assert (=> b!249448 (= e!161778 (contains!1791 (toList!1865 lt!124853) (tuple2!4797 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4446 thiss!1504))))))

(assert (= (and d!60605 res!122182) b!249447))

(assert (= (and b!249447 res!122183) b!249448))

(declare-fun m!265539 () Bool)

(assert (=> d!60605 m!265539))

(declare-fun m!265541 () Bool)

(assert (=> d!60605 m!265541))

(declare-fun m!265543 () Bool)

(assert (=> d!60605 m!265543))

(declare-fun m!265545 () Bool)

(assert (=> d!60605 m!265545))

(declare-fun m!265547 () Bool)

(assert (=> b!249447 m!265547))

(declare-fun m!265549 () Bool)

(assert (=> b!249448 m!265549))

(assert (=> b!249212 d!60605))

(declare-fun b!249449 () Bool)

(declare-fun e!161779 () Bool)

(declare-fun call!23410 () Bool)

(assert (=> b!249449 (= e!161779 call!23410)))

(declare-fun b!249450 () Bool)

(declare-fun e!161780 () Bool)

(assert (=> b!249450 (= e!161780 call!23410)))

(declare-fun b!249451 () Bool)

(assert (=> b!249451 (= e!161779 e!161780)))

(declare-fun lt!124857 () (_ BitVec 64))

(assert (=> b!249451 (= lt!124857 (select (arr!5812 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!124856 () Unit!7693)

(assert (=> b!249451 (= lt!124856 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) lt!124857 #b00000000000000000000000000000000))))

(assert (=> b!249451 (arrayContainsKey!0 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) lt!124857 #b00000000000000000000000000000000)))

(declare-fun lt!124858 () Unit!7693)

(assert (=> b!249451 (= lt!124858 lt!124856)))

(declare-fun res!122184 () Bool)

(assert (=> b!249451 (= res!122184 (= (seekEntryOrOpen!0 (select (arr!5812 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504)))) #b00000000000000000000000000000000) (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) (mask!10765 thiss!1504)) (Found!1113 #b00000000000000000000000000000000)))))

(assert (=> b!249451 (=> (not res!122184) (not e!161780))))

(declare-fun bm!23407 () Bool)

(assert (=> bm!23407 (= call!23410 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) (mask!10765 thiss!1504)))))

(declare-fun b!249452 () Bool)

(declare-fun e!161781 () Bool)

(assert (=> b!249452 (= e!161781 e!161779)))

(declare-fun c!41859 () Bool)

(assert (=> b!249452 (= c!41859 (validKeyInArray!0 (select (arr!5812 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!60607 () Bool)

(declare-fun res!122185 () Bool)

(assert (=> d!60607 (=> res!122185 e!161781)))

(assert (=> d!60607 (= res!122185 (bvsge #b00000000000000000000000000000000 (size!6156 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))))))))

(assert (=> d!60607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) (mask!10765 thiss!1504)) e!161781)))

(assert (= (and d!60607 (not res!122185)) b!249452))

(assert (= (and b!249452 c!41859) b!249451))

(assert (= (and b!249452 (not c!41859)) b!249449))

(assert (= (and b!249451 res!122184) b!249450))

(assert (= (or b!249450 b!249449) bm!23407))

(assert (=> b!249451 m!265301))

(declare-fun m!265551 () Bool)

(assert (=> b!249451 m!265551))

(declare-fun m!265553 () Bool)

(assert (=> b!249451 m!265553))

(assert (=> b!249451 m!265301))

(declare-fun m!265555 () Bool)

(assert (=> b!249451 m!265555))

(declare-fun m!265557 () Bool)

(assert (=> bm!23407 m!265557))

(assert (=> b!249452 m!265301))

(assert (=> b!249452 m!265301))

(assert (=> b!249452 m!265303))

(assert (=> b!249154 d!60607))

(declare-fun d!60609 () Bool)

(assert (=> d!60609 (= (inRange!0 (index!6623 lt!124631) (mask!10765 thiss!1504)) (and (bvsge (index!6623 lt!124631) #b00000000000000000000000000000000) (bvslt (index!6623 lt!124631) (bvadd (mask!10765 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249068 d!60609))

(assert (=> d!60469 d!60475))

(declare-fun b!249469 () Bool)

(declare-fun e!161791 () Bool)

(declare-fun e!161793 () Bool)

(assert (=> b!249469 (= e!161791 e!161793)))

(declare-fun c!41864 () Bool)

(declare-fun lt!124861 () SeekEntryResult!1113)

(assert (=> b!249469 (= c!41864 ((_ is MissingVacant!1113) lt!124861))))

(declare-fun b!249470 () Bool)

(declare-fun res!122194 () Bool)

(declare-fun e!161790 () Bool)

(assert (=> b!249470 (=> (not res!122194) (not e!161790))))

(declare-fun call!23415 () Bool)

(assert (=> b!249470 (= res!122194 call!23415)))

(assert (=> b!249470 (= e!161793 e!161790)))

(declare-fun b!249471 () Bool)

(declare-fun e!161792 () Bool)

(declare-fun call!23416 () Bool)

(assert (=> b!249471 (= e!161792 (not call!23416))))

(declare-fun b!249472 () Bool)

(assert (=> b!249472 (= e!161790 (not call!23416))))

(declare-fun b!249473 () Bool)

(assert (=> b!249473 (= e!161793 ((_ is Undefined!1113) lt!124861))))

(declare-fun b!249474 () Bool)

(declare-fun res!122197 () Bool)

(assert (=> b!249474 (= res!122197 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6622 lt!124861)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249474 (=> (not res!122197) (not e!161792))))

(declare-fun b!249475 () Bool)

(declare-fun res!122195 () Bool)

(assert (=> b!249475 (=> (not res!122195) (not e!161790))))

(assert (=> b!249475 (= res!122195 (= (select (arr!5812 (_keys!6732 thiss!1504)) (index!6625 lt!124861)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!60611 () Bool)

(assert (=> d!60611 e!161791))

(declare-fun c!41865 () Bool)

(assert (=> d!60611 (= c!41865 ((_ is MissingZero!1113) lt!124861))))

(assert (=> d!60611 (= lt!124861 (seekEntryOrOpen!0 key!932 (_keys!6732 thiss!1504) (mask!10765 thiss!1504)))))

(assert (=> d!60611 true))

(declare-fun _$34!1107 () Unit!7693)

(assert (=> d!60611 (= (choose!1181 (_keys!6732 thiss!1504) (_values!4588 thiss!1504) (mask!10765 thiss!1504) (extraKeys!4342 thiss!1504) (zeroValue!4446 thiss!1504) (minValue!4446 thiss!1504) key!932 (defaultEntry!4605 thiss!1504)) _$34!1107)))

(declare-fun bm!23412 () Bool)

(assert (=> bm!23412 (= call!23415 (inRange!0 (ite c!41865 (index!6622 lt!124861) (index!6625 lt!124861)) (mask!10765 thiss!1504)))))

(declare-fun bm!23413 () Bool)

(assert (=> bm!23413 (= call!23416 (arrayContainsKey!0 (_keys!6732 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249476 () Bool)

(assert (=> b!249476 (= e!161791 e!161792)))

(declare-fun res!122196 () Bool)

(assert (=> b!249476 (= res!122196 call!23415)))

(assert (=> b!249476 (=> (not res!122196) (not e!161792))))

(assert (= (and d!60611 c!41865) b!249476))

(assert (= (and d!60611 (not c!41865)) b!249469))

(assert (= (and b!249476 res!122196) b!249474))

(assert (= (and b!249474 res!122197) b!249471))

(assert (= (and b!249469 c!41864) b!249470))

(assert (= (and b!249469 (not c!41864)) b!249473))

(assert (= (and b!249470 res!122194) b!249475))

(assert (= (and b!249475 res!122195) b!249472))

(assert (= (or b!249476 b!249470) bm!23412))

(assert (= (or b!249471 b!249472) bm!23413))

(declare-fun m!265559 () Bool)

(assert (=> b!249474 m!265559))

(declare-fun m!265561 () Bool)

(assert (=> bm!23412 m!265561))

(assert (=> d!60611 m!265027))

(assert (=> bm!23413 m!264999))

(declare-fun m!265563 () Bool)

(assert (=> b!249475 m!265563))

(assert (=> d!60469 d!60611))

(assert (=> d!60469 d!60483))

(assert (=> bm!23364 d!60491))

(declare-fun d!60613 () Bool)

(assert (=> d!60613 (= (arrayCountValidKeys!0 (array!12258 (store (arr!5812 (_keys!6732 thiss!1504)) index!297 key!932) (size!6156 (_keys!6732 thiss!1504))) #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6732 thiss!1504) #b00000000000000000000000000000000 (size!6156 (_keys!6732 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!60613 true))

(declare-fun _$84!24 () Unit!7693)

(assert (=> d!60613 (= (choose!1 (_keys!6732 thiss!1504) index!297 key!932) _$84!24)))

(declare-fun bs!8933 () Bool)

(assert (= bs!8933 d!60613))

(assert (=> bs!8933 m!265017))

(assert (=> bs!8933 m!265183))

(assert (=> bs!8933 m!265019))

(assert (=> d!60479 d!60613))

(declare-fun d!60615 () Bool)

(declare-fun e!161794 () Bool)

(assert (=> d!60615 e!161794))

(declare-fun res!122198 () Bool)

(assert (=> d!60615 (=> res!122198 e!161794)))

(declare-fun lt!124865 () Bool)

(assert (=> d!60615 (= res!122198 (not lt!124865))))

(declare-fun lt!124864 () Bool)

(assert (=> d!60615 (= lt!124865 lt!124864)))

(declare-fun lt!124863 () Unit!7693)

(declare-fun e!161795 () Unit!7693)

(assert (=> d!60615 (= lt!124863 e!161795)))

(declare-fun c!41866 () Bool)

(assert (=> d!60615 (= c!41866 lt!124864)))

(assert (=> d!60615 (= lt!124864 (containsKey!286 (toList!1865 lt!124719) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60615 (= (contains!1787 lt!124719 #b1000000000000000000000000000000000000000000000000000000000000000) lt!124865)))

(declare-fun b!249477 () Bool)

(declare-fun lt!124862 () Unit!7693)

(assert (=> b!249477 (= e!161795 lt!124862)))

(assert (=> b!249477 (= lt!124862 (lemmaContainsKeyImpliesGetValueByKeyDefined!235 (toList!1865 lt!124719) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249477 (isDefined!236 (getValueByKey!294 (toList!1865 lt!124719) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249478 () Bool)

(declare-fun Unit!7709 () Unit!7693)

(assert (=> b!249478 (= e!161795 Unit!7709)))

(declare-fun b!249479 () Bool)

(assert (=> b!249479 (= e!161794 (isDefined!236 (getValueByKey!294 (toList!1865 lt!124719) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60615 c!41866) b!249477))

(assert (= (and d!60615 (not c!41866)) b!249478))

(assert (= (and d!60615 (not res!122198)) b!249479))

(declare-fun m!265565 () Bool)

(assert (=> d!60615 m!265565))

(declare-fun m!265567 () Bool)

(assert (=> b!249477 m!265567))

(assert (=> b!249477 m!265433))

(assert (=> b!249477 m!265433))

(declare-fun m!265569 () Bool)

(assert (=> b!249477 m!265569))

(assert (=> b!249479 m!265433))

(assert (=> b!249479 m!265433))

(assert (=> b!249479 m!265569))

(assert (=> bm!23393 d!60615))

(assert (=> b!249127 d!60557))

(declare-fun d!60617 () Bool)

(assert (=> d!60617 (= (apply!238 lt!124719 (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000)) (get!2980 (getValueByKey!294 (toList!1865 lt!124719) (select (arr!5812 (_keys!6732 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8934 () Bool)

(assert (= bs!8934 d!60617))

(assert (=> bs!8934 m!265189))

(assert (=> bs!8934 m!265479))

(assert (=> bs!8934 m!265479))

(declare-fun m!265571 () Bool)

(assert (=> bs!8934 m!265571))

(assert (=> b!249222 d!60617))

(declare-fun d!60619 () Bool)

(declare-fun c!41869 () Bool)

(assert (=> d!60619 (= c!41869 ((_ is ValueCellFull!2894) (select (arr!5811 (_values!4588 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!161798 () V!8281)

(assert (=> d!60619 (= (get!2979 (select (arr!5811 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!572 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!161798)))

(declare-fun b!249484 () Bool)

(declare-fun get!2981 (ValueCell!2894 V!8281) V!8281)

(assert (=> b!249484 (= e!161798 (get!2981 (select (arr!5811 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!572 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!249485 () Bool)

(declare-fun get!2982 (ValueCell!2894 V!8281) V!8281)

(assert (=> b!249485 (= e!161798 (get!2982 (select (arr!5811 (_values!4588 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!572 (defaultEntry!4605 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60619 c!41869) b!249484))

(assert (= (and d!60619 (not c!41869)) b!249485))

(assert (=> b!249484 m!265265))

(assert (=> b!249484 m!265267))

(declare-fun m!265573 () Bool)

(assert (=> b!249484 m!265573))

(assert (=> b!249485 m!265265))

(assert (=> b!249485 m!265267))

(declare-fun m!265575 () Bool)

(assert (=> b!249485 m!265575))

(assert (=> b!249222 d!60619))

(declare-fun mapIsEmpty!11007 () Bool)

(declare-fun mapRes!11007 () Bool)

(assert (=> mapIsEmpty!11007 mapRes!11007))

(declare-fun b!249486 () Bool)

(declare-fun e!161800 () Bool)

(assert (=> b!249486 (= e!161800 tp_is_empty!6475)))

(declare-fun b!249487 () Bool)

(declare-fun e!161799 () Bool)

(assert (=> b!249487 (= e!161799 tp_is_empty!6475)))

(declare-fun condMapEmpty!11007 () Bool)

(declare-fun mapDefault!11007 () ValueCell!2894)

(assert (=> mapNonEmpty!11006 (= condMapEmpty!11007 (= mapRest!11006 ((as const (Array (_ BitVec 32) ValueCell!2894)) mapDefault!11007)))))

(assert (=> mapNonEmpty!11006 (= tp!23111 (and e!161799 mapRes!11007))))

(declare-fun mapNonEmpty!11007 () Bool)

(declare-fun tp!23112 () Bool)

(assert (=> mapNonEmpty!11007 (= mapRes!11007 (and tp!23112 e!161800))))

(declare-fun mapValue!11007 () ValueCell!2894)

(declare-fun mapKey!11007 () (_ BitVec 32))

(declare-fun mapRest!11007 () (Array (_ BitVec 32) ValueCell!2894))

(assert (=> mapNonEmpty!11007 (= mapRest!11006 (store mapRest!11007 mapKey!11007 mapValue!11007))))

(assert (= (and mapNonEmpty!11006 condMapEmpty!11007) mapIsEmpty!11007))

(assert (= (and mapNonEmpty!11006 (not condMapEmpty!11007)) mapNonEmpty!11007))

(assert (= (and mapNonEmpty!11007 ((_ is ValueCellFull!2894) mapValue!11007)) b!249486))

(assert (= (and mapNonEmpty!11006 ((_ is ValueCellFull!2894) mapDefault!11007)) b!249487))

(declare-fun m!265577 () Bool)

(assert (=> mapNonEmpty!11007 m!265577))

(declare-fun b_lambda!8053 () Bool)

(assert (= b_lambda!8051 (or (and b!248895 b_free!6613) b_lambda!8053)))

(declare-fun b_lambda!8055 () Bool)

(assert (= b_lambda!8049 (or (and b!248895 b_free!6613) b_lambda!8055)))

(check-sat (not b!249314) (not b!249339) (not d!60511) (not b!249294) (not b!249299) (not b!249309) (not b!249485) (not d!60561) (not b!249321) (not b!249397) (not bm!23406) (not b!249316) (not b!249308) (not b!249371) (not bm!23397) (not d!60583) (not b!249338) (not bm!23413) (not d!60559) (not bm!23403) (not d!60529) (not d!60521) (not b!249373) (not b_lambda!8053) (not b!249447) (not d!60603) (not d!60533) (not b!249318) (not d!60525) (not bm!23400) (not b!249413) (not b!249477) (not b_lambda!8047) (not d!60575) (not b!249402) (not d!60535) (not d!60617) (not bm!23412) (not b!249400) (not b!249265) (not d!60539) (not d!60549) (not d!60531) (not d!60551) (not b!249444) (not d!60611) tp_is_empty!6475 (not b!249391) (not b!249393) (not d!60587) (not b!249291) (not d!60569) (not bm!23401) (not b!249250) (not d!60615) (not d!60605) (not d!60547) (not b!249451) (not mapNonEmpty!11007) (not d!60537) (not bm!23405) (not bm!23402) (not b!249452) (not d!60601) (not b!249448) (not b!249254) (not b!249313) (not b!249328) (not b!249353) (not bm!23396) (not b!249260) (not b!249298) (not b!249441) (not b!249257) (not d!60519) (not b!249266) (not b_lambda!8055) b_and!13605 (not b!249479) (not b!249352) (not d!60589) (not b!249349) (not b!249398) (not d!60593) (not b!249409) (not d!60523) (not b!249301) (not b!249295) (not b!249351) (not b!249370) (not d!60613) (not d!60513) (not d!60517) (not b!249411) (not b!249348) (not b!249322) (not d!60541) (not d!60515) (not b!249484) (not b!249302) (not d!60571) (not b!249258) (not bm!23404) (not d!60527) (not b!249364) (not d!60599) (not b!249255) (not b!249300) (not bm!23407) (not d!60503) (not b!249346) (not b!249315) (not b!249406) (not b!249368) (not b!249312) (not d!60565) (not b_next!6613))
(check-sat b_and!13605 (not b_next!6613))
