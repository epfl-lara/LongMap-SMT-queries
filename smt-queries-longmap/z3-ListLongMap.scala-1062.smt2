; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22058 () Bool)

(assert start!22058)

(declare-fun b!228143 () Bool)

(declare-fun b_free!6121 () Bool)

(declare-fun b_next!6121 () Bool)

(assert (=> b!228143 (= b_free!6121 (not b_next!6121))))

(declare-fun tp!21505 () Bool)

(declare-fun b_and!13033 () Bool)

(assert (=> b!228143 (= tp!21505 b_and!13033)))

(declare-fun b!228138 () Bool)

(declare-fun res!112297 () Bool)

(declare-fun e!148007 () Bool)

(assert (=> b!228138 (=> (not res!112297) (not e!148007))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!228138 (= res!112297 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10144 () Bool)

(declare-fun mapRes!10144 () Bool)

(declare-fun tp!21504 () Bool)

(declare-fun e!148002 () Bool)

(assert (=> mapNonEmpty!10144 (= mapRes!10144 (and tp!21504 e!148002))))

(declare-datatypes ((V!7625 0))(
  ( (V!7626 (val!3036 Int)) )
))
(declare-datatypes ((ValueCell!2648 0))(
  ( (ValueCellFull!2648 (v!5057 V!7625)) (EmptyCell!2648) )
))
(declare-fun mapRest!10144 () (Array (_ BitVec 32) ValueCell!2648))

(declare-fun mapKey!10144 () (_ BitVec 32))

(declare-datatypes ((array!11207 0))(
  ( (array!11208 (arr!5323 (Array (_ BitVec 32) ValueCell!2648)) (size!5656 (_ BitVec 32))) )
))
(declare-datatypes ((array!11209 0))(
  ( (array!11210 (arr!5324 (Array (_ BitVec 32) (_ BitVec 64))) (size!5657 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3196 0))(
  ( (LongMapFixedSize!3197 (defaultEntry!4257 Int) (mask!10125 (_ BitVec 32)) (extraKeys!3994 (_ BitVec 32)) (zeroValue!4098 V!7625) (minValue!4098 V!7625) (_size!1647 (_ BitVec 32)) (_keys!6311 array!11209) (_values!4240 array!11207) (_vacant!1647 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3196)

(declare-fun mapValue!10144 () ValueCell!2648)

(assert (=> mapNonEmpty!10144 (= (arr!5323 (_values!4240 thiss!1504)) (store mapRest!10144 mapKey!10144 mapValue!10144))))

(declare-fun bm!21182 () Bool)

(declare-fun call!21186 () Bool)

(declare-fun arrayContainsKey!0 (array!11209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21182 (= call!21186 (arrayContainsKey!0 (_keys!6311 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228139 () Bool)

(declare-fun c!37836 () Bool)

(declare-datatypes ((SeekEntryResult!873 0))(
  ( (MissingZero!873 (index!5662 (_ BitVec 32))) (Found!873 (index!5663 (_ BitVec 32))) (Intermediate!873 (undefined!1685 Bool) (index!5664 (_ BitVec 32)) (x!23285 (_ BitVec 32))) (Undefined!873) (MissingVacant!873 (index!5665 (_ BitVec 32))) )
))
(declare-fun lt!114819 () SeekEntryResult!873)

(get-info :version)

(assert (=> b!228139 (= c!37836 ((_ is MissingVacant!873) lt!114819))))

(declare-fun e!148010 () Bool)

(declare-fun e!148004 () Bool)

(assert (=> b!228139 (= e!148010 e!148004)))

(declare-fun b!228140 () Bool)

(declare-fun e!148005 () Bool)

(declare-fun tp_is_empty!5983 () Bool)

(assert (=> b!228140 (= e!148005 tp_is_empty!5983)))

(declare-fun b!228141 () Bool)

(declare-fun e!148012 () Bool)

(assert (=> b!228141 (= e!148004 e!148012)))

(declare-fun res!112303 () Bool)

(declare-fun call!21185 () Bool)

(assert (=> b!228141 (= res!112303 call!21185)))

(assert (=> b!228141 (=> (not res!112303) (not e!148012))))

(declare-fun b!228142 () Bool)

(declare-fun res!112293 () Bool)

(declare-fun e!148000 () Bool)

(assert (=> b!228142 (=> (not res!112293) (not e!148000))))

(assert (=> b!228142 (= res!112293 call!21185)))

(assert (=> b!228142 (= e!148010 e!148000)))

(declare-fun e!148008 () Bool)

(declare-fun e!148011 () Bool)

(declare-fun array_inv!3495 (array!11209) Bool)

(declare-fun array_inv!3496 (array!11207) Bool)

(assert (=> b!228143 (= e!148008 (and tp!21505 tp_is_empty!5983 (array_inv!3495 (_keys!6311 thiss!1504)) (array_inv!3496 (_values!4240 thiss!1504)) e!148011))))

(declare-fun bm!21183 () Bool)

(declare-fun c!37834 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21183 (= call!21185 (inRange!0 (ite c!37834 (index!5662 lt!114819) (index!5665 lt!114819)) (mask!10125 thiss!1504)))))

(declare-fun b!228144 () Bool)

(declare-datatypes ((Unit!6902 0))(
  ( (Unit!6903) )
))
(declare-fun e!148001 () Unit!6902)

(declare-fun Unit!6904 () Unit!6902)

(assert (=> b!228144 (= e!148001 Unit!6904)))

(declare-fun b!228145 () Bool)

(declare-fun res!112295 () Bool)

(assert (=> b!228145 (= res!112295 (= (select (arr!5324 (_keys!6311 thiss!1504)) (index!5665 lt!114819)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228145 (=> (not res!112295) (not e!148012))))

(declare-fun b!228146 () Bool)

(assert (=> b!228146 (= e!148000 (not call!21186))))

(declare-fun b!228137 () Bool)

(declare-fun e!148003 () Bool)

(declare-fun e!148006 () Bool)

(assert (=> b!228137 (= e!148003 (not e!148006))))

(declare-fun res!112294 () Bool)

(assert (=> b!228137 (=> res!112294 e!148006)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228137 (= res!112294 (not (validMask!0 (mask!10125 thiss!1504))))))

(declare-fun lt!114827 () array!11209)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11209 (_ BitVec 32)) Bool)

(assert (=> b!228137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114827 (mask!10125 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!114820 () Unit!6902)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11209 (_ BitVec 32) (_ BitVec 32)) Unit!6902)

(assert (=> b!228137 (= lt!114820 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6311 thiss!1504) index!297 (mask!10125 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11209 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228137 (= (arrayCountValidKeys!0 lt!114827 #b00000000000000000000000000000000 (size!5657 (_keys!6311 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6311 thiss!1504) #b00000000000000000000000000000000 (size!5657 (_keys!6311 thiss!1504)))))))

(declare-fun lt!114825 () Unit!6902)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11209 (_ BitVec 32) (_ BitVec 64)) Unit!6902)

(assert (=> b!228137 (= lt!114825 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6311 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3319 0))(
  ( (Nil!3316) (Cons!3315 (h!3963 (_ BitVec 64)) (t!8270 List!3319)) )
))
(declare-fun arrayNoDuplicates!0 (array!11209 (_ BitVec 32) List!3319) Bool)

(assert (=> b!228137 (arrayNoDuplicates!0 lt!114827 #b00000000000000000000000000000000 Nil!3316)))

(assert (=> b!228137 (= lt!114827 (array!11210 (store (arr!5324 (_keys!6311 thiss!1504)) index!297 key!932) (size!5657 (_keys!6311 thiss!1504))))))

(declare-fun lt!114829 () Unit!6902)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11209 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3319) Unit!6902)

(assert (=> b!228137 (= lt!114829 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6311 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3316))))

(declare-fun lt!114821 () Unit!6902)

(assert (=> b!228137 (= lt!114821 e!148001)))

(declare-fun c!37837 () Bool)

(assert (=> b!228137 (= c!37837 (arrayContainsKey!0 (_keys!6311 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!112298 () Bool)

(assert (=> start!22058 (=> (not res!112298) (not e!148007))))

(declare-fun valid!1286 (LongMapFixedSize!3196) Bool)

(assert (=> start!22058 (= res!112298 (valid!1286 thiss!1504))))

(assert (=> start!22058 e!148007))

(assert (=> start!22058 e!148008))

(assert (=> start!22058 true))

(declare-fun b!228147 () Bool)

(assert (=> b!228147 (= e!148006 true)))

(declare-fun lt!114824 () Bool)

(assert (=> b!228147 (= lt!114824 (arrayNoDuplicates!0 (_keys!6311 thiss!1504) #b00000000000000000000000000000000 Nil!3316))))

(declare-fun b!228148 () Bool)

(declare-fun e!147999 () Unit!6902)

(declare-fun Unit!6905 () Unit!6902)

(assert (=> b!228148 (= e!147999 Unit!6905)))

(declare-fun lt!114826 () Unit!6902)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!269 (array!11209 array!11207 (_ BitVec 32) (_ BitVec 32) V!7625 V!7625 (_ BitVec 64) Int) Unit!6902)

(assert (=> b!228148 (= lt!114826 (lemmaInListMapThenSeekEntryOrOpenFindsIt!269 (_keys!6311 thiss!1504) (_values!4240 thiss!1504) (mask!10125 thiss!1504) (extraKeys!3994 thiss!1504) (zeroValue!4098 thiss!1504) (minValue!4098 thiss!1504) key!932 (defaultEntry!4257 thiss!1504)))))

(assert (=> b!228148 false))

(declare-fun b!228149 () Bool)

(assert (=> b!228149 (= e!148012 (not call!21186))))

(declare-fun b!228150 () Bool)

(declare-fun res!112299 () Bool)

(assert (=> b!228150 (=> res!112299 e!148006)))

(assert (=> b!228150 (= res!112299 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6311 thiss!1504) (mask!10125 thiss!1504))))))

(declare-fun b!228151 () Bool)

(declare-fun Unit!6906 () Unit!6902)

(assert (=> b!228151 (= e!148001 Unit!6906)))

(declare-fun lt!114823 () Unit!6902)

(declare-fun lemmaArrayContainsKeyThenInListMap!109 (array!11209 array!11207 (_ BitVec 32) (_ BitVec 32) V!7625 V!7625 (_ BitVec 64) (_ BitVec 32) Int) Unit!6902)

(assert (=> b!228151 (= lt!114823 (lemmaArrayContainsKeyThenInListMap!109 (_keys!6311 thiss!1504) (_values!4240 thiss!1504) (mask!10125 thiss!1504) (extraKeys!3994 thiss!1504) (zeroValue!4098 thiss!1504) (minValue!4098 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4257 thiss!1504)))))

(assert (=> b!228151 false))

(declare-fun b!228152 () Bool)

(declare-fun res!112300 () Bool)

(assert (=> b!228152 (=> (not res!112300) (not e!148000))))

(assert (=> b!228152 (= res!112300 (= (select (arr!5324 (_keys!6311 thiss!1504)) (index!5662 lt!114819)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!10144 () Bool)

(assert (=> mapIsEmpty!10144 mapRes!10144))

(declare-fun b!228153 () Bool)

(assert (=> b!228153 (= e!148004 ((_ is Undefined!873) lt!114819))))

(declare-fun b!228154 () Bool)

(assert (=> b!228154 (= e!148002 tp_is_empty!5983)))

(declare-fun b!228155 () Bool)

(declare-fun e!148009 () Bool)

(assert (=> b!228155 (= e!148009 e!148003)))

(declare-fun res!112302 () Bool)

(assert (=> b!228155 (=> (not res!112302) (not e!148003))))

(assert (=> b!228155 (= res!112302 (inRange!0 index!297 (mask!10125 thiss!1504)))))

(declare-fun lt!114828 () Unit!6902)

(assert (=> b!228155 (= lt!114828 e!147999)))

(declare-fun c!37835 () Bool)

(declare-datatypes ((tuple2!4406 0))(
  ( (tuple2!4407 (_1!2214 (_ BitVec 64)) (_2!2214 V!7625)) )
))
(declare-datatypes ((List!3320 0))(
  ( (Nil!3317) (Cons!3316 (h!3964 tuple2!4406) (t!8271 List!3320)) )
))
(declare-datatypes ((ListLongMap!3321 0))(
  ( (ListLongMap!3322 (toList!1676 List!3320)) )
))
(declare-fun contains!1565 (ListLongMap!3321 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1208 (array!11209 array!11207 (_ BitVec 32) (_ BitVec 32) V!7625 V!7625 (_ BitVec 32) Int) ListLongMap!3321)

(assert (=> b!228155 (= c!37835 (contains!1565 (getCurrentListMap!1208 (_keys!6311 thiss!1504) (_values!4240 thiss!1504) (mask!10125 thiss!1504) (extraKeys!3994 thiss!1504) (zeroValue!4098 thiss!1504) (minValue!4098 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4257 thiss!1504)) key!932))))

(declare-fun b!228156 () Bool)

(declare-fun res!112296 () Bool)

(assert (=> b!228156 (=> res!112296 e!148006)))

(assert (=> b!228156 (= res!112296 (or (not (= (size!5656 (_values!4240 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10125 thiss!1504)))) (not (= (size!5657 (_keys!6311 thiss!1504)) (size!5656 (_values!4240 thiss!1504)))) (bvslt (mask!10125 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3994 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3994 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228157 () Bool)

(declare-fun lt!114822 () Unit!6902)

(assert (=> b!228157 (= e!147999 lt!114822)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!262 (array!11209 array!11207 (_ BitVec 32) (_ BitVec 32) V!7625 V!7625 (_ BitVec 64) Int) Unit!6902)

(assert (=> b!228157 (= lt!114822 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!262 (_keys!6311 thiss!1504) (_values!4240 thiss!1504) (mask!10125 thiss!1504) (extraKeys!3994 thiss!1504) (zeroValue!4098 thiss!1504) (minValue!4098 thiss!1504) key!932 (defaultEntry!4257 thiss!1504)))))

(assert (=> b!228157 (= c!37834 ((_ is MissingZero!873) lt!114819))))

(assert (=> b!228157 e!148010))

(declare-fun b!228158 () Bool)

(assert (=> b!228158 (= e!148011 (and e!148005 mapRes!10144))))

(declare-fun condMapEmpty!10144 () Bool)

(declare-fun mapDefault!10144 () ValueCell!2648)

(assert (=> b!228158 (= condMapEmpty!10144 (= (arr!5323 (_values!4240 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2648)) mapDefault!10144)))))

(declare-fun b!228159 () Bool)

(assert (=> b!228159 (= e!148007 e!148009)))

(declare-fun res!112301 () Bool)

(assert (=> b!228159 (=> (not res!112301) (not e!148009))))

(assert (=> b!228159 (= res!112301 (or (= lt!114819 (MissingZero!873 index!297)) (= lt!114819 (MissingVacant!873 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11209 (_ BitVec 32)) SeekEntryResult!873)

(assert (=> b!228159 (= lt!114819 (seekEntryOrOpen!0 key!932 (_keys!6311 thiss!1504) (mask!10125 thiss!1504)))))

(assert (= (and start!22058 res!112298) b!228138))

(assert (= (and b!228138 res!112297) b!228159))

(assert (= (and b!228159 res!112301) b!228155))

(assert (= (and b!228155 c!37835) b!228148))

(assert (= (and b!228155 (not c!37835)) b!228157))

(assert (= (and b!228157 c!37834) b!228142))

(assert (= (and b!228157 (not c!37834)) b!228139))

(assert (= (and b!228142 res!112293) b!228152))

(assert (= (and b!228152 res!112300) b!228146))

(assert (= (and b!228139 c!37836) b!228141))

(assert (= (and b!228139 (not c!37836)) b!228153))

(assert (= (and b!228141 res!112303) b!228145))

(assert (= (and b!228145 res!112295) b!228149))

(assert (= (or b!228142 b!228141) bm!21183))

(assert (= (or b!228146 b!228149) bm!21182))

(assert (= (and b!228155 res!112302) b!228137))

(assert (= (and b!228137 c!37837) b!228151))

(assert (= (and b!228137 (not c!37837)) b!228144))

(assert (= (and b!228137 (not res!112294)) b!228156))

(assert (= (and b!228156 (not res!112296)) b!228150))

(assert (= (and b!228150 (not res!112299)) b!228147))

(assert (= (and b!228158 condMapEmpty!10144) mapIsEmpty!10144))

(assert (= (and b!228158 (not condMapEmpty!10144)) mapNonEmpty!10144))

(assert (= (and mapNonEmpty!10144 ((_ is ValueCellFull!2648) mapValue!10144)) b!228154))

(assert (= (and b!228158 ((_ is ValueCellFull!2648) mapDefault!10144)) b!228140))

(assert (= b!228143 b!228158))

(assert (= start!22058 b!228143))

(declare-fun m!250117 () Bool)

(assert (=> b!228159 m!250117))

(declare-fun m!250119 () Bool)

(assert (=> b!228137 m!250119))

(declare-fun m!250121 () Bool)

(assert (=> b!228137 m!250121))

(declare-fun m!250123 () Bool)

(assert (=> b!228137 m!250123))

(declare-fun m!250125 () Bool)

(assert (=> b!228137 m!250125))

(declare-fun m!250127 () Bool)

(assert (=> b!228137 m!250127))

(declare-fun m!250129 () Bool)

(assert (=> b!228137 m!250129))

(declare-fun m!250131 () Bool)

(assert (=> b!228137 m!250131))

(declare-fun m!250133 () Bool)

(assert (=> b!228137 m!250133))

(declare-fun m!250135 () Bool)

(assert (=> b!228137 m!250135))

(declare-fun m!250137 () Bool)

(assert (=> b!228137 m!250137))

(declare-fun m!250139 () Bool)

(assert (=> mapNonEmpty!10144 m!250139))

(assert (=> bm!21182 m!250133))

(declare-fun m!250141 () Bool)

(assert (=> bm!21183 m!250141))

(declare-fun m!250143 () Bool)

(assert (=> b!228151 m!250143))

(declare-fun m!250145 () Bool)

(assert (=> b!228150 m!250145))

(declare-fun m!250147 () Bool)

(assert (=> b!228148 m!250147))

(declare-fun m!250149 () Bool)

(assert (=> start!22058 m!250149))

(declare-fun m!250151 () Bool)

(assert (=> b!228145 m!250151))

(declare-fun m!250153 () Bool)

(assert (=> b!228147 m!250153))

(declare-fun m!250155 () Bool)

(assert (=> b!228155 m!250155))

(declare-fun m!250157 () Bool)

(assert (=> b!228155 m!250157))

(assert (=> b!228155 m!250157))

(declare-fun m!250159 () Bool)

(assert (=> b!228155 m!250159))

(declare-fun m!250161 () Bool)

(assert (=> b!228152 m!250161))

(declare-fun m!250163 () Bool)

(assert (=> b!228143 m!250163))

(declare-fun m!250165 () Bool)

(assert (=> b!228143 m!250165))

(declare-fun m!250167 () Bool)

(assert (=> b!228157 m!250167))

(check-sat (not b!228143) (not b!228150) (not b_next!6121) (not b!228137) b_and!13033 (not b!228159) (not start!22058) (not mapNonEmpty!10144) (not b!228155) (not b!228147) (not bm!21183) (not b!228148) (not bm!21182) tp_is_empty!5983 (not b!228157) (not b!228151))
(check-sat b_and!13033 (not b_next!6121))
