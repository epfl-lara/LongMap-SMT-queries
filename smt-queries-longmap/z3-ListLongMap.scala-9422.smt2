; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112142 () Bool)

(assert start!112142)

(declare-fun b!1328140 () Bool)

(declare-fun e!757231 () Bool)

(declare-fun e!757228 () Bool)

(declare-fun mapRes!56344 () Bool)

(assert (=> b!1328140 (= e!757231 (and e!757228 mapRes!56344))))

(declare-fun condMapEmpty!56344 () Bool)

(declare-datatypes ((V!53699 0))(
  ( (V!53700 (val!18298 Int)) )
))
(declare-datatypes ((ValueCell!17325 0))(
  ( (ValueCellFull!17325 (v!20935 V!53699)) (EmptyCell!17325) )
))
(declare-datatypes ((array!89792 0))(
  ( (array!89793 (arr!43362 (Array (_ BitVec 32) ValueCell!17325)) (size!43912 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89792)

(declare-fun mapDefault!56344 () ValueCell!17325)

(assert (=> b!1328140 (= condMapEmpty!56344 (= (arr!43362 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17325)) mapDefault!56344)))))

(declare-fun res!881223 () Bool)

(declare-fun e!757230 () Bool)

(assert (=> start!112142 (=> (not res!881223) (not e!757230))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112142 (= res!881223 (validMask!0 mask!1998))))

(assert (=> start!112142 e!757230))

(assert (=> start!112142 true))

(declare-fun array_inv!32723 (array!89792) Bool)

(assert (=> start!112142 (and (array_inv!32723 _values!1320) e!757231)))

(declare-datatypes ((array!89794 0))(
  ( (array!89795 (arr!43363 (Array (_ BitVec 32) (_ BitVec 64))) (size!43913 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89794)

(declare-fun array_inv!32724 (array!89794) Bool)

(assert (=> start!112142 (array_inv!32724 _keys!1590)))

(declare-fun b!1328141 () Bool)

(declare-fun tp_is_empty!36447 () Bool)

(assert (=> b!1328141 (= e!757228 tp_is_empty!36447)))

(declare-fun b!1328142 () Bool)

(declare-fun res!881225 () Bool)

(assert (=> b!1328142 (=> (not res!881225) (not e!757230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89794 (_ BitVec 32)) Bool)

(assert (=> b!1328142 (= res!881225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328143 () Bool)

(declare-fun res!881226 () Bool)

(assert (=> b!1328143 (=> (not res!881226) (not e!757230))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328143 (= res!881226 (and (= (size!43912 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43913 _keys!1590) (size!43912 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56344 () Bool)

(assert (=> mapIsEmpty!56344 mapRes!56344))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun b!1328144 () Bool)

(assert (=> b!1328144 (= e!757230 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43913 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!1980 (size!43913 _keys!1590))))))

(declare-fun b!1328145 () Bool)

(declare-fun e!757229 () Bool)

(assert (=> b!1328145 (= e!757229 tp_is_empty!36447)))

(declare-fun b!1328146 () Bool)

(declare-fun res!881224 () Bool)

(assert (=> b!1328146 (=> (not res!881224) (not e!757230))))

(declare-datatypes ((List!30711 0))(
  ( (Nil!30708) (Cons!30707 (h!31916 (_ BitVec 64)) (t!44717 List!30711)) )
))
(declare-fun arrayNoDuplicates!0 (array!89794 (_ BitVec 32) List!30711) Bool)

(assert (=> b!1328146 (= res!881224 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30708))))

(declare-fun mapNonEmpty!56344 () Bool)

(declare-fun tp!107251 () Bool)

(assert (=> mapNonEmpty!56344 (= mapRes!56344 (and tp!107251 e!757229))))

(declare-fun mapValue!56344 () ValueCell!17325)

(declare-fun mapRest!56344 () (Array (_ BitVec 32) ValueCell!17325))

(declare-fun mapKey!56344 () (_ BitVec 32))

(assert (=> mapNonEmpty!56344 (= (arr!43362 _values!1320) (store mapRest!56344 mapKey!56344 mapValue!56344))))

(assert (= (and start!112142 res!881223) b!1328143))

(assert (= (and b!1328143 res!881226) b!1328142))

(assert (= (and b!1328142 res!881225) b!1328146))

(assert (= (and b!1328146 res!881224) b!1328144))

(assert (= (and b!1328140 condMapEmpty!56344) mapIsEmpty!56344))

(assert (= (and b!1328140 (not condMapEmpty!56344)) mapNonEmpty!56344))

(get-info :version)

(assert (= (and mapNonEmpty!56344 ((_ is ValueCellFull!17325) mapValue!56344)) b!1328145))

(assert (= (and b!1328140 ((_ is ValueCellFull!17325) mapDefault!56344)) b!1328141))

(assert (= start!112142 b!1328140))

(declare-fun m!1217217 () Bool)

(assert (=> start!112142 m!1217217))

(declare-fun m!1217219 () Bool)

(assert (=> start!112142 m!1217219))

(declare-fun m!1217221 () Bool)

(assert (=> start!112142 m!1217221))

(declare-fun m!1217223 () Bool)

(assert (=> b!1328142 m!1217223))

(declare-fun m!1217225 () Bool)

(assert (=> b!1328146 m!1217225))

(declare-fun m!1217227 () Bool)

(assert (=> mapNonEmpty!56344 m!1217227))

(check-sat (not b!1328146) (not start!112142) (not mapNonEmpty!56344) tp_is_empty!36447 (not b!1328142))
(check-sat)
