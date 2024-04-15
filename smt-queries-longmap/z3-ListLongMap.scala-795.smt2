; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19002 () Bool)

(assert start!19002)

(declare-fun b!187178 () Bool)

(declare-fun b_free!4609 () Bool)

(declare-fun b_next!4609 () Bool)

(assert (=> b!187178 (= b_free!4609 (not b_next!4609))))

(declare-fun tp!16640 () Bool)

(declare-fun b_and!11201 () Bool)

(assert (=> b!187178 (= tp!16640 b_and!11201)))

(declare-fun b!187169 () Bool)

(declare-datatypes ((Unit!5615 0))(
  ( (Unit!5616) )
))
(declare-fun e!123178 () Unit!5615)

(declare-fun Unit!5617 () Unit!5615)

(assert (=> b!187169 (= e!123178 Unit!5617)))

(declare-fun lt!92487 () Unit!5615)

(declare-datatypes ((V!5489 0))(
  ( (V!5490 (val!2235 Int)) )
))
(declare-datatypes ((ValueCell!1847 0))(
  ( (ValueCellFull!1847 (v!4144 V!5489)) (EmptyCell!1847) )
))
(declare-datatypes ((array!7959 0))(
  ( (array!7960 (arr!3754 (Array (_ BitVec 32) (_ BitVec 64))) (size!4073 (_ BitVec 32))) )
))
(declare-datatypes ((array!7961 0))(
  ( (array!7962 (arr!3755 (Array (_ BitVec 32) ValueCell!1847)) (size!4074 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2602 0))(
  ( (LongMapFixedSize!2603 (defaultEntry!3821 Int) (mask!8965 (_ BitVec 32)) (extraKeys!3558 (_ BitVec 32)) (zeroValue!3662 V!5489) (minValue!3662 V!5489) (_size!1350 (_ BitVec 32)) (_keys!5771 array!7959) (_values!3804 array!7961) (_vacant!1350 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2602)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!147 (array!7959 array!7961 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 64) Int) Unit!5615)

(assert (=> b!187169 (= lt!92487 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!147 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)))))

(assert (=> b!187169 false))

(declare-fun b!187170 () Bool)

(declare-fun res!88480 () Bool)

(declare-fun e!123183 () Bool)

(assert (=> b!187170 (=> (not res!88480) (not e!123183))))

(assert (=> b!187170 (= res!88480 (not (= key!828 (bvneg key!828))))))

(declare-fun b!187171 () Bool)

(declare-fun e!123177 () Bool)

(declare-fun e!123179 () Bool)

(assert (=> b!187171 (= e!123177 e!123179)))

(declare-fun res!88483 () Bool)

(assert (=> b!187171 (=> (not res!88483) (not e!123179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!187171 (= res!88483 (validMask!0 (mask!8965 thiss!1248)))))

(declare-fun lt!92488 () Unit!5615)

(assert (=> b!187171 (= lt!92488 e!123178)))

(declare-fun c!33601 () Bool)

(declare-datatypes ((tuple2!3442 0))(
  ( (tuple2!3443 (_1!1732 (_ BitVec 64)) (_2!1732 V!5489)) )
))
(declare-datatypes ((List!2370 0))(
  ( (Nil!2367) (Cons!2366 (h!3001 tuple2!3442) (t!7253 List!2370)) )
))
(declare-datatypes ((ListLongMap!2351 0))(
  ( (ListLongMap!2352 (toList!1191 List!2370)) )
))
(declare-fun contains!1297 (ListLongMap!2351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!824 (array!7959 array!7961 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 32) Int) ListLongMap!2351)

(assert (=> b!187171 (= c!33601 (contains!1297 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)) key!828))))

(declare-fun mapIsEmpty!7547 () Bool)

(declare-fun mapRes!7547 () Bool)

(assert (=> mapIsEmpty!7547 mapRes!7547))

(declare-fun b!187172 () Bool)

(declare-fun e!123180 () Bool)

(declare-fun tp_is_empty!4381 () Bool)

(assert (=> b!187172 (= e!123180 tp_is_empty!4381)))

(declare-fun mapNonEmpty!7547 () Bool)

(declare-fun tp!16639 () Bool)

(assert (=> mapNonEmpty!7547 (= mapRes!7547 (and tp!16639 e!123180))))

(declare-fun mapValue!7547 () ValueCell!1847)

(declare-fun mapKey!7547 () (_ BitVec 32))

(declare-fun mapRest!7547 () (Array (_ BitVec 32) ValueCell!1847))

(assert (=> mapNonEmpty!7547 (= (arr!3755 (_values!3804 thiss!1248)) (store mapRest!7547 mapKey!7547 mapValue!7547))))

(declare-fun res!88482 () Bool)

(assert (=> start!19002 (=> (not res!88482) (not e!123183))))

(declare-fun valid!1091 (LongMapFixedSize!2602) Bool)

(assert (=> start!19002 (= res!88482 (valid!1091 thiss!1248))))

(assert (=> start!19002 e!123183))

(declare-fun e!123184 () Bool)

(assert (=> start!19002 e!123184))

(assert (=> start!19002 true))

(declare-fun b!187173 () Bool)

(declare-fun lt!92490 () Unit!5615)

(assert (=> b!187173 (= e!123178 lt!92490)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!149 (array!7959 array!7961 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 64) Int) Unit!5615)

(assert (=> b!187173 (= lt!92490 (lemmaInListMapThenSeekEntryOrOpenFindsIt!149 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)))))

(declare-fun res!88481 () Bool)

(declare-datatypes ((SeekEntryResult!651 0))(
  ( (MissingZero!651 (index!4774 (_ BitVec 32))) (Found!651 (index!4775 (_ BitVec 32))) (Intermediate!651 (undefined!1463 Bool) (index!4776 (_ BitVec 32)) (x!20284 (_ BitVec 32))) (Undefined!651) (MissingVacant!651 (index!4777 (_ BitVec 32))) )
))
(declare-fun lt!92489 () SeekEntryResult!651)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!187173 (= res!88481 (inRange!0 (index!4775 lt!92489) (mask!8965 thiss!1248)))))

(declare-fun e!123181 () Bool)

(assert (=> b!187173 (=> (not res!88481) (not e!123181))))

(assert (=> b!187173 e!123181))

(declare-fun b!187174 () Bool)

(declare-fun e!123186 () Bool)

(assert (=> b!187174 (= e!123186 tp_is_empty!4381)))

(declare-fun b!187175 () Bool)

(assert (=> b!187175 (= e!123183 e!123177)))

(declare-fun res!88479 () Bool)

(assert (=> b!187175 (=> (not res!88479) (not e!123177))))

(get-info :version)

