; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71246 () Bool)

(assert start!71246)

(declare-fun b_free!13393 () Bool)

(declare-fun b_next!13393 () Bool)

(assert (=> start!71246 (= b_free!13393 (not b_next!13393))))

(declare-fun tp!46942 () Bool)

(declare-fun b_and!22331 () Bool)

(assert (=> start!71246 (= tp!46942 b_and!22331)))

(declare-fun b!827575 () Bool)

(declare-fun e!461036 () Bool)

(declare-fun tp_is_empty!15103 () Bool)

(assert (=> b!827575 (= e!461036 tp_is_empty!15103)))

(declare-fun b!827576 () Bool)

(declare-fun e!461037 () Bool)

(declare-fun e!461038 () Bool)

(declare-fun mapRes!24283 () Bool)

(assert (=> b!827576 (= e!461037 (and e!461038 mapRes!24283))))

(declare-fun condMapEmpty!24283 () Bool)

(declare-datatypes ((V!25139 0))(
  ( (V!25140 (val!7599 Int)) )
))
(declare-datatypes ((ValueCell!7136 0))(
  ( (ValueCellFull!7136 (v!10034 V!25139)) (EmptyCell!7136) )
))
(declare-datatypes ((array!46376 0))(
  ( (array!46377 (arr!22232 (Array (_ BitVec 32) ValueCell!7136)) (size!22653 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46376)

(declare-fun mapDefault!24283 () ValueCell!7136)

