; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21980 () Bool)

(assert start!21980)

(declare-fun b!225325 () Bool)

(declare-fun b_free!6043 () Bool)

(declare-fun b_next!6043 () Bool)

(assert (=> b!225325 (= b_free!6043 (not b_next!6043))))

(declare-fun tp!21271 () Bool)

(declare-fun b_and!12955 () Bool)

(assert (=> b!225325 (= tp!21271 b_and!12955)))

(declare-fun b!225324 () Bool)

(declare-fun res!110886 () Bool)

(declare-fun e!146247 () Bool)

(assert (=> b!225324 (=> res!110886 e!146247)))

(declare-datatypes ((V!7521 0))(
  ( (V!7522 (val!2997 Int)) )
))
(declare-datatypes ((ValueCell!2609 0))(
  ( (ValueCellFull!2609 (v!5018 V!7521)) (EmptyCell!2609) )
))
(declare-datatypes ((array!11051 0))(
  ( (array!11052 (arr!5245 (Array (_ BitVec 32) ValueCell!2609)) (size!5578 (_ BitVec 32))) )
))
(declare-datatypes ((array!11053 0))(
  ( (array!11054 (arr!5246 (Array (_ BitVec 32) (_ BitVec 64))) (size!5579 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3118 0))(
  ( (LongMapFixedSize!3119 (defaultEntry!4218 Int) (mask!10060 (_ BitVec 32)) (extraKeys!3955 (_ BitVec 32)) (zeroValue!4059 V!7521) (minValue!4059 V!7521) (_size!1608 (_ BitVec 32)) (_keys!6272 array!11053) (_values!4201 array!11051) (_vacant!1608 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3118)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225324 (= res!110886 (or (not (= (size!5579 (_keys!6272 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10060 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5579 (_keys!6272 thiss!1504)))))))

(declare-fun e!146257 () Bool)

(declare-fun tp_is_empty!5905 () Bool)

(declare-fun e!146249 () Bool)

(declare-fun array_inv!3447 (array!11053) Bool)

(declare-fun array_inv!3448 (array!11051) Bool)

(assert (=> b!225325 (= e!146249 (and tp!21271 tp_is_empty!5905 (array_inv!3447 (_keys!6272 thiss!1504)) (array_inv!3448 (_values!4201 thiss!1504)) e!146257))))

(declare-fun b!225326 () Bool)

(declare-fun e!146246 () Bool)

(assert (=> b!225326 (= e!146246 tp_is_empty!5905)))

(declare-fun c!37367 () Bool)

(declare-fun call!20952 () Bool)

(declare-fun bm!20948 () Bool)

(declare-datatypes ((SeekEntryResult!841 0))(
  ( (MissingZero!841 (index!5534 (_ BitVec 32))) (Found!841 (index!5535 (_ BitVec 32))) (Intermediate!841 (undefined!1653 Bool) (index!5536 (_ BitVec 32)) (x!23149 (_ BitVec 32))) (Undefined!841) (MissingVacant!841 (index!5537 (_ BitVec 32))) )
))
(declare-fun lt!113536 () SeekEntryResult!841)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20948 (= call!20952 (inRange!0 (ite c!37367 (index!5534 lt!113536) (index!5537 lt!113536)) (mask!10060 thiss!1504)))))

(declare-fun b!225327 () Bool)

(declare-fun e!146256 () Bool)

(declare-fun e!146254 () Bool)

(assert (=> b!225327 (= e!146256 e!146254)))

(declare-fun res!110895 () Bool)

(assert (=> b!225327 (=> (not res!110895) (not e!146254))))

(assert (=> b!225327 (= res!110895 (inRange!0 index!297 (mask!10060 thiss!1504)))))

(declare-datatypes ((Unit!6763 0))(
  ( (Unit!6764) )
))
(declare-fun lt!113539 () Unit!6763)

(declare-fun e!146252 () Unit!6763)

(assert (=> b!225327 (= lt!113539 e!146252)))

(declare-fun c!37368 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4356 0))(
  ( (tuple2!4357 (_1!2189 (_ BitVec 64)) (_2!2189 V!7521)) )
))
(declare-datatypes ((List!3262 0))(
  ( (Nil!3259) (Cons!3258 (h!3906 tuple2!4356) (t!8213 List!3262)) )
))
(declare-datatypes ((ListLongMap!3271 0))(
  ( (ListLongMap!3272 (toList!1651 List!3262)) )
))
(declare-fun contains!1540 (ListLongMap!3271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1183 (array!11053 array!11051 (_ BitVec 32) (_ BitVec 32) V!7521 V!7521 (_ BitVec 32) Int) ListLongMap!3271)

(assert (=> b!225327 (= c!37368 (contains!1540 (getCurrentListMap!1183 (_keys!6272 thiss!1504) (_values!4201 thiss!1504) (mask!10060 thiss!1504) (extraKeys!3955 thiss!1504) (zeroValue!4059 thiss!1504) (minValue!4059 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4218 thiss!1504)) key!932))))

(declare-fun b!225328 () Bool)

(declare-fun e!146255 () Bool)

(declare-fun call!20951 () Bool)

(assert (=> b!225328 (= e!146255 (not call!20951))))

(declare-fun b!225329 () Bool)

(declare-fun res!110896 () Bool)

(assert (=> b!225329 (=> (not res!110896) (not e!146255))))

(assert (=> b!225329 (= res!110896 call!20952)))

(declare-fun e!146244 () Bool)

(assert (=> b!225329 (= e!146244 e!146255)))

(declare-fun b!225330 () Bool)

(declare-fun e!146248 () Bool)

(assert (=> b!225330 (= e!146248 e!146256)))

(declare-fun res!110887 () Bool)

(assert (=> b!225330 (=> (not res!110887) (not e!146256))))

(assert (=> b!225330 (= res!110887 (or (= lt!113536 (MissingZero!841 index!297)) (= lt!113536 (MissingVacant!841 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11053 (_ BitVec 32)) SeekEntryResult!841)

(assert (=> b!225330 (= lt!113536 (seekEntryOrOpen!0 key!932 (_keys!6272 thiss!1504) (mask!10060 thiss!1504)))))

(declare-fun b!225331 () Bool)

(declare-fun e!146253 () Unit!6763)

(declare-fun Unit!6765 () Unit!6763)

(assert (=> b!225331 (= e!146253 Unit!6765)))

(declare-fun b!225332 () Bool)

(declare-fun res!110885 () Bool)

(assert (=> b!225332 (=> (not res!110885) (not e!146248))))

(assert (=> b!225332 (= res!110885 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10027 () Bool)

(declare-fun mapRes!10027 () Bool)

(declare-fun tp!21270 () Bool)

(assert (=> mapNonEmpty!10027 (= mapRes!10027 (and tp!21270 e!146246))))

(declare-fun mapRest!10027 () (Array (_ BitVec 32) ValueCell!2609))

(declare-fun mapKey!10027 () (_ BitVec 32))

(declare-fun mapValue!10027 () ValueCell!2609)

(assert (=> mapNonEmpty!10027 (= (arr!5245 (_values!4201 thiss!1504)) (store mapRest!10027 mapKey!10027 mapValue!10027))))

(declare-fun b!225333 () Bool)

(declare-fun e!146245 () Bool)

(assert (=> b!225333 (= e!146245 (not call!20951))))

(declare-fun b!225334 () Bool)

(declare-fun res!110892 () Bool)

(assert (=> b!225334 (=> (not res!110892) (not e!146255))))

(assert (=> b!225334 (= res!110892 (= (select (arr!5246 (_keys!6272 thiss!1504)) (index!5534 lt!113536)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225335 () Bool)

(declare-fun e!146250 () Bool)

(get-info :version)

(assert (=> b!225335 (= e!146250 ((_ is Undefined!841) lt!113536))))

(declare-fun b!225336 () Bool)

(assert (=> b!225336 (= e!146254 (not e!146247))))

(declare-fun res!110884 () Bool)

(assert (=> b!225336 (=> res!110884 e!146247)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225336 (= res!110884 (not (validMask!0 (mask!10060 thiss!1504))))))

(declare-fun lt!113540 () array!11053)

(declare-fun arrayCountValidKeys!0 (array!11053 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225336 (= (arrayCountValidKeys!0 lt!113540 #b00000000000000000000000000000000 (size!5579 (_keys!6272 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6272 thiss!1504) #b00000000000000000000000000000000 (size!5579 (_keys!6272 thiss!1504)))))))

(declare-fun lt!113532 () Unit!6763)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11053 (_ BitVec 32) (_ BitVec 64)) Unit!6763)

(assert (=> b!225336 (= lt!113532 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6272 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3263 0))(
  ( (Nil!3260) (Cons!3259 (h!3907 (_ BitVec 64)) (t!8214 List!3263)) )
))
(declare-fun arrayNoDuplicates!0 (array!11053 (_ BitVec 32) List!3263) Bool)

(assert (=> b!225336 (arrayNoDuplicates!0 lt!113540 #b00000000000000000000000000000000 Nil!3260)))

(assert (=> b!225336 (= lt!113540 (array!11054 (store (arr!5246 (_keys!6272 thiss!1504)) index!297 key!932) (size!5579 (_keys!6272 thiss!1504))))))

(declare-fun lt!113538 () Unit!6763)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11053 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3263) Unit!6763)

(assert (=> b!225336 (= lt!113538 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6272 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3260))))

(declare-fun lt!113534 () Unit!6763)

(assert (=> b!225336 (= lt!113534 e!146253)))

(declare-fun c!37369 () Bool)

(declare-fun lt!113533 () Bool)

(assert (=> b!225336 (= c!37369 lt!113533)))

(declare-fun arrayContainsKey!0 (array!11053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225336 (= lt!113533 (arrayContainsKey!0 (_keys!6272 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225337 () Bool)

(declare-fun res!110889 () Bool)

(assert (=> b!225337 (=> res!110889 e!146247)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225337 (= res!110889 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225338 () Bool)

(declare-fun c!37366 () Bool)

(assert (=> b!225338 (= c!37366 ((_ is MissingVacant!841) lt!113536))))

(assert (=> b!225338 (= e!146244 e!146250)))

(declare-fun b!225339 () Bool)

(declare-fun lt!113541 () Unit!6763)

(assert (=> b!225339 (= e!146252 lt!113541)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!237 (array!11053 array!11051 (_ BitVec 32) (_ BitVec 32) V!7521 V!7521 (_ BitVec 64) Int) Unit!6763)

(assert (=> b!225339 (= lt!113541 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!237 (_keys!6272 thiss!1504) (_values!4201 thiss!1504) (mask!10060 thiss!1504) (extraKeys!3955 thiss!1504) (zeroValue!4059 thiss!1504) (minValue!4059 thiss!1504) key!932 (defaultEntry!4218 thiss!1504)))))

(assert (=> b!225339 (= c!37367 ((_ is MissingZero!841) lt!113536))))

(assert (=> b!225339 e!146244))

(declare-fun b!225340 () Bool)

(declare-fun res!110894 () Bool)

(assert (=> b!225340 (= res!110894 (= (select (arr!5246 (_keys!6272 thiss!1504)) (index!5537 lt!113536)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!225340 (=> (not res!110894) (not e!146245))))

(declare-fun b!225341 () Bool)

(declare-fun e!146251 () Bool)

(assert (=> b!225341 (= e!146251 tp_is_empty!5905)))

(declare-fun b!225342 () Bool)

(assert (=> b!225342 (= e!146247 true)))

(declare-fun lt!113542 () Bool)

(assert (=> b!225342 (= lt!113542 (arrayNoDuplicates!0 (_keys!6272 thiss!1504) #b00000000000000000000000000000000 Nil!3260))))

(declare-fun mapIsEmpty!10027 () Bool)

(assert (=> mapIsEmpty!10027 mapRes!10027))

(declare-fun b!225343 () Bool)

(declare-fun Unit!6766 () Unit!6763)

(assert (=> b!225343 (= e!146252 Unit!6766)))

(declare-fun lt!113535 () Unit!6763)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!246 (array!11053 array!11051 (_ BitVec 32) (_ BitVec 32) V!7521 V!7521 (_ BitVec 64) Int) Unit!6763)

(assert (=> b!225343 (= lt!113535 (lemmaInListMapThenSeekEntryOrOpenFindsIt!246 (_keys!6272 thiss!1504) (_values!4201 thiss!1504) (mask!10060 thiss!1504) (extraKeys!3955 thiss!1504) (zeroValue!4059 thiss!1504) (minValue!4059 thiss!1504) key!932 (defaultEntry!4218 thiss!1504)))))

(assert (=> b!225343 false))

(declare-fun b!225344 () Bool)

(declare-fun res!110893 () Bool)

(assert (=> b!225344 (=> res!110893 e!146247)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11053 (_ BitVec 32)) Bool)

(assert (=> b!225344 (= res!110893 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6272 thiss!1504) (mask!10060 thiss!1504))))))

(declare-fun b!225345 () Bool)

(declare-fun Unit!6767 () Unit!6763)

(assert (=> b!225345 (= e!146253 Unit!6767)))

(declare-fun lt!113537 () Unit!6763)

(declare-fun lemmaArrayContainsKeyThenInListMap!83 (array!11053 array!11051 (_ BitVec 32) (_ BitVec 32) V!7521 V!7521 (_ BitVec 64) (_ BitVec 32) Int) Unit!6763)

(assert (=> b!225345 (= lt!113537 (lemmaArrayContainsKeyThenInListMap!83 (_keys!6272 thiss!1504) (_values!4201 thiss!1504) (mask!10060 thiss!1504) (extraKeys!3955 thiss!1504) (zeroValue!4059 thiss!1504) (minValue!4059 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4218 thiss!1504)))))

(assert (=> b!225345 false))

(declare-fun b!225346 () Bool)

(declare-fun res!110888 () Bool)

(assert (=> b!225346 (=> res!110888 e!146247)))

(assert (=> b!225346 (= res!110888 lt!113533)))

(declare-fun b!225347 () Bool)

(assert (=> b!225347 (= e!146257 (and e!146251 mapRes!10027))))

(declare-fun condMapEmpty!10027 () Bool)

(declare-fun mapDefault!10027 () ValueCell!2609)

(assert (=> b!225347 (= condMapEmpty!10027 (= (arr!5245 (_values!4201 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2609)) mapDefault!10027)))))

(declare-fun b!225348 () Bool)

(assert (=> b!225348 (= e!146250 e!146245)))

(declare-fun res!110890 () Bool)

(assert (=> b!225348 (= res!110890 call!20952)))

(assert (=> b!225348 (=> (not res!110890) (not e!146245))))

(declare-fun bm!20949 () Bool)

(assert (=> bm!20949 (= call!20951 (arrayContainsKey!0 (_keys!6272 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!110891 () Bool)

(assert (=> start!21980 (=> (not res!110891) (not e!146248))))

(declare-fun valid!1262 (LongMapFixedSize!3118) Bool)

(assert (=> start!21980 (= res!110891 (valid!1262 thiss!1504))))

(assert (=> start!21980 e!146248))

(assert (=> start!21980 e!146249))

(assert (=> start!21980 true))

(assert (= (and start!21980 res!110891) b!225332))

(assert (= (and b!225332 res!110885) b!225330))

(assert (= (and b!225330 res!110887) b!225327))

(assert (= (and b!225327 c!37368) b!225343))

(assert (= (and b!225327 (not c!37368)) b!225339))

(assert (= (and b!225339 c!37367) b!225329))

(assert (= (and b!225339 (not c!37367)) b!225338))

(assert (= (and b!225329 res!110896) b!225334))

(assert (= (and b!225334 res!110892) b!225328))

(assert (= (and b!225338 c!37366) b!225348))

(assert (= (and b!225338 (not c!37366)) b!225335))

(assert (= (and b!225348 res!110890) b!225340))

(assert (= (and b!225340 res!110894) b!225333))

(assert (= (or b!225329 b!225348) bm!20948))

(assert (= (or b!225328 b!225333) bm!20949))

(assert (= (and b!225327 res!110895) b!225336))

(assert (= (and b!225336 c!37369) b!225345))

(assert (= (and b!225336 (not c!37369)) b!225331))

(assert (= (and b!225336 (not res!110884)) b!225324))

(assert (= (and b!225324 (not res!110886)) b!225337))

(assert (= (and b!225337 (not res!110889)) b!225346))

(assert (= (and b!225346 (not res!110888)) b!225344))

(assert (= (and b!225344 (not res!110893)) b!225342))

(assert (= (and b!225347 condMapEmpty!10027) mapIsEmpty!10027))

(assert (= (and b!225347 (not condMapEmpty!10027)) mapNonEmpty!10027))

(assert (= (and mapNonEmpty!10027 ((_ is ValueCellFull!2609) mapValue!10027)) b!225326))

(assert (= (and b!225347 ((_ is ValueCellFull!2609) mapDefault!10027)) b!225341))

(assert (= b!225325 b!225347))

(assert (= start!21980 b!225325))

(declare-fun m!248131 () Bool)

(assert (=> b!225334 m!248131))

(declare-fun m!248133 () Bool)

(assert (=> start!21980 m!248133))

(declare-fun m!248135 () Bool)

(assert (=> b!225330 m!248135))

(declare-fun m!248137 () Bool)

(assert (=> bm!20949 m!248137))

(declare-fun m!248139 () Bool)

(assert (=> b!225337 m!248139))

(declare-fun m!248141 () Bool)

(assert (=> mapNonEmpty!10027 m!248141))

(declare-fun m!248143 () Bool)

(assert (=> b!225327 m!248143))

(declare-fun m!248145 () Bool)

(assert (=> b!225327 m!248145))

(assert (=> b!225327 m!248145))

(declare-fun m!248147 () Bool)

(assert (=> b!225327 m!248147))

(declare-fun m!248149 () Bool)

(assert (=> b!225340 m!248149))

(declare-fun m!248151 () Bool)

(assert (=> b!225336 m!248151))

(assert (=> b!225336 m!248137))

(declare-fun m!248153 () Bool)

(assert (=> b!225336 m!248153))

(declare-fun m!248155 () Bool)

(assert (=> b!225336 m!248155))

(declare-fun m!248157 () Bool)

(assert (=> b!225336 m!248157))

(declare-fun m!248159 () Bool)

(assert (=> b!225336 m!248159))

(declare-fun m!248161 () Bool)

(assert (=> b!225336 m!248161))

(declare-fun m!248163 () Bool)

(assert (=> b!225336 m!248163))

(declare-fun m!248165 () Bool)

(assert (=> b!225342 m!248165))

(declare-fun m!248167 () Bool)

(assert (=> bm!20948 m!248167))

(declare-fun m!248169 () Bool)

(assert (=> b!225339 m!248169))

(declare-fun m!248171 () Bool)

(assert (=> b!225344 m!248171))

(declare-fun m!248173 () Bool)

(assert (=> b!225325 m!248173))

(declare-fun m!248175 () Bool)

(assert (=> b!225325 m!248175))

(declare-fun m!248177 () Bool)

(assert (=> b!225343 m!248177))

(declare-fun m!248179 () Bool)

(assert (=> b!225345 m!248179))

(check-sat (not b!225345) b_and!12955 (not mapNonEmpty!10027) (not bm!20949) (not b!225339) (not b!225330) (not b!225342) (not b!225337) (not bm!20948) (not b!225344) (not b_next!6043) (not b!225343) (not b!225336) tp_is_empty!5905 (not b!225325) (not b!225327) (not start!21980))
(check-sat b_and!12955 (not b_next!6043))
