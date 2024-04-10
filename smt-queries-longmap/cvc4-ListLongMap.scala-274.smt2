; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4474 () Bool)

(assert start!4474)

(declare-fun b_free!1235 () Bool)

(declare-fun b_next!1235 () Bool)

(assert (=> start!4474 (= b_free!1235 (not b_next!1235))))

(declare-fun tp!5142 () Bool)

(declare-fun b_and!2057 () Bool)

(assert (=> start!4474 (= tp!5142 b_and!2057)))

(declare-fun b!34741 () Bool)

(declare-fun e!22000 () Bool)

(declare-fun e!21999 () Bool)

(declare-fun mapRes!1930 () Bool)

(assert (=> b!34741 (= e!22000 (and e!21999 mapRes!1930))))

(declare-fun condMapEmpty!1930 () Bool)

(declare-datatypes ((V!1943 0))(
  ( (V!1944 (val!821 Int)) )
))
(declare-datatypes ((ValueCell!595 0))(
  ( (ValueCellFull!595 (v!1916 V!1943)) (EmptyCell!595) )
))
(declare-datatypes ((array!2393 0))(
  ( (array!2394 (arr!1144 (Array (_ BitVec 32) ValueCell!595)) (size!1245 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2393)

(declare-fun mapDefault!1930 () ValueCell!595)

