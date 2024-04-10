; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22060 () Bool)

(assert start!22060)

(declare-fun b!228312 () Bool)

(declare-fun b_free!6127 () Bool)

(declare-fun b_next!6127 () Bool)

(assert (=> b!228312 (= b_free!6127 (not b_next!6127))))

(declare-fun tp!21522 () Bool)

(declare-fun b_and!13025 () Bool)

(assert (=> b!228312 (= tp!21522 b_and!13025)))

(declare-fun b!228297 () Bool)

(declare-fun res!112373 () Bool)

(declare-fun e!148113 () Bool)

(assert (=> b!228297 (=> (not res!112373) (not e!148113))))

(declare-datatypes ((V!7633 0))(
  ( (V!7634 (val!3039 Int)) )
))
(declare-datatypes ((ValueCell!2651 0))(
  ( (ValueCellFull!2651 (v!5059 V!7633)) (EmptyCell!2651) )
))
(declare-datatypes ((array!11221 0))(
  ( (array!11222 (arr!5330 (Array (_ BitVec 32) ValueCell!2651)) (size!5663 (_ BitVec 32))) )
))
(declare-datatypes ((array!11223 0))(
  ( (array!11224 (arr!5331 (Array (_ BitVec 32) (_ BitVec 64))) (size!5664 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3202 0))(
  ( (LongMapFixedSize!3203 (defaultEntry!4260 Int) (mask!10130 (_ BitVec 32)) (extraKeys!3997 (_ BitVec 32)) (zeroValue!4101 V!7633) (minValue!4101 V!7633) (_size!1650 (_ BitVec 32)) (_keys!6314 array!11223) (_values!4243 array!11221) (_vacant!1650 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3202)

(declare-datatypes ((SeekEntryResult!906 0))(
  ( (MissingZero!906 (index!5794 (_ BitVec 32))) (Found!906 (index!5795 (_ BitVec 32))) (Intermediate!906 (undefined!1718 Bool) (index!5796 (_ BitVec 32)) (x!23326 (_ BitVec 32))) (Undefined!906) (MissingVacant!906 (index!5797 (_ BitVec 32))) )
))
(declare-fun lt!114860 () SeekEntryResult!906)

(assert (=> b!228297 (= res!112373 (= (select (arr!5331 (_keys!6314 thiss!1504)) (index!5794 lt!114860)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!21215 () Bool)

(declare-fun c!37859 () Bool)

(declare-fun bm!21212 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21212 (= call!21215 (inRange!0 (ite c!37859 (index!5794 lt!114860) (index!5797 lt!114860)) (mask!10130 thiss!1504)))))

(declare-fun b!228298 () Bool)

(declare-fun e!148122 () Bool)

(declare-fun e!148124 () Bool)

(assert (=> b!228298 (= e!148122 e!148124)))

(declare-fun res!112379 () Bool)

(assert (=> b!228298 (=> (not res!112379) (not e!148124))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!228298 (= res!112379 (inRange!0 index!297 (mask!10130 thiss!1504)))))

(declare-datatypes ((Unit!6940 0))(
  ( (Unit!6941) )
))
(declare-fun lt!114859 () Unit!6940)

(declare-fun e!148123 () Unit!6940)

(assert (=> b!228298 (= lt!114859 e!148123)))

(declare-fun c!37858 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4486 0))(
  ( (tuple2!4487 (_1!2254 (_ BitVec 64)) (_2!2254 V!7633)) )
))
(declare-datatypes ((List!3407 0))(
  ( (Nil!3404) (Cons!3403 (h!4051 tuple2!4486) (t!8366 List!3407)) )
))
(declare-datatypes ((ListLongMap!3399 0))(
  ( (ListLongMap!3400 (toList!1715 List!3407)) )
))
(declare-fun contains!1589 (ListLongMap!3399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1243 (array!11223 array!11221 (_ BitVec 32) (_ BitVec 32) V!7633 V!7633 (_ BitVec 32) Int) ListLongMap!3399)

(assert (=> b!228298 (= c!37858 (contains!1589 (getCurrentListMap!1243 (_keys!6314 thiss!1504) (_values!4243 thiss!1504) (mask!10130 thiss!1504) (extraKeys!3997 thiss!1504) (zeroValue!4101 thiss!1504) (minValue!4101 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4260 thiss!1504)) key!932))))

(declare-fun b!228299 () Bool)

(declare-fun e!148117 () Unit!6940)

(declare-fun Unit!6942 () Unit!6940)

(assert (=> b!228299 (= e!148117 Unit!6942)))

(declare-fun res!112380 () Bool)

(declare-fun e!148118 () Bool)

(assert (=> start!22060 (=> (not res!112380) (not e!148118))))

(declare-fun valid!1281 (LongMapFixedSize!3202) Bool)

(assert (=> start!22060 (= res!112380 (valid!1281 thiss!1504))))

(assert (=> start!22060 e!148118))

(declare-fun e!148114 () Bool)

(assert (=> start!22060 e!148114))

(assert (=> start!22060 true))

(declare-fun b!228300 () Bool)

(declare-fun e!148116 () Bool)

(declare-fun call!21216 () Bool)

(assert (=> b!228300 (= e!148116 (not call!21216))))

(declare-fun b!228301 () Bool)

(declare-fun e!148121 () Bool)

(declare-fun tp_is_empty!5989 () Bool)

(assert (=> b!228301 (= e!148121 tp_is_empty!5989)))

(declare-fun b!228302 () Bool)

(declare-fun res!112376 () Bool)

(assert (=> b!228302 (=> (not res!112376) (not e!148118))))

(assert (=> b!228302 (= res!112376 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10153 () Bool)

(declare-fun mapRes!10153 () Bool)

(assert (=> mapIsEmpty!10153 mapRes!10153))

(declare-fun b!228303 () Bool)

(declare-fun res!112377 () Bool)

(declare-fun e!148119 () Bool)

(assert (=> b!228303 (=> res!112377 e!148119)))

(assert (=> b!228303 (= res!112377 (or (not (= (size!5663 (_values!4243 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10130 thiss!1504)))) (not (= (size!5664 (_keys!6314 thiss!1504)) (size!5663 (_values!4243 thiss!1504)))) (bvslt (mask!10130 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3997 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3997 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228304 () Bool)

(assert (=> b!228304 (= e!148118 e!148122)))

(declare-fun res!112375 () Bool)

(assert (=> b!228304 (=> (not res!112375) (not e!148122))))

(assert (=> b!228304 (= res!112375 (or (= lt!114860 (MissingZero!906 index!297)) (= lt!114860 (MissingVacant!906 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11223 (_ BitVec 32)) SeekEntryResult!906)

(assert (=> b!228304 (= lt!114860 (seekEntryOrOpen!0 key!932 (_keys!6314 thiss!1504) (mask!10130 thiss!1504)))))

(declare-fun b!228305 () Bool)

(declare-fun res!112381 () Bool)

(assert (=> b!228305 (= res!112381 (= (select (arr!5331 (_keys!6314 thiss!1504)) (index!5797 lt!114860)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!228305 (=> (not res!112381) (not e!148116))))

(declare-fun b!228306 () Bool)

(declare-fun c!37857 () Bool)

(assert (=> b!228306 (= c!37857 (is-MissingVacant!906 lt!114860))))

(declare-fun e!148111 () Bool)

(declare-fun e!148115 () Bool)

(assert (=> b!228306 (= e!148111 e!148115)))

(declare-fun b!228307 () Bool)

(assert (=> b!228307 (= e!148124 (not e!148119))))

(declare-fun res!112372 () Bool)

(assert (=> b!228307 (=> res!112372 e!148119)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!228307 (= res!112372 (not (validMask!0 (mask!10130 thiss!1504))))))

(declare-fun lt!114864 () array!11223)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11223 (_ BitVec 32)) Bool)

(assert (=> b!228307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114864 (mask!10130 thiss!1504))))

(declare-fun lt!114865 () Unit!6940)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11223 (_ BitVec 32) (_ BitVec 32)) Unit!6940)

(assert (=> b!228307 (= lt!114865 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6314 thiss!1504) index!297 (mask!10130 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11223 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!228307 (= (arrayCountValidKeys!0 lt!114864 #b00000000000000000000000000000000 (size!5664 (_keys!6314 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6314 thiss!1504) #b00000000000000000000000000000000 (size!5664 (_keys!6314 thiss!1504)))))))

(declare-fun lt!114868 () Unit!6940)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11223 (_ BitVec 32) (_ BitVec 64)) Unit!6940)

(assert (=> b!228307 (= lt!114868 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6314 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3408 0))(
  ( (Nil!3405) (Cons!3404 (h!4052 (_ BitVec 64)) (t!8367 List!3408)) )
))
(declare-fun arrayNoDuplicates!0 (array!11223 (_ BitVec 32) List!3408) Bool)

(assert (=> b!228307 (arrayNoDuplicates!0 lt!114864 #b00000000000000000000000000000000 Nil!3405)))

(assert (=> b!228307 (= lt!114864 (array!11224 (store (arr!5331 (_keys!6314 thiss!1504)) index!297 key!932) (size!5664 (_keys!6314 thiss!1504))))))

(declare-fun lt!114866 () Unit!6940)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11223 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3408) Unit!6940)

(assert (=> b!228307 (= lt!114866 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6314 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3405))))

(declare-fun lt!114861 () Unit!6940)

(assert (=> b!228307 (= lt!114861 e!148117)))

(declare-fun c!37860 () Bool)

(declare-fun arrayContainsKey!0 (array!11223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228307 (= c!37860 (arrayContainsKey!0 (_keys!6314 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228308 () Bool)

(declare-fun e!148110 () Bool)

(assert (=> b!228308 (= e!148110 (and e!148121 mapRes!10153))))

(declare-fun condMapEmpty!10153 () Bool)

(declare-fun mapDefault!10153 () ValueCell!2651)

