; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24288 () Bool)

(assert start!24288)

(declare-fun b!254517 () Bool)

(declare-fun b_free!6689 () Bool)

(declare-fun b_next!6689 () Bool)

(assert (=> b!254517 (= b_free!6689 (not b_next!6689))))

(declare-fun tp!23354 () Bool)

(declare-fun b_and!13731 () Bool)

(assert (=> b!254517 (= tp!23354 b_and!13731)))

(declare-fun b!254501 () Bool)

(declare-fun res!124595 () Bool)

(declare-fun e!164977 () Bool)

(assert (=> b!254501 (=> (not res!124595) (not e!164977))))

(declare-fun call!24012 () Bool)

(assert (=> b!254501 (= res!124595 call!24012)))

(declare-fun e!164974 () Bool)

(assert (=> b!254501 (= e!164974 e!164977)))

(declare-fun b!254502 () Bool)

(declare-datatypes ((Unit!7888 0))(
  ( (Unit!7889) )
))
(declare-fun e!164970 () Unit!7888)

(declare-fun Unit!7890 () Unit!7888)

(assert (=> b!254502 (= e!164970 Unit!7890)))

(declare-fun b!254503 () Bool)

(declare-fun e!164976 () Bool)

(declare-fun e!164973 () Bool)

(assert (=> b!254503 (= e!164976 e!164973)))

(declare-fun res!124592 () Bool)

(assert (=> b!254503 (=> (not res!124592) (not e!164973))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!8381 0))(
  ( (V!8382 (val!3320 Int)) )
))
(declare-datatypes ((ValueCell!2932 0))(
  ( (ValueCellFull!2932 (v!5394 V!8381)) (EmptyCell!2932) )
))
(declare-datatypes ((array!12433 0))(
  ( (array!12434 (arr!5892 (Array (_ BitVec 32) ValueCell!2932)) (size!6239 (_ BitVec 32))) )
))
(declare-datatypes ((array!12435 0))(
  ( (array!12436 (arr!5893 (Array (_ BitVec 32) (_ BitVec 64))) (size!6240 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3764 0))(
  ( (LongMapFixedSize!3765 (defaultEntry!4695 Int) (mask!10941 (_ BitVec 32)) (extraKeys!4432 (_ BitVec 32)) (zeroValue!4536 V!8381) (minValue!4536 V!8381) (_size!1931 (_ BitVec 32)) (_keys!6849 array!12435) (_values!4678 array!12433) (_vacant!1931 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3764)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254503 (= res!124592 (inRange!0 index!297 (mask!10941 thiss!1504)))))

(declare-fun lt!127522 () Unit!7888)

(declare-fun e!164975 () Unit!7888)

(assert (=> b!254503 (= lt!127522 e!164975)))

(declare-fun c!42925 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4888 0))(
  ( (tuple2!4889 (_1!2455 (_ BitVec 64)) (_2!2455 V!8381)) )
))
(declare-datatypes ((List!3770 0))(
  ( (Nil!3767) (Cons!3766 (h!4428 tuple2!4888) (t!8817 List!3770)) )
))
(declare-datatypes ((ListLongMap!3801 0))(
  ( (ListLongMap!3802 (toList!1916 List!3770)) )
))
(declare-fun contains!1846 (ListLongMap!3801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1444 (array!12435 array!12433 (_ BitVec 32) (_ BitVec 32) V!8381 V!8381 (_ BitVec 32) Int) ListLongMap!3801)

(assert (=> b!254503 (= c!42925 (contains!1846 (getCurrentListMap!1444 (_keys!6849 thiss!1504) (_values!4678 thiss!1504) (mask!10941 thiss!1504) (extraKeys!4432 thiss!1504) (zeroValue!4536 thiss!1504) (minValue!4536 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4695 thiss!1504)) key!932))))

(declare-fun b!254504 () Bool)

(declare-fun e!164969 () Bool)

(assert (=> b!254504 (= e!164973 (not e!164969))))

(declare-fun res!124597 () Bool)

(assert (=> b!254504 (=> res!124597 e!164969)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!254504 (= res!124597 (not (validMask!0 (mask!10941 thiss!1504))))))

(declare-fun lt!127527 () array!12435)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12435 (_ BitVec 32)) Bool)

(assert (=> b!254504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!127527 (mask!10941 thiss!1504))))

(declare-fun lt!127529 () Unit!7888)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12435 (_ BitVec 32) (_ BitVec 32)) Unit!7888)

