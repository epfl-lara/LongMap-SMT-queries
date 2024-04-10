; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112014 () Bool)

(assert start!112014)

(declare-fun b!1327261 () Bool)

(declare-fun e!756506 () Bool)

(declare-fun tp_is_empty!36363 () Bool)

(assert (=> b!1327261 (= e!756506 tp_is_empty!36363)))

(declare-fun b!1327262 () Bool)

(declare-fun e!756505 () Bool)

(assert (=> b!1327262 (= e!756505 tp_is_empty!36363)))

(declare-fun mapNonEmpty!56203 () Bool)

(declare-fun mapRes!56203 () Bool)

(declare-fun tp!107110 () Bool)

(assert (=> mapNonEmpty!56203 (= mapRes!56203 (and tp!107110 e!756506))))

(declare-datatypes ((V!53587 0))(
  ( (V!53588 (val!18256 Int)) )
))
(declare-datatypes ((ValueCell!17283 0))(
  ( (ValueCellFull!17283 (v!20892 V!53587)) (EmptyCell!17283) )
))
(declare-fun mapRest!56203 () (Array (_ BitVec 32) ValueCell!17283))

(declare-datatypes ((array!89636 0))(
  ( (array!89637 (arr!43289 (Array (_ BitVec 32) ValueCell!17283)) (size!43839 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89636)

(declare-fun mapKey!56203 () (_ BitVec 32))

(declare-fun mapValue!56203 () ValueCell!17283)

(assert (=> mapNonEmpty!56203 (= (arr!43289 _values!1320) (store mapRest!56203 mapKey!56203 mapValue!56203))))

(declare-fun res!880786 () Bool)

(declare-fun e!756503 () Bool)

(assert (=> start!112014 (=> (not res!880786) (not e!756503))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112014 (= res!880786 (validMask!0 mask!1998))))

(assert (=> start!112014 e!756503))

(assert (=> start!112014 true))

(declare-fun e!756504 () Bool)

(declare-fun array_inv!32675 (array!89636) Bool)

(assert (=> start!112014 (and (array_inv!32675 _values!1320) e!756504)))

(declare-datatypes ((array!89638 0))(
  ( (array!89639 (arr!43290 (Array (_ BitVec 32) (_ BitVec 64))) (size!43840 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89638)

(declare-fun array_inv!32676 (array!89638) Bool)

(assert (=> start!112014 (array_inv!32676 _keys!1590)))

(declare-fun b!1327263 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327263 (= e!756503 (and (= (size!43839 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43840 _keys!1590) (size!43839 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011) (not (= (size!43840 _keys!1590) (bvadd #b00000000000000000000000000000001 mask!1998)))))))

(declare-fun b!1327264 () Bool)

(assert (=> b!1327264 (= e!756504 (and e!756505 mapRes!56203))))

(declare-fun condMapEmpty!56203 () Bool)

(declare-fun mapDefault!56203 () ValueCell!17283)

(assert (=> b!1327264 (= condMapEmpty!56203 (= (arr!43289 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17283)) mapDefault!56203)))))

(declare-fun mapIsEmpty!56203 () Bool)

(assert (=> mapIsEmpty!56203 mapRes!56203))

(assert (= (and start!112014 res!880786) b!1327263))

(assert (= (and b!1327264 condMapEmpty!56203) mapIsEmpty!56203))

(assert (= (and b!1327264 (not condMapEmpty!56203)) mapNonEmpty!56203))

(get-info :version)

(assert (= (and mapNonEmpty!56203 ((_ is ValueCellFull!17283) mapValue!56203)) b!1327261))

(assert (= (and b!1327264 ((_ is ValueCellFull!17283) mapDefault!56203)) b!1327262))

(assert (= start!112014 b!1327264))

(declare-fun m!1216657 () Bool)

(assert (=> mapNonEmpty!56203 m!1216657))

(declare-fun m!1216659 () Bool)

(assert (=> start!112014 m!1216659))

(declare-fun m!1216661 () Bool)

(assert (=> start!112014 m!1216661))

(declare-fun m!1216663 () Bool)

(assert (=> start!112014 m!1216663))

(check-sat (not start!112014) (not mapNonEmpty!56203) tp_is_empty!36363)
(check-sat)
