; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73644 () Bool)

(assert start!73644)

(declare-fun b_free!14559 () Bool)

(declare-fun b_next!14559 () Bool)

(assert (=> start!73644 (= b_free!14559 (not b_next!14559))))

(declare-fun tp!51181 () Bool)

(declare-fun b_and!24097 () Bool)

(assert (=> start!73644 (= tp!51181 b_and!24097)))

(declare-fun b!862225 () Bool)

(declare-fun e!480378 () Bool)

(declare-fun tp_is_empty!16695 () Bool)

(assert (=> b!862225 (= e!480378 tp_is_empty!16695)))

(declare-fun b!862226 () Bool)

(declare-fun e!480376 () Bool)

(declare-fun mapRes!26642 () Bool)

(assert (=> b!862226 (= e!480376 (and e!480378 mapRes!26642))))

(declare-fun condMapEmpty!26642 () Bool)

(declare-datatypes ((V!27307 0))(
  ( (V!27308 (val!8395 Int)) )
))
(declare-datatypes ((ValueCell!7908 0))(
  ( (ValueCellFull!7908 (v!10820 V!27307)) (EmptyCell!7908) )
))
(declare-datatypes ((array!49554 0))(
  ( (array!49555 (arr!23808 (Array (_ BitVec 32) ValueCell!7908)) (size!24248 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49554)

(declare-fun mapDefault!26642 () ValueCell!7908)

(assert (=> b!862226 (= condMapEmpty!26642 (= (arr!23808 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7908)) mapDefault!26642)))))

(declare-fun b!862227 () Bool)

(declare-fun e!480374 () Bool)

(declare-fun e!480373 () Bool)

(assert (=> b!862227 (= e!480374 e!480373)))

(declare-fun res!585930 () Bool)

(assert (=> b!862227 (=> res!585930 e!480373)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49556 0))(
  ( (array!49557 (arr!23809 (Array (_ BitVec 32) (_ BitVec 64))) (size!24249 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49556)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!862227 (= res!585930 (= k0!854 (select (arr!23809 _keys!868) from!1053)))))

(assert (=> b!862227 (not (= (select (arr!23809 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29437 0))(
  ( (Unit!29438) )
))
(declare-fun lt!389079 () Unit!29437)

(declare-fun e!480379 () Unit!29437)

(assert (=> b!862227 (= lt!389079 e!480379)))

(declare-fun c!92059 () Bool)

(assert (=> b!862227 (= c!92059 (= (select (arr!23809 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11102 0))(
  ( (tuple2!11103 (_1!5562 (_ BitVec 64)) (_2!5562 V!27307)) )
))
(declare-datatypes ((List!16911 0))(
  ( (Nil!16908) (Cons!16907 (h!18038 tuple2!11102) (t!23736 List!16911)) )
))
(declare-datatypes ((ListLongMap!9871 0))(
  ( (ListLongMap!9872 (toList!4951 List!16911)) )
))
(declare-fun lt!389072 () ListLongMap!9871)

(declare-fun lt!389076 () ListLongMap!9871)

(assert (=> b!862227 (= lt!389072 lt!389076)))

(declare-fun lt!389074 () ListLongMap!9871)

(declare-fun lt!389073 () tuple2!11102)

(declare-fun +!2300 (ListLongMap!9871 tuple2!11102) ListLongMap!9871)

(assert (=> b!862227 (= lt!389076 (+!2300 lt!389074 lt!389073))))

(declare-fun lt!389077 () V!27307)

(assert (=> b!862227 (= lt!389073 (tuple2!11103 (select (arr!23809 _keys!868) from!1053) lt!389077))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12565 (ValueCell!7908 V!27307) V!27307)

(declare-fun dynLambda!1135 (Int (_ BitVec 64)) V!27307)

(assert (=> b!862227 (= lt!389077 (get!12565 (select (arr!23808 _values!688) from!1053) (dynLambda!1135 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862228 () Bool)

(declare-fun e!480372 () Bool)

(assert (=> b!862228 (= e!480372 tp_is_empty!16695)))

(declare-fun b!862229 () Bool)

(declare-fun res!585931 () Bool)

(declare-fun e!480371 () Bool)

(assert (=> b!862229 (=> (not res!585931) (not e!480371))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!862229 (= res!585931 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24249 _keys!868))))))

(declare-fun b!862231 () Bool)

(declare-fun res!585924 () Bool)

(assert (=> b!862231 (=> (not res!585924) (not e!480371))))

(assert (=> b!862231 (= res!585924 (and (= (select (arr!23809 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862232 () Bool)

(declare-fun res!585929 () Bool)

(assert (=> b!862232 (=> (not res!585929) (not e!480371))))

(declare-datatypes ((List!16912 0))(
  ( (Nil!16909) (Cons!16908 (h!18039 (_ BitVec 64)) (t!23737 List!16912)) )
))
(declare-fun arrayNoDuplicates!0 (array!49556 (_ BitVec 32) List!16912) Bool)

(assert (=> b!862232 (= res!585929 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16909))))

(declare-fun b!862233 () Bool)

(declare-fun res!585923 () Bool)

(assert (=> b!862233 (=> (not res!585923) (not e!480371))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862233 (= res!585923 (validMask!0 mask!1196))))

(declare-fun b!862234 () Bool)

(declare-fun e!480375 () Bool)

(assert (=> b!862234 (= e!480375 (not e!480374))))

(declare-fun res!585927 () Bool)

(assert (=> b!862234 (=> res!585927 e!480374)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862234 (= res!585927 (not (validKeyInArray!0 (select (arr!23809 _keys!868) from!1053))))))

(declare-fun lt!389065 () ListLongMap!9871)

(assert (=> b!862234 (= lt!389065 lt!389074)))

(declare-fun lt!389080 () ListLongMap!9871)

(declare-fun lt!389066 () tuple2!11102)

(assert (=> b!862234 (= lt!389074 (+!2300 lt!389080 lt!389066))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27307)

(declare-fun zeroValue!654 () V!27307)

(declare-fun lt!389067 () array!49554)

(declare-fun getCurrentListMapNoExtraKeys!2927 (array!49556 array!49554 (_ BitVec 32) (_ BitVec 32) V!27307 V!27307 (_ BitVec 32) Int) ListLongMap!9871)

(assert (=> b!862234 (= lt!389065 (getCurrentListMapNoExtraKeys!2927 _keys!868 lt!389067 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27307)

(assert (=> b!862234 (= lt!389066 (tuple2!11103 k0!854 v!557))))

(assert (=> b!862234 (= lt!389080 (getCurrentListMapNoExtraKeys!2927 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389071 () Unit!29437)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!510 (array!49556 array!49554 (_ BitVec 32) (_ BitVec 32) V!27307 V!27307 (_ BitVec 32) (_ BitVec 64) V!27307 (_ BitVec 32) Int) Unit!29437)

(assert (=> b!862234 (= lt!389071 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!510 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862235 () Bool)

(declare-fun res!585932 () Bool)

(assert (=> b!862235 (=> (not res!585932) (not e!480371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49556 (_ BitVec 32)) Bool)

(assert (=> b!862235 (= res!585932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862236 () Bool)

(declare-fun res!585928 () Bool)

(assert (=> b!862236 (=> (not res!585928) (not e!480371))))

(assert (=> b!862236 (= res!585928 (validKeyInArray!0 k0!854))))

(declare-fun b!862237 () Bool)

(declare-fun Unit!29439 () Unit!29437)

(assert (=> b!862237 (= e!480379 Unit!29439)))

(declare-fun lt!389078 () Unit!29437)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49556 (_ BitVec 32) (_ BitVec 32)) Unit!29437)

(assert (=> b!862237 (= lt!389078 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862237 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16909)))

(declare-fun lt!389075 () Unit!29437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49556 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29437)

(assert (=> b!862237 (= lt!389075 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862237 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389068 () Unit!29437)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49556 (_ BitVec 64) (_ BitVec 32) List!16912) Unit!29437)

(assert (=> b!862237 (= lt!389068 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16909))))

(assert (=> b!862237 false))

(declare-fun mapIsEmpty!26642 () Bool)

(assert (=> mapIsEmpty!26642 mapRes!26642))

(declare-fun b!862230 () Bool)

(declare-fun Unit!29440 () Unit!29437)

(assert (=> b!862230 (= e!480379 Unit!29440)))

(declare-fun res!585926 () Bool)

(assert (=> start!73644 (=> (not res!585926) (not e!480371))))

(assert (=> start!73644 (= res!585926 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24249 _keys!868))))))

(assert (=> start!73644 e!480371))

(assert (=> start!73644 tp_is_empty!16695))

(assert (=> start!73644 true))

(assert (=> start!73644 tp!51181))

(declare-fun array_inv!18838 (array!49556) Bool)

(assert (=> start!73644 (array_inv!18838 _keys!868)))

(declare-fun array_inv!18839 (array!49554) Bool)

(assert (=> start!73644 (and (array_inv!18839 _values!688) e!480376)))

(declare-fun b!862238 () Bool)

(assert (=> b!862238 (= e!480373 true)))

(assert (=> b!862238 (= lt!389076 (+!2300 (+!2300 lt!389080 lt!389073) lt!389066))))

(declare-fun lt!389070 () Unit!29437)

(declare-fun addCommutativeForDiffKeys!478 (ListLongMap!9871 (_ BitVec 64) V!27307 (_ BitVec 64) V!27307) Unit!29437)

(assert (=> b!862238 (= lt!389070 (addCommutativeForDiffKeys!478 lt!389080 k0!854 v!557 (select (arr!23809 _keys!868) from!1053) lt!389077))))

(declare-fun mapNonEmpty!26642 () Bool)

(declare-fun tp!51180 () Bool)

(assert (=> mapNonEmpty!26642 (= mapRes!26642 (and tp!51180 e!480372))))

(declare-fun mapRest!26642 () (Array (_ BitVec 32) ValueCell!7908))

(declare-fun mapKey!26642 () (_ BitVec 32))

(declare-fun mapValue!26642 () ValueCell!7908)

(assert (=> mapNonEmpty!26642 (= (arr!23808 _values!688) (store mapRest!26642 mapKey!26642 mapValue!26642))))

(declare-fun b!862239 () Bool)

(assert (=> b!862239 (= e!480371 e!480375)))

(declare-fun res!585925 () Bool)

(assert (=> b!862239 (=> (not res!585925) (not e!480375))))

(assert (=> b!862239 (= res!585925 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!862239 (= lt!389072 (getCurrentListMapNoExtraKeys!2927 _keys!868 lt!389067 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862239 (= lt!389067 (array!49555 (store (arr!23808 _values!688) i!612 (ValueCellFull!7908 v!557)) (size!24248 _values!688)))))

(declare-fun lt!389069 () ListLongMap!9871)

(assert (=> b!862239 (= lt!389069 (getCurrentListMapNoExtraKeys!2927 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862240 () Bool)

(declare-fun res!585922 () Bool)

(assert (=> b!862240 (=> (not res!585922) (not e!480371))))

(assert (=> b!862240 (= res!585922 (and (= (size!24248 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24249 _keys!868) (size!24248 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73644 res!585926) b!862233))

(assert (= (and b!862233 res!585923) b!862240))

(assert (= (and b!862240 res!585922) b!862235))

(assert (= (and b!862235 res!585932) b!862232))

(assert (= (and b!862232 res!585929) b!862229))

(assert (= (and b!862229 res!585931) b!862236))

(assert (= (and b!862236 res!585928) b!862231))

(assert (= (and b!862231 res!585924) b!862239))

(assert (= (and b!862239 res!585925) b!862234))

(assert (= (and b!862234 (not res!585927)) b!862227))

(assert (= (and b!862227 c!92059) b!862237))

(assert (= (and b!862227 (not c!92059)) b!862230))

(assert (= (and b!862227 (not res!585930)) b!862238))

(assert (= (and b!862226 condMapEmpty!26642) mapIsEmpty!26642))

(assert (= (and b!862226 (not condMapEmpty!26642)) mapNonEmpty!26642))

(get-info :version)

(assert (= (and mapNonEmpty!26642 ((_ is ValueCellFull!7908) mapValue!26642)) b!862228))

(assert (= (and b!862226 ((_ is ValueCellFull!7908) mapDefault!26642)) b!862225))

(assert (= start!73644 b!862226))

(declare-fun b_lambda!11911 () Bool)

(assert (=> (not b_lambda!11911) (not b!862227)))

(declare-fun t!23735 () Bool)

(declare-fun tb!4681 () Bool)

(assert (=> (and start!73644 (= defaultEntry!696 defaultEntry!696) t!23735) tb!4681))

(declare-fun result!8973 () Bool)

(assert (=> tb!4681 (= result!8973 tp_is_empty!16695)))

(assert (=> b!862227 t!23735))

(declare-fun b_and!24099 () Bool)

(assert (= b_and!24097 (and (=> t!23735 result!8973) b_and!24099)))

(declare-fun m!803211 () Bool)

(assert (=> b!862239 m!803211))

(declare-fun m!803213 () Bool)

(assert (=> b!862239 m!803213))

(declare-fun m!803215 () Bool)

(assert (=> b!862239 m!803215))

(declare-fun m!803217 () Bool)

(assert (=> b!862237 m!803217))

(declare-fun m!803219 () Bool)

(assert (=> b!862237 m!803219))

(declare-fun m!803221 () Bool)

(assert (=> b!862237 m!803221))

(declare-fun m!803223 () Bool)

(assert (=> b!862237 m!803223))

(declare-fun m!803225 () Bool)

(assert (=> b!862237 m!803225))

(declare-fun m!803227 () Bool)

(assert (=> b!862236 m!803227))

(declare-fun m!803229 () Bool)

(assert (=> b!862234 m!803229))

(declare-fun m!803231 () Bool)

(assert (=> b!862234 m!803231))

(declare-fun m!803233 () Bool)

(assert (=> b!862234 m!803233))

(declare-fun m!803235 () Bool)

(assert (=> b!862234 m!803235))

(declare-fun m!803237 () Bool)

(assert (=> b!862234 m!803237))

(assert (=> b!862234 m!803235))

(declare-fun m!803239 () Bool)

(assert (=> b!862234 m!803239))

(declare-fun m!803241 () Bool)

(assert (=> b!862227 m!803241))

(declare-fun m!803243 () Bool)

(assert (=> b!862227 m!803243))

(declare-fun m!803245 () Bool)

(assert (=> b!862227 m!803245))

(declare-fun m!803247 () Bool)

(assert (=> b!862227 m!803247))

(assert (=> b!862227 m!803243))

(assert (=> b!862227 m!803235))

(assert (=> b!862227 m!803245))

(declare-fun m!803249 () Bool)

(assert (=> b!862232 m!803249))

(declare-fun m!803251 () Bool)

(assert (=> b!862235 m!803251))

(declare-fun m!803253 () Bool)

(assert (=> b!862238 m!803253))

(assert (=> b!862238 m!803253))

(declare-fun m!803255 () Bool)

(assert (=> b!862238 m!803255))

(assert (=> b!862238 m!803235))

(assert (=> b!862238 m!803235))

(declare-fun m!803257 () Bool)

(assert (=> b!862238 m!803257))

(declare-fun m!803259 () Bool)

(assert (=> mapNonEmpty!26642 m!803259))

(declare-fun m!803261 () Bool)

(assert (=> b!862231 m!803261))

(declare-fun m!803263 () Bool)

(assert (=> b!862233 m!803263))

(declare-fun m!803265 () Bool)

(assert (=> start!73644 m!803265))

(declare-fun m!803267 () Bool)

(assert (=> start!73644 m!803267))

(check-sat (not b!862227) (not b!862235) (not b!862236) (not b!862238) (not b_next!14559) (not start!73644) (not b!862233) (not mapNonEmpty!26642) (not b!862232) (not b_lambda!11911) (not b!862234) (not b!862239) b_and!24099 (not b!862237) tp_is_empty!16695)
(check-sat b_and!24099 (not b_next!14559))