(assert (=> b!187175 (= res!88479 (and (not ((_ is Undefined!651) lt!92489)) (not ((_ is MissingVacant!651) lt!92489)) (not ((_ is MissingZero!651) lt!92489)) ((_ is Found!651) lt!92489)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7959 (_ BitVec 32)) SeekEntryResult!651)

(assert (=> b!187175 (= lt!92489 (seekEntryOrOpen!0 key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(declare-fun b!187176 () Bool)

(declare-fun e!123185 () Bool)

(assert (=> b!187176 (= e!123185 (and e!123186 mapRes!7547))))

(declare-fun condMapEmpty!7547 () Bool)

(declare-fun mapDefault!7547 () ValueCell!1847)

(assert (=> b!187176 (= condMapEmpty!7547 (= (arr!3755 (_values!3804 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1847)) mapDefault!7547)))))

(declare-fun b!187177 () Bool)

(assert (=> b!187177 (= e!123181 (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4775 lt!92489)) key!828))))

(declare-fun array_inv!2431 (array!7959) Bool)

(declare-fun array_inv!2432 (array!7961) Bool)

(assert (=> b!187178 (= e!123184 (and tp!16640 tp_is_empty!4381 (array_inv!2431 (_keys!5771 thiss!1248)) (array_inv!2432 (_values!3804 thiss!1248)) e!123185))))

(declare-fun b!187179 () Bool)

(assert (=> b!187179 (= e!123179 (and (= (size!4074 (_values!3804 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8965 thiss!1248))) (= (size!4073 (_keys!5771 thiss!1248)) (size!4074 (_values!3804 thiss!1248))) (bvsge (mask!8965 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3558 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and start!19002 res!88482) b!187170))

(assert (= (and b!187170 res!88480) b!187175))

(assert (= (and b!187175 res!88479) b!187171))

(assert (= (and b!187171 c!33601) b!187173))

(assert (= (and b!187171 (not c!33601)) b!187169))

(assert (= (and b!187173 res!88481) b!187177))

(assert (= (and b!187171 res!88483) b!187179))

(assert (= (and b!187176 condMapEmpty!7547) mapIsEmpty!7547))

(assert (= (and b!187176 (not condMapEmpty!7547)) mapNonEmpty!7547))

(assert (= (and mapNonEmpty!7547 ((_ is ValueCellFull!1847) mapValue!7547)) b!187172))

(assert (= (and b!187176 ((_ is ValueCellFull!1847) mapDefault!7547)) b!187174))

(assert (= b!187178 b!187176))

(assert (= start!19002 b!187178))

(declare-fun m!213529 () Bool)

(assert (=> mapNonEmpty!7547 m!213529))

(declare-fun m!213531 () Bool)

(assert (=> start!19002 m!213531))

(declare-fun m!213533 () Bool)

(assert (=> b!187169 m!213533))

(declare-fun m!213535 () Bool)

(assert (=> b!187177 m!213535))

(declare-fun m!213537 () Bool)

(assert (=> b!187175 m!213537))

(declare-fun m!213539 () Bool)

(assert (=> b!187171 m!213539))

(declare-fun m!213541 () Bool)

(assert (=> b!187171 m!213541))

(assert (=> b!187171 m!213541))

(declare-fun m!213543 () Bool)

(assert (=> b!187171 m!213543))

(declare-fun m!213545 () Bool)

(assert (=> b!187173 m!213545))

(declare-fun m!213547 () Bool)

(assert (=> b!187173 m!213547))

(declare-fun m!213549 () Bool)

(assert (=> b!187178 m!213549))

(declare-fun m!213551 () Bool)

(assert (=> b!187178 m!213551))

(check-sat (not b!187171) (not b!187169) (not b!187173) b_and!11201 (not b_next!4609) (not b!187175) (not start!19002) tp_is_empty!4381 (not mapNonEmpty!7547) (not b!187178))
(check-sat b_and!11201 (not b_next!4609))
(get-model)

(declare-fun b!187262 () Bool)

(declare-fun res!88525 () Bool)

(declare-fun e!123258 () Bool)

(assert (=> b!187262 (=> (not res!88525) (not e!123258))))

(declare-fun lt!92519 () SeekEntryResult!651)

(assert (=> b!187262 (= res!88525 (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4777 lt!92519)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187262 (and (bvsge (index!4777 lt!92519) #b00000000000000000000000000000000) (bvslt (index!4777 lt!92519) (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun b!187263 () Bool)

(declare-fun res!88522 () Bool)

(assert (=> b!187263 (=> (not res!88522) (not e!123258))))

(declare-fun call!18865 () Bool)

(assert (=> b!187263 (= res!88522 call!18865)))

(declare-fun e!123255 () Bool)

(assert (=> b!187263 (= e!123255 e!123258)))

(declare-fun c!33613 () Bool)

(declare-fun bm!18861 () Bool)

(assert (=> bm!18861 (= call!18865 (inRange!0 (ite c!33613 (index!4774 lt!92519) (index!4777 lt!92519)) (mask!8965 thiss!1248)))))

(declare-fun b!187264 () Bool)

(declare-fun call!18864 () Bool)

(assert (=> b!187264 (= e!123258 (not call!18864))))

(declare-fun d!55251 () Bool)

(declare-fun e!123256 () Bool)

(assert (=> d!55251 e!123256))

(assert (=> d!55251 (= c!33613 ((_ is MissingZero!651) lt!92519))))

(assert (=> d!55251 (= lt!92519 (seekEntryOrOpen!0 key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(declare-fun lt!92520 () Unit!5615)

(declare-fun choose!1003 (array!7959 array!7961 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 64) Int) Unit!5615)

(assert (=> d!55251 (= lt!92520 (choose!1003 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)))))

(assert (=> d!55251 (validMask!0 (mask!8965 thiss!1248))))

(assert (=> d!55251 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!147 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)) lt!92520)))

(declare-fun b!187265 () Bool)

(declare-fun e!123257 () Bool)

(assert (=> b!187265 (= e!123257 (not call!18864))))

(declare-fun b!187266 () Bool)

(assert (=> b!187266 (= e!123256 e!123255)))

(declare-fun c!33612 () Bool)

(assert (=> b!187266 (= c!33612 ((_ is MissingVacant!651) lt!92519))))

(declare-fun b!187267 () Bool)

(assert (=> b!187267 (= e!123256 e!123257)))

(declare-fun res!88524 () Bool)

(assert (=> b!187267 (= res!88524 call!18865)))

(assert (=> b!187267 (=> (not res!88524) (not e!123257))))

(declare-fun b!187268 () Bool)

(assert (=> b!187268 (and (bvsge (index!4774 lt!92519) #b00000000000000000000000000000000) (bvslt (index!4774 lt!92519) (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun res!88523 () Bool)

(assert (=> b!187268 (= res!88523 (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4774 lt!92519)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187268 (=> (not res!88523) (not e!123257))))

(declare-fun b!187269 () Bool)

(assert (=> b!187269 (= e!123255 ((_ is Undefined!651) lt!92519))))

(declare-fun bm!18862 () Bool)

(declare-fun arrayContainsKey!0 (array!7959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18862 (= call!18864 (arrayContainsKey!0 (_keys!5771 thiss!1248) key!828 #b00000000000000000000000000000000))))

(assert (= (and d!55251 c!33613) b!187267))

(assert (= (and d!55251 (not c!33613)) b!187266))

(assert (= (and b!187267 res!88524) b!187268))

(assert (= (and b!187268 res!88523) b!187265))

(assert (= (and b!187266 c!33612) b!187263))

(assert (= (and b!187266 (not c!33612)) b!187269))

(assert (= (and b!187263 res!88522) b!187262))

(assert (= (and b!187262 res!88525) b!187264))

(assert (= (or b!187267 b!187263) bm!18861))

(assert (= (or b!187265 b!187264) bm!18862))

(assert (=> d!55251 m!213537))

(declare-fun m!213601 () Bool)

(assert (=> d!55251 m!213601))

(assert (=> d!55251 m!213539))

(declare-fun m!213603 () Bool)

(assert (=> b!187262 m!213603))

(declare-fun m!213605 () Bool)

(assert (=> bm!18862 m!213605))

(declare-fun m!213607 () Bool)

(assert (=> bm!18861 m!213607))

(declare-fun m!213609 () Bool)

(assert (=> b!187268 m!213609))

(assert (=> b!187169 d!55251))

(declare-fun d!55253 () Bool)

(declare-fun res!88532 () Bool)

(declare-fun e!123261 () Bool)

(assert (=> d!55253 (=> (not res!88532) (not e!123261))))

(declare-fun simpleValid!187 (LongMapFixedSize!2602) Bool)

(assert (=> d!55253 (= res!88532 (simpleValid!187 thiss!1248))))

(assert (=> d!55253 (= (valid!1091 thiss!1248) e!123261)))

(declare-fun b!187276 () Bool)

(declare-fun res!88533 () Bool)

(assert (=> b!187276 (=> (not res!88533) (not e!123261))))

(declare-fun arrayCountValidKeys!0 (array!7959 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187276 (= res!88533 (= (arrayCountValidKeys!0 (_keys!5771 thiss!1248) #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))) (_size!1350 thiss!1248)))))

(declare-fun b!187277 () Bool)

(declare-fun res!88534 () Bool)

(assert (=> b!187277 (=> (not res!88534) (not e!123261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7959 (_ BitVec 32)) Bool)

(assert (=> b!187277 (= res!88534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(declare-fun b!187278 () Bool)

(declare-datatypes ((List!2372 0))(
  ( (Nil!2369) (Cons!2368 (h!3003 (_ BitVec 64)) (t!7257 List!2372)) )
))
(declare-fun arrayNoDuplicates!0 (array!7959 (_ BitVec 32) List!2372) Bool)

(assert (=> b!187278 (= e!123261 (arrayNoDuplicates!0 (_keys!5771 thiss!1248) #b00000000000000000000000000000000 Nil!2369))))

(assert (= (and d!55253 res!88532) b!187276))

(assert (= (and b!187276 res!88533) b!187277))

(assert (= (and b!187277 res!88534) b!187278))

(declare-fun m!213611 () Bool)

(assert (=> d!55253 m!213611))

(declare-fun m!213613 () Bool)

(assert (=> b!187276 m!213613))

(declare-fun m!213615 () Bool)

(assert (=> b!187277 m!213615))

(declare-fun m!213617 () Bool)

(assert (=> b!187278 m!213617))

(assert (=> start!19002 d!55253))

(declare-fun d!55255 () Bool)

(declare-fun e!123264 () Bool)

(assert (=> d!55255 e!123264))

(declare-fun res!88540 () Bool)

(assert (=> d!55255 (=> (not res!88540) (not e!123264))))

(declare-fun lt!92526 () SeekEntryResult!651)

(assert (=> d!55255 (= res!88540 ((_ is Found!651) lt!92526))))

(assert (=> d!55255 (= lt!92526 (seekEntryOrOpen!0 key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(declare-fun lt!92525 () Unit!5615)

(declare-fun choose!1004 (array!7959 array!7961 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 64) Int) Unit!5615)

(assert (=> d!55255 (= lt!92525 (choose!1004 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)))))

(assert (=> d!55255 (validMask!0 (mask!8965 thiss!1248))))

(assert (=> d!55255 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!149 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)) lt!92525)))

(declare-fun b!187283 () Bool)

(declare-fun res!88539 () Bool)

(assert (=> b!187283 (=> (not res!88539) (not e!123264))))

(assert (=> b!187283 (= res!88539 (inRange!0 (index!4775 lt!92526) (mask!8965 thiss!1248)))))

(declare-fun b!187284 () Bool)

(assert (=> b!187284 (= e!123264 (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4775 lt!92526)) key!828))))

(assert (=> b!187284 (and (bvsge (index!4775 lt!92526) #b00000000000000000000000000000000) (bvslt (index!4775 lt!92526) (size!4073 (_keys!5771 thiss!1248))))))

(assert (= (and d!55255 res!88540) b!187283))

(assert (= (and b!187283 res!88539) b!187284))

(assert (=> d!55255 m!213537))

(declare-fun m!213619 () Bool)

(assert (=> d!55255 m!213619))

(assert (=> d!55255 m!213539))

(declare-fun m!213621 () Bool)

(assert (=> b!187283 m!213621))

(declare-fun m!213623 () Bool)

(assert (=> b!187284 m!213623))

(assert (=> b!187173 d!55255))

(declare-fun d!55257 () Bool)

(assert (=> d!55257 (= (inRange!0 (index!4775 lt!92489) (mask!8965 thiss!1248)) (and (bvsge (index!4775 lt!92489) #b00000000000000000000000000000000) (bvslt (index!4775 lt!92489) (bvadd (mask!8965 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187173 d!55257))

(declare-fun d!55259 () Bool)

(assert (=> d!55259 (= (array_inv!2431 (_keys!5771 thiss!1248)) (bvsge (size!4073 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187178 d!55259))

(declare-fun d!55261 () Bool)

(assert (=> d!55261 (= (array_inv!2432 (_values!3804 thiss!1248)) (bvsge (size!4074 (_values!3804 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187178 d!55261))

(declare-fun b!187297 () Bool)

(declare-fun e!123273 () SeekEntryResult!651)

(assert (=> b!187297 (= e!123273 Undefined!651)))

(declare-fun b!187298 () Bool)

(declare-fun c!33622 () Bool)

(declare-fun lt!92534 () (_ BitVec 64))

(assert (=> b!187298 (= c!33622 (= lt!92534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123271 () SeekEntryResult!651)

(declare-fun e!123272 () SeekEntryResult!651)

(assert (=> b!187298 (= e!123271 e!123272)))

(declare-fun d!55263 () Bool)

(declare-fun lt!92535 () SeekEntryResult!651)

(assert (=> d!55263 (and (or ((_ is Undefined!651) lt!92535) (not ((_ is Found!651) lt!92535)) (and (bvsge (index!4775 lt!92535) #b00000000000000000000000000000000) (bvslt (index!4775 lt!92535) (size!4073 (_keys!5771 thiss!1248))))) (or ((_ is Undefined!651) lt!92535) ((_ is Found!651) lt!92535) (not ((_ is MissingZero!651) lt!92535)) (and (bvsge (index!4774 lt!92535) #b00000000000000000000000000000000) (bvslt (index!4774 lt!92535) (size!4073 (_keys!5771 thiss!1248))))) (or ((_ is Undefined!651) lt!92535) ((_ is Found!651) lt!92535) ((_ is MissingZero!651) lt!92535) (not ((_ is MissingVacant!651) lt!92535)) (and (bvsge (index!4777 lt!92535) #b00000000000000000000000000000000) (bvslt (index!4777 lt!92535) (size!4073 (_keys!5771 thiss!1248))))) (or ((_ is Undefined!651) lt!92535) (ite ((_ is Found!651) lt!92535) (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4775 lt!92535)) key!828) (ite ((_ is MissingZero!651) lt!92535) (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4774 lt!92535)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!651) lt!92535) (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4777 lt!92535)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55263 (= lt!92535 e!123273)))

(declare-fun c!33620 () Bool)

(declare-fun lt!92533 () SeekEntryResult!651)

(assert (=> d!55263 (= c!33620 (and ((_ is Intermediate!651) lt!92533) (undefined!1463 lt!92533)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7959 (_ BitVec 32)) SeekEntryResult!651)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55263 (= lt!92533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8965 thiss!1248)) key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(assert (=> d!55263 (validMask!0 (mask!8965 thiss!1248))))

(assert (=> d!55263 (= (seekEntryOrOpen!0 key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)) lt!92535)))

(declare-fun b!187299 () Bool)

(assert (=> b!187299 (= e!123271 (Found!651 (index!4776 lt!92533)))))

(declare-fun b!187300 () Bool)

(assert (=> b!187300 (= e!123273 e!123271)))

(assert (=> b!187300 (= lt!92534 (select (arr!3754 (_keys!5771 thiss!1248)) (index!4776 lt!92533)))))

(declare-fun c!33621 () Bool)

(assert (=> b!187300 (= c!33621 (= lt!92534 key!828))))

(declare-fun b!187301 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7959 (_ BitVec 32)) SeekEntryResult!651)

(assert (=> b!187301 (= e!123272 (seekKeyOrZeroReturnVacant!0 (x!20284 lt!92533) (index!4776 lt!92533) (index!4776 lt!92533) key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(declare-fun b!187302 () Bool)

(assert (=> b!187302 (= e!123272 (MissingZero!651 (index!4776 lt!92533)))))

(assert (= (and d!55263 c!33620) b!187297))

(assert (= (and d!55263 (not c!33620)) b!187300))

(assert (= (and b!187300 c!33621) b!187299))

(assert (= (and b!187300 (not c!33621)) b!187298))

(assert (= (and b!187298 c!33622) b!187302))

(assert (= (and b!187298 (not c!33622)) b!187301))

(assert (=> d!55263 m!213539))

(declare-fun m!213625 () Bool)

(assert (=> d!55263 m!213625))

(declare-fun m!213627 () Bool)

(assert (=> d!55263 m!213627))

(declare-fun m!213629 () Bool)

(assert (=> d!55263 m!213629))

(declare-fun m!213631 () Bool)

(assert (=> d!55263 m!213631))

(assert (=> d!55263 m!213629))

(declare-fun m!213633 () Bool)

(assert (=> d!55263 m!213633))

(declare-fun m!213635 () Bool)

(assert (=> b!187300 m!213635))

(declare-fun m!213637 () Bool)

(assert (=> b!187301 m!213637))

(assert (=> b!187175 d!55263))

(declare-fun d!55265 () Bool)

(assert (=> d!55265 (= (validMask!0 (mask!8965 thiss!1248)) (and (or (= (mask!8965 thiss!1248) #b00000000000000000000000000000111) (= (mask!8965 thiss!1248) #b00000000000000000000000000001111) (= (mask!8965 thiss!1248) #b00000000000000000000000000011111) (= (mask!8965 thiss!1248) #b00000000000000000000000000111111) (= (mask!8965 thiss!1248) #b00000000000000000000000001111111) (= (mask!8965 thiss!1248) #b00000000000000000000000011111111) (= (mask!8965 thiss!1248) #b00000000000000000000000111111111) (= (mask!8965 thiss!1248) #b00000000000000000000001111111111) (= (mask!8965 thiss!1248) #b00000000000000000000011111111111) (= (mask!8965 thiss!1248) #b00000000000000000000111111111111) (= (mask!8965 thiss!1248) #b00000000000000000001111111111111) (= (mask!8965 thiss!1248) #b00000000000000000011111111111111) (= (mask!8965 thiss!1248) #b00000000000000000111111111111111) (= (mask!8965 thiss!1248) #b00000000000000001111111111111111) (= (mask!8965 thiss!1248) #b00000000000000011111111111111111) (= (mask!8965 thiss!1248) #b00000000000000111111111111111111) (= (mask!8965 thiss!1248) #b00000000000001111111111111111111) (= (mask!8965 thiss!1248) #b00000000000011111111111111111111) (= (mask!8965 thiss!1248) #b00000000000111111111111111111111) (= (mask!8965 thiss!1248) #b00000000001111111111111111111111) (= (mask!8965 thiss!1248) #b00000000011111111111111111111111) (= (mask!8965 thiss!1248) #b00000000111111111111111111111111) (= (mask!8965 thiss!1248) #b00000001111111111111111111111111) (= (mask!8965 thiss!1248) #b00000011111111111111111111111111) (= (mask!8965 thiss!1248) #b00000111111111111111111111111111) (= (mask!8965 thiss!1248) #b00001111111111111111111111111111) (= (mask!8965 thiss!1248) #b00011111111111111111111111111111) (= (mask!8965 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8965 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!187171 d!55265))

(declare-fun d!55267 () Bool)

(declare-fun e!123279 () Bool)

(assert (=> d!55267 e!123279))

(declare-fun res!88543 () Bool)

(assert (=> d!55267 (=> res!88543 e!123279)))

(declare-fun lt!92545 () Bool)

(assert (=> d!55267 (= res!88543 (not lt!92545))))

(declare-fun lt!92544 () Bool)

(assert (=> d!55267 (= lt!92545 lt!92544)))

(declare-fun lt!92547 () Unit!5615)

(declare-fun e!123278 () Unit!5615)

(assert (=> d!55267 (= lt!92547 e!123278)))

(declare-fun c!33625 () Bool)

(assert (=> d!55267 (= c!33625 lt!92544)))

(declare-fun containsKey!230 (List!2370 (_ BitVec 64)) Bool)

(assert (=> d!55267 (= lt!92544 (containsKey!230 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(assert (=> d!55267 (= (contains!1297 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)) key!828) lt!92545)))

(declare-fun b!187309 () Bool)

(declare-fun lt!92546 () Unit!5615)

(assert (=> b!187309 (= e!123278 lt!92546)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!179 (List!2370 (_ BitVec 64)) Unit!5615)

(assert (=> b!187309 (= lt!92546 (lemmaContainsKeyImpliesGetValueByKeyDefined!179 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(declare-datatypes ((Option!232 0))(
  ( (Some!231 (v!4147 V!5489)) (None!230) )
))
(declare-fun isDefined!180 (Option!232) Bool)

(declare-fun getValueByKey!226 (List!2370 (_ BitVec 64)) Option!232)

(assert (=> b!187309 (isDefined!180 (getValueByKey!226 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(declare-fun b!187310 () Bool)

(declare-fun Unit!5621 () Unit!5615)

(assert (=> b!187310 (= e!123278 Unit!5621)))

(declare-fun b!187311 () Bool)

(assert (=> b!187311 (= e!123279 (isDefined!180 (getValueByKey!226 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828)))))

(assert (= (and d!55267 c!33625) b!187309))

(assert (= (and d!55267 (not c!33625)) b!187310))

(assert (= (and d!55267 (not res!88543)) b!187311))

(declare-fun m!213639 () Bool)

(assert (=> d!55267 m!213639))

(declare-fun m!213641 () Bool)

(assert (=> b!187309 m!213641))

(declare-fun m!213643 () Bool)

(assert (=> b!187309 m!213643))

(assert (=> b!187309 m!213643))

(declare-fun m!213645 () Bool)

(assert (=> b!187309 m!213645))

(assert (=> b!187311 m!213643))

(assert (=> b!187311 m!213643))

(assert (=> b!187311 m!213645))

(assert (=> b!187171 d!55267))

(declare-fun d!55269 () Bool)

(declare-fun e!123307 () Bool)

(assert (=> d!55269 e!123307))

(declare-fun res!88569 () Bool)

(assert (=> d!55269 (=> (not res!88569) (not e!123307))))

(assert (=> d!55269 (= res!88569 (or (bvsge #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))))

(declare-fun lt!92605 () ListLongMap!2351)

(declare-fun lt!92593 () ListLongMap!2351)

(assert (=> d!55269 (= lt!92605 lt!92593)))

(declare-fun lt!92596 () Unit!5615)

(declare-fun e!123308 () Unit!5615)

(assert (=> d!55269 (= lt!92596 e!123308)))

(declare-fun c!33640 () Bool)

(declare-fun e!123309 () Bool)

(assert (=> d!55269 (= c!33640 e!123309)))

(declare-fun res!88566 () Bool)

(assert (=> d!55269 (=> (not res!88566) (not e!123309))))

(assert (=> d!55269 (= res!88566 (bvslt #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun e!123313 () ListLongMap!2351)

(assert (=> d!55269 (= lt!92593 e!123313)))

(declare-fun c!33643 () Bool)

(assert (=> d!55269 (= c!33643 (and (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55269 (validMask!0 (mask!8965 thiss!1248))))

(assert (=> d!55269 (= (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)) lt!92605)))

(declare-fun b!187354 () Bool)

(declare-fun call!18882 () ListLongMap!2351)

(declare-fun +!288 (ListLongMap!2351 tuple2!3442) ListLongMap!2351)

(assert (=> b!187354 (= e!123313 (+!288 call!18882 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))

(declare-fun call!18885 () ListLongMap!2351)

(declare-fun bm!18877 () Bool)

(declare-fun c!33642 () Bool)

(declare-fun call!18880 () ListLongMap!2351)

(declare-fun call!18886 () ListLongMap!2351)

(assert (=> bm!18877 (= call!18882 (+!288 (ite c!33643 call!18880 (ite c!33642 call!18886 call!18885)) (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(declare-fun b!187355 () Bool)

(declare-fun e!123317 () Bool)

(declare-fun e!123310 () Bool)

(assert (=> b!187355 (= e!123317 e!123310)))

(declare-fun res!88563 () Bool)

(declare-fun call!18881 () Bool)

(assert (=> b!187355 (= res!88563 call!18881)))

(assert (=> b!187355 (=> (not res!88563) (not e!123310))))

(declare-fun b!187356 () Bool)

(declare-fun e!123311 () Bool)

(declare-fun call!18884 () Bool)

(assert (=> b!187356 (= e!123311 (not call!18884))))

(declare-fun bm!18878 () Bool)

(assert (=> bm!18878 (= call!18886 call!18880)))

(declare-fun bm!18879 () Bool)

(assert (=> bm!18879 (= call!18884 (contains!1297 lt!92605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187357 () Bool)

(assert (=> b!187357 (= e!123317 (not call!18881))))

(declare-fun b!187358 () Bool)

(declare-fun e!123306 () Bool)

(declare-fun apply!171 (ListLongMap!2351 (_ BitVec 64)) V!5489)

(assert (=> b!187358 (= e!123306 (= (apply!171 lt!92605 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3662 thiss!1248)))))

(declare-fun b!187359 () Bool)

(declare-fun e!123312 () ListLongMap!2351)

(assert (=> b!187359 (= e!123313 e!123312)))

(assert (=> b!187359 (= c!33642 (and (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!187360 () Bool)

(declare-fun Unit!5622 () Unit!5615)

(assert (=> b!187360 (= e!123308 Unit!5622)))

(declare-fun b!187361 () Bool)

(declare-fun lt!92610 () Unit!5615)

(assert (=> b!187361 (= e!123308 lt!92610)))

(declare-fun lt!92609 () ListLongMap!2351)

(declare-fun getCurrentListMapNoExtraKeys!192 (array!7959 array!7961 (_ BitVec 32) (_ BitVec 32) V!5489 V!5489 (_ BitVec 32) Int) ListLongMap!2351)

(assert (=> b!187361 (= lt!92609 (getCurrentListMapNoExtraKeys!192 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))

(declare-fun lt!92611 () (_ BitVec 64))

(assert (=> b!187361 (= lt!92611 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92606 () (_ BitVec 64))

(assert (=> b!187361 (= lt!92606 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92612 () Unit!5615)

(declare-fun addStillContains!147 (ListLongMap!2351 (_ BitVec 64) V!5489 (_ BitVec 64)) Unit!5615)

(assert (=> b!187361 (= lt!92612 (addStillContains!147 lt!92609 lt!92611 (zeroValue!3662 thiss!1248) lt!92606))))

(assert (=> b!187361 (contains!1297 (+!288 lt!92609 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248))) lt!92606)))

(declare-fun lt!92597 () Unit!5615)

(assert (=> b!187361 (= lt!92597 lt!92612)))

(declare-fun lt!92613 () ListLongMap!2351)

(assert (=> b!187361 (= lt!92613 (getCurrentListMapNoExtraKeys!192 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))

(declare-fun lt!92608 () (_ BitVec 64))

(assert (=> b!187361 (= lt!92608 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92594 () (_ BitVec 64))

(assert (=> b!187361 (= lt!92594 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92592 () Unit!5615)

(declare-fun addApplyDifferent!147 (ListLongMap!2351 (_ BitVec 64) V!5489 (_ BitVec 64)) Unit!5615)

(assert (=> b!187361 (= lt!92592 (addApplyDifferent!147 lt!92613 lt!92608 (minValue!3662 thiss!1248) lt!92594))))

(assert (=> b!187361 (= (apply!171 (+!288 lt!92613 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248))) lt!92594) (apply!171 lt!92613 lt!92594))))

(declare-fun lt!92604 () Unit!5615)

(assert (=> b!187361 (= lt!92604 lt!92592)))

(declare-fun lt!92598 () ListLongMap!2351)

(assert (=> b!187361 (= lt!92598 (getCurrentListMapNoExtraKeys!192 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))

(declare-fun lt!92602 () (_ BitVec 64))

(assert (=> b!187361 (= lt!92602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92595 () (_ BitVec 64))

(assert (=> b!187361 (= lt!92595 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92607 () Unit!5615)

(assert (=> b!187361 (= lt!92607 (addApplyDifferent!147 lt!92598 lt!92602 (zeroValue!3662 thiss!1248) lt!92595))))

(assert (=> b!187361 (= (apply!171 (+!288 lt!92598 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248))) lt!92595) (apply!171 lt!92598 lt!92595))))

(declare-fun lt!92600 () Unit!5615)

(assert (=> b!187361 (= lt!92600 lt!92607)))

(declare-fun lt!92601 () ListLongMap!2351)

(assert (=> b!187361 (= lt!92601 (getCurrentListMapNoExtraKeys!192 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))

(declare-fun lt!92603 () (_ BitVec 64))

(assert (=> b!187361 (= lt!92603 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92599 () (_ BitVec 64))

(assert (=> b!187361 (= lt!92599 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187361 (= lt!92610 (addApplyDifferent!147 lt!92601 lt!92603 (minValue!3662 thiss!1248) lt!92599))))

(assert (=> b!187361 (= (apply!171 (+!288 lt!92601 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248))) lt!92599) (apply!171 lt!92601 lt!92599))))

(declare-fun b!187362 () Bool)

(declare-fun c!33641 () Bool)

(assert (=> b!187362 (= c!33641 (and (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!123318 () ListLongMap!2351)

(assert (=> b!187362 (= e!123312 e!123318)))

(declare-fun b!187363 () Bool)

(declare-fun e!123316 () Bool)

(declare-fun get!2160 (ValueCell!1847 V!5489) V!5489)

(declare-fun dynLambda!505 (Int (_ BitVec 64)) V!5489)

(assert (=> b!187363 (= e!123316 (= (apply!171 lt!92605 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)) (get!2160 (select (arr!3755 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187363 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4074 (_values!3804 thiss!1248))))))

(assert (=> b!187363 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun b!187364 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!187364 (= e!123309 (validKeyInArray!0 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187365 () Bool)

(declare-fun res!88568 () Bool)

(assert (=> b!187365 (=> (not res!88568) (not e!123307))))

(assert (=> b!187365 (= res!88568 e!123311)))

(declare-fun c!33638 () Bool)

(assert (=> b!187365 (= c!33638 (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!187366 () Bool)

(assert (=> b!187366 (= e!123310 (= (apply!171 lt!92605 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3662 thiss!1248)))))

(declare-fun bm!18880 () Bool)

(assert (=> bm!18880 (= call!18880 (getCurrentListMapNoExtraKeys!192 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))

(declare-fun bm!18881 () Bool)

(declare-fun call!18883 () ListLongMap!2351)

(assert (=> bm!18881 (= call!18883 call!18882)))

(declare-fun b!187367 () Bool)

(assert (=> b!187367 (= e!123318 call!18883)))

(declare-fun b!187368 () Bool)

(declare-fun res!88562 () Bool)

(assert (=> b!187368 (=> (not res!88562) (not e!123307))))

(declare-fun e!123314 () Bool)

(assert (=> b!187368 (= res!88562 e!123314)))

(declare-fun res!88567 () Bool)

(assert (=> b!187368 (=> res!88567 e!123314)))

(declare-fun e!123315 () Bool)

(assert (=> b!187368 (= res!88567 (not e!123315))))

(declare-fun res!88570 () Bool)

(assert (=> b!187368 (=> (not res!88570) (not e!123315))))

(assert (=> b!187368 (= res!88570 (bvslt #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun b!187369 () Bool)

(assert (=> b!187369 (= e!123315 (validKeyInArray!0 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187370 () Bool)

(assert (=> b!187370 (= e!123311 e!123306)))

(declare-fun res!88565 () Bool)

(assert (=> b!187370 (= res!88565 call!18884)))

(assert (=> b!187370 (=> (not res!88565) (not e!123306))))

(declare-fun bm!18882 () Bool)

(assert (=> bm!18882 (= call!18881 (contains!1297 lt!92605 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18883 () Bool)

(assert (=> bm!18883 (= call!18885 call!18886)))

(declare-fun b!187371 () Bool)

(assert (=> b!187371 (= e!123318 call!18885)))

(declare-fun b!187372 () Bool)

(assert (=> b!187372 (= e!123307 e!123317)))

(declare-fun c!33639 () Bool)

(assert (=> b!187372 (= c!33639 (not (= (bvand (extraKeys!3558 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!187373 () Bool)

(assert (=> b!187373 (= e!123312 call!18883)))

(declare-fun b!187374 () Bool)

(assert (=> b!187374 (= e!123314 e!123316)))

(declare-fun res!88564 () Bool)

(assert (=> b!187374 (=> (not res!88564) (not e!123316))))

(assert (=> b!187374 (= res!88564 (contains!1297 lt!92605 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187374 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(assert (= (and d!55269 c!33643) b!187354))

(assert (= (and d!55269 (not c!33643)) b!187359))

(assert (= (and b!187359 c!33642) b!187373))

(assert (= (and b!187359 (not c!33642)) b!187362))

(assert (= (and b!187362 c!33641) b!187367))

(assert (= (and b!187362 (not c!33641)) b!187371))

(assert (= (or b!187367 b!187371) bm!18883))

(assert (= (or b!187373 bm!18883) bm!18878))

(assert (= (or b!187373 b!187367) bm!18881))

(assert (= (or b!187354 bm!18878) bm!18880))

(assert (= (or b!187354 bm!18881) bm!18877))

(assert (= (and d!55269 res!88566) b!187364))

(assert (= (and d!55269 c!33640) b!187361))

(assert (= (and d!55269 (not c!33640)) b!187360))

(assert (= (and d!55269 res!88569) b!187368))

(assert (= (and b!187368 res!88570) b!187369))

(assert (= (and b!187368 (not res!88567)) b!187374))

(assert (= (and b!187374 res!88564) b!187363))

(assert (= (and b!187368 res!88562) b!187365))

(assert (= (and b!187365 c!33638) b!187370))

(assert (= (and b!187365 (not c!33638)) b!187356))

(assert (= (and b!187370 res!88565) b!187358))

(assert (= (or b!187370 b!187356) bm!18879))

(assert (= (and b!187365 res!88568) b!187372))

(assert (= (and b!187372 c!33639) b!187355))

(assert (= (and b!187372 (not c!33639)) b!187357))

(assert (= (and b!187355 res!88563) b!187366))

(assert (= (or b!187355 b!187357) bm!18882))

(declare-fun b_lambda!7269 () Bool)

(assert (=> (not b_lambda!7269) (not b!187363)))

(declare-fun t!7256 () Bool)

(declare-fun tb!2845 () Bool)

(assert (=> (and b!187178 (= (defaultEntry!3821 thiss!1248) (defaultEntry!3821 thiss!1248)) t!7256) tb!2845))

(declare-fun result!4829 () Bool)

(assert (=> tb!2845 (= result!4829 tp_is_empty!4381)))

(assert (=> b!187363 t!7256))

(declare-fun b_and!11207 () Bool)

(assert (= b_and!11201 (and (=> t!7256 result!4829) b_and!11207)))

(declare-fun m!213647 () Bool)

(assert (=> b!187374 m!213647))

(assert (=> b!187374 m!213647))

(declare-fun m!213649 () Bool)

(assert (=> b!187374 m!213649))

(assert (=> b!187364 m!213647))

(assert (=> b!187364 m!213647))

(declare-fun m!213651 () Bool)

(assert (=> b!187364 m!213651))

(declare-fun m!213653 () Bool)

(assert (=> b!187366 m!213653))

(declare-fun m!213655 () Bool)

(assert (=> bm!18877 m!213655))

(declare-fun m!213657 () Bool)

(assert (=> bm!18879 m!213657))

(declare-fun m!213659 () Bool)

(assert (=> bm!18880 m!213659))

(declare-fun m!213661 () Bool)

(assert (=> bm!18882 m!213661))

(declare-fun m!213663 () Bool)

(assert (=> b!187354 m!213663))

(assert (=> d!55269 m!213539))

(declare-fun m!213665 () Bool)

(assert (=> b!187363 m!213665))

(declare-fun m!213667 () Bool)

(assert (=> b!187363 m!213667))

(declare-fun m!213669 () Bool)

(assert (=> b!187363 m!213669))

(assert (=> b!187363 m!213647))

(assert (=> b!187363 m!213667))

(assert (=> b!187363 m!213665))

(assert (=> b!187363 m!213647))

(declare-fun m!213671 () Bool)

(assert (=> b!187363 m!213671))

(assert (=> b!187369 m!213647))

(assert (=> b!187369 m!213647))

(assert (=> b!187369 m!213651))

(declare-fun m!213673 () Bool)

(assert (=> b!187358 m!213673))

(declare-fun m!213675 () Bool)

(assert (=> b!187361 m!213675))

(declare-fun m!213677 () Bool)

(assert (=> b!187361 m!213677))

(assert (=> b!187361 m!213647))

(declare-fun m!213679 () Bool)

(assert (=> b!187361 m!213679))

(assert (=> b!187361 m!213675))

(declare-fun m!213681 () Bool)

(assert (=> b!187361 m!213681))

(declare-fun m!213683 () Bool)

(assert (=> b!187361 m!213683))

(declare-fun m!213685 () Bool)

(assert (=> b!187361 m!213685))

(assert (=> b!187361 m!213659))

(declare-fun m!213687 () Bool)

(assert (=> b!187361 m!213687))

(declare-fun m!213689 () Bool)

(assert (=> b!187361 m!213689))

(declare-fun m!213691 () Bool)

(assert (=> b!187361 m!213691))

(assert (=> b!187361 m!213683))

(declare-fun m!213693 () Bool)

(assert (=> b!187361 m!213693))

(declare-fun m!213695 () Bool)

(assert (=> b!187361 m!213695))

(declare-fun m!213697 () Bool)

(assert (=> b!187361 m!213697))

(declare-fun m!213699 () Bool)

(assert (=> b!187361 m!213699))

(declare-fun m!213701 () Bool)

(assert (=> b!187361 m!213701))

(assert (=> b!187361 m!213697))

(declare-fun m!213703 () Bool)

(assert (=> b!187361 m!213703))

(assert (=> b!187361 m!213687))

(assert (=> b!187171 d!55269))

(declare-fun b!187383 () Bool)

(declare-fun e!123324 () Bool)

(assert (=> b!187383 (= e!123324 tp_is_empty!4381)))

(declare-fun mapNonEmpty!7556 () Bool)

(declare-fun mapRes!7556 () Bool)

(declare-fun tp!16655 () Bool)

(assert (=> mapNonEmpty!7556 (= mapRes!7556 (and tp!16655 e!123324))))

(declare-fun mapValue!7556 () ValueCell!1847)

(declare-fun mapKey!7556 () (_ BitVec 32))

(declare-fun mapRest!7556 () (Array (_ BitVec 32) ValueCell!1847))

(assert (=> mapNonEmpty!7556 (= mapRest!7547 (store mapRest!7556 mapKey!7556 mapValue!7556))))

(declare-fun b!187384 () Bool)

(declare-fun e!123323 () Bool)

(assert (=> b!187384 (= e!123323 tp_is_empty!4381)))

(declare-fun mapIsEmpty!7556 () Bool)

(assert (=> mapIsEmpty!7556 mapRes!7556))

(declare-fun condMapEmpty!7556 () Bool)

(declare-fun mapDefault!7556 () ValueCell!1847)

(assert (=> mapNonEmpty!7547 (= condMapEmpty!7556 (= mapRest!7547 ((as const (Array (_ BitVec 32) ValueCell!1847)) mapDefault!7556)))))

(assert (=> mapNonEmpty!7547 (= tp!16639 (and e!123323 mapRes!7556))))

(assert (= (and mapNonEmpty!7547 condMapEmpty!7556) mapIsEmpty!7556))

(assert (= (and mapNonEmpty!7547 (not condMapEmpty!7556)) mapNonEmpty!7556))

(assert (= (and mapNonEmpty!7556 ((_ is ValueCellFull!1847) mapValue!7556)) b!187383))

(assert (= (and mapNonEmpty!7547 ((_ is ValueCellFull!1847) mapDefault!7556)) b!187384))

(declare-fun m!213705 () Bool)

(assert (=> mapNonEmpty!7556 m!213705))

(declare-fun b_lambda!7271 () Bool)

(assert (= b_lambda!7269 (or (and b!187178 b_free!4609) b_lambda!7271)))

(check-sat (not bm!18877) (not bm!18880) b_and!11207 (not d!55269) (not bm!18861) (not b!187369) (not b!187363) (not d!55263) (not d!55253) (not bm!18882) (not d!55267) (not d!55251) (not b!187374) (not b!187364) (not b!187366) (not b!187278) (not b!187361) (not b!187276) (not b!187309) (not b!187354) (not bm!18879) (not b!187277) (not d!55255) (not b!187301) (not b_next!4609) (not b!187283) (not b!187311) tp_is_empty!4381 (not bm!18862) (not mapNonEmpty!7556) (not b!187358) (not b_lambda!7271))
(check-sat b_and!11207 (not b_next!4609))
(get-model)

(declare-fun d!55271 () Bool)

(declare-fun res!88575 () Bool)

(declare-fun e!123329 () Bool)

(assert (=> d!55271 (=> res!88575 e!123329)))

(assert (=> d!55271 (= res!88575 (= (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000) key!828))))

(assert (=> d!55271 (= (arrayContainsKey!0 (_keys!5771 thiss!1248) key!828 #b00000000000000000000000000000000) e!123329)))

(declare-fun b!187389 () Bool)

(declare-fun e!123330 () Bool)

(assert (=> b!187389 (= e!123329 e!123330)))

(declare-fun res!88576 () Bool)

(assert (=> b!187389 (=> (not res!88576) (not e!123330))))

(assert (=> b!187389 (= res!88576 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun b!187390 () Bool)

(assert (=> b!187390 (= e!123330 (arrayContainsKey!0 (_keys!5771 thiss!1248) key!828 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!55271 (not res!88575)) b!187389))

(assert (= (and b!187389 res!88576) b!187390))

(assert (=> d!55271 m!213647))

(declare-fun m!213707 () Bool)

(assert (=> b!187390 m!213707))

(assert (=> bm!18862 d!55271))

(declare-fun d!55273 () Bool)

(declare-fun e!123332 () Bool)

(assert (=> d!55273 e!123332))

(declare-fun res!88577 () Bool)

(assert (=> d!55273 (=> res!88577 e!123332)))

(declare-fun lt!92615 () Bool)

(assert (=> d!55273 (= res!88577 (not lt!92615))))

(declare-fun lt!92614 () Bool)

(assert (=> d!55273 (= lt!92615 lt!92614)))

(declare-fun lt!92617 () Unit!5615)

(declare-fun e!123331 () Unit!5615)

(assert (=> d!55273 (= lt!92617 e!123331)))

(declare-fun c!33644 () Bool)

(assert (=> d!55273 (= c!33644 lt!92614)))

(assert (=> d!55273 (= lt!92614 (containsKey!230 (toList!1191 (+!288 lt!92609 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248)))) lt!92606))))

(assert (=> d!55273 (= (contains!1297 (+!288 lt!92609 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248))) lt!92606) lt!92615)))

(declare-fun b!187391 () Bool)

(declare-fun lt!92616 () Unit!5615)

(assert (=> b!187391 (= e!123331 lt!92616)))

(assert (=> b!187391 (= lt!92616 (lemmaContainsKeyImpliesGetValueByKeyDefined!179 (toList!1191 (+!288 lt!92609 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248)))) lt!92606))))

(assert (=> b!187391 (isDefined!180 (getValueByKey!226 (toList!1191 (+!288 lt!92609 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248)))) lt!92606))))

(declare-fun b!187392 () Bool)

(declare-fun Unit!5623 () Unit!5615)

(assert (=> b!187392 (= e!123331 Unit!5623)))

(declare-fun b!187393 () Bool)

(assert (=> b!187393 (= e!123332 (isDefined!180 (getValueByKey!226 (toList!1191 (+!288 lt!92609 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248)))) lt!92606)))))

(assert (= (and d!55273 c!33644) b!187391))

(assert (= (and d!55273 (not c!33644)) b!187392))

(assert (= (and d!55273 (not res!88577)) b!187393))

(declare-fun m!213709 () Bool)

(assert (=> d!55273 m!213709))

(declare-fun m!213711 () Bool)

(assert (=> b!187391 m!213711))

(declare-fun m!213713 () Bool)

(assert (=> b!187391 m!213713))

(assert (=> b!187391 m!213713))

(declare-fun m!213715 () Bool)

(assert (=> b!187391 m!213715))

(assert (=> b!187393 m!213713))

(assert (=> b!187393 m!213713))

(assert (=> b!187393 m!213715))

(assert (=> b!187361 d!55273))

(declare-fun d!55275 () Bool)

(declare-fun get!2161 (Option!232) V!5489)

(assert (=> d!55275 (= (apply!171 (+!288 lt!92601 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248))) lt!92599) (get!2161 (getValueByKey!226 (toList!1191 (+!288 lt!92601 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248)))) lt!92599)))))

(declare-fun bs!7537 () Bool)

(assert (= bs!7537 d!55275))

(declare-fun m!213717 () Bool)

(assert (=> bs!7537 m!213717))

(assert (=> bs!7537 m!213717))

(declare-fun m!213719 () Bool)

(assert (=> bs!7537 m!213719))

(assert (=> b!187361 d!55275))

(declare-fun d!55277 () Bool)

(declare-fun e!123335 () Bool)

(assert (=> d!55277 e!123335))

(declare-fun res!88582 () Bool)

(assert (=> d!55277 (=> (not res!88582) (not e!123335))))

(declare-fun lt!92628 () ListLongMap!2351)

(assert (=> d!55277 (= res!88582 (contains!1297 lt!92628 (_1!1732 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248)))))))

(declare-fun lt!92626 () List!2370)

(assert (=> d!55277 (= lt!92628 (ListLongMap!2352 lt!92626))))

(declare-fun lt!92629 () Unit!5615)

(declare-fun lt!92627 () Unit!5615)

(assert (=> d!55277 (= lt!92629 lt!92627)))

(assert (=> d!55277 (= (getValueByKey!226 lt!92626 (_1!1732 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248)))) (Some!231 (_2!1732 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!120 (List!2370 (_ BitVec 64) V!5489) Unit!5615)

(assert (=> d!55277 (= lt!92627 (lemmaContainsTupThenGetReturnValue!120 lt!92626 (_1!1732 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248))) (_2!1732 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248)))))))

(declare-fun insertStrictlySorted!123 (List!2370 (_ BitVec 64) V!5489) List!2370)

(assert (=> d!55277 (= lt!92626 (insertStrictlySorted!123 (toList!1191 lt!92609) (_1!1732 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248))) (_2!1732 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248)))))))

(assert (=> d!55277 (= (+!288 lt!92609 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248))) lt!92628)))

(declare-fun b!187398 () Bool)

(declare-fun res!88583 () Bool)

(assert (=> b!187398 (=> (not res!88583) (not e!123335))))

(assert (=> b!187398 (= res!88583 (= (getValueByKey!226 (toList!1191 lt!92628) (_1!1732 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248)))) (Some!231 (_2!1732 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248))))))))

(declare-fun b!187399 () Bool)

(declare-fun contains!1299 (List!2370 tuple2!3442) Bool)

(assert (=> b!187399 (= e!123335 (contains!1299 (toList!1191 lt!92628) (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248))))))

(assert (= (and d!55277 res!88582) b!187398))

(assert (= (and b!187398 res!88583) b!187399))

(declare-fun m!213721 () Bool)

(assert (=> d!55277 m!213721))

(declare-fun m!213723 () Bool)

(assert (=> d!55277 m!213723))

(declare-fun m!213725 () Bool)

(assert (=> d!55277 m!213725))

(declare-fun m!213727 () Bool)

(assert (=> d!55277 m!213727))

(declare-fun m!213729 () Bool)

(assert (=> b!187398 m!213729))

(declare-fun m!213731 () Bool)

(assert (=> b!187399 m!213731))

(assert (=> b!187361 d!55277))

(declare-fun b!187424 () Bool)

(declare-fun res!88592 () Bool)

(declare-fun e!123355 () Bool)

(assert (=> b!187424 (=> (not res!88592) (not e!123355))))

(declare-fun lt!92645 () ListLongMap!2351)

(assert (=> b!187424 (= res!88592 (not (contains!1297 lt!92645 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!18886 () Bool)

(declare-fun call!18889 () ListLongMap!2351)

(assert (=> bm!18886 (= call!18889 (getCurrentListMapNoExtraKeys!192 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3821 thiss!1248)))))

(declare-fun b!187425 () Bool)

(declare-fun e!123351 () ListLongMap!2351)

(assert (=> b!187425 (= e!123351 call!18889)))

(declare-fun b!187426 () Bool)

(declare-fun e!123352 () Bool)

(assert (=> b!187426 (= e!123352 (validKeyInArray!0 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187426 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!187427 () Bool)

(declare-fun e!123356 () Bool)

(declare-fun e!123353 () Bool)

(assert (=> b!187427 (= e!123356 e!123353)))

(assert (=> b!187427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun res!88593 () Bool)

(assert (=> b!187427 (= res!88593 (contains!1297 lt!92645 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187427 (=> (not res!88593) (not e!123353))))

(declare-fun b!187428 () Bool)

(declare-fun e!123354 () Bool)

(declare-fun isEmpty!479 (ListLongMap!2351) Bool)

(assert (=> b!187428 (= e!123354 (isEmpty!479 lt!92645))))

(declare-fun b!187429 () Bool)

(assert (=> b!187429 (= e!123356 e!123354)))

(declare-fun c!33654 () Bool)

(assert (=> b!187429 (= c!33654 (bvslt #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun b!187430 () Bool)

(assert (=> b!187430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(assert (=> b!187430 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4074 (_values!3804 thiss!1248))))))

(assert (=> b!187430 (= e!123353 (= (apply!171 lt!92645 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)) (get!2160 (select (arr!3755 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!187431 () Bool)

(assert (=> b!187431 (= e!123355 e!123356)))

(declare-fun c!33656 () Bool)

(assert (=> b!187431 (= c!33656 e!123352)))

(declare-fun res!88594 () Bool)

(assert (=> b!187431 (=> (not res!88594) (not e!123352))))

(assert (=> b!187431 (= res!88594 (bvslt #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun b!187432 () Bool)

(declare-fun e!123350 () ListLongMap!2351)

(assert (=> b!187432 (= e!123350 (ListLongMap!2352 Nil!2367))))

(declare-fun b!187433 () Bool)

(assert (=> b!187433 (= e!123354 (= lt!92645 (getCurrentListMapNoExtraKeys!192 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3821 thiss!1248))))))

(declare-fun b!187434 () Bool)

(assert (=> b!187434 (= e!123350 e!123351)))

(declare-fun c!33655 () Bool)

(assert (=> b!187434 (= c!33655 (validKeyInArray!0 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187435 () Bool)

(declare-fun lt!92648 () Unit!5615)

(declare-fun lt!92647 () Unit!5615)

(assert (=> b!187435 (= lt!92648 lt!92647)))

(declare-fun lt!92649 () (_ BitVec 64))

(declare-fun lt!92644 () (_ BitVec 64))

(declare-fun lt!92650 () V!5489)

(declare-fun lt!92646 () ListLongMap!2351)

(assert (=> b!187435 (not (contains!1297 (+!288 lt!92646 (tuple2!3443 lt!92644 lt!92650)) lt!92649))))

(declare-fun addStillNotContains!92 (ListLongMap!2351 (_ BitVec 64) V!5489 (_ BitVec 64)) Unit!5615)

(assert (=> b!187435 (= lt!92647 (addStillNotContains!92 lt!92646 lt!92644 lt!92650 lt!92649))))

(assert (=> b!187435 (= lt!92649 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!187435 (= lt!92650 (get!2160 (select (arr!3755 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!187435 (= lt!92644 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187435 (= lt!92646 call!18889)))

(assert (=> b!187435 (= e!123351 (+!288 call!18889 (tuple2!3443 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000) (get!2160 (select (arr!3755 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!55279 () Bool)

(assert (=> d!55279 e!123355))

(declare-fun res!88595 () Bool)

(assert (=> d!55279 (=> (not res!88595) (not e!123355))))

(assert (=> d!55279 (= res!88595 (not (contains!1297 lt!92645 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!55279 (= lt!92645 e!123350)))

(declare-fun c!33653 () Bool)

(assert (=> d!55279 (= c!33653 (bvsge #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(assert (=> d!55279 (validMask!0 (mask!8965 thiss!1248))))

(assert (=> d!55279 (= (getCurrentListMapNoExtraKeys!192 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)) lt!92645)))

(assert (= (and d!55279 c!33653) b!187432))

(assert (= (and d!55279 (not c!33653)) b!187434))

(assert (= (and b!187434 c!33655) b!187435))

(assert (= (and b!187434 (not c!33655)) b!187425))

(assert (= (or b!187435 b!187425) bm!18886))

(assert (= (and d!55279 res!88595) b!187424))

(assert (= (and b!187424 res!88592) b!187431))

(assert (= (and b!187431 res!88594) b!187426))

(assert (= (and b!187431 c!33656) b!187427))

(assert (= (and b!187431 (not c!33656)) b!187429))

(assert (= (and b!187427 res!88593) b!187430))

(assert (= (and b!187429 c!33654) b!187433))

(assert (= (and b!187429 (not c!33654)) b!187428))

(declare-fun b_lambda!7273 () Bool)

(assert (=> (not b_lambda!7273) (not b!187430)))

(assert (=> b!187430 t!7256))

(declare-fun b_and!11209 () Bool)

(assert (= b_and!11207 (and (=> t!7256 result!4829) b_and!11209)))

(declare-fun b_lambda!7275 () Bool)

(assert (=> (not b_lambda!7275) (not b!187435)))

(assert (=> b!187435 t!7256))

(declare-fun b_and!11211 () Bool)

(assert (= b_and!11209 (and (=> t!7256 result!4829) b_and!11211)))

(declare-fun m!213733 () Bool)

(assert (=> b!187424 m!213733))

(assert (=> b!187430 m!213665))

(assert (=> b!187430 m!213647))

(assert (=> b!187430 m!213667))

(assert (=> b!187430 m!213665))

(assert (=> b!187430 m!213667))

(assert (=> b!187430 m!213669))

(assert (=> b!187430 m!213647))

(declare-fun m!213735 () Bool)

(assert (=> b!187430 m!213735))

(assert (=> b!187426 m!213647))

(assert (=> b!187426 m!213647))

(assert (=> b!187426 m!213651))

(declare-fun m!213737 () Bool)

(assert (=> b!187433 m!213737))

(assert (=> b!187434 m!213647))

(assert (=> b!187434 m!213647))

(assert (=> b!187434 m!213651))

(declare-fun m!213739 () Bool)

(assert (=> b!187435 m!213739))

(assert (=> b!187435 m!213665))

(assert (=> b!187435 m!213667))

(assert (=> b!187435 m!213669))

(assert (=> b!187435 m!213665))

(assert (=> b!187435 m!213647))

(declare-fun m!213741 () Bool)

(assert (=> b!187435 m!213741))

(assert (=> b!187435 m!213667))

(assert (=> b!187435 m!213741))

(declare-fun m!213743 () Bool)

(assert (=> b!187435 m!213743))

(declare-fun m!213745 () Bool)

(assert (=> b!187435 m!213745))

(assert (=> bm!18886 m!213737))

(declare-fun m!213747 () Bool)

(assert (=> b!187428 m!213747))

(declare-fun m!213749 () Bool)

(assert (=> d!55279 m!213749))

(assert (=> d!55279 m!213539))

(assert (=> b!187427 m!213647))

(assert (=> b!187427 m!213647))

(declare-fun m!213751 () Bool)

(assert (=> b!187427 m!213751))

(assert (=> b!187361 d!55279))

(declare-fun d!55281 () Bool)

(assert (=> d!55281 (= (apply!171 (+!288 lt!92598 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248))) lt!92595) (get!2161 (getValueByKey!226 (toList!1191 (+!288 lt!92598 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248)))) lt!92595)))))

(declare-fun bs!7538 () Bool)

(assert (= bs!7538 d!55281))

(declare-fun m!213753 () Bool)

(assert (=> bs!7538 m!213753))

(assert (=> bs!7538 m!213753))

(declare-fun m!213755 () Bool)

(assert (=> bs!7538 m!213755))

(assert (=> b!187361 d!55281))

(declare-fun d!55283 () Bool)

(declare-fun e!123357 () Bool)

(assert (=> d!55283 e!123357))

(declare-fun res!88596 () Bool)

(assert (=> d!55283 (=> (not res!88596) (not e!123357))))

(declare-fun lt!92653 () ListLongMap!2351)

(assert (=> d!55283 (= res!88596 (contains!1297 lt!92653 (_1!1732 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248)))))))

(declare-fun lt!92651 () List!2370)

(assert (=> d!55283 (= lt!92653 (ListLongMap!2352 lt!92651))))

(declare-fun lt!92654 () Unit!5615)

(declare-fun lt!92652 () Unit!5615)

(assert (=> d!55283 (= lt!92654 lt!92652)))

(assert (=> d!55283 (= (getValueByKey!226 lt!92651 (_1!1732 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248)))) (Some!231 (_2!1732 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248)))))))

(assert (=> d!55283 (= lt!92652 (lemmaContainsTupThenGetReturnValue!120 lt!92651 (_1!1732 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248))) (_2!1732 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248)))))))

(assert (=> d!55283 (= lt!92651 (insertStrictlySorted!123 (toList!1191 lt!92613) (_1!1732 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248))) (_2!1732 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248)))))))

(assert (=> d!55283 (= (+!288 lt!92613 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248))) lt!92653)))

(declare-fun b!187436 () Bool)

(declare-fun res!88597 () Bool)

(assert (=> b!187436 (=> (not res!88597) (not e!123357))))

(assert (=> b!187436 (= res!88597 (= (getValueByKey!226 (toList!1191 lt!92653) (_1!1732 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248)))) (Some!231 (_2!1732 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248))))))))

(declare-fun b!187437 () Bool)

(assert (=> b!187437 (= e!123357 (contains!1299 (toList!1191 lt!92653) (tuple2!3443 lt!92608 (minValue!3662 thiss!1248))))))

(assert (= (and d!55283 res!88596) b!187436))

(assert (= (and b!187436 res!88597) b!187437))

(declare-fun m!213757 () Bool)

(assert (=> d!55283 m!213757))

(declare-fun m!213759 () Bool)

(assert (=> d!55283 m!213759))

(declare-fun m!213761 () Bool)

(assert (=> d!55283 m!213761))

(declare-fun m!213763 () Bool)

(assert (=> d!55283 m!213763))

(declare-fun m!213765 () Bool)

(assert (=> b!187436 m!213765))

(declare-fun m!213767 () Bool)

(assert (=> b!187437 m!213767))

(assert (=> b!187361 d!55283))

(declare-fun d!55285 () Bool)

(assert (=> d!55285 (= (apply!171 lt!92598 lt!92595) (get!2161 (getValueByKey!226 (toList!1191 lt!92598) lt!92595)))))

(declare-fun bs!7539 () Bool)

(assert (= bs!7539 d!55285))

(declare-fun m!213769 () Bool)

(assert (=> bs!7539 m!213769))

(assert (=> bs!7539 m!213769))

(declare-fun m!213771 () Bool)

(assert (=> bs!7539 m!213771))

(assert (=> b!187361 d!55285))

(declare-fun d!55287 () Bool)

(assert (=> d!55287 (= (apply!171 (+!288 lt!92613 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248))) lt!92594) (apply!171 lt!92613 lt!92594))))

(declare-fun lt!92657 () Unit!5615)

(declare-fun choose!1005 (ListLongMap!2351 (_ BitVec 64) V!5489 (_ BitVec 64)) Unit!5615)

(assert (=> d!55287 (= lt!92657 (choose!1005 lt!92613 lt!92608 (minValue!3662 thiss!1248) lt!92594))))

(declare-fun e!123360 () Bool)

(assert (=> d!55287 e!123360))

(declare-fun res!88600 () Bool)

(assert (=> d!55287 (=> (not res!88600) (not e!123360))))

(assert (=> d!55287 (= res!88600 (contains!1297 lt!92613 lt!92594))))

(assert (=> d!55287 (= (addApplyDifferent!147 lt!92613 lt!92608 (minValue!3662 thiss!1248) lt!92594) lt!92657)))

(declare-fun b!187441 () Bool)

(assert (=> b!187441 (= e!123360 (not (= lt!92594 lt!92608)))))

(assert (= (and d!55287 res!88600) b!187441))

(assert (=> d!55287 m!213675))

(assert (=> d!55287 m!213681))

(declare-fun m!213773 () Bool)

(assert (=> d!55287 m!213773))

(assert (=> d!55287 m!213685))

(assert (=> d!55287 m!213675))

(declare-fun m!213775 () Bool)

(assert (=> d!55287 m!213775))

(assert (=> b!187361 d!55287))

(declare-fun d!55289 () Bool)

(assert (=> d!55289 (= (apply!171 (+!288 lt!92601 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248))) lt!92599) (apply!171 lt!92601 lt!92599))))

(declare-fun lt!92658 () Unit!5615)

(assert (=> d!55289 (= lt!92658 (choose!1005 lt!92601 lt!92603 (minValue!3662 thiss!1248) lt!92599))))

(declare-fun e!123361 () Bool)

(assert (=> d!55289 e!123361))

(declare-fun res!88601 () Bool)

(assert (=> d!55289 (=> (not res!88601) (not e!123361))))

(assert (=> d!55289 (= res!88601 (contains!1297 lt!92601 lt!92599))))

(assert (=> d!55289 (= (addApplyDifferent!147 lt!92601 lt!92603 (minValue!3662 thiss!1248) lt!92599) lt!92658)))

(declare-fun b!187442 () Bool)

(assert (=> b!187442 (= e!123361 (not (= lt!92599 lt!92603)))))

(assert (= (and d!55289 res!88601) b!187442))

(assert (=> d!55289 m!213683))

(assert (=> d!55289 m!213693))

(declare-fun m!213777 () Bool)

(assert (=> d!55289 m!213777))

(assert (=> d!55289 m!213679))

(assert (=> d!55289 m!213683))

(declare-fun m!213779 () Bool)

(assert (=> d!55289 m!213779))

(assert (=> b!187361 d!55289))

(declare-fun d!55291 () Bool)

(assert (=> d!55291 (contains!1297 (+!288 lt!92609 (tuple2!3443 lt!92611 (zeroValue!3662 thiss!1248))) lt!92606)))

(declare-fun lt!92661 () Unit!5615)

(declare-fun choose!1006 (ListLongMap!2351 (_ BitVec 64) V!5489 (_ BitVec 64)) Unit!5615)

(assert (=> d!55291 (= lt!92661 (choose!1006 lt!92609 lt!92611 (zeroValue!3662 thiss!1248) lt!92606))))

(assert (=> d!55291 (contains!1297 lt!92609 lt!92606)))

(assert (=> d!55291 (= (addStillContains!147 lt!92609 lt!92611 (zeroValue!3662 thiss!1248) lt!92606) lt!92661)))

(declare-fun bs!7540 () Bool)

(assert (= bs!7540 d!55291))

(assert (=> bs!7540 m!213697))

(assert (=> bs!7540 m!213697))

(assert (=> bs!7540 m!213699))

(declare-fun m!213781 () Bool)

(assert (=> bs!7540 m!213781))

(declare-fun m!213783 () Bool)

(assert (=> bs!7540 m!213783))

(assert (=> b!187361 d!55291))

(declare-fun d!55293 () Bool)

(declare-fun e!123362 () Bool)

(assert (=> d!55293 e!123362))

(declare-fun res!88602 () Bool)

(assert (=> d!55293 (=> (not res!88602) (not e!123362))))

(declare-fun lt!92664 () ListLongMap!2351)

(assert (=> d!55293 (= res!88602 (contains!1297 lt!92664 (_1!1732 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248)))))))

(declare-fun lt!92662 () List!2370)

(assert (=> d!55293 (= lt!92664 (ListLongMap!2352 lt!92662))))

(declare-fun lt!92665 () Unit!5615)

(declare-fun lt!92663 () Unit!5615)

(assert (=> d!55293 (= lt!92665 lt!92663)))

(assert (=> d!55293 (= (getValueByKey!226 lt!92662 (_1!1732 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248)))) (Some!231 (_2!1732 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248)))))))

(assert (=> d!55293 (= lt!92663 (lemmaContainsTupThenGetReturnValue!120 lt!92662 (_1!1732 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248))) (_2!1732 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248)))))))

(assert (=> d!55293 (= lt!92662 (insertStrictlySorted!123 (toList!1191 lt!92601) (_1!1732 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248))) (_2!1732 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248)))))))

(assert (=> d!55293 (= (+!288 lt!92601 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248))) lt!92664)))

(declare-fun b!187444 () Bool)

(declare-fun res!88603 () Bool)

(assert (=> b!187444 (=> (not res!88603) (not e!123362))))

(assert (=> b!187444 (= res!88603 (= (getValueByKey!226 (toList!1191 lt!92664) (_1!1732 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248)))) (Some!231 (_2!1732 (tuple2!3443 lt!92603 (minValue!3662 thiss!1248))))))))

(declare-fun b!187445 () Bool)

(assert (=> b!187445 (= e!123362 (contains!1299 (toList!1191 lt!92664) (tuple2!3443 lt!92603 (minValue!3662 thiss!1248))))))

(assert (= (and d!55293 res!88602) b!187444))

(assert (= (and b!187444 res!88603) b!187445))

(declare-fun m!213785 () Bool)

(assert (=> d!55293 m!213785))

(declare-fun m!213787 () Bool)

(assert (=> d!55293 m!213787))

(declare-fun m!213789 () Bool)

(assert (=> d!55293 m!213789))

(declare-fun m!213791 () Bool)

(assert (=> d!55293 m!213791))

(declare-fun m!213793 () Bool)

(assert (=> b!187444 m!213793))

(declare-fun m!213795 () Bool)

(assert (=> b!187445 m!213795))

(assert (=> b!187361 d!55293))

(declare-fun d!55295 () Bool)

(assert (=> d!55295 (= (apply!171 lt!92613 lt!92594) (get!2161 (getValueByKey!226 (toList!1191 lt!92613) lt!92594)))))

(declare-fun bs!7541 () Bool)

(assert (= bs!7541 d!55295))

(declare-fun m!213797 () Bool)

(assert (=> bs!7541 m!213797))

(assert (=> bs!7541 m!213797))

(declare-fun m!213799 () Bool)

(assert (=> bs!7541 m!213799))

(assert (=> b!187361 d!55295))

(declare-fun d!55297 () Bool)

(assert (=> d!55297 (= (apply!171 lt!92601 lt!92599) (get!2161 (getValueByKey!226 (toList!1191 lt!92601) lt!92599)))))

(declare-fun bs!7542 () Bool)

(assert (= bs!7542 d!55297))

(declare-fun m!213801 () Bool)

(assert (=> bs!7542 m!213801))

(assert (=> bs!7542 m!213801))

(declare-fun m!213803 () Bool)

(assert (=> bs!7542 m!213803))

(assert (=> b!187361 d!55297))

(declare-fun d!55299 () Bool)

(assert (=> d!55299 (= (apply!171 (+!288 lt!92598 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248))) lt!92595) (apply!171 lt!92598 lt!92595))))

(declare-fun lt!92666 () Unit!5615)

(assert (=> d!55299 (= lt!92666 (choose!1005 lt!92598 lt!92602 (zeroValue!3662 thiss!1248) lt!92595))))

(declare-fun e!123363 () Bool)

(assert (=> d!55299 e!123363))

(declare-fun res!88604 () Bool)

(assert (=> d!55299 (=> (not res!88604) (not e!123363))))

(assert (=> d!55299 (= res!88604 (contains!1297 lt!92598 lt!92595))))

(assert (=> d!55299 (= (addApplyDifferent!147 lt!92598 lt!92602 (zeroValue!3662 thiss!1248) lt!92595) lt!92666)))

(declare-fun b!187446 () Bool)

(assert (=> b!187446 (= e!123363 (not (= lt!92595 lt!92602)))))

(assert (= (and d!55299 res!88604) b!187446))

(assert (=> d!55299 m!213687))

(assert (=> d!55299 m!213689))

(declare-fun m!213805 () Bool)

(assert (=> d!55299 m!213805))

(assert (=> d!55299 m!213695))

(assert (=> d!55299 m!213687))

(declare-fun m!213807 () Bool)

(assert (=> d!55299 m!213807))

(assert (=> b!187361 d!55299))

(declare-fun d!55301 () Bool)

(assert (=> d!55301 (= (apply!171 (+!288 lt!92613 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248))) lt!92594) (get!2161 (getValueByKey!226 (toList!1191 (+!288 lt!92613 (tuple2!3443 lt!92608 (minValue!3662 thiss!1248)))) lt!92594)))))

(declare-fun bs!7543 () Bool)

(assert (= bs!7543 d!55301))

(declare-fun m!213809 () Bool)

(assert (=> bs!7543 m!213809))

(assert (=> bs!7543 m!213809))

(declare-fun m!213811 () Bool)

(assert (=> bs!7543 m!213811))

(assert (=> b!187361 d!55301))

(declare-fun d!55303 () Bool)

(declare-fun e!123364 () Bool)

(assert (=> d!55303 e!123364))

(declare-fun res!88605 () Bool)

(assert (=> d!55303 (=> (not res!88605) (not e!123364))))

(declare-fun lt!92669 () ListLongMap!2351)

(assert (=> d!55303 (= res!88605 (contains!1297 lt!92669 (_1!1732 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248)))))))

(declare-fun lt!92667 () List!2370)

(assert (=> d!55303 (= lt!92669 (ListLongMap!2352 lt!92667))))

(declare-fun lt!92670 () Unit!5615)

(declare-fun lt!92668 () Unit!5615)

(assert (=> d!55303 (= lt!92670 lt!92668)))

(assert (=> d!55303 (= (getValueByKey!226 lt!92667 (_1!1732 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248)))) (Some!231 (_2!1732 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248)))))))

(assert (=> d!55303 (= lt!92668 (lemmaContainsTupThenGetReturnValue!120 lt!92667 (_1!1732 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248))) (_2!1732 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248)))))))

(assert (=> d!55303 (= lt!92667 (insertStrictlySorted!123 (toList!1191 lt!92598) (_1!1732 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248))) (_2!1732 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248)))))))

(assert (=> d!55303 (= (+!288 lt!92598 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248))) lt!92669)))

(declare-fun b!187447 () Bool)

(declare-fun res!88606 () Bool)

(assert (=> b!187447 (=> (not res!88606) (not e!123364))))

(assert (=> b!187447 (= res!88606 (= (getValueByKey!226 (toList!1191 lt!92669) (_1!1732 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248)))) (Some!231 (_2!1732 (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248))))))))

(declare-fun b!187448 () Bool)

(assert (=> b!187448 (= e!123364 (contains!1299 (toList!1191 lt!92669) (tuple2!3443 lt!92602 (zeroValue!3662 thiss!1248))))))

(assert (= (and d!55303 res!88605) b!187447))

(assert (= (and b!187447 res!88606) b!187448))

(declare-fun m!213813 () Bool)

(assert (=> d!55303 m!213813))

(declare-fun m!213815 () Bool)

(assert (=> d!55303 m!213815))

(declare-fun m!213817 () Bool)

(assert (=> d!55303 m!213817))

(declare-fun m!213819 () Bool)

(assert (=> d!55303 m!213819))

(declare-fun m!213821 () Bool)

(assert (=> b!187447 m!213821))

(declare-fun m!213823 () Bool)

(assert (=> b!187448 m!213823))

(assert (=> b!187361 d!55303))

(declare-fun d!55305 () Bool)

(declare-fun e!123366 () Bool)

(assert (=> d!55305 e!123366))

(declare-fun res!88607 () Bool)

(assert (=> d!55305 (=> res!88607 e!123366)))

(declare-fun lt!92672 () Bool)

(assert (=> d!55305 (= res!88607 (not lt!92672))))

(declare-fun lt!92671 () Bool)

(assert (=> d!55305 (= lt!92672 lt!92671)))

(declare-fun lt!92674 () Unit!5615)

(declare-fun e!123365 () Unit!5615)

(assert (=> d!55305 (= lt!92674 e!123365)))

(declare-fun c!33657 () Bool)

(assert (=> d!55305 (= c!33657 lt!92671)))

(assert (=> d!55305 (= lt!92671 (containsKey!230 (toList!1191 lt!92605) (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55305 (= (contains!1297 lt!92605 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)) lt!92672)))

(declare-fun b!187449 () Bool)

(declare-fun lt!92673 () Unit!5615)

(assert (=> b!187449 (= e!123365 lt!92673)))

(assert (=> b!187449 (= lt!92673 (lemmaContainsKeyImpliesGetValueByKeyDefined!179 (toList!1191 lt!92605) (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187449 (isDefined!180 (getValueByKey!226 (toList!1191 lt!92605) (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187450 () Bool)

(declare-fun Unit!5624 () Unit!5615)

(assert (=> b!187450 (= e!123365 Unit!5624)))

(declare-fun b!187451 () Bool)

(assert (=> b!187451 (= e!123366 (isDefined!180 (getValueByKey!226 (toList!1191 lt!92605) (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55305 c!33657) b!187449))

(assert (= (and d!55305 (not c!33657)) b!187450))

(assert (= (and d!55305 (not res!88607)) b!187451))

(assert (=> d!55305 m!213647))

(declare-fun m!213825 () Bool)

(assert (=> d!55305 m!213825))

(assert (=> b!187449 m!213647))

(declare-fun m!213827 () Bool)

(assert (=> b!187449 m!213827))

(assert (=> b!187449 m!213647))

(declare-fun m!213829 () Bool)

(assert (=> b!187449 m!213829))

(assert (=> b!187449 m!213829))

(declare-fun m!213831 () Bool)

(assert (=> b!187449 m!213831))

(assert (=> b!187451 m!213647))

(assert (=> b!187451 m!213829))

(assert (=> b!187451 m!213829))

(assert (=> b!187451 m!213831))

(assert (=> b!187374 d!55305))

(declare-fun d!55307 () Bool)

(assert (=> d!55307 (isDefined!180 (getValueByKey!226 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(declare-fun lt!92677 () Unit!5615)

(declare-fun choose!1007 (List!2370 (_ BitVec 64)) Unit!5615)

(assert (=> d!55307 (= lt!92677 (choose!1007 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(declare-fun e!123369 () Bool)

(assert (=> d!55307 e!123369))

(declare-fun res!88610 () Bool)

(assert (=> d!55307 (=> (not res!88610) (not e!123369))))

(declare-fun isStrictlySorted!346 (List!2370) Bool)

(assert (=> d!55307 (= res!88610 (isStrictlySorted!346 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))))

(assert (=> d!55307 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!179 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828) lt!92677)))

(declare-fun b!187454 () Bool)

(assert (=> b!187454 (= e!123369 (containsKey!230 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))

(assert (= (and d!55307 res!88610) b!187454))

(assert (=> d!55307 m!213643))

(assert (=> d!55307 m!213643))

(assert (=> d!55307 m!213645))

(declare-fun m!213833 () Bool)

(assert (=> d!55307 m!213833))

(declare-fun m!213835 () Bool)

(assert (=> d!55307 m!213835))

(assert (=> b!187454 m!213639))

(assert (=> b!187309 d!55307))

(declare-fun d!55309 () Bool)

(declare-fun isEmpty!480 (Option!232) Bool)

(assert (=> d!55309 (= (isDefined!180 (getValueByKey!226 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828)) (not (isEmpty!480 (getValueByKey!226 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828))))))

(declare-fun bs!7544 () Bool)

(assert (= bs!7544 d!55309))

(assert (=> bs!7544 m!213643))

(declare-fun m!213837 () Bool)

(assert (=> bs!7544 m!213837))

(assert (=> b!187309 d!55309))

(declare-fun d!55311 () Bool)

(declare-fun c!33662 () Bool)

(assert (=> d!55311 (= c!33662 (and ((_ is Cons!2366) (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) (= (_1!1732 (h!3001 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) key!828)))))

(declare-fun e!123374 () Option!232)

(assert (=> d!55311 (= (getValueByKey!226 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828) e!123374)))

(declare-fun b!187466 () Bool)

(declare-fun e!123375 () Option!232)

(assert (=> b!187466 (= e!123375 None!230)))

(declare-fun b!187464 () Bool)

(assert (=> b!187464 (= e!123374 e!123375)))

(declare-fun c!33663 () Bool)

(assert (=> b!187464 (= c!33663 (and ((_ is Cons!2366) (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) (not (= (_1!1732 (h!3001 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) key!828))))))

(declare-fun b!187463 () Bool)

(assert (=> b!187463 (= e!123374 (Some!231 (_2!1732 (h!3001 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))))))))

(declare-fun b!187465 () Bool)

(assert (=> b!187465 (= e!123375 (getValueByKey!226 (t!7253 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) key!828))))

(assert (= (and d!55311 c!33662) b!187463))

(assert (= (and d!55311 (not c!33662)) b!187464))

(assert (= (and b!187464 c!33663) b!187465))

(assert (= (and b!187464 (not c!33663)) b!187466))

(declare-fun m!213839 () Bool)

(assert (=> b!187465 m!213839))

(assert (=> b!187309 d!55311))

(assert (=> b!187311 d!55309))

(assert (=> b!187311 d!55311))

(declare-fun d!55313 () Bool)

(assert (=> d!55313 (= (apply!171 lt!92605 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2161 (getValueByKey!226 (toList!1191 lt!92605) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7545 () Bool)

(assert (= bs!7545 d!55313))

(declare-fun m!213841 () Bool)

(assert (=> bs!7545 m!213841))

(assert (=> bs!7545 m!213841))

(declare-fun m!213843 () Bool)

(assert (=> bs!7545 m!213843))

(assert (=> b!187358 d!55313))

(declare-fun d!55315 () Bool)

(declare-fun res!88615 () Bool)

(declare-fun e!123380 () Bool)

(assert (=> d!55315 (=> res!88615 e!123380)))

(assert (=> d!55315 (= res!88615 (and ((_ is Cons!2366) (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) (= (_1!1732 (h!3001 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) key!828)))))

(assert (=> d!55315 (= (containsKey!230 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))) key!828) e!123380)))

(declare-fun b!187471 () Bool)

(declare-fun e!123381 () Bool)

(assert (=> b!187471 (= e!123380 e!123381)))

(declare-fun res!88616 () Bool)

(assert (=> b!187471 (=> (not res!88616) (not e!123381))))

(assert (=> b!187471 (= res!88616 (and (or (not ((_ is Cons!2366) (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) (bvsle (_1!1732 (h!3001 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) key!828)) ((_ is Cons!2366) (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) (bvslt (_1!1732 (h!3001 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248))))) key!828)))))

(declare-fun b!187472 () Bool)

(assert (=> b!187472 (= e!123381 (containsKey!230 (t!7253 (toList!1191 (getCurrentListMap!824 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3821 thiss!1248)))) key!828))))

(assert (= (and d!55315 (not res!88615)) b!187471))

(assert (= (and b!187471 res!88616) b!187472))

(declare-fun m!213845 () Bool)

(assert (=> b!187472 m!213845))

(assert (=> d!55267 d!55315))

(assert (=> bm!18880 d!55279))

(declare-fun d!55317 () Bool)

(assert (=> d!55317 (= (apply!171 lt!92605 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2161 (getValueByKey!226 (toList!1191 lt!92605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7546 () Bool)

(assert (= bs!7546 d!55317))

(declare-fun m!213847 () Bool)

(assert (=> bs!7546 m!213847))

(assert (=> bs!7546 m!213847))

(declare-fun m!213849 () Bool)

(assert (=> bs!7546 m!213849))

(assert (=> b!187366 d!55317))

(declare-fun d!55319 () Bool)

(assert (=> d!55319 (= (apply!171 lt!92605 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)) (get!2161 (getValueByKey!226 (toList!1191 lt!92605) (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7547 () Bool)

(assert (= bs!7547 d!55319))

(assert (=> bs!7547 m!213647))

(assert (=> bs!7547 m!213829))

(assert (=> bs!7547 m!213829))

(declare-fun m!213851 () Bool)

(assert (=> bs!7547 m!213851))

(assert (=> b!187363 d!55319))

(declare-fun d!55321 () Bool)

(declare-fun c!33666 () Bool)

(assert (=> d!55321 (= c!33666 ((_ is ValueCellFull!1847) (select (arr!3755 (_values!3804 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!123384 () V!5489)

(assert (=> d!55321 (= (get!2160 (select (arr!3755 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!123384)))

(declare-fun b!187477 () Bool)

(declare-fun get!2162 (ValueCell!1847 V!5489) V!5489)

(assert (=> b!187477 (= e!123384 (get!2162 (select (arr!3755 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!187478 () Bool)

(declare-fun get!2163 (ValueCell!1847 V!5489) V!5489)

(assert (=> b!187478 (= e!123384 (get!2163 (select (arr!3755 (_values!3804 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!505 (defaultEntry!3821 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55321 c!33666) b!187477))

(assert (= (and d!55321 (not c!33666)) b!187478))

(assert (=> b!187477 m!213665))

(assert (=> b!187477 m!213667))

(declare-fun m!213853 () Bool)

(assert (=> b!187477 m!213853))

(assert (=> b!187478 m!213665))

(assert (=> b!187478 m!213667))

(declare-fun m!213855 () Bool)

(assert (=> b!187478 m!213855))

(assert (=> b!187363 d!55321))

(declare-fun d!55323 () Bool)

(assert (=> d!55323 (= (validKeyInArray!0 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187364 d!55323))

(declare-fun b!187491 () Bool)

(declare-fun c!33674 () Bool)

(declare-fun lt!92683 () (_ BitVec 64))

(assert (=> b!187491 (= c!33674 (= lt!92683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123391 () SeekEntryResult!651)

(declare-fun e!123392 () SeekEntryResult!651)

(assert (=> b!187491 (= e!123391 e!123392)))

(declare-fun b!187492 () Bool)

(declare-fun e!123393 () SeekEntryResult!651)

(assert (=> b!187492 (= e!123393 e!123391)))

(declare-fun c!33675 () Bool)

(assert (=> b!187492 (= c!33675 (= lt!92683 key!828))))

(declare-fun lt!92682 () SeekEntryResult!651)

(declare-fun d!55325 () Bool)

(assert (=> d!55325 (and (or ((_ is Undefined!651) lt!92682) (not ((_ is Found!651) lt!92682)) (and (bvsge (index!4775 lt!92682) #b00000000000000000000000000000000) (bvslt (index!4775 lt!92682) (size!4073 (_keys!5771 thiss!1248))))) (or ((_ is Undefined!651) lt!92682) ((_ is Found!651) lt!92682) (not ((_ is MissingVacant!651) lt!92682)) (not (= (index!4777 lt!92682) (index!4776 lt!92533))) (and (bvsge (index!4777 lt!92682) #b00000000000000000000000000000000) (bvslt (index!4777 lt!92682) (size!4073 (_keys!5771 thiss!1248))))) (or ((_ is Undefined!651) lt!92682) (ite ((_ is Found!651) lt!92682) (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4775 lt!92682)) key!828) (and ((_ is MissingVacant!651) lt!92682) (= (index!4777 lt!92682) (index!4776 lt!92533)) (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4777 lt!92682)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55325 (= lt!92682 e!123393)))

(declare-fun c!33673 () Bool)

(assert (=> d!55325 (= c!33673 (bvsge (x!20284 lt!92533) #b01111111111111111111111111111110))))

(assert (=> d!55325 (= lt!92683 (select (arr!3754 (_keys!5771 thiss!1248)) (index!4776 lt!92533)))))

(assert (=> d!55325 (validMask!0 (mask!8965 thiss!1248))))

(assert (=> d!55325 (= (seekKeyOrZeroReturnVacant!0 (x!20284 lt!92533) (index!4776 lt!92533) (index!4776 lt!92533) key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)) lt!92682)))

(declare-fun b!187493 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187493 (= e!123392 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20284 lt!92533) #b00000000000000000000000000000001) (nextIndex!0 (index!4776 lt!92533) (x!20284 lt!92533) (mask!8965 thiss!1248)) (index!4776 lt!92533) key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(declare-fun b!187494 () Bool)

(assert (=> b!187494 (= e!123392 (MissingVacant!651 (index!4776 lt!92533)))))

(declare-fun b!187495 () Bool)

(assert (=> b!187495 (= e!123391 (Found!651 (index!4776 lt!92533)))))

(declare-fun b!187496 () Bool)

(assert (=> b!187496 (= e!123393 Undefined!651)))

(assert (= (and d!55325 c!33673) b!187496))

(assert (= (and d!55325 (not c!33673)) b!187492))

(assert (= (and b!187492 c!33675) b!187495))

(assert (= (and b!187492 (not c!33675)) b!187491))

(assert (= (and b!187491 c!33674) b!187494))

(assert (= (and b!187491 (not c!33674)) b!187493))

(declare-fun m!213857 () Bool)

(assert (=> d!55325 m!213857))

(declare-fun m!213859 () Bool)

(assert (=> d!55325 m!213859))

(assert (=> d!55325 m!213635))

(assert (=> d!55325 m!213539))

(declare-fun m!213861 () Bool)

(assert (=> b!187493 m!213861))

(assert (=> b!187493 m!213861))

(declare-fun m!213863 () Bool)

(assert (=> b!187493 m!213863))

(assert (=> b!187301 d!55325))

(assert (=> d!55255 d!55263))

(declare-fun d!55327 () Bool)

(declare-fun e!123396 () Bool)

(assert (=> d!55327 e!123396))

(declare-fun res!88621 () Bool)

(assert (=> d!55327 (=> (not res!88621) (not e!123396))))

(declare-fun lt!92686 () SeekEntryResult!651)

(assert (=> d!55327 (= res!88621 ((_ is Found!651) lt!92686))))

(assert (=> d!55327 (= lt!92686 (seekEntryOrOpen!0 key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(assert (=> d!55327 true))

(declare-fun _$33!132 () Unit!5615)

(assert (=> d!55327 (= (choose!1004 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)) _$33!132)))

(declare-fun b!187501 () Bool)

(declare-fun res!88622 () Bool)

(assert (=> b!187501 (=> (not res!88622) (not e!123396))))

(assert (=> b!187501 (= res!88622 (inRange!0 (index!4775 lt!92686) (mask!8965 thiss!1248)))))

(declare-fun b!187502 () Bool)

(assert (=> b!187502 (= e!123396 (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4775 lt!92686)) key!828))))

(assert (= (and d!55327 res!88621) b!187501))

(assert (= (and b!187501 res!88622) b!187502))

(assert (=> d!55327 m!213537))

(declare-fun m!213865 () Bool)

(assert (=> b!187501 m!213865))

(declare-fun m!213867 () Bool)

(assert (=> b!187502 m!213867))

(assert (=> d!55255 d!55327))

(assert (=> d!55255 d!55265))

(assert (=> d!55251 d!55263))

(declare-fun b!187519 () Bool)

(declare-fun res!88634 () Bool)

(declare-fun e!123406 () Bool)

(assert (=> b!187519 (=> (not res!88634) (not e!123406))))

(declare-fun lt!92689 () SeekEntryResult!651)

(assert (=> b!187519 (= res!88634 (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4777 lt!92689)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187520 () Bool)

(declare-fun e!123408 () Bool)

(declare-fun e!123407 () Bool)

(assert (=> b!187520 (= e!123408 e!123407)))

(declare-fun c!33680 () Bool)

(assert (=> b!187520 (= c!33680 ((_ is MissingVacant!651) lt!92689))))

(declare-fun b!187521 () Bool)

(declare-fun res!88632 () Bool)

(assert (=> b!187521 (= res!88632 (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4774 lt!92689)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123405 () Bool)

(assert (=> b!187521 (=> (not res!88632) (not e!123405))))

(declare-fun call!18894 () Bool)

(declare-fun bm!18891 () Bool)

(declare-fun c!33681 () Bool)

(assert (=> bm!18891 (= call!18894 (inRange!0 (ite c!33681 (index!4774 lt!92689) (index!4777 lt!92689)) (mask!8965 thiss!1248)))))

(declare-fun b!187522 () Bool)

(declare-fun res!88633 () Bool)

(assert (=> b!187522 (=> (not res!88633) (not e!123406))))

(assert (=> b!187522 (= res!88633 call!18894)))

(assert (=> b!187522 (= e!123407 e!123406)))

(declare-fun b!187523 () Bool)

(assert (=> b!187523 (= e!123408 e!123405)))

(declare-fun res!88631 () Bool)

(assert (=> b!187523 (= res!88631 call!18894)))

(assert (=> b!187523 (=> (not res!88631) (not e!123405))))

(declare-fun b!187524 () Bool)

(assert (=> b!187524 (= e!123407 ((_ is Undefined!651) lt!92689))))

(declare-fun bm!18892 () Bool)

(declare-fun call!18895 () Bool)

(assert (=> bm!18892 (= call!18895 (arrayContainsKey!0 (_keys!5771 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun d!55329 () Bool)

(assert (=> d!55329 e!123408))

(assert (=> d!55329 (= c!33681 ((_ is MissingZero!651) lt!92689))))

(assert (=> d!55329 (= lt!92689 (seekEntryOrOpen!0 key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(assert (=> d!55329 true))

(declare-fun _$34!1069 () Unit!5615)

(assert (=> d!55329 (= (choose!1003 (_keys!5771 thiss!1248) (_values!3804 thiss!1248) (mask!8965 thiss!1248) (extraKeys!3558 thiss!1248) (zeroValue!3662 thiss!1248) (minValue!3662 thiss!1248) key!828 (defaultEntry!3821 thiss!1248)) _$34!1069)))

(declare-fun b!187525 () Bool)

(assert (=> b!187525 (= e!123405 (not call!18895))))

(declare-fun b!187526 () Bool)

(assert (=> b!187526 (= e!123406 (not call!18895))))

(assert (= (and d!55329 c!33681) b!187523))

(assert (= (and d!55329 (not c!33681)) b!187520))

(assert (= (and b!187523 res!88631) b!187521))

(assert (= (and b!187521 res!88632) b!187525))

(assert (= (and b!187520 c!33680) b!187522))

(assert (= (and b!187520 (not c!33680)) b!187524))

(assert (= (and b!187522 res!88633) b!187519))

(assert (= (and b!187519 res!88634) b!187526))

(assert (= (or b!187523 b!187522) bm!18891))

(assert (= (or b!187525 b!187526) bm!18892))

(assert (=> bm!18892 m!213605))

(declare-fun m!213869 () Bool)

(assert (=> b!187519 m!213869))

(assert (=> d!55329 m!213537))

(declare-fun m!213871 () Bool)

(assert (=> bm!18891 m!213871))

(declare-fun m!213873 () Bool)

(assert (=> b!187521 m!213873))

(assert (=> d!55251 d!55329))

(assert (=> d!55251 d!55265))

(assert (=> b!187369 d!55323))

(declare-fun b!187536 () Bool)

(declare-fun res!88646 () Bool)

(declare-fun e!123411 () Bool)

(assert (=> b!187536 (=> (not res!88646) (not e!123411))))

(declare-fun size!4079 (LongMapFixedSize!2602) (_ BitVec 32))

(assert (=> b!187536 (= res!88646 (bvsge (size!4079 thiss!1248) (_size!1350 thiss!1248)))))

(declare-fun b!187537 () Bool)

(declare-fun res!88645 () Bool)

(assert (=> b!187537 (=> (not res!88645) (not e!123411))))

(assert (=> b!187537 (= res!88645 (= (size!4079 thiss!1248) (bvadd (_size!1350 thiss!1248) (bvsdiv (bvadd (extraKeys!3558 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!187538 () Bool)

(assert (=> b!187538 (= e!123411 (and (bvsge (extraKeys!3558 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3558 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1350 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!187535 () Bool)

(declare-fun res!88643 () Bool)

(assert (=> b!187535 (=> (not res!88643) (not e!123411))))

(assert (=> b!187535 (= res!88643 (and (= (size!4074 (_values!3804 thiss!1248)) (bvadd (mask!8965 thiss!1248) #b00000000000000000000000000000001)) (= (size!4073 (_keys!5771 thiss!1248)) (size!4074 (_values!3804 thiss!1248))) (bvsge (_size!1350 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1350 thiss!1248) (bvadd (mask!8965 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!55331 () Bool)

(declare-fun res!88644 () Bool)

(assert (=> d!55331 (=> (not res!88644) (not e!123411))))

(assert (=> d!55331 (= res!88644 (validMask!0 (mask!8965 thiss!1248)))))

(assert (=> d!55331 (= (simpleValid!187 thiss!1248) e!123411)))

(assert (= (and d!55331 res!88644) b!187535))

(assert (= (and b!187535 res!88643) b!187536))

(assert (= (and b!187536 res!88646) b!187537))

(assert (= (and b!187537 res!88645) b!187538))

(declare-fun m!213875 () Bool)

(assert (=> b!187536 m!213875))

(assert (=> b!187537 m!213875))

(assert (=> d!55331 m!213539))

(assert (=> d!55253 d!55331))

(declare-fun d!55333 () Bool)

(assert (=> d!55333 (= (inRange!0 (index!4775 lt!92526) (mask!8965 thiss!1248)) (and (bvsge (index!4775 lt!92526) #b00000000000000000000000000000000) (bvslt (index!4775 lt!92526) (bvadd (mask!8965 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!187283 d!55333))

(declare-fun d!55335 () Bool)

(declare-fun e!123412 () Bool)

(assert (=> d!55335 e!123412))

(declare-fun res!88647 () Bool)

(assert (=> d!55335 (=> (not res!88647) (not e!123412))))

(declare-fun lt!92692 () ListLongMap!2351)

(assert (=> d!55335 (= res!88647 (contains!1297 lt!92692 (_1!1732 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(declare-fun lt!92690 () List!2370)

(assert (=> d!55335 (= lt!92692 (ListLongMap!2352 lt!92690))))

(declare-fun lt!92693 () Unit!5615)

(declare-fun lt!92691 () Unit!5615)

(assert (=> d!55335 (= lt!92693 lt!92691)))

(assert (=> d!55335 (= (getValueByKey!226 lt!92690 (_1!1732 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))) (Some!231 (_2!1732 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(assert (=> d!55335 (= lt!92691 (lemmaContainsTupThenGetReturnValue!120 lt!92690 (_1!1732 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))) (_2!1732 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(assert (=> d!55335 (= lt!92690 (insertStrictlySorted!123 (toList!1191 call!18882) (_1!1732 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))) (_2!1732 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(assert (=> d!55335 (= (+!288 call!18882 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))) lt!92692)))

(declare-fun b!187539 () Bool)

(declare-fun res!88648 () Bool)

(assert (=> b!187539 (=> (not res!88648) (not e!123412))))

(assert (=> b!187539 (= res!88648 (= (getValueByKey!226 (toList!1191 lt!92692) (_1!1732 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))) (Some!231 (_2!1732 (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))))

(declare-fun b!187540 () Bool)

(assert (=> b!187540 (= e!123412 (contains!1299 (toList!1191 lt!92692) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))

(assert (= (and d!55335 res!88647) b!187539))

(assert (= (and b!187539 res!88648) b!187540))

(declare-fun m!213877 () Bool)

(assert (=> d!55335 m!213877))

(declare-fun m!213879 () Bool)

(assert (=> d!55335 m!213879))

(declare-fun m!213881 () Bool)

(assert (=> d!55335 m!213881))

(declare-fun m!213883 () Bool)

(assert (=> d!55335 m!213883))

(declare-fun m!213885 () Bool)

(assert (=> b!187539 m!213885))

(declare-fun m!213887 () Bool)

(assert (=> b!187540 m!213887))

(assert (=> b!187354 d!55335))

(assert (=> d!55269 d!55265))

(declare-fun b!187559 () Bool)

(declare-fun lt!92698 () SeekEntryResult!651)

(assert (=> b!187559 (and (bvsge (index!4776 lt!92698) #b00000000000000000000000000000000) (bvslt (index!4776 lt!92698) (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun res!88657 () Bool)

(assert (=> b!187559 (= res!88657 (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4776 lt!92698)) key!828))))

(declare-fun e!123427 () Bool)

(assert (=> b!187559 (=> res!88657 e!123427)))

(declare-fun e!123425 () Bool)

(assert (=> b!187559 (= e!123425 e!123427)))

(declare-fun b!187560 () Bool)

(declare-fun e!123426 () SeekEntryResult!651)

(assert (=> b!187560 (= e!123426 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8965 thiss!1248)) #b00000000000000000000000000000000 (mask!8965 thiss!1248)) key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(declare-fun b!187561 () Bool)

(assert (=> b!187561 (and (bvsge (index!4776 lt!92698) #b00000000000000000000000000000000) (bvslt (index!4776 lt!92698) (size!4073 (_keys!5771 thiss!1248))))))

(assert (=> b!187561 (= e!123427 (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4776 lt!92698)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187562 () Bool)

(declare-fun e!123423 () SeekEntryResult!651)

(assert (=> b!187562 (= e!123423 (Intermediate!651 true (toIndex!0 key!828 (mask!8965 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!187563 () Bool)

(assert (=> b!187563 (and (bvsge (index!4776 lt!92698) #b00000000000000000000000000000000) (bvslt (index!4776 lt!92698) (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun res!88655 () Bool)

(assert (=> b!187563 (= res!88655 (= (select (arr!3754 (_keys!5771 thiss!1248)) (index!4776 lt!92698)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187563 (=> res!88655 e!123427)))

(declare-fun b!187564 () Bool)

(declare-fun e!123424 () Bool)

(assert (=> b!187564 (= e!123424 (bvsge (x!20284 lt!92698) #b01111111111111111111111111111110))))

(declare-fun b!187565 () Bool)

(assert (=> b!187565 (= e!123424 e!123425)))

(declare-fun res!88656 () Bool)

(assert (=> b!187565 (= res!88656 (and ((_ is Intermediate!651) lt!92698) (not (undefined!1463 lt!92698)) (bvslt (x!20284 lt!92698) #b01111111111111111111111111111110) (bvsge (x!20284 lt!92698) #b00000000000000000000000000000000) (bvsge (x!20284 lt!92698) #b00000000000000000000000000000000)))))

(assert (=> b!187565 (=> (not res!88656) (not e!123425))))

(declare-fun b!187566 () Bool)

(assert (=> b!187566 (= e!123423 e!123426)))

(declare-fun c!33690 () Bool)

(declare-fun lt!92699 () (_ BitVec 64))

(assert (=> b!187566 (= c!33690 (or (= lt!92699 key!828) (= (bvadd lt!92699 lt!92699) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!55337 () Bool)

(assert (=> d!55337 e!123424))

(declare-fun c!33688 () Bool)

(assert (=> d!55337 (= c!33688 (and ((_ is Intermediate!651) lt!92698) (undefined!1463 lt!92698)))))

(assert (=> d!55337 (= lt!92698 e!123423)))

(declare-fun c!33689 () Bool)

(assert (=> d!55337 (= c!33689 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!55337 (= lt!92699 (select (arr!3754 (_keys!5771 thiss!1248)) (toIndex!0 key!828 (mask!8965 thiss!1248))))))

(assert (=> d!55337 (validMask!0 (mask!8965 thiss!1248))))

(assert (=> d!55337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8965 thiss!1248)) key!828 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)) lt!92698)))

(declare-fun b!187567 () Bool)

(assert (=> b!187567 (= e!123426 (Intermediate!651 false (toIndex!0 key!828 (mask!8965 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!55337 c!33689) b!187562))

(assert (= (and d!55337 (not c!33689)) b!187566))

(assert (= (and b!187566 c!33690) b!187567))

(assert (= (and b!187566 (not c!33690)) b!187560))

(assert (= (and d!55337 c!33688) b!187564))

(assert (= (and d!55337 (not c!33688)) b!187565))

(assert (= (and b!187565 res!88656) b!187559))

(assert (= (and b!187559 (not res!88657)) b!187563))

(assert (= (and b!187563 (not res!88655)) b!187561))

(assert (=> b!187560 m!213629))

(declare-fun m!213889 () Bool)

(assert (=> b!187560 m!213889))

(assert (=> b!187560 m!213889))

(declare-fun m!213891 () Bool)

(assert (=> b!187560 m!213891))

(declare-fun m!213893 () Bool)

(assert (=> b!187561 m!213893))

(assert (=> b!187563 m!213893))

(assert (=> b!187559 m!213893))

(assert (=> d!55337 m!213629))

(declare-fun m!213895 () Bool)

(assert (=> d!55337 m!213895))

(assert (=> d!55337 m!213539))

(assert (=> d!55263 d!55337))

(declare-fun d!55339 () Bool)

(declare-fun lt!92705 () (_ BitVec 32))

(declare-fun lt!92704 () (_ BitVec 32))

(assert (=> d!55339 (= lt!92705 (bvmul (bvxor lt!92704 (bvlshr lt!92704 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55339 (= lt!92704 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55339 (and (bvsge (mask!8965 thiss!1248) #b00000000000000000000000000000000) (let ((res!88658 (let ((h!3004 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20303 (bvmul (bvxor h!3004 (bvlshr h!3004 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20303 (bvlshr x!20303 #b00000000000000000000000000001101)) (mask!8965 thiss!1248)))))) (and (bvslt res!88658 (bvadd (mask!8965 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!88658 #b00000000000000000000000000000000))))))

(assert (=> d!55339 (= (toIndex!0 key!828 (mask!8965 thiss!1248)) (bvand (bvxor lt!92705 (bvlshr lt!92705 #b00000000000000000000000000001101)) (mask!8965 thiss!1248)))))

(assert (=> d!55263 d!55339))

(assert (=> d!55263 d!55265))

(declare-fun d!55341 () Bool)

(declare-fun e!123429 () Bool)

(assert (=> d!55341 e!123429))

(declare-fun res!88659 () Bool)

(assert (=> d!55341 (=> res!88659 e!123429)))

(declare-fun lt!92707 () Bool)

(assert (=> d!55341 (= res!88659 (not lt!92707))))

(declare-fun lt!92706 () Bool)

(assert (=> d!55341 (= lt!92707 lt!92706)))

(declare-fun lt!92709 () Unit!5615)

(declare-fun e!123428 () Unit!5615)

(assert (=> d!55341 (= lt!92709 e!123428)))

(declare-fun c!33691 () Bool)

(assert (=> d!55341 (= c!33691 lt!92706)))

(assert (=> d!55341 (= lt!92706 (containsKey!230 (toList!1191 lt!92605) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55341 (= (contains!1297 lt!92605 #b0000000000000000000000000000000000000000000000000000000000000000) lt!92707)))

(declare-fun b!187568 () Bool)

(declare-fun lt!92708 () Unit!5615)

(assert (=> b!187568 (= e!123428 lt!92708)))

(assert (=> b!187568 (= lt!92708 (lemmaContainsKeyImpliesGetValueByKeyDefined!179 (toList!1191 lt!92605) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187568 (isDefined!180 (getValueByKey!226 (toList!1191 lt!92605) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187569 () Bool)

(declare-fun Unit!5625 () Unit!5615)

(assert (=> b!187569 (= e!123428 Unit!5625)))

(declare-fun b!187570 () Bool)

(assert (=> b!187570 (= e!123429 (isDefined!180 (getValueByKey!226 (toList!1191 lt!92605) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55341 c!33691) b!187568))

(assert (= (and d!55341 (not c!33691)) b!187569))

(assert (= (and d!55341 (not res!88659)) b!187570))

(declare-fun m!213897 () Bool)

(assert (=> d!55341 m!213897))

(declare-fun m!213899 () Bool)

(assert (=> b!187568 m!213899))

(assert (=> b!187568 m!213841))

(assert (=> b!187568 m!213841))

(declare-fun m!213901 () Bool)

(assert (=> b!187568 m!213901))

(assert (=> b!187570 m!213841))

(assert (=> b!187570 m!213841))

(assert (=> b!187570 m!213901))

(assert (=> bm!18879 d!55341))

(declare-fun d!55343 () Bool)

(declare-fun e!123430 () Bool)

(assert (=> d!55343 e!123430))

(declare-fun res!88660 () Bool)

(assert (=> d!55343 (=> (not res!88660) (not e!123430))))

(declare-fun lt!92712 () ListLongMap!2351)

(assert (=> d!55343 (= res!88660 (contains!1297 lt!92712 (_1!1732 (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))))

(declare-fun lt!92710 () List!2370)

(assert (=> d!55343 (= lt!92712 (ListLongMap!2352 lt!92710))))

(declare-fun lt!92713 () Unit!5615)

(declare-fun lt!92711 () Unit!5615)

(assert (=> d!55343 (= lt!92713 lt!92711)))

(assert (=> d!55343 (= (getValueByKey!226 lt!92710 (_1!1732 (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))) (Some!231 (_2!1732 (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))))

(assert (=> d!55343 (= lt!92711 (lemmaContainsTupThenGetReturnValue!120 lt!92710 (_1!1732 (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))) (_2!1732 (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))))

(assert (=> d!55343 (= lt!92710 (insertStrictlySorted!123 (toList!1191 (ite c!33643 call!18880 (ite c!33642 call!18886 call!18885))) (_1!1732 (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))) (_2!1732 (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))))))

(assert (=> d!55343 (= (+!288 (ite c!33643 call!18880 (ite c!33642 call!18886 call!18885)) (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))) lt!92712)))

(declare-fun b!187571 () Bool)

(declare-fun res!88661 () Bool)

(assert (=> b!187571 (=> (not res!88661) (not e!123430))))

(assert (=> b!187571 (= res!88661 (= (getValueByKey!226 (toList!1191 lt!92712) (_1!1732 (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248))))) (Some!231 (_2!1732 (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))))

(declare-fun b!187572 () Bool)

(assert (=> b!187572 (= e!123430 (contains!1299 (toList!1191 lt!92712) (ite (or c!33643 c!33642) (tuple2!3443 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3662 thiss!1248)) (tuple2!3443 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3662 thiss!1248)))))))

(assert (= (and d!55343 res!88660) b!187571))

(assert (= (and b!187571 res!88661) b!187572))

(declare-fun m!213903 () Bool)

(assert (=> d!55343 m!213903))

(declare-fun m!213905 () Bool)

(assert (=> d!55343 m!213905))

(declare-fun m!213907 () Bool)

(assert (=> d!55343 m!213907))

(declare-fun m!213909 () Bool)

(assert (=> d!55343 m!213909))

(declare-fun m!213911 () Bool)

(assert (=> b!187571 m!213911))

(declare-fun m!213913 () Bool)

(assert (=> b!187572 m!213913))

(assert (=> bm!18877 d!55343))

(declare-fun bm!18895 () Bool)

(declare-fun call!18898 () (_ BitVec 32))

(assert (=> bm!18895 (= call!18898 (arrayCountValidKeys!0 (_keys!5771 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4073 (_keys!5771 thiss!1248))))))

(declare-fun b!187581 () Bool)

(declare-fun e!123435 () (_ BitVec 32))

(assert (=> b!187581 (= e!123435 (bvadd #b00000000000000000000000000000001 call!18898))))

(declare-fun d!55345 () Bool)

(declare-fun lt!92716 () (_ BitVec 32))

(assert (=> d!55345 (and (bvsge lt!92716 #b00000000000000000000000000000000) (bvsle lt!92716 (bvsub (size!4073 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!123436 () (_ BitVec 32))

(assert (=> d!55345 (= lt!92716 e!123436)))

(declare-fun c!33697 () Bool)

(assert (=> d!55345 (= c!33697 (bvsge #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(assert (=> d!55345 (and (bvsle #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4073 (_keys!5771 thiss!1248)) (size!4073 (_keys!5771 thiss!1248))))))

(assert (=> d!55345 (= (arrayCountValidKeys!0 (_keys!5771 thiss!1248) #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))) lt!92716)))

(declare-fun b!187582 () Bool)

(assert (=> b!187582 (= e!123436 e!123435)))

(declare-fun c!33696 () Bool)

(assert (=> b!187582 (= c!33696 (validKeyInArray!0 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187583 () Bool)

(assert (=> b!187583 (= e!123435 call!18898)))

(declare-fun b!187584 () Bool)

(assert (=> b!187584 (= e!123436 #b00000000000000000000000000000000)))

(assert (= (and d!55345 c!33697) b!187584))

(assert (= (and d!55345 (not c!33697)) b!187582))

(assert (= (and b!187582 c!33696) b!187581))

(assert (= (and b!187582 (not c!33696)) b!187583))

(assert (= (or b!187581 b!187583) bm!18895))

(declare-fun m!213915 () Bool)

(assert (=> bm!18895 m!213915))

(assert (=> b!187582 m!213647))

(assert (=> b!187582 m!213647))

(assert (=> b!187582 m!213651))

(assert (=> b!187276 d!55345))

(declare-fun d!55347 () Bool)

(declare-fun e!123438 () Bool)

(assert (=> d!55347 e!123438))

(declare-fun res!88662 () Bool)

(assert (=> d!55347 (=> res!88662 e!123438)))

(declare-fun lt!92718 () Bool)

(assert (=> d!55347 (= res!88662 (not lt!92718))))

(declare-fun lt!92717 () Bool)

(assert (=> d!55347 (= lt!92718 lt!92717)))

(declare-fun lt!92720 () Unit!5615)

(declare-fun e!123437 () Unit!5615)

(assert (=> d!55347 (= lt!92720 e!123437)))

(declare-fun c!33698 () Bool)

(assert (=> d!55347 (= c!33698 lt!92717)))

(assert (=> d!55347 (= lt!92717 (containsKey!230 (toList!1191 lt!92605) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55347 (= (contains!1297 lt!92605 #b1000000000000000000000000000000000000000000000000000000000000000) lt!92718)))

(declare-fun b!187585 () Bool)

(declare-fun lt!92719 () Unit!5615)

(assert (=> b!187585 (= e!123437 lt!92719)))

(assert (=> b!187585 (= lt!92719 (lemmaContainsKeyImpliesGetValueByKeyDefined!179 (toList!1191 lt!92605) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187585 (isDefined!180 (getValueByKey!226 (toList!1191 lt!92605) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187586 () Bool)

(declare-fun Unit!5626 () Unit!5615)

(assert (=> b!187586 (= e!123437 Unit!5626)))

(declare-fun b!187587 () Bool)

(assert (=> b!187587 (= e!123438 (isDefined!180 (getValueByKey!226 (toList!1191 lt!92605) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55347 c!33698) b!187585))

(assert (= (and d!55347 (not c!33698)) b!187586))

(assert (= (and d!55347 (not res!88662)) b!187587))

(declare-fun m!213917 () Bool)

(assert (=> d!55347 m!213917))

(declare-fun m!213919 () Bool)

(assert (=> b!187585 m!213919))

(assert (=> b!187585 m!213847))

(assert (=> b!187585 m!213847))

(declare-fun m!213921 () Bool)

(assert (=> b!187585 m!213921))

(assert (=> b!187587 m!213847))

(assert (=> b!187587 m!213847))

(assert (=> b!187587 m!213921))

(assert (=> bm!18882 d!55347))

(declare-fun d!55349 () Bool)

(declare-fun res!88671 () Bool)

(declare-fun e!123448 () Bool)

(assert (=> d!55349 (=> res!88671 e!123448)))

(assert (=> d!55349 (= res!88671 (bvsge #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(assert (=> d!55349 (= (arrayNoDuplicates!0 (_keys!5771 thiss!1248) #b00000000000000000000000000000000 Nil!2369) e!123448)))

(declare-fun b!187598 () Bool)

(declare-fun e!123449 () Bool)

(declare-fun contains!1300 (List!2372 (_ BitVec 64)) Bool)

(assert (=> b!187598 (= e!123449 (contains!1300 Nil!2369 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187599 () Bool)

(declare-fun e!123450 () Bool)

(declare-fun e!123447 () Bool)

(assert (=> b!187599 (= e!123450 e!123447)))

(declare-fun c!33701 () Bool)

(assert (=> b!187599 (= c!33701 (validKeyInArray!0 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187600 () Bool)

(assert (=> b!187600 (= e!123448 e!123450)))

(declare-fun res!88669 () Bool)

(assert (=> b!187600 (=> (not res!88669) (not e!123450))))

(assert (=> b!187600 (= res!88669 (not e!123449))))

(declare-fun res!88670 () Bool)

(assert (=> b!187600 (=> (not res!88670) (not e!123449))))

(assert (=> b!187600 (= res!88670 (validKeyInArray!0 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187601 () Bool)

(declare-fun call!18901 () Bool)

(assert (=> b!187601 (= e!123447 call!18901)))

(declare-fun bm!18898 () Bool)

(assert (=> bm!18898 (= call!18901 (arrayNoDuplicates!0 (_keys!5771 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33701 (Cons!2368 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000) Nil!2369) Nil!2369)))))

(declare-fun b!187602 () Bool)

(assert (=> b!187602 (= e!123447 call!18901)))

(assert (= (and d!55349 (not res!88671)) b!187600))

(assert (= (and b!187600 res!88670) b!187598))

(assert (= (and b!187600 res!88669) b!187599))

(assert (= (and b!187599 c!33701) b!187602))

(assert (= (and b!187599 (not c!33701)) b!187601))

(assert (= (or b!187602 b!187601) bm!18898))

(assert (=> b!187598 m!213647))

(assert (=> b!187598 m!213647))

(declare-fun m!213923 () Bool)

(assert (=> b!187598 m!213923))

(assert (=> b!187599 m!213647))

(assert (=> b!187599 m!213647))

(assert (=> b!187599 m!213651))

(assert (=> b!187600 m!213647))

(assert (=> b!187600 m!213647))

(assert (=> b!187600 m!213651))

(assert (=> bm!18898 m!213647))

(declare-fun m!213925 () Bool)

(assert (=> bm!18898 m!213925))

(assert (=> b!187278 d!55349))

(declare-fun d!55351 () Bool)

(assert (=> d!55351 (= (inRange!0 (ite c!33613 (index!4774 lt!92519) (index!4777 lt!92519)) (mask!8965 thiss!1248)) (and (bvsge (ite c!33613 (index!4774 lt!92519) (index!4777 lt!92519)) #b00000000000000000000000000000000) (bvslt (ite c!33613 (index!4774 lt!92519) (index!4777 lt!92519)) (bvadd (mask!8965 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> bm!18861 d!55351))

(declare-fun b!187611 () Bool)

(declare-fun e!123459 () Bool)

(declare-fun call!18904 () Bool)

(assert (=> b!187611 (= e!123459 call!18904)))

(declare-fun bm!18901 () Bool)

(assert (=> bm!18901 (= call!18904 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5771 thiss!1248) (mask!8965 thiss!1248)))))

(declare-fun b!187612 () Bool)

(declare-fun e!123458 () Bool)

(assert (=> b!187612 (= e!123459 e!123458)))

(declare-fun lt!92728 () (_ BitVec 64))

(assert (=> b!187612 (= lt!92728 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92727 () Unit!5615)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7959 (_ BitVec 64) (_ BitVec 32)) Unit!5615)

(assert (=> b!187612 (= lt!92727 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5771 thiss!1248) lt!92728 #b00000000000000000000000000000000))))

(assert (=> b!187612 (arrayContainsKey!0 (_keys!5771 thiss!1248) lt!92728 #b00000000000000000000000000000000)))

(declare-fun lt!92729 () Unit!5615)

(assert (=> b!187612 (= lt!92729 lt!92727)))

(declare-fun res!88677 () Bool)

(assert (=> b!187612 (= res!88677 (= (seekEntryOrOpen!0 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000) (_keys!5771 thiss!1248) (mask!8965 thiss!1248)) (Found!651 #b00000000000000000000000000000000)))))

(assert (=> b!187612 (=> (not res!88677) (not e!123458))))

(declare-fun d!55353 () Bool)

(declare-fun res!88676 () Bool)

(declare-fun e!123457 () Bool)

(assert (=> d!55353 (=> res!88676 e!123457)))

(assert (=> d!55353 (= res!88676 (bvsge #b00000000000000000000000000000000 (size!4073 (_keys!5771 thiss!1248))))))

(assert (=> d!55353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5771 thiss!1248) (mask!8965 thiss!1248)) e!123457)))

(declare-fun b!187613 () Bool)

(assert (=> b!187613 (= e!123457 e!123459)))

(declare-fun c!33704 () Bool)

(assert (=> b!187613 (= c!33704 (validKeyInArray!0 (select (arr!3754 (_keys!5771 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187614 () Bool)

(assert (=> b!187614 (= e!123458 call!18904)))

(assert (= (and d!55353 (not res!88676)) b!187613))

(assert (= (and b!187613 c!33704) b!187612))

(assert (= (and b!187613 (not c!33704)) b!187611))

(assert (= (and b!187612 res!88677) b!187614))

(assert (= (or b!187614 b!187611) bm!18901))

(declare-fun m!213927 () Bool)

(assert (=> bm!18901 m!213927))

(assert (=> b!187612 m!213647))

(declare-fun m!213929 () Bool)

(assert (=> b!187612 m!213929))

(declare-fun m!213931 () Bool)

(assert (=> b!187612 m!213931))

(assert (=> b!187612 m!213647))

(declare-fun m!213933 () Bool)

(assert (=> b!187612 m!213933))

(assert (=> b!187613 m!213647))

(assert (=> b!187613 m!213647))

(assert (=> b!187613 m!213651))

(assert (=> b!187277 d!55353))

(declare-fun b!187615 () Bool)

(declare-fun e!123461 () Bool)

(assert (=> b!187615 (= e!123461 tp_is_empty!4381)))

(declare-fun mapNonEmpty!7557 () Bool)

(declare-fun mapRes!7557 () Bool)

(declare-fun tp!16656 () Bool)

(assert (=> mapNonEmpty!7557 (= mapRes!7557 (and tp!16656 e!123461))))

(declare-fun mapValue!7557 () ValueCell!1847)

(declare-fun mapKey!7557 () (_ BitVec 32))

(declare-fun mapRest!7557 () (Array (_ BitVec 32) ValueCell!1847))

(assert (=> mapNonEmpty!7557 (= mapRest!7556 (store mapRest!7557 mapKey!7557 mapValue!7557))))

(declare-fun b!187616 () Bool)

(declare-fun e!123460 () Bool)

(assert (=> b!187616 (= e!123460 tp_is_empty!4381)))

(declare-fun mapIsEmpty!7557 () Bool)

(assert (=> mapIsEmpty!7557 mapRes!7557))

(declare-fun condMapEmpty!7557 () Bool)

(declare-fun mapDefault!7557 () ValueCell!1847)

(assert (=> mapNonEmpty!7556 (= condMapEmpty!7557 (= mapRest!7556 ((as const (Array (_ BitVec 32) ValueCell!1847)) mapDefault!7557)))))

(assert (=> mapNonEmpty!7556 (= tp!16655 (and e!123460 mapRes!7557))))

(assert (= (and mapNonEmpty!7556 condMapEmpty!7557) mapIsEmpty!7557))

(assert (= (and mapNonEmpty!7556 (not condMapEmpty!7557)) mapNonEmpty!7557))

(assert (= (and mapNonEmpty!7557 ((_ is ValueCellFull!1847) mapValue!7557)) b!187615))

(assert (= (and mapNonEmpty!7556 ((_ is ValueCellFull!1847) mapDefault!7557)) b!187616))

(declare-fun m!213935 () Bool)

(assert (=> mapNonEmpty!7557 m!213935))

(declare-fun b_lambda!7277 () Bool)

(assert (= b_lambda!7275 (or (and b!187178 b_free!4609) b_lambda!7277)))

(declare-fun b_lambda!7279 () Bool)

(assert (= b_lambda!7273 (or (and b!187178 b_free!4609) b_lambda!7279)))

(check-sat (not d!55319) (not b!187454) (not bm!18891) (not b!187433) (not d!55347) (not d!55273) (not b!187612) (not d!55281) (not bm!18892) (not b!187447) (not d!55291) (not b!187393) (not d!55295) (not b!187598) (not b!187444) (not b!187570) (not b!187539) (not d!55341) (not b!187613) (not d!55327) (not d!55343) (not b!187585) (not d!55293) (not d!55309) (not b!187472) (not b!187537) (not d!55313) (not d!55305) (not b!187430) (not b!187572) (not d!55329) (not b!187478) (not b!187536) (not d!55335) (not d!55303) (not d!55307) (not b!187587) (not b!187391) (not d!55285) (not d!55337) (not b!187448) (not b!187390) (not b!187493) (not b!187424) (not b!187428) (not b!187560) (not d!55325) (not b!187540) (not d!55279) (not b!187426) (not b!187477) (not mapNonEmpty!7557) (not d!55301) (not b!187600) (not b!187582) (not bm!18898) (not b!187599) (not b!187571) (not b_lambda!7277) (not b!187568) (not d!55287) (not d!55299) (not b!187449) (not b!187451) (not b_next!4609) (not b!187465) b_and!11211 (not d!55317) (not bm!18901) (not b!187399) (not d!55297) (not d!55275) (not b_lambda!7279) (not b!187501) (not d!55277) (not b!187398) (not b!187445) (not d!55289) (not b!187437) (not d!55331) (not bm!18886) (not d!55283) (not b!187436) (not b!187427) tp_is_empty!4381 (not b!187434) (not b_lambda!7271) (not b!187435) (not bm!18895))
(check-sat b_and!11211 (not b_next!4609))
