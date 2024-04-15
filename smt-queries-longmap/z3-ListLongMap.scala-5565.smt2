; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73156 () Bool)

(assert start!73156)

(declare-fun b_free!14089 () Bool)

(declare-fun b_next!14089 () Bool)

(assert (=> start!73156 (= b_free!14089 (not b_next!14089))))

(declare-fun tp!49772 () Bool)

(declare-fun b_and!23311 () Bool)

(assert (=> start!73156 (= tp!49772 b_and!23311)))

(declare-fun b!852007 () Bool)

(declare-fun e!475184 () Bool)

(declare-fun e!475185 () Bool)

(declare-fun mapRes!25937 () Bool)

(assert (=> b!852007 (= e!475184 (and e!475185 mapRes!25937))))

(declare-fun condMapEmpty!25937 () Bool)

(declare-datatypes ((V!26681 0))(
  ( (V!26682 (val!8160 Int)) )
))
(declare-datatypes ((ValueCell!7673 0))(
  ( (ValueCellFull!7673 (v!10579 V!26681)) (EmptyCell!7673) )
))
(declare-datatypes ((array!48635 0))(
  ( (array!48636 (arr!23349 (Array (_ BitVec 32) ValueCell!7673)) (size!23791 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48635)

(declare-fun mapDefault!25937 () ValueCell!7673)

(assert (=> b!852007 (= condMapEmpty!25937 (= (arr!23349 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7673)) mapDefault!25937)))))

(declare-fun b!852008 () Bool)

(declare-fun e!475187 () Bool)

(assert (=> b!852008 (= e!475187 true)))

(declare-datatypes ((tuple2!10730 0))(
  ( (tuple2!10731 (_1!5376 (_ BitVec 64)) (_2!5376 V!26681)) )
))
(declare-fun lt!383740 () tuple2!10730)

(declare-fun lt!383744 () V!26681)

(declare-datatypes ((List!16559 0))(
  ( (Nil!16556) (Cons!16555 (h!17686 tuple2!10730) (t!23085 List!16559)) )
))
(declare-datatypes ((ListLongMap!9489 0))(
  ( (ListLongMap!9490 (toList!4760 List!16559)) )
))
(declare-fun lt!383745 () ListLongMap!9489)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2176 (ListLongMap!9489 tuple2!10730) ListLongMap!9489)

(assert (=> b!852008 (= (+!2176 lt!383745 lt!383740) (+!2176 (+!2176 lt!383745 (tuple2!10731 k0!854 lt!383744)) lt!383740))))

(declare-fun lt!383738 () V!26681)

(assert (=> b!852008 (= lt!383740 (tuple2!10731 k0!854 lt!383738))))

(declare-datatypes ((Unit!29025 0))(
  ( (Unit!29026) )
))
(declare-fun lt!383743 () Unit!29025)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!289 (ListLongMap!9489 (_ BitVec 64) V!26681 V!26681) Unit!29025)

(assert (=> b!852008 (= lt!383743 (addSameAsAddTwiceSameKeyDiffValues!289 lt!383745 k0!854 lt!383744 lt!383738))))

(declare-fun lt!383742 () V!26681)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12316 (ValueCell!7673 V!26681) V!26681)

(assert (=> b!852008 (= lt!383744 (get!12316 (select (arr!23349 _values!688) from!1053) lt!383742))))

(declare-fun lt!383747 () ListLongMap!9489)

