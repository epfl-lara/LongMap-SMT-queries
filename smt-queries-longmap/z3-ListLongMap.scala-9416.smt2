; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112104 () Bool)

(assert start!112104)

(declare-fun b!1327723 () Bool)

(declare-fun res!881020 () Bool)

(declare-fun e!756909 () Bool)

(assert (=> b!1327723 (=> (not res!881020) (not e!756909))))

(declare-datatypes ((array!89657 0))(
  ( (array!89658 (arr!43295 (Array (_ BitVec 32) (_ BitVec 64))) (size!43847 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89657)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89657 (_ BitVec 32)) Bool)

(assert (=> b!1327723 (= res!881020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327725 () Bool)

(assert (=> b!1327725 (= e!756909 false)))

(declare-fun lt!590569 () Bool)

(declare-datatypes ((List!30752 0))(
  ( (Nil!30749) (Cons!30748 (h!31957 (_ BitVec 64)) (t!44750 List!30752)) )
))
(declare-fun arrayNoDuplicates!0 (array!89657 (_ BitVec 32) List!30752) Bool)

(assert (=> b!1327725 (= lt!590569 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30749))))

(declare-fun b!1327726 () Bool)

(declare-fun e!756912 () Bool)

(declare-fun tp_is_empty!36409 () Bool)

(assert (=> b!1327726 (= e!756912 tp_is_empty!36409)))

(declare-fun b!1327727 () Bool)

(declare-fun e!756911 () Bool)

(assert (=> b!1327727 (= e!756911 tp_is_empty!36409)))

(declare-fun mapIsEmpty!56287 () Bool)

(declare-fun mapRes!56287 () Bool)

(assert (=> mapIsEmpty!56287 mapRes!56287))

(declare-fun mapNonEmpty!56287 () Bool)

(declare-fun tp!107195 () Bool)

(assert (=> mapNonEmpty!56287 (= mapRes!56287 (and tp!107195 e!756911))))

(declare-fun mapKey!56287 () (_ BitVec 32))

(declare-datatypes ((V!53649 0))(
  ( (V!53650 (val!18279 Int)) )
))
(declare-datatypes ((ValueCell!17306 0))(
  ( (ValueCellFull!17306 (v!20915 V!53649)) (EmptyCell!17306) )
))
(declare-datatypes ((array!89659 0))(
  ( (array!89660 (arr!43296 (Array (_ BitVec 32) ValueCell!17306)) (size!43848 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89659)

(declare-fun mapRest!56287 () (Array (_ BitVec 32) ValueCell!17306))

(declare-fun mapValue!56287 () ValueCell!17306)

(assert (=> mapNonEmpty!56287 (= (arr!43296 _values!1320) (store mapRest!56287 mapKey!56287 mapValue!56287))))

(declare-fun b!1327728 () Bool)

(declare-fun res!881018 () Bool)

(assert (=> b!1327728 (=> (not res!881018) (not e!756909))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327728 (= res!881018 (and (= (size!43848 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43847 _keys!1590) (size!43848 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327724 () Bool)

(declare-fun e!756910 () Bool)

(assert (=> b!1327724 (= e!756910 (and e!756912 mapRes!56287))))

(declare-fun condMapEmpty!56287 () Bool)

(declare-fun mapDefault!56287 () ValueCell!17306)

(assert (=> b!1327724 (= condMapEmpty!56287 (= (arr!43296 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17306)) mapDefault!56287)))))

(declare-fun res!881019 () Bool)

(assert (=> start!112104 (=> (not res!881019) (not e!756909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112104 (= res!881019 (validMask!0 mask!1998))))

(assert (=> start!112104 e!756909))

(assert (=> start!112104 true))

(declare-fun array_inv!32843 (array!89659) Bool)

(assert (=> start!112104 (and (array_inv!32843 _values!1320) e!756910)))

(declare-fun array_inv!32844 (array!89657) Bool)

(assert (=> start!112104 (array_inv!32844 _keys!1590)))

(assert (= (and start!112104 res!881019) b!1327728))

(assert (= (and b!1327728 res!881018) b!1327723))

(assert (= (and b!1327723 res!881020) b!1327725))

(assert (= (and b!1327724 condMapEmpty!56287) mapIsEmpty!56287))

(assert (= (and b!1327724 (not condMapEmpty!56287)) mapNonEmpty!56287))

(get-info :version)

(assert (= (and mapNonEmpty!56287 ((_ is ValueCellFull!17306) mapValue!56287)) b!1327727))

(assert (= (and b!1327724 ((_ is ValueCellFull!17306) mapDefault!56287)) b!1327726))

(assert (= start!112104 b!1327724))

(declare-fun m!1216473 () Bool)

(assert (=> b!1327723 m!1216473))

(declare-fun m!1216475 () Bool)

(assert (=> b!1327725 m!1216475))

(declare-fun m!1216477 () Bool)

(assert (=> mapNonEmpty!56287 m!1216477))

(declare-fun m!1216479 () Bool)

(assert (=> start!112104 m!1216479))

(declare-fun m!1216481 () Bool)

(assert (=> start!112104 m!1216481))

(declare-fun m!1216483 () Bool)

(assert (=> start!112104 m!1216483))

(check-sat (not start!112104) tp_is_empty!36409 (not b!1327723) (not mapNonEmpty!56287) (not b!1327725))
(check-sat)
