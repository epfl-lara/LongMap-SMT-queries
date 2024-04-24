; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21476 () Bool)

(assert start!21476)

(declare-fun b!215558 () Bool)

(declare-fun b_free!5719 () Bool)

(declare-fun b_next!5719 () Bool)

(assert (=> b!215558 (= b_free!5719 (not b_next!5719))))

(declare-fun tp!20272 () Bool)

(declare-fun b_and!12623 () Bool)

(assert (=> b!215558 (= tp!20272 b_and!12623)))

(declare-fun b!215552 () Bool)

(declare-fun e!140217 () Bool)

(declare-datatypes ((V!7089 0))(
  ( (V!7090 (val!2835 Int)) )
))
(declare-datatypes ((ValueCell!2447 0))(
  ( (ValueCellFull!2447 (v!4854 V!7089)) (EmptyCell!2447) )
))
(declare-datatypes ((array!10387 0))(
  ( (array!10388 (arr!4921 (Array (_ BitVec 32) ValueCell!2447)) (size!5251 (_ BitVec 32))) )
))
(declare-datatypes ((array!10389 0))(
  ( (array!10390 (arr!4922 (Array (_ BitVec 32) (_ BitVec 64))) (size!5252 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2794 0))(
  ( (LongMapFixedSize!2795 (defaultEntry!4047 Int) (mask!9749 (_ BitVec 32)) (extraKeys!3784 (_ BitVec 32)) (zeroValue!3888 V!7089) (minValue!3888 V!7089) (_size!1446 (_ BitVec 32)) (_keys!6081 array!10389) (_values!4030 array!10387) (_vacant!1446 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2794)

(assert (=> b!215552 (= e!140217 (and (= (size!5251 (_values!4030 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9749 thiss!1504))) (= (size!5252 (_keys!6081 thiss!1504)) (size!5251 (_values!4030 thiss!1504))) (bvslt (mask!9749 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!215553 () Bool)

(declare-fun e!140214 () Bool)

(declare-fun tp_is_empty!5581 () Bool)

(assert (=> b!215553 (= e!140214 tp_is_empty!5581)))

(declare-fun b!215554 () Bool)

(declare-fun res!105436 () Bool)

(declare-fun e!140212 () Bool)

(assert (=> b!215554 (=> (not res!105436) (not e!140212))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!215554 (= res!105436 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!105433 () Bool)

(assert (=> start!21476 (=> (not res!105433) (not e!140212))))

(declare-fun valid!1160 (LongMapFixedSize!2794) Bool)

(assert (=> start!21476 (= res!105433 (valid!1160 thiss!1504))))

(assert (=> start!21476 e!140212))

(declare-fun e!140213 () Bool)

(assert (=> start!21476 e!140213))

(assert (=> start!21476 true))

(declare-fun b!215555 () Bool)

(declare-fun e!140216 () Bool)

(assert (=> b!215555 (= e!140216 tp_is_empty!5581)))

(declare-fun mapNonEmpty!9514 () Bool)

(declare-fun mapRes!9514 () Bool)

(declare-fun tp!20271 () Bool)

(assert (=> mapNonEmpty!9514 (= mapRes!9514 (and tp!20271 e!140216))))

(declare-fun mapValue!9514 () ValueCell!2447)

(declare-fun mapKey!9514 () (_ BitVec 32))

(declare-fun mapRest!9514 () (Array (_ BitVec 32) ValueCell!2447))

(assert (=> mapNonEmpty!9514 (= (arr!4921 (_values!4030 thiss!1504)) (store mapRest!9514 mapKey!9514 mapValue!9514))))

(declare-fun b!215556 () Bool)

(declare-fun e!140211 () Bool)

(assert (=> b!215556 (= e!140211 (and e!140214 mapRes!9514))))

(declare-fun condMapEmpty!9514 () Bool)

(declare-fun mapDefault!9514 () ValueCell!2447)

(assert (=> b!215556 (= condMapEmpty!9514 (= (arr!4921 (_values!4030 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2447)) mapDefault!9514)))))

(declare-fun b!215557 () Bool)

(assert (=> b!215557 (= e!140212 e!140217)))

(declare-fun res!105434 () Bool)

(assert (=> b!215557 (=> (not res!105434) (not e!140217))))

(declare-datatypes ((SeekEntryResult!722 0))(
  ( (MissingZero!722 (index!5058 (_ BitVec 32))) (Found!722 (index!5059 (_ BitVec 32))) (Intermediate!722 (undefined!1534 Bool) (index!5060 (_ BitVec 32)) (x!22504 (_ BitVec 32))) (Undefined!722) (MissingVacant!722 (index!5061 (_ BitVec 32))) )
))
(declare-fun lt!111032 () SeekEntryResult!722)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!215557 (= res!105434 (or (= lt!111032 (MissingZero!722 index!297)) (= lt!111032 (MissingVacant!722 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10389 (_ BitVec 32)) SeekEntryResult!722)

(assert (=> b!215557 (= lt!111032 (seekEntryOrOpen!0 key!932 (_keys!6081 thiss!1504) (mask!9749 thiss!1504)))))

(declare-fun mapIsEmpty!9514 () Bool)

(assert (=> mapIsEmpty!9514 mapRes!9514))

(declare-fun array_inv!3235 (array!10389) Bool)

(declare-fun array_inv!3236 (array!10387) Bool)

(assert (=> b!215558 (= e!140213 (and tp!20272 tp_is_empty!5581 (array_inv!3235 (_keys!6081 thiss!1504)) (array_inv!3236 (_values!4030 thiss!1504)) e!140211))))

(declare-fun b!215559 () Bool)

(declare-fun res!105435 () Bool)

(assert (=> b!215559 (=> (not res!105435) (not e!140217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!215559 (= res!105435 (validMask!0 (mask!9749 thiss!1504)))))

(assert (= (and start!21476 res!105433) b!215554))

(assert (= (and b!215554 res!105436) b!215557))

(assert (= (and b!215557 res!105434) b!215559))

(assert (= (and b!215559 res!105435) b!215552))

(assert (= (and b!215556 condMapEmpty!9514) mapIsEmpty!9514))

(assert (= (and b!215556 (not condMapEmpty!9514)) mapNonEmpty!9514))

(get-info :version)

(assert (= (and mapNonEmpty!9514 ((_ is ValueCellFull!2447) mapValue!9514)) b!215555))

(assert (= (and b!215556 ((_ is ValueCellFull!2447) mapDefault!9514)) b!215553))

(assert (= b!215558 b!215556))

(assert (= start!21476 b!215558))

(declare-fun m!242851 () Bool)

(assert (=> start!21476 m!242851))

(declare-fun m!242853 () Bool)

(assert (=> b!215558 m!242853))

(declare-fun m!242855 () Bool)

(assert (=> b!215558 m!242855))

(declare-fun m!242857 () Bool)

(assert (=> b!215557 m!242857))

(declare-fun m!242859 () Bool)

(assert (=> b!215559 m!242859))

(declare-fun m!242861 () Bool)

(assert (=> mapNonEmpty!9514 m!242861))

(check-sat tp_is_empty!5581 (not mapNonEmpty!9514) b_and!12623 (not b_next!5719) (not b!215558) (not start!21476) (not b!215559) (not b!215557))
(check-sat b_and!12623 (not b_next!5719))
(get-model)

(declare-fun e!140267 () SeekEntryResult!722)

(declare-fun lt!111047 () SeekEntryResult!722)

(declare-fun b!215620 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10389 (_ BitVec 32)) SeekEntryResult!722)

(assert (=> b!215620 (= e!140267 (seekKeyOrZeroReturnVacant!0 (x!22504 lt!111047) (index!5060 lt!111047) (index!5060 lt!111047) key!932 (_keys!6081 thiss!1504) (mask!9749 thiss!1504)))))

(declare-fun d!58521 () Bool)

(declare-fun lt!111046 () SeekEntryResult!722)

(assert (=> d!58521 (and (or ((_ is Undefined!722) lt!111046) (not ((_ is Found!722) lt!111046)) (and (bvsge (index!5059 lt!111046) #b00000000000000000000000000000000) (bvslt (index!5059 lt!111046) (size!5252 (_keys!6081 thiss!1504))))) (or ((_ is Undefined!722) lt!111046) ((_ is Found!722) lt!111046) (not ((_ is MissingZero!722) lt!111046)) (and (bvsge (index!5058 lt!111046) #b00000000000000000000000000000000) (bvslt (index!5058 lt!111046) (size!5252 (_keys!6081 thiss!1504))))) (or ((_ is Undefined!722) lt!111046) ((_ is Found!722) lt!111046) ((_ is MissingZero!722) lt!111046) (not ((_ is MissingVacant!722) lt!111046)) (and (bvsge (index!5061 lt!111046) #b00000000000000000000000000000000) (bvslt (index!5061 lt!111046) (size!5252 (_keys!6081 thiss!1504))))) (or ((_ is Undefined!722) lt!111046) (ite ((_ is Found!722) lt!111046) (= (select (arr!4922 (_keys!6081 thiss!1504)) (index!5059 lt!111046)) key!932) (ite ((_ is MissingZero!722) lt!111046) (= (select (arr!4922 (_keys!6081 thiss!1504)) (index!5058 lt!111046)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!722) lt!111046) (= (select (arr!4922 (_keys!6081 thiss!1504)) (index!5061 lt!111046)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!140268 () SeekEntryResult!722)

(assert (=> d!58521 (= lt!111046 e!140268)))

(declare-fun c!36220 () Bool)

(assert (=> d!58521 (= c!36220 (and ((_ is Intermediate!722) lt!111047) (undefined!1534 lt!111047)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10389 (_ BitVec 32)) SeekEntryResult!722)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58521 (= lt!111047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9749 thiss!1504)) key!932 (_keys!6081 thiss!1504) (mask!9749 thiss!1504)))))

(assert (=> d!58521 (validMask!0 (mask!9749 thiss!1504))))

(assert (=> d!58521 (= (seekEntryOrOpen!0 key!932 (_keys!6081 thiss!1504) (mask!9749 thiss!1504)) lt!111046)))

(declare-fun b!215621 () Bool)

(declare-fun e!140266 () SeekEntryResult!722)

(assert (=> b!215621 (= e!140266 (Found!722 (index!5060 lt!111047)))))

(declare-fun b!215622 () Bool)

(assert (=> b!215622 (= e!140268 Undefined!722)))

(declare-fun b!215623 () Bool)

(assert (=> b!215623 (= e!140268 e!140266)))

(declare-fun lt!111045 () (_ BitVec 64))

(assert (=> b!215623 (= lt!111045 (select (arr!4922 (_keys!6081 thiss!1504)) (index!5060 lt!111047)))))

(declare-fun c!36222 () Bool)

(assert (=> b!215623 (= c!36222 (= lt!111045 key!932))))

(declare-fun b!215624 () Bool)

(declare-fun c!36221 () Bool)

(assert (=> b!215624 (= c!36221 (= lt!111045 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!215624 (= e!140266 e!140267)))

(declare-fun b!215625 () Bool)

(assert (=> b!215625 (= e!140267 (MissingZero!722 (index!5060 lt!111047)))))

(assert (= (and d!58521 c!36220) b!215622))

(assert (= (and d!58521 (not c!36220)) b!215623))

(assert (= (and b!215623 c!36222) b!215621))

(assert (= (and b!215623 (not c!36222)) b!215624))

(assert (= (and b!215624 c!36221) b!215625))

(assert (= (and b!215624 (not c!36221)) b!215620))

(declare-fun m!242887 () Bool)

(assert (=> b!215620 m!242887))

(declare-fun m!242889 () Bool)

(assert (=> d!58521 m!242889))

(declare-fun m!242891 () Bool)

(assert (=> d!58521 m!242891))

(assert (=> d!58521 m!242859))

(declare-fun m!242893 () Bool)

(assert (=> d!58521 m!242893))

(declare-fun m!242895 () Bool)

(assert (=> d!58521 m!242895))

(declare-fun m!242897 () Bool)

(assert (=> d!58521 m!242897))

(assert (=> d!58521 m!242893))

(declare-fun m!242899 () Bool)

(assert (=> b!215623 m!242899))

(assert (=> b!215557 d!58521))

(declare-fun d!58523 () Bool)

(assert (=> d!58523 (= (array_inv!3235 (_keys!6081 thiss!1504)) (bvsge (size!5252 (_keys!6081 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215558 d!58523))

(declare-fun d!58525 () Bool)

(assert (=> d!58525 (= (array_inv!3236 (_values!4030 thiss!1504)) (bvsge (size!5251 (_values!4030 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!215558 d!58525))

(declare-fun d!58527 () Bool)

(declare-fun res!105467 () Bool)

(declare-fun e!140271 () Bool)

(assert (=> d!58527 (=> (not res!105467) (not e!140271))))

(declare-fun simpleValid!218 (LongMapFixedSize!2794) Bool)

(assert (=> d!58527 (= res!105467 (simpleValid!218 thiss!1504))))

(assert (=> d!58527 (= (valid!1160 thiss!1504) e!140271)))

(declare-fun b!215632 () Bool)

(declare-fun res!105468 () Bool)

(assert (=> b!215632 (=> (not res!105468) (not e!140271))))

(declare-fun arrayCountValidKeys!0 (array!10389 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!215632 (= res!105468 (= (arrayCountValidKeys!0 (_keys!6081 thiss!1504) #b00000000000000000000000000000000 (size!5252 (_keys!6081 thiss!1504))) (_size!1446 thiss!1504)))))

(declare-fun b!215633 () Bool)

(declare-fun res!105469 () Bool)

(assert (=> b!215633 (=> (not res!105469) (not e!140271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10389 (_ BitVec 32)) Bool)

(assert (=> b!215633 (= res!105469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6081 thiss!1504) (mask!9749 thiss!1504)))))

(declare-fun b!215634 () Bool)

(declare-datatypes ((List!3072 0))(
  ( (Nil!3069) (Cons!3068 (h!3713 (_ BitVec 64)) (t!8019 List!3072)) )
))
(declare-fun arrayNoDuplicates!0 (array!10389 (_ BitVec 32) List!3072) Bool)

(assert (=> b!215634 (= e!140271 (arrayNoDuplicates!0 (_keys!6081 thiss!1504) #b00000000000000000000000000000000 Nil!3069))))

(assert (= (and d!58527 res!105467) b!215632))

(assert (= (and b!215632 res!105468) b!215633))

(assert (= (and b!215633 res!105469) b!215634))

(declare-fun m!242901 () Bool)

(assert (=> d!58527 m!242901))

(declare-fun m!242903 () Bool)

(assert (=> b!215632 m!242903))

(declare-fun m!242905 () Bool)

(assert (=> b!215633 m!242905))

(declare-fun m!242907 () Bool)

(assert (=> b!215634 m!242907))

(assert (=> start!21476 d!58527))

(declare-fun d!58529 () Bool)

(assert (=> d!58529 (= (validMask!0 (mask!9749 thiss!1504)) (and (or (= (mask!9749 thiss!1504) #b00000000000000000000000000000111) (= (mask!9749 thiss!1504) #b00000000000000000000000000001111) (= (mask!9749 thiss!1504) #b00000000000000000000000000011111) (= (mask!9749 thiss!1504) #b00000000000000000000000000111111) (= (mask!9749 thiss!1504) #b00000000000000000000000001111111) (= (mask!9749 thiss!1504) #b00000000000000000000000011111111) (= (mask!9749 thiss!1504) #b00000000000000000000000111111111) (= (mask!9749 thiss!1504) #b00000000000000000000001111111111) (= (mask!9749 thiss!1504) #b00000000000000000000011111111111) (= (mask!9749 thiss!1504) #b00000000000000000000111111111111) (= (mask!9749 thiss!1504) #b00000000000000000001111111111111) (= (mask!9749 thiss!1504) #b00000000000000000011111111111111) (= (mask!9749 thiss!1504) #b00000000000000000111111111111111) (= (mask!9749 thiss!1504) #b00000000000000001111111111111111) (= (mask!9749 thiss!1504) #b00000000000000011111111111111111) (= (mask!9749 thiss!1504) #b00000000000000111111111111111111) (= (mask!9749 thiss!1504) #b00000000000001111111111111111111) (= (mask!9749 thiss!1504) #b00000000000011111111111111111111) (= (mask!9749 thiss!1504) #b00000000000111111111111111111111) (= (mask!9749 thiss!1504) #b00000000001111111111111111111111) (= (mask!9749 thiss!1504) #b00000000011111111111111111111111) (= (mask!9749 thiss!1504) #b00000000111111111111111111111111) (= (mask!9749 thiss!1504) #b00000001111111111111111111111111) (= (mask!9749 thiss!1504) #b00000011111111111111111111111111) (= (mask!9749 thiss!1504) #b00000111111111111111111111111111) (= (mask!9749 thiss!1504) #b00001111111111111111111111111111) (= (mask!9749 thiss!1504) #b00011111111111111111111111111111) (= (mask!9749 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9749 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!215559 d!58529))

(declare-fun b!215641 () Bool)

(declare-fun e!140276 () Bool)

(assert (=> b!215641 (= e!140276 tp_is_empty!5581)))

(declare-fun condMapEmpty!9523 () Bool)

(declare-fun mapDefault!9523 () ValueCell!2447)

(assert (=> mapNonEmpty!9514 (= condMapEmpty!9523 (= mapRest!9514 ((as const (Array (_ BitVec 32) ValueCell!2447)) mapDefault!9523)))))

(declare-fun e!140277 () Bool)

(declare-fun mapRes!9523 () Bool)

(assert (=> mapNonEmpty!9514 (= tp!20271 (and e!140277 mapRes!9523))))

(declare-fun mapIsEmpty!9523 () Bool)

(assert (=> mapIsEmpty!9523 mapRes!9523))

(declare-fun b!215642 () Bool)

(assert (=> b!215642 (= e!140277 tp_is_empty!5581)))

(declare-fun mapNonEmpty!9523 () Bool)

(declare-fun tp!20287 () Bool)

(assert (=> mapNonEmpty!9523 (= mapRes!9523 (and tp!20287 e!140276))))

(declare-fun mapRest!9523 () (Array (_ BitVec 32) ValueCell!2447))

(declare-fun mapValue!9523 () ValueCell!2447)

(declare-fun mapKey!9523 () (_ BitVec 32))

(assert (=> mapNonEmpty!9523 (= mapRest!9514 (store mapRest!9523 mapKey!9523 mapValue!9523))))

(assert (= (and mapNonEmpty!9514 condMapEmpty!9523) mapIsEmpty!9523))

(assert (= (and mapNonEmpty!9514 (not condMapEmpty!9523)) mapNonEmpty!9523))

(assert (= (and mapNonEmpty!9523 ((_ is ValueCellFull!2447) mapValue!9523)) b!215641))

(assert (= (and mapNonEmpty!9514 ((_ is ValueCellFull!2447) mapDefault!9523)) b!215642))

(declare-fun m!242909 () Bool)

(assert (=> mapNonEmpty!9523 m!242909))

(check-sat (not b!215634) (not mapNonEmpty!9523) tp_is_empty!5581 b_and!12623 (not b_next!5719) (not d!58521) (not b!215620) (not b!215633) (not d!58527) (not b!215632))
(check-sat b_and!12623 (not b_next!5719))
