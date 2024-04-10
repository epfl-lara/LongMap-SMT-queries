; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110612 () Bool)

(assert start!110612)

(declare-fun b_free!29447 () Bool)

(declare-fun b_next!29447 () Bool)

(assert (=> start!110612 (= b_free!29447 (not b_next!29447))))

(declare-fun tp!103663 () Bool)

(declare-fun b_and!47655 () Bool)

(assert (=> start!110612 (= tp!103663 b_and!47655)))

(declare-fun b!1308823 () Bool)

(declare-fun e!746716 () Bool)

(declare-fun e!746717 () Bool)

(declare-fun mapRes!54394 () Bool)

(assert (=> b!1308823 (= e!746716 (and e!746717 mapRes!54394))))

(declare-fun condMapEmpty!54394 () Bool)

(declare-datatypes ((V!52005 0))(
  ( (V!52006 (val!17663 Int)) )
))
(declare-datatypes ((ValueCell!16690 0))(
  ( (ValueCellFull!16690 (v!20290 V!52005)) (EmptyCell!16690) )
))
(declare-datatypes ((array!87350 0))(
  ( (array!87351 (arr!42155 (Array (_ BitVec 32) ValueCell!16690)) (size!42705 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87350)

(declare-fun mapDefault!54394 () ValueCell!16690)

