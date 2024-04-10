; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22134 () Bool)

(assert start!22134)

(declare-fun b!230705 () Bool)

(declare-fun b_free!6201 () Bool)

(declare-fun b_next!6201 () Bool)

(assert (=> b!230705 (= b_free!6201 (not b_next!6201))))

(declare-fun tp!21744 () Bool)

(declare-fun b_and!13099 () Bool)

(assert (=> b!230705 (= tp!21744 b_and!13099)))

(declare-fun res!113448 () Bool)

(declare-fun e!149736 () Bool)

(assert (=> start!22134 (=> (not res!113448) (not e!149736))))

(declare-datatypes ((V!7731 0))(
  ( (V!7732 (val!3076 Int)) )
))
(declare-datatypes ((ValueCell!2688 0))(
  ( (ValueCellFull!2688 (v!5096 V!7731)) (EmptyCell!2688) )
))
(declare-datatypes ((array!11369 0))(
  ( (array!11370 (arr!5404 (Array (_ BitVec 32) ValueCell!2688)) (size!5737 (_ BitVec 32))) )
))
(declare-datatypes ((array!11371 0))(
  ( (array!11372 (arr!5405 (Array (_ BitVec 32) (_ BitVec 64))) (size!5738 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3276 0))(
  ( (LongMapFixedSize!3277 (defaultEntry!4297 Int) (mask!10191 (_ BitVec 32)) (extraKeys!4034 (_ BitVec 32)) (zeroValue!4138 V!7731) (minValue!4138 V!7731) (_size!1687 (_ BitVec 32)) (_keys!6351 array!11371) (_values!4280 array!11369) (_vacant!1687 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3276)

(declare-fun valid!1303 (LongMapFixedSize!3276) Bool)

(assert (=> start!22134 (= res!113448 (valid!1303 thiss!1504))))

(assert (=> start!22134 e!149736))

(declare-fun e!149738 () Bool)

(assert (=> start!22134 e!149738))

(assert (=> start!22134 true))

(declare-fun tp_is_empty!6063 () Bool)

(assert (=> start!22134 tp_is_empty!6063))

(declare-fun b!230700 () Bool)

(declare-datatypes ((Unit!7067 0))(
  ( (Unit!7068) )
))
(declare-fun e!149733 () Unit!7067)

(declare-fun Unit!7069 () Unit!7067)

(assert (=> b!230700 (= e!149733 Unit!7069)))

(declare-fun lt!116159 () Unit!7067)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!292 (array!11371 array!11369 (_ BitVec 32) (_ BitVec 32) V!7731 V!7731 (_ BitVec 64) Int) Unit!7067)

(assert (=> b!230700 (= lt!116159 (lemmaInListMapThenSeekEntryOrOpenFindsIt!292 (_keys!6351 thiss!1504) (_values!4280 thiss!1504) (mask!10191 thiss!1504) (extraKeys!4034 thiss!1504) (zeroValue!4138 thiss!1504) (minValue!4138 thiss!1504) key!932 (defaultEntry!4297 thiss!1504)))))

(assert (=> b!230700 false))

(declare-fun b!230701 () Bool)

(declare-fun res!113445 () Bool)

(declare-fun e!149734 () Bool)

(assert (=> b!230701 (=> (not res!113445) (not e!149734))))

(declare-fun call!21438 () Bool)

(assert (=> b!230701 (= res!113445 call!21438)))

(declare-fun e!149728 () Bool)

(assert (=> b!230701 (= e!149728 e!149734)))

(declare-fun c!38303 () Bool)

(declare-fun bm!21434 () Bool)

(declare-datatypes ((SeekEntryResult!940 0))(
  ( (MissingZero!940 (index!5930 (_ BitVec 32))) (Found!940 (index!5931 (_ BitVec 32))) (Intermediate!940 (undefined!1752 Bool) (index!5932 (_ BitVec 32)) (x!23456 (_ BitVec 32))) (Undefined!940) (MissingVacant!940 (index!5933 (_ BitVec 32))) )
))
(declare-fun lt!116158 () SeekEntryResult!940)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21434 (= call!21438 (inRange!0 (ite c!38303 (index!5930 lt!116158) (index!5933 lt!116158)) (mask!10191 thiss!1504)))))

(declare-fun b!230702 () Bool)

(declare-fun e!149725 () Bool)

(assert (=> b!230702 (= e!149725 tp_is_empty!6063)))

(declare-fun b!230703 () Bool)

(declare-fun res!113447 () Bool)

(assert (=> b!230703 (=> (not res!113447) (not e!149734))))

(assert (=> b!230703 (= res!113447 (= (select (arr!5405 (_keys!6351 thiss!1504)) (index!5930 lt!116158)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230704 () Bool)

(declare-fun e!149726 () Bool)

(declare-fun e!149732 () Bool)

(assert (=> b!230704 (= e!149726 e!149732)))

(declare-fun res!113443 () Bool)

(assert (=> b!230704 (=> (not res!113443) (not e!149732))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230704 (= res!113443 (inRange!0 index!297 (mask!10191 thiss!1504)))))

(declare-fun lt!116150 () Unit!7067)

(assert (=> b!230704 (= lt!116150 e!149733)))

(declare-fun c!38304 () Bool)

(declare-datatypes ((tuple2!4538 0))(
  ( (tuple2!4539 (_1!2280 (_ BitVec 64)) (_2!2280 V!7731)) )
))
(declare-datatypes ((List!3460 0))(
  ( (Nil!3457) (Cons!3456 (h!4104 tuple2!4538) (t!8419 List!3460)) )
))
(declare-datatypes ((ListLongMap!3451 0))(
  ( (ListLongMap!3452 (toList!1741 List!3460)) )
))
(declare-fun lt!116151 () ListLongMap!3451)

(declare-fun contains!1613 (ListLongMap!3451 (_ BitVec 64)) Bool)

(assert (=> b!230704 (= c!38304 (contains!1613 lt!116151 key!932))))

(declare-fun getCurrentListMap!1269 (array!11371 array!11369 (_ BitVec 32) (_ BitVec 32) V!7731 V!7731 (_ BitVec 32) Int) ListLongMap!3451)

(assert (=> b!230704 (= lt!116151 (getCurrentListMap!1269 (_keys!6351 thiss!1504) (_values!4280 thiss!1504) (mask!10191 thiss!1504) (extraKeys!4034 thiss!1504) (zeroValue!4138 thiss!1504) (minValue!4138 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4297 thiss!1504)))))

(declare-fun e!149730 () Bool)

(declare-fun array_inv!3563 (array!11371) Bool)

(declare-fun array_inv!3564 (array!11369) Bool)

(assert (=> b!230705 (= e!149738 (and tp!21744 tp_is_empty!6063 (array_inv!3563 (_keys!6351 thiss!1504)) (array_inv!3564 (_values!4280 thiss!1504)) e!149730))))

(declare-fun b!230706 () Bool)

(assert (=> b!230706 (= e!149732 (not true))))

(declare-fun lt!116156 () array!11371)

(declare-fun arrayCountValidKeys!0 (array!11371 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230706 (= (arrayCountValidKeys!0 lt!116156 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116149 () Unit!7067)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11371 (_ BitVec 32)) Unit!7067)

(assert (=> b!230706 (= lt!116149 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116156 index!297))))

(declare-fun arrayContainsKey!0 (array!11371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230706 (arrayContainsKey!0 lt!116156 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116152 () Unit!7067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11371 (_ BitVec 64) (_ BitVec 32)) Unit!7067)

(assert (=> b!230706 (= lt!116152 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116156 key!932 index!297))))

(declare-fun v!346 () V!7731)

(declare-fun +!608 (ListLongMap!3451 tuple2!4538) ListLongMap!3451)

(assert (=> b!230706 (= (+!608 lt!116151 (tuple2!4539 key!932 v!346)) (getCurrentListMap!1269 lt!116156 (array!11370 (store (arr!5404 (_values!4280 thiss!1504)) index!297 (ValueCellFull!2688 v!346)) (size!5737 (_values!4280 thiss!1504))) (mask!10191 thiss!1504) (extraKeys!4034 thiss!1504) (zeroValue!4138 thiss!1504) (minValue!4138 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4297 thiss!1504)))))

(declare-fun lt!116155 () Unit!7067)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!62 (array!11371 array!11369 (_ BitVec 32) (_ BitVec 32) V!7731 V!7731 (_ BitVec 32) (_ BitVec 64) V!7731 Int) Unit!7067)

(assert (=> b!230706 (= lt!116155 (lemmaAddValidKeyToArrayThenAddPairToListMap!62 (_keys!6351 thiss!1504) (_values!4280 thiss!1504) (mask!10191 thiss!1504) (extraKeys!4034 thiss!1504) (zeroValue!4138 thiss!1504) (minValue!4138 thiss!1504) index!297 key!932 v!346 (defaultEntry!4297 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11371 (_ BitVec 32)) Bool)

(assert (=> b!230706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116156 (mask!10191 thiss!1504))))

(declare-fun lt!116154 () Unit!7067)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11371 (_ BitVec 32) (_ BitVec 32)) Unit!7067)

(assert (=> b!230706 (= lt!116154 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6351 thiss!1504) index!297 (mask!10191 thiss!1504)))))

(assert (=> b!230706 (= (arrayCountValidKeys!0 lt!116156 #b00000000000000000000000000000000 (size!5738 (_keys!6351 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6351 thiss!1504) #b00000000000000000000000000000000 (size!5738 (_keys!6351 thiss!1504)))))))

(declare-fun lt!116161 () Unit!7067)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11371 (_ BitVec 32) (_ BitVec 64)) Unit!7067)

(assert (=> b!230706 (= lt!116161 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6351 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3461 0))(
  ( (Nil!3458) (Cons!3457 (h!4105 (_ BitVec 64)) (t!8420 List!3461)) )
))
(declare-fun arrayNoDuplicates!0 (array!11371 (_ BitVec 32) List!3461) Bool)

(assert (=> b!230706 (arrayNoDuplicates!0 lt!116156 #b00000000000000000000000000000000 Nil!3458)))

(assert (=> b!230706 (= lt!116156 (array!11372 (store (arr!5405 (_keys!6351 thiss!1504)) index!297 key!932) (size!5738 (_keys!6351 thiss!1504))))))

(declare-fun lt!116153 () Unit!7067)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11371 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3461) Unit!7067)

(assert (=> b!230706 (= lt!116153 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6351 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3458))))

(declare-fun lt!116162 () Unit!7067)

(declare-fun e!149729 () Unit!7067)

(assert (=> b!230706 (= lt!116162 e!149729)))

(declare-fun c!38301 () Bool)

(assert (=> b!230706 (= c!38301 (arrayContainsKey!0 (_keys!6351 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230707 () Bool)

(declare-fun e!149731 () Bool)

(declare-fun call!21437 () Bool)

(assert (=> b!230707 (= e!149731 (not call!21437))))

(declare-fun b!230708 () Bool)

(declare-fun Unit!7070 () Unit!7067)

(assert (=> b!230708 (= e!149729 Unit!7070)))

(declare-fun b!230709 () Bool)

(assert (=> b!230709 (= e!149734 (not call!21437))))

(declare-fun b!230710 () Bool)

(declare-fun lt!116157 () Unit!7067)

(assert (=> b!230710 (= e!149733 lt!116157)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!310 (array!11371 array!11369 (_ BitVec 32) (_ BitVec 32) V!7731 V!7731 (_ BitVec 64) Int) Unit!7067)

(assert (=> b!230710 (= lt!116157 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!310 (_keys!6351 thiss!1504) (_values!4280 thiss!1504) (mask!10191 thiss!1504) (extraKeys!4034 thiss!1504) (zeroValue!4138 thiss!1504) (minValue!4138 thiss!1504) key!932 (defaultEntry!4297 thiss!1504)))))

(get-info :version)

(assert (=> b!230710 (= c!38303 ((_ is MissingZero!940) lt!116158))))

(assert (=> b!230710 e!149728))

(declare-fun bm!21435 () Bool)

(assert (=> bm!21435 (= call!21437 (arrayContainsKey!0 (_keys!6351 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230711 () Bool)

(declare-fun res!113446 () Bool)

(assert (=> b!230711 (=> (not res!113446) (not e!149736))))

(assert (=> b!230711 (= res!113446 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230712 () Bool)

(declare-fun mapRes!10264 () Bool)

(assert (=> b!230712 (= e!149730 (and e!149725 mapRes!10264))))

(declare-fun condMapEmpty!10264 () Bool)

(declare-fun mapDefault!10264 () ValueCell!2688)

(assert (=> b!230712 (= condMapEmpty!10264 (= (arr!5404 (_values!4280 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2688)) mapDefault!10264)))))

(declare-fun mapIsEmpty!10264 () Bool)

(assert (=> mapIsEmpty!10264 mapRes!10264))

(declare-fun b!230713 () Bool)

(declare-fun e!149737 () Bool)

(assert (=> b!230713 (= e!149737 ((_ is Undefined!940) lt!116158))))

(declare-fun b!230714 () Bool)

(declare-fun e!149735 () Bool)

(assert (=> b!230714 (= e!149735 tp_is_empty!6063)))

(declare-fun b!230715 () Bool)

(declare-fun c!38302 () Bool)

(assert (=> b!230715 (= c!38302 ((_ is MissingVacant!940) lt!116158))))

(assert (=> b!230715 (= e!149728 e!149737)))

(declare-fun b!230716 () Bool)

(declare-fun Unit!7071 () Unit!7067)

(assert (=> b!230716 (= e!149729 Unit!7071)))

(declare-fun lt!116160 () Unit!7067)

(declare-fun lemmaArrayContainsKeyThenInListMap!126 (array!11371 array!11369 (_ BitVec 32) (_ BitVec 32) V!7731 V!7731 (_ BitVec 64) (_ BitVec 32) Int) Unit!7067)

(assert (=> b!230716 (= lt!116160 (lemmaArrayContainsKeyThenInListMap!126 (_keys!6351 thiss!1504) (_values!4280 thiss!1504) (mask!10191 thiss!1504) (extraKeys!4034 thiss!1504) (zeroValue!4138 thiss!1504) (minValue!4138 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4297 thiss!1504)))))

(assert (=> b!230716 false))

(declare-fun mapNonEmpty!10264 () Bool)

(declare-fun tp!21745 () Bool)

(assert (=> mapNonEmpty!10264 (= mapRes!10264 (and tp!21745 e!149735))))

(declare-fun mapKey!10264 () (_ BitVec 32))

(declare-fun mapRest!10264 () (Array (_ BitVec 32) ValueCell!2688))

(declare-fun mapValue!10264 () ValueCell!2688)

(assert (=> mapNonEmpty!10264 (= (arr!5404 (_values!4280 thiss!1504)) (store mapRest!10264 mapKey!10264 mapValue!10264))))

(declare-fun b!230717 () Bool)

(assert (=> b!230717 (= e!149736 e!149726)))

(declare-fun res!113442 () Bool)

(assert (=> b!230717 (=> (not res!113442) (not e!149726))))

(assert (=> b!230717 (= res!113442 (or (= lt!116158 (MissingZero!940 index!297)) (= lt!116158 (MissingVacant!940 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11371 (_ BitVec 32)) SeekEntryResult!940)

(assert (=> b!230717 (= lt!116158 (seekEntryOrOpen!0 key!932 (_keys!6351 thiss!1504) (mask!10191 thiss!1504)))))

(declare-fun b!230718 () Bool)

(declare-fun res!113444 () Bool)

(assert (=> b!230718 (= res!113444 (= (select (arr!5405 (_keys!6351 thiss!1504)) (index!5933 lt!116158)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!230718 (=> (not res!113444) (not e!149731))))

(declare-fun b!230719 () Bool)

(assert (=> b!230719 (= e!149737 e!149731)))

(declare-fun res!113449 () Bool)

(assert (=> b!230719 (= res!113449 call!21438)))

(assert (=> b!230719 (=> (not res!113449) (not e!149731))))

(assert (= (and start!22134 res!113448) b!230711))

(assert (= (and b!230711 res!113446) b!230717))

(assert (= (and b!230717 res!113442) b!230704))

(assert (= (and b!230704 c!38304) b!230700))

(assert (= (and b!230704 (not c!38304)) b!230710))

(assert (= (and b!230710 c!38303) b!230701))

(assert (= (and b!230710 (not c!38303)) b!230715))

(assert (= (and b!230701 res!113445) b!230703))

(assert (= (and b!230703 res!113447) b!230709))

(assert (= (and b!230715 c!38302) b!230719))

(assert (= (and b!230715 (not c!38302)) b!230713))

(assert (= (and b!230719 res!113449) b!230718))

(assert (= (and b!230718 res!113444) b!230707))

(assert (= (or b!230701 b!230719) bm!21434))

(assert (= (or b!230709 b!230707) bm!21435))

(assert (= (and b!230704 res!113443) b!230706))

(assert (= (and b!230706 c!38301) b!230716))

(assert (= (and b!230706 (not c!38301)) b!230708))

(assert (= (and b!230712 condMapEmpty!10264) mapIsEmpty!10264))

(assert (= (and b!230712 (not condMapEmpty!10264)) mapNonEmpty!10264))

(assert (= (and mapNonEmpty!10264 ((_ is ValueCellFull!2688) mapValue!10264)) b!230714))

(assert (= (and b!230712 ((_ is ValueCellFull!2688) mapDefault!10264)) b!230702))

(assert (= b!230705 b!230712))

(assert (= start!22134 b!230705))

(declare-fun m!252067 () Bool)

(assert (=> bm!21434 m!252067))

(declare-fun m!252069 () Bool)

(assert (=> mapNonEmpty!10264 m!252069))

(declare-fun m!252071 () Bool)

(assert (=> b!230718 m!252071))

(declare-fun m!252073 () Bool)

(assert (=> b!230706 m!252073))

(declare-fun m!252075 () Bool)

(assert (=> b!230706 m!252075))

(declare-fun m!252077 () Bool)

(assert (=> b!230706 m!252077))

(declare-fun m!252079 () Bool)

(assert (=> b!230706 m!252079))

(declare-fun m!252081 () Bool)

(assert (=> b!230706 m!252081))

(declare-fun m!252083 () Bool)

(assert (=> b!230706 m!252083))

(declare-fun m!252085 () Bool)

(assert (=> b!230706 m!252085))

(declare-fun m!252087 () Bool)

(assert (=> b!230706 m!252087))

(declare-fun m!252089 () Bool)

(assert (=> b!230706 m!252089))

(declare-fun m!252091 () Bool)

(assert (=> b!230706 m!252091))

(declare-fun m!252093 () Bool)

(assert (=> b!230706 m!252093))

(declare-fun m!252095 () Bool)

(assert (=> b!230706 m!252095))

(declare-fun m!252097 () Bool)

(assert (=> b!230706 m!252097))

(declare-fun m!252099 () Bool)

(assert (=> b!230706 m!252099))

(declare-fun m!252101 () Bool)

(assert (=> b!230706 m!252101))

(declare-fun m!252103 () Bool)

(assert (=> b!230706 m!252103))

(declare-fun m!252105 () Bool)

(assert (=> b!230706 m!252105))

(assert (=> bm!21435 m!252073))

(declare-fun m!252107 () Bool)

(assert (=> b!230705 m!252107))

(declare-fun m!252109 () Bool)

(assert (=> b!230705 m!252109))

(declare-fun m!252111 () Bool)

(assert (=> b!230710 m!252111))

(declare-fun m!252113 () Bool)

(assert (=> b!230717 m!252113))

(declare-fun m!252115 () Bool)

(assert (=> b!230700 m!252115))

(declare-fun m!252117 () Bool)

(assert (=> b!230703 m!252117))

(declare-fun m!252119 () Bool)

(assert (=> start!22134 m!252119))

(declare-fun m!252121 () Bool)

(assert (=> b!230704 m!252121))

(declare-fun m!252123 () Bool)

(assert (=> b!230704 m!252123))

(declare-fun m!252125 () Bool)

(assert (=> b!230704 m!252125))

(declare-fun m!252127 () Bool)

(assert (=> b!230716 m!252127))

(check-sat (not b!230706) (not bm!21435) (not bm!21434) (not b!230716) tp_is_empty!6063 (not b!230700) (not b_next!6201) (not b!230710) (not b!230717) (not start!22134) (not b!230704) b_and!13099 (not mapNonEmpty!10264) (not b!230705))
(check-sat b_and!13099 (not b_next!6201))
