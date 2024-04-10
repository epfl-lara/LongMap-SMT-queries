; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21982 () Bool)

(assert start!21982)

(declare-fun b!225510 () Bool)

(declare-fun b_free!6049 () Bool)

(declare-fun b_next!6049 () Bool)

(assert (=> b!225510 (= b_free!6049 (not b_next!6049))))

(declare-fun tp!21289 () Bool)

(declare-fun b_and!12947 () Bool)

(assert (=> b!225510 (= tp!21289 b_and!12947)))

(declare-fun b!225502 () Bool)

(declare-fun e!146369 () Bool)

(assert (=> b!225502 (= e!146369 true)))

(declare-fun lt!113577 () Bool)

(declare-datatypes ((V!7529 0))(
  ( (V!7530 (val!3000 Int)) )
))
(declare-datatypes ((ValueCell!2612 0))(
  ( (ValueCellFull!2612 (v!5020 V!7529)) (EmptyCell!2612) )
))
(declare-datatypes ((array!11065 0))(
  ( (array!11066 (arr!5252 (Array (_ BitVec 32) ValueCell!2612)) (size!5585 (_ BitVec 32))) )
))
(declare-datatypes ((array!11067 0))(
  ( (array!11068 (arr!5253 (Array (_ BitVec 32) (_ BitVec 64))) (size!5586 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3124 0))(
  ( (LongMapFixedSize!3125 (defaultEntry!4221 Int) (mask!10065 (_ BitVec 32)) (extraKeys!3958 (_ BitVec 32)) (zeroValue!4062 V!7529) (minValue!4062 V!7529) (_size!1611 (_ BitVec 32)) (_keys!6275 array!11067) (_values!4204 array!11065) (_vacant!1611 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3124)

(declare-datatypes ((List!3356 0))(
  ( (Nil!3353) (Cons!3352 (h!4000 (_ BitVec 64)) (t!8315 List!3356)) )
))
(declare-fun arrayNoDuplicates!0 (array!11067 (_ BitVec 32) List!3356) Bool)

(assert (=> b!225502 (= lt!113577 (arrayNoDuplicates!0 (_keys!6275 thiss!1504) #b00000000000000000000000000000000 Nil!3353))))

(declare-fun b!225503 () Bool)

(declare-fun res!110987 () Bool)

(assert (=> b!225503 (=> res!110987 e!146369)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225503 (= res!110987 (or (not (= (size!5586 (_keys!6275 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10065 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5586 (_keys!6275 thiss!1504)))))))

(declare-fun res!110989 () Bool)

(declare-fun e!146367 () Bool)

(assert (=> start!21982 (=> (not res!110989) (not e!146367))))

(declare-fun valid!1258 (LongMapFixedSize!3124) Bool)

(assert (=> start!21982 (= res!110989 (valid!1258 thiss!1504))))

(assert (=> start!21982 e!146367))

(declare-fun e!146365 () Bool)

(assert (=> start!21982 e!146365))

(assert (=> start!21982 true))

(declare-fun b!225504 () Bool)

(declare-fun e!146356 () Bool)

(declare-fun tp_is_empty!5911 () Bool)

(assert (=> b!225504 (= e!146356 tp_is_empty!5911)))

(declare-fun mapIsEmpty!10036 () Bool)

(declare-fun mapRes!10036 () Bool)

(assert (=> mapIsEmpty!10036 mapRes!10036))

(declare-fun bm!20978 () Bool)

(declare-fun call!20982 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20978 (= call!20982 (arrayContainsKey!0 (_keys!6275 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225505 () Bool)

(declare-fun res!110984 () Bool)

(assert (=> b!225505 (=> res!110984 e!146369)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225505 (= res!110984 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225506 () Bool)

(declare-fun e!146363 () Bool)

(assert (=> b!225506 (= e!146363 (not e!146369))))

(declare-fun res!110983 () Bool)

(assert (=> b!225506 (=> res!110983 e!146369)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!225506 (= res!110983 (not (validMask!0 (mask!10065 thiss!1504))))))

(declare-fun lt!113573 () array!11067)

(declare-fun arrayCountValidKeys!0 (array!11067 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!225506 (= (arrayCountValidKeys!0 lt!113573 #b00000000000000000000000000000000 (size!5586 (_keys!6275 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6275 thiss!1504) #b00000000000000000000000000000000 (size!5586 (_keys!6275 thiss!1504)))))))

(declare-datatypes ((Unit!6800 0))(
  ( (Unit!6801) )
))
(declare-fun lt!113582 () Unit!6800)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11067 (_ BitVec 32) (_ BitVec 64)) Unit!6800)

(assert (=> b!225506 (= lt!113582 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6275 thiss!1504) index!297 key!932))))

(assert (=> b!225506 (arrayNoDuplicates!0 lt!113573 #b00000000000000000000000000000000 Nil!3353)))

(assert (=> b!225506 (= lt!113573 (array!11068 (store (arr!5253 (_keys!6275 thiss!1504)) index!297 key!932) (size!5586 (_keys!6275 thiss!1504))))))

(declare-fun lt!113572 () Unit!6800)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11067 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3356) Unit!6800)

(assert (=> b!225506 (= lt!113572 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6275 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3353))))

(declare-fun lt!113575 () Unit!6800)

(declare-fun e!146362 () Unit!6800)

(assert (=> b!225506 (= lt!113575 e!146362)))

(declare-fun c!37391 () Bool)

(declare-fun lt!113574 () Bool)

(assert (=> b!225506 (= c!37391 lt!113574)))

(assert (=> b!225506 (= lt!113574 (arrayContainsKey!0 (_keys!6275 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!225507 () Bool)

(declare-fun res!110980 () Bool)

(declare-fun e!146355 () Bool)

(assert (=> b!225507 (=> (not res!110980) (not e!146355))))

(declare-fun call!20981 () Bool)

(assert (=> b!225507 (= res!110980 call!20981)))

(declare-fun e!146357 () Bool)

(assert (=> b!225507 (= e!146357 e!146355)))

(declare-fun b!225508 () Bool)

(declare-fun Unit!6802 () Unit!6800)

(assert (=> b!225508 (= e!146362 Unit!6802)))

(declare-fun lt!113579 () Unit!6800)

(declare-fun lemmaArrayContainsKeyThenInListMap!87 (array!11067 array!11065 (_ BitVec 32) (_ BitVec 32) V!7529 V!7529 (_ BitVec 64) (_ BitVec 32) Int) Unit!6800)

(assert (=> b!225508 (= lt!113579 (lemmaArrayContainsKeyThenInListMap!87 (_keys!6275 thiss!1504) (_values!4204 thiss!1504) (mask!10065 thiss!1504) (extraKeys!3958 thiss!1504) (zeroValue!4062 thiss!1504) (minValue!4062 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4221 thiss!1504)))))

(assert (=> b!225508 false))

(declare-fun b!225509 () Bool)

(declare-fun e!146361 () Unit!6800)

(declare-fun lt!113578 () Unit!6800)

(assert (=> b!225509 (= e!146361 lt!113578)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!260 (array!11067 array!11065 (_ BitVec 32) (_ BitVec 32) V!7529 V!7529 (_ BitVec 64) Int) Unit!6800)

(assert (=> b!225509 (= lt!113578 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!260 (_keys!6275 thiss!1504) (_values!4204 thiss!1504) (mask!10065 thiss!1504) (extraKeys!3958 thiss!1504) (zeroValue!4062 thiss!1504) (minValue!4062 thiss!1504) key!932 (defaultEntry!4221 thiss!1504)))))

(declare-fun c!37389 () Bool)

(declare-datatypes ((SeekEntryResult!870 0))(
  ( (MissingZero!870 (index!5650 (_ BitVec 32))) (Found!870 (index!5651 (_ BitVec 32))) (Intermediate!870 (undefined!1682 Bool) (index!5652 (_ BitVec 32)) (x!23186 (_ BitVec 32))) (Undefined!870) (MissingVacant!870 (index!5653 (_ BitVec 32))) )
))
(declare-fun lt!113576 () SeekEntryResult!870)

(assert (=> b!225509 (= c!37389 (is-MissingZero!870 lt!113576))))

(assert (=> b!225509 e!146357))

(declare-fun e!146364 () Bool)

(declare-fun array_inv!3475 (array!11067) Bool)

(declare-fun array_inv!3476 (array!11065) Bool)

(assert (=> b!225510 (= e!146365 (and tp!21289 tp_is_empty!5911 (array_inv!3475 (_keys!6275 thiss!1504)) (array_inv!3476 (_values!4204 thiss!1504)) e!146364))))

(declare-fun b!225511 () Bool)

(declare-fun res!110991 () Bool)

(assert (=> b!225511 (=> (not res!110991) (not e!146355))))

(assert (=> b!225511 (= res!110991 (= (select (arr!5253 (_keys!6275 thiss!1504)) (index!5650 lt!113576)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225512 () Bool)

(declare-fun Unit!6803 () Unit!6800)

(assert (=> b!225512 (= e!146362 Unit!6803)))

(declare-fun b!225513 () Bool)

(declare-fun res!110988 () Bool)

(assert (=> b!225513 (=> res!110988 e!146369)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11067 (_ BitVec 32)) Bool)

(assert (=> b!225513 (= res!110988 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6275 thiss!1504) (mask!10065 thiss!1504))))))

(declare-fun b!225514 () Bool)

(declare-fun e!146368 () Bool)

(assert (=> b!225514 (= e!146364 (and e!146368 mapRes!10036))))

(declare-fun condMapEmpty!10036 () Bool)

(declare-fun mapDefault!10036 () ValueCell!2612)

