; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73848 () Bool)

(assert start!73848)

(declare-fun b_free!14763 () Bool)

(declare-fun b_next!14763 () Bool)

(assert (=> start!73848 (= b_free!14763 (not b_next!14763))))

(declare-fun tp!51792 () Bool)

(declare-fun b_and!24505 () Bool)

(assert (=> start!73848 (= tp!51792 b_and!24505)))

(declare-fun mapIsEmpty!26948 () Bool)

(declare-fun mapRes!26948 () Bool)

(assert (=> mapIsEmpty!26948 mapRes!26948))

(declare-fun b!867325 () Bool)

(declare-fun e!483128 () Bool)

(assert (=> b!867325 (= e!483128 true)))

(declare-datatypes ((V!27579 0))(
  ( (V!27580 (val!8497 Int)) )
))
(declare-datatypes ((tuple2!11272 0))(
  ( (tuple2!11273 (_1!5647 (_ BitVec 64)) (_2!5647 V!27579)) )
))
(declare-datatypes ((List!17071 0))(
  ( (Nil!17068) (Cons!17067 (h!18198 tuple2!11272) (t!24100 List!17071)) )
))
(declare-datatypes ((ListLongMap!10041 0))(
  ( (ListLongMap!10042 (toList!5036 List!17071)) )
))
(declare-fun lt!393975 () ListLongMap!10041)

(declare-fun lt!393974 () tuple2!11272)

(declare-fun lt!393967 () ListLongMap!10041)

(declare-fun lt!393961 () tuple2!11272)

(declare-fun +!2382 (ListLongMap!10041 tuple2!11272) ListLongMap!10041)

(assert (=> b!867325 (= lt!393975 (+!2382 (+!2382 lt!393967 lt!393974) lt!393961))))

(declare-datatypes ((Unit!29750 0))(
  ( (Unit!29751) )
))
(declare-fun lt!393964 () Unit!29750)

