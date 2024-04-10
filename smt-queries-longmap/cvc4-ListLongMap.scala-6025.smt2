; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78038 () Bool)

(assert start!78038)

(declare-fun b_free!16565 () Bool)

(declare-fun b_next!16565 () Bool)

(assert (=> start!78038 (= b_free!16565 (not b_next!16565))))

(declare-fun tp!57965 () Bool)

(declare-fun b_and!27137 () Bool)

(assert (=> start!78038 (= tp!57965 b_and!27137)))

(declare-fun b!910947 () Bool)

(declare-fun e!510823 () Bool)

(declare-fun e!510822 () Bool)

(declare-fun mapRes!30196 () Bool)

(assert (=> b!910947 (= e!510823 (and e!510822 mapRes!30196))))

(declare-fun condMapEmpty!30196 () Bool)

(declare-datatypes ((V!30275 0))(
  ( (V!30276 (val!9542 Int)) )
))
(declare-datatypes ((ValueCell!9010 0))(
  ( (ValueCellFull!9010 (v!12051 V!30275)) (EmptyCell!9010) )
))
(declare-datatypes ((array!53974 0))(
  ( (array!53975 (arr!25943 (Array (_ BitVec 32) ValueCell!9010)) (size!26402 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53974)

(declare-fun mapDefault!30196 () ValueCell!9010)

