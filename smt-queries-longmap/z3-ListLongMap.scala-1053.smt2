; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22004 () Bool)

(assert start!22004)

(declare-fun b!226043 () Bool)

(declare-fun b_free!6067 () Bool)

(declare-fun b_next!6067 () Bool)

(assert (=> b!226043 (= b_free!6067 (not b_next!6067))))

(declare-fun tp!21343 () Bool)

(declare-fun b_and!12939 () Bool)

(assert (=> b!226043 (= tp!21343 b_and!12939)))

(declare-fun b!226030 () Bool)

(declare-fun res!111243 () Bool)

(declare-datatypes ((V!7553 0))(
  ( (V!7554 (val!3009 Int)) )
))
(declare-datatypes ((ValueCell!2621 0))(
  ( (ValueCellFull!2621 (v!5023 V!7553)) (EmptyCell!2621) )
))
(declare-datatypes ((array!11093 0))(
  ( (array!11094 (arr!5265 (Array (_ BitVec 32) ValueCell!2621)) (size!5599 (_ BitVec 32))) )
))
(declare-datatypes ((array!11095 0))(
  ( (array!11096 (arr!5266 (Array (_ BitVec 32) (_ BitVec 64))) (size!5600 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3142 0))(
  ( (LongMapFixedSize!3143 (defaultEntry!4230 Int) (mask!10079 (_ BitVec 32)) (extraKeys!3967 (_ BitVec 32)) (zeroValue!4071 V!7553) (minValue!4071 V!7553) (_size!1620 (_ BitVec 32)) (_keys!6283 array!11095) (_values!4213 array!11093) (_vacant!1620 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3142)

(declare-datatypes ((SeekEntryResult!877 0))(
  ( (MissingZero!877 (index!5678 (_ BitVec 32))) (Found!877 (index!5679 (_ BitVec 32))) (Intermediate!877 (undefined!1689 Bool) (index!5680 (_ BitVec 32)) (x!23216 (_ BitVec 32))) (Undefined!877) (MissingVacant!877 (index!5681 (_ BitVec 32))) )
))
(declare-fun lt!113691 () SeekEntryResult!877)

(assert (=> b!226030 (= res!111243 (= (select (arr!5266 (_keys!6283 thiss!1504)) (index!5681 lt!113691)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146659 () Bool)

(assert (=> b!226030 (=> (not res!111243) (not e!146659))))

(declare-fun b!226031 () Bool)

(declare-fun e!146672 () Bool)

(declare-fun e!146671 () Bool)

(assert (=> b!226031 (= e!146672 (not e!146671))))

(declare-fun res!111241 () Bool)

(assert (=> b!226031 (=> res!111241 e!146671)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226031 (= res!111241 (not (validMask!0 (mask!10079 thiss!1504))))))

(declare-fun lt!113698 () array!11095)

(declare-fun arrayCountValidKeys!0 (array!11095 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226031 (= (arrayCountValidKeys!0 lt!113698 #b00000000000000000000000000000000 (size!5600 (_keys!6283 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6283 thiss!1504) #b00000000000000000000000000000000 (size!5600 (_keys!6283 thiss!1504)))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((Unit!6785 0))(
  ( (Unit!6786) )
))
(declare-fun lt!113689 () Unit!6785)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11095 (_ BitVec 32) (_ BitVec 64)) Unit!6785)

(assert (=> b!226031 (= lt!113689 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6283 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3354 0))(
  ( (Nil!3351) (Cons!3350 (h!3998 (_ BitVec 64)) (t!8304 List!3354)) )
))
(declare-fun arrayNoDuplicates!0 (array!11095 (_ BitVec 32) List!3354) Bool)

(assert (=> b!226031 (arrayNoDuplicates!0 lt!113698 #b00000000000000000000000000000000 Nil!3351)))

(assert (=> b!226031 (= lt!113698 (array!11096 (store (arr!5266 (_keys!6283 thiss!1504)) index!297 key!932) (size!5600 (_keys!6283 thiss!1504))))))

(declare-fun lt!113696 () Unit!6785)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11095 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3354) Unit!6785)

(assert (=> b!226031 (= lt!113696 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6283 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3351))))

(declare-fun lt!113695 () Unit!6785)

(declare-fun e!146670 () Unit!6785)

(assert (=> b!226031 (= lt!113695 e!146670)))

(declare-fun c!37474 () Bool)

(declare-fun lt!113690 () Bool)

(assert (=> b!226031 (= c!37474 lt!113690)))

(declare-fun arrayContainsKey!0 (array!11095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226031 (= lt!113690 (arrayContainsKey!0 (_keys!6283 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226032 () Bool)

(declare-fun res!111242 () Bool)

(assert (=> b!226032 (=> res!111242 e!146671)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11095 (_ BitVec 32)) Bool)

(assert (=> b!226032 (= res!111242 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6283 thiss!1504) (mask!10079 thiss!1504))))))

(declare-fun b!226033 () Bool)

(declare-fun c!37471 () Bool)

(get-info :version)

(assert (=> b!226033 (= c!37471 ((_ is MissingVacant!877) lt!113691))))

(declare-fun e!146668 () Bool)

(declare-fun e!146666 () Bool)

(assert (=> b!226033 (= e!146668 e!146666)))

(declare-fun mapIsEmpty!10063 () Bool)

(declare-fun mapRes!10063 () Bool)

(assert (=> mapIsEmpty!10063 mapRes!10063))

(declare-fun res!111247 () Bool)

(declare-fun e!146673 () Bool)

(assert (=> start!22004 (=> (not res!111247) (not e!146673))))

(declare-fun valid!1275 (LongMapFixedSize!3142) Bool)

(assert (=> start!22004 (= res!111247 (valid!1275 thiss!1504))))

(assert (=> start!22004 e!146673))

(declare-fun e!146663 () Bool)

(assert (=> start!22004 e!146663))

(assert (=> start!22004 true))

(declare-fun b!226034 () Bool)

(declare-fun e!146662 () Bool)

(assert (=> b!226034 (= e!146673 e!146662)))

(declare-fun res!111245 () Bool)

(assert (=> b!226034 (=> (not res!111245) (not e!146662))))

(assert (=> b!226034 (= res!111245 (or (= lt!113691 (MissingZero!877 index!297)) (= lt!113691 (MissingVacant!877 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11095 (_ BitVec 32)) SeekEntryResult!877)

(assert (=> b!226034 (= lt!113691 (seekEntryOrOpen!0 key!932 (_keys!6283 thiss!1504) (mask!10079 thiss!1504)))))

(declare-fun b!226035 () Bool)

(declare-fun e!146669 () Bool)

(declare-fun e!146661 () Bool)

(assert (=> b!226035 (= e!146669 (and e!146661 mapRes!10063))))

(declare-fun condMapEmpty!10063 () Bool)

(declare-fun mapDefault!10063 () ValueCell!2621)

(assert (=> b!226035 (= condMapEmpty!10063 (= (arr!5265 (_values!4213 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2621)) mapDefault!10063)))))

(declare-fun b!226036 () Bool)

(declare-fun Unit!6787 () Unit!6785)

(assert (=> b!226036 (= e!146670 Unit!6787)))

(declare-fun b!226037 () Bool)

(declare-fun e!146660 () Bool)

(declare-fun call!21012 () Bool)

(assert (=> b!226037 (= e!146660 (not call!21012))))

(declare-fun b!226038 () Bool)

(assert (=> b!226038 (= e!146659 (not call!21012))))

(declare-fun b!226039 () Bool)

(declare-fun Unit!6788 () Unit!6785)

(assert (=> b!226039 (= e!146670 Unit!6788)))

(declare-fun lt!113693 () Unit!6785)

(declare-fun lemmaArrayContainsKeyThenInListMap!91 (array!11095 array!11093 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 64) (_ BitVec 32) Int) Unit!6785)

(assert (=> b!226039 (= lt!113693 (lemmaArrayContainsKeyThenInListMap!91 (_keys!6283 thiss!1504) (_values!4213 thiss!1504) (mask!10079 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4230 thiss!1504)))))

(assert (=> b!226039 false))

(declare-fun b!226040 () Bool)

(declare-fun res!111239 () Bool)

(assert (=> b!226040 (=> res!111239 e!146671)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226040 (= res!111239 (not (validKeyInArray!0 key!932)))))

(declare-fun b!226041 () Bool)

(declare-fun e!146664 () Bool)

(declare-fun tp_is_empty!5929 () Bool)

(assert (=> b!226041 (= e!146664 tp_is_empty!5929)))

(declare-fun b!226042 () Bool)

(assert (=> b!226042 (= e!146662 e!146672)))

(declare-fun res!111236 () Bool)

(assert (=> b!226042 (=> (not res!111236) (not e!146672))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!226042 (= res!111236 (inRange!0 index!297 (mask!10079 thiss!1504)))))

(declare-fun lt!113697 () Unit!6785)

(declare-fun e!146665 () Unit!6785)

(assert (=> b!226042 (= lt!113697 e!146665)))

(declare-fun c!37472 () Bool)

(declare-datatypes ((tuple2!4426 0))(
  ( (tuple2!4427 (_1!2224 (_ BitVec 64)) (_2!2224 V!7553)) )
))
(declare-datatypes ((List!3355 0))(
  ( (Nil!3352) (Cons!3351 (h!3999 tuple2!4426) (t!8305 List!3355)) )
))
(declare-datatypes ((ListLongMap!3329 0))(
  ( (ListLongMap!3330 (toList!1680 List!3355)) )
))
(declare-fun contains!1555 (ListLongMap!3329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1189 (array!11095 array!11093 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 32) Int) ListLongMap!3329)

(assert (=> b!226042 (= c!37472 (contains!1555 (getCurrentListMap!1189 (_keys!6283 thiss!1504) (_values!4213 thiss!1504) (mask!10079 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4230 thiss!1504)) key!932))))

(declare-fun array_inv!3473 (array!11095) Bool)

(declare-fun array_inv!3474 (array!11093) Bool)

(assert (=> b!226043 (= e!146663 (and tp!21343 tp_is_empty!5929 (array_inv!3473 (_keys!6283 thiss!1504)) (array_inv!3474 (_values!4213 thiss!1504)) e!146669))))

(declare-fun b!226044 () Bool)

(declare-fun res!111240 () Bool)

(assert (=> b!226044 (=> (not res!111240) (not e!146660))))

(assert (=> b!226044 (= res!111240 (= (select (arr!5266 (_keys!6283 thiss!1504)) (index!5678 lt!113691)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!21011 () Bool)

(declare-fun bm!21008 () Bool)

(declare-fun c!37473 () Bool)

(assert (=> bm!21008 (= call!21011 (inRange!0 (ite c!37473 (index!5678 lt!113691) (index!5681 lt!113691)) (mask!10079 thiss!1504)))))

(declare-fun mapNonEmpty!10063 () Bool)

(declare-fun tp!21342 () Bool)

(assert (=> mapNonEmpty!10063 (= mapRes!10063 (and tp!21342 e!146664))))

(declare-fun mapKey!10063 () (_ BitVec 32))

(declare-fun mapRest!10063 () (Array (_ BitVec 32) ValueCell!2621))

(declare-fun mapValue!10063 () ValueCell!2621)

(assert (=> mapNonEmpty!10063 (= (arr!5265 (_values!4213 thiss!1504)) (store mapRest!10063 mapKey!10063 mapValue!10063))))

(declare-fun b!226045 () Bool)

(declare-fun res!111246 () Bool)

(assert (=> b!226045 (=> (not res!111246) (not e!146673))))

(assert (=> b!226045 (= res!111246 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21009 () Bool)

(assert (=> bm!21009 (= call!21012 (arrayContainsKey!0 (_keys!6283 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226046 () Bool)

(declare-fun res!111244 () Bool)

(assert (=> b!226046 (=> res!111244 e!146671)))

(assert (=> b!226046 (= res!111244 (or (not (= (size!5600 (_keys!6283 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10079 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5600 (_keys!6283 thiss!1504)))))))

(declare-fun b!226047 () Bool)

(declare-fun res!111238 () Bool)

(assert (=> b!226047 (=> res!111238 e!146671)))

(assert (=> b!226047 (= res!111238 lt!113690)))

(declare-fun b!226048 () Bool)

(assert (=> b!226048 (= e!146666 ((_ is Undefined!877) lt!113691))))

(declare-fun b!226049 () Bool)

(declare-fun Unit!6789 () Unit!6785)

(assert (=> b!226049 (= e!146665 Unit!6789)))

(declare-fun lt!113694 () Unit!6785)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!249 (array!11095 array!11093 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 64) Int) Unit!6785)

(assert (=> b!226049 (= lt!113694 (lemmaInListMapThenSeekEntryOrOpenFindsIt!249 (_keys!6283 thiss!1504) (_values!4213 thiss!1504) (mask!10079 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) key!932 (defaultEntry!4230 thiss!1504)))))

(assert (=> b!226049 false))

(declare-fun b!226050 () Bool)

(declare-fun lt!113688 () Unit!6785)

(assert (=> b!226050 (= e!146665 lt!113688)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!247 (array!11095 array!11093 (_ BitVec 32) (_ BitVec 32) V!7553 V!7553 (_ BitVec 64) Int) Unit!6785)

(assert (=> b!226050 (= lt!113688 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!247 (_keys!6283 thiss!1504) (_values!4213 thiss!1504) (mask!10079 thiss!1504) (extraKeys!3967 thiss!1504) (zeroValue!4071 thiss!1504) (minValue!4071 thiss!1504) key!932 (defaultEntry!4230 thiss!1504)))))

(assert (=> b!226050 (= c!37473 ((_ is MissingZero!877) lt!113691))))

(assert (=> b!226050 e!146668))

(declare-fun b!226051 () Bool)

(assert (=> b!226051 (= e!146666 e!146659)))

(declare-fun res!111248 () Bool)

(assert (=> b!226051 (= res!111248 call!21011)))

(assert (=> b!226051 (=> (not res!111248) (not e!146659))))

(declare-fun b!226052 () Bool)

(assert (=> b!226052 (= e!146671 true)))

(declare-fun lt!113692 () Bool)

(assert (=> b!226052 (= lt!113692 (arrayNoDuplicates!0 (_keys!6283 thiss!1504) #b00000000000000000000000000000000 Nil!3351))))

(declare-fun b!226053 () Bool)

(assert (=> b!226053 (= e!146661 tp_is_empty!5929)))

(declare-fun b!226054 () Bool)

(declare-fun res!111237 () Bool)

(assert (=> b!226054 (=> (not res!111237) (not e!146660))))

(assert (=> b!226054 (= res!111237 call!21011)))

(assert (=> b!226054 (= e!146668 e!146660)))

(assert (= (and start!22004 res!111247) b!226045))

(assert (= (and b!226045 res!111246) b!226034))

(assert (= (and b!226034 res!111245) b!226042))

(assert (= (and b!226042 c!37472) b!226049))

(assert (= (and b!226042 (not c!37472)) b!226050))

(assert (= (and b!226050 c!37473) b!226054))

(assert (= (and b!226050 (not c!37473)) b!226033))

(assert (= (and b!226054 res!111237) b!226044))

(assert (= (and b!226044 res!111240) b!226037))

(assert (= (and b!226033 c!37471) b!226051))

(assert (= (and b!226033 (not c!37471)) b!226048))

(assert (= (and b!226051 res!111248) b!226030))

(assert (= (and b!226030 res!111243) b!226038))

(assert (= (or b!226054 b!226051) bm!21008))

(assert (= (or b!226037 b!226038) bm!21009))

(assert (= (and b!226042 res!111236) b!226031))

(assert (= (and b!226031 c!37474) b!226039))

(assert (= (and b!226031 (not c!37474)) b!226036))

(assert (= (and b!226031 (not res!111241)) b!226046))

(assert (= (and b!226046 (not res!111244)) b!226040))

(assert (= (and b!226040 (not res!111239)) b!226047))

(assert (= (and b!226047 (not res!111238)) b!226032))

(assert (= (and b!226032 (not res!111242)) b!226052))

(assert (= (and b!226035 condMapEmpty!10063) mapIsEmpty!10063))

(assert (= (and b!226035 (not condMapEmpty!10063)) mapNonEmpty!10063))

(assert (= (and mapNonEmpty!10063 ((_ is ValueCellFull!2621) mapValue!10063)) b!226041))

(assert (= (and b!226035 ((_ is ValueCellFull!2621) mapDefault!10063)) b!226053))

(assert (= b!226043 b!226035))

(assert (= start!22004 b!226043))

(declare-fun m!247933 () Bool)

(assert (=> b!226043 m!247933))

(declare-fun m!247935 () Bool)

(assert (=> b!226043 m!247935))

(declare-fun m!247937 () Bool)

(assert (=> bm!21009 m!247937))

(declare-fun m!247939 () Bool)

(assert (=> b!226052 m!247939))

(declare-fun m!247941 () Bool)

(assert (=> b!226042 m!247941))

(declare-fun m!247943 () Bool)

(assert (=> b!226042 m!247943))

(assert (=> b!226042 m!247943))

(declare-fun m!247945 () Bool)

(assert (=> b!226042 m!247945))

(declare-fun m!247947 () Bool)

(assert (=> b!226039 m!247947))

(declare-fun m!247949 () Bool)

(assert (=> b!226049 m!247949))

(declare-fun m!247951 () Bool)

(assert (=> bm!21008 m!247951))

(declare-fun m!247953 () Bool)

(assert (=> mapNonEmpty!10063 m!247953))

(declare-fun m!247955 () Bool)

(assert (=> b!226050 m!247955))

(declare-fun m!247957 () Bool)

(assert (=> b!226040 m!247957))

(declare-fun m!247959 () Bool)

(assert (=> b!226032 m!247959))

(declare-fun m!247961 () Bool)

(assert (=> start!22004 m!247961))

(declare-fun m!247963 () Bool)

(assert (=> b!226030 m!247963))

(declare-fun m!247965 () Bool)

(assert (=> b!226044 m!247965))

(declare-fun m!247967 () Bool)

(assert (=> b!226031 m!247967))

(assert (=> b!226031 m!247937))

(declare-fun m!247969 () Bool)

(assert (=> b!226031 m!247969))

(declare-fun m!247971 () Bool)

(assert (=> b!226031 m!247971))

(declare-fun m!247973 () Bool)

(assert (=> b!226031 m!247973))

(declare-fun m!247975 () Bool)

(assert (=> b!226031 m!247975))

(declare-fun m!247977 () Bool)

(assert (=> b!226031 m!247977))

(declare-fun m!247979 () Bool)

(assert (=> b!226031 m!247979))

(declare-fun m!247981 () Bool)

(assert (=> b!226034 m!247981))

(check-sat (not b!226039) (not start!22004) (not b!226050) (not b!226049) (not b!226042) (not b!226040) (not b!226032) (not b!226043) (not b_next!6067) (not b!226031) (not mapNonEmpty!10063) (not b!226052) (not bm!21008) b_and!12939 (not b!226034) (not bm!21009) tp_is_empty!5929)
(check-sat b_and!12939 (not b_next!6067))
