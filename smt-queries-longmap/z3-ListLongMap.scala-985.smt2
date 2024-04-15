; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21268 () Bool)

(assert start!21268)

(declare-fun b!214024 () Bool)

(declare-fun b_free!5659 () Bool)

(declare-fun b_next!5659 () Bool)

(assert (=> b!214024 (= b_free!5659 (not b_next!5659))))

(declare-fun tp!20057 () Bool)

(declare-fun b_and!12523 () Bool)

(assert (=> b!214024 (= tp!20057 b_and!12523)))

(declare-fun mapIsEmpty!9390 () Bool)

(declare-fun mapRes!9390 () Bool)

(assert (=> mapIsEmpty!9390 mapRes!9390))

(declare-fun b!214021 () Bool)

(declare-fun e!139165 () Bool)

(declare-fun tp_is_empty!5521 () Bool)

(assert (=> b!214021 (= e!139165 tp_is_empty!5521)))

(declare-fun b!214022 () Bool)

(declare-fun res!104755 () Bool)

(declare-fun e!139166 () Bool)

(assert (=> b!214022 (=> (not res!104755) (not e!139166))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214022 (= res!104755 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214023 () Bool)

(declare-datatypes ((V!7009 0))(
  ( (V!7010 (val!2805 Int)) )
))
(declare-datatypes ((ValueCell!2417 0))(
  ( (ValueCellFull!2417 (v!4817 V!7009)) (EmptyCell!2417) )
))
(declare-datatypes ((array!10241 0))(
  ( (array!10242 (arr!4857 (Array (_ BitVec 32) ValueCell!2417)) (size!5184 (_ BitVec 32))) )
))
(declare-datatypes ((array!10243 0))(
  ( (array!10244 (arr!4858 (Array (_ BitVec 32) (_ BitVec 64))) (size!5185 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2734 0))(
  ( (LongMapFixedSize!2735 (defaultEntry!4017 Int) (mask!9668 (_ BitVec 32)) (extraKeys!3754 (_ BitVec 32)) (zeroValue!3858 V!7009) (minValue!3858 V!7009) (_size!1416 (_ BitVec 32)) (_keys!6033 array!10243) (_values!4000 array!10241) (_vacant!1416 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2734)

(assert (=> b!214023 (= e!139166 (bvslt (mask!9668 thiss!1504) #b00000000000000000000000000000000))))

(declare-fun b!214020 () Bool)

(declare-fun res!104756 () Bool)

(assert (=> b!214020 (=> (not res!104756) (not e!139166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214020 (= res!104756 (validMask!0 (mask!9668 thiss!1504)))))

(declare-fun res!104754 () Bool)

(assert (=> start!21268 (=> (not res!104754) (not e!139166))))

(declare-fun valid!1138 (LongMapFixedSize!2734) Bool)

(assert (=> start!21268 (= res!104754 (valid!1138 thiss!1504))))

(assert (=> start!21268 e!139166))

(declare-fun e!139169 () Bool)

(assert (=> start!21268 e!139169))

(assert (=> start!21268 true))

(declare-fun e!139167 () Bool)

(declare-fun array_inv!3193 (array!10243) Bool)

(declare-fun array_inv!3194 (array!10241) Bool)

(assert (=> b!214024 (= e!139169 (and tp!20057 tp_is_empty!5521 (array_inv!3193 (_keys!6033 thiss!1504)) (array_inv!3194 (_values!4000 thiss!1504)) e!139167))))

(declare-fun b!214025 () Bool)

(assert (=> b!214025 (= e!139167 (and e!139165 mapRes!9390))))

(declare-fun condMapEmpty!9390 () Bool)

(declare-fun mapDefault!9390 () ValueCell!2417)

(assert (=> b!214025 (= condMapEmpty!9390 (= (arr!4857 (_values!4000 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2417)) mapDefault!9390)))))

(declare-fun b!214026 () Bool)

(declare-fun e!139164 () Bool)

(assert (=> b!214026 (= e!139164 tp_is_empty!5521)))

(declare-fun mapNonEmpty!9390 () Bool)

(declare-fun tp!20058 () Bool)

(assert (=> mapNonEmpty!9390 (= mapRes!9390 (and tp!20058 e!139164))))

(declare-fun mapRest!9390 () (Array (_ BitVec 32) ValueCell!2417))

(declare-fun mapValue!9390 () ValueCell!2417)

(declare-fun mapKey!9390 () (_ BitVec 32))

(assert (=> mapNonEmpty!9390 (= (arr!4857 (_values!4000 thiss!1504)) (store mapRest!9390 mapKey!9390 mapValue!9390))))

(assert (= (and start!21268 res!104754) b!214022))

(assert (= (and b!214022 res!104755) b!214020))

(assert (= (and b!214020 res!104756) b!214023))

(assert (= (and b!214025 condMapEmpty!9390) mapIsEmpty!9390))

(assert (= (and b!214025 (not condMapEmpty!9390)) mapNonEmpty!9390))

(get-info :version)

(assert (= (and mapNonEmpty!9390 ((_ is ValueCellFull!2417) mapValue!9390)) b!214026))

(assert (= (and b!214025 ((_ is ValueCellFull!2417) mapDefault!9390)) b!214021))

(assert (= b!214024 b!214025))

(assert (= start!21268 b!214024))

(declare-fun m!241365 () Bool)

(assert (=> b!214020 m!241365))

(declare-fun m!241367 () Bool)

(assert (=> start!21268 m!241367))

(declare-fun m!241369 () Bool)

(assert (=> b!214024 m!241369))

(declare-fun m!241371 () Bool)

(assert (=> b!214024 m!241371))

(declare-fun m!241373 () Bool)

(assert (=> mapNonEmpty!9390 m!241373))

(check-sat b_and!12523 (not start!21268) tp_is_empty!5521 (not mapNonEmpty!9390) (not b_next!5659) (not b!214020) (not b!214024))
(check-sat b_and!12523 (not b_next!5659))
(get-model)

(declare-fun d!58131 () Bool)

(assert (=> d!58131 (= (array_inv!3193 (_keys!6033 thiss!1504)) (bvsge (size!5185 (_keys!6033 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214024 d!58131))

(declare-fun d!58133 () Bool)

(assert (=> d!58133 (= (array_inv!3194 (_values!4000 thiss!1504)) (bvsge (size!5184 (_values!4000 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214024 d!58133))

(declare-fun d!58135 () Bool)

(assert (=> d!58135 (= (validMask!0 (mask!9668 thiss!1504)) (and (or (= (mask!9668 thiss!1504) #b00000000000000000000000000000111) (= (mask!9668 thiss!1504) #b00000000000000000000000000001111) (= (mask!9668 thiss!1504) #b00000000000000000000000000011111) (= (mask!9668 thiss!1504) #b00000000000000000000000000111111) (= (mask!9668 thiss!1504) #b00000000000000000000000001111111) (= (mask!9668 thiss!1504) #b00000000000000000000000011111111) (= (mask!9668 thiss!1504) #b00000000000000000000000111111111) (= (mask!9668 thiss!1504) #b00000000000000000000001111111111) (= (mask!9668 thiss!1504) #b00000000000000000000011111111111) (= (mask!9668 thiss!1504) #b00000000000000000000111111111111) (= (mask!9668 thiss!1504) #b00000000000000000001111111111111) (= (mask!9668 thiss!1504) #b00000000000000000011111111111111) (= (mask!9668 thiss!1504) #b00000000000000000111111111111111) (= (mask!9668 thiss!1504) #b00000000000000001111111111111111) (= (mask!9668 thiss!1504) #b00000000000000011111111111111111) (= (mask!9668 thiss!1504) #b00000000000000111111111111111111) (= (mask!9668 thiss!1504) #b00000000000001111111111111111111) (= (mask!9668 thiss!1504) #b00000000000011111111111111111111) (= (mask!9668 thiss!1504) #b00000000000111111111111111111111) (= (mask!9668 thiss!1504) #b00000000001111111111111111111111) (= (mask!9668 thiss!1504) #b00000000011111111111111111111111) (= (mask!9668 thiss!1504) #b00000000111111111111111111111111) (= (mask!9668 thiss!1504) #b00000001111111111111111111111111) (= (mask!9668 thiss!1504) #b00000011111111111111111111111111) (= (mask!9668 thiss!1504) #b00000111111111111111111111111111) (= (mask!9668 thiss!1504) #b00001111111111111111111111111111) (= (mask!9668 thiss!1504) #b00011111111111111111111111111111) (= (mask!9668 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9668 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214020 d!58135))

(declare-fun d!58137 () Bool)

(declare-fun res!104781 () Bool)

(declare-fun e!139208 () Bool)

(assert (=> d!58137 (=> (not res!104781) (not e!139208))))

(declare-fun simpleValid!208 (LongMapFixedSize!2734) Bool)

(assert (=> d!58137 (= res!104781 (simpleValid!208 thiss!1504))))

(assert (=> d!58137 (= (valid!1138 thiss!1504) e!139208)))

(declare-fun b!214075 () Bool)

(declare-fun res!104782 () Bool)

(assert (=> b!214075 (=> (not res!104782) (not e!139208))))

(declare-fun arrayCountValidKeys!0 (array!10243 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214075 (= res!104782 (= (arrayCountValidKeys!0 (_keys!6033 thiss!1504) #b00000000000000000000000000000000 (size!5185 (_keys!6033 thiss!1504))) (_size!1416 thiss!1504)))))

(declare-fun b!214076 () Bool)

(declare-fun res!104783 () Bool)

(assert (=> b!214076 (=> (not res!104783) (not e!139208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10243 (_ BitVec 32)) Bool)

(assert (=> b!214076 (= res!104783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6033 thiss!1504) (mask!9668 thiss!1504)))))

(declare-fun b!214077 () Bool)

(declare-datatypes ((List!3114 0))(
  ( (Nil!3111) (Cons!3110 (h!3752 (_ BitVec 64)) (t!8060 List!3114)) )
))
(declare-fun arrayNoDuplicates!0 (array!10243 (_ BitVec 32) List!3114) Bool)

(assert (=> b!214077 (= e!139208 (arrayNoDuplicates!0 (_keys!6033 thiss!1504) #b00000000000000000000000000000000 Nil!3111))))

(assert (= (and d!58137 res!104781) b!214075))

(assert (= (and b!214075 res!104782) b!214076))

(assert (= (and b!214076 res!104783) b!214077))

(declare-fun m!241395 () Bool)

(assert (=> d!58137 m!241395))

(declare-fun m!241397 () Bool)

(assert (=> b!214075 m!241397))

(declare-fun m!241399 () Bool)

(assert (=> b!214076 m!241399))

(declare-fun m!241401 () Bool)

(assert (=> b!214077 m!241401))

(assert (=> start!21268 d!58137))

(declare-fun mapIsEmpty!9399 () Bool)

(declare-fun mapRes!9399 () Bool)

(assert (=> mapIsEmpty!9399 mapRes!9399))

(declare-fun mapNonEmpty!9399 () Bool)

(declare-fun tp!20073 () Bool)

(declare-fun e!139214 () Bool)

(assert (=> mapNonEmpty!9399 (= mapRes!9399 (and tp!20073 e!139214))))

(declare-fun mapValue!9399 () ValueCell!2417)

(declare-fun mapRest!9399 () (Array (_ BitVec 32) ValueCell!2417))

(declare-fun mapKey!9399 () (_ BitVec 32))

(assert (=> mapNonEmpty!9399 (= mapRest!9390 (store mapRest!9399 mapKey!9399 mapValue!9399))))

(declare-fun b!214085 () Bool)

(declare-fun e!139213 () Bool)

(assert (=> b!214085 (= e!139213 tp_is_empty!5521)))

(declare-fun b!214084 () Bool)

(assert (=> b!214084 (= e!139214 tp_is_empty!5521)))

(declare-fun condMapEmpty!9399 () Bool)

(declare-fun mapDefault!9399 () ValueCell!2417)

(assert (=> mapNonEmpty!9390 (= condMapEmpty!9399 (= mapRest!9390 ((as const (Array (_ BitVec 32) ValueCell!2417)) mapDefault!9399)))))

(assert (=> mapNonEmpty!9390 (= tp!20058 (and e!139213 mapRes!9399))))

(assert (= (and mapNonEmpty!9390 condMapEmpty!9399) mapIsEmpty!9399))

(assert (= (and mapNonEmpty!9390 (not condMapEmpty!9399)) mapNonEmpty!9399))

(assert (= (and mapNonEmpty!9399 ((_ is ValueCellFull!2417) mapValue!9399)) b!214084))

(assert (= (and mapNonEmpty!9390 ((_ is ValueCellFull!2417) mapDefault!9399)) b!214085))

(declare-fun m!241403 () Bool)

(assert (=> mapNonEmpty!9399 m!241403))

(check-sat tp_is_empty!5521 (not b!214076) (not mapNonEmpty!9399) (not b_next!5659) (not d!58137) (not b!214077) (not b!214075) b_and!12523)
(check-sat b_and!12523 (not b_next!5659))
