; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112742 () Bool)

(assert start!112742)

(declare-fun b_free!30913 () Bool)

(declare-fun b_next!30913 () Bool)

(assert (=> start!112742 (= b_free!30913 (not b_next!30913))))

(declare-fun tp!108375 () Bool)

(declare-fun b_and!49823 () Bool)

(assert (=> start!112742 (= tp!108375 b_and!49823)))

(declare-fun b!1335969 () Bool)

(declare-fun e!760974 () Bool)

(declare-fun e!760972 () Bool)

(declare-fun mapRes!56908 () Bool)

(assert (=> b!1335969 (= e!760974 (and e!760972 mapRes!56908))))

(declare-fun condMapEmpty!56908 () Bool)

(declare-datatypes ((V!54201 0))(
  ( (V!54202 (val!18486 Int)) )
))
(declare-datatypes ((ValueCell!17513 0))(
  ( (ValueCellFull!17513 (v!21118 V!54201)) (EmptyCell!17513) )
))
(declare-datatypes ((array!90617 0))(
  ( (array!90618 (arr!43770 (Array (_ BitVec 32) ValueCell!17513)) (size!44321 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90617)

(declare-fun mapDefault!56908 () ValueCell!17513)

(assert (=> b!1335969 (= condMapEmpty!56908 (= (arr!43770 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17513)) mapDefault!56908)))))

(declare-fun b!1335970 () Bool)

(declare-fun res!886324 () Bool)

(declare-fun e!760971 () Bool)

(assert (=> b!1335970 (=> (not res!886324) (not e!760971))))

(declare-datatypes ((array!90619 0))(
  ( (array!90620 (arr!43771 (Array (_ BitVec 32) (_ BitVec 64))) (size!44322 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90619)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90619 (_ BitVec 32)) Bool)

(assert (=> b!1335970 (= res!886324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335971 () Bool)

(declare-fun res!886323 () Bool)

(assert (=> b!1335971 (=> (not res!886323) (not e!760971))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1335971 (= res!886323 (and (= (size!44321 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44322 _keys!1590) (size!44321 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56908 () Bool)

(declare-fun tp!108376 () Bool)

(declare-fun e!760975 () Bool)

(assert (=> mapNonEmpty!56908 (= mapRes!56908 (and tp!108376 e!760975))))

(declare-fun mapKey!56908 () (_ BitVec 32))

(declare-fun mapRest!56908 () (Array (_ BitVec 32) ValueCell!17513))

(declare-fun mapValue!56908 () ValueCell!17513)

(assert (=> mapNonEmpty!56908 (= (arr!43770 _values!1320) (store mapRest!56908 mapKey!56908 mapValue!56908))))

(declare-fun b!1335972 () Bool)

(declare-fun tp_is_empty!36823 () Bool)

(assert (=> b!1335972 (= e!760972 tp_is_empty!36823)))

(declare-fun b!1335973 () Bool)

(declare-fun res!886322 () Bool)

(assert (=> b!1335973 (=> (not res!886322) (not e!760971))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335973 (= res!886322 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44322 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335974 () Bool)

(declare-fun res!886321 () Bool)

(assert (=> b!1335974 (=> (not res!886321) (not e!760971))))

(declare-datatypes ((List!31009 0))(
  ( (Nil!31006) (Cons!31005 (h!32223 (_ BitVec 64)) (t!45265 List!31009)) )
))
(declare-fun arrayNoDuplicates!0 (array!90619 (_ BitVec 32) List!31009) Bool)

(assert (=> b!1335974 (= res!886321 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31006))))

(declare-fun mapIsEmpty!56908 () Bool)

(assert (=> mapIsEmpty!56908 mapRes!56908))

(declare-fun b!1335975 () Bool)

(assert (=> b!1335975 (= e!760971 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun lt!592851 () Bool)

(declare-fun minValue!1262 () V!54201)

(declare-fun zeroValue!1262 () V!54201)

(declare-datatypes ((tuple2!23858 0))(
  ( (tuple2!23859 (_1!11940 (_ BitVec 64)) (_2!11940 V!54201)) )
))
(declare-datatypes ((List!31010 0))(
  ( (Nil!31007) (Cons!31006 (h!32224 tuple2!23858) (t!45266 List!31010)) )
))
(declare-datatypes ((ListLongMap!21523 0))(
  ( (ListLongMap!21524 (toList!10777 List!31010)) )
))
(declare-fun contains!8953 (ListLongMap!21523 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5736 (array!90619 array!90617 (_ BitVec 32) (_ BitVec 32) V!54201 V!54201 (_ BitVec 32) Int) ListLongMap!21523)

(assert (=> b!1335975 (= lt!592851 (contains!8953 (getCurrentListMap!5736 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!886325 () Bool)

(assert (=> start!112742 (=> (not res!886325) (not e!760971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112742 (= res!886325 (validMask!0 mask!1998))))

(assert (=> start!112742 e!760971))

(declare-fun array_inv!33275 (array!90617) Bool)

(assert (=> start!112742 (and (array_inv!33275 _values!1320) e!760974)))

(assert (=> start!112742 true))

(declare-fun array_inv!33276 (array!90619) Bool)

(assert (=> start!112742 (array_inv!33276 _keys!1590)))

(assert (=> start!112742 tp!108375))

(assert (=> start!112742 tp_is_empty!36823))

(declare-fun b!1335976 () Bool)

(assert (=> b!1335976 (= e!760975 tp_is_empty!36823)))

(assert (= (and start!112742 res!886325) b!1335971))

(assert (= (and b!1335971 res!886323) b!1335970))

(assert (= (and b!1335970 res!886324) b!1335974))

(assert (= (and b!1335974 res!886321) b!1335973))

(assert (= (and b!1335973 res!886322) b!1335975))

(assert (= (and b!1335969 condMapEmpty!56908) mapIsEmpty!56908))

(assert (= (and b!1335969 (not condMapEmpty!56908)) mapNonEmpty!56908))

(get-info :version)

(assert (= (and mapNonEmpty!56908 ((_ is ValueCellFull!17513) mapValue!56908)) b!1335976))

(assert (= (and b!1335969 ((_ is ValueCellFull!17513) mapDefault!56908)) b!1335972))

(assert (= start!112742 b!1335969))

(declare-fun m!1224593 () Bool)

(assert (=> mapNonEmpty!56908 m!1224593))

(declare-fun m!1224595 () Bool)

(assert (=> b!1335970 m!1224595))

(declare-fun m!1224597 () Bool)

(assert (=> b!1335975 m!1224597))

(assert (=> b!1335975 m!1224597))

(declare-fun m!1224599 () Bool)

(assert (=> b!1335975 m!1224599))

(declare-fun m!1224601 () Bool)

(assert (=> b!1335974 m!1224601))

(declare-fun m!1224603 () Bool)

(assert (=> start!112742 m!1224603))

(declare-fun m!1224605 () Bool)

(assert (=> start!112742 m!1224605))

(declare-fun m!1224607 () Bool)

(assert (=> start!112742 m!1224607))

(check-sat (not b!1335975) (not mapNonEmpty!56908) (not b!1335970) (not b_next!30913) b_and!49823 (not start!112742) (not b!1335974) tp_is_empty!36823)
(check-sat b_and!49823 (not b_next!30913))
