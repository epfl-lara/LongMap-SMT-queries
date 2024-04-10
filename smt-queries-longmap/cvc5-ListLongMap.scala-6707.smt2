; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84214 () Bool)

(assert start!84214)

(declare-fun b_free!19915 () Bool)

(declare-fun b_next!19915 () Bool)

(assert (=> start!84214 (= b_free!19915 (not b_next!19915))))

(declare-fun tp!69349 () Bool)

(declare-fun b_and!31907 () Bool)

(assert (=> start!84214 (= tp!69349 b_and!31907)))

(declare-fun b!985052 () Bool)

(declare-fun e!555282 () Bool)

(declare-fun e!555277 () Bool)

(declare-fun mapRes!36554 () Bool)

(assert (=> b!985052 (= e!555282 (and e!555277 mapRes!36554))))

(declare-fun condMapEmpty!36554 () Bool)

(declare-datatypes ((V!35673 0))(
  ( (V!35674 (val!11559 Int)) )
))
(declare-datatypes ((ValueCell!11027 0))(
  ( (ValueCellFull!11027 (v!14121 V!35673)) (EmptyCell!11027) )
))
(declare-datatypes ((array!62011 0))(
  ( (array!62012 (arr!29863 (Array (_ BitVec 32) ValueCell!11027)) (size!30342 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62011)

(declare-fun mapDefault!36554 () ValueCell!11027)

