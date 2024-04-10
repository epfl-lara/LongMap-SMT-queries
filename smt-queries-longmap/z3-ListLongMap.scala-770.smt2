; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18122 () Bool)

(assert start!18122)

(declare-fun b!180448 () Bool)

(declare-fun b_free!4461 () Bool)

(declare-fun b_next!4461 () Bool)

(assert (=> b!180448 (= b_free!4461 (not b_next!4461))))

(declare-fun tp!16120 () Bool)

(declare-fun b_and!10995 () Bool)

(assert (=> b!180448 (= tp!16120 b_and!10995)))

(declare-fun res!85473 () Bool)

(declare-fun e!118873 () Bool)

(assert (=> start!18122 (=> (not res!85473) (not e!118873))))

(declare-datatypes ((V!5291 0))(
  ( (V!5292 (val!2161 Int)) )
))
(declare-datatypes ((ValueCell!1773 0))(
  ( (ValueCellFull!1773 (v!4054 V!5291)) (EmptyCell!1773) )
))
(declare-datatypes ((array!7639 0))(
  ( (array!7640 (arr!3617 (Array (_ BitVec 32) (_ BitVec 64))) (size!3925 (_ BitVec 32))) )
))
(declare-datatypes ((array!7641 0))(
  ( (array!7642 (arr!3618 (Array (_ BitVec 32) ValueCell!1773)) (size!3926 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2454 0))(
  ( (LongMapFixedSize!2455 (defaultEntry!3703 Int) (mask!8704 (_ BitVec 32)) (extraKeys!3440 (_ BitVec 32)) (zeroValue!3544 V!5291) (minValue!3544 V!5291) (_size!1276 (_ BitVec 32)) (_keys!5596 array!7639) (_values!3686 array!7641) (_vacant!1276 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2454)

(declare-fun valid!1019 (LongMapFixedSize!2454) Bool)

(assert (=> start!18122 (= res!85473 (valid!1019 thiss!1248))))

(assert (=> start!18122 e!118873))

(declare-fun e!118870 () Bool)

(assert (=> start!18122 e!118870))

(assert (=> start!18122 true))

(declare-fun b!180447 () Bool)

(declare-fun e!118871 () Bool)

(declare-fun tp_is_empty!4233 () Bool)

(assert (=> b!180447 (= e!118871 tp_is_empty!4233)))

(declare-fun e!118874 () Bool)

(declare-fun array_inv!2329 (array!7639) Bool)

(declare-fun array_inv!2330 (array!7641) Bool)

(assert (=> b!180448 (= e!118870 (and tp!16120 tp_is_empty!4233 (array_inv!2329 (_keys!5596 thiss!1248)) (array_inv!2330 (_values!3686 thiss!1248)) e!118874))))

(declare-fun b!180449 () Bool)

(declare-fun e!118872 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!180449 (= e!118872 (not (validMask!0 (mask!8704 thiss!1248))))))

(declare-fun b!180450 () Bool)

(declare-fun e!118869 () Bool)

(assert (=> b!180450 (= e!118869 tp_is_empty!4233)))

(declare-fun mapIsEmpty!7249 () Bool)

(declare-fun mapRes!7249 () Bool)

(assert (=> mapIsEmpty!7249 mapRes!7249))

(declare-fun b!180451 () Bool)

(declare-fun res!85472 () Bool)

(assert (=> b!180451 (=> (not res!85472) (not e!118873))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!180451 (= res!85472 (not (= key!828 (bvneg key!828))))))

(declare-fun b!180452 () Bool)

(declare-fun res!85471 () Bool)

(assert (=> b!180452 (=> (not res!85471) (not e!118872))))

(declare-datatypes ((tuple2!3370 0))(
  ( (tuple2!3371 (_1!1696 (_ BitVec 64)) (_2!1696 V!5291)) )
))
(declare-datatypes ((List!2296 0))(
  ( (Nil!2293) (Cons!2292 (h!2917 tuple2!3370) (t!7144 List!2296)) )
))
(declare-datatypes ((ListLongMap!2287 0))(
  ( (ListLongMap!2288 (toList!1159 List!2296)) )
))
(declare-fun contains!1235 (ListLongMap!2287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!807 (array!7639 array!7641 (_ BitVec 32) (_ BitVec 32) V!5291 V!5291 (_ BitVec 32) Int) ListLongMap!2287)

(assert (=> b!180452 (= res!85471 (contains!1235 (getCurrentListMap!807 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!7249 () Bool)

(declare-fun tp!16119 () Bool)

(assert (=> mapNonEmpty!7249 (= mapRes!7249 (and tp!16119 e!118869))))

(declare-fun mapKey!7249 () (_ BitVec 32))

(declare-fun mapRest!7249 () (Array (_ BitVec 32) ValueCell!1773))

(declare-fun mapValue!7249 () ValueCell!1773)

(assert (=> mapNonEmpty!7249 (= (arr!3618 (_values!3686 thiss!1248)) (store mapRest!7249 mapKey!7249 mapValue!7249))))

(declare-fun b!180453 () Bool)

(assert (=> b!180453 (= e!118874 (and e!118871 mapRes!7249))))

(declare-fun condMapEmpty!7249 () Bool)

(declare-fun mapDefault!7249 () ValueCell!1773)

(assert (=> b!180453 (= condMapEmpty!7249 (= (arr!3618 (_values!3686 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1773)) mapDefault!7249)))))

(declare-fun b!180454 () Bool)

(assert (=> b!180454 (= e!118873 e!118872)))

(declare-fun res!85474 () Bool)

(assert (=> b!180454 (=> (not res!85474) (not e!118872))))

(declare-datatypes ((SeekEntryResult!593 0))(
  ( (MissingZero!593 (index!4542 (_ BitVec 32))) (Found!593 (index!4543 (_ BitVec 32))) (Intermediate!593 (undefined!1405 Bool) (index!4544 (_ BitVec 32)) (x!19727 (_ BitVec 32))) (Undefined!593) (MissingVacant!593 (index!4545 (_ BitVec 32))) )
))
(declare-fun lt!89177 () SeekEntryResult!593)

(get-info :version)

(assert (=> b!180454 (= res!85474 (and (not ((_ is Undefined!593) lt!89177)) (not ((_ is MissingVacant!593) lt!89177)) (not ((_ is MissingZero!593) lt!89177)) ((_ is Found!593) lt!89177)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7639 (_ BitVec 32)) SeekEntryResult!593)

(assert (=> b!180454 (= lt!89177 (seekEntryOrOpen!0 key!828 (_keys!5596 thiss!1248) (mask!8704 thiss!1248)))))

(assert (= (and start!18122 res!85473) b!180451))

(assert (= (and b!180451 res!85472) b!180454))

(assert (= (and b!180454 res!85474) b!180452))

(assert (= (and b!180452 res!85471) b!180449))

(assert (= (and b!180453 condMapEmpty!7249) mapIsEmpty!7249))

(assert (= (and b!180453 (not condMapEmpty!7249)) mapNonEmpty!7249))

(assert (= (and mapNonEmpty!7249 ((_ is ValueCellFull!1773) mapValue!7249)) b!180450))

(assert (= (and b!180453 ((_ is ValueCellFull!1773) mapDefault!7249)) b!180447))

(assert (= b!180448 b!180453))

(assert (= start!18122 b!180448))

(declare-fun m!208477 () Bool)

(assert (=> b!180454 m!208477))

(declare-fun m!208479 () Bool)

(assert (=> b!180448 m!208479))

(declare-fun m!208481 () Bool)

(assert (=> b!180448 m!208481))

(declare-fun m!208483 () Bool)

(assert (=> b!180452 m!208483))

(assert (=> b!180452 m!208483))

(declare-fun m!208485 () Bool)

(assert (=> b!180452 m!208485))

(declare-fun m!208487 () Bool)

(assert (=> start!18122 m!208487))

(declare-fun m!208489 () Bool)

(assert (=> b!180449 m!208489))

(declare-fun m!208491 () Bool)

(assert (=> mapNonEmpty!7249 m!208491))

(check-sat (not b_next!4461) (not b!180452) (not b!180449) (not start!18122) tp_is_empty!4233 b_and!10995 (not b!180448) (not mapNonEmpty!7249) (not b!180454))
(check-sat b_and!10995 (not b_next!4461))
(get-model)

(declare-fun d!54233 () Bool)

(declare-fun e!118901 () Bool)

(assert (=> d!54233 e!118901))

(declare-fun res!85489 () Bool)

(assert (=> d!54233 (=> res!85489 e!118901)))

(declare-fun lt!89190 () Bool)

(assert (=> d!54233 (= res!85489 (not lt!89190))))

(declare-fun lt!89189 () Bool)

(assert (=> d!54233 (= lt!89190 lt!89189)))

(declare-datatypes ((Unit!5492 0))(
  ( (Unit!5493) )
))
(declare-fun lt!89192 () Unit!5492)

(declare-fun e!118902 () Unit!5492)

(assert (=> d!54233 (= lt!89192 e!118902)))

(declare-fun c!32315 () Bool)

(assert (=> d!54233 (= c!32315 lt!89189)))

(declare-fun containsKey!210 (List!2296 (_ BitVec 64)) Bool)

(assert (=> d!54233 (= lt!89189 (containsKey!210 (toList!1159 (getCurrentListMap!807 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248))) key!828))))

(assert (=> d!54233 (= (contains!1235 (getCurrentListMap!807 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248)) key!828) lt!89190)))

(declare-fun b!180485 () Bool)

(declare-fun lt!89191 () Unit!5492)

(assert (=> b!180485 (= e!118902 lt!89191)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!158 (List!2296 (_ BitVec 64)) Unit!5492)

(assert (=> b!180485 (= lt!89191 (lemmaContainsKeyImpliesGetValueByKeyDefined!158 (toList!1159 (getCurrentListMap!807 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248))) key!828))))

(declare-datatypes ((Option!212 0))(
  ( (Some!211 (v!4056 V!5291)) (None!210) )
))
(declare-fun isDefined!159 (Option!212) Bool)

(declare-fun getValueByKey!206 (List!2296 (_ BitVec 64)) Option!212)

(assert (=> b!180485 (isDefined!159 (getValueByKey!206 (toList!1159 (getCurrentListMap!807 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248))) key!828))))

(declare-fun b!180486 () Bool)

(declare-fun Unit!5494 () Unit!5492)

(assert (=> b!180486 (= e!118902 Unit!5494)))

(declare-fun b!180487 () Bool)

(assert (=> b!180487 (= e!118901 (isDefined!159 (getValueByKey!206 (toList!1159 (getCurrentListMap!807 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248))) key!828)))))

(assert (= (and d!54233 c!32315) b!180485))

(assert (= (and d!54233 (not c!32315)) b!180486))

(assert (= (and d!54233 (not res!85489)) b!180487))

(declare-fun m!208509 () Bool)

(assert (=> d!54233 m!208509))

(declare-fun m!208511 () Bool)

(assert (=> b!180485 m!208511))

(declare-fun m!208513 () Bool)

(assert (=> b!180485 m!208513))

(assert (=> b!180485 m!208513))

(declare-fun m!208515 () Bool)

(assert (=> b!180485 m!208515))

(assert (=> b!180487 m!208513))

(assert (=> b!180487 m!208513))

(assert (=> b!180487 m!208515))

(assert (=> b!180452 d!54233))

(declare-fun b!180530 () Bool)

(declare-fun e!118937 () Bool)

(declare-fun e!118933 () Bool)

(assert (=> b!180530 (= e!118937 e!118933)))

(declare-fun c!32333 () Bool)

(assert (=> b!180530 (= c!32333 (not (= (bvand (extraKeys!3440 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!180531 () Bool)

(declare-fun e!118934 () Bool)

(declare-fun e!118935 () Bool)

(assert (=> b!180531 (= e!118934 e!118935)))

(declare-fun res!85512 () Bool)

(assert (=> b!180531 (=> (not res!85512) (not e!118935))))

(declare-fun lt!89248 () ListLongMap!2287)

(assert (=> b!180531 (= res!85512 (contains!1235 lt!89248 (select (arr!3617 (_keys!5596 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!180531 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3925 (_keys!5596 thiss!1248))))))

(declare-fun b!180532 () Bool)

(declare-fun e!118932 () ListLongMap!2287)

(declare-fun call!18250 () ListLongMap!2287)

(assert (=> b!180532 (= e!118932 call!18250)))

(declare-fun b!180533 () Bool)

(declare-fun call!18256 () Bool)

(assert (=> b!180533 (= e!118933 (not call!18256))))

(declare-fun b!180534 () Bool)

(declare-fun e!118936 () ListLongMap!2287)

(assert (=> b!180534 (= e!118936 call!18250)))

(declare-fun b!180535 () Bool)

(declare-fun e!118940 () ListLongMap!2287)

(assert (=> b!180535 (= e!118940 e!118932)))

(declare-fun c!32329 () Bool)

(assert (=> b!180535 (= c!32329 (and (not (= (bvand (extraKeys!3440 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3440 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!180536 () Bool)

(declare-fun call!18253 () ListLongMap!2287)

(assert (=> b!180536 (= e!118936 call!18253)))

(declare-fun bm!18247 () Bool)

(declare-fun call!18254 () Bool)

(assert (=> bm!18247 (= call!18254 (contains!1235 lt!89248 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180538 () Bool)

(declare-fun res!85508 () Bool)

(assert (=> b!180538 (=> (not res!85508) (not e!118937))))

(assert (=> b!180538 (= res!85508 e!118934)))

(declare-fun res!85511 () Bool)

(assert (=> b!180538 (=> res!85511 e!118934)))

(declare-fun e!118939 () Bool)

(assert (=> b!180538 (= res!85511 (not e!118939))))

(declare-fun res!85510 () Bool)

(assert (=> b!180538 (=> (not res!85510) (not e!118939))))

(assert (=> b!180538 (= res!85510 (bvslt #b00000000000000000000000000000000 (size!3925 (_keys!5596 thiss!1248))))))

(declare-fun b!180539 () Bool)

(declare-fun e!118931 () Bool)

(declare-fun apply!149 (ListLongMap!2287 (_ BitVec 64)) V!5291)

(assert (=> b!180539 (= e!118931 (= (apply!149 lt!89248 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3544 thiss!1248)))))

(declare-fun c!32328 () Bool)

(declare-fun call!18251 () ListLongMap!2287)

(declare-fun call!18252 () ListLongMap!2287)

(declare-fun bm!18248 () Bool)

(declare-fun call!18255 () ListLongMap!2287)

(declare-fun +!269 (ListLongMap!2287 tuple2!3370) ListLongMap!2287)

(assert (=> bm!18248 (= call!18255 (+!269 (ite c!32328 call!18252 (ite c!32329 call!18251 call!18253)) (ite (or c!32328 c!32329) (tuple2!3371 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3544 thiss!1248)) (tuple2!3371 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3544 thiss!1248)))))))

(declare-fun b!180540 () Bool)

(declare-fun e!118941 () Bool)

(declare-fun e!118929 () Bool)

(assert (=> b!180540 (= e!118941 e!118929)))

(declare-fun res!85513 () Bool)

(assert (=> b!180540 (= res!85513 call!18254)))

(assert (=> b!180540 (=> (not res!85513) (not e!118929))))

(declare-fun bm!18249 () Bool)

(assert (=> bm!18249 (= call!18253 call!18251)))

(declare-fun b!180541 () Bool)

(declare-fun e!118938 () Unit!5492)

(declare-fun Unit!5495 () Unit!5492)

(assert (=> b!180541 (= e!118938 Unit!5495)))

(declare-fun b!180542 () Bool)

(declare-fun e!118930 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!180542 (= e!118930 (validKeyInArray!0 (select (arr!3617 (_keys!5596 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180543 () Bool)

(assert (=> b!180543 (= e!118933 e!118931)))

(declare-fun res!85516 () Bool)

(assert (=> b!180543 (= res!85516 call!18256)))

(assert (=> b!180543 (=> (not res!85516) (not e!118931))))

(declare-fun b!180544 () Bool)

(declare-fun c!32331 () Bool)

(assert (=> b!180544 (= c!32331 (and (not (= (bvand (extraKeys!3440 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3440 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!180544 (= e!118932 e!118936)))

(declare-fun b!180545 () Bool)

(declare-fun get!2064 (ValueCell!1773 V!5291) V!5291)

(declare-fun dynLambda!492 (Int (_ BitVec 64)) V!5291)

(assert (=> b!180545 (= e!118935 (= (apply!149 lt!89248 (select (arr!3617 (_keys!5596 thiss!1248)) #b00000000000000000000000000000000)) (get!2064 (select (arr!3618 (_values!3686 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!492 (defaultEntry!3703 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!180545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3926 (_values!3686 thiss!1248))))))

(assert (=> b!180545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3925 (_keys!5596 thiss!1248))))))

(declare-fun bm!18250 () Bool)

(assert (=> bm!18250 (= call!18250 call!18255)))

(declare-fun bm!18251 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!182 (array!7639 array!7641 (_ BitVec 32) (_ BitVec 32) V!5291 V!5291 (_ BitVec 32) Int) ListLongMap!2287)

(assert (=> bm!18251 (= call!18252 (getCurrentListMapNoExtraKeys!182 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248)))))

(declare-fun bm!18252 () Bool)

(assert (=> bm!18252 (= call!18256 (contains!1235 lt!89248 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180546 () Bool)

(assert (=> b!180546 (= e!118940 (+!269 call!18255 (tuple2!3371 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3544 thiss!1248))))))

(declare-fun b!180537 () Bool)

(declare-fun lt!89245 () Unit!5492)

(assert (=> b!180537 (= e!118938 lt!89245)))

(declare-fun lt!89244 () ListLongMap!2287)

(assert (=> b!180537 (= lt!89244 (getCurrentListMapNoExtraKeys!182 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248)))))

(declare-fun lt!89246 () (_ BitVec 64))

(assert (=> b!180537 (= lt!89246 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89237 () (_ BitVec 64))

(assert (=> b!180537 (= lt!89237 (select (arr!3617 (_keys!5596 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89258 () Unit!5492)

(declare-fun addStillContains!125 (ListLongMap!2287 (_ BitVec 64) V!5291 (_ BitVec 64)) Unit!5492)

(assert (=> b!180537 (= lt!89258 (addStillContains!125 lt!89244 lt!89246 (zeroValue!3544 thiss!1248) lt!89237))))

(assert (=> b!180537 (contains!1235 (+!269 lt!89244 (tuple2!3371 lt!89246 (zeroValue!3544 thiss!1248))) lt!89237)))

(declare-fun lt!89238 () Unit!5492)

(assert (=> b!180537 (= lt!89238 lt!89258)))

(declare-fun lt!89255 () ListLongMap!2287)

(assert (=> b!180537 (= lt!89255 (getCurrentListMapNoExtraKeys!182 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248)))))

(declare-fun lt!89250 () (_ BitVec 64))

(assert (=> b!180537 (= lt!89250 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89241 () (_ BitVec 64))

(assert (=> b!180537 (= lt!89241 (select (arr!3617 (_keys!5596 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89251 () Unit!5492)

(declare-fun addApplyDifferent!125 (ListLongMap!2287 (_ BitVec 64) V!5291 (_ BitVec 64)) Unit!5492)

(assert (=> b!180537 (= lt!89251 (addApplyDifferent!125 lt!89255 lt!89250 (minValue!3544 thiss!1248) lt!89241))))

(assert (=> b!180537 (= (apply!149 (+!269 lt!89255 (tuple2!3371 lt!89250 (minValue!3544 thiss!1248))) lt!89241) (apply!149 lt!89255 lt!89241))))

(declare-fun lt!89252 () Unit!5492)

(assert (=> b!180537 (= lt!89252 lt!89251)))

(declare-fun lt!89253 () ListLongMap!2287)

(assert (=> b!180537 (= lt!89253 (getCurrentListMapNoExtraKeys!182 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248)))))

(declare-fun lt!89240 () (_ BitVec 64))

(assert (=> b!180537 (= lt!89240 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89254 () (_ BitVec 64))

(assert (=> b!180537 (= lt!89254 (select (arr!3617 (_keys!5596 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89243 () Unit!5492)

(assert (=> b!180537 (= lt!89243 (addApplyDifferent!125 lt!89253 lt!89240 (zeroValue!3544 thiss!1248) lt!89254))))

(assert (=> b!180537 (= (apply!149 (+!269 lt!89253 (tuple2!3371 lt!89240 (zeroValue!3544 thiss!1248))) lt!89254) (apply!149 lt!89253 lt!89254))))

(declare-fun lt!89257 () Unit!5492)

(assert (=> b!180537 (= lt!89257 lt!89243)))

(declare-fun lt!89249 () ListLongMap!2287)

(assert (=> b!180537 (= lt!89249 (getCurrentListMapNoExtraKeys!182 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248)))))

(declare-fun lt!89256 () (_ BitVec 64))

(assert (=> b!180537 (= lt!89256 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89242 () (_ BitVec 64))

(assert (=> b!180537 (= lt!89242 (select (arr!3617 (_keys!5596 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180537 (= lt!89245 (addApplyDifferent!125 lt!89249 lt!89256 (minValue!3544 thiss!1248) lt!89242))))

(assert (=> b!180537 (= (apply!149 (+!269 lt!89249 (tuple2!3371 lt!89256 (minValue!3544 thiss!1248))) lt!89242) (apply!149 lt!89249 lt!89242))))

(declare-fun d!54235 () Bool)

(assert (=> d!54235 e!118937))

(declare-fun res!85509 () Bool)

(assert (=> d!54235 (=> (not res!85509) (not e!118937))))

(assert (=> d!54235 (= res!85509 (or (bvsge #b00000000000000000000000000000000 (size!3925 (_keys!5596 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3925 (_keys!5596 thiss!1248))))))))

(declare-fun lt!89239 () ListLongMap!2287)

(assert (=> d!54235 (= lt!89248 lt!89239)))

(declare-fun lt!89247 () Unit!5492)

(assert (=> d!54235 (= lt!89247 e!118938)))

(declare-fun c!32330 () Bool)

(assert (=> d!54235 (= c!32330 e!118930)))

(declare-fun res!85514 () Bool)

(assert (=> d!54235 (=> (not res!85514) (not e!118930))))

(assert (=> d!54235 (= res!85514 (bvslt #b00000000000000000000000000000000 (size!3925 (_keys!5596 thiss!1248))))))

(assert (=> d!54235 (= lt!89239 e!118940)))

(assert (=> d!54235 (= c!32328 (and (not (= (bvand (extraKeys!3440 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3440 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54235 (validMask!0 (mask!8704 thiss!1248))))

(assert (=> d!54235 (= (getCurrentListMap!807 (_keys!5596 thiss!1248) (_values!3686 thiss!1248) (mask!8704 thiss!1248) (extraKeys!3440 thiss!1248) (zeroValue!3544 thiss!1248) (minValue!3544 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3703 thiss!1248)) lt!89248)))

(declare-fun b!180547 () Bool)

(assert (=> b!180547 (= e!118939 (validKeyInArray!0 (select (arr!3617 (_keys!5596 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!180548 () Bool)

(assert (=> b!180548 (= e!118941 (not call!18254))))

(declare-fun b!180549 () Bool)

(declare-fun res!85515 () Bool)

(assert (=> b!180549 (=> (not res!85515) (not e!118937))))

(assert (=> b!180549 (= res!85515 e!118941)))

(declare-fun c!32332 () Bool)

(assert (=> b!180549 (= c!32332 (not (= (bvand (extraKeys!3440 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!180550 () Bool)

(assert (=> b!180550 (= e!118929 (= (apply!149 lt!89248 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3544 thiss!1248)))))

(declare-fun bm!18253 () Bool)

(assert (=> bm!18253 (= call!18251 call!18252)))

(assert (= (and d!54235 c!32328) b!180546))

(assert (= (and d!54235 (not c!32328)) b!180535))

(assert (= (and b!180535 c!32329) b!180532))

(assert (= (and b!180535 (not c!32329)) b!180544))

(assert (= (and b!180544 c!32331) b!180534))

(assert (= (and b!180544 (not c!32331)) b!180536))

(assert (= (or b!180534 b!180536) bm!18249))

(assert (= (or b!180532 bm!18249) bm!18253))

(assert (= (or b!180532 b!180534) bm!18250))

(assert (= (or b!180546 bm!18253) bm!18251))

(assert (= (or b!180546 bm!18250) bm!18248))

(assert (= (and d!54235 res!85514) b!180542))

(assert (= (and d!54235 c!32330) b!180537))

(assert (= (and d!54235 (not c!32330)) b!180541))

(assert (= (and d!54235 res!85509) b!180538))

(assert (= (and b!180538 res!85510) b!180547))

(assert (= (and b!180538 (not res!85511)) b!180531))

(assert (= (and b!180531 res!85512) b!180545))

(assert (= (and b!180538 res!85508) b!180549))

(assert (= (and b!180549 c!32332) b!180540))

(assert (= (and b!180549 (not c!32332)) b!180548))

(assert (= (and b!180540 res!85513) b!180550))

(assert (= (or b!180540 b!180548) bm!18247))

(assert (= (and b!180549 res!85515) b!180530))

(assert (= (and b!180530 c!32333) b!180543))

(assert (= (and b!180530 (not c!32333)) b!180533))

(assert (= (and b!180543 res!85516) b!180539))

(assert (= (or b!180543 b!180533) bm!18252))

(declare-fun b_lambda!7119 () Bool)

(assert (=> (not b_lambda!7119) (not b!180545)))

(declare-fun t!7146 () Bool)

(declare-fun tb!2809 () Bool)

(assert (=> (and b!180448 (= (defaultEntry!3703 thiss!1248) (defaultEntry!3703 thiss!1248)) t!7146) tb!2809))

(declare-fun result!4705 () Bool)

(assert (=> tb!2809 (= result!4705 tp_is_empty!4233)))

(assert (=> b!180545 t!7146))

(declare-fun b_and!10999 () Bool)

(assert (= b_and!10995 (and (=> t!7146 result!4705) b_and!10999)))

(declare-fun m!208517 () Bool)

(assert (=> bm!18247 m!208517))

(declare-fun m!208519 () Bool)

(assert (=> b!180539 m!208519))

(declare-fun m!208521 () Bool)

(assert (=> bm!18251 m!208521))

(declare-fun m!208523 () Bool)

(assert (=> bm!18252 m!208523))

(declare-fun m!208525 () Bool)

(assert (=> bm!18248 m!208525))

(declare-fun m!208527 () Bool)

(assert (=> b!180537 m!208527))

(declare-fun m!208529 () Bool)

(assert (=> b!180537 m!208529))

(declare-fun m!208531 () Bool)

(assert (=> b!180537 m!208531))

(declare-fun m!208533 () Bool)

(assert (=> b!180537 m!208533))

(declare-fun m!208535 () Bool)

(assert (=> b!180537 m!208535))

(assert (=> b!180537 m!208531))

(declare-fun m!208537 () Bool)

(assert (=> b!180537 m!208537))

(declare-fun m!208539 () Bool)

(assert (=> b!180537 m!208539))

(declare-fun m!208541 () Bool)

(assert (=> b!180537 m!208541))

(declare-fun m!208543 () Bool)

(assert (=> b!180537 m!208543))

(declare-fun m!208545 () Bool)

(assert (=> b!180537 m!208545))

(assert (=> b!180537 m!208527))

(declare-fun m!208547 () Bool)

(assert (=> b!180537 m!208547))

(assert (=> b!180537 m!208539))

(declare-fun m!208549 () Bool)

(assert (=> b!180537 m!208549))

(declare-fun m!208551 () Bool)

(assert (=> b!180537 m!208551))

(assert (=> b!180537 m!208521))

(assert (=> b!180537 m!208551))

(declare-fun m!208553 () Bool)

(assert (=> b!180537 m!208553))

(declare-fun m!208555 () Bool)

(assert (=> b!180537 m!208555))

(declare-fun m!208557 () Bool)

(assert (=> b!180537 m!208557))

(assert (=> d!54235 m!208489))

(assert (=> b!180531 m!208549))

(assert (=> b!180531 m!208549))

(declare-fun m!208559 () Bool)

(assert (=> b!180531 m!208559))

(declare-fun m!208561 () Bool)

(assert (=> b!180545 m!208561))

(declare-fun m!208563 () Bool)

(assert (=> b!180545 m!208563))

(declare-fun m!208565 () Bool)

(assert (=> b!180545 m!208565))

(assert (=> b!180545 m!208561))

(assert (=> b!180545 m!208549))

(assert (=> b!180545 m!208563))

(assert (=> b!180545 m!208549))

(declare-fun m!208567 () Bool)

(assert (=> b!180545 m!208567))

(declare-fun m!208569 () Bool)

(assert (=> b!180546 m!208569))

(assert (=> b!180547 m!208549))

(assert (=> b!180547 m!208549))

(declare-fun m!208571 () Bool)

(assert (=> b!180547 m!208571))

(declare-fun m!208573 () Bool)

(assert (=> b!180550 m!208573))

(assert (=> b!180542 m!208549))

(assert (=> b!180542 m!208549))

(assert (=> b!180542 m!208571))

(assert (=> b!180452 d!54235))

(declare-fun d!54237 () Bool)

(assert (=> d!54237 (= (array_inv!2329 (_keys!5596 thiss!1248)) (bvsge (size!3925 (_keys!5596 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180448 d!54237))

(declare-fun d!54239 () Bool)

(assert (=> d!54239 (= (array_inv!2330 (_values!3686 thiss!1248)) (bvsge (size!3926 (_values!3686 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!180448 d!54239))

(declare-fun d!54241 () Bool)

(assert (=> d!54241 (= (validMask!0 (mask!8704 thiss!1248)) (and (or (= (mask!8704 thiss!1248) #b00000000000000000000000000000111) (= (mask!8704 thiss!1248) #b00000000000000000000000000001111) (= (mask!8704 thiss!1248) #b00000000000000000000000000011111) (= (mask!8704 thiss!1248) #b00000000000000000000000000111111) (= (mask!8704 thiss!1248) #b00000000000000000000000001111111) (= (mask!8704 thiss!1248) #b00000000000000000000000011111111) (= (mask!8704 thiss!1248) #b00000000000000000000000111111111) (= (mask!8704 thiss!1248) #b00000000000000000000001111111111) (= (mask!8704 thiss!1248) #b00000000000000000000011111111111) (= (mask!8704 thiss!1248) #b00000000000000000000111111111111) (= (mask!8704 thiss!1248) #b00000000000000000001111111111111) (= (mask!8704 thiss!1248) #b00000000000000000011111111111111) (= (mask!8704 thiss!1248) #b00000000000000000111111111111111) (= (mask!8704 thiss!1248) #b00000000000000001111111111111111) (= (mask!8704 thiss!1248) #b00000000000000011111111111111111) (= (mask!8704 thiss!1248) #b00000000000000111111111111111111) (= (mask!8704 thiss!1248) #b00000000000001111111111111111111) (= (mask!8704 thiss!1248) #b00000000000011111111111111111111) (= (mask!8704 thiss!1248) #b00000000000111111111111111111111) (= (mask!8704 thiss!1248) #b00000000001111111111111111111111) (= (mask!8704 thiss!1248) #b00000000011111111111111111111111) (= (mask!8704 thiss!1248) #b00000000111111111111111111111111) (= (mask!8704 thiss!1248) #b00000001111111111111111111111111) (= (mask!8704 thiss!1248) #b00000011111111111111111111111111) (= (mask!8704 thiss!1248) #b00000111111111111111111111111111) (= (mask!8704 thiss!1248) #b00001111111111111111111111111111) (= (mask!8704 thiss!1248) #b00011111111111111111111111111111) (= (mask!8704 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8704 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!180449 d!54241))

(declare-fun d!54243 () Bool)

(declare-fun res!85523 () Bool)

(declare-fun e!118944 () Bool)

(assert (=> d!54243 (=> (not res!85523) (not e!118944))))

(declare-fun simpleValid!165 (LongMapFixedSize!2454) Bool)

(assert (=> d!54243 (= res!85523 (simpleValid!165 thiss!1248))))

(assert (=> d!54243 (= (valid!1019 thiss!1248) e!118944)))

(declare-fun b!180559 () Bool)

(declare-fun res!85524 () Bool)

(assert (=> b!180559 (=> (not res!85524) (not e!118944))))

(declare-fun arrayCountValidKeys!0 (array!7639 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!180559 (= res!85524 (= (arrayCountValidKeys!0 (_keys!5596 thiss!1248) #b00000000000000000000000000000000 (size!3925 (_keys!5596 thiss!1248))) (_size!1276 thiss!1248)))))

(declare-fun b!180560 () Bool)

(declare-fun res!85525 () Bool)

(assert (=> b!180560 (=> (not res!85525) (not e!118944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7639 (_ BitVec 32)) Bool)

(assert (=> b!180560 (= res!85525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5596 thiss!1248) (mask!8704 thiss!1248)))))

(declare-fun b!180561 () Bool)

(declare-datatypes ((List!2297 0))(
  ( (Nil!2294) (Cons!2293 (h!2918 (_ BitVec 64)) (t!7147 List!2297)) )
))
(declare-fun arrayNoDuplicates!0 (array!7639 (_ BitVec 32) List!2297) Bool)

(assert (=> b!180561 (= e!118944 (arrayNoDuplicates!0 (_keys!5596 thiss!1248) #b00000000000000000000000000000000 Nil!2294))))

(assert (= (and d!54243 res!85523) b!180559))

(assert (= (and b!180559 res!85524) b!180560))

(assert (= (and b!180560 res!85525) b!180561))

(declare-fun m!208575 () Bool)

(assert (=> d!54243 m!208575))

(declare-fun m!208577 () Bool)

(assert (=> b!180559 m!208577))

(declare-fun m!208579 () Bool)

(assert (=> b!180560 m!208579))

(declare-fun m!208581 () Bool)

(assert (=> b!180561 m!208581))

(assert (=> start!18122 d!54243))

(declare-fun b!180574 () Bool)

(declare-fun e!118953 () SeekEntryResult!593)

(declare-fun lt!89265 () SeekEntryResult!593)

(assert (=> b!180574 (= e!118953 (MissingZero!593 (index!4544 lt!89265)))))

(declare-fun b!180575 () Bool)

(declare-fun c!32340 () Bool)

(declare-fun lt!89266 () (_ BitVec 64))

(assert (=> b!180575 (= c!32340 (= lt!89266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!118952 () SeekEntryResult!593)

(assert (=> b!180575 (= e!118952 e!118953)))

(declare-fun d!54245 () Bool)

(declare-fun lt!89267 () SeekEntryResult!593)

(assert (=> d!54245 (and (or ((_ is Undefined!593) lt!89267) (not ((_ is Found!593) lt!89267)) (and (bvsge (index!4543 lt!89267) #b00000000000000000000000000000000) (bvslt (index!4543 lt!89267) (size!3925 (_keys!5596 thiss!1248))))) (or ((_ is Undefined!593) lt!89267) ((_ is Found!593) lt!89267) (not ((_ is MissingZero!593) lt!89267)) (and (bvsge (index!4542 lt!89267) #b00000000000000000000000000000000) (bvslt (index!4542 lt!89267) (size!3925 (_keys!5596 thiss!1248))))) (or ((_ is Undefined!593) lt!89267) ((_ is Found!593) lt!89267) ((_ is MissingZero!593) lt!89267) (not ((_ is MissingVacant!593) lt!89267)) (and (bvsge (index!4545 lt!89267) #b00000000000000000000000000000000) (bvslt (index!4545 lt!89267) (size!3925 (_keys!5596 thiss!1248))))) (or ((_ is Undefined!593) lt!89267) (ite ((_ is Found!593) lt!89267) (= (select (arr!3617 (_keys!5596 thiss!1248)) (index!4543 lt!89267)) key!828) (ite ((_ is MissingZero!593) lt!89267) (= (select (arr!3617 (_keys!5596 thiss!1248)) (index!4542 lt!89267)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!593) lt!89267) (= (select (arr!3617 (_keys!5596 thiss!1248)) (index!4545 lt!89267)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!118951 () SeekEntryResult!593)

(assert (=> d!54245 (= lt!89267 e!118951)))

(declare-fun c!32342 () Bool)

(assert (=> d!54245 (= c!32342 (and ((_ is Intermediate!593) lt!89265) (undefined!1405 lt!89265)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7639 (_ BitVec 32)) SeekEntryResult!593)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54245 (= lt!89265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8704 thiss!1248)) key!828 (_keys!5596 thiss!1248) (mask!8704 thiss!1248)))))

(assert (=> d!54245 (validMask!0 (mask!8704 thiss!1248))))

(assert (=> d!54245 (= (seekEntryOrOpen!0 key!828 (_keys!5596 thiss!1248) (mask!8704 thiss!1248)) lt!89267)))

(declare-fun b!180576 () Bool)

(assert (=> b!180576 (= e!118951 e!118952)))

(assert (=> b!180576 (= lt!89266 (select (arr!3617 (_keys!5596 thiss!1248)) (index!4544 lt!89265)))))

(declare-fun c!32341 () Bool)

(assert (=> b!180576 (= c!32341 (= lt!89266 key!828))))

(declare-fun b!180577 () Bool)

(assert (=> b!180577 (= e!118952 (Found!593 (index!4544 lt!89265)))))

(declare-fun b!180578 () Bool)

(assert (=> b!180578 (= e!118951 Undefined!593)))

(declare-fun b!180579 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7639 (_ BitVec 32)) SeekEntryResult!593)

(assert (=> b!180579 (= e!118953 (seekKeyOrZeroReturnVacant!0 (x!19727 lt!89265) (index!4544 lt!89265) (index!4544 lt!89265) key!828 (_keys!5596 thiss!1248) (mask!8704 thiss!1248)))))

(assert (= (and d!54245 c!32342) b!180578))

(assert (= (and d!54245 (not c!32342)) b!180576))

(assert (= (and b!180576 c!32341) b!180577))

(assert (= (and b!180576 (not c!32341)) b!180575))

(assert (= (and b!180575 c!32340) b!180574))

(assert (= (and b!180575 (not c!32340)) b!180579))

(declare-fun m!208583 () Bool)

(assert (=> d!54245 m!208583))

(assert (=> d!54245 m!208489))

(declare-fun m!208585 () Bool)

(assert (=> d!54245 m!208585))

(declare-fun m!208587 () Bool)

(assert (=> d!54245 m!208587))

(declare-fun m!208589 () Bool)

(assert (=> d!54245 m!208589))

(declare-fun m!208591 () Bool)

(assert (=> d!54245 m!208591))

(assert (=> d!54245 m!208589))

(declare-fun m!208593 () Bool)

(assert (=> b!180576 m!208593))

(declare-fun m!208595 () Bool)

(assert (=> b!180579 m!208595))

(assert (=> b!180454 d!54245))

(declare-fun mapNonEmpty!7255 () Bool)

(declare-fun mapRes!7255 () Bool)

(declare-fun tp!16129 () Bool)

(declare-fun e!118959 () Bool)

(assert (=> mapNonEmpty!7255 (= mapRes!7255 (and tp!16129 e!118959))))

(declare-fun mapKey!7255 () (_ BitVec 32))

(declare-fun mapValue!7255 () ValueCell!1773)

(declare-fun mapRest!7255 () (Array (_ BitVec 32) ValueCell!1773))

(assert (=> mapNonEmpty!7255 (= mapRest!7249 (store mapRest!7255 mapKey!7255 mapValue!7255))))

(declare-fun b!180586 () Bool)

(assert (=> b!180586 (= e!118959 tp_is_empty!4233)))

(declare-fun b!180587 () Bool)

(declare-fun e!118958 () Bool)

(assert (=> b!180587 (= e!118958 tp_is_empty!4233)))

(declare-fun mapIsEmpty!7255 () Bool)

(assert (=> mapIsEmpty!7255 mapRes!7255))

(declare-fun condMapEmpty!7255 () Bool)

(declare-fun mapDefault!7255 () ValueCell!1773)

(assert (=> mapNonEmpty!7249 (= condMapEmpty!7255 (= mapRest!7249 ((as const (Array (_ BitVec 32) ValueCell!1773)) mapDefault!7255)))))

(assert (=> mapNonEmpty!7249 (= tp!16119 (and e!118958 mapRes!7255))))

(assert (= (and mapNonEmpty!7249 condMapEmpty!7255) mapIsEmpty!7255))

(assert (= (and mapNonEmpty!7249 (not condMapEmpty!7255)) mapNonEmpty!7255))

(assert (= (and mapNonEmpty!7255 ((_ is ValueCellFull!1773) mapValue!7255)) b!180586))

(assert (= (and mapNonEmpty!7249 ((_ is ValueCellFull!1773) mapDefault!7255)) b!180587))

(declare-fun m!208597 () Bool)

(assert (=> mapNonEmpty!7255 m!208597))

(declare-fun b_lambda!7121 () Bool)

(assert (= b_lambda!7119 (or (and b!180448 b_free!4461) b_lambda!7121)))

(check-sat (not bm!18247) (not b_next!4461) (not bm!18252) b_and!10999 (not b!180537) (not d!54245) (not b!180547) (not b!180487) (not b!180485) tp_is_empty!4233 (not d!54233) (not b!180545) (not b!180546) (not b!180539) (not d!54235) (not b_lambda!7121) (not mapNonEmpty!7255) (not d!54243) (not b!180542) (not b!180559) (not b!180560) (not b!180579) (not bm!18248) (not bm!18251) (not b!180550) (not b!180531) (not b!180561))
(check-sat b_and!10999 (not b_next!4461))
