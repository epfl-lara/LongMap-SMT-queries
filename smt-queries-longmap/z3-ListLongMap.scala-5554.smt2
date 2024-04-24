; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73276 () Bool)

(assert start!73276)

(declare-fun b_free!14023 () Bool)

(declare-fun b_next!14023 () Bool)

(assert (=> start!73276 (= b_free!14023 (not b_next!14023))))

(declare-fun tp!49573 () Bool)

(declare-fun b_and!23215 () Bool)

(assert (=> start!73276 (= tp!49573 b_and!23215)))

(declare-fun mapIsEmpty!25838 () Bool)

(declare-fun mapRes!25838 () Bool)

(assert (=> mapIsEmpty!25838 mapRes!25838))

(declare-fun b!851598 () Bool)

(declare-fun e!475125 () Bool)

(declare-fun e!475120 () Bool)

(assert (=> b!851598 (= e!475125 (and e!475120 mapRes!25838))))

(declare-fun condMapEmpty!25838 () Bool)

(declare-datatypes ((V!26593 0))(
  ( (V!26594 (val!8127 Int)) )
))
(declare-datatypes ((ValueCell!7640 0))(
  ( (ValueCellFull!7640 (v!10552 V!26593)) (EmptyCell!7640) )
))
(declare-datatypes ((array!48571 0))(
  ( (array!48572 (arr!23312 (Array (_ BitVec 32) ValueCell!7640)) (size!23753 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48571)

(declare-fun mapDefault!25838 () ValueCell!7640)

(assert (=> b!851598 (= condMapEmpty!25838 (= (arr!23312 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7640)) mapDefault!25838)))))

(declare-fun b!851599 () Bool)

(declare-fun e!475123 () Bool)

(declare-fun tp_is_empty!16159 () Bool)

(assert (=> b!851599 (= e!475123 tp_is_empty!16159)))

(declare-fun mapNonEmpty!25838 () Bool)

(declare-fun tp!49574 () Bool)

(assert (=> mapNonEmpty!25838 (= mapRes!25838 (and tp!49574 e!475123))))

(declare-fun mapKey!25838 () (_ BitVec 32))

(declare-fun mapValue!25838 () ValueCell!7640)

(declare-fun mapRest!25838 () (Array (_ BitVec 32) ValueCell!7640))

(assert (=> mapNonEmpty!25838 (= (arr!23312 _values!688) (store mapRest!25838 mapKey!25838 mapValue!25838))))

(declare-datatypes ((tuple2!10580 0))(
  ( (tuple2!10581 (_1!5301 (_ BitVec 64)) (_2!5301 V!26593)) )
))
(declare-datatypes ((List!16440 0))(
  ( (Nil!16437) (Cons!16436 (h!17573 tuple2!10580) (t!22901 List!16440)) )
))
(declare-datatypes ((ListLongMap!9351 0))(
  ( (ListLongMap!9352 (toList!4691 List!16440)) )
))
(declare-fun call!37970 () ListLongMap!9351)

(declare-fun v!557 () V!26593)

(declare-fun b!851600 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun e!475126 () Bool)

(declare-fun call!37969 () ListLongMap!9351)

(declare-fun +!2139 (ListLongMap!9351 tuple2!10580) ListLongMap!9351)

(assert (=> b!851600 (= e!475126 (= call!37970 (+!2139 call!37969 (tuple2!10581 k0!854 v!557))))))

(declare-fun b!851601 () Bool)

(declare-fun e!475121 () Bool)

(assert (=> b!851601 (= e!475121 true)))

(declare-fun lt!383349 () tuple2!10580)

(declare-fun lt!383350 () ListLongMap!9351)

(declare-fun lt!383353 () V!26593)

(assert (=> b!851601 (= (+!2139 lt!383350 lt!383349) (+!2139 (+!2139 lt!383350 (tuple2!10581 k0!854 lt!383353)) lt!383349))))

(declare-fun lt!383354 () V!26593)

(assert (=> b!851601 (= lt!383349 (tuple2!10581 k0!854 lt!383354))))

(declare-datatypes ((Unit!29042 0))(
  ( (Unit!29043) )
))
(declare-fun lt!383346 () Unit!29042)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!269 (ListLongMap!9351 (_ BitVec 64) V!26593 V!26593) Unit!29042)

(assert (=> b!851601 (= lt!383346 (addSameAsAddTwiceSameKeyDiffValues!269 lt!383350 k0!854 lt!383353 lt!383354))))

(declare-fun lt!383352 () V!26593)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12274 (ValueCell!7640 V!26593) V!26593)

