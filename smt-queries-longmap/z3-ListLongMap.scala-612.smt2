; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15936 () Bool)

(assert start!15936)

(declare-fun b!158231 () Bool)

(declare-fun b_free!3481 () Bool)

(declare-fun b_next!3481 () Bool)

(assert (=> b!158231 (= b_free!3481 (not b_next!3481))))

(declare-fun tp!12995 () Bool)

(declare-fun b_and!9869 () Bool)

(assert (=> b!158231 (= tp!12995 b_and!9869)))

(declare-fun b!158227 () Bool)

(declare-fun e!103626 () Bool)

(declare-fun tp_is_empty!3283 () Bool)

(assert (=> b!158227 (= e!103626 tp_is_empty!3283)))

(declare-fun res!74709 () Bool)

(declare-fun e!103622 () Bool)

(assert (=> start!15936 (=> (not res!74709) (not e!103622))))

(declare-datatypes ((V!4025 0))(
  ( (V!4026 (val!1686 Int)) )
))
(declare-datatypes ((ValueCell!1298 0))(
  ( (ValueCellFull!1298 (v!3545 V!4025)) (EmptyCell!1298) )
))
(declare-datatypes ((array!5615 0))(
  ( (array!5616 (arr!2656 (Array (_ BitVec 32) (_ BitVec 64))) (size!2939 (_ BitVec 32))) )
))
(declare-datatypes ((array!5617 0))(
  ( (array!5618 (arr!2657 (Array (_ BitVec 32) ValueCell!1298)) (size!2940 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1504 0))(
  ( (LongMapFixedSize!1505 (defaultEntry!3194 Int) (mask!7708 (_ BitVec 32)) (extraKeys!2935 (_ BitVec 32)) (zeroValue!3037 V!4025) (minValue!3037 V!4025) (_size!801 (_ BitVec 32)) (_keys!4980 array!5615) (_values!3177 array!5617) (_vacant!801 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1504)

(declare-fun valid!713 (LongMapFixedSize!1504) Bool)

(assert (=> start!15936 (= res!74709 (valid!713 thiss!1248))))

(assert (=> start!15936 e!103622))

(declare-fun e!103624 () Bool)

(assert (=> start!15936 e!103624))

(assert (=> start!15936 true))

(declare-fun b!158228 () Bool)

(declare-fun res!74710 () Bool)

(assert (=> b!158228 (=> (not res!74710) (not e!103622))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!158228 (= res!74710 (not (= key!828 (bvneg key!828))))))

(declare-fun b!158229 () Bool)

(declare-fun e!103623 () Bool)

(assert (=> b!158229 (= e!103623 tp_is_empty!3283)))

(declare-fun b!158230 () Bool)

(assert (=> b!158230 (= e!103622 (and (= (size!2940 (_values!3177 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7708 thiss!1248))) (= (size!2939 (_keys!4980 thiss!1248)) (size!2940 (_values!3177 thiss!1248))) (bvsge (mask!7708 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!2935 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun e!103625 () Bool)

(declare-fun array_inv!1707 (array!5615) Bool)

(declare-fun array_inv!1708 (array!5617) Bool)

(assert (=> b!158231 (= e!103624 (and tp!12995 tp_is_empty!3283 (array_inv!1707 (_keys!4980 thiss!1248)) (array_inv!1708 (_values!3177 thiss!1248)) e!103625))))

(declare-fun b!158232 () Bool)

(declare-fun mapRes!5595 () Bool)

(assert (=> b!158232 (= e!103625 (and e!103626 mapRes!5595))))

(declare-fun condMapEmpty!5595 () Bool)

(declare-fun mapDefault!5595 () ValueCell!1298)

(assert (=> b!158232 (= condMapEmpty!5595 (= (arr!2657 (_values!3177 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1298)) mapDefault!5595)))))

(declare-fun mapIsEmpty!5595 () Bool)

(assert (=> mapIsEmpty!5595 mapRes!5595))

(declare-fun b!158233 () Bool)

(declare-fun res!74707 () Bool)

(assert (=> b!158233 (=> (not res!74707) (not e!103622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!158233 (= res!74707 (validMask!0 (mask!7708 thiss!1248)))))

(declare-fun mapNonEmpty!5595 () Bool)

(declare-fun tp!12996 () Bool)

(assert (=> mapNonEmpty!5595 (= mapRes!5595 (and tp!12996 e!103623))))

(declare-fun mapValue!5595 () ValueCell!1298)

(declare-fun mapKey!5595 () (_ BitVec 32))

(declare-fun mapRest!5595 () (Array (_ BitVec 32) ValueCell!1298))

(assert (=> mapNonEmpty!5595 (= (arr!2657 (_values!3177 thiss!1248)) (store mapRest!5595 mapKey!5595 mapValue!5595))))

(declare-fun b!158234 () Bool)

(declare-fun res!74708 () Bool)

(assert (=> b!158234 (=> (not res!74708) (not e!103622))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!303 0))(
  ( (MissingZero!303 (index!3380 (_ BitVec 32))) (Found!303 (index!3381 (_ BitVec 32))) (Intermediate!303 (undefined!1115 Bool) (index!3382 (_ BitVec 32)) (x!17484 (_ BitVec 32))) (Undefined!303) (MissingVacant!303 (index!3383 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5615 (_ BitVec 32)) SeekEntryResult!303)

(assert (=> b!158234 (= res!74708 ((_ is Undefined!303) (seekEntryOrOpen!0 key!828 (_keys!4980 thiss!1248) (mask!7708 thiss!1248))))))

(assert (= (and start!15936 res!74709) b!158228))

(assert (= (and b!158228 res!74710) b!158234))

(assert (= (and b!158234 res!74708) b!158233))

(assert (= (and b!158233 res!74707) b!158230))

(assert (= (and b!158232 condMapEmpty!5595) mapIsEmpty!5595))

(assert (= (and b!158232 (not condMapEmpty!5595)) mapNonEmpty!5595))

(assert (= (and mapNonEmpty!5595 ((_ is ValueCellFull!1298) mapValue!5595)) b!158229))

(assert (= (and b!158232 ((_ is ValueCellFull!1298) mapDefault!5595)) b!158227))

(assert (= b!158231 b!158232))

(assert (= start!15936 b!158231))

(declare-fun m!190517 () Bool)

(assert (=> b!158231 m!190517))

(declare-fun m!190519 () Bool)

(assert (=> b!158231 m!190519))

(declare-fun m!190521 () Bool)

(assert (=> mapNonEmpty!5595 m!190521))

(declare-fun m!190523 () Bool)

(assert (=> start!15936 m!190523))

(declare-fun m!190525 () Bool)

(assert (=> b!158233 m!190525))

(declare-fun m!190527 () Bool)

(assert (=> b!158234 m!190527))

(check-sat (not b!158233) b_and!9869 (not b_next!3481) tp_is_empty!3283 (not b!158231) (not mapNonEmpty!5595) (not b!158234) (not start!15936))
(check-sat b_and!9869 (not b_next!3481))
(get-model)

(declare-fun d!51025 () Bool)

(assert (=> d!51025 (= (validMask!0 (mask!7708 thiss!1248)) (and (or (= (mask!7708 thiss!1248) #b00000000000000000000000000000111) (= (mask!7708 thiss!1248) #b00000000000000000000000000001111) (= (mask!7708 thiss!1248) #b00000000000000000000000000011111) (= (mask!7708 thiss!1248) #b00000000000000000000000000111111) (= (mask!7708 thiss!1248) #b00000000000000000000000001111111) (= (mask!7708 thiss!1248) #b00000000000000000000000011111111) (= (mask!7708 thiss!1248) #b00000000000000000000000111111111) (= (mask!7708 thiss!1248) #b00000000000000000000001111111111) (= (mask!7708 thiss!1248) #b00000000000000000000011111111111) (= (mask!7708 thiss!1248) #b00000000000000000000111111111111) (= (mask!7708 thiss!1248) #b00000000000000000001111111111111) (= (mask!7708 thiss!1248) #b00000000000000000011111111111111) (= (mask!7708 thiss!1248) #b00000000000000000111111111111111) (= (mask!7708 thiss!1248) #b00000000000000001111111111111111) (= (mask!7708 thiss!1248) #b00000000000000011111111111111111) (= (mask!7708 thiss!1248) #b00000000000000111111111111111111) (= (mask!7708 thiss!1248) #b00000000000001111111111111111111) (= (mask!7708 thiss!1248) #b00000000000011111111111111111111) (= (mask!7708 thiss!1248) #b00000000000111111111111111111111) (= (mask!7708 thiss!1248) #b00000000001111111111111111111111) (= (mask!7708 thiss!1248) #b00000000011111111111111111111111) (= (mask!7708 thiss!1248) #b00000000111111111111111111111111) (= (mask!7708 thiss!1248) #b00000001111111111111111111111111) (= (mask!7708 thiss!1248) #b00000011111111111111111111111111) (= (mask!7708 thiss!1248) #b00000111111111111111111111111111) (= (mask!7708 thiss!1248) #b00001111111111111111111111111111) (= (mask!7708 thiss!1248) #b00011111111111111111111111111111) (= (mask!7708 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7708 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!158233 d!51025))

(declare-fun d!51027 () Bool)

(declare-fun lt!81672 () SeekEntryResult!303)

(assert (=> d!51027 (and (or ((_ is Undefined!303) lt!81672) (not ((_ is Found!303) lt!81672)) (and (bvsge (index!3381 lt!81672) #b00000000000000000000000000000000) (bvslt (index!3381 lt!81672) (size!2939 (_keys!4980 thiss!1248))))) (or ((_ is Undefined!303) lt!81672) ((_ is Found!303) lt!81672) (not ((_ is MissingZero!303) lt!81672)) (and (bvsge (index!3380 lt!81672) #b00000000000000000000000000000000) (bvslt (index!3380 lt!81672) (size!2939 (_keys!4980 thiss!1248))))) (or ((_ is Undefined!303) lt!81672) ((_ is Found!303) lt!81672) ((_ is MissingZero!303) lt!81672) (not ((_ is MissingVacant!303) lt!81672)) (and (bvsge (index!3383 lt!81672) #b00000000000000000000000000000000) (bvslt (index!3383 lt!81672) (size!2939 (_keys!4980 thiss!1248))))) (or ((_ is Undefined!303) lt!81672) (ite ((_ is Found!303) lt!81672) (= (select (arr!2656 (_keys!4980 thiss!1248)) (index!3381 lt!81672)) key!828) (ite ((_ is MissingZero!303) lt!81672) (= (select (arr!2656 (_keys!4980 thiss!1248)) (index!3380 lt!81672)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!303) lt!81672) (= (select (arr!2656 (_keys!4980 thiss!1248)) (index!3383 lt!81672)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!103670 () SeekEntryResult!303)

(assert (=> d!51027 (= lt!81672 e!103670)))

(declare-fun c!29793 () Bool)

(declare-fun lt!81671 () SeekEntryResult!303)

(assert (=> d!51027 (= c!29793 (and ((_ is Intermediate!303) lt!81671) (undefined!1115 lt!81671)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5615 (_ BitVec 32)) SeekEntryResult!303)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51027 (= lt!81671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7708 thiss!1248)) key!828 (_keys!4980 thiss!1248) (mask!7708 thiss!1248)))))

(assert (=> d!51027 (validMask!0 (mask!7708 thiss!1248))))

(assert (=> d!51027 (= (seekEntryOrOpen!0 key!828 (_keys!4980 thiss!1248) (mask!7708 thiss!1248)) lt!81672)))

(declare-fun b!158295 () Bool)

(declare-fun e!103669 () SeekEntryResult!303)

(assert (=> b!158295 (= e!103669 (MissingZero!303 (index!3382 lt!81671)))))

(declare-fun b!158296 () Bool)

(declare-fun c!29795 () Bool)

(declare-fun lt!81670 () (_ BitVec 64))

(assert (=> b!158296 (= c!29795 (= lt!81670 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!103671 () SeekEntryResult!303)

(assert (=> b!158296 (= e!103671 e!103669)))

(declare-fun b!158297 () Bool)

(assert (=> b!158297 (= e!103671 (Found!303 (index!3382 lt!81671)))))

(declare-fun b!158298 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5615 (_ BitVec 32)) SeekEntryResult!303)

(assert (=> b!158298 (= e!103669 (seekKeyOrZeroReturnVacant!0 (x!17484 lt!81671) (index!3382 lt!81671) (index!3382 lt!81671) key!828 (_keys!4980 thiss!1248) (mask!7708 thiss!1248)))))

(declare-fun b!158299 () Bool)

(assert (=> b!158299 (= e!103670 Undefined!303)))

(declare-fun b!158300 () Bool)

(assert (=> b!158300 (= e!103670 e!103671)))

(assert (=> b!158300 (= lt!81670 (select (arr!2656 (_keys!4980 thiss!1248)) (index!3382 lt!81671)))))

(declare-fun c!29794 () Bool)

(assert (=> b!158300 (= c!29794 (= lt!81670 key!828))))

(assert (= (and d!51027 c!29793) b!158299))

(assert (= (and d!51027 (not c!29793)) b!158300))

(assert (= (and b!158300 c!29794) b!158297))

(assert (= (and b!158300 (not c!29794)) b!158296))

(assert (= (and b!158296 c!29795) b!158295))

(assert (= (and b!158296 (not c!29795)) b!158298))

(declare-fun m!190553 () Bool)

(assert (=> d!51027 m!190553))

(declare-fun m!190555 () Bool)

(assert (=> d!51027 m!190555))

(assert (=> d!51027 m!190525))

(declare-fun m!190557 () Bool)

(assert (=> d!51027 m!190557))

(assert (=> d!51027 m!190553))

(declare-fun m!190559 () Bool)

(assert (=> d!51027 m!190559))

(declare-fun m!190561 () Bool)

(assert (=> d!51027 m!190561))

(declare-fun m!190563 () Bool)

(assert (=> b!158298 m!190563))

(declare-fun m!190565 () Bool)

(assert (=> b!158300 m!190565))

(assert (=> b!158234 d!51027))

(declare-fun d!51029 () Bool)

(assert (=> d!51029 (= (array_inv!1707 (_keys!4980 thiss!1248)) (bvsge (size!2939 (_keys!4980 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158231 d!51029))

(declare-fun d!51031 () Bool)

(assert (=> d!51031 (= (array_inv!1708 (_values!3177 thiss!1248)) (bvsge (size!2940 (_values!3177 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!158231 d!51031))

(declare-fun d!51033 () Bool)

(declare-fun res!74741 () Bool)

(declare-fun e!103674 () Bool)

(assert (=> d!51033 (=> (not res!74741) (not e!103674))))

(declare-fun simpleValid!113 (LongMapFixedSize!1504) Bool)

(assert (=> d!51033 (= res!74741 (simpleValid!113 thiss!1248))))

(assert (=> d!51033 (= (valid!713 thiss!1248) e!103674)))

(declare-fun b!158307 () Bool)

(declare-fun res!74742 () Bool)

(assert (=> b!158307 (=> (not res!74742) (not e!103674))))

(declare-fun arrayCountValidKeys!0 (array!5615 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158307 (= res!74742 (= (arrayCountValidKeys!0 (_keys!4980 thiss!1248) #b00000000000000000000000000000000 (size!2939 (_keys!4980 thiss!1248))) (_size!801 thiss!1248)))))

(declare-fun b!158308 () Bool)

(declare-fun res!74743 () Bool)

(assert (=> b!158308 (=> (not res!74743) (not e!103674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5615 (_ BitVec 32)) Bool)

(assert (=> b!158308 (= res!74743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4980 thiss!1248) (mask!7708 thiss!1248)))))

(declare-fun b!158309 () Bool)

(declare-datatypes ((List!1887 0))(
  ( (Nil!1884) (Cons!1883 (h!2494 (_ BitVec 64)) (t!6680 List!1887)) )
))
(declare-fun arrayNoDuplicates!0 (array!5615 (_ BitVec 32) List!1887) Bool)

(assert (=> b!158309 (= e!103674 (arrayNoDuplicates!0 (_keys!4980 thiss!1248) #b00000000000000000000000000000000 Nil!1884))))

(assert (= (and d!51033 res!74741) b!158307))

(assert (= (and b!158307 res!74742) b!158308))

(assert (= (and b!158308 res!74743) b!158309))

(declare-fun m!190567 () Bool)

(assert (=> d!51033 m!190567))

(declare-fun m!190569 () Bool)

(assert (=> b!158307 m!190569))

(declare-fun m!190571 () Bool)

(assert (=> b!158308 m!190571))

(declare-fun m!190573 () Bool)

(assert (=> b!158309 m!190573))

(assert (=> start!15936 d!51033))

(declare-fun mapIsEmpty!5604 () Bool)

(declare-fun mapRes!5604 () Bool)

(assert (=> mapIsEmpty!5604 mapRes!5604))

(declare-fun b!158316 () Bool)

(declare-fun e!103679 () Bool)

(assert (=> b!158316 (= e!103679 tp_is_empty!3283)))

(declare-fun b!158317 () Bool)

(declare-fun e!103680 () Bool)

(assert (=> b!158317 (= e!103680 tp_is_empty!3283)))

(declare-fun condMapEmpty!5604 () Bool)

(declare-fun mapDefault!5604 () ValueCell!1298)

(assert (=> mapNonEmpty!5595 (= condMapEmpty!5604 (= mapRest!5595 ((as const (Array (_ BitVec 32) ValueCell!1298)) mapDefault!5604)))))

(assert (=> mapNonEmpty!5595 (= tp!12996 (and e!103680 mapRes!5604))))

(declare-fun mapNonEmpty!5604 () Bool)

(declare-fun tp!13011 () Bool)

(assert (=> mapNonEmpty!5604 (= mapRes!5604 (and tp!13011 e!103679))))

(declare-fun mapRest!5604 () (Array (_ BitVec 32) ValueCell!1298))

(declare-fun mapValue!5604 () ValueCell!1298)

(declare-fun mapKey!5604 () (_ BitVec 32))

(assert (=> mapNonEmpty!5604 (= mapRest!5595 (store mapRest!5604 mapKey!5604 mapValue!5604))))

(assert (= (and mapNonEmpty!5595 condMapEmpty!5604) mapIsEmpty!5604))

(assert (= (and mapNonEmpty!5595 (not condMapEmpty!5604)) mapNonEmpty!5604))

(assert (= (and mapNonEmpty!5604 ((_ is ValueCellFull!1298) mapValue!5604)) b!158316))

(assert (= (and mapNonEmpty!5595 ((_ is ValueCellFull!1298) mapDefault!5604)) b!158317))

(declare-fun m!190575 () Bool)

(assert (=> mapNonEmpty!5604 m!190575))

(check-sat (not mapNonEmpty!5604) (not d!51027) (not b!158309) (not b!158298) b_and!9869 (not b_next!3481) (not b!158307) (not b!158308) tp_is_empty!3283 (not d!51033))
(check-sat b_and!9869 (not b_next!3481))
(get-model)

(declare-fun d!51035 () Bool)

(declare-fun res!74749 () Bool)

(declare-fun e!103689 () Bool)

(assert (=> d!51035 (=> res!74749 e!103689)))

(assert (=> d!51035 (= res!74749 (bvsge #b00000000000000000000000000000000 (size!2939 (_keys!4980 thiss!1248))))))

(assert (=> d!51035 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4980 thiss!1248) (mask!7708 thiss!1248)) e!103689)))

(declare-fun b!158326 () Bool)

(declare-fun e!103687 () Bool)

(assert (=> b!158326 (= e!103689 e!103687)))

(declare-fun c!29798 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!158326 (= c!29798 (validKeyInArray!0 (select (arr!2656 (_keys!4980 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158327 () Bool)

(declare-fun call!17230 () Bool)

(assert (=> b!158327 (= e!103687 call!17230)))

(declare-fun b!158328 () Bool)

(declare-fun e!103688 () Bool)

(assert (=> b!158328 (= e!103687 e!103688)))

(declare-fun lt!81681 () (_ BitVec 64))

(assert (=> b!158328 (= lt!81681 (select (arr!2656 (_keys!4980 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4962 0))(
  ( (Unit!4963) )
))
(declare-fun lt!81679 () Unit!4962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5615 (_ BitVec 64) (_ BitVec 32)) Unit!4962)

(assert (=> b!158328 (= lt!81679 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4980 thiss!1248) lt!81681 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158328 (arrayContainsKey!0 (_keys!4980 thiss!1248) lt!81681 #b00000000000000000000000000000000)))

(declare-fun lt!81680 () Unit!4962)

(assert (=> b!158328 (= lt!81680 lt!81679)))

(declare-fun res!74748 () Bool)

(assert (=> b!158328 (= res!74748 (= (seekEntryOrOpen!0 (select (arr!2656 (_keys!4980 thiss!1248)) #b00000000000000000000000000000000) (_keys!4980 thiss!1248) (mask!7708 thiss!1248)) (Found!303 #b00000000000000000000000000000000)))))

(assert (=> b!158328 (=> (not res!74748) (not e!103688))))

(declare-fun b!158329 () Bool)

(assert (=> b!158329 (= e!103688 call!17230)))

(declare-fun bm!17227 () Bool)

(assert (=> bm!17227 (= call!17230 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4980 thiss!1248) (mask!7708 thiss!1248)))))

(assert (= (and d!51035 (not res!74749)) b!158326))

(assert (= (and b!158326 c!29798) b!158328))

(assert (= (and b!158326 (not c!29798)) b!158327))

(assert (= (and b!158328 res!74748) b!158329))

(assert (= (or b!158329 b!158327) bm!17227))

(declare-fun m!190577 () Bool)

(assert (=> b!158326 m!190577))

(assert (=> b!158326 m!190577))

(declare-fun m!190579 () Bool)

(assert (=> b!158326 m!190579))

(assert (=> b!158328 m!190577))

(declare-fun m!190581 () Bool)

(assert (=> b!158328 m!190581))

(declare-fun m!190583 () Bool)

(assert (=> b!158328 m!190583))

(assert (=> b!158328 m!190577))

(declare-fun m!190585 () Bool)

(assert (=> b!158328 m!190585))

(declare-fun m!190587 () Bool)

(assert (=> bm!17227 m!190587))

(assert (=> b!158308 d!51035))

(declare-fun d!51037 () Bool)

(declare-fun res!74758 () Bool)

(declare-fun e!103692 () Bool)

(assert (=> d!51037 (=> (not res!74758) (not e!103692))))

(assert (=> d!51037 (= res!74758 (validMask!0 (mask!7708 thiss!1248)))))

(assert (=> d!51037 (= (simpleValid!113 thiss!1248) e!103692)))

(declare-fun b!158340 () Bool)

(declare-fun res!74761 () Bool)

(assert (=> b!158340 (=> (not res!74761) (not e!103692))))

(declare-fun size!2945 (LongMapFixedSize!1504) (_ BitVec 32))

(assert (=> b!158340 (= res!74761 (= (size!2945 thiss!1248) (bvadd (_size!801 thiss!1248) (bvsdiv (bvadd (extraKeys!2935 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!158338 () Bool)

(declare-fun res!74760 () Bool)

(assert (=> b!158338 (=> (not res!74760) (not e!103692))))

(assert (=> b!158338 (= res!74760 (and (= (size!2940 (_values!3177 thiss!1248)) (bvadd (mask!7708 thiss!1248) #b00000000000000000000000000000001)) (= (size!2939 (_keys!4980 thiss!1248)) (size!2940 (_values!3177 thiss!1248))) (bvsge (_size!801 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!801 thiss!1248) (bvadd (mask!7708 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!158339 () Bool)

(declare-fun res!74759 () Bool)

(assert (=> b!158339 (=> (not res!74759) (not e!103692))))

(assert (=> b!158339 (= res!74759 (bvsge (size!2945 thiss!1248) (_size!801 thiss!1248)))))

(declare-fun b!158341 () Bool)

(assert (=> b!158341 (= e!103692 (and (bvsge (extraKeys!2935 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2935 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!801 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!51037 res!74758) b!158338))

(assert (= (and b!158338 res!74760) b!158339))

(assert (= (and b!158339 res!74759) b!158340))

(assert (= (and b!158340 res!74761) b!158341))

(assert (=> d!51037 m!190525))

(declare-fun m!190589 () Bool)

(assert (=> b!158340 m!190589))

(assert (=> b!158339 m!190589))

(assert (=> d!51033 d!51037))

(declare-fun b!158360 () Bool)

(declare-fun lt!81686 () SeekEntryResult!303)

(assert (=> b!158360 (and (bvsge (index!3382 lt!81686) #b00000000000000000000000000000000) (bvslt (index!3382 lt!81686) (size!2939 (_keys!4980 thiss!1248))))))

(declare-fun e!103706 () Bool)

(assert (=> b!158360 (= e!103706 (= (select (arr!2656 (_keys!4980 thiss!1248)) (index!3382 lt!81686)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!158361 () Bool)

(declare-fun e!103705 () SeekEntryResult!303)

(declare-fun e!103707 () SeekEntryResult!303)

(assert (=> b!158361 (= e!103705 e!103707)))

(declare-fun c!29805 () Bool)

(declare-fun lt!81687 () (_ BitVec 64))

(assert (=> b!158361 (= c!29805 (or (= lt!81687 key!828) (= (bvadd lt!81687 lt!81687) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!158362 () Bool)

(assert (=> b!158362 (= e!103707 (Intermediate!303 false (toIndex!0 key!828 (mask!7708 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!51039 () Bool)

(declare-fun e!103704 () Bool)

(assert (=> d!51039 e!103704))

(declare-fun c!29807 () Bool)

(assert (=> d!51039 (= c!29807 (and ((_ is Intermediate!303) lt!81686) (undefined!1115 lt!81686)))))

(assert (=> d!51039 (= lt!81686 e!103705)))

(declare-fun c!29806 () Bool)

(assert (=> d!51039 (= c!29806 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51039 (= lt!81687 (select (arr!2656 (_keys!4980 thiss!1248)) (toIndex!0 key!828 (mask!7708 thiss!1248))))))

(assert (=> d!51039 (validMask!0 (mask!7708 thiss!1248))))

(assert (=> d!51039 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7708 thiss!1248)) key!828 (_keys!4980 thiss!1248) (mask!7708 thiss!1248)) lt!81686)))

(declare-fun b!158363 () Bool)

(assert (=> b!158363 (= e!103704 (bvsge (x!17484 lt!81686) #b01111111111111111111111111111110))))

(declare-fun b!158364 () Bool)

(assert (=> b!158364 (and (bvsge (index!3382 lt!81686) #b00000000000000000000000000000000) (bvslt (index!3382 lt!81686) (size!2939 (_keys!4980 thiss!1248))))))

(declare-fun res!74769 () Bool)

(assert (=> b!158364 (= res!74769 (= (select (arr!2656 (_keys!4980 thiss!1248)) (index!3382 lt!81686)) key!828))))

(assert (=> b!158364 (=> res!74769 e!103706)))

(declare-fun e!103703 () Bool)

(assert (=> b!158364 (= e!103703 e!103706)))

(declare-fun b!158365 () Bool)

(assert (=> b!158365 (= e!103705 (Intermediate!303 true (toIndex!0 key!828 (mask!7708 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!158366 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!158366 (= e!103707 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7708 thiss!1248)) #b00000000000000000000000000000000 (mask!7708 thiss!1248)) key!828 (_keys!4980 thiss!1248) (mask!7708 thiss!1248)))))

(declare-fun b!158367 () Bool)

(assert (=> b!158367 (= e!103704 e!103703)))

(declare-fun res!74768 () Bool)

(assert (=> b!158367 (= res!74768 (and ((_ is Intermediate!303) lt!81686) (not (undefined!1115 lt!81686)) (bvslt (x!17484 lt!81686) #b01111111111111111111111111111110) (bvsge (x!17484 lt!81686) #b00000000000000000000000000000000) (bvsge (x!17484 lt!81686) #b00000000000000000000000000000000)))))

(assert (=> b!158367 (=> (not res!74768) (not e!103703))))

(declare-fun b!158368 () Bool)

(assert (=> b!158368 (and (bvsge (index!3382 lt!81686) #b00000000000000000000000000000000) (bvslt (index!3382 lt!81686) (size!2939 (_keys!4980 thiss!1248))))))

(declare-fun res!74770 () Bool)

(assert (=> b!158368 (= res!74770 (= (select (arr!2656 (_keys!4980 thiss!1248)) (index!3382 lt!81686)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158368 (=> res!74770 e!103706)))

(assert (= (and d!51039 c!29806) b!158365))

(assert (= (and d!51039 (not c!29806)) b!158361))

(assert (= (and b!158361 c!29805) b!158362))

(assert (= (and b!158361 (not c!29805)) b!158366))

(assert (= (and d!51039 c!29807) b!158363))

(assert (= (and d!51039 (not c!29807)) b!158367))

(assert (= (and b!158367 res!74768) b!158364))

(assert (= (and b!158364 (not res!74769)) b!158368))

(assert (= (and b!158368 (not res!74770)) b!158360))

(declare-fun m!190591 () Bool)

(assert (=> b!158360 m!190591))

(assert (=> b!158366 m!190553))

(declare-fun m!190593 () Bool)

(assert (=> b!158366 m!190593))

(assert (=> b!158366 m!190593))

(declare-fun m!190595 () Bool)

(assert (=> b!158366 m!190595))

(assert (=> b!158364 m!190591))

(assert (=> d!51039 m!190553))

(declare-fun m!190597 () Bool)

(assert (=> d!51039 m!190597))

(assert (=> d!51039 m!190525))

(assert (=> b!158368 m!190591))

(assert (=> d!51027 d!51039))

(declare-fun d!51041 () Bool)

(declare-fun lt!81693 () (_ BitVec 32))

(declare-fun lt!81692 () (_ BitVec 32))

(assert (=> d!51041 (= lt!81693 (bvmul (bvxor lt!81692 (bvlshr lt!81692 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51041 (= lt!81692 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51041 (and (bvsge (mask!7708 thiss!1248) #b00000000000000000000000000000000) (let ((res!74771 (let ((h!2495 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17500 (bvmul (bvxor h!2495 (bvlshr h!2495 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17500 (bvlshr x!17500 #b00000000000000000000000000001101)) (mask!7708 thiss!1248)))))) (and (bvslt res!74771 (bvadd (mask!7708 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74771 #b00000000000000000000000000000000))))))

(assert (=> d!51041 (= (toIndex!0 key!828 (mask!7708 thiss!1248)) (bvand (bvxor lt!81693 (bvlshr lt!81693 #b00000000000000000000000000001101)) (mask!7708 thiss!1248)))))

(assert (=> d!51027 d!51041))

(assert (=> d!51027 d!51025))

(declare-fun b!158377 () Bool)

(declare-fun e!103713 () (_ BitVec 32))

(declare-fun call!17233 () (_ BitVec 32))

(assert (=> b!158377 (= e!103713 (bvadd #b00000000000000000000000000000001 call!17233))))

(declare-fun b!158378 () Bool)

(declare-fun e!103712 () (_ BitVec 32))

(assert (=> b!158378 (= e!103712 #b00000000000000000000000000000000)))

(declare-fun b!158379 () Bool)

(assert (=> b!158379 (= e!103712 e!103713)))

(declare-fun c!29812 () Bool)

(assert (=> b!158379 (= c!29812 (validKeyInArray!0 (select (arr!2656 (_keys!4980 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17230 () Bool)

(assert (=> bm!17230 (= call!17233 (arrayCountValidKeys!0 (_keys!4980 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2939 (_keys!4980 thiss!1248))))))

(declare-fun b!158380 () Bool)

(assert (=> b!158380 (= e!103713 call!17233)))

(declare-fun d!51043 () Bool)

(declare-fun lt!81696 () (_ BitVec 32))

(assert (=> d!51043 (and (bvsge lt!81696 #b00000000000000000000000000000000) (bvsle lt!81696 (bvsub (size!2939 (_keys!4980 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51043 (= lt!81696 e!103712)))

(declare-fun c!29813 () Bool)

(assert (=> d!51043 (= c!29813 (bvsge #b00000000000000000000000000000000 (size!2939 (_keys!4980 thiss!1248))))))

(assert (=> d!51043 (and (bvsle #b00000000000000000000000000000000 (size!2939 (_keys!4980 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2939 (_keys!4980 thiss!1248)) (size!2939 (_keys!4980 thiss!1248))))))

(assert (=> d!51043 (= (arrayCountValidKeys!0 (_keys!4980 thiss!1248) #b00000000000000000000000000000000 (size!2939 (_keys!4980 thiss!1248))) lt!81696)))

(assert (= (and d!51043 c!29813) b!158378))

(assert (= (and d!51043 (not c!29813)) b!158379))

(assert (= (and b!158379 c!29812) b!158377))

(assert (= (and b!158379 (not c!29812)) b!158380))

(assert (= (or b!158377 b!158380) bm!17230))

(assert (=> b!158379 m!190577))

(assert (=> b!158379 m!190577))

(assert (=> b!158379 m!190579))

(declare-fun m!190599 () Bool)

(assert (=> bm!17230 m!190599))

(assert (=> b!158307 d!51043))

(declare-fun b!158393 () Bool)

(declare-fun e!103721 () SeekEntryResult!303)

(assert (=> b!158393 (= e!103721 (MissingVacant!303 (index!3382 lt!81671)))))

(declare-fun lt!81701 () SeekEntryResult!303)

(declare-fun d!51045 () Bool)

(assert (=> d!51045 (and (or ((_ is Undefined!303) lt!81701) (not ((_ is Found!303) lt!81701)) (and (bvsge (index!3381 lt!81701) #b00000000000000000000000000000000) (bvslt (index!3381 lt!81701) (size!2939 (_keys!4980 thiss!1248))))) (or ((_ is Undefined!303) lt!81701) ((_ is Found!303) lt!81701) (not ((_ is MissingVacant!303) lt!81701)) (not (= (index!3383 lt!81701) (index!3382 lt!81671))) (and (bvsge (index!3383 lt!81701) #b00000000000000000000000000000000) (bvslt (index!3383 lt!81701) (size!2939 (_keys!4980 thiss!1248))))) (or ((_ is Undefined!303) lt!81701) (ite ((_ is Found!303) lt!81701) (= (select (arr!2656 (_keys!4980 thiss!1248)) (index!3381 lt!81701)) key!828) (and ((_ is MissingVacant!303) lt!81701) (= (index!3383 lt!81701) (index!3382 lt!81671)) (= (select (arr!2656 (_keys!4980 thiss!1248)) (index!3383 lt!81701)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!103720 () SeekEntryResult!303)

(assert (=> d!51045 (= lt!81701 e!103720)))

(declare-fun c!29822 () Bool)

(assert (=> d!51045 (= c!29822 (bvsge (x!17484 lt!81671) #b01111111111111111111111111111110))))

(declare-fun lt!81702 () (_ BitVec 64))

(assert (=> d!51045 (= lt!81702 (select (arr!2656 (_keys!4980 thiss!1248)) (index!3382 lt!81671)))))

(assert (=> d!51045 (validMask!0 (mask!7708 thiss!1248))))

(assert (=> d!51045 (= (seekKeyOrZeroReturnVacant!0 (x!17484 lt!81671) (index!3382 lt!81671) (index!3382 lt!81671) key!828 (_keys!4980 thiss!1248) (mask!7708 thiss!1248)) lt!81701)))

(declare-fun b!158394 () Bool)

(assert (=> b!158394 (= e!103721 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17484 lt!81671) #b00000000000000000000000000000001) (nextIndex!0 (index!3382 lt!81671) (x!17484 lt!81671) (mask!7708 thiss!1248)) (index!3382 lt!81671) key!828 (_keys!4980 thiss!1248) (mask!7708 thiss!1248)))))

(declare-fun b!158395 () Bool)

(declare-fun e!103722 () SeekEntryResult!303)

(assert (=> b!158395 (= e!103722 (Found!303 (index!3382 lt!81671)))))

(declare-fun b!158396 () Bool)

(assert (=> b!158396 (= e!103720 e!103722)))

(declare-fun c!29820 () Bool)

(assert (=> b!158396 (= c!29820 (= lt!81702 key!828))))

(declare-fun b!158397 () Bool)

(declare-fun c!29821 () Bool)

(assert (=> b!158397 (= c!29821 (= lt!81702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!158397 (= e!103722 e!103721)))

(declare-fun b!158398 () Bool)

(assert (=> b!158398 (= e!103720 Undefined!303)))

(assert (= (and d!51045 c!29822) b!158398))

(assert (= (and d!51045 (not c!29822)) b!158396))

(assert (= (and b!158396 c!29820) b!158395))

(assert (= (and b!158396 (not c!29820)) b!158397))

(assert (= (and b!158397 c!29821) b!158393))

(assert (= (and b!158397 (not c!29821)) b!158394))

(declare-fun m!190601 () Bool)

(assert (=> d!51045 m!190601))

(declare-fun m!190603 () Bool)

(assert (=> d!51045 m!190603))

(assert (=> d!51045 m!190565))

(assert (=> d!51045 m!190525))

(declare-fun m!190605 () Bool)

(assert (=> b!158394 m!190605))

(assert (=> b!158394 m!190605))

(declare-fun m!190607 () Bool)

(assert (=> b!158394 m!190607))

(assert (=> b!158298 d!51045))

(declare-fun b!158409 () Bool)

(declare-fun e!103733 () Bool)

(declare-fun call!17236 () Bool)

(assert (=> b!158409 (= e!103733 call!17236)))

(declare-fun b!158410 () Bool)

(declare-fun e!103734 () Bool)

(declare-fun contains!966 (List!1887 (_ BitVec 64)) Bool)

(assert (=> b!158410 (= e!103734 (contains!966 Nil!1884 (select (arr!2656 (_keys!4980 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17233 () Bool)

(declare-fun c!29825 () Bool)

(assert (=> bm!17233 (= call!17236 (arrayNoDuplicates!0 (_keys!4980 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29825 (Cons!1883 (select (arr!2656 (_keys!4980 thiss!1248)) #b00000000000000000000000000000000) Nil!1884) Nil!1884)))))

(declare-fun b!158411 () Bool)

(declare-fun e!103732 () Bool)

(declare-fun e!103731 () Bool)

(assert (=> b!158411 (= e!103732 e!103731)))

(declare-fun res!74779 () Bool)

(assert (=> b!158411 (=> (not res!74779) (not e!103731))))

(assert (=> b!158411 (= res!74779 (not e!103734))))

(declare-fun res!74778 () Bool)

(assert (=> b!158411 (=> (not res!74778) (not e!103734))))

(assert (=> b!158411 (= res!74778 (validKeyInArray!0 (select (arr!2656 (_keys!4980 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!158412 () Bool)

(assert (=> b!158412 (= e!103731 e!103733)))

(assert (=> b!158412 (= c!29825 (validKeyInArray!0 (select (arr!2656 (_keys!4980 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51047 () Bool)

(declare-fun res!74780 () Bool)

(assert (=> d!51047 (=> res!74780 e!103732)))

(assert (=> d!51047 (= res!74780 (bvsge #b00000000000000000000000000000000 (size!2939 (_keys!4980 thiss!1248))))))

(assert (=> d!51047 (= (arrayNoDuplicates!0 (_keys!4980 thiss!1248) #b00000000000000000000000000000000 Nil!1884) e!103732)))

(declare-fun b!158413 () Bool)

(assert (=> b!158413 (= e!103733 call!17236)))

(assert (= (and d!51047 (not res!74780)) b!158411))

(assert (= (and b!158411 res!74778) b!158410))

(assert (= (and b!158411 res!74779) b!158412))

(assert (= (and b!158412 c!29825) b!158413))

(assert (= (and b!158412 (not c!29825)) b!158409))

(assert (= (or b!158413 b!158409) bm!17233))

(assert (=> b!158410 m!190577))

(assert (=> b!158410 m!190577))

(declare-fun m!190609 () Bool)

(assert (=> b!158410 m!190609))

(assert (=> bm!17233 m!190577))

(declare-fun m!190611 () Bool)

(assert (=> bm!17233 m!190611))

(assert (=> b!158411 m!190577))

(assert (=> b!158411 m!190577))

(assert (=> b!158411 m!190579))

(assert (=> b!158412 m!190577))

(assert (=> b!158412 m!190577))

(assert (=> b!158412 m!190579))

(assert (=> b!158309 d!51047))

(declare-fun mapIsEmpty!5605 () Bool)

(declare-fun mapRes!5605 () Bool)

(assert (=> mapIsEmpty!5605 mapRes!5605))

(declare-fun b!158414 () Bool)

(declare-fun e!103735 () Bool)

(assert (=> b!158414 (= e!103735 tp_is_empty!3283)))

(declare-fun b!158415 () Bool)

(declare-fun e!103736 () Bool)

(assert (=> b!158415 (= e!103736 tp_is_empty!3283)))

(declare-fun condMapEmpty!5605 () Bool)

(declare-fun mapDefault!5605 () ValueCell!1298)

(assert (=> mapNonEmpty!5604 (= condMapEmpty!5605 (= mapRest!5604 ((as const (Array (_ BitVec 32) ValueCell!1298)) mapDefault!5605)))))

(assert (=> mapNonEmpty!5604 (= tp!13011 (and e!103736 mapRes!5605))))

(declare-fun mapNonEmpty!5605 () Bool)

(declare-fun tp!13012 () Bool)

(assert (=> mapNonEmpty!5605 (= mapRes!5605 (and tp!13012 e!103735))))

(declare-fun mapValue!5605 () ValueCell!1298)

(declare-fun mapKey!5605 () (_ BitVec 32))

(declare-fun mapRest!5605 () (Array (_ BitVec 32) ValueCell!1298))

(assert (=> mapNonEmpty!5605 (= mapRest!5604 (store mapRest!5605 mapKey!5605 mapValue!5605))))

(assert (= (and mapNonEmpty!5604 condMapEmpty!5605) mapIsEmpty!5605))

(assert (= (and mapNonEmpty!5604 (not condMapEmpty!5605)) mapNonEmpty!5605))

(assert (= (and mapNonEmpty!5605 ((_ is ValueCellFull!1298) mapValue!5605)) b!158414))

(assert (= (and mapNonEmpty!5604 ((_ is ValueCellFull!1298) mapDefault!5605)) b!158415))

(declare-fun m!190613 () Bool)

(assert (=> mapNonEmpty!5605 m!190613))

(check-sat (not d!51037) (not bm!17233) (not d!51045) b_and!9869 (not d!51039) (not b!158410) (not b!158394) (not bm!17227) (not b!158366) (not bm!17230) (not mapNonEmpty!5605) (not b!158328) (not b_next!3481) (not b!158412) (not b!158340) tp_is_empty!3283 (not b!158411) (not b!158379) (not b!158326) (not b!158339))
(check-sat b_and!9869 (not b_next!3481))
