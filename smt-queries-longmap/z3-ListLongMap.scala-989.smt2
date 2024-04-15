; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21336 () Bool)

(assert start!21336)

(declare-fun b!214427 () Bool)

(declare-fun b_free!5683 () Bool)

(declare-fun b_next!5683 () Bool)

(assert (=> b!214427 (= b_free!5683 (not b_next!5683))))

(declare-fun tp!20143 () Bool)

(declare-fun b_and!12547 () Bool)

(assert (=> b!214427 (= tp!20143 b_and!12547)))

(declare-fun b!214422 () Bool)

(declare-fun e!139461 () Bool)

(declare-fun tp_is_empty!5545 () Bool)

(assert (=> b!214422 (= e!139461 tp_is_empty!5545)))

(declare-fun mapNonEmpty!9439 () Bool)

(declare-fun mapRes!9439 () Bool)

(declare-fun tp!20142 () Bool)

(declare-fun e!139462 () Bool)

(assert (=> mapNonEmpty!9439 (= mapRes!9439 (and tp!20142 e!139462))))

(declare-fun mapKey!9439 () (_ BitVec 32))

(declare-datatypes ((V!7041 0))(
  ( (V!7042 (val!2817 Int)) )
))
(declare-datatypes ((ValueCell!2429 0))(
  ( (ValueCellFull!2429 (v!4829 V!7041)) (EmptyCell!2429) )
))
(declare-fun mapRest!9439 () (Array (_ BitVec 32) ValueCell!2429))

