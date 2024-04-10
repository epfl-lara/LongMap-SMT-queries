; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22934 () Bool)

(assert start!22934)

(declare-fun b!239496 () Bool)

(declare-fun b_free!6437 () Bool)

(declare-fun b_next!6437 () Bool)

(assert (=> b!239496 (= b_free!6437 (not b_next!6437))))

(declare-fun tp!22515 () Bool)

(declare-fun b_and!13403 () Bool)

(assert (=> b!239496 (= tp!22515 b_and!13403)))

(declare-fun b!239480 () Bool)

(declare-fun c!39919 () Bool)

(declare-datatypes ((SeekEntryResult!1033 0))(
  ( (MissingZero!1033 (index!6302 (_ BitVec 32))) (Found!1033 (index!6303 (_ BitVec 32))) (Intermediate!1033 (undefined!1845 Bool) (index!6304 (_ BitVec 32)) (x!24105 (_ BitVec 32))) (Undefined!1033) (MissingVacant!1033 (index!6305 (_ BitVec 32))) )
))
(declare-fun lt!120801 () SeekEntryResult!1033)

(assert (=> b!239480 (= c!39919 (is-MissingVacant!1033 lt!120801))))

(declare-fun e!155491 () Bool)

(declare-fun e!155495 () Bool)

(assert (=> b!239480 (= e!155491 e!155495)))

(declare-fun b!239481 () Bool)

(declare-fun res!117372 () Bool)

(declare-fun e!155488 () Bool)

