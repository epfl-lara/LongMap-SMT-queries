; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78062 () Bool)

(assert start!78062)

(declare-fun b_free!16589 () Bool)

(declare-fun b_next!16589 () Bool)

(assert (=> start!78062 (= b_free!16589 (not b_next!16589))))

(declare-fun tp!58037 () Bool)

(declare-fun b_and!27161 () Bool)

(assert (=> start!78062 (= tp!58037 b_and!27161)))

(declare-fun b!911199 () Bool)

(declare-fun e!511001 () Bool)

(declare-fun e!511002 () Bool)

(declare-fun mapRes!30232 () Bool)

(assert (=> b!911199 (= e!511001 (and e!511002 mapRes!30232))))

(declare-fun condMapEmpty!30232 () Bool)

(declare-datatypes ((V!30307 0))(
  ( (V!30308 (val!9554 Int)) )
))
(declare-datatypes ((ValueCell!9022 0))(
  ( (ValueCellFull!9022 (v!12063 V!30307)) (EmptyCell!9022) )
))
(declare-datatypes ((array!54018 0))(
  ( (array!54019 (arr!25965 (Array (_ BitVec 32) ValueCell!9022)) (size!26424 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54018)

(declare-fun mapDefault!30232 () ValueCell!9022)

