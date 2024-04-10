; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24096 () Bool)

(assert start!24096)

(declare-fun b!251998 () Bool)

(declare-fun b_free!6643 () Bool)

(declare-fun b_next!6643 () Bool)

(assert (=> b!251998 (= b_free!6643 (not b_next!6643))))

(declare-fun tp!23204 () Bool)

(declare-fun b_and!13677 () Bool)

(assert (=> b!251998 (= tp!23204 b_and!13677)))

(declare-fun b!251985 () Bool)

(declare-fun e!163414 () Bool)

(declare-datatypes ((V!8321 0))(
  ( (V!8322 (val!3297 Int)) )
))
(declare-datatypes ((ValueCell!2909 0))(
  ( (ValueCellFull!2909 (v!5367 V!8321)) (EmptyCell!2909) )
))
(declare-datatypes ((array!12333 0))(
  ( (array!12334 (arr!5846 (Array (_ BitVec 32) ValueCell!2909)) (size!6193 (_ BitVec 32))) )
))
(declare-datatypes ((array!12335 0))(
  ( (array!12336 (arr!5847 (Array (_ BitVec 32) (_ BitVec 64))) (size!6194 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3718 0))(
  ( (LongMapFixedSize!3719 (defaultEntry!4656 Int) (mask!10868 (_ BitVec 32)) (extraKeys!4393 (_ BitVec 32)) (zeroValue!4497 V!8321) (minValue!4497 V!8321) (_size!1908 (_ BitVec 32)) (_keys!6802 array!12335) (_values!4639 array!12333) (_vacant!1908 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3718)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12335 (_ BitVec 32)) Bool)

(assert (=> b!251985 (= e!163414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6802 thiss!1504) (mask!10868 thiss!1504)))))

(declare-fun b!251987 () Bool)

(declare-datatypes ((Unit!7796 0))(
  ( (Unit!7797) )
))
(declare-fun e!163415 () Unit!7796)

(declare-fun lt!126302 () Unit!7796)

(assert (=> b!251987 (= e!163415 lt!126302)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!407 (array!12335 array!12333 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) Int) Unit!7796)

(assert (=> b!251987 (= lt!126302 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!407 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 (defaultEntry!4656 thiss!1504)))))

(declare-fun c!42441 () Bool)

(declare-datatypes ((SeekEntryResult!1129 0))(
  ( (MissingZero!1129 (index!6686 (_ BitVec 32))) (Found!1129 (index!6687 (_ BitVec 32))) (Intermediate!1129 (undefined!1941 Bool) (index!6688 (_ BitVec 32)) (x!24749 (_ BitVec 32))) (Undefined!1129) (MissingVacant!1129 (index!6689 (_ BitVec 32))) )
))
(declare-fun lt!126300 () SeekEntryResult!1129)

(assert (=> b!251987 (= c!42441 (is-MissingZero!1129 lt!126300))))

(declare-fun e!163412 () Bool)

(assert (=> b!251987 e!163412))

(declare-fun b!251988 () Bool)

(declare-fun res!123359 () Bool)

(declare-fun e!163413 () Bool)

(assert (=> b!251988 (=> (not res!123359) (not e!163413))))

(assert (=> b!251988 (= res!123359 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!251989 () Bool)

(declare-fun e!163408 () Bool)

(declare-fun e!163416 () Bool)

(assert (=> b!251989 (= e!163408 e!163416)))

(declare-fun res!123362 () Bool)

(declare-fun call!23719 () Bool)

(assert (=> b!251989 (= res!123362 call!23719)))

(assert (=> b!251989 (=> (not res!123362) (not e!163416))))

(declare-fun b!251990 () Bool)

(declare-fun res!123358 () Bool)

(assert (=> b!251990 (=> res!123358 e!163414)))

(assert (=> b!251990 (= res!123358 (or (not (= (size!6193 (_values!4639 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10868 thiss!1504)))) (not (= (size!6194 (_keys!6802 thiss!1504)) (size!6193 (_values!4639 thiss!1504)))) (bvslt (mask!10868 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4393 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4393 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!251991 () Bool)

(declare-fun e!163404 () Bool)

(declare-fun tp_is_empty!6505 () Bool)

(assert (=> b!251991 (= e!163404 tp_is_empty!6505)))

(declare-fun b!251992 () Bool)

(declare-fun res!123363 () Bool)

(assert (=> b!251992 (= res!123363 (= (select (arr!5847 (_keys!6802 thiss!1504)) (index!6689 lt!126300)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!251992 (=> (not res!123363) (not e!163416))))

(declare-fun b!251993 () Bool)

(assert (=> b!251993 (= e!163408 (is-Undefined!1129 lt!126300))))

(declare-fun b!251994 () Bool)

(declare-fun e!163418 () Unit!7796)

(declare-fun Unit!7798 () Unit!7796)

(assert (=> b!251994 (= e!163418 Unit!7798)))

(declare-fun lt!126304 () Unit!7796)

(declare-fun lemmaArrayContainsKeyThenInListMap!207 (array!12335 array!12333 (_ BitVec 32) (_ BitVec 32) V!8321 V!8321 (_ BitVec 64) (_ BitVec 32) Int) Unit!7796)

(assert (=> b!251994 (= lt!126304 (lemmaArrayContainsKeyThenInListMap!207 (_keys!6802 thiss!1504) (_values!4639 thiss!1504) (mask!10868 thiss!1504) (extraKeys!4393 thiss!1504) (zeroValue!4497 thiss!1504) (minValue!4497 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4656 thiss!1504)))))

(assert (=> b!251994 false))

(declare-fun b!251995 () Bool)

(declare-fun c!42442 () Bool)

(assert (=> b!251995 (= c!42442 (is-MissingVacant!1129 lt!126300))))

(assert (=> b!251995 (= e!163412 e!163408)))

(declare-fun b!251996 () Bool)

(declare-fun e!163417 () Bool)

(declare-fun call!23720 () Bool)

(assert (=> b!251996 (= e!163417 (not call!23720))))

(declare-fun res!123364 () Bool)

(assert (=> start!24096 (=> (not res!123364) (not e!163413))))

(declare-fun valid!1454 (LongMapFixedSize!3718) Bool)

(assert (=> start!24096 (= res!123364 (valid!1454 thiss!1504))))

(assert (=> start!24096 e!163413))

(declare-fun e!163410 () Bool)

(assert (=> start!24096 e!163410))

(assert (=> start!24096 true))

(declare-fun b!251986 () Bool)

(assert (=> b!251986 (= e!163416 (not call!23720))))

(declare-fun b!251997 () Bool)

(declare-fun res!123357 () Bool)

(assert (=> b!251997 (=> (not res!123357) (not e!163417))))

(assert (=> b!251997 (= res!123357 call!23719)))

(assert (=> b!251997 (= e!163412 e!163417)))

(declare-fun mapNonEmpty!11061 () Bool)

(declare-fun mapRes!11061 () Bool)

(declare-fun tp!23205 () Bool)

(declare-fun e!163411 () Bool)

(assert (=> mapNonEmpty!11061 (= mapRes!11061 (and tp!23205 e!163411))))

(declare-fun mapRest!11061 () (Array (_ BitVec 32) ValueCell!2909))

(declare-fun mapKey!11061 () (_ BitVec 32))

(declare-fun mapValue!11061 () ValueCell!2909)

(assert (=> mapNonEmpty!11061 (= (arr!5846 (_values!4639 thiss!1504)) (store mapRest!11061 mapKey!11061 mapValue!11061))))

(declare-fun e!163406 () Bool)

(declare-fun array_inv!3863 (array!12335) Bool)

(declare-fun array_inv!3864 (array!12333) Bool)

(assert (=> b!251998 (= e!163410 (and tp!23204 tp_is_empty!6505 (array_inv!3863 (_keys!6802 thiss!1504)) (array_inv!3864 (_values!4639 thiss!1504)) e!163406))))

(declare-fun b!251999 () Bool)

(assert (=> b!251999 (= e!163406 (and e!163404 mapRes!11061))))

(declare-fun condMapEmpty!11061 () Bool)

(declare-fun mapDefault!11061 () ValueCell!2909)

