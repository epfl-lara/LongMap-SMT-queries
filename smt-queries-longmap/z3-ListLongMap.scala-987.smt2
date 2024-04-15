; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21304 () Bool)

(assert start!21304)

(declare-fun b!214236 () Bool)

(declare-fun b_free!5671 () Bool)

(declare-fun b_next!5671 () Bool)

(assert (=> b!214236 (= b_free!5671 (not b_next!5671))))

(declare-fun tp!20100 () Bool)

(declare-fun b_and!12535 () Bool)

(assert (=> b!214236 (= tp!20100 b_and!12535)))

(declare-fun e!139323 () Bool)

(declare-fun tp_is_empty!5533 () Bool)

(declare-fun e!139326 () Bool)

(declare-datatypes ((V!7025 0))(
  ( (V!7026 (val!2811 Int)) )
))
(declare-datatypes ((ValueCell!2423 0))(
  ( (ValueCellFull!2423 (v!4823 V!7025)) (EmptyCell!2423) )
))
(declare-datatypes ((array!10269 0))(
  ( (array!10270 (arr!4869 (Array (_ BitVec 32) ValueCell!2423)) (size!5197 (_ BitVec 32))) )
))
(declare-datatypes ((array!10271 0))(
  ( (array!10272 (arr!4870 (Array (_ BitVec 32) (_ BitVec 64))) (size!5198 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2746 0))(
  ( (LongMapFixedSize!2747 (defaultEntry!4023 Int) (mask!9681 (_ BitVec 32)) (extraKeys!3760 (_ BitVec 32)) (zeroValue!3864 V!7025) (minValue!3864 V!7025) (_size!1422 (_ BitVec 32)) (_keys!6040 array!10271) (_values!4006 array!10269) (_vacant!1422 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2746)

(declare-fun array_inv!3203 (array!10271) Bool)

(declare-fun array_inv!3204 (array!10269) Bool)

(assert (=> b!214236 (= e!139323 (and tp!20100 tp_is_empty!5533 (array_inv!3203 (_keys!6040 thiss!1504)) (array_inv!3204 (_values!4006 thiss!1504)) e!139326))))

(declare-fun b!214237 () Bool)

(declare-fun e!139322 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214237 (= e!139322 (not (validKeyInArray!0 key!932)))))

(declare-fun b!214238 () Bool)

(declare-fun res!104857 () Bool)

(assert (=> b!214238 (=> (not res!104857) (not e!139322))))

(assert (=> b!214238 (= res!104857 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!9415 () Bool)

(declare-fun mapRes!9415 () Bool)

(assert (=> mapIsEmpty!9415 mapRes!9415))

(declare-fun b!214239 () Bool)

(declare-fun e!139327 () Bool)

(assert (=> b!214239 (= e!139326 (and e!139327 mapRes!9415))))

(declare-fun condMapEmpty!9415 () Bool)

(declare-fun mapDefault!9415 () ValueCell!2423)

(assert (=> b!214239 (= condMapEmpty!9415 (= (arr!4869 (_values!4006 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2423)) mapDefault!9415)))))

(declare-fun b!214235 () Bool)

(declare-fun res!104858 () Bool)

(assert (=> b!214235 (=> (not res!104858) (not e!139322))))

(assert (=> b!214235 (= res!104858 (and (bvsge (mask!9681 thiss!1504) #b00000000000000000000000000000000) (= (size!5198 (_keys!6040 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9681 thiss!1504)))))))

(declare-fun res!104856 () Bool)

(assert (=> start!21304 (=> (not res!104856) (not e!139322))))

(declare-fun valid!1144 (LongMapFixedSize!2746) Bool)

(assert (=> start!21304 (= res!104856 (valid!1144 thiss!1504))))

(assert (=> start!21304 e!139322))

(assert (=> start!21304 e!139323))

(assert (=> start!21304 true))

(declare-fun mapNonEmpty!9415 () Bool)

(declare-fun tp!20101 () Bool)

(declare-fun e!139324 () Bool)

(assert (=> mapNonEmpty!9415 (= mapRes!9415 (and tp!20101 e!139324))))

(declare-fun mapKey!9415 () (_ BitVec 32))

(declare-fun mapValue!9415 () ValueCell!2423)

(declare-fun mapRest!9415 () (Array (_ BitVec 32) ValueCell!2423))

(assert (=> mapNonEmpty!9415 (= (arr!4869 (_values!4006 thiss!1504)) (store mapRest!9415 mapKey!9415 mapValue!9415))))

(declare-fun b!214240 () Bool)

(assert (=> b!214240 (= e!139324 tp_is_empty!5533)))

(declare-fun b!214241 () Bool)

(declare-fun res!104855 () Bool)

(assert (=> b!214241 (=> (not res!104855) (not e!139322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214241 (= res!104855 (validMask!0 (mask!9681 thiss!1504)))))

(declare-fun b!214242 () Bool)

(assert (=> b!214242 (= e!139327 tp_is_empty!5533)))

(assert (= (and start!21304 res!104856) b!214238))

(assert (= (and b!214238 res!104857) b!214241))

(assert (= (and b!214241 res!104855) b!214235))

(assert (= (and b!214235 res!104858) b!214237))

(assert (= (and b!214239 condMapEmpty!9415) mapIsEmpty!9415))

(assert (= (and b!214239 (not condMapEmpty!9415)) mapNonEmpty!9415))

(get-info :version)

(assert (= (and mapNonEmpty!9415 ((_ is ValueCellFull!2423) mapValue!9415)) b!214240))

(assert (= (and b!214239 ((_ is ValueCellFull!2423) mapDefault!9415)) b!214242))

(assert (= b!214236 b!214239))

(assert (= start!21304 b!214236))

(declare-fun m!241467 () Bool)

(assert (=> mapNonEmpty!9415 m!241467))

(declare-fun m!241469 () Bool)

(assert (=> b!214241 m!241469))

(declare-fun m!241471 () Bool)

(assert (=> b!214236 m!241471))

(declare-fun m!241473 () Bool)

(assert (=> b!214236 m!241473))

(declare-fun m!241475 () Bool)

(assert (=> b!214237 m!241475))

(declare-fun m!241477 () Bool)

(assert (=> start!21304 m!241477))

(check-sat (not b!214236) (not b!214241) (not b_next!5671) (not mapNonEmpty!9415) b_and!12535 tp_is_empty!5533 (not b!214237) (not start!21304))
(check-sat b_and!12535 (not b_next!5671))
(get-model)

(declare-fun d!58159 () Bool)

(assert (=> d!58159 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!214237 d!58159))

(declare-fun d!58161 () Bool)

(assert (=> d!58161 (= (validMask!0 (mask!9681 thiss!1504)) (and (or (= (mask!9681 thiss!1504) #b00000000000000000000000000000111) (= (mask!9681 thiss!1504) #b00000000000000000000000000001111) (= (mask!9681 thiss!1504) #b00000000000000000000000000011111) (= (mask!9681 thiss!1504) #b00000000000000000000000000111111) (= (mask!9681 thiss!1504) #b00000000000000000000000001111111) (= (mask!9681 thiss!1504) #b00000000000000000000000011111111) (= (mask!9681 thiss!1504) #b00000000000000000000000111111111) (= (mask!9681 thiss!1504) #b00000000000000000000001111111111) (= (mask!9681 thiss!1504) #b00000000000000000000011111111111) (= (mask!9681 thiss!1504) #b00000000000000000000111111111111) (= (mask!9681 thiss!1504) #b00000000000000000001111111111111) (= (mask!9681 thiss!1504) #b00000000000000000011111111111111) (= (mask!9681 thiss!1504) #b00000000000000000111111111111111) (= (mask!9681 thiss!1504) #b00000000000000001111111111111111) (= (mask!9681 thiss!1504) #b00000000000000011111111111111111) (= (mask!9681 thiss!1504) #b00000000000000111111111111111111) (= (mask!9681 thiss!1504) #b00000000000001111111111111111111) (= (mask!9681 thiss!1504) #b00000000000011111111111111111111) (= (mask!9681 thiss!1504) #b00000000000111111111111111111111) (= (mask!9681 thiss!1504) #b00000000001111111111111111111111) (= (mask!9681 thiss!1504) #b00000000011111111111111111111111) (= (mask!9681 thiss!1504) #b00000000111111111111111111111111) (= (mask!9681 thiss!1504) #b00000001111111111111111111111111) (= (mask!9681 thiss!1504) #b00000011111111111111111111111111) (= (mask!9681 thiss!1504) #b00000111111111111111111111111111) (= (mask!9681 thiss!1504) #b00001111111111111111111111111111) (= (mask!9681 thiss!1504) #b00011111111111111111111111111111) (= (mask!9681 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9681 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214241 d!58161))

(declare-fun d!58163 () Bool)

(declare-fun res!104889 () Bool)

(declare-fun e!139366 () Bool)

(assert (=> d!58163 (=> (not res!104889) (not e!139366))))

(declare-fun simpleValid!210 (LongMapFixedSize!2746) Bool)

(assert (=> d!58163 (= res!104889 (simpleValid!210 thiss!1504))))

(assert (=> d!58163 (= (valid!1144 thiss!1504) e!139366)))

(declare-fun b!214297 () Bool)

(declare-fun res!104890 () Bool)

(assert (=> b!214297 (=> (not res!104890) (not e!139366))))

(declare-fun arrayCountValidKeys!0 (array!10271 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214297 (= res!104890 (= (arrayCountValidKeys!0 (_keys!6040 thiss!1504) #b00000000000000000000000000000000 (size!5198 (_keys!6040 thiss!1504))) (_size!1422 thiss!1504)))))

(declare-fun b!214298 () Bool)

(declare-fun res!104891 () Bool)

(assert (=> b!214298 (=> (not res!104891) (not e!139366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10271 (_ BitVec 32)) Bool)

(assert (=> b!214298 (= res!104891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6040 thiss!1504) (mask!9681 thiss!1504)))))

(declare-fun b!214299 () Bool)

(declare-datatypes ((List!3116 0))(
  ( (Nil!3113) (Cons!3112 (h!3754 (_ BitVec 64)) (t!8062 List!3116)) )
))
(declare-fun arrayNoDuplicates!0 (array!10271 (_ BitVec 32) List!3116) Bool)

(assert (=> b!214299 (= e!139366 (arrayNoDuplicates!0 (_keys!6040 thiss!1504) #b00000000000000000000000000000000 Nil!3113))))

(assert (= (and d!58163 res!104889) b!214297))

(assert (= (and b!214297 res!104890) b!214298))

(assert (= (and b!214298 res!104891) b!214299))

(declare-fun m!241503 () Bool)

(assert (=> d!58163 m!241503))

(declare-fun m!241505 () Bool)

(assert (=> b!214297 m!241505))

(declare-fun m!241507 () Bool)

(assert (=> b!214298 m!241507))

(declare-fun m!241509 () Bool)

(assert (=> b!214299 m!241509))

(assert (=> start!21304 d!58163))

(declare-fun d!58165 () Bool)

(assert (=> d!58165 (= (array_inv!3203 (_keys!6040 thiss!1504)) (bvsge (size!5198 (_keys!6040 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214236 d!58165))

(declare-fun d!58167 () Bool)

(assert (=> d!58167 (= (array_inv!3204 (_values!4006 thiss!1504)) (bvsge (size!5197 (_values!4006 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214236 d!58167))

(declare-fun b!214306 () Bool)

(declare-fun e!139372 () Bool)

(assert (=> b!214306 (= e!139372 tp_is_empty!5533)))

(declare-fun b!214307 () Bool)

(declare-fun e!139371 () Bool)

(assert (=> b!214307 (= e!139371 tp_is_empty!5533)))

(declare-fun condMapEmpty!9424 () Bool)

(declare-fun mapDefault!9424 () ValueCell!2423)

(assert (=> mapNonEmpty!9415 (= condMapEmpty!9424 (= mapRest!9415 ((as const (Array (_ BitVec 32) ValueCell!2423)) mapDefault!9424)))))

(declare-fun mapRes!9424 () Bool)

(assert (=> mapNonEmpty!9415 (= tp!20101 (and e!139371 mapRes!9424))))

(declare-fun mapIsEmpty!9424 () Bool)

(assert (=> mapIsEmpty!9424 mapRes!9424))

(declare-fun mapNonEmpty!9424 () Bool)

(declare-fun tp!20116 () Bool)

(assert (=> mapNonEmpty!9424 (= mapRes!9424 (and tp!20116 e!139372))))

(declare-fun mapValue!9424 () ValueCell!2423)

(declare-fun mapKey!9424 () (_ BitVec 32))

(declare-fun mapRest!9424 () (Array (_ BitVec 32) ValueCell!2423))

(assert (=> mapNonEmpty!9424 (= mapRest!9415 (store mapRest!9424 mapKey!9424 mapValue!9424))))

(assert (= (and mapNonEmpty!9415 condMapEmpty!9424) mapIsEmpty!9424))

(assert (= (and mapNonEmpty!9415 (not condMapEmpty!9424)) mapNonEmpty!9424))

(assert (= (and mapNonEmpty!9424 ((_ is ValueCellFull!2423) mapValue!9424)) b!214306))

(assert (= (and mapNonEmpty!9415 ((_ is ValueCellFull!2423) mapDefault!9424)) b!214307))

(declare-fun m!241511 () Bool)

(assert (=> mapNonEmpty!9424 m!241511))

(check-sat (not b!214299) (not d!58163) (not b!214297) (not b_next!5671) b_and!12535 tp_is_empty!5533 (not mapNonEmpty!9424) (not b!214298))
(check-sat b_and!12535 (not b_next!5671))
