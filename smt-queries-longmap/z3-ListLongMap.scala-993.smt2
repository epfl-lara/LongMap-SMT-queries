; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21414 () Bool)

(assert start!21414)

(declare-fun b!215120 () Bool)

(declare-fun b_free!5709 () Bool)

(declare-fun b_next!5709 () Bool)

(assert (=> b!215120 (= b_free!5709 (not b_next!5709))))

(declare-fun tp!20233 () Bool)

(declare-fun b_and!12599 () Bool)

(assert (=> b!215120 (= tp!20233 b_and!12599)))

(declare-fun mapIsEmpty!9491 () Bool)

(declare-fun mapRes!9491 () Bool)

(assert (=> mapIsEmpty!9491 mapRes!9491))

(declare-fun b!215119 () Bool)

(declare-fun e!139936 () Bool)

(declare-fun e!139934 () Bool)

(assert (=> b!215119 (= e!139936 e!139934)))

(declare-fun res!105262 () Bool)

(assert (=> b!215119 (=> (not res!105262) (not e!139934))))

(declare-datatypes ((SeekEntryResult!728 0))(
  ( (MissingZero!728 (index!5082 (_ BitVec 32))) (Found!728 (index!5083 (_ BitVec 32))) (Intermediate!728 (undefined!1540 Bool) (index!5084 (_ BitVec 32)) (x!22460 (_ BitVec 32))) (Undefined!728) (MissingVacant!728 (index!5085 (_ BitVec 32))) )
))
(declare-fun lt!110880 () SeekEntryResult!728)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215119 (= res!105262 (or (= lt!110880 (MissingZero!728 index!297)) (= lt!110880 (MissingVacant!728 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7075 0))(
  ( (V!7076 (val!2830 Int)) )
))
(declare-datatypes ((ValueCell!2442 0))(
  ( (ValueCellFull!2442 (v!4848 V!7075)) (EmptyCell!2442) )
))
(declare-datatypes ((array!10365 0))(
  ( (array!10366 (arr!4912 (Array (_ BitVec 32) ValueCell!2442)) (size!5240 (_ BitVec 32))) )
))
(declare-datatypes ((array!10367 0))(
  ( (array!10368 (arr!4913 (Array (_ BitVec 32) (_ BitVec 64))) (size!5241 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2784 0))(
  ( (LongMapFixedSize!2785 (defaultEntry!4042 Int) (mask!9728 (_ BitVec 32)) (extraKeys!3779 (_ BitVec 32)) (zeroValue!3883 V!7075) (minValue!3883 V!7075) (_size!1441 (_ BitVec 32)) (_keys!6068 array!10367) (_values!4025 array!10365) (_vacant!1441 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2784)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10367 (_ BitVec 32)) SeekEntryResult!728)

(assert (=> b!215119 (= lt!110880 (seekEntryOrOpen!0 key!932 (_keys!6068 thiss!1504) (mask!9728 thiss!1504)))))

(declare-fun tp_is_empty!5571 () Bool)

(declare-fun e!139939 () Bool)

(declare-fun e!139935 () Bool)

(declare-fun array_inv!3253 (array!10367) Bool)

(declare-fun array_inv!3254 (array!10365) Bool)

(assert (=> b!215120 (= e!139939 (and tp!20233 tp_is_empty!5571 (array_inv!3253 (_keys!6068 thiss!1504)) (array_inv!3254 (_values!4025 thiss!1504)) e!139935))))

(declare-fun b!215121 () Bool)

(assert (=> b!215121 (= e!139934 (not (= (size!5240 (_values!4025 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9728 thiss!1504)))))))

(declare-fun b!215122 () Bool)

(declare-fun e!139940 () Bool)

(assert (=> b!215122 (= e!139940 tp_is_empty!5571)))

(declare-fun mapNonEmpty!9491 () Bool)

(declare-fun tp!20234 () Bool)

(declare-fun e!139937 () Bool)

(assert (=> mapNonEmpty!9491 (= mapRes!9491 (and tp!20234 e!139937))))

(declare-fun mapRest!9491 () (Array (_ BitVec 32) ValueCell!2442))

(declare-fun mapValue!9491 () ValueCell!2442)

(declare-fun mapKey!9491 () (_ BitVec 32))

(assert (=> mapNonEmpty!9491 (= (arr!4912 (_values!4025 thiss!1504)) (store mapRest!9491 mapKey!9491 mapValue!9491))))

(declare-fun res!105260 () Bool)

(assert (=> start!21414 (=> (not res!105260) (not e!139936))))

(declare-fun valid!1136 (LongMapFixedSize!2784) Bool)

(assert (=> start!21414 (= res!105260 (valid!1136 thiss!1504))))

(assert (=> start!21414 e!139936))

(assert (=> start!21414 e!139939))

(assert (=> start!21414 true))

(declare-fun b!215123 () Bool)

(declare-fun res!105263 () Bool)

(assert (=> b!215123 (=> (not res!105263) (not e!139934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215123 (= res!105263 (validMask!0 (mask!9728 thiss!1504)))))

(declare-fun b!215124 () Bool)

(assert (=> b!215124 (= e!139935 (and e!139940 mapRes!9491))))

(declare-fun condMapEmpty!9491 () Bool)

(declare-fun mapDefault!9491 () ValueCell!2442)

(assert (=> b!215124 (= condMapEmpty!9491 (= (arr!4912 (_values!4025 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2442)) mapDefault!9491)))))

(declare-fun b!215125 () Bool)

(assert (=> b!215125 (= e!139937 tp_is_empty!5571)))

(declare-fun b!215126 () Bool)

(declare-fun res!105261 () Bool)

(assert (=> b!215126 (=> (not res!105261) (not e!139936))))

(assert (=> b!215126 (= res!105261 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!21414 res!105260) b!215126))

(assert (= (and b!215126 res!105261) b!215119))

(assert (= (and b!215119 res!105262) b!215123))

(assert (= (and b!215123 res!105263) b!215121))

(assert (= (and b!215124 condMapEmpty!9491) mapIsEmpty!9491))

(assert (= (and b!215124 (not condMapEmpty!9491)) mapNonEmpty!9491))

(get-info :version)

(assert (= (and mapNonEmpty!9491 ((_ is ValueCellFull!2442) mapValue!9491)) b!215125))

(assert (= (and b!215124 ((_ is ValueCellFull!2442) mapDefault!9491)) b!215122))

(assert (= b!215120 b!215124))

(assert (= start!21414 b!215120))

(declare-fun m!242485 () Bool)

(assert (=> mapNonEmpty!9491 m!242485))

(declare-fun m!242487 () Bool)

(assert (=> b!215120 m!242487))

(declare-fun m!242489 () Bool)

(assert (=> b!215120 m!242489))

(declare-fun m!242491 () Bool)

(assert (=> start!21414 m!242491))

(declare-fun m!242493 () Bool)

(assert (=> b!215119 m!242493))

(declare-fun m!242495 () Bool)

(assert (=> b!215123 m!242495))

(check-sat (not b_next!5709) b_and!12599 (not mapNonEmpty!9491) (not start!21414) (not b!215119) (not b!215120) (not b!215123) tp_is_empty!5571)
(check-sat b_and!12599 (not b_next!5709))
(get-model)

(declare-fun d!58395 () Bool)

(declare-fun lt!110892 () SeekEntryResult!728)

(assert (=> d!58395 (and (or ((_ is Undefined!728) lt!110892) (not ((_ is Found!728) lt!110892)) (and (bvsge (index!5083 lt!110892) #b00000000000000000000000000000000) (bvslt (index!5083 lt!110892) (size!5241 (_keys!6068 thiss!1504))))) (or ((_ is Undefined!728) lt!110892) ((_ is Found!728) lt!110892) (not ((_ is MissingZero!728) lt!110892)) (and (bvsge (index!5082 lt!110892) #b00000000000000000000000000000000) (bvslt (index!5082 lt!110892) (size!5241 (_keys!6068 thiss!1504))))) (or ((_ is Undefined!728) lt!110892) ((_ is Found!728) lt!110892) ((_ is MissingZero!728) lt!110892) (not ((_ is MissingVacant!728) lt!110892)) (and (bvsge (index!5085 lt!110892) #b00000000000000000000000000000000) (bvslt (index!5085 lt!110892) (size!5241 (_keys!6068 thiss!1504))))) (or ((_ is Undefined!728) lt!110892) (ite ((_ is Found!728) lt!110892) (= (select (arr!4913 (_keys!6068 thiss!1504)) (index!5083 lt!110892)) key!932) (ite ((_ is MissingZero!728) lt!110892) (= (select (arr!4913 (_keys!6068 thiss!1504)) (index!5082 lt!110892)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!728) lt!110892) (= (select (arr!4913 (_keys!6068 thiss!1504)) (index!5085 lt!110892)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!139968 () SeekEntryResult!728)

(assert (=> d!58395 (= lt!110892 e!139968)))

(declare-fun c!36131 () Bool)

(declare-fun lt!110891 () SeekEntryResult!728)

(assert (=> d!58395 (= c!36131 (and ((_ is Intermediate!728) lt!110891) (undefined!1540 lt!110891)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10367 (_ BitVec 32)) SeekEntryResult!728)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58395 (= lt!110891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9728 thiss!1504)) key!932 (_keys!6068 thiss!1504) (mask!9728 thiss!1504)))))

(assert (=> d!58395 (validMask!0 (mask!9728 thiss!1504))))

(assert (=> d!58395 (= (seekEntryOrOpen!0 key!932 (_keys!6068 thiss!1504) (mask!9728 thiss!1504)) lt!110892)))

(declare-fun b!215163 () Bool)

(assert (=> b!215163 (= e!139968 Undefined!728)))

(declare-fun b!215164 () Bool)

(declare-fun e!139970 () SeekEntryResult!728)

(assert (=> b!215164 (= e!139970 (Found!728 (index!5084 lt!110891)))))

(declare-fun b!215165 () Bool)

(declare-fun e!139969 () SeekEntryResult!728)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10367 (_ BitVec 32)) SeekEntryResult!728)

(assert (=> b!215165 (= e!139969 (seekKeyOrZeroReturnVacant!0 (x!22460 lt!110891) (index!5084 lt!110891) (index!5084 lt!110891) key!932 (_keys!6068 thiss!1504) (mask!9728 thiss!1504)))))

(declare-fun b!215166 () Bool)

(assert (=> b!215166 (= e!139968 e!139970)))

(declare-fun lt!110890 () (_ BitVec 64))

(assert (=> b!215166 (= lt!110890 (select (arr!4913 (_keys!6068 thiss!1504)) (index!5084 lt!110891)))))

(declare-fun c!36130 () Bool)

(assert (=> b!215166 (= c!36130 (= lt!110890 key!932))))

(declare-fun b!215167 () Bool)

(declare-fun c!36129 () Bool)

(assert (=> b!215167 (= c!36129 (= lt!110890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215167 (= e!139970 e!139969)))

(declare-fun b!215168 () Bool)

(assert (=> b!215168 (= e!139969 (MissingZero!728 (index!5084 lt!110891)))))

(assert (= (and d!58395 c!36131) b!215163))

(assert (= (and d!58395 (not c!36131)) b!215166))

(assert (= (and b!215166 c!36130) b!215164))

(assert (= (and b!215166 (not c!36130)) b!215167))

(assert (= (and b!215167 c!36129) b!215168))

(assert (= (and b!215167 (not c!36129)) b!215165))

(declare-fun m!242509 () Bool)

(assert (=> d!58395 m!242509))

(assert (=> d!58395 m!242495))

(declare-fun m!242511 () Bool)

(assert (=> d!58395 m!242511))

(declare-fun m!242513 () Bool)

(assert (=> d!58395 m!242513))

(declare-fun m!242515 () Bool)

(assert (=> d!58395 m!242515))

(assert (=> d!58395 m!242515))

(declare-fun m!242517 () Bool)

(assert (=> d!58395 m!242517))

(declare-fun m!242519 () Bool)

(assert (=> b!215165 m!242519))

(declare-fun m!242521 () Bool)

(assert (=> b!215166 m!242521))

(assert (=> b!215119 d!58395))

(declare-fun d!58397 () Bool)

(assert (=> d!58397 (= (validMask!0 (mask!9728 thiss!1504)) (and (or (= (mask!9728 thiss!1504) #b00000000000000000000000000000111) (= (mask!9728 thiss!1504) #b00000000000000000000000000001111) (= (mask!9728 thiss!1504) #b00000000000000000000000000011111) (= (mask!9728 thiss!1504) #b00000000000000000000000000111111) (= (mask!9728 thiss!1504) #b00000000000000000000000001111111) (= (mask!9728 thiss!1504) #b00000000000000000000000011111111) (= (mask!9728 thiss!1504) #b00000000000000000000000111111111) (= (mask!9728 thiss!1504) #b00000000000000000000001111111111) (= (mask!9728 thiss!1504) #b00000000000000000000011111111111) (= (mask!9728 thiss!1504) #b00000000000000000000111111111111) (= (mask!9728 thiss!1504) #b00000000000000000001111111111111) (= (mask!9728 thiss!1504) #b00000000000000000011111111111111) (= (mask!9728 thiss!1504) #b00000000000000000111111111111111) (= (mask!9728 thiss!1504) #b00000000000000001111111111111111) (= (mask!9728 thiss!1504) #b00000000000000011111111111111111) (= (mask!9728 thiss!1504) #b00000000000000111111111111111111) (= (mask!9728 thiss!1504) #b00000000000001111111111111111111) (= (mask!9728 thiss!1504) #b00000000000011111111111111111111) (= (mask!9728 thiss!1504) #b00000000000111111111111111111111) (= (mask!9728 thiss!1504) #b00000000001111111111111111111111) (= (mask!9728 thiss!1504) #b00000000011111111111111111111111) (= (mask!9728 thiss!1504) #b00000000111111111111111111111111) (= (mask!9728 thiss!1504) #b00000001111111111111111111111111) (= (mask!9728 thiss!1504) #b00000011111111111111111111111111) (= (mask!9728 thiss!1504) #b00000111111111111111111111111111) (= (mask!9728 thiss!1504) #b00001111111111111111111111111111) (= (mask!9728 thiss!1504) #b00011111111111111111111111111111) (= (mask!9728 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9728 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215123 d!58397))

(declare-fun d!58399 () Bool)

(declare-fun res!105282 () Bool)

(declare-fun e!139973 () Bool)

(assert (=> d!58399 (=> (not res!105282) (not e!139973))))

(declare-fun simpleValid!216 (LongMapFixedSize!2784) Bool)

(assert (=> d!58399 (= res!105282 (simpleValid!216 thiss!1504))))

(assert (=> d!58399 (= (valid!1136 thiss!1504) e!139973)))

(declare-fun b!215175 () Bool)

(declare-fun res!105283 () Bool)

(assert (=> b!215175 (=> (not res!105283) (not e!139973))))

(declare-fun arrayCountValidKeys!0 (array!10367 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215175 (= res!105283 (= (arrayCountValidKeys!0 (_keys!6068 thiss!1504) #b00000000000000000000000000000000 (size!5241 (_keys!6068 thiss!1504))) (_size!1441 thiss!1504)))))

(declare-fun b!215176 () Bool)

(declare-fun res!105284 () Bool)

(assert (=> b!215176 (=> (not res!105284) (not e!139973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10367 (_ BitVec 32)) Bool)

(assert (=> b!215176 (= res!105284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6068 thiss!1504) (mask!9728 thiss!1504)))))

(declare-fun b!215177 () Bool)

(declare-datatypes ((List!3135 0))(
  ( (Nil!3132) (Cons!3131 (h!3774 (_ BitVec 64)) (t!8090 List!3135)) )
))
(declare-fun arrayNoDuplicates!0 (array!10367 (_ BitVec 32) List!3135) Bool)

(assert (=> b!215177 (= e!139973 (arrayNoDuplicates!0 (_keys!6068 thiss!1504) #b00000000000000000000000000000000 Nil!3132))))

(assert (= (and d!58399 res!105282) b!215175))

(assert (= (and b!215175 res!105283) b!215176))

(assert (= (and b!215176 res!105284) b!215177))

(declare-fun m!242523 () Bool)

(assert (=> d!58399 m!242523))

(declare-fun m!242525 () Bool)

(assert (=> b!215175 m!242525))

(declare-fun m!242527 () Bool)

(assert (=> b!215176 m!242527))

(declare-fun m!242529 () Bool)

(assert (=> b!215177 m!242529))

(assert (=> start!21414 d!58399))

(declare-fun d!58401 () Bool)

(assert (=> d!58401 (= (array_inv!3253 (_keys!6068 thiss!1504)) (bvsge (size!5241 (_keys!6068 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215120 d!58401))

(declare-fun d!58403 () Bool)

(assert (=> d!58403 (= (array_inv!3254 (_values!4025 thiss!1504)) (bvsge (size!5240 (_values!4025 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215120 d!58403))

(declare-fun b!215185 () Bool)

(declare-fun e!139979 () Bool)

(assert (=> b!215185 (= e!139979 tp_is_empty!5571)))

(declare-fun condMapEmpty!9497 () Bool)

(declare-fun mapDefault!9497 () ValueCell!2442)

(assert (=> mapNonEmpty!9491 (= condMapEmpty!9497 (= mapRest!9491 ((as const (Array (_ BitVec 32) ValueCell!2442)) mapDefault!9497)))))

(declare-fun mapRes!9497 () Bool)

(assert (=> mapNonEmpty!9491 (= tp!20234 (and e!139979 mapRes!9497))))

(declare-fun b!215184 () Bool)

(declare-fun e!139978 () Bool)

(assert (=> b!215184 (= e!139978 tp_is_empty!5571)))

(declare-fun mapNonEmpty!9497 () Bool)

(declare-fun tp!20243 () Bool)

(assert (=> mapNonEmpty!9497 (= mapRes!9497 (and tp!20243 e!139978))))

(declare-fun mapKey!9497 () (_ BitVec 32))

(declare-fun mapRest!9497 () (Array (_ BitVec 32) ValueCell!2442))

(declare-fun mapValue!9497 () ValueCell!2442)

(assert (=> mapNonEmpty!9497 (= mapRest!9491 (store mapRest!9497 mapKey!9497 mapValue!9497))))

(declare-fun mapIsEmpty!9497 () Bool)

(assert (=> mapIsEmpty!9497 mapRes!9497))

(assert (= (and mapNonEmpty!9491 condMapEmpty!9497) mapIsEmpty!9497))

(assert (= (and mapNonEmpty!9491 (not condMapEmpty!9497)) mapNonEmpty!9497))

(assert (= (and mapNonEmpty!9497 ((_ is ValueCellFull!2442) mapValue!9497)) b!215184))

(assert (= (and mapNonEmpty!9491 ((_ is ValueCellFull!2442) mapDefault!9497)) b!215185))

(declare-fun m!242531 () Bool)

(assert (=> mapNonEmpty!9497 m!242531))

(check-sat (not b_next!5709) b_and!12599 (not b!215175) (not d!58399) (not b!215177) (not mapNonEmpty!9497) tp_is_empty!5571 (not d!58395) (not b!215165) (not b!215176))
(check-sat b_and!12599 (not b_next!5709))
(get-model)

(declare-fun b!215194 () Bool)

(declare-fun e!139986 () Bool)

(declare-fun e!139987 () Bool)

(assert (=> b!215194 (= e!139986 e!139987)))

(declare-fun lt!110900 () (_ BitVec 64))

(assert (=> b!215194 (= lt!110900 (select (arr!4913 (_keys!6068 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6494 0))(
  ( (Unit!6495) )
))
(declare-fun lt!110901 () Unit!6494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10367 (_ BitVec 64) (_ BitVec 32)) Unit!6494)

(assert (=> b!215194 (= lt!110901 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6068 thiss!1504) lt!110900 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215194 (arrayContainsKey!0 (_keys!6068 thiss!1504) lt!110900 #b00000000000000000000000000000000)))

(declare-fun lt!110899 () Unit!6494)

(assert (=> b!215194 (= lt!110899 lt!110901)))

(declare-fun res!105290 () Bool)

(assert (=> b!215194 (= res!105290 (= (seekEntryOrOpen!0 (select (arr!4913 (_keys!6068 thiss!1504)) #b00000000000000000000000000000000) (_keys!6068 thiss!1504) (mask!9728 thiss!1504)) (Found!728 #b00000000000000000000000000000000)))))

(assert (=> b!215194 (=> (not res!105290) (not e!139987))))

(declare-fun bm!20331 () Bool)

(declare-fun call!20334 () Bool)

(assert (=> bm!20331 (= call!20334 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6068 thiss!1504) (mask!9728 thiss!1504)))))

(declare-fun d!58405 () Bool)

(declare-fun res!105289 () Bool)

(declare-fun e!139988 () Bool)

(assert (=> d!58405 (=> res!105289 e!139988)))

(assert (=> d!58405 (= res!105289 (bvsge #b00000000000000000000000000000000 (size!5241 (_keys!6068 thiss!1504))))))

(assert (=> d!58405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6068 thiss!1504) (mask!9728 thiss!1504)) e!139988)))

(declare-fun b!215195 () Bool)

(assert (=> b!215195 (= e!139987 call!20334)))

(declare-fun b!215196 () Bool)

(assert (=> b!215196 (= e!139986 call!20334)))

(declare-fun b!215197 () Bool)

(assert (=> b!215197 (= e!139988 e!139986)))

(declare-fun c!36134 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215197 (= c!36134 (validKeyInArray!0 (select (arr!4913 (_keys!6068 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58405 (not res!105289)) b!215197))

(assert (= (and b!215197 c!36134) b!215194))

(assert (= (and b!215197 (not c!36134)) b!215196))

(assert (= (and b!215194 res!105290) b!215195))

(assert (= (or b!215195 b!215196) bm!20331))

(declare-fun m!242533 () Bool)

(assert (=> b!215194 m!242533))

(declare-fun m!242535 () Bool)

(assert (=> b!215194 m!242535))

(declare-fun m!242537 () Bool)

(assert (=> b!215194 m!242537))

(assert (=> b!215194 m!242533))

(declare-fun m!242539 () Bool)

(assert (=> b!215194 m!242539))

(declare-fun m!242541 () Bool)

(assert (=> bm!20331 m!242541))

(assert (=> b!215197 m!242533))

(assert (=> b!215197 m!242533))

(declare-fun m!242543 () Bool)

(assert (=> b!215197 m!242543))

(assert (=> b!215176 d!58405))

(declare-fun b!215206 () Bool)

(declare-fun e!139994 () (_ BitVec 32))

(assert (=> b!215206 (= e!139994 #b00000000000000000000000000000000)))

(declare-fun b!215207 () Bool)

(declare-fun e!139993 () (_ BitVec 32))

(assert (=> b!215207 (= e!139994 e!139993)))

(declare-fun c!36140 () Bool)

(assert (=> b!215207 (= c!36140 (validKeyInArray!0 (select (arr!4913 (_keys!6068 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58407 () Bool)

(declare-fun lt!110904 () (_ BitVec 32))

(assert (=> d!58407 (and (bvsge lt!110904 #b00000000000000000000000000000000) (bvsle lt!110904 (bvsub (size!5241 (_keys!6068 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58407 (= lt!110904 e!139994)))

(declare-fun c!36139 () Bool)

(assert (=> d!58407 (= c!36139 (bvsge #b00000000000000000000000000000000 (size!5241 (_keys!6068 thiss!1504))))))

(assert (=> d!58407 (and (bvsle #b00000000000000000000000000000000 (size!5241 (_keys!6068 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5241 (_keys!6068 thiss!1504)) (size!5241 (_keys!6068 thiss!1504))))))

(assert (=> d!58407 (= (arrayCountValidKeys!0 (_keys!6068 thiss!1504) #b00000000000000000000000000000000 (size!5241 (_keys!6068 thiss!1504))) lt!110904)))

(declare-fun b!215208 () Bool)

(declare-fun call!20337 () (_ BitVec 32))

(assert (=> b!215208 (= e!139993 (bvadd #b00000000000000000000000000000001 call!20337))))

(declare-fun b!215209 () Bool)

(assert (=> b!215209 (= e!139993 call!20337)))

(declare-fun bm!20334 () Bool)

(assert (=> bm!20334 (= call!20337 (arrayCountValidKeys!0 (_keys!6068 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5241 (_keys!6068 thiss!1504))))))

(assert (= (and d!58407 c!36139) b!215206))

(assert (= (and d!58407 (not c!36139)) b!215207))

(assert (= (and b!215207 c!36140) b!215208))

(assert (= (and b!215207 (not c!36140)) b!215209))

(assert (= (or b!215208 b!215209) bm!20334))

(assert (=> b!215207 m!242533))

(assert (=> b!215207 m!242533))

(assert (=> b!215207 m!242543))

(declare-fun m!242545 () Bool)

(assert (=> bm!20334 m!242545))

(assert (=> b!215175 d!58407))

(declare-fun b!215228 () Bool)

(declare-fun e!140006 () Bool)

(declare-fun e!140007 () Bool)

(assert (=> b!215228 (= e!140006 e!140007)))

(declare-fun res!105297 () Bool)

(declare-fun lt!110909 () SeekEntryResult!728)

(assert (=> b!215228 (= res!105297 (and ((_ is Intermediate!728) lt!110909) (not (undefined!1540 lt!110909)) (bvslt (x!22460 lt!110909) #b01111111111111111111111111111110) (bvsge (x!22460 lt!110909) #b00000000000000000000000000000000) (bvsge (x!22460 lt!110909) #b00000000000000000000000000000000)))))

(assert (=> b!215228 (=> (not res!105297) (not e!140007))))

(declare-fun d!58409 () Bool)

(assert (=> d!58409 e!140006))

(declare-fun c!36147 () Bool)

(assert (=> d!58409 (= c!36147 (and ((_ is Intermediate!728) lt!110909) (undefined!1540 lt!110909)))))

(declare-fun e!140009 () SeekEntryResult!728)

(assert (=> d!58409 (= lt!110909 e!140009)))

(declare-fun c!36149 () Bool)

(assert (=> d!58409 (= c!36149 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!110910 () (_ BitVec 64))

(assert (=> d!58409 (= lt!110910 (select (arr!4913 (_keys!6068 thiss!1504)) (toIndex!0 key!932 (mask!9728 thiss!1504))))))

(assert (=> d!58409 (validMask!0 (mask!9728 thiss!1504))))

(assert (=> d!58409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9728 thiss!1504)) key!932 (_keys!6068 thiss!1504) (mask!9728 thiss!1504)) lt!110909)))

(declare-fun b!215229 () Bool)

(declare-fun e!140008 () SeekEntryResult!728)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215229 (= e!140008 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9728 thiss!1504)) #b00000000000000000000000000000000 (mask!9728 thiss!1504)) key!932 (_keys!6068 thiss!1504) (mask!9728 thiss!1504)))))

(declare-fun b!215230 () Bool)

(assert (=> b!215230 (= e!140008 (Intermediate!728 false (toIndex!0 key!932 (mask!9728 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215231 () Bool)

(assert (=> b!215231 (and (bvsge (index!5084 lt!110909) #b00000000000000000000000000000000) (bvslt (index!5084 lt!110909) (size!5241 (_keys!6068 thiss!1504))))))

(declare-fun e!140005 () Bool)

(assert (=> b!215231 (= e!140005 (= (select (arr!4913 (_keys!6068 thiss!1504)) (index!5084 lt!110909)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!215232 () Bool)

(assert (=> b!215232 (and (bvsge (index!5084 lt!110909) #b00000000000000000000000000000000) (bvslt (index!5084 lt!110909) (size!5241 (_keys!6068 thiss!1504))))))

(declare-fun res!105299 () Bool)

(assert (=> b!215232 (= res!105299 (= (select (arr!4913 (_keys!6068 thiss!1504)) (index!5084 lt!110909)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215232 (=> res!105299 e!140005)))

(declare-fun b!215233 () Bool)

(assert (=> b!215233 (= e!140009 (Intermediate!728 true (toIndex!0 key!932 (mask!9728 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215234 () Bool)

(assert (=> b!215234 (= e!140009 e!140008)))

(declare-fun c!36148 () Bool)

(assert (=> b!215234 (= c!36148 (or (= lt!110910 key!932) (= (bvadd lt!110910 lt!110910) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215235 () Bool)

(assert (=> b!215235 (= e!140006 (bvsge (x!22460 lt!110909) #b01111111111111111111111111111110))))

(declare-fun b!215236 () Bool)

(assert (=> b!215236 (and (bvsge (index!5084 lt!110909) #b00000000000000000000000000000000) (bvslt (index!5084 lt!110909) (size!5241 (_keys!6068 thiss!1504))))))

(declare-fun res!105298 () Bool)

(assert (=> b!215236 (= res!105298 (= (select (arr!4913 (_keys!6068 thiss!1504)) (index!5084 lt!110909)) key!932))))

(assert (=> b!215236 (=> res!105298 e!140005)))

(assert (=> b!215236 (= e!140007 e!140005)))

(assert (= (and d!58409 c!36149) b!215233))

(assert (= (and d!58409 (not c!36149)) b!215234))

(assert (= (and b!215234 c!36148) b!215230))

(assert (= (and b!215234 (not c!36148)) b!215229))

(assert (= (and d!58409 c!36147) b!215235))

(assert (= (and d!58409 (not c!36147)) b!215228))

(assert (= (and b!215228 res!105297) b!215236))

(assert (= (and b!215236 (not res!105298)) b!215232))

(assert (= (and b!215232 (not res!105299)) b!215231))

(declare-fun m!242547 () Bool)

(assert (=> b!215231 m!242547))

(assert (=> b!215236 m!242547))

(assert (=> b!215232 m!242547))

(assert (=> d!58409 m!242515))

(declare-fun m!242549 () Bool)

(assert (=> d!58409 m!242549))

(assert (=> d!58409 m!242495))

(assert (=> b!215229 m!242515))

(declare-fun m!242551 () Bool)

(assert (=> b!215229 m!242551))

(assert (=> b!215229 m!242551))

(declare-fun m!242553 () Bool)

(assert (=> b!215229 m!242553))

(assert (=> d!58395 d!58409))

(declare-fun d!58411 () Bool)

(declare-fun lt!110916 () (_ BitVec 32))

(declare-fun lt!110915 () (_ BitVec 32))

(assert (=> d!58411 (= lt!110916 (bvmul (bvxor lt!110915 (bvlshr lt!110915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58411 (= lt!110915 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58411 (and (bvsge (mask!9728 thiss!1504) #b00000000000000000000000000000000) (let ((res!105300 (let ((h!3775 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22477 (bvmul (bvxor h!3775 (bvlshr h!3775 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22477 (bvlshr x!22477 #b00000000000000000000000000001101)) (mask!9728 thiss!1504)))))) (and (bvslt res!105300 (bvadd (mask!9728 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105300 #b00000000000000000000000000000000))))))

(assert (=> d!58411 (= (toIndex!0 key!932 (mask!9728 thiss!1504)) (bvand (bvxor lt!110916 (bvlshr lt!110916 #b00000000000000000000000000001101)) (mask!9728 thiss!1504)))))

(assert (=> d!58395 d!58411))

(assert (=> d!58395 d!58397))

(declare-fun b!215249 () Bool)

(declare-fun e!140016 () SeekEntryResult!728)

(assert (=> b!215249 (= e!140016 Undefined!728)))

(declare-fun b!215250 () Bool)

(declare-fun e!140017 () SeekEntryResult!728)

(assert (=> b!215250 (= e!140016 e!140017)))

(declare-fun c!36157 () Bool)

(declare-fun lt!110921 () (_ BitVec 64))

(assert (=> b!215250 (= c!36157 (= lt!110921 key!932))))

(declare-fun b!215251 () Bool)

(assert (=> b!215251 (= e!140017 (Found!728 (index!5084 lt!110891)))))

(declare-fun d!58413 () Bool)

(declare-fun lt!110922 () SeekEntryResult!728)

(assert (=> d!58413 (and (or ((_ is Undefined!728) lt!110922) (not ((_ is Found!728) lt!110922)) (and (bvsge (index!5083 lt!110922) #b00000000000000000000000000000000) (bvslt (index!5083 lt!110922) (size!5241 (_keys!6068 thiss!1504))))) (or ((_ is Undefined!728) lt!110922) ((_ is Found!728) lt!110922) (not ((_ is MissingVacant!728) lt!110922)) (not (= (index!5085 lt!110922) (index!5084 lt!110891))) (and (bvsge (index!5085 lt!110922) #b00000000000000000000000000000000) (bvslt (index!5085 lt!110922) (size!5241 (_keys!6068 thiss!1504))))) (or ((_ is Undefined!728) lt!110922) (ite ((_ is Found!728) lt!110922) (= (select (arr!4913 (_keys!6068 thiss!1504)) (index!5083 lt!110922)) key!932) (and ((_ is MissingVacant!728) lt!110922) (= (index!5085 lt!110922) (index!5084 lt!110891)) (= (select (arr!4913 (_keys!6068 thiss!1504)) (index!5085 lt!110922)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58413 (= lt!110922 e!140016)))

(declare-fun c!36158 () Bool)

(assert (=> d!58413 (= c!36158 (bvsge (x!22460 lt!110891) #b01111111111111111111111111111110))))

(assert (=> d!58413 (= lt!110921 (select (arr!4913 (_keys!6068 thiss!1504)) (index!5084 lt!110891)))))

(assert (=> d!58413 (validMask!0 (mask!9728 thiss!1504))))

(assert (=> d!58413 (= (seekKeyOrZeroReturnVacant!0 (x!22460 lt!110891) (index!5084 lt!110891) (index!5084 lt!110891) key!932 (_keys!6068 thiss!1504) (mask!9728 thiss!1504)) lt!110922)))

(declare-fun e!140018 () SeekEntryResult!728)

(declare-fun b!215252 () Bool)

(assert (=> b!215252 (= e!140018 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22460 lt!110891) #b00000000000000000000000000000001) (nextIndex!0 (index!5084 lt!110891) (x!22460 lt!110891) (mask!9728 thiss!1504)) (index!5084 lt!110891) key!932 (_keys!6068 thiss!1504) (mask!9728 thiss!1504)))))

(declare-fun b!215253 () Bool)

(declare-fun c!36156 () Bool)

(assert (=> b!215253 (= c!36156 (= lt!110921 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215253 (= e!140017 e!140018)))

(declare-fun b!215254 () Bool)

(assert (=> b!215254 (= e!140018 (MissingVacant!728 (index!5084 lt!110891)))))

(assert (= (and d!58413 c!36158) b!215249))

(assert (= (and d!58413 (not c!36158)) b!215250))

(assert (= (and b!215250 c!36157) b!215251))

(assert (= (and b!215250 (not c!36157)) b!215253))

(assert (= (and b!215253 c!36156) b!215254))

(assert (= (and b!215253 (not c!36156)) b!215252))

(declare-fun m!242555 () Bool)

(assert (=> d!58413 m!242555))

(declare-fun m!242557 () Bool)

(assert (=> d!58413 m!242557))

(assert (=> d!58413 m!242521))

(assert (=> d!58413 m!242495))

(declare-fun m!242559 () Bool)

(assert (=> b!215252 m!242559))

(assert (=> b!215252 m!242559))

(declare-fun m!242561 () Bool)

(assert (=> b!215252 m!242561))

(assert (=> b!215165 d!58413))

(declare-fun b!215265 () Bool)

(declare-fun e!140028 () Bool)

(declare-fun call!20340 () Bool)

(assert (=> b!215265 (= e!140028 call!20340)))

(declare-fun b!215266 () Bool)

(declare-fun e!140030 () Bool)

(declare-fun e!140029 () Bool)

(assert (=> b!215266 (= e!140030 e!140029)))

(declare-fun res!105309 () Bool)

(assert (=> b!215266 (=> (not res!105309) (not e!140029))))

(declare-fun e!140027 () Bool)

(assert (=> b!215266 (= res!105309 (not e!140027))))

(declare-fun res!105308 () Bool)

(assert (=> b!215266 (=> (not res!105308) (not e!140027))))

(assert (=> b!215266 (= res!105308 (validKeyInArray!0 (select (arr!4913 (_keys!6068 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215267 () Bool)

(assert (=> b!215267 (= e!140029 e!140028)))

(declare-fun c!36161 () Bool)

(assert (=> b!215267 (= c!36161 (validKeyInArray!0 (select (arr!4913 (_keys!6068 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215268 () Bool)

(assert (=> b!215268 (= e!140028 call!20340)))

(declare-fun bm!20337 () Bool)

(assert (=> bm!20337 (= call!20340 (arrayNoDuplicates!0 (_keys!6068 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36161 (Cons!3131 (select (arr!4913 (_keys!6068 thiss!1504)) #b00000000000000000000000000000000) Nil!3132) Nil!3132)))))

(declare-fun d!58415 () Bool)

(declare-fun res!105307 () Bool)

(assert (=> d!58415 (=> res!105307 e!140030)))

(assert (=> d!58415 (= res!105307 (bvsge #b00000000000000000000000000000000 (size!5241 (_keys!6068 thiss!1504))))))

(assert (=> d!58415 (= (arrayNoDuplicates!0 (_keys!6068 thiss!1504) #b00000000000000000000000000000000 Nil!3132) e!140030)))

(declare-fun b!215269 () Bool)

(declare-fun contains!1428 (List!3135 (_ BitVec 64)) Bool)

(assert (=> b!215269 (= e!140027 (contains!1428 Nil!3132 (select (arr!4913 (_keys!6068 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58415 (not res!105307)) b!215266))

(assert (= (and b!215266 res!105308) b!215269))

(assert (= (and b!215266 res!105309) b!215267))

(assert (= (and b!215267 c!36161) b!215268))

(assert (= (and b!215267 (not c!36161)) b!215265))

(assert (= (or b!215268 b!215265) bm!20337))

(assert (=> b!215266 m!242533))

(assert (=> b!215266 m!242533))

(assert (=> b!215266 m!242543))

(assert (=> b!215267 m!242533))

(assert (=> b!215267 m!242533))

(assert (=> b!215267 m!242543))

(assert (=> bm!20337 m!242533))

(declare-fun m!242563 () Bool)

(assert (=> bm!20337 m!242563))

(assert (=> b!215269 m!242533))

(assert (=> b!215269 m!242533))

(declare-fun m!242565 () Bool)

(assert (=> b!215269 m!242565))

(assert (=> b!215177 d!58415))

(declare-fun b!215278 () Bool)

(declare-fun res!105320 () Bool)

(declare-fun e!140033 () Bool)

(assert (=> b!215278 (=> (not res!105320) (not e!140033))))

(assert (=> b!215278 (= res!105320 (and (= (size!5240 (_values!4025 thiss!1504)) (bvadd (mask!9728 thiss!1504) #b00000000000000000000000000000001)) (= (size!5241 (_keys!6068 thiss!1504)) (size!5240 (_values!4025 thiss!1504))) (bvsge (_size!1441 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1441 thiss!1504) (bvadd (mask!9728 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!58417 () Bool)

(declare-fun res!105318 () Bool)

(assert (=> d!58417 (=> (not res!105318) (not e!140033))))

(assert (=> d!58417 (= res!105318 (validMask!0 (mask!9728 thiss!1504)))))

(assert (=> d!58417 (= (simpleValid!216 thiss!1504) e!140033)))

(declare-fun b!215280 () Bool)

(declare-fun res!105319 () Bool)

(assert (=> b!215280 (=> (not res!105319) (not e!140033))))

(declare-fun size!5244 (LongMapFixedSize!2784) (_ BitVec 32))

(assert (=> b!215280 (= res!105319 (= (size!5244 thiss!1504) (bvadd (_size!1441 thiss!1504) (bvsdiv (bvadd (extraKeys!3779 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!215279 () Bool)

(declare-fun res!105321 () Bool)

(assert (=> b!215279 (=> (not res!105321) (not e!140033))))

(assert (=> b!215279 (= res!105321 (bvsge (size!5244 thiss!1504) (_size!1441 thiss!1504)))))

(declare-fun b!215281 () Bool)

(assert (=> b!215281 (= e!140033 (and (bvsge (extraKeys!3779 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3779 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1441 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!58417 res!105318) b!215278))

(assert (= (and b!215278 res!105320) b!215279))

(assert (= (and b!215279 res!105321) b!215280))

(assert (= (and b!215280 res!105319) b!215281))

(assert (=> d!58417 m!242495))

(declare-fun m!242567 () Bool)

(assert (=> b!215280 m!242567))

(assert (=> b!215279 m!242567))

(assert (=> d!58399 d!58417))

(declare-fun b!215283 () Bool)

(declare-fun e!140035 () Bool)

(assert (=> b!215283 (= e!140035 tp_is_empty!5571)))

(declare-fun condMapEmpty!9498 () Bool)

(declare-fun mapDefault!9498 () ValueCell!2442)

(assert (=> mapNonEmpty!9497 (= condMapEmpty!9498 (= mapRest!9497 ((as const (Array (_ BitVec 32) ValueCell!2442)) mapDefault!9498)))))

(declare-fun mapRes!9498 () Bool)

(assert (=> mapNonEmpty!9497 (= tp!20243 (and e!140035 mapRes!9498))))

(declare-fun b!215282 () Bool)

(declare-fun e!140034 () Bool)

(assert (=> b!215282 (= e!140034 tp_is_empty!5571)))

(declare-fun mapNonEmpty!9498 () Bool)

(declare-fun tp!20244 () Bool)

(assert (=> mapNonEmpty!9498 (= mapRes!9498 (and tp!20244 e!140034))))

(declare-fun mapValue!9498 () ValueCell!2442)

(declare-fun mapRest!9498 () (Array (_ BitVec 32) ValueCell!2442))

(declare-fun mapKey!9498 () (_ BitVec 32))

(assert (=> mapNonEmpty!9498 (= mapRest!9497 (store mapRest!9498 mapKey!9498 mapValue!9498))))

(declare-fun mapIsEmpty!9498 () Bool)

(assert (=> mapIsEmpty!9498 mapRes!9498))

(assert (= (and mapNonEmpty!9497 condMapEmpty!9498) mapIsEmpty!9498))

(assert (= (and mapNonEmpty!9497 (not condMapEmpty!9498)) mapNonEmpty!9498))

(assert (= (and mapNonEmpty!9498 ((_ is ValueCellFull!2442) mapValue!9498)) b!215282))

(assert (= (and mapNonEmpty!9497 ((_ is ValueCellFull!2442) mapDefault!9498)) b!215283))

(declare-fun m!242569 () Bool)

(assert (=> mapNonEmpty!9498 m!242569))

(check-sat (not bm!20331) (not b!215280) b_and!12599 (not mapNonEmpty!9498) (not b!215252) (not d!58409) (not b!215229) (not b!215267) (not bm!20334) (not b!215269) (not b!215194) (not b!215279) (not bm!20337) (not b!215197) (not b_next!5709) (not b!215266) (not d!58413) tp_is_empty!5571 (not b!215207) (not d!58417))
(check-sat b_and!12599 (not b_next!5709))
