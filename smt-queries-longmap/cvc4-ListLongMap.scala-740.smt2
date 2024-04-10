; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17236 () Bool)

(assert start!17236)

(declare-fun b!172894 () Bool)

(declare-fun b_free!4283 () Bool)

(declare-fun b_next!4283 () Bool)

(assert (=> b!172894 (= b_free!4283 (not b_next!4283))))

(declare-fun tp!15507 () Bool)

(declare-fun b_and!10723 () Bool)

(assert (=> b!172894 (= tp!15507 b_and!10723)))

(declare-fun mapIsEmpty!6903 () Bool)

(declare-fun mapRes!6903 () Bool)

(assert (=> mapIsEmpty!6903 mapRes!6903))

(declare-fun b!172890 () Bool)

(declare-fun e!114167 () Bool)

(declare-fun e!114169 () Bool)

(assert (=> b!172890 (= e!114167 (and e!114169 mapRes!6903))))

(declare-fun condMapEmpty!6903 () Bool)

(declare-datatypes ((V!5053 0))(
  ( (V!5054 (val!2072 Int)) )
))
(declare-datatypes ((ValueCell!1684 0))(
  ( (ValueCellFull!1684 (v!3940 V!5053)) (EmptyCell!1684) )
))
(declare-datatypes ((array!7237 0))(
  ( (array!7238 (arr!3439 (Array (_ BitVec 32) (_ BitVec 64))) (size!3738 (_ BitVec 32))) )
))
(declare-datatypes ((array!7239 0))(
  ( (array!7240 (arr!3440 (Array (_ BitVec 32) ValueCell!1684)) (size!3739 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2276 0))(
  ( (LongMapFixedSize!2277 (defaultEntry!3584 Int) (mask!8442 (_ BitVec 32)) (extraKeys!3323 (_ BitVec 32)) (zeroValue!3425 V!5053) (minValue!3427 V!5053) (_size!1187 (_ BitVec 32)) (_keys!5423 array!7237) (_values!3567 array!7239) (_vacant!1187 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2276)

(declare-fun mapDefault!6903 () ValueCell!1684)

