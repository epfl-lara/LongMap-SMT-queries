; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23054 () Bool)

(assert start!23054)

(declare-fun b!241502 () Bool)

(declare-fun b_free!6487 () Bool)

(declare-fun b_next!6487 () Bool)

(assert (=> b!241502 (= b_free!6487 (not b_next!6487))))

(declare-fun tp!22668 () Bool)

(declare-fun b_and!13473 () Bool)

(assert (=> b!241502 (= tp!22668 b_and!13473)))

(declare-fun b!241499 () Bool)

(declare-fun e!156720 () Bool)

(declare-fun e!156726 () Bool)

(declare-fun mapRes!10759 () Bool)

(assert (=> b!241499 (= e!156720 (and e!156726 mapRes!10759))))

(declare-fun condMapEmpty!10759 () Bool)

(declare-datatypes ((V!8113 0))(
  ( (V!8114 (val!3219 Int)) )
))
(declare-datatypes ((ValueCell!2831 0))(
  ( (ValueCellFull!2831 (v!5259 V!8113)) (EmptyCell!2831) )
))
(declare-datatypes ((array!11977 0))(
  ( (array!11978 (arr!5689 (Array (_ BitVec 32) ValueCell!2831)) (size!6031 (_ BitVec 32))) )
))
(declare-datatypes ((array!11979 0))(
  ( (array!11980 (arr!5690 (Array (_ BitVec 32) (_ BitVec 64))) (size!6032 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3562 0))(
  ( (LongMapFixedSize!3563 (defaultEntry!4474 Int) (mask!10545 (_ BitVec 32)) (extraKeys!4211 (_ BitVec 32)) (zeroValue!4315 V!8113) (minValue!4315 V!8113) (_size!1830 (_ BitVec 32)) (_keys!6580 array!11979) (_values!4457 array!11977) (_vacant!1830 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3562)

(declare-fun mapDefault!10759 () ValueCell!2831)

(assert (=> b!241499 (= condMapEmpty!10759 (= (arr!5689 (_values!4457 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2831)) mapDefault!10759)))))

(declare-fun mapIsEmpty!10759 () Bool)

(assert (=> mapIsEmpty!10759 mapRes!10759))

(declare-fun b!241500 () Bool)

(declare-fun e!156727 () Bool)

(declare-fun e!156717 () Bool)

(assert (=> b!241500 (= e!156727 e!156717)))

(declare-fun res!118387 () Bool)

(declare-fun call!22454 () Bool)

(assert (=> b!241500 (= res!118387 call!22454)))

(assert (=> b!241500 (=> (not res!118387) (not e!156717))))

(declare-fun b!241501 () Bool)

(declare-fun res!118383 () Bool)

(declare-fun e!156714 () Bool)

(assert (=> b!241501 (=> (not res!118383) (not e!156714))))

(assert (=> b!241501 (= res!118383 call!22454)))

(declare-fun e!156722 () Bool)

(assert (=> b!241501 (= e!156722 e!156714)))

(declare-fun e!156725 () Bool)

(declare-fun tp_is_empty!6349 () Bool)

(declare-fun array_inv!3739 (array!11979) Bool)

(declare-fun array_inv!3740 (array!11977) Bool)

(assert (=> b!241502 (= e!156725 (and tp!22668 tp_is_empty!6349 (array_inv!3739 (_keys!6580 thiss!1504)) (array_inv!3740 (_values!4457 thiss!1504)) e!156720))))

(declare-fun b!241503 () Bool)

(declare-fun call!22455 () Bool)

(assert (=> b!241503 (= e!156717 (not call!22455))))

(declare-fun b!241504 () Bool)

(declare-fun c!40267 () Bool)

(declare-datatypes ((SeekEntryResult!1023 0))(
  ( (MissingZero!1023 (index!6262 (_ BitVec 32))) (Found!1023 (index!6263 (_ BitVec 32))) (Intermediate!1023 (undefined!1835 Bool) (index!6264 (_ BitVec 32)) (x!24185 (_ BitVec 32))) (Undefined!1023) (MissingVacant!1023 (index!6265 (_ BitVec 32))) )
))
(declare-fun lt!121429 () SeekEntryResult!1023)

(get-info :version)

(assert (=> b!241504 (= c!40267 ((_ is MissingVacant!1023) lt!121429))))

(assert (=> b!241504 (= e!156722 e!156727)))

(declare-fun b!241505 () Bool)

(assert (=> b!241505 (= e!156727 ((_ is Undefined!1023) lt!121429))))

(declare-fun res!118386 () Bool)

(declare-fun e!156723 () Bool)

(assert (=> start!23054 (=> (not res!118386) (not e!156723))))

(declare-fun valid!1412 (LongMapFixedSize!3562) Bool)

(assert (=> start!23054 (= res!118386 (valid!1412 thiss!1504))))

(assert (=> start!23054 e!156723))

(assert (=> start!23054 e!156725))

(assert (=> start!23054 true))

(declare-fun b!241506 () Bool)

(declare-datatypes ((Unit!7410 0))(
  ( (Unit!7411) )
))
(declare-fun e!156721 () Unit!7410)

(declare-fun lt!121428 () Unit!7410)

(assert (=> b!241506 (= e!156721 lt!121428)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!342 (array!11979 array!11977 (_ BitVec 32) (_ BitVec 32) V!8113 V!8113 (_ BitVec 64) Int) Unit!7410)

(assert (=> b!241506 (= lt!121428 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!342 (_keys!6580 thiss!1504) (_values!4457 thiss!1504) (mask!10545 thiss!1504) (extraKeys!4211 thiss!1504) (zeroValue!4315 thiss!1504) (minValue!4315 thiss!1504) key!932 (defaultEntry!4474 thiss!1504)))))

(declare-fun c!40265 () Bool)

(assert (=> b!241506 (= c!40265 ((_ is MissingZero!1023) lt!121429))))

(assert (=> b!241506 e!156722))

(declare-fun b!241507 () Bool)

(declare-fun Unit!7412 () Unit!7410)

(assert (=> b!241507 (= e!156721 Unit!7412)))

(declare-fun lt!121426 () Unit!7410)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!349 (array!11979 array!11977 (_ BitVec 32) (_ BitVec 32) V!8113 V!8113 (_ BitVec 64) Int) Unit!7410)

(assert (=> b!241507 (= lt!121426 (lemmaInListMapThenSeekEntryOrOpenFindsIt!349 (_keys!6580 thiss!1504) (_values!4457 thiss!1504) (mask!10545 thiss!1504) (extraKeys!4211 thiss!1504) (zeroValue!4315 thiss!1504) (minValue!4315 thiss!1504) key!932 (defaultEntry!4474 thiss!1504)))))

(assert (=> b!241507 false))

(declare-fun b!241508 () Bool)

(declare-fun res!118389 () Bool)

(assert (=> b!241508 (=> (not res!118389) (not e!156714))))

(assert (=> b!241508 (= res!118389 (= (select (arr!5690 (_keys!6580 thiss!1504)) (index!6262 lt!121429)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241509 () Bool)

(declare-fun e!156715 () Bool)

(assert (=> b!241509 (= e!156723 e!156715)))

(declare-fun res!118388 () Bool)

(assert (=> b!241509 (=> (not res!118388) (not e!156715))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!241509 (= res!118388 (or (= lt!121429 (MissingZero!1023 index!297)) (= lt!121429 (MissingVacant!1023 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11979 (_ BitVec 32)) SeekEntryResult!1023)

(assert (=> b!241509 (= lt!121429 (seekEntryOrOpen!0 key!932 (_keys!6580 thiss!1504) (mask!10545 thiss!1504)))))

(declare-fun b!241510 () Bool)

(declare-fun e!156716 () Unit!7410)

(declare-fun Unit!7413 () Unit!7410)

(assert (=> b!241510 (= e!156716 Unit!7413)))

(declare-fun b!241511 () Bool)

(assert (=> b!241511 (= e!156714 (not call!22455))))

(declare-fun b!241512 () Bool)

(declare-fun res!118382 () Bool)

(assert (=> b!241512 (=> (not res!118382) (not e!156723))))

(assert (=> b!241512 (= res!118382 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!241513 () Bool)

(declare-fun e!156718 () Bool)

(assert (=> b!241513 (= e!156718 false)))

(declare-fun lt!121425 () Unit!7410)

(assert (=> b!241513 (= lt!121425 e!156716)))

(declare-fun c!40264 () Bool)

(declare-fun arrayContainsKey!0 (array!11979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!241513 (= c!40264 (arrayContainsKey!0 (_keys!6580 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22451 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22451 (= call!22454 (inRange!0 (ite c!40265 (index!6262 lt!121429) (index!6265 lt!121429)) (mask!10545 thiss!1504)))))

(declare-fun mapNonEmpty!10759 () Bool)

(declare-fun tp!22669 () Bool)

(declare-fun e!156719 () Bool)

(assert (=> mapNonEmpty!10759 (= mapRes!10759 (and tp!22669 e!156719))))

(declare-fun mapValue!10759 () ValueCell!2831)

(declare-fun mapRest!10759 () (Array (_ BitVec 32) ValueCell!2831))

(declare-fun mapKey!10759 () (_ BitVec 32))

(assert (=> mapNonEmpty!10759 (= (arr!5689 (_values!4457 thiss!1504)) (store mapRest!10759 mapKey!10759 mapValue!10759))))

(declare-fun bm!22452 () Bool)

(assert (=> bm!22452 (= call!22455 (arrayContainsKey!0 (_keys!6580 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241514 () Bool)

(declare-fun res!118385 () Bool)

(assert (=> b!241514 (= res!118385 (= (select (arr!5690 (_keys!6580 thiss!1504)) (index!6265 lt!121429)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241514 (=> (not res!118385) (not e!156717))))

(declare-fun b!241515 () Bool)

(assert (=> b!241515 (= e!156719 tp_is_empty!6349)))

(declare-fun b!241516 () Bool)

(assert (=> b!241516 (= e!156715 e!156718)))

(declare-fun res!118384 () Bool)

(assert (=> b!241516 (=> (not res!118384) (not e!156718))))

(assert (=> b!241516 (= res!118384 (inRange!0 index!297 (mask!10545 thiss!1504)))))

(declare-fun lt!121427 () Unit!7410)

(assert (=> b!241516 (= lt!121427 e!156721)))

(declare-fun c!40266 () Bool)

(declare-datatypes ((tuple2!4672 0))(
  ( (tuple2!4673 (_1!2347 (_ BitVec 64)) (_2!2347 V!8113)) )
))
(declare-datatypes ((List!3545 0))(
  ( (Nil!3542) (Cons!3541 (h!4198 tuple2!4672) (t!8534 List!3545)) )
))
(declare-datatypes ((ListLongMap!3587 0))(
  ( (ListLongMap!3588 (toList!1809 List!3545)) )
))
(declare-fun contains!1713 (ListLongMap!3587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1341 (array!11979 array!11977 (_ BitVec 32) (_ BitVec 32) V!8113 V!8113 (_ BitVec 32) Int) ListLongMap!3587)

(assert (=> b!241516 (= c!40266 (contains!1713 (getCurrentListMap!1341 (_keys!6580 thiss!1504) (_values!4457 thiss!1504) (mask!10545 thiss!1504) (extraKeys!4211 thiss!1504) (zeroValue!4315 thiss!1504) (minValue!4315 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4474 thiss!1504)) key!932))))

(declare-fun b!241517 () Bool)

(assert (=> b!241517 (= e!156726 tp_is_empty!6349)))

(declare-fun b!241518 () Bool)

(declare-fun Unit!7414 () Unit!7410)

(assert (=> b!241518 (= e!156716 Unit!7414)))

(declare-fun lt!121424 () Unit!7410)

(declare-fun lemmaArrayContainsKeyThenInListMap!163 (array!11979 array!11977 (_ BitVec 32) (_ BitVec 32) V!8113 V!8113 (_ BitVec 64) (_ BitVec 32) Int) Unit!7410)

(assert (=> b!241518 (= lt!121424 (lemmaArrayContainsKeyThenInListMap!163 (_keys!6580 thiss!1504) (_values!4457 thiss!1504) (mask!10545 thiss!1504) (extraKeys!4211 thiss!1504) (zeroValue!4315 thiss!1504) (minValue!4315 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4474 thiss!1504)))))

(assert (=> b!241518 false))

(assert (= (and start!23054 res!118386) b!241512))

(assert (= (and b!241512 res!118382) b!241509))

(assert (= (and b!241509 res!118388) b!241516))

(assert (= (and b!241516 c!40266) b!241507))

(assert (= (and b!241516 (not c!40266)) b!241506))

(assert (= (and b!241506 c!40265) b!241501))

(assert (= (and b!241506 (not c!40265)) b!241504))

(assert (= (and b!241501 res!118383) b!241508))

(assert (= (and b!241508 res!118389) b!241511))

(assert (= (and b!241504 c!40267) b!241500))

(assert (= (and b!241504 (not c!40267)) b!241505))

(assert (= (and b!241500 res!118387) b!241514))

(assert (= (and b!241514 res!118385) b!241503))

(assert (= (or b!241501 b!241500) bm!22451))

(assert (= (or b!241511 b!241503) bm!22452))

(assert (= (and b!241516 res!118384) b!241513))

(assert (= (and b!241513 c!40264) b!241518))

(assert (= (and b!241513 (not c!40264)) b!241510))

(assert (= (and b!241499 condMapEmpty!10759) mapIsEmpty!10759))

(assert (= (and b!241499 (not condMapEmpty!10759)) mapNonEmpty!10759))

(assert (= (and mapNonEmpty!10759 ((_ is ValueCellFull!2831) mapValue!10759)) b!241515))

(assert (= (and b!241499 ((_ is ValueCellFull!2831) mapDefault!10759)) b!241517))

(assert (= b!241502 b!241499))

(assert (= start!23054 b!241502))

(declare-fun m!260869 () Bool)

(assert (=> start!23054 m!260869))

(declare-fun m!260871 () Bool)

(assert (=> bm!22452 m!260871))

(assert (=> b!241513 m!260871))

(declare-fun m!260873 () Bool)

(assert (=> b!241514 m!260873))

(declare-fun m!260875 () Bool)

(assert (=> b!241502 m!260875))

(declare-fun m!260877 () Bool)

(assert (=> b!241502 m!260877))

(declare-fun m!260879 () Bool)

(assert (=> b!241516 m!260879))

(declare-fun m!260881 () Bool)

(assert (=> b!241516 m!260881))

(assert (=> b!241516 m!260881))

(declare-fun m!260883 () Bool)

(assert (=> b!241516 m!260883))

(declare-fun m!260885 () Bool)

(assert (=> b!241507 m!260885))

(declare-fun m!260887 () Bool)

(assert (=> b!241518 m!260887))

(declare-fun m!260889 () Bool)

(assert (=> mapNonEmpty!10759 m!260889))

(declare-fun m!260891 () Bool)

(assert (=> b!241506 m!260891))

(declare-fun m!260893 () Bool)

(assert (=> b!241509 m!260893))

(declare-fun m!260895 () Bool)

(assert (=> bm!22451 m!260895))

(declare-fun m!260897 () Bool)

(assert (=> b!241508 m!260897))

(check-sat (not mapNonEmpty!10759) (not b_next!6487) tp_is_empty!6349 b_and!13473 (not bm!22452) (not bm!22451) (not b!241502) (not b!241513) (not b!241518) (not b!241507) (not start!23054) (not b!241506) (not b!241516) (not b!241509))
(check-sat b_and!13473 (not b_next!6487))
