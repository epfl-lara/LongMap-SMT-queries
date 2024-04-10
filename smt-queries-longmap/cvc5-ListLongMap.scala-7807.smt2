; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97586 () Bool)

(assert start!97586)

(declare-fun b!1114665 () Bool)

(declare-fun e!635274 () Bool)

(declare-fun e!635276 () Bool)

(declare-fun mapRes!43543 () Bool)

(assert (=> b!1114665 (= e!635274 (and e!635276 mapRes!43543))))

(declare-fun condMapEmpty!43543 () Bool)

(declare-datatypes ((V!42217 0))(
  ( (V!42218 (val!13965 Int)) )
))
(declare-datatypes ((ValueCell!13199 0))(
  ( (ValueCellFull!13199 (v!16598 V!42217)) (EmptyCell!13199) )
))
(declare-datatypes ((array!72541 0))(
  ( (array!72542 (arr!34923 (Array (_ BitVec 32) ValueCell!13199)) (size!35459 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72541)

(declare-fun mapDefault!43543 () ValueCell!13199)

