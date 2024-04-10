; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73530 () Bool)

(assert start!73530)

(declare-fun b_free!14445 () Bool)

(declare-fun b_next!14445 () Bool)

(assert (=> start!73530 (= b_free!14445 (not b_next!14445))))

(declare-fun tp!50839 () Bool)

(declare-fun b_and!23869 () Bool)

(assert (=> start!73530 (= tp!50839 b_and!23869)))

(declare-fun b!859389 () Bool)

(declare-fun res!583909 () Bool)

(declare-fun e!478923 () Bool)

(assert (=> b!859389 (=> (not res!583909) (not e!478923))))

(declare-datatypes ((array!49338 0))(
  ( (array!49339 (arr!23700 (Array (_ BitVec 32) (_ BitVec 64))) (size!24140 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49338)

(declare-datatypes ((List!16817 0))(
  ( (Nil!16814) (Cons!16813 (h!17944 (_ BitVec 64)) (t!23528 List!16817)) )
))
(declare-fun arrayNoDuplicates!0 (array!49338 (_ BitVec 32) List!16817) Bool)

(assert (=> b!859389 (= res!583909 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16814))))

(declare-fun b!859390 () Bool)

(declare-fun e!478930 () Bool)

(declare-fun e!478926 () Bool)

(assert (=> b!859390 (= e!478930 e!478926)))

(declare-fun res!583904 () Bool)

(assert (=> b!859390 (=> res!583904 e!478926)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859390 (= res!583904 (not (= (select (arr!23700 _keys!868) from!1053) k0!854)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27155 0))(
  ( (V!27156 (val!8338 Int)) )
))
(declare-datatypes ((tuple2!11008 0))(
  ( (tuple2!11009 (_1!5515 (_ BitVec 64)) (_2!5515 V!27155)) )
))
(declare-datatypes ((List!16818 0))(
  ( (Nil!16815) (Cons!16814 (h!17945 tuple2!11008) (t!23529 List!16818)) )
))
(declare-datatypes ((ListLongMap!9777 0))(
  ( (ListLongMap!9778 (toList!4904 List!16818)) )
))
(declare-fun lt!387235 () ListLongMap!9777)

(declare-fun lt!387236 () ListLongMap!9777)

(declare-datatypes ((ValueCell!7851 0))(
  ( (ValueCellFull!7851 (v!10763 V!27155)) (EmptyCell!7851) )
))
(declare-datatypes ((array!49340 0))(
  ( (array!49341 (arr!23701 (Array (_ BitVec 32) ValueCell!7851)) (size!24141 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49340)

(declare-fun +!2257 (ListLongMap!9777 tuple2!11008) ListLongMap!9777)

(declare-fun get!12488 (ValueCell!7851 V!27155) V!27155)

(declare-fun dynLambda!1096 (Int (_ BitVec 64)) V!27155)

(assert (=> b!859390 (= lt!387236 (+!2257 lt!387235 (tuple2!11009 (select (arr!23700 _keys!868) from!1053) (get!12488 (select (arr!23701 _values!688) from!1053) (dynLambda!1096 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859391 () Bool)

(declare-fun e!478924 () Bool)

(assert (=> b!859391 (= e!478926 e!478924)))

(declare-fun res!583908 () Bool)

(assert (=> b!859391 (=> res!583908 e!478924)))

(assert (=> b!859391 (= res!583908 (or (bvsge (size!24140 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24140 _keys!868)) (bvsge from!1053 (size!24140 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859391 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29299 0))(
  ( (Unit!29300) )
))
(declare-fun lt!387244 () Unit!29299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49338 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29299)

(assert (=> b!859391 (= lt!387244 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!859391 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16814)))

(declare-fun lt!387239 () Unit!29299)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49338 (_ BitVec 32) (_ BitVec 32)) Unit!29299)

(assert (=> b!859391 (= lt!387239 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapNonEmpty!26471 () Bool)

(declare-fun mapRes!26471 () Bool)

(declare-fun tp!50838 () Bool)

(declare-fun e!478928 () Bool)

(assert (=> mapNonEmpty!26471 (= mapRes!26471 (and tp!50838 e!478928))))

(declare-fun mapKey!26471 () (_ BitVec 32))

(declare-fun mapValue!26471 () ValueCell!7851)

(declare-fun mapRest!26471 () (Array (_ BitVec 32) ValueCell!7851))

(assert (=> mapNonEmpty!26471 (= (arr!23701 _values!688) (store mapRest!26471 mapKey!26471 mapValue!26471))))

(declare-fun b!859392 () Bool)

(declare-fun e!478922 () Bool)

(declare-fun e!478925 () Bool)

(assert (=> b!859392 (= e!478922 (and e!478925 mapRes!26471))))

(declare-fun condMapEmpty!26471 () Bool)

(declare-fun mapDefault!26471 () ValueCell!7851)

(assert (=> b!859392 (= condMapEmpty!26471 (= (arr!23701 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7851)) mapDefault!26471)))))

(declare-fun b!859393 () Bool)

(declare-fun tp_is_empty!16581 () Bool)

(assert (=> b!859393 (= e!478925 tp_is_empty!16581)))

(declare-fun b!859394 () Bool)

(declare-fun res!583915 () Bool)

(assert (=> b!859394 (=> (not res!583915) (not e!478923))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49338 (_ BitVec 32)) Bool)

(assert (=> b!859394 (= res!583915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859395 () Bool)

(declare-fun res!583916 () Bool)

(assert (=> b!859395 (=> (not res!583916) (not e!478923))))

(assert (=> b!859395 (= res!583916 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24140 _keys!868))))))

(declare-fun b!859396 () Bool)

(assert (=> b!859396 (= e!478924 true)))

(declare-fun lt!387241 () Bool)

(declare-fun contains!4217 (List!16817 (_ BitVec 64)) Bool)

(assert (=> b!859396 (= lt!387241 (contains!4217 Nil!16814 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859397 () Bool)

(declare-fun res!583914 () Bool)

(assert (=> b!859397 (=> (not res!583914) (not e!478923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859397 (= res!583914 (validMask!0 mask!1196))))

(declare-fun b!859398 () Bool)

(declare-fun res!583910 () Bool)

(assert (=> b!859398 (=> res!583910 e!478924)))

(declare-fun noDuplicate!1299 (List!16817) Bool)

(assert (=> b!859398 (= res!583910 (not (noDuplicate!1299 Nil!16814)))))

(declare-fun b!859399 () Bool)

(assert (=> b!859399 (= e!478928 tp_is_empty!16581)))

(declare-fun b!859400 () Bool)

(declare-fun res!583912 () Bool)

(assert (=> b!859400 (=> (not res!583912) (not e!478923))))

(assert (=> b!859400 (= res!583912 (and (= (select (arr!23700 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!583905 () Bool)

(assert (=> start!73530 (=> (not res!583905) (not e!478923))))

(assert (=> start!73530 (= res!583905 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24140 _keys!868))))))

(assert (=> start!73530 e!478923))

(assert (=> start!73530 tp_is_empty!16581))

(assert (=> start!73530 true))

(assert (=> start!73530 tp!50839))

(declare-fun array_inv!18762 (array!49338) Bool)

(assert (=> start!73530 (array_inv!18762 _keys!868)))

(declare-fun array_inv!18763 (array!49340) Bool)

(assert (=> start!73530 (and (array_inv!18763 _values!688) e!478922)))

(declare-fun b!859401 () Bool)

(declare-fun res!583913 () Bool)

(assert (=> b!859401 (=> res!583913 e!478924)))

(assert (=> b!859401 (= res!583913 (contains!4217 Nil!16814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859402 () Bool)

(declare-fun res!583906 () Bool)

(assert (=> b!859402 (=> (not res!583906) (not e!478923))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!859402 (= res!583906 (and (= (size!24141 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24140 _keys!868) (size!24141 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859403 () Bool)

(declare-fun e!478929 () Bool)

(assert (=> b!859403 (= e!478929 (not e!478930))))

(declare-fun res!583903 () Bool)

(assert (=> b!859403 (=> res!583903 e!478930)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859403 (= res!583903 (not (validKeyInArray!0 (select (arr!23700 _keys!868) from!1053))))))

(declare-fun lt!387238 () ListLongMap!9777)

(assert (=> b!859403 (= lt!387238 lt!387235)))

(declare-fun v!557 () V!27155)

(declare-fun lt!387242 () ListLongMap!9777)

(assert (=> b!859403 (= lt!387235 (+!2257 lt!387242 (tuple2!11009 k0!854 v!557)))))

(declare-fun minValue!654 () V!27155)

(declare-fun zeroValue!654 () V!27155)

(declare-fun lt!387243 () array!49340)

(declare-fun getCurrentListMapNoExtraKeys!2883 (array!49338 array!49340 (_ BitVec 32) (_ BitVec 32) V!27155 V!27155 (_ BitVec 32) Int) ListLongMap!9777)

(assert (=> b!859403 (= lt!387238 (getCurrentListMapNoExtraKeys!2883 _keys!868 lt!387243 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859403 (= lt!387242 (getCurrentListMapNoExtraKeys!2883 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387237 () Unit!29299)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!473 (array!49338 array!49340 (_ BitVec 32) (_ BitVec 32) V!27155 V!27155 (_ BitVec 32) (_ BitVec 64) V!27155 (_ BitVec 32) Int) Unit!29299)

(assert (=> b!859403 (= lt!387237 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!473 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859404 () Bool)

(declare-fun res!583907 () Bool)

(assert (=> b!859404 (=> (not res!583907) (not e!478923))))

(assert (=> b!859404 (= res!583907 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26471 () Bool)

(assert (=> mapIsEmpty!26471 mapRes!26471))

(declare-fun b!859405 () Bool)

(assert (=> b!859405 (= e!478923 e!478929)))

(declare-fun res!583911 () Bool)

(assert (=> b!859405 (=> (not res!583911) (not e!478929))))

(assert (=> b!859405 (= res!583911 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!859405 (= lt!387236 (getCurrentListMapNoExtraKeys!2883 _keys!868 lt!387243 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859405 (= lt!387243 (array!49341 (store (arr!23701 _values!688) i!612 (ValueCellFull!7851 v!557)) (size!24141 _values!688)))))

(declare-fun lt!387240 () ListLongMap!9777)

(assert (=> b!859405 (= lt!387240 (getCurrentListMapNoExtraKeys!2883 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73530 res!583905) b!859397))

(assert (= (and b!859397 res!583914) b!859402))

(assert (= (and b!859402 res!583906) b!859394))

(assert (= (and b!859394 res!583915) b!859389))

(assert (= (and b!859389 res!583909) b!859395))

(assert (= (and b!859395 res!583916) b!859404))

(assert (= (and b!859404 res!583907) b!859400))

(assert (= (and b!859400 res!583912) b!859405))

(assert (= (and b!859405 res!583911) b!859403))

(assert (= (and b!859403 (not res!583903)) b!859390))

(assert (= (and b!859390 (not res!583904)) b!859391))

(assert (= (and b!859391 (not res!583908)) b!859398))

(assert (= (and b!859398 (not res!583910)) b!859401))

(assert (= (and b!859401 (not res!583913)) b!859396))

(assert (= (and b!859392 condMapEmpty!26471) mapIsEmpty!26471))

(assert (= (and b!859392 (not condMapEmpty!26471)) mapNonEmpty!26471))

(get-info :version)

(assert (= (and mapNonEmpty!26471 ((_ is ValueCellFull!7851) mapValue!26471)) b!859399))

(assert (= (and b!859392 ((_ is ValueCellFull!7851) mapDefault!26471)) b!859393))

(assert (= start!73530 b!859392))

(declare-fun b_lambda!11797 () Bool)

(assert (=> (not b_lambda!11797) (not b!859390)))

(declare-fun t!23527 () Bool)

(declare-fun tb!4567 () Bool)

(assert (=> (and start!73530 (= defaultEntry!696 defaultEntry!696) t!23527) tb!4567))

(declare-fun result!8745 () Bool)

(assert (=> tb!4567 (= result!8745 tp_is_empty!16581)))

(assert (=> b!859390 t!23527))

(declare-fun b_and!23871 () Bool)

(assert (= b_and!23869 (and (=> t!23527 result!8745) b_and!23871)))

(declare-fun m!800137 () Bool)

(assert (=> b!859404 m!800137))

(declare-fun m!800139 () Bool)

(assert (=> b!859398 m!800139))

(declare-fun m!800141 () Bool)

(assert (=> b!859403 m!800141))

(declare-fun m!800143 () Bool)

(assert (=> b!859403 m!800143))

(declare-fun m!800145 () Bool)

(assert (=> b!859403 m!800145))

(declare-fun m!800147 () Bool)

(assert (=> b!859403 m!800147))

(assert (=> b!859403 m!800145))

(declare-fun m!800149 () Bool)

(assert (=> b!859403 m!800149))

(declare-fun m!800151 () Bool)

(assert (=> b!859403 m!800151))

(declare-fun m!800153 () Bool)

(assert (=> b!859405 m!800153))

(declare-fun m!800155 () Bool)

(assert (=> b!859405 m!800155))

(declare-fun m!800157 () Bool)

(assert (=> b!859405 m!800157))

(declare-fun m!800159 () Bool)

(assert (=> mapNonEmpty!26471 m!800159))

(declare-fun m!800161 () Bool)

(assert (=> b!859396 m!800161))

(declare-fun m!800163 () Bool)

(assert (=> b!859390 m!800163))

(declare-fun m!800165 () Bool)

(assert (=> b!859390 m!800165))

(declare-fun m!800167 () Bool)

(assert (=> b!859390 m!800167))

(declare-fun m!800169 () Bool)

(assert (=> b!859390 m!800169))

(assert (=> b!859390 m!800165))

(assert (=> b!859390 m!800145))

(assert (=> b!859390 m!800167))

(declare-fun m!800171 () Bool)

(assert (=> b!859394 m!800171))

(declare-fun m!800173 () Bool)

(assert (=> b!859400 m!800173))

(declare-fun m!800175 () Bool)

(assert (=> b!859397 m!800175))

(declare-fun m!800177 () Bool)

(assert (=> b!859389 m!800177))

(declare-fun m!800179 () Bool)

(assert (=> b!859401 m!800179))

(declare-fun m!800181 () Bool)

(assert (=> b!859391 m!800181))

(declare-fun m!800183 () Bool)

(assert (=> b!859391 m!800183))

(declare-fun m!800185 () Bool)

(assert (=> b!859391 m!800185))

(declare-fun m!800187 () Bool)

(assert (=> b!859391 m!800187))

(declare-fun m!800189 () Bool)

(assert (=> start!73530 m!800189))

(declare-fun m!800191 () Bool)

(assert (=> start!73530 m!800191))

(check-sat (not b!859394) b_and!23871 (not b!859390) (not b!859404) (not b_next!14445) (not start!73530) (not b!859398) (not b_lambda!11797) (not mapNonEmpty!26471) (not b!859391) (not b!859401) tp_is_empty!16581 (not b!859405) (not b!859403) (not b!859397) (not b!859396) (not b!859389))
(check-sat b_and!23871 (not b_next!14445))
