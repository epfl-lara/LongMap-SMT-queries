; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4110 () Bool)

(assert start!4110)

(declare-fun b_free!1015 () Bool)

(declare-fun b_next!1015 () Bool)

(assert (=> start!4110 (= b_free!1015 (not b_next!1015))))

(declare-fun tp!4464 () Bool)

(declare-fun b_and!1825 () Bool)

(assert (=> start!4110 (= tp!4464 b_and!1825)))

(declare-fun b!30615 () Bool)

(declare-fun e!19624 () Bool)

(declare-fun e!19621 () Bool)

(declare-fun mapRes!1582 () Bool)

(assert (=> b!30615 (= e!19624 (and e!19621 mapRes!1582))))

(declare-fun condMapEmpty!1582 () Bool)

(declare-datatypes ((V!1651 0))(
  ( (V!1652 (val!711 Int)) )
))
(declare-datatypes ((ValueCell!485 0))(
  ( (ValueCellFull!485 (v!1800 V!1651)) (EmptyCell!485) )
))
(declare-datatypes ((array!1967 0))(
  ( (array!1968 (arr!937 (Array (_ BitVec 32) ValueCell!485)) (size!1038 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1967)

(declare-fun mapDefault!1582 () ValueCell!485)

