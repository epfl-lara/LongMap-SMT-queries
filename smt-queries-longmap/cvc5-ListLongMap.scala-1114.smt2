; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22930 () Bool)

(assert start!22930)

(declare-fun b!239376 () Bool)

(declare-fun b_free!6433 () Bool)

(declare-fun b_next!6433 () Bool)

(assert (=> b!239376 (= b_free!6433 (not b_next!6433))))

(declare-fun tp!22502 () Bool)

(declare-fun b_and!13399 () Bool)

(assert (=> b!239376 (= tp!22502 b_and!13399)))

(declare-fun b!239360 () Bool)

(declare-datatypes ((Unit!7350 0))(
  ( (Unit!7351) )
))
(declare-fun e!155418 () Unit!7350)

(declare-fun Unit!7352 () Unit!7350)

(assert (=> b!239360 (= e!155418 Unit!7352)))

(declare-fun lt!120777 () Unit!7350)

(declare-datatypes ((V!8041 0))(
  ( (V!8042 (val!3192 Int)) )
))
(declare-datatypes ((ValueCell!2804 0))(
  ( (ValueCellFull!2804 (v!5230 V!8041)) (EmptyCell!2804) )
))
(declare-datatypes ((array!11869 0))(
  ( (array!11870 (arr!5636 (Array (_ BitVec 32) ValueCell!2804)) (size!5977 (_ BitVec 32))) )
))
(declare-datatypes ((array!11871 0))(
  ( (array!11872 (arr!5637 (Array (_ BitVec 32) (_ BitVec 64))) (size!5978 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3508 0))(
  ( (LongMapFixedSize!3509 (defaultEntry!4439 Int) (mask!10485 (_ BitVec 32)) (extraKeys!4176 (_ BitVec 32)) (zeroValue!4280 V!8041) (minValue!4280 V!8041) (_size!1803 (_ BitVec 32)) (_keys!6541 array!11871) (_values!4422 array!11869) (_vacant!1803 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3508)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!326 (array!11871 array!11869 (_ BitVec 32) (_ BitVec 32) V!8041 V!8041 (_ BitVec 64) Int) Unit!7350)

(assert (=> b!239360 (= lt!120777 (lemmaInListMapThenSeekEntryOrOpenFindsIt!326 (_keys!6541 thiss!1504) (_values!4422 thiss!1504) (mask!10485 thiss!1504) (extraKeys!4176 thiss!1504) (zeroValue!4280 thiss!1504) (minValue!4280 thiss!1504) key!932 (defaultEntry!4439 thiss!1504)))))

(assert (=> b!239360 false))

(declare-fun b!239361 () Bool)

(declare-fun res!117314 () Bool)

(declare-datatypes ((SeekEntryResult!1031 0))(
  ( (MissingZero!1031 (index!6294 (_ BitVec 32))) (Found!1031 (index!6295 (_ BitVec 32))) (Intermediate!1031 (undefined!1843 Bool) (index!6296 (_ BitVec 32)) (x!24103 (_ BitVec 32))) (Undefined!1031) (MissingVacant!1031 (index!6297 (_ BitVec 32))) )
))
(declare-fun lt!120775 () SeekEntryResult!1031)

(assert (=> b!239361 (= res!117314 (= (select (arr!5637 (_keys!6541 thiss!1504)) (index!6297 lt!120775)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155416 () Bool)

(assert (=> b!239361 (=> (not res!117314) (not e!155416))))

(declare-fun b!239362 () Bool)

(declare-fun e!155420 () Bool)

(declare-fun call!22260 () Bool)

(assert (=> b!239362 (= e!155420 (not call!22260))))

(declare-fun b!239363 () Bool)

(declare-fun c!39901 () Bool)

(assert (=> b!239363 (= c!39901 (is-MissingVacant!1031 lt!120775))))

(declare-fun e!155413 () Bool)

(declare-fun e!155409 () Bool)

(assert (=> b!239363 (= e!155413 e!155409)))

(declare-fun b!239364 () Bool)

(declare-fun res!117313 () Bool)

(declare-fun e!155412 () Bool)

(assert (=> b!239364 (=> (not res!117313) (not e!155412))))

(assert (=> b!239364 (= res!117313 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239365 () Bool)

(declare-fun res!117309 () Bool)

(assert (=> b!239365 (=> (not res!117309) (not e!155420))))

(declare-fun call!22259 () Bool)

(assert (=> b!239365 (= res!117309 call!22259)))

(assert (=> b!239365 (= e!155413 e!155420)))

(declare-fun b!239366 () Bool)

(declare-fun lt!120776 () Unit!7350)

(assert (=> b!239366 (= e!155418 lt!120776)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!342 (array!11871 array!11869 (_ BitVec 32) (_ BitVec 32) V!8041 V!8041 (_ BitVec 64) Int) Unit!7350)

(assert (=> b!239366 (= lt!120776 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!342 (_keys!6541 thiss!1504) (_values!4422 thiss!1504) (mask!10485 thiss!1504) (extraKeys!4176 thiss!1504) (zeroValue!4280 thiss!1504) (minValue!4280 thiss!1504) key!932 (defaultEntry!4439 thiss!1504)))))

(declare-fun c!39902 () Bool)

(assert (=> b!239366 (= c!39902 (is-MissingZero!1031 lt!120775))))

(assert (=> b!239366 e!155413))

(declare-fun b!239367 () Bool)

(declare-fun res!117311 () Bool)

(declare-fun e!155421 () Bool)

(assert (=> b!239367 (=> (not res!117311) (not e!155421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239367 (= res!117311 (validMask!0 (mask!10485 thiss!1504)))))

(declare-fun res!117312 () Bool)

(assert (=> start!22930 (=> (not res!117312) (not e!155412))))

(declare-fun valid!1383 (LongMapFixedSize!3508) Bool)

(assert (=> start!22930 (= res!117312 (valid!1383 thiss!1504))))

(assert (=> start!22930 e!155412))

(declare-fun e!155414 () Bool)

(assert (=> start!22930 e!155414))

(assert (=> start!22930 true))

(declare-fun bm!22256 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22256 (= call!22259 (inRange!0 (ite c!39902 (index!6294 lt!120775) (index!6297 lt!120775)) (mask!10485 thiss!1504)))))

(declare-fun b!239368 () Bool)

(declare-fun e!155417 () Bool)

(declare-fun e!155411 () Bool)

(declare-fun mapRes!10674 () Bool)

(assert (=> b!239368 (= e!155417 (and e!155411 mapRes!10674))))

(declare-fun condMapEmpty!10674 () Bool)

(declare-fun mapDefault!10674 () ValueCell!2804)

