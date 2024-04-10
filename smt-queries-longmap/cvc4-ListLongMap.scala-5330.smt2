; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71244 () Bool)

(assert start!71244)

(declare-fun b_free!13391 () Bool)

(declare-fun b_next!13391 () Bool)

(assert (=> start!71244 (= b_free!13391 (not b_next!13391))))

(declare-fun tp!46935 () Bool)

(declare-fun b_and!22329 () Bool)

(assert (=> start!71244 (= tp!46935 b_and!22329)))

(declare-fun b!827554 () Bool)

(declare-fun e!461022 () Bool)

(declare-fun e!461023 () Bool)

(declare-fun mapRes!24280 () Bool)

(assert (=> b!827554 (= e!461022 (and e!461023 mapRes!24280))))

(declare-fun condMapEmpty!24280 () Bool)

(declare-datatypes ((V!25135 0))(
  ( (V!25136 (val!7598 Int)) )
))
(declare-datatypes ((ValueCell!7135 0))(
  ( (ValueCellFull!7135 (v!10033 V!25135)) (EmptyCell!7135) )
))
(declare-datatypes ((array!46374 0))(
  ( (array!46375 (arr!22231 (Array (_ BitVec 32) ValueCell!7135)) (size!22652 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46374)

(declare-fun mapDefault!24280 () ValueCell!7135)

