; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21304 () Bool)

(assert start!21304)

(declare-fun b!214434 () Bool)

(declare-fun b_free!5671 () Bool)

(declare-fun b_next!5671 () Bool)

(assert (=> b!214434 (= b_free!5671 (not b_next!5671))))

(declare-fun tp!20101 () Bool)

(declare-fun b_and!12575 () Bool)

(assert (=> b!214434 (= tp!20101 b_and!12575)))

(declare-fun b!214429 () Bool)

(declare-fun res!104971 () Bool)

(declare-fun e!139452 () Bool)

(assert (=> b!214429 (=> (not res!104971) (not e!139452))))

(declare-datatypes ((V!7025 0))(
  ( (V!7026 (val!2811 Int)) )
))
(declare-datatypes ((ValueCell!2423 0))(
  ( (ValueCellFull!2423 (v!4830 V!7025)) (EmptyCell!2423) )
))
(declare-datatypes ((array!10275 0))(
  ( (array!10276 (arr!4873 (Array (_ BitVec 32) ValueCell!2423)) (size!5200 (_ BitVec 32))) )
))
(declare-datatypes ((array!10277 0))(
  ( (array!10278 (arr!4874 (Array (_ BitVec 32) (_ BitVec 64))) (size!5201 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2746 0))(
  ( (LongMapFixedSize!2747 (defaultEntry!4023 Int) (mask!9682 (_ BitVec 32)) (extraKeys!3760 (_ BitVec 32)) (zeroValue!3864 V!7025) (minValue!3864 V!7025) (_size!1422 (_ BitVec 32)) (_keys!6041 array!10277) (_values!4006 array!10275) (_vacant!1422 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2746)

(assert (=> b!214429 (= res!104971 (and (bvsge (mask!9682 thiss!1504) #b00000000000000000000000000000000) (= (size!5201 (_keys!6041 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9682 thiss!1504)))))))

(declare-fun b!214430 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214430 (= e!139452 (not (validKeyInArray!0 key!932)))))

(declare-fun mapIsEmpty!9415 () Bool)

(declare-fun mapRes!9415 () Bool)

(assert (=> mapIsEmpty!9415 mapRes!9415))

(declare-fun mapNonEmpty!9415 () Bool)

(declare-fun tp!20100 () Bool)

(declare-fun e!139450 () Bool)

(assert (=> mapNonEmpty!9415 (= mapRes!9415 (and tp!20100 e!139450))))

(declare-fun mapValue!9415 () ValueCell!2423)

(declare-fun mapKey!9415 () (_ BitVec 32))

(declare-fun mapRest!9415 () (Array (_ BitVec 32) ValueCell!2423))

(assert (=> mapNonEmpty!9415 (= (arr!4873 (_values!4006 thiss!1504)) (store mapRest!9415 mapKey!9415 mapValue!9415))))

(declare-fun b!214431 () Bool)

(declare-fun res!104974 () Bool)

(assert (=> b!214431 (=> (not res!104974) (not e!139452))))

(assert (=> b!214431 (= res!104974 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214432 () Bool)

(declare-fun e!139449 () Bool)

(declare-fun e!139451 () Bool)

(assert (=> b!214432 (= e!139449 (and e!139451 mapRes!9415))))

(declare-fun condMapEmpty!9415 () Bool)

(declare-fun mapDefault!9415 () ValueCell!2423)

(assert (=> b!214432 (= condMapEmpty!9415 (= (arr!4873 (_values!4006 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2423)) mapDefault!9415)))))

(declare-fun res!104973 () Bool)

(assert (=> start!21304 (=> (not res!104973) (not e!139452))))

(declare-fun valid!1145 (LongMapFixedSize!2746) Bool)

(assert (=> start!21304 (= res!104973 (valid!1145 thiss!1504))))

(assert (=> start!21304 e!139452))

(declare-fun e!139448 () Bool)

(assert (=> start!21304 e!139448))

(assert (=> start!21304 true))

(declare-fun b!214433 () Bool)

(declare-fun tp_is_empty!5533 () Bool)

(assert (=> b!214433 (= e!139451 tp_is_empty!5533)))

(declare-fun array_inv!3201 (array!10277) Bool)

(declare-fun array_inv!3202 (array!10275) Bool)

(assert (=> b!214434 (= e!139448 (and tp!20101 tp_is_empty!5533 (array_inv!3201 (_keys!6041 thiss!1504)) (array_inv!3202 (_values!4006 thiss!1504)) e!139449))))

(declare-fun b!214435 () Bool)

(declare-fun res!104972 () Bool)

(assert (=> b!214435 (=> (not res!104972) (not e!139452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214435 (= res!104972 (validMask!0 (mask!9682 thiss!1504)))))

(declare-fun b!214436 () Bool)

(assert (=> b!214436 (= e!139450 tp_is_empty!5533)))

(assert (= (and start!21304 res!104973) b!214431))

(assert (= (and b!214431 res!104974) b!214435))

(assert (= (and b!214435 res!104972) b!214429))

(assert (= (and b!214429 res!104971) b!214430))

(assert (= (and b!214432 condMapEmpty!9415) mapIsEmpty!9415))

(assert (= (and b!214432 (not condMapEmpty!9415)) mapNonEmpty!9415))

(get-info :version)

(assert (= (and mapNonEmpty!9415 ((_ is ValueCellFull!2423) mapValue!9415)) b!214436))

(assert (= (and b!214432 ((_ is ValueCellFull!2423) mapDefault!9415)) b!214433))

(assert (= b!214434 b!214432))

(assert (= start!21304 b!214434))

(declare-fun m!242265 () Bool)

(assert (=> b!214435 m!242265))

(declare-fun m!242267 () Bool)

(assert (=> mapNonEmpty!9415 m!242267))

(declare-fun m!242269 () Bool)

(assert (=> b!214430 m!242269))

(declare-fun m!242271 () Bool)

(assert (=> b!214434 m!242271))

(declare-fun m!242273 () Bool)

(assert (=> b!214434 m!242273))

(declare-fun m!242275 () Bool)

(assert (=> start!21304 m!242275))

(check-sat tp_is_empty!5533 (not start!21304) (not b!214435) (not b_next!5671) (not b!214434) (not b!214430) b_and!12575 (not mapNonEmpty!9415))
(check-sat b_and!12575 (not b_next!5671))
(get-model)

(declare-fun d!58381 () Bool)

(assert (=> d!58381 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!214430 d!58381))

(declare-fun d!58383 () Bool)

(assert (=> d!58383 (= (array_inv!3201 (_keys!6041 thiss!1504)) (bvsge (size!5201 (_keys!6041 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214434 d!58383))

(declare-fun d!58385 () Bool)

(assert (=> d!58385 (= (array_inv!3202 (_values!4006 thiss!1504)) (bvsge (size!5200 (_values!4006 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214434 d!58385))

(declare-fun d!58387 () Bool)

(assert (=> d!58387 (= (validMask!0 (mask!9682 thiss!1504)) (and (or (= (mask!9682 thiss!1504) #b00000000000000000000000000000111) (= (mask!9682 thiss!1504) #b00000000000000000000000000001111) (= (mask!9682 thiss!1504) #b00000000000000000000000000011111) (= (mask!9682 thiss!1504) #b00000000000000000000000000111111) (= (mask!9682 thiss!1504) #b00000000000000000000000001111111) (= (mask!9682 thiss!1504) #b00000000000000000000000011111111) (= (mask!9682 thiss!1504) #b00000000000000000000000111111111) (= (mask!9682 thiss!1504) #b00000000000000000000001111111111) (= (mask!9682 thiss!1504) #b00000000000000000000011111111111) (= (mask!9682 thiss!1504) #b00000000000000000000111111111111) (= (mask!9682 thiss!1504) #b00000000000000000001111111111111) (= (mask!9682 thiss!1504) #b00000000000000000011111111111111) (= (mask!9682 thiss!1504) #b00000000000000000111111111111111) (= (mask!9682 thiss!1504) #b00000000000000001111111111111111) (= (mask!9682 thiss!1504) #b00000000000000011111111111111111) (= (mask!9682 thiss!1504) #b00000000000000111111111111111111) (= (mask!9682 thiss!1504) #b00000000000001111111111111111111) (= (mask!9682 thiss!1504) #b00000000000011111111111111111111) (= (mask!9682 thiss!1504) #b00000000000111111111111111111111) (= (mask!9682 thiss!1504) #b00000000001111111111111111111111) (= (mask!9682 thiss!1504) #b00000000011111111111111111111111) (= (mask!9682 thiss!1504) #b00000000111111111111111111111111) (= (mask!9682 thiss!1504) #b00000001111111111111111111111111) (= (mask!9682 thiss!1504) #b00000011111111111111111111111111) (= (mask!9682 thiss!1504) #b00000111111111111111111111111111) (= (mask!9682 thiss!1504) #b00001111111111111111111111111111) (= (mask!9682 thiss!1504) #b00011111111111111111111111111111) (= (mask!9682 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9682 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214435 d!58387))

(declare-fun d!58389 () Bool)

(declare-fun res!105005 () Bool)

(declare-fun e!139491 () Bool)

(assert (=> d!58389 (=> (not res!105005) (not e!139491))))

(declare-fun simpleValid!210 (LongMapFixedSize!2746) Bool)

(assert (=> d!58389 (= res!105005 (simpleValid!210 thiss!1504))))

(assert (=> d!58389 (= (valid!1145 thiss!1504) e!139491)))

(declare-fun b!214491 () Bool)

(declare-fun res!105006 () Bool)

(assert (=> b!214491 (=> (not res!105006) (not e!139491))))

(declare-fun arrayCountValidKeys!0 (array!10277 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214491 (= res!105006 (= (arrayCountValidKeys!0 (_keys!6041 thiss!1504) #b00000000000000000000000000000000 (size!5201 (_keys!6041 thiss!1504))) (_size!1422 thiss!1504)))))

(declare-fun b!214492 () Bool)

(declare-fun res!105007 () Bool)

(assert (=> b!214492 (=> (not res!105007) (not e!139491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10277 (_ BitVec 32)) Bool)

(assert (=> b!214492 (= res!105007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6041 thiss!1504) (mask!9682 thiss!1504)))))

(declare-fun b!214493 () Bool)

(declare-datatypes ((List!3064 0))(
  ( (Nil!3061) (Cons!3060 (h!3702 (_ BitVec 64)) (t!8011 List!3064)) )
))
(declare-fun arrayNoDuplicates!0 (array!10277 (_ BitVec 32) List!3064) Bool)

(assert (=> b!214493 (= e!139491 (arrayNoDuplicates!0 (_keys!6041 thiss!1504) #b00000000000000000000000000000000 Nil!3061))))

(assert (= (and d!58389 res!105005) b!214491))

(assert (= (and b!214491 res!105006) b!214492))

(assert (= (and b!214492 res!105007) b!214493))

(declare-fun m!242301 () Bool)

(assert (=> d!58389 m!242301))

(declare-fun m!242303 () Bool)

(assert (=> b!214491 m!242303))

(declare-fun m!242305 () Bool)

(assert (=> b!214492 m!242305))

(declare-fun m!242307 () Bool)

(assert (=> b!214493 m!242307))

(assert (=> start!21304 d!58389))

(declare-fun b!214501 () Bool)

(declare-fun e!139496 () Bool)

(assert (=> b!214501 (= e!139496 tp_is_empty!5533)))

(declare-fun mapNonEmpty!9424 () Bool)

(declare-fun mapRes!9424 () Bool)

(declare-fun tp!20116 () Bool)

(declare-fun e!139497 () Bool)

(assert (=> mapNonEmpty!9424 (= mapRes!9424 (and tp!20116 e!139497))))

(declare-fun mapKey!9424 () (_ BitVec 32))

(declare-fun mapValue!9424 () ValueCell!2423)

(declare-fun mapRest!9424 () (Array (_ BitVec 32) ValueCell!2423))

(assert (=> mapNonEmpty!9424 (= mapRest!9415 (store mapRest!9424 mapKey!9424 mapValue!9424))))

(declare-fun b!214500 () Bool)

(assert (=> b!214500 (= e!139497 tp_is_empty!5533)))

(declare-fun condMapEmpty!9424 () Bool)

(declare-fun mapDefault!9424 () ValueCell!2423)

(assert (=> mapNonEmpty!9415 (= condMapEmpty!9424 (= mapRest!9415 ((as const (Array (_ BitVec 32) ValueCell!2423)) mapDefault!9424)))))

(assert (=> mapNonEmpty!9415 (= tp!20100 (and e!139496 mapRes!9424))))

(declare-fun mapIsEmpty!9424 () Bool)

(assert (=> mapIsEmpty!9424 mapRes!9424))

(assert (= (and mapNonEmpty!9415 condMapEmpty!9424) mapIsEmpty!9424))

(assert (= (and mapNonEmpty!9415 (not condMapEmpty!9424)) mapNonEmpty!9424))

(assert (= (and mapNonEmpty!9424 ((_ is ValueCellFull!2423) mapValue!9424)) b!214500))

(assert (= (and mapNonEmpty!9415 ((_ is ValueCellFull!2423) mapDefault!9424)) b!214501))

(declare-fun m!242309 () Bool)

(assert (=> mapNonEmpty!9424 m!242309))

(check-sat (not b!214491) (not mapNonEmpty!9424) tp_is_empty!5533 (not b!214493) (not b!214492) (not d!58389) (not b_next!5671) b_and!12575)
(check-sat b_and!12575 (not b_next!5671))
