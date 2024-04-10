; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4126 () Bool)

(assert start!4126)

(declare-fun b_free!1031 () Bool)

(declare-fun b_next!1031 () Bool)

(assert (=> start!4126 (= b_free!1031 (not b_next!1031))))

(declare-fun tp!4513 () Bool)

(declare-fun b_and!1841 () Bool)

(assert (=> start!4126 (= tp!4513 b_and!1841)))

(declare-fun b!30872 () Bool)

(declare-fun e!19776 () Bool)

(declare-fun e!19779 () Bool)

(declare-fun mapRes!1606 () Bool)

(assert (=> b!30872 (= e!19776 (and e!19779 mapRes!1606))))

(declare-fun condMapEmpty!1606 () Bool)

(declare-datatypes ((V!1671 0))(
  ( (V!1672 (val!719 Int)) )
))
(declare-datatypes ((ValueCell!493 0))(
  ( (ValueCellFull!493 (v!1808 V!1671)) (EmptyCell!493) )
))
(declare-datatypes ((array!1995 0))(
  ( (array!1996 (arr!951 (Array (_ BitVec 32) ValueCell!493)) (size!1052 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1995)

(declare-fun mapDefault!1606 () ValueCell!493)

