; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4198 () Bool)

(assert start!4198)

(declare-fun b_free!1103 () Bool)

(declare-fun b_next!1103 () Bool)

(assert (=> start!4198 (= b_free!1103 (not b_next!1103))))

(declare-fun tp!4728 () Bool)

(declare-fun b_and!1913 () Bool)

(assert (=> start!4198 (= tp!4728 b_and!1913)))

(declare-fun b!31917 () Bool)

(declare-fun e!20338 () Bool)

(declare-fun e!20336 () Bool)

(declare-fun mapRes!1714 () Bool)

(assert (=> b!31917 (= e!20338 (and e!20336 mapRes!1714))))

(declare-fun condMapEmpty!1714 () Bool)

(declare-datatypes ((V!1767 0))(
  ( (V!1768 (val!755 Int)) )
))
(declare-datatypes ((ValueCell!529 0))(
  ( (ValueCellFull!529 (v!1844 V!1767)) (EmptyCell!529) )
))
(declare-datatypes ((array!2129 0))(
  ( (array!2130 (arr!1018 (Array (_ BitVec 32) ValueCell!529)) (size!1119 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2129)

(declare-fun mapDefault!1714 () ValueCell!529)

