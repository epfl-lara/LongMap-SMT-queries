; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112982 () Bool)

(assert start!112982)

(declare-fun res!888415 () Bool)

(declare-fun e!762693 () Bool)

(assert (=> start!112982 (=> (not res!888415) (not e!762693))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112982 (= res!888415 (validMask!0 mask!1977))))

(assert (=> start!112982 e!762693))

(assert (=> start!112982 true))

(declare-datatypes ((V!54481 0))(
  ( (V!54482 (val!18591 Int)) )
))
(declare-datatypes ((ValueCell!17618 0))(
  ( (ValueCellFull!17618 (v!21238 V!54481)) (EmptyCell!17618) )
))
(declare-datatypes ((array!90871 0))(
  ( (array!90872 (arr!43892 (Array (_ BitVec 32) ValueCell!17618)) (size!44444 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90871)

(declare-fun e!762694 () Bool)

(declare-fun array_inv!33287 (array!90871) Bool)

(assert (=> start!112982 (and (array_inv!33287 _values!1303) e!762694)))

(declare-datatypes ((array!90873 0))(
  ( (array!90874 (arr!43893 (Array (_ BitVec 32) (_ BitVec 64))) (size!44445 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90873)

(declare-fun array_inv!33288 (array!90873) Bool)

(assert (=> start!112982 (array_inv!33288 _keys!1571)))

(declare-fun mapNonEmpty!57256 () Bool)

(declare-fun mapRes!57256 () Bool)

(declare-fun tp!108956 () Bool)

(declare-fun e!762695 () Bool)

(assert (=> mapNonEmpty!57256 (= mapRes!57256 (and tp!108956 e!762695))))

(declare-fun mapValue!57256 () ValueCell!17618)

(declare-fun mapKey!57256 () (_ BitVec 32))

(declare-fun mapRest!57256 () (Array (_ BitVec 32) ValueCell!17618))

(assert (=> mapNonEmpty!57256 (= (arr!43892 _values!1303) (store mapRest!57256 mapKey!57256 mapValue!57256))))

(declare-fun b!1339141 () Bool)

(declare-fun e!762691 () Bool)

(declare-fun tp_is_empty!37033 () Bool)

(assert (=> b!1339141 (= e!762691 tp_is_empty!37033)))

(declare-fun b!1339142 () Bool)

(assert (=> b!1339142 (= e!762694 (and e!762691 mapRes!57256))))

(declare-fun condMapEmpty!57256 () Bool)

(declare-fun mapDefault!57256 () ValueCell!17618)

(assert (=> b!1339142 (= condMapEmpty!57256 (= (arr!43892 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17618)) mapDefault!57256)))))

(declare-fun b!1339143 () Bool)

(declare-fun res!888413 () Bool)

(assert (=> b!1339143 (=> (not res!888413) (not e!762693))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339143 (= res!888413 (and (= (size!44444 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44445 _keys!1571) (size!44444 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57256 () Bool)

(assert (=> mapIsEmpty!57256 mapRes!57256))

(declare-fun b!1339144 () Bool)

(assert (=> b!1339144 (= e!762693 false)))

(declare-fun lt!593667 () Bool)

(declare-datatypes ((List!31145 0))(
  ( (Nil!31142) (Cons!31141 (h!32350 (_ BitVec 64)) (t!45469 List!31145)) )
))
(declare-fun arrayNoDuplicates!0 (array!90873 (_ BitVec 32) List!31145) Bool)

(assert (=> b!1339144 (= lt!593667 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31142))))

(declare-fun b!1339145 () Bool)

(assert (=> b!1339145 (= e!762695 tp_is_empty!37033)))

(declare-fun b!1339146 () Bool)

(declare-fun res!888414 () Bool)

(assert (=> b!1339146 (=> (not res!888414) (not e!762693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90873 (_ BitVec 32)) Bool)

(assert (=> b!1339146 (= res!888414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!112982 res!888415) b!1339143))

(assert (= (and b!1339143 res!888413) b!1339146))

(assert (= (and b!1339146 res!888414) b!1339144))

(assert (= (and b!1339142 condMapEmpty!57256) mapIsEmpty!57256))

(assert (= (and b!1339142 (not condMapEmpty!57256)) mapNonEmpty!57256))

(get-info :version)

(assert (= (and mapNonEmpty!57256 ((_ is ValueCellFull!17618) mapValue!57256)) b!1339145))

(assert (= (and b!1339142 ((_ is ValueCellFull!17618) mapDefault!57256)) b!1339141))

(assert (= start!112982 b!1339142))

(declare-fun m!1226833 () Bool)

(assert (=> start!112982 m!1226833))

(declare-fun m!1226835 () Bool)

(assert (=> start!112982 m!1226835))

(declare-fun m!1226837 () Bool)

(assert (=> start!112982 m!1226837))

(declare-fun m!1226839 () Bool)

(assert (=> mapNonEmpty!57256 m!1226839))

(declare-fun m!1226841 () Bool)

(assert (=> b!1339144 m!1226841))

(declare-fun m!1226843 () Bool)

(assert (=> b!1339146 m!1226843))

(check-sat tp_is_empty!37033 (not b!1339146) (not b!1339144) (not mapNonEmpty!57256) (not start!112982))
(check-sat)
