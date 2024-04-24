; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73936 () Bool)

(assert start!73936)

(declare-fun b_free!14683 () Bool)

(declare-fun b_next!14683 () Bool)

(assert (=> start!73936 (= b_free!14683 (not b_next!14683))))

(declare-fun tp!51553 () Bool)

(declare-fun b_and!24355 () Bool)

(assert (=> start!73936 (= tp!51553 b_and!24355)))

(declare-fun b!866228 () Bool)

(declare-fun res!588321 () Bool)

(declare-fun e!482634 () Bool)

(assert (=> b!866228 (=> (not res!588321) (not e!482634))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49849 0))(
  ( (array!49850 (arr!23951 (Array (_ BitVec 32) (_ BitVec 64))) (size!24392 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49849)

(assert (=> b!866228 (= res!588321 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24392 _keys!868))))))

(declare-fun b!866230 () Bool)

(declare-fun e!482630 () Bool)

(declare-fun e!482633 () Bool)

(assert (=> b!866230 (= e!482630 e!482633)))

(declare-fun res!588319 () Bool)

(assert (=> b!866230 (=> res!588319 e!482633)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!866230 (= res!588319 (= k0!854 (select (arr!23951 _keys!868) from!1053)))))

(assert (=> b!866230 (not (= (select (arr!23951 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29619 0))(
  ( (Unit!29620) )
))
(declare-fun lt!392408 () Unit!29619)

(declare-fun e!482628 () Unit!29619)

(assert (=> b!866230 (= lt!392408 e!482628)))

(declare-fun c!92527 () Bool)

(assert (=> b!866230 (= c!92527 (= (select (arr!23951 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!27473 0))(
  ( (V!27474 (val!8457 Int)) )
))
(declare-datatypes ((tuple2!11130 0))(
  ( (tuple2!11131 (_1!5576 (_ BitVec 64)) (_2!5576 V!27473)) )
))
(declare-datatypes ((List!16958 0))(
  ( (Nil!16955) (Cons!16954 (h!18091 tuple2!11130) (t!23899 List!16958)) )
))
(declare-datatypes ((ListLongMap!9901 0))(
  ( (ListLongMap!9902 (toList!4966 List!16958)) )
))
(declare-fun lt!392407 () ListLongMap!9901)

(declare-fun lt!392416 () ListLongMap!9901)

(assert (=> b!866230 (= lt!392407 lt!392416)))

(declare-fun lt!392413 () ListLongMap!9901)

(declare-fun lt!392406 () tuple2!11130)

(declare-fun +!2369 (ListLongMap!9901 tuple2!11130) ListLongMap!9901)

(assert (=> b!866230 (= lt!392416 (+!2369 lt!392413 lt!392406))))

(declare-fun lt!392405 () V!27473)

(assert (=> b!866230 (= lt!392406 (tuple2!11131 (select (arr!23951 _keys!868) from!1053) lt!392405))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7970 0))(
  ( (ValueCellFull!7970 (v!10882 V!27473)) (EmptyCell!7970) )
))
(declare-datatypes ((array!49851 0))(
  ( (array!49852 (arr!23952 (Array (_ BitVec 32) ValueCell!7970)) (size!24393 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49851)

(declare-fun get!12669 (ValueCell!7970 V!27473) V!27473)

(declare-fun dynLambda!1191 (Int (_ BitVec 64)) V!27473)

(assert (=> b!866230 (= lt!392405 (get!12669 (select (arr!23952 _values!688) from!1053) (dynLambda!1191 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866231 () Bool)

(declare-fun res!588315 () Bool)

(assert (=> b!866231 (=> (not res!588315) (not e!482634))))

(declare-datatypes ((List!16959 0))(
  ( (Nil!16956) (Cons!16955 (h!18092 (_ BitVec 64)) (t!23900 List!16959)) )
))
(declare-fun arrayNoDuplicates!0 (array!49849 (_ BitVec 32) List!16959) Bool)

(assert (=> b!866231 (= res!588315 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16956))))

(declare-fun b!866232 () Bool)

(declare-fun e!482632 () Bool)

(declare-fun e!482635 () Bool)

(declare-fun mapRes!26828 () Bool)

(assert (=> b!866232 (= e!482632 (and e!482635 mapRes!26828))))

(declare-fun condMapEmpty!26828 () Bool)

(declare-fun mapDefault!26828 () ValueCell!7970)

(assert (=> b!866232 (= condMapEmpty!26828 (= (arr!23952 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7970)) mapDefault!26828)))))

(declare-fun b!866233 () Bool)

(declare-fun res!588314 () Bool)

(assert (=> b!866233 (=> (not res!588314) (not e!482634))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866233 (= res!588314 (validKeyInArray!0 k0!854))))

(declare-fun b!866234 () Bool)

(declare-fun res!588316 () Bool)

(assert (=> b!866234 (=> (not res!588316) (not e!482634))))

(assert (=> b!866234 (= res!588316 (and (= (select (arr!23951 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26828 () Bool)

(declare-fun tp!51554 () Bool)

(declare-fun e!482631 () Bool)

(assert (=> mapNonEmpty!26828 (= mapRes!26828 (and tp!51554 e!482631))))

(declare-fun mapKey!26828 () (_ BitVec 32))

(declare-fun mapRest!26828 () (Array (_ BitVec 32) ValueCell!7970))

(declare-fun mapValue!26828 () ValueCell!7970)

(assert (=> mapNonEmpty!26828 (= (arr!23952 _values!688) (store mapRest!26828 mapKey!26828 mapValue!26828))))

(declare-fun mapIsEmpty!26828 () Bool)

(assert (=> mapIsEmpty!26828 mapRes!26828))

(declare-fun b!866235 () Bool)

(declare-fun Unit!29621 () Unit!29619)

(assert (=> b!866235 (= e!482628 Unit!29621)))

(declare-fun lt!392404 () Unit!29619)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49849 (_ BitVec 32) (_ BitVec 32)) Unit!29619)

(assert (=> b!866235 (= lt!392404 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866235 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16956)))

(declare-fun lt!392412 () Unit!29619)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49849 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29619)

(assert (=> b!866235 (= lt!392412 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866235 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392402 () Unit!29619)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49849 (_ BitVec 64) (_ BitVec 32) List!16959) Unit!29619)

(assert (=> b!866235 (= lt!392402 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16956))))

(assert (=> b!866235 false))

(declare-fun res!588313 () Bool)

(assert (=> start!73936 (=> (not res!588313) (not e!482634))))

(assert (=> start!73936 (= res!588313 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24392 _keys!868))))))

(assert (=> start!73936 e!482634))

(declare-fun tp_is_empty!16819 () Bool)

(assert (=> start!73936 tp_is_empty!16819))

(assert (=> start!73936 true))

(assert (=> start!73936 tp!51553))

(declare-fun array_inv!18990 (array!49849) Bool)

(assert (=> start!73936 (array_inv!18990 _keys!868)))

(declare-fun array_inv!18991 (array!49851) Bool)

(assert (=> start!73936 (and (array_inv!18991 _values!688) e!482632)))

(declare-fun b!866229 () Bool)

(declare-fun res!588322 () Bool)

(assert (=> b!866229 (=> (not res!588322) (not e!482634))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49849 (_ BitVec 32)) Bool)

(assert (=> b!866229 (= res!588322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866236 () Bool)

(declare-fun e!482629 () Bool)

(assert (=> b!866236 (= e!482629 (not e!482630))))

(declare-fun res!588320 () Bool)

(assert (=> b!866236 (=> res!588320 e!482630)))

(assert (=> b!866236 (= res!588320 (not (validKeyInArray!0 (select (arr!23951 _keys!868) from!1053))))))

(declare-fun lt!392414 () ListLongMap!9901)

(assert (=> b!866236 (= lt!392414 lt!392413)))

(declare-fun lt!392403 () ListLongMap!9901)

(declare-fun lt!392415 () tuple2!11130)

(assert (=> b!866236 (= lt!392413 (+!2369 lt!392403 lt!392415))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!392409 () array!49851)

(declare-fun minValue!654 () V!27473)

(declare-fun zeroValue!654 () V!27473)

(declare-fun getCurrentListMapNoExtraKeys!3015 (array!49849 array!49851 (_ BitVec 32) (_ BitVec 32) V!27473 V!27473 (_ BitVec 32) Int) ListLongMap!9901)

(assert (=> b!866236 (= lt!392414 (getCurrentListMapNoExtraKeys!3015 _keys!868 lt!392409 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27473)

(assert (=> b!866236 (= lt!392415 (tuple2!11131 k0!854 v!557))))

(assert (=> b!866236 (= lt!392403 (getCurrentListMapNoExtraKeys!3015 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392411 () Unit!29619)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!550 (array!49849 array!49851 (_ BitVec 32) (_ BitVec 32) V!27473 V!27473 (_ BitVec 32) (_ BitVec 64) V!27473 (_ BitVec 32) Int) Unit!29619)

(assert (=> b!866236 (= lt!392411 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!550 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866237 () Bool)

(assert (=> b!866237 (= e!482631 tp_is_empty!16819)))

(declare-fun b!866238 () Bool)

(assert (=> b!866238 (= e!482633 true)))

(assert (=> b!866238 (= lt!392416 (+!2369 (+!2369 lt!392403 lt!392406) lt!392415))))

(declare-fun lt!392410 () Unit!29619)

(declare-fun addCommutativeForDiffKeys!516 (ListLongMap!9901 (_ BitVec 64) V!27473 (_ BitVec 64) V!27473) Unit!29619)

(assert (=> b!866238 (= lt!392410 (addCommutativeForDiffKeys!516 lt!392403 k0!854 v!557 (select (arr!23951 _keys!868) from!1053) lt!392405))))

(declare-fun b!866239 () Bool)

(declare-fun res!588317 () Bool)

(assert (=> b!866239 (=> (not res!588317) (not e!482634))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866239 (= res!588317 (validMask!0 mask!1196))))

(declare-fun b!866240 () Bool)

(declare-fun res!588312 () Bool)

(assert (=> b!866240 (=> (not res!588312) (not e!482634))))

(assert (=> b!866240 (= res!588312 (and (= (size!24393 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24392 _keys!868) (size!24393 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866241 () Bool)

(assert (=> b!866241 (= e!482634 e!482629)))

(declare-fun res!588318 () Bool)

(assert (=> b!866241 (=> (not res!588318) (not e!482629))))

(assert (=> b!866241 (= res!588318 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866241 (= lt!392407 (getCurrentListMapNoExtraKeys!3015 _keys!868 lt!392409 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866241 (= lt!392409 (array!49852 (store (arr!23952 _values!688) i!612 (ValueCellFull!7970 v!557)) (size!24393 _values!688)))))

(declare-fun lt!392417 () ListLongMap!9901)

(assert (=> b!866241 (= lt!392417 (getCurrentListMapNoExtraKeys!3015 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866242 () Bool)

(assert (=> b!866242 (= e!482635 tp_is_empty!16819)))

(declare-fun b!866243 () Bool)

(declare-fun Unit!29622 () Unit!29619)

(assert (=> b!866243 (= e!482628 Unit!29622)))

(assert (= (and start!73936 res!588313) b!866239))

(assert (= (and b!866239 res!588317) b!866240))

(assert (= (and b!866240 res!588312) b!866229))

(assert (= (and b!866229 res!588322) b!866231))

(assert (= (and b!866231 res!588315) b!866228))

(assert (= (and b!866228 res!588321) b!866233))

(assert (= (and b!866233 res!588314) b!866234))

(assert (= (and b!866234 res!588316) b!866241))

(assert (= (and b!866241 res!588318) b!866236))

(assert (= (and b!866236 (not res!588320)) b!866230))

(assert (= (and b!866230 c!92527) b!866235))

(assert (= (and b!866230 (not c!92527)) b!866243))

(assert (= (and b!866230 (not res!588319)) b!866238))

(assert (= (and b!866232 condMapEmpty!26828) mapIsEmpty!26828))

(assert (= (and b!866232 (not condMapEmpty!26828)) mapNonEmpty!26828))

(get-info :version)

(assert (= (and mapNonEmpty!26828 ((_ is ValueCellFull!7970) mapValue!26828)) b!866237))

(assert (= (and b!866232 ((_ is ValueCellFull!7970) mapDefault!26828)) b!866242))

(assert (= start!73936 b!866232))

(declare-fun b_lambda!12049 () Bool)

(assert (=> (not b_lambda!12049) (not b!866230)))

(declare-fun t!23898 () Bool)

(declare-fun tb!4797 () Bool)

(assert (=> (and start!73936 (= defaultEntry!696 defaultEntry!696) t!23898) tb!4797))

(declare-fun result!9213 () Bool)

(assert (=> tb!4797 (= result!9213 tp_is_empty!16819)))

(assert (=> b!866230 t!23898))

(declare-fun b_and!24357 () Bool)

(assert (= b_and!24355 (and (=> t!23898 result!9213) b_and!24357)))

(declare-fun m!808097 () Bool)

(assert (=> mapNonEmpty!26828 m!808097))

(declare-fun m!808099 () Bool)

(assert (=> b!866230 m!808099))

(declare-fun m!808101 () Bool)

(assert (=> b!866230 m!808101))

(declare-fun m!808103 () Bool)

(assert (=> b!866230 m!808103))

(assert (=> b!866230 m!808099))

(declare-fun m!808105 () Bool)

(assert (=> b!866230 m!808105))

(declare-fun m!808107 () Bool)

(assert (=> b!866230 m!808107))

(assert (=> b!866230 m!808101))

(declare-fun m!808109 () Bool)

(assert (=> b!866236 m!808109))

(assert (=> b!866236 m!808107))

(declare-fun m!808111 () Bool)

(assert (=> b!866236 m!808111))

(assert (=> b!866236 m!808107))

(declare-fun m!808113 () Bool)

(assert (=> b!866236 m!808113))

(declare-fun m!808115 () Bool)

(assert (=> b!866236 m!808115))

(declare-fun m!808117 () Bool)

(assert (=> b!866236 m!808117))

(declare-fun m!808119 () Bool)

(assert (=> b!866239 m!808119))

(declare-fun m!808121 () Bool)

(assert (=> b!866229 m!808121))

(declare-fun m!808123 () Bool)

(assert (=> b!866238 m!808123))

(assert (=> b!866238 m!808123))

(declare-fun m!808125 () Bool)

(assert (=> b!866238 m!808125))

(assert (=> b!866238 m!808107))

(assert (=> b!866238 m!808107))

(declare-fun m!808127 () Bool)

(assert (=> b!866238 m!808127))

(declare-fun m!808129 () Bool)

(assert (=> start!73936 m!808129))

(declare-fun m!808131 () Bool)

(assert (=> start!73936 m!808131))

(declare-fun m!808133 () Bool)

(assert (=> b!866231 m!808133))

(declare-fun m!808135 () Bool)

(assert (=> b!866241 m!808135))

(declare-fun m!808137 () Bool)

(assert (=> b!866241 m!808137))

(declare-fun m!808139 () Bool)

(assert (=> b!866241 m!808139))

(declare-fun m!808141 () Bool)

(assert (=> b!866233 m!808141))

(declare-fun m!808143 () Bool)

(assert (=> b!866234 m!808143))

(declare-fun m!808145 () Bool)

(assert (=> b!866235 m!808145))

(declare-fun m!808147 () Bool)

(assert (=> b!866235 m!808147))

(declare-fun m!808149 () Bool)

(assert (=> b!866235 m!808149))

(declare-fun m!808151 () Bool)

(assert (=> b!866235 m!808151))

(declare-fun m!808153 () Bool)

(assert (=> b!866235 m!808153))

(check-sat b_and!24357 (not b_next!14683) (not start!73936) (not b!866238) (not b!866236) (not b!866231) (not b_lambda!12049) (not b!866235) (not mapNonEmpty!26828) tp_is_empty!16819 (not b!866241) (not b!866239) (not b!866230) (not b!866229) (not b!866233))
(check-sat b_and!24357 (not b_next!14683))
