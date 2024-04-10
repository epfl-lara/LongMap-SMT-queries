; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16228 () Bool)

(assert start!16228)

(declare-fun b!161869 () Bool)

(declare-fun b_free!3689 () Bool)

(declare-fun b_next!3689 () Bool)

(assert (=> b!161869 (= b_free!3689 (not b_next!3689))))

(declare-fun tp!13636 () Bool)

(declare-fun b_and!10103 () Bool)

(assert (=> b!161869 (= tp!13636 b_and!10103)))

(declare-fun b!161866 () Bool)

(declare-fun e!105902 () Bool)

(declare-fun e!105906 () Bool)

(declare-fun mapRes!5924 () Bool)

(assert (=> b!161866 (= e!105902 (and e!105906 mapRes!5924))))

(declare-fun condMapEmpty!5924 () Bool)

(declare-datatypes ((V!4301 0))(
  ( (V!4302 (val!1790 Int)) )
))
(declare-datatypes ((ValueCell!1402 0))(
  ( (ValueCellFull!1402 (v!3655 V!4301)) (EmptyCell!1402) )
))
(declare-datatypes ((array!6061 0))(
  ( (array!6062 (arr!2875 (Array (_ BitVec 32) (_ BitVec 64))) (size!3159 (_ BitVec 32))) )
))
(declare-datatypes ((array!6063 0))(
  ( (array!6064 (arr!2876 (Array (_ BitVec 32) ValueCell!1402)) (size!3160 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1712 0))(
  ( (LongMapFixedSize!1713 (defaultEntry!3298 Int) (mask!7902 (_ BitVec 32)) (extraKeys!3039 (_ BitVec 32)) (zeroValue!3141 V!4301) (minValue!3141 V!4301) (_size!905 (_ BitVec 32)) (_keys!5099 array!6061) (_values!3281 array!6063) (_vacant!905 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1712)

(declare-fun mapDefault!5924 () ValueCell!1402)

