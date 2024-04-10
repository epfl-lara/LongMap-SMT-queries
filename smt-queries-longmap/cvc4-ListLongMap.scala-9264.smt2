; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110936 () Bool)

(assert start!110936)

(declare-fun b_free!29771 () Bool)

(declare-fun b_next!29771 () Bool)

(assert (=> start!110936 (= b_free!29771 (not b_next!29771))))

(declare-fun tp!104635 () Bool)

(declare-fun b_and!47979 () Bool)

(assert (=> start!110936 (= tp!104635 b_and!47979)))

(declare-fun b!1313390 () Bool)

(declare-fun e!749145 () Bool)

(declare-fun tp_is_empty!35501 () Bool)

(assert (=> b!1313390 (= e!749145 tp_is_empty!35501)))

(declare-fun mapIsEmpty!54880 () Bool)

(declare-fun mapRes!54880 () Bool)

(assert (=> mapIsEmpty!54880 mapRes!54880))

(declare-fun b!1313391 () Bool)

(declare-fun e!749146 () Bool)

(assert (=> b!1313391 (= e!749146 (and e!749145 mapRes!54880))))

(declare-fun condMapEmpty!54880 () Bool)

(declare-datatypes ((V!52437 0))(
  ( (V!52438 (val!17825 Int)) )
))
(declare-datatypes ((ValueCell!16852 0))(
  ( (ValueCellFull!16852 (v!20452 V!52437)) (EmptyCell!16852) )
))
(declare-datatypes ((array!87982 0))(
  ( (array!87983 (arr!42471 (Array (_ BitVec 32) ValueCell!16852)) (size!43021 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87982)

(declare-fun mapDefault!54880 () ValueCell!16852)