(declare-datatypes ((array!10297 0))(
  ( (array!10298 (arr!4881 (Array (_ BitVec 32) ValueCell!2429)) (size!5209 (_ BitVec 32))) )
))
(declare-datatypes ((array!10299 0))(
  ( (array!10300 (arr!4882 (Array (_ BitVec 32) (_ BitVec 64))) (size!5210 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2758 0))(
  ( (LongMapFixedSize!2759 (defaultEntry!4029 Int) (mask!9694 (_ BitVec 32)) (extraKeys!3766 (_ BitVec 32)) (zeroValue!3870 V!7041) (minValue!3870 V!7041) (_size!1428 (_ BitVec 32)) (_keys!6047 array!10299) (_values!4012 array!10297) (_vacant!1428 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2758)

(declare-fun mapValue!9439 () ValueCell!2429)

(assert (=> mapNonEmpty!9439 (= (arr!4881 (_values!4012 thiss!1504)) (store mapRest!9439 mapKey!9439 mapValue!9439))))

(declare-fun mapIsEmpty!9439 () Bool)

(assert (=> mapIsEmpty!9439 mapRes!9439))

(declare-fun b!214424 () Bool)

(declare-fun res!104938 () Bool)

(declare-fun e!139459 () Bool)

(assert (=> b!214424 (=> (not res!104938) (not e!139459))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!720 0))(
  ( (MissingZero!720 (index!5050 (_ BitVec 32))) (Found!720 (index!5051 (_ BitVec 32))) (Intermediate!720 (undefined!1532 Bool) (index!5052 (_ BitVec 32)) (x!22378 (_ BitVec 32))) (Undefined!720) (MissingVacant!720 (index!5053 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10299 (_ BitVec 32)) SeekEntryResult!720)

(assert (=> b!214424 (= res!104938 (not (= (seekEntryOrOpen!0 key!932 (_keys!6047 thiss!1504) (mask!9694 thiss!1504)) (MissingZero!720 index!297))))))

(declare-fun b!214425 () Bool)

(assert (=> b!214425 (= e!139459 (bvslt (mask!9694 thiss!1504) #b00000000000000000000000000000000))))

(declare-fun b!214426 () Bool)

(declare-fun res!104939 () Bool)

(assert (=> b!214426 (=> (not res!104939) (not e!139459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214426 (= res!104939 (validMask!0 (mask!9694 thiss!1504)))))

(declare-fun e!139460 () Bool)

(declare-fun e!139457 () Bool)

(declare-fun array_inv!3211 (array!10299) Bool)

(declare-fun array_inv!3212 (array!10297) Bool)

(assert (=> b!214427 (= e!139457 (and tp!20143 tp_is_empty!5545 (array_inv!3211 (_keys!6047 thiss!1504)) (array_inv!3212 (_values!4012 thiss!1504)) e!139460))))

(declare-fun b!214428 () Bool)

(assert (=> b!214428 (= e!139462 tp_is_empty!5545)))

(declare-fun b!214429 () Bool)

(declare-fun res!104937 () Bool)

(assert (=> b!214429 (=> (not res!104937) (not e!139459))))

(assert (=> b!214429 (= res!104937 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!104936 () Bool)

(assert (=> start!21336 (=> (not res!104936) (not e!139459))))

(declare-fun valid!1146 (LongMapFixedSize!2758) Bool)

(assert (=> start!21336 (= res!104936 (valid!1146 thiss!1504))))

(assert (=> start!21336 e!139459))

(assert (=> start!21336 e!139457))

(assert (=> start!21336 true))

(declare-fun b!214423 () Bool)

(assert (=> b!214423 (= e!139460 (and e!139461 mapRes!9439))))

(declare-fun condMapEmpty!9439 () Bool)

(declare-fun mapDefault!9439 () ValueCell!2429)

(assert (=> b!214423 (= condMapEmpty!9439 (= (arr!4881 (_values!4012 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2429)) mapDefault!9439)))))

(assert (= (and start!21336 res!104936) b!214429))

(assert (= (and b!214429 res!104937) b!214424))

(assert (= (and b!214424 res!104938) b!214426))

(assert (= (and b!214426 res!104939) b!214425))

(assert (= (and b!214423 condMapEmpty!9439) mapIsEmpty!9439))

(assert (= (and b!214423 (not condMapEmpty!9439)) mapNonEmpty!9439))

(get-info :version)

(assert (= (and mapNonEmpty!9439 ((_ is ValueCellFull!2429) mapValue!9439)) b!214428))

(assert (= (and b!214423 ((_ is ValueCellFull!2429) mapDefault!9439)) b!214422))

(assert (= b!214427 b!214423))

(assert (= start!21336 b!214427))

(declare-fun m!241573 () Bool)

(assert (=> start!21336 m!241573))

(declare-fun m!241575 () Bool)

(assert (=> mapNonEmpty!9439 m!241575))

(declare-fun m!241577 () Bool)

(assert (=> b!214424 m!241577))

(declare-fun m!241579 () Bool)

(assert (=> b!214427 m!241579))

(declare-fun m!241581 () Bool)

(assert (=> b!214427 m!241581))

(declare-fun m!241583 () Bool)

(assert (=> b!214426 m!241583))

(check-sat (not mapNonEmpty!9439) (not b_next!5683) (not b!214427) (not b!214424) tp_is_empty!5545 b_and!12547 (not b!214426) (not start!21336))
(check-sat b_and!12547 (not b_next!5683))
(get-model)

(declare-fun d!58183 () Bool)

(assert (=> d!58183 (= (validMask!0 (mask!9694 thiss!1504)) (and (or (= (mask!9694 thiss!1504) #b00000000000000000000000000000111) (= (mask!9694 thiss!1504) #b00000000000000000000000000001111) (= (mask!9694 thiss!1504) #b00000000000000000000000000011111) (= (mask!9694 thiss!1504) #b00000000000000000000000000111111) (= (mask!9694 thiss!1504) #b00000000000000000000000001111111) (= (mask!9694 thiss!1504) #b00000000000000000000000011111111) (= (mask!9694 thiss!1504) #b00000000000000000000000111111111) (= (mask!9694 thiss!1504) #b00000000000000000000001111111111) (= (mask!9694 thiss!1504) #b00000000000000000000011111111111) (= (mask!9694 thiss!1504) #b00000000000000000000111111111111) (= (mask!9694 thiss!1504) #b00000000000000000001111111111111) (= (mask!9694 thiss!1504) #b00000000000000000011111111111111) (= (mask!9694 thiss!1504) #b00000000000000000111111111111111) (= (mask!9694 thiss!1504) #b00000000000000001111111111111111) (= (mask!9694 thiss!1504) #b00000000000000011111111111111111) (= (mask!9694 thiss!1504) #b00000000000000111111111111111111) (= (mask!9694 thiss!1504) #b00000000000001111111111111111111) (= (mask!9694 thiss!1504) #b00000000000011111111111111111111) (= (mask!9694 thiss!1504) #b00000000000111111111111111111111) (= (mask!9694 thiss!1504) #b00000000001111111111111111111111) (= (mask!9694 thiss!1504) #b00000000011111111111111111111111) (= (mask!9694 thiss!1504) #b00000000111111111111111111111111) (= (mask!9694 thiss!1504) #b00000001111111111111111111111111) (= (mask!9694 thiss!1504) #b00000011111111111111111111111111) (= (mask!9694 thiss!1504) #b00000111111111111111111111111111) (= (mask!9694 thiss!1504) #b00001111111111111111111111111111) (= (mask!9694 thiss!1504) #b00011111111111111111111111111111) (= (mask!9694 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9694 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214426 d!58183))

(declare-fun d!58185 () Bool)

(assert (=> d!58185 (= (array_inv!3211 (_keys!6047 thiss!1504)) (bvsge (size!5210 (_keys!6047 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214427 d!58185))

(declare-fun d!58187 () Bool)

(assert (=> d!58187 (= (array_inv!3212 (_values!4012 thiss!1504)) (bvsge (size!5209 (_values!4012 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214427 d!58187))

(declare-fun d!58189 () Bool)

(declare-fun res!104970 () Bool)

(declare-fun e!139501 () Bool)

(assert (=> d!58189 (=> (not res!104970) (not e!139501))))

(declare-fun simpleValid!212 (LongMapFixedSize!2758) Bool)

(assert (=> d!58189 (= res!104970 (simpleValid!212 thiss!1504))))

(assert (=> d!58189 (= (valid!1146 thiss!1504) e!139501)))

(declare-fun b!214484 () Bool)

(declare-fun res!104971 () Bool)

(assert (=> b!214484 (=> (not res!104971) (not e!139501))))

(declare-fun arrayCountValidKeys!0 (array!10299 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214484 (= res!104971 (= (arrayCountValidKeys!0 (_keys!6047 thiss!1504) #b00000000000000000000000000000000 (size!5210 (_keys!6047 thiss!1504))) (_size!1428 thiss!1504)))))

(declare-fun b!214485 () Bool)

(declare-fun res!104972 () Bool)

(assert (=> b!214485 (=> (not res!104972) (not e!139501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10299 (_ BitVec 32)) Bool)

(assert (=> b!214485 (= res!104972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6047 thiss!1504) (mask!9694 thiss!1504)))))

(declare-fun b!214486 () Bool)

(declare-datatypes ((List!3118 0))(
  ( (Nil!3115) (Cons!3114 (h!3756 (_ BitVec 64)) (t!8064 List!3118)) )
))
(declare-fun arrayNoDuplicates!0 (array!10299 (_ BitVec 32) List!3118) Bool)

(assert (=> b!214486 (= e!139501 (arrayNoDuplicates!0 (_keys!6047 thiss!1504) #b00000000000000000000000000000000 Nil!3115))))

(assert (= (and d!58189 res!104970) b!214484))

(assert (= (and b!214484 res!104971) b!214485))

(assert (= (and b!214485 res!104972) b!214486))

(declare-fun m!241609 () Bool)

(assert (=> d!58189 m!241609))

(declare-fun m!241611 () Bool)

(assert (=> b!214484 m!241611))

(declare-fun m!241613 () Bool)

(assert (=> b!214485 m!241613))

(declare-fun m!241615 () Bool)

(assert (=> b!214486 m!241615))

(assert (=> start!21336 d!58189))

(declare-fun e!139508 () SeekEntryResult!720)

(declare-fun b!214499 () Bool)

(declare-fun lt!110627 () SeekEntryResult!720)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10299 (_ BitVec 32)) SeekEntryResult!720)

(assert (=> b!214499 (= e!139508 (seekKeyOrZeroReturnVacant!0 (x!22378 lt!110627) (index!5052 lt!110627) (index!5052 lt!110627) key!932 (_keys!6047 thiss!1504) (mask!9694 thiss!1504)))))

(declare-fun d!58191 () Bool)

(declare-fun lt!110625 () SeekEntryResult!720)

(assert (=> d!58191 (and (or ((_ is Undefined!720) lt!110625) (not ((_ is Found!720) lt!110625)) (and (bvsge (index!5051 lt!110625) #b00000000000000000000000000000000) (bvslt (index!5051 lt!110625) (size!5210 (_keys!6047 thiss!1504))))) (or ((_ is Undefined!720) lt!110625) ((_ is Found!720) lt!110625) (not ((_ is MissingZero!720) lt!110625)) (and (bvsge (index!5050 lt!110625) #b00000000000000000000000000000000) (bvslt (index!5050 lt!110625) (size!5210 (_keys!6047 thiss!1504))))) (or ((_ is Undefined!720) lt!110625) ((_ is Found!720) lt!110625) ((_ is MissingZero!720) lt!110625) (not ((_ is MissingVacant!720) lt!110625)) (and (bvsge (index!5053 lt!110625) #b00000000000000000000000000000000) (bvslt (index!5053 lt!110625) (size!5210 (_keys!6047 thiss!1504))))) (or ((_ is Undefined!720) lt!110625) (ite ((_ is Found!720) lt!110625) (= (select (arr!4882 (_keys!6047 thiss!1504)) (index!5051 lt!110625)) key!932) (ite ((_ is MissingZero!720) lt!110625) (= (select (arr!4882 (_keys!6047 thiss!1504)) (index!5050 lt!110625)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!720) lt!110625) (= (select (arr!4882 (_keys!6047 thiss!1504)) (index!5053 lt!110625)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!139510 () SeekEntryResult!720)

(assert (=> d!58191 (= lt!110625 e!139510)))

(declare-fun c!36037 () Bool)

(assert (=> d!58191 (= c!36037 (and ((_ is Intermediate!720) lt!110627) (undefined!1532 lt!110627)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10299 (_ BitVec 32)) SeekEntryResult!720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58191 (= lt!110627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9694 thiss!1504)) key!932 (_keys!6047 thiss!1504) (mask!9694 thiss!1504)))))

(assert (=> d!58191 (validMask!0 (mask!9694 thiss!1504))))

(assert (=> d!58191 (= (seekEntryOrOpen!0 key!932 (_keys!6047 thiss!1504) (mask!9694 thiss!1504)) lt!110625)))

(declare-fun b!214500 () Bool)

(assert (=> b!214500 (= e!139510 Undefined!720)))

(declare-fun b!214501 () Bool)

(assert (=> b!214501 (= e!139508 (MissingZero!720 (index!5052 lt!110627)))))

(declare-fun b!214502 () Bool)

(declare-fun c!36039 () Bool)

(declare-fun lt!110626 () (_ BitVec 64))

(assert (=> b!214502 (= c!36039 (= lt!110626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139509 () SeekEntryResult!720)

(assert (=> b!214502 (= e!139509 e!139508)))

(declare-fun b!214503 () Bool)

(assert (=> b!214503 (= e!139510 e!139509)))

(assert (=> b!214503 (= lt!110626 (select (arr!4882 (_keys!6047 thiss!1504)) (index!5052 lt!110627)))))

(declare-fun c!36038 () Bool)

(assert (=> b!214503 (= c!36038 (= lt!110626 key!932))))

(declare-fun b!214504 () Bool)

(assert (=> b!214504 (= e!139509 (Found!720 (index!5052 lt!110627)))))

(assert (= (and d!58191 c!36037) b!214500))

(assert (= (and d!58191 (not c!36037)) b!214503))

(assert (= (and b!214503 c!36038) b!214504))

(assert (= (and b!214503 (not c!36038)) b!214502))

(assert (= (and b!214502 c!36039) b!214501))

(assert (= (and b!214502 (not c!36039)) b!214499))

(declare-fun m!241617 () Bool)

(assert (=> b!214499 m!241617))

(declare-fun m!241619 () Bool)

(assert (=> d!58191 m!241619))

(declare-fun m!241621 () Bool)

(assert (=> d!58191 m!241621))

(declare-fun m!241623 () Bool)

(assert (=> d!58191 m!241623))

(declare-fun m!241625 () Bool)

(assert (=> d!58191 m!241625))

(assert (=> d!58191 m!241583))

(assert (=> d!58191 m!241621))

(declare-fun m!241627 () Bool)

(assert (=> d!58191 m!241627))

(declare-fun m!241629 () Bool)

(assert (=> b!214503 m!241629))

(assert (=> b!214424 d!58191))

(declare-fun b!214512 () Bool)

(declare-fun e!139516 () Bool)

(assert (=> b!214512 (= e!139516 tp_is_empty!5545)))

(declare-fun mapNonEmpty!9448 () Bool)

(declare-fun mapRes!9448 () Bool)

(declare-fun tp!20158 () Bool)

(declare-fun e!139515 () Bool)

(assert (=> mapNonEmpty!9448 (= mapRes!9448 (and tp!20158 e!139515))))

(declare-fun mapValue!9448 () ValueCell!2429)

(declare-fun mapKey!9448 () (_ BitVec 32))

(declare-fun mapRest!9448 () (Array (_ BitVec 32) ValueCell!2429))

(assert (=> mapNonEmpty!9448 (= mapRest!9439 (store mapRest!9448 mapKey!9448 mapValue!9448))))

(declare-fun b!214511 () Bool)

(assert (=> b!214511 (= e!139515 tp_is_empty!5545)))

(declare-fun condMapEmpty!9448 () Bool)

(declare-fun mapDefault!9448 () ValueCell!2429)

(assert (=> mapNonEmpty!9439 (= condMapEmpty!9448 (= mapRest!9439 ((as const (Array (_ BitVec 32) ValueCell!2429)) mapDefault!9448)))))

(assert (=> mapNonEmpty!9439 (= tp!20142 (and e!139516 mapRes!9448))))

(declare-fun mapIsEmpty!9448 () Bool)

(assert (=> mapIsEmpty!9448 mapRes!9448))

(assert (= (and mapNonEmpty!9439 condMapEmpty!9448) mapIsEmpty!9448))

(assert (= (and mapNonEmpty!9439 (not condMapEmpty!9448)) mapNonEmpty!9448))

(assert (= (and mapNonEmpty!9448 ((_ is ValueCellFull!2429) mapValue!9448)) b!214511))

(assert (= (and mapNonEmpty!9439 ((_ is ValueCellFull!2429) mapDefault!9448)) b!214512))

(declare-fun m!241631 () Bool)

(assert (=> mapNonEmpty!9448 m!241631))

(check-sat (not b!214484) (not d!58191) (not b_next!5683) (not b!214485) tp_is_empty!5545 b_and!12547 (not b!214499) (not mapNonEmpty!9448) (not d!58189) (not b!214486))
(check-sat b_and!12547 (not b_next!5683))
