; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73200 () Bool)

(assert start!73200)

(declare-fun b_free!14115 () Bool)

(declare-fun b_next!14115 () Bool)

(assert (=> start!73200 (= b_free!14115 (not b_next!14115))))

(declare-fun tp!49849 () Bool)

(declare-fun b_and!23389 () Bool)

(assert (=> start!73200 (= tp!49849 b_and!23389)))

(declare-fun b!852857 () Bool)

(declare-fun e!475642 () Bool)

(declare-fun tp_is_empty!16251 () Bool)

(assert (=> b!852857 (= e!475642 tp_is_empty!16251)))

(declare-fun res!579253 () Bool)

(declare-fun e!475644 () Bool)

(assert (=> start!73200 (=> (not res!579253) (not e!475644))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48700 0))(
  ( (array!48701 (arr!23381 (Array (_ BitVec 32) (_ BitVec 64))) (size!23821 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48700)

(assert (=> start!73200 (= res!579253 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23821 _keys!868))))))

(assert (=> start!73200 e!475644))

(assert (=> start!73200 tp_is_empty!16251))

(assert (=> start!73200 true))

(assert (=> start!73200 tp!49849))

(declare-fun array_inv!18538 (array!48700) Bool)

(assert (=> start!73200 (array_inv!18538 _keys!868)))

(declare-datatypes ((V!26715 0))(
  ( (V!26716 (val!8173 Int)) )
))
(declare-datatypes ((ValueCell!7686 0))(
  ( (ValueCellFull!7686 (v!10598 V!26715)) (EmptyCell!7686) )
))
(declare-datatypes ((array!48702 0))(
  ( (array!48703 (arr!23382 (Array (_ BitVec 32) ValueCell!7686)) (size!23822 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48702)

(declare-fun e!475641 () Bool)

(declare-fun array_inv!18539 (array!48702) Bool)

(assert (=> start!73200 (and (array_inv!18539 _values!688) e!475641)))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!384367 () array!48702)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10738 0))(
  ( (tuple2!10739 (_1!5380 (_ BitVec 64)) (_2!5380 V!26715)) )
))
(declare-datatypes ((List!16567 0))(
  ( (Nil!16564) (Cons!16563 (h!17694 tuple2!10738) (t!23128 List!16567)) )
))
(declare-datatypes ((ListLongMap!9507 0))(
  ( (ListLongMap!9508 (toList!4769 List!16567)) )
))
(declare-fun call!38200 () ListLongMap!9507)

(declare-fun minValue!654 () V!26715)

(declare-fun zeroValue!654 () V!26715)

(declare-fun bm!38197 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2750 (array!48700 array!48702 (_ BitVec 32) (_ BitVec 32) V!26715 V!26715 (_ BitVec 32) Int) ListLongMap!9507)

