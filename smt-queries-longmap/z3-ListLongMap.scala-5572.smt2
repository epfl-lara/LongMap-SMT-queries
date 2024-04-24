; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73384 () Bool)

(assert start!73384)

(declare-fun b_free!14131 () Bool)

(declare-fun b_next!14131 () Bool)

(assert (=> start!73384 (= b_free!14131 (not b_next!14131))))

(declare-fun tp!49897 () Bool)

(declare-fun b_and!23431 () Bool)

(assert (=> start!73384 (= tp!49897 b_and!23431)))

(declare-datatypes ((V!26737 0))(
  ( (V!26738 (val!8181 Int)) )
))
(declare-fun v!557 () V!26737)

(declare-datatypes ((tuple2!10678 0))(
  ( (tuple2!10679 (_1!5350 (_ BitVec 64)) (_2!5350 V!26737)) )
))
(declare-datatypes ((List!16529 0))(
  ( (Nil!16526) (Cons!16525 (h!17662 tuple2!10678) (t!23098 List!16529)) )
))
(declare-datatypes ((ListLongMap!9449 0))(
  ( (ListLongMap!9450 (toList!4740 List!16529)) )
))
(declare-fun call!38294 () ListLongMap!9449)

(declare-fun call!38293 () ListLongMap!9449)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!854136 () Bool)

(declare-fun e!476422 () Bool)

(declare-fun +!2184 (ListLongMap!9449 tuple2!10678) ListLongMap!9449)

(assert (=> b!854136 (= e!476422 (= call!38293 (+!2184 call!38294 (tuple2!10679 k0!854 v!557))))))

