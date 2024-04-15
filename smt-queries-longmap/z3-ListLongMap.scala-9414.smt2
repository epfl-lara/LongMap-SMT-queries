; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112092 () Bool)

(assert start!112092)

(declare-fun res!880964 () Bool)

(declare-fun e!756821 () Bool)

(assert (=> start!112092 (=> (not res!880964) (not e!756821))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112092 (= res!880964 (validMask!0 mask!1998))))

(assert (=> start!112092 e!756821))

(assert (=> start!112092 true))

(declare-datatypes ((V!53633 0))(
  ( (V!53634 (val!18273 Int)) )
))
(declare-datatypes ((ValueCell!17300 0))(
  ( (ValueCellFull!17300 (v!20909 V!53633)) (EmptyCell!17300) )
))
(declare-datatypes ((array!89633 0))(
  ( (array!89634 (arr!43283 (Array (_ BitVec 32) ValueCell!17300)) (size!43835 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89633)

(declare-fun e!756820 () Bool)

(declare-fun array_inv!32835 (array!89633) Bool)

(assert (=> start!112092 (and (array_inv!32835 _values!1320) e!756820)))

(declare-datatypes ((array!89635 0))(
  ( (array!89636 (arr!43284 (Array (_ BitVec 32) (_ BitVec 64))) (size!43836 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89635)

(declare-fun array_inv!32836 (array!89635) Bool)

(assert (=> start!112092 (array_inv!32836 _keys!1590)))

(declare-fun b!1327615 () Bool)

(declare-fun e!756823 () Bool)

(declare-fun tp_is_empty!36397 () Bool)

(assert (=> b!1327615 (= e!756823 tp_is_empty!36397)))

(declare-fun b!1327616 () Bool)

(declare-fun e!756819 () Bool)

(assert (=> b!1327616 (= e!756819 tp_is_empty!36397)))

(declare-fun b!1327617 () Bool)

(declare-fun res!880966 () Bool)

(assert (=> b!1327617 (=> (not res!880966) (not e!756821))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327617 (= res!880966 (and (= (size!43835 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43836 _keys!1590) (size!43835 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327618 () Bool)

(declare-fun mapRes!56269 () Bool)

(assert (=> b!1327618 (= e!756820 (and e!756819 mapRes!56269))))

(declare-fun condMapEmpty!56269 () Bool)

(declare-fun mapDefault!56269 () ValueCell!17300)

(assert (=> b!1327618 (= condMapEmpty!56269 (= (arr!43283 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17300)) mapDefault!56269)))))

(declare-fun mapIsEmpty!56269 () Bool)

(assert (=> mapIsEmpty!56269 mapRes!56269))

(declare-fun b!1327619 () Bool)

(assert (=> b!1327619 (= e!756821 false)))

(declare-fun lt!590551 () Bool)

(declare-datatypes ((List!30747 0))(
  ( (Nil!30744) (Cons!30743 (h!31952 (_ BitVec 64)) (t!44745 List!30747)) )
))
(declare-fun arrayNoDuplicates!0 (array!89635 (_ BitVec 32) List!30747) Bool)

(assert (=> b!1327619 (= lt!590551 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30744))))

(declare-fun b!1327620 () Bool)

(declare-fun res!880965 () Bool)

(assert (=> b!1327620 (=> (not res!880965) (not e!756821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89635 (_ BitVec 32)) Bool)

(assert (=> b!1327620 (= res!880965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56269 () Bool)

(declare-fun tp!107177 () Bool)

(assert (=> mapNonEmpty!56269 (= mapRes!56269 (and tp!107177 e!756823))))

(declare-fun mapRest!56269 () (Array (_ BitVec 32) ValueCell!17300))

(declare-fun mapValue!56269 () ValueCell!17300)

(declare-fun mapKey!56269 () (_ BitVec 32))

(assert (=> mapNonEmpty!56269 (= (arr!43283 _values!1320) (store mapRest!56269 mapKey!56269 mapValue!56269))))

(assert (= (and start!112092 res!880964) b!1327617))

(assert (= (and b!1327617 res!880966) b!1327620))

(assert (= (and b!1327620 res!880965) b!1327619))

(assert (= (and b!1327618 condMapEmpty!56269) mapIsEmpty!56269))

(assert (= (and b!1327618 (not condMapEmpty!56269)) mapNonEmpty!56269))

(get-info :version)

(assert (= (and mapNonEmpty!56269 ((_ is ValueCellFull!17300) mapValue!56269)) b!1327615))

(assert (= (and b!1327618 ((_ is ValueCellFull!17300) mapDefault!56269)) b!1327616))

(assert (= start!112092 b!1327618))

(declare-fun m!1216401 () Bool)

(assert (=> start!112092 m!1216401))

(declare-fun m!1216403 () Bool)

(assert (=> start!112092 m!1216403))

(declare-fun m!1216405 () Bool)

(assert (=> start!112092 m!1216405))

(declare-fun m!1216407 () Bool)

(assert (=> b!1327619 m!1216407))

(declare-fun m!1216409 () Bool)

(assert (=> b!1327620 m!1216409))

(declare-fun m!1216411 () Bool)

(assert (=> mapNonEmpty!56269 m!1216411))

(check-sat (not start!112092) (not b!1327619) (not b!1327620) (not mapNonEmpty!56269) tp_is_empty!36397)
(check-sat)