(assert (=> b!239481 (=> (not res!117372) (not e!155488))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!239481 (= res!117372 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!22268 () Bool)

(declare-fun call!22271 () Bool)

(declare-datatypes ((V!8045 0))(
  ( (V!8046 (val!3194 Int)) )
))
(declare-datatypes ((ValueCell!2806 0))(
  ( (ValueCellFull!2806 (v!5232 V!8045)) (EmptyCell!2806) )
))
(declare-datatypes ((array!11877 0))(
  ( (array!11878 (arr!5640 (Array (_ BitVec 32) ValueCell!2806)) (size!5981 (_ BitVec 32))) )
))
(declare-datatypes ((array!11879 0))(
  ( (array!11880 (arr!5641 (Array (_ BitVec 32) (_ BitVec 64))) (size!5982 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3512 0))(
  ( (LongMapFixedSize!3513 (defaultEntry!4441 Int) (mask!10487 (_ BitVec 32)) (extraKeys!4178 (_ BitVec 32)) (zeroValue!4282 V!8045) (minValue!4282 V!8045) (_size!1805 (_ BitVec 32)) (_keys!6543 array!11879) (_values!4424 array!11877) (_vacant!1805 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3512)

(declare-fun arrayContainsKey!0 (array!11879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22268 (= call!22271 (arrayContainsKey!0 (_keys!6543 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239482 () Bool)

(declare-fun e!155498 () Bool)

(assert (=> b!239482 (= e!155488 e!155498)))

(declare-fun res!117370 () Bool)

(assert (=> b!239482 (=> (not res!117370) (not e!155498))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239482 (= res!117370 (or (= lt!120801 (MissingZero!1033 index!297)) (= lt!120801 (MissingVacant!1033 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11879 (_ BitVec 32)) SeekEntryResult!1033)

(assert (=> b!239482 (= lt!120801 (seekEntryOrOpen!0 key!932 (_keys!6543 thiss!1504) (mask!10487 thiss!1504)))))

(declare-fun b!239483 () Bool)

(declare-fun e!155492 () Bool)

(assert (=> b!239483 (= e!155495 e!155492)))

(declare-fun res!117369 () Bool)

(declare-fun call!22272 () Bool)

(assert (=> b!239483 (= res!117369 call!22272)))

(assert (=> b!239483 (=> (not res!117369) (not e!155492))))

(declare-fun b!239484 () Bool)

(assert (=> b!239484 (= e!155495 (is-Undefined!1033 lt!120801))))

(declare-fun mapNonEmpty!10680 () Bool)

(declare-fun mapRes!10680 () Bool)

(declare-fun tp!22514 () Bool)

(declare-fun e!155494 () Bool)

(assert (=> mapNonEmpty!10680 (= mapRes!10680 (and tp!22514 e!155494))))

(declare-fun mapValue!10680 () ValueCell!2806)

(declare-fun mapKey!10680 () (_ BitVec 32))

(declare-fun mapRest!10680 () (Array (_ BitVec 32) ValueCell!2806))

(assert (=> mapNonEmpty!10680 (= (arr!5640 (_values!4424 thiss!1504)) (store mapRest!10680 mapKey!10680 mapValue!10680))))

(declare-fun b!239485 () Bool)

(declare-fun e!155493 () Bool)

(assert (=> b!239485 (= e!155498 e!155493)))

(declare-fun res!117376 () Bool)

(assert (=> b!239485 (=> (not res!117376) (not e!155493))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239485 (= res!117376 (inRange!0 index!297 (mask!10487 thiss!1504)))))

(declare-datatypes ((Unit!7356 0))(
  ( (Unit!7357) )
))
(declare-fun lt!120800 () Unit!7356)

(declare-fun e!155497 () Unit!7356)

(assert (=> b!239485 (= lt!120800 e!155497)))

(declare-fun c!39920 () Bool)

(declare-datatypes ((tuple2!4706 0))(
  ( (tuple2!4707 (_1!2364 (_ BitVec 64)) (_2!2364 V!8045)) )
))
(declare-datatypes ((List!3595 0))(
  ( (Nil!3592) (Cons!3591 (h!4247 tuple2!4706) (t!8590 List!3595)) )
))
(declare-datatypes ((ListLongMap!3619 0))(
  ( (ListLongMap!3620 (toList!1825 List!3595)) )
))
(declare-fun contains!1713 (ListLongMap!3619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1353 (array!11879 array!11877 (_ BitVec 32) (_ BitVec 32) V!8045 V!8045 (_ BitVec 32) Int) ListLongMap!3619)

(assert (=> b!239485 (= c!39920 (contains!1713 (getCurrentListMap!1353 (_keys!6543 thiss!1504) (_values!4424 thiss!1504) (mask!10487 thiss!1504) (extraKeys!4178 thiss!1504) (zeroValue!4282 thiss!1504) (minValue!4282 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4441 thiss!1504)) key!932))))

(declare-fun b!239486 () Bool)

(declare-fun lt!120799 () Unit!7356)

(assert (=> b!239486 (= e!155497 lt!120799)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!344 (array!11879 array!11877 (_ BitVec 32) (_ BitVec 32) V!8045 V!8045 (_ BitVec 64) Int) Unit!7356)

(assert (=> b!239486 (= lt!120799 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!344 (_keys!6543 thiss!1504) (_values!4424 thiss!1504) (mask!10487 thiss!1504) (extraKeys!4178 thiss!1504) (zeroValue!4282 thiss!1504) (minValue!4282 thiss!1504) key!932 (defaultEntry!4441 thiss!1504)))))

(declare-fun c!39918 () Bool)

(assert (=> b!239486 (= c!39918 (is-MissingZero!1033 lt!120801))))

(assert (=> b!239486 e!155491))

(declare-fun b!239487 () Bool)

(declare-fun e!155489 () Bool)

(declare-fun tp_is_empty!6299 () Bool)

(assert (=> b!239487 (= e!155489 tp_is_empty!6299)))

(declare-fun b!239488 () Bool)

(declare-fun e!155487 () Bool)

(assert (=> b!239488 (= e!155487 (not call!22271))))

(declare-fun mapIsEmpty!10680 () Bool)

(assert (=> mapIsEmpty!10680 mapRes!10680))

(declare-fun b!239490 () Bool)

(declare-fun res!117371 () Bool)

(assert (=> b!239490 (=> (not res!117371) (not e!155493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239490 (= res!117371 (validMask!0 (mask!10487 thiss!1504)))))

(declare-fun b!239491 () Bool)

(declare-fun res!117374 () Bool)

(assert (=> b!239491 (=> (not res!117374) (not e!155493))))

(assert (=> b!239491 (= res!117374 (arrayContainsKey!0 (_keys!6543 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239492 () Bool)

(declare-fun res!117375 () Bool)

(assert (=> b!239492 (=> (not res!117375) (not e!155487))))

(assert (=> b!239492 (= res!117375 call!22272)))

(assert (=> b!239492 (= e!155491 e!155487)))

(declare-fun b!239493 () Bool)

(declare-fun Unit!7358 () Unit!7356)

(assert (=> b!239493 (= e!155497 Unit!7358)))

(declare-fun lt!120798 () Unit!7356)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!328 (array!11879 array!11877 (_ BitVec 32) (_ BitVec 32) V!8045 V!8045 (_ BitVec 64) Int) Unit!7356)

(assert (=> b!239493 (= lt!120798 (lemmaInListMapThenSeekEntryOrOpenFindsIt!328 (_keys!6543 thiss!1504) (_values!4424 thiss!1504) (mask!10487 thiss!1504) (extraKeys!4178 thiss!1504) (zeroValue!4282 thiss!1504) (minValue!4282 thiss!1504) key!932 (defaultEntry!4441 thiss!1504)))))

(assert (=> b!239493 false))

(declare-fun b!239494 () Bool)

(assert (=> b!239494 (= e!155494 tp_is_empty!6299)))

(declare-fun b!239495 () Bool)

(declare-fun res!117373 () Bool)

(assert (=> b!239495 (=> (not res!117373) (not e!155487))))

(assert (=> b!239495 (= res!117373 (= (select (arr!5641 (_keys!6543 thiss!1504)) (index!6302 lt!120801)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155496 () Bool)

(declare-fun e!155490 () Bool)

(declare-fun array_inv!3731 (array!11879) Bool)

(declare-fun array_inv!3732 (array!11877) Bool)

(assert (=> b!239496 (= e!155490 (and tp!22515 tp_is_empty!6299 (array_inv!3731 (_keys!6543 thiss!1504)) (array_inv!3732 (_values!4424 thiss!1504)) e!155496))))

(declare-fun res!117377 () Bool)

(assert (=> start!22934 (=> (not res!117377) (not e!155488))))

(declare-fun valid!1385 (LongMapFixedSize!3512) Bool)

(assert (=> start!22934 (= res!117377 (valid!1385 thiss!1504))))

(assert (=> start!22934 e!155488))

(assert (=> start!22934 e!155490))

(assert (=> start!22934 true))

(declare-fun b!239489 () Bool)

(assert (=> b!239489 (= e!155496 (and e!155489 mapRes!10680))))

(declare-fun condMapEmpty!10680 () Bool)

(declare-fun mapDefault!10680 () ValueCell!2806)

