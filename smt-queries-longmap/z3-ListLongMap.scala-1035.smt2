; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21896 () Bool)

(assert start!21896)

(declare-fun b!221519 () Bool)

(declare-fun b_free!5959 () Bool)

(declare-fun b_next!5959 () Bool)

(assert (=> b!221519 (= b_free!5959 (not b_next!5959))))

(declare-fun tp!21019 () Bool)

(declare-fun b_and!12831 () Bool)

(assert (=> b!221519 (= tp!21019 b_and!12831)))

(declare-fun b!221509 () Bool)

(declare-fun res!108668 () Bool)

(declare-fun e!143960 () Bool)

(assert (=> b!221509 (=> (not res!108668) (not e!143960))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!221509 (= res!108668 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!221511 () Bool)

(declare-fun e!143961 () Bool)

(assert (=> b!221511 (= e!143960 e!143961)))

(declare-fun res!108661 () Bool)

(assert (=> b!221511 (=> (not res!108661) (not e!143961))))

(declare-datatypes ((SeekEntryResult!823 0))(
  ( (MissingZero!823 (index!5462 (_ BitVec 32))) (Found!823 (index!5463 (_ BitVec 32))) (Intermediate!823 (undefined!1635 Bool) (index!5464 (_ BitVec 32)) (x!23018 (_ BitVec 32))) (Undefined!823) (MissingVacant!823 (index!5465 (_ BitVec 32))) )
))
(declare-fun lt!112278 () SeekEntryResult!823)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!221511 (= res!108661 (or (= lt!112278 (MissingZero!823 index!297)) (= lt!112278 (MissingVacant!823 index!297))))))

