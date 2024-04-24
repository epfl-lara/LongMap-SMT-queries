; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21352 () Bool)

(assert start!21352)

(declare-fun b!214723 () Bool)

(declare-fun b_free!5689 () Bool)

(declare-fun b_next!5689 () Bool)

(assert (=> b!214723 (= b_free!5689 (not b_next!5689))))

(declare-fun tp!20163 () Bool)

(declare-fun b_and!12593 () Bool)

(assert (=> b!214723 (= tp!20163 b_and!12593)))

(declare-fun tp_is_empty!5551 () Bool)

(declare-datatypes ((V!7049 0))(
  ( (V!7050 (val!2820 Int)) )
))
(declare-datatypes ((ValueCell!2432 0))(
  ( (ValueCellFull!2432 (v!4839 V!7049)) (EmptyCell!2432) )
))
(declare-datatypes ((array!10317 0))(
  ( (array!10318 (arr!4891 (Array (_ BitVec 32) ValueCell!2432)) (size!5218 (_ BitVec 32))) )
))
(declare-datatypes ((array!10319 0))(
  ( (array!10320 (arr!4892 (Array (_ BitVec 32) (_ BitVec 64))) (size!5219 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2764 0))(
  ( (LongMapFixedSize!2765 (defaultEntry!4032 Int) (mask!9702 (_ BitVec 32)) (extraKeys!3769 (_ BitVec 32)) (zeroValue!3873 V!7049) (minValue!3873 V!7049) (_size!1431 (_ BitVec 32)) (_keys!6052 array!10319) (_values!4015 array!10317) (_vacant!1431 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2764)

(declare-fun e!139654 () Bool)

(declare-fun e!139657 () Bool)

(declare-fun array_inv!3213 (array!10319) Bool)

(declare-fun array_inv!3214 (array!10317) Bool)

(assert (=> b!214723 (= e!139657 (and tp!20163 tp_is_empty!5551 (array_inv!3213 (_keys!6052 thiss!1504)) (array_inv!3214 (_values!4015 thiss!1504)) e!139654))))

(declare-fun b!214724 () Bool)

(declare-fun res!105097 () Bool)

(declare-fun e!139659 () Bool)

(assert (=> b!214724 (=> (not res!105097) (not e!139659))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214724 (= res!105097 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!9451 () Bool)

(declare-fun mapRes!9451 () Bool)

(declare-fun tp!20164 () Bool)

(declare-fun e!139656 () Bool)

(assert (=> mapNonEmpty!9451 (= mapRes!9451 (and tp!20164 e!139656))))

(declare-fun mapValue!9451 () ValueCell!2432)

(declare-fun mapKey!9451 () (_ BitVec 32))

(declare-fun mapRest!9451 () (Array (_ BitVec 32) ValueCell!2432))

(assert (=> mapNonEmpty!9451 (= (arr!4891 (_values!4015 thiss!1504)) (store mapRest!9451 mapKey!9451 mapValue!9451))))

(declare-fun b!214725 () Bool)

(declare-fun res!105099 () Bool)

(assert (=> b!214725 (=> (not res!105099) (not e!139659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214725 (= res!105099 (validMask!0 (mask!9702 thiss!1504)))))

(declare-fun b!214726 () Bool)

(declare-fun e!139658 () Bool)

(assert (=> b!214726 (= e!139654 (and e!139658 mapRes!9451))))

(declare-fun condMapEmpty!9451 () Bool)

(declare-fun mapDefault!9451 () ValueCell!2432)

(assert (=> b!214726 (= condMapEmpty!9451 (= (arr!4891 (_values!4015 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2432)) mapDefault!9451)))))

(declare-fun mapIsEmpty!9451 () Bool)

(assert (=> mapIsEmpty!9451 mapRes!9451))

(declare-fun b!214727 () Bool)

(assert (=> b!214727 (= e!139658 tp_is_empty!5551)))

(declare-fun res!105098 () Bool)

(assert (=> start!21352 (=> (not res!105098) (not e!139659))))

(declare-fun valid!1149 (LongMapFixedSize!2764) Bool)

(assert (=> start!21352 (= res!105098 (valid!1149 thiss!1504))))

(assert (=> start!21352 e!139659))

(assert (=> start!21352 e!139657))

(assert (=> start!21352 true))

(declare-fun b!214728 () Bool)

(declare-fun res!105100 () Bool)

(assert (=> b!214728 (=> (not res!105100) (not e!139659))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!711 0))(
  ( (MissingZero!711 (index!5014 (_ BitVec 32))) (Found!711 (index!5015 (_ BitVec 32))) (Intermediate!711 (undefined!1523 Bool) (index!5016 (_ BitVec 32)) (x!22386 (_ BitVec 32))) (Undefined!711) (MissingVacant!711 (index!5017 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10319 (_ BitVec 32)) SeekEntryResult!711)

(assert (=> b!214728 (= res!105100 (not (= (seekEntryOrOpen!0 key!932 (_keys!6052 thiss!1504) (mask!9702 thiss!1504)) (MissingZero!711 index!297))))))

(declare-fun b!214729 () Bool)

(assert (=> b!214729 (= e!139656 tp_is_empty!5551)))

(declare-fun b!214730 () Bool)

(assert (=> b!214730 (= e!139659 (and (bvsge (mask!9702 thiss!1504) #b00000000000000000000000000000000) (not (= (size!5219 (_keys!6052 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9702 thiss!1504))))))))

(assert (= (and start!21352 res!105098) b!214724))

(assert (= (and b!214724 res!105097) b!214728))

(assert (= (and b!214728 res!105100) b!214725))

(assert (= (and b!214725 res!105099) b!214730))

(assert (= (and b!214726 condMapEmpty!9451) mapIsEmpty!9451))

(assert (= (and b!214726 (not condMapEmpty!9451)) mapNonEmpty!9451))

(get-info :version)

(assert (= (and mapNonEmpty!9451 ((_ is ValueCellFull!2432) mapValue!9451)) b!214729))

(assert (= (and b!214726 ((_ is ValueCellFull!2432) mapDefault!9451)) b!214727))

(assert (= b!214723 b!214726))

(assert (= start!21352 b!214723))

(declare-fun m!242431 () Bool)

(assert (=> start!21352 m!242431))

(declare-fun m!242433 () Bool)

(assert (=> mapNonEmpty!9451 m!242433))

(declare-fun m!242435 () Bool)

(assert (=> b!214728 m!242435))

(declare-fun m!242437 () Bool)

(assert (=> b!214725 m!242437))

(declare-fun m!242439 () Bool)

(assert (=> b!214723 m!242439))

(declare-fun m!242441 () Bool)

(assert (=> b!214723 m!242441))

(check-sat (not mapNonEmpty!9451) tp_is_empty!5551 b_and!12593 (not b!214725) (not start!21352) (not b!214723) (not b_next!5689) (not b!214728))
(check-sat b_and!12593 (not b_next!5689))
(get-model)

(declare-fun d!58417 () Bool)

(assert (=> d!58417 (= (array_inv!3213 (_keys!6052 thiss!1504)) (bvsge (size!5219 (_keys!6052 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214723 d!58417))

(declare-fun d!58419 () Bool)

(assert (=> d!58419 (= (array_inv!3214 (_values!4015 thiss!1504)) (bvsge (size!5218 (_values!4015 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214723 d!58419))

(declare-fun d!58421 () Bool)

(declare-fun res!105131 () Bool)

(declare-fun e!139698 () Bool)

(assert (=> d!58421 (=> (not res!105131) (not e!139698))))

(declare-fun simpleValid!213 (LongMapFixedSize!2764) Bool)

(assert (=> d!58421 (= res!105131 (simpleValid!213 thiss!1504))))

(assert (=> d!58421 (= (valid!1149 thiss!1504) e!139698)))

(declare-fun b!214785 () Bool)

(declare-fun res!105132 () Bool)

(assert (=> b!214785 (=> (not res!105132) (not e!139698))))

(declare-fun arrayCountValidKeys!0 (array!10319 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214785 (= res!105132 (= (arrayCountValidKeys!0 (_keys!6052 thiss!1504) #b00000000000000000000000000000000 (size!5219 (_keys!6052 thiss!1504))) (_size!1431 thiss!1504)))))

(declare-fun b!214786 () Bool)

(declare-fun res!105133 () Bool)

(assert (=> b!214786 (=> (not res!105133) (not e!139698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10319 (_ BitVec 32)) Bool)

(assert (=> b!214786 (= res!105133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6052 thiss!1504) (mask!9702 thiss!1504)))))

(declare-fun b!214787 () Bool)

(declare-datatypes ((List!3067 0))(
  ( (Nil!3064) (Cons!3063 (h!3705 (_ BitVec 64)) (t!8014 List!3067)) )
))
(declare-fun arrayNoDuplicates!0 (array!10319 (_ BitVec 32) List!3067) Bool)

(assert (=> b!214787 (= e!139698 (arrayNoDuplicates!0 (_keys!6052 thiss!1504) #b00000000000000000000000000000000 Nil!3064))))

(assert (= (and d!58421 res!105131) b!214785))

(assert (= (and b!214785 res!105132) b!214786))

(assert (= (and b!214786 res!105133) b!214787))

(declare-fun m!242467 () Bool)

(assert (=> d!58421 m!242467))

(declare-fun m!242469 () Bool)

(assert (=> b!214785 m!242469))

(declare-fun m!242471 () Bool)

(assert (=> b!214786 m!242471))

(declare-fun m!242473 () Bool)

(assert (=> b!214787 m!242473))

(assert (=> start!21352 d!58421))

(declare-fun d!58423 () Bool)

(assert (=> d!58423 (= (validMask!0 (mask!9702 thiss!1504)) (and (or (= (mask!9702 thiss!1504) #b00000000000000000000000000000111) (= (mask!9702 thiss!1504) #b00000000000000000000000000001111) (= (mask!9702 thiss!1504) #b00000000000000000000000000011111) (= (mask!9702 thiss!1504) #b00000000000000000000000000111111) (= (mask!9702 thiss!1504) #b00000000000000000000000001111111) (= (mask!9702 thiss!1504) #b00000000000000000000000011111111) (= (mask!9702 thiss!1504) #b00000000000000000000000111111111) (= (mask!9702 thiss!1504) #b00000000000000000000001111111111) (= (mask!9702 thiss!1504) #b00000000000000000000011111111111) (= (mask!9702 thiss!1504) #b00000000000000000000111111111111) (= (mask!9702 thiss!1504) #b00000000000000000001111111111111) (= (mask!9702 thiss!1504) #b00000000000000000011111111111111) (= (mask!9702 thiss!1504) #b00000000000000000111111111111111) (= (mask!9702 thiss!1504) #b00000000000000001111111111111111) (= (mask!9702 thiss!1504) #b00000000000000011111111111111111) (= (mask!9702 thiss!1504) #b00000000000000111111111111111111) (= (mask!9702 thiss!1504) #b00000000000001111111111111111111) (= (mask!9702 thiss!1504) #b00000000000011111111111111111111) (= (mask!9702 thiss!1504) #b00000000000111111111111111111111) (= (mask!9702 thiss!1504) #b00000000001111111111111111111111) (= (mask!9702 thiss!1504) #b00000000011111111111111111111111) (= (mask!9702 thiss!1504) #b00000000111111111111111111111111) (= (mask!9702 thiss!1504) #b00000001111111111111111111111111) (= (mask!9702 thiss!1504) #b00000011111111111111111111111111) (= (mask!9702 thiss!1504) #b00000111111111111111111111111111) (= (mask!9702 thiss!1504) #b00001111111111111111111111111111) (= (mask!9702 thiss!1504) #b00011111111111111111111111111111) (= (mask!9702 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9702 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214725 d!58423))

(declare-fun e!139705 () SeekEntryResult!711)

(declare-fun b!214800 () Bool)

(declare-fun lt!110874 () SeekEntryResult!711)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10319 (_ BitVec 32)) SeekEntryResult!711)

(assert (=> b!214800 (= e!139705 (seekKeyOrZeroReturnVacant!0 (x!22386 lt!110874) (index!5016 lt!110874) (index!5016 lt!110874) key!932 (_keys!6052 thiss!1504) (mask!9702 thiss!1504)))))

(declare-fun b!214801 () Bool)

(declare-fun e!139706 () SeekEntryResult!711)

(assert (=> b!214801 (= e!139706 Undefined!711)))

(declare-fun b!214802 () Bool)

(declare-fun e!139707 () SeekEntryResult!711)

(assert (=> b!214802 (= e!139706 e!139707)))

(declare-fun lt!110875 () (_ BitVec 64))

(assert (=> b!214802 (= lt!110875 (select (arr!4892 (_keys!6052 thiss!1504)) (index!5016 lt!110874)))))

(declare-fun c!36085 () Bool)

(assert (=> b!214802 (= c!36085 (= lt!110875 key!932))))

(declare-fun b!214803 () Bool)

(assert (=> b!214803 (= e!139707 (Found!711 (index!5016 lt!110874)))))

(declare-fun b!214804 () Bool)

(assert (=> b!214804 (= e!139705 (MissingZero!711 (index!5016 lt!110874)))))

(declare-fun d!58425 () Bool)

(declare-fun lt!110876 () SeekEntryResult!711)

(assert (=> d!58425 (and (or ((_ is Undefined!711) lt!110876) (not ((_ is Found!711) lt!110876)) (and (bvsge (index!5015 lt!110876) #b00000000000000000000000000000000) (bvslt (index!5015 lt!110876) (size!5219 (_keys!6052 thiss!1504))))) (or ((_ is Undefined!711) lt!110876) ((_ is Found!711) lt!110876) (not ((_ is MissingZero!711) lt!110876)) (and (bvsge (index!5014 lt!110876) #b00000000000000000000000000000000) (bvslt (index!5014 lt!110876) (size!5219 (_keys!6052 thiss!1504))))) (or ((_ is Undefined!711) lt!110876) ((_ is Found!711) lt!110876) ((_ is MissingZero!711) lt!110876) (not ((_ is MissingVacant!711) lt!110876)) (and (bvsge (index!5017 lt!110876) #b00000000000000000000000000000000) (bvslt (index!5017 lt!110876) (size!5219 (_keys!6052 thiss!1504))))) (or ((_ is Undefined!711) lt!110876) (ite ((_ is Found!711) lt!110876) (= (select (arr!4892 (_keys!6052 thiss!1504)) (index!5015 lt!110876)) key!932) (ite ((_ is MissingZero!711) lt!110876) (= (select (arr!4892 (_keys!6052 thiss!1504)) (index!5014 lt!110876)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!711) lt!110876) (= (select (arr!4892 (_keys!6052 thiss!1504)) (index!5017 lt!110876)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58425 (= lt!110876 e!139706)))

(declare-fun c!36086 () Bool)

(assert (=> d!58425 (= c!36086 (and ((_ is Intermediate!711) lt!110874) (undefined!1523 lt!110874)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10319 (_ BitVec 32)) SeekEntryResult!711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58425 (= lt!110874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9702 thiss!1504)) key!932 (_keys!6052 thiss!1504) (mask!9702 thiss!1504)))))

(assert (=> d!58425 (validMask!0 (mask!9702 thiss!1504))))

(assert (=> d!58425 (= (seekEntryOrOpen!0 key!932 (_keys!6052 thiss!1504) (mask!9702 thiss!1504)) lt!110876)))

(declare-fun b!214805 () Bool)

(declare-fun c!36087 () Bool)

(assert (=> b!214805 (= c!36087 (= lt!110875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!214805 (= e!139707 e!139705)))

(assert (= (and d!58425 c!36086) b!214801))

(assert (= (and d!58425 (not c!36086)) b!214802))

(assert (= (and b!214802 c!36085) b!214803))

(assert (= (and b!214802 (not c!36085)) b!214805))

(assert (= (and b!214805 c!36087) b!214804))

(assert (= (and b!214805 (not c!36087)) b!214800))

(declare-fun m!242475 () Bool)

(assert (=> b!214800 m!242475))

(declare-fun m!242477 () Bool)

(assert (=> b!214802 m!242477))

(declare-fun m!242479 () Bool)

(assert (=> d!58425 m!242479))

(declare-fun m!242481 () Bool)

(assert (=> d!58425 m!242481))

(declare-fun m!242483 () Bool)

(assert (=> d!58425 m!242483))

(assert (=> d!58425 m!242437))

(assert (=> d!58425 m!242479))

(declare-fun m!242485 () Bool)

(assert (=> d!58425 m!242485))

(declare-fun m!242487 () Bool)

(assert (=> d!58425 m!242487))

(assert (=> b!214728 d!58425))

(declare-fun b!214812 () Bool)

(declare-fun e!139713 () Bool)

(assert (=> b!214812 (= e!139713 tp_is_empty!5551)))

(declare-fun condMapEmpty!9460 () Bool)

(declare-fun mapDefault!9460 () ValueCell!2432)

(assert (=> mapNonEmpty!9451 (= condMapEmpty!9460 (= mapRest!9451 ((as const (Array (_ BitVec 32) ValueCell!2432)) mapDefault!9460)))))

(declare-fun e!139712 () Bool)

(declare-fun mapRes!9460 () Bool)

(assert (=> mapNonEmpty!9451 (= tp!20164 (and e!139712 mapRes!9460))))

(declare-fun b!214813 () Bool)

(assert (=> b!214813 (= e!139712 tp_is_empty!5551)))

(declare-fun mapNonEmpty!9460 () Bool)

(declare-fun tp!20179 () Bool)

(assert (=> mapNonEmpty!9460 (= mapRes!9460 (and tp!20179 e!139713))))

(declare-fun mapKey!9460 () (_ BitVec 32))

(declare-fun mapRest!9460 () (Array (_ BitVec 32) ValueCell!2432))

(declare-fun mapValue!9460 () ValueCell!2432)

(assert (=> mapNonEmpty!9460 (= mapRest!9451 (store mapRest!9460 mapKey!9460 mapValue!9460))))

(declare-fun mapIsEmpty!9460 () Bool)

(assert (=> mapIsEmpty!9460 mapRes!9460))

(assert (= (and mapNonEmpty!9451 condMapEmpty!9460) mapIsEmpty!9460))

(assert (= (and mapNonEmpty!9451 (not condMapEmpty!9460)) mapNonEmpty!9460))

(assert (= (and mapNonEmpty!9460 ((_ is ValueCellFull!2432) mapValue!9460)) b!214812))

(assert (= (and mapNonEmpty!9451 ((_ is ValueCellFull!2432) mapDefault!9460)) b!214813))

(declare-fun m!242489 () Bool)

(assert (=> mapNonEmpty!9460 m!242489))

(check-sat tp_is_empty!5551 (not b!214787) (not b!214786) b_and!12593 (not d!58425) (not b!214800) (not d!58421) (not b_next!5689) (not b!214785) (not mapNonEmpty!9460))
(check-sat b_and!12593 (not b_next!5689))
(get-model)

(declare-fun b!214824 () Bool)

(declare-fun e!139725 () Bool)

(declare-fun call!20313 () Bool)

(assert (=> b!214824 (= e!139725 call!20313)))

(declare-fun d!58427 () Bool)

(declare-fun res!105140 () Bool)

(declare-fun e!139722 () Bool)

(assert (=> d!58427 (=> res!105140 e!139722)))

(assert (=> d!58427 (= res!105140 (bvsge #b00000000000000000000000000000000 (size!5219 (_keys!6052 thiss!1504))))))

(assert (=> d!58427 (= (arrayNoDuplicates!0 (_keys!6052 thiss!1504) #b00000000000000000000000000000000 Nil!3064) e!139722)))

(declare-fun b!214825 () Bool)

(declare-fun e!139724 () Bool)

(assert (=> b!214825 (= e!139722 e!139724)))

(declare-fun res!105141 () Bool)

(assert (=> b!214825 (=> (not res!105141) (not e!139724))))

(declare-fun e!139723 () Bool)

(assert (=> b!214825 (= res!105141 (not e!139723))))

(declare-fun res!105142 () Bool)

(assert (=> b!214825 (=> (not res!105142) (not e!139723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!214825 (= res!105142 (validKeyInArray!0 (select (arr!4892 (_keys!6052 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214826 () Bool)

(declare-fun contains!1410 (List!3067 (_ BitVec 64)) Bool)

(assert (=> b!214826 (= e!139723 (contains!1410 Nil!3064 (select (arr!4892 (_keys!6052 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20310 () Bool)

(declare-fun c!36090 () Bool)

(assert (=> bm!20310 (= call!20313 (arrayNoDuplicates!0 (_keys!6052 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36090 (Cons!3063 (select (arr!4892 (_keys!6052 thiss!1504)) #b00000000000000000000000000000000) Nil!3064) Nil!3064)))))

(declare-fun b!214827 () Bool)

(assert (=> b!214827 (= e!139724 e!139725)))

(assert (=> b!214827 (= c!36090 (validKeyInArray!0 (select (arr!4892 (_keys!6052 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!214828 () Bool)

(assert (=> b!214828 (= e!139725 call!20313)))

(assert (= (and d!58427 (not res!105140)) b!214825))

(assert (= (and b!214825 res!105142) b!214826))

(assert (= (and b!214825 res!105141) b!214827))

(assert (= (and b!214827 c!36090) b!214824))

(assert (= (and b!214827 (not c!36090)) b!214828))

(assert (= (or b!214824 b!214828) bm!20310))

(declare-fun m!242491 () Bool)

(assert (=> b!214825 m!242491))

(assert (=> b!214825 m!242491))

(declare-fun m!242493 () Bool)

(assert (=> b!214825 m!242493))

(assert (=> b!214826 m!242491))

(assert (=> b!214826 m!242491))

(declare-fun m!242495 () Bool)

(assert (=> b!214826 m!242495))

(assert (=> bm!20310 m!242491))

(declare-fun m!242497 () Bool)

(assert (=> bm!20310 m!242497))

(assert (=> b!214827 m!242491))

(assert (=> b!214827 m!242491))

(assert (=> b!214827 m!242493))

(assert (=> b!214787 d!58427))

(declare-fun b!214841 () Bool)

(declare-fun c!36097 () Bool)

(declare-fun lt!110882 () (_ BitVec 64))

(assert (=> b!214841 (= c!36097 (= lt!110882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139733 () SeekEntryResult!711)

(declare-fun e!139734 () SeekEntryResult!711)

(assert (=> b!214841 (= e!139733 e!139734)))

(declare-fun b!214842 () Bool)

(assert (=> b!214842 (= e!139733 (Found!711 (index!5016 lt!110874)))))

(declare-fun b!214843 () Bool)

(declare-fun e!139732 () SeekEntryResult!711)

(assert (=> b!214843 (= e!139732 e!139733)))

(declare-fun c!36099 () Bool)

(assert (=> b!214843 (= c!36099 (= lt!110882 key!932))))

(declare-fun b!214844 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214844 (= e!139734 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22386 lt!110874) #b00000000000000000000000000000001) (nextIndex!0 (index!5016 lt!110874) (bvadd (x!22386 lt!110874) #b00000000000000000000000000000001) (mask!9702 thiss!1504)) (index!5016 lt!110874) key!932 (_keys!6052 thiss!1504) (mask!9702 thiss!1504)))))

(declare-fun d!58429 () Bool)

(declare-fun lt!110881 () SeekEntryResult!711)

(assert (=> d!58429 (and (or ((_ is Undefined!711) lt!110881) (not ((_ is Found!711) lt!110881)) (and (bvsge (index!5015 lt!110881) #b00000000000000000000000000000000) (bvslt (index!5015 lt!110881) (size!5219 (_keys!6052 thiss!1504))))) (or ((_ is Undefined!711) lt!110881) ((_ is Found!711) lt!110881) (not ((_ is MissingVacant!711) lt!110881)) (not (= (index!5017 lt!110881) (index!5016 lt!110874))) (and (bvsge (index!5017 lt!110881) #b00000000000000000000000000000000) (bvslt (index!5017 lt!110881) (size!5219 (_keys!6052 thiss!1504))))) (or ((_ is Undefined!711) lt!110881) (ite ((_ is Found!711) lt!110881) (= (select (arr!4892 (_keys!6052 thiss!1504)) (index!5015 lt!110881)) key!932) (and ((_ is MissingVacant!711) lt!110881) (= (index!5017 lt!110881) (index!5016 lt!110874)) (= (select (arr!4892 (_keys!6052 thiss!1504)) (index!5017 lt!110881)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58429 (= lt!110881 e!139732)))

(declare-fun c!36098 () Bool)

(assert (=> d!58429 (= c!36098 (bvsge (x!22386 lt!110874) #b01111111111111111111111111111110))))

(assert (=> d!58429 (= lt!110882 (select (arr!4892 (_keys!6052 thiss!1504)) (index!5016 lt!110874)))))

(assert (=> d!58429 (validMask!0 (mask!9702 thiss!1504))))

(assert (=> d!58429 (= (seekKeyOrZeroReturnVacant!0 (x!22386 lt!110874) (index!5016 lt!110874) (index!5016 lt!110874) key!932 (_keys!6052 thiss!1504) (mask!9702 thiss!1504)) lt!110881)))

(declare-fun b!214845 () Bool)

(assert (=> b!214845 (= e!139732 Undefined!711)))

(declare-fun b!214846 () Bool)

(assert (=> b!214846 (= e!139734 (MissingVacant!711 (index!5016 lt!110874)))))

(assert (= (and d!58429 c!36098) b!214845))

(assert (= (and d!58429 (not c!36098)) b!214843))

(assert (= (and b!214843 c!36099) b!214842))

(assert (= (and b!214843 (not c!36099)) b!214841))

(assert (= (and b!214841 c!36097) b!214846))

(assert (= (and b!214841 (not c!36097)) b!214844))

(declare-fun m!242499 () Bool)

(assert (=> b!214844 m!242499))

(assert (=> b!214844 m!242499))

(declare-fun m!242501 () Bool)

(assert (=> b!214844 m!242501))

(declare-fun m!242503 () Bool)

(assert (=> d!58429 m!242503))

(declare-fun m!242505 () Bool)

(assert (=> d!58429 m!242505))

(assert (=> d!58429 m!242477))

(assert (=> d!58429 m!242437))

(assert (=> b!214800 d!58429))

(declare-fun b!214865 () Bool)

(declare-fun e!139749 () Bool)

(declare-fun lt!110887 () SeekEntryResult!711)

(assert (=> b!214865 (= e!139749 (bvsge (x!22386 lt!110887) #b01111111111111111111111111111110))))

(declare-fun b!214866 () Bool)

(declare-fun e!139747 () SeekEntryResult!711)

(assert (=> b!214866 (= e!139747 (Intermediate!711 true (toIndex!0 key!932 (mask!9702 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!214867 () Bool)

(assert (=> b!214867 (and (bvsge (index!5016 lt!110887) #b00000000000000000000000000000000) (bvslt (index!5016 lt!110887) (size!5219 (_keys!6052 thiss!1504))))))

(declare-fun e!139748 () Bool)

(assert (=> b!214867 (= e!139748 (= (select (arr!4892 (_keys!6052 thiss!1504)) (index!5016 lt!110887)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!214868 () Bool)

(declare-fun e!139746 () SeekEntryResult!711)

(assert (=> b!214868 (= e!139746 (Intermediate!711 false (toIndex!0 key!932 (mask!9702 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!214869 () Bool)

(assert (=> b!214869 (and (bvsge (index!5016 lt!110887) #b00000000000000000000000000000000) (bvslt (index!5016 lt!110887) (size!5219 (_keys!6052 thiss!1504))))))

(declare-fun res!105151 () Bool)

(assert (=> b!214869 (= res!105151 (= (select (arr!4892 (_keys!6052 thiss!1504)) (index!5016 lt!110887)) key!932))))

(assert (=> b!214869 (=> res!105151 e!139748)))

(declare-fun e!139745 () Bool)

(assert (=> b!214869 (= e!139745 e!139748)))

(declare-fun d!58431 () Bool)

(assert (=> d!58431 e!139749))

(declare-fun c!36107 () Bool)

(assert (=> d!58431 (= c!36107 (and ((_ is Intermediate!711) lt!110887) (undefined!1523 lt!110887)))))

(assert (=> d!58431 (= lt!110887 e!139747)))

(declare-fun c!36108 () Bool)

(assert (=> d!58431 (= c!36108 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!110888 () (_ BitVec 64))

(assert (=> d!58431 (= lt!110888 (select (arr!4892 (_keys!6052 thiss!1504)) (toIndex!0 key!932 (mask!9702 thiss!1504))))))

(assert (=> d!58431 (validMask!0 (mask!9702 thiss!1504))))

(assert (=> d!58431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9702 thiss!1504)) key!932 (_keys!6052 thiss!1504) (mask!9702 thiss!1504)) lt!110887)))

(declare-fun b!214870 () Bool)

(assert (=> b!214870 (= e!139749 e!139745)))

(declare-fun res!105150 () Bool)

(assert (=> b!214870 (= res!105150 (and ((_ is Intermediate!711) lt!110887) (not (undefined!1523 lt!110887)) (bvslt (x!22386 lt!110887) #b01111111111111111111111111111110) (bvsge (x!22386 lt!110887) #b00000000000000000000000000000000) (bvsge (x!22386 lt!110887) #b00000000000000000000000000000000)))))

(assert (=> b!214870 (=> (not res!105150) (not e!139745))))

(declare-fun b!214871 () Bool)

(assert (=> b!214871 (= e!139746 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9702 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9702 thiss!1504)) key!932 (_keys!6052 thiss!1504) (mask!9702 thiss!1504)))))

(declare-fun b!214872 () Bool)

(assert (=> b!214872 (= e!139747 e!139746)))

(declare-fun c!36106 () Bool)

(assert (=> b!214872 (= c!36106 (or (= lt!110888 key!932) (= (bvadd lt!110888 lt!110888) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!214873 () Bool)

(assert (=> b!214873 (and (bvsge (index!5016 lt!110887) #b00000000000000000000000000000000) (bvslt (index!5016 lt!110887) (size!5219 (_keys!6052 thiss!1504))))))

(declare-fun res!105149 () Bool)

(assert (=> b!214873 (= res!105149 (= (select (arr!4892 (_keys!6052 thiss!1504)) (index!5016 lt!110887)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!214873 (=> res!105149 e!139748)))

(assert (= (and d!58431 c!36108) b!214866))

(assert (= (and d!58431 (not c!36108)) b!214872))

(assert (= (and b!214872 c!36106) b!214868))

(assert (= (and b!214872 (not c!36106)) b!214871))

(assert (= (and d!58431 c!36107) b!214865))

(assert (= (and d!58431 (not c!36107)) b!214870))

(assert (= (and b!214870 res!105150) b!214869))

(assert (= (and b!214869 (not res!105151)) b!214873))

(assert (= (and b!214873 (not res!105149)) b!214867))

(declare-fun m!242507 () Bool)

(assert (=> b!214873 m!242507))

(assert (=> b!214871 m!242479))

(declare-fun m!242509 () Bool)

(assert (=> b!214871 m!242509))

(assert (=> b!214871 m!242509))

(declare-fun m!242511 () Bool)

(assert (=> b!214871 m!242511))

(assert (=> b!214867 m!242507))

(assert (=> b!214869 m!242507))

(assert (=> d!58431 m!242479))

(declare-fun m!242513 () Bool)

(assert (=> d!58431 m!242513))

(assert (=> d!58431 m!242437))

(assert (=> d!58425 d!58431))

(declare-fun d!58433 () Bool)

(declare-fun lt!110894 () (_ BitVec 32))

(declare-fun lt!110893 () (_ BitVec 32))

(assert (=> d!58433 (= lt!110894 (bvmul (bvxor lt!110893 (bvlshr lt!110893 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58433 (= lt!110893 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58433 (and (bvsge (mask!9702 thiss!1504) #b00000000000000000000000000000000) (let ((res!105152 (let ((h!3706 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22404 (bvmul (bvxor h!3706 (bvlshr h!3706 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22404 (bvlshr x!22404 #b00000000000000000000000000001101)) (mask!9702 thiss!1504)))))) (and (bvslt res!105152 (bvadd (mask!9702 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105152 #b00000000000000000000000000000000))))))

(assert (=> d!58433 (= (toIndex!0 key!932 (mask!9702 thiss!1504)) (bvand (bvxor lt!110894 (bvlshr lt!110894 #b00000000000000000000000000001101)) (mask!9702 thiss!1504)))))

(assert (=> d!58425 d!58433))

(assert (=> d!58425 d!58423))

(declare-fun b!214882 () Bool)

(declare-fun e!139758 () Bool)

(declare-fun call!20316 () Bool)

(assert (=> b!214882 (= e!139758 call!20316)))

(declare-fun b!214883 () Bool)

(declare-fun e!139756 () Bool)

(declare-fun e!139757 () Bool)

(assert (=> b!214883 (= e!139756 e!139757)))

(declare-fun c!36111 () Bool)

(assert (=> b!214883 (= c!36111 (validKeyInArray!0 (select (arr!4892 (_keys!6052 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58435 () Bool)

(declare-fun res!105158 () Bool)

(assert (=> d!58435 (=> res!105158 e!139756)))

(assert (=> d!58435 (= res!105158 (bvsge #b00000000000000000000000000000000 (size!5219 (_keys!6052 thiss!1504))))))

(assert (=> d!58435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6052 thiss!1504) (mask!9702 thiss!1504)) e!139756)))

(declare-fun b!214884 () Bool)

(assert (=> b!214884 (= e!139757 call!20316)))

(declare-fun bm!20313 () Bool)

(assert (=> bm!20313 (= call!20316 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6052 thiss!1504) (mask!9702 thiss!1504)))))

(declare-fun b!214885 () Bool)

(assert (=> b!214885 (= e!139757 e!139758)))

(declare-fun lt!110901 () (_ BitVec 64))

(assert (=> b!214885 (= lt!110901 (select (arr!4892 (_keys!6052 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6478 0))(
  ( (Unit!6479) )
))
(declare-fun lt!110903 () Unit!6478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10319 (_ BitVec 64) (_ BitVec 32)) Unit!6478)

(assert (=> b!214885 (= lt!110903 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6052 thiss!1504) lt!110901 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!214885 (arrayContainsKey!0 (_keys!6052 thiss!1504) lt!110901 #b00000000000000000000000000000000)))

(declare-fun lt!110902 () Unit!6478)

(assert (=> b!214885 (= lt!110902 lt!110903)))

(declare-fun res!105157 () Bool)

(assert (=> b!214885 (= res!105157 (= (seekEntryOrOpen!0 (select (arr!4892 (_keys!6052 thiss!1504)) #b00000000000000000000000000000000) (_keys!6052 thiss!1504) (mask!9702 thiss!1504)) (Found!711 #b00000000000000000000000000000000)))))

(assert (=> b!214885 (=> (not res!105157) (not e!139758))))

(assert (= (and d!58435 (not res!105158)) b!214883))

(assert (= (and b!214883 c!36111) b!214885))

(assert (= (and b!214883 (not c!36111)) b!214884))

(assert (= (and b!214885 res!105157) b!214882))

(assert (= (or b!214882 b!214884) bm!20313))

(assert (=> b!214883 m!242491))

(assert (=> b!214883 m!242491))

(assert (=> b!214883 m!242493))

(declare-fun m!242515 () Bool)

(assert (=> bm!20313 m!242515))

(assert (=> b!214885 m!242491))

(declare-fun m!242517 () Bool)

(assert (=> b!214885 m!242517))

(declare-fun m!242519 () Bool)

(assert (=> b!214885 m!242519))

(assert (=> b!214885 m!242491))

(declare-fun m!242521 () Bool)

(assert (=> b!214885 m!242521))

(assert (=> b!214786 d!58435))

(declare-fun b!214894 () Bool)

(declare-fun e!139764 () (_ BitVec 32))

(declare-fun e!139763 () (_ BitVec 32))

(assert (=> b!214894 (= e!139764 e!139763)))

(declare-fun c!36117 () Bool)

(assert (=> b!214894 (= c!36117 (validKeyInArray!0 (select (arr!4892 (_keys!6052 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58437 () Bool)

(declare-fun lt!110906 () (_ BitVec 32))

(assert (=> d!58437 (and (bvsge lt!110906 #b00000000000000000000000000000000) (bvsle lt!110906 (bvsub (size!5219 (_keys!6052 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58437 (= lt!110906 e!139764)))

(declare-fun c!36116 () Bool)

(assert (=> d!58437 (= c!36116 (bvsge #b00000000000000000000000000000000 (size!5219 (_keys!6052 thiss!1504))))))

(assert (=> d!58437 (and (bvsle #b00000000000000000000000000000000 (size!5219 (_keys!6052 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5219 (_keys!6052 thiss!1504)) (size!5219 (_keys!6052 thiss!1504))))))

(assert (=> d!58437 (= (arrayCountValidKeys!0 (_keys!6052 thiss!1504) #b00000000000000000000000000000000 (size!5219 (_keys!6052 thiss!1504))) lt!110906)))

(declare-fun bm!20316 () Bool)

(declare-fun call!20319 () (_ BitVec 32))

(assert (=> bm!20316 (= call!20319 (arrayCountValidKeys!0 (_keys!6052 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5219 (_keys!6052 thiss!1504))))))

(declare-fun b!214895 () Bool)

(assert (=> b!214895 (= e!139763 call!20319)))

(declare-fun b!214896 () Bool)

(assert (=> b!214896 (= e!139763 (bvadd #b00000000000000000000000000000001 call!20319))))

(declare-fun b!214897 () Bool)

(assert (=> b!214897 (= e!139764 #b00000000000000000000000000000000)))

(assert (= (and d!58437 c!36116) b!214897))

(assert (= (and d!58437 (not c!36116)) b!214894))

(assert (= (and b!214894 c!36117) b!214896))

(assert (= (and b!214894 (not c!36117)) b!214895))

(assert (= (or b!214896 b!214895) bm!20316))

(assert (=> b!214894 m!242491))

(assert (=> b!214894 m!242491))

(assert (=> b!214894 m!242493))

(declare-fun m!242523 () Bool)

(assert (=> bm!20316 m!242523))

(assert (=> b!214785 d!58437))

(declare-fun b!214907 () Bool)

(declare-fun res!105169 () Bool)

(declare-fun e!139767 () Bool)

(assert (=> b!214907 (=> (not res!105169) (not e!139767))))

(declare-fun size!5224 (LongMapFixedSize!2764) (_ BitVec 32))

(assert (=> b!214907 (= res!105169 (bvsge (size!5224 thiss!1504) (_size!1431 thiss!1504)))))

(declare-fun b!214908 () Bool)

(declare-fun res!105168 () Bool)

(assert (=> b!214908 (=> (not res!105168) (not e!139767))))

(assert (=> b!214908 (= res!105168 (= (size!5224 thiss!1504) (bvadd (_size!1431 thiss!1504) (bvsdiv (bvadd (extraKeys!3769 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!214909 () Bool)

(assert (=> b!214909 (= e!139767 (and (bvsge (extraKeys!3769 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3769 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1431 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!58439 () Bool)

(declare-fun res!105167 () Bool)

(assert (=> d!58439 (=> (not res!105167) (not e!139767))))

(assert (=> d!58439 (= res!105167 (validMask!0 (mask!9702 thiss!1504)))))

(assert (=> d!58439 (= (simpleValid!213 thiss!1504) e!139767)))

(declare-fun b!214906 () Bool)

(declare-fun res!105170 () Bool)

(assert (=> b!214906 (=> (not res!105170) (not e!139767))))

(assert (=> b!214906 (= res!105170 (and (= (size!5218 (_values!4015 thiss!1504)) (bvadd (mask!9702 thiss!1504) #b00000000000000000000000000000001)) (= (size!5219 (_keys!6052 thiss!1504)) (size!5218 (_values!4015 thiss!1504))) (bvsge (_size!1431 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1431 thiss!1504) (bvadd (mask!9702 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!58439 res!105167) b!214906))

(assert (= (and b!214906 res!105170) b!214907))

(assert (= (and b!214907 res!105169) b!214908))

(assert (= (and b!214908 res!105168) b!214909))

(declare-fun m!242525 () Bool)

(assert (=> b!214907 m!242525))

(assert (=> b!214908 m!242525))

(assert (=> d!58439 m!242437))

(assert (=> d!58421 d!58439))

(declare-fun b!214910 () Bool)

(declare-fun e!139769 () Bool)

(assert (=> b!214910 (= e!139769 tp_is_empty!5551)))

(declare-fun condMapEmpty!9461 () Bool)

(declare-fun mapDefault!9461 () ValueCell!2432)

(assert (=> mapNonEmpty!9460 (= condMapEmpty!9461 (= mapRest!9460 ((as const (Array (_ BitVec 32) ValueCell!2432)) mapDefault!9461)))))

(declare-fun e!139768 () Bool)

(declare-fun mapRes!9461 () Bool)

(assert (=> mapNonEmpty!9460 (= tp!20179 (and e!139768 mapRes!9461))))

(declare-fun b!214911 () Bool)

(assert (=> b!214911 (= e!139768 tp_is_empty!5551)))

(declare-fun mapNonEmpty!9461 () Bool)

(declare-fun tp!20180 () Bool)

(assert (=> mapNonEmpty!9461 (= mapRes!9461 (and tp!20180 e!139769))))

(declare-fun mapValue!9461 () ValueCell!2432)

(declare-fun mapKey!9461 () (_ BitVec 32))

(declare-fun mapRest!9461 () (Array (_ BitVec 32) ValueCell!2432))

(assert (=> mapNonEmpty!9461 (= mapRest!9460 (store mapRest!9461 mapKey!9461 mapValue!9461))))

(declare-fun mapIsEmpty!9461 () Bool)

(assert (=> mapIsEmpty!9461 mapRes!9461))

(assert (= (and mapNonEmpty!9460 condMapEmpty!9461) mapIsEmpty!9461))

(assert (= (and mapNonEmpty!9460 (not condMapEmpty!9461)) mapNonEmpty!9461))

(assert (= (and mapNonEmpty!9461 ((_ is ValueCellFull!2432) mapValue!9461)) b!214910))

(assert (= (and mapNonEmpty!9460 ((_ is ValueCellFull!2432) mapDefault!9461)) b!214911))

(declare-fun m!242527 () Bool)

(assert (=> mapNonEmpty!9461 m!242527))

(check-sat (not bm!20316) tp_is_empty!5551 (not b!214827) (not b!214883) (not bm!20310) b_and!12593 (not bm!20313) (not b!214844) (not b!214908) (not b!214894) (not b!214826) (not b!214885) (not d!58431) (not b!214871) (not mapNonEmpty!9461) (not b!214825) (not b!214907) (not b_next!5689) (not d!58439) (not d!58429))
(check-sat b_and!12593 (not b_next!5689))
