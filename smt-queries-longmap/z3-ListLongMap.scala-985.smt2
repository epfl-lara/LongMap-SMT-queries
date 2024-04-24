; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21268 () Bool)

(assert start!21268)

(declare-fun b!214219 () Bool)

(declare-fun b_free!5659 () Bool)

(declare-fun b_next!5659 () Bool)

(assert (=> b!214219 (= b_free!5659 (not b_next!5659))))

(declare-fun tp!20058 () Bool)

(declare-fun b_and!12563 () Bool)

(assert (=> b!214219 (= tp!20058 b_and!12563)))

(declare-fun b!214214 () Bool)

(declare-fun res!104872 () Bool)

(declare-fun e!139292 () Bool)

(assert (=> b!214214 (=> (not res!104872) (not e!139292))))

(declare-datatypes ((V!7009 0))(
  ( (V!7010 (val!2805 Int)) )
))
(declare-datatypes ((ValueCell!2417 0))(
  ( (ValueCellFull!2417 (v!4824 V!7009)) (EmptyCell!2417) )
))
(declare-datatypes ((array!10247 0))(
  ( (array!10248 (arr!4861 (Array (_ BitVec 32) ValueCell!2417)) (size!5187 (_ BitVec 32))) )
))
(declare-datatypes ((array!10249 0))(
  ( (array!10250 (arr!4862 (Array (_ BitVec 32) (_ BitVec 64))) (size!5188 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2734 0))(
  ( (LongMapFixedSize!2735 (defaultEntry!4017 Int) (mask!9669 (_ BitVec 32)) (extraKeys!3754 (_ BitVec 32)) (zeroValue!3858 V!7009) (minValue!3858 V!7009) (_size!1416 (_ BitVec 32)) (_keys!6034 array!10249) (_values!4000 array!10247) (_vacant!1416 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2734)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214214 (= res!104872 (validMask!0 (mask!9669 thiss!1504)))))

(declare-fun b!214215 () Bool)

(declare-fun e!139290 () Bool)

(declare-fun tp_is_empty!5521 () Bool)

(assert (=> b!214215 (= e!139290 tp_is_empty!5521)))

(declare-fun mapNonEmpty!9390 () Bool)

(declare-fun mapRes!9390 () Bool)

(declare-fun tp!20057 () Bool)

(assert (=> mapNonEmpty!9390 (= mapRes!9390 (and tp!20057 e!139290))))

(declare-fun mapKey!9390 () (_ BitVec 32))

(declare-fun mapRest!9390 () (Array (_ BitVec 32) ValueCell!2417))

(declare-fun mapValue!9390 () ValueCell!2417)

(assert (=> mapNonEmpty!9390 (= (arr!4861 (_values!4000 thiss!1504)) (store mapRest!9390 mapKey!9390 mapValue!9390))))

(declare-fun b!214216 () Bool)

(declare-fun e!139291 () Bool)

(assert (=> b!214216 (= e!139291 tp_is_empty!5521)))

(declare-fun mapIsEmpty!9390 () Bool)

(assert (=> mapIsEmpty!9390 mapRes!9390))

(declare-fun b!214217 () Bool)

(declare-fun e!139294 () Bool)

(assert (=> b!214217 (= e!139294 (and e!139291 mapRes!9390))))

(declare-fun condMapEmpty!9390 () Bool)

(declare-fun mapDefault!9390 () ValueCell!2417)

(assert (=> b!214217 (= condMapEmpty!9390 (= (arr!4861 (_values!4000 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2417)) mapDefault!9390)))))

(declare-fun b!214218 () Bool)

(assert (=> b!214218 (= e!139292 (bvslt (mask!9669 thiss!1504) #b00000000000000000000000000000000))))

(declare-fun e!139293 () Bool)

(declare-fun array_inv!3191 (array!10249) Bool)

(declare-fun array_inv!3192 (array!10247) Bool)

(assert (=> b!214219 (= e!139293 (and tp!20058 tp_is_empty!5521 (array_inv!3191 (_keys!6034 thiss!1504)) (array_inv!3192 (_values!4000 thiss!1504)) e!139294))))

(declare-fun b!214220 () Bool)

(declare-fun res!104870 () Bool)

(assert (=> b!214220 (=> (not res!104870) (not e!139292))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214220 (= res!104870 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!104871 () Bool)

(assert (=> start!21268 (=> (not res!104871) (not e!139292))))

(declare-fun valid!1141 (LongMapFixedSize!2734) Bool)

(assert (=> start!21268 (= res!104871 (valid!1141 thiss!1504))))

(assert (=> start!21268 e!139292))

(assert (=> start!21268 e!139293))

(assert (=> start!21268 true))

(assert (= (and start!21268 res!104871) b!214220))

(assert (= (and b!214220 res!104870) b!214214))

(assert (= (and b!214214 res!104872) b!214218))

(assert (= (and b!214217 condMapEmpty!9390) mapIsEmpty!9390))

(assert (= (and b!214217 (not condMapEmpty!9390)) mapNonEmpty!9390))

(get-info :version)

(assert (= (and mapNonEmpty!9390 ((_ is ValueCellFull!2417) mapValue!9390)) b!214215))

(assert (= (and b!214217 ((_ is ValueCellFull!2417) mapDefault!9390)) b!214216))

(assert (= b!214219 b!214217))

(assert (= start!21268 b!214219))

(declare-fun m!242163 () Bool)

(assert (=> b!214214 m!242163))

(declare-fun m!242165 () Bool)

(assert (=> mapNonEmpty!9390 m!242165))

(declare-fun m!242167 () Bool)

(assert (=> b!214219 m!242167))

(declare-fun m!242169 () Bool)

(assert (=> b!214219 m!242169))

(declare-fun m!242171 () Bool)

(assert (=> start!21268 m!242171))

(check-sat (not mapNonEmpty!9390) b_and!12563 (not start!21268) (not b!214219) tp_is_empty!5521 (not b!214214) (not b_next!5659))
(check-sat b_and!12563 (not b_next!5659))
(get-model)

(declare-fun d!58353 () Bool)

(declare-fun res!104897 () Bool)

(declare-fun e!139333 () Bool)

(assert (=> d!58353 (=> (not res!104897) (not e!139333))))

(declare-fun simpleValid!208 (LongMapFixedSize!2734) Bool)

(assert (=> d!58353 (= res!104897 (simpleValid!208 thiss!1504))))

(assert (=> d!58353 (= (valid!1141 thiss!1504) e!139333)))

(declare-fun b!214269 () Bool)

(declare-fun res!104898 () Bool)

(assert (=> b!214269 (=> (not res!104898) (not e!139333))))

(declare-fun arrayCountValidKeys!0 (array!10249 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214269 (= res!104898 (= (arrayCountValidKeys!0 (_keys!6034 thiss!1504) #b00000000000000000000000000000000 (size!5188 (_keys!6034 thiss!1504))) (_size!1416 thiss!1504)))))

(declare-fun b!214270 () Bool)

(declare-fun res!104899 () Bool)

(assert (=> b!214270 (=> (not res!104899) (not e!139333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10249 (_ BitVec 32)) Bool)

(assert (=> b!214270 (= res!104899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6034 thiss!1504) (mask!9669 thiss!1504)))))

(declare-fun b!214271 () Bool)

(declare-datatypes ((List!3062 0))(
  ( (Nil!3059) (Cons!3058 (h!3700 (_ BitVec 64)) (t!8009 List!3062)) )
))
(declare-fun arrayNoDuplicates!0 (array!10249 (_ BitVec 32) List!3062) Bool)

(assert (=> b!214271 (= e!139333 (arrayNoDuplicates!0 (_keys!6034 thiss!1504) #b00000000000000000000000000000000 Nil!3059))))

(assert (= (and d!58353 res!104897) b!214269))

(assert (= (and b!214269 res!104898) b!214270))

(assert (= (and b!214270 res!104899) b!214271))

(declare-fun m!242193 () Bool)

(assert (=> d!58353 m!242193))

(declare-fun m!242195 () Bool)

(assert (=> b!214269 m!242195))

(declare-fun m!242197 () Bool)

(assert (=> b!214270 m!242197))

(declare-fun m!242199 () Bool)

(assert (=> b!214271 m!242199))

(assert (=> start!21268 d!58353))

(declare-fun d!58355 () Bool)

(assert (=> d!58355 (= (array_inv!3191 (_keys!6034 thiss!1504)) (bvsge (size!5188 (_keys!6034 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214219 d!58355))

(declare-fun d!58357 () Bool)

(assert (=> d!58357 (= (array_inv!3192 (_values!4000 thiss!1504)) (bvsge (size!5187 (_values!4000 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214219 d!58357))

(declare-fun d!58359 () Bool)

(assert (=> d!58359 (= (validMask!0 (mask!9669 thiss!1504)) (and (or (= (mask!9669 thiss!1504) #b00000000000000000000000000000111) (= (mask!9669 thiss!1504) #b00000000000000000000000000001111) (= (mask!9669 thiss!1504) #b00000000000000000000000000011111) (= (mask!9669 thiss!1504) #b00000000000000000000000000111111) (= (mask!9669 thiss!1504) #b00000000000000000000000001111111) (= (mask!9669 thiss!1504) #b00000000000000000000000011111111) (= (mask!9669 thiss!1504) #b00000000000000000000000111111111) (= (mask!9669 thiss!1504) #b00000000000000000000001111111111) (= (mask!9669 thiss!1504) #b00000000000000000000011111111111) (= (mask!9669 thiss!1504) #b00000000000000000000111111111111) (= (mask!9669 thiss!1504) #b00000000000000000001111111111111) (= (mask!9669 thiss!1504) #b00000000000000000011111111111111) (= (mask!9669 thiss!1504) #b00000000000000000111111111111111) (= (mask!9669 thiss!1504) #b00000000000000001111111111111111) (= (mask!9669 thiss!1504) #b00000000000000011111111111111111) (= (mask!9669 thiss!1504) #b00000000000000111111111111111111) (= (mask!9669 thiss!1504) #b00000000000001111111111111111111) (= (mask!9669 thiss!1504) #b00000000000011111111111111111111) (= (mask!9669 thiss!1504) #b00000000000111111111111111111111) (= (mask!9669 thiss!1504) #b00000000001111111111111111111111) (= (mask!9669 thiss!1504) #b00000000011111111111111111111111) (= (mask!9669 thiss!1504) #b00000000111111111111111111111111) (= (mask!9669 thiss!1504) #b00000001111111111111111111111111) (= (mask!9669 thiss!1504) #b00000011111111111111111111111111) (= (mask!9669 thiss!1504) #b00000111111111111111111111111111) (= (mask!9669 thiss!1504) #b00001111111111111111111111111111) (= (mask!9669 thiss!1504) #b00011111111111111111111111111111) (= (mask!9669 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9669 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214214 d!58359))

(declare-fun mapNonEmpty!9399 () Bool)

(declare-fun mapRes!9399 () Bool)

(declare-fun tp!20073 () Bool)

(declare-fun e!139338 () Bool)

(assert (=> mapNonEmpty!9399 (= mapRes!9399 (and tp!20073 e!139338))))

(declare-fun mapRest!9399 () (Array (_ BitVec 32) ValueCell!2417))

(declare-fun mapKey!9399 () (_ BitVec 32))

(declare-fun mapValue!9399 () ValueCell!2417)

(assert (=> mapNonEmpty!9399 (= mapRest!9390 (store mapRest!9399 mapKey!9399 mapValue!9399))))

(declare-fun condMapEmpty!9399 () Bool)

(declare-fun mapDefault!9399 () ValueCell!2417)

(assert (=> mapNonEmpty!9390 (= condMapEmpty!9399 (= mapRest!9390 ((as const (Array (_ BitVec 32) ValueCell!2417)) mapDefault!9399)))))

(declare-fun e!139339 () Bool)

(assert (=> mapNonEmpty!9390 (= tp!20057 (and e!139339 mapRes!9399))))

(declare-fun b!214279 () Bool)

(assert (=> b!214279 (= e!139339 tp_is_empty!5521)))

(declare-fun b!214278 () Bool)

(assert (=> b!214278 (= e!139338 tp_is_empty!5521)))

(declare-fun mapIsEmpty!9399 () Bool)

(assert (=> mapIsEmpty!9399 mapRes!9399))

(assert (= (and mapNonEmpty!9390 condMapEmpty!9399) mapIsEmpty!9399))

(assert (= (and mapNonEmpty!9390 (not condMapEmpty!9399)) mapNonEmpty!9399))

(assert (= (and mapNonEmpty!9399 ((_ is ValueCellFull!2417) mapValue!9399)) b!214278))

(assert (= (and mapNonEmpty!9390 ((_ is ValueCellFull!2417) mapDefault!9399)) b!214279))

(declare-fun m!242201 () Bool)

(assert (=> mapNonEmpty!9399 m!242201))

(check-sat (not d!58353) b_and!12563 (not b!214269) (not mapNonEmpty!9399) (not b_next!5659) (not b!214271) (not b!214270) tp_is_empty!5521)
(check-sat b_and!12563 (not b_next!5659))