(assert (=> b!254504 (= lt!127529 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6849 thiss!1504) index!297 (mask!10941 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12435 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!254504 (= (arrayCountValidKeys!0 lt!127527 #b00000000000000000000000000000000 (size!6240 (_keys!6849 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6849 thiss!1504) #b00000000000000000000000000000000 (size!6240 (_keys!6849 thiss!1504)))))))

(declare-fun lt!127530 () Unit!7888)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12435 (_ BitVec 32) (_ BitVec 64)) Unit!7888)

(assert (=> b!254504 (= lt!127530 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6849 thiss!1504) index!297 key!932))))

(declare-datatypes ((List!3771 0))(
  ( (Nil!3768) (Cons!3767 (h!4429 (_ BitVec 64)) (t!8818 List!3771)) )
))
(declare-fun arrayNoDuplicates!0 (array!12435 (_ BitVec 32) List!3771) Bool)

(assert (=> b!254504 (arrayNoDuplicates!0 lt!127527 #b00000000000000000000000000000000 Nil!3768)))

(assert (=> b!254504 (= lt!127527 (array!12436 (store (arr!5893 (_keys!6849 thiss!1504)) index!297 key!932) (size!6240 (_keys!6849 thiss!1504))))))

(declare-fun lt!127532 () Unit!7888)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12435 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3771) Unit!7888)

(assert (=> b!254504 (= lt!127532 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6849 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3768))))

(declare-fun lt!127528 () Unit!7888)

(assert (=> b!254504 (= lt!127528 e!164970)))

(declare-fun c!42926 () Bool)

(declare-fun arrayContainsKey!0 (array!12435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!254504 (= c!42926 (arrayContainsKey!0 (_keys!6849 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!254505 () Bool)

(declare-fun call!24013 () Bool)

(assert (=> b!254505 (= e!164977 (not call!24013))))

(declare-datatypes ((SeekEntryResult!1150 0))(
  ( (MissingZero!1150 (index!6770 (_ BitVec 32))) (Found!1150 (index!6771 (_ BitVec 32))) (Intermediate!1150 (undefined!1962 Bool) (index!6772 (_ BitVec 32)) (x!24866 (_ BitVec 32))) (Undefined!1150) (MissingVacant!1150 (index!6773 (_ BitVec 32))) )
))
(declare-fun lt!127526 () SeekEntryResult!1150)

(declare-fun c!42924 () Bool)

(declare-fun bm!24009 () Bool)

(assert (=> bm!24009 (= call!24012 (inRange!0 (ite c!42924 (index!6770 lt!127526) (index!6773 lt!127526)) (mask!10941 thiss!1504)))))

(declare-fun b!254506 () Bool)

(declare-fun res!124590 () Bool)

(declare-fun e!164972 () Bool)

(assert (=> b!254506 (=> (not res!124590) (not e!164972))))

(assert (=> b!254506 (= res!124590 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!11142 () Bool)

(declare-fun mapRes!11142 () Bool)

(declare-fun tp!23355 () Bool)

(declare-fun e!164968 () Bool)

(assert (=> mapNonEmpty!11142 (= mapRes!11142 (and tp!23355 e!164968))))

(declare-fun mapRest!11142 () (Array (_ BitVec 32) ValueCell!2932))

(declare-fun mapKey!11142 () (_ BitVec 32))

(declare-fun mapValue!11142 () ValueCell!2932)

(assert (=> mapNonEmpty!11142 (= (arr!5892 (_values!4678 thiss!1504)) (store mapRest!11142 mapKey!11142 mapValue!11142))))

(declare-fun b!254507 () Bool)

(assert (=> b!254507 (= e!164969 true)))

(declare-fun lt!127531 () Bool)

(assert (=> b!254507 (= lt!127531 (arrayNoDuplicates!0 (_keys!6849 thiss!1504) #b00000000000000000000000000000000 Nil!3768))))

(declare-fun b!254508 () Bool)

(declare-fun e!164964 () Bool)

(assert (=> b!254508 (= e!164964 (not call!24013))))

(declare-fun b!254509 () Bool)

(declare-fun e!164967 () Bool)

(declare-fun tp_is_empty!6551 () Bool)

(assert (=> b!254509 (= e!164967 tp_is_empty!6551)))

(declare-fun b!254510 () Bool)

(declare-fun res!124599 () Bool)

(assert (=> b!254510 (=> (not res!124599) (not e!164977))))

(assert (=> b!254510 (= res!124599 (= (select (arr!5893 (_keys!6849 thiss!1504)) (index!6770 lt!127526)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254511 () Bool)

(declare-fun c!42923 () Bool)

(assert (=> b!254511 (= c!42923 (is-MissingVacant!1150 lt!127526))))

(declare-fun e!164966 () Bool)

(assert (=> b!254511 (= e!164974 e!164966)))

(declare-fun b!254512 () Bool)

(declare-fun res!124594 () Bool)

(assert (=> b!254512 (= res!124594 (= (select (arr!5893 (_keys!6849 thiss!1504)) (index!6773 lt!127526)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!254512 (=> (not res!124594) (not e!164964))))

(declare-fun b!254513 () Bool)

(declare-fun e!164965 () Bool)

(assert (=> b!254513 (= e!164965 (and e!164967 mapRes!11142))))

(declare-fun condMapEmpty!11142 () Bool)

(declare-fun mapDefault!11142 () ValueCell!2932)

