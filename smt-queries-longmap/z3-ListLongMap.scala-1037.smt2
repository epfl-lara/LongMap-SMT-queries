; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21906 () Bool)

(assert start!21906)

(declare-fun b!222249 () Bool)

(declare-fun b_free!5973 () Bool)

(declare-fun b_next!5973 () Bool)

(assert (=> b!222249 (= b_free!5973 (not b_next!5973))))

(declare-fun tp!21060 () Bool)

(declare-fun b_and!12871 () Bool)

(assert (=> b!222249 (= tp!21060 b_and!12871)))

(declare-fun b!222244 () Bool)

(declare-fun e!144429 () Bool)

(declare-fun tp_is_empty!5835 () Bool)

(assert (=> b!222244 (= e!144429 tp_is_empty!5835)))

(declare-fun b!222245 () Bool)

(declare-datatypes ((Unit!6656 0))(
  ( (Unit!6657) )
))
(declare-fun e!144432 () Unit!6656)

(declare-fun Unit!6658 () Unit!6656)

(assert (=> b!222245 (= e!144432 Unit!6658)))

(declare-fun lt!112610 () Unit!6656)

(declare-datatypes ((V!7427 0))(
  ( (V!7428 (val!2962 Int)) )
))
(declare-datatypes ((ValueCell!2574 0))(
  ( (ValueCellFull!2574 (v!4982 V!7427)) (EmptyCell!2574) )
))
(declare-datatypes ((array!10913 0))(
  ( (array!10914 (arr!5176 (Array (_ BitVec 32) ValueCell!2574)) (size!5509 (_ BitVec 32))) )
))
(declare-datatypes ((array!10915 0))(
  ( (array!10916 (arr!5177 (Array (_ BitVec 32) (_ BitVec 64))) (size!5510 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3048 0))(
  ( (LongMapFixedSize!3049 (defaultEntry!4183 Int) (mask!10001 (_ BitVec 32)) (extraKeys!3920 (_ BitVec 32)) (zeroValue!4024 V!7427) (minValue!4024 V!7427) (_size!1573 (_ BitVec 32)) (_keys!6237 array!10915) (_values!4166 array!10913) (_vacant!1573 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3048)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!223 (array!10915 array!10913 (_ BitVec 32) (_ BitVec 32) V!7427 V!7427 (_ BitVec 64) Int) Unit!6656)

(assert (=> b!222245 (= lt!112610 (lemmaInListMapThenSeekEntryOrOpenFindsIt!223 (_keys!6237 thiss!1504) (_values!4166 thiss!1504) (mask!10001 thiss!1504) (extraKeys!3920 thiss!1504) (zeroValue!4024 thiss!1504) (minValue!4024 thiss!1504) key!932 (defaultEntry!4183 thiss!1504)))))

(assert (=> b!222245 false))

(declare-fun b!222246 () Bool)

(declare-fun c!36935 () Bool)

(declare-datatypes ((SeekEntryResult!835 0))(
  ( (MissingZero!835 (index!5510 (_ BitVec 32))) (Found!835 (index!5511 (_ BitVec 32))) (Intermediate!835 (undefined!1647 Bool) (index!5512 (_ BitVec 32)) (x!23047 (_ BitVec 32))) (Undefined!835) (MissingVacant!835 (index!5513 (_ BitVec 32))) )
))
(declare-fun lt!112609 () SeekEntryResult!835)

(get-info :version)

(assert (=> b!222246 (= c!36935 ((_ is MissingVacant!835) lt!112609))))

(declare-fun e!144430 () Bool)

(declare-fun e!144440 () Bool)

(assert (=> b!222246 (= e!144430 e!144440)))

(declare-fun b!222247 () Bool)

(declare-fun res!109099 () Bool)

(assert (=> b!222247 (= res!109099 (= (select (arr!5177 (_keys!6237 thiss!1504)) (index!5513 lt!112609)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!144426 () Bool)

(assert (=> b!222247 (=> (not res!109099) (not e!144426))))

(declare-fun b!222248 () Bool)

(assert (=> b!222248 (= e!144440 e!144426)))

(declare-fun res!109102 () Bool)

(declare-fun call!20754 () Bool)

(assert (=> b!222248 (= res!109102 call!20754)))

(assert (=> b!222248 (=> (not res!109102) (not e!144426))))

(declare-fun e!144427 () Bool)

(declare-fun e!144442 () Bool)

(declare-fun array_inv!3427 (array!10915) Bool)

(declare-fun array_inv!3428 (array!10913) Bool)

(assert (=> b!222249 (= e!144427 (and tp!21060 tp_is_empty!5835 (array_inv!3427 (_keys!6237 thiss!1504)) (array_inv!3428 (_values!4166 thiss!1504)) e!144442))))

(declare-fun b!222250 () Bool)

(declare-fun e!144428 () Bool)

(declare-fun call!20753 () Bool)

(assert (=> b!222250 (= e!144428 (not call!20753))))

(declare-fun res!109095 () Bool)

(declare-fun e!144443 () Bool)

(assert (=> start!21906 (=> (not res!109095) (not e!144443))))

(declare-fun valid!1230 (LongMapFixedSize!3048) Bool)

(assert (=> start!21906 (= res!109095 (valid!1230 thiss!1504))))

(assert (=> start!21906 e!144443))

(assert (=> start!21906 e!144427))

(assert (=> start!21906 true))

(declare-fun b!222251 () Bool)

(declare-fun res!109090 () Bool)

(assert (=> b!222251 (=> (not res!109090) (not e!144428))))

(assert (=> b!222251 (= res!109090 (= (select (arr!5177 (_keys!6237 thiss!1504)) (index!5510 lt!112609)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!222252 () Bool)

(declare-fun e!144435 () Bool)

(assert (=> b!222252 (= e!144435 false)))

(declare-fun lt!112608 () Bool)

(declare-datatypes ((List!3301 0))(
  ( (Nil!3298) (Cons!3297 (h!3945 (_ BitVec 64)) (t!8260 List!3301)) )
))
(declare-fun arrayNoDuplicates!0 (array!10915 (_ BitVec 32) List!3301) Bool)

(assert (=> b!222252 (= lt!112608 (arrayNoDuplicates!0 (_keys!6237 thiss!1504) #b00000000000000000000000000000000 Nil!3298))))

(declare-fun bm!20750 () Bool)

(declare-fun c!36936 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20750 (= call!20754 (inRange!0 (ite c!36936 (index!5510 lt!112609) (index!5513 lt!112609)) (mask!10001 thiss!1504)))))

(declare-fun b!222253 () Bool)

(declare-fun e!144436 () Unit!6656)

(declare-fun Unit!6659 () Unit!6656)

(assert (=> b!222253 (= e!144436 Unit!6659)))

(declare-fun b!222254 () Bool)

(declare-fun res!109105 () Bool)

(assert (=> b!222254 (=> (not res!109105) (not e!144428))))

(assert (=> b!222254 (= res!109105 call!20754)))

(assert (=> b!222254 (= e!144430 e!144428)))

(declare-fun b!222255 () Bool)

(declare-fun e!144439 () Bool)

(declare-fun e!144431 () Bool)

(assert (=> b!222255 (= e!144439 e!144431)))

(declare-fun res!109092 () Bool)

(assert (=> b!222255 (=> (not res!109092) (not e!144431))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!222255 (= res!109092 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!222256 () Bool)

(assert (=> b!222256 (= e!144426 (not call!20753))))

(declare-fun b!222257 () Bool)

(declare-fun e!144441 () Bool)

(assert (=> b!222257 (= e!144443 e!144441)))

(declare-fun res!109097 () Bool)

(assert (=> b!222257 (=> (not res!109097) (not e!144441))))

(assert (=> b!222257 (= res!109097 (or (= lt!112609 (MissingZero!835 index!297)) (= lt!112609 (MissingVacant!835 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10915 (_ BitVec 32)) SeekEntryResult!835)

(assert (=> b!222257 (= lt!112609 (seekEntryOrOpen!0 key!932 (_keys!6237 thiss!1504) (mask!10001 thiss!1504)))))

(declare-fun b!222258 () Bool)

(declare-fun mapRes!9922 () Bool)

(assert (=> b!222258 (= e!144442 (and e!144429 mapRes!9922))))

(declare-fun condMapEmpty!9922 () Bool)

(declare-fun mapDefault!9922 () ValueCell!2574)

(assert (=> b!222258 (= condMapEmpty!9922 (= (arr!5176 (_values!4166 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2574)) mapDefault!9922)))))

(declare-fun b!222259 () Bool)

(declare-fun e!144437 () Bool)

(assert (=> b!222259 (= e!144437 e!144435)))

(declare-fun res!109098 () Bool)

(assert (=> b!222259 (=> (not res!109098) (not e!144435))))

(assert (=> b!222259 (= res!109098 (and (bvslt (size!5510 (_keys!6237 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5510 (_keys!6237 thiss!1504)))))))

(declare-fun lt!112605 () Unit!6656)

(assert (=> b!222259 (= lt!112605 e!144436)))

(declare-fun c!36934 () Bool)

(declare-fun arrayContainsKey!0 (array!10915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222259 (= c!36934 (arrayContainsKey!0 (_keys!6237 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222260 () Bool)

(declare-fun lt!112604 () Unit!6656)

(assert (=> b!222260 (= e!144432 lt!112604)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!234 (array!10915 array!10913 (_ BitVec 32) (_ BitVec 32) V!7427 V!7427 (_ BitVec 64) Int) Unit!6656)

(assert (=> b!222260 (= lt!112604 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!234 (_keys!6237 thiss!1504) (_values!4166 thiss!1504) (mask!10001 thiss!1504) (extraKeys!3920 thiss!1504) (zeroValue!4024 thiss!1504) (minValue!4024 thiss!1504) key!932 (defaultEntry!4183 thiss!1504)))))

(assert (=> b!222260 (= c!36936 ((_ is MissingZero!835) lt!112609))))

(assert (=> b!222260 e!144430))

(declare-fun b!222261 () Bool)

(declare-fun res!109094 () Bool)

(assert (=> b!222261 (=> (not res!109094) (not e!144435))))

(declare-fun contains!1521 (List!3301 (_ BitVec 64)) Bool)

(assert (=> b!222261 (= res!109094 (not (contains!1521 Nil!3298 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!222262 () Bool)

(assert (=> b!222262 (= e!144441 e!144437)))

(declare-fun res!109100 () Bool)

(assert (=> b!222262 (=> (not res!109100) (not e!144437))))

(assert (=> b!222262 (= res!109100 (inRange!0 index!297 (mask!10001 thiss!1504)))))

(declare-fun lt!112607 () Unit!6656)

(assert (=> b!222262 (= lt!112607 e!144432)))

(declare-fun c!36933 () Bool)

(declare-datatypes ((tuple2!4398 0))(
  ( (tuple2!4399 (_1!2210 (_ BitVec 64)) (_2!2210 V!7427)) )
))
(declare-datatypes ((List!3302 0))(
  ( (Nil!3299) (Cons!3298 (h!3946 tuple2!4398) (t!8261 List!3302)) )
))
(declare-datatypes ((ListLongMap!3311 0))(
  ( (ListLongMap!3312 (toList!1671 List!3302)) )
))
(declare-fun contains!1522 (ListLongMap!3311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1199 (array!10915 array!10913 (_ BitVec 32) (_ BitVec 32) V!7427 V!7427 (_ BitVec 32) Int) ListLongMap!3311)

(assert (=> b!222262 (= c!36933 (contains!1522 (getCurrentListMap!1199 (_keys!6237 thiss!1504) (_values!4166 thiss!1504) (mask!10001 thiss!1504) (extraKeys!3920 thiss!1504) (zeroValue!4024 thiss!1504) (minValue!4024 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4183 thiss!1504)) key!932))))

(declare-fun b!222263 () Bool)

(declare-fun res!109104 () Bool)

(assert (=> b!222263 (=> (not res!109104) (not e!144435))))

(assert (=> b!222263 (= res!109104 (not (contains!1521 Nil!3298 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!9922 () Bool)

(declare-fun tp!21061 () Bool)

(declare-fun e!144433 () Bool)

(assert (=> mapNonEmpty!9922 (= mapRes!9922 (and tp!21061 e!144433))))

(declare-fun mapKey!9922 () (_ BitVec 32))

(declare-fun mapRest!9922 () (Array (_ BitVec 32) ValueCell!2574))

(declare-fun mapValue!9922 () ValueCell!2574)

(assert (=> mapNonEmpty!9922 (= (arr!5176 (_values!4166 thiss!1504)) (store mapRest!9922 mapKey!9922 mapValue!9922))))

(declare-fun mapIsEmpty!9922 () Bool)

(assert (=> mapIsEmpty!9922 mapRes!9922))

(declare-fun b!222264 () Bool)

(declare-fun Unit!6660 () Unit!6656)

(assert (=> b!222264 (= e!144436 Unit!6660)))

(declare-fun lt!112606 () Unit!6656)

(declare-fun lemmaArrayContainsKeyThenInListMap!59 (array!10915 array!10913 (_ BitVec 32) (_ BitVec 32) V!7427 V!7427 (_ BitVec 64) (_ BitVec 32) Int) Unit!6656)

(assert (=> b!222264 (= lt!112606 (lemmaArrayContainsKeyThenInListMap!59 (_keys!6237 thiss!1504) (_values!4166 thiss!1504) (mask!10001 thiss!1504) (extraKeys!3920 thiss!1504) (zeroValue!4024 thiss!1504) (minValue!4024 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4183 thiss!1504)))))

(assert (=> b!222264 false))

(declare-fun b!222265 () Bool)

(declare-fun res!109101 () Bool)

(assert (=> b!222265 (=> (not res!109101) (not e!144435))))

(declare-fun noDuplicate!69 (List!3301) Bool)

(assert (=> b!222265 (= res!109101 (noDuplicate!69 Nil!3298))))

(declare-fun b!222266 () Bool)

(assert (=> b!222266 (= e!144431 (not (contains!1521 Nil!3298 key!932)))))

(declare-fun b!222267 () Bool)

(assert (=> b!222267 (= e!144433 tp_is_empty!5835)))

(declare-fun b!222268 () Bool)

(declare-fun e!144438 () Bool)

(assert (=> b!222268 (= e!144438 (contains!1521 Nil!3298 key!932))))

(declare-fun b!222269 () Bool)

(declare-fun res!109091 () Bool)

(assert (=> b!222269 (=> (not res!109091) (not e!144443))))

(assert (=> b!222269 (= res!109091 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!222270 () Bool)

(declare-fun res!109103 () Bool)

(assert (=> b!222270 (=> (not res!109103) (not e!144435))))

(assert (=> b!222270 (= res!109103 e!144439)))

(declare-fun res!109093 () Bool)

(assert (=> b!222270 (=> res!109093 e!144439)))

(assert (=> b!222270 (= res!109093 e!144438)))

(declare-fun res!109096 () Bool)

(assert (=> b!222270 (=> (not res!109096) (not e!144438))))

(assert (=> b!222270 (= res!109096 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun bm!20751 () Bool)

(assert (=> bm!20751 (= call!20753 (arrayContainsKey!0 (_keys!6237 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!222271 () Bool)

(assert (=> b!222271 (= e!144440 ((_ is Undefined!835) lt!112609))))

(assert (= (and start!21906 res!109095) b!222269))

(assert (= (and b!222269 res!109091) b!222257))

(assert (= (and b!222257 res!109097) b!222262))

(assert (= (and b!222262 c!36933) b!222245))

(assert (= (and b!222262 (not c!36933)) b!222260))

(assert (= (and b!222260 c!36936) b!222254))

(assert (= (and b!222260 (not c!36936)) b!222246))

(assert (= (and b!222254 res!109105) b!222251))

(assert (= (and b!222251 res!109090) b!222250))

(assert (= (and b!222246 c!36935) b!222248))

(assert (= (and b!222246 (not c!36935)) b!222271))

(assert (= (and b!222248 res!109102) b!222247))

(assert (= (and b!222247 res!109099) b!222256))

(assert (= (or b!222254 b!222248) bm!20750))

(assert (= (or b!222250 b!222256) bm!20751))

(assert (= (and b!222262 res!109100) b!222259))

(assert (= (and b!222259 c!36934) b!222264))

(assert (= (and b!222259 (not c!36934)) b!222253))

(assert (= (and b!222259 res!109098) b!222265))

(assert (= (and b!222265 res!109101) b!222261))

(assert (= (and b!222261 res!109094) b!222263))

(assert (= (and b!222263 res!109104) b!222270))

(assert (= (and b!222270 res!109096) b!222268))

(assert (= (and b!222270 (not res!109093)) b!222255))

(assert (= (and b!222255 res!109092) b!222266))

(assert (= (and b!222270 res!109103) b!222252))

(assert (= (and b!222258 condMapEmpty!9922) mapIsEmpty!9922))

(assert (= (and b!222258 (not condMapEmpty!9922)) mapNonEmpty!9922))

(assert (= (and mapNonEmpty!9922 ((_ is ValueCellFull!2574) mapValue!9922)) b!222267))

(assert (= (and b!222258 ((_ is ValueCellFull!2574) mapDefault!9922)) b!222244))

(assert (= b!222249 b!222258))

(assert (= start!21906 b!222249))

(declare-fun m!246465 () Bool)

(assert (=> b!222259 m!246465))

(assert (=> bm!20751 m!246465))

(declare-fun m!246467 () Bool)

(assert (=> b!222245 m!246467))

(declare-fun m!246469 () Bool)

(assert (=> b!222257 m!246469))

(declare-fun m!246471 () Bool)

(assert (=> b!222265 m!246471))

(declare-fun m!246473 () Bool)

(assert (=> b!222268 m!246473))

(declare-fun m!246475 () Bool)

(assert (=> b!222252 m!246475))

(declare-fun m!246477 () Bool)

(assert (=> b!222264 m!246477))

(declare-fun m!246479 () Bool)

(assert (=> b!222263 m!246479))

(declare-fun m!246481 () Bool)

(assert (=> b!222262 m!246481))

(declare-fun m!246483 () Bool)

(assert (=> b!222262 m!246483))

(assert (=> b!222262 m!246483))

(declare-fun m!246485 () Bool)

(assert (=> b!222262 m!246485))

(declare-fun m!246487 () Bool)

(assert (=> bm!20750 m!246487))

(declare-fun m!246489 () Bool)

(assert (=> mapNonEmpty!9922 m!246489))

(assert (=> b!222266 m!246473))

(declare-fun m!246491 () Bool)

(assert (=> start!21906 m!246491))

(declare-fun m!246493 () Bool)

(assert (=> b!222261 m!246493))

(declare-fun m!246495 () Bool)

(assert (=> b!222251 m!246495))

(declare-fun m!246497 () Bool)

(assert (=> b!222247 m!246497))

(declare-fun m!246499 () Bool)

(assert (=> b!222260 m!246499))

(declare-fun m!246501 () Bool)

(assert (=> b!222249 m!246501))

(declare-fun m!246503 () Bool)

(assert (=> b!222249 m!246503))

(check-sat (not b!222265) (not bm!20750) tp_is_empty!5835 (not mapNonEmpty!9922) (not b!222260) (not b!222263) (not b!222266) (not start!21906) (not b!222262) (not b!222245) (not bm!20751) (not b_next!5973) (not b!222261) (not b!222252) (not b!222264) (not b!222259) b_and!12871 (not b!222249) (not b!222257) (not b!222268))
(check-sat b_and!12871 (not b_next!5973))
