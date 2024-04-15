; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18410 () Bool)

(assert start!18410)

(declare-fun b!182416 () Bool)

(declare-fun b_free!4501 () Bool)

(declare-fun b_next!4501 () Bool)

(assert (=> b!182416 (= b_free!4501 (not b_next!4501))))

(declare-fun tp!16264 () Bool)

(declare-fun b_and!11039 () Bool)

(assert (=> b!182416 (= tp!16264 b_and!11039)))

(declare-fun b!182408 () Bool)

(declare-fun res!86299 () Bool)

(declare-fun e!120103 () Bool)

(assert (=> b!182408 (=> (not res!86299) (not e!120103))))

(declare-datatypes ((V!5345 0))(
  ( (V!5346 (val!2181 Int)) )
))
(declare-datatypes ((ValueCell!1793 0))(
  ( (ValueCellFull!1793 (v!4075 V!5345)) (EmptyCell!1793) )
))
(declare-datatypes ((array!7713 0))(
  ( (array!7714 (arr!3646 (Array (_ BitVec 32) (_ BitVec 64))) (size!3959 (_ BitVec 32))) )
))
(declare-datatypes ((array!7715 0))(
  ( (array!7716 (arr!3647 (Array (_ BitVec 32) ValueCell!1793)) (size!3960 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2494 0))(
  ( (LongMapFixedSize!2495 (defaultEntry!3734 Int) (mask!8779 (_ BitVec 32)) (extraKeys!3471 (_ BitVec 32)) (zeroValue!3575 V!5345) (minValue!3575 V!5345) (_size!1296 (_ BitVec 32)) (_keys!5646 array!7713) (_values!3717 array!7715) (_vacant!1296 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2494)

(assert (=> b!182408 (= res!86299 (and (= (size!3960 (_values!3717 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8779 thiss!1248))) (= (size!3959 (_keys!5646 thiss!1248)) (size!3960 (_values!3717 thiss!1248))) (bvsge (mask!8779 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3471 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3471 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!182409 () Bool)

(declare-fun e!120102 () Bool)

(declare-fun tp_is_empty!4273 () Bool)

(assert (=> b!182409 (= e!120102 tp_is_empty!4273)))

(declare-fun b!182410 () Bool)

(declare-datatypes ((List!2315 0))(
  ( (Nil!2312) (Cons!2311 (h!2940 (_ BitVec 64)) (t!7168 List!2315)) )
))
(declare-fun arrayNoDuplicates!0 (array!7713 (_ BitVec 32) List!2315) Bool)

(assert (=> b!182410 (= e!120103 (not (arrayNoDuplicates!0 (_keys!5646 thiss!1248) #b00000000000000000000000000000000 Nil!2312)))))

(declare-fun b!182411 () Bool)

(declare-fun e!120106 () Bool)

(declare-fun e!120104 () Bool)

(declare-fun mapRes!7334 () Bool)

(assert (=> b!182411 (= e!120106 (and e!120104 mapRes!7334))))

(declare-fun condMapEmpty!7334 () Bool)

(declare-fun mapDefault!7334 () ValueCell!1793)

(assert (=> b!182411 (= condMapEmpty!7334 (= (arr!3647 (_values!3717 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1793)) mapDefault!7334)))))

(declare-fun b!182412 () Bool)

(declare-fun res!86297 () Bool)

(assert (=> b!182412 (=> (not res!86297) (not e!120103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7713 (_ BitVec 32)) Bool)

(assert (=> b!182412 (= res!86297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5646 thiss!1248) (mask!8779 thiss!1248)))))

(declare-fun res!86296 () Bool)

(declare-fun e!120107 () Bool)

(assert (=> start!18410 (=> (not res!86296) (not e!120107))))

(declare-fun valid!1052 (LongMapFixedSize!2494) Bool)

(assert (=> start!18410 (= res!86296 (valid!1052 thiss!1248))))

(assert (=> start!18410 e!120107))

(declare-fun e!120108 () Bool)

(assert (=> start!18410 e!120108))

(assert (=> start!18410 true))

(declare-fun b!182413 () Bool)

(assert (=> b!182413 (= e!120104 tp_is_empty!4273)))

(declare-fun b!182414 () Bool)

(declare-fun res!86300 () Bool)

(assert (=> b!182414 (=> (not res!86300) (not e!120103))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3374 0))(
  ( (tuple2!3375 (_1!1698 (_ BitVec 64)) (_2!1698 V!5345)) )
))
(declare-datatypes ((List!2316 0))(
  ( (Nil!2313) (Cons!2312 (h!2941 tuple2!3374) (t!7169 List!2316)) )
))
(declare-datatypes ((ListLongMap!2283 0))(
  ( (ListLongMap!2284 (toList!1157 List!2316)) )
))
(declare-fun contains!1247 (ListLongMap!2283 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!790 (array!7713 array!7715 (_ BitVec 32) (_ BitVec 32) V!5345 V!5345 (_ BitVec 32) Int) ListLongMap!2283)

(assert (=> b!182414 (= res!86300 (contains!1247 (getCurrentListMap!790 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)) key!828))))

(declare-fun b!182415 () Bool)

(declare-fun res!86301 () Bool)

(assert (=> b!182415 (=> (not res!86301) (not e!120103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!182415 (= res!86301 (validMask!0 (mask!8779 thiss!1248)))))

(declare-fun array_inv!2357 (array!7713) Bool)

(declare-fun array_inv!2358 (array!7715) Bool)

(assert (=> b!182416 (= e!120108 (and tp!16264 tp_is_empty!4273 (array_inv!2357 (_keys!5646 thiss!1248)) (array_inv!2358 (_values!3717 thiss!1248)) e!120106))))

(declare-fun mapNonEmpty!7334 () Bool)

(declare-fun tp!16265 () Bool)

(assert (=> mapNonEmpty!7334 (= mapRes!7334 (and tp!16265 e!120102))))

(declare-fun mapValue!7334 () ValueCell!1793)

(declare-fun mapRest!7334 () (Array (_ BitVec 32) ValueCell!1793))

(declare-fun mapKey!7334 () (_ BitVec 32))

(assert (=> mapNonEmpty!7334 (= (arr!3647 (_values!3717 thiss!1248)) (store mapRest!7334 mapKey!7334 mapValue!7334))))

(declare-fun b!182417 () Bool)

(declare-fun res!86302 () Bool)

(assert (=> b!182417 (=> (not res!86302) (not e!120107))))

(assert (=> b!182417 (= res!86302 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!7334 () Bool)

(assert (=> mapIsEmpty!7334 mapRes!7334))

(declare-fun b!182418 () Bool)

(assert (=> b!182418 (= e!120107 e!120103)))

(declare-fun res!86298 () Bool)

(assert (=> b!182418 (=> (not res!86298) (not e!120103))))

(declare-datatypes ((SeekEntryResult!615 0))(
  ( (MissingZero!615 (index!4630 (_ BitVec 32))) (Found!615 (index!4631 (_ BitVec 32))) (Intermediate!615 (undefined!1427 Bool) (index!4632 (_ BitVec 32)) (x!19906 (_ BitVec 32))) (Undefined!615) (MissingVacant!615 (index!4633 (_ BitVec 32))) )
))
(declare-fun lt!90114 () SeekEntryResult!615)

(get-info :version)

(assert (=> b!182418 (= res!86298 (and (not ((_ is Undefined!615) lt!90114)) (not ((_ is MissingVacant!615) lt!90114)) (not ((_ is MissingZero!615) lt!90114)) ((_ is Found!615) lt!90114)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7713 (_ BitVec 32)) SeekEntryResult!615)

(assert (=> b!182418 (= lt!90114 (seekEntryOrOpen!0 key!828 (_keys!5646 thiss!1248) (mask!8779 thiss!1248)))))

(assert (= (and start!18410 res!86296) b!182417))

(assert (= (and b!182417 res!86302) b!182418))

(assert (= (and b!182418 res!86298) b!182414))

(assert (= (and b!182414 res!86300) b!182415))

(assert (= (and b!182415 res!86301) b!182408))

(assert (= (and b!182408 res!86299) b!182412))

(assert (= (and b!182412 res!86297) b!182410))

(assert (= (and b!182411 condMapEmpty!7334) mapIsEmpty!7334))

(assert (= (and b!182411 (not condMapEmpty!7334)) mapNonEmpty!7334))

(assert (= (and mapNonEmpty!7334 ((_ is ValueCellFull!1793) mapValue!7334)) b!182409))

(assert (= (and b!182411 ((_ is ValueCellFull!1793) mapDefault!7334)) b!182413))

(assert (= b!182416 b!182411))

(assert (= start!18410 b!182416))

(declare-fun m!209695 () Bool)

(assert (=> b!182410 m!209695))

(declare-fun m!209697 () Bool)

(assert (=> b!182416 m!209697))

(declare-fun m!209699 () Bool)

(assert (=> b!182416 m!209699))

(declare-fun m!209701 () Bool)

(assert (=> mapNonEmpty!7334 m!209701))

(declare-fun m!209703 () Bool)

(assert (=> b!182414 m!209703))

(assert (=> b!182414 m!209703))

(declare-fun m!209705 () Bool)

(assert (=> b!182414 m!209705))

(declare-fun m!209707 () Bool)

(assert (=> start!18410 m!209707))

(declare-fun m!209709 () Bool)

(assert (=> b!182418 m!209709))

(declare-fun m!209711 () Bool)

(assert (=> b!182415 m!209711))

(declare-fun m!209713 () Bool)

(assert (=> b!182412 m!209713))

(check-sat (not b!182418) (not b!182416) b_and!11039 (not b_next!4501) (not start!18410) (not b!182410) (not b!182415) tp_is_empty!4273 (not b!182414) (not b!182412) (not mapNonEmpty!7334))
(check-sat b_and!11039 (not b_next!4501))
(get-model)

(declare-fun d!54495 () Bool)

(assert (=> d!54495 (= (array_inv!2357 (_keys!5646 thiss!1248)) (bvsge (size!3959 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182416 d!54495))

(declare-fun d!54497 () Bool)

(assert (=> d!54497 (= (array_inv!2358 (_values!3717 thiss!1248)) (bvsge (size!3960 (_values!3717 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182416 d!54497))

(declare-fun b!182495 () Bool)

(declare-fun e!120161 () Bool)

(declare-fun call!18412 () Bool)

(assert (=> b!182495 (= e!120161 call!18412)))

(declare-fun b!182496 () Bool)

(declare-fun e!120160 () Bool)

(declare-fun e!120162 () Bool)

(assert (=> b!182496 (= e!120160 e!120162)))

(declare-fun res!86353 () Bool)

(assert (=> b!182496 (=> (not res!86353) (not e!120162))))

(declare-fun e!120159 () Bool)

(assert (=> b!182496 (= res!86353 (not e!120159))))

(declare-fun res!86352 () Bool)

(assert (=> b!182496 (=> (not res!86352) (not e!120159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!182496 (= res!86352 (validKeyInArray!0 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182497 () Bool)

(declare-fun contains!1249 (List!2315 (_ BitVec 64)) Bool)

(assert (=> b!182497 (= e!120159 (contains!1249 Nil!2312 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!54499 () Bool)

(declare-fun res!86351 () Bool)

(assert (=> d!54499 (=> res!86351 e!120160)))

(assert (=> d!54499 (= res!86351 (bvsge #b00000000000000000000000000000000 (size!3959 (_keys!5646 thiss!1248))))))

(assert (=> d!54499 (= (arrayNoDuplicates!0 (_keys!5646 thiss!1248) #b00000000000000000000000000000000 Nil!2312) e!120160)))

(declare-fun b!182498 () Bool)

(assert (=> b!182498 (= e!120161 call!18412)))

(declare-fun b!182499 () Bool)

(assert (=> b!182499 (= e!120162 e!120161)))

(declare-fun c!32722 () Bool)

(assert (=> b!182499 (= c!32722 (validKeyInArray!0 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18409 () Bool)

(assert (=> bm!18409 (= call!18412 (arrayNoDuplicates!0 (_keys!5646 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!32722 (Cons!2311 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000) Nil!2312) Nil!2312)))))

(assert (= (and d!54499 (not res!86351)) b!182496))

(assert (= (and b!182496 res!86352) b!182497))

(assert (= (and b!182496 res!86353) b!182499))

(assert (= (and b!182499 c!32722) b!182495))

(assert (= (and b!182499 (not c!32722)) b!182498))

(assert (= (or b!182495 b!182498) bm!18409))

(declare-fun m!209755 () Bool)

(assert (=> b!182496 m!209755))

(assert (=> b!182496 m!209755))

(declare-fun m!209757 () Bool)

(assert (=> b!182496 m!209757))

(assert (=> b!182497 m!209755))

(assert (=> b!182497 m!209755))

(declare-fun m!209759 () Bool)

(assert (=> b!182497 m!209759))

(assert (=> b!182499 m!209755))

(assert (=> b!182499 m!209755))

(assert (=> b!182499 m!209757))

(assert (=> bm!18409 m!209755))

(declare-fun m!209761 () Bool)

(assert (=> bm!18409 m!209761))

(assert (=> b!182410 d!54499))

(declare-fun b!182512 () Bool)

(declare-fun e!120171 () SeekEntryResult!615)

(declare-fun lt!90129 () SeekEntryResult!615)

(assert (=> b!182512 (= e!120171 (Found!615 (index!4632 lt!90129)))))

(declare-fun d!54501 () Bool)

(declare-fun lt!90127 () SeekEntryResult!615)

(assert (=> d!54501 (and (or ((_ is Undefined!615) lt!90127) (not ((_ is Found!615) lt!90127)) (and (bvsge (index!4631 lt!90127) #b00000000000000000000000000000000) (bvslt (index!4631 lt!90127) (size!3959 (_keys!5646 thiss!1248))))) (or ((_ is Undefined!615) lt!90127) ((_ is Found!615) lt!90127) (not ((_ is MissingZero!615) lt!90127)) (and (bvsge (index!4630 lt!90127) #b00000000000000000000000000000000) (bvslt (index!4630 lt!90127) (size!3959 (_keys!5646 thiss!1248))))) (or ((_ is Undefined!615) lt!90127) ((_ is Found!615) lt!90127) ((_ is MissingZero!615) lt!90127) (not ((_ is MissingVacant!615) lt!90127)) (and (bvsge (index!4633 lt!90127) #b00000000000000000000000000000000) (bvslt (index!4633 lt!90127) (size!3959 (_keys!5646 thiss!1248))))) (or ((_ is Undefined!615) lt!90127) (ite ((_ is Found!615) lt!90127) (= (select (arr!3646 (_keys!5646 thiss!1248)) (index!4631 lt!90127)) key!828) (ite ((_ is MissingZero!615) lt!90127) (= (select (arr!3646 (_keys!5646 thiss!1248)) (index!4630 lt!90127)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!615) lt!90127) (= (select (arr!3646 (_keys!5646 thiss!1248)) (index!4633 lt!90127)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!120169 () SeekEntryResult!615)

(assert (=> d!54501 (= lt!90127 e!120169)))

(declare-fun c!32729 () Bool)

(assert (=> d!54501 (= c!32729 (and ((_ is Intermediate!615) lt!90129) (undefined!1427 lt!90129)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7713 (_ BitVec 32)) SeekEntryResult!615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54501 (= lt!90129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8779 thiss!1248)) key!828 (_keys!5646 thiss!1248) (mask!8779 thiss!1248)))))

(assert (=> d!54501 (validMask!0 (mask!8779 thiss!1248))))

(assert (=> d!54501 (= (seekEntryOrOpen!0 key!828 (_keys!5646 thiss!1248) (mask!8779 thiss!1248)) lt!90127)))

(declare-fun e!120170 () SeekEntryResult!615)

(declare-fun b!182513 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7713 (_ BitVec 32)) SeekEntryResult!615)

(assert (=> b!182513 (= e!120170 (seekKeyOrZeroReturnVacant!0 (x!19906 lt!90129) (index!4632 lt!90129) (index!4632 lt!90129) key!828 (_keys!5646 thiss!1248) (mask!8779 thiss!1248)))))

(declare-fun b!182514 () Bool)

(declare-fun c!32730 () Bool)

(declare-fun lt!90128 () (_ BitVec 64))

(assert (=> b!182514 (= c!32730 (= lt!90128 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!182514 (= e!120171 e!120170)))

(declare-fun b!182515 () Bool)

(assert (=> b!182515 (= e!120169 Undefined!615)))

(declare-fun b!182516 () Bool)

(assert (=> b!182516 (= e!120169 e!120171)))

(assert (=> b!182516 (= lt!90128 (select (arr!3646 (_keys!5646 thiss!1248)) (index!4632 lt!90129)))))

(declare-fun c!32731 () Bool)

(assert (=> b!182516 (= c!32731 (= lt!90128 key!828))))

(declare-fun b!182517 () Bool)

(assert (=> b!182517 (= e!120170 (MissingZero!615 (index!4632 lt!90129)))))

(assert (= (and d!54501 c!32729) b!182515))

(assert (= (and d!54501 (not c!32729)) b!182516))

(assert (= (and b!182516 c!32731) b!182512))

(assert (= (and b!182516 (not c!32731)) b!182514))

(assert (= (and b!182514 c!32730) b!182517))

(assert (= (and b!182514 (not c!32730)) b!182513))

(declare-fun m!209763 () Bool)

(assert (=> d!54501 m!209763))

(assert (=> d!54501 m!209763))

(declare-fun m!209765 () Bool)

(assert (=> d!54501 m!209765))

(declare-fun m!209767 () Bool)

(assert (=> d!54501 m!209767))

(assert (=> d!54501 m!209711))

(declare-fun m!209769 () Bool)

(assert (=> d!54501 m!209769))

(declare-fun m!209771 () Bool)

(assert (=> d!54501 m!209771))

(declare-fun m!209773 () Bool)

(assert (=> b!182513 m!209773))

(declare-fun m!209775 () Bool)

(assert (=> b!182516 m!209775))

(assert (=> b!182418 d!54501))

(declare-fun d!54503 () Bool)

(assert (=> d!54503 (= (validMask!0 (mask!8779 thiss!1248)) (and (or (= (mask!8779 thiss!1248) #b00000000000000000000000000000111) (= (mask!8779 thiss!1248) #b00000000000000000000000000001111) (= (mask!8779 thiss!1248) #b00000000000000000000000000011111) (= (mask!8779 thiss!1248) #b00000000000000000000000000111111) (= (mask!8779 thiss!1248) #b00000000000000000000000001111111) (= (mask!8779 thiss!1248) #b00000000000000000000000011111111) (= (mask!8779 thiss!1248) #b00000000000000000000000111111111) (= (mask!8779 thiss!1248) #b00000000000000000000001111111111) (= (mask!8779 thiss!1248) #b00000000000000000000011111111111) (= (mask!8779 thiss!1248) #b00000000000000000000111111111111) (= (mask!8779 thiss!1248) #b00000000000000000001111111111111) (= (mask!8779 thiss!1248) #b00000000000000000011111111111111) (= (mask!8779 thiss!1248) #b00000000000000000111111111111111) (= (mask!8779 thiss!1248) #b00000000000000001111111111111111) (= (mask!8779 thiss!1248) #b00000000000000011111111111111111) (= (mask!8779 thiss!1248) #b00000000000000111111111111111111) (= (mask!8779 thiss!1248) #b00000000000001111111111111111111) (= (mask!8779 thiss!1248) #b00000000000011111111111111111111) (= (mask!8779 thiss!1248) #b00000000000111111111111111111111) (= (mask!8779 thiss!1248) #b00000000001111111111111111111111) (= (mask!8779 thiss!1248) #b00000000011111111111111111111111) (= (mask!8779 thiss!1248) #b00000000111111111111111111111111) (= (mask!8779 thiss!1248) #b00000001111111111111111111111111) (= (mask!8779 thiss!1248) #b00000011111111111111111111111111) (= (mask!8779 thiss!1248) #b00000111111111111111111111111111) (= (mask!8779 thiss!1248) #b00001111111111111111111111111111) (= (mask!8779 thiss!1248) #b00011111111111111111111111111111) (= (mask!8779 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8779 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!182415 d!54503))

(declare-fun d!54505 () Bool)

(declare-fun e!120177 () Bool)

(assert (=> d!54505 e!120177))

(declare-fun res!86356 () Bool)

(assert (=> d!54505 (=> res!86356 e!120177)))

(declare-fun lt!90139 () Bool)

(assert (=> d!54505 (= res!86356 (not lt!90139))))

(declare-fun lt!90140 () Bool)

(assert (=> d!54505 (= lt!90139 lt!90140)))

(declare-datatypes ((Unit!5507 0))(
  ( (Unit!5508) )
))
(declare-fun lt!90141 () Unit!5507)

(declare-fun e!120176 () Unit!5507)

(assert (=> d!54505 (= lt!90141 e!120176)))

(declare-fun c!32734 () Bool)

(assert (=> d!54505 (= c!32734 lt!90140)))

(declare-fun containsKey!215 (List!2316 (_ BitVec 64)) Bool)

(assert (=> d!54505 (= lt!90140 (containsKey!215 (toList!1157 (getCurrentListMap!790 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248))) key!828))))

(assert (=> d!54505 (= (contains!1247 (getCurrentListMap!790 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)) key!828) lt!90139)))

(declare-fun b!182524 () Bool)

(declare-fun lt!90138 () Unit!5507)

(assert (=> b!182524 (= e!120176 lt!90138)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!164 (List!2316 (_ BitVec 64)) Unit!5507)

(assert (=> b!182524 (= lt!90138 (lemmaContainsKeyImpliesGetValueByKeyDefined!164 (toList!1157 (getCurrentListMap!790 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248))) key!828))))

(declare-datatypes ((Option!217 0))(
  ( (Some!216 (v!4078 V!5345)) (None!215) )
))
(declare-fun isDefined!165 (Option!217) Bool)

(declare-fun getValueByKey!211 (List!2316 (_ BitVec 64)) Option!217)

(assert (=> b!182524 (isDefined!165 (getValueByKey!211 (toList!1157 (getCurrentListMap!790 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248))) key!828))))

(declare-fun b!182525 () Bool)

(declare-fun Unit!5509 () Unit!5507)

(assert (=> b!182525 (= e!120176 Unit!5509)))

(declare-fun b!182526 () Bool)

(assert (=> b!182526 (= e!120177 (isDefined!165 (getValueByKey!211 (toList!1157 (getCurrentListMap!790 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248))) key!828)))))

(assert (= (and d!54505 c!32734) b!182524))

(assert (= (and d!54505 (not c!32734)) b!182525))

(assert (= (and d!54505 (not res!86356)) b!182526))

(declare-fun m!209777 () Bool)

(assert (=> d!54505 m!209777))

(declare-fun m!209779 () Bool)

(assert (=> b!182524 m!209779))

(declare-fun m!209781 () Bool)

(assert (=> b!182524 m!209781))

(assert (=> b!182524 m!209781))

(declare-fun m!209783 () Bool)

(assert (=> b!182524 m!209783))

(assert (=> b!182526 m!209781))

(assert (=> b!182526 m!209781))

(assert (=> b!182526 m!209783))

(assert (=> b!182414 d!54505))

(declare-fun b!182569 () Bool)

(declare-fun e!120211 () Unit!5507)

(declare-fun lt!90199 () Unit!5507)

(assert (=> b!182569 (= e!120211 lt!90199)))

(declare-fun lt!90186 () ListLongMap!2283)

(declare-fun getCurrentListMapNoExtraKeys!177 (array!7713 array!7715 (_ BitVec 32) (_ BitVec 32) V!5345 V!5345 (_ BitVec 32) Int) ListLongMap!2283)

(assert (=> b!182569 (= lt!90186 (getCurrentListMapNoExtraKeys!177 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)))))

(declare-fun lt!90189 () (_ BitVec 64))

(assert (=> b!182569 (= lt!90189 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90207 () (_ BitVec 64))

(assert (=> b!182569 (= lt!90207 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90201 () Unit!5507)

(declare-fun addStillContains!132 (ListLongMap!2283 (_ BitVec 64) V!5345 (_ BitVec 64)) Unit!5507)

(assert (=> b!182569 (= lt!90201 (addStillContains!132 lt!90186 lt!90189 (zeroValue!3575 thiss!1248) lt!90207))))

(declare-fun +!273 (ListLongMap!2283 tuple2!3374) ListLongMap!2283)

(assert (=> b!182569 (contains!1247 (+!273 lt!90186 (tuple2!3375 lt!90189 (zeroValue!3575 thiss!1248))) lt!90207)))

(declare-fun lt!90193 () Unit!5507)

(assert (=> b!182569 (= lt!90193 lt!90201)))

(declare-fun lt!90205 () ListLongMap!2283)

(assert (=> b!182569 (= lt!90205 (getCurrentListMapNoExtraKeys!177 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)))))

(declare-fun lt!90192 () (_ BitVec 64))

(assert (=> b!182569 (= lt!90192 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90200 () (_ BitVec 64))

(assert (=> b!182569 (= lt!90200 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90194 () Unit!5507)

(declare-fun addApplyDifferent!132 (ListLongMap!2283 (_ BitVec 64) V!5345 (_ BitVec 64)) Unit!5507)

(assert (=> b!182569 (= lt!90194 (addApplyDifferent!132 lt!90205 lt!90192 (minValue!3575 thiss!1248) lt!90200))))

(declare-fun apply!156 (ListLongMap!2283 (_ BitVec 64)) V!5345)

(assert (=> b!182569 (= (apply!156 (+!273 lt!90205 (tuple2!3375 lt!90192 (minValue!3575 thiss!1248))) lt!90200) (apply!156 lt!90205 lt!90200))))

(declare-fun lt!90196 () Unit!5507)

(assert (=> b!182569 (= lt!90196 lt!90194)))

(declare-fun lt!90202 () ListLongMap!2283)

(assert (=> b!182569 (= lt!90202 (getCurrentListMapNoExtraKeys!177 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)))))

(declare-fun lt!90195 () (_ BitVec 64))

(assert (=> b!182569 (= lt!90195 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90203 () (_ BitVec 64))

(assert (=> b!182569 (= lt!90203 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90197 () Unit!5507)

(assert (=> b!182569 (= lt!90197 (addApplyDifferent!132 lt!90202 lt!90195 (zeroValue!3575 thiss!1248) lt!90203))))

(assert (=> b!182569 (= (apply!156 (+!273 lt!90202 (tuple2!3375 lt!90195 (zeroValue!3575 thiss!1248))) lt!90203) (apply!156 lt!90202 lt!90203))))

(declare-fun lt!90204 () Unit!5507)

(assert (=> b!182569 (= lt!90204 lt!90197)))

(declare-fun lt!90191 () ListLongMap!2283)

(assert (=> b!182569 (= lt!90191 (getCurrentListMapNoExtraKeys!177 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)))))

(declare-fun lt!90206 () (_ BitVec 64))

(assert (=> b!182569 (= lt!90206 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!90198 () (_ BitVec 64))

(assert (=> b!182569 (= lt!90198 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!182569 (= lt!90199 (addApplyDifferent!132 lt!90191 lt!90206 (minValue!3575 thiss!1248) lt!90198))))

(assert (=> b!182569 (= (apply!156 (+!273 lt!90191 (tuple2!3375 lt!90206 (minValue!3575 thiss!1248))) lt!90198) (apply!156 lt!90191 lt!90198))))

(declare-fun b!182570 () Bool)

(declare-fun res!86376 () Bool)

(declare-fun e!120205 () Bool)

(assert (=> b!182570 (=> (not res!86376) (not e!120205))))

(declare-fun e!120216 () Bool)

(assert (=> b!182570 (= res!86376 e!120216)))

(declare-fun c!32747 () Bool)

(assert (=> b!182570 (= c!32747 (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!18428 () ListLongMap!2283)

(declare-fun call!18430 () ListLongMap!2283)

(declare-fun call!18431 () ListLongMap!2283)

(declare-fun bm!18424 () Bool)

(declare-fun c!32752 () Bool)

(declare-fun call!18432 () ListLongMap!2283)

(declare-fun c!32749 () Bool)

(assert (=> bm!18424 (= call!18432 (+!273 (ite c!32752 call!18430 (ite c!32749 call!18428 call!18431)) (ite (or c!32752 c!32749) (tuple2!3375 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3575 thiss!1248)) (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3575 thiss!1248)))))))

(declare-fun d!54507 () Bool)

(assert (=> d!54507 e!120205))

(declare-fun res!86382 () Bool)

(assert (=> d!54507 (=> (not res!86382) (not e!120205))))

(assert (=> d!54507 (= res!86382 (or (bvsge #b00000000000000000000000000000000 (size!3959 (_keys!5646 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3959 (_keys!5646 thiss!1248))))))))

(declare-fun lt!90187 () ListLongMap!2283)

(declare-fun lt!90188 () ListLongMap!2283)

(assert (=> d!54507 (= lt!90187 lt!90188)))

(declare-fun lt!90190 () Unit!5507)

(assert (=> d!54507 (= lt!90190 e!120211)))

(declare-fun c!32751 () Bool)

(declare-fun e!120213 () Bool)

(assert (=> d!54507 (= c!32751 e!120213)))

(declare-fun res!86378 () Bool)

(assert (=> d!54507 (=> (not res!86378) (not e!120213))))

(assert (=> d!54507 (= res!86378 (bvslt #b00000000000000000000000000000000 (size!3959 (_keys!5646 thiss!1248))))))

(declare-fun e!120206 () ListLongMap!2283)

(assert (=> d!54507 (= lt!90188 e!120206)))

(assert (=> d!54507 (= c!32752 (and (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54507 (validMask!0 (mask!8779 thiss!1248))))

(assert (=> d!54507 (= (getCurrentListMap!790 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)) lt!90187)))

(declare-fun b!182571 () Bool)

(declare-fun e!120209 () Bool)

(assert (=> b!182571 (= e!120209 (validKeyInArray!0 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18425 () Bool)

(declare-fun call!18427 () ListLongMap!2283)

(assert (=> bm!18425 (= call!18427 call!18432)))

(declare-fun bm!18426 () Bool)

(assert (=> bm!18426 (= call!18430 (getCurrentListMapNoExtraKeys!177 (_keys!5646 thiss!1248) (_values!3717 thiss!1248) (mask!8779 thiss!1248) (extraKeys!3471 thiss!1248) (zeroValue!3575 thiss!1248) (minValue!3575 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3734 thiss!1248)))))

(declare-fun b!182572 () Bool)

(declare-fun e!120210 () ListLongMap!2283)

(assert (=> b!182572 (= e!120210 call!18431)))

(declare-fun b!182573 () Bool)

(assert (=> b!182573 (= e!120206 (+!273 call!18432 (tuple2!3375 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3575 thiss!1248))))))

(declare-fun b!182574 () Bool)

(declare-fun e!120214 () Bool)

(declare-fun e!120204 () Bool)

(assert (=> b!182574 (= e!120214 e!120204)))

(declare-fun res!86379 () Bool)

(declare-fun call!18429 () Bool)

(assert (=> b!182574 (= res!86379 call!18429)))

(assert (=> b!182574 (=> (not res!86379) (not e!120204))))

(declare-fun bm!18427 () Bool)

(assert (=> bm!18427 (= call!18431 call!18428)))

(declare-fun b!182575 () Bool)

(assert (=> b!182575 (= e!120205 e!120214)))

(declare-fun c!32750 () Bool)

(assert (=> b!182575 (= c!32750 (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182576 () Bool)

(declare-fun e!120215 () ListLongMap!2283)

(assert (=> b!182576 (= e!120215 call!18427)))

(declare-fun bm!18428 () Bool)

(assert (=> bm!18428 (= call!18428 call!18430)))

(declare-fun b!182577 () Bool)

(declare-fun e!120208 () Bool)

(assert (=> b!182577 (= e!120208 (= (apply!156 lt!90187 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3575 thiss!1248)))))

(declare-fun b!182578 () Bool)

(declare-fun e!120212 () Bool)

(declare-fun get!2091 (ValueCell!1793 V!5345) V!5345)

(declare-fun dynLambda!490 (Int (_ BitVec 64)) V!5345)

(assert (=> b!182578 (= e!120212 (= (apply!156 lt!90187 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000)) (get!2091 (select (arr!3647 (_values!3717 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!490 (defaultEntry!3734 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!182578 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3960 (_values!3717 thiss!1248))))))

(assert (=> b!182578 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3959 (_keys!5646 thiss!1248))))))

(declare-fun b!182579 () Bool)

(assert (=> b!182579 (= e!120213 (validKeyInArray!0 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182580 () Bool)

(assert (=> b!182580 (= e!120214 (not call!18429))))

(declare-fun b!182581 () Bool)

(assert (=> b!182581 (= e!120210 call!18427)))

(declare-fun bm!18429 () Bool)

(declare-fun call!18433 () Bool)

(assert (=> bm!18429 (= call!18433 (contains!1247 lt!90187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182582 () Bool)

(declare-fun c!32748 () Bool)

(assert (=> b!182582 (= c!32748 (and (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!182582 (= e!120215 e!120210)))

(declare-fun bm!18430 () Bool)

(assert (=> bm!18430 (= call!18429 (contains!1247 lt!90187 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!182583 () Bool)

(assert (=> b!182583 (= e!120206 e!120215)))

(assert (=> b!182583 (= c!32749 (and (not (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3471 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!182584 () Bool)

(declare-fun Unit!5510 () Unit!5507)

(assert (=> b!182584 (= e!120211 Unit!5510)))

(declare-fun b!182585 () Bool)

(assert (=> b!182585 (= e!120216 (not call!18433))))

(declare-fun b!182586 () Bool)

(declare-fun e!120207 () Bool)

(assert (=> b!182586 (= e!120207 e!120212)))

(declare-fun res!86383 () Bool)

(assert (=> b!182586 (=> (not res!86383) (not e!120212))))

(assert (=> b!182586 (= res!86383 (contains!1247 lt!90187 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!182586 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3959 (_keys!5646 thiss!1248))))))

(declare-fun b!182587 () Bool)

(assert (=> b!182587 (= e!120204 (= (apply!156 lt!90187 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3575 thiss!1248)))))

(declare-fun b!182588 () Bool)

(assert (=> b!182588 (= e!120216 e!120208)))

(declare-fun res!86381 () Bool)

(assert (=> b!182588 (= res!86381 call!18433)))

(assert (=> b!182588 (=> (not res!86381) (not e!120208))))

(declare-fun b!182589 () Bool)

(declare-fun res!86377 () Bool)

(assert (=> b!182589 (=> (not res!86377) (not e!120205))))

(assert (=> b!182589 (= res!86377 e!120207)))

(declare-fun res!86375 () Bool)

(assert (=> b!182589 (=> res!86375 e!120207)))

(assert (=> b!182589 (= res!86375 (not e!120209))))

(declare-fun res!86380 () Bool)

(assert (=> b!182589 (=> (not res!86380) (not e!120209))))

(assert (=> b!182589 (= res!86380 (bvslt #b00000000000000000000000000000000 (size!3959 (_keys!5646 thiss!1248))))))

(assert (= (and d!54507 c!32752) b!182573))

(assert (= (and d!54507 (not c!32752)) b!182583))

(assert (= (and b!182583 c!32749) b!182576))

(assert (= (and b!182583 (not c!32749)) b!182582))

(assert (= (and b!182582 c!32748) b!182581))

(assert (= (and b!182582 (not c!32748)) b!182572))

(assert (= (or b!182581 b!182572) bm!18427))

(assert (= (or b!182576 bm!18427) bm!18428))

(assert (= (or b!182576 b!182581) bm!18425))

(assert (= (or b!182573 bm!18428) bm!18426))

(assert (= (or b!182573 bm!18425) bm!18424))

(assert (= (and d!54507 res!86378) b!182579))

(assert (= (and d!54507 c!32751) b!182569))

(assert (= (and d!54507 (not c!32751)) b!182584))

(assert (= (and d!54507 res!86382) b!182589))

(assert (= (and b!182589 res!86380) b!182571))

(assert (= (and b!182589 (not res!86375)) b!182586))

(assert (= (and b!182586 res!86383) b!182578))

(assert (= (and b!182589 res!86377) b!182570))

(assert (= (and b!182570 c!32747) b!182588))

(assert (= (and b!182570 (not c!32747)) b!182585))

(assert (= (and b!182588 res!86381) b!182577))

(assert (= (or b!182588 b!182585) bm!18429))

(assert (= (and b!182570 res!86376) b!182575))

(assert (= (and b!182575 c!32750) b!182574))

(assert (= (and b!182575 (not c!32750)) b!182580))

(assert (= (and b!182574 res!86379) b!182587))

(assert (= (or b!182574 b!182580) bm!18430))

(declare-fun b_lambda!7161 () Bool)

(assert (=> (not b_lambda!7161) (not b!182578)))

(declare-fun t!7173 () Bool)

(declare-fun tb!2815 () Bool)

(assert (=> (and b!182416 (= (defaultEntry!3734 thiss!1248) (defaultEntry!3734 thiss!1248)) t!7173) tb!2815))

(declare-fun result!4739 () Bool)

(assert (=> tb!2815 (= result!4739 tp_is_empty!4273)))

(assert (=> b!182578 t!7173))

(declare-fun b_and!11045 () Bool)

(assert (= b_and!11039 (and (=> t!7173 result!4739) b_and!11045)))

(declare-fun m!209785 () Bool)

(assert (=> b!182573 m!209785))

(declare-fun m!209787 () Bool)

(assert (=> bm!18429 m!209787))

(assert (=> d!54507 m!209711))

(declare-fun m!209789 () Bool)

(assert (=> b!182587 m!209789))

(declare-fun m!209791 () Bool)

(assert (=> b!182577 m!209791))

(declare-fun m!209793 () Bool)

(assert (=> bm!18430 m!209793))

(assert (=> b!182586 m!209755))

(assert (=> b!182586 m!209755))

(declare-fun m!209795 () Bool)

(assert (=> b!182586 m!209795))

(assert (=> b!182571 m!209755))

(assert (=> b!182571 m!209755))

(assert (=> b!182571 m!209757))

(declare-fun m!209797 () Bool)

(assert (=> bm!18424 m!209797))

(assert (=> b!182579 m!209755))

(assert (=> b!182579 m!209755))

(assert (=> b!182579 m!209757))

(declare-fun m!209799 () Bool)

(assert (=> bm!18426 m!209799))

(declare-fun m!209801 () Bool)

(assert (=> b!182569 m!209801))

(assert (=> b!182569 m!209799))

(declare-fun m!209803 () Bool)

(assert (=> b!182569 m!209803))

(declare-fun m!209805 () Bool)

(assert (=> b!182569 m!209805))

(declare-fun m!209807 () Bool)

(assert (=> b!182569 m!209807))

(declare-fun m!209809 () Bool)

(assert (=> b!182569 m!209809))

(assert (=> b!182569 m!209807))

(declare-fun m!209811 () Bool)

(assert (=> b!182569 m!209811))

(declare-fun m!209813 () Bool)

(assert (=> b!182569 m!209813))

(declare-fun m!209815 () Bool)

(assert (=> b!182569 m!209815))

(declare-fun m!209817 () Bool)

(assert (=> b!182569 m!209817))

(declare-fun m!209819 () Bool)

(assert (=> b!182569 m!209819))

(assert (=> b!182569 m!209755))

(declare-fun m!209821 () Bool)

(assert (=> b!182569 m!209821))

(assert (=> b!182569 m!209811))

(declare-fun m!209823 () Bool)

(assert (=> b!182569 m!209823))

(assert (=> b!182569 m!209821))

(declare-fun m!209825 () Bool)

(assert (=> b!182569 m!209825))

(assert (=> b!182569 m!209801))

(declare-fun m!209827 () Bool)

(assert (=> b!182569 m!209827))

(declare-fun m!209829 () Bool)

(assert (=> b!182569 m!209829))

(declare-fun m!209831 () Bool)

(assert (=> b!182578 m!209831))

(assert (=> b!182578 m!209755))

(declare-fun m!209833 () Bool)

(assert (=> b!182578 m!209833))

(assert (=> b!182578 m!209831))

(assert (=> b!182578 m!209833))

(declare-fun m!209835 () Bool)

(assert (=> b!182578 m!209835))

(assert (=> b!182578 m!209755))

(declare-fun m!209837 () Bool)

(assert (=> b!182578 m!209837))

(assert (=> b!182414 d!54507))

(declare-fun d!54509 () Bool)

(declare-fun res!86389 () Bool)

(declare-fun e!120225 () Bool)

(assert (=> d!54509 (=> res!86389 e!120225)))

(assert (=> d!54509 (= res!86389 (bvsge #b00000000000000000000000000000000 (size!3959 (_keys!5646 thiss!1248))))))

(assert (=> d!54509 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5646 thiss!1248) (mask!8779 thiss!1248)) e!120225)))

(declare-fun b!182600 () Bool)

(declare-fun e!120224 () Bool)

(declare-fun call!18436 () Bool)

(assert (=> b!182600 (= e!120224 call!18436)))

(declare-fun b!182601 () Bool)

(declare-fun e!120223 () Bool)

(assert (=> b!182601 (= e!120223 call!18436)))

(declare-fun bm!18433 () Bool)

(assert (=> bm!18433 (= call!18436 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5646 thiss!1248) (mask!8779 thiss!1248)))))

(declare-fun b!182602 () Bool)

(assert (=> b!182602 (= e!120225 e!120224)))

(declare-fun c!32755 () Bool)

(assert (=> b!182602 (= c!32755 (validKeyInArray!0 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!182603 () Bool)

(assert (=> b!182603 (= e!120224 e!120223)))

(declare-fun lt!90215 () (_ BitVec 64))

(assert (=> b!182603 (= lt!90215 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!90216 () Unit!5507)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7713 (_ BitVec 64) (_ BitVec 32)) Unit!5507)

(assert (=> b!182603 (= lt!90216 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5646 thiss!1248) lt!90215 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!182603 (arrayContainsKey!0 (_keys!5646 thiss!1248) lt!90215 #b00000000000000000000000000000000)))

(declare-fun lt!90214 () Unit!5507)

(assert (=> b!182603 (= lt!90214 lt!90216)))

(declare-fun res!86388 () Bool)

(assert (=> b!182603 (= res!86388 (= (seekEntryOrOpen!0 (select (arr!3646 (_keys!5646 thiss!1248)) #b00000000000000000000000000000000) (_keys!5646 thiss!1248) (mask!8779 thiss!1248)) (Found!615 #b00000000000000000000000000000000)))))

(assert (=> b!182603 (=> (not res!86388) (not e!120223))))

(assert (= (and d!54509 (not res!86389)) b!182602))

(assert (= (and b!182602 c!32755) b!182603))

(assert (= (and b!182602 (not c!32755)) b!182600))

(assert (= (and b!182603 res!86388) b!182601))

(assert (= (or b!182601 b!182600) bm!18433))

(declare-fun m!209839 () Bool)

(assert (=> bm!18433 m!209839))

(assert (=> b!182602 m!209755))

(assert (=> b!182602 m!209755))

(assert (=> b!182602 m!209757))

(assert (=> b!182603 m!209755))

(declare-fun m!209841 () Bool)

(assert (=> b!182603 m!209841))

(declare-fun m!209843 () Bool)

(assert (=> b!182603 m!209843))

(assert (=> b!182603 m!209755))

(declare-fun m!209845 () Bool)

(assert (=> b!182603 m!209845))

(assert (=> b!182412 d!54509))

(declare-fun d!54511 () Bool)

(declare-fun res!86396 () Bool)

(declare-fun e!120228 () Bool)

(assert (=> d!54511 (=> (not res!86396) (not e!120228))))

(declare-fun simpleValid!172 (LongMapFixedSize!2494) Bool)

(assert (=> d!54511 (= res!86396 (simpleValid!172 thiss!1248))))

(assert (=> d!54511 (= (valid!1052 thiss!1248) e!120228)))

(declare-fun b!182610 () Bool)

(declare-fun res!86397 () Bool)

(assert (=> b!182610 (=> (not res!86397) (not e!120228))))

(declare-fun arrayCountValidKeys!0 (array!7713 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!182610 (= res!86397 (= (arrayCountValidKeys!0 (_keys!5646 thiss!1248) #b00000000000000000000000000000000 (size!3959 (_keys!5646 thiss!1248))) (_size!1296 thiss!1248)))))

(declare-fun b!182611 () Bool)

(declare-fun res!86398 () Bool)

(assert (=> b!182611 (=> (not res!86398) (not e!120228))))

(assert (=> b!182611 (= res!86398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5646 thiss!1248) (mask!8779 thiss!1248)))))

(declare-fun b!182612 () Bool)

(assert (=> b!182612 (= e!120228 (arrayNoDuplicates!0 (_keys!5646 thiss!1248) #b00000000000000000000000000000000 Nil!2312))))

(assert (= (and d!54511 res!86396) b!182610))

(assert (= (and b!182610 res!86397) b!182611))

(assert (= (and b!182611 res!86398) b!182612))

(declare-fun m!209847 () Bool)

(assert (=> d!54511 m!209847))

(declare-fun m!209849 () Bool)

(assert (=> b!182610 m!209849))

(assert (=> b!182611 m!209713))

(assert (=> b!182612 m!209695))

(assert (=> start!18410 d!54511))

(declare-fun b!182619 () Bool)

(declare-fun e!120234 () Bool)

(assert (=> b!182619 (= e!120234 tp_is_empty!4273)))

(declare-fun b!182620 () Bool)

(declare-fun e!120233 () Bool)

(assert (=> b!182620 (= e!120233 tp_is_empty!4273)))

(declare-fun mapIsEmpty!7343 () Bool)

(declare-fun mapRes!7343 () Bool)

(assert (=> mapIsEmpty!7343 mapRes!7343))

(declare-fun condMapEmpty!7343 () Bool)

(declare-fun mapDefault!7343 () ValueCell!1793)

(assert (=> mapNonEmpty!7334 (= condMapEmpty!7343 (= mapRest!7334 ((as const (Array (_ BitVec 32) ValueCell!1793)) mapDefault!7343)))))

(assert (=> mapNonEmpty!7334 (= tp!16265 (and e!120233 mapRes!7343))))

(declare-fun mapNonEmpty!7343 () Bool)

(declare-fun tp!16280 () Bool)

(assert (=> mapNonEmpty!7343 (= mapRes!7343 (and tp!16280 e!120234))))

(declare-fun mapRest!7343 () (Array (_ BitVec 32) ValueCell!1793))

(declare-fun mapKey!7343 () (_ BitVec 32))

(declare-fun mapValue!7343 () ValueCell!1793)

(assert (=> mapNonEmpty!7343 (= mapRest!7334 (store mapRest!7343 mapKey!7343 mapValue!7343))))

(assert (= (and mapNonEmpty!7334 condMapEmpty!7343) mapIsEmpty!7343))

(assert (= (and mapNonEmpty!7334 (not condMapEmpty!7343)) mapNonEmpty!7343))

(assert (= (and mapNonEmpty!7343 ((_ is ValueCellFull!1793) mapValue!7343)) b!182619))

(assert (= (and mapNonEmpty!7334 ((_ is ValueCellFull!1793) mapDefault!7343)) b!182620))

(declare-fun m!209851 () Bool)

(assert (=> mapNonEmpty!7343 m!209851))

(declare-fun b_lambda!7163 () Bool)

(assert (= b_lambda!7161 (or (and b!182416 b_free!4501) b_lambda!7163)))

(check-sat (not b!182612) (not bm!18429) (not b!182577) (not b!182578) (not d!54507) (not b!182603) (not bm!18433) (not b_lambda!7163) (not b!182571) (not bm!18430) (not b!182513) (not b!182499) (not b!182579) tp_is_empty!4273 (not b!182524) (not d!54511) b_and!11045 (not b!182610) (not d!54505) (not b!182573) (not b!182526) (not bm!18409) (not d!54501) (not b!182569) (not bm!18424) (not b_next!4501) (not b!182602) (not b!182497) (not mapNonEmpty!7343) (not bm!18426) (not b!182496) (not b!182611) (not b!182587) (not b!182586))
(check-sat b_and!11045 (not b_next!4501))
