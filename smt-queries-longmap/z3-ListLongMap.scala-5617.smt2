; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73488 () Bool)

(assert start!73488)

(declare-fun b_free!14403 () Bool)

(declare-fun b_next!14403 () Bool)

(assert (=> start!73488 (= b_free!14403 (not b_next!14403))))

(declare-fun tp!50713 () Bool)

(declare-fun b_and!23785 () Bool)

(assert (=> start!73488 (= tp!50713 b_and!23785)))

(declare-fun b!858454 () Bool)

(declare-fun res!583204 () Bool)

(declare-fun e!478417 () Bool)

(assert (=> b!858454 (=> (not res!583204) (not e!478417))))

(declare-datatypes ((array!49262 0))(
  ( (array!49263 (arr!23662 (Array (_ BitVec 32) (_ BitVec 64))) (size!24102 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49262)

(declare-datatypes ((List!16786 0))(
  ( (Nil!16783) (Cons!16782 (h!17913 (_ BitVec 64)) (t!23455 List!16786)) )
))
(declare-fun arrayNoDuplicates!0 (array!49262 (_ BitVec 32) List!16786) Bool)

(assert (=> b!858454 (= res!583204 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16783))))

(declare-fun b!858455 () Bool)

(declare-fun res!583206 () Bool)

(assert (=> b!858455 (=> (not res!583206) (not e!478417))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858455 (= res!583206 (validMask!0 mask!1196))))

(declare-fun b!858456 () Bool)

(declare-fun e!478422 () Bool)

(declare-fun e!478421 () Bool)

(assert (=> b!858456 (= e!478422 (not e!478421))))

(declare-fun res!583200 () Bool)

(assert (=> b!858456 (=> res!583200 e!478421)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858456 (= res!583200 (not (validKeyInArray!0 (select (arr!23662 _keys!868) from!1053))))))

(declare-datatypes ((V!27099 0))(
  ( (V!27100 (val!8317 Int)) )
))
(declare-datatypes ((tuple2!10978 0))(
  ( (tuple2!10979 (_1!5500 (_ BitVec 64)) (_2!5500 V!27099)) )
))
(declare-datatypes ((List!16787 0))(
  ( (Nil!16784) (Cons!16783 (h!17914 tuple2!10978) (t!23456 List!16787)) )
))
(declare-datatypes ((ListLongMap!9747 0))(
  ( (ListLongMap!9748 (toList!4889 List!16787)) )
))
(declare-fun lt!386728 () ListLongMap!9747)

(declare-fun lt!386727 () ListLongMap!9747)

(assert (=> b!858456 (= lt!386728 lt!386727)))

(declare-fun lt!386726 () ListLongMap!9747)

(declare-fun v!557 () V!27099)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2242 (ListLongMap!9747 tuple2!10978) ListLongMap!9747)

(assert (=> b!858456 (= lt!386727 (+!2242 lt!386726 (tuple2!10979 k0!854 v!557)))))

(declare-datatypes ((ValueCell!7830 0))(
  ( (ValueCellFull!7830 (v!10742 V!27099)) (EmptyCell!7830) )
))
(declare-datatypes ((array!49264 0))(
  ( (array!49265 (arr!23663 (Array (_ BitVec 32) ValueCell!7830)) (size!24103 (_ BitVec 32))) )
))
(declare-fun lt!386731 () array!49264)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27099)

(declare-fun zeroValue!654 () V!27099)

(declare-fun getCurrentListMapNoExtraKeys!2870 (array!49262 array!49264 (_ BitVec 32) (_ BitVec 32) V!27099 V!27099 (_ BitVec 32) Int) ListLongMap!9747)

(assert (=> b!858456 (= lt!386728 (getCurrentListMapNoExtraKeys!2870 _keys!868 lt!386731 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49264)

(assert (=> b!858456 (= lt!386726 (getCurrentListMapNoExtraKeys!2870 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29269 0))(
  ( (Unit!29270) )
))
(declare-fun lt!386730 () Unit!29269)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!462 (array!49262 array!49264 (_ BitVec 32) (_ BitVec 32) V!27099 V!27099 (_ BitVec 32) (_ BitVec 64) V!27099 (_ BitVec 32) Int) Unit!29269)

(assert (=> b!858456 (= lt!386730 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!462 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!858457 () Bool)

(assert (=> b!858457 (= e!478421 true)))

(declare-fun lt!386725 () ListLongMap!9747)

(declare-fun get!12460 (ValueCell!7830 V!27099) V!27099)

(declare-fun dynLambda!1082 (Int (_ BitVec 64)) V!27099)

(assert (=> b!858457 (= lt!386725 (+!2242 lt!386727 (tuple2!10979 (select (arr!23662 _keys!868) from!1053) (get!12460 (select (arr!23663 _values!688) from!1053) (dynLambda!1082 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858458 () Bool)

(declare-fun e!478419 () Bool)

(declare-fun e!478420 () Bool)

(declare-fun mapRes!26408 () Bool)

(assert (=> b!858458 (= e!478419 (and e!478420 mapRes!26408))))

(declare-fun condMapEmpty!26408 () Bool)

(declare-fun mapDefault!26408 () ValueCell!7830)

(assert (=> b!858458 (= condMapEmpty!26408 (= (arr!23663 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7830)) mapDefault!26408)))))

(declare-fun b!858459 () Bool)

(declare-fun res!583207 () Bool)

(assert (=> b!858459 (=> (not res!583207) (not e!478417))))

(assert (=> b!858459 (= res!583207 (and (= (select (arr!23662 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858460 () Bool)

(declare-fun res!583199 () Bool)

(assert (=> b!858460 (=> (not res!583199) (not e!478417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49262 (_ BitVec 32)) Bool)

(assert (=> b!858460 (= res!583199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858461 () Bool)

(declare-fun e!478423 () Bool)

(declare-fun tp_is_empty!16539 () Bool)

(assert (=> b!858461 (= e!478423 tp_is_empty!16539)))

(declare-fun b!858462 () Bool)

(assert (=> b!858462 (= e!478420 tp_is_empty!16539)))

(declare-fun res!583208 () Bool)

(assert (=> start!73488 (=> (not res!583208) (not e!478417))))

(assert (=> start!73488 (= res!583208 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24102 _keys!868))))))

(assert (=> start!73488 e!478417))

(assert (=> start!73488 tp_is_empty!16539))

(assert (=> start!73488 true))

(assert (=> start!73488 tp!50713))

(declare-fun array_inv!18740 (array!49262) Bool)

(assert (=> start!73488 (array_inv!18740 _keys!868)))

(declare-fun array_inv!18741 (array!49264) Bool)

(assert (=> start!73488 (and (array_inv!18741 _values!688) e!478419)))

(declare-fun b!858463 () Bool)

(declare-fun res!583205 () Bool)

(assert (=> b!858463 (=> (not res!583205) (not e!478417))))

(assert (=> b!858463 (= res!583205 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26408 () Bool)

(assert (=> mapIsEmpty!26408 mapRes!26408))

(declare-fun mapNonEmpty!26408 () Bool)

(declare-fun tp!50712 () Bool)

(assert (=> mapNonEmpty!26408 (= mapRes!26408 (and tp!50712 e!478423))))

(declare-fun mapValue!26408 () ValueCell!7830)

(declare-fun mapRest!26408 () (Array (_ BitVec 32) ValueCell!7830))

(declare-fun mapKey!26408 () (_ BitVec 32))

(assert (=> mapNonEmpty!26408 (= (arr!23663 _values!688) (store mapRest!26408 mapKey!26408 mapValue!26408))))

(declare-fun b!858464 () Bool)

(declare-fun res!583201 () Bool)

(assert (=> b!858464 (=> (not res!583201) (not e!478417))))

(assert (=> b!858464 (= res!583201 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24102 _keys!868))))))

(declare-fun b!858465 () Bool)

(assert (=> b!858465 (= e!478417 e!478422)))

(declare-fun res!583203 () Bool)

(assert (=> b!858465 (=> (not res!583203) (not e!478422))))

(assert (=> b!858465 (= res!583203 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!858465 (= lt!386725 (getCurrentListMapNoExtraKeys!2870 _keys!868 lt!386731 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!858465 (= lt!386731 (array!49265 (store (arr!23663 _values!688) i!612 (ValueCellFull!7830 v!557)) (size!24103 _values!688)))))

(declare-fun lt!386729 () ListLongMap!9747)

(assert (=> b!858465 (= lt!386729 (getCurrentListMapNoExtraKeys!2870 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858466 () Bool)

(declare-fun res!583202 () Bool)

(assert (=> b!858466 (=> (not res!583202) (not e!478417))))

(assert (=> b!858466 (= res!583202 (and (= (size!24103 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24102 _keys!868) (size!24103 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73488 res!583208) b!858455))

(assert (= (and b!858455 res!583206) b!858466))

(assert (= (and b!858466 res!583202) b!858460))

(assert (= (and b!858460 res!583199) b!858454))

(assert (= (and b!858454 res!583204) b!858464))

(assert (= (and b!858464 res!583201) b!858463))

(assert (= (and b!858463 res!583205) b!858459))

(assert (= (and b!858459 res!583207) b!858465))

(assert (= (and b!858465 res!583203) b!858456))

(assert (= (and b!858456 (not res!583200)) b!858457))

(assert (= (and b!858458 condMapEmpty!26408) mapIsEmpty!26408))

(assert (= (and b!858458 (not condMapEmpty!26408)) mapNonEmpty!26408))

(get-info :version)

(assert (= (and mapNonEmpty!26408 ((_ is ValueCellFull!7830) mapValue!26408)) b!858461))

(assert (= (and b!858458 ((_ is ValueCellFull!7830) mapDefault!26408)) b!858462))

(assert (= start!73488 b!858458))

(declare-fun b_lambda!11755 () Bool)

(assert (=> (not b_lambda!11755) (not b!858457)))

(declare-fun t!23454 () Bool)

(declare-fun tb!4525 () Bool)

(assert (=> (and start!73488 (= defaultEntry!696 defaultEntry!696) t!23454) tb!4525))

(declare-fun result!8661 () Bool)

(assert (=> tb!4525 (= result!8661 tp_is_empty!16539)))

(assert (=> b!858457 t!23454))

(declare-fun b_and!23787 () Bool)

(assert (= b_and!23785 (and (=> t!23454 result!8661) b_and!23787)))

(declare-fun m!799169 () Bool)

(assert (=> mapNonEmpty!26408 m!799169))

(declare-fun m!799171 () Bool)

(assert (=> b!858459 m!799171))

(declare-fun m!799173 () Bool)

(assert (=> b!858456 m!799173))

(declare-fun m!799175 () Bool)

(assert (=> b!858456 m!799175))

(declare-fun m!799177 () Bool)

(assert (=> b!858456 m!799177))

(declare-fun m!799179 () Bool)

(assert (=> b!858456 m!799179))

(assert (=> b!858456 m!799177))

(declare-fun m!799181 () Bool)

(assert (=> b!858456 m!799181))

(declare-fun m!799183 () Bool)

(assert (=> b!858456 m!799183))

(declare-fun m!799185 () Bool)

(assert (=> b!858455 m!799185))

(declare-fun m!799187 () Bool)

(assert (=> b!858460 m!799187))

(declare-fun m!799189 () Bool)

(assert (=> b!858457 m!799189))

(declare-fun m!799191 () Bool)

(assert (=> b!858457 m!799191))

(declare-fun m!799193 () Bool)

(assert (=> b!858457 m!799193))

(declare-fun m!799195 () Bool)

(assert (=> b!858457 m!799195))

(assert (=> b!858457 m!799191))

(assert (=> b!858457 m!799177))

(assert (=> b!858457 m!799193))

(declare-fun m!799197 () Bool)

(assert (=> b!858463 m!799197))

(declare-fun m!799199 () Bool)

(assert (=> start!73488 m!799199))

(declare-fun m!799201 () Bool)

(assert (=> start!73488 m!799201))

(declare-fun m!799203 () Bool)

(assert (=> b!858454 m!799203))

(declare-fun m!799205 () Bool)

(assert (=> b!858465 m!799205))

(declare-fun m!799207 () Bool)

(assert (=> b!858465 m!799207))

(declare-fun m!799209 () Bool)

(assert (=> b!858465 m!799209))

(check-sat (not b_next!14403) (not b!858463) (not b_lambda!11755) (not b!858465) (not b!858456) (not mapNonEmpty!26408) (not b!858460) (not start!73488) (not b!858454) (not b!858457) (not b!858455) b_and!23787 tp_is_empty!16539)
(check-sat b_and!23787 (not b_next!14403))
