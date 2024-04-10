; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83984 () Bool)

(assert start!83984)

(declare-fun b_free!19739 () Bool)

(declare-fun b_next!19739 () Bool)

(assert (=> start!83984 (= b_free!19739 (not b_next!19739))))

(declare-fun tp!68740 () Bool)

(declare-fun b_and!31561 () Bool)

(assert (=> start!83984 (= tp!68740 b_and!31561)))

(declare-fun b!981474 () Bool)

(declare-fun e!553300 () Bool)

(declare-fun e!553299 () Bool)

(declare-fun mapRes!36209 () Bool)

(assert (=> b!981474 (= e!553300 (and e!553299 mapRes!36209))))

(declare-fun condMapEmpty!36209 () Bool)

(declare-datatypes ((V!35365 0))(
  ( (V!35366 (val!11444 Int)) )
))
(declare-datatypes ((ValueCell!10912 0))(
  ( (ValueCellFull!10912 (v!14006 V!35365)) (EmptyCell!10912) )
))
(declare-datatypes ((array!61571 0))(
  ( (array!61572 (arr!29643 (Array (_ BitVec 32) ValueCell!10912)) (size!30122 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61571)

(declare-fun mapDefault!36209 () ValueCell!10912)

