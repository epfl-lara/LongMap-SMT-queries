; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23146 () Bool)

(assert start!23146)

(declare-fun b!242677 () Bool)

(declare-fun b_free!6511 () Bool)

(declare-fun b_next!6511 () Bool)

(assert (=> b!242677 (= b_free!6511 (not b_next!6511))))

(declare-fun tp!22750 () Bool)

(declare-fun b_and!13489 () Bool)

(assert (=> b!242677 (= tp!22750 b_and!13489)))

(declare-fun e!157512 () Bool)

(declare-fun e!157502 () Bool)

(declare-datatypes ((V!8145 0))(
  ( (V!8146 (val!3231 Int)) )
))
(declare-datatypes ((ValueCell!2843 0))(
  ( (ValueCellFull!2843 (v!5274 V!8145)) (EmptyCell!2843) )
))
(declare-datatypes ((array!12033 0))(
  ( (array!12034 (arr!5714 (Array (_ BitVec 32) ValueCell!2843)) (size!6056 (_ BitVec 32))) )
))
(declare-datatypes ((array!12035 0))(
  ( (array!12036 (arr!5715 (Array (_ BitVec 32) (_ BitVec 64))) (size!6057 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3586 0))(
  ( (LongMapFixedSize!3587 (defaultEntry!4498 Int) (mask!10583 (_ BitVec 32)) (extraKeys!4235 (_ BitVec 32)) (zeroValue!4339 V!8145) (minValue!4339 V!8145) (_size!1842 (_ BitVec 32)) (_keys!6607 array!12035) (_values!4481 array!12033) (_vacant!1842 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3586)

(declare-fun tp_is_empty!6373 () Bool)

(declare-fun array_inv!3781 (array!12035) Bool)

(declare-fun array_inv!3782 (array!12033) Bool)

(assert (=> b!242677 (= e!157512 (and tp!22750 tp_is_empty!6373 (array_inv!3781 (_keys!6607 thiss!1504)) (array_inv!3782 (_values!4481 thiss!1504)) e!157502))))

(declare-fun b!242678 () Bool)

(declare-fun res!118919 () Bool)

(declare-fun e!157510 () Bool)

(assert (=> b!242678 (=> (not res!118919) (not e!157510))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!242678 (= res!118919 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!242679 () Bool)

(declare-datatypes ((Unit!7484 0))(
  ( (Unit!7485) )
))
(declare-fun e!157509 () Unit!7484)

(declare-fun lt!121894 () Unit!7484)

(assert (=> b!242679 (= e!157509 lt!121894)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!365 (array!12035 array!12033 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) Int) Unit!7484)

(assert (=> b!242679 (= lt!121894 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!365 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 (defaultEntry!4498 thiss!1504)))))

(declare-fun c!40505 () Bool)

(declare-datatypes ((SeekEntryResult!1066 0))(
  ( (MissingZero!1066 (index!6434 (_ BitVec 32))) (Found!1066 (index!6435 (_ BitVec 32))) (Intermediate!1066 (undefined!1878 Bool) (index!6436 (_ BitVec 32)) (x!24290 (_ BitVec 32))) (Undefined!1066) (MissingVacant!1066 (index!6437 (_ BitVec 32))) )
))
(declare-fun lt!121895 () SeekEntryResult!1066)

(assert (=> b!242679 (= c!40505 (is-MissingZero!1066 lt!121895))))

(declare-fun e!157504 () Bool)

(assert (=> b!242679 e!157504))

(declare-fun b!242680 () Bool)

(declare-fun e!157513 () Bool)

(declare-datatypes ((List!3637 0))(
  ( (Nil!3634) (Cons!3633 (h!4290 (_ BitVec 64)) (t!8640 List!3637)) )
))
(declare-fun contains!1745 (List!3637 (_ BitVec 64)) Bool)

(assert (=> b!242680 (= e!157513 (contains!1745 Nil!3634 key!932))))

(declare-fun b!242681 () Bool)

(declare-fun e!157514 () Bool)

(assert (=> b!242681 (= e!157514 e!157513)))

(declare-fun res!118909 () Bool)

(assert (=> b!242681 (=> res!118909 e!157513)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!242681 (= res!118909 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!242682 () Bool)

(declare-fun e!157507 () Bool)

(assert (=> b!242682 (= e!157510 e!157507)))

(declare-fun res!118914 () Bool)

(assert (=> b!242682 (=> (not res!118914) (not e!157507))))

(assert (=> b!242682 (= res!118914 (or (= lt!121895 (MissingZero!1066 index!297)) (= lt!121895 (MissingVacant!1066 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12035 (_ BitVec 32)) SeekEntryResult!1066)

(assert (=> b!242682 (= lt!121895 (seekEntryOrOpen!0 key!932 (_keys!6607 thiss!1504) (mask!10583 thiss!1504)))))

(declare-fun b!242683 () Bool)

(declare-fun res!118916 () Bool)

(assert (=> b!242683 (=> (not res!118916) (not e!157514))))

(declare-fun noDuplicate!91 (List!3637) Bool)

(assert (=> b!242683 (= res!118916 (noDuplicate!91 Nil!3634))))

(declare-fun b!242684 () Bool)

(declare-fun e!157511 () Unit!7484)

(declare-fun Unit!7486 () Unit!7484)

(assert (=> b!242684 (= e!157511 Unit!7486)))

(declare-fun lt!121896 () Unit!7484)

(declare-fun lemmaArrayContainsKeyThenInListMap!160 (array!12035 array!12033 (_ BitVec 32) (_ BitVec 32) V!8145 V!8145 (_ BitVec 64) (_ BitVec 32) Int) Unit!7484)

(assert (=> b!242684 (= lt!121896 (lemmaArrayContainsKeyThenInListMap!160 (_keys!6607 thiss!1504) (_values!4481 thiss!1504) (mask!10583 thiss!1504) (extraKeys!4235 thiss!1504) (zeroValue!4339 thiss!1504) (minValue!4339 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4498 thiss!1504)))))

(assert (=> b!242684 false))

(declare-fun bm!22616 () Bool)

(declare-fun call!22620 () Bool)

(declare-fun arrayContainsKey!0 (array!12035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22616 (= call!22620 (arrayContainsKey!0 (_keys!6607 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!242685 () Bool)

(declare-fun e!157515 () Bool)

(declare-fun mapRes!10804 () Bool)

(assert (=> b!242685 (= e!157502 (and e!157515 mapRes!10804))))

(declare-fun condMapEmpty!10804 () Bool)

(declare-fun mapDefault!10804 () ValueCell!2843)

