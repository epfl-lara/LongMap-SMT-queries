; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80642 () Bool)

(assert start!80642)

(declare-fun b!946285 () Bool)

(declare-fun b_free!18135 () Bool)

(declare-fun b_next!18135 () Bool)

(assert (=> b!946285 (= b_free!18135 (not b_next!18135))))

(declare-fun tp!62942 () Bool)

(declare-fun b_and!29557 () Bool)

(assert (=> b!946285 (= tp!62942 b_and!29557)))

(declare-fun mapNonEmpty!32818 () Bool)

(declare-fun mapRes!32818 () Bool)

(declare-fun tp!62943 () Bool)

(declare-fun e!532409 () Bool)

(assert (=> mapNonEmpty!32818 (= mapRes!32818 (and tp!62943 e!532409))))

(declare-datatypes ((V!32489 0))(
  ( (V!32490 (val!10372 Int)) )
))
(declare-datatypes ((ValueCell!9840 0))(
  ( (ValueCellFull!9840 (v!12906 V!32489)) (EmptyCell!9840) )
))
(declare-fun mapRest!32818 () (Array (_ BitVec 32) ValueCell!9840))

(declare-fun mapValue!32818 () ValueCell!9840)

(declare-datatypes ((array!57270 0))(
  ( (array!57271 (arr!27552 (Array (_ BitVec 32) ValueCell!9840)) (size!28022 (_ BitVec 32))) )
))
(declare-datatypes ((array!57272 0))(
  ( (array!57273 (arr!27553 (Array (_ BitVec 32) (_ BitVec 64))) (size!28023 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4830 0))(
  ( (LongMapFixedSize!4831 (defaultEntry!5712 Int) (mask!27409 (_ BitVec 32)) (extraKeys!5444 (_ BitVec 32)) (zeroValue!5548 V!32489) (minValue!5548 V!32489) (_size!2470 (_ BitVec 32)) (_keys!10604 array!57272) (_values!5735 array!57270) (_vacant!2470 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4830)

(declare-fun mapKey!32818 () (_ BitVec 32))

(assert (=> mapNonEmpty!32818 (= (arr!27552 (_values!5735 thiss!1141)) (store mapRest!32818 mapKey!32818 mapValue!32818))))

(declare-fun mapIsEmpty!32818 () Bool)

(assert (=> mapIsEmpty!32818 mapRes!32818))

(declare-fun b!946280 () Bool)

(declare-fun tp_is_empty!20643 () Bool)

(assert (=> b!946280 (= e!532409 tp_is_empty!20643)))

(declare-fun b!946281 () Bool)

(declare-fun res!635307 () Bool)

(declare-fun e!532412 () Bool)

(assert (=> b!946281 (=> (not res!635307) (not e!532412))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946281 (= res!635307 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946282 () Bool)

(declare-fun e!532410 () Bool)

(assert (=> b!946282 (= e!532412 e!532410)))

(declare-fun res!635308 () Bool)

(assert (=> b!946282 (=> (not res!635308) (not e!532410))))

(declare-datatypes ((SeekEntryResult!9100 0))(
  ( (MissingZero!9100 (index!38771 (_ BitVec 32))) (Found!9100 (index!38772 (_ BitVec 32))) (Intermediate!9100 (undefined!9912 Bool) (index!38773 (_ BitVec 32)) (x!81361 (_ BitVec 32))) (Undefined!9100) (MissingVacant!9100 (index!38774 (_ BitVec 32))) )
))
(declare-fun lt!426246 () SeekEntryResult!9100)

(get-info :version)

(assert (=> b!946282 (= res!635308 ((_ is Found!9100) lt!426246))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57272 (_ BitVec 32)) SeekEntryResult!9100)

(assert (=> b!946282 (= lt!426246 (seekEntry!0 key!756 (_keys!10604 thiss!1141) (mask!27409 thiss!1141)))))

(declare-fun b!946283 () Bool)

(declare-fun e!532408 () Bool)

(assert (=> b!946283 (= e!532408 (or (not (= (size!28022 (_values!5735 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27409 thiss!1141)))) (= (size!28023 (_keys!10604 thiss!1141)) (size!28022 (_values!5735 thiss!1141)))))))

(declare-fun b!946284 () Bool)

(assert (=> b!946284 (= e!532410 (not e!532408))))

(declare-fun res!635305 () Bool)

(assert (=> b!946284 (=> res!635305 e!532408)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946284 (= res!635305 (not (validMask!0 (mask!27409 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946284 (arrayContainsKey!0 (_keys!10604 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31900 0))(
  ( (Unit!31901) )
))
(declare-fun lt!426245 () Unit!31900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57272 (_ BitVec 64) (_ BitVec 32)) Unit!31900)

(assert (=> b!946284 (= lt!426245 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10604 thiss!1141) key!756 (index!38772 lt!426246)))))

(declare-fun res!635306 () Bool)

(assert (=> start!80642 (=> (not res!635306) (not e!532412))))

(declare-fun valid!1843 (LongMapFixedSize!4830) Bool)

(assert (=> start!80642 (= res!635306 (valid!1843 thiss!1141))))

(assert (=> start!80642 e!532412))

(declare-fun e!532407 () Bool)

(assert (=> start!80642 e!532407))

(assert (=> start!80642 true))

(declare-fun e!532405 () Bool)

(declare-fun array_inv!21396 (array!57272) Bool)

(declare-fun array_inv!21397 (array!57270) Bool)

(assert (=> b!946285 (= e!532407 (and tp!62942 tp_is_empty!20643 (array_inv!21396 (_keys!10604 thiss!1141)) (array_inv!21397 (_values!5735 thiss!1141)) e!532405))))

(declare-fun b!946286 () Bool)

(declare-fun e!532406 () Bool)

(assert (=> b!946286 (= e!532406 tp_is_empty!20643)))

(declare-fun b!946287 () Bool)

(assert (=> b!946287 (= e!532405 (and e!532406 mapRes!32818))))

(declare-fun condMapEmpty!32818 () Bool)

(declare-fun mapDefault!32818 () ValueCell!9840)

(assert (=> b!946287 (= condMapEmpty!32818 (= (arr!27552 (_values!5735 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9840)) mapDefault!32818)))))

(assert (= (and start!80642 res!635306) b!946281))

(assert (= (and b!946281 res!635307) b!946282))

(assert (= (and b!946282 res!635308) b!946284))

(assert (= (and b!946284 (not res!635305)) b!946283))

(assert (= (and b!946287 condMapEmpty!32818) mapIsEmpty!32818))

(assert (= (and b!946287 (not condMapEmpty!32818)) mapNonEmpty!32818))

(assert (= (and mapNonEmpty!32818 ((_ is ValueCellFull!9840) mapValue!32818)) b!946280))

(assert (= (and b!946287 ((_ is ValueCellFull!9840) mapDefault!32818)) b!946286))

(assert (= b!946285 b!946287))

(assert (= start!80642 b!946285))

(declare-fun m!879727 () Bool)

(assert (=> mapNonEmpty!32818 m!879727))

(declare-fun m!879729 () Bool)

(assert (=> b!946284 m!879729))

(declare-fun m!879731 () Bool)

(assert (=> b!946284 m!879731))

(declare-fun m!879733 () Bool)

(assert (=> b!946284 m!879733))

(declare-fun m!879735 () Bool)

(assert (=> start!80642 m!879735))

(declare-fun m!879737 () Bool)

(assert (=> b!946282 m!879737))

(declare-fun m!879739 () Bool)

(assert (=> b!946285 m!879739))

(declare-fun m!879741 () Bool)

(assert (=> b!946285 m!879741))

(check-sat (not start!80642) (not mapNonEmpty!32818) tp_is_empty!20643 (not b!946282) (not b!946285) b_and!29557 (not b!946284) (not b_next!18135))
(check-sat b_and!29557 (not b_next!18135))
(get-model)

(declare-fun d!114513 () Bool)

(assert (=> d!114513 (= (validMask!0 (mask!27409 thiss!1141)) (and (or (= (mask!27409 thiss!1141) #b00000000000000000000000000000111) (= (mask!27409 thiss!1141) #b00000000000000000000000000001111) (= (mask!27409 thiss!1141) #b00000000000000000000000000011111) (= (mask!27409 thiss!1141) #b00000000000000000000000000111111) (= (mask!27409 thiss!1141) #b00000000000000000000000001111111) (= (mask!27409 thiss!1141) #b00000000000000000000000011111111) (= (mask!27409 thiss!1141) #b00000000000000000000000111111111) (= (mask!27409 thiss!1141) #b00000000000000000000001111111111) (= (mask!27409 thiss!1141) #b00000000000000000000011111111111) (= (mask!27409 thiss!1141) #b00000000000000000000111111111111) (= (mask!27409 thiss!1141) #b00000000000000000001111111111111) (= (mask!27409 thiss!1141) #b00000000000000000011111111111111) (= (mask!27409 thiss!1141) #b00000000000000000111111111111111) (= (mask!27409 thiss!1141) #b00000000000000001111111111111111) (= (mask!27409 thiss!1141) #b00000000000000011111111111111111) (= (mask!27409 thiss!1141) #b00000000000000111111111111111111) (= (mask!27409 thiss!1141) #b00000000000001111111111111111111) (= (mask!27409 thiss!1141) #b00000000000011111111111111111111) (= (mask!27409 thiss!1141) #b00000000000111111111111111111111) (= (mask!27409 thiss!1141) #b00000000001111111111111111111111) (= (mask!27409 thiss!1141) #b00000000011111111111111111111111) (= (mask!27409 thiss!1141) #b00000000111111111111111111111111) (= (mask!27409 thiss!1141) #b00000001111111111111111111111111) (= (mask!27409 thiss!1141) #b00000011111111111111111111111111) (= (mask!27409 thiss!1141) #b00000111111111111111111111111111) (= (mask!27409 thiss!1141) #b00001111111111111111111111111111) (= (mask!27409 thiss!1141) #b00011111111111111111111111111111) (= (mask!27409 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27409 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946284 d!114513))

(declare-fun d!114515 () Bool)

(declare-fun res!635325 () Bool)

(declare-fun e!532441 () Bool)

(assert (=> d!114515 (=> res!635325 e!532441)))

(assert (=> d!114515 (= res!635325 (= (select (arr!27553 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114515 (= (arrayContainsKey!0 (_keys!10604 thiss!1141) key!756 #b00000000000000000000000000000000) e!532441)))

(declare-fun b!946316 () Bool)

(declare-fun e!532442 () Bool)

(assert (=> b!946316 (= e!532441 e!532442)))

(declare-fun res!635326 () Bool)

(assert (=> b!946316 (=> (not res!635326) (not e!532442))))

(assert (=> b!946316 (= res!635326 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28023 (_keys!10604 thiss!1141))))))

(declare-fun b!946317 () Bool)

(assert (=> b!946317 (= e!532442 (arrayContainsKey!0 (_keys!10604 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114515 (not res!635325)) b!946316))

(assert (= (and b!946316 res!635326) b!946317))

(declare-fun m!879759 () Bool)

(assert (=> d!114515 m!879759))

(declare-fun m!879761 () Bool)

(assert (=> b!946317 m!879761))

(assert (=> b!946284 d!114515))

(declare-fun d!114517 () Bool)

(assert (=> d!114517 (arrayContainsKey!0 (_keys!10604 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426255 () Unit!31900)

(declare-fun choose!13 (array!57272 (_ BitVec 64) (_ BitVec 32)) Unit!31900)

(assert (=> d!114517 (= lt!426255 (choose!13 (_keys!10604 thiss!1141) key!756 (index!38772 lt!426246)))))

(assert (=> d!114517 (bvsge (index!38772 lt!426246) #b00000000000000000000000000000000)))

(assert (=> d!114517 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10604 thiss!1141) key!756 (index!38772 lt!426246)) lt!426255)))

(declare-fun bs!26601 () Bool)

(assert (= bs!26601 d!114517))

(assert (=> bs!26601 m!879731))

(declare-fun m!879763 () Bool)

(assert (=> bs!26601 m!879763))

(assert (=> b!946284 d!114517))

(declare-fun d!114519 () Bool)

(assert (=> d!114519 (= (array_inv!21396 (_keys!10604 thiss!1141)) (bvsge (size!28023 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946285 d!114519))

(declare-fun d!114521 () Bool)

(assert (=> d!114521 (= (array_inv!21397 (_values!5735 thiss!1141)) (bvsge (size!28022 (_values!5735 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946285 d!114521))

(declare-fun d!114523 () Bool)

(declare-fun res!635333 () Bool)

(declare-fun e!532445 () Bool)

(assert (=> d!114523 (=> (not res!635333) (not e!532445))))

(declare-fun simpleValid!357 (LongMapFixedSize!4830) Bool)

(assert (=> d!114523 (= res!635333 (simpleValid!357 thiss!1141))))

(assert (=> d!114523 (= (valid!1843 thiss!1141) e!532445)))

(declare-fun b!946324 () Bool)

(declare-fun res!635334 () Bool)

(assert (=> b!946324 (=> (not res!635334) (not e!532445))))

(declare-fun arrayCountValidKeys!0 (array!57272 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946324 (= res!635334 (= (arrayCountValidKeys!0 (_keys!10604 thiss!1141) #b00000000000000000000000000000000 (size!28023 (_keys!10604 thiss!1141))) (_size!2470 thiss!1141)))))

(declare-fun b!946325 () Bool)

(declare-fun res!635335 () Bool)

(assert (=> b!946325 (=> (not res!635335) (not e!532445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57272 (_ BitVec 32)) Bool)

(assert (=> b!946325 (= res!635335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10604 thiss!1141) (mask!27409 thiss!1141)))))

(declare-fun b!946326 () Bool)

(declare-datatypes ((List!19297 0))(
  ( (Nil!19294) (Cons!19293 (h!20446 (_ BitVec 64)) (t!27618 List!19297)) )
))
(declare-fun arrayNoDuplicates!0 (array!57272 (_ BitVec 32) List!19297) Bool)

(assert (=> b!946326 (= e!532445 (arrayNoDuplicates!0 (_keys!10604 thiss!1141) #b00000000000000000000000000000000 Nil!19294))))

(assert (= (and d!114523 res!635333) b!946324))

(assert (= (and b!946324 res!635334) b!946325))

(assert (= (and b!946325 res!635335) b!946326))

(declare-fun m!879765 () Bool)

(assert (=> d!114523 m!879765))

(declare-fun m!879767 () Bool)

(assert (=> b!946324 m!879767))

(declare-fun m!879769 () Bool)

(assert (=> b!946325 m!879769))

(declare-fun m!879771 () Bool)

(assert (=> b!946326 m!879771))

(assert (=> start!80642 d!114523))

(declare-fun b!946339 () Bool)

(declare-fun e!532453 () SeekEntryResult!9100)

(declare-fun lt!426265 () SeekEntryResult!9100)

(assert (=> b!946339 (= e!532453 (ite ((_ is MissingVacant!9100) lt!426265) (MissingZero!9100 (index!38774 lt!426265)) lt!426265))))

(declare-fun lt!426266 () SeekEntryResult!9100)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57272 (_ BitVec 32)) SeekEntryResult!9100)

(assert (=> b!946339 (= lt!426265 (seekKeyOrZeroReturnVacant!0 (x!81361 lt!426266) (index!38773 lt!426266) (index!38773 lt!426266) key!756 (_keys!10604 thiss!1141) (mask!27409 thiss!1141)))))

(declare-fun b!946340 () Bool)

(declare-fun e!532454 () SeekEntryResult!9100)

(assert (=> b!946340 (= e!532454 Undefined!9100)))

(declare-fun b!946341 () Bool)

(declare-fun e!532452 () SeekEntryResult!9100)

(assert (=> b!946341 (= e!532454 e!532452)))

(declare-fun lt!426264 () (_ BitVec 64))

(assert (=> b!946341 (= lt!426264 (select (arr!27553 (_keys!10604 thiss!1141)) (index!38773 lt!426266)))))

(declare-fun c!98542 () Bool)

(assert (=> b!946341 (= c!98542 (= lt!426264 key!756))))

(declare-fun b!946342 () Bool)

(assert (=> b!946342 (= e!532452 (Found!9100 (index!38773 lt!426266)))))

(declare-fun b!946343 () Bool)

(assert (=> b!946343 (= e!532453 (MissingZero!9100 (index!38773 lt!426266)))))

(declare-fun b!946344 () Bool)

(declare-fun c!98543 () Bool)

(assert (=> b!946344 (= c!98543 (= lt!426264 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946344 (= e!532452 e!532453)))

(declare-fun d!114525 () Bool)

(declare-fun lt!426267 () SeekEntryResult!9100)

(assert (=> d!114525 (and (or ((_ is MissingVacant!9100) lt!426267) (not ((_ is Found!9100) lt!426267)) (and (bvsge (index!38772 lt!426267) #b00000000000000000000000000000000) (bvslt (index!38772 lt!426267) (size!28023 (_keys!10604 thiss!1141))))) (not ((_ is MissingVacant!9100) lt!426267)) (or (not ((_ is Found!9100) lt!426267)) (= (select (arr!27553 (_keys!10604 thiss!1141)) (index!38772 lt!426267)) key!756)))))

(assert (=> d!114525 (= lt!426267 e!532454)))

(declare-fun c!98541 () Bool)

(assert (=> d!114525 (= c!98541 (and ((_ is Intermediate!9100) lt!426266) (undefined!9912 lt!426266)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57272 (_ BitVec 32)) SeekEntryResult!9100)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114525 (= lt!426266 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27409 thiss!1141)) key!756 (_keys!10604 thiss!1141) (mask!27409 thiss!1141)))))

(assert (=> d!114525 (validMask!0 (mask!27409 thiss!1141))))

(assert (=> d!114525 (= (seekEntry!0 key!756 (_keys!10604 thiss!1141) (mask!27409 thiss!1141)) lt!426267)))

(assert (= (and d!114525 c!98541) b!946340))

(assert (= (and d!114525 (not c!98541)) b!946341))

(assert (= (and b!946341 c!98542) b!946342))

(assert (= (and b!946341 (not c!98542)) b!946344))

(assert (= (and b!946344 c!98543) b!946343))

(assert (= (and b!946344 (not c!98543)) b!946339))

(declare-fun m!879773 () Bool)

(assert (=> b!946339 m!879773))

(declare-fun m!879775 () Bool)

(assert (=> b!946341 m!879775))

(declare-fun m!879777 () Bool)

(assert (=> d!114525 m!879777))

(declare-fun m!879779 () Bool)

(assert (=> d!114525 m!879779))

(assert (=> d!114525 m!879779))

(declare-fun m!879781 () Bool)

(assert (=> d!114525 m!879781))

(assert (=> d!114525 m!879729))

(assert (=> b!946282 d!114525))

(declare-fun mapIsEmpty!32824 () Bool)

(declare-fun mapRes!32824 () Bool)

(assert (=> mapIsEmpty!32824 mapRes!32824))

(declare-fun b!946352 () Bool)

(declare-fun e!532459 () Bool)

(assert (=> b!946352 (= e!532459 tp_is_empty!20643)))

(declare-fun mapNonEmpty!32824 () Bool)

(declare-fun tp!62952 () Bool)

(declare-fun e!532460 () Bool)

(assert (=> mapNonEmpty!32824 (= mapRes!32824 (and tp!62952 e!532460))))

(declare-fun mapValue!32824 () ValueCell!9840)

(declare-fun mapRest!32824 () (Array (_ BitVec 32) ValueCell!9840))

(declare-fun mapKey!32824 () (_ BitVec 32))

(assert (=> mapNonEmpty!32824 (= mapRest!32818 (store mapRest!32824 mapKey!32824 mapValue!32824))))

(declare-fun b!946351 () Bool)

(assert (=> b!946351 (= e!532460 tp_is_empty!20643)))

(declare-fun condMapEmpty!32824 () Bool)

(declare-fun mapDefault!32824 () ValueCell!9840)

(assert (=> mapNonEmpty!32818 (= condMapEmpty!32824 (= mapRest!32818 ((as const (Array (_ BitVec 32) ValueCell!9840)) mapDefault!32824)))))

(assert (=> mapNonEmpty!32818 (= tp!62943 (and e!532459 mapRes!32824))))

(assert (= (and mapNonEmpty!32818 condMapEmpty!32824) mapIsEmpty!32824))

(assert (= (and mapNonEmpty!32818 (not condMapEmpty!32824)) mapNonEmpty!32824))

(assert (= (and mapNonEmpty!32824 ((_ is ValueCellFull!9840) mapValue!32824)) b!946351))

(assert (= (and mapNonEmpty!32818 ((_ is ValueCellFull!9840) mapDefault!32824)) b!946352))

(declare-fun m!879783 () Bool)

(assert (=> mapNonEmpty!32824 m!879783))

(check-sat (not b!946325) (not b!946317) (not b!946339) (not b_next!18135) (not d!114517) (not b!946326) (not mapNonEmpty!32824) (not d!114525) tp_is_empty!20643 (not b!946324) b_and!29557 (not d!114523))
(check-sat b_and!29557 (not b_next!18135))
(get-model)

(declare-fun b!946361 () Bool)

(declare-fun e!532468 () Bool)

(declare-fun call!41079 () Bool)

(assert (=> b!946361 (= e!532468 call!41079)))

(declare-fun b!946362 () Bool)

(declare-fun e!532467 () Bool)

(assert (=> b!946362 (= e!532467 e!532468)))

(declare-fun lt!426274 () (_ BitVec 64))

(assert (=> b!946362 (= lt!426274 (select (arr!27553 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426275 () Unit!31900)

(assert (=> b!946362 (= lt!426275 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10604 thiss!1141) lt!426274 #b00000000000000000000000000000000))))

(assert (=> b!946362 (arrayContainsKey!0 (_keys!10604 thiss!1141) lt!426274 #b00000000000000000000000000000000)))

(declare-fun lt!426276 () Unit!31900)

(assert (=> b!946362 (= lt!426276 lt!426275)))

(declare-fun res!635340 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57272 (_ BitVec 32)) SeekEntryResult!9100)

(assert (=> b!946362 (= res!635340 (= (seekEntryOrOpen!0 (select (arr!27553 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000) (_keys!10604 thiss!1141) (mask!27409 thiss!1141)) (Found!9100 #b00000000000000000000000000000000)))))

(assert (=> b!946362 (=> (not res!635340) (not e!532468))))

(declare-fun b!946363 () Bool)

(assert (=> b!946363 (= e!532467 call!41079)))

(declare-fun b!946364 () Bool)

(declare-fun e!532469 () Bool)

(assert (=> b!946364 (= e!532469 e!532467)))

(declare-fun c!98546 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946364 (= c!98546 (validKeyInArray!0 (select (arr!27553 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41076 () Bool)

(assert (=> bm!41076 (= call!41079 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10604 thiss!1141) (mask!27409 thiss!1141)))))

(declare-fun d!114527 () Bool)

(declare-fun res!635341 () Bool)

(assert (=> d!114527 (=> res!635341 e!532469)))

(assert (=> d!114527 (= res!635341 (bvsge #b00000000000000000000000000000000 (size!28023 (_keys!10604 thiss!1141))))))

(assert (=> d!114527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10604 thiss!1141) (mask!27409 thiss!1141)) e!532469)))

(assert (= (and d!114527 (not res!635341)) b!946364))

(assert (= (and b!946364 c!98546) b!946362))

(assert (= (and b!946364 (not c!98546)) b!946363))

(assert (= (and b!946362 res!635340) b!946361))

(assert (= (or b!946361 b!946363) bm!41076))

(assert (=> b!946362 m!879759))

(declare-fun m!879785 () Bool)

(assert (=> b!946362 m!879785))

(declare-fun m!879787 () Bool)

(assert (=> b!946362 m!879787))

(assert (=> b!946362 m!879759))

(declare-fun m!879789 () Bool)

(assert (=> b!946362 m!879789))

(assert (=> b!946364 m!879759))

(assert (=> b!946364 m!879759))

(declare-fun m!879791 () Bool)

(assert (=> b!946364 m!879791))

(declare-fun m!879793 () Bool)

(assert (=> bm!41076 m!879793))

(assert (=> b!946325 d!114527))

(declare-fun b!946383 () Bool)

(declare-fun e!532481 () Bool)

(declare-fun e!532482 () Bool)

(assert (=> b!946383 (= e!532481 e!532482)))

(declare-fun res!635349 () Bool)

(declare-fun lt!426281 () SeekEntryResult!9100)

(assert (=> b!946383 (= res!635349 (and ((_ is Intermediate!9100) lt!426281) (not (undefined!9912 lt!426281)) (bvslt (x!81361 lt!426281) #b01111111111111111111111111111110) (bvsge (x!81361 lt!426281) #b00000000000000000000000000000000) (bvsge (x!81361 lt!426281) #b00000000000000000000000000000000)))))

(assert (=> b!946383 (=> (not res!635349) (not e!532482))))

(declare-fun b!946384 () Bool)

(declare-fun e!532484 () SeekEntryResult!9100)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946384 (= e!532484 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27409 thiss!1141)) #b00000000000000000000000000000000 (mask!27409 thiss!1141)) key!756 (_keys!10604 thiss!1141) (mask!27409 thiss!1141)))))

(declare-fun b!946385 () Bool)

(assert (=> b!946385 (= e!532484 (Intermediate!9100 false (toIndex!0 key!756 (mask!27409 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946387 () Bool)

(assert (=> b!946387 (and (bvsge (index!38773 lt!426281) #b00000000000000000000000000000000) (bvslt (index!38773 lt!426281) (size!28023 (_keys!10604 thiss!1141))))))

(declare-fun e!532480 () Bool)

(assert (=> b!946387 (= e!532480 (= (select (arr!27553 (_keys!10604 thiss!1141)) (index!38773 lt!426281)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!946388 () Bool)

(assert (=> b!946388 (and (bvsge (index!38773 lt!426281) #b00000000000000000000000000000000) (bvslt (index!38773 lt!426281) (size!28023 (_keys!10604 thiss!1141))))))

(declare-fun res!635348 () Bool)

(assert (=> b!946388 (= res!635348 (= (select (arr!27553 (_keys!10604 thiss!1141)) (index!38773 lt!426281)) key!756))))

(assert (=> b!946388 (=> res!635348 e!532480)))

(assert (=> b!946388 (= e!532482 e!532480)))

(declare-fun b!946389 () Bool)

(assert (=> b!946389 (and (bvsge (index!38773 lt!426281) #b00000000000000000000000000000000) (bvslt (index!38773 lt!426281) (size!28023 (_keys!10604 thiss!1141))))))

(declare-fun res!635350 () Bool)

(assert (=> b!946389 (= res!635350 (= (select (arr!27553 (_keys!10604 thiss!1141)) (index!38773 lt!426281)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946389 (=> res!635350 e!532480)))

(declare-fun b!946390 () Bool)

(declare-fun e!532483 () SeekEntryResult!9100)

(assert (=> b!946390 (= e!532483 (Intermediate!9100 true (toIndex!0 key!756 (mask!27409 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946391 () Bool)

(assert (=> b!946391 (= e!532483 e!532484)))

(declare-fun c!98554 () Bool)

(declare-fun lt!426282 () (_ BitVec 64))

(assert (=> b!946391 (= c!98554 (or (= lt!426282 key!756) (= (bvadd lt!426282 lt!426282) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!946386 () Bool)

(assert (=> b!946386 (= e!532481 (bvsge (x!81361 lt!426281) #b01111111111111111111111111111110))))

(declare-fun d!114529 () Bool)

(assert (=> d!114529 e!532481))

(declare-fun c!98555 () Bool)

(assert (=> d!114529 (= c!98555 (and ((_ is Intermediate!9100) lt!426281) (undefined!9912 lt!426281)))))

(assert (=> d!114529 (= lt!426281 e!532483)))

(declare-fun c!98553 () Bool)

(assert (=> d!114529 (= c!98553 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114529 (= lt!426282 (select (arr!27553 (_keys!10604 thiss!1141)) (toIndex!0 key!756 (mask!27409 thiss!1141))))))

(assert (=> d!114529 (validMask!0 (mask!27409 thiss!1141))))

(assert (=> d!114529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27409 thiss!1141)) key!756 (_keys!10604 thiss!1141) (mask!27409 thiss!1141)) lt!426281)))

(assert (= (and d!114529 c!98553) b!946390))

(assert (= (and d!114529 (not c!98553)) b!946391))

(assert (= (and b!946391 c!98554) b!946385))

(assert (= (and b!946391 (not c!98554)) b!946384))

(assert (= (and d!114529 c!98555) b!946386))

(assert (= (and d!114529 (not c!98555)) b!946383))

(assert (= (and b!946383 res!635349) b!946388))

(assert (= (and b!946388 (not res!635348)) b!946389))

(assert (= (and b!946389 (not res!635350)) b!946387))

(declare-fun m!879795 () Bool)

(assert (=> b!946387 m!879795))

(assert (=> b!946384 m!879779))

(declare-fun m!879797 () Bool)

(assert (=> b!946384 m!879797))

(assert (=> b!946384 m!879797))

(declare-fun m!879799 () Bool)

(assert (=> b!946384 m!879799))

(assert (=> b!946389 m!879795))

(assert (=> b!946388 m!879795))

(assert (=> d!114529 m!879779))

(declare-fun m!879801 () Bool)

(assert (=> d!114529 m!879801))

(assert (=> d!114529 m!879729))

(assert (=> d!114525 d!114529))

(declare-fun d!114531 () Bool)

(declare-fun lt!426288 () (_ BitVec 32))

(declare-fun lt!426287 () (_ BitVec 32))

(assert (=> d!114531 (= lt!426288 (bvmul (bvxor lt!426287 (bvlshr lt!426287 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114531 (= lt!426287 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114531 (and (bvsge (mask!27409 thiss!1141) #b00000000000000000000000000000000) (let ((res!635351 (let ((h!20447 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81378 (bvmul (bvxor h!20447 (bvlshr h!20447 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81378 (bvlshr x!81378 #b00000000000000000000000000001101)) (mask!27409 thiss!1141)))))) (and (bvslt res!635351 (bvadd (mask!27409 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635351 #b00000000000000000000000000000000))))))

(assert (=> d!114531 (= (toIndex!0 key!756 (mask!27409 thiss!1141)) (bvand (bvxor lt!426288 (bvlshr lt!426288 #b00000000000000000000000000001101)) (mask!27409 thiss!1141)))))

(assert (=> d!114525 d!114531))

(assert (=> d!114525 d!114513))

(declare-fun b!946404 () Bool)

(declare-fun e!532492 () SeekEntryResult!9100)

(assert (=> b!946404 (= e!532492 Undefined!9100)))

(declare-fun b!946406 () Bool)

(declare-fun e!532491 () SeekEntryResult!9100)

(assert (=> b!946406 (= e!532491 (MissingVacant!9100 (index!38773 lt!426266)))))

(declare-fun b!946407 () Bool)

(assert (=> b!946407 (= e!532491 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81361 lt!426266) #b00000000000000000000000000000001) (nextIndex!0 (index!38773 lt!426266) (x!81361 lt!426266) (mask!27409 thiss!1141)) (index!38773 lt!426266) key!756 (_keys!10604 thiss!1141) (mask!27409 thiss!1141)))))

(declare-fun b!946408 () Bool)

(declare-fun e!532493 () SeekEntryResult!9100)

(assert (=> b!946408 (= e!532493 (Found!9100 (index!38773 lt!426266)))))

(declare-fun b!946409 () Bool)

(assert (=> b!946409 (= e!532492 e!532493)))

(declare-fun c!98562 () Bool)

(declare-fun lt!426294 () (_ BitVec 64))

(assert (=> b!946409 (= c!98562 (= lt!426294 key!756))))

(declare-fun b!946405 () Bool)

(declare-fun c!98564 () Bool)

(assert (=> b!946405 (= c!98564 (= lt!426294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946405 (= e!532493 e!532491)))

(declare-fun d!114533 () Bool)

(declare-fun lt!426293 () SeekEntryResult!9100)

(assert (=> d!114533 (and (or ((_ is Undefined!9100) lt!426293) (not ((_ is Found!9100) lt!426293)) (and (bvsge (index!38772 lt!426293) #b00000000000000000000000000000000) (bvslt (index!38772 lt!426293) (size!28023 (_keys!10604 thiss!1141))))) (or ((_ is Undefined!9100) lt!426293) ((_ is Found!9100) lt!426293) (not ((_ is MissingVacant!9100) lt!426293)) (not (= (index!38774 lt!426293) (index!38773 lt!426266))) (and (bvsge (index!38774 lt!426293) #b00000000000000000000000000000000) (bvslt (index!38774 lt!426293) (size!28023 (_keys!10604 thiss!1141))))) (or ((_ is Undefined!9100) lt!426293) (ite ((_ is Found!9100) lt!426293) (= (select (arr!27553 (_keys!10604 thiss!1141)) (index!38772 lt!426293)) key!756) (and ((_ is MissingVacant!9100) lt!426293) (= (index!38774 lt!426293) (index!38773 lt!426266)) (= (select (arr!27553 (_keys!10604 thiss!1141)) (index!38774 lt!426293)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114533 (= lt!426293 e!532492)))

(declare-fun c!98563 () Bool)

(assert (=> d!114533 (= c!98563 (bvsge (x!81361 lt!426266) #b01111111111111111111111111111110))))

(assert (=> d!114533 (= lt!426294 (select (arr!27553 (_keys!10604 thiss!1141)) (index!38773 lt!426266)))))

(assert (=> d!114533 (validMask!0 (mask!27409 thiss!1141))))

(assert (=> d!114533 (= (seekKeyOrZeroReturnVacant!0 (x!81361 lt!426266) (index!38773 lt!426266) (index!38773 lt!426266) key!756 (_keys!10604 thiss!1141) (mask!27409 thiss!1141)) lt!426293)))

(assert (= (and d!114533 c!98563) b!946404))

(assert (= (and d!114533 (not c!98563)) b!946409))

(assert (= (and b!946409 c!98562) b!946408))

(assert (= (and b!946409 (not c!98562)) b!946405))

(assert (= (and b!946405 c!98564) b!946406))

(assert (= (and b!946405 (not c!98564)) b!946407))

(declare-fun m!879803 () Bool)

(assert (=> b!946407 m!879803))

(assert (=> b!946407 m!879803))

(declare-fun m!879805 () Bool)

(assert (=> b!946407 m!879805))

(declare-fun m!879807 () Bool)

(assert (=> d!114533 m!879807))

(declare-fun m!879809 () Bool)

(assert (=> d!114533 m!879809))

(assert (=> d!114533 m!879775))

(assert (=> d!114533 m!879729))

(assert (=> b!946339 d!114533))

(declare-fun d!114535 () Bool)

(declare-fun res!635352 () Bool)

(declare-fun e!532494 () Bool)

(assert (=> d!114535 (=> res!635352 e!532494)))

(assert (=> d!114535 (= res!635352 (= (select (arr!27553 (_keys!10604 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114535 (= (arrayContainsKey!0 (_keys!10604 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!532494)))

(declare-fun b!946410 () Bool)

(declare-fun e!532495 () Bool)

(assert (=> b!946410 (= e!532494 e!532495)))

(declare-fun res!635353 () Bool)

(assert (=> b!946410 (=> (not res!635353) (not e!532495))))

(assert (=> b!946410 (= res!635353 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28023 (_keys!10604 thiss!1141))))))

(declare-fun b!946411 () Bool)

(assert (=> b!946411 (= e!532495 (arrayContainsKey!0 (_keys!10604 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114535 (not res!635352)) b!946410))

(assert (= (and b!946410 res!635353) b!946411))

(declare-fun m!879811 () Bool)

(assert (=> d!114535 m!879811))

(declare-fun m!879813 () Bool)

(assert (=> b!946411 m!879813))

(assert (=> b!946317 d!114535))

(declare-fun b!946423 () Bool)

(declare-fun e!532504 () Bool)

(declare-fun e!532506 () Bool)

(assert (=> b!946423 (= e!532504 e!532506)))

(declare-fun c!98567 () Bool)

(assert (=> b!946423 (= c!98567 (validKeyInArray!0 (select (arr!27553 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41079 () Bool)

(declare-fun call!41082 () Bool)

(assert (=> bm!41079 (= call!41082 (arrayNoDuplicates!0 (_keys!10604 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98567 (Cons!19293 (select (arr!27553 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000) Nil!19294) Nil!19294)))))

(declare-fun b!946424 () Bool)

(declare-fun e!532505 () Bool)

(assert (=> b!946424 (= e!532505 e!532504)))

(declare-fun res!635362 () Bool)

(assert (=> b!946424 (=> (not res!635362) (not e!532504))))

(declare-fun e!532507 () Bool)

(assert (=> b!946424 (= res!635362 (not e!532507))))

(declare-fun res!635361 () Bool)

(assert (=> b!946424 (=> (not res!635361) (not e!532507))))

(assert (=> b!946424 (= res!635361 (validKeyInArray!0 (select (arr!27553 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946425 () Bool)

(assert (=> b!946425 (= e!532506 call!41082)))

(declare-fun b!946426 () Bool)

(declare-fun contains!5195 (List!19297 (_ BitVec 64)) Bool)

(assert (=> b!946426 (= e!532507 (contains!5195 Nil!19294 (select (arr!27553 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946422 () Bool)

(assert (=> b!946422 (= e!532506 call!41082)))

(declare-fun d!114537 () Bool)

(declare-fun res!635360 () Bool)

(assert (=> d!114537 (=> res!635360 e!532505)))

(assert (=> d!114537 (= res!635360 (bvsge #b00000000000000000000000000000000 (size!28023 (_keys!10604 thiss!1141))))))

(assert (=> d!114537 (= (arrayNoDuplicates!0 (_keys!10604 thiss!1141) #b00000000000000000000000000000000 Nil!19294) e!532505)))

(assert (= (and d!114537 (not res!635360)) b!946424))

(assert (= (and b!946424 res!635361) b!946426))

(assert (= (and b!946424 res!635362) b!946423))

(assert (= (and b!946423 c!98567) b!946422))

(assert (= (and b!946423 (not c!98567)) b!946425))

(assert (= (or b!946422 b!946425) bm!41079))

(assert (=> b!946423 m!879759))

(assert (=> b!946423 m!879759))

(assert (=> b!946423 m!879791))

(assert (=> bm!41079 m!879759))

(declare-fun m!879815 () Bool)

(assert (=> bm!41079 m!879815))

(assert (=> b!946424 m!879759))

(assert (=> b!946424 m!879759))

(assert (=> b!946424 m!879791))

(assert (=> b!946426 m!879759))

(assert (=> b!946426 m!879759))

(declare-fun m!879817 () Bool)

(assert (=> b!946426 m!879817))

(assert (=> b!946326 d!114537))

(assert (=> d!114517 d!114515))

(declare-fun d!114539 () Bool)

(assert (=> d!114539 (arrayContainsKey!0 (_keys!10604 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114539 true))

(declare-fun _$60!433 () Unit!31900)

(assert (=> d!114539 (= (choose!13 (_keys!10604 thiss!1141) key!756 (index!38772 lt!426246)) _$60!433)))

(declare-fun bs!26602 () Bool)

(assert (= bs!26602 d!114539))

(assert (=> bs!26602 m!879731))

(assert (=> d!114517 d!114539))

(declare-fun b!946435 () Bool)

(declare-fun res!635371 () Bool)

(declare-fun e!532510 () Bool)

(assert (=> b!946435 (=> (not res!635371) (not e!532510))))

(assert (=> b!946435 (= res!635371 (and (= (size!28022 (_values!5735 thiss!1141)) (bvadd (mask!27409 thiss!1141) #b00000000000000000000000000000001)) (= (size!28023 (_keys!10604 thiss!1141)) (size!28022 (_values!5735 thiss!1141))) (bvsge (_size!2470 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2470 thiss!1141) (bvadd (mask!27409 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!946436 () Bool)

(declare-fun res!635372 () Bool)

(assert (=> b!946436 (=> (not res!635372) (not e!532510))))

(declare-fun size!28026 (LongMapFixedSize!4830) (_ BitVec 32))

(assert (=> b!946436 (= res!635372 (bvsge (size!28026 thiss!1141) (_size!2470 thiss!1141)))))

(declare-fun b!946438 () Bool)

(assert (=> b!946438 (= e!532510 (and (bvsge (extraKeys!5444 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5444 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2470 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!946437 () Bool)

(declare-fun res!635373 () Bool)

(assert (=> b!946437 (=> (not res!635373) (not e!532510))))

(assert (=> b!946437 (= res!635373 (= (size!28026 thiss!1141) (bvadd (_size!2470 thiss!1141) (bvsdiv (bvadd (extraKeys!5444 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!114541 () Bool)

(declare-fun res!635374 () Bool)

(assert (=> d!114541 (=> (not res!635374) (not e!532510))))

(assert (=> d!114541 (= res!635374 (validMask!0 (mask!27409 thiss!1141)))))

(assert (=> d!114541 (= (simpleValid!357 thiss!1141) e!532510)))

(assert (= (and d!114541 res!635374) b!946435))

(assert (= (and b!946435 res!635371) b!946436))

(assert (= (and b!946436 res!635372) b!946437))

(assert (= (and b!946437 res!635373) b!946438))

(declare-fun m!879819 () Bool)

(assert (=> b!946436 m!879819))

(assert (=> b!946437 m!879819))

(assert (=> d!114541 m!879729))

(assert (=> d!114523 d!114541))

(declare-fun b!946447 () Bool)

(declare-fun e!532516 () (_ BitVec 32))

(declare-fun call!41085 () (_ BitVec 32))

(assert (=> b!946447 (= e!532516 call!41085)))

(declare-fun b!946448 () Bool)

(declare-fun e!532515 () (_ BitVec 32))

(assert (=> b!946448 (= e!532515 #b00000000000000000000000000000000)))

(declare-fun b!946449 () Bool)

(assert (=> b!946449 (= e!532515 e!532516)))

(declare-fun c!98572 () Bool)

(assert (=> b!946449 (= c!98572 (validKeyInArray!0 (select (arr!27553 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41082 () Bool)

(assert (=> bm!41082 (= call!41085 (arrayCountValidKeys!0 (_keys!10604 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28023 (_keys!10604 thiss!1141))))))

(declare-fun b!946450 () Bool)

(assert (=> b!946450 (= e!532516 (bvadd #b00000000000000000000000000000001 call!41085))))

(declare-fun d!114543 () Bool)

(declare-fun lt!426297 () (_ BitVec 32))

(assert (=> d!114543 (and (bvsge lt!426297 #b00000000000000000000000000000000) (bvsle lt!426297 (bvsub (size!28023 (_keys!10604 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114543 (= lt!426297 e!532515)))

(declare-fun c!98573 () Bool)

(assert (=> d!114543 (= c!98573 (bvsge #b00000000000000000000000000000000 (size!28023 (_keys!10604 thiss!1141))))))

(assert (=> d!114543 (and (bvsle #b00000000000000000000000000000000 (size!28023 (_keys!10604 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28023 (_keys!10604 thiss!1141)) (size!28023 (_keys!10604 thiss!1141))))))

(assert (=> d!114543 (= (arrayCountValidKeys!0 (_keys!10604 thiss!1141) #b00000000000000000000000000000000 (size!28023 (_keys!10604 thiss!1141))) lt!426297)))

(assert (= (and d!114543 c!98573) b!946448))

(assert (= (and d!114543 (not c!98573)) b!946449))

(assert (= (and b!946449 c!98572) b!946450))

(assert (= (and b!946449 (not c!98572)) b!946447))

(assert (= (or b!946450 b!946447) bm!41082))

(assert (=> b!946449 m!879759))

(assert (=> b!946449 m!879759))

(assert (=> b!946449 m!879791))

(declare-fun m!879821 () Bool)

(assert (=> bm!41082 m!879821))

(assert (=> b!946324 d!114543))

(declare-fun mapIsEmpty!32825 () Bool)

(declare-fun mapRes!32825 () Bool)

(assert (=> mapIsEmpty!32825 mapRes!32825))

(declare-fun b!946452 () Bool)

(declare-fun e!532517 () Bool)

(assert (=> b!946452 (= e!532517 tp_is_empty!20643)))

(declare-fun mapNonEmpty!32825 () Bool)

(declare-fun tp!62953 () Bool)

(declare-fun e!532518 () Bool)

(assert (=> mapNonEmpty!32825 (= mapRes!32825 (and tp!62953 e!532518))))

(declare-fun mapRest!32825 () (Array (_ BitVec 32) ValueCell!9840))

(declare-fun mapValue!32825 () ValueCell!9840)

(declare-fun mapKey!32825 () (_ BitVec 32))

(assert (=> mapNonEmpty!32825 (= mapRest!32824 (store mapRest!32825 mapKey!32825 mapValue!32825))))

(declare-fun b!946451 () Bool)

(assert (=> b!946451 (= e!532518 tp_is_empty!20643)))

(declare-fun condMapEmpty!32825 () Bool)

(declare-fun mapDefault!32825 () ValueCell!9840)

(assert (=> mapNonEmpty!32824 (= condMapEmpty!32825 (= mapRest!32824 ((as const (Array (_ BitVec 32) ValueCell!9840)) mapDefault!32825)))))

(assert (=> mapNonEmpty!32824 (= tp!62952 (and e!532517 mapRes!32825))))

(assert (= (and mapNonEmpty!32824 condMapEmpty!32825) mapIsEmpty!32825))

(assert (= (and mapNonEmpty!32824 (not condMapEmpty!32825)) mapNonEmpty!32825))

(assert (= (and mapNonEmpty!32825 ((_ is ValueCellFull!9840) mapValue!32825)) b!946451))

(assert (= (and mapNonEmpty!32824 ((_ is ValueCellFull!9840) mapDefault!32825)) b!946452))

(declare-fun m!879823 () Bool)

(assert (=> mapNonEmpty!32825 m!879823))

(check-sat (not b!946407) (not bm!41076) (not d!114541) (not d!114533) (not d!114529) (not b_next!18135) (not bm!41079) (not b!946423) (not b!946436) (not b!946362) (not b!946411) (not b!946437) b_and!29557 (not mapNonEmpty!32825) (not d!114539) (not bm!41082) (not b!946364) tp_is_empty!20643 (not b!946426) (not b!946424) (not b!946384) (not b!946449))
(check-sat b_and!29557 (not b_next!18135))
