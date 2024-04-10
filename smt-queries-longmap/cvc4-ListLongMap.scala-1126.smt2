; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23118 () Bool)

(assert start!23118)

(declare-fun b!242444 () Bool)

(declare-fun b_free!6509 () Bool)

(declare-fun b_next!6509 () Bool)

(assert (=> b!242444 (= b_free!6509 (not b_next!6509))))

(declare-fun tp!22741 () Bool)

(declare-fun b_and!13485 () Bool)

(assert (=> b!242444 (= tp!22741 b_and!13485)))

(declare-fun b!242441 () Bool)

(declare-fun e!157363 () Bool)

(declare-datatypes ((List!3636 0))(
  ( (Nil!3633) (Cons!3632 (h!4289 (_ BitVec 64)) (t!8637 List!3636)) )
))
(declare-fun contains!1744 (List!3636 (_ BitVec 64)) Bool)

(assert (=> b!242441 (= e!157363 (contains!1744 Nil!3633 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242442 () Bool)

(declare-fun res!118790 () Bool)

(declare-fun e!157356 () Bool)

(assert (=> b!242442 (=> (not res!118790) (not e!157356))))

(declare-fun call!22587 () Bool)

(assert (=> b!242442 (= res!118790 call!22587)))

(declare-fun e!157366 () Bool)

(assert (=> b!242442 (= e!157366 e!157356)))

(declare-fun b!242443 () Bool)

(declare-fun res!118791 () Bool)

(declare-fun e!157360 () Bool)

(assert (=> b!242443 (=> (not res!118791) (not e!157360))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!242443 (= res!118791 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun tp_is_empty!6371 () Bool)

(declare-fun e!157352 () Bool)

(declare-fun e!157365 () Bool)

(declare-datatypes ((V!8141 0))(
  ( (V!8142 (val!3230 Int)) )
))
(declare-datatypes ((ValueCell!2842 0))(
  ( (ValueCellFull!2842 (v!5271 V!8141)) (EmptyCell!2842) )
))
(declare-datatypes ((array!12027 0))(
  ( (array!12028 (arr!5712 (Array (_ BitVec 32) ValueCell!2842)) (size!6054 (_ BitVec 32))) )
))
(declare-datatypes ((array!12029 0))(
  ( (array!12030 (arr!5713 (Array (_ BitVec 32) (_ BitVec 64))) (size!6055 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3584 0))(
  ( (LongMapFixedSize!3585 (defaultEntry!4493 Int) (mask!10574 (_ BitVec 32)) (extraKeys!4230 (_ BitVec 32)) (zeroValue!4334 V!8141) (minValue!4334 V!8141) (_size!1841 (_ BitVec 32)) (_keys!6601 array!12029) (_values!4476 array!12027) (_vacant!1841 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3584)

(declare-fun array_inv!3779 (array!12029) Bool)

(declare-fun array_inv!3780 (array!12027) Bool)

(assert (=> b!242444 (= e!157365 (and tp!22741 tp_is_empty!6371 (array_inv!3779 (_keys!6601 thiss!1504)) (array_inv!3780 (_values!4476 thiss!1504)) e!157352))))

(declare-fun b!242445 () Bool)

(declare-fun e!157364 () Bool)

(assert (=> b!242445 (= e!157360 e!157364)))

(declare-fun res!118792 () Bool)

(assert (=> b!242445 (=> (not res!118792) (not e!157364))))

(declare-datatypes ((SeekEntryResult!1065 0))(
  ( (MissingZero!1065 (index!6430 (_ BitVec 32))) (Found!1065 (index!6431 (_ BitVec 32))) (Intermediate!1065 (undefined!1877 Bool) (index!6432 (_ BitVec 32)) (x!24271 (_ BitVec 32))) (Undefined!1065) (MissingVacant!1065 (index!6433 (_ BitVec 32))) )
))
(declare-fun lt!121769 () SeekEntryResult!1065)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!242445 (= res!118792 (or (= lt!121769 (MissingZero!1065 index!297)) (= lt!121769 (MissingVacant!1065 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12029 (_ BitVec 32)) SeekEntryResult!1065)

(assert (=> b!242445 (= lt!121769 (seekEntryOrOpen!0 key!932 (_keys!6601 thiss!1504) (mask!10574 thiss!1504)))))

(declare-fun b!242446 () Bool)

(declare-fun e!157362 () Bool)

(declare-fun call!22586 () Bool)

(assert (=> b!242446 (= e!157362 (not call!22586))))

(declare-fun mapIsEmpty!10798 () Bool)

(declare-fun mapRes!10798 () Bool)

(assert (=> mapIsEmpty!10798 mapRes!10798))

(declare-fun b!242447 () Bool)

(declare-fun e!157355 () Bool)

(assert (=> b!242447 (= e!157355 (is-Undefined!1065 lt!121769))))

(declare-fun b!242448 () Bool)

(declare-datatypes ((Unit!7478 0))(
  ( (Unit!7479) )
))
(declare-fun e!157354 () Unit!7478)

(declare-fun Unit!7480 () Unit!7478)

(assert (=> b!242448 (= e!157354 Unit!7480)))

(declare-fun lt!121770 () Unit!7478)

(declare-fun lemmaArrayContainsKeyThenInListMap!159 (array!12029 array!12027 (_ BitVec 32) (_ BitVec 32) V!8141 V!8141 (_ BitVec 64) (_ BitVec 32) Int) Unit!7478)

(assert (=> b!242448 (= lt!121770 (lemmaArrayContainsKeyThenInListMap!159 (_keys!6601 thiss!1504) (_values!4476 thiss!1504) (mask!10574 thiss!1504) (extraKeys!4230 thiss!1504) (zeroValue!4334 thiss!1504) (minValue!4334 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4493 thiss!1504)))))

(assert (=> b!242448 false))

(declare-fun b!242449 () Bool)

(declare-fun res!118794 () Bool)

(assert (=> b!242449 (=> (not res!118794) (not e!157356))))

(assert (=> b!242449 (= res!118794 (= (select (arr!5713 (_keys!6601 thiss!1504)) (index!6430 lt!121769)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!242450 () Bool)

(declare-fun res!118799 () Bool)

(declare-fun e!157353 () Bool)

(assert (=> b!242450 (=> (not res!118799) (not e!157353))))

(declare-fun noDuplicate!90 (List!3636) Bool)

(assert (=> b!242450 (= res!118799 (noDuplicate!90 Nil!3633))))

(declare-fun b!242451 () Bool)

(declare-fun Unit!7481 () Unit!7478)

(assert (=> b!242451 (= e!157354 Unit!7481)))

(declare-fun bm!22583 () Bool)

(declare-fun c!40456 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22583 (= call!22587 (inRange!0 (ite c!40456 (index!6430 lt!121769) (index!6433 lt!121769)) (mask!10574 thiss!1504)))))

(declare-fun bm!22584 () Bool)

(declare-fun arrayContainsKey!0 (array!12029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22584 (= call!22586 (arrayContainsKey!0 (_keys!6601 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10798 () Bool)

(declare-fun tp!22740 () Bool)

(declare-fun e!157361 () Bool)

(assert (=> mapNonEmpty!10798 (= mapRes!10798 (and tp!22740 e!157361))))

(declare-fun mapKey!10798 () (_ BitVec 32))

(declare-fun mapValue!10798 () ValueCell!2842)

(declare-fun mapRest!10798 () (Array (_ BitVec 32) ValueCell!2842))

(assert (=> mapNonEmpty!10798 (= (arr!5712 (_values!4476 thiss!1504)) (store mapRest!10798 mapKey!10798 mapValue!10798))))

(declare-fun res!118796 () Bool)

(assert (=> start!23118 (=> (not res!118796) (not e!157360))))

(declare-fun valid!1406 (LongMapFixedSize!3584) Bool)

(assert (=> start!23118 (= res!118796 (valid!1406 thiss!1504))))

(assert (=> start!23118 e!157360))

(assert (=> start!23118 e!157365))

(assert (=> start!23118 true))

(declare-fun b!242452 () Bool)

(assert (=> b!242452 (= e!157356 (not call!22586))))

(declare-fun b!242453 () Bool)

(declare-fun c!40458 () Bool)

(assert (=> b!242453 (= c!40458 (is-MissingVacant!1065 lt!121769))))

(assert (=> b!242453 (= e!157366 e!157355)))

(declare-fun b!242454 () Bool)

(declare-fun e!157358 () Bool)

(assert (=> b!242454 (= e!157352 (and e!157358 mapRes!10798))))

(declare-fun condMapEmpty!10798 () Bool)

(declare-fun mapDefault!10798 () ValueCell!2842)

