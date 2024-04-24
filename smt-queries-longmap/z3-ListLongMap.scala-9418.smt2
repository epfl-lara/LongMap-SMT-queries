; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112340 () Bool)

(assert start!112340)

(declare-fun b!1329200 () Bool)

(declare-fun e!757877 () Bool)

(declare-fun tp_is_empty!36421 () Bool)

(assert (=> b!1329200 (= e!757877 tp_is_empty!36421)))

(declare-fun b!1329201 () Bool)

(declare-fun e!757879 () Bool)

(assert (=> b!1329201 (= e!757879 false)))

(declare-fun lt!591249 () Bool)

(declare-datatypes ((array!89849 0))(
  ( (array!89850 (arr!43386 (Array (_ BitVec 32) (_ BitVec 64))) (size!43937 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89849)

(declare-datatypes ((List!30746 0))(
  ( (Nil!30743) (Cons!30742 (h!31960 (_ BitVec 64)) (t!44744 List!30746)) )
))
(declare-fun arrayNoDuplicates!0 (array!89849 (_ BitVec 32) List!30746) Bool)

(assert (=> b!1329201 (= lt!591249 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30743))))

(declare-fun b!1329202 () Bool)

(declare-fun e!757876 () Bool)

(assert (=> b!1329202 (= e!757876 tp_is_empty!36421)))

(declare-fun b!1329203 () Bool)

(declare-fun res!881619 () Bool)

(assert (=> b!1329203 (=> (not res!881619) (not e!757879))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89849 (_ BitVec 32)) Bool)

(assert (=> b!1329203 (= res!881619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56305 () Bool)

(declare-fun mapRes!56305 () Bool)

(declare-fun tp!107212 () Bool)

(assert (=> mapNonEmpty!56305 (= mapRes!56305 (and tp!107212 e!757877))))

(declare-fun mapKey!56305 () (_ BitVec 32))

(declare-datatypes ((V!53665 0))(
  ( (V!53666 (val!18285 Int)) )
))
(declare-datatypes ((ValueCell!17312 0))(
  ( (ValueCellFull!17312 (v!20917 V!53665)) (EmptyCell!17312) )
))
(declare-datatypes ((array!89851 0))(
  ( (array!89852 (arr!43387 (Array (_ BitVec 32) ValueCell!17312)) (size!43938 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89851)

(declare-fun mapValue!56305 () ValueCell!17312)

(declare-fun mapRest!56305 () (Array (_ BitVec 32) ValueCell!17312))

(assert (=> mapNonEmpty!56305 (= (arr!43387 _values!1320) (store mapRest!56305 mapKey!56305 mapValue!56305))))

(declare-fun b!1329204 () Bool)

(declare-fun e!757875 () Bool)

(assert (=> b!1329204 (= e!757875 (and e!757876 mapRes!56305))))

(declare-fun condMapEmpty!56305 () Bool)

(declare-fun mapDefault!56305 () ValueCell!17312)

(assert (=> b!1329204 (= condMapEmpty!56305 (= (arr!43387 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17312)) mapDefault!56305)))))

(declare-fun res!881621 () Bool)

(assert (=> start!112340 (=> (not res!881621) (not e!757879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112340 (= res!881621 (validMask!0 mask!1998))))

(assert (=> start!112340 e!757879))

(assert (=> start!112340 true))

(declare-fun array_inv!33011 (array!89851) Bool)

(assert (=> start!112340 (and (array_inv!33011 _values!1320) e!757875)))

(declare-fun array_inv!33012 (array!89849) Bool)

(assert (=> start!112340 (array_inv!33012 _keys!1590)))

(declare-fun b!1329205 () Bool)

(declare-fun res!881620 () Bool)

(assert (=> b!1329205 (=> (not res!881620) (not e!757879))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329205 (= res!881620 (and (= (size!43938 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43937 _keys!1590) (size!43938 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56305 () Bool)

(assert (=> mapIsEmpty!56305 mapRes!56305))

(assert (= (and start!112340 res!881621) b!1329205))

(assert (= (and b!1329205 res!881620) b!1329203))

(assert (= (and b!1329203 res!881619) b!1329201))

(assert (= (and b!1329204 condMapEmpty!56305) mapIsEmpty!56305))

(assert (= (and b!1329204 (not condMapEmpty!56305)) mapNonEmpty!56305))

(get-info :version)

(assert (= (and mapNonEmpty!56305 ((_ is ValueCellFull!17312) mapValue!56305)) b!1329200))

(assert (= (and b!1329204 ((_ is ValueCellFull!17312) mapDefault!56305)) b!1329202))

(assert (= start!112340 b!1329204))

(declare-fun m!1218659 () Bool)

(assert (=> b!1329201 m!1218659))

(declare-fun m!1218661 () Bool)

(assert (=> b!1329203 m!1218661))

(declare-fun m!1218663 () Bool)

(assert (=> mapNonEmpty!56305 m!1218663))

(declare-fun m!1218665 () Bool)

(assert (=> start!112340 m!1218665))

(declare-fun m!1218667 () Bool)

(assert (=> start!112340 m!1218667))

(declare-fun m!1218669 () Bool)

(assert (=> start!112340 m!1218669))

(check-sat (not b!1329203) tp_is_empty!36421 (not b!1329201) (not start!112340) (not mapNonEmpty!56305))
(check-sat)
