; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22052 () Bool)

(assert start!22052)

(declare-fun b!228033 () Bool)

(declare-fun b_free!6119 () Bool)

(declare-fun b_next!6119 () Bool)

(assert (=> b!228033 (= b_free!6119 (not b_next!6119))))

(declare-fun tp!21498 () Bool)

(declare-fun b_and!13017 () Bool)

(assert (=> b!228033 (= tp!21498 b_and!13017)))

(declare-fun b!228021 () Bool)

(declare-fun res!112239 () Bool)

(declare-fun e!147937 () Bool)

(assert (=> b!228021 (=> (not res!112239) (not e!147937))))

(declare-fun call!21192 () Bool)

(assert (=> b!228021 (= res!112239 call!21192)))

(declare-fun e!147934 () Bool)

(assert (=> b!228021 (= e!147934 e!147937)))

(declare-fun b!228023 () Bool)

(declare-fun c!37809 () Bool)

(declare-datatypes ((SeekEntryResult!902 0))(
  ( (MissingZero!902 (index!5778 (_ BitVec 32))) (Found!902 (index!5779 (_ BitVec 32))) (Intermediate!902 (undefined!1714 Bool) (index!5780 (_ BitVec 32)) (x!23306 (_ BitVec 32))) (Undefined!902) (MissingVacant!902 (index!5781 (_ BitVec 32))) )
))
(declare-fun lt!114732 () SeekEntryResult!902)

(assert (=> b!228023 (= c!37809 (is-MissingVacant!902 lt!114732))))

(declare-fun e!147936 () Bool)

(assert (=> b!228023 (= e!147934 e!147936)))

(declare-datatypes ((V!7621 0))(
  ( (V!7622 (val!3035 Int)) )
))
(declare-datatypes ((ValueCell!2647 0))(
  ( (ValueCellFull!2647 (v!5055 V!7621)) (EmptyCell!2647) )
))
(declare-datatypes ((array!11205 0))(
  ( (array!11206 (arr!5322 (Array (_ BitVec 32) ValueCell!2647)) (size!5655 (_ BitVec 32))) )
))
(declare-datatypes ((array!11207 0))(
  ( (array!11208 (arr!5323 (Array (_ BitVec 32) (_ BitVec 64))) (size!5656 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3194 0))(
  ( (LongMapFixedSize!3195 (defaultEntry!4256 Int) (mask!10122 (_ BitVec 32)) (extraKeys!3993 (_ BitVec 32)) (zeroValue!4097 V!7621) (minValue!4097 V!7621) (_size!1646 (_ BitVec 32)) (_keys!6310 array!11207) (_values!4239 array!11205) (_vacant!1646 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3194)

(declare-fun bm!21188 () Bool)

(declare-fun c!37812 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21188 (= call!21192 (inRange!0 (ite c!37812 (index!5778 lt!114732) (index!5781 lt!114732)) (mask!10122 thiss!1504)))))

(declare-fun b!228024 () Bool)

(declare-fun res!112242 () Bool)

(declare-fun e!147931 () Bool)

(assert (=> b!228024 (=> res!112242 e!147931)))

(assert (=> b!228024 (= res!112242 (or (not (= (size!5655 (_values!4239 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10122 thiss!1504)))) (not (= (size!5656 (_keys!6310 thiss!1504)) (size!5655 (_values!4239 thiss!1504)))) (bvslt (mask!10122 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!3993 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!3993 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!228025 () Bool)

(assert (=> b!228025 (= e!147931 true)))

(declare-fun lt!114728 () Bool)

(declare-datatypes ((List!3403 0))(
  ( (Nil!3400) (Cons!3399 (h!4047 (_ BitVec 64)) (t!8362 List!3403)) )
))
(declare-fun arrayNoDuplicates!0 (array!11207 (_ BitVec 32) List!3403) Bool)

(assert (=> b!228025 (= lt!114728 (arrayNoDuplicates!0 (_keys!6310 thiss!1504) #b00000000000000000000000000000000 Nil!3400))))

(declare-fun b!228026 () Bool)

(declare-fun call!21191 () Bool)

(assert (=> b!228026 (= e!147937 (not call!21191))))

(declare-fun bm!21189 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21189 (= call!21191 (arrayContainsKey!0 (_keys!6310 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!228027 () Bool)

(declare-fun e!147933 () Bool)

(declare-fun e!147935 () Bool)

(assert (=> b!228027 (= e!147933 e!147935)))

(declare-fun res!112244 () Bool)

(assert (=> b!228027 (=> (not res!112244) (not e!147935))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!228027 (= res!112244 (or (= lt!114732 (MissingZero!902 index!297)) (= lt!114732 (MissingVacant!902 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11207 (_ BitVec 32)) SeekEntryResult!902)

(assert (=> b!228027 (= lt!114732 (seekEntryOrOpen!0 key!932 (_keys!6310 thiss!1504) (mask!10122 thiss!1504)))))

(declare-fun b!228028 () Bool)

(declare-datatypes ((Unit!6926 0))(
  ( (Unit!6927) )
))
(declare-fun e!147939 () Unit!6926)

(declare-fun Unit!6928 () Unit!6926)

(assert (=> b!228028 (= e!147939 Unit!6928)))

(declare-fun lt!114729 () Unit!6926)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!270 (array!11207 array!11205 (_ BitVec 32) (_ BitVec 32) V!7621 V!7621 (_ BitVec 64) Int) Unit!6926)

(assert (=> b!228028 (= lt!114729 (lemmaInListMapThenSeekEntryOrOpenFindsIt!270 (_keys!6310 thiss!1504) (_values!4239 thiss!1504) (mask!10122 thiss!1504) (extraKeys!3993 thiss!1504) (zeroValue!4097 thiss!1504) (minValue!4097 thiss!1504) key!932 (defaultEntry!4256 thiss!1504)))))

(assert (=> b!228028 false))

(declare-fun b!228029 () Bool)

(declare-fun res!112248 () Bool)

(assert (=> b!228029 (= res!112248 (= (select (arr!5323 (_keys!6310 thiss!1504)) (index!5781 lt!114732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!147944 () Bool)

(assert (=> b!228029 (=> (not res!112248) (not e!147944))))

(declare-fun b!228030 () Bool)

(declare-fun e!147930 () Bool)

(declare-fun e!147943 () Bool)

(declare-fun mapRes!10141 () Bool)

(assert (=> b!228030 (= e!147930 (and e!147943 mapRes!10141))))

(declare-fun condMapEmpty!10141 () Bool)

(declare-fun mapDefault!10141 () ValueCell!2647)

