; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22642 () Bool)

(assert start!22642)

(declare-fun b!236523 () Bool)

(declare-fun b_free!6363 () Bool)

(declare-fun b_next!6363 () Bool)

(assert (=> b!236523 (= b_free!6363 (not b_next!6363))))

(declare-fun tp!22268 () Bool)

(declare-fun b_and!13303 () Bool)

(assert (=> b!236523 (= tp!22268 b_and!13303)))

(declare-fun res!115976 () Bool)

(declare-fun e!153607 () Bool)

(assert (=> start!22642 (=> (not res!115976) (not e!153607))))

(declare-datatypes ((V!7947 0))(
  ( (V!7948 (val!3157 Int)) )
))
(declare-datatypes ((ValueCell!2769 0))(
  ( (ValueCellFull!2769 (v!5188 V!7947)) (EmptyCell!2769) )
))
(declare-datatypes ((array!11715 0))(
  ( (array!11716 (arr!5566 (Array (_ BitVec 32) ValueCell!2769)) (size!5904 (_ BitVec 32))) )
))
(declare-datatypes ((array!11717 0))(
  ( (array!11718 (arr!5567 (Array (_ BitVec 32) (_ BitVec 64))) (size!5905 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3438 0))(
  ( (LongMapFixedSize!3439 (defaultEntry!4394 Int) (mask!10387 (_ BitVec 32)) (extraKeys!4131 (_ BitVec 32)) (zeroValue!4235 V!7947) (minValue!4235 V!7947) (_size!1768 (_ BitVec 32)) (_keys!6477 array!11717) (_values!4377 array!11715) (_vacant!1768 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3438)

(declare-fun valid!1356 (LongMapFixedSize!3438) Bool)

(assert (=> start!22642 (= res!115976 (valid!1356 thiss!1504))))

(assert (=> start!22642 e!153607))

(declare-fun e!153609 () Bool)

(assert (=> start!22642 e!153609))

(assert (=> start!22642 true))

(declare-fun b!236517 () Bool)

(declare-fun res!115973 () Bool)

(assert (=> b!236517 (=> (not res!115973) (not e!153607))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!236517 (= res!115973 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!236518 () Bool)

(declare-fun e!153608 () Bool)

(declare-fun tp_is_empty!6225 () Bool)

(assert (=> b!236518 (= e!153608 tp_is_empty!6225)))

(declare-fun b!236519 () Bool)

(declare-fun e!153610 () Bool)

(assert (=> b!236519 (= e!153610 tp_is_empty!6225)))

(declare-fun mapNonEmpty!10545 () Bool)

(declare-fun mapRes!10545 () Bool)

(declare-fun tp!22269 () Bool)

(assert (=> mapNonEmpty!10545 (= mapRes!10545 (and tp!22269 e!153608))))

(declare-fun mapValue!10545 () ValueCell!2769)

(declare-fun mapRest!10545 () (Array (_ BitVec 32) ValueCell!2769))

(declare-fun mapKey!10545 () (_ BitVec 32))

(assert (=> mapNonEmpty!10545 (= (arr!5566 (_values!4377 thiss!1504)) (store mapRest!10545 mapKey!10545 mapValue!10545))))

(declare-fun mapIsEmpty!10545 () Bool)

(assert (=> mapIsEmpty!10545 mapRes!10545))

(declare-fun b!236520 () Bool)

(declare-fun e!153611 () Bool)

(assert (=> b!236520 (= e!153607 e!153611)))

(declare-fun res!115975 () Bool)

(assert (=> b!236520 (=> (not res!115975) (not e!153611))))

(declare-datatypes ((SeekEntryResult!1002 0))(
  ( (MissingZero!1002 (index!6178 (_ BitVec 32))) (Found!1002 (index!6179 (_ BitVec 32))) (Intermediate!1002 (undefined!1814 Bool) (index!6180 (_ BitVec 32)) (x!23884 (_ BitVec 32))) (Undefined!1002) (MissingVacant!1002 (index!6181 (_ BitVec 32))) )
))
(declare-fun lt!119580 () SeekEntryResult!1002)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236520 (= res!115975 (or (= lt!119580 (MissingZero!1002 index!297)) (= lt!119580 (MissingVacant!1002 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11717 (_ BitVec 32)) SeekEntryResult!1002)

(assert (=> b!236520 (= lt!119580 (seekEntryOrOpen!0 key!932 (_keys!6477 thiss!1504) (mask!10387 thiss!1504)))))

(declare-fun b!236521 () Bool)

(assert (=> b!236521 (= e!153611 (and (= (size!5904 (_values!4377 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10387 thiss!1504))) (not (= (size!5905 (_keys!6477 thiss!1504)) (size!5904 (_values!4377 thiss!1504))))))))

(declare-fun b!236522 () Bool)

(declare-fun res!115974 () Bool)

(assert (=> b!236522 (=> (not res!115974) (not e!153611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236522 (= res!115974 (validMask!0 (mask!10387 thiss!1504)))))

(declare-fun e!153606 () Bool)

(declare-fun array_inv!3671 (array!11717) Bool)

(declare-fun array_inv!3672 (array!11715) Bool)

(assert (=> b!236523 (= e!153609 (and tp!22268 tp_is_empty!6225 (array_inv!3671 (_keys!6477 thiss!1504)) (array_inv!3672 (_values!4377 thiss!1504)) e!153606))))

(declare-fun b!236524 () Bool)

(declare-fun res!115972 () Bool)

(assert (=> b!236524 (=> (not res!115972) (not e!153611))))

(declare-datatypes ((tuple2!4654 0))(
  ( (tuple2!4655 (_1!2338 (_ BitVec 64)) (_2!2338 V!7947)) )
))
(declare-datatypes ((List!3557 0))(
  ( (Nil!3554) (Cons!3553 (h!4206 tuple2!4654) (t!8538 List!3557)) )
))
(declare-datatypes ((ListLongMap!3567 0))(
  ( (ListLongMap!3568 (toList!1799 List!3557)) )
))
(declare-fun contains!1679 (ListLongMap!3567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1327 (array!11717 array!11715 (_ BitVec 32) (_ BitVec 32) V!7947 V!7947 (_ BitVec 32) Int) ListLongMap!3567)

(assert (=> b!236524 (= res!115972 (not (contains!1679 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)) key!932)))))

(declare-fun b!236525 () Bool)

(assert (=> b!236525 (= e!153606 (and e!153610 mapRes!10545))))

(declare-fun condMapEmpty!10545 () Bool)

(declare-fun mapDefault!10545 () ValueCell!2769)

(assert (=> b!236525 (= condMapEmpty!10545 (= (arr!5566 (_values!4377 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2769)) mapDefault!10545)))))

(assert (= (and start!22642 res!115976) b!236517))

(assert (= (and b!236517 res!115973) b!236520))

(assert (= (and b!236520 res!115975) b!236524))

(assert (= (and b!236524 res!115972) b!236522))

(assert (= (and b!236522 res!115974) b!236521))

(assert (= (and b!236525 condMapEmpty!10545) mapIsEmpty!10545))

(assert (= (and b!236525 (not condMapEmpty!10545)) mapNonEmpty!10545))

(get-info :version)

(assert (= (and mapNonEmpty!10545 ((_ is ValueCellFull!2769) mapValue!10545)) b!236518))

(assert (= (and b!236525 ((_ is ValueCellFull!2769) mapDefault!10545)) b!236519))

(assert (= b!236523 b!236525))

(assert (= start!22642 b!236523))

(declare-fun m!257387 () Bool)

(assert (=> mapNonEmpty!10545 m!257387))

(declare-fun m!257389 () Bool)

(assert (=> b!236523 m!257389))

(declare-fun m!257391 () Bool)

(assert (=> b!236523 m!257391))

(declare-fun m!257393 () Bool)

(assert (=> b!236520 m!257393))

(declare-fun m!257395 () Bool)

(assert (=> start!22642 m!257395))

(declare-fun m!257397 () Bool)

(assert (=> b!236522 m!257397))

(declare-fun m!257399 () Bool)

(assert (=> b!236524 m!257399))

(assert (=> b!236524 m!257399))

(declare-fun m!257401 () Bool)

(assert (=> b!236524 m!257401))

(check-sat (not b!236523) (not b!236524) (not b_next!6363) (not b!236520) b_and!13303 (not mapNonEmpty!10545) tp_is_empty!6225 (not b!236522) (not start!22642))
(check-sat b_and!13303 (not b_next!6363))
(get-model)

(declare-fun lt!119590 () SeekEntryResult!1002)

(declare-fun b!236565 () Bool)

(declare-fun e!153642 () SeekEntryResult!1002)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11717 (_ BitVec 32)) SeekEntryResult!1002)

(assert (=> b!236565 (= e!153642 (seekKeyOrZeroReturnVacant!0 (x!23884 lt!119590) (index!6180 lt!119590) (index!6180 lt!119590) key!932 (_keys!6477 thiss!1504) (mask!10387 thiss!1504)))))

(declare-fun b!236566 () Bool)

(declare-fun e!153641 () SeekEntryResult!1002)

(declare-fun e!153640 () SeekEntryResult!1002)

(assert (=> b!236566 (= e!153641 e!153640)))

(declare-fun lt!119592 () (_ BitVec 64))

(assert (=> b!236566 (= lt!119592 (select (arr!5567 (_keys!6477 thiss!1504)) (index!6180 lt!119590)))))

(declare-fun c!39402 () Bool)

(assert (=> b!236566 (= c!39402 (= lt!119592 key!932))))

(declare-fun d!59425 () Bool)

(declare-fun lt!119591 () SeekEntryResult!1002)

(assert (=> d!59425 (and (or ((_ is Undefined!1002) lt!119591) (not ((_ is Found!1002) lt!119591)) (and (bvsge (index!6179 lt!119591) #b00000000000000000000000000000000) (bvslt (index!6179 lt!119591) (size!5905 (_keys!6477 thiss!1504))))) (or ((_ is Undefined!1002) lt!119591) ((_ is Found!1002) lt!119591) (not ((_ is MissingZero!1002) lt!119591)) (and (bvsge (index!6178 lt!119591) #b00000000000000000000000000000000) (bvslt (index!6178 lt!119591) (size!5905 (_keys!6477 thiss!1504))))) (or ((_ is Undefined!1002) lt!119591) ((_ is Found!1002) lt!119591) ((_ is MissingZero!1002) lt!119591) (not ((_ is MissingVacant!1002) lt!119591)) (and (bvsge (index!6181 lt!119591) #b00000000000000000000000000000000) (bvslt (index!6181 lt!119591) (size!5905 (_keys!6477 thiss!1504))))) (or ((_ is Undefined!1002) lt!119591) (ite ((_ is Found!1002) lt!119591) (= (select (arr!5567 (_keys!6477 thiss!1504)) (index!6179 lt!119591)) key!932) (ite ((_ is MissingZero!1002) lt!119591) (= (select (arr!5567 (_keys!6477 thiss!1504)) (index!6178 lt!119591)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1002) lt!119591) (= (select (arr!5567 (_keys!6477 thiss!1504)) (index!6181 lt!119591)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59425 (= lt!119591 e!153641)))

(declare-fun c!39403 () Bool)

(assert (=> d!59425 (= c!39403 (and ((_ is Intermediate!1002) lt!119590) (undefined!1814 lt!119590)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11717 (_ BitVec 32)) SeekEntryResult!1002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59425 (= lt!119590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10387 thiss!1504)) key!932 (_keys!6477 thiss!1504) (mask!10387 thiss!1504)))))

(assert (=> d!59425 (validMask!0 (mask!10387 thiss!1504))))

(assert (=> d!59425 (= (seekEntryOrOpen!0 key!932 (_keys!6477 thiss!1504) (mask!10387 thiss!1504)) lt!119591)))

(declare-fun b!236567 () Bool)

(assert (=> b!236567 (= e!153640 (Found!1002 (index!6180 lt!119590)))))

(declare-fun b!236568 () Bool)

(assert (=> b!236568 (= e!153642 (MissingZero!1002 (index!6180 lt!119590)))))

(declare-fun b!236569 () Bool)

(declare-fun c!39404 () Bool)

(assert (=> b!236569 (= c!39404 (= lt!119592 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236569 (= e!153640 e!153642)))

(declare-fun b!236570 () Bool)

(assert (=> b!236570 (= e!153641 Undefined!1002)))

(assert (= (and d!59425 c!39403) b!236570))

(assert (= (and d!59425 (not c!39403)) b!236566))

(assert (= (and b!236566 c!39402) b!236567))

(assert (= (and b!236566 (not c!39402)) b!236569))

(assert (= (and b!236569 c!39404) b!236568))

(assert (= (and b!236569 (not c!39404)) b!236565))

(declare-fun m!257419 () Bool)

(assert (=> b!236565 m!257419))

(declare-fun m!257421 () Bool)

(assert (=> b!236566 m!257421))

(declare-fun m!257423 () Bool)

(assert (=> d!59425 m!257423))

(declare-fun m!257425 () Bool)

(assert (=> d!59425 m!257425))

(declare-fun m!257427 () Bool)

(assert (=> d!59425 m!257427))

(declare-fun m!257429 () Bool)

(assert (=> d!59425 m!257429))

(declare-fun m!257431 () Bool)

(assert (=> d!59425 m!257431))

(assert (=> d!59425 m!257397))

(assert (=> d!59425 m!257429))

(assert (=> b!236520 d!59425))

(declare-fun d!59427 () Bool)

(assert (=> d!59427 (= (array_inv!3671 (_keys!6477 thiss!1504)) (bvsge (size!5905 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236523 d!59427))

(declare-fun d!59429 () Bool)

(assert (=> d!59429 (= (array_inv!3672 (_values!4377 thiss!1504)) (bvsge (size!5904 (_values!4377 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236523 d!59429))

(declare-fun d!59431 () Bool)

(declare-fun res!115998 () Bool)

(declare-fun e!153645 () Bool)

(assert (=> d!59431 (=> (not res!115998) (not e!153645))))

(declare-fun simpleValid!237 (LongMapFixedSize!3438) Bool)

(assert (=> d!59431 (= res!115998 (simpleValid!237 thiss!1504))))

(assert (=> d!59431 (= (valid!1356 thiss!1504) e!153645)))

(declare-fun b!236577 () Bool)

(declare-fun res!115999 () Bool)

(assert (=> b!236577 (=> (not res!115999) (not e!153645))))

(declare-fun arrayCountValidKeys!0 (array!11717 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236577 (= res!115999 (= (arrayCountValidKeys!0 (_keys!6477 thiss!1504) #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))) (_size!1768 thiss!1504)))))

(declare-fun b!236578 () Bool)

(declare-fun res!116000 () Bool)

(assert (=> b!236578 (=> (not res!116000) (not e!153645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11717 (_ BitVec 32)) Bool)

(assert (=> b!236578 (= res!116000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6477 thiss!1504) (mask!10387 thiss!1504)))))

(declare-fun b!236579 () Bool)

(declare-datatypes ((List!3558 0))(
  ( (Nil!3555) (Cons!3554 (h!4207 (_ BitVec 64)) (t!8541 List!3558)) )
))
(declare-fun arrayNoDuplicates!0 (array!11717 (_ BitVec 32) List!3558) Bool)

(assert (=> b!236579 (= e!153645 (arrayNoDuplicates!0 (_keys!6477 thiss!1504) #b00000000000000000000000000000000 Nil!3555))))

(assert (= (and d!59431 res!115998) b!236577))

(assert (= (and b!236577 res!115999) b!236578))

(assert (= (and b!236578 res!116000) b!236579))

(declare-fun m!257433 () Bool)

(assert (=> d!59431 m!257433))

(declare-fun m!257435 () Bool)

(assert (=> b!236577 m!257435))

(declare-fun m!257437 () Bool)

(assert (=> b!236578 m!257437))

(declare-fun m!257439 () Bool)

(assert (=> b!236579 m!257439))

(assert (=> start!22642 d!59431))

(declare-fun d!59433 () Bool)

(declare-fun e!153650 () Bool)

(assert (=> d!59433 e!153650))

(declare-fun res!116003 () Bool)

(assert (=> d!59433 (=> res!116003 e!153650)))

(declare-fun lt!119603 () Bool)

(assert (=> d!59433 (= res!116003 (not lt!119603))))

(declare-fun lt!119602 () Bool)

(assert (=> d!59433 (= lt!119603 lt!119602)))

(declare-datatypes ((Unit!7280 0))(
  ( (Unit!7281) )
))
(declare-fun lt!119604 () Unit!7280)

(declare-fun e!153651 () Unit!7280)

(assert (=> d!59433 (= lt!119604 e!153651)))

(declare-fun c!39407 () Bool)

(assert (=> d!59433 (= c!39407 lt!119602)))

(declare-fun containsKey!264 (List!3557 (_ BitVec 64)) Bool)

(assert (=> d!59433 (= lt!119602 (containsKey!264 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932))))

(assert (=> d!59433 (= (contains!1679 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)) key!932) lt!119603)))

(declare-fun b!236586 () Bool)

(declare-fun lt!119601 () Unit!7280)

(assert (=> b!236586 (= e!153651 lt!119601)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!212 (List!3557 (_ BitVec 64)) Unit!7280)

(assert (=> b!236586 (= lt!119601 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932))))

(declare-datatypes ((Option!278 0))(
  ( (Some!277 (v!5190 V!7947)) (None!276) )
))
(declare-fun isDefined!213 (Option!278) Bool)

(declare-fun getValueByKey!272 (List!3557 (_ BitVec 64)) Option!278)

(assert (=> b!236586 (isDefined!213 (getValueByKey!272 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932))))

(declare-fun b!236587 () Bool)

(declare-fun Unit!7282 () Unit!7280)

(assert (=> b!236587 (= e!153651 Unit!7282)))

(declare-fun b!236588 () Bool)

(assert (=> b!236588 (= e!153650 (isDefined!213 (getValueByKey!272 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932)))))

(assert (= (and d!59433 c!39407) b!236586))

(assert (= (and d!59433 (not c!39407)) b!236587))

(assert (= (and d!59433 (not res!116003)) b!236588))

(declare-fun m!257441 () Bool)

(assert (=> d!59433 m!257441))

(declare-fun m!257443 () Bool)

(assert (=> b!236586 m!257443))

(declare-fun m!257445 () Bool)

(assert (=> b!236586 m!257445))

(assert (=> b!236586 m!257445))

(declare-fun m!257447 () Bool)

(assert (=> b!236586 m!257447))

(assert (=> b!236588 m!257445))

(assert (=> b!236588 m!257445))

(assert (=> b!236588 m!257447))

(assert (=> b!236524 d!59433))

(declare-fun b!236631 () Bool)

(declare-fun e!153684 () Bool)

(declare-fun lt!119662 () ListLongMap!3567)

(declare-fun apply!214 (ListLongMap!3567 (_ BitVec 64)) V!7947)

(declare-fun get!2862 (ValueCell!2769 V!7947) V!7947)

(declare-fun dynLambda!557 (Int (_ BitVec 64)) V!7947)

(assert (=> b!236631 (= e!153684 (= (apply!214 lt!119662 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)) (get!2862 (select (arr!5566 (_values!4377 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4394 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5904 (_values!4377 thiss!1504))))))

(assert (=> b!236631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(declare-fun d!59435 () Bool)

(declare-fun e!153686 () Bool)

(assert (=> d!59435 e!153686))

(declare-fun res!116023 () Bool)

(assert (=> d!59435 (=> (not res!116023) (not e!153686))))

(assert (=> d!59435 (= res!116023 (or (bvsge #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))))

(declare-fun lt!119661 () ListLongMap!3567)

(assert (=> d!59435 (= lt!119662 lt!119661)))

(declare-fun lt!119653 () Unit!7280)

(declare-fun e!153679 () Unit!7280)

(assert (=> d!59435 (= lt!119653 e!153679)))

(declare-fun c!39421 () Bool)

(declare-fun e!153682 () Bool)

(assert (=> d!59435 (= c!39421 e!153682)))

(declare-fun res!116028 () Bool)

(assert (=> d!59435 (=> (not res!116028) (not e!153682))))

(assert (=> d!59435 (= res!116028 (bvslt #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(declare-fun e!153688 () ListLongMap!3567)

(assert (=> d!59435 (= lt!119661 e!153688)))

(declare-fun c!39424 () Bool)

(assert (=> d!59435 (= c!39424 (and (not (= (bvand (extraKeys!4131 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4131 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59435 (validMask!0 (mask!10387 thiss!1504))))

(assert (=> d!59435 (= (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)) lt!119662)))

(declare-fun b!236632 () Bool)

(declare-fun e!153683 () ListLongMap!3567)

(declare-fun call!22005 () ListLongMap!3567)

(assert (=> b!236632 (= e!153683 call!22005)))

(declare-fun bm!21996 () Bool)

(declare-fun call!22004 () Bool)

(assert (=> bm!21996 (= call!22004 (contains!1679 lt!119662 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21997 () Bool)

(declare-fun call!22001 () ListLongMap!3567)

(declare-fun call!21999 () ListLongMap!3567)

(assert (=> bm!21997 (= call!22001 call!21999)))

(declare-fun b!236633 () Bool)

(declare-fun Unit!7283 () Unit!7280)

(assert (=> b!236633 (= e!153679 Unit!7283)))

(declare-fun b!236634 () Bool)

(declare-fun e!153685 () ListLongMap!3567)

(assert (=> b!236634 (= e!153685 call!22005)))

(declare-fun call!22000 () ListLongMap!3567)

(declare-fun call!22003 () ListLongMap!3567)

(declare-fun c!39422 () Bool)

(declare-fun bm!21998 () Bool)

(declare-fun +!641 (ListLongMap!3567 tuple2!4654) ListLongMap!3567)

(assert (=> bm!21998 (= call!22000 (+!641 (ite c!39424 call!21999 (ite c!39422 call!22001 call!22003)) (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))))))

(declare-fun b!236635 () Bool)

(declare-fun e!153680 () Bool)

(declare-fun e!153678 () Bool)

(assert (=> b!236635 (= e!153680 e!153678)))

(declare-fun res!116026 () Bool)

(declare-fun call!22002 () Bool)

(assert (=> b!236635 (= res!116026 call!22002)))

(assert (=> b!236635 (=> (not res!116026) (not e!153678))))

(declare-fun b!236636 () Bool)

(declare-fun e!153689 () Bool)

(assert (=> b!236636 (= e!153689 (= (apply!214 lt!119662 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4235 thiss!1504)))))

(declare-fun b!236637 () Bool)

(assert (=> b!236637 (= e!153686 e!153680)))

(declare-fun c!39420 () Bool)

(assert (=> b!236637 (= c!39420 (not (= (bvand (extraKeys!4131 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21999 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!536 (array!11717 array!11715 (_ BitVec 32) (_ BitVec 32) V!7947 V!7947 (_ BitVec 32) Int) ListLongMap!3567)

(assert (=> bm!21999 (= call!21999 (getCurrentListMapNoExtraKeys!536 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))))

(declare-fun b!236638 () Bool)

(declare-fun e!153687 () Bool)

(assert (=> b!236638 (= e!153687 e!153689)))

(declare-fun res!116029 () Bool)

(assert (=> b!236638 (= res!116029 call!22004)))

(assert (=> b!236638 (=> (not res!116029) (not e!153689))))

(declare-fun bm!22000 () Bool)

(assert (=> bm!22000 (= call!22002 (contains!1679 lt!119662 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236639 () Bool)

(assert (=> b!236639 (= e!153688 (+!641 call!22000 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))))))

(declare-fun b!236640 () Bool)

(declare-fun res!116027 () Bool)

(assert (=> b!236640 (=> (not res!116027) (not e!153686))))

(assert (=> b!236640 (= res!116027 e!153687)))

(declare-fun c!39423 () Bool)

(assert (=> b!236640 (= c!39423 (not (= (bvand (extraKeys!4131 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22001 () Bool)

(assert (=> bm!22001 (= call!22005 call!22000)))

(declare-fun b!236641 () Bool)

(declare-fun c!39425 () Bool)

(assert (=> b!236641 (= c!39425 (and (not (= (bvand (extraKeys!4131 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4131 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!236641 (= e!153685 e!153683)))

(declare-fun b!236642 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!236642 (= e!153682 (validKeyInArray!0 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236643 () Bool)

(assert (=> b!236643 (= e!153688 e!153685)))

(assert (=> b!236643 (= c!39422 (and (not (= (bvand (extraKeys!4131 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4131 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!236644 () Bool)

(declare-fun lt!119655 () Unit!7280)

(assert (=> b!236644 (= e!153679 lt!119655)))

(declare-fun lt!119656 () ListLongMap!3567)

(assert (=> b!236644 (= lt!119656 (getCurrentListMapNoExtraKeys!536 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))))

(declare-fun lt!119654 () (_ BitVec 64))

(assert (=> b!236644 (= lt!119654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119651 () (_ BitVec 64))

(assert (=> b!236644 (= lt!119651 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119668 () Unit!7280)

(declare-fun addStillContains!190 (ListLongMap!3567 (_ BitVec 64) V!7947 (_ BitVec 64)) Unit!7280)

(assert (=> b!236644 (= lt!119668 (addStillContains!190 lt!119656 lt!119654 (zeroValue!4235 thiss!1504) lt!119651))))

(assert (=> b!236644 (contains!1679 (+!641 lt!119656 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504))) lt!119651)))

(declare-fun lt!119659 () Unit!7280)

(assert (=> b!236644 (= lt!119659 lt!119668)))

(declare-fun lt!119666 () ListLongMap!3567)

(assert (=> b!236644 (= lt!119666 (getCurrentListMapNoExtraKeys!536 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))))

(declare-fun lt!119660 () (_ BitVec 64))

(assert (=> b!236644 (= lt!119660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119657 () (_ BitVec 64))

(assert (=> b!236644 (= lt!119657 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119665 () Unit!7280)

(declare-fun addApplyDifferent!190 (ListLongMap!3567 (_ BitVec 64) V!7947 (_ BitVec 64)) Unit!7280)

(assert (=> b!236644 (= lt!119665 (addApplyDifferent!190 lt!119666 lt!119660 (minValue!4235 thiss!1504) lt!119657))))

(assert (=> b!236644 (= (apply!214 (+!641 lt!119666 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504))) lt!119657) (apply!214 lt!119666 lt!119657))))

(declare-fun lt!119658 () Unit!7280)

(assert (=> b!236644 (= lt!119658 lt!119665)))

(declare-fun lt!119669 () ListLongMap!3567)

(assert (=> b!236644 (= lt!119669 (getCurrentListMapNoExtraKeys!536 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))))

(declare-fun lt!119652 () (_ BitVec 64))

(assert (=> b!236644 (= lt!119652 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119649 () (_ BitVec 64))

(assert (=> b!236644 (= lt!119649 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119663 () Unit!7280)

(assert (=> b!236644 (= lt!119663 (addApplyDifferent!190 lt!119669 lt!119652 (zeroValue!4235 thiss!1504) lt!119649))))

(assert (=> b!236644 (= (apply!214 (+!641 lt!119669 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504))) lt!119649) (apply!214 lt!119669 lt!119649))))

(declare-fun lt!119664 () Unit!7280)

(assert (=> b!236644 (= lt!119664 lt!119663)))

(declare-fun lt!119650 () ListLongMap!3567)

(assert (=> b!236644 (= lt!119650 (getCurrentListMapNoExtraKeys!536 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))))

(declare-fun lt!119667 () (_ BitVec 64))

(assert (=> b!236644 (= lt!119667 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119670 () (_ BitVec 64))

(assert (=> b!236644 (= lt!119670 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236644 (= lt!119655 (addApplyDifferent!190 lt!119650 lt!119667 (minValue!4235 thiss!1504) lt!119670))))

(assert (=> b!236644 (= (apply!214 (+!641 lt!119650 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504))) lt!119670) (apply!214 lt!119650 lt!119670))))

(declare-fun b!236645 () Bool)

(assert (=> b!236645 (= e!153687 (not call!22004))))

(declare-fun b!236646 () Bool)

(assert (=> b!236646 (= e!153678 (= (apply!214 lt!119662 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4235 thiss!1504)))))

(declare-fun bm!22002 () Bool)

(assert (=> bm!22002 (= call!22003 call!22001)))

(declare-fun b!236647 () Bool)

(assert (=> b!236647 (= e!153680 (not call!22002))))

(declare-fun b!236648 () Bool)

(assert (=> b!236648 (= e!153683 call!22003)))

(declare-fun b!236649 () Bool)

(declare-fun res!116030 () Bool)

(assert (=> b!236649 (=> (not res!116030) (not e!153686))))

(declare-fun e!153690 () Bool)

(assert (=> b!236649 (= res!116030 e!153690)))

(declare-fun res!116022 () Bool)

(assert (=> b!236649 (=> res!116022 e!153690)))

(declare-fun e!153681 () Bool)

(assert (=> b!236649 (= res!116022 (not e!153681))))

(declare-fun res!116024 () Bool)

(assert (=> b!236649 (=> (not res!116024) (not e!153681))))

(assert (=> b!236649 (= res!116024 (bvslt #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(declare-fun b!236650 () Bool)

(assert (=> b!236650 (= e!153681 (validKeyInArray!0 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236651 () Bool)

(assert (=> b!236651 (= e!153690 e!153684)))

(declare-fun res!116025 () Bool)

(assert (=> b!236651 (=> (not res!116025) (not e!153684))))

(assert (=> b!236651 (= res!116025 (contains!1679 lt!119662 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(assert (= (and d!59435 c!39424) b!236639))

(assert (= (and d!59435 (not c!39424)) b!236643))

(assert (= (and b!236643 c!39422) b!236634))

(assert (= (and b!236643 (not c!39422)) b!236641))

(assert (= (and b!236641 c!39425) b!236632))

(assert (= (and b!236641 (not c!39425)) b!236648))

(assert (= (or b!236632 b!236648) bm!22002))

(assert (= (or b!236634 bm!22002) bm!21997))

(assert (= (or b!236634 b!236632) bm!22001))

(assert (= (or b!236639 bm!21997) bm!21999))

(assert (= (or b!236639 bm!22001) bm!21998))

(assert (= (and d!59435 res!116028) b!236642))

(assert (= (and d!59435 c!39421) b!236644))

(assert (= (and d!59435 (not c!39421)) b!236633))

(assert (= (and d!59435 res!116023) b!236649))

(assert (= (and b!236649 res!116024) b!236650))

(assert (= (and b!236649 (not res!116022)) b!236651))

(assert (= (and b!236651 res!116025) b!236631))

(assert (= (and b!236649 res!116030) b!236640))

(assert (= (and b!236640 c!39423) b!236638))

(assert (= (and b!236640 (not c!39423)) b!236645))

(assert (= (and b!236638 res!116029) b!236636))

(assert (= (or b!236638 b!236645) bm!21996))

(assert (= (and b!236640 res!116027) b!236637))

(assert (= (and b!236637 c!39420) b!236635))

(assert (= (and b!236637 (not c!39420)) b!236647))

(assert (= (and b!236635 res!116026) b!236646))

(assert (= (or b!236635 b!236647) bm!22000))

(declare-fun b_lambda!7927 () Bool)

(assert (=> (not b_lambda!7927) (not b!236631)))

(declare-fun t!8540 () Bool)

(declare-fun tb!2941 () Bool)

(assert (=> (and b!236523 (= (defaultEntry!4394 thiss!1504) (defaultEntry!4394 thiss!1504)) t!8540) tb!2941))

(declare-fun result!5145 () Bool)

(assert (=> tb!2941 (= result!5145 tp_is_empty!6225)))

(assert (=> b!236631 t!8540))

(declare-fun b_and!13307 () Bool)

(assert (= b_and!13303 (and (=> t!8540 result!5145) b_and!13307)))

(declare-fun m!257449 () Bool)

(assert (=> b!236644 m!257449))

(declare-fun m!257451 () Bool)

(assert (=> b!236644 m!257451))

(assert (=> b!236644 m!257449))

(declare-fun m!257453 () Bool)

(assert (=> b!236644 m!257453))

(declare-fun m!257455 () Bool)

(assert (=> b!236644 m!257455))

(declare-fun m!257457 () Bool)

(assert (=> b!236644 m!257457))

(declare-fun m!257459 () Bool)

(assert (=> b!236644 m!257459))

(declare-fun m!257461 () Bool)

(assert (=> b!236644 m!257461))

(declare-fun m!257463 () Bool)

(assert (=> b!236644 m!257463))

(declare-fun m!257465 () Bool)

(assert (=> b!236644 m!257465))

(assert (=> b!236644 m!257463))

(declare-fun m!257467 () Bool)

(assert (=> b!236644 m!257467))

(declare-fun m!257469 () Bool)

(assert (=> b!236644 m!257469))

(declare-fun m!257471 () Bool)

(assert (=> b!236644 m!257471))

(assert (=> b!236644 m!257457))

(declare-fun m!257473 () Bool)

(assert (=> b!236644 m!257473))

(assert (=> b!236644 m!257453))

(declare-fun m!257475 () Bool)

(assert (=> b!236644 m!257475))

(declare-fun m!257477 () Bool)

(assert (=> b!236644 m!257477))

(declare-fun m!257479 () Bool)

(assert (=> b!236644 m!257479))

(declare-fun m!257481 () Bool)

(assert (=> b!236644 m!257481))

(assert (=> d!59435 m!257397))

(assert (=> b!236642 m!257469))

(assert (=> b!236642 m!257469))

(declare-fun m!257483 () Bool)

(assert (=> b!236642 m!257483))

(declare-fun m!257485 () Bool)

(assert (=> b!236639 m!257485))

(declare-fun m!257487 () Bool)

(assert (=> bm!21998 m!257487))

(assert (=> bm!21999 m!257479))

(declare-fun m!257489 () Bool)

(assert (=> bm!21996 m!257489))

(declare-fun m!257491 () Bool)

(assert (=> b!236631 m!257491))

(declare-fun m!257493 () Bool)

(assert (=> b!236631 m!257493))

(declare-fun m!257495 () Bool)

(assert (=> b!236631 m!257495))

(assert (=> b!236631 m!257469))

(assert (=> b!236631 m!257493))

(assert (=> b!236631 m!257491))

(assert (=> b!236631 m!257469))

(declare-fun m!257497 () Bool)

(assert (=> b!236631 m!257497))

(declare-fun m!257499 () Bool)

(assert (=> b!236636 m!257499))

(assert (=> b!236651 m!257469))

(assert (=> b!236651 m!257469))

(declare-fun m!257501 () Bool)

(assert (=> b!236651 m!257501))

(declare-fun m!257503 () Bool)

(assert (=> bm!22000 m!257503))

(assert (=> b!236650 m!257469))

(assert (=> b!236650 m!257469))

(assert (=> b!236650 m!257483))

(declare-fun m!257505 () Bool)

(assert (=> b!236646 m!257505))

(assert (=> b!236524 d!59435))

(declare-fun d!59437 () Bool)

(assert (=> d!59437 (= (validMask!0 (mask!10387 thiss!1504)) (and (or (= (mask!10387 thiss!1504) #b00000000000000000000000000000111) (= (mask!10387 thiss!1504) #b00000000000000000000000000001111) (= (mask!10387 thiss!1504) #b00000000000000000000000000011111) (= (mask!10387 thiss!1504) #b00000000000000000000000000111111) (= (mask!10387 thiss!1504) #b00000000000000000000000001111111) (= (mask!10387 thiss!1504) #b00000000000000000000000011111111) (= (mask!10387 thiss!1504) #b00000000000000000000000111111111) (= (mask!10387 thiss!1504) #b00000000000000000000001111111111) (= (mask!10387 thiss!1504) #b00000000000000000000011111111111) (= (mask!10387 thiss!1504) #b00000000000000000000111111111111) (= (mask!10387 thiss!1504) #b00000000000000000001111111111111) (= (mask!10387 thiss!1504) #b00000000000000000011111111111111) (= (mask!10387 thiss!1504) #b00000000000000000111111111111111) (= (mask!10387 thiss!1504) #b00000000000000001111111111111111) (= (mask!10387 thiss!1504) #b00000000000000011111111111111111) (= (mask!10387 thiss!1504) #b00000000000000111111111111111111) (= (mask!10387 thiss!1504) #b00000000000001111111111111111111) (= (mask!10387 thiss!1504) #b00000000000011111111111111111111) (= (mask!10387 thiss!1504) #b00000000000111111111111111111111) (= (mask!10387 thiss!1504) #b00000000001111111111111111111111) (= (mask!10387 thiss!1504) #b00000000011111111111111111111111) (= (mask!10387 thiss!1504) #b00000000111111111111111111111111) (= (mask!10387 thiss!1504) #b00000001111111111111111111111111) (= (mask!10387 thiss!1504) #b00000011111111111111111111111111) (= (mask!10387 thiss!1504) #b00000111111111111111111111111111) (= (mask!10387 thiss!1504) #b00001111111111111111111111111111) (= (mask!10387 thiss!1504) #b00011111111111111111111111111111) (= (mask!10387 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10387 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!236522 d!59437))

(declare-fun mapNonEmpty!10551 () Bool)

(declare-fun mapRes!10551 () Bool)

(declare-fun tp!22278 () Bool)

(declare-fun e!153695 () Bool)

(assert (=> mapNonEmpty!10551 (= mapRes!10551 (and tp!22278 e!153695))))

(declare-fun mapKey!10551 () (_ BitVec 32))

(declare-fun mapValue!10551 () ValueCell!2769)

(declare-fun mapRest!10551 () (Array (_ BitVec 32) ValueCell!2769))

(assert (=> mapNonEmpty!10551 (= mapRest!10545 (store mapRest!10551 mapKey!10551 mapValue!10551))))

(declare-fun condMapEmpty!10551 () Bool)

(declare-fun mapDefault!10551 () ValueCell!2769)

(assert (=> mapNonEmpty!10545 (= condMapEmpty!10551 (= mapRest!10545 ((as const (Array (_ BitVec 32) ValueCell!2769)) mapDefault!10551)))))

(declare-fun e!153696 () Bool)

(assert (=> mapNonEmpty!10545 (= tp!22269 (and e!153696 mapRes!10551))))

(declare-fun b!236661 () Bool)

(assert (=> b!236661 (= e!153696 tp_is_empty!6225)))

(declare-fun mapIsEmpty!10551 () Bool)

(assert (=> mapIsEmpty!10551 mapRes!10551))

(declare-fun b!236660 () Bool)

(assert (=> b!236660 (= e!153695 tp_is_empty!6225)))

(assert (= (and mapNonEmpty!10545 condMapEmpty!10551) mapIsEmpty!10551))

(assert (= (and mapNonEmpty!10545 (not condMapEmpty!10551)) mapNonEmpty!10551))

(assert (= (and mapNonEmpty!10551 ((_ is ValueCellFull!2769) mapValue!10551)) b!236660))

(assert (= (and mapNonEmpty!10545 ((_ is ValueCellFull!2769) mapDefault!10551)) b!236661))

(declare-fun m!257507 () Bool)

(assert (=> mapNonEmpty!10551 m!257507))

(declare-fun b_lambda!7929 () Bool)

(assert (= b_lambda!7927 (or (and b!236523 b_free!6363) b_lambda!7929)))

(check-sat (not b_lambda!7929) (not b!236586) (not b!236579) (not bm!22000) (not d!59433) (not b!236650) (not bm!21996) (not b_next!6363) (not b!236639) (not mapNonEmpty!10551) (not d!59431) (not b!236644) (not b!236651) (not b!236588) (not b!236577) (not d!59435) (not b!236578) (not b!236646) (not bm!21998) (not b!236631) (not bm!21999) tp_is_empty!6225 (not b!236565) (not b!236642) b_and!13307 (not b!236636) (not d!59425))
(check-sat b_and!13307 (not b_next!6363))
(get-model)

(declare-fun d!59439 () Bool)

(assert (=> d!59439 (= (validKeyInArray!0 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!236650 d!59439))

(declare-fun d!59441 () Bool)

(declare-fun res!116035 () Bool)

(declare-fun e!153701 () Bool)

(assert (=> d!59441 (=> res!116035 e!153701)))

(assert (=> d!59441 (= res!116035 (and ((_ is Cons!3553) (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))) (= (_1!2338 (h!4206 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))))) key!932)))))

(assert (=> d!59441 (= (containsKey!264 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932) e!153701)))

(declare-fun b!236666 () Bool)

(declare-fun e!153702 () Bool)

(assert (=> b!236666 (= e!153701 e!153702)))

(declare-fun res!116036 () Bool)

(assert (=> b!236666 (=> (not res!116036) (not e!153702))))

(assert (=> b!236666 (= res!116036 (and (or (not ((_ is Cons!3553) (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))))) (bvsle (_1!2338 (h!4206 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))))) key!932)) ((_ is Cons!3553) (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))) (bvslt (_1!2338 (h!4206 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))))) key!932)))))

(declare-fun b!236667 () Bool)

(assert (=> b!236667 (= e!153702 (containsKey!264 (t!8538 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))) key!932))))

(assert (= (and d!59441 (not res!116035)) b!236666))

(assert (= (and b!236666 res!116036) b!236667))

(declare-fun m!257509 () Bool)

(assert (=> b!236667 m!257509))

(assert (=> d!59433 d!59441))

(declare-fun b!236679 () Bool)

(declare-fun e!153714 () Bool)

(declare-fun call!22008 () Bool)

(assert (=> b!236679 (= e!153714 call!22008)))

(declare-fun b!236680 () Bool)

(declare-fun e!153711 () Bool)

(declare-fun contains!1680 (List!3558 (_ BitVec 64)) Bool)

(assert (=> b!236680 (= e!153711 (contains!1680 Nil!3555 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236681 () Bool)

(declare-fun e!153712 () Bool)

(declare-fun e!153713 () Bool)

(assert (=> b!236681 (= e!153712 e!153713)))

(declare-fun res!116044 () Bool)

(assert (=> b!236681 (=> (not res!116044) (not e!153713))))

(assert (=> b!236681 (= res!116044 (not e!153711))))

(declare-fun res!116043 () Bool)

(assert (=> b!236681 (=> (not res!116043) (not e!153711))))

(assert (=> b!236681 (= res!116043 (validKeyInArray!0 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236682 () Bool)

(assert (=> b!236682 (= e!153714 call!22008)))

(declare-fun bm!22005 () Bool)

(declare-fun c!39428 () Bool)

(assert (=> bm!22005 (= call!22008 (arrayNoDuplicates!0 (_keys!6477 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39428 (Cons!3554 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000) Nil!3555) Nil!3555)))))

(declare-fun d!59443 () Bool)

(declare-fun res!116045 () Bool)

(assert (=> d!59443 (=> res!116045 e!153712)))

(assert (=> d!59443 (= res!116045 (bvsge #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(assert (=> d!59443 (= (arrayNoDuplicates!0 (_keys!6477 thiss!1504) #b00000000000000000000000000000000 Nil!3555) e!153712)))

(declare-fun b!236678 () Bool)

(assert (=> b!236678 (= e!153713 e!153714)))

(assert (=> b!236678 (= c!39428 (validKeyInArray!0 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59443 (not res!116045)) b!236681))

(assert (= (and b!236681 res!116043) b!236680))

(assert (= (and b!236681 res!116044) b!236678))

(assert (= (and b!236678 c!39428) b!236679))

(assert (= (and b!236678 (not c!39428)) b!236682))

(assert (= (or b!236679 b!236682) bm!22005))

(assert (=> b!236680 m!257469))

(assert (=> b!236680 m!257469))

(declare-fun m!257511 () Bool)

(assert (=> b!236680 m!257511))

(assert (=> b!236681 m!257469))

(assert (=> b!236681 m!257469))

(assert (=> b!236681 m!257483))

(assert (=> bm!22005 m!257469))

(declare-fun m!257513 () Bool)

(assert (=> bm!22005 m!257513))

(assert (=> b!236678 m!257469))

(assert (=> b!236678 m!257469))

(assert (=> b!236678 m!257483))

(assert (=> b!236579 d!59443))

(declare-fun b!236695 () Bool)

(declare-fun e!153721 () SeekEntryResult!1002)

(assert (=> b!236695 (= e!153721 (MissingVacant!1002 (index!6180 lt!119590)))))

(declare-fun b!236696 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!236696 (= e!153721 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23884 lt!119590) #b00000000000000000000000000000001) (nextIndex!0 (index!6180 lt!119590) (x!23884 lt!119590) (mask!10387 thiss!1504)) (index!6180 lt!119590) key!932 (_keys!6477 thiss!1504) (mask!10387 thiss!1504)))))

(declare-fun b!236697 () Bool)

(declare-fun e!153723 () SeekEntryResult!1002)

(assert (=> b!236697 (= e!153723 (Found!1002 (index!6180 lt!119590)))))

(declare-fun b!236698 () Bool)

(declare-fun c!39437 () Bool)

(declare-fun lt!119676 () (_ BitVec 64))

(assert (=> b!236698 (= c!39437 (= lt!119676 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236698 (= e!153723 e!153721)))

(declare-fun b!236699 () Bool)

(declare-fun e!153722 () SeekEntryResult!1002)

(assert (=> b!236699 (= e!153722 Undefined!1002)))

(declare-fun d!59445 () Bool)

(declare-fun lt!119675 () SeekEntryResult!1002)

(assert (=> d!59445 (and (or ((_ is Undefined!1002) lt!119675) (not ((_ is Found!1002) lt!119675)) (and (bvsge (index!6179 lt!119675) #b00000000000000000000000000000000) (bvslt (index!6179 lt!119675) (size!5905 (_keys!6477 thiss!1504))))) (or ((_ is Undefined!1002) lt!119675) ((_ is Found!1002) lt!119675) (not ((_ is MissingVacant!1002) lt!119675)) (not (= (index!6181 lt!119675) (index!6180 lt!119590))) (and (bvsge (index!6181 lt!119675) #b00000000000000000000000000000000) (bvslt (index!6181 lt!119675) (size!5905 (_keys!6477 thiss!1504))))) (or ((_ is Undefined!1002) lt!119675) (ite ((_ is Found!1002) lt!119675) (= (select (arr!5567 (_keys!6477 thiss!1504)) (index!6179 lt!119675)) key!932) (and ((_ is MissingVacant!1002) lt!119675) (= (index!6181 lt!119675) (index!6180 lt!119590)) (= (select (arr!5567 (_keys!6477 thiss!1504)) (index!6181 lt!119675)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59445 (= lt!119675 e!153722)))

(declare-fun c!39436 () Bool)

(assert (=> d!59445 (= c!39436 (bvsge (x!23884 lt!119590) #b01111111111111111111111111111110))))

(assert (=> d!59445 (= lt!119676 (select (arr!5567 (_keys!6477 thiss!1504)) (index!6180 lt!119590)))))

(assert (=> d!59445 (validMask!0 (mask!10387 thiss!1504))))

(assert (=> d!59445 (= (seekKeyOrZeroReturnVacant!0 (x!23884 lt!119590) (index!6180 lt!119590) (index!6180 lt!119590) key!932 (_keys!6477 thiss!1504) (mask!10387 thiss!1504)) lt!119675)))

(declare-fun b!236700 () Bool)

(assert (=> b!236700 (= e!153722 e!153723)))

(declare-fun c!39435 () Bool)

(assert (=> b!236700 (= c!39435 (= lt!119676 key!932))))

(assert (= (and d!59445 c!39436) b!236699))

(assert (= (and d!59445 (not c!39436)) b!236700))

(assert (= (and b!236700 c!39435) b!236697))

(assert (= (and b!236700 (not c!39435)) b!236698))

(assert (= (and b!236698 c!39437) b!236695))

(assert (= (and b!236698 (not c!39437)) b!236696))

(declare-fun m!257515 () Bool)

(assert (=> b!236696 m!257515))

(assert (=> b!236696 m!257515))

(declare-fun m!257517 () Bool)

(assert (=> b!236696 m!257517))

(declare-fun m!257519 () Bool)

(assert (=> d!59445 m!257519))

(declare-fun m!257521 () Bool)

(assert (=> d!59445 m!257521))

(assert (=> d!59445 m!257421))

(assert (=> d!59445 m!257397))

(assert (=> b!236565 d!59445))

(declare-fun b!236709 () Bool)

(declare-fun e!153729 () (_ BitVec 32))

(assert (=> b!236709 (= e!153729 #b00000000000000000000000000000000)))

(declare-fun b!236710 () Bool)

(declare-fun e!153728 () (_ BitVec 32))

(declare-fun call!22011 () (_ BitVec 32))

(assert (=> b!236710 (= e!153728 (bvadd #b00000000000000000000000000000001 call!22011))))

(declare-fun d!59447 () Bool)

(declare-fun lt!119679 () (_ BitVec 32))

(assert (=> d!59447 (and (bvsge lt!119679 #b00000000000000000000000000000000) (bvsle lt!119679 (bvsub (size!5905 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59447 (= lt!119679 e!153729)))

(declare-fun c!39443 () Bool)

(assert (=> d!59447 (= c!39443 (bvsge #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(assert (=> d!59447 (and (bvsle #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5905 (_keys!6477 thiss!1504)) (size!5905 (_keys!6477 thiss!1504))))))

(assert (=> d!59447 (= (arrayCountValidKeys!0 (_keys!6477 thiss!1504) #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))) lt!119679)))

(declare-fun b!236711 () Bool)

(assert (=> b!236711 (= e!153728 call!22011)))

(declare-fun bm!22008 () Bool)

(assert (=> bm!22008 (= call!22011 (arrayCountValidKeys!0 (_keys!6477 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5905 (_keys!6477 thiss!1504))))))

(declare-fun b!236712 () Bool)

(assert (=> b!236712 (= e!153729 e!153728)))

(declare-fun c!39442 () Bool)

(assert (=> b!236712 (= c!39442 (validKeyInArray!0 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59447 c!39443) b!236709))

(assert (= (and d!59447 (not c!39443)) b!236712))

(assert (= (and b!236712 c!39442) b!236710))

(assert (= (and b!236712 (not c!39442)) b!236711))

(assert (= (or b!236710 b!236711) bm!22008))

(declare-fun m!257523 () Bool)

(assert (=> bm!22008 m!257523))

(assert (=> b!236712 m!257469))

(assert (=> b!236712 m!257469))

(assert (=> b!236712 m!257483))

(assert (=> b!236577 d!59447))

(declare-fun d!59449 () Bool)

(declare-fun e!153730 () Bool)

(assert (=> d!59449 e!153730))

(declare-fun res!116046 () Bool)

(assert (=> d!59449 (=> res!116046 e!153730)))

(declare-fun lt!119682 () Bool)

(assert (=> d!59449 (= res!116046 (not lt!119682))))

(declare-fun lt!119681 () Bool)

(assert (=> d!59449 (= lt!119682 lt!119681)))

(declare-fun lt!119683 () Unit!7280)

(declare-fun e!153731 () Unit!7280)

(assert (=> d!59449 (= lt!119683 e!153731)))

(declare-fun c!39444 () Bool)

(assert (=> d!59449 (= c!39444 lt!119681)))

(assert (=> d!59449 (= lt!119681 (containsKey!264 (toList!1799 lt!119662) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59449 (= (contains!1679 lt!119662 #b0000000000000000000000000000000000000000000000000000000000000000) lt!119682)))

(declare-fun b!236713 () Bool)

(declare-fun lt!119680 () Unit!7280)

(assert (=> b!236713 (= e!153731 lt!119680)))

(assert (=> b!236713 (= lt!119680 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1799 lt!119662) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236713 (isDefined!213 (getValueByKey!272 (toList!1799 lt!119662) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236714 () Bool)

(declare-fun Unit!7284 () Unit!7280)

(assert (=> b!236714 (= e!153731 Unit!7284)))

(declare-fun b!236715 () Bool)

(assert (=> b!236715 (= e!153730 (isDefined!213 (getValueByKey!272 (toList!1799 lt!119662) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59449 c!39444) b!236713))

(assert (= (and d!59449 (not c!39444)) b!236714))

(assert (= (and d!59449 (not res!116046)) b!236715))

(declare-fun m!257525 () Bool)

(assert (=> d!59449 m!257525))

(declare-fun m!257527 () Bool)

(assert (=> b!236713 m!257527))

(declare-fun m!257529 () Bool)

(assert (=> b!236713 m!257529))

(assert (=> b!236713 m!257529))

(declare-fun m!257531 () Bool)

(assert (=> b!236713 m!257531))

(assert (=> b!236715 m!257529))

(assert (=> b!236715 m!257529))

(assert (=> b!236715 m!257531))

(assert (=> bm!21996 d!59449))

(declare-fun d!59451 () Bool)

(declare-fun res!116051 () Bool)

(declare-fun e!153740 () Bool)

(assert (=> d!59451 (=> res!116051 e!153740)))

(assert (=> d!59451 (= res!116051 (bvsge #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(assert (=> d!59451 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6477 thiss!1504) (mask!10387 thiss!1504)) e!153740)))

(declare-fun b!236724 () Bool)

(declare-fun e!153738 () Bool)

(assert (=> b!236724 (= e!153740 e!153738)))

(declare-fun c!39447 () Bool)

(assert (=> b!236724 (= c!39447 (validKeyInArray!0 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22011 () Bool)

(declare-fun call!22014 () Bool)

(assert (=> bm!22011 (= call!22014 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6477 thiss!1504) (mask!10387 thiss!1504)))))

(declare-fun b!236725 () Bool)

(declare-fun e!153739 () Bool)

(assert (=> b!236725 (= e!153738 e!153739)))

(declare-fun lt!119690 () (_ BitVec 64))

(assert (=> b!236725 (= lt!119690 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119691 () Unit!7280)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11717 (_ BitVec 64) (_ BitVec 32)) Unit!7280)

(assert (=> b!236725 (= lt!119691 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6477 thiss!1504) lt!119690 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!236725 (arrayContainsKey!0 (_keys!6477 thiss!1504) lt!119690 #b00000000000000000000000000000000)))

(declare-fun lt!119692 () Unit!7280)

(assert (=> b!236725 (= lt!119692 lt!119691)))

(declare-fun res!116052 () Bool)

(assert (=> b!236725 (= res!116052 (= (seekEntryOrOpen!0 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000) (_keys!6477 thiss!1504) (mask!10387 thiss!1504)) (Found!1002 #b00000000000000000000000000000000)))))

(assert (=> b!236725 (=> (not res!116052) (not e!153739))))

(declare-fun b!236726 () Bool)

(assert (=> b!236726 (= e!153738 call!22014)))

(declare-fun b!236727 () Bool)

(assert (=> b!236727 (= e!153739 call!22014)))

(assert (= (and d!59451 (not res!116051)) b!236724))

(assert (= (and b!236724 c!39447) b!236725))

(assert (= (and b!236724 (not c!39447)) b!236726))

(assert (= (and b!236725 res!116052) b!236727))

(assert (= (or b!236727 b!236726) bm!22011))

(assert (=> b!236724 m!257469))

(assert (=> b!236724 m!257469))

(assert (=> b!236724 m!257483))

(declare-fun m!257533 () Bool)

(assert (=> bm!22011 m!257533))

(assert (=> b!236725 m!257469))

(declare-fun m!257535 () Bool)

(assert (=> b!236725 m!257535))

(declare-fun m!257537 () Bool)

(assert (=> b!236725 m!257537))

(assert (=> b!236725 m!257469))

(declare-fun m!257539 () Bool)

(assert (=> b!236725 m!257539))

(assert (=> b!236578 d!59451))

(declare-fun d!59453 () Bool)

(declare-fun e!153743 () Bool)

(assert (=> d!59453 e!153743))

(declare-fun res!116058 () Bool)

(assert (=> d!59453 (=> (not res!116058) (not e!153743))))

(declare-fun lt!119703 () ListLongMap!3567)

(assert (=> d!59453 (= res!116058 (contains!1679 lt!119703 (_1!2338 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))))))

(declare-fun lt!119704 () List!3557)

(assert (=> d!59453 (= lt!119703 (ListLongMap!3568 lt!119704))))

(declare-fun lt!119701 () Unit!7280)

(declare-fun lt!119702 () Unit!7280)

(assert (=> d!59453 (= lt!119701 lt!119702)))

(assert (=> d!59453 (= (getValueByKey!272 lt!119704 (_1!2338 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))) (Some!277 (_2!2338 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!152 (List!3557 (_ BitVec 64) V!7947) Unit!7280)

(assert (=> d!59453 (= lt!119702 (lemmaContainsTupThenGetReturnValue!152 lt!119704 (_1!2338 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))) (_2!2338 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))))))

(declare-fun insertStrictlySorted!155 (List!3557 (_ BitVec 64) V!7947) List!3557)

(assert (=> d!59453 (= lt!119704 (insertStrictlySorted!155 (toList!1799 call!22000) (_1!2338 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))) (_2!2338 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))))))

(assert (=> d!59453 (= (+!641 call!22000 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))) lt!119703)))

(declare-fun b!236732 () Bool)

(declare-fun res!116057 () Bool)

(assert (=> b!236732 (=> (not res!116057) (not e!153743))))

(assert (=> b!236732 (= res!116057 (= (getValueByKey!272 (toList!1799 lt!119703) (_1!2338 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))) (Some!277 (_2!2338 (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))))))))

(declare-fun b!236733 () Bool)

(declare-fun contains!1681 (List!3557 tuple2!4654) Bool)

(assert (=> b!236733 (= e!153743 (contains!1681 (toList!1799 lt!119703) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))))))

(assert (= (and d!59453 res!116058) b!236732))

(assert (= (and b!236732 res!116057) b!236733))

(declare-fun m!257541 () Bool)

(assert (=> d!59453 m!257541))

(declare-fun m!257543 () Bool)

(assert (=> d!59453 m!257543))

(declare-fun m!257545 () Bool)

(assert (=> d!59453 m!257545))

(declare-fun m!257547 () Bool)

(assert (=> d!59453 m!257547))

(declare-fun m!257549 () Bool)

(assert (=> b!236732 m!257549))

(declare-fun m!257551 () Bool)

(assert (=> b!236733 m!257551))

(assert (=> b!236639 d!59453))

(declare-fun b!236743 () Bool)

(declare-fun res!116068 () Bool)

(declare-fun e!153746 () Bool)

(assert (=> b!236743 (=> (not res!116068) (not e!153746))))

(declare-fun size!5908 (LongMapFixedSize!3438) (_ BitVec 32))

(assert (=> b!236743 (= res!116068 (bvsge (size!5908 thiss!1504) (_size!1768 thiss!1504)))))

(declare-fun b!236744 () Bool)

(declare-fun res!116069 () Bool)

(assert (=> b!236744 (=> (not res!116069) (not e!153746))))

(assert (=> b!236744 (= res!116069 (= (size!5908 thiss!1504) (bvadd (_size!1768 thiss!1504) (bvsdiv (bvadd (extraKeys!4131 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!236742 () Bool)

(declare-fun res!116067 () Bool)

(assert (=> b!236742 (=> (not res!116067) (not e!153746))))

(assert (=> b!236742 (= res!116067 (and (= (size!5904 (_values!4377 thiss!1504)) (bvadd (mask!10387 thiss!1504) #b00000000000000000000000000000001)) (= (size!5905 (_keys!6477 thiss!1504)) (size!5904 (_values!4377 thiss!1504))) (bvsge (_size!1768 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1768 thiss!1504) (bvadd (mask!10387 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!236745 () Bool)

(assert (=> b!236745 (= e!153746 (and (bvsge (extraKeys!4131 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4131 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1768 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!59455 () Bool)

(declare-fun res!116070 () Bool)

(assert (=> d!59455 (=> (not res!116070) (not e!153746))))

(assert (=> d!59455 (= res!116070 (validMask!0 (mask!10387 thiss!1504)))))

(assert (=> d!59455 (= (simpleValid!237 thiss!1504) e!153746)))

(assert (= (and d!59455 res!116070) b!236742))

(assert (= (and b!236742 res!116067) b!236743))

(assert (= (and b!236743 res!116068) b!236744))

(assert (= (and b!236744 res!116069) b!236745))

(declare-fun m!257553 () Bool)

(assert (=> b!236743 m!257553))

(assert (=> b!236744 m!257553))

(assert (=> d!59455 m!257397))

(assert (=> d!59431 d!59455))

(declare-fun d!59457 () Bool)

(declare-fun e!153747 () Bool)

(assert (=> d!59457 e!153747))

(declare-fun res!116071 () Bool)

(assert (=> d!59457 (=> res!116071 e!153747)))

(declare-fun lt!119707 () Bool)

(assert (=> d!59457 (= res!116071 (not lt!119707))))

(declare-fun lt!119706 () Bool)

(assert (=> d!59457 (= lt!119707 lt!119706)))

(declare-fun lt!119708 () Unit!7280)

(declare-fun e!153748 () Unit!7280)

(assert (=> d!59457 (= lt!119708 e!153748)))

(declare-fun c!39448 () Bool)

(assert (=> d!59457 (= c!39448 lt!119706)))

(assert (=> d!59457 (= lt!119706 (containsKey!264 (toList!1799 lt!119662) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59457 (= (contains!1679 lt!119662 #b1000000000000000000000000000000000000000000000000000000000000000) lt!119707)))

(declare-fun b!236746 () Bool)

(declare-fun lt!119705 () Unit!7280)

(assert (=> b!236746 (= e!153748 lt!119705)))

(assert (=> b!236746 (= lt!119705 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1799 lt!119662) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236746 (isDefined!213 (getValueByKey!272 (toList!1799 lt!119662) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236747 () Bool)

(declare-fun Unit!7285 () Unit!7280)

(assert (=> b!236747 (= e!153748 Unit!7285)))

(declare-fun b!236748 () Bool)

(assert (=> b!236748 (= e!153747 (isDefined!213 (getValueByKey!272 (toList!1799 lt!119662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59457 c!39448) b!236746))

(assert (= (and d!59457 (not c!39448)) b!236747))

(assert (= (and d!59457 (not res!116071)) b!236748))

(declare-fun m!257555 () Bool)

(assert (=> d!59457 m!257555))

(declare-fun m!257557 () Bool)

(assert (=> b!236746 m!257557))

(declare-fun m!257559 () Bool)

(assert (=> b!236746 m!257559))

(assert (=> b!236746 m!257559))

(declare-fun m!257561 () Bool)

(assert (=> b!236746 m!257561))

(assert (=> b!236748 m!257559))

(assert (=> b!236748 m!257559))

(assert (=> b!236748 m!257561))

(assert (=> bm!22000 d!59457))

(declare-fun b!236773 () Bool)

(declare-fun res!116082 () Bool)

(declare-fun e!153766 () Bool)

(assert (=> b!236773 (=> (not res!116082) (not e!153766))))

(declare-fun lt!119727 () ListLongMap!3567)

(assert (=> b!236773 (= res!116082 (not (contains!1679 lt!119727 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236774 () Bool)

(declare-fun e!153765 () Bool)

(assert (=> b!236774 (= e!153765 (= lt!119727 (getCurrentListMapNoExtraKeys!536 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4394 thiss!1504))))))

(declare-fun b!236775 () Bool)

(declare-fun e!153767 () ListLongMap!3567)

(declare-fun call!22017 () ListLongMap!3567)

(assert (=> b!236775 (= e!153767 call!22017)))

(declare-fun b!236776 () Bool)

(declare-fun e!153764 () Bool)

(assert (=> b!236776 (= e!153766 e!153764)))

(declare-fun c!39459 () Bool)

(declare-fun e!153763 () Bool)

(assert (=> b!236776 (= c!39459 e!153763)))

(declare-fun res!116083 () Bool)

(assert (=> b!236776 (=> (not res!116083) (not e!153763))))

(assert (=> b!236776 (= res!116083 (bvslt #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(declare-fun b!236777 () Bool)

(declare-fun e!153768 () ListLongMap!3567)

(assert (=> b!236777 (= e!153768 e!153767)))

(declare-fun c!39458 () Bool)

(assert (=> b!236777 (= c!39458 (validKeyInArray!0 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236778 () Bool)

(declare-fun lt!119725 () Unit!7280)

(declare-fun lt!119724 () Unit!7280)

(assert (=> b!236778 (= lt!119725 lt!119724)))

(declare-fun lt!119728 () (_ BitVec 64))

(declare-fun lt!119729 () (_ BitVec 64))

(declare-fun lt!119723 () ListLongMap!3567)

(declare-fun lt!119726 () V!7947)

(assert (=> b!236778 (not (contains!1679 (+!641 lt!119723 (tuple2!4655 lt!119729 lt!119726)) lt!119728))))

(declare-fun addStillNotContains!116 (ListLongMap!3567 (_ BitVec 64) V!7947 (_ BitVec 64)) Unit!7280)

(assert (=> b!236778 (= lt!119724 (addStillNotContains!116 lt!119723 lt!119729 lt!119726 lt!119728))))

(assert (=> b!236778 (= lt!119728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!236778 (= lt!119726 (get!2862 (select (arr!5566 (_values!4377 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4394 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!236778 (= lt!119729 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236778 (= lt!119723 call!22017)))

(assert (=> b!236778 (= e!153767 (+!641 call!22017 (tuple2!4655 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000) (get!2862 (select (arr!5566 (_values!4377 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4394 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!236779 () Bool)

(assert (=> b!236779 (= e!153763 (validKeyInArray!0 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236779 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!22014 () Bool)

(assert (=> bm!22014 (= call!22017 (getCurrentListMapNoExtraKeys!536 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4394 thiss!1504)))))

(declare-fun b!236780 () Bool)

(declare-fun e!153769 () Bool)

(assert (=> b!236780 (= e!153764 e!153769)))

(assert (=> b!236780 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(declare-fun res!116080 () Bool)

(assert (=> b!236780 (= res!116080 (contains!1679 lt!119727 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236780 (=> (not res!116080) (not e!153769))))

(declare-fun b!236781 () Bool)

(declare-fun isEmpty!514 (ListLongMap!3567) Bool)

(assert (=> b!236781 (= e!153765 (isEmpty!514 lt!119727))))

(declare-fun b!236782 () Bool)

(assert (=> b!236782 (= e!153764 e!153765)))

(declare-fun c!39457 () Bool)

(assert (=> b!236782 (= c!39457 (bvslt #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(declare-fun b!236783 () Bool)

(assert (=> b!236783 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(assert (=> b!236783 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5904 (_values!4377 thiss!1504))))))

(assert (=> b!236783 (= e!153769 (= (apply!214 lt!119727 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)) (get!2862 (select (arr!5566 (_values!4377 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4394 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!59459 () Bool)

(assert (=> d!59459 e!153766))

(declare-fun res!116081 () Bool)

(assert (=> d!59459 (=> (not res!116081) (not e!153766))))

(assert (=> d!59459 (= res!116081 (not (contains!1679 lt!119727 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59459 (= lt!119727 e!153768)))

(declare-fun c!39460 () Bool)

(assert (=> d!59459 (= c!39460 (bvsge #b00000000000000000000000000000000 (size!5905 (_keys!6477 thiss!1504))))))

(assert (=> d!59459 (validMask!0 (mask!10387 thiss!1504))))

(assert (=> d!59459 (= (getCurrentListMapNoExtraKeys!536 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)) lt!119727)))

(declare-fun b!236784 () Bool)

(assert (=> b!236784 (= e!153768 (ListLongMap!3568 Nil!3554))))

(assert (= (and d!59459 c!39460) b!236784))

(assert (= (and d!59459 (not c!39460)) b!236777))

(assert (= (and b!236777 c!39458) b!236778))

(assert (= (and b!236777 (not c!39458)) b!236775))

(assert (= (or b!236778 b!236775) bm!22014))

(assert (= (and d!59459 res!116081) b!236773))

(assert (= (and b!236773 res!116082) b!236776))

(assert (= (and b!236776 res!116083) b!236779))

(assert (= (and b!236776 c!39459) b!236780))

(assert (= (and b!236776 (not c!39459)) b!236782))

(assert (= (and b!236780 res!116080) b!236783))

(assert (= (and b!236782 c!39457) b!236774))

(assert (= (and b!236782 (not c!39457)) b!236781))

(declare-fun b_lambda!7931 () Bool)

(assert (=> (not b_lambda!7931) (not b!236778)))

(assert (=> b!236778 t!8540))

(declare-fun b_and!13309 () Bool)

(assert (= b_and!13307 (and (=> t!8540 result!5145) b_and!13309)))

(declare-fun b_lambda!7933 () Bool)

(assert (=> (not b_lambda!7933) (not b!236783)))

(assert (=> b!236783 t!8540))

(declare-fun b_and!13311 () Bool)

(assert (= b_and!13309 (and (=> t!8540 result!5145) b_and!13311)))

(declare-fun m!257563 () Bool)

(assert (=> d!59459 m!257563))

(assert (=> d!59459 m!257397))

(assert (=> b!236780 m!257469))

(assert (=> b!236780 m!257469))

(declare-fun m!257565 () Bool)

(assert (=> b!236780 m!257565))

(declare-fun m!257567 () Bool)

(assert (=> b!236778 m!257567))

(declare-fun m!257569 () Bool)

(assert (=> b!236778 m!257569))

(declare-fun m!257571 () Bool)

(assert (=> b!236778 m!257571))

(assert (=> b!236778 m!257491))

(assert (=> b!236778 m!257469))

(assert (=> b!236778 m!257493))

(assert (=> b!236778 m!257567))

(declare-fun m!257573 () Bool)

(assert (=> b!236778 m!257573))

(assert (=> b!236778 m!257491))

(assert (=> b!236778 m!257493))

(assert (=> b!236778 m!257495))

(declare-fun m!257575 () Bool)

(assert (=> b!236781 m!257575))

(declare-fun m!257577 () Bool)

(assert (=> bm!22014 m!257577))

(assert (=> b!236774 m!257577))

(declare-fun m!257579 () Bool)

(assert (=> b!236773 m!257579))

(assert (=> b!236779 m!257469))

(assert (=> b!236779 m!257469))

(assert (=> b!236779 m!257483))

(assert (=> b!236783 m!257469))

(declare-fun m!257581 () Bool)

(assert (=> b!236783 m!257581))

(assert (=> b!236783 m!257491))

(assert (=> b!236783 m!257491))

(assert (=> b!236783 m!257493))

(assert (=> b!236783 m!257495))

(assert (=> b!236783 m!257469))

(assert (=> b!236783 m!257493))

(assert (=> b!236777 m!257469))

(assert (=> b!236777 m!257469))

(assert (=> b!236777 m!257483))

(assert (=> bm!21999 d!59459))

(declare-fun d!59461 () Bool)

(declare-fun get!2863 (Option!278) V!7947)

(assert (=> d!59461 (= (apply!214 lt!119662 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2863 (getValueByKey!272 (toList!1799 lt!119662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8741 () Bool)

(assert (= bs!8741 d!59461))

(assert (=> bs!8741 m!257559))

(assert (=> bs!8741 m!257559))

(declare-fun m!257583 () Bool)

(assert (=> bs!8741 m!257583))

(assert (=> b!236646 d!59461))

(declare-fun d!59463 () Bool)

(assert (=> d!59463 (= (apply!214 lt!119662 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)) (get!2863 (getValueByKey!272 (toList!1799 lt!119662) (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8742 () Bool)

(assert (= bs!8742 d!59463))

(assert (=> bs!8742 m!257469))

(declare-fun m!257585 () Bool)

(assert (=> bs!8742 m!257585))

(assert (=> bs!8742 m!257585))

(declare-fun m!257587 () Bool)

(assert (=> bs!8742 m!257587))

(assert (=> b!236631 d!59463))

(declare-fun d!59465 () Bool)

(declare-fun c!39463 () Bool)

(assert (=> d!59465 (= c!39463 ((_ is ValueCellFull!2769) (select (arr!5566 (_values!4377 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!153772 () V!7947)

(assert (=> d!59465 (= (get!2862 (select (arr!5566 (_values!4377 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4394 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!153772)))

(declare-fun b!236789 () Bool)

(declare-fun get!2864 (ValueCell!2769 V!7947) V!7947)

(assert (=> b!236789 (= e!153772 (get!2864 (select (arr!5566 (_values!4377 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4394 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236790 () Bool)

(declare-fun get!2865 (ValueCell!2769 V!7947) V!7947)

(assert (=> b!236790 (= e!153772 (get!2865 (select (arr!5566 (_values!4377 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!557 (defaultEntry!4394 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59465 c!39463) b!236789))

(assert (= (and d!59465 (not c!39463)) b!236790))

(assert (=> b!236789 m!257491))

(assert (=> b!236789 m!257493))

(declare-fun m!257589 () Bool)

(assert (=> b!236789 m!257589))

(assert (=> b!236790 m!257491))

(assert (=> b!236790 m!257493))

(declare-fun m!257591 () Bool)

(assert (=> b!236790 m!257591))

(assert (=> b!236631 d!59465))

(declare-fun d!59467 () Bool)

(declare-fun e!153773 () Bool)

(assert (=> d!59467 e!153773))

(declare-fun res!116085 () Bool)

(assert (=> d!59467 (=> (not res!116085) (not e!153773))))

(declare-fun lt!119732 () ListLongMap!3567)

(assert (=> d!59467 (= res!116085 (contains!1679 lt!119732 (_1!2338 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504)))))))

(declare-fun lt!119733 () List!3557)

(assert (=> d!59467 (= lt!119732 (ListLongMap!3568 lt!119733))))

(declare-fun lt!119730 () Unit!7280)

(declare-fun lt!119731 () Unit!7280)

(assert (=> d!59467 (= lt!119730 lt!119731)))

(assert (=> d!59467 (= (getValueByKey!272 lt!119733 (_1!2338 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504)))) (Some!277 (_2!2338 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504)))))))

(assert (=> d!59467 (= lt!119731 (lemmaContainsTupThenGetReturnValue!152 lt!119733 (_1!2338 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504))) (_2!2338 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504)))))))

(assert (=> d!59467 (= lt!119733 (insertStrictlySorted!155 (toList!1799 lt!119656) (_1!2338 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504))) (_2!2338 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504)))))))

(assert (=> d!59467 (= (+!641 lt!119656 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504))) lt!119732)))

(declare-fun b!236791 () Bool)

(declare-fun res!116084 () Bool)

(assert (=> b!236791 (=> (not res!116084) (not e!153773))))

(assert (=> b!236791 (= res!116084 (= (getValueByKey!272 (toList!1799 lt!119732) (_1!2338 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504)))) (Some!277 (_2!2338 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504))))))))

(declare-fun b!236792 () Bool)

(assert (=> b!236792 (= e!153773 (contains!1681 (toList!1799 lt!119732) (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504))))))

(assert (= (and d!59467 res!116085) b!236791))

(assert (= (and b!236791 res!116084) b!236792))

(declare-fun m!257593 () Bool)

(assert (=> d!59467 m!257593))

(declare-fun m!257595 () Bool)

(assert (=> d!59467 m!257595))

(declare-fun m!257597 () Bool)

(assert (=> d!59467 m!257597))

(declare-fun m!257599 () Bool)

(assert (=> d!59467 m!257599))

(declare-fun m!257601 () Bool)

(assert (=> b!236791 m!257601))

(declare-fun m!257603 () Bool)

(assert (=> b!236792 m!257603))

(assert (=> b!236644 d!59467))

(declare-fun d!59469 () Bool)

(assert (=> d!59469 (= (apply!214 (+!641 lt!119650 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504))) lt!119670) (get!2863 (getValueByKey!272 (toList!1799 (+!641 lt!119650 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504)))) lt!119670)))))

(declare-fun bs!8743 () Bool)

(assert (= bs!8743 d!59469))

(declare-fun m!257605 () Bool)

(assert (=> bs!8743 m!257605))

(assert (=> bs!8743 m!257605))

(declare-fun m!257607 () Bool)

(assert (=> bs!8743 m!257607))

(assert (=> b!236644 d!59469))

(declare-fun d!59471 () Bool)

(declare-fun e!153774 () Bool)

(assert (=> d!59471 e!153774))

(declare-fun res!116087 () Bool)

(assert (=> d!59471 (=> (not res!116087) (not e!153774))))

(declare-fun lt!119736 () ListLongMap!3567)

(assert (=> d!59471 (= res!116087 (contains!1679 lt!119736 (_1!2338 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504)))))))

(declare-fun lt!119737 () List!3557)

(assert (=> d!59471 (= lt!119736 (ListLongMap!3568 lt!119737))))

(declare-fun lt!119734 () Unit!7280)

(declare-fun lt!119735 () Unit!7280)

(assert (=> d!59471 (= lt!119734 lt!119735)))

(assert (=> d!59471 (= (getValueByKey!272 lt!119737 (_1!2338 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504)))) (Some!277 (_2!2338 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504)))))))

(assert (=> d!59471 (= lt!119735 (lemmaContainsTupThenGetReturnValue!152 lt!119737 (_1!2338 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504))) (_2!2338 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504)))))))

(assert (=> d!59471 (= lt!119737 (insertStrictlySorted!155 (toList!1799 lt!119669) (_1!2338 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504))) (_2!2338 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504)))))))

(assert (=> d!59471 (= (+!641 lt!119669 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504))) lt!119736)))

(declare-fun b!236793 () Bool)

(declare-fun res!116086 () Bool)

(assert (=> b!236793 (=> (not res!116086) (not e!153774))))

(assert (=> b!236793 (= res!116086 (= (getValueByKey!272 (toList!1799 lt!119736) (_1!2338 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504)))) (Some!277 (_2!2338 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504))))))))

(declare-fun b!236794 () Bool)

(assert (=> b!236794 (= e!153774 (contains!1681 (toList!1799 lt!119736) (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504))))))

(assert (= (and d!59471 res!116087) b!236793))

(assert (= (and b!236793 res!116086) b!236794))

(declare-fun m!257609 () Bool)

(assert (=> d!59471 m!257609))

(declare-fun m!257611 () Bool)

(assert (=> d!59471 m!257611))

(declare-fun m!257613 () Bool)

(assert (=> d!59471 m!257613))

(declare-fun m!257615 () Bool)

(assert (=> d!59471 m!257615))

(declare-fun m!257617 () Bool)

(assert (=> b!236793 m!257617))

(declare-fun m!257619 () Bool)

(assert (=> b!236794 m!257619))

(assert (=> b!236644 d!59471))

(declare-fun d!59473 () Bool)

(assert (=> d!59473 (= (apply!214 (+!641 lt!119669 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504))) lt!119649) (apply!214 lt!119669 lt!119649))))

(declare-fun lt!119740 () Unit!7280)

(declare-fun choose!1107 (ListLongMap!3567 (_ BitVec 64) V!7947 (_ BitVec 64)) Unit!7280)

(assert (=> d!59473 (= lt!119740 (choose!1107 lt!119669 lt!119652 (zeroValue!4235 thiss!1504) lt!119649))))

(declare-fun e!153777 () Bool)

(assert (=> d!59473 e!153777))

(declare-fun res!116090 () Bool)

(assert (=> d!59473 (=> (not res!116090) (not e!153777))))

(assert (=> d!59473 (= res!116090 (contains!1679 lt!119669 lt!119649))))

(assert (=> d!59473 (= (addApplyDifferent!190 lt!119669 lt!119652 (zeroValue!4235 thiss!1504) lt!119649) lt!119740)))

(declare-fun b!236798 () Bool)

(assert (=> b!236798 (= e!153777 (not (= lt!119649 lt!119652)))))

(assert (= (and d!59473 res!116090) b!236798))

(assert (=> d!59473 m!257459))

(assert (=> d!59473 m!257457))

(assert (=> d!59473 m!257473))

(declare-fun m!257621 () Bool)

(assert (=> d!59473 m!257621))

(declare-fun m!257623 () Bool)

(assert (=> d!59473 m!257623))

(assert (=> d!59473 m!257457))

(assert (=> b!236644 d!59473))

(declare-fun d!59475 () Bool)

(declare-fun e!153778 () Bool)

(assert (=> d!59475 e!153778))

(declare-fun res!116092 () Bool)

(assert (=> d!59475 (=> (not res!116092) (not e!153778))))

(declare-fun lt!119743 () ListLongMap!3567)

(assert (=> d!59475 (= res!116092 (contains!1679 lt!119743 (_1!2338 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504)))))))

(declare-fun lt!119744 () List!3557)

(assert (=> d!59475 (= lt!119743 (ListLongMap!3568 lt!119744))))

(declare-fun lt!119741 () Unit!7280)

(declare-fun lt!119742 () Unit!7280)

(assert (=> d!59475 (= lt!119741 lt!119742)))

(assert (=> d!59475 (= (getValueByKey!272 lt!119744 (_1!2338 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504)))) (Some!277 (_2!2338 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504)))))))

(assert (=> d!59475 (= lt!119742 (lemmaContainsTupThenGetReturnValue!152 lt!119744 (_1!2338 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504))) (_2!2338 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504)))))))

(assert (=> d!59475 (= lt!119744 (insertStrictlySorted!155 (toList!1799 lt!119650) (_1!2338 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504))) (_2!2338 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504)))))))

(assert (=> d!59475 (= (+!641 lt!119650 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504))) lt!119743)))

(declare-fun b!236799 () Bool)

(declare-fun res!116091 () Bool)

(assert (=> b!236799 (=> (not res!116091) (not e!153778))))

(assert (=> b!236799 (= res!116091 (= (getValueByKey!272 (toList!1799 lt!119743) (_1!2338 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504)))) (Some!277 (_2!2338 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504))))))))

(declare-fun b!236800 () Bool)

(assert (=> b!236800 (= e!153778 (contains!1681 (toList!1799 lt!119743) (tuple2!4655 lt!119667 (minValue!4235 thiss!1504))))))

(assert (= (and d!59475 res!116092) b!236799))

(assert (= (and b!236799 res!116091) b!236800))

(declare-fun m!257625 () Bool)

(assert (=> d!59475 m!257625))

(declare-fun m!257627 () Bool)

(assert (=> d!59475 m!257627))

(declare-fun m!257629 () Bool)

(assert (=> d!59475 m!257629))

(declare-fun m!257631 () Bool)

(assert (=> d!59475 m!257631))

(declare-fun m!257633 () Bool)

(assert (=> b!236799 m!257633))

(declare-fun m!257635 () Bool)

(assert (=> b!236800 m!257635))

(assert (=> b!236644 d!59475))

(declare-fun d!59477 () Bool)

(declare-fun e!153779 () Bool)

(assert (=> d!59477 e!153779))

(declare-fun res!116094 () Bool)

(assert (=> d!59477 (=> (not res!116094) (not e!153779))))

(declare-fun lt!119747 () ListLongMap!3567)

(assert (=> d!59477 (= res!116094 (contains!1679 lt!119747 (_1!2338 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504)))))))

(declare-fun lt!119748 () List!3557)

(assert (=> d!59477 (= lt!119747 (ListLongMap!3568 lt!119748))))

(declare-fun lt!119745 () Unit!7280)

(declare-fun lt!119746 () Unit!7280)

(assert (=> d!59477 (= lt!119745 lt!119746)))

(assert (=> d!59477 (= (getValueByKey!272 lt!119748 (_1!2338 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504)))) (Some!277 (_2!2338 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504)))))))

(assert (=> d!59477 (= lt!119746 (lemmaContainsTupThenGetReturnValue!152 lt!119748 (_1!2338 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504))) (_2!2338 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504)))))))

(assert (=> d!59477 (= lt!119748 (insertStrictlySorted!155 (toList!1799 lt!119666) (_1!2338 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504))) (_2!2338 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504)))))))

(assert (=> d!59477 (= (+!641 lt!119666 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504))) lt!119747)))

(declare-fun b!236801 () Bool)

(declare-fun res!116093 () Bool)

(assert (=> b!236801 (=> (not res!116093) (not e!153779))))

(assert (=> b!236801 (= res!116093 (= (getValueByKey!272 (toList!1799 lt!119747) (_1!2338 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504)))) (Some!277 (_2!2338 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504))))))))

(declare-fun b!236802 () Bool)

(assert (=> b!236802 (= e!153779 (contains!1681 (toList!1799 lt!119747) (tuple2!4655 lt!119660 (minValue!4235 thiss!1504))))))

(assert (= (and d!59477 res!116094) b!236801))

(assert (= (and b!236801 res!116093) b!236802))

(declare-fun m!257637 () Bool)

(assert (=> d!59477 m!257637))

(declare-fun m!257639 () Bool)

(assert (=> d!59477 m!257639))

(declare-fun m!257641 () Bool)

(assert (=> d!59477 m!257641))

(declare-fun m!257643 () Bool)

(assert (=> d!59477 m!257643))

(declare-fun m!257645 () Bool)

(assert (=> b!236801 m!257645))

(declare-fun m!257647 () Bool)

(assert (=> b!236802 m!257647))

(assert (=> b!236644 d!59477))

(declare-fun d!59479 () Bool)

(assert (=> d!59479 (= (apply!214 (+!641 lt!119669 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504))) lt!119649) (get!2863 (getValueByKey!272 (toList!1799 (+!641 lt!119669 (tuple2!4655 lt!119652 (zeroValue!4235 thiss!1504)))) lt!119649)))))

(declare-fun bs!8744 () Bool)

(assert (= bs!8744 d!59479))

(declare-fun m!257649 () Bool)

(assert (=> bs!8744 m!257649))

(assert (=> bs!8744 m!257649))

(declare-fun m!257651 () Bool)

(assert (=> bs!8744 m!257651))

(assert (=> b!236644 d!59479))

(declare-fun d!59481 () Bool)

(assert (=> d!59481 (= (apply!214 (+!641 lt!119666 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504))) lt!119657) (get!2863 (getValueByKey!272 (toList!1799 (+!641 lt!119666 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504)))) lt!119657)))))

(declare-fun bs!8745 () Bool)

(assert (= bs!8745 d!59481))

(declare-fun m!257653 () Bool)

(assert (=> bs!8745 m!257653))

(assert (=> bs!8745 m!257653))

(declare-fun m!257655 () Bool)

(assert (=> bs!8745 m!257655))

(assert (=> b!236644 d!59481))

(declare-fun d!59483 () Bool)

(assert (=> d!59483 (= (apply!214 lt!119650 lt!119670) (get!2863 (getValueByKey!272 (toList!1799 lt!119650) lt!119670)))))

(declare-fun bs!8746 () Bool)

(assert (= bs!8746 d!59483))

(declare-fun m!257657 () Bool)

(assert (=> bs!8746 m!257657))

(assert (=> bs!8746 m!257657))

(declare-fun m!257659 () Bool)

(assert (=> bs!8746 m!257659))

(assert (=> b!236644 d!59483))

(declare-fun d!59485 () Bool)

(assert (=> d!59485 (= (apply!214 lt!119666 lt!119657) (get!2863 (getValueByKey!272 (toList!1799 lt!119666) lt!119657)))))

(declare-fun bs!8747 () Bool)

(assert (= bs!8747 d!59485))

(declare-fun m!257661 () Bool)

(assert (=> bs!8747 m!257661))

(assert (=> bs!8747 m!257661))

(declare-fun m!257663 () Bool)

(assert (=> bs!8747 m!257663))

(assert (=> b!236644 d!59485))

(declare-fun d!59487 () Bool)

(assert (=> d!59487 (= (apply!214 (+!641 lt!119666 (tuple2!4655 lt!119660 (minValue!4235 thiss!1504))) lt!119657) (apply!214 lt!119666 lt!119657))))

(declare-fun lt!119749 () Unit!7280)

(assert (=> d!59487 (= lt!119749 (choose!1107 lt!119666 lt!119660 (minValue!4235 thiss!1504) lt!119657))))

(declare-fun e!153780 () Bool)

(assert (=> d!59487 e!153780))

(declare-fun res!116095 () Bool)

(assert (=> d!59487 (=> (not res!116095) (not e!153780))))

(assert (=> d!59487 (= res!116095 (contains!1679 lt!119666 lt!119657))))

(assert (=> d!59487 (= (addApplyDifferent!190 lt!119666 lt!119660 (minValue!4235 thiss!1504) lt!119657) lt!119749)))

(declare-fun b!236803 () Bool)

(assert (=> b!236803 (= e!153780 (not (= lt!119657 lt!119660)))))

(assert (= (and d!59487 res!116095) b!236803))

(assert (=> d!59487 m!257481))

(assert (=> d!59487 m!257453))

(assert (=> d!59487 m!257455))

(declare-fun m!257665 () Bool)

(assert (=> d!59487 m!257665))

(declare-fun m!257667 () Bool)

(assert (=> d!59487 m!257667))

(assert (=> d!59487 m!257453))

(assert (=> b!236644 d!59487))

(declare-fun d!59489 () Bool)

(assert (=> d!59489 (= (apply!214 (+!641 lt!119650 (tuple2!4655 lt!119667 (minValue!4235 thiss!1504))) lt!119670) (apply!214 lt!119650 lt!119670))))

(declare-fun lt!119750 () Unit!7280)

(assert (=> d!59489 (= lt!119750 (choose!1107 lt!119650 lt!119667 (minValue!4235 thiss!1504) lt!119670))))

(declare-fun e!153781 () Bool)

(assert (=> d!59489 e!153781))

(declare-fun res!116096 () Bool)

(assert (=> d!59489 (=> (not res!116096) (not e!153781))))

(assert (=> d!59489 (= res!116096 (contains!1679 lt!119650 lt!119670))))

(assert (=> d!59489 (= (addApplyDifferent!190 lt!119650 lt!119667 (minValue!4235 thiss!1504) lt!119670) lt!119750)))

(declare-fun b!236804 () Bool)

(assert (=> b!236804 (= e!153781 (not (= lt!119670 lt!119667)))))

(assert (= (and d!59489 res!116096) b!236804))

(assert (=> d!59489 m!257477))

(assert (=> d!59489 m!257449))

(assert (=> d!59489 m!257451))

(declare-fun m!257669 () Bool)

(assert (=> d!59489 m!257669))

(declare-fun m!257671 () Bool)

(assert (=> d!59489 m!257671))

(assert (=> d!59489 m!257449))

(assert (=> b!236644 d!59489))

(declare-fun d!59491 () Bool)

(declare-fun e!153782 () Bool)

(assert (=> d!59491 e!153782))

(declare-fun res!116097 () Bool)

(assert (=> d!59491 (=> res!116097 e!153782)))

(declare-fun lt!119753 () Bool)

(assert (=> d!59491 (= res!116097 (not lt!119753))))

(declare-fun lt!119752 () Bool)

(assert (=> d!59491 (= lt!119753 lt!119752)))

(declare-fun lt!119754 () Unit!7280)

(declare-fun e!153783 () Unit!7280)

(assert (=> d!59491 (= lt!119754 e!153783)))

(declare-fun c!39464 () Bool)

(assert (=> d!59491 (= c!39464 lt!119752)))

(assert (=> d!59491 (= lt!119752 (containsKey!264 (toList!1799 (+!641 lt!119656 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504)))) lt!119651))))

(assert (=> d!59491 (= (contains!1679 (+!641 lt!119656 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504))) lt!119651) lt!119753)))

(declare-fun b!236805 () Bool)

(declare-fun lt!119751 () Unit!7280)

(assert (=> b!236805 (= e!153783 lt!119751)))

(assert (=> b!236805 (= lt!119751 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1799 (+!641 lt!119656 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504)))) lt!119651))))

(assert (=> b!236805 (isDefined!213 (getValueByKey!272 (toList!1799 (+!641 lt!119656 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504)))) lt!119651))))

(declare-fun b!236806 () Bool)

(declare-fun Unit!7286 () Unit!7280)

(assert (=> b!236806 (= e!153783 Unit!7286)))

(declare-fun b!236807 () Bool)

(assert (=> b!236807 (= e!153782 (isDefined!213 (getValueByKey!272 (toList!1799 (+!641 lt!119656 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504)))) lt!119651)))))

(assert (= (and d!59491 c!39464) b!236805))

(assert (= (and d!59491 (not c!39464)) b!236806))

(assert (= (and d!59491 (not res!116097)) b!236807))

(declare-fun m!257673 () Bool)

(assert (=> d!59491 m!257673))

(declare-fun m!257675 () Bool)

(assert (=> b!236805 m!257675))

(declare-fun m!257677 () Bool)

(assert (=> b!236805 m!257677))

(assert (=> b!236805 m!257677))

(declare-fun m!257679 () Bool)

(assert (=> b!236805 m!257679))

(assert (=> b!236807 m!257677))

(assert (=> b!236807 m!257677))

(assert (=> b!236807 m!257679))

(assert (=> b!236644 d!59491))

(assert (=> b!236644 d!59459))

(declare-fun d!59493 () Bool)

(assert (=> d!59493 (contains!1679 (+!641 lt!119656 (tuple2!4655 lt!119654 (zeroValue!4235 thiss!1504))) lt!119651)))

(declare-fun lt!119757 () Unit!7280)

(declare-fun choose!1108 (ListLongMap!3567 (_ BitVec 64) V!7947 (_ BitVec 64)) Unit!7280)

(assert (=> d!59493 (= lt!119757 (choose!1108 lt!119656 lt!119654 (zeroValue!4235 thiss!1504) lt!119651))))

(assert (=> d!59493 (contains!1679 lt!119656 lt!119651)))

(assert (=> d!59493 (= (addStillContains!190 lt!119656 lt!119654 (zeroValue!4235 thiss!1504) lt!119651) lt!119757)))

(declare-fun bs!8748 () Bool)

(assert (= bs!8748 d!59493))

(assert (=> bs!8748 m!257463))

(assert (=> bs!8748 m!257463))

(assert (=> bs!8748 m!257465))

(declare-fun m!257681 () Bool)

(assert (=> bs!8748 m!257681))

(declare-fun m!257683 () Bool)

(assert (=> bs!8748 m!257683))

(assert (=> b!236644 d!59493))

(declare-fun d!59495 () Bool)

(assert (=> d!59495 (= (apply!214 lt!119669 lt!119649) (get!2863 (getValueByKey!272 (toList!1799 lt!119669) lt!119649)))))

(declare-fun bs!8749 () Bool)

(assert (= bs!8749 d!59495))

(declare-fun m!257685 () Bool)

(assert (=> bs!8749 m!257685))

(assert (=> bs!8749 m!257685))

(declare-fun m!257687 () Bool)

(assert (=> bs!8749 m!257687))

(assert (=> b!236644 d!59495))

(assert (=> d!59435 d!59437))

(declare-fun b!236827 () Bool)

(declare-fun e!153795 () SeekEntryResult!1002)

(assert (=> b!236827 (= e!153795 (Intermediate!1002 true (toIndex!0 key!932 (mask!10387 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236828 () Bool)

(declare-fun e!153797 () SeekEntryResult!1002)

(assert (=> b!236828 (= e!153797 (Intermediate!1002 false (toIndex!0 key!932 (mask!10387 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!236829 () Bool)

(declare-fun e!153796 () Bool)

(declare-fun e!153798 () Bool)

(assert (=> b!236829 (= e!153796 e!153798)))

(declare-fun res!116105 () Bool)

(declare-fun lt!119762 () SeekEntryResult!1002)

(assert (=> b!236829 (= res!116105 (and ((_ is Intermediate!1002) lt!119762) (not (undefined!1814 lt!119762)) (bvslt (x!23884 lt!119762) #b01111111111111111111111111111110) (bvsge (x!23884 lt!119762) #b00000000000000000000000000000000) (bvsge (x!23884 lt!119762) #b00000000000000000000000000000000)))))

(assert (=> b!236829 (=> (not res!116105) (not e!153798))))

(declare-fun b!236830 () Bool)

(assert (=> b!236830 (= e!153795 e!153797)))

(declare-fun c!39471 () Bool)

(declare-fun lt!119763 () (_ BitVec 64))

(assert (=> b!236830 (= c!39471 (or (= lt!119763 key!932) (= (bvadd lt!119763 lt!119763) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!236831 () Bool)

(assert (=> b!236831 (= e!153796 (bvsge (x!23884 lt!119762) #b01111111111111111111111111111110))))

(declare-fun b!236832 () Bool)

(assert (=> b!236832 (and (bvsge (index!6180 lt!119762) #b00000000000000000000000000000000) (bvslt (index!6180 lt!119762) (size!5905 (_keys!6477 thiss!1504))))))

(declare-fun res!116104 () Bool)

(assert (=> b!236832 (= res!116104 (= (select (arr!5567 (_keys!6477 thiss!1504)) (index!6180 lt!119762)) key!932))))

(declare-fun e!153794 () Bool)

(assert (=> b!236832 (=> res!116104 e!153794)))

(assert (=> b!236832 (= e!153798 e!153794)))

(declare-fun b!236833 () Bool)

(assert (=> b!236833 (and (bvsge (index!6180 lt!119762) #b00000000000000000000000000000000) (bvslt (index!6180 lt!119762) (size!5905 (_keys!6477 thiss!1504))))))

(assert (=> b!236833 (= e!153794 (= (select (arr!5567 (_keys!6477 thiss!1504)) (index!6180 lt!119762)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59497 () Bool)

(assert (=> d!59497 e!153796))

(declare-fun c!39473 () Bool)

(assert (=> d!59497 (= c!39473 (and ((_ is Intermediate!1002) lt!119762) (undefined!1814 lt!119762)))))

(assert (=> d!59497 (= lt!119762 e!153795)))

(declare-fun c!39472 () Bool)

(assert (=> d!59497 (= c!39472 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!59497 (= lt!119763 (select (arr!5567 (_keys!6477 thiss!1504)) (toIndex!0 key!932 (mask!10387 thiss!1504))))))

(assert (=> d!59497 (validMask!0 (mask!10387 thiss!1504))))

(assert (=> d!59497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10387 thiss!1504)) key!932 (_keys!6477 thiss!1504) (mask!10387 thiss!1504)) lt!119762)))

(declare-fun b!236834 () Bool)

(assert (=> b!236834 (and (bvsge (index!6180 lt!119762) #b00000000000000000000000000000000) (bvslt (index!6180 lt!119762) (size!5905 (_keys!6477 thiss!1504))))))

(declare-fun res!116106 () Bool)

(assert (=> b!236834 (= res!116106 (= (select (arr!5567 (_keys!6477 thiss!1504)) (index!6180 lt!119762)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!236834 (=> res!116106 e!153794)))

(declare-fun b!236835 () Bool)

(assert (=> b!236835 (= e!153797 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10387 thiss!1504)) #b00000000000000000000000000000000 (mask!10387 thiss!1504)) key!932 (_keys!6477 thiss!1504) (mask!10387 thiss!1504)))))

(assert (= (and d!59497 c!39472) b!236827))

(assert (= (and d!59497 (not c!39472)) b!236830))

(assert (= (and b!236830 c!39471) b!236828))

(assert (= (and b!236830 (not c!39471)) b!236835))

(assert (= (and d!59497 c!39473) b!236831))

(assert (= (and d!59497 (not c!39473)) b!236829))

(assert (= (and b!236829 res!116105) b!236832))

(assert (= (and b!236832 (not res!116104)) b!236834))

(assert (= (and b!236834 (not res!116106)) b!236833))

(declare-fun m!257689 () Bool)

(assert (=> b!236833 m!257689))

(assert (=> b!236832 m!257689))

(assert (=> b!236835 m!257429))

(declare-fun m!257691 () Bool)

(assert (=> b!236835 m!257691))

(assert (=> b!236835 m!257691))

(declare-fun m!257693 () Bool)

(assert (=> b!236835 m!257693))

(assert (=> d!59497 m!257429))

(declare-fun m!257695 () Bool)

(assert (=> d!59497 m!257695))

(assert (=> d!59497 m!257397))

(assert (=> b!236834 m!257689))

(assert (=> d!59425 d!59497))

(declare-fun d!59499 () Bool)

(declare-fun lt!119769 () (_ BitVec 32))

(declare-fun lt!119768 () (_ BitVec 32))

(assert (=> d!59499 (= lt!119769 (bvmul (bvxor lt!119768 (bvlshr lt!119768 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59499 (= lt!119768 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59499 (and (bvsge (mask!10387 thiss!1504) #b00000000000000000000000000000000) (let ((res!116107 (let ((h!4208 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23903 (bvmul (bvxor h!4208 (bvlshr h!4208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23903 (bvlshr x!23903 #b00000000000000000000000000001101)) (mask!10387 thiss!1504)))))) (and (bvslt res!116107 (bvadd (mask!10387 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!116107 #b00000000000000000000000000000000))))))

(assert (=> d!59499 (= (toIndex!0 key!932 (mask!10387 thiss!1504)) (bvand (bvxor lt!119769 (bvlshr lt!119769 #b00000000000000000000000000001101)) (mask!10387 thiss!1504)))))

(assert (=> d!59425 d!59499))

(assert (=> d!59425 d!59437))

(declare-fun d!59501 () Bool)

(declare-fun isEmpty!515 (Option!278) Bool)

(assert (=> d!59501 (= (isDefined!213 (getValueByKey!272 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932)) (not (isEmpty!515 (getValueByKey!272 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932))))))

(declare-fun bs!8750 () Bool)

(assert (= bs!8750 d!59501))

(assert (=> bs!8750 m!257445))

(declare-fun m!257697 () Bool)

(assert (=> bs!8750 m!257697))

(assert (=> b!236588 d!59501))

(declare-fun d!59503 () Bool)

(declare-fun c!39478 () Bool)

(assert (=> d!59503 (= c!39478 (and ((_ is Cons!3553) (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))) (= (_1!2338 (h!4206 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))))) key!932)))))

(declare-fun e!153803 () Option!278)

(assert (=> d!59503 (= (getValueByKey!272 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932) e!153803)))

(declare-fun b!236845 () Bool)

(declare-fun e!153804 () Option!278)

(assert (=> b!236845 (= e!153803 e!153804)))

(declare-fun c!39479 () Bool)

(assert (=> b!236845 (= c!39479 (and ((_ is Cons!3553) (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))) (not (= (_1!2338 (h!4206 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))))) key!932))))))

(declare-fun b!236847 () Bool)

(assert (=> b!236847 (= e!153804 None!276)))

(declare-fun b!236844 () Bool)

(assert (=> b!236844 (= e!153803 (Some!277 (_2!2338 (h!4206 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))))))))

(declare-fun b!236846 () Bool)

(assert (=> b!236846 (= e!153804 (getValueByKey!272 (t!8538 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))) key!932))))

(assert (= (and d!59503 c!39478) b!236844))

(assert (= (and d!59503 (not c!39478)) b!236845))

(assert (= (and b!236845 c!39479) b!236846))

(assert (= (and b!236845 (not c!39479)) b!236847))

(declare-fun m!257699 () Bool)

(assert (=> b!236846 m!257699))

(assert (=> b!236588 d!59503))

(declare-fun d!59505 () Bool)

(assert (=> d!59505 (= (apply!214 lt!119662 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2863 (getValueByKey!272 (toList!1799 lt!119662) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8751 () Bool)

(assert (= bs!8751 d!59505))

(assert (=> bs!8751 m!257529))

(assert (=> bs!8751 m!257529))

(declare-fun m!257701 () Bool)

(assert (=> bs!8751 m!257701))

(assert (=> b!236636 d!59505))

(declare-fun d!59507 () Bool)

(assert (=> d!59507 (isDefined!213 (getValueByKey!272 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932))))

(declare-fun lt!119772 () Unit!7280)

(declare-fun choose!1109 (List!3557 (_ BitVec 64)) Unit!7280)

(assert (=> d!59507 (= lt!119772 (choose!1109 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932))))

(declare-fun e!153807 () Bool)

(assert (=> d!59507 e!153807))

(declare-fun res!116110 () Bool)

(assert (=> d!59507 (=> (not res!116110) (not e!153807))))

(declare-fun isStrictlySorted!364 (List!3557) Bool)

(assert (=> d!59507 (= res!116110 (isStrictlySorted!364 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504)))))))

(assert (=> d!59507 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932) lt!119772)))

(declare-fun b!236850 () Bool)

(assert (=> b!236850 (= e!153807 (containsKey!264 (toList!1799 (getCurrentListMap!1327 (_keys!6477 thiss!1504) (_values!4377 thiss!1504) (mask!10387 thiss!1504) (extraKeys!4131 thiss!1504) (zeroValue!4235 thiss!1504) (minValue!4235 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4394 thiss!1504))) key!932))))

(assert (= (and d!59507 res!116110) b!236850))

(assert (=> d!59507 m!257445))

(assert (=> d!59507 m!257445))

(assert (=> d!59507 m!257447))

(declare-fun m!257703 () Bool)

(assert (=> d!59507 m!257703))

(declare-fun m!257705 () Bool)

(assert (=> d!59507 m!257705))

(assert (=> b!236850 m!257441))

(assert (=> b!236586 d!59507))

(assert (=> b!236586 d!59501))

(assert (=> b!236586 d!59503))

(declare-fun d!59509 () Bool)

(declare-fun e!153808 () Bool)

(assert (=> d!59509 e!153808))

(declare-fun res!116111 () Bool)

(assert (=> d!59509 (=> res!116111 e!153808)))

(declare-fun lt!119775 () Bool)

(assert (=> d!59509 (= res!116111 (not lt!119775))))

(declare-fun lt!119774 () Bool)

(assert (=> d!59509 (= lt!119775 lt!119774)))

(declare-fun lt!119776 () Unit!7280)

(declare-fun e!153809 () Unit!7280)

(assert (=> d!59509 (= lt!119776 e!153809)))

(declare-fun c!39480 () Bool)

(assert (=> d!59509 (= c!39480 lt!119774)))

(assert (=> d!59509 (= lt!119774 (containsKey!264 (toList!1799 lt!119662) (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59509 (= (contains!1679 lt!119662 (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)) lt!119775)))

(declare-fun b!236851 () Bool)

(declare-fun lt!119773 () Unit!7280)

(assert (=> b!236851 (= e!153809 lt!119773)))

(assert (=> b!236851 (= lt!119773 (lemmaContainsKeyImpliesGetValueByKeyDefined!212 (toList!1799 lt!119662) (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!236851 (isDefined!213 (getValueByKey!272 (toList!1799 lt!119662) (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!236852 () Bool)

(declare-fun Unit!7287 () Unit!7280)

(assert (=> b!236852 (= e!153809 Unit!7287)))

(declare-fun b!236853 () Bool)

(assert (=> b!236853 (= e!153808 (isDefined!213 (getValueByKey!272 (toList!1799 lt!119662) (select (arr!5567 (_keys!6477 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59509 c!39480) b!236851))

(assert (= (and d!59509 (not c!39480)) b!236852))

(assert (= (and d!59509 (not res!116111)) b!236853))

(assert (=> d!59509 m!257469))

(declare-fun m!257707 () Bool)

(assert (=> d!59509 m!257707))

(assert (=> b!236851 m!257469))

(declare-fun m!257709 () Bool)

(assert (=> b!236851 m!257709))

(assert (=> b!236851 m!257469))

(assert (=> b!236851 m!257585))

(assert (=> b!236851 m!257585))

(declare-fun m!257711 () Bool)

(assert (=> b!236851 m!257711))

(assert (=> b!236853 m!257469))

(assert (=> b!236853 m!257585))

(assert (=> b!236853 m!257585))

(assert (=> b!236853 m!257711))

(assert (=> b!236651 d!59509))

(declare-fun d!59511 () Bool)

(declare-fun e!153810 () Bool)

(assert (=> d!59511 e!153810))

(declare-fun res!116113 () Bool)

(assert (=> d!59511 (=> (not res!116113) (not e!153810))))

(declare-fun lt!119779 () ListLongMap!3567)

(assert (=> d!59511 (= res!116113 (contains!1679 lt!119779 (_1!2338 (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))))))))

(declare-fun lt!119780 () List!3557)

(assert (=> d!59511 (= lt!119779 (ListLongMap!3568 lt!119780))))

(declare-fun lt!119777 () Unit!7280)

(declare-fun lt!119778 () Unit!7280)

(assert (=> d!59511 (= lt!119777 lt!119778)))

(assert (=> d!59511 (= (getValueByKey!272 lt!119780 (_1!2338 (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))))) (Some!277 (_2!2338 (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))))))))

(assert (=> d!59511 (= lt!119778 (lemmaContainsTupThenGetReturnValue!152 lt!119780 (_1!2338 (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))) (_2!2338 (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))))))))

(assert (=> d!59511 (= lt!119780 (insertStrictlySorted!155 (toList!1799 (ite c!39424 call!21999 (ite c!39422 call!22001 call!22003))) (_1!2338 (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))) (_2!2338 (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))))))))

(assert (=> d!59511 (= (+!641 (ite c!39424 call!21999 (ite c!39422 call!22001 call!22003)) (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))) lt!119779)))

(declare-fun b!236854 () Bool)

(declare-fun res!116112 () Bool)

(assert (=> b!236854 (=> (not res!116112) (not e!153810))))

(assert (=> b!236854 (= res!116112 (= (getValueByKey!272 (toList!1799 lt!119779) (_1!2338 (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504))))) (Some!277 (_2!2338 (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))))))))

(declare-fun b!236855 () Bool)

(assert (=> b!236855 (= e!153810 (contains!1681 (toList!1799 lt!119779) (ite (or c!39424 c!39422) (tuple2!4655 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4235 thiss!1504)) (tuple2!4655 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4235 thiss!1504)))))))

(assert (= (and d!59511 res!116113) b!236854))

(assert (= (and b!236854 res!116112) b!236855))

(declare-fun m!257713 () Bool)

(assert (=> d!59511 m!257713))

(declare-fun m!257715 () Bool)

(assert (=> d!59511 m!257715))

(declare-fun m!257717 () Bool)

(assert (=> d!59511 m!257717))

(declare-fun m!257719 () Bool)

(assert (=> d!59511 m!257719))

(declare-fun m!257721 () Bool)

(assert (=> b!236854 m!257721))

(declare-fun m!257723 () Bool)

(assert (=> b!236855 m!257723))

(assert (=> bm!21998 d!59511))

(assert (=> b!236642 d!59439))

(declare-fun mapNonEmpty!10552 () Bool)

(declare-fun mapRes!10552 () Bool)

(declare-fun tp!22279 () Bool)

(declare-fun e!153811 () Bool)

(assert (=> mapNonEmpty!10552 (= mapRes!10552 (and tp!22279 e!153811))))

(declare-fun mapKey!10552 () (_ BitVec 32))

(declare-fun mapRest!10552 () (Array (_ BitVec 32) ValueCell!2769))

(declare-fun mapValue!10552 () ValueCell!2769)

(assert (=> mapNonEmpty!10552 (= mapRest!10551 (store mapRest!10552 mapKey!10552 mapValue!10552))))

(declare-fun condMapEmpty!10552 () Bool)

(declare-fun mapDefault!10552 () ValueCell!2769)

(assert (=> mapNonEmpty!10551 (= condMapEmpty!10552 (= mapRest!10551 ((as const (Array (_ BitVec 32) ValueCell!2769)) mapDefault!10552)))))

(declare-fun e!153812 () Bool)

(assert (=> mapNonEmpty!10551 (= tp!22278 (and e!153812 mapRes!10552))))

(declare-fun b!236857 () Bool)

(assert (=> b!236857 (= e!153812 tp_is_empty!6225)))

(declare-fun mapIsEmpty!10552 () Bool)

(assert (=> mapIsEmpty!10552 mapRes!10552))

(declare-fun b!236856 () Bool)

(assert (=> b!236856 (= e!153811 tp_is_empty!6225)))

(assert (= (and mapNonEmpty!10551 condMapEmpty!10552) mapIsEmpty!10552))

(assert (= (and mapNonEmpty!10551 (not condMapEmpty!10552)) mapNonEmpty!10552))

(assert (= (and mapNonEmpty!10552 ((_ is ValueCellFull!2769) mapValue!10552)) b!236856))

(assert (= (and mapNonEmpty!10551 ((_ is ValueCellFull!2769) mapDefault!10552)) b!236857))

(declare-fun m!257725 () Bool)

(assert (=> mapNonEmpty!10552 m!257725))

(declare-fun b_lambda!7935 () Bool)

(assert (= b_lambda!7933 (or (and b!236523 b_free!6363) b_lambda!7935)))

(declare-fun b_lambda!7937 () Bool)

(assert (= b_lambda!7931 (or (and b!236523 b_free!6363) b_lambda!7937)))

(check-sat (not d!59475) (not b!236790) (not d!59485) (not b!236793) tp_is_empty!6225 (not b!236800) (not b!236681) (not b!236778) (not b_lambda!7929) (not bm!22011) (not d!59479) (not d!59467) (not b!236835) (not b!236774) (not d!59471) (not b!236744) (not b!236746) (not b!236846) (not b!236733) (not b!236792) (not b!236853) (not b!236789) (not b!236850) (not d!59489) (not bm!22005) (not bm!22008) (not b!236777) (not b!236802) (not b!236783) (not b_lambda!7937) (not d!59459) (not d!59449) (not b!236791) (not b!236724) (not bm!22014) b_and!13311 (not b!236805) (not d!59511) (not b!236780) (not b!236712) (not b!236854) (not d!59487) (not d!59481) (not d!59507) (not d!59483) (not b!236680) (not b!236748) (not d!59491) (not b_next!6363) (not d!59457) (not b!236678) (not d!59477) (not d!59495) (not d!59469) (not b!236743) (not b!236725) (not b!236696) (not d!59463) (not b!236807) (not d!59497) (not d!59455) (not b!236773) (not b!236801) (not d!59501) (not d!59509) (not d!59461) (not d!59493) (not b!236799) (not d!59453) (not b!236715) (not d!59445) (not b!236779) (not b!236713) (not d!59505) (not mapNonEmpty!10552) (not b!236732) (not d!59473) (not b!236667) (not b_lambda!7935) (not b!236781) (not b!236794) (not b!236851) (not b!236855))
(check-sat b_and!13311 (not b_next!6363))