(declare-datatypes ((V!7409 0))(
  ( (V!7410 (val!2955 Int)) )
))
(declare-datatypes ((ValueCell!2567 0))(
  ( (ValueCellFull!2567 (v!4969 V!7409)) (EmptyCell!2567) )
))
(declare-datatypes ((array!10877 0))(
  ( (array!10878 (arr!5157 (Array (_ BitVec 32) ValueCell!2567)) (size!5491 (_ BitVec 32))) )
))
(declare-datatypes ((array!10879 0))(
  ( (array!10880 (arr!5158 (Array (_ BitVec 32) (_ BitVec 64))) (size!5492 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3034 0))(
  ( (LongMapFixedSize!3035 (defaultEntry!4176 Int) (mask!9989 (_ BitVec 32)) (extraKeys!3913 (_ BitVec 32)) (zeroValue!4017 V!7409) (minValue!4017 V!7409) (_size!1566 (_ BitVec 32)) (_keys!6229 array!10879) (_values!4159 array!10877) (_vacant!1566 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3034)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10879 (_ BitVec 32)) SeekEntryResult!823)

(assert (=> b!221511 (= lt!112278 (seekEntryOrOpen!0 key!932 (_keys!6229 thiss!1504) (mask!9989 thiss!1504)))))

(declare-fun b!221512 () Bool)

(declare-datatypes ((Unit!6571 0))(
  ( (Unit!6572) )
))
(declare-fun e!143955 () Unit!6571)

(declare-fun lt!112282 () Unit!6571)

(assert (=> b!221512 (= e!143955 lt!112282)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!211 (array!10879 array!10877 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 64) Int) Unit!6571)

(assert (=> b!221512 (= lt!112282 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!211 (_keys!6229 thiss!1504) (_values!4159 thiss!1504) (mask!9989 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) key!932 (defaultEntry!4176 thiss!1504)))))

(declare-fun c!36823 () Bool)

(get-info :version)

(assert (=> b!221512 (= c!36823 ((_ is MissingZero!823) lt!112278))))

(declare-fun e!143951 () Bool)

(assert (=> b!221512 e!143951))

(declare-fun b!221513 () Bool)

(declare-fun res!108671 () Bool)

(declare-fun e!143952 () Bool)

(assert (=> b!221513 (=> (not res!108671) (not e!143952))))

(assert (=> b!221513 (= res!108671 (= (select (arr!5158 (_keys!6229 thiss!1504)) (index!5462 lt!112278)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!9901 () Bool)

(declare-fun mapRes!9901 () Bool)

(declare-fun tp!21018 () Bool)

(declare-fun e!143964 () Bool)

(assert (=> mapNonEmpty!9901 (= mapRes!9901 (and tp!21018 e!143964))))

(declare-fun mapValue!9901 () ValueCell!2567)

(declare-fun mapRest!9901 () (Array (_ BitVec 32) ValueCell!2567))

(declare-fun mapKey!9901 () (_ BitVec 32))

(assert (=> mapNonEmpty!9901 (= (arr!5157 (_values!4159 thiss!1504)) (store mapRest!9901 mapKey!9901 mapValue!9901))))

(declare-fun b!221514 () Bool)

(declare-fun e!143954 () Bool)

(declare-fun e!143963 () Bool)

(assert (=> b!221514 (= e!143954 (and e!143963 mapRes!9901))))

(declare-fun condMapEmpty!9901 () Bool)

(declare-fun mapDefault!9901 () ValueCell!2567)

(assert (=> b!221514 (= condMapEmpty!9901 (= (arr!5157 (_values!4159 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2567)) mapDefault!9901)))))

(declare-fun b!221515 () Bool)

(declare-fun res!108673 () Bool)

(declare-fun e!143953 () Bool)

(assert (=> b!221515 (=> (not res!108673) (not e!143953))))

(declare-fun e!143958 () Bool)

(assert (=> b!221515 (= res!108673 e!143958)))

(declare-fun res!108666 () Bool)

(assert (=> b!221515 (=> res!108666 e!143958)))

(declare-fun e!143957 () Bool)

(assert (=> b!221515 (= res!108666 e!143957)))

(declare-fun res!108665 () Bool)

(assert (=> b!221515 (=> (not res!108665) (not e!143957))))

(assert (=> b!221515 (= res!108665 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!221516 () Bool)

(declare-fun res!108659 () Bool)

(assert (=> b!221516 (=> (not res!108659) (not e!143953))))

(declare-datatypes ((List!3268 0))(
  ( (Nil!3265) (Cons!3264 (h!3912 (_ BitVec 64)) (t!8218 List!3268)) )
))
(declare-fun noDuplicate!63 (List!3268) Bool)

(assert (=> b!221516 (= res!108659 (noDuplicate!63 Nil!3265))))

(declare-fun b!221517 () Bool)

(declare-fun c!36826 () Bool)

(assert (=> b!221517 (= c!36826 ((_ is MissingVacant!823) lt!112278))))

(declare-fun e!143956 () Bool)

(assert (=> b!221517 (= e!143951 e!143956)))

(declare-fun b!221518 () Bool)

(declare-fun call!20688 () Bool)

(assert (=> b!221518 (= e!143952 (not call!20688))))

(declare-fun tp_is_empty!5821 () Bool)

(declare-fun e!143950 () Bool)

(declare-fun array_inv!3401 (array!10879) Bool)

(declare-fun array_inv!3402 (array!10877) Bool)

(assert (=> b!221519 (= e!143950 (and tp!21019 tp_is_empty!5821 (array_inv!3401 (_keys!6229 thiss!1504)) (array_inv!3402 (_values!4159 thiss!1504)) e!143954))))

(declare-fun b!221520 () Bool)

(declare-fun res!108663 () Bool)

(assert (=> b!221520 (= res!108663 (= (select (arr!5158 (_keys!6229 thiss!1504)) (index!5465 lt!112278)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!143962 () Bool)

(assert (=> b!221520 (=> (not res!108663) (not e!143962))))

(declare-fun b!221521 () Bool)

(declare-fun Unit!6573 () Unit!6571)

(assert (=> b!221521 (= e!143955 Unit!6573)))

(declare-fun lt!112277 () Unit!6571)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!211 (array!10879 array!10877 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 64) Int) Unit!6571)

(assert (=> b!221521 (= lt!112277 (lemmaInListMapThenSeekEntryOrOpenFindsIt!211 (_keys!6229 thiss!1504) (_values!4159 thiss!1504) (mask!9989 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) key!932 (defaultEntry!4176 thiss!1504)))))

(assert (=> b!221521 false))

(declare-fun b!221522 () Bool)

(assert (=> b!221522 (= e!143956 ((_ is Undefined!823) lt!112278))))

(declare-fun b!221523 () Bool)

(declare-fun e!143947 () Unit!6571)

(declare-fun Unit!6574 () Unit!6571)

(assert (=> b!221523 (= e!143947 Unit!6574)))

(declare-fun b!221524 () Bool)

(assert (=> b!221524 (= e!143962 (not call!20688))))

(declare-fun b!221525 () Bool)

(declare-fun Unit!6575 () Unit!6571)

(assert (=> b!221525 (= e!143947 Unit!6575)))

(declare-fun lt!112276 () Unit!6571)

(declare-fun lemmaArrayContainsKeyThenInListMap!52 (array!10879 array!10877 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 64) (_ BitVec 32) Int) Unit!6571)

(assert (=> b!221525 (= lt!112276 (lemmaArrayContainsKeyThenInListMap!52 (_keys!6229 thiss!1504) (_values!4159 thiss!1504) (mask!9989 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4176 thiss!1504)))))

(assert (=> b!221525 false))

(declare-fun b!221526 () Bool)

(declare-fun contains!1484 (List!3268 (_ BitVec 64)) Bool)

(assert (=> b!221526 (= e!143957 (contains!1484 Nil!3265 key!932))))

(declare-fun b!221527 () Bool)

(declare-fun res!108669 () Bool)

(assert (=> b!221527 (=> (not res!108669) (not e!143952))))

(declare-fun call!20687 () Bool)

(assert (=> b!221527 (= res!108669 call!20687)))

(assert (=> b!221527 (= e!143951 e!143952)))

(declare-fun b!221528 () Bool)

(assert (=> b!221528 (= e!143956 e!143962)))

(declare-fun res!108667 () Bool)

(assert (=> b!221528 (= res!108667 call!20687)))

(assert (=> b!221528 (=> (not res!108667) (not e!143962))))

(declare-fun b!221510 () Bool)

(declare-fun e!143948 () Bool)

(assert (=> b!221510 (= e!143958 e!143948)))

(declare-fun res!108662 () Bool)

(assert (=> b!221510 (=> (not res!108662) (not e!143948))))

(assert (=> b!221510 (= res!108662 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun res!108660 () Bool)

(assert (=> start!21896 (=> (not res!108660) (not e!143960))))

(declare-fun valid!1237 (LongMapFixedSize!3034) Bool)

(assert (=> start!21896 (= res!108660 (valid!1237 thiss!1504))))

(assert (=> start!21896 e!143960))

(assert (=> start!21896 e!143950))

(assert (=> start!21896 true))

(declare-fun b!221529 () Bool)

(assert (=> b!221529 (= e!143964 tp_is_empty!5821)))

(declare-fun b!221530 () Bool)

(declare-fun e!143959 () Bool)

(assert (=> b!221530 (= e!143959 e!143953)))

(declare-fun res!108664 () Bool)

(assert (=> b!221530 (=> (not res!108664) (not e!143953))))

(assert (=> b!221530 (= res!108664 (and (bvslt (size!5492 (_keys!6229 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5492 (_keys!6229 thiss!1504)))))))

(declare-fun lt!112280 () Unit!6571)

(assert (=> b!221530 (= lt!112280 e!143947)))

(declare-fun c!36824 () Bool)

(declare-fun arrayContainsKey!0 (array!10879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!221530 (= c!36824 (arrayContainsKey!0 (_keys!6229 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!20684 () Bool)

(assert (=> bm!20684 (= call!20688 (arrayContainsKey!0 (_keys!6229 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!221531 () Bool)

(assert (=> b!221531 (= e!143963 tp_is_empty!5821)))

(declare-fun mapIsEmpty!9901 () Bool)

(assert (=> mapIsEmpty!9901 mapRes!9901))

(declare-fun b!221532 () Bool)

(declare-fun res!108674 () Bool)

(assert (=> b!221532 (=> (not res!108674) (not e!143953))))

(assert (=> b!221532 (= res!108674 (not (contains!1484 Nil!3265 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!20685 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20685 (= call!20687 (inRange!0 (ite c!36823 (index!5462 lt!112278) (index!5465 lt!112278)) (mask!9989 thiss!1504)))))

(declare-fun b!221533 () Bool)

(assert (=> b!221533 (= e!143961 e!143959)))

(declare-fun res!108672 () Bool)

(assert (=> b!221533 (=> (not res!108672) (not e!143959))))

(assert (=> b!221533 (= res!108672 (inRange!0 index!297 (mask!9989 thiss!1504)))))

(declare-fun lt!112279 () Unit!6571)

(assert (=> b!221533 (= lt!112279 e!143955)))

(declare-fun c!36825 () Bool)

(declare-datatypes ((tuple2!4348 0))(
  ( (tuple2!4349 (_1!2185 (_ BitVec 64)) (_2!2185 V!7409)) )
))
(declare-datatypes ((List!3269 0))(
  ( (Nil!3266) (Cons!3265 (h!3913 tuple2!4348) (t!8219 List!3269)) )
))
(declare-datatypes ((ListLongMap!3251 0))(
  ( (ListLongMap!3252 (toList!1641 List!3269)) )
))
(declare-fun contains!1485 (ListLongMap!3251 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1150 (array!10879 array!10877 (_ BitVec 32) (_ BitVec 32) V!7409 V!7409 (_ BitVec 32) Int) ListLongMap!3251)

(assert (=> b!221533 (= c!36825 (contains!1485 (getCurrentListMap!1150 (_keys!6229 thiss!1504) (_values!4159 thiss!1504) (mask!9989 thiss!1504) (extraKeys!3913 thiss!1504) (zeroValue!4017 thiss!1504) (minValue!4017 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4176 thiss!1504)) key!932))))

(declare-fun b!221534 () Bool)

(assert (=> b!221534 (= e!143948 (not (contains!1484 Nil!3265 key!932)))))

(declare-fun b!221535 () Bool)

(declare-fun res!108670 () Bool)

(assert (=> b!221535 (=> (not res!108670) (not e!143953))))

(assert (=> b!221535 (= res!108670 (not (contains!1484 Nil!3265 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!221536 () Bool)

(assert (=> b!221536 (= e!143953 false)))

(declare-fun lt!112281 () Bool)

(declare-fun arrayNoDuplicates!0 (array!10879 (_ BitVec 32) List!3268) Bool)

(assert (=> b!221536 (= lt!112281 (arrayNoDuplicates!0 (_keys!6229 thiss!1504) #b00000000000000000000000000000000 Nil!3265))))

(assert (= (and start!21896 res!108660) b!221509))

(assert (= (and b!221509 res!108668) b!221511))

(assert (= (and b!221511 res!108661) b!221533))

(assert (= (and b!221533 c!36825) b!221521))

(assert (= (and b!221533 (not c!36825)) b!221512))

(assert (= (and b!221512 c!36823) b!221527))

(assert (= (and b!221512 (not c!36823)) b!221517))

(assert (= (and b!221527 res!108669) b!221513))

(assert (= (and b!221513 res!108671) b!221518))

(assert (= (and b!221517 c!36826) b!221528))

(assert (= (and b!221517 (not c!36826)) b!221522))

(assert (= (and b!221528 res!108667) b!221520))

(assert (= (and b!221520 res!108663) b!221524))

(assert (= (or b!221527 b!221528) bm!20685))

(assert (= (or b!221518 b!221524) bm!20684))

(assert (= (and b!221533 res!108672) b!221530))

(assert (= (and b!221530 c!36824) b!221525))

(assert (= (and b!221530 (not c!36824)) b!221523))

(assert (= (and b!221530 res!108664) b!221516))

(assert (= (and b!221516 res!108659) b!221532))

(assert (= (and b!221532 res!108674) b!221535))

(assert (= (and b!221535 res!108670) b!221515))

(assert (= (and b!221515 res!108665) b!221526))

(assert (= (and b!221515 (not res!108666)) b!221510))

(assert (= (and b!221510 res!108662) b!221534))

(assert (= (and b!221515 res!108673) b!221536))

(assert (= (and b!221514 condMapEmpty!9901) mapIsEmpty!9901))

(assert (= (and b!221514 (not condMapEmpty!9901)) mapNonEmpty!9901))

(assert (= (and mapNonEmpty!9901 ((_ is ValueCellFull!2567) mapValue!9901)) b!221529))

(assert (= (and b!221514 ((_ is ValueCellFull!2567) mapDefault!9901)) b!221531))

(assert (= b!221519 b!221514))

(assert (= start!21896 b!221519))

(declare-fun m!245569 () Bool)

(assert (=> b!221535 m!245569))

(declare-fun m!245571 () Bool)

(assert (=> b!221521 m!245571))

(declare-fun m!245573 () Bool)

(assert (=> b!221511 m!245573))

(declare-fun m!245575 () Bool)

(assert (=> b!221536 m!245575))

(declare-fun m!245577 () Bool)

(assert (=> b!221512 m!245577))

(declare-fun m!245579 () Bool)

(assert (=> b!221519 m!245579))

(declare-fun m!245581 () Bool)

(assert (=> b!221519 m!245581))

(declare-fun m!245583 () Bool)

(assert (=> bm!20685 m!245583))

(declare-fun m!245585 () Bool)

(assert (=> start!21896 m!245585))

(declare-fun m!245587 () Bool)

(assert (=> b!221525 m!245587))

(declare-fun m!245589 () Bool)

(assert (=> b!221516 m!245589))

(declare-fun m!245591 () Bool)

(assert (=> b!221532 m!245591))

(declare-fun m!245593 () Bool)

(assert (=> b!221533 m!245593))

(declare-fun m!245595 () Bool)

(assert (=> b!221533 m!245595))

(assert (=> b!221533 m!245595))

(declare-fun m!245597 () Bool)

(assert (=> b!221533 m!245597))

(declare-fun m!245599 () Bool)

(assert (=> b!221530 m!245599))

(declare-fun m!245601 () Bool)

(assert (=> b!221526 m!245601))

(declare-fun m!245603 () Bool)

(assert (=> b!221520 m!245603))

(assert (=> bm!20684 m!245599))

(declare-fun m!245605 () Bool)

(assert (=> b!221513 m!245605))

(declare-fun m!245607 () Bool)

(assert (=> mapNonEmpty!9901 m!245607))

(assert (=> b!221534 m!245601))

(check-sat (not b!221519) (not mapNonEmpty!9901) (not b!221516) (not start!21896) (not b!221534) (not b!221512) (not b!221530) (not b!221535) (not b!221525) (not bm!20685) (not b!221511) tp_is_empty!5821 (not b!221532) (not bm!20684) (not b_next!5959) (not b!221536) b_and!12831 (not b!221526) (not b!221521) (not b!221533))
(check-sat b_and!12831 (not b_next!5959))
