; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24470 () Bool)

(assert start!24470)

(declare-fun b!256366 () Bool)

(declare-fun b_free!6719 () Bool)

(declare-fun b_next!6719 () Bool)

(assert (=> b!256366 (= b_free!6719 (not b_next!6719))))

(declare-fun tp!23456 () Bool)

(declare-fun b_and!13777 () Bool)

(assert (=> b!256366 (= tp!23456 b_and!13777)))

(declare-fun b!256356 () Bool)

(declare-fun e!166192 () Bool)

(declare-datatypes ((SeekEntryResult!1163 0))(
  ( (MissingZero!1163 (index!6822 (_ BitVec 32))) (Found!1163 (index!6823 (_ BitVec 32))) (Intermediate!1163 (undefined!1975 Bool) (index!6824 (_ BitVec 32)) (x!24959 (_ BitVec 32))) (Undefined!1163) (MissingVacant!1163 (index!6825 (_ BitVec 32))) )
))
(declare-fun lt!128709 () SeekEntryResult!1163)

(assert (=> b!256356 (= e!166192 (is-Undefined!1163 lt!128709))))

(declare-fun mapIsEmpty!11199 () Bool)

(declare-fun mapRes!11199 () Bool)

(assert (=> mapIsEmpty!11199 mapRes!11199))

(declare-fun b!256357 () Bool)

(declare-fun res!125422 () Bool)

