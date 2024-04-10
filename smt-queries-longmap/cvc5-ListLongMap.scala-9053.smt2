; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109102 () Bool)

(assert start!109102)

(declare-fun b_free!28591 () Bool)

(declare-fun b_next!28591 () Bool)

(assert (=> start!109102 (= b_free!28591 (not b_next!28591))))

(declare-fun tp!100892 () Bool)

(declare-fun b_and!46681 () Bool)

(assert (=> start!109102 (= tp!100892 b_and!46681)))

(declare-fun res!856882 () Bool)

(declare-fun e!736456 () Bool)

(assert (=> start!109102 (=> (not res!856882) (not e!736456))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109102 (= res!856882 (validMask!0 mask!2175))))

(assert (=> start!109102 e!736456))

(declare-fun tp_is_empty!34231 () Bool)

(assert (=> start!109102 tp_is_empty!34231))

(assert (=> start!109102 true))

(declare-datatypes ((V!50745 0))(
  ( (V!50746 (val!17190 Int)) )
))
(declare-datatypes ((ValueCell!16217 0))(
  ( (ValueCellFull!16217 (v!19793 V!50745)) (EmptyCell!16217) )
))
(declare-datatypes ((array!85504 0))(
  ( (array!85505 (arr!41253 (Array (_ BitVec 32) ValueCell!16217)) (size!41803 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85504)

(declare-fun e!736455 () Bool)

(declare-fun array_inv!31267 (array!85504) Bool)

(assert (=> start!109102 (and (array_inv!31267 _values!1445) e!736455)))

(declare-datatypes ((array!85506 0))(
  ( (array!85507 (arr!41254 (Array (_ BitVec 32) (_ BitVec 64))) (size!41804 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85506)

(declare-fun array_inv!31268 (array!85506) Bool)

(assert (=> start!109102 (array_inv!31268 _keys!1741)))

(assert (=> start!109102 tp!100892))

(declare-fun b!1289921 () Bool)

(declare-fun e!736460 () Bool)

(assert (=> b!1289921 (= e!736460 tp_is_empty!34231)))

(declare-fun b!1289922 () Bool)

(declare-fun res!856881 () Bool)

(assert (=> b!1289922 (=> (not res!856881) (not e!736456))))

(declare-datatypes ((List!29251 0))(
  ( (Nil!29248) (Cons!29247 (h!30456 (_ BitVec 64)) (t!42815 List!29251)) )
))
(declare-fun arrayNoDuplicates!0 (array!85506 (_ BitVec 32) List!29251) Bool)

(assert (=> b!1289922 (= res!856881 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29248))))

(declare-fun b!1289923 () Bool)

(declare-fun res!856886 () Bool)

(assert (=> b!1289923 (=> (not res!856886) (not e!736456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85506 (_ BitVec 32)) Bool)

(assert (=> b!1289923 (= res!856886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289924 () Bool)

(declare-fun res!856885 () Bool)

(assert (=> b!1289924 (=> (not res!856885) (not e!736456))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1289924 (= res!856885 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41804 _keys!1741))))))

(declare-fun b!1289925 () Bool)

(declare-fun res!856879 () Bool)

(assert (=> b!1289925 (=> (not res!856879) (not e!736456))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289925 (= res!856879 (and (= (size!41803 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41804 _keys!1741) (size!41803 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289926 () Bool)

(declare-fun e!736457 () Bool)

(declare-fun mapRes!52907 () Bool)

(assert (=> b!1289926 (= e!736455 (and e!736457 mapRes!52907))))

(declare-fun condMapEmpty!52907 () Bool)

(declare-fun mapDefault!52907 () ValueCell!16217)

