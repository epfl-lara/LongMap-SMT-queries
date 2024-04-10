; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22086 () Bool)

(assert start!22086)

(declare-fun b!229199 () Bool)

(declare-fun b_free!6153 () Bool)

(declare-fun b_next!6153 () Bool)

(assert (=> b!229199 (= b_free!6153 (not b_next!6153))))

(declare-fun tp!21600 () Bool)

(declare-fun b_and!13051 () Bool)

(assert (=> b!229199 (= tp!21600 b_and!13051)))

(declare-fun b!229194 () Bool)

(declare-fun e!148707 () Bool)

(declare-fun call!21294 () Bool)

(assert (=> b!229194 (= e!148707 (not call!21294))))

(declare-fun b!229195 () Bool)

(declare-datatypes ((Unit!6985 0))(
  ( (Unit!6986) )
))
(declare-fun e!148702 () Unit!6985)

(declare-fun lt!115295 () Unit!6985)

(assert (=> b!229195 (= e!148702 lt!115295)))

(declare-datatypes ((V!7667 0))(
  ( (V!7668 (val!3052 Int)) )
))
(declare-datatypes ((ValueCell!2664 0))(
  ( (ValueCellFull!2664 (v!5072 V!7667)) (EmptyCell!2664) )
))
(declare-datatypes ((array!11273 0))(
  ( (array!11274 (arr!5356 (Array (_ BitVec 32) ValueCell!2664)) (size!5689 (_ BitVec 32))) )
))
(declare-datatypes ((array!11275 0))(
  ( (array!11276 (arr!5357 (Array (_ BitVec 32) (_ BitVec 64))) (size!5690 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3228 0))(
  ( (LongMapFixedSize!3229 (defaultEntry!4273 Int) (mask!10151 (_ BitVec 32)) (extraKeys!4010 (_ BitVec 32)) (zeroValue!4114 V!7667) (minValue!4114 V!7667) (_size!1663 (_ BitVec 32)) (_keys!6327 array!11275) (_values!4256 array!11273) (_vacant!1663 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3228)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!296 (array!11275 array!11273 (_ BitVec 32) (_ BitVec 32) V!7667 V!7667 (_ BitVec 64) Int) Unit!6985)

(assert (=> b!229195 (= lt!115295 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!296 (_keys!6327 thiss!1504) (_values!4256 thiss!1504) (mask!10151 thiss!1504) (extraKeys!4010 thiss!1504) (zeroValue!4114 thiss!1504) (minValue!4114 thiss!1504) key!932 (defaultEntry!4273 thiss!1504)))))

(declare-fun c!38014 () Bool)

(declare-datatypes ((SeekEntryResult!918 0))(
  ( (MissingZero!918 (index!5842 (_ BitVec 32))) (Found!918 (index!5843 (_ BitVec 32))) (Intermediate!918 (undefined!1730 Bool) (index!5844 (_ BitVec 32)) (x!23370 (_ BitVec 32))) (Undefined!918) (MissingVacant!918 (index!5845 (_ BitVec 32))) )
))
(declare-fun lt!115296 () SeekEntryResult!918)

(get-info :version)

(assert (=> b!229195 (= c!38014 ((_ is MissingZero!918) lt!115296))))

(declare-fun e!148698 () Bool)

(assert (=> b!229195 e!148698))

(declare-fun b!229196 () Bool)

(declare-fun e!148705 () Unit!6985)

(declare-fun Unit!6987 () Unit!6985)

(assert (=> b!229196 (= e!148705 Unit!6987)))

(declare-fun b!229197 () Bool)

(declare-fun e!148703 () Bool)

(declare-fun e!148704 () Bool)

(assert (=> b!229197 (= e!148703 e!148704)))

(declare-fun res!112807 () Bool)

(assert (=> b!229197 (=> (not res!112807) (not e!148704))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!229197 (= res!112807 (inRange!0 index!297 (mask!10151 thiss!1504)))))

(declare-fun lt!115294 () Unit!6985)

(assert (=> b!229197 (= lt!115294 e!148702)))

(declare-fun c!38013 () Bool)

(declare-datatypes ((tuple2!4504 0))(
  ( (tuple2!4505 (_1!2263 (_ BitVec 64)) (_2!2263 V!7667)) )
))
(declare-datatypes ((List!3427 0))(
  ( (Nil!3424) (Cons!3423 (h!4071 tuple2!4504) (t!8386 List!3427)) )
))
(declare-datatypes ((ListLongMap!3417 0))(
  ( (ListLongMap!3418 (toList!1724 List!3427)) )
))
(declare-fun contains!1598 (ListLongMap!3417 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1252 (array!11275 array!11273 (_ BitVec 32) (_ BitVec 32) V!7667 V!7667 (_ BitVec 32) Int) ListLongMap!3417)

(assert (=> b!229197 (= c!38013 (contains!1598 (getCurrentListMap!1252 (_keys!6327 thiss!1504) (_values!4256 thiss!1504) (mask!10151 thiss!1504) (extraKeys!4010 thiss!1504) (zeroValue!4114 thiss!1504) (minValue!4114 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4273 thiss!1504)) key!932))))

(declare-fun b!229198 () Bool)

(declare-fun e!148709 () Bool)

(declare-fun e!148696 () Bool)

(declare-fun mapRes!10192 () Bool)

(assert (=> b!229198 (= e!148709 (and e!148696 mapRes!10192))))

(declare-fun condMapEmpty!10192 () Bool)

(declare-fun mapDefault!10192 () ValueCell!2664)

(assert (=> b!229198 (= condMapEmpty!10192 (= (arr!5356 (_values!4256 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2664)) mapDefault!10192)))))

(declare-fun e!148695 () Bool)

(declare-fun tp_is_empty!6015 () Bool)

(declare-fun array_inv!3539 (array!11275) Bool)

(declare-fun array_inv!3540 (array!11273) Bool)

(assert (=> b!229199 (= e!148695 (and tp!21600 tp_is_empty!6015 (array_inv!3539 (_keys!6327 thiss!1504)) (array_inv!3540 (_values!4256 thiss!1504)) e!148709))))

(declare-fun b!229200 () Bool)

(declare-fun e!148701 () Bool)

(assert (=> b!229200 (= e!148701 tp_is_empty!6015)))

(declare-fun b!229201 () Bool)

(declare-fun e!148708 () Bool)

(assert (=> b!229201 (= e!148708 e!148707)))

(declare-fun res!112800 () Bool)

(declare-fun call!21293 () Bool)

(assert (=> b!229201 (= res!112800 call!21293)))

(assert (=> b!229201 (=> (not res!112800) (not e!148707))))

(declare-fun bm!21290 () Bool)

(assert (=> bm!21290 (= call!21293 (inRange!0 (ite c!38014 (index!5842 lt!115296) (index!5845 lt!115296)) (mask!10151 thiss!1504)))))

(declare-fun b!229202 () Bool)

(declare-fun Unit!6988 () Unit!6985)

(assert (=> b!229202 (= e!148702 Unit!6988)))

(declare-fun lt!115288 () Unit!6985)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!279 (array!11275 array!11273 (_ BitVec 32) (_ BitVec 32) V!7667 V!7667 (_ BitVec 64) Int) Unit!6985)

(assert (=> b!229202 (= lt!115288 (lemmaInListMapThenSeekEntryOrOpenFindsIt!279 (_keys!6327 thiss!1504) (_values!4256 thiss!1504) (mask!10151 thiss!1504) (extraKeys!4010 thiss!1504) (zeroValue!4114 thiss!1504) (minValue!4114 thiss!1504) key!932 (defaultEntry!4273 thiss!1504)))))

(assert (=> b!229202 false))

(declare-fun b!229203 () Bool)

(assert (=> b!229203 (= e!148696 tp_is_empty!6015)))

(declare-fun bm!21291 () Bool)

(declare-fun arrayContainsKey!0 (array!11275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21291 (= call!21294 (arrayContainsKey!0 (_keys!6327 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229204 () Bool)

(declare-fun res!112806 () Bool)

(declare-fun e!148699 () Bool)

(assert (=> b!229204 (=> (not res!112806) (not e!148699))))

(assert (=> b!229204 (= res!112806 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!229205 () Bool)

(declare-fun res!112802 () Bool)

(declare-fun e!148706 () Bool)

(assert (=> b!229205 (=> (not res!112802) (not e!148706))))

(assert (=> b!229205 (= res!112802 (= (select (arr!5357 (_keys!6327 thiss!1504)) (index!5842 lt!115296)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!10192 () Bool)

(assert (=> mapIsEmpty!10192 mapRes!10192))

(declare-fun b!229206 () Bool)

(declare-fun e!148700 () Bool)

(assert (=> b!229206 (= e!148704 (not e!148700))))

(declare-fun res!112805 () Bool)

(assert (=> b!229206 (=> res!112805 e!148700)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!229206 (= res!112805 (not (validMask!0 (mask!10151 thiss!1504))))))

(declare-fun lt!115289 () array!11275)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11275 (_ BitVec 32)) Bool)

(assert (=> b!229206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115289 (mask!10151 thiss!1504))))

(declare-fun lt!115290 () Unit!6985)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11275 (_ BitVec 32) (_ BitVec 32)) Unit!6985)

(assert (=> b!229206 (= lt!115290 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6327 thiss!1504) index!297 (mask!10151 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11275 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!229206 (= (arrayCountValidKeys!0 lt!115289 #b00000000000000000000000000000000 (size!5690 (_keys!6327 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6327 thiss!1504) #b00000000000000000000000000000000 (size!5690 (_keys!6327 thiss!1504)))))))

(declare-fun lt!115291 () Unit!6985)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11275 (_ BitVec 32) (_ BitVec 64)) Unit!6985)

(assert (=> b!229206 (= lt!115291 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6327 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3428 0))(
  ( (Nil!3425) (Cons!3424 (h!4072 (_ BitVec 64)) (t!8387 List!3428)) )
))
(declare-fun arrayNoDuplicates!0 (array!11275 (_ BitVec 32) List!3428) Bool)

(assert (=> b!229206 (arrayNoDuplicates!0 lt!115289 #b00000000000000000000000000000000 Nil!3425)))

(assert (=> b!229206 (= lt!115289 (array!11276 (store (arr!5357 (_keys!6327 thiss!1504)) index!297 key!932) (size!5690 (_keys!6327 thiss!1504))))))

(declare-fun lt!115293 () Unit!6985)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11275 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3428) Unit!6985)

(assert (=> b!229206 (= lt!115293 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6327 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3425))))

(declare-fun lt!115292 () Unit!6985)

(assert (=> b!229206 (= lt!115292 e!148705)))

(declare-fun c!38016 () Bool)

(assert (=> b!229206 (= c!38016 (arrayContainsKey!0 (_keys!6327 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!229207 () Bool)

(declare-fun res!112810 () Bool)

(assert (=> b!229207 (=> (not res!112810) (not e!148706))))

(assert (=> b!229207 (= res!112810 call!21293)))

(assert (=> b!229207 (= e!148698 e!148706)))

(declare-fun b!229208 () Bool)

(declare-fun res!112801 () Bool)

(assert (=> b!229208 (= res!112801 (= (select (arr!5357 (_keys!6327 thiss!1504)) (index!5845 lt!115296)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!229208 (=> (not res!112801) (not e!148707))))

(declare-fun b!229209 () Bool)

(declare-fun res!112809 () Bool)

(assert (=> b!229209 (=> res!112809 e!148700)))

(assert (=> b!229209 (= res!112809 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6327 thiss!1504) (mask!10151 thiss!1504))))))

(declare-fun b!229210 () Bool)

(assert (=> b!229210 (= e!148699 e!148703)))

(declare-fun res!112808 () Bool)

(assert (=> b!229210 (=> (not res!112808) (not e!148703))))

(assert (=> b!229210 (= res!112808 (or (= lt!115296 (MissingZero!918 index!297)) (= lt!115296 (MissingVacant!918 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11275 (_ BitVec 32)) SeekEntryResult!918)

(assert (=> b!229210 (= lt!115296 (seekEntryOrOpen!0 key!932 (_keys!6327 thiss!1504) (mask!10151 thiss!1504)))))

(declare-fun mapNonEmpty!10192 () Bool)

(declare-fun tp!21601 () Bool)

(assert (=> mapNonEmpty!10192 (= mapRes!10192 (and tp!21601 e!148701))))

(declare-fun mapRest!10192 () (Array (_ BitVec 32) ValueCell!2664))

(declare-fun mapValue!10192 () ValueCell!2664)

(declare-fun mapKey!10192 () (_ BitVec 32))

(assert (=> mapNonEmpty!10192 (= (arr!5356 (_values!4256 thiss!1504)) (store mapRest!10192 mapKey!10192 mapValue!10192))))

(declare-fun res!112804 () Bool)

(assert (=> start!22086 (=> (not res!112804) (not e!148699))))

(declare-fun valid!1288 (LongMapFixedSize!3228) Bool)

(assert (=> start!22086 (= res!112804 (valid!1288 thiss!1504))))

(assert (=> start!22086 e!148699))

(assert (=> start!22086 e!148695))

(assert (=> start!22086 true))

(declare-fun b!229211 () Bool)

(declare-fun Unit!6989 () Unit!6985)

(assert (=> b!229211 (= e!148705 Unit!6989)))

(declare-fun lt!115298 () Unit!6985)

(declare-fun lemmaArrayContainsKeyThenInListMap!113 (array!11275 array!11273 (_ BitVec 32) (_ BitVec 32) V!7667 V!7667 (_ BitVec 64) (_ BitVec 32) Int) Unit!6985)

(assert (=> b!229211 (= lt!115298 (lemmaArrayContainsKeyThenInListMap!113 (_keys!6327 thiss!1504) (_values!4256 thiss!1504) (mask!10151 thiss!1504) (extraKeys!4010 thiss!1504) (zeroValue!4114 thiss!1504) (minValue!4114 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4273 thiss!1504)))))

(assert (=> b!229211 false))

(declare-fun b!229212 () Bool)

(assert (=> b!229212 (= e!148706 (not call!21294))))

(declare-fun b!229213 () Bool)

(assert (=> b!229213 (= e!148700 true)))

(declare-fun lt!115297 () Bool)

(assert (=> b!229213 (= lt!115297 (arrayNoDuplicates!0 (_keys!6327 thiss!1504) #b00000000000000000000000000000000 Nil!3425))))

(declare-fun b!229214 () Bool)

(declare-fun c!38015 () Bool)

(assert (=> b!229214 (= c!38015 ((_ is MissingVacant!918) lt!115296))))

(assert (=> b!229214 (= e!148698 e!148708)))

(declare-fun b!229215 () Bool)

(declare-fun res!112803 () Bool)

(assert (=> b!229215 (=> res!112803 e!148700)))

(assert (=> b!229215 (= res!112803 (or (not (= (size!5689 (_values!4256 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10151 thiss!1504)))) (not (= (size!5690 (_keys!6327 thiss!1504)) (size!5689 (_values!4256 thiss!1504)))) (bvslt (mask!10151 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4010 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4010 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!229216 () Bool)

(assert (=> b!229216 (= e!148708 ((_ is Undefined!918) lt!115296))))

(assert (= (and start!22086 res!112804) b!229204))

(assert (= (and b!229204 res!112806) b!229210))

(assert (= (and b!229210 res!112808) b!229197))

(assert (= (and b!229197 c!38013) b!229202))

(assert (= (and b!229197 (not c!38013)) b!229195))

(assert (= (and b!229195 c!38014) b!229207))

(assert (= (and b!229195 (not c!38014)) b!229214))

(assert (= (and b!229207 res!112810) b!229205))

(assert (= (and b!229205 res!112802) b!229212))

(assert (= (and b!229214 c!38015) b!229201))

(assert (= (and b!229214 (not c!38015)) b!229216))

(assert (= (and b!229201 res!112800) b!229208))

(assert (= (and b!229208 res!112801) b!229194))

(assert (= (or b!229207 b!229201) bm!21290))

(assert (= (or b!229212 b!229194) bm!21291))

(assert (= (and b!229197 res!112807) b!229206))

(assert (= (and b!229206 c!38016) b!229211))

(assert (= (and b!229206 (not c!38016)) b!229196))

(assert (= (and b!229206 (not res!112805)) b!229215))

(assert (= (and b!229215 (not res!112803)) b!229209))

(assert (= (and b!229209 (not res!112809)) b!229213))

(assert (= (and b!229198 condMapEmpty!10192) mapIsEmpty!10192))

(assert (= (and b!229198 (not condMapEmpty!10192)) mapNonEmpty!10192))

(assert (= (and mapNonEmpty!10192 ((_ is ValueCellFull!2664) mapValue!10192)) b!229200))

(assert (= (and b!229198 ((_ is ValueCellFull!2664) mapDefault!10192)) b!229203))

(assert (= b!229199 b!229198))

(assert (= start!22086 b!229199))

(declare-fun m!250767 () Bool)

(assert (=> b!229195 m!250767))

(declare-fun m!250769 () Bool)

(assert (=> b!229205 m!250769))

(declare-fun m!250771 () Bool)

(assert (=> b!229210 m!250771))

(declare-fun m!250773 () Bool)

(assert (=> b!229206 m!250773))

(declare-fun m!250775 () Bool)

(assert (=> b!229206 m!250775))

(declare-fun m!250777 () Bool)

(assert (=> b!229206 m!250777))

(declare-fun m!250779 () Bool)

(assert (=> b!229206 m!250779))

(declare-fun m!250781 () Bool)

(assert (=> b!229206 m!250781))

(declare-fun m!250783 () Bool)

(assert (=> b!229206 m!250783))

(declare-fun m!250785 () Bool)

(assert (=> b!229206 m!250785))

(declare-fun m!250787 () Bool)

(assert (=> b!229206 m!250787))

(declare-fun m!250789 () Bool)

(assert (=> b!229206 m!250789))

(declare-fun m!250791 () Bool)

(assert (=> b!229206 m!250791))

(assert (=> bm!21291 m!250775))

(declare-fun m!250793 () Bool)

(assert (=> b!229211 m!250793))

(declare-fun m!250795 () Bool)

(assert (=> start!22086 m!250795))

(declare-fun m!250797 () Bool)

(assert (=> b!229213 m!250797))

(declare-fun m!250799 () Bool)

(assert (=> b!229199 m!250799))

(declare-fun m!250801 () Bool)

(assert (=> b!229199 m!250801))

(declare-fun m!250803 () Bool)

(assert (=> bm!21290 m!250803))

(declare-fun m!250805 () Bool)

(assert (=> b!229202 m!250805))

(declare-fun m!250807 () Bool)

(assert (=> b!229209 m!250807))

(declare-fun m!250809 () Bool)

(assert (=> b!229208 m!250809))

(declare-fun m!250811 () Bool)

(assert (=> b!229197 m!250811))

(declare-fun m!250813 () Bool)

(assert (=> b!229197 m!250813))

(assert (=> b!229197 m!250813))

(declare-fun m!250815 () Bool)

(assert (=> b!229197 m!250815))

(declare-fun m!250817 () Bool)

(assert (=> mapNonEmpty!10192 m!250817))

(check-sat (not bm!21291) tp_is_empty!6015 (not b!229202) (not start!22086) (not b!229206) (not mapNonEmpty!10192) (not b!229195) (not b!229197) (not b!229210) (not b_next!6153) (not b!229199) (not b!229213) (not b!229209) b_and!13051 (not b!229211) (not bm!21290))
(check-sat b_and!13051 (not b_next!6153))
