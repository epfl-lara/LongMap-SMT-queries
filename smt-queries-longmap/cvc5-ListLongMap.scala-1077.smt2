; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22144 () Bool)

(assert start!22144)

(declare-fun b!231019 () Bool)

(declare-fun b_free!6211 () Bool)

(declare-fun b_next!6211 () Bool)

(assert (=> b!231019 (= b_free!6211 (not b_next!6211))))

(declare-fun tp!21774 () Bool)

(declare-fun b_and!13109 () Bool)

(assert (=> b!231019 (= tp!21774 b_and!13109)))

(declare-fun b!231000 () Bool)

(declare-datatypes ((Unit!7090 0))(
  ( (Unit!7091) )
))
(declare-fun e!149947 () Unit!7090)

(declare-fun Unit!7092 () Unit!7090)

(assert (=> b!231000 (= e!149947 Unit!7092)))

(declare-fun b!231001 () Bool)

(declare-fun res!113566 () Bool)

(declare-fun e!149948 () Bool)

(assert (=> b!231001 (=> (not res!113566) (not e!149948))))

(declare-fun call!21468 () Bool)

(assert (=> b!231001 (= res!113566 call!21468)))

(declare-fun e!149944 () Bool)

(assert (=> b!231001 (= e!149944 e!149948)))

(declare-fun b!231002 () Bool)

(declare-fun e!149938 () Bool)

(declare-fun e!149941 () Bool)

(assert (=> b!231002 (= e!149938 e!149941)))

(declare-fun res!113563 () Bool)

(assert (=> b!231002 (=> (not res!113563) (not e!149941))))

