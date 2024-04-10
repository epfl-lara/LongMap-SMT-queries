; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112662 () Bool)

(assert start!112662)

(declare-fun b_free!30999 () Bool)

(declare-fun b_next!30999 () Bool)

(assert (=> start!112662 (= b_free!30999 (not b_next!30999))))

(declare-fun tp!108638 () Bool)

(declare-fun b_and!49935 () Bool)

(assert (=> start!112662 (= tp!108638 b_and!49935)))

(declare-fun b!1336291 () Bool)

(declare-fun res!886805 () Bool)

(declare-fun e!761016 () Bool)

(assert (=> b!1336291 (=> (not res!886805) (not e!761016))))

(declare-datatypes ((array!90678 0))(
  ( (array!90679 (arr!43804 (Array (_ BitVec 32) (_ BitVec 64))) (size!44354 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90678)

(declare-datatypes ((List!31040 0))(
  ( (Nil!31037) (Cons!31036 (h!32245 (_ BitVec 64)) (t!45320 List!31040)) )
))
(declare-fun arrayNoDuplicates!0 (array!90678 (_ BitVec 32) List!31040) Bool)

(assert (=> b!1336291 (= res!886805 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31037))))

(declare-fun b!1336292 () Bool)

(declare-fun e!761020 () Bool)

(declare-fun tp_is_empty!36909 () Bool)

(assert (=> b!1336292 (= e!761020 tp_is_empty!36909)))

(declare-fun mapIsEmpty!57041 () Bool)

(declare-fun mapRes!57041 () Bool)

(assert (=> mapIsEmpty!57041 mapRes!57041))

(declare-fun b!1336293 () Bool)

(declare-fun res!886803 () Bool)

(assert (=> b!1336293 (=> (not res!886803) (not e!761016))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336293 (= res!886803 (validKeyInArray!0 (select (arr!43804 _keys!1590) from!1980)))))

(declare-fun b!1336294 () Bool)

(declare-fun res!886808 () Bool)

(assert (=> b!1336294 (=> (not res!886808) (not e!761016))))

(declare-datatypes ((V!54315 0))(
  ( (V!54316 (val!18529 Int)) )
))
(declare-datatypes ((ValueCell!17556 0))(
  ( (ValueCellFull!17556 (v!21169 V!54315)) (EmptyCell!17556) )
))
(declare-datatypes ((array!90680 0))(
  ( (array!90681 (arr!43805 (Array (_ BitVec 32) ValueCell!17556)) (size!44355 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90680)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54315)

(declare-fun zeroValue!1262 () V!54315)

(declare-datatypes ((tuple2!23898 0))(
  ( (tuple2!23899 (_1!11960 (_ BitVec 64)) (_2!11960 V!54315)) )
))
(declare-datatypes ((List!31041 0))(
  ( (Nil!31038) (Cons!31037 (h!32246 tuple2!23898) (t!45321 List!31041)) )
))
(declare-datatypes ((ListLongMap!21555 0))(
  ( (ListLongMap!21556 (toList!10793 List!31041)) )
))
(declare-fun contains!8958 (ListLongMap!21555 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5765 (array!90678 array!90680 (_ BitVec 32) (_ BitVec 32) V!54315 V!54315 (_ BitVec 32) Int) ListLongMap!21555)

(assert (=> b!1336294 (= res!886808 (contains!8958 (getCurrentListMap!5765 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun res!886806 () Bool)

(assert (=> start!112662 (=> (not res!886806) (not e!761016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112662 (= res!886806 (validMask!0 mask!1998))))

(assert (=> start!112662 e!761016))

(declare-fun e!761018 () Bool)

(declare-fun array_inv!33035 (array!90680) Bool)

(assert (=> start!112662 (and (array_inv!33035 _values!1320) e!761018)))

(assert (=> start!112662 true))

(declare-fun array_inv!33036 (array!90678) Bool)

(assert (=> start!112662 (array_inv!33036 _keys!1590)))

(assert (=> start!112662 tp!108638))

(assert (=> start!112662 tp_is_empty!36909))

(declare-fun b!1336295 () Bool)

(declare-fun res!886802 () Bool)

(assert (=> b!1336295 (=> (not res!886802) (not e!761016))))

(assert (=> b!1336295 (= res!886802 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336296 () Bool)

(declare-fun res!886801 () Bool)

(assert (=> b!1336296 (=> (not res!886801) (not e!761016))))

(assert (=> b!1336296 (= res!886801 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44354 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336297 () Bool)

(assert (=> b!1336297 (= e!761016 (not true))))

(declare-fun lt!592751 () ListLongMap!21555)

(assert (=> b!1336297 (contains!8958 lt!592751 k0!1153)))

(declare-datatypes ((Unit!43920 0))(
  ( (Unit!43921) )
))
(declare-fun lt!592750 () Unit!43920)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!315 ((_ BitVec 64) (_ BitVec 64) V!54315 ListLongMap!21555) Unit!43920)

(assert (=> b!1336297 (= lt!592750 (lemmaInListMapAfterAddingDiffThenInBefore!315 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592751))))

(declare-fun +!4736 (ListLongMap!21555 tuple2!23898) ListLongMap!21555)

(declare-fun getCurrentListMapNoExtraKeys!6378 (array!90678 array!90680 (_ BitVec 32) (_ BitVec 32) V!54315 V!54315 (_ BitVec 32) Int) ListLongMap!21555)

(declare-fun get!22101 (ValueCell!17556 V!54315) V!54315)

(declare-fun dynLambda!3675 (Int (_ BitVec 64)) V!54315)

(assert (=> b!1336297 (= lt!592751 (+!4736 (getCurrentListMapNoExtraKeys!6378 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23899 (select (arr!43804 _keys!1590) from!1980) (get!22101 (select (arr!43805 _values!1320) from!1980) (dynLambda!3675 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336298 () Bool)

(declare-fun res!886804 () Bool)

(assert (=> b!1336298 (=> (not res!886804) (not e!761016))))

(assert (=> b!1336298 (= res!886804 (not (= (select (arr!43804 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336299 () Bool)

(declare-fun res!886807 () Bool)

(assert (=> b!1336299 (=> (not res!886807) (not e!761016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90678 (_ BitVec 32)) Bool)

(assert (=> b!1336299 (= res!886807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336300 () Bool)

(assert (=> b!1336300 (= e!761018 (and e!761020 mapRes!57041))))

(declare-fun condMapEmpty!57041 () Bool)

(declare-fun mapDefault!57041 () ValueCell!17556)

(assert (=> b!1336300 (= condMapEmpty!57041 (= (arr!43805 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17556)) mapDefault!57041)))))

(declare-fun b!1336301 () Bool)

(declare-fun res!886800 () Bool)

(assert (=> b!1336301 (=> (not res!886800) (not e!761016))))

(assert (=> b!1336301 (= res!886800 (and (= (size!44355 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44354 _keys!1590) (size!44355 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57041 () Bool)

(declare-fun tp!108637 () Bool)

(declare-fun e!761017 () Bool)

(assert (=> mapNonEmpty!57041 (= mapRes!57041 (and tp!108637 e!761017))))

(declare-fun mapKey!57041 () (_ BitVec 32))

(declare-fun mapValue!57041 () ValueCell!17556)

(declare-fun mapRest!57041 () (Array (_ BitVec 32) ValueCell!17556))

(assert (=> mapNonEmpty!57041 (= (arr!43805 _values!1320) (store mapRest!57041 mapKey!57041 mapValue!57041))))

(declare-fun b!1336302 () Bool)

(assert (=> b!1336302 (= e!761017 tp_is_empty!36909)))

(assert (= (and start!112662 res!886806) b!1336301))

(assert (= (and b!1336301 res!886800) b!1336299))

(assert (= (and b!1336299 res!886807) b!1336291))

(assert (= (and b!1336291 res!886805) b!1336296))

(assert (= (and b!1336296 res!886801) b!1336294))

(assert (= (and b!1336294 res!886808) b!1336298))

(assert (= (and b!1336298 res!886804) b!1336293))

(assert (= (and b!1336293 res!886803) b!1336295))

(assert (= (and b!1336295 res!886802) b!1336297))

(assert (= (and b!1336300 condMapEmpty!57041) mapIsEmpty!57041))

(assert (= (and b!1336300 (not condMapEmpty!57041)) mapNonEmpty!57041))

(get-info :version)

(assert (= (and mapNonEmpty!57041 ((_ is ValueCellFull!17556) mapValue!57041)) b!1336302))

(assert (= (and b!1336300 ((_ is ValueCellFull!17556) mapDefault!57041)) b!1336292))

(assert (= start!112662 b!1336300))

(declare-fun b_lambda!24157 () Bool)

(assert (=> (not b_lambda!24157) (not b!1336297)))

(declare-fun t!45319 () Bool)

(declare-fun tb!12083 () Bool)

(assert (=> (and start!112662 (= defaultEntry!1323 defaultEntry!1323) t!45319) tb!12083))

(declare-fun result!25239 () Bool)

(assert (=> tb!12083 (= result!25239 tp_is_empty!36909)))

(assert (=> b!1336297 t!45319))

(declare-fun b_and!49937 () Bool)

(assert (= b_and!49935 (and (=> t!45319 result!25239) b_and!49937)))

(declare-fun m!1224395 () Bool)

(assert (=> b!1336297 m!1224395))

(declare-fun m!1224397 () Bool)

(assert (=> b!1336297 m!1224397))

(declare-fun m!1224399 () Bool)

(assert (=> b!1336297 m!1224399))

(assert (=> b!1336297 m!1224397))

(declare-fun m!1224401 () Bool)

(assert (=> b!1336297 m!1224401))

(declare-fun m!1224403 () Bool)

(assert (=> b!1336297 m!1224403))

(assert (=> b!1336297 m!1224401))

(assert (=> b!1336297 m!1224395))

(declare-fun m!1224405 () Bool)

(assert (=> b!1336297 m!1224405))

(declare-fun m!1224407 () Bool)

(assert (=> b!1336297 m!1224407))

(declare-fun m!1224409 () Bool)

(assert (=> b!1336297 m!1224409))

(assert (=> b!1336293 m!1224403))

(assert (=> b!1336293 m!1224403))

(declare-fun m!1224411 () Bool)

(assert (=> b!1336293 m!1224411))

(declare-fun m!1224413 () Bool)

(assert (=> b!1336299 m!1224413))

(declare-fun m!1224415 () Bool)

(assert (=> start!112662 m!1224415))

(declare-fun m!1224417 () Bool)

(assert (=> start!112662 m!1224417))

(declare-fun m!1224419 () Bool)

(assert (=> start!112662 m!1224419))

(assert (=> b!1336298 m!1224403))

(declare-fun m!1224421 () Bool)

(assert (=> b!1336294 m!1224421))

(assert (=> b!1336294 m!1224421))

(declare-fun m!1224423 () Bool)

(assert (=> b!1336294 m!1224423))

(declare-fun m!1224425 () Bool)

(assert (=> mapNonEmpty!57041 m!1224425))

(declare-fun m!1224427 () Bool)

(assert (=> b!1336291 m!1224427))

(check-sat (not b_lambda!24157) (not b!1336291) (not b!1336297) (not start!112662) (not b!1336293) tp_is_empty!36909 (not b!1336294) (not b!1336299) (not b_next!30999) (not mapNonEmpty!57041) b_and!49937)
(check-sat b_and!49937 (not b_next!30999))
