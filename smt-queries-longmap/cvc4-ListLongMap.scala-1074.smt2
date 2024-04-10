; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22130 () Bool)

(assert start!22130)

(declare-fun b!230594 () Bool)

(declare-fun b_free!6197 () Bool)

(declare-fun b_next!6197 () Bool)

(assert (=> b!230594 (= b_free!6197 (not b_next!6197))))

(declare-fun tp!21733 () Bool)

(declare-fun b_and!13095 () Bool)

(assert (=> b!230594 (= tp!21733 b_and!13095)))

(declare-fun b!230580 () Bool)

(declare-fun e!149643 () Bool)

(declare-fun e!149647 () Bool)

(assert (=> b!230580 (= e!149643 e!149647)))

(declare-fun res!113394 () Bool)

(assert (=> b!230580 (=> (not res!113394) (not e!149647))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7725 0))(
  ( (V!7726 (val!3074 Int)) )
))
(declare-datatypes ((ValueCell!2686 0))(
  ( (ValueCellFull!2686 (v!5094 V!7725)) (EmptyCell!2686) )
))
(declare-datatypes ((array!11361 0))(
  ( (array!11362 (arr!5400 (Array (_ BitVec 32) ValueCell!2686)) (size!5733 (_ BitVec 32))) )
))
(declare-datatypes ((array!11363 0))(
  ( (array!11364 (arr!5401 (Array (_ BitVec 32) (_ BitVec 64))) (size!5734 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3272 0))(
  ( (LongMapFixedSize!3273 (defaultEntry!4295 Int) (mask!10187 (_ BitVec 32)) (extraKeys!4032 (_ BitVec 32)) (zeroValue!4136 V!7725) (minValue!4136 V!7725) (_size!1685 (_ BitVec 32)) (_keys!6349 array!11363) (_values!4278 array!11361) (_vacant!1685 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3272)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!230580 (= res!113394 (inRange!0 index!297 (mask!10187 thiss!1504)))))

(declare-datatypes ((Unit!7064 0))(
  ( (Unit!7065) )
))
(declare-fun lt!116069 () Unit!7064)

(declare-fun e!149642 () Unit!7064)

(assert (=> b!230580 (= lt!116069 e!149642)))

(declare-fun c!38277 () Bool)

(declare-datatypes ((tuple2!4536 0))(
  ( (tuple2!4537 (_1!2279 (_ BitVec 64)) (_2!2279 V!7725)) )
))
(declare-datatypes ((List!3459 0))(
  ( (Nil!3456) (Cons!3455 (h!4103 tuple2!4536) (t!8418 List!3459)) )
))
(declare-datatypes ((ListLongMap!3449 0))(
  ( (ListLongMap!3450 (toList!1740 List!3459)) )
))
(declare-fun lt!116072 () ListLongMap!3449)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1612 (ListLongMap!3449 (_ BitVec 64)) Bool)

(assert (=> b!230580 (= c!38277 (contains!1612 lt!116072 key!932))))

(declare-fun getCurrentListMap!1268 (array!11363 array!11361 (_ BitVec 32) (_ BitVec 32) V!7725 V!7725 (_ BitVec 32) Int) ListLongMap!3449)

(assert (=> b!230580 (= lt!116072 (getCurrentListMap!1268 (_keys!6349 thiss!1504) (_values!4278 thiss!1504) (mask!10187 thiss!1504) (extraKeys!4032 thiss!1504) (zeroValue!4136 thiss!1504) (minValue!4136 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4295 thiss!1504)))))

(declare-fun bm!21422 () Bool)

(declare-fun call!21426 () Bool)

(declare-fun arrayContainsKey!0 (array!11363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21422 (= call!21426 (arrayContainsKey!0 (_keys!6349 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230581 () Bool)

(declare-fun res!113400 () Bool)

(declare-fun e!149654 () Bool)

(assert (=> b!230581 (=> (not res!113400) (not e!149654))))

(assert (=> b!230581 (= res!113400 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!230582 () Bool)

(assert (=> b!230582 (= e!149654 e!149643)))

(declare-fun res!113397 () Bool)

(assert (=> b!230582 (=> (not res!113397) (not e!149643))))

(declare-datatypes ((SeekEntryResult!939 0))(
  ( (MissingZero!939 (index!5926 (_ BitVec 32))) (Found!939 (index!5927 (_ BitVec 32))) (Intermediate!939 (undefined!1751 Bool) (index!5928 (_ BitVec 32)) (x!23447 (_ BitVec 32))) (Undefined!939) (MissingVacant!939 (index!5929 (_ BitVec 32))) )
))
(declare-fun lt!116066 () SeekEntryResult!939)

(assert (=> b!230582 (= res!113397 (or (= lt!116066 (MissingZero!939 index!297)) (= lt!116066 (MissingVacant!939 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11363 (_ BitVec 32)) SeekEntryResult!939)

(assert (=> b!230582 (= lt!116066 (seekEntryOrOpen!0 key!932 (_keys!6349 thiss!1504) (mask!10187 thiss!1504)))))

(declare-fun b!230583 () Bool)

(declare-fun e!149652 () Bool)

(assert (=> b!230583 (= e!149652 (not call!21426))))

(declare-fun mapNonEmpty!10258 () Bool)

(declare-fun mapRes!10258 () Bool)

(declare-fun tp!21732 () Bool)

(declare-fun e!149644 () Bool)

(assert (=> mapNonEmpty!10258 (= mapRes!10258 (and tp!21732 e!149644))))

(declare-fun mapRest!10258 () (Array (_ BitVec 32) ValueCell!2686))

(declare-fun mapKey!10258 () (_ BitVec 32))

(declare-fun mapValue!10258 () ValueCell!2686)

(assert (=> mapNonEmpty!10258 (= (arr!5400 (_values!4278 thiss!1504)) (store mapRest!10258 mapKey!10258 mapValue!10258))))

(declare-fun b!230584 () Bool)

(declare-fun e!149648 () Bool)

(assert (=> b!230584 (= e!149648 (is-Undefined!939 lt!116066))))

(declare-fun b!230585 () Bool)

(declare-fun res!113395 () Bool)

(declare-fun e!149641 () Bool)

(assert (=> b!230585 (=> (not res!113395) (not e!149641))))

(assert (=> b!230585 (= res!113395 (= (select (arr!5401 (_keys!6349 thiss!1504)) (index!5926 lt!116066)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230586 () Bool)

(declare-fun tp_is_empty!6059 () Bool)

(assert (=> b!230586 (= e!149644 tp_is_empty!6059)))

(declare-fun b!230588 () Bool)

(declare-fun e!149653 () Unit!7064)

(declare-fun Unit!7066 () Unit!7064)

(assert (=> b!230588 (= e!149653 Unit!7066)))

(declare-fun b!230589 () Bool)

(declare-fun res!113399 () Bool)

(assert (=> b!230589 (=> (not res!113399) (not e!149641))))

(declare-fun call!21425 () Bool)

(assert (=> b!230589 (= res!113399 call!21425)))

(declare-fun e!149645 () Bool)

(assert (=> b!230589 (= e!149645 e!149641)))

(declare-fun b!230590 () Bool)

(declare-fun lt!116074 () Unit!7064)

(assert (=> b!230590 (= e!149642 lt!116074)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!309 (array!11363 array!11361 (_ BitVec 32) (_ BitVec 32) V!7725 V!7725 (_ BitVec 64) Int) Unit!7064)

(assert (=> b!230590 (= lt!116074 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!309 (_keys!6349 thiss!1504) (_values!4278 thiss!1504) (mask!10187 thiss!1504) (extraKeys!4032 thiss!1504) (zeroValue!4136 thiss!1504) (minValue!4136 thiss!1504) key!932 (defaultEntry!4295 thiss!1504)))))

(declare-fun c!38279 () Bool)

(assert (=> b!230590 (= c!38279 (is-MissingZero!939 lt!116066))))

(assert (=> b!230590 e!149645))

(declare-fun b!230591 () Bool)

(declare-fun e!149649 () Bool)

(assert (=> b!230591 (= e!149649 tp_is_empty!6059)))

(declare-fun b!230592 () Bool)

(declare-fun e!149651 () Bool)

(assert (=> b!230592 (= e!149651 (and e!149649 mapRes!10258))))

(declare-fun condMapEmpty!10258 () Bool)

(declare-fun mapDefault!10258 () ValueCell!2686)

