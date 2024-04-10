; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112112 () Bool)

(assert start!112112)

(declare-fun b!1327865 () Bool)

(declare-fun e!757004 () Bool)

(declare-fun e!757006 () Bool)

(declare-fun mapRes!56299 () Bool)

(assert (=> b!1327865 (= e!757004 (and e!757006 mapRes!56299))))

(declare-fun condMapEmpty!56299 () Bool)

(declare-datatypes ((V!53659 0))(
  ( (V!53660 (val!18283 Int)) )
))
(declare-datatypes ((ValueCell!17310 0))(
  ( (ValueCellFull!17310 (v!20920 V!53659)) (EmptyCell!17310) )
))
(declare-datatypes ((array!89736 0))(
  ( (array!89737 (arr!43334 (Array (_ BitVec 32) ValueCell!17310)) (size!43884 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89736)

(declare-fun mapDefault!56299 () ValueCell!17310)

(assert (=> b!1327865 (= condMapEmpty!56299 (= (arr!43334 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17310)) mapDefault!56299)))))

(declare-fun b!1327866 () Bool)

(declare-fun tp_is_empty!36417 () Bool)

(assert (=> b!1327866 (= e!757006 tp_is_empty!36417)))

(declare-fun res!881084 () Bool)

(declare-fun e!757003 () Bool)

(assert (=> start!112112 (=> (not res!881084) (not e!757003))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112112 (= res!881084 (validMask!0 mask!1998))))

(assert (=> start!112112 e!757003))

(assert (=> start!112112 true))

(declare-fun array_inv!32707 (array!89736) Bool)

(assert (=> start!112112 (and (array_inv!32707 _values!1320) e!757004)))

(declare-datatypes ((array!89738 0))(
  ( (array!89739 (arr!43335 (Array (_ BitVec 32) (_ BitVec 64))) (size!43885 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89738)

(declare-fun array_inv!32708 (array!89738) Bool)

(assert (=> start!112112 (array_inv!32708 _keys!1590)))

(declare-fun b!1327867 () Bool)

(declare-fun res!881085 () Bool)

(assert (=> b!1327867 (=> (not res!881085) (not e!757003))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327867 (= res!881085 (and (= (size!43884 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43885 _keys!1590) (size!43884 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56299 () Bool)

(declare-fun tp!107206 () Bool)

(declare-fun e!757002 () Bool)

(assert (=> mapNonEmpty!56299 (= mapRes!56299 (and tp!107206 e!757002))))

(declare-fun mapValue!56299 () ValueCell!17310)

(declare-fun mapRest!56299 () (Array (_ BitVec 32) ValueCell!17310))

(declare-fun mapKey!56299 () (_ BitVec 32))

(assert (=> mapNonEmpty!56299 (= (arr!43334 _values!1320) (store mapRest!56299 mapKey!56299 mapValue!56299))))

(declare-fun mapIsEmpty!56299 () Bool)

(assert (=> mapIsEmpty!56299 mapRes!56299))

(declare-fun b!1327868 () Bool)

(assert (=> b!1327868 (= e!757003 false)))

(declare-fun lt!590767 () Bool)

(declare-datatypes ((List!30700 0))(
  ( (Nil!30697) (Cons!30696 (h!31905 (_ BitVec 64)) (t!44706 List!30700)) )
))
(declare-fun arrayNoDuplicates!0 (array!89738 (_ BitVec 32) List!30700) Bool)

(assert (=> b!1327868 (= lt!590767 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30697))))

(declare-fun b!1327869 () Bool)

(assert (=> b!1327869 (= e!757002 tp_is_empty!36417)))

(declare-fun b!1327870 () Bool)

(declare-fun res!881083 () Bool)

(assert (=> b!1327870 (=> (not res!881083) (not e!757003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89738 (_ BitVec 32)) Bool)

(assert (=> b!1327870 (= res!881083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112112 res!881084) b!1327867))

(assert (= (and b!1327867 res!881085) b!1327870))

(assert (= (and b!1327870 res!881083) b!1327868))

(assert (= (and b!1327865 condMapEmpty!56299) mapIsEmpty!56299))

(assert (= (and b!1327865 (not condMapEmpty!56299)) mapNonEmpty!56299))

(get-info :version)

(assert (= (and mapNonEmpty!56299 ((_ is ValueCellFull!17310) mapValue!56299)) b!1327869))

(assert (= (and b!1327865 ((_ is ValueCellFull!17310) mapDefault!56299)) b!1327866))

(assert (= start!112112 b!1327865))

(declare-fun m!1217037 () Bool)

(assert (=> start!112112 m!1217037))

(declare-fun m!1217039 () Bool)

(assert (=> start!112112 m!1217039))

(declare-fun m!1217041 () Bool)

(assert (=> start!112112 m!1217041))

(declare-fun m!1217043 () Bool)

(assert (=> mapNonEmpty!56299 m!1217043))

(declare-fun m!1217045 () Bool)

(assert (=> b!1327868 m!1217045))

(declare-fun m!1217047 () Bool)

(assert (=> b!1327870 m!1217047))

(check-sat (not b!1327868) tp_is_empty!36417 (not start!112112) (not mapNonEmpty!56299) (not b!1327870))
(check-sat)
