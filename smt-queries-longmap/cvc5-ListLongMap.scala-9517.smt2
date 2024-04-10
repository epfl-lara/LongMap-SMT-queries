; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112964 () Bool)

(assert start!112964)

(declare-fun b!1339049 () Bool)

(declare-fun e!762591 () Bool)

(declare-fun tp_is_empty!37015 () Bool)

(assert (=> b!1339049 (= e!762591 tp_is_empty!37015)))

(declare-fun b!1339050 () Bool)

(declare-fun e!762593 () Bool)

(assert (=> b!1339050 (= e!762593 false)))

(declare-fun lt!593826 () Bool)

(declare-datatypes ((array!90896 0))(
  ( (array!90897 (arr!43904 (Array (_ BitVec 32) (_ BitVec 64))) (size!44454 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90896)

(declare-datatypes ((List!31095 0))(
  ( (Nil!31092) (Cons!31091 (h!32300 (_ BitVec 64)) (t!45427 List!31095)) )
))
(declare-fun arrayNoDuplicates!0 (array!90896 (_ BitVec 32) List!31095) Bool)

(assert (=> b!1339050 (= lt!593826 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31092))))

(declare-fun b!1339051 () Bool)

(declare-fun res!888362 () Bool)

(assert (=> b!1339051 (=> (not res!888362) (not e!762593))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90896 (_ BitVec 32)) Bool)

(assert (=> b!1339051 (= res!888362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339052 () Bool)

(declare-fun res!888361 () Bool)

(assert (=> b!1339052 (=> (not res!888361) (not e!762593))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54457 0))(
  ( (V!54458 (val!18582 Int)) )
))
(declare-datatypes ((ValueCell!17609 0))(
  ( (ValueCellFull!17609 (v!21230 V!54457)) (EmptyCell!17609) )
))
(declare-datatypes ((array!90898 0))(
  ( (array!90899 (arr!43905 (Array (_ BitVec 32) ValueCell!17609)) (size!44455 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90898)

(assert (=> b!1339052 (= res!888361 (and (= (size!44455 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44454 _keys!1571) (size!44455 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339053 () Bool)

(declare-fun e!762590 () Bool)

(declare-fun e!762592 () Bool)

(declare-fun mapRes!57229 () Bool)

(assert (=> b!1339053 (= e!762590 (and e!762592 mapRes!57229))))

(declare-fun condMapEmpty!57229 () Bool)

(declare-fun mapDefault!57229 () ValueCell!17609)

