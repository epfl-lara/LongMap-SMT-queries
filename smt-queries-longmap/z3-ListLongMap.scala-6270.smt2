; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80382 () Bool)

(assert start!80382)

(declare-fun b!943200 () Bool)

(declare-fun b_free!17941 () Bool)

(declare-fun b_next!17941 () Bool)

(assert (=> b!943200 (= b_free!17941 (not b_next!17941))))

(declare-fun tp!62324 () Bool)

(declare-fun b_and!29363 () Bool)

(assert (=> b!943200 (= tp!62324 b_and!29363)))

(declare-fun b!943195 () Bool)

(declare-fun res!633576 () Bool)

(declare-fun e!530383 () Bool)

(assert (=> b!943195 (=> (not res!633576) (not e!530383))))

(declare-datatypes ((V!32231 0))(
  ( (V!32232 (val!10275 Int)) )
))
(declare-datatypes ((ValueCell!9743 0))(
  ( (ValueCellFull!9743 (v!12803 V!32231)) (EmptyCell!9743) )
))
(declare-datatypes ((array!56911 0))(
  ( (array!56912 (arr!27379 (Array (_ BitVec 32) ValueCell!9743)) (size!27845 (_ BitVec 32))) )
))
(declare-datatypes ((array!56913 0))(
  ( (array!56914 (arr!27380 (Array (_ BitVec 32) (_ BitVec 64))) (size!27846 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4636 0))(
  ( (LongMapFixedSize!4637 (defaultEntry!5609 Int) (mask!27254 (_ BitVec 32)) (extraKeys!5341 (_ BitVec 32)) (zeroValue!5445 V!32231) (minValue!5445 V!32231) (_size!2373 (_ BitVec 32)) (_keys!10507 array!56913) (_values!5632 array!56911) (_vacant!2373 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4636)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943195 (= res!633576 (validMask!0 (mask!27254 thiss!1141)))))

(declare-fun b!943196 () Bool)

(declare-fun e!530385 () Bool)

(declare-fun e!530384 () Bool)

(declare-fun mapRes!32489 () Bool)

(assert (=> b!943196 (= e!530385 (and e!530384 mapRes!32489))))

(declare-fun condMapEmpty!32489 () Bool)

(declare-fun mapDefault!32489 () ValueCell!9743)

(assert (=> b!943196 (= condMapEmpty!32489 (= (arr!27379 (_values!5632 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9743)) mapDefault!32489)))))

(declare-fun b!943197 () Bool)

(declare-fun tp_is_empty!20449 () Bool)

(assert (=> b!943197 (= e!530384 tp_is_empty!20449)))

(declare-fun b!943198 () Bool)

(declare-datatypes ((List!19197 0))(
  ( (Nil!19194) (Cons!19193 (h!20349 (_ BitVec 64)) (t!27504 List!19197)) )
))
(declare-fun arrayNoDuplicates!0 (array!56913 (_ BitVec 32) List!19197) Bool)

(assert (=> b!943198 (= e!530383 (not (arrayNoDuplicates!0 (_keys!10507 thiss!1141) #b00000000000000000000000000000000 Nil!19194)))))

(declare-fun b!943199 () Bool)

(declare-fun res!633573 () Bool)

(assert (=> b!943199 (=> (not res!633573) (not e!530383))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!8985 0))(
  ( (MissingZero!8985 (index!38311 (_ BitVec 32))) (Found!8985 (index!38312 (_ BitVec 32))) (Intermediate!8985 (undefined!9797 Bool) (index!38313 (_ BitVec 32)) (x!80872 (_ BitVec 32))) (Undefined!8985) (MissingVacant!8985 (index!38314 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56913 (_ BitVec 32)) SeekEntryResult!8985)

(assert (=> b!943199 (= res!633573 (not ((_ is Found!8985) (seekEntry!0 key!756 (_keys!10507 thiss!1141) (mask!27254 thiss!1141)))))))

(declare-fun res!633575 () Bool)

(assert (=> start!80382 (=> (not res!633575) (not e!530383))))

(declare-fun valid!1780 (LongMapFixedSize!4636) Bool)

(assert (=> start!80382 (= res!633575 (valid!1780 thiss!1141))))

(assert (=> start!80382 e!530383))

(declare-fun e!530388 () Bool)

(assert (=> start!80382 e!530388))

(assert (=> start!80382 true))

(declare-fun array_inv!21364 (array!56913) Bool)

(declare-fun array_inv!21365 (array!56911) Bool)

(assert (=> b!943200 (= e!530388 (and tp!62324 tp_is_empty!20449 (array_inv!21364 (_keys!10507 thiss!1141)) (array_inv!21365 (_values!5632 thiss!1141)) e!530385))))

(declare-fun b!943201 () Bool)

(declare-fun res!633572 () Bool)

(assert (=> b!943201 (=> (not res!633572) (not e!530383))))

(assert (=> b!943201 (= res!633572 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943202 () Bool)

(declare-fun e!530387 () Bool)

(assert (=> b!943202 (= e!530387 tp_is_empty!20449)))

(declare-fun b!943203 () Bool)

(declare-fun res!633574 () Bool)

(assert (=> b!943203 (=> (not res!633574) (not e!530383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56913 (_ BitVec 32)) Bool)

(assert (=> b!943203 (= res!633574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10507 thiss!1141) (mask!27254 thiss!1141)))))

(declare-fun mapIsEmpty!32489 () Bool)

(assert (=> mapIsEmpty!32489 mapRes!32489))

(declare-fun mapNonEmpty!32489 () Bool)

(declare-fun tp!62323 () Bool)

(assert (=> mapNonEmpty!32489 (= mapRes!32489 (and tp!62323 e!530387))))

(declare-fun mapRest!32489 () (Array (_ BitVec 32) ValueCell!9743))

(declare-fun mapKey!32489 () (_ BitVec 32))

(declare-fun mapValue!32489 () ValueCell!9743)

(assert (=> mapNonEmpty!32489 (= (arr!27379 (_values!5632 thiss!1141)) (store mapRest!32489 mapKey!32489 mapValue!32489))))

(declare-fun b!943204 () Bool)

(declare-fun res!633577 () Bool)

(assert (=> b!943204 (=> (not res!633577) (not e!530383))))

(assert (=> b!943204 (= res!633577 (and (= (size!27845 (_values!5632 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27254 thiss!1141))) (= (size!27846 (_keys!10507 thiss!1141)) (size!27845 (_values!5632 thiss!1141))) (bvsge (mask!27254 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5341 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5341 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!80382 res!633575) b!943201))

(assert (= (and b!943201 res!633572) b!943199))

(assert (= (and b!943199 res!633573) b!943195))

(assert (= (and b!943195 res!633576) b!943204))

(assert (= (and b!943204 res!633577) b!943203))

(assert (= (and b!943203 res!633574) b!943198))

(assert (= (and b!943196 condMapEmpty!32489) mapIsEmpty!32489))

(assert (= (and b!943196 (not condMapEmpty!32489)) mapNonEmpty!32489))

(assert (= (and mapNonEmpty!32489 ((_ is ValueCellFull!9743) mapValue!32489)) b!943202))

(assert (= (and b!943196 ((_ is ValueCellFull!9743) mapDefault!32489)) b!943197))

(assert (= b!943200 b!943196))

(assert (= start!80382 b!943200))

(declare-fun m!878233 () Bool)

(assert (=> mapNonEmpty!32489 m!878233))

(declare-fun m!878235 () Bool)

(assert (=> b!943203 m!878235))

(declare-fun m!878237 () Bool)

(assert (=> b!943199 m!878237))

(declare-fun m!878239 () Bool)

(assert (=> b!943198 m!878239))

(declare-fun m!878241 () Bool)

(assert (=> start!80382 m!878241))

(declare-fun m!878243 () Bool)

(assert (=> b!943200 m!878243))

(declare-fun m!878245 () Bool)

(assert (=> b!943200 m!878245))

(declare-fun m!878247 () Bool)

(assert (=> b!943195 m!878247))

(check-sat (not b!943200) (not b!943198) tp_is_empty!20449 (not b!943203) (not b!943195) (not b_next!17941) (not b!943199) b_and!29363 (not start!80382) (not mapNonEmpty!32489))
(check-sat b_and!29363 (not b_next!17941))
(get-model)

(declare-fun d!114495 () Bool)

(assert (=> d!114495 (= (validMask!0 (mask!27254 thiss!1141)) (and (or (= (mask!27254 thiss!1141) #b00000000000000000000000000000111) (= (mask!27254 thiss!1141) #b00000000000000000000000000001111) (= (mask!27254 thiss!1141) #b00000000000000000000000000011111) (= (mask!27254 thiss!1141) #b00000000000000000000000000111111) (= (mask!27254 thiss!1141) #b00000000000000000000000001111111) (= (mask!27254 thiss!1141) #b00000000000000000000000011111111) (= (mask!27254 thiss!1141) #b00000000000000000000000111111111) (= (mask!27254 thiss!1141) #b00000000000000000000001111111111) (= (mask!27254 thiss!1141) #b00000000000000000000011111111111) (= (mask!27254 thiss!1141) #b00000000000000000000111111111111) (= (mask!27254 thiss!1141) #b00000000000000000001111111111111) (= (mask!27254 thiss!1141) #b00000000000000000011111111111111) (= (mask!27254 thiss!1141) #b00000000000000000111111111111111) (= (mask!27254 thiss!1141) #b00000000000000001111111111111111) (= (mask!27254 thiss!1141) #b00000000000000011111111111111111) (= (mask!27254 thiss!1141) #b00000000000000111111111111111111) (= (mask!27254 thiss!1141) #b00000000000001111111111111111111) (= (mask!27254 thiss!1141) #b00000000000011111111111111111111) (= (mask!27254 thiss!1141) #b00000000000111111111111111111111) (= (mask!27254 thiss!1141) #b00000000001111111111111111111111) (= (mask!27254 thiss!1141) #b00000000011111111111111111111111) (= (mask!27254 thiss!1141) #b00000000111111111111111111111111) (= (mask!27254 thiss!1141) #b00000001111111111111111111111111) (= (mask!27254 thiss!1141) #b00000011111111111111111111111111) (= (mask!27254 thiss!1141) #b00000111111111111111111111111111) (= (mask!27254 thiss!1141) #b00001111111111111111111111111111) (= (mask!27254 thiss!1141) #b00011111111111111111111111111111) (= (mask!27254 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27254 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!943195 d!114495))

(declare-fun d!114497 () Bool)

(assert (=> d!114497 (= (array_inv!21364 (_keys!10507 thiss!1141)) (bvsge (size!27846 (_keys!10507 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943200 d!114497))

(declare-fun d!114499 () Bool)

(assert (=> d!114499 (= (array_inv!21365 (_values!5632 thiss!1141)) (bvsge (size!27845 (_values!5632 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943200 d!114499))

(declare-fun b!943277 () Bool)

(declare-fun c!98503 () Bool)

(declare-fun lt!425505 () (_ BitVec 64))

(assert (=> b!943277 (= c!98503 (= lt!425505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!530432 () SeekEntryResult!8985)

(declare-fun e!530433 () SeekEntryResult!8985)

(assert (=> b!943277 (= e!530432 e!530433)))

(declare-fun b!943278 () Bool)

(declare-fun e!530431 () SeekEntryResult!8985)

(assert (=> b!943278 (= e!530431 e!530432)))

(declare-fun lt!425507 () SeekEntryResult!8985)

(assert (=> b!943278 (= lt!425505 (select (arr!27380 (_keys!10507 thiss!1141)) (index!38313 lt!425507)))))

(declare-fun c!98502 () Bool)

(assert (=> b!943278 (= c!98502 (= lt!425505 key!756))))

(declare-fun d!114501 () Bool)

(declare-fun lt!425504 () SeekEntryResult!8985)

(assert (=> d!114501 (and (or ((_ is MissingVacant!8985) lt!425504) (not ((_ is Found!8985) lt!425504)) (and (bvsge (index!38312 lt!425504) #b00000000000000000000000000000000) (bvslt (index!38312 lt!425504) (size!27846 (_keys!10507 thiss!1141))))) (not ((_ is MissingVacant!8985) lt!425504)) (or (not ((_ is Found!8985) lt!425504)) (= (select (arr!27380 (_keys!10507 thiss!1141)) (index!38312 lt!425504)) key!756)))))

(assert (=> d!114501 (= lt!425504 e!530431)))

(declare-fun c!98501 () Bool)

(assert (=> d!114501 (= c!98501 (and ((_ is Intermediate!8985) lt!425507) (undefined!9797 lt!425507)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56913 (_ BitVec 32)) SeekEntryResult!8985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114501 (= lt!425507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27254 thiss!1141)) key!756 (_keys!10507 thiss!1141) (mask!27254 thiss!1141)))))

(assert (=> d!114501 (validMask!0 (mask!27254 thiss!1141))))

(assert (=> d!114501 (= (seekEntry!0 key!756 (_keys!10507 thiss!1141) (mask!27254 thiss!1141)) lt!425504)))

(declare-fun b!943279 () Bool)

(assert (=> b!943279 (= e!530432 (Found!8985 (index!38313 lt!425507)))))

(declare-fun b!943280 () Bool)

(declare-fun lt!425506 () SeekEntryResult!8985)

(assert (=> b!943280 (= e!530433 (ite ((_ is MissingVacant!8985) lt!425506) (MissingZero!8985 (index!38314 lt!425506)) lt!425506))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56913 (_ BitVec 32)) SeekEntryResult!8985)

(assert (=> b!943280 (= lt!425506 (seekKeyOrZeroReturnVacant!0 (x!80872 lt!425507) (index!38313 lt!425507) (index!38313 lt!425507) key!756 (_keys!10507 thiss!1141) (mask!27254 thiss!1141)))))

(declare-fun b!943281 () Bool)

(assert (=> b!943281 (= e!530431 Undefined!8985)))

(declare-fun b!943282 () Bool)

(assert (=> b!943282 (= e!530433 (MissingZero!8985 (index!38313 lt!425507)))))

(assert (= (and d!114501 c!98501) b!943281))

(assert (= (and d!114501 (not c!98501)) b!943278))

(assert (= (and b!943278 c!98502) b!943279))

(assert (= (and b!943278 (not c!98502)) b!943277))

(assert (= (and b!943277 c!98503) b!943282))

(assert (= (and b!943277 (not c!98503)) b!943280))

(declare-fun m!878281 () Bool)

(assert (=> b!943278 m!878281))

(declare-fun m!878283 () Bool)

(assert (=> d!114501 m!878283))

(declare-fun m!878285 () Bool)

(assert (=> d!114501 m!878285))

(assert (=> d!114501 m!878285))

(declare-fun m!878287 () Bool)

(assert (=> d!114501 m!878287))

(assert (=> d!114501 m!878247))

(declare-fun m!878289 () Bool)

(assert (=> b!943280 m!878289))

(assert (=> b!943199 d!114501))

(declare-fun d!114503 () Bool)

(declare-fun res!633620 () Bool)

(declare-fun e!530436 () Bool)

(assert (=> d!114503 (=> (not res!633620) (not e!530436))))

(declare-fun simpleValid!346 (LongMapFixedSize!4636) Bool)

(assert (=> d!114503 (= res!633620 (simpleValid!346 thiss!1141))))

(assert (=> d!114503 (= (valid!1780 thiss!1141) e!530436)))

(declare-fun b!943289 () Bool)

(declare-fun res!633621 () Bool)

(assert (=> b!943289 (=> (not res!633621) (not e!530436))))

(declare-fun arrayCountValidKeys!0 (array!56913 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943289 (= res!633621 (= (arrayCountValidKeys!0 (_keys!10507 thiss!1141) #b00000000000000000000000000000000 (size!27846 (_keys!10507 thiss!1141))) (_size!2373 thiss!1141)))))

(declare-fun b!943290 () Bool)

(declare-fun res!633622 () Bool)

(assert (=> b!943290 (=> (not res!633622) (not e!530436))))

(assert (=> b!943290 (= res!633622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10507 thiss!1141) (mask!27254 thiss!1141)))))

(declare-fun b!943291 () Bool)

(assert (=> b!943291 (= e!530436 (arrayNoDuplicates!0 (_keys!10507 thiss!1141) #b00000000000000000000000000000000 Nil!19194))))

(assert (= (and d!114503 res!633620) b!943289))

(assert (= (and b!943289 res!633621) b!943290))

(assert (= (and b!943290 res!633622) b!943291))

(declare-fun m!878291 () Bool)

(assert (=> d!114503 m!878291))

(declare-fun m!878293 () Bool)

(assert (=> b!943289 m!878293))

(assert (=> b!943290 m!878235))

(assert (=> b!943291 m!878239))

(assert (=> start!80382 d!114503))

(declare-fun b!943302 () Bool)

(declare-fun e!530446 () Bool)

(declare-fun e!530447 () Bool)

(assert (=> b!943302 (= e!530446 e!530447)))

(declare-fun c!98506 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!943302 (= c!98506 (validKeyInArray!0 (select (arr!27380 (_keys!10507 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40998 () Bool)

(declare-fun call!41001 () Bool)

(assert (=> bm!40998 (= call!41001 (arrayNoDuplicates!0 (_keys!10507 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98506 (Cons!19193 (select (arr!27380 (_keys!10507 thiss!1141)) #b00000000000000000000000000000000) Nil!19194) Nil!19194)))))

(declare-fun b!943303 () Bool)

(declare-fun e!530448 () Bool)

(assert (=> b!943303 (= e!530448 e!530446)))

(declare-fun res!633630 () Bool)

(assert (=> b!943303 (=> (not res!633630) (not e!530446))))

(declare-fun e!530445 () Bool)

(assert (=> b!943303 (= res!633630 (not e!530445))))

(declare-fun res!633629 () Bool)

(assert (=> b!943303 (=> (not res!633629) (not e!530445))))

(assert (=> b!943303 (= res!633629 (validKeyInArray!0 (select (arr!27380 (_keys!10507 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114505 () Bool)

(declare-fun res!633631 () Bool)

(assert (=> d!114505 (=> res!633631 e!530448)))

(assert (=> d!114505 (= res!633631 (bvsge #b00000000000000000000000000000000 (size!27846 (_keys!10507 thiss!1141))))))

(assert (=> d!114505 (= (arrayNoDuplicates!0 (_keys!10507 thiss!1141) #b00000000000000000000000000000000 Nil!19194) e!530448)))

(declare-fun b!943304 () Bool)

(declare-fun contains!5139 (List!19197 (_ BitVec 64)) Bool)

(assert (=> b!943304 (= e!530445 (contains!5139 Nil!19194 (select (arr!27380 (_keys!10507 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943305 () Bool)

(assert (=> b!943305 (= e!530447 call!41001)))

(declare-fun b!943306 () Bool)

(assert (=> b!943306 (= e!530447 call!41001)))

(assert (= (and d!114505 (not res!633631)) b!943303))

(assert (= (and b!943303 res!633629) b!943304))

(assert (= (and b!943303 res!633630) b!943302))

(assert (= (and b!943302 c!98506) b!943306))

(assert (= (and b!943302 (not c!98506)) b!943305))

(assert (= (or b!943306 b!943305) bm!40998))

(declare-fun m!878295 () Bool)

(assert (=> b!943302 m!878295))

(assert (=> b!943302 m!878295))

(declare-fun m!878297 () Bool)

(assert (=> b!943302 m!878297))

(assert (=> bm!40998 m!878295))

(declare-fun m!878299 () Bool)

(assert (=> bm!40998 m!878299))

(assert (=> b!943303 m!878295))

(assert (=> b!943303 m!878295))

(assert (=> b!943303 m!878297))

(assert (=> b!943304 m!878295))

(assert (=> b!943304 m!878295))

(declare-fun m!878301 () Bool)

(assert (=> b!943304 m!878301))

(assert (=> b!943198 d!114505))

(declare-fun b!943315 () Bool)

(declare-fun e!530457 () Bool)

(declare-fun e!530456 () Bool)

(assert (=> b!943315 (= e!530457 e!530456)))

(declare-fun lt!425514 () (_ BitVec 64))

(assert (=> b!943315 (= lt!425514 (select (arr!27380 (_keys!10507 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31784 0))(
  ( (Unit!31785) )
))
(declare-fun lt!425516 () Unit!31784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56913 (_ BitVec 64) (_ BitVec 32)) Unit!31784)

(assert (=> b!943315 (= lt!425516 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10507 thiss!1141) lt!425514 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943315 (arrayContainsKey!0 (_keys!10507 thiss!1141) lt!425514 #b00000000000000000000000000000000)))

(declare-fun lt!425515 () Unit!31784)

(assert (=> b!943315 (= lt!425515 lt!425516)))

(declare-fun res!633636 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56913 (_ BitVec 32)) SeekEntryResult!8985)

(assert (=> b!943315 (= res!633636 (= (seekEntryOrOpen!0 (select (arr!27380 (_keys!10507 thiss!1141)) #b00000000000000000000000000000000) (_keys!10507 thiss!1141) (mask!27254 thiss!1141)) (Found!8985 #b00000000000000000000000000000000)))))

(assert (=> b!943315 (=> (not res!633636) (not e!530456))))

(declare-fun b!943316 () Bool)

(declare-fun call!41004 () Bool)

(assert (=> b!943316 (= e!530456 call!41004)))

(declare-fun bm!41001 () Bool)

(assert (=> bm!41001 (= call!41004 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10507 thiss!1141) (mask!27254 thiss!1141)))))

(declare-fun d!114507 () Bool)

(declare-fun res!633637 () Bool)

(declare-fun e!530455 () Bool)

(assert (=> d!114507 (=> res!633637 e!530455)))

(assert (=> d!114507 (= res!633637 (bvsge #b00000000000000000000000000000000 (size!27846 (_keys!10507 thiss!1141))))))

(assert (=> d!114507 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10507 thiss!1141) (mask!27254 thiss!1141)) e!530455)))

(declare-fun b!943317 () Bool)

(assert (=> b!943317 (= e!530457 call!41004)))

(declare-fun b!943318 () Bool)

(assert (=> b!943318 (= e!530455 e!530457)))

(declare-fun c!98509 () Bool)

(assert (=> b!943318 (= c!98509 (validKeyInArray!0 (select (arr!27380 (_keys!10507 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114507 (not res!633637)) b!943318))

(assert (= (and b!943318 c!98509) b!943315))

(assert (= (and b!943318 (not c!98509)) b!943317))

(assert (= (and b!943315 res!633636) b!943316))

(assert (= (or b!943316 b!943317) bm!41001))

(assert (=> b!943315 m!878295))

(declare-fun m!878303 () Bool)

(assert (=> b!943315 m!878303))

(declare-fun m!878305 () Bool)

(assert (=> b!943315 m!878305))

(assert (=> b!943315 m!878295))

(declare-fun m!878307 () Bool)

(assert (=> b!943315 m!878307))

(declare-fun m!878309 () Bool)

(assert (=> bm!41001 m!878309))

(assert (=> b!943318 m!878295))

(assert (=> b!943318 m!878295))

(assert (=> b!943318 m!878297))

(assert (=> b!943203 d!114507))

(declare-fun b!943325 () Bool)

(declare-fun e!530463 () Bool)

(assert (=> b!943325 (= e!530463 tp_is_empty!20449)))

(declare-fun mapNonEmpty!32498 () Bool)

(declare-fun mapRes!32498 () Bool)

(declare-fun tp!62339 () Bool)

(assert (=> mapNonEmpty!32498 (= mapRes!32498 (and tp!62339 e!530463))))

(declare-fun mapRest!32498 () (Array (_ BitVec 32) ValueCell!9743))

(declare-fun mapKey!32498 () (_ BitVec 32))

(declare-fun mapValue!32498 () ValueCell!9743)

(assert (=> mapNonEmpty!32498 (= mapRest!32489 (store mapRest!32498 mapKey!32498 mapValue!32498))))

(declare-fun condMapEmpty!32498 () Bool)

(declare-fun mapDefault!32498 () ValueCell!9743)

(assert (=> mapNonEmpty!32489 (= condMapEmpty!32498 (= mapRest!32489 ((as const (Array (_ BitVec 32) ValueCell!9743)) mapDefault!32498)))))

(declare-fun e!530462 () Bool)

(assert (=> mapNonEmpty!32489 (= tp!62323 (and e!530462 mapRes!32498))))

(declare-fun mapIsEmpty!32498 () Bool)

(assert (=> mapIsEmpty!32498 mapRes!32498))

(declare-fun b!943326 () Bool)

(assert (=> b!943326 (= e!530462 tp_is_empty!20449)))

(assert (= (and mapNonEmpty!32489 condMapEmpty!32498) mapIsEmpty!32498))

(assert (= (and mapNonEmpty!32489 (not condMapEmpty!32498)) mapNonEmpty!32498))

(assert (= (and mapNonEmpty!32498 ((_ is ValueCellFull!9743) mapValue!32498)) b!943325))

(assert (= (and mapNonEmpty!32489 ((_ is ValueCellFull!9743) mapDefault!32498)) b!943326))

(declare-fun m!878311 () Bool)

(assert (=> mapNonEmpty!32498 m!878311))

(check-sat (not b!943289) (not b!943302) (not bm!40998) (not b!943291) (not d!114503) (not b!943290) (not b_next!17941) (not bm!41001) (not b!943280) (not b!943304) (not b!943315) (not b!943303) (not mapNonEmpty!32498) (not b!943318) tp_is_empty!20449 (not d!114501) b_and!29363)
(check-sat b_and!29363 (not b_next!17941))
