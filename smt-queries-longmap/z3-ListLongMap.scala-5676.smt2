; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74008 () Bool)

(assert start!74008)

(declare-fun b_free!14755 () Bool)

(declare-fun b_next!14755 () Bool)

(assert (=> start!74008 (= b_free!14755 (not b_next!14755))))

(declare-fun tp!51770 () Bool)

(declare-fun b_and!24499 () Bool)

(assert (=> start!74008 (= tp!51770 b_and!24499)))

(declare-fun b!868028 () Bool)

(declare-fun e!483604 () Bool)

(declare-fun e!483601 () Bool)

(declare-fun mapRes!26936 () Bool)

(assert (=> b!868028 (= e!483604 (and e!483601 mapRes!26936))))

(declare-fun condMapEmpty!26936 () Bool)

(declare-datatypes ((V!27569 0))(
  ( (V!27570 (val!8493 Int)) )
))
(declare-datatypes ((ValueCell!8006 0))(
  ( (ValueCellFull!8006 (v!10918 V!27569)) (EmptyCell!8006) )
))
(declare-datatypes ((array!49991 0))(
  ( (array!49992 (arr!24022 (Array (_ BitVec 32) ValueCell!8006)) (size!24463 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49991)

(declare-fun mapDefault!26936 () ValueCell!8006)

(assert (=> b!868028 (= condMapEmpty!26936 (= (arr!24022 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8006)) mapDefault!26936)))))

(declare-fun b!868029 () Bool)

(declare-fun res!589503 () Bool)

(declare-fun e!483599 () Bool)

(assert (=> b!868029 (=> (not res!589503) (not e!483599))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49993 0))(
  ( (array!49994 (arr!24023 (Array (_ BitVec 32) (_ BitVec 64))) (size!24464 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49993)

(assert (=> b!868029 (= res!589503 (and (= (size!24463 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24464 _keys!868) (size!24463 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!868030 () Bool)

(declare-fun res!589507 () Bool)

(assert (=> b!868030 (=> (not res!589507) (not e!483599))))

(declare-datatypes ((List!17017 0))(
  ( (Nil!17014) (Cons!17013 (h!18150 (_ BitVec 64)) (t!24030 List!17017)) )
))
(declare-fun arrayNoDuplicates!0 (array!49993 (_ BitVec 32) List!17017) Bool)

(assert (=> b!868030 (= res!589507 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17014))))

(declare-fun b!868031 () Bool)

(declare-datatypes ((Unit!29734 0))(
  ( (Unit!29735) )
))
(declare-fun e!483603 () Unit!29734)

(declare-fun Unit!29736 () Unit!29734)

(assert (=> b!868031 (= e!483603 Unit!29736)))

(declare-fun lt!394141 () Unit!29734)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49993 (_ BitVec 32) (_ BitVec 32)) Unit!29734)

(assert (=> b!868031 (= lt!394141 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!868031 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17014)))

(declare-fun lt!394139 () Unit!29734)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49993 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29734)

(assert (=> b!868031 (= lt!394139 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!868031 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!394130 () Unit!29734)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49993 (_ BitVec 64) (_ BitVec 32) List!17017) Unit!29734)

(assert (=> b!868031 (= lt!394130 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17014))))

(assert (=> b!868031 false))

(declare-fun b!868032 () Bool)

(declare-fun e!483600 () Bool)

(declare-fun tp_is_empty!16891 () Bool)

(assert (=> b!868032 (= e!483600 tp_is_empty!16891)))

(declare-fun b!868033 () Bool)

(declare-fun res!589502 () Bool)

(assert (=> b!868033 (=> (not res!589502) (not e!483599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868033 (= res!589502 (validMask!0 mask!1196))))

(declare-fun b!868034 () Bool)

(declare-fun res!589508 () Bool)

(assert (=> b!868034 (=> (not res!589508) (not e!483599))))

(assert (=> b!868034 (= res!589508 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24464 _keys!868))))))

(declare-fun mapNonEmpty!26936 () Bool)

(declare-fun tp!51769 () Bool)

(assert (=> mapNonEmpty!26936 (= mapRes!26936 (and tp!51769 e!483600))))

(declare-fun mapValue!26936 () ValueCell!8006)

(declare-fun mapKey!26936 () (_ BitVec 32))

(declare-fun mapRest!26936 () (Array (_ BitVec 32) ValueCell!8006))

(assert (=> mapNonEmpty!26936 (= (arr!24022 _values!688) (store mapRest!26936 mapKey!26936 mapValue!26936))))

(declare-fun b!868035 () Bool)

(declare-fun e!483606 () Bool)

(declare-fun e!483607 () Bool)

(assert (=> b!868035 (= e!483606 (not e!483607))))

(declare-fun res!589506 () Bool)

(assert (=> b!868035 (=> res!589506 e!483607)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868035 (= res!589506 (not (validKeyInArray!0 (select (arr!24023 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11190 0))(
  ( (tuple2!11191 (_1!5606 (_ BitVec 64)) (_2!5606 V!27569)) )
))
(declare-datatypes ((List!17018 0))(
  ( (Nil!17015) (Cons!17014 (h!18151 tuple2!11190) (t!24031 List!17018)) )
))
(declare-datatypes ((ListLongMap!9961 0))(
  ( (ListLongMap!9962 (toList!4996 List!17018)) )
))
(declare-fun lt!394131 () ListLongMap!9961)

(declare-fun lt!394137 () ListLongMap!9961)

(assert (=> b!868035 (= lt!394131 lt!394137)))

(declare-fun lt!394144 () ListLongMap!9961)

(declare-fun lt!394142 () tuple2!11190)

(declare-fun +!2399 (ListLongMap!9961 tuple2!11190) ListLongMap!9961)

(assert (=> b!868035 (= lt!394137 (+!2399 lt!394144 lt!394142))))

(declare-fun lt!394138 () array!49991)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27569)

(declare-fun zeroValue!654 () V!27569)

(declare-fun getCurrentListMapNoExtraKeys!3040 (array!49993 array!49991 (_ BitVec 32) (_ BitVec 32) V!27569 V!27569 (_ BitVec 32) Int) ListLongMap!9961)

(assert (=> b!868035 (= lt!394131 (getCurrentListMapNoExtraKeys!3040 _keys!868 lt!394138 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27569)

(assert (=> b!868035 (= lt!394142 (tuple2!11191 k0!854 v!557))))

(assert (=> b!868035 (= lt!394144 (getCurrentListMapNoExtraKeys!3040 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!394133 () Unit!29734)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!572 (array!49993 array!49991 (_ BitVec 32) (_ BitVec 32) V!27569 V!27569 (_ BitVec 32) (_ BitVec 64) V!27569 (_ BitVec 32) Int) Unit!29734)

(assert (=> b!868035 (= lt!394133 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!572 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868036 () Bool)

(declare-fun Unit!29737 () Unit!29734)

(assert (=> b!868036 (= e!483603 Unit!29737)))

(declare-fun b!868037 () Bool)

(declare-fun e!483605 () Bool)

(assert (=> b!868037 (= e!483605 true)))

(declare-fun lt!394132 () tuple2!11190)

(declare-fun lt!394134 () ListLongMap!9961)

(assert (=> b!868037 (= lt!394134 (+!2399 (+!2399 lt!394144 lt!394132) lt!394142))))

(declare-fun lt!394143 () V!27569)

(declare-fun lt!394136 () Unit!29734)

(declare-fun addCommutativeForDiffKeys!540 (ListLongMap!9961 (_ BitVec 64) V!27569 (_ BitVec 64) V!27569) Unit!29734)

(assert (=> b!868037 (= lt!394136 (addCommutativeForDiffKeys!540 lt!394144 k0!854 v!557 (select (arr!24023 _keys!868) from!1053) lt!394143))))

(declare-fun mapIsEmpty!26936 () Bool)

(assert (=> mapIsEmpty!26936 mapRes!26936))

(declare-fun res!589509 () Bool)

(assert (=> start!74008 (=> (not res!589509) (not e!483599))))

(assert (=> start!74008 (= res!589509 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24464 _keys!868))))))

(assert (=> start!74008 e!483599))

(assert (=> start!74008 tp_is_empty!16891))

(assert (=> start!74008 true))

(assert (=> start!74008 tp!51770))

(declare-fun array_inv!19038 (array!49993) Bool)

(assert (=> start!74008 (array_inv!19038 _keys!868)))

(declare-fun array_inv!19039 (array!49991) Bool)

(assert (=> start!74008 (and (array_inv!19039 _values!688) e!483604)))

(declare-fun b!868038 () Bool)

(declare-fun res!589501 () Bool)

(assert (=> b!868038 (=> (not res!589501) (not e!483599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49993 (_ BitVec 32)) Bool)

(assert (=> b!868038 (= res!589501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868039 () Bool)

(assert (=> b!868039 (= e!483601 tp_is_empty!16891)))

(declare-fun b!868040 () Bool)

(declare-fun res!589505 () Bool)

(assert (=> b!868040 (=> (not res!589505) (not e!483599))))

(assert (=> b!868040 (= res!589505 (validKeyInArray!0 k0!854))))

(declare-fun b!868041 () Bool)

(assert (=> b!868041 (= e!483607 e!483605)))

(declare-fun res!589504 () Bool)

(assert (=> b!868041 (=> res!589504 e!483605)))

(assert (=> b!868041 (= res!589504 (= k0!854 (select (arr!24023 _keys!868) from!1053)))))

(assert (=> b!868041 (not (= (select (arr!24023 _keys!868) from!1053) k0!854))))

(declare-fun lt!394135 () Unit!29734)

(assert (=> b!868041 (= lt!394135 e!483603)))

(declare-fun c!92635 () Bool)

(assert (=> b!868041 (= c!92635 (= (select (arr!24023 _keys!868) from!1053) k0!854))))

(declare-fun lt!394145 () ListLongMap!9961)

(assert (=> b!868041 (= lt!394145 lt!394134)))

(assert (=> b!868041 (= lt!394134 (+!2399 lt!394137 lt!394132))))

(assert (=> b!868041 (= lt!394132 (tuple2!11191 (select (arr!24023 _keys!868) from!1053) lt!394143))))

(declare-fun get!12720 (ValueCell!8006 V!27569) V!27569)

(declare-fun dynLambda!1218 (Int (_ BitVec 64)) V!27569)

(assert (=> b!868041 (= lt!394143 (get!12720 (select (arr!24022 _values!688) from!1053) (dynLambda!1218 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!868042 () Bool)

(declare-fun res!589500 () Bool)

(assert (=> b!868042 (=> (not res!589500) (not e!483599))))

(assert (=> b!868042 (= res!589500 (and (= (select (arr!24023 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!868043 () Bool)

(assert (=> b!868043 (= e!483599 e!483606)))

(declare-fun res!589510 () Bool)

(assert (=> b!868043 (=> (not res!589510) (not e!483606))))

(assert (=> b!868043 (= res!589510 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!868043 (= lt!394145 (getCurrentListMapNoExtraKeys!3040 _keys!868 lt!394138 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!868043 (= lt!394138 (array!49992 (store (arr!24022 _values!688) i!612 (ValueCellFull!8006 v!557)) (size!24463 _values!688)))))

(declare-fun lt!394140 () ListLongMap!9961)

(assert (=> b!868043 (= lt!394140 (getCurrentListMapNoExtraKeys!3040 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74008 res!589509) b!868033))

(assert (= (and b!868033 res!589502) b!868029))

(assert (= (and b!868029 res!589503) b!868038))

(assert (= (and b!868038 res!589501) b!868030))

(assert (= (and b!868030 res!589507) b!868034))

(assert (= (and b!868034 res!589508) b!868040))

(assert (= (and b!868040 res!589505) b!868042))

(assert (= (and b!868042 res!589500) b!868043))

(assert (= (and b!868043 res!589510) b!868035))

(assert (= (and b!868035 (not res!589506)) b!868041))

(assert (= (and b!868041 c!92635) b!868031))

(assert (= (and b!868041 (not c!92635)) b!868036))

(assert (= (and b!868041 (not res!589504)) b!868037))

(assert (= (and b!868028 condMapEmpty!26936) mapIsEmpty!26936))

(assert (= (and b!868028 (not condMapEmpty!26936)) mapNonEmpty!26936))

(get-info :version)

(assert (= (and mapNonEmpty!26936 ((_ is ValueCellFull!8006) mapValue!26936)) b!868032))

(assert (= (and b!868028 ((_ is ValueCellFull!8006) mapDefault!26936)) b!868039))

(assert (= start!74008 b!868028))

(declare-fun b_lambda!12121 () Bool)

(assert (=> (not b_lambda!12121) (not b!868041)))

(declare-fun t!24029 () Bool)

(declare-fun tb!4869 () Bool)

(assert (=> (and start!74008 (= defaultEntry!696 defaultEntry!696) t!24029) tb!4869))

(declare-fun result!9357 () Bool)

(assert (=> tb!4869 (= result!9357 tp_is_empty!16891)))

(assert (=> b!868041 t!24029))

(declare-fun b_and!24501 () Bool)

(assert (= b_and!24499 (and (=> t!24029 result!9357) b_and!24501)))

(declare-fun m!810185 () Bool)

(assert (=> start!74008 m!810185))

(declare-fun m!810187 () Bool)

(assert (=> start!74008 m!810187))

(declare-fun m!810189 () Bool)

(assert (=> b!868031 m!810189))

(declare-fun m!810191 () Bool)

(assert (=> b!868031 m!810191))

(declare-fun m!810193 () Bool)

(assert (=> b!868031 m!810193))

(declare-fun m!810195 () Bool)

(assert (=> b!868031 m!810195))

(declare-fun m!810197 () Bool)

(assert (=> b!868031 m!810197))

(declare-fun m!810199 () Bool)

(assert (=> b!868037 m!810199))

(assert (=> b!868037 m!810199))

(declare-fun m!810201 () Bool)

(assert (=> b!868037 m!810201))

(declare-fun m!810203 () Bool)

(assert (=> b!868037 m!810203))

(assert (=> b!868037 m!810203))

(declare-fun m!810205 () Bool)

(assert (=> b!868037 m!810205))

(declare-fun m!810207 () Bool)

(assert (=> b!868033 m!810207))

(declare-fun m!810209 () Bool)

(assert (=> b!868040 m!810209))

(declare-fun m!810211 () Bool)

(assert (=> mapNonEmpty!26936 m!810211))

(declare-fun m!810213 () Bool)

(assert (=> b!868041 m!810213))

(declare-fun m!810215 () Bool)

(assert (=> b!868041 m!810215))

(declare-fun m!810217 () Bool)

(assert (=> b!868041 m!810217))

(declare-fun m!810219 () Bool)

(assert (=> b!868041 m!810219))

(assert (=> b!868041 m!810215))

(assert (=> b!868041 m!810203))

(assert (=> b!868041 m!810217))

(declare-fun m!810221 () Bool)

(assert (=> b!868030 m!810221))

(declare-fun m!810223 () Bool)

(assert (=> b!868042 m!810223))

(declare-fun m!810225 () Bool)

(assert (=> b!868038 m!810225))

(declare-fun m!810227 () Bool)

(assert (=> b!868043 m!810227))

(declare-fun m!810229 () Bool)

(assert (=> b!868043 m!810229))

(declare-fun m!810231 () Bool)

(assert (=> b!868043 m!810231))

(declare-fun m!810233 () Bool)

(assert (=> b!868035 m!810233))

(assert (=> b!868035 m!810203))

(declare-fun m!810235 () Bool)

(assert (=> b!868035 m!810235))

(assert (=> b!868035 m!810203))

(declare-fun m!810237 () Bool)

(assert (=> b!868035 m!810237))

(declare-fun m!810239 () Bool)

(assert (=> b!868035 m!810239))

(declare-fun m!810241 () Bool)

(assert (=> b!868035 m!810241))

(check-sat (not b!868041) (not b!868040) (not b!868043) b_and!24501 (not b_next!14755) (not b!868031) (not b!868038) (not start!74008) (not b_lambda!12121) (not b!868033) (not b!868035) tp_is_empty!16891 (not mapNonEmpty!26936) (not b!868037) (not b!868030))
(check-sat b_and!24501 (not b_next!14755))
