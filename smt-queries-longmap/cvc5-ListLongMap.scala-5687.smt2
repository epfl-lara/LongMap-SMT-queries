; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73906 () Bool)

(assert start!73906)

(declare-fun b_free!14821 () Bool)

(declare-fun b_next!14821 () Bool)

(assert (=> start!73906 (= b_free!14821 (not b_next!14821))))

(declare-fun tp!51967 () Bool)

(declare-fun b_and!24573 () Bool)

(assert (=> start!73906 (= tp!51967 b_and!24573)))

(declare-fun b!868431 () Bool)

(declare-fun e!483688 () Bool)

(declare-fun e!483689 () Bool)

(declare-fun mapRes!27035 () Bool)

(assert (=> b!868431 (= e!483688 (and e!483689 mapRes!27035))))

(declare-fun condMapEmpty!27035 () Bool)

(declare-datatypes ((V!27657 0))(
  ( (V!27658 (val!8526 Int)) )
))
(declare-datatypes ((ValueCell!8039 0))(
  ( (ValueCellFull!8039 (v!10951 V!27657)) (EmptyCell!8039) )
))
(declare-datatypes ((array!50070 0))(
  ( (array!50071 (arr!24066 (Array (_ BitVec 32) ValueCell!8039)) (size!24506 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50070)

(declare-fun mapDefault!27035 () ValueCell!8039)

