; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4066 () Bool)

(assert start!4066)

(declare-fun b_free!971 () Bool)

(declare-fun b_next!971 () Bool)

(assert (=> start!4066 (= b_free!971 (not b_next!971))))

(declare-fun tp!4333 () Bool)

(declare-fun b_and!1781 () Bool)

(assert (=> start!4066 (= tp!4333 b_and!1781)))

(declare-fun b!29955 () Bool)

(declare-fun e!19293 () Bool)

(declare-fun tp_is_empty!1325 () Bool)

(assert (=> b!29955 (= e!19293 tp_is_empty!1325)))

(declare-fun b!29956 () Bool)

(declare-fun e!19292 () Bool)

(declare-fun mapRes!1516 () Bool)

(assert (=> b!29956 (= e!19292 (and e!19293 mapRes!1516))))

(declare-fun condMapEmpty!1516 () Bool)

(declare-datatypes ((V!1591 0))(
  ( (V!1592 (val!689 Int)) )
))
(declare-datatypes ((ValueCell!463 0))(
  ( (ValueCellFull!463 (v!1778 V!1591)) (EmptyCell!463) )
))
(declare-datatypes ((array!1881 0))(
  ( (array!1882 (arr!894 (Array (_ BitVec 32) ValueCell!463)) (size!995 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1881)

(declare-fun mapDefault!1516 () ValueCell!463)

