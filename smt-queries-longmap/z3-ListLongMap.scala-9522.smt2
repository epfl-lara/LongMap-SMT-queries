; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112996 () Bool)

(assert start!112996)

(declare-fun b!1339337 () Bool)

(declare-fun e!762830 () Bool)

(declare-fun tp_is_empty!37047 () Bool)

(assert (=> b!1339337 (= e!762830 tp_is_empty!37047)))

(declare-fun b!1339338 () Bool)

(declare-fun res!888506 () Bool)

(declare-fun e!762831 () Bool)

(assert (=> b!1339338 (=> (not res!888506) (not e!762831))))

(declare-datatypes ((array!90952 0))(
  ( (array!90953 (arr!43932 (Array (_ BitVec 32) (_ BitVec 64))) (size!44482 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90952)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90952 (_ BitVec 32)) Bool)

(assert (=> b!1339338 (= res!888506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339339 () Bool)

(declare-fun e!762829 () Bool)

(assert (=> b!1339339 (= e!762829 tp_is_empty!37047)))

(declare-fun b!1339340 () Bool)

(declare-fun e!762833 () Bool)

(declare-fun mapRes!57277 () Bool)

(assert (=> b!1339340 (= e!762833 (and e!762830 mapRes!57277))))

(declare-fun condMapEmpty!57277 () Bool)

(declare-datatypes ((V!54499 0))(
  ( (V!54500 (val!18598 Int)) )
))
(declare-datatypes ((ValueCell!17625 0))(
  ( (ValueCellFull!17625 (v!21246 V!54499)) (EmptyCell!17625) )
))
(declare-datatypes ((array!90954 0))(
  ( (array!90955 (arr!43933 (Array (_ BitVec 32) ValueCell!17625)) (size!44483 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90954)

(declare-fun mapDefault!57277 () ValueCell!17625)

(assert (=> b!1339340 (= condMapEmpty!57277 (= (arr!43933 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17625)) mapDefault!57277)))))

(declare-fun b!1339341 () Bool)

(assert (=> b!1339341 (= e!762831 false)))

(declare-fun lt!593874 () Bool)

(declare-datatypes ((List!31106 0))(
  ( (Nil!31103) (Cons!31102 (h!32311 (_ BitVec 64)) (t!45438 List!31106)) )
))
(declare-fun arrayNoDuplicates!0 (array!90952 (_ BitVec 32) List!31106) Bool)

(assert (=> b!1339341 (= lt!593874 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31103))))

(declare-fun b!1339342 () Bool)

(declare-fun res!888507 () Bool)

(assert (=> b!1339342 (=> (not res!888507) (not e!762831))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339342 (= res!888507 (and (= (size!44483 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44482 _keys!1571) (size!44483 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888505 () Bool)

(assert (=> start!112996 (=> (not res!888505) (not e!762831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112996 (= res!888505 (validMask!0 mask!1977))))

(assert (=> start!112996 e!762831))

(assert (=> start!112996 true))

(declare-fun array_inv!33127 (array!90954) Bool)

(assert (=> start!112996 (and (array_inv!33127 _values!1303) e!762833)))

(declare-fun array_inv!33128 (array!90952) Bool)

(assert (=> start!112996 (array_inv!33128 _keys!1571)))

(declare-fun mapIsEmpty!57277 () Bool)

(assert (=> mapIsEmpty!57277 mapRes!57277))

(declare-fun mapNonEmpty!57277 () Bool)

(declare-fun tp!108976 () Bool)

(assert (=> mapNonEmpty!57277 (= mapRes!57277 (and tp!108976 e!762829))))

(declare-fun mapRest!57277 () (Array (_ BitVec 32) ValueCell!17625))

(declare-fun mapValue!57277 () ValueCell!17625)

(declare-fun mapKey!57277 () (_ BitVec 32))

(assert (=> mapNonEmpty!57277 (= (arr!43933 _values!1303) (store mapRest!57277 mapKey!57277 mapValue!57277))))

(assert (= (and start!112996 res!888505) b!1339342))

(assert (= (and b!1339342 res!888507) b!1339338))

(assert (= (and b!1339338 res!888506) b!1339341))

(assert (= (and b!1339340 condMapEmpty!57277) mapIsEmpty!57277))

(assert (= (and b!1339340 (not condMapEmpty!57277)) mapNonEmpty!57277))

(get-info :version)

(assert (= (and mapNonEmpty!57277 ((_ is ValueCellFull!17625) mapValue!57277)) b!1339339))

(assert (= (and b!1339340 ((_ is ValueCellFull!17625) mapDefault!57277)) b!1339337))

(assert (= start!112996 b!1339340))

(declare-fun m!1227433 () Bool)

(assert (=> b!1339338 m!1227433))

(declare-fun m!1227435 () Bool)

(assert (=> b!1339341 m!1227435))

(declare-fun m!1227437 () Bool)

(assert (=> start!112996 m!1227437))

(declare-fun m!1227439 () Bool)

(assert (=> start!112996 m!1227439))

(declare-fun m!1227441 () Bool)

(assert (=> start!112996 m!1227441))

(declare-fun m!1227443 () Bool)

(assert (=> mapNonEmpty!57277 m!1227443))

(check-sat (not mapNonEmpty!57277) (not b!1339341) tp_is_empty!37047 (not start!112996) (not b!1339338))
(check-sat)
