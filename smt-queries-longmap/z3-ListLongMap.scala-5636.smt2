; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73582 () Bool)

(assert start!73582)

(declare-fun b_free!14515 () Bool)

(declare-fun b_next!14515 () Bool)

(assert (=> start!73582 (= b_free!14515 (not b_next!14515))))

(declare-fun tp!51050 () Bool)

(declare-fun b_and!23983 () Bool)

(assert (=> start!73582 (= tp!51050 b_and!23983)))

(declare-fun b!860947 () Bool)

(declare-fun res!585147 () Bool)

(declare-fun e!479692 () Bool)

(assert (=> b!860947 (=> (not res!585147) (not e!479692))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49459 0))(
  ( (array!49460 (arr!23761 (Array (_ BitVec 32) (_ BitVec 64))) (size!24203 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49459)

(assert (=> b!860947 (= res!585147 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24203 _keys!868))))))

(declare-fun b!860948 () Bool)

(declare-fun e!479696 () Bool)

(declare-fun tp_is_empty!16651 () Bool)

(assert (=> b!860948 (= e!479696 tp_is_empty!16651)))

(declare-fun b!860949 () Bool)

(declare-fun e!479690 () Bool)

(assert (=> b!860949 (= e!479690 true)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!860949 (not (= (select (arr!23761 _keys!868) from!1053) k0!854))))

(declare-datatypes ((Unit!29293 0))(
  ( (Unit!29294) )
))
(declare-fun lt!388086 () Unit!29293)

(declare-fun e!479691 () Unit!29293)

(assert (=> b!860949 (= lt!388086 e!479691)))

(declare-fun c!91928 () Bool)

(assert (=> b!860949 (= c!91928 (= (select (arr!23761 _keys!868) from!1053) k0!854))))

(declare-datatypes ((V!27249 0))(
  ( (V!27250 (val!8373 Int)) )
))
(declare-datatypes ((tuple2!11076 0))(
  ( (tuple2!11077 (_1!5549 (_ BitVec 64)) (_2!5549 V!27249)) )
))
(declare-datatypes ((List!16875 0))(
  ( (Nil!16872) (Cons!16871 (h!18002 tuple2!11076) (t!23647 List!16875)) )
))
(declare-datatypes ((ListLongMap!9835 0))(
  ( (ListLongMap!9836 (toList!4933 List!16875)) )
))
(declare-fun lt!388084 () ListLongMap!9835)

(declare-fun lt!388081 () ListLongMap!9835)

