; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73096 () Bool)

(assert start!73096)

(declare-fun b_free!14029 () Bool)

(declare-fun b_next!14029 () Bool)

(assert (=> start!73096 (= b_free!14029 (not b_next!14029))))

(declare-fun tp!49592 () Bool)

(declare-fun b_and!23191 () Bool)

(assert (=> start!73096 (= tp!49592 b_and!23191)))

(declare-fun b!850597 () Bool)

(declare-fun e!474461 () Bool)

(assert (=> b!850597 (= e!474461 true)))

(declare-datatypes ((V!26601 0))(
  ( (V!26602 (val!8130 Int)) )
))
(declare-datatypes ((tuple2!10680 0))(
  ( (tuple2!10681 (_1!5351 (_ BitVec 64)) (_2!5351 V!26601)) )
))
(declare-datatypes ((List!16518 0))(
  ( (Nil!16515) (Cons!16514 (h!17645 tuple2!10680) (t!22984 List!16518)) )
))
(declare-datatypes ((ListLongMap!9439 0))(
  ( (ListLongMap!9440 (toList!4735 List!16518)) )
))
(declare-fun lt!382841 () ListLongMap!9439)

(declare-fun lt!382839 () tuple2!10680)

(declare-fun lt!382845 () V!26601)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2156 (ListLongMap!9439 tuple2!10680) ListLongMap!9439)

(assert (=> b!850597 (= (+!2156 lt!382841 lt!382839) (+!2156 (+!2156 lt!382841 (tuple2!10681 k0!854 lt!382845)) lt!382839))))

(declare-fun lt!382842 () V!26601)

(assert (=> b!850597 (= lt!382839 (tuple2!10681 k0!854 lt!382842))))

(declare-datatypes ((Unit!28985 0))(
  ( (Unit!28986) )
))
(declare-fun lt!382843 () Unit!28985)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!270 (ListLongMap!9439 (_ BitVec 64) V!26601 V!26601) Unit!28985)

(assert (=> b!850597 (= lt!382843 (addSameAsAddTwiceSameKeyDiffValues!270 lt!382841 k0!854 lt!382845 lt!382842))))

(declare-fun lt!382838 () V!26601)

