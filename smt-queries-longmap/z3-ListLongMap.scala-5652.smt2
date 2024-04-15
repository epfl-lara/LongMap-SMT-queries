; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73678 () Bool)

(assert start!73678)

(declare-fun b_free!14611 () Bool)

(declare-fun b_next!14611 () Bool)

(assert (=> start!73678 (= b_free!14611 (not b_next!14611))))

(declare-fun tp!51337 () Bool)

(declare-fun b_and!24175 () Bool)

(assert (=> start!73678 (= tp!51337 b_and!24175)))

(declare-fun b!863286 () Bool)

(declare-fun e!480929 () Bool)

(declare-fun e!480931 () Bool)

(assert (=> b!863286 (= e!480929 (not e!480931))))

(declare-fun res!586677 () Bool)

(assert (=> b!863286 (=> res!586677 e!480931)))

(declare-datatypes ((array!49647 0))(
  ( (array!49648 (arr!23855 (Array (_ BitVec 32) (_ BitVec 64))) (size!24297 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49647)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!863286 (= res!586677 (not (validKeyInArray!0 (select (arr!23855 _keys!868) from!1053))))))

(declare-datatypes ((V!27377 0))(
  ( (V!27378 (val!8421 Int)) )
))
(declare-datatypes ((tuple2!11158 0))(
  ( (tuple2!11159 (_1!5590 (_ BitVec 64)) (_2!5590 V!27377)) )
))
(declare-datatypes ((List!16951 0))(
  ( (Nil!16948) (Cons!16947 (h!18078 tuple2!11158) (t!23819 List!16951)) )
))
(declare-datatypes ((ListLongMap!9917 0))(
  ( (ListLongMap!9918 (toList!4974 List!16951)) )
))
(declare-fun lt!390088 () ListLongMap!9917)

(declare-fun lt!390077 () ListLongMap!9917)

(assert (=> b!863286 (= lt!390088 lt!390077)))

(declare-fun lt!390082 () ListLongMap!9917)

(declare-fun lt!390086 () tuple2!11158)

(declare-fun +!2343 (ListLongMap!9917 tuple2!11158) ListLongMap!9917)

(assert (=> b!863286 (= lt!390077 (+!2343 lt!390082 lt!390086))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27377)

(declare-fun zeroValue!654 () V!27377)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7934 0))(
  ( (ValueCellFull!7934 (v!10840 V!27377)) (EmptyCell!7934) )
))
(declare-datatypes ((array!49649 0))(
  ( (array!49650 (arr!23856 (Array (_ BitVec 32) ValueCell!7934)) (size!24298 (_ BitVec 32))) )
))
(declare-fun lt!390092 () array!49649)

(declare-fun getCurrentListMapNoExtraKeys!2974 (array!49647 array!49649 (_ BitVec 32) (_ BitVec 32) V!27377 V!27377 (_ BitVec 32) Int) ListLongMap!9917)