(declare-datatypes ((SeekEntryResult!945 0))(
  ( (MissingZero!945 (index!5950 (_ BitVec 32))) (Found!945 (index!5951 (_ BitVec 32))) (Intermediate!945 (undefined!1757 Bool) (index!5952 (_ BitVec 32)) (x!23477 (_ BitVec 32))) (Undefined!945) (MissingVacant!945 (index!5953 (_ BitVec 32))) )
))
(declare-fun lt!116366 () SeekEntryResult!945)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!231002 (= res!113563 (or (= lt!116366 (MissingZero!945 index!297)) (= lt!116366 (MissingVacant!945 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7745 0))(
  ( (V!7746 (val!3081 Int)) )
))
(declare-datatypes ((ValueCell!2693 0))(
  ( (ValueCellFull!2693 (v!5101 V!7745)) (EmptyCell!2693) )
))
(declare-datatypes ((array!11389 0))(
  ( (array!11390 (arr!5414 (Array (_ BitVec 32) ValueCell!2693)) (size!5747 (_ BitVec 32))) )
))
(declare-datatypes ((array!11391 0))(
  ( (array!11392 (arr!5415 (Array (_ BitVec 32) (_ BitVec 64))) (size!5748 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3286 0))(
  ( (LongMapFixedSize!3287 (defaultEntry!4302 Int) (mask!10200 (_ BitVec 32)) (extraKeys!4039 (_ BitVec 32)) (zeroValue!4143 V!7745) (minValue!4143 V!7745) (_size!1692 (_ BitVec 32)) (_keys!6356 array!11391) (_values!4285 array!11389) (_vacant!1692 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3286)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11391 (_ BitVec 32)) SeekEntryResult!945)

(assert (=> b!231002 (= lt!116366 (seekEntryOrOpen!0 key!932 (_keys!6356 thiss!1504) (mask!10200 thiss!1504)))))

(declare-fun b!231003 () Bool)

(declare-fun e!149945 () Bool)

(declare-fun tp_is_empty!6073 () Bool)

(assert (=> b!231003 (= e!149945 tp_is_empty!6073)))

(declare-fun b!231004 () Bool)

(declare-fun e!149936 () Bool)

(declare-fun call!21467 () Bool)

(assert (=> b!231004 (= e!149936 (not call!21467))))

(declare-fun b!231005 () Bool)

(declare-fun e!149942 () Bool)

(assert (=> b!231005 (= e!149942 e!149936)))

(declare-fun res!113567 () Bool)

(assert (=> b!231005 (= res!113567 call!21468)))

(assert (=> b!231005 (=> (not res!113567) (not e!149936))))

(declare-fun bm!21464 () Bool)

(declare-fun arrayContainsKey!0 (array!11391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21464 (= call!21467 (arrayContainsKey!0 (_keys!6356 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231006 () Bool)

(declare-fun c!38362 () Bool)

(assert (=> b!231006 (= c!38362 (is-MissingVacant!945 lt!116366))))

(assert (=> b!231006 (= e!149944 e!149942)))

(declare-fun b!231008 () Bool)

(declare-fun e!149943 () Bool)

(assert (=> b!231008 (= e!149941 e!149943)))

(declare-fun res!113564 () Bool)

(assert (=> b!231008 (=> (not res!113564) (not e!149943))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!231008 (= res!113564 (inRange!0 index!297 (mask!10200 thiss!1504)))))

(declare-fun lt!116370 () Unit!7090)

(declare-fun e!149935 () Unit!7090)

(assert (=> b!231008 (= lt!116370 e!149935)))

(declare-fun c!38363 () Bool)

(declare-datatypes ((tuple2!4546 0))(
  ( (tuple2!4547 (_1!2284 (_ BitVec 64)) (_2!2284 V!7745)) )
))
(declare-datatypes ((List!3466 0))(
  ( (Nil!3463) (Cons!3462 (h!4110 tuple2!4546) (t!8425 List!3466)) )
))
(declare-datatypes ((ListLongMap!3459 0))(
  ( (ListLongMap!3460 (toList!1745 List!3466)) )
))
(declare-fun lt!116367 () ListLongMap!3459)

(declare-fun contains!1617 (ListLongMap!3459 (_ BitVec 64)) Bool)

(assert (=> b!231008 (= c!38363 (contains!1617 lt!116367 key!932))))

(declare-fun getCurrentListMap!1273 (array!11391 array!11389 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 32) Int) ListLongMap!3459)

(assert (=> b!231008 (= lt!116367 (getCurrentListMap!1273 (_keys!6356 thiss!1504) (_values!4285 thiss!1504) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4302 thiss!1504)))))

(declare-fun mapIsEmpty!10279 () Bool)

(declare-fun mapRes!10279 () Bool)

(assert (=> mapIsEmpty!10279 mapRes!10279))

(declare-fun b!231009 () Bool)

(declare-fun Unit!7093 () Unit!7090)

(assert (=> b!231009 (= e!149935 Unit!7093)))

(declare-fun lt!116369 () Unit!7090)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!296 (array!11391 array!11389 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 64) Int) Unit!7090)

(assert (=> b!231009 (= lt!116369 (lemmaInListMapThenSeekEntryOrOpenFindsIt!296 (_keys!6356 thiss!1504) (_values!4285 thiss!1504) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) key!932 (defaultEntry!4302 thiss!1504)))))

(assert (=> b!231009 false))

(declare-fun b!231010 () Bool)

(declare-fun res!113569 () Bool)

(assert (=> b!231010 (=> (not res!113569) (not e!149938))))

(assert (=> b!231010 (= res!113569 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!231011 () Bool)

(assert (=> b!231011 (= e!149943 (not true))))

(declare-fun lt!116359 () array!11391)

(declare-fun arrayCountValidKeys!0 (array!11391 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!231011 (= (arrayCountValidKeys!0 lt!116359 index!297 (bvadd #b00000000000000000000000000000001 index!297)) #b00000000000000000000000000000001)))

(declare-fun lt!116365 () Unit!7090)

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!11391 (_ BitVec 32)) Unit!7090)

(assert (=> b!231011 (= lt!116365 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!116359 index!297))))

(assert (=> b!231011 (arrayContainsKey!0 lt!116359 key!932 #b00000000000000000000000000000000)))

(declare-fun lt!116364 () Unit!7090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11391 (_ BitVec 64) (_ BitVec 32)) Unit!7090)

(assert (=> b!231011 (= lt!116364 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!116359 key!932 index!297))))

(declare-fun v!346 () V!7745)

(declare-fun +!610 (ListLongMap!3459 tuple2!4546) ListLongMap!3459)

(assert (=> b!231011 (= (+!610 lt!116367 (tuple2!4547 key!932 v!346)) (getCurrentListMap!1273 lt!116359 (array!11390 (store (arr!5414 (_values!4285 thiss!1504)) index!297 (ValueCellFull!2693 v!346)) (size!5747 (_values!4285 thiss!1504))) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4302 thiss!1504)))))

(declare-fun lt!116361 () Unit!7090)

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!64 (array!11391 array!11389 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 32) (_ BitVec 64) V!7745 Int) Unit!7090)

(assert (=> b!231011 (= lt!116361 (lemmaAddValidKeyToArrayThenAddPairToListMap!64 (_keys!6356 thiss!1504) (_values!4285 thiss!1504) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) index!297 key!932 v!346 (defaultEntry!4302 thiss!1504)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11391 (_ BitVec 32)) Bool)

(assert (=> b!231011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!116359 (mask!10200 thiss!1504))))

(declare-fun lt!116368 () Unit!7090)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11391 (_ BitVec 32) (_ BitVec 32)) Unit!7090)

(assert (=> b!231011 (= lt!116368 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6356 thiss!1504) index!297 (mask!10200 thiss!1504)))))

(assert (=> b!231011 (= (arrayCountValidKeys!0 lt!116359 #b00000000000000000000000000000000 (size!5748 (_keys!6356 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6356 thiss!1504) #b00000000000000000000000000000000 (size!5748 (_keys!6356 thiss!1504)))))))

(declare-fun lt!116371 () Unit!7090)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11391 (_ BitVec 32) (_ BitVec 64)) Unit!7090)

(assert (=> b!231011 (= lt!116371 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6356 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3467 0))(
  ( (Nil!3464) (Cons!3463 (h!4111 (_ BitVec 64)) (t!8426 List!3467)) )
))
(declare-fun arrayNoDuplicates!0 (array!11391 (_ BitVec 32) List!3467) Bool)

(assert (=> b!231011 (arrayNoDuplicates!0 lt!116359 #b00000000000000000000000000000000 Nil!3464)))

(assert (=> b!231011 (= lt!116359 (array!11392 (store (arr!5415 (_keys!6356 thiss!1504)) index!297 key!932) (size!5748 (_keys!6356 thiss!1504))))))

(declare-fun lt!116363 () Unit!7090)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3467) Unit!7090)

(assert (=> b!231011 (= lt!116363 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6356 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3464))))

(declare-fun lt!116360 () Unit!7090)

(assert (=> b!231011 (= lt!116360 e!149947)))

(declare-fun c!38364 () Bool)

(assert (=> b!231011 (= c!38364 (arrayContainsKey!0 (_keys!6356 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!231012 () Bool)

(declare-fun res!113565 () Bool)

(assert (=> b!231012 (=> (not res!113565) (not e!149948))))

(assert (=> b!231012 (= res!113565 (= (select (arr!5415 (_keys!6356 thiss!1504)) (index!5950 lt!116366)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!231013 () Bool)

(declare-fun e!149937 () Bool)

(assert (=> b!231013 (= e!149937 tp_is_empty!6073)))

(declare-fun b!231014 () Bool)

(declare-fun Unit!7094 () Unit!7090)

(assert (=> b!231014 (= e!149947 Unit!7094)))

(declare-fun lt!116362 () Unit!7090)

(declare-fun lemmaArrayContainsKeyThenInListMap!130 (array!11391 array!11389 (_ BitVec 32) (_ BitVec 32) V!7745 V!7745 (_ BitVec 64) (_ BitVec 32) Int) Unit!7090)

(assert (=> b!231014 (= lt!116362 (lemmaArrayContainsKeyThenInListMap!130 (_keys!6356 thiss!1504) (_values!4285 thiss!1504) (mask!10200 thiss!1504) (extraKeys!4039 thiss!1504) (zeroValue!4143 thiss!1504) (minValue!4143 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4302 thiss!1504)))))

(assert (=> b!231014 false))

(declare-fun res!113562 () Bool)

(assert (=> start!22144 (=> (not res!113562) (not e!149938))))

(declare-fun valid!1306 (LongMapFixedSize!3286) Bool)

(assert (=> start!22144 (= res!113562 (valid!1306 thiss!1504))))

(assert (=> start!22144 e!149938))

(declare-fun e!149940 () Bool)

(assert (=> start!22144 e!149940))

(assert (=> start!22144 true))

(assert (=> start!22144 tp_is_empty!6073))

(declare-fun b!231007 () Bool)

(assert (=> b!231007 (= e!149948 (not call!21467))))

(declare-fun b!231015 () Bool)

(assert (=> b!231015 (= e!149942 (is-Undefined!945 lt!116366))))

(declare-fun bm!21465 () Bool)

(declare-fun c!38361 () Bool)

(assert (=> bm!21465 (= call!21468 (inRange!0 (ite c!38361 (index!5950 lt!116366) (index!5953 lt!116366)) (mask!10200 thiss!1504)))))

(declare-fun b!231016 () Bool)

(declare-fun e!149939 () Bool)

(assert (=> b!231016 (= e!149939 (and e!149945 mapRes!10279))))

(declare-fun condMapEmpty!10279 () Bool)

(declare-fun mapDefault!10279 () ValueCell!2693)

