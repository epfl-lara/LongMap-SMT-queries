; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97040 () Bool)

(assert start!97040)

(declare-fun b!1103777 () Bool)

(declare-fun e!630096 () Bool)

(declare-fun e!630095 () Bool)

(declare-fun mapRes!42799 () Bool)

(assert (=> b!1103777 (= e!630096 (and e!630095 mapRes!42799))))

(declare-fun condMapEmpty!42799 () Bool)

(declare-datatypes ((V!41565 0))(
  ( (V!41566 (val!13721 Int)) )
))
(declare-datatypes ((ValueCell!12955 0))(
  ( (ValueCellFull!12955 (v!16353 V!41565)) (EmptyCell!12955) )
))
(declare-datatypes ((array!71581 0))(
  ( (array!71582 (arr!34447 (Array (_ BitVec 32) ValueCell!12955)) (size!34983 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71581)

(declare-fun mapDefault!42799 () ValueCell!12955)

