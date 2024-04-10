; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84160 () Bool)

(assert start!84160)

(declare-fun b_free!19861 () Bool)

(declare-fun b_next!19861 () Bool)

(assert (=> start!84160 (= b_free!19861 (not b_next!19861))))

(declare-fun tp!69187 () Bool)

(declare-fun b_and!31799 () Bool)

(assert (=> start!84160 (= tp!69187 b_and!31799)))

(declare-fun res!658511 () Bool)

(declare-fun e!554794 () Bool)

(assert (=> start!84160 (=> (not res!658511) (not e!554794))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84160 (= res!658511 (validMask!0 mask!1948))))

(assert (=> start!84160 e!554794))

(assert (=> start!84160 true))

(declare-fun tp_is_empty!22963 () Bool)

(assert (=> start!84160 tp_is_empty!22963))

(declare-datatypes ((V!35601 0))(
  ( (V!35602 (val!11532 Int)) )
))
(declare-datatypes ((ValueCell!11000 0))(
  ( (ValueCellFull!11000 (v!14094 V!35601)) (EmptyCell!11000) )
))
(declare-datatypes ((array!61907 0))(
  ( (array!61908 (arr!29811 (Array (_ BitVec 32) ValueCell!11000)) (size!30290 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61907)

(declare-fun e!554796 () Bool)

(declare-fun array_inv!23053 (array!61907) Bool)

(assert (=> start!84160 (and (array_inv!23053 _values!1278) e!554796)))

(assert (=> start!84160 tp!69187))

(declare-datatypes ((array!61909 0))(
  ( (array!61910 (arr!29812 (Array (_ BitVec 32) (_ BitVec 64))) (size!30291 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61909)

(declare-fun array_inv!23054 (array!61909) Bool)

(assert (=> start!84160 (array_inv!23054 _keys!1544)))

(declare-fun b!984107 () Bool)

(declare-fun e!554792 () Bool)

(declare-fun mapRes!36473 () Bool)

(assert (=> b!984107 (= e!554796 (and e!554792 mapRes!36473))))

(declare-fun condMapEmpty!36473 () Bool)

(declare-fun mapDefault!36473 () ValueCell!11000)

