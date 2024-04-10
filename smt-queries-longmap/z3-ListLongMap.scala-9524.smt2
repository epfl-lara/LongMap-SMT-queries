; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113008 () Bool)

(assert start!113008)

(declare-fun b!1339445 () Bool)

(declare-fun e!762920 () Bool)

(assert (=> b!1339445 (= e!762920 false)))

(declare-fun lt!593892 () Bool)

(declare-datatypes ((array!90974 0))(
  ( (array!90975 (arr!43943 (Array (_ BitVec 32) (_ BitVec 64))) (size!44493 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90974)

(declare-datatypes ((List!31109 0))(
  ( (Nil!31106) (Cons!31105 (h!32314 (_ BitVec 64)) (t!45441 List!31109)) )
))
(declare-fun arrayNoDuplicates!0 (array!90974 (_ BitVec 32) List!31109) Bool)

(assert (=> b!1339445 (= lt!593892 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31106))))

(declare-fun b!1339446 () Bool)

(declare-fun e!762923 () Bool)

(declare-fun tp_is_empty!37059 () Bool)

(assert (=> b!1339446 (= e!762923 tp_is_empty!37059)))

(declare-fun mapIsEmpty!57295 () Bool)

(declare-fun mapRes!57295 () Bool)

(assert (=> mapIsEmpty!57295 mapRes!57295))

(declare-fun b!1339447 () Bool)

(declare-fun res!888559 () Bool)

(assert (=> b!1339447 (=> (not res!888559) (not e!762920))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90974 (_ BitVec 32)) Bool)

(assert (=> b!1339447 (= res!888559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339448 () Bool)

(declare-fun res!888561 () Bool)

(assert (=> b!1339448 (=> (not res!888561) (not e!762920))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54515 0))(
  ( (V!54516 (val!18604 Int)) )
))
(declare-datatypes ((ValueCell!17631 0))(
  ( (ValueCellFull!17631 (v!21252 V!54515)) (EmptyCell!17631) )
))
(declare-datatypes ((array!90976 0))(
  ( (array!90977 (arr!43944 (Array (_ BitVec 32) ValueCell!17631)) (size!44494 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90976)

(assert (=> b!1339448 (= res!888561 (and (= (size!44494 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44493 _keys!1571) (size!44494 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339449 () Bool)

(declare-fun e!762922 () Bool)

(declare-fun e!762921 () Bool)

(assert (=> b!1339449 (= e!762922 (and e!762921 mapRes!57295))))

(declare-fun condMapEmpty!57295 () Bool)

(declare-fun mapDefault!57295 () ValueCell!17631)

(assert (=> b!1339449 (= condMapEmpty!57295 (= (arr!43944 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17631)) mapDefault!57295)))))

(declare-fun mapNonEmpty!57295 () Bool)

(declare-fun tp!108994 () Bool)

(assert (=> mapNonEmpty!57295 (= mapRes!57295 (and tp!108994 e!762923))))

(declare-fun mapRest!57295 () (Array (_ BitVec 32) ValueCell!17631))

(declare-fun mapKey!57295 () (_ BitVec 32))

(declare-fun mapValue!57295 () ValueCell!17631)

(assert (=> mapNonEmpty!57295 (= (arr!43944 _values!1303) (store mapRest!57295 mapKey!57295 mapValue!57295))))

(declare-fun b!1339450 () Bool)

(assert (=> b!1339450 (= e!762921 tp_is_empty!37059)))

(declare-fun res!888560 () Bool)

(assert (=> start!113008 (=> (not res!888560) (not e!762920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113008 (= res!888560 (validMask!0 mask!1977))))

(assert (=> start!113008 e!762920))

(assert (=> start!113008 true))

(declare-fun array_inv!33135 (array!90976) Bool)

(assert (=> start!113008 (and (array_inv!33135 _values!1303) e!762922)))

(declare-fun array_inv!33136 (array!90974) Bool)

(assert (=> start!113008 (array_inv!33136 _keys!1571)))

(assert (= (and start!113008 res!888560) b!1339448))

(assert (= (and b!1339448 res!888561) b!1339447))

(assert (= (and b!1339447 res!888559) b!1339445))

(assert (= (and b!1339449 condMapEmpty!57295) mapIsEmpty!57295))

(assert (= (and b!1339449 (not condMapEmpty!57295)) mapNonEmpty!57295))

(get-info :version)

(assert (= (and mapNonEmpty!57295 ((_ is ValueCellFull!17631) mapValue!57295)) b!1339446))

(assert (= (and b!1339449 ((_ is ValueCellFull!17631) mapDefault!57295)) b!1339450))

(assert (= start!113008 b!1339449))

(declare-fun m!1227505 () Bool)

(assert (=> b!1339445 m!1227505))

(declare-fun m!1227507 () Bool)

(assert (=> b!1339447 m!1227507))

(declare-fun m!1227509 () Bool)

(assert (=> mapNonEmpty!57295 m!1227509))

(declare-fun m!1227511 () Bool)

(assert (=> start!113008 m!1227511))

(declare-fun m!1227513 () Bool)

(assert (=> start!113008 m!1227513))

(declare-fun m!1227515 () Bool)

(assert (=> start!113008 m!1227515))

(check-sat tp_is_empty!37059 (not b!1339447) (not mapNonEmpty!57295) (not start!113008) (not b!1339445))
(check-sat)
