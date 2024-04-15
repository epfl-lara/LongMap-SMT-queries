; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21282 () Bool)

(assert start!21282)

(declare-fun b!214103 () Bool)

(declare-fun b_free!5665 () Bool)

(declare-fun b_next!5665 () Bool)

(assert (=> b!214103 (= b_free!5665 (not b_next!5665))))

(declare-fun tp!20079 () Bool)

(declare-fun b_and!12529 () Bool)

(assert (=> b!214103 (= tp!20079 b_and!12529)))

(declare-fun mapNonEmpty!9402 () Bool)

(declare-fun mapRes!9402 () Bool)

(declare-fun tp!20078 () Bool)

(declare-fun e!139228 () Bool)

(assert (=> mapNonEmpty!9402 (= mapRes!9402 (and tp!20078 e!139228))))

(declare-datatypes ((V!7017 0))(
  ( (V!7018 (val!2808 Int)) )
))
(declare-datatypes ((ValueCell!2420 0))(
  ( (ValueCellFull!2420 (v!4820 V!7017)) (EmptyCell!2420) )
))
(declare-fun mapValue!9402 () ValueCell!2420)

(declare-fun mapKey!9402 () (_ BitVec 32))

(declare-datatypes ((array!10255 0))(
  ( (array!10256 (arr!4863 (Array (_ BitVec 32) ValueCell!2420)) (size!5190 (_ BitVec 32))) )
))
(declare-datatypes ((array!10257 0))(
  ( (array!10258 (arr!4864 (Array (_ BitVec 32) (_ BitVec 64))) (size!5191 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2740 0))(
  ( (LongMapFixedSize!2741 (defaultEntry!4020 Int) (mask!9674 (_ BitVec 32)) (extraKeys!3757 (_ BitVec 32)) (zeroValue!3861 V!7017) (minValue!3861 V!7017) (_size!1419 (_ BitVec 32)) (_keys!6036 array!10257) (_values!4003 array!10255) (_vacant!1419 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2740)

(declare-fun mapRest!9402 () (Array (_ BitVec 32) ValueCell!2420))

(assert (=> mapNonEmpty!9402 (= (arr!4863 (_values!4003 thiss!1504)) (store mapRest!9402 mapKey!9402 mapValue!9402))))

(declare-fun res!104792 () Bool)

(declare-fun e!139231 () Bool)

(assert (=> start!21282 (=> (not res!104792) (not e!139231))))

(declare-fun valid!1141 (LongMapFixedSize!2740) Bool)

(assert (=> start!21282 (= res!104792 (valid!1141 thiss!1504))))

(assert (=> start!21282 e!139231))

(declare-fun e!139230 () Bool)

(assert (=> start!21282 e!139230))

(assert (=> start!21282 true))

(declare-fun b!214100 () Bool)

(declare-fun res!104791 () Bool)

(assert (=> b!214100 (=> (not res!104791) (not e!139231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214100 (= res!104791 (validMask!0 (mask!9674 thiss!1504)))))

(declare-fun b!214101 () Bool)

(assert (=> b!214101 (= e!139231 (and (bvsge (mask!9674 thiss!1504) #b00000000000000000000000000000000) (not (= (size!5191 (_keys!6036 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9674 thiss!1504))))))))

(declare-fun b!214102 () Bool)

(declare-fun tp_is_empty!5527 () Bool)

(assert (=> b!214102 (= e!139228 tp_is_empty!5527)))

(declare-fun mapIsEmpty!9402 () Bool)

(assert (=> mapIsEmpty!9402 mapRes!9402))

(declare-fun e!139227 () Bool)

(declare-fun array_inv!3199 (array!10257) Bool)

(declare-fun array_inv!3200 (array!10255) Bool)

(assert (=> b!214103 (= e!139230 (and tp!20079 tp_is_empty!5527 (array_inv!3199 (_keys!6036 thiss!1504)) (array_inv!3200 (_values!4003 thiss!1504)) e!139227))))

(declare-fun b!214104 () Bool)

(declare-fun res!104790 () Bool)

(assert (=> b!214104 (=> (not res!104790) (not e!139231))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214104 (= res!104790 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214105 () Bool)

(declare-fun e!139229 () Bool)

(assert (=> b!214105 (= e!139227 (and e!139229 mapRes!9402))))

(declare-fun condMapEmpty!9402 () Bool)

(declare-fun mapDefault!9402 () ValueCell!2420)

(assert (=> b!214105 (= condMapEmpty!9402 (= (arr!4863 (_values!4003 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2420)) mapDefault!9402)))))

(declare-fun b!214106 () Bool)

(assert (=> b!214106 (= e!139229 tp_is_empty!5527)))

(assert (= (and start!21282 res!104792) b!214104))

(assert (= (and b!214104 res!104790) b!214100))

(assert (= (and b!214100 res!104791) b!214101))

(assert (= (and b!214105 condMapEmpty!9402) mapIsEmpty!9402))

(assert (= (and b!214105 (not condMapEmpty!9402)) mapNonEmpty!9402))

(get-info :version)

(assert (= (and mapNonEmpty!9402 ((_ is ValueCellFull!2420) mapValue!9402)) b!214102))

(assert (= (and b!214105 ((_ is ValueCellFull!2420) mapDefault!9402)) b!214106))

(assert (= b!214103 b!214105))

(assert (= start!21282 b!214103))

(declare-fun m!241405 () Bool)

(assert (=> mapNonEmpty!9402 m!241405))

(declare-fun m!241407 () Bool)

(assert (=> start!21282 m!241407))

(declare-fun m!241409 () Bool)

(assert (=> b!214100 m!241409))

(declare-fun m!241411 () Bool)

(assert (=> b!214103 m!241411))

(declare-fun m!241413 () Bool)

(assert (=> b!214103 m!241413))

(check-sat (not start!21282) (not mapNonEmpty!9402) (not b!214100) tp_is_empty!5527 b_and!12529 (not b!214103) (not b_next!5665))
(check-sat b_and!12529 (not b_next!5665))
(get-model)

(declare-fun d!58141 () Bool)

(assert (=> d!58141 (= (array_inv!3199 (_keys!6036 thiss!1504)) (bvsge (size!5191 (_keys!6036 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214103 d!58141))

(declare-fun d!58143 () Bool)

(assert (=> d!58143 (= (array_inv!3200 (_values!4003 thiss!1504)) (bvsge (size!5190 (_values!4003 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214103 d!58143))

(declare-fun d!58145 () Bool)

(assert (=> d!58145 (= (validMask!0 (mask!9674 thiss!1504)) (and (or (= (mask!9674 thiss!1504) #b00000000000000000000000000000111) (= (mask!9674 thiss!1504) #b00000000000000000000000000001111) (= (mask!9674 thiss!1504) #b00000000000000000000000000011111) (= (mask!9674 thiss!1504) #b00000000000000000000000000111111) (= (mask!9674 thiss!1504) #b00000000000000000000000001111111) (= (mask!9674 thiss!1504) #b00000000000000000000000011111111) (= (mask!9674 thiss!1504) #b00000000000000000000000111111111) (= (mask!9674 thiss!1504) #b00000000000000000000001111111111) (= (mask!9674 thiss!1504) #b00000000000000000000011111111111) (= (mask!9674 thiss!1504) #b00000000000000000000111111111111) (= (mask!9674 thiss!1504) #b00000000000000000001111111111111) (= (mask!9674 thiss!1504) #b00000000000000000011111111111111) (= (mask!9674 thiss!1504) #b00000000000000000111111111111111) (= (mask!9674 thiss!1504) #b00000000000000001111111111111111) (= (mask!9674 thiss!1504) #b00000000000000011111111111111111) (= (mask!9674 thiss!1504) #b00000000000000111111111111111111) (= (mask!9674 thiss!1504) #b00000000000001111111111111111111) (= (mask!9674 thiss!1504) #b00000000000011111111111111111111) (= (mask!9674 thiss!1504) #b00000000000111111111111111111111) (= (mask!9674 thiss!1504) #b00000000001111111111111111111111) (= (mask!9674 thiss!1504) #b00000000011111111111111111111111) (= (mask!9674 thiss!1504) #b00000000111111111111111111111111) (= (mask!9674 thiss!1504) #b00000001111111111111111111111111) (= (mask!9674 thiss!1504) #b00000011111111111111111111111111) (= (mask!9674 thiss!1504) #b00000111111111111111111111111111) (= (mask!9674 thiss!1504) #b00001111111111111111111111111111) (= (mask!9674 thiss!1504) #b00011111111111111111111111111111) (= (mask!9674 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9674 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214100 d!58145))

(declare-fun d!58147 () Bool)

(declare-fun res!104817 () Bool)

(declare-fun e!139271 () Bool)

(assert (=> d!58147 (=> (not res!104817) (not e!139271))))

(declare-fun simpleValid!209 (LongMapFixedSize!2740) Bool)

(assert (=> d!58147 (= res!104817 (simpleValid!209 thiss!1504))))

(assert (=> d!58147 (= (valid!1141 thiss!1504) e!139271)))

(declare-fun b!214155 () Bool)

(declare-fun res!104818 () Bool)

(assert (=> b!214155 (=> (not res!104818) (not e!139271))))

(declare-fun arrayCountValidKeys!0 (array!10257 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214155 (= res!104818 (= (arrayCountValidKeys!0 (_keys!6036 thiss!1504) #b00000000000000000000000000000000 (size!5191 (_keys!6036 thiss!1504))) (_size!1419 thiss!1504)))))

(declare-fun b!214156 () Bool)

(declare-fun res!104819 () Bool)

(assert (=> b!214156 (=> (not res!104819) (not e!139271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10257 (_ BitVec 32)) Bool)

(assert (=> b!214156 (= res!104819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6036 thiss!1504) (mask!9674 thiss!1504)))))

(declare-fun b!214157 () Bool)

(declare-datatypes ((List!3115 0))(
  ( (Nil!3112) (Cons!3111 (h!3753 (_ BitVec 64)) (t!8061 List!3115)) )
))
(declare-fun arrayNoDuplicates!0 (array!10257 (_ BitVec 32) List!3115) Bool)

(assert (=> b!214157 (= e!139271 (arrayNoDuplicates!0 (_keys!6036 thiss!1504) #b00000000000000000000000000000000 Nil!3112))))

(assert (= (and d!58147 res!104817) b!214155))

(assert (= (and b!214155 res!104818) b!214156))

(assert (= (and b!214156 res!104819) b!214157))

(declare-fun m!241435 () Bool)

(assert (=> d!58147 m!241435))

(declare-fun m!241437 () Bool)

(assert (=> b!214155 m!241437))

(declare-fun m!241439 () Bool)

(assert (=> b!214156 m!241439))

(declare-fun m!241441 () Bool)

(assert (=> b!214157 m!241441))

(assert (=> start!21282 d!58147))

(declare-fun b!214164 () Bool)

(declare-fun e!139276 () Bool)

(assert (=> b!214164 (= e!139276 tp_is_empty!5527)))

(declare-fun mapNonEmpty!9411 () Bool)

(declare-fun mapRes!9411 () Bool)

(declare-fun tp!20094 () Bool)

(assert (=> mapNonEmpty!9411 (= mapRes!9411 (and tp!20094 e!139276))))

(declare-fun mapValue!9411 () ValueCell!2420)

(declare-fun mapKey!9411 () (_ BitVec 32))

(declare-fun mapRest!9411 () (Array (_ BitVec 32) ValueCell!2420))

(assert (=> mapNonEmpty!9411 (= mapRest!9402 (store mapRest!9411 mapKey!9411 mapValue!9411))))

(declare-fun condMapEmpty!9411 () Bool)

(declare-fun mapDefault!9411 () ValueCell!2420)

(assert (=> mapNonEmpty!9402 (= condMapEmpty!9411 (= mapRest!9402 ((as const (Array (_ BitVec 32) ValueCell!2420)) mapDefault!9411)))))

(declare-fun e!139277 () Bool)

(assert (=> mapNonEmpty!9402 (= tp!20078 (and e!139277 mapRes!9411))))

(declare-fun b!214165 () Bool)

(assert (=> b!214165 (= e!139277 tp_is_empty!5527)))

(declare-fun mapIsEmpty!9411 () Bool)

(assert (=> mapIsEmpty!9411 mapRes!9411))

(assert (= (and mapNonEmpty!9402 condMapEmpty!9411) mapIsEmpty!9411))

(assert (= (and mapNonEmpty!9402 (not condMapEmpty!9411)) mapNonEmpty!9411))

(assert (= (and mapNonEmpty!9411 ((_ is ValueCellFull!2420) mapValue!9411)) b!214164))

(assert (= (and mapNonEmpty!9402 ((_ is ValueCellFull!2420) mapDefault!9411)) b!214165))

(declare-fun m!241443 () Bool)

(assert (=> mapNonEmpty!9411 m!241443))

(check-sat (not b!214155) (not b_next!5665) b_and!12529 (not mapNonEmpty!9411) (not b!214156) (not b!214157) tp_is_empty!5527 (not d!58147))
(check-sat b_and!12529 (not b_next!5665))
(get-model)

(declare-fun b!214174 () Bool)

(declare-fun e!139282 () (_ BitVec 32))

(declare-fun call!20292 () (_ BitVec 32))

(assert (=> b!214174 (= e!139282 (bvadd #b00000000000000000000000000000001 call!20292))))

(declare-fun b!214175 () Bool)

(declare-fun e!139283 () (_ BitVec 32))

(assert (=> b!214175 (= e!139283 e!139282)))

(declare-fun c!36015 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214175 (= c!36015 (validKeyInArray!0 (select (arr!4864 (_keys!6036 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214176 () Bool)

(assert (=> b!214176 (= e!139283 #b00000000000000000000000000000000)))

(declare-fun b!214177 () Bool)

(assert (=> b!214177 (= e!139282 call!20292)))

(declare-fun d!58149 () Bool)

(declare-fun lt!110600 () (_ BitVec 32))

(assert (=> d!58149 (and (bvsge lt!110600 #b00000000000000000000000000000000) (bvsle lt!110600 (bvsub (size!5191 (_keys!6036 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58149 (= lt!110600 e!139283)))

(declare-fun c!36014 () Bool)

(assert (=> d!58149 (= c!36014 (bvsge #b00000000000000000000000000000000 (size!5191 (_keys!6036 thiss!1504))))))

(assert (=> d!58149 (and (bvsle #b00000000000000000000000000000000 (size!5191 (_keys!6036 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5191 (_keys!6036 thiss!1504)) (size!5191 (_keys!6036 thiss!1504))))))

(assert (=> d!58149 (= (arrayCountValidKeys!0 (_keys!6036 thiss!1504) #b00000000000000000000000000000000 (size!5191 (_keys!6036 thiss!1504))) lt!110600)))

(declare-fun bm!20289 () Bool)

(assert (=> bm!20289 (= call!20292 (arrayCountValidKeys!0 (_keys!6036 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5191 (_keys!6036 thiss!1504))))))

(assert (= (and d!58149 c!36014) b!214176))

(assert (= (and d!58149 (not c!36014)) b!214175))

(assert (= (and b!214175 c!36015) b!214174))

(assert (= (and b!214175 (not c!36015)) b!214177))

(assert (= (or b!214174 b!214177) bm!20289))

(declare-fun m!241445 () Bool)

(assert (=> b!214175 m!241445))

(assert (=> b!214175 m!241445))

(declare-fun m!241447 () Bool)

(assert (=> b!214175 m!241447))

(declare-fun m!241449 () Bool)

(assert (=> bm!20289 m!241449))

(assert (=> b!214155 d!58149))

(declare-fun b!214188 () Bool)

(declare-fun res!104828 () Bool)

(declare-fun e!139286 () Bool)

(assert (=> b!214188 (=> (not res!104828) (not e!139286))))

(declare-fun size!5196 (LongMapFixedSize!2740) (_ BitVec 32))

(assert (=> b!214188 (= res!104828 (= (size!5196 thiss!1504) (bvadd (_size!1419 thiss!1504) (bvsdiv (bvadd (extraKeys!3757 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!214187 () Bool)

(declare-fun res!104831 () Bool)

(assert (=> b!214187 (=> (not res!104831) (not e!139286))))

(assert (=> b!214187 (= res!104831 (bvsge (size!5196 thiss!1504) (_size!1419 thiss!1504)))))

(declare-fun b!214186 () Bool)

(declare-fun res!104830 () Bool)

(assert (=> b!214186 (=> (not res!104830) (not e!139286))))

(assert (=> b!214186 (= res!104830 (and (= (size!5190 (_values!4003 thiss!1504)) (bvadd (mask!9674 thiss!1504) #b00000000000000000000000000000001)) (= (size!5191 (_keys!6036 thiss!1504)) (size!5190 (_values!4003 thiss!1504))) (bvsge (_size!1419 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1419 thiss!1504) (bvadd (mask!9674 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!58151 () Bool)

(declare-fun res!104829 () Bool)

(assert (=> d!58151 (=> (not res!104829) (not e!139286))))

(assert (=> d!58151 (= res!104829 (validMask!0 (mask!9674 thiss!1504)))))

(assert (=> d!58151 (= (simpleValid!209 thiss!1504) e!139286)))

(declare-fun b!214189 () Bool)

(assert (=> b!214189 (= e!139286 (and (bvsge (extraKeys!3757 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3757 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1419 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!58151 res!104829) b!214186))

(assert (= (and b!214186 res!104830) b!214187))

(assert (= (and b!214187 res!104831) b!214188))

(assert (= (and b!214188 res!104828) b!214189))

(declare-fun m!241451 () Bool)

(assert (=> b!214188 m!241451))

(assert (=> b!214187 m!241451))

(assert (=> d!58151 m!241409))

(assert (=> d!58147 d!58151))

(declare-fun b!214198 () Bool)

(declare-fun e!139295 () Bool)

(declare-fun e!139293 () Bool)

(assert (=> b!214198 (= e!139295 e!139293)))

(declare-fun c!36018 () Bool)

(assert (=> b!214198 (= c!36018 (validKeyInArray!0 (select (arr!4864 (_keys!6036 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214199 () Bool)

(declare-fun e!139294 () Bool)

(declare-fun call!20295 () Bool)

(assert (=> b!214199 (= e!139294 call!20295)))

(declare-fun d!58153 () Bool)

(declare-fun res!104837 () Bool)

(assert (=> d!58153 (=> res!104837 e!139295)))

(assert (=> d!58153 (= res!104837 (bvsge #b00000000000000000000000000000000 (size!5191 (_keys!6036 thiss!1504))))))

(assert (=> d!58153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6036 thiss!1504) (mask!9674 thiss!1504)) e!139295)))

(declare-fun bm!20292 () Bool)

(assert (=> bm!20292 (= call!20295 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6036 thiss!1504) (mask!9674 thiss!1504)))))

(declare-fun b!214200 () Bool)

(assert (=> b!214200 (= e!139293 call!20295)))

(declare-fun b!214201 () Bool)

(assert (=> b!214201 (= e!139293 e!139294)))

(declare-fun lt!110608 () (_ BitVec 64))

(assert (=> b!214201 (= lt!110608 (select (arr!4864 (_keys!6036 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6448 0))(
  ( (Unit!6449) )
))
(declare-fun lt!110607 () Unit!6448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10257 (_ BitVec 64) (_ BitVec 32)) Unit!6448)

(assert (=> b!214201 (= lt!110607 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6036 thiss!1504) lt!110608 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!214201 (arrayContainsKey!0 (_keys!6036 thiss!1504) lt!110608 #b00000000000000000000000000000000)))

(declare-fun lt!110609 () Unit!6448)

(assert (=> b!214201 (= lt!110609 lt!110607)))

(declare-fun res!104836 () Bool)

(declare-datatypes ((SeekEntryResult!718 0))(
  ( (MissingZero!718 (index!5042 (_ BitVec 32))) (Found!718 (index!5043 (_ BitVec 32))) (Intermediate!718 (undefined!1530 Bool) (index!5044 (_ BitVec 32)) (x!22336 (_ BitVec 32))) (Undefined!718) (MissingVacant!718 (index!5045 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10257 (_ BitVec 32)) SeekEntryResult!718)

(assert (=> b!214201 (= res!104836 (= (seekEntryOrOpen!0 (select (arr!4864 (_keys!6036 thiss!1504)) #b00000000000000000000000000000000) (_keys!6036 thiss!1504) (mask!9674 thiss!1504)) (Found!718 #b00000000000000000000000000000000)))))

(assert (=> b!214201 (=> (not res!104836) (not e!139294))))

(assert (= (and d!58153 (not res!104837)) b!214198))

(assert (= (and b!214198 c!36018) b!214201))

(assert (= (and b!214198 (not c!36018)) b!214200))

(assert (= (and b!214201 res!104836) b!214199))

(assert (= (or b!214199 b!214200) bm!20292))

(assert (=> b!214198 m!241445))

(assert (=> b!214198 m!241445))

(assert (=> b!214198 m!241447))

(declare-fun m!241453 () Bool)

(assert (=> bm!20292 m!241453))

(assert (=> b!214201 m!241445))

(declare-fun m!241455 () Bool)

(assert (=> b!214201 m!241455))

(declare-fun m!241457 () Bool)

(assert (=> b!214201 m!241457))

(assert (=> b!214201 m!241445))

(declare-fun m!241459 () Bool)

(assert (=> b!214201 m!241459))

(assert (=> b!214156 d!58153))

(declare-fun d!58155 () Bool)

(declare-fun res!104846 () Bool)

(declare-fun e!139305 () Bool)

(assert (=> d!58155 (=> res!104846 e!139305)))

(assert (=> d!58155 (= res!104846 (bvsge #b00000000000000000000000000000000 (size!5191 (_keys!6036 thiss!1504))))))

(assert (=> d!58155 (= (arrayNoDuplicates!0 (_keys!6036 thiss!1504) #b00000000000000000000000000000000 Nil!3112) e!139305)))

(declare-fun b!214212 () Bool)

(declare-fun e!139304 () Bool)

(declare-fun e!139306 () Bool)

(assert (=> b!214212 (= e!139304 e!139306)))

(declare-fun c!36021 () Bool)

(assert (=> b!214212 (= c!36021 (validKeyInArray!0 (select (arr!4864 (_keys!6036 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214213 () Bool)

(declare-fun call!20298 () Bool)

(assert (=> b!214213 (= e!139306 call!20298)))

(declare-fun b!214214 () Bool)

(declare-fun e!139307 () Bool)

(declare-fun contains!1404 (List!3115 (_ BitVec 64)) Bool)

(assert (=> b!214214 (= e!139307 (contains!1404 Nil!3112 (select (arr!4864 (_keys!6036 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20295 () Bool)

(assert (=> bm!20295 (= call!20298 (arrayNoDuplicates!0 (_keys!6036 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36021 (Cons!3111 (select (arr!4864 (_keys!6036 thiss!1504)) #b00000000000000000000000000000000) Nil!3112) Nil!3112)))))

(declare-fun b!214215 () Bool)

(assert (=> b!214215 (= e!139306 call!20298)))

(declare-fun b!214216 () Bool)

(assert (=> b!214216 (= e!139305 e!139304)))

(declare-fun res!104844 () Bool)

(assert (=> b!214216 (=> (not res!104844) (not e!139304))))

(assert (=> b!214216 (= res!104844 (not e!139307))))

(declare-fun res!104845 () Bool)

(assert (=> b!214216 (=> (not res!104845) (not e!139307))))

(assert (=> b!214216 (= res!104845 (validKeyInArray!0 (select (arr!4864 (_keys!6036 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58155 (not res!104846)) b!214216))

(assert (= (and b!214216 res!104845) b!214214))

(assert (= (and b!214216 res!104844) b!214212))

(assert (= (and b!214212 c!36021) b!214213))

(assert (= (and b!214212 (not c!36021)) b!214215))

(assert (= (or b!214213 b!214215) bm!20295))

(assert (=> b!214212 m!241445))

(assert (=> b!214212 m!241445))

(assert (=> b!214212 m!241447))

(assert (=> b!214214 m!241445))

(assert (=> b!214214 m!241445))

(declare-fun m!241461 () Bool)

(assert (=> b!214214 m!241461))

(assert (=> bm!20295 m!241445))

(declare-fun m!241463 () Bool)

(assert (=> bm!20295 m!241463))

(assert (=> b!214216 m!241445))

(assert (=> b!214216 m!241445))

(assert (=> b!214216 m!241447))

(assert (=> b!214157 d!58155))

(declare-fun b!214217 () Bool)

(declare-fun e!139308 () Bool)

(assert (=> b!214217 (= e!139308 tp_is_empty!5527)))

(declare-fun mapNonEmpty!9412 () Bool)

(declare-fun mapRes!9412 () Bool)

(declare-fun tp!20095 () Bool)

(assert (=> mapNonEmpty!9412 (= mapRes!9412 (and tp!20095 e!139308))))

(declare-fun mapValue!9412 () ValueCell!2420)

(declare-fun mapRest!9412 () (Array (_ BitVec 32) ValueCell!2420))

(declare-fun mapKey!9412 () (_ BitVec 32))

(assert (=> mapNonEmpty!9412 (= mapRest!9411 (store mapRest!9412 mapKey!9412 mapValue!9412))))

(declare-fun condMapEmpty!9412 () Bool)

(declare-fun mapDefault!9412 () ValueCell!2420)

(assert (=> mapNonEmpty!9411 (= condMapEmpty!9412 (= mapRest!9411 ((as const (Array (_ BitVec 32) ValueCell!2420)) mapDefault!9412)))))

(declare-fun e!139309 () Bool)

(assert (=> mapNonEmpty!9411 (= tp!20094 (and e!139309 mapRes!9412))))

(declare-fun b!214218 () Bool)

(assert (=> b!214218 (= e!139309 tp_is_empty!5527)))

(declare-fun mapIsEmpty!9412 () Bool)

(assert (=> mapIsEmpty!9412 mapRes!9412))

(assert (= (and mapNonEmpty!9411 condMapEmpty!9412) mapIsEmpty!9412))

(assert (= (and mapNonEmpty!9411 (not condMapEmpty!9412)) mapNonEmpty!9412))

(assert (= (and mapNonEmpty!9412 ((_ is ValueCellFull!2420) mapValue!9412)) b!214217))

(assert (= (and mapNonEmpty!9411 ((_ is ValueCellFull!2420) mapDefault!9412)) b!214218))

(declare-fun m!241465 () Bool)

(assert (=> mapNonEmpty!9412 m!241465))

(check-sat (not bm!20295) (not b!214212) (not b_next!5665) (not bm!20289) (not b!214175) (not b!214216) tp_is_empty!5527 b_and!12529 (not b!214198) (not b!214188) (not mapNonEmpty!9412) (not bm!20292) (not b!214201) (not b!214214) (not d!58151) (not b!214187))
(check-sat b_and!12529 (not b_next!5665))
