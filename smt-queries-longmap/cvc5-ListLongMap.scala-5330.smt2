; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71240 () Bool)

(assert start!71240)

(declare-fun b_free!13387 () Bool)

(declare-fun b_next!13387 () Bool)

(assert (=> start!71240 (= b_free!13387 (not b_next!13387))))

(declare-fun tp!46923 () Bool)

(declare-fun b_and!22325 () Bool)

(assert (=> start!71240 (= tp!46923 b_and!22325)))

(declare-fun b!827512 () Bool)

(declare-fun e!460991 () Bool)

(declare-fun e!460993 () Bool)

(declare-fun mapRes!24274 () Bool)

(assert (=> b!827512 (= e!460991 (and e!460993 mapRes!24274))))

(declare-fun condMapEmpty!24274 () Bool)

(declare-datatypes ((V!25131 0))(
  ( (V!25132 (val!7596 Int)) )
))
(declare-datatypes ((ValueCell!7133 0))(
  ( (ValueCellFull!7133 (v!10031 V!25131)) (EmptyCell!7133) )
))
(declare-datatypes ((array!46368 0))(
  ( (array!46369 (arr!22228 (Array (_ BitVec 32) ValueCell!7133)) (size!22649 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46368)

(declare-fun mapDefault!24274 () ValueCell!7133)

