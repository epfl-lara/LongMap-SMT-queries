; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22034 () Bool)

(assert start!22034)

(declare-fun b!227421 () Bool)

(declare-fun b_free!6101 () Bool)

(declare-fun b_next!6101 () Bool)

(assert (=> b!227421 (= b_free!6101 (not b_next!6101))))

(declare-fun tp!21444 () Bool)

(declare-fun b_and!12999 () Bool)

(assert (=> b!227421 (= tp!21444 b_and!12999)))

(declare-fun b!227400 () Bool)

(declare-fun res!111946 () Bool)

(declare-fun e!147539 () Bool)

(assert (=> b!227400 (=> res!111946 e!147539)))

(declare-datatypes ((V!7597 0))(
  ( (V!7598 (val!3026 Int)) )
))
(declare-datatypes ((ValueCell!2638 0))(
  ( (ValueCellFull!2638 (v!5046 V!7597)) (EmptyCell!2638) )
))
(declare-datatypes ((array!11169 0))(
  ( (array!11170 (arr!5304 (Array (_ BitVec 32) ValueCell!2638)) (size!5637 (_ BitVec 32))) )
))
(declare-datatypes ((array!11171 0))(
  ( (array!11172 (arr!5305 (Array (_ BitVec 32) (_ BitVec 64))) (size!5638 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3176 0))(
  ( (LongMapFixedSize!3177 (defaultEntry!4247 Int) (mask!10107 (_ BitVec 32)) (extraKeys!3984 (_ BitVec 32)) (zeroValue!4088 V!7597) (minValue!4088 V!7597) (_size!1637 (_ BitVec 32)) (_keys!6301 array!11171) (_values!4230 array!11169) (_vacant!1637 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3176)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11171 (_ BitVec 32)) Bool)

(assert (=> b!227400 (= res!111946 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6301 thiss!1504) (mask!10107 thiss!1504))))))

(declare-fun b!227401 () Bool)

(declare-fun res!111942 () Bool)

(declare-fun e!147527 () Bool)

(assert (=> b!227401 (=> (not res!111942) (not e!147527))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!227401 (= res!111942 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!227402 () Bool)

(declare-fun res!111951 () Bool)

(declare-datatypes ((SeekEntryResult!894 0))(
  ( (MissingZero!894 (index!5746 (_ BitVec 32))) (Found!894 (index!5747 (_ BitVec 32))) (Intermediate!894 (undefined!1706 Bool) (index!5748 (_ BitVec 32)) (x!23274 (_ BitVec 32))) (Undefined!894) (MissingVacant!894 (index!5749 (_ BitVec 32))) )
))
(declare-fun lt!114438 () SeekEntryResult!894)

(assert (=> b!227402 (= res!111951 (= (select (arr!5305 (_keys!6301 thiss!1504)) (index!5749 lt!114438)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147525 () Bool)

(assert (=> b!227402 (=> (not res!111951) (not e!147525))))

(declare-fun b!227403 () Bool)

(assert (=> b!227403 (= e!147539 true)))

(declare-fun lt!114439 () Bool)

(declare-datatypes ((List!3391 0))(
  ( (Nil!3388) (Cons!3387 (h!4035 (_ BitVec 64)) (t!8350 List!3391)) )
))
(declare-fun arrayNoDuplicates!0 (array!11171 (_ BitVec 32) List!3391) Bool)

(assert (=> b!227403 (= lt!114439 (arrayNoDuplicates!0 (_keys!6301 thiss!1504) #b00000000000000000000000000000000 Nil!3388))))

(declare-fun b!227404 () Bool)

(declare-fun call!21137 () Bool)

(assert (=> b!227404 (= e!147525 (not call!21137))))

(declare-fun b!227405 () Bool)

(declare-fun e!147536 () Bool)

(assert (=> b!227405 (= e!147527 e!147536)))

(declare-fun res!111949 () Bool)

(assert (=> b!227405 (=> (not res!111949) (not e!147536))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!227405 (= res!111949 (or (= lt!114438 (MissingZero!894 index!297)) (= lt!114438 (MissingVacant!894 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11171 (_ BitVec 32)) SeekEntryResult!894)

(assert (=> b!227405 (= lt!114438 (seekEntryOrOpen!0 key!932 (_keys!6301 thiss!1504) (mask!10107 thiss!1504)))))

(declare-fun b!227406 () Bool)

(declare-fun c!37703 () Bool)

(assert (=> b!227406 (= c!37703 (is-MissingVacant!894 lt!114438))))

(declare-fun e!147530 () Bool)

(declare-fun e!147531 () Bool)

(assert (=> b!227406 (= e!147530 e!147531)))

(declare-fun mapNonEmpty!10114 () Bool)

(declare-fun mapRes!10114 () Bool)

(declare-fun tp!21445 () Bool)

(declare-fun e!147534 () Bool)

(assert (=> mapNonEmpty!10114 (= mapRes!10114 (and tp!21445 e!147534))))

(declare-fun mapValue!10114 () ValueCell!2638)

(declare-fun mapRest!10114 () (Array (_ BitVec 32) ValueCell!2638))

(declare-fun mapKey!10114 () (_ BitVec 32))

(assert (=> mapNonEmpty!10114 (= (arr!5304 (_values!4230 thiss!1504)) (store mapRest!10114 mapKey!10114 mapValue!10114))))

(declare-fun b!227407 () Bool)

(declare-fun e!147526 () Bool)

(assert (=> b!227407 (= e!147526 (not call!21137))))

(declare-fun b!227408 () Bool)

(assert (=> b!227408 (= e!147531 (is-Undefined!894 lt!114438))))

(declare-fun b!227409 () Bool)

(declare-fun e!147535 () Bool)

(declare-fun tp_is_empty!5963 () Bool)

(assert (=> b!227409 (= e!147535 tp_is_empty!5963)))

(declare-fun b!227410 () Bool)

(declare-datatypes ((Unit!6895 0))(
  ( (Unit!6896) )
))
(declare-fun e!147533 () Unit!6895)

(declare-fun lt!114440 () Unit!6895)

(assert (=> b!227410 (= e!147533 lt!114440)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!278 (array!11171 array!11169 (_ BitVec 32) (_ BitVec 32) V!7597 V!7597 (_ BitVec 64) Int) Unit!6895)

(assert (=> b!227410 (= lt!114440 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!278 (_keys!6301 thiss!1504) (_values!4230 thiss!1504) (mask!10107 thiss!1504) (extraKeys!3984 thiss!1504) (zeroValue!4088 thiss!1504) (minValue!4088 thiss!1504) key!932 (defaultEntry!4247 thiss!1504)))))

(declare-fun c!37701 () Bool)

(assert (=> b!227410 (= c!37701 (is-MissingZero!894 lt!114438))))

(assert (=> b!227410 e!147530))

(declare-fun b!227411 () Bool)

(declare-fun res!111944 () Bool)

(assert (=> b!227411 (=> (not res!111944) (not e!147526))))

(declare-fun call!21138 () Bool)

(assert (=> b!227411 (= res!111944 call!21138)))

(assert (=> b!227411 (= e!147530 e!147526)))

(declare-fun b!227412 () Bool)

(assert (=> b!227412 (= e!147531 e!147525)))

(declare-fun res!111952 () Bool)

(assert (=> b!227412 (= res!111952 call!21138)))

(assert (=> b!227412 (=> (not res!111952) (not e!147525))))

(declare-fun b!227413 () Bool)

(declare-fun e!147532 () Bool)

(assert (=> b!227413 (= e!147532 (not e!147539))))

(declare-fun res!111945 () Bool)

(assert (=> b!227413 (=> res!111945 e!147539)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!227413 (= res!111945 (not (validMask!0 (mask!10107 thiss!1504))))))

(declare-fun lt!114437 () array!11171)

(assert (=> b!227413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!114437 (mask!10107 thiss!1504))))

(declare-fun lt!114430 () Unit!6895)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!11171 (_ BitVec 32) (_ BitVec 32)) Unit!6895)

(assert (=> b!227413 (= lt!114430 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6301 thiss!1504) index!297 (mask!10107 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!11171 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!227413 (= (arrayCountValidKeys!0 lt!114437 #b00000000000000000000000000000000 (size!5638 (_keys!6301 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6301 thiss!1504) #b00000000000000000000000000000000 (size!5638 (_keys!6301 thiss!1504)))))))

(declare-fun lt!114431 () Unit!6895)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11171 (_ BitVec 32) (_ BitVec 64)) Unit!6895)

(assert (=> b!227413 (= lt!114431 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6301 thiss!1504) index!297 key!932))))

(assert (=> b!227413 (arrayNoDuplicates!0 lt!114437 #b00000000000000000000000000000000 Nil!3388)))

(assert (=> b!227413 (= lt!114437 (array!11172 (store (arr!5305 (_keys!6301 thiss!1504)) index!297 key!932) (size!5638 (_keys!6301 thiss!1504))))))

(declare-fun lt!114433 () Unit!6895)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11171 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3391) Unit!6895)

(assert (=> b!227413 (= lt!114433 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6301 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3388))))

(declare-fun lt!114432 () Unit!6895)

(declare-fun e!147538 () Unit!6895)

(assert (=> b!227413 (= lt!114432 e!147538)))

(declare-fun c!37702 () Bool)

(declare-fun arrayContainsKey!0 (array!11171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227413 (= c!37702 (arrayContainsKey!0 (_keys!6301 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!21134 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21134 (= call!21138 (inRange!0 (ite c!37701 (index!5746 lt!114438) (index!5749 lt!114438)) (mask!10107 thiss!1504)))))

(declare-fun b!227414 () Bool)

(declare-fun res!111943 () Bool)

(assert (=> b!227414 (=> res!111943 e!147539)))

(assert (=> b!227414 (= res!111943 (or (not (= (size!5637 (_values!4230 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10107 thiss!1504)))) (not (= (size!5638 (_keys!6301 thiss!1504)) (size!5637 (_values!4230 thiss!1504)))) (bvslt (mask!10107 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3984 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3984 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!227415 () Bool)

(declare-fun Unit!6897 () Unit!6895)

(assert (=> b!227415 (= e!147533 Unit!6897)))

(declare-fun lt!114434 () Unit!6895)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!264 (array!11171 array!11169 (_ BitVec 32) (_ BitVec 32) V!7597 V!7597 (_ BitVec 64) Int) Unit!6895)

(assert (=> b!227415 (= lt!114434 (lemmaInListMapThenSeekEntryOrOpenFindsIt!264 (_keys!6301 thiss!1504) (_values!4230 thiss!1504) (mask!10107 thiss!1504) (extraKeys!3984 thiss!1504) (zeroValue!4088 thiss!1504) (minValue!4088 thiss!1504) key!932 (defaultEntry!4247 thiss!1504)))))

(assert (=> b!227415 false))

(declare-fun b!227416 () Bool)

(declare-fun res!111948 () Bool)

(assert (=> b!227416 (=> (not res!111948) (not e!147526))))

(assert (=> b!227416 (= res!111948 (= (select (arr!5305 (_keys!6301 thiss!1504)) (index!5746 lt!114438)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!111950 () Bool)

(assert (=> start!22034 (=> (not res!111950) (not e!147527))))

(declare-fun valid!1275 (LongMapFixedSize!3176) Bool)

(assert (=> start!22034 (= res!111950 (valid!1275 thiss!1504))))

(assert (=> start!22034 e!147527))

(declare-fun e!147528 () Bool)

(assert (=> start!22034 e!147528))

(assert (=> start!22034 true))

(declare-fun bm!21135 () Bool)

(assert (=> bm!21135 (= call!21137 (arrayContainsKey!0 (_keys!6301 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!227417 () Bool)

(declare-fun Unit!6898 () Unit!6895)

(assert (=> b!227417 (= e!147538 Unit!6898)))

(declare-fun b!227418 () Bool)

(declare-fun e!147537 () Bool)

(assert (=> b!227418 (= e!147537 (and e!147535 mapRes!10114))))

(declare-fun condMapEmpty!10114 () Bool)

(declare-fun mapDefault!10114 () ValueCell!2638)

