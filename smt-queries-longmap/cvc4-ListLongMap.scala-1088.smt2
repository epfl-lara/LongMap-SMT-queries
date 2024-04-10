; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22214 () Bool)

(assert start!22214)

(declare-fun b!233109 () Bool)

(declare-fun b_free!6281 () Bool)

(declare-fun b_next!6281 () Bool)

(assert (=> b!233109 (= b_free!6281 (not b_next!6281))))

(declare-fun tp!21984 () Bool)

(declare-fun b_and!13179 () Bool)

(assert (=> b!233109 (= tp!21984 b_and!13179)))

(declare-fun b!233094 () Bool)

(declare-fun e!151416 () Bool)

(declare-fun tp_is_empty!6143 () Bool)

(assert (=> b!233094 (= e!151416 tp_is_empty!6143)))

(declare-fun mapNonEmpty!10384 () Bool)

(declare-fun mapRes!10384 () Bool)

(declare-fun tp!21985 () Bool)

(declare-fun e!151411 () Bool)

(assert (=> mapNonEmpty!10384 (= mapRes!10384 (and tp!21985 e!151411))))

(declare-fun mapKey!10384 () (_ BitVec 32))

(declare-datatypes ((V!7837 0))(
  ( (V!7838 (val!3116 Int)) )
))
(declare-datatypes ((ValueCell!2728 0))(
  ( (ValueCellFull!2728 (v!5136 V!7837)) (EmptyCell!2728) )
))
(declare-fun mapValue!10384 () ValueCell!2728)

(declare-datatypes ((array!11529 0))(
  ( (array!11530 (arr!5484 (Array (_ BitVec 32) ValueCell!2728)) (size!5817 (_ BitVec 32))) )
))
(declare-datatypes ((array!11531 0))(
  ( (array!11532 (arr!5485 (Array (_ BitVec 32) (_ BitVec 64))) (size!5818 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3356 0))(
  ( (LongMapFixedSize!3357 (defaultEntry!4337 Int) (mask!10257 (_ BitVec 32)) (extraKeys!4074 (_ BitVec 32)) (zeroValue!4178 V!7837) (minValue!4178 V!7837) (_size!1727 (_ BitVec 32)) (_keys!6391 array!11531) (_values!4320 array!11529) (_vacant!1727 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3356)

(declare-fun mapRest!10384 () (Array (_ BitVec 32) ValueCell!2728))

(assert (=> mapNonEmpty!10384 (= (arr!5484 (_values!4320 thiss!1504)) (store mapRest!10384 mapKey!10384 mapValue!10384))))

(declare-fun res!114416 () Bool)

(declare-fun e!151407 () Bool)

(assert (=> start!22214 (=> (not res!114416) (not e!151407))))

(declare-fun valid!1326 (LongMapFixedSize!3356) Bool)

(assert (=> start!22214 (= res!114416 (valid!1326 thiss!1504))))

(assert (=> start!22214 e!151407))

(declare-fun e!151417 () Bool)

(assert (=> start!22214 e!151417))

(assert (=> start!22214 true))

(declare-fun b!233095 () Bool)

(assert (=> b!233095 (= e!151411 tp_is_empty!6143)))

(declare-fun b!233096 () Bool)

(declare-fun c!38775 () Bool)

(declare-datatypes ((SeekEntryResult!973 0))(
  ( (MissingZero!973 (index!6062 (_ BitVec 32))) (Found!973 (index!6063 (_ BitVec 32))) (Intermediate!973 (undefined!1785 Bool) (index!6064 (_ BitVec 32)) (x!23593 (_ BitVec 32))) (Undefined!973) (MissingVacant!973 (index!6065 (_ BitVec 32))) )
))
(declare-fun lt!117902 () SeekEntryResult!973)

(assert (=> b!233096 (= c!38775 (is-MissingVacant!973 lt!117902))))

(declare-fun e!151409 () Bool)

(declare-fun e!151410 () Bool)

(assert (=> b!233096 (= e!151409 e!151410)))

(declare-fun b!233097 () Bool)

(declare-fun res!114418 () Bool)

(assert (=> b!233097 (=> (not res!114418) (not e!151407))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!233097 (= res!114418 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10384 () Bool)

(assert (=> mapIsEmpty!10384 mapRes!10384))

(declare-fun b!233098 () Bool)

(declare-fun e!151408 () Bool)

(declare-fun call!21678 () Bool)

(assert (=> b!233098 (= e!151408 (not call!21678))))

(declare-fun b!233099 () Bool)

(declare-fun res!114417 () Bool)

(assert (=> b!233099 (=> (not res!114417) (not e!151408))))

(assert (=> b!233099 (= res!114417 (= (select (arr!5485 (_keys!6391 thiss!1504)) (index!6062 lt!117902)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233100 () Bool)

(declare-fun e!151413 () Bool)

(assert (=> b!233100 (= e!151410 e!151413)))

(declare-fun res!114414 () Bool)

(declare-fun call!21677 () Bool)

(assert (=> b!233100 (= res!114414 call!21677)))

(assert (=> b!233100 (=> (not res!114414) (not e!151413))))

(declare-fun b!233101 () Bool)

(assert (=> b!233101 (= e!151413 (not call!21678))))

(declare-fun bm!21674 () Bool)

(declare-fun arrayContainsKey!0 (array!11531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21674 (= call!21678 (arrayContainsKey!0 (_keys!6391 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!233102 () Bool)

(declare-datatypes ((Unit!7208 0))(
  ( (Unit!7209) )
))
(declare-fun e!151414 () Unit!7208)

(declare-fun lt!117905 () Unit!7208)

(assert (=> b!233102 (= e!151414 lt!117905)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!332 (array!11531 array!11529 (_ BitVec 32) (_ BitVec 32) V!7837 V!7837 (_ BitVec 64) Int) Unit!7208)

(assert (=> b!233102 (= lt!117905 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!332 (_keys!6391 thiss!1504) (_values!4320 thiss!1504) (mask!10257 thiss!1504) (extraKeys!4074 thiss!1504) (zeroValue!4178 thiss!1504) (minValue!4178 thiss!1504) key!932 (defaultEntry!4337 thiss!1504)))))

(declare-fun c!38773 () Bool)

(assert (=> b!233102 (= c!38773 (is-MissingZero!973 lt!117902))))

(assert (=> b!233102 e!151409))

(declare-fun b!233103 () Bool)

(declare-fun e!151418 () Bool)

(assert (=> b!233103 (= e!151407 e!151418)))

(declare-fun res!114415 () Bool)

(assert (=> b!233103 (=> (not res!114415) (not e!151418))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233103 (= res!114415 (or (= lt!117902 (MissingZero!973 index!297)) (= lt!117902 (MissingVacant!973 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11531 (_ BitVec 32)) SeekEntryResult!973)

(assert (=> b!233103 (= lt!117902 (seekEntryOrOpen!0 key!932 (_keys!6391 thiss!1504) (mask!10257 thiss!1504)))))

(declare-fun b!233104 () Bool)

(declare-fun res!114412 () Bool)

(assert (=> b!233104 (=> (not res!114412) (not e!151408))))

(assert (=> b!233104 (= res!114412 call!21677)))

(assert (=> b!233104 (= e!151409 e!151408)))

(declare-fun b!233105 () Bool)

(declare-fun e!151412 () Bool)

(assert (=> b!233105 (= e!151412 (and e!151416 mapRes!10384))))

(declare-fun condMapEmpty!10384 () Bool)

(declare-fun mapDefault!10384 () ValueCell!2728)

