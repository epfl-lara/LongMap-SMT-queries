; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21994 () Bool)

(assert start!21994)

(declare-fun b!225976 () Bool)

(declare-fun b_free!6061 () Bool)

(declare-fun b_next!6061 () Bool)

(assert (=> b!225976 (= b_free!6061 (not b_next!6061))))

(declare-fun tp!21325 () Bool)

(declare-fun b_and!12959 () Bool)

(assert (=> b!225976 (= tp!21325 b_and!12959)))

(declare-fun mapNonEmpty!10054 () Bool)

(declare-fun mapRes!10054 () Bool)

(declare-fun tp!21324 () Bool)

(declare-fun e!146637 () Bool)

(assert (=> mapNonEmpty!10054 (= mapRes!10054 (and tp!21324 e!146637))))

(declare-fun mapKey!10054 () (_ BitVec 32))

(declare-datatypes ((V!7545 0))(
  ( (V!7546 (val!3006 Int)) )
))
(declare-datatypes ((ValueCell!2618 0))(
  ( (ValueCellFull!2618 (v!5026 V!7545)) (EmptyCell!2618) )
))
(declare-fun mapRest!10054 () (Array (_ BitVec 32) ValueCell!2618))

(declare-datatypes ((array!11089 0))(
  ( (array!11090 (arr!5264 (Array (_ BitVec 32) ValueCell!2618)) (size!5597 (_ BitVec 32))) )
))
(declare-datatypes ((array!11091 0))(
  ( (array!11092 (arr!5265 (Array (_ BitVec 32) (_ BitVec 64))) (size!5598 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3136 0))(
  ( (LongMapFixedSize!3137 (defaultEntry!4227 Int) (mask!10075 (_ BitVec 32)) (extraKeys!3964 (_ BitVec 32)) (zeroValue!4068 V!7545) (minValue!4068 V!7545) (_size!1617 (_ BitVec 32)) (_keys!6281 array!11091) (_values!4210 array!11089) (_vacant!1617 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3136)

(declare-fun mapValue!10054 () ValueCell!2618)

(assert (=> mapNonEmpty!10054 (= (arr!5264 (_values!4210 thiss!1504)) (store mapRest!10054 mapKey!10054 mapValue!10054))))

(declare-fun b!225952 () Bool)

(declare-datatypes ((Unit!6821 0))(
  ( (Unit!6822) )
))
(declare-fun e!146634 () Unit!6821)

(declare-fun lt!113776 () Unit!6821)

(assert (=> b!225952 (= e!146634 lt!113776)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!264 (array!11091 array!11089 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 64) Int) Unit!6821)

(assert (=> b!225952 (= lt!113776 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!264 (_keys!6281 thiss!1504) (_values!4210 thiss!1504) (mask!10075 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) key!932 (defaultEntry!4227 thiss!1504)))))

(declare-fun c!37461 () Bool)

(declare-datatypes ((SeekEntryResult!876 0))(
  ( (MissingZero!876 (index!5674 (_ BitVec 32))) (Found!876 (index!5675 (_ BitVec 32))) (Intermediate!876 (undefined!1688 Bool) (index!5676 (_ BitVec 32)) (x!23208 (_ BitVec 32))) (Undefined!876) (MissingVacant!876 (index!5677 (_ BitVec 32))) )
))
(declare-fun lt!113772 () SeekEntryResult!876)

(assert (=> b!225952 (= c!37461 (is-MissingZero!876 lt!113772))))

(declare-fun e!146632 () Bool)

(assert (=> b!225952 e!146632))

(declare-fun bm!21014 () Bool)

(declare-fun call!21017 () Bool)

(declare-fun arrayContainsKey!0 (array!11091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21014 (= call!21017 (arrayContainsKey!0 (_keys!6281 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!10054 () Bool)

(assert (=> mapIsEmpty!10054 mapRes!10054))

(declare-fun b!225953 () Bool)

(declare-fun res!111226 () Bool)

(declare-fun e!146636 () Bool)

(assert (=> b!225953 (=> res!111226 e!146636)))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!225953 (= res!111226 (or (not (= (size!5598 (_keys!6281 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10075 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5598 (_keys!6281 thiss!1504)))))))

(declare-fun b!225954 () Bool)

(declare-fun res!111215 () Bool)

(assert (=> b!225954 (= res!111215 (= (select (arr!5265 (_keys!6281 thiss!1504)) (index!5677 lt!113772)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!146628 () Bool)

(assert (=> b!225954 (=> (not res!111215) (not e!146628))))

(declare-fun b!225956 () Bool)

(declare-fun Unit!6823 () Unit!6821)

(assert (=> b!225956 (= e!146634 Unit!6823)))

(declare-fun lt!113773 () Unit!6821)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!251 (array!11091 array!11089 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 64) Int) Unit!6821)

(assert (=> b!225956 (= lt!113773 (lemmaInListMapThenSeekEntryOrOpenFindsIt!251 (_keys!6281 thiss!1504) (_values!4210 thiss!1504) (mask!10075 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) key!932 (defaultEntry!4227 thiss!1504)))))

(assert (=> b!225956 false))

(declare-fun b!225957 () Bool)

(assert (=> b!225957 (= e!146636 true)))

(declare-fun lt!113770 () Bool)

(declare-datatypes ((List!3364 0))(
  ( (Nil!3361) (Cons!3360 (h!4008 (_ BitVec 64)) (t!8323 List!3364)) )
))
(declare-fun arrayNoDuplicates!0 (array!11091 (_ BitVec 32) List!3364) Bool)

(assert (=> b!225957 (= lt!113770 (arrayNoDuplicates!0 (_keys!6281 thiss!1504) #b00000000000000000000000000000000 Nil!3361))))

(declare-fun b!225958 () Bool)

(declare-fun res!111219 () Bool)

(declare-fun e!146627 () Bool)

(assert (=> b!225958 (=> (not res!111219) (not e!146627))))

(declare-fun call!21018 () Bool)

(assert (=> b!225958 (= res!111219 call!21018)))

(assert (=> b!225958 (= e!146632 e!146627)))

(declare-fun b!225959 () Bool)

(declare-fun res!111214 () Bool)

(assert (=> b!225959 (=> (not res!111214) (not e!146627))))

(assert (=> b!225959 (= res!111214 (= (select (arr!5265 (_keys!6281 thiss!1504)) (index!5674 lt!113772)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!225960 () Bool)

(declare-fun e!146638 () Bool)

(declare-fun tp_is_empty!5923 () Bool)

(assert (=> b!225960 (= e!146638 tp_is_empty!5923)))

(declare-fun b!225961 () Bool)

(declare-fun e!146630 () Unit!6821)

(declare-fun Unit!6824 () Unit!6821)

(assert (=> b!225961 (= e!146630 Unit!6824)))

(declare-fun lt!113780 () Unit!6821)

(declare-fun lemmaArrayContainsKeyThenInListMap!90 (array!11091 array!11089 (_ BitVec 32) (_ BitVec 32) V!7545 V!7545 (_ BitVec 64) (_ BitVec 32) Int) Unit!6821)

(assert (=> b!225961 (= lt!113780 (lemmaArrayContainsKeyThenInListMap!90 (_keys!6281 thiss!1504) (_values!4210 thiss!1504) (mask!10075 thiss!1504) (extraKeys!3964 thiss!1504) (zeroValue!4068 thiss!1504) (minValue!4068 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4227 thiss!1504)))))

(assert (=> b!225961 false))

(declare-fun b!225962 () Bool)

(declare-fun res!111217 () Bool)

(assert (=> b!225962 (=> res!111217 e!146636)))

(declare-fun lt!113778 () Bool)

(assert (=> b!225962 (= res!111217 lt!113778)))

(declare-fun b!225963 () Bool)

(assert (=> b!225963 (= e!146627 (not call!21017))))

(declare-fun b!225964 () Bool)

(declare-fun e!146626 () Bool)

(assert (=> b!225964 (= e!146626 (and e!146638 mapRes!10054))))

(declare-fun condMapEmpty!10054 () Bool)

(declare-fun mapDefault!10054 () ValueCell!2618)

