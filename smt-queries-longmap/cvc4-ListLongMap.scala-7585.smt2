; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95834 () Bool)

(assert start!95834)

(declare-fun b_free!22487 () Bool)

(declare-fun b_next!22487 () Bool)

(assert (=> start!95834 (= b_free!22487 (not b_next!22487))))

(declare-fun tp!79309 () Bool)

(declare-fun b_and!35649 () Bool)

(assert (=> start!95834 (= tp!79309 b_and!35649)))

(declare-fun b!1084465 () Bool)

(declare-fun e!619562 () Bool)

(declare-fun e!619564 () Bool)

(declare-fun mapRes!41488 () Bool)

(assert (=> b!1084465 (= e!619562 (and e!619564 mapRes!41488))))

(declare-fun condMapEmpty!41488 () Bool)

(declare-datatypes ((V!40445 0))(
  ( (V!40446 (val!13301 Int)) )
))
(declare-datatypes ((ValueCell!12535 0))(
  ( (ValueCellFull!12535 (v!15922 V!40445)) (EmptyCell!12535) )
))
(declare-datatypes ((array!69917 0))(
  ( (array!69918 (arr!33632 (Array (_ BitVec 32) ValueCell!12535)) (size!34168 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69917)

(declare-fun mapDefault!41488 () ValueCell!12535)

