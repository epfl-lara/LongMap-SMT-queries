; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22010 () Bool)

(assert start!22010)

(declare-fun b!226563 () Bool)

(declare-fun b_free!6077 () Bool)

(declare-fun b_next!6077 () Bool)

(assert (=> b!226563 (= b_free!6077 (not b_next!6077))))

(declare-fun tp!21372 () Bool)

(declare-fun b_and!12975 () Bool)

(assert (=> b!226563 (= tp!21372 b_and!12975)))

(declare-fun b!226552 () Bool)

(declare-datatypes ((Unit!6855 0))(
  ( (Unit!6856) )
))
(declare-fun e!146986 () Unit!6855)

(declare-fun Unit!6857 () Unit!6855)

(assert (=> b!226552 (= e!146986 Unit!6857)))

(declare-fun lt!114044 () Unit!6855)

(declare-datatypes ((V!7565 0))(
  ( (V!7566 (val!3014 Int)) )
))
(declare-datatypes ((ValueCell!2626 0))(
  ( (ValueCellFull!2626 (v!5034 V!7565)) (EmptyCell!2626) )
))
(declare-datatypes ((array!11121 0))(
  ( (array!11122 (arr!5280 (Array (_ BitVec 32) ValueCell!2626)) (size!5613 (_ BitVec 32))) )
))
(declare-datatypes ((array!11123 0))(
  ( (array!11124 (arr!5281 (Array (_ BitVec 32) (_ BitVec 64))) (size!5614 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3152 0))(
  ( (LongMapFixedSize!3153 (defaultEntry!4235 Int) (mask!10087 (_ BitVec 32)) (extraKeys!3972 (_ BitVec 32)) (zeroValue!4076 V!7565) (minValue!4076 V!7565) (_size!1625 (_ BitVec 32)) (_keys!6289 array!11123) (_values!4218 array!11121) (_vacant!1625 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3152)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!96 (array!11123 array!11121 (_ BitVec 32) (_ BitVec 32) V!7565 V!7565 (_ BitVec 64) (_ BitVec 32) Int) Unit!6855)

(assert (=> b!226552 (= lt!114044 (lemmaArrayContainsKeyThenInListMap!96 (_keys!6289 thiss!1504) (_values!4218 thiss!1504) (mask!10087 thiss!1504) (extraKeys!3972 thiss!1504) (zeroValue!4076 thiss!1504) (minValue!4076 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4235 thiss!1504)))))

(assert (=> b!226552 false))

(declare-fun b!226553 () Bool)

(declare-fun res!111529 () Bool)

(declare-fun e!146992 () Bool)

(assert (=> b!226553 (=> (not res!111529) (not e!146992))))

(assert (=> b!226553 (= res!111529 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226554 () Bool)

(declare-fun e!146988 () Bool)

(declare-fun e!146999 () Bool)

(assert (=> b!226554 (= e!146988 e!146999)))

(declare-fun res!111533 () Bool)

(declare-fun call!21066 () Bool)

(assert (=> b!226554 (= res!111533 call!21066)))

(assert (=> b!226554 (=> (not res!111533) (not e!146999))))

(declare-fun b!226555 () Bool)

(declare-fun res!111537 () Bool)

(declare-fun e!146990 () Bool)

(assert (=> b!226555 (=> res!111537 e!146990)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11123 (_ BitVec 32)) Bool)

(assert (=> b!226555 (= res!111537 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6289 thiss!1504) (mask!10087 thiss!1504))))))

(declare-fun b!226556 () Bool)

(declare-fun res!111531 () Bool)

(declare-datatypes ((SeekEntryResult!884 0))(
  ( (MissingZero!884 (index!5706 (_ BitVec 32))) (Found!884 (index!5707 (_ BitVec 32))) (Intermediate!884 (undefined!1696 Bool) (index!5708 (_ BitVec 32)) (x!23232 (_ BitVec 32))) (Undefined!884) (MissingVacant!884 (index!5709 (_ BitVec 32))) )
))
(declare-fun lt!114035 () SeekEntryResult!884)

(assert (=> b!226556 (= res!111531 (= (select (arr!5281 (_keys!6289 thiss!1504)) (index!5709 lt!114035)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226556 (=> (not res!111531) (not e!146999))))

(declare-fun c!37557 () Bool)

(declare-fun bm!21062 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21062 (= call!21066 (inRange!0 (ite c!37557 (index!5706 lt!114035) (index!5709 lt!114035)) (mask!10087 thiss!1504)))))

(declare-fun b!226557 () Bool)

(declare-fun e!146991 () Unit!6855)

(declare-fun lt!114040 () Unit!6855)

(assert (=> b!226557 (= e!146991 lt!114040)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!270 (array!11123 array!11121 (_ BitVec 32) (_ BitVec 32) V!7565 V!7565 (_ BitVec 64) Int) Unit!6855)

(assert (=> b!226557 (= lt!114040 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!270 (_keys!6289 thiss!1504) (_values!4218 thiss!1504) (mask!10087 thiss!1504) (extraKeys!3972 thiss!1504) (zeroValue!4076 thiss!1504) (minValue!4076 thiss!1504) key!932 (defaultEntry!4235 thiss!1504)))))

(assert (=> b!226557 (= c!37557 (is-MissingZero!884 lt!114035))))

(declare-fun e!146994 () Bool)

(assert (=> b!226557 e!146994))

(declare-fun b!226558 () Bool)

(declare-fun res!111534 () Bool)

(declare-fun e!146996 () Bool)

(assert (=> b!226558 (=> (not res!111534) (not e!146996))))

(assert (=> b!226558 (= res!111534 (= (select (arr!5281 (_keys!6289 thiss!1504)) (index!5706 lt!114035)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226559 () Bool)

(declare-fun e!146993 () Bool)

(declare-fun e!146989 () Bool)

(declare-fun mapRes!10078 () Bool)

(assert (=> b!226559 (= e!146993 (and e!146989 mapRes!10078))))

(declare-fun condMapEmpty!10078 () Bool)

(declare-fun mapDefault!10078 () ValueCell!2626)

