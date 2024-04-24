; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21842 () Bool)

(assert start!21842)

(declare-fun b!219914 () Bool)

(declare-fun b_free!5905 () Bool)

(declare-fun b_next!5905 () Bool)

(assert (=> b!219914 (= b_free!5905 (not b_next!5905))))

(declare-fun tp!20856 () Bool)

(declare-fun b_and!12817 () Bool)

(assert (=> b!219914 (= tp!20856 b_and!12817)))

(declare-fun b!219909 () Bool)

(declare-fun res!107802 () Bool)

(declare-fun e!143017 () Bool)

(assert (=> b!219909 (=> (not res!107802) (not e!143017))))

(declare-datatypes ((V!7337 0))(
  ( (V!7338 (val!2928 Int)) )
))
(declare-datatypes ((ValueCell!2540 0))(
  ( (ValueCellFull!2540 (v!4949 V!7337)) (EmptyCell!2540) )
))
(declare-datatypes ((array!10775 0))(
  ( (array!10776 (arr!5107 (Array (_ BitVec 32) ValueCell!2540)) (size!5440 (_ BitVec 32))) )
))
(declare-datatypes ((array!10777 0))(
  ( (array!10778 (arr!5108 (Array (_ BitVec 32) (_ BitVec 64))) (size!5441 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2980 0))(
  ( (LongMapFixedSize!2981 (defaultEntry!4149 Int) (mask!9945 (_ BitVec 32)) (extraKeys!3886 (_ BitVec 32)) (zeroValue!3990 V!7337) (minValue!3990 V!7337) (_size!1539 (_ BitVec 32)) (_keys!6203 array!10777) (_values!4132 array!10775) (_vacant!1539 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2980)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219909 (= res!107802 (validMask!0 (mask!9945 thiss!1504)))))

(declare-fun b!219910 () Bool)

(declare-fun res!107805 () Bool)

(assert (=> b!219910 (=> (not res!107805) (not e!143017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10777 (_ BitVec 32)) Bool)

(assert (=> b!219910 (= res!107805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6203 thiss!1504) (mask!9945 thiss!1504)))))

(declare-fun b!219911 () Bool)

(assert (=> b!219911 (= e!143017 false)))

(declare-fun lt!112111 () Bool)

(declare-datatypes ((List!3165 0))(
  ( (Nil!3162) (Cons!3161 (h!3809 (_ BitVec 64)) (t!8116 List!3165)) )
))
(declare-fun arrayNoDuplicates!0 (array!10777 (_ BitVec 32) List!3165) Bool)

(assert (=> b!219911 (= lt!112111 (arrayNoDuplicates!0 (_keys!6203 thiss!1504) #b00000000000000000000000000000000 Nil!3162))))

(declare-fun b!219912 () Bool)

(declare-fun res!107801 () Bool)

(declare-fun e!143010 () Bool)

(assert (=> b!219912 (=> (not res!107801) (not e!143010))))

(declare-fun call!20538 () Bool)

(assert (=> b!219912 (= res!107801 call!20538)))

(declare-fun e!143013 () Bool)

(assert (=> b!219912 (= e!143013 e!143010)))

(declare-fun b!219913 () Bool)

(declare-fun res!107795 () Bool)

(declare-datatypes ((SeekEntryResult!778 0))(
  ( (MissingZero!778 (index!5282 (_ BitVec 32))) (Found!778 (index!5283 (_ BitVec 32))) (Intermediate!778 (undefined!1590 Bool) (index!5284 (_ BitVec 32)) (x!22902 (_ BitVec 32))) (Undefined!778) (MissingVacant!778 (index!5285 (_ BitVec 32))) )
))
(declare-fun lt!112108 () SeekEntryResult!778)

(assert (=> b!219913 (= res!107795 (= (select (arr!5108 (_keys!6203 thiss!1504)) (index!5285 lt!112108)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143021 () Bool)

(assert (=> b!219913 (=> (not res!107795) (not e!143021))))

(declare-fun e!143012 () Bool)

(declare-fun e!143020 () Bool)

(declare-fun tp_is_empty!5767 () Bool)

(declare-fun array_inv!3357 (array!10777) Bool)

(declare-fun array_inv!3358 (array!10775) Bool)

(assert (=> b!219914 (= e!143020 (and tp!20856 tp_is_empty!5767 (array_inv!3357 (_keys!6203 thiss!1504)) (array_inv!3358 (_values!4132 thiss!1504)) e!143012))))

(declare-fun res!107799 () Bool)

(declare-fun e!143011 () Bool)

(assert (=> start!21842 (=> (not res!107799) (not e!143011))))

(declare-fun valid!1217 (LongMapFixedSize!2980) Bool)

(assert (=> start!21842 (= res!107799 (valid!1217 thiss!1504))))

(assert (=> start!21842 e!143011))

(assert (=> start!21842 e!143020))

(assert (=> start!21842 true))

(declare-fun b!219915 () Bool)

(declare-fun e!143019 () Bool)

(declare-fun mapRes!9820 () Bool)

(assert (=> b!219915 (= e!143012 (and e!143019 mapRes!9820))))

(declare-fun condMapEmpty!9820 () Bool)

(declare-fun mapDefault!9820 () ValueCell!2540)

(assert (=> b!219915 (= condMapEmpty!9820 (= (arr!5107 (_values!4132 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2540)) mapDefault!9820)))))

(declare-fun b!219916 () Bool)

(declare-fun call!20537 () Bool)

(assert (=> b!219916 (= e!143021 (not call!20537))))

(declare-fun b!219917 () Bool)

(declare-fun e!143018 () Bool)

(assert (=> b!219917 (= e!143011 e!143018)))

(declare-fun res!107800 () Bool)

(assert (=> b!219917 (=> (not res!107800) (not e!143018))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!219917 (= res!107800 (or (= lt!112108 (MissingZero!778 index!297)) (= lt!112108 (MissingVacant!778 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10777 (_ BitVec 32)) SeekEntryResult!778)

(assert (=> b!219917 (= lt!112108 (seekEntryOrOpen!0 key!932 (_keys!6203 thiss!1504) (mask!9945 thiss!1504)))))

(declare-fun bm!20534 () Bool)

(declare-fun arrayContainsKey!0 (array!10777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20534 (= call!20537 (arrayContainsKey!0 (_keys!6203 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219918 () Bool)

(declare-fun res!107806 () Bool)

(assert (=> b!219918 (=> (not res!107806) (not e!143017))))

(assert (=> b!219918 (= res!107806 (and (= (size!5440 (_values!4132 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9945 thiss!1504))) (= (size!5441 (_keys!6203 thiss!1504)) (size!5440 (_values!4132 thiss!1504))) (bvsge (mask!9945 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3886 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3886 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!219919 () Bool)

(declare-fun res!107798 () Bool)

(assert (=> b!219919 (=> (not res!107798) (not e!143010))))

(assert (=> b!219919 (= res!107798 (= (select (arr!5108 (_keys!6203 thiss!1504)) (index!5282 lt!112108)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219920 () Bool)

(declare-datatypes ((Unit!6537 0))(
  ( (Unit!6538) )
))
(declare-fun e!143014 () Unit!6537)

(declare-fun Unit!6539 () Unit!6537)

(assert (=> b!219920 (= e!143014 Unit!6539)))

(declare-fun lt!112109 () Unit!6537)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!195 (array!10777 array!10775 (_ BitVec 32) (_ BitVec 32) V!7337 V!7337 (_ BitVec 64) Int) Unit!6537)

(assert (=> b!219920 (= lt!112109 (lemmaInListMapThenSeekEntryOrOpenFindsIt!195 (_keys!6203 thiss!1504) (_values!4132 thiss!1504) (mask!9945 thiss!1504) (extraKeys!3886 thiss!1504) (zeroValue!3990 thiss!1504) (minValue!3990 thiss!1504) key!932 (defaultEntry!4149 thiss!1504)))))

(assert (=> b!219920 false))

(declare-fun b!219921 () Bool)

(declare-fun e!143015 () Bool)

(assert (=> b!219921 (= e!143015 tp_is_empty!5767)))

(declare-fun mapNonEmpty!9820 () Bool)

(declare-fun tp!20857 () Bool)

(assert (=> mapNonEmpty!9820 (= mapRes!9820 (and tp!20857 e!143015))))

(declare-fun mapValue!9820 () ValueCell!2540)

(declare-fun mapRest!9820 () (Array (_ BitVec 32) ValueCell!2540))

(declare-fun mapKey!9820 () (_ BitVec 32))

(assert (=> mapNonEmpty!9820 (= (arr!5107 (_values!4132 thiss!1504)) (store mapRest!9820 mapKey!9820 mapValue!9820))))

(declare-fun b!219922 () Bool)

(declare-fun res!107797 () Bool)

(assert (=> b!219922 (=> (not res!107797) (not e!143011))))

(assert (=> b!219922 (= res!107797 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219923 () Bool)

(declare-fun res!107804 () Bool)

(assert (=> b!219923 (=> (not res!107804) (not e!143017))))

(assert (=> b!219923 (= res!107804 (arrayContainsKey!0 (_keys!6203 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219924 () Bool)

(assert (=> b!219924 (= e!143010 (not call!20537))))

(declare-fun b!219925 () Bool)

(declare-fun e!143016 () Bool)

(get-info :version)

(assert (=> b!219925 (= e!143016 ((_ is Undefined!778) lt!112108))))

(declare-fun b!219926 () Bool)

(declare-fun c!36619 () Bool)

(assert (=> b!219926 (= c!36619 ((_ is MissingVacant!778) lt!112108))))

(assert (=> b!219926 (= e!143013 e!143016)))

(declare-fun b!219927 () Bool)

(assert (=> b!219927 (= e!143018 e!143017)))

(declare-fun res!107796 () Bool)

(assert (=> b!219927 (=> (not res!107796) (not e!143017))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219927 (= res!107796 (inRange!0 index!297 (mask!9945 thiss!1504)))))

(declare-fun lt!112107 () Unit!6537)

(assert (=> b!219927 (= lt!112107 e!143014)))

(declare-fun c!36618 () Bool)

(declare-datatypes ((tuple2!4270 0))(
  ( (tuple2!4271 (_1!2146 (_ BitVec 64)) (_2!2146 V!7337)) )
))
(declare-datatypes ((List!3166 0))(
  ( (Nil!3163) (Cons!3162 (h!3810 tuple2!4270) (t!8117 List!3166)) )
))
(declare-datatypes ((ListLongMap!3185 0))(
  ( (ListLongMap!3186 (toList!1608 List!3166)) )
))
(declare-fun contains!1465 (ListLongMap!3185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1140 (array!10777 array!10775 (_ BitVec 32) (_ BitVec 32) V!7337 V!7337 (_ BitVec 32) Int) ListLongMap!3185)

(assert (=> b!219927 (= c!36618 (contains!1465 (getCurrentListMap!1140 (_keys!6203 thiss!1504) (_values!4132 thiss!1504) (mask!9945 thiss!1504) (extraKeys!3886 thiss!1504) (zeroValue!3990 thiss!1504) (minValue!3990 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4149 thiss!1504)) key!932))))

(declare-fun b!219928 () Bool)

(assert (=> b!219928 (= e!143019 tp_is_empty!5767)))

(declare-fun b!219929 () Bool)

(assert (=> b!219929 (= e!143016 e!143021)))

(declare-fun res!107803 () Bool)

(assert (=> b!219929 (= res!107803 call!20538)))

(assert (=> b!219929 (=> (not res!107803) (not e!143021))))

(declare-fun mapIsEmpty!9820 () Bool)

(assert (=> mapIsEmpty!9820 mapRes!9820))

(declare-fun c!36617 () Bool)

(declare-fun bm!20535 () Bool)

(assert (=> bm!20535 (= call!20538 (inRange!0 (ite c!36617 (index!5282 lt!112108) (index!5285 lt!112108)) (mask!9945 thiss!1504)))))

(declare-fun b!219930 () Bool)

(declare-fun lt!112110 () Unit!6537)

(assert (=> b!219930 (= e!143014 lt!112110)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!192 (array!10777 array!10775 (_ BitVec 32) (_ BitVec 32) V!7337 V!7337 (_ BitVec 64) Int) Unit!6537)

(assert (=> b!219930 (= lt!112110 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!192 (_keys!6203 thiss!1504) (_values!4132 thiss!1504) (mask!9945 thiss!1504) (extraKeys!3886 thiss!1504) (zeroValue!3990 thiss!1504) (minValue!3990 thiss!1504) key!932 (defaultEntry!4149 thiss!1504)))))

(assert (=> b!219930 (= c!36617 ((_ is MissingZero!778) lt!112108))))

(assert (=> b!219930 e!143013))

(assert (= (and start!21842 res!107799) b!219922))

(assert (= (and b!219922 res!107797) b!219917))

(assert (= (and b!219917 res!107800) b!219927))

(assert (= (and b!219927 c!36618) b!219920))

(assert (= (and b!219927 (not c!36618)) b!219930))

(assert (= (and b!219930 c!36617) b!219912))

(assert (= (and b!219930 (not c!36617)) b!219926))

(assert (= (and b!219912 res!107801) b!219919))

(assert (= (and b!219919 res!107798) b!219924))

(assert (= (and b!219926 c!36619) b!219929))

(assert (= (and b!219926 (not c!36619)) b!219925))

(assert (= (and b!219929 res!107803) b!219913))

(assert (= (and b!219913 res!107795) b!219916))

(assert (= (or b!219912 b!219929) bm!20535))

(assert (= (or b!219924 b!219916) bm!20534))

(assert (= (and b!219927 res!107796) b!219923))

(assert (= (and b!219923 res!107804) b!219909))

(assert (= (and b!219909 res!107802) b!219918))

(assert (= (and b!219918 res!107806) b!219910))

(assert (= (and b!219910 res!107805) b!219911))

(assert (= (and b!219915 condMapEmpty!9820) mapIsEmpty!9820))

(assert (= (and b!219915 (not condMapEmpty!9820)) mapNonEmpty!9820))

(assert (= (and mapNonEmpty!9820 ((_ is ValueCellFull!2540) mapValue!9820)) b!219921))

(assert (= (and b!219915 ((_ is ValueCellFull!2540) mapDefault!9820)) b!219928))

(assert (= b!219914 b!219915))

(assert (= start!21842 b!219914))

(declare-fun m!245449 () Bool)

(assert (=> b!219909 m!245449))

(declare-fun m!245451 () Bool)

(assert (=> b!219914 m!245451))

(declare-fun m!245453 () Bool)

(assert (=> b!219914 m!245453))

(declare-fun m!245455 () Bool)

(assert (=> b!219917 m!245455))

(declare-fun m!245457 () Bool)

(assert (=> b!219930 m!245457))

(declare-fun m!245459 () Bool)

(assert (=> start!21842 m!245459))

(declare-fun m!245461 () Bool)

(assert (=> b!219911 m!245461))

(declare-fun m!245463 () Bool)

(assert (=> mapNonEmpty!9820 m!245463))

(declare-fun m!245465 () Bool)

(assert (=> b!219919 m!245465))

(declare-fun m!245467 () Bool)

(assert (=> b!219910 m!245467))

(declare-fun m!245469 () Bool)

(assert (=> b!219927 m!245469))

(declare-fun m!245471 () Bool)

(assert (=> b!219927 m!245471))

(assert (=> b!219927 m!245471))

(declare-fun m!245473 () Bool)

(assert (=> b!219927 m!245473))

(declare-fun m!245475 () Bool)

(assert (=> bm!20534 m!245475))

(declare-fun m!245477 () Bool)

(assert (=> bm!20535 m!245477))

(declare-fun m!245479 () Bool)

(assert (=> b!219913 m!245479))

(declare-fun m!245481 () Bool)

(assert (=> b!219920 m!245481))

(assert (=> b!219923 m!245475))

(check-sat b_and!12817 (not b!219930) (not b!219920) (not b!219909) (not b!219917) (not b!219910) (not b!219923) (not b!219927) (not bm!20534) (not b_next!5905) tp_is_empty!5767 (not b!219911) (not b!219914) (not bm!20535) (not mapNonEmpty!9820) (not start!21842))
(check-sat b_and!12817 (not b_next!5905))
