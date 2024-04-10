; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97604 () Bool)

(assert start!97604)

(declare-fun b!1115016 () Bool)

(declare-fun e!635435 () Bool)

(declare-fun e!635439 () Bool)

(declare-fun mapRes!43570 () Bool)

(assert (=> b!1115016 (= e!635435 (and e!635439 mapRes!43570))))

(declare-fun condMapEmpty!43570 () Bool)

(declare-datatypes ((V!42241 0))(
  ( (V!42242 (val!13974 Int)) )
))
(declare-datatypes ((ValueCell!13208 0))(
  ( (ValueCellFull!13208 (v!16607 V!42241)) (EmptyCell!13208) )
))
(declare-datatypes ((array!72575 0))(
  ( (array!72576 (arr!34940 (Array (_ BitVec 32) ValueCell!13208)) (size!35476 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72575)

(declare-fun mapDefault!43570 () ValueCell!13208)