(declare-datatypes ((array!48637 0))(
  ( (array!48638 (arr!23350 (Array (_ BitVec 32) (_ BitVec 64))) (size!23792 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48637)

(assert (=> b!852008 (= lt!383747 (+!2176 lt!383745 (tuple2!10731 (select (arr!23350 _keys!868) from!1053) lt!383738)))))

(declare-fun v!557 () V!26681)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852008 (= lt!383738 (get!12316 (select (store (arr!23349 _values!688) i!612 (ValueCellFull!7673 v!557)) from!1053) lt!383742))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1039 (Int (_ BitVec 64)) V!26681)

(assert (=> b!852008 (= lt!383742 (dynLambda!1039 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!383746 () array!48635)

(declare-fun minValue!654 () V!26681)

(declare-fun zeroValue!654 () V!26681)

(declare-fun getCurrentListMapNoExtraKeys!2768 (array!48637 array!48635 (_ BitVec 32) (_ BitVec 32) V!26681 V!26681 (_ BitVec 32) Int) ListLongMap!9489)

(assert (=> b!852008 (= lt!383745 (getCurrentListMapNoExtraKeys!2768 _keys!868 lt!383746 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38097 () ListLongMap!9489)

(declare-fun bm!38093 () Bool)

(assert (=> bm!38093 (= call!38097 (getCurrentListMapNoExtraKeys!2768 _keys!868 lt!383746 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852009 () Bool)

(declare-fun res!578752 () Bool)

(declare-fun e!475182 () Bool)

(assert (=> b!852009 (=> (not res!578752) (not e!475182))))

(declare-datatypes ((List!16560 0))(
  ( (Nil!16557) (Cons!16556 (h!17687 (_ BitVec 64)) (t!23086 List!16560)) )
))
(declare-fun arrayNoDuplicates!0 (array!48637 (_ BitVec 32) List!16560) Bool)

(assert (=> b!852009 (= res!578752 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16557))))

(declare-fun b!852010 () Bool)

(declare-fun e!475181 () Bool)

(assert (=> b!852010 (= e!475182 e!475181)))

(declare-fun res!578755 () Bool)

(assert (=> b!852010 (=> (not res!578755) (not e!475181))))

(assert (=> b!852010 (= res!578755 (= from!1053 i!612))))

(assert (=> b!852010 (= lt!383747 (getCurrentListMapNoExtraKeys!2768 _keys!868 lt!383746 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852010 (= lt!383746 (array!48636 (store (arr!23349 _values!688) i!612 (ValueCellFull!7673 v!557)) (size!23791 _values!688)))))

(declare-fun lt!383741 () ListLongMap!9489)

(assert (=> b!852010 (= lt!383741 (getCurrentListMapNoExtraKeys!2768 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852011 () Bool)

(declare-fun res!578751 () Bool)

(assert (=> b!852011 (=> (not res!578751) (not e!475182))))

(assert (=> b!852011 (= res!578751 (and (= (size!23791 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23792 _keys!868) (size!23791 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852012 () Bool)

(declare-fun e!475186 () Bool)

(declare-fun tp_is_empty!16225 () Bool)

(assert (=> b!852012 (= e!475186 tp_is_empty!16225)))

(declare-fun b!852013 () Bool)

(declare-fun res!578756 () Bool)

(assert (=> b!852013 (=> (not res!578756) (not e!475182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48637 (_ BitVec 32)) Bool)

(assert (=> b!852013 (= res!578756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852014 () Bool)

(assert (=> b!852014 (= e!475185 tp_is_empty!16225)))

(declare-fun mapNonEmpty!25937 () Bool)

(declare-fun tp!49771 () Bool)

(assert (=> mapNonEmpty!25937 (= mapRes!25937 (and tp!49771 e!475186))))

(declare-fun mapValue!25937 () ValueCell!7673)

(declare-fun mapKey!25937 () (_ BitVec 32))

(declare-fun mapRest!25937 () (Array (_ BitVec 32) ValueCell!7673))

(assert (=> mapNonEmpty!25937 (= (arr!23349 _values!688) (store mapRest!25937 mapKey!25937 mapValue!25937))))

(declare-fun b!852015 () Bool)

(declare-fun e!475183 () Bool)

(declare-fun call!38096 () ListLongMap!9489)

(assert (=> b!852015 (= e!475183 (= call!38097 call!38096))))

(declare-fun b!852016 () Bool)

(declare-fun res!578749 () Bool)

(assert (=> b!852016 (=> (not res!578749) (not e!475182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852016 (= res!578749 (validKeyInArray!0 k0!854))))

(declare-fun bm!38094 () Bool)

(assert (=> bm!38094 (= call!38096 (getCurrentListMapNoExtraKeys!2768 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852018 () Bool)

(declare-fun res!578757 () Bool)

(assert (=> b!852018 (=> (not res!578757) (not e!475182))))

(assert (=> b!852018 (= res!578757 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23792 _keys!868))))))

(declare-fun b!852019 () Bool)

(assert (=> b!852019 (= e!475183 (= call!38097 (+!2176 call!38096 (tuple2!10731 k0!854 v!557))))))

(declare-fun b!852020 () Bool)

(assert (=> b!852020 (= e!475181 (not e!475187))))

(declare-fun res!578753 () Bool)

(assert (=> b!852020 (=> res!578753 e!475187)))

(assert (=> b!852020 (= res!578753 (not (validKeyInArray!0 (select (arr!23350 _keys!868) from!1053))))))

(assert (=> b!852020 e!475183))

(declare-fun c!91739 () Bool)

(assert (=> b!852020 (= c!91739 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383739 () Unit!29025)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!380 (array!48637 array!48635 (_ BitVec 32) (_ BitVec 32) V!26681 V!26681 (_ BitVec 32) (_ BitVec 64) V!26681 (_ BitVec 32) Int) Unit!29025)

(assert (=> b!852020 (= lt!383739 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!380 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852021 () Bool)

(declare-fun res!578754 () Bool)

(assert (=> b!852021 (=> (not res!578754) (not e!475182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852021 (= res!578754 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25937 () Bool)

(assert (=> mapIsEmpty!25937 mapRes!25937))

(declare-fun b!852017 () Bool)

(declare-fun res!578750 () Bool)

(assert (=> b!852017 (=> (not res!578750) (not e!475182))))

(assert (=> b!852017 (= res!578750 (and (= (select (arr!23350 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!578748 () Bool)

(assert (=> start!73156 (=> (not res!578748) (not e!475182))))

(assert (=> start!73156 (= res!578748 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23792 _keys!868))))))

(assert (=> start!73156 e!475182))

(assert (=> start!73156 tp_is_empty!16225))

(assert (=> start!73156 true))

(assert (=> start!73156 tp!49772))

(declare-fun array_inv!18598 (array!48637) Bool)

(assert (=> start!73156 (array_inv!18598 _keys!868)))

(declare-fun array_inv!18599 (array!48635) Bool)

(assert (=> start!73156 (and (array_inv!18599 _values!688) e!475184)))

(assert (= (and start!73156 res!578748) b!852021))

(assert (= (and b!852021 res!578754) b!852011))

(assert (= (and b!852011 res!578751) b!852013))

(assert (= (and b!852013 res!578756) b!852009))

(assert (= (and b!852009 res!578752) b!852018))

(assert (= (and b!852018 res!578757) b!852016))

(assert (= (and b!852016 res!578749) b!852017))

(assert (= (and b!852017 res!578750) b!852010))

(assert (= (and b!852010 res!578755) b!852020))

(assert (= (and b!852020 c!91739) b!852019))

(assert (= (and b!852020 (not c!91739)) b!852015))

(assert (= (or b!852019 b!852015) bm!38093))

(assert (= (or b!852019 b!852015) bm!38094))

(assert (= (and b!852020 (not res!578753)) b!852008))

(assert (= (and b!852007 condMapEmpty!25937) mapIsEmpty!25937))

(assert (= (and b!852007 (not condMapEmpty!25937)) mapNonEmpty!25937))

(get-info :version)

(assert (= (and mapNonEmpty!25937 ((_ is ValueCellFull!7673) mapValue!25937)) b!852012))

(assert (= (and b!852007 ((_ is ValueCellFull!7673) mapDefault!25937)) b!852014))

(assert (= start!73156 b!852007))

(declare-fun b_lambda!11603 () Bool)

(assert (=> (not b_lambda!11603) (not b!852008)))

(declare-fun t!23084 () Bool)

(declare-fun tb!4383 () Bool)

(assert (=> (and start!73156 (= defaultEntry!696 defaultEntry!696) t!23084) tb!4383))

(declare-fun result!8385 () Bool)

(assert (=> tb!4383 (= result!8385 tp_is_empty!16225)))

(assert (=> b!852008 t!23084))

(declare-fun b_and!23313 () Bool)

(assert (= b_and!23311 (and (=> t!23084 result!8385) b_and!23313)))

(declare-fun m!792523 () Bool)

(assert (=> b!852008 m!792523))

(declare-fun m!792525 () Bool)

(assert (=> b!852008 m!792525))

(declare-fun m!792527 () Bool)

(assert (=> b!852008 m!792527))

(declare-fun m!792529 () Bool)

(assert (=> b!852008 m!792529))

(declare-fun m!792531 () Bool)

(assert (=> b!852008 m!792531))

(declare-fun m!792533 () Bool)

(assert (=> b!852008 m!792533))

(declare-fun m!792535 () Bool)

(assert (=> b!852008 m!792535))

(declare-fun m!792537 () Bool)

(assert (=> b!852008 m!792537))

(assert (=> b!852008 m!792537))

(declare-fun m!792539 () Bool)

(assert (=> b!852008 m!792539))

(declare-fun m!792541 () Bool)

(assert (=> b!852008 m!792541))

(assert (=> b!852008 m!792523))

(assert (=> b!852008 m!792527))

(declare-fun m!792543 () Bool)

(assert (=> b!852008 m!792543))

(declare-fun m!792545 () Bool)

(assert (=> b!852008 m!792545))

(declare-fun m!792547 () Bool)

(assert (=> b!852008 m!792547))

(declare-fun m!792549 () Bool)

(assert (=> b!852013 m!792549))

(declare-fun m!792551 () Bool)

(assert (=> bm!38094 m!792551))

(declare-fun m!792553 () Bool)

(assert (=> b!852017 m!792553))

(declare-fun m!792555 () Bool)

(assert (=> start!73156 m!792555))

(declare-fun m!792557 () Bool)

(assert (=> start!73156 m!792557))

(declare-fun m!792559 () Bool)

(assert (=> b!852019 m!792559))

(declare-fun m!792561 () Bool)

(assert (=> b!852010 m!792561))

(assert (=> b!852010 m!792541))

(declare-fun m!792563 () Bool)

(assert (=> b!852010 m!792563))

(assert (=> bm!38093 m!792533))

(declare-fun m!792565 () Bool)

(assert (=> b!852016 m!792565))

(assert (=> b!852020 m!792545))

(assert (=> b!852020 m!792545))

(declare-fun m!792567 () Bool)

(assert (=> b!852020 m!792567))

(declare-fun m!792569 () Bool)

(assert (=> b!852020 m!792569))

(declare-fun m!792571 () Bool)

(assert (=> b!852009 m!792571))

(declare-fun m!792573 () Bool)

(assert (=> b!852021 m!792573))

(declare-fun m!792575 () Bool)

(assert (=> mapNonEmpty!25937 m!792575))

(check-sat (not b!852020) (not b_next!14089) b_and!23313 (not bm!38094) (not b!852009) (not b!852019) tp_is_empty!16225 (not b!852013) (not bm!38093) (not b!852008) (not b_lambda!11603) (not b!852021) (not b!852010) (not start!73156) (not mapNonEmpty!25937) (not b!852016))
(check-sat b_and!23313 (not b_next!14089))
