; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15860 () Bool)

(assert start!15860)

(declare-fun b!157711 () Bool)

(declare-fun b_free!3463 () Bool)

(declare-fun b_next!3463 () Bool)

(assert (=> b!157711 (= b_free!3463 (not b_next!3463))))

(declare-fun tp!12930 () Bool)

(declare-fun b_and!9851 () Bool)

(assert (=> b!157711 (= tp!12930 b_and!9851)))

(declare-fun res!74498 () Bool)

(declare-fun e!103297 () Bool)

(assert (=> start!15860 (=> (not res!74498) (not e!103297))))

(declare-datatypes ((V!4001 0))(
  ( (V!4002 (val!1677 Int)) )
))
(declare-datatypes ((ValueCell!1289 0))(
  ( (ValueCellFull!1289 (v!3536 V!4001)) (EmptyCell!1289) )
))
(declare-datatypes ((array!5573 0))(
  ( (array!5574 (arr!2638 (Array (_ BitVec 32) (_ BitVec 64))) (size!2919 (_ BitVec 32))) )
))
(declare-datatypes ((array!5575 0))(
  ( (array!5576 (arr!2639 (Array (_ BitVec 32) ValueCell!1289)) (size!2920 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1486 0))(
  ( (LongMapFixedSize!1487 (defaultEntry!3185 Int) (mask!7679 (_ BitVec 32)) (extraKeys!2926 (_ BitVec 32)) (zeroValue!3028 V!4001) (minValue!3028 V!4001) (_size!792 (_ BitVec 32)) (_keys!4962 array!5573) (_values!3168 array!5575) (_vacant!792 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1486)

(declare-fun valid!707 (LongMapFixedSize!1486) Bool)

(assert (=> start!15860 (= res!74498 (valid!707 thiss!1248))))

(assert (=> start!15860 e!103297))

(declare-fun e!103298 () Bool)

(assert (=> start!15860 e!103298))

(assert (=> start!15860 true))

(declare-fun b!157710 () Bool)

(declare-fun e!103296 () Bool)

(declare-fun tp_is_empty!3265 () Bool)

(assert (=> b!157710 (= e!103296 tp_is_empty!3265)))

(declare-fun mapIsEmpty!5557 () Bool)

(declare-fun mapRes!5557 () Bool)

(assert (=> mapIsEmpty!5557 mapRes!5557))

(declare-fun e!103294 () Bool)

(declare-fun array_inv!1695 (array!5573) Bool)

(declare-fun array_inv!1696 (array!5575) Bool)

(assert (=> b!157711 (= e!103298 (and tp!12930 tp_is_empty!3265 (array_inv!1695 (_keys!4962 thiss!1248)) (array_inv!1696 (_values!3168 thiss!1248)) e!103294))))

(declare-fun mapNonEmpty!5557 () Bool)

(declare-fun tp!12931 () Bool)

(assert (=> mapNonEmpty!5557 (= mapRes!5557 (and tp!12931 e!103296))))

(declare-fun mapKey!5557 () (_ BitVec 32))

(declare-fun mapValue!5557 () ValueCell!1289)

(declare-fun mapRest!5557 () (Array (_ BitVec 32) ValueCell!1289))

(assert (=> mapNonEmpty!5557 (= (arr!2639 (_values!3168 thiss!1248)) (store mapRest!5557 mapKey!5557 mapValue!5557))))

(declare-fun b!157712 () Bool)

(declare-fun res!74499 () Bool)

(assert (=> b!157712 (=> (not res!74499) (not e!103297))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157712 (= res!74499 (not (= key!828 (bvneg key!828))))))

(declare-fun b!157713 () Bool)

(declare-fun res!74501 () Bool)

(assert (=> b!157713 (=> (not res!74501) (not e!103297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!157713 (= res!74501 (validMask!0 (mask!7679 thiss!1248)))))

(declare-fun b!157714 () Bool)

(declare-fun e!103295 () Bool)

(assert (=> b!157714 (= e!103294 (and e!103295 mapRes!5557))))

(declare-fun condMapEmpty!5557 () Bool)

(declare-fun mapDefault!5557 () ValueCell!1289)

(assert (=> b!157714 (= condMapEmpty!5557 (= (arr!2639 (_values!3168 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1289)) mapDefault!5557)))))

(declare-fun b!157715 () Bool)

(assert (=> b!157715 (= e!103295 tp_is_empty!3265)))

(declare-fun b!157716 () Bool)

(assert (=> b!157716 (= e!103297 (not (= (size!2920 (_values!3168 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7679 thiss!1248)))))))

(declare-fun b!157717 () Bool)

(declare-fun res!74500 () Bool)

(assert (=> b!157717 (=> (not res!74500) (not e!103297))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!294 0))(
  ( (MissingZero!294 (index!3344 (_ BitVec 32))) (Found!294 (index!3345 (_ BitVec 32))) (Intermediate!294 (undefined!1106 Bool) (index!3346 (_ BitVec 32)) (x!17409 (_ BitVec 32))) (Undefined!294) (MissingVacant!294 (index!3347 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5573 (_ BitVec 32)) SeekEntryResult!294)

(assert (=> b!157717 (= res!74500 ((_ is Undefined!294) (seekEntryOrOpen!0 key!828 (_keys!4962 thiss!1248) (mask!7679 thiss!1248))))))

(assert (= (and start!15860 res!74498) b!157712))

(assert (= (and b!157712 res!74499) b!157717))

(assert (= (and b!157717 res!74500) b!157713))

(assert (= (and b!157713 res!74501) b!157716))

(assert (= (and b!157714 condMapEmpty!5557) mapIsEmpty!5557))

(assert (= (and b!157714 (not condMapEmpty!5557)) mapNonEmpty!5557))

(assert (= (and mapNonEmpty!5557 ((_ is ValueCellFull!1289) mapValue!5557)) b!157710))

(assert (= (and b!157714 ((_ is ValueCellFull!1289) mapDefault!5557)) b!157715))

(assert (= b!157711 b!157714))

(assert (= start!15860 b!157711))

(declare-fun m!190261 () Bool)

(assert (=> b!157713 m!190261))

(declare-fun m!190263 () Bool)

(assert (=> mapNonEmpty!5557 m!190263))

(declare-fun m!190265 () Bool)

(assert (=> start!15860 m!190265))

(declare-fun m!190267 () Bool)

(assert (=> b!157711 m!190267))

(declare-fun m!190269 () Bool)

(assert (=> b!157711 m!190269))

(declare-fun m!190271 () Bool)

(assert (=> b!157717 m!190271))

(check-sat (not mapNonEmpty!5557) (not b!157717) (not b!157713) (not start!15860) (not b_next!3463) (not b!157711) tp_is_empty!3265 b_and!9851)
(check-sat b_and!9851 (not b_next!3463))
(get-model)

(declare-fun b!157778 () Bool)

(declare-fun lt!81585 () SeekEntryResult!294)

(declare-fun e!103342 () SeekEntryResult!294)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5573 (_ BitVec 32)) SeekEntryResult!294)

(assert (=> b!157778 (= e!103342 (seekKeyOrZeroReturnVacant!0 (x!17409 lt!81585) (index!3346 lt!81585) (index!3346 lt!81585) key!828 (_keys!4962 thiss!1248) (mask!7679 thiss!1248)))))

(declare-fun b!157779 () Bool)

(declare-fun e!103341 () SeekEntryResult!294)

(declare-fun e!103343 () SeekEntryResult!294)

(assert (=> b!157779 (= e!103341 e!103343)))

(declare-fun lt!81584 () (_ BitVec 64))

(assert (=> b!157779 (= lt!81584 (select (arr!2638 (_keys!4962 thiss!1248)) (index!3346 lt!81585)))))

(declare-fun c!29706 () Bool)

(assert (=> b!157779 (= c!29706 (= lt!81584 key!828))))

(declare-fun b!157780 () Bool)

(declare-fun c!29708 () Bool)

(assert (=> b!157780 (= c!29708 (= lt!81584 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!157780 (= e!103343 e!103342)))

(declare-fun b!157781 () Bool)

(assert (=> b!157781 (= e!103341 Undefined!294)))

(declare-fun b!157782 () Bool)

(assert (=> b!157782 (= e!103343 (Found!294 (index!3346 lt!81585)))))

(declare-fun d!50961 () Bool)

(declare-fun lt!81583 () SeekEntryResult!294)

(assert (=> d!50961 (and (or ((_ is Undefined!294) lt!81583) (not ((_ is Found!294) lt!81583)) (and (bvsge (index!3345 lt!81583) #b00000000000000000000000000000000) (bvslt (index!3345 lt!81583) (size!2919 (_keys!4962 thiss!1248))))) (or ((_ is Undefined!294) lt!81583) ((_ is Found!294) lt!81583) (not ((_ is MissingZero!294) lt!81583)) (and (bvsge (index!3344 lt!81583) #b00000000000000000000000000000000) (bvslt (index!3344 lt!81583) (size!2919 (_keys!4962 thiss!1248))))) (or ((_ is Undefined!294) lt!81583) ((_ is Found!294) lt!81583) ((_ is MissingZero!294) lt!81583) (not ((_ is MissingVacant!294) lt!81583)) (and (bvsge (index!3347 lt!81583) #b00000000000000000000000000000000) (bvslt (index!3347 lt!81583) (size!2919 (_keys!4962 thiss!1248))))) (or ((_ is Undefined!294) lt!81583) (ite ((_ is Found!294) lt!81583) (= (select (arr!2638 (_keys!4962 thiss!1248)) (index!3345 lt!81583)) key!828) (ite ((_ is MissingZero!294) lt!81583) (= (select (arr!2638 (_keys!4962 thiss!1248)) (index!3344 lt!81583)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!294) lt!81583) (= (select (arr!2638 (_keys!4962 thiss!1248)) (index!3347 lt!81583)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!50961 (= lt!81583 e!103341)))

(declare-fun c!29707 () Bool)

(assert (=> d!50961 (= c!29707 (and ((_ is Intermediate!294) lt!81585) (undefined!1106 lt!81585)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!5573 (_ BitVec 32)) SeekEntryResult!294)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!50961 (= lt!81585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7679 thiss!1248)) key!828 (_keys!4962 thiss!1248) (mask!7679 thiss!1248)))))

(assert (=> d!50961 (validMask!0 (mask!7679 thiss!1248))))

(assert (=> d!50961 (= (seekEntryOrOpen!0 key!828 (_keys!4962 thiss!1248) (mask!7679 thiss!1248)) lt!81583)))

(declare-fun b!157783 () Bool)

(assert (=> b!157783 (= e!103342 (MissingZero!294 (index!3346 lt!81585)))))

(assert (= (and d!50961 c!29707) b!157781))

(assert (= (and d!50961 (not c!29707)) b!157779))

(assert (= (and b!157779 c!29706) b!157782))

(assert (= (and b!157779 (not c!29706)) b!157780))

(assert (= (and b!157780 c!29708) b!157783))

(assert (= (and b!157780 (not c!29708)) b!157778))

(declare-fun m!190297 () Bool)

(assert (=> b!157778 m!190297))

(declare-fun m!190299 () Bool)

(assert (=> b!157779 m!190299))

(assert (=> d!50961 m!190261))

(declare-fun m!190301 () Bool)

(assert (=> d!50961 m!190301))

(declare-fun m!190303 () Bool)

(assert (=> d!50961 m!190303))

(assert (=> d!50961 m!190303))

(declare-fun m!190305 () Bool)

(assert (=> d!50961 m!190305))

(declare-fun m!190307 () Bool)

(assert (=> d!50961 m!190307))

(declare-fun m!190309 () Bool)

(assert (=> d!50961 m!190309))

(assert (=> b!157717 d!50961))

(declare-fun d!50963 () Bool)

(assert (=> d!50963 (= (validMask!0 (mask!7679 thiss!1248)) (and (or (= (mask!7679 thiss!1248) #b00000000000000000000000000000111) (= (mask!7679 thiss!1248) #b00000000000000000000000000001111) (= (mask!7679 thiss!1248) #b00000000000000000000000000011111) (= (mask!7679 thiss!1248) #b00000000000000000000000000111111) (= (mask!7679 thiss!1248) #b00000000000000000000000001111111) (= (mask!7679 thiss!1248) #b00000000000000000000000011111111) (= (mask!7679 thiss!1248) #b00000000000000000000000111111111) (= (mask!7679 thiss!1248) #b00000000000000000000001111111111) (= (mask!7679 thiss!1248) #b00000000000000000000011111111111) (= (mask!7679 thiss!1248) #b00000000000000000000111111111111) (= (mask!7679 thiss!1248) #b00000000000000000001111111111111) (= (mask!7679 thiss!1248) #b00000000000000000011111111111111) (= (mask!7679 thiss!1248) #b00000000000000000111111111111111) (= (mask!7679 thiss!1248) #b00000000000000001111111111111111) (= (mask!7679 thiss!1248) #b00000000000000011111111111111111) (= (mask!7679 thiss!1248) #b00000000000000111111111111111111) (= (mask!7679 thiss!1248) #b00000000000001111111111111111111) (= (mask!7679 thiss!1248) #b00000000000011111111111111111111) (= (mask!7679 thiss!1248) #b00000000000111111111111111111111) (= (mask!7679 thiss!1248) #b00000000001111111111111111111111) (= (mask!7679 thiss!1248) #b00000000011111111111111111111111) (= (mask!7679 thiss!1248) #b00000000111111111111111111111111) (= (mask!7679 thiss!1248) #b00000001111111111111111111111111) (= (mask!7679 thiss!1248) #b00000011111111111111111111111111) (= (mask!7679 thiss!1248) #b00000111111111111111111111111111) (= (mask!7679 thiss!1248) #b00001111111111111111111111111111) (= (mask!7679 thiss!1248) #b00011111111111111111111111111111) (= (mask!7679 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!7679 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!157713 d!50963))

(declare-fun d!50965 () Bool)

(assert (=> d!50965 (= (array_inv!1695 (_keys!4962 thiss!1248)) (bvsge (size!2919 (_keys!4962 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157711 d!50965))

(declare-fun d!50967 () Bool)

(assert (=> d!50967 (= (array_inv!1696 (_values!3168 thiss!1248)) (bvsge (size!2920 (_values!3168 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!157711 d!50967))

(declare-fun d!50969 () Bool)

(declare-fun res!74532 () Bool)

(declare-fun e!103346 () Bool)

(assert (=> d!50969 (=> (not res!74532) (not e!103346))))

(declare-fun simpleValid!110 (LongMapFixedSize!1486) Bool)

(assert (=> d!50969 (= res!74532 (simpleValid!110 thiss!1248))))

(assert (=> d!50969 (= (valid!707 thiss!1248) e!103346)))

(declare-fun b!157790 () Bool)

(declare-fun res!74533 () Bool)

(assert (=> b!157790 (=> (not res!74533) (not e!103346))))

(declare-fun arrayCountValidKeys!0 (array!5573 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157790 (= res!74533 (= (arrayCountValidKeys!0 (_keys!4962 thiss!1248) #b00000000000000000000000000000000 (size!2919 (_keys!4962 thiss!1248))) (_size!792 thiss!1248)))))

(declare-fun b!157791 () Bool)

(declare-fun res!74534 () Bool)

(assert (=> b!157791 (=> (not res!74534) (not e!103346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5573 (_ BitVec 32)) Bool)

(assert (=> b!157791 (= res!74534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4962 thiss!1248) (mask!7679 thiss!1248)))))

(declare-fun b!157792 () Bool)

(declare-datatypes ((List!1884 0))(
  ( (Nil!1881) (Cons!1880 (h!2489 (_ BitVec 64)) (t!6677 List!1884)) )
))
(declare-fun arrayNoDuplicates!0 (array!5573 (_ BitVec 32) List!1884) Bool)

(assert (=> b!157792 (= e!103346 (arrayNoDuplicates!0 (_keys!4962 thiss!1248) #b00000000000000000000000000000000 Nil!1881))))

(assert (= (and d!50969 res!74532) b!157790))

(assert (= (and b!157790 res!74533) b!157791))

(assert (= (and b!157791 res!74534) b!157792))

(declare-fun m!190311 () Bool)

(assert (=> d!50969 m!190311))

(declare-fun m!190313 () Bool)

(assert (=> b!157790 m!190313))

(declare-fun m!190315 () Bool)

(assert (=> b!157791 m!190315))

(declare-fun m!190317 () Bool)

(assert (=> b!157792 m!190317))

(assert (=> start!15860 d!50969))

(declare-fun b!157799 () Bool)

(declare-fun e!103352 () Bool)

(assert (=> b!157799 (= e!103352 tp_is_empty!3265)))

(declare-fun mapNonEmpty!5566 () Bool)

(declare-fun mapRes!5566 () Bool)

(declare-fun tp!12946 () Bool)

(assert (=> mapNonEmpty!5566 (= mapRes!5566 (and tp!12946 e!103352))))

(declare-fun mapValue!5566 () ValueCell!1289)

(declare-fun mapRest!5566 () (Array (_ BitVec 32) ValueCell!1289))

(declare-fun mapKey!5566 () (_ BitVec 32))

(assert (=> mapNonEmpty!5566 (= mapRest!5557 (store mapRest!5566 mapKey!5566 mapValue!5566))))

(declare-fun b!157800 () Bool)

(declare-fun e!103351 () Bool)

(assert (=> b!157800 (= e!103351 tp_is_empty!3265)))

(declare-fun condMapEmpty!5566 () Bool)

(declare-fun mapDefault!5566 () ValueCell!1289)

(assert (=> mapNonEmpty!5557 (= condMapEmpty!5566 (= mapRest!5557 ((as const (Array (_ BitVec 32) ValueCell!1289)) mapDefault!5566)))))

(assert (=> mapNonEmpty!5557 (= tp!12931 (and e!103351 mapRes!5566))))

(declare-fun mapIsEmpty!5566 () Bool)

(assert (=> mapIsEmpty!5566 mapRes!5566))

(assert (= (and mapNonEmpty!5557 condMapEmpty!5566) mapIsEmpty!5566))

(assert (= (and mapNonEmpty!5557 (not condMapEmpty!5566)) mapNonEmpty!5566))

(assert (= (and mapNonEmpty!5566 ((_ is ValueCellFull!1289) mapValue!5566)) b!157799))

(assert (= (and mapNonEmpty!5557 ((_ is ValueCellFull!1289) mapDefault!5566)) b!157800))

(declare-fun m!190319 () Bool)

(assert (=> mapNonEmpty!5566 m!190319))

(check-sat (not b_next!3463) (not b!157792) (not d!50969) (not b!157790) (not d!50961) (not b!157791) tp_is_empty!3265 b_and!9851 (not mapNonEmpty!5566) (not b!157778))
(check-sat b_and!9851 (not b_next!3463))
(get-model)

(declare-fun d!50971 () Bool)

(declare-fun res!74544 () Bool)

(declare-fun e!103355 () Bool)

(assert (=> d!50971 (=> (not res!74544) (not e!103355))))

(assert (=> d!50971 (= res!74544 (validMask!0 (mask!7679 thiss!1248)))))

(assert (=> d!50971 (= (simpleValid!110 thiss!1248) e!103355)))

(declare-fun b!157811 () Bool)

(declare-fun res!74546 () Bool)

(assert (=> b!157811 (=> (not res!74546) (not e!103355))))

(declare-fun size!2925 (LongMapFixedSize!1486) (_ BitVec 32))

(assert (=> b!157811 (= res!74546 (= (size!2925 thiss!1248) (bvadd (_size!792 thiss!1248) (bvsdiv (bvadd (extraKeys!2926 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!157810 () Bool)

(declare-fun res!74545 () Bool)

(assert (=> b!157810 (=> (not res!74545) (not e!103355))))

(assert (=> b!157810 (= res!74545 (bvsge (size!2925 thiss!1248) (_size!792 thiss!1248)))))

(declare-fun b!157809 () Bool)

(declare-fun res!74543 () Bool)

(assert (=> b!157809 (=> (not res!74543) (not e!103355))))

(assert (=> b!157809 (= res!74543 (and (= (size!2920 (_values!3168 thiss!1248)) (bvadd (mask!7679 thiss!1248) #b00000000000000000000000000000001)) (= (size!2919 (_keys!4962 thiss!1248)) (size!2920 (_values!3168 thiss!1248))) (bvsge (_size!792 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!792 thiss!1248) (bvadd (mask!7679 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!157812 () Bool)

(assert (=> b!157812 (= e!103355 (and (bvsge (extraKeys!2926 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2926 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!792 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!50971 res!74544) b!157809))

(assert (= (and b!157809 res!74543) b!157810))

(assert (= (and b!157810 res!74545) b!157811))

(assert (= (and b!157811 res!74546) b!157812))

(assert (=> d!50971 m!190261))

(declare-fun m!190321 () Bool)

(assert (=> b!157811 m!190321))

(assert (=> b!157810 m!190321))

(assert (=> d!50969 d!50971))

(declare-fun b!157821 () Bool)

(declare-fun e!103361 () (_ BitVec 32))

(assert (=> b!157821 (= e!103361 #b00000000000000000000000000000000)))

(declare-fun d!50973 () Bool)

(declare-fun lt!81588 () (_ BitVec 32))

(assert (=> d!50973 (and (bvsge lt!81588 #b00000000000000000000000000000000) (bvsle lt!81588 (bvsub (size!2919 (_keys!4962 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!50973 (= lt!81588 e!103361)))

(declare-fun c!29713 () Bool)

(assert (=> d!50973 (= c!29713 (bvsge #b00000000000000000000000000000000 (size!2919 (_keys!4962 thiss!1248))))))

(assert (=> d!50973 (and (bvsle #b00000000000000000000000000000000 (size!2919 (_keys!4962 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2919 (_keys!4962 thiss!1248)) (size!2919 (_keys!4962 thiss!1248))))))

(assert (=> d!50973 (= (arrayCountValidKeys!0 (_keys!4962 thiss!1248) #b00000000000000000000000000000000 (size!2919 (_keys!4962 thiss!1248))) lt!81588)))

(declare-fun b!157822 () Bool)

(declare-fun e!103360 () (_ BitVec 32))

(declare-fun call!17212 () (_ BitVec 32))

(assert (=> b!157822 (= e!103360 call!17212)))

(declare-fun b!157823 () Bool)

(assert (=> b!157823 (= e!103361 e!103360)))

(declare-fun c!29714 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!157823 (= c!29714 (validKeyInArray!0 (select (arr!2638 (_keys!4962 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157824 () Bool)

(assert (=> b!157824 (= e!103360 (bvadd #b00000000000000000000000000000001 call!17212))))

(declare-fun bm!17209 () Bool)

(assert (=> bm!17209 (= call!17212 (arrayCountValidKeys!0 (_keys!4962 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2919 (_keys!4962 thiss!1248))))))

(assert (= (and d!50973 c!29713) b!157821))

(assert (= (and d!50973 (not c!29713)) b!157823))

(assert (= (and b!157823 c!29714) b!157824))

(assert (= (and b!157823 (not c!29714)) b!157822))

(assert (= (or b!157824 b!157822) bm!17209))

(declare-fun m!190323 () Bool)

(assert (=> b!157823 m!190323))

(assert (=> b!157823 m!190323))

(declare-fun m!190325 () Bool)

(assert (=> b!157823 m!190325))

(declare-fun m!190327 () Bool)

(assert (=> bm!17209 m!190327))

(assert (=> b!157790 d!50973))

(declare-fun b!157837 () Bool)

(declare-fun e!103368 () SeekEntryResult!294)

(assert (=> b!157837 (= e!103368 (Found!294 (index!3346 lt!81585)))))

(declare-fun b!157838 () Bool)

(declare-fun e!103370 () SeekEntryResult!294)

(assert (=> b!157838 (= e!103370 e!103368)))

(declare-fun c!29722 () Bool)

(declare-fun lt!81593 () (_ BitVec 64))

(assert (=> b!157838 (= c!29722 (= lt!81593 key!828))))

(declare-fun e!103369 () SeekEntryResult!294)

(declare-fun b!157839 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!157839 (= e!103369 (seekKeyOrZeroReturnVacant!0 (bvadd (x!17409 lt!81585) #b00000000000000000000000000000001) (nextIndex!0 (index!3346 lt!81585) (x!17409 lt!81585) (mask!7679 thiss!1248)) (index!3346 lt!81585) key!828 (_keys!4962 thiss!1248) (mask!7679 thiss!1248)))))

(declare-fun b!157840 () Bool)

(declare-fun c!29721 () Bool)

(assert (=> b!157840 (= c!29721 (= lt!81593 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!157840 (= e!103368 e!103369)))

(declare-fun b!157841 () Bool)

(assert (=> b!157841 (= e!103370 Undefined!294)))

(declare-fun b!157842 () Bool)

(assert (=> b!157842 (= e!103369 (MissingVacant!294 (index!3346 lt!81585)))))

(declare-fun d!50975 () Bool)

(declare-fun lt!81594 () SeekEntryResult!294)

(assert (=> d!50975 (and (or ((_ is Undefined!294) lt!81594) (not ((_ is Found!294) lt!81594)) (and (bvsge (index!3345 lt!81594) #b00000000000000000000000000000000) (bvslt (index!3345 lt!81594) (size!2919 (_keys!4962 thiss!1248))))) (or ((_ is Undefined!294) lt!81594) ((_ is Found!294) lt!81594) (not ((_ is MissingVacant!294) lt!81594)) (not (= (index!3347 lt!81594) (index!3346 lt!81585))) (and (bvsge (index!3347 lt!81594) #b00000000000000000000000000000000) (bvslt (index!3347 lt!81594) (size!2919 (_keys!4962 thiss!1248))))) (or ((_ is Undefined!294) lt!81594) (ite ((_ is Found!294) lt!81594) (= (select (arr!2638 (_keys!4962 thiss!1248)) (index!3345 lt!81594)) key!828) (and ((_ is MissingVacant!294) lt!81594) (= (index!3347 lt!81594) (index!3346 lt!81585)) (= (select (arr!2638 (_keys!4962 thiss!1248)) (index!3347 lt!81594)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!50975 (= lt!81594 e!103370)))

(declare-fun c!29723 () Bool)

(assert (=> d!50975 (= c!29723 (bvsge (x!17409 lt!81585) #b01111111111111111111111111111110))))

(assert (=> d!50975 (= lt!81593 (select (arr!2638 (_keys!4962 thiss!1248)) (index!3346 lt!81585)))))

(assert (=> d!50975 (validMask!0 (mask!7679 thiss!1248))))

(assert (=> d!50975 (= (seekKeyOrZeroReturnVacant!0 (x!17409 lt!81585) (index!3346 lt!81585) (index!3346 lt!81585) key!828 (_keys!4962 thiss!1248) (mask!7679 thiss!1248)) lt!81594)))

(assert (= (and d!50975 c!29723) b!157841))

(assert (= (and d!50975 (not c!29723)) b!157838))

(assert (= (and b!157838 c!29722) b!157837))

(assert (= (and b!157838 (not c!29722)) b!157840))

(assert (= (and b!157840 c!29721) b!157842))

(assert (= (and b!157840 (not c!29721)) b!157839))

(declare-fun m!190329 () Bool)

(assert (=> b!157839 m!190329))

(assert (=> b!157839 m!190329))

(declare-fun m!190331 () Bool)

(assert (=> b!157839 m!190331))

(declare-fun m!190333 () Bool)

(assert (=> d!50975 m!190333))

(declare-fun m!190335 () Bool)

(assert (=> d!50975 m!190335))

(assert (=> d!50975 m!190299))

(assert (=> d!50975 m!190261))

(assert (=> b!157778 d!50975))

(declare-fun b!157861 () Bool)

(declare-fun e!103384 () SeekEntryResult!294)

(assert (=> b!157861 (= e!103384 (Intermediate!294 false (toIndex!0 key!828 (mask!7679 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!157863 () Bool)

(declare-fun lt!81600 () SeekEntryResult!294)

(assert (=> b!157863 (and (bvsge (index!3346 lt!81600) #b00000000000000000000000000000000) (bvslt (index!3346 lt!81600) (size!2919 (_keys!4962 thiss!1248))))))

(declare-fun e!103381 () Bool)

(assert (=> b!157863 (= e!103381 (= (select (arr!2638 (_keys!4962 thiss!1248)) (index!3346 lt!81600)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!157864 () Bool)

(declare-fun e!103385 () Bool)

(declare-fun e!103382 () Bool)

(assert (=> b!157864 (= e!103385 e!103382)))

(declare-fun res!74554 () Bool)

(assert (=> b!157864 (= res!74554 (and ((_ is Intermediate!294) lt!81600) (not (undefined!1106 lt!81600)) (bvslt (x!17409 lt!81600) #b01111111111111111111111111111110) (bvsge (x!17409 lt!81600) #b00000000000000000000000000000000) (bvsge (x!17409 lt!81600) #b00000000000000000000000000000000)))))

(assert (=> b!157864 (=> (not res!74554) (not e!103382))))

(declare-fun b!157865 () Bool)

(assert (=> b!157865 (and (bvsge (index!3346 lt!81600) #b00000000000000000000000000000000) (bvslt (index!3346 lt!81600) (size!2919 (_keys!4962 thiss!1248))))))

(declare-fun res!74555 () Bool)

(assert (=> b!157865 (= res!74555 (= (select (arr!2638 (_keys!4962 thiss!1248)) (index!3346 lt!81600)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!157865 (=> res!74555 e!103381)))

(declare-fun b!157866 () Bool)

(declare-fun e!103383 () SeekEntryResult!294)

(assert (=> b!157866 (= e!103383 e!103384)))

(declare-fun c!29730 () Bool)

(declare-fun lt!81599 () (_ BitVec 64))

(assert (=> b!157866 (= c!29730 (or (= lt!81599 key!828) (= (bvadd lt!81599 lt!81599) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!157867 () Bool)

(assert (=> b!157867 (and (bvsge (index!3346 lt!81600) #b00000000000000000000000000000000) (bvslt (index!3346 lt!81600) (size!2919 (_keys!4962 thiss!1248))))))

(declare-fun res!74553 () Bool)

(assert (=> b!157867 (= res!74553 (= (select (arr!2638 (_keys!4962 thiss!1248)) (index!3346 lt!81600)) key!828))))

(assert (=> b!157867 (=> res!74553 e!103381)))

(assert (=> b!157867 (= e!103382 e!103381)))

(declare-fun b!157868 () Bool)

(assert (=> b!157868 (= e!103383 (Intermediate!294 true (toIndex!0 key!828 (mask!7679 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!157869 () Bool)

(assert (=> b!157869 (= e!103385 (bvsge (x!17409 lt!81600) #b01111111111111111111111111111110))))

(declare-fun d!50977 () Bool)

(assert (=> d!50977 e!103385))

(declare-fun c!29732 () Bool)

(assert (=> d!50977 (= c!29732 (and ((_ is Intermediate!294) lt!81600) (undefined!1106 lt!81600)))))

(assert (=> d!50977 (= lt!81600 e!103383)))

(declare-fun c!29731 () Bool)

(assert (=> d!50977 (= c!29731 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!50977 (= lt!81599 (select (arr!2638 (_keys!4962 thiss!1248)) (toIndex!0 key!828 (mask!7679 thiss!1248))))))

(assert (=> d!50977 (validMask!0 (mask!7679 thiss!1248))))

(assert (=> d!50977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!7679 thiss!1248)) key!828 (_keys!4962 thiss!1248) (mask!7679 thiss!1248)) lt!81600)))

(declare-fun b!157862 () Bool)

(assert (=> b!157862 (= e!103384 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!7679 thiss!1248)) #b00000000000000000000000000000000 (mask!7679 thiss!1248)) key!828 (_keys!4962 thiss!1248) (mask!7679 thiss!1248)))))

(assert (= (and d!50977 c!29731) b!157868))

(assert (= (and d!50977 (not c!29731)) b!157866))

(assert (= (and b!157866 c!29730) b!157861))

(assert (= (and b!157866 (not c!29730)) b!157862))

(assert (= (and d!50977 c!29732) b!157869))

(assert (= (and d!50977 (not c!29732)) b!157864))

(assert (= (and b!157864 res!74554) b!157867))

(assert (= (and b!157867 (not res!74553)) b!157865))

(assert (= (and b!157865 (not res!74555)) b!157863))

(assert (=> d!50977 m!190303))

(declare-fun m!190337 () Bool)

(assert (=> d!50977 m!190337))

(assert (=> d!50977 m!190261))

(declare-fun m!190339 () Bool)

(assert (=> b!157867 m!190339))

(assert (=> b!157862 m!190303))

(declare-fun m!190341 () Bool)

(assert (=> b!157862 m!190341))

(assert (=> b!157862 m!190341))

(declare-fun m!190343 () Bool)

(assert (=> b!157862 m!190343))

(assert (=> b!157863 m!190339))

(assert (=> b!157865 m!190339))

(assert (=> d!50961 d!50977))

(declare-fun d!50979 () Bool)

(declare-fun lt!81606 () (_ BitVec 32))

(declare-fun lt!81605 () (_ BitVec 32))

(assert (=> d!50979 (= lt!81606 (bvmul (bvxor lt!81605 (bvlshr lt!81605 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!50979 (= lt!81605 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!50979 (and (bvsge (mask!7679 thiss!1248) #b00000000000000000000000000000000) (let ((res!74556 (let ((h!2490 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!17428 (bvmul (bvxor h!2490 (bvlshr h!2490 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!17428 (bvlshr x!17428 #b00000000000000000000000000001101)) (mask!7679 thiss!1248)))))) (and (bvslt res!74556 (bvadd (mask!7679 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!74556 #b00000000000000000000000000000000))))))

(assert (=> d!50979 (= (toIndex!0 key!828 (mask!7679 thiss!1248)) (bvand (bvxor lt!81606 (bvlshr lt!81606 #b00000000000000000000000000001101)) (mask!7679 thiss!1248)))))

(assert (=> d!50961 d!50979))

(assert (=> d!50961 d!50963))

(declare-fun b!157878 () Bool)

(declare-fun e!103393 () Bool)

(declare-fun call!17215 () Bool)

(assert (=> b!157878 (= e!103393 call!17215)))

(declare-fun bm!17212 () Bool)

(assert (=> bm!17212 (= call!17215 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4962 thiss!1248) (mask!7679 thiss!1248)))))

(declare-fun b!157879 () Bool)

(declare-fun e!103392 () Bool)

(assert (=> b!157879 (= e!103393 e!103392)))

(declare-fun lt!81613 () (_ BitVec 64))

(assert (=> b!157879 (= lt!81613 (select (arr!2638 (_keys!4962 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!4958 0))(
  ( (Unit!4959) )
))
(declare-fun lt!81615 () Unit!4958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5573 (_ BitVec 64) (_ BitVec 32)) Unit!4958)

(assert (=> b!157879 (= lt!81615 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4962 thiss!1248) lt!81613 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!5573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157879 (arrayContainsKey!0 (_keys!4962 thiss!1248) lt!81613 #b00000000000000000000000000000000)))

(declare-fun lt!81614 () Unit!4958)

(assert (=> b!157879 (= lt!81614 lt!81615)))

(declare-fun res!74561 () Bool)

(assert (=> b!157879 (= res!74561 (= (seekEntryOrOpen!0 (select (arr!2638 (_keys!4962 thiss!1248)) #b00000000000000000000000000000000) (_keys!4962 thiss!1248) (mask!7679 thiss!1248)) (Found!294 #b00000000000000000000000000000000)))))

(assert (=> b!157879 (=> (not res!74561) (not e!103392))))

(declare-fun d!50981 () Bool)

(declare-fun res!74562 () Bool)

(declare-fun e!103394 () Bool)

(assert (=> d!50981 (=> res!74562 e!103394)))

(assert (=> d!50981 (= res!74562 (bvsge #b00000000000000000000000000000000 (size!2919 (_keys!4962 thiss!1248))))))

(assert (=> d!50981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4962 thiss!1248) (mask!7679 thiss!1248)) e!103394)))

(declare-fun b!157880 () Bool)

(assert (=> b!157880 (= e!103392 call!17215)))

(declare-fun b!157881 () Bool)

(assert (=> b!157881 (= e!103394 e!103393)))

(declare-fun c!29735 () Bool)

(assert (=> b!157881 (= c!29735 (validKeyInArray!0 (select (arr!2638 (_keys!4962 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!50981 (not res!74562)) b!157881))

(assert (= (and b!157881 c!29735) b!157879))

(assert (= (and b!157881 (not c!29735)) b!157878))

(assert (= (and b!157879 res!74561) b!157880))

(assert (= (or b!157880 b!157878) bm!17212))

(declare-fun m!190345 () Bool)

(assert (=> bm!17212 m!190345))

(assert (=> b!157879 m!190323))

(declare-fun m!190347 () Bool)

(assert (=> b!157879 m!190347))

(declare-fun m!190349 () Bool)

(assert (=> b!157879 m!190349))

(assert (=> b!157879 m!190323))

(declare-fun m!190351 () Bool)

(assert (=> b!157879 m!190351))

(assert (=> b!157881 m!190323))

(assert (=> b!157881 m!190323))

(assert (=> b!157881 m!190325))

(assert (=> b!157791 d!50981))

(declare-fun d!50983 () Bool)

(declare-fun res!74571 () Bool)

(declare-fun e!103406 () Bool)

(assert (=> d!50983 (=> res!74571 e!103406)))

(assert (=> d!50983 (= res!74571 (bvsge #b00000000000000000000000000000000 (size!2919 (_keys!4962 thiss!1248))))))

(assert (=> d!50983 (= (arrayNoDuplicates!0 (_keys!4962 thiss!1248) #b00000000000000000000000000000000 Nil!1881) e!103406)))

(declare-fun b!157892 () Bool)

(declare-fun e!103404 () Bool)

(assert (=> b!157892 (= e!103406 e!103404)))

(declare-fun res!74569 () Bool)

(assert (=> b!157892 (=> (not res!74569) (not e!103404))))

(declare-fun e!103403 () Bool)

(assert (=> b!157892 (= res!74569 (not e!103403))))

(declare-fun res!74570 () Bool)

(assert (=> b!157892 (=> (not res!74570) (not e!103403))))

(assert (=> b!157892 (= res!74570 (validKeyInArray!0 (select (arr!2638 (_keys!4962 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!157893 () Bool)

(declare-fun e!103405 () Bool)

(declare-fun call!17218 () Bool)

(assert (=> b!157893 (= e!103405 call!17218)))

(declare-fun b!157894 () Bool)

(assert (=> b!157894 (= e!103404 e!103405)))

(declare-fun c!29738 () Bool)

(assert (=> b!157894 (= c!29738 (validKeyInArray!0 (select (arr!2638 (_keys!4962 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17215 () Bool)

(assert (=> bm!17215 (= call!17218 (arrayNoDuplicates!0 (_keys!4962 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!29738 (Cons!1880 (select (arr!2638 (_keys!4962 thiss!1248)) #b00000000000000000000000000000000) Nil!1881) Nil!1881)))))

(declare-fun b!157895 () Bool)

(assert (=> b!157895 (= e!103405 call!17218)))

(declare-fun b!157896 () Bool)

(declare-fun contains!964 (List!1884 (_ BitVec 64)) Bool)

(assert (=> b!157896 (= e!103403 (contains!964 Nil!1881 (select (arr!2638 (_keys!4962 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!50983 (not res!74571)) b!157892))

(assert (= (and b!157892 res!74570) b!157896))

(assert (= (and b!157892 res!74569) b!157894))

(assert (= (and b!157894 c!29738) b!157895))

(assert (= (and b!157894 (not c!29738)) b!157893))

(assert (= (or b!157895 b!157893) bm!17215))

(assert (=> b!157892 m!190323))

(assert (=> b!157892 m!190323))

(assert (=> b!157892 m!190325))

(assert (=> b!157894 m!190323))

(assert (=> b!157894 m!190323))

(assert (=> b!157894 m!190325))

(assert (=> bm!17215 m!190323))

(declare-fun m!190353 () Bool)

(assert (=> bm!17215 m!190353))

(assert (=> b!157896 m!190323))

(assert (=> b!157896 m!190323))

(declare-fun m!190355 () Bool)

(assert (=> b!157896 m!190355))

(assert (=> b!157792 d!50983))

(declare-fun b!157897 () Bool)

(declare-fun e!103408 () Bool)

(assert (=> b!157897 (= e!103408 tp_is_empty!3265)))

(declare-fun mapNonEmpty!5567 () Bool)

(declare-fun mapRes!5567 () Bool)

(declare-fun tp!12947 () Bool)

(assert (=> mapNonEmpty!5567 (= mapRes!5567 (and tp!12947 e!103408))))

(declare-fun mapRest!5567 () (Array (_ BitVec 32) ValueCell!1289))

(declare-fun mapValue!5567 () ValueCell!1289)

(declare-fun mapKey!5567 () (_ BitVec 32))

(assert (=> mapNonEmpty!5567 (= mapRest!5566 (store mapRest!5567 mapKey!5567 mapValue!5567))))

(declare-fun b!157898 () Bool)

(declare-fun e!103407 () Bool)

(assert (=> b!157898 (= e!103407 tp_is_empty!3265)))

(declare-fun condMapEmpty!5567 () Bool)

(declare-fun mapDefault!5567 () ValueCell!1289)

(assert (=> mapNonEmpty!5566 (= condMapEmpty!5567 (= mapRest!5566 ((as const (Array (_ BitVec 32) ValueCell!1289)) mapDefault!5567)))))

(assert (=> mapNonEmpty!5566 (= tp!12946 (and e!103407 mapRes!5567))))

(declare-fun mapIsEmpty!5567 () Bool)

(assert (=> mapIsEmpty!5567 mapRes!5567))

(assert (= (and mapNonEmpty!5566 condMapEmpty!5567) mapIsEmpty!5567))

(assert (= (and mapNonEmpty!5566 (not condMapEmpty!5567)) mapNonEmpty!5567))

(assert (= (and mapNonEmpty!5567 ((_ is ValueCellFull!1289) mapValue!5567)) b!157897))

(assert (= (and mapNonEmpty!5566 ((_ is ValueCellFull!1289) mapDefault!5567)) b!157898))

(declare-fun m!190357 () Bool)

(assert (=> mapNonEmpty!5567 m!190357))

(check-sat (not b!157894) (not b_next!3463) (not bm!17209) (not b!157823) (not mapNonEmpty!5567) (not d!50971) (not bm!17215) (not b!157879) (not bm!17212) (not b!157862) (not b!157839) (not b!157810) tp_is_empty!3265 b_and!9851 (not b!157896) (not b!157892) (not b!157881) (not d!50977) (not b!157811) (not d!50975))
(check-sat b_and!9851 (not b_next!3463))
