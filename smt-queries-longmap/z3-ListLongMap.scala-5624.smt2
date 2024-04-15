; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73510 () Bool)

(assert start!73510)

(declare-fun b_free!14443 () Bool)

(declare-fun b_next!14443 () Bool)

(assert (=> start!73510 (= b_free!14443 (not b_next!14443))))

(declare-fun tp!50834 () Bool)

(declare-fun b_and!23839 () Bool)

(assert (=> start!73510 (= tp!50834 b_and!23839)))

(declare-fun b!859097 () Bool)

(declare-fun res!583756 () Bool)

(declare-fun e!478750 () Bool)

(assert (=> b!859097 (=> (not res!583756) (not e!478750))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859097 (= res!583756 (validKeyInArray!0 k0!854))))

(declare-fun b!859098 () Bool)

(declare-fun res!583758 () Bool)

(assert (=> b!859098 (=> (not res!583758) (not e!478750))))

(declare-datatypes ((array!49323 0))(
  ( (array!49324 (arr!23693 (Array (_ BitVec 32) (_ BitVec 64))) (size!24135 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49323)

(declare-datatypes ((List!16817 0))(
  ( (Nil!16814) (Cons!16813 (h!17944 (_ BitVec 64)) (t!23517 List!16817)) )
))
(declare-fun arrayNoDuplicates!0 (array!49323 (_ BitVec 32) List!16817) Bool)

(assert (=> b!859098 (= res!583758 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16814))))

(declare-fun b!859099 () Bool)

(declare-fun res!583755 () Bool)

(assert (=> b!859099 (=> (not res!583755) (not e!478750))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!27153 0))(
  ( (V!27154 (val!8337 Int)) )
))
(declare-datatypes ((ValueCell!7850 0))(
  ( (ValueCellFull!7850 (v!10756 V!27153)) (EmptyCell!7850) )
))
(declare-datatypes ((array!49325 0))(
  ( (array!49326 (arr!23694 (Array (_ BitVec 32) ValueCell!7850)) (size!24136 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49325)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!859099 (= res!583755 (and (= (size!24136 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24135 _keys!868) (size!24136 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859100 () Bool)

(declare-fun e!478755 () Bool)

(assert (=> b!859100 (= e!478750 e!478755)))

(declare-fun res!583757 () Bool)

(assert (=> b!859100 (=> (not res!583757) (not e!478755))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859100 (= res!583757 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11016 0))(
  ( (tuple2!11017 (_1!5519 (_ BitVec 64)) (_2!5519 V!27153)) )
))
(declare-datatypes ((List!16818 0))(
  ( (Nil!16815) (Cons!16814 (h!17945 tuple2!11016) (t!23518 List!16818)) )
))
(declare-datatypes ((ListLongMap!9775 0))(
  ( (ListLongMap!9776 (toList!4903 List!16818)) )
))
(declare-fun lt!386969 () ListLongMap!9775)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386972 () array!49325)

(declare-fun minValue!654 () V!27153)

(declare-fun zeroValue!654 () V!27153)

(declare-fun getCurrentListMapNoExtraKeys!2907 (array!49323 array!49325 (_ BitVec 32) (_ BitVec 32) V!27153 V!27153 (_ BitVec 32) Int) ListLongMap!9775)

(assert (=> b!859100 (= lt!386969 (getCurrentListMapNoExtraKeys!2907 _keys!868 lt!386972 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27153)

(assert (=> b!859100 (= lt!386972 (array!49326 (store (arr!23694 _values!688) i!612 (ValueCellFull!7850 v!557)) (size!24136 _values!688)))))

(declare-fun lt!386970 () ListLongMap!9775)

(assert (=> b!859100 (= lt!386970 (getCurrentListMapNoExtraKeys!2907 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859101 () Bool)

(declare-fun res!583754 () Bool)

(declare-fun e!478751 () Bool)

(assert (=> b!859101 (=> res!583754 e!478751)))

(declare-fun contains!4196 (List!16817 (_ BitVec 64)) Bool)

(assert (=> b!859101 (= res!583754 (contains!4196 Nil!16814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859102 () Bool)

(declare-fun e!478752 () Bool)

(assert (=> b!859102 (= e!478752 e!478751)))

(declare-fun res!583764 () Bool)

(assert (=> b!859102 (=> res!583764 e!478751)))

(assert (=> b!859102 (= res!583764 (or (bvsge (size!24135 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24135 _keys!868)) (bvsge from!1053 (size!24135 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859102 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!29223 0))(
  ( (Unit!29224) )
))
(declare-fun lt!386976 () Unit!29223)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49323 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29223)

(assert (=> b!859102 (= lt!386976 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!859102 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16814)))

(declare-fun lt!386974 () Unit!29223)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49323 (_ BitVec 32) (_ BitVec 32)) Unit!29223)

(assert (=> b!859102 (= lt!386974 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun res!583751 () Bool)

(assert (=> start!73510 (=> (not res!583751) (not e!478750))))

(assert (=> start!73510 (= res!583751 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24135 _keys!868))))))

(assert (=> start!73510 e!478750))

(declare-fun tp_is_empty!16579 () Bool)

(assert (=> start!73510 tp_is_empty!16579))

(assert (=> start!73510 true))

(assert (=> start!73510 tp!50834))

(declare-fun array_inv!18822 (array!49323) Bool)

(assert (=> start!73510 (array_inv!18822 _keys!868)))

(declare-fun e!478749 () Bool)

(declare-fun array_inv!18823 (array!49325) Bool)

(assert (=> start!73510 (and (array_inv!18823 _values!688) e!478749)))

(declare-fun b!859103 () Bool)

(declare-fun e!478748 () Bool)

(declare-fun mapRes!26468 () Bool)

(assert (=> b!859103 (= e!478749 (and e!478748 mapRes!26468))))

(declare-fun condMapEmpty!26468 () Bool)

(declare-fun mapDefault!26468 () ValueCell!7850)

(assert (=> b!859103 (= condMapEmpty!26468 (= (arr!23694 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7850)) mapDefault!26468)))))

(declare-fun b!859104 () Bool)

(declare-fun e!478753 () Bool)

(assert (=> b!859104 (= e!478753 e!478752)))

(declare-fun res!583752 () Bool)

(assert (=> b!859104 (=> res!583752 e!478752)))

(assert (=> b!859104 (= res!583752 (not (= (select (arr!23693 _keys!868) from!1053) k0!854)))))

(declare-fun lt!386973 () ListLongMap!9775)

(declare-fun +!2277 (ListLongMap!9775 tuple2!11016) ListLongMap!9775)

(declare-fun get!12488 (ValueCell!7850 V!27153) V!27153)

(declare-fun dynLambda!1093 (Int (_ BitVec 64)) V!27153)

(assert (=> b!859104 (= lt!386969 (+!2277 lt!386973 (tuple2!11017 (select (arr!23693 _keys!868) from!1053) (get!12488 (select (arr!23694 _values!688) from!1053) (dynLambda!1093 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!26468 () Bool)

(assert (=> mapIsEmpty!26468 mapRes!26468))

(declare-fun b!859105 () Bool)

(declare-fun res!583760 () Bool)

(assert (=> b!859105 (=> res!583760 e!478751)))

(declare-fun noDuplicate!1306 (List!16817) Bool)

(assert (=> b!859105 (= res!583760 (not (noDuplicate!1306 Nil!16814)))))

(declare-fun b!859106 () Bool)

(declare-fun res!583763 () Bool)

(assert (=> b!859106 (=> (not res!583763) (not e!478750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859106 (= res!583763 (validMask!0 mask!1196))))

(declare-fun b!859107 () Bool)

(assert (=> b!859107 (= e!478748 tp_is_empty!16579)))

(declare-fun b!859108 () Bool)

(assert (=> b!859108 (= e!478751 true)))

(declare-fun lt!386975 () Bool)

(assert (=> b!859108 (= lt!386975 (contains!4196 Nil!16814 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859109 () Bool)

(declare-fun res!583762 () Bool)

(assert (=> b!859109 (=> (not res!583762) (not e!478750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49323 (_ BitVec 32)) Bool)

(assert (=> b!859109 (= res!583762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859110 () Bool)

(declare-fun res!583753 () Bool)

(assert (=> b!859110 (=> (not res!583753) (not e!478750))))

(assert (=> b!859110 (= res!583753 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24135 _keys!868))))))

(declare-fun b!859111 () Bool)

(declare-fun res!583761 () Bool)

(assert (=> b!859111 (=> (not res!583761) (not e!478750))))

(assert (=> b!859111 (= res!583761 (and (= (select (arr!23693 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859112 () Bool)

(assert (=> b!859112 (= e!478755 (not e!478753))))

(declare-fun res!583759 () Bool)

(assert (=> b!859112 (=> res!583759 e!478753)))

(assert (=> b!859112 (= res!583759 (not (validKeyInArray!0 (select (arr!23693 _keys!868) from!1053))))))

(declare-fun lt!386977 () ListLongMap!9775)

(assert (=> b!859112 (= lt!386977 lt!386973)))

(declare-fun lt!386971 () ListLongMap!9775)

(assert (=> b!859112 (= lt!386973 (+!2277 lt!386971 (tuple2!11017 k0!854 v!557)))))

(assert (=> b!859112 (= lt!386977 (getCurrentListMapNoExtraKeys!2907 _keys!868 lt!386972 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859112 (= lt!386971 (getCurrentListMapNoExtraKeys!2907 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!386978 () Unit!29223)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!469 (array!49323 array!49325 (_ BitVec 32) (_ BitVec 32) V!27153 V!27153 (_ BitVec 32) (_ BitVec 64) V!27153 (_ BitVec 32) Int) Unit!29223)

(assert (=> b!859112 (= lt!386978 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!469 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859113 () Bool)

(declare-fun e!478754 () Bool)

(assert (=> b!859113 (= e!478754 tp_is_empty!16579)))

(declare-fun mapNonEmpty!26468 () Bool)

(declare-fun tp!50833 () Bool)

(assert (=> mapNonEmpty!26468 (= mapRes!26468 (and tp!50833 e!478754))))

(declare-fun mapRest!26468 () (Array (_ BitVec 32) ValueCell!7850))

(declare-fun mapValue!26468 () ValueCell!7850)

(declare-fun mapKey!26468 () (_ BitVec 32))

(assert (=> mapNonEmpty!26468 (= (arr!23694 _values!688) (store mapRest!26468 mapKey!26468 mapValue!26468))))

(assert (= (and start!73510 res!583751) b!859106))

(assert (= (and b!859106 res!583763) b!859099))

(assert (= (and b!859099 res!583755) b!859109))

(assert (= (and b!859109 res!583762) b!859098))

(assert (= (and b!859098 res!583758) b!859110))

(assert (= (and b!859110 res!583753) b!859097))

(assert (= (and b!859097 res!583756) b!859111))

(assert (= (and b!859111 res!583761) b!859100))

(assert (= (and b!859100 res!583757) b!859112))

(assert (= (and b!859112 (not res!583759)) b!859104))

(assert (= (and b!859104 (not res!583752)) b!859102))

(assert (= (and b!859102 (not res!583764)) b!859105))

(assert (= (and b!859105 (not res!583760)) b!859101))

(assert (= (and b!859101 (not res!583754)) b!859108))

(assert (= (and b!859103 condMapEmpty!26468) mapIsEmpty!26468))

(assert (= (and b!859103 (not condMapEmpty!26468)) mapNonEmpty!26468))

(get-info :version)

(assert (= (and mapNonEmpty!26468 ((_ is ValueCellFull!7850) mapValue!26468)) b!859113))

(assert (= (and b!859103 ((_ is ValueCellFull!7850) mapDefault!26468)) b!859107))

(assert (= start!73510 b!859103))

(declare-fun b_lambda!11777 () Bool)

(assert (=> (not b_lambda!11777) (not b!859104)))

(declare-fun t!23516 () Bool)

(declare-fun tb!4557 () Bool)

(assert (=> (and start!73510 (= defaultEntry!696 defaultEntry!696) t!23516) tb!4557))

(declare-fun result!8733 () Bool)

(assert (=> tb!4557 (= result!8733 tp_is_empty!16579)))

(assert (=> b!859104 t!23516))

(declare-fun b_and!23841 () Bool)

(assert (= b_and!23839 (and (=> t!23516 result!8733) b_and!23841)))

(declare-fun m!799323 () Bool)

(assert (=> b!859098 m!799323))

(declare-fun m!799325 () Bool)

(assert (=> b!859101 m!799325))

(declare-fun m!799327 () Bool)

(assert (=> b!859097 m!799327))

(declare-fun m!799329 () Bool)

(assert (=> b!859100 m!799329))

(declare-fun m!799331 () Bool)

(assert (=> b!859100 m!799331))

(declare-fun m!799333 () Bool)

(assert (=> b!859100 m!799333))

(declare-fun m!799335 () Bool)

(assert (=> start!73510 m!799335))

(declare-fun m!799337 () Bool)

(assert (=> start!73510 m!799337))

(declare-fun m!799339 () Bool)

(assert (=> mapNonEmpty!26468 m!799339))

(declare-fun m!799341 () Bool)

(assert (=> b!859102 m!799341))

(declare-fun m!799343 () Bool)

(assert (=> b!859102 m!799343))

(declare-fun m!799345 () Bool)

(assert (=> b!859102 m!799345))

(declare-fun m!799347 () Bool)

(assert (=> b!859102 m!799347))

(declare-fun m!799349 () Bool)

(assert (=> b!859106 m!799349))

(declare-fun m!799351 () Bool)

(assert (=> b!859108 m!799351))

(declare-fun m!799353 () Bool)

(assert (=> b!859112 m!799353))

(declare-fun m!799355 () Bool)

(assert (=> b!859112 m!799355))

(declare-fun m!799357 () Bool)

(assert (=> b!859112 m!799357))

(declare-fun m!799359 () Bool)

(assert (=> b!859112 m!799359))

(assert (=> b!859112 m!799357))

(declare-fun m!799361 () Bool)

(assert (=> b!859112 m!799361))

(declare-fun m!799363 () Bool)

(assert (=> b!859112 m!799363))

(declare-fun m!799365 () Bool)

(assert (=> b!859109 m!799365))

(declare-fun m!799367 () Bool)

(assert (=> b!859111 m!799367))

(declare-fun m!799369 () Bool)

(assert (=> b!859104 m!799369))

(declare-fun m!799371 () Bool)

(assert (=> b!859104 m!799371))

(declare-fun m!799373 () Bool)

(assert (=> b!859104 m!799373))

(declare-fun m!799375 () Bool)

(assert (=> b!859104 m!799375))

(assert (=> b!859104 m!799371))

(assert (=> b!859104 m!799357))

(assert (=> b!859104 m!799373))

(declare-fun m!799377 () Bool)

(assert (=> b!859105 m!799377))

(check-sat (not b!859101) (not b!859109) (not b!859112) (not b!859097) (not mapNonEmpty!26468) (not b!859108) (not start!73510) tp_is_empty!16579 (not b_next!14443) (not b!859104) (not b_lambda!11777) (not b!859100) (not b!859105) (not b!859106) (not b!859098) (not b!859102) b_and!23841)
(check-sat b_and!23841 (not b_next!14443))
