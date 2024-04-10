; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16958 () Bool)

(assert start!16958)

(declare-fun b!170488 () Bool)

(declare-fun b_free!4205 () Bool)

(declare-fun b_next!4205 () Bool)

(assert (=> b!170488 (= b_free!4205 (not b_next!4205))))

(declare-fun tp!15238 () Bool)

(declare-fun b_and!10619 () Bool)

(assert (=> b!170488 (= tp!15238 b_and!10619)))

(declare-fun mapIsEmpty!6752 () Bool)

(declare-fun mapRes!6752 () Bool)

(assert (=> mapIsEmpty!6752 mapRes!6752))

(declare-fun b!170485 () Bool)

(declare-fun e!112502 () Bool)

(declare-fun e!112505 () Bool)

(assert (=> b!170485 (= e!112502 (and e!112505 mapRes!6752))))

(declare-fun condMapEmpty!6752 () Bool)

(declare-datatypes ((V!4949 0))(
  ( (V!4950 (val!2033 Int)) )
))
(declare-datatypes ((ValueCell!1645 0))(
  ( (ValueCellFull!1645 (v!3898 V!4949)) (EmptyCell!1645) )
))
(declare-datatypes ((array!7063 0))(
  ( (array!7064 (arr!3361 (Array (_ BitVec 32) (_ BitVec 64))) (size!3654 (_ BitVec 32))) )
))
(declare-datatypes ((array!7065 0))(
  ( (array!7066 (arr!3362 (Array (_ BitVec 32) ValueCell!1645)) (size!3655 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2198 0))(
  ( (LongMapFixedSize!2199 (defaultEntry!3541 Int) (mask!8355 (_ BitVec 32)) (extraKeys!3282 (_ BitVec 32)) (zeroValue!3384 V!4949) (minValue!3384 V!4949) (_size!1148 (_ BitVec 32)) (_keys!5371 array!7063) (_values!3524 array!7065) (_vacant!1148 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2198)

(declare-fun mapDefault!6752 () ValueCell!1645)

