; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113006 () Bool)

(assert start!113006)

(declare-fun b!1339427 () Bool)

(declare-fun e!762906 () Bool)

(assert (=> b!1339427 (= e!762906 false)))

(declare-fun lt!593889 () Bool)

(declare-datatypes ((array!90970 0))(
  ( (array!90971 (arr!43941 (Array (_ BitVec 32) (_ BitVec 64))) (size!44491 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90970)

(declare-datatypes ((List!31108 0))(
  ( (Nil!31105) (Cons!31104 (h!32313 (_ BitVec 64)) (t!45440 List!31108)) )
))
(declare-fun arrayNoDuplicates!0 (array!90970 (_ BitVec 32) List!31108) Bool)

(assert (=> b!1339427 (= lt!593889 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31105))))

(declare-fun b!1339428 () Bool)

(declare-fun e!762907 () Bool)

(declare-fun tp_is_empty!37057 () Bool)

(assert (=> b!1339428 (= e!762907 tp_is_empty!37057)))

(declare-fun res!888551 () Bool)

(assert (=> start!113006 (=> (not res!888551) (not e!762906))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113006 (= res!888551 (validMask!0 mask!1977))))

(assert (=> start!113006 e!762906))

(assert (=> start!113006 true))

(declare-datatypes ((V!54513 0))(
  ( (V!54514 (val!18603 Int)) )
))
(declare-datatypes ((ValueCell!17630 0))(
  ( (ValueCellFull!17630 (v!21251 V!54513)) (EmptyCell!17630) )
))
(declare-datatypes ((array!90972 0))(
  ( (array!90973 (arr!43942 (Array (_ BitVec 32) ValueCell!17630)) (size!44492 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90972)

(declare-fun e!762904 () Bool)

(declare-fun array_inv!33133 (array!90972) Bool)

(assert (=> start!113006 (and (array_inv!33133 _values!1303) e!762904)))

(declare-fun array_inv!33134 (array!90970) Bool)

(assert (=> start!113006 (array_inv!33134 _keys!1571)))

(declare-fun b!1339429 () Bool)

(declare-fun e!762908 () Bool)

(assert (=> b!1339429 (= e!762908 tp_is_empty!37057)))

(declare-fun b!1339430 () Bool)

(declare-fun res!888550 () Bool)

(assert (=> b!1339430 (=> (not res!888550) (not e!762906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90970 (_ BitVec 32)) Bool)

(assert (=> b!1339430 (= res!888550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339431 () Bool)

(declare-fun mapRes!57292 () Bool)

(assert (=> b!1339431 (= e!762904 (and e!762907 mapRes!57292))))

(declare-fun condMapEmpty!57292 () Bool)

(declare-fun mapDefault!57292 () ValueCell!17630)

