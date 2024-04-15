; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73834 () Bool)

(assert start!73834)

(declare-fun b_free!14767 () Bool)

(declare-fun b_next!14767 () Bool)

(assert (=> start!73834 (= b_free!14767 (not b_next!14767))))

(declare-fun tp!51806 () Bool)

(declare-fun b_and!24487 () Bool)

(assert (=> start!73834 (= tp!51806 b_and!24487)))

(declare-fun b!867186 () Bool)

(declare-fun res!589254 () Bool)

(declare-fun e!483032 () Bool)

(assert (=> b!867186 (=> (not res!589254) (not e!483032))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867186 (= res!589254 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26954 () Bool)

(declare-fun mapRes!26954 () Bool)

(assert (=> mapIsEmpty!26954 mapRes!26954))

(declare-fun b!867187 () Bool)

(declare-datatypes ((Unit!29702 0))(
  ( (Unit!29703) )
))
(declare-fun e!483037 () Unit!29702)

(declare-fun Unit!29704 () Unit!29702)

(assert (=> b!867187 (= e!483037 Unit!29704)))

(declare-fun lt!393830 () Unit!29702)

(declare-datatypes ((array!49955 0))(
  ( (array!49956 (arr!24009 (Array (_ BitVec 32) (_ BitVec 64))) (size!24451 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49955)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49955 (_ BitVec 32) (_ BitVec 32)) Unit!29702)

(assert (=> b!867187 (= lt!393830 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17087 0))(
  ( (Nil!17084) (Cons!17083 (h!18214 (_ BitVec 64)) (t!24111 List!17087)) )
))
(declare-fun arrayNoDuplicates!0 (array!49955 (_ BitVec 32) List!17087) Bool)

(assert (=> b!867187 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17084)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lt!393835 () Unit!29702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49955 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29702)

(assert (=> b!867187 (= lt!393835 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867187 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393822 () Unit!29702)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49955 (_ BitVec 64) (_ BitVec 32) List!17087) Unit!29702)

(assert (=> b!867187 (= lt!393822 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17084))))

(assert (=> b!867187 false))

(declare-fun b!867188 () Bool)

(declare-fun res!589244 () Bool)

(assert (=> b!867188 (=> (not res!589244) (not e!483032))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27585 0))(
  ( (V!27586 (val!8499 Int)) )
))
(declare-datatypes ((ValueCell!8012 0))(
  ( (ValueCellFull!8012 (v!10918 V!27585)) (EmptyCell!8012) )
))
(declare-datatypes ((array!49957 0))(
  ( (array!49958 (arr!24010 (Array (_ BitVec 32) ValueCell!8012)) (size!24452 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49957)

(assert (=> b!867188 (= res!589244 (and (= (size!24452 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24451 _keys!868) (size!24452 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867189 () Bool)

(declare-fun res!589253 () Bool)

(assert (=> b!867189 (=> (not res!589253) (not e!483032))))

(assert (=> b!867189 (= res!589253 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17084))))

(declare-fun b!867190 () Bool)

(declare-fun e!483034 () Bool)

(declare-fun tp_is_empty!16903 () Bool)

(assert (=> b!867190 (= e!483034 tp_is_empty!16903)))

(declare-fun res!589251 () Bool)

(assert (=> start!73834 (=> (not res!589251) (not e!483032))))

(assert (=> start!73834 (= res!589251 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24451 _keys!868))))))

(assert (=> start!73834 e!483032))

(assert (=> start!73834 tp_is_empty!16903))

(assert (=> start!73834 true))

(assert (=> start!73834 tp!51806))

(declare-fun array_inv!19046 (array!49955) Bool)

(assert (=> start!73834 (array_inv!19046 _keys!868)))

(declare-fun e!483033 () Bool)

(declare-fun array_inv!19047 (array!49957) Bool)

(assert (=> start!73834 (and (array_inv!19047 _values!688) e!483033)))

(declare-fun b!867191 () Bool)

(declare-fun res!589249 () Bool)

(assert (=> b!867191 (=> (not res!589249) (not e!483032))))

(assert (=> b!867191 (= res!589249 (and (= (select (arr!24009 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867192 () Bool)

(declare-fun res!589248 () Bool)

(assert (=> b!867192 (=> (not res!589248) (not e!483032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867192 (= res!589248 (validMask!0 mask!1196))))

(declare-fun b!867193 () Bool)

(declare-fun e!483038 () Bool)

(declare-fun e!483035 () Bool)

(assert (=> b!867193 (= e!483038 e!483035)))

(declare-fun res!589245 () Bool)

(assert (=> b!867193 (=> res!589245 e!483035)))

(assert (=> b!867193 (= res!589245 (= k0!854 (select (arr!24009 _keys!868) from!1053)))))

(assert (=> b!867193 (not (= (select (arr!24009 _keys!868) from!1053) k0!854))))

(declare-fun lt!393823 () Unit!29702)

(assert (=> b!867193 (= lt!393823 e!483037)))

(declare-fun c!92306 () Bool)

(assert (=> b!867193 (= c!92306 (= (select (arr!24009 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11298 0))(
  ( (tuple2!11299 (_1!5660 (_ BitVec 64)) (_2!5660 V!27585)) )
))
(declare-datatypes ((List!17088 0))(
  ( (Nil!17085) (Cons!17084 (h!18215 tuple2!11298) (t!24112 List!17088)) )
))
(declare-datatypes ((ListLongMap!10057 0))(
  ( (ListLongMap!10058 (toList!5044 List!17088)) )
))
(declare-fun lt!393821 () ListLongMap!10057)

(declare-fun lt!393829 () ListLongMap!10057)

(assert (=> b!867193 (= lt!393821 lt!393829)))

(declare-fun lt!393828 () ListLongMap!10057)

(declare-fun lt!393824 () tuple2!11298)

(declare-fun +!2410 (ListLongMap!10057 tuple2!11298) ListLongMap!10057)

(assert (=> b!867193 (= lt!393829 (+!2410 lt!393828 lt!393824))))

(declare-fun lt!393831 () V!27585)

(assert (=> b!867193 (= lt!393824 (tuple2!11299 (select (arr!24009 _keys!868) from!1053) lt!393831))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12702 (ValueCell!8012 V!27585) V!27585)

(declare-fun dynLambda!1199 (Int (_ BitVec 64)) V!27585)

(assert (=> b!867193 (= lt!393831 (get!12702 (select (arr!24010 _values!688) from!1053) (dynLambda!1199 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!26954 () Bool)

(declare-fun tp!51805 () Bool)

(declare-fun e!483039 () Bool)

(assert (=> mapNonEmpty!26954 (= mapRes!26954 (and tp!51805 e!483039))))

(declare-fun mapRest!26954 () (Array (_ BitVec 32) ValueCell!8012))

(declare-fun mapValue!26954 () ValueCell!8012)

(declare-fun mapKey!26954 () (_ BitVec 32))

(assert (=> mapNonEmpty!26954 (= (arr!24010 _values!688) (store mapRest!26954 mapKey!26954 mapValue!26954))))

(declare-fun b!867194 () Bool)

(declare-fun Unit!29705 () Unit!29702)

(assert (=> b!867194 (= e!483037 Unit!29705)))

(declare-fun b!867195 () Bool)

(declare-fun res!589250 () Bool)

(assert (=> b!867195 (=> (not res!589250) (not e!483032))))

(assert (=> b!867195 (= res!589250 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24451 _keys!868))))))

(declare-fun b!867196 () Bool)

(assert (=> b!867196 (= e!483033 (and e!483034 mapRes!26954))))

(declare-fun condMapEmpty!26954 () Bool)

(declare-fun mapDefault!26954 () ValueCell!8012)

(assert (=> b!867196 (= condMapEmpty!26954 (= (arr!24010 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8012)) mapDefault!26954)))))

(declare-fun b!867197 () Bool)

(declare-fun res!589252 () Bool)

(assert (=> b!867197 (=> (not res!589252) (not e!483032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49955 (_ BitVec 32)) Bool)

(assert (=> b!867197 (= res!589252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867198 () Bool)

(declare-fun e!483031 () Bool)

(assert (=> b!867198 (= e!483032 e!483031)))

(declare-fun res!589247 () Bool)

(assert (=> b!867198 (=> (not res!589247) (not e!483031))))

(assert (=> b!867198 (= res!589247 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun minValue!654 () V!27585)

(declare-fun zeroValue!654 () V!27585)

(declare-fun lt!393834 () array!49957)

(declare-fun getCurrentListMapNoExtraKeys!3038 (array!49955 array!49957 (_ BitVec 32) (_ BitVec 32) V!27585 V!27585 (_ BitVec 32) Int) ListLongMap!10057)

(assert (=> b!867198 (= lt!393821 (getCurrentListMapNoExtraKeys!3038 _keys!868 lt!393834 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27585)

(assert (=> b!867198 (= lt!393834 (array!49958 (store (arr!24010 _values!688) i!612 (ValueCellFull!8012 v!557)) (size!24452 _values!688)))))

(declare-fun lt!393827 () ListLongMap!10057)

(assert (=> b!867198 (= lt!393827 (getCurrentListMapNoExtraKeys!3038 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867199 () Bool)

(assert (=> b!867199 (= e!483039 tp_is_empty!16903)))

(declare-fun b!867200 () Bool)

(assert (=> b!867200 (= e!483035 true)))

(declare-fun lt!393826 () ListLongMap!10057)

(declare-fun lt!393832 () tuple2!11298)

(assert (=> b!867200 (= lt!393829 (+!2410 (+!2410 lt!393826 lt!393824) lt!393832))))

(declare-fun lt!393836 () Unit!29702)

(declare-fun addCommutativeForDiffKeys!546 (ListLongMap!10057 (_ BitVec 64) V!27585 (_ BitVec 64) V!27585) Unit!29702)

(assert (=> b!867200 (= lt!393836 (addCommutativeForDiffKeys!546 lt!393826 k0!854 v!557 (select (arr!24009 _keys!868) from!1053) lt!393831))))

(declare-fun b!867201 () Bool)

(assert (=> b!867201 (= e!483031 (not e!483038))))

(declare-fun res!589246 () Bool)

(assert (=> b!867201 (=> res!589246 e!483038)))

(assert (=> b!867201 (= res!589246 (not (validKeyInArray!0 (select (arr!24009 _keys!868) from!1053))))))

(declare-fun lt!393825 () ListLongMap!10057)

(assert (=> b!867201 (= lt!393825 lt!393828)))

(assert (=> b!867201 (= lt!393828 (+!2410 lt!393826 lt!393832))))

(assert (=> b!867201 (= lt!393825 (getCurrentListMapNoExtraKeys!3038 _keys!868 lt!393834 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!867201 (= lt!393832 (tuple2!11299 k0!854 v!557))))

(assert (=> b!867201 (= lt!393826 (getCurrentListMapNoExtraKeys!3038 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393833 () Unit!29702)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!579 (array!49955 array!49957 (_ BitVec 32) (_ BitVec 32) V!27585 V!27585 (_ BitVec 32) (_ BitVec 64) V!27585 (_ BitVec 32) Int) Unit!29702)

(assert (=> b!867201 (= lt!393833 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!579 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73834 res!589251) b!867192))

(assert (= (and b!867192 res!589248) b!867188))

(assert (= (and b!867188 res!589244) b!867197))

(assert (= (and b!867197 res!589252) b!867189))

(assert (= (and b!867189 res!589253) b!867195))

(assert (= (and b!867195 res!589250) b!867186))

(assert (= (and b!867186 res!589254) b!867191))

(assert (= (and b!867191 res!589249) b!867198))

(assert (= (and b!867198 res!589247) b!867201))

(assert (= (and b!867201 (not res!589246)) b!867193))

(assert (= (and b!867193 c!92306) b!867187))

(assert (= (and b!867193 (not c!92306)) b!867194))

(assert (= (and b!867193 (not res!589245)) b!867200))

(assert (= (and b!867196 condMapEmpty!26954) mapIsEmpty!26954))

(assert (= (and b!867196 (not condMapEmpty!26954)) mapNonEmpty!26954))

(get-info :version)

(assert (= (and mapNonEmpty!26954 ((_ is ValueCellFull!8012) mapValue!26954)) b!867199))

(assert (= (and b!867196 ((_ is ValueCellFull!8012) mapDefault!26954)) b!867190))

(assert (= start!73834 b!867196))

(declare-fun b_lambda!12101 () Bool)

(assert (=> (not b_lambda!12101) (not b!867193)))

(declare-fun t!24110 () Bool)

(declare-fun tb!4881 () Bool)

(assert (=> (and start!73834 (= defaultEntry!696 defaultEntry!696) t!24110) tb!4881))

(declare-fun result!9381 () Bool)

(assert (=> tb!4881 (= result!9381 tp_is_empty!16903)))

(assert (=> b!867193 t!24110))

(declare-fun b_and!24489 () Bool)

(assert (= b_and!24487 (and (=> t!24110 result!9381) b_and!24489)))

(declare-fun m!808485 () Bool)

(assert (=> b!867187 m!808485))

(declare-fun m!808487 () Bool)

(assert (=> b!867187 m!808487))

(declare-fun m!808489 () Bool)

(assert (=> b!867187 m!808489))

(declare-fun m!808491 () Bool)

(assert (=> b!867187 m!808491))

(declare-fun m!808493 () Bool)

(assert (=> b!867187 m!808493))

(declare-fun m!808495 () Bool)

(assert (=> b!867189 m!808495))

(declare-fun m!808497 () Bool)

(assert (=> b!867186 m!808497))

(declare-fun m!808499 () Bool)

(assert (=> b!867200 m!808499))

(assert (=> b!867200 m!808499))

(declare-fun m!808501 () Bool)

(assert (=> b!867200 m!808501))

(declare-fun m!808503 () Bool)

(assert (=> b!867200 m!808503))

(assert (=> b!867200 m!808503))

(declare-fun m!808505 () Bool)

(assert (=> b!867200 m!808505))

(declare-fun m!808507 () Bool)

(assert (=> b!867198 m!808507))

(declare-fun m!808509 () Bool)

(assert (=> b!867198 m!808509))

(declare-fun m!808511 () Bool)

(assert (=> b!867198 m!808511))

(declare-fun m!808513 () Bool)

(assert (=> b!867192 m!808513))

(declare-fun m!808515 () Bool)

(assert (=> mapNonEmpty!26954 m!808515))

(declare-fun m!808517 () Bool)

(assert (=> start!73834 m!808517))

(declare-fun m!808519 () Bool)

(assert (=> start!73834 m!808519))

(declare-fun m!808521 () Bool)

(assert (=> b!867197 m!808521))

(declare-fun m!808523 () Bool)

(assert (=> b!867193 m!808523))

(declare-fun m!808525 () Bool)

(assert (=> b!867193 m!808525))

(declare-fun m!808527 () Bool)

(assert (=> b!867193 m!808527))

(assert (=> b!867193 m!808523))

(declare-fun m!808529 () Bool)

(assert (=> b!867193 m!808529))

(assert (=> b!867193 m!808503))

(assert (=> b!867193 m!808525))

(declare-fun m!808531 () Bool)

(assert (=> b!867191 m!808531))

(declare-fun m!808533 () Bool)

(assert (=> b!867201 m!808533))

(declare-fun m!808535 () Bool)

(assert (=> b!867201 m!808535))

(assert (=> b!867201 m!808503))

(declare-fun m!808537 () Bool)

(assert (=> b!867201 m!808537))

(assert (=> b!867201 m!808503))

(declare-fun m!808539 () Bool)

(assert (=> b!867201 m!808539))

(declare-fun m!808541 () Bool)

(assert (=> b!867201 m!808541))

(check-sat (not b!867187) (not b!867200) (not b!867201) (not b!867192) (not b_lambda!12101) (not b!867189) (not b!867186) b_and!24489 (not b!867198) (not b!867193) tp_is_empty!16903 (not b!867197) (not mapNonEmpty!26954) (not start!73834) (not b_next!14767))
(check-sat b_and!24489 (not b_next!14767))
