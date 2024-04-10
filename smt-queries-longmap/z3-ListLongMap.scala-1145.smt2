; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23792 () Bool)

(assert start!23792)

(declare-fun b!249759 () Bool)

(declare-fun b_free!6621 () Bool)

(declare-fun b_next!6621 () Bool)

(assert (=> b!249759 (= b_free!6621 (not b_next!6621))))

(declare-fun tp!23124 () Bool)

(declare-fun b_and!13635 () Bool)

(assert (=> b!249759 (= tp!23124 b_and!13635)))

(declare-fun b!249740 () Bool)

(declare-fun e!161983 () Bool)

(declare-fun e!161984 () Bool)

(assert (=> b!249740 (= e!161983 e!161984)))

(declare-fun res!122340 () Bool)

(assert (=> b!249740 (=> (not res!122340) (not e!161984))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8291 0))(
  ( (V!8292 (val!3286 Int)) )
))
(declare-datatypes ((ValueCell!2898 0))(
  ( (ValueCellFull!2898 (v!5349 V!8291)) (EmptyCell!2898) )
))
(declare-datatypes ((array!12281 0))(
  ( (array!12282 (arr!5824 (Array (_ BitVec 32) ValueCell!2898)) (size!6168 (_ BitVec 32))) )
))
(declare-datatypes ((array!12283 0))(
  ( (array!12284 (arr!5825 (Array (_ BitVec 32) (_ BitVec 64))) (size!6169 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3696 0))(
  ( (LongMapFixedSize!3697 (defaultEntry!4617 Int) (mask!10789 (_ BitVec 32)) (extraKeys!4354 (_ BitVec 32)) (zeroValue!4458 V!8291) (minValue!4458 V!8291) (_size!1897 (_ BitVec 32)) (_keys!6749 array!12283) (_values!4600 array!12281) (_vacant!1897 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3696)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!249740 (= res!122340 (inRange!0 index!297 (mask!10789 thiss!1504)))))

(declare-datatypes ((Unit!7734 0))(
  ( (Unit!7735) )
))
(declare-fun lt!125102 () Unit!7734)

(declare-fun e!161985 () Unit!7734)

(assert (=> b!249740 (= lt!125102 e!161985)))

(declare-fun c!41918 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4838 0))(
  ( (tuple2!4839 (_1!2430 (_ BitVec 64)) (_2!2430 V!8291)) )
))
(declare-datatypes ((List!3719 0))(
  ( (Nil!3716) (Cons!3715 (h!4374 tuple2!4838) (t!8750 List!3719)) )
))
(declare-datatypes ((ListLongMap!3751 0))(
  ( (ListLongMap!3752 (toList!1891 List!3719)) )
))
(declare-fun contains!1810 (ListLongMap!3751 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1419 (array!12283 array!12281 (_ BitVec 32) (_ BitVec 32) V!8291 V!8291 (_ BitVec 32) Int) ListLongMap!3751)

(assert (=> b!249740 (= c!41918 (contains!1810 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)) key!932))))

(declare-fun b!249741 () Bool)

(declare-fun e!161981 () Bool)

(assert (=> b!249741 (= e!161981 e!161983)))

(declare-fun res!122344 () Bool)

(assert (=> b!249741 (=> (not res!122344) (not e!161983))))

(declare-datatypes ((SeekEntryResult!1119 0))(
  ( (MissingZero!1119 (index!6646 (_ BitVec 32))) (Found!1119 (index!6647 (_ BitVec 32))) (Intermediate!1119 (undefined!1931 Bool) (index!6648 (_ BitVec 32)) (x!24643 (_ BitVec 32))) (Undefined!1119) (MissingVacant!1119 (index!6649 (_ BitVec 32))) )
))
(declare-fun lt!125106 () SeekEntryResult!1119)

(assert (=> b!249741 (= res!122344 (or (= lt!125106 (MissingZero!1119 index!297)) (= lt!125106 (MissingVacant!1119 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12283 (_ BitVec 32)) SeekEntryResult!1119)

(assert (=> b!249741 (= lt!125106 (seekEntryOrOpen!0 key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(declare-fun b!249742 () Bool)

(declare-fun e!161978 () Bool)

(declare-fun tp_is_empty!6483 () Bool)

(assert (=> b!249742 (= e!161978 tp_is_empty!6483)))

(declare-fun b!249743 () Bool)

(declare-fun res!122347 () Bool)

(assert (=> b!249743 (=> (not res!122347) (not e!161981))))

(assert (=> b!249743 (= res!122347 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!122342 () Bool)

(assert (=> start!23792 (=> (not res!122342) (not e!161981))))

(declare-fun valid!1446 (LongMapFixedSize!3696) Bool)

(assert (=> start!23792 (= res!122342 (valid!1446 thiss!1504))))

(assert (=> start!23792 e!161981))

(declare-fun e!161988 () Bool)

(assert (=> start!23792 e!161988))

(assert (=> start!23792 true))

(declare-fun b!249744 () Bool)

(declare-fun e!161991 () Bool)

(assert (=> b!249744 (= e!161984 (not e!161991))))

(declare-fun res!122346 () Bool)

(assert (=> b!249744 (=> res!122346 e!161991)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!249744 (= res!122346 (not (validMask!0 (mask!10789 thiss!1504))))))

(declare-fun lt!125103 () array!12283)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12283 (_ BitVec 32)) Bool)

(assert (=> b!249744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125103 (mask!10789 thiss!1504))))

(declare-fun lt!125105 () Unit!7734)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12283 (_ BitVec 32) (_ BitVec 32)) Unit!7734)

(assert (=> b!249744 (= lt!125105 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6749 thiss!1504) index!297 (mask!10789 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12283 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!249744 (= (arrayCountValidKeys!0 lt!125103 #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6749 thiss!1504) #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504)))))))

(declare-fun lt!125097 () Unit!7734)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12283 (_ BitVec 32) (_ BitVec 64)) Unit!7734)

(assert (=> b!249744 (= lt!125097 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6749 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3720 0))(
  ( (Nil!3717) (Cons!3716 (h!4375 (_ BitVec 64)) (t!8751 List!3720)) )
))
(declare-fun arrayNoDuplicates!0 (array!12283 (_ BitVec 32) List!3720) Bool)

(assert (=> b!249744 (arrayNoDuplicates!0 lt!125103 #b00000000000000000000000000000000 Nil!3717)))

(assert (=> b!249744 (= lt!125103 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun lt!125098 () Unit!7734)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3720) Unit!7734)

(assert (=> b!249744 (= lt!125098 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6749 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3717))))

(declare-fun lt!125099 () Unit!7734)

(declare-fun e!161987 () Unit!7734)

(assert (=> b!249744 (= lt!125099 e!161987)))

(declare-fun c!41917 () Bool)

(declare-fun arrayContainsKey!0 (array!12283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!249744 (= c!41917 (arrayContainsKey!0 (_keys!6749 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249745 () Bool)

(declare-fun e!161986 () Bool)

(declare-fun call!23452 () Bool)

(assert (=> b!249745 (= e!161986 (not call!23452))))

(declare-fun call!23451 () Bool)

(declare-fun bm!23448 () Bool)

(declare-fun c!41919 () Bool)

(assert (=> bm!23448 (= call!23451 (inRange!0 (ite c!41919 (index!6646 lt!125106) (index!6649 lt!125106)) (mask!10789 thiss!1504)))))

(declare-fun b!249746 () Bool)

(declare-fun e!161990 () Bool)

(assert (=> b!249746 (= e!161990 tp_is_empty!6483)))

(declare-fun mapIsEmpty!11013 () Bool)

(declare-fun mapRes!11013 () Bool)

(assert (=> mapIsEmpty!11013 mapRes!11013))

(declare-fun b!249747 () Bool)

(declare-fun lt!125100 () Unit!7734)

(assert (=> b!249747 (= e!161985 lt!125100)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!398 (array!12283 array!12281 (_ BitVec 32) (_ BitVec 32) V!8291 V!8291 (_ BitVec 64) Int) Unit!7734)

(assert (=> b!249747 (= lt!125100 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!398 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 (defaultEntry!4617 thiss!1504)))))

(get-info :version)

(assert (=> b!249747 (= c!41919 ((_ is MissingZero!1119) lt!125106))))

(declare-fun e!161977 () Bool)

(assert (=> b!249747 e!161977))

(declare-fun b!249748 () Bool)

(assert (=> b!249748 (= e!161991 (or (not (= (size!6168 (_values!4600 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10789 thiss!1504)))) (= (size!6169 (_keys!6749 thiss!1504)) (size!6168 (_values!4600 thiss!1504)))))))

(declare-fun b!249749 () Bool)

(declare-fun c!41916 () Bool)

(assert (=> b!249749 (= c!41916 ((_ is MissingVacant!1119) lt!125106))))

(declare-fun e!161979 () Bool)

(assert (=> b!249749 (= e!161977 e!161979)))

(declare-fun b!249750 () Bool)

(declare-fun res!122343 () Bool)

(assert (=> b!249750 (= res!122343 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6649 lt!125106)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!161980 () Bool)

(assert (=> b!249750 (=> (not res!122343) (not e!161980))))

(declare-fun b!249751 () Bool)

(declare-fun Unit!7736 () Unit!7734)

(assert (=> b!249751 (= e!161987 Unit!7736)))

(declare-fun b!249752 () Bool)

(declare-fun res!122345 () Bool)

(assert (=> b!249752 (=> (not res!122345) (not e!161986))))

(assert (=> b!249752 (= res!122345 call!23451)))

(assert (=> b!249752 (= e!161977 e!161986)))

(declare-fun b!249753 () Bool)

(assert (=> b!249753 (= e!161980 (not call!23452))))

(declare-fun b!249754 () Bool)

(declare-fun Unit!7737 () Unit!7734)

(assert (=> b!249754 (= e!161985 Unit!7737)))

(declare-fun lt!125104 () Unit!7734)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!396 (array!12283 array!12281 (_ BitVec 32) (_ BitVec 32) V!8291 V!8291 (_ BitVec 64) Int) Unit!7734)

(assert (=> b!249754 (= lt!125104 (lemmaInListMapThenSeekEntryOrOpenFindsIt!396 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 (defaultEntry!4617 thiss!1504)))))

(assert (=> b!249754 false))

(declare-fun b!249755 () Bool)

(declare-fun res!122341 () Bool)

(assert (=> b!249755 (=> (not res!122341) (not e!161986))))

(assert (=> b!249755 (= res!122341 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6646 lt!125106)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249756 () Bool)

(assert (=> b!249756 (= e!161979 ((_ is Undefined!1119) lt!125106))))

(declare-fun bm!23449 () Bool)

(assert (=> bm!23449 (= call!23452 (arrayContainsKey!0 (_keys!6749 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249757 () Bool)

(declare-fun Unit!7738 () Unit!7734)

(assert (=> b!249757 (= e!161987 Unit!7738)))

(declare-fun lt!125101 () Unit!7734)

(declare-fun lemmaArrayContainsKeyThenInListMap!199 (array!12283 array!12281 (_ BitVec 32) (_ BitVec 32) V!8291 V!8291 (_ BitVec 64) (_ BitVec 32) Int) Unit!7734)

(assert (=> b!249757 (= lt!125101 (lemmaArrayContainsKeyThenInListMap!199 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))))

(assert (=> b!249757 false))

(declare-fun mapNonEmpty!11013 () Bool)

(declare-fun tp!23123 () Bool)

(assert (=> mapNonEmpty!11013 (= mapRes!11013 (and tp!23123 e!161978))))

(declare-fun mapKey!11013 () (_ BitVec 32))

(declare-fun mapRest!11013 () (Array (_ BitVec 32) ValueCell!2898))

(declare-fun mapValue!11013 () ValueCell!2898)

(assert (=> mapNonEmpty!11013 (= (arr!5824 (_values!4600 thiss!1504)) (store mapRest!11013 mapKey!11013 mapValue!11013))))

(declare-fun b!249758 () Bool)

(assert (=> b!249758 (= e!161979 e!161980)))

(declare-fun res!122339 () Bool)

(assert (=> b!249758 (= res!122339 call!23451)))

(assert (=> b!249758 (=> (not res!122339) (not e!161980))))

(declare-fun e!161982 () Bool)

(declare-fun array_inv!3845 (array!12283) Bool)

(declare-fun array_inv!3846 (array!12281) Bool)

(assert (=> b!249759 (= e!161988 (and tp!23124 tp_is_empty!6483 (array_inv!3845 (_keys!6749 thiss!1504)) (array_inv!3846 (_values!4600 thiss!1504)) e!161982))))

(declare-fun b!249760 () Bool)

(assert (=> b!249760 (= e!161982 (and e!161990 mapRes!11013))))

(declare-fun condMapEmpty!11013 () Bool)

(declare-fun mapDefault!11013 () ValueCell!2898)

(assert (=> b!249760 (= condMapEmpty!11013 (= (arr!5824 (_values!4600 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2898)) mapDefault!11013)))))

(assert (= (and start!23792 res!122342) b!249743))

(assert (= (and b!249743 res!122347) b!249741))

(assert (= (and b!249741 res!122344) b!249740))

(assert (= (and b!249740 c!41918) b!249754))

(assert (= (and b!249740 (not c!41918)) b!249747))

(assert (= (and b!249747 c!41919) b!249752))

(assert (= (and b!249747 (not c!41919)) b!249749))

(assert (= (and b!249752 res!122345) b!249755))

(assert (= (and b!249755 res!122341) b!249745))

(assert (= (and b!249749 c!41916) b!249758))

(assert (= (and b!249749 (not c!41916)) b!249756))

(assert (= (and b!249758 res!122339) b!249750))

(assert (= (and b!249750 res!122343) b!249753))

(assert (= (or b!249752 b!249758) bm!23448))

(assert (= (or b!249745 b!249753) bm!23449))

(assert (= (and b!249740 res!122340) b!249744))

(assert (= (and b!249744 c!41917) b!249757))

(assert (= (and b!249744 (not c!41917)) b!249751))

(assert (= (and b!249744 (not res!122346)) b!249748))

(assert (= (and b!249760 condMapEmpty!11013) mapIsEmpty!11013))

(assert (= (and b!249760 (not condMapEmpty!11013)) mapNonEmpty!11013))

(assert (= (and mapNonEmpty!11013 ((_ is ValueCellFull!2898) mapValue!11013)) b!249742))

(assert (= (and b!249760 ((_ is ValueCellFull!2898) mapDefault!11013)) b!249746))

(assert (= b!249759 b!249760))

(assert (= start!23792 b!249759))

(declare-fun m!266243 () Bool)

(assert (=> bm!23449 m!266243))

(declare-fun m!266245 () Bool)

(assert (=> b!249747 m!266245))

(declare-fun m!266247 () Bool)

(assert (=> start!23792 m!266247))

(declare-fun m!266249 () Bool)

(assert (=> b!249757 m!266249))

(declare-fun m!266251 () Bool)

(assert (=> b!249759 m!266251))

(declare-fun m!266253 () Bool)

(assert (=> b!249759 m!266253))

(declare-fun m!266255 () Bool)

(assert (=> bm!23448 m!266255))

(declare-fun m!266257 () Bool)

(assert (=> b!249740 m!266257))

(declare-fun m!266259 () Bool)

(assert (=> b!249740 m!266259))

(assert (=> b!249740 m!266259))

(declare-fun m!266261 () Bool)

(assert (=> b!249740 m!266261))

(declare-fun m!266263 () Bool)

(assert (=> mapNonEmpty!11013 m!266263))

(declare-fun m!266265 () Bool)

(assert (=> b!249741 m!266265))

(declare-fun m!266267 () Bool)

(assert (=> b!249750 m!266267))

(declare-fun m!266269 () Bool)

(assert (=> b!249755 m!266269))

(declare-fun m!266271 () Bool)

(assert (=> b!249744 m!266271))

(assert (=> b!249744 m!266243))

(declare-fun m!266273 () Bool)

(assert (=> b!249744 m!266273))

(declare-fun m!266275 () Bool)

(assert (=> b!249744 m!266275))

(declare-fun m!266277 () Bool)

(assert (=> b!249744 m!266277))

(declare-fun m!266279 () Bool)

(assert (=> b!249744 m!266279))

(declare-fun m!266281 () Bool)

(assert (=> b!249744 m!266281))

(declare-fun m!266283 () Bool)

(assert (=> b!249744 m!266283))

(declare-fun m!266285 () Bool)

(assert (=> b!249744 m!266285))

(declare-fun m!266287 () Bool)

(assert (=> b!249744 m!266287))

(declare-fun m!266289 () Bool)

(assert (=> b!249754 m!266289))

(check-sat (not b!249744) (not bm!23448) (not b!249759) (not mapNonEmpty!11013) (not bm!23449) (not b!249757) (not start!23792) (not b!249754) tp_is_empty!6483 b_and!13635 (not b!249740) (not b_next!6621) (not b!249741) (not b!249747))
(check-sat b_and!13635 (not b_next!6621))
(get-model)

(declare-fun d!60771 () Bool)

(declare-fun res!122381 () Bool)

(declare-fun e!162039 () Bool)

(assert (=> d!60771 (=> (not res!122381) (not e!162039))))

(declare-fun simpleValid!262 (LongMapFixedSize!3696) Bool)

(assert (=> d!60771 (= res!122381 (simpleValid!262 thiss!1504))))

(assert (=> d!60771 (= (valid!1446 thiss!1504) e!162039)))

(declare-fun b!249830 () Bool)

(declare-fun res!122382 () Bool)

(assert (=> b!249830 (=> (not res!122382) (not e!162039))))

(assert (=> b!249830 (= res!122382 (= (arrayCountValidKeys!0 (_keys!6749 thiss!1504) #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) (_size!1897 thiss!1504)))))

(declare-fun b!249831 () Bool)

(declare-fun res!122383 () Bool)

(assert (=> b!249831 (=> (not res!122383) (not e!162039))))

(assert (=> b!249831 (= res!122383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(declare-fun b!249832 () Bool)

(assert (=> b!249832 (= e!162039 (arrayNoDuplicates!0 (_keys!6749 thiss!1504) #b00000000000000000000000000000000 Nil!3717))))

(assert (= (and d!60771 res!122381) b!249830))

(assert (= (and b!249830 res!122382) b!249831))

(assert (= (and b!249831 res!122383) b!249832))

(declare-fun m!266339 () Bool)

(assert (=> d!60771 m!266339))

(assert (=> b!249830 m!266283))

(declare-fun m!266341 () Bool)

(assert (=> b!249831 m!266341))

(declare-fun m!266343 () Bool)

(assert (=> b!249832 m!266343))

(assert (=> start!23792 d!60771))

(declare-fun d!60773 () Bool)

(declare-fun e!162042 () Bool)

(assert (=> d!60773 e!162042))

(declare-fun res!122388 () Bool)

(assert (=> d!60773 (=> (not res!122388) (not e!162042))))

(declare-fun lt!125142 () SeekEntryResult!1119)

(assert (=> d!60773 (= res!122388 ((_ is Found!1119) lt!125142))))

(assert (=> d!60773 (= lt!125142 (seekEntryOrOpen!0 key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(declare-fun lt!125141 () Unit!7734)

(declare-fun choose!1179 (array!12283 array!12281 (_ BitVec 32) (_ BitVec 32) V!8291 V!8291 (_ BitVec 64) Int) Unit!7734)

(assert (=> d!60773 (= lt!125141 (choose!1179 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 (defaultEntry!4617 thiss!1504)))))

(assert (=> d!60773 (validMask!0 (mask!10789 thiss!1504))))

(assert (=> d!60773 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!396 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 (defaultEntry!4617 thiss!1504)) lt!125141)))

(declare-fun b!249837 () Bool)

(declare-fun res!122389 () Bool)

(assert (=> b!249837 (=> (not res!122389) (not e!162042))))

(assert (=> b!249837 (= res!122389 (inRange!0 (index!6647 lt!125142) (mask!10789 thiss!1504)))))

(declare-fun b!249838 () Bool)

(assert (=> b!249838 (= e!162042 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6647 lt!125142)) key!932))))

(assert (=> b!249838 (and (bvsge (index!6647 lt!125142) #b00000000000000000000000000000000) (bvslt (index!6647 lt!125142) (size!6169 (_keys!6749 thiss!1504))))))

(assert (= (and d!60773 res!122388) b!249837))

(assert (= (and b!249837 res!122389) b!249838))

(assert (=> d!60773 m!266265))

(declare-fun m!266345 () Bool)

(assert (=> d!60773 m!266345))

(assert (=> d!60773 m!266271))

(declare-fun m!266347 () Bool)

(assert (=> b!249837 m!266347))

(declare-fun m!266349 () Bool)

(assert (=> b!249838 m!266349))

(assert (=> b!249754 d!60773))

(declare-fun d!60775 () Bool)

(assert (=> d!60775 (= (inRange!0 index!297 (mask!10789 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10789 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249740 d!60775))

(declare-fun d!60777 () Bool)

(declare-fun e!162047 () Bool)

(assert (=> d!60777 e!162047))

(declare-fun res!122392 () Bool)

(assert (=> d!60777 (=> res!122392 e!162047)))

(declare-fun lt!125151 () Bool)

(assert (=> d!60777 (= res!122392 (not lt!125151))))

(declare-fun lt!125153 () Bool)

(assert (=> d!60777 (= lt!125151 lt!125153)))

(declare-fun lt!125154 () Unit!7734)

(declare-fun e!162048 () Unit!7734)

(assert (=> d!60777 (= lt!125154 e!162048)))

(declare-fun c!41934 () Bool)

(assert (=> d!60777 (= c!41934 lt!125153)))

(declare-fun containsKey!289 (List!3719 (_ BitVec 64)) Bool)

(assert (=> d!60777 (= lt!125153 (containsKey!289 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932))))

(assert (=> d!60777 (= (contains!1810 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)) key!932) lt!125151)))

(declare-fun b!249845 () Bool)

(declare-fun lt!125152 () Unit!7734)

(assert (=> b!249845 (= e!162048 lt!125152)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!237 (List!3719 (_ BitVec 64)) Unit!7734)

(assert (=> b!249845 (= lt!125152 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932))))

(declare-datatypes ((Option!303 0))(
  ( (Some!302 (v!5351 V!8291)) (None!301) )
))
(declare-fun isDefined!238 (Option!303) Bool)

(declare-fun getValueByKey!297 (List!3719 (_ BitVec 64)) Option!303)

(assert (=> b!249845 (isDefined!238 (getValueByKey!297 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932))))

(declare-fun b!249846 () Bool)

(declare-fun Unit!7739 () Unit!7734)

(assert (=> b!249846 (= e!162048 Unit!7739)))

(declare-fun b!249847 () Bool)

(assert (=> b!249847 (= e!162047 (isDefined!238 (getValueByKey!297 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932)))))

(assert (= (and d!60777 c!41934) b!249845))

(assert (= (and d!60777 (not c!41934)) b!249846))

(assert (= (and d!60777 (not res!122392)) b!249847))

(declare-fun m!266351 () Bool)

(assert (=> d!60777 m!266351))

(declare-fun m!266353 () Bool)

(assert (=> b!249845 m!266353))

(declare-fun m!266355 () Bool)

(assert (=> b!249845 m!266355))

(assert (=> b!249845 m!266355))

(declare-fun m!266357 () Bool)

(assert (=> b!249845 m!266357))

(assert (=> b!249847 m!266355))

(assert (=> b!249847 m!266355))

(assert (=> b!249847 m!266357))

(assert (=> b!249740 d!60777))

(declare-fun b!249890 () Bool)

(declare-fun e!162086 () Bool)

(declare-fun e!162079 () Bool)

(assert (=> b!249890 (= e!162086 e!162079)))

(declare-fun res!122413 () Bool)

(assert (=> b!249890 (=> (not res!122413) (not e!162079))))

(declare-fun lt!125200 () ListLongMap!3751)

(assert (=> b!249890 (= res!122413 (contains!1810 lt!125200 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!249890 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun bm!23470 () Bool)

(declare-fun call!23477 () Bool)

(assert (=> bm!23470 (= call!23477 (contains!1810 lt!125200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!23471 () Bool)

(declare-fun call!23478 () Bool)

(assert (=> bm!23471 (= call!23478 (contains!1810 lt!125200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!249891 () Bool)

(declare-fun e!162075 () Bool)

(assert (=> b!249891 (= e!162075 (not call!23478))))

(declare-fun b!249892 () Bool)

(declare-fun c!41949 () Bool)

(assert (=> b!249892 (= c!41949 (and (not (= (bvand (extraKeys!4354 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4354 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!162077 () ListLongMap!3751)

(declare-fun e!162076 () ListLongMap!3751)

(assert (=> b!249892 (= e!162077 e!162076)))

(declare-fun c!41947 () Bool)

(declare-fun call!23474 () ListLongMap!3751)

(declare-fun call!23475 () ListLongMap!3751)

(declare-fun c!41952 () Bool)

(declare-fun call!23479 () ListLongMap!3751)

(declare-fun bm!23472 () Bool)

(declare-fun call!23473 () ListLongMap!3751)

(declare-fun +!666 (ListLongMap!3751 tuple2!4838) ListLongMap!3751)

(assert (=> bm!23472 (= call!23475 (+!666 (ite c!41952 call!23474 (ite c!41947 call!23479 call!23473)) (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))))))

(declare-fun b!249893 () Bool)

(declare-fun call!23476 () ListLongMap!3751)

(assert (=> b!249893 (= e!162076 call!23476)))

(declare-fun b!249894 () Bool)

(declare-fun e!162085 () Bool)

(declare-fun e!162078 () Bool)

(assert (=> b!249894 (= e!162085 e!162078)))

(declare-fun c!41950 () Bool)

(assert (=> b!249894 (= c!41950 (not (= (bvand (extraKeys!4354 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!249896 () Bool)

(assert (=> b!249896 (= e!162078 (not call!23477))))

(declare-fun bm!23473 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!561 (array!12283 array!12281 (_ BitVec 32) (_ BitVec 32) V!8291 V!8291 (_ BitVec 32) Int) ListLongMap!3751)

(assert (=> bm!23473 (= call!23474 (getCurrentListMapNoExtraKeys!561 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))))

(declare-fun b!249897 () Bool)

(declare-fun e!162084 () ListLongMap!3751)

(assert (=> b!249897 (= e!162084 e!162077)))

(assert (=> b!249897 (= c!41947 (and (not (= (bvand (extraKeys!4354 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4354 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!249898 () Bool)

(declare-fun e!162080 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!249898 (= e!162080 (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23474 () Bool)

(assert (=> bm!23474 (= call!23476 call!23475)))

(declare-fun b!249899 () Bool)

(assert (=> b!249899 (= e!162076 call!23473)))

(declare-fun b!249900 () Bool)

(declare-fun e!162087 () Bool)

(declare-fun apply!239 (ListLongMap!3751 (_ BitVec 64)) V!8291)

(assert (=> b!249900 (= e!162087 (= (apply!239 lt!125200 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4458 thiss!1504)))))

(declare-fun b!249901 () Bool)

(declare-fun e!162083 () Unit!7734)

(declare-fun lt!125213 () Unit!7734)

(assert (=> b!249901 (= e!162083 lt!125213)))

(declare-fun lt!125209 () ListLongMap!3751)

(assert (=> b!249901 (= lt!125209 (getCurrentListMapNoExtraKeys!561 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))))

(declare-fun lt!125212 () (_ BitVec 64))

(assert (=> b!249901 (= lt!125212 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125214 () (_ BitVec 64))

(assert (=> b!249901 (= lt!125214 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125206 () Unit!7734)

(declare-fun addStillContains!215 (ListLongMap!3751 (_ BitVec 64) V!8291 (_ BitVec 64)) Unit!7734)

(assert (=> b!249901 (= lt!125206 (addStillContains!215 lt!125209 lt!125212 (zeroValue!4458 thiss!1504) lt!125214))))

(assert (=> b!249901 (contains!1810 (+!666 lt!125209 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504))) lt!125214)))

(declare-fun lt!125220 () Unit!7734)

(assert (=> b!249901 (= lt!125220 lt!125206)))

(declare-fun lt!125207 () ListLongMap!3751)

(assert (=> b!249901 (= lt!125207 (getCurrentListMapNoExtraKeys!561 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))))

(declare-fun lt!125208 () (_ BitVec 64))

(assert (=> b!249901 (= lt!125208 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125205 () (_ BitVec 64))

(assert (=> b!249901 (= lt!125205 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125203 () Unit!7734)

(declare-fun addApplyDifferent!215 (ListLongMap!3751 (_ BitVec 64) V!8291 (_ BitVec 64)) Unit!7734)

(assert (=> b!249901 (= lt!125203 (addApplyDifferent!215 lt!125207 lt!125208 (minValue!4458 thiss!1504) lt!125205))))

(assert (=> b!249901 (= (apply!239 (+!666 lt!125207 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504))) lt!125205) (apply!239 lt!125207 lt!125205))))

(declare-fun lt!125216 () Unit!7734)

(assert (=> b!249901 (= lt!125216 lt!125203)))

(declare-fun lt!125201 () ListLongMap!3751)

(assert (=> b!249901 (= lt!125201 (getCurrentListMapNoExtraKeys!561 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))))

(declare-fun lt!125211 () (_ BitVec 64))

(assert (=> b!249901 (= lt!125211 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125210 () (_ BitVec 64))

(assert (=> b!249901 (= lt!125210 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125199 () Unit!7734)

(assert (=> b!249901 (= lt!125199 (addApplyDifferent!215 lt!125201 lt!125211 (zeroValue!4458 thiss!1504) lt!125210))))

(assert (=> b!249901 (= (apply!239 (+!666 lt!125201 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504))) lt!125210) (apply!239 lt!125201 lt!125210))))

(declare-fun lt!125204 () Unit!7734)

(assert (=> b!249901 (= lt!125204 lt!125199)))

(declare-fun lt!125215 () ListLongMap!3751)

(assert (=> b!249901 (= lt!125215 (getCurrentListMapNoExtraKeys!561 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))))

(declare-fun lt!125217 () (_ BitVec 64))

(assert (=> b!249901 (= lt!125217 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!125219 () (_ BitVec 64))

(assert (=> b!249901 (= lt!125219 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249901 (= lt!125213 (addApplyDifferent!215 lt!125215 lt!125217 (minValue!4458 thiss!1504) lt!125219))))

(assert (=> b!249901 (= (apply!239 (+!666 lt!125215 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504))) lt!125219) (apply!239 lt!125215 lt!125219))))

(declare-fun bm!23475 () Bool)

(assert (=> bm!23475 (= call!23473 call!23479)))

(declare-fun b!249902 () Bool)

(declare-fun e!162082 () Bool)

(assert (=> b!249902 (= e!162082 (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!249903 () Bool)

(declare-fun e!162081 () Bool)

(assert (=> b!249903 (= e!162075 e!162081)))

(declare-fun res!122417 () Bool)

(assert (=> b!249903 (= res!122417 call!23478)))

(assert (=> b!249903 (=> (not res!122417) (not e!162081))))

(declare-fun bm!23476 () Bool)

(assert (=> bm!23476 (= call!23479 call!23474)))

(declare-fun b!249904 () Bool)

(declare-fun Unit!7740 () Unit!7734)

(assert (=> b!249904 (= e!162083 Unit!7740)))

(declare-fun b!249895 () Bool)

(declare-fun res!122419 () Bool)

(assert (=> b!249895 (=> (not res!122419) (not e!162085))))

(assert (=> b!249895 (= res!122419 e!162075)))

(declare-fun c!41951 () Bool)

(assert (=> b!249895 (= c!41951 (not (= (bvand (extraKeys!4354 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!60779 () Bool)

(assert (=> d!60779 e!162085))

(declare-fun res!122414 () Bool)

(assert (=> d!60779 (=> (not res!122414) (not e!162085))))

(assert (=> d!60779 (= res!122414 (or (bvsge #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))))

(declare-fun lt!125202 () ListLongMap!3751)

(assert (=> d!60779 (= lt!125200 lt!125202)))

(declare-fun lt!125218 () Unit!7734)

(assert (=> d!60779 (= lt!125218 e!162083)))

(declare-fun c!41948 () Bool)

(assert (=> d!60779 (= c!41948 e!162080)))

(declare-fun res!122412 () Bool)

(assert (=> d!60779 (=> (not res!122412) (not e!162080))))

(assert (=> d!60779 (= res!122412 (bvslt #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60779 (= lt!125202 e!162084)))

(assert (=> d!60779 (= c!41952 (and (not (= (bvand (extraKeys!4354 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4354 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60779 (validMask!0 (mask!10789 thiss!1504))))

(assert (=> d!60779 (= (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)) lt!125200)))

(declare-fun b!249905 () Bool)

(assert (=> b!249905 (= e!162077 call!23476)))

(declare-fun b!249906 () Bool)

(assert (=> b!249906 (= e!162081 (= (apply!239 lt!125200 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4458 thiss!1504)))))

(declare-fun b!249907 () Bool)

(assert (=> b!249907 (= e!162084 (+!666 call!23475 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))))))

(declare-fun b!249908 () Bool)

(declare-fun res!122415 () Bool)

(assert (=> b!249908 (=> (not res!122415) (not e!162085))))

(assert (=> b!249908 (= res!122415 e!162086)))

(declare-fun res!122418 () Bool)

(assert (=> b!249908 (=> res!122418 e!162086)))

(assert (=> b!249908 (= res!122418 (not e!162082))))

(declare-fun res!122416 () Bool)

(assert (=> b!249908 (=> (not res!122416) (not e!162082))))

(assert (=> b!249908 (= res!122416 (bvslt #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!249909 () Bool)

(declare-fun get!2991 (ValueCell!2898 V!8291) V!8291)

(declare-fun dynLambda!582 (Int (_ BitVec 64)) V!8291)

(assert (=> b!249909 (= e!162079 (= (apply!239 lt!125200 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)) (get!2991 (select (arr!5824 (_values!4600 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4617 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249909 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6168 (_values!4600 thiss!1504))))))

(assert (=> b!249909 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!249910 () Bool)

(assert (=> b!249910 (= e!162078 e!162087)))

(declare-fun res!122411 () Bool)

(assert (=> b!249910 (= res!122411 call!23477)))

(assert (=> b!249910 (=> (not res!122411) (not e!162087))))

(assert (= (and d!60779 c!41952) b!249907))

(assert (= (and d!60779 (not c!41952)) b!249897))

(assert (= (and b!249897 c!41947) b!249905))

(assert (= (and b!249897 (not c!41947)) b!249892))

(assert (= (and b!249892 c!41949) b!249893))

(assert (= (and b!249892 (not c!41949)) b!249899))

(assert (= (or b!249893 b!249899) bm!23475))

(assert (= (or b!249905 bm!23475) bm!23476))

(assert (= (or b!249905 b!249893) bm!23474))

(assert (= (or b!249907 bm!23476) bm!23473))

(assert (= (or b!249907 bm!23474) bm!23472))

(assert (= (and d!60779 res!122412) b!249898))

(assert (= (and d!60779 c!41948) b!249901))

(assert (= (and d!60779 (not c!41948)) b!249904))

(assert (= (and d!60779 res!122414) b!249908))

(assert (= (and b!249908 res!122416) b!249902))

(assert (= (and b!249908 (not res!122418)) b!249890))

(assert (= (and b!249890 res!122413) b!249909))

(assert (= (and b!249908 res!122415) b!249895))

(assert (= (and b!249895 c!41951) b!249903))

(assert (= (and b!249895 (not c!41951)) b!249891))

(assert (= (and b!249903 res!122417) b!249906))

(assert (= (or b!249903 b!249891) bm!23471))

(assert (= (and b!249895 res!122419) b!249894))

(assert (= (and b!249894 c!41950) b!249910))

(assert (= (and b!249894 (not c!41950)) b!249896))

(assert (= (and b!249910 res!122411) b!249900))

(assert (= (or b!249910 b!249896) bm!23470))

(declare-fun b_lambda!8075 () Bool)

(assert (=> (not b_lambda!8075) (not b!249909)))

(declare-fun t!8753 () Bool)

(declare-fun tb!2991 () Bool)

(assert (=> (and b!249759 (= (defaultEntry!4617 thiss!1504) (defaultEntry!4617 thiss!1504)) t!8753) tb!2991))

(declare-fun result!5295 () Bool)

(assert (=> tb!2991 (= result!5295 tp_is_empty!6483)))

(assert (=> b!249909 t!8753))

(declare-fun b_and!13639 () Bool)

(assert (= b_and!13635 (and (=> t!8753 result!5295) b_and!13639)))

(declare-fun m!266359 () Bool)

(assert (=> bm!23473 m!266359))

(declare-fun m!266361 () Bool)

(assert (=> b!249901 m!266361))

(declare-fun m!266363 () Bool)

(assert (=> b!249901 m!266363))

(declare-fun m!266365 () Bool)

(assert (=> b!249901 m!266365))

(declare-fun m!266367 () Bool)

(assert (=> b!249901 m!266367))

(declare-fun m!266369 () Bool)

(assert (=> b!249901 m!266369))

(declare-fun m!266371 () Bool)

(assert (=> b!249901 m!266371))

(declare-fun m!266373 () Bool)

(assert (=> b!249901 m!266373))

(declare-fun m!266375 () Bool)

(assert (=> b!249901 m!266375))

(assert (=> b!249901 m!266369))

(declare-fun m!266377 () Bool)

(assert (=> b!249901 m!266377))

(declare-fun m!266379 () Bool)

(assert (=> b!249901 m!266379))

(declare-fun m!266381 () Bool)

(assert (=> b!249901 m!266381))

(assert (=> b!249901 m!266373))

(declare-fun m!266383 () Bool)

(assert (=> b!249901 m!266383))

(assert (=> b!249901 m!266379))

(declare-fun m!266385 () Bool)

(assert (=> b!249901 m!266385))

(assert (=> b!249901 m!266361))

(declare-fun m!266387 () Bool)

(assert (=> b!249901 m!266387))

(declare-fun m!266389 () Bool)

(assert (=> b!249901 m!266389))

(assert (=> b!249901 m!266359))

(declare-fun m!266391 () Bool)

(assert (=> b!249901 m!266391))

(declare-fun m!266393 () Bool)

(assert (=> b!249909 m!266393))

(declare-fun m!266395 () Bool)

(assert (=> b!249909 m!266395))

(declare-fun m!266397 () Bool)

(assert (=> b!249909 m!266397))

(assert (=> b!249909 m!266391))

(assert (=> b!249909 m!266391))

(declare-fun m!266399 () Bool)

(assert (=> b!249909 m!266399))

(assert (=> b!249909 m!266395))

(assert (=> b!249909 m!266393))

(assert (=> d!60779 m!266271))

(declare-fun m!266401 () Bool)

(assert (=> bm!23470 m!266401))

(declare-fun m!266403 () Bool)

(assert (=> b!249900 m!266403))

(declare-fun m!266405 () Bool)

(assert (=> bm!23471 m!266405))

(assert (=> b!249890 m!266391))

(assert (=> b!249890 m!266391))

(declare-fun m!266407 () Bool)

(assert (=> b!249890 m!266407))

(assert (=> b!249898 m!266391))

(assert (=> b!249898 m!266391))

(declare-fun m!266409 () Bool)

(assert (=> b!249898 m!266409))

(assert (=> b!249902 m!266391))

(assert (=> b!249902 m!266391))

(assert (=> b!249902 m!266409))

(declare-fun m!266411 () Bool)

(assert (=> bm!23472 m!266411))

(declare-fun m!266413 () Bool)

(assert (=> b!249906 m!266413))

(declare-fun m!266415 () Bool)

(assert (=> b!249907 m!266415))

(assert (=> b!249740 d!60779))

(declare-fun b!249926 () Bool)

(declare-fun e!162095 () SeekEntryResult!1119)

(declare-fun lt!125229 () SeekEntryResult!1119)

(assert (=> b!249926 (= e!162095 (MissingZero!1119 (index!6648 lt!125229)))))

(declare-fun b!249927 () Bool)

(declare-fun e!162094 () SeekEntryResult!1119)

(declare-fun e!162096 () SeekEntryResult!1119)

(assert (=> b!249927 (= e!162094 e!162096)))

(declare-fun lt!125227 () (_ BitVec 64))

(assert (=> b!249927 (= lt!125227 (select (arr!5825 (_keys!6749 thiss!1504)) (index!6648 lt!125229)))))

(declare-fun c!41959 () Bool)

(assert (=> b!249927 (= c!41959 (= lt!125227 key!932))))

(declare-fun b!249928 () Bool)

(declare-fun c!41960 () Bool)

(assert (=> b!249928 (= c!41960 (= lt!125227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249928 (= e!162096 e!162095)))

(declare-fun b!249929 () Bool)

(assert (=> b!249929 (= e!162094 Undefined!1119)))

(declare-fun b!249930 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12283 (_ BitVec 32)) SeekEntryResult!1119)

(assert (=> b!249930 (= e!162095 (seekKeyOrZeroReturnVacant!0 (x!24643 lt!125229) (index!6648 lt!125229) (index!6648 lt!125229) key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(declare-fun d!60781 () Bool)

(declare-fun lt!125228 () SeekEntryResult!1119)

(assert (=> d!60781 (and (or ((_ is Undefined!1119) lt!125228) (not ((_ is Found!1119) lt!125228)) (and (bvsge (index!6647 lt!125228) #b00000000000000000000000000000000) (bvslt (index!6647 lt!125228) (size!6169 (_keys!6749 thiss!1504))))) (or ((_ is Undefined!1119) lt!125228) ((_ is Found!1119) lt!125228) (not ((_ is MissingZero!1119) lt!125228)) (and (bvsge (index!6646 lt!125228) #b00000000000000000000000000000000) (bvslt (index!6646 lt!125228) (size!6169 (_keys!6749 thiss!1504))))) (or ((_ is Undefined!1119) lt!125228) ((_ is Found!1119) lt!125228) ((_ is MissingZero!1119) lt!125228) (not ((_ is MissingVacant!1119) lt!125228)) (and (bvsge (index!6649 lt!125228) #b00000000000000000000000000000000) (bvslt (index!6649 lt!125228) (size!6169 (_keys!6749 thiss!1504))))) (or ((_ is Undefined!1119) lt!125228) (ite ((_ is Found!1119) lt!125228) (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6647 lt!125228)) key!932) (ite ((_ is MissingZero!1119) lt!125228) (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6646 lt!125228)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1119) lt!125228) (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6649 lt!125228)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60781 (= lt!125228 e!162094)))

(declare-fun c!41961 () Bool)

(assert (=> d!60781 (= c!41961 (and ((_ is Intermediate!1119) lt!125229) (undefined!1931 lt!125229)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12283 (_ BitVec 32)) SeekEntryResult!1119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60781 (= lt!125229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10789 thiss!1504)) key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(assert (=> d!60781 (validMask!0 (mask!10789 thiss!1504))))

(assert (=> d!60781 (= (seekEntryOrOpen!0 key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)) lt!125228)))

(declare-fun b!249925 () Bool)

(assert (=> b!249925 (= e!162096 (Found!1119 (index!6648 lt!125229)))))

(assert (= (and d!60781 c!41961) b!249929))

(assert (= (and d!60781 (not c!41961)) b!249927))

(assert (= (and b!249927 c!41959) b!249925))

(assert (= (and b!249927 (not c!41959)) b!249928))

(assert (= (and b!249928 c!41960) b!249926))

(assert (= (and b!249928 (not c!41960)) b!249930))

(declare-fun m!266417 () Bool)

(assert (=> b!249927 m!266417))

(declare-fun m!266419 () Bool)

(assert (=> b!249930 m!266419))

(assert (=> d!60781 m!266271))

(declare-fun m!266421 () Bool)

(assert (=> d!60781 m!266421))

(declare-fun m!266423 () Bool)

(assert (=> d!60781 m!266423))

(assert (=> d!60781 m!266421))

(declare-fun m!266425 () Bool)

(assert (=> d!60781 m!266425))

(declare-fun m!266427 () Bool)

(assert (=> d!60781 m!266427))

(declare-fun m!266429 () Bool)

(assert (=> d!60781 m!266429))

(assert (=> b!249741 d!60781))

(declare-fun d!60783 () Bool)

(assert (=> d!60783 (= (inRange!0 (ite c!41919 (index!6646 lt!125106) (index!6649 lt!125106)) (mask!10789 thiss!1504)) (and (bvsge (ite c!41919 (index!6646 lt!125106) (index!6649 lt!125106)) #b00000000000000000000000000000000) (bvslt (ite c!41919 (index!6646 lt!125106) (index!6649 lt!125106)) (bvadd (mask!10789 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23448 d!60783))

(declare-fun d!60785 () Bool)

(assert (=> d!60785 (= (array_inv!3845 (_keys!6749 thiss!1504)) (bvsge (size!6169 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249759 d!60785))

(declare-fun d!60787 () Bool)

(assert (=> d!60787 (= (array_inv!3846 (_values!4600 thiss!1504)) (bvsge (size!6168 (_values!4600 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!249759 d!60787))

(declare-fun d!60789 () Bool)

(declare-fun res!122424 () Bool)

(declare-fun e!162101 () Bool)

(assert (=> d!60789 (=> res!122424 e!162101)))

(assert (=> d!60789 (= res!122424 (= (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60789 (= (arrayContainsKey!0 (_keys!6749 thiss!1504) key!932 #b00000000000000000000000000000000) e!162101)))

(declare-fun b!249935 () Bool)

(declare-fun e!162102 () Bool)

(assert (=> b!249935 (= e!162101 e!162102)))

(declare-fun res!122425 () Bool)

(assert (=> b!249935 (=> (not res!122425) (not e!162102))))

(assert (=> b!249935 (= res!122425 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!249936 () Bool)

(assert (=> b!249936 (= e!162102 (arrayContainsKey!0 (_keys!6749 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60789 (not res!122424)) b!249935))

(assert (= (and b!249935 res!122425) b!249936))

(assert (=> d!60789 m!266391))

(declare-fun m!266431 () Bool)

(assert (=> b!249936 m!266431))

(assert (=> bm!23449 d!60789))

(declare-fun b!249953 () Bool)

(declare-fun lt!125235 () SeekEntryResult!1119)

(assert (=> b!249953 (and (bvsge (index!6646 lt!125235) #b00000000000000000000000000000000) (bvslt (index!6646 lt!125235) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun res!122435 () Bool)

(assert (=> b!249953 (= res!122435 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6646 lt!125235)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162113 () Bool)

(assert (=> b!249953 (=> (not res!122435) (not e!162113))))

(declare-fun c!41966 () Bool)

(declare-fun bm!23481 () Bool)

(declare-fun call!23485 () Bool)

(assert (=> bm!23481 (= call!23485 (inRange!0 (ite c!41966 (index!6646 lt!125235) (index!6649 lt!125235)) (mask!10789 thiss!1504)))))

(declare-fun b!249954 () Bool)

(declare-fun e!162112 () Bool)

(assert (=> b!249954 (= e!162112 e!162113)))

(declare-fun res!122437 () Bool)

(assert (=> b!249954 (= res!122437 call!23485)))

(assert (=> b!249954 (=> (not res!122437) (not e!162113))))

(declare-fun b!249955 () Bool)

(declare-fun e!162114 () Bool)

(assert (=> b!249955 (= e!162114 ((_ is Undefined!1119) lt!125235))))

(declare-fun bm!23482 () Bool)

(declare-fun call!23484 () Bool)

(assert (=> bm!23482 (= call!23484 (arrayContainsKey!0 (_keys!6749 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!249956 () Bool)

(declare-fun res!122434 () Bool)

(declare-fun e!162111 () Bool)

(assert (=> b!249956 (=> (not res!122434) (not e!162111))))

(assert (=> b!249956 (= res!122434 call!23485)))

(assert (=> b!249956 (= e!162114 e!162111)))

(declare-fun b!249957 () Bool)

(assert (=> b!249957 (= e!162111 (not call!23484))))

(declare-fun b!249958 () Bool)

(assert (=> b!249958 (= e!162112 e!162114)))

(declare-fun c!41967 () Bool)

(assert (=> b!249958 (= c!41967 ((_ is MissingVacant!1119) lt!125235))))

(declare-fun d!60791 () Bool)

(assert (=> d!60791 e!162112))

(assert (=> d!60791 (= c!41966 ((_ is MissingZero!1119) lt!125235))))

(assert (=> d!60791 (= lt!125235 (seekEntryOrOpen!0 key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(declare-fun lt!125234 () Unit!7734)

(declare-fun choose!1180 (array!12283 array!12281 (_ BitVec 32) (_ BitVec 32) V!8291 V!8291 (_ BitVec 64) Int) Unit!7734)

(assert (=> d!60791 (= lt!125234 (choose!1180 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 (defaultEntry!4617 thiss!1504)))))

(assert (=> d!60791 (validMask!0 (mask!10789 thiss!1504))))

(assert (=> d!60791 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!398 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 (defaultEntry!4617 thiss!1504)) lt!125234)))

(declare-fun b!249959 () Bool)

(assert (=> b!249959 (= e!162113 (not call!23484))))

(declare-fun b!249960 () Bool)

(declare-fun res!122436 () Bool)

(assert (=> b!249960 (=> (not res!122436) (not e!162111))))

(assert (=> b!249960 (= res!122436 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6649 lt!125235)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!249960 (and (bvsge (index!6649 lt!125235) #b00000000000000000000000000000000) (bvslt (index!6649 lt!125235) (size!6169 (_keys!6749 thiss!1504))))))

(assert (= (and d!60791 c!41966) b!249954))

(assert (= (and d!60791 (not c!41966)) b!249958))

(assert (= (and b!249954 res!122437) b!249953))

(assert (= (and b!249953 res!122435) b!249959))

(assert (= (and b!249958 c!41967) b!249956))

(assert (= (and b!249958 (not c!41967)) b!249955))

(assert (= (and b!249956 res!122434) b!249960))

(assert (= (and b!249960 res!122436) b!249957))

(assert (= (or b!249954 b!249956) bm!23481))

(assert (= (or b!249959 b!249957) bm!23482))

(assert (=> d!60791 m!266265))

(declare-fun m!266433 () Bool)

(assert (=> d!60791 m!266433))

(assert (=> d!60791 m!266271))

(assert (=> bm!23482 m!266243))

(declare-fun m!266435 () Bool)

(assert (=> b!249953 m!266435))

(declare-fun m!266437 () Bool)

(assert (=> bm!23481 m!266437))

(declare-fun m!266439 () Bool)

(assert (=> b!249960 m!266439))

(assert (=> b!249747 d!60791))

(declare-fun d!60793 () Bool)

(assert (=> d!60793 (contains!1810 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)) key!932)))

(declare-fun lt!125238 () Unit!7734)

(declare-fun choose!1181 (array!12283 array!12281 (_ BitVec 32) (_ BitVec 32) V!8291 V!8291 (_ BitVec 64) (_ BitVec 32) Int) Unit!7734)

(assert (=> d!60793 (= lt!125238 (choose!1181 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))))

(assert (=> d!60793 (validMask!0 (mask!10789 thiss!1504))))

(assert (=> d!60793 (= (lemmaArrayContainsKeyThenInListMap!199 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)) lt!125238)))

(declare-fun bs!8963 () Bool)

(assert (= bs!8963 d!60793))

(assert (=> bs!8963 m!266259))

(assert (=> bs!8963 m!266259))

(assert (=> bs!8963 m!266261))

(declare-fun m!266441 () Bool)

(assert (=> bs!8963 m!266441))

(assert (=> bs!8963 m!266271))

(assert (=> b!249757 d!60793))

(declare-fun b!249970 () Bool)

(declare-fun res!122447 () Bool)

(declare-fun e!162120 () Bool)

(assert (=> b!249970 (=> (not res!122447) (not e!162120))))

(assert (=> b!249970 (= res!122447 (validKeyInArray!0 key!932))))

(declare-fun b!249969 () Bool)

(declare-fun res!122449 () Bool)

(assert (=> b!249969 (=> (not res!122449) (not e!162120))))

(assert (=> b!249969 (= res!122449 (not (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) index!297))))))

(declare-fun d!60795 () Bool)

(declare-fun e!162119 () Bool)

(assert (=> d!60795 e!162119))

(declare-fun res!122448 () Bool)

(assert (=> d!60795 (=> (not res!122448) (not e!162119))))

(assert (=> d!60795 (= res!122448 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6169 (_keys!6749 thiss!1504)))))))

(declare-fun lt!125241 () Unit!7734)

(declare-fun choose!1 (array!12283 (_ BitVec 32) (_ BitVec 64)) Unit!7734)

(assert (=> d!60795 (= lt!125241 (choose!1 (_keys!6749 thiss!1504) index!297 key!932))))

(assert (=> d!60795 e!162120))

(declare-fun res!122446 () Bool)

(assert (=> d!60795 (=> (not res!122446) (not e!162120))))

(assert (=> d!60795 (= res!122446 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6169 (_keys!6749 thiss!1504)))))))

(assert (=> d!60795 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6749 thiss!1504) index!297 key!932) lt!125241)))

(declare-fun b!249972 () Bool)

(assert (=> b!249972 (= e!162119 (= (arrayCountValidKeys!0 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6749 thiss!1504) #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) #b00000000000000000000000000000001)))))

(declare-fun b!249971 () Bool)

(assert (=> b!249971 (= e!162120 (bvslt (size!6169 (_keys!6749 thiss!1504)) #b01111111111111111111111111111111))))

(assert (= (and d!60795 res!122446) b!249969))

(assert (= (and b!249969 res!122449) b!249970))

(assert (= (and b!249970 res!122447) b!249971))

(assert (= (and d!60795 res!122448) b!249972))

(declare-fun m!266443 () Bool)

(assert (=> b!249970 m!266443))

(declare-fun m!266445 () Bool)

(assert (=> b!249969 m!266445))

(assert (=> b!249969 m!266445))

(declare-fun m!266447 () Bool)

(assert (=> b!249969 m!266447))

(declare-fun m!266449 () Bool)

(assert (=> d!60795 m!266449))

(assert (=> b!249972 m!266281))

(declare-fun m!266451 () Bool)

(assert (=> b!249972 m!266451))

(assert (=> b!249972 m!266283))

(assert (=> b!249744 d!60795))

(declare-fun d!60797 () Bool)

(declare-fun res!122454 () Bool)

(declare-fun e!162129 () Bool)

(assert (=> d!60797 (=> res!122454 e!162129)))

(assert (=> d!60797 (= res!122454 (bvsge #b00000000000000000000000000000000 (size!6169 lt!125103)))))

(assert (=> d!60797 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125103 (mask!10789 thiss!1504)) e!162129)))

(declare-fun b!249981 () Bool)

(declare-fun e!162127 () Bool)

(declare-fun e!162128 () Bool)

(assert (=> b!249981 (= e!162127 e!162128)))

(declare-fun lt!125250 () (_ BitVec 64))

(assert (=> b!249981 (= lt!125250 (select (arr!5825 lt!125103) #b00000000000000000000000000000000))))

(declare-fun lt!125248 () Unit!7734)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12283 (_ BitVec 64) (_ BitVec 32)) Unit!7734)

(assert (=> b!249981 (= lt!125248 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125103 lt!125250 #b00000000000000000000000000000000))))

(assert (=> b!249981 (arrayContainsKey!0 lt!125103 lt!125250 #b00000000000000000000000000000000)))

(declare-fun lt!125249 () Unit!7734)

(assert (=> b!249981 (= lt!125249 lt!125248)))

(declare-fun res!122455 () Bool)

(assert (=> b!249981 (= res!122455 (= (seekEntryOrOpen!0 (select (arr!5825 lt!125103) #b00000000000000000000000000000000) lt!125103 (mask!10789 thiss!1504)) (Found!1119 #b00000000000000000000000000000000)))))

(assert (=> b!249981 (=> (not res!122455) (not e!162128))))

(declare-fun b!249982 () Bool)

(declare-fun call!23488 () Bool)

(assert (=> b!249982 (= e!162128 call!23488)))

(declare-fun b!249983 () Bool)

(assert (=> b!249983 (= e!162127 call!23488)))

(declare-fun b!249984 () Bool)

(assert (=> b!249984 (= e!162129 e!162127)))

(declare-fun c!41970 () Bool)

(assert (=> b!249984 (= c!41970 (validKeyInArray!0 (select (arr!5825 lt!125103) #b00000000000000000000000000000000)))))

(declare-fun bm!23485 () Bool)

(assert (=> bm!23485 (= call!23488 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125103 (mask!10789 thiss!1504)))))

(assert (= (and d!60797 (not res!122454)) b!249984))

(assert (= (and b!249984 c!41970) b!249981))

(assert (= (and b!249984 (not c!41970)) b!249983))

(assert (= (and b!249981 res!122455) b!249982))

(assert (= (or b!249982 b!249983) bm!23485))

(declare-fun m!266453 () Bool)

(assert (=> b!249981 m!266453))

(declare-fun m!266455 () Bool)

(assert (=> b!249981 m!266455))

(declare-fun m!266457 () Bool)

(assert (=> b!249981 m!266457))

(assert (=> b!249981 m!266453))

(declare-fun m!266459 () Bool)

(assert (=> b!249981 m!266459))

(assert (=> b!249984 m!266453))

(assert (=> b!249984 m!266453))

(declare-fun m!266461 () Bool)

(assert (=> b!249984 m!266461))

(declare-fun m!266463 () Bool)

(assert (=> bm!23485 m!266463))

(assert (=> b!249744 d!60797))

(declare-fun b!249993 () Bool)

(declare-fun e!162135 () (_ BitVec 32))

(declare-fun call!23491 () (_ BitVec 32))

(assert (=> b!249993 (= e!162135 (bvadd #b00000000000000000000000000000001 call!23491))))

(declare-fun b!249994 () Bool)

(declare-fun e!162134 () (_ BitVec 32))

(assert (=> b!249994 (= e!162134 #b00000000000000000000000000000000)))

(declare-fun bm!23488 () Bool)

(assert (=> bm!23488 (= call!23491 (arrayCountValidKeys!0 lt!125103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!249995 () Bool)

(assert (=> b!249995 (= e!162135 call!23491)))

(declare-fun b!249996 () Bool)

(assert (=> b!249996 (= e!162134 e!162135)))

(declare-fun c!41976 () Bool)

(assert (=> b!249996 (= c!41976 (validKeyInArray!0 (select (arr!5825 lt!125103) #b00000000000000000000000000000000)))))

(declare-fun d!60799 () Bool)

(declare-fun lt!125253 () (_ BitVec 32))

(assert (=> d!60799 (and (bvsge lt!125253 #b00000000000000000000000000000000) (bvsle lt!125253 (bvsub (size!6169 lt!125103) #b00000000000000000000000000000000)))))

(assert (=> d!60799 (= lt!125253 e!162134)))

(declare-fun c!41975 () Bool)

(assert (=> d!60799 (= c!41975 (bvsge #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60799 (and (bvsle #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6169 (_keys!6749 thiss!1504)) (size!6169 lt!125103)))))

(assert (=> d!60799 (= (arrayCountValidKeys!0 lt!125103 #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) lt!125253)))

(assert (= (and d!60799 c!41975) b!249994))

(assert (= (and d!60799 (not c!41975)) b!249996))

(assert (= (and b!249996 c!41976) b!249993))

(assert (= (and b!249996 (not c!41976)) b!249995))

(assert (= (or b!249993 b!249995) bm!23488))

(declare-fun m!266465 () Bool)

(assert (=> bm!23488 m!266465))

(assert (=> b!249996 m!266453))

(assert (=> b!249996 m!266453))

(assert (=> b!249996 m!266461))

(assert (=> b!249744 d!60799))

(declare-fun b!249997 () Bool)

(declare-fun e!162137 () (_ BitVec 32))

(declare-fun call!23492 () (_ BitVec 32))

(assert (=> b!249997 (= e!162137 (bvadd #b00000000000000000000000000000001 call!23492))))

(declare-fun b!249998 () Bool)

(declare-fun e!162136 () (_ BitVec 32))

(assert (=> b!249998 (= e!162136 #b00000000000000000000000000000000)))

(declare-fun bm!23489 () Bool)

(assert (=> bm!23489 (= call!23492 (arrayCountValidKeys!0 (_keys!6749 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!249999 () Bool)

(assert (=> b!249999 (= e!162137 call!23492)))

(declare-fun b!250000 () Bool)

(assert (=> b!250000 (= e!162136 e!162137)))

(declare-fun c!41978 () Bool)

(assert (=> b!250000 (= c!41978 (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60801 () Bool)

(declare-fun lt!125254 () (_ BitVec 32))

(assert (=> d!60801 (and (bvsge lt!125254 #b00000000000000000000000000000000) (bvsle lt!125254 (bvsub (size!6169 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60801 (= lt!125254 e!162136)))

(declare-fun c!41977 () Bool)

(assert (=> d!60801 (= c!41977 (bvsge #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60801 (and (bvsle #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6169 (_keys!6749 thiss!1504)) (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60801 (= (arrayCountValidKeys!0 (_keys!6749 thiss!1504) #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) lt!125254)))

(assert (= (and d!60801 c!41977) b!249998))

(assert (= (and d!60801 (not c!41977)) b!250000))

(assert (= (and b!250000 c!41978) b!249997))

(assert (= (and b!250000 (not c!41978)) b!249999))

(assert (= (or b!249997 b!249999) bm!23489))

(declare-fun m!266467 () Bool)

(assert (=> bm!23489 m!266467))

(assert (=> b!250000 m!266391))

(assert (=> b!250000 m!266391))

(assert (=> b!250000 m!266409))

(assert (=> b!249744 d!60801))

(declare-fun d!60803 () Bool)

(assert (=> d!60803 (= (validMask!0 (mask!10789 thiss!1504)) (and (or (= (mask!10789 thiss!1504) #b00000000000000000000000000000111) (= (mask!10789 thiss!1504) #b00000000000000000000000000001111) (= (mask!10789 thiss!1504) #b00000000000000000000000000011111) (= (mask!10789 thiss!1504) #b00000000000000000000000000111111) (= (mask!10789 thiss!1504) #b00000000000000000000000001111111) (= (mask!10789 thiss!1504) #b00000000000000000000000011111111) (= (mask!10789 thiss!1504) #b00000000000000000000000111111111) (= (mask!10789 thiss!1504) #b00000000000000000000001111111111) (= (mask!10789 thiss!1504) #b00000000000000000000011111111111) (= (mask!10789 thiss!1504) #b00000000000000000000111111111111) (= (mask!10789 thiss!1504) #b00000000000000000001111111111111) (= (mask!10789 thiss!1504) #b00000000000000000011111111111111) (= (mask!10789 thiss!1504) #b00000000000000000111111111111111) (= (mask!10789 thiss!1504) #b00000000000000001111111111111111) (= (mask!10789 thiss!1504) #b00000000000000011111111111111111) (= (mask!10789 thiss!1504) #b00000000000000111111111111111111) (= (mask!10789 thiss!1504) #b00000000000001111111111111111111) (= (mask!10789 thiss!1504) #b00000000000011111111111111111111) (= (mask!10789 thiss!1504) #b00000000000111111111111111111111) (= (mask!10789 thiss!1504) #b00000000001111111111111111111111) (= (mask!10789 thiss!1504) #b00000000011111111111111111111111) (= (mask!10789 thiss!1504) #b00000000111111111111111111111111) (= (mask!10789 thiss!1504) #b00000001111111111111111111111111) (= (mask!10789 thiss!1504) #b00000011111111111111111111111111) (= (mask!10789 thiss!1504) #b00000111111111111111111111111111) (= (mask!10789 thiss!1504) #b00001111111111111111111111111111) (= (mask!10789 thiss!1504) #b00011111111111111111111111111111) (= (mask!10789 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10789 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!249744 d!60803))

(declare-fun b!250011 () Bool)

(declare-fun e!162148 () Bool)

(declare-fun e!162149 () Bool)

(assert (=> b!250011 (= e!162148 e!162149)))

(declare-fun c!41981 () Bool)

(assert (=> b!250011 (= c!41981 (validKeyInArray!0 (select (arr!5825 lt!125103) #b00000000000000000000000000000000)))))

(declare-fun b!250012 () Bool)

(declare-fun e!162147 () Bool)

(assert (=> b!250012 (= e!162147 e!162148)))

(declare-fun res!122464 () Bool)

(assert (=> b!250012 (=> (not res!122464) (not e!162148))))

(declare-fun e!162146 () Bool)

(assert (=> b!250012 (= res!122464 (not e!162146))))

(declare-fun res!122463 () Bool)

(assert (=> b!250012 (=> (not res!122463) (not e!162146))))

(assert (=> b!250012 (= res!122463 (validKeyInArray!0 (select (arr!5825 lt!125103) #b00000000000000000000000000000000)))))

(declare-fun d!60805 () Bool)

(declare-fun res!122462 () Bool)

(assert (=> d!60805 (=> res!122462 e!162147)))

(assert (=> d!60805 (= res!122462 (bvsge #b00000000000000000000000000000000 (size!6169 lt!125103)))))

(assert (=> d!60805 (= (arrayNoDuplicates!0 lt!125103 #b00000000000000000000000000000000 Nil!3717) e!162147)))

(declare-fun b!250013 () Bool)

(declare-fun call!23495 () Bool)

(assert (=> b!250013 (= e!162149 call!23495)))

(declare-fun b!250014 () Bool)

(declare-fun contains!1811 (List!3720 (_ BitVec 64)) Bool)

(assert (=> b!250014 (= e!162146 (contains!1811 Nil!3717 (select (arr!5825 lt!125103) #b00000000000000000000000000000000)))))

(declare-fun b!250015 () Bool)

(assert (=> b!250015 (= e!162149 call!23495)))

(declare-fun bm!23492 () Bool)

(assert (=> bm!23492 (= call!23495 (arrayNoDuplicates!0 lt!125103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41981 (Cons!3716 (select (arr!5825 lt!125103) #b00000000000000000000000000000000) Nil!3717) Nil!3717)))))

(assert (= (and d!60805 (not res!122462)) b!250012))

(assert (= (and b!250012 res!122463) b!250014))

(assert (= (and b!250012 res!122464) b!250011))

(assert (= (and b!250011 c!41981) b!250013))

(assert (= (and b!250011 (not c!41981)) b!250015))

(assert (= (or b!250013 b!250015) bm!23492))

(assert (=> b!250011 m!266453))

(assert (=> b!250011 m!266453))

(assert (=> b!250011 m!266461))

(assert (=> b!250012 m!266453))

(assert (=> b!250012 m!266453))

(assert (=> b!250012 m!266461))

(assert (=> b!250014 m!266453))

(assert (=> b!250014 m!266453))

(declare-fun m!266469 () Bool)

(assert (=> b!250014 m!266469))

(assert (=> bm!23492 m!266453))

(declare-fun m!266471 () Bool)

(assert (=> bm!23492 m!266471))

(assert (=> b!249744 d!60805))

(declare-fun d!60807 () Bool)

(declare-fun e!162152 () Bool)

(assert (=> d!60807 e!162152))

(declare-fun res!122467 () Bool)

(assert (=> d!60807 (=> (not res!122467) (not e!162152))))

(assert (=> d!60807 (= res!122467 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6169 (_keys!6749 thiss!1504)))))))

(declare-fun lt!125257 () Unit!7734)

(declare-fun choose!41 (array!12283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3720) Unit!7734)

(assert (=> d!60807 (= lt!125257 (choose!41 (_keys!6749 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3717))))

(assert (=> d!60807 (bvslt (size!6169 (_keys!6749 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60807 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6749 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3717) lt!125257)))

(declare-fun b!250018 () Bool)

(assert (=> b!250018 (= e!162152 (arrayNoDuplicates!0 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) #b00000000000000000000000000000000 Nil!3717))))

(assert (= (and d!60807 res!122467) b!250018))

(declare-fun m!266473 () Bool)

(assert (=> d!60807 m!266473))

(assert (=> b!250018 m!266281))

(declare-fun m!266475 () Bool)

(assert (=> b!250018 m!266475))

(assert (=> b!249744 d!60807))

(assert (=> b!249744 d!60789))

(declare-fun d!60809 () Bool)

(declare-fun e!162155 () Bool)

(assert (=> d!60809 e!162155))

(declare-fun res!122470 () Bool)

(assert (=> d!60809 (=> (not res!122470) (not e!162155))))

(assert (=> d!60809 (= res!122470 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6169 (_keys!6749 thiss!1504)))))))

(declare-fun lt!125260 () Unit!7734)

(declare-fun choose!102 ((_ BitVec 64) array!12283 (_ BitVec 32) (_ BitVec 32)) Unit!7734)

(assert (=> d!60809 (= lt!125260 (choose!102 key!932 (_keys!6749 thiss!1504) index!297 (mask!10789 thiss!1504)))))

(assert (=> d!60809 (validMask!0 (mask!10789 thiss!1504))))

(assert (=> d!60809 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6749 thiss!1504) index!297 (mask!10789 thiss!1504)) lt!125260)))

(declare-fun b!250021 () Bool)

(assert (=> b!250021 (= e!162155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) (mask!10789 thiss!1504)))))

(assert (= (and d!60809 res!122470) b!250021))

(declare-fun m!266477 () Bool)

(assert (=> d!60809 m!266477))

(assert (=> d!60809 m!266271))

(assert (=> b!250021 m!266281))

(declare-fun m!266479 () Bool)

(assert (=> b!250021 m!266479))

(assert (=> b!249744 d!60809))

(declare-fun b!250028 () Bool)

(declare-fun e!162160 () Bool)

(assert (=> b!250028 (= e!162160 tp_is_empty!6483)))

(declare-fun mapNonEmpty!11019 () Bool)

(declare-fun mapRes!11019 () Bool)

(declare-fun tp!23133 () Bool)

(assert (=> mapNonEmpty!11019 (= mapRes!11019 (and tp!23133 e!162160))))

(declare-fun mapKey!11019 () (_ BitVec 32))

(declare-fun mapValue!11019 () ValueCell!2898)

(declare-fun mapRest!11019 () (Array (_ BitVec 32) ValueCell!2898))

(assert (=> mapNonEmpty!11019 (= mapRest!11013 (store mapRest!11019 mapKey!11019 mapValue!11019))))

(declare-fun b!250029 () Bool)

(declare-fun e!162161 () Bool)

(assert (=> b!250029 (= e!162161 tp_is_empty!6483)))

(declare-fun mapIsEmpty!11019 () Bool)

(assert (=> mapIsEmpty!11019 mapRes!11019))

(declare-fun condMapEmpty!11019 () Bool)

(declare-fun mapDefault!11019 () ValueCell!2898)

(assert (=> mapNonEmpty!11013 (= condMapEmpty!11019 (= mapRest!11013 ((as const (Array (_ BitVec 32) ValueCell!2898)) mapDefault!11019)))))

(assert (=> mapNonEmpty!11013 (= tp!23123 (and e!162161 mapRes!11019))))

(assert (= (and mapNonEmpty!11013 condMapEmpty!11019) mapIsEmpty!11019))

(assert (= (and mapNonEmpty!11013 (not condMapEmpty!11019)) mapNonEmpty!11019))

(assert (= (and mapNonEmpty!11019 ((_ is ValueCellFull!2898) mapValue!11019)) b!250028))

(assert (= (and mapNonEmpty!11013 ((_ is ValueCellFull!2898) mapDefault!11019)) b!250029))

(declare-fun m!266481 () Bool)

(assert (=> mapNonEmpty!11019 m!266481))

(declare-fun b_lambda!8077 () Bool)

(assert (= b_lambda!8075 (or (and b!249759 b_free!6621) b_lambda!8077)))

(check-sat (not bm!23481) (not d!60791) (not b!249898) (not bm!23471) (not bm!23473) (not b!249832) (not bm!23470) (not d!60779) (not mapNonEmpty!11019) (not bm!23472) (not b_next!6621) (not b!249845) (not b!249847) (not b!249906) (not b!249830) (not b!249984) (not d!60773) (not d!60777) (not b!249900) (not d!60795) (not b!249969) (not d!60793) (not b!249970) (not b!249831) (not b!249909) (not b!250021) (not d!60781) (not b!249907) (not b!249902) (not d!60807) (not bm!23482) (not bm!23485) (not b_lambda!8077) (not b!249936) b_and!13639 (not b!249996) (not b!249901) (not bm!23488) (not d!60771) (not b!250018) (not bm!23489) tp_is_empty!6483 (not d!60809) (not b!249981) (not b!249890) (not b!249837) (not b!249972) (not b!250012) (not b!250014) (not bm!23492) (not b!249930) (not b!250000) (not b!250011))
(check-sat b_and!13639 (not b_next!6621))
(get-model)

(declare-fun d!60811 () Bool)

(assert (=> d!60811 (= (validKeyInArray!0 (select (arr!5825 lt!125103) #b00000000000000000000000000000000)) (and (not (= (select (arr!5825 lt!125103) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5825 lt!125103) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249996 d!60811))

(declare-fun d!60813 () Bool)

(assert (=> d!60813 (isDefined!238 (getValueByKey!297 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932))))

(declare-fun lt!125263 () Unit!7734)

(declare-fun choose!1182 (List!3719 (_ BitVec 64)) Unit!7734)

(assert (=> d!60813 (= lt!125263 (choose!1182 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932))))

(declare-fun e!162164 () Bool)

(assert (=> d!60813 e!162164))

(declare-fun res!122473 () Bool)

(assert (=> d!60813 (=> (not res!122473) (not e!162164))))

(declare-fun isStrictlySorted!370 (List!3719) Bool)

(assert (=> d!60813 (= res!122473 (isStrictlySorted!370 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))))))

(assert (=> d!60813 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932) lt!125263)))

(declare-fun b!250032 () Bool)

(assert (=> b!250032 (= e!162164 (containsKey!289 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932))))

(assert (= (and d!60813 res!122473) b!250032))

(assert (=> d!60813 m!266355))

(assert (=> d!60813 m!266355))

(assert (=> d!60813 m!266357))

(declare-fun m!266483 () Bool)

(assert (=> d!60813 m!266483))

(declare-fun m!266485 () Bool)

(assert (=> d!60813 m!266485))

(assert (=> b!250032 m!266351))

(assert (=> b!249845 d!60813))

(declare-fun d!60815 () Bool)

(declare-fun isEmpty!526 (Option!303) Bool)

(assert (=> d!60815 (= (isDefined!238 (getValueByKey!297 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932)) (not (isEmpty!526 (getValueByKey!297 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932))))))

(declare-fun bs!8964 () Bool)

(assert (= bs!8964 d!60815))

(assert (=> bs!8964 m!266355))

(declare-fun m!266487 () Bool)

(assert (=> bs!8964 m!266487))

(assert (=> b!249845 d!60815))

(declare-fun b!250043 () Bool)

(declare-fun e!162170 () Option!303)

(assert (=> b!250043 (= e!162170 (getValueByKey!297 (t!8750 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))) key!932))))

(declare-fun b!250042 () Bool)

(declare-fun e!162169 () Option!303)

(assert (=> b!250042 (= e!162169 e!162170)))

(declare-fun c!41987 () Bool)

(assert (=> b!250042 (= c!41987 (and ((_ is Cons!3715) (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))) (not (= (_1!2430 (h!4374 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))))) key!932))))))

(declare-fun b!250044 () Bool)

(assert (=> b!250044 (= e!162170 None!301)))

(declare-fun d!60817 () Bool)

(declare-fun c!41986 () Bool)

(assert (=> d!60817 (= c!41986 (and ((_ is Cons!3715) (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))) (= (_1!2430 (h!4374 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))))) key!932)))))

(assert (=> d!60817 (= (getValueByKey!297 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932) e!162169)))

(declare-fun b!250041 () Bool)

(assert (=> b!250041 (= e!162169 (Some!302 (_2!2430 (h!4374 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))))))))

(assert (= (and d!60817 c!41986) b!250041))

(assert (= (and d!60817 (not c!41986)) b!250042))

(assert (= (and b!250042 c!41987) b!250043))

(assert (= (and b!250042 (not c!41987)) b!250044))

(declare-fun m!266489 () Bool)

(assert (=> b!250043 m!266489))

(assert (=> b!249845 d!60817))

(assert (=> b!249830 d!60801))

(declare-fun d!60819 () Bool)

(declare-fun get!2992 (Option!303) V!8291)

(assert (=> d!60819 (= (apply!239 lt!125200 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2992 (getValueByKey!297 (toList!1891 lt!125200) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8965 () Bool)

(assert (= bs!8965 d!60819))

(declare-fun m!266491 () Bool)

(assert (=> bs!8965 m!266491))

(assert (=> bs!8965 m!266491))

(declare-fun m!266493 () Bool)

(assert (=> bs!8965 m!266493))

(assert (=> b!249906 d!60819))

(declare-fun d!60821 () Bool)

(declare-fun e!162171 () Bool)

(assert (=> d!60821 e!162171))

(declare-fun res!122474 () Bool)

(assert (=> d!60821 (=> res!122474 e!162171)))

(declare-fun lt!125264 () Bool)

(assert (=> d!60821 (= res!122474 (not lt!125264))))

(declare-fun lt!125266 () Bool)

(assert (=> d!60821 (= lt!125264 lt!125266)))

(declare-fun lt!125267 () Unit!7734)

(declare-fun e!162172 () Unit!7734)

(assert (=> d!60821 (= lt!125267 e!162172)))

(declare-fun c!41988 () Bool)

(assert (=> d!60821 (= c!41988 lt!125266)))

(assert (=> d!60821 (= lt!125266 (containsKey!289 (toList!1891 lt!125200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60821 (= (contains!1810 lt!125200 #b0000000000000000000000000000000000000000000000000000000000000000) lt!125264)))

(declare-fun b!250045 () Bool)

(declare-fun lt!125265 () Unit!7734)

(assert (=> b!250045 (= e!162172 lt!125265)))

(assert (=> b!250045 (= lt!125265 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1891 lt!125200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250045 (isDefined!238 (getValueByKey!297 (toList!1891 lt!125200) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250046 () Bool)

(declare-fun Unit!7741 () Unit!7734)

(assert (=> b!250046 (= e!162172 Unit!7741)))

(declare-fun b!250047 () Bool)

(assert (=> b!250047 (= e!162171 (isDefined!238 (getValueByKey!297 (toList!1891 lt!125200) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60821 c!41988) b!250045))

(assert (= (and d!60821 (not c!41988)) b!250046))

(assert (= (and d!60821 (not res!122474)) b!250047))

(declare-fun m!266495 () Bool)

(assert (=> d!60821 m!266495))

(declare-fun m!266497 () Bool)

(assert (=> b!250045 m!266497))

(assert (=> b!250045 m!266491))

(assert (=> b!250045 m!266491))

(declare-fun m!266499 () Bool)

(assert (=> b!250045 m!266499))

(assert (=> b!250047 m!266491))

(assert (=> b!250047 m!266491))

(assert (=> b!250047 m!266499))

(assert (=> bm!23471 d!60821))

(declare-fun b!250048 () Bool)

(declare-fun e!162174 () (_ BitVec 32))

(declare-fun call!23496 () (_ BitVec 32))

(assert (=> b!250048 (= e!162174 (bvadd #b00000000000000000000000000000001 call!23496))))

(declare-fun b!250049 () Bool)

(declare-fun e!162173 () (_ BitVec 32))

(assert (=> b!250049 (= e!162173 #b00000000000000000000000000000000)))

(declare-fun bm!23493 () Bool)

(assert (=> bm!23493 (= call!23496 (arrayCountValidKeys!0 lt!125103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!250050 () Bool)

(assert (=> b!250050 (= e!162174 call!23496)))

(declare-fun b!250051 () Bool)

(assert (=> b!250051 (= e!162173 e!162174)))

(declare-fun c!41990 () Bool)

(assert (=> b!250051 (= c!41990 (validKeyInArray!0 (select (arr!5825 lt!125103) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!60823 () Bool)

(declare-fun lt!125268 () (_ BitVec 32))

(assert (=> d!60823 (and (bvsge lt!125268 #b00000000000000000000000000000000) (bvsle lt!125268 (bvsub (size!6169 lt!125103) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60823 (= lt!125268 e!162173)))

(declare-fun c!41989 () Bool)

(assert (=> d!60823 (= c!41989 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60823 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6169 (_keys!6749 thiss!1504)) (size!6169 lt!125103)))))

(assert (=> d!60823 (= (arrayCountValidKeys!0 lt!125103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))) lt!125268)))

(assert (= (and d!60823 c!41989) b!250049))

(assert (= (and d!60823 (not c!41989)) b!250051))

(assert (= (and b!250051 c!41990) b!250048))

(assert (= (and b!250051 (not c!41990)) b!250050))

(assert (= (or b!250048 b!250050) bm!23493))

(declare-fun m!266501 () Bool)

(assert (=> bm!23493 m!266501))

(declare-fun m!266503 () Bool)

(assert (=> b!250051 m!266503))

(assert (=> b!250051 m!266503))

(declare-fun m!266505 () Bool)

(assert (=> b!250051 m!266505))

(assert (=> bm!23488 d!60823))

(declare-fun b!250052 () Bool)

(declare-fun e!162177 () Bool)

(declare-fun e!162178 () Bool)

(assert (=> b!250052 (= e!162177 e!162178)))

(declare-fun c!41991 () Bool)

(assert (=> b!250052 (= c!41991 (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250053 () Bool)

(declare-fun e!162176 () Bool)

(assert (=> b!250053 (= e!162176 e!162177)))

(declare-fun res!122477 () Bool)

(assert (=> b!250053 (=> (not res!122477) (not e!162177))))

(declare-fun e!162175 () Bool)

(assert (=> b!250053 (= res!122477 (not e!162175))))

(declare-fun res!122476 () Bool)

(assert (=> b!250053 (=> (not res!122476) (not e!162175))))

(assert (=> b!250053 (= res!122476 (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!60825 () Bool)

(declare-fun res!122475 () Bool)

(assert (=> d!60825 (=> res!122475 e!162176)))

(assert (=> d!60825 (= res!122475 (bvsge #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60825 (= (arrayNoDuplicates!0 (_keys!6749 thiss!1504) #b00000000000000000000000000000000 Nil!3717) e!162176)))

(declare-fun b!250054 () Bool)

(declare-fun call!23497 () Bool)

(assert (=> b!250054 (= e!162178 call!23497)))

(declare-fun b!250055 () Bool)

(assert (=> b!250055 (= e!162175 (contains!1811 Nil!3717 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250056 () Bool)

(assert (=> b!250056 (= e!162178 call!23497)))

(declare-fun bm!23494 () Bool)

(assert (=> bm!23494 (= call!23497 (arrayNoDuplicates!0 (_keys!6749 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41991 (Cons!3716 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000) Nil!3717) Nil!3717)))))

(assert (= (and d!60825 (not res!122475)) b!250053))

(assert (= (and b!250053 res!122476) b!250055))

(assert (= (and b!250053 res!122477) b!250052))

(assert (= (and b!250052 c!41991) b!250054))

(assert (= (and b!250052 (not c!41991)) b!250056))

(assert (= (or b!250054 b!250056) bm!23494))

(assert (=> b!250052 m!266391))

(assert (=> b!250052 m!266391))

(assert (=> b!250052 m!266409))

(assert (=> b!250053 m!266391))

(assert (=> b!250053 m!266391))

(assert (=> b!250053 m!266409))

(assert (=> b!250055 m!266391))

(assert (=> b!250055 m!266391))

(declare-fun m!266507 () Bool)

(assert (=> b!250055 m!266507))

(assert (=> bm!23494 m!266391))

(declare-fun m!266509 () Bool)

(assert (=> bm!23494 m!266509))

(assert (=> b!249832 d!60825))

(declare-fun d!60827 () Bool)

(assert (=> d!60827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) (mask!10789 thiss!1504))))

(assert (=> d!60827 true))

(declare-fun _$56!24 () Unit!7734)

(assert (=> d!60827 (= (choose!102 key!932 (_keys!6749 thiss!1504) index!297 (mask!10789 thiss!1504)) _$56!24)))

(declare-fun bs!8966 () Bool)

(assert (= bs!8966 d!60827))

(assert (=> bs!8966 m!266281))

(assert (=> bs!8966 m!266479))

(assert (=> d!60809 d!60827))

(assert (=> d!60809 d!60803))

(declare-fun d!60829 () Bool)

(assert (=> d!60829 (= (inRange!0 (index!6647 lt!125142) (mask!10789 thiss!1504)) (and (bvsge (index!6647 lt!125142) #b00000000000000000000000000000000) (bvslt (index!6647 lt!125142) (bvadd (mask!10789 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!249837 d!60829))

(declare-fun d!60831 () Bool)

(assert (=> d!60831 (= (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!250000 d!60831))

(declare-fun d!60833 () Bool)

(assert (=> d!60833 (arrayNoDuplicates!0 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) #b00000000000000000000000000000000 Nil!3717)))

(assert (=> d!60833 true))

(declare-fun _$65!77 () Unit!7734)

(assert (=> d!60833 (= (choose!41 (_keys!6749 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3717) _$65!77)))

(declare-fun bs!8967 () Bool)

(assert (= bs!8967 d!60833))

(assert (=> bs!8967 m!266281))

(assert (=> bs!8967 m!266475))

(assert (=> d!60807 d!60833))

(declare-fun d!60835 () Bool)

(declare-fun e!162179 () Bool)

(assert (=> d!60835 e!162179))

(declare-fun res!122478 () Bool)

(assert (=> d!60835 (=> res!122478 e!162179)))

(declare-fun lt!125269 () Bool)

(assert (=> d!60835 (= res!122478 (not lt!125269))))

(declare-fun lt!125271 () Bool)

(assert (=> d!60835 (= lt!125269 lt!125271)))

(declare-fun lt!125272 () Unit!7734)

(declare-fun e!162180 () Unit!7734)

(assert (=> d!60835 (= lt!125272 e!162180)))

(declare-fun c!41992 () Bool)

(assert (=> d!60835 (= c!41992 lt!125271)))

(assert (=> d!60835 (= lt!125271 (containsKey!289 (toList!1891 lt!125200) (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!60835 (= (contains!1810 lt!125200 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)) lt!125269)))

(declare-fun b!250057 () Bool)

(declare-fun lt!125270 () Unit!7734)

(assert (=> b!250057 (= e!162180 lt!125270)))

(assert (=> b!250057 (= lt!125270 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1891 lt!125200) (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250057 (isDefined!238 (getValueByKey!297 (toList!1891 lt!125200) (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250058 () Bool)

(declare-fun Unit!7742 () Unit!7734)

(assert (=> b!250058 (= e!162180 Unit!7742)))

(declare-fun b!250059 () Bool)

(assert (=> b!250059 (= e!162179 (isDefined!238 (getValueByKey!297 (toList!1891 lt!125200) (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!60835 c!41992) b!250057))

(assert (= (and d!60835 (not c!41992)) b!250058))

(assert (= (and d!60835 (not res!122478)) b!250059))

(assert (=> d!60835 m!266391))

(declare-fun m!266511 () Bool)

(assert (=> d!60835 m!266511))

(assert (=> b!250057 m!266391))

(declare-fun m!266513 () Bool)

(assert (=> b!250057 m!266513))

(assert (=> b!250057 m!266391))

(declare-fun m!266515 () Bool)

(assert (=> b!250057 m!266515))

(assert (=> b!250057 m!266515))

(declare-fun m!266517 () Bool)

(assert (=> b!250057 m!266517))

(assert (=> b!250059 m!266391))

(assert (=> b!250059 m!266515))

(assert (=> b!250059 m!266515))

(assert (=> b!250059 m!266517))

(assert (=> b!249890 d!60835))

(declare-fun b!250060 () Bool)

(declare-fun e!162182 () (_ BitVec 32))

(declare-fun call!23498 () (_ BitVec 32))

(assert (=> b!250060 (= e!162182 (bvadd #b00000000000000000000000000000001 call!23498))))

(declare-fun b!250061 () Bool)

(declare-fun e!162181 () (_ BitVec 32))

(assert (=> b!250061 (= e!162181 #b00000000000000000000000000000000)))

(declare-fun bm!23495 () Bool)

(assert (=> bm!23495 (= call!23498 (arrayCountValidKeys!0 (_keys!6749 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!250062 () Bool)

(assert (=> b!250062 (= e!162182 call!23498)))

(declare-fun b!250063 () Bool)

(assert (=> b!250063 (= e!162181 e!162182)))

(declare-fun c!41994 () Bool)

(assert (=> b!250063 (= c!41994 (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!60837 () Bool)

(declare-fun lt!125273 () (_ BitVec 32))

(assert (=> d!60837 (and (bvsge lt!125273 #b00000000000000000000000000000000) (bvsle lt!125273 (bvsub (size!6169 (_keys!6749 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!60837 (= lt!125273 e!162181)))

(declare-fun c!41993 () Bool)

(assert (=> d!60837 (= c!41993 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60837 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!6169 (_keys!6749 thiss!1504)) (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60837 (= (arrayCountValidKeys!0 (_keys!6749 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))) lt!125273)))

(assert (= (and d!60837 c!41993) b!250061))

(assert (= (and d!60837 (not c!41993)) b!250063))

(assert (= (and b!250063 c!41994) b!250060))

(assert (= (and b!250063 (not c!41994)) b!250062))

(assert (= (or b!250060 b!250062) bm!23495))

(declare-fun m!266519 () Bool)

(assert (=> bm!23495 m!266519))

(declare-fun m!266521 () Bool)

(assert (=> b!250063 m!266521))

(assert (=> b!250063 m!266521))

(declare-fun m!266523 () Bool)

(assert (=> b!250063 m!266523))

(assert (=> bm!23489 d!60837))

(declare-fun b!250082 () Bool)

(declare-fun e!162193 () SeekEntryResult!1119)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!250082 (= e!162193 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10789 thiss!1504)) #b00000000000000000000000000000000 (mask!10789 thiss!1504)) key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(declare-fun b!250083 () Bool)

(declare-fun e!162194 () SeekEntryResult!1119)

(assert (=> b!250083 (= e!162194 (Intermediate!1119 true (toIndex!0 key!932 (mask!10789 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!250084 () Bool)

(declare-fun lt!125278 () SeekEntryResult!1119)

(assert (=> b!250084 (and (bvsge (index!6648 lt!125278) #b00000000000000000000000000000000) (bvslt (index!6648 lt!125278) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun res!122485 () Bool)

(assert (=> b!250084 (= res!122485 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6648 lt!125278)) key!932))))

(declare-fun e!162197 () Bool)

(assert (=> b!250084 (=> res!122485 e!162197)))

(declare-fun e!162195 () Bool)

(assert (=> b!250084 (= e!162195 e!162197)))

(declare-fun b!250085 () Bool)

(declare-fun e!162196 () Bool)

(assert (=> b!250085 (= e!162196 (bvsge (x!24643 lt!125278) #b01111111111111111111111111111110))))

(declare-fun b!250086 () Bool)

(assert (=> b!250086 (and (bvsge (index!6648 lt!125278) #b00000000000000000000000000000000) (bvslt (index!6648 lt!125278) (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> b!250086 (= e!162197 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6648 lt!125278)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250087 () Bool)

(assert (=> b!250087 (and (bvsge (index!6648 lt!125278) #b00000000000000000000000000000000) (bvslt (index!6648 lt!125278) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun res!122486 () Bool)

(assert (=> b!250087 (= res!122486 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6648 lt!125278)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250087 (=> res!122486 e!162197)))

(declare-fun b!250088 () Bool)

(assert (=> b!250088 (= e!162193 (Intermediate!1119 false (toIndex!0 key!932 (mask!10789 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!60839 () Bool)

(assert (=> d!60839 e!162196))

(declare-fun c!42002 () Bool)

(assert (=> d!60839 (= c!42002 (and ((_ is Intermediate!1119) lt!125278) (undefined!1931 lt!125278)))))

(assert (=> d!60839 (= lt!125278 e!162194)))

(declare-fun c!42003 () Bool)

(assert (=> d!60839 (= c!42003 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!125279 () (_ BitVec 64))

(assert (=> d!60839 (= lt!125279 (select (arr!5825 (_keys!6749 thiss!1504)) (toIndex!0 key!932 (mask!10789 thiss!1504))))))

(assert (=> d!60839 (validMask!0 (mask!10789 thiss!1504))))

(assert (=> d!60839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10789 thiss!1504)) key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)) lt!125278)))

(declare-fun b!250089 () Bool)

(assert (=> b!250089 (= e!162196 e!162195)))

(declare-fun res!122487 () Bool)

(assert (=> b!250089 (= res!122487 (and ((_ is Intermediate!1119) lt!125278) (not (undefined!1931 lt!125278)) (bvslt (x!24643 lt!125278) #b01111111111111111111111111111110) (bvsge (x!24643 lt!125278) #b00000000000000000000000000000000) (bvsge (x!24643 lt!125278) #b00000000000000000000000000000000)))))

(assert (=> b!250089 (=> (not res!122487) (not e!162195))))

(declare-fun b!250090 () Bool)

(assert (=> b!250090 (= e!162194 e!162193)))

(declare-fun c!42001 () Bool)

(assert (=> b!250090 (= c!42001 (or (= lt!125279 key!932) (= (bvadd lt!125279 lt!125279) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60839 c!42003) b!250083))

(assert (= (and d!60839 (not c!42003)) b!250090))

(assert (= (and b!250090 c!42001) b!250088))

(assert (= (and b!250090 (not c!42001)) b!250082))

(assert (= (and d!60839 c!42002) b!250085))

(assert (= (and d!60839 (not c!42002)) b!250089))

(assert (= (and b!250089 res!122487) b!250084))

(assert (= (and b!250084 (not res!122485)) b!250087))

(assert (= (and b!250087 (not res!122486)) b!250086))

(assert (=> d!60839 m!266421))

(declare-fun m!266525 () Bool)

(assert (=> d!60839 m!266525))

(assert (=> d!60839 m!266271))

(declare-fun m!266527 () Bool)

(assert (=> b!250087 m!266527))

(assert (=> b!250086 m!266527))

(assert (=> b!250084 m!266527))

(assert (=> b!250082 m!266421))

(declare-fun m!266529 () Bool)

(assert (=> b!250082 m!266529))

(assert (=> b!250082 m!266529))

(declare-fun m!266531 () Bool)

(assert (=> b!250082 m!266531))

(assert (=> d!60781 d!60839))

(declare-fun d!60841 () Bool)

(declare-fun lt!125285 () (_ BitVec 32))

(declare-fun lt!125284 () (_ BitVec 32))

(assert (=> d!60841 (= lt!125285 (bvmul (bvxor lt!125284 (bvlshr lt!125284 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!60841 (= lt!125284 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!60841 (and (bvsge (mask!10789 thiss!1504) #b00000000000000000000000000000000) (let ((res!122488 (let ((h!4376 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!24659 (bvmul (bvxor h!4376 (bvlshr h!4376 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!24659 (bvlshr x!24659 #b00000000000000000000000000001101)) (mask!10789 thiss!1504)))))) (and (bvslt res!122488 (bvadd (mask!10789 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!122488 #b00000000000000000000000000000000))))))

(assert (=> d!60841 (= (toIndex!0 key!932 (mask!10789 thiss!1504)) (bvand (bvxor lt!125285 (bvlshr lt!125285 #b00000000000000000000000000001101)) (mask!10789 thiss!1504)))))

(assert (=> d!60781 d!60841))

(assert (=> d!60781 d!60803))

(declare-fun b!250091 () Bool)

(declare-fun e!162200 () Bool)

(declare-fun e!162201 () Bool)

(assert (=> b!250091 (= e!162200 e!162201)))

(declare-fun c!42004 () Bool)

(assert (=> b!250091 (= c!42004 (validKeyInArray!0 (select (arr!5825 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!250092 () Bool)

(declare-fun e!162199 () Bool)

(assert (=> b!250092 (= e!162199 e!162200)))

(declare-fun res!122491 () Bool)

(assert (=> b!250092 (=> (not res!122491) (not e!162200))))

(declare-fun e!162198 () Bool)

(assert (=> b!250092 (= res!122491 (not e!162198))))

(declare-fun res!122490 () Bool)

(assert (=> b!250092 (=> (not res!122490) (not e!162198))))

(assert (=> b!250092 (= res!122490 (validKeyInArray!0 (select (arr!5825 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!60843 () Bool)

(declare-fun res!122489 () Bool)

(assert (=> d!60843 (=> res!122489 e!162199)))

(assert (=> d!60843 (= res!122489 (bvsge #b00000000000000000000000000000000 (size!6169 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))))))))

(assert (=> d!60843 (= (arrayNoDuplicates!0 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) #b00000000000000000000000000000000 Nil!3717) e!162199)))

(declare-fun b!250093 () Bool)

(declare-fun call!23499 () Bool)

(assert (=> b!250093 (= e!162201 call!23499)))

(declare-fun b!250094 () Bool)

(assert (=> b!250094 (= e!162198 (contains!1811 Nil!3717 (select (arr!5825 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!250095 () Bool)

(assert (=> b!250095 (= e!162201 call!23499)))

(declare-fun bm!23496 () Bool)

(assert (=> bm!23496 (= call!23499 (arrayNoDuplicates!0 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42004 (Cons!3716 (select (arr!5825 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504)))) #b00000000000000000000000000000000) Nil!3717) Nil!3717)))))

(assert (= (and d!60843 (not res!122489)) b!250092))

(assert (= (and b!250092 res!122490) b!250094))

(assert (= (and b!250092 res!122491) b!250091))

(assert (= (and b!250091 c!42004) b!250093))

(assert (= (and b!250091 (not c!42004)) b!250095))

(assert (= (or b!250093 b!250095) bm!23496))

(declare-fun m!266533 () Bool)

(assert (=> b!250091 m!266533))

(assert (=> b!250091 m!266533))

(declare-fun m!266535 () Bool)

(assert (=> b!250091 m!266535))

(assert (=> b!250092 m!266533))

(assert (=> b!250092 m!266533))

(assert (=> b!250092 m!266535))

(assert (=> b!250094 m!266533))

(assert (=> b!250094 m!266533))

(declare-fun m!266537 () Bool)

(assert (=> b!250094 m!266537))

(assert (=> bm!23496 m!266533))

(declare-fun m!266539 () Bool)

(assert (=> bm!23496 m!266539))

(assert (=> b!250018 d!60843))

(declare-fun d!60845 () Bool)

(declare-fun res!122492 () Bool)

(declare-fun e!162202 () Bool)

(assert (=> d!60845 (=> res!122492 e!162202)))

(assert (=> d!60845 (= res!122492 (= (select (arr!5825 (_keys!6749 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!932))))

(assert (=> d!60845 (= (arrayContainsKey!0 (_keys!6749 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!162202)))

(declare-fun b!250096 () Bool)

(declare-fun e!162203 () Bool)

(assert (=> b!250096 (= e!162202 e!162203)))

(declare-fun res!122493 () Bool)

(assert (=> b!250096 (=> (not res!122493) (not e!162203))))

(assert (=> b!250096 (= res!122493 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!250097 () Bool)

(assert (=> b!250097 (= e!162203 (arrayContainsKey!0 (_keys!6749 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!60845 (not res!122492)) b!250096))

(assert (= (and b!250096 res!122493) b!250097))

(assert (=> d!60845 m!266521))

(declare-fun m!266541 () Bool)

(assert (=> b!250097 m!266541))

(assert (=> b!249936 d!60845))

(assert (=> b!249984 d!60811))

(declare-fun d!60847 () Bool)

(assert (=> d!60847 (= (apply!239 (+!666 lt!125215 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504))) lt!125219) (get!2992 (getValueByKey!297 (toList!1891 (+!666 lt!125215 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504)))) lt!125219)))))

(declare-fun bs!8968 () Bool)

(assert (= bs!8968 d!60847))

(declare-fun m!266543 () Bool)

(assert (=> bs!8968 m!266543))

(assert (=> bs!8968 m!266543))

(declare-fun m!266545 () Bool)

(assert (=> bs!8968 m!266545))

(assert (=> b!249901 d!60847))

(declare-fun d!60849 () Bool)

(declare-fun e!162206 () Bool)

(assert (=> d!60849 e!162206))

(declare-fun res!122498 () Bool)

(assert (=> d!60849 (=> (not res!122498) (not e!162206))))

(declare-fun lt!125297 () ListLongMap!3751)

(assert (=> d!60849 (= res!122498 (contains!1810 lt!125297 (_1!2430 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504)))))))

(declare-fun lt!125295 () List!3719)

(assert (=> d!60849 (= lt!125297 (ListLongMap!3752 lt!125295))))

(declare-fun lt!125294 () Unit!7734)

(declare-fun lt!125296 () Unit!7734)

(assert (=> d!60849 (= lt!125294 lt!125296)))

(assert (=> d!60849 (= (getValueByKey!297 lt!125295 (_1!2430 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504)))) (Some!302 (_2!2430 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!158 (List!3719 (_ BitVec 64) V!8291) Unit!7734)

(assert (=> d!60849 (= lt!125296 (lemmaContainsTupThenGetReturnValue!158 lt!125295 (_1!2430 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504))) (_2!2430 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504)))))))

(declare-fun insertStrictlySorted!161 (List!3719 (_ BitVec 64) V!8291) List!3719)

(assert (=> d!60849 (= lt!125295 (insertStrictlySorted!161 (toList!1891 lt!125207) (_1!2430 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504))) (_2!2430 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504)))))))

(assert (=> d!60849 (= (+!666 lt!125207 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504))) lt!125297)))

(declare-fun b!250102 () Bool)

(declare-fun res!122499 () Bool)

(assert (=> b!250102 (=> (not res!122499) (not e!162206))))

(assert (=> b!250102 (= res!122499 (= (getValueByKey!297 (toList!1891 lt!125297) (_1!2430 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504)))) (Some!302 (_2!2430 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504))))))))

(declare-fun b!250103 () Bool)

(declare-fun contains!1812 (List!3719 tuple2!4838) Bool)

(assert (=> b!250103 (= e!162206 (contains!1812 (toList!1891 lt!125297) (tuple2!4839 lt!125208 (minValue!4458 thiss!1504))))))

(assert (= (and d!60849 res!122498) b!250102))

(assert (= (and b!250102 res!122499) b!250103))

(declare-fun m!266547 () Bool)

(assert (=> d!60849 m!266547))

(declare-fun m!266549 () Bool)

(assert (=> d!60849 m!266549))

(declare-fun m!266551 () Bool)

(assert (=> d!60849 m!266551))

(declare-fun m!266553 () Bool)

(assert (=> d!60849 m!266553))

(declare-fun m!266555 () Bool)

(assert (=> b!250102 m!266555))

(declare-fun m!266557 () Bool)

(assert (=> b!250103 m!266557))

(assert (=> b!249901 d!60849))

(declare-fun d!60851 () Bool)

(assert (=> d!60851 (contains!1810 (+!666 lt!125209 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504))) lt!125214)))

(declare-fun lt!125300 () Unit!7734)

(declare-fun choose!1183 (ListLongMap!3751 (_ BitVec 64) V!8291 (_ BitVec 64)) Unit!7734)

(assert (=> d!60851 (= lt!125300 (choose!1183 lt!125209 lt!125212 (zeroValue!4458 thiss!1504) lt!125214))))

(assert (=> d!60851 (contains!1810 lt!125209 lt!125214)))

(assert (=> d!60851 (= (addStillContains!215 lt!125209 lt!125212 (zeroValue!4458 thiss!1504) lt!125214) lt!125300)))

(declare-fun bs!8969 () Bool)

(assert (= bs!8969 d!60851))

(assert (=> bs!8969 m!266369))

(assert (=> bs!8969 m!266369))

(assert (=> bs!8969 m!266377))

(declare-fun m!266559 () Bool)

(assert (=> bs!8969 m!266559))

(declare-fun m!266561 () Bool)

(assert (=> bs!8969 m!266561))

(assert (=> b!249901 d!60851))

(declare-fun d!60853 () Bool)

(declare-fun e!162207 () Bool)

(assert (=> d!60853 e!162207))

(declare-fun res!122500 () Bool)

(assert (=> d!60853 (=> (not res!122500) (not e!162207))))

(declare-fun lt!125304 () ListLongMap!3751)

(assert (=> d!60853 (= res!122500 (contains!1810 lt!125304 (_1!2430 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504)))))))

(declare-fun lt!125302 () List!3719)

(assert (=> d!60853 (= lt!125304 (ListLongMap!3752 lt!125302))))

(declare-fun lt!125301 () Unit!7734)

(declare-fun lt!125303 () Unit!7734)

(assert (=> d!60853 (= lt!125301 lt!125303)))

(assert (=> d!60853 (= (getValueByKey!297 lt!125302 (_1!2430 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504)))) (Some!302 (_2!2430 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504)))))))

(assert (=> d!60853 (= lt!125303 (lemmaContainsTupThenGetReturnValue!158 lt!125302 (_1!2430 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504))) (_2!2430 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504)))))))

(assert (=> d!60853 (= lt!125302 (insertStrictlySorted!161 (toList!1891 lt!125209) (_1!2430 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504))) (_2!2430 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504)))))))

(assert (=> d!60853 (= (+!666 lt!125209 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504))) lt!125304)))

(declare-fun b!250105 () Bool)

(declare-fun res!122501 () Bool)

(assert (=> b!250105 (=> (not res!122501) (not e!162207))))

(assert (=> b!250105 (= res!122501 (= (getValueByKey!297 (toList!1891 lt!125304) (_1!2430 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504)))) (Some!302 (_2!2430 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504))))))))

(declare-fun b!250106 () Bool)

(assert (=> b!250106 (= e!162207 (contains!1812 (toList!1891 lt!125304) (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504))))))

(assert (= (and d!60853 res!122500) b!250105))

(assert (= (and b!250105 res!122501) b!250106))

(declare-fun m!266563 () Bool)

(assert (=> d!60853 m!266563))

(declare-fun m!266565 () Bool)

(assert (=> d!60853 m!266565))

(declare-fun m!266567 () Bool)

(assert (=> d!60853 m!266567))

(declare-fun m!266569 () Bool)

(assert (=> d!60853 m!266569))

(declare-fun m!266571 () Bool)

(assert (=> b!250105 m!266571))

(declare-fun m!266573 () Bool)

(assert (=> b!250106 m!266573))

(assert (=> b!249901 d!60853))

(declare-fun d!60855 () Bool)

(assert (=> d!60855 (= (apply!239 (+!666 lt!125201 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504))) lt!125210) (apply!239 lt!125201 lt!125210))))

(declare-fun lt!125307 () Unit!7734)

(declare-fun choose!1184 (ListLongMap!3751 (_ BitVec 64) V!8291 (_ BitVec 64)) Unit!7734)

(assert (=> d!60855 (= lt!125307 (choose!1184 lt!125201 lt!125211 (zeroValue!4458 thiss!1504) lt!125210))))

(declare-fun e!162210 () Bool)

(assert (=> d!60855 e!162210))

(declare-fun res!122504 () Bool)

(assert (=> d!60855 (=> (not res!122504) (not e!162210))))

(assert (=> d!60855 (= res!122504 (contains!1810 lt!125201 lt!125210))))

(assert (=> d!60855 (= (addApplyDifferent!215 lt!125201 lt!125211 (zeroValue!4458 thiss!1504) lt!125210) lt!125307)))

(declare-fun b!250110 () Bool)

(assert (=> b!250110 (= e!162210 (not (= lt!125210 lt!125211)))))

(assert (= (and d!60855 res!122504) b!250110))

(assert (=> d!60855 m!266361))

(declare-fun m!266575 () Bool)

(assert (=> d!60855 m!266575))

(assert (=> d!60855 m!266361))

(assert (=> d!60855 m!266363))

(assert (=> d!60855 m!266367))

(declare-fun m!266577 () Bool)

(assert (=> d!60855 m!266577))

(assert (=> b!249901 d!60855))

(declare-fun d!60857 () Bool)

(declare-fun e!162211 () Bool)

(assert (=> d!60857 e!162211))

(declare-fun res!122505 () Bool)

(assert (=> d!60857 (=> res!122505 e!162211)))

(declare-fun lt!125308 () Bool)

(assert (=> d!60857 (= res!122505 (not lt!125308))))

(declare-fun lt!125310 () Bool)

(assert (=> d!60857 (= lt!125308 lt!125310)))

(declare-fun lt!125311 () Unit!7734)

(declare-fun e!162212 () Unit!7734)

(assert (=> d!60857 (= lt!125311 e!162212)))

(declare-fun c!42005 () Bool)

(assert (=> d!60857 (= c!42005 lt!125310)))

(assert (=> d!60857 (= lt!125310 (containsKey!289 (toList!1891 (+!666 lt!125209 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504)))) lt!125214))))

(assert (=> d!60857 (= (contains!1810 (+!666 lt!125209 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504))) lt!125214) lt!125308)))

(declare-fun b!250111 () Bool)

(declare-fun lt!125309 () Unit!7734)

(assert (=> b!250111 (= e!162212 lt!125309)))

(assert (=> b!250111 (= lt!125309 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1891 (+!666 lt!125209 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504)))) lt!125214))))

(assert (=> b!250111 (isDefined!238 (getValueByKey!297 (toList!1891 (+!666 lt!125209 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504)))) lt!125214))))

(declare-fun b!250112 () Bool)

(declare-fun Unit!7743 () Unit!7734)

(assert (=> b!250112 (= e!162212 Unit!7743)))

(declare-fun b!250113 () Bool)

(assert (=> b!250113 (= e!162211 (isDefined!238 (getValueByKey!297 (toList!1891 (+!666 lt!125209 (tuple2!4839 lt!125212 (zeroValue!4458 thiss!1504)))) lt!125214)))))

(assert (= (and d!60857 c!42005) b!250111))

(assert (= (and d!60857 (not c!42005)) b!250112))

(assert (= (and d!60857 (not res!122505)) b!250113))

(declare-fun m!266579 () Bool)

(assert (=> d!60857 m!266579))

(declare-fun m!266581 () Bool)

(assert (=> b!250111 m!266581))

(declare-fun m!266583 () Bool)

(assert (=> b!250111 m!266583))

(assert (=> b!250111 m!266583))

(declare-fun m!266585 () Bool)

(assert (=> b!250111 m!266585))

(assert (=> b!250113 m!266583))

(assert (=> b!250113 m!266583))

(assert (=> b!250113 m!266585))

(assert (=> b!249901 d!60857))

(declare-fun d!60859 () Bool)

(assert (=> d!60859 (= (apply!239 lt!125207 lt!125205) (get!2992 (getValueByKey!297 (toList!1891 lt!125207) lt!125205)))))

(declare-fun bs!8970 () Bool)

(assert (= bs!8970 d!60859))

(declare-fun m!266587 () Bool)

(assert (=> bs!8970 m!266587))

(assert (=> bs!8970 m!266587))

(declare-fun m!266589 () Bool)

(assert (=> bs!8970 m!266589))

(assert (=> b!249901 d!60859))

(declare-fun d!60861 () Bool)

(assert (=> d!60861 (= (apply!239 lt!125201 lt!125210) (get!2992 (getValueByKey!297 (toList!1891 lt!125201) lt!125210)))))

(declare-fun bs!8971 () Bool)

(assert (= bs!8971 d!60861))

(declare-fun m!266591 () Bool)

(assert (=> bs!8971 m!266591))

(assert (=> bs!8971 m!266591))

(declare-fun m!266593 () Bool)

(assert (=> bs!8971 m!266593))

(assert (=> b!249901 d!60861))

(declare-fun d!60863 () Bool)

(declare-fun e!162213 () Bool)

(assert (=> d!60863 e!162213))

(declare-fun res!122506 () Bool)

(assert (=> d!60863 (=> (not res!122506) (not e!162213))))

(declare-fun lt!125315 () ListLongMap!3751)

(assert (=> d!60863 (= res!122506 (contains!1810 lt!125315 (_1!2430 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504)))))))

(declare-fun lt!125313 () List!3719)

(assert (=> d!60863 (= lt!125315 (ListLongMap!3752 lt!125313))))

(declare-fun lt!125312 () Unit!7734)

(declare-fun lt!125314 () Unit!7734)

(assert (=> d!60863 (= lt!125312 lt!125314)))

(assert (=> d!60863 (= (getValueByKey!297 lt!125313 (_1!2430 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504)))) (Some!302 (_2!2430 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504)))))))

(assert (=> d!60863 (= lt!125314 (lemmaContainsTupThenGetReturnValue!158 lt!125313 (_1!2430 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504))) (_2!2430 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504)))))))

(assert (=> d!60863 (= lt!125313 (insertStrictlySorted!161 (toList!1891 lt!125215) (_1!2430 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504))) (_2!2430 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504)))))))

(assert (=> d!60863 (= (+!666 lt!125215 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504))) lt!125315)))

(declare-fun b!250114 () Bool)

(declare-fun res!122507 () Bool)

(assert (=> b!250114 (=> (not res!122507) (not e!162213))))

(assert (=> b!250114 (= res!122507 (= (getValueByKey!297 (toList!1891 lt!125315) (_1!2430 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504)))) (Some!302 (_2!2430 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504))))))))

(declare-fun b!250115 () Bool)

(assert (=> b!250115 (= e!162213 (contains!1812 (toList!1891 lt!125315) (tuple2!4839 lt!125217 (minValue!4458 thiss!1504))))))

(assert (= (and d!60863 res!122506) b!250114))

(assert (= (and b!250114 res!122507) b!250115))

(declare-fun m!266595 () Bool)

(assert (=> d!60863 m!266595))

(declare-fun m!266597 () Bool)

(assert (=> d!60863 m!266597))

(declare-fun m!266599 () Bool)

(assert (=> d!60863 m!266599))

(declare-fun m!266601 () Bool)

(assert (=> d!60863 m!266601))

(declare-fun m!266603 () Bool)

(assert (=> b!250114 m!266603))

(declare-fun m!266605 () Bool)

(assert (=> b!250115 m!266605))

(assert (=> b!249901 d!60863))

(declare-fun d!60865 () Bool)

(assert (=> d!60865 (= (apply!239 (+!666 lt!125201 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504))) lt!125210) (get!2992 (getValueByKey!297 (toList!1891 (+!666 lt!125201 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504)))) lt!125210)))))

(declare-fun bs!8972 () Bool)

(assert (= bs!8972 d!60865))

(declare-fun m!266607 () Bool)

(assert (=> bs!8972 m!266607))

(assert (=> bs!8972 m!266607))

(declare-fun m!266609 () Bool)

(assert (=> bs!8972 m!266609))

(assert (=> b!249901 d!60865))

(declare-fun d!60867 () Bool)

(assert (=> d!60867 (= (apply!239 (+!666 lt!125207 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504))) lt!125205) (get!2992 (getValueByKey!297 (toList!1891 (+!666 lt!125207 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504)))) lt!125205)))))

(declare-fun bs!8973 () Bool)

(assert (= bs!8973 d!60867))

(declare-fun m!266611 () Bool)

(assert (=> bs!8973 m!266611))

(assert (=> bs!8973 m!266611))

(declare-fun m!266613 () Bool)

(assert (=> bs!8973 m!266613))

(assert (=> b!249901 d!60867))

(declare-fun d!60869 () Bool)

(assert (=> d!60869 (= (apply!239 (+!666 lt!125207 (tuple2!4839 lt!125208 (minValue!4458 thiss!1504))) lt!125205) (apply!239 lt!125207 lt!125205))))

(declare-fun lt!125316 () Unit!7734)

(assert (=> d!60869 (= lt!125316 (choose!1184 lt!125207 lt!125208 (minValue!4458 thiss!1504) lt!125205))))

(declare-fun e!162214 () Bool)

(assert (=> d!60869 e!162214))

(declare-fun res!122508 () Bool)

(assert (=> d!60869 (=> (not res!122508) (not e!162214))))

(assert (=> d!60869 (= res!122508 (contains!1810 lt!125207 lt!125205))))

(assert (=> d!60869 (= (addApplyDifferent!215 lt!125207 lt!125208 (minValue!4458 thiss!1504) lt!125205) lt!125316)))

(declare-fun b!250116 () Bool)

(assert (=> b!250116 (= e!162214 (not (= lt!125205 lt!125208)))))

(assert (= (and d!60869 res!122508) b!250116))

(assert (=> d!60869 m!266379))

(declare-fun m!266615 () Bool)

(assert (=> d!60869 m!266615))

(assert (=> d!60869 m!266379))

(assert (=> d!60869 m!266381))

(assert (=> d!60869 m!266383))

(declare-fun m!266617 () Bool)

(assert (=> d!60869 m!266617))

(assert (=> b!249901 d!60869))

(declare-fun d!60871 () Bool)

(assert (=> d!60871 (= (apply!239 (+!666 lt!125215 (tuple2!4839 lt!125217 (minValue!4458 thiss!1504))) lt!125219) (apply!239 lt!125215 lt!125219))))

(declare-fun lt!125317 () Unit!7734)

(assert (=> d!60871 (= lt!125317 (choose!1184 lt!125215 lt!125217 (minValue!4458 thiss!1504) lt!125219))))

(declare-fun e!162215 () Bool)

(assert (=> d!60871 e!162215))

(declare-fun res!122509 () Bool)

(assert (=> d!60871 (=> (not res!122509) (not e!162215))))

(assert (=> d!60871 (= res!122509 (contains!1810 lt!125215 lt!125219))))

(assert (=> d!60871 (= (addApplyDifferent!215 lt!125215 lt!125217 (minValue!4458 thiss!1504) lt!125219) lt!125317)))

(declare-fun b!250117 () Bool)

(assert (=> b!250117 (= e!162215 (not (= lt!125219 lt!125217)))))

(assert (= (and d!60871 res!122509) b!250117))

(assert (=> d!60871 m!266373))

(declare-fun m!266619 () Bool)

(assert (=> d!60871 m!266619))

(assert (=> d!60871 m!266373))

(assert (=> d!60871 m!266375))

(assert (=> d!60871 m!266387))

(declare-fun m!266621 () Bool)

(assert (=> d!60871 m!266621))

(assert (=> b!249901 d!60871))

(declare-fun d!60873 () Bool)

(assert (=> d!60873 (= (apply!239 lt!125215 lt!125219) (get!2992 (getValueByKey!297 (toList!1891 lt!125215) lt!125219)))))

(declare-fun bs!8974 () Bool)

(assert (= bs!8974 d!60873))

(declare-fun m!266623 () Bool)

(assert (=> bs!8974 m!266623))

(assert (=> bs!8974 m!266623))

(declare-fun m!266625 () Bool)

(assert (=> bs!8974 m!266625))

(assert (=> b!249901 d!60873))

(declare-fun d!60875 () Bool)

(declare-fun e!162216 () Bool)

(assert (=> d!60875 e!162216))

(declare-fun res!122510 () Bool)

(assert (=> d!60875 (=> (not res!122510) (not e!162216))))

(declare-fun lt!125321 () ListLongMap!3751)

(assert (=> d!60875 (= res!122510 (contains!1810 lt!125321 (_1!2430 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504)))))))

(declare-fun lt!125319 () List!3719)

(assert (=> d!60875 (= lt!125321 (ListLongMap!3752 lt!125319))))

(declare-fun lt!125318 () Unit!7734)

(declare-fun lt!125320 () Unit!7734)

(assert (=> d!60875 (= lt!125318 lt!125320)))

(assert (=> d!60875 (= (getValueByKey!297 lt!125319 (_1!2430 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504)))) (Some!302 (_2!2430 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504)))))))

(assert (=> d!60875 (= lt!125320 (lemmaContainsTupThenGetReturnValue!158 lt!125319 (_1!2430 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504))) (_2!2430 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504)))))))

(assert (=> d!60875 (= lt!125319 (insertStrictlySorted!161 (toList!1891 lt!125201) (_1!2430 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504))) (_2!2430 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504)))))))

(assert (=> d!60875 (= (+!666 lt!125201 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504))) lt!125321)))

(declare-fun b!250118 () Bool)

(declare-fun res!122511 () Bool)

(assert (=> b!250118 (=> (not res!122511) (not e!162216))))

(assert (=> b!250118 (= res!122511 (= (getValueByKey!297 (toList!1891 lt!125321) (_1!2430 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504)))) (Some!302 (_2!2430 (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504))))))))

(declare-fun b!250119 () Bool)

(assert (=> b!250119 (= e!162216 (contains!1812 (toList!1891 lt!125321) (tuple2!4839 lt!125211 (zeroValue!4458 thiss!1504))))))

(assert (= (and d!60875 res!122510) b!250118))

(assert (= (and b!250118 res!122511) b!250119))

(declare-fun m!266627 () Bool)

(assert (=> d!60875 m!266627))

(declare-fun m!266629 () Bool)

(assert (=> d!60875 m!266629))

(declare-fun m!266631 () Bool)

(assert (=> d!60875 m!266631))

(declare-fun m!266633 () Bool)

(assert (=> d!60875 m!266633))

(declare-fun m!266635 () Bool)

(assert (=> b!250118 m!266635))

(declare-fun m!266637 () Bool)

(assert (=> b!250119 m!266637))

(assert (=> b!249901 d!60875))

(declare-fun b!250144 () Bool)

(declare-fun res!122520 () Bool)

(declare-fun e!162231 () Bool)

(assert (=> b!250144 (=> (not res!122520) (not e!162231))))

(declare-fun lt!125337 () ListLongMap!3751)

(assert (=> b!250144 (= res!122520 (not (contains!1810 lt!125337 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!60877 () Bool)

(assert (=> d!60877 e!162231))

(declare-fun res!122522 () Bool)

(assert (=> d!60877 (=> (not res!122522) (not e!162231))))

(assert (=> d!60877 (= res!122522 (not (contains!1810 lt!125337 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!162236 () ListLongMap!3751)

(assert (=> d!60877 (= lt!125337 e!162236)))

(declare-fun c!42014 () Bool)

(assert (=> d!60877 (= c!42014 (bvsge #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60877 (validMask!0 (mask!10789 thiss!1504))))

(assert (=> d!60877 (= (getCurrentListMapNoExtraKeys!561 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)) lt!125337)))

(declare-fun b!250145 () Bool)

(declare-fun e!162232 () ListLongMap!3751)

(assert (=> b!250145 (= e!162236 e!162232)))

(declare-fun c!42015 () Bool)

(assert (=> b!250145 (= c!42015 (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!250146 () Bool)

(declare-fun e!162235 () Bool)

(assert (=> b!250146 (= e!162235 (= lt!125337 (getCurrentListMapNoExtraKeys!561 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4617 thiss!1504))))))

(declare-fun bm!23499 () Bool)

(declare-fun call!23502 () ListLongMap!3751)

(assert (=> bm!23499 (= call!23502 (getCurrentListMapNoExtraKeys!561 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4617 thiss!1504)))))

(declare-fun b!250147 () Bool)

(assert (=> b!250147 (= e!162236 (ListLongMap!3752 Nil!3716))))

(declare-fun b!250148 () Bool)

(declare-fun lt!125336 () Unit!7734)

(declare-fun lt!125342 () Unit!7734)

(assert (=> b!250148 (= lt!125336 lt!125342)))

(declare-fun lt!125339 () (_ BitVec 64))

(declare-fun lt!125340 () ListLongMap!3751)

(declare-fun lt!125338 () (_ BitVec 64))

(declare-fun lt!125341 () V!8291)

(assert (=> b!250148 (not (contains!1810 (+!666 lt!125340 (tuple2!4839 lt!125339 lt!125341)) lt!125338))))

(declare-fun addStillNotContains!122 (ListLongMap!3751 (_ BitVec 64) V!8291 (_ BitVec 64)) Unit!7734)

(assert (=> b!250148 (= lt!125342 (addStillNotContains!122 lt!125340 lt!125339 lt!125341 lt!125338))))

(assert (=> b!250148 (= lt!125338 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!250148 (= lt!125341 (get!2991 (select (arr!5824 (_values!4600 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4617 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250148 (= lt!125339 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!250148 (= lt!125340 call!23502)))

(assert (=> b!250148 (= e!162232 (+!666 call!23502 (tuple2!4839 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000) (get!2991 (select (arr!5824 (_values!4600 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4617 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!250149 () Bool)

(declare-fun e!162237 () Bool)

(assert (=> b!250149 (= e!162231 e!162237)))

(declare-fun c!42017 () Bool)

(declare-fun e!162234 () Bool)

(assert (=> b!250149 (= c!42017 e!162234)))

(declare-fun res!122523 () Bool)

(assert (=> b!250149 (=> (not res!122523) (not e!162234))))

(assert (=> b!250149 (= res!122523 (bvslt #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!250150 () Bool)

(declare-fun isEmpty!527 (ListLongMap!3751) Bool)

(assert (=> b!250150 (= e!162235 (isEmpty!527 lt!125337))))

(declare-fun b!250151 () Bool)

(assert (=> b!250151 (= e!162237 e!162235)))

(declare-fun c!42016 () Bool)

(assert (=> b!250151 (= c!42016 (bvslt #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!250152 () Bool)

(assert (=> b!250152 (= e!162234 (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250152 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!250153 () Bool)

(assert (=> b!250153 (= e!162232 call!23502)))

(declare-fun b!250154 () Bool)

(declare-fun e!162233 () Bool)

(assert (=> b!250154 (= e!162237 e!162233)))

(assert (=> b!250154 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun res!122521 () Bool)

(assert (=> b!250154 (= res!122521 (contains!1810 lt!125337 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!250154 (=> (not res!122521) (not e!162233))))

(declare-fun b!250155 () Bool)

(assert (=> b!250155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> b!250155 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6168 (_values!4600 thiss!1504))))))

(assert (=> b!250155 (= e!162233 (= (apply!239 lt!125337 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)) (get!2991 (select (arr!5824 (_values!4600 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4617 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!60877 c!42014) b!250147))

(assert (= (and d!60877 (not c!42014)) b!250145))

(assert (= (and b!250145 c!42015) b!250148))

(assert (= (and b!250145 (not c!42015)) b!250153))

(assert (= (or b!250148 b!250153) bm!23499))

(assert (= (and d!60877 res!122522) b!250144))

(assert (= (and b!250144 res!122520) b!250149))

(assert (= (and b!250149 res!122523) b!250152))

(assert (= (and b!250149 c!42017) b!250154))

(assert (= (and b!250149 (not c!42017)) b!250151))

(assert (= (and b!250154 res!122521) b!250155))

(assert (= (and b!250151 c!42016) b!250146))

(assert (= (and b!250151 (not c!42016)) b!250150))

(declare-fun b_lambda!8079 () Bool)

(assert (=> (not b_lambda!8079) (not b!250148)))

(assert (=> b!250148 t!8753))

(declare-fun b_and!13641 () Bool)

(assert (= b_and!13639 (and (=> t!8753 result!5295) b_and!13641)))

(declare-fun b_lambda!8081 () Bool)

(assert (=> (not b_lambda!8081) (not b!250155)))

(assert (=> b!250155 t!8753))

(declare-fun b_and!13643 () Bool)

(assert (= b_and!13641 (and (=> t!8753 result!5295) b_and!13643)))

(declare-fun m!266639 () Bool)

(assert (=> b!250146 m!266639))

(assert (=> bm!23499 m!266639))

(assert (=> b!250152 m!266391))

(assert (=> b!250152 m!266391))

(assert (=> b!250152 m!266409))

(declare-fun m!266641 () Bool)

(assert (=> b!250150 m!266641))

(assert (=> b!250145 m!266391))

(assert (=> b!250145 m!266391))

(assert (=> b!250145 m!266409))

(declare-fun m!266643 () Bool)

(assert (=> b!250144 m!266643))

(assert (=> b!250148 m!266395))

(assert (=> b!250148 m!266393))

(declare-fun m!266645 () Bool)

(assert (=> b!250148 m!266645))

(declare-fun m!266647 () Bool)

(assert (=> b!250148 m!266647))

(assert (=> b!250148 m!266645))

(assert (=> b!250148 m!266393))

(assert (=> b!250148 m!266395))

(assert (=> b!250148 m!266397))

(assert (=> b!250148 m!266391))

(declare-fun m!266649 () Bool)

(assert (=> b!250148 m!266649))

(declare-fun m!266651 () Bool)

(assert (=> b!250148 m!266651))

(declare-fun m!266653 () Bool)

(assert (=> d!60877 m!266653))

(assert (=> d!60877 m!266271))

(assert (=> b!250155 m!266395))

(assert (=> b!250155 m!266393))

(assert (=> b!250155 m!266391))

(assert (=> b!250155 m!266391))

(declare-fun m!266655 () Bool)

(assert (=> b!250155 m!266655))

(assert (=> b!250155 m!266393))

(assert (=> b!250155 m!266395))

(assert (=> b!250155 m!266397))

(assert (=> b!250154 m!266391))

(assert (=> b!250154 m!266391))

(declare-fun m!266657 () Bool)

(assert (=> b!250154 m!266657))

(assert (=> b!249901 d!60877))

(declare-fun d!60879 () Bool)

(assert (=> d!60879 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249970 d!60879))

(assert (=> b!249898 d!60831))

(assert (=> b!250011 d!60811))

(assert (=> bm!23473 d!60877))

(assert (=> d!60773 d!60781))

(declare-fun d!60881 () Bool)

(declare-fun e!162240 () Bool)

(assert (=> d!60881 e!162240))

(declare-fun res!122529 () Bool)

(assert (=> d!60881 (=> (not res!122529) (not e!162240))))

(declare-fun lt!125345 () SeekEntryResult!1119)

(assert (=> d!60881 (= res!122529 ((_ is Found!1119) lt!125345))))

(assert (=> d!60881 (= lt!125345 (seekEntryOrOpen!0 key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(assert (=> d!60881 true))

(declare-fun _$33!165 () Unit!7734)

(assert (=> d!60881 (= (choose!1179 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 (defaultEntry!4617 thiss!1504)) _$33!165)))

(declare-fun b!250160 () Bool)

(declare-fun res!122528 () Bool)

(assert (=> b!250160 (=> (not res!122528) (not e!162240))))

(assert (=> b!250160 (= res!122528 (inRange!0 (index!6647 lt!125345) (mask!10789 thiss!1504)))))

(declare-fun b!250161 () Bool)

(assert (=> b!250161 (= e!162240 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6647 lt!125345)) key!932))))

(assert (= (and d!60881 res!122529) b!250160))

(assert (= (and b!250160 res!122528) b!250161))

(assert (=> d!60881 m!266265))

(declare-fun m!266659 () Bool)

(assert (=> b!250160 m!266659))

(declare-fun m!266661 () Bool)

(assert (=> b!250161 m!266661))

(assert (=> d!60773 d!60881))

(assert (=> d!60773 d!60803))

(assert (=> b!249847 d!60815))

(assert (=> b!249847 d!60817))

(declare-fun d!60883 () Bool)

(assert (=> d!60883 (= (inRange!0 (ite c!41966 (index!6646 lt!125235) (index!6649 lt!125235)) (mask!10789 thiss!1504)) (and (bvsge (ite c!41966 (index!6646 lt!125235) (index!6649 lt!125235)) #b00000000000000000000000000000000) (bvslt (ite c!41966 (index!6646 lt!125235) (index!6649 lt!125235)) (bvadd (mask!10789 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23481 d!60883))

(assert (=> d!60793 d!60777))

(assert (=> d!60793 d!60779))

(declare-fun d!60885 () Bool)

(assert (=> d!60885 (contains!1810 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)) key!932)))

(assert (=> d!60885 true))

(declare-fun _$17!74 () Unit!7734)

(assert (=> d!60885 (= (choose!1181 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)) _$17!74)))

(declare-fun bs!8975 () Bool)

(assert (= bs!8975 d!60885))

(assert (=> bs!8975 m!266259))

(assert (=> bs!8975 m!266259))

(assert (=> bs!8975 m!266261))

(assert (=> d!60793 d!60885))

(assert (=> d!60793 d!60803))

(declare-fun d!60887 () Bool)

(assert (=> d!60887 (= (apply!239 lt!125200 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)) (get!2992 (getValueByKey!297 (toList!1891 lt!125200) (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8976 () Bool)

(assert (= bs!8976 d!60887))

(assert (=> bs!8976 m!266391))

(assert (=> bs!8976 m!266515))

(assert (=> bs!8976 m!266515))

(declare-fun m!266663 () Bool)

(assert (=> bs!8976 m!266663))

(assert (=> b!249909 d!60887))

(declare-fun d!60889 () Bool)

(declare-fun c!42020 () Bool)

(assert (=> d!60889 (= c!42020 ((_ is ValueCellFull!2898) (select (arr!5824 (_values!4600 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!162243 () V!8291)

(assert (=> d!60889 (= (get!2991 (select (arr!5824 (_values!4600 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4617 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!162243)))

(declare-fun b!250166 () Bool)

(declare-fun get!2993 (ValueCell!2898 V!8291) V!8291)

(assert (=> b!250166 (= e!162243 (get!2993 (select (arr!5824 (_values!4600 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4617 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!250167 () Bool)

(declare-fun get!2994 (ValueCell!2898 V!8291) V!8291)

(assert (=> b!250167 (= e!162243 (get!2994 (select (arr!5824 (_values!4600 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!582 (defaultEntry!4617 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60889 c!42020) b!250166))

(assert (= (and d!60889 (not c!42020)) b!250167))

(assert (=> b!250166 m!266393))

(assert (=> b!250166 m!266395))

(declare-fun m!266665 () Bool)

(assert (=> b!250166 m!266665))

(assert (=> b!250167 m!266393))

(assert (=> b!250167 m!266395))

(declare-fun m!266667 () Bool)

(assert (=> b!250167 m!266667))

(assert (=> b!249909 d!60889))

(declare-fun d!60891 () Bool)

(declare-fun e!162244 () Bool)

(assert (=> d!60891 e!162244))

(declare-fun res!122530 () Bool)

(assert (=> d!60891 (=> (not res!122530) (not e!162244))))

(declare-fun lt!125349 () ListLongMap!3751)

(assert (=> d!60891 (= res!122530 (contains!1810 lt!125349 (_1!2430 (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))))))))

(declare-fun lt!125347 () List!3719)

(assert (=> d!60891 (= lt!125349 (ListLongMap!3752 lt!125347))))

(declare-fun lt!125346 () Unit!7734)

(declare-fun lt!125348 () Unit!7734)

(assert (=> d!60891 (= lt!125346 lt!125348)))

(assert (=> d!60891 (= (getValueByKey!297 lt!125347 (_1!2430 (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))))) (Some!302 (_2!2430 (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))))))))

(assert (=> d!60891 (= lt!125348 (lemmaContainsTupThenGetReturnValue!158 lt!125347 (_1!2430 (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))) (_2!2430 (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))))))))

(assert (=> d!60891 (= lt!125347 (insertStrictlySorted!161 (toList!1891 (ite c!41952 call!23474 (ite c!41947 call!23479 call!23473))) (_1!2430 (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))) (_2!2430 (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))))))))

(assert (=> d!60891 (= (+!666 (ite c!41952 call!23474 (ite c!41947 call!23479 call!23473)) (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))) lt!125349)))

(declare-fun b!250168 () Bool)

(declare-fun res!122531 () Bool)

(assert (=> b!250168 (=> (not res!122531) (not e!162244))))

(assert (=> b!250168 (= res!122531 (= (getValueByKey!297 (toList!1891 lt!125349) (_1!2430 (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))))) (Some!302 (_2!2430 (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))))))))

(declare-fun b!250169 () Bool)

(assert (=> b!250169 (= e!162244 (contains!1812 (toList!1891 lt!125349) (ite (or c!41952 c!41947) (tuple2!4839 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4458 thiss!1504)) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))))))

(assert (= (and d!60891 res!122530) b!250168))

(assert (= (and b!250168 res!122531) b!250169))

(declare-fun m!266669 () Bool)

(assert (=> d!60891 m!266669))

(declare-fun m!266671 () Bool)

(assert (=> d!60891 m!266671))

(declare-fun m!266673 () Bool)

(assert (=> d!60891 m!266673))

(declare-fun m!266675 () Bool)

(assert (=> d!60891 m!266675))

(declare-fun m!266677 () Bool)

(assert (=> b!250168 m!266677))

(declare-fun m!266679 () Bool)

(assert (=> b!250169 m!266679))

(assert (=> bm!23472 d!60891))

(declare-fun d!60893 () Bool)

(declare-fun e!162245 () Bool)

(assert (=> d!60893 e!162245))

(declare-fun res!122532 () Bool)

(assert (=> d!60893 (=> res!122532 e!162245)))

(declare-fun lt!125350 () Bool)

(assert (=> d!60893 (= res!122532 (not lt!125350))))

(declare-fun lt!125352 () Bool)

(assert (=> d!60893 (= lt!125350 lt!125352)))

(declare-fun lt!125353 () Unit!7734)

(declare-fun e!162246 () Unit!7734)

(assert (=> d!60893 (= lt!125353 e!162246)))

(declare-fun c!42021 () Bool)

(assert (=> d!60893 (= c!42021 lt!125352)))

(assert (=> d!60893 (= lt!125352 (containsKey!289 (toList!1891 lt!125200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!60893 (= (contains!1810 lt!125200 #b1000000000000000000000000000000000000000000000000000000000000000) lt!125350)))

(declare-fun b!250170 () Bool)

(declare-fun lt!125351 () Unit!7734)

(assert (=> b!250170 (= e!162246 lt!125351)))

(assert (=> b!250170 (= lt!125351 (lemmaContainsKeyImpliesGetValueByKeyDefined!237 (toList!1891 lt!125200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250170 (isDefined!238 (getValueByKey!297 (toList!1891 lt!125200) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!250171 () Bool)

(declare-fun Unit!7744 () Unit!7734)

(assert (=> b!250171 (= e!162246 Unit!7744)))

(declare-fun b!250172 () Bool)

(assert (=> b!250172 (= e!162245 (isDefined!238 (getValueByKey!297 (toList!1891 lt!125200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!60893 c!42021) b!250170))

(assert (= (and d!60893 (not c!42021)) b!250171))

(assert (= (and d!60893 (not res!122532)) b!250172))

(declare-fun m!266681 () Bool)

(assert (=> d!60893 m!266681))

(declare-fun m!266683 () Bool)

(assert (=> b!250170 m!266683))

(declare-fun m!266685 () Bool)

(assert (=> b!250170 m!266685))

(assert (=> b!250170 m!266685))

(declare-fun m!266687 () Bool)

(assert (=> b!250170 m!266687))

(assert (=> b!250172 m!266685))

(assert (=> b!250172 m!266685))

(assert (=> b!250172 m!266687))

(assert (=> bm!23470 d!60893))

(declare-fun d!60895 () Bool)

(assert (=> d!60895 (= (arrayCountValidKeys!0 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6749 thiss!1504) #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) #b00000000000000000000000000000001))))

(assert (=> d!60895 true))

(declare-fun _$84!27 () Unit!7734)

(assert (=> d!60895 (= (choose!1 (_keys!6749 thiss!1504) index!297 key!932) _$84!27)))

(declare-fun bs!8977 () Bool)

(assert (= bs!8977 d!60895))

(assert (=> bs!8977 m!266281))

(assert (=> bs!8977 m!266451))

(assert (=> bs!8977 m!266283))

(assert (=> d!60795 d!60895))

(declare-fun d!60897 () Bool)

(declare-fun res!122533 () Bool)

(declare-fun e!162249 () Bool)

(assert (=> d!60897 (=> res!122533 e!162249)))

(assert (=> d!60897 (= res!122533 (bvsge #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60897 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)) e!162249)))

(declare-fun b!250173 () Bool)

(declare-fun e!162247 () Bool)

(declare-fun e!162248 () Bool)

(assert (=> b!250173 (= e!162247 e!162248)))

(declare-fun lt!125356 () (_ BitVec 64))

(assert (=> b!250173 (= lt!125356 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!125354 () Unit!7734)

(assert (=> b!250173 (= lt!125354 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6749 thiss!1504) lt!125356 #b00000000000000000000000000000000))))

(assert (=> b!250173 (arrayContainsKey!0 (_keys!6749 thiss!1504) lt!125356 #b00000000000000000000000000000000)))

(declare-fun lt!125355 () Unit!7734)

(assert (=> b!250173 (= lt!125355 lt!125354)))

(declare-fun res!122534 () Bool)

(assert (=> b!250173 (= res!122534 (= (seekEntryOrOpen!0 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000) (_keys!6749 thiss!1504) (mask!10789 thiss!1504)) (Found!1119 #b00000000000000000000000000000000)))))

(assert (=> b!250173 (=> (not res!122534) (not e!162248))))

(declare-fun b!250174 () Bool)

(declare-fun call!23503 () Bool)

(assert (=> b!250174 (= e!162248 call!23503)))

(declare-fun b!250175 () Bool)

(assert (=> b!250175 (= e!162247 call!23503)))

(declare-fun b!250176 () Bool)

(assert (=> b!250176 (= e!162249 e!162247)))

(declare-fun c!42022 () Bool)

(assert (=> b!250176 (= c!42022 (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!23500 () Bool)

(assert (=> bm!23500 (= call!23503 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(assert (= (and d!60897 (not res!122533)) b!250176))

(assert (= (and b!250176 c!42022) b!250173))

(assert (= (and b!250176 (not c!42022)) b!250175))

(assert (= (and b!250173 res!122534) b!250174))

(assert (= (or b!250174 b!250175) bm!23500))

(assert (=> b!250173 m!266391))

(declare-fun m!266689 () Bool)

(assert (=> b!250173 m!266689))

(declare-fun m!266691 () Bool)

(assert (=> b!250173 m!266691))

(assert (=> b!250173 m!266391))

(declare-fun m!266693 () Bool)

(assert (=> b!250173 m!266693))

(assert (=> b!250176 m!266391))

(assert (=> b!250176 m!266391))

(assert (=> b!250176 m!266409))

(declare-fun m!266695 () Bool)

(assert (=> bm!23500 m!266695))

(assert (=> b!249831 d!60897))

(declare-fun d!60899 () Bool)

(declare-fun e!162250 () Bool)

(assert (=> d!60899 e!162250))

(declare-fun res!122535 () Bool)

(assert (=> d!60899 (=> (not res!122535) (not e!162250))))

(declare-fun lt!125360 () ListLongMap!3751)

(assert (=> d!60899 (= res!122535 (contains!1810 lt!125360 (_1!2430 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))))))

(declare-fun lt!125358 () List!3719)

(assert (=> d!60899 (= lt!125360 (ListLongMap!3752 lt!125358))))

(declare-fun lt!125357 () Unit!7734)

(declare-fun lt!125359 () Unit!7734)

(assert (=> d!60899 (= lt!125357 lt!125359)))

(assert (=> d!60899 (= (getValueByKey!297 lt!125358 (_1!2430 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))) (Some!302 (_2!2430 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))))))

(assert (=> d!60899 (= lt!125359 (lemmaContainsTupThenGetReturnValue!158 lt!125358 (_1!2430 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))) (_2!2430 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))))))

(assert (=> d!60899 (= lt!125358 (insertStrictlySorted!161 (toList!1891 call!23475) (_1!2430 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))) (_2!2430 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))))))

(assert (=> d!60899 (= (+!666 call!23475 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))) lt!125360)))

(declare-fun b!250177 () Bool)

(declare-fun res!122536 () Bool)

(assert (=> b!250177 (=> (not res!122536) (not e!162250))))

(assert (=> b!250177 (= res!122536 (= (getValueByKey!297 (toList!1891 lt!125360) (_1!2430 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504)))) (Some!302 (_2!2430 (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))))))))

(declare-fun b!250178 () Bool)

(assert (=> b!250178 (= e!162250 (contains!1812 (toList!1891 lt!125360) (tuple2!4839 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4458 thiss!1504))))))

(assert (= (and d!60899 res!122535) b!250177))

(assert (= (and b!250177 res!122536) b!250178))

(declare-fun m!266697 () Bool)

(assert (=> d!60899 m!266697))

(declare-fun m!266699 () Bool)

(assert (=> d!60899 m!266699))

(declare-fun m!266701 () Bool)

(assert (=> d!60899 m!266701))

(declare-fun m!266703 () Bool)

(assert (=> d!60899 m!266703))

(declare-fun m!266705 () Bool)

(assert (=> b!250177 m!266705))

(declare-fun m!266707 () Bool)

(assert (=> b!250178 m!266707))

(assert (=> b!249907 d!60899))

(declare-fun d!60901 () Bool)

(declare-fun res!122537 () Bool)

(declare-fun e!162253 () Bool)

(assert (=> d!60901 (=> res!122537 e!162253)))

(assert (=> d!60901 (= res!122537 (bvsge #b00000000000000000000000000000000 (size!6169 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))))))))

(assert (=> d!60901 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) (mask!10789 thiss!1504)) e!162253)))

(declare-fun b!250179 () Bool)

(declare-fun e!162251 () Bool)

(declare-fun e!162252 () Bool)

(assert (=> b!250179 (= e!162251 e!162252)))

(declare-fun lt!125363 () (_ BitVec 64))

(assert (=> b!250179 (= lt!125363 (select (arr!5825 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504)))) #b00000000000000000000000000000000))))

(declare-fun lt!125361 () Unit!7734)

(assert (=> b!250179 (= lt!125361 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) lt!125363 #b00000000000000000000000000000000))))

(assert (=> b!250179 (arrayContainsKey!0 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) lt!125363 #b00000000000000000000000000000000)))

(declare-fun lt!125362 () Unit!7734)

(assert (=> b!250179 (= lt!125362 lt!125361)))

(declare-fun res!122538 () Bool)

(assert (=> b!250179 (= res!122538 (= (seekEntryOrOpen!0 (select (arr!5825 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504)))) #b00000000000000000000000000000000) (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) (mask!10789 thiss!1504)) (Found!1119 #b00000000000000000000000000000000)))))

(assert (=> b!250179 (=> (not res!122538) (not e!162252))))

(declare-fun b!250180 () Bool)

(declare-fun call!23504 () Bool)

(assert (=> b!250180 (= e!162252 call!23504)))

(declare-fun b!250181 () Bool)

(assert (=> b!250181 (= e!162251 call!23504)))

(declare-fun b!250182 () Bool)

(assert (=> b!250182 (= e!162253 e!162251)))

(declare-fun c!42023 () Bool)

(assert (=> b!250182 (= c!42023 (validKeyInArray!0 (select (arr!5825 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun bm!23501 () Bool)

(assert (=> bm!23501 (= call!23504 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) (mask!10789 thiss!1504)))))

(assert (= (and d!60901 (not res!122537)) b!250182))

(assert (= (and b!250182 c!42023) b!250179))

(assert (= (and b!250182 (not c!42023)) b!250181))

(assert (= (and b!250179 res!122538) b!250180))

(assert (= (or b!250180 b!250181) bm!23501))

(assert (=> b!250179 m!266533))

(declare-fun m!266709 () Bool)

(assert (=> b!250179 m!266709))

(declare-fun m!266711 () Bool)

(assert (=> b!250179 m!266711))

(assert (=> b!250179 m!266533))

(declare-fun m!266713 () Bool)

(assert (=> b!250179 m!266713))

(assert (=> b!250182 m!266533))

(assert (=> b!250182 m!266533))

(assert (=> b!250182 m!266535))

(declare-fun m!266715 () Bool)

(assert (=> bm!23501 m!266715))

(assert (=> b!250021 d!60901))

(declare-fun d!60903 () Bool)

(declare-fun res!122547 () Bool)

(declare-fun e!162256 () Bool)

(assert (=> d!60903 (=> (not res!122547) (not e!162256))))

(assert (=> d!60903 (= res!122547 (validMask!0 (mask!10789 thiss!1504)))))

(assert (=> d!60903 (= (simpleValid!262 thiss!1504) e!162256)))

(declare-fun b!250194 () Bool)

(assert (=> b!250194 (= e!162256 (and (bvsge (extraKeys!4354 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4354 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1897 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!250193 () Bool)

(declare-fun res!122548 () Bool)

(assert (=> b!250193 (=> (not res!122548) (not e!162256))))

(declare-fun size!6172 (LongMapFixedSize!3696) (_ BitVec 32))

(assert (=> b!250193 (= res!122548 (= (size!6172 thiss!1504) (bvadd (_size!1897 thiss!1504) (bvsdiv (bvadd (extraKeys!4354 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!250191 () Bool)

(declare-fun res!122550 () Bool)

(assert (=> b!250191 (=> (not res!122550) (not e!162256))))

(assert (=> b!250191 (= res!122550 (and (= (size!6168 (_values!4600 thiss!1504)) (bvadd (mask!10789 thiss!1504) #b00000000000000000000000000000001)) (= (size!6169 (_keys!6749 thiss!1504)) (size!6168 (_values!4600 thiss!1504))) (bvsge (_size!1897 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1897 thiss!1504) (bvadd (mask!10789 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!250192 () Bool)

(declare-fun res!122549 () Bool)

(assert (=> b!250192 (=> (not res!122549) (not e!162256))))

(assert (=> b!250192 (= res!122549 (bvsge (size!6172 thiss!1504) (_size!1897 thiss!1504)))))

(assert (= (and d!60903 res!122547) b!250191))

(assert (= (and b!250191 res!122550) b!250192))

(assert (= (and b!250192 res!122549) b!250193))

(assert (= (and b!250193 res!122548) b!250194))

(assert (=> d!60903 m!266271))

(declare-fun m!266717 () Bool)

(assert (=> b!250193 m!266717))

(assert (=> b!250192 m!266717))

(assert (=> d!60771 d!60903))

(assert (=> d!60779 d!60803))

(assert (=> b!249902 d!60831))

(declare-fun b!250195 () Bool)

(declare-fun e!162258 () (_ BitVec 32))

(declare-fun call!23505 () (_ BitVec 32))

(assert (=> b!250195 (= e!162258 (bvadd #b00000000000000000000000000000001 call!23505))))

(declare-fun b!250196 () Bool)

(declare-fun e!162257 () (_ BitVec 32))

(assert (=> b!250196 (= e!162257 #b00000000000000000000000000000000)))

(declare-fun bm!23502 () Bool)

(assert (=> bm!23502 (= call!23505 (arrayCountValidKeys!0 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 (_keys!6749 thiss!1504))))))

(declare-fun b!250197 () Bool)

(assert (=> b!250197 (= e!162258 call!23505)))

(declare-fun b!250198 () Bool)

(assert (=> b!250198 (= e!162257 e!162258)))

(declare-fun c!42025 () Bool)

(assert (=> b!250198 (= c!42025 (validKeyInArray!0 (select (arr!5825 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun d!60905 () Bool)

(declare-fun lt!125364 () (_ BitVec 32))

(assert (=> d!60905 (and (bvsge lt!125364 #b00000000000000000000000000000000) (bvsle lt!125364 (bvsub (size!6169 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (=> d!60905 (= lt!125364 e!162257)))

(declare-fun c!42024 () Bool)

(assert (=> d!60905 (= c!42024 (bvsge #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))))))

(assert (=> d!60905 (and (bvsle #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6169 (_keys!6749 thiss!1504)) (size!6169 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))))))))

(assert (=> d!60905 (= (arrayCountValidKeys!0 (array!12284 (store (arr!5825 (_keys!6749 thiss!1504)) index!297 key!932) (size!6169 (_keys!6749 thiss!1504))) #b00000000000000000000000000000000 (size!6169 (_keys!6749 thiss!1504))) lt!125364)))

(assert (= (and d!60905 c!42024) b!250196))

(assert (= (and d!60905 (not c!42024)) b!250198))

(assert (= (and b!250198 c!42025) b!250195))

(assert (= (and b!250198 (not c!42025)) b!250197))

(assert (= (or b!250195 b!250197) bm!23502))

(declare-fun m!266719 () Bool)

(assert (=> bm!23502 m!266719))

(assert (=> b!250198 m!266533))

(assert (=> b!250198 m!266533))

(assert (=> b!250198 m!266535))

(assert (=> b!249972 d!60905))

(assert (=> b!249972 d!60801))

(assert (=> d!60791 d!60781))

(declare-fun b!250215 () Bool)

(declare-fun e!162269 () Bool)

(declare-fun e!162270 () Bool)

(assert (=> b!250215 (= e!162269 e!162270)))

(declare-fun res!122559 () Bool)

(declare-fun call!23510 () Bool)

(assert (=> b!250215 (= res!122559 call!23510)))

(assert (=> b!250215 (=> (not res!122559) (not e!162270))))

(declare-fun b!250216 () Bool)

(declare-fun e!162267 () Bool)

(assert (=> b!250216 (= e!162269 e!162267)))

(declare-fun c!42031 () Bool)

(declare-fun lt!125367 () SeekEntryResult!1119)

(assert (=> b!250216 (= c!42031 ((_ is MissingVacant!1119) lt!125367))))

(declare-fun bm!23507 () Bool)

(declare-fun call!23511 () Bool)

(assert (=> bm!23507 (= call!23511 (arrayContainsKey!0 (_keys!6749 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250217 () Bool)

(assert (=> b!250217 (= e!162270 (not call!23511))))

(declare-fun b!250218 () Bool)

(declare-fun res!122560 () Bool)

(assert (=> b!250218 (= res!122560 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6646 lt!125367)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250218 (=> (not res!122560) (not e!162270))))

(declare-fun b!250219 () Bool)

(declare-fun res!122561 () Bool)

(declare-fun e!162268 () Bool)

(assert (=> b!250219 (=> (not res!122561) (not e!162268))))

(assert (=> b!250219 (= res!122561 call!23510)))

(assert (=> b!250219 (= e!162267 e!162268)))

(declare-fun bm!23508 () Bool)

(declare-fun c!42030 () Bool)

(assert (=> bm!23508 (= call!23510 (inRange!0 (ite c!42030 (index!6646 lt!125367) (index!6649 lt!125367)) (mask!10789 thiss!1504)))))

(declare-fun d!60907 () Bool)

(assert (=> d!60907 e!162269))

(assert (=> d!60907 (= c!42030 ((_ is MissingZero!1119) lt!125367))))

(assert (=> d!60907 (= lt!125367 (seekEntryOrOpen!0 key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(assert (=> d!60907 true))

(declare-fun _$34!1110 () Unit!7734)

(assert (=> d!60907 (= (choose!1180 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) key!932 (defaultEntry!4617 thiss!1504)) _$34!1110)))

(declare-fun b!250220 () Bool)

(assert (=> b!250220 (= e!162268 (not call!23511))))

(declare-fun b!250221 () Bool)

(assert (=> b!250221 (= e!162267 ((_ is Undefined!1119) lt!125367))))

(declare-fun b!250222 () Bool)

(declare-fun res!122562 () Bool)

(assert (=> b!250222 (=> (not res!122562) (not e!162268))))

(assert (=> b!250222 (= res!122562 (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6649 lt!125367)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!60907 c!42030) b!250215))

(assert (= (and d!60907 (not c!42030)) b!250216))

(assert (= (and b!250215 res!122559) b!250218))

(assert (= (and b!250218 res!122560) b!250217))

(assert (= (and b!250216 c!42031) b!250219))

(assert (= (and b!250216 (not c!42031)) b!250221))

(assert (= (and b!250219 res!122561) b!250222))

(assert (= (and b!250222 res!122562) b!250220))

(assert (= (or b!250215 b!250219) bm!23508))

(assert (= (or b!250217 b!250220) bm!23507))

(declare-fun m!266721 () Bool)

(assert (=> b!250222 m!266721))

(declare-fun m!266723 () Bool)

(assert (=> bm!23508 m!266723))

(declare-fun m!266725 () Bool)

(assert (=> b!250218 m!266725))

(assert (=> bm!23507 m!266243))

(assert (=> d!60907 m!266265))

(assert (=> d!60791 d!60907))

(assert (=> d!60791 d!60803))

(declare-fun b!250223 () Bool)

(declare-fun e!162273 () Bool)

(declare-fun e!162274 () Bool)

(assert (=> b!250223 (= e!162273 e!162274)))

(declare-fun c!42032 () Bool)

(assert (=> b!250223 (= c!42032 (validKeyInArray!0 (select (arr!5825 lt!125103) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!250224 () Bool)

(declare-fun e!162272 () Bool)

(assert (=> b!250224 (= e!162272 e!162273)))

(declare-fun res!122565 () Bool)

(assert (=> b!250224 (=> (not res!122565) (not e!162273))))

(declare-fun e!162271 () Bool)

(assert (=> b!250224 (= res!122565 (not e!162271))))

(declare-fun res!122564 () Bool)

(assert (=> b!250224 (=> (not res!122564) (not e!162271))))

(assert (=> b!250224 (= res!122564 (validKeyInArray!0 (select (arr!5825 lt!125103) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!60909 () Bool)

(declare-fun res!122563 () Bool)

(assert (=> d!60909 (=> res!122563 e!162272)))

(assert (=> d!60909 (= res!122563 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 lt!125103)))))

(assert (=> d!60909 (= (arrayNoDuplicates!0 lt!125103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!41981 (Cons!3716 (select (arr!5825 lt!125103) #b00000000000000000000000000000000) Nil!3717) Nil!3717)) e!162272)))

(declare-fun b!250225 () Bool)

(declare-fun call!23512 () Bool)

(assert (=> b!250225 (= e!162274 call!23512)))

(declare-fun b!250226 () Bool)

(assert (=> b!250226 (= e!162271 (contains!1811 (ite c!41981 (Cons!3716 (select (arr!5825 lt!125103) #b00000000000000000000000000000000) Nil!3717) Nil!3717) (select (arr!5825 lt!125103) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!250227 () Bool)

(assert (=> b!250227 (= e!162274 call!23512)))

(declare-fun bm!23509 () Bool)

(assert (=> bm!23509 (= call!23512 (arrayNoDuplicates!0 lt!125103 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!42032 (Cons!3716 (select (arr!5825 lt!125103) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!41981 (Cons!3716 (select (arr!5825 lt!125103) #b00000000000000000000000000000000) Nil!3717) Nil!3717)) (ite c!41981 (Cons!3716 (select (arr!5825 lt!125103) #b00000000000000000000000000000000) Nil!3717) Nil!3717))))))

(assert (= (and d!60909 (not res!122563)) b!250224))

(assert (= (and b!250224 res!122564) b!250226))

(assert (= (and b!250224 res!122565) b!250223))

(assert (= (and b!250223 c!42032) b!250225))

(assert (= (and b!250223 (not c!42032)) b!250227))

(assert (= (or b!250225 b!250227) bm!23509))

(assert (=> b!250223 m!266503))

(assert (=> b!250223 m!266503))

(assert (=> b!250223 m!266505))

(assert (=> b!250224 m!266503))

(assert (=> b!250224 m!266503))

(assert (=> b!250224 m!266505))

(assert (=> b!250226 m!266503))

(assert (=> b!250226 m!266503))

(declare-fun m!266727 () Bool)

(assert (=> b!250226 m!266727))

(assert (=> bm!23509 m!266503))

(declare-fun m!266729 () Bool)

(assert (=> bm!23509 m!266729))

(assert (=> bm!23492 d!60909))

(declare-fun d!60911 () Bool)

(assert (=> d!60911 (= (apply!239 lt!125200 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2992 (getValueByKey!297 (toList!1891 lt!125200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8978 () Bool)

(assert (= bs!8978 d!60911))

(assert (=> bs!8978 m!266685))

(assert (=> bs!8978 m!266685))

(declare-fun m!266731 () Bool)

(assert (=> bs!8978 m!266731))

(assert (=> b!249900 d!60911))

(declare-fun d!60913 () Bool)

(assert (=> d!60913 (= (validKeyInArray!0 (select (arr!5825 (_keys!6749 thiss!1504)) index!297)) (and (not (= (select (arr!5825 (_keys!6749 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5825 (_keys!6749 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!249969 d!60913))

(declare-fun d!60915 () Bool)

(declare-fun res!122566 () Bool)

(declare-fun e!162277 () Bool)

(assert (=> d!60915 (=> res!122566 e!162277)))

(assert (=> d!60915 (= res!122566 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 lt!125103)))))

(assert (=> d!60915 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!125103 (mask!10789 thiss!1504)) e!162277)))

(declare-fun b!250228 () Bool)

(declare-fun e!162275 () Bool)

(declare-fun e!162276 () Bool)

(assert (=> b!250228 (= e!162275 e!162276)))

(declare-fun lt!125370 () (_ BitVec 64))

(assert (=> b!250228 (= lt!125370 (select (arr!5825 lt!125103) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!125368 () Unit!7734)

(assert (=> b!250228 (= lt!125368 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125103 lt!125370 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!250228 (arrayContainsKey!0 lt!125103 lt!125370 #b00000000000000000000000000000000)))

(declare-fun lt!125369 () Unit!7734)

(assert (=> b!250228 (= lt!125369 lt!125368)))

(declare-fun res!122567 () Bool)

(assert (=> b!250228 (= res!122567 (= (seekEntryOrOpen!0 (select (arr!5825 lt!125103) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!125103 (mask!10789 thiss!1504)) (Found!1119 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!250228 (=> (not res!122567) (not e!162276))))

(declare-fun b!250229 () Bool)

(declare-fun call!23513 () Bool)

(assert (=> b!250229 (= e!162276 call!23513)))

(declare-fun b!250230 () Bool)

(assert (=> b!250230 (= e!162275 call!23513)))

(declare-fun b!250231 () Bool)

(assert (=> b!250231 (= e!162277 e!162275)))

(declare-fun c!42033 () Bool)

(assert (=> b!250231 (= c!42033 (validKeyInArray!0 (select (arr!5825 lt!125103) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!23510 () Bool)

(assert (=> bm!23510 (= call!23513 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!125103 (mask!10789 thiss!1504)))))

(assert (= (and d!60915 (not res!122566)) b!250231))

(assert (= (and b!250231 c!42033) b!250228))

(assert (= (and b!250231 (not c!42033)) b!250230))

(assert (= (and b!250228 res!122567) b!250229))

(assert (= (or b!250229 b!250230) bm!23510))

(assert (=> b!250228 m!266503))

(declare-fun m!266733 () Bool)

(assert (=> b!250228 m!266733))

(declare-fun m!266735 () Bool)

(assert (=> b!250228 m!266735))

(assert (=> b!250228 m!266503))

(declare-fun m!266737 () Bool)

(assert (=> b!250228 m!266737))

(assert (=> b!250231 m!266503))

(assert (=> b!250231 m!266503))

(assert (=> b!250231 m!266505))

(declare-fun m!266739 () Bool)

(assert (=> bm!23510 m!266739))

(assert (=> bm!23485 d!60915))

(declare-fun d!60917 () Bool)

(declare-fun lt!125373 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!165 (List!3720) (InoxSet (_ BitVec 64)))

(assert (=> d!60917 (= lt!125373 (select (content!165 Nil!3717) (select (arr!5825 lt!125103) #b00000000000000000000000000000000)))))

(declare-fun e!162283 () Bool)

(assert (=> d!60917 (= lt!125373 e!162283)))

(declare-fun res!122573 () Bool)

(assert (=> d!60917 (=> (not res!122573) (not e!162283))))

(assert (=> d!60917 (= res!122573 ((_ is Cons!3716) Nil!3717))))

(assert (=> d!60917 (= (contains!1811 Nil!3717 (select (arr!5825 lt!125103) #b00000000000000000000000000000000)) lt!125373)))

(declare-fun b!250236 () Bool)

(declare-fun e!162282 () Bool)

(assert (=> b!250236 (= e!162283 e!162282)))

(declare-fun res!122572 () Bool)

(assert (=> b!250236 (=> res!122572 e!162282)))

(assert (=> b!250236 (= res!122572 (= (h!4375 Nil!3717) (select (arr!5825 lt!125103) #b00000000000000000000000000000000)))))

(declare-fun b!250237 () Bool)

(assert (=> b!250237 (= e!162282 (contains!1811 (t!8751 Nil!3717) (select (arr!5825 lt!125103) #b00000000000000000000000000000000)))))

(assert (= (and d!60917 res!122573) b!250236))

(assert (= (and b!250236 (not res!122572)) b!250237))

(declare-fun m!266741 () Bool)

(assert (=> d!60917 m!266741))

(assert (=> d!60917 m!266453))

(declare-fun m!266743 () Bool)

(assert (=> d!60917 m!266743))

(assert (=> b!250237 m!266453))

(declare-fun m!266745 () Bool)

(assert (=> b!250237 m!266745))

(assert (=> b!250014 d!60917))

(declare-fun d!60919 () Bool)

(assert (=> d!60919 (arrayContainsKey!0 lt!125103 lt!125250 #b00000000000000000000000000000000)))

(declare-fun lt!125376 () Unit!7734)

(declare-fun choose!13 (array!12283 (_ BitVec 64) (_ BitVec 32)) Unit!7734)

(assert (=> d!60919 (= lt!125376 (choose!13 lt!125103 lt!125250 #b00000000000000000000000000000000))))

(assert (=> d!60919 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!60919 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!125103 lt!125250 #b00000000000000000000000000000000) lt!125376)))

(declare-fun bs!8979 () Bool)

(assert (= bs!8979 d!60919))

(assert (=> bs!8979 m!266457))

(declare-fun m!266747 () Bool)

(assert (=> bs!8979 m!266747))

(assert (=> b!249981 d!60919))

(declare-fun d!60921 () Bool)

(declare-fun res!122574 () Bool)

(declare-fun e!162284 () Bool)

(assert (=> d!60921 (=> res!122574 e!162284)))

(assert (=> d!60921 (= res!122574 (= (select (arr!5825 lt!125103) #b00000000000000000000000000000000) lt!125250))))

(assert (=> d!60921 (= (arrayContainsKey!0 lt!125103 lt!125250 #b00000000000000000000000000000000) e!162284)))

(declare-fun b!250238 () Bool)

(declare-fun e!162285 () Bool)

(assert (=> b!250238 (= e!162284 e!162285)))

(declare-fun res!122575 () Bool)

(assert (=> b!250238 (=> (not res!122575) (not e!162285))))

(assert (=> b!250238 (= res!122575 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6169 lt!125103)))))

(declare-fun b!250239 () Bool)

(assert (=> b!250239 (= e!162285 (arrayContainsKey!0 lt!125103 lt!125250 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60921 (not res!122574)) b!250238))

(assert (= (and b!250238 res!122575) b!250239))

(assert (=> d!60921 m!266453))

(declare-fun m!266749 () Bool)

(assert (=> b!250239 m!266749))

(assert (=> b!249981 d!60921))

(declare-fun b!250241 () Bool)

(declare-fun e!162287 () SeekEntryResult!1119)

(declare-fun lt!125379 () SeekEntryResult!1119)

(assert (=> b!250241 (= e!162287 (MissingZero!1119 (index!6648 lt!125379)))))

(declare-fun b!250242 () Bool)

(declare-fun e!162286 () SeekEntryResult!1119)

(declare-fun e!162288 () SeekEntryResult!1119)

(assert (=> b!250242 (= e!162286 e!162288)))

(declare-fun lt!125377 () (_ BitVec 64))

(assert (=> b!250242 (= lt!125377 (select (arr!5825 lt!125103) (index!6648 lt!125379)))))

(declare-fun c!42034 () Bool)

(assert (=> b!250242 (= c!42034 (= lt!125377 (select (arr!5825 lt!125103) #b00000000000000000000000000000000)))))

(declare-fun b!250243 () Bool)

(declare-fun c!42035 () Bool)

(assert (=> b!250243 (= c!42035 (= lt!125377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250243 (= e!162288 e!162287)))

(declare-fun b!250244 () Bool)

(assert (=> b!250244 (= e!162286 Undefined!1119)))

(declare-fun b!250245 () Bool)

(assert (=> b!250245 (= e!162287 (seekKeyOrZeroReturnVacant!0 (x!24643 lt!125379) (index!6648 lt!125379) (index!6648 lt!125379) (select (arr!5825 lt!125103) #b00000000000000000000000000000000) lt!125103 (mask!10789 thiss!1504)))))

(declare-fun d!60923 () Bool)

(declare-fun lt!125378 () SeekEntryResult!1119)

(assert (=> d!60923 (and (or ((_ is Undefined!1119) lt!125378) (not ((_ is Found!1119) lt!125378)) (and (bvsge (index!6647 lt!125378) #b00000000000000000000000000000000) (bvslt (index!6647 lt!125378) (size!6169 lt!125103)))) (or ((_ is Undefined!1119) lt!125378) ((_ is Found!1119) lt!125378) (not ((_ is MissingZero!1119) lt!125378)) (and (bvsge (index!6646 lt!125378) #b00000000000000000000000000000000) (bvslt (index!6646 lt!125378) (size!6169 lt!125103)))) (or ((_ is Undefined!1119) lt!125378) ((_ is Found!1119) lt!125378) ((_ is MissingZero!1119) lt!125378) (not ((_ is MissingVacant!1119) lt!125378)) (and (bvsge (index!6649 lt!125378) #b00000000000000000000000000000000) (bvslt (index!6649 lt!125378) (size!6169 lt!125103)))) (or ((_ is Undefined!1119) lt!125378) (ite ((_ is Found!1119) lt!125378) (= (select (arr!5825 lt!125103) (index!6647 lt!125378)) (select (arr!5825 lt!125103) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!1119) lt!125378) (= (select (arr!5825 lt!125103) (index!6646 lt!125378)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1119) lt!125378) (= (select (arr!5825 lt!125103) (index!6649 lt!125378)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!60923 (= lt!125378 e!162286)))

(declare-fun c!42036 () Bool)

(assert (=> d!60923 (= c!42036 (and ((_ is Intermediate!1119) lt!125379) (undefined!1931 lt!125379)))))

(assert (=> d!60923 (= lt!125379 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!5825 lt!125103) #b00000000000000000000000000000000) (mask!10789 thiss!1504)) (select (arr!5825 lt!125103) #b00000000000000000000000000000000) lt!125103 (mask!10789 thiss!1504)))))

(assert (=> d!60923 (validMask!0 (mask!10789 thiss!1504))))

(assert (=> d!60923 (= (seekEntryOrOpen!0 (select (arr!5825 lt!125103) #b00000000000000000000000000000000) lt!125103 (mask!10789 thiss!1504)) lt!125378)))

(declare-fun b!250240 () Bool)

(assert (=> b!250240 (= e!162288 (Found!1119 (index!6648 lt!125379)))))

(assert (= (and d!60923 c!42036) b!250244))

(assert (= (and d!60923 (not c!42036)) b!250242))

(assert (= (and b!250242 c!42034) b!250240))

(assert (= (and b!250242 (not c!42034)) b!250243))

(assert (= (and b!250243 c!42035) b!250241))

(assert (= (and b!250243 (not c!42035)) b!250245))

(declare-fun m!266751 () Bool)

(assert (=> b!250242 m!266751))

(assert (=> b!250245 m!266453))

(declare-fun m!266753 () Bool)

(assert (=> b!250245 m!266753))

(assert (=> d!60923 m!266271))

(declare-fun m!266755 () Bool)

(assert (=> d!60923 m!266755))

(assert (=> d!60923 m!266453))

(declare-fun m!266757 () Bool)

(assert (=> d!60923 m!266757))

(assert (=> d!60923 m!266453))

(assert (=> d!60923 m!266755))

(declare-fun m!266759 () Bool)

(assert (=> d!60923 m!266759))

(declare-fun m!266761 () Bool)

(assert (=> d!60923 m!266761))

(declare-fun m!266763 () Bool)

(assert (=> d!60923 m!266763))

(assert (=> b!249981 d!60923))

(declare-fun d!60925 () Bool)

(declare-fun res!122580 () Bool)

(declare-fun e!162293 () Bool)

(assert (=> d!60925 (=> res!122580 e!162293)))

(assert (=> d!60925 (= res!122580 (and ((_ is Cons!3715) (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))) (= (_1!2430 (h!4374 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))))) key!932)))))

(assert (=> d!60925 (= (containsKey!289 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))) key!932) e!162293)))

(declare-fun b!250250 () Bool)

(declare-fun e!162294 () Bool)

(assert (=> b!250250 (= e!162293 e!162294)))

(declare-fun res!122581 () Bool)

(assert (=> b!250250 (=> (not res!122581) (not e!162294))))

(assert (=> b!250250 (= res!122581 (and (or (not ((_ is Cons!3715) (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))))) (bvsle (_1!2430 (h!4374 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))))) key!932)) ((_ is Cons!3715) (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))) (bvslt (_1!2430 (h!4374 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504))))) key!932)))))

(declare-fun b!250251 () Bool)

(assert (=> b!250251 (= e!162294 (containsKey!289 (t!8750 (toList!1891 (getCurrentListMap!1419 (_keys!6749 thiss!1504) (_values!4600 thiss!1504) (mask!10789 thiss!1504) (extraKeys!4354 thiss!1504) (zeroValue!4458 thiss!1504) (minValue!4458 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4617 thiss!1504)))) key!932))))

(assert (= (and d!60925 (not res!122580)) b!250250))

(assert (= (and b!250250 res!122581) b!250251))

(declare-fun m!266765 () Bool)

(assert (=> b!250251 m!266765))

(assert (=> d!60777 d!60925))

(assert (=> b!250012 d!60811))

(assert (=> bm!23482 d!60789))

(declare-fun b!250264 () Bool)

(declare-fun e!162303 () SeekEntryResult!1119)

(assert (=> b!250264 (= e!162303 (Found!1119 (index!6648 lt!125229)))))

(declare-fun d!60927 () Bool)

(declare-fun lt!125385 () SeekEntryResult!1119)

(assert (=> d!60927 (and (or ((_ is Undefined!1119) lt!125385) (not ((_ is Found!1119) lt!125385)) (and (bvsge (index!6647 lt!125385) #b00000000000000000000000000000000) (bvslt (index!6647 lt!125385) (size!6169 (_keys!6749 thiss!1504))))) (or ((_ is Undefined!1119) lt!125385) ((_ is Found!1119) lt!125385) (not ((_ is MissingVacant!1119) lt!125385)) (not (= (index!6649 lt!125385) (index!6648 lt!125229))) (and (bvsge (index!6649 lt!125385) #b00000000000000000000000000000000) (bvslt (index!6649 lt!125385) (size!6169 (_keys!6749 thiss!1504))))) (or ((_ is Undefined!1119) lt!125385) (ite ((_ is Found!1119) lt!125385) (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6647 lt!125385)) key!932) (and ((_ is MissingVacant!1119) lt!125385) (= (index!6649 lt!125385) (index!6648 lt!125229)) (= (select (arr!5825 (_keys!6749 thiss!1504)) (index!6649 lt!125385)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!162302 () SeekEntryResult!1119)

(assert (=> d!60927 (= lt!125385 e!162302)))

(declare-fun c!42045 () Bool)

(assert (=> d!60927 (= c!42045 (bvsge (x!24643 lt!125229) #b01111111111111111111111111111110))))

(declare-fun lt!125384 () (_ BitVec 64))

(assert (=> d!60927 (= lt!125384 (select (arr!5825 (_keys!6749 thiss!1504)) (index!6648 lt!125229)))))

(assert (=> d!60927 (validMask!0 (mask!10789 thiss!1504))))

(assert (=> d!60927 (= (seekKeyOrZeroReturnVacant!0 (x!24643 lt!125229) (index!6648 lt!125229) (index!6648 lt!125229) key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)) lt!125385)))

(declare-fun b!250265 () Bool)

(assert (=> b!250265 (= e!162302 e!162303)))

(declare-fun c!42043 () Bool)

(assert (=> b!250265 (= c!42043 (= lt!125384 key!932))))

(declare-fun b!250266 () Bool)

(assert (=> b!250266 (= e!162302 Undefined!1119)))

(declare-fun b!250267 () Bool)

(declare-fun e!162301 () SeekEntryResult!1119)

(assert (=> b!250267 (= e!162301 (seekKeyOrZeroReturnVacant!0 (bvadd (x!24643 lt!125229) #b00000000000000000000000000000001) (nextIndex!0 (index!6648 lt!125229) (x!24643 lt!125229) (mask!10789 thiss!1504)) (index!6648 lt!125229) key!932 (_keys!6749 thiss!1504) (mask!10789 thiss!1504)))))

(declare-fun b!250268 () Bool)

(declare-fun c!42044 () Bool)

(assert (=> b!250268 (= c!42044 (= lt!125384 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!250268 (= e!162303 e!162301)))

(declare-fun b!250269 () Bool)

(assert (=> b!250269 (= e!162301 (MissingVacant!1119 (index!6648 lt!125229)))))

(assert (= (and d!60927 c!42045) b!250266))

(assert (= (and d!60927 (not c!42045)) b!250265))

(assert (= (and b!250265 c!42043) b!250264))

(assert (= (and b!250265 (not c!42043)) b!250268))

(assert (= (and b!250268 c!42044) b!250269))

(assert (= (and b!250268 (not c!42044)) b!250267))

(declare-fun m!266767 () Bool)

(assert (=> d!60927 m!266767))

(declare-fun m!266769 () Bool)

(assert (=> d!60927 m!266769))

(assert (=> d!60927 m!266417))

(assert (=> d!60927 m!266271))

(declare-fun m!266771 () Bool)

(assert (=> b!250267 m!266771))

(assert (=> b!250267 m!266771))

(declare-fun m!266773 () Bool)

(assert (=> b!250267 m!266773))

(assert (=> b!249930 d!60927))

(declare-fun b!250270 () Bool)

(declare-fun e!162304 () Bool)

(assert (=> b!250270 (= e!162304 tp_is_empty!6483)))

(declare-fun mapNonEmpty!11020 () Bool)

(declare-fun mapRes!11020 () Bool)

(declare-fun tp!23134 () Bool)

(assert (=> mapNonEmpty!11020 (= mapRes!11020 (and tp!23134 e!162304))))

(declare-fun mapKey!11020 () (_ BitVec 32))

(declare-fun mapRest!11020 () (Array (_ BitVec 32) ValueCell!2898))

(declare-fun mapValue!11020 () ValueCell!2898)

(assert (=> mapNonEmpty!11020 (= mapRest!11019 (store mapRest!11020 mapKey!11020 mapValue!11020))))

(declare-fun b!250271 () Bool)

(declare-fun e!162305 () Bool)

(assert (=> b!250271 (= e!162305 tp_is_empty!6483)))

(declare-fun mapIsEmpty!11020 () Bool)

(assert (=> mapIsEmpty!11020 mapRes!11020))

(declare-fun condMapEmpty!11020 () Bool)

(declare-fun mapDefault!11020 () ValueCell!2898)

(assert (=> mapNonEmpty!11019 (= condMapEmpty!11020 (= mapRest!11019 ((as const (Array (_ BitVec 32) ValueCell!2898)) mapDefault!11020)))))

(assert (=> mapNonEmpty!11019 (= tp!23133 (and e!162305 mapRes!11020))))

(assert (= (and mapNonEmpty!11019 condMapEmpty!11020) mapIsEmpty!11020))

(assert (= (and mapNonEmpty!11019 (not condMapEmpty!11020)) mapNonEmpty!11020))

(assert (= (and mapNonEmpty!11020 ((_ is ValueCellFull!2898) mapValue!11020)) b!250270))

(assert (= (and mapNonEmpty!11019 ((_ is ValueCellFull!2898) mapDefault!11020)) b!250271))

(declare-fun m!266775 () Bool)

(assert (=> mapNonEmpty!11020 m!266775))

(declare-fun b_lambda!8083 () Bool)

(assert (= b_lambda!8079 (or (and b!249759 b_free!6621) b_lambda!8083)))

(declare-fun b_lambda!8085 () Bool)

(assert (= b_lambda!8081 (or (and b!249759 b_free!6621) b_lambda!8085)))

(check-sat (not d!60863) (not b!250051) (not b!250055) (not b!250267) (not d!60873) (not d!60919) (not b!250198) (not d!60861) (not d!60867) (not b!250102) (not d!60911) (not b!250052) (not b!250224) (not d!60859) (not b!250169) (not b!250160) (not bm!23501) (not d!60885) (not bm!23500) (not b!250032) (not d!60887) (not b!250047) (not bm!23508) (not d!60927) (not b!250045) (not d!60827) (not d!60847) (not b!250152) (not d!60871) (not d!60839) (not b!250178) (not d!60891) (not b!250155) (not d!60893) (not d!60899) (not b!250094) (not b!250148) (not d!60849) (not d!60815) (not b!250154) (not b!250103) (not b!250173) (not d!60833) (not b!250115) (not d!60813) (not b!250063) (not b!250166) (not bm!23494) (not b!250105) (not b!250179) (not d!60869) (not b!250082) (not b!250145) (not d!60923) (not b!250144) (not d!60907) (not b!250172) (not bm!23510) (not b_lambda!8083) (not b!250106) (not b!250223) (not b!250119) (not b!250170) (not b!250053) (not b!250177) (not b_lambda!8077) (not b!250118) (not b!250245) (not d!60865) (not d!60851) (not b!250146) (not d!60821) (not b!250239) (not bm!23499) (not d!60903) (not b!250113) (not bm!23496) (not b!250176) (not d!60857) (not b!250114) (not b!250057) (not b!250167) (not b!250192) (not b!250251) (not b!250231) (not b!250091) (not b!250228) (not d!60875) (not d!60895) (not b!250150) tp_is_empty!6483 (not b_lambda!8085) (not d!60855) (not d!60877) (not b!250043) (not d!60819) (not d!60917) (not b!250182) (not d!60853) (not b!250111) (not b!250193) (not b_next!6621) (not mapNonEmpty!11020) (not bm!23493) (not b!250237) (not bm!23509) (not bm!23507) (not b!250226) (not b!250092) (not b!250097) (not d!60835) (not d!60881) (not bm!23495) (not b!250168) (not bm!23502) b_and!13643 (not b!250059))
(check-sat b_and!13643 (not b_next!6621))
