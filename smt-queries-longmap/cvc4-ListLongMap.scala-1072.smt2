; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22118 () Bool)

(assert start!22118)

(declare-fun b!230229 () Bool)

(declare-fun b_free!6185 () Bool)

(declare-fun b_next!6185 () Bool)

(assert (=> b!230229 (= b_free!6185 (not b_next!6185))))

(declare-fun tp!21696 () Bool)

(declare-fun b_and!13083 () Bool)

(assert (=> b!230229 (= tp!21696 b_and!13083)))

(declare-fun b!230220 () Bool)

(declare-fun e!149393 () Bool)

(declare-fun call!21389 () Bool)

(assert (=> b!230220 (= e!149393 (not call!21389))))

(declare-fun b!230221 () Bool)

(declare-fun c!38206 () Bool)

(declare-datatypes ((SeekEntryResult!934 0))(
  ( (MissingZero!934 (index!5906 (_ BitVec 32))) (Found!934 (index!5907 (_ BitVec 32))) (Intermediate!934 (undefined!1746 Bool) (index!5908 (_ BitVec 32)) (x!23426 (_ BitVec 32))) (Undefined!934) (MissingVacant!934 (index!5909 (_ BitVec 32))) )
))
(declare-fun lt!115847 () SeekEntryResult!934)

(assert (=> b!230221 (= c!38206 (is-MissingVacant!934 lt!115847))))

(declare-fun e!149391 () Bool)

(declare-fun e!149392 () Bool)

(assert (=> b!230221 (= e!149391 e!149392)))

(declare-fun b!230222 () Bool)

(declare-fun res!113256 () Bool)

(declare-fun e!149389 () Bool)

(assert (=> b!230222 (=> (not res!113256) (not e!149389))))

(declare-fun call!21390 () Bool)

(assert (=> b!230222 (= res!113256 call!21390)))

(assert (=> b!230222 (= e!149391 e!149389)))

