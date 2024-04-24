; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21492 () Bool)

(assert start!21492)

(declare-fun b!215666 () Bool)

(declare-fun b_free!5725 () Bool)

(declare-fun b_next!5725 () Bool)

(assert (=> b!215666 (= b_free!5725 (not b_next!5725))))

(declare-fun tp!20292 () Bool)

(declare-fun b_and!12629 () Bool)

(assert (=> b!215666 (= tp!20292 b_and!12629)))

(declare-fun mapIsEmpty!9526 () Bool)

(declare-fun mapRes!9526 () Bool)

(assert (=> mapIsEmpty!9526 mapRes!9526))

(declare-fun b!215659 () Bool)

(declare-fun res!105480 () Bool)

(declare-fun e!140295 () Bool)

(assert (=> b!215659 (=> (not res!105480) (not e!140295))))

(declare-datatypes ((V!7097 0))(
  ( (V!7098 (val!2838 Int)) )
))
(declare-datatypes ((ValueCell!2450 0))(
  ( (ValueCellFull!2450 (v!4857 V!7097)) (EmptyCell!2450) )
))
(declare-datatypes ((array!10401 0))(
  ( (array!10402 (arr!4927 (Array (_ BitVec 32) ValueCell!2450)) (size!5257 (_ BitVec 32))) )
))
(declare-datatypes ((array!10403 0))(
  ( (array!10404 (arr!4928 (Array (_ BitVec 32) (_ BitVec 64))) (size!5258 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2800 0))(
  ( (LongMapFixedSize!2801 (defaultEntry!4050 Int) (mask!9756 (_ BitVec 32)) (extraKeys!3787 (_ BitVec 32)) (zeroValue!3891 V!7097) (minValue!3891 V!7097) (_size!1449 (_ BitVec 32)) (_keys!6085 array!10403) (_values!4033 array!10401) (_vacant!1449 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2800)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215659 (= res!105480 (validMask!0 (mask!9756 thiss!1504)))))

(declare-fun mapNonEmpty!9526 () Bool)

(declare-fun tp!20293 () Bool)

(declare-fun e!140296 () Bool)

(assert (=> mapNonEmpty!9526 (= mapRes!9526 (and tp!20293 e!140296))))

(declare-fun mapKey!9526 () (_ BitVec 32))

(declare-fun mapValue!9526 () ValueCell!2450)

(declare-fun mapRest!9526 () (Array (_ BitVec 32) ValueCell!2450))

(assert (=> mapNonEmpty!9526 (= (arr!4927 (_values!4033 thiss!1504)) (store mapRest!9526 mapKey!9526 mapValue!9526))))

(declare-fun b!215660 () Bool)

(declare-fun e!140297 () Bool)

(assert (=> b!215660 (= e!140297 e!140295)))

(declare-fun res!105479 () Bool)

(assert (=> b!215660 (=> (not res!105479) (not e!140295))))

(declare-datatypes ((SeekEntryResult!723 0))(
  ( (MissingZero!723 (index!5062 (_ BitVec 32))) (Found!723 (index!5063 (_ BitVec 32))) (Intermediate!723 (undefined!1535 Bool) (index!5064 (_ BitVec 32)) (x!22521 (_ BitVec 32))) (Undefined!723) (MissingVacant!723 (index!5065 (_ BitVec 32))) )
))
(declare-fun lt!111050 () SeekEntryResult!723)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215660 (= res!105479 (or (= lt!111050 (MissingZero!723 index!297)) (= lt!111050 (MissingVacant!723 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10403 (_ BitVec 32)) SeekEntryResult!723)

(assert (=> b!215660 (= lt!111050 (seekEntryOrOpen!0 key!932 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)))))

(declare-fun b!215661 () Bool)

(declare-fun res!105481 () Bool)

(assert (=> b!215661 (=> (not res!105481) (not e!140297))))

(assert (=> b!215661 (= res!105481 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!215662 () Bool)

(declare-fun tp_is_empty!5587 () Bool)

(assert (=> b!215662 (= e!140296 tp_is_empty!5587)))

(declare-fun b!215663 () Bool)

(assert (=> b!215663 (= e!140295 (and (= (size!5257 (_values!4033 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9756 thiss!1504))) (= (size!5258 (_keys!6085 thiss!1504)) (size!5257 (_values!4033 thiss!1504))) (bvsge (mask!9756 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3787 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215664 () Bool)

(declare-fun e!140293 () Bool)

(assert (=> b!215664 (= e!140293 tp_is_empty!5587)))

(declare-fun b!215665 () Bool)

(declare-fun e!140294 () Bool)

(assert (=> b!215665 (= e!140294 (and e!140293 mapRes!9526))))

(declare-fun condMapEmpty!9526 () Bool)

(declare-fun mapDefault!9526 () ValueCell!2450)

(assert (=> b!215665 (= condMapEmpty!9526 (= (arr!4927 (_values!4033 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2450)) mapDefault!9526)))))

(declare-fun e!140298 () Bool)

(declare-fun array_inv!3239 (array!10403) Bool)

(declare-fun array_inv!3240 (array!10401) Bool)

(assert (=> b!215666 (= e!140298 (and tp!20292 tp_is_empty!5587 (array_inv!3239 (_keys!6085 thiss!1504)) (array_inv!3240 (_values!4033 thiss!1504)) e!140294))))

(declare-fun res!105478 () Bool)

(assert (=> start!21492 (=> (not res!105478) (not e!140297))))

(declare-fun valid!1162 (LongMapFixedSize!2800) Bool)

(assert (=> start!21492 (= res!105478 (valid!1162 thiss!1504))))

(assert (=> start!21492 e!140297))

(assert (=> start!21492 e!140298))

(assert (=> start!21492 true))

(assert (= (and start!21492 res!105478) b!215661))

(assert (= (and b!215661 res!105481) b!215660))

(assert (= (and b!215660 res!105479) b!215659))

(assert (= (and b!215659 res!105480) b!215663))

(assert (= (and b!215665 condMapEmpty!9526) mapIsEmpty!9526))

(assert (= (and b!215665 (not condMapEmpty!9526)) mapNonEmpty!9526))

(get-info :version)

(assert (= (and mapNonEmpty!9526 ((_ is ValueCellFull!2450) mapValue!9526)) b!215662))

(assert (= (and b!215665 ((_ is ValueCellFull!2450) mapDefault!9526)) b!215664))

(assert (= b!215666 b!215665))

(assert (= start!21492 b!215666))

(declare-fun m!242911 () Bool)

(assert (=> b!215660 m!242911))

(declare-fun m!242913 () Bool)

(assert (=> mapNonEmpty!9526 m!242913))

(declare-fun m!242915 () Bool)

(assert (=> b!215666 m!242915))

(declare-fun m!242917 () Bool)

(assert (=> b!215666 m!242917))

(declare-fun m!242919 () Bool)

(assert (=> start!21492 m!242919))

(declare-fun m!242921 () Bool)

(assert (=> b!215659 m!242921))

(check-sat (not b!215666) (not start!21492) (not b!215660) tp_is_empty!5587 (not b_next!5725) b_and!12629 (not b!215659) (not mapNonEmpty!9526))
(check-sat b_and!12629 (not b_next!5725))
(get-model)

(declare-fun d!58533 () Bool)

(declare-fun res!105512 () Bool)

(declare-fun e!140343 () Bool)

(assert (=> d!58533 (=> (not res!105512) (not e!140343))))

(declare-fun simpleValid!219 (LongMapFixedSize!2800) Bool)

(assert (=> d!58533 (= res!105512 (simpleValid!219 thiss!1504))))

(assert (=> d!58533 (= (valid!1162 thiss!1504) e!140343)))

(declare-fun b!215721 () Bool)

(declare-fun res!105513 () Bool)

(assert (=> b!215721 (=> (not res!105513) (not e!140343))))

(declare-fun arrayCountValidKeys!0 (array!10403 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215721 (= res!105513 (= (arrayCountValidKeys!0 (_keys!6085 thiss!1504) #b00000000000000000000000000000000 (size!5258 (_keys!6085 thiss!1504))) (_size!1449 thiss!1504)))))

(declare-fun b!215722 () Bool)

(declare-fun res!105514 () Bool)

(assert (=> b!215722 (=> (not res!105514) (not e!140343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10403 (_ BitVec 32)) Bool)

(assert (=> b!215722 (= res!105514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)))))

(declare-fun b!215723 () Bool)

(declare-datatypes ((List!3073 0))(
  ( (Nil!3070) (Cons!3069 (h!3714 (_ BitVec 64)) (t!8020 List!3073)) )
))
(declare-fun arrayNoDuplicates!0 (array!10403 (_ BitVec 32) List!3073) Bool)

(assert (=> b!215723 (= e!140343 (arrayNoDuplicates!0 (_keys!6085 thiss!1504) #b00000000000000000000000000000000 Nil!3070))))

(assert (= (and d!58533 res!105512) b!215721))

(assert (= (and b!215721 res!105513) b!215722))

(assert (= (and b!215722 res!105514) b!215723))

(declare-fun m!242947 () Bool)

(assert (=> d!58533 m!242947))

(declare-fun m!242949 () Bool)

(assert (=> b!215721 m!242949))

(declare-fun m!242951 () Bool)

(assert (=> b!215722 m!242951))

(declare-fun m!242953 () Bool)

(assert (=> b!215723 m!242953))

(assert (=> start!21492 d!58533))

(declare-fun d!58535 () Bool)

(declare-fun lt!111063 () SeekEntryResult!723)

(assert (=> d!58535 (and (or ((_ is Undefined!723) lt!111063) (not ((_ is Found!723) lt!111063)) (and (bvsge (index!5063 lt!111063) #b00000000000000000000000000000000) (bvslt (index!5063 lt!111063) (size!5258 (_keys!6085 thiss!1504))))) (or ((_ is Undefined!723) lt!111063) ((_ is Found!723) lt!111063) (not ((_ is MissingZero!723) lt!111063)) (and (bvsge (index!5062 lt!111063) #b00000000000000000000000000000000) (bvslt (index!5062 lt!111063) (size!5258 (_keys!6085 thiss!1504))))) (or ((_ is Undefined!723) lt!111063) ((_ is Found!723) lt!111063) ((_ is MissingZero!723) lt!111063) (not ((_ is MissingVacant!723) lt!111063)) (and (bvsge (index!5065 lt!111063) #b00000000000000000000000000000000) (bvslt (index!5065 lt!111063) (size!5258 (_keys!6085 thiss!1504))))) (or ((_ is Undefined!723) lt!111063) (ite ((_ is Found!723) lt!111063) (= (select (arr!4928 (_keys!6085 thiss!1504)) (index!5063 lt!111063)) key!932) (ite ((_ is MissingZero!723) lt!111063) (= (select (arr!4928 (_keys!6085 thiss!1504)) (index!5062 lt!111063)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!723) lt!111063) (= (select (arr!4928 (_keys!6085 thiss!1504)) (index!5065 lt!111063)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140350 () SeekEntryResult!723)

(assert (=> d!58535 (= lt!111063 e!140350)))

(declare-fun c!36229 () Bool)

(declare-fun lt!111065 () SeekEntryResult!723)

(assert (=> d!58535 (= c!36229 (and ((_ is Intermediate!723) lt!111065) (undefined!1535 lt!111065)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10403 (_ BitVec 32)) SeekEntryResult!723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58535 (= lt!111065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9756 thiss!1504)) key!932 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)))))

(assert (=> d!58535 (validMask!0 (mask!9756 thiss!1504))))

(assert (=> d!58535 (= (seekEntryOrOpen!0 key!932 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)) lt!111063)))

(declare-fun b!215736 () Bool)

(declare-fun e!140352 () SeekEntryResult!723)

(assert (=> b!215736 (= e!140352 (MissingZero!723 (index!5064 lt!111065)))))

(declare-fun b!215737 () Bool)

(assert (=> b!215737 (= e!140350 Undefined!723)))

(declare-fun b!215738 () Bool)

(declare-fun e!140351 () SeekEntryResult!723)

(assert (=> b!215738 (= e!140350 e!140351)))

(declare-fun lt!111064 () (_ BitVec 64))

(assert (=> b!215738 (= lt!111064 (select (arr!4928 (_keys!6085 thiss!1504)) (index!5064 lt!111065)))))

(declare-fun c!36231 () Bool)

(assert (=> b!215738 (= c!36231 (= lt!111064 key!932))))

(declare-fun b!215739 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10403 (_ BitVec 32)) SeekEntryResult!723)

(assert (=> b!215739 (= e!140352 (seekKeyOrZeroReturnVacant!0 (x!22521 lt!111065) (index!5064 lt!111065) (index!5064 lt!111065) key!932 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)))))

(declare-fun b!215740 () Bool)

(declare-fun c!36230 () Bool)

(assert (=> b!215740 (= c!36230 (= lt!111064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215740 (= e!140351 e!140352)))

(declare-fun b!215741 () Bool)

(assert (=> b!215741 (= e!140351 (Found!723 (index!5064 lt!111065)))))

(assert (= (and d!58535 c!36229) b!215737))

(assert (= (and d!58535 (not c!36229)) b!215738))

(assert (= (and b!215738 c!36231) b!215741))

(assert (= (and b!215738 (not c!36231)) b!215740))

(assert (= (and b!215740 c!36230) b!215736))

(assert (= (and b!215740 (not c!36230)) b!215739))

(assert (=> d!58535 m!242921))

(declare-fun m!242955 () Bool)

(assert (=> d!58535 m!242955))

(declare-fun m!242957 () Bool)

(assert (=> d!58535 m!242957))

(declare-fun m!242959 () Bool)

(assert (=> d!58535 m!242959))

(declare-fun m!242961 () Bool)

(assert (=> d!58535 m!242961))

(assert (=> d!58535 m!242959))

(declare-fun m!242963 () Bool)

(assert (=> d!58535 m!242963))

(declare-fun m!242965 () Bool)

(assert (=> b!215738 m!242965))

(declare-fun m!242967 () Bool)

(assert (=> b!215739 m!242967))

(assert (=> b!215660 d!58535))

(declare-fun d!58537 () Bool)

(assert (=> d!58537 (= (array_inv!3239 (_keys!6085 thiss!1504)) (bvsge (size!5258 (_keys!6085 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215666 d!58537))

(declare-fun d!58539 () Bool)

(assert (=> d!58539 (= (array_inv!3240 (_values!4033 thiss!1504)) (bvsge (size!5257 (_values!4033 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215666 d!58539))

(declare-fun d!58541 () Bool)

(assert (=> d!58541 (= (validMask!0 (mask!9756 thiss!1504)) (and (or (= (mask!9756 thiss!1504) #b00000000000000000000000000000111) (= (mask!9756 thiss!1504) #b00000000000000000000000000001111) (= (mask!9756 thiss!1504) #b00000000000000000000000000011111) (= (mask!9756 thiss!1504) #b00000000000000000000000000111111) (= (mask!9756 thiss!1504) #b00000000000000000000000001111111) (= (mask!9756 thiss!1504) #b00000000000000000000000011111111) (= (mask!9756 thiss!1504) #b00000000000000000000000111111111) (= (mask!9756 thiss!1504) #b00000000000000000000001111111111) (= (mask!9756 thiss!1504) #b00000000000000000000011111111111) (= (mask!9756 thiss!1504) #b00000000000000000000111111111111) (= (mask!9756 thiss!1504) #b00000000000000000001111111111111) (= (mask!9756 thiss!1504) #b00000000000000000011111111111111) (= (mask!9756 thiss!1504) #b00000000000000000111111111111111) (= (mask!9756 thiss!1504) #b00000000000000001111111111111111) (= (mask!9756 thiss!1504) #b00000000000000011111111111111111) (= (mask!9756 thiss!1504) #b00000000000000111111111111111111) (= (mask!9756 thiss!1504) #b00000000000001111111111111111111) (= (mask!9756 thiss!1504) #b00000000000011111111111111111111) (= (mask!9756 thiss!1504) #b00000000000111111111111111111111) (= (mask!9756 thiss!1504) #b00000000001111111111111111111111) (= (mask!9756 thiss!1504) #b00000000011111111111111111111111) (= (mask!9756 thiss!1504) #b00000000111111111111111111111111) (= (mask!9756 thiss!1504) #b00000001111111111111111111111111) (= (mask!9756 thiss!1504) #b00000011111111111111111111111111) (= (mask!9756 thiss!1504) #b00000111111111111111111111111111) (= (mask!9756 thiss!1504) #b00001111111111111111111111111111) (= (mask!9756 thiss!1504) #b00011111111111111111111111111111) (= (mask!9756 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9756 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215659 d!58541))

(declare-fun b!215748 () Bool)

(declare-fun e!140358 () Bool)

(assert (=> b!215748 (= e!140358 tp_is_empty!5587)))

(declare-fun condMapEmpty!9535 () Bool)

(declare-fun mapDefault!9535 () ValueCell!2450)

(assert (=> mapNonEmpty!9526 (= condMapEmpty!9535 (= mapRest!9526 ((as const (Array (_ BitVec 32) ValueCell!2450)) mapDefault!9535)))))

(declare-fun e!140357 () Bool)

(declare-fun mapRes!9535 () Bool)

(assert (=> mapNonEmpty!9526 (= tp!20293 (and e!140357 mapRes!9535))))

(declare-fun mapNonEmpty!9535 () Bool)

(declare-fun tp!20308 () Bool)

(assert (=> mapNonEmpty!9535 (= mapRes!9535 (and tp!20308 e!140358))))

(declare-fun mapKey!9535 () (_ BitVec 32))

(declare-fun mapRest!9535 () (Array (_ BitVec 32) ValueCell!2450))

(declare-fun mapValue!9535 () ValueCell!2450)

(assert (=> mapNonEmpty!9535 (= mapRest!9526 (store mapRest!9535 mapKey!9535 mapValue!9535))))

(declare-fun mapIsEmpty!9535 () Bool)

(assert (=> mapIsEmpty!9535 mapRes!9535))

(declare-fun b!215749 () Bool)

(assert (=> b!215749 (= e!140357 tp_is_empty!5587)))

(assert (= (and mapNonEmpty!9526 condMapEmpty!9535) mapIsEmpty!9535))

(assert (= (and mapNonEmpty!9526 (not condMapEmpty!9535)) mapNonEmpty!9535))

(assert (= (and mapNonEmpty!9535 ((_ is ValueCellFull!2450) mapValue!9535)) b!215748))

(assert (= (and mapNonEmpty!9526 ((_ is ValueCellFull!2450) mapDefault!9535)) b!215749))

(declare-fun m!242969 () Bool)

(assert (=> mapNonEmpty!9535 m!242969))

(check-sat (not b!215739) (not b!215722) (not d!58533) (not b!215723) (not b!215721) tp_is_empty!5587 (not b_next!5725) b_and!12629 (not d!58535) (not mapNonEmpty!9535))
(check-sat b_and!12629 (not b_next!5725))
(get-model)

(declare-fun e!140367 () SeekEntryResult!723)

(declare-fun b!215762 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215762 (= e!140367 (seekKeyOrZeroReturnVacant!0 (bvadd (x!22521 lt!111065) #b00000000000000000000000000000001) (nextIndex!0 (index!5064 lt!111065) (bvadd (x!22521 lt!111065) #b00000000000000000000000000000001) (mask!9756 thiss!1504)) (index!5064 lt!111065) key!932 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)))))

(declare-fun b!215763 () Bool)

(assert (=> b!215763 (= e!140367 (MissingVacant!723 (index!5064 lt!111065)))))

(declare-fun b!215764 () Bool)

(declare-fun e!140365 () SeekEntryResult!723)

(declare-fun e!140366 () SeekEntryResult!723)

(assert (=> b!215764 (= e!140365 e!140366)))

(declare-fun c!36238 () Bool)

(declare-fun lt!111071 () (_ BitVec 64))

(assert (=> b!215764 (= c!36238 (= lt!111071 key!932))))

(declare-fun b!215765 () Bool)

(declare-fun c!36239 () Bool)

(assert (=> b!215765 (= c!36239 (= lt!111071 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215765 (= e!140366 e!140367)))

(declare-fun lt!111070 () SeekEntryResult!723)

(declare-fun d!58543 () Bool)

(assert (=> d!58543 (and (or ((_ is Undefined!723) lt!111070) (not ((_ is Found!723) lt!111070)) (and (bvsge (index!5063 lt!111070) #b00000000000000000000000000000000) (bvslt (index!5063 lt!111070) (size!5258 (_keys!6085 thiss!1504))))) (or ((_ is Undefined!723) lt!111070) ((_ is Found!723) lt!111070) (not ((_ is MissingVacant!723) lt!111070)) (not (= (index!5065 lt!111070) (index!5064 lt!111065))) (and (bvsge (index!5065 lt!111070) #b00000000000000000000000000000000) (bvslt (index!5065 lt!111070) (size!5258 (_keys!6085 thiss!1504))))) (or ((_ is Undefined!723) lt!111070) (ite ((_ is Found!723) lt!111070) (= (select (arr!4928 (_keys!6085 thiss!1504)) (index!5063 lt!111070)) key!932) (and ((_ is MissingVacant!723) lt!111070) (= (index!5065 lt!111070) (index!5064 lt!111065)) (= (select (arr!4928 (_keys!6085 thiss!1504)) (index!5065 lt!111070)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!58543 (= lt!111070 e!140365)))

(declare-fun c!36240 () Bool)

(assert (=> d!58543 (= c!36240 (bvsge (x!22521 lt!111065) #b01111111111111111111111111111110))))

(assert (=> d!58543 (= lt!111071 (select (arr!4928 (_keys!6085 thiss!1504)) (index!5064 lt!111065)))))

(assert (=> d!58543 (validMask!0 (mask!9756 thiss!1504))))

(assert (=> d!58543 (= (seekKeyOrZeroReturnVacant!0 (x!22521 lt!111065) (index!5064 lt!111065) (index!5064 lt!111065) key!932 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)) lt!111070)))

(declare-fun b!215766 () Bool)

(assert (=> b!215766 (= e!140365 Undefined!723)))

(declare-fun b!215767 () Bool)

(assert (=> b!215767 (= e!140366 (Found!723 (index!5064 lt!111065)))))

(assert (= (and d!58543 c!36240) b!215766))

(assert (= (and d!58543 (not c!36240)) b!215764))

(assert (= (and b!215764 c!36238) b!215767))

(assert (= (and b!215764 (not c!36238)) b!215765))

(assert (= (and b!215765 c!36239) b!215763))

(assert (= (and b!215765 (not c!36239)) b!215762))

(declare-fun m!242971 () Bool)

(assert (=> b!215762 m!242971))

(assert (=> b!215762 m!242971))

(declare-fun m!242973 () Bool)

(assert (=> b!215762 m!242973))

(declare-fun m!242975 () Bool)

(assert (=> d!58543 m!242975))

(declare-fun m!242977 () Bool)

(assert (=> d!58543 m!242977))

(assert (=> d!58543 m!242965))

(assert (=> d!58543 m!242921))

(assert (=> b!215739 d!58543))

(declare-fun b!215778 () Bool)

(declare-fun res!105524 () Bool)

(declare-fun e!140370 () Bool)

(assert (=> b!215778 (=> (not res!105524) (not e!140370))))

(declare-fun size!5263 (LongMapFixedSize!2800) (_ BitVec 32))

(assert (=> b!215778 (= res!105524 (= (size!5263 thiss!1504) (bvadd (_size!1449 thiss!1504) (bvsdiv (bvadd (extraKeys!3787 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!58545 () Bool)

(declare-fun res!105523 () Bool)

(assert (=> d!58545 (=> (not res!105523) (not e!140370))))

(assert (=> d!58545 (= res!105523 (validMask!0 (mask!9756 thiss!1504)))))

(assert (=> d!58545 (= (simpleValid!219 thiss!1504) e!140370)))

(declare-fun b!215779 () Bool)

(assert (=> b!215779 (= e!140370 (and (bvsge (extraKeys!3787 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3787 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1449 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215777 () Bool)

(declare-fun res!105525 () Bool)

(assert (=> b!215777 (=> (not res!105525) (not e!140370))))

(assert (=> b!215777 (= res!105525 (bvsge (size!5263 thiss!1504) (_size!1449 thiss!1504)))))

(declare-fun b!215776 () Bool)

(declare-fun res!105526 () Bool)

(assert (=> b!215776 (=> (not res!105526) (not e!140370))))

(assert (=> b!215776 (= res!105526 (and (= (size!5257 (_values!4033 thiss!1504)) (bvadd (mask!9756 thiss!1504) #b00000000000000000000000000000001)) (= (size!5258 (_keys!6085 thiss!1504)) (size!5257 (_values!4033 thiss!1504))) (bvsge (_size!1449 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1449 thiss!1504) (bvadd (mask!9756 thiss!1504) #b00000000000000000000000000000001))))))

(assert (= (and d!58545 res!105523) b!215776))

(assert (= (and b!215776 res!105526) b!215777))

(assert (= (and b!215777 res!105525) b!215778))

(assert (= (and b!215778 res!105524) b!215779))

(declare-fun m!242979 () Bool)

(assert (=> b!215778 m!242979))

(assert (=> d!58545 m!242921))

(assert (=> b!215777 m!242979))

(assert (=> d!58533 d!58545))

(declare-fun b!215788 () Bool)

(declare-fun e!140375 () (_ BitVec 32))

(assert (=> b!215788 (= e!140375 #b00000000000000000000000000000000)))

(declare-fun b!215789 () Bool)

(declare-fun e!140376 () (_ BitVec 32))

(declare-fun call!20340 () (_ BitVec 32))

(assert (=> b!215789 (= e!140376 call!20340)))

(declare-fun bm!20337 () Bool)

(assert (=> bm!20337 (= call!20340 (arrayCountValidKeys!0 (_keys!6085 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5258 (_keys!6085 thiss!1504))))))

(declare-fun b!215790 () Bool)

(assert (=> b!215790 (= e!140375 e!140376)))

(declare-fun c!36245 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!215790 (= c!36245 (validKeyInArray!0 (select (arr!4928 (_keys!6085 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215791 () Bool)

(assert (=> b!215791 (= e!140376 (bvadd #b00000000000000000000000000000001 call!20340))))

(declare-fun d!58547 () Bool)

(declare-fun lt!111074 () (_ BitVec 32))

(assert (=> d!58547 (and (bvsge lt!111074 #b00000000000000000000000000000000) (bvsle lt!111074 (bvsub (size!5258 (_keys!6085 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58547 (= lt!111074 e!140375)))

(declare-fun c!36246 () Bool)

(assert (=> d!58547 (= c!36246 (bvsge #b00000000000000000000000000000000 (size!5258 (_keys!6085 thiss!1504))))))

(assert (=> d!58547 (and (bvsle #b00000000000000000000000000000000 (size!5258 (_keys!6085 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5258 (_keys!6085 thiss!1504)) (size!5258 (_keys!6085 thiss!1504))))))

(assert (=> d!58547 (= (arrayCountValidKeys!0 (_keys!6085 thiss!1504) #b00000000000000000000000000000000 (size!5258 (_keys!6085 thiss!1504))) lt!111074)))

(assert (= (and d!58547 c!36246) b!215788))

(assert (= (and d!58547 (not c!36246)) b!215790))

(assert (= (and b!215790 c!36245) b!215791))

(assert (= (and b!215790 (not c!36245)) b!215789))

(assert (= (or b!215791 b!215789) bm!20337))

(declare-fun m!242981 () Bool)

(assert (=> bm!20337 m!242981))

(declare-fun m!242983 () Bool)

(assert (=> b!215790 m!242983))

(assert (=> b!215790 m!242983))

(declare-fun m!242985 () Bool)

(assert (=> b!215790 m!242985))

(assert (=> b!215721 d!58547))

(declare-fun b!215800 () Bool)

(declare-fun e!140384 () Bool)

(declare-fun e!140385 () Bool)

(assert (=> b!215800 (= e!140384 e!140385)))

(declare-fun lt!111081 () (_ BitVec 64))

(assert (=> b!215800 (= lt!111081 (select (arr!4928 (_keys!6085 thiss!1504)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!6484 0))(
  ( (Unit!6485) )
))
(declare-fun lt!111082 () Unit!6484)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10403 (_ BitVec 64) (_ BitVec 32)) Unit!6484)

(assert (=> b!215800 (= lt!111082 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6085 thiss!1504) lt!111081 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!215800 (arrayContainsKey!0 (_keys!6085 thiss!1504) lt!111081 #b00000000000000000000000000000000)))

(declare-fun lt!111083 () Unit!6484)

(assert (=> b!215800 (= lt!111083 lt!111082)))

(declare-fun res!105531 () Bool)

(assert (=> b!215800 (= res!105531 (= (seekEntryOrOpen!0 (select (arr!4928 (_keys!6085 thiss!1504)) #b00000000000000000000000000000000) (_keys!6085 thiss!1504) (mask!9756 thiss!1504)) (Found!723 #b00000000000000000000000000000000)))))

(assert (=> b!215800 (=> (not res!105531) (not e!140385))))

(declare-fun b!215801 () Bool)

(declare-fun call!20343 () Bool)

(assert (=> b!215801 (= e!140385 call!20343)))

(declare-fun b!215802 () Bool)

(assert (=> b!215802 (= e!140384 call!20343)))

(declare-fun b!215803 () Bool)

(declare-fun e!140383 () Bool)

(assert (=> b!215803 (= e!140383 e!140384)))

(declare-fun c!36249 () Bool)

(assert (=> b!215803 (= c!36249 (validKeyInArray!0 (select (arr!4928 (_keys!6085 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!20340 () Bool)

(assert (=> bm!20340 (= call!20343 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6085 thiss!1504) (mask!9756 thiss!1504)))))

(declare-fun d!58549 () Bool)

(declare-fun res!105532 () Bool)

(assert (=> d!58549 (=> res!105532 e!140383)))

(assert (=> d!58549 (= res!105532 (bvsge #b00000000000000000000000000000000 (size!5258 (_keys!6085 thiss!1504))))))

(assert (=> d!58549 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)) e!140383)))

(assert (= (and d!58549 (not res!105532)) b!215803))

(assert (= (and b!215803 c!36249) b!215800))

(assert (= (and b!215803 (not c!36249)) b!215802))

(assert (= (and b!215800 res!105531) b!215801))

(assert (= (or b!215801 b!215802) bm!20340))

(assert (=> b!215800 m!242983))

(declare-fun m!242987 () Bool)

(assert (=> b!215800 m!242987))

(declare-fun m!242989 () Bool)

(assert (=> b!215800 m!242989))

(assert (=> b!215800 m!242983))

(declare-fun m!242991 () Bool)

(assert (=> b!215800 m!242991))

(assert (=> b!215803 m!242983))

(assert (=> b!215803 m!242983))

(assert (=> b!215803 m!242985))

(declare-fun m!242993 () Bool)

(assert (=> bm!20340 m!242993))

(assert (=> b!215722 d!58549))

(declare-fun d!58551 () Bool)

(declare-fun e!140399 () Bool)

(assert (=> d!58551 e!140399))

(declare-fun c!36257 () Bool)

(declare-fun lt!111089 () SeekEntryResult!723)

(assert (=> d!58551 (= c!36257 (and ((_ is Intermediate!723) lt!111089) (undefined!1535 lt!111089)))))

(declare-fun e!140396 () SeekEntryResult!723)

(assert (=> d!58551 (= lt!111089 e!140396)))

(declare-fun c!36256 () Bool)

(assert (=> d!58551 (= c!36256 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!111088 () (_ BitVec 64))

(assert (=> d!58551 (= lt!111088 (select (arr!4928 (_keys!6085 thiss!1504)) (toIndex!0 key!932 (mask!9756 thiss!1504))))))

(assert (=> d!58551 (validMask!0 (mask!9756 thiss!1504))))

(assert (=> d!58551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9756 thiss!1504)) key!932 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)) lt!111089)))

(declare-fun b!215822 () Bool)

(assert (=> b!215822 (= e!140399 (bvsge (x!22521 lt!111089) #b01111111111111111111111111111110))))

(declare-fun b!215823 () Bool)

(declare-fun e!140397 () SeekEntryResult!723)

(assert (=> b!215823 (= e!140397 (Intermediate!723 false (toIndex!0 key!932 (mask!9756 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215824 () Bool)

(assert (=> b!215824 (and (bvsge (index!5064 lt!111089) #b00000000000000000000000000000000) (bvslt (index!5064 lt!111089) (size!5258 (_keys!6085 thiss!1504))))))

(declare-fun e!140398 () Bool)

(assert (=> b!215824 (= e!140398 (= (select (arr!4928 (_keys!6085 thiss!1504)) (index!5064 lt!111089)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!215825 () Bool)

(assert (=> b!215825 (= e!140396 (Intermediate!723 true (toIndex!0 key!932 (mask!9756 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!215826 () Bool)

(assert (=> b!215826 (= e!140396 e!140397)))

(declare-fun c!36258 () Bool)

(assert (=> b!215826 (= c!36258 (or (= lt!111088 key!932) (= (bvadd lt!111088 lt!111088) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!215827 () Bool)

(declare-fun e!140400 () Bool)

(assert (=> b!215827 (= e!140399 e!140400)))

(declare-fun res!105540 () Bool)

(assert (=> b!215827 (= res!105540 (and ((_ is Intermediate!723) lt!111089) (not (undefined!1535 lt!111089)) (bvslt (x!22521 lt!111089) #b01111111111111111111111111111110) (bvsge (x!22521 lt!111089) #b00000000000000000000000000000000) (bvsge (x!22521 lt!111089) #b00000000000000000000000000000000)))))

(assert (=> b!215827 (=> (not res!105540) (not e!140400))))

(declare-fun b!215828 () Bool)

(assert (=> b!215828 (and (bvsge (index!5064 lt!111089) #b00000000000000000000000000000000) (bvslt (index!5064 lt!111089) (size!5258 (_keys!6085 thiss!1504))))))

(declare-fun res!105539 () Bool)

(assert (=> b!215828 (= res!105539 (= (select (arr!4928 (_keys!6085 thiss!1504)) (index!5064 lt!111089)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215828 (=> res!105539 e!140398)))

(declare-fun b!215829 () Bool)

(assert (=> b!215829 (and (bvsge (index!5064 lt!111089) #b00000000000000000000000000000000) (bvslt (index!5064 lt!111089) (size!5258 (_keys!6085 thiss!1504))))))

(declare-fun res!105541 () Bool)

(assert (=> b!215829 (= res!105541 (= (select (arr!4928 (_keys!6085 thiss!1504)) (index!5064 lt!111089)) key!932))))

(assert (=> b!215829 (=> res!105541 e!140398)))

(assert (=> b!215829 (= e!140400 e!140398)))

(declare-fun b!215830 () Bool)

(assert (=> b!215830 (= e!140397 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!9756 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!9756 thiss!1504)) key!932 (_keys!6085 thiss!1504) (mask!9756 thiss!1504)))))

(assert (= (and d!58551 c!36256) b!215825))

(assert (= (and d!58551 (not c!36256)) b!215826))

(assert (= (and b!215826 c!36258) b!215823))

(assert (= (and b!215826 (not c!36258)) b!215830))

(assert (= (and d!58551 c!36257) b!215822))

(assert (= (and d!58551 (not c!36257)) b!215827))

(assert (= (and b!215827 res!105540) b!215829))

(assert (= (and b!215829 (not res!105541)) b!215828))

(assert (= (and b!215828 (not res!105539)) b!215824))

(assert (=> b!215830 m!242959))

(declare-fun m!242995 () Bool)

(assert (=> b!215830 m!242995))

(assert (=> b!215830 m!242995))

(declare-fun m!242997 () Bool)

(assert (=> b!215830 m!242997))

(declare-fun m!242999 () Bool)

(assert (=> b!215829 m!242999))

(assert (=> b!215824 m!242999))

(assert (=> d!58551 m!242959))

(declare-fun m!243001 () Bool)

(assert (=> d!58551 m!243001))

(assert (=> d!58551 m!242921))

(assert (=> b!215828 m!242999))

(assert (=> d!58535 d!58551))

(declare-fun d!58553 () Bool)

(declare-fun lt!111095 () (_ BitVec 32))

(declare-fun lt!111094 () (_ BitVec 32))

(assert (=> d!58553 (= lt!111095 (bvmul (bvxor lt!111094 (bvlshr lt!111094 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58553 (= lt!111094 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58553 (and (bvsge (mask!9756 thiss!1504) #b00000000000000000000000000000000) (let ((res!105542 (let ((h!3715 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!22538 (bvmul (bvxor h!3715 (bvlshr h!3715 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!22538 (bvlshr x!22538 #b00000000000000000000000000001101)) (mask!9756 thiss!1504)))))) (and (bvslt res!105542 (bvadd (mask!9756 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!105542 #b00000000000000000000000000000000))))))

(assert (=> d!58553 (= (toIndex!0 key!932 (mask!9756 thiss!1504)) (bvand (bvxor lt!111095 (bvlshr lt!111095 #b00000000000000000000000000001101)) (mask!9756 thiss!1504)))))

(assert (=> d!58535 d!58553))

(assert (=> d!58535 d!58541))

(declare-fun b!215841 () Bool)

(declare-fun e!140410 () Bool)

(declare-fun e!140412 () Bool)

(assert (=> b!215841 (= e!140410 e!140412)))

(declare-fun c!36261 () Bool)

(assert (=> b!215841 (= c!36261 (validKeyInArray!0 (select (arr!4928 (_keys!6085 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!215842 () Bool)

(declare-fun e!140411 () Bool)

(declare-fun contains!1413 (List!3073 (_ BitVec 64)) Bool)

(assert (=> b!215842 (= e!140411 (contains!1413 Nil!3070 (select (arr!4928 (_keys!6085 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58555 () Bool)

(declare-fun res!105551 () Bool)

(declare-fun e!140409 () Bool)

(assert (=> d!58555 (=> res!105551 e!140409)))

(assert (=> d!58555 (= res!105551 (bvsge #b00000000000000000000000000000000 (size!5258 (_keys!6085 thiss!1504))))))

(assert (=> d!58555 (= (arrayNoDuplicates!0 (_keys!6085 thiss!1504) #b00000000000000000000000000000000 Nil!3070) e!140409)))

(declare-fun bm!20343 () Bool)

(declare-fun call!20346 () Bool)

(assert (=> bm!20343 (= call!20346 (arrayNoDuplicates!0 (_keys!6085 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!36261 (Cons!3069 (select (arr!4928 (_keys!6085 thiss!1504)) #b00000000000000000000000000000000) Nil!3070) Nil!3070)))))

(declare-fun b!215843 () Bool)

(assert (=> b!215843 (= e!140412 call!20346)))

(declare-fun b!215844 () Bool)

(assert (=> b!215844 (= e!140412 call!20346)))

(declare-fun b!215845 () Bool)

(assert (=> b!215845 (= e!140409 e!140410)))

(declare-fun res!105550 () Bool)

(assert (=> b!215845 (=> (not res!105550) (not e!140410))))

(assert (=> b!215845 (= res!105550 (not e!140411))))

(declare-fun res!105549 () Bool)

(assert (=> b!215845 (=> (not res!105549) (not e!140411))))

(assert (=> b!215845 (= res!105549 (validKeyInArray!0 (select (arr!4928 (_keys!6085 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58555 (not res!105551)) b!215845))

(assert (= (and b!215845 res!105549) b!215842))

(assert (= (and b!215845 res!105550) b!215841))

(assert (= (and b!215841 c!36261) b!215844))

(assert (= (and b!215841 (not c!36261)) b!215843))

(assert (= (or b!215844 b!215843) bm!20343))

(assert (=> b!215841 m!242983))

(assert (=> b!215841 m!242983))

(assert (=> b!215841 m!242985))

(assert (=> b!215842 m!242983))

(assert (=> b!215842 m!242983))

(declare-fun m!243003 () Bool)

(assert (=> b!215842 m!243003))

(assert (=> bm!20343 m!242983))

(declare-fun m!243005 () Bool)

(assert (=> bm!20343 m!243005))

(assert (=> b!215845 m!242983))

(assert (=> b!215845 m!242983))

(assert (=> b!215845 m!242985))

(assert (=> b!215723 d!58555))

(declare-fun b!215846 () Bool)

(declare-fun e!140414 () Bool)

(assert (=> b!215846 (= e!140414 tp_is_empty!5587)))

(declare-fun condMapEmpty!9536 () Bool)

(declare-fun mapDefault!9536 () ValueCell!2450)

(assert (=> mapNonEmpty!9535 (= condMapEmpty!9536 (= mapRest!9535 ((as const (Array (_ BitVec 32) ValueCell!2450)) mapDefault!9536)))))

(declare-fun e!140413 () Bool)

(declare-fun mapRes!9536 () Bool)

(assert (=> mapNonEmpty!9535 (= tp!20308 (and e!140413 mapRes!9536))))

(declare-fun mapNonEmpty!9536 () Bool)

(declare-fun tp!20309 () Bool)

(assert (=> mapNonEmpty!9536 (= mapRes!9536 (and tp!20309 e!140414))))

(declare-fun mapKey!9536 () (_ BitVec 32))

(declare-fun mapValue!9536 () ValueCell!2450)

(declare-fun mapRest!9536 () (Array (_ BitVec 32) ValueCell!2450))

(assert (=> mapNonEmpty!9536 (= mapRest!9535 (store mapRest!9536 mapKey!9536 mapValue!9536))))

(declare-fun mapIsEmpty!9536 () Bool)

(assert (=> mapIsEmpty!9536 mapRes!9536))

(declare-fun b!215847 () Bool)

(assert (=> b!215847 (= e!140413 tp_is_empty!5587)))

(assert (= (and mapNonEmpty!9535 condMapEmpty!9536) mapIsEmpty!9536))

(assert (= (and mapNonEmpty!9535 (not condMapEmpty!9536)) mapNonEmpty!9536))

(assert (= (and mapNonEmpty!9536 ((_ is ValueCellFull!2450) mapValue!9536)) b!215846))

(assert (= (and mapNonEmpty!9535 ((_ is ValueCellFull!2450) mapDefault!9536)) b!215847))

(declare-fun m!243007 () Bool)

(assert (=> mapNonEmpty!9536 m!243007))

(check-sat (not bm!20340) (not mapNonEmpty!9536) (not b!215762) (not b!215790) (not b!215803) (not d!58551) (not b!215777) (not b!215842) tp_is_empty!5587 (not b!215841) (not d!58543) (not bm!20343) (not d!58545) (not b_next!5725) b_and!12629 (not b!215845) (not b!215830) (not b!215800) (not b!215778) (not bm!20337))
(check-sat b_and!12629 (not b_next!5725))
