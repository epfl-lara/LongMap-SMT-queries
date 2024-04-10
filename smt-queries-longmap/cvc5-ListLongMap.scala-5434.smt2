; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72388 () Bool)

(assert start!72388)

(declare-fun b_free!13573 () Bool)

(declare-fun b_next!13573 () Bool)

(assert (=> start!72388 (= b_free!13573 (not b_next!13573))))

(declare-fun tp!47817 () Bool)

(declare-fun b_and!22659 () Bool)

(assert (=> start!72388 (= tp!47817 b_and!22659)))

(declare-fun b!838985 () Bool)

(declare-fun e!468274 () Bool)

(declare-fun e!468272 () Bool)

(declare-fun mapRes!24758 () Bool)

(assert (=> b!838985 (= e!468274 (and e!468272 mapRes!24758))))

(declare-fun condMapEmpty!24758 () Bool)

(declare-datatypes ((V!25633 0))(
  ( (V!25634 (val!7767 Int)) )
))
(declare-datatypes ((ValueCell!7280 0))(
  ( (ValueCellFull!7280 (v!10192 V!25633)) (EmptyCell!7280) )
))
(declare-datatypes ((array!47164 0))(
  ( (array!47165 (arr!22613 (Array (_ BitVec 32) ValueCell!7280)) (size!23053 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47164)

(declare-fun mapDefault!24758 () ValueCell!7280)