(declare-datatypes ((V!8421 0))(
  ( (V!8422 (val!3335 Int)) )
))
(declare-datatypes ((ValueCell!2947 0))(
  ( (ValueCellFull!2947 (v!5421 V!8421)) (EmptyCell!2947) )
))
(declare-datatypes ((array!12501 0))(
  ( (array!12502 (arr!5922 (Array (_ BitVec 32) ValueCell!2947)) (size!6269 (_ BitVec 32))) )
))
(declare-datatypes ((array!12503 0))(
  ( (array!12504 (arr!5923 (Array (_ BitVec 32) (_ BitVec 64))) (size!6270 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3794 0))(
  ( (LongMapFixedSize!3795 (defaultEntry!4730 Int) (mask!11002 (_ BitVec 32)) (extraKeys!4467 (_ BitVec 32)) (zeroValue!4571 V!8421) (minValue!4571 V!8421) (_size!1946 (_ BitVec 32)) (_keys!6892 array!12503) (_values!4713 array!12501) (_vacant!1946 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3794)

(assert (=> b!256357 (= res!125422 (= (select (arr!5923 (_keys!6892 thiss!1504)) (index!6825 lt!128709)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166191 () Bool)

(assert (=> b!256357 (=> (not res!125422) (not e!166191))))

(declare-fun b!256358 () Bool)

(declare-datatypes ((Unit!7957 0))(
  ( (Unit!7958) )
))
(declare-fun e!166179 () Unit!7957)

(declare-fun Unit!7959 () Unit!7957)

(assert (=> b!256358 (= e!166179 Unit!7959)))

(declare-fun lt!128711 () Unit!7957)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!234 (array!12503 array!12501 (_ BitVec 32) (_ BitVec 32) V!8421 V!8421 (_ BitVec 64) (_ BitVec 32) Int) Unit!7957)

(assert (=> b!256358 (= lt!128711 (lemmaArrayContainsKeyThenInListMap!234 (_keys!6892 thiss!1504) (_values!4713 thiss!1504) (mask!11002 thiss!1504) (extraKeys!4467 thiss!1504) (zeroValue!4571 thiss!1504) (minValue!4571 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4730 thiss!1504)))))

(assert (=> b!256358 false))

(declare-fun b!256359 () Bool)

(declare-fun res!125423 () Bool)

(declare-fun e!166180 () Bool)

(assert (=> b!256359 (=> (not res!125423) (not e!166180))))

(assert (=> b!256359 (= res!125423 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!256360 () Bool)

(declare-fun res!125416 () Bool)

(declare-fun e!166187 () Bool)

(assert (=> b!256360 (=> (not res!125416) (not e!166187))))

(declare-fun call!24278 () Bool)

(assert (=> b!256360 (= res!125416 call!24278)))

(declare-fun e!166182 () Bool)

(assert (=> b!256360 (= e!166182 e!166187)))

(declare-fun bm!24275 () Bool)

(declare-fun call!24279 () Bool)

(declare-fun arrayContainsKey!0 (array!12503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24275 (= call!24279 (arrayContainsKey!0 (_keys!6892 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256361 () Bool)

(declare-fun e!166188 () Bool)

(declare-fun e!166178 () Bool)

(assert (=> b!256361 (= e!166188 (not e!166178))))

(declare-fun res!125424 () Bool)

(assert (=> b!256361 (=> res!125424 e!166178)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!256361 (= res!125424 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6270 (_keys!6892 thiss!1504))) (bvsge (size!6270 (_keys!6892 thiss!1504)) #b01111111111111111111111111111111)))))

(declare-fun v!346 () V!8421)

(declare-fun lt!128715 () array!12503)

(declare-datatypes ((tuple2!4910 0))(
  ( (tuple2!4911 (_1!2466 (_ BitVec 64)) (_2!2466 V!8421)) )
))
(declare-datatypes ((List!3790 0))(
  ( (Nil!3787) (Cons!3786 (h!4448 tuple2!4910) (t!8845 List!3790)) )
))
(declare-datatypes ((ListLongMap!3823 0))(
  ( (ListLongMap!3824 (toList!1927 List!3790)) )
))
(declare-fun lt!128707 () ListLongMap!3823)

(declare-fun +!682 (ListLongMap!3823 tuple2!4910) ListLongMap!3823)

(declare-fun getCurrentListMap!1455 (array!12503 array!12501 (_ BitVec 32) (_ BitVec 32) V!8421 V!8421 (_ BitVec 32) Int) ListLongMap!3823)

(assert (=> b!256361 (= (+!682 lt!128707 (tuple2!4911 key!932 v!346)) (getCurrentListMap!1455 lt!128715 (array!12502 (store (arr!5922 (_values!4713 thiss!1504)) index!297 (ValueCellFull!2947 v!346)) (size!6269 (_values!4713 thiss!1504))) (mask!11002 thiss!1504) (extraKeys!4467 thiss!1504) (zeroValue!4571 thiss!1504) (minValue!4571 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4730 thiss!1504)))))

(declare-fun lt!128706 () Unit!7957)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!92 (array!12503 array!12501 (_ BitVec 32) (_ BitVec 32) V!8421 V!8421 (_ BitVec 32) (_ BitVec 64) V!8421 Int) Unit!7957)

(assert (=> b!256361 (= lt!128706 (lemmaAddValidKeyToArrayThenAddPairToListMap!92 (_keys!6892 thiss!1504) (_values!4713 thiss!1504) (mask!11002 thiss!1504) (extraKeys!4467 thiss!1504) (zeroValue!4571 thiss!1504) (minValue!4571 thiss!1504) index!297 key!932 v!346 (defaultEntry!4730 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12503 (_ BitVec 32)) Bool)

(assert (=> b!256361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!128715 (mask!11002 thiss!1504))))

(declare-fun lt!128714 () Unit!7957)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12503 (_ BitVec 32) (_ BitVec 32)) Unit!7957)

(assert (=> b!256361 (= lt!128714 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6892 thiss!1504) index!297 (mask!11002 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12503 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!256361 (= (arrayCountValidKeys!0 lt!128715 #b00000000000000000000000000000000 (size!6270 (_keys!6892 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6892 thiss!1504) #b00000000000000000000000000000000 (size!6270 (_keys!6892 thiss!1504)))))))

(declare-fun lt!128708 () Unit!7957)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12503 (_ BitVec 32) (_ BitVec 64)) Unit!7957)

(assert (=> b!256361 (= lt!128708 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6892 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3791 0))(
  ( (Nil!3788) (Cons!3787 (h!4449 (_ BitVec 64)) (t!8846 List!3791)) )
))
(declare-fun arrayNoDuplicates!0 (array!12503 (_ BitVec 32) List!3791) Bool)

(assert (=> b!256361 (arrayNoDuplicates!0 lt!128715 #b00000000000000000000000000000000 Nil!3788)))

(assert (=> b!256361 (= lt!128715 (array!12504 (store (arr!5923 (_keys!6892 thiss!1504)) index!297 key!932) (size!6270 (_keys!6892 thiss!1504))))))

(declare-fun lt!128705 () Unit!7957)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12503 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3791) Unit!7957)

(assert (=> b!256361 (= lt!128705 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6892 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3788))))

(declare-fun lt!128713 () Unit!7957)

(assert (=> b!256361 (= lt!128713 e!166179)))

(declare-fun c!43328 () Bool)

(assert (=> b!256361 (= c!43328 (arrayContainsKey!0 (_keys!6892 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256362 () Bool)

(declare-fun res!125421 () Bool)

(assert (=> b!256362 (=> (not res!125421) (not e!166187))))

(assert (=> b!256362 (= res!125421 (= (select (arr!5923 (_keys!6892 thiss!1504)) (index!6822 lt!128709)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256363 () Bool)

(declare-fun e!166183 () Bool)

(declare-fun tp_is_empty!6581 () Bool)

(assert (=> b!256363 (= e!166183 tp_is_empty!6581)))

(declare-fun b!256364 () Bool)

(assert (=> b!256364 (= e!166178 (arrayContainsKey!0 lt!128715 key!932 index!297))))

(declare-fun b!256365 () Bool)

(assert (=> b!256365 (= e!166192 e!166191)))

(declare-fun res!125419 () Bool)

(assert (=> b!256365 (= res!125419 call!24278)))

(assert (=> b!256365 (=> (not res!125419) (not e!166191))))

(declare-fun e!166190 () Bool)

(declare-fun e!166185 () Bool)

(declare-fun array_inv!3915 (array!12503) Bool)

(declare-fun array_inv!3916 (array!12501) Bool)

(assert (=> b!256366 (= e!166185 (and tp!23456 tp_is_empty!6581 (array_inv!3915 (_keys!6892 thiss!1504)) (array_inv!3916 (_values!4713 thiss!1504)) e!166190))))

(declare-fun b!256367 () Bool)

(assert (=> b!256367 (= e!166187 (not call!24279))))

(declare-fun b!256368 () Bool)

(declare-fun c!43327 () Bool)

(assert (=> b!256368 (= c!43327 (is-MissingVacant!1163 lt!128709))))

(assert (=> b!256368 (= e!166182 e!166192)))

(declare-fun bm!24276 () Bool)

(declare-fun c!43330 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!24276 (= call!24278 (inRange!0 (ite c!43330 (index!6822 lt!128709) (index!6825 lt!128709)) (mask!11002 thiss!1504)))))

(declare-fun b!256369 () Bool)

(declare-fun e!166184 () Unit!7957)

(declare-fun Unit!7960 () Unit!7957)

(assert (=> b!256369 (= e!166184 Unit!7960)))

(declare-fun lt!128710 () Unit!7957)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!428 (array!12503 array!12501 (_ BitVec 32) (_ BitVec 32) V!8421 V!8421 (_ BitVec 64) Int) Unit!7957)

(assert (=> b!256369 (= lt!128710 (lemmaInListMapThenSeekEntryOrOpenFindsIt!428 (_keys!6892 thiss!1504) (_values!4713 thiss!1504) (mask!11002 thiss!1504) (extraKeys!4467 thiss!1504) (zeroValue!4571 thiss!1504) (minValue!4571 thiss!1504) key!932 (defaultEntry!4730 thiss!1504)))))

(assert (=> b!256369 false))

(declare-fun b!256370 () Bool)

(declare-fun Unit!7961 () Unit!7957)

(assert (=> b!256370 (= e!166179 Unit!7961)))

(declare-fun b!256371 () Bool)

(assert (=> b!256371 (= e!166191 (not call!24279))))

(declare-fun b!256372 () Bool)

(assert (=> b!256372 (= e!166190 (and e!166183 mapRes!11199))))

(declare-fun condMapEmpty!11199 () Bool)

(declare-fun mapDefault!11199 () ValueCell!2947)

