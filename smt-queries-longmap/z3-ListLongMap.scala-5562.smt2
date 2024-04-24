; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73324 () Bool)

(assert start!73324)

(declare-fun b_free!14071 () Bool)

(declare-fun b_next!14071 () Bool)

(assert (=> start!73324 (= b_free!14071 (not b_next!14071))))

(declare-fun tp!49718 () Bool)

(declare-fun b_and!23311 () Bool)

(assert (=> start!73324 (= tp!49718 b_and!23311)))

(declare-fun b!852726 () Bool)

(declare-fun e!475699 () Bool)

(declare-datatypes ((V!26657 0))(
  ( (V!26658 (val!8151 Int)) )
))
(declare-datatypes ((tuple2!10620 0))(
  ( (tuple2!10621 (_1!5321 (_ BitVec 64)) (_2!5321 V!26657)) )
))
(declare-datatypes ((List!16476 0))(
  ( (Nil!16473) (Cons!16472 (h!17609 tuple2!10620) (t!22985 List!16476)) )
))
(declare-datatypes ((ListLongMap!9391 0))(
  ( (ListLongMap!9392 (toList!4711 List!16476)) )
))
(declare-fun call!38113 () ListLongMap!9391)

(declare-fun call!38114 () ListLongMap!9391)

(assert (=> b!852726 (= e!475699 (= call!38113 call!38114))))

(declare-fun b!852727 () Bool)

(declare-fun e!475697 () Bool)

(declare-fun e!475701 () Bool)

(assert (=> b!852727 (= e!475697 e!475701)))

(declare-fun res!578941 () Bool)

