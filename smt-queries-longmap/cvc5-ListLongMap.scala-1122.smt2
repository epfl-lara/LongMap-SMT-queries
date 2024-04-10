; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22978 () Bool)

(assert start!22978)

(declare-fun b!240900 () Bool)

(declare-fun b_free!6481 () Bool)

(declare-fun b_next!6481 () Bool)

(assert (=> b!240900 (= b_free!6481 (not b_next!6481))))

(declare-fun tp!22647 () Bool)

(declare-fun b_and!13447 () Bool)

(assert (=> b!240900 (= tp!22647 b_and!13447)))

(declare-fun b!240899 () Bool)

(declare-fun e!156359 () Bool)

(declare-datatypes ((V!8105 0))(
  ( (V!8106 (val!3216 Int)) )
))
(declare-datatypes ((ValueCell!2828 0))(
  ( (ValueCellFull!2828 (v!5254 V!8105)) (EmptyCell!2828) )
))
(declare-datatypes ((array!11965 0))(
  ( (array!11966 (arr!5684 (Array (_ BitVec 32) ValueCell!2828)) (size!6025 (_ BitVec 32))) )
))
(declare-datatypes ((array!11967 0))(
  ( (array!11968 (arr!5685 (Array (_ BitVec 32) (_ BitVec 64))) (size!6026 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3556 0))(
  ( (LongMapFixedSize!3557 (defaultEntry!4463 Int) (mask!10525 (_ BitVec 32)) (extraKeys!4200 (_ BitVec 32)) (zeroValue!4304 V!8105) (minValue!4304 V!8105) (_size!1827 (_ BitVec 32)) (_keys!6565 array!11967) (_values!4446 array!11965) (_vacant!1827 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3556)

(assert (=> b!240899 (= e!156359 (bvsge (size!6026 (_keys!6565 thiss!1504)) #b01111111111111111111111111111111))))

(declare-datatypes ((Unit!7415 0))(
  ( (Unit!7416) )
))
(declare-fun lt!121093 () Unit!7415)

(declare-fun e!156352 () Unit!7415)

(assert (=> b!240899 (= lt!121093 e!156352)))

(declare-fun c!40121 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240899 (= c!40121 (arrayContainsKey!0 (_keys!6565 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun bm!22400 () Bool)

(declare-fun c!40118 () Bool)

(declare-fun call!22404 () Bool)

(declare-datatypes ((SeekEntryResult!1052 0))(
  ( (MissingZero!1052 (index!6378 (_ BitVec 32))) (Found!1052 (index!6379 (_ BitVec 32))) (Intermediate!1052 (undefined!1864 Bool) (index!6380 (_ BitVec 32)) (x!24188 (_ BitVec 32))) (Undefined!1052) (MissingVacant!1052 (index!6381 (_ BitVec 32))) )
))
(declare-fun lt!121095 () SeekEntryResult!1052)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22400 (= call!22404 (inRange!0 (ite c!40118 (index!6378 lt!121095) (index!6381 lt!121095)) (mask!10525 thiss!1504)))))

(declare-fun e!156356 () Bool)

(declare-fun tp_is_empty!6343 () Bool)

(declare-fun e!156354 () Bool)

(declare-fun array_inv!3761 (array!11967) Bool)

(declare-fun array_inv!3762 (array!11965) Bool)

(assert (=> b!240900 (= e!156356 (and tp!22647 tp_is_empty!6343 (array_inv!3761 (_keys!6565 thiss!1504)) (array_inv!3762 (_values!4446 thiss!1504)) e!156354))))

(declare-fun b!240901 () Bool)

(declare-fun e!156353 () Bool)

(declare-fun e!156350 () Bool)

(assert (=> b!240901 (= e!156353 e!156350)))

(declare-fun res!118129 () Bool)

(assert (=> b!240901 (= res!118129 call!22404)))

(assert (=> b!240901 (=> (not res!118129) (not e!156350))))

(declare-fun b!240902 () Bool)

(declare-fun e!156347 () Bool)

(declare-fun mapRes!10746 () Bool)

(assert (=> b!240902 (= e!156354 (and e!156347 mapRes!10746))))

(declare-fun condMapEmpty!10746 () Bool)

(declare-fun mapDefault!10746 () ValueCell!2828)

