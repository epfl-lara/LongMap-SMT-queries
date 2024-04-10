; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97614 () Bool)

(assert start!97614)

(declare-fun b!1115211 () Bool)

(declare-fun e!635527 () Bool)

(declare-fun e!635524 () Bool)

(declare-fun mapRes!43585 () Bool)

(assert (=> b!1115211 (= e!635527 (and e!635524 mapRes!43585))))

(declare-fun condMapEmpty!43585 () Bool)

(declare-datatypes ((V!42253 0))(
  ( (V!42254 (val!13979 Int)) )
))
(declare-datatypes ((ValueCell!13213 0))(
  ( (ValueCellFull!13213 (v!16612 V!42253)) (EmptyCell!13213) )
))
(declare-datatypes ((array!72593 0))(
  ( (array!72594 (arr!34949 (Array (_ BitVec 32) ValueCell!13213)) (size!35485 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72593)

(declare-fun mapDefault!43585 () ValueCell!13213)