(declare-datatypes ((V!7709 0))(
  ( (V!7710 (val!3068 Int)) )
))
(declare-datatypes ((ValueCell!2680 0))(
  ( (ValueCellFull!2680 (v!5088 V!7709)) (EmptyCell!2680) )
))
(declare-datatypes ((array!11337 0))(
  ( (array!11338 (arr!5388 (Array (_ BitVec 32) ValueCell!2680)) (size!5721 (_ BitVec 32))) )
))
(declare-datatypes ((array!11339 0))(
  ( (array!11340 (arr!5389 (Array (_ BitVec 32) (_ BitVec 64))) (size!5722 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3260 0))(
  ( (LongMapFixedSize!3261 (defaultEntry!4289 Int) (mask!10177 (_ BitVec 32)) (extraKeys!4026 (_ BitVec 32)) (zeroValue!4130 V!7709) (minValue!4130 V!7709) (_size!1679 (_ BitVec 32)) (_keys!6343 array!11339) (_values!4272 array!11337) (_vacant!1679 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3260)

(declare-fun c!38207 () Bool)

(declare-fun bm!21386 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21386 (= call!21390 (inRange!0 (ite c!38207 (index!5906 lt!115847) (index!5909 lt!115847)) (mask!10177 thiss!1504)))))

(declare-fun b!230223 () Bool)

(declare-datatypes ((Unit!7046 0))(
  ( (Unit!7047) )
))
(declare-fun e!149396 () Unit!7046)

(declare-fun Unit!7048 () Unit!7046)

(assert (=> b!230223 (= e!149396 Unit!7048)))

(declare-fun b!230224 () Bool)

(declare-fun e!149397 () Unit!7046)

(declare-fun Unit!7049 () Unit!7046)

(assert (=> b!230224 (= e!149397 Unit!7049)))

(declare-fun lt!115849 () Unit!7046)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!289 (array!11339 array!11337 (_ BitVec 32) (_ BitVec 32) V!7709 V!7709 (_ BitVec 64) Int) Unit!7046)

(assert (=> b!230224 (= lt!115849 (lemmaInListMapThenSeekEntryOrOpenFindsIt!289 (_keys!6343 thiss!1504) (_values!4272 thiss!1504) (mask!10177 thiss!1504) (extraKeys!4026 thiss!1504) (zeroValue!4130 thiss!1504) (minValue!4130 thiss!1504) key!932 (defaultEntry!4289 thiss!1504)))))

(assert (=> b!230224 false))

(declare-fun b!230225 () Bool)

(declare-fun e!149399 () Bool)

(declare-fun e!149400 () Bool)

(assert (=> b!230225 (= e!149399 e!149400)))

(declare-fun res!113252 () Bool)

(assert (=> b!230225 (=> (not res!113252) (not e!149400))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!230225 (= res!113252 (inRange!0 index!297 (mask!10177 thiss!1504)))))

(declare-fun lt!115851 () Unit!7046)

(assert (=> b!230225 (= lt!115851 e!149397)))

(declare-fun c!38205 () Bool)

(declare-datatypes ((tuple2!4528 0))(
  ( (tuple2!4529 (_1!2275 (_ BitVec 64)) (_2!2275 V!7709)) )
))
(declare-datatypes ((List!3451 0))(
  ( (Nil!3448) (Cons!3447 (h!4095 tuple2!4528) (t!8410 List!3451)) )
))
(declare-datatypes ((ListLongMap!3441 0))(
  ( (ListLongMap!3442 (toList!1736 List!3451)) )
))
(declare-fun lt!115843 () ListLongMap!3441)

(declare-fun contains!1609 (ListLongMap!3441 (_ BitVec 64)) Bool)

(assert (=> b!230225 (= c!38205 (contains!1609 lt!115843 key!932))))

(declare-fun getCurrentListMap!1264 (array!11339 array!11337 (_ BitVec 32) (_ BitVec 32) V!7709 V!7709 (_ BitVec 32) Int) ListLongMap!3441)

(assert (=> b!230225 (= lt!115843 (getCurrentListMap!1264 (_keys!6343 thiss!1504) (_values!4272 thiss!1504) (mask!10177 thiss!1504) (extraKeys!4026 thiss!1504) (zeroValue!4130 thiss!1504) (minValue!4130 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4289 thiss!1504)))))

(declare-fun b!230226 () Bool)

(assert (=> b!230226 (= e!149400 (not true))))

(declare-fun lt!115846 () array!11339)

(declare-fun v!346 () V!7709)

(declare-fun +!604 (ListLongMap!3441 tuple2!4528) ListLongMap!3441)

(assert (=> b!230226 (= (+!604 lt!115843 (tuple2!4529 key!932 v!346)) (getCurrentListMap!1264 lt!115846 (array!11338 (store (arr!5388 (_values!4272 thiss!1504)) index!297 (ValueCellFull!2680 v!346)) (size!5721 (_values!4272 thiss!1504))) (mask!10177 thiss!1504) (extraKeys!4026 thiss!1504) (zeroValue!4130 thiss!1504) (minValue!4130 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4289 thiss!1504)))))

(declare-fun lt!115850 () Unit!7046)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!58 (array!11339 array!11337 (_ BitVec 32) (_ BitVec 32) V!7709 V!7709 (_ BitVec 32) (_ BitVec 64) V!7709 Int) Unit!7046)

(assert (=> b!230226 (= lt!115850 (lemmaAddValidKeyToArrayThenAddPairToListMap!58 (_keys!6343 thiss!1504) (_values!4272 thiss!1504) (mask!10177 thiss!1504) (extraKeys!4026 thiss!1504) (zeroValue!4130 thiss!1504) (minValue!4130 thiss!1504) index!297 key!932 v!346 (defaultEntry!4289 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11339 (_ BitVec 32)) Bool)

(assert (=> b!230226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!115846 (mask!10177 thiss!1504))))

(declare-fun lt!115845 () Unit!7046)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11339 (_ BitVec 32) (_ BitVec 32)) Unit!7046)

(assert (=> b!230226 (= lt!115845 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6343 thiss!1504) index!297 (mask!10177 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11339 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!230226 (= (arrayCountValidKeys!0 lt!115846 #b00000000000000000000000000000000 (size!5722 (_keys!6343 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6343 thiss!1504) #b00000000000000000000000000000000 (size!5722 (_keys!6343 thiss!1504)))))))

(declare-fun lt!115842 () Unit!7046)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11339 (_ BitVec 32) (_ BitVec 64)) Unit!7046)

(assert (=> b!230226 (= lt!115842 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6343 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3452 0))(
  ( (Nil!3449) (Cons!3448 (h!4096 (_ BitVec 64)) (t!8411 List!3452)) )
))
(declare-fun arrayNoDuplicates!0 (array!11339 (_ BitVec 32) List!3452) Bool)

(assert (=> b!230226 (arrayNoDuplicates!0 lt!115846 #b00000000000000000000000000000000 Nil!3449)))

(assert (=> b!230226 (= lt!115846 (array!11340 (store (arr!5389 (_keys!6343 thiss!1504)) index!297 key!932) (size!5722 (_keys!6343 thiss!1504))))))

(declare-fun lt!115853 () Unit!7046)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11339 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3452) Unit!7046)

(assert (=> b!230226 (= lt!115853 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6343 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3449))))

(declare-fun lt!115844 () Unit!7046)

(assert (=> b!230226 (= lt!115844 e!149396)))

(declare-fun c!38208 () Bool)

(declare-fun arrayContainsKey!0 (array!11339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230226 (= c!38208 (arrayContainsKey!0 (_keys!6343 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!230227 () Bool)

(declare-fun e!149398 () Bool)

(declare-fun tp_is_empty!6047 () Bool)

(assert (=> b!230227 (= e!149398 tp_is_empty!6047)))

(declare-fun b!230228 () Bool)

(declare-fun e!149395 () Bool)

(declare-fun e!149401 () Bool)

(declare-fun mapRes!10240 () Bool)

(assert (=> b!230228 (= e!149395 (and e!149401 mapRes!10240))))

(declare-fun condMapEmpty!10240 () Bool)

(declare-fun mapDefault!10240 () ValueCell!2680)

