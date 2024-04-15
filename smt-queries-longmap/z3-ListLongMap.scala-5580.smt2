; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73246 () Bool)

(assert start!73246)

(declare-fun b_free!14179 () Bool)

(declare-fun b_next!14179 () Bool)

(assert (=> start!73246 (= b_free!14179 (not b_next!14179))))

(declare-fun tp!50042 () Bool)

(declare-fun b_and!23491 () Bool)

(assert (=> start!73246 (= tp!50042 b_and!23491)))

(declare-fun res!580103 () Bool)

(declare-fun e!476265 () Bool)

(assert (=> start!73246 (=> (not res!580103) (not e!476265))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48813 0))(
  ( (array!48814 (arr!23438 (Array (_ BitVec 32) (_ BitVec 64))) (size!23880 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48813)

(assert (=> start!73246 (= res!580103 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23880 _keys!868))))))

(assert (=> start!73246 e!476265))

(declare-fun tp_is_empty!16315 () Bool)

(assert (=> start!73246 tp_is_empty!16315))

(assert (=> start!73246 true))

(assert (=> start!73246 tp!50042))

(declare-fun array_inv!18656 (array!48813) Bool)

(assert (=> start!73246 (array_inv!18656 _keys!868)))

(declare-datatypes ((V!26801 0))(
  ( (V!26802 (val!8205 Int)) )
))
(declare-datatypes ((ValueCell!7718 0))(
  ( (ValueCellFull!7718 (v!10624 V!26801)) (EmptyCell!7718) )
))
(declare-datatypes ((array!48815 0))(
  ( (array!48816 (arr!23439 (Array (_ BitVec 32) ValueCell!7718)) (size!23881 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48815)

(declare-fun e!476266 () Bool)

(declare-fun array_inv!18657 (array!48815) Bool)

(assert (=> start!73246 (and (array_inv!18657 _values!688) e!476266)))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!38363 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26801)

(declare-datatypes ((tuple2!10814 0))(
  ( (tuple2!10815 (_1!5418 (_ BitVec 64)) (_2!5418 V!26801)) )
))
(declare-datatypes ((List!16629 0))(
  ( (Nil!16626) (Cons!16625 (h!17756 tuple2!10814) (t!23245 List!16629)) )
))
(declare-datatypes ((ListLongMap!9573 0))(
  ( (ListLongMap!9574 (toList!4802 List!16629)) )
))
(declare-fun call!38366 () ListLongMap!9573)

(declare-fun zeroValue!654 () V!26801)

(declare-fun getCurrentListMapNoExtraKeys!2809 (array!48813 array!48815 (_ BitVec 32) (_ BitVec 32) V!26801 V!26801 (_ BitVec 32) Int) ListLongMap!9573)

(assert (=> bm!38363 (= call!38366 (getCurrentListMapNoExtraKeys!2809 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854122 () Bool)

(declare-fun res!580098 () Bool)

(assert (=> b!854122 (=> (not res!580098) (not e!476265))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854122 (= res!580098 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26072 () Bool)

(declare-fun mapRes!26072 () Bool)

(assert (=> mapIsEmpty!26072 mapRes!26072))

(declare-fun b!854123 () Bool)

(declare-fun res!580107 () Bool)

(assert (=> b!854123 (=> (not res!580107) (not e!476265))))

(declare-datatypes ((List!16630 0))(
  ( (Nil!16627) (Cons!16626 (h!17757 (_ BitVec 64)) (t!23246 List!16630)) )
))
(declare-fun arrayNoDuplicates!0 (array!48813 (_ BitVec 32) List!16630) Bool)

(assert (=> b!854123 (= res!580107 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16627))))

(declare-fun b!854124 () Bool)

(declare-fun e!476261 () Bool)

(assert (=> b!854124 (= e!476265 e!476261)))

(declare-fun res!580106 () Bool)

(assert (=> b!854124 (=> (not res!580106) (not e!476261))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854124 (= res!580106 (= from!1053 i!612))))

(declare-fun lt!385091 () array!48815)

(declare-fun lt!385096 () ListLongMap!9573)

(assert (=> b!854124 (= lt!385096 (getCurrentListMapNoExtraKeys!2809 _keys!868 lt!385091 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26801)

(assert (=> b!854124 (= lt!385091 (array!48816 (store (arr!23439 _values!688) i!612 (ValueCellFull!7718 v!557)) (size!23881 _values!688)))))

(declare-fun lt!385092 () ListLongMap!9573)

(assert (=> b!854124 (= lt!385092 (getCurrentListMapNoExtraKeys!2809 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26072 () Bool)

(declare-fun tp!50041 () Bool)

(declare-fun e!476267 () Bool)

(assert (=> mapNonEmpty!26072 (= mapRes!26072 (and tp!50041 e!476267))))

(declare-fun mapRest!26072 () (Array (_ BitVec 32) ValueCell!7718))

(declare-fun mapValue!26072 () ValueCell!7718)

(declare-fun mapKey!26072 () (_ BitVec 32))

(assert (=> mapNonEmpty!26072 (= (arr!23439 _values!688) (store mapRest!26072 mapKey!26072 mapValue!26072))))

(declare-fun b!854125 () Bool)

(declare-fun e!476268 () Bool)

(assert (=> b!854125 (= e!476268 tp_is_empty!16315)))

(declare-fun b!854126 () Bool)

(assert (=> b!854126 (= e!476266 (and e!476268 mapRes!26072))))

(declare-fun condMapEmpty!26072 () Bool)

(declare-fun mapDefault!26072 () ValueCell!7718)

(assert (=> b!854126 (= condMapEmpty!26072 (= (arr!23439 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7718)) mapDefault!26072)))))

(declare-fun b!854127 () Bool)

(declare-fun res!580104 () Bool)

(assert (=> b!854127 (=> (not res!580104) (not e!476265))))

(assert (=> b!854127 (= res!580104 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23880 _keys!868))))))

(declare-fun bm!38364 () Bool)

(declare-fun call!38367 () ListLongMap!9573)

(assert (=> bm!38364 (= call!38367 (getCurrentListMapNoExtraKeys!2809 _keys!868 lt!385091 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854128 () Bool)

(declare-fun e!476262 () Bool)

(assert (=> b!854128 (= e!476262 true)))

(declare-fun lt!385095 () V!26801)

(declare-fun lt!385093 () tuple2!10814)

(declare-fun lt!385089 () ListLongMap!9573)

(declare-fun +!2210 (ListLongMap!9573 tuple2!10814) ListLongMap!9573)

(assert (=> b!854128 (= (+!2210 lt!385089 lt!385093) (+!2210 (+!2210 lt!385089 (tuple2!10815 k0!854 lt!385095)) lt!385093))))

(declare-fun lt!385088 () V!26801)

(assert (=> b!854128 (= lt!385093 (tuple2!10815 k0!854 lt!385088))))

(declare-datatypes ((Unit!29095 0))(
  ( (Unit!29096) )
))
(declare-fun lt!385090 () Unit!29095)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!318 (ListLongMap!9573 (_ BitVec 64) V!26801 V!26801) Unit!29095)

(assert (=> b!854128 (= lt!385090 (addSameAsAddTwiceSameKeyDiffValues!318 lt!385089 k0!854 lt!385095 lt!385088))))

(declare-fun lt!385094 () V!26801)

(declare-fun get!12375 (ValueCell!7718 V!26801) V!26801)

(assert (=> b!854128 (= lt!385095 (get!12375 (select (arr!23439 _values!688) from!1053) lt!385094))))

(assert (=> b!854128 (= lt!385096 (+!2210 lt!385089 (tuple2!10815 (select (arr!23438 _keys!868) from!1053) lt!385088)))))

(assert (=> b!854128 (= lt!385088 (get!12375 (select (store (arr!23439 _values!688) i!612 (ValueCellFull!7718 v!557)) from!1053) lt!385094))))

(declare-fun dynLambda!1068 (Int (_ BitVec 64)) V!26801)

(assert (=> b!854128 (= lt!385094 (dynLambda!1068 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854128 (= lt!385089 (getCurrentListMapNoExtraKeys!2809 _keys!868 lt!385091 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854129 () Bool)

(declare-fun e!476264 () Bool)

(assert (=> b!854129 (= e!476264 (= call!38367 (+!2210 call!38366 (tuple2!10815 k0!854 v!557))))))

(declare-fun b!854130 () Bool)

(assert (=> b!854130 (= e!476261 (not e!476262))))

(declare-fun res!580102 () Bool)

(assert (=> b!854130 (=> res!580102 e!476262)))

(assert (=> b!854130 (= res!580102 (not (validKeyInArray!0 (select (arr!23438 _keys!868) from!1053))))))

(assert (=> b!854130 e!476264))

(declare-fun c!91874 () Bool)

(assert (=> b!854130 (= c!91874 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!385097 () Unit!29095)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!411 (array!48813 array!48815 (_ BitVec 32) (_ BitVec 32) V!26801 V!26801 (_ BitVec 32) (_ BitVec 64) V!26801 (_ BitVec 32) Int) Unit!29095)

(assert (=> b!854130 (= lt!385097 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!411 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854131 () Bool)

(declare-fun res!580099 () Bool)

(assert (=> b!854131 (=> (not res!580099) (not e!476265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854131 (= res!580099 (validMask!0 mask!1196))))

(declare-fun b!854132 () Bool)

(assert (=> b!854132 (= e!476264 (= call!38367 call!38366))))

(declare-fun b!854133 () Bool)

(declare-fun res!580101 () Bool)

(assert (=> b!854133 (=> (not res!580101) (not e!476265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48813 (_ BitVec 32)) Bool)

(assert (=> b!854133 (= res!580101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854134 () Bool)

(declare-fun res!580100 () Bool)

(assert (=> b!854134 (=> (not res!580100) (not e!476265))))

(assert (=> b!854134 (= res!580100 (and (= (select (arr!23438 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854135 () Bool)

(declare-fun res!580105 () Bool)

(assert (=> b!854135 (=> (not res!580105) (not e!476265))))

(assert (=> b!854135 (= res!580105 (and (= (size!23881 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23880 _keys!868) (size!23881 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854136 () Bool)

(assert (=> b!854136 (= e!476267 tp_is_empty!16315)))

(assert (= (and start!73246 res!580103) b!854131))

(assert (= (and b!854131 res!580099) b!854135))

(assert (= (and b!854135 res!580105) b!854133))

(assert (= (and b!854133 res!580101) b!854123))

(assert (= (and b!854123 res!580107) b!854127))

(assert (= (and b!854127 res!580104) b!854122))

(assert (= (and b!854122 res!580098) b!854134))

(assert (= (and b!854134 res!580100) b!854124))

(assert (= (and b!854124 res!580106) b!854130))

(assert (= (and b!854130 c!91874) b!854129))

(assert (= (and b!854130 (not c!91874)) b!854132))

(assert (= (or b!854129 b!854132) bm!38363))

(assert (= (or b!854129 b!854132) bm!38364))

(assert (= (and b!854130 (not res!580102)) b!854128))

(assert (= (and b!854126 condMapEmpty!26072) mapIsEmpty!26072))

(assert (= (and b!854126 (not condMapEmpty!26072)) mapNonEmpty!26072))

(get-info :version)

(assert (= (and mapNonEmpty!26072 ((_ is ValueCellFull!7718) mapValue!26072)) b!854136))

(assert (= (and b!854126 ((_ is ValueCellFull!7718) mapDefault!26072)) b!854125))

(assert (= start!73246 b!854126))

(declare-fun b_lambda!11693 () Bool)

(assert (=> (not b_lambda!11693) (not b!854128)))

(declare-fun t!23244 () Bool)

(declare-fun tb!4473 () Bool)

(assert (=> (and start!73246 (= defaultEntry!696 defaultEntry!696) t!23244) tb!4473))

(declare-fun result!8565 () Bool)

(assert (=> tb!4473 (= result!8565 tp_is_empty!16315)))

(assert (=> b!854128 t!23244))

(declare-fun b_and!23493 () Bool)

(assert (= b_and!23491 (and (=> t!23244 result!8565) b_and!23493)))

(declare-fun m!794955 () Bool)

(assert (=> b!854128 m!794955))

(declare-fun m!794957 () Bool)

(assert (=> b!854128 m!794957))

(assert (=> b!854128 m!794957))

(declare-fun m!794959 () Bool)

(assert (=> b!854128 m!794959))

(declare-fun m!794961 () Bool)

(assert (=> b!854128 m!794961))

(declare-fun m!794963 () Bool)

(assert (=> b!854128 m!794963))

(declare-fun m!794965 () Bool)

(assert (=> b!854128 m!794965))

(assert (=> b!854128 m!794965))

(declare-fun m!794967 () Bool)

(assert (=> b!854128 m!794967))

(declare-fun m!794969 () Bool)

(assert (=> b!854128 m!794969))

(declare-fun m!794971 () Bool)

(assert (=> b!854128 m!794971))

(declare-fun m!794973 () Bool)

(assert (=> b!854128 m!794973))

(assert (=> b!854128 m!794961))

(declare-fun m!794975 () Bool)

(assert (=> b!854128 m!794975))

(declare-fun m!794977 () Bool)

(assert (=> b!854128 m!794977))

(declare-fun m!794979 () Bool)

(assert (=> b!854128 m!794979))

(declare-fun m!794981 () Bool)

(assert (=> b!854123 m!794981))

(declare-fun m!794983 () Bool)

(assert (=> b!854131 m!794983))

(declare-fun m!794985 () Bool)

(assert (=> b!854124 m!794985))

(assert (=> b!854124 m!794975))

(declare-fun m!794987 () Bool)

(assert (=> b!854124 m!794987))

(declare-fun m!794989 () Bool)

(assert (=> b!854134 m!794989))

(declare-fun m!794991 () Bool)

(assert (=> mapNonEmpty!26072 m!794991))

(declare-fun m!794993 () Bool)

(assert (=> b!854122 m!794993))

(declare-fun m!794995 () Bool)

(assert (=> bm!38363 m!794995))

(assert (=> b!854130 m!794977))

(assert (=> b!854130 m!794977))

(declare-fun m!794997 () Bool)

(assert (=> b!854130 m!794997))

(declare-fun m!794999 () Bool)

(assert (=> b!854130 m!794999))

(assert (=> bm!38364 m!794955))

(declare-fun m!795001 () Bool)

(assert (=> b!854129 m!795001))

(declare-fun m!795003 () Bool)

(assert (=> start!73246 m!795003))

(declare-fun m!795005 () Bool)

(assert (=> start!73246 m!795005))

(declare-fun m!795007 () Bool)

(assert (=> b!854133 m!795007))

(check-sat (not b!854128) (not b_next!14179) b_and!23493 (not b!854124) (not bm!38363) (not b!854129) (not b!854122) (not b_lambda!11693) (not start!73246) (not b!854123) (not b!854131) (not b!854133) (not mapNonEmpty!26072) (not bm!38364) (not b!854130) tp_is_empty!16315)
(check-sat b_and!23493 (not b_next!14179))
