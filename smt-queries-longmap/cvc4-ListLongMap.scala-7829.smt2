; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97722 () Bool)

(assert start!97722)

(declare-fun b!1117317 () Bool)

(declare-fun e!636497 () Bool)

(declare-fun e!636499 () Bool)

(declare-fun mapRes!43747 () Bool)

(assert (=> b!1117317 (= e!636497 (and e!636499 mapRes!43747))))

(declare-fun condMapEmpty!43747 () Bool)

(declare-datatypes ((V!42397 0))(
  ( (V!42398 (val!14033 Int)) )
))
(declare-datatypes ((ValueCell!13267 0))(
  ( (ValueCellFull!13267 (v!16666 V!42397)) (EmptyCell!13267) )
))
(declare-datatypes ((array!72801 0))(
  ( (array!72802 (arr!35053 (Array (_ BitVec 32) ValueCell!13267)) (size!35589 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72801)

(declare-fun mapDefault!43747 () ValueCell!13267)

