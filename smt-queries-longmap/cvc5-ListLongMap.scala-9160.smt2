; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109934 () Bool)

(assert start!109934)

(declare-fun b_free!29233 () Bool)

(declare-fun b_next!29233 () Bool)

(assert (=> start!109934 (= b_free!29233 (not b_next!29233))))

(declare-fun tp!102839 () Bool)

(declare-fun b_and!47375 () Bool)

(assert (=> start!109934 (= tp!102839 b_and!47375)))

(declare-fun mapIsEmpty!53892 () Bool)

(declare-fun mapRes!53892 () Bool)

(assert (=> mapIsEmpty!53892 mapRes!53892))

(declare-fun b!1302286 () Bool)

(declare-fun e!742795 () Bool)

(declare-fun e!742793 () Bool)

(assert (=> b!1302286 (= e!742795 (and e!742793 mapRes!53892))))

(declare-fun condMapEmpty!53892 () Bool)

(declare-datatypes ((V!51601 0))(
  ( (V!51602 (val!17511 Int)) )
))
(declare-datatypes ((ValueCell!16538 0))(
  ( (ValueCellFull!16538 (v!20123 V!51601)) (EmptyCell!16538) )
))
(declare-datatypes ((array!86758 0))(
  ( (array!86759 (arr!41873 (Array (_ BitVec 32) ValueCell!16538)) (size!42423 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86758)

(declare-fun mapDefault!53892 () ValueCell!16538)

