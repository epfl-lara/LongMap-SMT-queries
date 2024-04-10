; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112656 () Bool)

(assert start!112656)

(declare-fun b_free!30993 () Bool)

(declare-fun b_next!30993 () Bool)

(assert (=> start!112656 (= b_free!30993 (not b_next!30993))))

(declare-fun tp!108620 () Bool)

(declare-fun b_and!49923 () Bool)

(assert (=> start!112656 (= tp!108620 b_and!49923)))

(declare-fun b!1336177 () Bool)

(declare-fun res!886725 () Bool)

(declare-fun e!760972 () Bool)

(assert (=> b!1336177 (=> (not res!886725) (not e!760972))))

(declare-datatypes ((array!90666 0))(
  ( (array!90667 (arr!43798 (Array (_ BitVec 32) (_ BitVec 64))) (size!44348 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90666)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336177 (= res!886725 (validKeyInArray!0 (select (arr!43798 _keys!1590) from!1980)))))

(declare-fun b!1336178 () Bool)

(declare-fun res!886722 () Bool)

(assert (=> b!1336178 (=> (not res!886722) (not e!760972))))

(declare-datatypes ((List!31034 0))(
  ( (Nil!31031) (Cons!31030 (h!32239 (_ BitVec 64)) (t!45308 List!31034)) )
))
(declare-fun arrayNoDuplicates!0 (array!90666 (_ BitVec 32) List!31034) Bool)

(assert (=> b!1336178 (= res!886722 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31031))))

(declare-fun b!1336179 () Bool)

(assert (=> b!1336179 (= e!760972 false)))

(declare-datatypes ((V!54307 0))(
  ( (V!54308 (val!18526 Int)) )
))
(declare-datatypes ((ValueCell!17553 0))(
  ( (ValueCellFull!17553 (v!21166 V!54307)) (EmptyCell!17553) )
))
(declare-datatypes ((array!90668 0))(
  ( (array!90669 (arr!43799 (Array (_ BitVec 32) ValueCell!17553)) (size!44349 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90668)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun lt!592736 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54307)

(declare-fun zeroValue!1262 () V!54307)

(declare-datatypes ((tuple2!23892 0))(
  ( (tuple2!23893 (_1!11957 (_ BitVec 64)) (_2!11957 V!54307)) )
))
(declare-datatypes ((List!31035 0))(
  ( (Nil!31032) (Cons!31031 (h!32240 tuple2!23892) (t!45309 List!31035)) )
))
(declare-datatypes ((ListLongMap!21549 0))(
  ( (ListLongMap!21550 (toList!10790 List!31035)) )
))
(declare-fun contains!8955 (ListLongMap!21549 (_ BitVec 64)) Bool)

(declare-fun +!4733 (ListLongMap!21549 tuple2!23892) ListLongMap!21549)

(declare-fun getCurrentListMapNoExtraKeys!6375 (array!90666 array!90668 (_ BitVec 32) (_ BitVec 32) V!54307 V!54307 (_ BitVec 32) Int) ListLongMap!21549)

(declare-fun get!22096 (ValueCell!17553 V!54307) V!54307)

(declare-fun dynLambda!3672 (Int (_ BitVec 64)) V!54307)

(assert (=> b!1336179 (= lt!592736 (contains!8955 (+!4733 (+!4733 (getCurrentListMapNoExtraKeys!6375 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23893 (select (arr!43798 _keys!1590) from!1980) (get!22096 (select (arr!43799 _values!1320) from!1980) (dynLambda!3672 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23893 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153))))

(declare-fun b!1336180 () Bool)

(declare-fun res!886726 () Bool)

(assert (=> b!1336180 (=> (not res!886726) (not e!760972))))

(assert (=> b!1336180 (= res!886726 (not (= (select (arr!43798 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336181 () Bool)

(declare-fun res!886721 () Bool)

(assert (=> b!1336181 (=> (not res!886721) (not e!760972))))

(assert (=> b!1336181 (= res!886721 (and (= (size!44349 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44348 _keys!1590) (size!44349 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57032 () Bool)

(declare-fun mapRes!57032 () Bool)

(declare-fun tp!108619 () Bool)

(declare-fun e!760971 () Bool)

(assert (=> mapNonEmpty!57032 (= mapRes!57032 (and tp!108619 e!760971))))

(declare-fun mapKey!57032 () (_ BitVec 32))

(declare-fun mapRest!57032 () (Array (_ BitVec 32) ValueCell!17553))

(declare-fun mapValue!57032 () ValueCell!17553)

(assert (=> mapNonEmpty!57032 (= (arr!43799 _values!1320) (store mapRest!57032 mapKey!57032 mapValue!57032))))

(declare-fun b!1336182 () Bool)

(declare-fun res!886723 () Bool)

(assert (=> b!1336182 (=> (not res!886723) (not e!760972))))

(assert (=> b!1336182 (= res!886723 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44348 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57032 () Bool)

(assert (=> mapIsEmpty!57032 mapRes!57032))

(declare-fun res!886724 () Bool)

(assert (=> start!112656 (=> (not res!886724) (not e!760972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112656 (= res!886724 (validMask!0 mask!1998))))

(assert (=> start!112656 e!760972))

(declare-fun e!760973 () Bool)

(declare-fun array_inv!33029 (array!90668) Bool)

(assert (=> start!112656 (and (array_inv!33029 _values!1320) e!760973)))

(assert (=> start!112656 true))

(declare-fun array_inv!33030 (array!90666) Bool)

(assert (=> start!112656 (array_inv!33030 _keys!1590)))

(assert (=> start!112656 tp!108620))

(declare-fun tp_is_empty!36903 () Bool)

(assert (=> start!112656 tp_is_empty!36903))

(declare-fun b!1336183 () Bool)

(declare-fun res!886727 () Bool)

(assert (=> b!1336183 (=> (not res!886727) (not e!760972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90666 (_ BitVec 32)) Bool)

(assert (=> b!1336183 (= res!886727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336184 () Bool)

(declare-fun res!886719 () Bool)

(assert (=> b!1336184 (=> (not res!886719) (not e!760972))))

(assert (=> b!1336184 (= res!886719 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336185 () Bool)

(declare-fun e!760974 () Bool)

(assert (=> b!1336185 (= e!760974 tp_is_empty!36903)))

(declare-fun b!1336186 () Bool)

(assert (=> b!1336186 (= e!760971 tp_is_empty!36903)))

(declare-fun b!1336187 () Bool)

(declare-fun res!886720 () Bool)

(assert (=> b!1336187 (=> (not res!886720) (not e!760972))))

(declare-fun getCurrentListMap!5762 (array!90666 array!90668 (_ BitVec 32) (_ BitVec 32) V!54307 V!54307 (_ BitVec 32) Int) ListLongMap!21549)

(assert (=> b!1336187 (= res!886720 (contains!8955 (getCurrentListMap!5762 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336188 () Bool)

(assert (=> b!1336188 (= e!760973 (and e!760974 mapRes!57032))))

(declare-fun condMapEmpty!57032 () Bool)

(declare-fun mapDefault!57032 () ValueCell!17553)

(assert (=> b!1336188 (= condMapEmpty!57032 (= (arr!43799 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17553)) mapDefault!57032)))))

(assert (= (and start!112656 res!886724) b!1336181))

(assert (= (and b!1336181 res!886721) b!1336183))

(assert (= (and b!1336183 res!886727) b!1336178))

(assert (= (and b!1336178 res!886722) b!1336182))

(assert (= (and b!1336182 res!886723) b!1336187))

(assert (= (and b!1336187 res!886720) b!1336180))

(assert (= (and b!1336180 res!886726) b!1336177))

(assert (= (and b!1336177 res!886725) b!1336184))

(assert (= (and b!1336184 res!886719) b!1336179))

(assert (= (and b!1336188 condMapEmpty!57032) mapIsEmpty!57032))

(assert (= (and b!1336188 (not condMapEmpty!57032)) mapNonEmpty!57032))

(get-info :version)

(assert (= (and mapNonEmpty!57032 ((_ is ValueCellFull!17553) mapValue!57032)) b!1336186))

(assert (= (and b!1336188 ((_ is ValueCellFull!17553) mapDefault!57032)) b!1336185))

(assert (= start!112656 b!1336188))

(declare-fun b_lambda!24151 () Bool)

(assert (=> (not b_lambda!24151) (not b!1336179)))

(declare-fun t!45307 () Bool)

(declare-fun tb!12077 () Bool)

(assert (=> (and start!112656 (= defaultEntry!1323 defaultEntry!1323) t!45307) tb!12077))

(declare-fun result!25227 () Bool)

(assert (=> tb!12077 (= result!25227 tp_is_empty!36903)))

(assert (=> b!1336179 t!45307))

(declare-fun b_and!49925 () Bool)

(assert (= b_and!49923 (and (=> t!45307 result!25227) b_and!49925)))

(declare-fun m!1224293 () Bool)

(assert (=> b!1336183 m!1224293))

(declare-fun m!1224295 () Bool)

(assert (=> b!1336178 m!1224295))

(declare-fun m!1224297 () Bool)

(assert (=> start!112656 m!1224297))

(declare-fun m!1224299 () Bool)

(assert (=> start!112656 m!1224299))

(declare-fun m!1224301 () Bool)

(assert (=> start!112656 m!1224301))

(declare-fun m!1224303 () Bool)

(assert (=> b!1336180 m!1224303))

(assert (=> b!1336177 m!1224303))

(assert (=> b!1336177 m!1224303))

(declare-fun m!1224305 () Bool)

(assert (=> b!1336177 m!1224305))

(declare-fun m!1224307 () Bool)

(assert (=> b!1336179 m!1224307))

(declare-fun m!1224309 () Bool)

(assert (=> b!1336179 m!1224309))

(declare-fun m!1224311 () Bool)

(assert (=> b!1336179 m!1224311))

(declare-fun m!1224313 () Bool)

(assert (=> b!1336179 m!1224313))

(declare-fun m!1224315 () Bool)

(assert (=> b!1336179 m!1224315))

(assert (=> b!1336179 m!1224309))

(declare-fun m!1224317 () Bool)

(assert (=> b!1336179 m!1224317))

(assert (=> b!1336179 m!1224307))

(assert (=> b!1336179 m!1224311))

(assert (=> b!1336179 m!1224303))

(assert (=> b!1336179 m!1224313))

(assert (=> b!1336179 m!1224317))

(declare-fun m!1224319 () Bool)

(assert (=> b!1336179 m!1224319))

(declare-fun m!1224321 () Bool)

(assert (=> mapNonEmpty!57032 m!1224321))

(declare-fun m!1224323 () Bool)

(assert (=> b!1336187 m!1224323))

(assert (=> b!1336187 m!1224323))

(declare-fun m!1224325 () Bool)

(assert (=> b!1336187 m!1224325))

(check-sat (not start!112656) (not mapNonEmpty!57032) (not b!1336178) (not b!1336183) (not b!1336187) b_and!49925 (not b!1336179) tp_is_empty!36903 (not b_lambda!24151) (not b_next!30993) (not b!1336177))
(check-sat b_and!49925 (not b_next!30993))
