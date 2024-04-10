; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4014 () Bool)

(assert start!4014)

(declare-fun b_free!919 () Bool)

(declare-fun b_next!919 () Bool)

(assert (=> start!4014 (= b_free!919 (not b_next!919))))

(declare-fun tp!4177 () Bool)

(declare-fun b_and!1729 () Bool)

(assert (=> start!4014 (= tp!4177 b_and!1729)))

(declare-fun b!29211 () Bool)

(declare-fun e!18870 () Bool)

(declare-fun tp_is_empty!1273 () Bool)

(assert (=> b!29211 (= e!18870 tp_is_empty!1273)))

(declare-fun b!29212 () Bool)

(declare-fun e!18872 () Bool)

(declare-fun mapRes!1438 () Bool)

(assert (=> b!29212 (= e!18872 (and e!18870 mapRes!1438))))

(declare-fun condMapEmpty!1438 () Bool)

(declare-datatypes ((V!1523 0))(
  ( (V!1524 (val!663 Int)) )
))
(declare-datatypes ((ValueCell!437 0))(
  ( (ValueCellFull!437 (v!1752 V!1523)) (EmptyCell!437) )
))
(declare-datatypes ((array!1779 0))(
  ( (array!1780 (arr!843 (Array (_ BitVec 32) ValueCell!437)) (size!944 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1779)

(declare-fun mapDefault!1438 () ValueCell!437)

