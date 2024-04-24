; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73330 () Bool)

(assert start!73330)

(declare-fun b_free!14077 () Bool)

(declare-fun b_next!14077 () Bool)

(assert (=> start!73330 (= b_free!14077 (not b_next!14077))))

(declare-fun tp!49736 () Bool)

(declare-fun b_and!23323 () Bool)

(assert (=> start!73330 (= tp!49736 b_and!23323)))

(declare-fun b!852867 () Bool)

(declare-fun e!475768 () Bool)

(declare-fun tp_is_empty!16213 () Bool)

(assert (=> b!852867 (= e!475768 tp_is_empty!16213)))

(declare-fun b!852868 () Bool)

(declare-fun res!579023 () Bool)

(declare-fun e!475771 () Bool)

(assert (=> b!852868 (=> (not res!579023) (not e!475771))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48675 0))(
  ( (array!48676 (arr!23364 (Array (_ BitVec 32) (_ BitVec 64))) (size!23805 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48675)

(declare-datatypes ((V!26665 0))(
  ( (V!26666 (val!8154 Int)) )
))
(declare-datatypes ((ValueCell!7667 0))(
  ( (ValueCellFull!7667 (v!10579 V!26665)) (EmptyCell!7667) )
))
(declare-datatypes ((array!48677 0))(
  ( (array!48678 (arr!23365 (Array (_ BitVec 32) ValueCell!7667)) (size!23806 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48677)

(assert (=> b!852868 (= res!579023 (and (= (size!23806 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23805 _keys!868) (size!23806 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun e!475770 () Bool)

(declare-fun v!557 () V!26665)

(declare-datatypes ((tuple2!10626 0))(
  ( (tuple2!10627 (_1!5324 (_ BitVec 64)) (_2!5324 V!26665)) )
))
(declare-datatypes ((List!16482 0))(
  ( (Nil!16479) (Cons!16478 (h!17615 tuple2!10626) (t!22997 List!16482)) )
))
(declare-datatypes ((ListLongMap!9397 0))(
  ( (ListLongMap!9398 (toList!4714 List!16482)) )
))
(declare-fun call!38132 () ListLongMap!9397)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun call!38131 () ListLongMap!9397)

(declare-fun b!852869 () Bool)

(declare-fun +!2161 (ListLongMap!9397 tuple2!10626) ListLongMap!9397)

(assert (=> b!852869 (= e!475770 (= call!38132 (+!2161 call!38131 (tuple2!10627 k0!854 v!557))))))

(declare-fun b!852870 () Bool)

(declare-fun e!475773 () Bool)

(assert (=> b!852870 (= e!475773 tp_is_empty!16213)))

(declare-fun b!852871 () Bool)

(declare-fun res!579024 () Bool)

(assert (=> b!852871 (=> (not res!579024) (not e!475771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852871 (= res!579024 (validMask!0 mask!1196))))

(declare-fun b!852872 () Bool)

(declare-fun e!475767 () Bool)

(declare-fun e!475774 () Bool)

(assert (=> b!852872 (= e!475767 (not e!475774))))

(declare-fun res!579029 () Bool)

(assert (=> b!852872 (=> res!579029 e!475774)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852872 (= res!579029 (not (validKeyInArray!0 (select (arr!23364 _keys!868) from!1053))))))

(assert (=> b!852872 e!475770))

(declare-fun c!92068 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852872 (= c!92068 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29082 0))(
  ( (Unit!29083) )
))
(declare-fun lt!384159 () Unit!29082)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26665)

(declare-fun zeroValue!654 () V!26665)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!370 (array!48675 array!48677 (_ BitVec 32) (_ BitVec 32) V!26665 V!26665 (_ BitVec 32) (_ BitVec 64) V!26665 (_ BitVec 32) Int) Unit!29082)

(assert (=> b!852872 (= lt!384159 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!370 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852873 () Bool)

(declare-fun res!579028 () Bool)

(assert (=> b!852873 (=> (not res!579028) (not e!475771))))

(assert (=> b!852873 (= res!579028 (and (= (select (arr!23364 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852874 () Bool)

(declare-fun e!475772 () Bool)

(declare-fun mapRes!25919 () Bool)

(assert (=> b!852874 (= e!475772 (and e!475773 mapRes!25919))))

(declare-fun condMapEmpty!25919 () Bool)

(declare-fun mapDefault!25919 () ValueCell!7667)

(assert (=> b!852874 (= condMapEmpty!25919 (= (arr!23365 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7667)) mapDefault!25919)))))

(declare-fun mapNonEmpty!25919 () Bool)

(declare-fun tp!49735 () Bool)

(assert (=> mapNonEmpty!25919 (= mapRes!25919 (and tp!49735 e!475768))))

(declare-fun mapValue!25919 () ValueCell!7667)

(declare-fun mapKey!25919 () (_ BitVec 32))

(declare-fun mapRest!25919 () (Array (_ BitVec 32) ValueCell!7667))

(assert (=> mapNonEmpty!25919 (= (arr!23365 _values!688) (store mapRest!25919 mapKey!25919 mapValue!25919))))

(declare-fun b!852875 () Bool)

(declare-fun res!579031 () Bool)

(assert (=> b!852875 (=> (not res!579031) (not e!475771))))

(declare-datatypes ((List!16483 0))(
  ( (Nil!16480) (Cons!16479 (h!17616 (_ BitVec 64)) (t!22998 List!16483)) )
))
(declare-fun arrayNoDuplicates!0 (array!48675 (_ BitVec 32) List!16483) Bool)

(assert (=> b!852875 (= res!579031 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16480))))

(declare-fun b!852876 () Bool)

(assert (=> b!852876 (= e!475770 (= call!38132 call!38131))))

(declare-fun b!852877 () Bool)

(declare-fun res!579022 () Bool)

(assert (=> b!852877 (=> (not res!579022) (not e!475771))))

(assert (=> b!852877 (= res!579022 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23805 _keys!868))))))

(declare-fun bm!38129 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2772 (array!48675 array!48677 (_ BitVec 32) (_ BitVec 32) V!26665 V!26665 (_ BitVec 32) Int) ListLongMap!9397)

(assert (=> bm!38129 (= call!38131 (getCurrentListMapNoExtraKeys!2772 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25919 () Bool)

(assert (=> mapIsEmpty!25919 mapRes!25919))

(declare-fun lt!384158 () array!48677)

(declare-fun bm!38128 () Bool)

(assert (=> bm!38128 (= call!38132 (getCurrentListMapNoExtraKeys!2772 _keys!868 lt!384158 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!579025 () Bool)

(assert (=> start!73330 (=> (not res!579025) (not e!475771))))

(assert (=> start!73330 (= res!579025 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23805 _keys!868))))))

(assert (=> start!73330 e!475771))

(assert (=> start!73330 tp_is_empty!16213))

(assert (=> start!73330 true))

(assert (=> start!73330 tp!49736))

(declare-fun array_inv!18582 (array!48675) Bool)

(assert (=> start!73330 (array_inv!18582 _keys!868)))

(declare-fun array_inv!18583 (array!48677) Bool)

(assert (=> start!73330 (and (array_inv!18583 _values!688) e!475772)))

(declare-fun b!852878 () Bool)

(declare-fun res!579030 () Bool)

(assert (=> b!852878 (=> (not res!579030) (not e!475771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48675 (_ BitVec 32)) Bool)

(assert (=> b!852878 (= res!579030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852879 () Bool)

(declare-fun res!579026 () Bool)

(assert (=> b!852879 (=> (not res!579026) (not e!475771))))

(assert (=> b!852879 (= res!579026 (validKeyInArray!0 k0!854))))

(declare-fun b!852880 () Bool)

(assert (=> b!852880 (= e!475774 true)))

(declare-fun lt!384157 () tuple2!10626)

(declare-fun lt!384162 () V!26665)

(declare-fun lt!384160 () ListLongMap!9397)

(assert (=> b!852880 (= (+!2161 lt!384160 lt!384157) (+!2161 (+!2161 lt!384160 (tuple2!10627 k0!854 lt!384162)) lt!384157))))

(declare-fun lt!384156 () V!26665)

(assert (=> b!852880 (= lt!384157 (tuple2!10627 k0!854 lt!384156))))

(declare-fun lt!384161 () Unit!29082)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!289 (ListLongMap!9397 (_ BitVec 64) V!26665 V!26665) Unit!29082)

(assert (=> b!852880 (= lt!384161 (addSameAsAddTwiceSameKeyDiffValues!289 lt!384160 k0!854 lt!384162 lt!384156))))

(declare-fun lt!384155 () V!26665)

(declare-fun get!12312 (ValueCell!7667 V!26665) V!26665)

(assert (=> b!852880 (= lt!384162 (get!12312 (select (arr!23365 _values!688) from!1053) lt!384155))))

(declare-fun lt!384163 () ListLongMap!9397)

(assert (=> b!852880 (= lt!384163 (+!2161 lt!384160 (tuple2!10627 (select (arr!23364 _keys!868) from!1053) lt!384156)))))

(assert (=> b!852880 (= lt!384156 (get!12312 (select (store (arr!23365 _values!688) i!612 (ValueCellFull!7667 v!557)) from!1053) lt!384155))))

(declare-fun dynLambda!1036 (Int (_ BitVec 64)) V!26665)

(assert (=> b!852880 (= lt!384155 (dynLambda!1036 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852880 (= lt!384160 (getCurrentListMapNoExtraKeys!2772 _keys!868 lt!384158 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852881 () Bool)

(assert (=> b!852881 (= e!475771 e!475767)))

(declare-fun res!579027 () Bool)

(assert (=> b!852881 (=> (not res!579027) (not e!475767))))

(assert (=> b!852881 (= res!579027 (= from!1053 i!612))))

(assert (=> b!852881 (= lt!384163 (getCurrentListMapNoExtraKeys!2772 _keys!868 lt!384158 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852881 (= lt!384158 (array!48678 (store (arr!23365 _values!688) i!612 (ValueCellFull!7667 v!557)) (size!23806 _values!688)))))

(declare-fun lt!384164 () ListLongMap!9397)

(assert (=> b!852881 (= lt!384164 (getCurrentListMapNoExtraKeys!2772 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73330 res!579025) b!852871))

(assert (= (and b!852871 res!579024) b!852868))

(assert (= (and b!852868 res!579023) b!852878))

(assert (= (and b!852878 res!579030) b!852875))

(assert (= (and b!852875 res!579031) b!852877))

(assert (= (and b!852877 res!579022) b!852879))

(assert (= (and b!852879 res!579026) b!852873))

(assert (= (and b!852873 res!579028) b!852881))

(assert (= (and b!852881 res!579027) b!852872))

(assert (= (and b!852872 c!92068) b!852869))

(assert (= (and b!852872 (not c!92068)) b!852876))

(assert (= (or b!852869 b!852876) bm!38128))

(assert (= (or b!852869 b!852876) bm!38129))

(assert (= (and b!852872 (not res!579029)) b!852880))

(assert (= (and b!852874 condMapEmpty!25919) mapIsEmpty!25919))

(assert (= (and b!852874 (not condMapEmpty!25919)) mapNonEmpty!25919))

(get-info :version)

(assert (= (and mapNonEmpty!25919 ((_ is ValueCellFull!7667) mapValue!25919)) b!852867))

(assert (= (and b!852874 ((_ is ValueCellFull!7667) mapDefault!25919)) b!852870))

(assert (= start!73330 b!852874))

(declare-fun b_lambda!11623 () Bool)

(assert (=> (not b_lambda!11623) (not b!852880)))

(declare-fun t!22996 () Bool)

(declare-fun tb!4371 () Bool)

(assert (=> (and start!73330 (= defaultEntry!696 defaultEntry!696) t!22996) tb!4371))

(declare-fun result!8361 () Bool)

(assert (=> tb!4371 (= result!8361 tp_is_empty!16213)))

(assert (=> b!852880 t!22996))

(declare-fun b_and!23325 () Bool)

(assert (= b_and!23323 (and (=> t!22996 result!8361) b_and!23325)))

(declare-fun m!794245 () Bool)

(assert (=> b!852869 m!794245))

(declare-fun m!794247 () Bool)

(assert (=> b!852872 m!794247))

(assert (=> b!852872 m!794247))

(declare-fun m!794249 () Bool)

(assert (=> b!852872 m!794249))

(declare-fun m!794251 () Bool)

(assert (=> b!852872 m!794251))

(declare-fun m!794253 () Bool)

(assert (=> b!852880 m!794253))

(declare-fun m!794255 () Bool)

(assert (=> b!852880 m!794255))

(assert (=> b!852880 m!794253))

(declare-fun m!794257 () Bool)

(assert (=> b!852880 m!794257))

(declare-fun m!794259 () Bool)

(assert (=> b!852880 m!794259))

(declare-fun m!794261 () Bool)

(assert (=> b!852880 m!794261))

(declare-fun m!794263 () Bool)

(assert (=> b!852880 m!794263))

(declare-fun m!794265 () Bool)

(assert (=> b!852880 m!794265))

(declare-fun m!794267 () Bool)

(assert (=> b!852880 m!794267))

(declare-fun m!794269 () Bool)

(assert (=> b!852880 m!794269))

(assert (=> b!852880 m!794255))

(declare-fun m!794271 () Bool)

(assert (=> b!852880 m!794271))

(assert (=> b!852880 m!794247))

(declare-fun m!794273 () Bool)

(assert (=> b!852880 m!794273))

(declare-fun m!794275 () Bool)

(assert (=> b!852880 m!794275))

(assert (=> b!852880 m!794261))

(declare-fun m!794277 () Bool)

(assert (=> b!852873 m!794277))

(declare-fun m!794279 () Bool)

(assert (=> mapNonEmpty!25919 m!794279))

(declare-fun m!794281 () Bool)

(assert (=> b!852879 m!794281))

(declare-fun m!794283 () Bool)

(assert (=> start!73330 m!794283))

(declare-fun m!794285 () Bool)

(assert (=> start!73330 m!794285))

(assert (=> bm!38128 m!794265))

(declare-fun m!794287 () Bool)

(assert (=> b!852878 m!794287))

(declare-fun m!794289 () Bool)

(assert (=> b!852871 m!794289))

(declare-fun m!794291 () Bool)

(assert (=> b!852881 m!794291))

(assert (=> b!852881 m!794267))

(declare-fun m!794293 () Bool)

(assert (=> b!852881 m!794293))

(declare-fun m!794295 () Bool)

(assert (=> bm!38129 m!794295))

(declare-fun m!794297 () Bool)

(assert (=> b!852875 m!794297))

(check-sat (not bm!38129) b_and!23325 (not b!852875) (not start!73330) (not b_lambda!11623) (not b!852872) (not b!852879) (not b!852880) (not bm!38128) tp_is_empty!16213 (not b!852881) (not b_next!14077) (not b!852869) (not mapNonEmpty!25919) (not b!852871) (not b!852878))
(check-sat b_and!23325 (not b_next!14077))
