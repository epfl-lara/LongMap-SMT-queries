; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21266 () Bool)

(assert start!21266)

(declare-fun b!214191 () Bool)

(declare-fun b_free!5661 () Bool)

(declare-fun b_next!5661 () Bool)

(assert (=> b!214191 (= b_free!5661 (not b_next!5661))))

(declare-fun tp!20063 () Bool)

(declare-fun b_and!12551 () Bool)

(assert (=> b!214191 (= tp!20063 b_and!12551)))

(declare-fun b!214188 () Bool)

(declare-fun e!139284 () Bool)

(declare-fun tp_is_empty!5523 () Bool)

(assert (=> b!214188 (= e!139284 tp_is_empty!5523)))

(declare-fun b!214189 () Bool)

(declare-fun e!139288 () Bool)

(declare-datatypes ((V!7011 0))(
  ( (V!7012 (val!2806 Int)) )
))
(declare-datatypes ((ValueCell!2418 0))(
  ( (ValueCellFull!2418 (v!4824 V!7011)) (EmptyCell!2418) )
))
(declare-datatypes ((array!10253 0))(
  ( (array!10254 (arr!4864 (Array (_ BitVec 32) ValueCell!2418)) (size!5190 (_ BitVec 32))) )
))
(declare-datatypes ((array!10255 0))(
  ( (array!10256 (arr!4865 (Array (_ BitVec 32) (_ BitVec 64))) (size!5191 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2736 0))(
  ( (LongMapFixedSize!2737 (defaultEntry!4018 Int) (mask!9670 (_ BitVec 32)) (extraKeys!3755 (_ BitVec 32)) (zeroValue!3859 V!7011) (minValue!3859 V!7011) (_size!1417 (_ BitVec 32)) (_keys!6035 array!10255) (_values!4001 array!10253) (_vacant!1417 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2736)

(assert (=> b!214189 (= e!139288 (bvslt (mask!9670 thiss!1504) #b00000000000000000000000000000000))))

(declare-fun res!104858 () Bool)

(assert (=> start!21266 (=> (not res!104858) (not e!139288))))

(declare-fun valid!1121 (LongMapFixedSize!2736) Bool)

(assert (=> start!21266 (= res!104858 (valid!1121 thiss!1504))))

(assert (=> start!21266 e!139288))

(declare-fun e!139287 () Bool)

(assert (=> start!21266 e!139287))

(assert (=> start!21266 true))

(declare-fun b!214190 () Bool)

(declare-fun e!139286 () Bool)

(declare-fun e!139283 () Bool)

(declare-fun mapRes!9393 () Bool)

(assert (=> b!214190 (= e!139286 (and e!139283 mapRes!9393))))

(declare-fun condMapEmpty!9393 () Bool)

(declare-fun mapDefault!9393 () ValueCell!2418)

(assert (=> b!214190 (= condMapEmpty!9393 (= (arr!4864 (_values!4001 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2418)) mapDefault!9393)))))

(declare-fun array_inv!3217 (array!10255) Bool)

(declare-fun array_inv!3218 (array!10253) Bool)

(assert (=> b!214191 (= e!139287 (and tp!20063 tp_is_empty!5523 (array_inv!3217 (_keys!6035 thiss!1504)) (array_inv!3218 (_values!4001 thiss!1504)) e!139286))))

(declare-fun mapNonEmpty!9393 () Bool)

(declare-fun tp!20064 () Bool)

(assert (=> mapNonEmpty!9393 (= mapRes!9393 (and tp!20064 e!139284))))

(declare-fun mapRest!9393 () (Array (_ BitVec 32) ValueCell!2418))

(declare-fun mapKey!9393 () (_ BitVec 32))

(declare-fun mapValue!9393 () ValueCell!2418)

(assert (=> mapNonEmpty!9393 (= (arr!4864 (_values!4001 thiss!1504)) (store mapRest!9393 mapKey!9393 mapValue!9393))))

(declare-fun mapIsEmpty!9393 () Bool)

(assert (=> mapIsEmpty!9393 mapRes!9393))

(declare-fun b!214192 () Bool)

(declare-fun res!104859 () Bool)

(assert (=> b!214192 (=> (not res!104859) (not e!139288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214192 (= res!104859 (validMask!0 (mask!9670 thiss!1504)))))

(declare-fun b!214193 () Bool)

(declare-fun res!104860 () Bool)

(assert (=> b!214193 (=> (not res!104860) (not e!139288))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214193 (= res!104860 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214194 () Bool)

(assert (=> b!214194 (= e!139283 tp_is_empty!5523)))

(assert (= (and start!21266 res!104858) b!214193))

(assert (= (and b!214193 res!104860) b!214192))

(assert (= (and b!214192 res!104859) b!214189))

(assert (= (and b!214190 condMapEmpty!9393) mapIsEmpty!9393))

(assert (= (and b!214190 (not condMapEmpty!9393)) mapNonEmpty!9393))

(get-info :version)

(assert (= (and mapNonEmpty!9393 ((_ is ValueCellFull!2418) mapValue!9393)) b!214188))

(assert (= (and b!214190 ((_ is ValueCellFull!2418) mapDefault!9393)) b!214194))

(assert (= b!214191 b!214190))

(assert (= start!21266 b!214191))

(declare-fun m!241991 () Bool)

(assert (=> start!21266 m!241991))

(declare-fun m!241993 () Bool)

(assert (=> b!214191 m!241993))

(declare-fun m!241995 () Bool)

(assert (=> b!214191 m!241995))

(declare-fun m!241997 () Bool)

(assert (=> mapNonEmpty!9393 m!241997))

(declare-fun m!241999 () Bool)

(assert (=> b!214192 m!241999))

(check-sat b_and!12551 (not start!21266) tp_is_empty!5523 (not b!214192) (not mapNonEmpty!9393) (not b!214191) (not b_next!5661))
(check-sat b_and!12551 (not b_next!5661))
(get-model)

(declare-fun d!58279 () Bool)

(assert (=> d!58279 (= (validMask!0 (mask!9670 thiss!1504)) (and (or (= (mask!9670 thiss!1504) #b00000000000000000000000000000111) (= (mask!9670 thiss!1504) #b00000000000000000000000000001111) (= (mask!9670 thiss!1504) #b00000000000000000000000000011111) (= (mask!9670 thiss!1504) #b00000000000000000000000000111111) (= (mask!9670 thiss!1504) #b00000000000000000000000001111111) (= (mask!9670 thiss!1504) #b00000000000000000000000011111111) (= (mask!9670 thiss!1504) #b00000000000000000000000111111111) (= (mask!9670 thiss!1504) #b00000000000000000000001111111111) (= (mask!9670 thiss!1504) #b00000000000000000000011111111111) (= (mask!9670 thiss!1504) #b00000000000000000000111111111111) (= (mask!9670 thiss!1504) #b00000000000000000001111111111111) (= (mask!9670 thiss!1504) #b00000000000000000011111111111111) (= (mask!9670 thiss!1504) #b00000000000000000111111111111111) (= (mask!9670 thiss!1504) #b00000000000000001111111111111111) (= (mask!9670 thiss!1504) #b00000000000000011111111111111111) (= (mask!9670 thiss!1504) #b00000000000000111111111111111111) (= (mask!9670 thiss!1504) #b00000000000001111111111111111111) (= (mask!9670 thiss!1504) #b00000000000011111111111111111111) (= (mask!9670 thiss!1504) #b00000000000111111111111111111111) (= (mask!9670 thiss!1504) #b00000000001111111111111111111111) (= (mask!9670 thiss!1504) #b00000000011111111111111111111111) (= (mask!9670 thiss!1504) #b00000000111111111111111111111111) (= (mask!9670 thiss!1504) #b00000001111111111111111111111111) (= (mask!9670 thiss!1504) #b00000011111111111111111111111111) (= (mask!9670 thiss!1504) #b00000111111111111111111111111111) (= (mask!9670 thiss!1504) #b00001111111111111111111111111111) (= (mask!9670 thiss!1504) #b00011111111111111111111111111111) (= (mask!9670 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9670 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214192 d!58279))

(declare-fun d!58281 () Bool)

(declare-fun res!104876 () Bool)

(declare-fun e!139309 () Bool)

(assert (=> d!58281 (=> (not res!104876) (not e!139309))))

(declare-fun simpleValid!208 (LongMapFixedSize!2736) Bool)

(assert (=> d!58281 (= res!104876 (simpleValid!208 thiss!1504))))

(assert (=> d!58281 (= (valid!1121 thiss!1504) e!139309)))

(declare-fun b!214222 () Bool)

(declare-fun res!104877 () Bool)

(assert (=> b!214222 (=> (not res!104877) (not e!139309))))

(declare-fun arrayCountValidKeys!0 (array!10255 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214222 (= res!104877 (= (arrayCountValidKeys!0 (_keys!6035 thiss!1504) #b00000000000000000000000000000000 (size!5191 (_keys!6035 thiss!1504))) (_size!1417 thiss!1504)))))

(declare-fun b!214223 () Bool)

(declare-fun res!104878 () Bool)

(assert (=> b!214223 (=> (not res!104878) (not e!139309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10255 (_ BitVec 32)) Bool)

(assert (=> b!214223 (= res!104878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6035 thiss!1504) (mask!9670 thiss!1504)))))

(declare-fun b!214224 () Bool)

(declare-datatypes ((List!3127 0))(
  ( (Nil!3124) (Cons!3123 (h!3765 (_ BitVec 64)) (t!8082 List!3127)) )
))
(declare-fun arrayNoDuplicates!0 (array!10255 (_ BitVec 32) List!3127) Bool)

(assert (=> b!214224 (= e!139309 (arrayNoDuplicates!0 (_keys!6035 thiss!1504) #b00000000000000000000000000000000 Nil!3124))))

(assert (= (and d!58281 res!104876) b!214222))

(assert (= (and b!214222 res!104877) b!214223))

(assert (= (and b!214223 res!104878) b!214224))

(declare-fun m!242011 () Bool)

(assert (=> d!58281 m!242011))

(declare-fun m!242013 () Bool)

(assert (=> b!214222 m!242013))

(declare-fun m!242015 () Bool)

(assert (=> b!214223 m!242015))

(declare-fun m!242017 () Bool)

(assert (=> b!214224 m!242017))

(assert (=> start!21266 d!58281))

(declare-fun d!58283 () Bool)

(assert (=> d!58283 (= (array_inv!3217 (_keys!6035 thiss!1504)) (bvsge (size!5191 (_keys!6035 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214191 d!58283))

(declare-fun d!58285 () Bool)

(assert (=> d!58285 (= (array_inv!3218 (_values!4001 thiss!1504)) (bvsge (size!5190 (_values!4001 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214191 d!58285))

(declare-fun mapIsEmpty!9399 () Bool)

(declare-fun mapRes!9399 () Bool)

(assert (=> mapIsEmpty!9399 mapRes!9399))

(declare-fun mapNonEmpty!9399 () Bool)

(declare-fun tp!20073 () Bool)

(declare-fun e!139315 () Bool)

(assert (=> mapNonEmpty!9399 (= mapRes!9399 (and tp!20073 e!139315))))

(declare-fun mapKey!9399 () (_ BitVec 32))

(declare-fun mapRest!9399 () (Array (_ BitVec 32) ValueCell!2418))

(declare-fun mapValue!9399 () ValueCell!2418)

(assert (=> mapNonEmpty!9399 (= mapRest!9393 (store mapRest!9399 mapKey!9399 mapValue!9399))))

(declare-fun b!214232 () Bool)

(declare-fun e!139314 () Bool)

(assert (=> b!214232 (= e!139314 tp_is_empty!5523)))

(declare-fun b!214231 () Bool)

(assert (=> b!214231 (= e!139315 tp_is_empty!5523)))

(declare-fun condMapEmpty!9399 () Bool)

(declare-fun mapDefault!9399 () ValueCell!2418)

(assert (=> mapNonEmpty!9393 (= condMapEmpty!9399 (= mapRest!9393 ((as const (Array (_ BitVec 32) ValueCell!2418)) mapDefault!9399)))))

(assert (=> mapNonEmpty!9393 (= tp!20064 (and e!139314 mapRes!9399))))

(assert (= (and mapNonEmpty!9393 condMapEmpty!9399) mapIsEmpty!9399))

(assert (= (and mapNonEmpty!9393 (not condMapEmpty!9399)) mapNonEmpty!9399))

(assert (= (and mapNonEmpty!9399 ((_ is ValueCellFull!2418) mapValue!9399)) b!214231))

(assert (= (and mapNonEmpty!9393 ((_ is ValueCellFull!2418) mapDefault!9399)) b!214232))

(declare-fun m!242019 () Bool)

(assert (=> mapNonEmpty!9399 m!242019))

(check-sat (not b!214222) (not b!214224) (not b_next!5661) b_and!12551 (not b!214223) (not d!58281) (not mapNonEmpty!9399) tp_is_empty!5523)
(check-sat b_and!12551 (not b_next!5661))
