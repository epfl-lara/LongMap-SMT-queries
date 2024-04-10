; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110644 () Bool)

(assert start!110644)

(declare-fun b_free!29479 () Bool)

(declare-fun b_next!29479 () Bool)

(assert (=> start!110644 (= b_free!29479 (not b_next!29479))))

(declare-fun tp!103759 () Bool)

(declare-fun b_and!47687 () Bool)

(assert (=> start!110644 (= tp!103759 b_and!47687)))

(declare-fun mapIsEmpty!54442 () Bool)

(declare-fun mapRes!54442 () Bool)

(assert (=> mapIsEmpty!54442 mapRes!54442))

(declare-fun b!1309212 () Bool)

(declare-fun e!746956 () Bool)

(declare-fun e!746957 () Bool)

(assert (=> b!1309212 (= e!746956 (and e!746957 mapRes!54442))))

(declare-fun condMapEmpty!54442 () Bool)

(declare-datatypes ((V!52049 0))(
  ( (V!52050 (val!17679 Int)) )
))
(declare-datatypes ((ValueCell!16706 0))(
  ( (ValueCellFull!16706 (v!20306 V!52049)) (EmptyCell!16706) )
))
(declare-datatypes ((array!87412 0))(
  ( (array!87413 (arr!42186 (Array (_ BitVec 32) ValueCell!16706)) (size!42736 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87412)

(declare-fun mapDefault!54442 () ValueCell!16706)

