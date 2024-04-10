; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97950 () Bool)

(assert start!97950)

(declare-fun b_free!23651 () Bool)

(declare-fun b_next!23651 () Bool)

(assert (=> start!97950 (= b_free!23651 (not b_next!23651))))

(declare-fun tp!83657 () Bool)

(declare-fun b_and!38085 () Bool)

(assert (=> start!97950 (= tp!83657 b_and!38085)))

(declare-fun b!1122629 () Bool)

(declare-fun e!639138 () Bool)

(declare-fun e!639144 () Bool)

(declare-fun mapRes!44089 () Bool)

(assert (=> b!1122629 (= e!639138 (and e!639144 mapRes!44089))))

(declare-fun condMapEmpty!44089 () Bool)

(declare-datatypes ((V!42701 0))(
  ( (V!42702 (val!14147 Int)) )
))
(declare-datatypes ((ValueCell!13381 0))(
  ( (ValueCellFull!13381 (v!16780 V!42701)) (EmptyCell!13381) )
))
(declare-datatypes ((array!73239 0))(
  ( (array!73240 (arr!35272 (Array (_ BitVec 32) ValueCell!13381)) (size!35808 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73239)

(declare-fun mapDefault!44089 () ValueCell!13381)

