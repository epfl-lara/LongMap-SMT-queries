; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112994 () Bool)

(assert start!112994)

(declare-fun b!1339319 () Bool)

(declare-fun e!762817 () Bool)

(declare-fun tp_is_empty!37045 () Bool)

(assert (=> b!1339319 (= e!762817 tp_is_empty!37045)))

(declare-fun b!1339320 () Bool)

(declare-fun e!762815 () Bool)

(assert (=> b!1339320 (= e!762815 false)))

(declare-fun lt!593871 () Bool)

(declare-datatypes ((array!90948 0))(
  ( (array!90949 (arr!43930 (Array (_ BitVec 32) (_ BitVec 64))) (size!44480 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90948)

(declare-datatypes ((List!31105 0))(
  ( (Nil!31102) (Cons!31101 (h!32310 (_ BitVec 64)) (t!45437 List!31105)) )
))
(declare-fun arrayNoDuplicates!0 (array!90948 (_ BitVec 32) List!31105) Bool)

(assert (=> b!1339320 (= lt!593871 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31102))))

(declare-fun res!888498 () Bool)

(assert (=> start!112994 (=> (not res!888498) (not e!762815))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112994 (= res!888498 (validMask!0 mask!1977))))

(assert (=> start!112994 e!762815))

(assert (=> start!112994 true))

(declare-datatypes ((V!54497 0))(
  ( (V!54498 (val!18597 Int)) )
))
(declare-datatypes ((ValueCell!17624 0))(
  ( (ValueCellFull!17624 (v!21245 V!54497)) (EmptyCell!17624) )
))
(declare-datatypes ((array!90950 0))(
  ( (array!90951 (arr!43931 (Array (_ BitVec 32) ValueCell!17624)) (size!44481 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90950)

(declare-fun e!762814 () Bool)

(declare-fun array_inv!33125 (array!90950) Bool)

(assert (=> start!112994 (and (array_inv!33125 _values!1303) e!762814)))

(declare-fun array_inv!33126 (array!90948) Bool)

(assert (=> start!112994 (array_inv!33126 _keys!1571)))

(declare-fun b!1339321 () Bool)

(declare-fun res!888496 () Bool)

(assert (=> b!1339321 (=> (not res!888496) (not e!762815))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339321 (= res!888496 (and (= (size!44481 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44480 _keys!1571) (size!44481 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339322 () Bool)

(declare-fun res!888497 () Bool)

(assert (=> b!1339322 (=> (not res!888497) (not e!762815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90948 (_ BitVec 32)) Bool)

(assert (=> b!1339322 (= res!888497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339323 () Bool)

(declare-fun e!762816 () Bool)

(assert (=> b!1339323 (= e!762816 tp_is_empty!37045)))

(declare-fun b!1339324 () Bool)

(declare-fun mapRes!57274 () Bool)

(assert (=> b!1339324 (= e!762814 (and e!762817 mapRes!57274))))

(declare-fun condMapEmpty!57274 () Bool)

(declare-fun mapDefault!57274 () ValueCell!17624)