(declare-fun v!557 () V!27579)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49958 0))(
  ( (array!49959 (arr!24010 (Array (_ BitVec 32) (_ BitVec 64))) (size!24450 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49958)

(declare-fun lt!393971 () V!27579)

(declare-fun addCommutativeForDiffKeys!547 (ListLongMap!10041 (_ BitVec 64) V!27579 (_ BitVec 64) V!27579) Unit!29750)

(assert (=> b!867325 (= lt!393964 (addCommutativeForDiffKeys!547 lt!393967 k0!854 v!557 (select (arr!24010 _keys!868) from!1053) lt!393971))))

(declare-fun b!867326 () Bool)

(declare-fun res!589297 () Bool)

(declare-fun e!483127 () Bool)

(assert (=> b!867326 (=> (not res!589297) (not e!483127))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867326 (= res!589297 (and (= (select (arr!24010 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867327 () Bool)

(declare-fun e!483125 () Bool)

(declare-fun tp_is_empty!16899 () Bool)

(assert (=> b!867327 (= e!483125 tp_is_empty!16899)))

(declare-fun b!867329 () Bool)

(declare-fun e!483130 () Bool)

(assert (=> b!867329 (= e!483130 tp_is_empty!16899)))

(declare-fun mapNonEmpty!26948 () Bool)

(declare-fun tp!51793 () Bool)

(assert (=> mapNonEmpty!26948 (= mapRes!26948 (and tp!51793 e!483130))))

(declare-datatypes ((ValueCell!8010 0))(
  ( (ValueCellFull!8010 (v!10922 V!27579)) (EmptyCell!8010) )
))
(declare-fun mapValue!26948 () ValueCell!8010)

(declare-fun mapKey!26948 () (_ BitVec 32))

(declare-fun mapRest!26948 () (Array (_ BitVec 32) ValueCell!8010))

(declare-datatypes ((array!49960 0))(
  ( (array!49961 (arr!24011 (Array (_ BitVec 32) ValueCell!8010)) (size!24451 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49960)

(assert (=> mapNonEmpty!26948 (= (arr!24011 _values!688) (store mapRest!26948 mapKey!26948 mapValue!26948))))

(declare-fun b!867330 () Bool)

(declare-fun e!483126 () Bool)

(assert (=> b!867330 (= e!483127 e!483126)))

(declare-fun res!589295 () Bool)

(assert (=> b!867330 (=> (not res!589295) (not e!483126))))

(assert (=> b!867330 (= res!589295 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27579)

(declare-fun zeroValue!654 () V!27579)

(declare-fun lt!393968 () ListLongMap!10041)

(declare-fun lt!393976 () array!49960)

(declare-fun getCurrentListMapNoExtraKeys!3005 (array!49958 array!49960 (_ BitVec 32) (_ BitVec 32) V!27579 V!27579 (_ BitVec 32) Int) ListLongMap!10041)

(assert (=> b!867330 (= lt!393968 (getCurrentListMapNoExtraKeys!3005 _keys!868 lt!393976 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867330 (= lt!393976 (array!49961 (store (arr!24011 _values!688) i!612 (ValueCellFull!8010 v!557)) (size!24451 _values!688)))))

(declare-fun lt!393965 () ListLongMap!10041)

(assert (=> b!867330 (= lt!393965 (getCurrentListMapNoExtraKeys!3005 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867331 () Bool)

(declare-fun e!483132 () Unit!29750)

(declare-fun Unit!29752 () Unit!29750)

(assert (=> b!867331 (= e!483132 Unit!29752)))

(declare-fun b!867332 () Bool)

(declare-fun e!483133 () Bool)

(assert (=> b!867332 (= e!483126 (not e!483133))))

(declare-fun res!589290 () Bool)

(assert (=> b!867332 (=> res!589290 e!483133)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867332 (= res!589290 (not (validKeyInArray!0 (select (arr!24010 _keys!868) from!1053))))))

(declare-fun lt!393963 () ListLongMap!10041)

(declare-fun lt!393973 () ListLongMap!10041)

(assert (=> b!867332 (= lt!393963 lt!393973)))

(assert (=> b!867332 (= lt!393973 (+!2382 lt!393967 lt!393961))))

(assert (=> b!867332 (= lt!393963 (getCurrentListMapNoExtraKeys!3005 _keys!868 lt!393976 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!867332 (= lt!393961 (tuple2!11273 k0!854 v!557))))

(assert (=> b!867332 (= lt!393967 (getCurrentListMapNoExtraKeys!3005 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393966 () Unit!29750)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!577 (array!49958 array!49960 (_ BitVec 32) (_ BitVec 32) V!27579 V!27579 (_ BitVec 32) (_ BitVec 64) V!27579 (_ BitVec 32) Int) Unit!29750)

(assert (=> b!867332 (= lt!393966 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!577 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867333 () Bool)

(declare-fun res!589289 () Bool)

(assert (=> b!867333 (=> (not res!589289) (not e!483127))))

(assert (=> b!867333 (= res!589289 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24450 _keys!868))))))

(declare-fun b!867334 () Bool)

(declare-fun res!589296 () Bool)

(assert (=> b!867334 (=> (not res!589296) (not e!483127))))

(assert (=> b!867334 (= res!589296 (and (= (size!24451 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24450 _keys!868) (size!24451 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867328 () Bool)

(declare-fun res!589292 () Bool)

(assert (=> b!867328 (=> (not res!589292) (not e!483127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49958 (_ BitVec 32)) Bool)

(assert (=> b!867328 (= res!589292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!589288 () Bool)

(assert (=> start!73848 (=> (not res!589288) (not e!483127))))

(assert (=> start!73848 (= res!589288 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24450 _keys!868))))))

(assert (=> start!73848 e!483127))

(assert (=> start!73848 tp_is_empty!16899))

(assert (=> start!73848 true))

(assert (=> start!73848 tp!51792))

(declare-fun array_inv!18972 (array!49958) Bool)

(assert (=> start!73848 (array_inv!18972 _keys!868)))

(declare-fun e!483131 () Bool)

(declare-fun array_inv!18973 (array!49960) Bool)

(assert (=> start!73848 (and (array_inv!18973 _values!688) e!483131)))

(declare-fun b!867335 () Bool)

(assert (=> b!867335 (= e!483131 (and e!483125 mapRes!26948))))

(declare-fun condMapEmpty!26948 () Bool)

(declare-fun mapDefault!26948 () ValueCell!8010)

(assert (=> b!867335 (= condMapEmpty!26948 (= (arr!24011 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8010)) mapDefault!26948)))))

(declare-fun b!867336 () Bool)

(declare-fun res!589294 () Bool)

(assert (=> b!867336 (=> (not res!589294) (not e!483127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867336 (= res!589294 (validMask!0 mask!1196))))

(declare-fun b!867337 () Bool)

(assert (=> b!867337 (= e!483133 e!483128)))

(declare-fun res!589291 () Bool)

(assert (=> b!867337 (=> res!589291 e!483128)))

(assert (=> b!867337 (= res!589291 (= k0!854 (select (arr!24010 _keys!868) from!1053)))))

(assert (=> b!867337 (not (= (select (arr!24010 _keys!868) from!1053) k0!854))))

(declare-fun lt!393970 () Unit!29750)

(assert (=> b!867337 (= lt!393970 e!483132)))

(declare-fun c!92365 () Bool)

(assert (=> b!867337 (= c!92365 (= (select (arr!24010 _keys!868) from!1053) k0!854))))

(assert (=> b!867337 (= lt!393968 lt!393975)))

(assert (=> b!867337 (= lt!393975 (+!2382 lt!393973 lt!393974))))

(assert (=> b!867337 (= lt!393974 (tuple2!11273 (select (arr!24010 _keys!868) from!1053) lt!393971))))

(declare-fun get!12698 (ValueCell!8010 V!27579) V!27579)

(declare-fun dynLambda!1200 (Int (_ BitVec 64)) V!27579)

(assert (=> b!867337 (= lt!393971 (get!12698 (select (arr!24011 _values!688) from!1053) (dynLambda!1200 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!867338 () Bool)

(declare-fun Unit!29753 () Unit!29750)

(assert (=> b!867338 (= e!483132 Unit!29753)))

(declare-fun lt!393962 () Unit!29750)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49958 (_ BitVec 32) (_ BitVec 32)) Unit!29750)

(assert (=> b!867338 (= lt!393962 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17072 0))(
  ( (Nil!17069) (Cons!17068 (h!18199 (_ BitVec 64)) (t!24101 List!17072)) )
))
(declare-fun arrayNoDuplicates!0 (array!49958 (_ BitVec 32) List!17072) Bool)

(assert (=> b!867338 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17069)))

(declare-fun lt!393969 () Unit!29750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49958 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29750)

(assert (=> b!867338 (= lt!393969 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867338 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393972 () Unit!29750)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49958 (_ BitVec 64) (_ BitVec 32) List!17072) Unit!29750)

(assert (=> b!867338 (= lt!393972 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17069))))

(assert (=> b!867338 false))

(declare-fun b!867339 () Bool)

(declare-fun res!589293 () Bool)

(assert (=> b!867339 (=> (not res!589293) (not e!483127))))

(assert (=> b!867339 (= res!589293 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17069))))

(declare-fun b!867340 () Bool)

(declare-fun res!589298 () Bool)

(assert (=> b!867340 (=> (not res!589298) (not e!483127))))

(assert (=> b!867340 (= res!589298 (validKeyInArray!0 k0!854))))

(assert (= (and start!73848 res!589288) b!867336))

(assert (= (and b!867336 res!589294) b!867334))

(assert (= (and b!867334 res!589296) b!867328))

(assert (= (and b!867328 res!589292) b!867339))

(assert (= (and b!867339 res!589293) b!867333))

(assert (= (and b!867333 res!589289) b!867340))

(assert (= (and b!867340 res!589298) b!867326))

(assert (= (and b!867326 res!589297) b!867330))

(assert (= (and b!867330 res!589295) b!867332))

(assert (= (and b!867332 (not res!589290)) b!867337))

(assert (= (and b!867337 c!92365) b!867338))

(assert (= (and b!867337 (not c!92365)) b!867331))

(assert (= (and b!867337 (not res!589291)) b!867325))

(assert (= (and b!867335 condMapEmpty!26948) mapIsEmpty!26948))

(assert (= (and b!867335 (not condMapEmpty!26948)) mapNonEmpty!26948))

(get-info :version)

(assert (= (and mapNonEmpty!26948 ((_ is ValueCellFull!8010) mapValue!26948)) b!867329))

(assert (= (and b!867335 ((_ is ValueCellFull!8010) mapDefault!26948)) b!867327))

(assert (= start!73848 b!867335))

(declare-fun b_lambda!12115 () Bool)

(assert (=> (not b_lambda!12115) (not b!867337)))

(declare-fun t!24099 () Bool)

(declare-fun tb!4885 () Bool)

(assert (=> (and start!73848 (= defaultEntry!696 defaultEntry!696) t!24099) tb!4885))

(declare-fun result!9381 () Bool)

(assert (=> tb!4885 (= result!9381 tp_is_empty!16899)))

(assert (=> b!867337 t!24099))

(declare-fun b_and!24507 () Bool)

(assert (= b_and!24505 (and (=> t!24099 result!9381) b_and!24507)))

(declare-fun m!809127 () Bool)

(assert (=> b!867332 m!809127))

(declare-fun m!809129 () Bool)

(assert (=> b!867332 m!809129))

(declare-fun m!809131 () Bool)

(assert (=> b!867332 m!809131))

(declare-fun m!809133 () Bool)

(assert (=> b!867332 m!809133))

(declare-fun m!809135 () Bool)

(assert (=> b!867332 m!809135))

(assert (=> b!867332 m!809129))

(declare-fun m!809137 () Bool)

(assert (=> b!867332 m!809137))

(declare-fun m!809139 () Bool)

(assert (=> b!867338 m!809139))

(declare-fun m!809141 () Bool)

(assert (=> b!867338 m!809141))

(declare-fun m!809143 () Bool)

(assert (=> b!867338 m!809143))

(declare-fun m!809145 () Bool)

(assert (=> b!867338 m!809145))

(declare-fun m!809147 () Bool)

(assert (=> b!867338 m!809147))

(declare-fun m!809149 () Bool)

(assert (=> b!867340 m!809149))

(declare-fun m!809151 () Bool)

(assert (=> b!867337 m!809151))

(declare-fun m!809153 () Bool)

(assert (=> b!867337 m!809153))

(declare-fun m!809155 () Bool)

(assert (=> b!867337 m!809155))

(assert (=> b!867337 m!809151))

(declare-fun m!809157 () Bool)

(assert (=> b!867337 m!809157))

(assert (=> b!867337 m!809129))

(assert (=> b!867337 m!809153))

(declare-fun m!809159 () Bool)

(assert (=> start!73848 m!809159))

(declare-fun m!809161 () Bool)

(assert (=> start!73848 m!809161))

(declare-fun m!809163 () Bool)

(assert (=> b!867325 m!809163))

(assert (=> b!867325 m!809163))

(declare-fun m!809165 () Bool)

(assert (=> b!867325 m!809165))

(assert (=> b!867325 m!809129))

(assert (=> b!867325 m!809129))

(declare-fun m!809167 () Bool)

(assert (=> b!867325 m!809167))

(declare-fun m!809169 () Bool)

(assert (=> b!867330 m!809169))

(declare-fun m!809171 () Bool)

(assert (=> b!867330 m!809171))

(declare-fun m!809173 () Bool)

(assert (=> b!867330 m!809173))

(declare-fun m!809175 () Bool)

(assert (=> b!867326 m!809175))

(declare-fun m!809177 () Bool)

(assert (=> mapNonEmpty!26948 m!809177))

(declare-fun m!809179 () Bool)

(assert (=> b!867328 m!809179))

(declare-fun m!809181 () Bool)

(assert (=> b!867339 m!809181))

(declare-fun m!809183 () Bool)

(assert (=> b!867336 m!809183))

(check-sat (not b!867336) (not b!867330) b_and!24507 (not mapNonEmpty!26948) (not b_next!14763) (not start!73848) (not b!867332) (not b!867337) (not b!867328) tp_is_empty!16899 (not b_lambda!12115) (not b!867340) (not b!867325) (not b!867339) (not b!867338))
(check-sat b_and!24507 (not b_next!14763))
