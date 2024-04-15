; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73162 () Bool)

(assert start!73162)

(declare-fun b_free!14095 () Bool)

(declare-fun b_next!14095 () Bool)

(assert (=> start!73162 (= b_free!14095 (not b_next!14095))))

(declare-fun tp!49789 () Bool)

(declare-fun b_and!23323 () Bool)

(assert (=> start!73162 (= tp!49789 b_and!23323)))

(declare-fun mapNonEmpty!25946 () Bool)

(declare-fun mapRes!25946 () Bool)

(declare-fun tp!49790 () Bool)

(declare-fun e!475256 () Bool)

(assert (=> mapNonEmpty!25946 (= mapRes!25946 (and tp!49790 e!475256))))

(declare-fun mapKey!25946 () (_ BitVec 32))

(declare-datatypes ((V!26689 0))(
  ( (V!26690 (val!8163 Int)) )
))
(declare-datatypes ((ValueCell!7676 0))(
  ( (ValueCellFull!7676 (v!10582 V!26689)) (EmptyCell!7676) )
))
(declare-fun mapValue!25946 () ValueCell!7676)

(declare-fun mapRest!25946 () (Array (_ BitVec 32) ValueCell!7676))

(declare-datatypes ((array!48647 0))(
  ( (array!48648 (arr!23355 (Array (_ BitVec 32) ValueCell!7676)) (size!23797 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48647)

(assert (=> mapNonEmpty!25946 (= (arr!23355 _values!688) (store mapRest!25946 mapKey!25946 mapValue!25946))))

(declare-fun b!852148 () Bool)

(declare-fun res!578846 () Bool)

(declare-fun e!475253 () Bool)

(assert (=> b!852148 (=> (not res!578846) (not e!475253))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852148 (= res!578846 (validKeyInArray!0 k0!854))))

(declare-fun b!852149 () Bool)

(declare-fun res!578845 () Bool)

(assert (=> b!852149 (=> (not res!578845) (not e!475253))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852149 (= res!578845 (validMask!0 mask!1196))))

(declare-fun b!852150 () Bool)

(declare-fun res!578841 () Bool)

(assert (=> b!852150 (=> (not res!578841) (not e!475253))))

(declare-datatypes ((array!48649 0))(
  ( (array!48650 (arr!23356 (Array (_ BitVec 32) (_ BitVec 64))) (size!23798 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48649)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48649 (_ BitVec 32)) Bool)

(assert (=> b!852150 (= res!578841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!578842 () Bool)

(assert (=> start!73162 (=> (not res!578842) (not e!475253))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73162 (= res!578842 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23798 _keys!868))))))

(assert (=> start!73162 e!475253))

(declare-fun tp_is_empty!16231 () Bool)

(assert (=> start!73162 tp_is_empty!16231))

(assert (=> start!73162 true))

(assert (=> start!73162 tp!49789))

(declare-fun array_inv!18604 (array!48649) Bool)

(assert (=> start!73162 (array_inv!18604 _keys!868)))

(declare-fun e!475258 () Bool)

(declare-fun array_inv!18605 (array!48647) Bool)

(assert (=> start!73162 (and (array_inv!18605 _values!688) e!475258)))

(declare-fun b!852151 () Bool)

(declare-fun res!578840 () Bool)

(assert (=> b!852151 (=> (not res!578840) (not e!475253))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!852151 (= res!578840 (and (= (size!23797 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23798 _keys!868) (size!23797 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852152 () Bool)

(declare-fun e!475257 () Bool)

(assert (=> b!852152 (= e!475253 e!475257)))

(declare-fun res!578847 () Bool)

(assert (=> b!852152 (=> (not res!578847) (not e!475257))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852152 (= res!578847 (= from!1053 i!612))))

(declare-datatypes ((tuple2!10736 0))(
  ( (tuple2!10737 (_1!5379 (_ BitVec 64)) (_2!5379 V!26689)) )
))
(declare-datatypes ((List!16565 0))(
  ( (Nil!16562) (Cons!16561 (h!17692 tuple2!10736) (t!23097 List!16565)) )
))
(declare-datatypes ((ListLongMap!9495 0))(
  ( (ListLongMap!9496 (toList!4763 List!16565)) )
))
(declare-fun lt!383832 () ListLongMap!9495)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26689)

(declare-fun zeroValue!654 () V!26689)

(declare-fun lt!383833 () array!48647)

(declare-fun getCurrentListMapNoExtraKeys!2771 (array!48649 array!48647 (_ BitVec 32) (_ BitVec 32) V!26689 V!26689 (_ BitVec 32) Int) ListLongMap!9495)

(assert (=> b!852152 (= lt!383832 (getCurrentListMapNoExtraKeys!2771 _keys!868 lt!383833 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26689)

(assert (=> b!852152 (= lt!383833 (array!48648 (store (arr!23355 _values!688) i!612 (ValueCellFull!7676 v!557)) (size!23797 _values!688)))))

(declare-fun lt!383837 () ListLongMap!9495)

(assert (=> b!852152 (= lt!383837 (getCurrentListMapNoExtraKeys!2771 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852153 () Bool)

(declare-fun e!475259 () Bool)

(assert (=> b!852153 (= e!475259 tp_is_empty!16231)))

(declare-fun b!852154 () Bool)

(assert (=> b!852154 (= e!475256 tp_is_empty!16231)))

(declare-fun b!852155 () Bool)

(assert (=> b!852155 (= e!475258 (and e!475259 mapRes!25946))))

(declare-fun condMapEmpty!25946 () Bool)

(declare-fun mapDefault!25946 () ValueCell!7676)

(assert (=> b!852155 (= condMapEmpty!25946 (= (arr!23355 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7676)) mapDefault!25946)))))

(declare-fun b!852156 () Bool)

(declare-fun res!578838 () Bool)

(assert (=> b!852156 (=> (not res!578838) (not e!475253))))

(assert (=> b!852156 (= res!578838 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23798 _keys!868))))))

(declare-fun call!38114 () ListLongMap!9495)

(declare-fun bm!38111 () Bool)

(assert (=> bm!38111 (= call!38114 (getCurrentListMapNoExtraKeys!2771 _keys!868 lt!383833 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852157 () Bool)

(declare-fun e!475260 () Bool)

(assert (=> b!852157 (= e!475260 true)))

(declare-fun lt!383836 () tuple2!10736)

(declare-fun lt!383831 () ListLongMap!9495)

(declare-fun lt!383828 () V!26689)

(declare-fun +!2179 (ListLongMap!9495 tuple2!10736) ListLongMap!9495)

(assert (=> b!852157 (= (+!2179 lt!383831 lt!383836) (+!2179 (+!2179 lt!383831 (tuple2!10737 k0!854 lt!383828)) lt!383836))))

(declare-fun lt!383829 () V!26689)

(assert (=> b!852157 (= lt!383836 (tuple2!10737 k0!854 lt!383829))))

(declare-datatypes ((Unit!29031 0))(
  ( (Unit!29032) )
))
(declare-fun lt!383830 () Unit!29031)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!291 (ListLongMap!9495 (_ BitVec 64) V!26689 V!26689) Unit!29031)

(assert (=> b!852157 (= lt!383830 (addSameAsAddTwiceSameKeyDiffValues!291 lt!383831 k0!854 lt!383828 lt!383829))))

(declare-fun lt!383834 () V!26689)

(declare-fun get!12320 (ValueCell!7676 V!26689) V!26689)

(assert (=> b!852157 (= lt!383828 (get!12320 (select (arr!23355 _values!688) from!1053) lt!383834))))

(assert (=> b!852157 (= lt!383832 (+!2179 lt!383831 (tuple2!10737 (select (arr!23356 _keys!868) from!1053) lt!383829)))))

(assert (=> b!852157 (= lt!383829 (get!12320 (select (store (arr!23355 _values!688) i!612 (ValueCellFull!7676 v!557)) from!1053) lt!383834))))

(declare-fun dynLambda!1041 (Int (_ BitVec 64)) V!26689)

(assert (=> b!852157 (= lt!383834 (dynLambda!1041 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852157 (= lt!383831 (getCurrentListMapNoExtraKeys!2771 _keys!868 lt!383833 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38112 () Bool)

(declare-fun call!38115 () ListLongMap!9495)

(assert (=> bm!38112 (= call!38115 (getCurrentListMapNoExtraKeys!2771 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852158 () Bool)

(assert (=> b!852158 (= e!475257 (not e!475260))))

(declare-fun res!578843 () Bool)

(assert (=> b!852158 (=> res!578843 e!475260)))

(assert (=> b!852158 (= res!578843 (not (validKeyInArray!0 (select (arr!23356 _keys!868) from!1053))))))

(declare-fun e!475254 () Bool)

(assert (=> b!852158 e!475254))

(declare-fun c!91748 () Bool)

(assert (=> b!852158 (= c!91748 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383835 () Unit!29031)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!383 (array!48649 array!48647 (_ BitVec 32) (_ BitVec 32) V!26689 V!26689 (_ BitVec 32) (_ BitVec 64) V!26689 (_ BitVec 32) Int) Unit!29031)

(assert (=> b!852158 (= lt!383835 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!383 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25946 () Bool)

(assert (=> mapIsEmpty!25946 mapRes!25946))

(declare-fun b!852159 () Bool)

(declare-fun res!578844 () Bool)

(assert (=> b!852159 (=> (not res!578844) (not e!475253))))

(assert (=> b!852159 (= res!578844 (and (= (select (arr!23356 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852160 () Bool)

(assert (=> b!852160 (= e!475254 (= call!38114 (+!2179 call!38115 (tuple2!10737 k0!854 v!557))))))

(declare-fun b!852161 () Bool)

(declare-fun res!578839 () Bool)

(assert (=> b!852161 (=> (not res!578839) (not e!475253))))

(declare-datatypes ((List!16566 0))(
  ( (Nil!16563) (Cons!16562 (h!17693 (_ BitVec 64)) (t!23098 List!16566)) )
))
(declare-fun arrayNoDuplicates!0 (array!48649 (_ BitVec 32) List!16566) Bool)

(assert (=> b!852161 (= res!578839 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16563))))

(declare-fun b!852162 () Bool)

(assert (=> b!852162 (= e!475254 (= call!38114 call!38115))))

(assert (= (and start!73162 res!578842) b!852149))

(assert (= (and b!852149 res!578845) b!852151))

(assert (= (and b!852151 res!578840) b!852150))

(assert (= (and b!852150 res!578841) b!852161))

(assert (= (and b!852161 res!578839) b!852156))

(assert (= (and b!852156 res!578838) b!852148))

(assert (= (and b!852148 res!578846) b!852159))

(assert (= (and b!852159 res!578844) b!852152))

(assert (= (and b!852152 res!578847) b!852158))

(assert (= (and b!852158 c!91748) b!852160))

(assert (= (and b!852158 (not c!91748)) b!852162))

(assert (= (or b!852160 b!852162) bm!38111))

(assert (= (or b!852160 b!852162) bm!38112))

(assert (= (and b!852158 (not res!578843)) b!852157))

(assert (= (and b!852155 condMapEmpty!25946) mapIsEmpty!25946))

(assert (= (and b!852155 (not condMapEmpty!25946)) mapNonEmpty!25946))

(get-info :version)

(assert (= (and mapNonEmpty!25946 ((_ is ValueCellFull!7676) mapValue!25946)) b!852154))

(assert (= (and b!852155 ((_ is ValueCellFull!7676) mapDefault!25946)) b!852153))

(assert (= start!73162 b!852155))

(declare-fun b_lambda!11609 () Bool)

(assert (=> (not b_lambda!11609) (not b!852157)))

(declare-fun t!23096 () Bool)

(declare-fun tb!4389 () Bool)

(assert (=> (and start!73162 (= defaultEntry!696 defaultEntry!696) t!23096) tb!4389))

(declare-fun result!8397 () Bool)

(assert (=> tb!4389 (= result!8397 tp_is_empty!16231)))

(assert (=> b!852157 t!23096))

(declare-fun b_and!23325 () Bool)

(assert (= b_and!23323 (and (=> t!23096 result!8397) b_and!23325)))

(declare-fun m!792685 () Bool)

(assert (=> start!73162 m!792685))

(declare-fun m!792687 () Bool)

(assert (=> start!73162 m!792687))

(declare-fun m!792689 () Bool)

(assert (=> bm!38112 m!792689))

(declare-fun m!792691 () Bool)

(assert (=> b!852159 m!792691))

(declare-fun m!792693 () Bool)

(assert (=> b!852148 m!792693))

(declare-fun m!792695 () Bool)

(assert (=> b!852152 m!792695))

(declare-fun m!792697 () Bool)

(assert (=> b!852152 m!792697))

(declare-fun m!792699 () Bool)

(assert (=> b!852152 m!792699))

(declare-fun m!792701 () Bool)

(assert (=> b!852150 m!792701))

(declare-fun m!792703 () Bool)

(assert (=> mapNonEmpty!25946 m!792703))

(declare-fun m!792705 () Bool)

(assert (=> b!852161 m!792705))

(declare-fun m!792707 () Bool)

(assert (=> b!852149 m!792707))

(declare-fun m!792709 () Bool)

(assert (=> bm!38111 m!792709))

(assert (=> b!852157 m!792709))

(declare-fun m!792711 () Bool)

(assert (=> b!852157 m!792711))

(assert (=> b!852157 m!792711))

(declare-fun m!792713 () Bool)

(assert (=> b!852157 m!792713))

(declare-fun m!792715 () Bool)

(assert (=> b!852157 m!792715))

(declare-fun m!792717 () Bool)

(assert (=> b!852157 m!792717))

(assert (=> b!852157 m!792715))

(declare-fun m!792719 () Bool)

(assert (=> b!852157 m!792719))

(declare-fun m!792721 () Bool)

(assert (=> b!852157 m!792721))

(declare-fun m!792723 () Bool)

(assert (=> b!852157 m!792723))

(declare-fun m!792725 () Bool)

(assert (=> b!852157 m!792725))

(declare-fun m!792727 () Bool)

(assert (=> b!852157 m!792727))

(assert (=> b!852157 m!792723))

(assert (=> b!852157 m!792697))

(declare-fun m!792729 () Bool)

(assert (=> b!852157 m!792729))

(declare-fun m!792731 () Bool)

(assert (=> b!852157 m!792731))

(declare-fun m!792733 () Bool)

(assert (=> b!852160 m!792733))

(assert (=> b!852158 m!792729))

(assert (=> b!852158 m!792729))

(declare-fun m!792735 () Bool)

(assert (=> b!852158 m!792735))

(declare-fun m!792737 () Bool)

(assert (=> b!852158 m!792737))

(check-sat (not b!852150) (not b!852160) (not b_lambda!11609) (not bm!38111) (not b!852152) tp_is_empty!16231 (not bm!38112) (not mapNonEmpty!25946) (not start!73162) (not b_next!14095) b_and!23325 (not b!852161) (not b!852158) (not b!852157) (not b!852149) (not b!852148))
(check-sat b_and!23325 (not b_next!14095))