(declare-datatypes ((ValueCell!7643 0))(
  ( (ValueCellFull!7643 (v!10549 V!26601)) (EmptyCell!7643) )
))
(declare-datatypes ((array!48525 0))(
  ( (array!48526 (arr!23294 (Array (_ BitVec 32) ValueCell!7643)) (size!23736 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48525)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12277 (ValueCell!7643 V!26601) V!26601)

(assert (=> b!850597 (= lt!382845 (get!12277 (select (arr!23294 _values!688) from!1053) lt!382838))))

(declare-fun lt!382844 () ListLongMap!9439)

(declare-datatypes ((array!48527 0))(
  ( (array!48528 (arr!23295 (Array (_ BitVec 32) (_ BitVec 64))) (size!23737 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48527)

(assert (=> b!850597 (= lt!382844 (+!2156 lt!382841 (tuple2!10681 (select (arr!23295 _keys!868) from!1053) lt!382842)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun v!557 () V!26601)

(assert (=> b!850597 (= lt!382842 (get!12277 (select (store (arr!23294 _values!688) i!612 (ValueCellFull!7643 v!557)) from!1053) lt!382838))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1020 (Int (_ BitVec 64)) V!26601)

(assert (=> b!850597 (= lt!382838 (dynLambda!1020 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26601)

(declare-fun zeroValue!654 () V!26601)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!382846 () array!48525)

(declare-fun getCurrentListMapNoExtraKeys!2743 (array!48527 array!48525 (_ BitVec 32) (_ BitVec 32) V!26601 V!26601 (_ BitVec 32) Int) ListLongMap!9439)

(assert (=> b!850597 (= lt!382841 (getCurrentListMapNoExtraKeys!2743 _keys!868 lt!382846 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850598 () Bool)

(declare-fun res!577852 () Bool)

(declare-fun e!474466 () Bool)

(assert (=> b!850598 (=> (not res!577852) (not e!474466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48527 (_ BitVec 32)) Bool)

(assert (=> b!850598 (= res!577852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!577850 () Bool)

(assert (=> start!73096 (=> (not res!577850) (not e!474466))))

(assert (=> start!73096 (= res!577850 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23737 _keys!868))))))

(assert (=> start!73096 e!474466))

(declare-fun tp_is_empty!16165 () Bool)

(assert (=> start!73096 tp_is_empty!16165))

(assert (=> start!73096 true))

(assert (=> start!73096 tp!49592))

(declare-fun array_inv!18562 (array!48527) Bool)

(assert (=> start!73096 (array_inv!18562 _keys!868)))

(declare-fun e!474468 () Bool)

(declare-fun array_inv!18563 (array!48525) Bool)

(assert (=> start!73096 (and (array_inv!18563 _values!688) e!474468)))

(declare-fun b!850599 () Bool)

(declare-fun res!577855 () Bool)

(assert (=> b!850599 (=> (not res!577855) (not e!474466))))

(assert (=> b!850599 (= res!577855 (and (= (size!23736 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23737 _keys!868) (size!23736 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850600 () Bool)

(declare-fun res!577857 () Bool)

(assert (=> b!850600 (=> (not res!577857) (not e!474466))))

(declare-datatypes ((List!16519 0))(
  ( (Nil!16516) (Cons!16515 (h!17646 (_ BitVec 64)) (t!22985 List!16519)) )
))
(declare-fun arrayNoDuplicates!0 (array!48527 (_ BitVec 32) List!16519) Bool)

(assert (=> b!850600 (= res!577857 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16516))))

(declare-fun b!850601 () Bool)

(declare-fun res!577853 () Bool)

(assert (=> b!850601 (=> (not res!577853) (not e!474466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850601 (= res!577853 (validMask!0 mask!1196))))

(declare-fun b!850602 () Bool)

(declare-fun e!474462 () Bool)

(declare-fun call!37916 () ListLongMap!9439)

(declare-fun call!37917 () ListLongMap!9439)

(assert (=> b!850602 (= e!474462 (= call!37916 call!37917))))

(declare-fun b!850603 () Bool)

(declare-fun e!474467 () Bool)

(assert (=> b!850603 (= e!474467 tp_is_empty!16165)))

(declare-fun b!850604 () Bool)

(declare-fun res!577851 () Bool)

(assert (=> b!850604 (=> (not res!577851) (not e!474466))))

(assert (=> b!850604 (= res!577851 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23737 _keys!868))))))

(declare-fun b!850605 () Bool)

(assert (=> b!850605 (= e!474462 (= call!37916 (+!2156 call!37917 (tuple2!10681 k0!854 v!557))))))

(declare-fun mapIsEmpty!25847 () Bool)

(declare-fun mapRes!25847 () Bool)

(assert (=> mapIsEmpty!25847 mapRes!25847))

(declare-fun b!850606 () Bool)

(assert (=> b!850606 (= e!474468 (and e!474467 mapRes!25847))))

(declare-fun condMapEmpty!25847 () Bool)

(declare-fun mapDefault!25847 () ValueCell!7643)

(assert (=> b!850606 (= condMapEmpty!25847 (= (arr!23294 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7643)) mapDefault!25847)))))

(declare-fun bm!37913 () Bool)

(assert (=> bm!37913 (= call!37917 (getCurrentListMapNoExtraKeys!2743 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25847 () Bool)

(declare-fun tp!49591 () Bool)

(declare-fun e!474463 () Bool)

(assert (=> mapNonEmpty!25847 (= mapRes!25847 (and tp!49591 e!474463))))

(declare-fun mapValue!25847 () ValueCell!7643)

(declare-fun mapRest!25847 () (Array (_ BitVec 32) ValueCell!7643))

(declare-fun mapKey!25847 () (_ BitVec 32))

(assert (=> mapNonEmpty!25847 (= (arr!23294 _values!688) (store mapRest!25847 mapKey!25847 mapValue!25847))))

(declare-fun b!850607 () Bool)

(declare-fun res!577849 () Bool)

(assert (=> b!850607 (=> (not res!577849) (not e!474466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850607 (= res!577849 (validKeyInArray!0 k0!854))))

(declare-fun bm!37914 () Bool)

(assert (=> bm!37914 (= call!37916 (getCurrentListMapNoExtraKeys!2743 _keys!868 lt!382846 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850608 () Bool)

(declare-fun res!577848 () Bool)

(assert (=> b!850608 (=> (not res!577848) (not e!474466))))

(assert (=> b!850608 (= res!577848 (and (= (select (arr!23295 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850609 () Bool)

(assert (=> b!850609 (= e!474463 tp_is_empty!16165)))

(declare-fun b!850610 () Bool)

(declare-fun e!474464 () Bool)

(assert (=> b!850610 (= e!474466 e!474464)))

(declare-fun res!577856 () Bool)

(assert (=> b!850610 (=> (not res!577856) (not e!474464))))

(assert (=> b!850610 (= res!577856 (= from!1053 i!612))))

(assert (=> b!850610 (= lt!382844 (getCurrentListMapNoExtraKeys!2743 _keys!868 lt!382846 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850610 (= lt!382846 (array!48526 (store (arr!23294 _values!688) i!612 (ValueCellFull!7643 v!557)) (size!23736 _values!688)))))

(declare-fun lt!382840 () ListLongMap!9439)

(assert (=> b!850610 (= lt!382840 (getCurrentListMapNoExtraKeys!2743 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850611 () Bool)

(assert (=> b!850611 (= e!474464 (not e!474461))))

(declare-fun res!577854 () Bool)

(assert (=> b!850611 (=> res!577854 e!474461)))

(assert (=> b!850611 (= res!577854 (not (validKeyInArray!0 (select (arr!23295 _keys!868) from!1053))))))

(assert (=> b!850611 e!474462))

(declare-fun c!91649 () Bool)

(assert (=> b!850611 (= c!91649 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382847 () Unit!28985)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!364 (array!48527 array!48525 (_ BitVec 32) (_ BitVec 32) V!26601 V!26601 (_ BitVec 32) (_ BitVec 64) V!26601 (_ BitVec 32) Int) Unit!28985)

(assert (=> b!850611 (= lt!382847 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!364 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73096 res!577850) b!850601))

(assert (= (and b!850601 res!577853) b!850599))

(assert (= (and b!850599 res!577855) b!850598))

(assert (= (and b!850598 res!577852) b!850600))

(assert (= (and b!850600 res!577857) b!850604))

(assert (= (and b!850604 res!577851) b!850607))

(assert (= (and b!850607 res!577849) b!850608))

(assert (= (and b!850608 res!577848) b!850610))

(assert (= (and b!850610 res!577856) b!850611))

(assert (= (and b!850611 c!91649) b!850605))

(assert (= (and b!850611 (not c!91649)) b!850602))

(assert (= (or b!850605 b!850602) bm!37914))

(assert (= (or b!850605 b!850602) bm!37913))

(assert (= (and b!850611 (not res!577854)) b!850597))

(assert (= (and b!850606 condMapEmpty!25847) mapIsEmpty!25847))

(assert (= (and b!850606 (not condMapEmpty!25847)) mapNonEmpty!25847))

(get-info :version)

(assert (= (and mapNonEmpty!25847 ((_ is ValueCellFull!7643) mapValue!25847)) b!850609))

(assert (= (and b!850606 ((_ is ValueCellFull!7643) mapDefault!25847)) b!850603))

(assert (= start!73096 b!850606))

(declare-fun b_lambda!11543 () Bool)

(assert (=> (not b_lambda!11543) (not b!850597)))

(declare-fun t!22983 () Bool)

(declare-fun tb!4323 () Bool)

(assert (=> (and start!73096 (= defaultEntry!696 defaultEntry!696) t!22983) tb!4323))

(declare-fun result!8265 () Bool)

(assert (=> tb!4323 (= result!8265 tp_is_empty!16165)))

(assert (=> b!850597 t!22983))

(declare-fun b_and!23193 () Bool)

(assert (= b_and!23191 (and (=> t!22983 result!8265) b_and!23193)))

(declare-fun m!790903 () Bool)

(assert (=> bm!37914 m!790903))

(declare-fun m!790905 () Bool)

(assert (=> start!73096 m!790905))

(declare-fun m!790907 () Bool)

(assert (=> start!73096 m!790907))

(declare-fun m!790909 () Bool)

(assert (=> b!850610 m!790909))

(declare-fun m!790911 () Bool)

(assert (=> b!850610 m!790911))

(declare-fun m!790913 () Bool)

(assert (=> b!850610 m!790913))

(declare-fun m!790915 () Bool)

(assert (=> b!850607 m!790915))

(declare-fun m!790917 () Bool)

(assert (=> b!850598 m!790917))

(declare-fun m!790919 () Bool)

(assert (=> b!850600 m!790919))

(declare-fun m!790921 () Bool)

(assert (=> b!850608 m!790921))

(declare-fun m!790923 () Bool)

(assert (=> b!850605 m!790923))

(declare-fun m!790925 () Bool)

(assert (=> b!850601 m!790925))

(declare-fun m!790927 () Bool)

(assert (=> bm!37913 m!790927))

(declare-fun m!790929 () Bool)

(assert (=> mapNonEmpty!25847 m!790929))

(declare-fun m!790931 () Bool)

(assert (=> b!850597 m!790931))

(declare-fun m!790933 () Bool)

(assert (=> b!850597 m!790933))

(assert (=> b!850597 m!790903))

(declare-fun m!790935 () Bool)

(assert (=> b!850597 m!790935))

(assert (=> b!850597 m!790931))

(declare-fun m!790937 () Bool)

(assert (=> b!850597 m!790937))

(declare-fun m!790939 () Bool)

(assert (=> b!850597 m!790939))

(declare-fun m!790941 () Bool)

(assert (=> b!850597 m!790941))

(declare-fun m!790943 () Bool)

(assert (=> b!850597 m!790943))

(assert (=> b!850597 m!790937))

(assert (=> b!850597 m!790911))

(declare-fun m!790945 () Bool)

(assert (=> b!850597 m!790945))

(assert (=> b!850597 m!790935))

(declare-fun m!790947 () Bool)

(assert (=> b!850597 m!790947))

(declare-fun m!790949 () Bool)

(assert (=> b!850597 m!790949))

(declare-fun m!790951 () Bool)

(assert (=> b!850597 m!790951))

(assert (=> b!850611 m!790949))

(assert (=> b!850611 m!790949))

(declare-fun m!790953 () Bool)

(assert (=> b!850611 m!790953))

(declare-fun m!790955 () Bool)

(assert (=> b!850611 m!790955))

(check-sat (not bm!37913) (not b!850597) b_and!23193 (not b!850607) (not b!850610) (not b!850605) (not b!850598) (not b!850611) (not start!73096) (not b_lambda!11543) (not bm!37914) (not b_next!14029) (not b!850600) (not mapNonEmpty!25847) (not b!850601) tp_is_empty!16165)
(check-sat b_and!23193 (not b_next!14029))
