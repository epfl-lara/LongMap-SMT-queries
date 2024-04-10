; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21302 () Bool)

(assert start!21302)

(declare-fun b!214407 () Bool)

(declare-fun b_free!5673 () Bool)

(declare-fun b_next!5673 () Bool)

(assert (=> b!214407 (= b_free!5673 (not b_next!5673))))

(declare-fun tp!20107 () Bool)

(declare-fun b_and!12563 () Bool)

(assert (=> b!214407 (= tp!20107 b_and!12563)))

(declare-fun mapIsEmpty!9418 () Bool)

(declare-fun mapRes!9418 () Bool)

(assert (=> mapIsEmpty!9418 mapRes!9418))

(declare-fun mapNonEmpty!9418 () Bool)

(declare-fun tp!20106 () Bool)

(declare-fun e!139443 () Bool)

(assert (=> mapNonEmpty!9418 (= mapRes!9418 (and tp!20106 e!139443))))

(declare-datatypes ((V!7027 0))(
  ( (V!7028 (val!2812 Int)) )
))
(declare-datatypes ((ValueCell!2424 0))(
  ( (ValueCellFull!2424 (v!4830 V!7027)) (EmptyCell!2424) )
))
(declare-fun mapRest!9418 () (Array (_ BitVec 32) ValueCell!2424))

(declare-fun mapValue!9418 () ValueCell!2424)

(declare-fun mapKey!9418 () (_ BitVec 32))

