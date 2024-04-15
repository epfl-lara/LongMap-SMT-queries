; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21320 () Bool)

(assert start!21320)

(declare-fun b!214324 () Bool)

(declare-fun b_free!5677 () Bool)

(declare-fun b_next!5677 () Bool)

(assert (=> b!214324 (= b_free!5677 (not b_next!5677))))

(declare-fun tp!20121 () Bool)

(declare-fun b_and!12541 () Bool)

(assert (=> b!214324 (= tp!20121 b_and!12541)))

(declare-fun b!214322 () Bool)

(declare-fun e!139389 () Bool)

(declare-fun tp_is_empty!5539 () Bool)

(assert (=> b!214322 (= e!139389 tp_is_empty!5539)))

(declare-fun mapIsEmpty!9427 () Bool)

(declare-fun mapRes!9427 () Bool)

(assert (=> mapIsEmpty!9427 mapRes!9427))

(declare-fun b!214323 () Bool)

(declare-fun res!104898 () Bool)

(declare-fun e!139385 () Bool)

(assert (=> b!214323 (=> (not res!104898) (not e!139385))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214323 (= res!104898 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!139388 () Bool)

(declare-datatypes ((V!7033 0))(
  ( (V!7034 (val!2814 Int)) )
))
(declare-datatypes ((ValueCell!2426 0))(
  ( (ValueCellFull!2426 (v!4826 V!7033)) (EmptyCell!2426) )
))
(declare-datatypes ((array!10283 0))(
  ( (array!10284 (arr!4875 (Array (_ BitVec 32) ValueCell!2426)) (size!5203 (_ BitVec 32))) )
))
(declare-datatypes ((array!10285 0))(
  ( (array!10286 (arr!4876 (Array (_ BitVec 32) (_ BitVec 64))) (size!5204 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2752 0))(
  ( (LongMapFixedSize!2753 (defaultEntry!4026 Int) (mask!9687 (_ BitVec 32)) (extraKeys!3763 (_ BitVec 32)) (zeroValue!3867 V!7033) (minValue!3867 V!7033) (_size!1425 (_ BitVec 32)) (_keys!6043 array!10285) (_values!4009 array!10283) (_vacant!1425 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2752)

(declare-fun e!139386 () Bool)

(declare-fun array_inv!3207 (array!10285) Bool)

(declare-fun array_inv!3208 (array!10283) Bool)

(assert (=> b!214324 (= e!139388 (and tp!20121 tp_is_empty!5539 (array_inv!3207 (_keys!6043 thiss!1504)) (array_inv!3208 (_values!4009 thiss!1504)) e!139386))))

(declare-fun b!214325 () Bool)

(declare-fun e!139387 () Bool)

(assert (=> b!214325 (= e!139387 tp_is_empty!5539)))

(declare-fun b!214326 () Bool)

(declare-fun res!104900 () Bool)

(assert (=> b!214326 (=> (not res!104900) (not e!139385))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!719 0))(
  ( (MissingZero!719 (index!5046 (_ BitVec 32))) (Found!719 (index!5047 (_ BitVec 32))) (Intermediate!719 (undefined!1531 Bool) (index!5048 (_ BitVec 32)) (x!22361 (_ BitVec 32))) (Undefined!719) (MissingVacant!719 (index!5049 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10285 (_ BitVec 32)) SeekEntryResult!719)

(assert (=> b!214326 (= res!104900 (not (= (seekEntryOrOpen!0 key!932 (_keys!6043 thiss!1504) (mask!9687 thiss!1504)) (MissingZero!719 index!297))))))

(declare-fun res!104899 () Bool)

(assert (=> start!21320 (=> (not res!104899) (not e!139385))))

(declare-fun valid!1145 (LongMapFixedSize!2752) Bool)

(assert (=> start!21320 (= res!104899 (valid!1145 thiss!1504))))

(assert (=> start!21320 e!139385))

(assert (=> start!21320 e!139388))

(assert (=> start!21320 true))

(declare-fun b!214327 () Bool)

(assert (=> b!214327 (= e!139386 (and e!139389 mapRes!9427))))

(declare-fun condMapEmpty!9427 () Bool)

(declare-fun mapDefault!9427 () ValueCell!2426)

(assert (=> b!214327 (= condMapEmpty!9427 (= (arr!4875 (_values!4009 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2426)) mapDefault!9427)))))

(declare-fun mapNonEmpty!9427 () Bool)

(declare-fun tp!20122 () Bool)

(assert (=> mapNonEmpty!9427 (= mapRes!9427 (and tp!20122 e!139387))))

(declare-fun mapKey!9427 () (_ BitVec 32))

(declare-fun mapRest!9427 () (Array (_ BitVec 32) ValueCell!2426))

(declare-fun mapValue!9427 () ValueCell!2426)

(assert (=> mapNonEmpty!9427 (= (arr!4875 (_values!4009 thiss!1504)) (store mapRest!9427 mapKey!9427 mapValue!9427))))

(declare-fun b!214328 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!214328 (= e!139385 (not (validMask!0 (mask!9687 thiss!1504))))))

(assert (= (and start!21320 res!104899) b!214323))

(assert (= (and b!214323 res!104898) b!214326))

(assert (= (and b!214326 res!104900) b!214328))

(assert (= (and b!214327 condMapEmpty!9427) mapIsEmpty!9427))

(assert (= (and b!214327 (not condMapEmpty!9427)) mapNonEmpty!9427))

(get-info :version)

(assert (= (and mapNonEmpty!9427 ((_ is ValueCellFull!2426) mapValue!9427)) b!214325))

(assert (= (and b!214327 ((_ is ValueCellFull!2426) mapDefault!9427)) b!214322))

(assert (= b!214324 b!214327))

(assert (= start!21320 b!214324))

(declare-fun m!241513 () Bool)

(assert (=> b!214326 m!241513))

(declare-fun m!241515 () Bool)

(assert (=> start!21320 m!241515))

(declare-fun m!241517 () Bool)

(assert (=> mapNonEmpty!9427 m!241517))

(declare-fun m!241519 () Bool)

(assert (=> b!214324 m!241519))

(declare-fun m!241521 () Bool)

(assert (=> b!214324 m!241521))

(declare-fun m!241523 () Bool)

(assert (=> b!214328 m!241523))

(check-sat (not b!214326) (not start!21320) (not mapNonEmpty!9427) tp_is_empty!5539 (not b_next!5677) (not b!214328) (not b!214324) b_and!12541)
(check-sat b_and!12541 (not b_next!5677))
(get-model)

(declare-fun d!58171 () Bool)

(assert (=> d!58171 (= (array_inv!3207 (_keys!6043 thiss!1504)) (bvsge (size!5204 (_keys!6043 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214324 d!58171))

(declare-fun d!58173 () Bool)

(assert (=> d!58173 (= (array_inv!3208 (_values!4009 thiss!1504)) (bvsge (size!5203 (_values!4009 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!214324 d!58173))

(declare-fun b!214383 () Bool)

(declare-fun e!139435 () SeekEntryResult!719)

(declare-fun e!139433 () SeekEntryResult!719)

(assert (=> b!214383 (= e!139435 e!139433)))

(declare-fun lt!110618 () (_ BitVec 64))

(declare-fun lt!110617 () SeekEntryResult!719)

(assert (=> b!214383 (= lt!110618 (select (arr!4876 (_keys!6043 thiss!1504)) (index!5048 lt!110617)))))

(declare-fun c!36030 () Bool)

(assert (=> b!214383 (= c!36030 (= lt!110618 key!932))))

(declare-fun d!58175 () Bool)

(declare-fun lt!110616 () SeekEntryResult!719)

(assert (=> d!58175 (and (or ((_ is Undefined!719) lt!110616) (not ((_ is Found!719) lt!110616)) (and (bvsge (index!5047 lt!110616) #b00000000000000000000000000000000) (bvslt (index!5047 lt!110616) (size!5204 (_keys!6043 thiss!1504))))) (or ((_ is Undefined!719) lt!110616) ((_ is Found!719) lt!110616) (not ((_ is MissingZero!719) lt!110616)) (and (bvsge (index!5046 lt!110616) #b00000000000000000000000000000000) (bvslt (index!5046 lt!110616) (size!5204 (_keys!6043 thiss!1504))))) (or ((_ is Undefined!719) lt!110616) ((_ is Found!719) lt!110616) ((_ is MissingZero!719) lt!110616) (not ((_ is MissingVacant!719) lt!110616)) (and (bvsge (index!5049 lt!110616) #b00000000000000000000000000000000) (bvslt (index!5049 lt!110616) (size!5204 (_keys!6043 thiss!1504))))) (or ((_ is Undefined!719) lt!110616) (ite ((_ is Found!719) lt!110616) (= (select (arr!4876 (_keys!6043 thiss!1504)) (index!5047 lt!110616)) key!932) (ite ((_ is MissingZero!719) lt!110616) (= (select (arr!4876 (_keys!6043 thiss!1504)) (index!5046 lt!110616)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!719) lt!110616) (= (select (arr!4876 (_keys!6043 thiss!1504)) (index!5049 lt!110616)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58175 (= lt!110616 e!139435)))

(declare-fun c!36028 () Bool)

(assert (=> d!58175 (= c!36028 (and ((_ is Intermediate!719) lt!110617) (undefined!1531 lt!110617)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10285 (_ BitVec 32)) SeekEntryResult!719)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58175 (= lt!110617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!9687 thiss!1504)) key!932 (_keys!6043 thiss!1504) (mask!9687 thiss!1504)))))

(assert (=> d!58175 (validMask!0 (mask!9687 thiss!1504))))

(assert (=> d!58175 (= (seekEntryOrOpen!0 key!932 (_keys!6043 thiss!1504) (mask!9687 thiss!1504)) lt!110616)))

(declare-fun b!214384 () Bool)

(declare-fun c!36029 () Bool)

(assert (=> b!214384 (= c!36029 (= lt!110618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!139434 () SeekEntryResult!719)

(assert (=> b!214384 (= e!139433 e!139434)))

(declare-fun b!214385 () Bool)

(assert (=> b!214385 (= e!139434 (MissingZero!719 (index!5048 lt!110617)))))

(declare-fun b!214386 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!10285 (_ BitVec 32)) SeekEntryResult!719)

(assert (=> b!214386 (= e!139434 (seekKeyOrZeroReturnVacant!0 (x!22361 lt!110617) (index!5048 lt!110617) (index!5048 lt!110617) key!932 (_keys!6043 thiss!1504) (mask!9687 thiss!1504)))))

(declare-fun b!214387 () Bool)

(assert (=> b!214387 (= e!139435 Undefined!719)))

(declare-fun b!214388 () Bool)

(assert (=> b!214388 (= e!139433 (Found!719 (index!5048 lt!110617)))))

(assert (= (and d!58175 c!36028) b!214387))

(assert (= (and d!58175 (not c!36028)) b!214383))

(assert (= (and b!214383 c!36030) b!214388))

(assert (= (and b!214383 (not c!36030)) b!214384))

(assert (= (and b!214384 c!36029) b!214385))

(assert (= (and b!214384 (not c!36029)) b!214386))

(declare-fun m!241549 () Bool)

(assert (=> b!214383 m!241549))

(declare-fun m!241551 () Bool)

(assert (=> d!58175 m!241551))

(assert (=> d!58175 m!241523))

(declare-fun m!241553 () Bool)

(assert (=> d!58175 m!241553))

(declare-fun m!241555 () Bool)

(assert (=> d!58175 m!241555))

(declare-fun m!241557 () Bool)

(assert (=> d!58175 m!241557))

(declare-fun m!241559 () Bool)

(assert (=> d!58175 m!241559))

(assert (=> d!58175 m!241553))

(declare-fun m!241561 () Bool)

(assert (=> b!214386 m!241561))

(assert (=> b!214326 d!58175))

(declare-fun d!58177 () Bool)

(declare-fun res!104925 () Bool)

(declare-fun e!139438 () Bool)

(assert (=> d!58177 (=> (not res!104925) (not e!139438))))

(declare-fun simpleValid!211 (LongMapFixedSize!2752) Bool)

(assert (=> d!58177 (= res!104925 (simpleValid!211 thiss!1504))))

(assert (=> d!58177 (= (valid!1145 thiss!1504) e!139438)))

(declare-fun b!214395 () Bool)

(declare-fun res!104926 () Bool)

(assert (=> b!214395 (=> (not res!104926) (not e!139438))))

(declare-fun arrayCountValidKeys!0 (array!10285 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!214395 (= res!104926 (= (arrayCountValidKeys!0 (_keys!6043 thiss!1504) #b00000000000000000000000000000000 (size!5204 (_keys!6043 thiss!1504))) (_size!1425 thiss!1504)))))

(declare-fun b!214396 () Bool)

(declare-fun res!104927 () Bool)

(assert (=> b!214396 (=> (not res!104927) (not e!139438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10285 (_ BitVec 32)) Bool)

(assert (=> b!214396 (= res!104927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6043 thiss!1504) (mask!9687 thiss!1504)))))

(declare-fun b!214397 () Bool)

(declare-datatypes ((List!3117 0))(
  ( (Nil!3114) (Cons!3113 (h!3755 (_ BitVec 64)) (t!8063 List!3117)) )
))
(declare-fun arrayNoDuplicates!0 (array!10285 (_ BitVec 32) List!3117) Bool)

(assert (=> b!214397 (= e!139438 (arrayNoDuplicates!0 (_keys!6043 thiss!1504) #b00000000000000000000000000000000 Nil!3114))))

(assert (= (and d!58177 res!104925) b!214395))

(assert (= (and b!214395 res!104926) b!214396))

(assert (= (and b!214396 res!104927) b!214397))

(declare-fun m!241563 () Bool)

(assert (=> d!58177 m!241563))

(declare-fun m!241565 () Bool)

(assert (=> b!214395 m!241565))

(declare-fun m!241567 () Bool)

(assert (=> b!214396 m!241567))

(declare-fun m!241569 () Bool)

(assert (=> b!214397 m!241569))

(assert (=> start!21320 d!58177))

(declare-fun d!58179 () Bool)

(assert (=> d!58179 (= (validMask!0 (mask!9687 thiss!1504)) (and (or (= (mask!9687 thiss!1504) #b00000000000000000000000000000111) (= (mask!9687 thiss!1504) #b00000000000000000000000000001111) (= (mask!9687 thiss!1504) #b00000000000000000000000000011111) (= (mask!9687 thiss!1504) #b00000000000000000000000000111111) (= (mask!9687 thiss!1504) #b00000000000000000000000001111111) (= (mask!9687 thiss!1504) #b00000000000000000000000011111111) (= (mask!9687 thiss!1504) #b00000000000000000000000111111111) (= (mask!9687 thiss!1504) #b00000000000000000000001111111111) (= (mask!9687 thiss!1504) #b00000000000000000000011111111111) (= (mask!9687 thiss!1504) #b00000000000000000000111111111111) (= (mask!9687 thiss!1504) #b00000000000000000001111111111111) (= (mask!9687 thiss!1504) #b00000000000000000011111111111111) (= (mask!9687 thiss!1504) #b00000000000000000111111111111111) (= (mask!9687 thiss!1504) #b00000000000000001111111111111111) (= (mask!9687 thiss!1504) #b00000000000000011111111111111111) (= (mask!9687 thiss!1504) #b00000000000000111111111111111111) (= (mask!9687 thiss!1504) #b00000000000001111111111111111111) (= (mask!9687 thiss!1504) #b00000000000011111111111111111111) (= (mask!9687 thiss!1504) #b00000000000111111111111111111111) (= (mask!9687 thiss!1504) #b00000000001111111111111111111111) (= (mask!9687 thiss!1504) #b00000000011111111111111111111111) (= (mask!9687 thiss!1504) #b00000000111111111111111111111111) (= (mask!9687 thiss!1504) #b00000001111111111111111111111111) (= (mask!9687 thiss!1504) #b00000011111111111111111111111111) (= (mask!9687 thiss!1504) #b00000111111111111111111111111111) (= (mask!9687 thiss!1504) #b00001111111111111111111111111111) (= (mask!9687 thiss!1504) #b00011111111111111111111111111111) (= (mask!9687 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!9687 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!214328 d!58179))

(declare-fun b!214404 () Bool)

(declare-fun e!139444 () Bool)

(assert (=> b!214404 (= e!139444 tp_is_empty!5539)))

(declare-fun b!214405 () Bool)

(declare-fun e!139443 () Bool)

(assert (=> b!214405 (= e!139443 tp_is_empty!5539)))

(declare-fun condMapEmpty!9436 () Bool)

(declare-fun mapDefault!9436 () ValueCell!2426)

(assert (=> mapNonEmpty!9427 (= condMapEmpty!9436 (= mapRest!9427 ((as const (Array (_ BitVec 32) ValueCell!2426)) mapDefault!9436)))))

(declare-fun mapRes!9436 () Bool)

(assert (=> mapNonEmpty!9427 (= tp!20122 (and e!139443 mapRes!9436))))

(declare-fun mapIsEmpty!9436 () Bool)

(assert (=> mapIsEmpty!9436 mapRes!9436))

(declare-fun mapNonEmpty!9436 () Bool)

(declare-fun tp!20137 () Bool)

(assert (=> mapNonEmpty!9436 (= mapRes!9436 (and tp!20137 e!139444))))

(declare-fun mapKey!9436 () (_ BitVec 32))

(declare-fun mapValue!9436 () ValueCell!2426)

(declare-fun mapRest!9436 () (Array (_ BitVec 32) ValueCell!2426))

(assert (=> mapNonEmpty!9436 (= mapRest!9427 (store mapRest!9436 mapKey!9436 mapValue!9436))))

(assert (= (and mapNonEmpty!9427 condMapEmpty!9436) mapIsEmpty!9436))

(assert (= (and mapNonEmpty!9427 (not condMapEmpty!9436)) mapNonEmpty!9436))

(assert (= (and mapNonEmpty!9436 ((_ is ValueCellFull!2426) mapValue!9436)) b!214404))

(assert (= (and mapNonEmpty!9427 ((_ is ValueCellFull!2426) mapDefault!9436)) b!214405))

(declare-fun m!241571 () Bool)

(assert (=> mapNonEmpty!9436 m!241571))

(check-sat (not b!214396) (not d!58177) (not b!214386) b_and!12541 tp_is_empty!5539 (not b_next!5677) (not b!214395) (not b!214397) (not d!58175) (not mapNonEmpty!9436))
(check-sat b_and!12541 (not b_next!5677))
