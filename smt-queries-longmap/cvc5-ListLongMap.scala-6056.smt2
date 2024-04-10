; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78382 () Bool)

(assert start!78382)

(declare-fun b_free!16747 () Bool)

(declare-fun b_next!16747 () Bool)

(assert (=> start!78382 (= b_free!16747 (not b_next!16747))))

(declare-fun tp!58528 () Bool)

(declare-fun b_and!27361 () Bool)

(assert (=> start!78382 (= tp!58528 b_and!27361)))

(declare-fun b!914326 () Bool)

(declare-fun e!512919 () Bool)

(declare-fun e!512917 () Bool)

(declare-fun mapRes!30486 () Bool)

(assert (=> b!914326 (= e!512919 (and e!512917 mapRes!30486))))

(declare-fun condMapEmpty!30486 () Bool)

(declare-datatypes ((V!30519 0))(
  ( (V!30520 (val!9633 Int)) )
))
(declare-datatypes ((ValueCell!9101 0))(
  ( (ValueCellFull!9101 (v!12149 V!30519)) (EmptyCell!9101) )
))
(declare-datatypes ((array!54324 0))(
  ( (array!54325 (arr!26113 (Array (_ BitVec 32) ValueCell!9101)) (size!26572 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54324)

(declare-fun mapDefault!30486 () ValueCell!9101)