(assert (=> b!852727 (=> (not res!578941) (not e!475701))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852727 (= res!578941 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48663 0))(
  ( (array!48664 (arr!23358 (Array (_ BitVec 32) (_ BitVec 64))) (size!23799 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48663)

(declare-fun lt!384067 () ListLongMap!9391)

(declare-datatypes ((ValueCell!7664 0))(
  ( (ValueCellFull!7664 (v!10576 V!26657)) (EmptyCell!7664) )
))
(declare-datatypes ((array!48665 0))(
  ( (array!48666 (arr!23359 (Array (_ BitVec 32) ValueCell!7664)) (size!23800 (_ BitVec 32))) )
))
(declare-fun lt!384070 () array!48665)

(declare-fun minValue!654 () V!26657)

(declare-fun zeroValue!654 () V!26657)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2769 (array!48663 array!48665 (_ BitVec 32) (_ BitVec 32) V!26657 V!26657 (_ BitVec 32) Int) ListLongMap!9391)

(assert (=> b!852727 (= lt!384067 (getCurrentListMapNoExtraKeys!2769 _keys!868 lt!384070 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26657)

(declare-fun _values!688 () array!48665)

(assert (=> b!852727 (= lt!384070 (array!48666 (store (arr!23359 _values!688) i!612 (ValueCellFull!7664 v!557)) (size!23800 _values!688)))))

(declare-fun lt!384073 () ListLongMap!9391)

(assert (=> b!852727 (= lt!384073 (getCurrentListMapNoExtraKeys!2769 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852728 () Bool)

(declare-fun e!475700 () Bool)

(declare-fun tp_is_empty!16207 () Bool)

(assert (=> b!852728 (= e!475700 tp_is_empty!16207)))

(declare-fun bm!38110 () Bool)

(assert (=> bm!38110 (= call!38113 (getCurrentListMapNoExtraKeys!2769 _keys!868 lt!384070 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852729 () Bool)

(declare-fun res!578936 () Bool)

(assert (=> b!852729 (=> (not res!578936) (not e!475697))))

(assert (=> b!852729 (= res!578936 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23799 _keys!868))))))

(declare-fun b!852730 () Bool)

(declare-fun e!475698 () Bool)

(assert (=> b!852730 (= e!475701 (not e!475698))))

(declare-fun res!578937 () Bool)

(assert (=> b!852730 (=> res!578937 e!475698)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852730 (= res!578937 (not (validKeyInArray!0 (select (arr!23358 _keys!868) from!1053))))))

(assert (=> b!852730 e!475699))

(declare-fun c!92059 () Bool)

(assert (=> b!852730 (= c!92059 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29078 0))(
  ( (Unit!29079) )
))
(declare-fun lt!384066 () Unit!29078)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!368 (array!48663 array!48665 (_ BitVec 32) (_ BitVec 32) V!26657 V!26657 (_ BitVec 32) (_ BitVec 64) V!26657 (_ BitVec 32) Int) Unit!29078)

(assert (=> b!852730 (= lt!384066 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!368 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578939 () Bool)

(assert (=> start!73324 (=> (not res!578939) (not e!475697))))

(assert (=> start!73324 (= res!578939 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23799 _keys!868))))))

(assert (=> start!73324 e!475697))

(assert (=> start!73324 tp_is_empty!16207))

(assert (=> start!73324 true))

(assert (=> start!73324 tp!49718))

(declare-fun array_inv!18576 (array!48663) Bool)

(assert (=> start!73324 (array_inv!18576 _keys!868)))

(declare-fun e!475702 () Bool)

(declare-fun array_inv!18577 (array!48665) Bool)

(assert (=> start!73324 (and (array_inv!18577 _values!688) e!475702)))

(declare-fun b!852731 () Bool)

(declare-fun res!578932 () Bool)

(assert (=> b!852731 (=> (not res!578932) (not e!475697))))

(assert (=> b!852731 (= res!578932 (and (= (size!23800 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23799 _keys!868) (size!23800 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852732 () Bool)

(declare-fun res!578933 () Bool)

(assert (=> b!852732 (=> (not res!578933) (not e!475697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48663 (_ BitVec 32)) Bool)

(assert (=> b!852732 (= res!578933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852733 () Bool)

(declare-fun res!578940 () Bool)

(assert (=> b!852733 (=> (not res!578940) (not e!475697))))

(assert (=> b!852733 (= res!578940 (and (= (select (arr!23358 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852734 () Bool)

(assert (=> b!852734 (= e!475698 true)))

(declare-fun lt!384068 () V!26657)

(declare-fun lt!384071 () ListLongMap!9391)

(declare-fun lt!384072 () tuple2!10620)

(declare-fun +!2158 (ListLongMap!9391 tuple2!10620) ListLongMap!9391)

(assert (=> b!852734 (= (+!2158 lt!384071 lt!384072) (+!2158 (+!2158 lt!384071 (tuple2!10621 k0!854 lt!384068)) lt!384072))))

(declare-fun lt!384065 () V!26657)

(assert (=> b!852734 (= lt!384072 (tuple2!10621 k0!854 lt!384065))))

(declare-fun lt!384074 () Unit!29078)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!287 (ListLongMap!9391 (_ BitVec 64) V!26657 V!26657) Unit!29078)

(assert (=> b!852734 (= lt!384074 (addSameAsAddTwiceSameKeyDiffValues!287 lt!384071 k0!854 lt!384068 lt!384065))))

(declare-fun lt!384069 () V!26657)

(declare-fun get!12308 (ValueCell!7664 V!26657) V!26657)

(assert (=> b!852734 (= lt!384068 (get!12308 (select (arr!23359 _values!688) from!1053) lt!384069))))

(assert (=> b!852734 (= lt!384067 (+!2158 lt!384071 (tuple2!10621 (select (arr!23358 _keys!868) from!1053) lt!384065)))))

(assert (=> b!852734 (= lt!384065 (get!12308 (select (store (arr!23359 _values!688) i!612 (ValueCellFull!7664 v!557)) from!1053) lt!384069))))

(declare-fun dynLambda!1034 (Int (_ BitVec 64)) V!26657)

(assert (=> b!852734 (= lt!384069 (dynLambda!1034 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852734 (= lt!384071 (getCurrentListMapNoExtraKeys!2769 _keys!868 lt!384070 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852735 () Bool)

(declare-fun res!578934 () Bool)

(assert (=> b!852735 (=> (not res!578934) (not e!475697))))

(assert (=> b!852735 (= res!578934 (validKeyInArray!0 k0!854))))

(declare-fun bm!38111 () Bool)

(assert (=> bm!38111 (= call!38114 (getCurrentListMapNoExtraKeys!2769 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25910 () Bool)

(declare-fun mapRes!25910 () Bool)

(assert (=> mapIsEmpty!25910 mapRes!25910))

(declare-fun b!852736 () Bool)

(declare-fun res!578935 () Bool)

(assert (=> b!852736 (=> (not res!578935) (not e!475697))))

(declare-datatypes ((List!16477 0))(
  ( (Nil!16474) (Cons!16473 (h!17610 (_ BitVec 64)) (t!22986 List!16477)) )
))
(declare-fun arrayNoDuplicates!0 (array!48663 (_ BitVec 32) List!16477) Bool)

(assert (=> b!852736 (= res!578935 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16474))))

(declare-fun b!852737 () Bool)

(declare-fun res!578938 () Bool)

(assert (=> b!852737 (=> (not res!578938) (not e!475697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852737 (= res!578938 (validMask!0 mask!1196))))

(declare-fun b!852738 () Bool)

(assert (=> b!852738 (= e!475699 (= call!38113 (+!2158 call!38114 (tuple2!10621 k0!854 v!557))))))

(declare-fun mapNonEmpty!25910 () Bool)

(declare-fun tp!49717 () Bool)

(declare-fun e!475695 () Bool)

(assert (=> mapNonEmpty!25910 (= mapRes!25910 (and tp!49717 e!475695))))

(declare-fun mapRest!25910 () (Array (_ BitVec 32) ValueCell!7664))

(declare-fun mapValue!25910 () ValueCell!7664)

(declare-fun mapKey!25910 () (_ BitVec 32))

(assert (=> mapNonEmpty!25910 (= (arr!23359 _values!688) (store mapRest!25910 mapKey!25910 mapValue!25910))))

(declare-fun b!852739 () Bool)

(assert (=> b!852739 (= e!475702 (and e!475700 mapRes!25910))))

(declare-fun condMapEmpty!25910 () Bool)

(declare-fun mapDefault!25910 () ValueCell!7664)

(assert (=> b!852739 (= condMapEmpty!25910 (= (arr!23359 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7664)) mapDefault!25910)))))

(declare-fun b!852740 () Bool)

(assert (=> b!852740 (= e!475695 tp_is_empty!16207)))

(assert (= (and start!73324 res!578939) b!852737))

(assert (= (and b!852737 res!578938) b!852731))

(assert (= (and b!852731 res!578932) b!852732))

(assert (= (and b!852732 res!578933) b!852736))

(assert (= (and b!852736 res!578935) b!852729))

(assert (= (and b!852729 res!578936) b!852735))

(assert (= (and b!852735 res!578934) b!852733))

(assert (= (and b!852733 res!578940) b!852727))

(assert (= (and b!852727 res!578941) b!852730))

(assert (= (and b!852730 c!92059) b!852738))

(assert (= (and b!852730 (not c!92059)) b!852726))

(assert (= (or b!852738 b!852726) bm!38110))

(assert (= (or b!852738 b!852726) bm!38111))

(assert (= (and b!852730 (not res!578937)) b!852734))

(assert (= (and b!852739 condMapEmpty!25910) mapIsEmpty!25910))

(assert (= (and b!852739 (not condMapEmpty!25910)) mapNonEmpty!25910))

(get-info :version)

(assert (= (and mapNonEmpty!25910 ((_ is ValueCellFull!7664) mapValue!25910)) b!852740))

(assert (= (and b!852739 ((_ is ValueCellFull!7664) mapDefault!25910)) b!852728))

(assert (= start!73324 b!852739))

(declare-fun b_lambda!11617 () Bool)

(assert (=> (not b_lambda!11617) (not b!852734)))

(declare-fun t!22984 () Bool)

(declare-fun tb!4365 () Bool)

(assert (=> (and start!73324 (= defaultEntry!696 defaultEntry!696) t!22984) tb!4365))

(declare-fun result!8349 () Bool)

(assert (=> tb!4365 (= result!8349 tp_is_empty!16207)))

(assert (=> b!852734 t!22984))

(declare-fun b_and!23313 () Bool)

(assert (= b_and!23311 (and (=> t!22984 result!8349) b_and!23313)))

(declare-fun m!794083 () Bool)

(assert (=> b!852730 m!794083))

(assert (=> b!852730 m!794083))

(declare-fun m!794085 () Bool)

(assert (=> b!852730 m!794085))

(declare-fun m!794087 () Bool)

(assert (=> b!852730 m!794087))

(declare-fun m!794089 () Bool)

(assert (=> b!852737 m!794089))

(declare-fun m!794091 () Bool)

(assert (=> b!852734 m!794091))

(declare-fun m!794093 () Bool)

(assert (=> b!852734 m!794093))

(declare-fun m!794095 () Bool)

(assert (=> b!852734 m!794095))

(declare-fun m!794097 () Bool)

(assert (=> b!852734 m!794097))

(declare-fun m!794099 () Bool)

(assert (=> b!852734 m!794099))

(declare-fun m!794101 () Bool)

(assert (=> b!852734 m!794101))

(declare-fun m!794103 () Bool)

(assert (=> b!852734 m!794103))

(declare-fun m!794105 () Bool)

(assert (=> b!852734 m!794105))

(assert (=> b!852734 m!794091))

(declare-fun m!794107 () Bool)

(assert (=> b!852734 m!794107))

(assert (=> b!852734 m!794093))

(declare-fun m!794109 () Bool)

(assert (=> b!852734 m!794109))

(declare-fun m!794111 () Bool)

(assert (=> b!852734 m!794111))

(assert (=> b!852734 m!794103))

(assert (=> b!852734 m!794083))

(declare-fun m!794113 () Bool)

(assert (=> b!852734 m!794113))

(declare-fun m!794115 () Bool)

(assert (=> b!852727 m!794115))

(assert (=> b!852727 m!794109))

(declare-fun m!794117 () Bool)

(assert (=> b!852727 m!794117))

(declare-fun m!794119 () Bool)

(assert (=> b!852738 m!794119))

(declare-fun m!794121 () Bool)

(assert (=> b!852732 m!794121))

(declare-fun m!794123 () Bool)

(assert (=> mapNonEmpty!25910 m!794123))

(assert (=> bm!38110 m!794111))

(declare-fun m!794125 () Bool)

(assert (=> start!73324 m!794125))

(declare-fun m!794127 () Bool)

(assert (=> start!73324 m!794127))

(declare-fun m!794129 () Bool)

(assert (=> b!852733 m!794129))

(declare-fun m!794131 () Bool)

(assert (=> bm!38111 m!794131))

(declare-fun m!794133 () Bool)

(assert (=> b!852735 m!794133))

(declare-fun m!794135 () Bool)

(assert (=> b!852736 m!794135))

(check-sat (not b_lambda!11617) (not bm!38110) (not b!852727) (not b!852735) (not b_next!14071) (not mapNonEmpty!25910) (not b!852734) (not start!73324) (not b!852738) (not b!852736) (not bm!38111) (not b!852730) b_and!23313 (not b!852737) tp_is_empty!16207 (not b!852732))
(check-sat b_and!23313 (not b_next!14071))
