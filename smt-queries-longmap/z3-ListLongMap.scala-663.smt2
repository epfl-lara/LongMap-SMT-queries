; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16386 () Bool)

(assert start!16386)

(declare-fun b!163281 () Bool)

(declare-fun b_free!3789 () Bool)

(declare-fun b_next!3789 () Bool)

(assert (=> b!163281 (= b_free!3789 (not b_next!3789))))

(declare-fun tp!13947 () Bool)

(declare-fun b_and!10203 () Bool)

(assert (=> b!163281 (= tp!13947 b_and!10203)))

(declare-fun res!77286 () Bool)

(declare-fun e!107121 () Bool)

(assert (=> start!16386 (=> (not res!77286) (not e!107121))))

(declare-datatypes ((V!4435 0))(
  ( (V!4436 (val!1840 Int)) )
))
(declare-datatypes ((ValueCell!1452 0))(
  ( (ValueCellFull!1452 (v!3705 V!4435)) (EmptyCell!1452) )
))
(declare-datatypes ((array!6267 0))(
  ( (array!6268 (arr!2975 (Array (_ BitVec 32) (_ BitVec 64))) (size!3261 (_ BitVec 32))) )
))
(declare-datatypes ((array!6269 0))(
  ( (array!6270 (arr!2976 (Array (_ BitVec 32) ValueCell!1452)) (size!3262 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1812 0))(
  ( (LongMapFixedSize!1813 (defaultEntry!3348 Int) (mask!8000 (_ BitVec 32)) (extraKeys!3089 (_ BitVec 32)) (zeroValue!3191 V!4435) (minValue!3191 V!4435) (_size!955 (_ BitVec 32)) (_keys!5158 array!6267) (_values!3331 array!6269) (_vacant!955 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1812)

(declare-fun valid!813 (LongMapFixedSize!1812) Bool)

(assert (=> start!16386 (= res!77286 (valid!813 thiss!1248))))

(assert (=> start!16386 e!107121))

(declare-fun e!107120 () Bool)

(assert (=> start!16386 e!107120))

(assert (=> start!16386 true))

(declare-fun b!163276 () Bool)

(declare-fun res!77287 () Bool)

(declare-fun e!107118 () Bool)

(assert (=> b!163276 (=> (not res!77287) (not e!107118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163276 (= res!77287 (validMask!0 (mask!8000 thiss!1248)))))

(declare-fun b!163277 () Bool)

(declare-fun e!107117 () Bool)

(declare-fun e!107119 () Bool)

(declare-fun mapRes!6085 () Bool)

(assert (=> b!163277 (= e!107117 (and e!107119 mapRes!6085))))

(declare-fun condMapEmpty!6085 () Bool)

(declare-fun mapDefault!6085 () ValueCell!1452)

(assert (=> b!163277 (= condMapEmpty!6085 (= (arr!2976 (_values!3331 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1452)) mapDefault!6085)))))

(declare-fun b!163278 () Bool)

(assert (=> b!163278 (= e!107118 (and (= (size!3262 (_values!3331 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8000 thiss!1248))) (= (size!3261 (_keys!5158 thiss!1248)) (size!3262 (_values!3331 thiss!1248))) (bvslt (mask!8000 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!163279 () Bool)

(declare-fun res!77284 () Bool)

(assert (=> b!163279 (=> (not res!77284) (not e!107121))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!163279 (= res!77284 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6085 () Bool)

(declare-fun tp!13948 () Bool)

(declare-fun e!107122 () Bool)

(assert (=> mapNonEmpty!6085 (= mapRes!6085 (and tp!13948 e!107122))))

(declare-fun mapValue!6085 () ValueCell!1452)

(declare-fun mapKey!6085 () (_ BitVec 32))

(declare-fun mapRest!6085 () (Array (_ BitVec 32) ValueCell!1452))

(assert (=> mapNonEmpty!6085 (= (arr!2976 (_values!3331 thiss!1248)) (store mapRest!6085 mapKey!6085 mapValue!6085))))

(declare-fun b!163280 () Bool)

(assert (=> b!163280 (= e!107121 e!107118)))

(declare-fun res!77285 () Bool)

(assert (=> b!163280 (=> (not res!77285) (not e!107118))))

(declare-datatypes ((SeekEntryResult!397 0))(
  ( (MissingZero!397 (index!3756 (_ BitVec 32))) (Found!397 (index!3757 (_ BitVec 32))) (Intermediate!397 (undefined!1209 Bool) (index!3758 (_ BitVec 32)) (x!18087 (_ BitVec 32))) (Undefined!397) (MissingVacant!397 (index!3759 (_ BitVec 32))) )
))
(declare-fun lt!82654 () SeekEntryResult!397)

(get-info :version)

(assert (=> b!163280 (= res!77285 (and (not ((_ is Undefined!397) lt!82654)) (not ((_ is MissingVacant!397) lt!82654)) (not ((_ is MissingZero!397) lt!82654)) ((_ is Found!397) lt!82654)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6267 (_ BitVec 32)) SeekEntryResult!397)

(assert (=> b!163280 (= lt!82654 (seekEntryOrOpen!0 key!828 (_keys!5158 thiss!1248) (mask!8000 thiss!1248)))))

(declare-fun tp_is_empty!3591 () Bool)

(declare-fun array_inv!1903 (array!6267) Bool)

(declare-fun array_inv!1904 (array!6269) Bool)

(assert (=> b!163281 (= e!107120 (and tp!13947 tp_is_empty!3591 (array_inv!1903 (_keys!5158 thiss!1248)) (array_inv!1904 (_values!3331 thiss!1248)) e!107117))))

(declare-fun b!163282 () Bool)

(assert (=> b!163282 (= e!107122 tp_is_empty!3591)))

(declare-fun mapIsEmpty!6085 () Bool)

(assert (=> mapIsEmpty!6085 mapRes!6085))

(declare-fun b!163283 () Bool)

(assert (=> b!163283 (= e!107119 tp_is_empty!3591)))

(assert (= (and start!16386 res!77286) b!163279))

(assert (= (and b!163279 res!77284) b!163280))

(assert (= (and b!163280 res!77285) b!163276))

(assert (= (and b!163276 res!77287) b!163278))

(assert (= (and b!163277 condMapEmpty!6085) mapIsEmpty!6085))

(assert (= (and b!163277 (not condMapEmpty!6085)) mapNonEmpty!6085))

(assert (= (and mapNonEmpty!6085 ((_ is ValueCellFull!1452) mapValue!6085)) b!163282))

(assert (= (and b!163277 ((_ is ValueCellFull!1452) mapDefault!6085)) b!163283))

(assert (= b!163281 b!163277))

(assert (= start!16386 b!163281))

(declare-fun m!194023 () Bool)

(assert (=> b!163280 m!194023))

(declare-fun m!194025 () Bool)

(assert (=> start!16386 m!194025))

(declare-fun m!194027 () Bool)

(assert (=> b!163281 m!194027))

(declare-fun m!194029 () Bool)

(assert (=> b!163281 m!194029))

(declare-fun m!194031 () Bool)

(assert (=> mapNonEmpty!6085 m!194031))

(declare-fun m!194033 () Bool)

(assert (=> b!163276 m!194033))

(check-sat (not b!163276) (not b_next!3789) (not b!163280) (not start!16386) (not b!163281) b_and!10203 tp_is_empty!3591 (not mapNonEmpty!6085))
(check-sat b_and!10203 (not b_next!3789))
(get-model)

(declare-fun d!51421 () Bool)

(declare-fun res!77306 () Bool)

(declare-fun e!107146 () Bool)

(assert (=> d!51421 (=> (not res!77306) (not e!107146))))

(declare-fun simpleValid!121 (LongMapFixedSize!1812) Bool)

(assert (=> d!51421 (= res!77306 (simpleValid!121 thiss!1248))))

(assert (=> d!51421 (= (valid!813 thiss!1248) e!107146)))

(declare-fun b!163314 () Bool)

(declare-fun res!77307 () Bool)

(assert (=> b!163314 (=> (not res!77307) (not e!107146))))

(declare-fun arrayCountValidKeys!0 (array!6267 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163314 (= res!77307 (= (arrayCountValidKeys!0 (_keys!5158 thiss!1248) #b00000000000000000000000000000000 (size!3261 (_keys!5158 thiss!1248))) (_size!955 thiss!1248)))))

(declare-fun b!163315 () Bool)

(declare-fun res!77308 () Bool)

(assert (=> b!163315 (=> (not res!77308) (not e!107146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6267 (_ BitVec 32)) Bool)

(assert (=> b!163315 (= res!77308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5158 thiss!1248) (mask!8000 thiss!1248)))))

(declare-fun b!163316 () Bool)

(declare-datatypes ((List!1990 0))(
  ( (Nil!1987) (Cons!1986 (h!2601 (_ BitVec 64)) (t!6792 List!1990)) )
))
(declare-fun arrayNoDuplicates!0 (array!6267 (_ BitVec 32) List!1990) Bool)

(assert (=> b!163316 (= e!107146 (arrayNoDuplicates!0 (_keys!5158 thiss!1248) #b00000000000000000000000000000000 Nil!1987))))

(assert (= (and d!51421 res!77306) b!163314))

(assert (= (and b!163314 res!77307) b!163315))

(assert (= (and b!163315 res!77308) b!163316))

(declare-fun m!194047 () Bool)

(assert (=> d!51421 m!194047))

(declare-fun m!194049 () Bool)

(assert (=> b!163314 m!194049))

(declare-fun m!194051 () Bool)

(assert (=> b!163315 m!194051))

(declare-fun m!194053 () Bool)

(assert (=> b!163316 m!194053))

(assert (=> start!16386 d!51421))

(declare-fun b!163329 () Bool)

(declare-fun e!107153 () SeekEntryResult!397)

(declare-fun lt!82664 () SeekEntryResult!397)

(assert (=> b!163329 (= e!107153 (MissingZero!397 (index!3758 lt!82664)))))

(declare-fun b!163330 () Bool)

(declare-fun e!107155 () SeekEntryResult!397)

(assert (=> b!163330 (= e!107155 Undefined!397)))

(declare-fun b!163331 () Bool)

(declare-fun c!30073 () Bool)

(declare-fun lt!82665 () (_ BitVec 64))

(assert (=> b!163331 (= c!30073 (= lt!82665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107154 () SeekEntryResult!397)

(assert (=> b!163331 (= e!107154 e!107153)))

(declare-fun b!163332 () Bool)

(assert (=> b!163332 (= e!107155 e!107154)))

(assert (=> b!163332 (= lt!82665 (select (arr!2975 (_keys!5158 thiss!1248)) (index!3758 lt!82664)))))

(declare-fun c!30071 () Bool)

(assert (=> b!163332 (= c!30071 (= lt!82665 key!828))))

(declare-fun b!163333 () Bool)

(assert (=> b!163333 (= e!107154 (Found!397 (index!3758 lt!82664)))))

(declare-fun b!163334 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6267 (_ BitVec 32)) SeekEntryResult!397)

(assert (=> b!163334 (= e!107153 (seekKeyOrZeroReturnVacant!0 (x!18087 lt!82664) (index!3758 lt!82664) (index!3758 lt!82664) key!828 (_keys!5158 thiss!1248) (mask!8000 thiss!1248)))))

(declare-fun d!51423 () Bool)

(declare-fun lt!82666 () SeekEntryResult!397)

(assert (=> d!51423 (and (or ((_ is Undefined!397) lt!82666) (not ((_ is Found!397) lt!82666)) (and (bvsge (index!3757 lt!82666) #b00000000000000000000000000000000) (bvslt (index!3757 lt!82666) (size!3261 (_keys!5158 thiss!1248))))) (or ((_ is Undefined!397) lt!82666) ((_ is Found!397) lt!82666) (not ((_ is MissingZero!397) lt!82666)) (and (bvsge (index!3756 lt!82666) #b00000000000000000000000000000000) (bvslt (index!3756 lt!82666) (size!3261 (_keys!5158 thiss!1248))))) (or ((_ is Undefined!397) lt!82666) ((_ is Found!397) lt!82666) ((_ is MissingZero!397) lt!82666) (not ((_ is MissingVacant!397) lt!82666)) (and (bvsge (index!3759 lt!82666) #b00000000000000000000000000000000) (bvslt (index!3759 lt!82666) (size!3261 (_keys!5158 thiss!1248))))) (or ((_ is Undefined!397) lt!82666) (ite ((_ is Found!397) lt!82666) (= (select (arr!2975 (_keys!5158 thiss!1248)) (index!3757 lt!82666)) key!828) (ite ((_ is MissingZero!397) lt!82666) (= (select (arr!2975 (_keys!5158 thiss!1248)) (index!3756 lt!82666)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!397) lt!82666) (= (select (arr!2975 (_keys!5158 thiss!1248)) (index!3759 lt!82666)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51423 (= lt!82666 e!107155)))

(declare-fun c!30072 () Bool)

(assert (=> d!51423 (= c!30072 (and ((_ is Intermediate!397) lt!82664) (undefined!1209 lt!82664)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6267 (_ BitVec 32)) SeekEntryResult!397)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51423 (= lt!82664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8000 thiss!1248)) key!828 (_keys!5158 thiss!1248) (mask!8000 thiss!1248)))))

(assert (=> d!51423 (validMask!0 (mask!8000 thiss!1248))))

(assert (=> d!51423 (= (seekEntryOrOpen!0 key!828 (_keys!5158 thiss!1248) (mask!8000 thiss!1248)) lt!82666)))

(assert (= (and d!51423 c!30072) b!163330))

(assert (= (and d!51423 (not c!30072)) b!163332))

(assert (= (and b!163332 c!30071) b!163333))

(assert (= (and b!163332 (not c!30071)) b!163331))

(assert (= (and b!163331 c!30073) b!163329))

(assert (= (and b!163331 (not c!30073)) b!163334))

(declare-fun m!194055 () Bool)

(assert (=> b!163332 m!194055))

(declare-fun m!194057 () Bool)

(assert (=> b!163334 m!194057))

(declare-fun m!194059 () Bool)

(assert (=> d!51423 m!194059))

(declare-fun m!194061 () Bool)

(assert (=> d!51423 m!194061))

(declare-fun m!194063 () Bool)

(assert (=> d!51423 m!194063))

(declare-fun m!194065 () Bool)

(assert (=> d!51423 m!194065))

(assert (=> d!51423 m!194033))

(assert (=> d!51423 m!194065))

(declare-fun m!194067 () Bool)

(assert (=> d!51423 m!194067))

(assert (=> b!163280 d!51423))

(declare-fun d!51425 () Bool)

(assert (=> d!51425 (= (array_inv!1903 (_keys!5158 thiss!1248)) (bvsge (size!3261 (_keys!5158 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163281 d!51425))

(declare-fun d!51427 () Bool)

(assert (=> d!51427 (= (array_inv!1904 (_values!3331 thiss!1248)) (bvsge (size!3262 (_values!3331 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163281 d!51427))

(declare-fun d!51429 () Bool)

(assert (=> d!51429 (= (validMask!0 (mask!8000 thiss!1248)) (and (or (= (mask!8000 thiss!1248) #b00000000000000000000000000000111) (= (mask!8000 thiss!1248) #b00000000000000000000000000001111) (= (mask!8000 thiss!1248) #b00000000000000000000000000011111) (= (mask!8000 thiss!1248) #b00000000000000000000000000111111) (= (mask!8000 thiss!1248) #b00000000000000000000000001111111) (= (mask!8000 thiss!1248) #b00000000000000000000000011111111) (= (mask!8000 thiss!1248) #b00000000000000000000000111111111) (= (mask!8000 thiss!1248) #b00000000000000000000001111111111) (= (mask!8000 thiss!1248) #b00000000000000000000011111111111) (= (mask!8000 thiss!1248) #b00000000000000000000111111111111) (= (mask!8000 thiss!1248) #b00000000000000000001111111111111) (= (mask!8000 thiss!1248) #b00000000000000000011111111111111) (= (mask!8000 thiss!1248) #b00000000000000000111111111111111) (= (mask!8000 thiss!1248) #b00000000000000001111111111111111) (= (mask!8000 thiss!1248) #b00000000000000011111111111111111) (= (mask!8000 thiss!1248) #b00000000000000111111111111111111) (= (mask!8000 thiss!1248) #b00000000000001111111111111111111) (= (mask!8000 thiss!1248) #b00000000000011111111111111111111) (= (mask!8000 thiss!1248) #b00000000000111111111111111111111) (= (mask!8000 thiss!1248) #b00000000001111111111111111111111) (= (mask!8000 thiss!1248) #b00000000011111111111111111111111) (= (mask!8000 thiss!1248) #b00000000111111111111111111111111) (= (mask!8000 thiss!1248) #b00000001111111111111111111111111) (= (mask!8000 thiss!1248) #b00000011111111111111111111111111) (= (mask!8000 thiss!1248) #b00000111111111111111111111111111) (= (mask!8000 thiss!1248) #b00001111111111111111111111111111) (= (mask!8000 thiss!1248) #b00011111111111111111111111111111) (= (mask!8000 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8000 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163276 d!51429))

(declare-fun b!163342 () Bool)

(declare-fun e!107160 () Bool)

(assert (=> b!163342 (= e!107160 tp_is_empty!3591)))

(declare-fun mapIsEmpty!6091 () Bool)

(declare-fun mapRes!6091 () Bool)

(assert (=> mapIsEmpty!6091 mapRes!6091))

(declare-fun condMapEmpty!6091 () Bool)

(declare-fun mapDefault!6091 () ValueCell!1452)

(assert (=> mapNonEmpty!6085 (= condMapEmpty!6091 (= mapRest!6085 ((as const (Array (_ BitVec 32) ValueCell!1452)) mapDefault!6091)))))

(assert (=> mapNonEmpty!6085 (= tp!13948 (and e!107160 mapRes!6091))))

(declare-fun mapNonEmpty!6091 () Bool)

(declare-fun tp!13957 () Bool)

(declare-fun e!107161 () Bool)

(assert (=> mapNonEmpty!6091 (= mapRes!6091 (and tp!13957 e!107161))))

(declare-fun mapRest!6091 () (Array (_ BitVec 32) ValueCell!1452))

(declare-fun mapValue!6091 () ValueCell!1452)

(declare-fun mapKey!6091 () (_ BitVec 32))

(assert (=> mapNonEmpty!6091 (= mapRest!6085 (store mapRest!6091 mapKey!6091 mapValue!6091))))

(declare-fun b!163341 () Bool)

(assert (=> b!163341 (= e!107161 tp_is_empty!3591)))

(assert (= (and mapNonEmpty!6085 condMapEmpty!6091) mapIsEmpty!6091))

(assert (= (and mapNonEmpty!6085 (not condMapEmpty!6091)) mapNonEmpty!6091))

(assert (= (and mapNonEmpty!6091 ((_ is ValueCellFull!1452) mapValue!6091)) b!163341))

(assert (= (and mapNonEmpty!6085 ((_ is ValueCellFull!1452) mapDefault!6091)) b!163342))

(declare-fun m!194069 () Bool)

(assert (=> mapNonEmpty!6091 m!194069))

(check-sat (not b!163315) (not mapNonEmpty!6091) (not d!51421) (not b!163316) (not b!163314) (not b_next!3789) (not b!163334) b_and!10203 (not d!51423) tp_is_empty!3591)
(check-sat b_and!10203 (not b_next!3789))