(declare-fun bm!38290 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48781 0))(
  ( (array!48782 (arr!23417 (Array (_ BitVec 32) (_ BitVec 64))) (size!23858 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48781)

(declare-datatypes ((ValueCell!7694 0))(
  ( (ValueCellFull!7694 (v!10606 V!26737)) (EmptyCell!7694) )
))
(declare-datatypes ((array!48783 0))(
  ( (array!48784 (arr!23418 (Array (_ BitVec 32) ValueCell!7694)) (size!23859 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48783)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26737)

(declare-fun zeroValue!654 () V!26737)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2797 (array!48781 array!48783 (_ BitVec 32) (_ BitVec 32) V!26737 V!26737 (_ BitVec 32) Int) ListLongMap!9449)

(assert (=> bm!38290 (= call!38294 (getCurrentListMapNoExtraKeys!2797 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854137 () Bool)

(declare-fun res!579837 () Bool)

(declare-fun e!476415 () Bool)

(assert (=> b!854137 (=> (not res!579837) (not e!476415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854137 (= res!579837 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26000 () Bool)

(declare-fun mapRes!26000 () Bool)

(declare-fun tp!49898 () Bool)

(declare-fun e!476416 () Bool)

(assert (=> mapNonEmpty!26000 (= mapRes!26000 (and tp!49898 e!476416))))

(declare-fun mapRest!26000 () (Array (_ BitVec 32) ValueCell!7694))

(declare-fun mapKey!26000 () (_ BitVec 32))

(declare-fun mapValue!26000 () ValueCell!7694)

(assert (=> mapNonEmpty!26000 (= (arr!23418 _values!688) (store mapRest!26000 mapKey!26000 mapValue!26000))))

(declare-fun b!854138 () Bool)

(declare-fun res!579834 () Bool)

(assert (=> b!854138 (=> (not res!579834) (not e!476415))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854138 (= res!579834 (and (= (select (arr!23417 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854139 () Bool)

(declare-fun e!476419 () Bool)

(assert (=> b!854139 (= e!476419 true)))

(declare-fun lt!384969 () tuple2!10678)

(declare-fun lt!384971 () V!26737)

(declare-fun lt!384968 () ListLongMap!9449)

(assert (=> b!854139 (= (+!2184 lt!384968 lt!384969) (+!2184 (+!2184 lt!384968 (tuple2!10679 k0!854 lt!384971)) lt!384969))))

(declare-fun lt!384973 () V!26737)

(assert (=> b!854139 (= lt!384969 (tuple2!10679 k0!854 lt!384973))))

(declare-datatypes ((Unit!29128 0))(
  ( (Unit!29129) )
))
(declare-fun lt!384966 () Unit!29128)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!310 (ListLongMap!9449 (_ BitVec 64) V!26737 V!26737) Unit!29128)

(assert (=> b!854139 (= lt!384966 (addSameAsAddTwiceSameKeyDiffValues!310 lt!384968 k0!854 lt!384971 lt!384973))))

(declare-fun lt!384970 () V!26737)

(declare-fun get!12351 (ValueCell!7694 V!26737) V!26737)

(assert (=> b!854139 (= lt!384971 (get!12351 (select (arr!23418 _values!688) from!1053) lt!384970))))

(declare-fun lt!384967 () ListLongMap!9449)

(assert (=> b!854139 (= lt!384967 (+!2184 lt!384968 (tuple2!10679 (select (arr!23417 _keys!868) from!1053) lt!384973)))))

(assert (=> b!854139 (= lt!384973 (get!12351 (select (store (arr!23418 _values!688) i!612 (ValueCellFull!7694 v!557)) from!1053) lt!384970))))

(declare-fun dynLambda!1057 (Int (_ BitVec 64)) V!26737)

(assert (=> b!854139 (= lt!384970 (dynLambda!1057 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!384974 () array!48783)

(assert (=> b!854139 (= lt!384968 (getCurrentListMapNoExtraKeys!2797 _keys!868 lt!384974 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854140 () Bool)

(declare-fun res!579839 () Bool)

(assert (=> b!854140 (=> (not res!579839) (not e!476415))))

(assert (=> b!854140 (= res!579839 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23858 _keys!868))))))

(declare-fun mapIsEmpty!26000 () Bool)

(assert (=> mapIsEmpty!26000 mapRes!26000))

(declare-fun b!854141 () Bool)

(declare-fun e!476417 () Bool)

(assert (=> b!854141 (= e!476417 (not e!476419))))

(declare-fun res!579840 () Bool)

(assert (=> b!854141 (=> res!579840 e!476419)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854141 (= res!579840 (not (validKeyInArray!0 (select (arr!23417 _keys!868) from!1053))))))

(assert (=> b!854141 e!476422))

(declare-fun c!92149 () Bool)

(assert (=> b!854141 (= c!92149 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384972 () Unit!29128)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!389 (array!48781 array!48783 (_ BitVec 32) (_ BitVec 32) V!26737 V!26737 (_ BitVec 32) (_ BitVec 64) V!26737 (_ BitVec 32) Int) Unit!29128)

(assert (=> b!854141 (= lt!384972 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!389 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38291 () Bool)

(assert (=> bm!38291 (= call!38293 (getCurrentListMapNoExtraKeys!2797 _keys!868 lt!384974 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854142 () Bool)

(declare-fun res!579841 () Bool)

(assert (=> b!854142 (=> (not res!579841) (not e!476415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48781 (_ BitVec 32)) Bool)

(assert (=> b!854142 (= res!579841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854143 () Bool)

(declare-fun res!579833 () Bool)

(assert (=> b!854143 (=> (not res!579833) (not e!476415))))

(assert (=> b!854143 (= res!579833 (and (= (size!23859 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23858 _keys!868) (size!23859 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!579836 () Bool)

(assert (=> start!73384 (=> (not res!579836) (not e!476415))))

(assert (=> start!73384 (= res!579836 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23858 _keys!868))))))

(assert (=> start!73384 e!476415))

(declare-fun tp_is_empty!16267 () Bool)

(assert (=> start!73384 tp_is_empty!16267))

(assert (=> start!73384 true))

(assert (=> start!73384 tp!49897))

(declare-fun array_inv!18618 (array!48781) Bool)

(assert (=> start!73384 (array_inv!18618 _keys!868)))

(declare-fun e!476418 () Bool)

(declare-fun array_inv!18619 (array!48783) Bool)

(assert (=> start!73384 (and (array_inv!18619 _values!688) e!476418)))

(declare-fun b!854144 () Bool)

(assert (=> b!854144 (= e!476422 (= call!38293 call!38294))))

(declare-fun b!854145 () Bool)

(declare-fun e!476421 () Bool)

(assert (=> b!854145 (= e!476421 tp_is_empty!16267)))

(declare-fun b!854146 () Bool)

(assert (=> b!854146 (= e!476415 e!476417)))

(declare-fun res!579832 () Bool)

(assert (=> b!854146 (=> (not res!579832) (not e!476417))))

(assert (=> b!854146 (= res!579832 (= from!1053 i!612))))

(assert (=> b!854146 (= lt!384967 (getCurrentListMapNoExtraKeys!2797 _keys!868 lt!384974 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!854146 (= lt!384974 (array!48784 (store (arr!23418 _values!688) i!612 (ValueCellFull!7694 v!557)) (size!23859 _values!688)))))

(declare-fun lt!384965 () ListLongMap!9449)

(assert (=> b!854146 (= lt!384965 (getCurrentListMapNoExtraKeys!2797 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854147 () Bool)

(assert (=> b!854147 (= e!476418 (and e!476421 mapRes!26000))))

(declare-fun condMapEmpty!26000 () Bool)

(declare-fun mapDefault!26000 () ValueCell!7694)

(assert (=> b!854147 (= condMapEmpty!26000 (= (arr!23418 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7694)) mapDefault!26000)))))

(declare-fun b!854148 () Bool)

(declare-fun res!579835 () Bool)

(assert (=> b!854148 (=> (not res!579835) (not e!476415))))

(declare-datatypes ((List!16530 0))(
  ( (Nil!16527) (Cons!16526 (h!17663 (_ BitVec 64)) (t!23099 List!16530)) )
))
(declare-fun arrayNoDuplicates!0 (array!48781 (_ BitVec 32) List!16530) Bool)

(assert (=> b!854148 (= res!579835 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16527))))

(declare-fun b!854149 () Bool)

(declare-fun res!579838 () Bool)

(assert (=> b!854149 (=> (not res!579838) (not e!476415))))

(assert (=> b!854149 (= res!579838 (validKeyInArray!0 k0!854))))

(declare-fun b!854150 () Bool)

(assert (=> b!854150 (= e!476416 tp_is_empty!16267)))

(assert (= (and start!73384 res!579836) b!854137))

(assert (= (and b!854137 res!579837) b!854143))

(assert (= (and b!854143 res!579833) b!854142))

(assert (= (and b!854142 res!579841) b!854148))

(assert (= (and b!854148 res!579835) b!854140))

(assert (= (and b!854140 res!579839) b!854149))

(assert (= (and b!854149 res!579838) b!854138))

(assert (= (and b!854138 res!579834) b!854146))

(assert (= (and b!854146 res!579832) b!854141))

(assert (= (and b!854141 c!92149) b!854136))

(assert (= (and b!854141 (not c!92149)) b!854144))

(assert (= (or b!854136 b!854144) bm!38291))

(assert (= (or b!854136 b!854144) bm!38290))

(assert (= (and b!854141 (not res!579840)) b!854139))

(assert (= (and b!854147 condMapEmpty!26000) mapIsEmpty!26000))

(assert (= (and b!854147 (not condMapEmpty!26000)) mapNonEmpty!26000))

(get-info :version)

(assert (= (and mapNonEmpty!26000 ((_ is ValueCellFull!7694) mapValue!26000)) b!854150))

(assert (= (and b!854147 ((_ is ValueCellFull!7694) mapDefault!26000)) b!854145))

(assert (= start!73384 b!854147))

(declare-fun b_lambda!11677 () Bool)

(assert (=> (not b_lambda!11677) (not b!854139)))

(declare-fun t!23097 () Bool)

(declare-fun tb!4425 () Bool)

(assert (=> (and start!73384 (= defaultEntry!696 defaultEntry!696) t!23097) tb!4425))

(declare-fun result!8469 () Bool)

(assert (=> tb!4425 (= result!8469 tp_is_empty!16267)))

(assert (=> b!854139 t!23097))

(declare-fun b_and!23433 () Bool)

(assert (= b_and!23431 (and (=> t!23097 result!8469) b_and!23433)))

(declare-fun m!795703 () Bool)

(assert (=> start!73384 m!795703))

(declare-fun m!795705 () Bool)

(assert (=> start!73384 m!795705))

(declare-fun m!795707 () Bool)

(assert (=> b!854136 m!795707))

(declare-fun m!795709 () Bool)

(assert (=> b!854142 m!795709))

(declare-fun m!795711 () Bool)

(assert (=> bm!38290 m!795711))

(declare-fun m!795713 () Bool)

(assert (=> b!854137 m!795713))

(declare-fun m!795715 () Bool)

(assert (=> mapNonEmpty!26000 m!795715))

(declare-fun m!795717 () Bool)

(assert (=> b!854146 m!795717))

(declare-fun m!795719 () Bool)

(assert (=> b!854146 m!795719))

(declare-fun m!795721 () Bool)

(assert (=> b!854146 m!795721))

(declare-fun m!795723 () Bool)

(assert (=> bm!38291 m!795723))

(declare-fun m!795725 () Bool)

(assert (=> b!854138 m!795725))

(declare-fun m!795727 () Bool)

(assert (=> b!854139 m!795727))

(declare-fun m!795729 () Bool)

(assert (=> b!854139 m!795729))

(declare-fun m!795731 () Bool)

(assert (=> b!854139 m!795731))

(declare-fun m!795733 () Bool)

(assert (=> b!854139 m!795733))

(declare-fun m!795735 () Bool)

(assert (=> b!854139 m!795735))

(assert (=> b!854139 m!795731))

(declare-fun m!795737 () Bool)

(assert (=> b!854139 m!795737))

(assert (=> b!854139 m!795719))

(declare-fun m!795739 () Bool)

(assert (=> b!854139 m!795739))

(assert (=> b!854139 m!795723))

(assert (=> b!854139 m!795733))

(declare-fun m!795741 () Bool)

(assert (=> b!854139 m!795741))

(declare-fun m!795743 () Bool)

(assert (=> b!854139 m!795743))

(declare-fun m!795745 () Bool)

(assert (=> b!854139 m!795745))

(declare-fun m!795747 () Bool)

(assert (=> b!854139 m!795747))

(assert (=> b!854139 m!795727))

(declare-fun m!795749 () Bool)

(assert (=> b!854149 m!795749))

(assert (=> b!854141 m!795741))

(assert (=> b!854141 m!795741))

(declare-fun m!795751 () Bool)

(assert (=> b!854141 m!795751))

(declare-fun m!795753 () Bool)

(assert (=> b!854141 m!795753))

(declare-fun m!795755 () Bool)

(assert (=> b!854148 m!795755))

(check-sat (not bm!38291) (not b!854141) (not start!73384) (not b!854142) (not b!854146) (not mapNonEmpty!26000) (not b!854136) (not b_lambda!11677) (not b_next!14131) (not b!854139) (not b!854148) b_and!23433 (not b!854137) tp_is_empty!16267 (not bm!38290) (not b!854149))
(check-sat b_and!23433 (not b_next!14131))
