; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73642 () Bool)

(assert start!73642)

(declare-fun b_free!14575 () Bool)

(declare-fun b_next!14575 () Bool)

(assert (=> start!73642 (= b_free!14575 (not b_next!14575))))

(declare-fun tp!51230 () Bool)

(declare-fun b_and!24103 () Bool)

(assert (=> start!73642 (= tp!51230 b_and!24103)))

(declare-fun b!862386 () Bool)

(declare-fun res!586082 () Bool)

(declare-fun e!480443 () Bool)

(assert (=> b!862386 (=> (not res!586082) (not e!480443))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49575 0))(
  ( (array!49576 (arr!23819 (Array (_ BitVec 32) (_ BitVec 64))) (size!24261 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49575)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!862386 (= res!586082 (and (= (select (arr!23819 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!862387 () Bool)

(declare-fun e!480446 () Bool)

(assert (=> b!862387 (= e!480443 e!480446)))

(declare-fun res!586085 () Bool)

(assert (=> b!862387 (=> (not res!586085) (not e!480446))))

(assert (=> b!862387 (= res!586085 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27329 0))(
  ( (V!27330 (val!8403 Int)) )
))
(declare-datatypes ((ValueCell!7916 0))(
  ( (ValueCellFull!7916 (v!10822 V!27329)) (EmptyCell!7916) )
))
(declare-datatypes ((array!49577 0))(
  ( (array!49578 (arr!23820 (Array (_ BitVec 32) ValueCell!7916)) (size!24262 (_ BitVec 32))) )
))
(declare-fun lt!389216 () array!49577)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11126 0))(
  ( (tuple2!11127 (_1!5574 (_ BitVec 64)) (_2!5574 V!27329)) )
))
(declare-datatypes ((List!16922 0))(
  ( (Nil!16919) (Cons!16918 (h!18049 tuple2!11126) (t!23754 List!16922)) )
))
(declare-datatypes ((ListLongMap!9885 0))(
  ( (ListLongMap!9886 (toList!4958 List!16922)) )
))
(declare-fun lt!389223 () ListLongMap!9885)

(declare-fun minValue!654 () V!27329)

(declare-fun zeroValue!654 () V!27329)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2960 (array!49575 array!49577 (_ BitVec 32) (_ BitVec 32) V!27329 V!27329 (_ BitVec 32) Int) ListLongMap!9885)

(assert (=> b!862387 (= lt!389223 (getCurrentListMapNoExtraKeys!2960 _keys!868 lt!389216 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27329)

(declare-fun _values!688 () array!49577)

(assert (=> b!862387 (= lt!389216 (array!49578 (store (arr!23820 _values!688) i!612 (ValueCellFull!7916 v!557)) (size!24262 _values!688)))))

(declare-fun lt!389227 () ListLongMap!9885)

(assert (=> b!862387 (= lt!389227 (getCurrentListMapNoExtraKeys!2960 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862388 () Bool)

(declare-fun e!480442 () Bool)

(assert (=> b!862388 (= e!480442 true)))

(declare-fun lt!389219 () tuple2!11126)

(declare-fun lt!389224 () ListLongMap!9885)

(declare-fun lt!389214 () tuple2!11126)

(declare-fun lt!389218 () ListLongMap!9885)

(declare-fun +!2327 (ListLongMap!9885 tuple2!11126) ListLongMap!9885)

(assert (=> b!862388 (= lt!389218 (+!2327 (+!2327 lt!389224 lt!389214) lt!389219))))

(declare-fun lt!389221 () V!27329)

(declare-datatypes ((Unit!29380 0))(
  ( (Unit!29381) )
))
(declare-fun lt!389226 () Unit!29380)

(declare-fun addCommutativeForDiffKeys!477 (ListLongMap!9885 (_ BitVec 64) V!27329 (_ BitVec 64) V!27329) Unit!29380)

(assert (=> b!862388 (= lt!389226 (addCommutativeForDiffKeys!477 lt!389224 k0!854 v!557 (select (arr!23819 _keys!868) from!1053) lt!389221))))

(declare-fun b!862389 () Bool)

(declare-fun res!586076 () Bool)

(assert (=> b!862389 (=> (not res!586076) (not e!480443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862389 (= res!586076 (validMask!0 mask!1196))))

(declare-fun b!862390 () Bool)

(declare-fun e!480439 () Bool)

(declare-fun tp_is_empty!16711 () Bool)

(assert (=> b!862390 (= e!480439 tp_is_empty!16711)))

(declare-fun b!862391 () Bool)

(declare-fun res!586078 () Bool)

(assert (=> b!862391 (=> (not res!586078) (not e!480443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862391 (= res!586078 (validKeyInArray!0 k0!854))))

(declare-fun b!862392 () Bool)

(declare-fun e!480444 () Unit!29380)

(declare-fun Unit!29382 () Unit!29380)

(assert (=> b!862392 (= e!480444 Unit!29382)))

(declare-fun b!862393 () Bool)

(declare-fun Unit!29383 () Unit!29380)

(assert (=> b!862393 (= e!480444 Unit!29383)))

(declare-fun lt!389228 () Unit!29380)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49575 (_ BitVec 32) (_ BitVec 32)) Unit!29380)

(assert (=> b!862393 (= lt!389228 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16923 0))(
  ( (Nil!16920) (Cons!16919 (h!18050 (_ BitVec 64)) (t!23755 List!16923)) )
))
(declare-fun arrayNoDuplicates!0 (array!49575 (_ BitVec 32) List!16923) Bool)

(assert (=> b!862393 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16920)))

(declare-fun lt!389215 () Unit!29380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49575 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29380)

(assert (=> b!862393 (= lt!389215 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862393 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!389222 () Unit!29380)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49575 (_ BitVec 64) (_ BitVec 32) List!16923) Unit!29380)

(assert (=> b!862393 (= lt!389222 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16920))))

(assert (=> b!862393 false))

(declare-fun mapNonEmpty!26666 () Bool)

(declare-fun mapRes!26666 () Bool)

(declare-fun tp!51229 () Bool)

(assert (=> mapNonEmpty!26666 (= mapRes!26666 (and tp!51229 e!480439))))

(declare-fun mapRest!26666 () (Array (_ BitVec 32) ValueCell!7916))

(declare-fun mapKey!26666 () (_ BitVec 32))

(declare-fun mapValue!26666 () ValueCell!7916)

(assert (=> mapNonEmpty!26666 (= (arr!23820 _values!688) (store mapRest!26666 mapKey!26666 mapValue!26666))))

(declare-fun mapIsEmpty!26666 () Bool)

(assert (=> mapIsEmpty!26666 mapRes!26666))

(declare-fun b!862394 () Bool)

(declare-fun e!480441 () Bool)

(declare-fun e!480440 () Bool)

(assert (=> b!862394 (= e!480441 (and e!480440 mapRes!26666))))

(declare-fun condMapEmpty!26666 () Bool)

(declare-fun mapDefault!26666 () ValueCell!7916)

(assert (=> b!862394 (= condMapEmpty!26666 (= (arr!23820 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7916)) mapDefault!26666)))))

(declare-fun b!862395 () Bool)

(declare-fun res!586083 () Bool)

(assert (=> b!862395 (=> (not res!586083) (not e!480443))))

(assert (=> b!862395 (= res!586083 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16920))))

(declare-fun b!862396 () Bool)

(assert (=> b!862396 (= e!480440 tp_is_empty!16711)))

(declare-fun b!862397 () Bool)

(declare-fun res!586084 () Bool)

(assert (=> b!862397 (=> (not res!586084) (not e!480443))))

(assert (=> b!862397 (= res!586084 (and (= (size!24262 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24261 _keys!868) (size!24262 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862398 () Bool)

(declare-fun e!480445 () Bool)

(assert (=> b!862398 (= e!480445 e!480442)))

(declare-fun res!586086 () Bool)

(assert (=> b!862398 (=> res!586086 e!480442)))

(assert (=> b!862398 (= res!586086 (= k0!854 (select (arr!23819 _keys!868) from!1053)))))

(assert (=> b!862398 (not (= (select (arr!23819 _keys!868) from!1053) k0!854))))

(declare-fun lt!389217 () Unit!29380)

(assert (=> b!862398 (= lt!389217 e!480444)))

(declare-fun c!92018 () Bool)

(assert (=> b!862398 (= c!92018 (= (select (arr!23819 _keys!868) from!1053) k0!854))))

(assert (=> b!862398 (= lt!389223 lt!389218)))

(declare-fun lt!389225 () ListLongMap!9885)

(assert (=> b!862398 (= lt!389218 (+!2327 lt!389225 lt!389214))))

(assert (=> b!862398 (= lt!389214 (tuple2!11127 (select (arr!23819 _keys!868) from!1053) lt!389221))))

(declare-fun get!12572 (ValueCell!7916 V!27329) V!27329)

(declare-fun dynLambda!1133 (Int (_ BitVec 64)) V!27329)

(assert (=> b!862398 (= lt!389221 (get!12572 (select (arr!23820 _values!688) from!1053) (dynLambda!1133 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!862399 () Bool)

(declare-fun res!586081 () Bool)

(assert (=> b!862399 (=> (not res!586081) (not e!480443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49575 (_ BitVec 32)) Bool)

(assert (=> b!862399 (= res!586081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!586079 () Bool)

(assert (=> start!73642 (=> (not res!586079) (not e!480443))))

(assert (=> start!73642 (= res!586079 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24261 _keys!868))))))

(assert (=> start!73642 e!480443))

(assert (=> start!73642 tp_is_empty!16711))

(assert (=> start!73642 true))

(assert (=> start!73642 tp!51230))

(declare-fun array_inv!18914 (array!49575) Bool)

(assert (=> start!73642 (array_inv!18914 _keys!868)))

(declare-fun array_inv!18915 (array!49577) Bool)

(assert (=> start!73642 (and (array_inv!18915 _values!688) e!480441)))

(declare-fun b!862400 () Bool)

(assert (=> b!862400 (= e!480446 (not e!480445))))

(declare-fun res!586080 () Bool)

(assert (=> b!862400 (=> res!586080 e!480445)))

(assert (=> b!862400 (= res!586080 (not (validKeyInArray!0 (select (arr!23819 _keys!868) from!1053))))))

(declare-fun lt!389220 () ListLongMap!9885)

(assert (=> b!862400 (= lt!389220 lt!389225)))

(assert (=> b!862400 (= lt!389225 (+!2327 lt!389224 lt!389219))))

(assert (=> b!862400 (= lt!389220 (getCurrentListMapNoExtraKeys!2960 _keys!868 lt!389216 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!862400 (= lt!389219 (tuple2!11127 k0!854 v!557))))

(assert (=> b!862400 (= lt!389224 (getCurrentListMapNoExtraKeys!2960 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!389213 () Unit!29380)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!513 (array!49575 array!49577 (_ BitVec 32) (_ BitVec 32) V!27329 V!27329 (_ BitVec 32) (_ BitVec 64) V!27329 (_ BitVec 32) Int) Unit!29380)

(assert (=> b!862400 (= lt!389213 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!513 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862401 () Bool)

(declare-fun res!586077 () Bool)

(assert (=> b!862401 (=> (not res!586077) (not e!480443))))

(assert (=> b!862401 (= res!586077 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24261 _keys!868))))))

(assert (= (and start!73642 res!586079) b!862389))

(assert (= (and b!862389 res!586076) b!862397))

(assert (= (and b!862397 res!586084) b!862399))

(assert (= (and b!862399 res!586081) b!862395))

(assert (= (and b!862395 res!586083) b!862401))

(assert (= (and b!862401 res!586077) b!862391))

(assert (= (and b!862391 res!586078) b!862386))

(assert (= (and b!862386 res!586082) b!862387))

(assert (= (and b!862387 res!586085) b!862400))

(assert (= (and b!862400 (not res!586080)) b!862398))

(assert (= (and b!862398 c!92018) b!862393))

(assert (= (and b!862398 (not c!92018)) b!862392))

(assert (= (and b!862398 (not res!586086)) b!862388))

(assert (= (and b!862394 condMapEmpty!26666) mapIsEmpty!26666))

(assert (= (and b!862394 (not condMapEmpty!26666)) mapNonEmpty!26666))

(get-info :version)

(assert (= (and mapNonEmpty!26666 ((_ is ValueCellFull!7916) mapValue!26666)) b!862390))

(assert (= (and b!862394 ((_ is ValueCellFull!7916) mapDefault!26666)) b!862396))

(assert (= start!73642 b!862394))

(declare-fun b_lambda!11909 () Bool)

(assert (=> (not b_lambda!11909) (not b!862398)))

(declare-fun t!23753 () Bool)

(declare-fun tb!4689 () Bool)

(assert (=> (and start!73642 (= defaultEntry!696 defaultEntry!696) t!23753) tb!4689))

(declare-fun result!8997 () Bool)

(assert (=> tb!4689 (= result!8997 tp_is_empty!16711)))

(assert (=> b!862398 t!23753))

(declare-fun b_and!24105 () Bool)

(assert (= b_and!24103 (and (=> t!23753 result!8997) b_and!24105)))

(declare-fun m!802917 () Bool)

(assert (=> start!73642 m!802917))

(declare-fun m!802919 () Bool)

(assert (=> start!73642 m!802919))

(declare-fun m!802921 () Bool)

(assert (=> b!862399 m!802921))

(declare-fun m!802923 () Bool)

(assert (=> b!862389 m!802923))

(declare-fun m!802925 () Bool)

(assert (=> mapNonEmpty!26666 m!802925))

(declare-fun m!802927 () Bool)

(assert (=> b!862388 m!802927))

(assert (=> b!862388 m!802927))

(declare-fun m!802929 () Bool)

(assert (=> b!862388 m!802929))

(declare-fun m!802931 () Bool)

(assert (=> b!862388 m!802931))

(assert (=> b!862388 m!802931))

(declare-fun m!802933 () Bool)

(assert (=> b!862388 m!802933))

(declare-fun m!802935 () Bool)

(assert (=> b!862393 m!802935))

(declare-fun m!802937 () Bool)

(assert (=> b!862393 m!802937))

(declare-fun m!802939 () Bool)

(assert (=> b!862393 m!802939))

(declare-fun m!802941 () Bool)

(assert (=> b!862393 m!802941))

(declare-fun m!802943 () Bool)

(assert (=> b!862393 m!802943))

(declare-fun m!802945 () Bool)

(assert (=> b!862398 m!802945))

(declare-fun m!802947 () Bool)

(assert (=> b!862398 m!802947))

(declare-fun m!802949 () Bool)

(assert (=> b!862398 m!802949))

(declare-fun m!802951 () Bool)

(assert (=> b!862398 m!802951))

(assert (=> b!862398 m!802947))

(assert (=> b!862398 m!802931))

(assert (=> b!862398 m!802949))

(declare-fun m!802953 () Bool)

(assert (=> b!862391 m!802953))

(declare-fun m!802955 () Bool)

(assert (=> b!862395 m!802955))

(declare-fun m!802957 () Bool)

(assert (=> b!862387 m!802957))

(declare-fun m!802959 () Bool)

(assert (=> b!862387 m!802959))

(declare-fun m!802961 () Bool)

(assert (=> b!862387 m!802961))

(declare-fun m!802963 () Bool)

(assert (=> b!862386 m!802963))

(declare-fun m!802965 () Bool)

(assert (=> b!862400 m!802965))

(assert (=> b!862400 m!802931))

(declare-fun m!802967 () Bool)

(assert (=> b!862400 m!802967))

(assert (=> b!862400 m!802931))

(declare-fun m!802969 () Bool)

(assert (=> b!862400 m!802969))

(declare-fun m!802971 () Bool)

(assert (=> b!862400 m!802971))

(declare-fun m!802973 () Bool)

(assert (=> b!862400 m!802973))

(check-sat (not mapNonEmpty!26666) (not b!862400) (not b!862389) (not b!862391) (not b!862399) (not b_lambda!11909) b_and!24105 (not b!862388) (not start!73642) (not b!862398) (not b!862387) (not b!862393) tp_is_empty!16711 (not b_next!14575) (not b!862395))
(check-sat b_and!24105 (not b_next!14575))
