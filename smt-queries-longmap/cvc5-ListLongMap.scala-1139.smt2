; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23564 () Bool)

(assert start!23564)

(declare-fun b!247441 () Bool)

(declare-fun b_free!6583 () Bool)

(declare-fun b_next!6583 () Bool)

(assert (=> b!247441 (= b_free!6583 (not b_next!6583))))

(declare-fun tp!22997 () Bool)

(declare-fun b_and!13585 () Bool)

(assert (=> b!247441 (= tp!22997 b_and!13585)))

(declare-fun b!247419 () Bool)

(declare-fun res!121284 () Bool)

(declare-datatypes ((V!8241 0))(
  ( (V!8242 (val!3267 Int)) )
))
(declare-datatypes ((ValueCell!2879 0))(
  ( (ValueCellFull!2879 (v!5325 V!8241)) (EmptyCell!2879) )
))
(declare-datatypes ((array!12197 0))(
  ( (array!12198 (arr!5786 (Array (_ BitVec 32) ValueCell!2879)) (size!6129 (_ BitVec 32))) )
))
(declare-datatypes ((array!12199 0))(
  ( (array!12200 (arr!5787 (Array (_ BitVec 32) (_ BitVec 64))) (size!6130 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3658 0))(
  ( (LongMapFixedSize!3659 (defaultEntry!4578 Int) (mask!10716 (_ BitVec 32)) (extraKeys!4315 (_ BitVec 32)) (zeroValue!4419 V!8241) (minValue!4419 V!8241) (_size!1878 (_ BitVec 32)) (_keys!6700 array!12199) (_values!4561 array!12197) (_vacant!1878 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3658)

(declare-datatypes ((SeekEntryResult!1100 0))(
  ( (MissingZero!1100 (index!6570 (_ BitVec 32))) (Found!1100 (index!6571 (_ BitVec 32))) (Intermediate!1100 (undefined!1912 Bool) (index!6572 (_ BitVec 32)) (x!24528 (_ BitVec 32))) (Undefined!1100) (MissingVacant!1100 (index!6573 (_ BitVec 32))) )
))
(declare-fun lt!123928 () SeekEntryResult!1100)

(assert (=> b!247419 (= res!121284 (= (select (arr!5787 (_keys!6700 thiss!1504)) (index!6573 lt!123928)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160500 () Bool)

(assert (=> b!247419 (=> (not res!121284) (not e!160500))))

(declare-fun bm!23167 () Bool)

(declare-fun call!23170 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!23167 (= call!23170 (arrayContainsKey!0 (_keys!6700 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247420 () Bool)

(declare-fun e!160505 () Bool)

(declare-fun tp_is_empty!6445 () Bool)

(assert (=> b!247420 (= e!160505 tp_is_empty!6445)))

(declare-fun c!41425 () Bool)

(declare-fun bm!23168 () Bool)

(declare-fun call!23171 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23168 (= call!23171 (inRange!0 (ite c!41425 (index!6570 lt!123928) (index!6573 lt!123928)) (mask!10716 thiss!1504)))))

(declare-fun b!247421 () Bool)

(declare-datatypes ((Unit!7642 0))(
  ( (Unit!7643) )
))
(declare-fun e!160504 () Unit!7642)

(declare-fun Unit!7644 () Unit!7642)

(assert (=> b!247421 (= e!160504 Unit!7644)))

(declare-fun b!247422 () Bool)

(declare-fun e!160510 () Unit!7642)

(declare-fun lt!123925 () Unit!7642)

(assert (=> b!247422 (= e!160510 lt!123925)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!385 (array!12199 array!12197 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 64) Int) Unit!7642)

(assert (=> b!247422 (= lt!123925 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!385 (_keys!6700 thiss!1504) (_values!4561 thiss!1504) (mask!10716 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) key!932 (defaultEntry!4578 thiss!1504)))))

(assert (=> b!247422 (= c!41425 (is-MissingZero!1100 lt!123928))))

(declare-fun e!160502 () Bool)

(assert (=> b!247422 e!160502))

(declare-fun b!247423 () Bool)

(declare-fun e!160503 () Bool)

(assert (=> b!247423 (= e!160503 e!160500)))

(declare-fun res!121282 () Bool)

(assert (=> b!247423 (= res!121282 call!23171)))

(assert (=> b!247423 (=> (not res!121282) (not e!160500))))

(declare-fun b!247425 () Bool)

(declare-fun e!160509 () Bool)

(assert (=> b!247425 (= e!160509 tp_is_empty!6445)))

(declare-fun b!247426 () Bool)

(declare-fun Unit!7645 () Unit!7642)

(assert (=> b!247426 (= e!160510 Unit!7645)))

(declare-fun lt!123924 () Unit!7642)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!381 (array!12199 array!12197 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 64) Int) Unit!7642)

(assert (=> b!247426 (= lt!123924 (lemmaInListMapThenSeekEntryOrOpenFindsIt!381 (_keys!6700 thiss!1504) (_values!4561 thiss!1504) (mask!10716 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) key!932 (defaultEntry!4578 thiss!1504)))))

(assert (=> b!247426 false))

(declare-fun b!247427 () Bool)

(declare-fun e!160512 () Bool)

(declare-fun e!160506 () Bool)

(assert (=> b!247427 (= e!160512 e!160506)))

(declare-fun res!121283 () Bool)

(assert (=> b!247427 (=> (not res!121283) (not e!160506))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!247427 (= res!121283 (or (= lt!123928 (MissingZero!1100 index!297)) (= lt!123928 (MissingVacant!1100 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12199 (_ BitVec 32)) SeekEntryResult!1100)

(assert (=> b!247427 (= lt!123928 (seekEntryOrOpen!0 key!932 (_keys!6700 thiss!1504) (mask!10716 thiss!1504)))))

(declare-fun b!247428 () Bool)

(declare-fun res!121279 () Bool)

(declare-fun e!160511 () Bool)

(assert (=> b!247428 (=> res!121279 e!160511)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!247428 (= res!121279 (not (validKeyInArray!0 key!932)))))

(declare-fun b!247429 () Bool)

(declare-fun res!121280 () Bool)

(declare-fun e!160499 () Bool)

(assert (=> b!247429 (=> (not res!121280) (not e!160499))))

(assert (=> b!247429 (= res!121280 call!23171)))

(assert (=> b!247429 (= e!160502 e!160499)))

(declare-fun mapNonEmpty!10943 () Bool)

(declare-fun mapRes!10943 () Bool)

(declare-fun tp!22996 () Bool)

(assert (=> mapNonEmpty!10943 (= mapRes!10943 (and tp!22996 e!160509))))

(declare-fun mapRest!10943 () (Array (_ BitVec 32) ValueCell!2879))

(declare-fun mapValue!10943 () ValueCell!2879)

(declare-fun mapKey!10943 () (_ BitVec 32))

(assert (=> mapNonEmpty!10943 (= (arr!5786 (_values!4561 thiss!1504)) (store mapRest!10943 mapKey!10943 mapValue!10943))))

(declare-fun b!247430 () Bool)

(declare-fun res!121285 () Bool)

(assert (=> b!247430 (=> (not res!121285) (not e!160499))))

(assert (=> b!247430 (= res!121285 (= (select (arr!5787 (_keys!6700 thiss!1504)) (index!6570 lt!123928)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!247431 () Bool)

(declare-fun e!160498 () Bool)

(assert (=> b!247431 (= e!160498 (not e!160511))))

(declare-fun res!121275 () Bool)

(assert (=> b!247431 (=> res!121275 e!160511)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!247431 (= res!121275 (not (validMask!0 (mask!10716 thiss!1504))))))

(declare-fun lt!123921 () array!12199)

(declare-fun arrayCountValidKeys!0 (array!12199 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!247431 (= (arrayCountValidKeys!0 lt!123921 #b00000000000000000000000000000000 (size!6130 (_keys!6700 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6700 thiss!1504) #b00000000000000000000000000000000 (size!6130 (_keys!6700 thiss!1504)))))))

(declare-fun lt!123923 () Unit!7642)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12199 (_ BitVec 32) (_ BitVec 64)) Unit!7642)

(assert (=> b!247431 (= lt!123923 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6700 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3689 0))(
  ( (Nil!3686) (Cons!3685 (h!4343 (_ BitVec 64)) (t!8712 List!3689)) )
))
(declare-fun arrayNoDuplicates!0 (array!12199 (_ BitVec 32) List!3689) Bool)

(assert (=> b!247431 (arrayNoDuplicates!0 lt!123921 #b00000000000000000000000000000000 Nil!3686)))

(assert (=> b!247431 (= lt!123921 (array!12200 (store (arr!5787 (_keys!6700 thiss!1504)) index!297 key!932) (size!6130 (_keys!6700 thiss!1504))))))

(declare-fun lt!123930 () Unit!7642)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12199 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3689) Unit!7642)

(assert (=> b!247431 (= lt!123930 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6700 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3686))))

(declare-fun lt!123929 () Unit!7642)

(assert (=> b!247431 (= lt!123929 e!160504)))

(declare-fun c!41424 () Bool)

(declare-fun lt!123922 () Bool)

(assert (=> b!247431 (= c!41424 lt!123922)))

(assert (=> b!247431 (= lt!123922 (arrayContainsKey!0 (_keys!6700 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!247432 () Bool)

(declare-fun res!121277 () Bool)

(assert (=> b!247432 (=> res!121277 e!160511)))

(assert (=> b!247432 (= res!121277 (or (not (= (size!6130 (_keys!6700 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10716 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6130 (_keys!6700 thiss!1504)))))))

(declare-fun b!247433 () Bool)

(assert (=> b!247433 (= e!160503 (is-Undefined!1100 lt!123928))))

(declare-fun b!247434 () Bool)

(declare-fun res!121276 () Bool)

(assert (=> b!247434 (=> (not res!121276) (not e!160512))))

(assert (=> b!247434 (= res!121276 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247435 () Bool)

(declare-fun c!41426 () Bool)

(assert (=> b!247435 (= c!41426 (is-MissingVacant!1100 lt!123928))))

(assert (=> b!247435 (= e!160502 e!160503)))

(declare-fun mapIsEmpty!10943 () Bool)

(assert (=> mapIsEmpty!10943 mapRes!10943))

(declare-fun b!247436 () Bool)

(assert (=> b!247436 (= e!160511 (not lt!123922))))

(declare-fun b!247437 () Bool)

(assert (=> b!247437 (= e!160500 (not call!23170))))

(declare-fun b!247438 () Bool)

(assert (=> b!247438 (= e!160499 (not call!23170))))

(declare-fun b!247439 () Bool)

(assert (=> b!247439 (= e!160506 e!160498)))

(declare-fun res!121281 () Bool)

(assert (=> b!247439 (=> (not res!121281) (not e!160498))))

(assert (=> b!247439 (= res!121281 (inRange!0 index!297 (mask!10716 thiss!1504)))))

(declare-fun lt!123927 () Unit!7642)

(assert (=> b!247439 (= lt!123927 e!160510)))

(declare-fun c!41423 () Bool)

(declare-datatypes ((tuple2!4808 0))(
  ( (tuple2!4809 (_1!2415 (_ BitVec 64)) (_2!2415 V!8241)) )
))
(declare-datatypes ((List!3690 0))(
  ( (Nil!3687) (Cons!3686 (h!4344 tuple2!4808) (t!8713 List!3690)) )
))
(declare-datatypes ((ListLongMap!3721 0))(
  ( (ListLongMap!3722 (toList!1876 List!3690)) )
))
(declare-fun contains!1790 (ListLongMap!3721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1404 (array!12199 array!12197 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 32) Int) ListLongMap!3721)

(assert (=> b!247439 (= c!41423 (contains!1790 (getCurrentListMap!1404 (_keys!6700 thiss!1504) (_values!4561 thiss!1504) (mask!10716 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4578 thiss!1504)) key!932))))

(declare-fun b!247440 () Bool)

(declare-fun Unit!7646 () Unit!7642)

(assert (=> b!247440 (= e!160504 Unit!7646)))

(declare-fun lt!123926 () Unit!7642)

(declare-fun lemmaArrayContainsKeyThenInListMap!184 (array!12199 array!12197 (_ BitVec 32) (_ BitVec 32) V!8241 V!8241 (_ BitVec 64) (_ BitVec 32) Int) Unit!7642)

(assert (=> b!247440 (= lt!123926 (lemmaArrayContainsKeyThenInListMap!184 (_keys!6700 thiss!1504) (_values!4561 thiss!1504) (mask!10716 thiss!1504) (extraKeys!4315 thiss!1504) (zeroValue!4419 thiss!1504) (minValue!4419 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4578 thiss!1504)))))

(assert (=> b!247440 false))

(declare-fun e!160501 () Bool)

(declare-fun e!160508 () Bool)

(declare-fun array_inv!3821 (array!12199) Bool)

(declare-fun array_inv!3822 (array!12197) Bool)

(assert (=> b!247441 (= e!160508 (and tp!22997 tp_is_empty!6445 (array_inv!3821 (_keys!6700 thiss!1504)) (array_inv!3822 (_values!4561 thiss!1504)) e!160501))))

(declare-fun b!247424 () Bool)

(assert (=> b!247424 (= e!160501 (and e!160505 mapRes!10943))))

(declare-fun condMapEmpty!10943 () Bool)

(declare-fun mapDefault!10943 () ValueCell!2879)

