; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18750 () Bool)

(assert start!18750)

(declare-fun b!185298 () Bool)

(declare-fun b_free!4563 () Bool)

(declare-fun b_next!4563 () Bool)

(assert (=> b!185298 (= b_free!4563 (not b_next!4563))))

(declare-fun tp!16481 () Bool)

(declare-fun b_and!11161 () Bool)

(assert (=> b!185298 (= tp!16481 b_and!11161)))

(declare-fun b!185292 () Bool)

(declare-fun res!87650 () Bool)

(declare-fun e!121941 () Bool)

(assert (=> b!185292 (=> (not res!87650) (not e!121941))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!185292 (= res!87650 (not (= key!828 (bvneg key!828))))))

(declare-fun b!185293 () Bool)

(declare-fun res!87647 () Bool)

(declare-fun e!121937 () Bool)

(assert (=> b!185293 (=> (not res!87647) (not e!121937))))

(declare-datatypes ((V!5427 0))(
  ( (V!5428 (val!2212 Int)) )
))
(declare-datatypes ((ValueCell!1824 0))(
  ( (ValueCellFull!1824 (v!4121 V!5427)) (EmptyCell!1824) )
))
(declare-datatypes ((array!7875 0))(
  ( (array!7876 (arr!3719 (Array (_ BitVec 32) (_ BitVec 64))) (size!4035 (_ BitVec 32))) )
))
(declare-datatypes ((array!7877 0))(
  ( (array!7878 (arr!3720 (Array (_ BitVec 32) ValueCell!1824)) (size!4036 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2556 0))(
  ( (LongMapFixedSize!2557 (defaultEntry!3778 Int) (mask!8881 (_ BitVec 32)) (extraKeys!3515 (_ BitVec 32)) (zeroValue!3619 V!5427) (minValue!3619 V!5427) (_size!1327 (_ BitVec 32)) (_keys!5715 array!7875) (_values!3761 array!7877) (_vacant!1327 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2556)

(declare-datatypes ((tuple2!3446 0))(
  ( (tuple2!3447 (_1!1734 (_ BitVec 64)) (_2!1734 V!5427)) )
))
(declare-datatypes ((List!2356 0))(
  ( (Nil!2353) (Cons!2352 (h!2985 tuple2!3446) (t!7236 List!2356)) )
))
(declare-datatypes ((ListLongMap!2363 0))(
  ( (ListLongMap!2364 (toList!1197 List!2356)) )
))
(declare-fun contains!1291 (ListLongMap!2363 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!845 (array!7875 array!7877 (_ BitVec 32) (_ BitVec 32) V!5427 V!5427 (_ BitVec 32) Int) ListLongMap!2363)

(assert (=> b!185293 (= res!87647 (not (contains!1291 (getCurrentListMap!845 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!7458 () Bool)

(declare-fun mapRes!7458 () Bool)

(declare-fun tp!16482 () Bool)

(declare-fun e!121939 () Bool)

(assert (=> mapNonEmpty!7458 (= mapRes!7458 (and tp!16482 e!121939))))

(declare-fun mapRest!7458 () (Array (_ BitVec 32) ValueCell!1824))

(declare-fun mapKey!7458 () (_ BitVec 32))

(declare-fun mapValue!7458 () ValueCell!1824)

(assert (=> mapNonEmpty!7458 (= (arr!3720 (_values!3761 thiss!1248)) (store mapRest!7458 mapKey!7458 mapValue!7458))))

(declare-fun b!185294 () Bool)

(declare-datatypes ((List!2357 0))(
  ( (Nil!2354) (Cons!2353 (h!2986 (_ BitVec 64)) (t!7237 List!2357)) )
))
(declare-fun arrayNoDuplicates!0 (array!7875 (_ BitVec 32) List!2357) Bool)

(assert (=> b!185294 (= e!121937 (not (arrayNoDuplicates!0 (_keys!5715 thiss!1248) #b00000000000000000000000000000000 Nil!2354)))))

(declare-fun b!185295 () Bool)

(assert (=> b!185295 (= e!121941 e!121937)))

(declare-fun res!87645 () Bool)

(assert (=> b!185295 (=> (not res!87645) (not e!121937))))

(declare-datatypes ((SeekEntryResult!631 0))(
  ( (MissingZero!631 (index!4694 (_ BitVec 32))) (Found!631 (index!4695 (_ BitVec 32))) (Intermediate!631 (undefined!1443 Bool) (index!4696 (_ BitVec 32)) (x!20125 (_ BitVec 32))) (Undefined!631) (MissingVacant!631 (index!4697 (_ BitVec 32))) )
))
(declare-fun lt!91647 () SeekEntryResult!631)

(get-info :version)

(assert (=> b!185295 (= res!87645 (and (not ((_ is Undefined!631) lt!91647)) (not ((_ is MissingVacant!631) lt!91647)) (not ((_ is MissingZero!631) lt!91647)) ((_ is Found!631) lt!91647)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7875 (_ BitVec 32)) SeekEntryResult!631)

(assert (=> b!185295 (= lt!91647 (seekEntryOrOpen!0 key!828 (_keys!5715 thiss!1248) (mask!8881 thiss!1248)))))

(declare-fun mapIsEmpty!7458 () Bool)

(assert (=> mapIsEmpty!7458 mapRes!7458))

(declare-fun b!185296 () Bool)

(declare-fun e!121940 () Bool)

(declare-fun tp_is_empty!4335 () Bool)

(assert (=> b!185296 (= e!121940 tp_is_empty!4335)))

(declare-fun b!185297 () Bool)

(declare-fun e!121938 () Bool)

(assert (=> b!185297 (= e!121938 (and e!121940 mapRes!7458))))

(declare-fun condMapEmpty!7458 () Bool)

(declare-fun mapDefault!7458 () ValueCell!1824)

(assert (=> b!185297 (= condMapEmpty!7458 (= (arr!3720 (_values!3761 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1824)) mapDefault!7458)))))

(declare-fun e!121942 () Bool)

(declare-fun array_inv!2405 (array!7875) Bool)

(declare-fun array_inv!2406 (array!7877) Bool)

(assert (=> b!185298 (= e!121942 (and tp!16481 tp_is_empty!4335 (array_inv!2405 (_keys!5715 thiss!1248)) (array_inv!2406 (_values!3761 thiss!1248)) e!121938))))

(declare-fun b!185299 () Bool)

(declare-fun res!87644 () Bool)

(assert (=> b!185299 (=> (not res!87644) (not e!121937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!185299 (= res!87644 (validMask!0 (mask!8881 thiss!1248)))))

(declare-fun b!185300 () Bool)

(declare-fun res!87648 () Bool)

(assert (=> b!185300 (=> (not res!87648) (not e!121937))))

(assert (=> b!185300 (= res!87648 (and (= (size!4036 (_values!3761 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8881 thiss!1248))) (= (size!4035 (_keys!5715 thiss!1248)) (size!4036 (_values!3761 thiss!1248))) (bvsge (mask!8881 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3515 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3515 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!87649 () Bool)

(assert (=> start!18750 (=> (not res!87649) (not e!121941))))

(declare-fun valid!1054 (LongMapFixedSize!2556) Bool)

(assert (=> start!18750 (= res!87649 (valid!1054 thiss!1248))))

(assert (=> start!18750 e!121941))

(assert (=> start!18750 e!121942))

(assert (=> start!18750 true))

(declare-fun b!185301 () Bool)

(assert (=> b!185301 (= e!121939 tp_is_empty!4335)))

(declare-fun b!185302 () Bool)

(declare-fun res!87646 () Bool)

(assert (=> b!185302 (=> (not res!87646) (not e!121937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7875 (_ BitVec 32)) Bool)

(assert (=> b!185302 (= res!87646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5715 thiss!1248) (mask!8881 thiss!1248)))))

(assert (= (and start!18750 res!87649) b!185292))

(assert (= (and b!185292 res!87650) b!185295))

(assert (= (and b!185295 res!87645) b!185293))

(assert (= (and b!185293 res!87647) b!185299))

(assert (= (and b!185299 res!87644) b!185300))

(assert (= (and b!185300 res!87648) b!185302))

(assert (= (and b!185302 res!87646) b!185294))

(assert (= (and b!185297 condMapEmpty!7458) mapIsEmpty!7458))

(assert (= (and b!185297 (not condMapEmpty!7458)) mapNonEmpty!7458))

(assert (= (and mapNonEmpty!7458 ((_ is ValueCellFull!1824) mapValue!7458)) b!185301))

(assert (= (and b!185297 ((_ is ValueCellFull!1824) mapDefault!7458)) b!185296))

(assert (= b!185298 b!185297))

(assert (= start!18750 b!185298))

(declare-fun m!212563 () Bool)

(assert (=> b!185294 m!212563))

(declare-fun m!212565 () Bool)

(assert (=> b!185293 m!212565))

(assert (=> b!185293 m!212565))

(declare-fun m!212567 () Bool)

(assert (=> b!185293 m!212567))

(declare-fun m!212569 () Bool)

(assert (=> b!185298 m!212569))

(declare-fun m!212571 () Bool)

(assert (=> b!185298 m!212571))

(declare-fun m!212573 () Bool)

(assert (=> b!185299 m!212573))

(declare-fun m!212575 () Bool)

(assert (=> mapNonEmpty!7458 m!212575))

(declare-fun m!212577 () Bool)

(assert (=> b!185295 m!212577))

(declare-fun m!212579 () Bool)

(assert (=> start!18750 m!212579))

(declare-fun m!212581 () Bool)

(assert (=> b!185302 m!212581))

(check-sat (not start!18750) (not b!185293) (not b_next!4563) (not b!185302) (not b!185294) (not b!185295) (not b!185298) (not mapNonEmpty!7458) (not b!185299) b_and!11161 tp_is_empty!4335)
(check-sat b_and!11161 (not b_next!4563))
(get-model)

(declare-fun e!121970 () SeekEntryResult!631)

(declare-fun b!185348 () Bool)

(declare-fun lt!91657 () SeekEntryResult!631)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7875 (_ BitVec 32)) SeekEntryResult!631)

(assert (=> b!185348 (= e!121970 (seekKeyOrZeroReturnVacant!0 (x!20125 lt!91657) (index!4696 lt!91657) (index!4696 lt!91657) key!828 (_keys!5715 thiss!1248) (mask!8881 thiss!1248)))))

(declare-fun b!185349 () Bool)

(declare-fun e!121972 () SeekEntryResult!631)

(declare-fun e!121971 () SeekEntryResult!631)

(assert (=> b!185349 (= e!121972 e!121971)))

(declare-fun lt!91659 () (_ BitVec 64))

(assert (=> b!185349 (= lt!91659 (select (arr!3719 (_keys!5715 thiss!1248)) (index!4696 lt!91657)))))

(declare-fun c!33259 () Bool)

(assert (=> b!185349 (= c!33259 (= lt!91659 key!828))))

(declare-fun b!185350 () Bool)

(assert (=> b!185350 (= e!121970 (MissingZero!631 (index!4696 lt!91657)))))

(declare-fun b!185351 () Bool)

(assert (=> b!185351 (= e!121971 (Found!631 (index!4696 lt!91657)))))

(declare-fun b!185352 () Bool)

(declare-fun c!33257 () Bool)

(assert (=> b!185352 (= c!33257 (= lt!91659 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!185352 (= e!121971 e!121970)))

(declare-fun d!55097 () Bool)

(declare-fun lt!91658 () SeekEntryResult!631)

(assert (=> d!55097 (and (or ((_ is Undefined!631) lt!91658) (not ((_ is Found!631) lt!91658)) (and (bvsge (index!4695 lt!91658) #b00000000000000000000000000000000) (bvslt (index!4695 lt!91658) (size!4035 (_keys!5715 thiss!1248))))) (or ((_ is Undefined!631) lt!91658) ((_ is Found!631) lt!91658) (not ((_ is MissingZero!631) lt!91658)) (and (bvsge (index!4694 lt!91658) #b00000000000000000000000000000000) (bvslt (index!4694 lt!91658) (size!4035 (_keys!5715 thiss!1248))))) (or ((_ is Undefined!631) lt!91658) ((_ is Found!631) lt!91658) ((_ is MissingZero!631) lt!91658) (not ((_ is MissingVacant!631) lt!91658)) (and (bvsge (index!4697 lt!91658) #b00000000000000000000000000000000) (bvslt (index!4697 lt!91658) (size!4035 (_keys!5715 thiss!1248))))) (or ((_ is Undefined!631) lt!91658) (ite ((_ is Found!631) lt!91658) (= (select (arr!3719 (_keys!5715 thiss!1248)) (index!4695 lt!91658)) key!828) (ite ((_ is MissingZero!631) lt!91658) (= (select (arr!3719 (_keys!5715 thiss!1248)) (index!4694 lt!91658)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!631) lt!91658) (= (select (arr!3719 (_keys!5715 thiss!1248)) (index!4697 lt!91658)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55097 (= lt!91658 e!121972)))

(declare-fun c!33258 () Bool)

(assert (=> d!55097 (= c!33258 (and ((_ is Intermediate!631) lt!91657) (undefined!1443 lt!91657)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7875 (_ BitVec 32)) SeekEntryResult!631)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55097 (= lt!91657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8881 thiss!1248)) key!828 (_keys!5715 thiss!1248) (mask!8881 thiss!1248)))))

(assert (=> d!55097 (validMask!0 (mask!8881 thiss!1248))))

(assert (=> d!55097 (= (seekEntryOrOpen!0 key!828 (_keys!5715 thiss!1248) (mask!8881 thiss!1248)) lt!91658)))

(declare-fun b!185353 () Bool)

(assert (=> b!185353 (= e!121972 Undefined!631)))

(assert (= (and d!55097 c!33258) b!185353))

(assert (= (and d!55097 (not c!33258)) b!185349))

(assert (= (and b!185349 c!33259) b!185351))

(assert (= (and b!185349 (not c!33259)) b!185352))

(assert (= (and b!185352 c!33257) b!185350))

(assert (= (and b!185352 (not c!33257)) b!185348))

(declare-fun m!212603 () Bool)

(assert (=> b!185348 m!212603))

(declare-fun m!212605 () Bool)

(assert (=> b!185349 m!212605))

(declare-fun m!212607 () Bool)

(assert (=> d!55097 m!212607))

(declare-fun m!212609 () Bool)

(assert (=> d!55097 m!212609))

(declare-fun m!212611 () Bool)

(assert (=> d!55097 m!212611))

(assert (=> d!55097 m!212573))

(declare-fun m!212613 () Bool)

(assert (=> d!55097 m!212613))

(declare-fun m!212615 () Bool)

(assert (=> d!55097 m!212615))

(assert (=> d!55097 m!212609))

(assert (=> b!185295 d!55097))

(declare-fun d!55099 () Bool)

(assert (=> d!55099 (= (validMask!0 (mask!8881 thiss!1248)) (and (or (= (mask!8881 thiss!1248) #b00000000000000000000000000000111) (= (mask!8881 thiss!1248) #b00000000000000000000000000001111) (= (mask!8881 thiss!1248) #b00000000000000000000000000011111) (= (mask!8881 thiss!1248) #b00000000000000000000000000111111) (= (mask!8881 thiss!1248) #b00000000000000000000000001111111) (= (mask!8881 thiss!1248) #b00000000000000000000000011111111) (= (mask!8881 thiss!1248) #b00000000000000000000000111111111) (= (mask!8881 thiss!1248) #b00000000000000000000001111111111) (= (mask!8881 thiss!1248) #b00000000000000000000011111111111) (= (mask!8881 thiss!1248) #b00000000000000000000111111111111) (= (mask!8881 thiss!1248) #b00000000000000000001111111111111) (= (mask!8881 thiss!1248) #b00000000000000000011111111111111) (= (mask!8881 thiss!1248) #b00000000000000000111111111111111) (= (mask!8881 thiss!1248) #b00000000000000001111111111111111) (= (mask!8881 thiss!1248) #b00000000000000011111111111111111) (= (mask!8881 thiss!1248) #b00000000000000111111111111111111) (= (mask!8881 thiss!1248) #b00000000000001111111111111111111) (= (mask!8881 thiss!1248) #b00000000000011111111111111111111) (= (mask!8881 thiss!1248) #b00000000000111111111111111111111) (= (mask!8881 thiss!1248) #b00000000001111111111111111111111) (= (mask!8881 thiss!1248) #b00000000011111111111111111111111) (= (mask!8881 thiss!1248) #b00000000111111111111111111111111) (= (mask!8881 thiss!1248) #b00000001111111111111111111111111) (= (mask!8881 thiss!1248) #b00000011111111111111111111111111) (= (mask!8881 thiss!1248) #b00000111111111111111111111111111) (= (mask!8881 thiss!1248) #b00001111111111111111111111111111) (= (mask!8881 thiss!1248) #b00011111111111111111111111111111) (= (mask!8881 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8881 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!185299 d!55099))

(declare-fun d!55101 () Bool)

(assert (=> d!55101 (= (array_inv!2405 (_keys!5715 thiss!1248)) (bvsge (size!4035 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185298 d!55101))

(declare-fun d!55103 () Bool)

(assert (=> d!55103 (= (array_inv!2406 (_values!3761 thiss!1248)) (bvsge (size!4036 (_values!3761 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185298 d!55103))

(declare-fun d!55105 () Bool)

(declare-fun res!87678 () Bool)

(declare-fun e!121975 () Bool)

(assert (=> d!55105 (=> (not res!87678) (not e!121975))))

(declare-fun simpleValid!181 (LongMapFixedSize!2556) Bool)

(assert (=> d!55105 (= res!87678 (simpleValid!181 thiss!1248))))

(assert (=> d!55105 (= (valid!1054 thiss!1248) e!121975)))

(declare-fun b!185360 () Bool)

(declare-fun res!87679 () Bool)

(assert (=> b!185360 (=> (not res!87679) (not e!121975))))

(declare-fun arrayCountValidKeys!0 (array!7875 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!185360 (= res!87679 (= (arrayCountValidKeys!0 (_keys!5715 thiss!1248) #b00000000000000000000000000000000 (size!4035 (_keys!5715 thiss!1248))) (_size!1327 thiss!1248)))))

(declare-fun b!185361 () Bool)

(declare-fun res!87680 () Bool)

(assert (=> b!185361 (=> (not res!87680) (not e!121975))))

(assert (=> b!185361 (= res!87680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5715 thiss!1248) (mask!8881 thiss!1248)))))

(declare-fun b!185362 () Bool)

(assert (=> b!185362 (= e!121975 (arrayNoDuplicates!0 (_keys!5715 thiss!1248) #b00000000000000000000000000000000 Nil!2354))))

(assert (= (and d!55105 res!87678) b!185360))

(assert (= (and b!185360 res!87679) b!185361))

(assert (= (and b!185361 res!87680) b!185362))

(declare-fun m!212617 () Bool)

(assert (=> d!55105 m!212617))

(declare-fun m!212619 () Bool)

(assert (=> b!185360 m!212619))

(assert (=> b!185361 m!212581))

(assert (=> b!185362 m!212563))

(assert (=> start!18750 d!55105))

(declare-fun b!185373 () Bool)

(declare-fun e!121986 () Bool)

(declare-fun e!121987 () Bool)

(assert (=> b!185373 (= e!121986 e!121987)))

(declare-fun c!33262 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!185373 (= c!33262 (validKeyInArray!0 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18685 () Bool)

(declare-fun call!18688 () Bool)

(assert (=> bm!18685 (= call!18688 (arrayNoDuplicates!0 (_keys!5715 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33262 (Cons!2353 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000) Nil!2354) Nil!2354)))))

(declare-fun b!185374 () Bool)

(assert (=> b!185374 (= e!121987 call!18688)))

(declare-fun b!185375 () Bool)

(declare-fun e!121985 () Bool)

(declare-fun contains!1293 (List!2357 (_ BitVec 64)) Bool)

(assert (=> b!185375 (= e!121985 (contains!1293 Nil!2354 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185376 () Bool)

(assert (=> b!185376 (= e!121987 call!18688)))

(declare-fun d!55107 () Bool)

(declare-fun res!87689 () Bool)

(declare-fun e!121984 () Bool)

(assert (=> d!55107 (=> res!87689 e!121984)))

(assert (=> d!55107 (= res!87689 (bvsge #b00000000000000000000000000000000 (size!4035 (_keys!5715 thiss!1248))))))

(assert (=> d!55107 (= (arrayNoDuplicates!0 (_keys!5715 thiss!1248) #b00000000000000000000000000000000 Nil!2354) e!121984)))

(declare-fun b!185377 () Bool)

(assert (=> b!185377 (= e!121984 e!121986)))

(declare-fun res!87687 () Bool)

(assert (=> b!185377 (=> (not res!87687) (not e!121986))))

(assert (=> b!185377 (= res!87687 (not e!121985))))

(declare-fun res!87688 () Bool)

(assert (=> b!185377 (=> (not res!87688) (not e!121985))))

(assert (=> b!185377 (= res!87688 (validKeyInArray!0 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!55107 (not res!87689)) b!185377))

(assert (= (and b!185377 res!87688) b!185375))

(assert (= (and b!185377 res!87687) b!185373))

(assert (= (and b!185373 c!33262) b!185376))

(assert (= (and b!185373 (not c!33262)) b!185374))

(assert (= (or b!185376 b!185374) bm!18685))

(declare-fun m!212621 () Bool)

(assert (=> b!185373 m!212621))

(assert (=> b!185373 m!212621))

(declare-fun m!212623 () Bool)

(assert (=> b!185373 m!212623))

(assert (=> bm!18685 m!212621))

(declare-fun m!212625 () Bool)

(assert (=> bm!18685 m!212625))

(assert (=> b!185375 m!212621))

(assert (=> b!185375 m!212621))

(declare-fun m!212627 () Bool)

(assert (=> b!185375 m!212627))

(assert (=> b!185377 m!212621))

(assert (=> b!185377 m!212621))

(assert (=> b!185377 m!212623))

(assert (=> b!185294 d!55107))

(declare-fun d!55109 () Bool)

(declare-fun res!87695 () Bool)

(declare-fun e!121994 () Bool)

(assert (=> d!55109 (=> res!87695 e!121994)))

(assert (=> d!55109 (= res!87695 (bvsge #b00000000000000000000000000000000 (size!4035 (_keys!5715 thiss!1248))))))

(assert (=> d!55109 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5715 thiss!1248) (mask!8881 thiss!1248)) e!121994)))

(declare-fun b!185386 () Bool)

(declare-fun e!121995 () Bool)

(assert (=> b!185386 (= e!121994 e!121995)))

(declare-fun c!33265 () Bool)

(assert (=> b!185386 (= c!33265 (validKeyInArray!0 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18688 () Bool)

(declare-fun call!18691 () Bool)

(assert (=> bm!18688 (= call!18691 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5715 thiss!1248) (mask!8881 thiss!1248)))))

(declare-fun b!185387 () Bool)

(declare-fun e!121996 () Bool)

(assert (=> b!185387 (= e!121995 e!121996)))

(declare-fun lt!91667 () (_ BitVec 64))

(assert (=> b!185387 (= lt!91667 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5588 0))(
  ( (Unit!5589) )
))
(declare-fun lt!91666 () Unit!5588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7875 (_ BitVec 64) (_ BitVec 32)) Unit!5588)

(assert (=> b!185387 (= lt!91666 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5715 thiss!1248) lt!91667 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!185387 (arrayContainsKey!0 (_keys!5715 thiss!1248) lt!91667 #b00000000000000000000000000000000)))

(declare-fun lt!91668 () Unit!5588)

(assert (=> b!185387 (= lt!91668 lt!91666)))

(declare-fun res!87694 () Bool)

(assert (=> b!185387 (= res!87694 (= (seekEntryOrOpen!0 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000) (_keys!5715 thiss!1248) (mask!8881 thiss!1248)) (Found!631 #b00000000000000000000000000000000)))))

(assert (=> b!185387 (=> (not res!87694) (not e!121996))))

(declare-fun b!185388 () Bool)

(assert (=> b!185388 (= e!121996 call!18691)))

(declare-fun b!185389 () Bool)

(assert (=> b!185389 (= e!121995 call!18691)))

(assert (= (and d!55109 (not res!87695)) b!185386))

(assert (= (and b!185386 c!33265) b!185387))

(assert (= (and b!185386 (not c!33265)) b!185389))

(assert (= (and b!185387 res!87694) b!185388))

(assert (= (or b!185388 b!185389) bm!18688))

(assert (=> b!185386 m!212621))

(assert (=> b!185386 m!212621))

(assert (=> b!185386 m!212623))

(declare-fun m!212629 () Bool)

(assert (=> bm!18688 m!212629))

(assert (=> b!185387 m!212621))

(declare-fun m!212631 () Bool)

(assert (=> b!185387 m!212631))

(declare-fun m!212633 () Bool)

(assert (=> b!185387 m!212633))

(assert (=> b!185387 m!212621))

(declare-fun m!212635 () Bool)

(assert (=> b!185387 m!212635))

(assert (=> b!185302 d!55109))

(declare-fun d!55111 () Bool)

(declare-fun e!122001 () Bool)

(assert (=> d!55111 e!122001))

(declare-fun res!87698 () Bool)

(assert (=> d!55111 (=> res!87698 e!122001)))

(declare-fun lt!91678 () Bool)

(assert (=> d!55111 (= res!87698 (not lt!91678))))

(declare-fun lt!91680 () Bool)

(assert (=> d!55111 (= lt!91678 lt!91680)))

(declare-fun lt!91677 () Unit!5588)

(declare-fun e!122002 () Unit!5588)

(assert (=> d!55111 (= lt!91677 e!122002)))

(declare-fun c!33268 () Bool)

(assert (=> d!55111 (= c!33268 lt!91680)))

(declare-fun containsKey!226 (List!2356 (_ BitVec 64)) Bool)

(assert (=> d!55111 (= lt!91680 (containsKey!226 (toList!1197 (getCurrentListMap!845 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248))) key!828))))

(assert (=> d!55111 (= (contains!1291 (getCurrentListMap!845 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248)) key!828) lt!91678)))

(declare-fun b!185396 () Bool)

(declare-fun lt!91679 () Unit!5588)

(assert (=> b!185396 (= e!122002 lt!91679)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!174 (List!2356 (_ BitVec 64)) Unit!5588)

(assert (=> b!185396 (= lt!91679 (lemmaContainsKeyImpliesGetValueByKeyDefined!174 (toList!1197 (getCurrentListMap!845 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248))) key!828))))

(declare-datatypes ((Option!228 0))(
  ( (Some!227 (v!4123 V!5427)) (None!226) )
))
(declare-fun isDefined!175 (Option!228) Bool)

(declare-fun getValueByKey!222 (List!2356 (_ BitVec 64)) Option!228)

(assert (=> b!185396 (isDefined!175 (getValueByKey!222 (toList!1197 (getCurrentListMap!845 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248))) key!828))))

(declare-fun b!185397 () Bool)

(declare-fun Unit!5590 () Unit!5588)

(assert (=> b!185397 (= e!122002 Unit!5590)))

(declare-fun b!185398 () Bool)

(assert (=> b!185398 (= e!122001 (isDefined!175 (getValueByKey!222 (toList!1197 (getCurrentListMap!845 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248))) key!828)))))

(assert (= (and d!55111 c!33268) b!185396))

(assert (= (and d!55111 (not c!33268)) b!185397))

(assert (= (and d!55111 (not res!87698)) b!185398))

(declare-fun m!212637 () Bool)

(assert (=> d!55111 m!212637))

(declare-fun m!212639 () Bool)

(assert (=> b!185396 m!212639))

(declare-fun m!212641 () Bool)

(assert (=> b!185396 m!212641))

(assert (=> b!185396 m!212641))

(declare-fun m!212643 () Bool)

(assert (=> b!185396 m!212643))

(assert (=> b!185398 m!212641))

(assert (=> b!185398 m!212641))

(assert (=> b!185398 m!212643))

(assert (=> b!185293 d!55111))

(declare-fun b!185441 () Bool)

(declare-fun e!122030 () Bool)

(declare-fun lt!91731 () ListLongMap!2363)

(declare-fun apply!165 (ListLongMap!2363 (_ BitVec 64)) V!5427)

(assert (=> b!185441 (= e!122030 (= (apply!165 lt!91731 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3619 thiss!1248)))))

(declare-fun b!185442 () Bool)

(declare-fun e!122039 () Bool)

(assert (=> b!185442 (= e!122039 e!122030)))

(declare-fun res!87720 () Bool)

(declare-fun call!18708 () Bool)

(assert (=> b!185442 (= res!87720 call!18708)))

(assert (=> b!185442 (=> (not res!87720) (not e!122030))))

(declare-fun b!185443 () Bool)

(declare-fun e!122036 () ListLongMap!2363)

(declare-fun call!18709 () ListLongMap!2363)

(declare-fun +!285 (ListLongMap!2363 tuple2!3446) ListLongMap!2363)

(assert (=> b!185443 (= e!122036 (+!285 call!18709 (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3619 thiss!1248))))))

(declare-fun b!185444 () Bool)

(declare-fun c!33281 () Bool)

(assert (=> b!185444 (= c!33281 (and (not (= (bvand (extraKeys!3515 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3515 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!122035 () ListLongMap!2363)

(declare-fun e!122029 () ListLongMap!2363)

(assert (=> b!185444 (= e!122035 e!122029)))

(declare-fun bm!18703 () Bool)

(declare-fun call!18710 () ListLongMap!2363)

(declare-fun call!18706 () ListLongMap!2363)

(assert (=> bm!18703 (= call!18710 call!18706)))

(declare-fun b!185445 () Bool)

(declare-fun e!122034 () Unit!5588)

(declare-fun lt!91734 () Unit!5588)

(assert (=> b!185445 (= e!122034 lt!91734)))

(declare-fun lt!91725 () ListLongMap!2363)

(declare-fun getCurrentListMapNoExtraKeys!198 (array!7875 array!7877 (_ BitVec 32) (_ BitVec 32) V!5427 V!5427 (_ BitVec 32) Int) ListLongMap!2363)

(assert (=> b!185445 (= lt!91725 (getCurrentListMapNoExtraKeys!198 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248)))))

(declare-fun lt!91740 () (_ BitVec 64))

(assert (=> b!185445 (= lt!91740 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91737 () (_ BitVec 64))

(assert (=> b!185445 (= lt!91737 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91732 () Unit!5588)

(declare-fun addStillContains!141 (ListLongMap!2363 (_ BitVec 64) V!5427 (_ BitVec 64)) Unit!5588)

(assert (=> b!185445 (= lt!91732 (addStillContains!141 lt!91725 lt!91740 (zeroValue!3619 thiss!1248) lt!91737))))

(assert (=> b!185445 (contains!1291 (+!285 lt!91725 (tuple2!3447 lt!91740 (zeroValue!3619 thiss!1248))) lt!91737)))

(declare-fun lt!91744 () Unit!5588)

(assert (=> b!185445 (= lt!91744 lt!91732)))

(declare-fun lt!91736 () ListLongMap!2363)

(assert (=> b!185445 (= lt!91736 (getCurrentListMapNoExtraKeys!198 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248)))))

(declare-fun lt!91729 () (_ BitVec 64))

(assert (=> b!185445 (= lt!91729 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91733 () (_ BitVec 64))

(assert (=> b!185445 (= lt!91733 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91730 () Unit!5588)

(declare-fun addApplyDifferent!141 (ListLongMap!2363 (_ BitVec 64) V!5427 (_ BitVec 64)) Unit!5588)

(assert (=> b!185445 (= lt!91730 (addApplyDifferent!141 lt!91736 lt!91729 (minValue!3619 thiss!1248) lt!91733))))

(assert (=> b!185445 (= (apply!165 (+!285 lt!91736 (tuple2!3447 lt!91729 (minValue!3619 thiss!1248))) lt!91733) (apply!165 lt!91736 lt!91733))))

(declare-fun lt!91743 () Unit!5588)

(assert (=> b!185445 (= lt!91743 lt!91730)))

(declare-fun lt!91741 () ListLongMap!2363)

(assert (=> b!185445 (= lt!91741 (getCurrentListMapNoExtraKeys!198 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248)))))

(declare-fun lt!91728 () (_ BitVec 64))

(assert (=> b!185445 (= lt!91728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91745 () (_ BitVec 64))

(assert (=> b!185445 (= lt!91745 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91738 () Unit!5588)

(assert (=> b!185445 (= lt!91738 (addApplyDifferent!141 lt!91741 lt!91728 (zeroValue!3619 thiss!1248) lt!91745))))

(assert (=> b!185445 (= (apply!165 (+!285 lt!91741 (tuple2!3447 lt!91728 (zeroValue!3619 thiss!1248))) lt!91745) (apply!165 lt!91741 lt!91745))))

(declare-fun lt!91726 () Unit!5588)

(assert (=> b!185445 (= lt!91726 lt!91738)))

(declare-fun lt!91746 () ListLongMap!2363)

(assert (=> b!185445 (= lt!91746 (getCurrentListMapNoExtraKeys!198 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248)))))

(declare-fun lt!91735 () (_ BitVec 64))

(assert (=> b!185445 (= lt!91735 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91727 () (_ BitVec 64))

(assert (=> b!185445 (= lt!91727 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!185445 (= lt!91734 (addApplyDifferent!141 lt!91746 lt!91735 (minValue!3619 thiss!1248) lt!91727))))

(assert (=> b!185445 (= (apply!165 (+!285 lt!91746 (tuple2!3447 lt!91735 (minValue!3619 thiss!1248))) lt!91727) (apply!165 lt!91746 lt!91727))))

(declare-fun b!185446 () Bool)

(declare-fun e!122037 () Bool)

(declare-fun e!122031 () Bool)

(assert (=> b!185446 (= e!122037 e!122031)))

(declare-fun res!87724 () Bool)

(declare-fun call!18711 () Bool)

(assert (=> b!185446 (= res!87724 call!18711)))

(assert (=> b!185446 (=> (not res!87724) (not e!122031))))

(declare-fun b!185447 () Bool)

(assert (=> b!185447 (= e!122036 e!122035)))

(declare-fun c!33286 () Bool)

(assert (=> b!185447 (= c!33286 (and (not (= (bvand (extraKeys!3515 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3515 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18704 () Bool)

(declare-fun call!18712 () ListLongMap!2363)

(assert (=> bm!18704 (= call!18712 (getCurrentListMapNoExtraKeys!198 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248)))))

(declare-fun bm!18705 () Bool)

(declare-fun call!18707 () ListLongMap!2363)

(assert (=> bm!18705 (= call!18707 call!18709)))

(declare-fun b!185448 () Bool)

(declare-fun e!122041 () Bool)

(assert (=> b!185448 (= e!122041 (validKeyInArray!0 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185449 () Bool)

(assert (=> b!185449 (= e!122029 call!18707)))

(declare-fun b!185450 () Bool)

(declare-fun e!122038 () Bool)

(assert (=> b!185450 (= e!122038 e!122037)))

(declare-fun c!33285 () Bool)

(assert (=> b!185450 (= c!33285 (not (= (bvand (extraKeys!3515 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!185451 () Bool)

(declare-fun e!122033 () Bool)

(declare-fun get!2138 (ValueCell!1824 V!5427) V!5427)

(declare-fun dynLambda!508 (Int (_ BitVec 64)) V!5427)

(assert (=> b!185451 (= e!122033 (= (apply!165 lt!91731 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000)) (get!2138 (select (arr!3720 (_values!3761 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!508 (defaultEntry!3778 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!185451 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4036 (_values!3761 thiss!1248))))))

(assert (=> b!185451 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4035 (_keys!5715 thiss!1248))))))

(declare-fun b!185452 () Bool)

(declare-fun res!87717 () Bool)

(assert (=> b!185452 (=> (not res!87717) (not e!122038))))

(declare-fun e!122040 () Bool)

(assert (=> b!185452 (= res!87717 e!122040)))

(declare-fun res!87718 () Bool)

(assert (=> b!185452 (=> res!87718 e!122040)))

(assert (=> b!185452 (= res!87718 (not e!122041))))

(declare-fun res!87723 () Bool)

(assert (=> b!185452 (=> (not res!87723) (not e!122041))))

(assert (=> b!185452 (= res!87723 (bvslt #b00000000000000000000000000000000 (size!4035 (_keys!5715 thiss!1248))))))

(declare-fun bm!18706 () Bool)

(assert (=> bm!18706 (= call!18708 (contains!1291 lt!91731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185453 () Bool)

(assert (=> b!185453 (= e!122029 call!18710)))

(declare-fun b!185454 () Bool)

(assert (=> b!185454 (= e!122031 (= (apply!165 lt!91731 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3619 thiss!1248)))))

(declare-fun b!185455 () Bool)

(assert (=> b!185455 (= e!122035 call!18707)))

(declare-fun b!185456 () Bool)

(declare-fun Unit!5591 () Unit!5588)

(assert (=> b!185456 (= e!122034 Unit!5591)))

(declare-fun bm!18707 () Bool)

(assert (=> bm!18707 (= call!18706 call!18712)))

(declare-fun b!185457 () Bool)

(assert (=> b!185457 (= e!122037 (not call!18711))))

(declare-fun b!185458 () Bool)

(assert (=> b!185458 (= e!122040 e!122033)))

(declare-fun res!87721 () Bool)

(assert (=> b!185458 (=> (not res!87721) (not e!122033))))

(assert (=> b!185458 (= res!87721 (contains!1291 lt!91731 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!185458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4035 (_keys!5715 thiss!1248))))))

(declare-fun d!55113 () Bool)

(assert (=> d!55113 e!122038))

(declare-fun res!87719 () Bool)

(assert (=> d!55113 (=> (not res!87719) (not e!122038))))

(assert (=> d!55113 (= res!87719 (or (bvsge #b00000000000000000000000000000000 (size!4035 (_keys!5715 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4035 (_keys!5715 thiss!1248))))))))

(declare-fun lt!91742 () ListLongMap!2363)

(assert (=> d!55113 (= lt!91731 lt!91742)))

(declare-fun lt!91739 () Unit!5588)

(assert (=> d!55113 (= lt!91739 e!122034)))

(declare-fun c!33282 () Bool)

(declare-fun e!122032 () Bool)

(assert (=> d!55113 (= c!33282 e!122032)))

(declare-fun res!87722 () Bool)

(assert (=> d!55113 (=> (not res!87722) (not e!122032))))

(assert (=> d!55113 (= res!87722 (bvslt #b00000000000000000000000000000000 (size!4035 (_keys!5715 thiss!1248))))))

(assert (=> d!55113 (= lt!91742 e!122036)))

(declare-fun c!33284 () Bool)

(assert (=> d!55113 (= c!33284 (and (not (= (bvand (extraKeys!3515 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3515 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55113 (validMask!0 (mask!8881 thiss!1248))))

(assert (=> d!55113 (= (getCurrentListMap!845 (_keys!5715 thiss!1248) (_values!3761 thiss!1248) (mask!8881 thiss!1248) (extraKeys!3515 thiss!1248) (zeroValue!3619 thiss!1248) (minValue!3619 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3778 thiss!1248)) lt!91731)))

(declare-fun bm!18708 () Bool)

(assert (=> bm!18708 (= call!18711 (contains!1291 lt!91731 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!185459 () Bool)

(assert (=> b!185459 (= e!122039 (not call!18708))))

(declare-fun bm!18709 () Bool)

(assert (=> bm!18709 (= call!18709 (+!285 (ite c!33284 call!18712 (ite c!33286 call!18706 call!18710)) (ite (or c!33284 c!33286) (tuple2!3447 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3619 thiss!1248)) (tuple2!3447 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3619 thiss!1248)))))))

(declare-fun b!185460 () Bool)

(assert (=> b!185460 (= e!122032 (validKeyInArray!0 (select (arr!3719 (_keys!5715 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185461 () Bool)

(declare-fun res!87725 () Bool)

(assert (=> b!185461 (=> (not res!87725) (not e!122038))))

(assert (=> b!185461 (= res!87725 e!122039)))

(declare-fun c!33283 () Bool)

(assert (=> b!185461 (= c!33283 (not (= (bvand (extraKeys!3515 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!55113 c!33284) b!185443))

(assert (= (and d!55113 (not c!33284)) b!185447))

(assert (= (and b!185447 c!33286) b!185455))

(assert (= (and b!185447 (not c!33286)) b!185444))

(assert (= (and b!185444 c!33281) b!185449))

(assert (= (and b!185444 (not c!33281)) b!185453))

(assert (= (or b!185449 b!185453) bm!18703))

(assert (= (or b!185455 bm!18703) bm!18707))

(assert (= (or b!185455 b!185449) bm!18705))

(assert (= (or b!185443 bm!18707) bm!18704))

(assert (= (or b!185443 bm!18705) bm!18709))

(assert (= (and d!55113 res!87722) b!185460))

(assert (= (and d!55113 c!33282) b!185445))

(assert (= (and d!55113 (not c!33282)) b!185456))

(assert (= (and d!55113 res!87719) b!185452))

(assert (= (and b!185452 res!87723) b!185448))

(assert (= (and b!185452 (not res!87718)) b!185458))

(assert (= (and b!185458 res!87721) b!185451))

(assert (= (and b!185452 res!87717) b!185461))

(assert (= (and b!185461 c!33283) b!185442))

(assert (= (and b!185461 (not c!33283)) b!185459))

(assert (= (and b!185442 res!87720) b!185441))

(assert (= (or b!185442 b!185459) bm!18706))

(assert (= (and b!185461 res!87725) b!185450))

(assert (= (and b!185450 c!33285) b!185446))

(assert (= (and b!185450 (not c!33285)) b!185457))

(assert (= (and b!185446 res!87724) b!185454))

(assert (= (or b!185446 b!185457) bm!18708))

(declare-fun b_lambda!7247 () Bool)

(assert (=> (not b_lambda!7247) (not b!185451)))

(declare-fun t!7241 () Bool)

(declare-fun tb!2841 () Bool)

(assert (=> (and b!185298 (= (defaultEntry!3778 thiss!1248) (defaultEntry!3778 thiss!1248)) t!7241) tb!2841))

(declare-fun result!4801 () Bool)

(assert (=> tb!2841 (= result!4801 tp_is_empty!4335)))

(assert (=> b!185451 t!7241))

(declare-fun b_and!11165 () Bool)

(assert (= b_and!11161 (and (=> t!7241 result!4801) b_and!11165)))

(declare-fun m!212645 () Bool)

(assert (=> bm!18706 m!212645))

(assert (=> b!185448 m!212621))

(assert (=> b!185448 m!212621))

(assert (=> b!185448 m!212623))

(declare-fun m!212647 () Bool)

(assert (=> b!185454 m!212647))

(assert (=> b!185451 m!212621))

(declare-fun m!212649 () Bool)

(assert (=> b!185451 m!212649))

(declare-fun m!212651 () Bool)

(assert (=> b!185451 m!212651))

(assert (=> b!185451 m!212651))

(assert (=> b!185451 m!212649))

(declare-fun m!212653 () Bool)

(assert (=> b!185451 m!212653))

(assert (=> b!185451 m!212621))

(declare-fun m!212655 () Bool)

(assert (=> b!185451 m!212655))

(declare-fun m!212657 () Bool)

(assert (=> bm!18704 m!212657))

(assert (=> b!185458 m!212621))

(assert (=> b!185458 m!212621))

(declare-fun m!212659 () Bool)

(assert (=> b!185458 m!212659))

(assert (=> d!55113 m!212573))

(assert (=> b!185460 m!212621))

(assert (=> b!185460 m!212621))

(assert (=> b!185460 m!212623))

(declare-fun m!212661 () Bool)

(assert (=> b!185441 m!212661))

(declare-fun m!212663 () Bool)

(assert (=> bm!18708 m!212663))

(declare-fun m!212665 () Bool)

(assert (=> bm!18709 m!212665))

(declare-fun m!212667 () Bool)

(assert (=> b!185443 m!212667))

(assert (=> b!185445 m!212621))

(declare-fun m!212669 () Bool)

(assert (=> b!185445 m!212669))

(declare-fun m!212671 () Bool)

(assert (=> b!185445 m!212671))

(declare-fun m!212673 () Bool)

(assert (=> b!185445 m!212673))

(declare-fun m!212675 () Bool)

(assert (=> b!185445 m!212675))

(assert (=> b!185445 m!212657))

(declare-fun m!212677 () Bool)

(assert (=> b!185445 m!212677))

(declare-fun m!212679 () Bool)

(assert (=> b!185445 m!212679))

(declare-fun m!212681 () Bool)

(assert (=> b!185445 m!212681))

(declare-fun m!212683 () Bool)

(assert (=> b!185445 m!212683))

(declare-fun m!212685 () Bool)

(assert (=> b!185445 m!212685))

(declare-fun m!212687 () Bool)

(assert (=> b!185445 m!212687))

(declare-fun m!212689 () Bool)

(assert (=> b!185445 m!212689))

(assert (=> b!185445 m!212689))

(declare-fun m!212691 () Bool)

(assert (=> b!185445 m!212691))

(assert (=> b!185445 m!212681))

(assert (=> b!185445 m!212685))

(declare-fun m!212693 () Bool)

(assert (=> b!185445 m!212693))

(declare-fun m!212695 () Bool)

(assert (=> b!185445 m!212695))

(assert (=> b!185445 m!212669))

(declare-fun m!212697 () Bool)

(assert (=> b!185445 m!212697))

(assert (=> b!185293 d!55113))

(declare-fun b!185471 () Bool)

(declare-fun e!122047 () Bool)

(assert (=> b!185471 (= e!122047 tp_is_empty!4335)))

(declare-fun mapNonEmpty!7464 () Bool)

(declare-fun mapRes!7464 () Bool)

(declare-fun tp!16491 () Bool)

(declare-fun e!122046 () Bool)

(assert (=> mapNonEmpty!7464 (= mapRes!7464 (and tp!16491 e!122046))))

(declare-fun mapRest!7464 () (Array (_ BitVec 32) ValueCell!1824))

(declare-fun mapKey!7464 () (_ BitVec 32))

(declare-fun mapValue!7464 () ValueCell!1824)

(assert (=> mapNonEmpty!7464 (= mapRest!7458 (store mapRest!7464 mapKey!7464 mapValue!7464))))

(declare-fun mapIsEmpty!7464 () Bool)

(assert (=> mapIsEmpty!7464 mapRes!7464))

(declare-fun condMapEmpty!7464 () Bool)

(declare-fun mapDefault!7464 () ValueCell!1824)

(assert (=> mapNonEmpty!7458 (= condMapEmpty!7464 (= mapRest!7458 ((as const (Array (_ BitVec 32) ValueCell!1824)) mapDefault!7464)))))

(assert (=> mapNonEmpty!7458 (= tp!16482 (and e!122047 mapRes!7464))))

(declare-fun b!185470 () Bool)

(assert (=> b!185470 (= e!122046 tp_is_empty!4335)))

(assert (= (and mapNonEmpty!7458 condMapEmpty!7464) mapIsEmpty!7464))

(assert (= (and mapNonEmpty!7458 (not condMapEmpty!7464)) mapNonEmpty!7464))

(assert (= (and mapNonEmpty!7464 ((_ is ValueCellFull!1824) mapValue!7464)) b!185470))

(assert (= (and mapNonEmpty!7458 ((_ is ValueCellFull!1824) mapDefault!7464)) b!185471))

(declare-fun m!212699 () Bool)

(assert (=> mapNonEmpty!7464 m!212699))

(declare-fun b_lambda!7249 () Bool)

(assert (= b_lambda!7247 (or (and b!185298 b_free!4563) b_lambda!7249)))

(check-sat (not bm!18688) (not mapNonEmpty!7464) (not b!185398) (not b!185377) (not b!185454) (not b!185360) (not d!55113) (not b!185451) (not b!185348) (not b_lambda!7249) (not b!185445) (not b!185361) tp_is_empty!4335 (not bm!18685) (not b!185375) (not b!185458) (not bm!18706) (not d!55105) (not b!185362) (not bm!18708) (not b!185441) (not b!185460) b_and!11165 (not b_next!4563) (not b!185443) (not d!55097) (not bm!18709) (not d!55111) (not b!185386) (not b!185387) (not b!185396) (not b!185373) (not bm!18704) (not b!185448))
(check-sat b_and!11165 (not b_next!4563))