(assert (=> b!863286 (= lt!390088 (getCurrentListMapNoExtraKeys!2974 _keys!868 lt!390092 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27377)

(assert (=> b!863286 (= lt!390086 (tuple2!11159 k0!854 v!557))))

(declare-fun _values!688 () array!49649)

(assert (=> b!863286 (= lt!390082 (getCurrentListMapNoExtraKeys!2974 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29439 0))(
  ( (Unit!29440) )
))
(declare-fun lt!390089 () Unit!29439)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!526 (array!49647 array!49649 (_ BitVec 32) (_ BitVec 32) V!27377 V!27377 (_ BitVec 32) (_ BitVec 64) V!27377 (_ BitVec 32) Int) Unit!29439)

(assert (=> b!863286 (= lt!390089 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!526 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!863287 () Bool)

(declare-fun res!586675 () Bool)

(declare-fun e!480933 () Bool)

(assert (=> b!863287 (=> (not res!586675) (not e!480933))))

(assert (=> b!863287 (= res!586675 (validKeyInArray!0 k0!854))))

(declare-fun b!863288 () Bool)

(declare-fun res!586672 () Bool)

(assert (=> b!863288 (=> (not res!586672) (not e!480933))))

(assert (=> b!863288 (= res!586672 (and (= (size!24298 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24297 _keys!868) (size!24298 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!863289 () Bool)

(declare-fun res!586673 () Bool)

(assert (=> b!863289 (=> (not res!586673) (not e!480933))))

(assert (=> b!863289 (= res!586673 (and (= (select (arr!23855 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!863290 () Bool)

(declare-fun res!586676 () Bool)

(assert (=> b!863290 (=> (not res!586676) (not e!480933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!863290 (= res!586676 (validMask!0 mask!1196))))

(declare-fun b!863291 () Bool)

(declare-fun e!480925 () Unit!29439)

(declare-fun Unit!29441 () Unit!29439)

(assert (=> b!863291 (= e!480925 Unit!29441)))

(declare-fun b!863292 () Bool)

(assert (=> b!863292 (= e!480933 e!480929)))

(declare-fun res!586670 () Bool)

(assert (=> b!863292 (=> (not res!586670) (not e!480929))))

(assert (=> b!863292 (= res!586670 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!390090 () ListLongMap!9917)

(assert (=> b!863292 (= lt!390090 (getCurrentListMapNoExtraKeys!2974 _keys!868 lt!390092 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!863292 (= lt!390092 (array!49650 (store (arr!23856 _values!688) i!612 (ValueCellFull!7934 v!557)) (size!24298 _values!688)))))

(declare-fun lt!390080 () ListLongMap!9917)

(assert (=> b!863292 (= lt!390080 (getCurrentListMapNoExtraKeys!2974 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!586671 () Bool)

(assert (=> start!73678 (=> (not res!586671) (not e!480933))))

(assert (=> start!73678 (= res!586671 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24297 _keys!868))))))

(assert (=> start!73678 e!480933))

(declare-fun tp_is_empty!16747 () Bool)

(assert (=> start!73678 tp_is_empty!16747))

(assert (=> start!73678 true))

(assert (=> start!73678 tp!51337))

(declare-fun array_inv!18940 (array!49647) Bool)

(assert (=> start!73678 (array_inv!18940 _keys!868)))

(declare-fun e!480926 () Bool)

(declare-fun array_inv!18941 (array!49649) Bool)

(assert (=> start!73678 (and (array_inv!18941 _values!688) e!480926)))

(declare-fun b!863293 () Bool)

(declare-fun Unit!29442 () Unit!29439)

(assert (=> b!863293 (= e!480925 Unit!29442)))

(declare-fun lt!390081 () Unit!29439)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49647 (_ BitVec 32) (_ BitVec 32)) Unit!29439)

(assert (=> b!863293 (= lt!390081 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16952 0))(
  ( (Nil!16949) (Cons!16948 (h!18079 (_ BitVec 64)) (t!23820 List!16952)) )
))
(declare-fun arrayNoDuplicates!0 (array!49647 (_ BitVec 32) List!16952) Bool)

(assert (=> b!863293 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16949)))

(declare-fun lt!390087 () Unit!29439)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49647 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29439)

(assert (=> b!863293 (= lt!390087 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!863293 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390091 () Unit!29439)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49647 (_ BitVec 64) (_ BitVec 32) List!16952) Unit!29439)

(assert (=> b!863293 (= lt!390091 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16949))))

(assert (=> b!863293 false))

(declare-fun b!863294 () Bool)

(declare-fun res!586678 () Bool)

(assert (=> b!863294 (=> (not res!586678) (not e!480933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49647 (_ BitVec 32)) Bool)

(assert (=> b!863294 (= res!586678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26720 () Bool)

(declare-fun mapRes!26720 () Bool)

(assert (=> mapIsEmpty!26720 mapRes!26720))

(declare-fun b!863295 () Bool)

(declare-fun e!480928 () Bool)

(assert (=> b!863295 (= e!480928 tp_is_empty!16747)))

(declare-fun b!863296 () Bool)

(declare-fun e!480932 () Bool)

(assert (=> b!863296 (= e!480932 tp_is_empty!16747)))

(declare-fun mapNonEmpty!26720 () Bool)

(declare-fun tp!51338 () Bool)

(assert (=> mapNonEmpty!26720 (= mapRes!26720 (and tp!51338 e!480932))))

(declare-fun mapRest!26720 () (Array (_ BitVec 32) ValueCell!7934))

(declare-fun mapKey!26720 () (_ BitVec 32))

(declare-fun mapValue!26720 () ValueCell!7934)

(assert (=> mapNonEmpty!26720 (= (arr!23856 _values!688) (store mapRest!26720 mapKey!26720 mapValue!26720))))

(declare-fun b!863297 () Bool)

(assert (=> b!863297 (= e!480926 (and e!480928 mapRes!26720))))

(declare-fun condMapEmpty!26720 () Bool)

(declare-fun mapDefault!26720 () ValueCell!7934)

(assert (=> b!863297 (= condMapEmpty!26720 (= (arr!23856 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7934)) mapDefault!26720)))))

(declare-fun b!863298 () Bool)

(declare-fun e!480927 () Bool)

(assert (=> b!863298 (= e!480927 true)))

(declare-fun lt!390085 () tuple2!11158)

(declare-fun lt!390084 () ListLongMap!9917)

(assert (=> b!863298 (= lt!390084 (+!2343 (+!2343 lt!390082 lt!390085) lt!390086))))

(declare-fun lt!390083 () Unit!29439)

(declare-fun lt!390078 () V!27377)

(declare-fun addCommutativeForDiffKeys!489 (ListLongMap!9917 (_ BitVec 64) V!27377 (_ BitVec 64) V!27377) Unit!29439)

(assert (=> b!863298 (= lt!390083 (addCommutativeForDiffKeys!489 lt!390082 k0!854 v!557 (select (arr!23855 _keys!868) from!1053) lt!390078))))

(declare-fun b!863299 () Bool)

(declare-fun res!586680 () Bool)

(assert (=> b!863299 (=> (not res!586680) (not e!480933))))

(assert (=> b!863299 (= res!586680 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24297 _keys!868))))))

(declare-fun b!863300 () Bool)

(assert (=> b!863300 (= e!480931 e!480927)))

(declare-fun res!586679 () Bool)

(assert (=> b!863300 (=> res!586679 e!480927)))

(assert (=> b!863300 (= res!586679 (= k0!854 (select (arr!23855 _keys!868) from!1053)))))

(assert (=> b!863300 (not (= (select (arr!23855 _keys!868) from!1053) k0!854))))

(declare-fun lt!390079 () Unit!29439)

(assert (=> b!863300 (= lt!390079 e!480925)))

(declare-fun c!92072 () Bool)

(assert (=> b!863300 (= c!92072 (= (select (arr!23855 _keys!868) from!1053) k0!854))))

(assert (=> b!863300 (= lt!390090 lt!390084)))

(assert (=> b!863300 (= lt!390084 (+!2343 lt!390077 lt!390085))))

(assert (=> b!863300 (= lt!390085 (tuple2!11159 (select (arr!23855 _keys!868) from!1053) lt!390078))))

(declare-fun get!12596 (ValueCell!7934 V!27377) V!27377)

(declare-fun dynLambda!1145 (Int (_ BitVec 64)) V!27377)

(assert (=> b!863300 (= lt!390078 (get!12596 (select (arr!23856 _values!688) from!1053) (dynLambda!1145 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!863301 () Bool)

(declare-fun res!586674 () Bool)

(assert (=> b!863301 (=> (not res!586674) (not e!480933))))

(assert (=> b!863301 (= res!586674 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16949))))

(assert (= (and start!73678 res!586671) b!863290))

(assert (= (and b!863290 res!586676) b!863288))

(assert (= (and b!863288 res!586672) b!863294))

(assert (= (and b!863294 res!586678) b!863301))

(assert (= (and b!863301 res!586674) b!863299))

(assert (= (and b!863299 res!586680) b!863287))

(assert (= (and b!863287 res!586675) b!863289))

(assert (= (and b!863289 res!586673) b!863292))

(assert (= (and b!863292 res!586670) b!863286))

(assert (= (and b!863286 (not res!586677)) b!863300))

(assert (= (and b!863300 c!92072) b!863293))

(assert (= (and b!863300 (not c!92072)) b!863291))

(assert (= (and b!863300 (not res!586679)) b!863298))

(assert (= (and b!863297 condMapEmpty!26720) mapIsEmpty!26720))

(assert (= (and b!863297 (not condMapEmpty!26720)) mapNonEmpty!26720))

(get-info :version)

(assert (= (and mapNonEmpty!26720 ((_ is ValueCellFull!7934) mapValue!26720)) b!863296))

(assert (= (and b!863297 ((_ is ValueCellFull!7934) mapDefault!26720)) b!863295))

(assert (= start!73678 b!863297))

(declare-fun b_lambda!11945 () Bool)

(assert (=> (not b_lambda!11945) (not b!863300)))

(declare-fun t!23818 () Bool)

(declare-fun tb!4725 () Bool)

(assert (=> (and start!73678 (= defaultEntry!696 defaultEntry!696) t!23818) tb!4725))

(declare-fun result!9069 () Bool)

(assert (=> tb!4725 (= result!9069 tp_is_empty!16747)))

(assert (=> b!863300 t!23818))

(declare-fun b_and!24177 () Bool)

(assert (= b_and!24175 (and (=> t!23818 result!9069) b_and!24177)))

(declare-fun m!803961 () Bool)

(assert (=> start!73678 m!803961))

(declare-fun m!803963 () Bool)

(assert (=> start!73678 m!803963))

(declare-fun m!803965 () Bool)

(assert (=> b!863287 m!803965))

(declare-fun m!803967 () Bool)

(assert (=> b!863294 m!803967))

(declare-fun m!803969 () Bool)

(assert (=> b!863301 m!803969))

(declare-fun m!803971 () Bool)

(assert (=> mapNonEmpty!26720 m!803971))

(declare-fun m!803973 () Bool)

(assert (=> b!863292 m!803973))

(declare-fun m!803975 () Bool)

(assert (=> b!863292 m!803975))

(declare-fun m!803977 () Bool)

(assert (=> b!863292 m!803977))

(declare-fun m!803979 () Bool)

(assert (=> b!863286 m!803979))

(declare-fun m!803981 () Bool)

(assert (=> b!863286 m!803981))

(declare-fun m!803983 () Bool)

(assert (=> b!863286 m!803983))

(assert (=> b!863286 m!803981))

(declare-fun m!803985 () Bool)

(assert (=> b!863286 m!803985))

(declare-fun m!803987 () Bool)

(assert (=> b!863286 m!803987))

(declare-fun m!803989 () Bool)

(assert (=> b!863286 m!803989))

(declare-fun m!803991 () Bool)

(assert (=> b!863298 m!803991))

(assert (=> b!863298 m!803991))

(declare-fun m!803993 () Bool)

(assert (=> b!863298 m!803993))

(assert (=> b!863298 m!803981))

(assert (=> b!863298 m!803981))

(declare-fun m!803995 () Bool)

(assert (=> b!863298 m!803995))

(declare-fun m!803997 () Bool)

(assert (=> b!863293 m!803997))

(declare-fun m!803999 () Bool)

(assert (=> b!863293 m!803999))

(declare-fun m!804001 () Bool)

(assert (=> b!863293 m!804001))

(declare-fun m!804003 () Bool)

(assert (=> b!863293 m!804003))

(declare-fun m!804005 () Bool)

(assert (=> b!863293 m!804005))

(declare-fun m!804007 () Bool)

(assert (=> b!863300 m!804007))

(declare-fun m!804009 () Bool)

(assert (=> b!863300 m!804009))

(declare-fun m!804011 () Bool)

(assert (=> b!863300 m!804011))

(declare-fun m!804013 () Bool)

(assert (=> b!863300 m!804013))

(assert (=> b!863300 m!804009))

(assert (=> b!863300 m!803981))

(assert (=> b!863300 m!804011))

(declare-fun m!804015 () Bool)

(assert (=> b!863289 m!804015))

(declare-fun m!804017 () Bool)

(assert (=> b!863290 m!804017))

(check-sat (not b!863292) (not b!863298) (not b!863293) b_and!24177 (not b!863290) (not mapNonEmpty!26720) (not b!863301) (not b!863300) (not b!863294) (not start!73678) (not b!863287) (not b!863286) tp_is_empty!16747 (not b_lambda!11945) (not b_next!14611))
(check-sat b_and!24177 (not b_next!14611))
