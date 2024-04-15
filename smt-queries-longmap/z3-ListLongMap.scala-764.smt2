; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18018 () Bool)

(assert start!18018)

(declare-fun b!179221 () Bool)

(declare-fun b_free!4423 () Bool)

(declare-fun b_next!4423 () Bool)

(assert (=> b!179221 (= b_free!4423 (not b_next!4423))))

(declare-fun tp!15994 () Bool)

(declare-fun b_and!10927 () Bool)

(assert (=> b!179221 (= tp!15994 b_and!10927)))

(declare-fun b!179217 () Bool)

(declare-fun res!84855 () Bool)

(declare-fun e!118072 () Bool)

(assert (=> b!179217 (=> (not res!84855) (not e!118072))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!179217 (= res!84855 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179218 () Bool)

(declare-fun res!84854 () Bool)

(assert (=> b!179218 (=> (not res!84854) (not e!118072))))

(declare-datatypes ((V!5241 0))(
  ( (V!5242 (val!2142 Int)) )
))
(declare-datatypes ((ValueCell!1754 0))(
  ( (ValueCellFull!1754 (v!4023 V!5241)) (EmptyCell!1754) )
))
(declare-datatypes ((array!7535 0))(
  ( (array!7536 (arr!3568 (Array (_ BitVec 32) (_ BitVec 64))) (size!3877 (_ BitVec 32))) )
))
(declare-datatypes ((array!7537 0))(
  ( (array!7538 (arr!3569 (Array (_ BitVec 32) ValueCell!1754)) (size!3878 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2416 0))(
  ( (LongMapFixedSize!2417 (defaultEntry!3682 Int) (mask!8662 (_ BitVec 32)) (extraKeys!3419 (_ BitVec 32)) (zeroValue!3523 V!5241) (minValue!3523 V!5241) (_size!1257 (_ BitVec 32)) (_keys!5568 array!7535) (_values!3665 array!7537) (_vacant!1257 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2416)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7535 (_ BitVec 32)) Bool)

(assert (=> b!179218 (= res!84854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5568 thiss!1248) (mask!8662 thiss!1248)))))

(declare-fun res!84851 () Bool)

(assert (=> start!18018 (=> (not res!84851) (not e!118072))))

(declare-fun valid!1025 (LongMapFixedSize!2416) Bool)

(assert (=> start!18018 (= res!84851 (valid!1025 thiss!1248))))

(assert (=> start!18018 e!118072))

(declare-fun e!118073 () Bool)

(assert (=> start!18018 e!118073))

(assert (=> start!18018 true))

(declare-fun b!179219 () Bool)

(declare-fun res!84853 () Bool)

(assert (=> b!179219 (=> (not res!84853) (not e!118072))))

(declare-datatypes ((tuple2!3310 0))(
  ( (tuple2!3311 (_1!1666 (_ BitVec 64)) (_2!1666 V!5241)) )
))
(declare-datatypes ((List!2273 0))(
  ( (Nil!2270) (Cons!2269 (h!2894 tuple2!3310) (t!7108 List!2273)) )
))
(declare-datatypes ((ListLongMap!2229 0))(
  ( (ListLongMap!2230 (toList!1130 List!2273)) )
))
(declare-fun contains!1209 (ListLongMap!2229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!766 (array!7535 array!7537 (_ BitVec 32) (_ BitVec 32) V!5241 V!5241 (_ BitVec 32) Int) ListLongMap!2229)

(assert (=> b!179219 (= res!84853 (not (contains!1209 (getCurrentListMap!766 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)) key!828)))))

(declare-fun b!179220 () Bool)

(declare-fun res!84852 () Bool)

(assert (=> b!179220 (=> (not res!84852) (not e!118072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!179220 (= res!84852 (validMask!0 (mask!8662 thiss!1248)))))

(declare-fun mapNonEmpty!7180 () Bool)

(declare-fun mapRes!7180 () Bool)

(declare-fun tp!15993 () Bool)

(declare-fun e!118068 () Bool)

(assert (=> mapNonEmpty!7180 (= mapRes!7180 (and tp!15993 e!118068))))

(declare-fun mapValue!7180 () ValueCell!1754)

(declare-fun mapKey!7180 () (_ BitVec 32))

(declare-fun mapRest!7180 () (Array (_ BitVec 32) ValueCell!1754))

(assert (=> mapNonEmpty!7180 (= (arr!3569 (_values!3665 thiss!1248)) (store mapRest!7180 mapKey!7180 mapValue!7180))))

(declare-fun tp_is_empty!4195 () Bool)

(declare-fun e!118070 () Bool)

(declare-fun array_inv!2307 (array!7535) Bool)

(declare-fun array_inv!2308 (array!7537) Bool)

(assert (=> b!179221 (= e!118073 (and tp!15994 tp_is_empty!4195 (array_inv!2307 (_keys!5568 thiss!1248)) (array_inv!2308 (_values!3665 thiss!1248)) e!118070))))

(declare-fun b!179222 () Bool)

(declare-datatypes ((List!2274 0))(
  ( (Nil!2271) (Cons!2270 (h!2895 (_ BitVec 64)) (t!7109 List!2274)) )
))
(declare-fun arrayNoDuplicates!0 (array!7535 (_ BitVec 32) List!2274) Bool)

(assert (=> b!179222 (= e!118072 (not (arrayNoDuplicates!0 (_keys!5568 thiss!1248) #b00000000000000000000000000000000 Nil!2271)))))

(declare-fun b!179223 () Bool)

(declare-fun e!118071 () Bool)

(assert (=> b!179223 (= e!118071 tp_is_empty!4195)))

(declare-fun b!179224 () Bool)

(declare-fun res!84856 () Bool)

(assert (=> b!179224 (=> (not res!84856) (not e!118072))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!590 0))(
  ( (MissingZero!590 (index!4528 (_ BitVec 32))) (Found!590 (index!4529 (_ BitVec 32))) (Intermediate!590 (undefined!1402 Bool) (index!4530 (_ BitVec 32)) (x!19627 (_ BitVec 32))) (Undefined!590) (MissingVacant!590 (index!4531 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7535 (_ BitVec 32)) SeekEntryResult!590)

(assert (=> b!179224 (= res!84856 ((_ is Undefined!590) (seekEntryOrOpen!0 key!828 (_keys!5568 thiss!1248) (mask!8662 thiss!1248))))))

(declare-fun b!179225 () Bool)

(declare-fun res!84857 () Bool)

(assert (=> b!179225 (=> (not res!84857) (not e!118072))))

(assert (=> b!179225 (= res!84857 (and (= (size!3878 (_values!3665 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8662 thiss!1248))) (= (size!3877 (_keys!5568 thiss!1248)) (size!3878 (_values!3665 thiss!1248))) (bvsge (mask!8662 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3419 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3419 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7180 () Bool)

(assert (=> mapIsEmpty!7180 mapRes!7180))

(declare-fun b!179226 () Bool)

(assert (=> b!179226 (= e!118068 tp_is_empty!4195)))

(declare-fun b!179227 () Bool)

(assert (=> b!179227 (= e!118070 (and e!118071 mapRes!7180))))

(declare-fun condMapEmpty!7180 () Bool)

(declare-fun mapDefault!7180 () ValueCell!1754)

(assert (=> b!179227 (= condMapEmpty!7180 (= (arr!3569 (_values!3665 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1754)) mapDefault!7180)))))

(assert (= (and start!18018 res!84851) b!179217))

(assert (= (and b!179217 res!84855) b!179224))

(assert (= (and b!179224 res!84856) b!179219))

(assert (= (and b!179219 res!84853) b!179220))

(assert (= (and b!179220 res!84852) b!179225))

(assert (= (and b!179225 res!84857) b!179218))

(assert (= (and b!179218 res!84854) b!179222))

(assert (= (and b!179227 condMapEmpty!7180) mapIsEmpty!7180))

(assert (= (and b!179227 (not condMapEmpty!7180)) mapNonEmpty!7180))

(assert (= (and mapNonEmpty!7180 ((_ is ValueCellFull!1754) mapValue!7180)) b!179226))

(assert (= (and b!179227 ((_ is ValueCellFull!1754) mapDefault!7180)) b!179223))

(assert (= b!179221 b!179227))

(assert (= start!18018 b!179221))

(declare-fun m!207023 () Bool)

(assert (=> start!18018 m!207023))

(declare-fun m!207025 () Bool)

(assert (=> mapNonEmpty!7180 m!207025))

(declare-fun m!207027 () Bool)

(assert (=> b!179219 m!207027))

(assert (=> b!179219 m!207027))

(declare-fun m!207029 () Bool)

(assert (=> b!179219 m!207029))

(declare-fun m!207031 () Bool)

(assert (=> b!179222 m!207031))

(declare-fun m!207033 () Bool)

(assert (=> b!179220 m!207033))

(declare-fun m!207035 () Bool)

(assert (=> b!179218 m!207035))

(declare-fun m!207037 () Bool)

(assert (=> b!179224 m!207037))

(declare-fun m!207039 () Bool)

(assert (=> b!179221 m!207039))

(declare-fun m!207041 () Bool)

(assert (=> b!179221 m!207041))

(check-sat (not b!179218) (not b!179222) (not b!179219) tp_is_empty!4195 (not b!179224) (not b!179221) (not start!18018) (not mapNonEmpty!7180) (not b!179220) (not b_next!4423) b_and!10927)
(check-sat b_and!10927 (not b_next!4423))
(get-model)

(declare-fun d!53995 () Bool)

(declare-fun res!84906 () Bool)

(declare-fun e!118112 () Bool)

(assert (=> d!53995 (=> (not res!84906) (not e!118112))))

(declare-fun simpleValid!161 (LongMapFixedSize!2416) Bool)

(assert (=> d!53995 (= res!84906 (simpleValid!161 thiss!1248))))

(assert (=> d!53995 (= (valid!1025 thiss!1248) e!118112)))

(declare-fun b!179300 () Bool)

(declare-fun res!84907 () Bool)

(assert (=> b!179300 (=> (not res!84907) (not e!118112))))

(declare-fun arrayCountValidKeys!0 (array!7535 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179300 (= res!84907 (= (arrayCountValidKeys!0 (_keys!5568 thiss!1248) #b00000000000000000000000000000000 (size!3877 (_keys!5568 thiss!1248))) (_size!1257 thiss!1248)))))

(declare-fun b!179301 () Bool)

(declare-fun res!84908 () Bool)

(assert (=> b!179301 (=> (not res!84908) (not e!118112))))

(assert (=> b!179301 (= res!84908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5568 thiss!1248) (mask!8662 thiss!1248)))))

(declare-fun b!179302 () Bool)

(assert (=> b!179302 (= e!118112 (arrayNoDuplicates!0 (_keys!5568 thiss!1248) #b00000000000000000000000000000000 Nil!2271))))

(assert (= (and d!53995 res!84906) b!179300))

(assert (= (and b!179300 res!84907) b!179301))

(assert (= (and b!179301 res!84908) b!179302))

(declare-fun m!207083 () Bool)

(assert (=> d!53995 m!207083))

(declare-fun m!207085 () Bool)

(assert (=> b!179300 m!207085))

(assert (=> b!179301 m!207035))

(assert (=> b!179302 m!207031))

(assert (=> start!18018 d!53995))

(declare-fun d!53997 () Bool)

(assert (=> d!53997 (= (array_inv!2307 (_keys!5568 thiss!1248)) (bvsge (size!3877 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179221 d!53997))

(declare-fun d!53999 () Bool)

(assert (=> d!53999 (= (array_inv!2308 (_values!3665 thiss!1248)) (bvsge (size!3878 (_values!3665 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179221 d!53999))

(declare-fun bm!18097 () Bool)

(declare-fun call!18100 () Bool)

(declare-fun c!32142 () Bool)

(assert (=> bm!18097 (= call!18100 (arrayNoDuplicates!0 (_keys!5568 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32142 (Cons!2270 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000) Nil!2271) Nil!2271)))))

(declare-fun d!54001 () Bool)

(declare-fun res!84916 () Bool)

(declare-fun e!118123 () Bool)

(assert (=> d!54001 (=> res!84916 e!118123)))

(assert (=> d!54001 (= res!84916 (bvsge #b00000000000000000000000000000000 (size!3877 (_keys!5568 thiss!1248))))))

(assert (=> d!54001 (= (arrayNoDuplicates!0 (_keys!5568 thiss!1248) #b00000000000000000000000000000000 Nil!2271) e!118123)))

(declare-fun b!179313 () Bool)

(declare-fun e!118121 () Bool)

(declare-fun contains!1210 (List!2274 (_ BitVec 64)) Bool)

(assert (=> b!179313 (= e!118121 (contains!1210 Nil!2271 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179314 () Bool)

(declare-fun e!118122 () Bool)

(assert (=> b!179314 (= e!118123 e!118122)))

(declare-fun res!84917 () Bool)

(assert (=> b!179314 (=> (not res!84917) (not e!118122))))

(assert (=> b!179314 (= res!84917 (not e!118121))))

(declare-fun res!84915 () Bool)

(assert (=> b!179314 (=> (not res!84915) (not e!118121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!179314 (= res!84915 (validKeyInArray!0 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179315 () Bool)

(declare-fun e!118124 () Bool)

(assert (=> b!179315 (= e!118124 call!18100)))

(declare-fun b!179316 () Bool)

(assert (=> b!179316 (= e!118124 call!18100)))

(declare-fun b!179317 () Bool)

(assert (=> b!179317 (= e!118122 e!118124)))

(assert (=> b!179317 (= c!32142 (validKeyInArray!0 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!54001 (not res!84916)) b!179314))

(assert (= (and b!179314 res!84915) b!179313))

(assert (= (and b!179314 res!84917) b!179317))

(assert (= (and b!179317 c!32142) b!179316))

(assert (= (and b!179317 (not c!32142)) b!179315))

(assert (= (or b!179316 b!179315) bm!18097))

(declare-fun m!207087 () Bool)

(assert (=> bm!18097 m!207087))

(declare-fun m!207089 () Bool)

(assert (=> bm!18097 m!207089))

(assert (=> b!179313 m!207087))

(assert (=> b!179313 m!207087))

(declare-fun m!207091 () Bool)

(assert (=> b!179313 m!207091))

(assert (=> b!179314 m!207087))

(assert (=> b!179314 m!207087))

(declare-fun m!207093 () Bool)

(assert (=> b!179314 m!207093))

(assert (=> b!179317 m!207087))

(assert (=> b!179317 m!207087))

(assert (=> b!179317 m!207093))

(assert (=> b!179222 d!54001))

(declare-fun d!54003 () Bool)

(declare-fun res!84922 () Bool)

(declare-fun e!118133 () Bool)

(assert (=> d!54003 (=> res!84922 e!118133)))

(assert (=> d!54003 (= res!84922 (bvsge #b00000000000000000000000000000000 (size!3877 (_keys!5568 thiss!1248))))))

(assert (=> d!54003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5568 thiss!1248) (mask!8662 thiss!1248)) e!118133)))

(declare-fun b!179326 () Bool)

(declare-fun e!118131 () Bool)

(assert (=> b!179326 (= e!118133 e!118131)))

(declare-fun c!32145 () Bool)

(assert (=> b!179326 (= c!32145 (validKeyInArray!0 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179327 () Bool)

(declare-fun e!118132 () Bool)

(assert (=> b!179327 (= e!118131 e!118132)))

(declare-fun lt!88471 () (_ BitVec 64))

(assert (=> b!179327 (= lt!88471 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5437 0))(
  ( (Unit!5438) )
))
(declare-fun lt!88469 () Unit!5437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7535 (_ BitVec 64) (_ BitVec 32)) Unit!5437)

(assert (=> b!179327 (= lt!88469 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5568 thiss!1248) lt!88471 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!179327 (arrayContainsKey!0 (_keys!5568 thiss!1248) lt!88471 #b00000000000000000000000000000000)))

(declare-fun lt!88470 () Unit!5437)

(assert (=> b!179327 (= lt!88470 lt!88469)))

(declare-fun res!84923 () Bool)

(assert (=> b!179327 (= res!84923 (= (seekEntryOrOpen!0 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000) (_keys!5568 thiss!1248) (mask!8662 thiss!1248)) (Found!590 #b00000000000000000000000000000000)))))

(assert (=> b!179327 (=> (not res!84923) (not e!118132))))

(declare-fun b!179328 () Bool)

(declare-fun call!18103 () Bool)

(assert (=> b!179328 (= e!118131 call!18103)))

(declare-fun bm!18100 () Bool)

(assert (=> bm!18100 (= call!18103 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5568 thiss!1248) (mask!8662 thiss!1248)))))

(declare-fun b!179329 () Bool)

(assert (=> b!179329 (= e!118132 call!18103)))

(assert (= (and d!54003 (not res!84922)) b!179326))

(assert (= (and b!179326 c!32145) b!179327))

(assert (= (and b!179326 (not c!32145)) b!179328))

(assert (= (and b!179327 res!84923) b!179329))

(assert (= (or b!179329 b!179328) bm!18100))

(assert (=> b!179326 m!207087))

(assert (=> b!179326 m!207087))

(assert (=> b!179326 m!207093))

(assert (=> b!179327 m!207087))

(declare-fun m!207095 () Bool)

(assert (=> b!179327 m!207095))

(declare-fun m!207097 () Bool)

(assert (=> b!179327 m!207097))

(assert (=> b!179327 m!207087))

(declare-fun m!207099 () Bool)

(assert (=> b!179327 m!207099))

(declare-fun m!207101 () Bool)

(assert (=> bm!18100 m!207101))

(assert (=> b!179218 d!54003))

(declare-fun d!54005 () Bool)

(declare-fun e!118138 () Bool)

(assert (=> d!54005 e!118138))

(declare-fun res!84926 () Bool)

(assert (=> d!54005 (=> res!84926 e!118138)))

(declare-fun lt!88481 () Bool)

(assert (=> d!54005 (= res!84926 (not lt!88481))))

(declare-fun lt!88482 () Bool)

(assert (=> d!54005 (= lt!88481 lt!88482)))

(declare-fun lt!88483 () Unit!5437)

(declare-fun e!118139 () Unit!5437)

(assert (=> d!54005 (= lt!88483 e!118139)))

(declare-fun c!32148 () Bool)

(assert (=> d!54005 (= c!32148 lt!88482)))

(declare-fun containsKey!204 (List!2273 (_ BitVec 64)) Bool)

(assert (=> d!54005 (= lt!88482 (containsKey!204 (toList!1130 (getCurrentListMap!766 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248))) key!828))))

(assert (=> d!54005 (= (contains!1209 (getCurrentListMap!766 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)) key!828) lt!88481)))

(declare-fun b!179336 () Bool)

(declare-fun lt!88480 () Unit!5437)

(assert (=> b!179336 (= e!118139 lt!88480)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!153 (List!2273 (_ BitVec 64)) Unit!5437)

(assert (=> b!179336 (= lt!88480 (lemmaContainsKeyImpliesGetValueByKeyDefined!153 (toList!1130 (getCurrentListMap!766 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248))) key!828))))

(declare-datatypes ((Option!206 0))(
  ( (Some!205 (v!4026 V!5241)) (None!204) )
))
(declare-fun isDefined!154 (Option!206) Bool)

(declare-fun getValueByKey!200 (List!2273 (_ BitVec 64)) Option!206)

(assert (=> b!179336 (isDefined!154 (getValueByKey!200 (toList!1130 (getCurrentListMap!766 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248))) key!828))))

(declare-fun b!179337 () Bool)

(declare-fun Unit!5439 () Unit!5437)

(assert (=> b!179337 (= e!118139 Unit!5439)))

(declare-fun b!179338 () Bool)

(assert (=> b!179338 (= e!118138 (isDefined!154 (getValueByKey!200 (toList!1130 (getCurrentListMap!766 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248))) key!828)))))

(assert (= (and d!54005 c!32148) b!179336))

(assert (= (and d!54005 (not c!32148)) b!179337))

(assert (= (and d!54005 (not res!84926)) b!179338))

(declare-fun m!207103 () Bool)

(assert (=> d!54005 m!207103))

(declare-fun m!207105 () Bool)

(assert (=> b!179336 m!207105))

(declare-fun m!207107 () Bool)

(assert (=> b!179336 m!207107))

(assert (=> b!179336 m!207107))

(declare-fun m!207109 () Bool)

(assert (=> b!179336 m!207109))

(assert (=> b!179338 m!207107))

(assert (=> b!179338 m!207107))

(assert (=> b!179338 m!207109))

(assert (=> b!179219 d!54005))

(declare-fun b!179381 () Bool)

(declare-fun e!118173 () Bool)

(declare-fun e!118171 () Bool)

(assert (=> b!179381 (= e!118173 e!118171)))

(declare-fun c!32163 () Bool)

(assert (=> b!179381 (= c!32163 (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179382 () Bool)

(declare-fun e!118174 () Unit!5437)

(declare-fun lt!88541 () Unit!5437)

(assert (=> b!179382 (= e!118174 lt!88541)))

(declare-fun lt!88536 () ListLongMap!2229)

(declare-fun getCurrentListMapNoExtraKeys!168 (array!7535 array!7537 (_ BitVec 32) (_ BitVec 32) V!5241 V!5241 (_ BitVec 32) Int) ListLongMap!2229)

(assert (=> b!179382 (= lt!88536 (getCurrentListMapNoExtraKeys!168 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)))))

(declare-fun lt!88545 () (_ BitVec 64))

(assert (=> b!179382 (= lt!88545 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88544 () (_ BitVec 64))

(assert (=> b!179382 (= lt!88544 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88530 () Unit!5437)

(declare-fun addStillContains!123 (ListLongMap!2229 (_ BitVec 64) V!5241 (_ BitVec 64)) Unit!5437)

(assert (=> b!179382 (= lt!88530 (addStillContains!123 lt!88536 lt!88545 (zeroValue!3523 thiss!1248) lt!88544))))

(declare-fun +!259 (ListLongMap!2229 tuple2!3310) ListLongMap!2229)

(assert (=> b!179382 (contains!1209 (+!259 lt!88536 (tuple2!3311 lt!88545 (zeroValue!3523 thiss!1248))) lt!88544)))

(declare-fun lt!88534 () Unit!5437)

(assert (=> b!179382 (= lt!88534 lt!88530)))

(declare-fun lt!88529 () ListLongMap!2229)

(assert (=> b!179382 (= lt!88529 (getCurrentListMapNoExtraKeys!168 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)))))

(declare-fun lt!88546 () (_ BitVec 64))

(assert (=> b!179382 (= lt!88546 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88538 () (_ BitVec 64))

(assert (=> b!179382 (= lt!88538 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88531 () Unit!5437)

(declare-fun addApplyDifferent!123 (ListLongMap!2229 (_ BitVec 64) V!5241 (_ BitVec 64)) Unit!5437)

(assert (=> b!179382 (= lt!88531 (addApplyDifferent!123 lt!88529 lt!88546 (minValue!3523 thiss!1248) lt!88538))))

(declare-fun apply!147 (ListLongMap!2229 (_ BitVec 64)) V!5241)

(assert (=> b!179382 (= (apply!147 (+!259 lt!88529 (tuple2!3311 lt!88546 (minValue!3523 thiss!1248))) lt!88538) (apply!147 lt!88529 lt!88538))))

(declare-fun lt!88535 () Unit!5437)

(assert (=> b!179382 (= lt!88535 lt!88531)))

(declare-fun lt!88528 () ListLongMap!2229)

(assert (=> b!179382 (= lt!88528 (getCurrentListMapNoExtraKeys!168 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)))))

(declare-fun lt!88548 () (_ BitVec 64))

(assert (=> b!179382 (= lt!88548 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88549 () (_ BitVec 64))

(assert (=> b!179382 (= lt!88549 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!88539 () Unit!5437)

(assert (=> b!179382 (= lt!88539 (addApplyDifferent!123 lt!88528 lt!88548 (zeroValue!3523 thiss!1248) lt!88549))))

(assert (=> b!179382 (= (apply!147 (+!259 lt!88528 (tuple2!3311 lt!88548 (zeroValue!3523 thiss!1248))) lt!88549) (apply!147 lt!88528 lt!88549))))

(declare-fun lt!88540 () Unit!5437)

(assert (=> b!179382 (= lt!88540 lt!88539)))

(declare-fun lt!88542 () ListLongMap!2229)

(assert (=> b!179382 (= lt!88542 (getCurrentListMapNoExtraKeys!168 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)))))

(declare-fun lt!88537 () (_ BitVec 64))

(assert (=> b!179382 (= lt!88537 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!88532 () (_ BitVec 64))

(assert (=> b!179382 (= lt!88532 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179382 (= lt!88541 (addApplyDifferent!123 lt!88542 lt!88537 (minValue!3523 thiss!1248) lt!88532))))

(assert (=> b!179382 (= (apply!147 (+!259 lt!88542 (tuple2!3311 lt!88537 (minValue!3523 thiss!1248))) lt!88532) (apply!147 lt!88542 lt!88532))))

(declare-fun b!179383 () Bool)

(declare-fun Unit!5440 () Unit!5437)

(assert (=> b!179383 (= e!118174 Unit!5440)))

(declare-fun b!179384 () Bool)

(declare-fun e!118177 () Bool)

(declare-fun lt!88547 () ListLongMap!2229)

(assert (=> b!179384 (= e!118177 (= (apply!147 lt!88547 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3523 thiss!1248)))))

(declare-fun bm!18115 () Bool)

(declare-fun call!18119 () ListLongMap!2229)

(declare-fun call!18120 () ListLongMap!2229)

(assert (=> bm!18115 (= call!18119 call!18120)))

(declare-fun b!179385 () Bool)

(declare-fun e!118166 () ListLongMap!2229)

(declare-fun call!18123 () ListLongMap!2229)

(assert (=> b!179385 (= e!118166 call!18123)))

(declare-fun b!179386 () Bool)

(declare-fun res!84946 () Bool)

(assert (=> b!179386 (=> (not res!84946) (not e!118173))))

(declare-fun e!118167 () Bool)

(assert (=> b!179386 (= res!84946 e!118167)))

(declare-fun c!32165 () Bool)

(assert (=> b!179386 (= c!32165 (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!179387 () Bool)

(assert (=> b!179387 (= e!118166 call!18119)))

(declare-fun b!179388 () Bool)

(assert (=> b!179388 (= e!118167 e!118177)))

(declare-fun res!84951 () Bool)

(declare-fun call!18122 () Bool)

(assert (=> b!179388 (= res!84951 call!18122)))

(assert (=> b!179388 (=> (not res!84951) (not e!118177))))

(declare-fun b!179389 () Bool)

(assert (=> b!179389 (= e!118167 (not call!18122))))

(declare-fun b!179390 () Bool)

(declare-fun e!118168 () ListLongMap!2229)

(declare-fun e!118178 () ListLongMap!2229)

(assert (=> b!179390 (= e!118168 e!118178)))

(declare-fun c!32164 () Bool)

(assert (=> b!179390 (= c!32164 (and (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!179391 () Bool)

(declare-fun e!118172 () Bool)

(assert (=> b!179391 (= e!118172 (= (apply!147 lt!88547 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3523 thiss!1248)))))

(declare-fun bm!18117 () Bool)

(assert (=> bm!18117 (= call!18122 (contains!1209 lt!88547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179392 () Bool)

(declare-fun res!84949 () Bool)

(assert (=> b!179392 (=> (not res!84949) (not e!118173))))

(declare-fun e!118176 () Bool)

(assert (=> b!179392 (= res!84949 e!118176)))

(declare-fun res!84948 () Bool)

(assert (=> b!179392 (=> res!84948 e!118176)))

(declare-fun e!118175 () Bool)

(assert (=> b!179392 (= res!84948 (not e!118175))))

(declare-fun res!84947 () Bool)

(assert (=> b!179392 (=> (not res!84947) (not e!118175))))

(assert (=> b!179392 (= res!84947 (bvslt #b00000000000000000000000000000000 (size!3877 (_keys!5568 thiss!1248))))))

(declare-fun bm!18118 () Bool)

(declare-fun call!18118 () ListLongMap!2229)

(assert (=> bm!18118 (= call!18123 call!18118)))

(declare-fun b!179393 () Bool)

(assert (=> b!179393 (= e!118168 (+!259 call!18120 (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3523 thiss!1248))))))

(declare-fun b!179394 () Bool)

(declare-fun call!18121 () Bool)

(assert (=> b!179394 (= e!118171 (not call!18121))))

(declare-fun d!54007 () Bool)

(assert (=> d!54007 e!118173))

(declare-fun res!84953 () Bool)

(assert (=> d!54007 (=> (not res!84953) (not e!118173))))

(assert (=> d!54007 (= res!84953 (or (bvsge #b00000000000000000000000000000000 (size!3877 (_keys!5568 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3877 (_keys!5568 thiss!1248))))))))

(declare-fun lt!88533 () ListLongMap!2229)

(assert (=> d!54007 (= lt!88547 lt!88533)))

(declare-fun lt!88543 () Unit!5437)

(assert (=> d!54007 (= lt!88543 e!118174)))

(declare-fun c!32166 () Bool)

(declare-fun e!118169 () Bool)

(assert (=> d!54007 (= c!32166 e!118169)))

(declare-fun res!84952 () Bool)

(assert (=> d!54007 (=> (not res!84952) (not e!118169))))

(assert (=> d!54007 (= res!84952 (bvslt #b00000000000000000000000000000000 (size!3877 (_keys!5568 thiss!1248))))))

(assert (=> d!54007 (= lt!88533 e!118168)))

(declare-fun c!32161 () Bool)

(assert (=> d!54007 (= c!32161 (and (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54007 (validMask!0 (mask!8662 thiss!1248))))

(assert (=> d!54007 (= (getCurrentListMap!766 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)) lt!88547)))

(declare-fun bm!18116 () Bool)

(declare-fun call!18124 () ListLongMap!2229)

(assert (=> bm!18116 (= call!18120 (+!259 (ite c!32161 call!18124 (ite c!32164 call!18118 call!18123)) (ite (or c!32161 c!32164) (tuple2!3311 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3523 thiss!1248)) (tuple2!3311 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3523 thiss!1248)))))))

(declare-fun b!179395 () Bool)

(assert (=> b!179395 (= e!118175 (validKeyInArray!0 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18119 () Bool)

(assert (=> bm!18119 (= call!18121 (contains!1209 lt!88547 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!179396 () Bool)

(declare-fun c!32162 () Bool)

(assert (=> b!179396 (= c!32162 (and (not (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3419 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!179396 (= e!118178 e!118166)))

(declare-fun b!179397 () Bool)

(assert (=> b!179397 (= e!118171 e!118172)))

(declare-fun res!84945 () Bool)

(assert (=> b!179397 (= res!84945 call!18121)))

(assert (=> b!179397 (=> (not res!84945) (not e!118172))))

(declare-fun bm!18120 () Bool)

(assert (=> bm!18120 (= call!18124 (getCurrentListMapNoExtraKeys!168 (_keys!5568 thiss!1248) (_values!3665 thiss!1248) (mask!8662 thiss!1248) (extraKeys!3419 thiss!1248) (zeroValue!3523 thiss!1248) (minValue!3523 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3682 thiss!1248)))))

(declare-fun b!179398 () Bool)

(assert (=> b!179398 (= e!118178 call!18119)))

(declare-fun b!179399 () Bool)

(declare-fun e!118170 () Bool)

(declare-fun get!2044 (ValueCell!1754 V!5241) V!5241)

(declare-fun dynLambda!481 (Int (_ BitVec 64)) V!5241)

(assert (=> b!179399 (= e!118170 (= (apply!147 lt!88547 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000)) (get!2044 (select (arr!3569 (_values!3665 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!481 (defaultEntry!3682 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!179399 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3878 (_values!3665 thiss!1248))))))

(assert (=> b!179399 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3877 (_keys!5568 thiss!1248))))))

(declare-fun b!179400 () Bool)

(assert (=> b!179400 (= e!118169 (validKeyInArray!0 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!179401 () Bool)

(assert (=> b!179401 (= e!118176 e!118170)))

(declare-fun res!84950 () Bool)

(assert (=> b!179401 (=> (not res!84950) (not e!118170))))

(assert (=> b!179401 (= res!84950 (contains!1209 lt!88547 (select (arr!3568 (_keys!5568 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!179401 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3877 (_keys!5568 thiss!1248))))))

(declare-fun bm!18121 () Bool)

(assert (=> bm!18121 (= call!18118 call!18124)))

(assert (= (and d!54007 c!32161) b!179393))

(assert (= (and d!54007 (not c!32161)) b!179390))

(assert (= (and b!179390 c!32164) b!179398))

(assert (= (and b!179390 (not c!32164)) b!179396))

(assert (= (and b!179396 c!32162) b!179387))

(assert (= (and b!179396 (not c!32162)) b!179385))

(assert (= (or b!179387 b!179385) bm!18118))

(assert (= (or b!179398 bm!18118) bm!18121))

(assert (= (or b!179398 b!179387) bm!18115))

(assert (= (or b!179393 bm!18121) bm!18120))

(assert (= (or b!179393 bm!18115) bm!18116))

(assert (= (and d!54007 res!84952) b!179400))

(assert (= (and d!54007 c!32166) b!179382))

(assert (= (and d!54007 (not c!32166)) b!179383))

(assert (= (and d!54007 res!84953) b!179392))

(assert (= (and b!179392 res!84947) b!179395))

(assert (= (and b!179392 (not res!84948)) b!179401))

(assert (= (and b!179401 res!84950) b!179399))

(assert (= (and b!179392 res!84949) b!179386))

(assert (= (and b!179386 c!32165) b!179388))

(assert (= (and b!179386 (not c!32165)) b!179389))

(assert (= (and b!179388 res!84951) b!179384))

(assert (= (or b!179388 b!179389) bm!18117))

(assert (= (and b!179386 res!84946) b!179381))

(assert (= (and b!179381 c!32163) b!179397))

(assert (= (and b!179381 (not c!32163)) b!179394))

(assert (= (and b!179397 res!84945) b!179391))

(assert (= (or b!179397 b!179394) bm!18119))

(declare-fun b_lambda!7093 () Bool)

(assert (=> (not b_lambda!7093) (not b!179399)))

(declare-fun t!7111 () Bool)

(declare-fun tb!2797 () Bool)

(assert (=> (and b!179221 (= (defaultEntry!3682 thiss!1248) (defaultEntry!3682 thiss!1248)) t!7111) tb!2797))

(declare-fun result!4681 () Bool)

(assert (=> tb!2797 (= result!4681 tp_is_empty!4195)))

(assert (=> b!179399 t!7111))

(declare-fun b_and!10933 () Bool)

(assert (= b_and!10927 (and (=> t!7111 result!4681) b_and!10933)))

(assert (=> b!179400 m!207087))

(assert (=> b!179400 m!207087))

(assert (=> b!179400 m!207093))

(declare-fun m!207111 () Bool)

(assert (=> b!179393 m!207111))

(assert (=> b!179395 m!207087))

(assert (=> b!179395 m!207087))

(assert (=> b!179395 m!207093))

(declare-fun m!207113 () Bool)

(assert (=> bm!18120 m!207113))

(declare-fun m!207115 () Bool)

(assert (=> b!179384 m!207115))

(declare-fun m!207117 () Bool)

(assert (=> b!179382 m!207117))

(declare-fun m!207119 () Bool)

(assert (=> b!179382 m!207119))

(declare-fun m!207121 () Bool)

(assert (=> b!179382 m!207121))

(assert (=> b!179382 m!207117))

(assert (=> b!179382 m!207113))

(assert (=> b!179382 m!207121))

(declare-fun m!207123 () Bool)

(assert (=> b!179382 m!207123))

(declare-fun m!207125 () Bool)

(assert (=> b!179382 m!207125))

(declare-fun m!207127 () Bool)

(assert (=> b!179382 m!207127))

(declare-fun m!207129 () Bool)

(assert (=> b!179382 m!207129))

(declare-fun m!207131 () Bool)

(assert (=> b!179382 m!207131))

(declare-fun m!207133 () Bool)

(assert (=> b!179382 m!207133))

(declare-fun m!207135 () Bool)

(assert (=> b!179382 m!207135))

(declare-fun m!207137 () Bool)

(assert (=> b!179382 m!207137))

(declare-fun m!207139 () Bool)

(assert (=> b!179382 m!207139))

(declare-fun m!207141 () Bool)

(assert (=> b!179382 m!207141))

(assert (=> b!179382 m!207125))

(declare-fun m!207143 () Bool)

(assert (=> b!179382 m!207143))

(assert (=> b!179382 m!207087))

(assert (=> b!179382 m!207135))

(declare-fun m!207145 () Bool)

(assert (=> b!179382 m!207145))

(assert (=> b!179399 m!207087))

(declare-fun m!207147 () Bool)

(assert (=> b!179399 m!207147))

(declare-fun m!207149 () Bool)

(assert (=> b!179399 m!207149))

(assert (=> b!179399 m!207087))

(assert (=> b!179399 m!207149))

(declare-fun m!207151 () Bool)

(assert (=> b!179399 m!207151))

(declare-fun m!207153 () Bool)

(assert (=> b!179399 m!207153))

(assert (=> b!179399 m!207151))

(declare-fun m!207155 () Bool)

(assert (=> bm!18119 m!207155))

(declare-fun m!207157 () Bool)

(assert (=> bm!18116 m!207157))

(declare-fun m!207159 () Bool)

(assert (=> bm!18117 m!207159))

(declare-fun m!207161 () Bool)

(assert (=> b!179391 m!207161))

(assert (=> d!54007 m!207033))

(assert (=> b!179401 m!207087))

(assert (=> b!179401 m!207087))

(declare-fun m!207163 () Bool)

(assert (=> b!179401 m!207163))

(assert (=> b!179219 d!54007))

(declare-fun b!179416 () Bool)

(declare-fun lt!88557 () SeekEntryResult!590)

(declare-fun e!118185 () SeekEntryResult!590)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7535 (_ BitVec 32)) SeekEntryResult!590)

(assert (=> b!179416 (= e!118185 (seekKeyOrZeroReturnVacant!0 (x!19627 lt!88557) (index!4530 lt!88557) (index!4530 lt!88557) key!828 (_keys!5568 thiss!1248) (mask!8662 thiss!1248)))))

(declare-fun b!179417 () Bool)

(declare-fun e!118187 () SeekEntryResult!590)

(assert (=> b!179417 (= e!118187 (Found!590 (index!4530 lt!88557)))))

(declare-fun b!179418 () Bool)

(declare-fun e!118186 () SeekEntryResult!590)

(assert (=> b!179418 (= e!118186 e!118187)))

(declare-fun lt!88558 () (_ BitVec 64))

(assert (=> b!179418 (= lt!88558 (select (arr!3568 (_keys!5568 thiss!1248)) (index!4530 lt!88557)))))

(declare-fun c!32173 () Bool)

(assert (=> b!179418 (= c!32173 (= lt!88558 key!828))))

(declare-fun d!54009 () Bool)

(declare-fun lt!88556 () SeekEntryResult!590)

(assert (=> d!54009 (and (or ((_ is Undefined!590) lt!88556) (not ((_ is Found!590) lt!88556)) (and (bvsge (index!4529 lt!88556) #b00000000000000000000000000000000) (bvslt (index!4529 lt!88556) (size!3877 (_keys!5568 thiss!1248))))) (or ((_ is Undefined!590) lt!88556) ((_ is Found!590) lt!88556) (not ((_ is MissingZero!590) lt!88556)) (and (bvsge (index!4528 lt!88556) #b00000000000000000000000000000000) (bvslt (index!4528 lt!88556) (size!3877 (_keys!5568 thiss!1248))))) (or ((_ is Undefined!590) lt!88556) ((_ is Found!590) lt!88556) ((_ is MissingZero!590) lt!88556) (not ((_ is MissingVacant!590) lt!88556)) (and (bvsge (index!4531 lt!88556) #b00000000000000000000000000000000) (bvslt (index!4531 lt!88556) (size!3877 (_keys!5568 thiss!1248))))) (or ((_ is Undefined!590) lt!88556) (ite ((_ is Found!590) lt!88556) (= (select (arr!3568 (_keys!5568 thiss!1248)) (index!4529 lt!88556)) key!828) (ite ((_ is MissingZero!590) lt!88556) (= (select (arr!3568 (_keys!5568 thiss!1248)) (index!4528 lt!88556)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!590) lt!88556) (= (select (arr!3568 (_keys!5568 thiss!1248)) (index!4531 lt!88556)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54009 (= lt!88556 e!118186)))

(declare-fun c!32174 () Bool)

(assert (=> d!54009 (= c!32174 (and ((_ is Intermediate!590) lt!88557) (undefined!1402 lt!88557)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7535 (_ BitVec 32)) SeekEntryResult!590)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54009 (= lt!88557 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8662 thiss!1248)) key!828 (_keys!5568 thiss!1248) (mask!8662 thiss!1248)))))

(assert (=> d!54009 (validMask!0 (mask!8662 thiss!1248))))

(assert (=> d!54009 (= (seekEntryOrOpen!0 key!828 (_keys!5568 thiss!1248) (mask!8662 thiss!1248)) lt!88556)))

(declare-fun b!179419 () Bool)

(declare-fun c!32175 () Bool)

(assert (=> b!179419 (= c!32175 (= lt!88558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!179419 (= e!118187 e!118185)))

(declare-fun b!179420 () Bool)

(assert (=> b!179420 (= e!118185 (MissingZero!590 (index!4530 lt!88557)))))

(declare-fun b!179421 () Bool)

(assert (=> b!179421 (= e!118186 Undefined!590)))

(assert (= (and d!54009 c!32174) b!179421))

(assert (= (and d!54009 (not c!32174)) b!179418))

(assert (= (and b!179418 c!32173) b!179417))

(assert (= (and b!179418 (not c!32173)) b!179419))

(assert (= (and b!179419 c!32175) b!179420))

(assert (= (and b!179419 (not c!32175)) b!179416))

(declare-fun m!207165 () Bool)

(assert (=> b!179416 m!207165))

(declare-fun m!207167 () Bool)

(assert (=> b!179418 m!207167))

(declare-fun m!207169 () Bool)

(assert (=> d!54009 m!207169))

(declare-fun m!207171 () Bool)

(assert (=> d!54009 m!207171))

(declare-fun m!207173 () Bool)

(assert (=> d!54009 m!207173))

(assert (=> d!54009 m!207169))

(declare-fun m!207175 () Bool)

(assert (=> d!54009 m!207175))

(declare-fun m!207177 () Bool)

(assert (=> d!54009 m!207177))

(assert (=> d!54009 m!207033))

(assert (=> b!179224 d!54009))

(declare-fun d!54011 () Bool)

(assert (=> d!54011 (= (validMask!0 (mask!8662 thiss!1248)) (and (or (= (mask!8662 thiss!1248) #b00000000000000000000000000000111) (= (mask!8662 thiss!1248) #b00000000000000000000000000001111) (= (mask!8662 thiss!1248) #b00000000000000000000000000011111) (= (mask!8662 thiss!1248) #b00000000000000000000000000111111) (= (mask!8662 thiss!1248) #b00000000000000000000000001111111) (= (mask!8662 thiss!1248) #b00000000000000000000000011111111) (= (mask!8662 thiss!1248) #b00000000000000000000000111111111) (= (mask!8662 thiss!1248) #b00000000000000000000001111111111) (= (mask!8662 thiss!1248) #b00000000000000000000011111111111) (= (mask!8662 thiss!1248) #b00000000000000000000111111111111) (= (mask!8662 thiss!1248) #b00000000000000000001111111111111) (= (mask!8662 thiss!1248) #b00000000000000000011111111111111) (= (mask!8662 thiss!1248) #b00000000000000000111111111111111) (= (mask!8662 thiss!1248) #b00000000000000001111111111111111) (= (mask!8662 thiss!1248) #b00000000000000011111111111111111) (= (mask!8662 thiss!1248) #b00000000000000111111111111111111) (= (mask!8662 thiss!1248) #b00000000000001111111111111111111) (= (mask!8662 thiss!1248) #b00000000000011111111111111111111) (= (mask!8662 thiss!1248) #b00000000000111111111111111111111) (= (mask!8662 thiss!1248) #b00000000001111111111111111111111) (= (mask!8662 thiss!1248) #b00000000011111111111111111111111) (= (mask!8662 thiss!1248) #b00000000111111111111111111111111) (= (mask!8662 thiss!1248) #b00000001111111111111111111111111) (= (mask!8662 thiss!1248) #b00000011111111111111111111111111) (= (mask!8662 thiss!1248) #b00000111111111111111111111111111) (= (mask!8662 thiss!1248) #b00001111111111111111111111111111) (= (mask!8662 thiss!1248) #b00011111111111111111111111111111) (= (mask!8662 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8662 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!179220 d!54011))

(declare-fun b!179429 () Bool)

(declare-fun e!118192 () Bool)

(assert (=> b!179429 (= e!118192 tp_is_empty!4195)))

(declare-fun b!179428 () Bool)

(declare-fun e!118193 () Bool)

(assert (=> b!179428 (= e!118193 tp_is_empty!4195)))

(declare-fun condMapEmpty!7189 () Bool)

(declare-fun mapDefault!7189 () ValueCell!1754)

(assert (=> mapNonEmpty!7180 (= condMapEmpty!7189 (= mapRest!7180 ((as const (Array (_ BitVec 32) ValueCell!1754)) mapDefault!7189)))))

(declare-fun mapRes!7189 () Bool)

(assert (=> mapNonEmpty!7180 (= tp!15993 (and e!118192 mapRes!7189))))

(declare-fun mapNonEmpty!7189 () Bool)

(declare-fun tp!16009 () Bool)

(assert (=> mapNonEmpty!7189 (= mapRes!7189 (and tp!16009 e!118193))))

(declare-fun mapRest!7189 () (Array (_ BitVec 32) ValueCell!1754))

(declare-fun mapValue!7189 () ValueCell!1754)

(declare-fun mapKey!7189 () (_ BitVec 32))

(assert (=> mapNonEmpty!7189 (= mapRest!7180 (store mapRest!7189 mapKey!7189 mapValue!7189))))

(declare-fun mapIsEmpty!7189 () Bool)

(assert (=> mapIsEmpty!7189 mapRes!7189))

(assert (= (and mapNonEmpty!7180 condMapEmpty!7189) mapIsEmpty!7189))

(assert (= (and mapNonEmpty!7180 (not condMapEmpty!7189)) mapNonEmpty!7189))

(assert (= (and mapNonEmpty!7189 ((_ is ValueCellFull!1754) mapValue!7189)) b!179428))

(assert (= (and mapNonEmpty!7180 ((_ is ValueCellFull!1754) mapDefault!7189)) b!179429))

(declare-fun m!207179 () Bool)

(assert (=> mapNonEmpty!7189 m!207179))

(declare-fun b_lambda!7095 () Bool)

(assert (= b_lambda!7093 (or (and b!179221 b_free!4423) b_lambda!7095)))

(check-sat (not b!179401) (not b!179301) b_and!10933 (not b!179416) (not d!54009) (not b!179391) tp_is_empty!4195 (not d!53995) (not d!54007) (not b!179326) (not bm!18116) (not b!179395) (not b!179400) (not b!179327) (not b!179314) (not b!179302) (not bm!18097) (not b!179393) (not d!54005) (not mapNonEmpty!7189) (not bm!18120) (not b!179336) (not b!179300) (not b!179338) (not b!179382) (not bm!18119) (not b!179384) (not b_lambda!7095) (not bm!18117) (not b!179313) (not b!179399) (not b!179317) (not b_next!4423) (not bm!18100))
(check-sat b_and!10933 (not b_next!4423))
