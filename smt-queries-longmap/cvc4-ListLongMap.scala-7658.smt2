; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96272 () Bool)

(assert start!96272)

(declare-fun b_free!22925 () Bool)

(declare-fun b_next!22925 () Bool)

(assert (=> start!96272 (= b_free!22925 (not b_next!22925))))

(declare-fun tp!80623 () Bool)

(declare-fun b_and!36525 () Bool)

(assert (=> start!96272 (= tp!80623 b_and!36525)))

(declare-fun b!1093849 () Bool)

(declare-fun e!624537 () Bool)

(declare-fun e!624542 () Bool)

(declare-fun mapRes!42145 () Bool)

(assert (=> b!1093849 (= e!624537 (and e!624542 mapRes!42145))))

(declare-fun condMapEmpty!42145 () Bool)

(declare-datatypes ((V!41029 0))(
  ( (V!41030 (val!13520 Int)) )
))
(declare-datatypes ((ValueCell!12754 0))(
  ( (ValueCellFull!12754 (v!16141 V!41029)) (EmptyCell!12754) )
))
(declare-datatypes ((array!70771 0))(
  ( (array!70772 (arr!34059 (Array (_ BitVec 32) ValueCell!12754)) (size!34595 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70771)

(declare-fun mapDefault!42145 () ValueCell!12754)

