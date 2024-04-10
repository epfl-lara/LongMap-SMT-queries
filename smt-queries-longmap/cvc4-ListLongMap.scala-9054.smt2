; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109112 () Bool)

(assert start!109112)

(declare-fun b_free!28601 () Bool)

(declare-fun b_next!28601 () Bool)

(assert (=> start!109112 (= b_free!28601 (not b_next!28601))))

(declare-fun tp!100922 () Bool)

(declare-fun b_and!46691 () Bool)

(assert (=> start!109112 (= tp!100922 b_and!46691)))

(declare-fun b!1290101 () Bool)

(declare-fun e!736549 () Bool)

(declare-fun tp_is_empty!34241 () Bool)

(assert (=> b!1290101 (= e!736549 tp_is_empty!34241)))

(declare-fun b!1290102 () Bool)

(declare-fun res!857018 () Bool)

(declare-fun e!736550 () Bool)

(assert (=> b!1290102 (=> (not res!857018) (not e!736550))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50757 0))(
  ( (V!50758 (val!17195 Int)) )
))
(declare-datatypes ((ValueCell!16222 0))(
  ( (ValueCellFull!16222 (v!19798 V!50757)) (EmptyCell!16222) )
))
(declare-datatypes ((array!85524 0))(
  ( (array!85525 (arr!41263 (Array (_ BitVec 32) ValueCell!16222)) (size!41813 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85524)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85526 0))(
  ( (array!85527 (arr!41264 (Array (_ BitVec 32) (_ BitVec 64))) (size!41814 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85526)

(assert (=> b!1290102 (= res!857018 (and (= (size!41813 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41814 _keys!1741) (size!41813 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290103 () Bool)

(declare-fun e!736548 () Bool)

(declare-fun mapRes!52922 () Bool)

(assert (=> b!1290103 (= e!736548 (and e!736549 mapRes!52922))))

(declare-fun condMapEmpty!52922 () Bool)

(declare-fun mapDefault!52922 () ValueCell!16222)

