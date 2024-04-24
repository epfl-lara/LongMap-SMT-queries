; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80644 () Bool)

(assert start!80644)

(declare-fun b!946153 () Bool)

(declare-fun b_free!18091 () Bool)

(declare-fun b_next!18091 () Bool)

(assert (=> b!946153 (= b_free!18091 (not b_next!18091))))

(declare-fun tp!62787 () Bool)

(declare-fun b_and!29521 () Bool)

(assert (=> b!946153 (= tp!62787 b_and!29521)))

(declare-fun b!946150 () Bool)

(declare-fun e!532204 () Bool)

(declare-fun tp_is_empty!20599 () Bool)

(assert (=> b!946150 (= e!532204 tp_is_empty!20599)))

(declare-fun b!946151 () Bool)

(declare-fun res!635248 () Bool)

(declare-fun e!532206 () Bool)

(assert (=> b!946151 (=> (not res!635248) (not e!532206))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946151 (= res!635248 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!946152 () Bool)

(declare-fun e!532205 () Bool)

(assert (=> b!946152 (= e!532205 tp_is_empty!20599)))

(declare-fun e!532207 () Bool)

(declare-fun e!532209 () Bool)

(declare-datatypes ((V!32431 0))(
  ( (V!32432 (val!10350 Int)) )
))
(declare-datatypes ((ValueCell!9818 0))(
  ( (ValueCellFull!9818 (v!12880 V!32431)) (EmptyCell!9818) )
))
(declare-datatypes ((array!57219 0))(
  ( (array!57220 (arr!27529 (Array (_ BitVec 32) ValueCell!9818)) (size!27997 (_ BitVec 32))) )
))
(declare-datatypes ((array!57221 0))(
  ( (array!57222 (arr!27530 (Array (_ BitVec 32) (_ BitVec 64))) (size!27998 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4786 0))(
  ( (LongMapFixedSize!4787 (defaultEntry!5689 Int) (mask!27397 (_ BitVec 32)) (extraKeys!5421 (_ BitVec 32)) (zeroValue!5525 V!32431) (minValue!5525 V!32431) (_size!2448 (_ BitVec 32)) (_keys!10596 array!57221) (_values!5712 array!57219) (_vacant!2448 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4786)

(declare-fun array_inv!21464 (array!57221) Bool)

(declare-fun array_inv!21465 (array!57219) Bool)

(assert (=> b!946153 (= e!532209 (and tp!62787 tp_is_empty!20599 (array_inv!21464 (_keys!10596 thiss!1141)) (array_inv!21465 (_values!5712 thiss!1141)) e!532207))))

(declare-fun b!946154 () Bool)

(declare-fun mapRes!32728 () Bool)

(assert (=> b!946154 (= e!532207 (and e!532205 mapRes!32728))))

(declare-fun condMapEmpty!32728 () Bool)

(declare-fun mapDefault!32728 () ValueCell!9818)

(assert (=> b!946154 (= condMapEmpty!32728 (= (arr!27529 (_values!5712 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9818)) mapDefault!32728)))))

(declare-fun mapNonEmpty!32728 () Bool)

(declare-fun tp!62788 () Bool)

(assert (=> mapNonEmpty!32728 (= mapRes!32728 (and tp!62788 e!532204))))

(declare-fun mapRest!32728 () (Array (_ BitVec 32) ValueCell!9818))

(declare-fun mapValue!32728 () ValueCell!9818)

(declare-fun mapKey!32728 () (_ BitVec 32))

(assert (=> mapNonEmpty!32728 (= (arr!27529 (_values!5712 thiss!1141)) (store mapRest!32728 mapKey!32728 mapValue!32728))))

(declare-fun b!946155 () Bool)

(declare-datatypes ((tuple2!13486 0))(
  ( (tuple2!13487 (_1!6754 (_ BitVec 64)) (_2!6754 V!32431)) )
))
(declare-datatypes ((List!19273 0))(
  ( (Nil!19270) (Cons!19269 (h!20426 tuple2!13486) (t!27584 List!19273)) )
))
(declare-datatypes ((ListLongMap!12185 0))(
  ( (ListLongMap!12186 (toList!6108 List!19273)) )
))
(declare-fun contains!5192 (ListLongMap!12185 (_ BitVec 64)) Bool)

(declare-fun map!13018 (LongMapFixedSize!4786) ListLongMap!12185)

(assert (=> b!946155 (= e!532206 (not (= (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (contains!5192 (map!13018 thiss!1141) key!756))))))

(declare-fun mapIsEmpty!32728 () Bool)

(assert (=> mapIsEmpty!32728 mapRes!32728))

(declare-fun res!635249 () Bool)

(assert (=> start!80644 (=> (not res!635249) (not e!532206))))

(declare-fun valid!1836 (LongMapFixedSize!4786) Bool)

(assert (=> start!80644 (= res!635249 (valid!1836 thiss!1141))))

(assert (=> start!80644 e!532206))

(assert (=> start!80644 e!532209))

(assert (=> start!80644 true))

(assert (= (and start!80644 res!635249) b!946151))

(assert (= (and b!946151 res!635248) b!946155))

(assert (= (and b!946154 condMapEmpty!32728) mapIsEmpty!32728))

(assert (= (and b!946154 (not condMapEmpty!32728)) mapNonEmpty!32728))

(get-info :version)

(assert (= (and mapNonEmpty!32728 ((_ is ValueCellFull!9818) mapValue!32728)) b!946150))

(assert (= (and b!946154 ((_ is ValueCellFull!9818) mapDefault!32728)) b!946152))

(assert (= b!946153 b!946154))

(assert (= start!80644 b!946153))

(declare-fun m!880417 () Bool)

(assert (=> b!946153 m!880417))

(declare-fun m!880419 () Bool)

(assert (=> b!946153 m!880419))

(declare-fun m!880421 () Bool)

(assert (=> mapNonEmpty!32728 m!880421))

(declare-fun m!880423 () Bool)

(assert (=> b!946155 m!880423))

(assert (=> b!946155 m!880423))

(declare-fun m!880425 () Bool)

(assert (=> b!946155 m!880425))

(declare-fun m!880427 () Bool)

(assert (=> start!80644 m!880427))

(check-sat tp_is_empty!20599 (not b!946155) (not start!80644) (not mapNonEmpty!32728) b_and!29521 (not b!946153) (not b_next!18091))
(check-sat b_and!29521 (not b_next!18091))
(get-model)

(declare-fun d!114697 () Bool)

(declare-fun res!635268 () Bool)

(declare-fun e!532248 () Bool)

(assert (=> d!114697 (=> (not res!635268) (not e!532248))))

(declare-fun simpleValid!350 (LongMapFixedSize!4786) Bool)

(assert (=> d!114697 (= res!635268 (simpleValid!350 thiss!1141))))

(assert (=> d!114697 (= (valid!1836 thiss!1141) e!532248)))

(declare-fun b!946198 () Bool)

(declare-fun res!635269 () Bool)

(assert (=> b!946198 (=> (not res!635269) (not e!532248))))

(declare-fun arrayCountValidKeys!0 (array!57221 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946198 (= res!635269 (= (arrayCountValidKeys!0 (_keys!10596 thiss!1141) #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))) (_size!2448 thiss!1141)))))

(declare-fun b!946199 () Bool)

(declare-fun res!635270 () Bool)

(assert (=> b!946199 (=> (not res!635270) (not e!532248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57221 (_ BitVec 32)) Bool)

(assert (=> b!946199 (= res!635270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10596 thiss!1141) (mask!27397 thiss!1141)))))

(declare-fun b!946200 () Bool)

(declare-datatypes ((List!19275 0))(
  ( (Nil!19272) (Cons!19271 (h!20428 (_ BitVec 64)) (t!27586 List!19275)) )
))
(declare-fun arrayNoDuplicates!0 (array!57221 (_ BitVec 32) List!19275) Bool)

(assert (=> b!946200 (= e!532248 (arrayNoDuplicates!0 (_keys!10596 thiss!1141) #b00000000000000000000000000000000 Nil!19272))))

(assert (= (and d!114697 res!635268) b!946198))

(assert (= (and b!946198 res!635269) b!946199))

(assert (= (and b!946199 res!635270) b!946200))

(declare-fun m!880453 () Bool)

(assert (=> d!114697 m!880453))

(declare-fun m!880455 () Bool)

(assert (=> b!946198 m!880455))

(declare-fun m!880457 () Bool)

(assert (=> b!946199 m!880457))

(declare-fun m!880459 () Bool)

(assert (=> b!946200 m!880459))

(assert (=> start!80644 d!114697))

(declare-fun d!114699 () Bool)

(assert (=> d!114699 (= (array_inv!21464 (_keys!10596 thiss!1141)) (bvsge (size!27998 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946153 d!114699))

(declare-fun d!114701 () Bool)

(assert (=> d!114701 (= (array_inv!21465 (_values!5712 thiss!1141)) (bvsge (size!27997 (_values!5712 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946153 d!114701))

(declare-fun d!114703 () Bool)

(declare-fun e!532253 () Bool)

(assert (=> d!114703 e!532253))

(declare-fun res!635273 () Bool)

(assert (=> d!114703 (=> res!635273 e!532253)))

(declare-fun lt!426304 () Bool)

(assert (=> d!114703 (= res!635273 (not lt!426304))))

(declare-fun lt!426302 () Bool)

(assert (=> d!114703 (= lt!426304 lt!426302)))

(declare-datatypes ((Unit!31861 0))(
  ( (Unit!31862) )
))
(declare-fun lt!426303 () Unit!31861)

(declare-fun e!532254 () Unit!31861)

(assert (=> d!114703 (= lt!426303 e!532254)))

(declare-fun c!98666 () Bool)

(assert (=> d!114703 (= c!98666 lt!426302)))

(declare-fun containsKey!456 (List!19273 (_ BitVec 64)) Bool)

(assert (=> d!114703 (= lt!426302 (containsKey!456 (toList!6108 (map!13018 thiss!1141)) key!756))))

(assert (=> d!114703 (= (contains!5192 (map!13018 thiss!1141) key!756) lt!426304)))

(declare-fun b!946207 () Bool)

(declare-fun lt!426301 () Unit!31861)

(assert (=> b!946207 (= e!532254 lt!426301)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!350 (List!19273 (_ BitVec 64)) Unit!31861)

(assert (=> b!946207 (= lt!426301 (lemmaContainsKeyImpliesGetValueByKeyDefined!350 (toList!6108 (map!13018 thiss!1141)) key!756))))

(declare-datatypes ((Option!491 0))(
  ( (Some!490 (v!12883 V!32431)) (None!489) )
))
(declare-fun isDefined!358 (Option!491) Bool)

(declare-fun getValueByKey!485 (List!19273 (_ BitVec 64)) Option!491)

(assert (=> b!946207 (isDefined!358 (getValueByKey!485 (toList!6108 (map!13018 thiss!1141)) key!756))))

(declare-fun b!946208 () Bool)

(declare-fun Unit!31863 () Unit!31861)

(assert (=> b!946208 (= e!532254 Unit!31863)))

(declare-fun b!946209 () Bool)

(assert (=> b!946209 (= e!532253 (isDefined!358 (getValueByKey!485 (toList!6108 (map!13018 thiss!1141)) key!756)))))

(assert (= (and d!114703 c!98666) b!946207))

(assert (= (and d!114703 (not c!98666)) b!946208))

(assert (= (and d!114703 (not res!635273)) b!946209))

(declare-fun m!880461 () Bool)

(assert (=> d!114703 m!880461))

(declare-fun m!880463 () Bool)

(assert (=> b!946207 m!880463))

(declare-fun m!880465 () Bool)

(assert (=> b!946207 m!880465))

(assert (=> b!946207 m!880465))

(declare-fun m!880467 () Bool)

(assert (=> b!946207 m!880467))

(assert (=> b!946209 m!880465))

(assert (=> b!946209 m!880465))

(assert (=> b!946209 m!880467))

(assert (=> b!946155 d!114703))

(declare-fun d!114705 () Bool)

(declare-fun getCurrentListMap!3342 (array!57221 array!57219 (_ BitVec 32) (_ BitVec 32) V!32431 V!32431 (_ BitVec 32) Int) ListLongMap!12185)

(assert (=> d!114705 (= (map!13018 thiss!1141) (getCurrentListMap!3342 (_keys!10596 thiss!1141) (_values!5712 thiss!1141) (mask!27397 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun bs!26588 () Bool)

(assert (= bs!26588 d!114705))

(declare-fun m!880469 () Bool)

(assert (=> bs!26588 m!880469))

(assert (=> b!946155 d!114705))

(declare-fun condMapEmpty!32737 () Bool)

(declare-fun mapDefault!32737 () ValueCell!9818)

(assert (=> mapNonEmpty!32728 (= condMapEmpty!32737 (= mapRest!32728 ((as const (Array (_ BitVec 32) ValueCell!9818)) mapDefault!32737)))))

(declare-fun e!532260 () Bool)

(declare-fun mapRes!32737 () Bool)

(assert (=> mapNonEmpty!32728 (= tp!62788 (and e!532260 mapRes!32737))))

(declare-fun b!946217 () Bool)

(assert (=> b!946217 (= e!532260 tp_is_empty!20599)))

(declare-fun mapNonEmpty!32737 () Bool)

(declare-fun tp!62803 () Bool)

(declare-fun e!532259 () Bool)

(assert (=> mapNonEmpty!32737 (= mapRes!32737 (and tp!62803 e!532259))))

(declare-fun mapRest!32737 () (Array (_ BitVec 32) ValueCell!9818))

(declare-fun mapKey!32737 () (_ BitVec 32))

(declare-fun mapValue!32737 () ValueCell!9818)

(assert (=> mapNonEmpty!32737 (= mapRest!32728 (store mapRest!32737 mapKey!32737 mapValue!32737))))

(declare-fun b!946216 () Bool)

(assert (=> b!946216 (= e!532259 tp_is_empty!20599)))

(declare-fun mapIsEmpty!32737 () Bool)

(assert (=> mapIsEmpty!32737 mapRes!32737))

(assert (= (and mapNonEmpty!32728 condMapEmpty!32737) mapIsEmpty!32737))

(assert (= (and mapNonEmpty!32728 (not condMapEmpty!32737)) mapNonEmpty!32737))

(assert (= (and mapNonEmpty!32737 ((_ is ValueCellFull!9818) mapValue!32737)) b!946216))

(assert (= (and mapNonEmpty!32728 ((_ is ValueCellFull!9818) mapDefault!32737)) b!946217))

(declare-fun m!880471 () Bool)

(assert (=> mapNonEmpty!32737 m!880471))

(check-sat tp_is_empty!20599 (not b!946207) (not d!114703) (not d!114697) (not b!946209) (not b!946200) (not b!946199) (not b!946198) (not b_next!18091) (not mapNonEmpty!32737) (not d!114705) b_and!29521)
(check-sat b_and!29521 (not b_next!18091))
(get-model)

(declare-fun d!114707 () Bool)

(declare-fun res!635278 () Bool)

(declare-fun e!532265 () Bool)

(assert (=> d!114707 (=> res!635278 e!532265)))

(assert (=> d!114707 (= res!635278 (and ((_ is Cons!19269) (toList!6108 (map!13018 thiss!1141))) (= (_1!6754 (h!20426 (toList!6108 (map!13018 thiss!1141)))) key!756)))))

(assert (=> d!114707 (= (containsKey!456 (toList!6108 (map!13018 thiss!1141)) key!756) e!532265)))

(declare-fun b!946222 () Bool)

(declare-fun e!532266 () Bool)

(assert (=> b!946222 (= e!532265 e!532266)))

(declare-fun res!635279 () Bool)

(assert (=> b!946222 (=> (not res!635279) (not e!532266))))

(assert (=> b!946222 (= res!635279 (and (or (not ((_ is Cons!19269) (toList!6108 (map!13018 thiss!1141)))) (bvsle (_1!6754 (h!20426 (toList!6108 (map!13018 thiss!1141)))) key!756)) ((_ is Cons!19269) (toList!6108 (map!13018 thiss!1141))) (bvslt (_1!6754 (h!20426 (toList!6108 (map!13018 thiss!1141)))) key!756)))))

(declare-fun b!946223 () Bool)

(assert (=> b!946223 (= e!532266 (containsKey!456 (t!27584 (toList!6108 (map!13018 thiss!1141))) key!756))))

(assert (= (and d!114707 (not res!635278)) b!946222))

(assert (= (and b!946222 res!635279) b!946223))

(declare-fun m!880473 () Bool)

(assert (=> b!946223 m!880473))

(assert (=> d!114703 d!114707))

(declare-fun bm!41073 () Bool)

(declare-fun call!41076 () Bool)

(assert (=> bm!41073 (= call!41076 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10596 thiss!1141) (mask!27397 thiss!1141)))))

(declare-fun b!946233 () Bool)

(declare-fun e!532275 () Bool)

(assert (=> b!946233 (= e!532275 call!41076)))

(declare-fun b!946234 () Bool)

(declare-fun e!532274 () Bool)

(assert (=> b!946234 (= e!532275 e!532274)))

(declare-fun lt!426312 () (_ BitVec 64))

(assert (=> b!946234 (= lt!426312 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426311 () Unit!31861)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57221 (_ BitVec 64) (_ BitVec 32)) Unit!31861)

(assert (=> b!946234 (= lt!426311 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10596 thiss!1141) lt!426312 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946234 (arrayContainsKey!0 (_keys!10596 thiss!1141) lt!426312 #b00000000000000000000000000000000)))

(declare-fun lt!426313 () Unit!31861)

(assert (=> b!946234 (= lt!426313 lt!426311)))

(declare-fun res!635284 () Bool)

(declare-datatypes ((SeekEntryResult!9043 0))(
  ( (MissingZero!9043 (index!38543 (_ BitVec 32))) (Found!9043 (index!38544 (_ BitVec 32))) (Intermediate!9043 (undefined!9855 Bool) (index!38545 (_ BitVec 32)) (x!81196 (_ BitVec 32))) (Undefined!9043) (MissingVacant!9043 (index!38546 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57221 (_ BitVec 32)) SeekEntryResult!9043)

(assert (=> b!946234 (= res!635284 (= (seekEntryOrOpen!0 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000) (_keys!10596 thiss!1141) (mask!27397 thiss!1141)) (Found!9043 #b00000000000000000000000000000000)))))

(assert (=> b!946234 (=> (not res!635284) (not e!532274))))

(declare-fun b!946235 () Bool)

(assert (=> b!946235 (= e!532274 call!41076)))

(declare-fun b!946232 () Bool)

(declare-fun e!532273 () Bool)

(assert (=> b!946232 (= e!532273 e!532275)))

(declare-fun c!98669 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946232 (= c!98669 (validKeyInArray!0 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114709 () Bool)

(declare-fun res!635285 () Bool)

(assert (=> d!114709 (=> res!635285 e!532273)))

(assert (=> d!114709 (= res!635285 (bvsge #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))))))

(assert (=> d!114709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10596 thiss!1141) (mask!27397 thiss!1141)) e!532273)))

(assert (= (and d!114709 (not res!635285)) b!946232))

(assert (= (and b!946232 c!98669) b!946234))

(assert (= (and b!946232 (not c!98669)) b!946233))

(assert (= (and b!946234 res!635284) b!946235))

(assert (= (or b!946235 b!946233) bm!41073))

(declare-fun m!880475 () Bool)

(assert (=> bm!41073 m!880475))

(declare-fun m!880477 () Bool)

(assert (=> b!946234 m!880477))

(declare-fun m!880479 () Bool)

(assert (=> b!946234 m!880479))

(declare-fun m!880481 () Bool)

(assert (=> b!946234 m!880481))

(assert (=> b!946234 m!880477))

(declare-fun m!880483 () Bool)

(assert (=> b!946234 m!880483))

(assert (=> b!946232 m!880477))

(assert (=> b!946232 m!880477))

(declare-fun m!880485 () Bool)

(assert (=> b!946232 m!880485))

(assert (=> b!946199 d!114709))

(declare-fun b!946246 () Bool)

(declare-fun res!635296 () Bool)

(declare-fun e!532278 () Bool)

(assert (=> b!946246 (=> (not res!635296) (not e!532278))))

(declare-fun size!28003 (LongMapFixedSize!4786) (_ BitVec 32))

(assert (=> b!946246 (= res!635296 (= (size!28003 thiss!1141) (bvadd (_size!2448 thiss!1141) (bvsdiv (bvadd (extraKeys!5421 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!946247 () Bool)

(assert (=> b!946247 (= e!532278 (and (bvsge (extraKeys!5421 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5421 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2448 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!946244 () Bool)

(declare-fun res!635297 () Bool)

(assert (=> b!946244 (=> (not res!635297) (not e!532278))))

(assert (=> b!946244 (= res!635297 (and (= (size!27997 (_values!5712 thiss!1141)) (bvadd (mask!27397 thiss!1141) #b00000000000000000000000000000001)) (= (size!27998 (_keys!10596 thiss!1141)) (size!27997 (_values!5712 thiss!1141))) (bvsge (_size!2448 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2448 thiss!1141) (bvadd (mask!27397 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!946245 () Bool)

(declare-fun res!635294 () Bool)

(assert (=> b!946245 (=> (not res!635294) (not e!532278))))

(assert (=> b!946245 (= res!635294 (bvsge (size!28003 thiss!1141) (_size!2448 thiss!1141)))))

(declare-fun d!114711 () Bool)

(declare-fun res!635295 () Bool)

(assert (=> d!114711 (=> (not res!635295) (not e!532278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114711 (= res!635295 (validMask!0 (mask!27397 thiss!1141)))))

(assert (=> d!114711 (= (simpleValid!350 thiss!1141) e!532278)))

(assert (= (and d!114711 res!635295) b!946244))

(assert (= (and b!946244 res!635297) b!946245))

(assert (= (and b!946245 res!635294) b!946246))

(assert (= (and b!946246 res!635296) b!946247))

(declare-fun m!880487 () Bool)

(assert (=> b!946246 m!880487))

(assert (=> b!946245 m!880487))

(declare-fun m!880489 () Bool)

(assert (=> d!114711 m!880489))

(assert (=> d!114697 d!114711))

(declare-fun b!946290 () Bool)

(declare-fun e!532310 () ListLongMap!12185)

(declare-fun call!41091 () ListLongMap!12185)

(assert (=> b!946290 (= e!532310 call!41091)))

(declare-fun b!946291 () Bool)

(declare-fun e!532315 () Bool)

(assert (=> b!946291 (= e!532315 (validKeyInArray!0 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946292 () Bool)

(declare-fun e!532312 () Bool)

(assert (=> b!946292 (= e!532312 (validKeyInArray!0 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946293 () Bool)

(declare-fun e!532311 () Unit!31861)

(declare-fun lt!426375 () Unit!31861)

(assert (=> b!946293 (= e!532311 lt!426375)))

(declare-fun lt!426371 () ListLongMap!12185)

(declare-fun getCurrentListMapNoExtraKeys!3351 (array!57221 array!57219 (_ BitVec 32) (_ BitVec 32) V!32431 V!32431 (_ BitVec 32) Int) ListLongMap!12185)

(assert (=> b!946293 (= lt!426371 (getCurrentListMapNoExtraKeys!3351 (_keys!10596 thiss!1141) (_values!5712 thiss!1141) (mask!27397 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun lt!426370 () (_ BitVec 64))

(assert (=> b!946293 (= lt!426370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426364 () (_ BitVec 64))

(assert (=> b!946293 (= lt!426364 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426362 () Unit!31861)

(declare-fun addStillContains!566 (ListLongMap!12185 (_ BitVec 64) V!32431 (_ BitVec 64)) Unit!31861)

(assert (=> b!946293 (= lt!426362 (addStillContains!566 lt!426371 lt!426370 (zeroValue!5525 thiss!1141) lt!426364))))

(declare-fun +!2863 (ListLongMap!12185 tuple2!13486) ListLongMap!12185)

(assert (=> b!946293 (contains!5192 (+!2863 lt!426371 (tuple2!13487 lt!426370 (zeroValue!5525 thiss!1141))) lt!426364)))

(declare-fun lt!426360 () Unit!31861)

(assert (=> b!946293 (= lt!426360 lt!426362)))

(declare-fun lt!426359 () ListLongMap!12185)

(assert (=> b!946293 (= lt!426359 (getCurrentListMapNoExtraKeys!3351 (_keys!10596 thiss!1141) (_values!5712 thiss!1141) (mask!27397 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun lt!426377 () (_ BitVec 64))

(assert (=> b!946293 (= lt!426377 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426376 () (_ BitVec 64))

(assert (=> b!946293 (= lt!426376 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426363 () Unit!31861)

(declare-fun addApplyDifferent!447 (ListLongMap!12185 (_ BitVec 64) V!32431 (_ BitVec 64)) Unit!31861)

(assert (=> b!946293 (= lt!426363 (addApplyDifferent!447 lt!426359 lt!426377 (minValue!5525 thiss!1141) lt!426376))))

(declare-fun apply!877 (ListLongMap!12185 (_ BitVec 64)) V!32431)

(assert (=> b!946293 (= (apply!877 (+!2863 lt!426359 (tuple2!13487 lt!426377 (minValue!5525 thiss!1141))) lt!426376) (apply!877 lt!426359 lt!426376))))

(declare-fun lt!426365 () Unit!31861)

(assert (=> b!946293 (= lt!426365 lt!426363)))

(declare-fun lt!426378 () ListLongMap!12185)

(assert (=> b!946293 (= lt!426378 (getCurrentListMapNoExtraKeys!3351 (_keys!10596 thiss!1141) (_values!5712 thiss!1141) (mask!27397 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun lt!426361 () (_ BitVec 64))

(assert (=> b!946293 (= lt!426361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426366 () (_ BitVec 64))

(assert (=> b!946293 (= lt!426366 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426374 () Unit!31861)

(assert (=> b!946293 (= lt!426374 (addApplyDifferent!447 lt!426378 lt!426361 (zeroValue!5525 thiss!1141) lt!426366))))

(assert (=> b!946293 (= (apply!877 (+!2863 lt!426378 (tuple2!13487 lt!426361 (zeroValue!5525 thiss!1141))) lt!426366) (apply!877 lt!426378 lt!426366))))

(declare-fun lt!426369 () Unit!31861)

(assert (=> b!946293 (= lt!426369 lt!426374)))

(declare-fun lt!426358 () ListLongMap!12185)

(assert (=> b!946293 (= lt!426358 (getCurrentListMapNoExtraKeys!3351 (_keys!10596 thiss!1141) (_values!5712 thiss!1141) (mask!27397 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun lt!426373 () (_ BitVec 64))

(assert (=> b!946293 (= lt!426373 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!426372 () (_ BitVec 64))

(assert (=> b!946293 (= lt!426372 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946293 (= lt!426375 (addApplyDifferent!447 lt!426358 lt!426373 (minValue!5525 thiss!1141) lt!426372))))

(assert (=> b!946293 (= (apply!877 (+!2863 lt!426358 (tuple2!13487 lt!426373 (minValue!5525 thiss!1141))) lt!426372) (apply!877 lt!426358 lt!426372))))

(declare-fun bm!41088 () Bool)

(declare-fun call!41097 () ListLongMap!12185)

(declare-fun call!41095 () ListLongMap!12185)

(assert (=> bm!41088 (= call!41097 call!41095)))

(declare-fun b!946294 () Bool)

(declare-fun e!532308 () Bool)

(declare-fun e!532317 () Bool)

(assert (=> b!946294 (= e!532308 e!532317)))

(declare-fun res!635321 () Bool)

(declare-fun call!41093 () Bool)

(assert (=> b!946294 (= res!635321 call!41093)))

(assert (=> b!946294 (=> (not res!635321) (not e!532317))))

(declare-fun b!946295 () Bool)

(assert (=> b!946295 (= e!532310 call!41097)))

(declare-fun b!946296 () Bool)

(declare-fun e!532309 () Bool)

(declare-fun e!532307 () Bool)

(assert (=> b!946296 (= e!532309 e!532307)))

(declare-fun res!635324 () Bool)

(assert (=> b!946296 (=> (not res!635324) (not e!532307))))

(declare-fun lt!426379 () ListLongMap!12185)

(assert (=> b!946296 (= res!635324 (contains!5192 lt!426379 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!946296 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))))))

(declare-fun b!946297 () Bool)

(declare-fun e!532305 () ListLongMap!12185)

(assert (=> b!946297 (= e!532305 call!41097)))

(declare-fun b!946298 () Bool)

(declare-fun e!532313 () ListLongMap!12185)

(assert (=> b!946298 (= e!532313 (+!2863 call!41095 (tuple2!13487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5525 thiss!1141))))))

(declare-fun b!946299 () Bool)

(declare-fun c!98687 () Bool)

(assert (=> b!946299 (= c!98687 (and (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!946299 (= e!532305 e!532310)))

(declare-fun b!946300 () Bool)

(declare-fun res!635319 () Bool)

(declare-fun e!532306 () Bool)

(assert (=> b!946300 (=> (not res!635319) (not e!532306))))

(declare-fun e!532316 () Bool)

(assert (=> b!946300 (= res!635319 e!532316)))

(declare-fun c!98686 () Bool)

(assert (=> b!946300 (= c!98686 (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!946301 () Bool)

(declare-fun call!41092 () Bool)

(assert (=> b!946301 (= e!532316 (not call!41092))))

(declare-fun b!946302 () Bool)

(declare-fun e!532314 () Bool)

(assert (=> b!946302 (= e!532316 e!532314)))

(declare-fun res!635320 () Bool)

(assert (=> b!946302 (= res!635320 call!41092)))

(assert (=> b!946302 (=> (not res!635320) (not e!532314))))

(declare-fun d!114713 () Bool)

(assert (=> d!114713 e!532306))

(declare-fun res!635322 () Bool)

(assert (=> d!114713 (=> (not res!635322) (not e!532306))))

(assert (=> d!114713 (= res!635322 (or (bvsge #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))))))))

(declare-fun lt!426368 () ListLongMap!12185)

(assert (=> d!114713 (= lt!426379 lt!426368)))

(declare-fun lt!426367 () Unit!31861)

(assert (=> d!114713 (= lt!426367 e!532311)))

(declare-fun c!98684 () Bool)

(assert (=> d!114713 (= c!98684 e!532315)))

(declare-fun res!635323 () Bool)

(assert (=> d!114713 (=> (not res!635323) (not e!532315))))

(assert (=> d!114713 (= res!635323 (bvslt #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))))))

(assert (=> d!114713 (= lt!426368 e!532313)))

(declare-fun c!98682 () Bool)

(assert (=> d!114713 (= c!98682 (and (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114713 (validMask!0 (mask!27397 thiss!1141))))

(assert (=> d!114713 (= (getCurrentListMap!3342 (_keys!10596 thiss!1141) (_values!5712 thiss!1141) (mask!27397 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)) lt!426379)))

(declare-fun bm!41089 () Bool)

(declare-fun call!41096 () ListLongMap!12185)

(declare-fun c!98683 () Bool)

(declare-fun call!41094 () ListLongMap!12185)

(assert (=> bm!41089 (= call!41095 (+!2863 (ite c!98682 call!41096 (ite c!98683 call!41094 call!41091)) (ite (or c!98682 c!98683) (tuple2!13487 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5525 thiss!1141)) (tuple2!13487 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5525 thiss!1141)))))))

(declare-fun b!946303 () Bool)

(declare-fun Unit!31864 () Unit!31861)

(assert (=> b!946303 (= e!532311 Unit!31864)))

(declare-fun b!946304 () Bool)

(assert (=> b!946304 (= e!532306 e!532308)))

(declare-fun c!98685 () Bool)

(assert (=> b!946304 (= c!98685 (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!946305 () Bool)

(assert (=> b!946305 (= e!532313 e!532305)))

(assert (=> b!946305 (= c!98683 (and (not (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5421 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41090 () Bool)

(assert (=> bm!41090 (= call!41091 call!41094)))

(declare-fun bm!41091 () Bool)

(assert (=> bm!41091 (= call!41094 call!41096)))

(declare-fun bm!41092 () Bool)

(assert (=> bm!41092 (= call!41092 (contains!5192 lt!426379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!946306 () Bool)

(assert (=> b!946306 (= e!532314 (= (apply!877 lt!426379 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5525 thiss!1141)))))

(declare-fun bm!41093 () Bool)

(assert (=> bm!41093 (= call!41093 (contains!5192 lt!426379 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!946307 () Bool)

(declare-fun get!14486 (ValueCell!9818 V!32431) V!32431)

(declare-fun dynLambda!1660 (Int (_ BitVec 64)) V!32431)

(assert (=> b!946307 (= e!532307 (= (apply!877 lt!426379 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000)) (get!14486 (select (arr!27529 (_values!5712 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1660 (defaultEntry!5689 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!946307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27997 (_values!5712 thiss!1141))))))

(assert (=> b!946307 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))))))

(declare-fun b!946308 () Bool)

(declare-fun res!635316 () Bool)

(assert (=> b!946308 (=> (not res!635316) (not e!532306))))

(assert (=> b!946308 (= res!635316 e!532309)))

(declare-fun res!635318 () Bool)

(assert (=> b!946308 (=> res!635318 e!532309)))

(assert (=> b!946308 (= res!635318 (not e!532312))))

(declare-fun res!635317 () Bool)

(assert (=> b!946308 (=> (not res!635317) (not e!532312))))

(assert (=> b!946308 (= res!635317 (bvslt #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))))))

(declare-fun bm!41094 () Bool)

(assert (=> bm!41094 (= call!41096 (getCurrentListMapNoExtraKeys!3351 (_keys!10596 thiss!1141) (_values!5712 thiss!1141) (mask!27397 thiss!1141) (extraKeys!5421 thiss!1141) (zeroValue!5525 thiss!1141) (minValue!5525 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5689 thiss!1141)))))

(declare-fun b!946309 () Bool)

(assert (=> b!946309 (= e!532308 (not call!41093))))

(declare-fun b!946310 () Bool)

(assert (=> b!946310 (= e!532317 (= (apply!877 lt!426379 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5525 thiss!1141)))))

(assert (= (and d!114713 c!98682) b!946298))

(assert (= (and d!114713 (not c!98682)) b!946305))

(assert (= (and b!946305 c!98683) b!946297))

(assert (= (and b!946305 (not c!98683)) b!946299))

(assert (= (and b!946299 c!98687) b!946295))

(assert (= (and b!946299 (not c!98687)) b!946290))

(assert (= (or b!946295 b!946290) bm!41090))

(assert (= (or b!946297 bm!41090) bm!41091))

(assert (= (or b!946297 b!946295) bm!41088))

(assert (= (or b!946298 bm!41091) bm!41094))

(assert (= (or b!946298 bm!41088) bm!41089))

(assert (= (and d!114713 res!635323) b!946291))

(assert (= (and d!114713 c!98684) b!946293))

(assert (= (and d!114713 (not c!98684)) b!946303))

(assert (= (and d!114713 res!635322) b!946308))

(assert (= (and b!946308 res!635317) b!946292))

(assert (= (and b!946308 (not res!635318)) b!946296))

(assert (= (and b!946296 res!635324) b!946307))

(assert (= (and b!946308 res!635316) b!946300))

(assert (= (and b!946300 c!98686) b!946302))

(assert (= (and b!946300 (not c!98686)) b!946301))

(assert (= (and b!946302 res!635320) b!946306))

(assert (= (or b!946302 b!946301) bm!41092))

(assert (= (and b!946300 res!635319) b!946304))

(assert (= (and b!946304 c!98685) b!946294))

(assert (= (and b!946304 (not c!98685)) b!946309))

(assert (= (and b!946294 res!635321) b!946310))

(assert (= (or b!946294 b!946309) bm!41093))

(declare-fun b_lambda!14309 () Bool)

(assert (=> (not b_lambda!14309) (not b!946307)))

(declare-fun t!27588 () Bool)

(declare-fun tb!6163 () Bool)

(assert (=> (and b!946153 (= (defaultEntry!5689 thiss!1141) (defaultEntry!5689 thiss!1141)) t!27588) tb!6163))

(declare-fun result!12201 () Bool)

(assert (=> tb!6163 (= result!12201 tp_is_empty!20599)))

(assert (=> b!946307 t!27588))

(declare-fun b_and!29527 () Bool)

(assert (= b_and!29521 (and (=> t!27588 result!12201) b_and!29527)))

(declare-fun m!880491 () Bool)

(assert (=> b!946293 m!880491))

(declare-fun m!880493 () Bool)

(assert (=> b!946293 m!880493))

(declare-fun m!880495 () Bool)

(assert (=> b!946293 m!880495))

(declare-fun m!880497 () Bool)

(assert (=> b!946293 m!880497))

(declare-fun m!880499 () Bool)

(assert (=> b!946293 m!880499))

(assert (=> b!946293 m!880477))

(declare-fun m!880501 () Bool)

(assert (=> b!946293 m!880501))

(declare-fun m!880503 () Bool)

(assert (=> b!946293 m!880503))

(declare-fun m!880505 () Bool)

(assert (=> b!946293 m!880505))

(declare-fun m!880507 () Bool)

(assert (=> b!946293 m!880507))

(declare-fun m!880509 () Bool)

(assert (=> b!946293 m!880509))

(declare-fun m!880511 () Bool)

(assert (=> b!946293 m!880511))

(assert (=> b!946293 m!880495))

(declare-fun m!880513 () Bool)

(assert (=> b!946293 m!880513))

(assert (=> b!946293 m!880501))

(declare-fun m!880515 () Bool)

(assert (=> b!946293 m!880515))

(assert (=> b!946293 m!880491))

(declare-fun m!880517 () Bool)

(assert (=> b!946293 m!880517))

(declare-fun m!880519 () Bool)

(assert (=> b!946293 m!880519))

(assert (=> b!946293 m!880517))

(declare-fun m!880521 () Bool)

(assert (=> b!946293 m!880521))

(declare-fun m!880523 () Bool)

(assert (=> bm!41093 m!880523))

(declare-fun m!880525 () Bool)

(assert (=> bm!41089 m!880525))

(assert (=> d!114713 m!880489))

(assert (=> b!946292 m!880477))

(assert (=> b!946292 m!880477))

(assert (=> b!946292 m!880485))

(assert (=> b!946307 m!880477))

(assert (=> b!946307 m!880477))

(declare-fun m!880527 () Bool)

(assert (=> b!946307 m!880527))

(declare-fun m!880529 () Bool)

(assert (=> b!946307 m!880529))

(declare-fun m!880531 () Bool)

(assert (=> b!946307 m!880531))

(assert (=> b!946307 m!880531))

(assert (=> b!946307 m!880529))

(declare-fun m!880533 () Bool)

(assert (=> b!946307 m!880533))

(declare-fun m!880535 () Bool)

(assert (=> b!946310 m!880535))

(declare-fun m!880537 () Bool)

(assert (=> b!946306 m!880537))

(declare-fun m!880539 () Bool)

(assert (=> bm!41092 m!880539))

(assert (=> b!946296 m!880477))

(assert (=> b!946296 m!880477))

(declare-fun m!880541 () Bool)

(assert (=> b!946296 m!880541))

(assert (=> b!946291 m!880477))

(assert (=> b!946291 m!880477))

(assert (=> b!946291 m!880485))

(assert (=> bm!41094 m!880505))

(declare-fun m!880543 () Bool)

(assert (=> b!946298 m!880543))

(assert (=> d!114705 d!114713))

(declare-fun bm!41097 () Bool)

(declare-fun call!41100 () (_ BitVec 32))

(assert (=> bm!41097 (= call!41100 (arrayCountValidKeys!0 (_keys!10596 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27998 (_keys!10596 thiss!1141))))))

(declare-fun b!946321 () Bool)

(declare-fun e!532322 () (_ BitVec 32))

(declare-fun e!532323 () (_ BitVec 32))

(assert (=> b!946321 (= e!532322 e!532323)))

(declare-fun c!98692 () Bool)

(assert (=> b!946321 (= c!98692 (validKeyInArray!0 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946322 () Bool)

(assert (=> b!946322 (= e!532323 (bvadd #b00000000000000000000000000000001 call!41100))))

(declare-fun b!946323 () Bool)

(assert (=> b!946323 (= e!532323 call!41100)))

(declare-fun d!114715 () Bool)

(declare-fun lt!426382 () (_ BitVec 32))

(assert (=> d!114715 (and (bvsge lt!426382 #b00000000000000000000000000000000) (bvsle lt!426382 (bvsub (size!27998 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114715 (= lt!426382 e!532322)))

(declare-fun c!98693 () Bool)

(assert (=> d!114715 (= c!98693 (bvsge #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))))))

(assert (=> d!114715 (and (bvsle #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27998 (_keys!10596 thiss!1141)) (size!27998 (_keys!10596 thiss!1141))))))

(assert (=> d!114715 (= (arrayCountValidKeys!0 (_keys!10596 thiss!1141) #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))) lt!426382)))

(declare-fun b!946324 () Bool)

(assert (=> b!946324 (= e!532322 #b00000000000000000000000000000000)))

(assert (= (and d!114715 c!98693) b!946324))

(assert (= (and d!114715 (not c!98693)) b!946321))

(assert (= (and b!946321 c!98692) b!946322))

(assert (= (and b!946321 (not c!98692)) b!946323))

(assert (= (or b!946322 b!946323) bm!41097))

(declare-fun m!880545 () Bool)

(assert (=> bm!41097 m!880545))

(assert (=> b!946321 m!880477))

(assert (=> b!946321 m!880477))

(assert (=> b!946321 m!880485))

(assert (=> b!946198 d!114715))

(declare-fun d!114717 () Bool)

(declare-fun isEmpty!709 (Option!491) Bool)

(assert (=> d!114717 (= (isDefined!358 (getValueByKey!485 (toList!6108 (map!13018 thiss!1141)) key!756)) (not (isEmpty!709 (getValueByKey!485 (toList!6108 (map!13018 thiss!1141)) key!756))))))

(declare-fun bs!26589 () Bool)

(assert (= bs!26589 d!114717))

(assert (=> bs!26589 m!880465))

(declare-fun m!880547 () Bool)

(assert (=> bs!26589 m!880547))

(assert (=> b!946209 d!114717))

(declare-fun d!114719 () Bool)

(declare-fun c!98698 () Bool)

(assert (=> d!114719 (= c!98698 (and ((_ is Cons!19269) (toList!6108 (map!13018 thiss!1141))) (= (_1!6754 (h!20426 (toList!6108 (map!13018 thiss!1141)))) key!756)))))

(declare-fun e!532328 () Option!491)

(assert (=> d!114719 (= (getValueByKey!485 (toList!6108 (map!13018 thiss!1141)) key!756) e!532328)))

(declare-fun b!946333 () Bool)

(assert (=> b!946333 (= e!532328 (Some!490 (_2!6754 (h!20426 (toList!6108 (map!13018 thiss!1141))))))))

(declare-fun b!946334 () Bool)

(declare-fun e!532329 () Option!491)

(assert (=> b!946334 (= e!532328 e!532329)))

(declare-fun c!98699 () Bool)

(assert (=> b!946334 (= c!98699 (and ((_ is Cons!19269) (toList!6108 (map!13018 thiss!1141))) (not (= (_1!6754 (h!20426 (toList!6108 (map!13018 thiss!1141)))) key!756))))))

(declare-fun b!946336 () Bool)

(assert (=> b!946336 (= e!532329 None!489)))

(declare-fun b!946335 () Bool)

(assert (=> b!946335 (= e!532329 (getValueByKey!485 (t!27584 (toList!6108 (map!13018 thiss!1141))) key!756))))

(assert (= (and d!114719 c!98698) b!946333))

(assert (= (and d!114719 (not c!98698)) b!946334))

(assert (= (and b!946334 c!98699) b!946335))

(assert (= (and b!946334 (not c!98699)) b!946336))

(declare-fun m!880549 () Bool)

(assert (=> b!946335 m!880549))

(assert (=> b!946209 d!114719))

(declare-fun d!114721 () Bool)

(assert (=> d!114721 (isDefined!358 (getValueByKey!485 (toList!6108 (map!13018 thiss!1141)) key!756))))

(declare-fun lt!426385 () Unit!31861)

(declare-fun choose!1576 (List!19273 (_ BitVec 64)) Unit!31861)

(assert (=> d!114721 (= lt!426385 (choose!1576 (toList!6108 (map!13018 thiss!1141)) key!756))))

(declare-fun e!532332 () Bool)

(assert (=> d!114721 e!532332))

(declare-fun res!635327 () Bool)

(assert (=> d!114721 (=> (not res!635327) (not e!532332))))

(declare-fun isStrictlySorted!495 (List!19273) Bool)

(assert (=> d!114721 (= res!635327 (isStrictlySorted!495 (toList!6108 (map!13018 thiss!1141))))))

(assert (=> d!114721 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!350 (toList!6108 (map!13018 thiss!1141)) key!756) lt!426385)))

(declare-fun b!946339 () Bool)

(assert (=> b!946339 (= e!532332 (containsKey!456 (toList!6108 (map!13018 thiss!1141)) key!756))))

(assert (= (and d!114721 res!635327) b!946339))

(assert (=> d!114721 m!880465))

(assert (=> d!114721 m!880465))

(assert (=> d!114721 m!880467))

(declare-fun m!880551 () Bool)

(assert (=> d!114721 m!880551))

(declare-fun m!880553 () Bool)

(assert (=> d!114721 m!880553))

(assert (=> b!946339 m!880461))

(assert (=> b!946207 d!114721))

(assert (=> b!946207 d!114717))

(assert (=> b!946207 d!114719))

(declare-fun b!946350 () Bool)

(declare-fun e!532343 () Bool)

(declare-fun e!532344 () Bool)

(assert (=> b!946350 (= e!532343 e!532344)))

(declare-fun c!98702 () Bool)

(assert (=> b!946350 (= c!98702 (validKeyInArray!0 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946351 () Bool)

(declare-fun call!41103 () Bool)

(assert (=> b!946351 (= e!532344 call!41103)))

(declare-fun bm!41100 () Bool)

(assert (=> bm!41100 (= call!41103 (arrayNoDuplicates!0 (_keys!10596 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98702 (Cons!19271 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000) Nil!19272) Nil!19272)))))

(declare-fun d!114723 () Bool)

(declare-fun res!635334 () Bool)

(declare-fun e!532342 () Bool)

(assert (=> d!114723 (=> res!635334 e!532342)))

(assert (=> d!114723 (= res!635334 (bvsge #b00000000000000000000000000000000 (size!27998 (_keys!10596 thiss!1141))))))

(assert (=> d!114723 (= (arrayNoDuplicates!0 (_keys!10596 thiss!1141) #b00000000000000000000000000000000 Nil!19272) e!532342)))

(declare-fun b!946352 () Bool)

(assert (=> b!946352 (= e!532344 call!41103)))

(declare-fun b!946353 () Bool)

(assert (=> b!946353 (= e!532342 e!532343)))

(declare-fun res!635336 () Bool)

(assert (=> b!946353 (=> (not res!635336) (not e!532343))))

(declare-fun e!532341 () Bool)

(assert (=> b!946353 (= res!635336 (not e!532341))))

(declare-fun res!635335 () Bool)

(assert (=> b!946353 (=> (not res!635335) (not e!532341))))

(assert (=> b!946353 (= res!635335 (validKeyInArray!0 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946354 () Bool)

(declare-fun contains!5194 (List!19275 (_ BitVec 64)) Bool)

(assert (=> b!946354 (= e!532341 (contains!5194 Nil!19272 (select (arr!27530 (_keys!10596 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114723 (not res!635334)) b!946353))

(assert (= (and b!946353 res!635335) b!946354))

(assert (= (and b!946353 res!635336) b!946350))

(assert (= (and b!946350 c!98702) b!946351))

(assert (= (and b!946350 (not c!98702)) b!946352))

(assert (= (or b!946351 b!946352) bm!41100))

(assert (=> b!946350 m!880477))

(assert (=> b!946350 m!880477))

(assert (=> b!946350 m!880485))

(assert (=> bm!41100 m!880477))

(declare-fun m!880555 () Bool)

(assert (=> bm!41100 m!880555))

(assert (=> b!946353 m!880477))

(assert (=> b!946353 m!880477))

(assert (=> b!946353 m!880485))

(assert (=> b!946354 m!880477))

(assert (=> b!946354 m!880477))

(declare-fun m!880557 () Bool)

(assert (=> b!946354 m!880557))

(assert (=> b!946200 d!114723))

(declare-fun condMapEmpty!32738 () Bool)

(declare-fun mapDefault!32738 () ValueCell!9818)

(assert (=> mapNonEmpty!32737 (= condMapEmpty!32738 (= mapRest!32737 ((as const (Array (_ BitVec 32) ValueCell!9818)) mapDefault!32738)))))

(declare-fun e!532346 () Bool)

(declare-fun mapRes!32738 () Bool)

(assert (=> mapNonEmpty!32737 (= tp!62803 (and e!532346 mapRes!32738))))

(declare-fun b!946356 () Bool)

(assert (=> b!946356 (= e!532346 tp_is_empty!20599)))

(declare-fun mapNonEmpty!32738 () Bool)

(declare-fun tp!62804 () Bool)

(declare-fun e!532345 () Bool)

(assert (=> mapNonEmpty!32738 (= mapRes!32738 (and tp!62804 e!532345))))

(declare-fun mapValue!32738 () ValueCell!9818)

(declare-fun mapRest!32738 () (Array (_ BitVec 32) ValueCell!9818))

(declare-fun mapKey!32738 () (_ BitVec 32))

(assert (=> mapNonEmpty!32738 (= mapRest!32737 (store mapRest!32738 mapKey!32738 mapValue!32738))))

(declare-fun b!946355 () Bool)

(assert (=> b!946355 (= e!532345 tp_is_empty!20599)))

(declare-fun mapIsEmpty!32738 () Bool)

(assert (=> mapIsEmpty!32738 mapRes!32738))

(assert (= (and mapNonEmpty!32737 condMapEmpty!32738) mapIsEmpty!32738))

(assert (= (and mapNonEmpty!32737 (not condMapEmpty!32738)) mapNonEmpty!32738))

(assert (= (and mapNonEmpty!32738 ((_ is ValueCellFull!9818) mapValue!32738)) b!946355))

(assert (= (and mapNonEmpty!32737 ((_ is ValueCellFull!9818) mapDefault!32738)) b!946356))

(declare-fun m!880559 () Bool)

(assert (=> mapNonEmpty!32738 m!880559))

(declare-fun b_lambda!14311 () Bool)

(assert (= b_lambda!14309 (or (and b!946153 b_free!18091) b_lambda!14311)))

(check-sat (not b!946354) (not bm!41093) (not b!946293) b_and!29527 (not b!946246) (not b!946296) (not b!946232) (not b!946310) (not b!946292) (not b!946335) (not bm!41092) (not b!946245) (not bm!41073) (not mapNonEmpty!32738) (not d!114711) (not b!946339) tp_is_empty!20599 (not b!946321) (not b!946223) (not bm!41097) (not b!946306) (not d!114717) (not b!946307) (not b_lambda!14311) (not b!946291) (not b!946353) (not bm!41094) (not b_next!18091) (not bm!41100) (not b!946234) (not d!114721) (not b!946350) (not d!114713) (not bm!41089) (not b!946298))
(check-sat b_and!29527 (not b_next!18091))
