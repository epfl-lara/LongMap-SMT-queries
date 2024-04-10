; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22150 () Bool)

(assert start!22150)

(declare-fun b!231188 () Bool)

(declare-fun b_free!6217 () Bool)

(declare-fun b_next!6217 () Bool)

(assert (=> b!231188 (= b_free!6217 (not b_next!6217))))

(declare-fun tp!21792 () Bool)

(declare-fun b_and!13115 () Bool)

(assert (=> b!231188 (= tp!21792 b_and!13115)))

(declare-fun bm!21482 () Bool)

(declare-fun call!21485 () Bool)

(declare-datatypes ((V!7753 0))(
  ( (V!7754 (val!3084 Int)) )
))
(declare-datatypes ((ValueCell!2696 0))(
  ( (ValueCellFull!2696 (v!5104 V!7753)) (EmptyCell!2696) )
))
(declare-datatypes ((array!11401 0))(
  ( (array!11402 (arr!5420 (Array (_ BitVec 32) ValueCell!2696)) (size!5753 (_ BitVec 32))) )
))
(declare-datatypes ((array!11403 0))(
  ( (array!11404 (arr!5421 (Array (_ BitVec 32) (_ BitVec 64))) (size!5754 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3292 0))(
  ( (LongMapFixedSize!3293 (defaultEntry!4305 Int) (mask!10205 (_ BitVec 32)) (extraKeys!4042 (_ BitVec 32)) (zeroValue!4146 V!7753) (minValue!4146 V!7753) (_size!1695 (_ BitVec 32)) (_keys!6359 array!11403) (_values!4288 array!11401) (_vacant!1695 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3292)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21482 (= call!21485 (arrayContainsKey!0 (_keys!6359 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10288 () Bool)

(declare-fun mapRes!10288 () Bool)

(assert (=> mapIsEmpty!10288 mapRes!10288))

(declare-fun b!231180 () Bool)

(declare-fun res!113639 () Bool)

(declare-fun e!150071 () Bool)

(assert (=> b!231180 (=> (not res!113639) (not e!150071))))

(declare-fun call!21486 () Bool)

(assert (=> b!231180 (= res!113639 call!21486)))

(declare-fun e!150069 () Bool)

(assert (=> b!231180 (= e!150069 e!150071)))

(declare-fun b!231181 () Bool)

(declare-fun e!150067 () Bool)

(assert (=> b!231181 (= e!150067 (not true))))

(declare-fun lt!116491 () array!11403)

(declare-fun index!297 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!11403 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231181 (= (arrayCountValidKeys!0 lt!116491 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-datatypes ((Unit!7103 0))(
  ( (Unit!7104) )
))
(declare-fun lt!116496 () Unit!7103)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11403 (_ BitVec 32)) Unit!7103)

(assert (=> b!231181 (= lt!116496 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116491 index!297))))

(assert (=> b!231181 (arrayContainsKey!0 lt!116491 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116492 () Unit!7103)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11403 (_ BitVec 64) (_ BitVec 32)) Unit!7103)

(assert (=> b!231181 (= lt!116492 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116491 key!932 index!297))))

(declare-datatypes ((tuple2!4550 0))(
  ( (tuple2!4551 (_1!2286 (_ BitVec 64)) (_2!2286 V!7753)) )
))
(declare-datatypes ((List!3470 0))(
  ( (Nil!3467) (Cons!3466 (h!4114 tuple2!4550) (t!8429 List!3470)) )
))
(declare-datatypes ((ListLongMap!3463 0))(
  ( (ListLongMap!3464 (toList!1747 List!3470)) )
))
(declare-fun lt!116495 () ListLongMap!3463)

(declare-fun v!346 () V!7753)

(declare-fun +!612 (ListLongMap!3463 tuple2!4550) ListLongMap!3463)

(declare-fun getCurrentListMap!1275 (array!11403 array!11401 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 32) Int) ListLongMap!3463)

(assert (=> b!231181 (= (+!612 lt!116495 (tuple2!4551 key!932 v!346)) (getCurrentListMap!1275 lt!116491 (array!11402 (store (arr!5420 (_values!4288 thiss!1504)) index!297 (ValueCellFull!2696 v!346)) (size!5753 (_values!4288 thiss!1504))) (mask!10205 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4305 thiss!1504)))))

(declare-fun lt!116485 () Unit!7103)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!66 (array!11403 array!11401 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 32) (_ BitVec 64) V!7753 Int) Unit!7103)

(assert (=> b!231181 (= lt!116485 (lemmaAddValidKeyToArrayThenAddPairToListMap!66 (_keys!6359 thiss!1504) (_values!4288 thiss!1504) (mask!10205 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) index!297 key!932 v!346 (defaultEntry!4305 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11403 (_ BitVec 32)) Bool)

(assert (=> b!231181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116491 (mask!10205 thiss!1504))))

(declare-fun lt!116487 () Unit!7103)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11403 (_ BitVec 32) (_ BitVec 32)) Unit!7103)

(assert (=> b!231181 (= lt!116487 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6359 thiss!1504) index!297 (mask!10205 thiss!1504)))))

(assert (=> b!231181 (= (arrayCountValidKeys!0 lt!116491 #b00000000000000000000000000000000 (size!5754 (_keys!6359 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6359 thiss!1504) #b00000000000000000000000000000000 (size!5754 (_keys!6359 thiss!1504)))))))

(declare-fun lt!116490 () Unit!7103)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11403 (_ BitVec 32) (_ BitVec 64)) Unit!7103)

(assert (=> b!231181 (= lt!116490 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6359 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3471 0))(
  ( (Nil!3468) (Cons!3467 (h!4115 (_ BitVec 64)) (t!8430 List!3471)) )
))
(declare-fun arrayNoDuplicates!0 (array!11403 (_ BitVec 32) List!3471) Bool)

(assert (=> b!231181 (arrayNoDuplicates!0 lt!116491 #b00000000000000000000000000000000 Nil!3468)))

(assert (=> b!231181 (= lt!116491 (array!11404 (store (arr!5421 (_keys!6359 thiss!1504)) index!297 key!932) (size!5754 (_keys!6359 thiss!1504))))))

(declare-fun lt!116497 () Unit!7103)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11403 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3471) Unit!7103)

(assert (=> b!231181 (= lt!116497 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6359 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3468))))

(declare-fun lt!116489 () Unit!7103)

(declare-fun e!150074 () Unit!7103)

(assert (=> b!231181 (= lt!116489 e!150074)))

(declare-fun c!38400 () Bool)

(assert (=> b!231181 (= c!38400 (arrayContainsKey!0 (_keys!6359 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231182 () Bool)

(declare-fun c!38399 () Bool)

(declare-datatypes ((SeekEntryResult!948 0))(
  ( (MissingZero!948 (index!5962 (_ BitVec 32))) (Found!948 (index!5963 (_ BitVec 32))) (Intermediate!948 (undefined!1760 Bool) (index!5964 (_ BitVec 32)) (x!23488 (_ BitVec 32))) (Undefined!948) (MissingVacant!948 (index!5965 (_ BitVec 32))) )
))
(declare-fun lt!116488 () SeekEntryResult!948)

(assert (=> b!231182 (= c!38399 (is-MissingVacant!948 lt!116488))))

(declare-fun e!150070 () Bool)

(assert (=> b!231182 (= e!150069 e!150070)))

(declare-fun b!231183 () Bool)

(declare-fun Unit!7105 () Unit!7103)

(assert (=> b!231183 (= e!150074 Unit!7105)))

(declare-fun lt!116498 () Unit!7103)

(declare-fun lemmaArrayContainsKeyThenInListMap!132 (array!11403 array!11401 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 64) (_ BitVec 32) Int) Unit!7103)

(assert (=> b!231183 (= lt!116498 (lemmaArrayContainsKeyThenInListMap!132 (_keys!6359 thiss!1504) (_values!4288 thiss!1504) (mask!10205 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4305 thiss!1504)))))

(assert (=> b!231183 false))

(declare-fun b!231184 () Bool)

(declare-fun e!150065 () Bool)

(declare-fun e!150062 () Bool)

(assert (=> b!231184 (= e!150065 e!150062)))

(declare-fun res!113635 () Bool)

(assert (=> b!231184 (=> (not res!113635) (not e!150062))))

(assert (=> b!231184 (= res!113635 (or (= lt!116488 (MissingZero!948 index!297)) (= lt!116488 (MissingVacant!948 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11403 (_ BitVec 32)) SeekEntryResult!948)

(assert (=> b!231184 (= lt!116488 (seekEntryOrOpen!0 key!932 (_keys!6359 thiss!1504) (mask!10205 thiss!1504)))))

(declare-fun b!231185 () Bool)

(declare-fun res!113638 () Bool)

(assert (=> b!231185 (=> (not res!113638) (not e!150065))))

(assert (=> b!231185 (= res!113638 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231186 () Bool)

(declare-fun e!150063 () Unit!7103)

(declare-fun Unit!7106 () Unit!7103)

(assert (=> b!231186 (= e!150063 Unit!7106)))

(declare-fun lt!116486 () Unit!7103)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!298 (array!11403 array!11401 (_ BitVec 32) (_ BitVec 32) V!7753 V!7753 (_ BitVec 64) Int) Unit!7103)

(assert (=> b!231186 (= lt!116486 (lemmaInListMapThenSeekEntryOrOpenFindsIt!298 (_keys!6359 thiss!1504) (_values!4288 thiss!1504) (mask!10205 thiss!1504) (extraKeys!4042 thiss!1504) (zeroValue!4146 thiss!1504) (minValue!4146 thiss!1504) key!932 (defaultEntry!4305 thiss!1504)))))

(assert (=> b!231186 false))

(declare-fun bm!21483 () Bool)

(declare-fun c!38398 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21483 (= call!21486 (inRange!0 (ite c!38398 (index!5962 lt!116488) (index!5965 lt!116488)) (mask!10205 thiss!1504)))))

(declare-fun b!231187 () Bool)

(declare-fun e!150061 () Bool)

(declare-fun tp_is_empty!6079 () Bool)

(assert (=> b!231187 (= e!150061 tp_is_empty!6079)))

(declare-fun res!113640 () Bool)

(assert (=> start!22150 (=> (not res!113640) (not e!150065))))

(declare-fun valid!1308 (LongMapFixedSize!3292) Bool)

(assert (=> start!22150 (= res!113640 (valid!1308 thiss!1504))))

(assert (=> start!22150 e!150065))

(declare-fun e!150068 () Bool)

(assert (=> start!22150 e!150068))

(assert (=> start!22150 true))

(assert (=> start!22150 tp_is_empty!6079))

(declare-fun e!150073 () Bool)

(declare-fun array_inv!3575 (array!11403) Bool)

(declare-fun array_inv!3576 (array!11401) Bool)

(assert (=> b!231188 (= e!150068 (and tp!21792 tp_is_empty!6079 (array_inv!3575 (_keys!6359 thiss!1504)) (array_inv!3576 (_values!4288 thiss!1504)) e!150073))))

(declare-fun b!231189 () Bool)

(declare-fun Unit!7107 () Unit!7103)

(assert (=> b!231189 (= e!150074 Unit!7107)))

(declare-fun b!231190 () Bool)

(assert (=> b!231190 (= e!150071 (not call!21485))))

(declare-fun b!231191 () Bool)

(declare-fun e!150064 () Bool)

(assert (=> b!231191 (= e!150064 tp_is_empty!6079)))

(declare-fun b!231192 () Bool)

(declare-fun e!150072 () Bool)

(assert (=> b!231192 (= e!150070 e!150072)))

(declare-fun res!113636 () Bool)

(assert (=> b!231192 (= res!113636 call!21486)))

(assert (=> b!231192 (=> (not res!113636) (not e!150072))))

(declare-fun b!231193 () Bool)

(declare-fun res!113637 () Bool)

(assert (=> b!231193 (=> (not res!113637) (not e!150071))))

(assert (=> b!231193 (= res!113637 (= (select (arr!5421 (_keys!6359 thiss!1504)) (index!5962 lt!116488)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231194 () Bool)

(assert (=> b!231194 (= e!150073 (and e!150061 mapRes!10288))))

(declare-fun condMapEmpty!10288 () Bool)

(declare-fun mapDefault!10288 () ValueCell!2696)

