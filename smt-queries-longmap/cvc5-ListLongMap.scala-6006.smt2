; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77888 () Bool)

(assert start!77888)

(declare-fun b_free!16447 () Bool)

(declare-fun b_next!16447 () Bool)

(assert (=> start!77888 (= b_free!16447 (not b_next!16447))))

(declare-fun tp!57606 () Bool)

(declare-fun b_and!27015 () Bool)

(assert (=> start!77888 (= tp!57606 b_and!27015)))

(declare-fun b!909454 () Bool)

(declare-fun e!509794 () Bool)

(declare-fun tp_is_empty!18865 () Bool)

(assert (=> b!909454 (= e!509794 tp_is_empty!18865)))

(declare-fun b!909455 () Bool)

(declare-fun e!509792 () Bool)

(declare-fun e!509793 () Bool)

(declare-fun mapRes!30013 () Bool)

(assert (=> b!909455 (= e!509792 (and e!509793 mapRes!30013))))

(declare-fun condMapEmpty!30013 () Bool)

(declare-datatypes ((V!30119 0))(
  ( (V!30120 (val!9483 Int)) )
))
(declare-datatypes ((ValueCell!8951 0))(
  ( (ValueCellFull!8951 (v!11990 V!30119)) (EmptyCell!8951) )
))
(declare-datatypes ((array!53756 0))(
  ( (array!53757 (arr!25836 (Array (_ BitVec 32) ValueCell!8951)) (size!26295 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53756)

(declare-fun mapDefault!30013 () ValueCell!8951)

