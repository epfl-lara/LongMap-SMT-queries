; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16432 () Bool)

(assert start!16432)

(declare-fun b!163589 () Bool)

(declare-fun b_free!3801 () Bool)

(declare-fun b_next!3801 () Bool)

(assert (=> b!163589 (= b_free!3801 (not b_next!3801))))

(declare-fun tp!13990 () Bool)

(declare-fun b_and!10215 () Bool)

(assert (=> b!163589 (= tp!13990 b_and!10215)))

(declare-fun res!77414 () Bool)

(declare-fun e!107340 () Bool)

(assert (=> start!16432 (=> (not res!77414) (not e!107340))))

(declare-datatypes ((V!4451 0))(
  ( (V!4452 (val!1846 Int)) )
))
(declare-datatypes ((ValueCell!1458 0))(
  ( (ValueCellFull!1458 (v!3711 V!4451)) (EmptyCell!1458) )
))
(declare-datatypes ((array!6295 0))(
  ( (array!6296 (arr!2987 (Array (_ BitVec 32) (_ BitVec 64))) (size!3274 (_ BitVec 32))) )
))
(declare-datatypes ((array!6297 0))(
  ( (array!6298 (arr!2988 (Array (_ BitVec 32) ValueCell!1458)) (size!3275 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1824 0))(
  ( (LongMapFixedSize!1825 (defaultEntry!3354 Int) (mask!8018 (_ BitVec 32)) (extraKeys!3095 (_ BitVec 32)) (zeroValue!3197 V!4451) (minValue!3197 V!4451) (_size!961 (_ BitVec 32)) (_keys!5169 array!6295) (_values!3337 array!6297) (_vacant!961 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1824)

(declare-fun valid!816 (LongMapFixedSize!1824) Bool)

(assert (=> start!16432 (= res!77414 (valid!816 thiss!1248))))

(assert (=> start!16432 e!107340))

(declare-fun e!107338 () Bool)

(assert (=> start!16432 e!107338))

(assert (=> start!16432 true))

(declare-fun b!163588 () Bool)

(declare-fun res!77412 () Bool)

(assert (=> b!163588 (=> (not res!77412) (not e!107340))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163588 (= res!77412 (not (= key!828 (bvneg key!828))))))

(declare-fun tp_is_empty!3603 () Bool)

(declare-fun e!107335 () Bool)

(declare-fun array_inv!1911 (array!6295) Bool)

(declare-fun array_inv!1912 (array!6297) Bool)

(assert (=> b!163589 (= e!107338 (and tp!13990 tp_is_empty!3603 (array_inv!1911 (_keys!5169 thiss!1248)) (array_inv!1912 (_values!3337 thiss!1248)) e!107335))))

(declare-fun b!163590 () Bool)

(declare-fun res!77411 () Bool)

(declare-fun e!107339 () Bool)

(assert (=> b!163590 (=> (not res!77411) (not e!107339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163590 (= res!77411 (validMask!0 (mask!8018 thiss!1248)))))

(declare-fun b!163591 () Bool)

(assert (=> b!163591 (= e!107339 (and (= (size!3275 (_values!3337 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8018 thiss!1248))) (= (size!3274 (_keys!5169 thiss!1248)) (size!3275 (_values!3337 thiss!1248))) (bvsge (mask!8018 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3095 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3095 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!163592 () Bool)

(declare-fun e!107337 () Bool)

(assert (=> b!163592 (= e!107337 tp_is_empty!3603)))

(declare-fun b!163593 () Bool)

(declare-fun e!107336 () Bool)

(assert (=> b!163593 (= e!107336 tp_is_empty!3603)))

(declare-fun mapIsEmpty!6110 () Bool)

(declare-fun mapRes!6110 () Bool)

(assert (=> mapIsEmpty!6110 mapRes!6110))

(declare-fun b!163594 () Bool)

(assert (=> b!163594 (= e!107340 e!107339)))

(declare-fun res!77413 () Bool)

(assert (=> b!163594 (=> (not res!77413) (not e!107339))))

(declare-datatypes ((SeekEntryResult!401 0))(
  ( (MissingZero!401 (index!3772 (_ BitVec 32))) (Found!401 (index!3773 (_ BitVec 32))) (Intermediate!401 (undefined!1213 Bool) (index!3774 (_ BitVec 32)) (x!18132 (_ BitVec 32))) (Undefined!401) (MissingVacant!401 (index!3775 (_ BitVec 32))) )
))
(declare-fun lt!82720 () SeekEntryResult!401)

(get-info :version)

(assert (=> b!163594 (= res!77413 (and (not ((_ is Undefined!401) lt!82720)) (not ((_ is MissingVacant!401) lt!82720)) (not ((_ is MissingZero!401) lt!82720)) ((_ is Found!401) lt!82720)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6295 (_ BitVec 32)) SeekEntryResult!401)

(assert (=> b!163594 (= lt!82720 (seekEntryOrOpen!0 key!828 (_keys!5169 thiss!1248) (mask!8018 thiss!1248)))))

(declare-fun b!163595 () Bool)

(assert (=> b!163595 (= e!107335 (and e!107336 mapRes!6110))))

(declare-fun condMapEmpty!6110 () Bool)

(declare-fun mapDefault!6110 () ValueCell!1458)

(assert (=> b!163595 (= condMapEmpty!6110 (= (arr!2988 (_values!3337 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1458)) mapDefault!6110)))))

(declare-fun mapNonEmpty!6110 () Bool)

(declare-fun tp!13991 () Bool)

(assert (=> mapNonEmpty!6110 (= mapRes!6110 (and tp!13991 e!107337))))

(declare-fun mapRest!6110 () (Array (_ BitVec 32) ValueCell!1458))

(declare-fun mapValue!6110 () ValueCell!1458)

(declare-fun mapKey!6110 () (_ BitVec 32))

(assert (=> mapNonEmpty!6110 (= (arr!2988 (_values!3337 thiss!1248)) (store mapRest!6110 mapKey!6110 mapValue!6110))))

(assert (= (and start!16432 res!77414) b!163588))

(assert (= (and b!163588 res!77412) b!163594))

(assert (= (and b!163594 res!77413) b!163590))

(assert (= (and b!163590 res!77411) b!163591))

(assert (= (and b!163595 condMapEmpty!6110) mapIsEmpty!6110))

(assert (= (and b!163595 (not condMapEmpty!6110)) mapNonEmpty!6110))

(assert (= (and mapNonEmpty!6110 ((_ is ValueCellFull!1458) mapValue!6110)) b!163592))

(assert (= (and b!163595 ((_ is ValueCellFull!1458) mapDefault!6110)) b!163593))

(assert (= b!163589 b!163595))

(assert (= start!16432 b!163589))

(declare-fun m!194181 () Bool)

(assert (=> start!16432 m!194181))

(declare-fun m!194183 () Bool)

(assert (=> b!163589 m!194183))

(declare-fun m!194185 () Bool)

(assert (=> b!163589 m!194185))

(declare-fun m!194187 () Bool)

(assert (=> b!163594 m!194187))

(declare-fun m!194189 () Bool)

(assert (=> mapNonEmpty!6110 m!194189))

(declare-fun m!194191 () Bool)

(assert (=> b!163590 m!194191))

(check-sat (not start!16432) tp_is_empty!3603 b_and!10215 (not b!163594) (not mapNonEmpty!6110) (not b!163590) (not b!163589) (not b_next!3801))
(check-sat b_and!10215 (not b_next!3801))
(get-model)

(declare-fun d!51459 () Bool)

(assert (=> d!51459 (= (array_inv!1911 (_keys!5169 thiss!1248)) (bvsge (size!3274 (_keys!5169 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163589 d!51459))

(declare-fun d!51461 () Bool)

(assert (=> d!51461 (= (array_inv!1912 (_values!3337 thiss!1248)) (bvsge (size!3275 (_values!3337 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163589 d!51461))

(declare-fun b!163632 () Bool)

(declare-fun c!30121 () Bool)

(declare-fun lt!82731 () (_ BitVec 64))

(assert (=> b!163632 (= c!30121 (= lt!82731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107368 () SeekEntryResult!401)

(declare-fun e!107370 () SeekEntryResult!401)

(assert (=> b!163632 (= e!107368 e!107370)))

(declare-fun d!51463 () Bool)

(declare-fun lt!82730 () SeekEntryResult!401)

(assert (=> d!51463 (and (or ((_ is Undefined!401) lt!82730) (not ((_ is Found!401) lt!82730)) (and (bvsge (index!3773 lt!82730) #b00000000000000000000000000000000) (bvslt (index!3773 lt!82730) (size!3274 (_keys!5169 thiss!1248))))) (or ((_ is Undefined!401) lt!82730) ((_ is Found!401) lt!82730) (not ((_ is MissingZero!401) lt!82730)) (and (bvsge (index!3772 lt!82730) #b00000000000000000000000000000000) (bvslt (index!3772 lt!82730) (size!3274 (_keys!5169 thiss!1248))))) (or ((_ is Undefined!401) lt!82730) ((_ is Found!401) lt!82730) ((_ is MissingZero!401) lt!82730) (not ((_ is MissingVacant!401) lt!82730)) (and (bvsge (index!3775 lt!82730) #b00000000000000000000000000000000) (bvslt (index!3775 lt!82730) (size!3274 (_keys!5169 thiss!1248))))) (or ((_ is Undefined!401) lt!82730) (ite ((_ is Found!401) lt!82730) (= (select (arr!2987 (_keys!5169 thiss!1248)) (index!3773 lt!82730)) key!828) (ite ((_ is MissingZero!401) lt!82730) (= (select (arr!2987 (_keys!5169 thiss!1248)) (index!3772 lt!82730)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!401) lt!82730) (= (select (arr!2987 (_keys!5169 thiss!1248)) (index!3775 lt!82730)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!107369 () SeekEntryResult!401)

(assert (=> d!51463 (= lt!82730 e!107369)))

(declare-fun c!30119 () Bool)

(declare-fun lt!82732 () SeekEntryResult!401)

(assert (=> d!51463 (= c!30119 (and ((_ is Intermediate!401) lt!82732) (undefined!1213 lt!82732)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6295 (_ BitVec 32)) SeekEntryResult!401)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51463 (= lt!82732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8018 thiss!1248)) key!828 (_keys!5169 thiss!1248) (mask!8018 thiss!1248)))))

(assert (=> d!51463 (validMask!0 (mask!8018 thiss!1248))))

(assert (=> d!51463 (= (seekEntryOrOpen!0 key!828 (_keys!5169 thiss!1248) (mask!8018 thiss!1248)) lt!82730)))

(declare-fun b!163633 () Bool)

(assert (=> b!163633 (= e!107368 (Found!401 (index!3774 lt!82732)))))

(declare-fun b!163634 () Bool)

(assert (=> b!163634 (= e!107369 Undefined!401)))

(declare-fun b!163635 () Bool)

(assert (=> b!163635 (= e!107370 (MissingZero!401 (index!3774 lt!82732)))))

(declare-fun b!163636 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6295 (_ BitVec 32)) SeekEntryResult!401)

(assert (=> b!163636 (= e!107370 (seekKeyOrZeroReturnVacant!0 (x!18132 lt!82732) (index!3774 lt!82732) (index!3774 lt!82732) key!828 (_keys!5169 thiss!1248) (mask!8018 thiss!1248)))))

(declare-fun b!163637 () Bool)

(assert (=> b!163637 (= e!107369 e!107368)))

(assert (=> b!163637 (= lt!82731 (select (arr!2987 (_keys!5169 thiss!1248)) (index!3774 lt!82732)))))

(declare-fun c!30120 () Bool)

(assert (=> b!163637 (= c!30120 (= lt!82731 key!828))))

(assert (= (and d!51463 c!30119) b!163634))

(assert (= (and d!51463 (not c!30119)) b!163637))

(assert (= (and b!163637 c!30120) b!163633))

(assert (= (and b!163637 (not c!30120)) b!163632))

(assert (= (and b!163632 c!30121) b!163635))

(assert (= (and b!163632 (not c!30121)) b!163636))

(assert (=> d!51463 m!194191))

(declare-fun m!194205 () Bool)

(assert (=> d!51463 m!194205))

(declare-fun m!194207 () Bool)

(assert (=> d!51463 m!194207))

(declare-fun m!194209 () Bool)

(assert (=> d!51463 m!194209))

(declare-fun m!194211 () Bool)

(assert (=> d!51463 m!194211))

(assert (=> d!51463 m!194209))

(declare-fun m!194213 () Bool)

(assert (=> d!51463 m!194213))

(declare-fun m!194215 () Bool)

(assert (=> b!163636 m!194215))

(declare-fun m!194217 () Bool)

(assert (=> b!163637 m!194217))

(assert (=> b!163594 d!51463))

(declare-fun d!51465 () Bool)

(declare-fun res!77433 () Bool)

(declare-fun e!107373 () Bool)

(assert (=> d!51465 (=> (not res!77433) (not e!107373))))

(declare-fun simpleValid!123 (LongMapFixedSize!1824) Bool)

(assert (=> d!51465 (= res!77433 (simpleValid!123 thiss!1248))))

(assert (=> d!51465 (= (valid!816 thiss!1248) e!107373)))

(declare-fun b!163644 () Bool)

(declare-fun res!77434 () Bool)

(assert (=> b!163644 (=> (not res!77434) (not e!107373))))

(declare-fun arrayCountValidKeys!0 (array!6295 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163644 (= res!77434 (= (arrayCountValidKeys!0 (_keys!5169 thiss!1248) #b00000000000000000000000000000000 (size!3274 (_keys!5169 thiss!1248))) (_size!961 thiss!1248)))))

(declare-fun b!163645 () Bool)

(declare-fun res!77435 () Bool)

(assert (=> b!163645 (=> (not res!77435) (not e!107373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6295 (_ BitVec 32)) Bool)

(assert (=> b!163645 (= res!77435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5169 thiss!1248) (mask!8018 thiss!1248)))))

(declare-fun b!163646 () Bool)

(declare-datatypes ((List!1992 0))(
  ( (Nil!1989) (Cons!1988 (h!2604 (_ BitVec 64)) (t!6794 List!1992)) )
))
(declare-fun arrayNoDuplicates!0 (array!6295 (_ BitVec 32) List!1992) Bool)

(assert (=> b!163646 (= e!107373 (arrayNoDuplicates!0 (_keys!5169 thiss!1248) #b00000000000000000000000000000000 Nil!1989))))

(assert (= (and d!51465 res!77433) b!163644))

(assert (= (and b!163644 res!77434) b!163645))

(assert (= (and b!163645 res!77435) b!163646))

(declare-fun m!194219 () Bool)

(assert (=> d!51465 m!194219))

(declare-fun m!194221 () Bool)

(assert (=> b!163644 m!194221))

(declare-fun m!194223 () Bool)

(assert (=> b!163645 m!194223))

(declare-fun m!194225 () Bool)

(assert (=> b!163646 m!194225))

(assert (=> start!16432 d!51465))

(declare-fun d!51467 () Bool)

(assert (=> d!51467 (= (validMask!0 (mask!8018 thiss!1248)) (and (or (= (mask!8018 thiss!1248) #b00000000000000000000000000000111) (= (mask!8018 thiss!1248) #b00000000000000000000000000001111) (= (mask!8018 thiss!1248) #b00000000000000000000000000011111) (= (mask!8018 thiss!1248) #b00000000000000000000000000111111) (= (mask!8018 thiss!1248) #b00000000000000000000000001111111) (= (mask!8018 thiss!1248) #b00000000000000000000000011111111) (= (mask!8018 thiss!1248) #b00000000000000000000000111111111) (= (mask!8018 thiss!1248) #b00000000000000000000001111111111) (= (mask!8018 thiss!1248) #b00000000000000000000011111111111) (= (mask!8018 thiss!1248) #b00000000000000000000111111111111) (= (mask!8018 thiss!1248) #b00000000000000000001111111111111) (= (mask!8018 thiss!1248) #b00000000000000000011111111111111) (= (mask!8018 thiss!1248) #b00000000000000000111111111111111) (= (mask!8018 thiss!1248) #b00000000000000001111111111111111) (= (mask!8018 thiss!1248) #b00000000000000011111111111111111) (= (mask!8018 thiss!1248) #b00000000000000111111111111111111) (= (mask!8018 thiss!1248) #b00000000000001111111111111111111) (= (mask!8018 thiss!1248) #b00000000000011111111111111111111) (= (mask!8018 thiss!1248) #b00000000000111111111111111111111) (= (mask!8018 thiss!1248) #b00000000001111111111111111111111) (= (mask!8018 thiss!1248) #b00000000011111111111111111111111) (= (mask!8018 thiss!1248) #b00000000111111111111111111111111) (= (mask!8018 thiss!1248) #b00000001111111111111111111111111) (= (mask!8018 thiss!1248) #b00000011111111111111111111111111) (= (mask!8018 thiss!1248) #b00000111111111111111111111111111) (= (mask!8018 thiss!1248) #b00001111111111111111111111111111) (= (mask!8018 thiss!1248) #b00011111111111111111111111111111) (= (mask!8018 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8018 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163590 d!51467))

(declare-fun condMapEmpty!6116 () Bool)

(declare-fun mapDefault!6116 () ValueCell!1458)

(assert (=> mapNonEmpty!6110 (= condMapEmpty!6116 (= mapRest!6110 ((as const (Array (_ BitVec 32) ValueCell!1458)) mapDefault!6116)))))

(declare-fun e!107378 () Bool)

(declare-fun mapRes!6116 () Bool)

(assert (=> mapNonEmpty!6110 (= tp!13991 (and e!107378 mapRes!6116))))

(declare-fun b!163654 () Bool)

(assert (=> b!163654 (= e!107378 tp_is_empty!3603)))

(declare-fun mapIsEmpty!6116 () Bool)

(assert (=> mapIsEmpty!6116 mapRes!6116))

(declare-fun mapNonEmpty!6116 () Bool)

(declare-fun tp!14000 () Bool)

(declare-fun e!107379 () Bool)

(assert (=> mapNonEmpty!6116 (= mapRes!6116 (and tp!14000 e!107379))))

(declare-fun mapValue!6116 () ValueCell!1458)

(declare-fun mapKey!6116 () (_ BitVec 32))

(declare-fun mapRest!6116 () (Array (_ BitVec 32) ValueCell!1458))

(assert (=> mapNonEmpty!6116 (= mapRest!6110 (store mapRest!6116 mapKey!6116 mapValue!6116))))

(declare-fun b!163653 () Bool)

(assert (=> b!163653 (= e!107379 tp_is_empty!3603)))

(assert (= (and mapNonEmpty!6110 condMapEmpty!6116) mapIsEmpty!6116))

(assert (= (and mapNonEmpty!6110 (not condMapEmpty!6116)) mapNonEmpty!6116))

(assert (= (and mapNonEmpty!6116 ((_ is ValueCellFull!1458) mapValue!6116)) b!163653))

(assert (= (and mapNonEmpty!6110 ((_ is ValueCellFull!1458) mapDefault!6116)) b!163654))

(declare-fun m!194227 () Bool)

(assert (=> mapNonEmpty!6116 m!194227))

(check-sat (not b_next!3801) (not d!51463) (not mapNonEmpty!6116) (not b!163644) (not b!163645) (not b!163646) (not b!163636) tp_is_empty!3603 b_and!10215 (not d!51465))
(check-sat b_and!10215 (not b_next!3801))
(get-model)

(declare-fun b!163667 () Bool)

(declare-fun e!107388 () SeekEntryResult!401)

(assert (=> b!163667 (= e!107388 (MissingVacant!401 (index!3774 lt!82732)))))

(declare-fun b!163668 () Bool)

(declare-fun e!107386 () SeekEntryResult!401)

(assert (=> b!163668 (= e!107386 Undefined!401)))

(declare-fun lt!82738 () SeekEntryResult!401)

(declare-fun d!51469 () Bool)

(assert (=> d!51469 (and (or ((_ is Undefined!401) lt!82738) (not ((_ is Found!401) lt!82738)) (and (bvsge (index!3773 lt!82738) #b00000000000000000000000000000000) (bvslt (index!3773 lt!82738) (size!3274 (_keys!5169 thiss!1248))))) (or ((_ is Undefined!401) lt!82738) ((_ is Found!401) lt!82738) (not ((_ is MissingVacant!401) lt!82738)) (not (= (index!3775 lt!82738) (index!3774 lt!82732))) (and (bvsge (index!3775 lt!82738) #b00000000000000000000000000000000) (bvslt (index!3775 lt!82738) (size!3274 (_keys!5169 thiss!1248))))) (or ((_ is Undefined!401) lt!82738) (ite ((_ is Found!401) lt!82738) (= (select (arr!2987 (_keys!5169 thiss!1248)) (index!3773 lt!82738)) key!828) (and ((_ is MissingVacant!401) lt!82738) (= (index!3775 lt!82738) (index!3774 lt!82732)) (= (select (arr!2987 (_keys!5169 thiss!1248)) (index!3775 lt!82738)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!51469 (= lt!82738 e!107386)))

(declare-fun c!30129 () Bool)

(assert (=> d!51469 (= c!30129 (bvsge (x!18132 lt!82732) #b01111111111111111111111111111110))))

(declare-fun lt!82737 () (_ BitVec 64))

(assert (=> d!51469 (= lt!82737 (select (arr!2987 (_keys!5169 thiss!1248)) (index!3774 lt!82732)))))

(assert (=> d!51469 (validMask!0 (mask!8018 thiss!1248))))

(assert (=> d!51469 (= (seekKeyOrZeroReturnVacant!0 (x!18132 lt!82732) (index!3774 lt!82732) (index!3774 lt!82732) key!828 (_keys!5169 thiss!1248) (mask!8018 thiss!1248)) lt!82738)))

(declare-fun b!163669 () Bool)

(declare-fun e!107387 () SeekEntryResult!401)

(assert (=> b!163669 (= e!107386 e!107387)))

(declare-fun c!30130 () Bool)

(assert (=> b!163669 (= c!30130 (= lt!82737 key!828))))

(declare-fun b!163670 () Bool)

(declare-fun c!30128 () Bool)

(assert (=> b!163670 (= c!30128 (= lt!82737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163670 (= e!107387 e!107388)))

(declare-fun b!163671 () Bool)

(assert (=> b!163671 (= e!107387 (Found!401 (index!3774 lt!82732)))))

(declare-fun b!163672 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163672 (= e!107388 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18132 lt!82732) #b00000000000000000000000000000001) (nextIndex!0 (index!3774 lt!82732) (x!18132 lt!82732) (mask!8018 thiss!1248)) (index!3774 lt!82732) key!828 (_keys!5169 thiss!1248) (mask!8018 thiss!1248)))))

(assert (= (and d!51469 c!30129) b!163668))

(assert (= (and d!51469 (not c!30129)) b!163669))

(assert (= (and b!163669 c!30130) b!163671))

(assert (= (and b!163669 (not c!30130)) b!163670))

(assert (= (and b!163670 c!30128) b!163667))

(assert (= (and b!163670 (not c!30128)) b!163672))

(declare-fun m!194229 () Bool)

(assert (=> d!51469 m!194229))

(declare-fun m!194231 () Bool)

(assert (=> d!51469 m!194231))

(assert (=> d!51469 m!194217))

(assert (=> d!51469 m!194191))

(declare-fun m!194233 () Bool)

(assert (=> b!163672 m!194233))

(assert (=> b!163672 m!194233))

(declare-fun m!194235 () Bool)

(assert (=> b!163672 m!194235))

(assert (=> b!163636 d!51469))

(declare-fun b!163691 () Bool)

(declare-fun lt!82743 () SeekEntryResult!401)

(assert (=> b!163691 (and (bvsge (index!3774 lt!82743) #b00000000000000000000000000000000) (bvslt (index!3774 lt!82743) (size!3274 (_keys!5169 thiss!1248))))))

(declare-fun e!107402 () Bool)

(assert (=> b!163691 (= e!107402 (= (select (arr!2987 (_keys!5169 thiss!1248)) (index!3774 lt!82743)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!163692 () Bool)

(declare-fun e!107401 () SeekEntryResult!401)

(declare-fun e!107403 () SeekEntryResult!401)

(assert (=> b!163692 (= e!107401 e!107403)))

(declare-fun c!30139 () Bool)

(declare-fun lt!82744 () (_ BitVec 64))

(assert (=> b!163692 (= c!30139 (or (= lt!82744 key!828) (= (bvadd lt!82744 lt!82744) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!51471 () Bool)

(declare-fun e!107400 () Bool)

(assert (=> d!51471 e!107400))

(declare-fun c!30137 () Bool)

(assert (=> d!51471 (= c!30137 (and ((_ is Intermediate!401) lt!82743) (undefined!1213 lt!82743)))))

(assert (=> d!51471 (= lt!82743 e!107401)))

(declare-fun c!30138 () Bool)

(assert (=> d!51471 (= c!30138 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51471 (= lt!82744 (select (arr!2987 (_keys!5169 thiss!1248)) (toIndex!0 key!828 (mask!8018 thiss!1248))))))

(assert (=> d!51471 (validMask!0 (mask!8018 thiss!1248))))

(assert (=> d!51471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8018 thiss!1248)) key!828 (_keys!5169 thiss!1248) (mask!8018 thiss!1248)) lt!82743)))

(declare-fun b!163693 () Bool)

(assert (=> b!163693 (= e!107400 (bvsge (x!18132 lt!82743) #b01111111111111111111111111111110))))

(declare-fun b!163694 () Bool)

(assert (=> b!163694 (= e!107403 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8018 thiss!1248)) #b00000000000000000000000000000000 (mask!8018 thiss!1248)) key!828 (_keys!5169 thiss!1248) (mask!8018 thiss!1248)))))

(declare-fun b!163695 () Bool)

(assert (=> b!163695 (and (bvsge (index!3774 lt!82743) #b00000000000000000000000000000000) (bvslt (index!3774 lt!82743) (size!3274 (_keys!5169 thiss!1248))))))

(declare-fun res!77444 () Bool)

(assert (=> b!163695 (= res!77444 (= (select (arr!2987 (_keys!5169 thiss!1248)) (index!3774 lt!82743)) key!828))))

(assert (=> b!163695 (=> res!77444 e!107402)))

(declare-fun e!107399 () Bool)

(assert (=> b!163695 (= e!107399 e!107402)))

(declare-fun b!163696 () Bool)

(assert (=> b!163696 (= e!107400 e!107399)))

(declare-fun res!77442 () Bool)

(assert (=> b!163696 (= res!77442 (and ((_ is Intermediate!401) lt!82743) (not (undefined!1213 lt!82743)) (bvslt (x!18132 lt!82743) #b01111111111111111111111111111110) (bvsge (x!18132 lt!82743) #b00000000000000000000000000000000) (bvsge (x!18132 lt!82743) #b00000000000000000000000000000000)))))

(assert (=> b!163696 (=> (not res!77442) (not e!107399))))

(declare-fun b!163697 () Bool)

(assert (=> b!163697 (= e!107403 (Intermediate!401 false (toIndex!0 key!828 (mask!8018 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163698 () Bool)

(assert (=> b!163698 (and (bvsge (index!3774 lt!82743) #b00000000000000000000000000000000) (bvslt (index!3774 lt!82743) (size!3274 (_keys!5169 thiss!1248))))))

(declare-fun res!77443 () Bool)

(assert (=> b!163698 (= res!77443 (= (select (arr!2987 (_keys!5169 thiss!1248)) (index!3774 lt!82743)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163698 (=> res!77443 e!107402)))

(declare-fun b!163699 () Bool)

(assert (=> b!163699 (= e!107401 (Intermediate!401 true (toIndex!0 key!828 (mask!8018 thiss!1248)) #b00000000000000000000000000000000))))

(assert (= (and d!51471 c!30138) b!163699))

(assert (= (and d!51471 (not c!30138)) b!163692))

(assert (= (and b!163692 c!30139) b!163697))

(assert (= (and b!163692 (not c!30139)) b!163694))

(assert (= (and d!51471 c!30137) b!163693))

(assert (= (and d!51471 (not c!30137)) b!163696))

(assert (= (and b!163696 res!77442) b!163695))

(assert (= (and b!163695 (not res!77444)) b!163698))

(assert (= (and b!163698 (not res!77443)) b!163691))

(declare-fun m!194237 () Bool)

(assert (=> b!163695 m!194237))

(assert (=> b!163691 m!194237))

(assert (=> d!51471 m!194209))

(declare-fun m!194239 () Bool)

(assert (=> d!51471 m!194239))

(assert (=> d!51471 m!194191))

(assert (=> b!163698 m!194237))

(assert (=> b!163694 m!194209))

(declare-fun m!194241 () Bool)

(assert (=> b!163694 m!194241))

(assert (=> b!163694 m!194241))

(declare-fun m!194243 () Bool)

(assert (=> b!163694 m!194243))

(assert (=> d!51463 d!51471))

(declare-fun d!51473 () Bool)

(declare-fun lt!82750 () (_ BitVec 32))

(declare-fun lt!82749 () (_ BitVec 32))

(assert (=> d!51473 (= lt!82750 (bvmul (bvxor lt!82749 (bvlshr lt!82749 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51473 (= lt!82749 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51473 (and (bvsge (mask!8018 thiss!1248) #b00000000000000000000000000000000) (let ((res!77445 (let ((h!2605 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18150 (bvmul (bvxor h!2605 (bvlshr h!2605 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18150 (bvlshr x!18150 #b00000000000000000000000000001101)) (mask!8018 thiss!1248)))))) (and (bvslt res!77445 (bvadd (mask!8018 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77445 #b00000000000000000000000000000000))))))

(assert (=> d!51473 (= (toIndex!0 key!828 (mask!8018 thiss!1248)) (bvand (bvxor lt!82750 (bvlshr lt!82750 #b00000000000000000000000000001101)) (mask!8018 thiss!1248)))))

(assert (=> d!51463 d!51473))

(assert (=> d!51463 d!51467))

(declare-fun b!163710 () Bool)

(declare-fun res!77457 () Bool)

(declare-fun e!107406 () Bool)

(assert (=> b!163710 (=> (not res!77457) (not e!107406))))

(declare-fun size!3278 (LongMapFixedSize!1824) (_ BitVec 32))

(assert (=> b!163710 (= res!77457 (= (size!3278 thiss!1248) (bvadd (_size!961 thiss!1248) (bvsdiv (bvadd (extraKeys!3095 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!163708 () Bool)

(declare-fun res!77456 () Bool)

(assert (=> b!163708 (=> (not res!77456) (not e!107406))))

(assert (=> b!163708 (= res!77456 (and (= (size!3275 (_values!3337 thiss!1248)) (bvadd (mask!8018 thiss!1248) #b00000000000000000000000000000001)) (= (size!3274 (_keys!5169 thiss!1248)) (size!3275 (_values!3337 thiss!1248))) (bvsge (_size!961 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!961 thiss!1248) (bvadd (mask!8018 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!163709 () Bool)

(declare-fun res!77454 () Bool)

(assert (=> b!163709 (=> (not res!77454) (not e!107406))))

(assert (=> b!163709 (= res!77454 (bvsge (size!3278 thiss!1248) (_size!961 thiss!1248)))))

(declare-fun b!163711 () Bool)

(assert (=> b!163711 (= e!107406 (and (bvsge (extraKeys!3095 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3095 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!961 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!51475 () Bool)

(declare-fun res!77455 () Bool)

(assert (=> d!51475 (=> (not res!77455) (not e!107406))))

(assert (=> d!51475 (= res!77455 (validMask!0 (mask!8018 thiss!1248)))))

(assert (=> d!51475 (= (simpleValid!123 thiss!1248) e!107406)))

(assert (= (and d!51475 res!77455) b!163708))

(assert (= (and b!163708 res!77456) b!163709))

(assert (= (and b!163709 res!77454) b!163710))

(assert (= (and b!163710 res!77457) b!163711))

(declare-fun m!194245 () Bool)

(assert (=> b!163710 m!194245))

(assert (=> b!163709 m!194245))

(assert (=> d!51475 m!194191))

(assert (=> d!51465 d!51475))

(declare-fun bm!17311 () Bool)

(declare-fun call!17314 () (_ BitVec 32))

(assert (=> bm!17311 (= call!17314 (arrayCountValidKeys!0 (_keys!5169 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3274 (_keys!5169 thiss!1248))))))

(declare-fun b!163720 () Bool)

(declare-fun e!107412 () (_ BitVec 32))

(assert (=> b!163720 (= e!107412 call!17314)))

(declare-fun b!163721 () Bool)

(assert (=> b!163721 (= e!107412 (bvadd #b00000000000000000000000000000001 call!17314))))

(declare-fun b!163722 () Bool)

(declare-fun e!107411 () (_ BitVec 32))

(assert (=> b!163722 (= e!107411 e!107412)))

(declare-fun c!30145 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163722 (= c!30145 (validKeyInArray!0 (select (arr!2987 (_keys!5169 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51477 () Bool)

(declare-fun lt!82753 () (_ BitVec 32))

(assert (=> d!51477 (and (bvsge lt!82753 #b00000000000000000000000000000000) (bvsle lt!82753 (bvsub (size!3274 (_keys!5169 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51477 (= lt!82753 e!107411)))

(declare-fun c!30144 () Bool)

(assert (=> d!51477 (= c!30144 (bvsge #b00000000000000000000000000000000 (size!3274 (_keys!5169 thiss!1248))))))

(assert (=> d!51477 (and (bvsle #b00000000000000000000000000000000 (size!3274 (_keys!5169 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3274 (_keys!5169 thiss!1248)) (size!3274 (_keys!5169 thiss!1248))))))

(assert (=> d!51477 (= (arrayCountValidKeys!0 (_keys!5169 thiss!1248) #b00000000000000000000000000000000 (size!3274 (_keys!5169 thiss!1248))) lt!82753)))

(declare-fun b!163723 () Bool)

(assert (=> b!163723 (= e!107411 #b00000000000000000000000000000000)))

(assert (= (and d!51477 c!30144) b!163723))

(assert (= (and d!51477 (not c!30144)) b!163722))

(assert (= (and b!163722 c!30145) b!163721))

(assert (= (and b!163722 (not c!30145)) b!163720))

(assert (= (or b!163721 b!163720) bm!17311))

(declare-fun m!194247 () Bool)

(assert (=> bm!17311 m!194247))

(declare-fun m!194249 () Bool)

(assert (=> b!163722 m!194249))

(assert (=> b!163722 m!194249))

(declare-fun m!194251 () Bool)

(assert (=> b!163722 m!194251))

(assert (=> b!163644 d!51477))

(declare-fun b!163732 () Bool)

(declare-fun e!107421 () Bool)

(declare-fun call!17317 () Bool)

(assert (=> b!163732 (= e!107421 call!17317)))

(declare-fun b!163733 () Bool)

(declare-fun e!107420 () Bool)

(assert (=> b!163733 (= e!107420 e!107421)))

(declare-fun lt!82761 () (_ BitVec 64))

(assert (=> b!163733 (= lt!82761 (select (arr!2987 (_keys!5169 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5041 0))(
  ( (Unit!5042) )
))
(declare-fun lt!82762 () Unit!5041)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6295 (_ BitVec 64) (_ BitVec 32)) Unit!5041)

(assert (=> b!163733 (= lt!82762 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5169 thiss!1248) lt!82761 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163733 (arrayContainsKey!0 (_keys!5169 thiss!1248) lt!82761 #b00000000000000000000000000000000)))

(declare-fun lt!82760 () Unit!5041)

(assert (=> b!163733 (= lt!82760 lt!82762)))

(declare-fun res!77463 () Bool)

(assert (=> b!163733 (= res!77463 (= (seekEntryOrOpen!0 (select (arr!2987 (_keys!5169 thiss!1248)) #b00000000000000000000000000000000) (_keys!5169 thiss!1248) (mask!8018 thiss!1248)) (Found!401 #b00000000000000000000000000000000)))))

(assert (=> b!163733 (=> (not res!77463) (not e!107421))))

(declare-fun b!163734 () Bool)

(assert (=> b!163734 (= e!107420 call!17317)))

(declare-fun bm!17314 () Bool)

(assert (=> bm!17314 (= call!17317 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5169 thiss!1248) (mask!8018 thiss!1248)))))

(declare-fun d!51479 () Bool)

(declare-fun res!77462 () Bool)

(declare-fun e!107419 () Bool)

(assert (=> d!51479 (=> res!77462 e!107419)))

(assert (=> d!51479 (= res!77462 (bvsge #b00000000000000000000000000000000 (size!3274 (_keys!5169 thiss!1248))))))

(assert (=> d!51479 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5169 thiss!1248) (mask!8018 thiss!1248)) e!107419)))

(declare-fun b!163735 () Bool)

(assert (=> b!163735 (= e!107419 e!107420)))

(declare-fun c!30148 () Bool)

(assert (=> b!163735 (= c!30148 (validKeyInArray!0 (select (arr!2987 (_keys!5169 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51479 (not res!77462)) b!163735))

(assert (= (and b!163735 c!30148) b!163733))

(assert (= (and b!163735 (not c!30148)) b!163734))

(assert (= (and b!163733 res!77463) b!163732))

(assert (= (or b!163732 b!163734) bm!17314))

(assert (=> b!163733 m!194249))

(declare-fun m!194253 () Bool)

(assert (=> b!163733 m!194253))

(declare-fun m!194255 () Bool)

(assert (=> b!163733 m!194255))

(assert (=> b!163733 m!194249))

(declare-fun m!194257 () Bool)

(assert (=> b!163733 m!194257))

(declare-fun m!194259 () Bool)

(assert (=> bm!17314 m!194259))

(assert (=> b!163735 m!194249))

(assert (=> b!163735 m!194249))

(assert (=> b!163735 m!194251))

(assert (=> b!163645 d!51479))

(declare-fun b!163746 () Bool)

(declare-fun e!107433 () Bool)

(declare-fun e!107432 () Bool)

(assert (=> b!163746 (= e!107433 e!107432)))

(declare-fun c!30151 () Bool)

(assert (=> b!163746 (= c!30151 (validKeyInArray!0 (select (arr!2987 (_keys!5169 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!51481 () Bool)

(declare-fun res!77471 () Bool)

(declare-fun e!107430 () Bool)

(assert (=> d!51481 (=> res!77471 e!107430)))

(assert (=> d!51481 (= res!77471 (bvsge #b00000000000000000000000000000000 (size!3274 (_keys!5169 thiss!1248))))))

(assert (=> d!51481 (= (arrayNoDuplicates!0 (_keys!5169 thiss!1248) #b00000000000000000000000000000000 Nil!1989) e!107430)))

(declare-fun b!163747 () Bool)

(declare-fun call!17320 () Bool)

(assert (=> b!163747 (= e!107432 call!17320)))

(declare-fun b!163748 () Bool)

(assert (=> b!163748 (= e!107432 call!17320)))

(declare-fun b!163749 () Bool)

(declare-fun e!107431 () Bool)

(declare-fun contains!1039 (List!1992 (_ BitVec 64)) Bool)

(assert (=> b!163749 (= e!107431 (contains!1039 Nil!1989 (select (arr!2987 (_keys!5169 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17317 () Bool)

(assert (=> bm!17317 (= call!17320 (arrayNoDuplicates!0 (_keys!5169 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30151 (Cons!1988 (select (arr!2987 (_keys!5169 thiss!1248)) #b00000000000000000000000000000000) Nil!1989) Nil!1989)))))

(declare-fun b!163750 () Bool)

(assert (=> b!163750 (= e!107430 e!107433)))

(declare-fun res!77470 () Bool)

(assert (=> b!163750 (=> (not res!77470) (not e!107433))))

(assert (=> b!163750 (= res!77470 (not e!107431))))

(declare-fun res!77472 () Bool)

(assert (=> b!163750 (=> (not res!77472) (not e!107431))))

(assert (=> b!163750 (= res!77472 (validKeyInArray!0 (select (arr!2987 (_keys!5169 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51481 (not res!77471)) b!163750))

(assert (= (and b!163750 res!77472) b!163749))

(assert (= (and b!163750 res!77470) b!163746))

(assert (= (and b!163746 c!30151) b!163748))

(assert (= (and b!163746 (not c!30151)) b!163747))

(assert (= (or b!163748 b!163747) bm!17317))

(assert (=> b!163746 m!194249))

(assert (=> b!163746 m!194249))

(assert (=> b!163746 m!194251))

(assert (=> b!163749 m!194249))

(assert (=> b!163749 m!194249))

(declare-fun m!194261 () Bool)

(assert (=> b!163749 m!194261))

(assert (=> bm!17317 m!194249))

(declare-fun m!194263 () Bool)

(assert (=> bm!17317 m!194263))

(assert (=> b!163750 m!194249))

(assert (=> b!163750 m!194249))

(assert (=> b!163750 m!194251))

(assert (=> b!163646 d!51481))

(declare-fun condMapEmpty!6117 () Bool)

(declare-fun mapDefault!6117 () ValueCell!1458)

(assert (=> mapNonEmpty!6116 (= condMapEmpty!6117 (= mapRest!6116 ((as const (Array (_ BitVec 32) ValueCell!1458)) mapDefault!6117)))))

(declare-fun e!107434 () Bool)

(declare-fun mapRes!6117 () Bool)

(assert (=> mapNonEmpty!6116 (= tp!14000 (and e!107434 mapRes!6117))))

(declare-fun b!163752 () Bool)

(assert (=> b!163752 (= e!107434 tp_is_empty!3603)))

(declare-fun mapIsEmpty!6117 () Bool)

(assert (=> mapIsEmpty!6117 mapRes!6117))

(declare-fun mapNonEmpty!6117 () Bool)

(declare-fun tp!14001 () Bool)

(declare-fun e!107435 () Bool)

(assert (=> mapNonEmpty!6117 (= mapRes!6117 (and tp!14001 e!107435))))

(declare-fun mapValue!6117 () ValueCell!1458)

(declare-fun mapRest!6117 () (Array (_ BitVec 32) ValueCell!1458))

(declare-fun mapKey!6117 () (_ BitVec 32))

(assert (=> mapNonEmpty!6117 (= mapRest!6116 (store mapRest!6117 mapKey!6117 mapValue!6117))))

(declare-fun b!163751 () Bool)

(assert (=> b!163751 (= e!107435 tp_is_empty!3603)))

(assert (= (and mapNonEmpty!6116 condMapEmpty!6117) mapIsEmpty!6117))

(assert (= (and mapNonEmpty!6116 (not condMapEmpty!6117)) mapNonEmpty!6117))

(assert (= (and mapNonEmpty!6117 ((_ is ValueCellFull!1458) mapValue!6117)) b!163751))

(assert (= (and mapNonEmpty!6116 ((_ is ValueCellFull!1458) mapDefault!6117)) b!163752))

(declare-fun m!194265 () Bool)

(assert (=> mapNonEmpty!6117 m!194265))

(check-sat (not d!51475) (not b!163746) (not b_next!3801) (not d!51471) tp_is_empty!3603 b_and!10215 (not b!163722) (not b!163710) (not b!163709) (not b!163750) (not d!51469) (not bm!17311) (not b!163672) (not bm!17317) (not bm!17314) (not b!163735) (not b!163694) (not mapNonEmpty!6117) (not b!163733) (not b!163749))
(check-sat b_and!10215 (not b_next!3801))
