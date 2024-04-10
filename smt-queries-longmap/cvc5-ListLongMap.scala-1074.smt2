; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22126 () Bool)

(assert start!22126)

(declare-fun b!230465 () Bool)

(declare-fun b_free!6193 () Bool)

(declare-fun b_next!6193 () Bool)

(assert (=> b!230465 (= b_free!6193 (not b_next!6193))))

(declare-fun tp!21720 () Bool)

(declare-fun b_and!13091 () Bool)

(assert (=> b!230465 (= tp!21720 b_and!13091)))

(declare-fun b!230460 () Bool)

(declare-fun res!113353 () Bool)

(declare-fun e!149569 () Bool)

(assert (=> b!230460 (=> (not res!113353) (not e!149569))))

(declare-datatypes ((V!7721 0))(
  ( (V!7722 (val!3072 Int)) )
))
(declare-datatypes ((ValueCell!2684 0))(
  ( (ValueCellFull!2684 (v!5092 V!7721)) (EmptyCell!2684) )
))
(declare-datatypes ((array!11353 0))(
  ( (array!11354 (arr!5396 (Array (_ BitVec 32) ValueCell!2684)) (size!5729 (_ BitVec 32))) )
))
(declare-datatypes ((array!11355 0))(
  ( (array!11356 (arr!5397 (Array (_ BitVec 32) (_ BitVec 64))) (size!5730 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3268 0))(
  ( (LongMapFixedSize!3269 (defaultEntry!4293 Int) (mask!10185 (_ BitVec 32)) (extraKeys!4030 (_ BitVec 32)) (zeroValue!4134 V!7721) (minValue!4134 V!7721) (_size!1683 (_ BitVec 32)) (_keys!6347 array!11355) (_values!4276 array!11353) (_vacant!1683 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3268)

(declare-datatypes ((SeekEntryResult!937 0))(
  ( (MissingZero!937 (index!5918 (_ BitVec 32))) (Found!937 (index!5919 (_ BitVec 32))) (Intermediate!937 (undefined!1749 Bool) (index!5920 (_ BitVec 32)) (x!23445 (_ BitVec 32))) (Undefined!937) (MissingVacant!937 (index!5921 (_ BitVec 32))) )
))
(declare-fun lt!115992 () SeekEntryResult!937)

(assert (=> b!230460 (= res!113353 (= (select (arr!5397 (_keys!6347 thiss!1504)) (index!5918 lt!115992)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!230461 () Bool)

(declare-datatypes ((Unit!7055 0))(
  ( (Unit!7056) )
))
(declare-fun e!149562 () Unit!7055)

(declare-fun Unit!7057 () Unit!7055)

(assert (=> b!230461 (= e!149562 Unit!7057)))

(declare-fun lt!115989 () Unit!7055)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!124 (array!11355 array!11353 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 64) (_ BitVec 32) Int) Unit!7055)

(assert (=> b!230461 (= lt!115989 (lemmaArrayContainsKeyThenInListMap!124 (_keys!6347 thiss!1504) (_values!4276 thiss!1504) (mask!10185 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4293 thiss!1504)))))

(assert (=> b!230461 false))

(declare-fun b!230462 () Bool)

(declare-fun res!113350 () Bool)

(declare-fun e!149570 () Bool)

(assert (=> b!230462 (=> (not res!113350) (not e!149570))))

(assert (=> b!230462 (= res!113350 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10252 () Bool)

(declare-fun mapRes!10252 () Bool)

(declare-fun tp!21721 () Bool)

(declare-fun e!149558 () Bool)

(assert (=> mapNonEmpty!10252 (= mapRes!10252 (and tp!21721 e!149558))))

(declare-fun mapKey!10252 () (_ BitVec 32))

(declare-fun mapRest!10252 () (Array (_ BitVec 32) ValueCell!2684))

(declare-fun mapValue!10252 () ValueCell!2684)

(assert (=> mapNonEmpty!10252 (= (arr!5396 (_values!4276 thiss!1504)) (store mapRest!10252 mapKey!10252 mapValue!10252))))

(declare-fun res!113351 () Bool)

(assert (=> start!22126 (=> (not res!113351) (not e!149570))))

(declare-fun valid!1301 (LongMapFixedSize!3268) Bool)

(assert (=> start!22126 (= res!113351 (valid!1301 thiss!1504))))

(assert (=> start!22126 e!149570))

(declare-fun e!149565 () Bool)

(assert (=> start!22126 e!149565))

(assert (=> start!22126 true))

(declare-fun tp_is_empty!6055 () Bool)

(assert (=> start!22126 tp_is_empty!6055))

(declare-fun c!38253 () Bool)

(declare-fun call!21414 () Bool)

(declare-fun bm!21410 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21410 (= call!21414 (inRange!0 (ite c!38253 (index!5918 lt!115992) (index!5921 lt!115992)) (mask!10185 thiss!1504)))))

(declare-fun bm!21411 () Bool)

(declare-fun call!21413 () Bool)

(declare-fun arrayContainsKey!0 (array!11355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21411 (= call!21413 (arrayContainsKey!0 (_keys!6347 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230463 () Bool)

(declare-fun res!113346 () Bool)

(assert (=> b!230463 (= res!113346 (= (select (arr!5397 (_keys!6347 thiss!1504)) (index!5921 lt!115992)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!149567 () Bool)

(assert (=> b!230463 (=> (not res!113346) (not e!149567))))

(declare-fun mapIsEmpty!10252 () Bool)

(assert (=> mapIsEmpty!10252 mapRes!10252))

(declare-fun b!230464 () Bool)

(declare-fun e!149568 () Unit!7055)

(declare-fun lt!115999 () Unit!7055)

(assert (=> b!230464 (= e!149568 lt!115999)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!307 (array!11355 array!11353 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 64) Int) Unit!7055)

(assert (=> b!230464 (= lt!115999 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!307 (_keys!6347 thiss!1504) (_values!4276 thiss!1504) (mask!10185 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) key!932 (defaultEntry!4293 thiss!1504)))))

(assert (=> b!230464 (= c!38253 (is-MissingZero!937 lt!115992))))

(declare-fun e!149560 () Bool)

(assert (=> b!230464 e!149560))

(declare-fun e!149566 () Bool)

(declare-fun array_inv!3559 (array!11355) Bool)

(declare-fun array_inv!3560 (array!11353) Bool)

(assert (=> b!230465 (= e!149565 (and tp!21720 tp_is_empty!6055 (array_inv!3559 (_keys!6347 thiss!1504)) (array_inv!3560 (_values!4276 thiss!1504)) e!149566))))

(declare-fun b!230466 () Bool)

(assert (=> b!230466 (= e!149558 tp_is_empty!6055)))

(declare-fun b!230467 () Bool)

(declare-fun Unit!7058 () Unit!7055)

(assert (=> b!230467 (= e!149562 Unit!7058)))

(declare-fun b!230468 () Bool)

(declare-fun e!149559 () Bool)

(assert (=> b!230468 (= e!149559 (is-Undefined!937 lt!115992))))

(declare-fun b!230469 () Bool)

(assert (=> b!230469 (= e!149569 (not call!21413))))

(declare-fun b!230470 () Bool)

(assert (=> b!230470 (= e!149559 e!149567)))

(declare-fun res!113352 () Bool)

(assert (=> b!230470 (= res!113352 call!21414)))

(assert (=> b!230470 (=> (not res!113352) (not e!149567))))

(declare-fun b!230471 () Bool)

(declare-fun e!149557 () Bool)

(assert (=> b!230471 (= e!149557 (not true))))

(declare-fun lt!115995 () array!11355)

(assert (=> b!230471 (arrayContainsKey!0 lt!115995 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!115994 () Unit!7055)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11355 (_ BitVec 64) (_ BitVec 32)) Unit!7055)

(assert (=> b!230471 (= lt!115994 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!115995 key!932 index!297))))

(declare-fun v!346 () V!7721)

(declare-datatypes ((tuple2!4532 0))(
  ( (tuple2!4533 (_1!2277 (_ BitVec 64)) (_2!2277 V!7721)) )
))
(declare-datatypes ((List!3455 0))(
  ( (Nil!3452) (Cons!3451 (h!4099 tuple2!4532) (t!8414 List!3455)) )
))
(declare-datatypes ((ListLongMap!3445 0))(
  ( (ListLongMap!3446 (toList!1738 List!3455)) )
))
(declare-fun lt!115993 () ListLongMap!3445)

(declare-fun +!606 (ListLongMap!3445 tuple2!4532) ListLongMap!3445)

(declare-fun getCurrentListMap!1266 (array!11355 array!11353 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 32) Int) ListLongMap!3445)

(assert (=> b!230471 (= (+!606 lt!115993 (tuple2!4533 key!932 v!346)) (getCurrentListMap!1266 lt!115995 (array!11354 (store (arr!5396 (_values!4276 thiss!1504)) index!297 (ValueCellFull!2684 v!346)) (size!5729 (_values!4276 thiss!1504))) (mask!10185 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4293 thiss!1504)))))

(declare-fun lt!115998 () Unit!7055)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!60 (array!11355 array!11353 (_ BitVec 32) (_ BitVec 32) V!7721 V!7721 (_ BitVec 32) (_ BitVec 64) V!7721 Int) Unit!7055)

(assert (=> b!230471 (= lt!115998 (lemmaAddValidKeyToArrayThenAddPairToListMap!60 (_keys!6347 thiss!1504) (_values!4276 thiss!1504) (mask!10185 thiss!1504) (extraKeys!4030 thiss!1504) (zeroValue!4134 thiss!1504) (minValue!4134 thiss!1504) index!297 key!932 v!346 (defaultEntry!4293 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11355 (_ BitVec 32)) Bool)

(assert (=> b!230471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115995 (mask!10185 thiss!1504))))

(declare-fun lt!115997 () Unit!7055)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11355 (_ BitVec 32) (_ BitVec 32)) Unit!7055)

(assert (=> b!230471 (= lt!115997 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6347 thiss!1504) index!297 (mask!10185 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11355 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230471 (= (arrayCountValidKeys!0 lt!115995 #b00000000000000000000000000000000 (size!5730 (_keys!6347 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6347 thiss!1504) #b00000000000000000000000000000000 (size!5730 (_keys!6347 thiss!1504)))))))

(declare-fun lt!115990 () Unit!7055)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11355 (_ BitVec 32) (_ BitVec 64)) Unit!7055)

(assert (=> b!230471 (= lt!115990 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6347 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3456 0))(
  ( (Nil!3453) (Cons!3452 (h!4100 (_ BitVec 64)) (t!8415 List!3456)) )
))
(declare-fun arrayNoDuplicates!0 (array!11355 (_ BitVec 32) List!3456) Bool)

(assert (=> b!230471 (arrayNoDuplicates!0 lt!115995 #b00000000000000000000000000000000 Nil!3453)))

(assert (=> b!230471 (= lt!115995 (array!11356 (store (arr!5397 (_keys!6347 thiss!1504)) index!297 key!932) (size!5730 (_keys!6347 thiss!1504))))))

(declare-fun lt!116000 () Unit!7055)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11355 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3456) Unit!7055)

(assert (=> b!230471 (= lt!116000 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6347 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3453))))

(declare-fun lt!115996 () Unit!7055)

(assert (=> b!230471 (= lt!115996 e!149562)))

(declare-fun c!38255 () Bool)

(assert (=> b!230471 (= c!38255 (arrayContainsKey!0 (_keys!6347 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230472 () Bool)

(declare-fun e!149561 () Bool)

(assert (=> b!230472 (= e!149566 (and e!149561 mapRes!10252))))

(declare-fun condMapEmpty!10252 () Bool)

(declare-fun mapDefault!10252 () ValueCell!2684)

