; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97638 () Bool)

(assert start!97638)

(declare-fun b!1115679 () Bool)

(declare-fun e!635744 () Bool)

(declare-fun e!635740 () Bool)

(declare-fun mapRes!43621 () Bool)

(assert (=> b!1115679 (= e!635744 (and e!635740 mapRes!43621))))

(declare-fun condMapEmpty!43621 () Bool)

(declare-datatypes ((V!42285 0))(
  ( (V!42286 (val!13991 Int)) )
))
(declare-datatypes ((ValueCell!13225 0))(
  ( (ValueCellFull!13225 (v!16624 V!42285)) (EmptyCell!13225) )
))
(declare-datatypes ((array!72639 0))(
  ( (array!72640 (arr!34972 (Array (_ BitVec 32) ValueCell!13225)) (size!35508 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72639)

(declare-fun mapDefault!43621 () ValueCell!13225)