(declare-datatypes ((ValueCell!7886 0))(
  ( (ValueCellFull!7886 (v!10792 V!27249)) (EmptyCell!7886) )
))
(declare-datatypes ((array!49461 0))(
  ( (array!49462 (arr!23762 (Array (_ BitVec 32) ValueCell!7886)) (size!24204 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49461)

(declare-fun defaultEntry!696 () Int)

(declare-fun +!2305 (ListLongMap!9835 tuple2!11076) ListLongMap!9835)

(declare-fun get!12535 (ValueCell!7886 V!27249) V!27249)

(declare-fun dynLambda!1116 (Int (_ BitVec 64)) V!27249)

(assert (=> b!860949 (= lt!388084 (+!2305 lt!388081 (tuple2!11077 (select (arr!23761 _keys!868) from!1053) (get!12535 (select (arr!23762 _values!688) from!1053) (dynLambda!1116 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860950 () Bool)

(declare-fun res!585149 () Bool)

(assert (=> b!860950 (=> (not res!585149) (not e!479692))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49459 (_ BitVec 32)) Bool)

(assert (=> b!860950 (= res!585149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860951 () Bool)

(declare-fun Unit!29295 () Unit!29293)

(assert (=> b!860951 (= e!479691 Unit!29295)))

(declare-fun lt!388082 () Unit!29293)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49459 (_ BitVec 32) (_ BitVec 32)) Unit!29293)

(assert (=> b!860951 (= lt!388082 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16876 0))(
  ( (Nil!16873) (Cons!16872 (h!18003 (_ BitVec 64)) (t!23648 List!16876)) )
))
(declare-fun arrayNoDuplicates!0 (array!49459 (_ BitVec 32) List!16876) Bool)

(assert (=> b!860951 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16873)))

(declare-fun lt!388083 () Unit!29293)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49459 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29293)

(assert (=> b!860951 (= lt!388083 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860951 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388080 () Unit!29293)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49459 (_ BitVec 64) (_ BitVec 32) List!16876) Unit!29293)

(assert (=> b!860951 (= lt!388080 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16873))))

(assert (=> b!860951 false))

(declare-fun b!860952 () Bool)

(declare-fun Unit!29296 () Unit!29293)

(assert (=> b!860952 (= e!479691 Unit!29296)))

(declare-fun b!860953 () Bool)

(declare-fun res!585155 () Bool)

(assert (=> b!860953 (=> (not res!585155) (not e!479692))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!860953 (= res!585155 (and (= (size!24204 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24203 _keys!868) (size!24204 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!585153 () Bool)

(assert (=> start!73582 (=> (not res!585153) (not e!479692))))

(assert (=> start!73582 (= res!585153 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24203 _keys!868))))))

(assert (=> start!73582 e!479692))

(assert (=> start!73582 tp_is_empty!16651))

(assert (=> start!73582 true))

(assert (=> start!73582 tp!51050))

(declare-fun array_inv!18874 (array!49459) Bool)

(assert (=> start!73582 (array_inv!18874 _keys!868)))

(declare-fun e!479695 () Bool)

(declare-fun array_inv!18875 (array!49461) Bool)

(assert (=> start!73582 (and (array_inv!18875 _values!688) e!479695)))

(declare-fun b!860954 () Bool)

(declare-fun mapRes!26576 () Bool)

(assert (=> b!860954 (= e!479695 (and e!479696 mapRes!26576))))

(declare-fun condMapEmpty!26576 () Bool)

(declare-fun mapDefault!26576 () ValueCell!7886)

(assert (=> b!860954 (= condMapEmpty!26576 (= (arr!23762 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7886)) mapDefault!26576)))))

(declare-fun b!860955 () Bool)

(declare-fun e!479694 () Bool)

(assert (=> b!860955 (= e!479694 tp_is_empty!16651)))

(declare-fun b!860956 () Bool)

(declare-fun res!585151 () Bool)

(assert (=> b!860956 (=> (not res!585151) (not e!479692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860956 (= res!585151 (validKeyInArray!0 k0!854))))

(declare-fun b!860957 () Bool)

(declare-fun e!479697 () Bool)

(assert (=> b!860957 (= e!479697 (not e!479690))))

(declare-fun res!585148 () Bool)

(assert (=> b!860957 (=> res!585148 e!479690)))

(assert (=> b!860957 (= res!585148 (not (validKeyInArray!0 (select (arr!23761 _keys!868) from!1053))))))

(declare-fun lt!388088 () ListLongMap!9835)

(assert (=> b!860957 (= lt!388088 lt!388081)))

(declare-fun v!557 () V!27249)

(declare-fun lt!388087 () ListLongMap!9835)

(assert (=> b!860957 (= lt!388081 (+!2305 lt!388087 (tuple2!11077 k0!854 v!557)))))

(declare-fun lt!388079 () array!49461)

(declare-fun minValue!654 () V!27249)

(declare-fun zeroValue!654 () V!27249)

(declare-fun getCurrentListMapNoExtraKeys!2936 (array!49459 array!49461 (_ BitVec 32) (_ BitVec 32) V!27249 V!27249 (_ BitVec 32) Int) ListLongMap!9835)

(assert (=> b!860957 (= lt!388088 (getCurrentListMapNoExtraKeys!2936 _keys!868 lt!388079 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860957 (= lt!388087 (getCurrentListMapNoExtraKeys!2936 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388078 () Unit!29293)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!495 (array!49459 array!49461 (_ BitVec 32) (_ BitVec 32) V!27249 V!27249 (_ BitVec 32) (_ BitVec 64) V!27249 (_ BitVec 32) Int) Unit!29293)

(assert (=> b!860957 (= lt!388078 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!495 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26576 () Bool)

(declare-fun tp!51049 () Bool)

(assert (=> mapNonEmpty!26576 (= mapRes!26576 (and tp!51049 e!479694))))

(declare-fun mapRest!26576 () (Array (_ BitVec 32) ValueCell!7886))

(declare-fun mapValue!26576 () ValueCell!7886)

(declare-fun mapKey!26576 () (_ BitVec 32))

(assert (=> mapNonEmpty!26576 (= (arr!23762 _values!688) (store mapRest!26576 mapKey!26576 mapValue!26576))))

(declare-fun b!860958 () Bool)

(declare-fun res!585156 () Bool)

(assert (=> b!860958 (=> (not res!585156) (not e!479692))))

(assert (=> b!860958 (= res!585156 (and (= (select (arr!23761 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860959 () Bool)

(declare-fun res!585154 () Bool)

(assert (=> b!860959 (=> (not res!585154) (not e!479692))))

(assert (=> b!860959 (= res!585154 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16873))))

(declare-fun mapIsEmpty!26576 () Bool)

(assert (=> mapIsEmpty!26576 mapRes!26576))

(declare-fun b!860960 () Bool)

(declare-fun res!585150 () Bool)

(assert (=> b!860960 (=> (not res!585150) (not e!479692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860960 (= res!585150 (validMask!0 mask!1196))))

(declare-fun b!860961 () Bool)

(assert (=> b!860961 (= e!479692 e!479697)))

(declare-fun res!585152 () Bool)

(assert (=> b!860961 (=> (not res!585152) (not e!479697))))

(assert (=> b!860961 (= res!585152 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!860961 (= lt!388084 (getCurrentListMapNoExtraKeys!2936 _keys!868 lt!388079 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!860961 (= lt!388079 (array!49462 (store (arr!23762 _values!688) i!612 (ValueCellFull!7886 v!557)) (size!24204 _values!688)))))

(declare-fun lt!388085 () ListLongMap!9835)

(assert (=> b!860961 (= lt!388085 (getCurrentListMapNoExtraKeys!2936 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73582 res!585153) b!860960))

(assert (= (and b!860960 res!585150) b!860953))

(assert (= (and b!860953 res!585155) b!860950))

(assert (= (and b!860950 res!585149) b!860959))

(assert (= (and b!860959 res!585154) b!860947))

(assert (= (and b!860947 res!585147) b!860956))

(assert (= (and b!860956 res!585151) b!860958))

(assert (= (and b!860958 res!585156) b!860961))

(assert (= (and b!860961 res!585152) b!860957))

(assert (= (and b!860957 (not res!585148)) b!860949))

(assert (= (and b!860949 c!91928) b!860951))

(assert (= (and b!860949 (not c!91928)) b!860952))

(assert (= (and b!860954 condMapEmpty!26576) mapIsEmpty!26576))

(assert (= (and b!860954 (not condMapEmpty!26576)) mapNonEmpty!26576))

(get-info :version)

(assert (= (and mapNonEmpty!26576 ((_ is ValueCellFull!7886) mapValue!26576)) b!860955))

(assert (= (and b!860954 ((_ is ValueCellFull!7886) mapDefault!26576)) b!860948))

(assert (= start!73582 b!860954))

(declare-fun b_lambda!11849 () Bool)

(assert (=> (not b_lambda!11849) (not b!860949)))

(declare-fun t!23646 () Bool)

(declare-fun tb!4629 () Bool)

(assert (=> (and start!73582 (= defaultEntry!696 defaultEntry!696) t!23646) tb!4629))

(declare-fun result!8877 () Bool)

(assert (=> tb!4629 (= result!8877 tp_is_empty!16651)))

(assert (=> b!860949 t!23646))

(declare-fun b_and!23985 () Bool)

(assert (= b_and!23983 (and (=> t!23646 result!8877) b_and!23985)))

(declare-fun m!801303 () Bool)

(assert (=> b!860951 m!801303))

(declare-fun m!801305 () Bool)

(assert (=> b!860951 m!801305))

(declare-fun m!801307 () Bool)

(assert (=> b!860951 m!801307))

(declare-fun m!801309 () Bool)

(assert (=> b!860951 m!801309))

(declare-fun m!801311 () Bool)

(assert (=> b!860951 m!801311))

(declare-fun m!801313 () Bool)

(assert (=> b!860956 m!801313))

(declare-fun m!801315 () Bool)

(assert (=> b!860958 m!801315))

(declare-fun m!801317 () Bool)

(assert (=> mapNonEmpty!26576 m!801317))

(declare-fun m!801319 () Bool)

(assert (=> b!860950 m!801319))

(declare-fun m!801321 () Bool)

(assert (=> start!73582 m!801321))

(declare-fun m!801323 () Bool)

(assert (=> start!73582 m!801323))

(declare-fun m!801325 () Bool)

(assert (=> b!860961 m!801325))

(declare-fun m!801327 () Bool)

(assert (=> b!860961 m!801327))

(declare-fun m!801329 () Bool)

(assert (=> b!860961 m!801329))

(declare-fun m!801331 () Bool)

(assert (=> b!860949 m!801331))

(declare-fun m!801333 () Bool)

(assert (=> b!860949 m!801333))

(declare-fun m!801335 () Bool)

(assert (=> b!860949 m!801335))

(declare-fun m!801337 () Bool)

(assert (=> b!860949 m!801337))

(assert (=> b!860949 m!801333))

(declare-fun m!801339 () Bool)

(assert (=> b!860949 m!801339))

(assert (=> b!860949 m!801335))

(declare-fun m!801341 () Bool)

(assert (=> b!860959 m!801341))

(declare-fun m!801343 () Bool)

(assert (=> b!860957 m!801343))

(assert (=> b!860957 m!801339))

(declare-fun m!801345 () Bool)

(assert (=> b!860957 m!801345))

(assert (=> b!860957 m!801339))

(declare-fun m!801347 () Bool)

(assert (=> b!860957 m!801347))

(declare-fun m!801349 () Bool)

(assert (=> b!860957 m!801349))

(declare-fun m!801351 () Bool)

(assert (=> b!860957 m!801351))

(declare-fun m!801353 () Bool)

(assert (=> b!860960 m!801353))

(check-sat (not b!860951) (not b_next!14515) (not b!860950) (not b!860949) tp_is_empty!16651 (not mapNonEmpty!26576) (not b_lambda!11849) (not start!73582) (not b!860957) (not b!860956) (not b!860961) (not b!860960) b_and!23985 (not b!860959))
(check-sat b_and!23985 (not b_next!14515))
