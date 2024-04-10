; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112100 () Bool)

(assert start!112100)

(declare-fun b!1327757 () Bool)

(declare-fun e!756914 () Bool)

(declare-fun e!756913 () Bool)

(declare-fun mapRes!56281 () Bool)

(assert (=> b!1327757 (= e!756914 (and e!756913 mapRes!56281))))

(declare-fun condMapEmpty!56281 () Bool)

(declare-datatypes ((V!53643 0))(
  ( (V!53644 (val!18277 Int)) )
))
(declare-datatypes ((ValueCell!17304 0))(
  ( (ValueCellFull!17304 (v!20914 V!53643)) (EmptyCell!17304) )
))
(declare-datatypes ((array!89718 0))(
  ( (array!89719 (arr!43325 (Array (_ BitVec 32) ValueCell!17304)) (size!43875 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89718)

(declare-fun mapDefault!56281 () ValueCell!17304)

(assert (=> b!1327757 (= condMapEmpty!56281 (= (arr!43325 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17304)) mapDefault!56281)))))

(declare-fun b!1327758 () Bool)

(declare-fun e!756915 () Bool)

(assert (=> b!1327758 (= e!756915 false)))

(declare-fun lt!590749 () Bool)

(declare-datatypes ((array!89720 0))(
  ( (array!89721 (arr!43326 (Array (_ BitVec 32) (_ BitVec 64))) (size!43876 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89720)

(declare-datatypes ((List!30698 0))(
  ( (Nil!30695) (Cons!30694 (h!31903 (_ BitVec 64)) (t!44704 List!30698)) )
))
(declare-fun arrayNoDuplicates!0 (array!89720 (_ BitVec 32) List!30698) Bool)

(assert (=> b!1327758 (= lt!590749 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30695))))

(declare-fun res!881031 () Bool)

(assert (=> start!112100 (=> (not res!881031) (not e!756915))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112100 (= res!881031 (validMask!0 mask!1998))))

(assert (=> start!112100 e!756915))

(assert (=> start!112100 true))

(declare-fun array_inv!32701 (array!89718) Bool)

(assert (=> start!112100 (and (array_inv!32701 _values!1320) e!756914)))

(declare-fun array_inv!32702 (array!89720) Bool)

(assert (=> start!112100 (array_inv!32702 _keys!1590)))

(declare-fun b!1327759 () Bool)

(declare-fun res!881030 () Bool)

(assert (=> b!1327759 (=> (not res!881030) (not e!756915))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327759 (= res!881030 (and (= (size!43875 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43876 _keys!1590) (size!43875 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56281 () Bool)

(assert (=> mapIsEmpty!56281 mapRes!56281))

(declare-fun b!1327760 () Bool)

(declare-fun tp_is_empty!36405 () Bool)

(assert (=> b!1327760 (= e!756913 tp_is_empty!36405)))

(declare-fun mapNonEmpty!56281 () Bool)

(declare-fun tp!107188 () Bool)

(declare-fun e!756912 () Bool)

(assert (=> mapNonEmpty!56281 (= mapRes!56281 (and tp!107188 e!756912))))

(declare-fun mapRest!56281 () (Array (_ BitVec 32) ValueCell!17304))

(declare-fun mapKey!56281 () (_ BitVec 32))

(declare-fun mapValue!56281 () ValueCell!17304)

(assert (=> mapNonEmpty!56281 (= (arr!43325 _values!1320) (store mapRest!56281 mapKey!56281 mapValue!56281))))

(declare-fun b!1327761 () Bool)

(assert (=> b!1327761 (= e!756912 tp_is_empty!36405)))

(declare-fun b!1327762 () Bool)

(declare-fun res!881029 () Bool)

(assert (=> b!1327762 (=> (not res!881029) (not e!756915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89720 (_ BitVec 32)) Bool)

(assert (=> b!1327762 (= res!881029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112100 res!881031) b!1327759))

(assert (= (and b!1327759 res!881030) b!1327762))

(assert (= (and b!1327762 res!881029) b!1327758))

(assert (= (and b!1327757 condMapEmpty!56281) mapIsEmpty!56281))

(assert (= (and b!1327757 (not condMapEmpty!56281)) mapNonEmpty!56281))

(get-info :version)

(assert (= (and mapNonEmpty!56281 ((_ is ValueCellFull!17304) mapValue!56281)) b!1327761))

(assert (= (and b!1327757 ((_ is ValueCellFull!17304) mapDefault!56281)) b!1327760))

(assert (= start!112100 b!1327757))

(declare-fun m!1216965 () Bool)

(assert (=> b!1327758 m!1216965))

(declare-fun m!1216967 () Bool)

(assert (=> start!112100 m!1216967))

(declare-fun m!1216969 () Bool)

(assert (=> start!112100 m!1216969))

(declare-fun m!1216971 () Bool)

(assert (=> start!112100 m!1216971))

(declare-fun m!1216973 () Bool)

(assert (=> mapNonEmpty!56281 m!1216973))

(declare-fun m!1216975 () Bool)

(assert (=> b!1327762 m!1216975))

(check-sat (not mapNonEmpty!56281) (not b!1327762) (not b!1327758) (not start!112100) tp_is_empty!36405)
(check-sat)