(declare-datatypes ((array!10281 0))(
  ( (array!10282 (arr!4876 (Array (_ BitVec 32) ValueCell!2424)) (size!5203 (_ BitVec 32))) )
))
(declare-datatypes ((array!10283 0))(
  ( (array!10284 (arr!4877 (Array (_ BitVec 32) (_ BitVec 64))) (size!5204 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2748 0))(
  ( (LongMapFixedSize!2749 (defaultEntry!4024 Int) (mask!9683 (_ BitVec 32)) (extraKeys!3761 (_ BitVec 32)) (zeroValue!3865 V!7027) (minValue!3865 V!7027) (_size!1423 (_ BitVec 32)) (_keys!6042 array!10283) (_values!4007 array!10281) (_vacant!1423 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2748)

(assert (=> mapNonEmpty!9418 (= (arr!4876 (_values!4007 thiss!1504)) (store mapRest!9418 mapKey!9418 mapValue!9418))))

(declare-fun b!214406 () Bool)

(declare-fun tp_is_empty!5535 () Bool)

(assert (=> b!214406 (= e!139443 tp_is_empty!5535)))

(declare-fun e!139445 () Bool)

(declare-fun e!139442 () Bool)

(declare-fun array_inv!3223 (array!10283) Bool)

(declare-fun array_inv!3224 (array!10281) Bool)

(assert (=> b!214407 (= e!139442 (and tp!20107 tp_is_empty!5535 (array_inv!3223 (_keys!6042 thiss!1504)) (array_inv!3224 (_values!4007 thiss!1504)) e!139445))))

(declare-fun b!214408 () Bool)

(declare-fun res!104965 () Bool)

(declare-fun e!139441 () Bool)

(assert (=> b!214408 (=> (not res!104965) (not e!139441))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214408 (= res!104965 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214409 () Bool)

(declare-fun e!139446 () Bool)

(assert (=> b!214409 (= e!139446 tp_is_empty!5535)))

(declare-fun b!214410 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214410 (= e!139441 (not (validKeyInArray!0 key!932)))))

(declare-fun b!214412 () Bool)

(declare-fun res!104964 () Bool)

(assert (=> b!214412 (=> (not res!104964) (not e!139441))))

(assert (=> b!214412 (= res!104964 (and (bvsge (mask!9683 thiss!1504) #b00000000000000000000000000000000) (= (size!5204 (_keys!6042 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9683 thiss!1504)))))))

(declare-fun b!214413 () Bool)

(assert (=> b!214413 (= e!139445 (and e!139446 mapRes!9418))))

(declare-fun condMapEmpty!9418 () Bool)

(declare-fun mapDefault!9418 () ValueCell!2424)

(assert (=> b!214413 (= condMapEmpty!9418 (= (arr!4876 (_values!4007 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2424)) mapDefault!9418)))))

(declare-fun res!104963 () Bool)

(assert (=> start!21302 (=> (not res!104963) (not e!139441))))

(declare-fun valid!1126 (LongMapFixedSize!2748) Bool)

(assert (=> start!21302 (= res!104963 (valid!1126 thiss!1504))))

(assert (=> start!21302 e!139441))

(assert (=> start!21302 e!139442))

(assert (=> start!21302 true))

(declare-fun b!214411 () Bool)

(declare-fun res!104962 () Bool)

(assert (=> b!214411 (=> (not res!104962) (not e!139441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214411 (= res!104962 (validMask!0 (mask!9683 thiss!1504)))))

(assert (= (and start!21302 res!104963) b!214408))

(assert (= (and b!214408 res!104965) b!214411))

(assert (= (and b!214411 res!104962) b!214412))

(assert (= (and b!214412 res!104964) b!214410))

(assert (= (and b!214413 condMapEmpty!9418) mapIsEmpty!9418))

(assert (= (and b!214413 (not condMapEmpty!9418)) mapNonEmpty!9418))

(get-info :version)

(assert (= (and mapNonEmpty!9418 ((_ is ValueCellFull!2424) mapValue!9418)) b!214406))

(assert (= (and b!214413 ((_ is ValueCellFull!2424) mapDefault!9418)) b!214409))

(assert (= b!214407 b!214413))

(assert (= start!21302 b!214407))

(declare-fun m!242095 () Bool)

(assert (=> b!214407 m!242095))

(declare-fun m!242097 () Bool)

(assert (=> b!214407 m!242097))

(declare-fun m!242099 () Bool)

(assert (=> start!21302 m!242099))

(declare-fun m!242101 () Bool)

(assert (=> b!214410 m!242101))

(declare-fun m!242103 () Bool)

(assert (=> b!214411 m!242103))

(declare-fun m!242105 () Bool)

(assert (=> mapNonEmpty!9418 m!242105))

(check-sat (not b!214407) (not mapNonEmpty!9418) (not b_next!5673) (not start!21302) (not b!214411) b_and!12563 tp_is_empty!5535 (not b!214410))
(check-sat b_and!12563 (not b_next!5673))
(get-model)

(declare-fun d!58307 () Bool)

(assert (=> d!58307 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!214410 d!58307))

(declare-fun d!58309 () Bool)

(assert (=> d!58309 (= (validMask!0 (mask!9683 thiss!1504)) (and (or (= (mask!9683 thiss!1504) #b00000000000000000000000000000111) (= (mask!9683 thiss!1504) #b00000000000000000000000000001111) (= (mask!9683 thiss!1504) #b00000000000000000000000000011111) (= (mask!9683 thiss!1504) #b00000000000000000000000000111111) (= (mask!9683 thiss!1504) #b00000000000000000000000001111111) (= (mask!9683 thiss!1504) #b00000000000000000000000011111111) (= (mask!9683 thiss!1504) #b00000000000000000000000111111111) (= (mask!9683 thiss!1504) #b00000000000000000000001111111111) (= (mask!9683 thiss!1504) #b00000000000000000000011111111111) (= (mask!9683 thiss!1504) #b00000000000000000000111111111111) (= (mask!9683 thiss!1504) #b00000000000000000001111111111111) (= (mask!9683 thiss!1504) #b00000000000000000011111111111111) (= (mask!9683 thiss!1504) #b00000000000000000111111111111111) (= (mask!9683 thiss!1504) #b00000000000000001111111111111111) (= (mask!9683 thiss!1504) #b00000000000000011111111111111111) (= (mask!9683 thiss!1504) #b00000000000000111111111111111111) (= (mask!9683 thiss!1504) #b00000000000001111111111111111111) (= (mask!9683 thiss!1504) #b00000000000011111111111111111111) (= (mask!9683 thiss!1504) #b00000000000111111111111111111111) (= (mask!9683 thiss!1504) #b00000000001111111111111111111111) (= (mask!9683 thiss!1504) #b00000000011111111111111111111111) (= (mask!9683 thiss!1504) #b00000000111111111111111111111111) (= (mask!9683 thiss!1504) #b00000001111111111111111111111111) (= (mask!9683 thiss!1504) #b00000011111111111111111111111111) (= (mask!9683 thiss!1504) #b00000111111111111111111111111111) (= (mask!9683 thiss!1504) #b00001111111111111111111111111111) (= (mask!9683 thiss!1504) #b00011111111111111111111111111111) (= (mask!9683 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9683 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214411 d!58309))

(declare-fun d!58311 () Bool)

(declare-fun res!104984 () Bool)

(declare-fun e!139467 () Bool)

(assert (=> d!58311 (=> (not res!104984) (not e!139467))))

(declare-fun simpleValid!210 (LongMapFixedSize!2748) Bool)

(assert (=> d!58311 (= res!104984 (simpleValid!210 thiss!1504))))

(assert (=> d!58311 (= (valid!1126 thiss!1504) e!139467)))

(declare-fun b!214444 () Bool)

(declare-fun res!104985 () Bool)

(assert (=> b!214444 (=> (not res!104985) (not e!139467))))

(declare-fun arrayCountValidKeys!0 (array!10283 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214444 (= res!104985 (= (arrayCountValidKeys!0 (_keys!6042 thiss!1504) #b00000000000000000000000000000000 (size!5204 (_keys!6042 thiss!1504))) (_size!1423 thiss!1504)))))

(declare-fun b!214445 () Bool)

(declare-fun res!104986 () Bool)

(assert (=> b!214445 (=> (not res!104986) (not e!139467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10283 (_ BitVec 32)) Bool)

(assert (=> b!214445 (= res!104986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6042 thiss!1504) (mask!9683 thiss!1504)))))

(declare-fun b!214446 () Bool)

(declare-datatypes ((List!3129 0))(
  ( (Nil!3126) (Cons!3125 (h!3767 (_ BitVec 64)) (t!8084 List!3129)) )
))
(declare-fun arrayNoDuplicates!0 (array!10283 (_ BitVec 32) List!3129) Bool)

(assert (=> b!214446 (= e!139467 (arrayNoDuplicates!0 (_keys!6042 thiss!1504) #b00000000000000000000000000000000 Nil!3126))))

(assert (= (and d!58311 res!104984) b!214444))

(assert (= (and b!214444 res!104985) b!214445))

(assert (= (and b!214445 res!104986) b!214446))

(declare-fun m!242119 () Bool)

(assert (=> d!58311 m!242119))

(declare-fun m!242121 () Bool)

(assert (=> b!214444 m!242121))

(declare-fun m!242123 () Bool)

(assert (=> b!214445 m!242123))

(declare-fun m!242125 () Bool)

(assert (=> b!214446 m!242125))

(assert (=> start!21302 d!58311))

(declare-fun d!58313 () Bool)

(assert (=> d!58313 (= (array_inv!3223 (_keys!6042 thiss!1504)) (bvsge (size!5204 (_keys!6042 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214407 d!58313))

(declare-fun d!58315 () Bool)

(assert (=> d!58315 (= (array_inv!3224 (_values!4007 thiss!1504)) (bvsge (size!5203 (_values!4007 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214407 d!58315))

(declare-fun b!214453 () Bool)

(declare-fun e!139472 () Bool)

(assert (=> b!214453 (= e!139472 tp_is_empty!5535)))

(declare-fun mapNonEmpty!9424 () Bool)

(declare-fun mapRes!9424 () Bool)

(declare-fun tp!20116 () Bool)

(assert (=> mapNonEmpty!9424 (= mapRes!9424 (and tp!20116 e!139472))))

(declare-fun mapRest!9424 () (Array (_ BitVec 32) ValueCell!2424))

(declare-fun mapKey!9424 () (_ BitVec 32))

(declare-fun mapValue!9424 () ValueCell!2424)

(assert (=> mapNonEmpty!9424 (= mapRest!9418 (store mapRest!9424 mapKey!9424 mapValue!9424))))

(declare-fun condMapEmpty!9424 () Bool)

(declare-fun mapDefault!9424 () ValueCell!2424)

(assert (=> mapNonEmpty!9418 (= condMapEmpty!9424 (= mapRest!9418 ((as const (Array (_ BitVec 32) ValueCell!2424)) mapDefault!9424)))))

(declare-fun e!139473 () Bool)

(assert (=> mapNonEmpty!9418 (= tp!20106 (and e!139473 mapRes!9424))))

(declare-fun mapIsEmpty!9424 () Bool)

(assert (=> mapIsEmpty!9424 mapRes!9424))

(declare-fun b!214454 () Bool)

(assert (=> b!214454 (= e!139473 tp_is_empty!5535)))

(assert (= (and mapNonEmpty!9418 condMapEmpty!9424) mapIsEmpty!9424))

(assert (= (and mapNonEmpty!9418 (not condMapEmpty!9424)) mapNonEmpty!9424))

(assert (= (and mapNonEmpty!9424 ((_ is ValueCellFull!2424) mapValue!9424)) b!214453))

(assert (= (and mapNonEmpty!9418 ((_ is ValueCellFull!2424) mapDefault!9424)) b!214454))

(declare-fun m!242127 () Bool)

(assert (=> mapNonEmpty!9424 m!242127))

(check-sat (not b!214445) (not d!58311) (not mapNonEmpty!9424) (not b_next!5673) tp_is_empty!5535 (not b!214446) (not b!214444) b_and!12563)
(check-sat b_and!12563 (not b_next!5673))
