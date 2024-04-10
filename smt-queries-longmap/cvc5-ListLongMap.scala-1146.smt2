; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23878 () Bool)

(assert start!23878)

(declare-fun b!250332 () Bool)

(declare-fun b_free!6625 () Bool)

(declare-fun b_next!6625 () Bool)

(assert (=> b!250332 (= b_free!6625 (not b_next!6625))))

(declare-fun tp!23139 () Bool)

(declare-fun b_and!13645 () Bool)

(assert (=> b!250332 (= tp!23139 b_and!13645)))

(declare-fun b!250314 () Bool)

(declare-fun e!162339 () Bool)

(declare-fun e!162347 () Bool)

(assert (=> b!250314 (= e!162339 (not e!162347))))

(declare-fun res!122605 () Bool)

(assert (=> b!250314 (=> res!122605 e!162347)))

(declare-datatypes ((V!8297 0))(
  ( (V!8298 (val!3288 Int)) )
))
(declare-datatypes ((ValueCell!2900 0))(
  ( (ValueCellFull!2900 (v!5353 V!8297)) (EmptyCell!2900) )
))
(declare-datatypes ((array!12291 0))(
  ( (array!12292 (arr!5828 (Array (_ BitVec 32) ValueCell!2900)) (size!6173 (_ BitVec 32))) )
))
(declare-datatypes ((array!12293 0))(
  ( (array!12294 (arr!5829 (Array (_ BitVec 32) (_ BitVec 64))) (size!6174 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3700 0))(
  ( (LongMapFixedSize!3701 (defaultEntry!4627 Int) (mask!10810 (_ BitVec 32)) (extraKeys!4364 (_ BitVec 32)) (zeroValue!4468 V!8297) (minValue!4468 V!8297) (_size!1899 (_ BitVec 32)) (_keys!6763 array!12293) (_values!4610 array!12291) (_vacant!1899 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3700)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!250314 (= res!122605 (not (validMask!0 (mask!10810 thiss!1504))))))

(declare-fun lt!125409 () array!12293)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12293 (_ BitVec 32)) Bool)

(assert (=> b!250314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!125409 (mask!10810 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((Unit!7745 0))(
  ( (Unit!7746) )
))
(declare-fun lt!125408 () Unit!7745)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12293 (_ BitVec 32) (_ BitVec 32)) Unit!7745)

(assert (=> b!250314 (= lt!125408 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6763 thiss!1504) index!297 (mask!10810 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12293 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!250314 (= (arrayCountValidKeys!0 lt!125409 #b00000000000000000000000000000000 (size!6174 (_keys!6763 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6763 thiss!1504) #b00000000000000000000000000000000 (size!6174 (_keys!6763 thiss!1504)))))))

(declare-fun lt!125411 () Unit!7745)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12293 (_ BitVec 32) (_ BitVec 64)) Unit!7745)

(assert (=> b!250314 (= lt!125411 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6763 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3721 0))(
  ( (Nil!3718) (Cons!3717 (h!4377 (_ BitVec 64)) (t!8754 List!3721)) )
))
(declare-fun arrayNoDuplicates!0 (array!12293 (_ BitVec 32) List!3721) Bool)

(assert (=> b!250314 (arrayNoDuplicates!0 lt!125409 #b00000000000000000000000000000000 Nil!3718)))

(assert (=> b!250314 (= lt!125409 (array!12294 (store (arr!5829 (_keys!6763 thiss!1504)) index!297 key!932) (size!6174 (_keys!6763 thiss!1504))))))

(declare-fun lt!125407 () Unit!7745)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3721) Unit!7745)

(assert (=> b!250314 (= lt!125407 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6763 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3718))))

(declare-fun lt!125406 () Unit!7745)

(declare-fun e!162349 () Unit!7745)

(assert (=> b!250314 (= lt!125406 e!162349)))

(declare-fun c!42054 () Bool)

(declare-fun arrayContainsKey!0 (array!12293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!250314 (= c!42054 (arrayContainsKey!0 (_keys!6763 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!250315 () Bool)

(declare-fun res!122602 () Bool)

(declare-datatypes ((SeekEntryResult!1120 0))(
  ( (MissingZero!1120 (index!6650 (_ BitVec 32))) (Found!1120 (index!6651 (_ BitVec 32))) (Intermediate!1120 (undefined!1932 Bool) (index!6652 (_ BitVec 32)) (x!24670 (_ BitVec 32))) (Undefined!1120) (MissingVacant!1120 (index!6653 (_ BitVec 32))) )
))
(declare-fun lt!125410 () SeekEntryResult!1120)

(assert (=> b!250315 (= res!122602 (= (select (arr!5829 (_keys!6763 thiss!1504)) (index!6653 lt!125410)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!162338 () Bool)

(assert (=> b!250315 (=> (not res!122602) (not e!162338))))

(declare-fun b!250316 () Bool)

(declare-fun e!162340 () Bool)

(assert (=> b!250316 (= e!162340 e!162338)))

(declare-fun res!122604 () Bool)

(declare-fun call!23518 () Bool)

(assert (=> b!250316 (= res!122604 call!23518)))

(assert (=> b!250316 (=> (not res!122604) (not e!162338))))

(declare-fun b!250317 () Bool)

(declare-fun e!162344 () Unit!7745)

(declare-fun Unit!7747 () Unit!7745)

(assert (=> b!250317 (= e!162344 Unit!7747)))

(declare-fun lt!125413 () Unit!7745)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!397 (array!12293 array!12291 (_ BitVec 32) (_ BitVec 32) V!8297 V!8297 (_ BitVec 64) Int) Unit!7745)

(assert (=> b!250317 (= lt!125413 (lemmaInListMapThenSeekEntryOrOpenFindsIt!397 (_keys!6763 thiss!1504) (_values!4610 thiss!1504) (mask!10810 thiss!1504) (extraKeys!4364 thiss!1504) (zeroValue!4468 thiss!1504) (minValue!4468 thiss!1504) key!932 (defaultEntry!4627 thiss!1504)))))

(assert (=> b!250317 false))

(declare-fun b!250318 () Bool)

(declare-fun res!122601 () Bool)

(declare-fun e!162348 () Bool)

(assert (=> b!250318 (=> (not res!122601) (not e!162348))))

(assert (=> b!250318 (= res!122601 call!23518)))

(declare-fun e!162343 () Bool)

(assert (=> b!250318 (= e!162343 e!162348)))

(declare-fun mapIsEmpty!11023 () Bool)

(declare-fun mapRes!11023 () Bool)

(assert (=> mapIsEmpty!11023 mapRes!11023))

(declare-fun b!250319 () Bool)

(declare-fun call!23519 () Bool)

(assert (=> b!250319 (= e!162338 (not call!23519))))

(declare-fun b!250320 () Bool)

(declare-fun e!162336 () Bool)

(declare-fun e!162350 () Bool)

(assert (=> b!250320 (= e!162336 (and e!162350 mapRes!11023))))

(declare-fun condMapEmpty!11023 () Bool)

(declare-fun mapDefault!11023 () ValueCell!2900)

