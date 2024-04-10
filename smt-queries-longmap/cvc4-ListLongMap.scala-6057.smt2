; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78392 () Bool)

(assert start!78392)

(declare-fun b_free!16757 () Bool)

(declare-fun b_next!16757 () Bool)

(assert (=> start!78392 (= b_free!16757 (not b_next!16757))))

(declare-fun tp!58559 () Bool)

(declare-fun b_and!27377 () Bool)

(assert (=> start!78392 (= tp!58559 b_and!27377)))

(declare-fun b!914479 () Bool)

(declare-fun e!513013 () Bool)

(declare-fun e!513011 () Bool)

(declare-fun mapRes!30501 () Bool)

(assert (=> b!914479 (= e!513013 (and e!513011 mapRes!30501))))

(declare-fun condMapEmpty!30501 () Bool)

(declare-datatypes ((V!30531 0))(
  ( (V!30532 (val!9638 Int)) )
))
(declare-datatypes ((ValueCell!9106 0))(
  ( (ValueCellFull!9106 (v!12154 V!30531)) (EmptyCell!9106) )
))
(declare-datatypes ((array!54342 0))(
  ( (array!54343 (arr!26122 (Array (_ BitVec 32) ValueCell!9106)) (size!26581 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54342)

(declare-fun mapDefault!30501 () ValueCell!9106)

