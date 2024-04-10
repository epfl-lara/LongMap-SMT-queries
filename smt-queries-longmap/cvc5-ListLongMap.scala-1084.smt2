; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22186 () Bool)

(assert start!22186)

(declare-fun b!232269 () Bool)

(declare-fun b_free!6253 () Bool)

(declare-fun b_next!6253 () Bool)

(assert (=> b!232269 (= b_free!6253 (not b_next!6253))))

(declare-fun tp!21900 () Bool)

(declare-fun b_and!13151 () Bool)

(assert (=> b!232269 (= tp!21900 b_and!13151)))

(declare-fun bm!21590 () Bool)

(declare-fun call!21594 () Bool)

(declare-datatypes ((V!7801 0))(
  ( (V!7802 (val!3102 Int)) )
))
(declare-datatypes ((ValueCell!2714 0))(
  ( (ValueCellFull!2714 (v!5122 V!7801)) (EmptyCell!2714) )
))
(declare-datatypes ((array!11473 0))(
  ( (array!11474 (arr!5456 (Array (_ BitVec 32) ValueCell!2714)) (size!5789 (_ BitVec 32))) )
))
(declare-datatypes ((array!11475 0))(
  ( (array!11476 (arr!5457 (Array (_ BitVec 32) (_ BitVec 64))) (size!5790 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3328 0))(
  ( (LongMapFixedSize!3329 (defaultEntry!4323 Int) (mask!10235 (_ BitVec 32)) (extraKeys!4060 (_ BitVec 32)) (zeroValue!4164 V!7801) (minValue!4164 V!7801) (_size!1713 (_ BitVec 32)) (_keys!6377 array!11475) (_values!4306 array!11473) (_vacant!1713 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3328)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21590 (= call!21594 (arrayContainsKey!0 (_keys!6377 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232260 () Bool)

(declare-fun e!150822 () Bool)

(declare-fun tp_is_empty!6115 () Bool)

(assert (=> b!232260 (= e!150822 tp_is_empty!6115)))

(declare-fun res!114073 () Bool)

(declare-fun e!150828 () Bool)

(assert (=> start!22186 (=> (not res!114073) (not e!150828))))

(declare-fun valid!1318 (LongMapFixedSize!3328) Bool)

(assert (=> start!22186 (= res!114073 (valid!1318 thiss!1504))))

(assert (=> start!22186 e!150828))

(declare-fun e!150829 () Bool)

(assert (=> start!22186 e!150829))

(assert (=> start!22186 true))

(assert (=> start!22186 tp_is_empty!6115))

(declare-fun b!232261 () Bool)

(declare-datatypes ((Unit!7170 0))(
  ( (Unit!7171) )
))
(declare-fun e!150824 () Unit!7170)

(declare-fun Unit!7172 () Unit!7170)

(assert (=> b!232261 (= e!150824 Unit!7172)))

(declare-fun call!21593 () Bool)

(declare-fun bm!21591 () Bool)

(declare-datatypes ((SeekEntryResult!962 0))(
  ( (MissingZero!962 (index!6018 (_ BitVec 32))) (Found!962 (index!6019 (_ BitVec 32))) (Intermediate!962 (undefined!1774 Bool) (index!6020 (_ BitVec 32)) (x!23550 (_ BitVec 32))) (Undefined!962) (MissingVacant!962 (index!6021 (_ BitVec 32))) )
))
(declare-fun lt!117246 () SeekEntryResult!962)

(declare-fun c!38615 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21591 (= call!21593 (inRange!0 (ite c!38615 (index!6018 lt!117246) (index!6021 lt!117246)) (mask!10235 thiss!1504)))))

(declare-fun b!232262 () Bool)

(declare-fun res!114066 () Bool)

(assert (=> b!232262 (=> (not res!114066) (not e!150828))))

(assert (=> b!232262 (= res!114066 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!232263 () Bool)

(declare-fun e!150818 () Bool)

(declare-fun e!150825 () Bool)

(declare-fun mapRes!10342 () Bool)

(assert (=> b!232263 (= e!150818 (and e!150825 mapRes!10342))))

(declare-fun condMapEmpty!10342 () Bool)

(declare-fun mapDefault!10342 () ValueCell!2714)

