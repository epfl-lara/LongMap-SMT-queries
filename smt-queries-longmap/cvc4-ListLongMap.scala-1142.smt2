; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23622 () Bool)

(assert start!23622)

(declare-fun b!248399 () Bool)

(declare-fun b_free!6605 () Bool)

(declare-fun b_next!6605 () Bool)

(assert (=> b!248399 (= b_free!6605 (not b_next!6605))))

(declare-fun tp!23065 () Bool)

(declare-fun b_and!13609 () Bool)

(assert (=> b!248399 (= tp!23065 b_and!13609)))

(declare-fun res!121730 () Bool)

(declare-fun e!161107 () Bool)

(assert (=> start!23622 (=> (not res!121730) (not e!161107))))

(declare-datatypes ((V!8269 0))(
  ( (V!8270 (val!3278 Int)) )
))
(declare-datatypes ((ValueCell!2890 0))(
  ( (ValueCellFull!2890 (v!5337 V!8269)) (EmptyCell!2890) )
))
(declare-datatypes ((array!12243 0))(
  ( (array!12244 (arr!5808 (Array (_ BitVec 32) ValueCell!2890)) (size!6151 (_ BitVec 32))) )
))
(declare-datatypes ((array!12245 0))(
  ( (array!12246 (arr!5809 (Array (_ BitVec 32) (_ BitVec 64))) (size!6152 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3680 0))(
  ( (LongMapFixedSize!3681 (defaultEntry!4593 Int) (mask!10741 (_ BitVec 32)) (extraKeys!4330 (_ BitVec 32)) (zeroValue!4434 V!8269) (minValue!4434 V!8269) (_size!1889 (_ BitVec 32)) (_keys!6717 array!12245) (_values!4576 array!12243) (_vacant!1889 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3680)

(declare-fun valid!1440 (LongMapFixedSize!3680) Bool)

(assert (=> start!23622 (= res!121730 (valid!1440 thiss!1504))))

(assert (=> start!23622 e!161107))

(declare-fun e!161111 () Bool)

(assert (=> start!23622 e!161111))

(assert (=> start!23622 true))

(declare-fun b!248379 () Bool)

(declare-fun e!161117 () Bool)

(declare-fun e!161109 () Bool)

(assert (=> b!248379 (= e!161117 e!161109)))

(declare-fun res!121732 () Bool)

(assert (=> b!248379 (=> (not res!121732) (not e!161109))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!248379 (= res!121732 (inRange!0 index!297 (mask!10741 thiss!1504)))))

(declare-datatypes ((Unit!7691 0))(
  ( (Unit!7692) )
))
(declare-fun lt!124367 () Unit!7691)

(declare-fun e!161113 () Unit!7691)

(assert (=> b!248379 (= lt!124367 e!161113)))

(declare-fun c!41605 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4824 0))(
  ( (tuple2!4825 (_1!2423 (_ BitVec 64)) (_2!2423 V!8269)) )
))
(declare-datatypes ((List!3705 0))(
  ( (Nil!3702) (Cons!3701 (h!4359 tuple2!4824) (t!8730 List!3705)) )
))
(declare-datatypes ((ListLongMap!3737 0))(
  ( (ListLongMap!3738 (toList!1884 List!3705)) )
))
(declare-fun contains!1799 (ListLongMap!3737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1412 (array!12245 array!12243 (_ BitVec 32) (_ BitVec 32) V!8269 V!8269 (_ BitVec 32) Int) ListLongMap!3737)

(assert (=> b!248379 (= c!41605 (contains!1799 (getCurrentListMap!1412 (_keys!6717 thiss!1504) (_values!4576 thiss!1504) (mask!10741 thiss!1504) (extraKeys!4330 thiss!1504) (zeroValue!4434 thiss!1504) (minValue!4434 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4593 thiss!1504)) key!932))))

(declare-fun b!248380 () Bool)

(assert (=> b!248380 (= e!161107 e!161117)))

(declare-fun res!121738 () Bool)

(assert (=> b!248380 (=> (not res!121738) (not e!161117))))

(declare-datatypes ((SeekEntryResult!1111 0))(
  ( (MissingZero!1111 (index!6614 (_ BitVec 32))) (Found!1111 (index!6615 (_ BitVec 32))) (Intermediate!1111 (undefined!1923 Bool) (index!6616 (_ BitVec 32)) (x!24573 (_ BitVec 32))) (Undefined!1111) (MissingVacant!1111 (index!6617 (_ BitVec 32))) )
))
(declare-fun lt!124372 () SeekEntryResult!1111)

(assert (=> b!248380 (= res!121738 (or (= lt!124372 (MissingZero!1111 index!297)) (= lt!124372 (MissingVacant!1111 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12245 (_ BitVec 32)) SeekEntryResult!1111)

(assert (=> b!248380 (= lt!124372 (seekEntryOrOpen!0 key!932 (_keys!6717 thiss!1504) (mask!10741 thiss!1504)))))

(declare-fun mapNonEmpty!10979 () Bool)

(declare-fun mapRes!10979 () Bool)

(declare-fun tp!23066 () Bool)

(declare-fun e!161108 () Bool)

(assert (=> mapNonEmpty!10979 (= mapRes!10979 (and tp!23066 e!161108))))

(declare-fun mapValue!10979 () ValueCell!2890)

(declare-fun mapRest!10979 () (Array (_ BitVec 32) ValueCell!2890))

(declare-fun mapKey!10979 () (_ BitVec 32))

(assert (=> mapNonEmpty!10979 (= (arr!5808 (_values!4576 thiss!1504)) (store mapRest!10979 mapKey!10979 mapValue!10979))))

(declare-fun b!248381 () Bool)

(declare-fun e!161120 () Bool)

(declare-fun call!23274 () Bool)

(assert (=> b!248381 (= e!161120 (not call!23274))))

(declare-fun mapIsEmpty!10979 () Bool)

(assert (=> mapIsEmpty!10979 mapRes!10979))

(declare-fun b!248382 () Bool)

(declare-fun res!121741 () Bool)

(declare-fun e!161106 () Bool)

(assert (=> b!248382 (=> res!121741 e!161106)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!248382 (= res!121741 (not (validKeyInArray!0 key!932)))))

(declare-fun b!248383 () Bool)

(declare-datatypes ((List!3706 0))(
  ( (Nil!3703) (Cons!3702 (h!4360 (_ BitVec 64)) (t!8731 List!3706)) )
))
(declare-fun arrayNoDuplicates!0 (array!12245 (_ BitVec 32) List!3706) Bool)

(assert (=> b!248383 (= e!161106 (arrayNoDuplicates!0 (_keys!6717 thiss!1504) #b00000000000000000000000000000000 Nil!3703))))

(declare-fun b!248384 () Bool)

(declare-fun e!161118 () Unit!7691)

(declare-fun Unit!7693 () Unit!7691)

(assert (=> b!248384 (= e!161118 Unit!7693)))

(declare-fun b!248385 () Bool)

(declare-fun res!121737 () Bool)

(assert (=> b!248385 (= res!121737 (= (select (arr!5809 (_keys!6717 thiss!1504)) (index!6617 lt!124372)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!248385 (=> (not res!121737) (not e!161120))))

(declare-fun b!248386 () Bool)

(declare-fun res!121734 () Bool)

(declare-fun e!161114 () Bool)

(assert (=> b!248386 (=> (not res!121734) (not e!161114))))

(assert (=> b!248386 (= res!121734 (= (select (arr!5809 (_keys!6717 thiss!1504)) (index!6614 lt!124372)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!248387 () Bool)

(declare-fun Unit!7694 () Unit!7691)

(assert (=> b!248387 (= e!161118 Unit!7694)))

(declare-fun lt!124369 () Unit!7691)

(declare-fun lemmaArrayContainsKeyThenInListMap!193 (array!12245 array!12243 (_ BitVec 32) (_ BitVec 32) V!8269 V!8269 (_ BitVec 64) (_ BitVec 32) Int) Unit!7691)

(assert (=> b!248387 (= lt!124369 (lemmaArrayContainsKeyThenInListMap!193 (_keys!6717 thiss!1504) (_values!4576 thiss!1504) (mask!10741 thiss!1504) (extraKeys!4330 thiss!1504) (zeroValue!4434 thiss!1504) (minValue!4434 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4593 thiss!1504)))))

(assert (=> b!248387 false))

(declare-fun b!248388 () Bool)

(declare-fun res!121740 () Bool)

(assert (=> b!248388 (=> res!121740 e!161106)))

(assert (=> b!248388 (= res!121740 (or (not (= (size!6152 (_keys!6717 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10741 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6152 (_keys!6717 thiss!1504)))))))

(declare-fun b!248389 () Bool)

(declare-fun res!121736 () Bool)

(assert (=> b!248389 (=> res!121736 e!161106)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12245 (_ BitVec 32)) Bool)

(assert (=> b!248389 (= res!121736 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6717 thiss!1504) (mask!10741 thiss!1504))))))

(declare-fun b!248390 () Bool)

(declare-fun res!121739 () Bool)

(assert (=> b!248390 (=> res!121739 e!161106)))

(declare-fun lt!124366 () Bool)

(assert (=> b!248390 (= res!121739 lt!124366)))

(declare-fun bm!23270 () Bool)

(declare-fun arrayContainsKey!0 (array!12245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23270 (= call!23274 (arrayContainsKey!0 (_keys!6717 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!248391 () Bool)

(declare-fun Unit!7695 () Unit!7691)

(assert (=> b!248391 (= e!161113 Unit!7695)))

(declare-fun lt!124371 () Unit!7691)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!389 (array!12245 array!12243 (_ BitVec 32) (_ BitVec 32) V!8269 V!8269 (_ BitVec 64) Int) Unit!7691)

(assert (=> b!248391 (= lt!124371 (lemmaInListMapThenSeekEntryOrOpenFindsIt!389 (_keys!6717 thiss!1504) (_values!4576 thiss!1504) (mask!10741 thiss!1504) (extraKeys!4330 thiss!1504) (zeroValue!4434 thiss!1504) (minValue!4434 thiss!1504) key!932 (defaultEntry!4593 thiss!1504)))))

(assert (=> b!248391 false))

(declare-fun b!248392 () Bool)

(declare-fun e!161115 () Bool)

(declare-fun e!161116 () Bool)

(assert (=> b!248392 (= e!161115 (and e!161116 mapRes!10979))))

(declare-fun condMapEmpty!10979 () Bool)

(declare-fun mapDefault!10979 () ValueCell!2890)