(assert (=> bm!38197 (= call!38200 (getCurrentListMapNoExtraKeys!2750 _keys!868 lt!384367 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25976 () Bool)

(declare-fun mapRes!25976 () Bool)

(declare-fun tp!49848 () Bool)

(declare-fun e!475645 () Bool)

(assert (=> mapNonEmpty!25976 (= mapRes!25976 (and tp!49848 e!475645))))

(declare-fun mapValue!25976 () ValueCell!7686)

(declare-fun mapKey!25976 () (_ BitVec 32))

(declare-fun mapRest!25976 () (Array (_ BitVec 32) ValueCell!7686))

(assert (=> mapNonEmpty!25976 (= (arr!23382 _values!688) (store mapRest!25976 mapKey!25976 mapValue!25976))))

(declare-fun b!852858 () Bool)

(declare-fun res!579248 () Bool)

(assert (=> b!852858 (=> (not res!579248) (not e!475644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852858 (= res!579248 (validMask!0 mask!1196))))

(declare-fun b!852859 () Bool)

(declare-fun e!475647 () Bool)

(assert (=> b!852859 (= e!475644 e!475647)))

(declare-fun res!579252 () Bool)

(assert (=> b!852859 (=> (not res!579252) (not e!475647))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852859 (= res!579252 (= from!1053 i!612))))

(declare-fun lt!384369 () ListLongMap!9507)

(assert (=> b!852859 (= lt!384369 (getCurrentListMapNoExtraKeys!2750 _keys!868 lt!384367 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26715)

(assert (=> b!852859 (= lt!384367 (array!48703 (store (arr!23382 _values!688) i!612 (ValueCellFull!7686 v!557)) (size!23822 _values!688)))))

(declare-fun lt!384370 () ListLongMap!9507)

(assert (=> b!852859 (= lt!384370 (getCurrentListMapNoExtraKeys!2750 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852860 () Bool)

(declare-fun res!579255 () Bool)

(assert (=> b!852860 (=> (not res!579255) (not e!475644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48700 (_ BitVec 32)) Bool)

(assert (=> b!852860 (= res!579255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!38198 () Bool)

(declare-fun call!38201 () ListLongMap!9507)

(assert (=> bm!38198 (= call!38201 (getCurrentListMapNoExtraKeys!2750 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852861 () Bool)

(declare-fun res!579251 () Bool)

(assert (=> b!852861 (=> (not res!579251) (not e!475644))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!852861 (= res!579251 (and (= (select (arr!23381 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun e!475648 () Bool)

(declare-fun b!852862 () Bool)

(declare-fun +!2163 (ListLongMap!9507 tuple2!10738) ListLongMap!9507)

(assert (=> b!852862 (= e!475648 (= call!38200 (+!2163 call!38201 (tuple2!10739 k0!854 v!557))))))

(declare-fun b!852863 () Bool)

(declare-fun res!579250 () Bool)

(assert (=> b!852863 (=> (not res!579250) (not e!475644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852863 (= res!579250 (validKeyInArray!0 k0!854))))

(declare-fun b!852864 () Bool)

(assert (=> b!852864 (= e!475645 tp_is_empty!16251)))

(declare-fun mapIsEmpty!25976 () Bool)

(assert (=> mapIsEmpty!25976 mapRes!25976))

(declare-fun b!852865 () Bool)

(assert (=> b!852865 (= e!475648 (= call!38200 call!38201))))

(declare-fun b!852866 () Bool)

(assert (=> b!852866 (= e!475641 (and e!475642 mapRes!25976))))

(declare-fun condMapEmpty!25976 () Bool)

(declare-fun mapDefault!25976 () ValueCell!7686)

(assert (=> b!852866 (= condMapEmpty!25976 (= (arr!23382 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7686)) mapDefault!25976)))))

(declare-fun b!852867 () Bool)

(declare-fun res!579254 () Bool)

(assert (=> b!852867 (=> (not res!579254) (not e!475644))))

(assert (=> b!852867 (= res!579254 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23821 _keys!868))))))

(declare-fun b!852868 () Bool)

(declare-fun res!579257 () Bool)

(assert (=> b!852868 (=> (not res!579257) (not e!475644))))

(assert (=> b!852868 (= res!579257 (and (= (size!23822 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23821 _keys!868) (size!23822 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852869 () Bool)

(declare-fun e!475643 () Bool)

(assert (=> b!852869 (= e!475643 true)))

(declare-fun lt!384371 () tuple2!10738)

(declare-fun lt!384365 () V!26715)

(declare-fun lt!384364 () ListLongMap!9507)

(assert (=> b!852869 (= (+!2163 lt!384364 lt!384371) (+!2163 (+!2163 lt!384364 (tuple2!10739 k0!854 lt!384365)) lt!384371))))

(declare-fun lt!384366 () V!26715)

(assert (=> b!852869 (= lt!384371 (tuple2!10739 k0!854 lt!384366))))

(declare-datatypes ((Unit!29111 0))(
  ( (Unit!29112) )
))
(declare-fun lt!384372 () Unit!29111)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!291 (ListLongMap!9507 (_ BitVec 64) V!26715 V!26715) Unit!29111)

(assert (=> b!852869 (= lt!384372 (addSameAsAddTwiceSameKeyDiffValues!291 lt!384364 k0!854 lt!384365 lt!384366))))

(declare-fun lt!384368 () V!26715)

(declare-fun get!12327 (ValueCell!7686 V!26715) V!26715)

(assert (=> b!852869 (= lt!384365 (get!12327 (select (arr!23382 _values!688) from!1053) lt!384368))))

(assert (=> b!852869 (= lt!384369 (+!2163 lt!384364 (tuple2!10739 (select (arr!23381 _keys!868) from!1053) lt!384366)))))

(assert (=> b!852869 (= lt!384366 (get!12327 (select (store (arr!23382 _values!688) i!612 (ValueCellFull!7686 v!557)) from!1053) lt!384368))))

(declare-fun dynLambda!1045 (Int (_ BitVec 64)) V!26715)

(assert (=> b!852869 (= lt!384368 (dynLambda!1045 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852869 (= lt!384364 (getCurrentListMapNoExtraKeys!2750 _keys!868 lt!384367 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852870 () Bool)

(declare-fun res!579249 () Bool)

(assert (=> b!852870 (=> (not res!579249) (not e!475644))))

(declare-datatypes ((List!16568 0))(
  ( (Nil!16565) (Cons!16564 (h!17695 (_ BitVec 64)) (t!23129 List!16568)) )
))
(declare-fun arrayNoDuplicates!0 (array!48700 (_ BitVec 32) List!16568) Bool)

(assert (=> b!852870 (= res!579249 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16565))))

(declare-fun b!852871 () Bool)

(assert (=> b!852871 (= e!475647 (not e!475643))))

(declare-fun res!579256 () Bool)

(assert (=> b!852871 (=> res!579256 e!475643)))

(assert (=> b!852871 (= res!579256 (not (validKeyInArray!0 (select (arr!23381 _keys!868) from!1053))))))

(assert (=> b!852871 e!475648))

(declare-fun c!91843 () Bool)

(assert (=> b!852871 (= c!91843 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384373 () Unit!29111)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!393 (array!48700 array!48702 (_ BitVec 32) (_ BitVec 32) V!26715 V!26715 (_ BitVec 32) (_ BitVec 64) V!26715 (_ BitVec 32) Int) Unit!29111)

(assert (=> b!852871 (= lt!384373 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!393 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73200 res!579253) b!852858))

(assert (= (and b!852858 res!579248) b!852868))

(assert (= (and b!852868 res!579257) b!852860))

(assert (= (and b!852860 res!579255) b!852870))

(assert (= (and b!852870 res!579249) b!852867))

(assert (= (and b!852867 res!579254) b!852863))

(assert (= (and b!852863 res!579250) b!852861))

(assert (= (and b!852861 res!579251) b!852859))

(assert (= (and b!852859 res!579252) b!852871))

(assert (= (and b!852871 c!91843) b!852862))

(assert (= (and b!852871 (not c!91843)) b!852865))

(assert (= (or b!852862 b!852865) bm!38197))

(assert (= (or b!852862 b!852865) bm!38198))

(assert (= (and b!852871 (not res!579256)) b!852869))

(assert (= (and b!852866 condMapEmpty!25976) mapIsEmpty!25976))

(assert (= (and b!852866 (not condMapEmpty!25976)) mapNonEmpty!25976))

(get-info :version)

(assert (= (and mapNonEmpty!25976 ((_ is ValueCellFull!7686) mapValue!25976)) b!852864))

(assert (= (and b!852866 ((_ is ValueCellFull!7686) mapDefault!25976)) b!852857))

(assert (= start!73200 b!852866))

(declare-fun b_lambda!11647 () Bool)

(assert (=> (not b_lambda!11647) (not b!852869)))

(declare-fun t!23127 () Bool)

(declare-fun tb!4417 () Bool)

(assert (=> (and start!73200 (= defaultEntry!696 defaultEntry!696) t!23127) tb!4417))

(declare-fun result!8445 () Bool)

(assert (=> tb!4417 (= result!8445 tp_is_empty!16251)))

(assert (=> b!852869 t!23127))

(declare-fun b_and!23391 () Bool)

(assert (= b_and!23389 (and (=> t!23127 result!8445) b_and!23391)))

(declare-fun m!793981 () Bool)

(assert (=> b!852869 m!793981))

(declare-fun m!793983 () Bool)

(assert (=> b!852869 m!793983))

(declare-fun m!793985 () Bool)

(assert (=> b!852869 m!793985))

(declare-fun m!793987 () Bool)

(assert (=> b!852869 m!793987))

(assert (=> b!852869 m!793981))

(declare-fun m!793989 () Bool)

(assert (=> b!852869 m!793989))

(declare-fun m!793991 () Bool)

(assert (=> b!852869 m!793991))

(assert (=> b!852869 m!793983))

(declare-fun m!793993 () Bool)

(assert (=> b!852869 m!793993))

(declare-fun m!793995 () Bool)

(assert (=> b!852869 m!793995))

(declare-fun m!793997 () Bool)

(assert (=> b!852869 m!793997))

(declare-fun m!793999 () Bool)

(assert (=> b!852869 m!793999))

(assert (=> b!852869 m!793995))

(declare-fun m!794001 () Bool)

(assert (=> b!852869 m!794001))

(declare-fun m!794003 () Bool)

(assert (=> b!852869 m!794003))

(declare-fun m!794005 () Bool)

(assert (=> b!852869 m!794005))

(declare-fun m!794007 () Bool)

(assert (=> b!852858 m!794007))

(declare-fun m!794009 () Bool)

(assert (=> b!852859 m!794009))

(assert (=> b!852859 m!793997))

(declare-fun m!794011 () Bool)

(assert (=> b!852859 m!794011))

(declare-fun m!794013 () Bool)

(assert (=> mapNonEmpty!25976 m!794013))

(declare-fun m!794015 () Bool)

(assert (=> b!852860 m!794015))

(declare-fun m!794017 () Bool)

(assert (=> b!852861 m!794017))

(declare-fun m!794019 () Bool)

(assert (=> b!852862 m!794019))

(declare-fun m!794021 () Bool)

(assert (=> bm!38198 m!794021))

(assert (=> b!852871 m!794003))

(assert (=> b!852871 m!794003))

(declare-fun m!794023 () Bool)

(assert (=> b!852871 m!794023))

(declare-fun m!794025 () Bool)

(assert (=> b!852871 m!794025))

(assert (=> bm!38197 m!793985))

(declare-fun m!794027 () Bool)

(assert (=> start!73200 m!794027))

(declare-fun m!794029 () Bool)

(assert (=> start!73200 m!794029))

(declare-fun m!794031 () Bool)

(assert (=> b!852870 m!794031))

(declare-fun m!794033 () Bool)

(assert (=> b!852863 m!794033))

(check-sat (not b!852858) (not bm!38197) (not b!852863) (not b!852870) tp_is_empty!16251 (not mapNonEmpty!25976) (not bm!38198) (not b_lambda!11647) (not b_next!14115) b_and!23391 (not b!852869) (not b!852859) (not b!852871) (not start!73200) (not b!852860) (not b!852862))
(check-sat b_and!23391 (not b_next!14115))
