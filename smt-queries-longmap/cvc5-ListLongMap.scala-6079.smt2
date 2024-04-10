; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78582 () Bool)

(assert start!78582)

(declare-fun b_free!16795 () Bool)

(declare-fun b_next!16795 () Bool)

(assert (=> start!78582 (= b_free!16795 (not b_next!16795))))

(declare-fun tp!58826 () Bool)

(declare-fun b_and!27417 () Bool)

(assert (=> start!78582 (= tp!58826 b_and!27417)))

(declare-fun b!916033 () Bool)

(declare-fun e!514183 () Bool)

(declare-fun e!514186 () Bool)

(declare-fun mapRes!30711 () Bool)

(assert (=> b!916033 (= e!514183 (and e!514186 mapRes!30711))))

(declare-fun condMapEmpty!30711 () Bool)

(declare-datatypes ((V!30703 0))(
  ( (V!30704 (val!9702 Int)) )
))
(declare-datatypes ((ValueCell!9170 0))(
  ( (ValueCellFull!9170 (v!12220 V!30703)) (EmptyCell!9170) )
))
(declare-datatypes ((array!54600 0))(
  ( (array!54601 (arr!26245 (Array (_ BitVec 32) ValueCell!9170)) (size!26704 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54600)

(declare-fun mapDefault!30711 () ValueCell!9170)