(assert (=> b!851601 (= lt!383353 (get!12274 (select (arr!23312 _values!688) from!1053) lt!383352))))

(declare-datatypes ((array!48573 0))(
  ( (array!48574 (arr!23313 (Array (_ BitVec 32) (_ BitVec 64))) (size!23754 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48573)

(declare-fun lt!383348 () ListLongMap!9351)

(assert (=> b!851601 (= lt!383348 (+!2139 lt!383350 (tuple2!10581 (select (arr!23313 _keys!868) from!1053) lt!383354)))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851601 (= lt!383354 (get!12274 (select (store (arr!23312 _values!688) i!612 (ValueCellFull!7640 v!557)) from!1053) lt!383352))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1016 (Int (_ BitVec 64)) V!26593)

(assert (=> b!851601 (= lt!383352 (dynLambda!1016 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!383347 () array!48571)

(declare-fun minValue!654 () V!26593)

(declare-fun zeroValue!654 () V!26593)

(declare-fun getCurrentListMapNoExtraKeys!2749 (array!48573 array!48571 (_ BitVec 32) (_ BitVec 32) V!26593 V!26593 (_ BitVec 32) Int) ListLongMap!9351)

(assert (=> b!851601 (= lt!383350 (getCurrentListMapNoExtraKeys!2749 _keys!868 lt!383347 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851602 () Bool)

(declare-fun e!475124 () Bool)

(assert (=> b!851602 (= e!475124 (not e!475121))))

(declare-fun res!578219 () Bool)

(assert (=> b!851602 (=> res!578219 e!475121)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851602 (= res!578219 (not (validKeyInArray!0 (select (arr!23313 _keys!868) from!1053))))))

(assert (=> b!851602 e!475126))

(declare-fun c!91987 () Bool)

(assert (=> b!851602 (= c!91987 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383345 () Unit!29042)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!354 (array!48573 array!48571 (_ BitVec 32) (_ BitVec 32) V!26593 V!26593 (_ BitVec 32) (_ BitVec 64) V!26593 (_ BitVec 32) Int) Unit!29042)

(assert (=> b!851602 (= lt!383345 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!354 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851603 () Bool)

(declare-fun res!578217 () Bool)

(declare-fun e!475119 () Bool)

(assert (=> b!851603 (=> (not res!578217) (not e!475119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48573 (_ BitVec 32)) Bool)

(assert (=> b!851603 (= res!578217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851604 () Bool)

(assert (=> b!851604 (= e!475126 (= call!37970 call!37969))))

(declare-fun b!851605 () Bool)

(declare-fun res!578214 () Bool)

(assert (=> b!851605 (=> (not res!578214) (not e!475119))))

(declare-datatypes ((List!16441 0))(
  ( (Nil!16438) (Cons!16437 (h!17574 (_ BitVec 64)) (t!22902 List!16441)) )
))
(declare-fun arrayNoDuplicates!0 (array!48573 (_ BitVec 32) List!16441) Bool)

(assert (=> b!851605 (= res!578214 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16438))))

(declare-fun res!578216 () Bool)

(assert (=> start!73276 (=> (not res!578216) (not e!475119))))

(assert (=> start!73276 (= res!578216 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23754 _keys!868))))))

(assert (=> start!73276 e!475119))

(assert (=> start!73276 tp_is_empty!16159))

(assert (=> start!73276 true))

(assert (=> start!73276 tp!49573))

(declare-fun array_inv!18546 (array!48573) Bool)

(assert (=> start!73276 (array_inv!18546 _keys!868)))

(declare-fun array_inv!18547 (array!48571) Bool)

(assert (=> start!73276 (and (array_inv!18547 _values!688) e!475125)))

(declare-fun b!851606 () Bool)

(assert (=> b!851606 (= e!475119 e!475124)))

(declare-fun res!578213 () Bool)

(assert (=> b!851606 (=> (not res!578213) (not e!475124))))

(assert (=> b!851606 (= res!578213 (= from!1053 i!612))))

(assert (=> b!851606 (= lt!383348 (getCurrentListMapNoExtraKeys!2749 _keys!868 lt!383347 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851606 (= lt!383347 (array!48572 (store (arr!23312 _values!688) i!612 (ValueCellFull!7640 v!557)) (size!23753 _values!688)))))

(declare-fun lt!383351 () ListLongMap!9351)

(assert (=> b!851606 (= lt!383351 (getCurrentListMapNoExtraKeys!2749 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851607 () Bool)

(declare-fun res!578215 () Bool)

(assert (=> b!851607 (=> (not res!578215) (not e!475119))))

(assert (=> b!851607 (= res!578215 (and (= (size!23753 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23754 _keys!868) (size!23753 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37966 () Bool)

(assert (=> bm!37966 (= call!37969 (getCurrentListMapNoExtraKeys!2749 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851608 () Bool)

(assert (=> b!851608 (= e!475120 tp_is_empty!16159)))

(declare-fun b!851609 () Bool)

(declare-fun res!578212 () Bool)

(assert (=> b!851609 (=> (not res!578212) (not e!475119))))

(assert (=> b!851609 (= res!578212 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23754 _keys!868))))))

(declare-fun b!851610 () Bool)

(declare-fun res!578220 () Bool)

(assert (=> b!851610 (=> (not res!578220) (not e!475119))))

(assert (=> b!851610 (= res!578220 (validKeyInArray!0 k0!854))))

(declare-fun bm!37967 () Bool)

(assert (=> bm!37967 (= call!37970 (getCurrentListMapNoExtraKeys!2749 _keys!868 lt!383347 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851611 () Bool)

(declare-fun res!578218 () Bool)

(assert (=> b!851611 (=> (not res!578218) (not e!475119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851611 (= res!578218 (validMask!0 mask!1196))))

(declare-fun b!851612 () Bool)

(declare-fun res!578221 () Bool)

(assert (=> b!851612 (=> (not res!578221) (not e!475119))))

(assert (=> b!851612 (= res!578221 (and (= (select (arr!23313 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73276 res!578216) b!851611))

(assert (= (and b!851611 res!578218) b!851607))

(assert (= (and b!851607 res!578215) b!851603))

(assert (= (and b!851603 res!578217) b!851605))

(assert (= (and b!851605 res!578214) b!851609))

(assert (= (and b!851609 res!578212) b!851610))

(assert (= (and b!851610 res!578220) b!851612))

(assert (= (and b!851612 res!578221) b!851606))

(assert (= (and b!851606 res!578213) b!851602))

(assert (= (and b!851602 c!91987) b!851600))

(assert (= (and b!851602 (not c!91987)) b!851604))

(assert (= (or b!851600 b!851604) bm!37967))

(assert (= (or b!851600 b!851604) bm!37966))

(assert (= (and b!851602 (not res!578219)) b!851601))

(assert (= (and b!851598 condMapEmpty!25838) mapIsEmpty!25838))

(assert (= (and b!851598 (not condMapEmpty!25838)) mapNonEmpty!25838))

(get-info :version)

(assert (= (and mapNonEmpty!25838 ((_ is ValueCellFull!7640) mapValue!25838)) b!851599))

(assert (= (and b!851598 ((_ is ValueCellFull!7640) mapDefault!25838)) b!851608))

(assert (= start!73276 b!851598))

(declare-fun b_lambda!11569 () Bool)

(assert (=> (not b_lambda!11569) (not b!851601)))

(declare-fun t!22900 () Bool)

(declare-fun tb!4317 () Bool)

(assert (=> (and start!73276 (= defaultEntry!696 defaultEntry!696) t!22900) tb!4317))

(declare-fun result!8253 () Bool)

(assert (=> tb!4317 (= result!8253 tp_is_empty!16159)))

(assert (=> b!851601 t!22900))

(declare-fun b_and!23217 () Bool)

(assert (= b_and!23215 (and (=> t!22900 result!8253) b_and!23217)))

(declare-fun m!792787 () Bool)

(assert (=> b!851610 m!792787))

(declare-fun m!792789 () Bool)

(assert (=> bm!37967 m!792789))

(declare-fun m!792791 () Bool)

(assert (=> b!851603 m!792791))

(declare-fun m!792793 () Bool)

(assert (=> b!851600 m!792793))

(declare-fun m!792795 () Bool)

(assert (=> b!851611 m!792795))

(declare-fun m!792797 () Bool)

(assert (=> start!73276 m!792797))

(declare-fun m!792799 () Bool)

(assert (=> start!73276 m!792799))

(declare-fun m!792801 () Bool)

(assert (=> b!851612 m!792801))

(declare-fun m!792803 () Bool)

(assert (=> bm!37966 m!792803))

(declare-fun m!792805 () Bool)

(assert (=> b!851601 m!792805))

(declare-fun m!792807 () Bool)

(assert (=> b!851601 m!792807))

(declare-fun m!792809 () Bool)

(assert (=> b!851601 m!792809))

(assert (=> b!851601 m!792789))

(declare-fun m!792811 () Bool)

(assert (=> b!851601 m!792811))

(assert (=> b!851601 m!792807))

(declare-fun m!792813 () Bool)

(assert (=> b!851601 m!792813))

(assert (=> b!851601 m!792813))

(declare-fun m!792815 () Bool)

(assert (=> b!851601 m!792815))

(declare-fun m!792817 () Bool)

(assert (=> b!851601 m!792817))

(declare-fun m!792819 () Bool)

(assert (=> b!851601 m!792819))

(declare-fun m!792821 () Bool)

(assert (=> b!851601 m!792821))

(assert (=> b!851601 m!792819))

(declare-fun m!792823 () Bool)

(assert (=> b!851601 m!792823))

(declare-fun m!792825 () Bool)

(assert (=> b!851601 m!792825))

(declare-fun m!792827 () Bool)

(assert (=> b!851601 m!792827))

(declare-fun m!792829 () Bool)

(assert (=> b!851606 m!792829))

(assert (=> b!851606 m!792823))

(declare-fun m!792831 () Bool)

(assert (=> b!851606 m!792831))

(declare-fun m!792833 () Bool)

(assert (=> b!851605 m!792833))

(declare-fun m!792835 () Bool)

(assert (=> mapNonEmpty!25838 m!792835))

(assert (=> b!851602 m!792825))

(assert (=> b!851602 m!792825))

(declare-fun m!792837 () Bool)

(assert (=> b!851602 m!792837))

(declare-fun m!792839 () Bool)

(assert (=> b!851602 m!792839))

(check-sat (not b!851600) (not b!851601) (not b!851610) (not b!851605) b_and!23217 (not mapNonEmpty!25838) (not b!851603) (not bm!37966) tp_is_empty!16159 (not b!851606) (not b!851602) (not bm!37967) (not b!851611) (not start!73276) (not b_next!14023) (not b_lambda!11569))
(check-sat b_and!23217 (not b_next!14023))
