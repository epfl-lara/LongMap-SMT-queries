; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4156 () Bool)

(assert start!4156)

(declare-fun b_free!1061 () Bool)

(declare-fun b_next!1061 () Bool)

(assert (=> start!4156 (= b_free!1061 (not b_next!1061))))

(declare-fun tp!4603 () Bool)

(declare-fun b_and!1871 () Bool)

(assert (=> start!4156 (= tp!4603 b_and!1871)))

(declare-fun b!31325 () Bool)

(declare-fun e!20020 () Bool)

(declare-fun e!20021 () Bool)

(declare-fun mapRes!1651 () Bool)

(assert (=> b!31325 (= e!20020 (and e!20021 mapRes!1651))))

(declare-fun condMapEmpty!1651 () Bool)

(declare-datatypes ((V!1711 0))(
  ( (V!1712 (val!734 Int)) )
))
(declare-datatypes ((ValueCell!508 0))(
  ( (ValueCellFull!508 (v!1823 V!1711)) (EmptyCell!508) )
))
(declare-datatypes ((array!2053 0))(
  ( (array!2054 (arr!980 (Array (_ BitVec 32) ValueCell!508)) (size!1081 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2053)

(declare-fun mapDefault!1651 () ValueCell!508)

