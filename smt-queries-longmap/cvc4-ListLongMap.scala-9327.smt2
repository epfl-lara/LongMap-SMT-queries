; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111402 () Bool)

(assert start!111402)

(declare-fun b_free!30059 () Bool)

(declare-fun b_next!30059 () Bool)

(assert (=> start!111402 (= b_free!30059 (not b_next!30059))))

(declare-fun tp!105653 () Bool)

(declare-fun b_and!48279 () Bool)

(assert (=> start!111402 (= tp!105653 b_and!48279)))

(declare-fun b!1318252 () Bool)

(declare-fun e!752283 () Bool)

(declare-fun e!752281 () Bool)

(declare-fun mapRes!55466 () Bool)

(assert (=> b!1318252 (= e!752283 (and e!752281 mapRes!55466))))

(declare-fun condMapEmpty!55466 () Bool)

(declare-datatypes ((V!52941 0))(
  ( (V!52942 (val!18014 Int)) )
))
(declare-datatypes ((ValueCell!17041 0))(
  ( (ValueCellFull!17041 (v!20644 V!52941)) (EmptyCell!17041) )
))
(declare-datatypes ((array!88706 0))(
  ( (array!88707 (arr!42827 (Array (_ BitVec 32) ValueCell!17041)) (size!43377 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88706)

(declare-fun mapDefault!55466 () ValueCell!17041)

