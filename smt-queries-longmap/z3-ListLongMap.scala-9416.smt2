; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112328 () Bool)

(assert start!112328)

(declare-fun b!1329092 () Bool)

(declare-fun e!757786 () Bool)

(declare-fun e!757787 () Bool)

(declare-fun mapRes!56287 () Bool)

(assert (=> b!1329092 (= e!757786 (and e!757787 mapRes!56287))))

(declare-fun condMapEmpty!56287 () Bool)

(declare-datatypes ((V!53649 0))(
  ( (V!53650 (val!18279 Int)) )
))
(declare-datatypes ((ValueCell!17306 0))(
  ( (ValueCellFull!17306 (v!20911 V!53649)) (EmptyCell!17306) )
))
(declare-datatypes ((array!89825 0))(
  ( (array!89826 (arr!43374 (Array (_ BitVec 32) ValueCell!17306)) (size!43925 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89825)

(declare-fun mapDefault!56287 () ValueCell!17306)

(assert (=> b!1329092 (= condMapEmpty!56287 (= (arr!43374 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17306)) mapDefault!56287)))))

(declare-fun b!1329093 () Bool)

(declare-fun tp_is_empty!36409 () Bool)

(assert (=> b!1329093 (= e!757787 tp_is_empty!36409)))

(declare-fun b!1329094 () Bool)

(declare-fun res!881567 () Bool)

(declare-fun e!757789 () Bool)

(assert (=> b!1329094 (=> (not res!881567) (not e!757789))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89827 0))(
  ( (array!89828 (arr!43375 (Array (_ BitVec 32) (_ BitVec 64))) (size!43926 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89827)

(assert (=> b!1329094 (= res!881567 (and (= (size!43925 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43926 _keys!1590) (size!43925 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56287 () Bool)

(declare-fun tp!107194 () Bool)

(declare-fun e!757788 () Bool)

(assert (=> mapNonEmpty!56287 (= mapRes!56287 (and tp!107194 e!757788))))

(declare-fun mapRest!56287 () (Array (_ BitVec 32) ValueCell!17306))

(declare-fun mapKey!56287 () (_ BitVec 32))

(declare-fun mapValue!56287 () ValueCell!17306)

(assert (=> mapNonEmpty!56287 (= (arr!43374 _values!1320) (store mapRest!56287 mapKey!56287 mapValue!56287))))

(declare-fun b!1329095 () Bool)

(assert (=> b!1329095 (= e!757789 false)))

(declare-fun lt!591231 () Bool)

(declare-datatypes ((List!30741 0))(
  ( (Nil!30738) (Cons!30737 (h!31955 (_ BitVec 64)) (t!44739 List!30741)) )
))
(declare-fun arrayNoDuplicates!0 (array!89827 (_ BitVec 32) List!30741) Bool)

(assert (=> b!1329095 (= lt!591231 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30738))))

(declare-fun b!1329096 () Bool)

(assert (=> b!1329096 (= e!757788 tp_is_empty!36409)))

(declare-fun res!881565 () Bool)

(assert (=> start!112328 (=> (not res!881565) (not e!757789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112328 (= res!881565 (validMask!0 mask!1998))))

(assert (=> start!112328 e!757789))

(assert (=> start!112328 true))

(declare-fun array_inv!32999 (array!89825) Bool)

(assert (=> start!112328 (and (array_inv!32999 _values!1320) e!757786)))

(declare-fun array_inv!33000 (array!89827) Bool)

(assert (=> start!112328 (array_inv!33000 _keys!1590)))

(declare-fun b!1329097 () Bool)

(declare-fun res!881566 () Bool)

(assert (=> b!1329097 (=> (not res!881566) (not e!757789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89827 (_ BitVec 32)) Bool)

(assert (=> b!1329097 (= res!881566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56287 () Bool)

(assert (=> mapIsEmpty!56287 mapRes!56287))

(assert (= (and start!112328 res!881565) b!1329094))

(assert (= (and b!1329094 res!881567) b!1329097))

(assert (= (and b!1329097 res!881566) b!1329095))

(assert (= (and b!1329092 condMapEmpty!56287) mapIsEmpty!56287))

(assert (= (and b!1329092 (not condMapEmpty!56287)) mapNonEmpty!56287))

(get-info :version)

(assert (= (and mapNonEmpty!56287 ((_ is ValueCellFull!17306) mapValue!56287)) b!1329096))

(assert (= (and b!1329092 ((_ is ValueCellFull!17306) mapDefault!56287)) b!1329093))

(assert (= start!112328 b!1329092))

(declare-fun m!1218587 () Bool)

(assert (=> mapNonEmpty!56287 m!1218587))

(declare-fun m!1218589 () Bool)

(assert (=> b!1329095 m!1218589))

(declare-fun m!1218591 () Bool)

(assert (=> start!112328 m!1218591))

(declare-fun m!1218593 () Bool)

(assert (=> start!112328 m!1218593))

(declare-fun m!1218595 () Bool)

(assert (=> start!112328 m!1218595))

(declare-fun m!1218597 () Bool)

(assert (=> b!1329097 m!1218597))

(check-sat tp_is_empty!36409 (not b!1329095) (not start!112328) (not mapNonEmpty!56287) (not b!1329097))
(check-sat)
