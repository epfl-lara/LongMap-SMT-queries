; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73720 () Bool)

(assert start!73720)

(declare-fun b_free!14653 () Bool)

(declare-fun b_next!14653 () Bool)

(assert (=> start!73720 (= b_free!14653 (not b_next!14653))))

(declare-fun tp!51463 () Bool)

(declare-fun b_and!24259 () Bool)

(assert (=> start!73720 (= tp!51463 b_and!24259)))

(declare-fun b!864336 () Bool)

(declare-fun res!587371 () Bool)

(declare-fun e!481495 () Bool)

(assert (=> b!864336 (=> (not res!587371) (not e!481495))))

(declare-datatypes ((array!49731 0))(
  ( (array!49732 (arr!23897 (Array (_ BitVec 32) (_ BitVec 64))) (size!24339 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49731)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49731 (_ BitVec 32)) Bool)

(assert (=> b!864336 (= res!587371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864337 () Bool)

(declare-fun e!481493 () Bool)

(declare-fun e!481498 () Bool)

(assert (=> b!864337 (= e!481493 (not e!481498))))

(declare-fun res!587373 () Bool)

(assert (=> b!864337 (=> res!587373 e!481498)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864337 (= res!587373 (not (validKeyInArray!0 (select (arr!23897 _keys!868) from!1053))))))

(declare-datatypes ((V!27433 0))(
  ( (V!27434 (val!8442 Int)) )
))
(declare-datatypes ((tuple2!11194 0))(
  ( (tuple2!11195 (_1!5608 (_ BitVec 64)) (_2!5608 V!27433)) )
))
(declare-datatypes ((List!16988 0))(
  ( (Nil!16985) (Cons!16984 (h!18115 tuple2!11194) (t!23898 List!16988)) )
))
(declare-datatypes ((ListLongMap!9953 0))(
  ( (ListLongMap!9954 (toList!4992 List!16988)) )
))
(declare-fun lt!391090 () ListLongMap!9953)

(declare-fun lt!391087 () ListLongMap!9953)

(assert (=> b!864337 (= lt!391090 lt!391087)))

(declare-fun lt!391088 () ListLongMap!9953)

(declare-fun lt!391085 () tuple2!11194)

(declare-fun +!2361 (ListLongMap!9953 tuple2!11194) ListLongMap!9953)

(assert (=> b!864337 (= lt!391087 (+!2361 lt!391088 lt!391085))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7955 0))(
  ( (ValueCellFull!7955 (v!10861 V!27433)) (EmptyCell!7955) )
))
(declare-datatypes ((array!49733 0))(
  ( (array!49734 (arr!23898 (Array (_ BitVec 32) ValueCell!7955)) (size!24340 (_ BitVec 32))) )
))
(declare-fun lt!391093 () array!49733)

(declare-fun minValue!654 () V!27433)

(declare-fun zeroValue!654 () V!27433)

(declare-fun getCurrentListMapNoExtraKeys!2991 (array!49731 array!49733 (_ BitVec 32) (_ BitVec 32) V!27433 V!27433 (_ BitVec 32) Int) ListLongMap!9953)

(assert (=> b!864337 (= lt!391090 (getCurrentListMapNoExtraKeys!2991 _keys!868 lt!391093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun v!557 () V!27433)

(assert (=> b!864337 (= lt!391085 (tuple2!11195 k0!854 v!557))))

(declare-fun _values!688 () array!49733)

(assert (=> b!864337 (= lt!391088 (getCurrentListMapNoExtraKeys!2991 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29510 0))(
  ( (Unit!29511) )
))
(declare-fun lt!391092 () Unit!29510)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!540 (array!49731 array!49733 (_ BitVec 32) (_ BitVec 32) V!27433 V!27433 (_ BitVec 32) (_ BitVec 64) V!27433 (_ BitVec 32) Int) Unit!29510)

(assert (=> b!864337 (= lt!391092 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!540 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864338 () Bool)

(declare-fun e!481494 () Unit!29510)

(declare-fun Unit!29512 () Unit!29510)

(assert (=> b!864338 (= e!481494 Unit!29512)))

(declare-fun lt!391089 () Unit!29510)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49731 (_ BitVec 32) (_ BitVec 32)) Unit!29510)

(assert (=> b!864338 (= lt!391089 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16989 0))(
  ( (Nil!16986) (Cons!16985 (h!18116 (_ BitVec 64)) (t!23899 List!16989)) )
))
(declare-fun arrayNoDuplicates!0 (array!49731 (_ BitVec 32) List!16989) Bool)

(assert (=> b!864338 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16986)))

(declare-fun lt!391096 () Unit!29510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49731 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29510)

(assert (=> b!864338 (= lt!391096 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864338 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!391099 () Unit!29510)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49731 (_ BitVec 64) (_ BitVec 32) List!16989) Unit!29510)

(assert (=> b!864338 (= lt!391099 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16986))))

(assert (=> b!864338 false))

(declare-fun b!864339 () Bool)

(declare-fun res!587372 () Bool)

(assert (=> b!864339 (=> (not res!587372) (not e!481495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864339 (= res!587372 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26783 () Bool)

(declare-fun mapRes!26783 () Bool)

(declare-fun tp!51464 () Bool)

(declare-fun e!481497 () Bool)

(assert (=> mapNonEmpty!26783 (= mapRes!26783 (and tp!51464 e!481497))))

(declare-fun mapRest!26783 () (Array (_ BitVec 32) ValueCell!7955))

(declare-fun mapValue!26783 () ValueCell!7955)

(declare-fun mapKey!26783 () (_ BitVec 32))

(assert (=> mapNonEmpty!26783 (= (arr!23898 _values!688) (store mapRest!26783 mapKey!26783 mapValue!26783))))

(declare-fun b!864340 () Bool)

(declare-fun tp_is_empty!16789 () Bool)

(assert (=> b!864340 (= e!481497 tp_is_empty!16789)))

(declare-fun b!864341 () Bool)

(declare-fun res!587363 () Bool)

(assert (=> b!864341 (=> (not res!587363) (not e!481495))))

(assert (=> b!864341 (= res!587363 (and (= (size!24340 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24339 _keys!868) (size!24340 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864342 () Bool)

(declare-fun res!587369 () Bool)

(assert (=> b!864342 (=> (not res!587369) (not e!481495))))

(assert (=> b!864342 (= res!587369 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16986))))

(declare-fun b!864343 () Bool)

(declare-fun e!481500 () Bool)

(assert (=> b!864343 (= e!481498 e!481500)))

(declare-fun res!587367 () Bool)

(assert (=> b!864343 (=> res!587367 e!481500)))

(assert (=> b!864343 (= res!587367 (= k0!854 (select (arr!23897 _keys!868) from!1053)))))

(assert (=> b!864343 (not (= (select (arr!23897 _keys!868) from!1053) k0!854))))

(declare-fun lt!391086 () Unit!29510)

(assert (=> b!864343 (= lt!391086 e!481494)))

(declare-fun c!92135 () Bool)

(assert (=> b!864343 (= c!92135 (= (select (arr!23897 _keys!868) from!1053) k0!854))))

(declare-fun lt!391100 () ListLongMap!9953)

(declare-fun lt!391094 () ListLongMap!9953)

(assert (=> b!864343 (= lt!391100 lt!391094)))

(declare-fun lt!391095 () tuple2!11194)

(assert (=> b!864343 (= lt!391094 (+!2361 lt!391087 lt!391095))))

(declare-fun lt!391098 () V!27433)

(assert (=> b!864343 (= lt!391095 (tuple2!11195 (select (arr!23897 _keys!868) from!1053) lt!391098))))

(declare-fun get!12627 (ValueCell!7955 V!27433) V!27433)

(declare-fun dynLambda!1162 (Int (_ BitVec 64)) V!27433)

(assert (=> b!864343 (= lt!391098 (get!12627 (select (arr!23898 _values!688) from!1053) (dynLambda!1162 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864344 () Bool)

(declare-fun e!481492 () Bool)

(declare-fun e!481499 () Bool)

(assert (=> b!864344 (= e!481492 (and e!481499 mapRes!26783))))

(declare-fun condMapEmpty!26783 () Bool)

(declare-fun mapDefault!26783 () ValueCell!7955)

(assert (=> b!864344 (= condMapEmpty!26783 (= (arr!23898 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7955)) mapDefault!26783)))))

(declare-fun b!864345 () Bool)

(assert (=> b!864345 (= e!481500 true)))

(assert (=> b!864345 (= lt!391094 (+!2361 (+!2361 lt!391088 lt!391095) lt!391085))))

(declare-fun lt!391091 () Unit!29510)

(declare-fun addCommutativeForDiffKeys!504 (ListLongMap!9953 (_ BitVec 64) V!27433 (_ BitVec 64) V!27433) Unit!29510)

(assert (=> b!864345 (= lt!391091 (addCommutativeForDiffKeys!504 lt!391088 k0!854 v!557 (select (arr!23897 _keys!868) from!1053) lt!391098))))

(declare-fun b!864346 () Bool)

(declare-fun Unit!29513 () Unit!29510)

(assert (=> b!864346 (= e!481494 Unit!29513)))

(declare-fun b!864347 () Bool)

(declare-fun res!587365 () Bool)

(assert (=> b!864347 (=> (not res!587365) (not e!481495))))

(assert (=> b!864347 (= res!587365 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24339 _keys!868))))))

(declare-fun res!587366 () Bool)

(assert (=> start!73720 (=> (not res!587366) (not e!481495))))

(assert (=> start!73720 (= res!587366 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24339 _keys!868))))))

(assert (=> start!73720 e!481495))

(assert (=> start!73720 tp_is_empty!16789))

(assert (=> start!73720 true))

(assert (=> start!73720 tp!51463))

(declare-fun array_inv!18974 (array!49731) Bool)

(assert (=> start!73720 (array_inv!18974 _keys!868)))

(declare-fun array_inv!18975 (array!49733) Bool)

(assert (=> start!73720 (and (array_inv!18975 _values!688) e!481492)))

(declare-fun mapIsEmpty!26783 () Bool)

(assert (=> mapIsEmpty!26783 mapRes!26783))

(declare-fun b!864348 () Bool)

(assert (=> b!864348 (= e!481499 tp_is_empty!16789)))

(declare-fun b!864349 () Bool)

(assert (=> b!864349 (= e!481495 e!481493)))

(declare-fun res!587368 () Bool)

(assert (=> b!864349 (=> (not res!587368) (not e!481493))))

(assert (=> b!864349 (= res!587368 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!864349 (= lt!391100 (getCurrentListMapNoExtraKeys!2991 _keys!868 lt!391093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!864349 (= lt!391093 (array!49734 (store (arr!23898 _values!688) i!612 (ValueCellFull!7955 v!557)) (size!24340 _values!688)))))

(declare-fun lt!391097 () ListLongMap!9953)

(assert (=> b!864349 (= lt!391097 (getCurrentListMapNoExtraKeys!2991 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864350 () Bool)

(declare-fun res!587364 () Bool)

(assert (=> b!864350 (=> (not res!587364) (not e!481495))))

(assert (=> b!864350 (= res!587364 (validKeyInArray!0 k0!854))))

(declare-fun b!864351 () Bool)

(declare-fun res!587370 () Bool)

(assert (=> b!864351 (=> (not res!587370) (not e!481495))))

(assert (=> b!864351 (= res!587370 (and (= (select (arr!23897 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73720 res!587366) b!864339))

(assert (= (and b!864339 res!587372) b!864341))

(assert (= (and b!864341 res!587363) b!864336))

(assert (= (and b!864336 res!587371) b!864342))

(assert (= (and b!864342 res!587369) b!864347))

(assert (= (and b!864347 res!587365) b!864350))

(assert (= (and b!864350 res!587364) b!864351))

(assert (= (and b!864351 res!587370) b!864349))

(assert (= (and b!864349 res!587368) b!864337))

(assert (= (and b!864337 (not res!587373)) b!864343))

(assert (= (and b!864343 c!92135) b!864338))

(assert (= (and b!864343 (not c!92135)) b!864346))

(assert (= (and b!864343 (not res!587367)) b!864345))

(assert (= (and b!864344 condMapEmpty!26783) mapIsEmpty!26783))

(assert (= (and b!864344 (not condMapEmpty!26783)) mapNonEmpty!26783))

(get-info :version)

(assert (= (and mapNonEmpty!26783 ((_ is ValueCellFull!7955) mapValue!26783)) b!864340))

(assert (= (and b!864344 ((_ is ValueCellFull!7955) mapDefault!26783)) b!864348))

(assert (= start!73720 b!864344))

(declare-fun b_lambda!11987 () Bool)

(assert (=> (not b_lambda!11987) (not b!864343)))

(declare-fun t!23897 () Bool)

(declare-fun tb!4767 () Bool)

(assert (=> (and start!73720 (= defaultEntry!696 defaultEntry!696) t!23897) tb!4767))

(declare-fun result!9153 () Bool)

(assert (=> tb!4767 (= result!9153 tp_is_empty!16789)))

(assert (=> b!864343 t!23897))

(declare-fun b_and!24261 () Bool)

(assert (= b_and!24259 (and (=> t!23897 result!9153) b_and!24261)))

(declare-fun m!805179 () Bool)

(assert (=> mapNonEmpty!26783 m!805179))

(declare-fun m!805181 () Bool)

(assert (=> b!864338 m!805181))

(declare-fun m!805183 () Bool)

(assert (=> b!864338 m!805183))

(declare-fun m!805185 () Bool)

(assert (=> b!864338 m!805185))

(declare-fun m!805187 () Bool)

(assert (=> b!864338 m!805187))

(declare-fun m!805189 () Bool)

(assert (=> b!864338 m!805189))

(declare-fun m!805191 () Bool)

(assert (=> b!864350 m!805191))

(declare-fun m!805193 () Bool)

(assert (=> b!864336 m!805193))

(declare-fun m!805195 () Bool)

(assert (=> b!864337 m!805195))

(declare-fun m!805197 () Bool)

(assert (=> b!864337 m!805197))

(declare-fun m!805199 () Bool)

(assert (=> b!864337 m!805199))

(declare-fun m!805201 () Bool)

(assert (=> b!864337 m!805201))

(assert (=> b!864337 m!805199))

(declare-fun m!805203 () Bool)

(assert (=> b!864337 m!805203))

(declare-fun m!805205 () Bool)

(assert (=> b!864337 m!805205))

(declare-fun m!805207 () Bool)

(assert (=> b!864342 m!805207))

(declare-fun m!805209 () Bool)

(assert (=> b!864349 m!805209))

(declare-fun m!805211 () Bool)

(assert (=> b!864349 m!805211))

(declare-fun m!805213 () Bool)

(assert (=> b!864349 m!805213))

(declare-fun m!805215 () Bool)

(assert (=> b!864351 m!805215))

(declare-fun m!805217 () Bool)

(assert (=> start!73720 m!805217))

(declare-fun m!805219 () Bool)

(assert (=> start!73720 m!805219))

(declare-fun m!805221 () Bool)

(assert (=> b!864343 m!805221))

(declare-fun m!805223 () Bool)

(assert (=> b!864343 m!805223))

(declare-fun m!805225 () Bool)

(assert (=> b!864343 m!805225))

(assert (=> b!864343 m!805221))

(declare-fun m!805227 () Bool)

(assert (=> b!864343 m!805227))

(assert (=> b!864343 m!805199))

(assert (=> b!864343 m!805223))

(declare-fun m!805229 () Bool)

(assert (=> b!864345 m!805229))

(assert (=> b!864345 m!805229))

(declare-fun m!805231 () Bool)

(assert (=> b!864345 m!805231))

(assert (=> b!864345 m!805199))

(assert (=> b!864345 m!805199))

(declare-fun m!805233 () Bool)

(assert (=> b!864345 m!805233))

(declare-fun m!805235 () Bool)

(assert (=> b!864339 m!805235))

(check-sat (not b_next!14653) (not b_lambda!11987) (not b!864349) (not b!864337) b_and!24261 (not b!864343) (not b!864339) (not mapNonEmpty!26783) (not start!73720) (not b!864338) (not b!864345) tp_is_empty!16789 (not b!864336) (not b!864350) (not b!864342))
(check-sat b_and!24261 (not b_next!14653))
