; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22022 () Bool)

(assert start!22022)

(declare-fun b!226915 () Bool)

(declare-fun b_free!6085 () Bool)

(declare-fun b_next!6085 () Bool)

(assert (=> b!226915 (= b_free!6085 (not b_next!6085))))

(declare-fun tp!21396 () Bool)

(declare-fun b_and!12997 () Bool)

(assert (=> b!226915 (= tp!21396 b_and!12997)))

(declare-fun bm!21074 () Bool)

(declare-fun call!21078 () Bool)

(declare-datatypes ((V!7577 0))(
  ( (V!7578 (val!3018 Int)) )
))
(declare-datatypes ((ValueCell!2630 0))(
  ( (ValueCellFull!2630 (v!5039 V!7577)) (EmptyCell!2630) )
))
(declare-datatypes ((array!11135 0))(
  ( (array!11136 (arr!5287 (Array (_ BitVec 32) ValueCell!2630)) (size!5620 (_ BitVec 32))) )
))
(declare-datatypes ((array!11137 0))(
  ( (array!11138 (arr!5288 (Array (_ BitVec 32) (_ BitVec 64))) (size!5621 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3160 0))(
  ( (LongMapFixedSize!3161 (defaultEntry!4239 Int) (mask!10095 (_ BitVec 32)) (extraKeys!3976 (_ BitVec 32)) (zeroValue!4080 V!7577) (minValue!4080 V!7577) (_size!1629 (_ BitVec 32)) (_keys!6293 array!11137) (_values!4222 array!11135) (_vacant!1629 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3160)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21074 (= call!21078 (arrayContainsKey!0 (_keys!6293 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226895 () Bool)

(declare-fun c!37618 () Bool)

(declare-datatypes ((SeekEntryResult!857 0))(
  ( (MissingZero!857 (index!5598 (_ BitVec 32))) (Found!857 (index!5599 (_ BitVec 32))) (Intermediate!857 (undefined!1669 Bool) (index!5600 (_ BitVec 32)) (x!23221 (_ BitVec 32))) (Undefined!857) (MissingVacant!857 (index!5601 (_ BitVec 32))) )
))
(declare-fun lt!114226 () SeekEntryResult!857)

(get-info :version)

(assert (=> b!226895 (= c!37618 ((_ is MissingVacant!857) lt!114226))))

(declare-fun e!147194 () Bool)

(declare-fun e!147197 () Bool)

(assert (=> b!226895 (= e!147194 e!147197)))

(declare-fun b!226896 () Bool)

(declare-fun e!147192 () Bool)

(declare-fun tp_is_empty!5947 () Bool)

(assert (=> b!226896 (= e!147192 tp_is_empty!5947)))

(declare-fun b!226897 () Bool)

(declare-fun res!111708 () Bool)

(assert (=> b!226897 (= res!111708 (= (select (arr!5288 (_keys!6293 thiss!1504)) (index!5601 lt!114226)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147196 () Bool)

(assert (=> b!226897 (=> (not res!111708) (not e!147196))))

(declare-fun b!226898 () Bool)

(declare-fun e!147202 () Bool)

(declare-fun e!147195 () Bool)

(assert (=> b!226898 (= e!147202 e!147195)))

(declare-fun res!111704 () Bool)

(assert (=> b!226898 (=> (not res!111704) (not e!147195))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226898 (= res!111704 (inRange!0 index!297 (mask!10095 thiss!1504)))))

(declare-datatypes ((Unit!6841 0))(
  ( (Unit!6842) )
))
(declare-fun lt!114227 () Unit!6841)

(declare-fun e!147193 () Unit!6841)

(assert (=> b!226898 (= lt!114227 e!147193)))

(declare-fun c!37619 () Bool)

(declare-datatypes ((tuple2!4382 0))(
  ( (tuple2!4383 (_1!2202 (_ BitVec 64)) (_2!2202 V!7577)) )
))
(declare-datatypes ((List!3293 0))(
  ( (Nil!3290) (Cons!3289 (h!3937 tuple2!4382) (t!8244 List!3293)) )
))
(declare-datatypes ((ListLongMap!3297 0))(
  ( (ListLongMap!3298 (toList!1664 List!3293)) )
))
(declare-fun contains!1553 (ListLongMap!3297 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1196 (array!11137 array!11135 (_ BitVec 32) (_ BitVec 32) V!7577 V!7577 (_ BitVec 32) Int) ListLongMap!3297)

(assert (=> b!226898 (= c!37619 (contains!1553 (getCurrentListMap!1196 (_keys!6293 thiss!1504) (_values!4222 thiss!1504) (mask!10095 thiss!1504) (extraKeys!3976 thiss!1504) (zeroValue!4080 thiss!1504) (minValue!4080 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4239 thiss!1504)) key!932))))

(declare-fun b!226899 () Bool)

(declare-fun Unit!6843 () Unit!6841)

(assert (=> b!226899 (= e!147193 Unit!6843)))

(declare-fun lt!114231 () Unit!6841)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!260 (array!11137 array!11135 (_ BitVec 32) (_ BitVec 32) V!7577 V!7577 (_ BitVec 64) Int) Unit!6841)

(assert (=> b!226899 (= lt!114231 (lemmaInListMapThenSeekEntryOrOpenFindsIt!260 (_keys!6293 thiss!1504) (_values!4222 thiss!1504) (mask!10095 thiss!1504) (extraKeys!3976 thiss!1504) (zeroValue!4080 thiss!1504) (minValue!4080 thiss!1504) key!932 (defaultEntry!4239 thiss!1504)))))

(assert (=> b!226899 false))

(declare-fun b!226900 () Bool)

(declare-fun e!147190 () Bool)

(assert (=> b!226900 (= e!147195 (not e!147190))))

(declare-fun res!111706 () Bool)

(assert (=> b!226900 (=> res!111706 e!147190)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226900 (= res!111706 (not (validMask!0 (mask!10095 thiss!1504))))))

(declare-fun lt!114230 () array!11137)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11137 (_ BitVec 32)) Bool)

(assert (=> b!226900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114230 (mask!10095 thiss!1504))))

(declare-fun lt!114235 () Unit!6841)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11137 (_ BitVec 32) (_ BitVec 32)) Unit!6841)

(assert (=> b!226900 (= lt!114235 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6293 thiss!1504) index!297 (mask!10095 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11137 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226900 (= (arrayCountValidKeys!0 lt!114230 #b00000000000000000000000000000000 (size!5621 (_keys!6293 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6293 thiss!1504) #b00000000000000000000000000000000 (size!5621 (_keys!6293 thiss!1504)))))))

(declare-fun lt!114229 () Unit!6841)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11137 (_ BitVec 32) (_ BitVec 64)) Unit!6841)

(assert (=> b!226900 (= lt!114229 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6293 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3294 0))(
  ( (Nil!3291) (Cons!3290 (h!3938 (_ BitVec 64)) (t!8245 List!3294)) )
))
(declare-fun arrayNoDuplicates!0 (array!11137 (_ BitVec 32) List!3294) Bool)

(assert (=> b!226900 (arrayNoDuplicates!0 lt!114230 #b00000000000000000000000000000000 Nil!3291)))

(assert (=> b!226900 (= lt!114230 (array!11138 (store (arr!5288 (_keys!6293 thiss!1504)) index!297 key!932) (size!5621 (_keys!6293 thiss!1504))))))

(declare-fun lt!114228 () Unit!6841)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11137 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3294) Unit!6841)

(assert (=> b!226900 (= lt!114228 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6293 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3291))))

(declare-fun lt!114225 () Unit!6841)

(declare-fun e!147199 () Unit!6841)

(assert (=> b!226900 (= lt!114225 e!147199)))

(declare-fun c!37620 () Bool)

(assert (=> b!226900 (= c!37620 (arrayContainsKey!0 (_keys!6293 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226901 () Bool)

(declare-fun lt!114234 () Unit!6841)

(assert (=> b!226901 (= e!147193 lt!114234)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!249 (array!11137 array!11135 (_ BitVec 32) (_ BitVec 32) V!7577 V!7577 (_ BitVec 64) Int) Unit!6841)

(assert (=> b!226901 (= lt!114234 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!249 (_keys!6293 thiss!1504) (_values!4222 thiss!1504) (mask!10095 thiss!1504) (extraKeys!3976 thiss!1504) (zeroValue!4080 thiss!1504) (minValue!4080 thiss!1504) key!932 (defaultEntry!4239 thiss!1504)))))

(declare-fun c!37621 () Bool)

(assert (=> b!226901 (= c!37621 ((_ is MissingZero!857) lt!114226))))

(assert (=> b!226901 e!147194))

(declare-fun b!226902 () Bool)

(assert (=> b!226902 (= e!147196 (not call!21078))))

(declare-fun call!21077 () Bool)

(declare-fun bm!21075 () Bool)

(assert (=> bm!21075 (= call!21077 (inRange!0 (ite c!37621 (index!5598 lt!114226) (index!5601 lt!114226)) (mask!10095 thiss!1504)))))

(declare-fun b!226903 () Bool)

(assert (=> b!226903 (= e!147190 true)))

(declare-fun lt!114232 () Bool)

(assert (=> b!226903 (= lt!114232 (arrayNoDuplicates!0 (_keys!6293 thiss!1504) #b00000000000000000000000000000000 Nil!3291))))

(declare-fun b!226904 () Bool)

(declare-fun e!147201 () Bool)

(assert (=> b!226904 (= e!147201 (not call!21078))))

(declare-fun b!226905 () Bool)

(declare-fun e!147203 () Bool)

(declare-fun mapRes!10090 () Bool)

(assert (=> b!226905 (= e!147203 (and e!147192 mapRes!10090))))

(declare-fun condMapEmpty!10090 () Bool)

(declare-fun mapDefault!10090 () ValueCell!2630)

(assert (=> b!226905 (= condMapEmpty!10090 (= (arr!5287 (_values!4222 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2630)) mapDefault!10090)))))

(declare-fun b!226906 () Bool)

(declare-fun res!111702 () Bool)

(assert (=> b!226906 (=> (not res!111702) (not e!147201))))

(assert (=> b!226906 (= res!111702 (= (select (arr!5288 (_keys!6293 thiss!1504)) (index!5598 lt!114226)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226907 () Bool)

(declare-fun e!147189 () Bool)

(assert (=> b!226907 (= e!147189 tp_is_empty!5947)))

(declare-fun b!226908 () Bool)

(declare-fun res!111701 () Bool)

(assert (=> b!226908 (=> res!111701 e!147190)))

(assert (=> b!226908 (= res!111701 (or (not (= (size!5620 (_values!4222 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10095 thiss!1504)))) (not (= (size!5621 (_keys!6293 thiss!1504)) (size!5620 (_values!4222 thiss!1504)))) (bvslt (mask!10095 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3976 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3976 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!226909 () Bool)

(assert (=> b!226909 (= e!147197 e!147196)))

(declare-fun res!111709 () Bool)

(assert (=> b!226909 (= res!111709 call!21077)))

(assert (=> b!226909 (=> (not res!111709) (not e!147196))))

(declare-fun b!226910 () Bool)

(declare-fun Unit!6844 () Unit!6841)

(assert (=> b!226910 (= e!147199 Unit!6844)))

(declare-fun b!226911 () Bool)

(declare-fun e!147198 () Bool)

(assert (=> b!226911 (= e!147198 e!147202)))

(declare-fun res!111703 () Bool)

(assert (=> b!226911 (=> (not res!111703) (not e!147202))))

(assert (=> b!226911 (= res!111703 (or (= lt!114226 (MissingZero!857 index!297)) (= lt!114226 (MissingVacant!857 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11137 (_ BitVec 32)) SeekEntryResult!857)

(assert (=> b!226911 (= lt!114226 (seekEntryOrOpen!0 key!932 (_keys!6293 thiss!1504) (mask!10095 thiss!1504)))))

(declare-fun b!226912 () Bool)

(declare-fun Unit!6845 () Unit!6841)

(assert (=> b!226912 (= e!147199 Unit!6845)))

(declare-fun lt!114233 () Unit!6841)

(declare-fun lemmaArrayContainsKeyThenInListMap!97 (array!11137 array!11135 (_ BitVec 32) (_ BitVec 32) V!7577 V!7577 (_ BitVec 64) (_ BitVec 32) Int) Unit!6841)

(assert (=> b!226912 (= lt!114233 (lemmaArrayContainsKeyThenInListMap!97 (_keys!6293 thiss!1504) (_values!4222 thiss!1504) (mask!10095 thiss!1504) (extraKeys!3976 thiss!1504) (zeroValue!4080 thiss!1504) (minValue!4080 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4239 thiss!1504)))))

(assert (=> b!226912 false))

(declare-fun b!226913 () Bool)

(declare-fun res!111707 () Bool)

(assert (=> b!226913 (=> (not res!111707) (not e!147198))))

(assert (=> b!226913 (= res!111707 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226914 () Bool)

(declare-fun res!111699 () Bool)

(assert (=> b!226914 (=> res!111699 e!147190)))

(assert (=> b!226914 (= res!111699 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6293 thiss!1504) (mask!10095 thiss!1504))))))

(declare-fun mapIsEmpty!10090 () Bool)

(assert (=> mapIsEmpty!10090 mapRes!10090))

(declare-fun e!147191 () Bool)

(declare-fun array_inv!3469 (array!11137) Bool)

(declare-fun array_inv!3470 (array!11135) Bool)

(assert (=> b!226915 (= e!147191 (and tp!21396 tp_is_empty!5947 (array_inv!3469 (_keys!6293 thiss!1504)) (array_inv!3470 (_values!4222 thiss!1504)) e!147203))))

(declare-fun b!226916 () Bool)

(assert (=> b!226916 (= e!147197 ((_ is Undefined!857) lt!114226))))

(declare-fun b!226917 () Bool)

(declare-fun res!111700 () Bool)

(assert (=> b!226917 (=> (not res!111700) (not e!147201))))

(assert (=> b!226917 (= res!111700 call!21077)))

(assert (=> b!226917 (= e!147194 e!147201)))

(declare-fun res!111705 () Bool)

(assert (=> start!22022 (=> (not res!111705) (not e!147198))))

(declare-fun valid!1273 (LongMapFixedSize!3160) Bool)

(assert (=> start!22022 (= res!111705 (valid!1273 thiss!1504))))

(assert (=> start!22022 e!147198))

(assert (=> start!22022 e!147191))

(assert (=> start!22022 true))

(declare-fun mapNonEmpty!10090 () Bool)

(declare-fun tp!21397 () Bool)

(assert (=> mapNonEmpty!10090 (= mapRes!10090 (and tp!21397 e!147189))))

(declare-fun mapRest!10090 () (Array (_ BitVec 32) ValueCell!2630))

(declare-fun mapKey!10090 () (_ BitVec 32))

(declare-fun mapValue!10090 () ValueCell!2630)

(assert (=> mapNonEmpty!10090 (= (arr!5287 (_values!4222 thiss!1504)) (store mapRest!10090 mapKey!10090 mapValue!10090))))

(assert (= (and start!22022 res!111705) b!226913))

(assert (= (and b!226913 res!111707) b!226911))

(assert (= (and b!226911 res!111703) b!226898))

(assert (= (and b!226898 c!37619) b!226899))

(assert (= (and b!226898 (not c!37619)) b!226901))

(assert (= (and b!226901 c!37621) b!226917))

(assert (= (and b!226901 (not c!37621)) b!226895))

(assert (= (and b!226917 res!111700) b!226906))

(assert (= (and b!226906 res!111702) b!226904))

(assert (= (and b!226895 c!37618) b!226909))

(assert (= (and b!226895 (not c!37618)) b!226916))

(assert (= (and b!226909 res!111709) b!226897))

(assert (= (and b!226897 res!111708) b!226902))

(assert (= (or b!226917 b!226909) bm!21075))

(assert (= (or b!226904 b!226902) bm!21074))

(assert (= (and b!226898 res!111704) b!226900))

(assert (= (and b!226900 c!37620) b!226912))

(assert (= (and b!226900 (not c!37620)) b!226910))

(assert (= (and b!226900 (not res!111706)) b!226908))

(assert (= (and b!226908 (not res!111701)) b!226914))

(assert (= (and b!226914 (not res!111699)) b!226903))

(assert (= (and b!226905 condMapEmpty!10090) mapIsEmpty!10090))

(assert (= (and b!226905 (not condMapEmpty!10090)) mapNonEmpty!10090))

(assert (= (and mapNonEmpty!10090 ((_ is ValueCellFull!2630) mapValue!10090)) b!226907))

(assert (= (and b!226905 ((_ is ValueCellFull!2630) mapDefault!10090)) b!226896))

(assert (= b!226915 b!226905))

(assert (= start!22022 b!226915))

(declare-fun m!249181 () Bool)

(assert (=> bm!21075 m!249181))

(declare-fun m!249183 () Bool)

(assert (=> bm!21074 m!249183))

(declare-fun m!249185 () Bool)

(assert (=> mapNonEmpty!10090 m!249185))

(declare-fun m!249187 () Bool)

(assert (=> b!226914 m!249187))

(declare-fun m!249189 () Bool)

(assert (=> b!226915 m!249189))

(declare-fun m!249191 () Bool)

(assert (=> b!226915 m!249191))

(declare-fun m!249193 () Bool)

(assert (=> b!226911 m!249193))

(declare-fun m!249195 () Bool)

(assert (=> b!226906 m!249195))

(assert (=> b!226900 m!249183))

(declare-fun m!249197 () Bool)

(assert (=> b!226900 m!249197))

(declare-fun m!249199 () Bool)

(assert (=> b!226900 m!249199))

(declare-fun m!249201 () Bool)

(assert (=> b!226900 m!249201))

(declare-fun m!249203 () Bool)

(assert (=> b!226900 m!249203))

(declare-fun m!249205 () Bool)

(assert (=> b!226900 m!249205))

(declare-fun m!249207 () Bool)

(assert (=> b!226900 m!249207))

(declare-fun m!249209 () Bool)

(assert (=> b!226900 m!249209))

(declare-fun m!249211 () Bool)

(assert (=> b!226900 m!249211))

(declare-fun m!249213 () Bool)

(assert (=> b!226900 m!249213))

(declare-fun m!249215 () Bool)

(assert (=> b!226903 m!249215))

(declare-fun m!249217 () Bool)

(assert (=> b!226912 m!249217))

(declare-fun m!249219 () Bool)

(assert (=> b!226901 m!249219))

(declare-fun m!249221 () Bool)

(assert (=> b!226898 m!249221))

(declare-fun m!249223 () Bool)

(assert (=> b!226898 m!249223))

(assert (=> b!226898 m!249223))

(declare-fun m!249225 () Bool)

(assert (=> b!226898 m!249225))

(declare-fun m!249227 () Bool)

(assert (=> b!226897 m!249227))

(declare-fun m!249229 () Bool)

(assert (=> start!22022 m!249229))

(declare-fun m!249231 () Bool)

(assert (=> b!226899 m!249231))

(check-sat (not b!226901) (not b!226900) (not bm!21075) (not b_next!6085) (not b!226899) (not b!226914) (not mapNonEmpty!10090) b_and!12997 (not b!226912) (not b!226903) (not b!226911) tp_is_empty!5947 (not b!226915) (not bm!21074) (not start!22022) (not b!226898))
(check-sat b_and!12997 (not b_next!6085))
