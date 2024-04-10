; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73604 () Bool)

(assert start!73604)

(declare-fun b_free!14519 () Bool)

(declare-fun b_next!14519 () Bool)

(assert (=> start!73604 (= b_free!14519 (not b_next!14519))))

(declare-fun tp!51060 () Bool)

(declare-fun b_and!24017 () Bool)

(assert (=> start!73604 (= tp!51060 b_and!24017)))

(declare-fun b!861280 () Bool)

(declare-fun res!585323 () Bool)

(declare-fun e!479889 () Bool)

(assert (=> b!861280 (=> (not res!585323) (not e!479889))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861280 (= res!585323 (validKeyInArray!0 k!854))))

(declare-fun b!861281 () Bool)

(declare-fun e!479893 () Bool)

(declare-fun tp_is_empty!16655 () Bool)

(assert (=> b!861281 (= e!479893 tp_is_empty!16655)))

(declare-fun b!861282 () Bool)

(declare-fun e!479890 () Bool)

(declare-fun e!479888 () Bool)

(declare-fun mapRes!26582 () Bool)

(assert (=> b!861282 (= e!479890 (and e!479888 mapRes!26582))))

(declare-fun condMapEmpty!26582 () Bool)

(declare-datatypes ((V!27253 0))(
  ( (V!27254 (val!8375 Int)) )
))
(declare-datatypes ((ValueCell!7888 0))(
  ( (ValueCellFull!7888 (v!10800 V!27253)) (EmptyCell!7888) )
))
(declare-datatypes ((array!49478 0))(
  ( (array!49479 (arr!23770 (Array (_ BitVec 32) ValueCell!7888)) (size!24210 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49478)

(declare-fun mapDefault!26582 () ValueCell!7888)

