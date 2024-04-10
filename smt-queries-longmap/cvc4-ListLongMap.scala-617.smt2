; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16054 () Bool)

(assert start!16054)

(declare-fun b!159301 () Bool)

(declare-fun b_free!3515 () Bool)

(declare-fun b_next!3515 () Bool)

(assert (=> b!159301 (= b_free!3515 (not b_next!3515))))

(declare-fun tp!13115 () Bool)

(declare-fun b_and!9929 () Bool)

(assert (=> b!159301 (= tp!13115 b_and!9929)))

(declare-fun b!159297 () Bool)

(declare-fun e!104282 () Bool)

(assert (=> b!159297 (= e!104282 false)))

(declare-fun lt!81985 () Bool)

(declare-datatypes ((V!4069 0))(
  ( (V!4070 (val!1703 Int)) )
))
(declare-datatypes ((ValueCell!1315 0))(
  ( (ValueCellFull!1315 (v!3568 V!4069)) (EmptyCell!1315) )
))
(declare-datatypes ((array!5713 0))(
  ( (array!5714 (arr!2701 (Array (_ BitVec 32) (_ BitVec 64))) (size!2985 (_ BitVec 32))) )
))
(declare-datatypes ((array!5715 0))(
  ( (array!5716 (arr!2702 (Array (_ BitVec 32) ValueCell!1315)) (size!2986 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1538 0))(
  ( (LongMapFixedSize!1539 (defaultEntry!3211 Int) (mask!7757 (_ BitVec 32)) (extraKeys!2952 (_ BitVec 32)) (zeroValue!3054 V!4069) (minValue!3054 V!4069) (_size!818 (_ BitVec 32)) (_keys!5012 array!5713) (_values!3194 array!5715) (_vacant!818 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1538)

(declare-datatypes ((List!1902 0))(
  ( (Nil!1899) (Cons!1898 (h!2511 (_ BitVec 64)) (t!6704 List!1902)) )
))
(declare-fun arrayNoDuplicates!0 (array!5713 (_ BitVec 32) List!1902) Bool)

(assert (=> b!159297 (= lt!81985 (arrayNoDuplicates!0 (_keys!5012 thiss!1248) #b00000000000000000000000000000000 Nil!1899))))

(declare-fun b!159298 () Bool)

(declare-fun e!104283 () Bool)

(declare-fun tp_is_empty!3317 () Bool)

(assert (=> b!159298 (= e!104283 tp_is_empty!3317)))

(declare-fun b!159299 () Bool)

(declare-fun e!104286 () Bool)

(assert (=> b!159299 (= e!104286 tp_is_empty!3317)))

(declare-fun mapNonEmpty!5663 () Bool)

(declare-fun mapRes!5663 () Bool)

(declare-fun tp!13114 () Bool)

(assert (=> mapNonEmpty!5663 (= mapRes!5663 (and tp!13114 e!104286))))

(declare-fun mapValue!5663 () ValueCell!1315)

(declare-fun mapKey!5663 () (_ BitVec 32))

(declare-fun mapRest!5663 () (Array (_ BitVec 32) ValueCell!1315))

(assert (=> mapNonEmpty!5663 (= (arr!2702 (_values!3194 thiss!1248)) (store mapRest!5663 mapKey!5663 mapValue!5663))))

(declare-fun b!159300 () Bool)

(declare-fun e!104284 () Bool)

(assert (=> b!159300 (= e!104284 (and e!104283 mapRes!5663))))

(declare-fun condMapEmpty!5663 () Bool)

(declare-fun mapDefault!5663 () ValueCell!1315)

